#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
SQL表名提取工具
从SQL DDL文件中提取所有表名

使用方法:
    python extract_table_names.py

    或者指定自定义路径:
    python extract_table_names.py "SQL文件路径" "输出文件路径"
"""

import re
import sys
from pathlib import Path

# ==================== 配置区域 ====================
# SQL文件路径
# SQL_FILE_PATH = r"E:\neusoft\烟台\技术文档\DDL_hsa_vms_yt_02 (1).sql"
SQL_FILE_PATH = r"E:\neusoft\烟台\技术文档\DDL_hsa_vms_yt_01 (1).sql"

# 输出目录
OUTPUT_DIR = r"E:\neusoft\烟台\技术文档"
# ================================================


def extract_table_names(sql_file_path: str) -> list:
    """从SQL文件中提取表名"""
    table_names = []

    try:
        with open(sql_file_path, 'r', encoding='utf-8') as f:
            content = f.read()

        # 匹配 TableName = xxx
        pattern = r'TableName\s*=\s*([^\s/]+)'
        matches = re.findall(pattern, content)

        for match in matches:
            name = match.strip()
            if name and name not in table_names:
                table_names.append(name)

        # 备用匹配: CREATE TABLE 后的表名
        create_pattern = r'CREATE TABLE\s+[`"]?([^`\s"(]+)[`"]?\s*\('
        create_matches = re.findall(create_pattern, content, re.IGNORECASE)

        for match in create_matches:
            name = match.strip()
            if name and name not in table_names:
                table_names.append(name)

    except FileNotFoundError:
        print(f"错误: 文件不存在 - {sql_file_path}")
        return []
    except Exception as e:
        print(f"错误: {e}")
        return []

    return sorted(table_names)


if __name__ == '__main__':
    # 使用命令行参数，如果没有则使用配置的默认值
    if len(sys.argv) >= 3:
        sql_file = sys.argv[1]
        output_file = sys.argv[2]
    elif len(sys.argv) == 2:
        sql_file = sys.argv[1]
        output_file = str(Path(SQL_FILE_PATH).stem) + '_table_names.txt'
    else:
        sql_file = SQL_FILE_PATH
        output_file = str(Path(OUTPUT_DIR) / Path(SQL_FILE_PATH).stem) + '_table_names.txt'

    table_names = extract_table_names(sql_file)

    if table_names:
        print(f"\n共找到 {len(table_names)} 个表名:\n")
        print("=" * 60)
        for name in table_names:
            print(f"  {name}")
        print("=" * 60)

        with open(output_file, 'w', encoding='utf-8') as f:
            for name in table_names:
                f.write(name + '\n')
        print(f"\n已保存到: {output_file}")
    else:
        print("未找到任何表名")
