/*   TableName = dws_jjsz_fund_pay_mi_ytai   */
/******************************************/
CREATE TABLE sc_dr_dars_adb.`dws_jjsz_fund_pay_mi_ytai` (
  `setl_amt` varchar COMMENT '结算金额',
  `setl_amt_cr` varchar COMMENT '',
  `setl_amt_sr` varchar COMMENT '',
  `setl_cnt` varchar COMMENT '结算人次',
  `setl_cnt_cr` varchar COMMENT '',
  `setl_cnt_sr` varchar COMMENT '',
  `setl_psn_cnt` varchar COMMENT '结算人数',
  `setl_psn_cnt_without41` varchar COMMENT '',
  `setl_psn_cnt_cr` varchar COMMENT '',
  `setl_psn_cnt_sr` varchar COMMENT '',
  `fixmedins_cnt` varchar COMMENT '医疗机构数量',
  `fixmedins_cnt_cr` varchar COMMENT '',
  `fixmedins_cnt_sr` varchar COMMENT '',
  `fund_pay_sumamt` varchar COMMENT '基金支出金额',
  `fund_pay_sumamt_cr` varchar COMMENT '',
  `fund_pay_sumamt_sr` varchar COMMENT '',
  `hi_pay_sumamt` varchar COMMENT '统筹基金金额',
  `hi_pay_sumamt_cr` varchar COMMENT '',
  `hi_pay_sumamt_sr` varchar COMMENT '',
  `coty` varchar COMMENT '区划',
  `coty_name` varchar COMMENT '区划名称',
  `out_flag` varchar COMMENT '异地标志',
  `fixmedins_type` varchar COMMENT '定点类别',
  `insutype` varchar COMMENT '险种',
  `stt_ym` varchar COMMENT '',
  PRIMARY KEY (`setl_amt`,`setl_cnt`,`setl_psn_cnt`,`fixmedins_cnt`,`fund_pay_sumamt`,`hi_pay_sumamt`,`coty`,`out_flag`,`fixmedins_type`,`insutype`,`stt_ym`)
)
PARTITION BY HASH KEY (`stt_ym`) PARTITION NUM 256
TABLEGROUP hsa_vms_yt_02
OPTIONS (UPDATETYPE='realtime')
COMMENT ''
;

/*   TableName = dws_jjsz_fund_pay_rsdt_year_mi_ytai   */
/******************************************/
CREATE TABLE sc_dr_dars_adb.`dws_jjsz_fund_pay_rsdt_year_mi_ytai` (
  `setl_amt` varchar COMMENT '结算金额',
  `setl_amt_cr` varchar COMMENT '',
  `setl_amt_sr` varchar COMMENT '',
  `setl_cnt` varchar COMMENT '结算人次',
  `setl_cnt_cr` varchar COMMENT '',
  `setl_cnt_sr` varchar COMMENT '',
  `setl_psn_cnt` varchar COMMENT '结算人数',
  `setl_psn_cnt_cr` varchar COMMENT '',
  `setl_psn_cnt_sr` varchar COMMENT '',
  `fixmedins_cnt` varchar COMMENT '医疗机构数量',
  `fixmedins_cnt_cr` varchar COMMENT '',
  `fixmedins_cnt_sr` varchar COMMENT '',
  `fund_pay_sumamt` varchar COMMENT '基金支出金额',
  `fund_pay_sumamt_cr` varchar COMMENT '',
  `fund_pay_sumamt_sr` varchar COMMENT '',
  `hi_pay_sumamt` varchar COMMENT '统筹基金金额',
  `hi_pay_sumamt_cr` varchar COMMENT '',
  `hi_pay_sumamt_sr` varchar COMMENT '',
  `coty` varchar COMMENT '区划',
  `coty_name` varchar COMMENT '区划名称',
  `out_flag` varchar COMMENT '异地标志',
  `fixmedins_type` varchar COMMENT '定点类别',
  `insutype` varchar COMMENT '险种',
  `stt_ym` varchar COMMENT '',
  PRIMARY KEY (`setl_amt`,`setl_amt_cr`,`setl_cnt`,`fixmedins_cnt`,`fund_pay_sumamt`,`hi_pay_sumamt`,`coty`,`out_flag`,`fixmedins_type`,`insutype`,`stt_ym`)
)
PARTITION BY HASH KEY (`stt_ym`) PARTITION NUM 256
TABLEGROUP hsa_vms_yt_02
OPTIONS (UPDATETYPE='realtime')
COMMENT ''
;

/*   TableName = dws_jjsz_hosp_rank_pay_mi_ytai   */
/******************************************/
CREATE TABLE sc_dr_dars_adb.`dws_jjsz_hosp_rank_pay_mi_ytai` (
  `stt_ym` varchar COMMENT '',
  `insutype` varchar COMMENT '',
  `insu_admdvs` varchar COMMENT '',
  `med_type_desc` varchar COMMENT '',
  `fixmedins_code` varchar COMMENT '',
  `fixmedins_name` varchar COMMENT '',
  `medfee_sumamt` decimal(16, 2) COMMENT '',
  `fund_pay_sumamt` decimal(16, 2) COMMENT '',
  PRIMARY KEY (`stt_ym`,`insutype`,`insu_admdvs`,`med_type_desc`,`fixmedins_code`)
)
PARTITION BY HASH KEY (`stt_ym`) PARTITION NUM 256
TABLEGROUP hsa_vms_yt_02
OPTIONS (UPDATETYPE='realtime')
COMMENT ''
;

