import re
import pymysql
from pymysql.cursors import DictCursor
import datetime
import os
import re

class MySQLTableExtractor:
    def __init__(self, host='localhost', port=3306, user='root', password='root', database='sc_mds_c'):
        """初始化数据库连接信息"""
        self.host = host
        self.port = port
        self.user = user
        self.password = password
        self.database = database
        self.connection = None
    
    def connect(self):
        """连接到MySQL数据库"""
        try:
            self.connection = pymysql.connect(
                host=self.host,
                port=self.port,
                user=self.user,
                password=self.password,
                database=self.database,
                charset='utf8mb4',
                cursorclass=DictCursor,
                ssl={'ssl': False},
                connect_timeout=10
            )
            print(f"成功连接到数据库 {self.database}")
        except Exception as e:
            print(f"数据库连接失败: {e}")
            raise
    
    def preprocess_sql(self, sql):
        """预处理SQL语句，移除注释"""
        # 移除单行注释
        sql = re.sub(r'--.*?$', '', sql, flags=re.MULTILINE)
        # 移除多行注释
        sql = re.sub(r'/\*.*?\*/', '', sql, flags=re.DOTALL)
        return sql

    def is_valid_table_name(self, table, keywords):
        """验证表名是否有效"""
        # 移除引号
        table = table.strip('`"\'')
        # 检查是否为关键字
        if table.lower() in keywords:
            return False
        # 检查是否为有效的表名格式
        return bool(re.match(r'^[a-zA-Z_][a-zA-Z0-9_]*(?:\.[a-zA-Z_][a-zA-Z0-9_]*)*$', table))

    def extract_tables_from_sql(self, sql):
        """从SQL语句中提取所有表名，包括嵌套子查询中的表名"""
        if not sql:
            return set()
        
        # 预处理SQL，移除注释
        sql = self.preprocess_sql(sql)
        
        # 转小写以便统一处理
        sql = sql.lower()
        
        # 改进的正则表达式，处理更多情况
        # 匹配各种形式的表引用：
        # 1. 普通表名 (可选带库名前缀)
        # 2. 子查询作为表
        # 3. 视图
        # 4. 带别名的各种写法
        
        # 改进的子查询匹配模式
        subquery_pattern = r'\(\s*select\b[\s\S]*?\bfrom\s+([^\s,\);\.]+(?:\.[^\s,\);]+)?)[\s\S]*?\)'  
        nested_tables = set(re.findall(subquery_pattern, sql, re.DOTALL | re.IGNORECASE))
        
        # 改进的FROM子句匹配模式 - 支持逗号分隔的多个表
        # 1. 先找到FROM关键字后面到WHERE/GROUP BY/ORDER BY等之前的所有内容
        from_clause_pattern = r'\bfrom\b([\s\S]*?)(?:\bwhere\b|\bgroup\s+by\b|\border\s+by\b|\bhaving\b|\bunion\b|$)'
        from_clauses = re.findall(from_clause_pattern, sql, re.IGNORECASE)
        
        main_tables = set()
        # 2. 对每个FROM子句内容，提取用逗号分隔的所有表名
        table_pattern = r'(`?[^`\s,\);\.]+`?(?:\.`?[^`\s,\);\.]+`?)?)\s*(?:as\s+[^,\);\s]+)?'
        
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
        
        # 使用改进的表名验证方法
        filtered_tables = set()
        for table in all_tables:
            if self.is_valid_table_name(table, keywords):
                # 再次移除引号，确保干净的表名
                filtered_table = table.strip('`"\'')
                filtered_tables.add(filtered_table)
        
        return filtered_tables
    
    def get_all_query_tables(self, query_ids=None):
        """从query表中查询query_sql并提取表名"""
        if not self.connection:
            self.connect()
        
        all_tables = set()
        
        try:
            with self.connection.cursor() as cursor:
                # 基本SQL查询语句
                if query_ids:
                    # 如果提供了query_id列表，添加WHERE条件
                    placeholders = ', '.join(['%s'] * len(query_ids))
                    sql = f"SELECT query_sql, query_id FROM query WHERE query_sql IS NOT NULL AND query_sql != '' AND query_id IN ({placeholders})"
                    cursor.execute(sql, query_ids)
                    print(f"已根据query_id列表过滤查询，共{len(query_ids)}个ID")
                else:
                    # 查询所有query_sql
                    sql = "SELECT query_sql, query_id FROM query WHERE query_sql IS NOT NULL AND query_sql != ''"
                    cursor.execute(sql)
                
                results = cursor.fetchall()
                
                total_queries = len(results)
                print(f"共查询到 {total_queries} 条SQL记录")
                
                # 处理每条SQL记录
                for i, row in enumerate(results, 1):
                    if i % 100 == 0 or i == total_queries:
                        print(f"已处理 {i}/{total_queries} 条记录")
                    
                    query_sql = row['query_sql']
                    query_id = row['query_id']
                    try:
                        tables = self.extract_tables_from_sql(query_sql)
                        all_tables.update(tables)
                    except Exception as e:
                        print(f"处理SQL时出错 (query_id: {query_id}): {e}")
                        # 继续处理下一条记录
                        continue
        except Exception as e:
            print(f"查询数据库时出错: {e}")
            raise
        
        return all_tables
    
    def get_query_ids_by_dashboard(self, dashboard_id):
        """根据dashboard_id查询对应的queryId集合"""
        if not self.connection:
            self.connect()
        
        query_ids = []
        try:
            with self.connection.cursor() as cursor:
                sql = """SELECT * FROM (
                SELECT 
                    panel_id, 
                    dashboard_id, 
                    data, 
                   CAST( 
                    TRIM( 
                      BOTH '"' 
                      FROM 
                        SUBSTRING_INDEX( 
                          SUBSTRING_INDEX( 
                            REPLACE(REPLACE(data, ' ', ''), '\n', ''),  -- 清理空格和换行 
                            '"queryId":', 
                            -1 
                          ), 
                          ',', 
                          1 
                        ) 
                    ) AS UNSIGNED 
                  ) AS queryId 
                FROM 
                    panel 
                WHERE 
                    dashboard_id = %s 
                ) a WHERE a.queryId<>0"""
                cursor.execute(sql, (dashboard_id,))
                results = cursor.fetchall()
                
                query_ids = [row['queryId'] for row in results]
                print(f"从dashboard_id={dashboard_id}查询到 {len(query_ids)} 个queryId")
        except Exception as e:
            print(f"根据dashboard_id查询queryId时出错: {e}")
            raise
        
        return query_ids
    
    def close(self):
        """关闭数据库连接"""
        if self.connection:
            self.connection.close()
            print("数据库连接已关闭")

