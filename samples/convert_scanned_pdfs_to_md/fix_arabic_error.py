import os
import shutil
import glob

# ================= 配置 =================
# 1. 缓存目录（刚才下载的地方）
CACHE_ROOT = "./temp_modelscope_cache"
# 2. 目标目录
TARGET_DIR = r"D:\ai_models\py\OCR\paddleocr_torch"
# =======================================

def fix_model():
    print("🚑 开始修正模型文件 (替换阿拉伯语模型)...")
    
    # 1. 在缓存里寻找真正的中文 V5 模型
    # 路径通常是: temp_.../opendatalab/PDF-Extract-Kit-1___0/models/OCR/paddleocr_torch/ch_PP-OCRv5_rec_infer.pth
    search_pattern = os.path.join(CACHE_ROOT, "**", "ch_PP-OCRv5_rec_infer.pth")
    found_files = glob.glob(search_pattern, recursive=True)
    
    if not found_files:
        print("❌ 致命错误：在缓存里没找到 'ch_PP-OCRv5_rec_infer.pth'")
        print("请检查 temp_modelscope_cache 文件夹是否被删除。")
        return

    correct_src = found_files[0]
    print(f"✅ 在缓存中找到了正确文件:\n   {correct_src}")
    
    # 2. 覆盖目标文件
    target_path = os.path.join(TARGET_DIR, "ch_PP-OCRv5_rec_infer.pth")
    
    try:
        shutil.copy(correct_src, target_path)
        print("-" * 30)
        print(f"✅ 成功覆盖！\n   目标: {target_path}")
        print("🎉 现在的模型是真正的中文 V5 模型了！")
    except Exception as e:
        print(f"❌ 复制失败: {e}")

if __name__ == "__main__":
    fix_model()