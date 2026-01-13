#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
特定表脱敏工具 - 用于对 ads_znjg_fixmedins_mdtrt_sum_mon_mf_ytai 表中的医疗机构名称进行脱敏处理

功能：
1. 连接MySQL数据库sc_mds_c
2. 对 ads_znjg_fixmedins_mdtrt_sum_mon_mf_ytai 表的 fixmedins_name 字段进行脱敏
3. 使用与主脱敏工具相同的脱敏逻辑
4. 从admda.txt读取额外的脱敏关键字
"""

import os
import re
import hashlib
import pymysql
import argparse
from datetime import datetime

# 区县映射关系（脱敏规则）
DISTRICT_MAPPING = {
    '芝罘区': 'A区县',
    '福山区': 'B区县', 
    '牟平区': 'C区县',
    '莱山区': 'D区县',
    '长岛县': 'E区县',
    '长岛综试区': 'E区县',
    '龙口市': 'F区县',
    '莱阳市': 'G区县',
    '莱州市': 'H区县',
    '蓬莱市': 'I区县',
    '蓬莱区': 'I区县',
    '招远市': 'J区县',
    '栖霞市': 'K区县',
    '海阳市': 'L区县',
    '黄渤海新区': 'M区县'
}

# 城市名称替换规则
CITY_REPLACEMENT = 'XX市'

# 地名替换规则（扩展版）
PLACE_NAME_MAPPING = {
    '烟台市': CITY_REPLACEMENT,
    '烟台': 'XX',
    '山东': 'XX省',
    '文登': 'XX区',
    '胶东': 'XX区',
    '东海': 'XX区',
    '昆仑山': 'XX区',
    '桃村': 'XX镇',
    '奇山': 'XX区',
    '鲁东': 'XX区',
    '烟台山': 'XX山',
    '毓璜顶': 'XX顶',
    '芝罘': 'XX区',
    '福山': 'XX区',
    '牟平': 'XX区',
    '莱山': 'XX区',
    '长岛': 'XX区',
    '龙口': 'XX市',
    '莱阳': 'XX市',
    '莱州': 'XX市',
    '蓬莱': 'XX区',
    '招远': 'XX市',
    '栖霞': 'XX市',
    '海阳': 'XX市',
    '北京': 'YY市',
    '青岛': 'ZZ市',
    '滨州': 'WW市',
    # 新增需要脱敏的地名
    '乳山': 'XX市',
    '上海': 'WW市',
    '静安': 'XX区'
}

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

class SpecificTableMaskingTool:
    def __init__(self, host='localhost', port=3306, user='root', password='root', db='sc_mds_c'):
        """初始化数据脱敏工具"""
        self.host = host
        self.port = port
        self.user = user
        self.password = password
        self.db = db
        self.conn = None
        self.cursor = None
        self.target_table = 'ads_znjg_fixmedins_mdtrt_sum_mon_mf_ytai'
        self.report = {
            'start_time': datetime.now(),
            'end_time': None,
            'records_updated': 0
        }
        # 加载admda.txt中的词汇并创建映射
        self.admda_mapping = load_admda_words()
    
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
    
    def check_table_exists(self):
        """检查目标表是否存在"""
        query = """
        SELECT COUNT(*) as count 
        FROM information_schema.tables 
        WHERE table_schema = %s AND table_name = %s
        """
        try:
            self.cursor.execute(query, (self.db, self.target_table))
            result = self.cursor.fetchone()
            if result['count'] == 0:
                print(f"❌ 表 {self.target_table} 不存在于数据库 {self.db} 中")
                return False
            print(f"✅ 表 {self.target_table} 存在于数据库 {self.db} 中")
            return True
        except Exception as e:
            print(f"❌ 检查表是否存在时出错: {str(e)}")
            return False
    
    def check_column_exists(self):
        """检查目标列是否存在"""
        query = """
        SELECT COUNT(*) as count 
        FROM information_schema.columns 
        WHERE table_schema = %s AND table_name = %s AND column_name = 'fixmedins_name'
        """
        try:
            self.cursor.execute(query, (self.db, self.target_table))
            result = self.cursor.fetchone()
            if result['count'] == 0:
                print(f"❌ 字段 fixmedins_name 不存在于表 {self.target_table} 中")
                return False
            print(f"✅ 字段 fixmedins_name 存在于表 {self.target_table} 中")
            return True
        except Exception as e:
            print(f"❌ 检查字段是否存在时出错: {str(e)}")
            return False
    
    def show_sample_data(self, limit=9999999):
        """显示表中的样本数据"""
        try:
            self.cursor.execute(f"SELECT fixmedins_name FROM {self.target_table} LIMIT {limit}")
            samples = self.cursor.fetchall()
            print(f"\n🔍 表 {self.target_table} 的样本数据 (前{limit}条):")
            for i, row in enumerate(samples, 1):
                print(f"  {i}. {row['fixmedins_name']}")
            return True
        except Exception as e:
            print(f"❌ 显示样本数据时出错: {str(e)}")
            return False
    
    def process_table(self):
        """处理目标表的脱敏"""
        print(f"\n🔄 开始处理表: {self.target_table}")
        
        try:
            # 构建地名替换的嵌套REPLACE语句
            name_replace_clause = "fixmedins_name"
            
            # 首先处理关键地名替换
            critical_places = {
                '烟台市': CITY_REPLACEMENT,
                '芝罘区': 'A区县',
                '福山区': 'B区县', 
                '牟平区': 'C区县',
                '莱山区': 'D区县',
                '长岛县': 'E区县',
                '长岛综试区': 'E区县',
                '龙口市': 'F区县',
                '莱阳市': 'G区县',
                '莱州市': 'H区县',
                '蓬莱市': 'I区县',
                '蓬莱区': 'I区县',
                '招远市': 'J区县',
                '栖霞市': 'K区县',
                '海阳市': 'L区县',
                '黄渤海新区': 'M区县'
            }
            
            # 按照地名长度降序排列，确保较长的地名先被替换
            sorted_critical = sorted(critical_places.items(), key=lambda x: len(x[0]), reverse=True)
            
            for place, replacement in sorted_critical:
                name_replace_clause = f"REPLACE({name_replace_clause}, '{place}', '{replacement}')"
            
            # 处理PLACE_NAME_MAPPING中的地名（排除已在critical_places中的）
            additional_places = {k: v for k, v in PLACE_NAME_MAPPING.items() if k not in critical_places}
            sorted_additional = sorted(additional_places.items(), key=lambda x: len(x[0]), reverse=True)
            
            for place, replacement in sorted_additional:
                name_replace_clause = f"REPLACE({name_replace_clause}, '{place}', '{replacement}')"
            
            # 分批处理admda.txt中的词汇，每批处理50个词汇
            batch_size = 50
            admda_items = list(self.admda_mapping.items())
            
            # 过滤出长度大于2的词汇，避免替换太短的常见词
            filtered_admda = [(word, repl) for word, repl in admda_items if len(word) > 2]
            sorted_admda = sorted(filtered_admda, key=lambda x: len(x[0]), reverse=True)
            
            for i in range(0, len(sorted_admda), batch_size):
                batch = sorted_admda[i:i+batch_size]
                # 对每批最多处理10个词汇，避免SQL过长
                for word, replacement in batch[:10]:
                    name_replace_clause = f"REPLACE({name_replace_clause}, '{word}', '{replacement}')"
            
            name_update_query = f"""
            UPDATE {self.target_table}
            SET fixmedins_name = 
                CASE 
                    WHEN fixmedins_name IS NOT NULL AND fixmedins_name != ''
                    THEN {name_replace_clause}
                    ELSE fixmedins_name
                END
            LIMIT 9999999
            """
            
            # 执行name更新
            self.cursor.execute(name_update_query)
            updated_count = self.cursor.rowcount
            self.conn.commit()
            print(f"  ✅ 更新了 {updated_count} 条记录")
            
            self.report['records_updated'] = updated_count
            print(f"✅ 表 {self.target_table} 处理完成")
            return updated_count
            
        except Exception as e:
            if self.conn:
                self.conn.rollback()
            print(f"❌ 处理表 {self.target_table} 时出错: {str(e)}")
            return 0
    
    def verify_result(self, limit=9999999):
        """验证脱敏结果"""
        
        try:
            # 验证是否还有未脱敏的地名
            all_places = set(list(DISTRICT_MAPPING.keys()) + list(PLACE_NAME_MAPPING.keys()) + list(self.admda_mapping.keys()))
            
            # 构建查询以查找包含未脱敏地名的记录
            place_conditions = " OR ".join([f"fixmedins_name LIKE '%{place}%'" for place in all_places])
            verify_query = f"SELECT fixmedins_name FROM {self.target_table} WHERE {place_conditions} LIMIT {limit}"
            
            self.cursor.execute(verify_query)
            problematic_records = self.cursor.fetchall()
            
            if problematic_records:
                print(f"\n⚠️  发现 {len(problematic_records)} 条可能未完全脱敏的记录 (限制显示前{limit}条):")
                for row in problematic_records:
                    print(f"  - {row['fixmedins_name']}")
                return False
            else:
                print(f"\n✅ 验证通过！未发现明显的未脱敏地名")
                return True
                
        except Exception as e:
            print(f"❌ 验证结果时出错: {str(e)}")
            return False
    
    def generate_report(self):
        """生成脱敏报告"""
        self.report['end_time'] = datetime.now()
        
        print("\n" + "="*60)
        print("📊 特定表脱敏报告")
        print("="*60)
        print(f"目标表: {self.target_table}")
        print(f"开始时间: {self.report['start_time'].strftime('%Y-%m-%d %H:%M:%S')}")
        print(f"结束时间: {self.report['end_time'].strftime('%Y-%m-%d %H:%M:%S')}")
        print(f"总耗时: {(self.report['end_time'] - self.report['start_time']).total_seconds():.2f} 秒")
        print(f"更新记录数: {self.report['records_updated']}")
        print(f"模式: 实际运行模式")
        print("="*60)
    
    def run(self):
        """运行数据脱敏工具"""
        print("🚀 特定表脱敏工具启动")
        print(f"目标表: {self.target_table}")
        print(f"模式: 实际运行模式")
        
        if not self.connect_db():
            return False
        
        try:
            # 检查表和字段是否存在
            if not self.check_table_exists() or not self.check_column_exists():
                return False
            
            # 显示样本数据
            self.show_sample_data()
            
            # 处理表
            self.process_table()
            
            # 验证结果
            self.verify_result()
            
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

if __name__ == "__main__":
    # 解析命令行参数
    parser = argparse.ArgumentParser(description='特定表脱敏工具')
    parser.add_argument('--host', type=str, default='localhost', help='数据库主机地址')
    parser.add_argument('--port', type=int, default=3306, help='数据库端口')
    parser.add_argument('--user', type=str, default='root', help='数据库用户名')
    parser.add_argument('--password', type=str, default='root', help='数据库密码')
    parser.add_argument('--db', type=str, default='sc_mds_c', help='数据库名称')
    args = parser.parse_args()
    
    # 创建并运行脱敏工具
    tool = SpecificTableMaskingTool(
        host=args.host,
        port=args.port,
        user=args.user,
        password=args.password,
        db=args.db
    )
    
    success = tool.run()
    
    if success:
        print("\n✅ 特定表脱敏任务完成")
    else:
        print("\n❌ 特定表脱敏任务失败")