import os
import zipfile
import shutil
from pathlib import Path
import logging

# 可选依赖
try:
    import rarfile
except ImportError:
    rarfile = None
try:
    import py7zr
except ImportError:
    py7zr = None

logging.basicConfig(level=logging.INFO, format='%(levelname)s: %(message)s')

# === 配置路径 ===
BASE_DIR = Path(r"G:\收集全市定点医药机构图片2")
OUTPUT_DIR = BASE_DIR / "解压结果"
ARCHIVE_EXTENSIONS = ['.zip', '.rar', '.7z']
FAILED_LOG = Path("bad_archives.txt")
FAILED_LOG.write_text('', encoding='utf-8')  # 清空旧的失败列表

# === 工具函数 ===
def is_archive(file_path: Path):
    return file_path.suffix.lower() in ARCHIVE_EXTENSIONS

def safe_decode(filename):
    try:
        return filename.encode('cp437').decode('gbk')
    except:
        return filename  # 回退原名

def extract_file(file_path: Path, target_dir: Path):
    logging.info(f"正在解压：{file_path}")
    try:
        if file_path.suffix.lower() == '.zip':
            with zipfile.ZipFile(file_path, 'r') as zf:
                for member in zf.infolist():
                    member_name = safe_decode(member.filename)
                    target_path = target_dir / member_name
                    if member.is_dir():
                        target_path.mkdir(parents=True, exist_ok=True)
                    else:
                        target_path.parent.mkdir(parents=True, exist_ok=True)
                        with zf.open(member) as source, open(target_path, "wb") as target:
                            shutil.copyfileobj(source, target)

        elif file_path.suffix.lower() == '.rar' and rarfile:
            with rarfile.RarFile(file_path) as rf:
                for member in rf.infolist():
                    member_name = safe_decode(member.filename)
                    target_path = target_dir / member_name
                    if member.isdir():
                        target_path.mkdir(parents=True, exist_ok=True)
                    else:
                        target_path.parent.mkdir(parents=True, exist_ok=True)
                        with rf.open(member) as source, open(target_path, "wb") as target:
                            shutil.copyfileobj(source, target)

        elif file_path.suffix.lower() == '.7z' and py7zr:
            with py7zr.SevenZipFile(file_path, mode='r') as z:
                z.extractall(path=target_dir)

        else:
            logging.warning(f"❗ 不支持的压缩格式或缺少依赖：{file_path}")
            return False

        return True

    except Exception as e:
        logging.error(f"❌ 解压失败：{file_path}，原因：{e}")
        with open(FAILED_LOG, "a", encoding="utf-8") as f:
            f.write(str(file_path) + "\n")
        return False

def recursive_extract(start_dir: Path, output_base: Path):
    for root, _, files in os.walk(start_dir):
        for file in files:
            filepath = Path(root) / file
            if is_archive(filepath):
                # 只用文件名（无扩展名）作为解压目录，避免多层嵌套
                extract_dir = output_base / filepath.stem
                extract_dir.mkdir(parents=True, exist_ok=True)

                if extract_file(filepath, extract_dir):
                    recursive_extract(extract_dir, output_base)

# === 主程序入口 ===
if __name__ == "__main__":
    OUTPUT_DIR.mkdir(parents=True, exist_ok=True)
    recursive_extract(BASE_DIR, OUTPUT_DIR)

    # 显示失败列表
    if FAILED_LOG.exists() and FAILED_LOG.stat().st_size > 0:
        print("\n❌ 解压失败的文件（已记录到 bad_archives.txt）：")
        with open(FAILED_LOG, encoding='utf-8') as f:
            print(f.read())
    else:
        print("\n✅ 所有文件解压成功。")
