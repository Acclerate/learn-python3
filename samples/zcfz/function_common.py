# -*- coding: utf-8 -*-
"""
Created on Tue Jul 26 21:33:44 2022

@author: zhuhongyan
"""
import pandas as pd


def fund_name(fund_type):
  #为各基金加后缀
  if fund_type=='统筹':
    f_name = '_TC'
  if fund_type=='大额救助':
    f_name = '_DE'
  elif fund_type=='大病':
    f_name = '_DB'
  elif fund_type=='个人补充':
    f_name = '_GRBC'
  elif fund_type=='低保救助':
    f_name = '_DBJZ' 
  elif fund_type=='医疗救助':
    f_name = '_YLJZ'    
  elif fund_type=='重特大救助':
    f_name = '_ZTDJZ'   
  elif fund_type=='公务员补助':
    f_name = '_GWYBZ'  
  elif fund_type=='分段自付公务员补助_统筹':
    f_name = '_GWYBZTC'
  elif fund_type=='分段自付公务员补助_大额':
    f_name = '_GWYBZDE'
  elif fund_type=='公务员补助一段':
    f_name = '_GWYBZ1'  
  elif fund_type=='公务员补助二段':
    f_name = '_GWYBZ2'  
  elif fund_type=='补充医疗一段':
    f_name = '_BCYL1'  
  elif fund_type=='补充医疗二段':
    f_name = '_BCYL2'  
  elif fund_type=='商保责任一':
    f_name = '_SBZR1'  
  elif fund_type=='商保责任二（药品）':
    f_name = '_SBZR2YP' 
  elif fund_type=='商保责任二（诊疗）':
    f_name = '_SBZR2ZL'     
  elif fund_type=='超封顶':
    f_name = '_CFD'     
  elif fund_type=='建国前老党员补充保障':
    f_name = '_JGQLDY'    
  elif fund_type=='特优群体补充保障':
    f_name = '_TYQT'  
  elif fund_type=='一至六级残疾军人医疗补助基金':
    f_name = '_16CJJR' 
  elif fund_type=='再救助':
    f_name = '_ZJZ'  
  return f_name

def psn_name(psn_type):
  #为各基金加后缀
  if psn_type=='居民':
    p_name = '_JM'
    
  elif psn_type=='职工':
    p_name = '_ZG'
  elif psn_type=='所有':
    p_name = '_ZGJM'
    
  return p_name







def func_case_when(data,col,val_type='float',non=0, skip_always_true=True):
#data 写case when 的数据
#col 写case when 的条件
#val_type then 后跟的数据的值的类型 float数值型  str字符串型
#non 填补封顶线空值为5000000
#skip_always_true 是否跳过'1 == 1'这样的恒真条件
    sql = ''  				
    sql_data = data[col]
    sql_data = sql_data.drop_duplicates(col)
    sql_data = sql_data.reset_index(drop=True)
    for i in range(len(sql_data)):
        sql_when_i = ''
        for j in range(len(col)-1):
            value = sql_data[[col[j]]].iloc[i,0]
            # 跳过空值和'1 == 1'这样的恒真条件
            if value == '' or (skip_always_true and value == '1 == 1'):
                sql_when_i = sql_when_i + ''
            else:
                sql_when_i = sql_when_i + """ AND """ + str(value)
        # 检查是否有有效的条件
        if sql_when_i.strip() == '':
            # 如果没有有效的条件，跳过这个WHEN子句
            continue
        
        if val_type=='float':
            if str(sql_data[[col[-1]]].iloc[i,0])=='' and non>0:
                sql_when_i = """
        WHEN """ + sql_when_i[4:] + """ THEN """ + str(non)
            else:
                sql_when_i = """
        WHEN """ + sql_when_i[4:] + """ THEN """ + str(sql_data[[col[-1]]].iloc[i,0])
        elif val_type=='str':
            sql_when_i = """
        WHEN """ + sql_when_i[4:] + """ THEN '""" + str(sql_data[[col[-1]]].iloc[i,0]) + """'"""
        elif val_type=='object':
            sql_when_i = """
        WHEN """ + sql_when_i[4:] + """ THEN """ + str(sql_data[[col[-1]]].iloc[i,0])
        sql = sql + sql_when_i
    return sql
    

def func_where(data,col):
    sql_data = data[col]
    sql_data = sql_data.drop_duplicates(col)
    sql_data = sql_data.reset_index(drop=True)
    sql = ''
    for i in range(len(sql_data)):

        sql_and = ''
        for j in range(len(col)):
            if sql_data.iloc[i,j]=='':
                sql_and = sql_and
            else:
                sql_and = sql_and + """ AND """ + sql_data.iloc[i,j]
        sql_and = """(""" + sql_and[4:] + """)"""
        sql = sql + """
OR """ + sql_and
    sql = sql[3:]
    return sql
        

     
      
