import re
import pandas as pd

# SQL文件路径及读取
# sql_file_path = r'D:\privategit\learn-python3\samples\basic\sql\MDTRT_D (就诊信息表).sql'
# sql_file_path = r'D:\privategit\learn-python3\samples\basic\sql\stg_sd_yt_setl_d.sql'
sql_file_path = r'D:\privategit\learn-python3\samples\basic\sql\STG_SD_YT_SETL_DIAG_LIST_D.sql'
encoding = 'utf-8-sig'

with open(sql_file_path, 'r', encoding=encoding) as file:
    sql_text = file.read()

# 修改正则表达式以匹配并剔除表名前缀 pub_ytai_data.
table_pattern = re.compile(r'(?:from|join)\s+pub_ytai_data\.(\S+)', re.IGNORECASE)
unique_tables = list(set(table_pattern.findall(sql_text)))

# Excel文件路径及读取
file_path = r'D:\neusoft\烟台\2024年4月原始层差异比较.xlsx'
sheet_name = r'2024年4月3日'
df = pd.read_excel(file_path, sheet_name=sheet_name)

tablename_column = 'tablename'
recordcount_column = 'pub'

# 遍历提取出的所有唯一表名并在Excel中查找相应记录数
for target_tablename in unique_tables:
    target_tablename_lower = target_tablename.lower()

    # 查找并显示目标表名对应的recordcount   
    matches = df[df[tablename_column].str.lower() == target_tablename_lower]
    result_recordcounts = matches[recordcount_column]

    if not result_recordcounts.empty:
        for recordcount in result_recordcounts:
            print(f"表 {target_tablename} 的记录数: {recordcount}")
    else:
        print(f"表 {target_tablename} 在Excel中没有找到对应的记录数.")