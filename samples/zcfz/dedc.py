# -*- coding: utf-8 -*-
"""
Created on Thu Jul 21 10:27:00 2022

@author: zhuhongyan
"""


from trt.function_common import func_case_when


#正常支付（不是：个人账户先支付，个人账户不足的部分再报销）
#计算统筹的前提：起付线
def dedc(sfjz_dedc='',
        sfjz_fund='',
        tbbase='trt.',
        sql_lst=[],
        sql_drop_lst=[]):
  #sfjz_dedc:算法矩阵-起付线 
  #sfjz_fund:算法矩阵-基金支付政策
  #tbbase:数据库名
  version = str(sfjz_fund[['VERSION']].iloc[0,0])
    

  
  #起付线标准
  col = ['INSU_ADMDVS','INSUTYPE','MED_TYPE','OUTMED_FLAG','DEDC_HOSP_LV','MEDINS_TYPE','RLOC_REA','FIXMEDINS_CODE','POOR_FLAG','PSN_TYPE','PSN_IDET_TYPE','MAT_IDET_CODE','AGE','DISE_CODE','OPSP_DISE_CODE','MATN_TYPE','FETUS_CNT','DISC_COND','IPT_CNT','POL_BEGN_TIME','POL_END_TIME','DEDC_STD']
  sql_dedc_std = """
  CASE """ + func_case_when(sfjz_dedc,col,val_type='float') + """
  ELSE 0 END CAL_DEDC_STD -- 起付线标准
  """

  sql_setl_dedc_std = """
-- 统筹的起付线标准
DROP TABLE IF EXISTS """ + tbbase + """POLICY_SETL_D_DEDC_STD_""" + version + """ PURGE; 
CREATE TABLE """ + tbbase + """POLICY_SETL_D_DEDC_STD_""" + version + """  AS 
SELECT B.*, 
    """ + sql_dedc_std + """
    FROM """ + tbbase + """POLICY_SETL_D_BASIC_""" + version + """ B;  
"""

  sql_setl_dedc_std_drop = """
DROP TABLE IF EXISTS """ + tbbase + """POLICY_SETL_D_DEDC_STD_""" + version + """ PURGE ;
"""
  sql_lst.append(sql_setl_dedc_std) 
  sql_drop_lst.append(sql_setl_dedc_std_drop) 

  
  #根据起付线标准计算实际起付线（按次：转院/不转院、按年、按医院按年）
  
  #按次计算起付线
  #sfjz_dedc_zy = sfjz_dedc[sfjz_dedc['MED_TYPE_NAME']=='住院']
# =============================================================================
#   lst = [0,1,2,3]
#   sfjz_dedc_zy = sfjz_dedc[sfjz_dedc["MERG_DEDC_TYPE"].isin(lst)]
#   sfjz_dedc_zy[['MERG_DEDC_TYPE']] = sfjz_dedc_zy[['MERG_DEDC_TYPE']].astype(int)
#   sfjz_dedc_zy = sfjz_dedc_zy.reset_index(drop=True)
# =============================================================================
  
