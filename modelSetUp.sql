/* 	SQL Script for model build 
		bult by Mike Crowder
        Last Modified on: 4/6/2019
        */
CREATE TABLE pipelineModel
SELECT DISTINCT
	pa.Opp_Num,
    pa.Channel,
    pa.Region,
    CASE 
		WHEN 
			pa.Prod_Group = 'Car Accessories'
			THEN 1 
            ELSE 0
	END AS							'IsCarAccessories',
    CASE 
		WHEN 
			pa.Prod_Group = 'Performance & Non-auto'
			THEN 1 
            ELSE 0
	END AS							'IsPerfNonAuto',
    CASE 
		WHEN 
			pa.Prod_Group = 'Tires & Wheels'
			THEN 1 
            ELSE 0
	END AS							'IsTireWheels',
    CASE 
		WHEN 
			pa.Prod_Group = 'Car Electronics'
			THEN 1 
            ELSE 0
	END AS							'IsCarElectronics',
    CASE 
		WHEN 
			pa.Channel = 'Fields Sales'
			THEN 1 
            ELSE 0
	END AS							'IsFieldsSales',
    CASE 
		WHEN 
			pa.Channel = 'Reseller'
			THEN 1 
            ELSE 0
	END AS							'IsReseller',
    CASE 
		WHEN 
			pa.Channel = 'Telesales'
			THEN 1 
		WHEN
			pa.Channel = 'Telecoverage'
            THEN 1
            ELSE 0
	END AS							'IsInsideSalesTeam',
    CASE 
		WHEN 
			pa.Channel = 'Other'
			THEN 1 
            ELSE 0
	END AS							'IsOtherSeller',
    pa.Stage_Duration,
    pa.Stage_Changes,
    pa.Days_To_Close,
    pa.Days_To_Qual,
    pa.Opp_NetRev,
    pa.Deal_Size_Bin,
    pa.Client_Size_Bin,
    pa.Client_Emp_Size_Bin,
    pa.Two_Year_Spend,
    CASE
		WHEN
			pa.Competitor_Type = 'Known'
            THEN 1
            ELSE 0
	END AS						'IsCompKnown',
     CASE
		WHEN
			pa.Competitor_Type = 'Unknown'
            THEN 1
            ELSE 0
	END AS						'IsCompUnknown',
    pa.Ind_Days_Ratio,
    pa.Val_Days_Ratio,
    pa.Qual_Days_Ratio,
    pa.Result,
    CASE
		WHEN
			pa.Result = 'Won'
			THEN 1
			ELSE 0
	END AS						'IsWon'
    
FROM
	pipeline_analysis.pipelineanalytics as pa
;