def main(param):
    # 从用户提供的连接串中提取数据库信息
    # jdbc:mysql://localhost:3306/sc_mds_c?serverTimezone=Asia/Shanghai&useUnicode=true&allowPublicKeyRetrieval=true&characterEncoding=UTF-8&allowMultiQueries=false&useSSL=false
    host = 'localhost'
    port = 3306
    user = 'root'
    password = 'root'
    database = 'sc_mds_c'
    
    # 创建表提取器实例
    extractor = MySQLTableExtractor(host=host, port=port, user=user, password=password, database=database)
    
    try:
        # 连接数据库
        extractor.connect()
        
        # 判断输入参数类型
        if isinstance(param, str) and param.strip().isdigit():
            # 如果是dashboard_id字符串
            dashboard_id = param.strip()
            print(f"使用dashboard_id: {dashboard_id} 查询对应的queryId")
            query_ids = extractor.get_query_ids_by_dashboard(dashboard_id)
        elif isinstance(param, list):
            # 如果是query_ids列表
            query_ids = param
            print(f"使用提供的query_ids列表，共{len(query_ids)}个ID")
        else:
            raise ValueError("参数必须是dashboard_id字符串或query_ids列表")
        
        # 获取表名（根据query_id列表过滤）
        all_tables = extractor.get_all_query_tables(query_ids)
        
        # 获取当前日期时间
        current_time = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        
        # 输出结果
        print(f"\n总共提取到 {len(all_tables)} 个唯一表名:")
        for i, table in enumerate(sorted(all_tables), 1):
            print(f"{i}. {table}")
        print(f"\n处理日期: {current_time}")
        
        # 将结果保存到当前文件夹的文本文件中，每次清空文件
        output_file = os.path.join(os.getcwd(), 'extracted_tables.txt')
        with open(output_file, 'w', encoding='utf-8') as f:  # 'w'模式会清空文件
            # 写入日期信息
            f.write(f"===== 表名提取结果 - {current_time} =====\n")
            # 写入查询条件信息
            if isinstance(param, str) and param.strip().isdigit():
                f.write(f"查询条件: 根据dashboard_id={param}\n")
                f.write("query_id列表: " + ", ".join(map(str, query_ids)) + "\n\n")
            else:
                f.write("查询条件: 限制特定query_id\n")
                f.write("query_id列表: " + ", ".join(map(str, query_ids)) + "\n\n")
            # 写入表名列表
            for table in sorted(all_tables):
                f.write(f"{table}\n")
        print(f"\n表名已保存到当前文件夹下的 extracted_tables.txt 文件中")
        print(f"文件路径: {output_file}")
        if isinstance(param, str) and param.strip().isdigit():
            print(f"查询条件: 根据dashboard_id={param}")
            print(f"查询到的query_id总数: {len(query_ids)}")
        else:
            print(f"查询条件: 限制特定query_id")
            print(f"query_id总数: {len(query_ids)}")
        
    finally:
        # 关闭数据库连接
        extractor.close()

# 以下是历史使用的query_id列表，保留供将来参考 

# 用户提供的query_id列表，当前为空列表表示查询所有记录
# 需要限制时取消注释下面的query_id列表并注释空列表 
# 烟台市智慧医保风控管理中心
# query_ids = [86001755, 86001758, 86001759, 86001760, 86001761, 799, 86001962, 86001964, 86001969]

# dashboard_id = '8600115'  ## 烟台市智慧医保风控管理中心
# dashboard_id = '8600122 '   ##  烟台市医保智能监控事前提醒分析
# dashboard_id = '8600134 '   ##  医保大数据反欺诈模型
# dashboard_id = '8600125 '   ##  烟台市医保智能监控事中审核分析
# dashboard_id = '8600149 '   ##  烟台市医保大数据管理和应用体系
# dashboard_id = '8600135 '   ##  医保大数据反欺诈模型
# dashboard_id = '8600150 '   ##  烟台市医保智能监控事后审核分析
dashboard_id = '8400322 '   
if __name__ == "__main__":
    main(dashboard_id)