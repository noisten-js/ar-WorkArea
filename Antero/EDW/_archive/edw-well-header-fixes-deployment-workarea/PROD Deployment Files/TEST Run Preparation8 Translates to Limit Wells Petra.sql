
USE [EDW]
GO

/****** Object:  View [Translate].[View_Well_Header_Petra]    Script Date: 10/12/2024 7:23:42 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO










ALTER VIEW [Translate].[View_Well_Header_Petra]
AS
SELECT * FROM (SELECT ROW_NUMBER() OVER (PARTITION BY [Well_Name_Antero_Standard] ORDER BY SEQNUM DESC) AS [Row Num], * FROM (
SELECT
    CONVERT(VARCHAR(40), petra.Translated_Well_Name)                                                                 AS Well_Name_Original
   ,Translate.fn_Standardize_Well_Name(petra.Translated_Well_Name)                                                   AS Well_Name_Match_Key
   ,Translate.fn_Title_Case_Well_Name(petra.Translated_Well_Name)                                                    AS Wellbore_Name_Original
   ,Translate.fn_Title_Case_Well_Name(petra.Translated_Well_Name)                                                    AS Wellbore_Name_Title_Case
   ,Translate.fn_Standardize_Well_Name(petra.Translated_Well_Name)                                                   AS Wellbore_Name_Antero_Standard
   ,Translate.fn_Title_Case_Well_Name(Translate.fn_Convert_Wellbore_Name_To_Well_Name(petra.Translated_Well_Name))   AS Well_Name_Title_Case
   ,Translate.fn_Standardize_Well_Name(petra.Translated_Well_Name)                                                   AS Well_Name_Antero_Standard
---,Translate.fn_Standardize_Well_Name(Translate.fn_Convert_Wellbore_Name_To_Well_Name(petra.Translated_Well_Name))  AS Well_Name_Antero_Standard
   ,CAST(petra.US_State_Name AS VARCHAR(35))                                                                         AS State_Name
   ,REPLACE(petra.Pad_Name, ' PAD', '') + ' Pad'                                                                     AS Pad_Name
   ,NULLIF(petra.SEQNUM,0)                                                                                           AS SEQNUM
   ,CAST(dbo.fn_get_first_number_from_varchar(petra.Short_Name) AS BIGINT)                                           AS Well_Number
   ,petra.Well_Configuration                                                                                         AS Configuration
   ,petra.Big_Rig_Spud_Date                                                                                          AS Big_Rig_Spud_Date_Actual
   ,petra.Completion_Date                                                                                            AS Completion_Date_Actual
   ,ISNULL(Rig_Name_Lookup.StandardValue, petra.Big_Rig_Name)                                                        AS Big_Rig_Name
   ,api_state.State_Name_Upper_Case                                                                                  AS API_State_Name
   ,api_county.County_Name                                                                                           AS API_County_Name

--- Changing the way Bottom Hole Lat/Lon/Shape are populated
   ,IIF(LEN(petra.UWI) <> 14 AND petra.Bottom_Latitude_NAD27 IS NULL,NULL, petra.Latitude_NAD27)          AS Surface_Latitude_NAD27
   ,IIF(LEN(petra.UWI) <> 14 AND petra.Bottom_Longitude_NAD27 IS NULL,NULL, petra.Longitude_NAD27)        AS Surface_Longitude_NAD27
   ,CASE WHEN petra.Bottom_Latitude_NAD27 IS NULL AND LEN(petra.UWI) <> 14 THEN petra.Latitude_NAD27
   ELSE  petra.Bottom_Latitude_NAD27		END 																	 AS BottomHole_Latitude_NAD27
   ,CASE WHEN petra.Bottom_Longitude_NAD27 IS NULL AND LEN(petra.UWI) <> 14 THEN petra.Longitude_NAD27
   ELSE  petra.Bottom_Longitude_NAD27		END																	 AS BottomHole_Longitude_NAD27
   ,petra.Surface_Location_Shape                                                                                     AS Surface_Location_Shape
   ,IIF(petra.Bottom_Location_Shape IS NOT NULL, petra.Bottom_Location_Shape, petra.Surface_Location_Shape)          AS BottomHole_Location_Shape
   ,petra.Surface_Location_ShapeBLM                                                                                  AS Surface_Location_ShapeBLM
   ,IIF(petra.Bottom_Location_ShapeBLM IS NOT NULL, petra.Bottom_Location_ShapeBLM, petra.Surface_Location_ShapeBLM) AS BottomHole_Location_ShapeBLM

   ,CASE
        WHEN petra.Reservoir = 'Point Pleasant' THEN
            'UTICA'
        ELSE
            petra.Reservoir
    END                                                                                                              AS Reservoir
   ,petra.Project
   ,petra.WSN
   ,petra.UWI_API_Number                                                                                             AS API_Number
   ,petra.County                                                                                                     AS County
   ,petra.Operator                                                                                                   AS Operator
   ,IIF(petra.Lease_Name IS NOT NULL, petra.Lease_Name, petra.Petra_Well_Header_Well_Name)                           AS Unit_Name
   ,petra.Producing_Status                                                                                           AS Producing_Status
   ,petra.Total_Measured_Depth                                                                                       AS Total_Measured_Depth_Actual
   ,petra.Lateral_Length_Actual                                                                                      AS Lateral_Length_Actual
   ,petra.Lateral_Length_Planned                                                                                     AS Lateral_Length_Planned
   ,petra.Prospect                                                                                                   AS Prospect
   --CASE
   --    WHEN UWI LIKE '*[0-9][0-9][0-9][0-9][0-9]' THEN
   --        CAST(RIGHT(UWI, 5) AS INT)
   --    ELSE
   --        NULL
   --END                                                                                                  AS UWI_SEQNUM,
   ,petra.Ground_Elevation
   ,petra.Symbol_Code
   ,petra.Scrubbed_Lateral_Length
   ,petra.Cased_Lateral_Length
   ,petra.Completable_Lateral_Length
   ,petra.Drilled_Lateral_Length
   ,petra.Third_Party_Lateral_Length
   ,petra.Estimated_Lateral_Length
   ,petra.Official_Lateral_Length
   ,petra.USA_Sticks_Lateral_Length
   ,petra.Is_Antero_Well
   ,CAST(petra.WSN AS VARCHAR(10)) + petra.Project AS Petra_ID
--- Adding the remaining valuable columns from Petra Well Header into Well Header Petra 
   ,[Abandon_Date]
   ,[Current_SEC_Reserves_Category]
   ,[Field_Name]
   ,[Formation_At_Total_Depth]
   ,[Historical_Operator]
   ,[Label]
   ,[Lease_Name]
   ,[Lease_Number]
   ,[Object_Remarks]
   ,[Permit_Date]
   ,[Petra_Well_Header_Well_Name]
   ,[Producing_Formation]
   ,[Rig_Release_Date]
   ,[Short_Name]
   ,[Symbol]
   ,[Target_Formation]
   ,[Total_Vertical_Depth]
   ,[US_State_Abbreviation]
   ,[UWI]
   ,[Well_Name_From_Label_Field]
   ,[Well_Name_From_Lease_Name_Field]
   ,[Well_Name_From_Well_Name_Field]
   ,petra.Petra_Change_Date
   ,petra.Lateral_Length_Oper_Override
FROM Translate.Petra_Well_Header          AS petra
    LEFT JOIN Reference.Master_Lookup     AS Rig_Name_Lookup ON Rig_Name_Lookup.Category = 'Rig Name'
                                                                AND Rig_Name_Lookup.IncomingSource = 'Petra'
                                                                AND Rig_Name_Lookup.IncomingValue = petra.Big_Rig_Name
    LEFT JOIN Reference.US_States         AS api_state ON api_state.API_State_Code = petra.UWI_API_Number_State --LEFT(petra.UWI_API_Number, 2)
    LEFT JOIN Reference.US_State_Counties AS api_county ON api_state.API_State_Code = api_county.API_State_Code
                                                           AND api_county.API_County_Code = petra.UWI_API_Number_County -- SUBSTRING(petra.UWI_API_Number, 3, 3)
WHERE Translate.fn_Standardize_Well_Name(petra.Translated_Well_Name)  IS NOT NULL
--- Removing the NOWI filter
---WHERE ISNULL(petra.Current_SEC_Reserves_Category, 'BLANK') <> 'NOWI'
)aa)bb WHERE [Row Num] = 1
GO
