--odps sql 
--********************************************************************--
--author:sc-yt-yibaolian
--create time:2024-03-18 19:39:59
--********************************************************************--

--就诊信息表  
INSERT OVERWRITE TABLE sc_dr_ytai_sjzq.STG_SD_YT_SETL_DIAG_LIST_D  PARTITION(pt= '${bizdate}')
SELECT  '1' AS MAINDIAG_FLAG    --主诊断标志  地纬默认'1'--1
        ,mdtrt.MDTRT_ID AS DIAG_INFO_ID --2
        ,nvl(mdtrt.mdtrt_id_nat, mdtrt.mdtrt_id) AS MDTRT_ID    --就诊ID(YLTCDJH)   就诊ID--3
        ,nvl(b.PSN_NO_GB,b.psn_no) AS PSN_NO    --人员编号(RYID)          人员编号--4
        ,'1' AS INOUT_DIAG_TYPE    --出入院诊断类别--5
        ,NULL AS DIAG_TYPE    --诊断类别--6
        
        ,NULL AS DIAG_SRT_NO    --诊断排序号        地纬默认'1'--7
        ,nvl(mdtrt.dscg_dise_code, mdtrt.dise_code)AS DIAG_CODE    --诊断代码(JBBM) 诊断代码--8
        ,(
            SELECT dise_name FROM sc_dr_ytai_sjzq.stg_tb_dise_list_b_df_v_ytai dise WHERE dise.DISE_CODE = mdtrt.dise_code 
        ) AS DIAG_NAME     --诊断名称--9
        ,NULL AS ADM_COND    -- 入院病情--10
        ,mdtrt.dept_codg AS DIAG_DEPT    --诊断科室--11
        ,nvl(substr(mdtrt.dr_code,1,30),'') AS DIAG_DR_CODE    --医师代码(YSBH)   诊断医师代码--12
        ,mdtrt.dr_name AS DIAG_DR_NAME    --姓名        诊断医师姓名--13
        ,nvl(mdtrt.enddate,mdtrt.begndate) AS DIAG_TIME    --诊断时间--14
        ,'1' AS VALI_FLAG    --有效标志--15
        ,mdtrt.rid AS RID    --数据唯一记录号 --16
        ,mdtrt.UPDT_TIME AS UPDT_TIME    --数据更新时间--17
        ,NULL AS CRTER_ID    --创建人ID
        ,NULL AS CRTER_NAME    --创建人姓名
        ,mdtrt.CRTE_TIME AS CRTE_TIME    --数据创建时间
        ,func_get_optins_sql(mdtrt.crte_optins) AS CRTE_OPTINS_NO    --创建机构编号
        ,NULL AS OPTER_ID    --经办人ID
        ,NULL AS OPTER_NAME    --经办人姓名
        ,NULL AS OPT_TIME    --经办时间
        ,func_get_optins_sql(mdtrt.poolarea)  AS OPTINS_NO    --经办机构编号
        ,func_get_optins_sql(mdtrt.poolarea)  AS POOLAREA_NO    --统筹区编号
        ,NULL AS EVT_INST_ID    --事件实例ID
FROM    sc_dr_ytai_sjzq.stg_tp_mdtrt_d_v_ytai mdtrt
LEFT JOIN sc_dr_ytai_sjzq.stg_pi_psn_info_b_df_v_ytai b
ON      mdtrt.psn_no = b.psn_no
WHERE   mdtrt.insutype IN ('C', 'E')
AND     mdtrt.pt='${bizdate}'
AND     b.certno IS NOT NULL
AND     mdtrt.mdtrt_loc IS NOT NULL
;

-- 0318测试 第一个select跑通

--结算信息表
insert into table sc_dr_ytai_sjzq.STG_SD_YT_SETL_DIAG_LIST_D PARTITION(pt= '${bizdate}')
SELECT  '1' AS MAINDIAG_FLAG    --主诊断标志  地纬默认'1'--1
        ,setl.MDTRT_ID AS DIAG_INFO_ID  --2
        ,nvl((select mdtrt_id_nat from sc_dr_ytai_sjzq.stg_tp_mdtrt_d_v_ytai ts where ts.mdtrt_id = setl.mdtrt_id limit 1) ,setl.MDTRT_ID) AS MDTRT_ID--3
        --,setl.MDTRT_ID AS MDTRT_ID    --就诊ID(YLTCDJH)   就诊ID
        ,nvl(b.PSN_NO_GB,b.psn_no) AS PSN_NO    --人员编号(RYID)          人员编号--4
        ,'2' AS INOUT_DIAG_TYPE    --出入院诊断类别
        ,NULL AS DIAG_TYPE    --诊断类别
        
        ,NULL AS DIAG_SRT_NO    --诊断排序号        地纬默认'1'
        ,setl.dise_code AS DIAG_CODE    --诊断代码(JBBM) 诊断代码
        ,(
            SELECT dise_name FROM sc_dr_ytai_sjzq.stg_tb_dise_list_b_df_v_ytai dise  WHERE dise.DISE_CODE = setl.dise_code
        ) AS DIAG_NAME    --诊断名称
        ,NULL AS ADM_COND    -- 入院病情
        ,NULL AS DIAG_DEPT    --诊断科室
        ,NULL AS DIAG_DR_CODE    --医师代码(YSBH)   诊断医师代码
        ,NULL AS DIAG_DR_NAME    --姓名        诊断医师姓名
        ,nvl(setl.enddate, setl.begndate) AS DIAG_TIME    --诊断时间
        ,'1' AS VALI_FLAG    --有效标志
        ,setl.rid AS RID    --数据唯一记录号
        ,setl.UPDT_TIME AS UPDT_TIME    --数据更新时间
        ,NULL AS CRTER_ID    --创建人ID
        ,NULL AS CRTER_NAME    --创建人姓名
        ,setl.CRTE_TIME AS CRTE_TIME    --数据创建时间
        ,func_get_optins_sql(setl.crte_optins) AS CRTE_OPTINS_NO    --创建机构编号
        ,NULL AS OPTER_ID    --经办人ID
        ,NULL AS OPTER_NAME    --经办人姓名
        ,NULL AS OPT_TIME    --经办时间
        ,func_get_optins_sql(setl.poolarea)  AS OPTINS_NO    --经办机构编号
        ,func_get_optins_sql(setl.poolarea)  AS POOLAREA_NO    --统筹区编号
        ,NULL AS EVT_INST_ID    --事件实例ID
