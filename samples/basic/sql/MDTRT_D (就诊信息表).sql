--odps sql 
--********************************************************************--
--author:sc-yt-yibaolian
--create time:2024-03-14 20:50:19
--********************************************************************--
select nvl(a.mdtrt_id_nat, a.mdtrt_id) as mdtrt_id, -- 就诊ID
       null medins_setl_id, -- 医药机构结算ID
       p.psn_no_gb psn_no, -- 人员编号  
       a.insu_psn_id psn_insu_rlts_id, -- 人员参保关系ID 
       b.psn_cert_type psn_cert_type, -- 人员证件类型
       b.certno certno, -- 证件号码
       b.psn_name psn_name, -- 人员姓名
       b.gend gend, -- 性别
       b.naty naty, -- 民族
       b.brdy brdy, -- 出生日期
       null age, -- 年龄
       a.coner_name coner_name, -- 联系人姓名
       a.tel tel, -- 联系电话
       a.addr addr, -- 联系地址
       case
         when a.insutype = 'E' then
          '510'
         when a.insutype = 'C' and a.grp_type = 'B' then
          '390'
         else
          '310'
       end insutype, -- 险种类型
       case
         when a.psn_type = '15' then
          '1104'
         when a.psn_type = '16' then
          '1105'
         when a.psn_type = '27' then
          '1204'
         when a.psn_type = '45' then
          '1406'
         when a.psn_type = '92' then
          '146004'
         when a.psn_type = '93' then
          '146002'
         when a.psn_type in ('11', '12', '13', '14') then
          '11'
         when a.psn_type in ('21', '22', '23', '24', '25', '26') then
          '12'
         when a.psn_type in ('44', '445') then
          '1401'
         when a.psn_type = '31' then
          '13'
         when a.psn_type in
              ('414', '424', '434', '435', '45', '504', '505', '605') then
          '14'
         when a.psn_type in ('50', '92', '93') then
          '15'
         when a.psn_type in ('34', '35', '36') then
          '91'
         when a.psn_type = '60' then
          '16'
         when a.psn_type = '37' then
          '34'
         when a.psn_type in ('415', '42') then
          '1403'
         when a.psn_type = '43' then
          '1404'
         when a.psn_type = '41' then
          '1402'
         when a.psn_type = '33' then
          '995310'
         else
          '99'
       end psn_type, -- 人员类别
       '0' cvlserv_flag, -- 公务员标志
       null cvlserv_lv, -- 公务员等级
       null sp_psn_type, -- 特殊人员类型
       null sp_psn_type_lv, -- 特殊人员类型等级
       null clct_grde, -- 缴费档次
       null flxempe_flag, -- 灵活就业标志
       null nwb_flag, -- 新生儿标志
       nvl((select admdvs
             from pub_ytai_data.stg_gb_optins_info_b_df_v_ytai b
            where length(b.optins_no) = 6
              and a.poolarea = b.optins_no),
           '370600') insu_admdvs, -- 参保所属医保区划
       nvl((select max(i.emp_no_gb)
          from pub_ytai_data.stg_cb_insu_emp_info_b_df_v_ytai i
         where i.emp_no = a.org_id), a.org_id) emp_no, -- 单位编号
       (select max(i.insu_emp_name)
          from pub_ytai_data.stg_cb_insu_emp_info_b_df_v_ytai i
         where i.emp_no = a.org_id) emp_name, -- 单位名称
       case
         when a.emp_type in ('10', '15') then
          '10'
         when a.emp_type in ('58', '54', '59', '52', '51', '50', '53') then
          '50'
         when a.emp_type in ('70', '71', '72') then
          '70'
         when a.emp_type in ('62', '81') then
          '81'
         when a.emp_type = '60' then
          '9901'
         when a.emp_type = '30' then
          '30'
         when a.emp_type = '55' then
          '55'
         when a.emp_type = '56' then
          '56'
         when a.emp_type = '57' then
          '57'
         when a.emp_type = '80' then
          '80'
         when a.emp_type = '82' then
          '82'
         when a.emp_type = '83' then
          '83'
         when a.emp_type = '84' then
          '84'
         when a.emp_type = '85' then
          '85'
         when a.emp_type = '86' then
          '86'
         when a.emp_type = '90' then
          '90'
         when a.emp_type = '91' then
          '91'
         when a.emp_type = '93' then
          '93'
         when a.emp_type = '94' then
          '94'
         when a.emp_type = '95' then
          '95'
         when a.emp_type = '96' then
          '96'
         else
          '99'
       end emp_type, -- 单位类型
       case
         when a.econ_type = '101' then
          '900'
       end econ_type, -- 经济类型
       null afil_indu, -- 所属行业
       null afil_rlts, -- 隶属关系
       nvl((select max(i.emp_mgt_type)
          from pub_ytai_data.stg_cb_insu_emp_info_b_df_v_ytai i
         where i.emp_no = a.org_id), a.org_id) emp_mgt_type, -- 单位管理类型     
       mdtrt_loc pay_loc, -- 支付地点类别
       a.fixmedins_code fixmedins_code, -- 定点医药机构编号
       nvl(c.fixmedins_name, '***') fixmedins_name, -- 定点医药机构名称
       c.hosp_lv hosp_lv, -- 医院等级
       substr(c.fixmedins_code, 2, 6) fix_blng_admdvs, -- 定点归属医保区划
       c.lmtpric_hosp_lv lmtpric_hosp_lv, -- 限价医院等级 
       c.dedc_hosp_lv dedc_hosp_lv, -- 起付线医院等级
       a.begndate begntime, -- 开始时间
       a.enddate endtime, -- 结束时间
       a.mdtrt_cert_type mdtrt_cert_type, -- 就诊凭证类型
       a.mdtrt_cert_no mdtrt_cert_no, -- 就诊凭证编号
       case
         when a.med_pool_type = '6' and a.med_type = '19' then
          '990103'
         when a.med_pool_type = '6' and a.med_type = '61' then
          '1403'
         when a.med_pool_type = '6' and a.med_type = '1107' then
          '11'
         when a.med_pool_type = '6' and a.med_type = '18' then
          '11'
         when a.med_pool_type = '6' and a.med_type = '78' then
          '910302'
         when a.med_pool_type = '6' and a.med_type = '66' then
          '1103'
         when a.med_pool_type = '6' and a.med_type = '67' then
          '99331'
         when a.med_pool_type = '6' and a.med_type = '68' then
          '99332'
         when a.med_pool_type = '6' and a.med_type = '69' then
          '1103'
         when a.med_pool_type = '6' and a.med_type = '70' then
          '110215'
         when a.med_pool_type = '6' and a.med_type = '71' then
          '910202'
         when a.med_pool_type = '6' and a.med_type = '41' then
          '41'
         when a.med_pool_type = '6' and a.med_type = '62' then
          '990101'
         when a.med_pool_type = '6' and a.med_type = '63' then
          '9940'
         when a.med_pool_type = '6' and a.med_type = '64' then
          '910202'
         when a.med_pool_type = '6' and a.med_type = '72' then
          '510103'
         when a.med_pool_type = '6' and a.med_type = '77' then
          '9943'
         when a.med_pool_type = '4' then
          '14'
         when a.med_pool_type = '1' and a.med_type = '73' then
          '2106'
         when a.med_pool_type = '1' and a.med_type = '74' then
          '9940'
         when a.med_pool_type = '1' and a.med_type not in ('73', '74') then
          '21'
         when a.med_pool_type = '5' then
          '81'
         when a.med_pool_type = '2' and a.med_type = '33' then
          '990302'
         when a.med_pool_type = '2' and a.med_type = '34' then
          '990403'
         when a.med_pool_type = '2' and a.med_type = '35' then
          '9954'
         when a.med_pool_type = '2' and a.med_type = '32' then
          '9954'
         when a.med_pool_type = '2' and
              a.med_type not in ('33', '34', '35', '32') then
          '71'
         when a.med_pool_type = '3' then
          '13'
       end med_type, -- 医疗类别
       a.mdtrt_type rloc_type, -- 异地安置类别
       '0' ars_year_ipt_flag, -- 跨年度住院标志
       null pre_pay_flag, -- 先行支付标志
       a.year , -- 年度
       a.refl_old_mdtrt_id refl_old_mdtrt_id, -- 转诊前就诊ID
       substr(a.ipt_otp_no, 1, 30) ipt_otp_no, -- 住院/门诊号
       a.medrcdno medrcdno, -- 病历号
       a.dr_code chfpdr_code, -- 主诊医师代码
       null adm_diag_dscr, -- 入院诊断描述
       a.dept_codg adm_dept_codg, -- 入院科室编码
       a.dept_name adm_dept_name, -- 入院科室名称
       a.bed adm_bed, -- 入院床位
       a.bed wardarea_bed, -- 病区床位
       '0' traf_dept_flag, -- 转科室标志
       case
         when a.med_pool_type = '1' then
          a.dise_code
         else
          ''
       end dscg_maindiag_code, -- 住院主诊断代码
       a.dept_codg dscg_dept_codg, -- 出院科室编码
       a.dept_name dscg_dept_name, -- 出院科室名称
       a.bed dscg_bed, -- 出院床位 
       case
         when a.dscg_way in ('1', '2', '3', '4') then
          '1'
         when a.dscg_way in ('7', '8') then
          '2'
         when a.dscg_way = '5' then
          '5'
         when a.dscg_way = '6' then
          '9'
         else
          ''
       end dscg_way, -- 离院方式
       (select d.main_cond_desc
          from pub_ytai_data.stg_tp_mdtrt_summ_d_v_ytai d
         where a.mdtrt_id = d.mdtrt_id) main_cond_dscr, -- 主要病情描述
       a.dscg_dise_code dise_no, -- 病种编号  
       (select m.dise_name
          from pub_ytai_data.stg_tb_dise_list_b_df_v_ytai m
         where a.dise_code = m.dise_code) dise_name, -- 病种名称
       null oprn_oprt_code, -- 手术操作代码
       null oprn_oprt_name, -- 手术操作名称
       null otp_diag_info, -- 门诊诊断信息  
       case
         when a.med_pool_type in ('1',
                                  '2',
                                  '3') and
              a.enddate is null then
          '1'
         else
          '0'
       end inhosp_stas, -- 在院状态
       p.surv_stas_ocur_date die_date, -- 死亡日期
       null ipt_days, -- 住院天数
       null geso_val, -- 孕周数
       null birctrl_type, -- 计划生育手术类别
       null fetts, -- 胎次
       null fetus_cnt, -- 胎儿数
       null matn_type, -- 生育类别
       null prey_time, -- 妊娠时间
       null latechb_flag, -- 晚育标志
       '0' pret_flag, -- 早产标志
       null fpsc_no, -- 计划生育服务证号
       null birctrl_matn_date, -- 计划生育手术或生育日期
       '0' cop_flag, -- 伴有并发症标志
       a.trt_dcla_detl_sn trt_dcla_detl_sn, -- 待遇申报明细流水号
       '1' vali_flag, -- 有效标志
       null memo, -- 备注
       a.rid rid, -- 数据唯一记录号
       a.updt_time updt_time, -- 数据更新时间
       a.crter crter_id, -- 创建人ID
       a.crter crter_name, -- 创建人姓名
       a.crte_time crte_time, -- 数据创建时间
       a.crte_optins crte_optins_no, -- 创建机构编号
       a.opter opter_id, -- 经办人ID
       a.opter opter_name, -- 经办人姓名
       a.opt_time opt_time, -- 经办时间
       a.optins optins_no, -- 经办机构编号
       nvl((select admdvs
             from pub_ytai_data.stg_gb_optins_info_b_df_v_ytai b
            where length(b.optins_no) = 6
              and a.poolarea = b.optins_no),
           '370600') poolarea_no, -- 统筹区编号
       a.dr_name chfpdr_name, -- 主诊医师姓名
       (SELECT bm.dise_name
          FROM pub_ytai_data.stg_tb_dise_list_b_df_v_ytai bm
         WHERE bm.dise_code = a.dscg_dise_code) dscg_maindiag_name, -- 住院主诊断名称
       null adm_caty, -- 入院科别
       null dscg_caty, -- 出院科别
       '0' ttp_pay_flag, -- 第三方赔付标志
       null ttp_pay_prop, -- 第三方赔付比例
       '' dise_type_code, -- 病种类型代码
       '' same_dise_adm_flag, -- 同病种入院标志
       '' quts_type -- 编制类型
  from pub_ytai_data.stg_tp_mdtrt_d_v_ytai      a
       inner join pub_ytai_data.stg_tp_psn_info_b_df_v_ytai   b
           on a.psn_no = b.psn_no
       left join pub_ytai_data.stg_pol_fixmedins_b_df_v_ytai c
           on a.fixmedins_code = c.fixmedins_code
       inner join pub_ytai_data.stg_pi_psn_info_b_df_v_ytai       p
           on a.psn_no = p.psn_no
 where a.insutype in ('C', 'E')
   and p.psn_no_gb is not null
   and b.certno is not null;
