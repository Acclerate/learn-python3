import matplotlib.pyplot as plt

# 数据准备
tongue_conditions = ['舌暗', '舌淡', '舌红', '舌紫', '舌胖', '有瘀斑', '边有齿痕', '有瘀点', '有裂纹', '舌白']
frequencies = [89, 56, 51, 41, 13, 11, 11, 8, 3, 1]

# 设置中文显示的字体
plt.rcParams['font.sans-serif'] = ['SimHei']
plt.rcParams['axes.unicode_minus'] = False

# 绘制饼状图
plt.pie(frequencies, labels=tongue_conditions, autopct='%1.1f%%')

# 添加标题
plt.title('舌质分布')

# 显示饼状图
plt.show()




# 数据准备
tongue_coatings = ['苔白', '苔腻', '苔薄', '苔黄', '苔厚', '少苔', '苔燥', '苔滑', '苔润', '无苔']
frequencies = [96, 85, 50, 26, 21, 14, 3, 3, 2, 2]

# 设置中文显示的字体
plt.rcParams['font.sans-serif'] = ['SimHei']
plt.rcParams['axes.unicode_minus'] = False

# 绘制饼状图
plt.pie(frequencies, labels=tongue_coatings, autopct='%1.1f%%')

# 添加标题
plt.title('舌苔分布')

# 显示饼状图
plt.show()
