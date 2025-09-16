from odps import ODPS
from datetime import datetime
import re


def sanitize_string(value):
    """清理字符串值，转义单引号并处理空值"""
    if value is None:
        return "''"
    # 转义单引号
    sanitized = str(value).replace("'", "''")
    return f"'{sanitized}'"


def get_hierarchy_level(table_name):
    lower_name = table_name.lower()
    if "stg" in lower_name:
        return "STG"
    elif "ods" in lower_name:
        return "ODS"
    elif "dwd" in lower_name:
        return "DWD"
    elif "dws" in lower_name:
        return "DWS"
    elif "ads" in lower_name:
        return "ADS"
    else:
        return "METADATA"


def get_update_frequency(table_name):
    lower_name = table_name.lower()
    if "di" in lower_name:
        return ("1", "每日新增")  # 返回数值和中文描述
    elif "df" in lower_name:
        return ("2", "每日全量")
    elif "mi" in lower_name:
        return ("3", "每月新增")
    elif "mf" in lower_name:
        return ("4", "每月全量")
    elif "yf" in lower_name:
        return ("5", "每年全量")
    elif "yi" in lower_name:
        return ("6", "每年新增")
    else:
        return ("", "")


def get_table_count(odps, table_name):
    """获取表行数"""
    count_sql = f"SELECT COUNT(*) FROM {table_name}"
    try:
        instance = odps.execute_sql(count_sql)
        with instance.open_reader() as reader:
            return reader[0][0]  # 获取 COUNT(*) 结果
    except Exception as e:
        print(f"Error counting rows for {table_name}: {str(e)}")
        return 0


def get_business_category(table_name):
    """从表名提取业务分类"""
    try:
        # 尝试从表名中提取业务分类（第二个下划线分隔部分）
        parts = table_name.split('_')
        if len(parts) > 1:
            return parts[1]
    except:
        pass
    return "待补充"


def get_table_metadata(odps):
    """收集并存储表和列的元数据"""
    current_date = datetime.now()
    year_month = current_date.strftime("%Y%m")
    current_time_str = current_date.strftime("%Y-%m-%d %H:%M:%S")

    # 清理旧分区数据
    drop_table_partition_sql = f"""
    ALTER TABLE ods_metadata_assets_table_mi_ytai DROP IF EXISTS PARTITION (ym='{year_month}');
    ALTER TABLE ods_metadata_assets_column_mi_ytai DROP IF EXISTS PARTITION (ym='{year_month}');
    """
    try:
        odps.run_sql(
            drop_table_partition_sql,
            hints={
                "odps.sql.submit.mode": "script",
                "successOnNoPartition": "true"
            }
        )
    except Exception as e:
        print(f"Error dropping partitions: {str(e)}")
        return

    total_tables = 0
    partitioned_tables = 0
    non_partitioned_tables = 0
    total_columns = 0

    # 获取所有表并处理元数据
    for table in odps.list_tables():
        total_tables += 1
        table_name = table.name
        try:
            table_obj = odps.get_table(table_name)
        except Exception as e:
            print(f"Error accessing table {table_name}: {str(e)}")
            continue

        # 提取元数据
        table_comment = sanitize_string(table_obj.comment)
        storage_size = str(table_obj.size)
        virtual_view = "1" if table_obj.is_virtual_view else "0"
        create_time = table_obj.creation_time.strftime("%Y-%m-%d %H:%M:%S")
        hierarchy_level = get_hierarchy_level(table_name)
        update_freq_value, _ = get_update_frequency(table_name)
        is_partitioned = "1" if table_obj.schema.partitions else "2"
        record_count = get_table_count(odps, table_name)
        business_category = sanitize_string(get_business_category(table_name))
        sharing_flag = "1"  # 默认共享
        outflow = "1"  # 默认流出类型
        column_count = str(len(table_obj.schema.columns))

        # 插入表元数据
        insert_table_sql = f"""
        INSERT INTO ods_metadata_assets_table_mi_ytai 
        PARTITION (ym='{year_month}')
        VALUES (
            '{table_name}',
            {table_comment},
            '{column_count}',
            '{storage_size}',
            '{virtual_view}',
            '{create_time}',
            '{hierarchy_level}',
            {business_category},
            '{sharing_flag}',
            {outflow},
            {update_freq_value or "NULL"},
            '{is_partitioned}',
            {record_count},
            '{current_time_str}',
            '{current_time_str}',
            '{year_month}'
        )
        """
        print(insert_table_sql)
        try:
            odps.execute_sql(insert_table_sql)
        except Exception as e:
            print(f"Error inserting table metadata for {table_name}: {str(e)}")
            continue

        # 统计分区表和非分区表数量
        if is_partitioned == "1":
            partitioned_tables += 1
        else:
            non_partitioned_tables += 1

        # 处理列元数据
        for column in table_obj.schema.columns:
            column_name = column.name
            column_type = column.type
            column_comment = sanitize_string(column.comment)

            insert_column_sql = f"""
            INSERT INTO ods_metadata_assets_column_mi_ytai 
            PARTITION (ym='{year_month}')
            VALUES (
                '{table_name}',
                '{column_name}',
                '{column_type}',
                '{hierarchy_level}',
                {business_category},
                '{sharing_flag}',
                {update_freq_value or "NULL"},
                '{current_time_str}',
                '{current_time_str}',
                '{year_month}'
            )
            """
            print(insert_column_sql)
            try:
                odps.execute_sql(insert_column_sql)
                total_columns += 1
            except Exception as e:
                print(f"Error inserting column metadata for {table_name}.{column_name}: {str(e)}")

    # 输出统计结果
    print(f"总表数量: {total_tables}")
    print(f"分区表数量: {partitioned_tables}")
    print(f"非分区表数量: {non_partitioned_tables}")
    print(f"总字段数量: {total_columns}")


# 主程序入口
if __name__ == "__main__":
    get_table_metadata(odps)