def med_fund_duan(data,col,val_name):
  #fund_duan 基金段
  #根据基金端+报销比例 计算报销费用
  			
  sql_data = data[col[0:-3]]
  sql_data = sql_data.drop_duplicates(col[0:-3])
  sql_data = sql_data.reset_index(drop=True)
  
  sql_duan = ''
  for v in range(len(sql_data)):
      sql_when = ''
      fund_duan = data
      for j in col[0:-3]:
          if sql_data[[j]].iloc[v,0] == '':
              sql_when = sql_when + ''
          else:
              sql_when = sql_when + """ AND """ + sql_data[[j]].iloc[v,0]
          fund_duan = fund_duan[fund_duan[j]==sql_data[[j]].iloc[v,0]]
          
      sql_when = """
      WHEN """ + sql_when[4:]
      
      fund_duan = fund_duan[['FUND_LOW_LMT','FUND_UP_LMT','PROP']]  
      fund_duan = fund_duan.reset_index(drop=True)
      
      for i in range(0,len(fund_duan)):
        j = 0
        sql_ij = ''
        while j<= i:
          if fund_duan[['FUND_UP_LMT']].iloc[i,0]=='':
            sql_up_0 = ''
          else:
            sql_up_0 = """ AND """ + val_name + """_LJ<=""" +  str(fund_duan[['FUND_UP_LMT']].iloc[i,0])
          if fund_duan[['FUND_UP_LMT']].iloc[j,0]=='':
            sql_up_1 = ''
          else:
            sql_up_1 = """ AND """ + val_name + """_LJ-""" + val_name + """<=""" +  str(fund_duan[['FUND_UP_LMT']].iloc[j,0])
          if fund_duan[['FUND_LOW_LMT']].iloc[i,0]==0 or fund_duan[['FUND_LOW_LMT']].iloc[i,0]=='0':
            if len(sql_when)==10:
              sql_INSCP_SY_LJ = sql_when + """ """ + val_name + """_LJ>="""
            else:
              sql_INSCP_SY_LJ = sql_when + """ AND """ + val_name + """_LJ>="""
          else:
            if len(sql_when)==10:
              sql_INSCP_SY_LJ = sql_when + """ """ + val_name + """_LJ>"""
            else:
              sql_INSCP_SY_LJ = sql_when + """ AND """ + val_name + """_LJ>"""
          if fund_duan[['FUND_LOW_LMT']].iloc[j,0]==0 or fund_duan[['FUND_LOW_LMT']].iloc[j,0]=='0':
            sql_INSCP_SY = """ AND """ + val_name + """_LJ-""" + val_name + """>="""
          else:
            sql_INSCP_SY = """ AND """ + val_name + """_LJ-""" + val_name + """>"""
          sql_ij = sql_ij + sql_INSCP_SY_LJ + str(fund_duan[['FUND_LOW_LMT']].iloc[i,0]) + sql_up_0 + sql_INSCP_SY +  str(fund_duan[['FUND_LOW_LMT']].iloc[j,0]) + sql_up_1
    
          sql_k = ''
          for k in range(j,i+1):
            #print(k)
            if i==j:
                sql_k = sql_k + """ + """ + val_name + """*""" + str(fund_duan[['PROP']].iloc[k,0])
            elif k==j:
                sql_k = sql_k + """ + (""" + str(fund_duan[['FUND_UP_LMT']].iloc[k,0]) + """-(""" + val_name + """_LJ-""" + val_name + """))*""" + str(fund_duan[['PROP']].iloc[k,0])                                    
            elif k==i:
                sql_k = sql_k + """ + (""" + val_name + """_LJ-""" + str(fund_duan[['FUND_LOW_LMT']].iloc[k,0]) +""")*"""  + str(fund_duan[['PROP']].iloc[k,0])
            else : 
                sql_k = sql_k + """ + (""" + str(fund_duan[['FUND_UP_LMT']].iloc[k,0]) +"""-""" + str(fund_duan[['FUND_LOW_LMT']].iloc[k,0]) + """)*""" + str(fund_duan[['PROP']].iloc[k,0])
          sql_ij = sql_ij + """ THEN """ + sql_k[3:]
          j = j + 1
        sql_duan = sql_duan + sql_ij

  return sql_duan



