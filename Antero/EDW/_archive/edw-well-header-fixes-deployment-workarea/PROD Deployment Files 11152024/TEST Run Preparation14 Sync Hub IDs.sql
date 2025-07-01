USE [EDW]
GO

----This runs after ETL.PROCESS ALL

---TRUNCATE TABLE [Master].[Dim_Well_Header_Core_Update_Hub_Table];
---INSERT    INTO [Master].[Dim_Well_Header_Core_Update_Hub_Table]
---SELECT * FROM  [Master].[Dim_Well_Header_Core_Update_Hub];

USE [EDW]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE [Master_Etl].[Process_Well_Header_Sync_Hub_Id]
AS
BEGIN

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
---Update not needed for core
---UPDATE Core 
---SET [Core].Hub_Well_Header_ID = [Resolve Duplicates].[Hub_Well_Header_ID_C] 
---SELECT
---'Core' AS [Type],
---[Core].Well_Name_Antero_Standard,
---[Core].Sat_Well_Header_ID,
---[Core].Hub_Well_Header_ID,
---[Resolve Duplicates].[Hub_Well_Header_ID_C]       AS [Hub_Well_Header_ID_C_Resolve], 
---[Resolve Duplicates].Well_Name_Antero_Standard	   AS Well_Name_Antero_Standard_Resolve,
---[Resolve Duplicates].[Sources]              	     AS [Sources_Resolve],              
---[Resolve Duplicates].[Sources Rank]         	     AS [Sources Rank Resolve],         
---[Resolve Duplicates].[Sources Length]       	     AS [Sources Length Resolve],       
---[Resolve Duplicates].[Type]                	     AS [Type_Resolve],                
---[Resolve Duplicates].[Well_Header_UID]      	     AS [Well_Header_UID_Resolve],      
---[Resolve Duplicates].SEQNUM                 	     AS SEQNUM_Resolve,                 
---[Resolve Duplicates].API_Number                   AS API_Number_Resolve,             
---[Resolve Duplicates].Cost_Center		               AS Cost_Center_Resolve
------SELECT *
---FROM
---[Master].[Sat_Well_Header] [Core]
---INNER JOIN
---[Master].[Dim_Well_Header_Core_Update_Hub_Table] [Resolve Duplicates]
---10,781 YES(3)
---ON [Core].[Well_Name_Antero_Standard]=[Resolve Duplicates].[Well_Name_Antero_Standard]
---10,427 YES(1)
---AND [Core].Hub_Well_Header_ID = [Resolve Duplicates].[Hub_Well_Header_ID_C]
------WHERE [Core].Well_Name_Antero_Standard = 'DANIELS UNIT 3H' OR [Resolve Duplicates].Well_Name_Antero_Standard = 'DANIELS UNIT 3H'
------------------------------------------------------------------------------------------------------------
---Delete needed for Core
---354 deleted
DELETE FROM Core 
---SELECT
---'Core' AS [Type],
---[Core].Well_Name_Antero_Standard,
---[Core].Sat_Well_Header_ID,
---[Core].Hub_Well_Header_ID,
---[Resolve Duplicates].[Hub_Well_Header_ID_C]       AS [Hub_Well_Header_ID_C_Resolve], 
---[Resolve Duplicates].Well_Name_Antero_Standard	   AS Well_Name_Antero_Standard_Resolve,
---[Resolve Duplicates].[Sources]                    AS [Sources_Resolve],              
---[Resolve Duplicates].[Sources Rank]           	   AS [Sources Rank Resolve],         
---[Resolve Duplicates].[Sources Length]         	   AS [Sources Length Resolve],       
---[Resolve Duplicates].[Type]                	     AS [Type_Resolve],                
---[Resolve Duplicates].[Well_Header_UID]        	   AS [Well_Header_UID_Resolve],      
---[Resolve Duplicates].SEQNUM                   	   AS SEQNUM_Resolve,                 
---[Resolve Duplicates].API_Number               	   AS API_Number_Resolve,             
---[Resolve Duplicates].Cost_Center			             AS Cost_Center_Resolve
------SELECT *
FROM
[Master].[Sat_Well_Header] [Core]
INNER JOIN
[Master].[Dim_Well_Header_Core_Update_Hub_Table] [Resolve Duplicates]
---10,781 YES(3)
ON [Core].[Well_Name_Antero_Standard]=[Resolve Duplicates].[Well_Name_Antero_Standard]
---10,427 YES(2)
AND [Core].Hub_Well_Header_ID != [Resolve Duplicates].[Hub_Well_Header_ID_C]
---WHERE [Core].Well_Name_Antero_Standard = 'DANIELS UNIT 3H' OR [Resolve Duplicates].Well_Name_Antero_Standard = 'DANIELS UNIT 3H'