/*   TableName = dws_jjsz_setl_d_pay_mi_ytai   */
/******************************************/
CREATE TABLE sc_dr_dars_adb.`dws_jjsz_setl_d_pay_mi_ytai` (
  `stt_ym` varchar COMMENT '',
  `clct_grde` varchar COMMENT '',
  `insutype` varchar COMMENT '',
  `insu_admdvs` varchar COMMENT '',
  `fixmedins_type` varchar COMMENT '',
  `med_type_desc` varchar COMMENT '',
  `fund_pay_sumamt` double COMMENT '',
  `medfee_sumamt` double COMMENT '',
  `hifp_pay` double COMMENT '',
  `hifob_pay` double COMMENT '',
  `inscp_amt` double COMMENT '',
  `cnt_setl` double COMMENT '',
  `cnt_psn` double COMMENT '',
  `tc` double COMMENT '',
  `de` double COMMENT '',
  `db` double COMMENT '',
  `gwy` double COMMENT '',
  `sy` double COMMENT '',
  `jz` double COMMENT '',
  `yf` double COMMENT '',
  `fp` double COMMENT '',
  `qb` double COMMENT '',
  `qt` double COMMENT '',
  `ey` double COMMENT '',
  `lx` double COMMENT '',
  `pay_loc` varchar COMMENT '',
  `fix_blng_admdvs` varchar COMMENT '',
  `flag` varchar COMMENT '',
  PRIMARY KEY (`stt_ym`,`clct_grde`,`insutype`,`insu_admdvs`,`fixmedins_type`,`med_type_desc`,`pay_loc`,`fix_blng_admdvs`,`flag`)
)
PARTITION BY HASH KEY (`stt_ym`) PARTITION NUM 256
TABLEGROUP hsa_vms_yt_02
OPTIONS (UPDATETYPE='realtime')
COMMENT ''
;

/*   TableName = dws_outmed_setl_d_yt   */
/******************************************/
CREATE TABLE sc_dr_dars_adb.`dws_outmed_setl_d_yt` (
  `stt_prd` varchar COMMENT '',
  `insutype` varchar COMMENT '',
  `med_type` varchar COMMENT '',
  `medfee_sumamt` varchar COMMENT '',
  `fund_pay_sumamt` varchar COMMENT '',
  `inscp_amt` varchar COMMENT '',
  PRIMARY KEY (`stt_prd`,`insutype`,`med_type`)
)
PARTITION BY HASH KEY (`stt_prd`) PARTITION NUM 256
TABLEGROUP hsa_vms_yt_02
OPTIONS (UPDATETYPE='realtime')
COMMENT ''
;

/*   TableName = dws_outmed_setl_info   */
/******************************************/
CREATE TABLE sc_dr_dars_adb.`dws_outmed_setl_info` (
  `setl_cnt` varchar COMMENT '',
  `out_setl_cnt` varchar COMMENT '',
  `stt_prd` varchar COMMENT '',
  `pay_loc` varchar COMMENT '',
  PRIMARY KEY (`setl_cnt`,`out_setl_cnt`,`stt_prd`,`pay_loc`)
)
PARTITION BY HASH KEY (`stt_prd`) PARTITION NUM 256
TABLEGROUP hsa_vms_yt_02
OPTIONS (UPDATETYPE='realtime')
COMMENT ''
;

/*   TableName = dws_setl_d_fixmedins_type   */
/******************************************/
CREATE TABLE sc_dr_dars_adb.`dws_setl_d_fixmedins_type` (
  `fixmedins_cnt` varchar COMMENT '',
  `setl_cnt` varchar COMMENT '',
  `medfee_sumamt` varchar COMMENT '',
  `fund_pay_sumamt` varchar COMMENT '',
  `hifp_pay` varchar COMMENT '',
  `fixmedins_type` varchar COMMENT '',
  `stt_prd` varchar COMMENT '',
  PRIMARY KEY (`stt_prd`,`fixmedins_type`,`hifp_pay`)
)
PARTITION BY HASH KEY (`stt_prd`) PARTITION NUM 256
TABLEGROUP hsa_vms_yt_02
OPTIONS (UPDATETYPE='realtime')
COMMENT ''
;

/*   TableName = fee_list_d_day   */
/******************************************/
CREATE TABLE sc_dr_dars_adb.`fee_list_d_day` (
  `partition_id` varchar COMMENT '',
  `rid` varchar disableIndex true COMMENT '',
  `insu_admdvs` varchar COMMENT '',
  `setl_time` varchar COMMENT '',
  `setl_hours` varchar COMMENT '',
  `med_type` varchar COMMENT '',
  `insutype` varchar COMMENT '',
  `fixmedins_code` varchar COMMENT '',
  `fixmedins_name` varchar COMMENT '',
  `dise_no` varchar COMMENT '',
  `dise_name` varchar COMMENT '',
  `hilist_name` varchar COMMENT '',
  `med_chrgitm_type` varchar COMMENT '',
  `sumamt` decimal(16, 2) disableIndex true COMMENT '',
  `crte_time` timestamp COMMENT '',
  `list_type` varchar COMMENT '',
  PRIMARY KEY (`partition_id`,`insu_admdvs`,`setl_time`,`setl_hours`,`med_type`,`insutype`,`fixmedins_code`,`fixmedins_name`,`dise_no`,`dise_name`,`hilist_name`,`med_chrgitm_type`,`list_type`)
)
PARTITION BY HASH KEY (`partition_id`) PARTITION NUM 256
TABLEGROUP hsa_vms_yt_02
OPTIONS (UPDATETYPE='realtime')
COMMENT ''
;

