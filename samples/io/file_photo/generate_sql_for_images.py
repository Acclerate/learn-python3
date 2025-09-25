import os
import re
import pymysql
import random
from pymysql import Error
from datetime import datetime

# 获取当前时间，格式化为指定格式
current_time = datetime.now().strftime('%Y-%m-%d %H:%M:%S')

# 数据库连接配置
DB_CONFIG = {
    'host': 'localhost',
    'port': 3306,
    'database': 'sc_mds_c',  # 用户目标数据库
    'user': 'root',
    'password': 'root',
    'charset': 'utf8mb4'
}

# 图片文件夹路径

IMAGE_FOLDER = r'E:\neusoft\烟台\机构图片上传\20250919莱阳医药机构照片待上传'
# IMAGE_FOLDER = r'E:\neusoft\烟台\机构图片上传\莱州市未上传成功照片待重新上传20250917'
# IMAGE_FOLDER = r'E:\neusoft\烟台\机构图片上传\牟平区未上传成功照片待上传20250915'
# IMAGE_FOLDER = r'E:\neusoft\烟台\高新区医疗机构照片待上传'
# IMAGE_FOLDER = r'E:\neusoft\烟台\龙口定点医药机构照片待上传20250915'
# IMAGE_FOLDER = r'E:\neusoft\烟台\20250909芝罘区38家机构照片'
# IMAGE_FOLDER = r'G:\收集全市定点医药机构图片2\待上传\image'
# SQL输出文件路径
SQL_OUTPUT_FILE = r'd:\privategit\github\learn-python3\samples\io\file_photo\test_output\insert_images.sql'

# 错误日志文件路径
ERROR_LOG_FILE = r'd:\privategit\github\learn-python3\samples\io\file_photo\test_output\error_log.txt'

# 基础URL
BASE_URL = 'http://oss-sc-dr-ytai-ljhsfn-01.oss-cn-jn-sdyb-d01-a.ops.sd.hsip.gov.cn/image/'

# 固定字段值
FIXED_VALUES = {
    'biz_type': '1',
    'crter_id': '1719217133303328248',
    'crter_name': '孙建青',
    'crte_optins_no': 'S37060220081',
    'crte_time': current_time,
    'opter_id': '1719217133303328248',
    'opter_name': '孙建青',
    'optins_no': 'S37060220081',
    'updt_time': current_time,
    'opt_time': current_time,
    'invd_flag': '1'
}

# 生成初始rid值 - 按照格式要求生成随机值
# 格式：前缀37060020 + 当前时间转换部分 + 12位随机数字
def generate_initial_rid():
    prefix = "370602"
    # 当前时间转换部分 (取年份后两位+月+日+时+分+秒的前一位)
    now = datetime.now()
    time_part = now.strftime("%y%m%d%H%M%S")[:12]  # 取前12位
    # 12位随机数字
    random_part = ''.join([str(random.randint(0, 9)) for _ in range(13)])
    # 组合成完整的rid
    return int(prefix + time_part + random_part)

# 初始rid值
INITIAL_RID = generate_initial_rid()


def get_db_connection():
    """建立数据库连接"""
    try:
        connection = pymysql.connect(**DB_CONFIG)
        print("✅ 数据库连接成功")
        return connection
    except Error as e:
        print(f"❌ 数据库连接失败: {str(e)}")
        return None


def get_fixmedins_info(connection):
    """从数据库获取所有医疗机构编码和名称的映射"""
    info_map = {}
    if not connection:
        return info_map

    try:
        with connection.cursor() as cursor:
            sql = "SELECT fixmedins_code, fixmedins_name FROM dwd_jgxx_fcm_fixmedins_b_df_ytai"
            cursor.execute(sql)
            results = cursor.fetchall()
            for row in results:
                code, name = row
                if code and isinstance(code, str):
                    info_map[code.strip()] = name.strip() if name else ''
        print(f"✅ 成功加载 {len(info_map)} 条医疗机构信息")
    except Error as e:
        print(f"❌ 查询数据库失败: {str(e)}")
    finally:
        connection.close()
    return info_map


def extract_medical_code(filename):
    """从文件名提取医疗机构编码
    例如: H370600002_1.jpg -> H370600002
    """
    match = re.match(r'^([^_]+)', filename)
    if match:
        return match.group(1)
    return ''