------------------------------------------------------------------------------------------------------------
---UNION ALL
------------------------------------------------------------------------------------------------------------
---Update needed for Aries
---3 updated
UPDATE Core SET [Core].Hub_Well_Header_ID = [Resolve Duplicates].[Hub_Well_Header_ID_C] 
---SELECT
---'Aries' AS [Type],
---[Core].Well_Name_Antero_Standard,
---[Core].Sat_Well_Header_Aries_ID,
---[Core].Hub_Well_Header_ID,
---[Resolve Duplicates].[Hub_Well_Header_ID_C]       AS [Hub_Well_Header_ID_C_Resolve], 
---[Resolve Duplicates].Well_Name_Antero_Standard	   AS Well_Name_Antero_Standard_Resolve,
---[Resolve Duplicates].[Sources]              	     AS [Sources_Resolve],              
---[Resolve Duplicates].[Sources Rank]         	     AS [Sources Rank Resolve],         
---[Resolve Duplicates].[Sources Length]         	   AS [Sources Length Resolve],       
---[Resolve Duplicates].[Type]                	     AS [Type_Resolve],                
---[Resolve Duplicates].[Well_Header_UID]        	   AS [Well_Header_UID_Resolve],      
---[Resolve Duplicates].SEQNUM                       AS SEQNUM_Resolve,                 
---[Resolve Duplicates].API_Number               	   AS API_Number_Resolve,             
---[Resolve Duplicates].Cost_Center				           AS Cost_Center_Resolve
------SELECT *
FROM
[Master].[Sat_Well_Header_Aries] [Core]
INNER JOIN
[Master].[Dim_Well_Header_Core_Update_Hub_Table] [Resolve Duplicates]
---10,781 YES(3)
ON [Core].[Well_Name_Antero_Standard]=[Resolve Duplicates].[Well_Name_Antero_Standard]
---10,427 YES(1)
AND [Core].Hub_Well_Header_ID != [Resolve Duplicates].[Hub_Well_Header_ID_C]
---WHERE [Core].Well_Name_Antero_Standard = 'DANIELS UNIT 3H' OR [Resolve Duplicates].Well_Name_Antero_Standard = 'DANIELS UNIT 3H'
------------------------------------------------------------------------------------------------------------
---Delete not needed for Aries
---DELETE FROM Core  
---SELECT
---'Aries' AS [Type],
---[Core].Well_Name_Antero_Standard,
---[Core].Sat_Well_Header_Aries_ID,
---[Core].Hub_Well_Header_ID,
---[Resolve Duplicates].[Hub_Well_Header_ID_C]      AS [Hub_Well_Header_ID_C_Resolve], 
---[Resolve Duplicates].Well_Name_Antero_Standard	  AS Well_Name_Antero_Standard_Resolve,
---[Resolve Duplicates].[Sources]              	    AS [Sources_Resolve],              
---[Resolve Duplicates].[Sources Rank]           	  AS [Sources Rank Resolve],         
---[Resolve Duplicates].[Sources Length]         	  AS [Sources Length Resolve],       
---[Resolve Duplicates].[Type]                	    AS [Type_Resolve],                
---[Resolve Duplicates].[Well_Header_UID]        	  AS [Well_Header_UID_Resolve],      
---[Resolve Duplicates].SEQNUM                   	  AS SEQNUM_Resolve,                 
---[Resolve Duplicates].API_Number               	  AS API_Number_Resolve,             
---[Resolve Duplicates].Cost_Center				          AS Cost_Center_Resolve
---SELECT *
---FROM
---[Master].[Sat_Well_Header_Aries] [Core]
---INNER JOIN
---[Master].[Dim_Well_Header_Core_Update_Hub_Table] [Resolve Duplicates]
---10,781 YES(3)
---ON [Core].[Well_Name_Antero_Standard]=[Resolve Duplicates].[Well_Name_Antero_Standard]
---10,427 YES(2)
---AND [Core].Hub_Well_Header_ID != [Resolve Duplicates].[Hub_Well_Header_ID_C]
------WHERE [Core].Well_Name_Antero_Standard = 'DANIELS UNIT 3H' OR [Resolve Duplicates].Well_Name_Antero_Standard = 'DANIELS UNIT 3H'

