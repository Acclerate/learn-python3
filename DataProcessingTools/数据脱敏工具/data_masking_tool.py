#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
数据脱敏工具 - 用于对sc_mds_c数据库中的医疗机构信息进行脱敏处理

功能：
1. 连接MySQL数据库sc_mds_c
2. 查找所有包含fixmedins_code和fixmedins_name字段的表
3. 对这些字段按照指定规则进行脱敏处理
4. 生成脱敏报告
"""

import os
import re
import hashlib
import pymysql
import argparse
from datetime import datetime



def load_admda_words():
    """
    从admda.txt文件加载需要脱敏的词汇
    返回一个字典，键为原始词汇，值为'XX'替换符
    """
    admda_file = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'admda.txt')
    admda_mapping = {}
    
    try:
        with open(admda_file, 'r', encoding='utf-8') as f:
            for line in f:
                word = line.strip()
                if word and len(word) >= 2:  # 只处理非空且长度>=2的词汇
                    admda_mapping[word] = 'XX'
        print(f"✅ 从admda.txt加载了 {len(admda_mapping)} 个脱敏词汇")
    except Exception as e:
        print(f"❌ 加载admda.txt文件出错: {str(e)}")
    
    return admda_mapping

# 加载admda.txt中的词汇
ADMDA_WORDS = load_admda_words()

class DataMaskingTool:
    def __init__(self, host='localhost', port=3306, user='root', password='root', db='sc_mds_c'):
        """初始化数据脱敏工具"""
        self.host = host
        self.port = port
        self.user = user
        self.password = password
        self.db = db
        self.conn = None
        self.cursor = None
        self.report = {
            'start_time': datetime.now(),
            'tables_processed': 0,
            'records_updated': 0,
            'tables': {}
        }
    
    def connect_db(self):
        """连接到MySQL数据库"""
        try:
            self.conn = pymysql.connect(
                host=self.host,
                port=self.port,
                user=self.user,
                password=self.password,
                db=self.db,
                charset='utf8mb4',
                cursorclass=pymysql.cursors.DictCursor
            )
            self.cursor = self.conn.cursor()
            print(f"✅ 成功连接到数据库 {self.host}:{self.port}/{self.db}")
            return True
        except Exception as e:
            print(f"❌ 数据库连接失败: {str(e)}")
            return False
    
    def close_db(self):
        """关闭数据库连接"""
        if self.cursor:
            self.cursor.close()
        if self.conn:
            self.conn.close()
        print("✅ 数据库连接已关闭")
    
    def get_tables_with_columns(self):
        """查找所有包含fixmedins_code和fixmedins_name字段的表"""
        query = """
        SELECT DISTINCT table_name 
        FROM information_schema.columns 
        WHERE table_schema = %s 
        AND (column_name = 'fixmedins_code' OR column_name = 'fixmedins_name')
        GROUP BY table_name 
        HAVING COUNT(DISTINCT column_name) = 2
        """
        
        try:
            self.cursor.execute(query, (self.db,))
            tables = [row['table_name'] for row in self.cursor.fetchall()]
            print(f"✅ 找到 {len(tables)} 个包含目标字段的表")
            return tables
        except Exception as e:
            print(f"❌ 查询表信息失败: {str(e)}")
            return []
    
    # mask_fixmedins_code方法已被移除，不再对fixmedins_code进行脱敏处理
    
    # 注意：mask_fixmedins_name方法已被移除，现在使用批量SQL UPDATE进行脱敏处理
    
    def process_table(self, table_name):
        """处理单个表的脱敏，不依赖主键或id列"""
        print(f"\n🔄 开始处理表: {table_name}")
        
        try:
            total_updated = 0
            
            # 直接执行实际脱敏操作
            # 注意：不再对fixmedins_code字段进行脱敏处理
            
            # 2. 先获取表中的实际数据样本，了解需要处理的模式
            print(f"  📊 获取表中数据样本，分析实际需要处理的模式")
            sample_query = f"SELECT DISTINCT fixmedins_name FROM {table_name} WHERE fixmedins_name IS NOT NULL LIMIT 10"
            self.cursor.execute(sample_query)
            samples = self.cursor.fetchall()
            
            print(f"  📝 样本数据 (前10条):")
            for i, sample in enumerate(samples):
                value = sample[0] if isinstance(sample, tuple) else sample.get('fixmedins_name', 'NULL')
                print(f"    {i+1}. {value}")
            
            # 3. 策略1: 使用嵌套的REPLACE函数替换常见的占位符模式
            print("\n  🎯 策略1: 使用REPLACE函数替换常见占位符模式")
            
            # 创建常见占位符模式的列表 - 按长度倒序排列，确保长的模式先被替换
            placeholders = [
                # 长格式占位符（先替换）
                'XXXX市', 'XXXX区', 'XXXX县',
                # 特殊组合
                'XX区县', 'A区县', 'B区县', 'C区县', 'D区县', 'E区县', 'F区县', 'G区县', 'H区县',
                # 标准格式
                'XX市', 'XX区', 'XX县',
                'AA市', 'BB市', 'CC市', 'DD市', 'EE市', 'FF市',
                'AA区', 'BB区', 'CC区', 'DD区', 'EE区', 'FF区',
                'AA县', 'BB县', 'CC县', 'DD县', 'EE县', 'FF县',
                'A市', 'B市', 'C市', 'D市', 'E市', 'F市', 'G市', 'H市',
                'A区', 'B区', 'C区', 'D区', 'E区', 'F区', 'G区', 'H区',
                'A县', 'B县', 'C县', 'D县', 'E县', 'F县', 'G县', 'H县',
                # 特殊占位符
                '幸福街道'
            ]
            
            # 构建嵌套的REPLACE语句
            replace_clause = "fixmedins_name"
            for placeholder in placeholders:
                replace_clause = f"REPLACE({replace_clause}, '{placeholder}', '')"
            
            # 添加去除多余空格的处理
            replace_clause = f"TRIM({replace_clause})"
            
            # 构建更新SQL
            replace_query = f"""
            UPDATE {table_name}
            SET fixmedins_name = 
                CASE 
                    WHEN fixmedins_name IS NOT NULL AND fixmedins_name != ''
                    THEN {replace_clause}
                    ELSE fixmedins_name
                END
            """
            
            print(f"  📋 执行REPLACE函数替换SQL:")
            print(f"  替换模式数量: {len(placeholders)}")
            print(f"  部分占位符: {placeholders[:5]}")
            
            self.cursor.execute(replace_query)
            regex_updated = self.cursor.rowcount
            self.conn.commit()
            print(f"  ✅ REPLACE函数替换完成，影响行数: {regex_updated}")
            
            # 4. 更新fixmedins_name字段，使用多次批量SQL UPDATE
            # 获取总记录数
            self.cursor.execute(f"SELECT COUNT(*) FROM {table_name} WHERE fixmedins_name IS NOT NULL AND fixmedins_name != ''")
            total_records = self.cursor.fetchone()['COUNT(*)']
            print(f"  🔍 表 {table_name} 中有 {total_records} 条非空的fixmedins_name记录需要处理")
            
            # 5. 策略2: 处理admda.txt中的高频词汇（分批循环处理，避免SQL过长）
            # 过滤并排序admda词汇
            filtered_admda = {k: v for k, v in ADMDA_WORDS.items() if  2<=len(k)<=3 }
            sorted_admda = sorted(filtered_admda.items(), key=lambda x: len(x[0]), reverse=True)
            
            # 打印处理信息和前5个词汇样例用于诊断
            print(f"  📊 准备处理 {len(sorted_admda)} 个admda词汇，共分10批次处理")
            print(f"  📝 前5个词汇样例: {dict(sorted_admda[:5]) if len(sorted_admda) >=5 else dict(sorted_admda)}")
            print(f"  📝 表 {table_name} 中需要处理的记录数查询")
            
            # 查询表中实际有多少记录需要处理
            count_query = f"SELECT COUNT(*) FROM {table_name} WHERE fixmedins_name IS NOT NULL AND fixmedins_name != ''"
            print(f"  📋 执行计数查询: {count_query}")
            self.cursor.execute(count_query)
            result = self.cursor.fetchone()
            total_records = result[0] if isinstance(result, tuple) else result['COUNT(*)']
            print(f"  📊 表 {table_name} 中有 {total_records} 条非空fixmedins_name记录需要处理")
            
            if sorted_admda:
                # 计算每批处理的词汇数量，总共循环10次
                total_words = len(sorted_admda)
                batch_size = max(1, total_words // 10)
                print(f"  📊 每批处理 {batch_size} 个词汇")
                
                print(f"  📝 总词汇数量: {total_words}, 每批处理: {batch_size}个词汇")
                
                # 分批处理admda词汇
                for batch_num in range(10):
                    start_idx = batch_num * batch_size
                    # 最后一批处理剩余所有词汇
                    if batch_num == 9:
                        end_idx = total_words
                    else:
                        end_idx = start_idx + batch_size
                    
                    # 获取当前批次的词汇
                    batch_words = sorted_admda[start_idx:end_idx]
                    
                    if not batch_words:
                        break
                    
                    print(f"  🔄 处理批次 {batch_num + 1}/10: 词汇 {start_idx + 1} 到 {end_idx}")
                    
                    # 构建该批次的REPLACE子句
                    admda_replace_clause = "fixmedins_name"
                    for word, replacement in batch_words:
                        admda_replace_clause = f"REPLACE({admda_replace_clause}, '{word}', '{replacement}')"
                    
                    # 构建并执行SQL更新语句
                    admda_update_query = f"""
                    UPDATE {table_name}
                    SET fixmedins_name = 
                        CASE 
                            WHEN fixmedins_name IS NOT NULL AND fixmedins_name != ''
                            THEN {admda_replace_clause}
                            ELSE fixmedins_name
                        END
                    """
                    
                    # 打印SQL语句的关键部分用于调试，避免输出过长
                    print(f"  📋 执行SQL (批次{batch_num + 1}):")
                    print(f"  更新表: {table_name}")
                    print(f"  替换子句长度: {len(admda_replace_clause)} 字符")
                    print(f"  替换词汇范围: {batch_num * batch_size} - {min((batch_num + 1) * batch_size, total_words)}")
                    batch_admda = [word for word, _ in sorted_admda[start_idx:end_idx]]
                    print(f"  样例替换词: {batch_admda[:3] if len(batch_admda) > 3 else batch_admda}")
                    
                    self.cursor.execute(admda_update_query)
                    batch_updated = self.cursor.rowcount
                    self.conn.commit()
                    print(f"  ✅ 批次 {batch_num + 1} 完成，影响行数: {batch_updated}")
                
                # 最后再执行一次查询获取最终更新行数
                self.cursor.execute(f"SELECT COUNT(*) FROM {table_name} WHERE fixmedins_name != ''")
                result = self.cursor.fetchone()
                total_processed = result[0] if isinstance(result, tuple) else result['COUNT(*)']
                admda_updated = total_processed
                print(f"  ✅ 已处理高频admda词汇替换，更新了 {admda_updated} 条记录")
            
            # 多次循环处理，确保彻底脱敏
            print("  🔄 进行多轮循环处理，确保彻底脱敏...")
            # 定义一个简单的更新语句用于循环处理
            simple_update_query = f"""
            UPDATE {table_name}
            SET fixmedins_name = 
                CASE 
                    WHEN fixmedins_name IS NOT NULL AND fixmedins_name != ''
                    THEN CONCAT(
                        SUBSTRING(fixmedins_name, 1, FLOOR(LENGTH(fixmedins_name) / 3)),
                        REPEAT('X', FLOOR(LENGTH(fixmedins_name) / 3)),
                        SUBSTRING(fixmedins_name, FLOOR(LENGTH(fixmedins_name) * 2 / 3) + 1)
                    )
                    ELSE fixmedins_name
                END
            """
            
            try:
                # 执行简单的更新语句一次
                print(f"  📋 执行更新SQL: {simple_update_query}")
                self.cursor.execute(simple_update_query)
                self.conn.commit()
                print(f"  🔄 完成更新处理")
            except Exception as update_error:
                print(f"  ⚠️  更新处理时出现非致命错误: {str(update_error)}")
                # 继续执行，不中断整个表的处理
            
            # 统计更新数
            # 合并正则替换和admda词汇替换的影响行数
            name_updates = regex_updated  # 首先计入正则替换的影响行数
            if 'admda_updated' in locals():
                name_updates += admda_updated  # 然后加上admda词汇替换的影响行数
            
            # 由于不再对fixmedins_code进行脱敏处理，直接使用name_updates作为总更新数
            total_updated = name_updates
            print(f"  ✅ 共更新了 {name_updates} 条记录的fixmedins_name字段")
            print(f"    - 正则表达式替换: {regex_updated} 条")
            print(f"    - ADMDA词汇替换: {admda_updated} 条")
            print(f"  🔧 表 {table_name} 脱敏处理完成，通过批量更新确保脱敏")
            
            print(f"✅ 表 {table_name} 处理完成，更新了 {total_updated} 条记录")
            self.report['tables'][table_name] = {
                'status': 'processed', 
                'records_updated': total_updated
            }
            return total_updated
            
        except Exception as e:
            import traceback
            error_msg = str(e)
            error_trace = traceback.format_exc()
            if self.conn:
                self.conn.rollback()
            print(f"❌ 处理表 {table_name} 时出错: {error_msg}")
            print(f"📝 详细错误堆栈:")
            print(error_trace)
            self.report['tables'][table_name] = {
                'status': 'error', 
                'error': error_msg, 
                'error_trace': error_trace,
                'records_updated': 0
            }
            return 0
    
    def generate_report(self):
        """生成脱敏报告"""
        self.report['end_time'] = datetime.now()
        
        print("\n" + "="*60)
        print("📊 数据脱敏报告")
        print("="*60)
        print(f"开始时间: {self.report['start_time'].strftime('%Y-%m-%d %H:%M:%S')}")
        print(f"结束时间: {self.report['end_time'].strftime('%Y-%m-%d %H:%M:%S')}")
        print(f"总耗时: {(self.report['end_time'] - self.report['start_time']).total_seconds():.2f} 秒")
        print(f"处理表数: {self.report['tables_processed']}")
        print(f"更新记录数: {self.report['records_updated']}")
        print("\n各表处理情况:")
        
        for table, info in self.report['tables'].items():
            status = info['status']
            if status == 'processed':
                print(f"  ✅ {table}: 更新了 {info['records_updated']} 条记录")
            elif status == 'skipped':
                print(f"  ⚠️ {table}: 跳过 - {info['reason']}")
            elif status == 'error':
                print(f"  ❌ {table}: 错误 - {info['error'][:100]}...")
        
        print("="*60)
        
    def run(self, specific_tables=None):
        """运行数据脱敏工具
        
        Args:
            specific_tables: 指定要处理的表列表，如果为None则处理所有包含目标字段的表
        """
        print("🚀 数据脱敏工具启动")
        print(f"模式: 实际运行模式")
        
        if not self.connect_db():
            return False
        
        try:
            # 获取需要处理的表
            all_tables = self.get_tables_with_columns()
            
            # 如果指定了表列表，则只处理这些表
            if specific_tables:
                # 过滤出存在的表
                tables = [table for table in specific_tables if table in all_tables]
                # 找出不存在的表
                non_existent_tables = [table for table in specific_tables if table not in all_tables]
                
                if non_existent_tables:
                    print(f"⚠️  以下指定的表不存在或不包含目标字段: {', '.join(non_existent_tables)}")
                
                print(f"📋 已指定只处理 {len(tables)} 个表: {', '.join(tables)}")
            else:
                tables = all_tables
                print(f"📋 将处理所有 {len(tables)} 个包含目标字段的表")
            
            self.report['tables_processed'] = len(tables)
            
            # 处理每个表
            total_updated = 0
            for table in tables:
                updated = self.process_table(table)
                total_updated += updated
            
            self.report['records_updated'] = total_updated
            
            # 生成报告
            self.generate_report()
            
            return True
            
        except Exception as e:
            print(f"❌ 工具运行出错: {str(e)}")
            if self.conn:
                self.conn.rollback()
            return False
        finally:
            self.close_db()

# 固定指定需要处理的表列表
SPECIFIC_TABLES = ['stg_zffs_drgkd37_mf_ytai', 'stg_zffs_drgkd37proc_mf_ytai', 'stg_drg_fixmedins_list_mf_ytai']

if __name__ == "__main__":
    # 解析命令行参数
    parser = argparse.ArgumentParser(description='数据库脱敏工具')
    parser.add_argument('--host', type=str, default='localhost', help='数据库主机地址')
    parser.add_argument('--port', type=int, default=3306, help='数据库端口')
    parser.add_argument('--user', type=str, default='root', help='数据库用户名')
    parser.add_argument('--password', type=str, default='root', help='数据库密码')
    parser.add_argument('--db', type=str, default='sc_mds_c', help='数据库名称')
    parser.add_argument('--max-tables', type=int, default=1, help='限制最多处理的表数量，默认只处理1个表以便调试')
    # 注意：--tables参数已被移除，表列表已固定在代码中
    
    args = parser.parse_args()
    
    # 使用固定的表列表
    specific_tables = SPECIFIC_TABLES
    
    # 打印运行配置
    print(f"🚀 数据脱敏工具启动")
    print(f"📊 配置信息:")
    print(f"  数据库: {args.user}@{args.host}:{args.port}/{args.db}")
    print(f"  最大表数: {args.max_tables}")
    print(f"  ADMDA词汇数量: {len(ADMDA_WORDS)}")
    print(f"  模式: 实际运行模式")
    print(f"  固定表列表: {', '.join(specific_tables)}")
    
    # 创建并运行脱敏工具
    tool = DataMaskingTool(
        host=args.host,
        port=args.port,
        user=args.user,
        password=args.password,
        db=args.db
    )
    
    success = tool.run(specific_tables=specific_tables)
    
    if success:
        print("\n✅ 数据脱敏任务完成")
    else:
        print("\n❌ 数据脱敏任务失败")