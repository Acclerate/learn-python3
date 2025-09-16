import os
import re
import pymysql
from pymysql import Error
from datetime import datetime

# 数据库连接配置
DB_CONFIG = {
    'host': 'localhost',
    'port': 3306,
    'database': 'sc_mds_c',
    'user': 'root',
    'password': 'root',
    'charset': 'utf8mb4'
}

def get_db_connection():
    """建立数据库连接"""
    try:
        connection = pymysql.connect(**DB_CONFIG)
        print("✅ 数据库连接成功")
        return connection
    except Error as e:
        print(f"❌ 数据库连接失败: {str(e)}")
        return None

def get_fixmedins_codes(connection):
    """从数据库获取所有fixmedins_code"""
    codes = set()
    if not connection:
        return codes

    try:
        with connection.cursor() as cursor:
            sql = "SELECT fixmedins_code FROM dwd_jgxx_fcm_fixmedins_b_df_ytai"
            cursor.execute(sql)
            results = cursor.fetchall()
            for row in results:
                code = row[0]
                if code and isinstance(code, str):
                    codes.add(code.strip())
        print(f"✅ 成功加载 {len(codes)} 条fixmedins_code记录")
    except Error as e:
        print(f"❌ 查询数据库失败: {str(e)}")
    finally:
        connection.close()
    return codes

def extract_filename_prefix(filename):
    """从文件名提取下划线前的前缀部分"""
    match = re.match(r'^([^_]+)', filename)
    if match:
        return match.group(1)
    return filename  # 如果没有下划线则返回完整文件名

def process_image_folder(folder_path, codes):
    """处理图片文件夹，匹配文件名前缀与数据库code"""
    if not os.path.exists(folder_path):
        print(f"❌ 图片文件夹不存在: {folder_path}")
        return [], []

    matched_files = []
    unmatched_files = []

    for filename in os.listdir(folder_path):
        # 跳过目录，只处理文件
        if os.path.isdir(os.path.join(folder_path, filename)):
            continue
        
        prefix = extract_filename_prefix(filename)
        if prefix in codes:
            matched_files.append((filename, prefix))
        else:
            unmatched_files.append((filename, prefix))

    return matched_files, unmatched_files

def print_matching_results(matched, unmatched, output_file):
    """打印匹配结果到文件并包含日志时间"""
    # 确保输出目录存在
    os.makedirs(os.path.dirname(output_file), exist_ok=True)
    
    with open(output_file, 'w', encoding='utf-8') as f:
        # 写入日志时间
        f.write(f"📅 日志时间：{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n\n")
        
        # 写入匹配结果
        f.write("==================== 匹配结果 ====================\n")
        f.write(f"✅ 共匹配成功 {len(matched)} 个文件\n")
        for i, (filename, code) in enumerate(matched, 1):
            f.write(f"  {i}. {filename} -> 匹配代码: {code}\n")

        f.write(f"\n❌ 共匹配失败 {len(unmatched)} 个文件\n")
        # 打印所有未匹配文件，移除数量限制
        for i, (filename, prefix) in enumerate(unmatched, 1):
            f.write(f"  {i}. {filename} -> 前缀: {prefix}\n")
        
        # 移除剩余未显示文件的提示

    print(f"✅ 匹配结果已保存至: {output_file}")

def main():
    # 1. 获取数据库连接
    connection = get_db_connection()
    
    # 2. 从数据库获取fixmedins_code集合
    codes = get_fixmedins_codes(connection)
    if not codes:
        print("⚠️ 未获取到任何fixmedins_code数据，程序退出")
        return
    
    # 3. 处理图片文件夹
    image_folder = r'G:\收集全市定点医药机构图片2\图片列表'
    matched, unmatched = process_image_folder(image_folder, codes)
    
    # 4. 打印匹配结果到文件
    output_file = r'd:\privategit\github\learn-python3\samples\io\file_photo\test_output\listC.txt'
    print_matching_results(matched, unmatched, output_file)

if __name__ == "__main__":
    main()