USE [EDW]
GO

/****** Object:  View [Translate].[View_Well_Header_Enertia]    Script Date: 11/1/2024 8:18:58 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO








CREATE VIEW [Translate].[View_Well_Header_Enertia]
AS
SELECT * FROM (SELECT ROW_NUMBER() OVER (PARTITION BY [Well_Name_Antero_Standard] ORDER BY SEQNUM DESC) AS [Row Num], * FROM (
SELECT
    Enertia_Wells.Completion_HdrHID                                                                                                      AS Enertia_Well_Header_ID
   ,RTRIM(REPLACE(Enertia_Wells.Completion_Name, '#', ''))                                                                               AS Original_Well_Name
   ,RTRIM(REPLACE(Enertia_Wells.Completion_Name, '#', ''))                                                                               AS Original_Wellbore_Name
   ,Translate.fn_Standardize_Well_Name(Translate.fn_Convert_Wellbore_Name_To_Well_Name(REPLACE(Enertia_Wells.Completion_Name, '#', ''))) AS Well_Name_Match_Key
   --,Translate.fn_Title_Case_Well_Name(REPLACE(Enertia_Wells.Completion_Name, '#', ''))                                                   AS Wellbore_Name_Title_Case
   ,Translate.fn_Standardize_Well_Name(REPLACE(Enertia_Wells.Completion_Name, '#', ''))                                                  AS Wellbore_Name_Antero_Standard
   --,Translate.fn_Title_Case_Well_Name(Translate.fn_Convert_Wellbore_Name_To_Well_Name(REPLACE(Enertia_Wells.Completion_Name, '#', '')))  AS Well_Name_Title_Case
   ,Translate.fn_Standardize_Well_Name(Translate.fn_Convert_Wellbore_Name_To_Well_Name(REPLACE(Enertia_Wells.Completion_Name, '#', ''))) AS Well_Name_Antero_Standard
   ,CASE
        --Enertia Creates part of the API without an assigned api from the state
        --The well code cannot be generated, so it is a good check to see if we have an API Assigned
        WHEN NULLIF(NULLIF(Enertia_Wells.Completion_API_Well_Code,''),'00000') IS NOT NULL THEN
            Enertia_Wells.Completion_API_State_Code + Enertia_Wells.Completion_API_County_Code + RTRIM(Enertia_Wells.Completion_API_Well_Code) + CASE
                                                                                                                                                     WHEN Enertia_Wells.Completion_API_Sidetrack_Code IS NULL THEN
                                                                                                                                                         '00'
                                                                                                                                                     WHEN LEN(Enertia_Wells.Completion_API_Sidetrack_Code) < 2 THEN
                                                                                                                                                         '00'
                                                                                                                                                     ELSE
                                                                                                                                                         Enertia_Wells.Completion_API_Sidetrack_Code
                                                                                                                                                 END + CASE
                                                                                                                                                           WHEN Enertia_Wells.Completion_API_Completion_Code IS NULL THEN
                                                                                                                                                               '00'
                                                                                                                                                           WHEN LEN(Enertia_Wells.Completion_API_Completion_Code) < 2 THEN
                                                                                                                                                               '00'
                                                                                                                                                           ELSE
                                                                                                                                                               Enertia_Wells.Completion_API_Completion_Code
                                                                                                                                                       END
        ELSE
            NULL
    END                                                                                                                                  AS API_Number
   ,Enertia_Wells.Completion_HdrCode                                                                                                     AS EnertiaID
   ,Enertia_Wells.Completion_HdrCode                                                                                                     AS Cost_Center
   ,IIF(RTRIM(Enertia_Wells.Completion_HdrAlpha)NOT LIKE '%[^0-9]%', CAST(Enertia_Wells.Completion_HdrAlpha AS INT), NULL)               AS SEQNUM
   ,RTRIM(REPLACE(Enertia_Wells.Completion_Name, '#', ''))                                                                               AS Well_Name
   ,Enertia_Wells.Completion_County                                                                                                      AS County
   ,State_Names.State_Name_Proper_Case                                                                                                   AS State_Name
   ,Enertia_Wells.Completion_Oil_First_Production_Date                                                                                   AS First_Production_Date_Oil_Actual
   ,Enertia_Wells.Completion_Gas_First_Production_Date                                                                                   AS First_Production_Date_Gas_Actual
   ,Enertia_Wells.Completion_Operator_Name                                                                                               AS Operator
   ,Enertia_Wells.Completion_Antero_Working_Interest * 100.0                                                                             AS Working_Interest
   ,Enertia_Wells.Completion_Antero_Net_Revenue_Interest * 100.0                                                                         AS Net_Revenue_Interest
   ,Enertia_Wells.Pad_Name_Without_State_Abbreviation                                                                                    AS Pad_Name
   ,Enertia_Wells.Pad_HdrHID                                                                                                             AS Pad_Id
   ,Enertia_Wells.Pad_AFE_Name                                                                                                           AS Pad_AFE_Name
   ,Enertia_Wells.Pad_AFE_HdrCode                                                                                                        AS Pad_AFE_Number
   ,Enertia_Wells.Completion_AFE_Name                                                                                                    AS Completion_AFE_Name
   ,Enertia_Wells.Completion_AFE_HdrCode                                                                                                 AS Completion_AFE_Number
   ,Enertia_Wells.Completion_Status_Description                                                                                          AS Current_Operations
   ,API_County.County_Name                                                                                                               AS API_County_Name
   ,API_State.State_Name_Proper_Case                                                                                                     AS API_State_Name
   ,Enertia_Wells.Unit_HdrHID                                                                                                            AS Enertia_Unit_Header_ID
   ,Enertia_Wells.Unit_Name_Without_State_Abbreviation                                                                                   AS Unit_Name
---   ,Enertia_Wells.Completion_Status_Description
FROM Translate.Well_Header_Enertia_Base   AS Enertia_Wells
    LEFT JOIN Reference.US_States         AS State_Names ON State_Names.State_Abbreviation = Enertia_Wells.Completion_US_State_Abbreviation
    LEFT JOIN Reference.US_States         AS API_State ON Enertia_Wells.Completion_API_State_Code_Lookup = API_State.API_State_Code
    LEFT JOIN Reference.US_State_Counties AS API_County ON Enertia_Wells.Completion_API_State_Code_Lookup = API_County.API_State_Code
                                                           AND Enertia_Wells.Completion_API_County_Code_Lookup = API_County.API_County_Code
---temporary fix. need to filter for duplicate well names
---	WHERE Enertia_Wells.Completion_HdrCode NOT IN 
---	(
------existing
---    '12238.2','12764.2',
------new
---    '12758.1','12759.1'     
---    )
)aa)bb WHERE [Row Num] = 1
	        
GO

