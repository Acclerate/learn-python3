import os
import re

folder_path = r"D:\math_ppt_pdf\math_ppt_pdf_copy"  # 替换为实际的文件夹路径

# 中文数字对应的阿拉伯数字
number_mapping = {
    '一': 1,
    '二': 2,
    '三': 3,
    '四': 4,
    '五': 5,
    '六': 6,
    '七': 7,
    '八': 8,
    '九': 9,
    '零': 0
}

def chinese_to_arabic(chinese_number):
    if chinese_number == '十':
        return 10
    elif '十' in chinese_number:
        parts = chinese_number.split('十')
        # 处理十的前后为空的情况
        tens = number_mapping[parts[0]] if parts[0] else 1
        units = number_mapping[parts[1]] if len(parts) > 1 and parts[1] else 0
        return tens * 10 + units
    else:
        result = 0
        for char in chinese_number:
            result = result * 10 + number_mapping[char]
        return result

# 遍历文件夹中的所有文件
for filename in os.listdir(folder_path):
    if filename.endswith(".pdf"):  # 只处理PDF文件
        file_path = os.path.join(folder_path, filename)

        # 提取文件名中的中文数字部分
        match = re.search(r'第([一二三四五六七八九十]+)课', filename)

        if match:
            chinese_number = match.group(1)

            # 将中文数字转换为阿拉伯数字的小写
            arabic_number = chinese_to_arabic(chinese_number)

            # 构建新的文件名
            new_filename = f"{arabic_number}.{filename}"

            # 重命名文件
            new_file_path = os.path.join(folder_path, new_filename)
            os.rename(file_path, new_file_path)