------------------------------------------------------------------------------------------------------------
---UNION ALL
------------------------------------------------------------------------------------------------------------
---Update needed for Wellivew
---5 updated
UPDATE Core SET [Core].Hub_Well_Header_ID = [Resolve Duplicates].[Hub_Well_Header_ID_C] 
---SELECT
---'Wellview' AS [Type],
---[Core].Well_Name_Antero_Standard,
---[Core].Sat_Well_Header_Wellview_ID,
---[Core].Hub_Well_Header_ID,
---[Resolve Duplicates].[Hub_Well_Header_ID_C]       AS [Hub_Well_Header_ID_C_Resolve], 
---[Resolve Duplicates].Well_Name_Antero_Standard	   AS Well_Name_Antero_Standard_Resolve,
---[Resolve Duplicates].[Sources]              	     AS [Sources_Resolve],              
---[Resolve Duplicates].[Sources Rank]         	     AS [Sources Rank Resolve],         
---[Resolve Duplicates].[Sources Length]         	   AS [Sources Length Resolve],       
---[Resolve Duplicates].[Type]                	     AS [Type_Resolve],                
---[Resolve Duplicates].[Well_Header_UID]        	   AS [Well_Header_UID_Resolve],      
---[Resolve Duplicates].SEQNUM                       AS SEQNUM_Resolve,                 
---[Resolve Duplicates].API_Number               	   AS API_Number_Resolve,             
---[Resolve Duplicates].Cost_Center				           AS Cost_Center_Resolve
------SELECT *
FROM
[Master].[Sat_Well_Header_Wellview] [Core]
INNER JOIN
[Master].[Dim_Well_Header_Core_Update_Hub_Table] [Resolve Duplicates]
---10,781 YES(3)
ON [Core].[Well_Name_Antero_Standard]=[Resolve Duplicates].[Well_Name_Antero_Standard]
---10,427 YES(1)
AND [Core].Hub_Well_Header_ID != [Resolve Duplicates].[Hub_Well_Header_ID_C]
---WHERE [Core].Well_Name_Antero_Standard = 'DANIELS UNIT 3H' OR [Resolve Duplicates].Well_Name_Antero_Standard = 'DANIELS UNIT 3H'
------------------------------------------------------------------------------------------------------------
---Delete not needed for Wellivew
---DELETE FROM Core  
---SELECT
---'Wellview' AS [Type],
---[Core].Well_Name_Antero_Standard,
---[Core].Sat_Well_Header_Wellview_ID,
---[Core].Hub_Well_Header_ID,
---[Resolve Duplicates].[Hub_Well_Header_ID_C]        AS [Hub_Well_Header_ID_C_Resolve], 
---[Resolve Duplicates].Well_Name_Antero_Standard	    AS Well_Name_Antero_Standard_Resolve,
---[Resolve Duplicates].[Sources]              	      AS [Sources_Resolve],              
---[Resolve Duplicates].[Sources Rank]           	    AS [Sources Rank Resolve],         
---[Resolve Duplicates].[Sources Length]           	  AS [Sources Length Resolve],       
---[Resolve Duplicates].[Type]                	      AS [Type_Resolve],                
---[Resolve Duplicates].[Well_Header_UID]        	    AS [Well_Header_UID_Resolve],      
---[Resolve Duplicates].SEQNUM                   	    AS SEQNUM_Resolve,                 
---[Resolve Duplicates].API_Number               	    AS API_Number_Resolve,             
---[Resolve Duplicates].Cost_Center				            AS Cost_Center_Resolve
------SELECT *
---FROM
---[Master].[Sat_Well_Header_Wellview] [Core]
---INNER JOIN
---[Master].[Dim_Well_Header_Core_Update_Hub_Table] [Resolve Duplicates]
---10,781 YES(3)
---ON [Core].[Well_Name_Antero_Standard]=[Resolve Duplicates].[Well_Name_Antero_Standard]
---10,427 YES(2)
---AND [Core].Hub_Well_Header_ID != [Resolve Duplicates].[Hub_Well_Header_ID_C]
------WHERE [Core].Well_Name_Antero_Standard = 'DANIELS UNIT 3H' OR [Resolve Duplicates].Well_Name_Antero_Standard = 'DANIELS UNIT 3H'

------------------------------------------------------------------------------------------------------------
---UNION ALL
------------------------------------------------------------------------------------------------------------
---Update needed for Merrick
---2 updated
UPDATE Core SET [Core].Hub_Well_Header_ID = [Resolve Duplicates].[Hub_Well_Header_ID_C] 
---SELECT
---'Merrick' AS [Type],
---[Core].Well_Name_Antero_Standard,
---[Core].Sat_Well_Header_Merrick_ID,
---[Core].Hub_Well_Header_ID,
---[Resolve Duplicates].[Hub_Well_Header_ID_C]      AS [Hub_Well_Header_ID_C_Resolve], 
---[Resolve Duplicates].Well_Name_Antero_Standard	  AS Well_Name_Antero_Standard_Resolve,
---[Resolve Duplicates].[Sources]              	    AS [Sources_Resolve],              
---[Resolve Duplicates].[Sources Rank]              AS [Sources Rank Resolve],         
---[Resolve Duplicates].[Sources Length]         	  AS [Sources Length Resolve],       
---[Resolve Duplicates].[Type]                	    AS [Type_Resolve],                
---[Resolve Duplicates].[Well_Header_UID]        	  AS [Well_Header_UID_Resolve],      
---[Resolve Duplicates].SEQNUM                   	  AS SEQNUM_Resolve,                 
---[Resolve Duplicates].API_Number               	  AS API_Number_Resolve,             
---[Resolve Duplicates].Cost_Center			         	  AS Cost_Center_Resolve
------SELECT *
FROM
[Master].[Sat_Well_Header_Merrick] [Core]
INNER JOIN
[Master].[Dim_Well_Header_Core_Update_Hub_Table] [Resolve Duplicates]
---10,781 YES(3)
ON [Core].[Well_Name_Antero_Standard]=[Resolve Duplicates].[Well_Name_Antero_Standard]
---10,427 YES(1)
AND [Core].Hub_Well_Header_ID != [Resolve Duplicates].[Hub_Well_Header_ID_C]
---WHERE [Core].Well_Name_Antero_Standard = 'DANIELS UNIT 3H' OR [Resolve Duplicates].Well_Name_Antero_Standard = 'DANIELS UNIT 3H'
------------------------------------------------------------------------------------------------------------
---Delete not needed for Merrick
---DELETE FROM Core  
---SELECT
---'Merrick' AS [Type],
---[Core].Well_Name_Antero_Standard,
---[Core].Sat_Well_Header_Merrick_ID,
---[Core].Hub_Well_Header_ID,
---[Resolve Duplicates].[Hub_Well_Header_ID_C]      AS [Hub_Well_Header_ID_C_Resolve], 
---[Resolve Duplicates].Well_Name_Antero_Standard	  AS Well_Name_Antero_Standard_Resolve,
---[Resolve Duplicates].[Sources]              	    AS [Sources_Resolve],              
---[Resolve Duplicates].[Sources Rank]           	  AS [Sources Rank Resolve],         
---[Resolve Duplicates].[Sources Length]         	  AS [Sources Length Resolve],       
---[Resolve Duplicates].[Type]                	    AS [Type_Resolve],                
---[Resolve Duplicates].[Well_Header_UID]        	  AS [Well_Header_UID_Resolve],      
---[Resolve Duplicates].SEQNUM                   	  AS SEQNUM_Resolve,                 
---[Resolve Duplicates].API_Number               	  AS API_Number_Resolve,             
---[Resolve Duplicates].Cost_Center				          AS Cost_Center_Resolve
---SELECT *
---FROM
---[Master].[Sat_Well_Header_Merrick] [Core]
---INNER JOIN
---[Master].[Dim_Well_Header_Core_Update_Hub_Table] [Resolve Duplicates]
---10,781 YES(3)
---ON [Core].[Well_Name_Antero_Standard]=[Resolve Duplicates].[Well_Name_Antero_Standard]
---10,427 YES(2)
---AND [Core].Hub_Well_Header_ID != [Resolve Duplicates].[Hub_Well_Header_ID_C]
------WHERE [Core].Well_Name_Antero_Standard = 'DANIELS UNIT 3H' OR [Resolve Duplicates].Well_Name_Antero_Standard = 'DANIELS UNIT 3H'

