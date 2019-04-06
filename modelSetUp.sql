/* 	SQL Script for model build 
		bult by Mike Crowder
        Last Modified on: 4/6/2019
        Still a work in progress*/

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
	END AS							'IsOtherSeller'
    
FROM
	pipeline_analysis.pipelineanalytics as pa
;