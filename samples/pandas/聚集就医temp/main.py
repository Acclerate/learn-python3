import pandas as pd

data_path = r'./H37068401102_202401-08.csv'
df = pd.read_csv(data_path)

# 以字段PSN_NO分组, 将YMD字段以集合存储
# 使用 groupby('PSN_NO') 按照 PSN_NO 字段分组，并对每个分组中的 YMD 字段应用 set()，
# 将 YMD 转换为集合。集合去重，只保留唯一的日期。reset_index() 是为了重建索引并生成新的 DataFrame df_grouped。
df_grouped = df.groupby('PSN_NO')['YMD'].apply(set).reset_index()
print(df_grouped)
# 筛掉长度为1的集合
# 对 df_grouped 进行筛选，保留 YMD 集合长度大于 1 的行，即只保留 YMD 集合中有多个日期的记录。
df_filtered = df_grouped[df_grouped['YMD'].apply(lambda x: len(x) > 1)]
# 将集合转换为可哈希的类型
# 将 YMD 集合由 set 转换为 frozenset，因为 frozenset 是不可变的类型，能够作为字典或分组的键使用。
df_filtered['YMD'] = df_filtered['YMD'].apply(frozenset)

# 将相同YMD集合的PSN_NO做成集合
df_result = df_filtered.groupby('YMD')['PSN_NO'].apply(list).reset_index()
print(df_result)
df_result['LENGTH_YMD'] = df_result['YMD'].apply(len)   # 计算集合长度
df_result['LENGTH_PSN'] = df_result['PSN_NO'].apply(len)
# 筛掉长度为1的集合
df_result = df_result[df_result['PSN_NO'].apply(lambda x: len(x) > 1)]
# 依集合长度排序
df_result = df_result.sort_values(by=['LENGTH_YMD', 'LENGTH_PSN'], ascending=[False, False]).reset_index(drop=True)

print(df_result)
# df_result.to_csv('output.csv', index=False)