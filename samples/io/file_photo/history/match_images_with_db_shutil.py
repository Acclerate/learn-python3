import os
import re
import shutil
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
    """从数据库获取fixmedins_code及其对应的lnt和lat拼接字符串"""
    code_map = {}
    if not connection:
        return code_map

    try:
        with connection.cursor() as cursor:
            sql = "SELECT fixmedins_code, lnt, lat FROM dwd_jgxx_fcm_fixmedins_b_df_ytai"
            cursor.execute(sql)
            results = cursor.fetchall()
            for row in results:
                code = row[0]
                lnt = row[1]
                lat = row[2]
                if code and isinstance(code, str):
                    # 处理lnt和lat，去除逗号和小数点后拼接
                    processed_lnt = str(lnt).replace(',', '').replace('.', '') if lnt is not None else ''
                    processed_lat = str(lat).replace(',', '').replace('.', '') if lat is not None else ''
                    combined = processed_lnt + processed_lat
                    code_map[code.strip()] = combined
        print(f"✅ 成功加载 {len(code_map)} 条fixmedins_code记录")
    except Error as e:
        print(f"❌ 查询数据库失败: {str(e)}")
    finally:
        connection.close()
    return code_map

def extract_filename_prefix(filename):
    """从文件名提取下划线前的前缀部分"""
    match = re.match(r'^([^_]+)', filename)
    if match:
        return match.group(1)
    return filename  # 如果没有下划线则返回完整文件名

def process_image_folder(folder_path, code_map):
    """处理图片文件夹，匹配文件名前缀与数据库code并生成新文件名"""
    if not os.path.exists(folder_path):
        print(f"❌ 图片文件夹不存在: {folder_path}")
        return [], []

    matched_files = []  # (old_filename, new_filename)
    unmatched_files = []

    for filename in os.listdir(folder_path):
        file_path = os.path.join(folder_path, filename)
        if os.path.isdir(file_path):
            continue
        
        prefix = extract_filename_prefix(filename)
        if prefix in code_map:
            combined_str = code_map[prefix]
            # 替换文件名中的前缀部分（只替换第一个出现的前缀）
            new_filename = filename.replace(prefix, combined_str, 1)
            matched_files.append((filename, new_filename))
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
        for i, (old_filename, new_filename) in enumerate(matched, 1):
            f.write(f"  {i}. {old_filename} -> {new_filename}\n")

        f.write(f"\n❌ 共匹配失败 {len(unmatched)} 个文件\n")
        # 打印所有未匹配文件
        for i, (filename, prefix) in enumerate(unmatched, 1):
            f.write(f"  {i}. {filename} -> 前缀: {prefix}\n")
    
    print(f"✅ 匹配结果已保存至: {output_file}")

def main():
    # 1. 获取数据库连接
    connection = get_db_connection()
    
    # 2. 从数据库获取fixmedins_code及其对应的拼接字符串
    code_map = get_fixmedins_codes(connection)
    if not code_map:
        print("⚠️ 未获取到任何fixmedins_code数据，程序退出")
        return
    
    # 3. 处理图片文件夹
    image_folder = r'G:\收集全市定点医药机构图片2\图片列表'
    target_folder = r'G:\收集全市定点医药机构图片2\待上传'
    os.makedirs(target_folder, exist_ok=True)  # 确保目标文件夹存在
    
    matched, unmatched = process_image_folder(image_folder, code_map)
    
    # 4. 移动并重命名匹配的文件
    for old_filename, new_filename in matched:
        old_path = os.path.join(image_folder, old_filename)
        new_path = os.path.join(target_folder, new_filename)
        try:
            shutil.move(old_path, new_path)
            print(f"✅ 已移动: {old_filename} -> {new_filename}")
        except Exception as e:
            print(f"❌ 移动文件失败 {old_filename}: {str(e)}")
    
    # 5. 打印匹配结果到文件
    output_file = r'd:\privategit\github\learn-python3\samples\io\file_photo\test_output\listD.txt'
    print_matching_results(matched, unmatched, output_file)

if __name__ == "__main__":
    main()