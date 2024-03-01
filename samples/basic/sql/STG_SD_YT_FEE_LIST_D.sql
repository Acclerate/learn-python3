
    SELECT  setl.INSU_PSN_ID AS PSN_INSU_RLTS_ID--1
            ,fee.FEE_OCUR_TIME AS FEE_OCUR_TIME--2
            ,nvl(mdtrt.mdtrt_id_nat, mdtrt.mdtrt_id) AS MDTRT_ID--3
            ,nvl( setl.setl_id_nat, fee.setl_id) AS SETL_ID--4
            ,fee.BKKP_SN AS BKKP_SN--5
            ,CONCAT(fee.DRORD_NO,fee.RXNO) AS RX_DRORD_NO--6
            ,setl.FIXMEDINS_CODE AS FIXMEDINS_CODE--7
            ,nvl(
                (
                    SELECT max( FIXMEDINS_name) FROM pub_ytai_data.stg_pol_fixmedins_b_df_v_ytai fixmedins WHERE fixmedins.fixmedins_code = setl.FIXMEDINS_CODE
                )
                ,(
                    SELECT max( FIXMEDINS_name) FROM pub_ytai_data.stg_tb_local_fixmedins_b_df_v_ytai fixmedins WHERE fixmedins.fixmedins_code = setl.FIXMEDINS_CODE
                )
            ) AS FIXMEDINS_NAME--8
            ,nvl((
	            SELECT psn_no_gb FROM pub_ytai_data.stg_pi_psn_info_b_df_v_ytai info WHERE info .psn_no = fee.PSN_NO
	        ),fee.PSN_NO
		) PSN_NO--9

            ,func_get_optins_sql(setl.CLCT_POOLAREA) AS INSU_ADMDVS--10
            ,setl.PAY_LOC AS PAY_LOC--11
	        ,fn_conv_med_type(setl.med_type,setl.med_pool_type) MED_TYPE
            ,NVL(fee.CNT, 0) AS CNT--13
            ,NVL(fee.PRIC, 0) AS PRIC--14
            ,NVL(fee.DET_ITEM_FEE_SUMAMT, 0) AS DET_ITEM_FEE_SUMAMT--15
            ,NVL(fee.PRC_UPLMT_AMT, 0) AS PRIC_UPLMT_AMT -- 16
            ,NVL(fee.SELFPAY_PROP, 0) AS SELFPAY_PROP--17
            ,NVL(fee.OWNPAY_AMT, 0) AS fulamt_ownpay_amt--18
            ,nvl(fee.ownpay_amt, 0) - nvl(fee.overlmt_amt, 0) + nvl(fee.medins_disc_amt, 0) AS overlmt_selfpay--19
            ,NVL(fee.PRESELFPAY_AMT, 0) AS PRESELFPAY_AMT--20
            ,(NVL(fee.poolpay_amt, 0) + NVL(fee.partpoolpay_amt, 0)) AS INSCP_AMT--21
            ,'0' AS CVLSERV_BEDFEE_AMT--22
            ,nvl(fee.medins_disc_amt, 0) AS MEDINS_DISC_AMT--23
            ,decode(
                nvl(
                    (
                        SELECT max(hi.chrgitm_lv) FROM pub_ytai_data.stg_pol_hilist_b_df_v_ytai hi WHERE hi.hilist_code = fee.hilist_code
                    )
                    ,(
                        SELECT max(hi.chrgitm_lv) FROM pub_ytai_data.stg_tb_local_hilist_b_df_v_ytai hi WHERE hi.hilist_code = fee.hilist_code
                    )
                )
                ,'01'
                ,'01'
                ,'1'
                ,'01'
                ,'甲'
                ,'01'
                ,'02'
                ,'02'
                ,'2'
                ,'02'
                ,'乙'
                ,'02'
                ,'03'
                ,'03'
                ,'3'
                ,'03'
                ,''
            ) AS chrgitm_lv--24
            ,nvl(
                (
                    SELECT max(hi.nat_servitem_code) FROM pub_ytai_data.stg_tb_std_trt_serv_b_df_v_ytai hi WHERE hi.place_servitem_code = fee.hilist_code
                )
                ,fee.HILIST_CODE
            ) AS HILIST_CODE--25
            ,NVL(
                (
                    SELECT max(hi.HILIST_NAME) FROM pub_ytai_data.stg_pol_hilist_b_df_v_ytai hi WHERE hi.hilist_code = fee.hilist_code
                )
                ,nvl(fee.prodname, '空')
            ) AS HILIST_NAME--26
            ,NVL(
                (
                    SELECT max(hi.LIST_TYPE) FROM pub_ytai_data.stg_pol_hilist_b_df_v_ytai hi WHERE hi.hilist_code = fee.hilist_code
                )
                ,'空'
            ) AS LIST_TYPE--27
            ,fee.HILIST_CODE AS MED_LIST_CODG--28
            ,fee.MEDINS_LIST_CODG AS MEDINS_LIST_CODG--29
            ,substr(fee.medins_list_name, 1, 100) AS MEDINS_LIST_NAME--30
            ,NVL(
                (
                    SELECT max(hi.MED_CHRGITM_TYPE) FROM pub_ytai_data.stg_pol_hilist_b_df_v_ytai hi WHERE hi.hilist_code = fee.hilist_code
                )
                ,(
                    SELECT max(hi.MED_CHRGITM_TYPE) FROM pub_ytai_data.stg_tb_local_hilist_b_df_v_ytai hi WHERE hi.hilist_code = fee.hilist_code
                )
            ) AS MED_CHRGITM_TYPE--31
            ,nvl(fee.PRODNAME, '') AS PRODNAME--32
            ,substr(nvl(h.reg_spec, nvl(j.spec,'')),1,200) AS SPEC--33
            ,fee.DOSFORM_NAME AS DOSFORM_NAME--34
            ,fee.BILG_DEPT_CODG AS BILG_DEPT_CODG--35
            ,fee.BILG_DEPT_NAME AS BILG_DEPT_NAME--36
            ,fee.BILG_DR_CODE AS BILG_DR_CODE--37
            ,fee.BILG_DR_NAME AS BILG_DR_NAME--38
            ,fee.ACORD_DEPT_CODG AS ACORD_DEPT_CODG--39
            ,fee.ACORD_DEPT_NAME AS ACORD_DEPT_NAME--40
            ,fee.ACORD_DR_CODE AS ACORD_DR_CODE--41
            ,fee.ACORD_DR_NAME AS ACORD_DR_NAME--42
            ,fee.LMT_USED_FLAG AS LMT_USED_FLAG--43
            ,NULL AS HOSP_PREP_FLAG--44
            ,NULL AS HOSP_APPR_FLAG--45
            ,NULL AS TCMDRUG_USED_WAY--46
            ,NULL AS PRODPLAC_TYPE--47
            ,NULL AS BAS_MEDN_FLAG--48
            ,NULL AS HI_NEGO_DRUG_FLAG--49
            ,NULL AS PRCU_DRUG_FLAG--50
            ,NULL AS CHLD_MEDC_FLAG--51
            ,NULL AS ETIP_FLAG--52
            ,NULL AS ETIP_HOSP_CODE--53
            ,NULL AS DSCG_TKDRUG_FLAG--54
            ,'0' AS LIST_SP_ITEM_FLAG--55
            ,NULL AS MATN_FEE_FLAG--56
            ,NULL AS DRT_REIM_FLAG--57
            ,nvl(fee.SELFPAY_PROP, 0) AS reim_prop--58 自付比例和报销比例
            ,NULL AS OPRN_OPRT_CODE --59
            ,fee.EACH_DOS AS SIN_DOS_DSCR --60
            ,fee.USED_FRQU AS used_frqu_dscr --61
            ,fee.USED_DAYS AS PRD_DAYS --62
            ,NULL AS MEDC_WAY_DSCR  --63
            ,NULL AS MEMO--64
            ,'1' AS VALI_FLAG--65
            ,fee.RID AS RID--66
            ,fee.UPDT_TIME AS UPDT_TIME--67
            ,fee.CRTER AS CRTER_ID--68
            ,fee.CRTER AS CRTER_NAME--69
            ,fee.CRTE_TIME AS CRTE_TIME--70
            ,func_get_optins_sql(fee.CRTE_OPTINS) AS crte_optins_no--71
            ,fee.OPTER AS OPTER_ID--72
            ,fee.OPTER AS OPTER_NAME--73
            ,fee.OPT_TIME AS OPT_TIME--74
            ,func_get_optins_sql(fee.OPTINS) AS OPTINS_NO--75
            ,func_get_optins_sql(fee.POOLAREA) AS POOLAREA_NO--76
            ,'0' AS RX_CIRC_FLAG--77
            ,setl.DISE_CODE AS dise_codg--78
            ,NULL AS CHRG_BCHNO--79
            ,NULL AS INIT_FEEDETL_SN--80
            ,NULL AS COMB_NO--81
    FROM    pub_ytai_data.stg_tp_fee_list_d_di_v_ytai fee  INNER
    JOIN    pub_ytai_data.stg_tp_setl_d_di_v_ytai setl
    ON      fee.setl_id = setl.setl_id
    AND     fee.pt_day='${bizdate}'
    AND     setl.pay_loc IN ('1', '2', '3', '4', '5')
    LEFT JOIN pub_ytai_data.stg_tp_mdtrt_d_di_v_ytai mdtrt
    ON      fee.mdtrt_id = mdtrt.mdtrt_id
    AND     mdtrt.insutype IN ('C', 'E')
    LEFT JOIN (
    select reg_spec
    ,med_list_codg
    from pub_ytai_data.stg_pol_wm_tcmpat_info_b_df_v_ytai
    where dw_city_code in ('370000','370600')
    ) h
    ON      fee.hilist_code = h.med_list_codg
    LEFT JOIN pub_ytai_data.stg_pol_mcs_info_b_df_v_ytai j
    ON      fee.hilist_code = j.med_list_codg and j.dw_city_code  IN ('370000','370600')
    ;
