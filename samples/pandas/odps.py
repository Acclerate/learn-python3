import odps
import pandas as pd


def fetch_and_calculate_quantiles(df_med_price_codes):
    """
    计算每个med_list_codg的finl_trns_pric四分位数
    """
    for med_code in df_med_price_codes['med_list_codg'].unique():
        sql = f"SELECT  CAST(finl_trns_pric AS DOUBLE) as finl_trns_pric FROM STG_SD_YT_MED_PRICE WHERE  finl_trns_pric>=1 and finl_trns_pric <=1000  and med_list_codg='{med_code}'"
        instance = odps.run_sql(sql)
        instance.wait_for_success()
        df_med_price = instance.open_reader().to_pandas()
        # 确保'finl_trns_pric'是数值类型
        df_med_price['finl_trns_pric'] = pd.to_numeric(df_med_price['finl_trns_pric'], errors='coerce')
        # 检查DataFrame是否为空

        # 计算并打印四分位数
        lower_quantile = df_med_price['finl_trns_pric'].quantile(0.25)
        upper_quantile = df_med_price['finl_trns_pric'].quantile(0.75)

        print(f"Med code: {med_code} - Lower Quantile: {lower_quantile}, Upper Quantile: {upper_quantile}")
        sql_insert = f"""
        INSERT INTO TABLE finl_trns_pric_quantile_infinite VALUES ( '{med_code}','{lower_quantile}','{upper_quantile}')
        """
        # 执行SQL插入语句
        print(sql_insert)
        insert_instance = odps.run_sql(sql_insert)
        insert_instance.wait_for_success()


sql_codes = f""" SELECT DISTINCT a.MED_LIST_CODG as med_list_codg 
FROM    pub_ytai_data.stg_psi_sp_sales_di_v_ytai a
inner JOIN pub_ytai_data.stg_pol_fixmedins_b_df_v_ytai  b
 on b.fixmedins_code = a.fixmedins_code
inner join pub_ytai_data.stg_pol_hilist_b_df_v_ytai d 
 on a.MED_LIST_CODG = d.hilist_code 
LEFT JOIN pub_ytai_data.stg_psi_sp_stock_change_di_v_ytai c
 on c.fixmedins_code = a.fixmedins_code and c.FIXMEDINS_HILIST_ID= a.fixmedins_hilist_id  
 and a.prod_stoin_id=c.prod_stoin_id and a.fixmedins_bchno=c.fixmedins_bchno
 where a.prod_type='1' and a.SEL_RETN_CNT > 0 and a.FINL_TRNS_PRIC>1 and a.FINL_TRNS_PRIC< 1000
   and d.list_type like '1%' and a.vali_flag ='0'"""
# 执行查询并读取结果
instance_codes = odps.run_sql(sql_codes)
instance_codes.wait_for_success()
df_med_price_codes = instance_codes.open_reader(tunnel=True, limit=False).to_pandas()

sql_codes_drop = "DROP TABLE IF EXISTS finl_trns_pric_quantile_infinite"
instance_codes_drop = odps.run_sql(sql_codes_drop)
instance_codes_drop.wait_for_success()

sql_codes_create = "CREATE TABLE IF NOT EXISTS finl_trns_pric_quantile_infinite( med_code  STRING  ,lower_quantile STRING  ,upper_quantile STRING )COMMENT '价格四分位' LIFECYCLE 30"
instance_codes_create = odps.run_sql(sql_codes_create)
instance_codes_create.wait_for_success()

# 计算并打印每个med_list_codg的finl_trns_pric四分位数
fetch_and_calculate_quantiles(df_med_price_codes)

#存在问题，逐一执行SQL语句，存在大量重复执行，导致执行时间过长，需要优化

# 优化方案：
# 1. 利用SQL的GROUP BY和聚合函数，一次性计算每个med_list_codg的四分位数
# 2. 利用SQL的INSERT INTO VALUES语法，一次性插入所有med_list_codg的四分位数