/*   TableName = fixmedins_b   */
/******************************************/
CREATE TABLE sc_dr_dars_adb.`fixmedins_b` (
  `fixmedins_code` varchar NOT NULL COMMENT '定点医药机构编号',
  `medins_mgtcode` varchar COMMENT '医药机构管理码',
  `uscc` varchar COMMENT '统一社会信用代码',
  `orgcode` varchar COMMENT '组织机构代码',
  `fix_blng_admdvs_city` varchar COMMENT '',
  `fix_blng_admdvs` varchar NOT NULL COMMENT '定点归属医保区划',
  `fixmedins_name` varchar NOT NULL COMMENT '定点医药机构名称',
  `fixmedins_type` varchar NOT NULL COMMENT '定点医疗服务机构类型',
  `hosp_lv` varchar NOT NULL COMMENT '医院等级',
  `lmtpric_hosp_lv` varchar NOT NULL COMMENT '限价医院等级',
  `dedc_hosp_lv` varchar NOT NULL COMMENT '起付线医院等级',
  `begntime` timestamp NOT NULL COMMENT '开始时间',
  `endtime` timestamp COMMENT '结束时间',
  `hi_resper_name` varchar COMMENT '医保办负责人姓名',
  `hi_resper_tel` varchar COMMENT '医保办负责人联系电话',
  `hi_resper_cert_type` varchar COMMENT '医保办负责人证件类型',
  `hi_resper_certno` varchar COMMENT '医保办负责人证件号码',
  `out_fixmedins_type` varchar COMMENT '异地医药机构类型',
  `fix_onln_open_flag` varchar NOT NULL COMMENT '定点联网开通标志',
  `out_onln_open_type` varchar NOT NULL COMMENT '异地联网开通类型',
  `nat_plaf_code` varchar COMMENT '国家异地平台机构编号',
  `prov_plaf_code` varchar COMMENT '省内异地平台机构编号',
  `vali_flag` varchar NOT NULL COMMENT '有效标志',
  `memo` varchar COMMENT '备注',
  `rid` varchar NOT NULL COMMENT '数据唯一记录号',
  `updt_time` timestamp NOT NULL COMMENT '数据更新时间',
  `crter_id` varchar COMMENT '创建人id',
  `crter_name` varchar COMMENT '创建人姓名',
  `crte_time` timestamp NOT NULL COMMENT '数据创建时间',
  `crte_optins_no` varchar COMMENT '创建机构编号',
  `opter_id` varchar COMMENT '经办人id',
  `opter_name` varchar COMMENT '经办人姓名',
  `opt_time` timestamp COMMENT '经办时间',
  `optins_no` varchar COMMENT '经办机构编号',
  `poolarea_no` varchar COMMENT '统筹区编号',
  PRIMARY KEY (`fixmedins_code`)
)
PARTITION BY HASH KEY (`fixmedins_code`) PARTITION NUM 256
TABLEGROUP hsa_vms_yt_02
OPTIONS (UPDATETYPE='realtime')
COMMENT '定点医药机构业务信息表'
;

/*   TableName = inhosp_cnt_day   */
/******************************************/
CREATE TABLE sc_dr_dars_adb.`inhosp_cnt_day` (
  `partition_id` varchar COMMENT '',
  `rid` varchar COMMENT '',
  `stt_date` varchar COMMENT '',
  `insu_admdvs` varchar COMMENT '',
  `fixmedins_code` varchar COMMENT '',
  `inhosp_cnt` bigint COMMENT '',
  PRIMARY KEY (`partition_id`,`stt_date`,`fixmedins_code`,`insu_admdvs`)
)
PARTITION BY HASH KEY (`partition_id`) PARTITION NUM 256
TABLEGROUP hsa_vms_yt_02
OPTIONS (UPDATETYPE='realtime')
COMMENT ''
;

/*   TableName = mdtrt_d_day   */
/******************************************/
CREATE TABLE sc_dr_dars_adb.`mdtrt_d_day` (
  `partition_id` varchar COMMENT '',
  `rid` varchar COMMENT '',
  `insu_admdvs` varchar COMMENT '',
  `begntime` varchar COMMENT '',
  `endtime` varchar COMMENT '',
  `med_type` varchar COMMENT '',
  `insutype` varchar COMMENT '',
  `hosp_lv` varchar COMMENT '',
  `fixmedins_code` varchar COMMENT '',
  `fixmedins_name` varchar COMMENT '',
  `dise_no` varchar COMMENT '',
  `dise_name` varchar COMMENT '',
  `mdtrt_cnt` bigint COMMENT '',
  PRIMARY KEY (`partition_id`,`insu_admdvs`,`begntime`,`endtime`,`med_type`,`insutype`,`hosp_lv`,`fixmedins_code`,`fixmedins_name`,`dise_no`,`dise_name`)
)
PARTITION BY HASH KEY (`partition_id`) PARTITION NUM 256
TABLEGROUP hsa_vms_yt_02
OPTIONS (UPDATETYPE='realtime')
COMMENT ''
;

