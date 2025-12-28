import os
import shutil
import subprocess
from pathlib import Path

# ================= 配置区域 =================
# 目标根目录
TARGET_ROOT = Path(r"D:\ai_models\py")
# ===========================================

def install_modelscope():
    try:
        import modelscope
    except ImportError:
        subprocess.check_call(["pip", "install", "modelscope"])

def check_and_fix_mfd_structure(mfd_dir: Path):
    """
    修复 MFD 模型路径不匹配问题
    MinerU 1.3+ 默认寻找: MFD/YOLO/yolo_v8_ft.pt
    下载的文件通常是: MFD/weights.pt
    """
    if not mfd_dir.exists():
        return

    # 1. 检查是否存在原始权重
    src_weight = mfd_dir / "weights.pt"
    if src_weight.exists():
        # 2. 创建 YOLO 子目录
        yolo_dir = mfd_dir / "YOLO"
        yolo_dir.mkdir(parents=True, exist_ok=True)
        
        # 3. 复制并重命名 (保留原文件以防万一)
        target_weight = yolo_dir / "yolo_v8_ft.pt"
        if not target_weight.exists():
            print(f"   🔧 自动修复兼容性: 复制 weights.pt -> YOLO/yolo_v8_ft.pt")
            shutil.copy2(src_weight, target_weight)
        else:
            print(f"   ✅ 兼容性文件已存在: YOLO/yolo_v8_ft.pt")

def move_folder_content_smart(src_root: Path, dest_root: Path):
    """智能查找并移动核心文件夹"""
    # 核心目标文件夹
    target_names = ["MFD", "Layout", "MVR", "ocr", "TabRec"]
    
    # 1. 确定源目录在哪里（可能在根目录，也可能在 models 子目录里）
    actual_src = src_root
    if (src_root / "models").exists() and (src_root / "models").is_dir():
        actual_src = src_root / "models"
        print(f"   🔍 发现嵌套目录，进入: {actual_src}")
    
    print(f"📂 正在从 {actual_src} 移动文件...")

    found_any = False
    for item in actual_src.iterdir():
        if item.is_dir() and item.name in target_names:
            found_any = True
            dest_path = dest_root / item.name
            
            # 清理旧的
            if dest_path.exists():
                shutil.rmtree(dest_path)
            
            # 移动
            print(f"   🚚 移动: {item.name} -> {dest_path}")
            shutil.move(str(item), str(dest_path))
            
            # 特殊处理 MFD 的结构
            if item.name == "MFD":
                check_and_fix_mfd_structure(dest_path)

    if not found_any:
        print("❌ 警告：在下载目录中未找到预期的模型文件夹 (MFD, Layout 等)")

def main():
    install_modelscope()
    from modelscope.hub.snapshot_download import snapshot_download

    if not TARGET_ROOT.exists():
        TARGET_ROOT.mkdir(parents=True, exist_ok=True)

    print(f"🚀 开始修复模型 (修正路径嵌套问题)")
    print("-" * 50)

    # 1. UniMerNet (公式模型)
    unimer_dir = TARGET_ROOT / "UniMerNet"
    if (unimer_dir / "pytorch_model.bin").exists():
        print(f"✅ UniMerNet 已就绪，跳过。")
    else:
        print(f"⬇️  下载 UniMerNet...")
        try:
            snapshot_download('wanderkid/UniMerNet', local_dir=str(unimer_dir))
        except:
            pass

    # 2. PDF-Extract-Kit (核心模型)
    # 检查修复后的文件是否存在
    final_check_file = TARGET_ROOT / "MFD" / "YOLO" / "yolo_v8_ft.pt"
    
    if final_check_file.exists():
        print(f"✅ PDF-Extract-Kit 核心文件 (yolo_v8_ft.pt) 已就绪，跳过下载。")
    else:
        print(f"⬇️  重新下载 PDF-Extract-Kit...")
        temp_dir = TARGET_ROOT / "temp_kit"
        try:
            # 下载
            snapshot_download('opendatalab/PDF-Extract-Kit', revision='master', local_dir=str(temp_dir))
            
            # 智能移动 (处理 models 子目录)
            move_folder_content_smart(temp_dir, TARGET_ROOT)
            
            # 清理
            shutil.rmtree(temp_dir)
            print("🧹 清理临时文件完成")
            
        except Exception as e:
            print(f"❌ 下载处理失败: {e}")

    print("-" * 50)
    # 最终验证
    if (TARGET_ROOT / "MFD" / "YOLO" / "yolo_v8_ft.pt").exists():
        print("🎉 完美！所有模型验证通过！")
        print("👉 请再次运行: python convert_scanned_pdfs_to_md_gpu.py ...")
    else:
        print("❌ 依然缺少文件，请检查网络或手动下载。")

if __name__ == "__main__":
    main()