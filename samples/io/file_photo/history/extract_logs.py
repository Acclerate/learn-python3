import re
import os

# 定义输入和输出文件路径
input_file = r'd:/privategit/github/learn-python3/samples/io/file_photo/test_output/listD.txt'
output_file = r'd:/privategit/github/learn-python3/samples/io/file_photo/test_output/listC.txt'

# 定义正则表达式模式，匹配以H或P开头直到下划线的内容
pattern = re.compile(r'([HP][^_]+)_')

try:
    # 读取输入文件并提取匹配内容
    with open(input_file, 'r', encoding='utf-8-sig') as f_in:
        print(f"成功打开输入文件: {input_file}，开始读取内容...")
        matches = []
        line_count = 0
        in_range = False  # 范围标记：仅处理匹配成功和失败之间的内容
        total_lines = sum(1 for _ in f_in)  # 获取总行数
        f_in.seek(0)  # 重置文件指针到开头
        print(f"检测到输入文件共 {total_lines} 行")
        for line in f_in:
            line_count += 1
            line = line.strip()
            
            # 范围控制：标记开始和结束位置
            if "共匹配成功" in line:
                in_range = True
                continue  # 跳过标记行本身
            if "共匹配失败" in line:
                in_range = False
                continue  # 跳过标记行本身
            
            # 仅在范围内处理内容
            if in_range:
                # 调试：打印前10行内容
                if line_count <= 10:
                    print(f"调试行{line_count}: {line[:50]}...")
                match = pattern.search(line)
                if match:
                    matches.append(match.group(1))
                    # 调试：打印匹配结果
                    print(f"找到匹配: {match.group()} (行{line_count})")

    # 将匹配结果写入输出文件
    with open(output_file, 'w', encoding='utf-8') as f_out:
        for item in matches:
            f_out.write(item + '\n')

    print(f"成功提取 {len(matches)} 个匹配项，结果已保存到 {output_file}")
except FileNotFoundError:
    print(f"错误：找不到输入文件 {input_file}")
except Exception as e:
    print(f"处理文件时出错：{str(e)}")