/*   TableName = mdtrt_d_realtime_ytai   */
/******************************************/
CREATE TABLE sc_dr_dars_adb.`mdtrt_d_realtime_ytai` (
  `mdtrt_id` varchar COMMENT '',
  `medins_setl_id` varchar COMMENT '',
  `psn_no` varchar COMMENT '',
  `psn_insu_rlts_id` varchar COMMENT '',
  `psn_cert_type` varchar COMMENT '',
  `certno` varchar COMMENT '',
  `psn_name` varchar COMMENT '',
  `gend` varchar COMMENT '',
  `naty` varchar COMMENT '',
  `brdy` date COMMENT '',
  `age` decimal(4, 1) COMMENT '',
  `coner_name` varchar COMMENT '',
  `tel` varchar COMMENT '',
  `addr` varchar COMMENT '',
  `insutype` varchar COMMENT '',
  `psn_type` varchar COMMENT '',
  `cvlserv_flag` varchar COMMENT '',
  `cvlserv_lv` varchar COMMENT '',
  `sp_psn_type` varchar COMMENT '',
  `sp_psn_type_lv` varchar COMMENT '',
  `clct_grde` varchar COMMENT '',
  `flxempe_flag` varchar COMMENT '',
  `nwb_flag` varchar COMMENT '',
  `insu_admdvs` varchar COMMENT '',
  `emp_no` varchar COMMENT '',
  `emp_name` varchar COMMENT '',
  `emp_type` varchar COMMENT '',
  `econ_type` varchar COMMENT '',
  `afil_indu` varchar COMMENT '',
  `afil_rlts` varchar COMMENT '',
  `emp_mgt_type` varchar COMMENT '',
  `pay_loc` varchar COMMENT '',
  `fixmedins_code` varchar COMMENT '',
  `fixmedins_name` varchar COMMENT '',
  `hosp_lv` varchar COMMENT '',
  `fix_blng_admdvs` varchar COMMENT '',
  `lmtpric_hosp_lv` varchar COMMENT '',
  `dedc_hosp_lv` varchar COMMENT '',
  `begntime` timestamp COMMENT '',
  `endtime` timestamp COMMENT '',
  `mdtrt_cert_type` varchar COMMENT '',
  `mdtrt_cert_no` varchar COMMENT '',
  `med_type` varchar COMMENT '',
  `rloc_type` varchar COMMENT '',
  `ars_year_ipt_flag` varchar COMMENT '',
  `pre_pay_flag` varchar COMMENT '',
  `year` varchar COMMENT '',
  `refl_old_mdtrt_id` varchar COMMENT '',
  `ipt_otp_no` varchar COMMENT '',
  `medrcdno` varchar COMMENT '',
  `chfpdr_code` varchar COMMENT '',
  `adm_diag_dscr` varchar COMMENT '',
  `adm_dept_codg` varchar COMMENT '',
  `adm_dept_name` varchar COMMENT '',
  `adm_bed` varchar COMMENT '',
  `wardarea_bed` varchar COMMENT '',
  `traf_dept_flag` varchar COMMENT '',
  `dscg_maindiag_code` varchar COMMENT '',
  `dscg_dept_codg` varchar COMMENT '',
  `dscg_dept_name` varchar COMMENT '',
  `dscg_bed` varchar COMMENT '',
  `dscg_way` varchar COMMENT '',
  `main_cond_dscr` varchar COMMENT '',
  `dise_no` varchar COMMENT '',
  `dise_name` varchar COMMENT '',
  `oprn_oprt_code` varchar COMMENT '',
  `oprn_oprt_name` varchar COMMENT '',
  `otp_diag_info` varchar COMMENT '',
  `inhosp_stas` varchar COMMENT '',
  `die_date` date COMMENT '',
  `ipt_days` decimal(16, 0) COMMENT '',
  `geso_val` decimal(2, 0) COMMENT '',
  `birctrl_type` varchar COMMENT '',
  `fetts` decimal(3, 0) COMMENT '',
  `fetus_cnt` decimal(3, 0) COMMENT '',
  `matn_type` varchar COMMENT '',
  `prey_time` timestamp COMMENT '',
  `latechb_flag` varchar COMMENT '',
  `pret_flag` varchar COMMENT '',
  `fpsc_no` varchar COMMENT '',
  `birctrl_matn_date` timestamp COMMENT '',
  `cop_flag` varchar COMMENT '',
  `trt_dcla_detl_sn` varchar COMMENT '',
  `vali_flag` varchar COMMENT '',
  `memo` varchar COMMENT '',
  `rid` varchar COMMENT '',
  `updt_time` timestamp COMMENT '',
  `crter_id` varchar COMMENT '',
  `crter_name` varchar COMMENT '',
  `crte_time` timestamp COMMENT '',
  `crte_optins_no` varchar COMMENT '',
  `opter_id` varchar COMMENT '',
  `opter_name` varchar COMMENT '',
  `opt_time` timestamp COMMENT '',
  `optins_no` varchar COMMENT '',
  `poolarea_no` varchar COMMENT '',
  `chfpdr_name` varchar COMMENT '',
  `dscg_maindiag_name` varchar COMMENT '',
  `adm_caty` varchar COMMENT '',
  `dscg_caty` varchar COMMENT '',
  `ttp_pay_flag` varchar COMMENT '',
  `ttp_pay_prop` decimal(5, 4) COMMENT '',
  `dise_type_code` varchar COMMENT '',
  `same_dise_adm_flag` varchar COMMENT '',
  `quts_type` varchar COMMENT '',
  `biz_date` timestamp COMMENT '',
  `deleted_time` timestamp COMMENT '',
  `deleted` varchar COMMENT '',
  `exch_updt_time` timestamp COMMENT '',
  `subsys_codg` varchar COMMENT '',
  `admdvs` varchar COMMENT '',
  PRIMARY KEY (`RID`,`BIZ_DATE`,`SUBSYS_CODG`)
)
PARTITION BY HASH KEY (`rid`) PARTITION NUM 128
TABLEGROUP hsa_vms_yt_02
OPTIONS (UPDATETYPE='realtime')
COMMENT ''
;

/*   TableName = otp_bigscreen_test   */
/******************************************/
CREATE TABLE sc_dr_dars_adb.`otp_bigscreen_test` (
  `ym` varchar COMMENT '年月',
  `grep_type` varchar COMMENT '人员类别',
  `insutype` varchar COMMENT '险种类别',
  `insu_admdvs` varchar COMMENT '参保所属医保区划',
  `hosp_lv` varchar COMMENT '医院等级',
  `fund_pay_sum` double COMMENT '基金支出',
  `medfee_sum` double COMMENT '医疗总费用',
  `hifp_pay_sum` double COMMENT '基本医疗支出',
  `hifob_pay_sum` double COMMENT '大额医疗支出',
  `cnt_setl` double COMMENT '人次',
  `cnt_psn` double COMMENT '人数',
  `cnt_psn_region` double COMMENT '区划总人数',
  `cnt_psn_city` double COMMENT '全市总人数',
  `fund_pay_per_p` double COMMENT '人均基金支出',
  `percentage` double COMMENT '全口径报销比例',
  PRIMARY KEY (`ym`,`grep_type`,`insutype`,`insu_admdvs`,`hosp_lv`)
)
PARTITION BY HASH KEY (`ym`) PARTITION NUM 256
TABLEGROUP hsa_vms_yt_02
OPTIONS (UPDATETYPE='realtime')
COMMENT '门诊统筹大屏测试表'
;

