import matplotlib.pyplot as plt

# 数据准备
pulse_conditions = ['脉细', '脉弦', '脉沉', '脉滑', '脉弱', '脉无力', '脉数', '脉涩', '脉缓', '脉迟']
frequencies = [86, 69, 68, 49, 19, 13, 13, 10, 9, 7]

# 设置中文显示的字体
plt.rcParams['font.sans-serif'] = ['SimHei']
plt.rcParams['axes.unicode_minus'] = False

# 绘制饼状图
plt.pie(frequencies, labels=pulse_conditions, autopct='%1.1f%%')

# 添加标题
plt.title('脉象分布')

# 显示饼状图
plt.show()



# 数据准备
diagnoses = ['痰瘀阻窍证', '肾精亏虚证', '髓海不足证', '痰浊蒙窍证', '脾肾两虚证', '瘀阻脑络证',
              '心肾两虚证', '肝肾亏虚证', '气虚血瘀证', '心脾两虚证']
frequencies = [114, 82, 66, 39, 34, 33, 20, 16, 16, 12]
percentages = [34.55, 24.85, 20.00, 11.82, 10.30, 10.00, 6.06, 4.85, 4.85, 3.64]

# 设置中文显示的字体
plt.rcParams['font.sans-serif'] = ['SimHei']
plt.rcParams['axes.unicode_minus'] = False

# 绘制柱状图和折线图
plt.bar(diagnoses, frequencies)
plt.plot(diagnoses, percentages, color='r', marker='o')

# 添加标题和标签
plt.title('证型分布')
plt.xlabel('证型')
plt.ylabel('频次/百分比')

# 显示图例
plt.legend(['频次', '百分比'])

# 显示网格
plt.grid(True)

# 显示柱状图加折线图
plt.show()
