import pandas as pd


# 从Excel文件读取映射
def fetch_replacement_map_from_excel(excel_path, sheet_name):
    replacement_map = {}
    # 读取Excel文件中特定的Sheet
    data = pd.read_excel(excel_path, sheet_name=sheet_name)

    # 生成映射字典
    for _, row in data.iterrows():
        old_name = row['原烟台公有项目空间表名']
        new_name = row['现烟台公有项目空间表名']
        replacement_map[old_name] = new_name
    return replacement_map


# 替换SQL脚本文件中的内容
def replace_sql_contents(sql_file_path, replacement_map):
    # 读取SQL文件的现有内容
    with open(sql_file_path, 'r', encoding='utf-8') as file:
        sql_contents = file.read()

    # 替换里面所有引用了旧表名的部分
    for old_name, new_name in replacement_map.items():
        sql_contents = sql_contents.replace(old_name, new_name)
        sql_contents = sql_contents.replace('.pt', '.pt_day')

    # 写回到原文件，或选择一个新文件
    with open(sql_file_path, 'w', encoding='utf-8') as file:
        file.write(sql_contents)


if __name__ == '__main__':
    # Excel文件路径
    excel_path = r'D:\Documents\WeChat Files\wxid_lsootbrkhf4x22\FileStorage\File\2024-04\2024-04.28烟台增量表视图调整对应关系.xlsx'  # 替换成你的Excel文件路径
    # Excel Sheet名称
    sheet_name = 'Sheet1'  # 你存储映射信息的Sheet名
    # 从Excel获取映射
    replacement_map = fetch_replacement_map_from_excel(excel_path, sheet_name)

    # SQL脚本文件路径
    # sql_file_path = r'D:\privategit\learn-python3\samples\basic\sql\STG_SD_YT_FEE_LIST_D.sql'
    sql_file_path = r'D:\privategit\learn-python3\samples\basic\sql\STG_SD_YT_OPSP_REG_D.sql'
    # 替换SQL内容
    replace_sql_contents(sql_file_path, replacement_map)

    print('替换完成！')