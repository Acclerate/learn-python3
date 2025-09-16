
import pandas as pd
import re
from collections import Counter


def print_non_empty_cells_cleaned_lowercase(filepath, sheet_name):
    # 读取特定sheet
    data = pd.read_excel(filepath, sheet_name=sheet_name)
    content_frequency = Counter()

    # 函数来去除非ASCII字符（如中文）、圆括号及其内容，并转为小写
    def clean_and_lowercase(text):
        # 去除中文字符
        text_no_chinese = re.sub(r'[^\x00-\x7F]+', '', text)
        # 去除圆括号及其内部的内容
        text_no_parentheses = re.sub(r'\(.*?\)', '', text_no_chinese)
        # 转换为小写
        return text_no_parentheses.lower().strip()

    # 获取行数和列数
    nrows, ncols = data.shape

    # 逐行逐列打印非空单元格内容，并进行清洗和转换为小写
    print(f"Contents of non-empty cells cleaned and converted to lowercase in sheet '{sheet_name}':")
    for row in range(nrows):
        for col in range(ncols):
            # 通过iloc获取单元格内容
            cell_content = data.iloc[row, col]
            # 检查单元格内容是否为空
            if pd.notnull(cell_content):
                # 清洗并转为小写
                cleaned_content = clean_and_lowercase(str(cell_content))
                content_frequency[cleaned_content] += 1
                # print(f"Row {row + 1}, Col {col + 1}: {cleaned_content}")
                # print(f" {cleaned_content}")
    for content, count in content_frequency.most_common():
        print(f'" {count} {content}"')


def find_tables_starting_with_fct(filepath, sheet_name):
    # 读取特定sheet
    data = pd.read_excel(filepath, sheet_name=sheet_name)

    # 存储开始为 "fct" 的表名
    fct_tables = []

    # 获取行数和列数
    nrows, ncols = data.shape

    # 遍历所有单元格来寻找以 "fct" 开头的内容
    for row in range(nrows):
        for col in range(ncols):
            # 通过iloc获取单元格内容
            cell_content = data.iloc[row, col]

            # 检查单元格内容是否以 "fct" 开头
            # if pd.notnull(cell_content) and str(cell_content).lower().strip().startswith('fct'):
            #     fct_tables.append(str(cell_content).lower())

            # 检查单元格内容是否不以 "fct" 开头
            if pd.notnull(cell_content) and not str(cell_content).lower().strip().startswith('fct'):
                fct_tables.append(str(cell_content).lower())

    # 返回所有找到的以 "fct" 开头的表名
    return set(fct_tables)  # 使用set来去除重复的项

if __name__ == '__main__':
    excel_path = r'D:\neusoft\烟台\三大屏过程表 - 汇总.xlsx'
    Sheet1 = 'Sheet1'
    # print_non_empty_cells_cleaned_lowercase(excel_path, Sheet1)
    fct_tables = find_tables_starting_with_fct(excel_path, Sheet1)
    print("Tables starting with 'fct':")
    for table in fct_tables:
        print(table)