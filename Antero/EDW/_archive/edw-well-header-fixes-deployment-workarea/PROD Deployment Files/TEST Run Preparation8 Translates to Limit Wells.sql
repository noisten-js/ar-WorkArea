USE [EDW]
GO

/****** Object:  View [Translate].[View_Well_Header_Aries]    Script Date: 10/12/2024 7:18:03 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






ALTER VIEW [Translate].[View_Well_Header_Aries]
AS
SELECT * FROM (SELECT ROW_NUMBER() OVER (PARTITION BY [Well_Name_Antero_Standard] ORDER BY SEQNUM DESC) AS [Row Num], * FROM (
SELECT
    Aries.PROPNUM                                                                                                          AS Aries_ID
   ,Clean_API_and_Well_Name.Well_Name                                                                                      AS Well_Name_Original
   ,Clean_API_and_Well_Name.Well_Name                                                                                      AS Wellbore_Name_Original
   ,Translate.fn_Standardize_Well_Name(Translate.fn_Convert_Wellbore_Name_To_Well_Name(Clean_API_and_Well_Name.Well_Name)) AS Well_Name_Match_Key
   ,Translate.fn_Title_Case_Well_Name(Clean_API_and_Well_Name.Well_Name)                                                   AS Wellbore_Name_Title_Case
   ,Translate.fn_Standardize_Well_Name(Clean_API_and_Well_Name.Well_Name)                                                  AS Wellbore_Name_Antero_Standard
   ,Translate.fn_Title_Case_Well_Name(Translate.fn_Convert_Wellbore_Name_To_Well_Name(Clean_API_and_Well_Name.Well_Name))  AS Well_Name_Title_Case
   ,Translate.fn_Standardize_Well_Name(Translate.fn_Convert_Wellbore_Name_To_Well_Name(Clean_API_and_Well_Name.Well_Name)) AS Well_Name_Antero_Standard
   ,Clean_API_and_Well_Name.API_Number                                                                                     AS API_Number
   ,LEFT(Clean_API_and_Well_Name.API_Number, 10)                                                                           AS API_10
   ,Aries.PROPNUM                                                                                                          AS PROPNUM
   ,State_Reference.State_Name_Upper_Case                                                                                  AS State_Name
   ,Aries.COUNTY                                                                                                           AS County
   ,Aries.FIELD                                                                                                            AS Prospect
   ,Aries.SEQNUM                                                                                                           AS SEQNUM
   ,Aries.LATERAL                                                                                                          AS Cased_Lateral_Length
   ,Aries.LATERAL                                                                                                          AS Drilled_Lateral_Length
   ,Aries.Perfed_Lateral																								   AS Completed_Lateral_Length
   ,Aries.STATUS                                                                                                           AS Current_Operations
   ,Aries.MEAS_DEPTH                                                                                                       AS Total_Measured_Depth
   ,Aries.TVD                                                                                                              AS Total_Vertical_Depth
   ,Aries.OPERATOR                                                                                                         AS Operator
   ,Aries.APOWI                                                                                                            AS Working_Interest
   ,Aries.APONRI                                                                                                           AS Net_Revenue_Interest
   ,Aries.FIRST_PROD                                                                                                       AS First_Production_Date_Gas
   ,Aries.ACTUAL_FP                                                                                                        AS First_Production_Date_Gas_Actual
   ,Aries.ACTUAL_SMALL_RIG_SPUD_DATE                                                                                       AS Surface_Spud_Date_Actual
   ,Aries.SMALL_RIG_SPUD_DATE_EST                                                                                          AS Surface_Spud_Date
   ,Aries.ACTUAL_BIG_RIG_SPUD_DATE                                                                                         AS Big_Rig_Spud_Date_Actual
   ,Aries.BIG_RIG_SPUD_DATE_EST                                                                                            AS Big_Rig_Spud_Date_Planned
   ,Aries.ACTUAL_BIG_RIG_SPUD_DATE                                                                                         AS Longstring_Spud_Date_Actual
   ,Aries.BIG_RIG_SPUD_DATE_EST                                                                                            AS Longstring_Spud_Date_Planned
   ,Aries.SHUT_IN_DATE                                                                                                     AS Shut_In_Date
   ,Aries.BASIN                                                                                                            AS Basin
   ,Aries.RCLIVE                                                                                                           AS Raw_Reserve_Category
   ,ISNULL(Reserve_Category_Lookup.StandardValue, Aries.RCLIVE)                                                            AS Reserve_Category
   ,Aries.SURF_LAT                                                                                                         AS Surface_Latitude_NAD27
   ,CASE
        WHEN Aries.SURF_LAT IS NOT NULL
             AND Aries.SURF_LONG IS NOT NULL THEN
            geometry::Point(Aries.SURF_LONG, Aries.SURF_LAT, 4267)
        ELSE
            NULL
    END                                                                                                                    AS Surface_Location_Shape
   ,Aries.SURF_LONG                                                                                                        AS Surface_Longitude_NAD27
   ,CASE
        WHEN Aries.VORH = 'H' THEN
            'Horizontal'
        WHEN Aries.VORH = 'V' THEN
            'Vertical'
        WHEN Aries.VORH IS NULL
             OR Aries.VORH = '' THEN
            NULL
        ELSE
            'Undefined'
    END                                                                                                                    AS Configuration
   ,CASE
        WHEN Aries.PAD_NAME LIKE 'UNKNOWN%' THEN
            NULL
        ELSE
            Translate.fn_aries_pad_name_translation(Aries.PAD_NAME)
    END                                                                                                                    AS Pad_Name
   ,dbo.udf_GetNumeric(Aries.WELL_NO)                                                                                      AS Well_Number
   ,CASE
        WHEN Aries.ACTUAL_SMALL_RIG_SPUD_DATE = Aries.ACTUAL_BIG_RIG_SPUD_DATE THEN
            NULL
        ELSE
            Aries.ACTUAL_SMALL_RIG_SPUD_DATE
    END                                                                                                                    AS Small_Rig_Spud_Date_Actual
   ,API_State.State_Name_Upper_Case                                                                                        AS API_State_Name
   ,API_County.County_Name                                                                                                 AS API_County_Name
   ,CASE
        WHEN Aries.RESERVOIR LIKE 'POINT PLEASANT%' THEN
            'UTICA'
        ELSE
            Aries.RESERVOIR
    END                                                                                                                    AS Producing_Formation
   ,CASE
        WHEN Aries.LEASE LIKE '%UNIT%' THEN
            Aries.LEASE
        ELSE
            NULL
    END																													   AS Unit_Name
   ,OneLine.M22																											   AS Eur_Gas_All                                                                                                    
   ,(Oneline.M22/1000000)/(Aries.Perfed_Lateral/1000)																	   AS [Eur_BCF/1000FT]
   ,((Oneline.M22*Aries.Processing_Factor_Rec)/1000000) + ((OneLine.M21*6)/1000000)										   AS EUR_PDP_ALL_BCFE
   ,(((Oneline.M22*Aries.Processing_Factor_Rec)/1000000) + ((OneLine.M21*6)/1000000))/(Aries.Perfed_Lateral/1000)		   AS [EUR_BCFE/1000FT]	
   ,OneLine.M21																										       AS [EUR_BO_ALL]	
   ,OneLine.M21/Aries.Perfed_Lateral																					   AS [EUR_BO/FT]	
   ,aries.RCNUM 
FROM EDW_Stage.Stage.WellHeaderAries AS Aries
    CROSS APPLY
(
    SELECT
        CASE
            WHEN ISNUMERIC(Aries.APINO) = 1 THEN
                LTRIM(RTRIM(Aries.APINO))
            ELSE
                NULL
        END                                                           AS API_Number
       ,LTRIM(RTRIM(Aries.LEASE)) + ' ' + LTRIM(RTRIM(Aries.WELL_NO)) AS Well_Name
)                                    AS Clean_API_and_Well_Name
    LEFT JOIN Reference.US_States         AS State_Reference ON State_Reference.State_Abbreviation = Aries.STATE
    LEFT JOIN Reference.US_States         AS API_State ON API_State.API_State_Code = LEFT(Clean_API_and_Well_Name.API_Number, 2)
    LEFT JOIN Reference.US_State_Counties AS API_County ON API_State.API_State_Code = API_County.API_State_Code
                                                           AND API_County.API_County_Code = SUBSTRING(Clean_API_and_Well_Name.API_Number, 3, 3)
    LEFT JOIN Reference.Master_Lookup     AS Reserve_Category_Lookup ON Reserve_Category_Lookup.Category = 'Reserve Category'
                                                                        AND Reserve_Category_Lookup.IncomingSource = 'Aries'
                                                                        AND Reserve_Category_Lookup.IncomingValue = Aries.RCLIVE
	LEFT JOIN edw_Stage.stage.Aries_AC_ONELINE OneLine
	ON Oneline.PROPNUM = aries.PROPNUM
	AND OneLine.SCENARIO = 'Fact_Sheet'
	AND Aries.VORH = 'H' AND Aries.RCLIVE = 'PDP'
	WHERE
    Aries.RCNUM IN ( '1_PDP', '2_PDNP', '3_PUD', '4_PROB', '5_POSS' ) AND 
	Aries.OPERATOR LIKE '%antero%'

---    Aries.LEASE IS NOT NULL
---    AND Aries.WELL_NO IS NOT NULL
---    AND Aries.RCLIVE NOT LIKE '%NOWI%'
---    AND Aries.OPERATOR LIKE '%antero%'
)aa)bb WHERE [Row Num] = 1
GO


USE [EDW]
GO

/****** Object:  View [Translate].[View_Well_Header_Aries_Planning]    Script Date: 10/12/2024 7:22:19 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER VIEW [Translate].[View_Well_Header_Aries_Planning]
AS
SELECT * FROM (SELECT ROW_NUMBER() OVER (PARTITION BY [Well_Name_Antero_Standard] ORDER BY SEQNUM DESC) AS [Row Num], * FROM (
SELECT
    Aries.PROPNUM                                                                                                          AS Aries_ID
   ,Clean_API_and_Well_Name.Well_Name                                                                                      AS Well_Name_Original
   ,Clean_API_and_Well_Name.Well_Name                                                                                      AS Wellbore_Name_Original
   ,Translate.fn_Standardize_Well_Name(Translate.fn_Convert_Wellbore_Name_To_Well_Name(Clean_API_and_Well_Name.Well_Name)) AS Well_Name_Match_Key
   ,Translate.fn_Title_Case_Well_Name(Clean_API_and_Well_Name.Well_Name)                                                   AS Wellbore_Name_Title_Case
   ,Translate.fn_Standardize_Well_Name(Clean_API_and_Well_Name.Well_Name)                                                  AS Wellbore_Name_Antero_Standard
   ,Translate.fn_Title_Case_Well_Name(Translate.fn_Convert_Wellbore_Name_To_Well_Name(Clean_API_and_Well_Name.Well_Name))  AS Well_Name_Title_Case
   ,Translate.fn_Standardize_Well_Name(Translate.fn_Convert_Wellbore_Name_To_Well_Name(Clean_API_and_Well_Name.Well_Name)) AS Well_Name_Antero_Standard
   ,Clean_API_and_Well_Name.API_Number                                                                                     AS API_Number
   ,LEFT(Clean_API_and_Well_Name.API_Number, 10)                                                                           AS API_10
   ,Aries.PROPNUM                                                                                                          AS PROPNUM
   ,State_Reference.State_Name_Upper_Case                                                                                  AS State_Name
   ,Aries.COUNTY                                                                                                           AS County
   ,Aries.FIELD                                                                                                            AS Prospect
   ,Aries.SEQNUM                                                                                                           AS SEQNUM
   ,Aries.LATERAL                                                                                                          AS Cased_Lateral_Length
   ,Aries.LATERAL                                                                                                          AS Drilled_Lateral_Length
   ,Aries.Perfed_Lateral																								   AS Completed_Lateral_Length
   ,Aries.STATUS                                                                                                           AS Current_Operations
   ,Aries.MEAS_DEPTH                                                                                                       AS Total_Measured_Depth
   ,Aries.TVD                                                                                                              AS Total_Vertical_Depth
   ,Aries.OPERATOR                                                                                                         AS Operator
   ,Aries.APOWI                                                                                                            AS Working_Interest
   ,Aries.APONRI                                                                                                           AS Net_Revenue_Interest
   ,Aries.FIRST_PROD                                                                                                       AS First_Production_Date_Gas
   ,Aries.ACTUAL_FP                                                                                                        AS First_Production_Date_Gas_Actual
   ,Aries.ACTUAL_SMALL_RIG_SPUD_DATE                                                                                       AS Surface_Spud_Date_Actual
   ,Aries.SMALL_RIG_SPUD_DATE_EST                                                                                          AS Surface_Spud_Date
   ,Aries.ACTUAL_BIG_RIG_SPUD_DATE                                                                                         AS Big_Rig_Spud_Date_Actual
   ,Aries.BIG_RIG_SPUD_DATE_EST                                                                                            AS Big_Rig_Spud_Date_Planned
   ,Aries.ACTUAL_BIG_RIG_SPUD_DATE                                                                                         AS Longstring_Spud_Date_Actual
   ,Aries.BIG_RIG_SPUD_DATE_EST                                                                                            AS Longstring_Spud_Date_Planned
   ,Aries.SHUT_IN_DATE                                                                                                     AS Shut_In_Date
   ,Aries.BASIN                                                                                                            AS Basin
   ,Aries.RCLIVE                                                                                                           AS Raw_Reserve_Category
   ,ISNULL(Reserve_Category_Lookup.StandardValue, Aries.RCLIVE)                                                            AS Reserve_Category
   ,Aries.SURF_LAT                                                                                                         AS Surface_Latitude_NAD27
   ,CASE
        WHEN Aries.SURF_LAT IS NOT NULL
             AND Aries.SURF_LONG IS NOT NULL THEN
            geometry::Point(Aries.SURF_LONG, Aries.SURF_LAT, 4267)
        ELSE
            NULL
    END                                                                                                                    AS Surface_Location_Shape
   ,Aries.SURF_LONG                                                                                                        AS Surface_Longitude_NAD27
   ,CASE
        WHEN Aries.VORH = 'H' THEN
            'Horizontal'
        WHEN Aries.VORH = 'V' THEN
            'Vertical'
        WHEN Aries.VORH IS NULL
             OR Aries.VORH = '' THEN
            NULL
        ELSE
            'Undefined'
    END                                                                                                                    AS Configuration
   ,CASE
        WHEN Aries.PAD_NAME LIKE 'UNKNOWN%' THEN
            NULL
        ELSE
            Translate.fn_aries_pad_name_translation(Aries.PAD_NAME)
    END                                                                                                                    AS Pad_Name
   ,dbo.udf_GetNumeric(Aries.WELL_NO)                                                                                      AS Well_Number
   ,CASE
        WHEN Aries.ACTUAL_SMALL_RIG_SPUD_DATE = Aries.ACTUAL_BIG_RIG_SPUD_DATE THEN
            NULL
        ELSE
            Aries.ACTUAL_SMALL_RIG_SPUD_DATE
    END                                                                                                                    AS Small_Rig_Spud_Date_Actual
   ,API_State.State_Name_Upper_Case                                                                                        AS API_State_Name
   ,API_County.County_Name                                                                                                 AS API_County_Name
   ,CASE
        WHEN Aries.RESERVOIR LIKE 'POINT PLEASANT%' THEN
            'UTICA'
        ELSE
            Aries.RESERVOIR
    END                                                                                                                    AS Producing_Formation
   ,CASE
        WHEN Aries.LEASE LIKE '%UNIT%' THEN
            Aries.LEASE
        ELSE
            NULL
    END																													   AS Unit_Name

FROM EDW_Stage.Stage.Aries_Planning_AC_PROPERTY AS Aries
    CROSS APPLY
(
    SELECT
        CASE
            WHEN ISNUMERIC(Aries.APINO) = 1 THEN
                LTRIM(RTRIM(Aries.APINO))
            ELSE
                NULL
        END                                                           AS API_Number
       ,LTRIM(RTRIM(Aries.LEASE)) + ' ' + LTRIM(RTRIM(Aries.WELL_NO)) AS Well_Name
)                                    AS Clean_API_and_Well_Name
    LEFT JOIN Reference.US_States         AS State_Reference ON State_Reference.State_Abbreviation = Aries.STATE
    LEFT JOIN Reference.US_States         AS API_State ON API_State.API_State_Code = LEFT(Clean_API_and_Well_Name.API_Number, 2)
    LEFT JOIN Reference.US_State_Counties AS API_County ON API_State.API_State_Code = API_County.API_State_Code
                                                           AND API_County.API_County_Code = SUBSTRING(Clean_API_and_Well_Name.API_Number, 3, 3)
    LEFT JOIN Reference.Master_Lookup     AS Reserve_Category_Lookup ON Reserve_Category_Lookup.Category = 'Reserve Category'
                                                                        AND Reserve_Category_Lookup.IncomingSource = 'Aries'
                                                                        AND Reserve_Category_Lookup.IncomingValue = Aries.RCLIVE
	WHERE
    Aries.LEASE IS NOT NULL
    AND Aries.WELL_NO IS NOT NULL
    AND Aries.RCLIVE NOT LIKE '%NOWI%'
    AND Aries.OPERATOR LIKE '%antero%'
)aa)bb WHERE [Row Num] = 1
GO

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

USE [EDW]
GO

/****** Object:  View [Translate].[View_Well_Header_SigmaFlow]    Script Date: 10/12/2024 8:35:40 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





alter VIEW [Translate].[View_Well_Header_SigmaFlow]
AS
SELECT * FROM (SELECT ROW_NUMBER() OVER (PARTITION BY [Well_Name_Antero_Standard] ORDER BY SEQNUM DESC) AS [Row Num], * FROM (
SELECT DISTINCT 
    SigmaFlow.Well_Full_Name                                                                                      AS Well_Name_Original,
    Translate.fn_Standardize_Well_Name(Translate.fn_Convert_Wellbore_Name_To_Well_Name(SigmaFlow.Well_Full_Name)) AS Well_Name_Match_Key,
    Translate.fn_Title_Case_Well_Name(SigmaFlow.Well_Full_Name)                                                   AS Wellbore_Name_Title_Case,
    Translate.fn_Standardize_Well_Name(SigmaFlow.Well_Full_Name)                                                  AS Wellbore_Name_Antero_Standard,
    Translate.fn_Title_Case_Well_Name(Translate.fn_Convert_Wellbore_Name_To_Well_Name(SigmaFlow.Well_Full_Name))  AS Well_Name_Title_Case,
    Translate.fn_Standardize_Well_Name(Translate.fn_Convert_Wellbore_Name_To_Well_Name(SigmaFlow.Well_Full_Name)) AS Well_Name_Antero_Standard,
    CAST(SigmaFlow.Well_API_Number AS VARCHAR(14))                                                                AS API_Number,
    CAST(SigmaFlow.Well_SEQNUM AS INT)                                                                            AS SEQNUM,
    CAST(SigmaFlow.Well_WSN AS INT)                                                                               AS WSN_Number,
    SigmaFlow.Well_SigmaFlow_ID                                                                                   AS sigmaguid,
    CAST(SigmaFlow.Well_State AS VARCHAR(60))                                                                     AS [State_Name],
    CASE
        WHEN SigmaFlow.Rig_ICP1_Type = 'Small Rig' THEN
            SigmaFlow.Rig_ICP1_Full_Name
        ELSE
            NULL
    END                                                                                                           AS Small_Rig_Name,
    CASE
        WHEN CASE
                 WHEN SigmaFlow.Rig_ICP1_Type = 'Small Rig' THEN
                     SigmaFlow.Rig_ICP1_Full_Name
                 ELSE
                     NULL
             END IS NOT NULL THEN
            SigmaFlow.Activity_ICP1_Actual_Spud_Date
        ELSE
            NULL
    END                                                                                                           AS Small_Rig_Spud_Date_Actual,
    api_state.State_Name_Upper_Case                                                                               AS API_State_Name,
    api_county.County_Name                                                                                        AS API_County_Name,
    CASE
        WHEN SigmaFlow.Rig_ICP1_Type = 'Big Rig' THEN
            SigmaFlow.Activity_ICP1_Actual_Spud_Date
        WHEN SigmaFlow.Rig_ICP2_Type = 'Big Rig' THEN
            SigmaFlow.Activity_ICP2_Actual_Spud_Date
        ELSE
            SigmaFlow.Activity_Longstring_Actual_Spud_Date
    END                                                                                                           AS Big_Rig_Spud_Date_Actual,
    CAST(SigmaFlow.Well_Planned_Lateral_Length AS INTEGER)                                                        AS Drilled_Lateral_Length,
    CASE
        WHEN SigmaFlow.Activity_Longstring_Actual_Release_Date IS NULL THEN
            CAST(SigmaFlow.Well_Planned_Lateral_Length AS INTEGER)
        ELSE
            NULL
    END                                                                                                           AS Drilled_Lateral_Length_Planned,
	Sigmaflow.Well_Planned_Lateral_Length																		  AS Planned_Lateral_Length,
	SigmaFlow_Wells.Well_Well_Lateral_Length_Actual																  AS Actual_Lateral_Length,
	Sigmaflow_Wells.Well_Permitted_Lateral_Length																  AS Permitted_Lateral_Length,
    SigmaFlow.Prospect_Full_Name                                                                                  AS Prospect,
    SigmaFlow.Pad_Full_Name                                                                                       AS Pad_Name,
    SigmaFlow.Rig_Longstring_Full_Name                                                                            AS Big_Rig_Name,
    SigmaFlow.Well_Planned_First_Production_Date                                                                  AS First_Production_Date_Gas_Planned,
    SigmaFlow.Activity_ICP1_Planned_Spud_Date                                                                     AS Surface_Spud_Date_Planned,
    SigmaFlow.Activity_ICP1_Actual_Spud_Date                                                                      AS Surface_Spud_Date_Actual,
    SigmaFlow.Big_Rig_Planned_Spud_Date                                                                           AS Big_Rig_Spud_Date_Planned,
    SigmaFlow.Small_Rig_Planned_Spud_Date                                                                         AS Small_Rig_Spud_Date_Planned,
    SigmaFlow.Activity_Longstring_Actual_Release_Date                                                             AS Rig_Release_Date_Actual,
    SigmaFlow.Activity_Longstring_Planned_Release_Date                                                            AS Rig_Release_Date_Planned,
    SigmaFlow.Pad_SimaFlow_ID                                                                                     AS Related_Pad_Unique_Identifier,
    SigmaFlow_Wells.Well_Planned_Frac_Date                                                                        AS Frac_Start_Date,
    SigmaFlow_Wells.Well_Planned_Frac_End_Date                                                                    AS Frac_End_Date,
    SigmaFlow_Wells.Well_Imported_Drill_Out_Start_Date                                                            AS Drill_Out_Start_Date,
    SigmaFlow_Wells.Well_Imported_Drill_Out_End_Date                                                              AS Drill_Out_End_Date,
    SigmaFlow_Wells.Well_Entered_First_Production_Date                                                            AS First_Production_Date,
    SigmaFlow_Wells.Well_Imported_Completion_Group_Name                                                           AS Completion_Group_Name,
    SigmaFlow.Drilling_Group_Full_Name                                                                            AS Drilling_Group_Name,
    SigmaFlow.Unit_SigmaFlow_ID                                                                                   AS Related_Unit_Unique_Identifier,
    SigmaFlow.Unit_Full_Name                                                                                      AS Unit_Name,
    SigmaFlow.Activity_Longstring_Planned_Spud_Date                                                               AS Longstring_Spud_Date_Planned,
    IIF(SigmaFlow.Big_Rig_Planned_Spud_Date <= DATEADD(YEAR, 5, GETDATE()), 'Yes', 'No')                          AS Planned_To_Spud_In_Next_5_Years,
    IIF(SigmaFlow.Big_Rig_Planned_Spud_Date <= DATEADD(YEAR, 2, GETDATE()), 'Yes', 'No')                          AS Planned_To_Spud_In_Next_2_Years,
    SigmaFlow_Wells.I_Prospect_Well_AFE_Total_Vertical_Depth                                                      AS Planned_Total_Vertical_Depth,
    SigmaFlow_Wells.Well_Anticipated_BTU                                                                          AS BTU_Planned,
	Sigmaflow_wells.Well_HorizontalPermitApprovalDate															  AS Full_Horizontal_Permit_Approve_Date
	,Sigmaflow_Wells.Well_HorizontalPermitSubmittedDate															  AS Full_Horizontal_Permit_Submit_Date
,SigmaFlow_Wells.Well_well_Short_Permit_Approval_Date															  AS Short_Permit_Approve_Date
,sigmaflow_wells.Well_well_Short_Permit_Submittal_Date															  AS Short_Permit_Submit_Date
,PermitMods.PermitMods_Modification_Approved_Date																  AS Modified_Permit_Approve_Date
,PermitMods.PermitMods_Modificaiton_Submitted_Date																  AS Modified_Permit_Submit_Date
,Sigmaflow_wells.Well_Well_Permit_Status																		  AS Permit_Status
,Sigmaflow_wells.Well_Well_Permit_Submit_Date																	  AS Permit_Submit_Date
,CASE WHEN  PermitMods.PermitMods_Modification_Approved_Date  IS NOT NULL THEN 'Full Approved - Mod'
WHEN  PermitMods.PermitMods_Modificaiton_Submitted_Date  IS NOT NULL THEN 'Full Submitted - Mod'
 WHEN  Sigmaflow_Wells.Well_HorizontalPermitApprovalDate  IS NOT NULL THEN 'Full Approved'
     WHEN SigmaFlow_Wells.Well_HorizontalPermitSubmittedDate	IS NOT NULL THEN 'Full Submitted'
      WHEN sigmaflow_wells.Well_well_Short_Permit_Approval_Date		IS NOT NULL THEN 'Short Approved'
      WHEN sigmaflow_Wells.Well_well_Short_Permit_Submittal_Date IS NOT NULL THEN 'Short Submitted'
ELSE NULL END AS Permit_Status_Calculated
,COALESCE(PermitMods.PermitMods_Modification_Approved_Date,PermitMods.PermitMods_Modificaiton_Submitted_Date,SigmaFlow_wells.Well_HorizontalPermitApprovalDate,sigmaflow_wells.Well_HorizontalPermitSubmittedDate,sigmaflow_wells.Well_well_Short_Permit_Approval_Date,sigmaflow_Wells.Well_well_Short_Permit_Submittal_Date) AS Permit_Status_Date_Calculated
FROM
    [EDW_Stage].Stage.SigmaFlow_Data_Warehouse_Interface_Well_CR  AS SigmaFlow
    LEFT JOIN [EDW_Stage].Stage.SigmaFlow_Well_Entity_Data_Set_CR AS SigmaFlow_Wells
        ON SigmaFlow.Well_SigmaFlow_ID = SigmaFlow_Wells.Well_BusinessEntityGuid
    LEFT JOIN Reference.US_States                                                        AS api_state
        ON api_state.API_State_Code = LEFT(SigmaFlow_Wells.Well_API_Number, 2)
    LEFT JOIN Reference.US_State_Counties                                                AS api_county
        ON api_state.API_State_Code = api_county.API_State_Code
           AND api_county.API_County_Code = SUBSTRING(REPLACE(SigmaFlow_Wells.Well_API_Number, '-', ''), 3, 3)
	LEFT OUTER JOIN	  (SELECT
ROW_NUMBER() OVER (PARTITION BY
                   pm.PermitMods_ParentBusinessEntityGuid
                   ORDER BY
                   pm.PermitMods_Modificaiton_Submitted_Date DESC
                  ,pm.PermitMods_Modification_Approved_Date DESC
                  ) AS rownum
,pm.PermitMods_Modification_Approved_Date
,pm.PermitMods_Modificaiton_Submitted_Date
,pm.PermitMods_Modification_reason
,pm.PermitMods_Permit_mod_type
,pm.PermitMods_ParentBusinessEntityGuid
,CASE WHEN pm.PermitMods_Modification_Approved_Date IS NOT NULL THEN 'Full Approved - Mod'
WHEN pm.PermitMods_Modificaiton_Submitted_Date IS NOT NULL THEN 'Full Submitted - Mod' ELSE NULL END AS Permit_Status 
FROM
edw_stage.stage.Sigmaflow_PermitMods_Entity_Data_Set_CR pm) AS PermitMods
ON PermitMods.PermitMods_ParentBusinessEntityGuid = SigmaFlow_Wells.Well_BusinessEntityGuid
AND permitmods.rownum = 1 

---WHERE SigmaFlow.Well_Full_Name NOT IN (
---'KEY UNIT 2H',
---'Midas UNIT 1H',
---'Castilow UNIT 1H',
---'Girardi UNIT 2H',
---'Holtz UNIT 2H')
)aa)bb WHERE [Row Num] = 1
GO

USE [EDW]
GO

/****** Object:  View [Translate].[View_Well_Header_Wellview]    Script Date: 10/12/2024 8:37:28 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






ALTER VIEW [Translate].[View_Well_Header_Wellview]
AS
SELECT * FROM (SELECT ROW_NUMBER() OVER (PARTITION BY [Well_Name_Antero_Standard] ORDER BY aa.API_Number DESC) AS [Row Num], * FROM (
SELECT
    WellView.idwell
   ,WellView.wellname                                                                                      AS Well_Name_Original
   ,Translate.fn_Standardize_Well_Name(Translate.fn_Convert_Wellbore_Name_To_Well_Name(WellView.wellname)) AS Well_Name_Match_Key
   ,WellView.wellname                                                                                      AS Well_Name_Title_Case
   ,Translate.fn_Standardize_Well_Name(WellView.wellname)                                                  AS Well_Name_Antero_Standard
   ,Calc_API.API_Number                                                                                    AS API_Number
   ,WellView.stateprov                                                                                     AS State_Name
   ,WellView.wellconfig                                                                                    AS Configuration
   ,WellView.county                                                                                        AS County
   ,WellView.currentwellstatus1                                                                            AS Current_Operations
   ,WellView.currentwellstatus1                                                                            AS Current_Operations_Status
   ,WellView.currentwellstatus2                                                                            AS Current_Operations_SubStatus
   ,WellView.operator                                                                                      AS Operator
   ,WellView.dttmabandon                                                                                   AS Shut_In_Date
   ,WellView.userdttm4                                                                                     AS Drilling_Operations_Pause_Date
   ,WellView.userdttm3                                                                                     AS Drilling_Operations_Resume_Date
   ,WellView.Basin                                                                                         AS Basin
   ,WellView.latitude                                                                                      AS Surface_Latitude_NAD27
   ,WellView.longitude                                                                                     AS Surface_Longitude_NAD27
   ,WellView.wellide                                                                                       AS Producing_Formation
   ,CASE
        WHEN WellView.padname LIKE 'EXCO'
            THEN NULL
        WHEN WellView.padname LIKE '%Bluestone%'
            THEN NULL
        ELSE WellView.padname
    END                                                                                                    AS Pad_Name
   ,WellView.usertxt1                                                                                      AS Big_Rig_Name_Original
   ,ISNULL(Big_Rig_Name_Translated.StandardValue, WellView.usertxt1)                                       AS Big_Rig_Name
   ,WellView.usertxt2                                                                                      AS Small_Rig_Name
   ,WellView.wellidb                                                                                       AS Cost_Center
   ,WellView.workingint * 100.0                                                                            AS Working_Interest
   ,WellView.com                                                                                           AS Comments
   ,WellView.dttmfirstprod                                                                                 AS First_Sales_Date_Gas
   ,WellView.userdttm1                                                                                     AS Conductor_Spud_Date
   ,WellView.dttmspud                                                                                      AS Surface_Spud_Date
   ,WellView.dttmrr                                                                                        AS Rig_Release_Date
   ,WellView.fieldname                                                                                     AS Prospect
   ,WellView.usernum1                                                                                      AS Total_Measured_Depth
   ,WellView.usernum2                                                                                      AS Drilled_Lateral_Length
   ,WellView.usernum2                                                                                      AS Completable_Lateral_Length
   ,WellView.usernum4                                                                                      AS Completed_Lateral_Length
   ,CASE
        WHEN WellView.Basin = 'Appalachian'
             AND WellView.currentwellstatus1 NOT LIKE '%nowi%'
             AND WellView.currentwellstatus1 NOT LIKE '%unknown%'
             AND WellView.currentwellstatus1 NOT LIKE '%potential gas%'
             AND WellView.currentwellstatus1 NOT LIKE '%elected%'
             AND WellView.currentwellstatus1 NOT LIKE '%divested%'
---          AND WellView.workingint > 0.000
            THEN 'Yes'
        ELSE 'No'
    END                                                                                                    AS Critical_Date_Report
   ,api_state.State_Name_Upper_Case                                                                        AS API_State_Name
   ,api_county.County_Name                                                                                 AS API_County_Name
   ,CASE
        WHEN WellView.usertxt2 IS NOT NULL
            THEN WellView.userdttm3
        ELSE WellView.dttmspud
    END                                                                                                    AS Big_Rig_Spud_Date
   ,CASE
        WHEN WellView.usertxt2 IS NOT NULL
            THEN WellView.dttmspud
        ELSE NULL
    END                                                                                                    AS Small_Rig_Spud_Date
   ,WellView.dttmwelllic                                                                                   AS Completion_Date
   ,Stimulation_Summary.number_of_stages                                                                   AS Actual_Number_Of_Frac_Stages
   ,ISNULL(WellView.userdttm2, Stimulation_Summary.First_Frac_Start)                                       AS Frac_Start_Date_Actual
   ,WellView.userdttm5                                                                                     AS Frac_End_Date_Actual
   ,IIF(WellView.usernum3 IS NOT NULL OR WellView.dttmspud IS NOT NULL, 'Yes', 'No')                       AS Planned_To_Spud_In_Next_5_Years
   ,IIF(WellView.usernum3 IS NOT NULL OR WellView.dttmspud IS NOT NULL, 'Yes', 'No')                       AS Planned_To_Spud_In_Next_2_Years
   ,CASE WHEN WellView.operator LIKE 'ANTERO%' THEN 1 ELSE 0 END                                           AS Is_Antero_Well
   ,WellView.syscreatedate                                                                                 AS WellView_Create_Date
   ,WellView.syssecuritytyp                                                                                AS Security_Type
   ,CAST(IIF(WellView.syssecuritytyp = 'Tight', 1, 0) AS BIT)                                              AS Is_Tight
   ,WellView.Casing_Set_Depth
   ,WellView.TD_Date
   ,WellView.Max_TVD
   ,WellView.Last_Survey_MD
   ,WellView.Last_Survey_TVD
   ,WellView.Spud_Of_Curve_Date
   ,CASE
        WHEN WellView.jobida LIKE '%IPC%'
            THEN WellView.Spud_Of_Curve_Date
        ELSE COALESCE(WellView.userdttm4, WellView.Spud_Of_Curve_Date)
    END                                                                                                    AS Top_Hole_End_Date
    FROM
    Translate.WellView_WV100_And_WV100CalcUS             AS WellView
        LEFT JOIN Translate.WellView_Stimulation_Summary AS Stimulation_Summary
            ON Stimulation_Summary.idwell = WellView.idwell
        LEFT JOIN Reference.Master_Lookup                AS Big_Rig_Name_Translated
            ON Big_Rig_Name_Translated.Category = 'Rig Name'
               AND  Big_Rig_Name_Translated.IncomingSource = 'WellView'
               AND  Big_Rig_Name_Translated.IncomingValue = WellView.usertxt1
        CROSS APPLY
        (
            SELECT
            IIF(ISNUMERIC(WellView.wellida) = 1 AND LEN(WellView.wellida) = 14, WellView.wellida, NULL) AS API_Number
        )                                                AS Calc_API
        LEFT JOIN Reference.US_States         AS api_state
            ON api_state.API_State_Code = LEFT(Calc_API.API_Number, 2)
        LEFT JOIN Reference.US_State_Counties AS api_county
            ON api_state.API_State_Code = api_county.API_State_Code
               AND  api_county.API_County_Code = SUBSTRING(Calc_API.API_Number, 3, 3)
    WHERE
    WellView.Basin LIKE '%appalachia%'
)aa)bb WHERE [Row Num] = 1
GO

USE [EDW]
GO

/****** Object:  View [Translate].[View_Well_Header_GIS]    Script Date: 10/12/2024 7:22:55 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




---SET QUOTED_IDENTIFIER ON
---SET ANSI_NULLS ON
---GO
---
---
---
ALTER VIEW [Translate].[View_Well_Header_GIS]
AS
    WITH Well
    AS (
           SELECT
            well.*
          ,CASE
               WHEN well.Shape.STNumPoints() <= 3
                    AND well.Shape.STEndPoint().STBuffer(well.Shape.STEndPoint().STDistance(well.Shape.STPointN(well.Shape.STNumPoints() - 1)) / 2).STIntersection(well.Shape).STEndPoint().STIntersection(well.Shape.STEndPoint()).STEndPoint().STCrosses(well.Shape.STEndPoint()) = 0
                   THEN well.Shape.STEndPoint().STBuffer(well.Shape.STEndPoint().STDistance(well.Shape.STPointN(well.Shape.STNumPoints() - 1)) / 2).STIntersection(well.Shape).STStartPoint()
               WHEN well.Shape.STNumPoints() <= 3
                    AND well.Shape.STEndPoint().STBuffer(well.Shape.STEndPoint().STDistance(well.Shape.STPointN(well.Shape.STNumPoints() - 1)) / 2).STIntersection(well.Shape).STEndPoint().STIntersection(well.Shape.STEndPoint()).STEndPoint().STCrosses(well.Shape.STEndPoint()) IS NULL
                   THEN well.Shape.STEndPoint().STBuffer(well.Shape.STEndPoint().STDistance(well.Shape.STPointN(well.Shape.STNumPoints() - 1)) / 2).STIntersection(well.Shape).STEndPoint()
               WHEN well.Shape.STNumPoints() >= 3
                    AND well.Shape.STEndPoint().STBuffer(well.Shape.STEndPoint().STDistance(well.Shape.STStartPoint()) / 2).STIntersection(well.Shape).STEndPoint().STIntersection(well.Shape.STEndPoint()).STEndPoint().STCrosses(well.Shape.STEndPoint()) IS NULL
                   THEN well.Shape.STEndPoint().STBuffer(well.Shape.STEndPoint().STDistance(well.Shape.STStartPoint()) / 2).STIntersection(well.Shape).STEndPoint()
               WHEN well.Shape.STNumPoints() >= 3
                    AND well.Shape.STEndPoint().STBuffer(well.Shape.STEndPoint().STDistance(well.Shape.STStartPoint()) / 2).STIntersection(well.Shape).STEndPoint().STIntersection(well.Shape.STEndPoint()).STEndPoint().STCrosses(well.Shape.STEndPoint()) = 0
                   THEN well.Shape.STEndPoint().STBuffer(well.Shape.STEndPoint().STDistance(well.Shape.STStartPoint()) / 2).STIntersection(well.Shape).STStartPoint()
           END                                                    AS MidPointShape
          ,well.Shape.STEndPoint()                                AS EndPointShape
          ,well_nad27.Shape                                       AS shape_nad27
          ,well_nad27.Shape.MakeValid().STStartPoint().ToString() AS Surface_Location
          ,well_nad27.Shape.MakeValid().STStartPoint()            AS Surface_Location_Shape
          ,well_nad27.Shape.MakeValid().STEndPoint().ToString()   AS Bottom_Hole_Location
          ,well_nad27.Shape.MakeValid().STEndPoint()              AS BottomHole_Location_Shape
           FROM
            EDW_Stage.Stage.GIS_AnteroHorizontal                       well
               LEFT JOIN EDW_Stage.Stage.GIS_AnteroHorizontal_Nad_1927 well_nad27
                   ON HASHBYTES('SHA1', CONCAT(well.PetraSequenceNumber, well.PetraWellName, well.GISWellName)) = HASHBYTES('SHA1', CONCAT(well_nad27.PetraSequenceNumber, well_nad27.PetraWellName, well_nad27.GISWellName))
           WHERE
            NOT (
                    well_nad27.PetraSequenceNumber = -99999
                    AND well.PetraWellName IS NULL
                    AND well.GISWellName IS NULL
                ))

    SELECT * FROM (SELECT ROW_NUMBER() OVER (PARTITION BY [Well_Name_Antero_Standard] ORDER BY SEQNUM DESC) AS [Row Num], * FROM (
    SELECT
    CAST(HASHBYTES('SHA1', CONCAT(Well.GISWellName, Well.PetraWellName, Well.PetraAPI, Well.PetraSequenceNumber)) AS VARBINARY(32))                                                           AS GIS_ID
   ,Well.AreaofOperations                                                                                                                                                                     AS Area_Of_Operations
   ,Well.GISFormation                                                                                                                                                                         AS Target_Formation
   ,CAST(NULLIF(Well.PetraSequenceNumber, '-99999') AS FLOAT)                                                                                                                                 AS SEQNUM
   ,CASE WHEN LEN(Well.PetraAPI) = 14 THEN Well.PetraAPI ELSE NULL END                                                                                                                        AS API_number
   ,COALESCE(Translate.fn_Convert_Wellbore_Name_To_Well_Name(Well.GISWellName), Translate.fn_Convert_Wellbore_Name_To_Well_Name(Well.PetraWellName))                                          AS Well_Name
   ,Translate.fn_Standardize_Well_Name(Translate.fn_Convert_Wellbore_Name_To_Well_Name(Well.GISWellName))                                                                                     AS Well_Name_Antero_Standard
   ,COALESCE(Well.GISWellName, Well.PetraWellName)                                                                                                                                            AS Wellbore_Name
   ,Translate.fn_Standardize_Well_Name(Well.GISWellName)                                                                                                                                      AS Wellbore_Name_Antero_Standard
   ,CASE
        WHEN LEN(PetraAPI) = 14
            THEN CASE
                     WHEN LEFT(PetraAPI, 2) = '34'
                         THEN 'Ohio'
                     WHEN LEFT(PetraAPI, 2) = '37'
                         THEN 'Pennsylvania'
                     WHEN LEFT(PetraAPI, 2) = '47'
                         THEN 'West Virginia'
                     ELSE NULL
                 END
        ELSE CASE
                 WHEN Well.AreaofOperations = 'Marcellus'
                     THEN 'West Virginia'
                 WHEN Well.AreaofOperations = 'Utica'
                     THEN 'Ohio'
                 ELSE NULL
             END
    END                                                                                                                                                                                       AS API_State_Name
   ,Well.GISWellStatus                                                                                                                                                                        AS Well_Status
   ,Well.GISPadName                                                                                                                                                                           AS Pad_Name
   ,Well.RigName                                                                                                                                                                              AS Big_Rig_Name
   ,Well.GISLateralLength_ft                                                                                                                                                                  AS Planned_Lateral_Length
   ,'Horizontal'                                                                                                                                                                              AS Configuration
   ,1                                                                                                                                                                                         AS Is_Antero_Well
   ,'Antero Resources'                                                                                                                                                                        AS Operator
   ,Well.Shape                                                                                                                                                                                AS Wellbore_Shape_NAD27_BLM
   ,Well.shape_nad27                                                                                                                                                                          AS Wellbore_Shape
   ,REPLACE(SUBSTRING(Well.Surface_Location, 1, PATINDEX('%[0-9] [0-9]%', Well.Surface_Location)), 'POINT (', '')                                                                             AS Surface_Longitude_NAD27
   ,SUBSTRING(Well.Surface_Location, PATINDEX('%[0-9] [0-9]%', Well.Surface_Location) + 1, LEN(Well.Surface_Location) - PATINDEX('%[0-9] [0-9]%', Well.Surface_Location) - 1)                 AS Surface_Latitude_NAD27
   ,REPLACE(SUBSTRING(Well.Bottom_Hole_Location, 1, PATINDEX('%[0-9] [0-9]%', Well.Bottom_Hole_Location)), 'POINT (', '')                                                                     AS BottomHole_Longitude_NAD27
   ,SUBSTRING(Well.Bottom_Hole_Location, PATINDEX('%[0-9] [0-9]%', Well.Bottom_Hole_Location) + 1, LEN(Well.Bottom_Hole_Location) - PATINDEX('%[0-9] [0-9]%', Well.Bottom_Hole_Location) - 1) AS BottomHole_Latitude_NAD27
   ,Well.Surface_Location_Shape
   ,Well.BottomHole_Location_Shape
   ,Unit.UnitName                                                                                                                                                                             AS Unit_Name
   ,Unit.Prospect                                                                                                                                                                             AS Prospect
   ,wahl.BTUGridCode                                                                                                                                                                          AS Btu_Grid_Code
    ,wahl.MidpointLongitude AS Midpoint_Longitude
	,wahl.MidpointLatitude AS Midpoint_Latitude
	,wahl.EasterlySpacingAllLateral AS Spacing_East
    ,wahl.WesterlySpacingAllLateral AS Spacing_West
	,wahl.WeeklyRigScheduleLateralSpacing AS Planned_Lateral_Spacing_Raw
	,CASE WHEN wahl.WeeklyRigScheduleLateralSpacing >= 0    AND wahl.WeeklyRigScheduleLateralSpacing <= 745 
	      THEN 660.0
		  WHEN wahl.WeeklyRigScheduleLateralSpacing >= 746  AND wahl.WeeklyRigScheduleLateralSpacing <= 915 
	      THEN 830.0
		  WHEN wahl.WeeklyRigScheduleLateralSpacing >= 916  AND wahl.WeeklyRigScheduleLateralSpacing <= 1160 
	      THEN 1000.0
		  WHEN (wahl.WeeklyRigScheduleLateralSpacing >= 1161 OR wahl.WeeklyRigScheduleLateralSpacing IS NULL)
	      THEN 1320.0
		  WHEN wahl.WeeklyRigScheduleLateralSpacing < 0
	      THEN -999
 	 END AS Planned_Lateral_Spacing
	,wahl.OilYieldGridCode AS Oil_Yield_Grid_Code
	,wahl.TypeCurveAreaName AS Type_Curve_Name
	,wahl.GeoUnitMappedUnitAcres AS Unit_Acreage
	,wahl.PadOrientation
	,mra.CompressorName AS Compressor_Name
	,mra.CompressorArea AS Compressor_Area
	,mra.GatheringFeeArea AS Gathering_Fee_Area 
	,wahl.RawReserveCategory AS Raw_Reserve_Category
	FROM
    Well
        LEFT JOIN EDW_Stage.Stage.GIS_UNITSHAPE_Nad_1927_Blm    Unit_Nad27_BLM
            ON Unit_Nad27_BLM.Shape_Geometry.STIntersects(Well.MidPointShape) = 1
        LEFT JOIN EDW_Stage.Stage.GIS_UNITSHAPE                 Unit
            ON Unit_Nad27_BLM.OBJECTID = Unit.OBJECTID
        LEFT JOIN EDW_Stage.Stage.GIS_Well_RPT_ARHorizontalReportLoad wahl
            ON wahl.PetraWellName = Well.PetraWellName
               AND  wahl.PetraEDWAPI = Well.PetraAPI
               AND  wahl.PetraSequenceNumber = Well.PetraSequenceNumber
---Non-Uniqueness starts here
        LEFT JOIN edw_stage.stage.[GIS_MIDSTREAMRESERVESATTRIBUTES] mra
		    ON well.PetraSequenceNumber = mra.seqnum
    WHERE
    CASE
        WHEN (
                 Well.PetraWellName LIKE '%HD%'
                 OR Well.PetraWellName LIKE '%DEEP%'
             )
             AND Unit.UnitName LIKE '%DEEP%'
            THEN 1
        WHEN Well.PetraWellName LIKE '%HD%'
             AND Unit.UnitName NOT LIKE '%DEEP%'
            THEN 0
        WHEN (
                 Well.PetraWellName NOT LIKE '%HD%'
                 OR Well.PetraWellName NOT LIKE '%DEEP%'
             )
             AND Unit.UnitName LIKE '%DEEP%'
            THEN 0
        ELSE 1
    END = 1
)aa)bb WHERE [Row Num] = 1

GO

USE [EDW]
GO

/****** Object:  View [Translate].[View_Well_Header_FracSchedule]    Script Date: 10/12/2024 7:22:43 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [Translate].[View_Well_Header_FracSchedule]
AS
SELECT * FROM (SELECT ROW_NUMBER() OVER (PARTITION BY [Well_Name_Antero_Standard] ORDER BY SEQNUM DESC) AS [Row Num], * FROM (
SELECT
    CAST(HASHBYTES('SHA1', CONCAT(fs.Well_Name, fs.SEQNUM)) AS VARBINARY(32))                         AS FracSchedule_ID,
    TRY_CAST(us.State_Name_Upper_Case AS VARCHAR(35))                                                 AS State_Name,
    CAST(fs.Well_Name AS VARCHAR(60))                                                                 AS Well_Name_Original,
    Translate.fn_Standardize_Well_Name(Translate.fn_Convert_Wellbore_Name_To_Well_Name(fs.Well_Name)) AS Well_Name_Match_Key,
    Translate.fn_Convert_Wellbore_Name_To_Well_Name(fs.Well_Name)                                     AS Well_Name_Title_Case,
    Translate.fn_Standardize_Well_Name(Translate.fn_Convert_Wellbore_Name_To_Well_Name(fs.Well_Name)) AS Well_Name_Antero_Standard,
    Translate.fn_Standardize_Well_Name(fs.Well_Name)                                                  AS Wellbore_Name_Antero_Standard,
    TRY_CAST(fs.Well_Name AS VARCHAR(300))                                                            AS Wellbore_Name_Title_Case,
	TRY_CAST(fs.Well_Name AS VARCHAR(300))                                                            AS Wellbore_Name_Original,
    TRY_CAST(fs.SEQNUM AS INT)                                                                        AS SEQNUM,
    CAST(fs.Prospect AS VARCHAR(50))                                                                  AS Prospect,
    fs.Completions_Group_Name,
    fs.Spud_Date AS Longstring_Spud_Date,
    fs.Drilled_Lateral_Length, --Taken from SigmaFlow or WellView
    fs.Total_Water_Needed_For_Frac,
	fs.Well_Rig_Release_Date,
    fs.Well_Frac_Start_Date_Planned AS Frac_Start_Date_Planned,
    fs.Well_Frac_End_Date_Planned AS Frac_End_Date_Planned,
    fs.Plug_Drillout_Start_Date AS Plug_Drillout_Start_Date_Planned,
    fs.Plug_Drillout_Days AS Plug_Drillout_Days_Planned,
    fs.Plug_Drillout_End_Date AS Plug_Drillout_End_Date_Planned,
    CAST(fs.First_Production_Date AS DATETIME) AS First_Production_Date_Gas_Planned,
    fs.Design_Water_BBls_Per_Foot AS Design_Water_BBls_Per_Foot_Planned,
    fs.Design_Sand_Lbs_Per_Foot AS Design_Sand_Lbs_Per_Foot_Planned,
	fs.Well_Remaining_Stages ,
	fs.Turn_In_Line_Date,
	fs.AFE_Stage_Cost
FROM
    Translate.Frac_Schedule       AS fs
    LEFT JOIN Reference.US_States AS us
        ON fs.State_Name = us.State_Name_Upper_Case
)aa)bb WHERE [Row Num] = 1
GO

USE [EDW]
GO

/****** Object:  View [Translate].[View_Well_Header_Enertia]    Script Date: 10/12/2024 7:22:31 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







ALTER VIEW [Translate].[View_Well_Header_Enertia]
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











