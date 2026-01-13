-- 自动生成的数据脱敏SQL脚本
-- 生成时间: 由敏感字段分析器自动生成

-- 表: admdvs_a
-- ADMDVS_NAME (person_name)
UPDATE admdvs_a SET ADMDVS_NAME = CASE WHEN LENGTH(ADMDVS_NAME) <= 2 THEN CONCAT(SUBSTR(ADMDVS_NAME, 1, 1), '*') WHEN LENGTH(ADMDVS_NAME) <= 4 THEN CONCAT(SUBSTR(ADMDVS_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(ADMDVS_NAME, 1, CEIL(LENGTH(ADMDVS_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(ADMDVS_NAME) * 1/3))) END;
-- CRTER_ID (person_name)
UPDATE admdvs_a SET CRTER_ID = CASE WHEN LENGTH(CRTER_ID) <= 2 THEN CONCAT(SUBSTR(CRTER_ID, 1, 1), '*') WHEN LENGTH(CRTER_ID) <= 4 THEN CONCAT(SUBSTR(CRTER_ID, 1, 2), '*') ELSE CONCAT(SUBSTR(CRTER_ID, 1, CEIL(LENGTH(CRTER_ID) * 2/3)), REPEAT('*', FLOOR(LENGTH(CRTER_ID) * 1/3))) END;
-- CRTER_NAME (person_name)
UPDATE admdvs_a SET CRTER_NAME = CASE WHEN LENGTH(CRTER_NAME) <= 2 THEN CONCAT(SUBSTR(CRTER_NAME, 1, 1), '*') WHEN LENGTH(CRTER_NAME) <= 4 THEN CONCAT(SUBSTR(CRTER_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(CRTER_NAME, 1, CEIL(LENGTH(CRTER_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(CRTER_NAME) * 1/3))) END;
-- OPTER_ID (person_name)
UPDATE admdvs_a SET OPTER_ID = CASE WHEN LENGTH(OPTER_ID) <= 2 THEN CONCAT(SUBSTR(OPTER_ID, 1, 1), '*') WHEN LENGTH(OPTER_ID) <= 4 THEN CONCAT(SUBSTR(OPTER_ID, 1, 2), '*') ELSE CONCAT(SUBSTR(OPTER_ID, 1, CEIL(LENGTH(OPTER_ID) * 2/3)), REPEAT('*', FLOOR(LENGTH(OPTER_ID) * 1/3))) END;
-- OPTER_NAME (person_name)
UPDATE admdvs_a SET OPTER_NAME = CASE WHEN LENGTH(OPTER_NAME) <= 2 THEN CONCAT(SUBSTR(OPTER_NAME, 1, 1), '*') WHEN LENGTH(OPTER_NAME) <= 4 THEN CONCAT(SUBSTR(OPTER_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(OPTER_NAME, 1, CEIL(LENGTH(OPTER_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(OPTER_NAME) * 1/3))) END;
-- OPTINS_NO (org_name)
UPDATE admdvs_a SET OPTINS_NO = CASE WHEN LENGTH(OPTINS_NO) <= 5 THEN CONCAT(SUBSTR(OPTINS_NO, 1, 3), REPEAT('*', LENGTH(OPTINS_NO) - 3)) ELSE CONCAT(SUBSTR(OPTINS_NO, 1, CEIL(LENGTH(OPTINS_NO) * 2/3)), REPEAT('*', FLOOR(LENGTH(OPTINS_NO) * 1/3))) END;
-- CRTE_OPTINS_NO (org_name)
UPDATE admdvs_a SET CRTE_OPTINS_NO = CASE WHEN LENGTH(CRTE_OPTINS_NO) <= 5 THEN CONCAT(SUBSTR(CRTE_OPTINS_NO, 1, 3), REPEAT('*', LENGTH(CRTE_OPTINS_NO) - 3)) ELSE CONCAT(SUBSTR(CRTE_OPTINS_NO, 1, CEIL(LENGTH(CRTE_OPTINS_NO) * 2/3)), REPEAT('*', FLOOR(LENGTH(CRTE_OPTINS_NO) * 1/3))) END;

-- 表: admdvs_a_gb
-- ADMDVS_NAME (person_name)
UPDATE admdvs_a_gb SET ADMDVS_NAME = CASE WHEN LENGTH(ADMDVS_NAME) <= 2 THEN CONCAT(SUBSTR(ADMDVS_NAME, 1, 1), '*') WHEN LENGTH(ADMDVS_NAME) <= 4 THEN CONCAT(SUBSTR(ADMDVS_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(ADMDVS_NAME, 1, CEIL(LENGTH(ADMDVS_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(ADMDVS_NAME) * 1/3))) END;
-- CRTER_ID (person_name)
UPDATE admdvs_a_gb SET CRTER_ID = CASE WHEN LENGTH(CRTER_ID) <= 2 THEN CONCAT(SUBSTR(CRTER_ID, 1, 1), '*') WHEN LENGTH(CRTER_ID) <= 4 THEN CONCAT(SUBSTR(CRTER_ID, 1, 2), '*') ELSE CONCAT(SUBSTR(CRTER_ID, 1, CEIL(LENGTH(CRTER_ID) * 2/3)), REPEAT('*', FLOOR(LENGTH(CRTER_ID) * 1/3))) END;
-- CRTER_NAME (person_name)
UPDATE admdvs_a_gb SET CRTER_NAME = CASE WHEN LENGTH(CRTER_NAME) <= 2 THEN CONCAT(SUBSTR(CRTER_NAME, 1, 1), '*') WHEN LENGTH(CRTER_NAME) <= 4 THEN CONCAT(SUBSTR(CRTER_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(CRTER_NAME, 1, CEIL(LENGTH(CRTER_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(CRTER_NAME) * 1/3))) END;
-- OPTER_ID (person_name)
UPDATE admdvs_a_gb SET OPTER_ID = CASE WHEN LENGTH(OPTER_ID) <= 2 THEN CONCAT(SUBSTR(OPTER_ID, 1, 1), '*') WHEN LENGTH(OPTER_ID) <= 4 THEN CONCAT(SUBSTR(OPTER_ID, 1, 2), '*') ELSE CONCAT(SUBSTR(OPTER_ID, 1, CEIL(LENGTH(OPTER_ID) * 2/3)), REPEAT('*', FLOOR(LENGTH(OPTER_ID) * 1/3))) END;
-- OPTER_NAME (person_name)
UPDATE admdvs_a_gb SET OPTER_NAME = CASE WHEN LENGTH(OPTER_NAME) <= 2 THEN CONCAT(SUBSTR(OPTER_NAME, 1, 1), '*') WHEN LENGTH(OPTER_NAME) <= 4 THEN CONCAT(SUBSTR(OPTER_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(OPTER_NAME, 1, CEIL(LENGTH(OPTER_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(OPTER_NAME) * 1/3))) END;
-- OPTINS_NO (org_name)
UPDATE admdvs_a_gb SET OPTINS_NO = CASE WHEN LENGTH(OPTINS_NO) <= 5 THEN CONCAT(SUBSTR(OPTINS_NO, 1, 3), REPEAT('*', LENGTH(OPTINS_NO) - 3)) ELSE CONCAT(SUBSTR(OPTINS_NO, 1, CEIL(LENGTH(OPTINS_NO) * 2/3)), REPEAT('*', FLOOR(LENGTH(OPTINS_NO) * 1/3))) END;
-- CRTE_OPTINS_NO (org_name)
UPDATE admdvs_a_gb SET CRTE_OPTINS_NO = CASE WHEN LENGTH(CRTE_OPTINS_NO) <= 5 THEN CONCAT(SUBSTR(CRTE_OPTINS_NO, 1, 3), REPEAT('*', LENGTH(CRTE_OPTINS_NO) - 3)) ELSE CONCAT(SUBSTR(CRTE_OPTINS_NO, 1, CEIL(LENGTH(CRTE_OPTINS_NO) * 2/3)), REPEAT('*', FLOOR(LENGTH(CRTE_OPTINS_NO) * 1/3))) END;

-- 表: ads_znjg_fixmedins_mdtrt_sum_mon_mf_ytai
-- fixmedins_code (org_name)
UPDATE ads_znjg_fixmedins_mdtrt_sum_mon_mf_ytai SET fixmedins_code = CASE WHEN LENGTH(fixmedins_code) <= 5 THEN CONCAT(SUBSTR(fixmedins_code, 1, 3), REPEAT('*', LENGTH(fixmedins_code) - 3)) ELSE CONCAT(SUBSTR(fixmedins_code, 1, CEIL(LENGTH(fixmedins_code) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_code) * 1/3))) END;
-- fixmedins_name (person_name)
UPDATE ads_znjg_fixmedins_mdtrt_sum_mon_mf_ytai SET fixmedins_name = CASE WHEN LENGTH(fixmedins_name) <= 2 THEN CONCAT(SUBSTR(fixmedins_name, 1, 1), '*') WHEN LENGTH(fixmedins_name) <= 4 THEN CONCAT(SUBSTR(fixmedins_name, 1, 2), '*') ELSE CONCAT(SUBSTR(fixmedins_name, 1, CEIL(LENGTH(fixmedins_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_name) * 1/3))) END;
-- med_admdvs (org_name)
UPDATE ads_znjg_fixmedins_mdtrt_sum_mon_mf_ytai SET med_admdvs = CASE WHEN LENGTH(med_admdvs) <= 5 THEN CONCAT(SUBSTR(med_admdvs, 1, 3), REPEAT('*', LENGTH(med_admdvs) - 3)) ELSE CONCAT(SUBSTR(med_admdvs, 1, CEIL(LENGTH(med_admdvs) * 2/3)), REPEAT('*', FLOOR(LENGTH(med_admdvs) * 1/3))) END;
-- medins_lv (org_name)
UPDATE ads_znjg_fixmedins_mdtrt_sum_mon_mf_ytai SET medins_lv = CASE WHEN LENGTH(medins_lv) <= 5 THEN CONCAT(SUBSTR(medins_lv, 1, 3), REPEAT('*', LENGTH(medins_lv) - 3)) ELSE CONCAT(SUBSTR(medins_lv, 1, CEIL(LENGTH(medins_lv) * 2/3)), REPEAT('*', FLOOR(LENGTH(medins_lv) * 1/3))) END;
-- medins_trait (org_name)
UPDATE ads_znjg_fixmedins_mdtrt_sum_mon_mf_ytai SET medins_trait = CASE WHEN LENGTH(medins_trait) <= 5 THEN CONCAT(SUBSTR(medins_trait, 1, 3), REPEAT('*', LENGTH(medins_trait) - 3)) ELSE CONCAT(SUBSTR(medins_trait, 1, CEIL(LENGTH(medins_trait) * 2/3)), REPEAT('*', FLOOR(LENGTH(medins_trait) * 1/3))) END;
-- mdtrt_psn_cnt (medical_record)
UPDATE ads_znjg_fixmedins_mdtrt_sum_mon_mf_ytai SET mdtrt_psn_cnt = CASE WHEN LENGTH(mdtrt_psn_cnt) <= 8 THEN CONCAT(SUBSTR(mdtrt_psn_cnt, 1, 5), REPEAT('*', LENGTH(mdtrt_psn_cnt) - 5)) ELSE CONCAT(SUBSTR(mdtrt_psn_cnt, 1, CEIL(LENGTH(mdtrt_psn_cnt) * 2/3)), REPEAT('*', FLOOR(LENGTH(mdtrt_psn_cnt) * 1/3))) END;
-- mdtrt_psn_time (medical_record)
UPDATE ads_znjg_fixmedins_mdtrt_sum_mon_mf_ytai SET mdtrt_psn_time = CASE WHEN LENGTH(mdtrt_psn_time) <= 8 THEN CONCAT(SUBSTR(mdtrt_psn_time, 1, 5), REPEAT('*', LENGTH(mdtrt_psn_time) - 5)) ELSE CONCAT(SUBSTR(mdtrt_psn_time, 1, CEIL(LENGTH(mdtrt_psn_time) * 2/3)), REPEAT('*', FLOOR(LENGTH(mdtrt_psn_time) * 1/3))) END;
-- dw_tab_name (person_name)
UPDATE ads_znjg_fixmedins_mdtrt_sum_mon_mf_ytai SET dw_tab_name = CASE WHEN LENGTH(dw_tab_name) <= 2 THEN CONCAT(SUBSTR(dw_tab_name, 1, 1), '*') WHEN LENGTH(dw_tab_name) <= 4 THEN CONCAT(SUBSTR(dw_tab_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dw_tab_name, 1, CEIL(LENGTH(dw_tab_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dw_tab_name) * 1/3))) END;

-- 表: ads_znjg_hosp_swap_detl_d_mf_ytai
-- fixmedins_code (org_name)
UPDATE ads_znjg_hosp_swap_detl_d_mf_ytai SET fixmedins_code = CASE WHEN LENGTH(fixmedins_code) <= 5 THEN CONCAT(SUBSTR(fixmedins_code, 1, 3), REPEAT('*', LENGTH(fixmedins_code) - 3)) ELSE CONCAT(SUBSTR(fixmedins_code, 1, CEIL(LENGTH(fixmedins_code) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_code) * 1/3))) END;
-- fixmedins_name (person_name)
UPDATE ads_znjg_hosp_swap_detl_d_mf_ytai SET fixmedins_name = CASE WHEN LENGTH(fixmedins_name) <= 2 THEN CONCAT(SUBSTR(fixmedins_name, 1, 1), '*') WHEN LENGTH(fixmedins_name) <= 4 THEN CONCAT(SUBSTR(fixmedins_name, 1, 2), '*') ELSE CONCAT(SUBSTR(fixmedins_name, 1, CEIL(LENGTH(fixmedins_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_name) * 1/3))) END;
-- medinslv (org_name)
UPDATE ads_znjg_hosp_swap_detl_d_mf_ytai SET medinslv = CASE WHEN LENGTH(medinslv) <= 5 THEN CONCAT(SUBSTR(medinslv, 1, 3), REPEAT('*', LENGTH(medinslv) - 3)) ELSE CONCAT(SUBSTR(medinslv, 1, CEIL(LENGTH(medinslv) * 2/3)), REPEAT('*', FLOOR(LENGTH(medinslv) * 1/3))) END;
-- medins_list_codg (org_name)
UPDATE ads_znjg_hosp_swap_detl_d_mf_ytai SET medins_list_codg = CASE WHEN LENGTH(medins_list_codg) <= 5 THEN CONCAT(SUBSTR(medins_list_codg, 1, 3), REPEAT('*', LENGTH(medins_list_codg) - 3)) ELSE CONCAT(SUBSTR(medins_list_codg, 1, CEIL(LENGTH(medins_list_codg) * 2/3)), REPEAT('*', FLOOR(LENGTH(medins_list_codg) * 1/3))) END;
-- medins_list_name (person_name)
UPDATE ads_znjg_hosp_swap_detl_d_mf_ytai SET medins_list_name = CASE WHEN LENGTH(medins_list_name) <= 2 THEN CONCAT(SUBSTR(medins_list_name, 1, 1), '*') WHEN LENGTH(medins_list_name) <= 4 THEN CONCAT(SUBSTR(medins_list_name, 1, 2), '*') ELSE CONCAT(SUBSTR(medins_list_name, 1, CEIL(LENGTH(medins_list_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(medins_list_name) * 1/3))) END;
-- map_name (person_name)
UPDATE ads_znjg_hosp_swap_detl_d_mf_ytai SET map_name = CASE WHEN LENGTH(map_name) <= 2 THEN CONCAT(SUBSTR(map_name, 1, 1), '*') WHEN LENGTH(map_name) <= 4 THEN CONCAT(SUBSTR(map_name, 1, 2), '*') ELSE CONCAT(SUBSTR(map_name, 1, CEIL(LENGTH(map_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(map_name) * 1/3))) END;
-- map_ssim (org_name)
UPDATE ads_znjg_hosp_swap_detl_d_mf_ytai SET map_ssim = CASE WHEN LENGTH(map_ssim) <= 5 THEN CONCAT(SUBSTR(map_ssim, 1, 3), REPEAT('*', LENGTH(map_ssim) - 3)) ELSE CONCAT(SUBSTR(map_ssim, 1, CEIL(LENGTH(map_ssim) * 2/3)), REPEAT('*', FLOOR(LENGTH(map_ssim) * 1/3))) END;
-- hilist_name (person_name)
UPDATE ads_znjg_hosp_swap_detl_d_mf_ytai SET hilist_name = CASE WHEN LENGTH(hilist_name) <= 2 THEN CONCAT(SUBSTR(hilist_name, 1, 1), '*') WHEN LENGTH(hilist_name) <= 4 THEN CONCAT(SUBSTR(hilist_name, 1, 2), '*') ELSE CONCAT(SUBSTR(hilist_name, 1, CEIL(LENGTH(hilist_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(hilist_name) * 1/3))) END;
-- name_ssim (person_name)
UPDATE ads_znjg_hosp_swap_detl_d_mf_ytai SET name_ssim = CASE WHEN LENGTH(name_ssim) <= 2 THEN CONCAT(SUBSTR(name_ssim, 1, 1), '*') WHEN LENGTH(name_ssim) <= 4 THEN CONCAT(SUBSTR(name_ssim, 1, 2), '*') ELSE CONCAT(SUBSTR(name_ssim, 1, CEIL(LENGTH(name_ssim) * 2/3)), REPEAT('*', FLOOR(LENGTH(name_ssim) * 1/3))) END;
-- mdtrt_psntime (org_name)
UPDATE ads_znjg_hosp_swap_detl_d_mf_ytai SET mdtrt_psntime = CASE WHEN LENGTH(mdtrt_psntime) <= 5 THEN CONCAT(SUBSTR(mdtrt_psntime, 1, 3), REPEAT('*', LENGTH(mdtrt_psntime) - 3)) ELSE CONCAT(SUBSTR(mdtrt_psntime, 1, CEIL(LENGTH(mdtrt_psntime) * 2/3)), REPEAT('*', FLOOR(LENGTH(mdtrt_psntime) * 1/3))) END;
-- dw_tab_name (person_name)
UPDATE ads_znjg_hosp_swap_detl_d_mf_ytai SET dw_tab_name = CASE WHEN LENGTH(dw_tab_name) <= 2 THEN CONCAT(SUBSTR(dw_tab_name, 1, 1), '*') WHEN LENGTH(dw_tab_name) <= 4 THEN CONCAT(SUBSTR(dw_tab_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dw_tab_name, 1, CEIL(LENGTH(dw_tab_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dw_tab_name) * 1/3))) END;

-- 表: ads_znjg_hrisk_medins_d_mf_ytai
-- fixmedins_code (org_name)
UPDATE ads_znjg_hrisk_medins_d_mf_ytai SET fixmedins_code = CASE WHEN LENGTH(fixmedins_code) <= 5 THEN CONCAT(SUBSTR(fixmedins_code, 1, 3), REPEAT('*', LENGTH(fixmedins_code) - 3)) ELSE CONCAT(SUBSTR(fixmedins_code, 1, CEIL(LENGTH(fixmedins_code) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_code) * 1/3))) END;
-- fixmedins_name (person_name)
UPDATE ads_znjg_hrisk_medins_d_mf_ytai SET fixmedins_name = CASE WHEN LENGTH(fixmedins_name) <= 2 THEN CONCAT(SUBSTR(fixmedins_name, 1, 1), '*') WHEN LENGTH(fixmedins_name) <= 4 THEN CONCAT(SUBSTR(fixmedins_name, 1, 2), '*') ELSE CONCAT(SUBSTR(fixmedins_name, 1, CEIL(LENGTH(fixmedins_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_name) * 1/3))) END;
-- admdvs_name (person_name)
UPDATE ads_znjg_hrisk_medins_d_mf_ytai SET admdvs_name = CASE WHEN LENGTH(admdvs_name) <= 2 THEN CONCAT(SUBSTR(admdvs_name, 1, 1), '*') WHEN LENGTH(admdvs_name) <= 4 THEN CONCAT(SUBSTR(admdvs_name, 1, 2), '*') ELSE CONCAT(SUBSTR(admdvs_name, 1, CEIL(LENGTH(admdvs_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(admdvs_name) * 1/3))) END;
-- medins_trait (org_name)
UPDATE ads_znjg_hrisk_medins_d_mf_ytai SET medins_trait = CASE WHEN LENGTH(medins_trait) <= 5 THEN CONCAT(SUBSTR(medins_trait, 1, 3), REPEAT('*', LENGTH(medins_trait) - 3)) ELSE CONCAT(SUBSTR(medins_trait, 1, CEIL(LENGTH(medins_trait) * 2/3)), REPEAT('*', FLOOR(LENGTH(medins_trait) * 1/3))) END;
-- medins_lv (org_name)
UPDATE ads_znjg_hrisk_medins_d_mf_ytai SET medins_lv = CASE WHEN LENGTH(medins_lv) <= 5 THEN CONCAT(SUBSTR(medins_lv, 1, 3), REPEAT('*', LENGTH(medins_lv) - 3)) ELSE CONCAT(SUBSTR(medins_lv, 1, CEIL(LENGTH(medins_lv) * 2/3)), REPEAT('*', FLOOR(LENGTH(medins_lv) * 1/3))) END;
-- dw_tab_name (person_name)
UPDATE ads_znjg_hrisk_medins_d_mf_ytai SET dw_tab_name = CASE WHEN LENGTH(dw_tab_name) <= 2 THEN CONCAT(SUBSTR(dw_tab_name, 1, 1), '*') WHEN LENGTH(dw_tab_name) <= 4 THEN CONCAT(SUBSTR(dw_tab_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dw_tab_name, 1, CEIL(LENGTH(dw_tab_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dw_tab_name) * 1/3))) END;

-- 表: ads_znjg_ipt_abn_risk_rgst_detl_d_mf_ytai
-- risk_grp_name (person_name)
UPDATE ads_znjg_ipt_abn_risk_rgst_detl_d_mf_ytai SET risk_grp_name = CASE WHEN LENGTH(risk_grp_name) <= 2 THEN CONCAT(SUBSTR(risk_grp_name, 1, 1), '*') WHEN LENGTH(risk_grp_name) <= 4 THEN CONCAT(SUBSTR(risk_grp_name, 1, 2), '*') ELSE CONCAT(SUBSTR(risk_grp_name, 1, CEIL(LENGTH(risk_grp_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(risk_grp_name) * 1/3))) END;
-- tel (phone)
UPDATE ads_znjg_ipt_abn_risk_rgst_detl_d_mf_ytai SET tel = CASE WHEN LENGTH(tel) <= 8 THEN CONCAT(SUBSTR(tel, 1, 5), REPEAT('*', LENGTH(tel) - 5)) ELSE CONCAT(SUBSTR(tel, 1, CEIL(LENGTH(tel) * 2/3)), REPEAT('*', FLOOR(LENGTH(tel) * 1/3))) END;
-- mdtrt_id (medical_record)
UPDATE ads_znjg_ipt_abn_risk_rgst_detl_d_mf_ytai SET mdtrt_id = CASE WHEN LENGTH(mdtrt_id) <= 8 THEN CONCAT(SUBSTR(mdtrt_id, 1, 5), REPEAT('*', LENGTH(mdtrt_id) - 5)) ELSE CONCAT(SUBSTR(mdtrt_id, 1, CEIL(LENGTH(mdtrt_id) * 2/3)), REPEAT('*', FLOOR(LENGTH(mdtrt_id) * 1/3))) END;
-- mdtrt_sn (medical_record)
UPDATE ads_znjg_ipt_abn_risk_rgst_detl_d_mf_ytai SET mdtrt_sn = CASE WHEN LENGTH(mdtrt_sn) <= 8 THEN CONCAT(SUBSTR(mdtrt_sn, 1, 5), REPEAT('*', LENGTH(mdtrt_sn) - 5)) ELSE CONCAT(SUBSTR(mdtrt_sn, 1, CEIL(LENGTH(mdtrt_sn) * 2/3)), REPEAT('*', FLOOR(LENGTH(mdtrt_sn) * 1/3))) END;
-- psn_no (person_id)
UPDATE ads_znjg_ipt_abn_risk_rgst_detl_d_mf_ytai SET psn_no = CASE WHEN LENGTH(psn_no) <= 8 THEN CONCAT(SUBSTR(psn_no, 1, 5), REPEAT('*', LENGTH(psn_no) - 5)) ELSE CONCAT(SUBSTR(psn_no, 1, CEIL(LENGTH(psn_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(psn_no) * 1/3))) END;
-- psn_name (person_name)
UPDATE ads_znjg_ipt_abn_risk_rgst_detl_d_mf_ytai SET psn_name = CASE WHEN LENGTH(psn_name) <= 2 THEN CONCAT(SUBSTR(psn_name, 1, 1), '*') WHEN LENGTH(psn_name) <= 4 THEN CONCAT(SUBSTR(psn_name, 1, 2), '*') ELSE CONCAT(SUBSTR(psn_name, 1, CEIL(LENGTH(psn_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(psn_name) * 1/3))) END;
-- certno (id_card)
UPDATE ads_znjg_ipt_abn_risk_rgst_detl_d_mf_ytai SET certno = CASE WHEN LENGTH(certno) <= 10 THEN CONCAT(SUBSTR(certno, 1, 7), REPEAT('*', LENGTH(certno) - 7)) ELSE CONCAT(SUBSTR(certno, 1, CEIL(LENGTH(certno) * 2/3)), REPEAT('*', FLOOR(LENGTH(certno) * 1/3))) END;
-- medins_code (org_name)
UPDATE ads_znjg_ipt_abn_risk_rgst_detl_d_mf_ytai SET medins_code = CASE WHEN LENGTH(medins_code) <= 5 THEN CONCAT(SUBSTR(medins_code, 1, 3), REPEAT('*', LENGTH(medins_code) - 3)) ELSE CONCAT(SUBSTR(medins_code, 1, CEIL(LENGTH(medins_code) * 2/3)), REPEAT('*', FLOOR(LENGTH(medins_code) * 1/3))) END;
-- medins_name (person_name)
UPDATE ads_znjg_ipt_abn_risk_rgst_detl_d_mf_ytai SET medins_name = CASE WHEN LENGTH(medins_name) <= 2 THEN CONCAT(SUBSTR(medins_name, 1, 1), '*') WHEN LENGTH(medins_name) <= 4 THEN CONCAT(SUBSTR(medins_name, 1, 2), '*') ELSE CONCAT(SUBSTR(medins_name, 1, CEIL(LENGTH(medins_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(medins_name) * 1/3))) END;
-- insu_emp_no (org_name)
UPDATE ads_znjg_ipt_abn_risk_rgst_detl_d_mf_ytai SET insu_emp_no = CASE WHEN LENGTH(insu_emp_no) <= 5 THEN CONCAT(SUBSTR(insu_emp_no, 1, 3), REPEAT('*', LENGTH(insu_emp_no) - 3)) ELSE CONCAT(SUBSTR(insu_emp_no, 1, CEIL(LENGTH(insu_emp_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(insu_emp_no) * 1/3))) END;
-- insu_emp_name (person_name)
UPDATE ads_znjg_ipt_abn_risk_rgst_detl_d_mf_ytai SET insu_emp_name = CASE WHEN LENGTH(insu_emp_name) <= 2 THEN CONCAT(SUBSTR(insu_emp_name, 1, 1), '*') WHEN LENGTH(insu_emp_name) <= 4 THEN CONCAT(SUBSTR(insu_emp_name, 1, 2), '*') ELSE CONCAT(SUBSTR(insu_emp_name, 1, CEIL(LENGTH(insu_emp_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(insu_emp_name) * 1/3))) END;
-- resd_regn (address)
UPDATE ads_znjg_ipt_abn_risk_rgst_detl_d_mf_ytai SET resd_regn = CASE WHEN LENGTH(resd_regn) <= 10 THEN CONCAT(SUBSTR(resd_regn, 1, 7), REPEAT('*', LENGTH(resd_regn) - 7)) ELSE CONCAT(SUBSTR(resd_regn, 1, CEIL(LENGTH(resd_regn) * 2/3)), REPEAT('*', FLOOR(LENGTH(resd_regn) * 1/3))) END;
-- dise_name (person_name)
UPDATE ads_znjg_ipt_abn_risk_rgst_detl_d_mf_ytai SET dise_name = CASE WHEN LENGTH(dise_name) <= 2 THEN CONCAT(SUBSTR(dise_name, 1, 1), '*') WHEN LENGTH(dise_name) <= 4 THEN CONCAT(SUBSTR(dise_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dise_name, 1, CEIL(LENGTH(dise_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dise_name) * 1/3))) END;
-- mdtrt_cert_no (medical_record)
UPDATE ads_znjg_ipt_abn_risk_rgst_detl_d_mf_ytai SET mdtrt_cert_no = CASE WHEN LENGTH(mdtrt_cert_no) <= 8 THEN CONCAT(SUBSTR(mdtrt_cert_no, 1, 5), REPEAT('*', LENGTH(mdtrt_cert_no) - 5)) ELSE CONCAT(SUBSTR(mdtrt_cert_no, 1, CEIL(LENGTH(mdtrt_cert_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(mdtrt_cert_no) * 1/3))) END;
-- chfpdr_code (person_name)
UPDATE ads_znjg_ipt_abn_risk_rgst_detl_d_mf_ytai SET chfpdr_code = CASE WHEN LENGTH(chfpdr_code) <= 2 THEN CONCAT(SUBSTR(chfpdr_code, 1, 1), '*') WHEN LENGTH(chfpdr_code) <= 4 THEN CONCAT(SUBSTR(chfpdr_code, 1, 2), '*') ELSE CONCAT(SUBSTR(chfpdr_code, 1, CEIL(LENGTH(chfpdr_code) * 2/3)), REPEAT('*', FLOOR(LENGTH(chfpdr_code) * 1/3))) END;
-- chfpdr_name (person_name)
UPDATE ads_znjg_ipt_abn_risk_rgst_detl_d_mf_ytai SET chfpdr_name = CASE WHEN LENGTH(chfpdr_name) <= 2 THEN CONCAT(SUBSTR(chfpdr_name, 1, 1), '*') WHEN LENGTH(chfpdr_name) <= 4 THEN CONCAT(SUBSTR(chfpdr_name, 1, 2), '*') ELSE CONCAT(SUBSTR(chfpdr_name, 1, CEIL(LENGTH(chfpdr_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(chfpdr_name) * 1/3))) END;
-- dept_name (person_name)
UPDATE ads_znjg_ipt_abn_risk_rgst_detl_d_mf_ytai SET dept_name = CASE WHEN LENGTH(dept_name) <= 2 THEN CONCAT(SUBSTR(dept_name, 1, 1), '*') WHEN LENGTH(dept_name) <= 4 THEN CONCAT(SUBSTR(dept_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dept_name, 1, CEIL(LENGTH(dept_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dept_name) * 1/3))) END;
-- mdtrt_cert_type (medical_record)
UPDATE ads_znjg_ipt_abn_risk_rgst_detl_d_mf_ytai SET mdtrt_cert_type = CASE WHEN LENGTH(mdtrt_cert_type) <= 8 THEN CONCAT(SUBSTR(mdtrt_cert_type, 1, 5), REPEAT('*', LENGTH(mdtrt_cert_type) - 5)) ELSE CONCAT(SUBSTR(mdtrt_cert_type, 1, CEIL(LENGTH(mdtrt_cert_type) * 2/3)), REPEAT('*', FLOOR(LENGTH(mdtrt_cert_type) * 1/3))) END;
-- dw_tab_name (person_name)
UPDATE ads_znjg_ipt_abn_risk_rgst_detl_d_mf_ytai SET dw_tab_name = CASE WHEN LENGTH(dw_tab_name) <= 2 THEN CONCAT(SUBSTR(dw_tab_name, 1, 1), '*') WHEN LENGTH(dw_tab_name) <= 4 THEN CONCAT(SUBSTR(dw_tab_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dw_tab_name, 1, CEIL(LENGTH(dw_tab_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dw_tab_name) * 1/3))) END;

-- 表: ads_znjg_ipt_abn_risk_sum_e_mf_ytai
-- risk_grp_name (person_name)
UPDATE ads_znjg_ipt_abn_risk_sum_e_mf_ytai SET risk_grp_name = CASE WHEN LENGTH(risk_grp_name) <= 2 THEN CONCAT(SUBSTR(risk_grp_name, 1, 1), '*') WHEN LENGTH(risk_grp_name) <= 4 THEN CONCAT(SUBSTR(risk_grp_name, 1, 2), '*') ELSE CONCAT(SUBSTR(risk_grp_name, 1, CEIL(LENGTH(risk_grp_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(risk_grp_name) * 1/3))) END;
-- medins_code (org_name)
UPDATE ads_znjg_ipt_abn_risk_sum_e_mf_ytai SET medins_code = CASE WHEN LENGTH(medins_code) <= 5 THEN CONCAT(SUBSTR(medins_code, 1, 3), REPEAT('*', LENGTH(medins_code) - 3)) ELSE CONCAT(SUBSTR(medins_code, 1, CEIL(LENGTH(medins_code) * 2/3)), REPEAT('*', FLOOR(LENGTH(medins_code) * 1/3))) END;
-- medins_name (person_name)
UPDATE ads_znjg_ipt_abn_risk_sum_e_mf_ytai SET medins_name = CASE WHEN LENGTH(medins_name) <= 2 THEN CONCAT(SUBSTR(medins_name, 1, 1), '*') WHEN LENGTH(medins_name) <= 4 THEN CONCAT(SUBSTR(medins_name, 1, 2), '*') ELSE CONCAT(SUBSTR(medins_name, 1, CEIL(LENGTH(medins_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(medins_name) * 1/3))) END;
-- insu_emp_no (org_name)
UPDATE ads_znjg_ipt_abn_risk_sum_e_mf_ytai SET insu_emp_no = CASE WHEN LENGTH(insu_emp_no) <= 5 THEN CONCAT(SUBSTR(insu_emp_no, 1, 3), REPEAT('*', LENGTH(insu_emp_no) - 3)) ELSE CONCAT(SUBSTR(insu_emp_no, 1, CEIL(LENGTH(insu_emp_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(insu_emp_no) * 1/3))) END;
-- insu_emp_name (person_name)
UPDATE ads_znjg_ipt_abn_risk_sum_e_mf_ytai SET insu_emp_name = CASE WHEN LENGTH(insu_emp_name) <= 2 THEN CONCAT(SUBSTR(insu_emp_name, 1, 1), '*') WHEN LENGTH(insu_emp_name) <= 4 THEN CONCAT(SUBSTR(insu_emp_name, 1, 2), '*') ELSE CONCAT(SUBSTR(insu_emp_name, 1, CEIL(LENGTH(insu_emp_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(insu_emp_name) * 1/3))) END;
-- tel (phone)
UPDATE ads_znjg_ipt_abn_risk_sum_e_mf_ytai SET tel = CASE WHEN LENGTH(tel) <= 8 THEN CONCAT(SUBSTR(tel, 1, 5), REPEAT('*', LENGTH(tel) - 5)) ELSE CONCAT(SUBSTR(tel, 1, CEIL(LENGTH(tel) * 2/3)), REPEAT('*', FLOOR(LENGTH(tel) * 1/3))) END;
-- resd_regn (address)
UPDATE ads_znjg_ipt_abn_risk_sum_e_mf_ytai SET resd_regn = CASE WHEN LENGTH(resd_regn) <= 10 THEN CONCAT(SUBSTR(resd_regn, 1, 7), REPEAT('*', LENGTH(resd_regn) - 7)) ELSE CONCAT(SUBSTR(resd_regn, 1, CEIL(LENGTH(resd_regn) * 2/3)), REPEAT('*', FLOOR(LENGTH(resd_regn) * 1/3))) END;
-- mdtrt_psncnt (medical_record)
UPDATE ads_znjg_ipt_abn_risk_sum_e_mf_ytai SET mdtrt_psncnt = CASE WHEN LENGTH(mdtrt_psncnt) <= 8 THEN CONCAT(SUBSTR(mdtrt_psncnt, 1, 5), REPEAT('*', LENGTH(mdtrt_psncnt) - 5)) ELSE CONCAT(SUBSTR(mdtrt_psncnt, 1, CEIL(LENGTH(mdtrt_psncnt) * 2/3)), REPEAT('*', FLOOR(LENGTH(mdtrt_psncnt) * 1/3))) END;
-- mdtrt_cnt (medical_record)
UPDATE ads_znjg_ipt_abn_risk_sum_e_mf_ytai SET mdtrt_cnt = CASE WHEN LENGTH(mdtrt_cnt) <= 8 THEN CONCAT(SUBSTR(mdtrt_cnt, 1, 5), REPEAT('*', LENGTH(mdtrt_cnt) - 5)) ELSE CONCAT(SUBSTR(mdtrt_cnt, 1, CEIL(LENGTH(mdtrt_cnt) * 2/3)), REPEAT('*', FLOOR(LENGTH(mdtrt_cnt) * 1/3))) END;
-- dw_tab_name (person_name)
UPDATE ads_znjg_ipt_abn_risk_sum_e_mf_ytai SET dw_tab_name = CASE WHEN LENGTH(dw_tab_name) <= 2 THEN CONCAT(SUBSTR(dw_tab_name, 1, 1), '*') WHEN LENGTH(dw_tab_name) <= 4 THEN CONCAT(SUBSTR(dw_tab_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dw_tab_name, 1, CEIL(LENGTH(dw_tab_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dw_tab_name) * 1/3))) END;

-- 表: ads_znjg_opsp_mdtrt_detl_d_mf_ytai
-- psn_no (person_id)
UPDATE ads_znjg_opsp_mdtrt_detl_d_mf_ytai SET psn_no = CASE WHEN LENGTH(psn_no) <= 8 THEN CONCAT(SUBSTR(psn_no, 1, 5), REPEAT('*', LENGTH(psn_no) - 5)) ELSE CONCAT(SUBSTR(psn_no, 1, CEIL(LENGTH(psn_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(psn_no) * 1/3))) END;
-- psn_name (person_name)
UPDATE ads_znjg_opsp_mdtrt_detl_d_mf_ytai SET psn_name = CASE WHEN LENGTH(psn_name) <= 2 THEN CONCAT(SUBSTR(psn_name, 1, 1), '*') WHEN LENGTH(psn_name) <= 4 THEN CONCAT(SUBSTR(psn_name, 1, 2), '*') ELSE CONCAT(SUBSTR(psn_name, 1, CEIL(LENGTH(psn_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(psn_name) * 1/3))) END;
-- mdtrt_id (medical_record)
UPDATE ads_znjg_opsp_mdtrt_detl_d_mf_ytai SET mdtrt_id = CASE WHEN LENGTH(mdtrt_id) <= 8 THEN CONCAT(SUBSTR(mdtrt_id, 1, 5), REPEAT('*', LENGTH(mdtrt_id) - 5)) ELSE CONCAT(SUBSTR(mdtrt_id, 1, CEIL(LENGTH(mdtrt_id) * 2/3)), REPEAT('*', FLOOR(LENGTH(mdtrt_id) * 1/3))) END;
-- fixmedins_code (org_name)
UPDATE ads_znjg_opsp_mdtrt_detl_d_mf_ytai SET fixmedins_code = CASE WHEN LENGTH(fixmedins_code) <= 5 THEN CONCAT(SUBSTR(fixmedins_code, 1, 3), REPEAT('*', LENGTH(fixmedins_code) - 3)) ELSE CONCAT(SUBSTR(fixmedins_code, 1, CEIL(LENGTH(fixmedins_code) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_code) * 1/3))) END;
-- fixmedins_name (person_name)
UPDATE ads_znjg_opsp_mdtrt_detl_d_mf_ytai SET fixmedins_name = CASE WHEN LENGTH(fixmedins_name) <= 2 THEN CONCAT(SUBSTR(fixmedins_name, 1, 1), '*') WHEN LENGTH(fixmedins_name) <= 4 THEN CONCAT(SUBSTR(fixmedins_name, 1, 2), '*') ELSE CONCAT(SUBSTR(fixmedins_name, 1, CEIL(LENGTH(fixmedins_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_name) * 1/3))) END;
-- diag_name (person_name)
UPDATE ads_znjg_opsp_mdtrt_detl_d_mf_ytai SET diag_name = CASE WHEN LENGTH(diag_name) <= 2 THEN CONCAT(SUBSTR(diag_name, 1, 1), '*') WHEN LENGTH(diag_name) <= 4 THEN CONCAT(SUBSTR(diag_name, 1, 2), '*') ELSE CONCAT(SUBSTR(diag_name, 1, CEIL(LENGTH(diag_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(diag_name) * 1/3))) END;
-- certno (id_card)
UPDATE ads_znjg_opsp_mdtrt_detl_d_mf_ytai SET certno = CASE WHEN LENGTH(certno) <= 10 THEN CONCAT(SUBSTR(certno, 1, 7), REPEAT('*', LENGTH(certno) - 7)) ELSE CONCAT(SUBSTR(certno, 1, CEIL(LENGTH(certno) * 2/3)), REPEAT('*', FLOOR(LENGTH(certno) * 1/3))) END;
-- emp_no (org_name)
UPDATE ads_znjg_opsp_mdtrt_detl_d_mf_ytai SET emp_no = CASE WHEN LENGTH(emp_no) <= 5 THEN CONCAT(SUBSTR(emp_no, 1, 3), REPEAT('*', LENGTH(emp_no) - 3)) ELSE CONCAT(SUBSTR(emp_no, 1, CEIL(LENGTH(emp_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(emp_no) * 1/3))) END;
-- emp_name (person_name)
UPDATE ads_znjg_opsp_mdtrt_detl_d_mf_ytai SET emp_name = CASE WHEN LENGTH(emp_name) <= 2 THEN CONCAT(SUBSTR(emp_name, 1, 1), '*') WHEN LENGTH(emp_name) <= 4 THEN CONCAT(SUBSTR(emp_name, 1, 2), '*') ELSE CONCAT(SUBSTR(emp_name, 1, CEIL(LENGTH(emp_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(emp_name) * 1/3))) END;
-- medins_trait (org_name)
UPDATE ads_znjg_opsp_mdtrt_detl_d_mf_ytai SET medins_trait = CASE WHEN LENGTH(medins_trait) <= 5 THEN CONCAT(SUBSTR(medins_trait, 1, 3), REPEAT('*', LENGTH(medins_trait) - 3)) ELSE CONCAT(SUBSTR(medins_trait, 1, CEIL(LENGTH(medins_trait) * 2/3)), REPEAT('*', FLOOR(LENGTH(medins_trait) * 1/3))) END;
-- medins_lv (org_name)
UPDATE ads_znjg_opsp_mdtrt_detl_d_mf_ytai SET medins_lv = CASE WHEN LENGTH(medins_lv) <= 5 THEN CONCAT(SUBSTR(medins_lv, 1, 3), REPEAT('*', LENGTH(medins_lv) - 3)) ELSE CONCAT(SUBSTR(medins_lv, 1, CEIL(LENGTH(medins_lv) * 2/3)), REPEAT('*', FLOOR(LENGTH(medins_lv) * 1/3))) END;
-- mdtrt_cert_type (medical_record)
UPDATE ads_znjg_opsp_mdtrt_detl_d_mf_ytai SET mdtrt_cert_type = CASE WHEN LENGTH(mdtrt_cert_type) <= 8 THEN CONCAT(SUBSTR(mdtrt_cert_type, 1, 5), REPEAT('*', LENGTH(mdtrt_cert_type) - 5)) ELSE CONCAT(SUBSTR(mdtrt_cert_type, 1, CEIL(LENGTH(mdtrt_cert_type) * 2/3)), REPEAT('*', FLOOR(LENGTH(mdtrt_cert_type) * 1/3))) END;
-- mdtrt_cert_no (medical_record)
UPDATE ads_znjg_opsp_mdtrt_detl_d_mf_ytai SET mdtrt_cert_no = CASE WHEN LENGTH(mdtrt_cert_no) <= 8 THEN CONCAT(SUBSTR(mdtrt_cert_no, 1, 5), REPEAT('*', LENGTH(mdtrt_cert_no) - 5)) ELSE CONCAT(SUBSTR(mdtrt_cert_no, 1, CEIL(LENGTH(mdtrt_cert_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(mdtrt_cert_no) * 1/3))) END;
-- dise_name (person_name)
UPDATE ads_znjg_opsp_mdtrt_detl_d_mf_ytai SET dise_name = CASE WHEN LENGTH(dise_name) <= 2 THEN CONCAT(SUBSTR(dise_name, 1, 1), '*') WHEN LENGTH(dise_name) <= 4 THEN CONCAT(SUBSTR(dise_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dise_name, 1, CEIL(LENGTH(dise_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dise_name) * 1/3))) END;
-- dept_name (person_name)
UPDATE ads_znjg_opsp_mdtrt_detl_d_mf_ytai SET dept_name = CASE WHEN LENGTH(dept_name) <= 2 THEN CONCAT(SUBSTR(dept_name, 1, 1), '*') WHEN LENGTH(dept_name) <= 4 THEN CONCAT(SUBSTR(dept_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dept_name, 1, CEIL(LENGTH(dept_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dept_name) * 1/3))) END;
-- chfpdr_code (person_name)
UPDATE ads_znjg_opsp_mdtrt_detl_d_mf_ytai SET chfpdr_code = CASE WHEN LENGTH(chfpdr_code) <= 2 THEN CONCAT(SUBSTR(chfpdr_code, 1, 1), '*') WHEN LENGTH(chfpdr_code) <= 4 THEN CONCAT(SUBSTR(chfpdr_code, 1, 2), '*') ELSE CONCAT(SUBSTR(chfpdr_code, 1, CEIL(LENGTH(chfpdr_code) * 2/3)), REPEAT('*', FLOOR(LENGTH(chfpdr_code) * 1/3))) END;
-- chfpdr_name (person_name)
UPDATE ads_znjg_opsp_mdtrt_detl_d_mf_ytai SET chfpdr_name = CASE WHEN LENGTH(chfpdr_name) <= 2 THEN CONCAT(SUBSTR(chfpdr_name, 1, 1), '*') WHEN LENGTH(chfpdr_name) <= 4 THEN CONCAT(SUBSTR(chfpdr_name, 1, 2), '*') ELSE CONCAT(SUBSTR(chfpdr_name, 1, CEIL(LENGTH(chfpdr_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(chfpdr_name) * 1/3))) END;
-- dw_tab_name (person_name)
UPDATE ads_znjg_opsp_mdtrt_detl_d_mf_ytai SET dw_tab_name = CASE WHEN LENGTH(dw_tab_name) <= 2 THEN CONCAT(SUBSTR(dw_tab_name, 1, 1), '*') WHEN LENGTH(dw_tab_name) <= 4 THEN CONCAT(SUBSTR(dw_tab_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dw_tab_name, 1, CEIL(LENGTH(dw_tab_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dw_tab_name) * 1/3))) END;

-- 表: ads_znjg_opsp_risk_sum_e_mf_ytai
-- admdvs_name (person_name)
UPDATE ads_znjg_opsp_risk_sum_e_mf_ytai SET admdvs_name = CASE WHEN LENGTH(admdvs_name) <= 2 THEN CONCAT(SUBSTR(admdvs_name, 1, 1), '*') WHEN LENGTH(admdvs_name) <= 4 THEN CONCAT(SUBSTR(admdvs_name, 1, 2), '*') ELSE CONCAT(SUBSTR(admdvs_name, 1, CEIL(LENGTH(admdvs_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(admdvs_name) * 1/3))) END;
-- psn_no (person_id)
UPDATE ads_znjg_opsp_risk_sum_e_mf_ytai SET psn_no = CASE WHEN LENGTH(psn_no) <= 8 THEN CONCAT(SUBSTR(psn_no, 1, 5), REPEAT('*', LENGTH(psn_no) - 5)) ELSE CONCAT(SUBSTR(psn_no, 1, CEIL(LENGTH(psn_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(psn_no) * 1/3))) END;
-- psn_name (person_name)
UPDATE ads_znjg_opsp_risk_sum_e_mf_ytai SET psn_name = CASE WHEN LENGTH(psn_name) <= 2 THEN CONCAT(SUBSTR(psn_name, 1, 1), '*') WHEN LENGTH(psn_name) <= 4 THEN CONCAT(SUBSTR(psn_name, 1, 2), '*') ELSE CONCAT(SUBSTR(psn_name, 1, CEIL(LENGTH(psn_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(psn_name) * 1/3))) END;
-- otp_medins_cnt (org_name)
UPDATE ads_znjg_opsp_risk_sum_e_mf_ytai SET otp_medins_cnt = CASE WHEN LENGTH(otp_medins_cnt) <= 5 THEN CONCAT(SUBSTR(otp_medins_cnt, 1, 3), REPEAT('*', LENGTH(otp_medins_cnt) - 3)) ELSE CONCAT(SUBSTR(otp_medins_cnt, 1, CEIL(LENGTH(otp_medins_cnt) * 2/3)), REPEAT('*', FLOOR(LENGTH(otp_medins_cnt) * 1/3))) END;
-- dw_tab_name (person_name)
UPDATE ads_znjg_opsp_risk_sum_e_mf_ytai SET dw_tab_name = CASE WHEN LENGTH(dw_tab_name) <= 2 THEN CONCAT(SUBSTR(dw_tab_name, 1, 1), '*') WHEN LENGTH(dw_tab_name) <= 4 THEN CONCAT(SUBSTR(dw_tab_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dw_tab_name, 1, CEIL(LENGTH(dw_tab_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dw_tab_name) * 1/3))) END;

-- 表: ads_znjg_otp_abn_risk_rgst_detl_d_mf_ytai
-- risk_grp_name (person_name)
UPDATE ads_znjg_otp_abn_risk_rgst_detl_d_mf_ytai SET risk_grp_name = CASE WHEN LENGTH(risk_grp_name) <= 2 THEN CONCAT(SUBSTR(risk_grp_name, 1, 1), '*') WHEN LENGTH(risk_grp_name) <= 4 THEN CONCAT(SUBSTR(risk_grp_name, 1, 2), '*') ELSE CONCAT(SUBSTR(risk_grp_name, 1, CEIL(LENGTH(risk_grp_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(risk_grp_name) * 1/3))) END;
-- mdtrt_id (medical_record)
UPDATE ads_znjg_otp_abn_risk_rgst_detl_d_mf_ytai SET mdtrt_id = CASE WHEN LENGTH(mdtrt_id) <= 8 THEN CONCAT(SUBSTR(mdtrt_id, 1, 5), REPEAT('*', LENGTH(mdtrt_id) - 5)) ELSE CONCAT(SUBSTR(mdtrt_id, 1, CEIL(LENGTH(mdtrt_id) * 2/3)), REPEAT('*', FLOOR(LENGTH(mdtrt_id) * 1/3))) END;
-- mdtrt_sn (medical_record)
UPDATE ads_znjg_otp_abn_risk_rgst_detl_d_mf_ytai SET mdtrt_sn = CASE WHEN LENGTH(mdtrt_sn) <= 8 THEN CONCAT(SUBSTR(mdtrt_sn, 1, 5), REPEAT('*', LENGTH(mdtrt_sn) - 5)) ELSE CONCAT(SUBSTR(mdtrt_sn, 1, CEIL(LENGTH(mdtrt_sn) * 2/3)), REPEAT('*', FLOOR(LENGTH(mdtrt_sn) * 1/3))) END;
-- medins_code (org_name)
UPDATE ads_znjg_otp_abn_risk_rgst_detl_d_mf_ytai SET medins_code = CASE WHEN LENGTH(medins_code) <= 5 THEN CONCAT(SUBSTR(medins_code, 1, 3), REPEAT('*', LENGTH(medins_code) - 3)) ELSE CONCAT(SUBSTR(medins_code, 1, CEIL(LENGTH(medins_code) * 2/3)), REPEAT('*', FLOOR(LENGTH(medins_code) * 1/3))) END;
-- medins_name (person_name)
UPDATE ads_znjg_otp_abn_risk_rgst_detl_d_mf_ytai SET medins_name = CASE WHEN LENGTH(medins_name) <= 2 THEN CONCAT(SUBSTR(medins_name, 1, 1), '*') WHEN LENGTH(medins_name) <= 4 THEN CONCAT(SUBSTR(medins_name, 1, 2), '*') ELSE CONCAT(SUBSTR(medins_name, 1, CEIL(LENGTH(medins_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(medins_name) * 1/3))) END;
-- insu_emp_no (org_name)
UPDATE ads_znjg_otp_abn_risk_rgst_detl_d_mf_ytai SET insu_emp_no = CASE WHEN LENGTH(insu_emp_no) <= 5 THEN CONCAT(SUBSTR(insu_emp_no, 1, 3), REPEAT('*', LENGTH(insu_emp_no) - 3)) ELSE CONCAT(SUBSTR(insu_emp_no, 1, CEIL(LENGTH(insu_emp_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(insu_emp_no) * 1/3))) END;
-- insu_emp_name (person_name)
UPDATE ads_znjg_otp_abn_risk_rgst_detl_d_mf_ytai SET insu_emp_name = CASE WHEN LENGTH(insu_emp_name) <= 2 THEN CONCAT(SUBSTR(insu_emp_name, 1, 1), '*') WHEN LENGTH(insu_emp_name) <= 4 THEN CONCAT(SUBSTR(insu_emp_name, 1, 2), '*') ELSE CONCAT(SUBSTR(insu_emp_name, 1, CEIL(LENGTH(insu_emp_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(insu_emp_name) * 1/3))) END;
-- psn_no (person_id)
UPDATE ads_znjg_otp_abn_risk_rgst_detl_d_mf_ytai SET psn_no = CASE WHEN LENGTH(psn_no) <= 8 THEN CONCAT(SUBSTR(psn_no, 1, 5), REPEAT('*', LENGTH(psn_no) - 5)) ELSE CONCAT(SUBSTR(psn_no, 1, CEIL(LENGTH(psn_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(psn_no) * 1/3))) END;
-- psn_name (person_name)
UPDATE ads_znjg_otp_abn_risk_rgst_detl_d_mf_ytai SET psn_name = CASE WHEN LENGTH(psn_name) <= 2 THEN CONCAT(SUBSTR(psn_name, 1, 1), '*') WHEN LENGTH(psn_name) <= 4 THEN CONCAT(SUBSTR(psn_name, 1, 2), '*') ELSE CONCAT(SUBSTR(psn_name, 1, CEIL(LENGTH(psn_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(psn_name) * 1/3))) END;
-- certno (id_card)
UPDATE ads_znjg_otp_abn_risk_rgst_detl_d_mf_ytai SET certno = CASE WHEN LENGTH(certno) <= 10 THEN CONCAT(SUBSTR(certno, 1, 7), REPEAT('*', LENGTH(certno) - 7)) ELSE CONCAT(SUBSTR(certno, 1, CEIL(LENGTH(certno) * 2/3)), REPEAT('*', FLOOR(LENGTH(certno) * 1/3))) END;
-- dise_name (person_name)
UPDATE ads_znjg_otp_abn_risk_rgst_detl_d_mf_ytai SET dise_name = CASE WHEN LENGTH(dise_name) <= 2 THEN CONCAT(SUBSTR(dise_name, 1, 1), '*') WHEN LENGTH(dise_name) <= 4 THEN CONCAT(SUBSTR(dise_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dise_name, 1, CEIL(LENGTH(dise_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dise_name) * 1/3))) END;
-- med_admdvs (org_name)
UPDATE ads_znjg_otp_abn_risk_rgst_detl_d_mf_ytai SET med_admdvs = CASE WHEN LENGTH(med_admdvs) <= 5 THEN CONCAT(SUBSTR(med_admdvs, 1, 3), REPEAT('*', LENGTH(med_admdvs) - 3)) ELSE CONCAT(SUBSTR(med_admdvs, 1, CEIL(LENGTH(med_admdvs) * 2/3)), REPEAT('*', FLOOR(LENGTH(med_admdvs) * 1/3))) END;
-- medins_trait (org_name)
UPDATE ads_znjg_otp_abn_risk_rgst_detl_d_mf_ytai SET medins_trait = CASE WHEN LENGTH(medins_trait) <= 5 THEN CONCAT(SUBSTR(medins_trait, 1, 3), REPEAT('*', LENGTH(medins_trait) - 3)) ELSE CONCAT(SUBSTR(medins_trait, 1, CEIL(LENGTH(medins_trait) * 2/3)), REPEAT('*', FLOOR(LENGTH(medins_trait) * 1/3))) END;
-- medins_lv (org_name)
UPDATE ads_znjg_otp_abn_risk_rgst_detl_d_mf_ytai SET medins_lv = CASE WHEN LENGTH(medins_lv) <= 5 THEN CONCAT(SUBSTR(medins_lv, 1, 3), REPEAT('*', LENGTH(medins_lv) - 3)) ELSE CONCAT(SUBSTR(medins_lv, 1, CEIL(LENGTH(medins_lv) * 2/3)), REPEAT('*', FLOOR(LENGTH(medins_lv) * 1/3))) END;
-- mdtrt_cert_no (medical_record)
UPDATE ads_znjg_otp_abn_risk_rgst_detl_d_mf_ytai SET mdtrt_cert_no = CASE WHEN LENGTH(mdtrt_cert_no) <= 8 THEN CONCAT(SUBSTR(mdtrt_cert_no, 1, 5), REPEAT('*', LENGTH(mdtrt_cert_no) - 5)) ELSE CONCAT(SUBSTR(mdtrt_cert_no, 1, CEIL(LENGTH(mdtrt_cert_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(mdtrt_cert_no) * 1/3))) END;
-- mdtrt_cert_type (medical_record)
UPDATE ads_znjg_otp_abn_risk_rgst_detl_d_mf_ytai SET mdtrt_cert_type = CASE WHEN LENGTH(mdtrt_cert_type) <= 8 THEN CONCAT(SUBSTR(mdtrt_cert_type, 1, 5), REPEAT('*', LENGTH(mdtrt_cert_type) - 5)) ELSE CONCAT(SUBSTR(mdtrt_cert_type, 1, CEIL(LENGTH(mdtrt_cert_type) * 2/3)), REPEAT('*', FLOOR(LENGTH(mdtrt_cert_type) * 1/3))) END;
-- dept_name (person_name)
UPDATE ads_znjg_otp_abn_risk_rgst_detl_d_mf_ytai SET dept_name = CASE WHEN LENGTH(dept_name) <= 2 THEN CONCAT(SUBSTR(dept_name, 1, 1), '*') WHEN LENGTH(dept_name) <= 4 THEN CONCAT(SUBSTR(dept_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dept_name, 1, CEIL(LENGTH(dept_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dept_name) * 1/3))) END;
-- chfpdr_code (person_name)
UPDATE ads_znjg_otp_abn_risk_rgst_detl_d_mf_ytai SET chfpdr_code = CASE WHEN LENGTH(chfpdr_code) <= 2 THEN CONCAT(SUBSTR(chfpdr_code, 1, 1), '*') WHEN LENGTH(chfpdr_code) <= 4 THEN CONCAT(SUBSTR(chfpdr_code, 1, 2), '*') ELSE CONCAT(SUBSTR(chfpdr_code, 1, CEIL(LENGTH(chfpdr_code) * 2/3)), REPEAT('*', FLOOR(LENGTH(chfpdr_code) * 1/3))) END;
-- chfpdr_name (person_name)
UPDATE ads_znjg_otp_abn_risk_rgst_detl_d_mf_ytai SET chfpdr_name = CASE WHEN LENGTH(chfpdr_name) <= 2 THEN CONCAT(SUBSTR(chfpdr_name, 1, 1), '*') WHEN LENGTH(chfpdr_name) <= 4 THEN CONCAT(SUBSTR(chfpdr_name, 1, 2), '*') ELSE CONCAT(SUBSTR(chfpdr_name, 1, CEIL(LENGTH(chfpdr_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(chfpdr_name) * 1/3))) END;
-- dw_tab_name (person_name)
UPDATE ads_znjg_otp_abn_risk_rgst_detl_d_mf_ytai SET dw_tab_name = CASE WHEN LENGTH(dw_tab_name) <= 2 THEN CONCAT(SUBSTR(dw_tab_name, 1, 1), '*') WHEN LENGTH(dw_tab_name) <= 4 THEN CONCAT(SUBSTR(dw_tab_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dw_tab_name, 1, CEIL(LENGTH(dw_tab_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dw_tab_name) * 1/3))) END;

-- 表: ads_znjg_otp_abn_risk_sum_e_mf_ytai
-- risk_grp_name (person_name)
UPDATE ads_znjg_otp_abn_risk_sum_e_mf_ytai SET risk_grp_name = CASE WHEN LENGTH(risk_grp_name) <= 2 THEN CONCAT(SUBSTR(risk_grp_name, 1, 1), '*') WHEN LENGTH(risk_grp_name) <= 4 THEN CONCAT(SUBSTR(risk_grp_name, 1, 2), '*') ELSE CONCAT(SUBSTR(risk_grp_name, 1, CEIL(LENGTH(risk_grp_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(risk_grp_name) * 1/3))) END;
-- medins_code (org_name)
UPDATE ads_znjg_otp_abn_risk_sum_e_mf_ytai SET medins_code = CASE WHEN LENGTH(medins_code) <= 5 THEN CONCAT(SUBSTR(medins_code, 1, 3), REPEAT('*', LENGTH(medins_code) - 3)) ELSE CONCAT(SUBSTR(medins_code, 1, CEIL(LENGTH(medins_code) * 2/3)), REPEAT('*', FLOOR(LENGTH(medins_code) * 1/3))) END;
-- medins_name (person_name)
UPDATE ads_znjg_otp_abn_risk_sum_e_mf_ytai SET medins_name = CASE WHEN LENGTH(medins_name) <= 2 THEN CONCAT(SUBSTR(medins_name, 1, 1), '*') WHEN LENGTH(medins_name) <= 4 THEN CONCAT(SUBSTR(medins_name, 1, 2), '*') ELSE CONCAT(SUBSTR(medins_name, 1, CEIL(LENGTH(medins_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(medins_name) * 1/3))) END;
-- insu_emp_no (org_name)
UPDATE ads_znjg_otp_abn_risk_sum_e_mf_ytai SET insu_emp_no = CASE WHEN LENGTH(insu_emp_no) <= 5 THEN CONCAT(SUBSTR(insu_emp_no, 1, 3), REPEAT('*', LENGTH(insu_emp_no) - 3)) ELSE CONCAT(SUBSTR(insu_emp_no, 1, CEIL(LENGTH(insu_emp_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(insu_emp_no) * 1/3))) END;
-- insu_emp_name (person_name)
UPDATE ads_znjg_otp_abn_risk_sum_e_mf_ytai SET insu_emp_name = CASE WHEN LENGTH(insu_emp_name) <= 2 THEN CONCAT(SUBSTR(insu_emp_name, 1, 1), '*') WHEN LENGTH(insu_emp_name) <= 4 THEN CONCAT(SUBSTR(insu_emp_name, 1, 2), '*') ELSE CONCAT(SUBSTR(insu_emp_name, 1, CEIL(LENGTH(insu_emp_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(insu_emp_name) * 1/3))) END;
-- medins_swipe_totlnum (org_name)
UPDATE ads_znjg_otp_abn_risk_sum_e_mf_ytai SET medins_swipe_totlnum = CASE WHEN LENGTH(medins_swipe_totlnum) <= 5 THEN CONCAT(SUBSTR(medins_swipe_totlnum, 1, 3), REPEAT('*', LENGTH(medins_swipe_totlnum) - 3)) ELSE CONCAT(SUBSTR(medins_swipe_totlnum, 1, CEIL(LENGTH(medins_swipe_totlnum) * 2/3)), REPEAT('*', FLOOR(LENGTH(medins_swipe_totlnum) * 1/3))) END;
-- dw_tab_name (person_name)
UPDATE ads_znjg_otp_abn_risk_sum_e_mf_ytai SET dw_tab_name = CASE WHEN LENGTH(dw_tab_name) <= 2 THEN CONCAT(SUBSTR(dw_tab_name, 1, 1), '*') WHEN LENGTH(dw_tab_name) <= 4 THEN CONCAT(SUBSTR(dw_tab_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dw_tab_name, 1, CEIL(LENGTH(dw_tab_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dw_tab_name) * 1/3))) END;

-- 表: ads_znjg_purc_drug_abn_risk_rgst_detl_d_mf_ytai
-- risk_grp_name (person_name)
UPDATE ads_znjg_purc_drug_abn_risk_rgst_detl_d_mf_ytai SET risk_grp_name = CASE WHEN LENGTH(risk_grp_name) <= 2 THEN CONCAT(SUBSTR(risk_grp_name, 1, 1), '*') WHEN LENGTH(risk_grp_name) <= 4 THEN CONCAT(SUBSTR(risk_grp_name, 1, 2), '*') ELSE CONCAT(SUBSTR(risk_grp_name, 1, CEIL(LENGTH(risk_grp_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(risk_grp_name) * 1/3))) END;
-- mdtrt_id (medical_record)
UPDATE ads_znjg_purc_drug_abn_risk_rgst_detl_d_mf_ytai SET mdtrt_id = CASE WHEN LENGTH(mdtrt_id) <= 8 THEN CONCAT(SUBSTR(mdtrt_id, 1, 5), REPEAT('*', LENGTH(mdtrt_id) - 5)) ELSE CONCAT(SUBSTR(mdtrt_id, 1, CEIL(LENGTH(mdtrt_id) * 2/3)), REPEAT('*', FLOOR(LENGTH(mdtrt_id) * 1/3))) END;
-- mdtrt_sn (medical_record)
UPDATE ads_znjg_purc_drug_abn_risk_rgst_detl_d_mf_ytai SET mdtrt_sn = CASE WHEN LENGTH(mdtrt_sn) <= 8 THEN CONCAT(SUBSTR(mdtrt_sn, 1, 5), REPEAT('*', LENGTH(mdtrt_sn) - 5)) ELSE CONCAT(SUBSTR(mdtrt_sn, 1, CEIL(LENGTH(mdtrt_sn) * 2/3)), REPEAT('*', FLOOR(LENGTH(mdtrt_sn) * 1/3))) END;
-- medins_code (org_name)
UPDATE ads_znjg_purc_drug_abn_risk_rgst_detl_d_mf_ytai SET medins_code = CASE WHEN LENGTH(medins_code) <= 5 THEN CONCAT(SUBSTR(medins_code, 1, 3), REPEAT('*', LENGTH(medins_code) - 3)) ELSE CONCAT(SUBSTR(medins_code, 1, CEIL(LENGTH(medins_code) * 2/3)), REPEAT('*', FLOOR(LENGTH(medins_code) * 1/3))) END;
-- medins_name (person_name)
UPDATE ads_znjg_purc_drug_abn_risk_rgst_detl_d_mf_ytai SET medins_name = CASE WHEN LENGTH(medins_name) <= 2 THEN CONCAT(SUBSTR(medins_name, 1, 1), '*') WHEN LENGTH(medins_name) <= 4 THEN CONCAT(SUBSTR(medins_name, 1, 2), '*') ELSE CONCAT(SUBSTR(medins_name, 1, CEIL(LENGTH(medins_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(medins_name) * 1/3))) END;
-- psn_no (person_id)
UPDATE ads_znjg_purc_drug_abn_risk_rgst_detl_d_mf_ytai SET psn_no = CASE WHEN LENGTH(psn_no) <= 8 THEN CONCAT(SUBSTR(psn_no, 1, 5), REPEAT('*', LENGTH(psn_no) - 5)) ELSE CONCAT(SUBSTR(psn_no, 1, CEIL(LENGTH(psn_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(psn_no) * 1/3))) END;
-- psn_name (person_name)
UPDATE ads_znjg_purc_drug_abn_risk_rgst_detl_d_mf_ytai SET psn_name = CASE WHEN LENGTH(psn_name) <= 2 THEN CONCAT(SUBSTR(psn_name, 1, 1), '*') WHEN LENGTH(psn_name) <= 4 THEN CONCAT(SUBSTR(psn_name, 1, 2), '*') ELSE CONCAT(SUBSTR(psn_name, 1, CEIL(LENGTH(psn_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(psn_name) * 1/3))) END;
-- certno (id_card)
UPDATE ads_znjg_purc_drug_abn_risk_rgst_detl_d_mf_ytai SET certno = CASE WHEN LENGTH(certno) <= 10 THEN CONCAT(SUBSTR(certno, 1, 7), REPEAT('*', LENGTH(certno) - 7)) ELSE CONCAT(SUBSTR(certno, 1, CEIL(LENGTH(certno) * 2/3)), REPEAT('*', FLOOR(LENGTH(certno) * 1/3))) END;
-- insu_emp_no (org_name)
UPDATE ads_znjg_purc_drug_abn_risk_rgst_detl_d_mf_ytai SET insu_emp_no = CASE WHEN LENGTH(insu_emp_no) <= 5 THEN CONCAT(SUBSTR(insu_emp_no, 1, 3), REPEAT('*', LENGTH(insu_emp_no) - 3)) ELSE CONCAT(SUBSTR(insu_emp_no, 1, CEIL(LENGTH(insu_emp_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(insu_emp_no) * 1/3))) END;
-- insu_emp_name (person_name)
UPDATE ads_znjg_purc_drug_abn_risk_rgst_detl_d_mf_ytai SET insu_emp_name = CASE WHEN LENGTH(insu_emp_name) <= 2 THEN CONCAT(SUBSTR(insu_emp_name, 1, 1), '*') WHEN LENGTH(insu_emp_name) <= 4 THEN CONCAT(SUBSTR(insu_emp_name, 1, 2), '*') ELSE CONCAT(SUBSTR(insu_emp_name, 1, CEIL(LENGTH(insu_emp_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(insu_emp_name) * 1/3))) END;
-- med_admdvs (org_name)
UPDATE ads_znjg_purc_drug_abn_risk_rgst_detl_d_mf_ytai SET med_admdvs = CASE WHEN LENGTH(med_admdvs) <= 5 THEN CONCAT(SUBSTR(med_admdvs, 1, 3), REPEAT('*', LENGTH(med_admdvs) - 3)) ELSE CONCAT(SUBSTR(med_admdvs, 1, CEIL(LENGTH(med_admdvs) * 2/3)), REPEAT('*', FLOOR(LENGTH(med_admdvs) * 1/3))) END;
-- mdtrt_cert_no (medical_record)
UPDATE ads_znjg_purc_drug_abn_risk_rgst_detl_d_mf_ytai SET mdtrt_cert_no = CASE WHEN LENGTH(mdtrt_cert_no) <= 8 THEN CONCAT(SUBSTR(mdtrt_cert_no, 1, 5), REPEAT('*', LENGTH(mdtrt_cert_no) - 5)) ELSE CONCAT(SUBSTR(mdtrt_cert_no, 1, CEIL(LENGTH(mdtrt_cert_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(mdtrt_cert_no) * 1/3))) END;
-- mdtrt_cert_type (medical_record)
UPDATE ads_znjg_purc_drug_abn_risk_rgst_detl_d_mf_ytai SET mdtrt_cert_type = CASE WHEN LENGTH(mdtrt_cert_type) <= 8 THEN CONCAT(SUBSTR(mdtrt_cert_type, 1, 5), REPEAT('*', LENGTH(mdtrt_cert_type) - 5)) ELSE CONCAT(SUBSTR(mdtrt_cert_type, 1, CEIL(LENGTH(mdtrt_cert_type) * 2/3)), REPEAT('*', FLOOR(LENGTH(mdtrt_cert_type) * 1/3))) END;
-- chfpdr_code (person_name)
UPDATE ads_znjg_purc_drug_abn_risk_rgst_detl_d_mf_ytai SET chfpdr_code = CASE WHEN LENGTH(chfpdr_code) <= 2 THEN CONCAT(SUBSTR(chfpdr_code, 1, 1), '*') WHEN LENGTH(chfpdr_code) <= 4 THEN CONCAT(SUBSTR(chfpdr_code, 1, 2), '*') ELSE CONCAT(SUBSTR(chfpdr_code, 1, CEIL(LENGTH(chfpdr_code) * 2/3)), REPEAT('*', FLOOR(LENGTH(chfpdr_code) * 1/3))) END;
-- chfpdr_name (person_name)
UPDATE ads_znjg_purc_drug_abn_risk_rgst_detl_d_mf_ytai SET chfpdr_name = CASE WHEN LENGTH(chfpdr_name) <= 2 THEN CONCAT(SUBSTR(chfpdr_name, 1, 1), '*') WHEN LENGTH(chfpdr_name) <= 4 THEN CONCAT(SUBSTR(chfpdr_name, 1, 2), '*') ELSE CONCAT(SUBSTR(chfpdr_name, 1, CEIL(LENGTH(chfpdr_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(chfpdr_name) * 1/3))) END;
-- diag_name (person_name)
UPDATE ads_znjg_purc_drug_abn_risk_rgst_detl_d_mf_ytai SET diag_name = CASE WHEN LENGTH(diag_name) <= 2 THEN CONCAT(SUBSTR(diag_name, 1, 1), '*') WHEN LENGTH(diag_name) <= 4 THEN CONCAT(SUBSTR(diag_name, 1, 2), '*') ELSE CONCAT(SUBSTR(diag_name, 1, CEIL(LENGTH(diag_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(diag_name) * 1/3))) END;
-- dise_name (person_name)
UPDATE ads_znjg_purc_drug_abn_risk_rgst_detl_d_mf_ytai SET dise_name = CASE WHEN LENGTH(dise_name) <= 2 THEN CONCAT(SUBSTR(dise_name, 1, 1), '*') WHEN LENGTH(dise_name) <= 4 THEN CONCAT(SUBSTR(dise_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dise_name, 1, CEIL(LENGTH(dise_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dise_name) * 1/3))) END;
-- dw_tab_name (person_name)
UPDATE ads_znjg_purc_drug_abn_risk_rgst_detl_d_mf_ytai SET dw_tab_name = CASE WHEN LENGTH(dw_tab_name) <= 2 THEN CONCAT(SUBSTR(dw_tab_name, 1, 1), '*') WHEN LENGTH(dw_tab_name) <= 4 THEN CONCAT(SUBSTR(dw_tab_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dw_tab_name, 1, CEIL(LENGTH(dw_tab_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dw_tab_name) * 1/3))) END;

-- 表: ads_znjg_purc_drug_abn_risk_sum_e_mf_ytai
-- risk_grp_name (person_name)
UPDATE ads_znjg_purc_drug_abn_risk_sum_e_mf_ytai SET risk_grp_name = CASE WHEN LENGTH(risk_grp_name) <= 2 THEN CONCAT(SUBSTR(risk_grp_name, 1, 1), '*') WHEN LENGTH(risk_grp_name) <= 4 THEN CONCAT(SUBSTR(risk_grp_name, 1, 2), '*') ELSE CONCAT(SUBSTR(risk_grp_name, 1, CEIL(LENGTH(risk_grp_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(risk_grp_name) * 1/3))) END;
-- medins_code (org_name)
UPDATE ads_znjg_purc_drug_abn_risk_sum_e_mf_ytai SET medins_code = CASE WHEN LENGTH(medins_code) <= 5 THEN CONCAT(SUBSTR(medins_code, 1, 3), REPEAT('*', LENGTH(medins_code) - 3)) ELSE CONCAT(SUBSTR(medins_code, 1, CEIL(LENGTH(medins_code) * 2/3)), REPEAT('*', FLOOR(LENGTH(medins_code) * 1/3))) END;
-- medins_name (person_name)
UPDATE ads_znjg_purc_drug_abn_risk_sum_e_mf_ytai SET medins_name = CASE WHEN LENGTH(medins_name) <= 2 THEN CONCAT(SUBSTR(medins_name, 1, 1), '*') WHEN LENGTH(medins_name) <= 4 THEN CONCAT(SUBSTR(medins_name, 1, 2), '*') ELSE CONCAT(SUBSTR(medins_name, 1, CEIL(LENGTH(medins_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(medins_name) * 1/3))) END;
-- insu_emp_no (org_name)
UPDATE ads_znjg_purc_drug_abn_risk_sum_e_mf_ytai SET insu_emp_no = CASE WHEN LENGTH(insu_emp_no) <= 5 THEN CONCAT(SUBSTR(insu_emp_no, 1, 3), REPEAT('*', LENGTH(insu_emp_no) - 3)) ELSE CONCAT(SUBSTR(insu_emp_no, 1, CEIL(LENGTH(insu_emp_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(insu_emp_no) * 1/3))) END;
-- insu_emp_name (person_name)
UPDATE ads_znjg_purc_drug_abn_risk_sum_e_mf_ytai SET insu_emp_name = CASE WHEN LENGTH(insu_emp_name) <= 2 THEN CONCAT(SUBSTR(insu_emp_name, 1, 1), '*') WHEN LENGTH(insu_emp_name) <= 4 THEN CONCAT(SUBSTR(insu_emp_name, 1, 2), '*') ELSE CONCAT(SUBSTR(insu_emp_name, 1, CEIL(LENGTH(insu_emp_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(insu_emp_name) * 1/3))) END;
-- drtday_medins_swipe_totlnum (org_name)
UPDATE ads_znjg_purc_drug_abn_risk_sum_e_mf_ytai SET drtday_medins_swipe_totlnum = CASE WHEN LENGTH(drtday_medins_swipe_totlnum) <= 5 THEN CONCAT(SUBSTR(drtday_medins_swipe_totlnum, 1, 3), REPEAT('*', LENGTH(drtday_medins_swipe_totlnum) - 3)) ELSE CONCAT(SUBSTR(drtday_medins_swipe_totlnum, 1, CEIL(LENGTH(drtday_medins_swipe_totlnum) * 2/3)), REPEAT('*', FLOOR(LENGTH(drtday_medins_swipe_totlnum) * 1/3))) END;
-- dw_tab_name (person_name)
UPDATE ads_znjg_purc_drug_abn_risk_sum_e_mf_ytai SET dw_tab_name = CASE WHEN LENGTH(dw_tab_name) <= 2 THEN CONCAT(SUBSTR(dw_tab_name, 1, 1), '*') WHEN LENGTH(dw_tab_name) <= 4 THEN CONCAT(SUBSTR(dw_tab_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dw_tab_name, 1, CEIL(LENGTH(dw_tab_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dw_tab_name) * 1/3))) END;

-- 表: ads_znjg_risk_brek_ipt_mdtrt_d_mf_ytai
-- psn_no (person_id)
UPDATE ads_znjg_risk_brek_ipt_mdtrt_d_mf_ytai SET psn_no = CASE WHEN LENGTH(psn_no) <= 8 THEN CONCAT(SUBSTR(psn_no, 1, 5), REPEAT('*', LENGTH(psn_no) - 5)) ELSE CONCAT(SUBSTR(psn_no, 1, CEIL(LENGTH(psn_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(psn_no) * 1/3))) END;
-- mdtrt_sn (medical_record)
UPDATE ads_znjg_risk_brek_ipt_mdtrt_d_mf_ytai SET mdtrt_sn = CASE WHEN LENGTH(mdtrt_sn) <= 8 THEN CONCAT(SUBSTR(mdtrt_sn, 1, 5), REPEAT('*', LENGTH(mdtrt_sn) - 5)) ELSE CONCAT(SUBSTR(mdtrt_sn, 1, CEIL(LENGTH(mdtrt_sn) * 2/3)), REPEAT('*', FLOOR(LENGTH(mdtrt_sn) * 1/3))) END;
-- mdtrt_id (medical_record)
UPDATE ads_znjg_risk_brek_ipt_mdtrt_d_mf_ytai SET mdtrt_id = CASE WHEN LENGTH(mdtrt_id) <= 8 THEN CONCAT(SUBSTR(mdtrt_id, 1, 5), REPEAT('*', LENGTH(mdtrt_id) - 5)) ELSE CONCAT(SUBSTR(mdtrt_id, 1, CEIL(LENGTH(mdtrt_id) * 2/3)), REPEAT('*', FLOOR(LENGTH(mdtrt_id) * 1/3))) END;
-- fixmedins_code (org_name)
UPDATE ads_znjg_risk_brek_ipt_mdtrt_d_mf_ytai SET fixmedins_code = CASE WHEN LENGTH(fixmedins_code) <= 5 THEN CONCAT(SUBSTR(fixmedins_code, 1, 3), REPEAT('*', LENGTH(fixmedins_code) - 3)) ELSE CONCAT(SUBSTR(fixmedins_code, 1, CEIL(LENGTH(fixmedins_code) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_code) * 1/3))) END;
-- fixmedins_name (person_name)
UPDATE ads_znjg_risk_brek_ipt_mdtrt_d_mf_ytai SET fixmedins_name = CASE WHEN LENGTH(fixmedins_name) <= 2 THEN CONCAT(SUBSTR(fixmedins_name, 1, 1), '*') WHEN LENGTH(fixmedins_name) <= 4 THEN CONCAT(SUBSTR(fixmedins_name, 1, 2), '*') ELSE CONCAT(SUBSTR(fixmedins_name, 1, CEIL(LENGTH(fixmedins_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_name) * 1/3))) END;
-- dept_name (person_name)
UPDATE ads_znjg_risk_brek_ipt_mdtrt_d_mf_ytai SET dept_name = CASE WHEN LENGTH(dept_name) <= 2 THEN CONCAT(SUBSTR(dept_name, 1, 1), '*') WHEN LENGTH(dept_name) <= 4 THEN CONCAT(SUBSTR(dept_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dept_name, 1, CEIL(LENGTH(dept_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dept_name) * 1/3))) END;
-- atddr_code (person_name)
UPDATE ads_znjg_risk_brek_ipt_mdtrt_d_mf_ytai SET atddr_code = CASE WHEN LENGTH(atddr_code) <= 2 THEN CONCAT(SUBSTR(atddr_code, 1, 1), '*') WHEN LENGTH(atddr_code) <= 4 THEN CONCAT(SUBSTR(atddr_code, 1, 2), '*') ELSE CONCAT(SUBSTR(atddr_code, 1, CEIL(LENGTH(atddr_code) * 2/3)), REPEAT('*', FLOOR(LENGTH(atddr_code) * 1/3))) END;
-- atddr_name (person_name)
UPDATE ads_znjg_risk_brek_ipt_mdtrt_d_mf_ytai SET atddr_name = CASE WHEN LENGTH(atddr_name) <= 2 THEN CONCAT(SUBSTR(atddr_name, 1, 1), '*') WHEN LENGTH(atddr_name) <= 4 THEN CONCAT(SUBSTR(atddr_name, 1, 2), '*') ELSE CONCAT(SUBSTR(atddr_name, 1, CEIL(LENGTH(atddr_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(atddr_name) * 1/3))) END;
-- diag_name (person_name)
UPDATE ads_znjg_risk_brek_ipt_mdtrt_d_mf_ytai SET diag_name = CASE WHEN LENGTH(diag_name) <= 2 THEN CONCAT(SUBSTR(diag_name, 1, 1), '*') WHEN LENGTH(diag_name) <= 4 THEN CONCAT(SUBSTR(diag_name, 1, 2), '*') ELSE CONCAT(SUBSTR(diag_name, 1, CEIL(LENGTH(diag_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(diag_name) * 1/3))) END;
-- psn_name (person_name)
UPDATE ads_znjg_risk_brek_ipt_mdtrt_d_mf_ytai SET psn_name = CASE WHEN LENGTH(psn_name) <= 2 THEN CONCAT(SUBSTR(psn_name, 1, 1), '*') WHEN LENGTH(psn_name) <= 4 THEN CONCAT(SUBSTR(psn_name, 1, 2), '*') ELSE CONCAT(SUBSTR(psn_name, 1, CEIL(LENGTH(psn_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(psn_name) * 1/3))) END;
-- certno (id_card)
UPDATE ads_znjg_risk_brek_ipt_mdtrt_d_mf_ytai SET certno = CASE WHEN LENGTH(certno) <= 10 THEN CONCAT(SUBSTR(certno, 1, 7), REPEAT('*', LENGTH(certno) - 7)) ELSE CONCAT(SUBSTR(certno, 1, CEIL(LENGTH(certno) * 2/3)), REPEAT('*', FLOOR(LENGTH(certno) * 1/3))) END;
-- emp_no (org_name)
UPDATE ads_znjg_risk_brek_ipt_mdtrt_d_mf_ytai SET emp_no = CASE WHEN LENGTH(emp_no) <= 5 THEN CONCAT(SUBSTR(emp_no, 1, 3), REPEAT('*', LENGTH(emp_no) - 3)) ELSE CONCAT(SUBSTR(emp_no, 1, CEIL(LENGTH(emp_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(emp_no) * 1/3))) END;
-- emp_name (person_name)
UPDATE ads_znjg_risk_brek_ipt_mdtrt_d_mf_ytai SET emp_name = CASE WHEN LENGTH(emp_name) <= 2 THEN CONCAT(SUBSTR(emp_name, 1, 1), '*') WHEN LENGTH(emp_name) <= 4 THEN CONCAT(SUBSTR(emp_name, 1, 2), '*') ELSE CONCAT(SUBSTR(emp_name, 1, CEIL(LENGTH(emp_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(emp_name) * 1/3))) END;
-- medins_trait (org_name)
UPDATE ads_znjg_risk_brek_ipt_mdtrt_d_mf_ytai SET medins_trait = CASE WHEN LENGTH(medins_trait) <= 5 THEN CONCAT(SUBSTR(medins_trait, 1, 3), REPEAT('*', LENGTH(medins_trait) - 3)) ELSE CONCAT(SUBSTR(medins_trait, 1, CEIL(LENGTH(medins_trait) * 2/3)), REPEAT('*', FLOOR(LENGTH(medins_trait) * 1/3))) END;
-- medins_lv (org_name)
UPDATE ads_znjg_risk_brek_ipt_mdtrt_d_mf_ytai SET medins_lv = CASE WHEN LENGTH(medins_lv) <= 5 THEN CONCAT(SUBSTR(medins_lv, 1, 3), REPEAT('*', LENGTH(medins_lv) - 3)) ELSE CONCAT(SUBSTR(medins_lv, 1, CEIL(LENGTH(medins_lv) * 2/3)), REPEAT('*', FLOOR(LENGTH(medins_lv) * 1/3))) END;
-- mdtrt_cert_type (medical_record)
UPDATE ads_znjg_risk_brek_ipt_mdtrt_d_mf_ytai SET mdtrt_cert_type = CASE WHEN LENGTH(mdtrt_cert_type) <= 8 THEN CONCAT(SUBSTR(mdtrt_cert_type, 1, 5), REPEAT('*', LENGTH(mdtrt_cert_type) - 5)) ELSE CONCAT(SUBSTR(mdtrt_cert_type, 1, CEIL(LENGTH(mdtrt_cert_type) * 2/3)), REPEAT('*', FLOOR(LENGTH(mdtrt_cert_type) * 1/3))) END;
-- mdtrt_cert_no (medical_record)
UPDATE ads_znjg_risk_brek_ipt_mdtrt_d_mf_ytai SET mdtrt_cert_no = CASE WHEN LENGTH(mdtrt_cert_no) <= 8 THEN CONCAT(SUBSTR(mdtrt_cert_no, 1, 5), REPEAT('*', LENGTH(mdtrt_cert_no) - 5)) ELSE CONCAT(SUBSTR(mdtrt_cert_no, 1, CEIL(LENGTH(mdtrt_cert_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(mdtrt_cert_no) * 1/3))) END;
-- dise_name (person_name)
UPDATE ads_znjg_risk_brek_ipt_mdtrt_d_mf_ytai SET dise_name = CASE WHEN LENGTH(dise_name) <= 2 THEN CONCAT(SUBSTR(dise_name, 1, 1), '*') WHEN LENGTH(dise_name) <= 4 THEN CONCAT(SUBSTR(dise_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dise_name, 1, CEIL(LENGTH(dise_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dise_name) * 1/3))) END;
-- dw_tab_name (person_name)
UPDATE ads_znjg_risk_brek_ipt_mdtrt_d_mf_ytai SET dw_tab_name = CASE WHEN LENGTH(dw_tab_name) <= 2 THEN CONCAT(SUBSTR(dw_tab_name, 1, 1), '*') WHEN LENGTH(dw_tab_name) <= 4 THEN CONCAT(SUBSTR(dw_tab_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dw_tab_name, 1, CEIL(LENGTH(dw_tab_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dw_tab_name) * 1/3))) END;

-- 表: ads_znjg_risk_brek_ipt_sum_d_mf_ytai
-- psn_no (person_id)
UPDATE ads_znjg_risk_brek_ipt_sum_d_mf_ytai SET psn_no = CASE WHEN LENGTH(psn_no) <= 8 THEN CONCAT(SUBSTR(psn_no, 1, 5), REPEAT('*', LENGTH(psn_no) - 5)) ELSE CONCAT(SUBSTR(psn_no, 1, CEIL(LENGTH(psn_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(psn_no) * 1/3))) END;
-- grp_medins_cnt (org_name)
UPDATE ads_znjg_risk_brek_ipt_sum_d_mf_ytai SET grp_medins_cnt = CASE WHEN LENGTH(grp_medins_cnt) <= 5 THEN CONCAT(SUBSTR(grp_medins_cnt, 1, 3), REPEAT('*', LENGTH(grp_medins_cnt) - 3)) ELSE CONCAT(SUBSTR(grp_medins_cnt, 1, CEIL(LENGTH(grp_medins_cnt) * 2/3)), REPEAT('*', FLOOR(LENGTH(grp_medins_cnt) * 1/3))) END;
-- grp_doc_cnt (person_name)
UPDATE ads_znjg_risk_brek_ipt_sum_d_mf_ytai SET grp_doc_cnt = CASE WHEN LENGTH(grp_doc_cnt) <= 2 THEN CONCAT(SUBSTR(grp_doc_cnt, 1, 1), '*') WHEN LENGTH(grp_doc_cnt) <= 4 THEN CONCAT(SUBSTR(grp_doc_cnt, 1, 2), '*') ELSE CONCAT(SUBSTR(grp_doc_cnt, 1, CEIL(LENGTH(grp_doc_cnt) * 2/3)), REPEAT('*', FLOOR(LENGTH(grp_doc_cnt) * 1/3))) END;
-- mdtrt_psntime (medical_record)
UPDATE ads_znjg_risk_brek_ipt_sum_d_mf_ytai SET mdtrt_psntime = CASE WHEN LENGTH(mdtrt_psntime) <= 8 THEN CONCAT(SUBSTR(mdtrt_psntime, 1, 5), REPEAT('*', LENGTH(mdtrt_psntime) - 5)) ELSE CONCAT(SUBSTR(mdtrt_psntime, 1, CEIL(LENGTH(mdtrt_psntime) * 2/3)), REPEAT('*', FLOOR(LENGTH(mdtrt_psntime) * 1/3))) END;
-- sim_medins_risk (org_name)
UPDATE ads_znjg_risk_brek_ipt_sum_d_mf_ytai SET sim_medins_risk = CASE WHEN LENGTH(sim_medins_risk) <= 5 THEN CONCAT(SUBSTR(sim_medins_risk, 1, 3), REPEAT('*', LENGTH(sim_medins_risk) - 3)) ELSE CONCAT(SUBSTR(sim_medins_risk, 1, CEIL(LENGTH(sim_medins_risk) * 2/3)), REPEAT('*', FLOOR(LENGTH(sim_medins_risk) * 1/3))) END;
-- psn_name (person_name)
UPDATE ads_znjg_risk_brek_ipt_sum_d_mf_ytai SET psn_name = CASE WHEN LENGTH(psn_name) <= 2 THEN CONCAT(SUBSTR(psn_name, 1, 1), '*') WHEN LENGTH(psn_name) <= 4 THEN CONCAT(SUBSTR(psn_name, 1, 2), '*') ELSE CONCAT(SUBSTR(psn_name, 1, CEIL(LENGTH(psn_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(psn_name) * 1/3))) END;
-- sim_doc_risk (person_name)
UPDATE ads_znjg_risk_brek_ipt_sum_d_mf_ytai SET sim_doc_risk = CASE WHEN LENGTH(sim_doc_risk) <= 2 THEN CONCAT(SUBSTR(sim_doc_risk, 1, 1), '*') WHEN LENGTH(sim_doc_risk) <= 4 THEN CONCAT(SUBSTR(sim_doc_risk, 1, 2), '*') ELSE CONCAT(SUBSTR(sim_doc_risk, 1, CEIL(LENGTH(sim_doc_risk) * 2/3)), REPEAT('*', FLOOR(LENGTH(sim_doc_risk) * 1/3))) END;
-- dw_tab_name (person_name)
UPDATE ads_znjg_risk_brek_ipt_sum_d_mf_ytai SET dw_tab_name = CASE WHEN LENGTH(dw_tab_name) <= 2 THEN CONCAT(SUBSTR(dw_tab_name, 1, 1), '*') WHEN LENGTH(dw_tab_name) <= 4 THEN CONCAT(SUBSTR(dw_tab_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dw_tab_name, 1, CEIL(LENGTH(dw_tab_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dw_tab_name) * 1/3))) END;

-- 表: ads_znjg_risk_card_agg_mdtrt_d_mf_ytai
-- psn_no (person_id)
UPDATE ads_znjg_risk_card_agg_mdtrt_d_mf_ytai SET psn_no = CASE WHEN LENGTH(psn_no) <= 8 THEN CONCAT(SUBSTR(psn_no, 1, 5), REPEAT('*', LENGTH(psn_no) - 5)) ELSE CONCAT(SUBSTR(psn_no, 1, CEIL(LENGTH(psn_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(psn_no) * 1/3))) END;
-- psn_name (person_name)
UPDATE ads_znjg_risk_card_agg_mdtrt_d_mf_ytai SET psn_name = CASE WHEN LENGTH(psn_name) <= 2 THEN CONCAT(SUBSTR(psn_name, 1, 1), '*') WHEN LENGTH(psn_name) <= 4 THEN CONCAT(SUBSTR(psn_name, 1, 2), '*') ELSE CONCAT(SUBSTR(psn_name, 1, CEIL(LENGTH(psn_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(psn_name) * 1/3))) END;
-- mdtrt_id (medical_record)
UPDATE ads_znjg_risk_card_agg_mdtrt_d_mf_ytai SET mdtrt_id = CASE WHEN LENGTH(mdtrt_id) <= 8 THEN CONCAT(SUBSTR(mdtrt_id, 1, 5), REPEAT('*', LENGTH(mdtrt_id) - 5)) ELSE CONCAT(SUBSTR(mdtrt_id, 1, CEIL(LENGTH(mdtrt_id) * 2/3)), REPEAT('*', FLOOR(LENGTH(mdtrt_id) * 1/3))) END;
-- live_addr (address)
UPDATE ads_znjg_risk_card_agg_mdtrt_d_mf_ytai SET live_addr = CASE WHEN LENGTH(live_addr) <= 10 THEN CONCAT(SUBSTR(live_addr, 1, 7), REPEAT('*', LENGTH(live_addr) - 7)) ELSE CONCAT(SUBSTR(live_addr, 1, CEIL(LENGTH(live_addr) * 2/3)), REPEAT('*', FLOOR(LENGTH(live_addr) * 1/3))) END;
-- emp_no (org_name)
UPDATE ads_znjg_risk_card_agg_mdtrt_d_mf_ytai SET emp_no = CASE WHEN LENGTH(emp_no) <= 5 THEN CONCAT(SUBSTR(emp_no, 1, 3), REPEAT('*', LENGTH(emp_no) - 3)) ELSE CONCAT(SUBSTR(emp_no, 1, CEIL(LENGTH(emp_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(emp_no) * 1/3))) END;
-- fixmedins_code (org_name)
UPDATE ads_znjg_risk_card_agg_mdtrt_d_mf_ytai SET fixmedins_code = CASE WHEN LENGTH(fixmedins_code) <= 5 THEN CONCAT(SUBSTR(fixmedins_code, 1, 3), REPEAT('*', LENGTH(fixmedins_code) - 3)) ELSE CONCAT(SUBSTR(fixmedins_code, 1, CEIL(LENGTH(fixmedins_code) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_code) * 1/3))) END;
-- fixmedins_name (person_name)
UPDATE ads_znjg_risk_card_agg_mdtrt_d_mf_ytai SET fixmedins_name = CASE WHEN LENGTH(fixmedins_name) <= 2 THEN CONCAT(SUBSTR(fixmedins_name, 1, 1), '*') WHEN LENGTH(fixmedins_name) <= 4 THEN CONCAT(SUBSTR(fixmedins_name, 1, 2), '*') ELSE CONCAT(SUBSTR(fixmedins_name, 1, CEIL(LENGTH(fixmedins_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_name) * 1/3))) END;
-- dept_name (person_name)
UPDATE ads_znjg_risk_card_agg_mdtrt_d_mf_ytai SET dept_name = CASE WHEN LENGTH(dept_name) <= 2 THEN CONCAT(SUBSTR(dept_name, 1, 1), '*') WHEN LENGTH(dept_name) <= 4 THEN CONCAT(SUBSTR(dept_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dept_name, 1, CEIL(LENGTH(dept_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dept_name) * 1/3))) END;
-- chfpdr_code (person_name)
UPDATE ads_znjg_risk_card_agg_mdtrt_d_mf_ytai SET chfpdr_code = CASE WHEN LENGTH(chfpdr_code) <= 2 THEN CONCAT(SUBSTR(chfpdr_code, 1, 1), '*') WHEN LENGTH(chfpdr_code) <= 4 THEN CONCAT(SUBSTR(chfpdr_code, 1, 2), '*') ELSE CONCAT(SUBSTR(chfpdr_code, 1, CEIL(LENGTH(chfpdr_code) * 2/3)), REPEAT('*', FLOOR(LENGTH(chfpdr_code) * 1/3))) END;
-- chfpdr_name (person_name)
UPDATE ads_znjg_risk_card_agg_mdtrt_d_mf_ytai SET chfpdr_name = CASE WHEN LENGTH(chfpdr_name) <= 2 THEN CONCAT(SUBSTR(chfpdr_name, 1, 1), '*') WHEN LENGTH(chfpdr_name) <= 4 THEN CONCAT(SUBSTR(chfpdr_name, 1, 2), '*') ELSE CONCAT(SUBSTR(chfpdr_name, 1, CEIL(LENGTH(chfpdr_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(chfpdr_name) * 1/3))) END;
-- diag_name (person_name)
UPDATE ads_znjg_risk_card_agg_mdtrt_d_mf_ytai SET diag_name = CASE WHEN LENGTH(diag_name) <= 2 THEN CONCAT(SUBSTR(diag_name, 1, 1), '*') WHEN LENGTH(diag_name) <= 4 THEN CONCAT(SUBSTR(diag_name, 1, 2), '*') ELSE CONCAT(SUBSTR(diag_name, 1, CEIL(LENGTH(diag_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(diag_name) * 1/3))) END;
-- certno (id_card)
UPDATE ads_znjg_risk_card_agg_mdtrt_d_mf_ytai SET certno = CASE WHEN LENGTH(certno) <= 10 THEN CONCAT(SUBSTR(certno, 1, 7), REPEAT('*', LENGTH(certno) - 7)) ELSE CONCAT(SUBSTR(certno, 1, CEIL(LENGTH(certno) * 2/3)), REPEAT('*', FLOOR(LENGTH(certno) * 1/3))) END;
-- emp_name (person_name)
UPDATE ads_znjg_risk_card_agg_mdtrt_d_mf_ytai SET emp_name = CASE WHEN LENGTH(emp_name) <= 2 THEN CONCAT(SUBSTR(emp_name, 1, 1), '*') WHEN LENGTH(emp_name) <= 4 THEN CONCAT(SUBSTR(emp_name, 1, 2), '*') ELSE CONCAT(SUBSTR(emp_name, 1, CEIL(LENGTH(emp_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(emp_name) * 1/3))) END;
-- medins_trait (org_name)
UPDATE ads_znjg_risk_card_agg_mdtrt_d_mf_ytai SET medins_trait = CASE WHEN LENGTH(medins_trait) <= 5 THEN CONCAT(SUBSTR(medins_trait, 1, 3), REPEAT('*', LENGTH(medins_trait) - 3)) ELSE CONCAT(SUBSTR(medins_trait, 1, CEIL(LENGTH(medins_trait) * 2/3)), REPEAT('*', FLOOR(LENGTH(medins_trait) * 1/3))) END;
-- medins_lv (org_name)
UPDATE ads_znjg_risk_card_agg_mdtrt_d_mf_ytai SET medins_lv = CASE WHEN LENGTH(medins_lv) <= 5 THEN CONCAT(SUBSTR(medins_lv, 1, 3), REPEAT('*', LENGTH(medins_lv) - 3)) ELSE CONCAT(SUBSTR(medins_lv, 1, CEIL(LENGTH(medins_lv) * 2/3)), REPEAT('*', FLOOR(LENGTH(medins_lv) * 1/3))) END;
-- mdtrt_cert_type (medical_record)
UPDATE ads_znjg_risk_card_agg_mdtrt_d_mf_ytai SET mdtrt_cert_type = CASE WHEN LENGTH(mdtrt_cert_type) <= 8 THEN CONCAT(SUBSTR(mdtrt_cert_type, 1, 5), REPEAT('*', LENGTH(mdtrt_cert_type) - 5)) ELSE CONCAT(SUBSTR(mdtrt_cert_type, 1, CEIL(LENGTH(mdtrt_cert_type) * 2/3)), REPEAT('*', FLOOR(LENGTH(mdtrt_cert_type) * 1/3))) END;
-- mdtrt_cert_no (medical_record)
UPDATE ads_znjg_risk_card_agg_mdtrt_d_mf_ytai SET mdtrt_cert_no = CASE WHEN LENGTH(mdtrt_cert_no) <= 8 THEN CONCAT(SUBSTR(mdtrt_cert_no, 1, 5), REPEAT('*', LENGTH(mdtrt_cert_no) - 5)) ELSE CONCAT(SUBSTR(mdtrt_cert_no, 1, CEIL(LENGTH(mdtrt_cert_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(mdtrt_cert_no) * 1/3))) END;
-- dise_name (person_name)
UPDATE ads_znjg_risk_card_agg_mdtrt_d_mf_ytai SET dise_name = CASE WHEN LENGTH(dise_name) <= 2 THEN CONCAT(SUBSTR(dise_name, 1, 1), '*') WHEN LENGTH(dise_name) <= 4 THEN CONCAT(SUBSTR(dise_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dise_name, 1, CEIL(LENGTH(dise_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dise_name) * 1/3))) END;
-- dw_tab_name (person_name)
UPDATE ads_znjg_risk_card_agg_mdtrt_d_mf_ytai SET dw_tab_name = CASE WHEN LENGTH(dw_tab_name) <= 2 THEN CONCAT(SUBSTR(dw_tab_name, 1, 1), '*') WHEN LENGTH(dw_tab_name) <= 4 THEN CONCAT(SUBSTR(dw_tab_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dw_tab_name, 1, CEIL(LENGTH(dw_tab_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dw_tab_name) * 1/3))) END;

-- 表: ads_znjg_risk_card_agg_sum_d_mf_ytai
-- grp_medins_cnt (org_name)
UPDATE ads_znjg_risk_card_agg_sum_d_mf_ytai SET grp_medins_cnt = CASE WHEN LENGTH(grp_medins_cnt) <= 5 THEN CONCAT(SUBSTR(grp_medins_cnt, 1, 3), REPEAT('*', LENGTH(grp_medins_cnt) - 3)) ELSE CONCAT(SUBSTR(grp_medins_cnt, 1, CEIL(LENGTH(grp_medins_cnt) * 2/3)), REPEAT('*', FLOOR(LENGTH(grp_medins_cnt) * 1/3))) END;
-- dw_tab_name (person_name)
UPDATE ads_znjg_risk_card_agg_sum_d_mf_ytai SET dw_tab_name = CASE WHEN LENGTH(dw_tab_name) <= 2 THEN CONCAT(SUBSTR(dw_tab_name, 1, 1), '*') WHEN LENGTH(dw_tab_name) <= 4 THEN CONCAT(SUBSTR(dw_tab_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dw_tab_name, 1, CEIL(LENGTH(dw_tab_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dw_tab_name) * 1/3))) END;

-- 表: ads_znjg_risk_sim_cas_mdtrd_d_mf_ytai
-- admdvs_name (person_name)
UPDATE ads_znjg_risk_sim_cas_mdtrd_d_mf_ytai SET admdvs_name = CASE WHEN LENGTH(admdvs_name) <= 2 THEN CONCAT(SUBSTR(admdvs_name, 1, 1), '*') WHEN LENGTH(admdvs_name) <= 4 THEN CONCAT(SUBSTR(admdvs_name, 1, 2), '*') ELSE CONCAT(SUBSTR(admdvs_name, 1, CEIL(LENGTH(admdvs_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(admdvs_name) * 1/3))) END;
-- diag_name (person_name)
UPDATE ads_znjg_risk_sim_cas_mdtrd_d_mf_ytai SET diag_name = CASE WHEN LENGTH(diag_name) <= 2 THEN CONCAT(SUBSTR(diag_name, 1, 1), '*') WHEN LENGTH(diag_name) <= 4 THEN CONCAT(SUBSTR(diag_name, 1, 2), '*') ELSE CONCAT(SUBSTR(diag_name, 1, CEIL(LENGTH(diag_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(diag_name) * 1/3))) END;
-- fixmedins_code (org_name)
UPDATE ads_znjg_risk_sim_cas_mdtrd_d_mf_ytai SET fixmedins_code = CASE WHEN LENGTH(fixmedins_code) <= 5 THEN CONCAT(SUBSTR(fixmedins_code, 1, 3), REPEAT('*', LENGTH(fixmedins_code) - 3)) ELSE CONCAT(SUBSTR(fixmedins_code, 1, CEIL(LENGTH(fixmedins_code) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_code) * 1/3))) END;
-- fixmedins_name (person_name)
UPDATE ads_znjg_risk_sim_cas_mdtrd_d_mf_ytai SET fixmedins_name = CASE WHEN LENGTH(fixmedins_name) <= 2 THEN CONCAT(SUBSTR(fixmedins_name, 1, 1), '*') WHEN LENGTH(fixmedins_name) <= 4 THEN CONCAT(SUBSTR(fixmedins_name, 1, 2), '*') ELSE CONCAT(SUBSTR(fixmedins_name, 1, CEIL(LENGTH(fixmedins_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_name) * 1/3))) END;
-- psn_no (person_id)
UPDATE ads_znjg_risk_sim_cas_mdtrd_d_mf_ytai SET psn_no = CASE WHEN LENGTH(psn_no) <= 8 THEN CONCAT(SUBSTR(psn_no, 1, 5), REPEAT('*', LENGTH(psn_no) - 5)) ELSE CONCAT(SUBSTR(psn_no, 1, CEIL(LENGTH(psn_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(psn_no) * 1/3))) END;
-- mdtrt_id (medical_record)
UPDATE ads_znjg_risk_sim_cas_mdtrd_d_mf_ytai SET mdtrt_id = CASE WHEN LENGTH(mdtrt_id) <= 8 THEN CONCAT(SUBSTR(mdtrt_id, 1, 5), REPEAT('*', LENGTH(mdtrt_id) - 5)) ELSE CONCAT(SUBSTR(mdtrt_id, 1, CEIL(LENGTH(mdtrt_id) * 2/3)), REPEAT('*', FLOOR(LENGTH(mdtrt_id) * 1/3))) END;
-- psn_name (person_name)
UPDATE ads_znjg_risk_sim_cas_mdtrd_d_mf_ytai SET psn_name = CASE WHEN LENGTH(psn_name) <= 2 THEN CONCAT(SUBSTR(psn_name, 1, 1), '*') WHEN LENGTH(psn_name) <= 4 THEN CONCAT(SUBSTR(psn_name, 1, 2), '*') ELSE CONCAT(SUBSTR(psn_name, 1, CEIL(LENGTH(psn_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(psn_name) * 1/3))) END;
-- certno (id_card)
UPDATE ads_znjg_risk_sim_cas_mdtrd_d_mf_ytai SET certno = CASE WHEN LENGTH(certno) <= 10 THEN CONCAT(SUBSTR(certno, 1, 7), REPEAT('*', LENGTH(certno) - 7)) ELSE CONCAT(SUBSTR(certno, 1, CEIL(LENGTH(certno) * 2/3)), REPEAT('*', FLOOR(LENGTH(certno) * 1/3))) END;
-- emp_no (org_name)
UPDATE ads_znjg_risk_sim_cas_mdtrd_d_mf_ytai SET emp_no = CASE WHEN LENGTH(emp_no) <= 5 THEN CONCAT(SUBSTR(emp_no, 1, 3), REPEAT('*', LENGTH(emp_no) - 3)) ELSE CONCAT(SUBSTR(emp_no, 1, CEIL(LENGTH(emp_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(emp_no) * 1/3))) END;
-- emp_name (person_name)
UPDATE ads_znjg_risk_sim_cas_mdtrd_d_mf_ytai SET emp_name = CASE WHEN LENGTH(emp_name) <= 2 THEN CONCAT(SUBSTR(emp_name, 1, 1), '*') WHEN LENGTH(emp_name) <= 4 THEN CONCAT(SUBSTR(emp_name, 1, 2), '*') ELSE CONCAT(SUBSTR(emp_name, 1, CEIL(LENGTH(emp_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(emp_name) * 1/3))) END;
-- medins_trait (org_name)
UPDATE ads_znjg_risk_sim_cas_mdtrd_d_mf_ytai SET medins_trait = CASE WHEN LENGTH(medins_trait) <= 5 THEN CONCAT(SUBSTR(medins_trait, 1, 3), REPEAT('*', LENGTH(medins_trait) - 3)) ELSE CONCAT(SUBSTR(medins_trait, 1, CEIL(LENGTH(medins_trait) * 2/3)), REPEAT('*', FLOOR(LENGTH(medins_trait) * 1/3))) END;
-- medins_lv (org_name)
UPDATE ads_znjg_risk_sim_cas_mdtrd_d_mf_ytai SET medins_lv = CASE WHEN LENGTH(medins_lv) <= 5 THEN CONCAT(SUBSTR(medins_lv, 1, 3), REPEAT('*', LENGTH(medins_lv) - 3)) ELSE CONCAT(SUBSTR(medins_lv, 1, CEIL(LENGTH(medins_lv) * 2/3)), REPEAT('*', FLOOR(LENGTH(medins_lv) * 1/3))) END;
-- mdtrt_cert_type (medical_record)
UPDATE ads_znjg_risk_sim_cas_mdtrd_d_mf_ytai SET mdtrt_cert_type = CASE WHEN LENGTH(mdtrt_cert_type) <= 8 THEN CONCAT(SUBSTR(mdtrt_cert_type, 1, 5), REPEAT('*', LENGTH(mdtrt_cert_type) - 5)) ELSE CONCAT(SUBSTR(mdtrt_cert_type, 1, CEIL(LENGTH(mdtrt_cert_type) * 2/3)), REPEAT('*', FLOOR(LENGTH(mdtrt_cert_type) * 1/3))) END;
-- mdtrt_cert_no (medical_record)
UPDATE ads_znjg_risk_sim_cas_mdtrd_d_mf_ytai SET mdtrt_cert_no = CASE WHEN LENGTH(mdtrt_cert_no) <= 8 THEN CONCAT(SUBSTR(mdtrt_cert_no, 1, 5), REPEAT('*', LENGTH(mdtrt_cert_no) - 5)) ELSE CONCAT(SUBSTR(mdtrt_cert_no, 1, CEIL(LENGTH(mdtrt_cert_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(mdtrt_cert_no) * 1/3))) END;
-- dept_name (person_name)
UPDATE ads_znjg_risk_sim_cas_mdtrd_d_mf_ytai SET dept_name = CASE WHEN LENGTH(dept_name) <= 2 THEN CONCAT(SUBSTR(dept_name, 1, 1), '*') WHEN LENGTH(dept_name) <= 4 THEN CONCAT(SUBSTR(dept_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dept_name, 1, CEIL(LENGTH(dept_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dept_name) * 1/3))) END;
-- chfpdr_code (person_name)
UPDATE ads_znjg_risk_sim_cas_mdtrd_d_mf_ytai SET chfpdr_code = CASE WHEN LENGTH(chfpdr_code) <= 2 THEN CONCAT(SUBSTR(chfpdr_code, 1, 1), '*') WHEN LENGTH(chfpdr_code) <= 4 THEN CONCAT(SUBSTR(chfpdr_code, 1, 2), '*') ELSE CONCAT(SUBSTR(chfpdr_code, 1, CEIL(LENGTH(chfpdr_code) * 2/3)), REPEAT('*', FLOOR(LENGTH(chfpdr_code) * 1/3))) END;
-- chfpdr_name (person_name)
UPDATE ads_znjg_risk_sim_cas_mdtrd_d_mf_ytai SET chfpdr_name = CASE WHEN LENGTH(chfpdr_name) <= 2 THEN CONCAT(SUBSTR(chfpdr_name, 1, 1), '*') WHEN LENGTH(chfpdr_name) <= 4 THEN CONCAT(SUBSTR(chfpdr_name, 1, 2), '*') ELSE CONCAT(SUBSTR(chfpdr_name, 1, CEIL(LENGTH(chfpdr_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(chfpdr_name) * 1/3))) END;
-- dise_name (person_name)
UPDATE ads_znjg_risk_sim_cas_mdtrd_d_mf_ytai SET dise_name = CASE WHEN LENGTH(dise_name) <= 2 THEN CONCAT(SUBSTR(dise_name, 1, 1), '*') WHEN LENGTH(dise_name) <= 4 THEN CONCAT(SUBSTR(dise_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dise_name, 1, CEIL(LENGTH(dise_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dise_name) * 1/3))) END;
-- dw_tab_name (person_name)
UPDATE ads_znjg_risk_sim_cas_mdtrd_d_mf_ytai SET dw_tab_name = CASE WHEN LENGTH(dw_tab_name) <= 2 THEN CONCAT(SUBSTR(dw_tab_name, 1, 1), '*') WHEN LENGTH(dw_tab_name) <= 4 THEN CONCAT(SUBSTR(dw_tab_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dw_tab_name, 1, CEIL(LENGTH(dw_tab_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dw_tab_name) * 1/3))) END;

-- 表: ads_znjg_risk_sim_cas_sum_d_mf_ytai
-- admdvs_name (person_name)
UPDATE ads_znjg_risk_sim_cas_sum_d_mf_ytai SET admdvs_name = CASE WHEN LENGTH(admdvs_name) <= 2 THEN CONCAT(SUBSTR(admdvs_name, 1, 1), '*') WHEN LENGTH(admdvs_name) <= 4 THEN CONCAT(SUBSTR(admdvs_name, 1, 2), '*') ELSE CONCAT(SUBSTR(admdvs_name, 1, CEIL(LENGTH(admdvs_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(admdvs_name) * 1/3))) END;
-- diag_name (person_name)
UPDATE ads_znjg_risk_sim_cas_sum_d_mf_ytai SET diag_name = CASE WHEN LENGTH(diag_name) <= 2 THEN CONCAT(SUBSTR(diag_name, 1, 1), '*') WHEN LENGTH(diag_name) <= 4 THEN CONCAT(SUBSTR(diag_name, 1, 2), '*') ELSE CONCAT(SUBSTR(diag_name, 1, CEIL(LENGTH(diag_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(diag_name) * 1/3))) END;
-- main_fixmedins_code (org_name)
UPDATE ads_znjg_risk_sim_cas_sum_d_mf_ytai SET main_fixmedins_code = CASE WHEN LENGTH(main_fixmedins_code) <= 5 THEN CONCAT(SUBSTR(main_fixmedins_code, 1, 3), REPEAT('*', LENGTH(main_fixmedins_code) - 3)) ELSE CONCAT(SUBSTR(main_fixmedins_code, 1, CEIL(LENGTH(main_fixmedins_code) * 2/3)), REPEAT('*', FLOOR(LENGTH(main_fixmedins_code) * 1/3))) END;
-- main_fixmedins_name (person_name)
UPDATE ads_znjg_risk_sim_cas_sum_d_mf_ytai SET main_fixmedins_name = CASE WHEN LENGTH(main_fixmedins_name) <= 2 THEN CONCAT(SUBSTR(main_fixmedins_name, 1, 1), '*') WHEN LENGTH(main_fixmedins_name) <= 4 THEN CONCAT(SUBSTR(main_fixmedins_name, 1, 2), '*') ELSE CONCAT(SUBSTR(main_fixmedins_name, 1, CEIL(LENGTH(main_fixmedins_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(main_fixmedins_name) * 1/3))) END;
-- mdtrt_psntime (medical_record)
UPDATE ads_znjg_risk_sim_cas_sum_d_mf_ytai SET mdtrt_psntime = CASE WHEN LENGTH(mdtrt_psntime) <= 8 THEN CONCAT(SUBSTR(mdtrt_psntime, 1, 5), REPEAT('*', LENGTH(mdtrt_psntime) - 5)) ELSE CONCAT(SUBSTR(mdtrt_psntime, 1, CEIL(LENGTH(mdtrt_psntime) * 2/3)), REPEAT('*', FLOOR(LENGTH(mdtrt_psntime) * 1/3))) END;
-- medins_conc_deg (org_name)
UPDATE ads_znjg_risk_sim_cas_sum_d_mf_ytai SET medins_conc_deg = CASE WHEN LENGTH(medins_conc_deg) <= 5 THEN CONCAT(SUBSTR(medins_conc_deg, 1, 3), REPEAT('*', LENGTH(medins_conc_deg) - 3)) ELSE CONCAT(SUBSTR(medins_conc_deg, 1, CEIL(LENGTH(medins_conc_deg) * 2/3)), REPEAT('*', FLOOR(LENGTH(medins_conc_deg) * 1/3))) END;
-- mdtrt_psntime_deg (medical_record)
UPDATE ads_znjg_risk_sim_cas_sum_d_mf_ytai SET mdtrt_psntime_deg = CASE WHEN LENGTH(mdtrt_psntime_deg) <= 8 THEN CONCAT(SUBSTR(mdtrt_psntime_deg, 1, 5), REPEAT('*', LENGTH(mdtrt_psntime_deg) - 5)) ELSE CONCAT(SUBSTR(mdtrt_psntime_deg, 1, CEIL(LENGTH(mdtrt_psntime_deg) * 2/3)), REPEAT('*', FLOOR(LENGTH(mdtrt_psntime_deg) * 1/3))) END;
-- dw_tab_name (person_name)
UPDATE ads_znjg_risk_sim_cas_sum_d_mf_ytai SET dw_tab_name = CASE WHEN LENGTH(dw_tab_name) <= 2 THEN CONCAT(SUBSTR(dw_tab_name, 1, 1), '*') WHEN LENGTH(dw_tab_name) <= 4 THEN CONCAT(SUBSTR(dw_tab_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dw_tab_name, 1, CEIL(LENGTH(dw_tab_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dw_tab_name) * 1/3))) END;

-- 表: ads_znjg_risk_test_ipt_mdtrt_d_mf_ytai
-- psn_no (person_id)
UPDATE ads_znjg_risk_test_ipt_mdtrt_d_mf_ytai SET psn_no = CASE WHEN LENGTH(psn_no) <= 8 THEN CONCAT(SUBSTR(psn_no, 1, 5), REPEAT('*', LENGTH(psn_no) - 5)) ELSE CONCAT(SUBSTR(psn_no, 1, CEIL(LENGTH(psn_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(psn_no) * 1/3))) END;
-- mdtrt_id (medical_record)
UPDATE ads_znjg_risk_test_ipt_mdtrt_d_mf_ytai SET mdtrt_id = CASE WHEN LENGTH(mdtrt_id) <= 8 THEN CONCAT(SUBSTR(mdtrt_id, 1, 5), REPEAT('*', LENGTH(mdtrt_id) - 5)) ELSE CONCAT(SUBSTR(mdtrt_id, 1, CEIL(LENGTH(mdtrt_id) * 2/3)), REPEAT('*', FLOOR(LENGTH(mdtrt_id) * 1/3))) END;
-- fixmedins_code (org_name)
UPDATE ads_znjg_risk_test_ipt_mdtrt_d_mf_ytai SET fixmedins_code = CASE WHEN LENGTH(fixmedins_code) <= 5 THEN CONCAT(SUBSTR(fixmedins_code, 1, 3), REPEAT('*', LENGTH(fixmedins_code) - 3)) ELSE CONCAT(SUBSTR(fixmedins_code, 1, CEIL(LENGTH(fixmedins_code) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_code) * 1/3))) END;
-- fixmedins_name (person_name)
UPDATE ads_znjg_risk_test_ipt_mdtrt_d_mf_ytai SET fixmedins_name = CASE WHEN LENGTH(fixmedins_name) <= 2 THEN CONCAT(SUBSTR(fixmedins_name, 1, 1), '*') WHEN LENGTH(fixmedins_name) <= 4 THEN CONCAT(SUBSTR(fixmedins_name, 1, 2), '*') ELSE CONCAT(SUBSTR(fixmedins_name, 1, CEIL(LENGTH(fixmedins_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_name) * 1/3))) END;
-- dept_name (person_name)
UPDATE ads_znjg_risk_test_ipt_mdtrt_d_mf_ytai SET dept_name = CASE WHEN LENGTH(dept_name) <= 2 THEN CONCAT(SUBSTR(dept_name, 1, 1), '*') WHEN LENGTH(dept_name) <= 4 THEN CONCAT(SUBSTR(dept_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dept_name, 1, CEIL(LENGTH(dept_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dept_name) * 1/3))) END;
-- diag_name (person_name)
UPDATE ads_znjg_risk_test_ipt_mdtrt_d_mf_ytai SET diag_name = CASE WHEN LENGTH(diag_name) <= 2 THEN CONCAT(SUBSTR(diag_name, 1, 1), '*') WHEN LENGTH(diag_name) <= 4 THEN CONCAT(SUBSTR(diag_name, 1, 2), '*') ELSE CONCAT(SUBSTR(diag_name, 1, CEIL(LENGTH(diag_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(diag_name) * 1/3))) END;
-- psn_name (person_name)
UPDATE ads_znjg_risk_test_ipt_mdtrt_d_mf_ytai SET psn_name = CASE WHEN LENGTH(psn_name) <= 2 THEN CONCAT(SUBSTR(psn_name, 1, 1), '*') WHEN LENGTH(psn_name) <= 4 THEN CONCAT(SUBSTR(psn_name, 1, 2), '*') ELSE CONCAT(SUBSTR(psn_name, 1, CEIL(LENGTH(psn_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(psn_name) * 1/3))) END;
-- live_addr (address)
UPDATE ads_znjg_risk_test_ipt_mdtrt_d_mf_ytai SET live_addr = CASE WHEN LENGTH(live_addr) <= 10 THEN CONCAT(SUBSTR(live_addr, 1, 7), REPEAT('*', LENGTH(live_addr) - 7)) ELSE CONCAT(SUBSTR(live_addr, 1, CEIL(LENGTH(live_addr) * 2/3)), REPEAT('*', FLOOR(LENGTH(live_addr) * 1/3))) END;
-- certno (id_card)
UPDATE ads_znjg_risk_test_ipt_mdtrt_d_mf_ytai SET certno = CASE WHEN LENGTH(certno) <= 10 THEN CONCAT(SUBSTR(certno, 1, 7), REPEAT('*', LENGTH(certno) - 7)) ELSE CONCAT(SUBSTR(certno, 1, CEIL(LENGTH(certno) * 2/3)), REPEAT('*', FLOOR(LENGTH(certno) * 1/3))) END;
-- emp_no (org_name)
UPDATE ads_znjg_risk_test_ipt_mdtrt_d_mf_ytai SET emp_no = CASE WHEN LENGTH(emp_no) <= 5 THEN CONCAT(SUBSTR(emp_no, 1, 3), REPEAT('*', LENGTH(emp_no) - 3)) ELSE CONCAT(SUBSTR(emp_no, 1, CEIL(LENGTH(emp_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(emp_no) * 1/3))) END;
-- emp_name (person_name)
UPDATE ads_znjg_risk_test_ipt_mdtrt_d_mf_ytai SET emp_name = CASE WHEN LENGTH(emp_name) <= 2 THEN CONCAT(SUBSTR(emp_name, 1, 1), '*') WHEN LENGTH(emp_name) <= 4 THEN CONCAT(SUBSTR(emp_name, 1, 2), '*') ELSE CONCAT(SUBSTR(emp_name, 1, CEIL(LENGTH(emp_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(emp_name) * 1/3))) END;
-- medins_trait (org_name)
UPDATE ads_znjg_risk_test_ipt_mdtrt_d_mf_ytai SET medins_trait = CASE WHEN LENGTH(medins_trait) <= 5 THEN CONCAT(SUBSTR(medins_trait, 1, 3), REPEAT('*', LENGTH(medins_trait) - 3)) ELSE CONCAT(SUBSTR(medins_trait, 1, CEIL(LENGTH(medins_trait) * 2/3)), REPEAT('*', FLOOR(LENGTH(medins_trait) * 1/3))) END;
-- medins_lv (org_name)
UPDATE ads_znjg_risk_test_ipt_mdtrt_d_mf_ytai SET medins_lv = CASE WHEN LENGTH(medins_lv) <= 5 THEN CONCAT(SUBSTR(medins_lv, 1, 3), REPEAT('*', LENGTH(medins_lv) - 3)) ELSE CONCAT(SUBSTR(medins_lv, 1, CEIL(LENGTH(medins_lv) * 2/3)), REPEAT('*', FLOOR(LENGTH(medins_lv) * 1/3))) END;
-- mdtrt_cert_type (medical_record)
UPDATE ads_znjg_risk_test_ipt_mdtrt_d_mf_ytai SET mdtrt_cert_type = CASE WHEN LENGTH(mdtrt_cert_type) <= 8 THEN CONCAT(SUBSTR(mdtrt_cert_type, 1, 5), REPEAT('*', LENGTH(mdtrt_cert_type) - 5)) ELSE CONCAT(SUBSTR(mdtrt_cert_type, 1, CEIL(LENGTH(mdtrt_cert_type) * 2/3)), REPEAT('*', FLOOR(LENGTH(mdtrt_cert_type) * 1/3))) END;
-- mdtrt_cert_no (medical_record)
UPDATE ads_znjg_risk_test_ipt_mdtrt_d_mf_ytai SET mdtrt_cert_no = CASE WHEN LENGTH(mdtrt_cert_no) <= 8 THEN CONCAT(SUBSTR(mdtrt_cert_no, 1, 5), REPEAT('*', LENGTH(mdtrt_cert_no) - 5)) ELSE CONCAT(SUBSTR(mdtrt_cert_no, 1, CEIL(LENGTH(mdtrt_cert_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(mdtrt_cert_no) * 1/3))) END;
-- chfpdr_code (person_name)
UPDATE ads_znjg_risk_test_ipt_mdtrt_d_mf_ytai SET chfpdr_code = CASE WHEN LENGTH(chfpdr_code) <= 2 THEN CONCAT(SUBSTR(chfpdr_code, 1, 1), '*') WHEN LENGTH(chfpdr_code) <= 4 THEN CONCAT(SUBSTR(chfpdr_code, 1, 2), '*') ELSE CONCAT(SUBSTR(chfpdr_code, 1, CEIL(LENGTH(chfpdr_code) * 2/3)), REPEAT('*', FLOOR(LENGTH(chfpdr_code) * 1/3))) END;
-- chfpdr_name (person_name)
UPDATE ads_znjg_risk_test_ipt_mdtrt_d_mf_ytai SET chfpdr_name = CASE WHEN LENGTH(chfpdr_name) <= 2 THEN CONCAT(SUBSTR(chfpdr_name, 1, 1), '*') WHEN LENGTH(chfpdr_name) <= 4 THEN CONCAT(SUBSTR(chfpdr_name, 1, 2), '*') ELSE CONCAT(SUBSTR(chfpdr_name, 1, CEIL(LENGTH(chfpdr_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(chfpdr_name) * 1/3))) END;
-- dise_name (person_name)
UPDATE ads_znjg_risk_test_ipt_mdtrt_d_mf_ytai SET dise_name = CASE WHEN LENGTH(dise_name) <= 2 THEN CONCAT(SUBSTR(dise_name, 1, 1), '*') WHEN LENGTH(dise_name) <= 4 THEN CONCAT(SUBSTR(dise_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dise_name, 1, CEIL(LENGTH(dise_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dise_name) * 1/3))) END;
-- dw_tab_name (person_name)
UPDATE ads_znjg_risk_test_ipt_mdtrt_d_mf_ytai SET dw_tab_name = CASE WHEN LENGTH(dw_tab_name) <= 2 THEN CONCAT(SUBSTR(dw_tab_name, 1, 1), '*') WHEN LENGTH(dw_tab_name) <= 4 THEN CONCAT(SUBSTR(dw_tab_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dw_tab_name, 1, CEIL(LENGTH(dw_tab_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dw_tab_name) * 1/3))) END;

-- 表: ads_znjg_risk_test_ipt_sum_d_mf_ytai
-- fixmedins_code (org_name)
UPDATE ads_znjg_risk_test_ipt_sum_d_mf_ytai SET fixmedins_code = CASE WHEN LENGTH(fixmedins_code) <= 5 THEN CONCAT(SUBSTR(fixmedins_code, 1, 3), REPEAT('*', LENGTH(fixmedins_code) - 3)) ELSE CONCAT(SUBSTR(fixmedins_code, 1, CEIL(LENGTH(fixmedins_code) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_code) * 1/3))) END;
-- fixmedins_name (person_name)
UPDATE ads_znjg_risk_test_ipt_sum_d_mf_ytai SET fixmedins_name = CASE WHEN LENGTH(fixmedins_name) <= 2 THEN CONCAT(SUBSTR(fixmedins_name, 1, 1), '*') WHEN LENGTH(fixmedins_name) <= 4 THEN CONCAT(SUBSTR(fixmedins_name, 1, 2), '*') ELSE CONCAT(SUBSTR(fixmedins_name, 1, CEIL(LENGTH(fixmedins_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_name) * 1/3))) END;
-- dept_name (person_name)
UPDATE ads_znjg_risk_test_ipt_sum_d_mf_ytai SET dept_name = CASE WHEN LENGTH(dept_name) <= 2 THEN CONCAT(SUBSTR(dept_name, 1, 1), '*') WHEN LENGTH(dept_name) <= 4 THEN CONCAT(SUBSTR(dept_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dept_name, 1, CEIL(LENGTH(dept_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dept_name) * 1/3))) END;
-- dw_tab_name (person_name)
UPDATE ads_znjg_risk_test_ipt_sum_d_mf_ytai SET dw_tab_name = CASE WHEN LENGTH(dw_tab_name) <= 2 THEN CONCAT(SUBSTR(dw_tab_name, 1, 1), '*') WHEN LENGTH(dw_tab_name) <= 4 THEN CONCAT(SUBSTR(dw_tab_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dw_tab_name, 1, CEIL(LENGTH(dw_tab_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dw_tab_name) * 1/3))) END;

-- 表: ads_znjg_rsk_hgh_frq_med_detail_etl_mf_ytai
-- psn_no (person_id)
UPDATE ads_znjg_rsk_hgh_frq_med_detail_etl_mf_ytai SET psn_no = CASE WHEN LENGTH(psn_no) <= 8 THEN CONCAT(SUBSTR(psn_no, 1, 5), REPEAT('*', LENGTH(psn_no) - 5)) ELSE CONCAT(SUBSTR(psn_no, 1, CEIL(LENGTH(psn_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(psn_no) * 1/3))) END;
-- psn_name (person_name)
UPDATE ads_znjg_rsk_hgh_frq_med_detail_etl_mf_ytai SET psn_name = CASE WHEN LENGTH(psn_name) <= 2 THEN CONCAT(SUBSTR(psn_name, 1, 1), '*') WHEN LENGTH(psn_name) <= 4 THEN CONCAT(SUBSTR(psn_name, 1, 2), '*') ELSE CONCAT(SUBSTR(psn_name, 1, CEIL(LENGTH(psn_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(psn_name) * 1/3))) END;
-- hig_med_type (medical_record)
UPDATE ads_znjg_rsk_hgh_frq_med_detail_etl_mf_ytai SET hig_med_type = CASE WHEN LENGTH(hig_med_type) <= 8 THEN CONCAT(SUBSTR(hig_med_type, 1, 5), REPEAT('*', LENGTH(hig_med_type) - 5)) ELSE CONCAT(SUBSTR(hig_med_type, 1, CEIL(LENGTH(hig_med_type) * 2/3)), REPEAT('*', FLOOR(LENGTH(hig_med_type) * 1/3))) END;
-- mdtrt_id (medical_record)
UPDATE ads_znjg_rsk_hgh_frq_med_detail_etl_mf_ytai SET mdtrt_id = CASE WHEN LENGTH(mdtrt_id) <= 8 THEN CONCAT(SUBSTR(mdtrt_id, 1, 5), REPEAT('*', LENGTH(mdtrt_id) - 5)) ELSE CONCAT(SUBSTR(mdtrt_id, 1, CEIL(LENGTH(mdtrt_id) * 2/3)), REPEAT('*', FLOOR(LENGTH(mdtrt_id) * 1/3))) END;
-- med_mdtrt_type (medical_record)
UPDATE ads_znjg_rsk_hgh_frq_med_detail_etl_mf_ytai SET med_mdtrt_type = CASE WHEN LENGTH(med_mdtrt_type) <= 8 THEN CONCAT(SUBSTR(med_mdtrt_type, 1, 5), REPEAT('*', LENGTH(med_mdtrt_type) - 5)) ELSE CONCAT(SUBSTR(med_mdtrt_type, 1, CEIL(LENGTH(med_mdtrt_type) * 2/3)), REPEAT('*', FLOOR(LENGTH(med_mdtrt_type) * 1/3))) END;
-- fixmedins_code (org_name)
UPDATE ads_znjg_rsk_hgh_frq_med_detail_etl_mf_ytai SET fixmedins_code = CASE WHEN LENGTH(fixmedins_code) <= 5 THEN CONCAT(SUBSTR(fixmedins_code, 1, 3), REPEAT('*', LENGTH(fixmedins_code) - 3)) ELSE CONCAT(SUBSTR(fixmedins_code, 1, CEIL(LENGTH(fixmedins_code) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_code) * 1/3))) END;
-- fixmedins_name (person_name)
UPDATE ads_znjg_rsk_hgh_frq_med_detail_etl_mf_ytai SET fixmedins_name = CASE WHEN LENGTH(fixmedins_name) <= 2 THEN CONCAT(SUBSTR(fixmedins_name, 1, 1), '*') WHEN LENGTH(fixmedins_name) <= 4 THEN CONCAT(SUBSTR(fixmedins_name, 1, 2), '*') ELSE CONCAT(SUBSTR(fixmedins_name, 1, CEIL(LENGTH(fixmedins_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_name) * 1/3))) END;
-- medinslv (org_name)
UPDATE ads_znjg_rsk_hgh_frq_med_detail_etl_mf_ytai SET medinslv = CASE WHEN LENGTH(medinslv) <= 5 THEN CONCAT(SUBSTR(medinslv, 1, 3), REPEAT('*', LENGTH(medinslv) - 3)) ELSE CONCAT(SUBSTR(medinslv, 1, CEIL(LENGTH(medinslv) * 2/3)), REPEAT('*', FLOOR(LENGTH(medinslv) * 1/3))) END;
-- dept_name (person_name)
UPDATE ads_znjg_rsk_hgh_frq_med_detail_etl_mf_ytai SET dept_name = CASE WHEN LENGTH(dept_name) <= 2 THEN CONCAT(SUBSTR(dept_name, 1, 1), '*') WHEN LENGTH(dept_name) <= 4 THEN CONCAT(SUBSTR(dept_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dept_name, 1, CEIL(LENGTH(dept_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dept_name) * 1/3))) END;
-- mdtrt_time (medical_record)
UPDATE ads_znjg_rsk_hgh_frq_med_detail_etl_mf_ytai SET mdtrt_time = CASE WHEN LENGTH(mdtrt_time) <= 8 THEN CONCAT(SUBSTR(mdtrt_time, 1, 5), REPEAT('*', LENGTH(mdtrt_time) - 5)) ELSE CONCAT(SUBSTR(mdtrt_time, 1, CEIL(LENGTH(mdtrt_time) * 2/3)), REPEAT('*', FLOOR(LENGTH(mdtrt_time) * 1/3))) END;
-- diag_name (person_name)
UPDATE ads_znjg_rsk_hgh_frq_med_detail_etl_mf_ytai SET diag_name = CASE WHEN LENGTH(diag_name) <= 2 THEN CONCAT(SUBSTR(diag_name, 1, 1), '*') WHEN LENGTH(diag_name) <= 4 THEN CONCAT(SUBSTR(diag_name, 1, 2), '*') ELSE CONCAT(SUBSTR(diag_name, 1, CEIL(LENGTH(diag_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(diag_name) * 1/3))) END;
-- icd3_name (person_name)
UPDATE ads_znjg_rsk_hgh_frq_med_detail_etl_mf_ytai SET icd3_name = CASE WHEN LENGTH(icd3_name) <= 2 THEN CONCAT(SUBSTR(icd3_name, 1, 1), '*') WHEN LENGTH(icd3_name) <= 4 THEN CONCAT(SUBSTR(icd3_name, 1, 2), '*') ELSE CONCAT(SUBSTR(icd3_name, 1, CEIL(LENGTH(icd3_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(icd3_name) * 1/3))) END;
-- certno (id_card)
UPDATE ads_znjg_rsk_hgh_frq_med_detail_etl_mf_ytai SET certno = CASE WHEN LENGTH(certno) <= 10 THEN CONCAT(SUBSTR(certno, 1, 7), REPEAT('*', LENGTH(certno) - 7)) ELSE CONCAT(SUBSTR(certno, 1, CEIL(LENGTH(certno) * 2/3)), REPEAT('*', FLOOR(LENGTH(certno) * 1/3))) END;
-- emp_no (org_name)
UPDATE ads_znjg_rsk_hgh_frq_med_detail_etl_mf_ytai SET emp_no = CASE WHEN LENGTH(emp_no) <= 5 THEN CONCAT(SUBSTR(emp_no, 1, 3), REPEAT('*', LENGTH(emp_no) - 3)) ELSE CONCAT(SUBSTR(emp_no, 1, CEIL(LENGTH(emp_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(emp_no) * 1/3))) END;
-- emp_name (person_name)
UPDATE ads_znjg_rsk_hgh_frq_med_detail_etl_mf_ytai SET emp_name = CASE WHEN LENGTH(emp_name) <= 2 THEN CONCAT(SUBSTR(emp_name, 1, 1), '*') WHEN LENGTH(emp_name) <= 4 THEN CONCAT(SUBSTR(emp_name, 1, 2), '*') ELSE CONCAT(SUBSTR(emp_name, 1, CEIL(LENGTH(emp_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(emp_name) * 1/3))) END;
-- medins_trait (org_name)
UPDATE ads_znjg_rsk_hgh_frq_med_detail_etl_mf_ytai SET medins_trait = CASE WHEN LENGTH(medins_trait) <= 5 THEN CONCAT(SUBSTR(medins_trait, 1, 3), REPEAT('*', LENGTH(medins_trait) - 3)) ELSE CONCAT(SUBSTR(medins_trait, 1, CEIL(LENGTH(medins_trait) * 2/3)), REPEAT('*', FLOOR(LENGTH(medins_trait) * 1/3))) END;
-- medins_lv (org_name)
UPDATE ads_znjg_rsk_hgh_frq_med_detail_etl_mf_ytai SET medins_lv = CASE WHEN LENGTH(medins_lv) <= 5 THEN CONCAT(SUBSTR(medins_lv, 1, 3), REPEAT('*', LENGTH(medins_lv) - 3)) ELSE CONCAT(SUBSTR(medins_lv, 1, CEIL(LENGTH(medins_lv) * 2/3)), REPEAT('*', FLOOR(LENGTH(medins_lv) * 1/3))) END;
-- mdtrt_cert_type (medical_record)
UPDATE ads_znjg_rsk_hgh_frq_med_detail_etl_mf_ytai SET mdtrt_cert_type = CASE WHEN LENGTH(mdtrt_cert_type) <= 8 THEN CONCAT(SUBSTR(mdtrt_cert_type, 1, 5), REPEAT('*', LENGTH(mdtrt_cert_type) - 5)) ELSE CONCAT(SUBSTR(mdtrt_cert_type, 1, CEIL(LENGTH(mdtrt_cert_type) * 2/3)), REPEAT('*', FLOOR(LENGTH(mdtrt_cert_type) * 1/3))) END;
-- mdtrt_cert_no (medical_record)
UPDATE ads_znjg_rsk_hgh_frq_med_detail_etl_mf_ytai SET mdtrt_cert_no = CASE WHEN LENGTH(mdtrt_cert_no) <= 8 THEN CONCAT(SUBSTR(mdtrt_cert_no, 1, 5), REPEAT('*', LENGTH(mdtrt_cert_no) - 5)) ELSE CONCAT(SUBSTR(mdtrt_cert_no, 1, CEIL(LENGTH(mdtrt_cert_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(mdtrt_cert_no) * 1/3))) END;
-- dise_name (person_name)
UPDATE ads_znjg_rsk_hgh_frq_med_detail_etl_mf_ytai SET dise_name = CASE WHEN LENGTH(dise_name) <= 2 THEN CONCAT(SUBSTR(dise_name, 1, 1), '*') WHEN LENGTH(dise_name) <= 4 THEN CONCAT(SUBSTR(dise_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dise_name, 1, CEIL(LENGTH(dise_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dise_name) * 1/3))) END;
-- chfpdr_code (person_name)
UPDATE ads_znjg_rsk_hgh_frq_med_detail_etl_mf_ytai SET chfpdr_code = CASE WHEN LENGTH(chfpdr_code) <= 2 THEN CONCAT(SUBSTR(chfpdr_code, 1, 1), '*') WHEN LENGTH(chfpdr_code) <= 4 THEN CONCAT(SUBSTR(chfpdr_code, 1, 2), '*') ELSE CONCAT(SUBSTR(chfpdr_code, 1, CEIL(LENGTH(chfpdr_code) * 2/3)), REPEAT('*', FLOOR(LENGTH(chfpdr_code) * 1/3))) END;
-- chfpdr_name (person_name)
UPDATE ads_znjg_rsk_hgh_frq_med_detail_etl_mf_ytai SET chfpdr_name = CASE WHEN LENGTH(chfpdr_name) <= 2 THEN CONCAT(SUBSTR(chfpdr_name, 1, 1), '*') WHEN LENGTH(chfpdr_name) <= 4 THEN CONCAT(SUBSTR(chfpdr_name, 1, 2), '*') ELSE CONCAT(SUBSTR(chfpdr_name, 1, CEIL(LENGTH(chfpdr_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(chfpdr_name) * 1/3))) END;
-- dw_tab_name (person_name)
UPDATE ads_znjg_rsk_hgh_frq_med_detail_etl_mf_ytai SET dw_tab_name = CASE WHEN LENGTH(dw_tab_name) <= 2 THEN CONCAT(SUBSTR(dw_tab_name, 1, 1), '*') WHEN LENGTH(dw_tab_name) <= 4 THEN CONCAT(SUBSTR(dw_tab_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dw_tab_name, 1, CEIL(LENGTH(dw_tab_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dw_tab_name) * 1/3))) END;

-- 表: ads_znjg_rsk_hgh_frq_otp_risk_sum_etl_mf_ytai
-- psn_no (person_id)
UPDATE ads_znjg_rsk_hgh_frq_otp_risk_sum_etl_mf_ytai SET psn_no = CASE WHEN LENGTH(psn_no) <= 8 THEN CONCAT(SUBSTR(psn_no, 1, 5), REPEAT('*', LENGTH(psn_no) - 5)) ELSE CONCAT(SUBSTR(psn_no, 1, CEIL(LENGTH(psn_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(psn_no) * 1/3))) END;
-- psn_name (person_name)
UPDATE ads_znjg_rsk_hgh_frq_otp_risk_sum_etl_mf_ytai SET psn_name = CASE WHEN LENGTH(psn_name) <= 2 THEN CONCAT(SUBSTR(psn_name, 1, 1), '*') WHEN LENGTH(psn_name) <= 4 THEN CONCAT(SUBSTR(psn_name, 1, 2), '*') ELSE CONCAT(SUBSTR(psn_name, 1, CEIL(LENGTH(psn_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(psn_name) * 1/3))) END;
-- otp_cnt (medical_record)
UPDATE ads_znjg_rsk_hgh_frq_otp_risk_sum_etl_mf_ytai SET otp_cnt = CASE WHEN LENGTH(otp_cnt) <= 8 THEN CONCAT(SUBSTR(otp_cnt, 1, 5), REPEAT('*', LENGTH(otp_cnt) - 5)) ELSE CONCAT(SUBSTR(otp_cnt, 1, CEIL(LENGTH(otp_cnt) * 2/3)), REPEAT('*', FLOOR(LENGTH(otp_cnt) * 1/3))) END;
-- fixmedins_cnt (org_name)
UPDATE ads_znjg_rsk_hgh_frq_otp_risk_sum_etl_mf_ytai SET fixmedins_cnt = CASE WHEN LENGTH(fixmedins_cnt) <= 5 THEN CONCAT(SUBSTR(fixmedins_cnt, 1, 3), REPEAT('*', LENGTH(fixmedins_cnt) - 3)) ELSE CONCAT(SUBSTR(fixmedins_cnt, 1, CEIL(LENGTH(fixmedins_cnt) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_cnt) * 1/3))) END;
-- avg_medfee (medical_record)
UPDATE ads_znjg_rsk_hgh_frq_otp_risk_sum_etl_mf_ytai SET avg_medfee = CASE WHEN LENGTH(avg_medfee) <= 8 THEN CONCAT(SUBSTR(avg_medfee, 1, 5), REPEAT('*', LENGTH(avg_medfee) - 5)) ELSE CONCAT(SUBSTR(avg_medfee, 1, CEIL(LENGTH(avg_medfee) * 2/3)), REPEAT('*', FLOOR(LENGTH(avg_medfee) * 1/3))) END;
-- day_mdtrt_amt_risk_sco (medical_record)
UPDATE ads_znjg_rsk_hgh_frq_otp_risk_sum_etl_mf_ytai SET day_mdtrt_amt_risk_sco = CASE WHEN LENGTH(day_mdtrt_amt_risk_sco) <= 8 THEN CONCAT(SUBSTR(day_mdtrt_amt_risk_sco, 1, 5), REPEAT('*', LENGTH(day_mdtrt_amt_risk_sco) - 5)) ELSE CONCAT(SUBSTR(day_mdtrt_amt_risk_sco, 1, CEIL(LENGTH(day_mdtrt_amt_risk_sco) * 2/3)), REPEAT('*', FLOOR(LENGTH(day_mdtrt_amt_risk_sco) * 1/3))) END;
-- mdtrt_inrv_risk_sco (medical_record)
UPDATE ads_znjg_rsk_hgh_frq_otp_risk_sum_etl_mf_ytai SET mdtrt_inrv_risk_sco = CASE WHEN LENGTH(mdtrt_inrv_risk_sco) <= 8 THEN CONCAT(SUBSTR(mdtrt_inrv_risk_sco, 1, 5), REPEAT('*', LENGTH(mdtrt_inrv_risk_sco) - 5)) ELSE CONCAT(SUBSTR(mdtrt_inrv_risk_sco, 1, CEIL(LENGTH(mdtrt_inrv_risk_sco) * 2/3)), REPEAT('*', FLOOR(LENGTH(mdtrt_inrv_risk_sco) * 1/3))) END;
-- dw_tab_name (person_name)
UPDATE ads_znjg_rsk_hgh_frq_otp_risk_sum_etl_mf_ytai SET dw_tab_name = CASE WHEN LENGTH(dw_tab_name) <= 2 THEN CONCAT(SUBSTR(dw_tab_name, 1, 1), '*') WHEN LENGTH(dw_tab_name) <= 4 THEN CONCAT(SUBSTR(dw_tab_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dw_tab_name, 1, CEIL(LENGTH(dw_tab_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dw_tab_name) * 1/3))) END;

-- 表: ads_znjg_rsk_pmc_swp_clinic_etl_mf_ytai
-- psn_no (person_id)
UPDATE ads_znjg_rsk_pmc_swp_clinic_etl_mf_ytai SET psn_no = CASE WHEN LENGTH(psn_no) <= 8 THEN CONCAT(SUBSTR(psn_no, 1, 5), REPEAT('*', LENGTH(psn_no) - 5)) ELSE CONCAT(SUBSTR(psn_no, 1, CEIL(LENGTH(psn_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(psn_no) * 1/3))) END;
-- fixmedins_code (org_name)
UPDATE ads_znjg_rsk_pmc_swp_clinic_etl_mf_ytai SET fixmedins_code = CASE WHEN LENGTH(fixmedins_code) <= 5 THEN CONCAT(SUBSTR(fixmedins_code, 1, 3), REPEAT('*', LENGTH(fixmedins_code) - 3)) ELSE CONCAT(SUBSTR(fixmedins_code, 1, CEIL(LENGTH(fixmedins_code) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_code) * 1/3))) END;
-- fixmedins_name (person_name)
UPDATE ads_znjg_rsk_pmc_swp_clinic_etl_mf_ytai SET fixmedins_name = CASE WHEN LENGTH(fixmedins_name) <= 2 THEN CONCAT(SUBSTR(fixmedins_name, 1, 1), '*') WHEN LENGTH(fixmedins_name) <= 4 THEN CONCAT(SUBSTR(fixmedins_name, 1, 2), '*') ELSE CONCAT(SUBSTR(fixmedins_name, 1, CEIL(LENGTH(fixmedins_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_name) * 1/3))) END;
-- mdtrt_id (medical_record)
UPDATE ads_znjg_rsk_pmc_swp_clinic_etl_mf_ytai SET mdtrt_id = CASE WHEN LENGTH(mdtrt_id) <= 8 THEN CONCAT(SUBSTR(mdtrt_id, 1, 5), REPEAT('*', LENGTH(mdtrt_id) - 5)) ELSE CONCAT(SUBSTR(mdtrt_id, 1, CEIL(LENGTH(mdtrt_id) * 2/3)), REPEAT('*', FLOOR(LENGTH(mdtrt_id) * 1/3))) END;
-- psn_name (person_name)
UPDATE ads_znjg_rsk_pmc_swp_clinic_etl_mf_ytai SET psn_name = CASE WHEN LENGTH(psn_name) <= 2 THEN CONCAT(SUBSTR(psn_name, 1, 1), '*') WHEN LENGTH(psn_name) <= 4 THEN CONCAT(SUBSTR(psn_name, 1, 2), '*') ELSE CONCAT(SUBSTR(psn_name, 1, CEIL(LENGTH(psn_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(psn_name) * 1/3))) END;
-- certno (id_card)
UPDATE ads_znjg_rsk_pmc_swp_clinic_etl_mf_ytai SET certno = CASE WHEN LENGTH(certno) <= 10 THEN CONCAT(SUBSTR(certno, 1, 7), REPEAT('*', LENGTH(certno) - 7)) ELSE CONCAT(SUBSTR(certno, 1, CEIL(LENGTH(certno) * 2/3)), REPEAT('*', FLOOR(LENGTH(certno) * 1/3))) END;
-- emp_no (org_name)
UPDATE ads_znjg_rsk_pmc_swp_clinic_etl_mf_ytai SET emp_no = CASE WHEN LENGTH(emp_no) <= 5 THEN CONCAT(SUBSTR(emp_no, 1, 3), REPEAT('*', LENGTH(emp_no) - 3)) ELSE CONCAT(SUBSTR(emp_no, 1, CEIL(LENGTH(emp_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(emp_no) * 1/3))) END;
-- emp_name (person_name)
UPDATE ads_znjg_rsk_pmc_swp_clinic_etl_mf_ytai SET emp_name = CASE WHEN LENGTH(emp_name) <= 2 THEN CONCAT(SUBSTR(emp_name, 1, 1), '*') WHEN LENGTH(emp_name) <= 4 THEN CONCAT(SUBSTR(emp_name, 1, 2), '*') ELSE CONCAT(SUBSTR(emp_name, 1, CEIL(LENGTH(emp_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(emp_name) * 1/3))) END;
-- mdtrt_cert_type (medical_record)
UPDATE ads_znjg_rsk_pmc_swp_clinic_etl_mf_ytai SET mdtrt_cert_type = CASE WHEN LENGTH(mdtrt_cert_type) <= 8 THEN CONCAT(SUBSTR(mdtrt_cert_type, 1, 5), REPEAT('*', LENGTH(mdtrt_cert_type) - 5)) ELSE CONCAT(SUBSTR(mdtrt_cert_type, 1, CEIL(LENGTH(mdtrt_cert_type) * 2/3)), REPEAT('*', FLOOR(LENGTH(mdtrt_cert_type) * 1/3))) END;
-- mdtrt_cert_no (medical_record)
UPDATE ads_znjg_rsk_pmc_swp_clinic_etl_mf_ytai SET mdtrt_cert_no = CASE WHEN LENGTH(mdtrt_cert_no) <= 8 THEN CONCAT(SUBSTR(mdtrt_cert_no, 1, 5), REPEAT('*', LENGTH(mdtrt_cert_no) - 5)) ELSE CONCAT(SUBSTR(mdtrt_cert_no, 1, CEIL(LENGTH(mdtrt_cert_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(mdtrt_cert_no) * 1/3))) END;
-- chfpdr_code (person_name)
UPDATE ads_znjg_rsk_pmc_swp_clinic_etl_mf_ytai SET chfpdr_code = CASE WHEN LENGTH(chfpdr_code) <= 2 THEN CONCAT(SUBSTR(chfpdr_code, 1, 1), '*') WHEN LENGTH(chfpdr_code) <= 4 THEN CONCAT(SUBSTR(chfpdr_code, 1, 2), '*') ELSE CONCAT(SUBSTR(chfpdr_code, 1, CEIL(LENGTH(chfpdr_code) * 2/3)), REPEAT('*', FLOOR(LENGTH(chfpdr_code) * 1/3))) END;
-- chfpdr_name (person_name)
UPDATE ads_znjg_rsk_pmc_swp_clinic_etl_mf_ytai SET chfpdr_name = CASE WHEN LENGTH(chfpdr_name) <= 2 THEN CONCAT(SUBSTR(chfpdr_name, 1, 1), '*') WHEN LENGTH(chfpdr_name) <= 4 THEN CONCAT(SUBSTR(chfpdr_name, 1, 2), '*') ELSE CONCAT(SUBSTR(chfpdr_name, 1, CEIL(LENGTH(chfpdr_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(chfpdr_name) * 1/3))) END;
-- diag_name (person_name)
UPDATE ads_znjg_rsk_pmc_swp_clinic_etl_mf_ytai SET diag_name = CASE WHEN LENGTH(diag_name) <= 2 THEN CONCAT(SUBSTR(diag_name, 1, 1), '*') WHEN LENGTH(diag_name) <= 4 THEN CONCAT(SUBSTR(diag_name, 1, 2), '*') ELSE CONCAT(SUBSTR(diag_name, 1, CEIL(LENGTH(diag_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(diag_name) * 1/3))) END;
-- dise_name (person_name)
UPDATE ads_znjg_rsk_pmc_swp_clinic_etl_mf_ytai SET dise_name = CASE WHEN LENGTH(dise_name) <= 2 THEN CONCAT(SUBSTR(dise_name, 1, 1), '*') WHEN LENGTH(dise_name) <= 4 THEN CONCAT(SUBSTR(dise_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dise_name, 1, CEIL(LENGTH(dise_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dise_name) * 1/3))) END;
-- dw_tab_name (person_name)
UPDATE ads_znjg_rsk_pmc_swp_clinic_etl_mf_ytai SET dw_tab_name = CASE WHEN LENGTH(dw_tab_name) <= 2 THEN CONCAT(SUBSTR(dw_tab_name, 1, 1), '*') WHEN LENGTH(dw_tab_name) <= 4 THEN CONCAT(SUBSTR(dw_tab_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dw_tab_name, 1, CEIL(LENGTH(dw_tab_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dw_tab_name) * 1/3))) END;

-- 表: ads_znjg_rsk_pmc_swp_summary_etl_mf_ytai
-- fixmedins_code (org_name)
UPDATE ads_znjg_rsk_pmc_swp_summary_etl_mf_ytai SET fixmedins_code = CASE WHEN LENGTH(fixmedins_code) <= 5 THEN CONCAT(SUBSTR(fixmedins_code, 1, 3), REPEAT('*', LENGTH(fixmedins_code) - 3)) ELSE CONCAT(SUBSTR(fixmedins_code, 1, CEIL(LENGTH(fixmedins_code) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_code) * 1/3))) END;
-- fixmedins_name (person_name)
UPDATE ads_znjg_rsk_pmc_swp_summary_etl_mf_ytai SET fixmedins_name = CASE WHEN LENGTH(fixmedins_name) <= 2 THEN CONCAT(SUBSTR(fixmedins_name, 1, 1), '*') WHEN LENGTH(fixmedins_name) <= 4 THEN CONCAT(SUBSTR(fixmedins_name, 1, 2), '*') ELSE CONCAT(SUBSTR(fixmedins_name, 1, CEIL(LENGTH(fixmedins_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_name) * 1/3))) END;
-- set_mdtrt_psncnt (medical_record)
UPDATE ads_znjg_rsk_pmc_swp_summary_etl_mf_ytai SET set_mdtrt_psncnt = CASE WHEN LENGTH(set_mdtrt_psncnt) <= 8 THEN CONCAT(SUBSTR(set_mdtrt_psncnt, 1, 5), REPEAT('*', LENGTH(set_mdtrt_psncnt) - 5)) ELSE CONCAT(SUBSTR(set_mdtrt_psncnt, 1, CEIL(LENGTH(set_mdtrt_psncnt) * 2/3)), REPEAT('*', FLOOR(LENGTH(set_mdtrt_psncnt) * 1/3))) END;
-- ttl_mdtrt_psncnt (medical_record)
UPDATE ads_znjg_rsk_pmc_swp_summary_etl_mf_ytai SET ttl_mdtrt_psncnt = CASE WHEN LENGTH(ttl_mdtrt_psncnt) <= 8 THEN CONCAT(SUBSTR(ttl_mdtrt_psncnt, 1, 5), REPEAT('*', LENGTH(ttl_mdtrt_psncnt) - 5)) ELSE CONCAT(SUBSTR(ttl_mdtrt_psncnt, 1, CEIL(LENGTH(ttl_mdtrt_psncnt) * 2/3)), REPEAT('*', FLOOR(LENGTH(ttl_mdtrt_psncnt) * 1/3))) END;
-- org_scale_coeff (org_name)
UPDATE ads_znjg_rsk_pmc_swp_summary_etl_mf_ytai SET org_scale_coeff = CASE WHEN LENGTH(org_scale_coeff) <= 5 THEN CONCAT(SUBSTR(org_scale_coeff, 1, 3), REPEAT('*', LENGTH(org_scale_coeff) - 3)) ELSE CONCAT(SUBSTR(org_scale_coeff, 1, CEIL(LENGTH(org_scale_coeff) * 2/3)), REPEAT('*', FLOOR(LENGTH(org_scale_coeff) * 1/3))) END;
-- dw_tab_name (person_name)
UPDATE ads_znjg_rsk_pmc_swp_summary_etl_mf_ytai SET dw_tab_name = CASE WHEN LENGTH(dw_tab_name) <= 2 THEN CONCAT(SUBSTR(dw_tab_name, 1, 1), '*') WHEN LENGTH(dw_tab_name) <= 4 THEN CONCAT(SUBSTR(dw_tab_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dw_tab_name, 1, CEIL(LENGTH(dw_tab_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dw_tab_name) * 1/3))) END;

-- 表: bffact_warn_rslt_d_df_ytai
-- rule_name (person_name)
UPDATE bffact_warn_rslt_d_df_ytai SET rule_name = CASE WHEN LENGTH(rule_name) <= 2 THEN CONCAT(SUBSTR(rule_name, 1, 1), '*') WHEN LENGTH(rule_name) <= 4 THEN CONCAT(SUBSTR(rule_name, 1, 2), '*') ELSE CONCAT(SUBSTR(rule_name, 1, CEIL(LENGTH(rule_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(rule_name) * 1/3))) END;

-- 表: comn_druglist_b_zyyp_public
-- drug_name (person_name)
UPDATE comn_druglist_b_zyyp_public SET drug_name = CASE WHEN LENGTH(drug_name) <= 2 THEN CONCAT(SUBSTR(drug_name, 1, 1), '*') WHEN LENGTH(drug_name) <= 4 THEN CONCAT(SUBSTR(drug_name, 1, 2), '*') ELSE CONCAT(SUBSTR(drug_name, 1, CEIL(LENGTH(drug_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(drug_name) * 1/3))) END;

-- 表: comn_fixmedins_code_public
-- fixmedins_name (person_name)
UPDATE comn_fixmedins_code_public SET fixmedins_name = CASE WHEN LENGTH(fixmedins_name) <= 2 THEN CONCAT(SUBSTR(fixmedins_name, 1, 1), '*') WHEN LENGTH(fixmedins_name) <= 4 THEN CONCAT(SUBSTR(fixmedins_name, 1, 2), '*') ELSE CONCAT(SUBSTR(fixmedins_name, 1, CEIL(LENGTH(fixmedins_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_name) * 1/3))) END;

-- 表: count_num_of_full_extraction_tables_past_two_years
-- tablename (person_name)
UPDATE count_num_of_full_extraction_tables_past_two_years SET tablename = CASE WHEN LENGTH(tablename) <= 2 THEN CONCAT(SUBSTR(tablename, 1, 1), '*') WHEN LENGTH(tablename) <= 4 THEN CONCAT(SUBSTR(tablename, 1, 2), '*') ELSE CONCAT(SUBSTR(tablename, 1, CEIL(LENGTH(tablename) * 2/3)), REPEAT('*', FLOOR(LENGTH(tablename) * 1/3))) END;

-- 表: dashboard
-- OPTER_NAME (person_name)
UPDATE dashboard SET OPTER_NAME = CASE WHEN LENGTH(OPTER_NAME) <= 2 THEN CONCAT(SUBSTR(OPTER_NAME, 1, 1), '*') WHEN LENGTH(OPTER_NAME) <= 4 THEN CONCAT(SUBSTR(OPTER_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(OPTER_NAME, 1, CEIL(LENGTH(OPTER_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(OPTER_NAME) * 1/3))) END;

-- 表: data_dic_a
-- DIC_VAL_NAME (person_name)
UPDATE data_dic_a SET DIC_VAL_NAME = CASE WHEN LENGTH(DIC_VAL_NAME) <= 2 THEN CONCAT(SUBSTR(DIC_VAL_NAME, 1, 1), '*') WHEN LENGTH(DIC_VAL_NAME) <= 4 THEN CONCAT(SUBSTR(DIC_VAL_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(DIC_VAL_NAME, 1, CEIL(LENGTH(DIC_VAL_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(DIC_VAL_NAME) * 1/3))) END;
-- CRTER_ID (person_name)
UPDATE data_dic_a SET CRTER_ID = CASE WHEN LENGTH(CRTER_ID) <= 2 THEN CONCAT(SUBSTR(CRTER_ID, 1, 1), '*') WHEN LENGTH(CRTER_ID) <= 4 THEN CONCAT(SUBSTR(CRTER_ID, 1, 2), '*') ELSE CONCAT(SUBSTR(CRTER_ID, 1, CEIL(LENGTH(CRTER_ID) * 2/3)), REPEAT('*', FLOOR(LENGTH(CRTER_ID) * 1/3))) END;
-- CRTER_NAME (person_name)
UPDATE data_dic_a SET CRTER_NAME = CASE WHEN LENGTH(CRTER_NAME) <= 2 THEN CONCAT(SUBSTR(CRTER_NAME, 1, 1), '*') WHEN LENGTH(CRTER_NAME) <= 4 THEN CONCAT(SUBSTR(CRTER_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(CRTER_NAME, 1, CEIL(LENGTH(CRTER_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(CRTER_NAME) * 1/3))) END;
-- CRTE_OPTINS_NO (org_name)
UPDATE data_dic_a SET CRTE_OPTINS_NO = CASE WHEN LENGTH(CRTE_OPTINS_NO) <= 5 THEN CONCAT(SUBSTR(CRTE_OPTINS_NO, 1, 3), REPEAT('*', LENGTH(CRTE_OPTINS_NO) - 3)) ELSE CONCAT(SUBSTR(CRTE_OPTINS_NO, 1, CEIL(LENGTH(CRTE_OPTINS_NO) * 2/3)), REPEAT('*', FLOOR(LENGTH(CRTE_OPTINS_NO) * 1/3))) END;
-- OPTER_ID (person_name)
UPDATE data_dic_a SET OPTER_ID = CASE WHEN LENGTH(OPTER_ID) <= 2 THEN CONCAT(SUBSTR(OPTER_ID, 1, 1), '*') WHEN LENGTH(OPTER_ID) <= 4 THEN CONCAT(SUBSTR(OPTER_ID, 1, 2), '*') ELSE CONCAT(SUBSTR(OPTER_ID, 1, CEIL(LENGTH(OPTER_ID) * 2/3)), REPEAT('*', FLOOR(LENGTH(OPTER_ID) * 1/3))) END;
-- OPTER_NAME (person_name)
UPDATE data_dic_a SET OPTER_NAME = CASE WHEN LENGTH(OPTER_NAME) <= 2 THEN CONCAT(SUBSTR(OPTER_NAME, 1, 1), '*') WHEN LENGTH(OPTER_NAME) <= 4 THEN CONCAT(SUBSTR(OPTER_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(OPTER_NAME, 1, CEIL(LENGTH(OPTER_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(OPTER_NAME) * 1/3))) END;
-- OPTINS_NO (org_name)
UPDATE data_dic_a SET OPTINS_NO = CASE WHEN LENGTH(OPTINS_NO) <= 5 THEN CONCAT(SUBSTR(OPTINS_NO, 1, 3), REPEAT('*', LENGTH(OPTINS_NO) - 3)) ELSE CONCAT(SUBSTR(OPTINS_NO, 1, CEIL(LENGTH(OPTINS_NO) * 2/3)), REPEAT('*', FLOOR(LENGTH(OPTINS_NO) * 1/3))) END;

-- 表: data_dic_mgt
-- DIC_NAME (person_name)
UPDATE data_dic_mgt SET DIC_NAME = CASE WHEN LENGTH(DIC_NAME) <= 2 THEN CONCAT(SUBSTR(DIC_NAME, 1, 1), '*') WHEN LENGTH(DIC_NAME) <= 4 THEN CONCAT(SUBSTR(DIC_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(DIC_NAME, 1, CEIL(LENGTH(DIC_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(DIC_NAME) * 1/3))) END;
-- DIC_VAL_NAME (person_name)
UPDATE data_dic_mgt SET DIC_VAL_NAME = CASE WHEN LENGTH(DIC_VAL_NAME) <= 2 THEN CONCAT(SUBSTR(DIC_VAL_NAME, 1, 1), '*') WHEN LENGTH(DIC_VAL_NAME) <= 4 THEN CONCAT(SUBSTR(DIC_VAL_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(DIC_VAL_NAME, 1, CEIL(LENGTH(DIC_VAL_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(DIC_VAL_NAME) * 1/3))) END;
-- OPTER_NAME (person_name)
UPDATE data_dic_mgt SET OPTER_NAME = CASE WHEN LENGTH(OPTER_NAME) <= 2 THEN CONCAT(SUBSTR(OPTER_NAME, 1, 1), '*') WHEN LENGTH(OPTER_NAME) <= 4 THEN CONCAT(SUBSTR(OPTER_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(OPTER_NAME, 1, CEIL(LENGTH(OPTER_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(OPTER_NAME) * 1/3))) END;

-- 表: dwd_ggfw_service_core_metrics_mi_ytai
-- org_service_total (org_name)
UPDATE dwd_ggfw_service_core_metrics_mi_ytai SET org_service_total = CASE WHEN LENGTH(org_service_total) <= 5 THEN CONCAT(SUBSTR(org_service_total, 1, 3), REPEAT('*', LENGTH(org_service_total) - 3)) ELSE CONCAT(SUBSTR(org_service_total, 1, CEIL(LENGTH(org_service_total) * 2/3)), REPEAT('*', FLOOR(LENGTH(org_service_total) * 1/3))) END;
-- insured_org_count (org_name)
UPDATE dwd_ggfw_service_core_metrics_mi_ytai SET insured_org_count = CASE WHEN LENGTH(insured_org_count) <= 5 THEN CONCAT(SUBSTR(insured_org_count, 1, 3), REPEAT('*', LENGTH(insured_org_count) - 3)) ELSE CONCAT(SUBSTR(insured_org_count, 1, CEIL(LENGTH(insured_org_count) * 2/3)), REPEAT('*', FLOOR(LENGTH(insured_org_count) * 1/3))) END;
-- org_register_count (org_name)
UPDATE dwd_ggfw_service_core_metrics_mi_ytai SET org_register_count = CASE WHEN LENGTH(org_register_count) <= 5 THEN CONCAT(SUBSTR(org_register_count, 1, 3), REPEAT('*', LENGTH(org_register_count) - 3)) ELSE CONCAT(SUBSTR(org_register_count, 1, CEIL(LENGTH(org_register_count) * 2/3)), REPEAT('*', FLOOR(LENGTH(org_register_count) * 1/3))) END;
-- org_login_count (org_name)
UPDATE dwd_ggfw_service_core_metrics_mi_ytai SET org_login_count = CASE WHEN LENGTH(org_login_count) <= 5 THEN CONCAT(SUBSTR(org_login_count, 1, 3), REPEAT('*', LENGTH(org_login_count) - 3)) ELSE CONCAT(SUBSTR(org_login_count, 1, CEIL(LENGTH(org_login_count) * 2/3)), REPEAT('*', FLOOR(LENGTH(org_login_count) * 1/3))) END;
-- top1_matter_name (person_name)
UPDATE dwd_ggfw_service_core_metrics_mi_ytai SET top1_matter_name = CASE WHEN LENGTH(top1_matter_name) <= 2 THEN CONCAT(SUBSTR(top1_matter_name, 1, 1), '*') WHEN LENGTH(top1_matter_name) <= 4 THEN CONCAT(SUBSTR(top1_matter_name, 1, 2), '*') ELSE CONCAT(SUBSTR(top1_matter_name, 1, CEIL(LENGTH(top1_matter_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(top1_matter_name) * 1/3))) END;
-- top2_matter_name (person_name)
UPDATE dwd_ggfw_service_core_metrics_mi_ytai SET top2_matter_name = CASE WHEN LENGTH(top2_matter_name) <= 2 THEN CONCAT(SUBSTR(top2_matter_name, 1, 1), '*') WHEN LENGTH(top2_matter_name) <= 4 THEN CONCAT(SUBSTR(top2_matter_name, 1, 2), '*') ELSE CONCAT(SUBSTR(top2_matter_name, 1, CEIL(LENGTH(top2_matter_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(top2_matter_name) * 1/3))) END;
-- top3_matter_name (person_name)
UPDATE dwd_ggfw_service_core_metrics_mi_ytai SET top3_matter_name = CASE WHEN LENGTH(top3_matter_name) <= 2 THEN CONCAT(SUBSTR(top3_matter_name, 1, 1), '*') WHEN LENGTH(top3_matter_name) <= 4 THEN CONCAT(SUBSTR(top3_matter_name, 1, 2), '*') ELSE CONCAT(SUBSTR(top3_matter_name, 1, CEIL(LENGTH(top3_matter_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(top3_matter_name) * 1/3))) END;
-- top4_matter_name (person_name)
UPDATE dwd_ggfw_service_core_metrics_mi_ytai SET top4_matter_name = CASE WHEN LENGTH(top4_matter_name) <= 2 THEN CONCAT(SUBSTR(top4_matter_name, 1, 1), '*') WHEN LENGTH(top4_matter_name) <= 4 THEN CONCAT(SUBSTR(top4_matter_name, 1, 2), '*') ELSE CONCAT(SUBSTR(top4_matter_name, 1, CEIL(LENGTH(top4_matter_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(top4_matter_name) * 1/3))) END;
-- top5_matter_name (person_name)
UPDATE dwd_ggfw_service_core_metrics_mi_ytai SET top5_matter_name = CASE WHEN LENGTH(top5_matter_name) <= 2 THEN CONCAT(SUBSTR(top5_matter_name, 1, 1), '*') WHEN LENGTH(top5_matter_name) <= 4 THEN CONCAT(SUBSTR(top5_matter_name, 1, 2), '*') ELSE CONCAT(SUBSTR(top5_matter_name, 1, CEIL(LENGTH(top5_matter_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(top5_matter_name) * 1/3))) END;
-- optins_no (org_name)
UPDATE dwd_ggfw_service_core_metrics_mi_ytai SET optins_no = CASE WHEN LENGTH(optins_no) <= 5 THEN CONCAT(SUBSTR(optins_no, 1, 3), REPEAT('*', LENGTH(optins_no) - 3)) ELSE CONCAT(SUBSTR(optins_no, 1, CEIL(LENGTH(optins_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(optins_no) * 1/3))) END;
-- dw_tab_name (person_name)
UPDATE dwd_ggfw_service_core_metrics_mi_ytai SET dw_tab_name = CASE WHEN LENGTH(dw_tab_name) <= 2 THEN CONCAT(SUBSTR(dw_tab_name, 1, 1), '*') WHEN LENGTH(dw_tab_name) <= 4 THEN CONCAT(SUBSTR(dw_tab_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dw_tab_name, 1, CEIL(LENGTH(dw_tab_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dw_tab_name) * 1/3))) END;
-- area_name (person_name)
UPDATE dwd_ggfw_service_core_metrics_mi_ytai SET area_name = CASE WHEN LENGTH(area_name) <= 2 THEN CONCAT(SUBSTR(area_name, 1, 1), '*') WHEN LENGTH(area_name) <= 4 THEN CONCAT(SUBSTR(area_name, 1, 2), '*') ELSE CONCAT(SUBSTR(area_name, 1, CEIL(LENGTH(area_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(area_name) * 1/3))) END;

-- 表: dwd_jgxx_fcm_fixmedins_b_df_ytai
-- fixmedins_code (org_name)
UPDATE dwd_jgxx_fcm_fixmedins_b_df_ytai SET fixmedins_code = CASE WHEN LENGTH(fixmedins_code) <= 5 THEN CONCAT(SUBSTR(fixmedins_code, 1, 3), REPEAT('*', LENGTH(fixmedins_code) - 3)) ELSE CONCAT(SUBSTR(fixmedins_code, 1, CEIL(LENGTH(fixmedins_code) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_code) * 1/3))) END;
-- fixmedins_name (person_name)
UPDATE dwd_jgxx_fcm_fixmedins_b_df_ytai SET fixmedins_name = CASE WHEN LENGTH(fixmedins_name) <= 2 THEN CONCAT(SUBSTR(fixmedins_name, 1, 1), '*') WHEN LENGTH(fixmedins_name) <= 4 THEN CONCAT(SUBSTR(fixmedins_name, 1, 2), '*') ELSE CONCAT(SUBSTR(fixmedins_name, 1, CEIL(LENGTH(fixmedins_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_name) * 1/3))) END;
-- fixmedins_type (org_name)
UPDATE dwd_jgxx_fcm_fixmedins_b_df_ytai SET fixmedins_type = CASE WHEN LENGTH(fixmedins_type) <= 5 THEN CONCAT(SUBSTR(fixmedins_type, 1, 3), REPEAT('*', LENGTH(fixmedins_type) - 3)) ELSE CONCAT(SUBSTR(fixmedins_type, 1, CEIL(LENGTH(fixmedins_type) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_type) * 1/3))) END;
-- fixmedins_type_desc (org_name)
UPDATE dwd_jgxx_fcm_fixmedins_b_df_ytai SET fixmedins_type_desc = CASE WHEN LENGTH(fixmedins_type_desc) <= 5 THEN CONCAT(SUBSTR(fixmedins_type_desc, 1, 3), REPEAT('*', LENGTH(fixmedins_type_desc) - 3)) ELSE CONCAT(SUBSTR(fixmedins_type_desc, 1, CEIL(LENGTH(fixmedins_type_desc) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_type_desc) * 1/3))) END;
-- medins_lv (org_name)
UPDATE dwd_jgxx_fcm_fixmedins_b_df_ytai SET medins_lv = CASE WHEN LENGTH(medins_lv) <= 5 THEN CONCAT(SUBSTR(medins_lv, 1, 3), REPEAT('*', LENGTH(medins_lv) - 3)) ELSE CONCAT(SUBSTR(medins_lv, 1, CEIL(LENGTH(medins_lv) * 2/3)), REPEAT('*', FLOOR(LENGTH(medins_lv) * 1/3))) END;
-- medins_lv_desc (org_name)
UPDATE dwd_jgxx_fcm_fixmedins_b_df_ytai SET medins_lv_desc = CASE WHEN LENGTH(medins_lv_desc) <= 5 THEN CONCAT(SUBSTR(medins_lv_desc, 1, 3), REPEAT('*', LENGTH(medins_lv_desc) - 3)) ELSE CONCAT(SUBSTR(medins_lv_desc, 1, CEIL(LENGTH(medins_lv_desc) * 2/3)), REPEAT('*', FLOOR(LENGTH(medins_lv_desc) * 1/3))) END;
-- dedc_hosp_lv (org_name)
UPDATE dwd_jgxx_fcm_fixmedins_b_df_ytai SET dedc_hosp_lv = CASE WHEN LENGTH(dedc_hosp_lv) <= 5 THEN CONCAT(SUBSTR(dedc_hosp_lv, 1, 3), REPEAT('*', LENGTH(dedc_hosp_lv) - 3)) ELSE CONCAT(SUBSTR(dedc_hosp_lv, 1, CEIL(LENGTH(dedc_hosp_lv) * 2/3)), REPEAT('*', FLOOR(LENGTH(dedc_hosp_lv) * 1/3))) END;
-- lmtpric_hosp_lv (org_name)
UPDATE dwd_jgxx_fcm_fixmedins_b_df_ytai SET lmtpric_hosp_lv = CASE WHEN LENGTH(lmtpric_hosp_lv) <= 5 THEN CONCAT(SUBSTR(lmtpric_hosp_lv, 1, 3), REPEAT('*', LENGTH(lmtpric_hosp_lv) - 3)) ELSE CONCAT(SUBSTR(lmtpric_hosp_lv, 1, CEIL(LENGTH(lmtpric_hosp_lv) * 2/3)), REPEAT('*', FLOOR(LENGTH(lmtpric_hosp_lv) * 1/3))) END;
-- addr (org_name)
UPDATE dwd_jgxx_fcm_fixmedins_b_df_ytai SET addr = CASE WHEN LENGTH(addr) <= 5 THEN CONCAT(SUBSTR(addr, 1, 3), REPEAT('*', LENGTH(addr) - 3)) ELSE CONCAT(SUBSTR(addr, 1, CEIL(LENGTH(addr) * 2/3)), REPEAT('*', FLOOR(LENGTH(addr) * 1/3))) END;
-- tel (phone)
UPDATE dwd_jgxx_fcm_fixmedins_b_df_ytai SET tel = CASE WHEN LENGTH(tel) <= 8 THEN CONCAT(SUBSTR(tel, 1, 5), REPEAT('*', LENGTH(tel) - 5)) ELSE CONCAT(SUBSTR(tel, 1, CEIL(LENGTH(tel) * 2/3)), REPEAT('*', FLOOR(LENGTH(tel) * 1/3))) END;
-- coner_name (person_name)
UPDATE dwd_jgxx_fcm_fixmedins_b_df_ytai SET coner_name = CASE WHEN LENGTH(coner_name) <= 2 THEN CONCAT(SUBSTR(coner_name, 1, 1), '*') WHEN LENGTH(coner_name) <= 4 THEN CONCAT(SUBSTR(coner_name, 1, 2), '*') ELSE CONCAT(SUBSTR(coner_name, 1, CEIL(LENGTH(coner_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(coner_name) * 1/3))) END;
-- poolarea (org_name)
UPDATE dwd_jgxx_fcm_fixmedins_b_df_ytai SET poolarea = CASE WHEN LENGTH(poolarea) <= 5 THEN CONCAT(SUBSTR(poolarea, 1, 3), REPEAT('*', LENGTH(poolarea) - 3)) ELSE CONCAT(SUBSTR(poolarea, 1, CEIL(LENGTH(poolarea) * 2/3)), REPEAT('*', FLOOR(LENGTH(poolarea) * 1/3))) END;
-- out_fixmedins_type (org_name)
UPDATE dwd_jgxx_fcm_fixmedins_b_df_ytai SET out_fixmedins_type = CASE WHEN LENGTH(out_fixmedins_type) <= 5 THEN CONCAT(SUBSTR(out_fixmedins_type, 1, 3), REPEAT('*', LENGTH(out_fixmedins_type) - 3)) ELSE CONCAT(SUBSTR(out_fixmedins_type, 1, CEIL(LENGTH(out_fixmedins_type) * 2/3)), REPEAT('*', FLOOR(LENGTH(out_fixmedins_type) * 1/3))) END;
-- medins_natu (org_name)
UPDATE dwd_jgxx_fcm_fixmedins_b_df_ytai SET medins_natu = CASE WHEN LENGTH(medins_natu) <= 5 THEN CONCAT(SUBSTR(medins_natu, 1, 3), REPEAT('*', LENGTH(medins_natu) - 3)) ELSE CONCAT(SUBSTR(medins_natu, 1, CEIL(LENGTH(medins_natu) * 2/3)), REPEAT('*', FLOOR(LENGTH(medins_natu) * 1/3))) END;
-- medins_natu_desc (org_name)
UPDATE dwd_jgxx_fcm_fixmedins_b_df_ytai SET medins_natu_desc = CASE WHEN LENGTH(medins_natu_desc) <= 5 THEN CONCAT(SUBSTR(medins_natu_desc, 1, 3), REPEAT('*', LENGTH(medins_natu_desc) - 3)) ELSE CONCAT(SUBSTR(medins_natu_desc, 1, CEIL(LENGTH(medins_natu_desc) * 2/3)), REPEAT('*', FLOOR(LENGTH(medins_natu_desc) * 1/3))) END;
-- dw_tab_name (person_name)
UPDATE dwd_jgxx_fcm_fixmedins_b_df_ytai SET dw_tab_name = CASE WHEN LENGTH(dw_tab_name) <= 2 THEN CONCAT(SUBSTR(dw_tab_name, 1, 1), '*') WHEN LENGTH(dw_tab_name) <= 4 THEN CONCAT(SUBSTR(dw_tab_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dw_tab_name, 1, CEIL(LENGTH(dw_tab_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dw_tab_name) * 1/3))) END;

-- 表: dwd_jjsz_fee_list_d_opt_mi_ytai
-- fixmedins_name (person_name)
UPDATE dwd_jjsz_fee_list_d_opt_mi_ytai SET fixmedins_name = CASE WHEN LENGTH(fixmedins_name) <= 2 THEN CONCAT(SUBSTR(fixmedins_name, 1, 1), '*') WHEN LENGTH(fixmedins_name) <= 4 THEN CONCAT(SUBSTR(fixmedins_name, 1, 2), '*') ELSE CONCAT(SUBSTR(fixmedins_name, 1, CEIL(LENGTH(fixmedins_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_name) * 1/3))) END;
-- med_chrgitm_type_name (person_name)
UPDATE dwd_jjsz_fee_list_d_opt_mi_ytai SET med_chrgitm_type_name = CASE WHEN LENGTH(med_chrgitm_type_name) <= 2 THEN CONCAT(SUBSTR(med_chrgitm_type_name, 1, 1), '*') WHEN LENGTH(med_chrgitm_type_name) <= 4 THEN CONCAT(SUBSTR(med_chrgitm_type_name, 1, 2), '*') ELSE CONCAT(SUBSTR(med_chrgitm_type_name, 1, CEIL(LENGTH(med_chrgitm_type_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(med_chrgitm_type_name) * 1/3))) END;

-- 表: dwd_jjsz_setl_d_di_ytai
-- clr_optins (org_name)
UPDATE dwd_jjsz_setl_d_di_ytai SET clr_optins = CASE WHEN LENGTH(clr_optins) <= 5 THEN CONCAT(SUBSTR(clr_optins, 1, 3), REPEAT('*', LENGTH(clr_optins) - 3)) ELSE CONCAT(SUBSTR(clr_optins, 1, CEIL(LENGTH(clr_optins) * 2/3)), REPEAT('*', FLOOR(LENGTH(clr_optins) * 1/3))) END;
-- medins_setl_id (org_name)
UPDATE dwd_jjsz_setl_d_di_ytai SET medins_setl_id = CASE WHEN LENGTH(medins_setl_id) <= 5 THEN CONCAT(SUBSTR(medins_setl_id, 1, 3), REPEAT('*', LENGTH(medins_setl_id) - 3)) ELSE CONCAT(SUBSTR(medins_setl_id, 1, CEIL(LENGTH(medins_setl_id) * 2/3)), REPEAT('*', FLOOR(LENGTH(medins_setl_id) * 1/3))) END;
-- mdtrt_id (medical_record)
UPDATE dwd_jjsz_setl_d_di_ytai SET mdtrt_id = CASE WHEN LENGTH(mdtrt_id) <= 8 THEN CONCAT(SUBSTR(mdtrt_id, 1, 5), REPEAT('*', LENGTH(mdtrt_id) - 5)) ELSE CONCAT(SUBSTR(mdtrt_id, 1, CEIL(LENGTH(mdtrt_id) * 2/3)), REPEAT('*', FLOOR(LENGTH(mdtrt_id) * 1/3))) END;
-- psn_no (person_id)
UPDATE dwd_jjsz_setl_d_di_ytai SET psn_no = CASE WHEN LENGTH(psn_no) <= 8 THEN CONCAT(SUBSTR(psn_no, 1, 5), REPEAT('*', LENGTH(psn_no) - 5)) ELSE CONCAT(SUBSTR(psn_no, 1, CEIL(LENGTH(psn_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(psn_no) * 1/3))) END;
-- psn_name (person_name)
UPDATE dwd_jjsz_setl_d_di_ytai SET psn_name = CASE WHEN LENGTH(psn_name) <= 2 THEN CONCAT(SUBSTR(psn_name, 1, 1), '*') WHEN LENGTH(psn_name) <= 4 THEN CONCAT(SUBSTR(psn_name, 1, 2), '*') ELSE CONCAT(SUBSTR(psn_name, 1, CEIL(LENGTH(psn_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(psn_name) * 1/3))) END;
-- certno (id_card)
UPDATE dwd_jjsz_setl_d_di_ytai SET certno = CASE WHEN LENGTH(certno) <= 10 THEN CONCAT(SUBSTR(certno, 1, 7), REPEAT('*', LENGTH(certno) - 7)) ELSE CONCAT(SUBSTR(certno, 1, CEIL(LENGTH(certno) * 2/3)), REPEAT('*', FLOOR(LENGTH(certno) * 1/3))) END;
-- emp_no (org_name)
UPDATE dwd_jjsz_setl_d_di_ytai SET emp_no = CASE WHEN LENGTH(emp_no) <= 5 THEN CONCAT(SUBSTR(emp_no, 1, 3), REPEAT('*', LENGTH(emp_no) - 3)) ELSE CONCAT(SUBSTR(emp_no, 1, CEIL(LENGTH(emp_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(emp_no) * 1/3))) END;
-- emp_name (person_name)
UPDATE dwd_jjsz_setl_d_di_ytai SET emp_name = CASE WHEN LENGTH(emp_name) <= 2 THEN CONCAT(SUBSTR(emp_name, 1, 1), '*') WHEN LENGTH(emp_name) <= 4 THEN CONCAT(SUBSTR(emp_name, 1, 2), '*') ELSE CONCAT(SUBSTR(emp_name, 1, CEIL(LENGTH(emp_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(emp_name) * 1/3))) END;
-- emp_type (org_name)
UPDATE dwd_jjsz_setl_d_di_ytai SET emp_type = CASE WHEN LENGTH(emp_type) <= 5 THEN CONCAT(SUBSTR(emp_type, 1, 3), REPEAT('*', LENGTH(emp_type) - 3)) ELSE CONCAT(SUBSTR(emp_type, 1, CEIL(LENGTH(emp_type) * 2/3)), REPEAT('*', FLOOR(LENGTH(emp_type) * 1/3))) END;
-- emp_mgt_type (org_name)
UPDATE dwd_jjsz_setl_d_di_ytai SET emp_mgt_type = CASE WHEN LENGTH(emp_mgt_type) <= 5 THEN CONCAT(SUBSTR(emp_mgt_type, 1, 3), REPEAT('*', LENGTH(emp_mgt_type) - 3)) ELSE CONCAT(SUBSTR(emp_mgt_type, 1, CEIL(LENGTH(emp_mgt_type) * 2/3)), REPEAT('*', FLOOR(LENGTH(emp_mgt_type) * 1/3))) END;
-- fixmedins_code (org_name)
UPDATE dwd_jjsz_setl_d_di_ytai SET fixmedins_code = CASE WHEN LENGTH(fixmedins_code) <= 5 THEN CONCAT(SUBSTR(fixmedins_code, 1, 3), REPEAT('*', LENGTH(fixmedins_code) - 3)) ELSE CONCAT(SUBSTR(fixmedins_code, 1, CEIL(LENGTH(fixmedins_code) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_code) * 1/3))) END;
-- fixmedins_name (person_name)
UPDATE dwd_jjsz_setl_d_di_ytai SET fixmedins_name = CASE WHEN LENGTH(fixmedins_name) <= 2 THEN CONCAT(SUBSTR(fixmedins_name, 1, 1), '*') WHEN LENGTH(fixmedins_name) <= 4 THEN CONCAT(SUBSTR(fixmedins_name, 1, 2), '*') ELSE CONCAT(SUBSTR(fixmedins_name, 1, CEIL(LENGTH(fixmedins_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_name) * 1/3))) END;
-- hosp_lv (org_name)
UPDATE dwd_jjsz_setl_d_di_ytai SET hosp_lv = CASE WHEN LENGTH(hosp_lv) <= 5 THEN CONCAT(SUBSTR(hosp_lv, 1, 3), REPEAT('*', LENGTH(hosp_lv) - 3)) ELSE CONCAT(SUBSTR(hosp_lv, 1, CEIL(LENGTH(hosp_lv) * 2/3)), REPEAT('*', FLOOR(LENGTH(hosp_lv) * 1/3))) END;
-- lmtpric_hosp_lv (org_name)
UPDATE dwd_jjsz_setl_d_di_ytai SET lmtpric_hosp_lv = CASE WHEN LENGTH(lmtpric_hosp_lv) <= 5 THEN CONCAT(SUBSTR(lmtpric_hosp_lv, 1, 3), REPEAT('*', LENGTH(lmtpric_hosp_lv) - 3)) ELSE CONCAT(SUBSTR(lmtpric_hosp_lv, 1, CEIL(LENGTH(lmtpric_hosp_lv) * 2/3)), REPEAT('*', FLOOR(LENGTH(lmtpric_hosp_lv) * 1/3))) END;
-- dedc_hosp_lv (org_name)
UPDATE dwd_jjsz_setl_d_di_ytai SET dedc_hosp_lv = CASE WHEN LENGTH(dedc_hosp_lv) <= 5 THEN CONCAT(SUBSTR(dedc_hosp_lv, 1, 3), REPEAT('*', LENGTH(dedc_hosp_lv) - 3)) ELSE CONCAT(SUBSTR(dedc_hosp_lv, 1, CEIL(LENGTH(dedc_hosp_lv) * 2/3)), REPEAT('*', FLOOR(LENGTH(dedc_hosp_lv) * 1/3))) END;
-- mdtrt_cert_type (medical_record)
UPDATE dwd_jjsz_setl_d_di_ytai SET mdtrt_cert_type = CASE WHEN LENGTH(mdtrt_cert_type) <= 8 THEN CONCAT(SUBSTR(mdtrt_cert_type, 1, 5), REPEAT('*', LENGTH(mdtrt_cert_type) - 5)) ELSE CONCAT(SUBSTR(mdtrt_cert_type, 1, CEIL(LENGTH(mdtrt_cert_type) * 2/3)), REPEAT('*', FLOOR(LENGTH(mdtrt_cert_type) * 1/3))) END;
-- mdtrt_cert_no (medical_record)
UPDATE dwd_jjsz_setl_d_di_ytai SET mdtrt_cert_no = CASE WHEN LENGTH(mdtrt_cert_no) <= 8 THEN CONCAT(SUBSTR(mdtrt_cert_no, 1, 5), REPEAT('*', LENGTH(mdtrt_cert_no) - 5)) ELSE CONCAT(SUBSTR(mdtrt_cert_no, 1, CEIL(LENGTH(mdtrt_cert_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(mdtrt_cert_no) * 1/3))) END;
-- ownpay_hosp_part (org_name)
UPDATE dwd_jjsz_setl_d_di_ytai SET ownpay_hosp_part = CASE WHEN LENGTH(ownpay_hosp_part) <= 5 THEN CONCAT(SUBSTR(ownpay_hosp_part, 1, 3), REPEAT('*', LENGTH(ownpay_hosp_part) - 3)) ELSE CONCAT(SUBSTR(ownpay_hosp_part, 1, CEIL(LENGTH(ownpay_hosp_part) * 2/3)), REPEAT('*', FLOOR(LENGTH(ownpay_hosp_part) * 1/3))) END;
-- dise_name (person_name)
UPDATE dwd_jjsz_setl_d_di_ytai SET dise_name = CASE WHEN LENGTH(dise_name) <= 2 THEN CONCAT(SUBSTR(dise_name, 1, 1), '*') WHEN LENGTH(dise_name) <= 4 THEN CONCAT(SUBSTR(dise_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dise_name, 1, CEIL(LENGTH(dise_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dise_name) * 1/3))) END;
-- crter_id (person_name)
UPDATE dwd_jjsz_setl_d_di_ytai SET crter_id = CASE WHEN LENGTH(crter_id) <= 2 THEN CONCAT(SUBSTR(crter_id, 1, 1), '*') WHEN LENGTH(crter_id) <= 4 THEN CONCAT(SUBSTR(crter_id, 1, 2), '*') ELSE CONCAT(SUBSTR(crter_id, 1, CEIL(LENGTH(crter_id) * 2/3)), REPEAT('*', FLOOR(LENGTH(crter_id) * 1/3))) END;
-- crter_name (person_name)
UPDATE dwd_jjsz_setl_d_di_ytai SET crter_name = CASE WHEN LENGTH(crter_name) <= 2 THEN CONCAT(SUBSTR(crter_name, 1, 1), '*') WHEN LENGTH(crter_name) <= 4 THEN CONCAT(SUBSTR(crter_name, 1, 2), '*') ELSE CONCAT(SUBSTR(crter_name, 1, CEIL(LENGTH(crter_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(crter_name) * 1/3))) END;
-- crte_optins_no (org_name)
UPDATE dwd_jjsz_setl_d_di_ytai SET crte_optins_no = CASE WHEN LENGTH(crte_optins_no) <= 5 THEN CONCAT(SUBSTR(crte_optins_no, 1, 3), REPEAT('*', LENGTH(crte_optins_no) - 3)) ELSE CONCAT(SUBSTR(crte_optins_no, 1, CEIL(LENGTH(crte_optins_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(crte_optins_no) * 1/3))) END;
-- opter_id (person_name)
UPDATE dwd_jjsz_setl_d_di_ytai SET opter_id = CASE WHEN LENGTH(opter_id) <= 2 THEN CONCAT(SUBSTR(opter_id, 1, 1), '*') WHEN LENGTH(opter_id) <= 4 THEN CONCAT(SUBSTR(opter_id, 1, 2), '*') ELSE CONCAT(SUBSTR(opter_id, 1, CEIL(LENGTH(opter_id) * 2/3)), REPEAT('*', FLOOR(LENGTH(opter_id) * 1/3))) END;
-- opter_name (person_name)
UPDATE dwd_jjsz_setl_d_di_ytai SET opter_name = CASE WHEN LENGTH(opter_name) <= 2 THEN CONCAT(SUBSTR(opter_name, 1, 1), '*') WHEN LENGTH(opter_name) <= 4 THEN CONCAT(SUBSTR(opter_name, 1, 2), '*') ELSE CONCAT(SUBSTR(opter_name, 1, CEIL(LENGTH(opter_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(opter_name) * 1/3))) END;
-- optins_no (org_name)
UPDATE dwd_jjsz_setl_d_di_ytai SET optins_no = CASE WHEN LENGTH(optins_no) <= 5 THEN CONCAT(SUBSTR(optins_no, 1, 3), REPEAT('*', LENGTH(optins_no) - 3)) ELSE CONCAT(SUBSTR(optins_no, 1, CEIL(LENGTH(optins_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(optins_no) * 1/3))) END;
-- fixmedins_type_desc (org_name)
UPDATE dwd_jjsz_setl_d_di_ytai SET fixmedins_type_desc = CASE WHEN LENGTH(fixmedins_type_desc) <= 5 THEN CONCAT(SUBSTR(fixmedins_type_desc, 1, 3), REPEAT('*', LENGTH(fixmedins_type_desc) - 3)) ELSE CONCAT(SUBSTR(fixmedins_type_desc, 1, CEIL(LENGTH(fixmedins_type_desc) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_type_desc) * 1/3))) END;
-- hosp_lv_desc (org_name)
UPDATE dwd_jjsz_setl_d_di_ytai SET hosp_lv_desc = CASE WHEN LENGTH(hosp_lv_desc) <= 5 THEN CONCAT(SUBSTR(hosp_lv_desc, 1, 3), REPEAT('*', LENGTH(hosp_lv_desc) - 3)) ELSE CONCAT(SUBSTR(hosp_lv_desc, 1, CEIL(LENGTH(hosp_lv_desc) * 2/3)), REPEAT('*', FLOOR(LENGTH(hosp_lv_desc) * 1/3))) END;
-- dw_tab_name (person_name)
UPDATE dwd_jjsz_setl_d_di_ytai SET dw_tab_name = CASE WHEN LENGTH(dw_tab_name) <= 2 THEN CONCAT(SUBSTR(dw_tab_name, 1, 1), '*') WHEN LENGTH(dw_tab_name) <= 4 THEN CONCAT(SUBSTR(dw_tab_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dw_tab_name, 1, CEIL(LENGTH(dw_tab_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dw_tab_name) * 1/3))) END;

-- 表: dwd_nbkz_prod_cunt_df_ytai
-- fixmedins_code (org_name)
UPDATE dwd_nbkz_prod_cunt_df_ytai SET fixmedins_code = CASE WHEN LENGTH(fixmedins_code) <= 5 THEN CONCAT(SUBSTR(fixmedins_code, 1, 3), REPEAT('*', LENGTH(fixmedins_code) - 3)) ELSE CONCAT(SUBSTR(fixmedins_code, 1, CEIL(LENGTH(fixmedins_code) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_code) * 1/3))) END;
-- fixmedins_name (person_name)
UPDATE dwd_nbkz_prod_cunt_df_ytai SET fixmedins_name = CASE WHEN LENGTH(fixmedins_name) <= 2 THEN CONCAT(SUBSTR(fixmedins_name, 1, 1), '*') WHEN LENGTH(fixmedins_name) <= 4 THEN CONCAT(SUBSTR(fixmedins_name, 1, 2), '*') ELSE CONCAT(SUBSTR(fixmedins_name, 1, CEIL(LENGTH(fixmedins_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_name) * 1/3))) END;
-- fixmedins_type (org_name)
UPDATE dwd_nbkz_prod_cunt_df_ytai SET fixmedins_type = CASE WHEN LENGTH(fixmedins_type) <= 5 THEN CONCAT(SUBSTR(fixmedins_type, 1, 3), REPEAT('*', LENGTH(fixmedins_type) - 3)) ELSE CONCAT(SUBSTR(fixmedins_type, 1, CEIL(LENGTH(fixmedins_type) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_type) * 1/3))) END;
-- fix_blng_admdvs (org_name)
UPDATE dwd_nbkz_prod_cunt_df_ytai SET fix_blng_admdvs = CASE WHEN LENGTH(fix_blng_admdvs) <= 5 THEN CONCAT(SUBSTR(fix_blng_admdvs, 1, 3), REPEAT('*', LENGTH(fix_blng_admdvs) - 3)) ELSE CONCAT(SUBSTR(fix_blng_admdvs, 1, CEIL(LENGTH(fix_blng_admdvs) * 2/3)), REPEAT('*', FLOOR(LENGTH(fix_blng_admdvs) * 1/3))) END;
-- dedc_hosp_lv (org_name)
UPDATE dwd_nbkz_prod_cunt_df_ytai SET dedc_hosp_lv = CASE WHEN LENGTH(dedc_hosp_lv) <= 5 THEN CONCAT(SUBSTR(dedc_hosp_lv, 1, 3), REPEAT('*', LENGTH(dedc_hosp_lv) - 3)) ELSE CONCAT(SUBSTR(dedc_hosp_lv, 1, CEIL(LENGTH(dedc_hosp_lv) * 2/3)), REPEAT('*', FLOOR(LENGTH(dedc_hosp_lv) * 1/3))) END;
-- addr (org_name)
UPDATE dwd_nbkz_prod_cunt_df_ytai SET addr = CASE WHEN LENGTH(addr) <= 5 THEN CONCAT(SUBSTR(addr, 1, 3), REPEAT('*', LENGTH(addr) - 3)) ELSE CONCAT(SUBSTR(addr, 1, CEIL(LENGTH(addr) * 2/3)), REPEAT('*', FLOOR(LENGTH(addr) * 1/3))) END;
-- coner_name (person_name)
UPDATE dwd_nbkz_prod_cunt_df_ytai SET coner_name = CASE WHEN LENGTH(coner_name) <= 2 THEN CONCAT(SUBSTR(coner_name, 1, 1), '*') WHEN LENGTH(coner_name) <= 4 THEN CONCAT(SUBSTR(coner_name, 1, 2), '*') ELSE CONCAT(SUBSTR(coner_name, 1, CEIL(LENGTH(coner_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(coner_name) * 1/3))) END;
-- dw_tab_name (person_name)
UPDATE dwd_nbkz_prod_cunt_df_ytai SET dw_tab_name = CASE WHEN LENGTH(dw_tab_name) <= 2 THEN CONCAT(SUBSTR(dw_tab_name, 1, 1), '*') WHEN LENGTH(dw_tab_name) <= 4 THEN CONCAT(SUBSTR(dw_tab_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dw_tab_name, 1, CEIL(LENGTH(dw_tab_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dw_tab_name) * 1/3))) END;
-- poolarea_name (person_name)
UPDATE dwd_nbkz_prod_cunt_df_ytai SET poolarea_name = CASE WHEN LENGTH(poolarea_name) <= 2 THEN CONCAT(SUBSTR(poolarea_name, 1, 1), '*') WHEN LENGTH(poolarea_name) <= 4 THEN CONCAT(SUBSTR(poolarea_name, 1, 2), '*') ELSE CONCAT(SUBSTR(poolarea_name, 1, CEIL(LENGTH(poolarea_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(poolarea_name) * 1/3))) END;
-- sl_fix_true (org_name)
UPDATE dwd_nbkz_prod_cunt_df_ytai SET sl_fix_true = CASE WHEN LENGTH(sl_fix_true) <= 5 THEN CONCAT(SUBSTR(sl_fix_true, 1, 3), REPEAT('*', LENGTH(sl_fix_true) - 3)) ELSE CONCAT(SUBSTR(sl_fix_true, 1, CEIL(LENGTH(sl_fix_true) * 2/3)), REPEAT('*', FLOOR(LENGTH(sl_fix_true) * 1/3))) END;
-- sl_fix_cf (org_name)
UPDATE dwd_nbkz_prod_cunt_df_ytai SET sl_fix_cf = CASE WHEN LENGTH(sl_fix_cf) <= 5 THEN CONCAT(SUBSTR(sl_fix_cf, 1, 3), REPEAT('*', LENGTH(sl_fix_cf) - 3)) ELSE CONCAT(SUBSTR(sl_fix_cf, 1, CEIL(LENGTH(sl_fix_cf) * 2/3)), REPEAT('*', FLOOR(LENGTH(sl_fix_cf) * 1/3))) END;

-- 表: dwd_sdyt_fee_list_d_opt
-- fixmedins_code (org_name)
UPDATE dwd_sdyt_fee_list_d_opt SET fixmedins_code = CASE WHEN LENGTH(fixmedins_code) <= 5 THEN CONCAT(SUBSTR(fixmedins_code, 1, 3), REPEAT('*', LENGTH(fixmedins_code) - 3)) ELSE CONCAT(SUBSTR(fixmedins_code, 1, CEIL(LENGTH(fixmedins_code) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_code) * 1/3))) END;
-- fixmedins_name (person_name)
UPDATE dwd_sdyt_fee_list_d_opt SET fixmedins_name = CASE WHEN LENGTH(fixmedins_name) <= 2 THEN CONCAT(SUBSTR(fixmedins_name, 1, 1), '*') WHEN LENGTH(fixmedins_name) <= 4 THEN CONCAT(SUBSTR(fixmedins_name, 1, 2), '*') ELSE CONCAT(SUBSTR(fixmedins_name, 1, CEIL(LENGTH(fixmedins_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_name) * 1/3))) END;
-- med_chrgitm_type_name (person_name)
UPDATE dwd_sdyt_fee_list_d_opt SET med_chrgitm_type_name = CASE WHEN LENGTH(med_chrgitm_type_name) <= 2 THEN CONCAT(SUBSTR(med_chrgitm_type_name, 1, 1), '*') WHEN LENGTH(med_chrgitm_type_name) <= 4 THEN CONCAT(SUBSTR(med_chrgitm_type_name, 1, 2), '*') ELSE CONCAT(SUBSTR(med_chrgitm_type_name, 1, CEIL(LENGTH(med_chrgitm_type_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(med_chrgitm_type_name) * 1/3))) END;

-- 表: dwd_ydjy_outmed_setl_d_grp_time_df_ytai
-- fixmedins_code (org_name)
UPDATE dwd_ydjy_outmed_setl_d_grp_time_df_ytai SET fixmedins_code = CASE WHEN LENGTH(fixmedins_code) <= 5 THEN CONCAT(SUBSTR(fixmedins_code, 1, 3), REPEAT('*', LENGTH(fixmedins_code) - 3)) ELSE CONCAT(SUBSTR(fixmedins_code, 1, CEIL(LENGTH(fixmedins_code) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_code) * 1/3))) END;
-- fixmedins_name (person_name)
UPDATE dwd_ydjy_outmed_setl_d_grp_time_df_ytai SET fixmedins_name = CASE WHEN LENGTH(fixmedins_name) <= 2 THEN CONCAT(SUBSTR(fixmedins_name, 1, 1), '*') WHEN LENGTH(fixmedins_name) <= 4 THEN CONCAT(SUBSTR(fixmedins_name, 1, 2), '*') ELSE CONCAT(SUBSTR(fixmedins_name, 1, CEIL(LENGTH(fixmedins_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_name) * 1/3))) END;
-- fix_blng_admdvs_name (person_name)
UPDATE dwd_ydjy_outmed_setl_d_grp_time_df_ytai SET fix_blng_admdvs_name = CASE WHEN LENGTH(fix_blng_admdvs_name) <= 2 THEN CONCAT(SUBSTR(fix_blng_admdvs_name, 1, 1), '*') WHEN LENGTH(fix_blng_admdvs_name) <= 4 THEN CONCAT(SUBSTR(fix_blng_admdvs_name, 1, 2), '*') ELSE CONCAT(SUBSTR(fix_blng_admdvs_name, 1, CEIL(LENGTH(fix_blng_admdvs_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(fix_blng_admdvs_name) * 1/3))) END;
-- admdvs_name (person_name)
UPDATE dwd_ydjy_outmed_setl_d_grp_time_df_ytai SET admdvs_name = CASE WHEN LENGTH(admdvs_name) <= 2 THEN CONCAT(SUBSTR(admdvs_name, 1, 1), '*') WHEN LENGTH(admdvs_name) <= 4 THEN CONCAT(SUBSTR(admdvs_name, 1, 2), '*') ELSE CONCAT(SUBSTR(admdvs_name, 1, CEIL(LENGTH(admdvs_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(admdvs_name) * 1/3))) END;
-- admdvs_city_name (person_name)
UPDATE dwd_ydjy_outmed_setl_d_grp_time_df_ytai SET admdvs_city_name = CASE WHEN LENGTH(admdvs_city_name) <= 2 THEN CONCAT(SUBSTR(admdvs_city_name, 1, 1), '*') WHEN LENGTH(admdvs_city_name) <= 4 THEN CONCAT(SUBSTR(admdvs_city_name, 1, 2), '*') ELSE CONCAT(SUBSTR(admdvs_city_name, 1, CEIL(LENGTH(admdvs_city_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(admdvs_city_name) * 1/3))) END;
-- admdvs_province_name (person_name)
UPDATE dwd_ydjy_outmed_setl_d_grp_time_df_ytai SET admdvs_province_name = CASE WHEN LENGTH(admdvs_province_name) <= 2 THEN CONCAT(SUBSTR(admdvs_province_name, 1, 1), '*') WHEN LENGTH(admdvs_province_name) <= 4 THEN CONCAT(SUBSTR(admdvs_province_name, 1, 2), '*') ELSE CONCAT(SUBSTR(admdvs_province_name, 1, CEIL(LENGTH(admdvs_province_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(admdvs_province_name) * 1/3))) END;

-- 表: dwd_ydjy_setl_d_mi_ytai
-- insu_admdvs_name (person_name)
UPDATE dwd_ydjy_setl_d_mi_ytai SET insu_admdvs_name = CASE WHEN LENGTH(insu_admdvs_name) <= 2 THEN CONCAT(SUBSTR(insu_admdvs_name, 1, 1), '*') WHEN LENGTH(insu_admdvs_name) <= 4 THEN CONCAT(SUBSTR(insu_admdvs_name, 1, 2), '*') ELSE CONCAT(SUBSTR(insu_admdvs_name, 1, CEIL(LENGTH(insu_admdvs_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(insu_admdvs_name) * 1/3))) END;
-- fix_blng_admdvs_name (person_name)
UPDATE dwd_ydjy_setl_d_mi_ytai SET fix_blng_admdvs_name = CASE WHEN LENGTH(fix_blng_admdvs_name) <= 2 THEN CONCAT(SUBSTR(fix_blng_admdvs_name, 1, 1), '*') WHEN LENGTH(fix_blng_admdvs_name) <= 4 THEN CONCAT(SUBSTR(fix_blng_admdvs_name, 1, 2), '*') ELSE CONCAT(SUBSTR(fix_blng_admdvs_name, 1, CEIL(LENGTH(fix_blng_admdvs_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(fix_blng_admdvs_name) * 1/3))) END;
-- fix_blng_admdvs_city_name (person_name)
UPDATE dwd_ydjy_setl_d_mi_ytai SET fix_blng_admdvs_city_name = CASE WHEN LENGTH(fix_blng_admdvs_city_name) <= 2 THEN CONCAT(SUBSTR(fix_blng_admdvs_city_name, 1, 1), '*') WHEN LENGTH(fix_blng_admdvs_city_name) <= 4 THEN CONCAT(SUBSTR(fix_blng_admdvs_city_name, 1, 2), '*') ELSE CONCAT(SUBSTR(fix_blng_admdvs_city_name, 1, CEIL(LENGTH(fix_blng_admdvs_city_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(fix_blng_admdvs_city_name) * 1/3))) END;
-- fix_blng_province_name (person_name)
UPDATE dwd_ydjy_setl_d_mi_ytai SET fix_blng_province_name = CASE WHEN LENGTH(fix_blng_province_name) <= 2 THEN CONCAT(SUBSTR(fix_blng_province_name, 1, 1), '*') WHEN LENGTH(fix_blng_province_name) <= 4 THEN CONCAT(SUBSTR(fix_blng_province_name, 1, 2), '*') ELSE CONCAT(SUBSTR(fix_blng_province_name, 1, CEIL(LENGTH(fix_blng_province_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(fix_blng_province_name) * 1/3))) END;
-- fixmedins_name (person_name)
UPDATE dwd_ydjy_setl_d_mi_ytai SET fixmedins_name = CASE WHEN LENGTH(fixmedins_name) <= 2 THEN CONCAT(SUBSTR(fixmedins_name, 1, 1), '*') WHEN LENGTH(fixmedins_name) <= 4 THEN CONCAT(SUBSTR(fixmedins_name, 1, 2), '*') ELSE CONCAT(SUBSTR(fixmedins_name, 1, CEIL(LENGTH(fixmedins_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_name) * 1/3))) END;

-- 表: dwd_znjg_bffact_warn_call_d_df_ytai
-- admdvs_name (person_name)
UPDATE dwd_znjg_bffact_warn_call_d_df_ytai SET admdvs_name = CASE WHEN LENGTH(admdvs_name) <= 2 THEN CONCAT(SUBSTR(admdvs_name, 1, 1), '*') WHEN LENGTH(admdvs_name) <= 4 THEN CONCAT(SUBSTR(admdvs_name, 1, 2), '*') ELSE CONCAT(SUBSTR(admdvs_name, 1, CEIL(LENGTH(admdvs_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(admdvs_name) * 1/3))) END;
-- medins_type (org_name)
UPDATE dwd_znjg_bffact_warn_call_d_df_ytai SET medins_type = CASE WHEN LENGTH(medins_type) <= 5 THEN CONCAT(SUBSTR(medins_type, 1, 3), REPEAT('*', LENGTH(medins_type) - 3)) ELSE CONCAT(SUBSTR(medins_type, 1, CEIL(LENGTH(medins_type) * 2/3)), REPEAT('*', FLOOR(LENGTH(medins_type) * 1/3))) END;
-- medins_lv (org_name)
UPDATE dwd_znjg_bffact_warn_call_d_df_ytai SET medins_lv = CASE WHEN LENGTH(medins_lv) <= 5 THEN CONCAT(SUBSTR(medins_lv, 1, 3), REPEAT('*', LENGTH(medins_lv) - 3)) ELSE CONCAT(SUBSTR(medins_lv, 1, CEIL(LENGTH(medins_lv) * 2/3)), REPEAT('*', FLOOR(LENGTH(medins_lv) * 1/3))) END;
-- medins_name (person_name)
UPDATE dwd_znjg_bffact_warn_call_d_df_ytai SET medins_name = CASE WHEN LENGTH(medins_name) <= 2 THEN CONCAT(SUBSTR(medins_name, 1, 1), '*') WHEN LENGTH(medins_name) <= 4 THEN CONCAT(SUBSTR(medins_name, 1, 2), '*') ELSE CONCAT(SUBSTR(medins_name, 1, CEIL(LENGTH(medins_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(medins_name) * 1/3))) END;

-- 表: dws_cbjf_fund_rsdt_revenue_mi_ytai
-- COTY_NAME (person_name)
UPDATE dws_cbjf_fund_rsdt_revenue_mi_ytai SET COTY_NAME = CASE WHEN LENGTH(COTY_NAME) <= 2 THEN CONCAT(SUBSTR(COTY_NAME, 1, 1), '*') WHEN LENGTH(COTY_NAME) <= 4 THEN CONCAT(SUBSTR(COTY_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(COTY_NAME, 1, CEIL(LENGTH(COTY_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(COTY_NAME) * 1/3))) END;

-- 表: dws_cbjf_fund_staf_revenue_mi_ytai
-- EMP_CLCT_AMT (org_name)
UPDATE dws_cbjf_fund_staf_revenue_mi_ytai SET EMP_CLCT_AMT = CASE WHEN LENGTH(EMP_CLCT_AMT) <= 5 THEN CONCAT(SUBSTR(EMP_CLCT_AMT, 1, 3), REPEAT('*', LENGTH(EMP_CLCT_AMT) - 3)) ELSE CONCAT(SUBSTR(EMP_CLCT_AMT, 1, CEIL(LENGTH(EMP_CLCT_AMT) * 2/3)), REPEAT('*', FLOOR(LENGTH(EMP_CLCT_AMT) * 1/3))) END;
-- EMP_CLCT_AMT_CR (org_name)
UPDATE dws_cbjf_fund_staf_revenue_mi_ytai SET EMP_CLCT_AMT_CR = CASE WHEN LENGTH(EMP_CLCT_AMT_CR) <= 5 THEN CONCAT(SUBSTR(EMP_CLCT_AMT_CR, 1, 3), REPEAT('*', LENGTH(EMP_CLCT_AMT_CR) - 3)) ELSE CONCAT(SUBSTR(EMP_CLCT_AMT_CR, 1, CEIL(LENGTH(EMP_CLCT_AMT_CR) * 2/3)), REPEAT('*', FLOOR(LENGTH(EMP_CLCT_AMT_CR) * 1/3))) END;
-- EMP_CLCT_AMT_SR (org_name)
UPDATE dws_cbjf_fund_staf_revenue_mi_ytai SET EMP_CLCT_AMT_SR = CASE WHEN LENGTH(EMP_CLCT_AMT_SR) <= 5 THEN CONCAT(SUBSTR(EMP_CLCT_AMT_SR, 1, 3), REPEAT('*', LENGTH(EMP_CLCT_AMT_SR) - 3)) ELSE CONCAT(SUBSTR(EMP_CLCT_AMT_SR, 1, CEIL(LENGTH(EMP_CLCT_AMT_SR) * 2/3)), REPEAT('*', FLOOR(LENGTH(EMP_CLCT_AMT_SR) * 1/3))) END;
-- COTY_NAME (person_name)
UPDATE dws_cbjf_fund_staf_revenue_mi_ytai SET COTY_NAME = CASE WHEN LENGTH(COTY_NAME) <= 2 THEN CONCAT(SUBSTR(COTY_NAME, 1, 1), '*') WHEN LENGTH(COTY_NAME) <= 4 THEN CONCAT(SUBSTR(COTY_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(COTY_NAME, 1, CEIL(LENGTH(COTY_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(COTY_NAME) * 1/3))) END;
-- PSN_TYPE_NAME (person_name)
UPDATE dws_cbjf_fund_staf_revenue_mi_ytai SET PSN_TYPE_NAME = CASE WHEN LENGTH(PSN_TYPE_NAME) <= 2 THEN CONCAT(SUBSTR(PSN_TYPE_NAME, 1, 1), '*') WHEN LENGTH(PSN_TYPE_NAME) <= 4 THEN CONCAT(SUBSTR(PSN_TYPE_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(PSN_TYPE_NAME, 1, CEIL(LENGTH(PSN_TYPE_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(PSN_TYPE_NAME) * 1/3))) END;

-- 表: dws_cbjf_insu_info_ext_mi_ytai
-- coty_name (person_name)
UPDATE dws_cbjf_insu_info_ext_mi_ytai SET coty_name = CASE WHEN LENGTH(coty_name) <= 2 THEN CONCAT(SUBSTR(coty_name, 1, 1), '*') WHEN LENGTH(coty_name) <= 4 THEN CONCAT(SUBSTR(coty_name, 1, 2), '*') ELSE CONCAT(SUBSTR(coty_name, 1, CEIL(LENGTH(coty_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(coty_name) * 1/3))) END;

-- 表: dws_cbjf_psn_insu_mi_ytai
-- emp_cnt (org_name)
UPDATE dws_cbjf_psn_insu_mi_ytai SET emp_cnt = CASE WHEN LENGTH(emp_cnt) <= 5 THEN CONCAT(SUBSTR(emp_cnt, 1, 3), REPEAT('*', LENGTH(emp_cnt) - 3)) ELSE CONCAT(SUBSTR(emp_cnt, 1, CEIL(LENGTH(emp_cnt) * 2/3)), REPEAT('*', FLOOR(LENGTH(emp_cnt) * 1/3))) END;
-- emp_cnt_cr (org_name)
UPDATE dws_cbjf_psn_insu_mi_ytai SET emp_cnt_cr = CASE WHEN LENGTH(emp_cnt_cr) <= 5 THEN CONCAT(SUBSTR(emp_cnt_cr, 1, 3), REPEAT('*', LENGTH(emp_cnt_cr) - 3)) ELSE CONCAT(SUBSTR(emp_cnt_cr, 1, CEIL(LENGTH(emp_cnt_cr) * 2/3)), REPEAT('*', FLOOR(LENGTH(emp_cnt_cr) * 1/3))) END;
-- emp_cnt_sr (org_name)
UPDATE dws_cbjf_psn_insu_mi_ytai SET emp_cnt_sr = CASE WHEN LENGTH(emp_cnt_sr) <= 5 THEN CONCAT(SUBSTR(emp_cnt_sr, 1, 3), REPEAT('*', LENGTH(emp_cnt_sr) - 3)) ELSE CONCAT(SUBSTR(emp_cnt_sr, 1, CEIL(LENGTH(emp_cnt_sr) * 2/3)), REPEAT('*', FLOOR(LENGTH(emp_cnt_sr) * 1/3))) END;
-- COTY_NAME (person_name)
UPDATE dws_cbjf_psn_insu_mi_ytai SET COTY_NAME = CASE WHEN LENGTH(COTY_NAME) <= 2 THEN CONCAT(SUBSTR(COTY_NAME, 1, 1), '*') WHEN LENGTH(COTY_NAME) <= 4 THEN CONCAT(SUBSTR(COTY_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(COTY_NAME, 1, CEIL(LENGTH(COTY_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(COTY_NAME) * 1/3))) END;

-- 表: dws_cbkm_psn_count_mi_ytai
-- coty_name (person_name)
UPDATE dws_cbkm_psn_count_mi_ytai SET coty_name = CASE WHEN LENGTH(coty_name) <= 2 THEN CONCAT(SUBSTR(coty_name, 1, 1), '*') WHEN LENGTH(coty_name) <= 4 THEN CONCAT(SUBSTR(coty_name, 1, 2), '*') ELSE CONCAT(SUBSTR(coty_name, 1, CEIL(LENGTH(coty_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(coty_name) * 1/3))) END;

-- 表: dws_fee_list_d_med_type_yt
-- medins_list_name (person_name)
UPDATE dws_fee_list_d_med_type_yt SET medins_list_name = CASE WHEN LENGTH(medins_list_name) <= 2 THEN CONCAT(SUBSTR(medins_list_name, 1, 1), '*') WHEN LENGTH(medins_list_name) <= 4 THEN CONCAT(SUBSTR(medins_list_name, 1, 2), '*') ELSE CONCAT(SUBSTR(medins_list_name, 1, CEIL(LENGTH(medins_list_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(medins_list_name) * 1/3))) END;

-- 表: dws_jgxx_fixmedins_setl_fcm_df_ytai
-- fixmedins_code (org_name)
UPDATE dws_jgxx_fixmedins_setl_fcm_df_ytai SET fixmedins_code = CASE WHEN LENGTH(fixmedins_code) <= 5 THEN CONCAT(SUBSTR(fixmedins_code, 1, 3), REPEAT('*', LENGTH(fixmedins_code) - 3)) ELSE CONCAT(SUBSTR(fixmedins_code, 1, CEIL(LENGTH(fixmedins_code) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_code) * 1/3))) END;
-- fixmedins_name (person_name)
UPDATE dws_jgxx_fixmedins_setl_fcm_df_ytai SET fixmedins_name = CASE WHEN LENGTH(fixmedins_name) <= 2 THEN CONCAT(SUBSTR(fixmedins_name, 1, 1), '*') WHEN LENGTH(fixmedins_name) <= 4 THEN CONCAT(SUBSTR(fixmedins_name, 1, 2), '*') ELSE CONCAT(SUBSTR(fixmedins_name, 1, CEIL(LENGTH(fixmedins_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_name) * 1/3))) END;
-- fixmedins_type (org_name)
UPDATE dws_jgxx_fixmedins_setl_fcm_df_ytai SET fixmedins_type = CASE WHEN LENGTH(fixmedins_type) <= 5 THEN CONCAT(SUBSTR(fixmedins_type, 1, 3), REPEAT('*', LENGTH(fixmedins_type) - 3)) ELSE CONCAT(SUBSTR(fixmedins_type, 1, CEIL(LENGTH(fixmedins_type) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_type) * 1/3))) END;
-- fixmedins_type_desc (org_name)
UPDATE dws_jgxx_fixmedins_setl_fcm_df_ytai SET fixmedins_type_desc = CASE WHEN LENGTH(fixmedins_type_desc) <= 5 THEN CONCAT(SUBSTR(fixmedins_type_desc, 1, 3), REPEAT('*', LENGTH(fixmedins_type_desc) - 3)) ELSE CONCAT(SUBSTR(fixmedins_type_desc, 1, CEIL(LENGTH(fixmedins_type_desc) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_type_desc) * 1/3))) END;
-- medins_lv (org_name)
UPDATE dws_jgxx_fixmedins_setl_fcm_df_ytai SET medins_lv = CASE WHEN LENGTH(medins_lv) <= 5 THEN CONCAT(SUBSTR(medins_lv, 1, 3), REPEAT('*', LENGTH(medins_lv) - 3)) ELSE CONCAT(SUBSTR(medins_lv, 1, CEIL(LENGTH(medins_lv) * 2/3)), REPEAT('*', FLOOR(LENGTH(medins_lv) * 1/3))) END;
-- medins_lv_desc (org_name)
UPDATE dws_jgxx_fixmedins_setl_fcm_df_ytai SET medins_lv_desc = CASE WHEN LENGTH(medins_lv_desc) <= 5 THEN CONCAT(SUBSTR(medins_lv_desc, 1, 3), REPEAT('*', LENGTH(medins_lv_desc) - 3)) ELSE CONCAT(SUBSTR(medins_lv_desc, 1, CEIL(LENGTH(medins_lv_desc) * 2/3)), REPEAT('*', FLOOR(LENGTH(medins_lv_desc) * 1/3))) END;
-- dedc_hosp_lv (org_name)
UPDATE dws_jgxx_fixmedins_setl_fcm_df_ytai SET dedc_hosp_lv = CASE WHEN LENGTH(dedc_hosp_lv) <= 5 THEN CONCAT(SUBSTR(dedc_hosp_lv, 1, 3), REPEAT('*', LENGTH(dedc_hosp_lv) - 3)) ELSE CONCAT(SUBSTR(dedc_hosp_lv, 1, CEIL(LENGTH(dedc_hosp_lv) * 2/3)), REPEAT('*', FLOOR(LENGTH(dedc_hosp_lv) * 1/3))) END;
-- lmtpric_hosp_lv (org_name)
UPDATE dws_jgxx_fixmedins_setl_fcm_df_ytai SET lmtpric_hosp_lv = CASE WHEN LENGTH(lmtpric_hosp_lv) <= 5 THEN CONCAT(SUBSTR(lmtpric_hosp_lv, 1, 3), REPEAT('*', LENGTH(lmtpric_hosp_lv) - 3)) ELSE CONCAT(SUBSTR(lmtpric_hosp_lv, 1, CEIL(LENGTH(lmtpric_hosp_lv) * 2/3)), REPEAT('*', FLOOR(LENGTH(lmtpric_hosp_lv) * 1/3))) END;
-- addr (org_name)
UPDATE dws_jgxx_fixmedins_setl_fcm_df_ytai SET addr = CASE WHEN LENGTH(addr) <= 5 THEN CONCAT(SUBSTR(addr, 1, 3), REPEAT('*', LENGTH(addr) - 3)) ELSE CONCAT(SUBSTR(addr, 1, CEIL(LENGTH(addr) * 2/3)), REPEAT('*', FLOOR(LENGTH(addr) * 1/3))) END;
-- tel (phone)
UPDATE dws_jgxx_fixmedins_setl_fcm_df_ytai SET tel = CASE WHEN LENGTH(tel) <= 8 THEN CONCAT(SUBSTR(tel, 1, 5), REPEAT('*', LENGTH(tel) - 5)) ELSE CONCAT(SUBSTR(tel, 1, CEIL(LENGTH(tel) * 2/3)), REPEAT('*', FLOOR(LENGTH(tel) * 1/3))) END;
-- coner_name (person_name)
UPDATE dws_jgxx_fixmedins_setl_fcm_df_ytai SET coner_name = CASE WHEN LENGTH(coner_name) <= 2 THEN CONCAT(SUBSTR(coner_name, 1, 1), '*') WHEN LENGTH(coner_name) <= 4 THEN CONCAT(SUBSTR(coner_name, 1, 2), '*') ELSE CONCAT(SUBSTR(coner_name, 1, CEIL(LENGTH(coner_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(coner_name) * 1/3))) END;
-- poolarea (org_name)
UPDATE dws_jgxx_fixmedins_setl_fcm_df_ytai SET poolarea = CASE WHEN LENGTH(poolarea) <= 5 THEN CONCAT(SUBSTR(poolarea, 1, 3), REPEAT('*', LENGTH(poolarea) - 3)) ELSE CONCAT(SUBSTR(poolarea, 1, CEIL(LENGTH(poolarea) * 2/3)), REPEAT('*', FLOOR(LENGTH(poolarea) * 1/3))) END;
-- out_fixmedins_type (org_name)
UPDATE dws_jgxx_fixmedins_setl_fcm_df_ytai SET out_fixmedins_type = CASE WHEN LENGTH(out_fixmedins_type) <= 5 THEN CONCAT(SUBSTR(out_fixmedins_type, 1, 3), REPEAT('*', LENGTH(out_fixmedins_type) - 3)) ELSE CONCAT(SUBSTR(out_fixmedins_type, 1, CEIL(LENGTH(out_fixmedins_type) * 2/3)), REPEAT('*', FLOOR(LENGTH(out_fixmedins_type) * 1/3))) END;
-- medins_natu (org_name)
UPDATE dws_jgxx_fixmedins_setl_fcm_df_ytai SET medins_natu = CASE WHEN LENGTH(medins_natu) <= 5 THEN CONCAT(SUBSTR(medins_natu, 1, 3), REPEAT('*', LENGTH(medins_natu) - 3)) ELSE CONCAT(SUBSTR(medins_natu, 1, CEIL(LENGTH(medins_natu) * 2/3)), REPEAT('*', FLOOR(LENGTH(medins_natu) * 1/3))) END;
-- medins_natu_desc (org_name)
UPDATE dws_jgxx_fixmedins_setl_fcm_df_ytai SET medins_natu_desc = CASE WHEN LENGTH(medins_natu_desc) <= 5 THEN CONCAT(SUBSTR(medins_natu_desc, 1, 3), REPEAT('*', LENGTH(medins_natu_desc) - 3)) ELSE CONCAT(SUBSTR(medins_natu_desc, 1, CEIL(LENGTH(medins_natu_desc) * 2/3)), REPEAT('*', FLOOR(LENGTH(medins_natu_desc) * 1/3))) END;
-- dw_tab_name (person_name)
UPDATE dws_jgxx_fixmedins_setl_fcm_df_ytai SET dw_tab_name = CASE WHEN LENGTH(dw_tab_name) <= 2 THEN CONCAT(SUBSTR(dw_tab_name, 1, 1), '*') WHEN LENGTH(dw_tab_name) <= 4 THEN CONCAT(SUBSTR(dw_tab_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dw_tab_name, 1, CEIL(LENGTH(dw_tab_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dw_tab_name) * 1/3))) END;

-- 表: dws_jjsz_fee_list_d_pay_mi_ytai
-- fixmedins_name (person_name)
UPDATE dws_jjsz_fee_list_d_pay_mi_ytai SET fixmedins_name = CASE WHEN LENGTH(fixmedins_name) <= 2 THEN CONCAT(SUBSTR(fixmedins_name, 1, 1), '*') WHEN LENGTH(fixmedins_name) <= 4 THEN CONCAT(SUBSTR(fixmedins_name, 1, 2), '*') ELSE CONCAT(SUBSTR(fixmedins_name, 1, CEIL(LENGTH(fixmedins_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_name) * 1/3))) END;

-- 表: dws_jjsz_fee_list_med_type_mi_ytai
-- medins_list_name (person_name)
UPDATE dws_jjsz_fee_list_med_type_mi_ytai SET medins_list_name = CASE WHEN LENGTH(medins_list_name) <= 2 THEN CONCAT(SUBSTR(medins_list_name, 1, 1), '*') WHEN LENGTH(medins_list_name) <= 4 THEN CONCAT(SUBSTR(medins_list_name, 1, 2), '*') ELSE CONCAT(SUBSTR(medins_list_name, 1, CEIL(LENGTH(medins_list_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(medins_list_name) * 1/3))) END;

-- 表: dws_jjsz_fund_pay_mi_ytai
-- fixmedins_cnt (org_name)
UPDATE dws_jjsz_fund_pay_mi_ytai SET fixmedins_cnt = CASE WHEN LENGTH(fixmedins_cnt) <= 5 THEN CONCAT(SUBSTR(fixmedins_cnt, 1, 3), REPEAT('*', LENGTH(fixmedins_cnt) - 3)) ELSE CONCAT(SUBSTR(fixmedins_cnt, 1, CEIL(LENGTH(fixmedins_cnt) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_cnt) * 1/3))) END;
-- coty_name (person_name)
UPDATE dws_jjsz_fund_pay_mi_ytai SET coty_name = CASE WHEN LENGTH(coty_name) <= 2 THEN CONCAT(SUBSTR(coty_name, 1, 1), '*') WHEN LENGTH(coty_name) <= 4 THEN CONCAT(SUBSTR(coty_name, 1, 2), '*') ELSE CONCAT(SUBSTR(coty_name, 1, CEIL(LENGTH(coty_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(coty_name) * 1/3))) END;

-- 表: dws_jjsz_fund_pay_rsdt_year_mi_ytai
-- fixmedins_cnt (org_name)
UPDATE dws_jjsz_fund_pay_rsdt_year_mi_ytai SET fixmedins_cnt = CASE WHEN LENGTH(fixmedins_cnt) <= 5 THEN CONCAT(SUBSTR(fixmedins_cnt, 1, 3), REPEAT('*', LENGTH(fixmedins_cnt) - 3)) ELSE CONCAT(SUBSTR(fixmedins_cnt, 1, CEIL(LENGTH(fixmedins_cnt) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_cnt) * 1/3))) END;
-- coty_name (person_name)
UPDATE dws_jjsz_fund_pay_rsdt_year_mi_ytai SET coty_name = CASE WHEN LENGTH(coty_name) <= 2 THEN CONCAT(SUBSTR(coty_name, 1, 1), '*') WHEN LENGTH(coty_name) <= 4 THEN CONCAT(SUBSTR(coty_name, 1, 2), '*') ELSE CONCAT(SUBSTR(coty_name, 1, CEIL(LENGTH(coty_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(coty_name) * 1/3))) END;

-- 表: dws_jjsz_hosp_rank_pay_mi_ytai
-- fixmedins_name (person_name)
UPDATE dws_jjsz_hosp_rank_pay_mi_ytai SET fixmedins_name = CASE WHEN LENGTH(fixmedins_name) <= 2 THEN CONCAT(SUBSTR(fixmedins_name, 1, 1), '*') WHEN LENGTH(fixmedins_name) <= 4 THEN CONCAT(SUBSTR(fixmedins_name, 1, 2), '*') ELSE CONCAT(SUBSTR(fixmedins_name, 1, CEIL(LENGTH(fixmedins_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_name) * 1/3))) END;

-- 表: fee_list_d_day
-- fixmedins_name (person_name)
UPDATE fee_list_d_day SET fixmedins_name = CASE WHEN LENGTH(fixmedins_name) <= 2 THEN CONCAT(SUBSTR(fixmedins_name, 1, 1), '*') WHEN LENGTH(fixmedins_name) <= 4 THEN CONCAT(SUBSTR(fixmedins_name, 1, 2), '*') ELSE CONCAT(SUBSTR(fixmedins_name, 1, CEIL(LENGTH(fixmedins_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_name) * 1/3))) END;
-- dise_name (person_name)
UPDATE fee_list_d_day SET dise_name = CASE WHEN LENGTH(dise_name) <= 2 THEN CONCAT(SUBSTR(dise_name, 1, 1), '*') WHEN LENGTH(dise_name) <= 4 THEN CONCAT(SUBSTR(dise_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dise_name, 1, CEIL(LENGTH(dise_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dise_name) * 1/3))) END;
-- hilist_name (person_name)
UPDATE fee_list_d_day SET hilist_name = CASE WHEN LENGTH(hilist_name) <= 2 THEN CONCAT(SUBSTR(hilist_name, 1, 1), '*') WHEN LENGTH(hilist_name) <= 4 THEN CONCAT(SUBSTR(hilist_name, 1, 2), '*') ELSE CONCAT(SUBSTR(hilist_name, 1, CEIL(LENGTH(hilist_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(hilist_name) * 1/3))) END;

-- 表: fee_list_d_inhosp_day
-- fixmedins_name (person_name)
UPDATE fee_list_d_inhosp_day SET fixmedins_name = CASE WHEN LENGTH(fixmedins_name) <= 2 THEN CONCAT(SUBSTR(fixmedins_name, 1, 1), '*') WHEN LENGTH(fixmedins_name) <= 4 THEN CONCAT(SUBSTR(fixmedins_name, 1, 2), '*') ELSE CONCAT(SUBSTR(fixmedins_name, 1, CEIL(LENGTH(fixmedins_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_name) * 1/3))) END;
-- dise_name (person_name)
UPDATE fee_list_d_inhosp_day SET dise_name = CASE WHEN LENGTH(dise_name) <= 2 THEN CONCAT(SUBSTR(dise_name, 1, 1), '*') WHEN LENGTH(dise_name) <= 4 THEN CONCAT(SUBSTR(dise_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dise_name, 1, CEIL(LENGTH(dise_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dise_name) * 1/3))) END;
-- hilist_name (person_name)
UPDATE fee_list_d_inhosp_day SET hilist_name = CASE WHEN LENGTH(hilist_name) <= 2 THEN CONCAT(SUBSTR(hilist_name, 1, 1), '*') WHEN LENGTH(hilist_name) <= 4 THEN CONCAT(SUBSTR(hilist_name, 1, 2), '*') ELSE CONCAT(SUBSTR(hilist_name, 1, CEIL(LENGTH(hilist_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(hilist_name) * 1/3))) END;

-- 表: fixmedins_b
-- FIXMEDINS_CODE (org_name)
UPDATE fixmedins_b SET FIXMEDINS_CODE = CASE WHEN LENGTH(FIXMEDINS_CODE) <= 5 THEN CONCAT(SUBSTR(FIXMEDINS_CODE, 1, 3), REPEAT('*', LENGTH(FIXMEDINS_CODE) - 3)) ELSE CONCAT(SUBSTR(FIXMEDINS_CODE, 1, CEIL(LENGTH(FIXMEDINS_CODE) * 2/3)), REPEAT('*', FLOOR(LENGTH(FIXMEDINS_CODE) * 1/3))) END;
-- MEDINS_MGTCODE (org_name)
UPDATE fixmedins_b SET MEDINS_MGTCODE = CASE WHEN LENGTH(MEDINS_MGTCODE) <= 5 THEN CONCAT(SUBSTR(MEDINS_MGTCODE, 1, 3), REPEAT('*', LENGTH(MEDINS_MGTCODE) - 3)) ELSE CONCAT(SUBSTR(MEDINS_MGTCODE, 1, CEIL(LENGTH(MEDINS_MGTCODE) * 2/3)), REPEAT('*', FLOOR(LENGTH(MEDINS_MGTCODE) * 1/3))) END;
-- ORGCODE (org_name)
UPDATE fixmedins_b SET ORGCODE = CASE WHEN LENGTH(ORGCODE) <= 5 THEN CONCAT(SUBSTR(ORGCODE, 1, 3), REPEAT('*', LENGTH(ORGCODE) - 3)) ELSE CONCAT(SUBSTR(ORGCODE, 1, CEIL(LENGTH(ORGCODE) * 2/3)), REPEAT('*', FLOOR(LENGTH(ORGCODE) * 1/3))) END;
-- FIXMEDINS_NAME (person_name)
UPDATE fixmedins_b SET FIXMEDINS_NAME = CASE WHEN LENGTH(FIXMEDINS_NAME) <= 2 THEN CONCAT(SUBSTR(FIXMEDINS_NAME, 1, 1), '*') WHEN LENGTH(FIXMEDINS_NAME) <= 4 THEN CONCAT(SUBSTR(FIXMEDINS_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(FIXMEDINS_NAME, 1, CEIL(LENGTH(FIXMEDINS_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(FIXMEDINS_NAME) * 1/3))) END;
-- FIXMEDINS_TYPE (org_name)
UPDATE fixmedins_b SET FIXMEDINS_TYPE = CASE WHEN LENGTH(FIXMEDINS_TYPE) <= 5 THEN CONCAT(SUBSTR(FIXMEDINS_TYPE, 1, 3), REPEAT('*', LENGTH(FIXMEDINS_TYPE) - 3)) ELSE CONCAT(SUBSTR(FIXMEDINS_TYPE, 1, CEIL(LENGTH(FIXMEDINS_TYPE) * 2/3)), REPEAT('*', FLOOR(LENGTH(FIXMEDINS_TYPE) * 1/3))) END;
-- HOSP_LV (org_name)
UPDATE fixmedins_b SET HOSP_LV = CASE WHEN LENGTH(HOSP_LV) <= 5 THEN CONCAT(SUBSTR(HOSP_LV, 1, 3), REPEAT('*', LENGTH(HOSP_LV) - 3)) ELSE CONCAT(SUBSTR(HOSP_LV, 1, CEIL(LENGTH(HOSP_LV) * 2/3)), REPEAT('*', FLOOR(LENGTH(HOSP_LV) * 1/3))) END;
-- LMTPRIC_HOSP_LV (org_name)
UPDATE fixmedins_b SET LMTPRIC_HOSP_LV = CASE WHEN LENGTH(LMTPRIC_HOSP_LV) <= 5 THEN CONCAT(SUBSTR(LMTPRIC_HOSP_LV, 1, 3), REPEAT('*', LENGTH(LMTPRIC_HOSP_LV) - 3)) ELSE CONCAT(SUBSTR(LMTPRIC_HOSP_LV, 1, CEIL(LENGTH(LMTPRIC_HOSP_LV) * 2/3)), REPEAT('*', FLOOR(LENGTH(LMTPRIC_HOSP_LV) * 1/3))) END;
-- DEDC_HOSP_LV (org_name)
UPDATE fixmedins_b SET DEDC_HOSP_LV = CASE WHEN LENGTH(DEDC_HOSP_LV) <= 5 THEN CONCAT(SUBSTR(DEDC_HOSP_LV, 1, 3), REPEAT('*', LENGTH(DEDC_HOSP_LV) - 3)) ELSE CONCAT(SUBSTR(DEDC_HOSP_LV, 1, CEIL(LENGTH(DEDC_HOSP_LV) * 2/3)), REPEAT('*', FLOOR(LENGTH(DEDC_HOSP_LV) * 1/3))) END;
-- HI_RESPER_NAME (person_name)
UPDATE fixmedins_b SET HI_RESPER_NAME = CASE WHEN LENGTH(HI_RESPER_NAME) <= 2 THEN CONCAT(SUBSTR(HI_RESPER_NAME, 1, 1), '*') WHEN LENGTH(HI_RESPER_NAME) <= 4 THEN CONCAT(SUBSTR(HI_RESPER_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(HI_RESPER_NAME, 1, CEIL(LENGTH(HI_RESPER_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(HI_RESPER_NAME) * 1/3))) END;
-- HI_RESPER_TEL (phone)
UPDATE fixmedins_b SET HI_RESPER_TEL = CASE WHEN LENGTH(HI_RESPER_TEL) <= 8 THEN CONCAT(SUBSTR(HI_RESPER_TEL, 1, 5), REPEAT('*', LENGTH(HI_RESPER_TEL) - 5)) ELSE CONCAT(SUBSTR(HI_RESPER_TEL, 1, CEIL(LENGTH(HI_RESPER_TEL) * 2/3)), REPEAT('*', FLOOR(LENGTH(HI_RESPER_TEL) * 1/3))) END;
-- HI_RESPER_CERTNO (id_card)
UPDATE fixmedins_b SET HI_RESPER_CERTNO = CASE WHEN LENGTH(HI_RESPER_CERTNO) <= 10 THEN CONCAT(SUBSTR(HI_RESPER_CERTNO, 1, 7), REPEAT('*', LENGTH(HI_RESPER_CERTNO) - 7)) ELSE CONCAT(SUBSTR(HI_RESPER_CERTNO, 1, CEIL(LENGTH(HI_RESPER_CERTNO) * 2/3)), REPEAT('*', FLOOR(LENGTH(HI_RESPER_CERTNO) * 1/3))) END;
-- OUT_FIXMEDINS_TYPE (org_name)
UPDATE fixmedins_b SET OUT_FIXMEDINS_TYPE = CASE WHEN LENGTH(OUT_FIXMEDINS_TYPE) <= 5 THEN CONCAT(SUBSTR(OUT_FIXMEDINS_TYPE, 1, 3), REPEAT('*', LENGTH(OUT_FIXMEDINS_TYPE) - 3)) ELSE CONCAT(SUBSTR(OUT_FIXMEDINS_TYPE, 1, CEIL(LENGTH(OUT_FIXMEDINS_TYPE) * 2/3)), REPEAT('*', FLOOR(LENGTH(OUT_FIXMEDINS_TYPE) * 1/3))) END;
-- NAT_PLAF_CODE (org_name)
UPDATE fixmedins_b SET NAT_PLAF_CODE = CASE WHEN LENGTH(NAT_PLAF_CODE) <= 5 THEN CONCAT(SUBSTR(NAT_PLAF_CODE, 1, 3), REPEAT('*', LENGTH(NAT_PLAF_CODE) - 3)) ELSE CONCAT(SUBSTR(NAT_PLAF_CODE, 1, CEIL(LENGTH(NAT_PLAF_CODE) * 2/3)), REPEAT('*', FLOOR(LENGTH(NAT_PLAF_CODE) * 1/3))) END;
-- PROV_PLAF_CODE (org_name)
UPDATE fixmedins_b SET PROV_PLAF_CODE = CASE WHEN LENGTH(PROV_PLAF_CODE) <= 5 THEN CONCAT(SUBSTR(PROV_PLAF_CODE, 1, 3), REPEAT('*', LENGTH(PROV_PLAF_CODE) - 3)) ELSE CONCAT(SUBSTR(PROV_PLAF_CODE, 1, CEIL(LENGTH(PROV_PLAF_CODE) * 2/3)), REPEAT('*', FLOOR(LENGTH(PROV_PLAF_CODE) * 1/3))) END;
-- CRTER_ID (person_name)
UPDATE fixmedins_b SET CRTER_ID = CASE WHEN LENGTH(CRTER_ID) <= 2 THEN CONCAT(SUBSTR(CRTER_ID, 1, 1), '*') WHEN LENGTH(CRTER_ID) <= 4 THEN CONCAT(SUBSTR(CRTER_ID, 1, 2), '*') ELSE CONCAT(SUBSTR(CRTER_ID, 1, CEIL(LENGTH(CRTER_ID) * 2/3)), REPEAT('*', FLOOR(LENGTH(CRTER_ID) * 1/3))) END;
-- CRTER_NAME (person_name)
UPDATE fixmedins_b SET CRTER_NAME = CASE WHEN LENGTH(CRTER_NAME) <= 2 THEN CONCAT(SUBSTR(CRTER_NAME, 1, 1), '*') WHEN LENGTH(CRTER_NAME) <= 4 THEN CONCAT(SUBSTR(CRTER_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(CRTER_NAME, 1, CEIL(LENGTH(CRTER_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(CRTER_NAME) * 1/3))) END;
-- CRTE_OPTINS_NO (org_name)
UPDATE fixmedins_b SET CRTE_OPTINS_NO = CASE WHEN LENGTH(CRTE_OPTINS_NO) <= 5 THEN CONCAT(SUBSTR(CRTE_OPTINS_NO, 1, 3), REPEAT('*', LENGTH(CRTE_OPTINS_NO) - 3)) ELSE CONCAT(SUBSTR(CRTE_OPTINS_NO, 1, CEIL(LENGTH(CRTE_OPTINS_NO) * 2/3)), REPEAT('*', FLOOR(LENGTH(CRTE_OPTINS_NO) * 1/3))) END;
-- OPTER_ID (person_name)
UPDATE fixmedins_b SET OPTER_ID = CASE WHEN LENGTH(OPTER_ID) <= 2 THEN CONCAT(SUBSTR(OPTER_ID, 1, 1), '*') WHEN LENGTH(OPTER_ID) <= 4 THEN CONCAT(SUBSTR(OPTER_ID, 1, 2), '*') ELSE CONCAT(SUBSTR(OPTER_ID, 1, CEIL(LENGTH(OPTER_ID) * 2/3)), REPEAT('*', FLOOR(LENGTH(OPTER_ID) * 1/3))) END;
-- OPTER_NAME (person_name)
UPDATE fixmedins_b SET OPTER_NAME = CASE WHEN LENGTH(OPTER_NAME) <= 2 THEN CONCAT(SUBSTR(OPTER_NAME, 1, 1), '*') WHEN LENGTH(OPTER_NAME) <= 4 THEN CONCAT(SUBSTR(OPTER_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(OPTER_NAME, 1, CEIL(LENGTH(OPTER_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(OPTER_NAME) * 1/3))) END;
-- OPTINS_NO (org_name)
UPDATE fixmedins_b SET OPTINS_NO = CASE WHEN LENGTH(OPTINS_NO) <= 5 THEN CONCAT(SUBSTR(OPTINS_NO, 1, 3), REPEAT('*', LENGTH(OPTINS_NO) - 3)) ELSE CONCAT(SUBSTR(OPTINS_NO, 1, CEIL(LENGTH(OPTINS_NO) * 2/3)), REPEAT('*', FLOOR(LENGTH(OPTINS_NO) * 1/3))) END;

-- 表: fund_analysis_data
-- DATA_NAME (person_name)
UPDATE fund_analysis_data SET DATA_NAME = CASE WHEN LENGTH(DATA_NAME) <= 2 THEN CONCAT(SUBSTR(DATA_NAME, 1, 1), '*') WHEN LENGTH(DATA_NAME) <= 4 THEN CONCAT(SUBSTR(DATA_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(DATA_NAME, 1, CEIL(LENGTH(DATA_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(DATA_NAME) * 1/3))) END;
-- CRTER_ID (person_name)
UPDATE fund_analysis_data SET CRTER_ID = CASE WHEN LENGTH(CRTER_ID) <= 2 THEN CONCAT(SUBSTR(CRTER_ID, 1, 1), '*') WHEN LENGTH(CRTER_ID) <= 4 THEN CONCAT(SUBSTR(CRTER_ID, 1, 2), '*') ELSE CONCAT(SUBSTR(CRTER_ID, 1, CEIL(LENGTH(CRTER_ID) * 2/3)), REPEAT('*', FLOOR(LENGTH(CRTER_ID) * 1/3))) END;
-- CRTER_NAME (person_name)
UPDATE fund_analysis_data SET CRTER_NAME = CASE WHEN LENGTH(CRTER_NAME) <= 2 THEN CONCAT(SUBSTR(CRTER_NAME, 1, 1), '*') WHEN LENGTH(CRTER_NAME) <= 4 THEN CONCAT(SUBSTR(CRTER_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(CRTER_NAME, 1, CEIL(LENGTH(CRTER_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(CRTER_NAME) * 1/3))) END;
-- CRTE_OPTINS_NO (org_name)
UPDATE fund_analysis_data SET CRTE_OPTINS_NO = CASE WHEN LENGTH(CRTE_OPTINS_NO) <= 5 THEN CONCAT(SUBSTR(CRTE_OPTINS_NO, 1, 3), REPEAT('*', LENGTH(CRTE_OPTINS_NO) - 3)) ELSE CONCAT(SUBSTR(CRTE_OPTINS_NO, 1, CEIL(LENGTH(CRTE_OPTINS_NO) * 2/3)), REPEAT('*', FLOOR(LENGTH(CRTE_OPTINS_NO) * 1/3))) END;
-- OPTER_ID (person_name)
UPDATE fund_analysis_data SET OPTER_ID = CASE WHEN LENGTH(OPTER_ID) <= 2 THEN CONCAT(SUBSTR(OPTER_ID, 1, 1), '*') WHEN LENGTH(OPTER_ID) <= 4 THEN CONCAT(SUBSTR(OPTER_ID, 1, 2), '*') ELSE CONCAT(SUBSTR(OPTER_ID, 1, CEIL(LENGTH(OPTER_ID) * 2/3)), REPEAT('*', FLOOR(LENGTH(OPTER_ID) * 1/3))) END;
-- OPTER_NAME (person_name)
UPDATE fund_analysis_data SET OPTER_NAME = CASE WHEN LENGTH(OPTER_NAME) <= 2 THEN CONCAT(SUBSTR(OPTER_NAME, 1, 1), '*') WHEN LENGTH(OPTER_NAME) <= 4 THEN CONCAT(SUBSTR(OPTER_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(OPTER_NAME, 1, CEIL(LENGTH(OPTER_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(OPTER_NAME) * 1/3))) END;
-- OPTINS_NO (org_name)
UPDATE fund_analysis_data SET OPTINS_NO = CASE WHEN LENGTH(OPTINS_NO) <= 5 THEN CONCAT(SUBSTR(OPTINS_NO, 1, 3), REPEAT('*', LENGTH(OPTINS_NO) - 3)) ELSE CONCAT(SUBSTR(OPTINS_NO, 1, CEIL(LENGTH(OPTINS_NO) * 2/3)), REPEAT('*', FLOOR(LENGTH(OPTINS_NO) * 1/3))) END;

-- 表: fund_analysis_data_dic_a
-- NAT_DIC_VAL_NAME (person_name)
UPDATE fund_analysis_data_dic_a SET NAT_DIC_VAL_NAME = CASE WHEN LENGTH(NAT_DIC_VAL_NAME) <= 2 THEN CONCAT(SUBSTR(NAT_DIC_VAL_NAME, 1, 1), '*') WHEN LENGTH(NAT_DIC_VAL_NAME) <= 4 THEN CONCAT(SUBSTR(NAT_DIC_VAL_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(NAT_DIC_VAL_NAME, 1, CEIL(LENGTH(NAT_DIC_VAL_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(NAT_DIC_VAL_NAME) * 1/3))) END;
-- PLACE_DIC_VAL_NAME (person_name)
UPDATE fund_analysis_data_dic_a SET PLACE_DIC_VAL_NAME = CASE WHEN LENGTH(PLACE_DIC_VAL_NAME) <= 2 THEN CONCAT(SUBSTR(PLACE_DIC_VAL_NAME, 1, 1), '*') WHEN LENGTH(PLACE_DIC_VAL_NAME) <= 4 THEN CONCAT(SUBSTR(PLACE_DIC_VAL_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(PLACE_DIC_VAL_NAME, 1, CEIL(LENGTH(PLACE_DIC_VAL_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(PLACE_DIC_VAL_NAME) * 1/3))) END;
-- CRTER_ID (person_name)
UPDATE fund_analysis_data_dic_a SET CRTER_ID = CASE WHEN LENGTH(CRTER_ID) <= 2 THEN CONCAT(SUBSTR(CRTER_ID, 1, 1), '*') WHEN LENGTH(CRTER_ID) <= 4 THEN CONCAT(SUBSTR(CRTER_ID, 1, 2), '*') ELSE CONCAT(SUBSTR(CRTER_ID, 1, CEIL(LENGTH(CRTER_ID) * 2/3)), REPEAT('*', FLOOR(LENGTH(CRTER_ID) * 1/3))) END;
-- CRTER_NAME (person_name)
UPDATE fund_analysis_data_dic_a SET CRTER_NAME = CASE WHEN LENGTH(CRTER_NAME) <= 2 THEN CONCAT(SUBSTR(CRTER_NAME, 1, 1), '*') WHEN LENGTH(CRTER_NAME) <= 4 THEN CONCAT(SUBSTR(CRTER_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(CRTER_NAME, 1, CEIL(LENGTH(CRTER_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(CRTER_NAME) * 1/3))) END;
-- CRTE_OPTINS_NO (org_name)
UPDATE fund_analysis_data_dic_a SET CRTE_OPTINS_NO = CASE WHEN LENGTH(CRTE_OPTINS_NO) <= 5 THEN CONCAT(SUBSTR(CRTE_OPTINS_NO, 1, 3), REPEAT('*', LENGTH(CRTE_OPTINS_NO) - 3)) ELSE CONCAT(SUBSTR(CRTE_OPTINS_NO, 1, CEIL(LENGTH(CRTE_OPTINS_NO) * 2/3)), REPEAT('*', FLOOR(LENGTH(CRTE_OPTINS_NO) * 1/3))) END;
-- OPTER_ID (person_name)
UPDATE fund_analysis_data_dic_a SET OPTER_ID = CASE WHEN LENGTH(OPTER_ID) <= 2 THEN CONCAT(SUBSTR(OPTER_ID, 1, 1), '*') WHEN LENGTH(OPTER_ID) <= 4 THEN CONCAT(SUBSTR(OPTER_ID, 1, 2), '*') ELSE CONCAT(SUBSTR(OPTER_ID, 1, CEIL(LENGTH(OPTER_ID) * 2/3)), REPEAT('*', FLOOR(LENGTH(OPTER_ID) * 1/3))) END;
-- OPTER_NAME (person_name)
UPDATE fund_analysis_data_dic_a SET OPTER_NAME = CASE WHEN LENGTH(OPTER_NAME) <= 2 THEN CONCAT(SUBSTR(OPTER_NAME, 1, 1), '*') WHEN LENGTH(OPTER_NAME) <= 4 THEN CONCAT(SUBSTR(OPTER_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(OPTER_NAME, 1, CEIL(LENGTH(OPTER_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(OPTER_NAME) * 1/3))) END;
-- OPTINS_NO (org_name)
UPDATE fund_analysis_data_dic_a SET OPTINS_NO = CASE WHEN LENGTH(OPTINS_NO) <= 5 THEN CONCAT(SUBSTR(OPTINS_NO, 1, 3), REPEAT('*', LENGTH(OPTINS_NO) - 3)) ELSE CONCAT(SUBSTR(OPTINS_NO, 1, CEIL(LENGTH(OPTINS_NO) * 2/3)), REPEAT('*', FLOOR(LENGTH(OPTINS_NO) * 1/3))) END;

-- 表: fund_analysis_file_d
-- FILE_NAME (person_name)
UPDATE fund_analysis_file_d SET FILE_NAME = CASE WHEN LENGTH(FILE_NAME) <= 2 THEN CONCAT(SUBSTR(FILE_NAME, 1, 1), '*') WHEN LENGTH(FILE_NAME) <= 4 THEN CONCAT(SUBSTR(FILE_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(FILE_NAME, 1, CEIL(LENGTH(FILE_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(FILE_NAME) * 1/3))) END;
-- CRTER_ID (person_name)
UPDATE fund_analysis_file_d SET CRTER_ID = CASE WHEN LENGTH(CRTER_ID) <= 2 THEN CONCAT(SUBSTR(CRTER_ID, 1, 1), '*') WHEN LENGTH(CRTER_ID) <= 4 THEN CONCAT(SUBSTR(CRTER_ID, 1, 2), '*') ELSE CONCAT(SUBSTR(CRTER_ID, 1, CEIL(LENGTH(CRTER_ID) * 2/3)), REPEAT('*', FLOOR(LENGTH(CRTER_ID) * 1/3))) END;
-- CRTER_NAME (person_name)
UPDATE fund_analysis_file_d SET CRTER_NAME = CASE WHEN LENGTH(CRTER_NAME) <= 2 THEN CONCAT(SUBSTR(CRTER_NAME, 1, 1), '*') WHEN LENGTH(CRTER_NAME) <= 4 THEN CONCAT(SUBSTR(CRTER_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(CRTER_NAME, 1, CEIL(LENGTH(CRTER_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(CRTER_NAME) * 1/3))) END;
-- CRTE_OPTINS_NO (org_name)
UPDATE fund_analysis_file_d SET CRTE_OPTINS_NO = CASE WHEN LENGTH(CRTE_OPTINS_NO) <= 5 THEN CONCAT(SUBSTR(CRTE_OPTINS_NO, 1, 3), REPEAT('*', LENGTH(CRTE_OPTINS_NO) - 3)) ELSE CONCAT(SUBSTR(CRTE_OPTINS_NO, 1, CEIL(LENGTH(CRTE_OPTINS_NO) * 2/3)), REPEAT('*', FLOOR(LENGTH(CRTE_OPTINS_NO) * 1/3))) END;
-- OPTER_ID (person_name)
UPDATE fund_analysis_file_d SET OPTER_ID = CASE WHEN LENGTH(OPTER_ID) <= 2 THEN CONCAT(SUBSTR(OPTER_ID, 1, 1), '*') WHEN LENGTH(OPTER_ID) <= 4 THEN CONCAT(SUBSTR(OPTER_ID, 1, 2), '*') ELSE CONCAT(SUBSTR(OPTER_ID, 1, CEIL(LENGTH(OPTER_ID) * 2/3)), REPEAT('*', FLOOR(LENGTH(OPTER_ID) * 1/3))) END;
-- OPTER_NAME (person_name)
UPDATE fund_analysis_file_d SET OPTER_NAME = CASE WHEN LENGTH(OPTER_NAME) <= 2 THEN CONCAT(SUBSTR(OPTER_NAME, 1, 1), '*') WHEN LENGTH(OPTER_NAME) <= 4 THEN CONCAT(SUBSTR(OPTER_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(OPTER_NAME, 1, CEIL(LENGTH(OPTER_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(OPTER_NAME) * 1/3))) END;
-- OPTINS_NO (org_name)
UPDATE fund_analysis_file_d SET OPTINS_NO = CASE WHEN LENGTH(OPTINS_NO) <= 5 THEN CONCAT(SUBSTR(OPTINS_NO, 1, 3), REPEAT('*', LENGTH(OPTINS_NO) - 3)) ELSE CONCAT(SUBSTR(OPTINS_NO, 1, CEIL(LENGTH(OPTINS_NO) * 2/3)), REPEAT('*', FLOOR(LENGTH(OPTINS_NO) * 1/3))) END;
-- FILE_ADDRESS (address)
UPDATE fund_analysis_file_d SET FILE_ADDRESS = CASE WHEN LENGTH(FILE_ADDRESS) <= 10 THEN CONCAT(SUBSTR(FILE_ADDRESS, 1, 7), REPEAT('*', LENGTH(FILE_ADDRESS) - 7)) ELSE CONCAT(SUBSTR(FILE_ADDRESS, 1, CEIL(LENGTH(FILE_ADDRESS) * 2/3)), REPEAT('*', FLOOR(LENGTH(FILE_ADDRESS) * 1/3))) END;

-- 表: fund_analysis_last_file_d
-- FILE_NAME (person_name)
UPDATE fund_analysis_last_file_d SET FILE_NAME = CASE WHEN LENGTH(FILE_NAME) <= 2 THEN CONCAT(SUBSTR(FILE_NAME, 1, 1), '*') WHEN LENGTH(FILE_NAME) <= 4 THEN CONCAT(SUBSTR(FILE_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(FILE_NAME, 1, CEIL(LENGTH(FILE_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(FILE_NAME) * 1/3))) END;
-- FILE_ADDRESS (address)
UPDATE fund_analysis_last_file_d SET FILE_ADDRESS = CASE WHEN LENGTH(FILE_ADDRESS) <= 10 THEN CONCAT(SUBSTR(FILE_ADDRESS, 1, 7), REPEAT('*', LENGTH(FILE_ADDRESS) - 7)) ELSE CONCAT(SUBSTR(FILE_ADDRESS, 1, CEIL(LENGTH(FILE_ADDRESS) * 2/3)), REPEAT('*', FLOOR(LENGTH(FILE_ADDRESS) * 1/3))) END;
-- CRTER_ID (person_name)
UPDATE fund_analysis_last_file_d SET CRTER_ID = CASE WHEN LENGTH(CRTER_ID) <= 2 THEN CONCAT(SUBSTR(CRTER_ID, 1, 1), '*') WHEN LENGTH(CRTER_ID) <= 4 THEN CONCAT(SUBSTR(CRTER_ID, 1, 2), '*') ELSE CONCAT(SUBSTR(CRTER_ID, 1, CEIL(LENGTH(CRTER_ID) * 2/3)), REPEAT('*', FLOOR(LENGTH(CRTER_ID) * 1/3))) END;
-- CRTER_NAME (person_name)
UPDATE fund_analysis_last_file_d SET CRTER_NAME = CASE WHEN LENGTH(CRTER_NAME) <= 2 THEN CONCAT(SUBSTR(CRTER_NAME, 1, 1), '*') WHEN LENGTH(CRTER_NAME) <= 4 THEN CONCAT(SUBSTR(CRTER_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(CRTER_NAME, 1, CEIL(LENGTH(CRTER_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(CRTER_NAME) * 1/3))) END;
-- CRTE_OPTINS_NO (org_name)
UPDATE fund_analysis_last_file_d SET CRTE_OPTINS_NO = CASE WHEN LENGTH(CRTE_OPTINS_NO) <= 5 THEN CONCAT(SUBSTR(CRTE_OPTINS_NO, 1, 3), REPEAT('*', LENGTH(CRTE_OPTINS_NO) - 3)) ELSE CONCAT(SUBSTR(CRTE_OPTINS_NO, 1, CEIL(LENGTH(CRTE_OPTINS_NO) * 2/3)), REPEAT('*', FLOOR(LENGTH(CRTE_OPTINS_NO) * 1/3))) END;
-- OPTER_ID (person_name)
UPDATE fund_analysis_last_file_d SET OPTER_ID = CASE WHEN LENGTH(OPTER_ID) <= 2 THEN CONCAT(SUBSTR(OPTER_ID, 1, 1), '*') WHEN LENGTH(OPTER_ID) <= 4 THEN CONCAT(SUBSTR(OPTER_ID, 1, 2), '*') ELSE CONCAT(SUBSTR(OPTER_ID, 1, CEIL(LENGTH(OPTER_ID) * 2/3)), REPEAT('*', FLOOR(LENGTH(OPTER_ID) * 1/3))) END;
-- OPTER_NAME (person_name)
UPDATE fund_analysis_last_file_d SET OPTER_NAME = CASE WHEN LENGTH(OPTER_NAME) <= 2 THEN CONCAT(SUBSTR(OPTER_NAME, 1, 1), '*') WHEN LENGTH(OPTER_NAME) <= 4 THEN CONCAT(SUBSTR(OPTER_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(OPTER_NAME, 1, CEIL(LENGTH(OPTER_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(OPTER_NAME) * 1/3))) END;
-- OPTINS_NO (org_name)
UPDATE fund_analysis_last_file_d SET OPTINS_NO = CASE WHEN LENGTH(OPTINS_NO) <= 5 THEN CONCAT(SUBSTR(OPTINS_NO, 1, 3), REPEAT('*', LENGTH(OPTINS_NO) - 3)) ELSE CONCAT(SUBSTR(OPTINS_NO, 1, CEIL(LENGTH(OPTINS_NO) * 2/3)), REPEAT('*', FLOOR(LENGTH(OPTINS_NO) * 1/3))) END;

-- 表: fund_analysis_module
-- CRTER_ID (person_name)
UPDATE fund_analysis_module SET CRTER_ID = CASE WHEN LENGTH(CRTER_ID) <= 2 THEN CONCAT(SUBSTR(CRTER_ID, 1, 1), '*') WHEN LENGTH(CRTER_ID) <= 4 THEN CONCAT(SUBSTR(CRTER_ID, 1, 2), '*') ELSE CONCAT(SUBSTR(CRTER_ID, 1, CEIL(LENGTH(CRTER_ID) * 2/3)), REPEAT('*', FLOOR(LENGTH(CRTER_ID) * 1/3))) END;
-- CRTER_NAME (person_name)
UPDATE fund_analysis_module SET CRTER_NAME = CASE WHEN LENGTH(CRTER_NAME) <= 2 THEN CONCAT(SUBSTR(CRTER_NAME, 1, 1), '*') WHEN LENGTH(CRTER_NAME) <= 4 THEN CONCAT(SUBSTR(CRTER_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(CRTER_NAME, 1, CEIL(LENGTH(CRTER_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(CRTER_NAME) * 1/3))) END;
-- CRTE_OPTINS_NO (org_name)
UPDATE fund_analysis_module SET CRTE_OPTINS_NO = CASE WHEN LENGTH(CRTE_OPTINS_NO) <= 5 THEN CONCAT(SUBSTR(CRTE_OPTINS_NO, 1, 3), REPEAT('*', LENGTH(CRTE_OPTINS_NO) - 3)) ELSE CONCAT(SUBSTR(CRTE_OPTINS_NO, 1, CEIL(LENGTH(CRTE_OPTINS_NO) * 2/3)), REPEAT('*', FLOOR(LENGTH(CRTE_OPTINS_NO) * 1/3))) END;
-- OPTER_ID (person_name)
UPDATE fund_analysis_module SET OPTER_ID = CASE WHEN LENGTH(OPTER_ID) <= 2 THEN CONCAT(SUBSTR(OPTER_ID, 1, 1), '*') WHEN LENGTH(OPTER_ID) <= 4 THEN CONCAT(SUBSTR(OPTER_ID, 1, 2), '*') ELSE CONCAT(SUBSTR(OPTER_ID, 1, CEIL(LENGTH(OPTER_ID) * 2/3)), REPEAT('*', FLOOR(LENGTH(OPTER_ID) * 1/3))) END;
-- OPTER_NAME (person_name)
UPDATE fund_analysis_module SET OPTER_NAME = CASE WHEN LENGTH(OPTER_NAME) <= 2 THEN CONCAT(SUBSTR(OPTER_NAME, 1, 1), '*') WHEN LENGTH(OPTER_NAME) <= 4 THEN CONCAT(SUBSTR(OPTER_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(OPTER_NAME, 1, CEIL(LENGTH(OPTER_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(OPTER_NAME) * 1/3))) END;
-- OPTINS_NO (org_name)
UPDATE fund_analysis_module SET OPTINS_NO = CASE WHEN LENGTH(OPTINS_NO) <= 5 THEN CONCAT(SUBSTR(OPTINS_NO, 1, 3), REPEAT('*', LENGTH(OPTINS_NO) - 3)) ELSE CONCAT(SUBSTR(OPTINS_NO, 1, CEIL(LENGTH(OPTINS_NO) * 2/3)), REPEAT('*', FLOOR(LENGTH(OPTINS_NO) * 1/3))) END;
-- MODULE_NAME (person_name)
UPDATE fund_analysis_module SET MODULE_NAME = CASE WHEN LENGTH(MODULE_NAME) <= 2 THEN CONCAT(SUBSTR(MODULE_NAME, 1, 1), '*') WHEN LENGTH(MODULE_NAME) <= 4 THEN CONCAT(SUBSTR(MODULE_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(MODULE_NAME, 1, CEIL(LENGTH(MODULE_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(MODULE_NAME) * 1/3))) END;

-- 表: fund_analysis_parameter
-- PARAMETER_NAME (person_name)
UPDATE fund_analysis_parameter SET PARAMETER_NAME = CASE WHEN LENGTH(PARAMETER_NAME) <= 2 THEN CONCAT(SUBSTR(PARAMETER_NAME, 1, 1), '*') WHEN LENGTH(PARAMETER_NAME) <= 4 THEN CONCAT(SUBSTR(PARAMETER_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(PARAMETER_NAME, 1, CEIL(LENGTH(PARAMETER_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(PARAMETER_NAME) * 1/3))) END;
-- CRTER_ID (person_name)
UPDATE fund_analysis_parameter SET CRTER_ID = CASE WHEN LENGTH(CRTER_ID) <= 2 THEN CONCAT(SUBSTR(CRTER_ID, 1, 1), '*') WHEN LENGTH(CRTER_ID) <= 4 THEN CONCAT(SUBSTR(CRTER_ID, 1, 2), '*') ELSE CONCAT(SUBSTR(CRTER_ID, 1, CEIL(LENGTH(CRTER_ID) * 2/3)), REPEAT('*', FLOOR(LENGTH(CRTER_ID) * 1/3))) END;
-- CRTER_NAME (person_name)
UPDATE fund_analysis_parameter SET CRTER_NAME = CASE WHEN LENGTH(CRTER_NAME) <= 2 THEN CONCAT(SUBSTR(CRTER_NAME, 1, 1), '*') WHEN LENGTH(CRTER_NAME) <= 4 THEN CONCAT(SUBSTR(CRTER_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(CRTER_NAME, 1, CEIL(LENGTH(CRTER_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(CRTER_NAME) * 1/3))) END;
-- CRTE_OPTINS_NO (org_name)
UPDATE fund_analysis_parameter SET CRTE_OPTINS_NO = CASE WHEN LENGTH(CRTE_OPTINS_NO) <= 5 THEN CONCAT(SUBSTR(CRTE_OPTINS_NO, 1, 3), REPEAT('*', LENGTH(CRTE_OPTINS_NO) - 3)) ELSE CONCAT(SUBSTR(CRTE_OPTINS_NO, 1, CEIL(LENGTH(CRTE_OPTINS_NO) * 2/3)), REPEAT('*', FLOOR(LENGTH(CRTE_OPTINS_NO) * 1/3))) END;
-- OPTER_ID (person_name)
UPDATE fund_analysis_parameter SET OPTER_ID = CASE WHEN LENGTH(OPTER_ID) <= 2 THEN CONCAT(SUBSTR(OPTER_ID, 1, 1), '*') WHEN LENGTH(OPTER_ID) <= 4 THEN CONCAT(SUBSTR(OPTER_ID, 1, 2), '*') ELSE CONCAT(SUBSTR(OPTER_ID, 1, CEIL(LENGTH(OPTER_ID) * 2/3)), REPEAT('*', FLOOR(LENGTH(OPTER_ID) * 1/3))) END;
-- OPTER_NAME (person_name)
UPDATE fund_analysis_parameter SET OPTER_NAME = CASE WHEN LENGTH(OPTER_NAME) <= 2 THEN CONCAT(SUBSTR(OPTER_NAME, 1, 1), '*') WHEN LENGTH(OPTER_NAME) <= 4 THEN CONCAT(SUBSTR(OPTER_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(OPTER_NAME, 1, CEIL(LENGTH(OPTER_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(OPTER_NAME) * 1/3))) END;
-- OPTINS_NO (org_name)
UPDATE fund_analysis_parameter SET OPTINS_NO = CASE WHEN LENGTH(OPTINS_NO) <= 5 THEN CONCAT(SUBSTR(OPTINS_NO, 1, 3), REPEAT('*', LENGTH(OPTINS_NO) - 3)) ELSE CONCAT(SUBSTR(OPTINS_NO, 1, CEIL(LENGTH(OPTINS_NO) * 2/3)), REPEAT('*', FLOOR(LENGTH(OPTINS_NO) * 1/3))) END;

-- 表: fund_analysis_template
-- TEM_NAME (person_name)
UPDATE fund_analysis_template SET TEM_NAME = CASE WHEN LENGTH(TEM_NAME) <= 2 THEN CONCAT(SUBSTR(TEM_NAME, 1, 1), '*') WHEN LENGTH(TEM_NAME) <= 4 THEN CONCAT(SUBSTR(TEM_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(TEM_NAME, 1, CEIL(LENGTH(TEM_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(TEM_NAME) * 1/3))) END;
-- CRTER_ID (person_name)
UPDATE fund_analysis_template SET CRTER_ID = CASE WHEN LENGTH(CRTER_ID) <= 2 THEN CONCAT(SUBSTR(CRTER_ID, 1, 1), '*') WHEN LENGTH(CRTER_ID) <= 4 THEN CONCAT(SUBSTR(CRTER_ID, 1, 2), '*') ELSE CONCAT(SUBSTR(CRTER_ID, 1, CEIL(LENGTH(CRTER_ID) * 2/3)), REPEAT('*', FLOOR(LENGTH(CRTER_ID) * 1/3))) END;
-- CRTER_NAME (person_name)
UPDATE fund_analysis_template SET CRTER_NAME = CASE WHEN LENGTH(CRTER_NAME) <= 2 THEN CONCAT(SUBSTR(CRTER_NAME, 1, 1), '*') WHEN LENGTH(CRTER_NAME) <= 4 THEN CONCAT(SUBSTR(CRTER_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(CRTER_NAME, 1, CEIL(LENGTH(CRTER_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(CRTER_NAME) * 1/3))) END;
-- CRTE_OPTINS_NO (org_name)
UPDATE fund_analysis_template SET CRTE_OPTINS_NO = CASE WHEN LENGTH(CRTE_OPTINS_NO) <= 5 THEN CONCAT(SUBSTR(CRTE_OPTINS_NO, 1, 3), REPEAT('*', LENGTH(CRTE_OPTINS_NO) - 3)) ELSE CONCAT(SUBSTR(CRTE_OPTINS_NO, 1, CEIL(LENGTH(CRTE_OPTINS_NO) * 2/3)), REPEAT('*', FLOOR(LENGTH(CRTE_OPTINS_NO) * 1/3))) END;
-- OPTER_ID (person_name)
UPDATE fund_analysis_template SET OPTER_ID = CASE WHEN LENGTH(OPTER_ID) <= 2 THEN CONCAT(SUBSTR(OPTER_ID, 1, 1), '*') WHEN LENGTH(OPTER_ID) <= 4 THEN CONCAT(SUBSTR(OPTER_ID, 1, 2), '*') ELSE CONCAT(SUBSTR(OPTER_ID, 1, CEIL(LENGTH(OPTER_ID) * 2/3)), REPEAT('*', FLOOR(LENGTH(OPTER_ID) * 1/3))) END;
-- OPTER_NAME (person_name)
UPDATE fund_analysis_template SET OPTER_NAME = CASE WHEN LENGTH(OPTER_NAME) <= 2 THEN CONCAT(SUBSTR(OPTER_NAME, 1, 1), '*') WHEN LENGTH(OPTER_NAME) <= 4 THEN CONCAT(SUBSTR(OPTER_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(OPTER_NAME, 1, CEIL(LENGTH(OPTER_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(OPTER_NAME) * 1/3))) END;
-- OPTINS_NO (org_name)
UPDATE fund_analysis_template SET OPTINS_NO = CASE WHEN LENGTH(OPTINS_NO) <= 5 THEN CONCAT(SUBSTR(OPTINS_NO, 1, 3), REPEAT('*', LENGTH(OPTINS_NO) - 3)) ELSE CONCAT(SUBSTR(OPTINS_NO, 1, CEIL(LENGTH(OPTINS_NO) * 2/3)), REPEAT('*', FLOOR(LENGTH(OPTINS_NO) * 1/3))) END;
-- FDFS_ADDRESS (address)
UPDATE fund_analysis_template SET FDFS_ADDRESS = CASE WHEN LENGTH(FDFS_ADDRESS) <= 10 THEN CONCAT(SUBSTR(FDFS_ADDRESS, 1, 7), REPEAT('*', LENGTH(FDFS_ADDRESS) - 7)) ELSE CONCAT(SUBSTR(FDFS_ADDRESS, 1, CEIL(LENGTH(FDFS_ADDRESS) * 2/3)), REPEAT('*', FLOOR(LENGTH(FDFS_ADDRESS) * 1/3))) END;

-- 表: insu_emp_info_b
-- EMP_NO (org_name)
UPDATE insu_emp_info_b SET EMP_NO = CASE WHEN LENGTH(EMP_NO) <= 5 THEN CONCAT(SUBSTR(EMP_NO, 1, 3), REPEAT('*', LENGTH(EMP_NO) - 3)) ELSE CONCAT(SUBSTR(EMP_NO, 1, CEIL(LENGTH(EMP_NO) * 2/3)), REPEAT('*', FLOOR(LENGTH(EMP_NO) * 1/3))) END;
-- EMP_ENTT_CODG (org_name)
UPDATE insu_emp_info_b SET EMP_ENTT_CODG = CASE WHEN LENGTH(EMP_ENTT_CODG) <= 5 THEN CONCAT(SUBSTR(EMP_ENTT_CODG, 1, 3), REPEAT('*', LENGTH(EMP_ENTT_CODG) - 3)) ELSE CONCAT(SUBSTR(EMP_ENTT_CODG, 1, CEIL(LENGTH(EMP_ENTT_CODG) * 2/3)), REPEAT('*', FLOOR(LENGTH(EMP_ENTT_CODG) * 1/3))) END;
-- EMP_MGT_TYPE (org_name)
UPDATE insu_emp_info_b SET EMP_MGT_TYPE = CASE WHEN LENGTH(EMP_MGT_TYPE) <= 5 THEN CONCAT(SUBSTR(EMP_MGT_TYPE, 1, 3), REPEAT('*', LENGTH(EMP_MGT_TYPE) - 3)) ELSE CONCAT(SUBSTR(EMP_MGT_TYPE, 1, CEIL(LENGTH(EMP_MGT_TYPE) * 2/3)), REPEAT('*', FLOOR(LENGTH(EMP_MGT_TYPE) * 1/3))) END;
-- PRNT_EMP_NO (org_name)
UPDATE insu_emp_info_b SET PRNT_EMP_NO = CASE WHEN LENGTH(PRNT_EMP_NO) <= 5 THEN CONCAT(SUBSTR(PRNT_EMP_NO, 1, 3), REPEAT('*', LENGTH(PRNT_EMP_NO) - 3)) ELSE CONCAT(SUBSTR(PRNT_EMP_NO, 1, CEIL(LENGTH(PRNT_EMP_NO) * 2/3)), REPEAT('*', FLOOR(LENGTH(PRNT_EMP_NO) * 1/3))) END;
-- EMP_TYPE (org_name)
UPDATE insu_emp_info_b SET EMP_TYPE = CASE WHEN LENGTH(EMP_TYPE) <= 5 THEN CONCAT(SUBSTR(EMP_TYPE, 1, 3), REPEAT('*', LENGTH(EMP_TYPE) - 3)) ELSE CONCAT(SUBSTR(EMP_TYPE, 1, CEIL(LENGTH(EMP_TYPE) * 2/3)), REPEAT('*', FLOOR(LENGTH(EMP_TYPE) * 1/3))) END;
-- EMP_NAME (person_name)
UPDATE insu_emp_info_b SET EMP_NAME = CASE WHEN LENGTH(EMP_NAME) <= 2 THEN CONCAT(SUBSTR(EMP_NAME, 1, 1), '*') WHEN LENGTH(EMP_NAME) <= 4 THEN CONCAT(SUBSTR(EMP_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(EMP_NAME, 1, CEIL(LENGTH(EMP_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(EMP_NAME) * 1/3))) END;
-- REG_NAME (person_name)
UPDATE insu_emp_info_b SET REG_NAME = CASE WHEN LENGTH(REG_NAME) <= 2 THEN CONCAT(SUBSTR(REG_NAME, 1, 1), '*') WHEN LENGTH(REG_NAME) <= 4 THEN CONCAT(SUBSTR(REG_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(REG_NAME, 1, CEIL(LENGTH(REG_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(REG_NAME) * 1/3))) END;
-- CONER_NAME (person_name)
UPDATE insu_emp_info_b SET CONER_NAME = CASE WHEN LENGTH(CONER_NAME) <= 2 THEN CONCAT(SUBSTR(CONER_NAME, 1, 1), '*') WHEN LENGTH(CONER_NAME) <= 4 THEN CONCAT(SUBSTR(CONER_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(CONER_NAME, 1, CEIL(LENGTH(CONER_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(CONER_NAME) * 1/3))) END;
-- TEL (phone)
UPDATE insu_emp_info_b SET TEL = CASE WHEN LENGTH(TEL) <= 8 THEN CONCAT(SUBSTR(TEL, 1, 5), REPEAT('*', LENGTH(TEL) - 5)) ELSE CONCAT(SUBSTR(TEL, 1, CEIL(LENGTH(TEL) * 2/3)), REPEAT('*', FLOOR(LENGTH(TEL) * 1/3))) END;
-- ORGCODE (org_name)
UPDATE insu_emp_info_b SET ORGCODE = CASE WHEN LENGTH(ORGCODE) <= 5 THEN CONCAT(SUBSTR(ORGCODE, 1, 3), REPEAT('*', LENGTH(ORGCODE) - 3)) ELSE CONCAT(SUBSTR(ORGCODE, 1, CEIL(LENGTH(ORGCODE) * 2/3)), REPEAT('*', FLOOR(LENGTH(ORGCODE) * 1/3))) END;
-- EMP_ADDR (org_name)
UPDATE insu_emp_info_b SET EMP_ADDR = CASE WHEN LENGTH(EMP_ADDR) <= 5 THEN CONCAT(SUBSTR(EMP_ADDR, 1, 3), REPEAT('*', LENGTH(EMP_ADDR) - 3)) ELSE CONCAT(SUBSTR(EMP_ADDR, 1, CEIL(LENGTH(EMP_ADDR) * 2/3)), REPEAT('*', FLOOR(LENGTH(EMP_ADDR) * 1/3))) END;
-- ORG_VALI_STAS (org_name)
UPDATE insu_emp_info_b SET ORG_VALI_STAS = CASE WHEN LENGTH(ORG_VALI_STAS) <= 5 THEN CONCAT(SUBSTR(ORG_VALI_STAS, 1, 3), REPEAT('*', LENGTH(ORG_VALI_STAS) - 3)) ELSE CONCAT(SUBSTR(ORG_VALI_STAS, 1, CEIL(LENGTH(ORG_VALI_STAS) * 2/3)), REPEAT('*', FLOOR(LENGTH(ORG_VALI_STAS) * 1/3))) END;
-- LEGREP_TEL (phone)
UPDATE insu_emp_info_b SET LEGREP_TEL = CASE WHEN LENGTH(LEGREP_TEL) <= 8 THEN CONCAT(SUBSTR(LEGREP_TEL, 1, 5), REPEAT('*', LENGTH(LEGREP_TEL) - 5)) ELSE CONCAT(SUBSTR(LEGREP_TEL, 1, CEIL(LENGTH(LEGREP_TEL) * 2/3)), REPEAT('*', FLOOR(LENGTH(LEGREP_TEL) * 1/3))) END;
-- LEGREP_NAME (person_name)
UPDATE insu_emp_info_b SET LEGREP_NAME = CASE WHEN LENGTH(LEGREP_NAME) <= 2 THEN CONCAT(SUBSTR(LEGREP_NAME, 1, 1), '*') WHEN LENGTH(LEGREP_NAME) <= 4 THEN CONCAT(SUBSTR(LEGREP_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(LEGREP_NAME, 1, CEIL(LENGTH(LEGREP_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(LEGREP_NAME) * 1/3))) END;
-- LEGREP_CERTNO (id_card)
UPDATE insu_emp_info_b SET LEGREP_CERTNO = CASE WHEN LENGTH(LEGREP_CERTNO) <= 10 THEN CONCAT(SUBSTR(LEGREP_CERTNO, 1, 7), REPEAT('*', LENGTH(LEGREP_CERTNO) - 7)) ELSE CONCAT(SUBSTR(LEGREP_CERTNO, 1, CEIL(LENGTH(LEGREP_CERTNO) * 2/3)), REPEAT('*', FLOOR(LENGTH(LEGREP_CERTNO) * 1/3))) END;
-- ORGCODE_ISSU_EMP (org_name)
UPDATE insu_emp_info_b SET ORGCODE_ISSU_EMP = CASE WHEN LENGTH(ORGCODE_ISSU_EMP) <= 5 THEN CONCAT(SUBSTR(ORGCODE_ISSU_EMP, 1, 3), REPEAT('*', LENGTH(ORGCODE_ISSU_EMP) - 3)) ELSE CONCAT(SUBSTR(ORGCODE_ISSU_EMP, 1, CEIL(LENGTH(ORGCODE_ISSU_EMP) * 2/3)), REPEAT('*', FLOOR(LENGTH(ORGCODE_ISSU_EMP) * 1/3))) END;
-- CRTER_ID (person_name)
UPDATE insu_emp_info_b SET CRTER_ID = CASE WHEN LENGTH(CRTER_ID) <= 2 THEN CONCAT(SUBSTR(CRTER_ID, 1, 1), '*') WHEN LENGTH(CRTER_ID) <= 4 THEN CONCAT(SUBSTR(CRTER_ID, 1, 2), '*') ELSE CONCAT(SUBSTR(CRTER_ID, 1, CEIL(LENGTH(CRTER_ID) * 2/3)), REPEAT('*', FLOOR(LENGTH(CRTER_ID) * 1/3))) END;
-- CRTER_NAME (person_name)
UPDATE insu_emp_info_b SET CRTER_NAME = CASE WHEN LENGTH(CRTER_NAME) <= 2 THEN CONCAT(SUBSTR(CRTER_NAME, 1, 1), '*') WHEN LENGTH(CRTER_NAME) <= 4 THEN CONCAT(SUBSTR(CRTER_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(CRTER_NAME, 1, CEIL(LENGTH(CRTER_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(CRTER_NAME) * 1/3))) END;
-- CRTE_OPTINS_NO (org_name)
UPDATE insu_emp_info_b SET CRTE_OPTINS_NO = CASE WHEN LENGTH(CRTE_OPTINS_NO) <= 5 THEN CONCAT(SUBSTR(CRTE_OPTINS_NO, 1, 3), REPEAT('*', LENGTH(CRTE_OPTINS_NO) - 3)) ELSE CONCAT(SUBSTR(CRTE_OPTINS_NO, 1, CEIL(LENGTH(CRTE_OPTINS_NO) * 2/3)), REPEAT('*', FLOOR(LENGTH(CRTE_OPTINS_NO) * 1/3))) END;
-- OPTER_ID (person_name)
UPDATE insu_emp_info_b SET OPTER_ID = CASE WHEN LENGTH(OPTER_ID) <= 2 THEN CONCAT(SUBSTR(OPTER_ID, 1, 1), '*') WHEN LENGTH(OPTER_ID) <= 4 THEN CONCAT(SUBSTR(OPTER_ID, 1, 2), '*') ELSE CONCAT(SUBSTR(OPTER_ID, 1, CEIL(LENGTH(OPTER_ID) * 2/3)), REPEAT('*', FLOOR(LENGTH(OPTER_ID) * 1/3))) END;
-- OPTER_NAME (person_name)
UPDATE insu_emp_info_b SET OPTER_NAME = CASE WHEN LENGTH(OPTER_NAME) <= 2 THEN CONCAT(SUBSTR(OPTER_NAME, 1, 1), '*') WHEN LENGTH(OPTER_NAME) <= 4 THEN CONCAT(SUBSTR(OPTER_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(OPTER_NAME, 1, CEIL(LENGTH(OPTER_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(OPTER_NAME) * 1/3))) END;
-- OPTINS_NO (org_name)
UPDATE insu_emp_info_b SET OPTINS_NO = CASE WHEN LENGTH(OPTINS_NO) <= 5 THEN CONCAT(SUBSTR(OPTINS_NO, 1, 3), REPEAT('*', LENGTH(OPTINS_NO) - 3)) ELSE CONCAT(SUBSTR(OPTINS_NO, 1, CEIL(LENGTH(OPTINS_NO) * 2/3)), REPEAT('*', FLOOR(LENGTH(OPTINS_NO) * 1/3))) END;
-- ORG_QUTS_PSNCNT (org_name)
UPDATE insu_emp_info_b SET ORG_QUTS_PSNCNT = CASE WHEN LENGTH(ORG_QUTS_PSNCNT) <= 5 THEN CONCAT(SUBSTR(ORG_QUTS_PSNCNT, 1, 3), REPEAT('*', LENGTH(ORG_QUTS_PSNCNT) - 3)) ELSE CONCAT(SUBSTR(ORG_QUTS_PSNCNT, 1, CEIL(LENGTH(ORG_QUTS_PSNCNT) * 2/3)), REPEAT('*', FLOOR(LENGTH(ORG_QUTS_PSNCNT) * 1/3))) END;

-- 表: jdbc_datasource
-- driver_class_name (person_name)
UPDATE jdbc_datasource SET driver_class_name = CASE WHEN LENGTH(driver_class_name) <= 2 THEN CONCAT(SUBSTR(driver_class_name, 1, 1), '*') WHEN LENGTH(driver_class_name) <= 4 THEN CONCAT(SUBSTR(driver_class_name, 1, 2), '*') ELSE CONCAT(SUBSTR(driver_class_name, 1, CEIL(LENGTH(driver_class_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(driver_class_name) * 1/3))) END;
-- username (person_name)
UPDATE jdbc_datasource SET username = CASE WHEN LENGTH(username) <= 2 THEN CONCAT(SUBSTR(username, 1, 1), '*') WHEN LENGTH(username) <= 4 THEN CONCAT(SUBSTR(username, 1, 2), '*') ELSE CONCAT(SUBSTR(username, 1, CEIL(LENGTH(username) * 2/3)), REPEAT('*', FLOOR(LENGTH(username) * 1/3))) END;

-- 表: mdtrt_d_day
-- begntime (medical_record)
UPDATE mdtrt_d_day SET begntime = CASE WHEN LENGTH(begntime) <= 8 THEN CONCAT(SUBSTR(begntime, 1, 5), REPEAT('*', LENGTH(begntime) - 5)) ELSE CONCAT(SUBSTR(begntime, 1, CEIL(LENGTH(begntime) * 2/3)), REPEAT('*', FLOOR(LENGTH(begntime) * 1/3))) END;
-- endtime (medical_record)
UPDATE mdtrt_d_day SET endtime = CASE WHEN LENGTH(endtime) <= 8 THEN CONCAT(SUBSTR(endtime, 1, 5), REPEAT('*', LENGTH(endtime) - 5)) ELSE CONCAT(SUBSTR(endtime, 1, CEIL(LENGTH(endtime) * 2/3)), REPEAT('*', FLOOR(LENGTH(endtime) * 1/3))) END;
-- hosp_lv (org_name)
UPDATE mdtrt_d_day SET hosp_lv = CASE WHEN LENGTH(hosp_lv) <= 5 THEN CONCAT(SUBSTR(hosp_lv, 1, 3), REPEAT('*', LENGTH(hosp_lv) - 3)) ELSE CONCAT(SUBSTR(hosp_lv, 1, CEIL(LENGTH(hosp_lv) * 2/3)), REPEAT('*', FLOOR(LENGTH(hosp_lv) * 1/3))) END;
-- fixmedins_name (person_name)
UPDATE mdtrt_d_day SET fixmedins_name = CASE WHEN LENGTH(fixmedins_name) <= 2 THEN CONCAT(SUBSTR(fixmedins_name, 1, 1), '*') WHEN LENGTH(fixmedins_name) <= 4 THEN CONCAT(SUBSTR(fixmedins_name, 1, 2), '*') ELSE CONCAT(SUBSTR(fixmedins_name, 1, CEIL(LENGTH(fixmedins_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_name) * 1/3))) END;
-- dise_name (person_name)
UPDATE mdtrt_d_day SET dise_name = CASE WHEN LENGTH(dise_name) <= 2 THEN CONCAT(SUBSTR(dise_name, 1, 1), '*') WHEN LENGTH(dise_name) <= 4 THEN CONCAT(SUBSTR(dise_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dise_name, 1, CEIL(LENGTH(dise_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dise_name) * 1/3))) END;
-- mdtrt_cnt (medical_record)
UPDATE mdtrt_d_day SET mdtrt_cnt = CASE WHEN LENGTH(mdtrt_cnt) <= 8 THEN CONCAT(SUBSTR(mdtrt_cnt, 1, 5), REPEAT('*', LENGTH(mdtrt_cnt) - 5)) ELSE CONCAT(SUBSTR(mdtrt_cnt, 1, CEIL(LENGTH(mdtrt_cnt) * 2/3)), REPEAT('*', FLOOR(LENGTH(mdtrt_cnt) * 1/3))) END;

-- 表: medical_bureau_ytai
-- option_name (person_name)
UPDATE medical_bureau_ytai SET option_name = CASE WHEN LENGTH(option_name) <= 2 THEN CONCAT(SUBSTR(option_name, 1, 1), '*') WHEN LENGTH(option_name) <= 4 THEN CONCAT(SUBSTR(option_name, 1, 2), '*') ELSE CONCAT(SUBSTR(option_name, 1, CEIL(LENGTH(option_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(option_name) * 1/3))) END;
-- address (address)
UPDATE medical_bureau_ytai SET address = CASE WHEN LENGTH(address) <= 10 THEN CONCAT(SUBSTR(address, 1, 7), REPEAT('*', LENGTH(address) - 7)) ELSE CONCAT(SUBSTR(address, 1, CEIL(LENGTH(address) * 2/3)), REPEAT('*', FLOOR(LENGTH(address) * 1/3))) END;
-- tel (phone)
UPDATE medical_bureau_ytai SET tel = CASE WHEN LENGTH(tel) <= 8 THEN CONCAT(SUBSTR(tel, 1, 5), REPEAT('*', LENGTH(tel) - 5)) ELSE CONCAT(SUBSTR(tel, 1, CEIL(LENGTH(tel) * 2/3)), REPEAT('*', FLOOR(LENGTH(tel) * 1/3))) END;

-- 表: ods_bffact_vola_rslt_detl_d_df_ytai
-- admdvs_name (person_name)
UPDATE ods_bffact_vola_rslt_detl_d_df_ytai SET admdvs_name = CASE WHEN LENGTH(admdvs_name) <= 2 THEN CONCAT(SUBSTR(admdvs_name, 1, 1), '*') WHEN LENGTH(admdvs_name) <= 4 THEN CONCAT(SUBSTR(admdvs_name, 1, 2), '*') ELSE CONCAT(SUBSTR(admdvs_name, 1, CEIL(LENGTH(admdvs_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(admdvs_name) * 1/3))) END;
-- mdtrt_id (medical_record)
UPDATE ods_bffact_vola_rslt_detl_d_df_ytai SET mdtrt_id = CASE WHEN LENGTH(mdtrt_id) <= 8 THEN CONCAT(SUBSTR(mdtrt_id, 1, 5), REPEAT('*', LENGTH(mdtrt_id) - 5)) ELSE CONCAT(SUBSTR(mdtrt_id, 1, CEIL(LENGTH(mdtrt_id) * 2/3)), REPEAT('*', FLOOR(LENGTH(mdtrt_id) * 1/3))) END;
-- hilist_name (person_name)
UPDATE ods_bffact_vola_rslt_detl_d_df_ytai SET hilist_name = CASE WHEN LENGTH(hilist_name) <= 2 THEN CONCAT(SUBSTR(hilist_name, 1, 1), '*') WHEN LENGTH(hilist_name) <= 4 THEN CONCAT(SUBSTR(hilist_name, 1, 2), '*') ELSE CONCAT(SUBSTR(hilist_name, 1, CEIL(LENGTH(hilist_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(hilist_name) * 1/3))) END;
-- spec_unt (org_name)
UPDATE ods_bffact_vola_rslt_detl_d_df_ytai SET spec_unt = CASE WHEN LENGTH(spec_unt) <= 5 THEN CONCAT(SUBSTR(spec_unt, 1, 3), REPEAT('*', LENGTH(spec_unt) - 3)) ELSE CONCAT(SUBSTR(spec_unt, 1, CEIL(LENGTH(spec_unt) * 2/3)), REPEAT('*', FLOOR(LENGTH(spec_unt) * 1/3))) END;
-- mdtrtsn (medical_record)
UPDATE ods_bffact_vola_rslt_detl_d_df_ytai SET mdtrtsn = CASE WHEN LENGTH(mdtrtsn) <= 8 THEN CONCAT(SUBSTR(mdtrtsn, 1, 5), REPEAT('*', LENGTH(mdtrtsn) - 5)) ELSE CONCAT(SUBSTR(mdtrtsn, 1, CEIL(LENGTH(mdtrtsn) * 2/3)), REPEAT('*', FLOOR(LENGTH(mdtrtsn) * 1/3))) END;
-- medins_list_codg (org_name)
UPDATE ods_bffact_vola_rslt_detl_d_df_ytai SET medins_list_codg = CASE WHEN LENGTH(medins_list_codg) <= 5 THEN CONCAT(SUBSTR(medins_list_codg, 1, 3), REPEAT('*', LENGTH(medins_list_codg) - 3)) ELSE CONCAT(SUBSTR(medins_list_codg, 1, CEIL(LENGTH(medins_list_codg) * 2/3)), REPEAT('*', FLOOR(LENGTH(medins_list_codg) * 1/3))) END;
-- medins_list_name (person_name)
UPDATE ods_bffact_vola_rslt_detl_d_df_ytai SET medins_list_name = CASE WHEN LENGTH(medins_list_name) <= 2 THEN CONCAT(SUBSTR(medins_list_name, 1, 1), '*') WHEN LENGTH(medins_list_name) <= 4 THEN CONCAT(SUBSTR(medins_list_name, 1, 2), '*') ELSE CONCAT(SUBSTR(medins_list_name, 1, CEIL(LENGTH(medins_list_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(medins_list_name) * 1/3))) END;
-- drord_dr_codg (person_name)
UPDATE ods_bffact_vola_rslt_detl_d_df_ytai SET drord_dr_codg = CASE WHEN LENGTH(drord_dr_codg) <= 2 THEN CONCAT(SUBSTR(drord_dr_codg, 1, 1), '*') WHEN LENGTH(drord_dr_codg) <= 4 THEN CONCAT(SUBSTR(drord_dr_codg, 1, 2), '*') ELSE CONCAT(SUBSTR(drord_dr_codg, 1, CEIL(LENGTH(drord_dr_codg) * 2/3)), REPEAT('*', FLOOR(LENGTH(drord_dr_codg) * 1/3))) END;
-- drord_dr_name (person_name)
UPDATE ods_bffact_vola_rslt_detl_d_df_ytai SET drord_dr_name = CASE WHEN LENGTH(drord_dr_name) <= 2 THEN CONCAT(SUBSTR(drord_dr_name, 1, 1), '*') WHEN LENGTH(drord_dr_name) <= 4 THEN CONCAT(SUBSTR(drord_dr_name, 1, 2), '*') ELSE CONCAT(SUBSTR(drord_dr_name, 1, CEIL(LENGTH(drord_dr_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(drord_dr_name) * 1/3))) END;
-- dr_cert_type (person_name)
UPDATE ods_bffact_vola_rslt_detl_d_df_ytai SET dr_cert_type = CASE WHEN LENGTH(dr_cert_type) <= 2 THEN CONCAT(SUBSTR(dr_cert_type, 1, 1), '*') WHEN LENGTH(dr_cert_type) <= 4 THEN CONCAT(SUBSTR(dr_cert_type, 1, 2), '*') ELSE CONCAT(SUBSTR(dr_cert_type, 1, CEIL(LENGTH(dr_cert_type) * 2/3)), REPEAT('*', FLOOR(LENGTH(dr_cert_type) * 1/3))) END;
-- drord_dr_idcard (person_name)
UPDATE ods_bffact_vola_rslt_detl_d_df_ytai SET drord_dr_idcard = CASE WHEN LENGTH(drord_dr_idcard) <= 2 THEN CONCAT(SUBSTR(drord_dr_idcard, 1, 1), '*') WHEN LENGTH(drord_dr_idcard) <= 4 THEN CONCAT(SUBSTR(drord_dr_idcard, 1, 2), '*') ELSE CONCAT(SUBSTR(drord_dr_idcard, 1, CEIL(LENGTH(drord_dr_idcard) * 2/3)), REPEAT('*', FLOOR(LENGTH(drord_dr_idcard) * 1/3))) END;

-- 表: ods_bffact_warn_rslt_d_df_ytai
-- mdtrt_id (medical_record)
UPDATE ods_bffact_warn_rslt_d_df_ytai SET mdtrt_id = CASE WHEN LENGTH(mdtrt_id) <= 8 THEN CONCAT(SUBSTR(mdtrt_id, 1, 5), REPEAT('*', LENGTH(mdtrt_id) - 5)) ELSE CONCAT(SUBSTR(mdtrt_id, 1, CEIL(LENGTH(mdtrt_id) * 2/3)), REPEAT('*', FLOOR(LENGTH(mdtrt_id) * 1/3))) END;
-- admdvs_name (person_name)
UPDATE ods_bffact_warn_rslt_d_df_ytai SET admdvs_name = CASE WHEN LENGTH(admdvs_name) <= 2 THEN CONCAT(SUBSTR(admdvs_name, 1, 1), '*') WHEN LENGTH(admdvs_name) <= 4 THEN CONCAT(SUBSTR(admdvs_name, 1, 2), '*') ELSE CONCAT(SUBSTR(admdvs_name, 1, CEIL(LENGTH(admdvs_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(admdvs_name) * 1/3))) END;
-- medins_code (org_name)
UPDATE ods_bffact_warn_rslt_d_df_ytai SET medins_code = CASE WHEN LENGTH(medins_code) <= 5 THEN CONCAT(SUBSTR(medins_code, 1, 3), REPEAT('*', LENGTH(medins_code) - 3)) ELSE CONCAT(SUBSTR(medins_code, 1, CEIL(LENGTH(medins_code) * 2/3)), REPEAT('*', FLOOR(LENGTH(medins_code) * 1/3))) END;
-- medins_name (person_name)
UPDATE ods_bffact_warn_rslt_d_df_ytai SET medins_name = CASE WHEN LENGTH(medins_name) <= 2 THEN CONCAT(SUBSTR(medins_name, 1, 1), '*') WHEN LENGTH(medins_name) <= 4 THEN CONCAT(SUBSTR(medins_name, 1, 2), '*') ELSE CONCAT(SUBSTR(medins_name, 1, CEIL(LENGTH(medins_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(medins_name) * 1/3))) END;
-- medinslv (org_name)
UPDATE ods_bffact_warn_rslt_d_df_ytai SET medinslv = CASE WHEN LENGTH(medinslv) <= 5 THEN CONCAT(SUBSTR(medinslv, 1, 3), REPEAT('*', LENGTH(medinslv) - 3)) ELSE CONCAT(SUBSTR(medinslv, 1, CEIL(LENGTH(medinslv) * 2/3)), REPEAT('*', FLOOR(LENGTH(medinslv) * 1/3))) END;
-- medins_type (org_name)
UPDATE ods_bffact_warn_rslt_d_df_ytai SET medins_type = CASE WHEN LENGTH(medins_type) <= 5 THEN CONCAT(SUBSTR(medins_type, 1, 3), REPEAT('*', LENGTH(medins_type) - 3)) ELSE CONCAT(SUBSTR(medins_type, 1, CEIL(LENGTH(medins_type) * 2/3)), REPEAT('*', FLOOR(LENGTH(medins_type) * 1/3))) END;
-- psn_no (person_id)
UPDATE ods_bffact_warn_rslt_d_df_ytai SET psn_no = CASE WHEN LENGTH(psn_no) <= 8 THEN CONCAT(SUBSTR(psn_no, 1, 5), REPEAT('*', LENGTH(psn_no) - 5)) ELSE CONCAT(SUBSTR(psn_no, 1, CEIL(LENGTH(psn_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(psn_no) * 1/3))) END;
-- psn_name (person_name)
UPDATE ods_bffact_warn_rslt_d_df_ytai SET psn_name = CASE WHEN LENGTH(psn_name) <= 2 THEN CONCAT(SUBSTR(psn_name, 1, 1), '*') WHEN LENGTH(psn_name) <= 4 THEN CONCAT(SUBSTR(psn_name, 1, 2), '*') ELSE CONCAT(SUBSTR(psn_name, 1, CEIL(LENGTH(psn_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(psn_name) * 1/3))) END;
-- adm_disediag_name (person_name)
UPDATE ods_bffact_warn_rslt_d_df_ytai SET adm_disediag_name = CASE WHEN LENGTH(adm_disediag_name) <= 2 THEN CONCAT(SUBSTR(adm_disediag_name, 1, 1), '*') WHEN LENGTH(adm_disediag_name) <= 4 THEN CONCAT(SUBSTR(adm_disediag_name, 1, 2), '*') ELSE CONCAT(SUBSTR(adm_disediag_name, 1, CEIL(LENGTH(adm_disediag_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(adm_disediag_name) * 1/3))) END;
-- dscg_main_disediag_name (person_name)
UPDATE ods_bffact_warn_rslt_d_df_ytai SET dscg_main_disediag_name = CASE WHEN LENGTH(dscg_main_disediag_name) <= 2 THEN CONCAT(SUBSTR(dscg_main_disediag_name, 1, 1), '*') WHEN LENGTH(dscg_main_disediag_name) <= 4 THEN CONCAT(SUBSTR(dscg_main_disediag_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dscg_main_disediag_name, 1, CEIL(LENGTH(dscg_main_disediag_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dscg_main_disediag_name) * 1/3))) END;
-- dscg_dept_name (person_name)
UPDATE ods_bffact_warn_rslt_d_df_ytai SET dscg_dept_name = CASE WHEN LENGTH(dscg_dept_name) <= 2 THEN CONCAT(SUBSTR(dscg_dept_name, 1, 1), '*') WHEN LENGTH(dscg_dept_name) <= 4 THEN CONCAT(SUBSTR(dscg_dept_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dscg_dept_name, 1, CEIL(LENGTH(dscg_dept_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dscg_dept_name) * 1/3))) END;
-- dr_code (person_name)
UPDATE ods_bffact_warn_rslt_d_df_ytai SET dr_code = CASE WHEN LENGTH(dr_code) <= 2 THEN CONCAT(SUBSTR(dr_code, 1, 1), '*') WHEN LENGTH(dr_code) <= 4 THEN CONCAT(SUBSTR(dr_code, 1, 2), '*') ELSE CONCAT(SUBSTR(dr_code, 1, CEIL(LENGTH(dr_code) * 2/3)), REPEAT('*', FLOOR(LENGTH(dr_code) * 1/3))) END;
-- dr_name (person_name)
UPDATE ods_bffact_warn_rslt_d_df_ytai SET dr_name = CASE WHEN LENGTH(dr_name) <= 2 THEN CONCAT(SUBSTR(dr_name, 1, 1), '*') WHEN LENGTH(dr_name) <= 4 THEN CONCAT(SUBSTR(dr_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dr_name, 1, CEIL(LENGTH(dr_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dr_name) * 1/3))) END;
-- dr_cert_type (person_name)
UPDATE ods_bffact_warn_rslt_d_df_ytai SET dr_cert_type = CASE WHEN LENGTH(dr_cert_type) <= 2 THEN CONCAT(SUBSTR(dr_cert_type, 1, 1), '*') WHEN LENGTH(dr_cert_type) <= 4 THEN CONCAT(SUBSTR(dr_cert_type, 1, 2), '*') ELSE CONCAT(SUBSTR(dr_cert_type, 1, CEIL(LENGTH(dr_cert_type) * 2/3)), REPEAT('*', FLOOR(LENGTH(dr_cert_type) * 1/3))) END;
-- dr_idcard (person_name)
UPDATE ods_bffact_warn_rslt_d_df_ytai SET dr_idcard = CASE WHEN LENGTH(dr_idcard) <= 2 THEN CONCAT(SUBSTR(dr_idcard, 1, 1), '*') WHEN LENGTH(dr_idcard) <= 4 THEN CONCAT(SUBSTR(dr_idcard, 1, 2), '*') ELSE CONCAT(SUBSTR(dr_idcard, 1, CEIL(LENGTH(dr_idcard) * 2/3)), REPEAT('*', FLOOR(LENGTH(dr_idcard) * 1/3))) END;
-- rule_name (person_name)
UPDATE ods_bffact_warn_rslt_d_df_ytai SET rule_name = CASE WHEN LENGTH(rule_name) <= 2 THEN CONCAT(SUBSTR(rule_name, 1, 1), '*') WHEN LENGTH(rule_name) <= 4 THEN CONCAT(SUBSTR(rule_name, 1, 2), '*') ELSE CONCAT(SUBSTR(rule_name, 1, CEIL(LENGTH(rule_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(rule_name) * 1/3))) END;

-- 表: ods_doc_d_df_ytai
-- mdtrtsn (medical_record)
UPDATE ods_doc_d_df_ytai SET mdtrtsn = CASE WHEN LENGTH(mdtrtsn) <= 8 THEN CONCAT(SUBSTR(mdtrtsn, 1, 5), REPEAT('*', LENGTH(mdtrtsn) - 5)) ELSE CONCAT(SUBSTR(mdtrtsn, 1, CEIL(LENGTH(mdtrtsn) * 2/3)), REPEAT('*', FLOOR(LENGTH(mdtrtsn) * 1/3))) END;
-- poolarea_name (person_name)
UPDATE ods_doc_d_df_ytai SET poolarea_name = CASE WHEN LENGTH(poolarea_name) <= 2 THEN CONCAT(SUBSTR(poolarea_name, 1, 1), '*') WHEN LENGTH(poolarea_name) <= 4 THEN CONCAT(SUBSTR(poolarea_name, 1, 2), '*') ELSE CONCAT(SUBSTR(poolarea_name, 1, CEIL(LENGTH(poolarea_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(poolarea_name) * 1/3))) END;
-- admdvs_name (person_name)
UPDATE ods_doc_d_df_ytai SET admdvs_name = CASE WHEN LENGTH(admdvs_name) <= 2 THEN CONCAT(SUBSTR(admdvs_name, 1, 1), '*') WHEN LENGTH(admdvs_name) <= 4 THEN CONCAT(SUBSTR(admdvs_name, 1, 2), '*') ELSE CONCAT(SUBSTR(admdvs_name, 1, CEIL(LENGTH(admdvs_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(admdvs_name) * 1/3))) END;
-- medins_id (org_name)
UPDATE ods_doc_d_df_ytai SET medins_id = CASE WHEN LENGTH(medins_id) <= 5 THEN CONCAT(SUBSTR(medins_id, 1, 3), REPEAT('*', LENGTH(medins_id) - 3)) ELSE CONCAT(SUBSTR(medins_id, 1, CEIL(LENGTH(medins_id) * 2/3)), REPEAT('*', FLOOR(LENGTH(medins_id) * 1/3))) END;
-- medins_name (person_name)
UPDATE ods_doc_d_df_ytai SET medins_name = CASE WHEN LENGTH(medins_name) <= 2 THEN CONCAT(SUBSTR(medins_name, 1, 1), '*') WHEN LENGTH(medins_name) <= 4 THEN CONCAT(SUBSTR(medins_name, 1, 2), '*') ELSE CONCAT(SUBSTR(medins_name, 1, CEIL(LENGTH(medins_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(medins_name) * 1/3))) END;
-- medinslv (org_name)
UPDATE ods_doc_d_df_ytai SET medinslv = CASE WHEN LENGTH(medinslv) <= 5 THEN CONCAT(SUBSTR(medinslv, 1, 3), REPEAT('*', LENGTH(medinslv) - 3)) ELSE CONCAT(SUBSTR(medinslv, 1, CEIL(LENGTH(medinslv) * 2/3)), REPEAT('*', FLOOR(LENGTH(medinslv) * 1/3))) END;
-- medins_type (org_name)
UPDATE ods_doc_d_df_ytai SET medins_type = CASE WHEN LENGTH(medins_type) <= 5 THEN CONCAT(SUBSTR(medins_type, 1, 3), REPEAT('*', LENGTH(medins_type) - 3)) ELSE CONCAT(SUBSTR(medins_type, 1, CEIL(LENGTH(medins_type) * 2/3)), REPEAT('*', FLOOR(LENGTH(medins_type) * 1/3))) END;
-- patn_name (person_name)
UPDATE ods_doc_d_df_ytai SET patn_name = CASE WHEN LENGTH(patn_name) <= 2 THEN CONCAT(SUBSTR(patn_name, 1, 1), '*') WHEN LENGTH(patn_name) <= 4 THEN CONCAT(SUBSTR(patn_name, 1, 2), '*') ELSE CONCAT(SUBSTR(patn_name, 1, CEIL(LENGTH(patn_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(patn_name) * 1/3))) END;
-- patn_idcard (id_card)
UPDATE ods_doc_d_df_ytai SET patn_idcard = CASE WHEN LENGTH(patn_idcard) <= 10 THEN CONCAT(SUBSTR(patn_idcard, 1, 7), REPEAT('*', LENGTH(patn_idcard) - 7)) ELSE CONCAT(SUBSTR(patn_idcard, 1, CEIL(LENGTH(patn_idcard) * 2/3)), REPEAT('*', FLOOR(LENGTH(patn_idcard) * 1/3))) END;
-- adm_disediag_name (person_name)
UPDATE ods_doc_d_df_ytai SET adm_disediag_name = CASE WHEN LENGTH(adm_disediag_name) <= 2 THEN CONCAT(SUBSTR(adm_disediag_name, 1, 1), '*') WHEN LENGTH(adm_disediag_name) <= 4 THEN CONCAT(SUBSTR(adm_disediag_name, 1, 2), '*') ELSE CONCAT(SUBSTR(adm_disediag_name, 1, CEIL(LENGTH(adm_disediag_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(adm_disediag_name) * 1/3))) END;
-- dscg_main_disediag_name (person_name)
UPDATE ods_doc_d_df_ytai SET dscg_main_disediag_name = CASE WHEN LENGTH(dscg_main_disediag_name) <= 2 THEN CONCAT(SUBSTR(dscg_main_disediag_name, 1, 1), '*') WHEN LENGTH(dscg_main_disediag_name) <= 4 THEN CONCAT(SUBSTR(dscg_main_disediag_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dscg_main_disediag_name, 1, CEIL(LENGTH(dscg_main_disediag_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dscg_main_disediag_name) * 1/3))) END;
-- dscg_dept_name (person_name)
UPDATE ods_doc_d_df_ytai SET dscg_dept_name = CASE WHEN LENGTH(dscg_dept_name) <= 2 THEN CONCAT(SUBSTR(dscg_dept_name, 1, 1), '*') WHEN LENGTH(dscg_dept_name) <= 4 THEN CONCAT(SUBSTR(dscg_dept_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dscg_dept_name, 1, CEIL(LENGTH(dscg_dept_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dscg_dept_name) * 1/3))) END;
-- dr_code (person_name)
UPDATE ods_doc_d_df_ytai SET dr_code = CASE WHEN LENGTH(dr_code) <= 2 THEN CONCAT(SUBSTR(dr_code, 1, 1), '*') WHEN LENGTH(dr_code) <= 4 THEN CONCAT(SUBSTR(dr_code, 1, 2), '*') ELSE CONCAT(SUBSTR(dr_code, 1, CEIL(LENGTH(dr_code) * 2/3)), REPEAT('*', FLOOR(LENGTH(dr_code) * 1/3))) END;
-- dr_name (person_name)
UPDATE ods_doc_d_df_ytai SET dr_name = CASE WHEN LENGTH(dr_name) <= 2 THEN CONCAT(SUBSTR(dr_name, 1, 1), '*') WHEN LENGTH(dr_name) <= 4 THEN CONCAT(SUBSTR(dr_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dr_name, 1, CEIL(LENGTH(dr_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dr_name) * 1/3))) END;
-- dr_cert_type (person_name)
UPDATE ods_doc_d_df_ytai SET dr_cert_type = CASE WHEN LENGTH(dr_cert_type) <= 2 THEN CONCAT(SUBSTR(dr_cert_type, 1, 1), '*') WHEN LENGTH(dr_cert_type) <= 4 THEN CONCAT(SUBSTR(dr_cert_type, 1, 2), '*') ELSE CONCAT(SUBSTR(dr_cert_type, 1, CEIL(LENGTH(dr_cert_type) * 2/3)), REPEAT('*', FLOOR(LENGTH(dr_cert_type) * 1/3))) END;
-- dr_idcard (person_name)
UPDATE ods_doc_d_df_ytai SET dr_idcard = CASE WHEN LENGTH(dr_idcard) <= 2 THEN CONCAT(SUBSTR(dr_idcard, 1, 1), '*') WHEN LENGTH(dr_idcard) <= 4 THEN CONCAT(SUBSTR(dr_idcard, 1, 2), '*') ELSE CONCAT(SUBSTR(dr_idcard, 1, CEIL(LENGTH(dr_idcard) * 2/3)), REPEAT('*', FLOOR(LENGTH(dr_idcard) * 1/3))) END;
-- crter_id (person_name)
UPDATE ods_doc_d_df_ytai SET crter_id = CASE WHEN LENGTH(crter_id) <= 2 THEN CONCAT(SUBSTR(crter_id, 1, 1), '*') WHEN LENGTH(crter_id) <= 4 THEN CONCAT(SUBSTR(crter_id, 1, 2), '*') ELSE CONCAT(SUBSTR(crter_id, 1, CEIL(LENGTH(crter_id) * 2/3)), REPEAT('*', FLOOR(LENGTH(crter_id) * 1/3))) END;
-- crter_name (person_name)
UPDATE ods_doc_d_df_ytai SET crter_name = CASE WHEN LENGTH(crter_name) <= 2 THEN CONCAT(SUBSTR(crter_name, 1, 1), '*') WHEN LENGTH(crter_name) <= 4 THEN CONCAT(SUBSTR(crter_name, 1, 2), '*') ELSE CONCAT(SUBSTR(crter_name, 1, CEIL(LENGTH(crter_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(crter_name) * 1/3))) END;
-- crte_optins_no (org_name)
UPDATE ods_doc_d_df_ytai SET crte_optins_no = CASE WHEN LENGTH(crte_optins_no) <= 5 THEN CONCAT(SUBSTR(crte_optins_no, 1, 3), REPEAT('*', LENGTH(crte_optins_no) - 3)) ELSE CONCAT(SUBSTR(crte_optins_no, 1, CEIL(LENGTH(crte_optins_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(crte_optins_no) * 1/3))) END;
-- opter_id (person_name)
UPDATE ods_doc_d_df_ytai SET opter_id = CASE WHEN LENGTH(opter_id) <= 2 THEN CONCAT(SUBSTR(opter_id, 1, 1), '*') WHEN LENGTH(opter_id) <= 4 THEN CONCAT(SUBSTR(opter_id, 1, 2), '*') ELSE CONCAT(SUBSTR(opter_id, 1, CEIL(LENGTH(opter_id) * 2/3)), REPEAT('*', FLOOR(LENGTH(opter_id) * 1/3))) END;
-- opter_name (person_name)
UPDATE ods_doc_d_df_ytai SET opter_name = CASE WHEN LENGTH(opter_name) <= 2 THEN CONCAT(SUBSTR(opter_name, 1, 1), '*') WHEN LENGTH(opter_name) <= 4 THEN CONCAT(SUBSTR(opter_name, 1, 2), '*') ELSE CONCAT(SUBSTR(opter_name, 1, CEIL(LENGTH(opter_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(opter_name) * 1/3))) END;
-- optins_no (org_name)
UPDATE ods_doc_d_df_ytai SET optins_no = CASE WHEN LENGTH(optins_no) <= 5 THEN CONCAT(SUBSTR(optins_no, 1, 3), REPEAT('*', LENGTH(optins_no) - 3)) ELSE CONCAT(SUBSTR(optins_no, 1, CEIL(LENGTH(optins_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(optins_no) * 1/3))) END;
-- fix_blng_admdvs_name (person_name)
UPDATE ods_doc_d_df_ytai SET fix_blng_admdvs_name = CASE WHEN LENGTH(fix_blng_admdvs_name) <= 2 THEN CONCAT(SUBSTR(fix_blng_admdvs_name, 1, 1), '*') WHEN LENGTH(fix_blng_admdvs_name) <= 4 THEN CONCAT(SUBSTR(fix_blng_admdvs_name, 1, 2), '*') ELSE CONCAT(SUBSTR(fix_blng_admdvs_name, 1, CEIL(LENGTH(fix_blng_admdvs_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(fix_blng_admdvs_name) * 1/3))) END;
-- insu_admdvs_name (person_name)
UPDATE ods_doc_d_df_ytai SET insu_admdvs_name = CASE WHEN LENGTH(insu_admdvs_name) <= 2 THEN CONCAT(SUBSTR(insu_admdvs_name, 1, 1), '*') WHEN LENGTH(insu_admdvs_name) <= 4 THEN CONCAT(SUBSTR(insu_admdvs_name, 1, 2), '*') ELSE CONCAT(SUBSTR(insu_admdvs_name, 1, CEIL(LENGTH(insu_admdvs_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(insu_admdvs_name) * 1/3))) END;

-- 表: ods_doc_suspt_d_df_ytai
-- admdvs_name (person_name)
UPDATE ods_doc_suspt_d_df_ytai SET admdvs_name = CASE WHEN LENGTH(admdvs_name) <= 2 THEN CONCAT(SUBSTR(admdvs_name, 1, 1), '*') WHEN LENGTH(admdvs_name) <= 4 THEN CONCAT(SUBSTR(admdvs_name, 1, 2), '*') ELSE CONCAT(SUBSTR(admdvs_name, 1, CEIL(LENGTH(admdvs_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(admdvs_name) * 1/3))) END;
-- crter_id (person_name)
UPDATE ods_doc_suspt_d_df_ytai SET crter_id = CASE WHEN LENGTH(crter_id) <= 2 THEN CONCAT(SUBSTR(crter_id, 1, 1), '*') WHEN LENGTH(crter_id) <= 4 THEN CONCAT(SUBSTR(crter_id, 1, 2), '*') ELSE CONCAT(SUBSTR(crter_id, 1, CEIL(LENGTH(crter_id) * 2/3)), REPEAT('*', FLOOR(LENGTH(crter_id) * 1/3))) END;
-- crter_name (person_name)
UPDATE ods_doc_suspt_d_df_ytai SET crter_name = CASE WHEN LENGTH(crter_name) <= 2 THEN CONCAT(SUBSTR(crter_name, 1, 1), '*') WHEN LENGTH(crter_name) <= 4 THEN CONCAT(SUBSTR(crter_name, 1, 2), '*') ELSE CONCAT(SUBSTR(crter_name, 1, CEIL(LENGTH(crter_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(crter_name) * 1/3))) END;
-- crte_optins_no (org_name)
UPDATE ods_doc_suspt_d_df_ytai SET crte_optins_no = CASE WHEN LENGTH(crte_optins_no) <= 5 THEN CONCAT(SUBSTR(crte_optins_no, 1, 3), REPEAT('*', LENGTH(crte_optins_no) - 3)) ELSE CONCAT(SUBSTR(crte_optins_no, 1, CEIL(LENGTH(crte_optins_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(crte_optins_no) * 1/3))) END;
-- opter_id (person_name)
UPDATE ods_doc_suspt_d_df_ytai SET opter_id = CASE WHEN LENGTH(opter_id) <= 2 THEN CONCAT(SUBSTR(opter_id, 1, 1), '*') WHEN LENGTH(opter_id) <= 4 THEN CONCAT(SUBSTR(opter_id, 1, 2), '*') ELSE CONCAT(SUBSTR(opter_id, 1, CEIL(LENGTH(opter_id) * 2/3)), REPEAT('*', FLOOR(LENGTH(opter_id) * 1/3))) END;
-- opter_name (person_name)
UPDATE ods_doc_suspt_d_df_ytai SET opter_name = CASE WHEN LENGTH(opter_name) <= 2 THEN CONCAT(SUBSTR(opter_name, 1, 1), '*') WHEN LENGTH(opter_name) <= 4 THEN CONCAT(SUBSTR(opter_name, 1, 2), '*') ELSE CONCAT(SUBSTR(opter_name, 1, CEIL(LENGTH(opter_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(opter_name) * 1/3))) END;
-- optins_no (org_name)
UPDATE ods_doc_suspt_d_df_ytai SET optins_no = CASE WHEN LENGTH(optins_no) <= 5 THEN CONCAT(SUBSTR(optins_no, 1, 3), REPEAT('*', LENGTH(optins_no) - 3)) ELSE CONCAT(SUBSTR(optins_no, 1, CEIL(LENGTH(optins_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(optins_no) * 1/3))) END;
-- chker_name (person_name)
UPDATE ods_doc_suspt_d_df_ytai SET chker_name = CASE WHEN LENGTH(chker_name) <= 2 THEN CONCAT(SUBSTR(chker_name, 1, 1), '*') WHEN LENGTH(chker_name) <= 4 THEN CONCAT(SUBSTR(chker_name, 1, 2), '*') ELSE CONCAT(SUBSTR(chker_name, 1, CEIL(LENGTH(chker_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(chker_name) * 1/3))) END;
-- rchker_name (person_name)
UPDATE ods_doc_suspt_d_df_ytai SET rchker_name = CASE WHEN LENGTH(rchker_name) <= 2 THEN CONCAT(SUBSTR(rchker_name, 1, 1), '*') WHEN LENGTH(rchker_name) <= 4 THEN CONCAT(SUBSTR(rchker_name, 1, 2), '*') ELSE CONCAT(SUBSTR(rchker_name, 1, CEIL(LENGTH(rchker_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(rchker_name) * 1/3))) END;
-- finl_chker_name (person_name)
UPDATE ods_doc_suspt_d_df_ytai SET finl_chker_name = CASE WHEN LENGTH(finl_chker_name) <= 2 THEN CONCAT(SUBSTR(finl_chker_name, 1, 1), '*') WHEN LENGTH(finl_chker_name) <= 4 THEN CONCAT(SUBSTR(finl_chker_name, 1, 2), '*') ELSE CONCAT(SUBSTR(finl_chker_name, 1, CEIL(LENGTH(finl_chker_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(finl_chker_name) * 1/3))) END;
-- appy_clgl_psn_name (person_name)
UPDATE ods_doc_suspt_d_df_ytai SET appy_clgl_psn_name = CASE WHEN LENGTH(appy_clgl_psn_name) <= 2 THEN CONCAT(SUBSTR(appy_clgl_psn_name, 1, 1), '*') WHEN LENGTH(appy_clgl_psn_name) <= 4 THEN CONCAT(SUBSTR(appy_clgl_psn_name, 1, 2), '*') ELSE CONCAT(SUBSTR(appy_clgl_psn_name, 1, CEIL(LENGTH(appy_clgl_psn_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(appy_clgl_psn_name) * 1/3))) END;
-- appler_name (person_name)
UPDATE ods_doc_suspt_d_df_ytai SET appler_name = CASE WHEN LENGTH(appler_name) <= 2 THEN CONCAT(SUBSTR(appler_name, 1, 1), '*') WHEN LENGTH(appler_name) <= 4 THEN CONCAT(SUBSTR(appler_name, 1, 2), '*') ELSE CONCAT(SUBSTR(appler_name, 1, CEIL(LENGTH(appler_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(appler_name) * 1/3))) END;

-- 表: ods_doc_suspt_detl_d_df_ytai
-- admdvs_name (person_name)
UPDATE ods_doc_suspt_detl_d_df_ytai SET admdvs_name = CASE WHEN LENGTH(admdvs_name) <= 2 THEN CONCAT(SUBSTR(admdvs_name, 1, 1), '*') WHEN LENGTH(admdvs_name) <= 4 THEN CONCAT(SUBSTR(admdvs_name, 1, 2), '*') ELSE CONCAT(SUBSTR(admdvs_name, 1, CEIL(LENGTH(admdvs_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(admdvs_name) * 1/3))) END;
-- hilist_name (person_name)
UPDATE ods_doc_suspt_detl_d_df_ytai SET hilist_name = CASE WHEN LENGTH(hilist_name) <= 2 THEN CONCAT(SUBSTR(hilist_name, 1, 1), '*') WHEN LENGTH(hilist_name) <= 4 THEN CONCAT(SUBSTR(hilist_name, 1, 2), '*') ELSE CONCAT(SUBSTR(hilist_name, 1, CEIL(LENGTH(hilist_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(hilist_name) * 1/3))) END;
-- medins_list_codg (org_name)
UPDATE ods_doc_suspt_detl_d_df_ytai SET medins_list_codg = CASE WHEN LENGTH(medins_list_codg) <= 5 THEN CONCAT(SUBSTR(medins_list_codg, 1, 3), REPEAT('*', LENGTH(medins_list_codg) - 3)) ELSE CONCAT(SUBSTR(medins_list_codg, 1, CEIL(LENGTH(medins_list_codg) * 2/3)), REPEAT('*', FLOOR(LENGTH(medins_list_codg) * 1/3))) END;
-- medins_list_name (person_name)
UPDATE ods_doc_suspt_detl_d_df_ytai SET medins_list_name = CASE WHEN LENGTH(medins_list_name) <= 2 THEN CONCAT(SUBSTR(medins_list_name, 1, 1), '*') WHEN LENGTH(medins_list_name) <= 4 THEN CONCAT(SUBSTR(medins_list_name, 1, 2), '*') ELSE CONCAT(SUBSTR(medins_list_name, 1, CEIL(LENGTH(medins_list_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(medins_list_name) * 1/3))) END;
-- spec_unt (org_name)
UPDATE ods_doc_suspt_detl_d_df_ytai SET spec_unt = CASE WHEN LENGTH(spec_unt) <= 5 THEN CONCAT(SUBSTR(spec_unt, 1, 3), REPEAT('*', LENGTH(spec_unt) - 3)) ELSE CONCAT(SUBSTR(spec_unt, 1, CEIL(LENGTH(spec_unt) * 2/3)), REPEAT('*', FLOOR(LENGTH(spec_unt) * 1/3))) END;
-- drord_dr_codg (person_name)
UPDATE ods_doc_suspt_detl_d_df_ytai SET drord_dr_codg = CASE WHEN LENGTH(drord_dr_codg) <= 2 THEN CONCAT(SUBSTR(drord_dr_codg, 1, 1), '*') WHEN LENGTH(drord_dr_codg) <= 4 THEN CONCAT(SUBSTR(drord_dr_codg, 1, 2), '*') ELSE CONCAT(SUBSTR(drord_dr_codg, 1, CEIL(LENGTH(drord_dr_codg) * 2/3)), REPEAT('*', FLOOR(LENGTH(drord_dr_codg) * 1/3))) END;
-- drord_dr_name (person_name)
UPDATE ods_doc_suspt_detl_d_df_ytai SET drord_dr_name = CASE WHEN LENGTH(drord_dr_name) <= 2 THEN CONCAT(SUBSTR(drord_dr_name, 1, 1), '*') WHEN LENGTH(drord_dr_name) <= 4 THEN CONCAT(SUBSTR(drord_dr_name, 1, 2), '*') ELSE CONCAT(SUBSTR(drord_dr_name, 1, CEIL(LENGTH(drord_dr_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(drord_dr_name) * 1/3))) END;
-- mdtrtsn (medical_record)
UPDATE ods_doc_suspt_detl_d_df_ytai SET mdtrtsn = CASE WHEN LENGTH(mdtrtsn) <= 8 THEN CONCAT(SUBSTR(mdtrtsn, 1, 5), REPEAT('*', LENGTH(mdtrtsn) - 5)) ELSE CONCAT(SUBSTR(mdtrtsn, 1, CEIL(LENGTH(mdtrtsn) * 2/3)), REPEAT('*', FLOOR(LENGTH(mdtrtsn) * 1/3))) END;
-- crter_id (person_name)
UPDATE ods_doc_suspt_detl_d_df_ytai SET crter_id = CASE WHEN LENGTH(crter_id) <= 2 THEN CONCAT(SUBSTR(crter_id, 1, 1), '*') WHEN LENGTH(crter_id) <= 4 THEN CONCAT(SUBSTR(crter_id, 1, 2), '*') ELSE CONCAT(SUBSTR(crter_id, 1, CEIL(LENGTH(crter_id) * 2/3)), REPEAT('*', FLOOR(LENGTH(crter_id) * 1/3))) END;
-- crter_name (person_name)
UPDATE ods_doc_suspt_detl_d_df_ytai SET crter_name = CASE WHEN LENGTH(crter_name) <= 2 THEN CONCAT(SUBSTR(crter_name, 1, 1), '*') WHEN LENGTH(crter_name) <= 4 THEN CONCAT(SUBSTR(crter_name, 1, 2), '*') ELSE CONCAT(SUBSTR(crter_name, 1, CEIL(LENGTH(crter_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(crter_name) * 1/3))) END;
-- crte_optins_no (org_name)
UPDATE ods_doc_suspt_detl_d_df_ytai SET crte_optins_no = CASE WHEN LENGTH(crte_optins_no) <= 5 THEN CONCAT(SUBSTR(crte_optins_no, 1, 3), REPEAT('*', LENGTH(crte_optins_no) - 3)) ELSE CONCAT(SUBSTR(crte_optins_no, 1, CEIL(LENGTH(crte_optins_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(crte_optins_no) * 1/3))) END;
-- opter_id (person_name)
UPDATE ods_doc_suspt_detl_d_df_ytai SET opter_id = CASE WHEN LENGTH(opter_id) <= 2 THEN CONCAT(SUBSTR(opter_id, 1, 1), '*') WHEN LENGTH(opter_id) <= 4 THEN CONCAT(SUBSTR(opter_id, 1, 2), '*') ELSE CONCAT(SUBSTR(opter_id, 1, CEIL(LENGTH(opter_id) * 2/3)), REPEAT('*', FLOOR(LENGTH(opter_id) * 1/3))) END;
-- opter_name (person_name)
UPDATE ods_doc_suspt_detl_d_df_ytai SET opter_name = CASE WHEN LENGTH(opter_name) <= 2 THEN CONCAT(SUBSTR(opter_name, 1, 1), '*') WHEN LENGTH(opter_name) <= 4 THEN CONCAT(SUBSTR(opter_name, 1, 2), '*') ELSE CONCAT(SUBSTR(opter_name, 1, CEIL(LENGTH(opter_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(opter_name) * 1/3))) END;
-- optins_no (org_name)
UPDATE ods_doc_suspt_detl_d_df_ytai SET optins_no = CASE WHEN LENGTH(optins_no) <= 5 THEN CONCAT(SUBSTR(optins_no, 1, 3), REPEAT('*', LENGTH(optins_no) - 3)) ELSE CONCAT(SUBSTR(optins_no, 1, CEIL(LENGTH(optins_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(optins_no) * 1/3))) END;
-- bilg_dept_name (person_name)
UPDATE ods_doc_suspt_detl_d_df_ytai SET bilg_dept_name = CASE WHEN LENGTH(bilg_dept_name) <= 2 THEN CONCAT(SUBSTR(bilg_dept_name, 1, 1), '*') WHEN LENGTH(bilg_dept_name) <= 4 THEN CONCAT(SUBSTR(bilg_dept_name, 1, 2), '*') ELSE CONCAT(SUBSTR(bilg_dept_name, 1, CEIL(LENGTH(bilg_dept_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(bilg_dept_name) * 1/3))) END;

-- 表: ods_fee_list_d_hilist_name_di_ytai
-- hilist_name (person_name)
UPDATE ods_fee_list_d_hilist_name_di_ytai SET hilist_name = CASE WHEN LENGTH(hilist_name) <= 2 THEN CONCAT(SUBSTR(hilist_name, 1, 1), '*') WHEN LENGTH(hilist_name) <= 4 THEN CONCAT(SUBSTR(hilist_name, 1, 2), '*') ELSE CONCAT(SUBSTR(hilist_name, 1, CEIL(LENGTH(hilist_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(hilist_name) * 1/3))) END;

-- 表: ods_intlgsupn_rule_d_df_ytai
-- admdvs_name (person_name)
UPDATE ods_intlgsupn_rule_d_df_ytai SET admdvs_name = CASE WHEN LENGTH(admdvs_name) <= 2 THEN CONCAT(SUBSTR(admdvs_name, 1, 1), '*') WHEN LENGTH(admdvs_name) <= 4 THEN CONCAT(SUBSTR(admdvs_name, 1, 2), '*') ELSE CONCAT(SUBSTR(admdvs_name, 1, CEIL(LENGTH(admdvs_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(admdvs_name) * 1/3))) END;
-- rule_name (person_name)
UPDATE ods_intlgsupn_rule_d_df_ytai SET rule_name = CASE WHEN LENGTH(rule_name) <= 2 THEN CONCAT(SUBSTR(rule_name, 1, 1), '*') WHEN LENGTH(rule_name) <= 4 THEN CONCAT(SUBSTR(rule_name, 1, 2), '*') ELSE CONCAT(SUBSTR(rule_name, 1, CEIL(LENGTH(rule_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(rule_name) * 1/3))) END;
-- vola_qual_name (person_name)
UPDATE ods_intlgsupn_rule_d_df_ytai SET vola_qual_name = CASE WHEN LENGTH(vola_qual_name) <= 2 THEN CONCAT(SUBSTR(vola_qual_name, 1, 1), '*') WHEN LENGTH(vola_qual_name) <= 4 THEN CONCAT(SUBSTR(vola_qual_name, 1, 2), '*') ELSE CONCAT(SUBSTR(vola_qual_name, 1, CEIL(LENGTH(vola_qual_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(vola_qual_name) * 1/3))) END;
-- crter_id (person_name)
UPDATE ods_intlgsupn_rule_d_df_ytai SET crter_id = CASE WHEN LENGTH(crter_id) <= 2 THEN CONCAT(SUBSTR(crter_id, 1, 1), '*') WHEN LENGTH(crter_id) <= 4 THEN CONCAT(SUBSTR(crter_id, 1, 2), '*') ELSE CONCAT(SUBSTR(crter_id, 1, CEIL(LENGTH(crter_id) * 2/3)), REPEAT('*', FLOOR(LENGTH(crter_id) * 1/3))) END;
-- crter_name (person_name)
UPDATE ods_intlgsupn_rule_d_df_ytai SET crter_name = CASE WHEN LENGTH(crter_name) <= 2 THEN CONCAT(SUBSTR(crter_name, 1, 1), '*') WHEN LENGTH(crter_name) <= 4 THEN CONCAT(SUBSTR(crter_name, 1, 2), '*') ELSE CONCAT(SUBSTR(crter_name, 1, CEIL(LENGTH(crter_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(crter_name) * 1/3))) END;
-- crte_optins_no (org_name)
UPDATE ods_intlgsupn_rule_d_df_ytai SET crte_optins_no = CASE WHEN LENGTH(crte_optins_no) <= 5 THEN CONCAT(SUBSTR(crte_optins_no, 1, 3), REPEAT('*', LENGTH(crte_optins_no) - 3)) ELSE CONCAT(SUBSTR(crte_optins_no, 1, CEIL(LENGTH(crte_optins_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(crte_optins_no) * 1/3))) END;
-- opter_id (person_name)
UPDATE ods_intlgsupn_rule_d_df_ytai SET opter_id = CASE WHEN LENGTH(opter_id) <= 2 THEN CONCAT(SUBSTR(opter_id, 1, 1), '*') WHEN LENGTH(opter_id) <= 4 THEN CONCAT(SUBSTR(opter_id, 1, 2), '*') ELSE CONCAT(SUBSTR(opter_id, 1, CEIL(LENGTH(opter_id) * 2/3)), REPEAT('*', FLOOR(LENGTH(opter_id) * 1/3))) END;
-- opter_name (person_name)
UPDATE ods_intlgsupn_rule_d_df_ytai SET opter_name = CASE WHEN LENGTH(opter_name) <= 2 THEN CONCAT(SUBSTR(opter_name, 1, 1), '*') WHEN LENGTH(opter_name) <= 4 THEN CONCAT(SUBSTR(opter_name, 1, 2), '*') ELSE CONCAT(SUBSTR(opter_name, 1, CEIL(LENGTH(opter_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(opter_name) * 1/3))) END;
-- optins_no (org_name)
UPDATE ods_intlgsupn_rule_d_df_ytai SET optins_no = CASE WHEN LENGTH(optins_no) <= 5 THEN CONCAT(SUBSTR(optins_no, 1, 3), REPEAT('*', LENGTH(optins_no) - 3)) ELSE CONCAT(SUBSTR(optins_no, 1, CEIL(LENGTH(optins_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(optins_no) * 1/3))) END;

-- 表: ods_metadata_assets_column_mi_ytai
-- TABNAME (person_name)
UPDATE ods_metadata_assets_column_mi_ytai SET TABNAME = CASE WHEN LENGTH(TABNAME) <= 2 THEN CONCAT(SUBSTR(TABNAME, 1, 1), '*') WHEN LENGTH(TABNAME) <= 4 THEN CONCAT(SUBSTR(TABNAME, 1, 2), '*') ELSE CONCAT(SUBSTR(TABNAME, 1, CEIL(LENGTH(TABNAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(TABNAME) * 1/3))) END;

-- 表: ods_metadata_assets_table_mi_ytai
-- TABNAME (person_name)
UPDATE ods_metadata_assets_table_mi_ytai SET TABNAME = CASE WHEN LENGTH(TABNAME) <= 2 THEN CONCAT(SUBSTR(TABNAME, 1, 1), '*') WHEN LENGTH(TABNAME) <= 4 THEN CONCAT(SUBSTR(TABNAME, 1, 2), '*') ELSE CONCAT(SUBSTR(TABNAME, 1, CEIL(LENGTH(TABNAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(TABNAME) * 1/3))) END;

-- 表: oss_file_uploads
-- filename (person_name)
UPDATE oss_file_uploads SET filename = CASE WHEN LENGTH(filename) <= 2 THEN CONCAT(SUBSTR(filename, 1, 1), '*') WHEN LENGTH(filename) <= 4 THEN CONCAT(SUBSTR(filename, 1, 2), '*') ELSE CONCAT(SUBSTR(filename, 1, CEIL(LENGTH(filename) * 2/3)), REPEAT('*', FLOOR(LENGTH(filename) * 1/3))) END;
-- stog_addr (address)
UPDATE oss_file_uploads SET stog_addr = CASE WHEN LENGTH(stog_addr) <= 10 THEN CONCAT(SUBSTR(stog_addr, 1, 7), REPEAT('*', LENGTH(stog_addr) - 7)) ELSE CONCAT(SUBSTR(stog_addr, 1, CEIL(LENGTH(stog_addr) * 2/3)), REPEAT('*', FLOOR(LENGTH(stog_addr) * 1/3))) END;
-- crter_id (person_name)
UPDATE oss_file_uploads SET crter_id = CASE WHEN LENGTH(crter_id) <= 2 THEN CONCAT(SUBSTR(crter_id, 1, 1), '*') WHEN LENGTH(crter_id) <= 4 THEN CONCAT(SUBSTR(crter_id, 1, 2), '*') ELSE CONCAT(SUBSTR(crter_id, 1, CEIL(LENGTH(crter_id) * 2/3)), REPEAT('*', FLOOR(LENGTH(crter_id) * 1/3))) END;
-- crter_name (person_name)
UPDATE oss_file_uploads SET crter_name = CASE WHEN LENGTH(crter_name) <= 2 THEN CONCAT(SUBSTR(crter_name, 1, 1), '*') WHEN LENGTH(crter_name) <= 4 THEN CONCAT(SUBSTR(crter_name, 1, 2), '*') ELSE CONCAT(SUBSTR(crter_name, 1, CEIL(LENGTH(crter_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(crter_name) * 1/3))) END;
-- crte_optins_no (org_name)
UPDATE oss_file_uploads SET crte_optins_no = CASE WHEN LENGTH(crte_optins_no) <= 5 THEN CONCAT(SUBSTR(crte_optins_no, 1, 3), REPEAT('*', LENGTH(crte_optins_no) - 3)) ELSE CONCAT(SUBSTR(crte_optins_no, 1, CEIL(LENGTH(crte_optins_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(crte_optins_no) * 1/3))) END;
-- opter_id (person_name)
UPDATE oss_file_uploads SET opter_id = CASE WHEN LENGTH(opter_id) <= 2 THEN CONCAT(SUBSTR(opter_id, 1, 1), '*') WHEN LENGTH(opter_id) <= 4 THEN CONCAT(SUBSTR(opter_id, 1, 2), '*') ELSE CONCAT(SUBSTR(opter_id, 1, CEIL(LENGTH(opter_id) * 2/3)), REPEAT('*', FLOOR(LENGTH(opter_id) * 1/3))) END;
-- opter_name (person_name)
UPDATE oss_file_uploads SET opter_name = CASE WHEN LENGTH(opter_name) <= 2 THEN CONCAT(SUBSTR(opter_name, 1, 1), '*') WHEN LENGTH(opter_name) <= 4 THEN CONCAT(SUBSTR(opter_name, 1, 2), '*') ELSE CONCAT(SUBSTR(opter_name, 1, CEIL(LENGTH(opter_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(opter_name) * 1/3))) END;
-- optins_no (org_name)
UPDATE oss_file_uploads SET optins_no = CASE WHEN LENGTH(optins_no) <= 5 THEN CONCAT(SUBSTR(optins_no, 1, 3), REPEAT('*', LENGTH(optins_no) - 3)) ELSE CONCAT(SUBSTR(optins_no, 1, CEIL(LENGTH(optins_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(optins_no) * 1/3))) END;

-- 表: otp_bigscreen_test
-- hosp_lv (org_name)
UPDATE otp_bigscreen_test SET hosp_lv = CASE WHEN LENGTH(hosp_lv) <= 5 THEN CONCAT(SUBSTR(hosp_lv, 1, 3), REPEAT('*', LENGTH(hosp_lv) - 3)) ELSE CONCAT(SUBSTR(hosp_lv, 1, CEIL(LENGTH(hosp_lv) * 2/3)), REPEAT('*', FLOOR(LENGTH(hosp_lv) * 1/3))) END;

-- 表: out_appy_d
-- PSN_NO (person_id)
UPDATE out_appy_d SET PSN_NO = CASE WHEN LENGTH(PSN_NO) <= 8 THEN CONCAT(SUBSTR(PSN_NO, 1, 5), REPEAT('*', LENGTH(PSN_NO) - 5)) ELSE CONCAT(SUBSTR(PSN_NO, 1, CEIL(LENGTH(PSN_NO) * 2/3)), REPEAT('*', FLOOR(LENGTH(PSN_NO) * 1/3))) END;
-- CERTNO (id_card)
UPDATE out_appy_d SET CERTNO = CASE WHEN LENGTH(CERTNO) <= 10 THEN CONCAT(SUBSTR(CERTNO, 1, 7), REPEAT('*', LENGTH(CERTNO) - 7)) ELSE CONCAT(SUBSTR(CERTNO, 1, CEIL(LENGTH(CERTNO) * 2/3)), REPEAT('*', FLOOR(LENGTH(CERTNO) * 1/3))) END;
-- PSN_NAME (person_name)
UPDATE out_appy_d SET PSN_NAME = CASE WHEN LENGTH(PSN_NAME) <= 2 THEN CONCAT(SUBSTR(PSN_NAME, 1, 1), '*') WHEN LENGTH(PSN_NAME) <= 4 THEN CONCAT(SUBSTR(PSN_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(PSN_NAME, 1, CEIL(LENGTH(PSN_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(PSN_NAME) * 1/3))) END;
-- TEL (phone)
UPDATE out_appy_d SET TEL = CASE WHEN LENGTH(TEL) <= 8 THEN CONCAT(SUBSTR(TEL, 1, 5), REPEAT('*', LENGTH(TEL) - 5)) ELSE CONCAT(SUBSTR(TEL, 1, CEIL(LENGTH(TEL) * 2/3)), REPEAT('*', FLOOR(LENGTH(TEL) * 1/3))) END;
-- EMP_NO (org_name)
UPDATE out_appy_d SET EMP_NO = CASE WHEN LENGTH(EMP_NO) <= 5 THEN CONCAT(SUBSTR(EMP_NO, 1, 3), REPEAT('*', LENGTH(EMP_NO) - 3)) ELSE CONCAT(SUBSTR(EMP_NO, 1, CEIL(LENGTH(EMP_NO) * 2/3)), REPEAT('*', FLOOR(LENGTH(EMP_NO) * 1/3))) END;
-- EMP_NAME (person_name)
UPDATE out_appy_d SET EMP_NAME = CASE WHEN LENGTH(EMP_NAME) <= 2 THEN CONCAT(SUBSTR(EMP_NAME, 1, 1), '*') WHEN LENGTH(EMP_NAME) <= 4 THEN CONCAT(SUBSTR(EMP_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(EMP_NAME, 1, CEIL(LENGTH(EMP_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(EMP_NAME) * 1/3))) END;
-- RLOC_HSORG_NAME (person_name)
UPDATE out_appy_d SET RLOC_HSORG_NAME = CASE WHEN LENGTH(RLOC_HSORG_NAME) <= 2 THEN CONCAT(SUBSTR(RLOC_HSORG_NAME, 1, 1), '*') WHEN LENGTH(RLOC_HSORG_NAME) <= 4 THEN CONCAT(SUBSTR(RLOC_HSORG_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(RLOC_HSORG_NAME, 1, CEIL(LENGTH(RLOC_HSORG_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(RLOC_HSORG_NAME) * 1/3))) END;
-- RLOC_HSORG_CONER (org_name)
UPDATE out_appy_d SET RLOC_HSORG_CONER = CASE WHEN LENGTH(RLOC_HSORG_CONER) <= 5 THEN CONCAT(SUBSTR(RLOC_HSORG_CONER, 1, 3), REPEAT('*', LENGTH(RLOC_HSORG_CONER) - 3)) ELSE CONCAT(SUBSTR(RLOC_HSORG_CONER, 1, CEIL(LENGTH(RLOC_HSORG_CONER) * 2/3)), REPEAT('*', FLOOR(LENGTH(RLOC_HSORG_CONER) * 1/3))) END;
-- RLOC_HSORG_TEL (phone)
UPDATE out_appy_d SET RLOC_HSORG_TEL = CASE WHEN LENGTH(RLOC_HSORG_TEL) <= 8 THEN CONCAT(SUBSTR(RLOC_HSORG_TEL, 1, 5), REPEAT('*', LENGTH(RLOC_HSORG_TEL) - 5)) ELSE CONCAT(SUBSTR(RLOC_HSORG_TEL, 1, CEIL(LENGTH(RLOC_HSORG_TEL) * 2/3)), REPEAT('*', FLOOR(LENGTH(RLOC_HSORG_TEL) * 1/3))) END;
-- RESOUT_ADDR (address)
UPDATE out_appy_d SET RESOUT_ADDR = CASE WHEN LENGTH(RESOUT_ADDR) <= 10 THEN CONCAT(SUBSTR(RESOUT_ADDR, 1, 7), REPEAT('*', LENGTH(RESOUT_ADDR) - 7)) ELSE CONCAT(SUBSTR(RESOUT_ADDR, 1, CEIL(LENGTH(RESOUT_ADDR) * 2/3)), REPEAT('*', FLOOR(LENGTH(RESOUT_ADDR) * 1/3))) END;
-- AGNTER_NAME (person_name)
UPDATE out_appy_d SET AGNTER_NAME = CASE WHEN LENGTH(AGNTER_NAME) <= 2 THEN CONCAT(SUBSTR(AGNTER_NAME, 1, 1), '*') WHEN LENGTH(AGNTER_NAME) <= 4 THEN CONCAT(SUBSTR(AGNTER_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(AGNTER_NAME, 1, CEIL(LENGTH(AGNTER_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(AGNTER_NAME) * 1/3))) END;
-- AGNTER_CERTNO (id_card)
UPDATE out_appy_d SET AGNTER_CERTNO = CASE WHEN LENGTH(AGNTER_CERTNO) <= 10 THEN CONCAT(SUBSTR(AGNTER_CERTNO, 1, 7), REPEAT('*', LENGTH(AGNTER_CERTNO) - 7)) ELSE CONCAT(SUBSTR(AGNTER_CERTNO, 1, CEIL(LENGTH(AGNTER_CERTNO) * 2/3)), REPEAT('*', FLOOR(LENGTH(AGNTER_CERTNO) * 1/3))) END;
-- AGNTER_TEL (phone)
UPDATE out_appy_d SET AGNTER_TEL = CASE WHEN LENGTH(AGNTER_TEL) <= 8 THEN CONCAT(SUBSTR(AGNTER_TEL, 1, 5), REPEAT('*', LENGTH(AGNTER_TEL) - 5)) ELSE CONCAT(SUBSTR(AGNTER_TEL, 1, CEIL(LENGTH(AGNTER_TEL) * 2/3)), REPEAT('*', FLOOR(LENGTH(AGNTER_TEL) * 1/3))) END;
-- AGNTER_ADDR (address)
UPDATE out_appy_d SET AGNTER_ADDR = CASE WHEN LENGTH(AGNTER_ADDR) <= 10 THEN CONCAT(SUBSTR(AGNTER_ADDR, 1, 7), REPEAT('*', LENGTH(AGNTER_ADDR) - 7)) ELSE CONCAT(SUBSTR(AGNTER_ADDR, 1, CEIL(LENGTH(AGNTER_ADDR) * 2/3)), REPEAT('*', FLOOR(LENGTH(AGNTER_ADDR) * 1/3))) END;
-- CRTER_ID (person_name)
UPDATE out_appy_d SET CRTER_ID = CASE WHEN LENGTH(CRTER_ID) <= 2 THEN CONCAT(SUBSTR(CRTER_ID, 1, 1), '*') WHEN LENGTH(CRTER_ID) <= 4 THEN CONCAT(SUBSTR(CRTER_ID, 1, 2), '*') ELSE CONCAT(SUBSTR(CRTER_ID, 1, CEIL(LENGTH(CRTER_ID) * 2/3)), REPEAT('*', FLOOR(LENGTH(CRTER_ID) * 1/3))) END;
-- CRTER_NAME (person_name)
UPDATE out_appy_d SET CRTER_NAME = CASE WHEN LENGTH(CRTER_NAME) <= 2 THEN CONCAT(SUBSTR(CRTER_NAME, 1, 1), '*') WHEN LENGTH(CRTER_NAME) <= 4 THEN CONCAT(SUBSTR(CRTER_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(CRTER_NAME, 1, CEIL(LENGTH(CRTER_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(CRTER_NAME) * 1/3))) END;
-- CRTE_OPTINS_NO (org_name)
UPDATE out_appy_d SET CRTE_OPTINS_NO = CASE WHEN LENGTH(CRTE_OPTINS_NO) <= 5 THEN CONCAT(SUBSTR(CRTE_OPTINS_NO, 1, 3), REPEAT('*', LENGTH(CRTE_OPTINS_NO) - 3)) ELSE CONCAT(SUBSTR(CRTE_OPTINS_NO, 1, CEIL(LENGTH(CRTE_OPTINS_NO) * 2/3)), REPEAT('*', FLOOR(LENGTH(CRTE_OPTINS_NO) * 1/3))) END;
-- OPTER_ID (person_name)
UPDATE out_appy_d SET OPTER_ID = CASE WHEN LENGTH(OPTER_ID) <= 2 THEN CONCAT(SUBSTR(OPTER_ID, 1, 1), '*') WHEN LENGTH(OPTER_ID) <= 4 THEN CONCAT(SUBSTR(OPTER_ID, 1, 2), '*') ELSE CONCAT(SUBSTR(OPTER_ID, 1, CEIL(LENGTH(OPTER_ID) * 2/3)), REPEAT('*', FLOOR(LENGTH(OPTER_ID) * 1/3))) END;
-- OPTER_NAME (person_name)
UPDATE out_appy_d SET OPTER_NAME = CASE WHEN LENGTH(OPTER_NAME) <= 2 THEN CONCAT(SUBSTR(OPTER_NAME, 1, 1), '*') WHEN LENGTH(OPTER_NAME) <= 4 THEN CONCAT(SUBSTR(OPTER_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(OPTER_NAME, 1, CEIL(LENGTH(OPTER_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(OPTER_NAME) * 1/3))) END;
-- OPTINS_NO (org_name)
UPDATE out_appy_d SET OPTINS_NO = CASE WHEN LENGTH(OPTINS_NO) <= 5 THEN CONCAT(SUBSTR(OPTINS_NO, 1, 3), REPEAT('*', LENGTH(OPTINS_NO) - 3)) ELSE CONCAT(SUBSTR(OPTINS_NO, 1, CEIL(LENGTH(OPTINS_NO) * 2/3)), REPEAT('*', FLOOR(LENGTH(OPTINS_NO) * 1/3))) END;
-- TRAFOUT_FIXMEDINS_CODE (org_name)
UPDATE out_appy_d SET TRAFOUT_FIXMEDINS_CODE = CASE WHEN LENGTH(TRAFOUT_FIXMEDINS_CODE) <= 5 THEN CONCAT(SUBSTR(TRAFOUT_FIXMEDINS_CODE, 1, 3), REPEAT('*', LENGTH(TRAFOUT_FIXMEDINS_CODE) - 3)) ELSE CONCAT(SUBSTR(TRAFOUT_FIXMEDINS_CODE, 1, CEIL(LENGTH(TRAFOUT_FIXMEDINS_CODE) * 2/3)), REPEAT('*', FLOOR(LENGTH(TRAFOUT_FIXMEDINS_CODE) * 1/3))) END;
-- TRAFOUT_FIXMEDINS_NAME (person_name)
UPDATE out_appy_d SET TRAFOUT_FIXMEDINS_NAME = CASE WHEN LENGTH(TRAFOUT_FIXMEDINS_NAME) <= 2 THEN CONCAT(SUBSTR(TRAFOUT_FIXMEDINS_NAME, 1, 1), '*') WHEN LENGTH(TRAFOUT_FIXMEDINS_NAME) <= 4 THEN CONCAT(SUBSTR(TRAFOUT_FIXMEDINS_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(TRAFOUT_FIXMEDINS_NAME, 1, CEIL(LENGTH(TRAFOUT_FIXMEDINS_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(TRAFOUT_FIXMEDINS_NAME) * 1/3))) END;
-- ACCTNAME (person_name)
UPDATE out_appy_d SET ACCTNAME = CASE WHEN LENGTH(ACCTNAME) <= 2 THEN CONCAT(SUBSTR(ACCTNAME, 1, 1), '*') WHEN LENGTH(ACCTNAME) <= 4 THEN CONCAT(SUBSTR(ACCTNAME, 1, 2), '*') ELSE CONCAT(SUBSTR(ACCTNAME, 1, CEIL(LENGTH(ACCTNAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(ACCTNAME) * 1/3))) END;
-- IDX_out_appy_dCERTNO (id_card)
UPDATE out_appy_d SET IDX_out_appy_dCERTNO = CASE WHEN LENGTH(IDX_out_appy_dCERTNO) <= 10 THEN CONCAT(SUBSTR(IDX_out_appy_dCERTNO, 1, 7), REPEAT('*', LENGTH(IDX_out_appy_dCERTNO) - 7)) ELSE CONCAT(SUBSTR(IDX_out_appy_dCERTNO, 1, CEIL(LENGTH(IDX_out_appy_dCERTNO) * 2/3)), REPEAT('*', FLOOR(LENGTH(IDX_out_appy_dCERTNO) * 1/3))) END;

-- 表: panel
-- comt_name (person_name)
UPDATE panel SET comt_name = CASE WHEN LENGTH(comt_name) <= 2 THEN CONCAT(SUBSTR(comt_name, 1, 1), '*') WHEN LENGTH(comt_name) <= 4 THEN CONCAT(SUBSTR(comt_name, 1, 2), '*') ELSE CONCAT(SUBSTR(comt_name, 1, CEIL(LENGTH(comt_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(comt_name) * 1/3))) END;

-- 表: psn_info_b
-- mob (phone)
UPDATE psn_info_b SET mob = CASE WHEN LENGTH(mob) <= 8 THEN CONCAT(SUBSTR(mob, 1, 5), REPEAT('*', LENGTH(mob) - 5)) ELSE CONCAT(SUBSTR(mob, 1, CEIL(LENGTH(mob) * 2/3)), REPEAT('*', FLOOR(LENGTH(mob) * 1/3))) END;
-- psn_no (person_id)
UPDATE psn_info_b SET psn_no = CASE WHEN LENGTH(psn_no) <= 8 THEN CONCAT(SUBSTR(psn_no, 1, 5), REPEAT('*', LENGTH(psn_no) - 5)) ELSE CONCAT(SUBSTR(psn_no, 1, CEIL(LENGTH(psn_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(psn_no) * 1/3))) END;
-- psn_name (person_name)
UPDATE psn_info_b SET psn_name = CASE WHEN LENGTH(psn_name) <= 2 THEN CONCAT(SUBSTR(psn_name, 1, 1), '*') WHEN LENGTH(psn_name) <= 4 THEN CONCAT(SUBSTR(psn_name, 1, 2), '*') ELSE CONCAT(SUBSTR(psn_name, 1, CEIL(LENGTH(psn_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(psn_name) * 1/3))) END;
-- certno (id_card)
UPDATE psn_info_b SET certno = CASE WHEN LENGTH(certno) <= 10 THEN CONCAT(SUBSTR(certno, 1, 7), REPEAT('*', LENGTH(certno) - 7)) ELSE CONCAT(SUBSTR(certno, 1, CEIL(LENGTH(certno) * 2/3)), REPEAT('*', FLOOR(LENGTH(certno) * 1/3))) END;
-- tel (phone)
UPDATE psn_info_b SET tel = CASE WHEN LENGTH(tel) <= 8 THEN CONCAT(SUBSTR(tel, 1, 5), REPEAT('*', LENGTH(tel) - 5)) ELSE CONCAT(SUBSTR(tel, 1, CEIL(LENGTH(tel) * 2/3)), REPEAT('*', FLOOR(LENGTH(tel) * 1/3))) END;
-- resd_loc_admdvs (address)
UPDATE psn_info_b SET resd_loc_admdvs = CASE WHEN LENGTH(resd_loc_admdvs) <= 10 THEN CONCAT(SUBSTR(resd_loc_admdvs, 1, 7), REPEAT('*', LENGTH(resd_loc_admdvs) - 7)) ELSE CONCAT(SUBSTR(resd_loc_admdvs, 1, CEIL(LENGTH(resd_loc_admdvs) * 2/3)), REPEAT('*', FLOOR(LENGTH(resd_loc_admdvs) * 1/3))) END;
-- hsreg_addr (address)
UPDATE psn_info_b SET hsreg_addr = CASE WHEN LENGTH(hsreg_addr) <= 10 THEN CONCAT(SUBSTR(hsreg_addr, 1, 7), REPEAT('*', LENGTH(hsreg_addr) - 7)) ELSE CONCAT(SUBSTR(hsreg_addr, 1, CEIL(LENGTH(hsreg_addr) * 2/3)), REPEAT('*', FLOOR(LENGTH(hsreg_addr) * 1/3))) END;
-- hsreg_addr_poscode (address)
UPDATE psn_info_b SET hsreg_addr_poscode = CASE WHEN LENGTH(hsreg_addr_poscode) <= 10 THEN CONCAT(SUBSTR(hsreg_addr_poscode, 1, 7), REPEAT('*', LENGTH(hsreg_addr_poscode) - 7)) ELSE CONCAT(SUBSTR(hsreg_addr_poscode, 1, CEIL(LENGTH(hsreg_addr_poscode) * 2/3)), REPEAT('*', FLOOR(LENGTH(hsreg_addr_poscode) * 1/3))) END;
-- live_admdvs (address)
UPDATE psn_info_b SET live_admdvs = CASE WHEN LENGTH(live_admdvs) <= 10 THEN CONCAT(SUBSTR(live_admdvs, 1, 7), REPEAT('*', LENGTH(live_admdvs) - 7)) ELSE CONCAT(SUBSTR(live_admdvs, 1, CEIL(LENGTH(live_admdvs) * 2/3)), REPEAT('*', FLOOR(LENGTH(live_admdvs) * 1/3))) END;
-- live_addr (address)
UPDATE psn_info_b SET live_addr = CASE WHEN LENGTH(live_addr) <= 10 THEN CONCAT(SUBSTR(live_addr, 1, 7), REPEAT('*', LENGTH(live_addr) - 7)) ELSE CONCAT(SUBSTR(live_addr, 1, CEIL(LENGTH(live_addr) * 2/3)), REPEAT('*', FLOOR(LENGTH(live_addr) * 1/3))) END;
-- live_addr_poscode (address)
UPDATE psn_info_b SET live_addr_poscode = CASE WHEN LENGTH(live_addr_poscode) <= 10 THEN CONCAT(SUBSTR(live_addr_poscode, 1, 7), REPEAT('*', LENGTH(live_addr_poscode) - 7)) ELSE CONCAT(SUBSTR(live_addr_poscode, 1, CEIL(LENGTH(live_addr_poscode) * 2/3)), REPEAT('*', FLOOR(LENGTH(live_addr_poscode) * 1/3))) END;
-- resdbook_no (address)
UPDATE psn_info_b SET resdbook_no = CASE WHEN LENGTH(resdbook_no) <= 10 THEN CONCAT(SUBSTR(resdbook_no, 1, 7), REPEAT('*', LENGTH(resdbook_no) - 7)) ELSE CONCAT(SUBSTR(resdbook_no, 1, CEIL(LENGTH(resdbook_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(resdbook_no) * 1/3))) END;
-- crter_name (person_name)
UPDATE psn_info_b SET crter_name = CASE WHEN LENGTH(crter_name) <= 2 THEN CONCAT(SUBSTR(crter_name, 1, 1), '*') WHEN LENGTH(crter_name) <= 4 THEN CONCAT(SUBSTR(crter_name, 1, 2), '*') ELSE CONCAT(SUBSTR(crter_name, 1, CEIL(LENGTH(crter_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(crter_name) * 1/3))) END;
-- opter_name (person_name)
UPDATE psn_info_b SET opter_name = CASE WHEN LENGTH(opter_name) <= 2 THEN CONCAT(SUBSTR(opter_name, 1, 1), '*') WHEN LENGTH(opter_name) <= 4 THEN CONCAT(SUBSTR(opter_name, 1, 2), '*') ELSE CONCAT(SUBSTR(opter_name, 1, CEIL(LENGTH(opter_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(opter_name) * 1/3))) END;

-- 表: query
-- spring_bean_name (person_name)
UPDATE query SET spring_bean_name = CASE WHEN LENGTH(spring_bean_name) <= 2 THEN CONCAT(SUBSTR(spring_bean_name, 1, 1), '*') WHEN LENGTH(spring_bean_name) <= 4 THEN CONCAT(SUBSTR(spring_bean_name, 1, 2), '*') ELSE CONCAT(SUBSTR(spring_bean_name, 1, CEIL(LENGTH(spring_bean_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(spring_bean_name) * 1/3))) END;

-- 表: setl_d_day
-- fixmedins_name (person_name)
UPDATE setl_d_day SET fixmedins_name = CASE WHEN LENGTH(fixmedins_name) <= 2 THEN CONCAT(SUBSTR(fixmedins_name, 1, 1), '*') WHEN LENGTH(fixmedins_name) <= 4 THEN CONCAT(SUBSTR(fixmedins_name, 1, 2), '*') ELSE CONCAT(SUBSTR(fixmedins_name, 1, CEIL(LENGTH(fixmedins_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_name) * 1/3))) END;
-- dise_name (person_name)
UPDATE setl_d_day SET dise_name = CASE WHEN LENGTH(dise_name) <= 2 THEN CONCAT(SUBSTR(dise_name, 1, 1), '*') WHEN LENGTH(dise_name) <= 4 THEN CONCAT(SUBSTR(dise_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dise_name, 1, CEIL(LENGTH(dise_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dise_name) * 1/3))) END;

-- 表: setl_d_realtime_ytai
-- clr_optins (org_name)
UPDATE setl_d_realtime_ytai SET clr_optins = CASE WHEN LENGTH(clr_optins) <= 5 THEN CONCAT(SUBSTR(clr_optins, 1, 3), REPEAT('*', LENGTH(clr_optins) - 3)) ELSE CONCAT(SUBSTR(clr_optins, 1, CEIL(LENGTH(clr_optins) * 2/3)), REPEAT('*', FLOOR(LENGTH(clr_optins) * 1/3))) END;
-- medins_setl_id (org_name)
UPDATE setl_d_realtime_ytai SET medins_setl_id = CASE WHEN LENGTH(medins_setl_id) <= 5 THEN CONCAT(SUBSTR(medins_setl_id, 1, 3), REPEAT('*', LENGTH(medins_setl_id) - 3)) ELSE CONCAT(SUBSTR(medins_setl_id, 1, CEIL(LENGTH(medins_setl_id) * 2/3)), REPEAT('*', FLOOR(LENGTH(medins_setl_id) * 1/3))) END;
-- mdtrt_id (medical_record)
UPDATE setl_d_realtime_ytai SET mdtrt_id = CASE WHEN LENGTH(mdtrt_id) <= 8 THEN CONCAT(SUBSTR(mdtrt_id, 1, 5), REPEAT('*', LENGTH(mdtrt_id) - 5)) ELSE CONCAT(SUBSTR(mdtrt_id, 1, CEIL(LENGTH(mdtrt_id) * 2/3)), REPEAT('*', FLOOR(LENGTH(mdtrt_id) * 1/3))) END;
-- psn_no (person_id)
UPDATE setl_d_realtime_ytai SET psn_no = CASE WHEN LENGTH(psn_no) <= 8 THEN CONCAT(SUBSTR(psn_no, 1, 5), REPEAT('*', LENGTH(psn_no) - 5)) ELSE CONCAT(SUBSTR(psn_no, 1, CEIL(LENGTH(psn_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(psn_no) * 1/3))) END;
-- psn_name (person_name)
UPDATE setl_d_realtime_ytai SET psn_name = CASE WHEN LENGTH(psn_name) <= 2 THEN CONCAT(SUBSTR(psn_name, 1, 1), '*') WHEN LENGTH(psn_name) <= 4 THEN CONCAT(SUBSTR(psn_name, 1, 2), '*') ELSE CONCAT(SUBSTR(psn_name, 1, CEIL(LENGTH(psn_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(psn_name) * 1/3))) END;
-- certno (id_card)
UPDATE setl_d_realtime_ytai SET certno = CASE WHEN LENGTH(certno) <= 10 THEN CONCAT(SUBSTR(certno, 1, 7), REPEAT('*', LENGTH(certno) - 7)) ELSE CONCAT(SUBSTR(certno, 1, CEIL(LENGTH(certno) * 2/3)), REPEAT('*', FLOOR(LENGTH(certno) * 1/3))) END;
-- emp_name (person_name)
UPDATE setl_d_realtime_ytai SET emp_name = CASE WHEN LENGTH(emp_name) <= 2 THEN CONCAT(SUBSTR(emp_name, 1, 1), '*') WHEN LENGTH(emp_name) <= 4 THEN CONCAT(SUBSTR(emp_name, 1, 2), '*') ELSE CONCAT(SUBSTR(emp_name, 1, CEIL(LENGTH(emp_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(emp_name) * 1/3))) END;
-- emp_mgt_type (org_name)
UPDATE setl_d_realtime_ytai SET emp_mgt_type = CASE WHEN LENGTH(emp_mgt_type) <= 5 THEN CONCAT(SUBSTR(emp_mgt_type, 1, 3), REPEAT('*', LENGTH(emp_mgt_type) - 3)) ELSE CONCAT(SUBSTR(emp_mgt_type, 1, CEIL(LENGTH(emp_mgt_type) * 2/3)), REPEAT('*', FLOOR(LENGTH(emp_mgt_type) * 1/3))) END;
-- fixmedins_code (org_name)
UPDATE setl_d_realtime_ytai SET fixmedins_code = CASE WHEN LENGTH(fixmedins_code) <= 5 THEN CONCAT(SUBSTR(fixmedins_code, 1, 3), REPEAT('*', LENGTH(fixmedins_code) - 3)) ELSE CONCAT(SUBSTR(fixmedins_code, 1, CEIL(LENGTH(fixmedins_code) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_code) * 1/3))) END;
-- fixmedins_name (person_name)
UPDATE setl_d_realtime_ytai SET fixmedins_name = CASE WHEN LENGTH(fixmedins_name) <= 2 THEN CONCAT(SUBSTR(fixmedins_name, 1, 1), '*') WHEN LENGTH(fixmedins_name) <= 4 THEN CONCAT(SUBSTR(fixmedins_name, 1, 2), '*') ELSE CONCAT(SUBSTR(fixmedins_name, 1, CEIL(LENGTH(fixmedins_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_name) * 1/3))) END;
-- hosp_lv (org_name)
UPDATE setl_d_realtime_ytai SET hosp_lv = CASE WHEN LENGTH(hosp_lv) <= 5 THEN CONCAT(SUBSTR(hosp_lv, 1, 3), REPEAT('*', LENGTH(hosp_lv) - 3)) ELSE CONCAT(SUBSTR(hosp_lv, 1, CEIL(LENGTH(hosp_lv) * 2/3)), REPEAT('*', FLOOR(LENGTH(hosp_lv) * 1/3))) END;
-- lmtpric_hosp_lv (org_name)
UPDATE setl_d_realtime_ytai SET lmtpric_hosp_lv = CASE WHEN LENGTH(lmtpric_hosp_lv) <= 5 THEN CONCAT(SUBSTR(lmtpric_hosp_lv, 1, 3), REPEAT('*', LENGTH(lmtpric_hosp_lv) - 3)) ELSE CONCAT(SUBSTR(lmtpric_hosp_lv, 1, CEIL(LENGTH(lmtpric_hosp_lv) * 2/3)), REPEAT('*', FLOOR(LENGTH(lmtpric_hosp_lv) * 1/3))) END;
-- dedc_hosp_lv (org_name)
UPDATE setl_d_realtime_ytai SET dedc_hosp_lv = CASE WHEN LENGTH(dedc_hosp_lv) <= 5 THEN CONCAT(SUBSTR(dedc_hosp_lv, 1, 3), REPEAT('*', LENGTH(dedc_hosp_lv) - 3)) ELSE CONCAT(SUBSTR(dedc_hosp_lv, 1, CEIL(LENGTH(dedc_hosp_lv) * 2/3)), REPEAT('*', FLOOR(LENGTH(dedc_hosp_lv) * 1/3))) END;
-- mdtrt_cert_type (medical_record)
UPDATE setl_d_realtime_ytai SET mdtrt_cert_type = CASE WHEN LENGTH(mdtrt_cert_type) <= 8 THEN CONCAT(SUBSTR(mdtrt_cert_type, 1, 5), REPEAT('*', LENGTH(mdtrt_cert_type) - 5)) ELSE CONCAT(SUBSTR(mdtrt_cert_type, 1, CEIL(LENGTH(mdtrt_cert_type) * 2/3)), REPEAT('*', FLOOR(LENGTH(mdtrt_cert_type) * 1/3))) END;
-- mdtrt_cert_no (medical_record)
UPDATE setl_d_realtime_ytai SET mdtrt_cert_no = CASE WHEN LENGTH(mdtrt_cert_no) <= 8 THEN CONCAT(SUBSTR(mdtrt_cert_no, 1, 5), REPEAT('*', LENGTH(mdtrt_cert_no) - 5)) ELSE CONCAT(SUBSTR(mdtrt_cert_no, 1, CEIL(LENGTH(mdtrt_cert_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(mdtrt_cert_no) * 1/3))) END;
-- ownpay_hosp_part (org_name)
UPDATE setl_d_realtime_ytai SET ownpay_hosp_part = CASE WHEN LENGTH(ownpay_hosp_part) <= 5 THEN CONCAT(SUBSTR(ownpay_hosp_part, 1, 3), REPEAT('*', LENGTH(ownpay_hosp_part) - 3)) ELSE CONCAT(SUBSTR(ownpay_hosp_part, 1, CEIL(LENGTH(ownpay_hosp_part) * 2/3)), REPEAT('*', FLOOR(LENGTH(ownpay_hosp_part) * 1/3))) END;
-- dise_name (person_name)
UPDATE setl_d_realtime_ytai SET dise_name = CASE WHEN LENGTH(dise_name) <= 2 THEN CONCAT(SUBSTR(dise_name, 1, 1), '*') WHEN LENGTH(dise_name) <= 4 THEN CONCAT(SUBSTR(dise_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dise_name, 1, CEIL(LENGTH(dise_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dise_name) * 1/3))) END;
-- crter_id (person_name)
UPDATE setl_d_realtime_ytai SET crter_id = CASE WHEN LENGTH(crter_id) <= 2 THEN CONCAT(SUBSTR(crter_id, 1, 1), '*') WHEN LENGTH(crter_id) <= 4 THEN CONCAT(SUBSTR(crter_id, 1, 2), '*') ELSE CONCAT(SUBSTR(crter_id, 1, CEIL(LENGTH(crter_id) * 2/3)), REPEAT('*', FLOOR(LENGTH(crter_id) * 1/3))) END;
-- crter_name (person_name)
UPDATE setl_d_realtime_ytai SET crter_name = CASE WHEN LENGTH(crter_name) <= 2 THEN CONCAT(SUBSTR(crter_name, 1, 1), '*') WHEN LENGTH(crter_name) <= 4 THEN CONCAT(SUBSTR(crter_name, 1, 2), '*') ELSE CONCAT(SUBSTR(crter_name, 1, CEIL(LENGTH(crter_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(crter_name) * 1/3))) END;
-- crte_optins_no (org_name)
UPDATE setl_d_realtime_ytai SET crte_optins_no = CASE WHEN LENGTH(crte_optins_no) <= 5 THEN CONCAT(SUBSTR(crte_optins_no, 1, 3), REPEAT('*', LENGTH(crte_optins_no) - 3)) ELSE CONCAT(SUBSTR(crte_optins_no, 1, CEIL(LENGTH(crte_optins_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(crte_optins_no) * 1/3))) END;
-- opter_name (person_name)
UPDATE setl_d_realtime_ytai SET opter_name = CASE WHEN LENGTH(opter_name) <= 2 THEN CONCAT(SUBSTR(opter_name, 1, 1), '*') WHEN LENGTH(opter_name) <= 4 THEN CONCAT(SUBSTR(opter_name, 1, 2), '*') ELSE CONCAT(SUBSTR(opter_name, 1, CEIL(LENGTH(opter_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(opter_name) * 1/3))) END;
-- optins_no (org_name)
UPDATE setl_d_realtime_ytai SET optins_no = CASE WHEN LENGTH(optins_no) <= 5 THEN CONCAT(SUBSTR(optins_no, 1, 3), REPEAT('*', LENGTH(optins_no) - 3)) ELSE CONCAT(SUBSTR(optins_no, 1, CEIL(LENGTH(optins_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(optins_no) * 1/3))) END;

-- 表: stg_drds_fee_list_d_fb_df_ytai
-- mdtrt_id (medical_record)
UPDATE stg_drds_fee_list_d_fb_df_ytai SET mdtrt_id = CASE WHEN LENGTH(mdtrt_id) <= 8 THEN CONCAT(SUBSTR(mdtrt_id, 1, 5), REPEAT('*', LENGTH(mdtrt_id) - 5)) ELSE CONCAT(SUBSTR(mdtrt_id, 1, CEIL(LENGTH(mdtrt_id) * 2/3)), REPEAT('*', FLOOR(LENGTH(mdtrt_id) * 1/3))) END;
-- rx_drord_no (medical_record)
UPDATE stg_drds_fee_list_d_fb_df_ytai SET rx_drord_no = CASE WHEN LENGTH(rx_drord_no) <= 8 THEN CONCAT(SUBSTR(rx_drord_no, 1, 5), REPEAT('*', LENGTH(rx_drord_no) - 5)) ELSE CONCAT(SUBSTR(rx_drord_no, 1, CEIL(LENGTH(rx_drord_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(rx_drord_no) * 1/3))) END;
-- fixmedins_code (org_name)
UPDATE stg_drds_fee_list_d_fb_df_ytai SET fixmedins_code = CASE WHEN LENGTH(fixmedins_code) <= 5 THEN CONCAT(SUBSTR(fixmedins_code, 1, 3), REPEAT('*', LENGTH(fixmedins_code) - 3)) ELSE CONCAT(SUBSTR(fixmedins_code, 1, CEIL(LENGTH(fixmedins_code) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_code) * 1/3))) END;
-- fixmedins_name (person_name)
UPDATE stg_drds_fee_list_d_fb_df_ytai SET fixmedins_name = CASE WHEN LENGTH(fixmedins_name) <= 2 THEN CONCAT(SUBSTR(fixmedins_name, 1, 1), '*') WHEN LENGTH(fixmedins_name) <= 4 THEN CONCAT(SUBSTR(fixmedins_name, 1, 2), '*') ELSE CONCAT(SUBSTR(fixmedins_name, 1, CEIL(LENGTH(fixmedins_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_name) * 1/3))) END;
-- psn_no (person_id)
UPDATE stg_drds_fee_list_d_fb_df_ytai SET psn_no = CASE WHEN LENGTH(psn_no) <= 8 THEN CONCAT(SUBSTR(psn_no, 1, 5), REPEAT('*', LENGTH(psn_no) - 5)) ELSE CONCAT(SUBSTR(psn_no, 1, CEIL(LENGTH(psn_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(psn_no) * 1/3))) END;
-- medins_disc_amt (org_name)
UPDATE stg_drds_fee_list_d_fb_df_ytai SET medins_disc_amt = CASE WHEN LENGTH(medins_disc_amt) <= 5 THEN CONCAT(SUBSTR(medins_disc_amt, 1, 3), REPEAT('*', LENGTH(medins_disc_amt) - 3)) ELSE CONCAT(SUBSTR(medins_disc_amt, 1, CEIL(LENGTH(medins_disc_amt) * 2/3)), REPEAT('*', FLOOR(LENGTH(medins_disc_amt) * 1/3))) END;
-- hilist_name (person_name)
UPDATE stg_drds_fee_list_d_fb_df_ytai SET hilist_name = CASE WHEN LENGTH(hilist_name) <= 2 THEN CONCAT(SUBSTR(hilist_name, 1, 1), '*') WHEN LENGTH(hilist_name) <= 4 THEN CONCAT(SUBSTR(hilist_name, 1, 2), '*') ELSE CONCAT(SUBSTR(hilist_name, 1, CEIL(LENGTH(hilist_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(hilist_name) * 1/3))) END;
-- medins_list_codg (org_name)
UPDATE stg_drds_fee_list_d_fb_df_ytai SET medins_list_codg = CASE WHEN LENGTH(medins_list_codg) <= 5 THEN CONCAT(SUBSTR(medins_list_codg, 1, 3), REPEAT('*', LENGTH(medins_list_codg) - 3)) ELSE CONCAT(SUBSTR(medins_list_codg, 1, CEIL(LENGTH(medins_list_codg) * 2/3)), REPEAT('*', FLOOR(LENGTH(medins_list_codg) * 1/3))) END;
-- medins_list_name (person_name)
UPDATE stg_drds_fee_list_d_fb_df_ytai SET medins_list_name = CASE WHEN LENGTH(medins_list_name) <= 2 THEN CONCAT(SUBSTR(medins_list_name, 1, 1), '*') WHEN LENGTH(medins_list_name) <= 4 THEN CONCAT(SUBSTR(medins_list_name, 1, 2), '*') ELSE CONCAT(SUBSTR(medins_list_name, 1, CEIL(LENGTH(medins_list_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(medins_list_name) * 1/3))) END;
-- prodname (person_name)
UPDATE stg_drds_fee_list_d_fb_df_ytai SET prodname = CASE WHEN LENGTH(prodname) <= 2 THEN CONCAT(SUBSTR(prodname, 1, 1), '*') WHEN LENGTH(prodname) <= 4 THEN CONCAT(SUBSTR(prodname, 1, 2), '*') ELSE CONCAT(SUBSTR(prodname, 1, CEIL(LENGTH(prodname) * 2/3)), REPEAT('*', FLOOR(LENGTH(prodname) * 1/3))) END;
-- dosform_name (person_name)
UPDATE stg_drds_fee_list_d_fb_df_ytai SET dosform_name = CASE WHEN LENGTH(dosform_name) <= 2 THEN CONCAT(SUBSTR(dosform_name, 1, 1), '*') WHEN LENGTH(dosform_name) <= 4 THEN CONCAT(SUBSTR(dosform_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dosform_name, 1, CEIL(LENGTH(dosform_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dosform_name) * 1/3))) END;
-- bilg_dept_name (person_name)
UPDATE stg_drds_fee_list_d_fb_df_ytai SET bilg_dept_name = CASE WHEN LENGTH(bilg_dept_name) <= 2 THEN CONCAT(SUBSTR(bilg_dept_name, 1, 1), '*') WHEN LENGTH(bilg_dept_name) <= 4 THEN CONCAT(SUBSTR(bilg_dept_name, 1, 2), '*') ELSE CONCAT(SUBSTR(bilg_dept_name, 1, CEIL(LENGTH(bilg_dept_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(bilg_dept_name) * 1/3))) END;
-- bilg_dr_code (person_name)
UPDATE stg_drds_fee_list_d_fb_df_ytai SET bilg_dr_code = CASE WHEN LENGTH(bilg_dr_code) <= 2 THEN CONCAT(SUBSTR(bilg_dr_code, 1, 1), '*') WHEN LENGTH(bilg_dr_code) <= 4 THEN CONCAT(SUBSTR(bilg_dr_code, 1, 2), '*') ELSE CONCAT(SUBSTR(bilg_dr_code, 1, CEIL(LENGTH(bilg_dr_code) * 2/3)), REPEAT('*', FLOOR(LENGTH(bilg_dr_code) * 1/3))) END;
-- bilg_dr_name (person_name)
UPDATE stg_drds_fee_list_d_fb_df_ytai SET bilg_dr_name = CASE WHEN LENGTH(bilg_dr_name) <= 2 THEN CONCAT(SUBSTR(bilg_dr_name, 1, 1), '*') WHEN LENGTH(bilg_dr_name) <= 4 THEN CONCAT(SUBSTR(bilg_dr_name, 1, 2), '*') ELSE CONCAT(SUBSTR(bilg_dr_name, 1, CEIL(LENGTH(bilg_dr_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(bilg_dr_name) * 1/3))) END;
-- acord_dept_name (person_name)
UPDATE stg_drds_fee_list_d_fb_df_ytai SET acord_dept_name = CASE WHEN LENGTH(acord_dept_name) <= 2 THEN CONCAT(SUBSTR(acord_dept_name, 1, 1), '*') WHEN LENGTH(acord_dept_name) <= 4 THEN CONCAT(SUBSTR(acord_dept_name, 1, 2), '*') ELSE CONCAT(SUBSTR(acord_dept_name, 1, CEIL(LENGTH(acord_dept_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(acord_dept_name) * 1/3))) END;
-- acord_dr_code (person_name)
UPDATE stg_drds_fee_list_d_fb_df_ytai SET acord_dr_code = CASE WHEN LENGTH(acord_dr_code) <= 2 THEN CONCAT(SUBSTR(acord_dr_code, 1, 1), '*') WHEN LENGTH(acord_dr_code) <= 4 THEN CONCAT(SUBSTR(acord_dr_code, 1, 2), '*') ELSE CONCAT(SUBSTR(acord_dr_code, 1, CEIL(LENGTH(acord_dr_code) * 2/3)), REPEAT('*', FLOOR(LENGTH(acord_dr_code) * 1/3))) END;
-- acord_dr_name (person_name)
UPDATE stg_drds_fee_list_d_fb_df_ytai SET acord_dr_name = CASE WHEN LENGTH(acord_dr_name) <= 2 THEN CONCAT(SUBSTR(acord_dr_name, 1, 1), '*') WHEN LENGTH(acord_dr_name) <= 4 THEN CONCAT(SUBSTR(acord_dr_name, 1, 2), '*') ELSE CONCAT(SUBSTR(acord_dr_name, 1, CEIL(LENGTH(acord_dr_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(acord_dr_name) * 1/3))) END;
-- hosp_prep_flag (org_name)
UPDATE stg_drds_fee_list_d_fb_df_ytai SET hosp_prep_flag = CASE WHEN LENGTH(hosp_prep_flag) <= 5 THEN CONCAT(SUBSTR(hosp_prep_flag, 1, 3), REPEAT('*', LENGTH(hosp_prep_flag) - 3)) ELSE CONCAT(SUBSTR(hosp_prep_flag, 1, CEIL(LENGTH(hosp_prep_flag) * 2/3)), REPEAT('*', FLOOR(LENGTH(hosp_prep_flag) * 1/3))) END;
-- hosp_appr_flag (org_name)
UPDATE stg_drds_fee_list_d_fb_df_ytai SET hosp_appr_flag = CASE WHEN LENGTH(hosp_appr_flag) <= 5 THEN CONCAT(SUBSTR(hosp_appr_flag, 1, 3), REPEAT('*', LENGTH(hosp_appr_flag) - 3)) ELSE CONCAT(SUBSTR(hosp_appr_flag, 1, CEIL(LENGTH(hosp_appr_flag) * 2/3)), REPEAT('*', FLOOR(LENGTH(hosp_appr_flag) * 1/3))) END;
-- etip_hosp_code (org_name)
UPDATE stg_drds_fee_list_d_fb_df_ytai SET etip_hosp_code = CASE WHEN LENGTH(etip_hosp_code) <= 5 THEN CONCAT(SUBSTR(etip_hosp_code, 1, 3), REPEAT('*', LENGTH(etip_hosp_code) - 3)) ELSE CONCAT(SUBSTR(etip_hosp_code, 1, CEIL(LENGTH(etip_hosp_code) * 2/3)), REPEAT('*', FLOOR(LENGTH(etip_hosp_code) * 1/3))) END;
-- crter_id (person_name)
UPDATE stg_drds_fee_list_d_fb_df_ytai SET crter_id = CASE WHEN LENGTH(crter_id) <= 2 THEN CONCAT(SUBSTR(crter_id, 1, 1), '*') WHEN LENGTH(crter_id) <= 4 THEN CONCAT(SUBSTR(crter_id, 1, 2), '*') ELSE CONCAT(SUBSTR(crter_id, 1, CEIL(LENGTH(crter_id) * 2/3)), REPEAT('*', FLOOR(LENGTH(crter_id) * 1/3))) END;
-- crter_name (person_name)
UPDATE stg_drds_fee_list_d_fb_df_ytai SET crter_name = CASE WHEN LENGTH(crter_name) <= 2 THEN CONCAT(SUBSTR(crter_name, 1, 1), '*') WHEN LENGTH(crter_name) <= 4 THEN CONCAT(SUBSTR(crter_name, 1, 2), '*') ELSE CONCAT(SUBSTR(crter_name, 1, CEIL(LENGTH(crter_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(crter_name) * 1/3))) END;
-- crte_optins_no (org_name)
UPDATE stg_drds_fee_list_d_fb_df_ytai SET crte_optins_no = CASE WHEN LENGTH(crte_optins_no) <= 5 THEN CONCAT(SUBSTR(crte_optins_no, 1, 3), REPEAT('*', LENGTH(crte_optins_no) - 3)) ELSE CONCAT(SUBSTR(crte_optins_no, 1, CEIL(LENGTH(crte_optins_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(crte_optins_no) * 1/3))) END;
-- opter_id (person_name)
UPDATE stg_drds_fee_list_d_fb_df_ytai SET opter_id = CASE WHEN LENGTH(opter_id) <= 2 THEN CONCAT(SUBSTR(opter_id, 1, 1), '*') WHEN LENGTH(opter_id) <= 4 THEN CONCAT(SUBSTR(opter_id, 1, 2), '*') ELSE CONCAT(SUBSTR(opter_id, 1, CEIL(LENGTH(opter_id) * 2/3)), REPEAT('*', FLOOR(LENGTH(opter_id) * 1/3))) END;
-- opter_name (person_name)
UPDATE stg_drds_fee_list_d_fb_df_ytai SET opter_name = CASE WHEN LENGTH(opter_name) <= 2 THEN CONCAT(SUBSTR(opter_name, 1, 1), '*') WHEN LENGTH(opter_name) <= 4 THEN CONCAT(SUBSTR(opter_name, 1, 2), '*') ELSE CONCAT(SUBSTR(opter_name, 1, CEIL(LENGTH(opter_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(opter_name) * 1/3))) END;
-- optins_no (org_name)
UPDATE stg_drds_fee_list_d_fb_df_ytai SET optins_no = CASE WHEN LENGTH(optins_no) <= 5 THEN CONCAT(SUBSTR(optins_no, 1, 3), REPEAT('*', LENGTH(optins_no) - 3)) ELSE CONCAT(SUBSTR(optins_no, 1, CEIL(LENGTH(optins_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(optins_no) * 1/3))) END;
-- rx_circ_flag (medical_record)
UPDATE stg_drds_fee_list_d_fb_df_ytai SET rx_circ_flag = CASE WHEN LENGTH(rx_circ_flag) <= 8 THEN CONCAT(SUBSTR(rx_circ_flag, 1, 5), REPEAT('*', LENGTH(rx_circ_flag) - 5)) ELSE CONCAT(SUBSTR(rx_circ_flag, 1, CEIL(LENGTH(rx_circ_flag) * 2/3)), REPEAT('*', FLOOR(LENGTH(rx_circ_flag) * 1/3))) END;

-- 表: stg_drds_fee_list_d_fb_yd_df_ytai
-- mdtrt_id (medical_record)
UPDATE stg_drds_fee_list_d_fb_yd_df_ytai SET mdtrt_id = CASE WHEN LENGTH(mdtrt_id) <= 8 THEN CONCAT(SUBSTR(mdtrt_id, 1, 5), REPEAT('*', LENGTH(mdtrt_id) - 5)) ELSE CONCAT(SUBSTR(mdtrt_id, 1, CEIL(LENGTH(mdtrt_id) * 2/3)), REPEAT('*', FLOOR(LENGTH(mdtrt_id) * 1/3))) END;
-- rx_drord_no (medical_record)
UPDATE stg_drds_fee_list_d_fb_yd_df_ytai SET rx_drord_no = CASE WHEN LENGTH(rx_drord_no) <= 8 THEN CONCAT(SUBSTR(rx_drord_no, 1, 5), REPEAT('*', LENGTH(rx_drord_no) - 5)) ELSE CONCAT(SUBSTR(rx_drord_no, 1, CEIL(LENGTH(rx_drord_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(rx_drord_no) * 1/3))) END;
-- fixmedins_code (org_name)
UPDATE stg_drds_fee_list_d_fb_yd_df_ytai SET fixmedins_code = CASE WHEN LENGTH(fixmedins_code) <= 5 THEN CONCAT(SUBSTR(fixmedins_code, 1, 3), REPEAT('*', LENGTH(fixmedins_code) - 3)) ELSE CONCAT(SUBSTR(fixmedins_code, 1, CEIL(LENGTH(fixmedins_code) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_code) * 1/3))) END;
-- fixmedins_name (person_name)
UPDATE stg_drds_fee_list_d_fb_yd_df_ytai SET fixmedins_name = CASE WHEN LENGTH(fixmedins_name) <= 2 THEN CONCAT(SUBSTR(fixmedins_name, 1, 1), '*') WHEN LENGTH(fixmedins_name) <= 4 THEN CONCAT(SUBSTR(fixmedins_name, 1, 2), '*') ELSE CONCAT(SUBSTR(fixmedins_name, 1, CEIL(LENGTH(fixmedins_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_name) * 1/3))) END;
-- psn_no (person_id)
UPDATE stg_drds_fee_list_d_fb_yd_df_ytai SET psn_no = CASE WHEN LENGTH(psn_no) <= 8 THEN CONCAT(SUBSTR(psn_no, 1, 5), REPEAT('*', LENGTH(psn_no) - 5)) ELSE CONCAT(SUBSTR(psn_no, 1, CEIL(LENGTH(psn_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(psn_no) * 1/3))) END;
-- medins_disc_amt (org_name)
UPDATE stg_drds_fee_list_d_fb_yd_df_ytai SET medins_disc_amt = CASE WHEN LENGTH(medins_disc_amt) <= 5 THEN CONCAT(SUBSTR(medins_disc_amt, 1, 3), REPEAT('*', LENGTH(medins_disc_amt) - 3)) ELSE CONCAT(SUBSTR(medins_disc_amt, 1, CEIL(LENGTH(medins_disc_amt) * 2/3)), REPEAT('*', FLOOR(LENGTH(medins_disc_amt) * 1/3))) END;
-- hilist_name (person_name)
UPDATE stg_drds_fee_list_d_fb_yd_df_ytai SET hilist_name = CASE WHEN LENGTH(hilist_name) <= 2 THEN CONCAT(SUBSTR(hilist_name, 1, 1), '*') WHEN LENGTH(hilist_name) <= 4 THEN CONCAT(SUBSTR(hilist_name, 1, 2), '*') ELSE CONCAT(SUBSTR(hilist_name, 1, CEIL(LENGTH(hilist_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(hilist_name) * 1/3))) END;
-- medins_list_codg (org_name)
UPDATE stg_drds_fee_list_d_fb_yd_df_ytai SET medins_list_codg = CASE WHEN LENGTH(medins_list_codg) <= 5 THEN CONCAT(SUBSTR(medins_list_codg, 1, 3), REPEAT('*', LENGTH(medins_list_codg) - 3)) ELSE CONCAT(SUBSTR(medins_list_codg, 1, CEIL(LENGTH(medins_list_codg) * 2/3)), REPEAT('*', FLOOR(LENGTH(medins_list_codg) * 1/3))) END;
-- medins_list_name (person_name)
UPDATE stg_drds_fee_list_d_fb_yd_df_ytai SET medins_list_name = CASE WHEN LENGTH(medins_list_name) <= 2 THEN CONCAT(SUBSTR(medins_list_name, 1, 1), '*') WHEN LENGTH(medins_list_name) <= 4 THEN CONCAT(SUBSTR(medins_list_name, 1, 2), '*') ELSE CONCAT(SUBSTR(medins_list_name, 1, CEIL(LENGTH(medins_list_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(medins_list_name) * 1/3))) END;
-- prodname (person_name)
UPDATE stg_drds_fee_list_d_fb_yd_df_ytai SET prodname = CASE WHEN LENGTH(prodname) <= 2 THEN CONCAT(SUBSTR(prodname, 1, 1), '*') WHEN LENGTH(prodname) <= 4 THEN CONCAT(SUBSTR(prodname, 1, 2), '*') ELSE CONCAT(SUBSTR(prodname, 1, CEIL(LENGTH(prodname) * 2/3)), REPEAT('*', FLOOR(LENGTH(prodname) * 1/3))) END;
-- dosform_name (person_name)
UPDATE stg_drds_fee_list_d_fb_yd_df_ytai SET dosform_name = CASE WHEN LENGTH(dosform_name) <= 2 THEN CONCAT(SUBSTR(dosform_name, 1, 1), '*') WHEN LENGTH(dosform_name) <= 4 THEN CONCAT(SUBSTR(dosform_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dosform_name, 1, CEIL(LENGTH(dosform_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dosform_name) * 1/3))) END;
-- bilg_dept_name (person_name)
UPDATE stg_drds_fee_list_d_fb_yd_df_ytai SET bilg_dept_name = CASE WHEN LENGTH(bilg_dept_name) <= 2 THEN CONCAT(SUBSTR(bilg_dept_name, 1, 1), '*') WHEN LENGTH(bilg_dept_name) <= 4 THEN CONCAT(SUBSTR(bilg_dept_name, 1, 2), '*') ELSE CONCAT(SUBSTR(bilg_dept_name, 1, CEIL(LENGTH(bilg_dept_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(bilg_dept_name) * 1/3))) END;
-- bilg_dr_code (person_name)
UPDATE stg_drds_fee_list_d_fb_yd_df_ytai SET bilg_dr_code = CASE WHEN LENGTH(bilg_dr_code) <= 2 THEN CONCAT(SUBSTR(bilg_dr_code, 1, 1), '*') WHEN LENGTH(bilg_dr_code) <= 4 THEN CONCAT(SUBSTR(bilg_dr_code, 1, 2), '*') ELSE CONCAT(SUBSTR(bilg_dr_code, 1, CEIL(LENGTH(bilg_dr_code) * 2/3)), REPEAT('*', FLOOR(LENGTH(bilg_dr_code) * 1/3))) END;
-- bilg_dr_name (person_name)
UPDATE stg_drds_fee_list_d_fb_yd_df_ytai SET bilg_dr_name = CASE WHEN LENGTH(bilg_dr_name) <= 2 THEN CONCAT(SUBSTR(bilg_dr_name, 1, 1), '*') WHEN LENGTH(bilg_dr_name) <= 4 THEN CONCAT(SUBSTR(bilg_dr_name, 1, 2), '*') ELSE CONCAT(SUBSTR(bilg_dr_name, 1, CEIL(LENGTH(bilg_dr_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(bilg_dr_name) * 1/3))) END;
-- acord_dept_name (person_name)
UPDATE stg_drds_fee_list_d_fb_yd_df_ytai SET acord_dept_name = CASE WHEN LENGTH(acord_dept_name) <= 2 THEN CONCAT(SUBSTR(acord_dept_name, 1, 1), '*') WHEN LENGTH(acord_dept_name) <= 4 THEN CONCAT(SUBSTR(acord_dept_name, 1, 2), '*') ELSE CONCAT(SUBSTR(acord_dept_name, 1, CEIL(LENGTH(acord_dept_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(acord_dept_name) * 1/3))) END;
-- acord_dr_code (person_name)
UPDATE stg_drds_fee_list_d_fb_yd_df_ytai SET acord_dr_code = CASE WHEN LENGTH(acord_dr_code) <= 2 THEN CONCAT(SUBSTR(acord_dr_code, 1, 1), '*') WHEN LENGTH(acord_dr_code) <= 4 THEN CONCAT(SUBSTR(acord_dr_code, 1, 2), '*') ELSE CONCAT(SUBSTR(acord_dr_code, 1, CEIL(LENGTH(acord_dr_code) * 2/3)), REPEAT('*', FLOOR(LENGTH(acord_dr_code) * 1/3))) END;
-- acord_dr_name (person_name)
UPDATE stg_drds_fee_list_d_fb_yd_df_ytai SET acord_dr_name = CASE WHEN LENGTH(acord_dr_name) <= 2 THEN CONCAT(SUBSTR(acord_dr_name, 1, 1), '*') WHEN LENGTH(acord_dr_name) <= 4 THEN CONCAT(SUBSTR(acord_dr_name, 1, 2), '*') ELSE CONCAT(SUBSTR(acord_dr_name, 1, CEIL(LENGTH(acord_dr_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(acord_dr_name) * 1/3))) END;
-- hosp_prep_flag (org_name)
UPDATE stg_drds_fee_list_d_fb_yd_df_ytai SET hosp_prep_flag = CASE WHEN LENGTH(hosp_prep_flag) <= 5 THEN CONCAT(SUBSTR(hosp_prep_flag, 1, 3), REPEAT('*', LENGTH(hosp_prep_flag) - 3)) ELSE CONCAT(SUBSTR(hosp_prep_flag, 1, CEIL(LENGTH(hosp_prep_flag) * 2/3)), REPEAT('*', FLOOR(LENGTH(hosp_prep_flag) * 1/3))) END;
-- hosp_appr_flag (org_name)
UPDATE stg_drds_fee_list_d_fb_yd_df_ytai SET hosp_appr_flag = CASE WHEN LENGTH(hosp_appr_flag) <= 5 THEN CONCAT(SUBSTR(hosp_appr_flag, 1, 3), REPEAT('*', LENGTH(hosp_appr_flag) - 3)) ELSE CONCAT(SUBSTR(hosp_appr_flag, 1, CEIL(LENGTH(hosp_appr_flag) * 2/3)), REPEAT('*', FLOOR(LENGTH(hosp_appr_flag) * 1/3))) END;
-- etip_hosp_code (org_name)
UPDATE stg_drds_fee_list_d_fb_yd_df_ytai SET etip_hosp_code = CASE WHEN LENGTH(etip_hosp_code) <= 5 THEN CONCAT(SUBSTR(etip_hosp_code, 1, 3), REPEAT('*', LENGTH(etip_hosp_code) - 3)) ELSE CONCAT(SUBSTR(etip_hosp_code, 1, CEIL(LENGTH(etip_hosp_code) * 2/3)), REPEAT('*', FLOOR(LENGTH(etip_hosp_code) * 1/3))) END;
-- crter_id (person_name)
UPDATE stg_drds_fee_list_d_fb_yd_df_ytai SET crter_id = CASE WHEN LENGTH(crter_id) <= 2 THEN CONCAT(SUBSTR(crter_id, 1, 1), '*') WHEN LENGTH(crter_id) <= 4 THEN CONCAT(SUBSTR(crter_id, 1, 2), '*') ELSE CONCAT(SUBSTR(crter_id, 1, CEIL(LENGTH(crter_id) * 2/3)), REPEAT('*', FLOOR(LENGTH(crter_id) * 1/3))) END;
-- crter_name (person_name)
UPDATE stg_drds_fee_list_d_fb_yd_df_ytai SET crter_name = CASE WHEN LENGTH(crter_name) <= 2 THEN CONCAT(SUBSTR(crter_name, 1, 1), '*') WHEN LENGTH(crter_name) <= 4 THEN CONCAT(SUBSTR(crter_name, 1, 2), '*') ELSE CONCAT(SUBSTR(crter_name, 1, CEIL(LENGTH(crter_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(crter_name) * 1/3))) END;
-- crte_optins_no (org_name)
UPDATE stg_drds_fee_list_d_fb_yd_df_ytai SET crte_optins_no = CASE WHEN LENGTH(crte_optins_no) <= 5 THEN CONCAT(SUBSTR(crte_optins_no, 1, 3), REPEAT('*', LENGTH(crte_optins_no) - 3)) ELSE CONCAT(SUBSTR(crte_optins_no, 1, CEIL(LENGTH(crte_optins_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(crte_optins_no) * 1/3))) END;
-- opter_name (person_name)
UPDATE stg_drds_fee_list_d_fb_yd_df_ytai SET opter_name = CASE WHEN LENGTH(opter_name) <= 2 THEN CONCAT(SUBSTR(opter_name, 1, 1), '*') WHEN LENGTH(opter_name) <= 4 THEN CONCAT(SUBSTR(opter_name, 1, 2), '*') ELSE CONCAT(SUBSTR(opter_name, 1, CEIL(LENGTH(opter_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(opter_name) * 1/3))) END;
-- optins_no (org_name)
UPDATE stg_drds_fee_list_d_fb_yd_df_ytai SET optins_no = CASE WHEN LENGTH(optins_no) <= 5 THEN CONCAT(SUBSTR(optins_no, 1, 3), REPEAT('*', LENGTH(optins_no) - 3)) ELSE CONCAT(SUBSTR(optins_no, 1, CEIL(LENGTH(optins_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(optins_no) * 1/3))) END;
-- rx_circ_flag (medical_record)
UPDATE stg_drds_fee_list_d_fb_yd_df_ytai SET rx_circ_flag = CASE WHEN LENGTH(rx_circ_flag) <= 8 THEN CONCAT(SUBSTR(rx_circ_flag, 1, 5), REPEAT('*', LENGTH(rx_circ_flag) - 5)) ELSE CONCAT(SUBSTR(rx_circ_flag, 1, CEIL(LENGTH(rx_circ_flag) * 2/3)), REPEAT('*', FLOOR(LENGTH(rx_circ_flag) * 1/3))) END;

-- 表: stg_drds_mdtrt_d_fb_df_ytai
-- mdtrt_id (medical_record)
UPDATE stg_drds_mdtrt_d_fb_df_ytai SET mdtrt_id = CASE WHEN LENGTH(mdtrt_id) <= 8 THEN CONCAT(SUBSTR(mdtrt_id, 1, 5), REPEAT('*', LENGTH(mdtrt_id) - 5)) ELSE CONCAT(SUBSTR(mdtrt_id, 1, CEIL(LENGTH(mdtrt_id) * 2/3)), REPEAT('*', FLOOR(LENGTH(mdtrt_id) * 1/3))) END;
-- medins_setl_id (org_name)
UPDATE stg_drds_mdtrt_d_fb_df_ytai SET medins_setl_id = CASE WHEN LENGTH(medins_setl_id) <= 5 THEN CONCAT(SUBSTR(medins_setl_id, 1, 3), REPEAT('*', LENGTH(medins_setl_id) - 3)) ELSE CONCAT(SUBSTR(medins_setl_id, 1, CEIL(LENGTH(medins_setl_id) * 2/3)), REPEAT('*', FLOOR(LENGTH(medins_setl_id) * 1/3))) END;
-- psn_no (person_id)
UPDATE stg_drds_mdtrt_d_fb_df_ytai SET psn_no = CASE WHEN LENGTH(psn_no) <= 8 THEN CONCAT(SUBSTR(psn_no, 1, 5), REPEAT('*', LENGTH(psn_no) - 5)) ELSE CONCAT(SUBSTR(psn_no, 1, CEIL(LENGTH(psn_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(psn_no) * 1/3))) END;
-- certno (id_card)
UPDATE stg_drds_mdtrt_d_fb_df_ytai SET certno = CASE WHEN LENGTH(certno) <= 10 THEN CONCAT(SUBSTR(certno, 1, 7), REPEAT('*', LENGTH(certno) - 7)) ELSE CONCAT(SUBSTR(certno, 1, CEIL(LENGTH(certno) * 2/3)), REPEAT('*', FLOOR(LENGTH(certno) * 1/3))) END;
-- psn_name (person_name)
UPDATE stg_drds_mdtrt_d_fb_df_ytai SET psn_name = CASE WHEN LENGTH(psn_name) <= 2 THEN CONCAT(SUBSTR(psn_name, 1, 1), '*') WHEN LENGTH(psn_name) <= 4 THEN CONCAT(SUBSTR(psn_name, 1, 2), '*') ELSE CONCAT(SUBSTR(psn_name, 1, CEIL(LENGTH(psn_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(psn_name) * 1/3))) END;
-- coner_name (person_name)
UPDATE stg_drds_mdtrt_d_fb_df_ytai SET coner_name = CASE WHEN LENGTH(coner_name) <= 2 THEN CONCAT(SUBSTR(coner_name, 1, 1), '*') WHEN LENGTH(coner_name) <= 4 THEN CONCAT(SUBSTR(coner_name, 1, 2), '*') ELSE CONCAT(SUBSTR(coner_name, 1, CEIL(LENGTH(coner_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(coner_name) * 1/3))) END;
-- tel (phone)
UPDATE stg_drds_mdtrt_d_fb_df_ytai SET tel = CASE WHEN LENGTH(tel) <= 8 THEN CONCAT(SUBSTR(tel, 1, 5), REPEAT('*', LENGTH(tel) - 5)) ELSE CONCAT(SUBSTR(tel, 1, CEIL(LENGTH(tel) * 2/3)), REPEAT('*', FLOOR(LENGTH(tel) * 1/3))) END;
-- addr (address)
UPDATE stg_drds_mdtrt_d_fb_df_ytai SET addr = CASE WHEN LENGTH(addr) <= 10 THEN CONCAT(SUBSTR(addr, 1, 7), REPEAT('*', LENGTH(addr) - 7)) ELSE CONCAT(SUBSTR(addr, 1, CEIL(LENGTH(addr) * 2/3)), REPEAT('*', FLOOR(LENGTH(addr) * 1/3))) END;
-- emp_no (org_name)
UPDATE stg_drds_mdtrt_d_fb_df_ytai SET emp_no = CASE WHEN LENGTH(emp_no) <= 5 THEN CONCAT(SUBSTR(emp_no, 1, 3), REPEAT('*', LENGTH(emp_no) - 3)) ELSE CONCAT(SUBSTR(emp_no, 1, CEIL(LENGTH(emp_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(emp_no) * 1/3))) END;
-- emp_name (person_name)
UPDATE stg_drds_mdtrt_d_fb_df_ytai SET emp_name = CASE WHEN LENGTH(emp_name) <= 2 THEN CONCAT(SUBSTR(emp_name, 1, 1), '*') WHEN LENGTH(emp_name) <= 4 THEN CONCAT(SUBSTR(emp_name, 1, 2), '*') ELSE CONCAT(SUBSTR(emp_name, 1, CEIL(LENGTH(emp_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(emp_name) * 1/3))) END;
-- emp_type (org_name)
UPDATE stg_drds_mdtrt_d_fb_df_ytai SET emp_type = CASE WHEN LENGTH(emp_type) <= 5 THEN CONCAT(SUBSTR(emp_type, 1, 3), REPEAT('*', LENGTH(emp_type) - 3)) ELSE CONCAT(SUBSTR(emp_type, 1, CEIL(LENGTH(emp_type) * 2/3)), REPEAT('*', FLOOR(LENGTH(emp_type) * 1/3))) END;
-- emp_mgt_type (org_name)
UPDATE stg_drds_mdtrt_d_fb_df_ytai SET emp_mgt_type = CASE WHEN LENGTH(emp_mgt_type) <= 5 THEN CONCAT(SUBSTR(emp_mgt_type, 1, 3), REPEAT('*', LENGTH(emp_mgt_type) - 3)) ELSE CONCAT(SUBSTR(emp_mgt_type, 1, CEIL(LENGTH(emp_mgt_type) * 2/3)), REPEAT('*', FLOOR(LENGTH(emp_mgt_type) * 1/3))) END;
-- fixmedins_code (org_name)
UPDATE stg_drds_mdtrt_d_fb_df_ytai SET fixmedins_code = CASE WHEN LENGTH(fixmedins_code) <= 5 THEN CONCAT(SUBSTR(fixmedins_code, 1, 3), REPEAT('*', LENGTH(fixmedins_code) - 3)) ELSE CONCAT(SUBSTR(fixmedins_code, 1, CEIL(LENGTH(fixmedins_code) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_code) * 1/3))) END;
-- fixmedins_name (person_name)
UPDATE stg_drds_mdtrt_d_fb_df_ytai SET fixmedins_name = CASE WHEN LENGTH(fixmedins_name) <= 2 THEN CONCAT(SUBSTR(fixmedins_name, 1, 1), '*') WHEN LENGTH(fixmedins_name) <= 4 THEN CONCAT(SUBSTR(fixmedins_name, 1, 2), '*') ELSE CONCAT(SUBSTR(fixmedins_name, 1, CEIL(LENGTH(fixmedins_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_name) * 1/3))) END;
-- hosp_lv (org_name)
UPDATE stg_drds_mdtrt_d_fb_df_ytai SET hosp_lv = CASE WHEN LENGTH(hosp_lv) <= 5 THEN CONCAT(SUBSTR(hosp_lv, 1, 3), REPEAT('*', LENGTH(hosp_lv) - 3)) ELSE CONCAT(SUBSTR(hosp_lv, 1, CEIL(LENGTH(hosp_lv) * 2/3)), REPEAT('*', FLOOR(LENGTH(hosp_lv) * 1/3))) END;
-- lmtpric_hosp_lv (org_name)
UPDATE stg_drds_mdtrt_d_fb_df_ytai SET lmtpric_hosp_lv = CASE WHEN LENGTH(lmtpric_hosp_lv) <= 5 THEN CONCAT(SUBSTR(lmtpric_hosp_lv, 1, 3), REPEAT('*', LENGTH(lmtpric_hosp_lv) - 3)) ELSE CONCAT(SUBSTR(lmtpric_hosp_lv, 1, CEIL(LENGTH(lmtpric_hosp_lv) * 2/3)), REPEAT('*', FLOOR(LENGTH(lmtpric_hosp_lv) * 1/3))) END;
-- dedc_hosp_lv (org_name)
UPDATE stg_drds_mdtrt_d_fb_df_ytai SET dedc_hosp_lv = CASE WHEN LENGTH(dedc_hosp_lv) <= 5 THEN CONCAT(SUBSTR(dedc_hosp_lv, 1, 3), REPEAT('*', LENGTH(dedc_hosp_lv) - 3)) ELSE CONCAT(SUBSTR(dedc_hosp_lv, 1, CEIL(LENGTH(dedc_hosp_lv) * 2/3)), REPEAT('*', FLOOR(LENGTH(dedc_hosp_lv) * 1/3))) END;
-- mdtrt_cert_type (medical_record)
UPDATE stg_drds_mdtrt_d_fb_df_ytai SET mdtrt_cert_type = CASE WHEN LENGTH(mdtrt_cert_type) <= 8 THEN CONCAT(SUBSTR(mdtrt_cert_type, 1, 5), REPEAT('*', LENGTH(mdtrt_cert_type) - 5)) ELSE CONCAT(SUBSTR(mdtrt_cert_type, 1, CEIL(LENGTH(mdtrt_cert_type) * 2/3)), REPEAT('*', FLOOR(LENGTH(mdtrt_cert_type) * 1/3))) END;
-- mdtrt_cert_no (medical_record)
UPDATE stg_drds_mdtrt_d_fb_df_ytai SET mdtrt_cert_no = CASE WHEN LENGTH(mdtrt_cert_no) <= 8 THEN CONCAT(SUBSTR(mdtrt_cert_no, 1, 5), REPEAT('*', LENGTH(mdtrt_cert_no) - 5)) ELSE CONCAT(SUBSTR(mdtrt_cert_no, 1, CEIL(LENGTH(mdtrt_cert_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(mdtrt_cert_no) * 1/3))) END;
-- refl_old_mdtrt_id (medical_record)
UPDATE stg_drds_mdtrt_d_fb_df_ytai SET refl_old_mdtrt_id = CASE WHEN LENGTH(refl_old_mdtrt_id) <= 8 THEN CONCAT(SUBSTR(refl_old_mdtrt_id, 1, 5), REPEAT('*', LENGTH(refl_old_mdtrt_id) - 5)) ELSE CONCAT(SUBSTR(refl_old_mdtrt_id, 1, CEIL(LENGTH(refl_old_mdtrt_id) * 2/3)), REPEAT('*', FLOOR(LENGTH(refl_old_mdtrt_id) * 1/3))) END;
-- medrcdno (medical_record)
UPDATE stg_drds_mdtrt_d_fb_df_ytai SET medrcdno = CASE WHEN LENGTH(medrcdno) <= 8 THEN CONCAT(SUBSTR(medrcdno, 1, 5), REPEAT('*', LENGTH(medrcdno) - 5)) ELSE CONCAT(SUBSTR(medrcdno, 1, CEIL(LENGTH(medrcdno) * 2/3)), REPEAT('*', FLOOR(LENGTH(medrcdno) * 1/3))) END;
-- chfpdr_code (person_name)
UPDATE stg_drds_mdtrt_d_fb_df_ytai SET chfpdr_code = CASE WHEN LENGTH(chfpdr_code) <= 2 THEN CONCAT(SUBSTR(chfpdr_code, 1, 1), '*') WHEN LENGTH(chfpdr_code) <= 4 THEN CONCAT(SUBSTR(chfpdr_code, 1, 2), '*') ELSE CONCAT(SUBSTR(chfpdr_code, 1, CEIL(LENGTH(chfpdr_code) * 2/3)), REPEAT('*', FLOOR(LENGTH(chfpdr_code) * 1/3))) END;
-- adm_dept_name (person_name)
UPDATE stg_drds_mdtrt_d_fb_df_ytai SET adm_dept_name = CASE WHEN LENGTH(adm_dept_name) <= 2 THEN CONCAT(SUBSTR(adm_dept_name, 1, 1), '*') WHEN LENGTH(adm_dept_name) <= 4 THEN CONCAT(SUBSTR(adm_dept_name, 1, 2), '*') ELSE CONCAT(SUBSTR(adm_dept_name, 1, CEIL(LENGTH(adm_dept_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(adm_dept_name) * 1/3))) END;
-- dscg_dept_name (person_name)
UPDATE stg_drds_mdtrt_d_fb_df_ytai SET dscg_dept_name = CASE WHEN LENGTH(dscg_dept_name) <= 2 THEN CONCAT(SUBSTR(dscg_dept_name, 1, 1), '*') WHEN LENGTH(dscg_dept_name) <= 4 THEN CONCAT(SUBSTR(dscg_dept_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dscg_dept_name, 1, CEIL(LENGTH(dscg_dept_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dscg_dept_name) * 1/3))) END;
-- dise_name (person_name)
UPDATE stg_drds_mdtrt_d_fb_df_ytai SET dise_name = CASE WHEN LENGTH(dise_name) <= 2 THEN CONCAT(SUBSTR(dise_name, 1, 1), '*') WHEN LENGTH(dise_name) <= 4 THEN CONCAT(SUBSTR(dise_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dise_name, 1, CEIL(LENGTH(dise_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dise_name) * 1/3))) END;
-- oprn_oprt_name (person_name)
UPDATE stg_drds_mdtrt_d_fb_df_ytai SET oprn_oprt_name = CASE WHEN LENGTH(oprn_oprt_name) <= 2 THEN CONCAT(SUBSTR(oprn_oprt_name, 1, 1), '*') WHEN LENGTH(oprn_oprt_name) <= 4 THEN CONCAT(SUBSTR(oprn_oprt_name, 1, 2), '*') ELSE CONCAT(SUBSTR(oprn_oprt_name, 1, CEIL(LENGTH(oprn_oprt_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(oprn_oprt_name) * 1/3))) END;
-- crter_id (person_name)
UPDATE stg_drds_mdtrt_d_fb_df_ytai SET crter_id = CASE WHEN LENGTH(crter_id) <= 2 THEN CONCAT(SUBSTR(crter_id, 1, 1), '*') WHEN LENGTH(crter_id) <= 4 THEN CONCAT(SUBSTR(crter_id, 1, 2), '*') ELSE CONCAT(SUBSTR(crter_id, 1, CEIL(LENGTH(crter_id) * 2/3)), REPEAT('*', FLOOR(LENGTH(crter_id) * 1/3))) END;
-- crter_name (person_name)
UPDATE stg_drds_mdtrt_d_fb_df_ytai SET crter_name = CASE WHEN LENGTH(crter_name) <= 2 THEN CONCAT(SUBSTR(crter_name, 1, 1), '*') WHEN LENGTH(crter_name) <= 4 THEN CONCAT(SUBSTR(crter_name, 1, 2), '*') ELSE CONCAT(SUBSTR(crter_name, 1, CEIL(LENGTH(crter_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(crter_name) * 1/3))) END;
-- crte_optins_no (org_name)
UPDATE stg_drds_mdtrt_d_fb_df_ytai SET crte_optins_no = CASE WHEN LENGTH(crte_optins_no) <= 5 THEN CONCAT(SUBSTR(crte_optins_no, 1, 3), REPEAT('*', LENGTH(crte_optins_no) - 3)) ELSE CONCAT(SUBSTR(crte_optins_no, 1, CEIL(LENGTH(crte_optins_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(crte_optins_no) * 1/3))) END;
-- opter_id (person_name)
UPDATE stg_drds_mdtrt_d_fb_df_ytai SET opter_id = CASE WHEN LENGTH(opter_id) <= 2 THEN CONCAT(SUBSTR(opter_id, 1, 1), '*') WHEN LENGTH(opter_id) <= 4 THEN CONCAT(SUBSTR(opter_id, 1, 2), '*') ELSE CONCAT(SUBSTR(opter_id, 1, CEIL(LENGTH(opter_id) * 2/3)), REPEAT('*', FLOOR(LENGTH(opter_id) * 1/3))) END;
-- opter_name (person_name)
UPDATE stg_drds_mdtrt_d_fb_df_ytai SET opter_name = CASE WHEN LENGTH(opter_name) <= 2 THEN CONCAT(SUBSTR(opter_name, 1, 1), '*') WHEN LENGTH(opter_name) <= 4 THEN CONCAT(SUBSTR(opter_name, 1, 2), '*') ELSE CONCAT(SUBSTR(opter_name, 1, CEIL(LENGTH(opter_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(opter_name) * 1/3))) END;
-- optins_no (org_name)
UPDATE stg_drds_mdtrt_d_fb_df_ytai SET optins_no = CASE WHEN LENGTH(optins_no) <= 5 THEN CONCAT(SUBSTR(optins_no, 1, 3), REPEAT('*', LENGTH(optins_no) - 3)) ELSE CONCAT(SUBSTR(optins_no, 1, CEIL(LENGTH(optins_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(optins_no) * 1/3))) END;
-- chfpdr_name (person_name)
UPDATE stg_drds_mdtrt_d_fb_df_ytai SET chfpdr_name = CASE WHEN LENGTH(chfpdr_name) <= 2 THEN CONCAT(SUBSTR(chfpdr_name, 1, 1), '*') WHEN LENGTH(chfpdr_name) <= 4 THEN CONCAT(SUBSTR(chfpdr_name, 1, 2), '*') ELSE CONCAT(SUBSTR(chfpdr_name, 1, CEIL(LENGTH(chfpdr_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(chfpdr_name) * 1/3))) END;
-- dscg_maindiag_name (person_name)
UPDATE stg_drds_mdtrt_d_fb_df_ytai SET dscg_maindiag_name = CASE WHEN LENGTH(dscg_maindiag_name) <= 2 THEN CONCAT(SUBSTR(dscg_maindiag_name, 1, 1), '*') WHEN LENGTH(dscg_maindiag_name) <= 4 THEN CONCAT(SUBSTR(dscg_maindiag_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dscg_maindiag_name, 1, CEIL(LENGTH(dscg_maindiag_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dscg_maindiag_name) * 1/3))) END;

-- 表: stg_drds_opsp_reg_fb_sd_df_ytai
-- psn_no (person_id)
UPDATE stg_drds_opsp_reg_fb_sd_df_ytai SET psn_no = CASE WHEN LENGTH(psn_no) <= 8 THEN CONCAT(SUBSTR(psn_no, 1, 5), REPEAT('*', LENGTH(psn_no) - 5)) ELSE CONCAT(SUBSTR(psn_no, 1, CEIL(LENGTH(psn_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(psn_no) * 1/3))) END;
-- opsp_dise_name (person_name)
UPDATE stg_drds_opsp_reg_fb_sd_df_ytai SET opsp_dise_name = CASE WHEN LENGTH(opsp_dise_name) <= 2 THEN CONCAT(SUBSTR(opsp_dise_name, 1, 1), '*') WHEN LENGTH(opsp_dise_name) <= 4 THEN CONCAT(SUBSTR(opsp_dise_name, 1, 2), '*') ELSE CONCAT(SUBSTR(opsp_dise_name, 1, CEIL(LENGTH(opsp_dise_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(opsp_dise_name) * 1/3))) END;
-- certno (id_card)
UPDATE stg_drds_opsp_reg_fb_sd_df_ytai SET certno = CASE WHEN LENGTH(certno) <= 10 THEN CONCAT(SUBSTR(certno, 1, 7), REPEAT('*', LENGTH(certno) - 7)) ELSE CONCAT(SUBSTR(certno, 1, CEIL(LENGTH(certno) * 2/3)), REPEAT('*', FLOOR(LENGTH(certno) * 1/3))) END;
-- psn_name (person_name)
UPDATE stg_drds_opsp_reg_fb_sd_df_ytai SET psn_name = CASE WHEN LENGTH(psn_name) <= 2 THEN CONCAT(SUBSTR(psn_name, 1, 1), '*') WHEN LENGTH(psn_name) <= 4 THEN CONCAT(SUBSTR(psn_name, 1, 2), '*') ELSE CONCAT(SUBSTR(psn_name, 1, CEIL(LENGTH(psn_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(psn_name) * 1/3))) END;
-- tel (phone)
UPDATE stg_drds_opsp_reg_fb_sd_df_ytai SET tel = CASE WHEN LENGTH(tel) <= 8 THEN CONCAT(SUBSTR(tel, 1, 5), REPEAT('*', LENGTH(tel) - 5)) ELSE CONCAT(SUBSTR(tel, 1, CEIL(LENGTH(tel) * 2/3)), REPEAT('*', FLOOR(LENGTH(tel) * 1/3))) END;
-- addr (address)
UPDATE stg_drds_opsp_reg_fb_sd_df_ytai SET addr = CASE WHEN LENGTH(addr) <= 10 THEN CONCAT(SUBSTR(addr, 1, 7), REPEAT('*', LENGTH(addr) - 7)) ELSE CONCAT(SUBSTR(addr, 1, CEIL(LENGTH(addr) * 2/3)), REPEAT('*', FLOOR(LENGTH(addr) * 1/3))) END;
-- emp_no (org_name)
UPDATE stg_drds_opsp_reg_fb_sd_df_ytai SET emp_no = CASE WHEN LENGTH(emp_no) <= 5 THEN CONCAT(SUBSTR(emp_no, 1, 3), REPEAT('*', LENGTH(emp_no) - 3)) ELSE CONCAT(SUBSTR(emp_no, 1, CEIL(LENGTH(emp_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(emp_no) * 1/3))) END;
-- emp_name (person_name)
UPDATE stg_drds_opsp_reg_fb_sd_df_ytai SET emp_name = CASE WHEN LENGTH(emp_name) <= 2 THEN CONCAT(SUBSTR(emp_name, 1, 1), '*') WHEN LENGTH(emp_name) <= 4 THEN CONCAT(SUBSTR(emp_name, 1, 2), '*') ELSE CONCAT(SUBSTR(emp_name, 1, CEIL(LENGTH(emp_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(emp_name) * 1/3))) END;
-- ide_fixmedins_no (org_name)
UPDATE stg_drds_opsp_reg_fb_sd_df_ytai SET ide_fixmedins_no = CASE WHEN LENGTH(ide_fixmedins_no) <= 5 THEN CONCAT(SUBSTR(ide_fixmedins_no, 1, 3), REPEAT('*', LENGTH(ide_fixmedins_no) - 3)) ELSE CONCAT(SUBSTR(ide_fixmedins_no, 1, CEIL(LENGTH(ide_fixmedins_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(ide_fixmedins_no) * 1/3))) END;
-- ide_fixmedins_name (person_name)
UPDATE stg_drds_opsp_reg_fb_sd_df_ytai SET ide_fixmedins_name = CASE WHEN LENGTH(ide_fixmedins_name) <= 2 THEN CONCAT(SUBSTR(ide_fixmedins_name, 1, 1), '*') WHEN LENGTH(ide_fixmedins_name) <= 4 THEN CONCAT(SUBSTR(ide_fixmedins_name, 1, 2), '*') ELSE CONCAT(SUBSTR(ide_fixmedins_name, 1, CEIL(LENGTH(ide_fixmedins_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(ide_fixmedins_name) * 1/3))) END;
-- hosp_ide_date (org_name)
UPDATE stg_drds_opsp_reg_fb_sd_df_ytai SET hosp_ide_date = CASE WHEN LENGTH(hosp_ide_date) <= 5 THEN CONCAT(SUBSTR(hosp_ide_date, 1, 3), REPEAT('*', LENGTH(hosp_ide_date) - 3)) ELSE CONCAT(SUBSTR(hosp_ide_date, 1, CEIL(LENGTH(hosp_ide_date) * 2/3)), REPEAT('*', FLOOR(LENGTH(hosp_ide_date) * 1/3))) END;
-- diag_dr_code (person_name)
UPDATE stg_drds_opsp_reg_fb_sd_df_ytai SET diag_dr_code = CASE WHEN LENGTH(diag_dr_code) <= 2 THEN CONCAT(SUBSTR(diag_dr_code, 1, 1), '*') WHEN LENGTH(diag_dr_code) <= 4 THEN CONCAT(SUBSTR(diag_dr_code, 1, 2), '*') ELSE CONCAT(SUBSTR(diag_dr_code, 1, CEIL(LENGTH(diag_dr_code) * 2/3)), REPEAT('*', FLOOR(LENGTH(diag_dr_code) * 1/3))) END;
-- diag_dr_name (person_name)
UPDATE stg_drds_opsp_reg_fb_sd_df_ytai SET diag_dr_name = CASE WHEN LENGTH(diag_dr_name) <= 2 THEN CONCAT(SUBSTR(diag_dr_name, 1, 1), '*') WHEN LENGTH(diag_dr_name) <= 4 THEN CONCAT(SUBSTR(diag_dr_name, 1, 2), '*') ELSE CONCAT(SUBSTR(diag_dr_name, 1, CEIL(LENGTH(diag_dr_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(diag_dr_name) * 1/3))) END;
-- agnter_name (person_name)
UPDATE stg_drds_opsp_reg_fb_sd_df_ytai SET agnter_name = CASE WHEN LENGTH(agnter_name) <= 2 THEN CONCAT(SUBSTR(agnter_name, 1, 1), '*') WHEN LENGTH(agnter_name) <= 4 THEN CONCAT(SUBSTR(agnter_name, 1, 2), '*') ELSE CONCAT(SUBSTR(agnter_name, 1, CEIL(LENGTH(agnter_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(agnter_name) * 1/3))) END;
-- agnter_certno (id_card)
UPDATE stg_drds_opsp_reg_fb_sd_df_ytai SET agnter_certno = CASE WHEN LENGTH(agnter_certno) <= 10 THEN CONCAT(SUBSTR(agnter_certno, 1, 7), REPEAT('*', LENGTH(agnter_certno) - 7)) ELSE CONCAT(SUBSTR(agnter_certno, 1, CEIL(LENGTH(agnter_certno) * 2/3)), REPEAT('*', FLOOR(LENGTH(agnter_certno) * 1/3))) END;
-- agnter_tel (phone)
UPDATE stg_drds_opsp_reg_fb_sd_df_ytai SET agnter_tel = CASE WHEN LENGTH(agnter_tel) <= 8 THEN CONCAT(SUBSTR(agnter_tel, 1, 5), REPEAT('*', LENGTH(agnter_tel) - 5)) ELSE CONCAT(SUBSTR(agnter_tel, 1, CEIL(LENGTH(agnter_tel) * 2/3)), REPEAT('*', FLOOR(LENGTH(agnter_tel) * 1/3))) END;
-- agnter_addr (address)
UPDATE stg_drds_opsp_reg_fb_sd_df_ytai SET agnter_addr = CASE WHEN LENGTH(agnter_addr) <= 10 THEN CONCAT(SUBSTR(agnter_addr, 1, 7), REPEAT('*', LENGTH(agnter_addr) - 7)) ELSE CONCAT(SUBSTR(agnter_addr, 1, CEIL(LENGTH(agnter_addr) * 2/3)), REPEAT('*', FLOOR(LENGTH(agnter_addr) * 1/3))) END;
-- crter_id (person_name)
UPDATE stg_drds_opsp_reg_fb_sd_df_ytai SET crter_id = CASE WHEN LENGTH(crter_id) <= 2 THEN CONCAT(SUBSTR(crter_id, 1, 1), '*') WHEN LENGTH(crter_id) <= 4 THEN CONCAT(SUBSTR(crter_id, 1, 2), '*') ELSE CONCAT(SUBSTR(crter_id, 1, CEIL(LENGTH(crter_id) * 2/3)), REPEAT('*', FLOOR(LENGTH(crter_id) * 1/3))) END;
-- crter_name (person_name)
UPDATE stg_drds_opsp_reg_fb_sd_df_ytai SET crter_name = CASE WHEN LENGTH(crter_name) <= 2 THEN CONCAT(SUBSTR(crter_name, 1, 1), '*') WHEN LENGTH(crter_name) <= 4 THEN CONCAT(SUBSTR(crter_name, 1, 2), '*') ELSE CONCAT(SUBSTR(crter_name, 1, CEIL(LENGTH(crter_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(crter_name) * 1/3))) END;
-- crte_optins_no (org_name)
UPDATE stg_drds_opsp_reg_fb_sd_df_ytai SET crte_optins_no = CASE WHEN LENGTH(crte_optins_no) <= 5 THEN CONCAT(SUBSTR(crte_optins_no, 1, 3), REPEAT('*', LENGTH(crte_optins_no) - 3)) ELSE CONCAT(SUBSTR(crte_optins_no, 1, CEIL(LENGTH(crte_optins_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(crte_optins_no) * 1/3))) END;
-- opter_id (person_name)
UPDATE stg_drds_opsp_reg_fb_sd_df_ytai SET opter_id = CASE WHEN LENGTH(opter_id) <= 2 THEN CONCAT(SUBSTR(opter_id, 1, 1), '*') WHEN LENGTH(opter_id) <= 4 THEN CONCAT(SUBSTR(opter_id, 1, 2), '*') ELSE CONCAT(SUBSTR(opter_id, 1, CEIL(LENGTH(opter_id) * 2/3)), REPEAT('*', FLOOR(LENGTH(opter_id) * 1/3))) END;
-- opter_name (person_name)
UPDATE stg_drds_opsp_reg_fb_sd_df_ytai SET opter_name = CASE WHEN LENGTH(opter_name) <= 2 THEN CONCAT(SUBSTR(opter_name, 1, 1), '*') WHEN LENGTH(opter_name) <= 4 THEN CONCAT(SUBSTR(opter_name, 1, 2), '*') ELSE CONCAT(SUBSTR(opter_name, 1, CEIL(LENGTH(opter_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(opter_name) * 1/3))) END;
-- optins_no (org_name)
UPDATE stg_drds_opsp_reg_fb_sd_df_ytai SET optins_no = CASE WHEN LENGTH(optins_no) <= 5 THEN CONCAT(SUBSTR(optins_no, 1, 3), REPEAT('*', LENGTH(optins_no) - 3)) ELSE CONCAT(SUBSTR(optins_no, 1, CEIL(LENGTH(optins_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(optins_no) * 1/3))) END;

-- 表: stg_drg_fixmedins_list_mf_ytai
-- fixmedins_name (person_name)
UPDATE stg_drg_fixmedins_list_mf_ytai SET fixmedins_name = CASE WHEN LENGTH(fixmedins_name) <= 2 THEN CONCAT(SUBSTR(fixmedins_name, 1, 1), '*') WHEN LENGTH(fixmedins_name) <= 4 THEN CONCAT(SUBSTR(fixmedins_name, 1, 2), '*') ELSE CONCAT(SUBSTR(fixmedins_name, 1, CEIL(LENGTH(fixmedins_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_name) * 1/3))) END;

-- 表: stg_drg_wt_kpi_detl_mf_ytai
-- drg_name (person_name)
UPDATE stg_drg_wt_kpi_detl_mf_ytai SET drg_name = CASE WHEN LENGTH(drg_name) <= 2 THEN CONCAT(SUBSTR(drg_name, 1, 1), '*') WHEN LENGTH(drg_name) <= 4 THEN CONCAT(SUBSTR(drg_name, 1, 2), '*') ELSE CONCAT(SUBSTR(drg_name, 1, CEIL(LENGTH(drg_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(drg_name) * 1/3))) END;

-- 表: stg_drg_zywt_kpi_detl_mf_ytai
-- drg_name (person_name)
UPDATE stg_drg_zywt_kpi_detl_mf_ytai SET drg_name = CASE WHEN LENGTH(drg_name) <= 2 THEN CONCAT(SUBSTR(drg_name, 1, 1), '*') WHEN LENGTH(drg_name) <= 4 THEN CONCAT(SUBSTR(drg_name, 1, 2), '*') ELSE CONCAT(SUBSTR(drg_name, 1, CEIL(LENGTH(drg_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(drg_name) * 1/3))) END;

-- 表: stg_fixmedins_b_df_ytai
-- fixmedins_type (org_name)
UPDATE stg_fixmedins_b_df_ytai SET fixmedins_type = CASE WHEN LENGTH(fixmedins_type) <= 5 THEN CONCAT(SUBSTR(fixmedins_type, 1, 3), REPEAT('*', LENGTH(fixmedins_type) - 3)) ELSE CONCAT(SUBSTR(fixmedins_type, 1, CEIL(LENGTH(fixmedins_type) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_type) * 1/3))) END;
-- fixmedins_code (org_name)
UPDATE stg_fixmedins_b_df_ytai SET fixmedins_code = CASE WHEN LENGTH(fixmedins_code) <= 5 THEN CONCAT(SUBSTR(fixmedins_code, 1, 3), REPEAT('*', LENGTH(fixmedins_code) - 3)) ELSE CONCAT(SUBSTR(fixmedins_code, 1, CEIL(LENGTH(fixmedins_code) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_code) * 1/3))) END;
-- medins_mgtcode (org_name)
UPDATE stg_fixmedins_b_df_ytai SET medins_mgtcode = CASE WHEN LENGTH(medins_mgtcode) <= 5 THEN CONCAT(SUBSTR(medins_mgtcode, 1, 3), REPEAT('*', LENGTH(medins_mgtcode) - 3)) ELSE CONCAT(SUBSTR(medins_mgtcode, 1, CEIL(LENGTH(medins_mgtcode) * 2/3)), REPEAT('*', FLOOR(LENGTH(medins_mgtcode) * 1/3))) END;
-- orgcode (org_name)
UPDATE stg_fixmedins_b_df_ytai SET orgcode = CASE WHEN LENGTH(orgcode) <= 5 THEN CONCAT(SUBSTR(orgcode, 1, 3), REPEAT('*', LENGTH(orgcode) - 3)) ELSE CONCAT(SUBSTR(orgcode, 1, CEIL(LENGTH(orgcode) * 2/3)), REPEAT('*', FLOOR(LENGTH(orgcode) * 1/3))) END;
-- fixmedins_name (person_name)
UPDATE stg_fixmedins_b_df_ytai SET fixmedins_name = CASE WHEN LENGTH(fixmedins_name) <= 2 THEN CONCAT(SUBSTR(fixmedins_name, 1, 1), '*') WHEN LENGTH(fixmedins_name) <= 4 THEN CONCAT(SUBSTR(fixmedins_name, 1, 2), '*') ELSE CONCAT(SUBSTR(fixmedins_name, 1, CEIL(LENGTH(fixmedins_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_name) * 1/3))) END;
-- hosp_lv (org_name)
UPDATE stg_fixmedins_b_df_ytai SET hosp_lv = CASE WHEN LENGTH(hosp_lv) <= 5 THEN CONCAT(SUBSTR(hosp_lv, 1, 3), REPEAT('*', LENGTH(hosp_lv) - 3)) ELSE CONCAT(SUBSTR(hosp_lv, 1, CEIL(LENGTH(hosp_lv) * 2/3)), REPEAT('*', FLOOR(LENGTH(hosp_lv) * 1/3))) END;
-- lmtpric_hosp_lv (org_name)
UPDATE stg_fixmedins_b_df_ytai SET lmtpric_hosp_lv = CASE WHEN LENGTH(lmtpric_hosp_lv) <= 5 THEN CONCAT(SUBSTR(lmtpric_hosp_lv, 1, 3), REPEAT('*', LENGTH(lmtpric_hosp_lv) - 3)) ELSE CONCAT(SUBSTR(lmtpric_hosp_lv, 1, CEIL(LENGTH(lmtpric_hosp_lv) * 2/3)), REPEAT('*', FLOOR(LENGTH(lmtpric_hosp_lv) * 1/3))) END;
-- dedc_hosp_lv (org_name)
UPDATE stg_fixmedins_b_df_ytai SET dedc_hosp_lv = CASE WHEN LENGTH(dedc_hosp_lv) <= 5 THEN CONCAT(SUBSTR(dedc_hosp_lv, 1, 3), REPEAT('*', LENGTH(dedc_hosp_lv) - 3)) ELSE CONCAT(SUBSTR(dedc_hosp_lv, 1, CEIL(LENGTH(dedc_hosp_lv) * 2/3)), REPEAT('*', FLOOR(LENGTH(dedc_hosp_lv) * 1/3))) END;
-- hi_resper_name (person_name)
UPDATE stg_fixmedins_b_df_ytai SET hi_resper_name = CASE WHEN LENGTH(hi_resper_name) <= 2 THEN CONCAT(SUBSTR(hi_resper_name, 1, 1), '*') WHEN LENGTH(hi_resper_name) <= 4 THEN CONCAT(SUBSTR(hi_resper_name, 1, 2), '*') ELSE CONCAT(SUBSTR(hi_resper_name, 1, CEIL(LENGTH(hi_resper_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(hi_resper_name) * 1/3))) END;
-- hi_resper_tel (phone)
UPDATE stg_fixmedins_b_df_ytai SET hi_resper_tel = CASE WHEN LENGTH(hi_resper_tel) <= 8 THEN CONCAT(SUBSTR(hi_resper_tel, 1, 5), REPEAT('*', LENGTH(hi_resper_tel) - 5)) ELSE CONCAT(SUBSTR(hi_resper_tel, 1, CEIL(LENGTH(hi_resper_tel) * 2/3)), REPEAT('*', FLOOR(LENGTH(hi_resper_tel) * 1/3))) END;
-- hi_resper_certno (id_card)
UPDATE stg_fixmedins_b_df_ytai SET hi_resper_certno = CASE WHEN LENGTH(hi_resper_certno) <= 10 THEN CONCAT(SUBSTR(hi_resper_certno, 1, 7), REPEAT('*', LENGTH(hi_resper_certno) - 7)) ELSE CONCAT(SUBSTR(hi_resper_certno, 1, CEIL(LENGTH(hi_resper_certno) * 2/3)), REPEAT('*', FLOOR(LENGTH(hi_resper_certno) * 1/3))) END;
-- out_fixmedins_type (org_name)
UPDATE stg_fixmedins_b_df_ytai SET out_fixmedins_type = CASE WHEN LENGTH(out_fixmedins_type) <= 5 THEN CONCAT(SUBSTR(out_fixmedins_type, 1, 3), REPEAT('*', LENGTH(out_fixmedins_type) - 3)) ELSE CONCAT(SUBSTR(out_fixmedins_type, 1, CEIL(LENGTH(out_fixmedins_type) * 2/3)), REPEAT('*', FLOOR(LENGTH(out_fixmedins_type) * 1/3))) END;
-- nat_plaf_code (org_name)
UPDATE stg_fixmedins_b_df_ytai SET nat_plaf_code = CASE WHEN LENGTH(nat_plaf_code) <= 5 THEN CONCAT(SUBSTR(nat_plaf_code, 1, 3), REPEAT('*', LENGTH(nat_plaf_code) - 3)) ELSE CONCAT(SUBSTR(nat_plaf_code, 1, CEIL(LENGTH(nat_plaf_code) * 2/3)), REPEAT('*', FLOOR(LENGTH(nat_plaf_code) * 1/3))) END;
-- prov_plaf_code (org_name)
UPDATE stg_fixmedins_b_df_ytai SET prov_plaf_code = CASE WHEN LENGTH(prov_plaf_code) <= 5 THEN CONCAT(SUBSTR(prov_plaf_code, 1, 3), REPEAT('*', LENGTH(prov_plaf_code) - 3)) ELSE CONCAT(SUBSTR(prov_plaf_code, 1, CEIL(LENGTH(prov_plaf_code) * 2/3)), REPEAT('*', FLOOR(LENGTH(prov_plaf_code) * 1/3))) END;
-- crter_id (person_name)
UPDATE stg_fixmedins_b_df_ytai SET crter_id = CASE WHEN LENGTH(crter_id) <= 2 THEN CONCAT(SUBSTR(crter_id, 1, 1), '*') WHEN LENGTH(crter_id) <= 4 THEN CONCAT(SUBSTR(crter_id, 1, 2), '*') ELSE CONCAT(SUBSTR(crter_id, 1, CEIL(LENGTH(crter_id) * 2/3)), REPEAT('*', FLOOR(LENGTH(crter_id) * 1/3))) END;
-- crter_name (person_name)
UPDATE stg_fixmedins_b_df_ytai SET crter_name = CASE WHEN LENGTH(crter_name) <= 2 THEN CONCAT(SUBSTR(crter_name, 1, 1), '*') WHEN LENGTH(crter_name) <= 4 THEN CONCAT(SUBSTR(crter_name, 1, 2), '*') ELSE CONCAT(SUBSTR(crter_name, 1, CEIL(LENGTH(crter_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(crter_name) * 1/3))) END;
-- crte_optins_no (org_name)
UPDATE stg_fixmedins_b_df_ytai SET crte_optins_no = CASE WHEN LENGTH(crte_optins_no) <= 5 THEN CONCAT(SUBSTR(crte_optins_no, 1, 3), REPEAT('*', LENGTH(crte_optins_no) - 3)) ELSE CONCAT(SUBSTR(crte_optins_no, 1, CEIL(LENGTH(crte_optins_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(crte_optins_no) * 1/3))) END;
-- opter_id (person_name)
UPDATE stg_fixmedins_b_df_ytai SET opter_id = CASE WHEN LENGTH(opter_id) <= 2 THEN CONCAT(SUBSTR(opter_id, 1, 1), '*') WHEN LENGTH(opter_id) <= 4 THEN CONCAT(SUBSTR(opter_id, 1, 2), '*') ELSE CONCAT(SUBSTR(opter_id, 1, CEIL(LENGTH(opter_id) * 2/3)), REPEAT('*', FLOOR(LENGTH(opter_id) * 1/3))) END;
-- opter_name (person_name)
UPDATE stg_fixmedins_b_df_ytai SET opter_name = CASE WHEN LENGTH(opter_name) <= 2 THEN CONCAT(SUBSTR(opter_name, 1, 1), '*') WHEN LENGTH(opter_name) <= 4 THEN CONCAT(SUBSTR(opter_name, 1, 2), '*') ELSE CONCAT(SUBSTR(opter_name, 1, CEIL(LENGTH(opter_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(opter_name) * 1/3))) END;
-- optins_no (org_name)
UPDATE stg_fixmedins_b_df_ytai SET optins_no = CASE WHEN LENGTH(optins_no) <= 5 THEN CONCAT(SUBSTR(optins_no, 1, 3), REPEAT('*', LENGTH(optins_no) - 3)) ELSE CONCAT(SUBSTR(optins_no, 1, CEIL(LENGTH(optins_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(optins_no) * 1/3))) END;

-- 表: stg_grassroots_site_mf_ytai
-- site_name (person_name)
UPDATE stg_grassroots_site_mf_ytai SET site_name = CASE WHEN LENGTH(site_name) <= 2 THEN CONCAT(SUBSTR(site_name, 1, 1), '*') WHEN LENGTH(site_name) <= 4 THEN CONCAT(SUBSTR(site_name, 1, 2), '*') ELSE CONCAT(SUBSTR(site_name, 1, CEIL(LENGTH(site_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(site_name) * 1/3))) END;
-- parent_site_name (person_name)
UPDATE stg_grassroots_site_mf_ytai SET parent_site_name = CASE WHEN LENGTH(parent_site_name) <= 2 THEN CONCAT(SUBSTR(parent_site_name, 1, 1), '*') WHEN LENGTH(parent_site_name) <= 4 THEN CONCAT(SUBSTR(parent_site_name, 1, 2), '*') ELSE CONCAT(SUBSTR(parent_site_name, 1, CEIL(LENGTH(parent_site_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(parent_site_name) * 1/3))) END;
-- opter_sys_name (person_name)
UPDATE stg_grassroots_site_mf_ytai SET opter_sys_name = CASE WHEN LENGTH(opter_sys_name) <= 2 THEN CONCAT(SUBSTR(opter_sys_name, 1, 1), '*') WHEN LENGTH(opter_sys_name) <= 4 THEN CONCAT(SUBSTR(opter_sys_name, 1, 2), '*') ELSE CONCAT(SUBSTR(opter_sys_name, 1, CEIL(LENGTH(opter_sys_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(opter_sys_name) * 1/3))) END;
-- medical_type (org_name)
UPDATE stg_grassroots_site_mf_ytai SET medical_type = CASE WHEN LENGTH(medical_type) <= 5 THEN CONCAT(SUBSTR(medical_type, 1, 3), REPEAT('*', LENGTH(medical_type) - 3)) ELSE CONCAT(SUBSTR(medical_type, 1, CEIL(LENGTH(medical_type) * 2/3)), REPEAT('*', FLOOR(LENGTH(medical_type) * 1/3))) END;
-- address (address)
UPDATE stg_grassroots_site_mf_ytai SET address = CASE WHEN LENGTH(address) <= 10 THEN CONCAT(SUBSTR(address, 1, 7), REPEAT('*', LENGTH(address) - 7)) ELSE CONCAT(SUBSTR(address, 1, CEIL(LENGTH(address) * 2/3)), REPEAT('*', FLOOR(LENGTH(address) * 1/3))) END;
-- contact_name (person_name)
UPDATE stg_grassroots_site_mf_ytai SET contact_name = CASE WHEN LENGTH(contact_name) <= 2 THEN CONCAT(SUBSTR(contact_name, 1, 1), '*') WHEN LENGTH(contact_name) <= 4 THEN CONCAT(SUBSTR(contact_name, 1, 2), '*') ELSE CONCAT(SUBSTR(contact_name, 1, CEIL(LENGTH(contact_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(contact_name) * 1/3))) END;
-- contact_phone (phone)
UPDATE stg_grassroots_site_mf_ytai SET contact_phone = CASE WHEN LENGTH(contact_phone) <= 8 THEN CONCAT(SUBSTR(contact_phone, 1, 5), REPEAT('*', LENGTH(contact_phone) - 5)) ELSE CONCAT(SUBSTR(contact_phone, 1, CEIL(LENGTH(contact_phone) * 2/3)), REPEAT('*', FLOOR(LENGTH(contact_phone) * 1/3))) END;

-- 表: stg_grassroots_site_mf_ytai_copy1
-- site_name (person_name)
UPDATE stg_grassroots_site_mf_ytai_copy1 SET site_name = CASE WHEN LENGTH(site_name) <= 2 THEN CONCAT(SUBSTR(site_name, 1, 1), '*') WHEN LENGTH(site_name) <= 4 THEN CONCAT(SUBSTR(site_name, 1, 2), '*') ELSE CONCAT(SUBSTR(site_name, 1, CEIL(LENGTH(site_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(site_name) * 1/3))) END;
-- parent_site_name (person_name)
UPDATE stg_grassroots_site_mf_ytai_copy1 SET parent_site_name = CASE WHEN LENGTH(parent_site_name) <= 2 THEN CONCAT(SUBSTR(parent_site_name, 1, 1), '*') WHEN LENGTH(parent_site_name) <= 4 THEN CONCAT(SUBSTR(parent_site_name, 1, 2), '*') ELSE CONCAT(SUBSTR(parent_site_name, 1, CEIL(LENGTH(parent_site_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(parent_site_name) * 1/3))) END;
-- opter_sys_name (person_name)
UPDATE stg_grassroots_site_mf_ytai_copy1 SET opter_sys_name = CASE WHEN LENGTH(opter_sys_name) <= 2 THEN CONCAT(SUBSTR(opter_sys_name, 1, 1), '*') WHEN LENGTH(opter_sys_name) <= 4 THEN CONCAT(SUBSTR(opter_sys_name, 1, 2), '*') ELSE CONCAT(SUBSTR(opter_sys_name, 1, CEIL(LENGTH(opter_sys_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(opter_sys_name) * 1/3))) END;
-- medical_type (org_name)
UPDATE stg_grassroots_site_mf_ytai_copy1 SET medical_type = CASE WHEN LENGTH(medical_type) <= 5 THEN CONCAT(SUBSTR(medical_type, 1, 3), REPEAT('*', LENGTH(medical_type) - 3)) ELSE CONCAT(SUBSTR(medical_type, 1, CEIL(LENGTH(medical_type) * 2/3)), REPEAT('*', FLOOR(LENGTH(medical_type) * 1/3))) END;
-- address (address)
UPDATE stg_grassroots_site_mf_ytai_copy1 SET address = CASE WHEN LENGTH(address) <= 10 THEN CONCAT(SUBSTR(address, 1, 7), REPEAT('*', LENGTH(address) - 7)) ELSE CONCAT(SUBSTR(address, 1, CEIL(LENGTH(address) * 2/3)), REPEAT('*', FLOOR(LENGTH(address) * 1/3))) END;
-- contact_name (person_name)
UPDATE stg_grassroots_site_mf_ytai_copy1 SET contact_name = CASE WHEN LENGTH(contact_name) <= 2 THEN CONCAT(SUBSTR(contact_name, 1, 1), '*') WHEN LENGTH(contact_name) <= 4 THEN CONCAT(SUBSTR(contact_name, 1, 2), '*') ELSE CONCAT(SUBSTR(contact_name, 1, CEIL(LENGTH(contact_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(contact_name) * 1/3))) END;
-- contact_phone (phone)
UPDATE stg_grassroots_site_mf_ytai_copy1 SET contact_phone = CASE WHEN LENGTH(contact_phone) <= 8 THEN CONCAT(SUBSTR(contact_phone, 1, 5), REPEAT('*', LENGTH(contact_phone) - 5)) ELSE CONCAT(SUBSTR(contact_phone, 1, CEIL(LENGTH(contact_phone) * 2/3)), REPEAT('*', FLOOR(LENGTH(contact_phone) * 1/3))) END;

-- 表: stg_longterm_eval_task_c_df_ytai
-- eval_org_no (org_name)
UPDATE stg_longterm_eval_task_c_df_ytai SET eval_org_no = CASE WHEN LENGTH(eval_org_no) <= 5 THEN CONCAT(SUBSTR(eval_org_no, 1, 3), REPEAT('*', LENGTH(eval_org_no) - 3)) ELSE CONCAT(SUBSTR(eval_org_no, 1, CEIL(LENGTH(eval_org_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(eval_org_no) * 1/3))) END;
-- eval_org_name (person_name)
UPDATE stg_longterm_eval_task_c_df_ytai SET eval_org_name = CASE WHEN LENGTH(eval_org_name) <= 2 THEN CONCAT(SUBSTR(eval_org_name, 1, 1), '*') WHEN LENGTH(eval_org_name) <= 4 THEN CONCAT(SUBSTR(eval_org_name, 1, 2), '*') ELSE CONCAT(SUBSTR(eval_org_name, 1, CEIL(LENGTH(eval_org_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(eval_org_name) * 1/3))) END;
-- psn_name (person_name)
UPDATE stg_longterm_eval_task_c_df_ytai SET psn_name = CASE WHEN LENGTH(psn_name) <= 2 THEN CONCAT(SUBSTR(psn_name, 1, 1), '*') WHEN LENGTH(psn_name) <= 4 THEN CONCAT(SUBSTR(psn_name, 1, 2), '*') ELSE CONCAT(SUBSTR(psn_name, 1, CEIL(LENGTH(psn_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(psn_name) * 1/3))) END;
-- psn_no (person_id)
UPDATE stg_longterm_eval_task_c_df_ytai SET psn_no = CASE WHEN LENGTH(psn_no) <= 8 THEN CONCAT(SUBSTR(psn_no, 1, 5), REPEAT('*', LENGTH(psn_no) - 5)) ELSE CONCAT(SUBSTR(psn_no, 1, CEIL(LENGTH(psn_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(psn_no) * 1/3))) END;
-- certno (id_card)
UPDATE stg_longterm_eval_task_c_df_ytai SET certno = CASE WHEN LENGTH(certno) <= 10 THEN CONCAT(SUBSTR(certno, 1, 7), REPEAT('*', LENGTH(certno) - 7)) ELSE CONCAT(SUBSTR(certno, 1, CEIL(LENGTH(certno) * 2/3)), REPEAT('*', FLOOR(LENGTH(certno) * 1/3))) END;
-- eval_addr (address)
UPDATE stg_longterm_eval_task_c_df_ytai SET eval_addr = CASE WHEN LENGTH(eval_addr) <= 10 THEN CONCAT(SUBSTR(eval_addr, 1, 7), REPEAT('*', LENGTH(eval_addr) - 7)) ELSE CONCAT(SUBSTR(eval_addr, 1, CEIL(LENGTH(eval_addr) * 2/3)), REPEAT('*', FLOOR(LENGTH(eval_addr) * 1/3))) END;
-- appy_org_no (org_name)
UPDATE stg_longterm_eval_task_c_df_ytai SET appy_org_no = CASE WHEN LENGTH(appy_org_no) <= 5 THEN CONCAT(SUBSTR(appy_org_no, 1, 3), REPEAT('*', LENGTH(appy_org_no) - 3)) ELSE CONCAT(SUBSTR(appy_org_no, 1, CEIL(LENGTH(appy_org_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(appy_org_no) * 1/3))) END;
-- appy_org_name (person_name)
UPDATE stg_longterm_eval_task_c_df_ytai SET appy_org_name = CASE WHEN LENGTH(appy_org_name) <= 2 THEN CONCAT(SUBSTR(appy_org_name, 1, 1), '*') WHEN LENGTH(appy_org_name) <= 4 THEN CONCAT(SUBSTR(appy_org_name, 1, 2), '*') ELSE CONCAT(SUBSTR(appy_org_name, 1, CEIL(LENGTH(appy_org_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(appy_org_name) * 1/3))) END;
-- crter_id (person_name)
UPDATE stg_longterm_eval_task_c_df_ytai SET crter_id = CASE WHEN LENGTH(crter_id) <= 2 THEN CONCAT(SUBSTR(crter_id, 1, 1), '*') WHEN LENGTH(crter_id) <= 4 THEN CONCAT(SUBSTR(crter_id, 1, 2), '*') ELSE CONCAT(SUBSTR(crter_id, 1, CEIL(LENGTH(crter_id) * 2/3)), REPEAT('*', FLOOR(LENGTH(crter_id) * 1/3))) END;
-- crter_name (person_name)
UPDATE stg_longterm_eval_task_c_df_ytai SET crter_name = CASE WHEN LENGTH(crter_name) <= 2 THEN CONCAT(SUBSTR(crter_name, 1, 1), '*') WHEN LENGTH(crter_name) <= 4 THEN CONCAT(SUBSTR(crter_name, 1, 2), '*') ELSE CONCAT(SUBSTR(crter_name, 1, CEIL(LENGTH(crter_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(crter_name) * 1/3))) END;
-- crte_optins_no (org_name)
UPDATE stg_longterm_eval_task_c_df_ytai SET crte_optins_no = CASE WHEN LENGTH(crte_optins_no) <= 5 THEN CONCAT(SUBSTR(crte_optins_no, 1, 3), REPEAT('*', LENGTH(crte_optins_no) - 3)) ELSE CONCAT(SUBSTR(crte_optins_no, 1, CEIL(LENGTH(crte_optins_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(crte_optins_no) * 1/3))) END;
-- opter_id (person_name)
UPDATE stg_longterm_eval_task_c_df_ytai SET opter_id = CASE WHEN LENGTH(opter_id) <= 2 THEN CONCAT(SUBSTR(opter_id, 1, 1), '*') WHEN LENGTH(opter_id) <= 4 THEN CONCAT(SUBSTR(opter_id, 1, 2), '*') ELSE CONCAT(SUBSTR(opter_id, 1, CEIL(LENGTH(opter_id) * 2/3)), REPEAT('*', FLOOR(LENGTH(opter_id) * 1/3))) END;
-- opter_name (person_name)
UPDATE stg_longterm_eval_task_c_df_ytai SET opter_name = CASE WHEN LENGTH(opter_name) <= 2 THEN CONCAT(SUBSTR(opter_name, 1, 1), '*') WHEN LENGTH(opter_name) <= 4 THEN CONCAT(SUBSTR(opter_name, 1, 2), '*') ELSE CONCAT(SUBSTR(opter_name, 1, CEIL(LENGTH(opter_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(opter_name) * 1/3))) END;
-- optins_no (org_name)
UPDATE stg_longterm_eval_task_c_df_ytai SET optins_no = CASE WHEN LENGTH(optins_no) <= 5 THEN CONCAT(SUBSTR(optins_no, 1, 3), REPEAT('*', LENGTH(optins_no) - 3)) ELSE CONCAT(SUBSTR(optins_no, 1, CEIL(LENGTH(optins_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(optins_no) * 1/3))) END;

-- 表: stg_longterm_reg_d_df_ytai
-- psn_no (person_id)
UPDATE stg_longterm_reg_d_df_ytai SET psn_no = CASE WHEN LENGTH(psn_no) <= 8 THEN CONCAT(SUBSTR(psn_no, 1, 5), REPEAT('*', LENGTH(psn_no) - 5)) ELSE CONCAT(SUBSTR(psn_no, 1, CEIL(LENGTH(psn_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(psn_no) * 1/3))) END;
-- psn_name (person_name)
UPDATE stg_longterm_reg_d_df_ytai SET psn_name = CASE WHEN LENGTH(psn_name) <= 2 THEN CONCAT(SUBSTR(psn_name, 1, 1), '*') WHEN LENGTH(psn_name) <= 4 THEN CONCAT(SUBSTR(psn_name, 1, 2), '*') ELSE CONCAT(SUBSTR(psn_name, 1, CEIL(LENGTH(psn_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(psn_name) * 1/3))) END;
-- certno (id_card)
UPDATE stg_longterm_reg_d_df_ytai SET certno = CASE WHEN LENGTH(certno) <= 10 THEN CONCAT(SUBSTR(certno, 1, 7), REPEAT('*', LENGTH(certno) - 7)) ELSE CONCAT(SUBSTR(certno, 1, CEIL(LENGTH(certno) * 2/3)), REPEAT('*', FLOOR(LENGTH(certno) * 1/3))) END;
-- nurscare_org_no (org_name)
UPDATE stg_longterm_reg_d_df_ytai SET nurscare_org_no = CASE WHEN LENGTH(nurscare_org_no) <= 5 THEN CONCAT(SUBSTR(nurscare_org_no, 1, 3), REPEAT('*', LENGTH(nurscare_org_no) - 3)) ELSE CONCAT(SUBSTR(nurscare_org_no, 1, CEIL(LENGTH(nurscare_org_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(nurscare_org_no) * 1/3))) END;
-- nurscare_org_name (person_name)
UPDATE stg_longterm_reg_d_df_ytai SET nurscare_org_name = CASE WHEN LENGTH(nurscare_org_name) <= 2 THEN CONCAT(SUBSTR(nurscare_org_name, 1, 1), '*') WHEN LENGTH(nurscare_org_name) <= 4 THEN CONCAT(SUBSTR(nurscare_org_name, 1, 2), '*') ELSE CONCAT(SUBSTR(nurscare_org_name, 1, CEIL(LENGTH(nurscare_org_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(nurscare_org_name) * 1/3))) END;
-- sup_medstff_name (person_name)
UPDATE stg_longterm_reg_d_df_ytai SET sup_medstff_name = CASE WHEN LENGTH(sup_medstff_name) <= 2 THEN CONCAT(SUBSTR(sup_medstff_name, 1, 1), '*') WHEN LENGTH(sup_medstff_name) <= 4 THEN CONCAT(SUBSTR(sup_medstff_name, 1, 2), '*') ELSE CONCAT(SUBSTR(sup_medstff_name, 1, CEIL(LENGTH(sup_medstff_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(sup_medstff_name) * 1/3))) END;
-- disename (person_name)
UPDATE stg_longterm_reg_d_df_ytai SET disename = CASE WHEN LENGTH(disename) <= 2 THEN CONCAT(SUBSTR(disename, 1, 1), '*') WHEN LENGTH(disename) <= 4 THEN CONCAT(SUBSTR(disename, 1, 2), '*') ELSE CONCAT(SUBSTR(disename, 1, CEIL(LENGTH(disename) * 2/3)), REPEAT('*', FLOOR(LENGTH(disename) * 1/3))) END;
-- dept_name (person_name)
UPDATE stg_longterm_reg_d_df_ytai SET dept_name = CASE WHEN LENGTH(dept_name) <= 2 THEN CONCAT(SUBSTR(dept_name, 1, 1), '*') WHEN LENGTH(dept_name) <= 4 THEN CONCAT(SUBSTR(dept_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dept_name, 1, CEIL(LENGTH(dept_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dept_name) * 1/3))) END;
-- bank_name (person_name)
UPDATE stg_longterm_reg_d_df_ytai SET bank_name = CASE WHEN LENGTH(bank_name) <= 2 THEN CONCAT(SUBSTR(bank_name, 1, 1), '*') WHEN LENGTH(bank_name) <= 4 THEN CONCAT(SUBSTR(bank_name, 1, 2), '*') ELSE CONCAT(SUBSTR(bank_name, 1, CEIL(LENGTH(bank_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(bank_name) * 1/3))) END;
-- bank_acctname (person_name)
UPDATE stg_longterm_reg_d_df_ytai SET bank_acctname = CASE WHEN LENGTH(bank_acctname) <= 2 THEN CONCAT(SUBSTR(bank_acctname, 1, 1), '*') WHEN LENGTH(bank_acctname) <= 4 THEN CONCAT(SUBSTR(bank_acctname, 1, 2), '*') ELSE CONCAT(SUBSTR(bank_acctname, 1, CEIL(LENGTH(bank_acctname) * 2/3)), REPEAT('*', FLOOR(LENGTH(bank_acctname) * 1/3))) END;
-- crter_id (person_name)
UPDATE stg_longterm_reg_d_df_ytai SET crter_id = CASE WHEN LENGTH(crter_id) <= 2 THEN CONCAT(SUBSTR(crter_id, 1, 1), '*') WHEN LENGTH(crter_id) <= 4 THEN CONCAT(SUBSTR(crter_id, 1, 2), '*') ELSE CONCAT(SUBSTR(crter_id, 1, CEIL(LENGTH(crter_id) * 2/3)), REPEAT('*', FLOOR(LENGTH(crter_id) * 1/3))) END;
-- crter_name (person_name)
UPDATE stg_longterm_reg_d_df_ytai SET crter_name = CASE WHEN LENGTH(crter_name) <= 2 THEN CONCAT(SUBSTR(crter_name, 1, 1), '*') WHEN LENGTH(crter_name) <= 4 THEN CONCAT(SUBSTR(crter_name, 1, 2), '*') ELSE CONCAT(SUBSTR(crter_name, 1, CEIL(LENGTH(crter_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(crter_name) * 1/3))) END;
-- crte_optins_no (org_name)
UPDATE stg_longterm_reg_d_df_ytai SET crte_optins_no = CASE WHEN LENGTH(crte_optins_no) <= 5 THEN CONCAT(SUBSTR(crte_optins_no, 1, 3), REPEAT('*', LENGTH(crte_optins_no) - 3)) ELSE CONCAT(SUBSTR(crte_optins_no, 1, CEIL(LENGTH(crte_optins_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(crte_optins_no) * 1/3))) END;
-- opter_id (person_name)
UPDATE stg_longterm_reg_d_df_ytai SET opter_id = CASE WHEN LENGTH(opter_id) <= 2 THEN CONCAT(SUBSTR(opter_id, 1, 1), '*') WHEN LENGTH(opter_id) <= 4 THEN CONCAT(SUBSTR(opter_id, 1, 2), '*') ELSE CONCAT(SUBSTR(opter_id, 1, CEIL(LENGTH(opter_id) * 2/3)), REPEAT('*', FLOOR(LENGTH(opter_id) * 1/3))) END;
-- opter_name (person_name)
UPDATE stg_longterm_reg_d_df_ytai SET opter_name = CASE WHEN LENGTH(opter_name) <= 2 THEN CONCAT(SUBSTR(opter_name, 1, 1), '*') WHEN LENGTH(opter_name) <= 4 THEN CONCAT(SUBSTR(opter_name, 1, 2), '*') ELSE CONCAT(SUBSTR(opter_name, 1, CEIL(LENGTH(opter_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(opter_name) * 1/3))) END;
-- optins_no (org_name)
UPDATE stg_longterm_reg_d_df_ytai SET optins_no = CASE WHEN LENGTH(optins_no) <= 5 THEN CONCAT(SUBSTR(optins_no, 1, 3), REPEAT('*', LENGTH(optins_no) - 3)) ELSE CONCAT(SUBSTR(optins_no, 1, CEIL(LENGTH(optins_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(optins_no) * 1/3))) END;
-- longterm_org_nurscare_regn_id (org_name)
UPDATE stg_longterm_reg_d_df_ytai SET longterm_org_nurscare_regn_id = CASE WHEN LENGTH(longterm_org_nurscare_regn_id) <= 5 THEN CONCAT(SUBSTR(longterm_org_nurscare_regn_id, 1, 3), REPEAT('*', LENGTH(longterm_org_nurscare_regn_id) - 3)) ELSE CONCAT(SUBSTR(longterm_org_nurscare_regn_id, 1, CEIL(LENGTH(longterm_org_nurscare_regn_id) * 2/3)), REPEAT('*', FLOOR(LENGTH(longterm_org_nurscare_regn_id) * 1/3))) END;
-- longterm_org_bed_id (org_name)
UPDATE stg_longterm_reg_d_df_ytai SET longterm_org_bed_id = CASE WHEN LENGTH(longterm_org_bed_id) <= 5 THEN CONCAT(SUBSTR(longterm_org_bed_id, 1, 3), REPEAT('*', LENGTH(longterm_org_bed_id) - 3)) ELSE CONCAT(SUBSTR(longterm_org_bed_id, 1, CEIL(LENGTH(longterm_org_bed_id) * 2/3)), REPEAT('*', FLOOR(LENGTH(longterm_org_bed_id) * 1/3))) END;
-- rels_medstff_name (person_name)
UPDATE stg_longterm_reg_d_df_ytai SET rels_medstff_name = CASE WHEN LENGTH(rels_medstff_name) <= 2 THEN CONCAT(SUBSTR(rels_medstff_name, 1, 1), '*') WHEN LENGTH(rels_medstff_name) <= 4 THEN CONCAT(SUBSTR(rels_medstff_name, 1, 2), '*') ELSE CONCAT(SUBSTR(rels_medstff_name, 1, CEIL(LENGTH(rels_medstff_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(rels_medstff_name) * 1/3))) END;

-- 表: stg_midr_bus_xzxksx_info_df_ytai
-- ACP_ORG_ID (org_name)
UPDATE stg_midr_bus_xzxksx_info_df_ytai SET ACP_ORG_ID = CASE WHEN LENGTH(ACP_ORG_ID) <= 5 THEN CONCAT(SUBSTR(ACP_ORG_ID, 1, 3), REPEAT('*', LENGTH(ACP_ORG_ID) - 3)) ELSE CONCAT(SUBSTR(ACP_ORG_ID, 1, CEIL(LENGTH(ACP_ORG_ID) * 2/3)), REPEAT('*', FLOOR(LENGTH(ACP_ORG_ID) * 1/3))) END;
-- OBJ_ORG_ID (org_name)
UPDATE stg_midr_bus_xzxksx_info_df_ytai SET OBJ_ORG_ID = CASE WHEN LENGTH(OBJ_ORG_ID) <= 5 THEN CONCAT(SUBSTR(OBJ_ORG_ID, 1, 3), REPEAT('*', LENGTH(OBJ_ORG_ID) - 3)) ELSE CONCAT(SUBSTR(OBJ_ORG_ID, 1, CEIL(LENGTH(OBJ_ORG_ID) * 2/3)), REPEAT('*', FLOOR(LENGTH(OBJ_ORG_ID) * 1/3))) END;
-- IDCARD (id_card)
UPDATE stg_midr_bus_xzxksx_info_df_ytai SET IDCARD = CASE WHEN LENGTH(IDCARD) <= 10 THEN CONCAT(SUBSTR(IDCARD, 1, 7), REPEAT('*', LENGTH(IDCARD) - 7)) ELSE CONCAT(SUBSTR(IDCARD, 1, CEIL(LENGTH(IDCARD) * 2/3)), REPEAT('*', FLOOR(LENGTH(IDCARD) * 1/3))) END;
-- PSN_NAME (person_name)
UPDATE stg_midr_bus_xzxksx_info_df_ytai SET PSN_NAME = CASE WHEN LENGTH(PSN_NAME) <= 2 THEN CONCAT(SUBSTR(PSN_NAME, 1, 1), '*') WHEN LENGTH(PSN_NAME) <= 4 THEN CONCAT(SUBSTR(PSN_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(PSN_NAME, 1, CEIL(LENGTH(PSN_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(PSN_NAME) * 1/3))) END;
-- OPTINS_ID (org_name)
UPDATE stg_midr_bus_xzxksx_info_df_ytai SET OPTINS_ID = CASE WHEN LENGTH(OPTINS_ID) <= 5 THEN CONCAT(SUBSTR(OPTINS_ID, 1, 3), REPEAT('*', LENGTH(OPTINS_ID) - 3)) ELSE CONCAT(SUBSTR(OPTINS_ID, 1, CEIL(LENGTH(OPTINS_ID) * 2/3)), REPEAT('*', FLOOR(LENGTH(OPTINS_ID) * 1/3))) END;

-- 表: stg_pol_oprn_std_b_df_ytai
-- ver_name (person_name)
UPDATE stg_pol_oprn_std_b_df_ytai SET ver_name = CASE WHEN LENGTH(ver_name) <= 2 THEN CONCAT(SUBSTR(ver_name, 1, 1), '*') WHEN LENGTH(ver_name) <= 4 THEN CONCAT(SUBSTR(ver_name, 1, 2), '*') ELSE CONCAT(SUBSTR(ver_name, 1, CEIL(LENGTH(ver_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(ver_name) * 1/3))) END;
-- cpr_name (person_name)
UPDATE stg_pol_oprn_std_b_df_ytai SET cpr_name = CASE WHEN LENGTH(cpr_name) <= 2 THEN CONCAT(SUBSTR(cpr_name, 1, 1), '*') WHEN LENGTH(cpr_name) <= 4 THEN CONCAT(SUBSTR(cpr_name, 1, 2), '*') ELSE CONCAT(SUBSTR(cpr_name, 1, CEIL(LENGTH(cpr_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(cpr_name) * 1/3))) END;
-- cgy_name (person_name)
UPDATE stg_pol_oprn_std_b_df_ytai SET cgy_name = CASE WHEN LENGTH(cgy_name) <= 2 THEN CONCAT(SUBSTR(cgy_name, 1, 1), '*') WHEN LENGTH(cgy_name) <= 4 THEN CONCAT(SUBSTR(cgy_name, 1, 2), '*') ELSE CONCAT(SUBSTR(cgy_name, 1, CEIL(LENGTH(cgy_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(cgy_name) * 1/3))) END;
-- sor_name (person_name)
UPDATE stg_pol_oprn_std_b_df_ytai SET sor_name = CASE WHEN LENGTH(sor_name) <= 2 THEN CONCAT(SUBSTR(sor_name, 1, 1), '*') WHEN LENGTH(sor_name) <= 4 THEN CONCAT(SUBSTR(sor_name, 1, 2), '*') ELSE CONCAT(SUBSTR(sor_name, 1, CEIL(LENGTH(sor_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(sor_name) * 1/3))) END;
-- dtls_name (person_name)
UPDATE stg_pol_oprn_std_b_df_ytai SET dtls_name = CASE WHEN LENGTH(dtls_name) <= 2 THEN CONCAT(SUBSTR(dtls_name, 1, 1), '*') WHEN LENGTH(dtls_name) <= 4 THEN CONCAT(SUBSTR(dtls_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dtls_name, 1, CEIL(LENGTH(dtls_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dtls_name) * 1/3))) END;
-- oprn_oprt_name (person_name)
UPDATE stg_pol_oprn_std_b_df_ytai SET oprn_oprt_name = CASE WHEN LENGTH(oprn_oprt_name) <= 2 THEN CONCAT(SUBSTR(oprn_oprt_name, 1, 1), '*') WHEN LENGTH(oprn_oprt_name) <= 4 THEN CONCAT(SUBSTR(oprn_oprt_name, 1, 2), '*') ELSE CONCAT(SUBSTR(oprn_oprt_name, 1, CEIL(LENGTH(oprn_oprt_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(oprn_oprt_name) * 1/3))) END;
-- rtl_oprn_oprt_name (person_name)
UPDATE stg_pol_oprn_std_b_df_ytai SET rtl_oprn_oprt_name = CASE WHEN LENGTH(rtl_oprn_oprt_name) <= 2 THEN CONCAT(SUBSTR(rtl_oprn_oprt_name, 1, 1), '*') WHEN LENGTH(rtl_oprn_oprt_name) <= 4 THEN CONCAT(SUBSTR(rtl_oprn_oprt_name, 1, 2), '*') ELSE CONCAT(SUBSTR(rtl_oprn_oprt_name, 1, CEIL(LENGTH(rtl_oprn_oprt_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(rtl_oprn_oprt_name) * 1/3))) END;
-- clnc_oprn_oprt_name (person_name)
UPDATE stg_pol_oprn_std_b_df_ytai SET clnc_oprn_oprt_name = CASE WHEN LENGTH(clnc_oprn_oprt_name) <= 2 THEN CONCAT(SUBSTR(clnc_oprn_oprt_name, 1, 1), '*') WHEN LENGTH(clnc_oprn_oprt_name) <= 4 THEN CONCAT(SUBSTR(clnc_oprn_oprt_name, 1, 2), '*') ELSE CONCAT(SUBSTR(clnc_oprn_oprt_name, 1, CEIL(LENGTH(clnc_oprn_oprt_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(clnc_oprn_oprt_name) * 1/3))) END;
-- crter_name (person_name)
UPDATE stg_pol_oprn_std_b_df_ytai SET crter_name = CASE WHEN LENGTH(crter_name) <= 2 THEN CONCAT(SUBSTR(crter_name, 1, 1), '*') WHEN LENGTH(crter_name) <= 4 THEN CONCAT(SUBSTR(crter_name, 1, 2), '*') ELSE CONCAT(SUBSTR(crter_name, 1, CEIL(LENGTH(crter_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(crter_name) * 1/3))) END;
-- opter_name (person_name)
UPDATE stg_pol_oprn_std_b_df_ytai SET opter_name = CASE WHEN LENGTH(opter_name) <= 2 THEN CONCAT(SUBSTR(opter_name, 1, 1), '*') WHEN LENGTH(opter_name) <= 4 THEN CONCAT(SUBSTR(opter_name, 1, 2), '*') ELSE CONCAT(SUBSTR(opter_name, 1, CEIL(LENGTH(opter_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(opter_name) * 1/3))) END;

-- 表: stg_psi_pub_medins_drugpric_proc2
-- mdtrt_id (medical_record)
UPDATE stg_psi_pub_medins_drugpric_proc2 SET mdtrt_id = CASE WHEN LENGTH(mdtrt_id) <= 8 THEN CONCAT(SUBSTR(mdtrt_id, 1, 5), REPEAT('*', LENGTH(mdtrt_id) - 5)) ELSE CONCAT(SUBSTR(mdtrt_id, 1, CEIL(LENGTH(mdtrt_id) * 2/3)), REPEAT('*', FLOOR(LENGTH(mdtrt_id) * 1/3))) END;
-- bkkp_sn (medical_record)
UPDATE stg_psi_pub_medins_drugpric_proc2 SET bkkp_sn = CASE WHEN LENGTH(bkkp_sn) <= 8 THEN CONCAT(SUBSTR(bkkp_sn, 1, 5), REPEAT('*', LENGTH(bkkp_sn) - 5)) ELSE CONCAT(SUBSTR(bkkp_sn, 1, CEIL(LENGTH(bkkp_sn) * 2/3)), REPEAT('*', FLOOR(LENGTH(bkkp_sn) * 1/3))) END;
-- fixmedins_code (org_name)
UPDATE stg_psi_pub_medins_drugpric_proc2 SET fixmedins_code = CASE WHEN LENGTH(fixmedins_code) <= 5 THEN CONCAT(SUBSTR(fixmedins_code, 1, 3), REPEAT('*', LENGTH(fixmedins_code) - 3)) ELSE CONCAT(SUBSTR(fixmedins_code, 1, CEIL(LENGTH(fixmedins_code) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_code) * 1/3))) END;
-- fixmedins_name (person_name)
UPDATE stg_psi_pub_medins_drugpric_proc2 SET fixmedins_name = CASE WHEN LENGTH(fixmedins_name) <= 2 THEN CONCAT(SUBSTR(fixmedins_name, 1, 1), '*') WHEN LENGTH(fixmedins_name) <= 4 THEN CONCAT(SUBSTR(fixmedins_name, 1, 2), '*') ELSE CONCAT(SUBSTR(fixmedins_name, 1, CEIL(LENGTH(fixmedins_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_name) * 1/3))) END;
-- med_list_name (person_name)
UPDATE stg_psi_pub_medins_drugpric_proc2 SET med_list_name = CASE WHEN LENGTH(med_list_name) <= 2 THEN CONCAT(SUBSTR(med_list_name, 1, 1), '*') WHEN LENGTH(med_list_name) <= 4 THEN CONCAT(SUBSTR(med_list_name, 1, 2), '*') ELSE CONCAT(SUBSTR(med_list_name, 1, CEIL(LENGTH(med_list_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(med_list_name) * 1/3))) END;
-- prod_name (person_name)
UPDATE stg_psi_pub_medins_drugpric_proc2 SET prod_name = CASE WHEN LENGTH(prod_name) <= 2 THEN CONCAT(SUBSTR(prod_name, 1, 1), '*') WHEN LENGTH(prod_name) <= 4 THEN CONCAT(SUBSTR(prod_name, 1, 2), '*') ELSE CONCAT(SUBSTR(prod_name, 1, CEIL(LENGTH(prod_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(prod_name) * 1/3))) END;

-- 表: stg_psn_setl_info_yt_c_df_ytai
-- org_setl_id (org_name)
UPDATE stg_psn_setl_info_yt_c_df_ytai SET org_setl_id = CASE WHEN LENGTH(org_setl_id) <= 5 THEN CONCAT(SUBSTR(org_setl_id, 1, 3), REPEAT('*', LENGTH(org_setl_id) - 3)) ELSE CONCAT(SUBSTR(org_setl_id, 1, CEIL(LENGTH(org_setl_id) * 2/3)), REPEAT('*', FLOOR(LENGTH(org_setl_id) * 1/3))) END;
-- psn_no (person_id)
UPDATE stg_psn_setl_info_yt_c_df_ytai SET psn_no = CASE WHEN LENGTH(psn_no) <= 8 THEN CONCAT(SUBSTR(psn_no, 1, 5), REPEAT('*', LENGTH(psn_no) - 5)) ELSE CONCAT(SUBSTR(psn_no, 1, CEIL(LENGTH(psn_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(psn_no) * 1/3))) END;
-- psn_name (person_name)
UPDATE stg_psn_setl_info_yt_c_df_ytai SET psn_name = CASE WHEN LENGTH(psn_name) <= 2 THEN CONCAT(SUBSTR(psn_name, 1, 1), '*') WHEN LENGTH(psn_name) <= 4 THEN CONCAT(SUBSTR(psn_name, 1, 2), '*') ELSE CONCAT(SUBSTR(psn_name, 1, CEIL(LENGTH(psn_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(psn_name) * 1/3))) END;
-- certno (id_card)
UPDATE stg_psn_setl_info_yt_c_df_ytai SET certno = CASE WHEN LENGTH(certno) <= 10 THEN CONCAT(SUBSTR(certno, 1, 7), REPEAT('*', LENGTH(certno) - 7)) ELSE CONCAT(SUBSTR(certno, 1, CEIL(LENGTH(certno) * 2/3)), REPEAT('*', FLOOR(LENGTH(certno) * 1/3))) END;
-- nurscare_org_no (org_name)
UPDATE stg_psn_setl_info_yt_c_df_ytai SET nurscare_org_no = CASE WHEN LENGTH(nurscare_org_no) <= 5 THEN CONCAT(SUBSTR(nurscare_org_no, 1, 3), REPEAT('*', LENGTH(nurscare_org_no) - 3)) ELSE CONCAT(SUBSTR(nurscare_org_no, 1, CEIL(LENGTH(nurscare_org_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(nurscare_org_no) * 1/3))) END;
-- crter_id (person_name)
UPDATE stg_psn_setl_info_yt_c_df_ytai SET crter_id = CASE WHEN LENGTH(crter_id) <= 2 THEN CONCAT(SUBSTR(crter_id, 1, 1), '*') WHEN LENGTH(crter_id) <= 4 THEN CONCAT(SUBSTR(crter_id, 1, 2), '*') ELSE CONCAT(SUBSTR(crter_id, 1, CEIL(LENGTH(crter_id) * 2/3)), REPEAT('*', FLOOR(LENGTH(crter_id) * 1/3))) END;
-- crter_name (person_name)
UPDATE stg_psn_setl_info_yt_c_df_ytai SET crter_name = CASE WHEN LENGTH(crter_name) <= 2 THEN CONCAT(SUBSTR(crter_name, 1, 1), '*') WHEN LENGTH(crter_name) <= 4 THEN CONCAT(SUBSTR(crter_name, 1, 2), '*') ELSE CONCAT(SUBSTR(crter_name, 1, CEIL(LENGTH(crter_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(crter_name) * 1/3))) END;
-- crte_optins_no (org_name)
UPDATE stg_psn_setl_info_yt_c_df_ytai SET crte_optins_no = CASE WHEN LENGTH(crte_optins_no) <= 5 THEN CONCAT(SUBSTR(crte_optins_no, 1, 3), REPEAT('*', LENGTH(crte_optins_no) - 3)) ELSE CONCAT(SUBSTR(crte_optins_no, 1, CEIL(LENGTH(crte_optins_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(crte_optins_no) * 1/3))) END;
-- opter_id (person_name)
UPDATE stg_psn_setl_info_yt_c_df_ytai SET opter_id = CASE WHEN LENGTH(opter_id) <= 2 THEN CONCAT(SUBSTR(opter_id, 1, 1), '*') WHEN LENGTH(opter_id) <= 4 THEN CONCAT(SUBSTR(opter_id, 1, 2), '*') ELSE CONCAT(SUBSTR(opter_id, 1, CEIL(LENGTH(opter_id) * 2/3)), REPEAT('*', FLOOR(LENGTH(opter_id) * 1/3))) END;
-- opter_name (person_name)
UPDATE stg_psn_setl_info_yt_c_df_ytai SET opter_name = CASE WHEN LENGTH(opter_name) <= 2 THEN CONCAT(SUBSTR(opter_name, 1, 1), '*') WHEN LENGTH(opter_name) <= 4 THEN CONCAT(SUBSTR(opter_name, 1, 2), '*') ELSE CONCAT(SUBSTR(opter_name, 1, CEIL(LENGTH(opter_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(opter_name) * 1/3))) END;
-- optins_no (org_name)
UPDATE stg_psn_setl_info_yt_c_df_ytai SET optins_no = CASE WHEN LENGTH(optins_no) <= 5 THEN CONCAT(SUBSTR(optins_no, 1, 3), REPEAT('*', LENGTH(optins_no) - 3)) ELSE CONCAT(SUBSTR(optins_no, 1, CEIL(LENGTH(optins_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(optins_no) * 1/3))) END;
-- medinslv (org_name)
UPDATE stg_psn_setl_info_yt_c_df_ytai SET medinslv = CASE WHEN LENGTH(medinslv) <= 5 THEN CONCAT(SUBSTR(medinslv, 1, 3), REPEAT('*', LENGTH(medinslv) - 3)) ELSE CONCAT(SUBSTR(medinslv, 1, CEIL(LENGTH(medinslv) * 2/3)), REPEAT('*', FLOOR(LENGTH(medinslv) * 1/3))) END;

-- 表: stg_sd_yt_dr_info_b_df_v_ytai
-- DR_CODE (person_name)
UPDATE stg_sd_yt_dr_info_b_df_v_ytai SET DR_CODE = CASE WHEN LENGTH(DR_CODE) <= 2 THEN CONCAT(SUBSTR(DR_CODE, 1, 1), '*') WHEN LENGTH(DR_CODE) <= 4 THEN CONCAT(SUBSTR(DR_CODE, 1, 2), '*') ELSE CONCAT(SUBSTR(DR_CODE, 1, CEIL(LENGTH(DR_CODE) * 2/3)), REPEAT('*', FLOOR(LENGTH(DR_CODE) * 1/3))) END;
-- PSN_NO (person_id)
UPDATE stg_sd_yt_dr_info_b_df_v_ytai SET PSN_NO = CASE WHEN LENGTH(PSN_NO) <= 8 THEN CONCAT(SUBSTR(PSN_NO, 1, 5), REPEAT('*', LENGTH(PSN_NO) - 5)) ELSE CONCAT(SUBSTR(PSN_NO, 1, CEIL(LENGTH(PSN_NO) * 2/3)), REPEAT('*', FLOOR(LENGTH(PSN_NO) * 1/3))) END;
-- DR_NAME (person_name)
UPDATE stg_sd_yt_dr_info_b_df_v_ytai SET DR_NAME = CASE WHEN LENGTH(DR_NAME) <= 2 THEN CONCAT(SUBSTR(DR_NAME, 1, 1), '*') WHEN LENGTH(DR_NAME) <= 4 THEN CONCAT(SUBSTR(DR_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(DR_NAME, 1, CEIL(LENGTH(DR_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(DR_NAME) * 1/3))) END;
-- DR_PRAC_TYPE_NAME (person_name)
UPDATE stg_sd_yt_dr_info_b_df_v_ytai SET DR_PRAC_TYPE_NAME = CASE WHEN LENGTH(DR_PRAC_TYPE_NAME) <= 2 THEN CONCAT(SUBSTR(DR_PRAC_TYPE_NAME, 1, 1), '*') WHEN LENGTH(DR_PRAC_TYPE_NAME) <= 4 THEN CONCAT(SUBSTR(DR_PRAC_TYPE_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(DR_PRAC_TYPE_NAME, 1, CEIL(LENGTH(DR_PRAC_TYPE_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(DR_PRAC_TYPE_NAME) * 1/3))) END;
-- DR_PRAC_TYPE (person_name)
UPDATE stg_sd_yt_dr_info_b_df_v_ytai SET DR_PRAC_TYPE = CASE WHEN LENGTH(DR_PRAC_TYPE) <= 2 THEN CONCAT(SUBSTR(DR_PRAC_TYPE, 1, 1), '*') WHEN LENGTH(DR_PRAC_TYPE) <= 4 THEN CONCAT(SUBSTR(DR_PRAC_TYPE, 1, 2), '*') ELSE CONCAT(SUBSTR(DR_PRAC_TYPE, 1, CEIL(LENGTH(DR_PRAC_TYPE) * 2/3)), REPEAT('*', FLOOR(LENGTH(DR_PRAC_TYPE) * 1/3))) END;
-- DR_PRAC_SCP_CODE (person_name)
UPDATE stg_sd_yt_dr_info_b_df_v_ytai SET DR_PRAC_SCP_CODE = CASE WHEN LENGTH(DR_PRAC_SCP_CODE) <= 2 THEN CONCAT(SUBSTR(DR_PRAC_SCP_CODE, 1, 1), '*') WHEN LENGTH(DR_PRAC_SCP_CODE) <= 4 THEN CONCAT(SUBSTR(DR_PRAC_SCP_CODE, 1, 2), '*') ELSE CONCAT(SUBSTR(DR_PRAC_SCP_CODE, 1, CEIL(LENGTH(DR_PRAC_SCP_CODE) * 2/3)), REPEAT('*', FLOOR(LENGTH(DR_PRAC_SCP_CODE) * 1/3))) END;
-- DR_PRAC_SCP_NAME (person_name)
UPDATE stg_sd_yt_dr_info_b_df_v_ytai SET DR_PRAC_SCP_NAME = CASE WHEN LENGTH(DR_PRAC_SCP_NAME) <= 2 THEN CONCAT(SUBSTR(DR_PRAC_SCP_NAME, 1, 1), '*') WHEN LENGTH(DR_PRAC_SCP_NAME) <= 4 THEN CONCAT(SUBSTR(DR_PRAC_SCP_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(DR_PRAC_SCP_NAME, 1, CEIL(LENGTH(DR_PRAC_SCP_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(DR_PRAC_SCP_NAME) * 1/3))) END;
-- MAIN_PRACINS_NO (org_name)
UPDATE stg_sd_yt_dr_info_b_df_v_ytai SET MAIN_PRACINS_NO = CASE WHEN LENGTH(MAIN_PRACINS_NO) <= 5 THEN CONCAT(SUBSTR(MAIN_PRACINS_NO, 1, 3), REPEAT('*', LENGTH(MAIN_PRACINS_NO) - 3)) ELSE CONCAT(SUBSTR(MAIN_PRACINS_NO, 1, CEIL(LENGTH(MAIN_PRACINS_NO) * 2/3)), REPEAT('*', FLOOR(LENGTH(MAIN_PRACINS_NO) * 1/3))) END;
-- MAIN_PRACINS_NAME (person_name)
UPDATE stg_sd_yt_dr_info_b_df_v_ytai SET MAIN_PRACINS_NAME = CASE WHEN LENGTH(MAIN_PRACINS_NAME) <= 2 THEN CONCAT(SUBSTR(MAIN_PRACINS_NAME, 1, 1), '*') WHEN LENGTH(MAIN_PRACINS_NAME) <= 4 THEN CONCAT(SUBSTR(MAIN_PRACINS_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(MAIN_PRACINS_NAME, 1, CEIL(LENGTH(MAIN_PRACINS_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(MAIN_PRACINS_NAME) * 1/3))) END;
-- MAIN_PRACINS_ADDR (org_name)
UPDATE stg_sd_yt_dr_info_b_df_v_ytai SET MAIN_PRACINS_ADDR = CASE WHEN LENGTH(MAIN_PRACINS_ADDR) <= 5 THEN CONCAT(SUBSTR(MAIN_PRACINS_ADDR, 1, 3), REPEAT('*', LENGTH(MAIN_PRACINS_ADDR) - 3)) ELSE CONCAT(SUBSTR(MAIN_PRACINS_ADDR, 1, CEIL(LENGTH(MAIN_PRACINS_ADDR) * 2/3)), REPEAT('*', FLOOR(LENGTH(MAIN_PRACINS_ADDR) * 1/3))) END;
-- DR_PRO_TECH_DUTY (person_name)
UPDATE stg_sd_yt_dr_info_b_df_v_ytai SET DR_PRO_TECH_DUTY = CASE WHEN LENGTH(DR_PRO_TECH_DUTY) <= 2 THEN CONCAT(SUBSTR(DR_PRO_TECH_DUTY, 1, 1), '*') WHEN LENGTH(DR_PRO_TECH_DUTY) <= 4 THEN CONCAT(SUBSTR(DR_PRO_TECH_DUTY, 1, 2), '*') ELSE CONCAT(SUBSTR(DR_PRO_TECH_DUTY, 1, CEIL(LENGTH(DR_PRO_TECH_DUTY) * 2/3)), REPEAT('*', FLOOR(LENGTH(DR_PRO_TECH_DUTY) * 1/3))) END;
-- DR_PRO_TECH_DUTY_NAME (person_name)
UPDATE stg_sd_yt_dr_info_b_df_v_ytai SET DR_PRO_TECH_DUTY_NAME = CASE WHEN LENGTH(DR_PRO_TECH_DUTY_NAME) <= 2 THEN CONCAT(SUBSTR(DR_PRO_TECH_DUTY_NAME, 1, 1), '*') WHEN LENGTH(DR_PRO_TECH_DUTY_NAME) <= 4 THEN CONCAT(SUBSTR(DR_PRO_TECH_DUTY_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(DR_PRO_TECH_DUTY_NAME, 1, CEIL(LENGTH(DR_PRO_TECH_DUTY_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(DR_PRO_TECH_DUTY_NAME) * 1/3))) END;
-- DR_PRAC_CERT_NO (person_name)
UPDATE stg_sd_yt_dr_info_b_df_v_ytai SET DR_PRAC_CERT_NO = CASE WHEN LENGTH(DR_PRAC_CERT_NO) <= 2 THEN CONCAT(SUBSTR(DR_PRAC_CERT_NO, 1, 1), '*') WHEN LENGTH(DR_PRAC_CERT_NO) <= 4 THEN CONCAT(SUBSTR(DR_PRAC_CERT_NO, 1, 2), '*') ELSE CONCAT(SUBSTR(DR_PRAC_CERT_NO, 1, CEIL(LENGTH(DR_PRAC_CERT_NO) * 2/3)), REPEAT('*', FLOOR(LENGTH(DR_PRAC_CERT_NO) * 1/3))) END;
-- CRTER_ID (person_name)
UPDATE stg_sd_yt_dr_info_b_df_v_ytai SET CRTER_ID = CASE WHEN LENGTH(CRTER_ID) <= 2 THEN CONCAT(SUBSTR(CRTER_ID, 1, 1), '*') WHEN LENGTH(CRTER_ID) <= 4 THEN CONCAT(SUBSTR(CRTER_ID, 1, 2), '*') ELSE CONCAT(SUBSTR(CRTER_ID, 1, CEIL(LENGTH(CRTER_ID) * 2/3)), REPEAT('*', FLOOR(LENGTH(CRTER_ID) * 1/3))) END;
-- CRTER_NAME (person_name)
UPDATE stg_sd_yt_dr_info_b_df_v_ytai SET CRTER_NAME = CASE WHEN LENGTH(CRTER_NAME) <= 2 THEN CONCAT(SUBSTR(CRTER_NAME, 1, 1), '*') WHEN LENGTH(CRTER_NAME) <= 4 THEN CONCAT(SUBSTR(CRTER_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(CRTER_NAME, 1, CEIL(LENGTH(CRTER_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(CRTER_NAME) * 1/3))) END;
-- CRTE_OPTINS_NO (org_name)
UPDATE stg_sd_yt_dr_info_b_df_v_ytai SET CRTE_OPTINS_NO = CASE WHEN LENGTH(CRTE_OPTINS_NO) <= 5 THEN CONCAT(SUBSTR(CRTE_OPTINS_NO, 1, 3), REPEAT('*', LENGTH(CRTE_OPTINS_NO) - 3)) ELSE CONCAT(SUBSTR(CRTE_OPTINS_NO, 1, CEIL(LENGTH(CRTE_OPTINS_NO) * 2/3)), REPEAT('*', FLOOR(LENGTH(CRTE_OPTINS_NO) * 1/3))) END;
-- OPTER_ID (person_name)
UPDATE stg_sd_yt_dr_info_b_df_v_ytai SET OPTER_ID = CASE WHEN LENGTH(OPTER_ID) <= 2 THEN CONCAT(SUBSTR(OPTER_ID, 1, 1), '*') WHEN LENGTH(OPTER_ID) <= 4 THEN CONCAT(SUBSTR(OPTER_ID, 1, 2), '*') ELSE CONCAT(SUBSTR(OPTER_ID, 1, CEIL(LENGTH(OPTER_ID) * 2/3)), REPEAT('*', FLOOR(LENGTH(OPTER_ID) * 1/3))) END;
-- OPTER_NAME (person_name)
UPDATE stg_sd_yt_dr_info_b_df_v_ytai SET OPTER_NAME = CASE WHEN LENGTH(OPTER_NAME) <= 2 THEN CONCAT(SUBSTR(OPTER_NAME, 1, 1), '*') WHEN LENGTH(OPTER_NAME) <= 4 THEN CONCAT(SUBSTR(OPTER_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(OPTER_NAME, 1, CEIL(LENGTH(OPTER_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(OPTER_NAME) * 1/3))) END;
-- OPTINS_NO (org_name)
UPDATE stg_sd_yt_dr_info_b_df_v_ytai SET OPTINS_NO = CASE WHEN LENGTH(OPTINS_NO) <= 5 THEN CONCAT(SUBSTR(OPTINS_NO, 1, 3), REPEAT('*', LENGTH(OPTINS_NO) - 3)) ELSE CONCAT(SUBSTR(OPTINS_NO, 1, CEIL(LENGTH(OPTINS_NO) * 2/3)), REPEAT('*', FLOOR(LENGTH(OPTINS_NO) * 1/3))) END;
-- MEDINS_CODE (org_name)
UPDATE stg_sd_yt_dr_info_b_df_v_ytai SET MEDINS_CODE = CASE WHEN LENGTH(MEDINS_CODE) <= 5 THEN CONCAT(SUBSTR(MEDINS_CODE, 1, 3), REPEAT('*', LENGTH(MEDINS_CODE) - 3)) ELSE CONCAT(SUBSTR(MEDINS_CODE, 1, CEIL(LENGTH(MEDINS_CODE) * 2/3)), REPEAT('*', FLOOR(LENGTH(MEDINS_CODE) * 1/3))) END;
-- PRACINS_NAME (person_name)
UPDATE stg_sd_yt_dr_info_b_df_v_ytai SET PRACINS_NAME = CASE WHEN LENGTH(PRACINS_NAME) <= 2 THEN CONCAT(SUBSTR(PRACINS_NAME, 1, 1), '*') WHEN LENGTH(PRACINS_NAME) <= 4 THEN CONCAT(SUBSTR(PRACINS_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(PRACINS_NAME, 1, CEIL(LENGTH(PRACINS_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(PRACINS_NAME) * 1/3))) END;
-- PRACINS_ADDR (org_name)
UPDATE stg_sd_yt_dr_info_b_df_v_ytai SET PRACINS_ADDR = CASE WHEN LENGTH(PRACINS_ADDR) <= 5 THEN CONCAT(SUBSTR(PRACINS_ADDR, 1, 3), REPEAT('*', LENGTH(PRACINS_ADDR) - 3)) ELSE CONCAT(SUBSTR(PRACINS_ADDR, 1, CEIL(LENGTH(PRACINS_ADDR) * 2/3)), REPEAT('*', FLOOR(LENGTH(PRACINS_ADDR) * 1/3))) END;
-- MEDINS_NAME (person_name)
UPDATE stg_sd_yt_dr_info_b_df_v_ytai SET MEDINS_NAME = CASE WHEN LENGTH(MEDINS_NAME) <= 2 THEN CONCAT(SUBSTR(MEDINS_NAME, 1, 1), '*') WHEN LENGTH(MEDINS_NAME) <= 4 THEN CONCAT(SUBSTR(MEDINS_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(MEDINS_NAME, 1, CEIL(LENGTH(MEDINS_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(MEDINS_NAME) * 1/3))) END;
-- VER_NAME (person_name)
UPDATE stg_sd_yt_dr_info_b_df_v_ytai SET VER_NAME = CASE WHEN LENGTH(VER_NAME) <= 2 THEN CONCAT(SUBSTR(VER_NAME, 1, 1), '*') WHEN LENGTH(VER_NAME) <= 4 THEN CONCAT(SUBSTR(VER_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(VER_NAME, 1, CEIL(LENGTH(VER_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(VER_NAME) * 1/3))) END;
-- DR_ID (person_name)
UPDATE stg_sd_yt_dr_info_b_df_v_ytai SET DR_ID = CASE WHEN LENGTH(DR_ID) <= 2 THEN CONCAT(SUBSTR(DR_ID, 1, 1), '*') WHEN LENGTH(DR_ID) <= 4 THEN CONCAT(SUBSTR(DR_ID, 1, 2), '*') ELSE CONCAT(SUBSTR(DR_ID, 1, CEIL(LENGTH(DR_ID) * 2/3)), REPEAT('*', FLOOR(LENGTH(DR_ID) * 1/3))) END;
-- DR_PRAC_LV (person_name)
UPDATE stg_sd_yt_dr_info_b_df_v_ytai SET DR_PRAC_LV = CASE WHEN LENGTH(DR_PRAC_LV) <= 2 THEN CONCAT(SUBSTR(DR_PRAC_LV, 1, 1), '*') WHEN LENGTH(DR_PRAC_LV) <= 4 THEN CONCAT(SUBSTR(DR_PRAC_LV, 1, 2), '*') ELSE CONCAT(SUBSTR(DR_PRAC_LV, 1, CEIL(LENGTH(DR_PRAC_LV) * 2/3)), REPEAT('*', FLOOR(LENGTH(DR_PRAC_LV) * 1/3))) END;
-- DR_PRACCERT_ELEC_DOC (person_name)
UPDATE stg_sd_yt_dr_info_b_df_v_ytai SET DR_PRACCERT_ELEC_DOC = CASE WHEN LENGTH(DR_PRACCERT_ELEC_DOC) <= 2 THEN CONCAT(SUBSTR(DR_PRACCERT_ELEC_DOC, 1, 1), '*') WHEN LENGTH(DR_PRACCERT_ELEC_DOC) <= 4 THEN CONCAT(SUBSTR(DR_PRACCERT_ELEC_DOC, 1, 2), '*') ELSE CONCAT(SUBSTR(DR_PRACCERT_ELEC_DOC, 1, CEIL(LENGTH(DR_PRACCERT_ELEC_DOC) * 2/3)), REPEAT('*', FLOOR(LENGTH(DR_PRACCERT_ELEC_DOC) * 1/3))) END;
-- DR_CERT_CODG (person_name)
UPDATE stg_sd_yt_dr_info_b_df_v_ytai SET DR_CERT_CODG = CASE WHEN LENGTH(DR_CERT_CODG) <= 2 THEN CONCAT(SUBSTR(DR_CERT_CODG, 1, 1), '*') WHEN LENGTH(DR_CERT_CODG) <= 4 THEN CONCAT(SUBSTR(DR_CERT_CODG, 1, 2), '*') ELSE CONCAT(SUBSTR(DR_CERT_CODG, 1, CEIL(LENGTH(DR_CERT_CODG) * 2/3)), REPEAT('*', FLOOR(LENGTH(DR_CERT_CODG) * 1/3))) END;
-- dw_tab_name (person_name)
UPDATE stg_sd_yt_dr_info_b_df_v_ytai SET dw_tab_name = CASE WHEN LENGTH(dw_tab_name) <= 2 THEN CONCAT(SUBSTR(dw_tab_name, 1, 1), '*') WHEN LENGTH(dw_tab_name) <= 4 THEN CONCAT(SUBSTR(dw_tab_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dw_tab_name, 1, CEIL(LENGTH(dw_tab_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dw_tab_name) * 1/3))) END;

-- 表: stg_sd_yt_hi_phar_psn_info_b_df_v_ytai
-- HI_PHAR_PSN_ID (person_id)
UPDATE stg_sd_yt_hi_phar_psn_info_b_df_v_ytai SET HI_PHAR_PSN_ID = CASE WHEN LENGTH(HI_PHAR_PSN_ID) <= 8 THEN CONCAT(SUBSTR(HI_PHAR_PSN_ID, 1, 5), REPEAT('*', LENGTH(HI_PHAR_PSN_ID) - 5)) ELSE CONCAT(SUBSTR(HI_PHAR_PSN_ID, 1, CEIL(LENGTH(HI_PHAR_PSN_ID) * 2/3)), REPEAT('*', FLOOR(LENGTH(HI_PHAR_PSN_ID) * 1/3))) END;
-- PSN_NO (person_id)
UPDATE stg_sd_yt_hi_phar_psn_info_b_df_v_ytai SET PSN_NO = CASE WHEN LENGTH(PSN_NO) <= 8 THEN CONCAT(SUBSTR(PSN_NO, 1, 5), REPEAT('*', LENGTH(PSN_NO) - 5)) ELSE CONCAT(SUBSTR(PSN_NO, 1, CEIL(LENGTH(PSN_NO) * 2/3)), REPEAT('*', FLOOR(LENGTH(PSN_NO) * 1/3))) END;
-- MEDINS_ID (org_name)
UPDATE stg_sd_yt_hi_phar_psn_info_b_df_v_ytai SET MEDINS_ID = CASE WHEN LENGTH(MEDINS_ID) <= 5 THEN CONCAT(SUBSTR(MEDINS_ID, 1, 3), REPEAT('*', LENGTH(MEDINS_ID) - 3)) ELSE CONCAT(SUBSTR(MEDINS_ID, 1, CEIL(LENGTH(MEDINS_ID) * 2/3)), REPEAT('*', FLOOR(LENGTH(MEDINS_ID) * 1/3))) END;
-- MEDINS_CODE (org_name)
UPDATE stg_sd_yt_hi_phar_psn_info_b_df_v_ytai SET MEDINS_CODE = CASE WHEN LENGTH(MEDINS_CODE) <= 5 THEN CONCAT(SUBSTR(MEDINS_CODE, 1, 3), REPEAT('*', LENGTH(MEDINS_CODE) - 3)) ELSE CONCAT(SUBSTR(MEDINS_CODE, 1, CEIL(LENGTH(MEDINS_CODE) * 2/3)), REPEAT('*', FLOOR(LENGTH(MEDINS_CODE) * 1/3))) END;
-- MEDINS_NAME (person_name)
UPDATE stg_sd_yt_hi_phar_psn_info_b_df_v_ytai SET MEDINS_NAME = CASE WHEN LENGTH(MEDINS_NAME) <= 2 THEN CONCAT(SUBSTR(MEDINS_NAME, 1, 1), '*') WHEN LENGTH(MEDINS_NAME) <= 4 THEN CONCAT(SUBSTR(MEDINS_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(MEDINS_NAME, 1, CEIL(LENGTH(MEDINS_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(MEDINS_NAME) * 1/3))) END;
-- NAME (person_name)
UPDATE stg_sd_yt_hi_phar_psn_info_b_df_v_ytai SET NAME = CASE WHEN LENGTH(NAME) <= 2 THEN CONCAT(SUBSTR(NAME, 1, 1), '*') WHEN LENGTH(NAME) <= 4 THEN CONCAT(SUBSTR(NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(NAME, 1, CEIL(LENGTH(NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(NAME) * 1/3))) END;
-- DEPT_NAME (person_name)
UPDATE stg_sd_yt_hi_phar_psn_info_b_df_v_ytai SET DEPT_NAME = CASE WHEN LENGTH(DEPT_NAME) <= 2 THEN CONCAT(SUBSTR(DEPT_NAME, 1, 1), '*') WHEN LENGTH(DEPT_NAME) <= 4 THEN CONCAT(SUBSTR(DEPT_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(DEPT_NAME, 1, CEIL(LENGTH(DEPT_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(DEPT_NAME) * 1/3))) END;
-- CRTER_ID (person_name)
UPDATE stg_sd_yt_hi_phar_psn_info_b_df_v_ytai SET CRTER_ID = CASE WHEN LENGTH(CRTER_ID) <= 2 THEN CONCAT(SUBSTR(CRTER_ID, 1, 1), '*') WHEN LENGTH(CRTER_ID) <= 4 THEN CONCAT(SUBSTR(CRTER_ID, 1, 2), '*') ELSE CONCAT(SUBSTR(CRTER_ID, 1, CEIL(LENGTH(CRTER_ID) * 2/3)), REPEAT('*', FLOOR(LENGTH(CRTER_ID) * 1/3))) END;
-- CRTER_NAME (person_name)
UPDATE stg_sd_yt_hi_phar_psn_info_b_df_v_ytai SET CRTER_NAME = CASE WHEN LENGTH(CRTER_NAME) <= 2 THEN CONCAT(SUBSTR(CRTER_NAME, 1, 1), '*') WHEN LENGTH(CRTER_NAME) <= 4 THEN CONCAT(SUBSTR(CRTER_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(CRTER_NAME, 1, CEIL(LENGTH(CRTER_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(CRTER_NAME) * 1/3))) END;
-- CRTE_OPTINS_NO (org_name)
UPDATE stg_sd_yt_hi_phar_psn_info_b_df_v_ytai SET CRTE_OPTINS_NO = CASE WHEN LENGTH(CRTE_OPTINS_NO) <= 5 THEN CONCAT(SUBSTR(CRTE_OPTINS_NO, 1, 3), REPEAT('*', LENGTH(CRTE_OPTINS_NO) - 3)) ELSE CONCAT(SUBSTR(CRTE_OPTINS_NO, 1, CEIL(LENGTH(CRTE_OPTINS_NO) * 2/3)), REPEAT('*', FLOOR(LENGTH(CRTE_OPTINS_NO) * 1/3))) END;
-- OPTER_ID (person_name)
UPDATE stg_sd_yt_hi_phar_psn_info_b_df_v_ytai SET OPTER_ID = CASE WHEN LENGTH(OPTER_ID) <= 2 THEN CONCAT(SUBSTR(OPTER_ID, 1, 1), '*') WHEN LENGTH(OPTER_ID) <= 4 THEN CONCAT(SUBSTR(OPTER_ID, 1, 2), '*') ELSE CONCAT(SUBSTR(OPTER_ID, 1, CEIL(LENGTH(OPTER_ID) * 2/3)), REPEAT('*', FLOOR(LENGTH(OPTER_ID) * 1/3))) END;
-- OPTER_NAME (person_name)
UPDATE stg_sd_yt_hi_phar_psn_info_b_df_v_ytai SET OPTER_NAME = CASE WHEN LENGTH(OPTER_NAME) <= 2 THEN CONCAT(SUBSTR(OPTER_NAME, 1, 1), '*') WHEN LENGTH(OPTER_NAME) <= 4 THEN CONCAT(SUBSTR(OPTER_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(OPTER_NAME, 1, CEIL(LENGTH(OPTER_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(OPTER_NAME) * 1/3))) END;
-- OPTINS_NO (org_name)
UPDATE stg_sd_yt_hi_phar_psn_info_b_df_v_ytai SET OPTINS_NO = CASE WHEN LENGTH(OPTINS_NO) <= 5 THEN CONCAT(SUBSTR(OPTINS_NO, 1, 3), REPEAT('*', LENGTH(OPTINS_NO) - 3)) ELSE CONCAT(SUBSTR(OPTINS_NO, 1, CEIL(LENGTH(OPTINS_NO) * 2/3)), REPEAT('*', FLOOR(LENGTH(OPTINS_NO) * 1/3))) END;
-- VER_NAME (person_name)
UPDATE stg_sd_yt_hi_phar_psn_info_b_df_v_ytai SET VER_NAME = CASE WHEN LENGTH(VER_NAME) <= 2 THEN CONCAT(SUBSTR(VER_NAME, 1, 1), '*') WHEN LENGTH(VER_NAME) <= 4 THEN CONCAT(SUBSTR(VER_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(VER_NAME, 1, CEIL(LENGTH(VER_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(VER_NAME) * 1/3))) END;
-- dw_tab_name (person_name)
UPDATE stg_sd_yt_hi_phar_psn_info_b_df_v_ytai SET dw_tab_name = CASE WHEN LENGTH(dw_tab_name) <= 2 THEN CONCAT(SUBSTR(dw_tab_name, 1, 1), '*') WHEN LENGTH(dw_tab_name) <= 4 THEN CONCAT(SUBSTR(dw_tab_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dw_tab_name, 1, CEIL(LENGTH(dw_tab_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dw_tab_name) * 1/3))) END;

-- 表: stg_sd_yt_hi_tech_psn_info_b_df_v_ytai
-- HI_TECH_PSN_ID (person_id)
UPDATE stg_sd_yt_hi_tech_psn_info_b_df_v_ytai SET HI_TECH_PSN_ID = CASE WHEN LENGTH(HI_TECH_PSN_ID) <= 8 THEN CONCAT(SUBSTR(HI_TECH_PSN_ID, 1, 5), REPEAT('*', LENGTH(HI_TECH_PSN_ID) - 5)) ELSE CONCAT(SUBSTR(HI_TECH_PSN_ID, 1, CEIL(LENGTH(HI_TECH_PSN_ID) * 2/3)), REPEAT('*', FLOOR(LENGTH(HI_TECH_PSN_ID) * 1/3))) END;
-- PSN_NO (person_id)
UPDATE stg_sd_yt_hi_tech_psn_info_b_df_v_ytai SET PSN_NO = CASE WHEN LENGTH(PSN_NO) <= 8 THEN CONCAT(SUBSTR(PSN_NO, 1, 5), REPEAT('*', LENGTH(PSN_NO) - 5)) ELSE CONCAT(SUBSTR(PSN_NO, 1, CEIL(LENGTH(PSN_NO) * 2/3)), REPEAT('*', FLOOR(LENGTH(PSN_NO) * 1/3))) END;
-- MEDINS_ID (org_name)
UPDATE stg_sd_yt_hi_tech_psn_info_b_df_v_ytai SET MEDINS_ID = CASE WHEN LENGTH(MEDINS_ID) <= 5 THEN CONCAT(SUBSTR(MEDINS_ID, 1, 3), REPEAT('*', LENGTH(MEDINS_ID) - 3)) ELSE CONCAT(SUBSTR(MEDINS_ID, 1, CEIL(LENGTH(MEDINS_ID) * 2/3)), REPEAT('*', FLOOR(LENGTH(MEDINS_ID) * 1/3))) END;
-- MEDINS_CODE (org_name)
UPDATE stg_sd_yt_hi_tech_psn_info_b_df_v_ytai SET MEDINS_CODE = CASE WHEN LENGTH(MEDINS_CODE) <= 5 THEN CONCAT(SUBSTR(MEDINS_CODE, 1, 3), REPEAT('*', LENGTH(MEDINS_CODE) - 3)) ELSE CONCAT(SUBSTR(MEDINS_CODE, 1, CEIL(LENGTH(MEDINS_CODE) * 2/3)), REPEAT('*', FLOOR(LENGTH(MEDINS_CODE) * 1/3))) END;
-- MEDINS_NAME (person_name)
UPDATE stg_sd_yt_hi_tech_psn_info_b_df_v_ytai SET MEDINS_NAME = CASE WHEN LENGTH(MEDINS_NAME) <= 2 THEN CONCAT(SUBSTR(MEDINS_NAME, 1, 1), '*') WHEN LENGTH(MEDINS_NAME) <= 4 THEN CONCAT(SUBSTR(MEDINS_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(MEDINS_NAME, 1, CEIL(LENGTH(MEDINS_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(MEDINS_NAME) * 1/3))) END;
-- NAME (person_name)
UPDATE stg_sd_yt_hi_tech_psn_info_b_df_v_ytai SET NAME = CASE WHEN LENGTH(NAME) <= 2 THEN CONCAT(SUBSTR(NAME, 1, 1), '*') WHEN LENGTH(NAME) <= 4 THEN CONCAT(SUBSTR(NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(NAME, 1, CEIL(LENGTH(NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(NAME) * 1/3))) END;
-- DEPT_NAME (person_name)
UPDATE stg_sd_yt_hi_tech_psn_info_b_df_v_ytai SET DEPT_NAME = CASE WHEN LENGTH(DEPT_NAME) <= 2 THEN CONCAT(SUBSTR(DEPT_NAME, 1, 1), '*') WHEN LENGTH(DEPT_NAME) <= 4 THEN CONCAT(SUBSTR(DEPT_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(DEPT_NAME, 1, CEIL(LENGTH(DEPT_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(DEPT_NAME) * 1/3))) END;
-- CRTER_ID (person_name)
UPDATE stg_sd_yt_hi_tech_psn_info_b_df_v_ytai SET CRTER_ID = CASE WHEN LENGTH(CRTER_ID) <= 2 THEN CONCAT(SUBSTR(CRTER_ID, 1, 1), '*') WHEN LENGTH(CRTER_ID) <= 4 THEN CONCAT(SUBSTR(CRTER_ID, 1, 2), '*') ELSE CONCAT(SUBSTR(CRTER_ID, 1, CEIL(LENGTH(CRTER_ID) * 2/3)), REPEAT('*', FLOOR(LENGTH(CRTER_ID) * 1/3))) END;
-- CRTER_NAME (person_name)
UPDATE stg_sd_yt_hi_tech_psn_info_b_df_v_ytai SET CRTER_NAME = CASE WHEN LENGTH(CRTER_NAME) <= 2 THEN CONCAT(SUBSTR(CRTER_NAME, 1, 1), '*') WHEN LENGTH(CRTER_NAME) <= 4 THEN CONCAT(SUBSTR(CRTER_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(CRTER_NAME, 1, CEIL(LENGTH(CRTER_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(CRTER_NAME) * 1/3))) END;
-- CRTE_OPTINS_NO (org_name)
UPDATE stg_sd_yt_hi_tech_psn_info_b_df_v_ytai SET CRTE_OPTINS_NO = CASE WHEN LENGTH(CRTE_OPTINS_NO) <= 5 THEN CONCAT(SUBSTR(CRTE_OPTINS_NO, 1, 3), REPEAT('*', LENGTH(CRTE_OPTINS_NO) - 3)) ELSE CONCAT(SUBSTR(CRTE_OPTINS_NO, 1, CEIL(LENGTH(CRTE_OPTINS_NO) * 2/3)), REPEAT('*', FLOOR(LENGTH(CRTE_OPTINS_NO) * 1/3))) END;
-- OPTER_ID (person_name)
UPDATE stg_sd_yt_hi_tech_psn_info_b_df_v_ytai SET OPTER_ID = CASE WHEN LENGTH(OPTER_ID) <= 2 THEN CONCAT(SUBSTR(OPTER_ID, 1, 1), '*') WHEN LENGTH(OPTER_ID) <= 4 THEN CONCAT(SUBSTR(OPTER_ID, 1, 2), '*') ELSE CONCAT(SUBSTR(OPTER_ID, 1, CEIL(LENGTH(OPTER_ID) * 2/3)), REPEAT('*', FLOOR(LENGTH(OPTER_ID) * 1/3))) END;
-- OPTER_NAME (person_name)
UPDATE stg_sd_yt_hi_tech_psn_info_b_df_v_ytai SET OPTER_NAME = CASE WHEN LENGTH(OPTER_NAME) <= 2 THEN CONCAT(SUBSTR(OPTER_NAME, 1, 1), '*') WHEN LENGTH(OPTER_NAME) <= 4 THEN CONCAT(SUBSTR(OPTER_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(OPTER_NAME, 1, CEIL(LENGTH(OPTER_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(OPTER_NAME) * 1/3))) END;
-- OPTINS_NO (org_name)
UPDATE stg_sd_yt_hi_tech_psn_info_b_df_v_ytai SET OPTINS_NO = CASE WHEN LENGTH(OPTINS_NO) <= 5 THEN CONCAT(SUBSTR(OPTINS_NO, 1, 3), REPEAT('*', LENGTH(OPTINS_NO) - 3)) ELSE CONCAT(SUBSTR(OPTINS_NO, 1, CEIL(LENGTH(OPTINS_NO) * 2/3)), REPEAT('*', FLOOR(LENGTH(OPTINS_NO) * 1/3))) END;
-- VER_NAME (person_name)
UPDATE stg_sd_yt_hi_tech_psn_info_b_df_v_ytai SET VER_NAME = CASE WHEN LENGTH(VER_NAME) <= 2 THEN CONCAT(SUBSTR(VER_NAME, 1, 1), '*') WHEN LENGTH(VER_NAME) <= 4 THEN CONCAT(SUBSTR(VER_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(VER_NAME, 1, CEIL(LENGTH(VER_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(VER_NAME) * 1/3))) END;
-- dw_tab_name (person_name)
UPDATE stg_sd_yt_hi_tech_psn_info_b_df_v_ytai SET dw_tab_name = CASE WHEN LENGTH(dw_tab_name) <= 2 THEN CONCAT(SUBSTR(dw_tab_name, 1, 1), '*') WHEN LENGTH(dw_tab_name) <= 4 THEN CONCAT(SUBSTR(dw_tab_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dw_tab_name, 1, CEIL(LENGTH(dw_tab_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dw_tab_name) * 1/3))) END;

-- 表: stg_sd_yt_med_price_final
-- fixmedins_code (org_name)
UPDATE stg_sd_yt_med_price_final SET fixmedins_code = CASE WHEN LENGTH(fixmedins_code) <= 5 THEN CONCAT(SUBSTR(fixmedins_code, 1, 3), REPEAT('*', LENGTH(fixmedins_code) - 3)) ELSE CONCAT(SUBSTR(fixmedins_code, 1, CEIL(LENGTH(fixmedins_code) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_code) * 1/3))) END;
-- fixmedins_name (person_name)
UPDATE stg_sd_yt_med_price_final SET fixmedins_name = CASE WHEN LENGTH(fixmedins_name) <= 2 THEN CONCAT(SUBSTR(fixmedins_name, 1, 1), '*') WHEN LENGTH(fixmedins_name) <= 4 THEN CONCAT(SUBSTR(fixmedins_name, 1, 2), '*') ELSE CONCAT(SUBSTR(fixmedins_name, 1, CEIL(LENGTH(fixmedins_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_name) * 1/3))) END;
-- med_list_name (person_name)
UPDATE stg_sd_yt_med_price_final SET med_list_name = CASE WHEN LENGTH(med_list_name) <= 2 THEN CONCAT(SUBSTR(med_list_name, 1, 1), '*') WHEN LENGTH(med_list_name) <= 4 THEN CONCAT(SUBSTR(med_list_name, 1, 2), '*') ELSE CONCAT(SUBSTR(med_list_name, 1, CEIL(LENGTH(med_list_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(med_list_name) * 1/3))) END;
-- prod_name (person_name)
UPDATE stg_sd_yt_med_price_final SET prod_name = CASE WHEN LENGTH(prod_name) <= 2 THEN CONCAT(SUBSTR(prod_name, 1, 1), '*') WHEN LENGTH(prod_name) <= 4 THEN CONCAT(SUBSTR(prod_name, 1, 2), '*') ELSE CONCAT(SUBSTR(prod_name, 1, CEIL(LENGTH(prod_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(prod_name) * 1/3))) END;

-- 表: stg_sd_yt_med_price_final_copy1
-- fixmedins_code (org_name)
UPDATE stg_sd_yt_med_price_final_copy1 SET fixmedins_code = CASE WHEN LENGTH(fixmedins_code) <= 5 THEN CONCAT(SUBSTR(fixmedins_code, 1, 3), REPEAT('*', LENGTH(fixmedins_code) - 3)) ELSE CONCAT(SUBSTR(fixmedins_code, 1, CEIL(LENGTH(fixmedins_code) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_code) * 1/3))) END;
-- fixmedins_name (person_name)
UPDATE stg_sd_yt_med_price_final_copy1 SET fixmedins_name = CASE WHEN LENGTH(fixmedins_name) <= 2 THEN CONCAT(SUBSTR(fixmedins_name, 1, 1), '*') WHEN LENGTH(fixmedins_name) <= 4 THEN CONCAT(SUBSTR(fixmedins_name, 1, 2), '*') ELSE CONCAT(SUBSTR(fixmedins_name, 1, CEIL(LENGTH(fixmedins_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_name) * 1/3))) END;
-- med_list_name (person_name)
UPDATE stg_sd_yt_med_price_final_copy1 SET med_list_name = CASE WHEN LENGTH(med_list_name) <= 2 THEN CONCAT(SUBSTR(med_list_name, 1, 1), '*') WHEN LENGTH(med_list_name) <= 4 THEN CONCAT(SUBSTR(med_list_name, 1, 2), '*') ELSE CONCAT(SUBSTR(med_list_name, 1, CEIL(LENGTH(med_list_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(med_list_name) * 1/3))) END;
-- prod_name (person_name)
UPDATE stg_sd_yt_med_price_final_copy1 SET prod_name = CASE WHEN LENGTH(prod_name) <= 2 THEN CONCAT(SUBSTR(prod_name, 1, 1), '*') WHEN LENGTH(prod_name) <= 4 THEN CONCAT(SUBSTR(prod_name, 1, 2), '*') ELSE CONCAT(SUBSTR(prod_name, 1, CEIL(LENGTH(prod_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(prod_name) * 1/3))) END;

-- 表: stg_sd_yt_nurs_info_b_df_v_ytai
-- NURS_CODE (person_name)
UPDATE stg_sd_yt_nurs_info_b_df_v_ytai SET NURS_CODE = CASE WHEN LENGTH(NURS_CODE) <= 2 THEN CONCAT(SUBSTR(NURS_CODE, 1, 1), '*') WHEN LENGTH(NURS_CODE) <= 4 THEN CONCAT(SUBSTR(NURS_CODE, 1, 2), '*') ELSE CONCAT(SUBSTR(NURS_CODE, 1, CEIL(LENGTH(NURS_CODE) * 2/3)), REPEAT('*', FLOOR(LENGTH(NURS_CODE) * 1/3))) END;
-- PSN_NO (person_id)
UPDATE stg_sd_yt_nurs_info_b_df_v_ytai SET PSN_NO = CASE WHEN LENGTH(PSN_NO) <= 8 THEN CONCAT(SUBSTR(PSN_NO, 1, 5), REPEAT('*', LENGTH(PSN_NO) - 5)) ELSE CONCAT(SUBSTR(PSN_NO, 1, CEIL(LENGTH(PSN_NO) * 2/3)), REPEAT('*', FLOOR(LENGTH(PSN_NO) * 1/3))) END;
-- NURS_NAME (person_name)
UPDATE stg_sd_yt_nurs_info_b_df_v_ytai SET NURS_NAME = CASE WHEN LENGTH(NURS_NAME) <= 2 THEN CONCAT(SUBSTR(NURS_NAME, 1, 1), '*') WHEN LENGTH(NURS_NAME) <= 4 THEN CONCAT(SUBSTR(NURS_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(NURS_NAME, 1, CEIL(LENGTH(NURS_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(NURS_NAME) * 1/3))) END;
-- NURS_PRAC_CERT_NO (person_name)
UPDATE stg_sd_yt_nurs_info_b_df_v_ytai SET NURS_PRAC_CERT_NO = CASE WHEN LENGTH(NURS_PRAC_CERT_NO) <= 2 THEN CONCAT(SUBSTR(NURS_PRAC_CERT_NO, 1, 1), '*') WHEN LENGTH(NURS_PRAC_CERT_NO) <= 4 THEN CONCAT(SUBSTR(NURS_PRAC_CERT_NO, 1, 2), '*') ELSE CONCAT(SUBSTR(NURS_PRAC_CERT_NO, 1, CEIL(LENGTH(NURS_PRAC_CERT_NO) * 2/3)), REPEAT('*', FLOOR(LENGTH(NURS_PRAC_CERT_NO) * 1/3))) END;
-- PRACINS_NO (org_name)
UPDATE stg_sd_yt_nurs_info_b_df_v_ytai SET PRACINS_NO = CASE WHEN LENGTH(PRACINS_NO) <= 5 THEN CONCAT(SUBSTR(PRACINS_NO, 1, 3), REPEAT('*', LENGTH(PRACINS_NO) - 3)) ELSE CONCAT(SUBSTR(PRACINS_NO, 1, CEIL(LENGTH(PRACINS_NO) * 2/3)), REPEAT('*', FLOOR(LENGTH(PRACINS_NO) * 1/3))) END;
-- PRACINS_NAME (person_name)
UPDATE stg_sd_yt_nurs_info_b_df_v_ytai SET PRACINS_NAME = CASE WHEN LENGTH(PRACINS_NAME) <= 2 THEN CONCAT(SUBSTR(PRACINS_NAME, 1, 1), '*') WHEN LENGTH(PRACINS_NAME) <= 4 THEN CONCAT(SUBSTR(PRACINS_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(PRACINS_NAME, 1, CEIL(LENGTH(PRACINS_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(PRACINS_NAME) * 1/3))) END;
-- PRACINS_ADDR (org_name)
UPDATE stg_sd_yt_nurs_info_b_df_v_ytai SET PRACINS_ADDR = CASE WHEN LENGTH(PRACINS_ADDR) <= 5 THEN CONCAT(SUBSTR(PRACINS_ADDR, 1, 3), REPEAT('*', LENGTH(PRACINS_ADDR) - 3)) ELSE CONCAT(SUBSTR(PRACINS_ADDR, 1, CEIL(LENGTH(PRACINS_ADDR) * 2/3)), REPEAT('*', FLOOR(LENGTH(PRACINS_ADDR) * 1/3))) END;
-- NURS_PRO_TECH_DUTY (person_name)
UPDATE stg_sd_yt_nurs_info_b_df_v_ytai SET NURS_PRO_TECH_DUTY = CASE WHEN LENGTH(NURS_PRO_TECH_DUTY) <= 2 THEN CONCAT(SUBSTR(NURS_PRO_TECH_DUTY, 1, 1), '*') WHEN LENGTH(NURS_PRO_TECH_DUTY) <= 4 THEN CONCAT(SUBSTR(NURS_PRO_TECH_DUTY, 1, 2), '*') ELSE CONCAT(SUBSTR(NURS_PRO_TECH_DUTY, 1, CEIL(LENGTH(NURS_PRO_TECH_DUTY) * 2/3)), REPEAT('*', FLOOR(LENGTH(NURS_PRO_TECH_DUTY) * 1/3))) END;
-- NURS_PRO_TECH_DUTY_NAME (person_name)
UPDATE stg_sd_yt_nurs_info_b_df_v_ytai SET NURS_PRO_TECH_DUTY_NAME = CASE WHEN LENGTH(NURS_PRO_TECH_DUTY_NAME) <= 2 THEN CONCAT(SUBSTR(NURS_PRO_TECH_DUTY_NAME, 1, 1), '*') WHEN LENGTH(NURS_PRO_TECH_DUTY_NAME) <= 4 THEN CONCAT(SUBSTR(NURS_PRO_TECH_DUTY_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(NURS_PRO_TECH_DUTY_NAME, 1, CEIL(LENGTH(NURS_PRO_TECH_DUTY_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(NURS_PRO_TECH_DUTY_NAME) * 1/3))) END;
-- CRTER_ID (person_name)
UPDATE stg_sd_yt_nurs_info_b_df_v_ytai SET CRTER_ID = CASE WHEN LENGTH(CRTER_ID) <= 2 THEN CONCAT(SUBSTR(CRTER_ID, 1, 1), '*') WHEN LENGTH(CRTER_ID) <= 4 THEN CONCAT(SUBSTR(CRTER_ID, 1, 2), '*') ELSE CONCAT(SUBSTR(CRTER_ID, 1, CEIL(LENGTH(CRTER_ID) * 2/3)), REPEAT('*', FLOOR(LENGTH(CRTER_ID) * 1/3))) END;
-- CRTER_NAME (person_name)
UPDATE stg_sd_yt_nurs_info_b_df_v_ytai SET CRTER_NAME = CASE WHEN LENGTH(CRTER_NAME) <= 2 THEN CONCAT(SUBSTR(CRTER_NAME, 1, 1), '*') WHEN LENGTH(CRTER_NAME) <= 4 THEN CONCAT(SUBSTR(CRTER_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(CRTER_NAME, 1, CEIL(LENGTH(CRTER_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(CRTER_NAME) * 1/3))) END;
-- CRTE_OPTINS_NO (org_name)
UPDATE stg_sd_yt_nurs_info_b_df_v_ytai SET CRTE_OPTINS_NO = CASE WHEN LENGTH(CRTE_OPTINS_NO) <= 5 THEN CONCAT(SUBSTR(CRTE_OPTINS_NO, 1, 3), REPEAT('*', LENGTH(CRTE_OPTINS_NO) - 3)) ELSE CONCAT(SUBSTR(CRTE_OPTINS_NO, 1, CEIL(LENGTH(CRTE_OPTINS_NO) * 2/3)), REPEAT('*', FLOOR(LENGTH(CRTE_OPTINS_NO) * 1/3))) END;
-- OPTER_ID (person_name)
UPDATE stg_sd_yt_nurs_info_b_df_v_ytai SET OPTER_ID = CASE WHEN LENGTH(OPTER_ID) <= 2 THEN CONCAT(SUBSTR(OPTER_ID, 1, 1), '*') WHEN LENGTH(OPTER_ID) <= 4 THEN CONCAT(SUBSTR(OPTER_ID, 1, 2), '*') ELSE CONCAT(SUBSTR(OPTER_ID, 1, CEIL(LENGTH(OPTER_ID) * 2/3)), REPEAT('*', FLOOR(LENGTH(OPTER_ID) * 1/3))) END;
-- OPTER_NAME (person_name)
UPDATE stg_sd_yt_nurs_info_b_df_v_ytai SET OPTER_NAME = CASE WHEN LENGTH(OPTER_NAME) <= 2 THEN CONCAT(SUBSTR(OPTER_NAME, 1, 1), '*') WHEN LENGTH(OPTER_NAME) <= 4 THEN CONCAT(SUBSTR(OPTER_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(OPTER_NAME, 1, CEIL(LENGTH(OPTER_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(OPTER_NAME) * 1/3))) END;
-- OPTINS_NO (org_name)
UPDATE stg_sd_yt_nurs_info_b_df_v_ytai SET OPTINS_NO = CASE WHEN LENGTH(OPTINS_NO) <= 5 THEN CONCAT(SUBSTR(OPTINS_NO, 1, 3), REPEAT('*', LENGTH(OPTINS_NO) - 3)) ELSE CONCAT(SUBSTR(OPTINS_NO, 1, CEIL(LENGTH(OPTINS_NO) * 2/3)), REPEAT('*', FLOOR(LENGTH(OPTINS_NO) * 1/3))) END;
-- VER_NAME (person_name)
UPDATE stg_sd_yt_nurs_info_b_df_v_ytai SET VER_NAME = CASE WHEN LENGTH(VER_NAME) <= 2 THEN CONCAT(SUBSTR(VER_NAME, 1, 1), '*') WHEN LENGTH(VER_NAME) <= 4 THEN CONCAT(SUBSTR(VER_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(VER_NAME, 1, CEIL(LENGTH(VER_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(VER_NAME) * 1/3))) END;
-- NURS_ID (person_name)
UPDATE stg_sd_yt_nurs_info_b_df_v_ytai SET NURS_ID = CASE WHEN LENGTH(NURS_ID) <= 2 THEN CONCAT(SUBSTR(NURS_ID, 1, 1), '*') WHEN LENGTH(NURS_ID) <= 4 THEN CONCAT(SUBSTR(NURS_ID, 1, 2), '*') ELSE CONCAT(SUBSTR(NURS_ID, 1, CEIL(LENGTH(NURS_ID) * 2/3)), REPEAT('*', FLOOR(LENGTH(NURS_ID) * 1/3))) END;
-- HI_NURS_REGCERT_ELEC_DOC (person_name)
UPDATE stg_sd_yt_nurs_info_b_df_v_ytai SET HI_NURS_REGCERT_ELEC_DOC = CASE WHEN LENGTH(HI_NURS_REGCERT_ELEC_DOC) <= 2 THEN CONCAT(SUBSTR(HI_NURS_REGCERT_ELEC_DOC, 1, 1), '*') WHEN LENGTH(HI_NURS_REGCERT_ELEC_DOC) <= 4 THEN CONCAT(SUBSTR(HI_NURS_REGCERT_ELEC_DOC, 1, 2), '*') ELSE CONCAT(SUBSTR(HI_NURS_REGCERT_ELEC_DOC, 1, CEIL(LENGTH(HI_NURS_REGCERT_ELEC_DOC) * 2/3)), REPEAT('*', FLOOR(LENGTH(HI_NURS_REGCERT_ELEC_DOC) * 1/3))) END;
-- dw_tab_name (person_name)
UPDATE stg_sd_yt_nurs_info_b_df_v_ytai SET dw_tab_name = CASE WHEN LENGTH(dw_tab_name) <= 2 THEN CONCAT(SUBSTR(dw_tab_name, 1, 1), '*') WHEN LENGTH(dw_tab_name) <= 4 THEN CONCAT(SUBSTR(dw_tab_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dw_tab_name, 1, CEIL(LENGTH(dw_tab_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dw_tab_name) * 1/3))) END;

-- 表: stg_sd_yt_phar_info_b_df_v_ytai
-- PSN_NO (person_id)
UPDATE stg_sd_yt_phar_info_b_df_v_ytai SET PSN_NO = CASE WHEN LENGTH(PSN_NO) <= 8 THEN CONCAT(SUBSTR(PSN_NO, 1, 5), REPEAT('*', LENGTH(PSN_NO) - 5)) ELSE CONCAT(SUBSTR(PSN_NO, 1, CEIL(LENGTH(PSN_NO) * 2/3)), REPEAT('*', FLOOR(LENGTH(PSN_NO) * 1/3))) END;
-- PHAR_NAME (person_name)
UPDATE stg_sd_yt_phar_info_b_df_v_ytai SET PHAR_NAME = CASE WHEN LENGTH(PHAR_NAME) <= 2 THEN CONCAT(SUBSTR(PHAR_NAME, 1, 1), '*') WHEN LENGTH(PHAR_NAME) <= 4 THEN CONCAT(SUBSTR(PHAR_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(PHAR_NAME, 1, CEIL(LENGTH(PHAR_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(PHAR_NAME) * 1/3))) END;
-- PHAR_PRAC_TYPE_NAME (person_name)
UPDATE stg_sd_yt_phar_info_b_df_v_ytai SET PHAR_PRAC_TYPE_NAME = CASE WHEN LENGTH(PHAR_PRAC_TYPE_NAME) <= 2 THEN CONCAT(SUBSTR(PHAR_PRAC_TYPE_NAME, 1, 1), '*') WHEN LENGTH(PHAR_PRAC_TYPE_NAME) <= 4 THEN CONCAT(SUBSTR(PHAR_PRAC_TYPE_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(PHAR_PRAC_TYPE_NAME, 1, CEIL(LENGTH(PHAR_PRAC_TYPE_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(PHAR_PRAC_TYPE_NAME) * 1/3))) END;
-- PHAR_PRAC_SCP_NAME (person_name)
UPDATE stg_sd_yt_phar_info_b_df_v_ytai SET PHAR_PRAC_SCP_NAME = CASE WHEN LENGTH(PHAR_PRAC_SCP_NAME) <= 2 THEN CONCAT(SUBSTR(PHAR_PRAC_SCP_NAME, 1, 1), '*') WHEN LENGTH(PHAR_PRAC_SCP_NAME) <= 4 THEN CONCAT(SUBSTR(PHAR_PRAC_SCP_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(PHAR_PRAC_SCP_NAME, 1, CEIL(LENGTH(PHAR_PRAC_SCP_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(PHAR_PRAC_SCP_NAME) * 1/3))) END;
-- PRACINS_NO (org_name)
UPDATE stg_sd_yt_phar_info_b_df_v_ytai SET PRACINS_NO = CASE WHEN LENGTH(PRACINS_NO) <= 5 THEN CONCAT(SUBSTR(PRACINS_NO, 1, 3), REPEAT('*', LENGTH(PRACINS_NO) - 3)) ELSE CONCAT(SUBSTR(PRACINS_NO, 1, CEIL(LENGTH(PRACINS_NO) * 2/3)), REPEAT('*', FLOOR(LENGTH(PRACINS_NO) * 1/3))) END;
-- PRACINS_NAME (person_name)
UPDATE stg_sd_yt_phar_info_b_df_v_ytai SET PRACINS_NAME = CASE WHEN LENGTH(PRACINS_NAME) <= 2 THEN CONCAT(SUBSTR(PRACINS_NAME, 1, 1), '*') WHEN LENGTH(PRACINS_NAME) <= 4 THEN CONCAT(SUBSTR(PRACINS_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(PRACINS_NAME, 1, CEIL(LENGTH(PRACINS_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(PRACINS_NAME) * 1/3))) END;
-- PRACINS_ADDR (org_name)
UPDATE stg_sd_yt_phar_info_b_df_v_ytai SET PRACINS_ADDR = CASE WHEN LENGTH(PRACINS_ADDR) <= 5 THEN CONCAT(SUBSTR(PRACINS_ADDR, 1, 3), REPEAT('*', LENGTH(PRACINS_ADDR) - 3)) ELSE CONCAT(SUBSTR(PRACINS_ADDR, 1, CEIL(LENGTH(PRACINS_ADDR) * 2/3)), REPEAT('*', FLOOR(LENGTH(PRACINS_ADDR) * 1/3))) END;
-- PHAR_PRO_TECH_DUTY_NAME (person_name)
UPDATE stg_sd_yt_phar_info_b_df_v_ytai SET PHAR_PRO_TECH_DUTY_NAME = CASE WHEN LENGTH(PHAR_PRO_TECH_DUTY_NAME) <= 2 THEN CONCAT(SUBSTR(PHAR_PRO_TECH_DUTY_NAME, 1, 1), '*') WHEN LENGTH(PHAR_PRO_TECH_DUTY_NAME) <= 4 THEN CONCAT(SUBSTR(PHAR_PRO_TECH_DUTY_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(PHAR_PRO_TECH_DUTY_NAME, 1, CEIL(LENGTH(PHAR_PRO_TECH_DUTY_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(PHAR_PRO_TECH_DUTY_NAME) * 1/3))) END;
-- CRTER_ID (person_name)
UPDATE stg_sd_yt_phar_info_b_df_v_ytai SET CRTER_ID = CASE WHEN LENGTH(CRTER_ID) <= 2 THEN CONCAT(SUBSTR(CRTER_ID, 1, 1), '*') WHEN LENGTH(CRTER_ID) <= 4 THEN CONCAT(SUBSTR(CRTER_ID, 1, 2), '*') ELSE CONCAT(SUBSTR(CRTER_ID, 1, CEIL(LENGTH(CRTER_ID) * 2/3)), REPEAT('*', FLOOR(LENGTH(CRTER_ID) * 1/3))) END;
-- CRTER_NAME (person_name)
UPDATE stg_sd_yt_phar_info_b_df_v_ytai SET CRTER_NAME = CASE WHEN LENGTH(CRTER_NAME) <= 2 THEN CONCAT(SUBSTR(CRTER_NAME, 1, 1), '*') WHEN LENGTH(CRTER_NAME) <= 4 THEN CONCAT(SUBSTR(CRTER_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(CRTER_NAME, 1, CEIL(LENGTH(CRTER_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(CRTER_NAME) * 1/3))) END;
-- CRTE_OPTINS_NO (org_name)
UPDATE stg_sd_yt_phar_info_b_df_v_ytai SET CRTE_OPTINS_NO = CASE WHEN LENGTH(CRTE_OPTINS_NO) <= 5 THEN CONCAT(SUBSTR(CRTE_OPTINS_NO, 1, 3), REPEAT('*', LENGTH(CRTE_OPTINS_NO) - 3)) ELSE CONCAT(SUBSTR(CRTE_OPTINS_NO, 1, CEIL(LENGTH(CRTE_OPTINS_NO) * 2/3)), REPEAT('*', FLOOR(LENGTH(CRTE_OPTINS_NO) * 1/3))) END;
-- OPTER_ID (person_name)
UPDATE stg_sd_yt_phar_info_b_df_v_ytai SET OPTER_ID = CASE WHEN LENGTH(OPTER_ID) <= 2 THEN CONCAT(SUBSTR(OPTER_ID, 1, 1), '*') WHEN LENGTH(OPTER_ID) <= 4 THEN CONCAT(SUBSTR(OPTER_ID, 1, 2), '*') ELSE CONCAT(SUBSTR(OPTER_ID, 1, CEIL(LENGTH(OPTER_ID) * 2/3)), REPEAT('*', FLOOR(LENGTH(OPTER_ID) * 1/3))) END;
-- OPTER_NAME (person_name)
UPDATE stg_sd_yt_phar_info_b_df_v_ytai SET OPTER_NAME = CASE WHEN LENGTH(OPTER_NAME) <= 2 THEN CONCAT(SUBSTR(OPTER_NAME, 1, 1), '*') WHEN LENGTH(OPTER_NAME) <= 4 THEN CONCAT(SUBSTR(OPTER_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(OPTER_NAME, 1, CEIL(LENGTH(OPTER_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(OPTER_NAME) * 1/3))) END;
-- OPTINS_NO (org_name)
UPDATE stg_sd_yt_phar_info_b_df_v_ytai SET OPTINS_NO = CASE WHEN LENGTH(OPTINS_NO) <= 5 THEN CONCAT(SUBSTR(OPTINS_NO, 1, 3), REPEAT('*', LENGTH(OPTINS_NO) - 3)) ELSE CONCAT(SUBSTR(OPTINS_NO, 1, CEIL(LENGTH(OPTINS_NO) * 2/3)), REPEAT('*', FLOOR(LENGTH(OPTINS_NO) * 1/3))) END;
-- VER_NAME (person_name)
UPDATE stg_sd_yt_phar_info_b_df_v_ytai SET VER_NAME = CASE WHEN LENGTH(VER_NAME) <= 2 THEN CONCAT(SUBSTR(VER_NAME, 1, 1), '*') WHEN LENGTH(VER_NAME) <= 4 THEN CONCAT(SUBSTR(VER_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(VER_NAME, 1, CEIL(LENGTH(VER_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(VER_NAME) * 1/3))) END;
-- PHAR_PRAC_EMP (org_name)
UPDATE stg_sd_yt_phar_info_b_df_v_ytai SET PHAR_PRAC_EMP = CASE WHEN LENGTH(PHAR_PRAC_EMP) <= 5 THEN CONCAT(SUBSTR(PHAR_PRAC_EMP, 1, 3), REPEAT('*', LENGTH(PHAR_PRAC_EMP) - 3)) ELSE CONCAT(SUBSTR(PHAR_PRAC_EMP, 1, CEIL(LENGTH(PHAR_PRAC_EMP) * 2/3)), REPEAT('*', FLOOR(LENGTH(PHAR_PRAC_EMP) * 1/3))) END;
-- cert_no (id_card)
UPDATE stg_sd_yt_phar_info_b_df_v_ytai SET cert_no = CASE WHEN LENGTH(cert_no) <= 10 THEN CONCAT(SUBSTR(cert_no, 1, 7), REPEAT('*', LENGTH(cert_no) - 7)) ELSE CONCAT(SUBSTR(cert_no, 1, CEIL(LENGTH(cert_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(cert_no) * 1/3))) END;
-- dw_tab_name (person_name)
UPDATE stg_sd_yt_phar_info_b_df_v_ytai SET dw_tab_name = CASE WHEN LENGTH(dw_tab_name) <= 2 THEN CONCAT(SUBSTR(dw_tab_name, 1, 1), '*') WHEN LENGTH(dw_tab_name) <= 4 THEN CONCAT(SUBSTR(dw_tab_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dw_tab_name, 1, CEIL(LENGTH(dw_tab_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dw_tab_name) * 1/3))) END;

-- 表: stg_setl_fixmedins_ec_df_ytai
-- fix_blng_admdvs (org_name)
UPDATE stg_setl_fixmedins_ec_df_ytai SET fix_blng_admdvs = CASE WHEN LENGTH(fix_blng_admdvs) <= 5 THEN CONCAT(SUBSTR(fix_blng_admdvs, 1, 3), REPEAT('*', LENGTH(fix_blng_admdvs) - 3)) ELSE CONCAT(SUBSTR(fix_blng_admdvs, 1, CEIL(LENGTH(fix_blng_admdvs) * 2/3)), REPEAT('*', FLOOR(LENGTH(fix_blng_admdvs) * 1/3))) END;
-- fixmedins_type (org_name)
UPDATE stg_setl_fixmedins_ec_df_ytai SET fixmedins_type = CASE WHEN LENGTH(fixmedins_type) <= 5 THEN CONCAT(SUBSTR(fixmedins_type, 1, 3), REPEAT('*', LENGTH(fixmedins_type) - 3)) ELSE CONCAT(SUBSTR(fixmedins_type, 1, CEIL(LENGTH(fixmedins_type) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_type) * 1/3))) END;
-- fixmedins_code (org_name)
UPDATE stg_setl_fixmedins_ec_df_ytai SET fixmedins_code = CASE WHEN LENGTH(fixmedins_code) <= 5 THEN CONCAT(SUBSTR(fixmedins_code, 1, 3), REPEAT('*', LENGTH(fixmedins_code) - 3)) ELSE CONCAT(SUBSTR(fixmedins_code, 1, CEIL(LENGTH(fixmedins_code) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_code) * 1/3))) END;
-- fixmedins_name (person_name)
UPDATE stg_setl_fixmedins_ec_df_ytai SET fixmedins_name = CASE WHEN LENGTH(fixmedins_name) <= 2 THEN CONCAT(SUBSTR(fixmedins_name, 1, 1), '*') WHEN LENGTH(fixmedins_name) <= 4 THEN CONCAT(SUBSTR(fixmedins_name, 1, 2), '*') ELSE CONCAT(SUBSTR(fixmedins_name, 1, CEIL(LENGTH(fixmedins_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_name) * 1/3))) END;

-- 表: stg_tb_dise_list_b_df_v_ytai
-- dise_name (person_name)
UPDATE stg_tb_dise_list_b_df_v_ytai SET dise_name = CASE WHEN LENGTH(dise_name) <= 2 THEN CONCAT(SUBSTR(dise_name, 1, 1), '*') WHEN LENGTH(dise_name) <= 4 THEN CONCAT(SUBSTR(dise_name, 1, 2), '*') ELSE CONCAT(SUBSTR(dise_name, 1, CEIL(LENGTH(dise_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(dise_name) * 1/3))) END;
-- crter (person_name)
UPDATE stg_tb_dise_list_b_df_v_ytai SET crter = CASE WHEN LENGTH(crter) <= 2 THEN CONCAT(SUBSTR(crter, 1, 1), '*') WHEN LENGTH(crter) <= 4 THEN CONCAT(SUBSTR(crter, 1, 2), '*') ELSE CONCAT(SUBSTR(crter, 1, CEIL(LENGTH(crter) * 2/3)), REPEAT('*', FLOOR(LENGTH(crter) * 1/3))) END;
-- crte_optins (org_name)
UPDATE stg_tb_dise_list_b_df_v_ytai SET crte_optins = CASE WHEN LENGTH(crte_optins) <= 5 THEN CONCAT(SUBSTR(crte_optins, 1, 3), REPEAT('*', LENGTH(crte_optins) - 3)) ELSE CONCAT(SUBSTR(crte_optins, 1, CEIL(LENGTH(crte_optins) * 2/3)), REPEAT('*', FLOOR(LENGTH(crte_optins) * 1/3))) END;
-- opter (person_name)
UPDATE stg_tb_dise_list_b_df_v_ytai SET opter = CASE WHEN LENGTH(opter) <= 2 THEN CONCAT(SUBSTR(opter, 1, 1), '*') WHEN LENGTH(opter) <= 4 THEN CONCAT(SUBSTR(opter, 1, 2), '*') ELSE CONCAT(SUBSTR(opter, 1, CEIL(LENGTH(opter) * 2/3)), REPEAT('*', FLOOR(LENGTH(opter) * 1/3))) END;
-- optins (org_name)
UPDATE stg_tb_dise_list_b_df_v_ytai SET optins = CASE WHEN LENGTH(optins) <= 5 THEN CONCAT(SUBSTR(optins, 1, 3), REPEAT('*', LENGTH(optins) - 3)) ELSE CONCAT(SUBSTR(optins, 1, CEIL(LENGTH(optins) * 2/3)), REPEAT('*', FLOOR(LENGTH(optins) * 1/3))) END;

-- 表: stg_tp_opsp_reg_d_df_v_ytai
-- psn_no (person_id)
UPDATE stg_tp_opsp_reg_d_df_v_ytai SET psn_no = CASE WHEN LENGTH(psn_no) <= 8 THEN CONCAT(SUBSTR(psn_no, 1, 5), REPEAT('*', LENGTH(psn_no) - 5)) ELSE CONCAT(SUBSTR(psn_no, 1, CEIL(LENGTH(psn_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(psn_no) * 1/3))) END;
-- mdtrt_type (medical_record)
UPDATE stg_tp_opsp_reg_d_df_v_ytai SET mdtrt_type = CASE WHEN LENGTH(mdtrt_type) <= 8 THEN CONCAT(SUBSTR(mdtrt_type, 1, 5), REPEAT('*', LENGTH(mdtrt_type) - 5)) ELSE CONCAT(SUBSTR(mdtrt_type, 1, CEIL(LENGTH(mdtrt_type) * 2/3)), REPEAT('*', FLOOR(LENGTH(mdtrt_type) * 1/3))) END;
-- insu_psn_id (person_id)
UPDATE stg_tp_opsp_reg_d_df_v_ytai SET insu_psn_id = CASE WHEN LENGTH(insu_psn_id) <= 8 THEN CONCAT(SUBSTR(insu_psn_id, 1, 5), REPEAT('*', LENGTH(insu_psn_id) - 5)) ELSE CONCAT(SUBSTR(insu_psn_id, 1, CEIL(LENGTH(insu_psn_id) * 2/3)), REPEAT('*', FLOOR(LENGTH(insu_psn_id) * 1/3))) END;
-- coner_name (person_name)
UPDATE stg_tp_opsp_reg_d_df_v_ytai SET coner_name = CASE WHEN LENGTH(coner_name) <= 2 THEN CONCAT(SUBSTR(coner_name, 1, 1), '*') WHEN LENGTH(coner_name) <= 4 THEN CONCAT(SUBSTR(coner_name, 1, 2), '*') ELSE CONCAT(SUBSTR(coner_name, 1, CEIL(LENGTH(coner_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(coner_name) * 1/3))) END;
-- tel (phone)
UPDATE stg_tp_opsp_reg_d_df_v_ytai SET tel = CASE WHEN LENGTH(tel) <= 8 THEN CONCAT(SUBSTR(tel, 1, 5), REPEAT('*', LENGTH(tel) - 5)) ELSE CONCAT(SUBSTR(tel, 1, CEIL(LENGTH(tel) * 2/3)), REPEAT('*', FLOOR(LENGTH(tel) * 1/3))) END;
-- crter (person_name)
UPDATE stg_tp_opsp_reg_d_df_v_ytai SET crter = CASE WHEN LENGTH(crter) <= 2 THEN CONCAT(SUBSTR(crter, 1, 1), '*') WHEN LENGTH(crter) <= 4 THEN CONCAT(SUBSTR(crter, 1, 2), '*') ELSE CONCAT(SUBSTR(crter, 1, CEIL(LENGTH(crter) * 2/3)), REPEAT('*', FLOOR(LENGTH(crter) * 1/3))) END;
-- crte_optins (org_name)
UPDATE stg_tp_opsp_reg_d_df_v_ytai SET crte_optins = CASE WHEN LENGTH(crte_optins) <= 5 THEN CONCAT(SUBSTR(crte_optins, 1, 3), REPEAT('*', LENGTH(crte_optins) - 3)) ELSE CONCAT(SUBSTR(crte_optins, 1, CEIL(LENGTH(crte_optins) * 2/3)), REPEAT('*', FLOOR(LENGTH(crte_optins) * 1/3))) END;
-- opter (person_name)
UPDATE stg_tp_opsp_reg_d_df_v_ytai SET opter = CASE WHEN LENGTH(opter) <= 2 THEN CONCAT(SUBSTR(opter, 1, 1), '*') WHEN LENGTH(opter) <= 4 THEN CONCAT(SUBSTR(opter, 1, 2), '*') ELSE CONCAT(SUBSTR(opter, 1, CEIL(LENGTH(opter) * 2/3)), REPEAT('*', FLOOR(LENGTH(opter) * 1/3))) END;
-- optins (org_name)
UPDATE stg_tp_opsp_reg_d_df_v_ytai SET optins = CASE WHEN LENGTH(optins) <= 5 THEN CONCAT(SUBSTR(optins, 1, 3), REPEAT('*', LENGTH(optins) - 3)) ELSE CONCAT(SUBSTR(optins, 1, CEIL(LENGTH(optins) * 2/3)), REPEAT('*', FLOOR(LENGTH(optins) * 1/3))) END;

-- 表: stg_tp_opsp_reg_medins_d_df_v_ytai
-- fixmedins_code (org_name)
UPDATE stg_tp_opsp_reg_medins_d_df_v_ytai SET fixmedins_code = CASE WHEN LENGTH(fixmedins_code) <= 5 THEN CONCAT(SUBSTR(fixmedins_code, 1, 3), REPEAT('*', LENGTH(fixmedins_code) - 3)) ELSE CONCAT(SUBSTR(fixmedins_code, 1, CEIL(LENGTH(fixmedins_code) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_code) * 1/3))) END;
-- psn_no (person_id)
UPDATE stg_tp_opsp_reg_medins_d_df_v_ytai SET psn_no = CASE WHEN LENGTH(psn_no) <= 8 THEN CONCAT(SUBSTR(psn_no, 1, 5), REPEAT('*', LENGTH(psn_no) - 5)) ELSE CONCAT(SUBSTR(psn_no, 1, CEIL(LENGTH(psn_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(psn_no) * 1/3))) END;
-- crter (person_name)
UPDATE stg_tp_opsp_reg_medins_d_df_v_ytai SET crter = CASE WHEN LENGTH(crter) <= 2 THEN CONCAT(SUBSTR(crter, 1, 1), '*') WHEN LENGTH(crter) <= 4 THEN CONCAT(SUBSTR(crter, 1, 2), '*') ELSE CONCAT(SUBSTR(crter, 1, CEIL(LENGTH(crter) * 2/3)), REPEAT('*', FLOOR(LENGTH(crter) * 1/3))) END;
-- crte_optins (org_name)
UPDATE stg_tp_opsp_reg_medins_d_df_v_ytai SET crte_optins = CASE WHEN LENGTH(crte_optins) <= 5 THEN CONCAT(SUBSTR(crte_optins, 1, 3), REPEAT('*', LENGTH(crte_optins) - 3)) ELSE CONCAT(SUBSTR(crte_optins, 1, CEIL(LENGTH(crte_optins) * 2/3)), REPEAT('*', FLOOR(LENGTH(crte_optins) * 1/3))) END;
-- opter (person_name)
UPDATE stg_tp_opsp_reg_medins_d_df_v_ytai SET opter = CASE WHEN LENGTH(opter) <= 2 THEN CONCAT(SUBSTR(opter, 1, 1), '*') WHEN LENGTH(opter) <= 4 THEN CONCAT(SUBSTR(opter, 1, 2), '*') ELSE CONCAT(SUBSTR(opter, 1, CEIL(LENGTH(opter) * 2/3)), REPEAT('*', FLOOR(LENGTH(opter) * 1/3))) END;
-- optins (org_name)
UPDATE stg_tp_opsp_reg_medins_d_df_v_ytai SET optins = CASE WHEN LENGTH(optins) <= 5 THEN CONCAT(SUBSTR(optins, 1, 3), REPEAT('*', LENGTH(optins) - 3)) ELSE CONCAT(SUBSTR(optins, 1, CEIL(LENGTH(optins) * 2/3)), REPEAT('*', FLOOR(LENGTH(optins) * 1/3))) END;

-- 表: stg_zffs_drgkd37_mf_ytai
-- mdtrt_id (medical_record)
UPDATE stg_zffs_drgkd37_mf_ytai SET mdtrt_id = CASE WHEN LENGTH(mdtrt_id) <= 8 THEN CONCAT(SUBSTR(mdtrt_id, 1, 5), REPEAT('*', LENGTH(mdtrt_id) - 5)) ELSE CONCAT(SUBSTR(mdtrt_id, 1, CEIL(LENGTH(mdtrt_id) * 2/3)), REPEAT('*', FLOOR(LENGTH(mdtrt_id) * 1/3))) END;
-- fixmedins_code (org_name)
UPDATE stg_zffs_drgkd37_mf_ytai SET fixmedins_code = CASE WHEN LENGTH(fixmedins_code) <= 5 THEN CONCAT(SUBSTR(fixmedins_code, 1, 3), REPEAT('*', LENGTH(fixmedins_code) - 3)) ELSE CONCAT(SUBSTR(fixmedins_code, 1, CEIL(LENGTH(fixmedins_code) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_code) * 1/3))) END;
-- MDTRTSN (medical_record)
UPDATE stg_zffs_drgkd37_mf_ytai SET MDTRTSN = CASE WHEN LENGTH(MDTRTSN) <= 8 THEN CONCAT(SUBSTR(MDTRTSN, 1, 5), REPEAT('*', LENGTH(MDTRTSN) - 5)) ELSE CONCAT(SUBSTR(MDTRTSN, 1, CEIL(LENGTH(MDTRTSN) * 2/3)), REPEAT('*', FLOOR(LENGTH(MDTRTSN) * 1/3))) END;
-- org_no (org_name)
UPDATE stg_zffs_drgkd37_mf_ytai SET org_no = CASE WHEN LENGTH(org_no) <= 5 THEN CONCAT(SUBSTR(org_no, 1, 3), REPEAT('*', LENGTH(org_no) - 3)) ELSE CONCAT(SUBSTR(org_no, 1, CEIL(LENGTH(org_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(org_no) * 1/3))) END;
-- MEDINSLV (org_name)
UPDATE stg_zffs_drgkd37_mf_ytai SET MEDINSLV = CASE WHEN LENGTH(MEDINSLV) <= 5 THEN CONCAT(SUBSTR(MEDINSLV, 1, 3), REPEAT('*', LENGTH(MEDINSLV) - 3)) ELSE CONCAT(SUBSTR(MEDINSLV, 1, CEIL(LENGTH(MEDINSLV) * 2/3)), REPEAT('*', FLOOR(LENGTH(MEDINSLV) * 1/3))) END;
-- ADM_DISENAME (person_name)
UPDATE stg_zffs_drgkd37_mf_ytai SET ADM_DISENAME = CASE WHEN LENGTH(ADM_DISENAME) <= 2 THEN CONCAT(SUBSTR(ADM_DISENAME, 1, 1), '*') WHEN LENGTH(ADM_DISENAME) <= 4 THEN CONCAT(SUBSTR(ADM_DISENAME, 1, 2), '*') ELSE CONCAT(SUBSTR(ADM_DISENAME, 1, CEIL(LENGTH(ADM_DISENAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(ADM_DISENAME) * 1/3))) END;
-- DSCG_DISENAME (person_name)
UPDATE stg_zffs_drgkd37_mf_ytai SET DSCG_DISENAME = CASE WHEN LENGTH(DSCG_DISENAME) <= 2 THEN CONCAT(SUBSTR(DSCG_DISENAME, 1, 1), '*') WHEN LENGTH(DSCG_DISENAME) <= 4 THEN CONCAT(SUBSTR(DSCG_DISENAME, 1, 2), '*') ELSE CONCAT(SUBSTR(DSCG_DISENAME, 1, CEIL(LENGTH(DSCG_DISENAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(DSCG_DISENAME) * 1/3))) END;
-- OUTMED_REA (medical_record)
UPDATE stg_zffs_drgkd37_mf_ytai SET OUTMED_REA = CASE WHEN LENGTH(OUTMED_REA) <= 8 THEN CONCAT(SUBSTR(OUTMED_REA, 1, 5), REPEAT('*', LENGTH(OUTMED_REA) - 5)) ELSE CONCAT(SUBSTR(OUTMED_REA, 1, CEIL(LENGTH(OUTMED_REA) * 2/3)), REPEAT('*', FLOOR(LENGTH(OUTMED_REA) * 1/3))) END;
-- OUT_MDTRTSN (medical_record)
UPDATE stg_zffs_drgkd37_mf_ytai SET OUT_MDTRTSN = CASE WHEN LENGTH(OUT_MDTRTSN) <= 8 THEN CONCAT(SUBSTR(OUT_MDTRTSN, 1, 5), REPEAT('*', LENGTH(OUT_MDTRTSN) - 5)) ELSE CONCAT(SUBSTR(OUT_MDTRTSN, 1, CEIL(LENGTH(OUT_MDTRTSN) * 2/3)), REPEAT('*', FLOOR(LENGTH(OUT_MDTRTSN) * 1/3))) END;
-- fixmedins_name (person_name)
UPDATE stg_zffs_drgkd37_mf_ytai SET fixmedins_name = CASE WHEN LENGTH(fixmedins_name) <= 2 THEN CONCAT(SUBSTR(fixmedins_name, 1, 1), '*') WHEN LENGTH(fixmedins_name) <= 4 THEN CONCAT(SUBSTR(fixmedins_name, 1, 2), '*') ELSE CONCAT(SUBSTR(fixmedins_name, 1, CEIL(LENGTH(fixmedins_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_name) * 1/3))) END;
-- ATDDR_CODE (person_name)
UPDATE stg_zffs_drgkd37_mf_ytai SET ATDDR_CODE = CASE WHEN LENGTH(ATDDR_CODE) <= 2 THEN CONCAT(SUBSTR(ATDDR_CODE, 1, 1), '*') WHEN LENGTH(ATDDR_CODE) <= 4 THEN CONCAT(SUBSTR(ATDDR_CODE, 1, 2), '*') ELSE CONCAT(SUBSTR(ATDDR_CODE, 1, CEIL(LENGTH(ATDDR_CODE) * 2/3)), REPEAT('*', FLOOR(LENGTH(ATDDR_CODE) * 1/3))) END;
-- ATDDR_NAME (person_name)
UPDATE stg_zffs_drgkd37_mf_ytai SET ATDDR_NAME = CASE WHEN LENGTH(ATDDR_NAME) <= 2 THEN CONCAT(SUBSTR(ATDDR_NAME, 1, 1), '*') WHEN LENGTH(ATDDR_NAME) <= 4 THEN CONCAT(SUBSTR(ATDDR_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(ATDDR_NAME, 1, CEIL(LENGTH(ATDDR_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(ATDDR_NAME) * 1/3))) END;
-- DEPT_NAME (person_name)
UPDATE stg_zffs_drgkd37_mf_ytai SET DEPT_NAME = CASE WHEN LENGTH(DEPT_NAME) <= 2 THEN CONCAT(SUBSTR(DEPT_NAME, 1, 1), '*') WHEN LENGTH(DEPT_NAME) <= 4 THEN CONCAT(SUBSTR(DEPT_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(DEPT_NAME, 1, CEIL(LENGTH(DEPT_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(DEPT_NAME) * 1/3))) END;
-- IPT_SN (org_name)
UPDATE stg_zffs_drgkd37_mf_ytai SET IPT_SN = CASE WHEN LENGTH(IPT_SN) <= 5 THEN CONCAT(SUBSTR(IPT_SN, 1, 3), REPEAT('*', LENGTH(IPT_SN) - 3)) ELSE CONCAT(SUBSTR(IPT_SN, 1, CEIL(LENGTH(IPT_SN) * 2/3)), REPEAT('*', FLOOR(LENGTH(IPT_SN) * 1/3))) END;
-- HOSP_OPTER (person_name)
UPDATE stg_zffs_drgkd37_mf_ytai SET HOSP_OPTER = CASE WHEN LENGTH(HOSP_OPTER) <= 2 THEN CONCAT(SUBSTR(HOSP_OPTER, 1, 1), '*') WHEN LENGTH(HOSP_OPTER) <= 4 THEN CONCAT(SUBSTR(HOSP_OPTER, 1, 2), '*') ELSE CONCAT(SUBSTR(HOSP_OPTER, 1, CEIL(LENGTH(HOSP_OPTER) * 2/3)), REPEAT('*', FLOOR(LENGTH(HOSP_OPTER) * 1/3))) END;
-- OPTER_DATE (org_name)
UPDATE stg_zffs_drgkd37_mf_ytai SET OPTER_DATE = CASE WHEN LENGTH(OPTER_DATE) <= 5 THEN CONCAT(SUBSTR(OPTER_DATE, 1, 3), REPEAT('*', LENGTH(OPTER_DATE) - 3)) ELSE CONCAT(SUBSTR(OPTER_DATE, 1, CEIL(LENGTH(OPTER_DATE) * 2/3)), REPEAT('*', FLOOR(LENGTH(OPTER_DATE) * 1/3))) END;
-- PAN_NAME (person_name)
UPDATE stg_zffs_drgkd37_mf_ytai SET PAN_NAME = CASE WHEN LENGTH(PAN_NAME) <= 2 THEN CONCAT(SUBSTR(PAN_NAME, 1, 1), '*') WHEN LENGTH(PAN_NAME) <= 4 THEN CONCAT(SUBSTR(PAN_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(PAN_NAME, 1, CEIL(LENGTH(PAN_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(PAN_NAME) * 1/3))) END;
-- emp_no (org_name)
UPDATE stg_zffs_drgkd37_mf_ytai SET emp_no = CASE WHEN LENGTH(emp_no) <= 5 THEN CONCAT(SUBSTR(emp_no, 1, 3), REPEAT('*', LENGTH(emp_no) - 3)) ELSE CONCAT(SUBSTR(emp_no, 1, CEIL(LENGTH(emp_no) * 2/3)), REPEAT('*', FLOOR(LENGTH(emp_no) * 1/3))) END;
-- emp_name (person_name)
UPDATE stg_zffs_drgkd37_mf_ytai SET emp_name = CASE WHEN LENGTH(emp_name) <= 2 THEN CONCAT(SUBSTR(emp_name, 1, 1), '*') WHEN LENGTH(emp_name) <= 4 THEN CONCAT(SUBSTR(emp_name, 1, 2), '*') ELSE CONCAT(SUBSTR(emp_name, 1, CEIL(LENGTH(emp_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(emp_name) * 1/3))) END;
-- emp_type (org_name)
UPDATE stg_zffs_drgkd37_mf_ytai SET emp_type = CASE WHEN LENGTH(emp_type) <= 5 THEN CONCAT(SUBSTR(emp_type, 1, 3), REPEAT('*', LENGTH(emp_type) - 3)) ELSE CONCAT(SUBSTR(emp_type, 1, CEIL(LENGTH(emp_type) * 2/3)), REPEAT('*', FLOOR(LENGTH(emp_type) * 1/3))) END;
-- fixmedins_type (org_name)
UPDATE stg_zffs_drgkd37_mf_ytai SET fixmedins_type = CASE WHEN LENGTH(fixmedins_type) <= 5 THEN CONCAT(SUBSTR(fixmedins_type, 1, 3), REPEAT('*', LENGTH(fixmedins_type) - 3)) ELSE CONCAT(SUBSTR(fixmedins_type, 1, CEIL(LENGTH(fixmedins_type) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_type) * 1/3))) END;
-- hosp_lv (org_name)
UPDATE stg_zffs_drgkd37_mf_ytai SET hosp_lv = CASE WHEN LENGTH(hosp_lv) <= 5 THEN CONCAT(SUBSTR(hosp_lv, 1, 3), REPEAT('*', LENGTH(hosp_lv) - 3)) ELSE CONCAT(SUBSTR(hosp_lv, 1, CEIL(LENGTH(hosp_lv) * 2/3)), REPEAT('*', FLOOR(LENGTH(hosp_lv) * 1/3))) END;
-- TEL (phone)
UPDATE stg_zffs_drgkd37_mf_ytai SET TEL = CASE WHEN LENGTH(TEL) <= 8 THEN CONCAT(SUBSTR(TEL, 1, 5), REPEAT('*', LENGTH(TEL) - 5)) ELSE CONCAT(SUBSTR(TEL, 1, CEIL(LENGTH(TEL) * 2/3)), REPEAT('*', FLOOR(LENGTH(TEL) * 1/3))) END;
-- MEDRCDNO (medical_record)
UPDATE stg_zffs_drgkd37_mf_ytai SET MEDRCDNO = CASE WHEN LENGTH(MEDRCDNO) <= 8 THEN CONCAT(SUBSTR(MEDRCDNO, 1, 5), REPEAT('*', LENGTH(MEDRCDNO) - 5)) ELSE CONCAT(SUBSTR(MEDRCDNO, 1, CEIL(LENGTH(MEDRCDNO) * 2/3)), REPEAT('*', FLOOR(LENGTH(MEDRCDNO) * 1/3))) END;
-- MDC_NAME (person_name)
UPDATE stg_zffs_drgkd37_mf_ytai SET MDC_NAME = CASE WHEN LENGTH(MDC_NAME) <= 2 THEN CONCAT(SUBSTR(MDC_NAME, 1, 1), '*') WHEN LENGTH(MDC_NAME) <= 4 THEN CONCAT(SUBSTR(MDC_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(MDC_NAME, 1, CEIL(LENGTH(MDC_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(MDC_NAME) * 1/3))) END;
-- ADRG_NAME (person_name)
UPDATE stg_zffs_drgkd37_mf_ytai SET ADRG_NAME = CASE WHEN LENGTH(ADRG_NAME) <= 2 THEN CONCAT(SUBSTR(ADRG_NAME, 1, 1), '*') WHEN LENGTH(ADRG_NAME) <= 4 THEN CONCAT(SUBSTR(ADRG_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(ADRG_NAME, 1, CEIL(LENGTH(ADRG_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(ADRG_NAME) * 1/3))) END;
-- DRG_NAME (person_name)
UPDATE stg_zffs_drgkd37_mf_ytai SET DRG_NAME = CASE WHEN LENGTH(DRG_NAME) <= 2 THEN CONCAT(SUBSTR(DRG_NAME, 1, 1), '*') WHEN LENGTH(DRG_NAME) <= 4 THEN CONCAT(SUBSTR(DRG_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(DRG_NAME, 1, CEIL(LENGTH(DRG_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(DRG_NAME) * 1/3))) END;
-- MODI_DRG_NAME (person_name)
UPDATE stg_zffs_drgkd37_mf_ytai SET MODI_DRG_NAME = CASE WHEN LENGTH(MODI_DRG_NAME) <= 2 THEN CONCAT(SUBSTR(MODI_DRG_NAME, 1, 1), '*') WHEN LENGTH(MODI_DRG_NAME) <= 4 THEN CONCAT(SUBSTR(MODI_DRG_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(MODI_DRG_NAME, 1, CEIL(LENGTH(MODI_DRG_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(MODI_DRG_NAME) * 1/3))) END;
-- CRTER (person_name)
UPDATE stg_zffs_drgkd37_mf_ytai SET CRTER = CASE WHEN LENGTH(CRTER) <= 2 THEN CONCAT(SUBSTR(CRTER, 1, 1), '*') WHEN LENGTH(CRTER) <= 4 THEN CONCAT(SUBSTR(CRTER, 1, 2), '*') ELSE CONCAT(SUBSTR(CRTER, 1, CEIL(LENGTH(CRTER) * 2/3)), REPEAT('*', FLOOR(LENGTH(CRTER) * 1/3))) END;
-- OPTER (person_name)
UPDATE stg_zffs_drgkd37_mf_ytai SET OPTER = CASE WHEN LENGTH(OPTER) <= 2 THEN CONCAT(SUBSTR(OPTER, 1, 1), '*') WHEN LENGTH(OPTER) <= 4 THEN CONCAT(SUBSTR(OPTER, 1, 2), '*') ELSE CONCAT(SUBSTR(OPTER, 1, CEIL(LENGTH(OPTER) * 2/3)), REPEAT('*', FLOOR(LENGTH(OPTER) * 1/3))) END;
-- OPTINS_CODE (org_name)
UPDATE stg_zffs_drgkd37_mf_ytai SET OPTINS_CODE = CASE WHEN LENGTH(OPTINS_CODE) <= 5 THEN CONCAT(SUBSTR(OPTINS_CODE, 1, 3), REPEAT('*', LENGTH(OPTINS_CODE) - 3)) ELSE CONCAT(SUBSTR(OPTINS_CODE, 1, CEIL(LENGTH(OPTINS_CODE) * 2/3)), REPEAT('*', FLOOR(LENGTH(OPTINS_CODE) * 1/3))) END;
-- MAINDIAG_NAME (person_name)
UPDATE stg_zffs_drgkd37_mf_ytai SET MAINDIAG_NAME = CASE WHEN LENGTH(MAINDIAG_NAME) <= 2 THEN CONCAT(SUBSTR(MAINDIAG_NAME, 1, 1), '*') WHEN LENGTH(MAINDIAG_NAME) <= 4 THEN CONCAT(SUBSTR(MAINDIAG_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(MAINDIAG_NAME, 1, CEIL(LENGTH(MAINDIAG_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(MAINDIAG_NAME) * 1/3))) END;
-- MEDRCD_ID (medical_record)
UPDATE stg_zffs_drgkd37_mf_ytai SET MEDRCD_ID = CASE WHEN LENGTH(MEDRCD_ID) <= 8 THEN CONCAT(SUBSTR(MEDRCD_ID, 1, 5), REPEAT('*', LENGTH(MEDRCD_ID) - 5)) ELSE CONCAT(SUBSTR(MEDRCD_ID, 1, CEIL(LENGTH(MEDRCD_ID) * 2/3)), REPEAT('*', FLOOR(LENGTH(MEDRCD_ID) * 1/3))) END;
-- DRG_NAME_20 (person_name)
UPDATE stg_zffs_drgkd37_mf_ytai SET DRG_NAME_20 = CASE WHEN LENGTH(DRG_NAME_20) <= 2 THEN CONCAT(SUBSTR(DRG_NAME_20, 1, 1), '*') WHEN LENGTH(DRG_NAME_20) <= 4 THEN CONCAT(SUBSTR(DRG_NAME_20, 1, 2), '*') ELSE CONCAT(SUBSTR(DRG_NAME_20, 1, CEIL(LENGTH(DRG_NAME_20) * 2/3)), REPEAT('*', FLOOR(LENGTH(DRG_NAME_20) * 1/3))) END;

-- 表: stg_zffs_drgkd37proc_mf_ytai
-- fixmedins_code (org_name)
UPDATE stg_zffs_drgkd37proc_mf_ytai SET fixmedins_code = CASE WHEN LENGTH(fixmedins_code) <= 5 THEN CONCAT(SUBSTR(fixmedins_code, 1, 3), REPEAT('*', LENGTH(fixmedins_code) - 3)) ELSE CONCAT(SUBSTR(fixmedins_code, 1, CEIL(LENGTH(fixmedins_code) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_code) * 1/3))) END;
-- DRG_NAME (person_name)
UPDATE stg_zffs_drgkd37proc_mf_ytai SET DRG_NAME = CASE WHEN LENGTH(DRG_NAME) <= 2 THEN CONCAT(SUBSTR(DRG_NAME, 1, 1), '*') WHEN LENGTH(DRG_NAME) <= 4 THEN CONCAT(SUBSTR(DRG_NAME, 1, 2), '*') ELSE CONCAT(SUBSTR(DRG_NAME, 1, CEIL(LENGTH(DRG_NAME) * 2/3)), REPEAT('*', FLOOR(LENGTH(DRG_NAME) * 1/3))) END;
-- fixmedins_code_h (org_name)
UPDATE stg_zffs_drgkd37proc_mf_ytai SET fixmedins_code_h = CASE WHEN LENGTH(fixmedins_code_h) <= 5 THEN CONCAT(SUBSTR(fixmedins_code_h, 1, 3), REPEAT('*', LENGTH(fixmedins_code_h) - 3)) ELSE CONCAT(SUBSTR(fixmedins_code_h, 1, CEIL(LENGTH(fixmedins_code_h) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_code_h) * 1/3))) END;
-- fixmedins_name (person_name)
UPDATE stg_zffs_drgkd37proc_mf_ytai SET fixmedins_name = CASE WHEN LENGTH(fixmedins_name) <= 2 THEN CONCAT(SUBSTR(fixmedins_name, 1, 1), '*') WHEN LENGTH(fixmedins_name) <= 4 THEN CONCAT(SUBSTR(fixmedins_name, 1, 2), '*') ELSE CONCAT(SUBSTR(fixmedins_name, 1, CEIL(LENGTH(fixmedins_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_name) * 1/3))) END;
-- fixmedins_type (org_name)
UPDATE stg_zffs_drgkd37proc_mf_ytai SET fixmedins_type = CASE WHEN LENGTH(fixmedins_type) <= 5 THEN CONCAT(SUBSTR(fixmedins_type, 1, 3), REPEAT('*', LENGTH(fixmedins_type) - 3)) ELSE CONCAT(SUBSTR(fixmedins_type, 1, CEIL(LENGTH(fixmedins_type) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_type) * 1/3))) END;

-- 表: yt_fixmedins_b_lsb
-- fixmedins_name (person_name)
UPDATE yt_fixmedins_b_lsb SET fixmedins_name = CASE WHEN LENGTH(fixmedins_name) <= 2 THEN CONCAT(SUBSTR(fixmedins_name, 1, 1), '*') WHEN LENGTH(fixmedins_name) <= 4 THEN CONCAT(SUBSTR(fixmedins_name, 1, 2), '*') ELSE CONCAT(SUBSTR(fixmedins_name, 1, CEIL(LENGTH(fixmedins_name) * 2/3)), REPEAT('*', FLOOR(LENGTH(fixmedins_name) * 1/3))) END;

