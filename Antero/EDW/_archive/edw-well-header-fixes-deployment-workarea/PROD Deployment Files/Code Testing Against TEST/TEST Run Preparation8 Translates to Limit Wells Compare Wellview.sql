USE [EDW]
GO

/****** Object:  View [Translate].[View_Well_Header_Wellview]    Script Date: 11/1/2024 8:18:09 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







CREATE VIEW [Translate].[View_Well_Header_Wellview]
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

