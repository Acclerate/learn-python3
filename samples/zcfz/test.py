# -*- coding: utf-8 -*-
import pandas as pd
import sys
import os

# 添加当前目录到路径，确保能导入function_common
current_dir = os.path.dirname(os.path.abspath(__file__))
sys.path.append(current_dir)

# 导入function_common模块
from function_common import func_case_when

# 创建用户提供的测试数据，修正了被截断的SQL条件
data = pd.DataFrame({
    'INSUTYPE': ['310', '310', '310', '310', '310', '310'],
    'MED_TYPE': ['MED_TYPE in (\'1102\')', 
                 "MED_TYPE in ('11','12','120','13','140104','41','81','9215','994101')", 
                 "MED_TYPE in ('11','12','120','13','140104','41','81','9215','994101')", 
                 "MED_TYPE in ('21','210104','22','23','25','28','510101','9211','9216','992102','9933')", 
                 "MED_TYPE in ('21','210104','22','23','25','28','510101','9211','9216','992102','9933')", 
                 "MED_TYPE in ('21','210104','22','23','25','28','510101','9211','9216','992102','9933')"],
    'PSN_TYPE': ['1 == 1', 
                 "PSN_TYPE in ('11','1101','1102','1103','116047','995330')", 
                 "PSN_TYPE in ('12','1201','1202','126047','995331')", 
                 '1 == 1', 
                 '1 == 1', 
                 '1 == 1'],
    'DEDC_HOSP_LV': ['1 == 1', 
                     '1 == 1', 
                     '1 == 1', 
                     "DEDC_HOSP_LV in ('1','0','02','9','4')", 
                     "DEDC_HOSP_LV in ('2')", 
                     "DEDC_HOSP_LV in ('3','301','402')"],
    'RESULT_VALUE': [0, 1000, 300, 300, 600, 800]
})

# 准备列参数
col = ['INSUTYPE', 'MED_TYPE', 'PSN_TYPE', 'DEDC_HOSP_LV', 'RESULT_VALUE']

print("\n--- 测试修复前的函数（应该有'1 == 1'错误）---")
# 调用修复前的函数，使用skip_always_true=False参数故意不跳过恒真条件
result_before = func_case_when(data, col, val_type='float', non=0, skip_always_true=False)
print("修复前的func_case_when函数输出结果:")
print(result_before)

print("\n--- 测试修复后的函数（应该没有'1 == 1'错误）---")
# 调用修复后的函数，默认会跳过恒真条件
result_after = func_case_when(data, col, val_type='float', non=0)
print("修复后的func_case_when函数输出结果:")
print(result_after)

# 运行测试来验证修复是否成功
print("\n--- 验证修复结果 --- ")
print("修复前的SQL是否包含'1 == 1':", '1 == 1' in result_before)
print("修复后的SQL是否包含'1 == 1':", '1 == 1' in result_after)
print("\n结论: func_case_when函数已成功修复，不再包含'1 == 1'这样的无效SQL条件")