# =============================================================================
# 0：转院中途结算均不合并计算起付线
# 1：中途结算合并计算起付线
# 2：转院合并计算起付线
# 3：中途结算、转院均合并计算起付线
# =============================================================================
  #if len(sfjz_dedc_zy)==0:
  #0:转院中途结算均不合并计算起付线
  sql_cnt = """
  WHEN CALCWAY_DEDC='按次' AND INSCP_AMT_SY<=CAL_DEDC_STD THEN INSCP_AMT_SY
  -- 本次累计费用<=起付标准：本次费用
  WHEN CALCWAY_DEDC='按次' AND INSCP_AMT_SY>CAL_DEDC_STD THEN CAL_DEDC_STD
  -- 本次累计>起付标准 and 上次累计<起付标准:起付标准-上次累计费用 
"""
  
    
  #按年计算起付线
  sql_year = """
      WHEN CALCWAY_DEDC='按年' AND INSCP_AMT_SY_LJ_YYYY<=CAL_DEDC_STD THEN INSCP_AMT_SY 
      -- 本次累计费用<=起付标准：本次费用 
      WHEN CALCWAY_DEDC='按年' AND INSCP_AMT_SY_LJ_YYYY>CAL_DEDC_STD AND INSCP_AMT_SY_LJ_YYYY-INSCP_AMT_SY<=CAL_DEDC_STD THEN CAL_DEDC_STD-(INSCP_AMT_SY_LJ_YYYY-INSCP_AMT_SY)
      -- 本次累计>起付标准 and 上次累计<起付标准:起付标准-上次累计费用 
      WHEN CALCWAY_DEDC='按年' AND INSCP_AMT_SY_LJ_YYYY>CAL_DEDC_STD AND INSCP_AMT_SY_LJ_YYYY-INSCP_AMT_SY>CAL_DEDC_STD THEN 0
      -- 本次累计>起付标准 and 上次累计>起付标准:没有起付线了
"""
  
  #每家医院每年一次起付线
  sql_hos_year = """
    WHEN CALCWAY_DEDC='每家医院每年' AND CNT_HOS=1 AND INSCP_AMT_SY<=CAL_DEDC_STD THEN INSCP_AMT_SY 
    -- 该家医院第一次，本次累计费用<=起付标准：本次费用 """ + """
    WHEN CALCWAY_DEDC='每家医院每年' AND CNT_HOS=1 AND INSCP_AMT_SY>CAL_DEDC_STD THEN CAL_DEDC_STD
    -- 该家医院第一次，本次累计>起付标准： 起付标准""" + """
    WHEN CALCWAY_DEDC='每家医院每年' AND CNT_HOS>1 THEN 0
    -- 其余均没有起付线了
"""

 
   #按季度
  sql_q = """
      WHEN CALCWAY_DEDC='按季度' AND INSCP_AMT_SY_LJ_Q<=CAL_DEDC_STD THEN INSCP_AMT_SY 
      -- 本次累计费用<=起付标准：本次费用 
      WHEN CALCWAY_DEDC='按季度' AND INSCP_AMT_SY_LJ_Q>CAL_DEDC_STD AND INSCP_AMT_SY_LJ_Q-INSCP_AMT_SY<=CAL_DEDC_STD THEN CAL_DEDC_STD-(INSCP_AMT_SY_LJ_Q-INSCP_AMT_SY)
      -- 本次累计>起付标准 and 上次累计<起付标准:起付标准-上次累计费用 
      WHEN CALCWAY_DEDC='按季度' AND INSCP_AMT_SY_LJ_Q>CAL_DEDC_STD AND INSCP_AMT_SY_LJ_Q-INSCP_AMT_SY>CAL_DEDC_STD THEN 0
      -- 本次累计>起付标准 and 上次累计>起付标准:没有起付线了
"""

   
   #按月
  sql_mm = """
      WHEN CALCWAY_DEDC='按月' AND INSCP_AMT_SY_LJ_MM<=CAL_DEDC_STD THEN INSCP_AMT_SY 
      -- 本次累计费用<=起付标准：本次费用 
      WHEN CALCWAY_DEDC='按月' AND INSCP_AMT_SY_LJ_MM>CAL_DEDC_STD AND INSCP_AMT_SY_LJ_MM-INSCP_AMT_SY<=CAL_DEDC_STD THEN CAL_DEDC_STD-(INSCP_AMT_SY_LJ_MM-INSCP_AMT_SY)
      -- 本次累计>起付标准 and 上次累计<起付标准:起付标准-上次累计费用 
      WHEN CALCWAY_DEDC='按月' AND INSCP_AMT_SY_LJ_MM>CAL_DEDC_STD AND INSCP_AMT_SY_LJ_MM-INSCP_AMT_SY>CAL_DEDC_STD THEN 0
      -- 本次累计>起付标准 and 上次累计>起付标准:没有起付线了
"""

 
  sql_dedc = """
                CASE """ + sql_cnt + sql_year + sql_hos_year + sql_q + sql_mm + """
                  ELSE 0 END AS CAL_DEDC_TC  -- 模拟计算报销时候用的支付起付线    
    """


  
  sql_setl_dedc_1 = """
-- 非按年收取一次，不足补齐：计算统筹的起付线+扣除起付线之后的剩余金额
DROP TABLE IF EXISTS """ + tbbase + """POLICY_SETL_D_DEDC_1_""" + version + """ PURGE; 
CREATE TABLE """ + tbbase + """POLICY_SETL_D_DEDC_1_""" + version + """  AS 
SELECT D.*,
COALESCE(INSCP_AMT_SY,0)-COALESCE(CAL_DEDC_TC,0) INSCP_SY_LMT, -- 去除起付线之后的剩余金额
CASE WHEN COALESCE(INSCP_AMT_SY,0)-COALESCE(CAL_DEDC_TC,0)<=INSCP_AMT THEN COALESCE(INSCP_AMT_SY,0)-COALESCE(CAL_DEDC_TC,0) ELSE INSCP_AMT_SY_0 END INSCP_SY -- 去除起付线之后的剩余金额
FROM
    (SELECT A.*,
          """ + sql_dedc + """  
          FROM """ + tbbase + """POLICY_SETL_D_DEDC_STD_""" + version + """ A
          WHERE CALCWAY_DEDC!='按年收取一次，不足补齐') D;  
"""

  sql_setl_dedc_1_drop = """
DROP TABLE IF EXISTS """ + tbbase + """POLICY_SETL_D_DEDC_1_""" + version + """ PURGE ;
"""
  sql_lst.append(sql_setl_dedc_1) 
  sql_drop_lst.append(sql_setl_dedc_1_drop) 
  
  #起付线计算方式
  #按次、按年、按季度、按月、'按年收取一次，不足补齐'（一次收一次起付线，两次及以上的按照高医院等级的起付线收取，不足的补齐）
  if len(sfjz_dedc[sfjz_dedc['DEDC_CALC_WAY']=='按年收取一次，不足补齐'])>0:

    sql_setl_dedc_2 = """
-- 按年收取一次，不足补齐：计算统筹的起付线+扣除起付线之后的剩余金额
DROP TABLE IF EXISTS """ + tbbase + """POLICY_SETL_D_DEDC_2_""" + version + """ PURGE; 
CREATE TABLE """ + tbbase + """POLICY_SETL_D_DEDC_2_""" + version + """  AS 
SELECT 
INSUTYPE_NAME_INCEXPD,
PSN_TYPE_NAME_INCEXPD,
MED_TYPE_NAME_INCEXPD,
AGE_NO_INCEXPD,
GEND_NAME_INCEXPD,
HOSP_LV_NAME_INCEXPD,
PSN_TYPE_SMLT,
PSN_TYPE_NAME_SMLT,
DEDC_HOSP_LV_NAME_SMLT,
MED_TYPE_NAME_SMLT,
INSU_ADMDVS_NEW,
INSU_ADMDVS,
FIX_BLNG_ADMDVS,
INSUTYPE,
PSN_NO,
BRDY,
GEND,
SETL_ID,
MDTRT_ID,
BEGNDATE,
ENDDATE,
SETL_TIME,
SETL_YYYY,
SETL_Q,
SETL_MM,
FIXMEDINS_CODE,
FIXMEDINS_NAME,
MED_TYPE,
SETL_TYPE,
PSN_TYPE,
DISE_NO,
DISE_NAME,
DEDC_HOSP_LV,
FLAG_MIDSETL,
MATN_TYPE,
FETUS_CNT,
FLAG_ZY,
MEDINS_TYPE,
CLR_WAY,
CVLSERV_FLAG,
BUSI_INSU_FLAG,-- 商保参保标志
HIFES_INSU_FLAG,-- 补充医疗参保标志
SP_PSN_TYPE,
MEDFEE_SUMAMT,
INSCP_AMT_OLD,
INSCP_AMT,
INSCP_AMT_LMT,
HIFMI_PRESELFPAY_AMT,
  PAYAMT_C001,
  FUND_PAYAMT_SB_1,
  FUND_PAYAMT_SB_2,
  FUND_PAYAMT_hjb,
HIFMI_FEE_SUMAMT,
SB_YP_FEE_SUMAMT,
SB_ZL_FEE_SUMAMT,
DEDC_STD,
CRT_DEDC,
ACT_PAY_DEDC,
POOL_PROP_SELFPAY,
HIFP_PAY,
CVLSERV_PAY,
HIFES_PAY,
HIFMI_PAY,
HIFOB_PAY,
HIFDM_PAY,
MAF_PAY,
OTHFUND_PAY,
FUND_PAY_SUMAMT,
PSN_PAY,
ACCT_PAY,
CASH_PAYAMT,
BALC,
BALC_CRTYEAR,
BALC_PTYEAR,
OWNPAY_HOSP_PART,
ACCT_MULAID_PAY,
PAY_LOC,
VERSION,
OPSP_DISE_CODE,
EXRA_ATTR_TYPE,
PSN_IDET_TYPE,
PSN_IDET_TYPE_NAME,
SF_PK,
MAT_IDET_CODE,
MAT_IDET_NAME,
PRE_PAY_FLAG,
RLOC_TYPE,
PRESELFPAY_AMT,
YLLB,
CALCWAY_DEDC,
OUTMED_FLAG,
FIX_BLNG_FLAG,
REFL_FLAG,
OUTFIL_FLAG,
RLOC_REA,
SELFPAY_PROP,
SELFPAY,
CAL_GIVE_RIS,
INSCP_AMT_RIS,
INSCP_AMT_SY_0,
INSCP_AMT_SY,
INSCP_AMT_SY_LJ_YYYY,
INSCP_AMT_SY_LJ_Q,
INSCP_AMT_SY_LJ_MM,
CNT,
CNT_HOS,
CUM_SETL_PSNTIME,
CAL_DEDC_STD,
CAL_DEDC_TC,
COALESCE(INSCP_AMT_SY,0)-COALESCE(CAL_DEDC_TC,0) INSCP_SY_LMT, -- 去除起付线之后的剩余金额
CASE WHEN COALESCE(INSCP_AMT_SY,0)-COALESCE(CAL_DEDC_TC,0)<=INSCP_AMT THEN COALESCE(INSCP_AMT_SY,0)-COALESCE(CAL_DEDC_TC,0) ELSE INSCP_AMT_SY_0 END INSCP_SY -- 去除起付线之后的剩余金额

FROM
	(SELECT F.*,
		CASE WHEN CUM_SETL_PSNTIME>1 AND INSCP_AMT_SY_LJ_YYYY>CAL_DEDC_STD AND INSCP_AMT_SY_LJ_YYYY_LST<=CAL_DEDC_STD AND INSCP_AMT_SY_LJ_YYYY_LST>CAL_DEDC_TC_1_LJ_lst then CAL_DEDC_TC_1+ERROR_LJ_LST
		ELSE CAL_DEDC_TC_1 END CAL_DEDC_TC
	FROM	
		(SELECT E.*,
			CAL_DEDC_TC_1_LJ-CAL_DEDC_TC_1 CAL_DEDC_TC_1_LJ_lst,
			ERROR_LJ-ERROR ERROR_LJ_LST
		FROM
			(SELECT D.*,
			INSCP_AMT_SY-CAL_DEDC_TC_1 ERROR,
			sum(INSCP_AMT_SY-CAL_DEDC_TC_1) OVER (PARTITION BY INSUTYPE,PSN_NO,YLLB ORDER BY CUM_SETL_PSNTIME) ERROR_LJ
			FROM
				(SELECT C.*,
				CASE WHEN CUM_SETL_PSNTIME=1 THEN CAL_DEDC_TC_0
					WHEN CUM_SETL_PSNTIME>1 AND INSCP_AMT_SY_LJ_YYYY<=CAL_DEDC_STD THEN CAL_DEDC_TC_0
					WHEN CUM_SETL_PSNTIME>1 AND INSCP_AMT_SY_LJ_YYYY>CAL_DEDC_STD AND INSCP_AMT_SY_LJ_YYYY_LST<=CAL_DEDC_STD THEN CAL_DEDC_STD-INSCP_AMT_SY_LJ_YYYY_LST
					WHEN CUM_SETL_PSNTIME>1 AND INSCP_AMT_SY_LJ_YYYY>CAL_DEDC_STD AND INSCP_AMT_SY_LJ_YYYY_LST>CAL_DEDC_STD THEN 0
					ELSE 0 END CAL_DEDC_TC_1,
				sum(CASE WHEN CUM_SETL_PSNTIME=1 THEN CAL_DEDC_TC_0
					WHEN CUM_SETL_PSNTIME>1 AND INSCP_AMT_SY_LJ_YYYY<=CAL_DEDC_STD THEN CAL_DEDC_TC_0
					WHEN CUM_SETL_PSNTIME>1 AND INSCP_AMT_SY_LJ_YYYY>CAL_DEDC_STD AND INSCP_AMT_SY_LJ_YYYY_LST<=CAL_DEDC_STD THEN CAL_DEDC_STD-INSCP_AMT_SY_LJ_YYYY_LST
					WHEN CUM_SETL_PSNTIME>1 AND INSCP_AMT_SY_LJ_YYYY>CAL_DEDC_STD AND INSCP_AMT_SY_LJ_YYYY_LST>CAL_DEDC_STD THEN 0
					ELSE 0 END) OVER (PARTITION BY INSUTYPE,PSN_NO,YLLB ORDER BY CUM_SETL_PSNTIME) CAL_DEDC_TC_1_LJ
				FROM 
					(SELECT B.*,
					INSCP_AMT_SY_LJ_YYYY-INSCP_AMT_SY INSCP_AMT_SY_LJ_YYYY_LST
					FROM 
						(SELECT A.*,
						 CASE WHEN INSCP_AMT_SY<=CAL_DEDC_STD THEN INSCP_AMT_SY ELSE CAL_DEDC_STD END CAL_DEDC_TC_0
						FROM """ + tbbase + """POLICY_SETL_D_DEDC_STD_""" + version + """ A
                        WHERE CALCWAY_DEDC='按年收取一次，不足补齐' ) B) C) D) E) F);  
    """
    
    sql_setl_dedc_2_drop = """
    DROP TABLE IF EXISTS """ + tbbase + """POLICY_SETL_D_DEDC_2_""" + version + """ PURGE ;
    """
    sql_lst.append(sql_setl_dedc_2) 
    sql_drop_lst.append(sql_setl_dedc_2_drop) 

    sql_setl_dedc = """
-- 上面两个表合并
DROP TABLE IF EXISTS """ + tbbase + """POLICY_SETL_D_DEDC_""" + version + """ PURGE; 
CREATE TABLE """ + tbbase + """POLICY_SETL_D_DEDC_""" + version + """  AS 
SELECT * FROM """ + tbbase + """POLICY_SETL_D_DEDC_1_""" + version + """
UNION ALL
SELECT * FROM """ + tbbase + """POLICY_SETL_D_DEDC_2_""" + version + """
;
"""
    sql_setl_dedc_drop = """
DROP TABLE IF EXISTS """ + tbbase + """POLICY_SETL_D_DEDC_""" + version + """ PURGE ;
"""
  
    sql_lst.append(sql_setl_dedc) 
    sql_drop_lst.append(sql_setl_dedc_drop) 
    tbname_setl_d_dedc = tbbase + """POLICY_SETL_D_DEDC_""" + version
  else:
    tbname_setl_d_dedc = tbbase + """POLICY_SETL_D_DEDC_1_""" + version
  return sql_lst,sql_drop_lst,tbname_setl_d_dedc



    

