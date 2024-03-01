import datetime

def dateRangeByMonth(beginDate, endDate):
    begin_date = datetime.datetime.strptime(beginDate, "%Y%m")
    end_date = datetime.datetime.strptime(endDate, "%Y%m")

    dates = [begin_date.strftime("%Y%m")]
    current_date = begin_date
    while current_date <= end_date:
        current_date += datetime.timedelta(days=32)  # 跳到下个月
        current_date = current_date.replace(day=1)  # 设置为新的月份的第一天
        dates.append(current_date.strftime("%Y%m"))

    return dates[:-1], len(dates) - 1  # 不包含结束月份的下一个月

# 指定分区范围 beginDate……endDate（忽略日期部分，只取年月）
dates_list, total_months = dateRangeByMonth('202201', '202403')

for index, partition_str in enumerate(dates_list, start=1):  # 使用enumerate，并设置起始索引为1
    print(f"{partition_str}  {index}  {total_months}")


    