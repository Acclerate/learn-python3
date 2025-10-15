import re
import pymysql
from pymysql.cursors import DictCursor
import datetime
import os

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
        
        # 改进的FROM子句匹配模式
        from_pattern = r'\bfrom\s+(`?[^`\s,\);\.]+`?(?:\.`?[^`\s,\);\.]+`?)?)\s*(?:as\s+)?[^,\);]*'
        main_tables = set(re.findall(from_pattern, sql, re.IGNORECASE))
        
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
    
    def get_all_query_tables(self):
        """从query表中查询所有query_sql并提取表名"""
        if not self.connection:
            self.connect()
        
        all_tables = set()
        
        try:
            with self.connection.cursor() as cursor:
                # 查询query表中的所有query_sql
                sql = "SELECT query_sql FROM query WHERE query_sql IS NOT NULL AND query_sql != ''"
                cursor.execute(sql)
                results = cursor.fetchall()
                
                total_queries = len(results)
                print(f"共查询到 {total_queries} 条SQL记录")
                
                # 处理每条SQL记录
                for i, row in enumerate(results, 1):
                    if i % 100 == 0 or i == total_queries:
                        print(f"已处理 {i}/{total_queries} 条记录")
                        
                    query_sql = row['query_sql']
                    try:
                        tables = self.extract_tables_from_sql(query_sql)
                        all_tables.update(tables)
                    except Exception as e:
                        print(f"处理SQL时出错 (记录 {i}): {e}")
                        # 继续处理下一条记录
                        continue
        except Exception as e:
            print(f"查询数据库时出错: {e}")
            raise
        
        return all_tables
    
    def close(self):
        """关闭数据库连接"""
        if self.connection:
            self.connection.close()
            print("数据库连接已关闭")

def main():
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
        
        # 获取所有表名
        all_tables = extractor.get_all_query_tables()
        
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
            # 写入表名列表
            for table in sorted(all_tables):
                f.write(f"{table}\n")
        print(f"\n表名已保存到当前文件夹下的 extracted_tables.txt 文件中")
        print(f"文件路径: {output_file}")
        
    finally:
        # 关闭数据库连接
        extractor.close()

if __name__ == "__main__":
    main()