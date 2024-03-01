
SELECT   nvl(a.setl_id_nat, a.setl_id) setl_id    ----结算ID
        ,func_get_optins_sql(a.poolarea)  clr_optins---- 清算经办机构
        ,a.setl_seq medins_setl_id    ----医药机构结算ID
        ,nvl(b.mdtrt_id_nat, b.mdtrt_id) mdtrt_id    ---- 就诊ID
        ,a.init_setl_id init_setl_id    ---- 原结算ID
        ,nvl(P.psn_no_gb, P.psn_no) psn_no    ---- 人员编号
        ,a.insu_psn_id psn_insu_rlts_id    ---- 人员参保关系ID
        ,d.psn_name psn_name    ---- 人员姓名
        ,d.psn_cert_type psn_cert_type    ---- 人员证件类型
        ,d.certno certno    ---- 证件号码
        ,d.gend gend    ---- 性别
        ,d.naty naty    ---- 民族
        ,d.brdy brdy    ---- 出生日期
        -- ,NULL age    ---- 年龄
        ,FLOOR(DATEDIFF(b.begndate,d.brdy,'mm') / 12)+1 age
        ,fn_conv_insutype(a.insutype, a.grp_type) insutype  ---- 险种类型
        ,fn_conv_psntype(a.psn_type) psn_type ---- 人员类别
        ,'0' cvlserv_flag    ---- 公务员标志
        ,NULL cvlserv_lv    ---- 公务员等级
        ,NULL sp_psn_type    ---- 特殊人员类型    不转
        ,NULL sp_psn_type_lv    ---- 特殊人员类型等级   不转
        ,NULL clct_grde    ---- 缴费档次
        ,(
            SELECT cbzg.FLXEMPE_FLAG FROM pub_ytai_data.stg_cp_einsu_psn_info_d_df_v_ytai cbzg WHERE a.insu_psn_id = cbzg.insu_psn_id
        ) flxempe_flag    ---- 灵活就业标志
        ,NULL nwb_flag    ---- 新生儿标志
        ,func_get_optins_sql(a.poolarea) insu_admdvs ---- 参保所属医保区划
        ,nvl(
            (
                SELECT i.emp_no_gb FROM pub_ytai_data.stg_cb_insu_emp_info_b_df_v_ytai i WHERE i.emp_no = a.org_id
            )
            ,a.org_id
        ) emp_no    ---- 单位编号
        ,(
            SELECT max(k.INSU_EMP_NAME) FROM pub_ytai_data.stg_cb_insu_emp_info_b_df_v_ytai k WHERE k.emp_no = a.org_id AND  k.INSU_EMP_NAME is NOT NULL
        ) emp_name    ---- 单位名称
         ,fn_conv_emptype(a.emp_type) emp_type ---- 单位类型
        ,fn_conv_econtype(a.econ_type) econ_type ---- 经济类型
        ,NULL afil_indu    ---- 所属行业
        ,NULL afil_rlts    ---- 隶属关系
        ,NULL emp_mgt_type    ---- 单位管理类型
        ,a.pay_loc    ---- 支付地点类别
        ,a.fixmedins_code    ---- 定点医药机构编号
        ,nvl(nvl(ee.fixmedins_name,
            (select fb.fixmedins_name from stg_pol_fixmedins_b_df_v_ytai fb where fb.fixmedins_code = a.fixmedins_code )), '***') fixmedins_name    ---- 定点医药机构名称
        ,nvl(ee.hosp_lv,
            (select fb.hosp_lv from stg_pol_fixmedins_b_df_v_ytai fb where fb.fixmedins_code = a.fixmedins_code )
            ) hosp_lv    ---- 医院等级
        ,func_get_optins_sql(ee.fix_blng_admdvs)  fix_blng_admdvs---- 定点归属医保区划
        ,nvl(ee.lmtpric_hosp_lv,
            (select fb.hosp_lv from stg_pol_fixmedins_b_df_v_ytai fb where fb.fixmedins_code = a.fixmedins_code )
            ) lmtpric_hosp_lv    ---- 限价医院等级
        ,nvl(ee.dedc_hosp_lv,
            (select fb.hosp_lv from stg_pol_fixmedins_b_df_v_ytai fb where fb.fixmedins_code = a.fixmedins_code )
            ) dedc_hosp_lv    ---- 起付线医院等级
        ,nvl(a.begndate, a.setl_time) begndate    ---- 开始日期
        ,nvl(a.enddate, a.setl_time) enddate    ---- 结束日期
        ,a.setl_time    ---- 结算时间
        ,'02' mdtrt_cert_type    ---- 就诊凭证类型
        ,P.certno mdtrt_cert_no    ---- 就诊凭证编号
        ,fn_conv_med_type(a.med_type,a.MED_POOL_TYPE) med_type  ---- 医疗类别
        ,CASE    WHEN a.pay_loc='1' THEN '1'
                 ELSE '2'
         END setl_type    ---- 结算类别
        ,fn_conv_clrtype(a.med_pool_type, a.med_type) clr_type ---- 清算类别
        ,fn_conv_clrway(clr_way) clr_way ---- 清算方式
        ,'01' psn_setlway    ---- 个人结算方式   '01'按项目结算
        ,nvl(a.medfee_sumamt, 0) medfee_sumamt    ---- 医疗费总额
        ,(
            nvl(
                nvl(a.ownpay_amt, 0) - (SELECT sum(nvl(x.overlmt_amt, 0)) FROM pub_ytai_data.stg_tp_setl_fee_stt_d_di_v_ytai x WHERE a.SETL_ID = x.SETL_ID )
                ,0
            )
        ) FULAMT_OWNPAY_AMT    ---- 全自费金额
        ,nvl(
            (
                SELECT sum(nvl(overlmt_amt, 0)) FROM pub_ytai_data.stg_tp_setl_fee_stt_d_di_v_ytai y WHERE a.setl_id = y.SETL_ID
            )
            ,0
        ) overlmt_selfpay    ---- 超限价自费费用
        ,nvl(a.preselfpay_amt, 0) preselfpay_amt    ---- 先行自付金额
        ,nvl(a.inscp_amt, 0) inscp_amt    ---- 符合范围金额
        ,nvl(b.crt_dedc, 0) dedc_std    ---- 起付标准
        ,nvl(
            (
                SELECT t.crt_dedc FROM pub_ytai_data.stg_tp_setl_dedc_cum_d_di_v_ytai t WHERE t.setl_id=a.setl_id
            )
            ,0
        ) crt_dedc    --本次起付线
        ,nvl(a.act_pay_dedc, 0) act_pay_dedc    -- 实际支付起付线
        ,(
            SELECT nvl(sum(k.fund_payamt), 0) FROM pub_ytai_data.stg_tp_setl_fund_sbit_d_di_v_ytai k WHERE a.setl_id = k.setl_id AND (k.fund_pay_type = '1' OR k.fund_pay_type = 'J' OR k.fund_pay_type = 'L')
        ) hifp_pay    ---- 统筹基金支出
        ,NULL pool_prop_selfpay    ---- 基本医疗统筹支付比例
        ,nvl(a.medfee_sumamt, 0) - nvl(a.medins_disc_amt, 0) hi_agre_sumfee    ---- 医保认可费用总额
        ,(
            SELECT nvl(sum(c.fund_payamt), 0) FROM pub_ytai_data.stg_tp_setl_fund_sbit_d_di_v_ytai c WHERE a.setl_id = c.setl_id AND c.fund_pay_type IN ('8', 'A', 'B', 'D')
        ) cvlserv_pay    ---- 公务员医疗补助基金支出
        ,0 hifes_pay    ---- 补充医疗保险基金支出
        ,(
            SELECT nvl(sum(f.fund_payamt), 0) FROM pub_ytai_data.stg_tp_setl_fund_sbit_d_di_v_ytai f WHERE a.setl_id = f.setl_id AND f.fund_pay_type = 'R'
        ) hifmi_pay    ---- 大病补充医疗保险基金支出
        ,(
            SELECT nvl(sum(i.fund_payamt), 0) FROM pub_ytai_data.stg_tp_setl_fund_sbit_d_di_v_ytai i WHERE a.setl_id = i.setl_id AND (i.fund_pay_type = '2' OR i.fund_pay_type = '4')
        ) hifob_pay    ---- 大额医疗补助基金支出
        ,(
            SELECT nvl(sum(v.fund_payamt), 0) FROM pub_ytai_data.stg_tp_setl_fund_sbit_d_di_v_ytai v WHERE a.setl_id = v.setl_id AND v.fund_pay_type = '004'
        ) hifdm_pay    ---- 伤残人员医疗保障基金支出v
        ,(
            SELECT nvl(sum(g.fund_payamt), 0) FROM pub_ytai_data.stg_tp_setl_fund_sbit_d_di_v_ytai g WHERE a.setl_id = g.setl_id AND g.fund_pay_type = '007'
        ) maf_pay    ---- 医疗救助基金支出
        ,nvl(a.fund_payamt, 0) + nvl(a.oth_fund_pay, 0) - (SELECT nvl(sum(h.fund_payamt), 0) FROM pub_ytai_data.stg_tp_setl_fund_sbit_d_di_v_ytai h WHERE a.setl_id = h.setl_id AND h.fund_pay_type IN ('007', '2', '4', 'R', '8', 'A', 'B', 'D', '1', 'J', 'L', '004')) othfund_pay    ---- 其它基金支付
        ,nvl(a.fund_payamt, 0) + nvl(a.oth_fund_pay, 0) fund_pay_sumamt    ---- 基金支付总额
        ,nvl(a.medfee_sumamt, 0) - nvl(a.fund_payamt, 0) - nvl(a.oth_fund_pay, 0) - nvl(a.fixmedins_part_amt, 0) psn_pay    ---- 个人支付金额(总金额-基本医疗)
        ,nvl(a.acct_pay, 0) acct_pay    ---- 个人账户支出
        ,nvl(a.medfee_sumamt, 0) - nvl(a.fund_payamt, 0) - nvl(a.oth_fund_pay, 0) - nvl(a.fixmedins_part_amt, 0) - nvl(a.acct_pay, 0) cash_payamt    ---- 现金支付金额
        ,nvl(a.fixmedins_part_amt, 0) ownpay_hosp_part    ---- 自费中医院负担部分   不转
        ,NULL balc    ---- 余额
        ,nvl(a.mut_acct_crtyear_pay, 0) + nvl(a.mut_acct_ptyear_pay, 0) acct_mulaid_pay    ---- 账户共济支付金额
        ,to_char(
            (
                CASE    WHEN init_setl_id IS NULL THEN 0
                        ELSE 1
                END
            ) + (CASE WHEN new_setl_id IS NULL THEN 0 ELSE 1 END)
        ) refd_setl_flag    ---- 退费结算标志
        ,CASE    WHEN b.crt_ipt_cnt=0 THEN 0
                 ELSE 1
         END cal_ipt_cnt    ---- 计算住院次数标志
        ,'1' setl_cashpay_way    ---- 结算现金支付方式      不转
        ,a.YEAR    ---- 年度
        ,a.dise_code dise_no    ---- 病种编号
        ,(
            SELECT m.dise_name FROM pub_ytai_data.stg_tb_dise_list_b_df_v_ytai m WHERE a.dise_code = m.dise_code
        ) dise_name    ---- 病种名称
        ,NULL invono    ---- 发票号   不转
        ,NULL manl_reim_rea    ---- 零星报销原因     不转
        ,'1' vali_flag    ---- 有效标志
        ,NULL memo    ---- 备注       不转
        ,a.rid    ---- 数据唯一记录号
        ,a.updt_time    ---- 数据更新时间
        ,NULL crter_id    ---- 创建人ID
        ,NULL crter_name    ---- 创建人姓名
        ,nvl(nvl(a.crte_time,a.opt_time),a.updt_time)     ---- 数据创建时间
        ,NULL crte_optins_no    ---- 创建机构编号
        ,NULL opter_id    ---- 经办人ID
        ,NULL opter_name    ---- 经办人姓名
        ,a.opt_time opt_time    ---- 经办时间
        ,func_get_optins_sql(a.poolarea)  optins_no---- 经办机构编号
        ,func_get_optins_sql(a.poolarea)  poolarea_no ---- 统筹区编号
        ,'' mid_setl_flag    ---- 中途结算标志    不转
        ,'' acct_used_flag    ---- 账户使用标志
        ,'' quts_type    ---- 编制类型     不转
        ,'' bydise_setl_payamt    ---- 按病种结算支付金额
        ,'' exct_item_fund_payamt    ----  除外项目基金支付金额
        ,nvl(TO_CHAR(nvl(nvl(a.crte_time,a.opt_time),a.updt_time),'YYYYMMDD'),a.pt_day) AS pt
FROM    pub_ytai_data.stg_tp_setl_d_di_v_ytai a left
JOIN    pub_ytai_data.stg_tp_mdtrt_d_di_v_ytai b
ON      a.mdtrt_id = b.mdtrt_id
INNER JOIN pub_ytai_data.stg_tp_psn_info_b_df_v_ytai d
ON      a.psn_no = d.psn_no INNER
JOIN    pub_ytai_data.stg_pi_psn_info_b_df_v_ytai P
ON      a.psn_no = P.psn_no
-- LEFT JOIN pub_ytai_data.stg_pol_fixmedins_b_df_v_ytai ee
LEFT JOIN sc_dr_ytai_sjzq.stg_sd_yt_fixmedins_b ee
ON      a.fixmedins_code = ee.fixmedins_code
WHERE   a.insutype IN ('C', 'E')
-- AND     a.pt = '${bizdate}'
AND     P.certno IS NOT NULL
--AND     ee.fixmedins_name NOT LIKE '%测试%'
and     to_char(a.setl_time,'yyyy')>='2022'
AND     LENGTH(NVL(a.setl_seq,'0')) <= 30
;
