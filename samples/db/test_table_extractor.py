import re

# 测试修改后的表提取功能

# 模拟MySQLTableExtractor类中的extract_tables_from_sql方法

def test_extract_tables():
    # 测试SQL语句，包含逗号分隔的多个表
    test_sql = """
    SELECT a.*, b.* 
    FROM ads_znjg_ipt_abn_risk_sum_e_mf_ytai a 
    , ads_znjg_ipt_abn_risk_rgst_detl_d_mf_ytai b
    WHERE a.id = b.id
    """
    
    # 预处理SQL
    sql = test_sql.lower()
    
    # 改进的子查询匹配模式
    subquery_pattern = r'\(\s*select\b[\s\S]*?\bfrom\s+([^\s,\);\.]+(?:\.[^\s,\);]+)?)[\s\S]*?\)'  
    nested_tables = set(re.findall(subquery_pattern, sql, re.DOTALL | re.IGNORECASE))
    
    # 改进的FROM子句匹配模式 - 支持逗号分隔的多个表
    # 1. 先找到FROM关键字后面到WHERE/GROUP BY/ORDER BY等之前的所有内容
    from_clause_pattern = r'\bfrom\b([\s\S]*?)(?:\bwhere\b|\bgroup\s+by\b|\border\s+by\b|\bhaving\b|\bunion\b|$)'
    from_clauses = re.findall(from_clause_pattern, sql, re.IGNORECASE)
    
    main_tables = set()
    # 2. 对每个FROM子句内容，提取用逗号分隔的所有表名
    table_pattern = r'(`?[^`\s,\);\.]+`?(?:\.`?[^`\s,\);\.]+`?)?)(?:\s+(?:as\s+)?)?[^,\);]*'
    
    for clause in from_clauses:
        # 提取每个FROM子句中的所有表名
        tables = re.findall(table_pattern, clause)
        main_tables.update(filter(None, tables))
    
    # 改进的JOIN子句匹配模式
    join_pattern = r'\b(?:left|right|inner|outer|full|cross|natural)?\s*join\s+(`?[^`\s,\);\.]+`?(?:\.`?[^`\s,\);\.]+`?)?)\s*(?:as\s+)?[^,\);]*'
    join_tables = set(re.findall(join_pattern, sql, re.IGNORECASE))
    
    # 合并并去重表名
    all_tables = nested_tables.union(main_tables).union(join_tables)
    
    # 扩展关键字列表
    keywords = {
        'dual', 'select', 'from', 'where', 'join', 'on', 
        'and', 'or', 'group', 'by', 
        'order', 'limit', 'offset', 'having', 'distinct', 
        'as', 'case', 'when', 
        'then', 'else', 'end', 'union', 'all', 'insert', 
        'update', 'delete', 'create', 
        'drop', 'alter', 'truncate', 'with', 'exists', 'not', 
        'in', 'between', 'like', 
        'is', 'null', 'true', 'false', 'natural', 'using'
    }
    
    # 模拟is_valid_table_name方法
    def is_valid_table_name(table, keywords):
        # 移除引号
        table = table.strip('`"\'')
        # 检查是否为关键字
        if table.lower() in keywords:
            return False
        # 检查是否为有效的表名格式
        return bool(re.match(r'^[a-zA-Z_][a-zA-Z0-9_]*(?:\.[a-zA-Z_][a-zA-Z0-9_]*)?$', table))
    
    # 使用改进的表名验证方法
    filtered_tables = set()
    for table in all_tables:
        if is_valid_table_name(table, keywords):
            # 再次移除引号，确保干净的表名
            filtered_table = table.strip('`"\'')
            filtered_tables.add(filtered_table)
    
    print("提取到的表名:")
    for table in filtered_tables:
        print(f"- {table}")
    
    # 验证是否提取到了两个表
    expected_tables = {
        'ads_znjg_ipt_abn_risk_sum_e_mf_ytai',
        'ads_znjg_ipt_abn_risk_rgst_detl_d_mf_ytai'
    }
    
    if filtered_tables == expected_tables:
        print("\n测试通过! 成功提取到了逗号分隔的多个表")
    else:
        print("\n测试失败! 未能正确提取所有表")
        print(f"期望的表: {expected_tables}")
        print(f"实际提取的表: {filtered_tables}")

if __name__ == "__main__":
    test_extract_tables()