import matplotlib.pyplot as plt

# 数据准备
labels = ['男', '女', '不详']
sizes = [110, 54, 1]

# 设置天蓝色和淡黄色
colors = ['#ADD8E6', '#FFFFE0']

# 设置中文显示的字体
plt.rcParams['font.sans-serif'] = ['SimHei']
plt.rcParams['axes.unicode_minus'] = False

# 绘制饼状图
plt.pie(sizes, labels=labels, colors=colors, autopct='%1.1f%%')

# 添加标题
plt.title('性别比例')

# 显示饼状图
plt.show()


# 数据准备
age_groups = ['0-9', '10-19', '20-29', '30-39', '40-49', '50-59', '60-69', '70-79', '80-89', '90-99', '100以上']
frequencies = [0, 0, 0, 0, 3, 11, 78, 65, 6, 1, 0]

# 设置中文显示的字体
plt.rcParams['font.sans-serif'] = ['SimHei']
plt.rcParams['axes.unicode_minus'] = False

# 绘制柱状图
plt.bar(age_groups, frequencies)

# 添加标题和标签
plt.title('年龄分布')
plt.xlabel('年龄段')
plt.ylabel('频次')

# 显示网格
plt.grid(True)

# 显示柱状图
plt.show()
