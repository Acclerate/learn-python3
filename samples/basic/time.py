import ctypes
import os
import ctypes

def get_video_duration(file_path):
  """获取视频时长

  Args:
    file_path: 视频文件路径

  Returns:
    视频时长，单位为秒 (or 0 on error)
  """

  file_info = ctypes.WinDLL('kernel32').GetFileAttributesExW(file_path)
  if file_info == -1:
      print(f"Error getting file attributes for {file_path}")
      return 0  # Handle error or return a default value

  # Assuming successful return, extract timestamps
  create_time = file_info.ftCreationTime
  last_write_time = file_info.ftLastWriteTime
  duration = (last_write_time - create_time).seconds
  return duration

def get_total_video_duration(dir_path):
  """获取文件夹下所有视频的总时长

  Args:
    dir_path: 文件夹路径

  Returns:
    视频总时长，单位为秒
  """

  total_duration = 0
  for file_name in os.listdir(dir_path):
    file_path = os.path.join(dir_path, file_name)
    if os.path.isfile(file_path) and file_name.lower().endswith('.mp4'):
      total_duration += get_video_duration(file_path)
  return total_duration

def seconds_to_hms(seconds):
  """将秒转换为小时分钟秒

  Args:
    seconds: 秒数

  Returns:
    小时分钟秒字符串
  """

  hours = seconds // 3600
  minutes = (seconds % 3600) // 60
  seconds = seconds % 60
  return f'{hours:02d}:{minutes:02d}:{seconds:02d}'

# if __name__ == '__main__':
#   dir_path = 'E:\\math_viedos'
#   total_duration = get_total_video_duration(dir_path)
#   print(f'文件夹下所有视频的总时长为：{seconds_to_hms(total_duration)}')
import datetime

def generate_year_month_array(start_date, end_date):
    start_year, start_month = int(start_date[:4]), int(start_date[4:])
    end_year, end_month = int(end_date[:4]), int(end_date[4:])

    year_month_array = []
    for year in range(start_year, end_year + 1):
        for month in range(1, 13):
            if year == end_year and month > end_month:
                break
            if year == start_year and month < start_month:
                continue
            year_month = f"{year}{month:02d}"
            year_month_array.append(year_month)
    return year_month_array


def get_half_year_before_date(date_str):
    year = int(date_str[:4])
    month = int(date_str[4:])
    print(year, month)
    if month < 7:
        year -= 1
        month += 6
    else:
        month -= 6
    # 确保月份在1-12之间
    month = ((month - 1) % 12) + 1
    return "{:04d}{:02d}".format(year, month)

from datetime import datetime
from dateutil.relativedelta import relativedelta


from datetime import datetime, timedelta

def get_five_months_before_date(date_str):

    # 将字符串转换为日期对象
    date_obj = datetime.strptime(date_str, "%Y%m")

    # 使用relativedelta从日期中减去五个月
    five_months_ago = date_obj - relativedelta(months=5)

    # 格式化日期为 "YYYYMM" 字符串
    result_date_str = five_months_ago.strftime("%Y%m")

    return result_date_str

def test_generate_year_month_array():
    # 测试起始和结束日期相同
    assert generate_year_month_array('202407', '202407') == ['202407']

    # 测试起始日期早于结束日期
    assert generate_year_month_array('202301', '202407') == ['202301', '202302', '202303', '202304', '202305', '202306', '202307', '202308', '202309', '202310', '202311', '202312', '202401', '202402', '202403', '202404', '202405', '202406', '202407']

    # 测试起始日期晚于结束日期，应返回空列表
    assert generate_year_month_array('202407', '202301') == []

    # 测试跨多年的情况
    assert generate_year_month_array('202005', '202212') == ['202005', '202006', '202007', '202008', '202009', '202010', '202011', '202012', '202101', '202102', '202103', '202104', '202105', '202106', '202107', '202108', '202109', '202110', '202111', '202112', '202201', '202202', '202203', '202204', '202205', '202206', '202207', '202208', '202209', '202210', '202211', '202212']

def evaluateaaaa( date_str):
    # 将字符串转换为日期对象
    date_obj = datetime.strptime(date_str, "%Y%m")

    # 减去五个月
    five_months_ago = date_obj - timedelta(days=150)

    # 调整天数以确保我们确实是在上一个周期的最后一天（如果需要的话）
    # 这是为了处理从一个月的最后一天减去几个月的情况
    while five_months_ago.day > 28:
        five_months_ago -= timedelta(days=1)

    # 格式化日期为 "YYYYMM" 字符串
    result_date_str = five_months_ago.strftime("%Y%m")

    return result_date_str

if __name__ == '__main__':
  # print(generate_year_month_array('202201','202407'))
  print(evaluateaaaa('202406'))