import os
import shutil

def is_image_file(filename):
    ext = filename.lower().split('.')[-1]
    return ext in ['jpg', 'jpeg', 'png', 'bmp', 'gif', 'tiff']

def list_images_and_copy(base_dir, output_file, copy_dir, log_file_path):
    count = 0
    total_size = 0  # 字节

    if not os.path.exists(copy_dir):
        os.makedirs(copy_dir)

    def log(msg):
        print(msg)
        with open(log_file_path, 'a', encoding='utf-8') as log_file:
            log_file.write(msg + '\n')

    # 清空日志文件
    open(log_file_path, 'w').close()

    with open(output_file, 'w', encoding='utf-8') as f_out:
        for root, dirs, files in os.walk(base_dir):
            for file in files:
                if is_image_file(file):
                    full_path = os.path.join(root, file)
                    try:
                        size = os.path.getsize(full_path)
                    except Exception as e:
                        log(f"⚠️ 无法读取大小：{full_path}，错误：{e}")
                        continue

                    count += 1
                    total_size += size
                    log(f"找到图片 {count}: {full_path} ({size / 1024:.2f} KB)")
                    f_out.write(full_path + '\n')

                    # 复制图片
                    try:
                        target_path = os.path.join(copy_dir, file)
                        shutil.copy2(full_path, target_path)
                    except Exception as e:
                        log(f"❌ 复制失败：{full_path} -> {target_path}，错误：{e}")

    total_size_mb = total_size / (1024 * 1024)
    log("\n==============================")
    log(f"✅ 共找到 {count} 张图片")
    log(f"📦 总大小约为 {total_size_mb:.2f} MB")
    log(f"📝 文件路径已写入：{output_file}")
    log(f"📁 所有图片已复制到：{copy_dir}")
    log("==============================")

if __name__ == '__main__':
    base_dir = r"G:\收集全市定点医药机构图片2\解压结果"
    output_file = r"G:\收集全市定点医药机构图片2\图片列表.txt"
    copy_dir = r"G:\收集全市定点医药机构图片2\图片列表"
    log_file_path = r"D:\privategit\github\learn-python3\samples\io\file_photo\test_output\list.txt"
    list_images_and_copy(base_dir, output_file, copy_dir, log_file_path)