------------------------------------------------------------------------------------------------------------
---UNION ALL
------------------------------------------------------------------------------------------------------------
---Update needed for Petra
---141 updated
UPDATE Core SET [Core].Hub_Well_Header_ID = [Resolve Duplicates].[Hub_Well_Header_ID_C] 
---SELECT
---'Petra' AS [Type],
---[Core].Well_Name_Antero_Standard,
---[Core].Sat_Well_Header_Petra_ID,
---[Core].Hub_Well_Header_ID,
---[Resolve Duplicates].[Hub_Well_Header_ID_C]       AS [Hub_Well_Header_ID_C_Resolve], 
---[Resolve Duplicates].Well_Name_Antero_Standard	   AS Well_Name_Antero_Standard_Resolve,
---[Resolve Duplicates].[Sources]              	     AS [Sources_Resolve],              
---[Resolve Duplicates].[Sources Rank]         	     AS [Sources Rank Resolve],         
---[Resolve Duplicates].[Sources Length]         	   AS [Sources Length Resolve],       
---[Resolve Duplicates].[Type]                	     AS [Type_Resolve],                
---[Resolve Duplicates].[Well_Header_UID]         	 AS [Well_Header_UID_Resolve],      
---[Resolve Duplicates].SEQNUM                    	 AS SEQNUM_Resolve,                 
---[Resolve Duplicates].API_Number               	   AS API_Number_Resolve,             
---[Resolve Duplicates].Cost_Center				           AS Cost_Center_Resolve
---SELECT *
FROM
[Master].[Sat_Well_Header_Petra] [Core]
INNER JOIN
[Master].[Dim_Well_Header_Core_Update_Hub_Table] [Resolve Duplicates]
---10,781 YES(3)
ON [Core].[Well_Name_Antero_Standard]=[Resolve Duplicates].[Well_Name_Antero_Standard]
---10,427 YES(1)
AND [Core].Hub_Well_Header_ID != [Resolve Duplicates].[Hub_Well_Header_ID_C]
---WHERE [Core].Well_Name_Antero_Standard = 'DANIELS UNIT 3H' OR [Resolve Duplicates].Well_Name_Antero_Standard = 'DANIELS UNIT 3H'
------------------------------------------------------------------------------------------------------------
---Delete not needed for Petra
---DELETE FROM Core  
---SELECT
---'Petra' AS [Type],
---[Core].Well_Name_Antero_Standard,
---[Core].Sat_Well_Header_Petra_ID,
---[Core].Hub_Well_Header_ID,
---[Resolve Duplicates].[Hub_Well_Header_ID_C]      AS [Hub_Well_Header_ID_C_Resolve], 
---[Resolve Duplicates].Well_Name_Antero_Standard	  AS Well_Name_Antero_Standard_Resolve,
---[Resolve Duplicates].[Sources]              	    AS [Sources_Resolve],              
---[Resolve Duplicates].[Sources Rank]           	  AS [Sources Rank Resolve],         
---[Resolve Duplicates].[Sources Length]         	  AS [Sources Length Resolve],       
---[Resolve Duplicates].[Type]                	    AS [Type_Resolve],                
---[Resolve Duplicates].[Well_Header_UID]        	  AS [Well_Header_UID_Resolve],      
---[Resolve Duplicates].SEQNUM                   	  AS SEQNUM_Resolve,                 
---[Resolve Duplicates].API_Number               	  AS API_Number_Resolve,             
---[Resolve Duplicates].Cost_Center				          AS Cost_Center_Resolve
---SELECT *
---FROM
---[Master].[Sat_Well_Header_Petra] [Core]
---INNER JOIN
---[EDW].[Master].[Dim_Well_Header_Core_Update_Hub_Table] [Resolve Duplicates]
---10,781 YES(3)
---ON [Core].[Well_Name_Antero_Standard]=[Resolve Duplicates].[Well_Name_Antero_Standard]
---10,427 YES(2)
---AND [Core].Hub_Well_Header_ID != [Resolve Duplicates].[Hub_Well_Header_ID_C]
------WHERE [Core].Well_Name_Antero_Standard = 'DANIELS UNIT 3H' OR [Resolve Duplicates].Well_Name_Antero_Standard = 'DANIELS UNIT 3H'

