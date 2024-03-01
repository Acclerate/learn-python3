# 业务空间模型调用请参考文档传入workspace信息: https://help.aliyun.com/document_detail/2746874.html

from http import HTTPStatus
from dashscope import Generation

# sk-24848338bb8f4d1fbc6ab2f56a70b38a

def call_with_stream():
    messages = [
        {'role': 'user', 'content': '如何做西红柿炖牛腩？'}]
    responses = Generation.call("qwen-max",
                                messages=messages,
                                result_format='message',  # 设置输出为'message'格式
                                stream=True,  # 设置输出方式为流式输出
                                incremental_output=True  # 增量式流式输出
                                )
    for response in responses:
        if response.status_code == HTTPStatus.OK:
            print(response.output.choices[0]['message']['content'], end='')
        else:
            print('Request id: %s, Status code: %s, error code: %s, error message: %s' % (
                response.request_id, response.status_code,
                response.code, response.message
            ))


if __name__ == '__main__':
    call_with_stream()