import matplotlib.pyplot as plt
import pandas as pd

# 设置中文显示
plt.rcParams['font.sans-serif'] = ['SimHei']
plt.rcParams['axes.unicode_minus'] = False

# 创建数据
data = {
    'name': ['geneA', 'geneB', 'geneC', 'geneD', 'geneE'],
    'left': [9, 7, 5, 3, 1],
    'right': [9, 7, 5, 3, 1]
}

df = pd.DataFrame(data)

# 创建图形和轴
fig, ax = plt.subplots(figsize=(10, 6))

# 绘制左侧条形图（红色）
bar_left = ax.barh(df['name'], -df['left'], color='#E53935', height=0.6, label='左侧')

# 绘制右侧条形图（黄色）
bar_right = ax.barh(df['name'], df['right'], color='#FFB300', height=0.6, label='右侧')

# 添加数值标签
for i, bar in enumerate(bar_left):
    ax.text(bar.get_width() - 0.5, bar.get_y() + bar.get_height()/2, 
            str(df['left'][i]), va='center', ha='right', color='white')

for i, bar in enumerate(bar_right):
    ax.text(bar.get_width() + 0.5, bar.get_y() + bar.get_height()/2, 
            str(df['right'][i]), va='center', ha='left', color='black')

# 设置坐标轴
ax.set_xlim(-10, 10)  # 设置x轴范围
ax.set_xticks([])  # 隐藏x轴刻度
ax.spines['top'].set_visible(False)  # 隐藏顶部边框
ax.spines['right'].set_visible(False)  # 隐藏右侧边框
ax.spines['bottom'].set_visible(False)  # 隐藏底部边框

# 添加图例
ax.legend()

# 设置标题
ax.set_title('基因表达蝴蝶图')

# 调整布局
plt.tight_layout()

# 显示图形
plt.show()