input_file = 'test_output/listC.txt'
output_file = 'test_output/listC.txt'

# 读取文件内容并去重
with open(input_file, 'r', encoding='utf-8-sig') as f:
    lines = f.readlines()

# 使用dict.fromkeys()保留顺序并去重
unique_lines = list(dict.fromkeys(lines))

# 写入文件
with open(output_file, 'w', encoding='utf-8-sig') as f:
    f.writelines(unique_lines)

print(f"去重完成，共处理 {len(lines)} 行，保留 {len(unique_lines)} 行")