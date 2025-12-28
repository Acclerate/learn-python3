import os
import shutil
import glob
from modelscope.hub.file_download import model_file_download

# ================= 配置 =================
# 目标目录
TARGET_DIR = r"D:\ai_models\py\OCR\paddleocr_torch"
# 目标文件名 (报错缺少的那个文件)
TARGET_FILENAME = "ch_PP-OCRv4_rec_server_doc_infer.pth"
# 缓存目录 (之前的下载残留)
CACHE_ROOT = "./temp_modelscope_cache"
# =======================================

def main():
    print(f"🚑 正在寻找: {TARGET_FILENAME}")
    
    if not os.path.exists(TARGET_DIR):
        os.makedirs(TARGET_DIR)

    # 1. 尝试从本地缓存捞取 (最快)
    print("   🔍 正在扫描本地缓存...")
    search_pattern = os.path.join(CACHE_ROOT, "**", TARGET_FILENAME)
    found_files = glob.glob(search_pattern, recursive=True)
    
    if found_files:
        src_path = found_files[0]
        dst_path = os.path.join(TARGET_DIR, TARGET_FILENAME)
        print(f"   ✅ 在缓存中找到文件！\n      源: {src_path}")
        shutil.copy(src_path, dst_path)
        print(f"   🎉 已复制到: {dst_path}")
        return

    # 2. 如果缓存没了，重新下载 (备选)
    print("   ❌ 缓存中未找到，开始重新下载 (约 96MB)...")
    try:
        model_path = model_file_download(
            model_id='opendatalab/PDF-Extract-Kit-1.0', 
            file_path=f'models/OCR/paddleocr_torch/{TARGET_FILENAME}'
        )
        dst_path = os.path.join(TARGET_DIR, TARGET_FILENAME)
        shutil.copy(model_path, dst_path)
        print(f"   ✅ 下载并安装成功: {dst_path}")
    except Exception as e:
        print(f"   ❌ 下载失败: {e}")

if __name__ == "__main__":
    main()