/*   TableName = out_appy_d   */
/******************************************/
CREATE TABLE sc_dr_dars_adb.`out_appy_d` (
  `trt_dcla_detl_sn` varchar NOT NULL COMMENT '待遇申报明细流水号',
  `insutype` varchar COMMENT '险种类型',
  `dcla_souc` varchar COMMENT '申报来源',
  `psn_no` varchar NOT NULL COMMENT '人员编号',
  `psn_insu_rlts_id` varchar COMMENT '人员参保关系id',
  `psn_cert_type` varchar NOT NULL COMMENT '人员证件类型',
  `certno` varchar NOT NULL COMMENT '证件号码',
  `psn_name` varchar NOT NULL COMMENT '人员姓名',
  `gend` varchar COMMENT '性别',
  `naty` varchar COMMENT '民族',
  `brdy` timestamp COMMENT '出生日期',
  `tel` varchar COMMENT '联系电话',
  `insu_admdvs` varchar NOT NULL COMMENT '参保所属医保区划',
  `emp_no` varchar COMMENT '单位编号',
  `emp_name` varchar COMMENT '单位名称',
  `rloc_admdvs` varchar COMMENT '安置地所属行政区代码',
  `rloc_coty_type` varchar COMMENT '安置区类型',
  `rloc_hsorg_name` varchar COMMENT '安置地医保机构名称',
  `rloc_hsorg_coner` varchar COMMENT '安置地医保机构联系人',
  `rloc_hsorg_tel` varchar COMMENT '安置地医保机构联系电话',
  `out_onln_way` varchar COMMENT '异地联网方式',
  `rloc_rea` varchar COMMENT '异地安置原因',
  `resout_addr` varchar COMMENT '居外地址',
  `memo` varchar COMMENT '备注',
  `agnter_name` varchar COMMENT '代办人姓名',
  `agnter_cert_type` varchar COMMENT '代办人证件类型',
  `agnter_certno` varchar COMMENT '代办人证件号码',
  `agnter_tel` varchar COMMENT '代办人联系方式',
  `agnter_addr` varchar COMMENT '代办人联系地址',
  `agnter_rlts` varchar COMMENT '代办人关系',
  `begndate` timestamp NOT NULL COMMENT '开始日期',
  `enddate` timestamp COMMENT '结束日期',
  `out_fil_upld_stas` varchar NOT NULL COMMENT '异地备案上报状态',
  `att_cnt` int COMMENT '附件数量',
  `vali_flag` varchar NOT NULL COMMENT '有效标志',
  `rid` varchar NOT NULL COMMENT '数据唯一记录号',
  `updt_time` timestamp NOT NULL COMMENT '数据更新时间',
  `crter_id` varchar COMMENT '创建人id',
  `crter_name` varchar COMMENT '创建人姓名',
  `crte_time` timestamp NOT NULL COMMENT '数据创建时间',
  `crte_optins_no` varchar COMMENT '创建机构编号',
  `opter_id` varchar COMMENT '经办人id',
  `opter_name` varchar COMMENT '经办人姓名',
  `opt_time` timestamp COMMENT '经办时间',
  `optins_no` varchar COMMENT '经办机构编号',
  `poolarea_no` varchar COMMENT '统筹区编号',
  `trafout_fixmedins_code` varchar COMMENT '转出地定点医药机构编号',
  `trafout_fixmedins_name` varchar COMMENT '转出地定点医药机构名称',
  `bankcode` varchar COMMENT '银行行号',
  `bank_type_code` varchar COMMENT '银行行别代码',
  `bankacct` varchar COMMENT '银行账号',
  `bank_samecity_out_flag` varchar COMMENT '银行同城异地标志',
  `acctname` varchar COMMENT '银行卡户名',
  `retnr_flag` varchar COMMENT '回退标志',
  `dcla_type` varchar COMMENT '',
  `retn_flag` varchar COMMENT '',
  PRIMARY KEY (`trt_dcla_detl_sn`,`insutype`,`certno`,`psn_no`,`psn_insu_rlts_id`,`emp_no`,`rid`)
)
PARTITION BY HASH KEY (`certno`) PARTITION NUM 256
TABLEGROUP hsa_vms_yt_02
OPTIONS (UPDATETYPE='realtime')
COMMENT '异地申请信息表'
;

/*   TableName = setl_d_day   */
/******************************************/
CREATE TABLE sc_dr_dars_adb.`setl_d_day` (
  `partition_id` varchar COMMENT '',
  `rid` varchar COMMENT '',
  `setl_time` varchar COMMENT '',
  `setl_hours` varchar COMMENT '',
  `insu_admdvs` varchar COMMENT '',
  `med_type` varchar COMMENT '',
  `two_dise` varchar COMMENT '',
  `psn_type` varchar COMMENT '',
  `insutype` varchar COMMENT '',
  `fixmedins_code` varchar COMMENT '',
  `fixmedins_name` varchar COMMENT '',
  `dise_no` varchar COMMENT '',
  `dise_name` varchar COMMENT '',
  `setl_cnt` bigint COMMENT '',
  `medfee_sumamt` decimal(16, 2) COMMENT '',
  `hifp_pay` decimal(16, 2) COMMENT '',
  `cvlserv_pay` decimal(16, 2) COMMENT '',
  `hifes_pay` decimal(16, 2) COMMENT '',
  `hifmi_pay` decimal(16, 2) COMMENT '',
  `hifob_pay` decimal(16, 2) COMMENT '',
  `hifdm_pay` decimal(16, 2) COMMENT '',
  `maf_pay` decimal(16, 2) COMMENT '',
  `othfund_pay` decimal(16, 2) COMMENT '',
  `fund_pay_sumamt` decimal(16, 2) COMMENT '',
  `acct_pay` decimal(16, 2) COMMENT '',
  `cash_payamt` decimal(16, 2) COMMENT '',
  `crte_time` timestamp COMMENT '',
  `setl_type` varchar COMMENT '',
  `pay_loc` varchar COMMENT '',
  PRIMARY KEY (`partition_id`,`setl_time`,`setl_hours`,`insu_admdvs`,`med_type`,`two_dise`,`psn_type`,`insutype`,`fixmedins_code`,`fixmedins_name`,`dise_no`,`dise_name`,`pay_loc`,`setl_type`)
)
PARTITION BY HASH KEY (`partition_id`) PARTITION NUM 256
TABLEGROUP hsa_vms_yt_02
OPTIONS (UPDATETYPE='realtime')
COMMENT ''
;

