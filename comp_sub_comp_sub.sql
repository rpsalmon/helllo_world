CREATE VOLATILE TABLE COMP_HP AS (            
    SELECT DISTINCT HP.division, HP.region, HP.dma, HP.location_id            
    , CASE WHEN (sP.max_internet_speed_qty > 100 AND sP.service_provider_id = 1) THEN 'ATT FIBER'             
                WHEN ((sP.max_internet_speed_qty <= 100 OR sP.max_internet_speed_qty IS NULL) AND sP.service_provider_id = 1) THEN 'ATT NON-FIBER'            
                WHEN ( sP.service_provider_id = 17) THEN 'RCN'            
                WHEN ( sP.service_provider_id = 23) THEN 'TDS'            
                WHEN ( sP.service_provider_id = -1 OR sP.service_provider_id IS NULL) THEN 'NONE'            
                 ELSE sP.service_provider_name END AS COMP            
                , hp.ethnic_roll_up, hp.city, hp.demo_income_code, HP.dwell_type_group AS dwell_hp            
                ,SP.max_internet_speed_qty    --, SP.record_start_ts, SP.record_end_ts, SP.address_check_date            
                ,CASE WHEN EBI.PRO_CHURN_NPD_DECILE_REG = 1 THEN 'BAD DEBT' ELSE 'OK' END AS BAD_DEBT
                FROM ndw_rosetta_views.rosetta_homes_passed_current AS HP            
                LEFT JOIN             
                (SELECT SP.LOCATION_ID, SP.service_provider_id, SR.service_provider_name,            
                SP.max_internet_speed_qty--, SP.record_start_ts, SP.record_end_ts, SP.address_check_date            
                FROM            
                ndw_base_views.service_provider_location_hist AS SP            
                                    LEFT JOIN ndw_base_views.service_provider_ref AS SR            
                    ON SP.service_provider_id = SR.service_provider_id            
                 WHERE SP.service_provider_id IN (1,2,4,9,10,11,16,17,23,27,28,129)            
                 AND YEAR(SP.address_check_date) > 2017            
                ) AS SP            
                ON HP.location_id = SP.location_id            
                        
                                LEFT JOIN NDW_EBI_MODEL_VIEWS.MASTER_EBI_PROSPECT_MODELS AS EBI
        ON (hp.HOUSE_ID = EBI.HOUSEKEY)                                 
                                
                WHERE (            
                HP.HSD_SERVICABILITY_IND = 'Y'            
                OR HP.VIDEO_SERVICABILITY_IND = 'Y'            
                OR HP.VOICE_SERVICABILITY_IND = 'Y'            
                )            
                --AND EBI.PRO_CHURN_NPD_DECILE_REG <> 1
                AND HP.HSD_HOMES_PASSED_IND = 'y'            
                AND HP.hsd_homes_passed_cust_type_cd = 'RESI'            
                -- ATT 1, CTL 2, FTR 4, EPB 9, Google Fiber 10, Hotwire 11, Metronet 16, RCN 17, TDS 23, Windstream 27, WOW 28, WebPass 129            
                AND HP.dwell_type_group IN ('MDU','SFU')            
                AND HP.division = 'CENTRAL DIVISION'            
                        GROUP BY 1,2,3,8,5,6,7,9,10,4,11             
                --SAMPLE 500            
        )            
WITH DATA PRIMARY INDEX (location_id)            
    ON COMMIT PRESERVE ROWS;            
                
                
    CREATE VOLATILE TABLE COMP_SUB AS (            
    SELECT DISTINCT SB.division, SB.region, SB.dma, SB.location_id            
    , CASE WHEN (sP.max_internet_speed_qty > 100 AND sP.service_provider_id = 1) THEN 'ATT FIBER'             
                WHEN ((sP.max_internet_speed_qty <= 100 OR sP.max_internet_speed_qty IS NULL) AND sP.service_provider_id = 1) THEN 'ATT NON-FIBER'            
                WHEN ( sP.service_provider_id = 17) THEN 'RCN'            
                WHEN ( sP.service_provider_id = 23) THEN 'TDS'            
                WHEN ( sP.service_provider_id = -1 OR sP.service_provider_id IS NULL) THEN 'NONE'            
                 ELSE sP.service_provider_name END AS COMP            
                , SB.ETHNICITY_ROLL_UP, SB.city, SB.income_code, SB.dwell_type_group AS dwell_sb            
                ,SP.max_internet_speed_qty    --, SP.record_start_ts, SP.record_end_ts, SP.address_check_date        
                ,CASE WHEN SUB_CHURN_NPD_DECILE_REG = 1 THEN 'BAD DEBT' ELSE 'OK' END AS BAD_DEBT
                FROM ndw_rosetta_views.ROSETTA_202010 AS SB            
                LEFT JOIN             
                (SELECT SP.LOCATION_ID, SP.service_provider_id, SR.service_provider_name,            
                SP.max_internet_speed_qty--, SP.record_start_ts, SP.record_end_ts, SP.address_check_date            
                FROM            
                ndw_base_views.service_provider_location_hist SP            
                                    LEFT JOIN ndw_base_views.service_provider_ref SR            
                    ON SP.service_provider_id = SR.service_provider_id            
                 WHERE SP.service_provider_id IN (1,2,4,9,10,11,16,17,23,27,28,129)            
                 AND YEAR(SP.address_check_date) > 2017            
                ) AS SP            
                ON SB.location_id = SP.location_id            
                                
                WHERE SB.account_status = 'ACT'             
                AND SB.customer_type = 'RESIDENTIAL'            
                -- ATT 1, CTL 2, FTR 4, EPB 9, Google Fiber 10, Hotwire 11, Metronet 16, RCN 17, TDS 23, Windstream 27, WOW 28, WebPass 129        
                --AND SUB_CHURN_NPD_DECILE_REG <> 1
                AND SB.dwell_type_group IN ('MDU','SFU')            
                AND SB.division = 'CENTRAL DIVISION'            
                        GROUP BY 1,2,3,8,5,6,7,9,10,4,11             
                --SAMPLE 500            
        )            
WITH DATA PRIMARY INDEX (location_id)            
    ON COMMIT PRESERVE ROWS;            


DROP TABLE COMP_SUB