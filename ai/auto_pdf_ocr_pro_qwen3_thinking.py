import os
import base64
import fitz  # PyMuPDF
import argparse
import glob
import time
import re
import io
import datetime 
from PIL import Image
from openai import OpenAI
from tqdm import tqdm
from concurrent.futures import ThreadPoolExecutor, as_completed
# ================= 核心配置区域 =================

# 1. [修改点] 从系统环境变量获取 API Key
# 你的环境变量名必须是: SiliconFlow_API_KEY
API_KEY = os.getenv("SiliconFlow_API_KEY")

# 检查 Key 是否存在
if not API_KEY:
    print("❌ 错误: 未检测到环境变量 'SiliconFlow_API_KEY'")
    print("💡 提示: 如果你刚刚添加了环境变量，请尝试重启 VS Code 或 终端窗口。")
    # 如果你不想用环境变量，也可以在这里把上面两行注释掉，直接解除下面这行的注释:
    # API_KEY = "sk-你的密钥写在这里"
    exit(1)

# 2. 模型选择
MODEL_NAME = "Qwen/Qwen3-VL-235B-A22B-Thinking" 
BASE_URL = "https://api.siliconflow.cn/v1"

# 3. 并发设置 (L0用户建议设为3-5)
MAX_WORKERS = 5

# 4. 分块大小 (每 10 页保存一次)
BATCH_SIZE = 10

# 5. 合并大小 (每 60 页合并为一个大文件)
MERGE_CHUNK_SIZE = 60

# 6. 切图微调 (向四周外扩像素)
PADDING_PIXELS = 1

# ===========================================

# 初始化客户端
try:
    client = OpenAI(api_key=API_KEY, base_url=BASE_URL)
except Exception as e:
    print(f"❌ 客户端初始化失败: {e}")
    exit(1)
client = OpenAI(api_key=API_KEY, base_url=BASE_URL)

def clean_ad_content(text):
    """强力去广告函数"""
    if not text: return ""
    ad_patterns = [
        r"关注公众号\s*【\s*考\s*研\s*小\s*舟\s*】",
        r"免费考研资料\s*&\s*无水印\s*PDF",
        r"无\s*水\s*印\s*PDF",
        r"扫\s*描\s*二\s*维\s*码",
    ]
    cleaned_text = text
    for pattern in ad_patterns:
        cleaned_text = re.sub(pattern, "", cleaned_text, flags=re.IGNORECASE)
    return cleaned_text.strip()

def get_pdf_page_data(doc, page_num, zoom=2.0):
    try:
        page = doc.load_page(page_num)
        pix = page.get_pixmap(matrix=fitz.Matrix(zoom, zoom))
        img_bytes = pix.tobytes("png")
        base64_str = base64.b64encode(img_bytes).decode("utf-8")
        full_b64 = f"data:image/png;base64,{base64_str}"
        pil_img = Image.open(io.BytesIO(img_bytes))
        return pil_img, full_b64
    except Exception as e:
        print(f"❌ 页面读取失败: {e}")
        return None, None

def perform_local_crop(content, pil_img):
    pattern = r'<CUT_IMG>(\d+),(\d+),(\d+),(\d+)</CUT_IMG>'
    
    def replace_with_cropped_image(match):
        try:
            x1_n, y1_n, x2_n, y2_n = map(int, match.groups())
            w, h = pil_img.size
            
            x1 = int(x1_n / 1000 * w)
            y1 = int(y1_n / 1000 * h)
            x2 = int(x2_n / 1000 * w)
            y2 = int(y2_n / 1000 * h)
            
            x1 = max(0, x1 - PADDING_PIXELS)
            y1 = max(0, y1 - PADDING_PIXELS)
            x2 = min(w, x2 + PADDING_PIXELS)
            y2 = min(h, y2 + PADDING_PIXELS)
            
            if x2 <= x1 + 5 or y2 <= y1 + 5: return ""

            crop_img = pil_img.crop((x1, y1, x2, y2))
            buffered = io.BytesIO()
            crop_img.save(buffered, format="PNG")
            img_b64 = base64.b64encode(buffered.getvalue()).decode('utf-8')
            return f"\n\n![Figure](data:image/png;base64,{img_b64})\n\n"
        except Exception:
            return ""

    return re.sub(pattern, replace_with_cropped_image, content)

