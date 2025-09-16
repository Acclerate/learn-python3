import os
import re
import shutil
import datetime

# 定义源目录和目标目录
# source_dir = r'G:\收集全市定点医药机构图片2\图片列表'
# target_dir = r'G:\收集全市定点医药机构图片2\待上传'
# 定义源目录和目标目录
source_dir = r'E:\neusoft\烟台\高新区医疗机构照片'
target_dir = r'E:\neusoft\烟台\高新区医疗机构照片待上传'

# 定义日志文件路径
log_file = r'd:\privategit\github\learn-python3\samples\io\file_photo\test_output\listD.txt'

# 确保目标目录存在
if not os.path.exists(target_dir):
    os.makedirs(target_dir)

# 确保日志文件目录存在
log_dir = os.path.dirname(log_file)
if not os.path.exists(log_dir):
    os.makedirs(log_dir)

# 定义图片文件后缀
image_extensions = ['.jpg', '.jpeg', '.png', '.gif', '.bmp', '.tiff', '.webp', '.heic']

# 定义正则表达式：H或P开头，后跟纯数字，然后是图片扩展名
pattern = r'^[HP]\d+\.(jpg|jpeg|png|gif|bmp|tiff|webp|heic)$'

# 获取当前时间，用于日志
current_time = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')

# 准备日志条目
log_entries = []
log_entries.append(f"📅 日志时间：{current_time}\n")
log_entries.append("==================== 匹配结果 ===================-\n")

success_count = 0

# 遍历源目录中的文件
for filename in os.listdir(source_dir):
    # 检查文件名是否匹配正则表达式
    if re.match(pattern, filename, re.IGNORECASE):
        # 构建完整的文件路径
        source_path = os.path.join(source_dir, filename)
        target_path = os.path.join(target_dir, filename)
        
        # 检查是否是文件而不是目录
        if os.path.isfile(source_path):
            try:
                # 移动文件
                shutil.move(source_path, target_path)
                success_count += 1
                log_entry = f"移动成功: {filename}"
                print(log_entry)
                log_entries.append(f"  {success_count}. {log_entry}\n")
            except Exception as e:
                error_entry = f"移动失败: {filename}, 错误: {str(e)}"
                print(error_entry)
                log_entries.append(f"  ❌ {error_entry}\n")

# 添加总结信息
log_entries.append(f"✅ 共匹配成功 {success_count} 个文件\n")

# 将日志写入文件
try:
    with open(log_file, 'a', encoding='utf-8') as f:  # 使用 'a' 模式追加日志
        f.writelines(log_entries)
    print(f"日志已成功写入: {log_file}")
except Exception as e:
    print(f"写入日志失败: {str(e)}")
  