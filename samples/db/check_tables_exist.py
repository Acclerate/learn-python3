import pymysql
import os

class MySQLTableChecker:
    def __init__(self, host, port, user, password, database):
        self.host = host
        self.port = port
        self.user = user
        self.password = password
        self.database = database
        self.connection = None
    
    def connect(self):
        """建立数据库连接"""
        try:
            self.connection = pymysql.connect(
                host=self.host,
                port=self.port,
                user=self.user,
                password=self.password,
                database=self.database,
                cursorclass=pymysql.cursors.DictCursor
            )
            print(f"成功连接到数据库: {self.database}")
            return True
        except Exception as e:
            print(f"数据库连接失败: {e}")
            return False
    
    def disconnect(self):
        """关闭数据库连接"""
        if self.connection:
            self.connection.close()
            print("数据库连接已关闭")
    
    def check_table_exists(self, table_name):
        """检查单个表是否存在"""
        if not self.connection:
            print("未连接到数据库")
            return False
        
        try:
            with self.connection.cursor() as cursor:
                sql = """
                SELECT table_name 
                FROM information_schema.tables 
                WHERE table_schema = %s AND table_name = %s
                """
                cursor.execute(sql, (self.database, table_name))
                result = cursor.fetchone()
                return result is not None
        except Exception as e:
            print(f"检查表 {table_name} 时出错: {e}")
            return False
    
    def check_tables_from_file(self, file_path):
        """从文件中读取表名并检查是否存在"""
        if not os.path.exists(file_path):
            print(f"文件不存在: {file_path}")
            return
        
        # 读取文件中的表名
        table_names = []
        with open(file_path, 'r', encoding='utf-8') as f:
            lines = f.readlines()
            # 跳过前3行注释信息，从第4行开始读取表名
            for line in lines[3:]:
                table_name = line.strip()
                if table_name:  # 跳过空行
                    table_names.append(table_name)
        
        print(f"从文件中读取到 {len(table_names)} 个表名")
        
        # 检查每个表是否存在
        exists_count = 0
        not_exists_count = 0
        exists_tables = []
        not_exists_tables = []
        
        for table_name in table_names:
            exists = self.check_table_exists(table_name)
            status = "存在" if exists else "不存在"
            print(f"表 {table_name}: {status}")
            
            if exists:
                exists_count += 1
                exists_tables.append(table_name)
            else:
                not_exists_count += 1
                not_exists_tables.append(table_name)
        
        # 输出统计信息
        print("\n===== 统计结果 =====")
        print(f"总表数: {len(table_names)}")
        print(f"存在的表数: {exists_count}")
        print(f"不存在的表数: {not_exists_count}")
        
        if exists_tables:
            print("\n存在的表列表:")
            for table_name in exists_tables:
                print(f"  + {table_name}")
        
        if not_exists_tables:
            print("\n不存在的表列表:")
            for table_name in not_exists_tables:
                print(f"  - {table_name}")

if __name__ == "__main__":
    # 数据库连接信息
    host = 'localhost'
    port = 3306
    user = 'root'
    password = 'root'
    database = 'sc_mds_c'
    
    # 表名文件路径
    table_file_path = 'd:/privategit/github/learn-python3/extracted_tables.txt'
    
    # 创建表检查器实例
    checker = MySQLTableChecker(host=host, port=port, user=user, password=password, database=database)
    
    try:
        # 连接数据库
        if checker.connect():
            # 检查表是否存在
            checker.check_tables_from_file(table_file_path)
    finally:
        # 断开连接
        checker.disconnect()