def process_page_workflow(args):
    page_idx, pil_img, b64_img = args
    
    # 获取当前时间字符串
    def get_time(): return datetime.datetime.now().strftime("%H:%M:%S")

    # 【调试信息】打印线程启动时间
    print(f"\n[{get_time()}] 🚀 线程启动: 第 {page_idx+1} 页")

    # System Prompt：确立“Obsidian/LaTeX 排版专家”的人设
    system_prompt = "你是一个专业的教材排版与内容数字化专家。你的核心任务是完美还原文档内容，智能区分文本转换与图像保留，并确保输出格式完全兼容 Obsidian (MathJax) 渲染。"
    
    # 优化后的 User Prompt：逻辑合并 + 强化 Obsidian/MathJax 兼容性 + 物理滤网配合
    user_prompt = (
        "请对这张教材图片进行布局分析与内容转换，目标是生成完美的 Obsidian 兼容笔记，严格遵循以下六大核心指令：\n\n"
        
        "### 1. 智能分流策略 (防止切图过碎)\n"
        "- **文本优先**：绝大多数内容（包括中文解释、数学公式、数字、简单表格、行内小图标/箭头）**必须**转换为 Markdown 和 LaTeX 文本。\n"
        "- **仅大图切割**：只有遇到**无法用代码描述**的复杂图形（如函数图像、几何图、物理示意图、复杂手写笔记、竖式计算），才输出切割指令。\n"
        "- **禁止事项**：**严禁**将行内的单个字符、标点、小箭头切成图片。\n\n"
        
        "### 2. 切割指令格式\n"
        "- 输出标签：`<CUT_IMG>xmin,ymin,xmax,ymax</CUT_IMG>` (使用 [0,1000] 归一化坐标)。\n"
        "- **排版铁律**：该标签必须**独占一行**，上下保留空行，作为独立的段落存在。\n"
        "- **禁止事项**：**严禁**图文混排（即标签绝不能出现在文本行中间）。\n\n"
        "- 布局：标签必须独占一行。\n\n"
        
        "### 3. 表格与 LaTeX 规范 (Obsidian 兼容核心)\n"
        "- **表格强制**：必须使用 `\\begin{array}...\\end{array}` 环境。**严禁**使用 Markdown 表格语法（|---|）。\n"
        "- **换行符**：在 array 或 aligned 环境中，换行必须使用**双反斜杠** `\\\\` (严禁使用单反斜杠)。\n"
        "- **大括号**：集合或分段函数的大括号必须转义，写成 `\\{` 和 `\\}`。\n"
        "- **中文混排**：公式内的中文建议包裹在 `\\text{...}` 中。\n"
        "- **禁止代码块**：数学公式**严禁**使用反引号（`）包裹。错误示范：`$x$`，正确示范：$x$。\n\n"
        "- **表格**：必须使用 `\\begin{array}...\\end{array}`，禁止 Markdown 表格。\n"
        "- **转义**：大括号用 `\\{`，汉字包裹在 `\\text{}` 中。\n\n"
        "- ** 纯数字与小数 (防止乱码的关键)\n"
        "- **数字**：纯数字（如 1，2，3，4，5，6，7，8，9，0）必须用 `\\text{...}` 包裹，如 `\\text{1}`。\n"
        
        "### 4. 公式排版铁律 (解决乱码的关键)\n"
        "- **分段函数**：**必须**使用 `\\begin{cases}...\\end{cases}` 环境。**严禁**使用 `array`。\n"
        "  - 并且：整个分段函数必须包裹在 **块级公式** `$$...$$` 中，禁止使用单 `$ `。\n"
        "- **换行符**：在 cases 或 aligned 环境中，换行必须使用 `\\\\` (双反斜杠)。\n"
        "- **行内 vs 块级**：\n"
        "  - 简单的变量（如 $x$, $f(x)$）使用行内 `$`。\n"
        "  - 复杂的结构（分段函数、大型极限、积分计算、矩阵）**必须**使用块级 `$$` 独占一行。\n\n"

        "### 5. 选择题选项排版规范 (防止乱码)\n"
        "- **方案 A（推荐 - 竖排列表）**：默认将选项转换为 Markdown 列表。\n"
        "  - 正确示范：\n"
        "    - (A) $x=1$\n"
        "    - (B) $x=2$\n"
        "- **方案 B（仅当必须横排时 - 全包裹模式）**：如果必须在一行显示，必须将**整行内容**（含选项号）包裹在 `$$` 块级公式中，内部用 `\\quad` 分隔。\n"
        "  - 正确示范：$$ \\text{(A) } x=1 \\quad \\text{(B) } x=2 $$\n"
        "- **绝对禁止**：禁止将 `\\quad` 放在 `$` 外部。\n"
        "  - 错误示范：(A) $x=1$ \\quad (B) ... (这是错误的！)\n\n"
        "### 5.1. 数学公式排版铁律 (解决挤压和乱码)\n"
        "- **复杂公式块级化**：凡是包含 `\\lim` (极限)、`\\frac` (分数)、`\\int` (积分) 的算式，**必须**包裹在 `$$ ... $$` 中独占一行。\n"
        "  - 错误：题目 1.7 $\\lim_{x \\to 0} \\frac{...}{...}$ (行内显示太挤，看不清)\n"
        "  - 正确：\n"
        "    **1.7**\n"
        "    $$ \\lim_{x \\to 0^+} \\frac{1 - \\sqrt{\\cos x}}{x(1 - \\cos \\sqrt{x})} = \\text{\\underline{\\hspace{1cm}}} $$\n"
        "- **分段函数 (修复 1.10)**：**严禁**使用 `array` 环境。**必须**使用 `\\begin{cases}...\\end{cases}`，并包裹在 `$$` 中。\n"
        "  - 正确示范：\n"
        "    $$ f(x) = \\begin{cases} \\frac{1-e^{\\tan x}}{\\arcsin(x/2)}, & x > 0 \\\\ ae^{2x}, & x \\le 0 \\end{cases} $$\n\n"
        
        "### 5.2. 填空题规范\n"
        "- 题号加粗：如 **1.6**，**1.7**。\n"
        "- 填空横线：统一使用 `______` 或 `\\text{\\underline{\\hspace{1cm}}}`。\n\n"
        
        "### 6. 强力去噪与纯净输出\n"
        "- **去广告**：绝对禁止输出“关注公众号【考研小舟】”、“免费考研资料&无水印PDF”等水印。\n"
        "- **去干扰**：忽略页眉、页脚、页码、二维码。\n"
        "- **纯净输出**：只输出转换后的 Markdown 内容，不要输出“好的”、“分析如下”等任何废话。"
    )
    max_retries = 3
    for attempt in range(max_retries):
        try:
            response = client.chat.completions.create(
                model=MODEL_NAME,
                messages=[
                    {"role": "system", "content": system_prompt},
                    {
                        "role": "user",
                        "content": [
                            {"type": "text", "text": user_prompt},
                            {"type": "image_url", "image_url": {"url": b64_img}},
                        ],
                    },
                ],
                temperature=0.1, max_tokens=4096
            )
            
            raw_content = response.choices[0].message.content
            final_content = perform_local_crop(raw_content, pil_img)
            final_content = clean_ad_content(final_content)
            
            # 【调试信息】打印完成时间
            print(f"[{get_time()}] ✅ 完成: 第 {page_idx+1} 页")
            return page_idx, final_content

        except Exception as e:
            if "429" in str(e):
                # 【调试信息】打印被限流
                print(f"[{get_time()}] ⚠️ 限流 (第 {page_idx+1} 页): 休眠60秒重试...")
                time.sleep(60)
            else:
                print(f"[{get_time()}] ❌ 错误 (第 {page_idx+1} 页): {e}")
                return page_idx, f""
    return page_idx, ""

