import matplotlib.pyplot as plt
import pandas as pd
import numpy as np

# 设置中文显示
plt.rcParams['font.sans-serif'] = ['SimHei']
plt.rcParams['axes.unicode_minus'] = False

# 根据用户提供的数据创建DataFrame
data = {
    'sample': ['240', '240', '240', '240', '240', '240', '240', '240', '240', '240', '240', '240',
               '250', '250', '250', '250', '250', '250', '250', '250', '250', '250', '250', '250',
               'TB2', 'TB2', 'TB2', 'TB2', 'TB2', 'TB2', 'TB2', 'TB2', 'TB2', 'TB2', 'TB2', 'TB2'],
    'size_range': ['0-5000', '0-5000', '0-5000', '0-5000', 
                   '5000-10000', '5000-10000', '5000-10000', '5000-10000',
                   '>10000', '>10000', '>10000', '>10000'] * 3,
    'metric': ['Mapped rate', 'Recombinat rate', 'Singlie rate', 'Double rate'] * 9,
    'value': [
        # 样本240数据
        191005, 1847, 1786, 61,  # 0-5000
        10921, 489, 460, 29,     # 5000-10000
        2998, 277, 263, 14,      # >10000
        # 样本250数据
        32676, 728, 704, 24,     # 0-5000
        4157, 273, 269, 4,       # 5000-10000
        1036, 115, 114, 1,       # >10000
        # 样本TB2数据
        32586, 508, 496, 12,     # 0-5000
        1601, 111, 108, 3,       # 5000-10000
        339, 40, 39, 1           # >10000
    ],
    'percentage': [
        # 样本240百分比
        51.98, 0.97, 96.70, 3.30,  # 0-5000
        65.15, 4.48, 94.07, 5.93,  # 5000-10000
        69.27, 9.24, 94.95, 5.05,  # >10000
        # 样本250百分比
        8.13, 2.23, 96.70, 3.30,   # 0-5000
        8.43, 6.57, 98.53, 1.47,   # 5000-10000
        9.76, 11.10, 99.13, 0.87,  # >10000
        # 样本TB2百分比
        12.88, 1.56, 97.64, 2.36,  # 0-5000
        21.52, 6.93, 97.30, 2.70,  # 5000-10000
        20.96, 11.80, 97.50, 2.50  # >10000
    ]
}

# 创建DataFrame
df = pd.DataFrame(data)

# 截短第一个数据（样本240的Mapped rate，0-5000范围）
# 查找对应的索引并设置一个合理的截短值
for idx, row in df.iterrows():
    if row['sample'] == '240' and row['metric'] == 'Mapped rate' and row['size_range'] == '0-5000':
        # 截短为原数据的1/5
        df.at[idx, 'value'] = int(row['value'] / 5)
        break

# 获取唯一的样本、大小范围和指标
unique_samples = df['sample'].unique()
unique_sizes = df['size_range'].unique()
unique_metrics = df['metric'].unique()

# 创建一个图形，用于合并的蝴蝶图
fig, ax = plt.subplots(figsize=(14, 10))

# 定义颜色方案
colors = {
    '240': '#3498db',  # 蓝色
    '250': '#e74c3c',  # 红色
    'TB2': '#2ecc71'   # 绿色
}

# 为每个指标创建一个组合标签
combined_labels = []
all_left_values = []
all_right_values = []
all_left_percentages = []
all_right_percentages = []
all_left_colors = []
all_right_colors = []

# 将数据组织为蝴蝶图格式
# 左侧显示样本250和TB2的数据，右侧显示240的数据（按用户要求调整）
for metric in unique_metrics:
    for size in unique_sizes:
        # 获取当前指标和大小范围的数据
        metric_size_df = df[(df['metric'] == metric) & (df['size_range'] == size)]
        
        # 添加组合标签
        combined_labels.append(f'{metric}\n{size}')
        
        # 左侧值（样本250和TB2）
        sample_250_data = metric_size_df[metric_size_df['sample'] == '250']
        if not sample_250_data.empty:
            left_value_250 = sample_250_data['value'].values[0]
            left_percentage_250 = sample_250_data['percentage'].values[0]
        else:
            left_value_250 = 0
            left_percentage_250 = 0
        
        sample_tb2_data = metric_size_df[metric_size_df['sample'] == 'TB2']
        if not sample_tb2_data.empty:
            left_value_tb2 = sample_tb2_data['value'].values[0]
            left_percentage_tb2 = sample_tb2_data['percentage'].values[0]
        else:
            left_value_tb2 = 0
            left_percentage_tb2 = 0
        
        # 右侧值（样本240）
        sample_240_data = metric_size_df[metric_size_df['sample'] == '240']
        if not sample_240_data.empty:
            right_value_240 = sample_240_data['value'].values[0]
            right_percentage_240 = sample_240_data['percentage'].values[0]
        else:
            right_value_240 = 0
            right_percentage_240 = 0
        
        # 存储数据
        all_left_values.append([-left_value_250, -left_value_tb2])
        all_right_values.append([right_value_240])
        all_left_percentages.append([left_percentage_250, left_percentage_tb2])
        all_right_percentages.append([right_percentage_240])
        all_left_colors.append([colors['250'], colors['TB2']])
        all_right_colors.append([colors['240']])

