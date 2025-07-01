USE [EDW]
GO

/****** Object:  View [Translate].[View_Well_Header_FracSchedule]    Script Date: 11/1/2024 8:18:34 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [Translate].[View_Well_Header_FracSchedule]
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

