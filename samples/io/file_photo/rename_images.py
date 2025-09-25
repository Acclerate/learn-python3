import os
import re
from datetime import datetime

def fix_duplicate_extension(filename):
    """递归修复类似 .jpg.jpg -> .jpg 的扩展重复问题"""
    while True:
        base, ext = os.path.splitext(filename)
        # 移除扩展名中的非字母数字字符
        ext = re.sub(r'[^a-zA-Z0-9.]', '', ext)
        # 确保扩展名是小写的jpg格式
        if ext.lower() in ('.jpg', '.jpeg'):
            ext = '.jpg'
        base2, ext2 = os.path.splitext(base)
        if ext2.lower() == ext.lower() and ext:
            filename = base2 + ext
        else:
            # 处理多个连续点的情况
            filename = re.sub(r'\.{2,}', '.', filename)
            return filename

def process_filename(filename):
    # 去除首尾空格，并处理文件名中的多余空格
    filename = filename.strip()

    # 修复末尾多空格或错误扩展名断开问题
    # 先暴力合并末尾如果形如 ".jpg.jpg" 的
    filename = re.sub(r'\s*\.\s*', '.', filename)

    # 找到最后一个点的位置
    last_dot_index = filename.rfind('.')
    if last_dot_index > 0:
        # 保留最后一个点，将前面的所有点替换为下划线
        filename = filename[:last_dot_index].replace('.', '_') + filename[last_dot_index:]

    name, ext = os.path.splitext(filename)

    # 1. 移除 name 中所有空格
    name = re.sub(r'\s+', '', name)

    # 2. 替换 -, --, _, （）, ( ) 为 _
    # 移除 + 量词以匹配单个字符，并添加全角破折号
    name = re.sub(r'[-－_()（）]', '_', name)

    # 2.5 确保P和H大写（包括开头的p和h）
    name = name.replace('p', 'P').replace('h', 'H')

    # 3. 合并多个 _
    name = re.sub(r'_+', '_', name)

    # 4. 移除最后一个 _ 到最后一个 . 之间的所有 0，保留其他数字和字母
    # 匹配最后一个下划线(包括全角和半角)到字符串末尾的所有非点字符
    name = re.sub(r'[_＿]([^.]*)$', lambda m: '_' + re.sub(r'[0]', '', m.group(1)), name)

    # 5. 去除首尾 _
    name = name.strip('_')

    # 5.5 去除后缀前多余的 _数字 (处理数字_数字模式)
    # 匹配以"_数字_数字"结尾的模式，保留第一个"_数字"部分
    name = re.sub(r'(_\d+)_\d+$', r'\1', name)

    # 6. 拼接扩展名并处理重复扩展名
    # 确保扩展名格式正确
    if ext.lower() in ('.jpg', '.jpeg'):
        ext = '.jpg'
    # 确保没有多余的字符在扩展名前
    name = re.sub(r'_jPg$|_jpg$', '', name)
    return fix_duplicate_extension(name + ext.lower())



def rename_images_in_directory(image_directory, log_file_path=r'D:\privategit\github\learn-python3\samples\io\file_photo\test_output\listB.txt'):
    image_extensions = ('.jpg', '.jpeg', '.png', '.gif', '.bmp', '.tiff', '.webp')

    if not os.path.exists(image_directory):
        print(f"❌ 指定的图片目录不存在：{image_directory}")
        return

    os.makedirs(os.path.dirname(log_file_path), exist_ok=True)

    with open(log_file_path, 'w', encoding='utf-8') as log_file:
        def log(msg):
            print(msg)
            log_file.write(msg + '\n')

        log(f"📅 日志时间：{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
        log(f"📂 扫描目录：{image_directory}")
        log("-" * 60)

        renamed_count = 0
        total_count = 0

        for root, dirs, files in os.walk(image_directory):
            for filename in files:
                if not filename.lower().endswith(image_extensions):
                    continue

                total_count += 1
                new_filename = process_filename(filename)
                if not new_filename:
                    log(f"⚠️ 跳过空文件名处理：{filename}")
                    continue

                if new_filename != filename:
                    old_path = os.path.join(root, filename)
                    new_path = os.path.join(root, new_filename)

                    try:
                        os.rename(old_path, new_path)
                        renamed_count += 1
                        log(f"✅ 重命名: {filename} -> {new_filename}")
                    except Exception as e:
                        # 检查是否为文件已存在错误
                        if hasattr(e, 'winerror') and e.winerror == 183:
                            try:
                                # 删除已存在的文件
                                os.remove(new_path)
                                # 再次尝试重命名
                                os.rename(old_path, new_path)
                                renamed_count += 1
                                log(f"✅ 已删除冲突文件并完成重命名: {filename} -> {new_filename}")
                            except Exception as e2:
                                log(f"❌ 删除冲突文件后重命名仍失败: {filename} -> {new_filename}, 错误: {e2}")
                        else:
                            log(f"❌ 重命名失败: {filename} -> {new_filename}, 错误: {e}")

        log("-" * 60)
        log(f"📊 总文件数：{total_count}")
        log(f"🎉 图片重命名完成，共重命名 {renamed_count} 个文件！")

if __name__ == "__main__":
    # 默认使用原有的目录路径
    # default_directory = r'G:\收集全市定点医药机构图片2\图片列表'
    # default_directory = r'E:\neusoft\烟台\高新区医疗机构照片待上传'
    # default_directory = r'E:\neusoft\烟台\龙口定点医药机构照片待上传20250915'
    # default_directory = r'E:\neusoft\烟台\机构图片上传\牟平区未上传成功照片待上传20250915'
    # default_directory = r'E:\neusoft\烟台\机构图片上传\莱州市未上传成功照片待重新上传20250917'
    default_directory = r'E:\neusoft\烟台\机构图片上传\20250919莱阳医药机构照片待上传'
    rename_images_in_directory(default_directory)
