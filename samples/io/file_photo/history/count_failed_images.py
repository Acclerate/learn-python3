import os
import re
import pymysql
from pymysql import Error
from datetime import datetime

# 数据库连接配置
DB_CONFIG = {
    'host': 'localhost',
    'port': 3306,
    'database': 'sc_mds_c',  # 修改为正确的数据库名称
    'user': 'root',
    'password': 'root',
    'charset': 'utf8mb4'
}

# 图片文件夹路径
IMAGE_FOLDER = r'G:\收集全市定点医药机构图片2\待上传\image'
# 输出文件路径
OUTPUT_FILE = r'd:\privategit\github\learn-python3\samples\io\file_photo\test_output\imageErro.txt.txt'


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


def extract_medical_code(filename):
    """从文件名提取医疗机构编码"""
    match = re.match(r'^([^_]+)', filename)
    if match:
        return match.group(1)
    return ''


def count_failed_images(image_folder, codes):
    """统计处理失败的图片数量"""
    if not os.path.exists(image_folder):
        print(f"❌ 图片文件夹不存在: {image_folder}")
        return [], 0, 0

    failed_files = []
    total_count = 0
    success_count = 0

    # 图片文件扩展名
    image_extensions = ['.jpg', '.jpeg', '.png', '.gif', '.bmp', '.tiff', '.webp', '.heic']

    for filename in os.listdir(image_folder):
        total_count += 1
        file_path = os.path.join(image_folder, filename)

        # 跳过目录
        if os.path.isdir(file_path):
            failed_files.append((filename, "跳过: 是目录"))
            continue

        # 检查文件扩展名
        _, ext = os.path.splitext(filename)
        if ext.lower() not in image_extensions:
            failed_files.append((filename, "失败: 非图片文件"))
            continue

        # 提取医疗机构编码
        medical_code = extract_medical_code(filename)
        if not medical_code:
            failed_files.append((filename, "失败: 无法提取医疗机构编码"))
            continue

        # 检查编码是否在数据库中
        if medical_code not in codes:
            failed_files.append((filename, f"失败: 医疗机构编码不存在 ({medical_code})"))
            continue

        # 处理成功
        success_count += 1

    failed_count = len(failed_files)
    print(f"📊 统计结果: 总文件数 {total_count}, 成功 {success_count}, 失败 {failed_count}")
    return failed_files, failed_count, total_count


def write_results_to_file(failed_files, failed_count, total_count, output_file):
    """将统计结果写入文件"""
    # 确保输出目录存在
    os.makedirs(os.path.dirname(output_file), exist_ok=True)

    try:
        with open(output_file, 'w', encoding='utf-8') as f:
            # 写入日期
            current_time = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
            f.write(f"📅 统计日期: {current_time}\n\n")

            # 写入总结信息
            f.write(f"==================== 统计结果 ===================-\n")
            f.write(f"总文件数: {total_count}\n")
            f.write(f"成功处理: {total_count - failed_count}\n")
            f.write(f"处理失败: {failed_count}\n\n")

            # 写入失败文件列表
            if failed_files:
                f.write("==================== 失败文件列表 ===================-\n")
                for i, (filename, reason) in enumerate(failed_files, 1):
                    f.write(f"  {i}. {filename} - {reason}\n")
            else:
                f.write("没有失败的文件\n")

        print(f"✅ 统计结果已保存至: {output_file}")
    except Exception as e:
        print(f"❌ 保存统计结果失败: {str(e)}")


def main():
    # 1. 获取数据库连接
    connection = get_db_connection()

    # 2. 从数据库获取医疗机构编码
    codes = get_fixmedins_codes(connection)
    if not codes:
        print("⚠️ 未获取到任何医疗机构编码，程序退出")
        return

    # 3. 统计失败的图片
    failed_files, failed_count, total_count = count_failed_images(IMAGE_FOLDER, codes)

    # 4. 将结果写入文件
    write_results_to_file(failed_files, failed_count, total_count, OUTPUT_FILE)


if __name__ == "__main__":
    main()