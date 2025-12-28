import os
import shutil
import glob
from modelscope.hub.snapshot_download import snapshot_download

# ================= 配置 =================
# 最终模型要存放的目录
FINAL_DIR = r"D:\ai_models\py\OCR\paddleocr_torch"

# 我们要找的源文件名 (V4)
SOURCE_FILES = {
    "det": "ch_PP-OCRv4_det_infer.pth",
    "rec": "ch_PP-OCRv4_rec_infer.pth"
}

# 我们要伪装成的目标文件名 (V5)
TARGET_FILES = {
    "det": "ch_PP-OCRv5_det_infer.pth",
    "rec": "ch_PP-OCRv5_rec_infer.pth"
}
# =======================================

def find_file_in_dir(directory, filename):
    """在目录及其子目录中递归查找文件"""
    for root, dirs, files in os.walk(directory):
        if filename in files:
            return os.path.join(root, filename)
    return None

def main():
    if not os.path.exists(FINAL_DIR):
        os.makedirs(FINAL_DIR)

    print("🚀 开始终极下载 (ModelScope Snapshot 模式)...")
    print("ℹ️  策略：下载整个 OCR 文件夹，忽略路径错误，自动搜索文件。")

    try:
        # 1. 下载：只下载包含 OCR 关键字的文件/文件夹，避免下载整个庞大的仓库
        # 使用 allow_patterns 过滤，速度更快
        print("\n⬇️  正在拉取仓库快照 (opendatalab/PDF-Extract-Kit-1.0)...")
        model_dir = snapshot_download(
            'opendatalab/PDF-Extract-Kit-1.0', 
            allow_patterns=['*OCR*', '*ocr*', '*paddleocr*'],
            cache_dir='./temp_modelscope_cache' # 临时缓存目录
        )
        print(f"✅ 快照下载完成，路径: {model_dir}")

        # 2. 搜索与复制
        print("\n🔍 正在搜索并处理模型文件...")
        
        for key, source_name in SOURCE_FILES.items():
            # 在下载的目录里找文件
            found_path = find_file_in_dir(model_dir, source_name)
            
            if found_path:
                print(f"   ✅ 找到源文件: {source_name}")
                target_name = TARGET_FILES[key]
                target_path = os.path.join(FINAL_DIR, target_name)
                
                # 复制并重命名
                shutil.copy(found_path, target_path)
                print(f"   👉 已复制并伪装为: {target_name}")
            else:
                print(f"   ❌ 警告: 在下载目录中未找到 {source_name}")
                # 尝试模糊搜索 (有时候是 V3)
                print(f"   ℹ️  尝试搜索任意 {key} 模型...")
                fallback_files = glob.glob(os.path.join(model_dir, "**", f"*{key}*infer.pth"), recursive=True)
                if fallback_files:
                    print(f"   ⚠️ 找到了替代文件: {fallback_files[0]}")
                    target_name = TARGET_FILES[key]
                    shutil.copy(fallback_files[0], os.path.join(FINAL_DIR, target_name))
                    print(f"   👉 已强制使用替代文件伪装为: {target_name}")

    except Exception as e:
        print(f"\n❌ 发生错误: {e}")
        print("💡 建议：如果还是失败，请检查网络是否能访问 modelscope.cn")

    print("\n" + "="*30)
    print("🎉 处理结束！请检查目标文件夹内容：")
    print(f"📂 {FINAL_DIR}")
    
    # 简单的文件检查
    if os.path.exists(FINAL_DIR):
        files = os.listdir(FINAL_DIR)
        print("当前文件列表:", files)

if __name__ == "__main__":
    main()