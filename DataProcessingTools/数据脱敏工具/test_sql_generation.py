#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
SQL生成测试脚本 - 用于调试数据脱敏工具中的SQL语句生成问题
"""

import os
import argparse
import pymysql
from pymysql.cursors import DictCursor

# 加载admda词汇
ADMDA_FILE = "admda.txt"
ADMDA_WORDS = []

def load_admda_words():
    """加载admda词汇表"""
    try:
        with open(ADMDA_FILE, 'r', encoding='utf-8') as f:
            ADMDA_WORDS.extend([line.strip() for line in f if line.strip()])
        print(f"✅ 成功加载 {len(ADMDA_WORDS)} 个admda词汇")
        return True
    except Exception as e:
        print(f"❌ 加载admda词汇失败: {str(e)}")
        return False

def generate_test_sql(table_name, sample_size=10):
    """生成测试SQL语句"""
    # 过滤和排序词汇
    filtered_admda = [word.strip() for word in ADMDA_WORDS if len(word.strip()) > 2]
    sorted_admda = sorted(filtered_admda, key=lambda x: len(x), reverse=True)
    
    # 只使用前几个词汇进行测试
    test_admda = sorted_admda[:sample_size]
    print(f"📊 使用前 {len(test_admda)} 个词汇进行测试: {test_admda}")
    
    # 构建REPLACE嵌套语句
    admda_replace_clause = "fixmedins_name"
    for word in test_admda:
        admda_replace_clause = f"REPLACE({admda_replace_clause}, '{word}', '')"
    
    # 生成完整SQL
    sql = f"""
    UPDATE {table_name}
    SET fixmedins_name = 
        CASE 
            WHEN fixmedins_name IS NOT NULL AND fixmedins_name != ''
            THEN {admda_replace_clause}
            ELSE fixmedins_name
        END
    -- 仅用于测试，限制更新数量
    LIMIT 100
    """
    
    return sql

def test_sql_execution(conn, table_name, sql):
    """测试SQL执行"""
    cursor = None
    try:
        cursor = conn.cursor()
        
        # 先查询表结构
        cursor.execute(f"DESCRIBE {table_name}")
        columns = cursor.fetchall()
        print(f"📋 表 {table_name} 的结构:")
        for col in columns:
            # 处理字典类型的结果
            col_name = col.get('Field', col.get(0, 'Unknown'))
            col_type = col.get('Type', col.get(1, 'Unknown'))
            print(f"  {col_name}: {col_type}")
        
        # 查询表中的记录样例
        cursor.execute(f"SELECT fixmedins_name FROM {table_name} WHERE fixmedins_name IS NOT NULL LIMIT 5")
        samples = cursor.fetchall()
        print(f"📝 表 {table_name} 中的记录样例:")
        for i, sample in enumerate(samples):
            # 处理字典类型的结果
            value = sample.get('fixmedins_name', sample.get(0, 'NULL'))
            print(f"  {i+1}. {value}")
        
        # 打印完整SQL语句
        print("\n📋 完整的SQL语句:")
        print(sql)
        
        # 询问是否执行
        execute = input("\n是否执行此SQL语句进行测试？(y/n): ")
        if execute.lower() == 'y':
            # 开启事务但不提交，用于测试
            cursor.execute(sql)
            affected_rows = cursor.rowcount
            print(f"✅ SQL执行成功，影响行数: {affected_rows}")
            
            # 查询执行后的结果样例
            cursor.execute(f"SELECT fixmedins_name FROM {table_name} WHERE fixmedins_name IS NOT NULL LIMIT 5")
            updated_samples = cursor.fetchall()
            print(f"\n📝 更新后的记录样例:")
            for i, sample in enumerate(updated_samples):
                # 处理字典类型的结果
                value = sample.get('fixmedins_name', sample.get(0, 'NULL'))
                print(f"  {i+1}. {value}")
            
            # 回滚事务
            conn.rollback()
            print("\n🔄 事务已回滚，没有实际修改数据")
        else:
            print("❌ SQL未执行")
            
    except Exception as e:
        print(f"❌ SQL执行错误: {str(e)}")
        import traceback
        print("\n📝 错误堆栈:")
        print(traceback.format_exc())
    finally:
        if cursor:
            cursor.close()

def main():
    # 解析命令行参数
    parser = argparse.ArgumentParser(description="SQL生成测试工具")
    parser.add_argument("--host", default="localhost", help="数据库主机地址")
    parser.add_argument("--port", type=int, default=3306, help="数据库端口")
    parser.add_argument("--user", default="root", help="数据库用户名")
    parser.add_argument("--password", default="", help="数据库密码")
    parser.add_argument("--database", default="test", help="数据库名称")
    parser.add_argument("--table", required=True, help="要测试的表名")
    parser.add_argument("--sample-size", type=int, default=10, help="测试使用的词汇数量")
    args = parser.parse_args()
    
    # 打印配置
    print(f"🚀 SQL生成测试工具启动")
    print(f"📊 配置信息:")
    print(f"  数据库: {args.user}@{args.host}:{args.port}/{args.database}")
    print(f"  测试表: {args.table}")
    print(f"  词汇数量: {args.sample_size}")
    
    # 加载admda词汇
    if not load_admda_words():
        return
    
    # 生成测试SQL
    sql = generate_test_sql(args.table, args.sample_size)
    
    # 连接数据库并测试
    conn = None
    try:
        print("\n🔌 连接数据库...")
        conn = pymysql.connect(
            host=args.host,
            port=args.port,
            user=args.user,
            password=args.password,
            database=args.database,
            charset='utf8mb4',
            cursorclass=DictCursor
        )
        print("✅ 数据库连接成功")
        
        # 测试SQL执行
        test_sql_execution(conn, args.table, sql)
        
    except Exception as e:
        print(f"❌ 数据库连接错误: {str(e)}")
    finally:
        if conn:
            conn.close()
            print("\n🔌 数据库连接已关闭")

if __name__ == "__main__":
    main()