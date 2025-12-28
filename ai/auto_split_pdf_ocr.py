import os
import base64
import fitz  # PyMuPDF
import argparse
import glob
from openai import OpenAI
from tqdm import tqdm
from concurrent.futures import ThreadPoolExecutor

# ================= 配置区域 =================

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

# 2. 模型名称 (Qwen/Qwen2-VL-72B-Instruct 或 Qwen3)
MODEL_NAME = "Qwen/Qwen3-VL-32B-Instruct" 

# 3. SiliconFlow API 地址
BASE_URL = "https://api.siliconflow.cn/v1"

# 4. 批处理大小 (每多少页保存一次文件，建议 10-20)
BATCH_SIZE = 10

# 5. 并发数 (同时请求几页，建议 2-5)
MAX_WORKERS = 3

# ===========================================

client = OpenAI(api_key=API_KEY, base_url=BASE_URL)

def pdf_page_to_base64(doc, page_num, zoom=2.0):
    """PDF页转Base64"""
    try:
        page = doc.load_page(page_num)
        pix = page.get_pixmap(matrix=fitz.Matrix(zoom, zoom))
        img_data = pix.tobytes("png")
        base64_str = base64.b64encode(img_data).decode("utf-8")
        return f"data:image/png;base64,{base64_str}"
    except Exception as e:
        return None

def process_single_page(args):
    """单页API请求"""
    page_idx, b64_img = args
    
    system_prompt = "你是一个数学排版专家。请将图片转换为Markdown，公式使用LaTeX格式。"
    
    # 1. Prompt 层面要求模型忽略广告
    user_prompt = (
        "请识别这张图片的内容并转换为 Markdown。\n"
        "【严格要求】：\n"
        "1. **去除干扰**：忽略页眉、页脚、页码。**严禁输出**“关注公众号【考研小舟】”、“免费考研资料&无水印PDF”等水印广告内容，忽略页面角的二维码。\n"
        "2. **数学公式**：行内用 $...$，独占行用 $$...$$。\n"
        "3. **竖式/表格**：必须还原结构，使用 LaTeX array 或 Markdown 表格，禁止乱码。\n"
        "4. **纯净输出**：不要输出“好的”等废话，只输出内容。"
    )

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
            temperature=0.1,
            max_tokens=4096
        )
        content = response.choices[0].message.content
        
        # 2. 代码层面强制删除（兜底方案）
        if content:
            content = content.replace("关注公众号【考研小舟】", "")
            content = content.replace("免费考研资料&无水印PDF", "")
            # 去除可能残留的空行
            content = content.strip()

        return page_idx, content
    except Exception as e:
        return page_idx, f""

def merge_markdowns(pdf_name, output_dir, final_file):
    """合并所有分块文件"""
    print("🔄 正在合并所有分块文件...")
    # 查找所有 part 文件
    pattern = os.path.join(output_dir, f"{pdf_name}_part_*.md")
    files = sorted(glob.glob(pattern))
    
    if not files:
        print("❌ 未找到分块文件，无法合并")
        return

    with open(final_file, "w", encoding="utf-8") as outfile:
        outfile.write(f"# {pdf_name}\n\n")
        for fname in files:
            with open(fname, "r", encoding="utf-8") as infile:
                outfile.write(infile.read())
                outfile.write("\n\n") # 确保分块之间有空行
    
    print(f"🎉 最终大文件已生成: {final_file}")

def main():
    parser = argparse.ArgumentParser(description="Auto Split & OCR PDF")
    parser.add_argument("pdf_path", help="PDF文件完整路径")
    args = parser.parse_args()

    if not os.path.exists(args.pdf_path):
        print("❌ 文件不存在")
        return

    # 1. 初始化信息
    pdf_name = os.path.splitext(os.path.basename(args.pdf_path))[0]
    output_dir = os.path.join(os.path.dirname(args.pdf_path), "ocr_output")
    os.makedirs(output_dir, exist_ok=True)
    
    doc = fitz.open(args.pdf_path)
    total_pages = doc.page_count
    print(f"📘 书名: {pdf_name}")
    print(f"📄 总页数: {total_pages}")
    print(f"📦 分块大小: {BATCH_SIZE} 页/组")
    print(f"📂 临时目录: {output_dir}")
    print("-" * 40)

    # 2. 循环处理每一组
    # range(0, 300, 10) -> 0, 10, 20...
    for start_idx in range(0, total_pages, BATCH_SIZE):
        end_idx = min(start_idx + BATCH_SIZE, total_pages)
        
        # 构造分块文件名: bookname_part_0001_0010.md
        # 使用 zfill 补零，保证排序正确
        part_filename = f"{pdf_name}_part_{str(start_idx+1).zfill(4)}_{str(end_idx).zfill(4)}.md"
        part_path = os.path.join(output_dir, part_filename)

        # === 断点续传核心逻辑 ===
        if os.path.exists(part_path):
            print(f"⏩ 跳过已存在: {part_filename}")
            continue
        # =======================

        print(f"🚀 正在处理分块: 第 {start_idx+1} - {end_idx} 页...")
        
        # 准备该组的图片数据
        tasks = []
        for i in range(start_idx, end_idx):
            b64 = pdf_page_to_base64(doc, i)
            if b64:
                tasks.append((i, b64))

        # 并发执行
        batch_results = {}
        with ThreadPoolExecutor(max_workers=MAX_WORKERS) as executor:
            # 这里的 tqdm 显示的是当前这 10 页的进度
            for res in tqdm(executor.map(process_single_page, tasks), total=len(tasks), unit="page", leave=False):
                batch_results[res[0]] = res[1]

        # 写入该分块文件
        with open(part_path, "w", encoding="utf-8") as f:
            for i in range(start_idx, end_idx):
                if i in batch_results:
                    f.write(f"\n\n\n\n")
                    f.write(batch_results[i])
                    f.write("\n\n---\n\n")
        
        print(f"💾 已保存分块: {part_filename}")

    doc.close()

    # 3. 全部完成后，合并文件
    final_output_file = os.path.join(os.path.dirname(args.pdf_path), f"{pdf_name}_FULL.md")
    merge_markdowns(pdf_name, output_dir, final_output_file)

if __name__ == "__main__":
    main()