------------------------------------------------------------------------------------------------------------
---UNION ALL
------------------------------------------------------------------------------------------------------------
---Update needed for Enertia
---36 updated
UPDATE Core SET [Core].Hub_Well_Header_ID = [Resolve Duplicates].[Hub_Well_Header_ID_C] 
---SELECT
---'Enertia' AS [Type],
---[Core].Well_Name_Antero_Standard,
---[Core].Sat_Well_Header_Enertia_ID,
---[Core].Hub_Well_Header_ID,
---[Resolve Duplicates].[Hub_Well_Header_ID_C]       AS [Hub_Well_Header_ID_C_Resolve], 
---[Resolve Duplicates].Well_Name_Antero_Standard	   AS Well_Name_Antero_Standard_Resolve,
---[Resolve Duplicates].[Sources]              	     AS [Sources_Resolve],              
---[Resolve Duplicates].[Sources Rank]               AS [Sources Rank Resolve],         
---[Resolve Duplicates].[Sources Length]         	   AS [Sources Length Resolve],       
---[Resolve Duplicates].[Type]                	     AS [Type_Resolve],                
---[Resolve Duplicates].[Well_Header_UID]        	   AS [Well_Header_UID_Resolve],      
---[Resolve Duplicates].SEQNUM                    	 AS SEQNUM_Resolve,                 
---[Resolve Duplicates].API_Number               	   AS API_Number_Resolve,             
---[Resolve Duplicates].Cost_Center				           AS Cost_Center_Resolve
---SELECT *
FROM
[Master].[Sat_Well_Header_Enertia] [Core]
INNER JOIN
[Master].[Dim_Well_Header_Core_Update_Hub_Table] [Resolve Duplicates]
---10,781 YES(3)
ON [Core].[Well_Name_Antero_Standard]=[Resolve Duplicates].[Well_Name_Antero_Standard]
---10,427 YES(1)
AND [Core].Hub_Well_Header_ID != [Resolve Duplicates].[Hub_Well_Header_ID_C]
---WHERE [Core].Well_Name_Antero_Standard = 'DANIELS UNIT 3H' OR [Resolve Duplicates].Well_Name_Antero_Standard = 'DANIELS UNIT 3H'
------------------------------------------------------------------------------------------------------------
---Delete not needed for Enertia
---DELETE FROM Core  
---SELECT
---'Enertia' AS [Type],
---[Core].Well_Name_Antero_Standard,
---[Core].Sat_Well_Header_Enertia_ID,
---[Core].Hub_Well_Header_ID,
---[Resolve Duplicates].[Hub_Well_Header_ID_C]      AS [Hub_Well_Header_ID_C_Resolve], 
---[Resolve Duplicates].Well_Name_Antero_Standard	  AS Well_Name_Antero_Standard_Resolve,
---[Resolve Duplicates].[Sources]              	    AS [Sources_Resolve],              
---[Resolve Duplicates].[Sources Rank]           	  AS [Sources Rank Resolve],         
---[Resolve Duplicates].[Sources Length]         	  AS [Sources Length Resolve],       
---[Resolve Duplicates].[Type]                	    AS [Type_Resolve],                
---[Resolve Duplicates].[Well_Header_UID]        	  AS [Well_Header_UID_Resolve],      
---[Resolve Duplicates].SEQNUM                   	  AS SEQNUM_Resolve,                 
---[Resolve Duplicates].API_Number               	  AS API_Number_Resolve,             
---[Resolve Duplicates].Cost_Center				          AS Cost_Center_Resolve
---SELECT *
---FROM
---[Master].[Sat_Well_Header_Enertia] [Core]
---INNER JOIN
---[EDW].[Master].[Dim_Well_Header_Core_Update_Hub_Table] [Resolve Duplicates]
---10,781 YES(3)
---ON [Core].[Well_Name_Antero_Standard]=[Resolve Duplicates].[Well_Name_Antero_Standard]
---10,427 YES(2)
---AND [Core].Hub_Well_Header_ID != [Resolve Duplicates].[Hub_Well_Header_ID_C]
------WHERE [Core].Well_Name_Antero_Standard = 'DANIELS UNIT 3H' OR [Resolve Duplicates].Well_Name_Antero_Standard = 'DANIELS UNIT 3H'

