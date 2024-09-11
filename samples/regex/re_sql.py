import re


def convert_mysql_to_adb(file_path):
    with open(file_path, 'r', encoding='utf-8') as file:
        sql_content = file.read()

    # 保留 DROP TABLE IF EXISTS 语句
    drop_table_statements = re.findall(r"DROP TABLE IF EXISTS `?\w+`?;", sql_content)

    # 删除字符集和排序规则
    sql_content = re.sub(r"CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci", "", sql_content, flags=re.IGNORECASE)
    sql_content = re.sub(r"CHARACTER SET utf8 COLLATE utf8_unicode_ci", "", sql_content, flags=re.IGNORECASE)
    sql_content = re.sub(r"CHARACTER SET utf8 COLLATE utf8_general_ci", "", sql_content, flags=re.IGNORECASE)
    sql_content = re.sub(r"ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci", "", sql_content, flags=re.IGNORECASE)
    sql_content = re.sub(r"ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", "", sql_content, flags=re.IGNORECASE)
    sql_content = re.sub(r"ROW_FORMAT = DYNAMIC", "", sql_content, flags=re.IGNORECASE)
    sql_content = re.sub(r"DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP", "", sql_content, flags=re.IGNORECASE)
    sql_content = re.sub(r"DEFAULT CURRENT_TIMESTAMP", "", sql_content, flags=re.IGNORECASE)

    # 移除包含动态数字的 ENGINE = InnoDB AUTO_INCREMENT = ... CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci
    pattern_engine_auto_increment = r'ENGINE\s*=\s*InnoDB\s*AUTO_INCREMENT\s*=\s*\d+\s*CHARACTER\s*SET\s*=\s*utf8mb4\s*COLLATE\s*=\s*utf8mb4_general_ci'
    sql_content = re.sub(pattern_engine_auto_increment, "", sql_content, flags=re.IGNORECASE)

    # 移除 ENGINE = InnoDB AUTO_INCREMENT = ... ROW_FORMAT = DYNAMIC;
    pattern = (r'ENGINE\s*=\s*InnoDB\s*AUTO_INCREMENT\s*=\s*'
               r'\d+\s*CHARACTER\s*SET\s*=\s*utf8mb4\s*COLLATE\s*=\s*utf8mb4_general_ci\s*ROW_FORMAT\s*=\s*DYNAMIC;')
    sql_content = re.sub(pattern, "", sql_content, flags=re.IGNORECASE)
    # 移除包含动态数字的 ENGINE = InnoDB AUTO_INCREMENT = ... CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC
    pattern_engine_auto_increment = r'ENGINE\s*=\s*InnoDB\s*AUTO_INCREMENT\s*=\s*\d+\s*CHARACTER\s*SET\s*=\s*\w+\s*COLLATE\s*=\s*\w+\s*ROW_FORMAT\s*=\s*DYNAMIC'
    sql_content = re.sub(pattern_engine_auto_increment, "", sql_content, flags=re.IGNORECASE)

    # 移除包含动态数字的 ENGINE = InnoDB AUTO_INCREMENT = ... CHARACTER SET ... COLLATE ... [ROW_FORMAT = ...]
    pattern_engine_auto_increment = r'ENGINE\s*=\s*InnoDB\s*AUTO_INCREMENT\s*=\s*\d+\s*CHARACTER\s*SET\s*=\s*\w+\s*COLLATE\s*=\s*\w+\s*(ROW_FORMAT\s*=\s*\w+)?\s*;'
    sql_content = re.sub(pattern_engine_auto_increment, "", sql_content, flags=re.IGNORECASE)

    # 移除 PRIMARY KEY 后的 USING BTREE
    pattern_primary_key = r'PRIMARY\s*KEY\s*\([^\)]+\)\s*USING\s*BTREE'
    sql_content = re.sub(pattern_primary_key, lambda match: match.group(0).replace('USING BTREE', ''), sql_content, flags=re.IGNORECASE)


    # 替换 INDEX USING BTREE 为 FULLTEXT INDEX，替换时保留逗号
    def replace_btree_with_fulltext(match):
        index_name, field_name = match.groups()
        return f'FULLTEXT INDEX {index_name} ({field_name}),'

    # 替换所有的 INDEX USING BTREE
    sql_content = re.sub(r'INDEX\s+`(\w+)`\s*\(`(\w+)`\)\s*USING\s*BTREE,?', replace_btree_with_fulltext, sql_content,
                         flags=re.IGNORECASE)

    # 替换所有的 INDEX USING BTREE KEY `idex_psn_no` (`PSN_NO`) USING BTREE,
    sql_content = re.sub(r'KEY\s+`(\w+)`\s*\(`(\w+)`\)\s*USING\s*BTREE,?', replace_btree_with_fulltext, sql_content,
                         flags=re.IGNORECASE)

    # 查找 FULLTEXT INDEX 的所有位置
    fulltext_indexes = re.findall(r'FULLTEXT INDEX.*?,', sql_content)

    # 如果找到至少一个 FULLTEXT INDEX，去掉最后一个的逗号
    if fulltext_indexes:
        last_fulltext_index = fulltext_indexes[-1]  # 获取最后一个 FULLTEXT INDEX
        sql_content = sql_content.replace(last_fulltext_index, last_fulltext_index.rstrip(','))  # 去掉最后一个逗号

    # 替换 text 为 varchar
    sql_content = re.sub(r'\btext\b', 'varchar', sql_content, flags=re.IGNORECASE)

    # 替换 varchar(n) 为 varchar，其中 n 是任意数字
    sql_content = re.sub(r'varchar\(\d+\)', 'varchar', sql_content, flags=re.IGNORECASE)
    # 替换 double(x, y) 为 double，其中 x 和 y 是任意数字
    sql_content = re.sub(r'double\s*\(\s*\d+\s*,\s*\d+\s*\)', 'double', sql_content, flags=re.IGNORECASE)

    # 替换 int(n) 为 int，其中 n 是任意数字
    sql_content = re.sub(r'int\(\d+\)', 'int', sql_content, flags=re.IGNORECASE)

    # 替换 tinyint(n) 为 tinyint，其中 n 是任意数字
    sql_content = re.sub(r'tinyint\(\d+\)', 'tinyint', sql_content, flags=re.IGNORECASE)
    # 替换 datetime ,date 为 timestamp
    sql_content = re.sub(r'\bdatetime\b', 'timestamp', sql_content, flags=re.IGNORECASE)
    sql_content = re.sub(r'\bdate\b', 'timestamp', sql_content, flags=re.IGNORECASE)

      # 替换 longtext 为 varchar
    sql_content = re.sub(r'\blongtext\b', 'varchar', sql_content, flags=re.IGNORECASE)

    # 提取所有的CREATE TABLE语句
    table_definitions = re.findall(r"CREATE TABLE.*?\).*?;", sql_content, re.S)

    converted_tables = []

    for i, table in enumerate(table_definitions):
        primary_key_clause = ""
        primary_key = re.search(r"PRIMARY KEY \(`?(\w+)`?\)", table)
        if not primary_key:
            # 找到表中的字段
            fields = re.findall(r"`(\w+)`.*?(?:,\s*|$)", table)
            if len(fields) >= 3:
                primary_key_clause = f"PRIMARY KEY (`{fields[0]}`, `{fields[1]}`, `{fields[2]}`)"
            elif len(fields) == 2:
                primary_key_clause = f"PRIMARY KEY (`{fields[0]}`, `{fields[1]}`)"
            elif len(fields) == 1:
                primary_key_clause = f"PRIMARY KEY (`{fields[0]}`)"
            else:
                primary_key_clause = ""

        # 找到主键，如果有就作为分区键，否则用表中第一个字段
        primary_key = re.search(r"PRIMARY KEY \(`?(\w+)`?\)", table)
        if primary_key:
            partition_key = primary_key.group(1)
        else:
            # 找到第一个字段作为分区键
            fields = re.findall(r"`(\w+)`.*?(?:,\s*|$)", table)
            partition_key = fields[0] if fields else None  # 如果没有找到字段，则为None


        # 添加ADB特有的分区和其他选项在CREATE TABLE之后
        partition_clause = f"\nPARTITION BY HASH({partition_key})\nPARTITION NUM 256 \nTABLEGROUP hsa_vms_yt_02 \nOPTIONS (UPDATETYPE = 'realtime')"
        # 将主键放在字段定义的括号内，并确保在主键前加上逗号
        if primary_key_clause:
            # 去掉字段定义末尾的括号
            table = re.sub(r'\)\s*;', '', table, flags=re.IGNORECASE)
            # 在最后一个字段定义后添加主键定义，前缀增加逗号
            table += f",\n{primary_key_clause})"  # 添加主键后再补上关闭括号

        # 在建表语句的末尾追加分区定义
        modified_table = table.strip(';') + partition_clause + ";"

        # 先加 DROP TABLE IF EXISTS 语句，再加 CREATE TABLE 语句
        if i < len(drop_table_statements):
            modified_table = drop_table_statements[i] + "\n" + modified_table

        converted_tables.append(modified_table)

    # 合并处理后的建表语句
    adb_sql = "\n\n".join(converted_tables)

    return adb_sql


# 固定的文件路径
sql_file_path = r'D:\privategit\learn-python3\samples\regex\file\sc_mds_c1.sql'

# 转换并打印输出
converted_sql = convert_mysql_to_adb(sql_file_path)
print(converted_sql)
