SELECT * FROM Mart.Midstream_ETL_Load_Date

SELECT
  min(Transaction_Account_Date), max(Transaction_Account_Date), count(*)
FROM
	Mart.RPT_Enertia_Net_Transaction

USE EDW
SELECT count(*)
--  datepart(YEAR, Transaction_Account_Date), format(count(*), 'N0')
FROM
	Mart.RPT_Enertia_Net_Transaction
WHERE Cost_Type_BC_Computed IN ('WOE', 'LOE')
AND Transaction_Account_Date >= '2017-01-01'
AND Activity IN ('Upstream Operations')

GROUP BY datepart(YEAR, Transaction_Account_Date)
ORDER BY datepart(YEAR, Transaction_Account_Date)

sp_spaceused 'mart.rpt_enertia_net_transaction'

SELECT format(119943840/1024.00/1024.00, 'N0'), 119943840/35744022.00    
SELECT (22000000*(3.35*1024)/1024.00/1024.00/1024.00)*1.05

SELECT format(
3777767
+3848875
+5504105
+1129734, 'N0')