def generate_sql_statements(image_folder, fixmedins_info):
    """处理图片文件夹并生成SQL插入语句"""
    if not os.path.exists(image_folder):
        print(f"❌ 图片文件夹不存在: {image_folder}")
        return []

    sql_statements = []
    error_logs = []
    current_rid = INITIAL_RID
    success_count = 0
    error_count = 0

    # 图片文件扩展名
    image_extensions = ['.jpg', '.jpeg', '.png', '.gif', '.bmp', '.tiff', '.webp', '.heic']

    for filename in os.listdir(image_folder):
        # 跳过目录，只处理文件
        file_path = os.path.join(image_folder, filename)
        if os.path.isdir(file_path):
            continue

        # 检查文件扩展名是否为图片
        _, ext = os.path.splitext(filename)
        if ext.lower() not in image_extensions:
            error_msg = f"⚠️ 跳过非图片文件: {filename}"
            print(error_msg)
            error_logs.append(f"{datetime.now().strftime('%Y-%m-%d %H:%M:%S')} - {error_msg}")
            error_count += 1
            continue

        # 提取医疗机构编码
        medical_code = extract_medical_code(filename)
        if not medical_code:
            error_msg = f"⚠️ 无法提取医疗机构编码: {filename}"
            print(error_msg)
            error_logs.append(f"{datetime.now().strftime('%Y-%m-%d %H:%M:%S')} - {error_msg}")
            error_count += 1
            continue

        # 查询医疗机构名称
        fixmedins_name = fixmedins_info.get(medical_code, '')
        if not fixmedins_name:
            error_msg = f"⚠️ 未找到对应的医疗机构名称: {filename} (编码: {medical_code})"
            print(error_msg)
            error_logs.append(f"{datetime.now().strftime('%Y-%m-%d %H:%M:%S')} - {error_msg}")
            error_count += 1
            continue

        # 提取文件类型
        filetype = ext[1:].lower()  # 去除点号

        # 构建存储地址
        stog_addr = f'{BASE_URL}{filename}'

        # 构建rid
        rid = current_rid
        current_rid += 1

        # 构建SQL语句
        sql = f"INSERT INTO `sc_mds_db`.`oss_file_uploads` (`file_id`, `oss_id`, `filetype`, `filename`, `stog_addr`, `biz_type`, `rid`, `crter_id`, `crter_name`, `crte_optins_no`, `crte_time`, `opter_id`, `opter_name`, `optins_no`, `updt_time`, `opt_time`, `invd_flag`, `file_code`) VALUES ('{filename}', 'image/{filename}', '{filetype}', '{fixmedins_name}', '{stog_addr}', '{FIXED_VALUES['biz_type']}', '{rid}', '{FIXED_VALUES['crter_id']}', '{FIXED_VALUES['crter_name']}', '{FIXED_VALUES['crte_optins_no']}', '{FIXED_VALUES['crte_time']}', '{FIXED_VALUES['opter_id']}', '{FIXED_VALUES['opter_name']}', '{FIXED_VALUES['optins_no']}', '{FIXED_VALUES['updt_time']}', '{FIXED_VALUES['opt_time']}', '{FIXED_VALUES['invd_flag']}', '{medical_code}');"

        sql_statements.append(sql)
        success_count += 1
        print(f"✅ 生成SQL语句: {filename}")

    print(f"📊 处理完成: 成功 {success_count} 条, 失败 {error_count} 条")
    
    # 如果有错误日志，保存到文件
    if error_logs:
        save_error_log(error_logs)
        
    return sql_statements


def save_sql_to_file(sql_statements, output_file):
    """保存SQL语句到文件"""
    # 确保输出目录存在
    os.makedirs(os.path.dirname(output_file), exist_ok=True)

    try:
        # 先清空文件内容
        open(output_file, 'w', encoding='utf-8').close()
        
        # 然后重新打开文件并写入内容
        with open(output_file, 'w', encoding='utf-8') as f:
            # 写入日志时间
            f.write(f"-- 生成时间: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n\n")
            # 写入SQL语句
            for sql in sql_statements:
                f.write(f"{sql}\n\n")
        print(f"✅ SQL语句已保存至: {output_file}")
    except Exception as e:
        print(f"❌ 保存SQL文件失败: {str(e)}")


def save_error_log(error_logs):
    """保存错误日志到文件"""
    # 确保输出目录存在
    os.makedirs(os.path.dirname(ERROR_LOG_FILE), exist_ok=True)

    try:
        # 先清空文件内容
        open(ERROR_LOG_FILE, 'w', encoding='utf-8').close()
        
        # 然后重新打开文件并写入内容
        with open(ERROR_LOG_FILE, 'w', encoding='utf-8') as f:
            # 写入日志时间
            f.write(f"-- 错误日志生成时间: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n\n")
            # 写入错误日志
            for log in error_logs:
                f.write(f"{log}\n")
        print(f"✅ 错误日志已保存至: {ERROR_LOG_FILE}")
    except Exception as e:
        print(f"❌ 保存错误日志失败: {str(e)}")


def main():
    # 1. 获取数据库连接
    connection = get_db_connection()

    # 2. 从数据库获取医疗机构信息
    fixmedins_info = get_fixmedins_info(connection)
    if not fixmedins_info:
        print("⚠️ 未获取到任何医疗机构信息，程序退出")
        return

    # 3. 生成SQL语句
    sql_statements = generate_sql_statements(IMAGE_FOLDER, fixmedins_info)
    if not sql_statements:
        print("⚠️ 未生成任何SQL语句")
        return

    # 4. 保存SQL语句到文件
    save_sql_to_file(sql_statements, SQL_OUTPUT_FILE)


if __name__ == "__main__":
    main()