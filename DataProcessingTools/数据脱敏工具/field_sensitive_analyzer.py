#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
敏感字段分析器
用于分析SQL文件中的表结构，识别需要脱敏的字段
"""

import re
import os
from collections import defaultdict

class SensitiveFieldAnalyzer:
    """敏感字段分析器类"""
    
    def __init__(self):
        # 定义敏感字段模式
        self.sensitive_patterns = {
            'person_name': {
                'patterns': [r'psn_name', r'crter_name', r'opter_name', r'chfpdr_name', 
                           r'physn_name', r'dr_name', r'nurs_name', r'cert_name',
                           r'atddr_name'],
                'comment_keywords': ['姓名', '人员姓名', '医师名称', '主治医师']
            },
            'id_card': {
                'patterns': [r'certno', r'id_no', r'card_no', r'psn_certno'],
                'comment_keywords': ['证件号码', '身份证号', '身份证号码']
            },
            'phone': {
                'patterns': [r'tel', r'phone', r'mobile', r'contact_tel'],
                'comment_keywords': ['联系电话', '手机号', '电话']
            },
            'org_name': {
                'patterns': [r'fixmedins_name', r'insu_emp_name', r'medins_name',
                           r'optins_name', r'crte_optins_name'],
                'comment_keywords': ['机构名称', '单位名称', '医疗机构名称']
            },
            'person_id': {
                'patterns': [r'psn_no', r'psn_id', r'crter_id', r'opter_id',
                           r'chfpdr_code', r'physn_code'],
                'comment_keywords': ['人员编号', '人员ID', '医师编码']
            },
            'address': {
                'patterns': [r'resd_regn', r'address', r'addr'],
                'comment_keywords': ['地址', '户口所在地', '居住地']
            },
            'medical_record': {
                'patterns': [r'mdtrt_id', r'mdtrt_sn', r'mdtrt_cert_no'],
                'comment_keywords': ['就诊ID', '就诊流水号', '就诊凭证']
            }
        }
    
    def parse_sql_file(self, file_path):
        """简化版解析SQL文件，直接提取表名和字段信息"""
        if not os.path.exists(file_path):
            print(f"错误：文件 {file_path} 不存在")
            return {}
        
        tables = {}
        
        try:
            print(f"开始读取并解析文件: {file_path}")
            
            # 使用简单的逐行解析方式
            current_table = None
            current_fields = []
            in_table_definition = False
            line_count = 0
            table_count = 0
            
            with open(file_path, 'r', encoding='utf-8') as f:
                for line in f:
                    line_count += 1
                    
                    # 显示进度
                    if line_count % 1000 == 0:
                        print(f"已处理 {line_count} 行...")
                    
                    line = line.strip()
                    
                    # 检查是否是表定义的开始
                    if line.upper().startswith('CREATE TABLE'):
                        # 如果已经在处理另一个表，先保存
                        if current_table and current_fields:
                            tables[current_table] = current_fields
                            print(f"保存表 {current_table}，包含 {len(current_fields)} 个字段")
                            table_count += 1
                        
                        # 提取表名
                        table_name_match = re.search(r'`([^`]+)`', line)
                        if table_name_match:
                            current_table = table_name_match.group(1)
                            current_fields = []
                            in_table_definition = True
                            print(f"[{line_count}] 找到表: {current_table}")
                    
                    # 检查表定义是否结束
                    if in_table_definition and (';' in line or line == ')'):
                        tables[current_table] = current_fields
                        print(f"[{line_count}] 表 {current_table} 解析完成，包含 {len(current_fields)} 个字段")
                        in_table_definition = False
                        table_count += 1
                        current_table = None
                        current_fields = []
                    
                    # 如果在表定义内部，处理字段行
                    if in_table_definition and line and not line.startswith(('CREATE TABLE', 'PRIMARY KEY', 'KEY', 'UNIQUE KEY', 'CONSTRAINT', ')')):
                        # 提取字段名
                        field_name_match = re.search(r'`([^`]+)`', line)
                        if field_name_match:
                            field_name = field_name_match.group(1)
                            
                            # 提取字段类型
                            field_type = 'UNKNOWN'
                            if '`' in line and line.find('`') < len(line) - 1:
                                parts = line.split('`')
                                if len(parts) > 2:
                                    type_part = parts[2].strip()
                                    if type_part:
                                        # 提取第一个单词作为类型
                                        field_type = type_part.split()[0].upper()
                            
                            # 提取注释
                            field_comment = ''
                            if 'COMMENT' in line.upper():
                                parts = line.split('COMMENT', 1)
                                if len(parts) > 1:
                                    comment_part = parts[1].strip()
                                    # 处理单引号或双引号
                                    for quote in ['"', "'"]:
                                        if comment_part.startswith(quote):
                                            if quote in comment_part[1:]:
                                                field_comment = comment_part.split(quote, 2)[1]
                                                break
                            
                            current_fields.append((field_name, field_type, field_comment))
            
            # 确保最后一个表也被保存
            if current_table and current_fields:
                tables[current_table] = current_fields
                table_count += 1
            
            print(f"\n解析完成，总共处理 {line_count} 行，找到并保存 {len(tables)} 个表")
            
            # 打印一些表的详细信息作为验证
            if tables:
                print("\n前3个表的字段信息：")
                for i, (table_name, fields) in enumerate(list(tables.items())[:3]):
                    print(f"\n{i+1}. 表 {table_name} 包含 {len(fields)} 个字段")
                    print("  前5个字段:")
                    for field in fields[:5]:
                        print(f"    - {field[0]} ({field[1]}): {field[2]}")
            
        except Exception as e:
            print(f"解析文件时出错：{e}")
            import traceback
            traceback.print_exc()
            return {}
        
        return tables
    
    def is_sensitive_field(self, field_name, field_comment):
        """判断字段是否为敏感字段"""
        field_name_lower = field_name.lower()
        
        # 更宽松的敏感字段检测，基于关键字匹配
        # 姓名相关
        name_keywords = ['name', '姓名', '医师', '医生', '护士', '经办人', '创建人']
        for keyword in name_keywords:
            if keyword.lower() in field_name_lower or keyword in field_comment:
                return 'person_name'
        
        # 身份证相关
        id_keywords = ['certno', 'id_no', '身份证', '证件号', '证书号']
        for keyword in id_keywords:
            if keyword.lower() in field_name_lower or keyword in field_comment:
                return 'id_card'
        
        # 手机号相关
        phone_keywords = ['tel', 'phone', 'mobile', '电话', '手机号']
        for keyword in phone_keywords:
            if keyword.lower() in field_name_lower or keyword in field_comment:
                return 'phone'
        
        # 机构名称相关
        org_keywords = ['org', '机构', '单位', '医院', 'medical']
        for keyword in org_keywords:
            if keyword.lower() in field_name_lower or keyword in field_comment:
                return 'org_name'
        
        # 地址相关
        address_keywords = ['addr', '地址', '居住地', '户口']
        for keyword in address_keywords:
            if keyword.lower() in field_name_lower or keyword in field_comment:
                return 'address'
        
        # 人员ID相关
        person_id_keywords = ['psn_id', 'person_id', '人员编号', '人员ID']
        for keyword in person_id_keywords:
            if keyword.lower() in field_name_lower or keyword in field_comment:
                return 'person_id'
        
        # 医疗记录相关
        medical_keywords = ['mdtrt', '就诊', '病历', '处方']
        for keyword in medical_keywords:
            if keyword.lower() in field_name_lower or keyword in field_comment:
                return 'medical_record'
        
        return None
    
    def analyze_sensitive_fields(self, tables):
        """分析所有表中的敏感字段"""
        sensitive_fields = defaultdict(list)
        category_stats = defaultdict(int)
        
        for table_name, fields in tables.items():
            for field_name, field_type, field_comment in fields:
                category = self.is_sensitive_field(field_name, field_comment)
                if category:
                    sensitive_fields[table_name].append({
                        'field_name': field_name,
                        'field_type': field_type,
                        'field_comment': field_comment,
                        'category': category
                    })
                    category_stats[category] += 1
        
        return sensitive_fields, category_stats
    
    def generate_masking_rules(self, sensitive_fields):
        """生成脱敏规则"""
        masking_rules = {}
        
        for table_name, fields in sensitive_fields.items():
            table_rules = []
            for field_info in fields:
                field_name = field_info['field_name']
                category = field_info['category']
                
                # 根据类别生成不同的脱敏规则，只混淆尾部三分之一内容
                if category == 'person_name':
                    # 姓名脱敏：保留姓和中间部分，只混淆尾部三分之一
                    rule = f"UPDATE {table_name} SET {field_name} = CASE WHEN LENGTH({field_name}) <= 2 THEN CONCAT(SUBSTR({field_name}, 1, 1), '*') WHEN LENGTH({field_name}) <= 4 THEN CONCAT(SUBSTR({field_name}, 1, 2), '*') ELSE CONCAT(SUBSTR({field_name}, 1, CEIL(LENGTH({field_name}) * 2/3)), REPEAT('*', FLOOR(LENGTH({field_name}) * 1/3))) END;"
                elif category == 'id_card':
                    # 身份证号脱敏：保留大部分，只混淆尾部三分之一
                    rule = f"UPDATE {table_name} SET {field_name} = CASE WHEN LENGTH({field_name}) <= 10 THEN CONCAT(SUBSTR({field_name}, 1, 7), REPEAT('*', LENGTH({field_name}) - 7)) ELSE CONCAT(SUBSTR({field_name}, 1, CEIL(LENGTH({field_name}) * 2/3)), REPEAT('*', FLOOR(LENGTH({field_name}) * 1/3))) END;"
                elif category == 'phone':
                    # 手机号脱敏：保留前3位和中间部分，只混淆尾部三分之一
                    rule = f"UPDATE {table_name} SET {field_name} = CASE WHEN LENGTH({field_name}) <= 8 THEN CONCAT(SUBSTR({field_name}, 1, 5), REPEAT('*', LENGTH({field_name}) - 5)) ELSE CONCAT(SUBSTR({field_name}, 1, CEIL(LENGTH({field_name}) * 2/3)), REPEAT('*', FLOOR(LENGTH({field_name}) * 1/3))) END;"
                elif category == 'org_name':
                    # 机构名称脱敏：保留大部分，只混淆尾部三分之一
                    rule = f"UPDATE {table_name} SET {field_name} = CASE WHEN LENGTH({field_name}) <= 5 THEN CONCAT(SUBSTR({field_name}, 1, 3), REPEAT('*', LENGTH({field_name}) - 3)) ELSE CONCAT(SUBSTR({field_name}, 1, CEIL(LENGTH({field_name}) * 2/3)), REPEAT('*', FLOOR(LENGTH({field_name}) * 1/3))) END;"
                elif category == 'person_id':
                    # 人员编号脱敏：保留大部分，只混淆尾部三分之一
                    rule = f"UPDATE {table_name} SET {field_name} = CASE WHEN LENGTH({field_name}) <= 8 THEN CONCAT(SUBSTR({field_name}, 1, 5), REPEAT('*', LENGTH({field_name}) - 5)) ELSE CONCAT(SUBSTR({field_name}, 1, CEIL(LENGTH({field_name}) * 2/3)), REPEAT('*', FLOOR(LENGTH({field_name}) * 1/3))) END;"
                elif category == 'address':
                    # 地址脱敏：保留大部分，只混淆尾部三分之一
                    rule = f"UPDATE {table_name} SET {field_name} = CASE WHEN LENGTH({field_name}) <= 10 THEN CONCAT(SUBSTR({field_name}, 1, 7), REPEAT('*', LENGTH({field_name}) - 7)) ELSE CONCAT(SUBSTR({field_name}, 1, CEIL(LENGTH({field_name}) * 2/3)), REPEAT('*', FLOOR(LENGTH({field_name}) * 1/3))) END;"
                elif category == 'medical_record':
                    # 就诊信息脱敏：保留大部分，只混淆尾部三分之一
                    rule = f"UPDATE {table_name} SET {field_name} = CASE WHEN LENGTH({field_name}) <= 8 THEN CONCAT(SUBSTR({field_name}, 1, 5), REPEAT('*', LENGTH({field_name}) - 5)) ELSE CONCAT(SUBSTR({field_name}, 1, CEIL(LENGTH({field_name}) * 2/3)), REPEAT('*', FLOOR(LENGTH({field_name}) * 1/3))) END;"
                else:
                    # 默认脱敏规则：只混淆尾部三分之一
                    rule = f"UPDATE {table_name} SET {field_name} = CASE WHEN LENGTH({field_name}) <= 6 THEN CONCAT(SUBSTR({field_name}, 1, 4), REPEAT('*', LENGTH({field_name}) - 4)) ELSE CONCAT(SUBSTR({field_name}, 1, CEIL(LENGTH({field_name}) * 2/3)), REPEAT('*', FLOOR(LENGTH({field_name}) * 1/3))) END;"
                
                table_rules.append({
                    'field': field_name,
                    'category': category,
                    'rule': rule
                })
            
            if table_rules:
                masking_rules[table_name] = table_rules
        
        return masking_rules
    
    def print_sensitive_fields_report(self, sensitive_fields, category_stats):
        """打印敏感字段报告"""
        print("=" * 80)
        print("敏感字段分析报告")
        print("=" * 80)
        
        # 打印类别统计
        print("\n[敏感字段类别统计]")
        print("-" * 40)
        for category, count in category_stats.items():
            print(f"{category}: {count} 个字段")
        
        # 打印详细字段信息
        print("\n[详细敏感字段列表]")
        print("-" * 80)
        print(f"{'表名':<40} {'字段名':<30} {'类型':<10} {'类别':<20}")
        print("-" * 80)
        
        for table_name, fields in sensitive_fields.items():
            for field_info in fields:
                print(f"{table_name:<40} {field_info['field_name']:<30} {field_info['field_type']:<10} {field_info['category']:<20}")
        
        print("-" * 80)
        print(f"总计发现 {sum(category_stats.values())} 个敏感字段，分布在 {len(sensitive_fields)} 个表中")
    
    def save_masking_rules_to_file(self, masking_rules, output_file):
        """保存脱敏规则到文件"""
        try:
            with open(output_file, 'w', encoding='utf-8') as f:
                f.write("-- 自动生成的数据脱敏SQL脚本\n")
                f.write("-- 生成时间: 由敏感字段分析器自动生成\n\n")
                
                for table_name, rules in masking_rules.items():
                    f.write(f"-- 表: {table_name}\n")
                    for rule_info in rules:
                        f.write(f"-- {rule_info['field']} ({rule_info['category']})\n")
                        f.write(f"{rule_info['rule']}\n")
                    f.write("\n")
                
            print(f"\n脱敏规则已保存到: {output_file}")
        except Exception as e:
            print(f"保存脱敏规则文件时出错: {e}")
    
    def run_analysis(self, sql_file_path, output_rules_file=None):
        """运行完整分析流程"""
        print(f"开始分析文件: {sql_file_path}")
        
        # 解析SQL文件
        tables = self.parse_sql_file(sql_file_path)
        if not tables:
            print("没有找到有效的表结构信息")
            return
        
        print(f"成功解析到 {len(tables)} 个表的结构")
        
        # 分析敏感字段
        sensitive_fields, category_stats = self.analyze_sensitive_fields(tables)
        
        # 打印报告
        self.print_sensitive_fields_report(sensitive_fields, category_stats)
        
        # 生成并保存脱敏规则
        if sensitive_fields:
            masking_rules = self.generate_masking_rules(sensitive_fields)
            
            if output_rules_file:
                self.save_masking_rules_to_file(masking_rules, output_rules_file)
            else:
                # 生成默认输出文件名
                base_name = os.path.splitext(sql_file_path)[0]
                output_rules_file = f"{base_name}_masking_rules.sql"
                self.save_masking_rules_to_file(masking_rules, output_rules_file)
        
        return sensitive_fields, category_stats


if __name__ == "__main__":
    # 示例用法
    sql_file = "d:/IdeaProjects/ytai/hsa-sana-neu-yt-sql/数据处理工具/数据脱敏工具/sc_mds_c.sql"
    output_file = "d:/IdeaProjects/ytai/hsa-sana-neu-yt-sql/数据处理工具/数据脱敏工具/generated_masking_rules.sql"
    
    analyzer = SensitiveFieldAnalyzer()
    analyzer.run_analysis(sql_file, output_file)