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
PADDING_PIXELS = 3

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

    # 优化后的 System Prompt：确立专家人设，强调“判断”与“清洗”的双重职责
    system_prompt = (
        "你是一个专业的教材排版与内容数字化专家。你的核心任务是完美还原文档内容，"
        "智能区分文本转换与图像保留，并严格执行去广告清洗。"
    )
    
    # 优化后的 User Prompt：全 LaTeX 公式/表格 + 强制图片独占行
    # 优化后的 User Prompt：针对 Obsidian MathJax 做了语法加固
    user_prompt = (
        "请对这张教材图片进行布局分析与内容转换，严格遵循以下核心指令：\n\n"
        
        "### 1. 智能分流策略\n"
        "- **文本处理**：中文解释性文字使用 Markdown。\n"
        "- **数学与表格**：**所有**数学公式、符号、数字、表格必须使用 LaTeX 格式。\n"
        "- **复杂图形**：函数图像、几何图形、竖式计算等，**不要**转文字，直接输出切割指令。\n\n"
        
        "### 2. 切割指令格式\n"
        "- 输出标签：`<CUT_IMG>xmin,ymin,xmax,ymax</CUT_IMG>` ([0,1000] 归一化坐标)。\n"
        "- **排版铁律**：图片必须**独占一行**，作为独立的段落存在。\n"
        "- **禁止事项**：**严禁**图文混排。\n\n"
        
        "### 3. 排版与 LaTeX 规范（Obsidian 兼容性优化）\n"
        "- **公式**：行内公式用 $...$，独占行公式用 $$...$$。文段中的变量（如 $x$）、数字（如 $1$）也必须用 LaTeX。\n"
        "- **表格关键**：\n"
        "  1. 必须使用 `\\begin{array}...\\end{array}` 环境。\n"
        "  2. **换行必须使用双反斜杠** `\\\\` (严禁使用单反斜杠)。\n"
        "  3. **集合的大括号必须转义**，写成 `\\{` 和 `\\}`。\n"
        "  4. 严禁使用 Markdown 表格语法。\n\n"

        "### 4. 选择题选项规范\n"
        "- **格式要求**：遇到选择题选项（A, B, C, D），**必须**转换为 Markdown 列表格式，每个选项独占一行。\n"
        "- **禁止**：严禁使用 `\\quad`、`\\hspace` 等 LaTeX 间距命令来强行排版一行。\n"
        "- **范例**：\n"
        "  - (A) $60$\n"
        "  - (B) $63$\n"
        "  - (C) $66$\n"
        "  - (D) $69$\n\n"
        "### 5. 强力去噪\n"

        "- **去广告**：绝对禁止输出“关注公众号【考研小舟】”、“免费考研资料&无水印PDF”等水印。\n"
        "- **去干扰**：忽略页眉、页脚、页码、二维码。\n"
        "- **纯净输出**：只输出内容，不要任何废话。"
        "- **纯净输出**：只输出内容，不要任何废话。"
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