------------------------------------------------------------------------------------------------------------
---UNION ALL
------------------------------------------------------------------------------------------------------------
---Update needed for SigmaFlow
---166 updated
UPDATE Core SET [Core].Hub_Well_Header_ID = [Resolve Duplicates].[Hub_Well_Header_ID_C] 
---SELECT
---'SigmaFlow' AS [Type],
---[Core].Well_Name_Antero_Standard,
---[Core].Sat_Well_Header_SigmaFlow_ID,
---[Core].Hub_Well_Header_ID,
---[Resolve Duplicates].[Hub_Well_Header_ID_C]      AS [Hub_Well_Header_ID_C_Resolve], 
---[Resolve Duplicates].Well_Name_Antero_Standard	  AS Well_Name_Antero_Standard_Resolve,
---[Resolve Duplicates].[Sources]              	    AS [Sources_Resolve],              
---[Resolve Duplicates].[Sources Rank]              AS [Sources Rank Resolve],         
---[Resolve Duplicates].[Sources Length]         	  AS [Sources Length Resolve],       
---[Resolve Duplicates].[Type]                	    AS [Type_Resolve],                
---[Resolve Duplicates].[Well_Header_UID]        	  AS [Well_Header_UID_Resolve],      
---[Resolve Duplicates].SEQNUM                    	AS SEQNUM_Resolve,                 
---[Resolve Duplicates].API_Number               	  AS API_Number_Resolve,             
---[Resolve Duplicates].Cost_Center				          AS Cost_Center_Resolve
---SELECT *
FROM
[Master].[Sat_Well_Header_SigmaFlow] [Core]
INNER JOIN
[Master].[Dim_Well_Header_Core_Update_Hub_Table] [Resolve Duplicates]
---10,781 YES(3)
ON [Core].[Well_Name_Antero_Standard]=[Resolve Duplicates].[Well_Name_Antero_Standard]
---10,427 YES(1)
AND [Core].Hub_Well_Header_ID != [Resolve Duplicates].[Hub_Well_Header_ID_C]
---WHERE [Core].Well_Name_Antero_Standard = 'DANIELS UNIT 3H' OR [Resolve Duplicates].Well_Name_Antero_Standard = 'DANIELS UNIT 3H'
------------------------------------------------------------------------------------------------------------
---Delete not needed for SigmaFlow
---DELETE FROM Core  
---SELECT
---'SigmaFlow' AS [Type],
---[Core].Well_Name_Antero_Standard,
---[Core].Sat_Well_Header_SigmaFlow_ID,
---[Core].Hub_Well_Header_ID,
---[Resolve Duplicates].[Hub_Well_Header_ID_C]      AS [Hub_Well_Header_ID_C_Resolve], 
---[Resolve Duplicates].Well_Name_Antero_Standard	  AS Well_Name_Antero_Standard_Resolve,
---[Resolve Duplicates].[Sources]              	    AS [Sources_Resolve],              
---[Resolve Duplicates].[Sources Rank]           	  AS [Sources Rank Resolve],         
---[Resolve Duplicates].[Sources Length]         	  AS [Sources Length Resolve],       
---[Resolve Duplicates].[Type]                	    AS [Type_Resolve],                
---[Resolve Duplicates].[Well_Header_UID]        	  AS [Well_Header_UID_Resolve],      
---[Resolve Duplicates].SEQNUM                   	  AS SEQNUM_Resolve,                 
---[Resolve Duplicates].API_Number               	  AS API_Number_Resolve,             
---[Resolve Duplicates].Cost_Center		              AS Cost_Center_Resolve
---SELECT *
---FROM
---[Master].[Sat_Well_Header_SigmaFlow] [Core]
---INNER JOIN
---[Master].[Dim_Well_Header_Core_Update_Hub_Table] [Resolve Duplicates]
---10,781 YES(3)
---ON [Core].[Well_Name_Antero_Standard]=[Resolve Duplicates].[Well_Name_Antero_Standard]
---10,427 YES(2)
---AND [Core].Hub_Well_Header_ID != [Resolve Duplicates].[Hub_Well_Header_ID_C]
------WHERE [Core].Well_Name_Antero_Standard = 'DANIELS UNIT 3H' OR [Resolve Duplicates].Well_Name_Antero_Standard = 'DANIELS UNIT 3H'

------------------------------------------------------------------------------------------------------------
---UNION ALL
------------------------------------------------------------------------------------------------------------
---Update needed for GIS
---7 updated
UPDATE Core SET [Core].Hub_Well_Header_ID = [Resolve Duplicates].[Hub_Well_Header_ID_C] 
---SELECT
---'GIS' AS [Type],
---[Core].Well_Name_Antero_Standard,
---[Core].Sat_Well_Header_GIS_ID,
---[Core].Hub_Well_Header_ID,
---[Resolve Duplicates].[Hub_Well_Header_ID_C]      AS [Hub_Well_Header_ID_C_Resolve], 
---[Resolve Duplicates].Well_Name_Antero_Standard	  AS Well_Name_Antero_Standard_Resolve,
---[Resolve Duplicates].[Sources]                   AS [Sources_Resolve],              
---[Resolve Duplicates].[Sources Rank]              AS [Sources Rank Resolve],         
---[Resolve Duplicates].[Sources Length]         	  AS [Sources Length Resolve],       
---[Resolve Duplicates].[Type]                	    AS [Type_Resolve],                
---[Resolve Duplicates].[Well_Header_UID]        	  AS [Well_Header_UID_Resolve],      
---[Resolve Duplicates].SEQNUM                    	AS SEQNUM_Resolve,                 
---[Resolve Duplicates].API_Number               	  AS API_Number_Resolve,             
---[Resolve Duplicates].Cost_Center			            AS Cost_Center_Resolve
---SELECT *
FROM
[Master].[Sat_Well_Header_GIS] [Core]
INNER JOIN
[Master].[Dim_Well_Header_Core_Update_Hub_Table] [Resolve Duplicates]
---10,781 YES(3)
ON [Core].[Well_Name_Antero_Standard]=[Resolve Duplicates].[Well_Name_Antero_Standard]
---10,427 YES(1)
AND [Core].Hub_Well_Header_ID != [Resolve Duplicates].[Hub_Well_Header_ID_C]
---WHERE [Core].Well_Name_Antero_Standard = 'DANIELS UNIT 3H' OR [Resolve Duplicates].Well_Name_Antero_Standard = 'DANIELS UNIT 3H'
------------------------------------------------------------------------------------------------------------
---Delete not needed for GIS
---DELETE FROM Core  
---SELECT
---'GIS' AS [Type],
---[Core].Well_Name_Antero_Standard,
---[Core].Sat_Well_Header_GIS_ID,
---[Core].Hub_Well_Header_ID,
---[Resolve Duplicates].[Hub_Well_Header_ID_C]        AS [Hub_Well_Header_ID_C_Resolve], 
---[Resolve Duplicates].Well_Name_Antero_Standard	    AS Well_Name_Antero_Standard_Resolve,
---[Resolve Duplicates].[Sources]              	      AS [Sources_Resolve],              
---[Resolve Duplicates].[Sources Rank]             	  AS [Sources Rank Resolve],         
---[Resolve Duplicates].[Sources Length]         	    AS [Sources Length Resolve],       
---[Resolve Duplicates].[Type]                	      AS [Type_Resolve],                
---[Resolve Duplicates].[Well_Header_UID]        	    AS [Well_Header_UID_Resolve],      
---[Resolve Duplicates].SEQNUM                     	  AS SEQNUM_Resolve,                 
---[Resolve Duplicates].API_Number                 	  AS API_Number_Resolve,             
---[Resolve Duplicates].Cost_Center				            AS Cost_Center_Resolve
---SELECT *
---FROM
---[Master].[Sat_Well_Header_GIS] [Core]
---INNER JOIN
---[Master].[Dim_Well_Header_Core_Update_Hub_Table] [Resolve Duplicates]
---10,781 YES(3)
---ON [Core].[Well_Name_Antero_Standard]=[Resolve Duplicates].[Well_Name_Antero_Standard]
---10,427 YES(2)
---AND [Core].Hub_Well_Header_ID != [Resolve Duplicates].[Hub_Well_Header_ID_C]
------WHERE [Core].Well_Name_Antero_Standard = 'DANIELS UNIT 3H' OR [Resolve Duplicates].Well_Name_Antero_Standard = 'DANIELS UNIT 3H'

