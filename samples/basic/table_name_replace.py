import mysql.connector


# 连接数据库并查询映射
def fetch_replacement_map(db_config, table_name):
    replacement_map = {}
    try:
        conn = mysql.connector.connect(**db_config)
        cursor = conn.cursor()
        cursor.execute(f"SELECT `原烟台公有项目空间表名`, `现烟台公有项目空间表名` FROM `{table_name}`")
        replacement_map = {old_name: new_name for old_name, new_name in cursor}
    except mysql.connector.Error as e:
        print(f"Error: {e}")
    finally:
        if conn.is_connected():
            cursor.close()
            conn.close()
    return replacement_map


# 替换SQL脚本文件中的内容
def replace_sql_contents(sql_file_path, replacement_map):
    with open(sql_file_path, 'r', encoding='utf-8') as file:
        sql_contents = file.read()

    # 替换所有出现的旧表名
    for old_name, new_name in replacement_map.items():
        sql_contents = sql_contents.replace(old_name, new_name)

    # 写回到原文件或者输出到新文件
    with open(sql_file_path, 'w', encoding='utf-8') as file:
        file.write(sql_contents)


# 数据库配置
db_config = {
    'user': 'root',
    'password': 'root',
    'host': 'localhost',
    'database': 'demo',
    'raise_on_warnings': True,
}

# 获取到映射
replacement_map = fetch_replacement_map(db_config, 'stg_dynamic_table')
# SQL脚本文件路径
sql_file_path = r'D:\privategit\learn-python3\samples\basic\sql\STG_SD_YT_FEE_LIST_D.sql'
# 替换内容
replace_sql_contents(sql_file_path, replacement_map)