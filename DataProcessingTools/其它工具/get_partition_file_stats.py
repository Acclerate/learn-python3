# -*- coding: utf-8 -*-
"""
分区文件统计工具

该脚本用于获取ODPS表的分区统计信息，包括每个分区的文件数量、物理大小和逻辑大小。
主要用于分析表分区的存储情况，帮助优化数据存储和查询性能。

注意：使用前需要确保已正确初始化ODPS环境，odps变量应该在环境中可用。
"""

# 导入ODPS选项模块，用于配置ODPS客户端行为
from odps import options
# 注意：代码中直接使用了odps变量，但没有明确导入，
# 这通常表示odps客户端实例在运行环境中已预先初始化

# 禁用ODPS客户端的详细日志输出，减少不必要的信息显示
options.verbose = False

# 要查询的表名
TABLE_NAME = 'stg_midr_jsqd_patient_info_di_ytai'

def get_stats():
    """
    获取表分区统计信息
    
    Returns:
        list: 包含每个分区统计信息的字典列表，每个字典包含以下键：
            - pt: 分区值
            - files: 文件数量
            - phys_mb: 物理大小（MB）
            - logi_mb: 逻辑大小（MB）
    """
    # 获取指定表的表对象
    table = odps.get_table(TABLE_NAME)
    
    # 按分区值降序排序分区，确保最新的分区在前面
    partitions = sorted(
        table.partitions,
        key=lambda p: p.name.split('=')[1],  # 提取分区值作为排序键
        reverse=True  # 降序排列
    )
    
    # 存储分区统计结果的列表
    results = []
    
    # 遍历每个分区，收集统计信息
    for partition in partitions:
        # 提取分区值（格式通常为 partition_name=value）
        pt = partition.name.split('=')[1]
        
        # 添加分区统计信息到结果列表
        results.append({
            'pt': pt,  # 分区值
            'files': partition.file_num,  # 文件数量
            # 物理大小（MB），如果physical_size为None则设为0
            'phys_mb': partition.physical_size / 1024 / 1024 if partition.physical_size else 0,
            # 逻辑大小（MB），如果size为None则设为0
            'logi_mb': partition.size / 1024 / 1024 if partition.size else 0
        })
    
    return results

def print_report(stats):
    """
    打印分区统计信息报告
    
    Args:
        stats (list): 由get_stats()函数返回的分区统计信息列表
    """
    # 打印报告标题行
    print("Partition | FileCount | PhysSize(MB) | LogSize(MB)")
    # 打印分隔线
    print("-" * 50)
    
    # 遍历每个分区的统计信息并格式化输出
    for s in stats:
        print(f"{s['pt']:<10} | {s['files']:<9} | {s['phys_mb']:>12.2f} | {s['logi_mb']:>11.2f}")
    
    # 打印分区总数
    print(f"\nTotal partitions: {len(stats)}")

# 主程序入口
if __name__ == "__main__":
    try:
        # 执行主逻辑：获取统计信息并打印报告
        print_report(get_stats())
    except Exception as e:
        # 捕获并打印任何异常
        print(f"ERROR: {str(e)}")