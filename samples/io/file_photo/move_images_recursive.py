import os
import re
import shutil
import datetime

# 定义源目录和目标目录
# source_dir = r'E:\neusoft\烟台\高新区医疗机构照片'
# target_dir = r'E:\neusoft\烟台\高新区医疗机构照片待上传'

# source_dir = r'E:\neusoft\烟台\龙口定点医药机构门头照片'
# target_dir = r'E:\neusoft\烟台\龙口定点医药机构照片待上传20250915'
source_dir = r'E:\neusoft\烟台\机构图片上传\牟平区未上传成功照片20250915'
target_dir = r'E:\neusoft\烟台\机构图片上传\牟平区未上传成功照片待上传20250915'

# 定义日志文件路径
log_file = r'd:\privategit\github\learn-python3\samples\io\file_photo\test_output\listD_recursive.txt'

# 确保目标目录存在
if not os.path.exists(target_dir):
    os.makedirs(target_dir)

# 确保日志文件目录存在
log_dir = os.path.dirname(log_file)
if not os.path.exists(log_dir):
    os.makedirs(log_dir)

# 定义图片文件后缀
image_extensions = ['.jpg', '.jpeg', '.png', '.gif', '.bmp', '.tiff', '.webp', '.heic']

# 定义正则表达式：H或P开头(支持大小写)，后跟数字，可能有额外字符，然后是图片扩展名
# 更新后的模式：匹配更多实际的文件名格式
pattern = r'^[HPhp]\d+[\-_]?\d*\.(jpg|jpeg|png|gif|bmp|tiff|webp|heic)(\.jpg)?$'

# 获取当前时间，用于日志
current_time = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')

# 准备日志条目
log_entries = []
log_entries.append(f"📅 日志时间：{current_time}\n")
log_entries.append("==================== 匹配结果 ===================-\n")
log_entries.append(f"🔍 源目录：{source_dir}\n")
log_entries.append(f"🎯 目标目录：{target_dir}\n")
log_entries.append(f"🔧 使用的正则表达式：{pattern}\n")

# 检查源目录是否存在
if not os.path.exists(source_dir):
    log_entries.append(f"❌ 错误：源目录 '{source_dir}' 不存在！\n")
    print(f"错误：源目录 '{source_dir}' 不存在！")

success_count = 0
all_files_count = 0
non_matching_files = []

# 递归遍历源目录中的所有文件
if os.path.exists(source_dir):
    log_entries.append("\n📋 源目录中的所有文件：\n")
    for root, dirs, files in os.walk(source_dir):
        for filename in files:
            all_files_count += 1
            # 构建完整的文件路径
            source_path = os.path.join(root, filename)
            
            # 记录所有找到的文件
            if all_files_count <= 50:  # 只记录前50个文件，避免日志过大
                log_entries.append(f"  - {filename} (位于: {os.path.basename(root)})\n")
            elif all_files_count == 51:
                log_entries.append("  ... 更多文件未显示 ...\n")
            
            # 检查文件名是否匹配正则表达式
            if re.match(pattern, filename, re.IGNORECASE):
                target_path = os.path.join(target_dir, filename)
                
                # 检查是否是文件而不是目录
                if os.path.isfile(source_path):
                    try:
                        # 移动文件
                        shutil.move(source_path, target_path)
                        success_count += 1
                        log_entry = f"移动成功: {filename} (来自目录: {os.path.basename(root)})"
                        print(log_entry)
                        log_entries.append(f"  {success_count}. {log_entry}\n")
                    except Exception as e:
                        error_entry = f"移动失败: {filename}, 错误: {str(e)}"
                        print(error_entry)
                        log_entries.append(f"  ❌ {error_entry}\n")
            else:
                if len(non_matching_files) < 10:  # 只记录前10个不匹配的文件
                    non_matching_files.append(filename)

# 添加总结信息
log_entries.append(f"\n📊 总结：\n")
log_entries.append(f"✅ 共匹配成功 {success_count} 个文件\n")
log_entries.append(f"📁 源目录中总共有 {all_files_count} 个文件\n")

if non_matching_files:
    log_entries.append(f"\n❓ 部分不匹配的文件名示例：\n")
    for filename in non_matching_files:
        log_entries.append(f"  - {filename}\n")
    log_entries.append("\n💡 提示：如果需要匹配这些文件名，请调整正则表达式模式。\n")
    log_entries.append("   当前使用的模式已经更新，可以匹配常见的格式如H37068100412-01.jpg.jpg\n")

# 将日志写入文件
try:
    with open(log_file, 'a', encoding='utf-8') as f:  # 使用 'a' 模式追加日志
        f.writelines(log_entries)
    print(f"日志已成功写入: {log_file}")
except Exception as e:
    print(f"写入日志失败: {str(e)}")