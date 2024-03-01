import pandas as pd  # 导入pandas库，用于数据处理和分析
import seaborn as sns  # 导入seaborn库，用于数据可视化
import matplotlib.pyplot as plt  # 导入matplotlib库，用于绘制图表


def pearson(data):
    df = pd.read_excel(data)

    cor = df.corr(method='spearman', numeric_only=True)  # 这里标题不是数值书需要加一个numeric=True
    print(cor)  # 输出相关系数
    rc = {'font.sans-serif': 'SimHei',
          'axes.unicode_minus': False}
    sns.set(font_scale=0.3, rc=rc)  # 设置字体大小
    sns.heatmap(cor,
                annot=True,  # 显示相关系数的数据
                center=0.5,  # 居中
                fmt='.2f',  # 只显示两位小数
                linewidth=0.5,  # 设置每个单元格的距离
                # linecolor='',  # 设置间距线的颜色
                vmin=-0.5, vmax=1,  # 设置数值最小值和最大值
                xticklabels=True, yticklabels=True,  # 显示x轴和y轴
                square=True,  # 每个方格都是正方形
                cbar=True,  # 绘制颜色条
                cmap='OrRd',  # 设置热力图颜色
                )
    plt.savefig("中药强热力图带数字.png", dpi=600)  # 保存图片，分辨率为600
    plt.ion()  # 显示图片


pearson('E:\数据分析\鱼\中药\最终热图30+.xlsx')
'''   
def pinci01(name,listname):
    if name in listname:
        x=1
    else:
        x=0

    return x



df_ps = pd.read_excel(r'E:\数据分析\鱼\中药\定稿228.xlsx')
my_list=['远志', '石菖蒲', '丹参', '川芎', '茯苓', '熟地黄', '山茱萸', '白术', '当归', '郁金', '益智仁', '黄芪', '陈皮', '葛根', '肉苁蓉', '枸杞子', '甘草', '炙甘草', '党参', '赤芍', '胆南星', '桃仁', '山药', '五味子', '巴戟天', '红花', '人参', '半夏', '酸枣仁', '水蛭', '白芍', '麦冬', '菟丝子', '牛膝', '制何首乌', '肉桂', '龟甲', '柴胡', '天麻','石斛','淫羊藿','地龙','龙骨','附子','生地黄','桂枝','鹿角胶','泽泻','枳实','竹茹','黄芩','牡丹皮']

# 使用assign方法添加新列  
for col_name in my_list:  
    df_ps = df_ps.assign(**{col_name: None}) 
    df_ps[col_name]=df_ps.apply(lambda x:pinci01(col_name,x['中药组成']),axis=1) 



tt_ps=pd.ExcelWriter(r'E:\数据分析\鱼\中药\定稿228ps.xlsx')
df_ps.to_excel(tt_ps,sheet_name="明细",index=False)
tt_ps.save()

'''



