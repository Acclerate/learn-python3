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

# 生成词云
# 对词频排序并创建排名字典
    sorted_words = sorted(medicine_counts.items(), key=lambda x: x[1], reverse=True)
    rank = {word: i for i, (word, _) in enumerate(sorted_words)}

    # 调整词频以实现字体大小差异化
    sorted_medicines = sorted(medicine_counts.items(), key=lambda x: x[1], reverse=True)
    scaled_counts = {}
    total = len(sorted_medicines)
    for i, (medicine, count) in enumerate(sorted_medicines):
        if i < 3:  # 前三名：1.2倍词频（进一步降低放大比例）
            scaled_counts[medicine] = count * 1.2
        elif i < int(total * 0.33) + 3:  # 中间33%：原词频
            scaled_counts[medicine] = count
        elif i < int(total * 0.66) + 3:  # 接下来33%：0.7倍词频（降低缩小比例）
            scaled_counts[medicine] = count * 0.7
        else:  # 最后部分：0.5倍词频（降低缩小比例）
            scaled_counts[medicine] = count * 0.5

    wc = WordCloud(
        font_path='simhei.ttf',
        background_color='white',
        width=600,
        height=300,
        margin=0,
        max_font_size=30,  # 进一步降低字体大小
        relative_scaling=0.5,  # 保持相对缩放
        collocations=False,
        max_words=100,  # 保持词汇数量
        min_font_size=3,  # 保持最小字体大小
        prefer_horizontal=1.0,  #  
        scale=60  # 降低缩放比例减少渲染压力
    ).generate_from_frequencies(scaled_counts)

# 显示词云
plt.figure(figsize=(6, 3))
plt.imshow(wc, interpolation='bilinear')
plt.axis('off')
plt.savefig('dense_wordcloud.png', bbox_inches='tight', pad_inches=0)  # 提高dpi改善清晰度
plt.close()
print('词云已保存至 dense_wordcloud.png')
plt.show()
