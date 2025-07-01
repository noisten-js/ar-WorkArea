:CONNECT testssis01
USE Edw_Integration_Framework
------------------------------------------------------------------------------------
-- Check Statuses
------------------------------------------------------------------------------------
SELECT TOP 3 datediff(ss, Execution_Start_Date, coalesce(Execution_End_Date, getdate()))/60.00/60.00, * FROM dbo.Etl_Process_Execution_Log WHERE Etl_Process_Name = 'Enertia Stage Source Data' ORDER BY Execution_Start_Date DESC
SELECT TOP 3 datediff(ss, Execution_Start_Date, coalesce(Execution_End_Date, getdate()))/60.00/60.00, * FROM dbo.Etl_Process_Execution_Log WHERE Etl_Process_Name = 'EnterpriseDW - Mdm Refresh WellHeader' ORDER BY Execution_Start_Date DESC
SELECT TOP 3 datediff(ss, Execution_Start_Date, coalesce(Execution_End_Date, getdate()))/60.00/60.00, * FROM dbo.Etl_Process_Execution_Log WHERE Etl_Process_Name = 'EnterpriseDW - Mart Refresh Midstream Operations' ORDER BY Execution_Start_Date DESC
SELECT TOP 3 datediff(ss, Execution_Start_Date, coalesce(Execution_End_Date, getdate()))/60.00/60.00, * FROM dbo.Etl_Process_Execution_Log WHERE Etl_Process_Name = 'EnterpriseDW - Enertia Notify New Billing Code' ORDER BY Execution_Start_Date DESC
SELECT TOP 3 datediff(ss, Execution_Start_Date, coalesce(Execution_End_Date, getdate()))/60.00/60.00, * FROM dbo.Etl_Process_Execution_Log WHERE Etl_Process_Name = 'Petra Stage Source Data' ORDER BY Execution_Start_Date DESC

------------------------------------------------------------------------------------
-- Well Header Dependencies
------------------------------------------------------------------------------------
SELECT TOP 3 datediff(ss, Execution_Start_Date, coalesce(Execution_End_Date, getdate()))/60.00/60.00, * FROM dbo.Etl_Process_Execution_Log WHERE Etl_Process_Name = 'Aries Stage Source Data' ORDER BY Execution_Start_Date DESC
SELECT TOP 3 datediff(ss, Execution_Start_Date, coalesce(Execution_End_Date, getdate()))/60.00/60.00, * FROM dbo.Etl_Process_Execution_Log WHERE Etl_Process_Name = 'Enertia Stage Source Data' ORDER BY Execution_Start_Date DESC
SELECT TOP 3 datediff(ss, Execution_Start_Date, coalesce(Execution_End_Date, getdate()))/60.00/60.00, * FROM dbo.Etl_Process_Execution_Log WHERE Etl_Process_Name = 'Merrick Stage Source Data' ORDER BY Execution_Start_Date DESC
SELECT TOP 3 datediff(ss, Execution_Start_Date, coalesce(Execution_End_Date, getdate()))/60.00/60.00, * FROM dbo.Etl_Process_Execution_Log WHERE Etl_Process_Name = 'SigmaFlow Stage Source Data' ORDER BY Execution_Start_Date DESC
SELECT TOP 3 datediff(ss, Execution_Start_Date, coalesce(Execution_End_Date, getdate()))/60.00/60.00, * FROM dbo.Etl_Process_Execution_Log WHERE Etl_Process_Name = 'Wellview 10 Stage Source Data' ORDER BY Execution_Start_Date DESC

------------------------------------------------------------------------------------
-- Manually Launch a task
------------------------------------------------------------------------------------
EXEC msdb.dbo.sp_start_job @job_name = 'ETL - EDW - Queue for Execution - Enertia Stage Source Data'
WAITFOR DELAY '00:00:18'
EXEC msdb.dbo.sp_start_job @job_name = 'ETL - EDW - Run ETL Process - Enertia Stage Source Data'
