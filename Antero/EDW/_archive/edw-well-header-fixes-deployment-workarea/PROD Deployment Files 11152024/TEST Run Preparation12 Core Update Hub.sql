USE [EDW]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE OR ALTER VIEW [Master].[Dim_Well_Header_Core_Update_Hub]
AS
SELECT 
COALESCE([Unique].Well_Name_Antero_Standard,[Duplicate].Well_Name_Antero_Standard) AS Well_Name_Antero_Standard,

COALESCE([Unique].[Sources],                  [Duplicate].[Sources])                   AS [Sources],
COALESCE([Unique].[Sources Rank],             [Duplicate].[Sources Rank])              AS [Sources Rank],
COALESCE([Unique].[Sources Length],           [Duplicate].[Sources Length])            AS [Sources Length],

COALESCE([Unique].[type_coalesce],            [Duplicate].[type_coalesce ])            AS [Type],
COALESCE([Unique].[Well_Header_UID],          [Duplicate].[Well_Header_UID])           AS [Well_Header_UID],
COALESCE([Unique].[Hub_Well_Header_ID_C],     [Duplicate].[Hub_Well_Header_ID_C])      AS [Hub_Well_Header_ID_C],
COALESCE([Unique].SEQNUM,                     [Duplicate].SEQNUM)                      AS SEQNUM,
COALESCE([Unique].API_Number,                 [Duplicate].API_Number)                  AS API_Number,
COALESCE([Unique].Cost_Center,                [Duplicate].Cost_Center)                 AS Cost_Center,

[Unique].[Sources]                                 AS [Sources_Unique],
[Unique].[type_coalesce]                           AS [Type_Unique],
[Unique].[Well_Header_UID]                         AS [Well_Header_UID_Unique],
[Unique].[Hub_Well_Header_ID_C]                    AS [Hub_Well_Header_ID_C_Unique],
[Unique].SEQNUM                                    AS SEQNUM_Unique,
[Unique].API_Number                                AS API_Number_Unique,
[Unique].Cost_Center                               AS Cost_Center_Unique,
[Unique].[SigmaFlow Integration with SEQNUM]       AS [SigmaFlow Integration with SEQNUM Unique],
[Unique].[SigmaFlow Integration GIS with SEQNUM]   AS [SigmaFlow Integration GIS with SEQNUM Unique],


[Duplicate].[Sources]                               AS [Sources_Duplicate],
[Duplicate].[type_coalesce ]                        AS [Type_Duplicate],
[Duplicate].[Well_Header_UID]                       AS [Well_Header_UID_Duplicate],
[Duplicate].[Hub_Well_Header_ID_C]                  AS [Hub_Well_Header_ID_C_Duplicate],
[Duplicate].SEQNUM                                  AS SEQNUM_Duplicate,
[Duplicate].API_Number                              AS API_Number_Duplicate,
[Duplicate].Cost_Center                             AS Cost_Center_Duplicate,
[Duplicate].[SigmaFlow Integration with SEQNUM]     AS [SigmaFlow Integration with SEQNUM Duplicate],
[Duplicate].[SigmaFlow Integration GIS with SEQNUM] AS [SigmaFlow Integration GIS with SEQNUM Duplicate]

---'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz' zz,
---[Duplicate].*,
---'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz' zz1,
---[Unique].*
FROM 
--------------------------------------------------------------------------------------------------------------------------------
(
---2
SELECT * FROM (
SELECT 'Duplicate' AS [type_coalesce],* 
---SELECT DISTINCT Well_Name_Antero_Standard
FROM [EDW].[Master].[Dim_Well_Header_Core]
---SELECT COUNT(distinct Well_Name_Antero_Standard) FROM [EDW].[Master].[Dim_Well_Header_Dedup_1_Base]
 WHERE Well_Name_Antero_Standard IN (
---1
SELECT Well_Name_Antero_Standard---,COUNT(*)
FROM [EDW].[Master].[Dim_Well_Header_Core]
WHERE Well_Name_Antero_Standard IS NOT NULL ---AND [Sources Rownum] = 1
GROUP BY Well_Name_Antero_Standard
HAVING COUNT(*) > 1
---1
) 
)bb 
WHERE [Sources Rownum] = 1
---2
) [Duplicate]
---ORDER BY 9
--------------------------------------------------------------------------------------------------------------------------------
FULL OUTER JOIN
--------------------------------------------------------------------------------------------------------------------------------
(
---2
SELECT 'Unique' AS [type_coalesce],* 
FROM [EDW].[Master].[Dim_Well_Header_Core]
---SELECT COUNT(distinct Well_Name_Antero_Standard) FROM [EDW].[Master].[Dim_Well_Header_Dedup_1_Base]
 WHERE Well_Name_Antero_Standard IN (
---1
SELECT Well_Name_Antero_Standard---,COUNT(*)
FROM [EDW].[Master].[Dim_Well_Header_Core]
WHERE Well_Name_Antero_Standard IS NOT NULL
GROUP BY Well_Name_Antero_Standard
HAVING COUNT(*) = 1
---1
)---aa
---ORDER BY 9
---2
) [Unique]
ON [Duplicate].Well_Name_Antero_Standard = [Unique].Well_Name_Antero_Standard
GO