/*   TableName = setl_d_realtime_ytai   */
/******************************************/
CREATE TABLE sc_dr_dars_adb.`setl_d_realtime_ytai` (
  `clr_optins` varchar COMMENT '',
  `setl_id` varchar COMMENT '',
  `medins_setl_id` varchar COMMENT '',
  `mdtrt_id` varchar COMMENT '',
  `init_setl_id` varchar COMMENT '',
  `psn_no` varchar COMMENT '',
  `psn_insu_rlts_id` varchar COMMENT '',
  `psn_name` varchar COMMENT '',
  `psn_cert_type` varchar COMMENT '',
  `certno` varchar COMMENT '',
  `gend` varchar COMMENT '',
  `naty` varchar COMMENT '',
  `brdy` date COMMENT '',
  `age` decimal(4, 1) COMMENT '',
  `insutype` varchar COMMENT '',
  `psn_type` varchar COMMENT '',
  `cvlserv_flag` varchar COMMENT '',
  `cvlserv_lv` varchar COMMENT '',
  `sp_psn_type` varchar COMMENT '',
  `sp_psn_type_lv` varchar COMMENT '',
  `clct_grde` varchar COMMENT '',
  `flxempe_flag` varchar COMMENT '',
  `nwb_flag` varchar COMMENT '',
  `insu_admdvs` varchar COMMENT '',
  `emp_no` varchar COMMENT '',
  `emp_name` varchar COMMENT '',
  `emp_type` varchar COMMENT '',
  `econ_type` varchar COMMENT '',
  `afil_indu` varchar COMMENT '',
  `afil_rlts` varchar COMMENT '',
  `emp_mgt_type` varchar COMMENT '',
  `pay_loc` varchar COMMENT '',
  `fixmedins_code` varchar COMMENT '',
  `fixmedins_name` varchar COMMENT '',
  `hosp_lv` varchar COMMENT '',
  `fix_blng_admdvs` varchar COMMENT '',
  `lmtpric_hosp_lv` varchar COMMENT '',
  `dedc_hosp_lv` varchar COMMENT '',
  `begndate` date COMMENT '',
  `enddate` date COMMENT '',
  `setl_time` timestamp COMMENT '',
  `mdtrt_cert_type` varchar COMMENT '',
  `mdtrt_cert_no` varchar COMMENT '',
  `med_type` varchar COMMENT '',
  `setl_type` varchar COMMENT '',
  `clr_type` varchar COMMENT '',
  `clr_way` varchar COMMENT '',
  `psn_setlway` varchar COMMENT '',
  `medfee_sumamt` decimal(16, 2) COMMENT '',
  `fulamt_ownpay_amt` decimal(16, 2) COMMENT '',
  `overlmt_selfpay` decimal(16, 2) COMMENT '',
  `preselfpay_amt` decimal(16, 2) COMMENT '',
  `inscp_amt` decimal(16, 2) COMMENT '',
  `dedc_std` decimal(16, 2) COMMENT '',
  `crt_dedc` decimal(16, 2) COMMENT '',
  `act_pay_dedc` decimal(16, 2) COMMENT '',
  `hifp_pay` decimal(16, 2) COMMENT '',
  `pool_prop_selfpay` decimal(5, 4) COMMENT '',
  `hi_agre_sumfee` decimal(16, 2) COMMENT '',
  `cvlserv_pay` decimal(16, 2) COMMENT '',
  `hifes_pay` decimal(16, 2) COMMENT '',
  `hifmi_pay` decimal(16, 2) COMMENT '',
  `hifob_pay` decimal(16, 2) COMMENT '',
  `hifdm_pay` decimal(16, 2) COMMENT '',
  `maf_pay` decimal(16, 2) COMMENT '',
  `othfund_pay` decimal(16, 2) COMMENT '',
  `fund_pay_sumamt` decimal(16, 2) COMMENT '',
  `psn_pay` decimal(16, 2) COMMENT '',
  `acct_pay` decimal(16, 2) COMMENT '',
  `cash_payamt` decimal(16, 2) COMMENT '',
  `ownpay_hosp_part` decimal(16, 2) COMMENT '',
  `balc` decimal(16, 2) COMMENT '',
  `acct_mulaid_pay` decimal(16, 2) COMMENT '',
  `refd_setl_flag` varchar COMMENT '',
  `cal_ipt_cnt` varchar COMMENT '',
  `setl_cashpay_way` varchar COMMENT '',
  `year` varchar COMMENT '',
  `dise_no` varchar COMMENT '',
  `dise_name` varchar COMMENT '',
  `invono` varchar COMMENT '',
  `manl_reim_rea` varchar COMMENT '',
  `vali_flag` varchar COMMENT '',
  `memo` varchar COMMENT '',
  `rid` varchar COMMENT '',
  `updt_time` timestamp COMMENT '',
  `crter_id` varchar COMMENT '',
  `crter_name` varchar COMMENT '',
  `crte_time` timestamp COMMENT '',
  `crte_optins_no` varchar COMMENT '',
  `opter_id` varchar COMMENT '',
  `opter_name` varchar COMMENT '',
  `opt_time` timestamp COMMENT '',
  `optins_no` varchar COMMENT '',
  `poolarea_no` varchar COMMENT '',
  `mid_setl_flag` varchar COMMENT '',
  `acct_used_flag` varchar COMMENT '',
  `quts_type` varchar COMMENT '',
  `bydise_setl_payamt` decimal(16, 2) COMMENT '',
  `exct_item_fund_payamt` decimal(16, 2) COMMENT '',
  `biz_date` timestamp COMMENT '',
  `deleted_time` timestamp COMMENT '',
  `deleted` varchar COMMENT '',
  `exch_updt_time` timestamp COMMENT '',
  `subsys_codg` varchar COMMENT '',
  `admdvs` varchar COMMENT '',
  PRIMARY KEY (`RID`,`BIZ_DATE`,`SUBSYS_CODG`)
)
PARTITION BY HASH KEY (`rid`) PARTITION NUM 128
TABLEGROUP hsa_vms_yt_02
OPTIONS (UPDATETYPE='realtime')
COMMENT ''
;