------------------------------------------------------------------------------------------------------------
---UNION ALL
------------------------------------------------------------------------------------------------------------
---Update needed for FracSchedule
---9 updated
UPDATE Core SET [Core].Hub_Well_Header_ID = [Resolve Duplicates].[Hub_Well_Header_ID_C] 
---SELECT
---'FracSchedule' AS [Type],
---[Core].Well_Name_Antero_Standard,
---[Core].Sat_Well_Header_FracSchedule_ID,
---[Core].Hub_Well_Header_ID,
---[Resolve Duplicates].[Hub_Well_Header_ID_C]       AS [Hub_Well_Header_ID_C_Resolve], 
---[Resolve Duplicates].Well_Name_Antero_Standard	   AS Well_Name_Antero_Standard_Resolve,
---[Resolve Duplicates].[Sources]              	     AS [Sources_Resolve],              
---[Resolve Duplicates].[Sources Rank]         	     AS [Sources Rank Resolve],         
---[Resolve Duplicates].[Sources Length]         	   AS [Sources Length Resolve],       
---[Resolve Duplicates].[Type]                	     AS [Type_Resolve],                
---[Resolve Duplicates].[Well_Header_UID]        	   AS [Well_Header_UID_Resolve],      
---[Resolve Duplicates].SEQNUM                       AS SEQNUM_Resolve,                 
---[Resolve Duplicates].API_Number               	   AS API_Number_Resolve,             
---[Resolve Duplicates].Cost_Center				           AS Cost_Center_Resolve
------SELECT *
FROM
[Master].[Sat_Well_Header_FracSchedule] [Core]
INNER JOIN
[Master].[Dim_Well_Header_Core_Update_Hub_Table] [Resolve Duplicates]
---10,781 YES(3)
ON [Core].[Well_Name_Antero_Standard]=[Resolve Duplicates].[Well_Name_Antero_Standard]
---10,427 YES(1)
AND [Core].Hub_Well_Header_ID != [Resolve Duplicates].[Hub_Well_Header_ID_C]
---WHERE [Core].Well_Name_Antero_Standard = 'DANIELS UNIT 3H' OR [Resolve Duplicates].Well_Name_Antero_Standard = 'DANIELS UNIT 3H'
------------------------------------------------------------------------------------------------------------
---Delete not needed for FracSchedule
---DELETE FROM Core  
---SELECT
---'FracSchedule' AS [Type],
---[Core].Well_Name_Antero_Standard,
---[Core].Sat_Well_Header_FracSchedule_ID,
---[Core].Hub_Well_Header_ID,
---[Resolve Duplicates].[Hub_Well_Header_ID_C]      AS [Hub_Well_Header_ID_C_Resolve], 
---[Resolve Duplicates].Well_Name_Antero_Standard	  AS Well_Name_Antero_Standard_Resolve,
---[Resolve Duplicates].[Sources]              	    AS [Sources_Resolve],              
---[Resolve Duplicates].[Sources Rank]           	  AS [Sources Rank Resolve],         
---[Resolve Duplicates].[Sources Length]         	  AS [Sources Length Resolve],       
---[Resolve Duplicates].[Type]                	    AS [Type_Resolve],                
---[Resolve Duplicates].[Well_Header_UID]        	  AS [Well_Header_UID_Resolve],      
---[Resolve Duplicates].SEQNUM                   	  AS SEQNUM_Resolve,                 
---[Resolve Duplicates].API_Number               	  AS API_Number_Resolve,             
---[Resolve Duplicates].Cost_Center			     	      AS Cost_Center_Resolve
---SELECT *
---FROM
---[Master].[Sat_Well_Header_FracSchedule] [Core]
---INNER JOIN
---[EDW].[Master].[Dim_Well_Header_Core_Update_Hub_Table] [Resolve Duplicates]
---10,781 YES(3)
---ON [Core].[Well_Name_Antero_Standard]=[Resolve Duplicates].[Well_Name_Antero_Standard]
---10,427 YES(2)
---AND [Core].Hub_Well_Header_ID != [Resolve Duplicates].[Hub_Well_Header_ID_C]
------WHERE [Core].Well_Name_Antero_Standard = 'DANIELS UNIT 3H' OR [Resolve Duplicates].Well_Name_Antero_Standard = 'DANIELS UNIT 3H'

