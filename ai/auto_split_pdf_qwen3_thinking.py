import os
import base64
import fitz  # PyMuPDF
import argparse
import glob
import time
import re
import io
from PIL import Image
from openai import OpenAI
from tqdm import tqdm
from concurrent.futures import ThreadPoolExecutor

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
# 注意：Qwen3-VL-235B-Thinking 的实际 API 名称可能需要确认
# 如果报错找不到模型，请尝试回退到 "Qwen/Qwen2.5-VL-72B-Instruct"
MODEL_NAME = "Qwen/Qwen3-VL-235B-A22B-Thinking" 
BASE_URL = "https://api.siliconflow.cn/v1"

# 3. 并发设置 (L0用户建议设为1，稳定第一)
MAX_WORKERS = 1 

# 4. 分块大小 (每 10 页保存一次，防止崩溃)
BATCH_SIZE = 10

# 5. 合并大小 (每 60 页合并为一个大文件)
MERGE_CHUNK_SIZE = 60

# 6. 切图微调 (向四周外扩像素)
PADDING_PIXELS = 15

# ===========================================

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
    system_prompt = "你是一个教材排版专家。智能判断转文字或切图。严禁输出任何广告。"
    user_prompt = (
        "请处理这张图片：\n"
        "1. **文本/公式** -> 转 Markdown/LaTeX。\n"
        "2. **复杂图/竖式** -> 输出切割指令 `<CUT_IMG>xmin,ymin,xmax,ymax</CUT_IMG>` (0-1000坐标)，**单独占一行**。\n"
        "3. **负面约束**：绝对禁止输出二维码、“关注公众号”等广告。"
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
            return page_idx, final_content

        except Exception as e:
            if "429" in str(e):
                time.sleep(60)
            else:
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
        
        # 判断是否需要合并
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
    # 临时工作目录
    work_dir = os.path.join(os.path.dirname(args.pdf_path), f"{pdf_name}_work_dir")
    os.makedirs(work_dir, exist_ok=True)
    
    doc = fitz.open(args.pdf_path)
    total_pages = doc.page_count
    
    print(f"🚀 启动全自动处理: {pdf_name}")
    print(f"📄 总页数: {total_pages}")
    print(f"📦 分块模式: 每 {BATCH_SIZE} 页存档一次")
    print(f"⏩ 断点续传: 开启")
    print("-" * 40)

    # === [核心逻辑] 自动循环分块检查 ===
    for batch_start in range(0, total_pages, BATCH_SIZE):
        batch_end = min(batch_start + BATCH_SIZE, total_pages)
        
        # 构造分块文件名: book_part_0001_0010.md
        part_filename = f"{pdf_name}_part_{str(batch_start+1).zfill(4)}_{str(batch_end).zfill(4)}.md"
        part_path = os.path.join(work_dir, part_filename)

        # 1. 检查文件是否存在 (断点续传)
        if os.path.exists(part_path):
            print(f"✅ [已完成] 跳过: 第 {batch_start+1}-{batch_end} 页")
            continue
        
        # 2. 如果不存在，开始处理
        print(f"⚡ [正在处理] 第 {batch_start+1}-{batch_end} 页 ...")
        
        tasks = []
        for i in range(batch_start, batch_end):
            pil_img, b64_img = get_pdf_page_data(doc, i)
            if pil_img:
                tasks.append((i, pil_img, b64_img))

        batch_results = {}
        with ThreadPoolExecutor(max_workers=MAX_WORKERS) as executor:
            for res in tqdm(executor.map(process_page_workflow, tasks), total=len(tasks), unit="page", leave=False):
                batch_results[res[0]] = res[1]
                time.sleep(1) # 保护 API

        # 3. 保存分块文件
        with open(part_path, "w", encoding="utf-8") as f:
            for i in range(batch_start, batch_end):
                if i in batch_results:
                    f.write(f"\n\n\n\n")
                    f.write(batch_results[i])
                    f.write("\n\n---\n\n")
        
        print(f"💾 已存档: {part_filename}")
        time.sleep(2) # 批次间休息

    doc.close()

    # === [核心逻辑] 最后分块合并 ===
    final_output_dir = os.path.dirname(args.pdf_path)
    merge_markdowns_by_chunk(pdf_name, work_dir, final_output_dir, pages_per_file=MERGE_CHUNK_SIZE)

if __name__ == "__main__":
    main()