def merge_markdowns_by_chunk(pdf_name, output_dir, final_dir, pages_per_file=60):
    """分块合并函数"""
    print(f"🔄 正在按每 {pages_per_file} 页合并文件...")
    pattern = os.path.join(output_dir, f"{pdf_name}_part_*.md")
    files = sorted(glob.glob(pattern))
    
    if not files: return

    def get_range(fname):
        match = re.search(r'_part_(\d+)_(\d+)', fname)
        return (int(match.group(1)), int(match.group(2))) if match else (0, 0)

    current_batch_files = []
    current_start_page = -1
    
    for i, fname in enumerate(files):
        s, e = get_range(fname)
        if current_start_page == -1: current_start_page = s
        
        current_batch_files.append(fname)
        
        current_pages = e - current_start_page + 1
        is_last = (i == len(files) - 1)
        
        if current_pages >= pages_per_file or is_last:
            merged_filename = f"{pdf_name}_Merged_{str(current_start_page).zfill(4)}_{str(e).zfill(4)}.md"
            merged_path = os.path.join(final_dir, merged_filename)
            
            with open(merged_path, "w", encoding="utf-8") as outfile:
                outfile.write(f"# {pdf_name} (Pages {current_start_page}-{e})\n\n")
                for batch_f in current_batch_files:
                    with open(batch_f, "r", encoding="utf-8") as infile:
                        outfile.write(infile.read())
                        outfile.write("\n\n---\n\n")
            
            print(f"📦 已生成合并文件: {merged_filename}")
            current_batch_files = []
            current_start_page = -1
    print("🎉 所有分段合并完成！")

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("pdf_path", help="PDF文件路径")
    args = parser.parse_args()

    if not os.path.exists(args.pdf_path):
        print("❌ 文件不存在")
        return

    pdf_name = os.path.splitext(os.path.basename(args.pdf_path))[0]
    work_dir = os.path.join(os.path.dirname(args.pdf_path), f"{pdf_name}_work_dir")
    os.makedirs(work_dir, exist_ok=True)
    
    doc = fitz.open(args.pdf_path)
    total_pages = doc.page_count
    
    print(f"🚀 启动全自动处理: {pdf_name}")
    print(f"📄 总页数: {total_pages}")
    print(f"📦 分块模式: 每 {BATCH_SIZE} 页存档一次")
    print(f"⚡ 并发线程: {MAX_WORKERS}")
    print("-" * 40)

    for batch_start in range(0, total_pages, BATCH_SIZE):
        batch_end = min(batch_start + BATCH_SIZE, total_pages)
        part_filename = f"{pdf_name}_part_{str(batch_start+1).zfill(4)}_{str(batch_end).zfill(4)}.md"
        part_path = os.path.join(work_dir, part_filename)

        if os.path.exists(part_path):
            print(f"✅ [已完成] 跳过: 第 {batch_start+1}-{batch_end} 页")
            continue
        
        print(f"⚡ [开始批次] 第 {batch_start+1}-{batch_end} 页 ...")
        
        tasks = []
        for i in range(batch_start, batch_end):
            pil_img, b64_img = get_pdf_page_data(doc, i)
            if pil_img:
                tasks.append((i, pil_img, b64_img))

        batch_results = {}
        
        # === [核心修改] 优化的多线程进度显示 ===
        with ThreadPoolExecutor(max_workers=MAX_WORKERS) as executor:
            # 提交所有任务到线程池
            future_to_page = {executor.submit(process_page_workflow, task): task[0] for task in tasks}
            
            # 使用 tqdm.as_completed 实时显示完成进度
            # desc 参数用于显示当前批次信息
            # bar_format 优化了显示样式
            pbar = tqdm(as_completed(future_to_page), total=len(tasks), 
                       desc=f"Processing {batch_start+1}-{batch_end}", unit="page")
            
            for future in pbar:
                page_idx = future_to_page[future]
                try:
                    p_idx, content = future.result()
                    batch_results[p_idx] = content
                    # 更新进度条后的描述，显示刚完成哪一页
                    pbar.set_postfix_str(f"Done: Pg {p_idx+1}")
                except Exception as exc:
                    print(f"\n❌ Page {page_idx+1} generated an exception: {exc}")
        
        # 保存分块文件
        with open(part_path, "w", encoding="utf-8") as f:
            for i in range(batch_start, batch_end):
                if i in batch_results:
                    f.write(f"\n\n\n\n")
                    f.write(batch_results[i])
                    f.write("\n\n---\n\n")
        
        print(f"💾 已存档: {part_filename}")
        # 批次间稍微休息，防止并发太猛
        time.sleep(2)

    doc.close()

    final_output_dir = os.path.dirname(args.pdf_path)
    merge_markdowns_by_chunk(pdf_name, work_dir, final_output_dir, pages_per_file=MERGE_CHUNK_SIZE)

if __name__ == "__main__":
    main()