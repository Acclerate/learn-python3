#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
测试REPLACE函数替换逻辑的简单脚本
"""
import pymysql
import sys
import traceback

def test_replace_function():
    """测试REPLACE函数替换逻辑"""
    try:
        # 数据库连接信息
        conn = pymysql.connect(
            host='localhost',
            port=3306,
            user='root',
            password='root',
            database='sc_mds_c',
            charset='utf8mb4',
            cursorclass=pymysql.cursors.DictCursor
        )
        
        cursor = conn.cursor()
        print("✅ 数据库连接成功")
        
        # 测试表名
        test_table = 'stg_zffs_drgkd37proc_mf_ytai'
        
        # 1. 获取表中的样本数据
        print(f"\n🔍 从 {test_table} 获取样本数据...")
        cursor.execute(f"SELECT fixmedins_name FROM {test_table} WHERE fixmedins_name IS NOT NULL LIMIT 10")
        samples = cursor.fetchall()
        
        print(f"✅ 获取到 {len(samples)} 条样本数据")
        for i, sample in enumerate(samples[:5], 1):
            print(f"  {i}. {sample.get('fixmedins_name', '')}")
        
        # 2. 构建简单的REPLACE函数测试
        print("\n📝 测试简单的REPLACE替换...")
        
        # 创建一些常见的占位符
        test_placeholders = [
            'XX市', 'XX区', 'XX县', 'XX区县',
            'A市', 'A区', 'A县', 'A区县',
            'F区县', 'XXXX区'
        ]
        
        # 按长度排序占位符，长的先替换
        test_placeholders_sorted = sorted(test_placeholders, key=len, reverse=True)
        
        # 构建嵌套的REPLACE语句
        replace_clause = "tmp.fixmedins_name"
        for placeholder in test_placeholders_sorted:
            replace_clause = f"REPLACE({replace_clause}, '{placeholder}', '')"
        
        # 添加去除多余空格的处理
        replace_clause = f"TRIM({replace_clause})"
        
        # 创建测试查询
        test_query = f"""
        SELECT 
            tmp.fixmedins_name AS original,
            {replace_clause} AS replaced
        FROM (
            SELECT fixmedins_name FROM {test_table} 
            WHERE fixmedins_name IS NOT NULL 
            LIMIT 10
        ) tmp
        """
        
        print(f"执行测试查询...")
        cursor.execute(test_query)
        results = cursor.fetchall()
        
        print("\n📊 替换前后对比:")
        for i, row in enumerate(results[:5], 1):
            original = row.get('original', '')
            replaced = row.get('replaced', '')
            print(f"\n  样本 {i}:")
            print(f"  原始值: {original}")
            print(f"  替换后: {replaced}")
            print(f"  变化: {'✓ 已替换' if original != replaced else '✗ 未变化'}")
        
        # 3. 检查是否需要处理其他占位符格式
        print("\n🔍 分析是否存在其他占位符模式...")
        cursor.execute(f"SELECT fixmedins_name FROM {test_table} WHERE fixmedins_name LIKE '%XX%' LIMIT 5")
        xx_patterns = cursor.fetchall()
        
        print(f"\nXX模式样本 ({len(xx_patterns)}条):")
        for i, row in enumerate(xx_patterns, 1):
            print(f"  {i}. {row.get('fixmedins_name', '')}")
        
        print("\n✅ 测试完成")
        
    except Exception as e:
        print(f"❌ 测试失败: {str(e)}")
        traceback.print_exc()
    finally:
        if 'conn' in locals():
            conn.close()
            print("\n🔒 数据库连接已关闭")

if __name__ == "__main__":
    print("=" * 60)
    print("      REPLACE函数替换逻辑测试")
    print("=" * 60)
    test_replace_function()
    print("=" * 60)