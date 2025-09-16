#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import datetime
from datetime import timedelta

# 注意:
# input()返回的是字符串
# 必须通过int()将字符串转换为整数
# 才能用于数值比较:
age = int(input('Input your age: '))

if age >= 18:
    print('adult')
elif age >= 6:
    print('teenager')
else:
    print('kid')

class get_month_range(object):
    def evaluate(self, start_date, end_date):
        # 将字符串转换为日期对象
        start = datetime.strptime(start_date, "%Y%m")
        end = datetime.strptime(end_date, "%Y%m")

        # 初始化年月序列列表
        dates = []

        # 当前日期初始化为开始日期
        current = start

        # 计算并添加每个月到列表中，直到达到结束日期
        while current <= end:
            # 添加当前日期（格式化为YYYYMM）
            dates.append(current.strftime("%Y%m"))
            # 进入下一个月
            current += timedelta(days=32)  # 超出一个月
            current = current.replace(day=1)  # 重置到下个月的第一天

        return dates