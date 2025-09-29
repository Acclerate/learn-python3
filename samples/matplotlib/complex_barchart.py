import matplotlib.pyplot as plt
import pandas as pd
import numpy as np

# 设置中文显示
plt.rcParams['font.sans-serif'] = ['SimHei']
plt.rcParams['axes.unicode_minus'] = False

# 创建数据 - 正确映射用户提供的数据
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

# 获取唯一的样本、大小范围和指标
unique_samples = df['sample'].unique()
unique_sizes = df['size_range'].unique()
unique_metrics = df['metric'].unique()

# 创建图形和轴 - 合并成一个图表
fig, ax = plt.subplots(figsize=(20, 10))

# 定义颜色方案 - 使用不同色调表示不同样本的不同指标
colors = {
    ('240', 'Mapped rate'): '#3498db',        # 蓝色
    ('240', 'Recombinat rate'): '#9b59b6',    # 紫色
    ('240', 'Singlie rate'): '#1abc9c',       # 青色
    ('240', 'Double rate'): '#e67e22',        # 橙色
    ('250', 'Mapped rate'): '#e74c3c',        # 红色
    ('250', 'Recombinat rate'): '#8e44ad',    # 深紫色
    ('250', 'Singlie rate'): '#27ae60',       # 绿色
    ('250', 'Double rate'): '#f39c12',        # 深黄色
    ('TB2', 'Mapped rate'): '#2ecc71',        # 浅绿色
    ('TB2', 'Recombinat rate'): '#d35400',    # 深橙色
    ('TB2', 'Singlie rate'): '#16a085',       # 深青色
    ('TB2', 'Double rate'): '#f1c40f',        # 黄色
}

# 计算条形宽度和位置
bar_width = 0.06  # 每个小条形的宽度
spacing = 0.2     # 组之间的间距
metrics_per_group = len(unique_metrics) * len(unique_samples)  # 每组的小条形数量

# 为每个大小范围绘制一组堆叠的条形图
bottom = np.zeros(len(unique_sizes) * len(unique_samples))  # 用于堆叠条形图的底部位置
legend_handles = []
legend_labels = []

for i, size in enumerate(unique_sizes):
    for j, sample in enumerate(unique_samples):
        # 计算该样本在该大小范围下的条形起始位置
        base_pos = i * (metrics_per_group * bar_width + spacing) + j * (len(unique_metrics) * bar_width)
        
        # 为该样本在该大小范围下的每个指标绘制条形图
        for k, metric in enumerate(unique_metrics):
            # 获取当前数据
            value = df[(df['sample'] == sample) & 
                      (df['size_range'] == size) & 
                      (df['metric'] == metric)]['value'].values[0]
            percentage = df[(df['sample'] == sample) & 
                           (df['size_range'] == size) & 
                           (df['metric'] == metric)]['percentage'].values[0]
            
            # 计算当前条形的位置
            pos = base_pos + k * bar_width
            
            # 绘制条形图
            bar = ax.bar(pos, value, bar_width, bottom=bottom[i * len(unique_samples) + j], 
                        color=colors[(sample, metric)], label=f'{sample} - {metric}')
            
            # 收集图例信息（仅收集一次）
            label = f'{sample} - {metric}'
            if label not in legend_labels:
                legend_handles.append(bar)
                legend_labels.append(label)
            
            # 添加数值标签（仅对较大的值添加标签，避免拥挤）
            if value > 100:  # 只对大于100的值添加标签
                # 格式化大数值
                if value >= 1000:
                    formatted_value = f'{value/1000:.1f}k'
                else:
                    formatted_value = str(value)
                
                # 在条形顶部添加标签
                ax.text(pos, bottom[i * len(unique_samples) + j] + value / 2, 
                       f'{formatted_value}\n({percentage}%)', ha='center', va='center', 
                       fontsize=8, rotation=90, color='white' if value > 1000 else 'black')
        
        # 更新堆叠条形图的底部位置
        total_value = df[(df['sample'] == sample) & (df['size_range'] == size)]['value'].sum()
        bottom[i * len(unique_samples) + j] += total_value

# 设置图表标题和标签
ax.set_title('所有样本在不同片段大小范围下的各项指标分布')
ax.set_xlabel('片段大小范围 (bp)')
ax.set_ylabel('数量')

# 设置X轴刻度和标签
xticks_pos = [i * (metrics_per_group * bar_width + spacing) + 
              (len(unique_samples) * len(unique_metrics) * bar_width) / 2 - 
              bar_width / 2 for i in range(len(unique_sizes))]
ax.set_xticks(xticks_pos)
ax.set_xticklabels(unique_sizes)

# 添加图例（使用2行布局以避免过长）
ax.legend(legend_handles, legend_labels, loc='upper right', ncol=2, fontsize=9)

# 添加网格线
ax.grid(axis='y', linestyle='--', alpha=0.7)

# 调整布局
plt.tight_layout()

# 显示图形
plt.show()