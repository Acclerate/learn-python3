import requests
import time
import sys
from tkinter import messagebox

def fetch_doctor_schedule(api_url, params):
    # 发送 GET 请求
    response = requests.get(api_url, params=params)

    # 检查请求是否成功
    if response.status_code == 200:
        # 返回 API 返回的 JSON 数据
        return response.json()
    else:
        print("Failed to fetch doctor schedule.")
        return None

def check_and_notify(left_source):
    if left_source != 0:
        # 如果 left_source 不为零，则弹出提示框
        messagebox.showinfo("提示", "医生日程有余号，请尽快预约！")

# API 端点 URL
api_url = 'https://mix.whxh.com.cn/api/customize/latest/getdoctorallschedule'

# 定义两个日期的请求参数
request_params_list = [
    {
        'scheduleDate': '2024-04-17',
        'sign': '26AB64AE6506E849F365F09BD110DBD1'
    },
    {
        'scheduleDate': '2024-04-16',
        'sign': 'ABA5969768675F0DB00D1CABE4D54351'
    }
]

# 主循环，每十五分钟执行一次
while True:
    for params in request_params_list:
        # 设置共同的参数
        params.update({
            '_route': 'h187',
            'login_access_token': '1712641386503-364384BC7549685DFBA840',
            'hisId': '187',
            'platformId': '187',
            'platformSource': '3',
            'subSource': '1',
            'subHisId': '18701',
            'deptId': '44_387',
            'doctorId': '1-929',
            't': '202404'
        })

        # 获取医生的日程信息
        doctor_schedule = fetch_doctor_schedule(api_url, params)

        # 处理获取到的日程信息
        if doctor_schedule:
            left_source = doctor_schedule['data']['doctorScheduleList'][0]['schedules'][0]['leftSource']
            print("Left Source for schedule date", params['scheduleDate'], ":", left_source)
            check_and_notify(left_source)
        else:
            print("Failed to fetch doctor schedule for schedule date", params['scheduleDate'])

    # 休眠十五分钟
    time.sleep(15 * 60)  # 单位为秒，所以这里是 15 分钟
