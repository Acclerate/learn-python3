import numpy as np
import math
import xlrd
import xlsxwriter  
import time
import re
import swifter
import datetime
from ctypes import string_at
from doctest import OutputChecker
from pyexpat import model
import pandas as pd
from datetime import datetime
from pandas.tseries.offsets import *
from bs4 import BeautifulSoup
import threading
from threading import Thread, Lock
from time import sleep
import concurrent.futures  
from collections import Counter  


def guolv(zhongyao):
    # 按逗号分割字符串  
    #words = zhongyao.split(',')  
    # 按标点符号分割字符串  
    words = re.split(r'[、。:,!?;]', zhongyao)  
   
    # 遍历每个单词，检查是否包含“远志”  

    yuan=''
    shi=''
    chuan=''
    shi_n=0
    yuan_n=0
    chuan_n=0
    for word in words:
        print (word)  
        if '远志' in word:
            yuan=word
            yuan_n = int(re.findall(r'\d+', word)[0])

        elif '川芎' in word:
            
            chuan=word 
            chuan_n = int(re.findall(r'\d+', word)[0]) 

        elif '石菖蒲' in word:
            shi=word
            shi_n = int(re.findall(r'\d+', word)[0]) 

    return yuan,shi,chuan,yuan_n,shi_n,chuan_n

def min_ratio2(num1, num2):  

    # 计算最大公约数  
    gcd_12 = math.gcd(num1, num2)  
    
    # 将三个数转化为最简比值  
    ratio1 = num1 // gcd_12  
    ratio2 = num2 // gcd_12  
    # 返回最小比值，格式为"最小值:a:b:c"  
    return f"{int(ratio1)}:{int(ratio2)}" 


def min_ratio3(num1, num2, num3):  

    # 计算最大公约数  
    gcd_12 = math.gcd(num1, num2)  
    gcd_gcd_12_15 = math.gcd(gcd_12, num3)  
    
    # 将三个数转化为最简比值  
    ratio1 = num1 // gcd_gcd_12_15  
    ratio2 = num2 // gcd_gcd_12_15  
    ratio3 = num3 // gcd_gcd_12_15   
    # 返回最小比值，格式为"最小值:a:b:c"  
    return f"{int(ratio1)}:{int(ratio2)}:{int(ratio3)}" 

def pinci(df_wx_ndwc): #分出来药品出现的频次
    x=df_wx_ndwc['中药组成'].values.tolist()
    combined_string = ','.join(x) 
    #cleaned_string = re.sub(r'[g\d]', '', combined_string)  # 使用正则表达式匹配数字和特定的字母，并用空字符串替换它们 \d表示数字

    words1 = re.split(r'[g\d 、。:,!?;]', combined_string) 
    words1 = [item for item in words1 if item]  
    # 使用Counter计算每个元素的频次  
    counter = Counter(words1) 
    for item, count in counter.items():  
        print(f'{item}: {count}')
  

    
    return 0

df = pd.read_excel(r'E:\数据分析\鱼\中药\定稿228.xlsx')
df = df.assign(远志='',石菖蒲='',川芎='',远志n='',石菖蒲n='',川芎n='')
df['远志'], df['石菖蒲'], df['川芎'], df['远志n'], df['石菖蒲n'], df['川芎n'] = zip(*df['中药组成'].swifter.apply(lambda x:guolv(x)))
grouped_df=pd.pivot_table(df, index='远志', aggfunc='size')
total_count = grouped_df.sum()
pivot_table_probability = grouped_df / total_count

print(grouped_df)
print(pivot_table_probability)


df2_zhishi = df.drop(df[(df['远志n'] == 0) | (df['石菖蒲n'] == 0) ].index)  
df2_zhishi['二比']=df2_zhishi.apply(lambda x:min_ratio2(x['远志n'], x['石菖蒲n']),axis=1)
df2_zhishi['result']=df2_zhishi.apply(lambda x:
                                    "=1" if x['远志n']/x['石菖蒲n']==1
                                    else("<1" if x['远志n']/x['石菖蒲n']<1
                                    else ">1"),axis=1)
grouped_df1=pd.pivot_table(df2_zhishi, index='result', aggfunc='size')
total_count1 = grouped_df1.sum()
pivot_table_probability1 = grouped_df1 / total_count1

print(grouped_df1)
print(pivot_table_probability1)

df2_zhichuan = df.drop(df[(df['远志n'] == 0) | (df['川芎n'] == 0) ].index)  
df2_zhichuan['二比']=df2_zhichuan.apply(lambda x:min_ratio2(x['远志n'], x['川芎n']),axis=1)
df2_zhichuan['result']=df2_zhichuan.apply(lambda x:
                                    "=1" if x['远志n']/x['川芎n']==1
                                    else("<1" if x['远志n']/x['川芎n']<1
                                    else ">1"),axis=1)
grouped_df2=pd.pivot_table(df2_zhichuan, index='result', aggfunc='size')
total_count2 = grouped_df2.sum()
pivot_table_probability2 = grouped_df2 / total_count2

print(grouped_df2)
print(pivot_table_probability2)

df3 = df.drop(df[(df['远志n'] == 0) | (df['石菖蒲n'] == 0) | (df['川芎n'] == 0)].index)  
df3['三比']=df3.apply(lambda x:min_ratio3(x['远志n'], x['石菖蒲n'], x['川芎n']),axis=1)

grouped_df3=pd.pivot_table(df3, index='三比', aggfunc='size')
total_count3 = grouped_df3.sum()
pivot_table_probability3 = grouped_df3 / total_count3


tt=pd.ExcelWriter(r'E:\数据分析\鱼\中药\定稿new.xlsx')
df.to_excel(tt,sheet_name="明细",index=False)
df3.to_excel(tt,sheet_name="三比",index=False)
df2_zhishi.to_excel(tt,sheet_name="志石",index=False)
df2_zhichuan.to_excel(tt,sheet_name="志川",index=False)
pivot_table_probability2.to_excel(tt,sheet_name="川")
pivot_table_probability1.to_excel(tt,sheet_name="石")
grouped_df1.to_excel(tt,sheet_name="石1")
grouped_df2.to_excel(tt,sheet_name="川1")
pivot_table_probability3.to_excel(tt,sheet_name="3")
grouped_df3.to_excel(tt,sheet_name="33")


print(df3['三比'])
pinci(df)

tt.save()

