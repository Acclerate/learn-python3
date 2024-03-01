import requests

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

# API 端点 URL
api_url = 'https://mix.whxh.com.cn/api/customize/latest/getdoctorallschedule'

# GET 请求参数
params = {
    '_route': 'h187',
    'login_access_token': '1712641386503-364384BC7549685DFBA840',
    'hisId': '187',
    'platformId': '187',
    'platformSource': '3',
    'subSource': '1',
    'scheduleDate': '2024-04-16',
    'subHisId': '18701',
    'deptId': '44_387',
    'doctorId': '1-929',
    't': '202404',
    'sign': 'ABA5969768675F0DB00D1CABE4D54351'
}

# 获取医生的日程信息
doctor_schedule = fetch_doctor_schedule(api_url, params)

# 处理获取到的日程信息
if doctor_schedule:
    # print(doctor_schedule)
    # 假设 doctor_schedule 是你获取到的日程信息的 JSON 数据
    left_source = doctor_schedule['data']['doctorScheduleList'][0]['schedules'][0]['leftSource']
    print("Left Source:", left_source)
else:
    print("Failed to fetch doctor schedule.")
