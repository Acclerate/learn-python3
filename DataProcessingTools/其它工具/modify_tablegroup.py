"""
修改SQL建表语句，根据TABLEGROUP值修改CREATE TABLE语句的开头部分
- 如果TABLEGROUP是 hsa_vms_yt_01，建表语句改为 CREATE TABLE hsa_vms_yt_01
- 如果TABLEGROUP是 hsa_vms_yt_02，建表语句改为 CREATE TABLE hsa_vms_yt_02
"""

import re


def modify_sql_create_table(input_file: str, output_file: str = None):
    """
    修改SQL文件中的CREATE TABLE语句，根据TABLEGROUP值调整表名

    Args:
        input_file: 输入SQL文件路径
        output_file: 输出文件路径，如果为None则覆盖原文件
    """
    with open(input_file, 'r', encoding='utf-8') as f:
        content = f.read()

    # 使用正则表达式匹配并替换每个CREATE TABLE块
    # 匹配从 CREATE TABLE 开始到 ; 结束的完整建表语句
    # Group 1: CREATE TABLE 前缀
    # Group 2: 表名（反引号中的内容）
    # Group 3: 从字段定义开始到结尾的内容
    # Group 4: TABLEGROUP的值
    pattern = re.compile(
        r"(CREATE TABLE\s+)sc_dr_dars_adb\.`([^`]+)`(\s*\([^;]+?TABLEGROUP\s+(\S+)[^;]+?;)",
        re.DOTALL
    )

    def replacer(match):
        """替换函数"""
        create_prefix = match.group(1)  # CREATE TABLE
        table_name = match.group(2)      # 表名（不含反引号）
        rest_after_table_name = match.group(3)  # 从字段定义开始到结尾
        tablegroup = match.group(4)      # TABLEGROUP的值

        # 新的CREATE TABLE语句：CREATE TABLE tablegroup.table_name(字段...)
        return f"{create_prefix}{tablegroup}.`{table_name}`{rest_after_table_name}"

    # 执行替换
    modified_content = pattern.sub(replacer, content)

    # 写入文件
    if output_file is None:
        output_file = input_file

    with open(output_file, 'w', encoding='utf-8') as f:
        f.write(modified_content)

    print(f"处理完成！输出文件: {output_file}")

    # 输出统计信息
    tablegroups = re.findall(r'TABLEGROUP\s+(\S+)', modified_content)
    from collections import Counter
    counter = Counter(tablegroups)
    print("\nTABLEGROUP统计:")
    for tg, count in counter.items():
        print(f"  {tg}: {count}个表")


if __name__ == "__main__":
    import traceback

    input_sql = r"D:\privategit\github\learn-python3\DataProcessingTools\其它工具\adb.sql"

    # 可以指定输出文件，如果为None则覆盖原文件
    output_sql = r"D:\privategit\github\learn-python3\DataProcessingTools\其它工具\adb_modified.sql"

    try:
        modify_sql_create_table(input_sql, output_sql)
    except Exception as e:
        print(f"错误: {e}")
        traceback.print_exc()
