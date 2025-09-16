/*
 Navicat Premium Data Transfer

 Source Server         : 测试-两结合三赋能业务场景应用数据库
 Source Server Type    : MySQL
 Source Server Version : 50742 (5.7.42-log)
 Source Host           : rm-9xx8i5479621bf84r.mysql.rds.ops.sd.hsip.gov.cn:3306
 Source Schema         : sc_mds_c

 Target Server Type    : MySQL
 Target Server Version : 50742 (5.7.42-log)
 File Encoding         : 65001

 Date: 13/08/2024 11:09:20
*/

SET NAMES utf8mb4;
SET
FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admdvs_a
-- ----------------------------
DROP TABLE IF EXISTS `admdvs_a`;
CREATE TABLE `admdvs_a`
(
    `ADMDVS`           varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NOT NULL COMMENT '医保区划',
    `ADMDVS_NAME`      varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '医保区划名称',
    `PRNT_ADMDVS`      varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上级医保区划',
    `ADMDVS_LV`        varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NOT NULL COMMENT '医保区划级别',
    `MEMO`             longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
    `RID`              varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '数据唯一记录号',
    `CRTE_TIME`        datetime                                                      NOT NULL COMMENT '数据创建时间',
    `UPDT_TIME`        datetime                                                      NOT NULL COMMENT '数据更新时间',
    `CRTER_ID`         varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '创建人ID',
    `CRTER_NAME`       varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '创建人姓名',
    `OPTER_ID`         varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '经办人ID',
    `OPTER_NAME`       varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '经办人姓名',
    `OPT_TIME`         datetime                                                      NOT NULL COMMENT '经办时间',
    `OPTINS_NO`        varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '经办机构编号',
    `VER`              varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '版本号',
    `ADMDVS_DATA_SOUC` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '医保区划数据来源',
    `VALI_FLAG`        varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NOT NULL COMMENT '有效标志',
    `CRTE_OPTINS_NO`   varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '创建机构编号',
    `POOLAREA_FLAG`    varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统筹区标志',
    PRIMARY KEY (`ADMDVS`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '医保区划表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for admdvs_a_gb
-- ----------------------------
DROP TABLE IF EXISTS `admdvs_a_gb`;
CREATE TABLE `admdvs_a_gb`
(
    `ADMDVS`           varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NOT NULL COMMENT '医保区划',
    `ADMDVS_NAME`      varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '医保区划名称',
    `PRNT_ADMDVS`      varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上级医保区划',
    `ADMDVS_LV`        varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NOT NULL COMMENT '医保区划级别',
    `MEMO`             longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
    `RID`              varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '数据唯一记录号',
    `CRTE_TIME`        datetime                                                      NOT NULL COMMENT '数据创建时间',
    `UPDT_TIME`        datetime                                                      NOT NULL COMMENT '数据更新时间',
    `CRTER_ID`         varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '创建人ID',
    `CRTER_NAME`       varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '创建人姓名',
    `OPTER_ID`         varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '经办人ID',
    `OPTER_NAME`       varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '经办人姓名',
    `OPT_TIME`         datetime                                                      NOT NULL COMMENT '经办时间',
    `OPTINS_NO`        varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '经办机构编号',
    `VER`              varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '版本号',
    `ADMDVS_DATA_SOUC` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '医保区划数据来源',
    `VALI_FLAG`        varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NOT NULL COMMENT '有效标志',
    `CRTE_OPTINS_NO`   varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '创建机构编号',
    `POOLAREA_FLAG`    varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统筹区标志',
    PRIMARY KEY (`ADMDVS`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '医保区划表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for dashboard
-- ----------------------------
DROP TABLE IF EXISTS `dashboard`;
CREATE TABLE `dashboard`
(
    `dashboard_id` int(11) NOT NULL AUTO_INCREMENT,
    `data`         text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
    `OPTER_NAME`   varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
    `OPT_TIME`     datetime NULL DEFAULT NULL COMMENT '修改时间',
    `RID`          varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    PRIMARY KEY (`dashboard_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8400296 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for dashboard_copy1
-- ----------------------------
DROP TABLE IF EXISTS `dashboard_copy1`;
CREATE TABLE `dashboard_copy1`
(
    `dashboard_id` int(11) NOT NULL AUTO_INCREMENT,
    `data`         text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
    `OPTER_NAME`   varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
    `OPT_TIME`     datetime NULL DEFAULT NULL COMMENT '修改时间',
    `RID`          varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    PRIMARY KEY (`dashboard_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8400263 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for data_dic_a
-- ----------------------------
DROP TABLE IF EXISTS `data_dic_a`;
CREATE TABLE `data_dic_a`
(
    `DATA_DIC_ID`    varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '字典ID',
    `DIC_VAL_CODE`   varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典代码',
    `DIC_VAL_NAME`   varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典名称',
    `DIC_TYPE_CODE`  varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '字典类型代码',
    `SEQ`            int(11) NOT NULL COMMENT '顺序号',
    `MEMO`           longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
    `VALI_FLAG`      varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NOT NULL COMMENT '有效标志',
    `RID`            varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据唯一记录号',
    `CRTE_TIME`      datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
    `UPDT_TIME`      datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据更新时间',
    `CRTER_ID`       varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '创建人ID',
    `CRTER_NAME`     varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '创建人姓名',
    `CRTE_OPTINS_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '创建机构编号',
    `OPTER_ID`       varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '经办人ID',
    `OPTER_NAME`     varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '经办人姓名',
    `OPT_TIME`       datetime                                                      NOT NULL COMMENT '经办时间',
    `OPTINS_NO`      varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '经办机构编号',
    `VER`            varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '版本号',
    PRIMARY KEY (`DATA_DIC_ID`) USING BTREE,
    UNIQUE INDEX `data_dic_a_unique1`(`DIC_VAL_CODE`, `DIC_TYPE_CODE`) USING BTREE COMMENT '业务逻辑唯一索引'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '数据字典表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for data_dic_mgt
-- ----------------------------
DROP TABLE IF EXISTS `data_dic_mgt`;
CREATE TABLE `data_dic_mgt`
(
    `RID`          varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci  NOT NULL,
    `DIC_ID`       varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci  NOT NULL,
    `DIC_CODE`     varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci  NOT NULL COMMENT '字典代码',
    `DIC_VAL_CODE` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci  NOT NULL COMMENT '字典值代码',
    `DIC_NAME`     varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '字典名称',
    `DIC_VAL_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '字典值名称',
    `MEMO`         varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注信息',
    `OPT_TIME`     datetime NULL DEFAULT NULL COMMENT '修改时间',
    `OPTER_NAME`   varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
    `OPTER_ID`     varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `VALI_FLAG`    varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1',
    PRIMARY KEY (`DIC_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for dwd_clct_d_traf_amt_df
-- ----------------------------
DROP TABLE IF EXISTS `dwd_clct_d_traf_amt_df`;
CREATE TABLE `dwd_clct_d_traf_amt_df`
(
    `stt_ym` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `traf_sumamt` double (24, 2) NULL DEFAULT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 793 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dwd_jjsz_fee_list_d_opt_mi_ytai
-- ----------------------------
DROP TABLE IF EXISTS `dwd_jjsz_fee_list_d_opt_mi_ytai`;
CREATE TABLE `dwd_jjsz_fee_list_d_opt_mi_ytai`
(
    `stt_ym`                varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `insu_admdvs`           varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `insu_admdvs_desc`      varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `insutype`              varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `fixmedins_code`        varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `fixmedins_name`        varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `list_type_s_desc`      varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `med_chrgitm_type_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `det_item_fee_sumamt`   decimal(16, 2) NULL DEFAULT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 560328 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dwd_jjsz_mztc_setl_mf_ytai
-- ----------------------------
DROP TABLE IF EXISTS `dwd_jjsz_mztc_setl_mf_ytai`;
CREATE TABLE `dwd_jjsz_mztc_setl_mf_ytai`
(
    `ym`              varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `psn_type`        varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `clct_grde`       varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `insutype`        varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `insu_admdvs`     varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `admdvs_desc`     varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `fixmedins_type`  varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `hosp_lv`         varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `fund_pay_sumamt` decimal(16, 2) NULL DEFAULT NULL,
    `medfee_sumamt`   decimal(16, 2) NULL DEFAULT NULL,
    `hifp_pay`        decimal(16, 2) NULL DEFAULT NULL,
    `hifob_pay`       decimal(16, 2) NULL DEFAULT NULL,
    `cnt_setl`        int(11) NULL DEFAULT NULL,
    `cnt_psn`         int(11) NULL DEFAULT NULL,
    `fund_pay_per_p`  decimal(16, 2) NULL DEFAULT NULL,
    `percentage`      decimal(16, 2) NULL DEFAULT NULL,
    `flag`            int(11) NULL DEFAULT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 16678 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dwd_sdyt_fee_list_d_opt
-- ----------------------------
DROP TABLE IF EXISTS `dwd_sdyt_fee_list_d_opt`;
CREATE TABLE `dwd_sdyt_fee_list_d_opt`
(
    `stt_ym`                varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统计年月',
    `insu_admdvs`           varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定点归属医保区划',
    `insutype`              varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '险种类型',
    `fixmedins_code`        varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定点医药机构编号',
    `fixmedins_name`        varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定点医药机构名称',
    `med_chrgitm_type`      varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保目录编码类型CODE',
    `med_chrgitm_type_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保目录编码类型NAMEA',
    `det_item_fee_sumamt`   decimal(11, 2) NULL DEFAULT NULL COMMENT '明细项目费用总额'
) ENGINE = InnoDB AUTO_INCREMENT = 536660 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '门诊统筹基金运行监测-费用构成' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for dwd_sdyt_setld_payfund_opt
-- ----------------------------
DROP TABLE IF EXISTS `dwd_sdyt_setld_payfund_opt`;
CREATE TABLE `dwd_sdyt_setld_payfund_opt`
(
    `ym`          varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年月',
    `insutype`    varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '险种类型',
    `insu_admdvs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参保所属医保区划',
    `link`        varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '1大额2基本',
    `cnt_setl`    decimal(11, 2) NULL DEFAULT NULL COMMENT '人次',
    `cnt_psn`     decimal(11, 2) NULL DEFAULT NULL COMMENT '人数',
    `medfee_sum`  decimal(11, 2) NULL DEFAULT NULL COMMENT '医疗总费用',
    `fund_pay`    decimal(11, 2) NULL DEFAULT NULL COMMENT '统筹支出'
) ENGINE = InnoDB AUTO_INCREMENT = 485 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '门诊统筹-统筹基金累计' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for dwd_setl_d_mat_type_count
-- ----------------------------
DROP TABLE IF EXISTS `dwd_setl_d_mat_type_count`;
CREATE TABLE `dwd_setl_d_mat_type_count`
(
    `stt_ym`        varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `mat_idet_code` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `med_type_new`  varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `psn_count`     int(12) NULL DEFAULT NULL,
    `SETL_TIMECNT`  int(12) NULL DEFAULT NULL,
    `MAF_PAY` double (18, 2) NULL DEFAULT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 983 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dwd_ydjy_outmed_setl_d_grp_time_df_ytai
-- ----------------------------
DROP TABLE IF EXISTS `dwd_ydjy_outmed_setl_d_grp_time_df_ytai`;
CREATE TABLE `dwd_ydjy_outmed_setl_d_grp_time_df_ytai`
(
    `year_months`           varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年月',
    `count_psn_no`          bigint(20) NULL DEFAULT NULL COMMENT '结算人次',
    `count_dis_psn_no`      bigint(25) NULL DEFAULT NULL COMMENT '结算人数',
    `sum_medfee_sumamt`     decimal(20, 2) NULL DEFAULT NULL COMMENT '医疗费总额',
    `sum_hifp_pay`          decimal(20, 2) NULL DEFAULT NULL COMMENT '统筹基金支出',
    `sum_fund_pay_sumamt`   decimal(20, 2) NULL DEFAULT NULL COMMENT '基金支付总额',
    `avgday_sum`            bigint(20) NULL DEFAULT NULL COMMENT '本月平均住院日天数汇总和',
    `avgday_count`          bigint(20) NULL DEFAULT NULL COMMENT '本月平均住院日人次',
    `hifob_pay`             bigint(20) NULL DEFAULT NULL COMMENT '大额医疗补助基金支出',
    `hifmi_pay`             bigint(20) NULL DEFAULT NULL COMMENT '大病补充医疗保险基金支出',
    `hifdm_pay`             bigint(20) NULL DEFAULT NULL COMMENT '伤残人员医疗保障基金支出',
    `maf_pay`               bigint(20) NULL DEFAULT NULL COMMENT '医疗救助基金支出',
    `othfund_pay`           bigint(20) NULL DEFAULT NULL COMMENT '其它基金支付',
    `psn_pay`               bigint(20) NULL DEFAULT NULL COMMENT '个人支付金额',
    `acct_pay`              bigint(20) NULL DEFAULT NULL COMMENT '个人账户支出',
    `cash_payamt`           bigint(20) NULL DEFAULT NULL COMMENT '现金支付金额',

    `fixmedins_code`        varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗机构编码',
    `fixmedins_name`        varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗机构名称',
    `fix_blng_admdvs`       varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定点归属医保区划',
    `fix_blng_admdvs_name`  varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定点归属医保区划名称',
    `med_type`              varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗类别',
    `count_psn_appy_rloc_l` bigint(55) NULL DEFAULT NULL COMMENT '异地长期',
    `count_psn_appy_rloc_s` bigint(55) NULL DEFAULT NULL COMMENT '异地短期备案',
    `prov_type`             varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省类型',
    `insu_admdvs`           varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区划',
    `admdvs_name`           varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区划',
    `admdvs_city_code`      varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区划',
    `admdvs_city_name`      varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区划',
    `admdvs_province_code`  varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区划',
    `admdvs_province_name`  varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区划',
    `data_type`             varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
    INDEX                   `idx_year_months`(`year_months`) USING BTREE,
    INDEX                   `idx_med_type`(`med_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 557409 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dwd_ydjy_setl_d_mi_ytai
-- ----------------------------
DROP TABLE IF EXISTS `dwd_ydjy_setl_d_mi_ytai`;
CREATE TABLE `dwd_ydjy_setl_d_mi_ytai`
(
    `ym`                        varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `clct_grde`                 varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `insutype`                  varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `insu_admdvs`               varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `insu_admdvs_name`          varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `med_type`                  varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `med_type_desc`             varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `fund_pay_sumamt`           decimal(20, 2) NULL DEFAULT NULL,
    `medfee_sumamt`             decimal(20, 2) NULL DEFAULT NULL,
    `hifp_pay`                  decimal(20, 2) NULL DEFAULT NULL,
    `hifob_pay`                 decimal(20, 2) NULL DEFAULT NULL,
    `inscp_amt`                 decimal(20, 2) NULL DEFAULT NULL,
    `cnt_setl`                  bigint(20) NULL DEFAULT NULL,
    `cnt_psn`                   bigint(20) NULL DEFAULT NULL,
    `fund_pay_310100`           decimal(20, 2) NULL DEFAULT NULL,
    `fund_pay_330100`           decimal(20, 2) NULL DEFAULT NULL,
    `fund_pay_390200`           decimal(20, 2) NULL DEFAULT NULL,
    `fund_pay_320100`           decimal(20, 2) NULL DEFAULT NULL,
    `fund_pay_510100`           decimal(20, 2) NULL DEFAULT NULL,
    `fund_pay_610100`           decimal(20, 2) NULL DEFAULT NULL,
    `fund_pay_99999704`         decimal(20, 2) NULL DEFAULT NULL,
    `fund_pay_99999705`         decimal(20, 2) NULL DEFAULT NULL,
    `fund_pay_370100`           decimal(20, 2) NULL DEFAULT NULL,
    `fund_pay_999997`           decimal(20, 2) NULL DEFAULT NULL,
    `fund_pay_350100`           decimal(20, 2) NULL DEFAULT NULL,
    `fund_pay_340100`           decimal(20, 2) NULL DEFAULT NULL,
    `pay_loc`                   varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `fix_blng_admdvs`           varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `fix_blng_admdvs_name`      varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `fix_blng_admdvs_city_code` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `fix_blng_admdvs_city_name` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `fix_blng_province_code`    varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `fix_blng_province_name`    varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `fixmedins_code`            varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `fixmedins_name`            varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `data_flag`                 int(11) NULL DEFAULT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 168997 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dws_cbjf_fund_rsdt_revenue_mi_ytai
-- ----------------------------
DROP TABLE IF EXISTS `dws_cbjf_fund_rsdt_revenue_mi_ytai`;
CREATE TABLE `dws_cbjf_fund_rsdt_revenue_mi_ytai`
(
    `stt_y`          varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年',
    `CLCT_SUMAMT`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '缴费总金额',
    `CLCT_SUMAMT_CR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '缴费总金额环比',
    `CLCT_SUMAMT_SR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '缴费总金额同比',
    `FINSUBS_AMT`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '财补金额',
    `FINSUBS_AMT_CR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '财补金额环比',
    `FINSUBS_AMT_SR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '财补金额同比',
    `COTY`           varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区划',
    `COTY_NAME`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区划名称',
    `PSN_TYPE`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员类别'
) ENGINE = InnoDB AUTO_INCREMENT = 729 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dws_cbjf_fund_staf_revenue_mi_ytai
-- ----------------------------
DROP TABLE IF EXISTS `dws_cbjf_fund_staf_revenue_mi_ytai`;
CREATE TABLE `dws_cbjf_fund_staf_revenue_mi_ytai`
(
    `stt_ym`           varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年月',
    `COTY`             varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区划',
    `CLCT_SUMAMT`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '缴费总金额',
    `CLCT_SUMAMT_CR`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '缴费总金额同比',
    `CLCT_SUMAMT_SR`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '缴费总金额环比',
    `EMP_CLCT_AMT`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位缴费金额',
    `EMP_CLCT_AMT_CR`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位缴费金额环比',
    `EMP_CLCT_AMT_SR`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位缴费金额同比',
    `PSN_CLCT_AMT`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人缴费金额',
    `PSN_CLCT_AMT_CR`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人缴费金额环比',
    `PSN_CLCT_AMT_SR`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人缴费金额同比',
    `INTO_ACCT_AMT`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '划入账户金额',
    `INTO_ACCT_AMT_CR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '划入账户金额环比',
    `INTO_ACCT_AMT_SR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '划入账户金额同比',
    `STT_FUND_INC`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统计基金收入',
    `STT_FUND_INC_CR`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统计基金收入环比',
    `STT_FUND_INC_SR`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统计基金收入同比',

    `COTY_NAME`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区划名称',
    `PSN_TYPE`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员类别',
    `PSN_TYPE_NAME`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员类别名称',

) ENGINE = InnoDB AUTO_INCREMENT = 4908 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dws_cbjf_psn_insu_mi_ytai
-- ----------------------------
DROP TABLE IF EXISTS `dws_cbjf_psn_insu_mi_ytai`;
CREATE TABLE `dws_cbjf_psn_insu_mi_ytai`
(
    `stt_ym`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年月',
    `INSU_PSNCNT`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参保人数',
    `INSU_PSNCNT_CR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参保人数环比',
    `INSU_PSNCNT_SR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参保人数同比',
    `emp_cnt`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位数量',
    `emp_cnt_cr`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位数量环比',
    `emp_cnt_sr`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位数量同比',
    `age_s`          varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄段',
    `age_s_desc`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄段描述',
    `insutype_s`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '险种',
    `psn_type_s`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员分类',
    `type_s`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类',
    `NWB_CNT`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '新生儿数量',
    `BIG_STDT_CNT`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '大学生数量',
    `NEW_INSU_CNT`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '新参保数量',
    `COTY`           varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区划',
    `COTY_NAME`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区划名称'

) ENGINE = InnoDB AUTO_INCREMENT = 17498 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dws_fee_list_d_med_type_sum_yt
-- ----------------------------
DROP TABLE IF EXISTS `dws_fee_list_d_med_type_sum_yt`;
CREATE TABLE `dws_fee_list_d_med_type_sum_yt`
(
    `stt_prd`          varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `med_chrgitm_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `med_type`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `sumamt`           varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 1443 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dws_fee_list_d_med_type_yt
-- ----------------------------
DROP TABLE IF EXISTS `dws_fee_list_d_med_type_yt`;
CREATE TABLE `dws_fee_list_d_med_type_yt`
(
    `stt_prd`          varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `medins_list_codg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `medins_list_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `sumamt`           varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `yoy`              varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `med_type`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `med_chrgitm_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 793471 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dws_jjsz_fee_list_d_pay_mi_ytai
-- ----------------------------
DROP TABLE IF EXISTS `dws_jjsz_fee_list_d_pay_mi_ytai`;
CREATE TABLE `dws_jjsz_fee_list_d_pay_mi_ytai`
(
    `stt_ym`              varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `insu_admdvs`         varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `insutype`            varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `fixmedins_code`      varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `fixmedins_name`      varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `list_type_s_desc`    varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `det_item_fee_sumamt` decimal(16, 2) NULL DEFAULT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 3029644 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dws_jjsz_fee_list_med_type_mi_ytai
-- ----------------------------
DROP TABLE IF EXISTS `dws_jjsz_fee_list_med_type_mi_ytai`;
CREATE TABLE `dws_jjsz_fee_list_med_type_mi_ytai`
(
    `stt_prd`          varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年月',
    `medins_list_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗名称',
    `medins_list_codg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗编码',
    `med_type_desc`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗类别',
    `med_chrgitm_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类别',
    `insu_admdvs`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区划',
    `sumamt`           decimal(65, 2) NULL DEFAULT NULL COMMENT '金额',
    `yoy`              varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '同比',
) ENGINE = InnoDB AUTO_INCREMENT = 11588123 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dws_jjsz_fund_pay_mi_ytai
-- ----------------------------
DROP TABLE IF EXISTS `dws_jjsz_fund_pay_mi_ytai`;
CREATE TABLE `dws_jjsz_fund_pay_mi_ytai`
(
    `setl_amt`               varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结算金额',
    `setl_amt_CR`            varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `setl_amt_SR`            varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `setl_cnt`               varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结算人次',
    `setl_cnt_CR`            varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `setl_cnt_SR`            varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `setl_psn_cnt`           varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结算人数',
    `setl_psn_cnt_without41` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `setl_psn_cnt_CR`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `setl_psn_cnt_SR`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `fixmedins_cnt`          varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗机构数量',
    `fixmedins_cnt_cr`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `fixmedins_cnt_sr`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `fund_pay_sumamt`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '基金支出金额',
    `fund_pay_sumamt_CR`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `fund_pay_sumamt_SR`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `hi_pay_sumamt`          varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统筹基金金额',
    `hi_pay_sumamt_CR`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `hi_pay_sumamt_SR`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `coty`                   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区划',
    `coty_name`              varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区划名称',
    `out_flag`               varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '异地标志',
    `fixmedins_type`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定点类别',
    `insutype`               varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '险种',
    `stt_ym`                 varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 3553 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dws_jjsz_fund_pay_rsdt_year_mi_ytai
-- ----------------------------
DROP TABLE IF EXISTS `dws_jjsz_fund_pay_rsdt_year_mi_ytai`;
CREATE TABLE `dws_jjsz_fund_pay_rsdt_year_mi_ytai`
(
    `setl_amt`           varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结算金额',
    `setl_amt_CR`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `setl_amt_SR`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `setl_cnt`           varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结算人次',
    `setl_cnt_CR`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `setl_cnt_SR`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `setl_psn_cnt`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结算人数',
    `setl_psn_cnt_CR`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `setl_psn_cnt_SR`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `fixmedins_cnt`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗机构数量',
    `fixmedins_cnt_cr`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `fixmedins_cnt_sr`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `fund_pay_sumamt`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '基金支出金额',
    `fund_pay_sumamt_CR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `fund_pay_sumamt_SR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `hi_pay_sumamt`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统筹基金金额',
    `hi_pay_sumamt_CR`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `hi_pay_sumamt_SR`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `coty`               varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区划',
    `coty_name`          varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区划名称',
    `out_flag`           varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '异地标志',
    `fixmedins_type`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定点类别',
    `insutype`           varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '险种',
    `stt_ym`             varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 94 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dws_jjsz_hosp_rank_pay_mi_ytai
-- ----------------------------
DROP TABLE IF EXISTS `dws_jjsz_hosp_rank_pay_mi_ytai`;
CREATE TABLE `dws_jjsz_hosp_rank_pay_mi_ytai`
(
    `stt_ym`          varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `insutype`        varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `insu_admdvs`     varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `med_type_desc`   varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `fixmedins_code`  varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `fixmedins_name`  varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `medfee_sumamt`   decimal(16, 2) NULL DEFAULT NULL,
    `fund_pay_sumamt` decimal(16, 2) NULL DEFAULT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 3488023 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dws_jjsz_setl_d_pay_mi_ytai
-- ----------------------------
DROP TABLE IF EXISTS `dws_jjsz_setl_d_pay_mi_ytai`;
CREATE TABLE `dws_jjsz_setl_d_pay_mi_ytai`
(
    `stt_ym`          varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `clct_grde`       varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `insutype`        varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `insu_admdvs`     varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `fixmedins_type`  varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `med_type_desc`   varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `fund_pay_sumamt` decimal(16, 2) NULL DEFAULT NULL,
    `medfee_sumamt`   decimal(16, 2) NULL DEFAULT NULL,
    `hifp_pay`        decimal(16, 2) NULL DEFAULT NULL,
    `hifob_pay`       decimal(16, 2) NULL DEFAULT NULL,
    `inscp_amt`       decimal(16, 2) NULL DEFAULT NULL,
    `cnt_setl`        decimal(16, 0) NULL DEFAULT NULL,
    `cnt_psn`         decimal(16, 0) NULL DEFAULT NULL,
    `统筹基金`        decimal(16, 2) NULL DEFAULT NULL,
    `大额基金`        decimal(16, 2) NULL DEFAULT NULL,
    `大病基金`        decimal(16, 2) NULL DEFAULT NULL,
    `公务员基金`      decimal(16, 2) NULL DEFAULT NULL,
    `生育基金`        decimal(16, 2) NULL DEFAULT NULL,
    `救助基金`        decimal(16, 2) NULL DEFAULT NULL,
    `优抚基金`        decimal(16, 2) NULL DEFAULT NULL,
    `扶贫基金`        decimal(16, 2) NULL DEFAULT NULL,
    `企补基金`        decimal(16, 2) NULL DEFAULT NULL,
    `其他基金`        decimal(16, 2) NULL DEFAULT NULL,
    `二乙基金`        decimal(16, 2) NULL DEFAULT NULL,
    `离休基金`        decimal(16, 2) NULL DEFAULT NULL,
    `pay_loc`         varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `fix_blng_admdvs` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `flag`            varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 363736 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dws_outmed_setl_d_yt
-- ----------------------------
DROP TABLE IF EXISTS `dws_outmed_setl_d_yt`;
CREATE TABLE `dws_outmed_setl_d_yt`
(
    `stt_prd`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `insutype`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `med_type`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `medfee_sumamt`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `fund_pay_sumamt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `inscp_amt`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 202 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dws_outmed_setl_info
-- ----------------------------
DROP TABLE IF EXISTS `dws_outmed_setl_info`;
CREATE TABLE `dws_outmed_setl_info`
(
    `setl_cnt`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `out_setl_cnt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `stt_prd`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `pay_loc`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 123 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dws_setl_d_fixmedins_type
-- ----------------------------
DROP TABLE IF EXISTS `dws_setl_d_fixmedins_type`;
CREATE TABLE `dws_setl_d_fixmedins_type`
(
    `fixmedins_cnt`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `setl_cnt`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `medfee_sumamt`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `fund_pay_sumamt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `hifp_pay`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `fixmedins_type`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `stt_prd`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 71 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fct0_emp_clct
-- ----------------------------
DROP TABLE IF EXISTS `fct0_emp_clct`;
CREATE TABLE `fct0_emp_clct`
(
    `emp_count` int(12) NULL DEFAULT NULL,
    `stt_ym`    varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 315 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fct0_psn_insu_age
-- ----------------------------
DROP TABLE IF EXISTS `fct0_psn_insu_age`;
CREATE TABLE `fct0_psn_insu_age`
(
    `psn_no`   varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `insutype` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `psn_type` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `brdy`     date NULL DEFAULT NULL,
    `gend`     varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `stt_ym`   varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fct0_psn_insu_count_by_crtym
-- ----------------------------
DROP TABLE IF EXISTS `fct0_psn_insu_count_by_crtym`;
CREATE TABLE `fct0_psn_insu_count_by_crtym`
(
    `insutype`      varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `psn_type`      varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `psn_insu_stas` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `psncount`      int(10) NULL DEFAULT NULL,
    `crt_insu_ym`   varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `paus_insu_ym`  varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `insu_admdvs`   varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `surv_stas`     varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 28965 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fct0_staf_clct
-- ----------------------------
DROP TABLE IF EXISTS `fct0_staf_clct`;
CREATE TABLE `fct0_staf_clct`
(
    `psn_count`   int(12) NULL DEFAULT NULL,
    `stt_ym`      varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `psn_type`    varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `poolarea_no` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 6329 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fct0_staf_clct_sum
-- ----------------------------
DROP TABLE IF EXISTS `fct0_staf_clct_sum`;
CREATE TABLE `fct0_staf_clct_sum`
(
    `stt_ym`    varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `admdvs`    varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `INSUTYPE`  varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `psn_count` int(12) NULL DEFAULT NULL,
    `CLCT_SUMAMT` double (30, 6) NULL DEFAULT NULL,
    `EMP_CLCT_AMT` double (30, 6) NULL DEFAULT NULL,
    `EMP_CLCT_INTO_ACCT_AMT` double (30, 6) NULL DEFAULT NULL,
    `PSN_CLCT_AMT` double (30, 6) NULL DEFAULT NULL,
    `PSN_CLCT_INTO_ACCT_AMT` double (30, 6) NULL DEFAULT NULL,
    `FINSUBS_AMT` double (30, 6) NULL DEFAULT NULL,
    `FINSUBS_TRAF_AMT` double (30, 6) NULL DEFAULT NULL,
    `TRAF_SUMAMT` double (30, 6) NULL DEFAULT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 18590 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fct2_psn_insu_age
-- ----------------------------
DROP TABLE IF EXISTS `fct2_psn_insu_age`;
CREATE TABLE `fct2_psn_insu_age`
(
    `stt_ym`      varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `insutype`    varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `psn_type`    varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `age0_18`     int(12) NULL DEFAULT NULL,
    `age19_50`    int(12) NULL DEFAULT NULL,
    `age51_60`    int(12) NULL DEFAULT NULL,
    `age61_70`    int(12) NULL DEFAULT NULL,
    `age71`       int(12) NULL DEFAULT NULL,
    `poolarea_no` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 36641 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fct2_psn_insu_age_copy1
-- ----------------------------
DROP TABLE IF EXISTS `fct2_psn_insu_age_copy1`;
CREATE TABLE `fct2_psn_insu_age_copy1`
(
    `stt_ym`   varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `insutype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `psn_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `age0_18`  int(12) NULL DEFAULT NULL,
    `age19_50` int(12) NULL DEFAULT NULL,
    `age51_60` int(12) NULL DEFAULT NULL,
    `age61_70` int(12) NULL DEFAULT NULL,
    `age71`    int(12) NULL DEFAULT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 8192 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fct2_psn_insu_age_copy2
-- ----------------------------
DROP TABLE IF EXISTS `fct2_psn_insu_age_copy2`;
CREATE TABLE `fct2_psn_insu_age_copy2`
(
    `stt_ym`      varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `insutype`    varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `psn_type`    varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `age0_18`     int(12) NULL DEFAULT NULL,
    `age19_50`    int(12) NULL DEFAULT NULL,
    `age51_60`    int(12) NULL DEFAULT NULL,
    `age61_70`    int(12) NULL DEFAULT NULL,
    `age71`       int(12) NULL DEFAULT NULL,
    `poolarea_no` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 65536 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fct3_clct_psncnt_admdvs
-- ----------------------------
DROP TABLE IF EXISTS `fct3_clct_psncnt_admdvs`;
CREATE TABLE `fct3_clct_psncnt_admdvs`
(
    `STT_YM`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年月',
    `ADMDVS_NAME`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统筹区',
    `PSNCNT` double NULL DEFAULT NULL COMMENT '参保缴费人数',
    `PSNCNT_310` double NULL DEFAULT NULL COMMENT '职工参保人数',
    `PSNCNT_390` double NULL DEFAULT NULL COMMENT '居民参保人数',
    `EMPCNT` double NULL DEFAULT NULL COMMENT '参保单位数',
    `RATE`          float NULL DEFAULT NULL COMMENT '在职退休比',
    `admdvs_desc`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `ly_psncnt`     int(11) NULL DEFAULT NULL,
    `ly_psncnt_310` int(11) NULL DEFAULT NULL,
    `ly_psncnt_390` int(11) NULL DEFAULT NULL,
    `ly_empcnt`     int(11) NULL DEFAULT NULL,
    `ly_rate` double NULL DEFAULT NULL,
    `admdvs_city`   varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `admdvs_perm`   varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 7496 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参保缴费-统筹区人数及单位数情况' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fct3_clct_psncnt_dxs
-- ----------------------------
DROP TABLE IF EXISTS `fct3_clct_psncnt_dxs`;
CREATE TABLE `fct3_clct_psncnt_dxs`
(
    `STT_YY`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '毕业年',
    `PSNCNT_BY`   int(11) NULL DEFAULT NULL COMMENT '毕业人数',
    `PSNCNT_0`    int(11) NULL DEFAULT NULL COMMENT '当年留存参保人数',
    `PSNCNT_1`    int(11) NULL DEFAULT NULL COMMENT '1年留存参保人数',
    `PSNCNT_2`    int(11) NULL DEFAULT NULL COMMENT '2年留存参保人数',
    `PSNCNT_3`    int(11) NULL DEFAULT NULL COMMENT '3年留存参保人数',
    `PSNCNT_LC`   int(11) NULL DEFAULT NULL COMMENT '留存参保人数',
    `poolarea_no` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参保缴费-大学生参保及留存情况' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fct3_clct_psncnt_dxs_copy1
-- ----------------------------
DROP TABLE IF EXISTS `fct3_clct_psncnt_dxs_copy1`;
CREATE TABLE `fct3_clct_psncnt_dxs_copy1`
(
    `STT_YY`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '毕业年',
    `PSNCNT_BY`   int(11) NULL DEFAULT NULL COMMENT '毕业人数',
    `PSNCNT_0`    int(11) NULL DEFAULT NULL COMMENT '当年留存参保人数',
    `PSNCNT_1`    int(11) NULL DEFAULT NULL COMMENT '1年留存参保人数',
    `PSNCNT_2`    int(11) NULL DEFAULT NULL COMMENT '2年留存参保人数',
    `PSNCNT_3`    int(11) NULL DEFAULT NULL COMMENT '3年留存参保人数',
    `PSNCNT_LC`   int(11) NULL DEFAULT NULL COMMENT '留存参保人数',
    `poolarea_no` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参保缴费-大学生参保及留存情况' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fct3_clr_fund
-- ----------------------------
DROP TABLE IF EXISTS `fct3_clr_fund`;
CREATE TABLE `fct3_clr_fund`
(
    `CLR_TYPE_DESC` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `CLR_PSNTIME`   int(12) NULL DEFAULT NULL,
    `MEDFEE_SUMAMT` double (20, 2) NULL DEFAULT NULL,
    `FUND_APPY_SUM` double (20, 2) NULL DEFAULT NULL,
    `DFR_AMT` double (20, 2) NULL DEFAULT NULL,
    `ACT_DFR_AMT` double (20, 2) NULL DEFAULT NULL,
    `ADMDVS_CITY`   varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `ADMDVS_PERM`   varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `STT_YM`        varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 821 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fct3_fund_pay_dccylbz
-- ----------------------------
DROP TABLE IF EXISTS `fct3_fund_pay_dccylbz`;
CREATE TABLE `fct3_fund_pay_dccylbz`
(
    `STT_YM`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年月',
    `MED_TYPE_VAL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗类别',
    `INSUTYPE`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '险种',
    `SETL_TIMECNT` double NULL DEFAULT NULL COMMENT '结算人次',
    `MEDFEE_SUMAMT` double NULL DEFAULT NULL COMMENT '医疗总费用',
    `INSCP_AMT` double NULL DEFAULT NULL COMMENT '符合范围金额',
    `P_QUANKOUJING` double NULL DEFAULT NULL COMMENT '全口径报销比',
    `P_FANWEINEI` double NULL DEFAULT NULL COMMENT '范围内报销比',
    `FUND_PAY_SUMAMT` double NULL DEFAULT NULL COMMENT '基金支出总额',
    `HIFP_PAY` double NULL DEFAULT NULL COMMENT '统筹支出',
    `HIFOB_PAY` double NULL DEFAULT NULL COMMENT '大额基金支出',
    `HIFMI_PAY` double NULL DEFAULT NULL COMMENT '大病基金支出',
    `CVLSERV_PAY` double NULL DEFAULT NULL COMMENT '公补基金',
    `MAF_PAY` double NULL DEFAULT NULL COMMENT '医疗救助基金支出',
    `HIFES_PAY` double NULL DEFAULT NULL COMMENT '补充医疗保险',
    `OTHFUND_PAY` double NULL DEFAULT NULL COMMENT '其他基金支出',
    `TB_SETL_TIMECNT` double NULL DEFAULT NULL COMMENT '结算人次同比',
    `TB_MEDFEE_SUMAMT` double NULL DEFAULT NULL COMMENT '医疗总费用同比',
    `TB_INSCP_AMT` double NULL DEFAULT NULL COMMENT '符合范围金额同比',
    `TB_P_QUANKOUJING` double NULL DEFAULT NULL COMMENT '全口径报销比同比',
    `TB_P_FANWEINEI` double NULL DEFAULT NULL COMMENT '范围内报销比同比',
    `TB_FUND_PAY_SUMAMT` double NULL DEFAULT NULL COMMENT '基金支出总额同比',
    `TB_HIFP_PAY` double NULL DEFAULT NULL COMMENT '统筹支出同比',
    `TB_HIFOB_PAY` double NULL DEFAULT NULL COMMENT '大额基金支出同比',
    `TB_HIFMI_PAY` double NULL DEFAULT NULL COMMENT '大病基金支出同比',
    `TB_CVLSERV_PAY` double NULL DEFAULT NULL COMMENT '公补基金同比',
    `TB_MAF_PAY` double NULL DEFAULT NULL COMMENT '医疗救助基金支出同比',
    `TB_HIFES_PAY` double NULL DEFAULT NULL COMMENT '补充医疗保险同比',
    `TB_OTHFUND_PAY` double NULL DEFAULT NULL COMMENT '其他基金支出同比',
    `ADMDVS_CITY`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `ADMDVS_PERM`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 8751 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '全景图-多层次医疗保障' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fct3_fund_pay_fee_list_drug
-- ----------------------------
DROP TABLE IF EXISTS `fct3_fund_pay_fee_list_drug`;
CREATE TABLE `fct3_fund_pay_fee_list_drug`
(
    `STT_YM`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年月',
    `INSUTYPE`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '险种',
    `LIST_TYPE_VAL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '目录类别',
    `DET_ITEM_FEE_SUMAMT` double NULL DEFAULT NULL COMMENT '费用',
    `P_DET_ITEM_FEE_SUMAMT` double NULL DEFAULT NULL COMMENT '费用占比',
    `ADMDVS_CITY`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `ADMDVS_PERM`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 6329 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '基金支出-费用构成-药品情况' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fct3_fund_pay_fee_list_mcs
-- ----------------------------
DROP TABLE IF EXISTS `fct3_fund_pay_fee_list_mcs`;
CREATE TABLE `fct3_fund_pay_fee_list_mcs`
(
    `STT_YM`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年月',
    `INSUTYPE`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '险种',
    `MCS_TYPE_VAL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '耗材类别',
    `DET_ITEM_FEE_SUMAMT` double NULL DEFAULT NULL COMMENT '费用',
    `P_DET_ITEM_FEE_SUMAMT` double NULL DEFAULT NULL COMMENT '费用占比',
    `ADMDVS_CITY`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `ADMDVS_PERM`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 1326 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '基金支出-费用构成-耗材情况' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fct3_fund_pay_fee_list_ser
-- ----------------------------
DROP TABLE IF EXISTS `fct3_fund_pay_fee_list_ser`;
CREATE TABLE `fct3_fund_pay_fee_list_ser`
(
    `STT_YM`               varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年月',
    `INSUTYPE`             varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '险种',
    `MED_CHRGITM_TYPE_VAL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗服务项目',
    `DET_ITEM_FEE_SUMAMT` double NULL DEFAULT NULL COMMENT '费用',
    `P_DET_ITEM_FEE_SUMAMT` double NULL DEFAULT NULL COMMENT '费用占比',
    `ADMDVS_CITY`          varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `ADMDVS_PERM`          varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 5912 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '基金支出-费用构成-医疗服务项目情况' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fct3_fund_pay_fee_yt
-- ----------------------------
DROP TABLE IF EXISTS `fct3_fund_pay_fee_yt`;
CREATE TABLE `fct3_fund_pay_fee_yt`
(
    `DET_ITEM_FEE_SUMAMT` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `stt_prd`             varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `insu_admdvs`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `list_type`           varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `insutype`            varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 7897 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fct3_fund_pay_fixmedins_yt
-- ----------------------------
DROP TABLE IF EXISTS `fct3_fund_pay_fixmedins_yt`;
CREATE TABLE `fct3_fund_pay_fixmedins_yt`
(
    `SETL_PSNCNT`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `SETL_CNT`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `sumamt`          varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `fund_pay_sumamt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `acct_pay`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `cash_payamt`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `INSCP_AMT`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `TYPE`            varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `stt_prd`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `insu_admdvs`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `insutype`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 968 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fct3_fund_pay_gl
-- ----------------------------
DROP TABLE IF EXISTS `fct3_fund_pay_gl`;
CREATE TABLE `fct3_fund_pay_gl`
(
    `STT_YM`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年月',
    `GL_FLAG`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公立非公立',
    `INSUTYPE`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '险种',
    `P_SETL_TIMECNT` double NULL DEFAULT NULL COMMENT '人次占比',
    `P_MEDFEE_SUMAMT` double NULL DEFAULT NULL COMMENT '费用占比',
    `P_FUND_PAY_SUMAMT` double NULL DEFAULT NULL COMMENT '基金支出占比',
    `P_MEDFEE_SUMAMT_PSNTIME` double NULL DEFAULT NULL COMMENT '次均费用',
    `P_HIFP_PAY_PSNTIME` double NULL DEFAULT NULL COMMENT '次均统筹',
    `P_QUANKOUJING` double NULL DEFAULT NULL COMMENT '全口径报销比',
    `P_FANWEINEI` double NULL DEFAULT NULL COMMENT '范围内报销比',
    `ADMDVS_CITY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `ADMDVS_PERM` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 2879 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '基金支出-公立非公立' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fct3_fund_pay_hosplv
-- ----------------------------
DROP TABLE IF EXISTS `fct3_fund_pay_hosplv`;
CREATE TABLE `fct3_fund_pay_hosplv`
(
    `STT_YM`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年月',
    `HOSP_LV_VAL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医院等级',
    `INSUTYPE`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '险种',
    `P_SETL_TIMECNT` double NULL DEFAULT NULL COMMENT '人次占比',
    `P_MEDFEE_SUMAMT` double NULL DEFAULT NULL COMMENT '费用占比',
    `P_FUND_PAY_SUMAMT` double NULL DEFAULT NULL COMMENT '基金支出占比',
    `P_MEDFEE_SUMAMT_PSNTIME` double NULL DEFAULT NULL COMMENT '次均费用',
    `P_HIFP_PAY_PSNTIME` double NULL DEFAULT NULL COMMENT '次均统筹',
    `P_QUANKOUJING` double NULL DEFAULT NULL COMMENT '全口径报销比',
    `P_FANWEINEI` double NULL DEFAULT NULL COMMENT '范围内报销比',
    `ADMDVS_CITY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `ADMDVS_PERM` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 180 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '基金支出-医院等级' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fct3_fund_pay_hosplv_yt
-- ----------------------------
DROP TABLE IF EXISTS `fct3_fund_pay_hosplv_yt`;
CREATE TABLE `fct3_fund_pay_hosplv_yt`
(
    `SETL_PSNCNT`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `SETL_CNT`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `sumamt`          varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `fund_pay_sumamt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `acct_pay`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `cash_payamt`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `INSCP_AMT`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `stt_prd`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `insu_admdvs`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `hosp_lv`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `insutype`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 540 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fct3_fund_pay_insutype
-- ----------------------------
DROP TABLE IF EXISTS `fct3_fund_pay_insutype`;
CREATE TABLE `fct3_fund_pay_insutype`
(
    `STT_YM`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年月',
    `INSUTYPE`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '险种',
    `SETL_TIMECNT` double NULL DEFAULT NULL COMMENT '人次',
    `MEDFEE_SUMAMT` double NULL DEFAULT NULL COMMENT '医疗总费用',
    `INSCP_AMT` double NULL DEFAULT NULL COMMENT '符合范围金额',
    `FUND_PAY_SUMAMT` double NULL DEFAULT NULL COMMENT '基金支出总额',
    `HIFP_PAY` double NULL DEFAULT NULL COMMENT '统筹支出',
    `PSN_PAY` double NULL DEFAULT NULL COMMENT '个人支付',
    `FULAMT_OWNPAY_AMT` double NULL DEFAULT NULL COMMENT '全自费费用',
    `P_IPT_MEDFEE_SUMAMT_PSNTIME` double NULL DEFAULT NULL COMMENT '次均住院费用',
    `P_IPT_PSN_PAY_PSNTIME` double NULL DEFAULT NULL COMMENT '次均住院个人支付',
    `P_QUANKOUJING` double NULL DEFAULT NULL COMMENT '全口径报销比',
    `P_FANWEINEI` double NULL DEFAULT NULL COMMENT '范围内报销比',
    `admdvs_city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `admdvs_perm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `ipt_setl_timecnt` double NULL DEFAULT NULL,
    `ipt_medfee_sumamt` double NULL DEFAULT NULL,
    `ipt_psn_pay` double NULL DEFAULT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 403 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '基金支出-险种趋势' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fct3_fund_pay_medins_type
-- ----------------------------
DROP TABLE IF EXISTS `fct3_fund_pay_medins_type`;
CREATE TABLE `fct3_fund_pay_medins_type`
(
    `STT_YM`          varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年月',
    `MEDINS_TYPE_VAL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医院类别',
    `INSUTYPE`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '险种',
    `P_SETL_TIMECNT` double NULL DEFAULT NULL COMMENT '人次占比',
    `P_MEDFEE_SUMAMT` double NULL DEFAULT NULL COMMENT '费用占比',
    `P_FUND_PAY_SUMAMT` double NULL DEFAULT NULL COMMENT '基金支出占比',
    `P_MEDFEE_SUMAMT_PSNTIME` double NULL DEFAULT NULL COMMENT '次均费用',
    `P_HIFP_PAY_PSNTIME` double NULL DEFAULT NULL COMMENT '次均统筹',
    `P_QUANKOUJING` double NULL DEFAULT NULL COMMENT '全口径报销比',
    `P_FANWEINEI` double NULL DEFAULT NULL COMMENT '范围内报销比',
    `ADMDVS_CITY`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `ADMDVS_PERM`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 12564 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '基金支出-医院类别' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fct3_fund_pay_rylb
-- ----------------------------
DROP TABLE IF EXISTS `fct3_fund_pay_rylb`;
CREATE TABLE `fct3_fund_pay_rylb`
(
    `STT_YM`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年月',
    `TYPE`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类别',
    `SETL_PSNCNT` double NULL DEFAULT NULL COMMENT '结算人数',
    `SETL_TIMECNT` double NULL DEFAULT NULL COMMENT '结算人次',
    `MEDFEE_SUMAMT` double NULL DEFAULT NULL COMMENT '医疗总费用',
    `FUND_PAY_SUMAMT` double NULL DEFAULT NULL COMMENT '基金支出总额',
    `P_MEDFEE_SUMAMT_PSNTIME` double NULL DEFAULT NULL COMMENT '次均费用',
    `P_FUND_PAY_SUMAMT_PSNTIME` double NULL DEFAULT NULL COMMENT '次均基金支出',
    `P_QUANKOUJING` double NULL DEFAULT NULL COMMENT '全口径报销比',
    `P_FANWEINEI` double NULL DEFAULT NULL COMMENT '范围内报销比',
    `P_IPT_DAYS_PSNTIME` double NULL DEFAULT NULL COMMENT '次均住院天数',
    `admdvs_city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `admdvs_perm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 2210 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '基金支出-险种&人员类别' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fct3_fund_pay_yt
-- ----------------------------
DROP TABLE IF EXISTS `fct3_fund_pay_yt`;
CREATE TABLE `fct3_fund_pay_yt`
(
    `SETL_PSNCNT`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `SETL_CNT`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `sumamt`          varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `fund_pay_sumamt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `acct_pay`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `cash_payamt`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `INSCP_AMT`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `insutype`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `psn_type`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `ipt_days`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `stt_prd`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `admdvs`          varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 5294 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fct3_fundsz_szqs
-- ----------------------------
DROP TABLE IF EXISTS `fct3_fundsz_szqs`;
CREATE TABLE `fct3_fundsz_szqs`
(
    `STT_YM`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年月',
    `INSUTYPE`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '险种',
    `CLCT_SUMAMT` double NULL DEFAULT NULL COMMENT '缴费总额',
    `CLCT_SUMAMT_GR` double NULL DEFAULT NULL COMMENT '个人缴费',
    `CLCT_SUMAMT_CZ` double NULL DEFAULT NULL COMMENT '财政补助',
    `CLCT_SUMAMT_TC` double NULL DEFAULT NULL COMMENT '统筹基金',
    `CLCT_SUMAMT_GZ` double NULL DEFAULT NULL COMMENT '个人账户',
    `P_CLCT_SUMAMT_GZ` double NULL DEFAULT NULL COMMENT '个人账户占比',
    `P_CLCT_SUMAMT_CZ` double NULL DEFAULT NULL COMMENT '财政补助占比',
    `P_CLCT_SUMAMT_PSNCNT` double NULL DEFAULT NULL COMMENT '人均缴费金额',
    `P_CLCT_SUMAMT_PSNCNT_SR` double NULL DEFAULT NULL COMMENT '人均缴费金额/可支配收入',
    `TB_CLCT_SUMAMT` double NULL DEFAULT NULL COMMENT '缴费金额同比',
    `ACT_DFR_AMT` double NULL DEFAULT NULL COMMENT '实际拨付金额',
    `P_ACT_DFR_AMT_PSNCNT` double NULL DEFAULT NULL COMMENT '人均实际拨付金额',
    `P_ACT_DFR_AMT_PSNCNT_ZC` double NULL DEFAULT NULL COMMENT '人均实际拨付金额/人均消费支出',
    `TB_ACT_DFR_AMT` double NULL DEFAULT NULL COMMENT '实际拨付金额同比',
    `JIEYU` double NULL DEFAULT NULL COMMENT '当期结余',
    `P_JIEYU` double NULL DEFAULT NULL COMMENT '结余率',
    `TB_P_JIEYU` double NULL DEFAULT NULL COMMENT '结余率同比',
    `admdvs_city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `admdvs_perm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 1057 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '基金收支-基金收支及趋势情况' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fct3_fundsz_szqs_240527
-- ----------------------------
DROP TABLE IF EXISTS `fct3_fundsz_szqs_240527`;
CREATE TABLE `fct3_fundsz_szqs_240527`
(
    `STT_YM`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年月',
    `INSUTYPE`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '险种',
    `CLCT_SUMAMT` double NULL DEFAULT NULL COMMENT '缴费总额',
    `CLCT_SUMAMT_GR` double NULL DEFAULT NULL COMMENT '个人缴费',
    `CLCT_SUMAMT_CZ` double NULL DEFAULT NULL COMMENT '财政补助',
    `CLCT_SUMAMT_TC` double NULL DEFAULT NULL COMMENT '统筹基金',
    `CLCT_SUMAMT_GZ` double NULL DEFAULT NULL COMMENT '个人账户',
    `P_CLCT_SUMAMT_GZ` double NULL DEFAULT NULL COMMENT '个人账户占比',
    `P_CLCT_SUMAMT_CZ` double NULL DEFAULT NULL COMMENT '财政补助占比',
    `P_CLCT_SUMAMT_PSNCNT` double NULL DEFAULT NULL COMMENT '人均缴费金额',
    `P_CLCT_SUMAMT_PSNCNT_SR` double NULL DEFAULT NULL COMMENT '人均缴费金额/可支配收入',
    `TB_CLCT_SUMAMT` double NULL DEFAULT NULL COMMENT '缴费金额同比',
    `ACT_DFR_AMT` double NULL DEFAULT NULL COMMENT '实际拨付金额',
    `P_ACT_DFR_AMT_PSNCNT` double NULL DEFAULT NULL COMMENT '人均实际拨付金额',
    `P_ACT_DFR_AMT_PSNCNT_ZC` double NULL DEFAULT NULL COMMENT '人均实际拨付金额/人均消费支出',
    `TB_ACT_DFR_AMT` double NULL DEFAULT NULL COMMENT '实际拨付金额同比',
    `JIEYU` double NULL DEFAULT NULL COMMENT '当期结余',
    `P_JIEYU` double NULL DEFAULT NULL COMMENT '结余率',
    `TB_P_JIEYU` double NULL DEFAULT NULL COMMENT '结余率同比',
    `admdvs_city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `admdvs_perm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 1024 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '基金收支-基金收支及趋势情况' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fct3_fundsz_szqs_copy1
-- ----------------------------
DROP TABLE IF EXISTS `fct3_fundsz_szqs_copy1`;
CREATE TABLE `fct3_fundsz_szqs_copy1`
(
    `STT_YM`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年月',
    `INSUTYPE`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '险种',
    `CLCT_SUMAMT` double NULL DEFAULT NULL COMMENT '缴费总额',
    `CLCT_SUMAMT_GR` double NULL DEFAULT NULL COMMENT '个人缴费',
    `CLCT_SUMAMT_CZ` double NULL DEFAULT NULL COMMENT '财政补助',
    `CLCT_SUMAMT_TC` double NULL DEFAULT NULL COMMENT '统筹基金',
    `CLCT_SUMAMT_GZ` double NULL DEFAULT NULL COMMENT '个人账户',
    `P_CLCT_SUMAMT_GZ` double NULL DEFAULT NULL COMMENT '个人账户占比',
    `P_CLCT_SUMAMT_CZ` double NULL DEFAULT NULL COMMENT '财政补助占比',
    `P_CLCT_SUMAMT_PSNCNT` double NULL DEFAULT NULL COMMENT '人均缴费金额',
    `P_CLCT_SUMAMT_PSNCNT_SR` double NULL DEFAULT NULL COMMENT '人均缴费金额/可支配收入',
    `TB_CLCT_SUMAMT` double NULL DEFAULT NULL COMMENT '缴费金额同比',
    `ACT_DFR_AMT` double NULL DEFAULT NULL COMMENT '实际拨付金额',
    `P_ACT_DFR_AMT_PSNCNT` double NULL DEFAULT NULL COMMENT '人均实际拨付金额',
    `P_ACT_DFR_AMT_PSNCNT_ZC` double NULL DEFAULT NULL COMMENT '人均实际拨付金额/人均消费支出',
    `TB_ACT_DFR_AMT` double NULL DEFAULT NULL COMMENT '实际拨付金额同比',
    `JIEYU` double NULL DEFAULT NULL COMMENT '当期结余',
    `P_JIEYU` double NULL DEFAULT NULL COMMENT '结余率',
    `TB_P_JIEYU` double NULL DEFAULT NULL COMMENT '结余率同比',
    `admdvs_city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `admdvs_perm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 1024 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '基金收支-基金收支及趋势情况' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fct3_insu_mat_xh
-- ----------------------------
DROP TABLE IF EXISTS `fct3_insu_mat_xh`;
CREATE TABLE `fct3_insu_mat_xh`
(
    `STT_YM`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年月',
    `MAT_DIC` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗救助身份',
    `ID` double NULL DEFAULT NULL COMMENT '排序'
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参保缴费-医疗救助身份名称' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fct3_insu_psncnt_310
-- ----------------------------
DROP TABLE IF EXISTS `fct3_insu_psncnt_310`;
CREATE TABLE `fct3_insu_psncnt_310`
(
    `STT_YM`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `PSNCNT` double NULL DEFAULT NULL COMMENT '参保缴费人数',
    `PSNCNT_ZZ` double NULL DEFAULT NULL COMMENT '参保缴费人数-在职',
    `PSNCNT_TX` double NULL DEFAULT NULL COMMENT '参保缴费人数-退休',
    `RATE` double NULL DEFAULT NULL COMMENT '在职退休比',
    `CLCT_SUMAMT` double NULL DEFAULT NULL COMMENT '缴费金额',
    `CLCT_SUMAMT_GR` double NULL DEFAULT NULL COMMENT '个人缴费',
    `CLCT_SUMAMT_DW` double NULL DEFAULT NULL COMMENT '单位缴费',
    `CLCT_SUMAMT_TC` double NULL DEFAULT NULL COMMENT '统筹基金',
    `CLCT_SUMAMT_GZ` double NULL DEFAULT NULL COMMENT '个人账户',
    `P_CLCT_SUMAMT_PSNCNT` double NULL DEFAULT NULL COMMENT '人均缴费金额',
    `P_CLCT_SUMAMT_PSNCNT_SR` double NULL DEFAULT NULL COMMENT '人均缴费金额/可支配收入',
    `EMPCNT` double NULL DEFAULT NULL COMMENT '参保缴费单位数',
    `TB_PSNCNT` double NULL DEFAULT NULL COMMENT '参保缴费人数同比',
    `TB_PSNCNT_ZZ` double NULL DEFAULT NULL COMMENT '参保缴费人数-在职同比',
    `TB_PSNCNT_TX` double NULL DEFAULT NULL COMMENT '参保缴费人数-退休同比',
    `TB_RATE` double NULL DEFAULT NULL COMMENT '在职退休比同比',
    `TB_CLCT_SUMAMT` double NULL DEFAULT NULL COMMENT '缴费金额同比',
    `TB_CLCT_SUMAMT_GR` double NULL DEFAULT NULL COMMENT '个人缴费同比',
    `TB_CLCT_SUMAMT_DW` double NULL DEFAULT NULL COMMENT '单位缴费同比',
    `TB_CLCT_SUMAMT_TC` double NULL DEFAULT NULL COMMENT '统筹基金同比',
    `TB_CLCT_SUMAMT_GZ` double NULL DEFAULT NULL COMMENT '个人账户同比',
    `TB_P_CLCT_SUMAMT_PSNCNT` double NULL DEFAULT NULL COMMENT '人均缴费金额同比',
    `TB_P_CLCT_SUMAMT_PSNCNT_SR` double NULL DEFAULT NULL COMMENT '人均缴费金额/可支配收入同比',
    `TB_EMPCNT` double NULL DEFAULT NULL COMMENT '参保缴费单位数同比',
    `admdvs_city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `admdvs_perm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 8288 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fct3_insu_psncnt_390
-- ----------------------------
DROP TABLE IF EXISTS `fct3_insu_psncnt_390`;
CREATE TABLE `fct3_insu_psncnt_390`
(
    `STT_YM`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年月',
    `PSNCNT` double NULL DEFAULT NULL COMMENT '参保缴费人数',
    `PSNCNT_XSE` double NULL DEFAULT NULL COMMENT '新生儿参保人数',
    `P_PSNCNT_XSE` double NULL DEFAULT NULL COMMENT '新生儿参保占比',
    `P_PSNCNT_ZXXS` double NULL DEFAULT NULL COMMENT '中小学生参保人数占比',
    `P_PSNCNT_DXS` double NULL DEFAULT NULL COMMENT '大学生参保人数占比',
    `P_PSNCNT_CNR` double NULL DEFAULT NULL COMMENT '成年人参保人数占比',
    `P_PSNCNT_LNR` double NULL DEFAULT NULL COMMENT '老年人参保人数占比',
    `PSNCNT_YLJZ` double NULL DEFAULT NULL COMMENT '医疗救助参保人数',
    `PSNCNT_YLJZ1` double NULL DEFAULT NULL COMMENT '医疗救助参保人数1',
    `PSNCNT_YLJZ2` double NULL DEFAULT NULL COMMENT '医疗救助参保人数2',
    `PSNCNT_YLJZ3` double NULL DEFAULT NULL COMMENT '医疗救助参保人数3',
    `PSNCNT_YLJZ4` double NULL DEFAULT NULL COMMENT '医疗救助参保人数4',
    `PSNCNT_YLJZ5` double NULL DEFAULT NULL COMMENT '医疗救助参保人数5',
    `PSNCNT_YLJZ6` double NULL DEFAULT NULL COMMENT '医疗救助参保人数6',
    `CLCT_SUMAMT` double NULL DEFAULT NULL COMMENT '缴费金额',
    `CLCT_SUMAMT_GR` double NULL DEFAULT NULL COMMENT '个人缴费',
    `CLCT_SUMAMT_CZ` double NULL DEFAULT NULL COMMENT '财政补助',
    `P_CLCT_SUMAMT_PSNCNT` double NULL DEFAULT NULL COMMENT '人均缴费金额',
    `P_CLCT_SUMAMT_PSNCNT_SR` double NULL DEFAULT NULL COMMENT '人均缴费金额/可支配收入',
    `TB_PSNCNT` double NULL DEFAULT NULL COMMENT '参保缴费人数同比',
    `TB_CLCT_SUMAMT` double NULL DEFAULT NULL COMMENT '缴费金额同比',
    `TB_CLCT_SUMAMT_GR` double NULL DEFAULT NULL COMMENT '个人缴费同比',
    `TB_CLCT_SUMAMT_CZ` double NULL DEFAULT NULL COMMENT '财政补助同比',
    `TB_P_CLCT_SUMAMT_PSNCNT` double NULL DEFAULT NULL COMMENT '人均缴费金额同比',
    `TB_P_CLCT_SUMAMT_PSNCNT_SR` double NULL DEFAULT NULL COMMENT '人均缴费金额/可支配收入同比',
    `psncnt_yljz7` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `admdvs_city`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `admdvs_perm`  varchar(255) CHARACTER SET utf32 COLLATE utf32_slovak_ci NULL DEFAULT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 705 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fct3_insu_psncnt_nld
-- ----------------------------
DROP TABLE IF EXISTS `fct3_insu_psncnt_nld`;
CREATE TABLE `fct3_insu_psncnt_nld`
(
    `STT_YY`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年',
    `SEX`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别',
    `PSNCNT1` double NULL DEFAULT NULL COMMENT '0-20人数',
    `PSNCNT2` double NULL DEFAULT NULL COMMENT '20-24人数',
    `PSNCNT3` double NULL DEFAULT NULL COMMENT '25-29人数',
    `PSNCNT4` double NULL DEFAULT NULL COMMENT '29-30人数',
    `PSNCNT5` double NULL DEFAULT NULL COMMENT '35-39人数',
    `PSNCNT6` double NULL DEFAULT NULL COMMENT '40-44人数',
    `PSNCNT7` double NULL DEFAULT NULL COMMENT '45-49人数',
    `PSNCNT8` double NULL DEFAULT NULL COMMENT '50-54人数',
    `PSNCNT9` double NULL DEFAULT NULL COMMENT '55-59人数',
    `PSNCNT10` double NULL DEFAULT NULL COMMENT '60-64人数',
    `PSNCNT11` double NULL DEFAULT NULL COMMENT '65-69人数',
    `PSNCNT12` double NULL DEFAULT NULL COMMENT '70以上人数',
    `PSNCNT` double NULL DEFAULT NULL COMMENT '总人数',
    `admdvs_city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `admdvs_perm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 187 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参保缴费-老龄化情况' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fct3_insu_psncnt_xcb
-- ----------------------------
DROP TABLE IF EXISTS `fct3_insu_psncnt_xcb`;
CREATE TABLE `fct3_insu_psncnt_xcb`
(
    `STT_YM`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年月',
    `PSNCNT_310` double NULL DEFAULT NULL COMMENT '职工参保缴费人数',
    `PSNCNT_XCB_310` double NULL DEFAULT NULL COMMENT '职工新参保人数',
    `P_PSNCNT_XCB_310` double NULL DEFAULT NULL COMMENT '职工新参保率',
    `PSNCNT_390` double NULL DEFAULT NULL COMMENT '居民参保缴费人数',
    `PSNCNT_XCB_390` double NULL DEFAULT NULL COMMENT '居民新参保人数',
    `P_PSNCNT_XCB_390` double NULL DEFAULT NULL COMMENT '居民新参保率',
    `ADMDVS_CITY` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '市',
    `ADMDVS_PERM` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保区划权限'
) ENGINE = InnoDB AUTO_INCREMENT = 8288 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参保缴费-新参保人数情况' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fct3_ma_obj_info_b_grp
-- ----------------------------
DROP TABLE IF EXISTS `fct3_ma_obj_info_b_grp`;
CREATE TABLE `fct3_ma_obj_info_b_grp`
(
    `stt_ym`       varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `MAT_DIC1`     varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `PSNCNT_YLJZ1` int(10) NULL DEFAULT NULL,
    `MAT_DIC2`     varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `PSNCNT_YLJZ2` int(10) NULL DEFAULT NULL,
    `MAT_DIC3`     varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `PSNCNT_YLJZ3` int(10) NULL DEFAULT NULL,
    `MAT_DIC4`     varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `PSNCNT_YLJZ4` int(10) NULL DEFAULT NULL,
    `MAT_DIC5`     varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `PSNCNT_YLJZ5` int(10) NULL DEFAULT NULL,
    `MAT_DIC6`     varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `PSNCNT_YLJZ6` int(10) NULL DEFAULT NULL,
    `PSNCNT_YLJZ`  int(10) NULL DEFAULT NULL,
    `admdvs_perm`  varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 336 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fixmedins_b
-- ----------------------------
DROP TABLE IF EXISTS `fixmedins_b`;
CREATE TABLE `fixmedins_b`
(
    `FIXMEDINS_CODE`       varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '定点医药机构编号',
    `MEDINS_MGTCODE`       varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医药机构管理码',
    `USCC`                 varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统一社会信用代码',
    `ORGCODE`              varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织机构代码',
    `fix_blng_admdvs_city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `FIX_BLNG_ADMDVS`      varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NOT NULL COMMENT '定点归属医保区划',
    `FIXMEDINS_NAME`       varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '定点医药机构名称',
    `FIXMEDINS_TYPE`       varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NOT NULL COMMENT '定点医疗服务机构类型',
    `HOSP_LV`              varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NOT NULL COMMENT '医院等级',
    `LMTPRIC_HOSP_LV`      varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NOT NULL COMMENT '限价医院等级',
    `DEDC_HOSP_LV`         varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NOT NULL COMMENT '起付线医院等级',
    `BEGNTIME`             datetime                                                      NOT NULL COMMENT '开始时间',
    `ENDTIME`              datetime NULL DEFAULT NULL COMMENT '结束时间',
    `HI_RESPER_NAME`       varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保办负责人姓名',
    `HI_RESPER_TEL`        varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保办负责人联系电话',
    `HI_RESPER_CERT_TYPE`  varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保办负责人证件类型',
    `HI_RESPER_CERTNO`     varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保办负责人证件号码',
    `OUT_FIXMEDINS_TYPE`   varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '异地医药机构类型',
    `FIX_ONLN_OPEN_FLAG`   varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NOT NULL COMMENT '定点联网开通标志',
    `OUT_ONLN_OPEN_TYPE`   varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NOT NULL COMMENT '异地联网开通类型',
    `NAT_PLAF_CODE`        varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '国家异地平台机构编号',
    `PROV_PLAF_CODE`       varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省内异地平台机构编号',
    `VALI_FLAG`            varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NOT NULL COMMENT '有效标志',
    `MEMO`                 longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
    `RID`                  varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '数据唯一记录号',
    `UPDT_TIME`            datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据更新时间',
    `CRTER_ID`             varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人ID',
    `CRTER_NAME`           varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人姓名',
    `CRTE_TIME`            datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
    `CRTE_OPTINS_NO`       varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建机构编号',
    `OPTER_ID`             varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办人ID',
    `OPTER_NAME`           varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办人姓名',
    `OPT_TIME`             datetime NULL DEFAULT NULL COMMENT '经办时间',
    `OPTINS_NO`            varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办机构编号',
    `POOLAREA_NO`          varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统筹区编号',
    PRIMARY KEY (`FIXMEDINS_CODE`) USING BTREE,
    INDEX                  `IDX_FIXMEDINS_B_1`(`USCC`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定点医药机构业务信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for insu_emp_info_b
-- ----------------------------
DROP TABLE IF EXISTS `insu_emp_info_b`;
CREATE TABLE `insu_emp_info_b`
(
    `EMP_NO`           varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '单位编号',
    `EMP_ENTT_CODG`    varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位实体编码',
    `EMP_MGT_TYPE`     varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NOT NULL COMMENT '单位管理类型',
    `PRNT_EMP_NO`      varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上级单位编号',
    `ASOC_LEGENT_FLAG` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NOT NULL COMMENT '关联法人标志',
    `EMP_TYPE`         varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位类型',
    `EMP_NAME`         varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '单位名称',
    `REG_NAME`         varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册名称',
    `LOC_ADMDVS`       varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所属医保区划',
    `CONER_NAME`       varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人姓名',
    `CONER_EMAIL`      varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人电子邮箱',
    `TEL`              varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
    `FAX_NO`           varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '传真号码',
    `TAX_REG_NO`       varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '税务登记号',
    `ORGCODE`          varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织机构代码',
    `REGNO`            varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册号',
    `REGNO_CERT_TYPE`  varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册号证件类型',
    `EMP_ADDR`         varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '单位地址',
    `POSCODE`          varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮政编码',
    `APRV_ESTA_DEPT`   varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '批准成立部门',
    `APRV_ESTA_DATE`   date NULL DEFAULT NULL COMMENT '批准成立日期',
    `APRV_ESTA_DOCNO`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '批准成立文号',
    `PRNT_ADMDVS`      varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上级医保区划',
    `INSU_ADMDVS`      varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参保所属医保区划',
    `ORG_VALI_STAS`    varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织有效状态',
    `LEGREP_TEL`       varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '法定代表人电话号码',
    `LEGREP_NAME`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '法定代表人姓名',
    `LEGREP_CERT_TYPE` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '法定代表人证件类型',
    `LEGREP_CERTNO`    varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '法定代表人证件号码',
    `ORGCODE_ISSU_EMP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织机构代码证颁发单位',
    `VALI_FLAG`        varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NOT NULL COMMENT '有效标志',
    `RID`              varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '数据唯一记录号',
    `CRTE_TIME`        datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
    `UPDT_TIME`        datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据更新时间',
    `CRTER_ID`         varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '创建人ID',
    `CRTER_NAME`       varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '创建人姓名',
    `CRTE_OPTINS_NO`   varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '创建机构编号',
    `OPTER_ID`         varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '经办人ID',
    `OPTER_NAME`       varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '经办人姓名',
    `OPT_TIME`         datetime                                                      NOT NULL COMMENT '经办时间',
    `OPTINS_NO`        varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '经办机构编号',
    `POOLAREA_NO`      varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统筹区编号',
    `VER`              varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '版本号',
    `SYNC_PRNT_FLAG`   varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '同步上级标志',
    `ENTP_SPEC_FLAG`   varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业规格标志',
    `MEMO`             longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
    `ORG_QUTS_PSNCNT`  int(11) NULL DEFAULT NULL COMMENT '机关编制人数'
) ENGINE = InnoDB AUTO_INCREMENT = 293967 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参保单位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jdbc_datasource
-- ----------------------------
DROP TABLE IF EXISTS `jdbc_datasource`;
CREATE TABLE `jdbc_datasource`
(
    `datasource_id`     int(18) NOT NULL DEFAULT 0,
    `url`               varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `driver_class_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `username`          varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `password`          varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    PRIMARY KEY (`datasource_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for otp_bigscreen_test
-- ----------------------------
DROP TABLE IF EXISTS `otp_bigscreen_test`;
CREATE TABLE `otp_bigscreen_test`
(
    `ym`          varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年月',
    `grep_type`   varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员类别',
    `insutype`    varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '险种类别',
    `insu_admdvs` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参保所属医保区划',
    `hosp_lv`     varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医院等级',
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
) ENGINE = InnoDB AUTO_INCREMENT = 4541 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '门诊统筹大屏测试表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for out_appy_d
-- ----------------------------
DROP TABLE IF EXISTS `out_appy_d`;
CREATE TABLE `out_appy_d`
(
    `TRT_DCLA_DETL_SN`       varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '待遇申报明细流水号',
    `INSUTYPE`               varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '险种类型',
    `DCLA_SOUC`              varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申报来源',
    `PSN_NO`                 varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '人员编号',
    `PSN_INSU_RLTS_ID`       varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员参保关系ID',
    `PSN_CERT_TYPE`          varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '人员证件类型',
    `CERTNO`                 varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '证件号码',
    `PSN_NAME`               varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '人员姓名',
    `GEND`                   varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别',
    `NATY`                   varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '民族',
    `BRDY`                   date NULL DEFAULT NULL COMMENT '出生日期',
    `TEL`                    varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
    `INSU_ADMDVS`            varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '参保所属医保区划',
    `EMP_NO`                 varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位编号',
    `EMP_NAME`               varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位名称',
    `RLOC_ADMDVS`            varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '安置地所属行政区代码',
    `RLOC_COTY_TYPE`         varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '安置区类型',
    `RLOC_HSORG_NAME`        varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '安置地医保机构名称',
    `RLOC_HSORG_CONER`       varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '安置地医保机构联系人',
    `RLOC_HSORG_TEL`         varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '安置地医保机构联系电话',
    `OUT_ONLN_WAY`           varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '异地联网方式',
    `RLOC_REA`               varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '异地安置原因',
    `RESOUT_ADDR`            varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '居外地址',
    `MEMO`                   longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
    `AGNTER_NAME`            varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代办人姓名',
    `AGNTER_CERT_TYPE`       varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代办人证件类型',
    `AGNTER_CERTNO`          varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代办人证件号码',
    `AGNTER_TEL`             varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代办人联系方式',
    `AGNTER_ADDR`            varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代办人联系地址',
    `AGNTER_RLTS`            varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代办人关系',
    `BEGNDATE`               date                                                         NOT NULL COMMENT '开始日期',
    `ENDDATE`                date NULL DEFAULT NULL COMMENT '结束日期',
    `OUT_FIL_UPLD_STAS`      varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '异地备案上报状态',
    `ATT_CNT`                int(11) NULL DEFAULT NULL COMMENT '附件数量',
    `VALI_FLAG`              varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '有效标志',
    `RID`                    varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据唯一记录号',
    `UPDT_TIME`              datetime                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据更新时间',
    `CRTER_ID`               varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人ID',
    `CRTER_NAME`             varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人姓名',
    `CRTE_TIME`              datetime                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
    `CRTE_OPTINS_NO`         varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建机构编号',
    `OPTER_ID`               varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办人ID',
    `OPTER_NAME`             varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办人姓名',
    `OPT_TIME`               datetime NULL DEFAULT NULL COMMENT '经办时间',
    `OPTINS_NO`              varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办机构编号',
    `POOLAREA_NO`            varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统筹区编号',
    `TRAFOUT_FIXMEDINS_CODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '转出地定点医药机构编号',
    `TRAFOUT_FIXMEDINS_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '转出地定点医药机构名称',
    `BANKCODE`               varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行行号',
    `BANK_TYPE_CODE`         varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行行别代码',
    `BANKACCT`               varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行账号',
    `BANK_SAMECITY_OUT_FLAG` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行同城异地标志',
    `ACCTNAME`               varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行卡户名',
    `RETNR_FLAG`             varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '回退标志',
    `DCLA_TYPE`              varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `RETN_FLAG`              varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    PRIMARY KEY (`TRT_DCLA_DETL_SN`) USING BTREE,
    INDEX                    `IDX_out_appy_dCERTNO`(`CERTNO`) USING BTREE,
    INDEX                    `idx_out_appy_d_EMP_NO`(`EMP_NO`) USING BTREE,
    INDEX                    `IDX_OUT_APPY_D_1`(`PSN_NO`) USING BTREE,
    INDEX                    `idx_out_appy_d_INSUTYPE`(`INSUTYPE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '异地申请信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for panel
-- ----------------------------
DROP TABLE IF EXISTS `panel`;
CREATE TABLE `panel`
(
    `panel_id`        int(11) NOT NULL AUTO_INCREMENT,
    `dashboard_id`    int(11) NULL DEFAULT NULL,
    `data`            longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
    `query_id`        varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `panel_title`     varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `comt_name`       varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `link_receiver`   tinyint(1) NULL DEFAULT NULL,
    `link_sender`     tinyint(1) NULL DEFAULT NULL,
    `dashboard_title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    PRIMARY KEY (`panel_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 84029291 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for panel_copy1
-- ----------------------------
DROP TABLE IF EXISTS `panel_copy1`;
CREATE TABLE `panel_copy1`
(
    `panel_id`        int(11) NOT NULL AUTO_INCREMENT,
    `dashboard_id`    int(11) NULL DEFAULT NULL,
    `data`            longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
    `query_id`        varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `panel_title`     varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `comt_name`       varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `link_receiver`   tinyint(1) NULL DEFAULT NULL,
    `link_sender`     tinyint(1) NULL DEFAULT NULL,
    `dashboard_title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    PRIMARY KEY (`panel_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18703569 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for query
-- ----------------------------
DROP TABLE IF EXISTS `query`;
CREATE TABLE `query`
(
    `query_id`           int(11) NOT NULL AUTO_INCREMENT,
    `query_sql`          longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '固化表查询SQL',
    `datasource_id`      int(11) NULL DEFAULT NULL,
    `use_mustache`       int(1) NULL DEFAULT 0 COMMENT '此字段无作用',
    `use_spring_bean`    int(1) NULL DEFAULT 0 COMMENT '是否使用spring bean进行查询，默认为0，即不使用',
    `spring_bean_name`   varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'spring bean的名称',
    `use_stage`          int(1) NULL DEFAULT 0,
    `stage_min_interval` int(11) NULL DEFAULT NULL,
    `query_sql_rt`       varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实时查询SQL',
    PRIMARY KEY (`query_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 870500402 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for query_copy1
-- ----------------------------
DROP TABLE IF EXISTS `query_copy1`;
CREATE TABLE `query_copy1`
(
    `query_id`           int(11) NOT NULL AUTO_INCREMENT,
    `query_sql`          longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '固化表查询SQL',
    `datasource_id`      int(11) NULL DEFAULT NULL,
    `use_mustache`       int(1) NULL DEFAULT 0 COMMENT '此字段无作用',
    `use_spring_bean`    int(1) NULL DEFAULT 0 COMMENT '是否使用spring bean进行查询，默认为0，即不使用',
    `spring_bean_name`   varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'spring bean的名称',
    `use_stage`          int(1) NULL DEFAULT 0,
    `stage_min_interval` int(11) NULL DEFAULT NULL,
    `query_sql_rt`       varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实时查询SQL',
    PRIMARY KEY (`query_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 870500401 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

SET
FOREIGN_KEY_CHECKS = 1;
