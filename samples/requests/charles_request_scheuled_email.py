import schedule
import time
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
import requests
from datetime import datetime
import random

def fetch_doctor_schedule(api_url, params):
    # 发送 GET 请求
    response = requests.get(api_url, params=params)

    # 检查请求是否成功
    if response.status_code == 200:
        # 返回 API 返回的 JSON 数据
        print(response.json())
        return response.json()
    else:
        print("Failed to fetch doctor schedule.")
        return None
    
def send_email(scheduleDate):
    # 设置邮件内容
    sender_email = "juniorshy@foxmail.com"
    receiver_email = "juniorshy@foxmail.com"
    password = "itlwejfajyflegcb"

    message = MIMEMultipart()
    message["From"] = sender_email
    message["To"] = receiver_email
    message["Subject"] = "医生日程有余号提醒"
    body = f"医生日程{scheduleDate}有余号，请尽快预约！"
    message.attach(MIMEText(body, "plain"))

    # 发送邮件
    with smtplib.SMTP_SSL("smtp.qq.com", 465) as server:
        server.login(sender_email, password)
        server.sendmail(sender_email, receiver_email, message.as_string())

def job():
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

        # 调用 fetch_doctor_schedule 获取医生日程信息，并检查条件
        doctor_schedule = fetch_doctor_schedule(api_url, params)
         # 处理获取到的日程信息
        if doctor_schedule:
            left_source = doctor_schedule['data']['doctorScheduleList'][0]['schedules'][0]['leftSource']
            scheduleDate = doctor_schedule['data']['doctorScheduleList'][0]['scheduleDate']
            current_time = datetime.now()
            print("Left Source for schedule date", params['scheduleDate'], ":", left_source, ":",current_time)
              # 如果 left_source 不为零，则发送邮件
            if left_source != 0:
                send_email(scheduleDate)
        else:
            print("Failed to fetch doctor schedule for schedule date", params['scheduleDate'])
      

# request_params_list 列表定义
request_params_list = [
    # {
    #     'scheduleDate': '2024-04-17',
    #     'sign': '26AB64AE6506E849F365F09BD110DBD1'
    # },
    {
        'scheduleDate': '2024-04-16',
        'sign': 'ABA5969768675F0DB00D1CABE4D54351'
    }
]

# API 端点 URL 和请求参数
api_url = 'https://mix.whxh.com.cn/api/customize/latest/getdoctorallschedule'

# 设置定时任务，每隔 分钟执行一次 job 函数
schedule.every(15).minutes.do(job)

# 主循环
while True:
    schedule.run_pending()
    time.sleep(1)
# 接口响应参数
# Left Source for schedule date 2024-04-16 : 0 : 2024-04-10 09:26:46.674888
# {'code': 0, 'data': {'doctorScheduleList': [{'deptId': '44_387', 'deptName': '眼科专家', 'doctorId': '1-929', 'hisDeptId': '44', 'hisDeptName': '眼科专家', 'hisId': 18701, 'hisName': '主院区（江汉区）', 'scheduleDate': '2024-04-17', 'schedules': [{'deptId': '44_387', 'doctorId': '1-929', 'extFields': '{"assistantId":"","assistantName":"","lhmz_flag":"0","assistantTitle":"","xcqh":"0","jzsjid":"8","querytype":"1","remissionFlag":"0"}', 'hisDeptName': '眼科 专家', 'hisDeptNo': '44', 'hisId': 18701, 'leftSource': 0, 'registerFee': 2650, 'scheduleId': '1605079-8', 'status': 2, 'totalSource': 19, 'unionDept': 0, 'visitBeginTime': '', 'visitEndTime': '', 'visitPeriod': 1}], 'sortNo': 1}]}}
# Left Source for schedule date 2024-04-17 : 0 : 2024-04-10 09:31:47.817970
# {'code': 0, 'data': {'doctorScheduleList': [{'deptId': '44_387', 'deptName': '眼科专家', 'doctorId': '1-929', 'hisDeptId': '44', 'hisDeptName': '眼科专家', 'hisId': 18701, 'hisName': '主院区（江汉区）', 'scheduleDate': '2024-04-16', 'schedules': [{'deptId': '44_387', 'doctorId': '1-929', 'extFields': '{"assistantId":"","assistantName":"","lhmz_flag":"0","assistantTitle":"","xcqh":"0","jzsjid":"8","querytype":"1","remissionFlag":"0"}', 'hisDeptName': '眼科 专家', 'hisDeptNo': '44', 'hisId': 18701, 'leftSource': 0, 'registerFee': 2650, 'scheduleId': '1604295-8', 'status': 2, 'totalSource': 19, 'unionDept': 0, 'visitBeginTime': '', 'visitEndTime': '', 'visitPeriod': 1}], 'sortNo': 1}]}}