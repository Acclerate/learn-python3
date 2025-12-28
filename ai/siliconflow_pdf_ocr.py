import os
import base64
import fitz  # PyMuPDF
import argparse
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
# 2. 指定模型名称
# 如果 SiliconFlow 确实上线了 "Qwen3-VL-32B-Instruct"，请直接填入
# MODEL_NAME = "Qwen/Qwen3-VL-32B-Instruct" 
MODEL_NAME = "Qwen/Qwen3-VL-32B-Instruct" 

# 3. SiliconFlow API 地址
BASE_URL = "https://api.siliconflow.cn/v1"

# 4. 并发数
MAX_WORKERS = 2 

# ===========================================

client = OpenAI(api_key=API_KEY, base_url=BASE_URL)

def pdf_page_to_base64(doc, page_num, zoom=2.0):
    """将PDF页面转为Base64图片"""
    try:
        page = doc.load_page(page_num)
        pix = page.get_pixmap(matrix=fitz.Matrix(zoom, zoom))
        img_data = pix.tobytes("png")
        base64_str = base64.b64encode(img_data).decode("utf-8")
        return f"data:image/png;base64,{base64_str}"
    except Exception as e:
        return None

def process_page(args):
    """单页处理逻辑"""
    page_idx, b64_img, model_name = args
    
    system_prompt = "你是一个数学排版专家。请将图片转换为Markdown，公式使用LaTeX格式。"
    user_prompt = (
        "请识别这张图片的内容并转换为 Markdown。\n"
        "要求：\n"
        "1. **数学公式**：行内用 $...$，独占行用 $$...$$。\n"
        "2. **竖式/表格**：必须还原结构，使用 LaTeX array 或 Markdown 表格，禁止乱码。\n"
        "3. **纯净输出**：不要输出“好的”等废话，只输出内容。"
    )

    try:
        response = client.chat.completions.create(
            model=model_name,
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
        return page_idx, response.choices[0].message.content
    except Exception as e:
        return page_idx, f""

def main():
    parser = argparse.ArgumentParser(description="PDF Range Extractor & OCR")
    parser.add_argument("pdf_path", help="PDF文件完整路径")
    parser.add_argument("--limit", type=str, required=True, help="页码范围 (如 10-15)")
    parser.add_argument("--model", type=str, default=MODEL_NAME, help="模型名称")
    parser.add_argument("--key", type=str, default=API_KEY, help="API Key")
    
    args = parser.parse_args()
    
    # 更新全局配置
    global client
    if args.key != API_KEY:
        client = OpenAI(api_key=args.key, base_url=BASE_URL)

    if not os.path.exists(args.pdf_path):
        print(f"❌ 找不到文件: {args.pdf_path}")
        return

    # 解析页码 (用户输入 10-15，对应索引 9-14)
    if '-' in args.limit:
        start_u, end_u = map(int, args.limit.split('-'))
        start_idx = start_u - 1
        end_idx = end_u
    else:
        print("❌ 请使用格式: --limit 10-15")
        return

    base_name = os.path.splitext(os.path.basename(args.pdf_path))[0]
    out_file = f"{base_name}_pages_{args.limit}.md"

    print(f"🚀 正在处理: {os.path.basename(args.pdf_path)}")
    print(f"📄 截取范围: 第 {start_u} 页 至 第 {end_u} 页")
    print(f"🤖 使用模型: {args.model}")

    doc = fitz.open(args.pdf_path)
    
    # 准备任务
    tasks = []
    for i in range(start_idx, end_idx):
        if i < doc.page_count:
            b64 = pdf_page_to_base64(doc, i)
            if b64:
                tasks.append((i, b64, args.model))
    
    # 并发执行
    results = {}
    with ThreadPoolExecutor(max_workers=MAX_WORKERS) as executor:
        for res in tqdm(executor.map(process_page, tasks), total=len(tasks), unit="page"):
            results[res[0]] = res[1]

    doc.close()

    # 保存
    with open(out_file, "w", encoding="utf-8") as f:
        f.write(f"# {base_name} (Pages {args.limit})\n\n")
        for i in range(start_idx, end_idx):
            if i in results:
                f.write(f"\n\n\n\n")
                f.write(results[i])
                f.write("\n\n---\n\n")

    print(f"✅ 完成！结果已保存至: {out_file}")

if __name__ == "__main__":
    main()