FROM    sc_dr_ytai_sjzq.stg_tp_setl_d_v_ytai setl
LEFT JOIN sc_dr_ytai_sjzq.stg_pi_psn_info_b_df_v_ytai b
ON      setl.psn_no = b.psn_no
WHERE   setl.insutype IN ('C', 'E')
AND     setl.pt='${bizdate}'
AND     b.certno IS NOT NULL
AND     setl.dise_code IS NOT NULL
AND     NOT EXISTS (SELECT 1 FROM sc_dr_ytai_sjzq.STG_SD_YT_SETL_DIAG_LIST_D mdtrt 
WHERE mdtrt.mdtrt_id = setl.mdtrt_id 
AND mdtrt.diag_code IS NOT NULL 
AND mdtrt.diag_code <> setl.dise_code)   
;
--结算清单表         
insert into table sc_dr_ytai_sjzq.STG_SD_YT_SETL_DIAG_LIST_D PARTITION(pt= '${bizdate}')
SELECT  '1' AS MAINDIAG_FLAG    --主诊断标志  地纬默认'1'
            ,setlList.MDTRT_ID AS DIAG_INFO_ID
            ,nvl((select mdtrt_id_nat from sc_dr_ytai_sjzq.stg_tp_mdtrt_d_v_ytai ts where ts.mdtrt_id = setlList.mdtrt_id limit 1) ,setlList.MDTRT_ID) AS MDTRT_ID
            ,nvl(b.PSN_NO_GB,b.psn_no) AS PSN_NO    --人员编号(RYID)          人员编号
            ,'2' AS INOUT_DIAG_TYPE    --出入院诊断类别
            ,NULL AS DIAG_TYPE    --诊断类别
            ,NULL AS DIAG_SRT_NO    --诊断排序号        地纬默认'1'
            ,setlList.diag_code AS DIAG_CODE    --诊断代码(JBBM) 诊断代码
            ,setlList.diag_name AS DIAG_NAME    --诊断名称
            ,NULL AS ADM_COND    -- 入院病情
            ,NULL AS DIAG_DEPT    --诊断科室
            ,NULL AS DIAG_DR_CODE    --医师代码(YSBH)   诊断医师代码
            ,NULL AS DIAG_DR_NAME    --姓名        诊断医师姓名
            ,setlList.CRTE_TIME AS DIAG_TIME    --诊断时间
            ,'1' AS VALI_FLAG    --有效标志
            ,setlList.rid AS RID    --数据唯一记录号
            ,setlList.UPDT_TIME AS UPDT_TIME    --数据更新时间
            ,NULL AS CRTER_ID    --创建人ID
            ,NULL AS CRTER_NAME    --创建人姓名
            ,setlList.CRTE_TIME AS CRTE_TIME    --数据创建时间
            ,NULL AS CRTE_OPTINS_NO    --创建机构编号
            ,NULL AS OPTER_ID    --经办人ID
            ,NULL AS OPTER_NAME    --经办人姓名
            ,NULL AS OPT_TIME    --经办时间
            ,func_get_optins_sql(setlList.admdvs) AS OPTINS_NO    --经办机构编号
            ,func_get_optins_sql(setlList.admdvs) AS POOLAREA_NO    --统筹区编号
            ,NULL AS EVT_INST_ID    --事件实例ID
FROM    sc_dr_ytai_sjzq.stg_setl_mdcs_fund_setl_list_diag_d_v_ytai setlList
LEFT JOIN sc_dr_ytai_sjzq.stg_pi_psn_info_b_df_v_ytai b
ON      setlList.psn_no = b.psn_no
WHERE   b.certno IS NOT NULL
AND     setlList.pt='${bizdate}'
AND     setlList.diag_code IS NOT NULL
AND     NOT EXISTS (SELECT 1 FROM sc_dr_ytai_sjzq.STG_SD_YT_SETL_DIAG_LIST_D mdtrt 
    WHERE mdtrt.mdtrt_id = setlList.mdtrt_id 
    AND mdtrt.diag_code IS NOT NULL 
    AND mdtrt.diag_code <> setlList.diag_code) 
;
