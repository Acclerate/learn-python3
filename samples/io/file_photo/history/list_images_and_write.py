import os

def is_image_file(filename):
    ext = filename.lower().split('.')[-1]
    return ext in ['jpg', 'jpeg', 'png', 'bmp', 'gif', 'tiff']

def list_images_and_write(base_dir, output_file):
    count = 0
    total_size = 0  # 单位：字节

    with open(output_file, 'w', encoding='utf-8') as f_out:
        for root, dirs, files in os.walk(base_dir):
            for file in files:
                if is_image_file(file):
                    full_path = os.path.join(root, file)
                    try:
                        size = os.path.getsize(full_path)
                    except Exception as e:
                        print(f"⚠️ 无法读取大小：{full_path}，错误：{e}")
                        continue
                    
                    count += 1
                    total_size += size
                    print(f"找到图片 {count}: {full_path} ({size / 1024:.2f} KB)")
                    f_out.write(full_path + '\n')

    total_size_mb = total_size / (1024 * 1024)
    print("\n==============================")
    print(f"✅ 共找到 {count} 张图片")
    print(f"📦 总大小约为 {total_size_mb:.2f} MB")
    print(f"📝 文件路径已写入：{output_file}")
    print("==============================")

if __name__ == '__main__':
    base_dir = r"G:\收集全市定点医药机构图片2\解压结果"
    output_file = r"G:\收集全市定点医药机构图片2\图片列表.txt"
    list_images_and_write(base_dir, output_file)
