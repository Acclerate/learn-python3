/*
 Navicat Premium Data Transfer

 Source Server         : MySql57_3306
 Source Server Type    : MySQL
 Source Server Version : 50744 (5.7.44)
 Source Host           : localhost:3306
 Source Schema         : sc_mds_c

 Target Server Type    : MySQL
 Target Server Version : 50744 (5.7.44)
 File Encoding         : 65001

 Date: 24/10/2025 14:55:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admdvs_a
-- ----------------------------
DROP TABLE IF EXISTS `admdvs_a`;
CREATE TABLE `admdvs_a`  (
  `ADMDVS` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '医保区划',
  `ADMDVS_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '医保区划名称',
  `PRNT_ADMDVS` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上级医保区划',
  `ADMDVS_LV` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '医保区划级别',
  `MEMO` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `RID` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据唯一记录号',
  `CRTE_TIME` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据创建时间',
  `UPDT_TIME` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据更新时间',
  `CRTER_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人ID',
  `CRTER_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人姓名',
  `OPTER_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '经办人ID',
  `OPTER_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '经办人姓名',
  `OPT_TIME` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办时间',
  `OPTINS_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '经办机构编号',
  `VER` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '版本号',
  `ADMDVS_DATA_SOUC` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '医保区划数据来源',
  `VALI_FLAG` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '有效标志',
  `CRTE_OPTINS_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建机构编号',
  `POOLAREA_FLAG` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统筹区标志',
  PRIMARY KEY (`ADMDVS`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '医保区划表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for admdvs_a_gb
-- ----------------------------
DROP TABLE IF EXISTS `admdvs_a_gb`;
CREATE TABLE `admdvs_a_gb`  (
  `ADMDVS` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '医保区划',
  `ADMDVS_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '医保区划名称',
  `PRNT_ADMDVS` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上级医保区划',
  `ADMDVS_LV` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '医保区划级别',
  `MEMO` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `RID` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据唯一记录号',
  `CRTE_TIME` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据创建时间',
  `UPDT_TIME` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据更新时间',
  `CRTER_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人ID',
  `CRTER_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人姓名',
  `OPTER_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '经办人ID',
  `OPTER_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '经办人姓名',
  `OPT_TIME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '经办时间',
  `OPTINS_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '经办机构编号',
  `VER` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '版本号',
  `ADMDVS_DATA_SOUC` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '医保区划数据来源',
  `VALI_FLAG` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '有效标志',
  `CRTE_OPTINS_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建机构编号',
  `POOLAREA_FLAG` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统筹区标志',
  PRIMARY KEY (`ADMDVS`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '医保区划表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ads_znjg_fixmedins_mdtrt_sum_mon_mf_ytai
-- ----------------------------
DROP TABLE IF EXISTS `ads_znjg_fixmedins_mdtrt_sum_mon_mf_ytai`;
CREATE TABLE `ads_znjg_fixmedins_mdtrt_sum_mon_mf_ytai`  (
  `batch_no` int(11) NULL DEFAULT NULL COMMENT '批次号',
  `fixmedins_code` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '医疗机构代码',
  `fixmedins_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗机构名称',
  `med_admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗机构区划',
  `stt_year` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统计年份',
  `stt_mon` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统计月份',
  `medins_lv` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗机构等级',
  `medins_trait` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗机构性质',
  `mdtrt_psn_cnt` int(11) NULL DEFAULT NULL COMMENT '就诊人数',
  `mdtrt_psn_time` int(11) NULL DEFAULT NULL COMMENT '就诊人次',
  `otp_psn_time` int(11) NULL DEFAULT NULL COMMENT '其中门诊人次',
  `ipt_psn_time` int(11) NULL DEFAULT NULL COMMENT '其中住院人次',
  `medfee_sumamt` decimal(18, 2) NULL DEFAULT NULL COMMENT '医疗总费用',
  `fund_pay_sumamt` decimal(18, 2) NULL DEFAULT NULL COMMENT '基金支出总额',
  `hifp_payamt` decimal(18, 2) NULL DEFAULT NULL COMMENT '统筹支出金额',
  `acct_payamt` decimal(18, 2) NULL DEFAULT NULL COMMENT '个人账号支付金额',
  `cash_payamt` decimal(18, 2) NULL DEFAULT NULL COMMENT '现金支付金额',
  `pool_prop_selfpay` decimal(18, 4) NULL DEFAULT NULL COMMENT '统筹支出占比',
  `rsk_psn_cnt` int(11) NULL DEFAULT NULL COMMENT '风险人数',
  `rsk_psn_time` int(11) NULL DEFAULT NULL COMMENT '风险人次',
  `rsk_otp_psn_time` int(11) NULL DEFAULT NULL COMMENT '其中门诊风险人次',
  `crte_time` datetime NULL DEFAULT NULL COMMENT '数据创建时间',
  `updt_time` datetime NULL DEFAULT NULL COMMENT '数据更新时间',
  `rid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据唯一记录号',
  `dw_tab_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表名',
  `da_exch_updt_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `pk_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `dw_exch_updt_time` datetime NULL DEFAULT NULL COMMENT '数据处理时间',
  PRIMARY KEY (`pk_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '医药机构就诊月度统计信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ads_znjg_hosp_swap_detl_d_mf_ytai
-- ----------------------------
DROP TABLE IF EXISTS `ads_znjg_hosp_swap_detl_d_mf_ytai`;
CREATE TABLE `ads_znjg_hosp_swap_detl_d_mf_ytai`  (
  `modl_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '模型编号',
  `ssim_detl_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '串换明细ID',
  `year` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年度',
  `mon` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '月份',
  `modl_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模型代码',
  `fixmedins_code` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '定点医药机构编号',
  `fixmedins_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定点医药机构名称',
  `admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保区划',
  `medinslv` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗机构等级',
  `medins_list_codg` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医药机构项目编码',
  `medins_list_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医药机构项目名称',
  `map_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医药机构目录名称映射结果',
  `map_ssim` decimal(18, 4) NULL DEFAULT NULL COMMENT '医药机构目录名称映射相似度',
  `hilist_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保目录编码',
  `hilist_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保目录名称',
  `name_ssim` decimal(18, 4) NULL DEFAULT NULL COMMENT '医院医保名称相似度',
  `list_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '目录类别',
  `act_pric` decimal(18, 2) NULL DEFAULT NULL COMMENT '实际单价',
  `ssim_pric` decimal(18, 2) NULL DEFAULT NULL COMMENT '映射单价',
  `hilist_pric` decimal(18, 2) NULL DEFAULT NULL COMMENT '医保目录单价',
  `med_chrgitm_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗收费项目类别',
  `act_reim_prop` decimal(18, 4) NULL DEFAULT NULL COMMENT '实际报销比例',
  `ssim_reim_prop` decimal(18, 4) NULL DEFAULT NULL COMMENT '映射报销比例',
  `hi_reim_prop` decimal(18, 4) NULL DEFAULT NULL COMMENT '医保报销比例',
  `mdtrt_psntime` int(11) NULL DEFAULT NULL COMMENT '医疗机构就诊人次',
  `item_userd_psntime` int(11) NULL DEFAULT NULL COMMENT '项目使用人次',
  `cnt` decimal(18, 2) NULL DEFAULT NULL COMMENT '数量',
  `amt` decimal(18, 2) NULL DEFAULT NULL COMMENT '明细项目费用总额',
  `risk_sco` decimal(18, 2) NULL DEFAULT NULL COMMENT '风险分数',
  `rid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据唯一记录号',
  `crte_time` datetime NULL DEFAULT NULL COMMENT '数据创建时间',
  `updt_time` datetime NULL DEFAULT NULL COMMENT '数据更新时间',
  `dw_tab_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表名',
  `da_exch_updt_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `pk_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `dw_exch_updt_time` datetime NULL DEFAULT NULL COMMENT '数据处理时间',
  PRIMARY KEY (`pk_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '医院项目串换信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ads_znjg_hrisk_medins_d_mf_ytai
-- ----------------------------
DROP TABLE IF EXISTS `ads_znjg_hrisk_medins_d_mf_ytai`;
CREATE TABLE `ads_znjg_hrisk_medins_d_mf_ytai`  (
  `modl_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '模型编号',
  `fixmedins_code` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '定点医药机构编号',
  `fixmedins_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定点医药机构名称',
  `admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保区划',
  `admdvs_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保区划名称',
  `risk_amt` decimal(18, 2) NULL DEFAULT NULL COMMENT '风险金额',
  `risk_cut` int(11) NULL DEFAULT NULL COMMENT '风险人次',
  `year` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年度',
  `mon` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '月份',
  `rid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据唯一记录号',
  `crte_time` datetime NULL DEFAULT NULL COMMENT '数据创建时间',
  `updt_time` datetime NULL DEFAULT NULL COMMENT '数据更新时间',
  `med_admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定点归属医保区划',
  `medins_trait` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构性质',
  `medins_lv` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构等级',
  `dw_tab_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表名',
  `da_exch_updt_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `pk_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `dw_exch_updt_time` datetime NULL DEFAULT NULL COMMENT '数据处理时间',
  PRIMARY KEY (`pk_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '高风险机构' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ads_znjg_ipt_abn_risk_rgst_detl_d_mf_ytai
-- ----------------------------
DROP TABLE IF EXISTS `ads_znjg_ipt_abn_risk_rgst_detl_d_mf_ytai`;
CREATE TABLE `ads_znjg_ipt_abn_risk_rgst_detl_d_mf_ytai`  (
  `modl_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '模型编号',
  `risk_grp_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '风险组编号',
  `risk_grp_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '风险组名称',
  `risk_sub_grp_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '风险子组编号',
  `tel` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `fqz_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型',
  `admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '医保区划',
  `mdtrt_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '就诊ID',
  `mdtrt_sn` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊流水号',
  `psn_no` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '人员编号',
  `psn_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员姓名',
  `psn_cert_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员证件类型',
  `certno` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '证件号码',
  `medins_code` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '医疗机构代码',
  `medins_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗机构名称',
  `insu_emp_no` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参保单位编号',
  `insu_emp_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参保单位名称',
  `adm_time` datetime NULL DEFAULT NULL COMMENT '入院时间',
  `dscg_time` datetime NULL DEFAULT NULL COMMENT '出院时间',
  `resd_regn` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '户口所在地区',
  `dise_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '诊断代码',
  `dise_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '诊断名称',
  `sumamt` decimal(18, 2) NULL DEFAULT NULL COMMENT '总金额',
  `hifp_pay` decimal(18, 2) NULL DEFAULT NULL COMMENT '统筹基金支出',
  `acct_pay` decimal(18, 2) NULL DEFAULT NULL COMMENT '个人账户支出',
  `med_admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区划',
  `medins_trait` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性质',
  `medins_lv` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '等级',
  `age` int(11) NULL DEFAULT NULL COMMENT '年龄',
  `psn_trait` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员性质',
  `mdtrt_cert_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊凭证',
  `med_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗类型',
  `chfpdr_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医师编码',
  `chfpdr_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医师名称',
  `dept_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室编码',
  `dept_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室名称',
  `cash_payamt` decimal(18, 2) NULL DEFAULT NULL COMMENT '现金支付金额',
  `rid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据唯一记录号',
  `crte_time` datetime NULL DEFAULT NULL COMMENT '数据创建时间',
  `updt_time` datetime NULL DEFAULT NULL COMMENT '数据更新时间',
  `insu_admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参保医保区划',
  `insutype` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '险种类型',
  `gend` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别',
  `mdtrt_cert_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊凭证类型',
  `ipt_days` decimal(18, 2) NULL DEFAULT NULL COMMENT '住院天数',
  `dscg_bed` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病区床号',
  `dise_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病种编号',
  `dise_nm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病种名称',
  `outmed_labl` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '异地就医标志',
  `fund_pay_sumamt` decimal(18, 2) NULL DEFAULT NULL COMMENT '基金支付总额',
  `dw_tab_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表名',
  `da_exch_updt_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `pk_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `dw_exch_updt_time` datetime NULL DEFAULT NULL COMMENT '数据处理时间',
  PRIMARY KEY (`pk_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '住院异常风险详情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ads_znjg_ipt_abn_risk_sum_e_mf_ytai
-- ----------------------------
DROP TABLE IF EXISTS `ads_znjg_ipt_abn_risk_sum_e_mf_ytai`;
CREATE TABLE `ads_znjg_ipt_abn_risk_sum_e_mf_ytai`  (
  `modl_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '模型编号',
  `year` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '年度',
  `risk_grp_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '风险组编号',
  `risk_grp_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '风险组名称',
  `medins_code` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '定点医药机构编号',
  `medins_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定点医药机构名称',
  `admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保区划',
  `insu_emp_no` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参保单位编号',
  `insu_emp_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参保单位名称',
  `tel` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `resd_regn` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '户口所在地区',
  `fqz_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型',
  `mdtrt_psncnt` int(11) NULL DEFAULT NULL COMMENT '就诊人数',
  `mdtrt_cnt` int(11) NULL DEFAULT NULL COMMENT '就诊次数',
  `sumamt` decimal(18, 2) NULL DEFAULT NULL COMMENT '总金额',
  `hifp_pay` decimal(18, 2) NULL DEFAULT NULL COMMENT '统筹基金支出',
  `acct_pay` decimal(18, 2) NULL DEFAULT NULL COMMENT '个人账户支出',
  `cash_payamt` decimal(18, 2) NULL DEFAULT NULL COMMENT '个人现金支付',
  `risk_sco` decimal(18, 2) NULL DEFAULT NULL COMMENT '风险总分',
  `rid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据唯一记录号',
  `crte_time` datetime NULL DEFAULT NULL COMMENT '数据创建时间',
  `updt_time` datetime NULL DEFAULT NULL COMMENT '数据更新时间',
  `stt_year` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统计年度',
  `stt_mon` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统计月度',
  `fund_pay_sumamt` decimal(18, 2) NULL DEFAULT NULL COMMENT '基金支付总额',
  `dw_tab_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表名',
  `da_exch_updt_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `pk_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `dw_exch_updt_time` datetime NULL DEFAULT NULL COMMENT '数据处理时间',
  PRIMARY KEY (`pk_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '住院异常风险总览表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ads_znjg_opsp_mdtrt_detl_d_mf_ytai
-- ----------------------------
DROP TABLE IF EXISTS `ads_znjg_opsp_mdtrt_detl_d_mf_ytai`;
CREATE TABLE `ads_znjg_opsp_mdtrt_detl_d_mf_ytai`  (
  `model_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '模型编号',
  `psn_no` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '人员编号',
  `psn_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员姓名',
  `mdtrt_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '就诊id',
  `fixmedins_code` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '定点医药机构编号',
  `fixmedins_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定点医药机构名称',
  `adm_time` datetime NULL DEFAULT NULL COMMENT '入院时间',
  `dscg_time` datetime NULL DEFAULT NULL COMMENT '出院时间',
  `diag_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '诊断代码',
  `diag_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '诊断名称',
  `medfee_sumamt` decimal(18, 2) NULL DEFAULT NULL COMMENT '医疗费总额',
  `hifp_pay` decimal(18, 2) NULL DEFAULT NULL COMMENT '统筹基金支出',
  `acct_pay` decimal(18, 2) NULL DEFAULT NULL COMMENT '个人账户支出',
  `rid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据唯一记录号',
  `crte_time` datetime NULL DEFAULT NULL COMMENT '数据创建时间',
  `updt_time` datetime NULL DEFAULT NULL COMMENT '数据更新时间',
  `admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模型运行区划',
  `insu_admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参保医保区划',
  `psn_cert_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员证件类型',
  `certno` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '证件号码',
  `psn_trait` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员性质',
  `insutype` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '险种类型',
  `age` int(11) NULL DEFAULT NULL COMMENT '年龄',
  `gend` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别',
  `emp_no` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位编号',
  `emp_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参保单位名称',
  `med_admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定点归属医保区划',
  `medins_trait` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构性质',
  `medins_lv` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构等级',
  `mdtrt_cert_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊凭证类型',
  `mdtrt_cert_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊凭证号',
  `dise_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病种编号',
  `dise_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病种名称',
  `dept_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室代码',
  `dept_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室名称',
  `chfpdr_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主治医师编码',
  `chfpdr_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主治医师',
  `outmed_labl` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '异地就医标志',
  `fund_pay_sumamt` decimal(18, 2) NULL DEFAULT NULL COMMENT '基金支付总额',
  `dw_tab_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表名',
  `da_exch_updt_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `pk_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `dw_exch_updt_time` datetime NULL DEFAULT NULL COMMENT '数据处理时间',
  PRIMARY KEY (`pk_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '慢特病就诊详情信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ads_znjg_opsp_risk_sum_e_mf_ytai
-- ----------------------------
DROP TABLE IF EXISTS `ads_znjg_opsp_risk_sum_e_mf_ytai`;
CREATE TABLE `ads_znjg_opsp_risk_sum_e_mf_ytai`  (
  `model_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '模型编号',
  `stt_year` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '统计年度',
  `stt_mon` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '统计月份',
  `admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '医保区划',
  `admdvs_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保区划名称',
  `psn_no` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '人员编号',
  `psn_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员姓名',
  `otp_medins_cnt` int(11) NULL DEFAULT NULL COMMENT '门诊医疗机构数量',
  `otp_frqu` int(11) NULL DEFAULT NULL COMMENT '门诊频率',
  `otp_dise_cnt` int(11) NULL DEFAULT NULL COMMENT '门诊病种数',
  `risk_totl_sco` decimal(18, 2) NULL DEFAULT NULL COMMENT '风险总分',
  `rid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据唯一记录号',
  `crte_time` datetime NULL DEFAULT NULL COMMENT '数据创建时间',
  `updt_time` datetime NULL DEFAULT NULL COMMENT '数据更新时间',
  `dw_tab_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表名',
  `da_exch_updt_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `pk_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `dw_exch_updt_time` datetime NULL DEFAULT NULL COMMENT '数据处理时间',
  PRIMARY KEY (`pk_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '慢特病风险总览' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ads_znjg_otp_abn_risk_rgst_detl_d_mf_ytai
-- ----------------------------
DROP TABLE IF EXISTS `ads_znjg_otp_abn_risk_rgst_detl_d_mf_ytai`;
CREATE TABLE `ads_znjg_otp_abn_risk_rgst_detl_d_mf_ytai`  (
  `modl_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '模型编号',
  `risk_grp_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '风险组编号',
  `risk_grp_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '风险组名称',
  `risk_sub_grp_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '风险子组编号',
  `admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '医保区划',
  `mdtrt_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '就诊ID',
  `mdtrt_sn` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊流水号',
  `medins_code` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '医疗机构代码',
  `medins_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗机构名称',
  `insu_emp_no` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参保单位编号',
  `insu_emp_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参保单位名称',
  `fqz_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '反欺诈类型',
  `risk_time` datetime NULL DEFAULT NULL COMMENT '风险时间',
  `psn_no` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '人员编号',
  `psn_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员姓名',
  `psn_cert_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员证件类型',
  `certno` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '证件号码',
  `dise_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '诊断代码',
  `dise_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '诊断名称',
  `sumamt` decimal(18, 2) NULL DEFAULT NULL COMMENT '总金额',
  `hifp_pay` decimal(18, 2) NULL DEFAULT NULL COMMENT '统筹基金支出',
  `acct_pay` decimal(18, 2) NULL DEFAULT NULL COMMENT '个人账户支出',
  `same_amt_mark` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '同金额标识',
  `med_admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构区划',
  `medins_trait` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构性质',
  `medins_lv` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构等级',
  `psn_trait` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员性质',
  `mdtrt_cert_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊凭证',
  `rid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据唯一记录号',
  `crte_time` datetime NULL DEFAULT NULL COMMENT '数据创建时间',
  `updt_time` datetime NULL DEFAULT NULL COMMENT '数据更新时间',
  `insu_admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参保医保区划',
  `insutype` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '险种类型',
  `age` int(11) NULL DEFAULT NULL COMMENT '年龄',
  `gend` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别',
  `mdtrt_cert_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊凭证类型',
  `dept_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室代码',
  `dept_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室名称',
  `chfpdr_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主治医师编码',
  `chfpdr_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主治医师',
  `dise_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病种编号',
  `dise_nm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病种名称',
  `outmed_labl` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '异地就医标志',
  `fund_pay_sumamt` decimal(18, 2) NULL DEFAULT NULL COMMENT '基金支付总额',
  `dw_tab_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表名',
  `da_exch_updt_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `pk_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `dw_exch_updt_time` datetime NULL DEFAULT NULL COMMENT '数据处理时间',
  PRIMARY KEY (`pk_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '门诊异常风险挂号明细表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ads_znjg_otp_abn_risk_sum_e_mf_ytai
-- ----------------------------
DROP TABLE IF EXISTS `ads_znjg_otp_abn_risk_sum_e_mf_ytai`;
CREATE TABLE `ads_znjg_otp_abn_risk_sum_e_mf_ytai`  (
  `modl_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '模型编号',
  `risk_grp_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '风险组编号',
  `risk_grp_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '风险组名称',
  `admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '医保区划',
  `medins_code` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '医疗机构代码',
  `medins_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗机构名称',
  `insu_emp_no` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参保单位编号',
  `insu_emp_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参保单位名称',
  `fqz_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '反欺诈类型',
  `risk_date` date NULL DEFAULT NULL COMMENT '风险日期',
  `same_otp_amt` decimal(18, 2) NULL DEFAULT NULL COMMENT '相同门诊金额',
  `acct_pay` decimal(18, 2) NULL DEFAULT NULL COMMENT '个人账户支出',
  `grp_swipe_cnt` int(11) NULL DEFAULT NULL COMMENT '组内划卡次数',
  `grp_swipe_psncnt` int(11) NULL DEFAULT NULL COMMENT '组内划卡人数',
  `medins_swipe_totlnum` int(11) NULL DEFAULT NULL COMMENT '机构划卡总次数',
  `grp_swipe_cnt_prop` decimal(18, 4) NULL DEFAULT NULL COMMENT '组内划卡次数占比',
  `totl_swipe_cnt` int(11) NULL DEFAULT NULL COMMENT '总划卡次数',
  `sml_amt_swipe_cnt` int(11) NULL DEFAULT NULL COMMENT '小额划卡次数',
  `sml_amt_swipe_cnt_prop` decimal(18, 4) NULL DEFAULT NULL COMMENT '小额划卡次数占比',
  `risk_sco` decimal(18, 2) NULL DEFAULT NULL COMMENT '风险总分',
  `rid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据唯一记录号',
  `crte_time` datetime NULL DEFAULT NULL COMMENT '数据创建时间',
  `updt_time` datetime NULL DEFAULT NULL COMMENT '数据更新时间',
  `stt_year` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统计年度',
  `stt_mon` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统计月度',
  `dw_tab_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表名',
  `da_exch_updt_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `pk_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `dw_exch_updt_time` datetime NULL DEFAULT NULL COMMENT '数据处理时间',
  PRIMARY KEY (`pk_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '门诊异常风险总览' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ads_znjg_purc_drug_abn_risk_rgst_detl_d_mf_ytai
-- ----------------------------
DROP TABLE IF EXISTS `ads_znjg_purc_drug_abn_risk_rgst_detl_d_mf_ytai`;
CREATE TABLE `ads_znjg_purc_drug_abn_risk_rgst_detl_d_mf_ytai`  (
  `modl_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '模型编号',
  `risk_grp_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '风险组编号',
  `risk_grp_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '风险组名称',
  `risk_sub_grp_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '风险子组编号',
  `admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '医保区划',
  `mdtrt_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '就诊ID',
  `mdtrt_sn` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊流水号',
  `medins_code` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '医疗机构代码',
  `medins_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗机构名称',
  `psn_no` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '人员编号',
  `psn_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员姓名',
  `psn_cert_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员证件类型',
  `certno` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '证件号码',
  `insu_emp_no` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参保单位编号',
  `insu_emp_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参保单位名称',
  `fqz_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '反欺诈类型',
  `risk_time` datetime NULL DEFAULT NULL COMMENT '风险时间',
  `sumamt` decimal(18, 2) NULL DEFAULT NULL COMMENT '总金额',
  `acct_pay` decimal(18, 2) NULL DEFAULT NULL COMMENT '个人账户支出',
  `med_admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构区划',
  `age` int(11) NULL DEFAULT NULL COMMENT '年龄',
  `psn_trait` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员性质',
  `mdtrt_cert_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊凭证',
  `rid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据唯一记录号',
  `crte_time` datetime NULL DEFAULT NULL COMMENT '数据创建时间',
  `updt_time` datetime NULL DEFAULT NULL COMMENT '数据更新时间',
  `insu_admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参保医保区划',
  `insutype` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '险种类型',
  `gend` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别',
  `adm_time` datetime NULL DEFAULT NULL COMMENT '入院时间',
  `dscg_time` datetime NULL DEFAULT NULL COMMENT '出院时间',
  `setl_time` datetime NULL DEFAULT NULL COMMENT '结算时间',
  `mdtrt_cert_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊凭证类型',
  `chfpdr_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主治医师编码',
  `chfpdr_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主治医师',
  `diag_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '诊断编码',
  `diag_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '诊断名称',
  `dise_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病种编号',
  `dise_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病种名称',
  `outmed_labl` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '异地就医标志',
  `fund_pay_sumamt` decimal(18, 2) NULL DEFAULT NULL COMMENT '基金支付总额',
  `hifp_pay` decimal(18, 2) NULL DEFAULT NULL COMMENT '统筹基金支出',
  `dw_tab_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表名',
  `da_exch_updt_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `pk_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `dw_exch_updt_time` datetime NULL DEFAULT NULL COMMENT '数据处理时间',
  PRIMARY KEY (`pk_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '购药异常风险挂号明细表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ads_znjg_purc_drug_abn_risk_sum_e_mf_ytai
-- ----------------------------
DROP TABLE IF EXISTS `ads_znjg_purc_drug_abn_risk_sum_e_mf_ytai`;
CREATE TABLE `ads_znjg_purc_drug_abn_risk_sum_e_mf_ytai`  (
  `modl_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '模型编号',
  `risk_grp_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '风险组编号',
  `risk_grp_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '风险组名称',
  `admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '医保区划',
  `medins_code` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '医疗机构代码',
  `medins_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗机构名称',
  `insu_emp_no` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参保单位编号',
  `insu_emp_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参保单位名称',
  `fqz_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '反欺诈类型',
  `risk_date` date NULL DEFAULT NULL COMMENT '风险日期',
  `risk_h` tinyint(3) UNSIGNED NULL DEFAULT NULL COMMENT '风险小时',
  `risk_swipe_psncnt` int(11) NULL DEFAULT NULL COMMENT '风险划卡人数',
  `risk_swipe_cnt` int(11) NULL DEFAULT NULL COMMENT '风险划卡次数',
  `risk_swipe_amt` decimal(18, 2) NULL DEFAULT NULL COMMENT '风险划卡金额',
  `grp_risk_sco` decimal(18, 2) NULL DEFAULT NULL COMMENT '小组风险分',
  `last_hour_swipe_cnt` int(11) NULL DEFAULT NULL COMMENT '上一小时划卡次数',
  `next_hour_swipe_cnt` int(11) NULL DEFAULT NULL COMMENT '下一小时划卡次数',
  `last_day_swipe_cnt` int(11) NULL DEFAULT NULL COMMENT '前一日同时划卡次数',
  `next_day_swipe_cnt` int(11) NULL DEFAULT NULL COMMENT '后一日同时划卡次数',
  `night_swipe_psncnt` int(11) NULL DEFAULT NULL COMMENT '夜间划卡人数',
  `night_swipe_cnt` int(11) NULL DEFAULT NULL COMMENT '夜间划卡次数',
  `night_swipe_amt` decimal(18, 2) NULL DEFAULT NULL COMMENT '夜间划卡金额',
  `drtday_medins_swipe_totlnum` int(11) NULL DEFAULT NULL COMMENT '当日机构划卡总次数',
  `night_swipe_cnt_prop` decimal(18, 4) NULL DEFAULT NULL COMMENT '夜间划卡次数占比',
  `rid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据唯一记录号',
  `crte_time` datetime NULL DEFAULT NULL COMMENT '数据创建时间',
  `updt_time` datetime NULL DEFAULT NULL COMMENT '数据更新时间',
  `stt_year` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统计年度',
  `stt_mon` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统计月度',
  `dw_tab_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表名',
  `da_exch_updt_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `pk_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `dw_exch_updt_time` datetime NULL DEFAULT NULL COMMENT '数据处理时间',
  PRIMARY KEY (`pk_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '药店购药风险总览' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ads_znjg_risk_brek_ipt_mdtrt_d_mf_ytai
-- ----------------------------
DROP TABLE IF EXISTS `ads_znjg_risk_brek_ipt_mdtrt_d_mf_ytai`;
CREATE TABLE `ads_znjg_risk_brek_ipt_mdtrt_d_mf_ytai`  (
  `modl_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '模型编号',
  `psn_no` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '人员编号',
  `risk_grp_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '风险组编号',
  `mdtrt_sn` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊序号',
  `mdtrt_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '就诊ID',
  `fixmedins_code` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '定点医药机构编号',
  `fixmedins_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定点医药机构名称',
  `dept_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室代码',
  `dept_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室名称',
  `atddr_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主治医师代码',
  `atddr_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主治医师姓名',
  `adm_time` datetime NULL DEFAULT NULL COMMENT '入院时间',
  `dscg_time` datetime NULL DEFAULT NULL COMMENT '出院时间',
  `diag_codg` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '诊断编码',
  `diag_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '诊断名称',
  `sp_diag_labl` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '特殊诊断标签',
  `inhosp_setl_flag` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '在院结算标志',
  `medfee_sumamt` decimal(18, 2) NULL DEFAULT NULL COMMENT '医疗费总额',
  `hifp_payamt` decimal(18, 2) NULL DEFAULT NULL COMMENT '统筹基金支付金额',
  `acct_payamt` decimal(18, 2) NULL DEFAULT NULL COMMENT '个人账户支付金额',
  `crte_time` datetime NULL DEFAULT NULL COMMENT '数据创建时间',
  `updt_time` datetime NULL DEFAULT NULL COMMENT '数据更新时间',
  `rid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据唯一记录号',
  `input_admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '输入医保区划',
  `psn_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员姓名',
  `stt_year` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统计年度',
  `stt_mon` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统计月度',
  `insu_admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参保医保区划',
  `psn_cert_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员证件类型',
  `certno` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '证件号码',
  `psn_trait` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员性质',
  `insutype` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '险种类型',
  `age` int(11) NULL DEFAULT NULL COMMENT '年龄',
  `gend` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别',
  `emp_no` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位编号',
  `emp_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参保单位名称',
  `med_admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定点归属医保区划',
  `medins_trait` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构性质',
  `medins_lv` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构等级',
  `mdtrt_cert_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊凭证类型',
  `mdtrt_cert_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊凭证号',
  `ipt_days` decimal(18, 2) NULL DEFAULT NULL COMMENT '住院天数',
  `dscg_bed` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病区床号',
  `dise_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病种编号',
  `dise_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病种名称',
  `outmed_labl` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '异地就医标志',
  `fund_pay_sumamt` decimal(18, 2) NULL DEFAULT NULL COMMENT '基金支付总额',
  `dw_tab_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表名',
  `da_exch_updt_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `pk_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `dw_exch_updt_time` datetime NULL DEFAULT NULL COMMENT '数据处理时间',
  PRIMARY KEY (`pk_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '分解住院就诊信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ads_znjg_risk_brek_ipt_sum_d_mf_ytai
-- ----------------------------
DROP TABLE IF EXISTS `ads_znjg_risk_brek_ipt_sum_d_mf_ytai`;
CREATE TABLE `ads_znjg_risk_brek_ipt_sum_d_mf_ytai`  (
  `modl_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '模型编号',
  `psn_no` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '人员编号',
  `risk_grp_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '风险组编号',
  `grp_medins_cnt` int(11) NULL DEFAULT NULL COMMENT '组内医疗机构数',
  `grp_dept_cnt` int(11) NULL DEFAULT NULL COMMENT '组内科室数',
  `grp_doc_cnt` int(11) NULL DEFAULT NULL COMMENT '组内医师数',
  `mdtrt_psntime` int(11) NULL DEFAULT NULL COMMENT '就诊人次',
  `sp_diag_rate` decimal(18, 4) NULL DEFAULT NULL COMMENT '特殊诊断率',
  `sim_diag_rate` decimal(18, 4) NULL DEFAULT NULL COMMENT '相似诊断率',
  `sim_trtitem_rate` decimal(18, 4) NULL DEFAULT NULL COMMENT '相似诊疗项目率',
  `sim_medc_rate` decimal(18, 4) NULL DEFAULT NULL COMMENT '相似用药率',
  `inhosp_setl_rate` decimal(18, 4) NULL DEFAULT NULL COMMENT '在院结算率',
  `medfee_sumamt` decimal(18, 2) NULL DEFAULT NULL COMMENT '医疗费总额',
  `medfee_sumamt_cv` decimal(18, 4) NULL DEFAULT NULL COMMENT '医疗费总额变异系数',
  `risk_sco` decimal(18, 2) NULL DEFAULT NULL COMMENT '风险分数',
  `crte_time` datetime NULL DEFAULT NULL COMMENT '数据创建时间',
  `updt_time` datetime NULL DEFAULT NULL COMMENT '数据更新时间',
  `rid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据唯一记录号',
  `sim_medins_risk` decimal(18, 2) NULL DEFAULT NULL COMMENT '同医疗机构风险',
  `sim_dept_risk` decimal(18, 2) NULL DEFAULT NULL COMMENT '同科室风险',
  `sim_diag_risk` decimal(18, 2) NULL DEFAULT NULL COMMENT '诊断相似度风险',
  `sim_drug_risk` decimal(18, 2) NULL DEFAULT NULL COMMENT '用药相似度风险',
  `sim_trt_risk` decimal(18, 2) NULL DEFAULT NULL COMMENT '诊疗项目相似度风险',
  `psn_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员姓名',
  `input_admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '输入医保区划',
  `sim_doc_risk` decimal(18, 2) NULL DEFAULT NULL COMMENT '同医师风险',
  `desp_cnt_risk` decimal(18, 2) NULL DEFAULT NULL COMMENT '分解次数风险',
  `medfee_cv_risk` decimal(18, 2) NULL DEFAULT NULL COMMENT '费用波动风险',
  `stt_year` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统计年度',
  `stt_mon` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统计月度',
  `dw_tab_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表名',
  `da_exch_updt_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `pk_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `dw_exch_updt_time` datetime NULL DEFAULT NULL COMMENT '数据处理时间',
  PRIMARY KEY (`pk_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '分解住院风险总览' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ads_znjg_risk_card_agg_mdtrt_d_mf_ytai
-- ----------------------------
DROP TABLE IF EXISTS `ads_znjg_risk_card_agg_mdtrt_d_mf_ytai`;
CREATE TABLE `ads_znjg_risk_card_agg_mdtrt_d_mf_ytai`  (
  `modl_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '模型编号',
  `risk_grp_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '风险组编号',
  `risk_sub_grp_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '风险子组编号',
  `psn_no` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '人员编号',
  `psn_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员姓名',
  `mdtrt_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '就诊ID',
  `brdy` date NULL DEFAULT NULL COMMENT '出生日期',
  `gend` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别',
  `live_addr` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '居住地',
  `emp_no` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位编号',
  `fixmedins_code` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '定点医药机构编号',
  `fixmedins_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定点医药机构名称',
  `dept_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室代码',
  `dept_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室名称',
  `chfpdr_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医师编码',
  `chfpdr_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医师名称',
  `adm_time` datetime NULL DEFAULT NULL COMMENT '入院时间',
  `dscg_time` datetime NULL DEFAULT NULL COMMENT '出院时间',
  `diag_codg` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '诊断编码',
  `diag_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '诊断名称',
  `medfee_sumamt` decimal(18, 2) NULL DEFAULT NULL COMMENT '医疗费总额',
  `hifp_payamt` decimal(18, 2) NULL DEFAULT NULL COMMENT '统筹基金支付金额',
  `acct_payamt` decimal(18, 2) NULL DEFAULT NULL COMMENT '个人账户支付金额',
  `crte_time` datetime NULL DEFAULT NULL COMMENT '数据创建时间',
  `updt_time` datetime NULL DEFAULT NULL COMMENT '数据更新时间',
  `rid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据唯一记录号',
  `input_admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '输入医保区划',
  `stt_year` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统计年度',
  `stt_mon` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统计月度',
  `insu_admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参保医保区划',
  `psn_cert_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员证件类型',
  `certno` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '证件号码',
  `psn_trait` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员性质',
  `insutype` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '险种类型',
  `age` int(11) NULL DEFAULT NULL COMMENT '年龄',
  `emp_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参保单位名称',
  `med_admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定点归属医保区划',
  `medins_trait` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构性质',
  `medins_lv` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构等级',
  `setl_time` datetime NULL DEFAULT NULL COMMENT '结算时间',
  `mdtrt_cert_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊凭证类型',
  `mdtrt_cert_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊凭证号',
  `dise_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病种编号',
  `dise_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病种名称',
  `outmed_labl` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '异地就医标志',
  `fund_pay_sumamt` decimal(18, 2) NULL DEFAULT NULL COMMENT '基金支付总额',
  `dw_tab_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表名',
  `da_exch_updt_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `pk_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `dw_exch_updt_time` datetime NULL DEFAULT NULL COMMENT '数据处理时间',
  PRIMARY KEY (`pk_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '卡聚集就诊信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ads_znjg_risk_card_agg_sum_d_mf_ytai
-- ----------------------------
DROP TABLE IF EXISTS `ads_znjg_risk_card_agg_sum_d_mf_ytai`;
CREATE TABLE `ads_znjg_risk_card_agg_sum_d_mf_ytai`  (
  `modl_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '模型编号',
  `risk_grp_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '风险组编号',
  `risk_sub_grp_cnt` int(11) NULL DEFAULT NULL COMMENT '风险组数',
  `grp_psncnt` int(11) NULL DEFAULT NULL COMMENT '组内人数',
  `grp_medins_cnt` int(11) NULL DEFAULT NULL COMMENT '组内医疗机构数',
  `risk_setl_prop` decimal(18, 4) NULL DEFAULT NULL COMMENT '风险结算占比',
  `medfee_sumamt` decimal(18, 2) NULL DEFAULT NULL COMMENT '医疗费总额',
  `hifp_payamt` decimal(18, 2) NULL DEFAULT NULL COMMENT '统筹基金支付金额',
  `acct_payamt` decimal(18, 2) NULL DEFAULT NULL COMMENT '个人账户支付金额',
  `risk_sco` decimal(18, 2) NULL DEFAULT NULL COMMENT '风险分数',
  `crte_time` datetime NULL DEFAULT NULL COMMENT '数据创建时间',
  `updt_time` datetime NULL DEFAULT NULL COMMENT '数据更新时间',
  `risk_subgrp_cnt_std` decimal(18, 2) NULL DEFAULT NULL COMMENT '风险次数',
  `risk_medins_cnt_std` decimal(18, 2) NULL DEFAULT NULL COMMENT '风险数',
  `risk_psn_cnt_std` decimal(18, 2) NULL DEFAULT NULL COMMENT '风险人数',
  `risk_setl_rat_std` decimal(18, 4) NULL DEFAULT NULL COMMENT '风险结算占比',
  `risk_medfee_sumamt_std` decimal(18, 2) NULL DEFAULT NULL COMMENT '风险总金额',
  `rid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据唯一记录号',
  `input_admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '输入医保区划',
  `stt_year` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统计年度',
  `stt_mon` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统计月度',
  `fund_pay_sumamt` decimal(18, 2) NULL DEFAULT NULL COMMENT '基金支付总额',
  `dw_tab_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表名',
  `da_exch_updt_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `pk_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `dw_exch_updt_time` datetime NULL DEFAULT NULL COMMENT '数据处理时间',
  PRIMARY KEY (`pk_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '卡聚集风险总览表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ads_znjg_risk_sim_cas_mdtrd_d_mf_ytai
-- ----------------------------
DROP TABLE IF EXISTS `ads_znjg_risk_sim_cas_mdtrd_d_mf_ytai`;
CREATE TABLE `ads_znjg_risk_sim_cas_mdtrd_d_mf_ytai`  (
  `modl_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '模型编号',
  `risk_grp_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '风险组编号',
  `admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '医保区划',
  `admdvs_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保区划名称',
  `diag_codg` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '诊断编码',
  `diag_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '诊断名称',
  `fixmedins_code` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '定点医药机构编号',
  `fixmedins_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定点医药机构名称',
  `psn_no` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '人员编号',
  `mdtrt_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '就诊ID',
  `adm_time` datetime NULL DEFAULT NULL COMMENT '入院时间',
  `dscg_time` datetime NULL DEFAULT NULL COMMENT '出院时间',
  `medfee_sumamt` decimal(18, 2) NULL DEFAULT NULL COMMENT '医疗费总额',
  `hifp_payamt` decimal(18, 2) NULL DEFAULT NULL COMMENT '统筹基金支付金额',
  `crte_time` datetime NULL DEFAULT NULL COMMENT '数据创建时间',
  `updt_time` datetime NULL DEFAULT NULL COMMENT '数据更新时间',
  `rid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据唯一记录号',
  `stt_year` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统计年度',
  `stt_mon` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统计月度',
  `insu_admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参保医保区划',
  `psn_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员姓名',
  `psn_cert_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员证件类型',
  `certno` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '证件号码',
  `psn_trait` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员性质',
  `insutype` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '险种类型',
  `age` int(11) NULL DEFAULT NULL COMMENT '年龄',
  `gend` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别',
  `emp_no` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位编号',
  `emp_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参保单位名称',
  `med_admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定点归属医保区划',
  `medins_trait` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构性质',
  `medins_lv` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构等级',
  `mdtrt_cert_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊凭证类型',
  `mdtrt_cert_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊凭证号',
  `dept_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室代码',
  `dept_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室名称',
  `ipt_days` decimal(18, 2) NULL DEFAULT NULL COMMENT '住院天数',
  `dscg_bed` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病区床号',
  `chfpdr_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主治医师编码',
  `chfpdr_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主治医师',
  `dise_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病种编号',
  `dise_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病种名称',
  `outmed_labl` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '异地就医标志',
  `fund_pay_sumamt` decimal(18, 2) NULL DEFAULT NULL COMMENT '基金支付总额',
  `dw_tab_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表名',
  `da_exch_updt_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `pk_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `dw_exch_updt_time` datetime NULL DEFAULT NULL COMMENT '数据处理时间',
  PRIMARY KEY (`pk_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '相似病例就诊信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ads_znjg_risk_sim_cas_sum_d_mf_ytai
-- ----------------------------
DROP TABLE IF EXISTS `ads_znjg_risk_sim_cas_sum_d_mf_ytai`;
CREATE TABLE `ads_znjg_risk_sim_cas_sum_d_mf_ytai`  (
  `modl_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '模型编号',
  `risk_grp_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '风险组编号',
  `diag_codg` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '诊断编码',
  `admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '医保区划',
  `admdvs_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保区划名称',
  `diag_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '诊断名称',
  `main_fixmedins_code` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主要定点医药机构编号',
  `main_fixmedins_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主要定点医药机构名称',
  `mdtrt_psntime` int(11) NULL DEFAULT NULL COMMENT '就诊人次',
  `medins_conc_deg` decimal(18, 4) NULL DEFAULT NULL COMMENT '医疗机构集中度',
  `adm_date_sim_deg` decimal(18, 4) NULL DEFAULT NULL COMMENT '入院日期相似度',
  `clus_sim_deg` decimal(18, 4) NULL DEFAULT NULL COMMENT '聚类相似度',
  `diag_avg_clus_sim_deg` decimal(18, 4) NULL DEFAULT NULL COMMENT '诊断平均聚类相似度',
  `risk_sco` decimal(18, 2) NULL DEFAULT NULL COMMENT '风险分数',
  `crte_time` datetime NULL DEFAULT NULL COMMENT '数据创建时间',
  `updt_time` datetime NULL DEFAULT NULL COMMENT '数据更新时间',
  `rid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据唯一记录号',
  `mdtrt_psntime_deg` decimal(18, 2) NULL DEFAULT NULL COMMENT '就诊人次风险度',
  `stt_year` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统计年度',
  `stt_mon` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统计月度',
  `dw_tab_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表名',
  `da_exch_updt_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `pk_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `dw_exch_updt_time` datetime NULL DEFAULT NULL COMMENT '数据处理时间',
  PRIMARY KEY (`pk_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '相似病例总览信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ads_znjg_risk_test_ipt_mdtrt_d_mf_ytai
-- ----------------------------
DROP TABLE IF EXISTS `ads_znjg_risk_test_ipt_mdtrt_d_mf_ytai`;
CREATE TABLE `ads_znjg_risk_test_ipt_mdtrt_d_mf_ytai`  (
  `modl_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '模型编号',
  `psn_no` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '人员编号',
  `mdtrt_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '就诊ID',
  `fixmedins_code` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '定点医药机构编号',
  `fixmedins_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定点医药机构名称',
  `dept_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室代码',
  `dept_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室名称',
  `adm_time` datetime NULL DEFAULT NULL COMMENT '入院时间',
  `dscg_time` datetime NULL DEFAULT NULL COMMENT '出院时间',
  `diag_codg` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '诊断编码',
  `diag_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '诊断名称',
  `ipt_days` int(11) NULL DEFAULT NULL COMMENT '住院天数',
  `medfee_sumamt` decimal(18, 2) NULL DEFAULT NULL COMMENT '医疗费总额',
  `hifp_payamt` decimal(18, 2) NULL DEFAULT NULL COMMENT '统筹基金支付金额',
  `acct_payamt` decimal(18, 2) NULL DEFAULT NULL COMMENT '个人账户支付金额',
  `examfee` decimal(18, 2) NULL DEFAULT NULL COMMENT '检查费',
  `examfee_prop` decimal(18, 4) NULL DEFAULT NULL COMMENT '检查费占比',
  `diag_exam_mat_amt` decimal(18, 2) NULL DEFAULT NULL COMMENT '诊断检查匹配度金额',
  `exam_cnvl_amt` decimal(18, 2) NULL DEFAULT NULL COMMENT '检查常规度金额',
  `retn_modl_pt_estmt` decimal(18, 2) NULL DEFAULT NULL COMMENT '回归模型点估计',
  `retn_modl_stsb_uplmt` decimal(18, 2) NULL DEFAULT NULL COMMENT '回归模型区间估计上限',
  `retn_modl_stsb_lowlmt` decimal(18, 2) NULL DEFAULT NULL COMMENT '回归模型区间估计下限',
  `risk_sco` decimal(18, 2) NULL DEFAULT NULL COMMENT '风险分数',
  `crte_time` datetime NULL DEFAULT NULL COMMENT '数据创建时间',
  `updt_time` datetime NULL DEFAULT NULL COMMENT '数据更新时间',
  `rid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据唯一记录号',
  `input_admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '输入医保区划',
  `psn_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员姓名',
  `brdy` date NULL DEFAULT NULL COMMENT '出生日期',
  `gend` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别',
  `live_addr` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '居住地址',
  `risk_tst_fee_prop` decimal(18, 2) NULL DEFAULT NULL COMMENT '检查费占比风险',
  `risk_diag_tst_match` decimal(18, 2) NULL DEFAULT NULL COMMENT '检查诊断一致性风险',
  `risk_tst_cnvl` decimal(18, 2) NULL DEFAULT NULL COMMENT '检查常规度风险',
  `risk_tst_fee_prop_norm` decimal(18, 2) NULL DEFAULT NULL COMMENT '检查占比合理度风险',
  `risk_ipt_days` decimal(18, 2) NULL DEFAULT NULL COMMENT '住院天数风险',
  `stt_year` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统计年度',
  `stt_mon` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统计月度',
  `insu_admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参保医保区划',
  `psn_cert_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员证件类型',
  `certno` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '证件号码',
  `psn_trait` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员性质',
  `insutype` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '险种类型',
  `age` int(11) NULL DEFAULT NULL COMMENT '年龄',
  `emp_no` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位编号',
  `emp_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参保单位名称',
  `med_admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定点归属医保区划',
  `medins_trait` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构性质',
  `medins_lv` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构等级',
  `mdtrt_cert_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊凭证类型',
  `mdtrt_cert_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊凭证号',
  `dscg_bed` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病区床号',
  `chfpdr_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主治医师编码',
  `chfpdr_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主治医师',
  `dise_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病种编号',
  `dise_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病种名称',
  `outmed_labl` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '异地就医标志',
  `fund_pay_sumamt` decimal(18, 2) NULL DEFAULT NULL COMMENT '基金支付总额',
  `dw_tab_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表名',
  `da_exch_updt_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `pk_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `dw_exch_updt_time` datetime NULL DEFAULT NULL COMMENT '数据处理时间',
  PRIMARY KEY (`pk_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '体检住院就诊信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ads_znjg_risk_test_ipt_sum_d_mf_ytai
-- ----------------------------
DROP TABLE IF EXISTS `ads_znjg_risk_test_ipt_sum_d_mf_ytai`;
CREATE TABLE `ads_znjg_risk_test_ipt_sum_d_mf_ytai`  (
  `modl_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '模型编号',
  `fixmedins_code` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '定点医药机构编号',
  `fixmedins_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定点医药机构名称',
  `dept_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室代码',
  `dept_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室名称',
  `test_ipt_psncnt` int(11) NULL DEFAULT NULL COMMENT '体检住院人次',
  `totl_ipt_psntime` int(11) NULL DEFAULT NULL COMMENT '总住院人次',
  `examfee` decimal(18, 2) NULL DEFAULT NULL COMMENT '检查费',
  `examfee_prop` decimal(18, 4) NULL DEFAULT NULL COMMENT '检查费占比',
  `medfee_sumamt` decimal(18, 2) NULL DEFAULT NULL COMMENT '医疗费总额',
  `hifp_payamt` decimal(18, 2) NULL DEFAULT NULL COMMENT '统筹基金支付金额',
  `risk_sco` decimal(18, 2) NULL DEFAULT NULL COMMENT '风险分数',
  `crte_time` datetime NULL DEFAULT NULL COMMENT '数据创建时间',
  `updt_time` datetime NULL DEFAULT NULL COMMENT '数据更新时间',
  `rid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据唯一记录号',
  `input_admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '输入医保区划',
  `stt_year` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统计年度',
  `stt_mon` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统计月度',
  `fund_pay_sumamt` decimal(18, 2) NULL DEFAULT NULL COMMENT '基金支付总额',
  `dw_tab_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表名',
  `da_exch_updt_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `pk_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `dw_exch_updt_time` datetime NULL DEFAULT NULL COMMENT '数据处理时间',
  PRIMARY KEY (`pk_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '体检住院风险总览' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ads_znjg_rsk_hgh_frq_med_detail_etl_mf_ytai
-- ----------------------------
DROP TABLE IF EXISTS `ads_znjg_rsk_hgh_frq_med_detail_etl_mf_ytai`;
CREATE TABLE `ads_znjg_rsk_hgh_frq_med_detail_etl_mf_ytai`  (
  `model_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '模型编号',
  `stt_year` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '统计年度',
  `stt_mon` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '统计月份',
  `admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '医保区划',
  `psn_no` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '人员编号',
  `psn_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员姓名',
  `hig_med_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '高频就诊标签',
  `mdtrt_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '就诊ID',
  `med_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗类别',
  `med_mdtrt_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗就诊类型',
  `fixmedins_code` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '定点医药机构编号',
  `fixmedins_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定点医药机构名称',
  `medinslv` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗机构等级',
  `dept_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室代码',
  `dept_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室名称',
  `mdtrt_time` datetime NULL DEFAULT NULL COMMENT '就诊时间',
  `adm_time` datetime NULL DEFAULT NULL COMMENT '入院时间',
  `dscg_time` datetime NULL DEFAULT NULL COMMENT '出院时间',
  `ipt_days` int(11) NULL DEFAULT NULL COMMENT '住院天数',
  `diag_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '诊断编码',
  `diag_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '诊断名称',
  `icd3_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'ICD3名称',
  `medfee_sumamt` decimal(18, 2) NULL DEFAULT NULL COMMENT '医疗费总额',
  `hifp_pay` decimal(18, 2) NULL DEFAULT NULL COMMENT '统筹基金支付金额',
  `acct_pay` decimal(18, 2) NULL DEFAULT NULL COMMENT '个人账户支付金额',
  `rid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据唯一记录号',
  `crte_time` datetime NULL DEFAULT NULL COMMENT '数据创建时间',
  `updt_time` datetime NULL DEFAULT NULL COMMENT '数据更新时间',
  `insu_admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参保医保区划',
  `psn_cert_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员证件类型',
  `certno` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '证件号码',
  `psn_trait` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员性质',
  `insutype` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '险种类型',
  `age` int(11) NULL DEFAULT NULL COMMENT '年龄',
  `gend` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别',
  `emp_no` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位编号',
  `emp_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参保单位名称',
  `med_admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定点归属医保区划',
  `medins_trait` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构性质',
  `medins_lv` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构等级',
  `mdtrt_cert_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊凭证类型',
  `mdtrt_cert_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊凭证号',
  `dise_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病种编号',
  `dise_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病种名称',
  `dscg_bed` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病区床号',
  `chfpdr_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主治医师编码',
  `chfpdr_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主治医师',
  `outmed_labl` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '异地就医标志',
  `fund_pay_sumamt` decimal(18, 2) NULL DEFAULT NULL COMMENT '基金支付总额',
  `dw_tab_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表名',
  `da_exch_updt_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `pk_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `dw_exch_updt_time` datetime NULL DEFAULT NULL COMMENT '数据处理时间',
  PRIMARY KEY (`pk_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '高频就诊人群就诊详情' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ads_znjg_rsk_hgh_frq_otp_risk_sum_etl_mf_ytai
-- ----------------------------
DROP TABLE IF EXISTS `ads_znjg_rsk_hgh_frq_otp_risk_sum_etl_mf_ytai`;
CREATE TABLE `ads_znjg_rsk_hgh_frq_otp_risk_sum_etl_mf_ytai`  (
  `model_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '模型编号',
  `stt_year` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '统计年度',
  `stt_mon` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '统计月份',
  `admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '医保区划',
  `psn_no` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '人员编号',
  `psn_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员姓名',
  `gend` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别',
  `age` int(11) NULL DEFAULT NULL COMMENT '年龄',
  `otp_cnt` int(11) NULL DEFAULT NULL COMMENT '门诊就诊次数',
  `fixmedins_cnt` int(11) NULL DEFAULT NULL COMMENT '门诊就诊机构数',
  `avg_medfee` decimal(18, 2) NULL DEFAULT NULL COMMENT '次均就诊金额',
  `diag_cnt` int(11) NULL DEFAULT NULL COMMENT '病种数',
  `dise_itrc_rate_risk_sco` decimal(18, 2) NULL DEFAULT NULL COMMENT '病种交叉率风险分',
  `fund_pay_prop_risk_sco` decimal(18, 2) NULL DEFAULT NULL COMMENT '基金支付比例风险分',
  `day_mdtrt_amt_risk_sco` decimal(18, 2) NULL DEFAULT NULL COMMENT '日就诊金额相似风险分',
  `mdtrt_inrv_risk_sco` decimal(18, 2) NULL DEFAULT NULL COMMENT '就诊间隔集中风险分',
  `drug_prop_risk_sco` decimal(18, 2) NULL DEFAULT NULL COMMENT '药占比风险分',
  `risk_sco` decimal(18, 2) NULL DEFAULT NULL COMMENT '风险总分',
  `rid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据唯一记录号',
  `crte_time` datetime NULL DEFAULT NULL COMMENT '数据创建时间',
  `updt_time` datetime NULL DEFAULT NULL COMMENT '数据更新时间',
  `dw_tab_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表名',
  `da_exch_updt_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `pk_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `dw_exch_updt_time` datetime NULL DEFAULT NULL COMMENT '数据处理时间',
  PRIMARY KEY (`pk_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '门诊高频就诊人群风险总览' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ads_znjg_rsk_pmc_swp_clinic_etl_mf_ytai
-- ----------------------------
DROP TABLE IF EXISTS `ads_znjg_rsk_pmc_swp_clinic_etl_mf_ytai`;
CREATE TABLE `ads_znjg_rsk_pmc_swp_clinic_etl_mf_ytai`  (
  `model_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '模型编号',
  `risk_grp_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '风险组编号',
  `psn_no` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '人员编号',
  `fixmedins_code` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '定点医药机构编号',
  `fixmedins_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定点医药机构名称',
  `mdtrt_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '就诊ID',
  `adm_time` datetime NULL DEFAULT NULL COMMENT '入院时间',
  `dscg_time` datetime NULL DEFAULT NULL COMMENT '出院时间',
  `medfee_sumamt` decimal(18, 2) NULL DEFAULT NULL COMMENT '医疗费总额',
  `acct_payamt` decimal(18, 2) NULL DEFAULT NULL COMMENT '个人账户支付金额',
  `crte_time` datetime NULL DEFAULT NULL COMMENT '数据创建时间',
  `updt_time` datetime NULL DEFAULT NULL COMMENT '数据更新时间',
  `input_admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '输入医保区划',
  `insu_admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参保医保区划',
  `psn_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员姓名',
  `psn_cert_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员证件类型',
  `certno` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '证件号码',
  `psn_trait` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员性质',
  `insutype` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '险种类型',
  `age` int(11) NULL DEFAULT NULL COMMENT '年龄',
  `gend` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别',
  `emp_no` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位编号',
  `emp_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位名称',
  `med_admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定点归属医保区划',
  `setl_time` datetime NULL DEFAULT NULL COMMENT '结算时间',
  `mdtrt_cert_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊凭证类型',
  `mdtrt_cert_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊凭证号',
  `chfpdr_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主治医师编码',
  `chfpdr_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主治医师',
  `diag_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '诊断编码',
  `diag_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '诊断名称',
  `dise_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病种编号',
  `dise_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病种名称',
  `outmed_labl` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '异地就医标志',
  `fund_pay_sumamt` decimal(18, 2) NULL DEFAULT NULL COMMENT '基金支付总额',
  `hifp_pay` decimal(18, 2) NULL DEFAULT NULL COMMENT '统筹基金支出',
  `dw_tab_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表名',
  `da_exch_updt_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `pk_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `dw_exch_updt_time` datetime NULL DEFAULT NULL COMMENT '数据处理时间',
  PRIMARY KEY (`pk_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '药店串换就诊信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ads_znjg_rsk_pmc_swp_summary_etl_mf_ytai
-- ----------------------------
DROP TABLE IF EXISTS `ads_znjg_rsk_pmc_swp_summary_etl_mf_ytai`;
CREATE TABLE `ads_znjg_rsk_pmc_swp_summary_etl_mf_ytai`  (
  `model_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '模型编号',
  `risk_grp_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '风险组编号',
  `fixmedins_code` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '定点医药机构编号',
  `fixmedins_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定点医药机构名称',
  `set_item_cnt` decimal(18, 2) NULL DEFAULT NULL COMMENT '套餐项目数量',
  `set_mdtrt_psncnt` int(11) NULL DEFAULT NULL COMMENT '套餐就诊人次',
  `ttl_mdtrt_psncnt` int(11) NULL DEFAULT NULL COMMENT '总就诊人次',
  `set_avg_supp` decimal(18, 2) NULL DEFAULT NULL COMMENT '套餐支持度',
  `set_pric` decimal(18, 2) NULL DEFAULT NULL COMMENT '套餐价格',
  `risk_sco` decimal(18, 2) NULL DEFAULT NULL COMMENT '风险分数',
  `crte_time` datetime NULL DEFAULT NULL COMMENT '数据创建时间',
  `updt_time` datetime NULL DEFAULT NULL COMMENT '数据更新时间',
  `admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保区划',
  `year` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年度',
  `mon` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '月份',
  `input_admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '输入医保区划',
  `set_conf_ratio` decimal(18, 4) NULL DEFAULT NULL COMMENT '套餐置信度偏离度',
  `set_amount_ratio` decimal(18, 4) NULL DEFAULT NULL COMMENT '套餐销售额占比',
  `org_scale_coeff` decimal(18, 4) NULL DEFAULT NULL COMMENT '药店规模系数',
  `set_supp_ratio` decimal(18, 4) NULL DEFAULT NULL COMMENT '套餐支持度偏离度',
  `dw_tab_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表名',
  `da_exch_updt_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `pk_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `dw_exch_updt_time` datetime NULL DEFAULT NULL COMMENT '数据处理时间',
  PRIMARY KEY (`pk_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '药店串换风险总览' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bffact_warn_rslt_d_df_ytai
-- ----------------------------
DROP TABLE IF EXISTS `bffact_warn_rslt_d_df_ytai`;
CREATE TABLE `bffact_warn_rslt_d_df_ytai`  (
  `warn_rslt_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '提醒结果ID',
  `trig_scen` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '触发场景',
  `med_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗类别',
  `reqt_time` datetime NOT NULL COMMENT '请求时间',
  `rsp_time` datetime NULL DEFAULT NULL COMMENT '响应时间',
  `ana_dura` bigint(20) NULL DEFAULT NULL COMMENT '分析时长',
  `vola_flag` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '违规标志',
  `rule_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则ID',
  `rule_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则代码',
  `rule_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则名称',
  `rule_sev_deg` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则严重程度',
  `rule_warn_lv` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则提醒级别',
  `warn_cont` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '提示内容',
  `rid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据唯一记录号',
  `crte_time` datetime NULL DEFAULT NULL COMMENT '数据创建时间',
  `updt_time` datetime NULL DEFAULT NULL COMMENT '数据更新时间',
  `medfee_sumamt` decimal(18, 2) NULL DEFAULT NULL COMMENT '医疗费总额',
  `vola_amt` decimal(18, 2) NULL DEFAULT NULL COMMENT '违规金额',
  `warn_dspo_way` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预警处理方式',
  `warn_dspo_way_dscr` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '预警处理方式说明',
  `dw_biz_time` datetime NULL DEFAULT NULL COMMENT '业务更新时间',
  `dw_exch_updt_time` datetime NULL DEFAULT NULL COMMENT '数据处理时间',
  PRIMARY KEY (`warn_rslt_id`, `reqt_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '事前提醒结果信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for comn_druglist_b_zyyp_public
-- ----------------------------
DROP TABLE IF EXISTS `comn_druglist_b_zyyp_public`;
CREATE TABLE `comn_druglist_b_zyyp_public`  (
  `drug_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `drug_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for comn_fixmedins_code_public
-- ----------------------------
DROP TABLE IF EXISTS `comn_fixmedins_code_public`;
CREATE TABLE `comn_fixmedins_code_public`  (
  `fixmedins_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fixmedins_name` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for count_num_of_full_extraction_tables_past_two_years
-- ----------------------------
DROP TABLE IF EXISTS `count_num_of_full_extraction_tables_past_two_years`;
CREATE TABLE `count_num_of_full_extraction_tables_past_two_years`  (
  `recordcount` int(11) NULL DEFAULT NULL,
  `tablename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tablefrom` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dashboard
-- ----------------------------
DROP TABLE IF EXISTS `dashboard`;
CREATE TABLE `dashboard`  (
  `dashboard_id` int(11) NOT NULL AUTO_INCREMENT,
  `data` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `OPTER_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `OPT_TIME` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `RID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`dashboard_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8600160 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for data_dic_a
-- ----------------------------
DROP TABLE IF EXISTS `data_dic_a`;
CREATE TABLE `data_dic_a`  (
  `DATA_DIC_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典ID',
  `DIC_VAL_CODE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典代码',
  `DIC_VAL_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典名称',
  `DIC_TYPE_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典类型代码',
  `SEQ` int(11) NOT NULL COMMENT '顺序号',
  `MEMO` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `VALI_FLAG` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '有效标志',
  `RID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据唯一记录号',
  `CRTE_TIME` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `UPDT_TIME` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据更新时间',
  `CRTER_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人ID',
  `CRTER_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人姓名',
  `CRTE_OPTINS_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建机构编号',
  `OPTER_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '经办人ID',
  `OPTER_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '经办人姓名',
  `OPT_TIME` datetime NOT NULL COMMENT '经办时间',
  `OPTINS_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '经办机构编号',
  `VER` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '版本号',
  PRIMARY KEY (`DATA_DIC_ID`) USING BTREE,
  UNIQUE INDEX `data_dic_a_unique1`(`DIC_VAL_CODE`, `DIC_TYPE_CODE`) USING BTREE COMMENT '业务逻辑唯一索引'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '数据字典表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for data_dic_mgt
-- ----------------------------
DROP TABLE IF EXISTS `data_dic_mgt`;
CREATE TABLE `data_dic_mgt`  (
  `RID` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `DIC_ID` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `DIC_CODE` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '字典代码',
  `DIC_VAL_CODE` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '字典值代码',
  `DIC_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '字典名称',
  `DIC_VAL_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '字典值名称',
  `MEMO` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注信息',
  `OPT_TIME` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `OPTER_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `OPTER_ID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VALI_FLAG` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1',
  PRIMARY KEY (`DIC_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for dwd_cbjf_fct_third_insu_psncnt_xcb_df_ytai
-- ----------------------------
DROP TABLE IF EXISTS `dwd_cbjf_fct_third_insu_psncnt_xcb_df_ytai`;
CREATE TABLE `dwd_cbjf_fct_third_insu_psncnt_xcb_df_ytai`  (
  `STT_YM` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年月',
  `PSNCNT_310` double NULL DEFAULT NULL COMMENT '职工参保缴费人数',
  `PSNCNT_XCB_310` double NULL DEFAULT NULL COMMENT '职工新参保人数',
  `P_PSNCNT_XCB_310` double NULL DEFAULT NULL COMMENT '职工新参保率',
  `PSNCNT_390` double NULL DEFAULT NULL COMMENT '居民参保缴费人数',
  `PSNCNT_XCB_390` double NULL DEFAULT NULL COMMENT '居民新参保人数',
  `P_PSNCNT_XCB_390` double NULL DEFAULT NULL COMMENT '居民新参保率',
  `ADMDVS_CITY` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '市',
  `ADMDVS_PERM` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保区划权限'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参保缴费-新参保人数情况' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for dwd_clct_d_staf_clct_df_ytai
-- ----------------------------
DROP TABLE IF EXISTS `dwd_clct_d_staf_clct_df_ytai`;
CREATE TABLE `dwd_clct_d_staf_clct_df_ytai`  (
  `psn_count` bigint(20) NULL DEFAULT NULL,
  `stt_ym` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `psn_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `poolarea_no` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for dwd_clct_d_traf_amt_df
-- ----------------------------
DROP TABLE IF EXISTS `dwd_clct_d_traf_amt_df`;
CREATE TABLE `dwd_clct_d_traf_amt_df`  (
  `stt_ym` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `traf_sumamt` double(24, 2) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dwd_ggfw_service_core_metrics_mi_ytai
-- ----------------------------
DROP TABLE IF EXISTS `dwd_ggfw_service_core_metrics_mi_ytai`;
CREATE TABLE `dwd_ggfw_service_core_metrics_mi_ytai`  (
  `biz_month` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '业务月份(YYYYMM)',
  `area_code` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '统筹区代码(370600格式)',
  `personal_service_total` bigint(20) NULL DEFAULT NULL COMMENT '个人服务总量',
  `org_service_total` bigint(20) NULL DEFAULT NULL COMMENT '单位服务总量',
  `public_service_total` bigint(20) NULL DEFAULT NULL COMMENT '公共服务事项总量',
  `gov_service_total` bigint(20) NULL DEFAULT NULL COMMENT '政务服务事项总量',
  `online_service_count` bigint(20) NULL DEFAULT NULL COMMENT '网办+掌办量',
  `self_service_count` bigint(20) NULL DEFAULT NULL COMMENT '自助机业务量',
  `other_channel_count` bigint(20) NULL DEFAULT NULL COMMENT '其他渠道量',
  `insured_person_count` bigint(20) NULL DEFAULT NULL COMMENT '参保人员总数',
  `insured_org_count` bigint(20) NULL DEFAULT NULL COMMENT '参保单位总数',
  `org_register_count` bigint(20) NULL DEFAULT NULL COMMENT '注册单位数量',
  `per_register_count` bigint(20) NULL DEFAULT NULL COMMENT '注册人员数量',
  `org_login_count` bigint(20) NULL DEFAULT NULL COMMENT '单位登录次数',
  `per_login_count` bigint(20) NULL DEFAULT NULL COMMENT '个人登录次数',
  `hour_00_02` bigint(20) NULL DEFAULT NULL COMMENT '00:00~02:00时段业务量',
  `hour_02_04` bigint(20) NULL DEFAULT NULL COMMENT '02:00~04:00时段业务量',
  `hour_04_06` bigint(20) NULL DEFAULT NULL COMMENT '04:00~06:00时段业务量',
  `hour_06_08` bigint(20) NULL DEFAULT NULL COMMENT '06:00~08:00时段业务量',
  `hour_08_10` bigint(20) NULL DEFAULT NULL COMMENT '08:00~10:00时段业务量',
  `hour_10_12` bigint(20) NULL DEFAULT NULL COMMENT '10:00~12:00时段业务量',
  `hour_12_14` bigint(20) NULL DEFAULT NULL COMMENT '12:00~14:00时段业务量',
  `hour_14_16` bigint(20) NULL DEFAULT NULL COMMENT '14:00~16:00时段业务量',
  `hour_16_18` bigint(20) NULL DEFAULT NULL COMMENT '16:00~18:00时段业务量',
  `hour_18_20` bigint(20) NULL DEFAULT NULL COMMENT '18:00~20:00时段业务量',
  `hour_20_22` bigint(20) NULL DEFAULT NULL COMMENT '20:00~22:00时段业务量',
  `hour_22_24` bigint(20) NULL DEFAULT NULL COMMENT '22:00~24:00时段业务量',
  `wechat_top1_matter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信渠道TOP1事项',
  `wechat_top1_count` bigint(20) NULL DEFAULT NULL COMMENT '微信渠道TOP1事项办理量',
  `wechat_top2_matter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信渠道TOP2事项',
  `wechat_top2_count` bigint(20) NULL DEFAULT NULL COMMENT '微信渠道TOP2事项办理量',
  `wechat_top3_matter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信渠道TOP3事项',
  `wechat_top3_count` bigint(20) NULL DEFAULT NULL COMMENT '微信渠道TOP3事项办理量',
  `online_top1_matter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '网上办事大厅渠道TOP1事项',
  `online_top1_count` bigint(20) NULL DEFAULT NULL COMMENT '网上办事大厅渠道TOP1事项办理量',
  `online_top2_matter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '网上办事大厅渠道TOP2事项',
  `online_top2_count` bigint(20) NULL DEFAULT NULL COMMENT '网上办事大厅渠道TOP2事项办理量',
  `online_top3_matter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '网上办事大厅渠道TOP3事项',
  `online_top3_count` bigint(20) NULL DEFAULT NULL COMMENT '网上办事大厅渠道TOP3事项办理量',
  `alipay_top1_matter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付宝渠道TOP1事项',
  `alipay_top1_count` bigint(20) NULL DEFAULT NULL COMMENT '支付宝渠道TOP1事项办理量',
  `alipay_top2_matter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付宝渠道TOP2事项',
  `alipay_top2_count` bigint(20) NULL DEFAULT NULL COMMENT '支付宝渠道TOP2事项办理量',
  `alipay_top3_matter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付宝渠道TOP3事项',
  `alipay_top3_count` bigint(20) NULL DEFAULT NULL COMMENT '支付宝渠道TOP3事项办理量',
  `top1_matter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'TOP1事项名称',
  `top1_matter_count` bigint(20) NULL DEFAULT NULL COMMENT 'TOP1事项办理量',
  `top2_matter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'TOP2事项名称',
  `top2_matter_count` bigint(20) NULL DEFAULT NULL COMMENT 'TOP2事项办理量',
  `top3_matter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'TOP3事项名称',
  `top3_matter_count` bigint(20) NULL DEFAULT NULL COMMENT 'TOP3事项办理量',
  `top4_matter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'TOP4事项名称',
  `top4_matter_count` bigint(20) NULL DEFAULT NULL COMMENT 'TOP4事项办理量',
  `top5_matter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'TOP5事项名称',
  `top5_matter_count` bigint(20) NULL DEFAULT NULL COMMENT 'TOP5事项办理量',
  `update_time` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据更新时间',
  `ym` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年月',
  `optins_no` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参保单位编号',
  `dw_tab_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据来源表',
  `area_name` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `pk_id` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`biz_month`, `area_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '政务服务核心指标宽表 - 只存储原始计数，不存储预计算率值' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dwd_jgxx_fcm_fixmedins_b_df_ytai
-- ----------------------------
DROP TABLE IF EXISTS `dwd_jgxx_fcm_fixmedins_b_df_ytai`;
CREATE TABLE `dwd_jgxx_fcm_fixmedins_b_df_ytai`  (
  `fixmedins_code` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗机构编码',
  `fixmedins_name` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗机构名称',
  `fixmedins_type` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗机构类型',
  `fixmedins_type_desc` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗机构类型',
  `drugstore_type` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '药店类型(双通道)',
  `drugstore_type_desc` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '药店类型描述',
  `drugstore_type_z` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '药店类型(职工购药)',
  `drugstore_type_z_desc` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '药店类型描述',
  `medins_lv` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医院级别',
  `medins_lv_desc` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医院级别',
  `dedc_hosp_lv` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗机构级别',
  `lmtpric_hosp_lv` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '限价医院等级',
  `bed_cnt` int(11) NULL DEFAULT NULL COMMENT '床位数',
  `admdvs` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保区划',
  `addr` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗机构地址',
  `tel` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `coner_name` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `lnt` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经度',
  `lat` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '纬度',
  `manage_type` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经营性质',
  `manage_mod` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经营方式',
  `manage_scp` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经营范围',
  `poolarea` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗机构医保区划',
  `out_fixmedins_type` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '异地医药机构类型',
  `medins_natu` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构性质',
  `medins_natu_desc` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构性质',
  `bloc_fixmedins_code` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `vali_cwss` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '1是村卫生室0否',
  `reserved_fielda` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预留字段',
  `reserved_fieldb` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预留字段',
  `reserved_fieldc` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预留字段',
  `dw_tab_name` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '源表名',
  `dw_exch_updt_time` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据处理时间',
  `pk_id` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据来源表代理主键'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '医疗机构基本信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dwd_jjsz_fee_list_d_opt_mi_ytai
-- ----------------------------
DROP TABLE IF EXISTS `dwd_jjsz_fee_list_d_opt_mi_ytai`;
CREATE TABLE `dwd_jjsz_fee_list_d_opt_mi_ytai`  (
  `stt_ym` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `insu_admdvs` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `insu_admdvs_desc` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `insutype` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fixmedins_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fixmedins_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `list_type_s_desc` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `med_chrgitm_type_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `det_item_fee_sumamt` decimal(16, 2) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dwd_jjsz_mztc_setl_mf_ytai
-- ----------------------------
DROP TABLE IF EXISTS `dwd_jjsz_mztc_setl_mf_ytai`;
CREATE TABLE `dwd_jjsz_mztc_setl_mf_ytai`  (
  `ym` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `psn_type` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `clct_grde` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `insutype` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `insu_admdvs` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `admdvs_desc` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fixmedins_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `hosp_lv` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fund_pay_sumamt` decimal(16, 2) NULL DEFAULT NULL,
  `medfee_sumamt` decimal(16, 2) NULL DEFAULT NULL,
  `hifp_pay` decimal(16, 2) NULL DEFAULT NULL,
  `hifob_pay` decimal(16, 2) NULL DEFAULT NULL,
  `cnt_setl` int(11) NULL DEFAULT NULL,
  `cnt_psn` int(11) NULL DEFAULT NULL,
  `fund_pay_per_p` decimal(16, 2) NULL DEFAULT NULL,
  `percentage` decimal(16, 2) NULL DEFAULT NULL,
  `flag` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dwd_jjsz_setl_d_di_ytai
-- ----------------------------
DROP TABLE IF EXISTS `dwd_jjsz_setl_d_di_ytai`;
CREATE TABLE `dwd_jjsz_setl_d_di_ytai`  (
  `clr_optins` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '清算经办机构',
  `setl_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结算ID',
  `medins_setl_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医药机构结算ID',
  `mdtrt_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊ID',
  `init_setl_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '原结算ID',
  `psn_no` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员编号',
  `psn_insu_rlts_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员参保关系ID',
  `psn_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员姓名',
  `psn_cert_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员证件类型',
  `certno` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '证件号码',
  `gend` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别',
  `naty` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '民族',
  `brdy` datetime NULL DEFAULT NULL COMMENT '出生日期',
  `age` decimal(5, 2) NULL DEFAULT NULL COMMENT '年龄',
  `insutype` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '险种类型',
  `psn_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员类别',
  `cvlserv_flag` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公务员标志',
  `cvlserv_lv` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公务员等级',
  `sp_psn_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '特殊人员类型',
  `sp_psn_type_lv` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '特殊人员类型等级',
  `clct_grde` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '缴费档次',
  `flxempe_flag` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '灵活就业标志',
  `nwb_flag` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '新生儿标志',
  `insu_admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参保所属医保区划',
  `emp_no` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位编号',
  `emp_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位名称',
  `emp_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位类型',
  `econ_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经济类型',
  `afil_indu` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所属行业',
  `afil_rlts` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '隶属关系',
  `emp_mgt_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位管理类型',
  `pay_loc` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付地点类别',
  `fixmedins_code` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定点医药机构编号',
  `fixmedins_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定点医药机构名称',
  `hosp_lv` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医院等级',
  `fix_blng_admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定点归属医保区划',
  `lmtpric_hosp_lv` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '限价医院等级',
  `dedc_hosp_lv` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '起付线医院等级',
  `begndate` datetime NULL DEFAULT NULL COMMENT '开始日期',
  `enddate` datetime NULL DEFAULT NULL COMMENT '结束日期',
  `setl_time` datetime NULL DEFAULT NULL COMMENT '结算时间',
  `mdtrt_cert_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊凭证类型',
  `mdtrt_cert_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊凭证编号',
  `med_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗类别',
  `setl_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结算类别',
  `clr_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '清算类别',
  `clr_way` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '清算方式',
  `psn_setlway` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人结算方式',
  `medfee_sumamt` decimal(18, 2) NULL DEFAULT NULL COMMENT '医疗费总额',
  `fulamt_ownpay_amt` decimal(18, 2) NULL DEFAULT NULL COMMENT '全自费金额',
  `overlmt_selfpay` decimal(18, 2) NULL DEFAULT NULL COMMENT '超限价自费费用',
  `preselfpay_amt` decimal(18, 2) NULL DEFAULT NULL COMMENT '先行自付金额',
  `inscp_amt` decimal(18, 2) NULL DEFAULT NULL COMMENT '符合范围金额',
  `dedc_std` decimal(18, 2) NULL DEFAULT NULL COMMENT '起付标准',
  `crt_dedc` decimal(18, 2) NULL DEFAULT NULL COMMENT '本次起付线',
  `act_pay_dedc` decimal(18, 2) NULL DEFAULT NULL COMMENT '实际支付起付线',
  `hifp_pay` decimal(18, 2) NULL DEFAULT NULL COMMENT '统筹基金支出',
  `pool_prop_selfpay` decimal(18, 4) NULL DEFAULT NULL COMMENT '基本医疗统筹支付比例',
  `hi_agre_sumfee` decimal(18, 2) NULL DEFAULT NULL COMMENT '医保认可费用总额',
  `cvlserv_pay` decimal(18, 2) NULL DEFAULT NULL COMMENT '公务员医疗补助资金支出',
  `hifes_pay` decimal(18, 2) NULL DEFAULT NULL COMMENT '补充医疗保险基金支出',
  `hifmi_pay` decimal(18, 2) NULL DEFAULT NULL COMMENT '大病补充医疗保险基金支出',
  `hifob_pay` decimal(18, 2) NULL DEFAULT NULL COMMENT '大额医疗补助基金支出',
  `hifdm_pay` decimal(18, 2) NULL DEFAULT NULL COMMENT '伤残人员医疗保障基金支出',
  `maf_pay` decimal(18, 2) NULL DEFAULT NULL COMMENT '医疗救助基金支出',
  `othfund_pay` decimal(18, 2) NULL DEFAULT NULL COMMENT '其它基金支付',
  `fund_pay_sumamt` decimal(18, 2) NULL DEFAULT NULL COMMENT '基金支付总额',
  `psn_pay` decimal(18, 2) NULL DEFAULT NULL COMMENT '个人支付金额',
  `acct_pay` decimal(18, 2) NULL DEFAULT NULL COMMENT '个人账户支出',
  `cash_payamt` decimal(18, 2) NULL DEFAULT NULL COMMENT '现金支付金额',
  `ownpay_hosp_part` decimal(18, 2) NULL DEFAULT NULL COMMENT '自费中医院负担部分',
  `balc` decimal(18, 2) NULL DEFAULT NULL COMMENT '余额',
  `acct_mulaid_pay` decimal(18, 2) NULL DEFAULT NULL COMMENT '账户共济支付金额',
  `refd_setl_flag` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退费结算标志',
  `cal_ipt_cnt` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '计算住院次数标志',
  `setl_cashpay_way` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结算现金支付方式',
  `year` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年度',
  `dise_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病种编号',
  `dise_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病种名称',
  `invono` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发票号',
  `manl_reim_rea` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '零星报销原因',
  `vali_flag` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '有效标志',
  `memo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `rid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据唯一记录号',
  `updt_time` datetime NULL DEFAULT NULL COMMENT '数据更新时间',
  `crter_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `crter_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人姓名',
  `crte_time` datetime NULL DEFAULT NULL COMMENT '数据创建时间',
  `crte_optins_no` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建机构编号',
  `opter_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办人ID',
  `opter_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办人姓名',
  `opt_time` datetime NULL DEFAULT NULL COMMENT '经办时间',
  `optins_no` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办机构编号',
  `poolarea_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统筹区编号',
  `mid_setl_flag` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '中途结算标志',
  `acct_used_flag` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '账户使用标志',
  `quts_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编制类型',
  `bydise_setl_payamt` decimal(18, 2) NULL DEFAULT NULL COMMENT '按病种结算支付金额',
  `exct_item_fund_payamt` decimal(18, 2) NULL DEFAULT NULL COMMENT '除外项目基金支付金额',
  `stt_ym` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'STT_YM',
  `stt_yy` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'STT_YY',
  `admdvs_desc` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参保行政规划',
  `insutype_desc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '险种',
  `fixmedins_type_desc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构类型',
  `hosp_lv_desc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医院等级',
  `med_type_desc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗类别',
  `tc` decimal(18, 2) NULL DEFAULT NULL COMMENT '统筹基金',
  `de` decimal(18, 2) NULL DEFAULT NULL COMMENT '大额基金',
  `db` decimal(18, 2) NULL DEFAULT NULL COMMENT '大病基金',
  `gwy` decimal(18, 2) NULL DEFAULT NULL COMMENT '公务员基金',
  `sy` decimal(18, 2) NULL DEFAULT NULL COMMENT '生育基金',
  `jz` decimal(18, 2) NULL DEFAULT NULL COMMENT '救助基金',
  `yf` decimal(18, 2) NULL DEFAULT NULL COMMENT '优抚基金',
  `fp` decimal(18, 2) NULL DEFAULT NULL COMMENT '扶贫基金',
  `qb` decimal(18, 2) NULL DEFAULT NULL COMMENT '企补基金',
  `qt` decimal(18, 2) NULL DEFAULT NULL COMMENT '其他基金',
  `ey` decimal(18, 2) NULL DEFAULT NULL COMMENT '二乙基金',
  `lx` decimal(18, 2) NULL DEFAULT NULL COMMENT '离休基金',
  `dw_biz_time` datetime NULL DEFAULT NULL COMMENT '业务更新时间',
  `dw_tab_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '源表名',
  `dw_exch_updt_time` datetime NULL DEFAULT NULL COMMENT '数据处理时间',
  `pk_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据来源表代理主键',
  PRIMARY KEY (`pk_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '山东烟台结算信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dwd_nbkz_prod_cunt_df_ytai
-- ----------------------------
DROP TABLE IF EXISTS `dwd_nbkz_prod_cunt_df_ytai`;
CREATE TABLE `dwd_nbkz_prod_cunt_df_ytai`  (
  `fixmedins_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗机构编码',
  `fixmedins_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗机构名称',
  `fixmedins_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗机构类型',
  `fix_blng_admdvs` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗机构医保区划',
  `dedc_hosp_lv` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗机构级别',
  `addr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗机构地址',
  `coner_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人姓名',
  `row_num` double NULL DEFAULT NULL COMMENT '上传数据量',
  `type_source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接口类型',
  `stt_ym` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年月',
  `dw_tab_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据来源表',
  `dw_exch_updt_time` date NULL DEFAULT NULL COMMENT '数据交换更新时间',
  `pk_id` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '代理主键',
  `poolarea_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统筹区编码',
  `poolarea_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统筹区名称',
  `fz_fix_setl_p` decimal(20, 4) NULL DEFAULT NULL COMMENT '盘存结算率分子',
  `fz_fix_setl_x` decimal(20, 4) NULL DEFAULT NULL COMMENT '销售结算率分子',
  `fm_fix_setl` decimal(20, 4) NULL DEFAULT NULL COMMENT '结算率分母',
  `fm_drugstr_setl` decimal(20, 4) NULL DEFAULT NULL COMMENT '定点零售药店 结算率分母',
  `fm_unrated_setl` decimal(20, 4) NULL DEFAULT NULL COMMENT '未定级 结算率分母',
  `fm_clinic_setl` decimal(20, 4) NULL DEFAULT NULL COMMENT '卫生所 结算率分母',
  `fz_drugstr_setl` decimal(20, 4) NULL DEFAULT NULL COMMENT '定点零售药店',
  `fz_unrated_setl` decimal(20, 4) NULL DEFAULT NULL COMMENT '未定级 结算率分母',
  `fz_clinic_setl` decimal(20, 4) NULL DEFAULT NULL COMMENT '未定级 结算率分母',
  `fix_fm_p_wm` decimal(20, 4) NULL DEFAULT NULL COMMENT '盘存无码率分母',
  `fix_fz_p_wm` decimal(20, 4) NULL DEFAULT NULL COMMENT '盘存无码率分子',
  `fix_fm_x_wm` decimal(20, 4) NULL DEFAULT NULL COMMENT '无码率销售分母',
  `fix_fz_x_wm` decimal(20, 4) NULL DEFAULT NULL COMMENT '无码率销售分子',
  `fz_drugstr_wm` decimal(20, 4) NULL DEFAULT NULL COMMENT '定点零售药店 无码率分子',
  `fm_drugstr_wm` decimal(20, 4) NULL DEFAULT NULL COMMENT '定点零售药店 无码率分母',
  `fz_unrated_wm` decimal(20, 4) NULL DEFAULT NULL COMMENT '未定级 无码率分子',
  `fm_unrated_wm` decimal(20, 4) NULL DEFAULT NULL COMMENT '未定级 无码率分母',
  `fz_clinic_wm` decimal(20, 4) NULL DEFAULT NULL COMMENT '卫生所 无码率分子',
  `fm_clinic_wm` decimal(20, 4) NULL DEFAULT NULL COMMENT '卫生所 无码率分母',
  `sl_cf` double NULL DEFAULT NULL COMMENT '重复数量',
  `sl_max` double NULL DEFAULT NULL COMMENT '最大重复数量',
  `sl_fix_true` double NULL DEFAULT NULL COMMENT '上传医疗机构数量',
  `sl_fix_cf` double NULL DEFAULT NULL COMMENT '上传重复医疗机构数量',
  `fm_access_jr` double NULL DEFAULT NULL COMMENT '接入分母',
  `fz_access_jr` double NULL DEFAULT NULL COMMENT '接入分子',
  `fzxs_access_jr` double NULL DEFAULT NULL COMMENT '接入销售分子',
  PRIMARY KEY (`pk_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '追溯码上传医疗机构数量汇总表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dwd_sdyt_fee_list_d_opt
-- ----------------------------
DROP TABLE IF EXISTS `dwd_sdyt_fee_list_d_opt`;
CREATE TABLE `dwd_sdyt_fee_list_d_opt`  (
  `stt_ym` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统计年月',
  `insu_admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定点归属医保区划',
  `insutype` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '险种类型',
  `fixmedins_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定点医药机构编号',
  `fixmedins_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定点医药机构名称',
  `med_chrgitm_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保目录编码类型CODE',
  `med_chrgitm_type_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保目录编码类型NAMEA',
  `det_item_fee_sumamt` decimal(11, 2) NULL DEFAULT NULL COMMENT '明细项目费用总额'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '门诊统筹基金运行监测-费用构成' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for dwd_sdyt_setld_payfund_opt
-- ----------------------------
DROP TABLE IF EXISTS `dwd_sdyt_setld_payfund_opt`;
CREATE TABLE `dwd_sdyt_setld_payfund_opt`  (
  `ym` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年月',
  `insutype` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '险种类型',
  `insu_admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参保所属医保区划',
  `link` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '1大额2基本',
  `cnt_setl` decimal(11, 2) NULL DEFAULT NULL COMMENT '人次',
  `cnt_psn` decimal(11, 2) NULL DEFAULT NULL COMMENT '人数',
  `medfee_sum` decimal(11, 2) NULL DEFAULT NULL COMMENT '医疗总费用',
  `fund_pay` decimal(11, 2) NULL DEFAULT NULL COMMENT '统筹支出'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '门诊统筹-统筹基金累计' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for dwd_setl_d_mat_type_count
-- ----------------------------
DROP TABLE IF EXISTS `dwd_setl_d_mat_type_count`;
CREATE TABLE `dwd_setl_d_mat_type_count`  (
  `stt_ym` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mat_idet_code` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `med_type_new` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `psn_count` int(12) NULL DEFAULT NULL,
  `SETL_TIMECNT` int(12) NULL DEFAULT NULL,
  `MAF_PAY` double(18, 2) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dwd_ydjy_outmed_setl_d_grp_time_df_ytai
-- ----------------------------
DROP TABLE IF EXISTS `dwd_ydjy_outmed_setl_d_grp_time_df_ytai`;
CREATE TABLE `dwd_ydjy_outmed_setl_d_grp_time_df_ytai`  (
  `count_psn_no` bigint(20) NULL DEFAULT NULL COMMENT '结算人次',
  `count_dis_psn_no` bigint(25) NULL DEFAULT NULL COMMENT '结算人数',
  `sum_medfee_sumamt` decimal(20, 2) NULL DEFAULT NULL COMMENT '医疗费总额',
  `sum_hifp_pay` decimal(20, 2) NULL DEFAULT NULL COMMENT '统筹基金支出',
  `sum_fund_pay_sumamt` decimal(20, 2) NULL DEFAULT NULL COMMENT '基金支付总额',
  `avgday_sum` bigint(20) NULL DEFAULT NULL COMMENT '本月平均住院日天数汇总和',
  `avgday_count` bigint(20) NULL DEFAULT NULL COMMENT '本月平均住院日人次',
  `hifob_pay` bigint(20) NULL DEFAULT NULL COMMENT '大额医疗补助基金支出',
  `hifmi_pay` bigint(20) NULL DEFAULT NULL COMMENT '大病补充医疗保险基金支出',
  `hifdm_pay` bigint(20) NULL DEFAULT NULL COMMENT '伤残人员医疗保障基金支出',
  `maf_pay` bigint(20) NULL DEFAULT NULL COMMENT '医疗救助基金支出',
  `othfund_pay` bigint(20) NULL DEFAULT NULL COMMENT '其它基金支付',
  `psn_pay` bigint(20) NULL DEFAULT NULL COMMENT '个人支付金额',
  `acct_pay` bigint(20) NULL DEFAULT NULL COMMENT '个人账户支出',
  `cash_payamt` bigint(20) NULL DEFAULT NULL COMMENT '现金支付金额',
  `year_months` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年月',
  `fixmedins_code` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗机构编码',
  `fixmedins_name` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗机构名称',
  `fix_blng_admdvs` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定点归属医保区划',
  `fix_blng_admdvs_name` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定点归属医保区划名称',
  `med_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗类别',
  `count_psn_appy_rloc_l` bigint(55) NULL DEFAULT NULL COMMENT '异地长期',
  `count_psn_appy_rloc_s` bigint(55) NULL DEFAULT NULL COMMENT '异地短期备案',
  `prov_type` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省类型',
  `insu_admdvs` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区划',
  `admdvs_name` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区划',
  `admdvs_city_code` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区划',
  `admdvs_city_name` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区划',
  `admdvs_province_code` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区划',
  `admdvs_province_name` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区划',
  `data_type` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  INDEX `idx_year_months`(`year_months`) USING BTREE,
  INDEX `idx_med_type`(`med_type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dwd_ydjy_setl_d_mi_ytai
-- ----------------------------
DROP TABLE IF EXISTS `dwd_ydjy_setl_d_mi_ytai`;
CREATE TABLE `dwd_ydjy_setl_d_mi_ytai`  (
  `ym` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `clct_grde` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `insutype` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `insu_admdvs` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `insu_admdvs_name` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `med_type` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `med_type_desc` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fund_pay_sumamt` decimal(20, 2) NULL DEFAULT NULL,
  `medfee_sumamt` decimal(20, 2) NULL DEFAULT NULL,
  `hifp_pay` decimal(20, 2) NULL DEFAULT NULL,
  `hifob_pay` decimal(20, 2) NULL DEFAULT NULL,
  `inscp_amt` decimal(20, 2) NULL DEFAULT NULL,
  `cnt_setl` bigint(20) NULL DEFAULT NULL,
  `cnt_psn` bigint(20) NULL DEFAULT NULL,
  `fund_pay_310100` decimal(20, 2) NULL DEFAULT NULL,
  `fund_pay_330100` decimal(20, 2) NULL DEFAULT NULL,
  `fund_pay_390200` decimal(20, 2) NULL DEFAULT NULL,
  `fund_pay_320100` decimal(20, 2) NULL DEFAULT NULL,
  `fund_pay_510100` decimal(20, 2) NULL DEFAULT NULL,
  `fund_pay_610100` decimal(20, 2) NULL DEFAULT NULL,
  `fund_pay_99999704` decimal(20, 2) NULL DEFAULT NULL,
  `fund_pay_99999705` decimal(20, 2) NULL DEFAULT NULL,
  `fund_pay_370100` decimal(20, 2) NULL DEFAULT NULL,
  `fund_pay_999997` decimal(20, 2) NULL DEFAULT NULL,
  `fund_pay_350100` decimal(20, 2) NULL DEFAULT NULL,
  `fund_pay_340100` decimal(20, 2) NULL DEFAULT NULL,
  `pay_loc` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fix_blng_admdvs` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fix_blng_admdvs_name` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fix_blng_admdvs_city_code` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fix_blng_admdvs_city_name` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fix_blng_province_code` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fix_blng_province_name` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fixmedins_code` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fixmedins_name` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `data_flag` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dwd_znjg_bffact_warn_call_d_df_ytai
-- ----------------------------
DROP TABLE IF EXISTS `dwd_znjg_bffact_warn_call_d_df_ytai`;
CREATE TABLE `dwd_znjg_bffact_warn_call_d_df_ytai`  (
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '统计类型',
  `total_count` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '调用次数',
  `psn_count` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人次',
  `rule_count` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则次数',
  `medfee_sumamt` decimal(18, 2) NULL DEFAULT NULL COMMENT '医疗费总额',
  `med_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '医疗类别',
  `admdvs` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '区划',
  `admdvs_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '区划名称',
  `medins_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '医疗机构类别',
  `medins_lv` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '医疗机构级别',
  `medins_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '医疗机构名称',
  `pt_month` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '统计月份',
  PRIMARY KEY (`type`, `med_type`, `admdvs`, `admdvs_name`, `medins_type`, `medins_lv`, `medins_name`, `pt_month`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '事前提醒调用信息归集表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dws_cbjf_fund_rsdt_revenue_mi_ytai
-- ----------------------------
DROP TABLE IF EXISTS `dws_cbjf_fund_rsdt_revenue_mi_ytai`;
CREATE TABLE `dws_cbjf_fund_rsdt_revenue_mi_ytai`  (
  `CLCT_SUMAMT` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '缴费总金额',
  `CLCT_SUMAMT_CR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '缴费总金额环比',
  `CLCT_SUMAMT_SR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '缴费总金额同比',
  `FINSUBS_AMT` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '财补金额',
  `FINSUBS_AMT_CR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '财补金额环比',
  `FINSUBS_AMT_SR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '财补金额同比',
  `COTY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区划',
  `COTY_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区划名称',
  `PSN_TYPE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员类别',
  `stt_y` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dws_cbjf_fund_staf_revenue_mi_ytai
-- ----------------------------
DROP TABLE IF EXISTS `dws_cbjf_fund_staf_revenue_mi_ytai`;
CREATE TABLE `dws_cbjf_fund_staf_revenue_mi_ytai`  (
  `CLCT_SUMAMT` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '缴费总金额',
  `CLCT_SUMAMT_CR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '缴费总金额同比',
  `CLCT_SUMAMT_SR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '缴费总金额环比',
  `EMP_CLCT_AMT` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位缴费金额',
  `EMP_CLCT_AMT_CR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位缴费金额环比',
  `EMP_CLCT_AMT_SR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位缴费金额同比',
  `PSN_CLCT_AMT` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人缴费金额',
  `PSN_CLCT_AMT_CR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人缴费金额环比',
  `PSN_CLCT_AMT_SR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人缴费金额同比',
  `INTO_ACCT_AMT` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '划入账户金额',
  `INTO_ACCT_AMT_CR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '划入账户金额环比',
  `INTO_ACCT_AMT_SR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '划入账户金额同比',
  `STT_FUND_INC` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统计基金收入',
  `STT_FUND_INC_CR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统计基金收入环比',
  `STT_FUND_INC_SR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统计基金收入同比',
  `COTY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区划',
  `COTY_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区划名称',
  `PSN_TYPE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员类别',
  `PSN_TYPE_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员类别名称',
  `stt_ym` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年月'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dws_cbjf_insu_ext_dspo_mi_ytai
-- ----------------------------
DROP TABLE IF EXISTS `dws_cbjf_insu_ext_dspo_mi_ytai`;
CREATE TABLE `dws_cbjf_insu_ext_dspo_mi_ytai`  (
  `ttp_cnt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `dspo_flag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `coty` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `year` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dws_cbjf_insu_ext_dspo_mi_ytai_copy1
-- ----------------------------
DROP TABLE IF EXISTS `dws_cbjf_insu_ext_dspo_mi_ytai_copy1`;
CREATE TABLE `dws_cbjf_insu_ext_dspo_mi_ytai_copy1`  (
  `ttp_cnt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `dspo_flag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `coty` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `year` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dws_cbjf_insu_ext_fb_mi_ytai
-- ----------------------------
DROP TABLE IF EXISTS `dws_cbjf_insu_ext_fb_mi_ytai`;
CREATE TABLE `dws_cbjf_insu_ext_fb_mi_ytai`  (
  `ttp_cnt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fbck_rslt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `coty` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `year` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dws_cbjf_insu_ext_fb_mi_ytai_copy1
-- ----------------------------
DROP TABLE IF EXISTS `dws_cbjf_insu_ext_fb_mi_ytai_copy1`;
CREATE TABLE `dws_cbjf_insu_ext_fb_mi_ytai_copy1`  (
  `ttp_cnt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fbck_rslt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `coty` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `year` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dws_cbjf_insu_ext_mi_ytai
-- ----------------------------
DROP TABLE IF EXISTS `dws_cbjf_insu_ext_mi_ytai`;
CREATE TABLE `dws_cbjf_insu_ext_mi_ytai`  (
  `ttp_cnt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ext_sum_flag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `bchno` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `coty` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `year` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for dws_cbjf_insu_info_ext_mi_ytai
-- ----------------------------
DROP TABLE IF EXISTS `dws_cbjf_insu_info_ext_mi_ytai`;
CREATE TABLE `dws_cbjf_insu_info_ext_mi_ytai`  (
  `coty` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `coty_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `value1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `value2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `value3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `value4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `value5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for dws_cbjf_psn_insu_mi_ytai
-- ----------------------------
DROP TABLE IF EXISTS `dws_cbjf_psn_insu_mi_ytai`;
CREATE TABLE `dws_cbjf_psn_insu_mi_ytai`  (
  `INSU_PSNCNT` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参保人数',
  `INSU_PSNCNT_CR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参保人数环比',
  `INSU_PSNCNT_SR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参保人数同比',
  `emp_cnt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位数量',
  `emp_cnt_cr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位数量环比',
  `emp_cnt_sr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位数量同比',
  `age_s` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄段',
  `age_s_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄段描述',
  `insutype_s` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '险种',
  `psn_type_s` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员分类',
  `type_s` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类',
  `NWB_CNT` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '新生儿数量',
  `BIG_STDT_CNT` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '大学生数量',
  `NEW_INSU_CNT` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '新参保数量',
  `COTY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区划',
  `COTY_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区划名称',
  `stt_ym` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年月'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dws_cbkm_psn_count_mi_ytai
-- ----------------------------
DROP TABLE IF EXISTS `dws_cbkm_psn_count_mi_ytai`;
CREATE TABLE `dws_cbkm_psn_count_mi_ytai`  (
  `coty_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区划名称',
  `admdvs` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区划',
  `stafZZCount` int(30) NULL DEFAULT NULL COMMENT '在职人数',
  `stafTXCount` int(30) NULL DEFAULT NULL COMMENT '退休人数',
  `JMCount` int(30) NULL DEFAULT NULL COMMENT '居民人数',
  `MBCount` int(30) NULL DEFAULT NULL COMMENT '年底目标',
  `WCBCount` int(30) NULL DEFAULT NULL COMMENT '未参保人数',
  `CBpre` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参保覆盖率',
  `ZLCount` int(30) NULL DEFAULT NULL COMMENT '增量',
  `QNCount` int(30) NULL DEFAULT NULL COMMENT '去年参保人数',
  `year` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年度'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dws_fee_list_d_med_type_sum_yt
-- ----------------------------
DROP TABLE IF EXISTS `dws_fee_list_d_med_type_sum_yt`;
CREATE TABLE `dws_fee_list_d_med_type_sum_yt`  (
  `med_chrgitm_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `med_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sumamt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `stt_prd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dws_fee_list_d_med_type_yt
-- ----------------------------
DROP TABLE IF EXISTS `dws_fee_list_d_med_type_yt`;
CREATE TABLE `dws_fee_list_d_med_type_yt`  (
  `medins_list_codg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `medins_list_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sumamt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `yoy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `med_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `med_chrgitm_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `stt_prd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dws_jgxx_fixmedins_setl_fcm_df_ytai
-- ----------------------------
DROP TABLE IF EXISTS `dws_jgxx_fixmedins_setl_fcm_df_ytai`;
CREATE TABLE `dws_jgxx_fixmedins_setl_fcm_df_ytai`  (
  `fixmedins_code` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗机构编码',
  `fixmedins_name` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗机构名称',
  `fixmedins_type` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗机构类型',
  `fixmedins_type_desc` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗机构类型',
  `drugstore_type` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '药店类型',
  `drugstore_type_desc` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '药店类型描述',
  `drugstore_type_z` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '药店类型(职工购药)',
  `drugstore_type_z_desc` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '药店类型描述',
  `medins_lv` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医院级别',
  `medins_lv_desc` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医院级别',
  `dedc_hosp_lv` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗机构级别',
  `lmtpric_hosp_lv` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '限价医院等级',
  `bed_cnt` int(11) NULL DEFAULT NULL COMMENT '床位数',
  `admdvs` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保区划',
  `addr` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗机构地址',
  `tel` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `coner_name` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `lnt` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经度',
  `lat` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '纬度',
  `manage_type` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经营性质',
  `manage_mod` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经营方式',
  `manage_scp` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '经营范围',
  `poolarea` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗机构医保区划',
  `out_fixmedins_type` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '异地医药机构类型',
  `medins_natu` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构性质',
  `medins_natu_desc` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构性质',
  `bloc_fixmedins_code` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `vali_cwss` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '1是村卫生室0否',
  `reserved_fielda` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预留字段',
  `reserved_fieldb` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预留字段',
  `reserved_fieldc` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预留字段',
  `bizdate` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '当日时间',
  `day_setl_count` bigint(20) NULL DEFAULT NULL COMMENT '当日结算人次',
  `day_setl_amount` bigint(20) NULL DEFAULT NULL COMMENT '当日结算金额',
  `fulamt_ownpay_amt` bigint(20) NULL DEFAULT NULL COMMENT '当日总垫付金额',
  `hifp_pay` bigint(20) NULL DEFAULT NULL COMMENT ' 当日统筹基金',
  `other_hifp_pay` bigint(20) NULL DEFAULT NULL COMMENT ' 当日其它基金',
  `numb_of_inpat` bigint(20) NULL DEFAULT NULL COMMENT '当前在院人数',
  `day_setl_outs` bigint(20) NULL DEFAULT NULL COMMENT '当前未结算天数',
  `cntr_stas` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '协议状态',
  `cntr_stas_desc` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '协议状态描述',
  `fix_cntr_serv_obj` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务对象',
  `fix_cntr_serv_scp` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务内容',
  `fix_cntr_serv_obj_decs` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务对象描述',
  `fix_cntr_serv_scp_decs` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务内容描述',
  `dw_tab_name` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '源表名',
  `dw_exch_updt_time` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据处理时间',
  `pk_id` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据来源表代理主键'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '医疗机构基本信息和每日情况信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dws_jjsz_fee_list_d_pay_mi_ytai
-- ----------------------------
DROP TABLE IF EXISTS `dws_jjsz_fee_list_d_pay_mi_ytai`;
CREATE TABLE `dws_jjsz_fee_list_d_pay_mi_ytai`  (
  `stt_ym` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `insu_admdvs` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `insutype` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fixmedins_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fixmedins_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `list_type_s_desc` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `det_item_fee_sumamt` decimal(16, 2) NULL DEFAULT NULL,
  INDEX `idx_jsz_fee_list_d_pay_1`(`list_type_s_desc`) USING BTREE,
  INDEX `idx_jsz_fee_list_d_pay_2`(`insutype`) USING BTREE,
  INDEX `idx_jsz_fee_list_d_pay_3`(`stt_ym`, `insutype`, `insu_admdvs`) USING BTREE,
  INDEX `idx_stt_ym_insutype_insu_admdvs`(`stt_ym`, `insutype`, `insu_admdvs`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dws_jjsz_fee_list_med_type_mi_ytai
-- ----------------------------
DROP TABLE IF EXISTS `dws_jjsz_fee_list_med_type_mi_ytai`;
CREATE TABLE `dws_jjsz_fee_list_med_type_mi_ytai`  (
  `medins_list_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗名称',
  `medins_list_codg` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗编码',
  `med_type_desc` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗类别',
  `med_chrgitm_type` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类别',
  `insu_admdvs` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区划',
  `sumamt` decimal(15, 2) NULL DEFAULT NULL COMMENT '金额',
  `yoy` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '同比',
  `stt_prd` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年月',
  INDEX `idx_jsz_fee_list_med_type_4`(`med_type_desc`, `med_chrgitm_type`, `insu_admdvs`) USING BTREE,
  INDEX `idx_jsz_fee_list_med_type_3`(`med_type_desc`, `insu_admdvs`, `stt_prd`) USING BTREE,
  INDEX `idx_jsz_fee_list_med_type_2`(`med_type_desc`, `insu_admdvs`, `stt_prd`, `med_chrgitm_type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dws_jjsz_fund_pay_mi_ytai
-- ----------------------------
DROP TABLE IF EXISTS `dws_jjsz_fund_pay_mi_ytai`;
CREATE TABLE `dws_jjsz_fund_pay_mi_ytai`  (
  `setl_amt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结算金额',
  `setl_amt_CR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `setl_amt_SR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `setl_cnt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结算人次',
  `setl_cnt_CR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `setl_cnt_SR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `setl_psn_cnt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结算人数',
  `setl_psn_cnt_without41` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `setl_psn_cnt_CR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `setl_psn_cnt_SR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fixmedins_cnt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗机构数量',
  `fixmedins_cnt_cr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fixmedins_cnt_sr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fund_pay_sumamt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '基金支出金额',
  `fund_pay_sumamt_CR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fund_pay_sumamt_SR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `hi_pay_sumamt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统筹基金金额',
  `hi_pay_sumamt_CR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `hi_pay_sumamt_SR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `coty` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区划',
  `coty_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区划名称',
  `out_flag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '异地标志',
  `fixmedins_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定点类别',
  `insutype` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '险种',
  `stt_ym` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  INDEX `coty_fix_bln_index`(`coty`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dws_jjsz_fund_pay_rsdt_year_mi_ytai
-- ----------------------------
DROP TABLE IF EXISTS `dws_jjsz_fund_pay_rsdt_year_mi_ytai`;
CREATE TABLE `dws_jjsz_fund_pay_rsdt_year_mi_ytai`  (
  `setl_amt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结算金额',
  `setl_amt_CR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `setl_amt_SR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `setl_cnt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结算人次',
  `setl_cnt_CR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `setl_cnt_SR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `setl_psn_cnt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结算人数',
  `setl_psn_cnt_CR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `setl_psn_cnt_SR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fixmedins_cnt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗机构数量',
  `fixmedins_cnt_cr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fixmedins_cnt_sr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fund_pay_sumamt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '基金支出金额',
  `fund_pay_sumamt_CR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fund_pay_sumamt_SR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `hi_pay_sumamt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统筹基金金额',
  `hi_pay_sumamt_CR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `hi_pay_sumamt_SR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `coty` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区划',
  `coty_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区划名称',
  `out_flag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '异地标志',
  `fixmedins_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定点类别',
  `insutype` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '险种',
  `stt_ym` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dws_jjsz_hosp_rank_pay_mi_ytai
-- ----------------------------
DROP TABLE IF EXISTS `dws_jjsz_hosp_rank_pay_mi_ytai`;
CREATE TABLE `dws_jjsz_hosp_rank_pay_mi_ytai`  (
  `stt_ym` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `insutype` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `insu_admdvs` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `med_type_desc` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fixmedins_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fixmedins_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `medfee_sumamt` decimal(16, 2) NULL DEFAULT NULL,
  `fund_pay_sumamt` decimal(16, 2) NULL DEFAULT NULL,
  INDEX `idx_jsz_hosp_rank_pay_1`(`stt_ym`, `insu_admdvs`, `insutype`, `med_type_desc`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dws_jjsz_setl_d_pay_mi_ytai
-- ----------------------------
DROP TABLE IF EXISTS `dws_jjsz_setl_d_pay_mi_ytai`;
CREATE TABLE `dws_jjsz_setl_d_pay_mi_ytai`  (
  `stt_ym` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `clct_grde` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `insutype` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `insu_admdvs` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fixmedins_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `med_type_desc` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fund_pay_sumamt` decimal(16, 2) NULL DEFAULT NULL,
  `medfee_sumamt` decimal(16, 2) NULL DEFAULT NULL,
  `hifp_pay` decimal(16, 2) NULL DEFAULT NULL,
  `hifob_pay` decimal(16, 2) NULL DEFAULT NULL,
  `inscp_amt` decimal(16, 2) NULL DEFAULT NULL,
  `cnt_setl` decimal(16, 0) NULL DEFAULT NULL,
  `cnt_psn` decimal(16, 0) NULL DEFAULT NULL,
  `tc` decimal(16, 2) NULL DEFAULT NULL,
  `de` decimal(16, 2) NULL DEFAULT NULL,
  `db` decimal(16, 2) NULL DEFAULT NULL,
  `gwy` decimal(16, 2) NULL DEFAULT NULL,
  `sy` decimal(16, 2) NULL DEFAULT NULL,
  `jz` decimal(16, 2) NULL DEFAULT NULL,
  `yf` decimal(16, 2) NULL DEFAULT NULL,
  `fp` decimal(16, 2) NULL DEFAULT NULL,
  `qb` decimal(16, 2) NULL DEFAULT NULL,
  `qt` decimal(16, 2) NULL DEFAULT NULL,
  `ey` decimal(16, 2) NULL DEFAULT NULL,
  `lx` decimal(16, 2) NULL DEFAULT NULL,
  `pay_loc` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fix_blng_admdvs` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `flag` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  INDEX `idx_jsz_setl_d_pay_1`(`insu_admdvs`, `insutype`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dws_jjsz_setl_d_pay_mi_ytai_copy1
-- ----------------------------
DROP TABLE IF EXISTS `dws_jjsz_setl_d_pay_mi_ytai_copy1`;
CREATE TABLE `dws_jjsz_setl_d_pay_mi_ytai_copy1`  (
  `stt_ym` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `clct_grde` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `insutype` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `insu_admdvs` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fixmedins_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `med_type_desc` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fund_pay_sumamt` decimal(16, 2) NULL DEFAULT NULL,
  `medfee_sumamt` decimal(16, 2) NULL DEFAULT NULL,
  `hifp_pay` decimal(16, 2) NULL DEFAULT NULL,
  `hifob_pay` decimal(16, 2) NULL DEFAULT NULL,
  `inscp_amt` decimal(16, 2) NULL DEFAULT NULL,
  `cnt_setl` decimal(16, 0) NULL DEFAULT NULL,
  `cnt_psn` decimal(16, 0) NULL DEFAULT NULL,
  `tc` decimal(16, 2) NULL DEFAULT NULL,
  `de` decimal(16, 2) NULL DEFAULT NULL,
  `db` decimal(16, 2) NULL DEFAULT NULL,
  `gwy` decimal(16, 2) NULL DEFAULT NULL,
  `sy` decimal(16, 2) NULL DEFAULT NULL,
  `jz` decimal(16, 2) NULL DEFAULT NULL,
  `yf` decimal(16, 2) NULL DEFAULT NULL,
  `fp` decimal(16, 2) NULL DEFAULT NULL,
  `qb` decimal(16, 2) NULL DEFAULT NULL,
  `qt` decimal(16, 2) NULL DEFAULT NULL,
  `ey` decimal(16, 2) NULL DEFAULT NULL,
  `lx` decimal(16, 2) NULL DEFAULT NULL,
  `pay_loc` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fix_blng_admdvs` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `flag` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  INDEX `idx_jsz_setl_d_pay_1`(`insu_admdvs`, `insutype`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dws_jjsz_setl_d_pay_mi_ytai_copy2
-- ----------------------------
DROP TABLE IF EXISTS `dws_jjsz_setl_d_pay_mi_ytai_copy2`;
CREATE TABLE `dws_jjsz_setl_d_pay_mi_ytai_copy2`  (
  `stt_ym` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `clct_grde` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `insutype` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `insu_admdvs` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fixmedins_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `med_type_desc` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fund_pay_sumamt` decimal(16, 2) NULL DEFAULT NULL,
  `medfee_sumamt` decimal(16, 2) NULL DEFAULT NULL,
  `hifp_pay` decimal(16, 2) NULL DEFAULT NULL,
  `hifob_pay` decimal(16, 2) NULL DEFAULT NULL,
  `inscp_amt` decimal(16, 2) NULL DEFAULT NULL,
  `cnt_setl` decimal(16, 0) NULL DEFAULT NULL,
  `cnt_psn` decimal(16, 0) NULL DEFAULT NULL,
  `tc` decimal(16, 2) NULL DEFAULT NULL,
  `de` decimal(16, 2) NULL DEFAULT NULL,
  `db` decimal(16, 2) NULL DEFAULT NULL,
  `gwy` decimal(16, 2) NULL DEFAULT NULL,
  `sy` decimal(16, 2) NULL DEFAULT NULL,
  `jz` decimal(16, 2) NULL DEFAULT NULL,
  `yf` decimal(16, 2) NULL DEFAULT NULL,
  `fp` decimal(16, 2) NULL DEFAULT NULL,
  `qb` decimal(16, 2) NULL DEFAULT NULL,
  `qt` decimal(16, 2) NULL DEFAULT NULL,
  `ey` decimal(16, 2) NULL DEFAULT NULL,
  `lx` decimal(16, 2) NULL DEFAULT NULL,
  `pay_loc` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fix_blng_admdvs` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `flag` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  INDEX `idx_jsz_setl_d_pay_1`(`insu_admdvs`, `insutype`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dws_outmed_setl_d_yt
-- ----------------------------
DROP TABLE IF EXISTS `dws_outmed_setl_d_yt`;
CREATE TABLE `dws_outmed_setl_d_yt`  (
  `stt_prd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `insutype` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `med_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `medfee_sumamt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fund_pay_sumamt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `inscp_amt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dws_outmed_setl_info
-- ----------------------------
DROP TABLE IF EXISTS `dws_outmed_setl_info`;
CREATE TABLE `dws_outmed_setl_info`  (
  `setl_cnt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `out_setl_cnt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `stt_prd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `pay_loc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dws_setl_d_fixmedins_type
-- ----------------------------
DROP TABLE IF EXISTS `dws_setl_d_fixmedins_type`;
CREATE TABLE `dws_setl_d_fixmedins_type`  (
  `fixmedins_cnt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `setl_cnt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `medfee_sumamt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fund_pay_sumamt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `hifp_pay` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fixmedins_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `stt_prd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fee_list_d_day
-- ----------------------------
DROP TABLE IF EXISTS `fee_list_d_day`;
CREATE TABLE `fee_list_d_day`  (
  `partition_id` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `rid` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `insu_admdvs` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参保地行政区划',
  `setl_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结算时间',
  `setl_hours` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结算时间（小时）',
  `med_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗类别',
  `insutype` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参保险种',
  `fixmedins_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定点医疗编号',
  `fixmedins_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定点医疗名称',
  `dise_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '疾病编码',
  `dise_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '疾病名称',
  `hilist_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保目录名称',
  `med_chrgitm_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗收费项目类别',
  `sumamt` decimal(16, 2) NULL DEFAULT NULL COMMENT '明细项目费用总额-费用金额',
  `crte_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据固化时间',
  `list_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '目录类别',
  PRIMARY KEY (`partition_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fee_list_d_inhosp_day
-- ----------------------------
DROP TABLE IF EXISTS `fee_list_d_inhosp_day`;
CREATE TABLE `fee_list_d_inhosp_day`  (
  `partition_id` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '结算ID',
  `rid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `insu_admdvs` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参保地行政区划',
  `fee_ocur_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '费用发生时间',
  `insutype` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参保险种',
  `fixmedins_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定点医疗编号',
  `fixmedins_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定点医疗名称',
  `dise_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '疾病编码',
  `dise_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '疾病名称',
  `hilist_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保目录名称',
  `med_chrgim_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗收费项目类别',
  `sumamt` decimal(16, 2) NULL DEFAULT NULL COMMENT '明细项目费用总额',
  `crte_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据固化时间',
  `list_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '目录类别',
  `cnt` bigint(255) NULL DEFAULT NULL COMMENT '使用人次',
  PRIMARY KEY (`partition_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fixmedins_b
-- ----------------------------
DROP TABLE IF EXISTS `fixmedins_b`;
CREATE TABLE `fixmedins_b`  (
  `FIXMEDINS_CODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '定点医药机构编号',
  `MEDINS_MGTCODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医药机构管理码',
  `USCC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统一社会信用代码',
  `ORGCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织机构代码',
  `fix_blng_admdvs_city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FIX_BLNG_ADMDVS` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '定点归属医保区划',
  `FIXMEDINS_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '定点医药机构名称',
  `FIXMEDINS_TYPE` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '定点医疗服务机构类型',
  `HOSP_LV` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '医院等级',
  `LMTPRIC_HOSP_LV` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '限价医院等级',
  `DEDC_HOSP_LV` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '起付线医院等级',
  `BEGNTIME` datetime NOT NULL COMMENT '开始时间',
  `ENDTIME` datetime NULL DEFAULT NULL COMMENT '结束时间',
  `HI_RESPER_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保办负责人姓名',
  `HI_RESPER_TEL` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保办负责人联系电话',
  `HI_RESPER_CERT_TYPE` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保办负责人证件类型',
  `HI_RESPER_CERTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保办负责人证件号码',
  `OUT_FIXMEDINS_TYPE` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '异地医药机构类型',
  `FIX_ONLN_OPEN_FLAG` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '定点联网开通标志',
  `OUT_ONLN_OPEN_TYPE` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '异地联网开通类型',
  `NAT_PLAF_CODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '国家异地平台机构编号',
  `PROV_PLAF_CODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省内异地平台机构编号',
  `VALI_FLAG` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '有效标志',
  `MEMO` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `RID` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据唯一记录号',
  `UPDT_TIME` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据更新时间',
  `CRTER_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `CRTER_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人姓名',
  `CRTE_TIME` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `CRTE_OPTINS_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建机构编号',
  `OPTER_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办人ID',
  `OPTER_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办人姓名',
  `OPT_TIME` datetime NULL DEFAULT NULL COMMENT '经办时间',
  `OPTINS_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办机构编号',
  `POOLAREA_NO` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统筹区编号',
  PRIMARY KEY (`FIXMEDINS_CODE`) USING BTREE,
  INDEX `IDX_FIXMEDINS_B_1`(`USCC`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定点医药机构业务信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fund_analysis_data
-- ----------------------------
DROP TABLE IF EXISTS `fund_analysis_data`;
CREATE TABLE `fund_analysis_data`  (
  `DATA_ID` int(11) NOT NULL,
  `DATA_NAME` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DATA_VALUE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `VALI_FLAG` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '有效标志',
  `MEMO` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `RID` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据唯一记录号',
  `UPDT_TIME` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据更新时间',
  `CRTER_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `CRTER_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人姓名',
  `CRTE_TIME` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `CRTE_OPTINS_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建机构编号',
  `OPTER_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办人ID',
  `OPTER_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办人姓名',
  `OPT_TIME` datetime NULL DEFAULT NULL COMMENT '经办时间',
  `OPTINS_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办机构编号',
  `POOLAREA_NO` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统筹区编号'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fund_analysis_data_dic_a
-- ----------------------------
DROP TABLE IF EXISTS `fund_analysis_data_dic_a`;
CREATE TABLE `fund_analysis_data_dic_a`  (
  `PLACE_DATA_DIC_ID` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '地方数据字典ID',
  `DIC_TYPE_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典类型代码',
  `NAT_DIC_VAL_CODE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '国家字典值代码',
  `NAT_DIC_VAL_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '国家字典值名称',
  `PLACE_DIC_VAL_CODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '地方字典值代码',
  `PLACE_DIC_VAL_NAME` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '地方字典值名称',
  `PRNT_DIC_VAL_CODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '父级字典值代码',
  `ADMDVS` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '医保区划',
  `BEGNDATE` date NOT NULL COMMENT '开始日期',
  `ENDDATE` date NULL DEFAULT NULL COMMENT '结束日期',
  `PINYIN` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '拼音助记码',
  `WUBI` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '五笔助记码',
  `SEQ` int(11) NOT NULL COMMENT '顺序号',
  `MEMO` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `VALI_FLAG` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '有效标志',
  `RID` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据唯一记录号',
  `CRTE_TIME` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `UPDT_TIME` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据更新时间',
  `CRTER_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人ID',
  `CRTER_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人姓名',
  `CRTE_OPTINS_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建机构编号',
  `OPTER_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '经办人ID',
  `OPTER_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '经办人姓名',
  `OPT_TIME` datetime NOT NULL COMMENT '经办时间',
  `OPTINS_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '经办机构编号',
  `VER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '版本号',
  PRIMARY KEY (`PLACE_DATA_DIC_ID`) USING BTREE,
  INDEX `IDX_place_data_dic_a_L_1`(`NAT_DIC_VAL_CODE`) USING BTREE,
  INDEX `IDX_place_data_dic_a_L_2`(`PLACE_DIC_VAL_CODE`) USING BTREE,
  INDEX `IDX_place_data_dic_a_dt`(`UPDT_TIME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '地方数据字典表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fund_analysis_file_d
-- ----------------------------
DROP TABLE IF EXISTS `fund_analysis_file_d`;
CREATE TABLE `fund_analysis_file_d`  (
  `FILE_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文档id',
  `FILE_NAME` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TEM_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `VALI_FLAG` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '有效标志',
  `RCHK_FLAG` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '复核标志',
  `MEMO` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `RID` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据唯一记录号',
  `UPDT_TIME` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据更新时间',
  `CRTER_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `CRTER_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人姓名',
  `CRTE_TIME` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `CRTE_OPTINS_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建机构编号',
  `OPTER_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办人ID',
  `OPTER_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办人姓名',
  `OPT_TIME` datetime NULL DEFAULT NULL COMMENT '经办时间',
  `OPTINS_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办机构编号',
  `POOLAREA_NO` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统筹区编号',
  `DATA_YM` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '期别',
  `FILE_ADDRESS` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件存储地址'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fund_analysis_last_file_d
-- ----------------------------
DROP TABLE IF EXISTS `fund_analysis_last_file_d`;
CREATE TABLE `fund_analysis_last_file_d`  (
  `FILE_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文档id',
  `FILE_NAME` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TEM_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DATA_YM` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '期别',
  `FILE_ADDRESS` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件存储地址',
  `VALI_FLAG` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '有效标志',
  `RCHK_FLAG` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '复核标志',
  `MEMO` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `RID` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据唯一记录号',
  `UPDT_TIME` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据更新时间',
  `CRTER_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `CRTER_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人姓名',
  `CRTE_TIME` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `CRTE_OPTINS_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建机构编号',
  `OPTER_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办人ID',
  `OPTER_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办人姓名',
  `OPT_TIME` datetime NULL DEFAULT NULL COMMENT '经办时间',
  `OPTINS_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办机构编号',
  `POOLAREA_NO` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统筹区编号',
  `LAST_FLAG` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '最终标识'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fund_analysis_module
-- ----------------------------
DROP TABLE IF EXISTS `fund_analysis_module`;
CREATE TABLE `fund_analysis_module`  (
  `VALI_FLAG` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '有效标志',
  `RCHK_FLAG` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '复核标志',
  `MEMO` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `RID` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据唯一记录号',
  `UPDT_TIME` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据更新时间',
  `CRTER_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `CRTER_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人姓名',
  `CRTE_TIME` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `CRTE_OPTINS_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建机构编号',
  `OPTER_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办人ID',
  `OPTER_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办人姓名',
  `OPT_TIME` datetime NULL DEFAULT NULL COMMENT '经办时间',
  `OPTINS_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办机构编号',
  `POOLAREA_NO` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统筹区编号',
  `MODULE_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '组件id',
  `FILE_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文档id',
  `MODULE_TYPE` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件类型',
  `MODULE_SQL` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '组件SQL',
  `MODULE_VALUE` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '组件值（固定值）',
  `MODULE_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件名',
  `PARAMETER_FLAG` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数标识',
  `TEM_ID` varchar(155) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板id'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '组件' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fund_analysis_parameter
-- ----------------------------
DROP TABLE IF EXISTS `fund_analysis_parameter`;
CREATE TABLE `fund_analysis_parameter`  (
  `PARAMETER_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '参数表id',
  `PARAMETER_TYPE` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数类型',
  `PARAMETER_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数名称',
  `PARAMETER_SQL` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '参数对应sql',
  `PARAMETER_VALUE` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数对应值',
  `VALI_FLAG` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '有效标志',
  `MEMO` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `RID` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据唯一记录号',
  `UPDT_TIME` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据更新时间',
  `CRTER_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `CRTER_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人姓名',
  `CRTE_TIME` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `CRTE_OPTINS_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建机构编号',
  `OPTER_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办人ID',
  `OPTER_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办人姓名',
  `OPT_TIME` datetime NULL DEFAULT NULL COMMENT '经办时间',
  `OPTINS_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办机构编号',
  `POOLAREA_NO` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统筹区编号',
  `MODULE_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件id',
  `TEM_ID` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板id',
  PRIMARY KEY (`PARAMETER_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fund_analysis_template
-- ----------------------------
DROP TABLE IF EXISTS `fund_analysis_template`;
CREATE TABLE `fund_analysis_template`  (
  `TEM_ID` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TEM_NAME` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `VALI_FLAG` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '有效标志',
  `MEMO` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `RID` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据唯一记录号',
  `UPDT_TIME` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据更新时间',
  `CRTER_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `CRTER_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人姓名',
  `CRTE_TIME` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `CRTE_OPTINS_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建机构编号',
  `OPTER_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办人ID',
  `OPTER_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办人姓名',
  `OPT_TIME` datetime NULL DEFAULT NULL COMMENT '经办时间',
  `OPTINS_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办机构编号',
  `POOLAREA_NO` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统筹区编号',
  `FDFS_ADDRESS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TEM_TYPE` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板类型',
  PRIMARY KEY (`TEM_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for inhosp_cnt_day
-- ----------------------------
DROP TABLE IF EXISTS `inhosp_cnt_day`;
CREATE TABLE `inhosp_cnt_day`  (
  `partition_id` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `rid` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `stt_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '当前时间',
  `insu_admdvs` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参保地所属行政区划',
  `fixmedins_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定点编号',
  `inhosp_cnt` bigint(20) NULL DEFAULT NULL COMMENT '历史住院人数',
  PRIMARY KEY (`partition_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for insu_emp_info_b
-- ----------------------------
DROP TABLE IF EXISTS `insu_emp_info_b`;
CREATE TABLE `insu_emp_info_b`  (
  `EMP_NO` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '单位编号',
  `EMP_ENTT_CODG` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位实体编码',
  `EMP_MGT_TYPE` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '单位管理类型',
  `PRNT_EMP_NO` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上级单位编号',
  `ASOC_LEGENT_FLAG` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '关联法人标志',
  `EMP_TYPE` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位类型',
  `EMP_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '单位名称',
  `REG_NAME` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册名称',
  `LOC_ADMDVS` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所属医保区划',
  `CONER_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人姓名',
  `CONER_EMAIL` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人电子邮箱',
  `TEL` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `FAX_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '传真号码',
  `TAX_REG_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '税务登记号',
  `ORGCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织机构代码',
  `REGNO` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册号',
  `REGNO_CERT_TYPE` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册号证件类型',
  `EMP_ADDR` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '单位地址',
  `POSCODE` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮政编码',
  `APRV_ESTA_DEPT` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '批准成立部门',
  `APRV_ESTA_DATE` date NULL DEFAULT NULL COMMENT '批准成立日期',
  `APRV_ESTA_DOCNO` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '批准成立文号',
  `PRNT_ADMDVS` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上级医保区划',
  `INSU_ADMDVS` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参保所属医保区划',
  `ORG_VALI_STAS` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织有效状态',
  `LEGREP_TEL` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '法定代表人电话号码',
  `LEGREP_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '法定代表人姓名',
  `LEGREP_CERT_TYPE` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '法定代表人证件类型',
  `LEGREP_CERTNO` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '法定代表人证件号码',
  `ORGCODE_ISSU_EMP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织机构代码证颁发单位',
  `VALI_FLAG` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '有效标志',
  `RID` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据唯一记录号',
  `CRTE_TIME` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `UPDT_TIME` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据更新时间',
  `CRTER_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人ID',
  `CRTER_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人姓名',
  `CRTE_OPTINS_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建机构编号',
  `OPTER_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '经办人ID',
  `OPTER_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '经办人姓名',
  `OPT_TIME` datetime NOT NULL COMMENT '经办时间',
  `OPTINS_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '经办机构编号',
  `POOLAREA_NO` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统筹区编号',
  `VER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '版本号',
  `SYNC_PRNT_FLAG` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '同步上级标志',
  `ENTP_SPEC_FLAG` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业规格标志',
  `MEMO` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `ORG_QUTS_PSNCNT` int(11) NULL DEFAULT NULL COMMENT '机关编制人数'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参保单位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jdbc_datasource
-- ----------------------------
DROP TABLE IF EXISTS `jdbc_datasource`;
CREATE TABLE `jdbc_datasource`  (
  `datasource_id` int(18) NOT NULL DEFAULT 0,
  `url` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `driver_class_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`datasource_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mdtrt_d_day
-- ----------------------------
DROP TABLE IF EXISTS `mdtrt_d_day`;
CREATE TABLE `mdtrt_d_day`  (
  `partition_id` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `rid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `insu_admdvs` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参保地行政区划',
  `begntime` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊开始时间',
  `endtime` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊结束时间',
  `med_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗类别',
  `insutype` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参保险种',
  `hosp_lv` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医院等级',
  `fixmedins_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定点医疗编号',
  `fixmedins_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定点医疗名称',
  `dise_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `dise_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '疾病名称',
  `mdtrt_cnt` bigint(20) NULL DEFAULT NULL COMMENT '就诊人次',
  PRIMARY KEY (`partition_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for medical_bureau_ytai
-- ----------------------------
DROP TABLE IF EXISTS `medical_bureau_ytai`;
CREATE TABLE `medical_bureau_ytai`  (
  `admdvs` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办区',
  `option_name` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位名称',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
  `tel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `lng` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经度',
  `lat` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '纬度',
  `staff_count` int(11) NULL DEFAULT NULL COMMENT '编制人数',
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `poolarea_no` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区划'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '医保局基本信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ods_bffact_vola_rslt_detl_d_df_ytai
-- ----------------------------
DROP TABLE IF EXISTS `ods_bffact_vola_rslt_detl_d_df_ytai`;
CREATE TABLE `ods_bffact_vola_rslt_detl_d_df_ytai`  (
  `vola_rslt_detl_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '违规结果明细id',
  `rid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据唯一记录号',
  `vola_rslt_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '违规结果id',
  `poolarea_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统筹区编号',
  `admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保区划',
  `admdvs_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保区划名称',
  `task_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务id',
  `case_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '案件类型',
  `rule_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则id',
  `patn_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者id',
  `mdtrt_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊id',
  `feedetl_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '费用明细id',
  `setl_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结算id',
  `hilist_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保目录编码',
  `hilist_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保目录名称',
  `hilist_lv` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保目录等级',
  `hilist_dosform` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保目录剂型',
  `fee_ocur_time` datetime NULL DEFAULT NULL COMMENT '费用发生时间',
  `med_chrgitm_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗收费项目类别',
  `cnt` decimal(18, 2) NULL DEFAULT NULL COMMENT '数量',
  `pric` decimal(18, 2) NULL DEFAULT NULL COMMENT '单价',
  `sumamt` decimal(18, 2) NULL DEFAULT NULL COMMENT '总金额',
  `spec` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规格',
  `spec_unt` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规格计量单位',
  `mdtrtsn` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊号',
  `medins_list_codg` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医药机构目录编码',
  `medins_list_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医药机构目录名称',
  `drord_dr_codg` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱医师编码',
  `drord_dr_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱医师姓名',
  `dr_cert_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医师证件类型',
  `drord_dr_idcard` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱医师身份证件',
  `vola_item_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '违规项目类型',
  `vola_amt` decimal(18, 2) NULL DEFAULT NULL COMMENT '违规金额',
  `mch_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机器id',
  `crte_time` datetime NULL DEFAULT NULL COMMENT '数据创建时间',
  `updt_time` datetime NULL DEFAULT NULL COMMENT '数据更新时间',
  `dw_biz_time` datetime NULL DEFAULT NULL COMMENT '业务更新时间',
  `dw_exch_updt_time` datetime NULL DEFAULT NULL COMMENT '数据处理时间',
  PRIMARY KEY (`vola_rslt_detl_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '事前违规结果明细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ods_bffact_warn_rslt_d_df_ytai
-- ----------------------------
DROP TABLE IF EXISTS `ods_bffact_warn_rslt_d_df_ytai`;
CREATE TABLE `ods_bffact_warn_rslt_d_df_ytai`  (
  `warn_rslt_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '提醒结果ID',
  `call_log_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '调用日志ID',
  `mdtrt_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊ID',
  `ipt_otp_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院/门诊号',
  `admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保区划',
  `admdvs_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保区划名称',
  `medins_code` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗机构代码',
  `medins_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗机构名称',
  `medinslv` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗机构等级',
  `medins_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗服务机构类型',
  `psn_no` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员编号',
  `psn_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员姓名',
  `gend` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别',
  `age` int(11) NULL DEFAULT NULL COMMENT '年龄',
  `adm_disediag_codg` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '入院疾病诊断编码',
  `adm_disediag_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '入院疾病诊断名称',
  `dscg_main_disediag_codg` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出院主要疾病诊断编码',
  `dscg_main_disediag_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出院主要疾病诊断名称',
  `dscg_dept_codg` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出院科室编码',
  `dscg_dept_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出院科室名称',
  `dr_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医师代码',
  `dr_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医师姓名',
  `dr_cert_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医师证件类型',
  `dr_idcard` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医师身份证件',
  `mnit_scen` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '监控场景',
  `trig_scen` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '触发场景',
  `med_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗类别',
  `reqt_time` datetime NOT NULL COMMENT '请求时间',
  `rsp_time` datetime NULL DEFAULT NULL COMMENT '响应时间',
  `ana_dura` bigint(20) NULL DEFAULT NULL COMMENT '分析时长',
  `vola_flag` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '违规标志',
  `rule_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则ID',
  `rule_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则代码',
  `rule_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则名称',
  `rule_sev_deg` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则严重程度',
  `rule_warn_lv` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则提醒级别',
  `warn_cont` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '提示内容',
  `rid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据唯一记录号',
  `crte_time` datetime NULL DEFAULT NULL COMMENT '数据创建时间',
  `updt_time` datetime NULL DEFAULT NULL COMMENT '数据更新时间',
  `medfee_sumamt` decimal(18, 2) NULL DEFAULT NULL COMMENT '医疗费总额',
  `vola_amt` decimal(18, 2) NULL DEFAULT NULL COMMENT '违规金额',
  `warn_dspo_way` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预警处理方式',
  `warn_dspo_way_dscr` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '预警处理方式说明',
  `dw_biz_time` datetime NULL DEFAULT NULL COMMENT '业务更新时间',
  `dw_exch_updt_time` datetime NULL DEFAULT NULL COMMENT '数据处理时间',
  PRIMARY KEY (`warn_rslt_id`, `reqt_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '事前提醒结果信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ods_doc_d_df_ytai
-- ----------------------------
DROP TABLE IF EXISTS `ods_doc_d_df_ytai`;
CREATE TABLE `ods_doc_d_df_ytai`  (
  `doc_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单据ID',
  `task_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务ID',
  `rid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据唯一记录号',
  `mdtrtsn` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊号',
  `poolarea_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统筹区编号',
  `poolarea_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统筹区名称',
  `admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保区划',
  `admdvs_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保区划名称',
  `medins_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗机构ID',
  `medins_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗机构名称',
  `medinslv` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗机构等级',
  `medins_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗服务机构类型',
  `patn_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者ID',
  `patn_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `gend` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别',
  `patn_cert_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者证件类型',
  `patn_idcard` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者身份证件',
  `patn_sscno` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者社保卡号',
  `med_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗类别',
  `adm_time` datetime NULL DEFAULT NULL COMMENT '入院时间',
  `dscg_time` datetime NULL DEFAULT NULL COMMENT '出院时间',
  `setl_time` datetime NULL DEFAULT NULL COMMENT '结算时间',
  `adm_disediag_codg` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '入院疾病诊断编码',
  `adm_disediag_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '入院疾病诊断名称',
  `dscg_main_disediag_codg` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出院主要疾病诊断编码',
  `dscg_main_disediag_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出院主要疾病诊断名称',
  `dscg_dept_codg` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出院科室编码',
  `dscg_dept_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出院科室名称',
  `dr_code` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医师代码',
  `dr_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医师姓名',
  `dr_cert_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医师证件类型',
  `dr_idcard` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医师身份证件',
  `medfee_sumamt` decimal(18, 4) NULL DEFAULT NULL COMMENT '医疗费总额',
  `chk_prgs` decimal(18, 4) NULL DEFAULT NULL COMMENT '审核进度',
  `vola_flag` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '违规标志',
  `doc_stas` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单据状态',
  `crt_node_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '当前环节代码',
  `cnfm_vola_amt` decimal(18, 4) NULL DEFAULT NULL COMMENT '确认违规金额',
  `vola_det_amt` decimal(18, 4) NULL DEFAULT NULL COMMENT '违规扣款金额',
  `rvis_amt` decimal(18, 4) NULL DEFAULT NULL COMMENT '补差金额',
  `appl_ddln` datetime NULL DEFAULT NULL COMMENT '申诉期限',
  `inpool_chk_flag` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '进入初审标志',
  `wflw_prcs_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工作流流程ID',
  `wflw_task_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工作流任务ID',
  `serv_matt_inst_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务事项实例ID',
  `serv_matt_node_inst_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务事项环节实例ID',
  `crter_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `crter_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人姓名',
  `crte_time` datetime NULL DEFAULT NULL COMMENT '数据创建时间',
  `crte_optins_no` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建机构编号',
  `opter_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办人ID',
  `opter_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办人姓名',
  `opt_time` datetime NULL DEFAULT NULL COMMENT '经办时间',
  `optins_no` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办机构编号',
  `updt_time` datetime NULL DEFAULT NULL COMMENT '数据更新时间',
  `prcs_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '流程路径',
  `canc_det_flag` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '取消扣款标志',
  `insutype` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '险种类型',
  `finl_chk_amt` decimal(18, 4) NULL DEFAULT NULL COMMENT '最终审核金额',
  `call_setl_flag` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '调用结算标识',
  `issue` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '期号',
  `rfus_bchno` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '拒付汇总批次号',
  `pay_loc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付地点类别',
  `doc_chker` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单据审核人',
  `postpone_stas` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '延期状态 已延期1，未申请2，待审批3',
  `pea_btch_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '延期申请批次号',
  `refrlin_audt_flag` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '转入稽核标志',
  `fix_blng_admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定点归属医保区划',
  `fix_blng_admdvs_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定点归属医保区划名称',
  `call_setl_det_flag` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '调用结算扣款标志',
  `canc_det_rea` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '取消扣款原因',
  `reg_norm_opnn` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '登记正常意见',
  `clr_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '清算类别',
  `insu_admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保区划',
  `insu_admdvs_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保区划名称',
  `chk_ot_flag` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核超时标志',
  `dw_biz_time` datetime NULL DEFAULT NULL COMMENT '业务更新时间',
  `dw_exch_updt_time` datetime NULL DEFAULT NULL COMMENT '数据处理时间',
  INDEX `idx_doc_id`(`doc_id`) USING BTREE,
  INDEX `idx_admdvs`(`admdvs`) USING BTREE,
  INDEX `idx_insutype`(`insu_admdvs`) USING BTREE,
  INDEX `idx_setl_time`(`setl_time`) USING BTREE,
  INDEX `idx_doc_stas`(`doc_stas`) USING BTREE,
  INDEX `idx_combin_admdvs_setltime`(`admdvs`, `setl_time`) USING BTREE,
  INDEX `idx_combin_insutype_setltime`(`insu_admdvs`, `setl_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '就诊信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ods_doc_suspt_d_df_ytai
-- ----------------------------
DROP TABLE IF EXISTS `ods_doc_suspt_d_df_ytai`;
CREATE TABLE `ods_doc_suspt_d_df_ytai`  (
  `doc_suspt_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单据疑点ID',
  `rid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据唯一记录号',
  `doc_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单据ID',
  `task_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务ID',
  `poolarea_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统筹区编号',
  `admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保区划',
  `admdvs_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保区划名称',
  `vola_rslt_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '违规结果ID',
  `vola_bhvr_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '违规行为分类',
  `vola_cont` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '违规内容',
  `vola_dscr` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '违规描述',
  `rule_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则ID',
  `rule_sev_deg` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则严重程度',
  `checkout_time` datetime NULL DEFAULT NULL COMMENT '检出时间',
  `checkout_suspt_amt` decimal(18, 4) NULL DEFAULT NULL COMMENT '检出疑点金额',
  `chk_vola_amt` decimal(18, 4) NULL DEFAULT NULL COMMENT '初审违规金额',
  `cnfm_vola_amt` decimal(18, 4) NULL DEFAULT NULL COMMENT '确认违规金额',
  `vola_det_amt` decimal(18, 4) NULL DEFAULT NULL COMMENT '违规扣款金额',
  `det_rea` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '扣款原因',
  `det_time` datetime NULL DEFAULT NULL COMMENT '扣款时间',
  `det_flag` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '扣款标志',
  `appy_rvis_amt` decimal(18, 4) NULL DEFAULT NULL COMMENT '申请补差金额',
  `pass_rvis_amt` decimal(18, 4) NULL DEFAULT NULL COMMENT '通过补差金额',
  `rvis_amt` decimal(18, 4) NULL DEFAULT NULL COMMENT '补差金额',
  `rvis_time` datetime NULL DEFAULT NULL COMMENT '补差时间',
  `rvis_flag` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '补差标志',
  `chker` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核人',
  `chktime` datetime NULL DEFAULT NULL COMMENT '审核时间',
  `chk_vola_flag` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '初审违规标志',
  `chk_opnn` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '审核意见',
  `chk_vola_qual_codg` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '初审违规定性编码',
  `rchker` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '复审人',
  `rchk_time` datetime NULL DEFAULT NULL COMMENT '复核时间',
  `rchk_vola_flag` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '复审违规标志',
  `rchk_opnn` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '复核意见',
  `rchk_vola_qual_codg` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '复审违规定性编码',
  `appl_flag` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申诉标志',
  `appler` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申诉人',
  `appl_amt` decimal(18, 4) NULL DEFAULT NULL COMMENT '申诉金额',
  `appl_rea` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '申诉理由',
  `appl_matl` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '申诉材料',
  `appl_time` datetime NULL DEFAULT NULL COMMENT '申诉时间',
  `appy_clgl_rea` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '申请合议理由',
  `appy_clgl_matl` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '申请合议材料',
  `appy_clgl_time` datetime NULL DEFAULT NULL COMMENT '申请合议时间',
  `appy_clgl_psn` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请合议人员',
  `clgl_flag` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合议标志',
  `clgl_ccls` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '合议结论',
  `chk_procrslt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '审核处理结果',
  `clgl_matl` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '合议材料',
  `clgl_time` datetime NULL DEFAULT NULL COMMENT '合议时间',
  `suspt_add_way` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '疑点添加方式',
  `supn_suspt_stas` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '监管疑点状态',
  `crter_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `crter_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人姓名',
  `crte_time` datetime NULL DEFAULT NULL COMMENT '数据创建时间',
  `crte_optins_no` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建机构编号',
  `opter_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办人ID',
  `opter_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办人姓名',
  `opt_time` datetime NULL DEFAULT NULL COMMENT '经办时间',
  `optins_no` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办机构编号',
  `updt_time` datetime NULL DEFAULT NULL COMMENT '数据更新时间',
  `finl_chker` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最终审核人',
  `finl_chktime` datetime NULL DEFAULT NULL COMMENT '最终审核时间',
  `finl_chk_vola_flag` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最终审核违规标志',
  `finl_chk_opnn` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '最终审核意见',
  `finl_chk_vola_qual_codg` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最终审核违规定性编码',
  `finl_chk_amt` decimal(18, 4) NULL DEFAULT NULL COMMENT '最终审核金额',
  `finl_chk_matl` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '最终审核材料',
  `appl_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '申诉情况',
  `appl_upld_att_flag` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申诉上传附件标志',
  `chker_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核人姓名',
  `rchker_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '复审人姓名',
  `finl_chker_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最终审核人姓名',
  `appy_clgl_psn_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请合议人员姓名',
  `appler_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申诉人姓名',
  `conv_audits_flag` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '转稽核标志',
  `vola_num` decimal(18, 4) NULL DEFAULT NULL COMMENT '违规倍数',
  `pric` decimal(18, 4) NULL DEFAULT NULL COMMENT '违约金',
  `finl_vola_num` decimal(18, 4) NULL DEFAULT NULL COMMENT '最终违规数量',
  `finl_pric` decimal(18, 4) NULL DEFAULT NULL COMMENT '最终价格',
  `finl_vola_amt` decimal(18, 4) NULL DEFAULT NULL COMMENT '最终违规金额',
  `chk_ot_flag` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核超时标志',
  `dw_biz_time` datetime NULL DEFAULT NULL COMMENT '业务更新时间',
  `dw_exch_updt_time` datetime NULL DEFAULT NULL COMMENT '数据处理时间',
  INDEX `idx_doc_id`(`doc_id`) USING BTREE,
  INDEX `idx_checkout_time`(`checkout_time`) USING BTREE,
  INDEX `idx_vola_amt`(`chk_vola_amt`) USING BTREE,
  INDEX `idx_cfm_vola_amt`(`cnfm_vola_amt`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '单据疑点信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ods_doc_suspt_detl_d_df_ytai
-- ----------------------------
DROP TABLE IF EXISTS `ods_doc_suspt_detl_d_df_ytai`;
CREATE TABLE `ods_doc_suspt_detl_d_df_ytai`  (
  `doc_suspt_detl_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '单据疑点明细ID',
  `rid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据唯一记录号',
  `doc_suspt_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单据疑点ID',
  `doc_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单据ID',
  `task_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务ID',
  `poolarea_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统筹区编号',
  `admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保区划',
  `admdvs_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保区划名称',
  `rel_datatype` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '涉及数据类型',
  `rel_detl_data_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '涉及明细数据ID',
  `cnfm_vola_amt` decimal(18, 2) NULL DEFAULT NULL COMMENT '确认违规金额',
  `vola_det_amt` decimal(18, 2) NULL DEFAULT NULL COMMENT '违规扣款金额',
  `chk_del_flag` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核删除标志',
  `feedetl_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '费用明细ID',
  `setl_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结算ID',
  `hilist_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保目录编码',
  `hilist_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保目录名称',
  `hilist_lv` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保目录等级',
  `med_chrgitm_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗收费项目类别',
  `clr_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '清算类别',
  `hilist_dosform` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保目录剂型',
  `medins_list_codg` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医药机构目录编码',
  `medins_list_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医药机构目录名称',
  `fee_ocur_time` datetime NULL DEFAULT NULL COMMENT '费用发生时间',
  `cnt` decimal(18, 2) NULL DEFAULT NULL COMMENT '数量',
  `pric` decimal(18, 2) NULL DEFAULT NULL COMMENT '单价',
  `sumamt` decimal(18, 2) NULL DEFAULT NULL COMMENT '总金额',
  `spec` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规格',
  `spec_unt` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规格计量单位',
  `drord_dr_codg` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱医师编码',
  `drord_dr_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱医师姓名',
  `mdtrtsn` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊号',
  `crter_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `crter_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人姓名',
  `crte_time` datetime NULL DEFAULT NULL COMMENT '数据创建时间',
  `crte_optins_no` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建机构编号',
  `opter_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办人ID',
  `opter_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办人姓名',
  `opt_time` datetime NULL DEFAULT NULL COMMENT '经办时间',
  `optins_no` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办机构编号',
  `updt_time` datetime NULL DEFAULT NULL COMMENT '数据更新时间',
  `clr_way` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '清算方式',
  `bilg_dept_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开单科室名称',
  `bilg_dept_codg` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开单科室编码',
  `list_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '目录类别',
  `dw_biz_time` datetime NULL DEFAULT NULL COMMENT '业务更新时间',
  `dw_exch_updt_time` datetime NULL DEFAULT NULL COMMENT '数据处理时间',
  PRIMARY KEY (`doc_suspt_detl_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '单据疑点明细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ods_fee_list_d_hilist_name_di_ytai
-- ----------------------------
DROP TABLE IF EXISTS `ods_fee_list_d_hilist_name_di_ytai`;
CREATE TABLE `ods_fee_list_d_hilist_name_di_ytai`  (
  `stt_ym` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '统计年月',
  `insu_admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '医保区划',
  `hilist_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '医保目录名称',
  `psn_cnt` int(11) NULL DEFAULT NULL COMMENT '人次',
  `psn_cnt_distinct` int(11) NULL DEFAULT NULL COMMENT '人数',
  `det_item_fee_sumamt` decimal(18, 2) NULL DEFAULT NULL COMMENT '明细项目费用总额',
  `dw_biz_time` datetime NULL DEFAULT NULL COMMENT '业务时间',
  `dw_exch_updt_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `pk_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据id',
  PRIMARY KEY (`stt_ym`, `insu_admdvs`, `hilist_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '费用明细按项目名称' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ods_intlgsupn_rule_d_df_ytai
-- ----------------------------
DROP TABLE IF EXISTS `ods_intlgsupn_rule_d_df_ytai`;
CREATE TABLE `ods_intlgsupn_rule_d_df_ytai`  (
  `rule_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '规则id',
  `rid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据唯一记录号',
  `rule_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则代码',
  `rule_ver` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则版本号',
  `poolarea_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统筹区编号',
  `admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保区划',
  `admdvs_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保区划名称',
  `prog_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '程序代码',
  `rule_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则名称',
  `rule_defn_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则定义类别',
  `rule_souc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则来源',
  `rule_dscr` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '规则说明',
  `rule_sev_deg` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则严重程度',
  `rule_lv` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则级别',
  `vola_bhvr_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '违规行为分类',
  `vola_evid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '违规依据',
  `mnit_scen` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '监控场景',
  `supn_rule_stas` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '监管规则状态',
  `rls_time` timestamp NULL DEFAULT NULL COMMENT '发布时间',
  `his_ver_flag` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '历史版本标志',
  `prnt_souc_rule_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上级来源规则id',
  `init_souc_rule_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '原始来源规则id',
  `vola_qual_codg` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '违规定性编码',
  `vola_qual_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '违规定性名称',
  `enab_flag` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '启用标志',
  `vali_flag` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '有效标志',
  `memo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `serv_matt_inst_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务事项实例id',
  `serv_matt_node_inst_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务事项环节实例id',
  `evt_inst_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '事件实例id',
  `crter_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人id',
  `crter_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人姓名',
  `crte_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `crte_optins_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建机构编号',
  `opter_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办人id',
  `opter_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办人姓名',
  `opt_time` timestamp NULL DEFAULT NULL COMMENT '经办时间',
  `optins_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办机构编号',
  `updt_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '数据更新时间',
  `trig_scen_scp` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '触发场景范围',
  `locl_rule_flag` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '本地自建规则标志',
  `rule_log_dscr` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '规则逻辑说明',
  `rule_test_dscr` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '规则测试说明',
  `rule_log_matl` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '规则逻辑材料',
  `rule_dscr_matl` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '规则说明材料',
  `rule_majcls` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则大类',
  `app_dscr` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '应用说明',
  `rule_type_lv1` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则一级分类',
  `rule_type_lv2` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则二级分类',
  `rule_task_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则任务类别',
  `rule_defn` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '规则逻辑定义',
  `knolb_rule_tmpl_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '知识库规则模板类型',
  `dw_biz_time` timestamp NULL DEFAULT NULL COMMENT '业务更新时间',
  `dw_exch_updt_time` timestamp NULL DEFAULT NULL COMMENT '数据处理时间',
  PRIMARY KEY (`rule_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '智能监管规则信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ods_metadata_assets_column_mi_ytai
-- ----------------------------
DROP TABLE IF EXISTS `ods_metadata_assets_column_mi_ytai`;
CREATE TABLE `ods_metadata_assets_column_mi_ytai`  (
  `TABNAME` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表名称',
  `FLD` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字段',
  `FLD_TYPE` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字段类型',
  `HERY` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '层级',
  `BIZ_TYPE` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务类型',
  `sharing_flag` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '共享标识 1 共享 0 不共享',
  `UPDT_FRQU` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '流更新频次 1 一次 2 每日 3 每月',
  `dw_biz_time` datetime NULL DEFAULT NULL COMMENT '同步时间',
  `dw_exch_updt_time` datetime NULL DEFAULT NULL COMMENT '数据处理时间',
  `biz_ym` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年月分区'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '业务元数据表字段数据' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ods_metadata_assets_table_mi_ytai
-- ----------------------------
DROP TABLE IF EXISTS `ods_metadata_assets_table_mi_ytai`;
CREATE TABLE `ods_metadata_assets_table_mi_ytai`  (
  `TABNAME` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表名',
  `tab_comment` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表注释',
  `FLD_CNT` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字段数量',
  `STOG_SIZE` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '逻辑存储大小（字节）',
  `virtual_view` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否视图 1 是 0否',
  `CRTE_TIME` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表创建时间',
  `HERY` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '层级',
  `BIZ_TYPE` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务类型',
  `sharing_flag` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '共享标识 1 共享 0 不共享',
  `OUFW` bigint(20) NULL DEFAULT NULL COMMENT '流出1 adb 2 rds 3 all',
  `UPDT_FRQU` bigint(20) NULL DEFAULT NULL COMMENT '更新频次 1 一次 2 每日 3 每月',
  `is_partitioned` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否分区 1 分区 2 不分区',
  `ROW` bigint(20) NULL DEFAULT NULL COMMENT '记录数',
  `dw_biz_time` datetime NULL DEFAULT NULL COMMENT '同步时间',
  `dw_exch_updt_time` datetime NULL DEFAULT NULL COMMENT '数据处理时间',
  `biz_ym` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年月分区',
  `biz_type_a` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务类型一\r\n',
  `biz_type_b` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务类型二'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '业务元数据表数据' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oss_file_uploads
-- ----------------------------
DROP TABLE IF EXISTS `oss_file_uploads`;
CREATE TABLE `oss_file_uploads`  (
  `file_id` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件id',
  `oss_id` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '对象存储id',
  `filetype` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文件类型，数据字典【文件类型filetype】',
  `filename` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文件名称',
  `file_code` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `stog_addr` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '存储地址',
  `biz_type` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '业务类型，数据字典【业务类型biz_type】',
  `rid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '数据唯一记录号',
  `crter_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人id',
  `crter_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人姓名',
  `crte_optins_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建机构编号',
  `crte_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `opter_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办人id',
  `opter_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办人姓名',
  `optins_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办机构编号',
  `updt_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据更新时间',
  `opt_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '经办时间',
  `invd_flag` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT '无效标志，数据字典【无效标志invd_flag】',
  PRIMARY KEY (`file_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '阿里云文件上传oss本地存储记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for otp_bigscreen_test
-- ----------------------------
DROP TABLE IF EXISTS `otp_bigscreen_test`;
CREATE TABLE `otp_bigscreen_test`  (
  `ym` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年月',
  `grep_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员类别',
  `insutype` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '险种类别',
  `insu_admdvs` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参保所属医保区划',
  `hosp_lv` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医院等级',
  `fund_pay_sum` double NULL DEFAULT NULL COMMENT '基金支出',
  `medfee_sum` double NULL DEFAULT NULL COMMENT '医疗总费用',
  `hifp_pay_sum` double NULL DEFAULT NULL COMMENT '基本医疗支出',
  `hifob_pay_sum` double NULL DEFAULT NULL COMMENT '大额医疗支出',
  `cnt_setl` double NULL DEFAULT NULL COMMENT '人次',
  `cnt_psn` double NULL DEFAULT NULL COMMENT '人数',
  `cnt_psn_region` double NULL DEFAULT NULL COMMENT '区划总人数',
  `cnt_psn_city` double NULL DEFAULT NULL COMMENT '全市总人数',
  `fund_pay_per_p` double NULL DEFAULT NULL COMMENT '人均基金支出',
  `percentage` double NULL DEFAULT NULL COMMENT '全口径报销比例'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '门诊统筹大屏测试表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for out_appy_d
-- ----------------------------
DROP TABLE IF EXISTS `out_appy_d`;
CREATE TABLE `out_appy_d`  (
  `TRT_DCLA_DETL_SN` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '待遇申报明细流水号',
  `INSUTYPE` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '险种类型',
  `DCLA_SOUC` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申报来源',
  `PSN_NO` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '人员编号',
  `PSN_INSU_RLTS_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员参保关系ID',
  `PSN_CERT_TYPE` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '人员证件类型',
  `CERTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '证件号码',
  `PSN_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '人员姓名',
  `GEND` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别',
  `NATY` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '民族',
  `BRDY` date NULL DEFAULT NULL COMMENT '出生日期',
  `TEL` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `INSU_ADMDVS` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '参保所属医保区划',
  `EMP_NO` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位编号',
  `EMP_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位名称',
  `RLOC_ADMDVS` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '安置地所属行政区代码',
  `RLOC_COTY_TYPE` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '安置区类型',
  `RLOC_HSORG_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '安置地医保机构名称',
  `RLOC_HSORG_CONER` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '安置地医保机构联系人',
  `RLOC_HSORG_TEL` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '安置地医保机构联系电话',
  `OUT_ONLN_WAY` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '异地联网方式',
  `RLOC_REA` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '异地安置原因',
  `RESOUT_ADDR` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '居外地址',
  `MEMO` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `AGNTER_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代办人姓名',
  `AGNTER_CERT_TYPE` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代办人证件类型',
  `AGNTER_CERTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代办人证件号码',
  `AGNTER_TEL` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代办人联系方式',
  `AGNTER_ADDR` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代办人联系地址',
  `AGNTER_RLTS` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代办人关系',
  `BEGNDATE` date NOT NULL COMMENT '开始日期',
  `ENDDATE` date NULL DEFAULT NULL COMMENT '结束日期',
  `OUT_FIL_UPLD_STAS` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '异地备案上报状态',
  `ATT_CNT` int(11) NULL DEFAULT NULL COMMENT '附件数量',
  `VALI_FLAG` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '有效标志',
  `RID` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据唯一记录号',
  `UPDT_TIME` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据更新时间',
  `CRTER_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `CRTER_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人姓名',
  `CRTE_TIME` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `CRTE_OPTINS_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建机构编号',
  `OPTER_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办人ID',
  `OPTER_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办人姓名',
  `OPT_TIME` datetime NULL DEFAULT NULL COMMENT '经办时间',
  `OPTINS_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办机构编号',
  `POOLAREA_NO` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统筹区编号',
  `TRAFOUT_FIXMEDINS_CODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '转出地定点医药机构编号',
  `TRAFOUT_FIXMEDINS_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '转出地定点医药机构名称',
  `BANKCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行行号',
  `BANK_TYPE_CODE` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行行别代码',
  `BANKACCT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行账号',
  `BANK_SAMECITY_OUT_FLAG` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行同城异地标志',
  `ACCTNAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行卡户名',
  `RETNR_FLAG` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '回退标志',
  `DCLA_TYPE` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RETN_FLAG` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`TRT_DCLA_DETL_SN`) USING BTREE,
  INDEX `IDX_out_appy_dCERTNO`(`CERTNO`) USING BTREE,
  INDEX `idx_out_appy_d_EMP_NO`(`EMP_NO`) USING BTREE,
  INDEX `IDX_OUT_APPY_D_1`(`PSN_NO`) USING BTREE,
  INDEX `idx_out_appy_d_INSUTYPE`(`INSUTYPE`) USING BTREE,
  INDEX `IDX_BEGNDATE`(`BEGNDATE`, `ENDDATE`, `PSN_NO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '异地申请信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for panel
-- ----------------------------
DROP TABLE IF EXISTS `panel`;
CREATE TABLE `panel`  (
  `panel_id` int(11) NOT NULL AUTO_INCREMENT,
  `dashboard_id` int(11) NULL DEFAULT NULL,
  `data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `query_id` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `panel_title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `comt_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `link_receiver` tinyint(1) NULL DEFAULT NULL,
  `link_sender` tinyint(1) NULL DEFAULT NULL,
  `dashboard_title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `updt_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`panel_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 86004437 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for psn_info_b
-- ----------------------------
DROP TABLE IF EXISTS `psn_info_b`;
CREATE TABLE `psn_info_b`  (
  `mob` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `psn_no` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '人员编号',
  `psn_mgtcode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员管理代码',
  `psn_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `alis` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '别名',
  `gend` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别',
  `brdy` date NULL DEFAULT NULL COMMENT '出生日期',
  `file_brdy` date NULL DEFAULT NULL COMMENT '文件出生日期',
  `psn_cert_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '证件类型',
  `certno` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '证件号码',
  `hsecfc` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '户籍所在城市',
  `tel` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电话',
  `naty` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '国籍',
  `nat_regn_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '国家地区代码',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电子邮件',
  `polstas` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '政治面貌',
  `fst_patc_job_date` date NULL DEFAULT NULL COMMENT '首次参加工作日期',
  `resd_natu` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '居住性质',
  `resd_loc_admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '居住地行政区划',
  `hsreg_addr` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '户籍地址',
  `hsreg_addr_poscode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '户籍地址邮编',
  `live_admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '居住地行政区划',
  `live_addr` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '居住地址',
  `live_addr_poscode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '居住地址邮编',
  `resdbook_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '户口本编号',
  `mrg_stas` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '婚姻状况',
  `hlcon` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '健康状况',
  `memo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `surv_stas` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生存状态',
  `mul_prov_mnt_flag` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '多省份维护标志',
  `admdut` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '行政区划',
  `retr_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退休类型',
  `grad_schl` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '毕业学校',
  `educ` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学历',
  `pro_tech_duty_lv` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '专业技术职务级别',
  `nat_prfs_qua_lv` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执业资格级别',
  `vali_flag` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '有效标志',
  `rid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '记录ID',
  `crte_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updt_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `crter_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者ID',
  `crter_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者名称',
  `crte_optins_no` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建选项编号',
  `opter_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作者ID',
  `opter_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作者名称',
  `opt_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `optins_no` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作选项编号',
  `ver` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '版本',
  `cpr_flag` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'CPR标志',
  `poolarea_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '池区域编号',
  `chk_chnl` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查渠道',
  `chk_time` datetime NULL DEFAULT NULL COMMENT '检查时间',
  PRIMARY KEY (`psn_no`, `certno`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '个人基本信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for query
-- ----------------------------
DROP TABLE IF EXISTS `query`;
CREATE TABLE `query`  (
  `query_id` int(11) NOT NULL AUTO_INCREMENT,
  `query_sql` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '固化表查询SQL',
  `datasource_id` int(11) NULL DEFAULT NULL,
  `use_mustache` int(1) NULL DEFAULT 0 COMMENT '此字段无作用',
  `use_spring_bean` int(1) NULL DEFAULT 0 COMMENT '是否使用spring bean进行查询，默认为0，即不使用',
  `spring_bean_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'spring bean的名称',
  `use_stage` int(1) NULL DEFAULT 0,
  `stage_min_interval` int(11) NULL DEFAULT NULL,
  `query_sql_rt` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'adb语句备份\\rds语句备份(原实时查询sql)',
  PRIMARY KEY (`query_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 870500401 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for setl_d_day
-- ----------------------------
DROP TABLE IF EXISTS `setl_d_day`;
CREATE TABLE `setl_d_day`  (
  `partition_id` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '结算ID',
  `rid` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `setl_time` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `setl_hours` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `insu_admdvs` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `med_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `two_dise` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `psn_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `insutype` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fixmedins_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fixmedins_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `dise_no` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `dise_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `setl_cnt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `medfee_sumamt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `hifp_pay` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `cvlserv_pay` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `hifes_pay` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `hifmi_pay` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `hifob_pay` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `hifdm_pay` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `maf_pay` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `othfund_pay` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fund_pay_sumamt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `acct_pay` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `cash_payamt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `crte_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `setl_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `pay_loc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`partition_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for setl_d_realtime_ytai
-- ----------------------------
DROP TABLE IF EXISTS `setl_d_realtime_ytai`;
CREATE TABLE `setl_d_realtime_ytai`  (
  `clr_optins` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '清算经办机构',
  `setl_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结算ID',
  `medins_setl_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗机构结算ID',
  `mdtrt_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊ID',
  `init_setl_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '初始结算ID',
  `psn_no` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员编号',
  `psn_insu_rlts_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员参保关系ID',
  `psn_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `psn_cert_type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '证件类型',
  `certno` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '证件号码',
  `gend` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别',
  `naty` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '民族',
  `brdy` date NULL DEFAULT NULL COMMENT '出生日期',
  `age` decimal(4, 1) NULL DEFAULT NULL COMMENT '年龄',
  `insutype` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '险种类型',
  `psn_type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员类型',
  `cvlserv_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公务员标识',
  `cvlserv_lv` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公务员等级',
  `sp_psn_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '特殊人员类型',
  `sp_psn_type_lv` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '特殊人员等级',
  `clct_grde` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '征缴等级',
  `flxempe_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '灵活就业标志',
  `nwb_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '新生儿标志',
  `insu_admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保区划',
  `emp_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '员工编号',
  `emp_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '员工姓名',
  `emp_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '员工类型',
  `econ_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经济类型',
  `afil_indu` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '隶属行业',
  `afil_rlts` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '隶属关系',
  `emp_mgt_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位管理类型',
  `pay_loc` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付地点类别',
  `fixmedins_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定点医疗机构编码',
  `fixmedins_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定点医疗机构名称',
  `hosp_lv` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医院等级',
  `fix_blng_admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定点归属医保区划',
  `lmtpric_hosp_lv` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '限价医院等级',
  `dedc_hosp_lv` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '起付线医院等级',
  `begndate` date NULL DEFAULT NULL COMMENT '开始日期',
  `enddate` date NULL DEFAULT NULL COMMENT '结束日期',
  `setl_time` datetime NULL DEFAULT NULL COMMENT '结算时间',
  `mdtrt_cert_type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊凭证类型',
  `mdtrt_cert_no` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊凭证号码',
  `med_type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗类型',
  `setl_type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结算类型',
  `clr_type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '清算类型',
  `clr_way` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '清算方式',
  `psn_setlway` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人结算方式',
  `medfee_sumamt` decimal(16, 2) NULL DEFAULT NULL COMMENT '医疗费总额',
  `fulamt_ownpay_amt` decimal(16, 2) NULL DEFAULT NULL COMMENT '全自费金额',
  `overlmt_selfpay` decimal(16, 2) NULL DEFAULT NULL COMMENT '超限自付金额',
  `preselfpay_amt` decimal(16, 2) NULL DEFAULT NULL COMMENT '先行自付金额',
  `inscp_amt` decimal(16, 2) NULL DEFAULT NULL COMMENT '纳入统筹金额',
  `dedc_std` decimal(16, 2) NULL DEFAULT NULL COMMENT '起付标准',
  `crt_dedc` decimal(16, 2) NULL DEFAULT NULL COMMENT '当前起付线',
  `act_pay_dedc` decimal(16, 2) NULL DEFAULT NULL COMMENT '实际支付起付线',
  `hifp_pay` decimal(16, 2) NULL DEFAULT NULL COMMENT '基本医疗保险统筹基金支出',
  `pool_prop_selfpay` decimal(5, 4) NULL DEFAULT NULL COMMENT '统筹支付比例',
  `hi_agre_sumfee` decimal(16, 2) NULL DEFAULT NULL COMMENT '协议管理总费用',
  `cvlserv_pay` decimal(16, 2) NULL DEFAULT NULL COMMENT '公务员医疗补助资金支出',
  `hifes_pay` decimal(16, 2) NULL DEFAULT NULL COMMENT '城乡居民大病保险支出',
  `hifmi_pay` decimal(16, 2) NULL DEFAULT NULL COMMENT '医疗救助基金支出',
  `hifob_pay` decimal(16, 2) NULL DEFAULT NULL COMMENT '工伤保险基金支出',
  `hifdm_pay` decimal(16, 2) NULL DEFAULT NULL COMMENT '生育保险基金支出',
  `maf_pay` decimal(16, 2) NULL DEFAULT NULL COMMENT '民政救助基金支出',
  `othfund_pay` decimal(16, 2) NULL DEFAULT NULL COMMENT '其他基金支出',
  `fund_pay_sumamt` decimal(16, 2) NULL DEFAULT NULL COMMENT '基金支付总额',
  `psn_pay` decimal(16, 2) NULL DEFAULT NULL COMMENT '个人支付金额',
  `acct_pay` decimal(16, 2) NULL DEFAULT NULL COMMENT '账户支付金额',
  `cash_payamt` decimal(16, 2) NULL DEFAULT NULL COMMENT '现金支付金额',
  `ownpay_hosp_part` decimal(16, 2) NULL DEFAULT NULL COMMENT '医院承担部分',
  `balc` decimal(16, 2) NULL DEFAULT NULL COMMENT '账户余额',
  `acct_mulaid_pay` decimal(16, 2) NULL DEFAULT NULL COMMENT '账户共济支付金额',
  `refd_setl_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退费结算标志',
  `cal_ipt_cnt` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '计算住院天数',
  `setl_cashpay_way` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结算现金支付方式',
  `year` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年份',
  `dise_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '疾病编码',
  `dise_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '疾病名称',
  `invono` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发票号',
  `manl_reim_rea` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手工报销原因',
  `vali_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '有效性标志',
  `memo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `rid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据唯一记录号',
  `updt_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `crter_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `crter_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人姓名',
  `crte_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `crte_optins_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建机构编号',
  `opter_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作人ID',
  `opter_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作人姓名',
  `opt_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `optins_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作机构编号',
  `poolarea_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统筹区编号',
  `mid_setl_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '中途结算标志',
  `acct_used_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '账户使用标志',
  `quts_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退出类型',
  `bydise_setl_payamt` decimal(16, 2) NULL DEFAULT NULL COMMENT '病种结算支付金额',
  `exct_item_fund_payamt` decimal(16, 2) NULL DEFAULT NULL COMMENT '执行项目基金支付金额',
  `biz_date` datetime NOT NULL COMMENT '业务日期',
  `deleted_time` datetime NULL DEFAULT NULL COMMENT '删除时间',
  `deleted` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否删除',
  `exch_updt_time` datetime NULL DEFAULT NULL COMMENT '交换更新时间',
  `subsys_codg` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '子系统代码',
  `admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保区划',
  PRIMARY KEY (`rid`, `biz_date`, `subsys_codg`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '实时结算信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stg_drds_fee_list_d_fb_df_ytai
-- ----------------------------
DROP TABLE IF EXISTS `stg_drds_fee_list_d_fb_df_ytai`;
CREATE TABLE `stg_drds_fee_list_d_fb_df_ytai`  (
  `fee_ocur_time` datetime NULL DEFAULT NULL COMMENT '费用发生时间',
  `mdtrt_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '就诊ID',
  `setl_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '结算ID',
  `bkkp_sn` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '记账流水号',
  `rx_drord_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '处方/医嘱号',
  `fixmedins_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '定点医药机构编号',
  `fixmedins_name` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '定点医药机构名称',
  `psn_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '人员编号',
  `psn_insu_rlts_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '人员参保关系ID',
  `insu_admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '参保所属医保区划',
  `pay_loc` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '支付地点类别',
  `med_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '医疗类别',
  `cnt` double NULL DEFAULT NULL COMMENT '数量',
  `pric` double NULL DEFAULT NULL COMMENT '单价',
  `det_item_fee_sumamt` double NULL DEFAULT NULL COMMENT '明细项目费用总额',
  `pric_uplmt_amt` double NULL DEFAULT NULL COMMENT '定价上限金额',
  `selfpay_prop` double NULL DEFAULT NULL COMMENT '自付比例',
  `fulamt_ownpay_amt` double NULL DEFAULT NULL COMMENT '全自费金额',
  `overlmt_selfpay` double NULL DEFAULT NULL COMMENT '超限价自费费用',
  `preselfpay_amt` double NULL DEFAULT NULL COMMENT '先行自付金额',
  `inscp_amt` double NULL DEFAULT NULL COMMENT '符合范围金额',
  `cvlserv_bedfee_amt` double NULL DEFAULT NULL COMMENT '公务员床位费金额',
  `medins_disc_amt` double NULL DEFAULT NULL COMMENT '医院减免金额',
  `chrgitm_lv` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '收费项目等级',
  `hilist_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '医保目录编码',
  `hilist_name` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '医保目录名称',
  `list_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '目录类别',
  `med_list_codg` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '医疗目录编码',
  `medins_list_codg` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '医药机构目录编码',
  `medins_list_name` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '医药机构目录名称',
  `med_chrgitm_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '医疗收费项目类别',
  `prodname` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '商品名',
  `spec` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '规格',
  `dosform_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '剂型名称',
  `bilg_dept_codg` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '开单科室编码',
  `bilg_dept_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '开单科室名称',
  `bilg_dr_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '开单医师代码',
  `bilg_dr_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '开单医师姓名',
  `acord_dept_codg` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '受单科室编码',
  `acord_dept_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '受单科室名称',
  `acord_dr_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '受单医师代码',
  `acord_dr_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '受单医师姓名',
  `lmt_used_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '限制使用标志',
  `hosp_prep_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '医院制剂标志',
  `hosp_appr_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '医院审批标志',
  `tcmdrug_used_way` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '中药使用方式',
  `prodplac_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '生产地类别',
  `bas_medn_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '基本药物标志',
  `hi_nego_drug_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '医保谈判药品标志',
  `prcu_drug_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '贵重药品标志',
  `chld_medc_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '儿童用药标志',
  `etip_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '外检标志',
  `etip_hosp_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '外检医院编码',
  `dscg_tkdrug_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '出院带药标志',
  `list_sp_item_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '目录特项标志',
  `matn_fee_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '生育费用标志',
  `drt_reim_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '直报标志',
  `reim_prop` double NULL DEFAULT NULL COMMENT '报销比例',
  `oprn_oprt_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手术操作代码',
  `sin_dos_dscr` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '单次剂量描述',
  `used_frqu_dscr` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '使用频次描述',
  `prd_days` double NULL DEFAULT NULL COMMENT '周期天数',
  `medc_way_dscr` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用药途径描述',
  `memo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `vali_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '有效标志',
  `rid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '数据唯一记录号',
  `updt_time` datetime NULL DEFAULT NULL COMMENT '数据更新时间',
  `crter_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `crter_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人姓名',
  `crte_time` datetime NULL DEFAULT NULL COMMENT '数据创建时间',
  `crte_optins_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建机构编号',
  `opter_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '经办人ID',
  `opter_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '经办人姓名',
  `opt_time` datetime NULL DEFAULT NULL COMMENT '经办时间',
  `optins_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '经办机构编号',
  `poolarea_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '统筹区编号',
  `rx_circ_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '处方流转标志',
  `dise_codg` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '病种编码',
  `chrg_bchno` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '收费批次号',
  `init_feedetl_sn` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '原费用明细流水号',
  `biz_date` datetime NULL DEFAULT NULL COMMENT '业务日期',
  `deleted_time` datetime NULL DEFAULT NULL COMMENT '数据删除时间',
  `deleted` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '数据删除状态',
  `exch_updt_time` datetime NULL DEFAULT NULL COMMENT '交换库更新时间',
  `subsys_codg` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '子系统代码',
  `admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '医保区划',
  `comb_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '组套编号',
  `errtype` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '错误类型',
  `pch` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '执行批次号'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '费用明细表非标明细' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stg_drds_fee_list_d_fb_yd_df_ytai
-- ----------------------------
DROP TABLE IF EXISTS `stg_drds_fee_list_d_fb_yd_df_ytai`;
CREATE TABLE `stg_drds_fee_list_d_fb_yd_df_ytai`  (
  `fee_ocur_time` datetime NULL DEFAULT NULL COMMENT '费用发生时间',
  `mdtrt_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '就诊ID',
  `setl_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '结算ID',
  `bkkp_sn` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '记账流水号',
  `rx_drord_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '处方/医嘱编号',
  `fixmedins_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '定点医疗机构编码',
  `fixmedins_name` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '定点医疗机构名称',
  `psn_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '人员编号',
  `psn_insu_rlts_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '人员参保关系ID',
  `insu_admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '参保行政区划',
  `pay_loc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '支付地点',
  `med_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '医疗类型',
  `cnt` double NULL DEFAULT NULL COMMENT '数量',
  `pric` double NULL DEFAULT NULL COMMENT '单价',
  `det_item_fee_sumamt` double NULL DEFAULT NULL COMMENT '明细项目费用总额',
  `pric_uplmt_amt` double NULL DEFAULT NULL COMMENT '价格上限金额',
  `selfpay_prop` double NULL DEFAULT NULL COMMENT '自付比例',
  `fulamt_ownpay_amt` double NULL DEFAULT NULL COMMENT '全额自费金额',
  `overlmt_selfpay` double NULL DEFAULT NULL COMMENT '超限自付金额',
  `preselfpay_amt` double NULL DEFAULT NULL COMMENT '预自付金额',
  `inscp_amt` double NULL DEFAULT NULL COMMENT '纳入报销金额',
  `cvlserv_bedfee_amt` double NULL DEFAULT NULL COMMENT '公务员床位费补差金额',
  `medins_disc_amt` double NULL DEFAULT NULL COMMENT '医疗机构折扣金额',
  `chrgitm_lv` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '收费项目等级',
  `hilist_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '医保目录编码',
  `hilist_name` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '医保目录名称',
  `list_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '目录类型',
  `med_list_codg` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '医疗目录编码',
  `medins_list_codg` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '医疗机构目录编码',
  `medins_list_name` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '医疗机构目录名称',
  `med_chrgitm_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '医疗收费项目类型',
  `prodname` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '药品名称',
  `spec` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '规格',
  `dosform_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '剂型名称',
  `bilg_dept_codg` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '开单科室编码',
  `bilg_dept_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '开单科室名称',
  `bilg_dr_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '开单医生编码',
  `bilg_dr_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '开单医生姓名',
  `acord_dept_codg` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '执行科室编码',
  `acord_dept_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '执行科室名称',
  `acord_dr_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '执行医生编码',
  `acord_dr_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '执行医生姓名',
  `lmt_used_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '限用标志',
  `hosp_prep_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '医院预审标志',
  `hosp_appr_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '医院审批标志',
  `tcmdrug_used_way` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '中药饮片使用方式',
  `prodplac_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '产地类型',
  `bas_medn_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '基本药物标志',
  `hi_nego_drug_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '高价谈判药品标志',
  `prcu_drug_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '采购药品标志',
  `chld_medc_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '儿童用药标志',
  `etip_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '外检标志',
  `etip_hosp_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '外检医院编码',
  `dscg_tkdrug_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '出院带药标志',
  `list_sp_item_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '目录特需项目标志',
  `matn_fee_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '孕产费用标志',
  `drt_reim_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '定向报销标志',
  `reim_prop` double NULL DEFAULT NULL COMMENT '报销比例',
  `oprn_oprt_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手术操作编码',
  `sin_dos_dscr` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '单次剂量描述',
  `used_frqu_dscr` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '使用频率描述',
  `prd_days` double NULL DEFAULT NULL COMMENT '周期天数',
  `medc_way_dscr` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '给药方式描述',
  `memo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `vali_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '有效标志',
  `rid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '唯一标识',
  `updt_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `crter_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `crter_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人姓名',
  `crte_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `crte_optins_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建机构编号',
  `opter_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作人ID',
  `opter_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作人姓名',
  `opt_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `optins_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作机构编号',
  `poolarea_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '统筹区编号',
  `biz_date` datetime NULL DEFAULT NULL COMMENT '业务日期',
  `deleted_time` datetime NULL DEFAULT NULL COMMENT '删除时间',
  `deleted` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '是否已删除',
  `exch_updt_time` datetime NULL DEFAULT NULL COMMENT '交换更新时间',
  `subsys_codg` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '子系统编码',
  `admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '行政区划代码',
  `rx_circ_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '处方流转标志',
  `chrg_bchno` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '收费批次号',
  `init_feedetl_sn` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '初始费用明细流水号',
  `dise_codg` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '疾病编码',
  `ny` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '年月',
  `errtype` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '错误类型',
  `pch` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '批次'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stg_drds_mdtrt_d_fb_df_ytai
-- ----------------------------
DROP TABLE IF EXISTS `stg_drds_mdtrt_d_fb_df_ytai`;
CREATE TABLE `stg_drds_mdtrt_d_fb_df_ytai`  (
  `mdtrt_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '就诊ID',
  `medins_setl_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '医药机构结算ID',
  `psn_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '人员编号',
  `psn_insu_rlts_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '人员参保关系ID',
  `psn_cert_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '人员证件类型',
  `certno` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '证件号码',
  `psn_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '人员姓名',
  `gend` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '性别',
  `naty` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '民族',
  `brdy` datetime NULL DEFAULT NULL COMMENT '出生日期',
  `age` double NULL DEFAULT NULL COMMENT '年龄',
  `coner_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '联系人姓名',
  `tel` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '联系电话',
  `addr` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '联系地址',
  `insutype` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '险种类型',
  `psn_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '人员类别',
  `cvlserv_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '公务员标志',
  `cvlserv_lv` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '公务员等级',
  `sp_psn_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '特殊人员类型',
  `sp_psn_type_lv` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '特殊人员类型等级',
  `clct_grde` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '缴费档次',
  `flxempe_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '灵活就业标志',
  `nwb_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '新生儿标志',
  `insu_admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '参保所属医保区划',
  `emp_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '单位编号',
  `emp_name` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '单位名称',
  `emp_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '单位类型',
  `econ_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '经济类型',
  `afil_indu` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '所属行业',
  `afil_rlts` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '隶属关系',
  `emp_mgt_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '单位管理类型',
  `pay_loc` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '支付地点类别',
  `fixmedins_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '定点医药机构编号',
  `fixmedins_name` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '定点医药机构名称',
  `hosp_lv` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '医院等级',
  `fix_blng_admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '定点归属医保区划',
  `lmtpric_hosp_lv` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '限价医院等级',
  `dedc_hosp_lv` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '起付线医院等级',
  `begntime` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `endtime` datetime NULL DEFAULT NULL COMMENT '结束时间',
  `mdtrt_cert_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '就诊凭证类型',
  `mdtrt_cert_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '就诊凭证编号',
  `med_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '医疗类别',
  `rloc_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '异地安置类别',
  `ars_year_ipt_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '跨年度住院标志',
  `pre_pay_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '先行支付标志',
  `year` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '年度',
  `refl_old_mdtrt_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '转诊前就诊ID',
  `ipt_otp_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '住院/门诊号',
  `medrcdno` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '病历号',
  `chfpdr_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '主诊医师代码',
  `adm_diag_dscr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '入院诊断描述',
  `adm_dept_codg` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '入院科室编码',
  `adm_dept_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '入院科室名称',
  `adm_bed` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '入院床位',
  `wardarea_bed` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '病区床位',
  `traf_dept_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '转科室标志',
  `dscg_maindiag_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '住院主诊断代码',
  `dscg_dept_codg` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '出院科室编码',
  `dscg_dept_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '出院科室名称',
  `dscg_bed` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '出院床位',
  `dscg_way` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '离院方式',
  `main_cond_dscr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '主要病情描述',
  `dise_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '病种编号',
  `dise_name` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '病种名称',
  `oprn_oprt_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手术操作代码',
  `oprn_oprt_name` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手术操作名称',
  `otp_diag_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '门诊诊断信息',
  `inhosp_stas` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '在院状态',
  `die_date` datetime NULL DEFAULT NULL COMMENT '死亡日期',
  `ipt_days` double NULL DEFAULT NULL COMMENT '住院天数',
  `geso_val` double NULL DEFAULT NULL COMMENT '孕周数',
  `birctrl_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '计划生育手术类别',
  `fetts` double NULL DEFAULT NULL COMMENT '胎次',
  `fetus_cnt` double NULL DEFAULT NULL COMMENT '胎儿数',
  `matn_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '生育类别',
  `prey_time` datetime NULL DEFAULT NULL COMMENT '妊娠时间',
  `latechb_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '晚育标志',
  `pret_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '早产标志',
  `fpsc_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '计划生育服务证号',
  `birctrl_matn_date` datetime NULL DEFAULT NULL COMMENT '计划生育手术或生育日期',
  `cop_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '伴有并发症标志',
  `trt_dcla_detl_sn` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '待遇申报明细流水号',
  `vali_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '有效标志',
  `memo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `rid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '数据唯一记录号',
  `updt_time` datetime NULL DEFAULT NULL COMMENT '数据更新时间',
  `crter_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `crter_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人姓名',
  `crte_time` datetime NULL DEFAULT NULL COMMENT '数据创建时间',
  `crte_optins_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建机构编号',
  `opter_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '经办人ID',
  `opter_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '经办人姓名',
  `opt_time` datetime NULL DEFAULT NULL COMMENT '经办时间',
  `optins_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '经办机构编号',
  `poolarea_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '统筹区编号',
  `chfpdr_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '主诊医师姓名',
  `dscg_maindiag_name` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '住院主诊断名称',
  `adm_caty` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '入院科别',
  `dscg_caty` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '出院科别',
  `ttp_pay_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '第三方赔付标志',
  `ttp_pay_prop` double NULL DEFAULT NULL COMMENT '第三方赔付比例',
  `dise_type_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '病种类型代码',
  `same_dise_adm_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '同病种入院标志',
  `quts_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '编制类型',
  `biz_date` datetime NULL DEFAULT NULL COMMENT '业务日期',
  `deleted_time` datetime NULL DEFAULT NULL COMMENT '数据删除时间',
  `deleted` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '数据删除状态',
  `exch_updt_time` datetime NULL DEFAULT NULL COMMENT '交换库更新时间',
  `subsys_codg` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '子系统代码',
  `admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '医保区划',
  `errtype` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '错误类型',
  `pch` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '执行批次号'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '就诊信息表非标明细' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stg_drds_opsp_reg_fb_sd_df_ytai
-- ----------------------------
DROP TABLE IF EXISTS `stg_drds_opsp_reg_fb_sd_df_ytai`;
CREATE TABLE `stg_drds_opsp_reg_fb_sd_df_ytai`  (
  `trt_dcla_detl_sn` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '待遇申报明细流水号',
  `dcla_souc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '申报来源',
  `insutype` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '险种类型',
  `psn_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '人员编号',
  `psn_insu_rlts_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '人员参保关系ID',
  `dise_type_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '病种类型代码',
  `opsp_dise_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '门慢门特病种目录代码',
  `opsp_dise_name` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '门慢门特病种名称',
  `psn_cert_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '人员证件类型',
  `certno` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '证件号码',
  `psn_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '人员姓名',
  `gend` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '性别',
  `naty` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '民族',
  `brdy` datetime NULL DEFAULT NULL COMMENT '出生日期',
  `tel` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '联系电话',
  `addr` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '联系地址',
  `insu_admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '参保所属医保区划',
  `emp_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '单位编号',
  `emp_name` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '单位名称',
  `ide_fixmedins_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '鉴定定点医药机构编号',
  `ide_fixmedins_name` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '鉴定定点医药机构名称',
  `hosp_ide_date` datetime NULL DEFAULT NULL COMMENT '医院鉴定日期',
  `diag_dr_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '诊断医师代码',
  `diag_dr_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '诊断医师姓名',
  `apply_date` datetime NULL DEFAULT NULL COMMENT '申请日期',
  `apply_rea` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '申请理由',
  `agnter_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '代办人姓名',
  `agnter_cert_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '代办人证件类型',
  `agnter_certno` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '代办人证件号码',
  `agnter_tel` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '代办人联系方式',
  `agnter_addr` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '代办人联系地址',
  `agnter_rlts` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '代办人关系',
  `begndate` datetime NULL DEFAULT NULL COMMENT '开始日期',
  `enddate` datetime NULL DEFAULT NULL COMMENT '结束日期',
  `vali_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '有效标志',
  `memo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `rid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '数据唯一记录号',
  `updt_time` datetime NULL DEFAULT NULL COMMENT '数据更新时间',
  `crter_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `crter_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人姓名',
  `crte_time` datetime NULL DEFAULT NULL COMMENT '数据创建时间',
  `crte_optins_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建机构编号',
  `opter_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '经办人ID',
  `opter_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '经办人姓名',
  `opt_time` datetime NULL DEFAULT NULL COMMENT '经办时间',
  `optins_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '经办机构编号',
  `poolarea_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '统筹区编号',
  `biz_date` datetime NULL DEFAULT NULL COMMENT '业务日期',
  `deleted_time` datetime NULL DEFAULT NULL COMMENT '数据删除时间',
  `deleted` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '数据删除状态',
  `exch_updt_time` datetime NULL DEFAULT NULL COMMENT '交换库更新时间',
  `subsys_codg` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '子系统代码',
  `admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '医保区划',
  `selfdef_splm_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '自定义补充标志',
  `errtype` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '错误类型',
  `pch` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '执行批次号'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '门慢门特登记信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stg_drg_fixmedins_list_mf_ytai
-- ----------------------------
DROP TABLE IF EXISTS `stg_drg_fixmedins_list_mf_ytai`;
CREATE TABLE `stg_drg_fixmedins_list_mf_ytai`  (
  `fixmedins_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fixmedins_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fixmedins_code_locl` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fixmedins_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  INDEX `idx_stg_drg_fixmedins`(`fixmedins_code_locl`, `fixmedins_type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stg_drg_wt_kpi_detl_mf_ytai
-- ----------------------------
DROP TABLE IF EXISTS `stg_drg_wt_kpi_detl_mf_ytai`;
CREATE TABLE `stg_drg_wt_kpi_detl_mf_ytai`  (
  `drg_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `drg_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `wt` decimal(16, 4) NULL DEFAULT NULL,
  `wt_lv3` decimal(16, 4) NULL DEFAULT NULL,
  `wt_lv2_a` decimal(16, 4) NULL DEFAULT NULL,
  `wt_lv2_b` decimal(16, 4) NULL DEFAULT NULL,
  `wt_lv1` decimal(16, 4) NULL DEFAULT NULL,
  INDEX `idx_stg_drg_wt_kpi`(`drg_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stg_drg_zywt_kpi_detl_mf_ytai
-- ----------------------------
DROP TABLE IF EXISTS `stg_drg_zywt_kpi_detl_mf_ytai`;
CREATE TABLE `stg_drg_zywt_kpi_detl_mf_ytai`  (
  `drg_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `drg_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `wt` decimal(16, 4) NULL DEFAULT NULL,
  `wt_totl` decimal(16, 4) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stg_fixmedins_b_df_ytai
-- ----------------------------
DROP TABLE IF EXISTS `stg_fixmedins_b_df_ytai`;
CREATE TABLE `stg_fixmedins_b_df_ytai`  (
  `fixmedins_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定点医疗服务机构类型',
  `fixmedins_code` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '定点医药机构编号',
  `medins_mgtcode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医药机构管理码',
  `uscc` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统一社会信用代码',
  `orgcode` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织机构代码',
  `fix_blng_admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定点归属医保区划',
  `fixmedins_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定点医药机构名称',
  `hosp_lv` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医院等级',
  `lmtpric_hosp_lv` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '限价医院等级',
  `dedc_hosp_lv` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '起付线医院等级',
  `begntime` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `endtime` datetime NULL DEFAULT NULL COMMENT '结束时间',
  `hi_resper_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保办负责人姓名',
  `hi_resper_tel` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保办负责人联系电话',
  `hi_resper_cert_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保办负责人证件类型',
  `hi_resper_certno` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保办负责人证件号码',
  `out_fixmedins_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '异地医药机构类型',
  `fix_onln_open_flag` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定点联网开通标志',
  `out_onln_open_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '异地联网开通类型',
  `nat_plaf_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '国家异地平台机构编号',
  `prov_plaf_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省内异地平台机构编号',
  `vali_flag` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '有效标志',
  `memo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `rid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据唯一记录号',
  `updt_time` datetime NULL DEFAULT NULL COMMENT '数据更新时间',
  `crter_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `crter_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人姓名',
  `crte_time` datetime NULL DEFAULT NULL COMMENT '数据创建时间',
  `crte_optins_no` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建机构编号',
  `opter_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办人ID',
  `opter_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办人姓名',
  `opt_time` datetime NULL DEFAULT NULL COMMENT '经办时间',
  `optins_no` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办机构编号',
  `poolarea_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统筹区编号',
  PRIMARY KEY (`rid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定点医药机构业务信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stg_grassroots_site_mf_ytai
-- ----------------------------
DROP TABLE IF EXISTS `stg_grassroots_site_mf_ytai`;
CREATE TABLE `stg_grassroots_site_mf_ytai`  (
  `site_code` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `site_name` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `parent_site_code` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `parent_site_name` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `site_type` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_public` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `valid_flag` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `optins_no` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `opter_sys_name` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `uscc` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `medical_type` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `hosp_lv` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `school_type` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `address` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `longitude` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `latitude` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `contact_id_number` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `contact_name` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `contact_phone` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `open_hours` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `poolarea_no` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `poolarea` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '医保服务站' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stg_grassroots_site_mf_ytai_copy1
-- ----------------------------
DROP TABLE IF EXISTS `stg_grassroots_site_mf_ytai_copy1`;
CREATE TABLE `stg_grassroots_site_mf_ytai_copy1`  (
  `site_code` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `site_name` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `parent_site_code` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `parent_site_name` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `site_type` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_public` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `valid_flag` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `optins_no` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `opter_sys_name` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `uscc` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `medical_type` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `hosp_lv` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `school_type` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `address` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `longitude` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `latitude` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `contact_id_number` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `contact_name` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `contact_phone` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `open_hours` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `poolarea_no` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `poolarea` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '医保服务站' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stg_longterm_eval_task_c_df_ytai
-- ----------------------------
DROP TABLE IF EXISTS `stg_longterm_eval_task_c_df_ytai`;
CREATE TABLE `stg_longterm_eval_task_c_df_ytai`  (
  `longterm_eval_task_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '长期护理评估任务ID',
  `longterm_eval_plan_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '长期护理评估计划ID',
  `longterm_trt_appy_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '长期护理待遇申请id',
  `eval_task_stas` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评估任务状态',
  `eval_org_no` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评估机构编号',
  `eval_org_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评估机构名称',
  `psn_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员姓名',
  `psn_no` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员编号',
  `cert_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '证件类型',
  `certno` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '证件号码',
  `insu_admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参保所属医保区划',
  `gend` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别',
  `brdy` datetime NULL DEFAULT NULL COMMENT '出生日期',
  `eval_addr` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评估地址',
  `prov_codg` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省编码',
  `city_codg` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '市编码',
  `coty_codg` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区县编码',
  `longterm_eval_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '长期护理评估类型',
  `task_asgn_time` datetime NULL DEFAULT NULL COMMENT '任务分派时间',
  `longterm_eval_way` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '长期护理评估方式',
  `nurscare_way` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '护理方式',
  `eval_time` datetime NULL DEFAULT NULL COMMENT '评估时间',
  `longterm_eval_sco` decimal(18, 2) NULL DEFAULT NULL COMMENT '长期护理评估分数',
  `longterm_eval_lv` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '长期护理评估等级',
  `eval_ccls` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评估结论',
  `longterm_eval_rslt` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '长期护理评估结果',
  `chk_time` datetime NULL DEFAULT NULL COMMENT '审核日期',
  `team_rew_lv` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集体评审等级',
  `team_rew_ccls` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集体评审结论',
  `team_rew_date` datetime NULL DEFAULT NULL COMMENT '集体评审日期',
  `team_rew_time_sec_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集体评审时间段类别',
  `finl_rslt` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最终结果',
  `video_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '视频编号',
  `scale_ansr_rslt_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '量表答案结果ID',
  `pub_begndate` datetime NULL DEFAULT NULL COMMENT '公示开始日期',
  `pub_enddate` datetime NULL DEFAULT NULL COMMENT '公示结束日期',
  `delv_date` datetime NULL DEFAULT NULL COMMENT '送达日期',
  `delv_way` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '送达方式',
  `insutype` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '险种类型',
  `coninfo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  `task_rec_time` datetime NULL DEFAULT NULL COMMENT '任务接收时间',
  `lnt` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经度',
  `lat` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '纬度',
  `asst_dev_flag` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '需要辅具标志',
  `agn_eval_rea` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '再次评估原因',
  `agn_eval_rea_dscr` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '再次评估原因描述',
  `asst_eval_psn` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '协助评估人员',
  `task_sbmt_souc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务提交来源',
  `eval_ccls_vali_enddate` datetime NULL DEFAULT NULL COMMENT '评估结论有效截止日期',
  `longterm_nurscare_req_lv` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '照护需求等级',
  `med_nurscare_req_flag` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗护理需求标志',
  `eval_biz_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评估业务类型',
  `appy_org_no` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请机构编号',
  `appy_org_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请机构名称',
  `rid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据唯一记录号',
  `crte_time` datetime NULL DEFAULT NULL COMMENT '数据创建时间',
  `updt_time` datetime NULL DEFAULT NULL COMMENT '数据更新时间',
  `crter_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `crter_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人姓名',
  `crte_optins_no` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建机构编号',
  `opter_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办人ID',
  `opter_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办人姓名',
  `opt_time` datetime NULL DEFAULT NULL COMMENT '经办时间',
  `optins_no` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办机构编号',
  `admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保区划',
  `vali_flag` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '有效标志',
  `data_ver` decimal(18, 2) NULL DEFAULT NULL COMMENT '数据版本号',
  `opt_dot_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办网点ID',
  `eval_expi_rea` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评估终止原因',
  `eval_ccls_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评估结论编号',
  `data_souc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据来源',
  `retreat_rea` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评估退回原因',
  `eval_nurscare_way` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '可申请护理方式',
  `rslt_prt_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结论打印号',
  PRIMARY KEY (`rid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '长期护理评估任务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stg_longterm_reg_d_df_ytai
-- ----------------------------
DROP TABLE IF EXISTS `stg_longterm_reg_d_df_ytai`;
CREATE TABLE `stg_longterm_reg_d_df_ytai`  (
  `longterm_reg_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '长期护理登记id',
  `longterm_trt_appy_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '长期护理待遇申请id',
  `longterm_eval_task_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '长期护理评估任务id',
  `psn_no` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员编号',
  `insu_admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参保所属医保区划',
  `psn_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员姓名',
  `gend` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别',
  `cert_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '证件类型',
  `certno` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '证件号码',
  `brdy` datetime NULL DEFAULT NULL COMMENT '出生日期',
  `insutype` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '险种类型',
  `longterm_eval_lv` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '长期护理评估等级',
  `fix_blng_admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定点归属医保区划',
  `nurscare_org_no` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '护理机构编号',
  `nurscare_org_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '护理机构名称',
  `sup_medstff_no` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主管护理员编号',
  `sup_medstff_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主管护理员姓名',
  `rels_nurscare_flag` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '亲属护理标志',
  `nurscare_way` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '护理方式',
  `trt_flag` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '享受待遇标志',
  `asst_dev_flag` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '需要辅具标志',
  `begntime` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `exit_time` datetime NULL DEFAULT NULL COMMENT '退出时间',
  `trt_exit_rea` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '待遇退出原因',
  `trt_exit_dscr` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '待遇退出描述',
  `disecode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '疾病编码',
  `disename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '疾病名称',
  `dept_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室名称',
  `nurscare_regn` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '护理区',
  `bedno` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病床号',
  `year` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年度',
  `bank_type_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行行别代码',
  `bank_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行id',
  `bank_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开户银行名称',
  `bankacct` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行账号',
  `bank_acctname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行户名',
  `rchk_flag` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '复核标志',
  `reg_rchk_opnn` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '登记复核意见',
  `rid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据唯一记录号',
  `crte_time` datetime NULL DEFAULT NULL COMMENT '数据创建时间',
  `updt_time` datetime NULL DEFAULT NULL COMMENT '数据更新时间',
  `crter_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人id',
  `crter_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人姓名',
  `crte_optins_no` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建机构编号',
  `opter_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办人id',
  `opter_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办人姓名',
  `opt_time` datetime NULL DEFAULT NULL COMMENT '经办时间',
  `optins_no` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办机构编号',
  `admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保区划',
  `vali_flag` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '有效标志',
  `data_ver` decimal(18, 2) NULL DEFAULT NULL COMMENT '数据版本号',
  `opt_dot_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办网点id',
  `longterm_org_nurscare_regn_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '长期护理机构护理区id',
  `longterm_org_bed_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '长期护理机构床位id',
  `rels_medstff_no` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '亲属护理员编号',
  `rels_medstff_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '亲属护理员姓名',
  `out_live_flag` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '异地居住标志',
  `bank_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行代码',
  `family_member` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否专属护理',
  `is_auto_exit` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否自动退出',
  `is_tracheotomy` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '气管切开标志',
  `dsabpsn_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '失能人员类型',
  `longterm_reg_souc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '长期护理登记来源',
  `if_trained` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否参加培训(1:是,0:否)',
  `if_hi_asst_obj` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否医保帮扶对象',
  `pkg` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '护理套餐',
  `if_sev_disa` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否重度残疾',
  `if_canc_disa_subs` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否取消残疾补贴',
  `reg_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '长护待遇登记类型',
  `if_cens_exit` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否核查解约',
  `if_base_selfpay_disc` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '基础自付是否减免',
  `if_pro_selfpay_disc` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '专业自付是否减免',
  `copn_claa_otp_crds` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合并甲类门诊慢特病',
  `recypaus_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '长护待遇登记类型（是否为恢复登记或者签约登记）',
  `dev_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备编号',
  PRIMARY KEY (`rid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '长期护理登记信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stg_midr_bus_xzxksx_info_df_ytai
-- ----------------------------
DROP TABLE IF EXISTS `stg_midr_bus_xzxksx_info_df_ytai`;
CREATE TABLE `stg_midr_bus_xzxksx_info_df_ytai`  (
  `MATT_PRCS_SN` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '事项办理流水号',
  `ADM_LIC_MATT_NO` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '行政许可事项编号',
  `MATT_STAS` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '事项状态',
  `REC_MATL_STAS` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接收材料状态',
  `BIR_MATL_STAS` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出件材料状态',
  `TMPL_SN` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表单模板流水号',
  `BEGN_ACP_TIME` datetime NULL DEFAULT NULL COMMENT '开始受理时间',
  `FNS_TIME` datetime NULL DEFAULT NULL COMMENT '办结时间',
  `REC_MATL_LOC_SN` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接收材料位置流水号',
  `SHOW_MATL_LOC_SN` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出件材料位置流水号',
  `BIZ_OBJ_NO` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务对象编号',
  `BIZ_OBJ_TYPE` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务主体类型',
  `PRSE_TIME` datetime NULL DEFAULT NULL COMMENT '承诺时间点',
  `ORDR_TIME` datetime NULL DEFAULT NULL COMMENT '预约时间点',
  `RECE_WAY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '取件方式',
  `DELV_TYPE` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '配送类型',
  `DELV_DOCNO` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '配送单号',
  `PRCS_WAY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '办理方式',
  `SHOW_MATL_PROSSTAS` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出件办理状态',
  `INST_TYPE` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '实例类型',
  `BIG_EVT_NO` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '大事定义编号',
  `SML_EVT_NO` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '小事定义编号',
  `PRCS_FOM` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '办理形式',
  `PRCS_FOM_DESC` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '办理形式中文描述',
  `BIG_MATT_PRCS_SN` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '大事事项办理流水号',
  `PRCS_ID` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务系统的piid',
  `BIZ_OBJ_ID` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务系统的业务对象id',
  `DATA_ID` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据ID',
  `BIZ_ID` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务ID',
  `ACP_ORG_ID` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '受理机构id',
  `OBJ_ORG_ID` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主体机构id',
  `MATT_ACP_CHNL` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '事项受理渠道',
  `MATT_ACP_CHNL_DESC` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '事项受理渠道（中文描述）',
  `MATT_ACP_WAY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '事项受理方式',
  `ABN_MATT_STAS` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '异常事项状态',
  `CHK_RSLT` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核结果',
  `DSPO_FLAG` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处理标志',
  `IDCARD` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证号码',
  `PSN_NAME` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `BINDER_IDCARD` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '绑定人自然人编号',
  `EVAL_OBJ` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评价主体',
  `AGNTER_IDCARD` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '帮办人自然人编号',
  `OPTINS_ID` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办机构ID',
  `updt_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `dw_city_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '城市编码',
  `dw_biz_time` datetime NULL DEFAULT NULL COMMENT '业务时间',
  `ADM_LIC_MATT_NO_DESC` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '行政许可事项内容',
  `MATT_STAS_DESC` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '事项状态中文描述',
  `pt` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开始受理时间年月'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '公共服务事项办理日志表' ROW_FORMAT = Dynamic PARTITION BY RANGE (YEAR(`BEGN_ACP_TIME`) * 100 + MONTH(`BEGN_ACP_TIME`))
PARTITIONS 1
(PARTITION `p_max` VALUES LESS THAN (MAXVALUE) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 )
;

-- ----------------------------
-- Table structure for stg_pol_oprn_std_b_df_ytai
-- ----------------------------
DROP TABLE IF EXISTS `stg_pol_oprn_std_b_df_ytai`;
CREATE TABLE `stg_pol_oprn_std_b_df_ytai`  (
  `oprn_std_list_id` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ver_name` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `cpr` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `cpr_code_scp` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `cpr_name` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `cgy_code` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `cgy_name` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sor_code` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sor_name` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `dtls_code` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `dtls_name` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `oprn_oprt_code` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `oprn_oprt_name` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `used_std` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `rtl_oprn_oprt_code` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `rtl_oprn_oprt_name` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `clnc_oprn_oprt_code` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `clnc_oprn_oprt_name` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `memo` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `vali_flag` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `rid` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `crte_time` datetime NULL DEFAULT NULL,
  `updt_time` datetime NULL DEFAULT NULL,
  `crter_id` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `crter_name` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `crte_optins_no` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `opter_id` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `opter_name` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `opt_time` datetime NULL DEFAULT NULL,
  `optins_no` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ver` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `isu_flag` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tram_data_id` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `efft_time` datetime NULL DEFAULT NULL,
  `invd_time` datetime NULL DEFAULT NULL,
  `dw_city_code` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `dw_biz_time` datetime NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '手术操作分类和代码表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stg_psi_pub_medins_drugpric_proc2
-- ----------------------------
DROP TABLE IF EXISTS `stg_psi_pub_medins_drugpric_proc2`;
CREATE TABLE `stg_psi_pub_medins_drugpric_proc2`  (
  `data_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '记录主键',
  `mdtrt_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊ID',
  `setl_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结算ID',
  `bkkp_sn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '记账流水号，第二主键，单次就诊唯一',
  `fixmedins_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定点医药机构编号',
  `fixmedins_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '药店名称',
  `med_list_codg` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保目录编码',
  `med_list_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保目录名称',
  `sel_cnt` decimal(10, 2) NULL DEFAULT NULL COMMENT '销售数量',
  `finl_trns_pric` decimal(10, 2) NULL DEFAULT NULL COMMENT '最终成交单价',
  `pric_lv` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '价格等级',
  `sel_retn_time` datetime NULL DEFAULT NULL COMMENT '销售时间',
  `crte_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updt_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `vali_flag` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '有效标志',
  `inv_cnt` decimal(10, 2) NULL DEFAULT NULL COMMENT '库存数量',
  `inv_updttime` datetime NULL DEFAULT NULL COMMENT '库存更新时间',
  `low_pric` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格区间下界',
  `high_pric` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格区间上界',
  `city_code` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地市编码',
  `med_list_type` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '药品类别',
  `prod_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品名',
  `list_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '目录类别'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '药品价格公开数据标准' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stg_psn_setl_info_yt_c_df_ytai
-- ----------------------------
DROP TABLE IF EXISTS `stg_psn_setl_info_yt_c_df_ytai`;
CREATE TABLE `stg_psn_setl_info_yt_c_df_ytai`  (
  `psn_setl_info_yt_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '人员结算详细信息记录id',
  `psn_trt_setl_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人待遇结算ID',
  `org_setl_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构结算ID',
  `psn_no` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员编号',
  `psn_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员姓名',
  `cert_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '证件类型',
  `certno` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '证件号码',
  `insutype` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '险种',
  `insu_admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参保区划',
  `nurscare_org_no` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '护理机构编号',
  `nurscare_way` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '护理方式',
  `longterm_eval_lv` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '失能等级',
  `nurs_days` int(11) NULL DEFAULT NULL COMMENT '实际护理天数',
  `dcla_time` datetime NULL DEFAULT NULL COMMENT '申报时间',
  `fee_begntime` datetime NULL DEFAULT NULL COMMENT '费用开始时间',
  `fee_endtime` datetime NULL DEFAULT NULL COMMENT '费用结束时间',
  `base_day_quto` decimal(18, 2) NULL DEFAULT NULL COMMENT '基护日费用标准',
  `base_mon_quto` decimal(18, 2) NULL DEFAULT NULL COMMENT '基护月费用标准',
  `base_serv_prop` decimal(18, 2) NULL DEFAULT NULL COMMENT '基护完成率',
  `base_prop` decimal(18, 2) NULL DEFAULT NULL COMMENT '基护完成考核率(基护时长/次数达标比例)',
  `base_ltci_fund_pay` decimal(18, 2) NULL DEFAULT NULL COMMENT '基护费用',
  `nurse_day_quto` decimal(18, 2) NULL DEFAULT NULL COMMENT '照护日费用标准',
  `nurse_mon_quto` decimal(18, 2) NULL DEFAULT NULL COMMENT '照护月费用标准',
  `nurse_serv_prop` decimal(18, 2) NULL DEFAULT NULL COMMENT '照护完成率',
  `nurse_prop` decimal(18, 2) NULL DEFAULT NULL COMMENT '照护完成考核率(照护时长/次数达标比例)',
  `nurse_ltci_fund_pay` decimal(18, 2) NULL DEFAULT NULL COMMENT '照护费用',
  `in_hos_amt` decimal(18, 2) NULL DEFAULT NULL COMMENT '甲慢病补偿额',
  `clr_stas` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '清算状态',
  `rid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据唯一记录号',
  `crte_time` datetime NULL DEFAULT NULL COMMENT '数据创建时间',
  `updt_time` datetime NULL DEFAULT NULL COMMENT '数据更新时间',
  `crter_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `crter_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人姓名',
  `crte_optins_no` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建机构编号',
  `opter_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办人ID',
  `opter_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办人姓名',
  `opt_time` datetime NULL DEFAULT NULL COMMENT '经办时间',
  `optins_no` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办机构编号',
  `admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保区划',
  `vali_flag` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '有效标志',
  `data_ver` decimal(18, 2) NULL DEFAULT NULL COMMENT '数据版本号',
  `opt_dot_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办网点ID',
  `medinslv` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗机构等级',
  `dpst_prop` decimal(18, 2) NULL DEFAULT NULL COMMENT '预留金比例',
  `sumamt` decimal(18, 2) NULL DEFAULT NULL COMMENT '合计总额',
  `adjm_add` decimal(18, 2) NULL DEFAULT NULL COMMENT '调增',
  `adjm_sub` decimal(18, 2) NULL DEFAULT NULL COMMENT '调减',
  `fund_pay_sumamt` decimal(18, 2) NULL DEFAULT NULL COMMENT '基金支付总额',
  PRIMARY KEY (`psn_setl_info_yt_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '个人结算详细信息记录表-烟台' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stg_sd_yt_dr_info_b_df_v_ytai
-- ----------------------------
DROP TABLE IF EXISTS `stg_sd_yt_dr_info_b_df_v_ytai`;
CREATE TABLE `stg_sd_yt_dr_info_b_df_v_ytai`  (
  `DR_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医师代码',
  `PSN_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员编号',
  `DR_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医师姓名',
  `PSN_ITRO` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '个人能力简介',
  `DR_PRAC_TYPE_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医师执业类别名称',
  `DR_PRAC_TYPE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医师执业类别',
  `DR_PRAC_SCP_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医师执业范围代码',
  `DR_PRAC_SCP_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医师执业范围名称',
  `PRAC_REGN` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执业地区',
  `MUL_PRAC_FLAG` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '多点执业标志',
  `MAIN_PRACINS_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主执业机构编号',
  `MAIN_PRACINS_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主执业机构名称',
  `MAIN_PRACINS_ADDR` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主执业机构地址',
  `NEMP_TIME` datetime NULL DEFAULT NULL COMMENT '离职时间',
  `VALI_FLAG` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '有效标志',
  `DR_PRO_TECH_DUTY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医师专业技术职务',
  `DR_PRO_TECH_DUTY_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医师专业技术职务名称',
  `DR_PRAC_CERT_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医师执业证书编号',
  `RID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据唯一记录号',
  `CRTE_TIME` datetime NULL DEFAULT NULL COMMENT '数据创建时间',
  `UPDT_TIME` datetime NULL DEFAULT NULL COMMENT '数据更新时间',
  `CRTER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `CRTER_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人姓名',
  `CRTE_OPTINS_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建机构编号',
  `OPTER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办人ID',
  `OPTER_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办人姓名',
  `OPT_TIME` datetime NULL DEFAULT NULL COMMENT '经办时间',
  `OPTINS_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办机构编号',
  `VER` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '版本号',
  `ADMDVS` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保区划',
  `SYNC_PRNT_FLAG` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '同步上级标志',
  `MEDINS_CODE` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗机构代码',
  `PRACINS_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执业机构名称',
  `PRACINS_ADDR` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执业机构地址',
  `MEDINS_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗机构名称',
  `CRED_LV` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '信用等级',
  `VOLA_BHVR` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '违规行为',
  `PRAC_STAS` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执业状态',
  `VER_RID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '版本唯一编号',
  `VER_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '版本名称',
  `DR_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医师ID',
  `PSN_STAS` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员状态',
  `CNTR_BEGNTIME` datetime NULL DEFAULT NULL COMMENT '合同起始时间',
  `CNTR_ENDTIME` datetime NULL DEFAULT NULL COMMENT '合同截止时间',
  `DR_PRAC_LV` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医师执业级别',
  `DR_PRACCERT_ELEC_DOC` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医师执业证书电子文档',
  `DR_CERT_CODG` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医师资格证书编码',
  `DIF_DSCR` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '差异说明',
  `dw_tab_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '源表名',
  `dw_biz_time` datetime NULL DEFAULT NULL COMMENT '数据归集时间',
  `dw_exch_updt_time` datetime NULL DEFAULT NULL COMMENT '数据处理时间',
  `pk_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主键',
  `ym` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年月分区'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '医师信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stg_sd_yt_hi_phar_psn_info_b_df_v_ytai
-- ----------------------------
DROP TABLE IF EXISTS `stg_sd_yt_hi_phar_psn_info_b_df_v_ytai`;
CREATE TABLE `stg_sd_yt_hi_phar_psn_info_b_df_v_ytai`  (
  `HI_PHAR_PSN_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保药学人员代码',
  `HI_PHAR_PSN_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保药学人员ID',
  `PSN_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员编号',
  `MEDINS_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗机构ID',
  `MEDINS_CODE` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗机构代码',
  `MEDINS_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗机构名称',
  `ADMDVS` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保区划',
  `HC_PRO_TECH_PSN_CERT_DOC` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '卫生专业技术人员资格证书电子文档',
  `CRED_LV` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '信用等级',
  `VOLA_BHVR` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '违规行为',
  `NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `PRO_SCP` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '专业范围',
  `PHAR_PSN_PRO_TECH_PROFTTL` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '药学人员专业技术职称',
  `PRAC_STAS` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执业状态',
  `DEPT_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室名称',
  `DUTY` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '职务',
  `HC_TECH_CERT_MGTCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '卫生专业技术资格证管理号',
  `PSN_STAS` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员状态',
  `CNTR_BEGNTIME` datetime NULL DEFAULT NULL COMMENT '合同起始时间',
  `CNTR_ENDTIME` datetime NULL DEFAULT NULL COMMENT '合同截止时间',
  `PRO_TECH_CERT_APRV_DATE` datetime NULL DEFAULT NULL COMMENT '专业技术资格证批准日期',
  `DATA_CHG_TYPE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据变更类型',
  `VALI_FLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '有效标志',
  `RID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据唯一记录号',
  `CRTE_TIME` datetime NULL DEFAULT NULL COMMENT '数据创建时间',
  `UPDT_TIME` datetime NULL DEFAULT NULL COMMENT '数据更新时间',
  `CRTER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `CRTER_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人姓名',
  `CRTE_OPTINS_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建机构编号',
  `OPTER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办人ID',
  `OPTER_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办人姓名',
  `OPT_TIME` datetime NULL DEFAULT NULL COMMENT '经办时间',
  `OPTINS_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办机构编号',
  `VER` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '版本号',
  `VER_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '版本名称',
  `dw_tab_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '源表名',
  `dw_biz_time` datetime NULL DEFAULT NULL COMMENT '数据归集时间',
  `dw_exch_updt_time` datetime NULL DEFAULT NULL COMMENT '数据处理时间',
  `pk_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主键',
  `pro_scp_desc` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '专业范围',
  `ym` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年月分区'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '医保药学人员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stg_sd_yt_hi_tech_psn_info_b_df_v_ytai
-- ----------------------------
DROP TABLE IF EXISTS `stg_sd_yt_hi_tech_psn_info_b_df_v_ytai`;
CREATE TABLE `stg_sd_yt_hi_tech_psn_info_b_df_v_ytai`  (
  `HI_TECH_PSN_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保技术人员代码',
  `HI_TECH_PSN_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保技术人员ID',
  `PSN_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员编号',
  `MEDINS_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗机构ID',
  `MEDINS_CODE` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗机构代码',
  `MEDINS_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗机构名称',
  `ADMDVS` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保区划',
  `HC_PRO_TECH_PSN_CERT_DOC` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '卫生专业技术人员资格证书电子文档',
  `CRED_LV` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '信用等级',
  `VOLA_BHVR` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '违规行为',
  `NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `PRO_SCP` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '专业范围',
  `TECH_PSN_PRO_TECH_PROFTTL` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '技术人员专业技术职称',
  `PRAC_STAS` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执业状态',
  `DEPT_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室名称',
  `DUTY` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '职务',
  `HC_TECH_CERT_MGTCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '卫生专业技术资格证管理号',
  `PSN_STAS` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员状态',
  `CNTR_BEGNTIME` datetime NULL DEFAULT NULL COMMENT '合同起始时间',
  `CNTR_ENDTIME` datetime NULL DEFAULT NULL COMMENT '合同截止时间',
  `PRO_TECH_CERT_APRV_DATE` datetime NULL DEFAULT NULL COMMENT '专业技术资格证批准日期',
  `DATA_CHG_TYPE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据变更类型',
  `VALI_FLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '有效标志',
  `RID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据唯一记录号',
  `CRTE_TIME` datetime NULL DEFAULT NULL COMMENT '数据创建时间',
  `UPDT_TIME` datetime NULL DEFAULT NULL COMMENT '数据更新时间',
  `CRTER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `CRTER_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人姓名',
  `CRTE_OPTINS_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建机构编号',
  `OPTER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办人ID',
  `OPTER_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办人姓名',
  `OPT_TIME` datetime NULL DEFAULT NULL COMMENT '经办时间',
  `OPTINS_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办机构编号',
  `VER` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '版本号',
  `VER_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '版本名称',
  `dw_tab_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '源表名',
  `dw_biz_time` datetime NULL DEFAULT NULL COMMENT '数据归集时间',
  `dw_exch_updt_time` datetime NULL DEFAULT NULL COMMENT '数据处理时间',
  `pk_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主键',
  `pro_scp_desc` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '专业范围',
  `ym` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年月分区'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '医保技术人员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stg_sd_yt_med_price_final
-- ----------------------------
DROP TABLE IF EXISTS `stg_sd_yt_med_price_final`;
CREATE TABLE `stg_sd_yt_med_price_final`  (
  `data_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '记录主键',
  `prod_sal_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品销售记录主键',
  `prod_stoin_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品入库记录主键',
  `fixmedins_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定点医药机构编号',
  `fixmedins_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '药店名称',
  `med_list_codg` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保目录编码',
  `med_list_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保目录名称',
  `sel_cnt` decimal(10, 2) NULL DEFAULT NULL COMMENT '销售数量',
  `finl_trns_pric` decimal(10, 2) NULL DEFAULT NULL COMMENT '最终成交单价',
  `pric_lv` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '价格等级',
  `barcode` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品条码',
  `sel_retn_time` datetime NULL DEFAULT NULL COMMENT '销售时间',
  `crte_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updt_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `vali_flag` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '有效标志',
  `inv_cnt` decimal(10, 2) NULL DEFAULT NULL COMMENT '库存数量',
  `inv_updttime` datetime NULL DEFAULT NULL COMMENT '库存更新时间',
  `low_pric` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格区间下界',
  `high_pric` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格区间上界',
  `city_code` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地市编码',
  `med_list_type` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '药品类别',
  `prod_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品名'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '药品价格公开数据标准' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stg_sd_yt_med_price_final_copy1
-- ----------------------------
DROP TABLE IF EXISTS `stg_sd_yt_med_price_final_copy1`;
CREATE TABLE `stg_sd_yt_med_price_final_copy1`  (
  `data_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '记录主键',
  `prod_sal_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品销售记录主键',
  `prod_stoin_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品入库记录主键',
  `fixmedins_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定点医药机构编号',
  `fixmedins_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '药店名称',
  `med_list_codg` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保目录编码',
  `med_list_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保目录名称',
  `sel_cnt` decimal(10, 2) NULL DEFAULT NULL COMMENT '销售数量',
  `finl_trns_pric` decimal(10, 2) NULL DEFAULT NULL COMMENT '最终成交单价',
  `pric_lv` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '价格等级',
  `barcode` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品条码',
  `sel_retn_time` datetime NULL DEFAULT NULL COMMENT '销售时间',
  `crte_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updt_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `vali_flag` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '有效标志',
  `inv_cnt` decimal(10, 2) NULL DEFAULT NULL COMMENT '库存数量',
  `inv_updttime` datetime NULL DEFAULT NULL COMMENT '库存更新时间',
  `low_pric` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格区间下界',
  `high_pric` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格区间上界',
  `city_code` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地市编码',
  `med_list_type` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '药品类别',
  `prod_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品名'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '药品价格公开数据标准' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stg_sd_yt_nurs_info_b_df_v_ytai
-- ----------------------------
DROP TABLE IF EXISTS `stg_sd_yt_nurs_info_b_df_v_ytai`;
CREATE TABLE `stg_sd_yt_nurs_info_b_df_v_ytai`  (
  `NURS_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '护士代码',
  `PSN_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员编号',
  `NURS_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '护士姓名',
  `NURS_PRAC_CERT_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '护士执业证书编号',
  `PRACINS_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执业机构编号',
  `PRACINS_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执业机构名称',
  `PRACINS_ADDR` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执业机构地址',
  `NEMP_TIME` datetime NULL DEFAULT NULL COMMENT '离职时间',
  `VALI_FLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '有效标志',
  `NURS_PRO_TECH_DUTY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '护士专业技术职务',
  `NURS_PRO_TECH_DUTY_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '护士专业技术职务名称',
  `RID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据唯一记录号',
  `CRTE_TIME` datetime NULL DEFAULT NULL COMMENT '数据创建时间',
  `UPDT_TIME` datetime NULL DEFAULT NULL COMMENT '数据更新时间',
  `CRTER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `CRTER_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人姓名',
  `CRTE_OPTINS_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建机构编号',
  `OPTER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办人ID',
  `OPTER_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办人姓名',
  `OPT_TIME` datetime NULL DEFAULT NULL COMMENT '经办时间',
  `OPTINS_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办机构编号',
  `VER` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '版本号',
  `ADMDVS` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保区划',
  `SYNC_PRNT_FLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '同步上级标志',
  `CRED_LV` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '信用等级',
  `VOLA_BHVR` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '违规行为',
  `PRAC_STAS` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执业状态',
  `VER_RID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '版本唯一编号',
  `VER_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '版本名称',
  `NURS_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '护士ID',
  `PSN_STAS` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员状态',
  `CNTR_BEGNTIME` datetime NULL DEFAULT NULL COMMENT '合同起始时间',
  `CNTR_ENDTIME` datetime NULL DEFAULT NULL COMMENT '合同截止时间',
  `PRAC_TYPE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执业类别',
  `HI_NURS_REGCERT_ELEC_DOC` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保护士注册证电子文档',
  `DIF_DSCR` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '差异说明',
  `dw_tab_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '源表名',
  `dw_biz_time` datetime NULL DEFAULT NULL COMMENT '数据归集时间',
  `dw_exch_updt_time` datetime NULL DEFAULT NULL COMMENT '数据处理时间',
  `pk_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主键',
  `ym` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年月分区'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '护士信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stg_sd_yt_phar_info_b_df_v_ytai
-- ----------------------------
DROP TABLE IF EXISTS `stg_sd_yt_phar_info_b_df_v_ytai`;
CREATE TABLE `stg_sd_yt_phar_info_b_df_v_ytai`  (
  `PHAR_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '药师代码',
  `PSN_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员编号',
  `PHAR_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '药师姓名',
  `PSN_ITRO` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '个人能力简介',
  `PHAR_PRAC_TYPE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '药师执业类别',
  `PHAR_PRAC_TYPE_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '药师执业类别名称',
  `PHAR_PRAC_SCP_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '药师执业范围名称',
  `PHAR_PRAC_SCP` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '药师执业范围',
  `PRAC_REGN` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执业地区',
  `PRACINS_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执业机构编号',
  `PRACINS_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执业机构名称',
  `PRACINS_ADDR` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执业机构地址',
  `NEMP_TIME` datetime NULL DEFAULT NULL COMMENT '离职时间',
  `VALI_FLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '有效标志',
  `PHAR_TYPE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '药师类别',
  `PHAR_PRO_TECH_DUTY_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '药师专业技术职务名称',
  `PHAR_PRO_TECH_DUTY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '药师专业技术职务',
  `RID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据唯一记录号',
  `CRTE_TIME` datetime NULL DEFAULT NULL COMMENT '数据创建时间',
  `UPDT_TIME` datetime NULL DEFAULT NULL COMMENT '数据更新时间',
  `CRTER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `CRTER_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人姓名',
  `CRTE_OPTINS_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建机构编号',
  `OPTER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办人ID',
  `OPTER_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办人姓名',
  `OPT_TIME` datetime NULL DEFAULT NULL COMMENT '经办时间',
  `OPTINS_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办机构编号',
  `VER` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '版本号',
  `ADMDVS` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保区划',
  `SYNC_PRNT_FLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '同步上级标志',
  `CRED_LV` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '信用等级',
  `VOLA_BHVR` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '违规行为',
  `PRAC_STAS` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执业状态',
  `VER_RID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '版本唯一编号',
  `VER_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '版本名称',
  `PHAR_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '药师ID',
  `PSN_STAS` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员状态',
  `CNTR_BEGNTIME` datetime NULL DEFAULT NULL COMMENT '合同起始时间',
  `CNTR_ENDTIME` datetime NULL DEFAULT NULL COMMENT '合同截止时间',
  `PRACCERT_TYPE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执业证书类别',
  `PHAR_PRAC_CERT_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '药师执业资格证号',
  `REGCERT_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册证号',
  `PHAR_PRAC_EMP` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '药师执业单位',
  `REG_TIME` datetime NULL DEFAULT NULL COMMENT '注册时间',
  `EXPY_ENDTIME` datetime NULL DEFAULT NULL COMMENT '有效期结束时间',
  `PHAR_CERT_ELEC_DOC` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '药师资格证书电子文档',
  `PRAC_PHAR_REGCERT_ELEC_DOC` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执业药师注册证电子文档',
  `DIF_DSCR` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '差异说明',
  `cert_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '证件类型',
  `cert_no` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '证件号码',
  `dw_tab_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '源表名',
  `dw_biz_time` datetime NULL DEFAULT NULL COMMENT '数据归集时间',
  `dw_exch_updt_time` datetime NULL DEFAULT NULL COMMENT '数据处理时间',
  `pk_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主键',
  `ym` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年月分区'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '药师信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stg_setl_fixmedins_ec_df_ytai
-- ----------------------------
DROP TABLE IF EXISTS `stg_setl_fixmedins_ec_df_ytai`;
CREATE TABLE `stg_setl_fixmedins_ec_df_ytai`  (
  `fix_blng_admdvs` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医药机构所属统筹区',
  `fixmedins_type` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医药机构类型',
  `fixmedins_code` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医药机构编码',
  `fixmedins_name` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医药机构名称',
  `ELEC_IDT_CNT` double NULL DEFAULT NULL COMMENT '扫码结算数量',
  `FACE_IDT_CNT` double NULL DEFAULT NULL COMMENT '刷脸结算数量',
  `ELEC_ALL_CNT` double NULL DEFAULT NULL COMMENT '电子凭证结算总量',
  `SETL_CNT` double NULL DEFAULT NULL COMMENT '定点结算总量',
  `stt_ym` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年月',
  `yl_1` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预留字段',
  `yl_2` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预留字段',
  `yl_3` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预留字段',
  `yl_4` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预留字段'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '医保码结算情况统计表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stg_tb_dise_list_b_df_v_ytai
-- ----------------------------
DROP TABLE IF EXISTS `stg_tb_dise_list_b_df_v_ytai`;
CREATE TABLE `stg_tb_dise_list_b_df_v_ytai`  (
  `dise_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '诊断代码(JBBM)',
  `dise_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '诊断名称(JBMC)',
  `pinyin` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '拼音助记码(PY)',
  `op_hifmi_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '门诊大病类别',
  `fm_dise_flag` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '家庭病床标志',
  `dise_cat` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病种类型(JBLB)',
  `dise_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病种(SICKKIND)',
  `canc_flag` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '核销标识(ZXBZ)',
  `brdt_date` datetime NULL DEFAULT NULL COMMENT '广播日期',
  `dnld_date` datetime NULL DEFAULT NULL COMMENT '下传日期',
  `ipt_dise_cat` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院疾病类别',
  `op_dise_cat` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '门诊疾病类别',
  `insu_scp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '险种范围',
  `serv_scp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务范围',
  `sco` decimal(10, 2) NULL DEFAULT NULL COMMENT '分值(FZ)',
  `dnld_sn` bigint(20) NULL DEFAULT NULL COMMENT '下传序号',
  `memo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注(BZ)',
  `begndate` datetime NULL DEFAULT NULL COMMENT '开始日期(QSRQ)',
  `enddate` datetime NULL DEFAULT NULL COMMENT '结束日期(ZZRQ)',
  `hifmi_spdrug_dise_flag` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '大病特药疾病标志',
  `rid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '唯一记录号',
  `crter` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `crte_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `crte_optins` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建机构',
  `opter` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办人',
  `opt_time` datetime NULL DEFAULT NULL COMMENT '经办时间',
  `optins` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办机构',
  `poolarea` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统筹区',
  `updt_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `upld_prov_time` datetime NULL DEFAULT NULL COMMENT '上传省平台时间',
  `dw_city_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区划',
  `dw_biz_time` datetime NULL DEFAULT NULL COMMENT '同步时间',
  `fq_city_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区划',
  PRIMARY KEY (`rid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '烟台疾病目录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stg_tp_opsp_reg_d_df_v_ytai
-- ----------------------------
DROP TABLE IF EXISTS `stg_tp_opsp_reg_d_df_v_ytai`;
CREATE TABLE `stg_tp_opsp_reg_d_df_v_ytai`  (
  `trt_dcla_detl_sn` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '待遇申报明细流水号(sjid)',
  `psn_no` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员编号(RYID)',
  `med_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗类别',
  `mdtrt_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就医类别',
  `trt_way` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '治疗方式',
  `insu_psn_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参保人员ID(RYDJID)',
  `begndate` datetime NULL DEFAULT NULL COMMENT '起始时间',
  `enddate` datetime NULL DEFAULT NULL COMMENT '终止时间',
  `dise` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '诊断',
  `grp_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人群类别',
  `memo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `coner_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `tel` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电话',
  `dcla_souc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务来源',
  `vali_flag` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '有效标志',
  `rid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '唯一记录号',
  `crter` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `crte_optins` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建机构',
  `opter` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办人',
  `optins` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办机构',
  `poolarea` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统筹区',
  `crte_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `opt_time` datetime NULL DEFAULT NULL COMMENT '经办时间',
  `updt_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `wrt_time` datetime NULL DEFAULT NULL COMMENT '填写时间',
  `can_onln_setl` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否允许联网结算',
  `medrcdno` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `lmt_amt` decimal(18, 2) NULL DEFAULT NULL COMMENT '限额',
  `chk_flag` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审批结果',
  `out_fil_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '异地备案ID（YDBAID）',
  `upld_prov_plaf_time` datetime NULL DEFAULT NULL COMMENT '上传省平台时间',
  `upld_prov_plaf_err` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '上传省平台错误信息',
  `upld_prov_plaf_flag` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否上传省平台',
  `admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保区划',
  `up_pro_plat_flag` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上传平台标志',
  `dw_city_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区划',
  `dw_biz_time` datetime NULL DEFAULT NULL COMMENT '同步时间',
  `fq_city_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区划',
  PRIMARY KEY (`trt_dcla_detl_sn`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '门慢门特登记信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stg_tp_opsp_reg_medins_d_df_v_ytai
-- ----------------------------
DROP TABLE IF EXISTS `stg_tp_opsp_reg_medins_d_df_v_ytai`;
CREATE TABLE `stg_tp_opsp_reg_medins_d_df_v_ytai`  (
  `trt_dcla_detl_sn` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '待遇申报明细流水号(sjid)',
  `fixmedins_code` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定点医药机构编号(YYBM)',
  `begndate` datetime NULL DEFAULT NULL COMMENT '开始日期(QSRQ)',
  `enddate` datetime NULL DEFAULT NULL COMMENT '结束日期(ZZRQ)',
  `psn_no` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员编号(RYID)',
  `rid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '唯一记录号',
  `crter` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `crte_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `crte_optins` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建机构',
  `opter` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办人',
  `opt_time` datetime NULL DEFAULT NULL COMMENT '经办时间',
  `optins` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办机构',
  `poolarea` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统筹区',
  `updt_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `opsp_dise_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '门慢门特病种代码(jbbm)',
  `seq` bigint(20) NULL DEFAULT NULL COMMENT '顺序号',
  `dise_code_lv2` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '二级疾病编码（djjbbm）',
  `dw_city_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区划',
  `dw_biz_time` datetime NULL DEFAULT NULL COMMENT '同步时间',
  `fq_city_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区划',
  PRIMARY KEY (`trt_dcla_detl_sn`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参保人特殊病备案-医院' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stg_zffs_drgkd37_mf_ytai
-- ----------------------------
DROP TABLE IF EXISTS `stg_zffs_drgkd37_mf_ytai`;
CREATE TABLE `stg_zffs_drgkd37_mf_ytai`  (
  `ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `GRPNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分组器编号',
  `mdtrt_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊登记信息ID',
  `fixmedins_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '定点医疗机构编码',
  `MDTRTSN` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '就诊流水号',
  `psn_no` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '个人编号',
  `SSCNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '社保卡号',
  `med_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗类别',
  `org_no` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参保组织编号',
  `MEDINSLV` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医院等级',
  `BEGNDATE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '入院日期',
  `ADM_DISECODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '入院诊断疾病编码',
  `ADM_DISENAME` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '入院诊断疾病名称',
  `ENDDATE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出院日期',
  `DSCG_REA` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出院原因',
  `DSCG_DISECODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出院诊断疾病编码',
  `DSCG_DISENAME` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出院诊断疾病名称',
  `INHOSP_STAS` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '在院状态',
  `DEDC` decimal(20, 2) NULL DEFAULT NULL COMMENT '起付标准',
  `med_psn_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗人员类别',
  `med_trt_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗待遇类别',
  `REIM_FLAG` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '报销标志',
  `ONLN_FLAG` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联脱机标志',
  `COTN_IPT_FLAG` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '连续住院标志',
  `CENT_SETL_FLAG` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '中心报销结算标志',
  `APPR_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审批编号',
  `REIM_REA` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '报销原因',
  `OUTMED_REA` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '异地就诊原因',
  `OUT_PSN_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '异地个人编号',
  `OUT_ADMDVS` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '异地行政区划',
  `OUT_MDTRTSN` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '异地就诊序号',
  `OUT_SETL_ID` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '异地结算业务流水号',
  `OUTMED_TYPE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区别异地联网结算交易和普通异地就医',
  `fixmedins_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定点医疗机构名称',
  `ATDDR_CODE` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主治医师编码',
  `ATDDR_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主治医师姓名',
  `DEPT_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室名称',
  `OPRN_DATE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术日期',
  `WARDAREA` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病区',
  `BEDNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '床位号',
  `IPT_SN` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医院内部住院流水号',
  `LAST_IPT_SN` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上次住院流水号',
  `HOSP_OPTER` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医院经办人',
  `OPTER_DATE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医院经办日期',
  `PSN_MGTCODE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人管理码',
  `IDCARD_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公民身份号码',
  `PAN_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `GEND` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别',
  `AGE` int(11) NULL DEFAULT NULL COMMENT '年龄',
  `emp_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位编号',
  `emp_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位名称',
  `emp_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位类型',
  `ECON_TYPE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经济类型',
  `CARD_INFO` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人卡信息',
  `DSCG_MEMO` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出院备注',
  `TRAM_FLAG` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '传输标志',
  `MEMO` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `VALI_FLAG` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '有效标志',
  `fixmedins_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗机构类别',
  `hosp_lv` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医院收费级别',
  `RCHK_STAS` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '复核状态',
  `RECHKER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '复核人',
  `RCHK_DATE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '复核日期',
  `DEPT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室编号',
  `TEL` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话(患者)',
  `MEDRCDNO` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病历号',
  `HIFOB_PAY_FLAG` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '大额支付标志',
  `trt_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '待遇大类（1：职工 2：居民 3：其他）',
  `UPDT_TIME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据更新时间戳',
  `INSUTYPE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主险种类型',
  `BEDDAY` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院床日',
  `SETL_YEAR` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结算年度',
  `SETL_TIME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结算时间',
  `GRPG_FLAG` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否入组(01入组、02未入组)',
  `DRG_LV` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'DRG级别',
  `MDC_CODE` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'MDC编码',
  `MDC_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'MDC名称',
  `ADRG_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'ADRG编码',
  `ADRG_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'ADRG名称',
  `DRG_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'DRG编码',
  `DRG_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'DRG名称',
  `MODI_DRG_CODE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改DRG编码',
  `MODI_DRG_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改DRG名称',
  `FOURTD_RINP_FLAG` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '两周再入院标志（0：否  1：是）',
  `THIRTYD_RINP_FLAG` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '30天再入院标志（0：否  1：是）',
  `TRAFOUT_CAS_FLAG` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '转出病例标志（0：否  1：是）',
  `BEGNTIME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开始时间',
  `ENDTIME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结束时间',
  `CRTER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `CRTE_TIME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `OPTER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办人',
  `OPT_TIME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办时间',
  `OPTINS_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办机构编码',
  `POOLAREA` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统筹区',
  `OPRT_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作序号',
  `SP_FLAG` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '特殊标记',
  `CAS_STAS` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病例状态',
  `CAS_CHK_TYPE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病例审核类型',
  `CAS_CHK_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病例审核编号',
  `YEAR` int(11) NULL DEFAULT NULL COMMENT '年度',
  `CAS_CHK_STAS` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病例初审分配状态',
  `AUDT_CHK_STAS` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '稽核初审分配状态',
  `TRIG_FLAG` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '触发标志',
  `CASE_SOUC` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '案件来源',
  `CAS_RCHK_STAS` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病例复审分配状态',
  `CAS_FINL_RCHK_STAS` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病例终审分配状态',
  `AUDT_CNFM_STAS` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '稽核确认分配状态',
  `HOSP_CNFM` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '院方确认',
  `READ_FLAG` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '已读标志',
  `REFLIN_CAS_FLAG` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '转入病例标志（0：否  1：是）',
  `DIE_FLAG` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '死亡标志（0：未死亡  1：死亡）',
  `DOCNO` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单据号',
  `TRNS_TYPE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交易类型',
  `MAINDIAG_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '首页主要诊断编码',
  `MAINDIAG_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '首页主要诊断名称',
  `MONSETL_TIME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '月结算时间',
  `MONSETL_TYPE` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '月结算类型',
  `SUMFEE` decimal(20, 2) NULL DEFAULT NULL COMMENT '总费用',
  `MEDFEE` decimal(20, 2) NULL DEFAULT NULL COMMENT '医疗费用',
  `NURSFEE` decimal(20, 2) NULL DEFAULT NULL COMMENT '护理费用',
  `bkd228` decimal(20, 2) NULL DEFAULT NULL COMMENT '医技费用',
  `MGTFEE` decimal(20, 2) NULL DEFAULT NULL COMMENT '管理费用',
  `DRUGFEE` decimal(20, 2) NULL DEFAULT NULL COMMENT '药品费用',
  `TRTFEE` decimal(20, 2) NULL DEFAULT NULL COMMENT '诊疗费用',
  `MATLFEE` decimal(20, 2) NULL DEFAULT NULL COMMENT '耗材费用',
  `SERV_FEE` decimal(20, 2) NULL DEFAULT NULL COMMENT '服务设施费用',
  `DRUG_MCS_FEE` decimal(20, 2) NULL DEFAULT NULL COMMENT '药品耗材费用',
  `HIFP_PAY` decimal(20, 2) NULL DEFAULT NULL COMMENT '统筹基金支出',
  `HIFOB_PAY` decimal(20, 2) NULL DEFAULT NULL COMMENT '大额基金支出',
  `HIFCS_PAY` decimal(20, 2) NULL DEFAULT NULL COMMENT '公务员补助支出',
  `ACCT_PAY` decimal(20, 2) NULL DEFAULT NULL COMMENT '账户支出',
  `CASHPAY` decimal(20, 2) NULL DEFAULT NULL COMMENT '现金支出',
  `OWNPAY` decimal(20, 2) NULL DEFAULT NULL COMMENT '自费费用',
  `SELFPAY` decimal(20, 2) NULL DEFAULT NULL COMMENT '自付费用',
  `OTHEXPD` decimal(20, 2) NULL DEFAULT NULL COMMENT '个人补充基金支付金额(目前存储其他补助费用)',
  `HIFP_ACT_PAY` decimal(20, 2) NULL DEFAULT NULL COMMENT '统筹实际支付(月结算)',
  `OVERLMT` decimal(30, 2) NULL DEFAULT NULL COMMENT '超限价自付费用',
  `HIFOB_ACT_PAY` decimal(32, 6) NULL DEFAULT NULL COMMENT '大额实际支付(月结算)',
  `MONSETL_SN` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '月结流水号',
  `SACS_MAF` decimal(20, 2) NULL DEFAULT NULL COMMENT '低保救助金额',
  `HIFMI_PAY` decimal(20, 2) NULL DEFAULT NULL COMMENT '大病支付金额(目前存储居民大病费用)',
  `ACPROV_OTHEXPD` decimal(20, 2) NULL DEFAULT NULL COMMENT '跨省其他基金(目前存储除外项目费用)',
  `PRESELFPAY` decimal(20, 2) NULL DEFAULT NULL COMMENT '乙类自理费用',
  `BEDFEE_OVERLMT` decimal(20, 2) NULL DEFAULT NULL COMMENT '床位超限价',
  `MATLFEE_OVERLMT` decimal(20, 2) NULL DEFAULT NULL COMMENT '材料超限价',
  `DRUGFEE_OVERLMT` decimal(20, 2) NULL DEFAULT NULL COMMENT '药品超限价',
  `BCHNO` decimal(20, 2) NULL DEFAULT NULL COMMENT '随机批次编码',
  `STD_DRUGFEE` decimal(20, 2) NULL DEFAULT NULL COMMENT '标准药品费用（收费类别：11，12，13）',
  `STD_MATLFEE` decimal(20, 2) NULL DEFAULT NULL COMMENT '标准耗材费用（收费类别：28，36）',
  `STD_TRTFEE` decimal(20, 2) NULL DEFAULT NULL COMMENT '标准诊疗费用（不包括药品、耗材收费类别',
  `CHK_OPNN` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '初审意见',
  `RCHK_OPNN` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '复审意见',
  `FINL_CHK_OPNN` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '终审意见',
  `MONSETL_PAY_TYPE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '月结算付费类型',
  `MEDRCD_ID` decimal(20, 2) NULL DEFAULT NULL COMMENT '电子病历基本信息ID（km39中BAZ069或km71中baz001）',
  `HIFES` decimal(20, 2) NULL DEFAULT NULL COMMENT '企(事)业补充医疗保险',
  `PAYMTD` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付方式',
  `OWNPAY_AMT` decimal(20, 6) NULL DEFAULT NULL COMMENT '全额自费',
  `DRG_CODE_20` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'DRG编码2.0',
  `DRG_NAME_20` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'DRG名称2.0',
  INDEX `idx_stg_zffs_drgkd37`(`VALI_FLAG`, `DRG_CODE`, `fixmedins_code`, `SETL_TIME`) USING BTREE,
  INDEX `idx_stg_zffs_DRG_CODE`(`DRG_CODE`) USING BTREE,
  INDEX `idx_fixmedins_code`(`fixmedins_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '病例分组结果信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stg_zffs_drgkd37proc_mf_ytai
-- ----------------------------
DROP TABLE IF EXISTS `stg_zffs_drgkd37proc_mf_ytai`;
CREATE TABLE `stg_zffs_drgkd37proc_mf_ytai`  (
  `stt_ym` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年月',
  `fixmedins_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定点医疗机构编码',
  `trt_type` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '待遇大类（1：职工 2：居民 3：其他）',
  `DRG_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'DRG编码',
  `DRG_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'DRG名称',
  `PSNTIME` decimal(20, 2) NULL DEFAULT NULL COMMENT '人次',
  `PSNCNT` decimal(20, 2) NULL DEFAULT NULL COMMENT '人数',
  `SUMFEE` decimal(20, 2) NULL DEFAULT NULL COMMENT '总费用',
  `TRTFEE` decimal(20, 2) NULL DEFAULT NULL COMMENT '医技费用',
  `drugfee` decimal(20, 2) NULL DEFAULT NULL COMMENT '药品费用',
  `matlfee` decimal(20, 2) NULL DEFAULT NULL COMMENT '耗材费用',
  `bedday` decimal(20, 2) NULL DEFAULT NULL COMMENT '住院天数',
  `SEVEND_RINP` decimal(20, 2) NULL DEFAULT NULL COMMENT '7天再住院',
  `FOURTD_RINP` decimal(20, 2) NULL DEFAULT NULL COMMENT '14天再住院',
  `ownpay_amt` decimal(20, 2) NULL DEFAULT NULL COMMENT '自费费用',
  `fixmedins_code_h` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定点医疗机构编码H',
  `fixmedins_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定点医疗机构编码',
  `fixmedins_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定点医疗机构编码'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '病例分组结果汇总表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_fullscreen_cfg
-- ----------------------------
DROP TABLE IF EXISTS `user_fullscreen_cfg`;
CREATE TABLE `user_fullscreen_cfg`  (
  `user_acct_id` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `fullscreen_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '全屏方向（xy）'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户大屏全屏xy方向配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for yt_fixmedins_b_lsb
-- ----------------------------
DROP TABLE IF EXISTS `yt_fixmedins_b_lsb`;
CREATE TABLE `yt_fixmedins_b_lsb`  (
  `poolarea_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fixmedins_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fixmedins_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `lx` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `dj` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