------------------------------------------------------------------------------------------------------------
---UNION ALL
------------------------------------------------------------------------------------------------------------
---Update needed for Aries_Planning
---34 updated
UPDATE Core SET [Core].Hub_Well_Header_ID = [Resolve Duplicates].[Hub_Well_Header_ID_C] 
---SELECT
---'Aries P' AS [Type],
---[Core].Well_Name_Antero_Standard,
---[Core].Sat_Well_Header_Aries_ID,
---[Core].Hub_Well_Header_ID,
---[Resolve Duplicates].[Hub_Well_Header_ID_C]       AS [Hub_Well_Header_ID_C_Resolve], 
---[Resolve Duplicates].Well_Name_Antero_Standard	   AS Well_Name_Antero_Standard_Resolve,
---[Resolve Duplicates].[Sources]                    AS [Sources_Resolve],              
---[Resolve Duplicates].[Sources Rank]               AS [Sources Rank Resolve],         
---[Resolve Duplicates].[Sources Length]         	   AS [Sources Length Resolve],       
---[Resolve Duplicates].[Type]                	     AS [Type_Resolve],                
---[Resolve Duplicates].[Well_Header_UID]        	   AS [Well_Header_UID_Resolve],      
---[Resolve Duplicates].SEQNUM                    	 AS SEQNUM_Resolve,                 
---[Resolve Duplicates].API_Number               	   AS API_Number_Resolve,             
---[Resolve Duplicates].Cost_Center			             AS Cost_Center_Resolve
------SELECT *
FROM
[Master].[Sat_Well_Header_Aries_Planning] [Core]
INNER JOIN
[Master].[Dim_Well_Header_Core_Update_Hub_Table] [Resolve Duplicates]
---10,781 YES(3)
ON [Core].[Well_Name_Antero_Standard]=[Resolve Duplicates].[Well_Name_Antero_Standard]
---10,427 YES(1)
AND [Core].Hub_Well_Header_ID != [Resolve Duplicates].[Hub_Well_Header_ID_C]
---WHERE [Core].Well_Name_Antero_Standard = 'DANIELS UNIT 3H' OR [Resolve Duplicates].Well_Name_Antero_Standard = 'DANIELS UNIT 3H'
------------------------------------------------------------------------------------------------------------
---Delete not needed for Aries_Planning
---DELETE FROM Core  
---SELECT
---'Aries P' AS [Type],
---[Core].Well_Name_Antero_Standard,
---[Core].Sat_Well_Header_Aries_ID,
---[Core].Hub_Well_Header_ID,
---[Resolve Duplicates].[Hub_Well_Header_ID_C]      AS [Hub_Well_Header_ID_C_Resolve], 
---[Resolve Duplicates].Well_Name_Antero_Standard	  AS Well_Name_Antero_Standard_Resolve,
---[Resolve Duplicates].[Sources]              	    AS [Sources_Resolve],              
---[Resolve Duplicates].[Sources Rank]           	  AS [Sources Rank Resolve],         
---[Resolve Duplicates].[Sources Length]         	  AS [Sources Length Resolve],       
---[Resolve Duplicates].[Type]                	    AS [Type_Resolve],                
---[Resolve Duplicates].[Well_Header_UID]        	  AS [Well_Header_UID_Resolve],      
---[Resolve Duplicates].SEQNUM                   	  AS SEQNUM_Resolve,                 
---[Resolve Duplicates].API_Number               	  AS API_Number_Resolve,             
---[Resolve Duplicates].Cost_Center				          AS Cost_Center_Resolve
---SELECT *
---FROM
---[Master].[Sat_Well_Header_Aries_Planning] [Core]
---INNER JOIN
---[Master].[Dim_Well_Header_Core_Update_Hub_Table] [Resolve Duplicates]
---10,781 YES(3)
---ON [Core].[Well_Name_Antero_Standard]=[Resolve Duplicates].[Well_Name_Antero_Standard]
---10,427 YES(2)
---AND [Core].Hub_Well_Header_ID != [Resolve Duplicates].[Hub_Well_Header_ID_C]
------WHERE [Core].Well_Name_Antero_Standard = 'DANIELS UNIT 3H' OR [Resolve Duplicates].Well_Name_Antero_Standard = 'DANIELS UNIT 3H'



---) aa
---GROUP BY [Type],Well_Name_Antero_Standard
---ORDER BY 3 DESC


---Finalze by deleting orphan Hub IDs
DELETE FROM Hub
---SELECT Hub.Hub_Well_Header_ID,Core.Hub_Well_Header_ID
FROM 
[Master].[Hub_Well_Header] [Hub]
FULL OUTER JOIN
[Master].[Sat_Well_Header] [Core]
ON Hub.Hub_Well_Header_ID = Core.Hub_Well_Header_ID
WHERE 
---Hub.Hub_Well_Header_ID IS NULL OR 
   Core.Hub_Well_Header_ID IS NULL


END
GO


