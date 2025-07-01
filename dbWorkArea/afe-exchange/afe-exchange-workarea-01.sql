SELECT
	*
FROM
	EnertiaExtension.afe_exchange.vAfeBudget
WHERE 1=1 AND AFE_Number = 'A13403'

SELECT * FROM EnertiaLive.dbo.aeTblAfeCat WHERE AfeCatCode IN ('LWE140', 'ICC201') ORDER BY AfeCatCode

-- 200 Exclude
-- 202 Exclude
-- 203 Exclude
-- LWE140 Override

SELECT * FROM EnertiaExtension.afe_exchange.vAfeBudgetSummary WHERE Budget_Amount > 0 OR Budget_Amount_Supplement > 0 
--AFE_Cat_Code IN ('LWE140', 'ICC201')
SELECT * FROM EnertiaExtension.afe_exchange.vAfeBudget WHERE AfeCatCode IN ('LWE140', 'ICC201')


USE EDW_Stage

:CONNECT dendw02
SELECT * FROM EDW_Stage.Stage_Manual.Enertia_to_Wellview_Billing_Code_Mapping 
WHERE Original IN ('ICC200', 'ICC203', 'LWE140')

SELECT * FROM EDW.Mart.Seven_Lakes_AFE_Budget WHERE AFE_Number = 'A13403'