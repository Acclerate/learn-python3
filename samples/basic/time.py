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

if __name__ == '__main__':
  dir_path = 'E:\\math_viedos'
  total_duration = get_total_video_duration(dir_path)
  print(f'文件夹下所有视频的总时长为：{seconds_to_hms(total_duration)}')