/*   TableName = stg_midr_bus_xzxksx_info_df_ytai   */
/******************************************/
CREATE TABLE sc_dr_dars_adb.`stg_midr_bus_xzxksx_info_df_ytai` (
  `matt_prcs_sn` varchar NOT NULL COMMENT '事项办理流水号',
  `adm_lic_matt_no` varchar NOT NULL COMMENT '行政许可事项编号',
  `adm_lic_matt_no_desc` varchar COMMENT '行政许可事项内容',
  `matt_stas` varchar NOT NULL COMMENT '事项状态',
  `matt_stas_desc` varchar COMMENT '事项状态中文描述',
  `rec_matl_stas` varchar COMMENT '接收材料状态',
  `bir_matl_stas` varchar COMMENT '出件材料状态',
  `tmpl_sn` varchar COMMENT '表单模板流水号',
  `begn_acp_time` timestamp NOT NULL COMMENT '开始受理时间(YYYY-MM-DD HH:MI:SS)',
  `fns_time` timestamp COMMENT '办结时间(YYYY-MM-DD HH:MI:SS)',
  `rec_matl_loc_sn` varchar COMMENT '接收材料位置流水号',
  `show_matl_loc_sn` varchar COMMENT '出件材料位置流水号',
  `biz_obj_no` varchar COMMENT '业务对象编号',
  `biz_obj_type` varchar COMMENT '业务主体类型',
  `prse_time` timestamp COMMENT '承诺时间点(YYYY-MM-DD HH:MI:SS)',
  `ordr_time` timestamp COMMENT '预约时间点(YYYY-MM-DD HH:MI:SS)',
  `rece_way` varchar COMMENT '取件方式',
  `delv_type` varchar COMMENT '配送类型',
  `delv_docno` varchar COMMENT '配送单号',
  `prcs_way` varchar COMMENT '办理方式',
  `show_matl_prosstas` varchar COMMENT '出件办理状态',
  `inst_type` varchar COMMENT '实例类型',
  `big_evt_no` varchar COMMENT '大事定义编号',
  `sml_evt_no` varchar COMMENT '小事定义编号',
  `prcs_fom` varchar COMMENT '办理形式',
  `prcs_fom_desc` varchar COMMENT '办理形式中文描述',
  `big_matt_prcs_sn` varchar COMMENT '大事事项办理流水号',
  `prcs_id` varchar COMMENT '业务系统的piid',
  `biz_obj_id` varchar COMMENT '业务系统的业务对象id',
  `data_id` varchar COMMENT '数据ID',
  `biz_id` varchar COMMENT '业务ID',
  `acp_org_id` varchar COMMENT '受理机构id',
  `obj_org_id` varchar COMMENT '主体机构id',
  `matt_acp_chnl` varchar COMMENT '事项受理渠道',
  `matt_acp_chnl_desc` varchar COMMENT '事项受理渠道（中文描述）',
  `matt_acp_way` varchar COMMENT '事项受理方式',
  `abn_matt_stas` varchar COMMENT '异常事项状态（超长JSON）',
  `chk_rslt` varchar COMMENT '审核结果',
  `dspo_flag` varchar COMMENT '处理标志',
  `idcard` varchar COMMENT '身份证号码',
  `psn_name` varchar COMMENT '姓名',
  `binder_idcard` varchar COMMENT '绑定人自然人编号',
  `eval_obj` varchar COMMENT '评价主体',
  `agnter_idcard` varchar COMMENT '帮办人自然人编号',
  `optins_id` varchar COMMENT '经办机构ID',
  `updt_time` timestamp COMMENT '更新时间(YYYY-MM-DD HH:MI:SS)',
  `dw_city_code` varchar COMMENT '城市编码',
  `dw_biz_time` timestamp COMMENT '业务时间(YYYY-MM-DD HH:MI:SS)',
  `pt` varchar NOT NULL COMMENT '开始受理时间年月(YYYYMM)',
  PRIMARY KEY (`MATT_PRCS_SN`,`pt`,`BEGN_ACP_TIME`,`MATT_STAS`,`ADM_LIC_MATT_NO`)
)
PARTITION BY HASH KEY (`pt`) PARTITION NUM 128
TABLEGROUP hsa_vms_yt_02
OPTIONS (UPDATETYPE='realtime')
COMMENT '公共服务事项办理日志表'
;

/*   TableName = stg_tp_opsp_reg_d_df_v_ytai   */
/******************************************/
CREATE TABLE sc_dr_dars_adb.`stg_tp_opsp_reg_d_df_v_ytai` (
  `trt_dcla_detl_sn` varchar COMMENT '待遇申报明细流水号(sjid)',
  `psn_no` varchar COMMENT '人员编号(RYID)',
  `med_type` varchar COMMENT '医疗类别',
  `mdtrt_type` varchar COMMENT '就医类别',
  `trt_way` varchar COMMENT '治疗方式',
  `insu_psn_id` varchar COMMENT '参保人员ID(RYDJID)',
  `begndate` timestamp COMMENT '起始时间',
  `enddate` timestamp COMMENT '终止时间',
  `dise` varchar COMMENT '诊断',
  `grp_type` varchar COMMENT '人群类别',
  `memo` varchar COMMENT '备注',
  `coner_name` varchar COMMENT '联系人',
  `tel` varchar COMMENT '电话',
  `dcla_souc` varchar COMMENT '业务来源',
  `vali_flag` varchar COMMENT '有效标志',
  `rid` varchar COMMENT '唯一记录号',
  `crter` varchar COMMENT '创建人',
  `crte_optins` varchar COMMENT '创建机构',
  `opter` varchar COMMENT '经办人',
  `optins` varchar COMMENT '经办机构',
  `poolarea` varchar COMMENT '统筹区',
  `crte_time` timestamp COMMENT '创建时间',
  `opt_time` timestamp COMMENT '经办时间',
  `updt_time` timestamp COMMENT '更新时间',
  `wrt_time` timestamp COMMENT '填写时间',
  `can_onln_setl` varchar COMMENT '是否允许联网结算',
  `medrcdno` varchar COMMENT '住院号',
  `lmt_amt` double COMMENT '限额',
  `chk_flag` varchar COMMENT '审批结果',
  `out_fil_id` varchar COMMENT '异地备案ID（YDBAID）',
  `upld_prov_plaf_time` timestamp COMMENT '',
  `upld_prov_plaf_err` varchar COMMENT '',
  `upld_prov_plaf_flag` varchar COMMENT '是否上传省平台',
  `admdvs` varchar COMMENT '医保区划',
  `up_pro_plat_flag` varchar COMMENT '',
  `dw_city_code` varchar COMMENT '区划',
  `dw_biz_time` timestamp COMMENT '同步时间',
  `fq_city_code` varchar COMMENT '区时间',
  PRIMARY KEY (`trt_dcla_detl_sn`)
)
PARTITION BY HASH KEY (`trt_dcla_detl_sn`) PARTITION NUM 128
TABLEGROUP hsa_vms_yt_02
OPTIONS (UPDATETYPE='realtime')
COMMENT '门慢门特登记信息表'
;

