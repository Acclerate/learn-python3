import pandas as pd
from datetime import datetime

# 读取 Excel 数据
data = pd.read_excel(r'D:\privategit\learn-python3\samples\pandas\副本副本RL1明细2024年1-9月 (复件) - 副本.xlsx')

# 定义日期格式转换函数
def convert_date(date_str):
    return pd.to_datetime(date_str, format='%Y%m%d%H%M%S').strftime('%Y%m%d')

# 应用日期格式转换函数
data['入院时间'] = data['入院时间'].apply(convert_date)
data['出院时间'] = data['出院时间'].apply(convert_date)

# 将入院时间和出院时间转换为日期类型
data['入院时间'] = pd.to_datetime(data['入院时间'])
data['出院时间'] = pd.to_datetime(data['出院时间'])

# 按照'姓名'和'医院'以及'入院时间'排序
data.sort_values(by=['姓名', '医院', '入院时间'], inplace=True)

# 计算间隔天数，对于没有上一次出院时间的人，间隔天数设为 NaN
data['间隔天数'] = data.groupby(['姓名', '医院'])['入院时间'].shift(-1) - data['出院时间']
data['间隔天数'] = data['间隔天数'].dt.days

# 处理 NaN 值，将没有上一次出院时间的行的间隔天数设置为 0
data['间隔天数'] = data['间隔天数'].fillna(0)

# 打印结果
print(data)


# 输出到 Excel
data.to_excel('output.xlsx', index=False)