# 绘制合并的蝴蝶图
bar_height = 0.7  # 条形高度
spacing = 0.1     # 组之间的间距
left_bottom = np.zeros(len(combined_labels))  # 左侧条形图的底部位置
right_bottom = np.zeros(len(combined_labels))  # 右侧条形图的底部位置

# 绘制左侧堆叠条形图（样本250和TB2）
for i in range(len(combined_labels)):
    # 绘制样本250的条形图
    bar_250 = ax.barh(combined_labels[i], all_left_values[i][0], bar_height, 
                      left=left_bottom[i], color=all_left_colors[i][0], alpha=0.8, label='250' if i == 0 else "")
    
    # 添加样本250的标签
    if all_left_values[i][0] < 0:  # 确保有值才添加标签
        if abs(all_left_values[i][0]) >= 1000:
            formatted_value = f'{abs(all_left_values[i][0])/1000:.1f}k'
        else:
            formatted_value = f'{abs(all_left_values[i][0]):.0f}'
        ax.text(bar_250[0].get_x() + bar_250[0].get_width()/2, 
               bar_250[0].get_y() + bar_250[0].get_height()/2, 
               f'{formatted_value}\n({all_left_percentages[i][0]}%)', 
               va='center', ha='center', color='white', fontsize=8)
    
    # 更新底部位置，为样本TB2的条形图做准备
    left_bottom[i] += all_left_values[i][0]
    
    # 绘制样本TB2的条形图
    bar_tb2 = ax.barh(combined_labels[i], all_left_values[i][1], bar_height, 
                      left=left_bottom[i], color=all_left_colors[i][1], alpha=0.8, label='TB2' if i == 0 else "")
    
    # 添加样本TB2的标签
    if all_left_values[i][1] < 0:  # 确保有值才添加标签
        if abs(all_left_values[i][1]) >= 1000:
            formatted_value = f'{abs(all_left_values[i][1])/1000:.1f}k'
        else:
            formatted_value = f'{abs(all_left_values[i][1]):.0f}'
        ax.text(bar_tb2[0].get_x() + bar_tb2[0].get_width()/2, 
               bar_tb2[0].get_y() + bar_tb2[0].get_height()/2, 
               f'{formatted_value}\n({all_left_percentages[i][1]}%)', 
               va='center', ha='center', color='white', fontsize=8)
    
    # 更新底部位置
    left_bottom[i] += all_left_values[i][1]
    
    # 绘制右侧条形图（样本240）
    bar_240 = ax.barh(combined_labels[i], all_right_values[i][0], bar_height, 
                      left=right_bottom[i], color=all_right_colors[i][0], alpha=0.8, label='240' if i == 0 else "")
    
    # 添加样本240的标签
    if all_right_values[i][0] > 0:  # 确保有值才添加标签
        if all_right_values[i][0] >= 1000:
            formatted_value = f'{all_right_values[i][0]/1000:.1f}k'
        else:
            formatted_value = f'{all_right_values[i][0]:.0f}'
        ax.text(bar_240[0].get_x() + bar_240[0].get_width()/2, 
               bar_240[0].get_y() + bar_240[0].get_height()/2, 
               f'{formatted_value}\n({all_right_percentages[i][0]}%)', 
               va='center', ha='center', color='white', fontsize=8)
    
    # 更新底部位置
    right_bottom[i] += all_right_values[i][0]

# 设置图表属性
ax.set_title('合并的蝴蝶图 - 样本指标对比分析', fontsize=16)

# 计算适当的x轴范围
max_left = max([abs(val) for sublist in all_left_values for val in sublist])
max_right = max([abs(val) for sublist in all_right_values for val in sublist])
ax.set_xlim(-max_left * 1.3, max_right * 1.3)

# 隐藏x轴刻度
ax.set_xticks([])

# 隐藏部分边框
ax.spines['top'].set_visible(False)
ax.spines['right'].set_visible(False)
ax.spines['bottom'].set_visible(False)

# 添加图例
ax.legend(loc='upper right', fontsize=10)

# 添加中心分隔线和标签
ax.axvline(x=0, color='black', linestyle='-', linewidth=0.5)

# 调整布局
plt.tight_layout()

# 显示图形
plt.show()