/*   TableName = drord_d   */
/******************************************/
CREATE TABLE sc_dr_dars_adb.`drord_d` (
  `drord_detl_id` varchar NOT NULL COMMENT '医嘱明细ID',
  `drord_no` varchar NOT NULL COMMENT '医嘱号',
  `mdtrt_id` varchar COMMENT '就诊ID',
  `psn_no` varchar NOT NULL COMMENT '人员编号',
  `psn_insu_rlts_id` varchar COMMENT '人员参保关系ID',
  `fixmedins_code` varchar COMMENT '定点医药机构编号',
  `drord_dept_codg` varchar COMMENT '医嘱科室编码',
  `drord_dept_name` varchar COMMENT '医嘱科室名称',
  `drord_dr_code` varchar COMMENT '医嘱医师代码',
  `drord_dr_name` varchar COMMENT '医嘱医师姓名',
  `drord_type` varchar COMMENT '医嘱类别',
  `drord_begntime` timestamp COMMENT '医嘱开嘱时间',
  `drord_endtime` timestamp COMMENT '医嘱停嘱时间',
  `medins_list_codg` varchar NOT NULL COMMENT '医药机构目录编码',
  `medins_list_name` varchar COMMENT '医药机构目录名称',
  `med_list_codg` varchar NOT NULL COMMENT '医疗目录编码',
  `drord_spec` varchar COMMENT '医嘱规格',
  `frqu_dscr` varchar COMMENT '用药频次描述',
  `medc_way_dscr` varchar COMMENT '用药途径描述',
  `sin_dos` decimal(16, 2) COMMENT '单次剂量',
  `sin_dosunt` varchar COMMENT '单次剂量单位',
  `drord_used_cnt` decimal(10, 4) COMMENT '医嘱使用数量',
  `drord_used_unt` varchar COMMENT '医嘱使用单位',
  `used_days` decimal(3, 0) COMMENT '使用天数',
  `dismed_amt` decimal(10, 4) COMMENT '发药总量',
  `dismed_unt` varchar COMMENT '发药总量单位',
  `memo` varchar COMMENT '备注',
  `vali_flag` varchar NOT NULL COMMENT '有效标志',
  `rid` varchar NOT NULL COMMENT '数据唯一记录号',
  `updt_time` timestamp NOT NULL COMMENT '数据更新时间',
  `crter_id` varchar COMMENT '创建人ID',
  `crter_name` varchar COMMENT '创建人姓名',
  `crte_time` timestamp NOT NULL COMMENT '数据创建时间',
  `crte_optins_no` varchar COMMENT '创建机构编号',
  `opter_id` varchar COMMENT '经办人ID',
  `opter_name` varchar COMMENT '经办人姓名',
  `opt_time` timestamp COMMENT '经办时间',
  `optins_no` varchar COMMENT '经办机构编号',
  `poolarea_no` varchar COMMENT '统筹区编号',
  PRIMARY KEY (`DRORD_DETL_ID`,`DRORD_NO`,`MDTRT_ID`,`PSN_NO`)
)
PARTITION BY HASH KEY (`DRORD_DETL_ID`) PARTITION NUM 256
TABLEGROUP hsa_vms_yt_01
OPTIONS (UPDATETYPE='realtime')
COMMENT '医嘱信息表'
;

/*   TableName = dws_setl_d_with_hosplv   */
/******************************************/
CREATE TABLE sc_dr_dars_adb.`dws_setl_d_with_hosplv` (
  `inhos_cnt` varchar COMMENT '',
  `patient_cnt` varchar COMMENT '',
  `insu_admdvs` varchar COMMENT '',
  `hosp_lv` varchar COMMENT '',
  `hosp_lv_name` varchar COMMENT '',
  `stt_prd` varchar COMMENT '',
  PRIMARY KEY (`inhos_cnt`,`patient_cnt`,`insu_admdvs`,`hosp_lv`,`hosp_lv_name`,`stt_prd`)
)
PARTITION BY HASH KEY (`insu_admdvs`) PARTITION NUM 256
TABLEGROUP hsa_vms_yt_01
OPTIONS (UPDATETYPE='realtime')
COMMENT ''
;

/*   TableName = dws_setl_d_with_hosplv_labl   */
/******************************************/
CREATE TABLE sc_dr_dars_adb.`dws_setl_d_with_hosplv_labl` (
  `inhos_cnt` varchar COMMENT '',
  `patient_cnt` double COMMENT '',
  `insu_admdvs` varchar COMMENT '',
  `hosp_lv` varchar COMMENT '',
  `hosp_lv_name` varchar COMMENT '',
  `stt_prd` varchar COMMENT '',
  `type_clas_3` varchar COMMENT '',
  PRIMARY KEY (`inhos_cnt`,`patient_cnt`,`insu_admdvs`,`hosp_lv`,`hosp_lv_name`,`stt_prd`,`type_clas_3`)
)
PARTITION BY HASH KEY (`TYPE_CLAS_3`) PARTITION NUM 256
TABLEGROUP hsa_vms_yt_01
OPTIONS (UPDATETYPE='realtime')
COMMENT ''
;

