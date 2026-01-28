#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
从数据库查询中提取使用的表，并生成对应的建表语句

功能：
1. 检查表名是否在 smb_sc 数据库的 query_sql 字段中出现
2. 如果出现，从 DDL 文件中提取对应的建表语句
3. 将建表语句保存到 adb.sql
"""

import re
import pymysql
from pathlib import Path

# ==================== 配置区域 ====================
# 数据库连接配置
DB_CONFIG = {
    'host': 'localhost',
    'port': 3306,
    'user': 'root',
    'password': 'root',  # 请填写数据库密码
    'database': 'sc_mds_c',
    'charset': 'utf8mb4'
}

# 待检查的表名列表
TABLE_NAMES = [
    'dws_jjsz_fund_pay_mi_ytai',
    'dws_jjsz_fund_pay_rsdt_year_mi_ytai',
    'dws_jjsz_hosp_rank_pay_mi_ytai',
    'dws_jjsz_setl_d_pay_mi_ytai',
    'dws_outmed_setl_d_yt',
    'dws_outmed_setl_info',
    'dws_setl_d_fixmedins_type',
    'fee_list_d_day',
    'fee_list_d_inhosp_day',
    'fixmedins_b',
    'inhosp_cnt_day',
    'insu_emp_info_b',
    'mdtrt_d_day',
    'mdtrt_d_realtime_ytai',
    'medins_info_b',
    'otp_bigscreen_test',
    'out_appy_d',
    'setl_d_day',
    'setl_d_realtime_ytai',
    'stg_midr_bus_xzxksx_info_df_ytai',
    'stg_tp_opsp_reg_d_df_v_ytai',
    'stg_zffs_drgkd37proc_mf_ytai',
    'adm_eval_rcd',
    'algs_b',
    'aset_admdvs_rlts_b',
    'cbv_mgt_card',
    'clnc_exam_rpot_d',
    'clnc_test_rpot_d',
    'dise_fort_b',
    'dm_patn_b',
    'drord_d',
    'dws_setl_d_with_hosplv',
    'dws_setl_d_with_hosplv_labl'
]

# DDL SQL 文件路径（支持多个文件）
DDL_FILE_PATHS = [
    r"E:\neusoft\烟台\技术文档\DDL_hsa_vms_yt_01 (1).sql",
    r"E:\neusoft\烟台\技术文档\DDL_hsa_vms_yt_02 (1).sql"
]

# 输出文件路径
OUTPUT_FILE = Path(__file__).parent / "adb.sql"
# ================================================


def check_table_in_query_sql(table_name: str, conn) -> bool:
    """检查表名是否在 query_sql 字段中出现"""
    try:
        with conn.cursor() as cursor:
            # 查询 query_sql 字段中是否包含该表名
            sql = """
            SELECT COUNT(*) FROM query
            WHERE query_sql LIKE %s
            """
            cursor.execute(sql, (f'%{table_name}%',))
            count = cursor.fetchone()[0]
            return count > 0
    except Exception as e:
        print(f"查询表 {table_name} 时出错: {e}")
        return False


def extract_create_table_statement(ddl_file_path: str, table_name: str) -> str:
    """从 DDL 文件中提取指定表的建表语句"""
    try:
        with open(ddl_file_path, 'r', encoding='utf-8') as f:
            content = f.read()

        # 先找到 TableName = xxx 的位置
        # 然后从那里开始提取建表语句，直到下一个分号

        # 方法1: 找到 TableName 注释块，然后提取到下一个分号
        lines = content.split('\n')
        start_idx = None

        for i, line in enumerate(lines):
            if f'TableName = {table_name}' in line:
                start_idx = i
                break

        if start_idx is None:
            return None

        # 从 TableName 往后找 CREATE TABLE 和结尾的分号
        result_lines = []
        found_create = False
        paren_count = 0
        in_create = False

        for i in range(start_idx, len(lines)):
            line = lines[i]
            result_lines.append(line)

            # 检测是否进入 CREATE TABLE 部分
            if re.search(r'CREATE\s+TABLE', line, re.IGNORECASE):
                in_create = True
                found_create = True

            if in_create:
                # 统计括号，找到真正的结尾
                paren_count += line.count('(') - line.count(')')

                # 如果遇到分号且括号已经平衡，说明建表语句结束
                if ';' in line and paren_count <= 0:
                    break

        if found_create:
            return '\n'.join(result_lines).strip()

        return None

    except Exception as e:
        print(f"提取表 {table_name} 的建表语句时出错: {e}")
        return None


def main():
    """主函数"""
    # 连接数据库
    conn = None
    try:
        conn = pymysql.connect(**DB_CONFIG)
        print(f"已连接到数据库: {DB_CONFIG['database']}")
    except Exception as e:
        print(f"数据库连接失败: {e}")
        print("请检查数据库配置是否正确")
        return

    found_tables = []
    create_statements = []

    print("\n开始检查表名...\n")

    for table_name in TABLE_NAMES:
        print(f"检查: {table_name}...", end=" ")

        if check_table_in_query_sql(table_name, conn):
            print("✓ 找到")
            found_tables.append(table_name)

            # 从多个DDL文件中提取建表语句
            create_stmt = None
            for ddl_file in DDL_FILE_PATHS:
                create_stmt = extract_create_table_statement(ddl_file, table_name)
                if create_stmt:
                    break

            if create_stmt:
                create_statements.append(create_stmt)
            else:
                print(f"  警告: 未找到表 {table_name} 的建表语句")
        else:
            print("✗ 未找到")

    # 关闭数据库连接
    if conn:
        conn.close()

    # 保存到文件
    if create_statements:
        with open(OUTPUT_FILE, 'w', encoding='utf-8') as f:
            for stmt in create_statements:
                f.write(stmt)
                f.write("\n\n")

        print(f"\n{'='*60}")
        print(f"共找到 {len(found_tables)} 个在 query_sql 中使用的表")
        print(f"建表语句已保存到: {OUTPUT_FILE}")
        print(f"{'='*60}")
    else:
        print("\n未找到任何匹配的表")


if __name__ == '__main__':
    main()
