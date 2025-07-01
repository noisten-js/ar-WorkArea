USE [EDW]
GO

/****** Object:  View [Translate].[View_Well_Header_SigmaFlow]    Script Date: 11/1/2024 8:19:51 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






CREATE VIEW [Translate].[View_Well_Header_SigmaFlow]
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

