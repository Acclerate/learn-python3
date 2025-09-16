# # #!/usr/bin/env python3
# # # -*- coding: utf-8 -*-
# #
# import re
# #
# # print('Test: 010-12345')
# # m = re.match(r'^(\d{3})-(\d{3,8})$', '010-12345')
# # print(m.group(1), m.group(2))
# #
# # t = '19:05:30'
# # print('Test:', t)
# # m = re.match(r'^(0[0-9]|1[0-9]|2[0-3]|[0-9])\:(0[0-9]|1[0-9]|2[0-9]|3[0-9]|4[0-9]|5[0-9]|[0-9])\:(0[0-9]|1[0-9]|2[0-9]|3[0-9]|4[0-9]|5[0-9]|[0-9])$', t)
# # print(m.groups())
# import os
# from datetime import datetime
#
# # 中文数字到阿拉伯数字的映射
# chinese_to_arabic = {
#     '一': '1', '二': '2', '三': '3', '四': '4', '五': '5',
#     '六': '6', '七': '7', '八': '8', '九': '9', '十': '10',
#     '零': '0'
# }
#
#
# def convert_chinese_to_number(s):
#     """将中文数字转换为阿拉伯数字"""
#     number = ''
#     for char in s:
#         number += chinese_to_arabic.get(char, '')
#     return number
#
#
# def rename_files(directory):
#     """遍历目录，查找并重命名符合条件的文件"""
#     for filename in os.listdir(directory):
#         if "高数基础第" in filename:
#             # 提取中文数字部分
#             match = re.search(r'第(.*?)课', filename)
#             if match:
#                 chinese_number = match.group(1)
#                 arabic_number = convert_chinese_to_number(chinese_number)
#
#                 # 构造新的文件名
#                 new_filename = filename.replace(f"第{chinese_number}课", f"第{arabic_number}课")
#
#                 # 打印模拟重命名操作
#                 print(f"将 '{filename}' 重命名为 '{new_filename}'")
#
#                 # 实际执行重命名 (注释此行即可真正执行重命名操作)
#                 # os.rename(os.path.join(directory, filename), os.path.join(directory, new_filename))
#
#
# # 指定目录路径，例如"D:\Documents\math_pdf"
# directory_path = "D:\\Documents\\math_pdf"
# rename_files(directory_path)
import re

# 原始SQL内容
sql_content = """
    INDEX `IDX_out_appy_dCERTNO`(`CERTNO`) USING BTREE,
    INDEX `idx_out_appy_d_EMP_NO`(`EMP_NO`) USING BTREE,
    INDEX `IDX_OUT_APPY_D_1`(`PSN_NO`) USING BTREE,
    INDEX `idx_out_appy_d_INSUTYPE`(`INSUTYPE`) USING BTREE
"""

# 使用正则表达式替换
sql_content = re.sub(r'INDEX\s+`(\w+)`\s*\(`(\w+)`\)\s*USING\s*BTREE,?', r'FULLTEXT INDEX \1 (\2),', sql_content, flags=re.IGNORECASE)

print(sql_content)
