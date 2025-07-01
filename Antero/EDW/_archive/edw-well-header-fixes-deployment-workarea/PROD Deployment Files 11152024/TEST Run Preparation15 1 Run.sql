USE [EDW]
GO


EXEC ETL.Process_All;

----This runs after ETL.PROCESS ALL

TRUNCATE TABLE [Master].[Dim_Well_Header_Core_Update_Hub_Table];
INSERT    INTO [Master].[Dim_Well_Header_Core_Update_Hub_Table]
SELECT * FROM  [Master].[Dim_Well_Header_Core_Update_Hub];

EXEC [Master_Etl].[Process_Well_Header_Sync_Hub_Id];


