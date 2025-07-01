USE [EDW]
GO

/****** Object:  View [Translate].[View_Well_Header_GIS]    Script Date: 11/1/2024 8:17:45 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [Translate].[View_Well_Header_GIS]
AS
---3
SELECT * 
FROM (	
---2
SELECT ROW_NUMBER() OVER (PARTITION BY [Well_Name_Antero_Standard] ORDER BY SEQNUM DESC) AS [Row Num2], * 
FROM (
---1
SELECT 'NULL SEQNUM'      AS TYPE, * FROM [Translate].[View_Well_Header_GIS_NULL_SEQNUM]
UNION ALL
SELECT 'Populated SEQNUM' AS TYPE, * FROM [Translate].[View_Well_Header_GIS_NOT_NULL_SEQNUM]
---1

) aa
---2
) bb
WHERE [Row Num2] = 1
---3
GO

