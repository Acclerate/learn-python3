# -*- coding: UTF-8 -*-
"""
输入latex公式、参数名，读取数据，计算结果
"""
import sys

from latex2sympy2 import latex2sympy
from sympy import symbols, lambdify
import numpy as np
import json
from copy import deepcopy

def common_latex_calculate_params(data_ndarray, param_name_list, latex_formula):
    """
    根据 LaTeX 公式和参数计算数据的结果。

    :param data_ndarray: 包含数据的 NumPy 数组
    :param param_name_list: 参数的字符串列表
    :param latex_formula: LaTeX 公式字符串
    :return: 计算结果的数组
    """
    # 计算参数数量
    params_num = len(param_name_list)

    # 输入验证
    if not isinstance(data_ndarray, np.ndarray) or data_ndarray.ndim != 2 or data_ndarray.size == 0:
        raise ValueError("data 应该是一个非空的二维 NumPy 数组")
    if len(param_name_list) != params_num:
        raise ValueError(f"params 列表应包含 {params_num} 个参数")

    try:
        # 定义符号变量
        symbol_list = symbols(param_name_list)

        # LaTeX 公式
        # 将 LaTeX 公式转换为 SymPy 表达式
        sympy_expr = latex2sympy(latex_formula)

        # 使用lambdify将SymPy表达式转换为可以接受NumPy数组的函数
        f = lambdify(symbol_list, sympy_expr, 'numpy')

        # 使用NumPy数组计算每组数据的结果
        if data_ndarray.shape[1] != params_num:
            raise ValueError("数据的列数与参数数量不匹配")
        return f(*data_ndarray.T)
        # 逐行计算，返回原数值和计算结果
        # return np.column_stack((data_ndarray, f(*data_ndarray.T)))
    except Exception as e:
        # 异常处理
        print(f"处理 LaTeX 公式时发生错误: {e}")
        return None

def latex_cal(param_name_list,param_file_name,latex_formula,data_file_name):
    with open(param_file_name, 'r') as f:
        data_list = json.load(f,parse_int=float)

    parm_name_s=[parm.replace(r'\text{','').replace('}','') for parm in param_name_list]
    # val_list=[[(item[name] if item[name]!=None else 0 ) if name in item else 0 for name in parm_name_s] for item in data_list]
    val_list=[[item.get(name,0) if item.get(name,0)!=None else 0 for name in parm_name_s] for item in data_list]
    data_ndarray=np.array(val_list).astype(float)

    # 防止冲突 替换变量名
    param_name_list_new = [rf"\text{{para{str(i)}}}" for i in range(len(param_name_list))]
    latex_formula_new = deepcopy(latex_formula)
    for index,para in enumerate(param_name_list_new):
        latex_formula_new = latex_formula_new.replace(param_name_list[index],para)

    results = common_latex_calculate_params(data_ndarray, param_name_list_new, latex_formula_new)

    results[np.isinf(results)]=None

    data_res=data_list[:]
    for index,item in enumerate(data_res):
        for parm_name in parm_name_s:
            if parm_name in item:
                item.pop(parm_name)
        item["fomlCalRslt"]=results[index] if not np.isnan(results[index]) else None
        item["succFlag"]="0" if np.isnan(results[index]) else "1"

    with open(data_file_name, 'w') as f:
        json.dump(data_res,f,indent=4)
    

# 主程序入口
if __name__ == '__main__':
    # python
    # latex_calculate.py
    # "\text{STAF_INSU_PSNCNT},\text{RSDT_INSU_PSNCNT}" "\text{STAF_INSU_PSNCNT} +\text{RSDT_INSU_PSNCNT} " "f_20240821171548_544_input" "f_20240821171548_544_result"

    # # 获取计算参数名称
    # param_name_str = sys.argv[1]
    #
    # # param_name_str 转换成数组 param_name_list
    # param_name_list = param_name_str.split(',')
    # # 获取计算公式
    # latex_formula = sys.argv[2]
    # # 获取计算参数文件名称
    # param_file_name = sys.argv[3]
    # # 获取计算结果文件名
    # data_file_name = sys.argv[4]

    # 获取计算参数名称
    param_name_str = "STAF_INSU_PSNCNT,RSDT_INSU_PSNCNT"
    # param_name_str 转换成数组 param_name_list
    param_name_list = param_name_str.split(',')
    # 获取计算公式
    latex_formula = "STAF_INSU_PSNCNT+RSDT_INSU_PSNCNT"
    # # 获取计算参数文件名称
    param_file_name = "f_20240821171548_544_input"
    # # 获取计算结果文件名
    data_file_name = "f_20240821171548_544_result"
    latex_cal(param_name_list=param_name_list,param_file_name=param_file_name,latex_formula=latex_formula,data_file_name=data_file_name)

    # 读取datalist中的数据
    # with open(param_file_name, 'r') as f:
    #     data_string = f.read().strip()
    # with open(param_file_name, 'r') as file:
    #     data_list = [[float(num) for num in line.strip().split(',')] for line in file]
    # # 将data_list转换为NumPy数组
    # data_ndarray = np.array(data_list).reshape(-1, len(param_name_list))

    # # 计算并打印每组数据的上限置信限
    # results = common_latex_calculate_params(data_ndarray, param_name_list, latex_formula)

    # # 循环results，把结果写入结果文件data_result
    # with open(data_file_name, 'w') as f:
    #     for i in range(len(results)):
    #         f.write(str(results[i]) + '\n')

