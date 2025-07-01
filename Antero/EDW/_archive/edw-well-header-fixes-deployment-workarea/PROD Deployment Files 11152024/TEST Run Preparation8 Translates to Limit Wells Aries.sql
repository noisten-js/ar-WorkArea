USE [EDW]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER VIEW [Translate].[View_Well_Header_Aries]
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
   ,Aries.Perfed_Lateral																								                                                   AS Completed_Lateral_Length
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

