import re
from collections import Counter
from wordcloud import WordCloud
import matplotlib.pyplot as plt

# 读取文件内容并处理
file_path = r'D:\privategit\github\learn-python3\samples\pyWxDumpUtils\中药频次.csv'
all_medicines = []

with open(file_path, 'r', encoding='utf-8') as f:
    for line in f:
        line = line.strip()
        if not line:  # 跳过空行
            continue
        # 拆分每行的中药，处理逗号、顿号等分隔符
        items = re.split(r'[,、，。:；]', line)
        for item in items:
            item = item.strip()
            if not item:  # 跳过空项
                continue
            # 提取中药名称（中文部分），忽略剂量和特殊字符
            match = re.match(r'^([一-龥]+)', item)
            if match:
                medicine = match.group(1)
                if medicine != "远志":
                    all_medicines.append(medicine)

# 统计频次
medicine_counts = Counter(all_medicines)
print(f'共统计到 {len(medicine_counts)} 种中药，总频次 {sum(medicine_counts.values())}')

# 突出显示前三高频词
if len(medicine_counts) >= 3:
    top3 = medicine_counts.most_common(3)
    for medicine, count in top3:
        medicine_counts[medicine] = int(count * 1.5)  # 增加50%的频次以突出显示

    # 确保石菖蒲位于词云中心位置
    current_max = max(medicine_counts.values()) if medicine_counts else 0


    # 生成词云
wc = WordCloud(
        font_path='simhei.ttf',
        background_color='white',
        width=800,  # 增加宽度使布局更紧凑
        height=300,  # 减小高度增加垂直密度
        margin=2,    # 减小边距
        max_font_size=45,  # 降低最大字体大小
        min_font_size=6,   # 提高最小字体大小保证可读性
        relative_scaling=0.3,  # 减小缩放增强密度
        prefer_horizontal=1.0,  # 确保最高频词横向显示
        collocations=False,
        max_words=150,     # 增加显示词数
        scale=2,           # 提高渲染精度
        random_state=66
    ).generate_from_frequencies(medicine_counts)

# 显示词云
plt.figure(figsize=(10, 5), dpi=120)  # 平衡显示尺寸与分辨率
plt.imshow(wc, interpolation='bilinear')
plt.axis('off')
plt.savefig('dense_wordcloud.png', bbox_inches='tight', pad_inches=0, dpi=150)
plt.close()
print('词云已保存至 dense_wordcloud.png')
plt.show()