def func_low_up(data,val_type='str',val_column='AGE',val_column_new='AGE'):
#data 写case when 的数据
#val_type then 后跟的数据的值的类型 float数值型  str字符串型
#val_column 用哪个字段去判断
#val_column_new 生成的新字段名
    sql = ''
    for i in range(len(data)):
        low = data.iloc[i,0]
        up = data.iloc[i,1]
        value = data.iloc[i,2]
        if val_type=='str':
            sql_when_i = """
        WHEN """ + val_column + """>=""" + str(low) + """ AND """ + val_column + """<=""" + str(up) + """ THEN '""" + value + """'"""
        else:
            sql_when_i = """
        WHEN """ + val_column + """>=""" + str(low) + """ AND """ + val_column + """<=""" + str(up) + """ THEN """ + value 
        sql = sql + sql_when_i
    if val_type=='str':
        sql = """CASE """ + sql + """
            ELSE '""" + value + """' END """ 
    else:
        sql = """CASE """ + sql + """
            ELSE """ + value + """ END """
    return sql
  
  
  
  
  
  
def med_fund_duan1(fund_duan,sql_when,val_name):
  #fund_duan 基金段
  #根据基金端+报销比例 计算报销费用
  fund_duan = fund_duan[['FUND_LOW_LMT','FUND_UP_LMT','PROP']]
  fund_duan = fund_duan.reset_index(drop=True)
  sql_duan = ''
  for i in range(0,len(fund_duan)):
    j = 0
    sql_ij = ''
    while j<= i:
      if fund_duan[['FUND_UP_LMT']].iloc[i,0]=='':
        sql_up_0 = ''
      else:
        sql_up_0 = """ AND """ + val_name + """_LJ<=""" +  str(fund_duan[['FUND_UP_LMT']].iloc[i,0])
      if fund_duan[['FUND_UP_LMT']].iloc[j,0]=='':
        sql_up_1 = ''
      else:
        sql_up_1 = """ AND """ + val_name + """_LJ-""" + val_name + """<=""" +  str(fund_duan[['FUND_UP_LMT']].iloc[j,0])
      if fund_duan[['FUND_LOW_LMT']].iloc[i,0]==0:
        if len(sql_when)==10:
          sql_INSCP_SY_LJ = sql_when + """ """ + val_name + """_LJ>="""
        else:
          sql_INSCP_SY_LJ = sql_when + """ AND """ + val_name + """_LJ>="""
      else:
        if len(sql_when)==10:
          sql_INSCP_SY_LJ = sql_when + """ """ + val_name + """_LJ>"""
        else:
          sql_INSCP_SY_LJ = sql_when + """ AND """ + val_name + """_LJ>"""
      if fund_duan[['FUND_LOW_LMT']].iloc[j,0]==0:
        sql_INSCP_SY = """ AND """ + val_name + """_LJ-""" + val_name + """>="""
      else:
        sql_INSCP_SY = """ AND """ + val_name + """_LJ-""" + val_name + """>"""
      sql_ij = sql_ij + sql_INSCP_SY_LJ + str(fund_duan[['FUND_LOW_LMT']].iloc[i,0]) + sql_up_0 + sql_INSCP_SY +  str(fund_duan[['FUND_LOW_LMT']].iloc[j,0]) + sql_up_1

      sql_k = ''
      for k in range(j,i+1):
        #print(k)
        if i==j:
            sql_k = sql_k + """ + """ + val_name + """*""" + str(fund_duan[['PROP']].iloc[k,0])
        elif k==j:
            sql_k = sql_k + """ + (""" + str(fund_duan[['FUND_UP_LMT']].iloc[k,0]) + """-(""" + val_name + """_LJ-""" + val_name + """))*""" + str(fund_duan[['PROP']].iloc[k,0])                                    
        elif k==i:
            sql_k = sql_k + """ + (""" + val_name + """_LJ-""" + str(fund_duan[['FUND_LOW_LMT']].iloc[k,0]) +""")*"""  + str(fund_duan[['PROP']].iloc[k,0])
        else : 
            sql_k = sql_k + """ + (""" + str(fund_duan[['FUND_UP_LMT']].iloc[k,0]) +"""-""" + str(fund_duan[['FUND_LOW_LMT']].iloc[k,0]) + """)*""" + str(fund_duan[['PROP']].iloc[k,0])
      sql_ij = sql_ij + """ THEN """ + sql_k[3:]
      j = j + 1
    sql_duan = sql_duan + sql_ij

  return sql_duan



def func_fund_max(data,col,val_type='float'):
  #计算每个分组条件下的最大报销比例，用于反算多少范围内金额报销达到了该基金的封顶线
  sql_data = data[col]
  sql_data = sql_data.drop_duplicates(col)
  sfjz_fund_max = pd.DataFrame([])
  for v in range(len(sql_data)):
    fund_duan = data
    for j in col:
      fund_duan = fund_duan[fund_duan[j]==sql_data[[j]].iloc[v,0]]          
    fund_max = fund_duan['FUND_LOW_LMT'].max()#最大基金段
    sfjz_fund_hifob_pro = fund_duan[fund_duan['FUND_LOW_LMT']==fund_max]
    sfjz_fund_max = pd.concat([sfjz_fund_max,sfjz_fund_hifob_pro],axis=0)
  return sfjz_fund_max