----refresh SigmaFlow,AFE, Creator, CDR

USE [EDW]
GO

/****** Object:  View [Master].[Dim_Well_Header_Column Order]    Script Date: 10/31/2024 1:08:44 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER VIEW [Master].[Dim_Well_Header]
AS
---4
SELECT
       CAST(NULL AS VARCHAR(11)) AS Type
      ,[Well_Name]
      ,[Sources]
      ,CAST(NULL AS VARCHAR(10)) AS [Sources Core]
      ,CAST(NULL AS VARCHAR(10)) AS [Sources Max]
      ,[SEQNUM]
      ,[API_Number]
      ,[Cost_Center]
      ,[Well_Header_UID]
      ,[Petra_ID]
      ,[Aries_ID]
      ,[SigmaFlow_ID]
      ,[WellView_ID]
      ,[Merrick_ID]
      ,[Enertia_ID]
      ,[FracSchedule_ID]
      ,[GIS_ID]
      ,[API_County_Name]
      ,[API_State_Name]
      ,[Big_Rig_Name]
      ,[Big_Rig_Spud_Date]
      ,[BTU_Grid_Code]
      ,[Configuration]
      ,[County]
      ,[Critical_Date_Report]
      ,[Current_Operations_Status]
      ,[Current_Operations_SubStatus]
      ,[Current_Production_Status]
      ,[Drilling_Operations_Pause_Date]
      ,[Drilling_Operations_Resume_Date]
      ,[First_Production_Date]
      ,[Frac_End_Date]
      ,[Frac_Start_Date]
      ,[Net_Revenue_Interest]
      ,[Operations_Comments]
      ,[Operator]
      ,[Pad_AFE_Number]
      ,[Pad_Name]
      ,[Pad_Name_Antero_Standard]
      ,[Producing_Formation]
      ,[PropNum]
      ,[Prospect]
      ,[Raw_Reserve_Category]
      ,[Reserve_Category]
      ,[Shut_In_Date]
      ,[Small_Rig_Name]
      ,[Small_Rig_Spud_Date]
      ,[State_Name]
      ,[Surface_Latitude_NAD27]
      ,[Surface_Longitude_NAD27]
      ,[Total_Vertical_Depth]
      ,[Unit_Name]
      ,[Unit_Name_Antero_Standard]
      ,[Well_AFE_Number]
      ,[Well_Name_Antero_Standard]
      ,[Well_Number]
      ,[Wellbore_Name_Antero_Standard]
      ,[Working_Interest]
      ,[WSN_Number]
      ,[Big_Rig_Spud_Date_Actual]
      ,[Big_Rig_Spud_Date_Planned]
      ,[Completion_Date_Actual]
      ,[Conductor_Spud_Date_Actual]
      ,[Drill_Out_End_Date_Planned]
      ,[Drill_Out_Start_Date_Planned]
      ,[Drilled_Lateral_Length_Actual]
      ,[Drilled_Lateral_Length_Planned]
      ,[Drilled_Lateral_Length]
      ,[Completable_Lateral_Length]
      ,[Completed_Lateral_length]
      ,[Cased_Lateral_Length]
      ,[Planned_Lateral_Length]
      ,[First_Production_Date_Gas_Actual]
      ,[First_Production_Date_Gas_Planned]
      ,[First_Production_Date_Oil_Actual]
      ,[First_Sales_Date_Gas_Actual]
      ,[First_Sales_Date_Oil_Actual]
      ,[Frac_End_Date_Actual]
      ,[Frac_Start_Date_Actual]
      ,[Rig_Release_Date_Actual]
      ,[Rig_Release_Date_Planned]
      ,[Small_Rig_Spud_Date_Actual]
      ,[Small_Rig_Spud_Date_Planned]
      ,[Surface_Spud_Date_Actual]
      ,[Surface_Spud_Date_Planned]
      ,[Total_Measured_Depth_Actual]
      ,[Production_Id]
      ,[First_Production_Date_EDW]
      ,[Pad_Name_Pad_Header]
      ,[Unit_Name_Unit_Header]
      ,[Well_Name_Pad_Header]
      ,[Well_Name_Unit_Header]
      ,[Longstring_Spud_Date_Planned]
      ,[Longstring_Spud_Date_Actual]
      ,[Critical_Date_Report_Default]
      ,[Ground_Elevation]
      ,[Pad_Id]
      ,[Unit_Id]
      ,[Area_Name]
      ,[Group_Name]
      ,[Route_Name]
      ,[Planned_To_Spud_In_Next_2_Years]
      ,[Planned_To_Spud_In_Next_5_Years]
      ,[Planned_To_Spud_In_Next_5_Years_Default]
      ,[Planned_To_Spud_In_Next_2_Years_Default]
      ,[BottomHole_Latitude_NAD27]
      ,[BottomHole_Longitude_NAD27]
      ,[Design_Sand_Lbs_Per_Foot_Planned]
      ,[Design_Water_BBls_Per_Foot_Planned]
      ,[Frac_End_Date_Planned]
      ,[Plug_Drillout_Days_Planned]
      ,[Plug_Drillout_End_Date_Planned]
      ,[Plug_Drillout_Start_Date_Planned]
      ,[Well_Name_Aries]
      ,[Well_Name_Antero_Standard_Aries]
      ,[Wellbore_Name_Antero_Standard_Aries]
      ,[State_Name_Aries]
      ,[Configuration_Aries]
      ,[County_Aries]
      ,[Prospect_Aries]
      ,[API_Number_Aries]
      ,[Pad_Name_Aries]
      ,[Pad_Name_Antero_Standard_Aries]
      ,[SEQNUM_Aries]
      ,[Well_Number_Aries]
      ,[Cased_Lateral_Length_Aries]
      ,[Completed_Lateral_Length_Aries]
      ,[PropNum_Aries]
      ,[Current_Operations_Aries]
      ,[Total_Measured_Depth_Actual_Aries]
      ,[Total_Vertical_Depth_Aries]
      ,[Operator_Aries]
      ,[Working_Interest_Aries]
      ,[Net_Revenue_Interest_Aries]
      ,[First_Production_Date_Gas_Coalesced_Aries]
      ,[First_Production_Date_Gas_Actual_Aries]
      ,[Surface_Spud_Date_Actual_Aries]
      ,[Surface_Spud_Date_Aries]
      ,[Small_Rig_Spud_Date_Actual_Aries]
      ,[Shut_In_Date_Aries]
      ,[Basin_Aries]
      ,[Raw_Reserve_Category_Aries]
      ,[RCNUM_Aries]
      ,[Reserve_Category_Aries]
      ,[API_State_Name_Aries]
      ,[API_County_Name_Aries]
      ,[Surface_Latitude_NAD27_Aries]
      ,[Surface_Longitude_NAD27_Aries]
      ,[Producing_Formation_Aries]
      ,[Eur_Gas_All_Aries]
      ,[Eur_BCF_1000FT_Aries]
      ,[EUR_PDP_ALL_BCFE_Aries]
      ,[EUR_BCFE_1000FT_Aries]
      ,[EUR_BO_ALL_Aries]
      ,[EUR_BO/FT_Aries]
      ,[Unit_Name_Aries]
      ,[Longstring_Spud_Date_Actual_Aries]
      ,[Longstring_Spud_Date_Planned_Aries]
      ,[Well_Name_Enertia]
      ,[Well_Name_Antero_Standard_Enertia]
      ,[Wellbore_Name_Antero_Standard_Enertia]
      ,[State_Name_Enertia]
      ,[County_Enertia]
      ,[API_Number_Enertia]
      ,[Pad_Name_Enertia]
      ,[Pad_Name_Antero_Standard_Enertia]
      ,[SEQNUM_Enertia]
      ,[EnertiaID_Enertia]
      ,[Current_Operations_Enertia]
      ,[Operator_Enertia]
      ,[Cost_Center_Enertia]
      ,[Working_Interest_Enertia]
      ,[Net_Revenue_Interest_Enertia]
      ,[First_Production_Date_Gas_Actual_Enertia]
      ,[First_Production_Date_Oil_Actual_Enertia]
      ,[API_State_Name_Enertia]
      ,[API_County_Name_Enertia]
      ,[Pad_AFE_Number_Enertia]
      ,[Well_AFE_Number_Enertia]
      ,[Unit_Name_Enertia]
      ,[Completions_Group_Name_FracSchedule]
      ,[Design_Sand_Lbs_Per_Foot_Planned_FracSchedule]
      ,[Design_Water_BBls_Per_Foot_Planned_FracSchedule]
      ,[Drilled_Lateral_Length_FracSchedule]
      ,[Frac_End_Date_Planned_FracSchedule]
      ,[Longstring_Spud_Date_FracSchedule]
      ,[Plug_Drillout_Days_Planned_FracSchedule]
      ,[Plug_Drillout_End_Date_Planned_FracSchedule]
      ,[Plug_Drillout_Start_Date_Planned_FracSchedule]
      ,[Prospect_FracSchedule]
      ,[SEQNUM_FracSchedule]
      ,[Pad_Name_FracSchedule]
      ,[Pad_Name_Antero_Standard_FracSchedule]
      ,[State_Name_FracSchedule]
      ,[Total_Water_Needed_For_Frac_FracSchedule]
      ,[Well_Name_Antero_Standard_FracSchedule]
      ,[Well_Name_FracSchedule]
      ,[Well_Rig_Release_Date_FracSchedule]
      ,[Wellbore_Name_Antero_Standard_FracSchedule]
      ,[First_Production_Date_Gas_Planned_FracSchedule]
      ,[Frac_Start_Date_Planned_FracSchedule]
      ,[Pad_Rig_Release_Date_FracSchedule]
      ,[Well_Name_Merrick]
      ,[Well_Name_Antero_Standard_Merrick]
      ,[Wellbore_Name_Antero_Standard_Merrick]
      ,[State_Name_Merrick]
      ,[Configuration_Merrick]
      ,[County_Merrick]
      ,[API_Number_Merrick]
      ,[Pad_Name_Merrick]
      ,[Pad_Name_Antero_Standard_Merrick]
      ,[Well_Number_Merrick]
      ,[EnertiaID_Merrick]
      ,[PropNum_Merrick]
      ,[Current_Operations_Merrick]
      ,[Cost_Center_Merrick]
      ,[First_Production_Date_Gas_Actual_Merrick]
      ,[First_Production_Date_Oil_Actual_Merrick]
      ,[First_Sales_Date_Gas_Actual_Merrick]
      ,[First_Sales_Date_Oil_Actual_Merrick]
      ,[Shut_In_Date_Merrick]
      ,[API_State_Name_Merrick]
      ,[API_County_Name_Merrick]
      ,[Current_Production_Status_Merrick]
      ,[Area_Name_Merrick]
      ,[Group_Name_Merrick]
      ,[Route_Name_Merrick]
      ,[Well_Name_Petra]
      ,[Well_Name_Antero_Standard_Petra]
      ,[Wellbore_Name_Antero_Standard_Petra]
      ,[State_Name_Petra]
      ,[Configuration_Petra]
      ,[County_Petra]
      ,[Prospect_Petra]
      ,[API_Number_Petra]
      ,[Pad_Name_Petra]
      ,[Pad_Name_Antero_Standard_Petra]
      ,[WSN_Number_Petra]
      ,[SEQNUM_Petra]
      ,[Well_Number_Petra]
      ,[Drilled_Lateral_Length_Planned_Petra]
      ,[Drilled_Lateral_Length_Actual_Petra]
      ,[Cased_Lateral_Length_Petra]
      ,[Completable_Lateral_Length_Petra]
      ,[Scrubbed_Lateral_Length_Petra]
      ,[USA_Sticks_Lateral_Length_Petra]
      ,[Third_Party_Lateral_Length_Petra]
      ,[Estimated_Lateral_Length_Petra]
      ,[Drilled_Lateral_Length_Petra]
      ,[Big_Rig_Name_Petra]
      ,[Current_Operations_Petra]
      ,[Total_Measured_Depth_Actual_Petra]
      ,[Operator_Petra]
      ,[Big_Rig_Spud_Date_Actual_Petra]
      ,[Completion_Date_Actual_Petra]
      ,[API_State_Name_Petra]
      ,[API_County_Name_Petra]
      ,[Surface_Latitude_NAD27_Petra]
      ,[Surface_Longitude_NAD27_Petra]
      ,[Producing_Formation_Petra]
      ,[Unit_Name_Petra]
      ,[Ground_Elevation_Petra]
      ,[Symbol_Code_Petra]
      ,[BottomHole_Latitude_NAD27_Petra]
      ,[BottomHole_Longitude_NAD27_Petra]
      ,[Well_Name_SigmaFlow]
      ,[Well_Name_Antero_Standard_SigmaFlow]
      ,[Wellbore_Name_Antero_Standard_SigmaFlow]
      ,[State_Name_SigmaFlow]
      ,[County_SigmaFlow]
      ,[Prospect_SigmaFlow]
      ,[API_Number_SigmaFlow]
      ,[Pad_Name_SigmaFlow]
      ,[Pad_Name_Antero_Standard_Sigmaflow]
      ,[WSN_Number_SigmaFlow]
      ,[SEQNUM_SigmaFlow]
      ,[Drilled_Lateral_Length_Planned_SigmaFlow]
      ,[Drilled_Lateral_Length_SigmaFlow]
      ,[Actual_Lateral_Length_Sigmaflow]
      ,[Planned_Lateral_Length_Sigmaflow]
      ,[Permitted_Lateral_Length_Sigmaflow]
      ,[Big_Rig_Name_SigmaFlow]
      ,[Small_Rig_Name_SigmaFlow]
      ,[First_Production_Date_Gas_Planned_SigmaFlow]
      ,[Surface_Spud_Date_Planned_SigmaFlow]
      ,[Surface_Spud_Date_Actual_SigmaFlow]
      ,[Big_Rig_Spud_Date_Actual_SigmaFlow]
      ,[Big_Rig_Spud_Date_Planned_SigmaFlow]
      ,[Small_Rig_Spud_Date_Actual_SigmaFlow]
      ,[Small_Rig_Spud_Date_Planned_SigmaFlow]
      ,[Rig_Release_Date_Actual_SigmaFlow]
      ,[Rig_Release_Date_Planned_SigmaFlow]
      ,[API_State_Name_SigmaFlow]
      ,[API_County_Name_SigmaFlow]
      ,[Frac_Start_Date_SigmaFlow]
      ,[Frac_End_Date_SigmaFlow]
      ,[Drill_Out_Start_Date_Planned_SigmaFlow]
      ,[Drill_Out_End_Date_Planned_SigmaFlow]
      ,[Unit_Name_SigmaFlow]
      ,[Longstring_Spud_Date_Planned_SigmaFlow]
      ,[Planned_To_Spud_In_Next_5_Years_SigmaFlow]
      ,[Planned_To_Spud_In_Next_2_Years_SigmaFlow]
      ,[Permit_Status_Sigmaflow]
      ,[Permit_Status_Date_Sigmaflow]
      ,[Well_Name_WellView]
      ,[Well_Name_Antero_Standard_WellView]
      ,[State_Name_WellView]
      ,[Configuration_WellView]
      ,[County_WellView]
      ,[Prospect_WellView]
      ,[API_Number_WellView]
      ,[Pad_Name_WellView]
      ,[Pad_Name_Antero_Standard_Wellview]
      ,[Completable_Lateral_Length_WellView]
      ,[Completed_Lateral_Length_Wellview]
      ,[Big_Rig_Name_WellView]
      ,[Current_Operations_WellView]
      ,[Total_Measured_Depth_Actual_WellView]
      ,[Operator_WellView]
      ,[Small_Rig_Name_WellView]
      ,[Cost_Center_WellView]
      ,[Working_Interest_WellView]
      ,[Net_Revenue_Interest_WellView]
      ,[Operations_Comments_WellView]
      ,[First_Sales_Date_Gas_Actual_WellView]
      ,[Conductor_Spud_Date_Actual_WellView]
      ,[Surface_Spud_Date_Actual_WellView]
      ,[Big_Rig_Spud_Date_Actual_WellView]
      ,[Small_Rig_Spud_Date_Actual_WellView]
      ,[Completion_Date_Actual_WellView]
      ,[Shut_In_Date_WellView]
      ,[Rig_Release_Date_Actual_WellView]
      ,[Drilling_Operations_Pause_Date_WellView]
      ,[Drilling_Operations_Resume_Date_WellView]
      ,[Basin_WellView]
      ,[Critical_Date_Report_WellView]
      ,[API_State_Name_WellView]
      ,[API_County_Name_WellView]
      ,[Surface_Latitude_NAD27_WellView]
      ,[Surface_Longitude_NAD27_WellView]
      ,[Current_Operations_Status_WellView]
      ,[Current_Operations_SubStatus_WellView]
      ,[Producing_Formation_WellView]
      ,[Frac_Start_Date_Actual_WellView]
      ,[Frac_End_Date_Actual_WellView]
      ,[Planned_To_Spud_In_Next_5_Years_WellView]
      ,[Planned_To_Spud_In_Next_2_Years_WellView]
      ,[Casing_Set_Depth_Wellview]
      ,[TD_Date_Wellview]
      ,[Top_Hole_End_Date_Wellview]
      ,[Max_TVD_Wellview]
      ,[Last_Survey_MD_Wellview]
      ,[Last_Survey_TVD_Wellview]
      ,[Longstring_Spud_Date_Actual_Wellview]
      ,[API_Number_GIS]
      ,[API_State_Name_GIS]
      ,[Big_Rig_Name_GIS]
      ,[BottomHole_Latitude_NAD27_GIS]
      ,[BottomHole_Longitude_NAD27_GIS]
      ,[BTU_Grid_Code_GIS]
      ,[Configuration_GIS]
      ,[Planned_Lateral_Length_GIS]
      ,[Is_Antero_Well_GIS]
      ,[Midpoint_Latitude_GIS]
      ,[Midpoint_Longitude_GIS]
      ,[Operator_GIS]
      ,[Pad_Name_GIS]
      ,[Pad_Name_Antero_Standard_GIS]
      ,[Prospect_GIS]
      ,[SEQNUM_GIS]
      ,[Surface_Latitude_NAD27_GIS]
      ,[Surface_Longitude_NAD27_GIS]
      ,[Target_Formation_GIS]
      ,[Unit_Name_GIS]
      ,[Unit_Name_Antero_Standard_GIS]
      ,[Well_Name_GIS]
      ,[Well_Name_Antero_Standard_GIS]
      ,[Wellbore_Name_GIS]
      ,[Wellbore_Name_Antero_Standard_GIS]
      ,[Spacing_East_GIS]
      ,[Spacing_West_GIS]
      ,[Type_Curve_Name_GIS]
      ,[Planned_Lateral_Spacing_GIS]
      ,[Oil_Yield_Grid_Code_GIS]
      ,[Unit_Acreage_GIS]
      ,[Property_Direction_GIS]
      ,[Gathering_Fee_Area_GIS]
      ,[Compressor_Area_GIS]
      ,[Compressor_Name_GIS]
      ,[Raw_Reserver_Category_GIS]
      ,[Aries_ID_Aries_Planning]
      ,[Well_Name_Aries_Planning]
      ,[Well_Name_Antero_Standard_Aries_Planning]
      ,[Wellbore_Name_Antero_Standard_Aries_Planning]
      ,[State_Name_Aries_Planning]
      ,[Configuration_Aries_Planning]
      ,[County_Aries_Planning]
      ,[Prospect_Aries_Planning]
      ,[API_Number_Aries_Planning]
      ,[Pad_Name_Aries_Planning]
      ,[Pad_Name_Antero_Standard_Aries_Planning]
      ,[SEQNUM_Aries_Planning]
      ,[Well_Number_Aries_Planning]
      ,[Cased_Lateral_Length_Aries_Planning]
      ,[Completed_Lateral_Length_Aries_Planning]
      ,[PropNum_Aries_Planning]
      ,[Current_Operations_Aries_Planning]
      ,[Total_Measured_Depth_Actual_Aries_Planning]
      ,[Total_Vertical_Depth_Aries_Planning]
      ,[Operator_Aries_Planning]
      ,[Working_Interest_Aries_Planning]
      ,[Net_Revenue_Interest_Aries_Planning]
      ,[First_Production_Date_Gas_Coalesced_Aries_Planning]
      ,[First_Production_Date_Gas_Actual_Aries_Planning]
      ,[Surface_Spud_Date_Actual_Aries_Planning]
      ,[Surface_Spud_Date_Aries_Planning]
      ,[Small_Rig_Spud_Date_Actual_Aries_Planning]
      ,[Shut_In_Date_Aries_Planning]
      ,[Basin_Aries_Planning]
      ,[Raw_Reserve_Category_Aries_Planning]
      ,[Reserve_Category_Aries_Planning]
      ,[API_State_Name_Aries_Planning]
      ,[API_County_Name_Aries_Planning]
      ,[Surface_Latitude_NAD27_Aries_Planning]
      ,[Surface_Longitude_NAD27_Aries_Planning]
      ,[Producing_Formation_Aries_Planning]
      ,[Unit_Name_Aries_Planning]
      ,[Longstring_Spud_Date_Actual_Aries_Planning]
      ,[Longstring_Spud_Date_Planned_Aries_Planning]
      ,[Surface_Location_Shape]
      ,[Surface_Location_Shape_GIS]
      ,[Wellbore_Shape_GIS]
      ,[Wellbore_Shape_NAD27_BLM_GIS]
      ,[BottomHole_Location_Shape_GIS]
      ,CAST(NULL AS DATETIME)          AS [EDW_Create_Date]
      ,CAST(NULL AS BIGINT)            AS [Hub_Well_Header_ID]
      ,CAST(NULL AS BIGINT)            AS [Rownum Seqnum Length Date Hub]
      ,CAST(NULL AS BIGINT)            AS [Rownum Seqnum LengthMax Date Hub]
      ,CAST(NULL AS BIGINT)            AS [Rownum Seqnum LengthMax Date Hub2]
      ,CAST(NULL AS BIGINT)            AS [Rownum Well Length Date Hub]
      ,CAST(NULL AS BIGINT)            AS [Rownum Well LengthMax Date Hub]
      ,CAST(NULL AS BIGINT)            AS [Rownum Well Seq Length Date Hub]
      ,CAST(NULL AS BIGINT)            AS [Rownum Well Seq LengthMax Date Hub]
      ,CAST(NULL AS INT)               AS [Source Length Base]
      ,CAST(NULL AS INT)               AS [Source Length Core]
      ,CAST(NULL AS INT)               AS [Source Length Max]
      ,CAST(NULL AS INT)               AS [Source Length Max_SEQNUM]
      ,CAST(NULL AS NVARCHAR(11))      AS [Sources_CGAWMPESFAp]
      ,[Drilled_Lateral_Length_Actual_Wellview]
      ,[Drilled_Lateral_Length_Aries]
      ,CAST(NULL AS UNIQUEIDENTIFIER)  AS [Pad_Header_UID]
      ,CAST(NULL AS UNIQUEIDENTIFIER)  AS [Unit_Header_UID]
      ,CAST(NULL AS UNIQUEIDENTIFIER)  AS [ETL_Load_Date]
---New in PROD From TEST
      ,[Sources Rownum]
      ,[Sources Rank]
      ,[Sources Length]
      ,[SigmaFlow Integration GIS]
      ,[SigmaFlow Integration GIS with SEQNUM]
      ,[Wellview Integration Wellview]
      ,[SigmaFlow Integration]
      ,[SigmaFlow Integration with SEQNUM]
      ,[Wellview Integration]
      ,[Row Count Test]
      ,[Sources With Core]
      ,[Sources With Core ID]
      ,[Hub_Well_Header_ID_C]
      ,[Hub_Well_Header_ID_P]
      ,[Hub_Well_Header_ID_A]
      ,[Hub_Well_Header_ID_S]
      ,[Hub_Well_Header_ID_W]
      ,[Hub_Well_Header_ID_M]
      ,[Hub_Well_Header_ID_E]
      ,[Hub_Well_Header_ID_F]
      ,[Hub_Well_Header_ID_G]
      ,[Hub_Well_Header_ID_Ap]
      ,[EDW_Is_Deleted_whm]
      ,[EDW_Is_Deleted_wha]
      ,[EDW_Is_Deleted_whe]
      ,[EDW_Is_Deleted_whfs]
      ,[EDW_Is_Deleted_whmk]
      ,[EDW_Is_Deleted_whp]
      ,[EDW_Is_Deleted_whsf]
      ,[EDW_Is_Deleted_whwv]
      ,[EDW_Is_Deleted_whg]
      ,[EDW_Is_Deleted_whap]
      ,[EDW_Create_Date_whm]
      ,[EDW_Create_Date_wha]
      ,[EDW_Create_Date_whe]
      ,[EDW_Create_Date_whfs]
      ,[EDW_Create_Date_whmk]
      ,[EDW_Create_Date_whp]
      ,[EDW_Create_Date_whsf]
      ,[EDW_Create_Date_whwv]
      ,[EDW_Create_Date_whg]
      ,[EDW_Create_Date_whap]
      ,[Well_Name_Original]
      ,[Drilled_Completed_Lateral_Length]
      ,[Completed_Stages_Lateral_Length]
      ,[Surface_Location_NAD27_DMS_GIS]
      ,[BottomHole_Location_NAD27_DMS_GIS]
      ,[Drilled_Lateral_Length_Aries_Planning]
FROM (
SELECT 
       [Sources]
	   ,ROW_NUMBER() OVER (PARTITION BY Well_Name_Antero_Standard ORDER BY LEN(RTRIM(LTRIM(REPLACE(Sources,'_','')))) DESC)  AS [Sources Rownum]
	   ,RANK()       OVER (PARTITION BY Well_Name_Antero_Standard ORDER BY LEN(RTRIM(LTRIM(REPLACE(Sources,'_','')))) DESC)  AS [Sources Rank]
	   ,LEN(RTRIM(LTRIM(REPLACE(Sources,'_',''))))                                                                           AS [Sources Length]
      ,[SigmaFlow Integration GIS]
	  ,[SigmaFlow Integration GIS with SEQNUM]
      ,[Wellview Integration Wellview]

      ,MAX([SigmaFlow Integration GIS])               OVER (PARTITION BY Well_Name_Antero_Standard) AS [SigmaFlow Integration]
      ,MAX([SigmaFlow Integration GIS with SEQNUM])   OVER (PARTITION BY Well_Name_Antero_Standard) AS [SigmaFlow Integration with SEQNUM]
      ,MAX([Wellview Integration Wellview])           OVER (PARTITION BY Well_Name_Antero_Standard) AS [Wellview Integration]

      ,COUNT(*) OVER (PARTITION BY Well_Name_Antero_Standard) AS [Row Count Test]
      ,[Well_Name_Antero_Standard]
      ,CAST([SEQNUM] AS FLOAT)                                AS [SEQNUM]
      ,CAST([API_Number] AS NVARCHAR(100) )                   AS [API_Number]
      ,[Cost_Center]      
      ,[Well_Header_UID]
               
      ,[Well_Name_Antero_Standard_Aries]
      ,[Well_Name_Antero_Standard_Aries_Planning]
      ,[Well_Name_Antero_Standard_Enertia]
      ,[Well_Name_Antero_Standard_FracSchedule]
      ,[Well_Name_Antero_Standard_GIS]
      ,[Well_Name_Antero_Standard_Merrick]
      ,[Well_Name_Antero_Standard_Petra]
      ,[Well_Name_Antero_Standard_SigmaFlow]
      ,[Well_Name_Antero_Standard_WellView]
   
      ,[SEQNUM_Aries]
      ,[SEQNUM_Aries_Planning]
      ,[SEQNUM_Enertia]
      ,[SEQNUM_FracSchedule]
      ,[SEQNUM_GIS]
      ,[SEQNUM_Petra]
      ,[SEQNUM_SigmaFlow]

      ,[API_Number_Aries]
      ,[API_Number_Aries_Planning]
      ,[API_Number_Enertia]
      ,[API_Number_GIS]
      ,[API_Number_Merrick]
      ,[API_Number_Petra]
      ,[API_Number_SigmaFlow]
      ,[API_Number_WellView]

      ,[Cost_Center_Enertia]
      ,[Cost_Center_Merrick]
      ,[Cost_Center_WellView]

      ,[Sources With Core]
      ,[Sources With Core ID]
      ,[Hub_Well_Header_ID_C]
      ,[Hub_Well_Header_ID_P]
      ,[Hub_Well_Header_ID_A]
      ,[Hub_Well_Header_ID_S]
      ,[Hub_Well_Header_ID_W]
      ,[Hub_Well_Header_ID_M]
      ,[Hub_Well_Header_ID_E]
      ,[Hub_Well_Header_ID_F]
      ,[Hub_Well_Header_ID_G]
      ,[Hub_Well_Header_ID_Ap]
      ,[EDW_Is_Deleted_whm]
      ,[EDW_Is_Deleted_wha]
      ,[EDW_Is_Deleted_whe]
      ,[EDW_Is_Deleted_whfs]
      ,[EDW_Is_Deleted_whmk]
      ,[EDW_Is_Deleted_whp]
      ,[EDW_Is_Deleted_whsf]
      ,[EDW_Is_Deleted_whwv]
      ,[EDW_Is_Deleted_whg]
      ,[EDW_Is_Deleted_whap]
      ,[EDW_Create_Date_whm]
      ,[EDW_Create_Date_wha]
      ,[EDW_Create_Date_whe]
      ,[EDW_Create_Date_whfs]
      ,[EDW_Create_Date_whmk]
      ,[EDW_Create_Date_whp]
      ,[EDW_Create_Date_whsf]
      ,[EDW_Create_Date_whwv]
      ,[EDW_Create_Date_whg]
      ,[EDW_Create_Date_whap]
      ,[Well_Name]
      ,[Well_Name_Original]
      ,[Well_Name_Aries]
      ,[Well_Name_Enertia]
      ,[Well_Name_FracSchedule]
      ,[Well_Name_Merrick]
      ,[Well_Name_Petra]
      ,[Well_Name_SigmaFlow]
      ,[Well_Name_WellView]
      ,CAST([Well_Name_GIS] AS VARCHAR(300)) AS [Well_Name_GIS]
      ,[Well_Name_Aries_Planning]
      ,[Petra_ID]
      ,[Aries_ID]
      ,[SigmaFlow_ID]
      ,[WellView_ID]
      ,[Merrick_ID]
      ,[Enertia_ID]
      ,[FracSchedule_ID]
      ,[GIS_ID]
      ,[API_County_Name]
      ,[API_State_Name]
      ,[Big_Rig_Name]
      ,[Big_Rig_Spud_Date]
      ,[BTU_Grid_Code]
      ,[Configuration]
      ,[County]
      ,[Critical_Date_Report]
      ,[Current_Operations_Status]
      ,[Current_Operations_SubStatus]
      ,[Current_Production_Status]
      ,[Drilling_Operations_Pause_Date]
      ,[Drilling_Operations_Resume_Date]
      ,[First_Production_Date]
      ,[Frac_End_Date]
      ,[Frac_Start_Date]
      ,[Net_Revenue_Interest]
      ,[Operations_Comments]
      ,[Operator]
      ,[Pad_AFE_Number]
      ,[Pad_Name]
      ,[Pad_Name_Antero_Standard]
      ,[Producing_Formation]
      ,[PropNum]
      ,[Prospect]
      ,[Raw_Reserve_Category]
      ,[Reserve_Category]
      ,[Shut_In_Date]
      ,[Small_Rig_Name]
      ,[Small_Rig_Spud_Date]
      ,[State_Name]
      ,[Surface_Latitude_NAD27]
      ,[Surface_Longitude_NAD27]
      ,[Total_Vertical_Depth]
      ,[Unit_Name]
      ,[Unit_Name_Antero_Standard]
      ,[Well_AFE_Number]
      ,[Well_Number]
      ,[Wellbore_Name_Antero_Standard]
      ,[Working_Interest]
      ,[WSN_Number]
      ,[Big_Rig_Spud_Date_Actual]
      ,[Big_Rig_Spud_Date_Planned]
      ,[Completion_Date_Actual]
      ,[Conductor_Spud_Date_Actual]
      ,[Drill_Out_End_Date_Planned]
      ,[Drill_Out_Start_Date_Planned]
      ,[Drilled_Lateral_Length_Actual]
      ,[Drilled_Lateral_Length_Planned]
      ,[Drilled_Lateral_Length]
      ,[Completable_Lateral_Length]
      ,[Completed_Lateral_length]
      ,[Cased_Lateral_Length]
      ,[Planned_Lateral_Length]
      ,[First_Production_Date_Gas_Actual]
      ,[First_Production_Date_Gas_Planned]
      ,[First_Production_Date_Oil_Actual]
      ,[First_Sales_Date_Gas_Actual]
      ,[First_Sales_Date_Oil_Actual]
      ,[Frac_End_Date_Actual]
      ,[Frac_Start_Date_Actual]
      ,[Rig_Release_Date_Actual]
      ,[Rig_Release_Date_Planned]
      ,[Small_Rig_Spud_Date_Actual]
      ,[Small_Rig_Spud_Date_Planned]
      ,[Surface_Spud_Date_Actual]
      ,[Surface_Spud_Date_Planned]
      ,[Total_Measured_Depth_Actual]
      ,[Production_Id]
      ,[First_Production_Date_EDW]
      ,[Pad_Name_Pad_Header]
      ,[Unit_Name_Unit_Header]
      ,[Well_Name_Pad_Header]
      ,[Well_Name_Unit_Header]
      ,[Longstring_Spud_Date_Planned]
      ,[Longstring_Spud_Date_Actual]
      ,[Critical_Date_Report_Default]
      ,[Ground_Elevation]
      ,[Pad_Id]
      ,[Unit_Id]
      ,[Area_Name]
      ,[Group_Name]
      ,[Route_Name]
      ,[Planned_To_Spud_In_Next_2_Years]
      ,[Planned_To_Spud_In_Next_5_Years]
      ,[Planned_To_Spud_In_Next_5_Years_Default]
      ,[Planned_To_Spud_In_Next_2_Years_Default]
      ,[BottomHole_Latitude_NAD27]
      ,[BottomHole_Longitude_NAD27]
      ,[Design_Sand_Lbs_Per_Foot_Planned]
      ,[Design_Water_BBls_Per_Foot_Planned]
      ,[Frac_End_Date_Planned]
      ,[Plug_Drillout_Days_Planned]
      ,[Plug_Drillout_End_Date_Planned]
      ,[Plug_Drillout_Start_Date_Planned]
      ,[Wellbore_Name_Antero_Standard_Aries]
      ,[State_Name_Aries]
      ,[Configuration_Aries]
      ,[County_Aries]
      ,[Prospect_Aries]
      ,[Pad_Name_Aries]
      ,[Pad_Name_Antero_Standard_Aries]
      ,[Well_Number_Aries]
      ,[Drilled_Lateral_Length_Aries]
      ,[Cased_Lateral_Length_Aries]
      ,[Completed_Lateral_Length_Aries]
      ,[PropNum_Aries]
      ,[Current_Operations_Aries]
      ,[Total_Measured_Depth_Actual_Aries]
      ,[Total_Vertical_Depth_Aries]
      ,[Operator_Aries]
      ,[Working_Interest_Aries]
      ,[Net_Revenue_Interest_Aries]
      ,[First_Production_Date_Gas_Coalesced_Aries]
      ,[First_Production_Date_Gas_Actual_Aries]
      ,[Surface_Spud_Date_Actual_Aries]
      ,[Surface_Spud_Date_Aries]
      ,[Small_Rig_Spud_Date_Actual_Aries]
      ,[Shut_In_Date_Aries]
      ,[Basin_Aries]
      ,[Raw_Reserve_Category_Aries]
      ,[RCNUM_Aries]
      ,[Reserve_Category_Aries]
      ,[API_State_Name_Aries]
      ,[API_County_Name_Aries]
      ,[Surface_Latitude_NAD27_Aries]
      ,[Surface_Longitude_NAD27_Aries]
      ,[Producing_Formation_Aries]
      ,[Eur_Gas_All_Aries]
      ,[Eur_BCF_1000FT_Aries]
      ,[EUR_PDP_ALL_BCFE_Aries]
      ,[EUR_BCFE_1000FT_Aries]
      ,[EUR_BO_ALL_Aries]
      ,[EUR_BO/FT_Aries]
      ,[Unit_Name_Aries]
      ,[Longstring_Spud_Date_Actual_Aries]
      ,[Longstring_Spud_Date_Planned_Aries]
      ,[Wellbore_Name_Antero_Standard_Enertia]
      ,[State_Name_Enertia]
      ,[County_Enertia]
      ,[Pad_Name_Enertia]
      ,[Pad_Name_Antero_Standard_Enertia]
      ,[EnertiaID_Enertia]
      ,[Current_Operations_Enertia]
      ,[Operator_Enertia]
      ,[Working_Interest_Enertia]
      ,[Net_Revenue_Interest_Enertia]
      ,[First_Production_Date_Gas_Actual_Enertia]
      ,[First_Production_Date_Oil_Actual_Enertia]
      ,[API_State_Name_Enertia]
      ,[API_County_Name_Enertia]
      ,[Pad_AFE_Number_Enertia]
      ,[Well_AFE_Number_Enertia]
      ,[Unit_Name_Enertia]
      ,[Completions_Group_Name_FracSchedule]
      ,[Design_Sand_Lbs_Per_Foot_Planned_FracSchedule]
      ,[Design_Water_BBls_Per_Foot_Planned_FracSchedule]
      ,[Drilled_Lateral_Length_FracSchedule]
      ,[Frac_End_Date_Planned_FracSchedule]
      ,[Longstring_Spud_Date_FracSchedule]
      ,[Plug_Drillout_Days_Planned_FracSchedule]
      ,[Plug_Drillout_End_Date_Planned_FracSchedule]
      ,[Plug_Drillout_Start_Date_Planned_FracSchedule]
      ,[Prospect_FracSchedule]
      ,[Pad_Name_FracSchedule]
      ,[Pad_Name_Antero_Standard_FracSchedule]
      ,[State_Name_FracSchedule]
      ,[Total_Water_Needed_For_Frac_FracSchedule]
      ,[Well_Rig_Release_Date_FracSchedule]
      ,[Wellbore_Name_Antero_Standard_FracSchedule]
      ,[First_Production_Date_Gas_Planned_FracSchedule]
      ,[Frac_Start_Date_Planned_FracSchedule]
      ,[Pad_Rig_Release_Date_FracSchedule]
      ,[Wellbore_Name_Antero_Standard_Merrick]
      ,[State_Name_Merrick]
      ,[Configuration_Merrick]
      ,[County_Merrick]
      ,[Pad_Name_Merrick]
      ,[Pad_Name_Antero_Standard_Merrick]
      ,[Well_Number_Merrick]
      ,[EnertiaID_Merrick]
      ,[PropNum_Merrick]
      ,[Current_Operations_Merrick]
      ,[First_Production_Date_Gas_Actual_Merrick]
      ,[First_Production_Date_Oil_Actual_Merrick]
      ,[First_Sales_Date_Gas_Actual_Merrick]
      ,[First_Sales_Date_Oil_Actual_Merrick]
      ,[Shut_In_Date_Merrick]
      ,[API_State_Name_Merrick]
      ,[API_County_Name_Merrick]
      ,[Current_Production_Status_Merrick]
      ,[Area_Name_Merrick]
      ,[Group_Name_Merrick]
      ,[Route_Name_Merrick]
      ,[Wellbore_Name_Antero_Standard_Petra]
      ,[State_Name_Petra]
      ,[Configuration_Petra]
      ,[County_Petra]
      ,[Prospect_Petra]
      ,[Pad_Name_Petra]
      ,[Pad_Name_Antero_Standard_Petra]
      ,[WSN_Number_Petra]
      ,[Well_Number_Petra]
      ,[Drilled_Lateral_Length_Planned_Petra]
      ,[Drilled_Lateral_Length_Actual_Petra]
      ,[Cased_Lateral_Length_Petra]
      ,[Completable_Lateral_Length_Petra]
      ,[Scrubbed_Lateral_Length_Petra]
      ,[USA_Sticks_Lateral_Length_Petra]
      ,[Third_Party_Lateral_Length_Petra]
      ,[Estimated_Lateral_Length_Petra]
      ,[Drilled_Lateral_Length_Petra]
      ,[Big_Rig_Name_Petra]
      ,[Current_Operations_Petra]
      ,[Total_Measured_Depth_Actual_Petra]
      ,[Operator_Petra]
      ,[Big_Rig_Spud_Date_Actual_Petra]
      ,[Completion_Date_Actual_Petra]
      ,[API_State_Name_Petra]
      ,[API_County_Name_Petra]
      ,[Surface_Latitude_NAD27_Petra]
      ,[Surface_Longitude_NAD27_Petra]
      ,[Producing_Formation_Petra]
      ,[Unit_Name_Petra]
      ,[Ground_Elevation_Petra]
      ,[Symbol_Code_Petra]
      ,[BottomHole_Latitude_NAD27_Petra]
      ,[BottomHole_Longitude_NAD27_Petra]
      ,[Wellbore_Name_Antero_Standard_SigmaFlow]
      ,[State_Name_SigmaFlow]
      ,[County_SigmaFlow]
      ,[Prospect_SigmaFlow]
      ,[Pad_Name_SigmaFlow]
      ,[Pad_Name_Antero_Standard_Sigmaflow]
      ,[WSN_Number_SigmaFlow]
      ,[Drilled_Lateral_Length_Planned_SigmaFlow]
      ,[Drilled_Lateral_Length_SigmaFlow]
      ,[Actual_Lateral_Length_Sigmaflow]
      ,[Planned_Lateral_Length_Sigmaflow]
      ,[Permitted_Lateral_Length_Sigmaflow]
      ,[Big_Rig_Name_SigmaFlow]
      ,[Small_Rig_Name_SigmaFlow]
      ,[First_Production_Date_Gas_Planned_SigmaFlow]
      ,[Surface_Spud_Date_Planned_SigmaFlow]
      ,[Surface_Spud_Date_Actual_SigmaFlow]
      ,[Big_Rig_Spud_Date_Actual_SigmaFlow]
      ,[Big_Rig_Spud_Date_Planned_SigmaFlow]
      ,[Small_Rig_Spud_Date_Actual_SigmaFlow]
      ,[Small_Rig_Spud_Date_Planned_SigmaFlow]
      ,[Rig_Release_Date_Actual_SigmaFlow]
      ,[Rig_Release_Date_Planned_SigmaFlow]
      ,[API_State_Name_SigmaFlow]
      ,[API_County_Name_SigmaFlow]
      ,[Frac_Start_Date_SigmaFlow]
      ,[Frac_End_Date_SigmaFlow]
      ,[Drill_Out_Start_Date_Planned_SigmaFlow]
      ,[Drill_Out_End_Date_Planned_SigmaFlow]
      ,[Unit_Name_SigmaFlow]
      ,[Longstring_Spud_Date_Planned_SigmaFlow]
      ,[Planned_To_Spud_In_Next_5_Years_SigmaFlow]
      ,[Planned_To_Spud_In_Next_2_Years_SigmaFlow]
      ,[Permit_Status_Sigmaflow]
      ,[Permit_Status_Date_Sigmaflow]
      ,[State_Name_WellView]
      ,[Configuration_WellView]
      ,[County_WellView]
      ,[Prospect_WellView]
      ,[Pad_Name_WellView]
      ,[Pad_Name_Antero_Standard_Wellview]
      ,[Drilled_Lateral_Length_Actual_Wellview]
      ,[Drilled_Completed_Lateral_Length]
      ,[Completable_Lateral_Length_WellView]
      ,[Completed_Lateral_Length_Wellview]
      ,[Completed_Stages_Lateral_Length]
      ,[Big_Rig_Name_WellView]
      ,[Current_Operations_WellView]
      ,[Total_Measured_Depth_Actual_WellView]
      ,[Operator_WellView]
      ,[Small_Rig_Name_WellView]
      ,[Working_Interest_WellView]
      ,[Net_Revenue_Interest_WellView]
      ,[Operations_Comments_WellView]
      ,[First_Sales_Date_Gas_Actual_WellView]
      ,[Conductor_Spud_Date_Actual_WellView]
      ,[Surface_Spud_Date_Actual_WellView]
      ,[Big_Rig_Spud_Date_Actual_WellView]
      ,[Small_Rig_Spud_Date_Actual_WellView]
      ,[Completion_Date_Actual_WellView]
      ,[Shut_In_Date_WellView]
      ,[Rig_Release_Date_Actual_WellView]
      ,[Drilling_Operations_Pause_Date_WellView]
      ,[Drilling_Operations_Resume_Date_WellView]
      ,[Basin_WellView]
      ,[Critical_Date_Report_WellView]
      ,[API_State_Name_WellView]
      ,[API_County_Name_WellView]
      ,[Surface_Latitude_NAD27_WellView]
      ,[Surface_Longitude_NAD27_WellView]
      ,[Current_Operations_Status_WellView]
      ,[Current_Operations_SubStatus_WellView]
      ,[Producing_Formation_WellView]
      ,[Frac_Start_Date_Actual_WellView]
      ,[Frac_End_Date_Actual_WellView]
      ,[Planned_To_Spud_In_Next_5_Years_WellView]
      ,[Planned_To_Spud_In_Next_2_Years_WellView]
      ,[Casing_Set_Depth_Wellview]
      ,[TD_Date_Wellview]
      ,[Top_Hole_End_Date_Wellview]
      ,[Max_TVD_Wellview]
      ,[Last_Survey_MD_Wellview]
      ,[Last_Survey_TVD_Wellview]
      ,[Longstring_Spud_Date_Actual_Wellview]
      ,[API_State_Name_GIS]
      ,[Big_Rig_Name_GIS]
      ,[BottomHole_Latitude_NAD27_GIS]
      ,[BottomHole_Longitude_NAD27_GIS]
      ,[BTU_Grid_Code_GIS]
      ,[Configuration_GIS]
      ,[Planned_Lateral_Length_GIS]
      ,[Is_Antero_Well_GIS]
      ,[Midpoint_Latitude_GIS]
      ,[Midpoint_Longitude_GIS]
      ,[Operator_GIS]
      ,[Pad_Name_GIS]
      ,[Pad_Name_Antero_Standard_GIS]
      ,[Prospect_GIS]
      ,[Surface_Latitude_NAD27_GIS]
      ,[Surface_Longitude_NAD27_GIS]
      ,[Target_Formation_GIS]
      ,[Unit_Name_GIS]
      ,[Unit_Name_Antero_Standard_GIS]
      ,[Wellbore_Name_GIS]
      ,[Wellbore_Name_Antero_Standard_GIS]
      ,[Spacing_East_GIS]
      ,[Spacing_West_GIS]
      ,[Type_Curve_Name_GIS]
      ,[Planned_Lateral_Spacing_GIS]
      ,[Oil_Yield_Grid_Code_GIS]
      ,[Unit_Acreage_GIS]
      ,[Property_Direction_GIS]
      ,[Gathering_Fee_Area_GIS]
      ,[Compressor_Area_GIS]
      ,[Compressor_Name_GIS]
      ,[Raw_Reserver_Category_GIS]
      ,[Surface_Location_NAD27_DMS_GIS]
      ,[BottomHole_Location_NAD27_DMS_GIS]
      ,[Aries_ID_Aries_Planning]
      ,[Wellbore_Name_Antero_Standard_Aries_Planning]
      ,[State_Name_Aries_Planning]
      ,[Configuration_Aries_Planning]
      ,[County_Aries_Planning]
      ,[Prospect_Aries_Planning]
      ,[Pad_Name_Aries_Planning]
      ,[Pad_Name_Antero_Standard_Aries_Planning]
      ,[Well_Number_Aries_Planning]
      ,[Drilled_Lateral_Length_Aries_Planning]
      ,[Cased_Lateral_Length_Aries_Planning]
      ,[Completed_Lateral_Length_Aries_Planning]
      ,[PropNum_Aries_Planning]
      ,[Current_Operations_Aries_Planning]
      ,[Total_Measured_Depth_Actual_Aries_Planning]
      ,[Total_Vertical_Depth_Aries_Planning]
      ,[Operator_Aries_Planning]
      ,[Working_Interest_Aries_Planning]
      ,[Net_Revenue_Interest_Aries_Planning]
      ,[First_Production_Date_Gas_Coalesced_Aries_Planning]
      ,[First_Production_Date_Gas_Actual_Aries_Planning]
      ,[Surface_Spud_Date_Actual_Aries_Planning]
      ,[Surface_Spud_Date_Aries_Planning]
      ,[Small_Rig_Spud_Date_Actual_Aries_Planning]
      ,[Shut_In_Date_Aries_Planning]
      ,[Basin_Aries_Planning]
      ,[Raw_Reserve_Category_Aries_Planning]
      ,[Reserve_Category_Aries_Planning]
      ,[API_State_Name_Aries_Planning]
      ,[API_County_Name_Aries_Planning]
      ,[Surface_Latitude_NAD27_Aries_Planning]
      ,[Surface_Longitude_NAD27_Aries_Planning]
      ,[Producing_Formation_Aries_Planning]
      ,[Unit_Name_Aries_Planning]
      ,[Longstring_Spud_Date_Actual_Aries_Planning]
      ,[Longstring_Spud_Date_Planned_Aries_Planning]
      ,[Surface_Location_Shape_GIS] AS [Surface_Location_Shape]
	  ,[BottomHole_Location_Shape_GIS]
      ,[Surface_Location_Shape_GIS]
      ,[Wellbore_Shape_GIS]
      ,[Wellbore_Shape_NAD27_BLM_GIS]
FROM
(
---2
SELECT
--- SQL Prompt formatting off
       [Sources]
	  ,[Sources With Core]

	  ,CASE WHEN [Sources] LIKE '%G%' AND SEQNUM IS NOT NULL                             THEN 'Yes' ELSE 'No' END AS [SigmaFlow Integration GIS with SEQNUM]
	  ,CASE WHEN [Sources] LIKE '%G%'                                                    THEN 'Yes' ELSE 'No' END AS [SigmaFlow Integration GIS]
	  ,CASE WHEN COALESCE([Critical_Date_Report], Critical_Date_Report_WellView) = 'Yes' THEN 'Yes' ELSE 'No' END AS [Wellview Integration Wellview]
      ,CASE WHEN [Sources With Core] = 'C_________' THEN
       CONCAT(
            N'C'
       	   ,IIF(Petra_ID          IS NOT NULL, N'P', N'_')
       	   ,IIF(Aries_ID          IS NOT NULL, N'A', N'_')
       	   ,IIF(SigmaFlow_ID      IS NOT NULL, N'S', N'_')
       	   ,IIF(Wellview_ID       IS NOT NULL, N'W', N'_')
       	   ,IIF(Merrick_ID        IS NOT NULL, N'M', N'_')
       	   ,IIF(Enertia_ID        IS NOT NULL, N'E', N'_')
       	   ,IIF(FracSchedule_ID   IS NOT NULL, N'F', N'_')
       	   ,IIF(GIS_ID            IS NOT NULL, N'G', N'_')
---    	   ,IIF(Aries_Planning_ID IS NOT NULL, N'Ap',N'_')
       )ELSE [Sources With Core]
       END AS [Sources With Core ID]

	  ,Hub_Well_Header_ID_C
	  ,Hub_Well_Header_ID_P
	  ,Hub_Well_Header_ID_A
	  ,Hub_Well_Header_ID_S
	  ,Hub_Well_Header_ID_W
	  ,Hub_Well_Header_ID_M
	  ,Hub_Well_Header_ID_E
	  ,Hub_Well_Header_ID_F
	  ,Hub_Well_Header_ID_G
	  ,Hub_Well_Header_ID_Ap

      ,EDW_Is_Deleted_whm                   
      ,EDW_Is_Deleted_wha                   
      ,EDW_Is_Deleted_whe                   
      ,EDW_Is_Deleted_whfs                 
      ,EDW_Is_Deleted_whmk                 
      ,EDW_Is_Deleted_whp                   
      ,EDW_Is_Deleted_whsf                 
      ,EDW_Is_Deleted_whwv                 
      ,EDW_Is_Deleted_whg                   
      ,EDW_Is_Deleted_whap 

      ,EDW_Create_Date_whm                   
      ,EDW_Create_Date_wha                   
      ,EDW_Create_Date_whe                   
      ,EDW_Create_Date_whfs                 
      ,EDW_Create_Date_whmk                 
      ,EDW_Create_Date_whp                   
      ,EDW_Create_Date_whsf                 
      ,EDW_Create_Date_whwv                 
      ,EDW_Create_Date_whg                   
      ,EDW_Create_Date_whap 
	  
	  ,[Well_Name]
      ,[Well_Name_Original]
      ,[Well_Name_Aries]
	  ,[Well_Name_Enertia]
      ,[Well_Name_FracSchedule]
	  ,[Well_Name_Merrick]
	  ,[Well_Name_Petra]
	  ,[Well_Name_SigmaFlow]
	  ,[Well_Name_WellView]
	  ,[Well_Name_GIS]
	  ,[Well_Name_Aries_Planning]

      ,[SEQNUM]
      ,[API_Number]
      ,[Cost_Center]
      ,[Well_Header_UID]
      ,[Hub_Well_Header_UID]
---   ,[Hub_Well_Header_ID]
      ,[Petra_ID]
      ,[Aries_ID]
      ,[SigmaFlow_ID]
      ,[WellView_ID]
      ,[Merrick_ID]
      ,[Enertia_ID]
      ,[FracSchedule_ID]
      ,[GIS_ID]
      ,[API_County_Name]
      ,[API_State_Name]
      ,[Big_Rig_Name]
      ,[Big_Rig_Spud_Date]
      ,[BTU_Grid_Code]
      ,[Configuration]
      ,[County]
      ,COALESCE([Critical_Date_Report], Critical_Date_Report_WellView) AS [Critical_Date_Report]
      ,[Current_Operations_Status]
      ,[Current_Operations_SubStatus]
      ,[Current_Production_Status]
      ,[Drilling_Operations_Pause_Date]
      ,[Drilling_Operations_Resume_Date]
      ,[First_Production_Date]
      ,[Frac_End_Date]
      ,[Frac_Start_Date]
      ,[Net_Revenue_Interest]
      ,[Operations_Comments]
      ,[Operator]
      ,[Pad_AFE_Number]
      ,[Pad_Name]
      ,[Pad_Name_Antero_Standard]
      ,[Producing_Formation]
      ,[PropNum]
      ,[Prospect]
      ,[Raw_Reserve_Category]
      ,[Reserve_Category]
      ,[Shut_In_Date]
      ,[Small_Rig_Name]
      ,[Small_Rig_Spud_Date]
      ,[State_Name]
      ,[Surface_Latitude_NAD27]
      ,[Surface_Longitude_NAD27]
      ,[Total_Vertical_Depth]
      ,[Unit_Name]
      ,[Unit_Name_Antero_Standard]
      ,[Well_AFE_Number]
      ,[Well_Name_Antero_Standard]
      ,[Well_Name_Proper_Case]
      ,[Well_Name_Title_Case]
      ,[Well_Number]
      ,[Wellbore_Name_Antero_Standard]
      ,[Working_Interest]
      ,[WSN_Number]
      ,[Big_Rig_Spud_Date_Actual]
      ,[Big_Rig_Spud_Date_Planned]
      ,[Completion_Date_Actual]
      ,[Conductor_Spud_Date_Actual]
      ,[Drill_Out_End_Date_Planned]
      ,[Drill_Out_Start_Date_Planned]
      ,[Drilled_Lateral_Length_Actual]
      ,[Drilled_Lateral_Length_Planned]
      ,[Drilled_Lateral_Length]
      ,[Completable_Lateral_Length]
      ,[Completed_Lateral_length]
      ,[Cased_Lateral_Length]
      ,[Planned_Lateral_Length]
      ,[First_Production_Date_Gas_Actual]
      ,[First_Production_Date_Gas_Planned]
      ,[First_Production_Date_Oil_Actual]
      ,[First_Sales_Date_Gas_Actual]
      ,[First_Sales_Date_Oil_Actual]
      ,[Frac_End_Date_Actual]
      ,[Frac_Start_Date_Actual]
      ,[Rig_Release_Date_Actual]
      ,[Rig_Release_Date_Planned]
      ,[Small_Rig_Spud_Date_Actual]
      ,[Small_Rig_Spud_Date_Planned]
      ,[Surface_Spud_Date_Actual]
      ,[Surface_Spud_Date_Planned]
      ,[Total_Measured_Depth_Actual]
      ,[Production_Id]
      ,[First_Production_Date_EDW]
      ,[Surface_Location_Shape]
      ,[Pad_Name_Pad_Header]
      ,[Unit_Name_Unit_Header]
      ,[Well_Name_Pad_Header]
      ,[Well_Name_Unit_Header]
      ,[Longstring_Spud_Date_Planned]
      ,[Longstring_Spud_Date_Actual]
      ,[Critical_Date_Report_Default]
      ,[Ground_Elevation]
      ,[Pad_Id]
      ,[Unit_Id]
      ,[Area_Name]
      ,[Group_Name]
      ,[Route_Name]
      ,[Planned_To_Spud_In_Next_2_Years]
      ,[Planned_To_Spud_In_Next_5_Years]
      ,[Planned_To_Spud_In_Next_5_Years_Default]
      ,[Planned_To_Spud_In_Next_2_Years_Default]
      ,[BottomHole_Latitude_NAD27]
      ,[BottomHole_Longitude_NAD27]
      ,[Design_Sand_Lbs_Per_Foot_Planned]
      ,[Design_Water_BBls_Per_Foot_Planned]
      ,[Frac_End_Date_Planned]
      ,[Plug_Drillout_Days_Planned]
      ,[Plug_Drillout_End_Date_Planned]
      ,[Plug_Drillout_Start_Date_Planned]
      ,[Wellbore_Name_Antero_Standard_Aries]
      ,[State_Name_Aries]
      ,[Configuration_Aries]
      ,[County_Aries]
      ,[Prospect_Aries]
      ,[API_Number_Aries]
      ,[Pad_Name_Aries]
      ,[Pad_Name_Antero_Standard_Aries]
      ,[SEQNUM_Aries]
      ,[Well_Number_Aries]
      ,[Drilled_Lateral_Length_Aries]
      ,[Cased_Lateral_Length_Aries]
      ,[Completed_Lateral_Length_Aries]
      ,[PropNum_Aries]
      ,[Current_Operations_Aries]
      ,[Total_Measured_Depth_Actual_Aries]
      ,[Total_Vertical_Depth_Aries]
      ,[Operator_Aries]
      ,[Working_Interest_Aries]
      ,[Net_Revenue_Interest_Aries]
      ,[First_Production_Date_Gas_Coalesced_Aries]
      ,[First_Production_Date_Gas_Actual_Aries]
      ,[Surface_Spud_Date_Actual_Aries]
      ,[Surface_Spud_Date_Aries]
      ,[Small_Rig_Spud_Date_Actual_Aries]
      ,[Shut_In_Date_Aries]
      ,[Basin_Aries]
      ,[Raw_Reserve_Category_Aries]
      ,[RCNUM_Aries]
      ,[Reserve_Category_Aries]
      ,[API_State_Name_Aries]
      ,[API_County_Name_Aries]
      ,[Surface_Latitude_NAD27_Aries]
      ,[Surface_Longitude_NAD27_Aries]
      ,[Producing_Formation_Aries]
      ,[Eur_Gas_All_Aries]
      ,[Eur_BCF_1000FT_Aries]
      ,[EUR_PDP_ALL_BCFE_Aries]
      ,[EUR_BCFE_1000FT_Aries]
      ,[EUR_BO_ALL_Aries]
      ,[EUR_BO/FT_Aries]
      ,[Unit_Name_Aries]
      ,[Longstring_Spud_Date_Actual_Aries]
      ,[Longstring_Spud_Date_Planned_Aries]
---   ,[Big_Rig_Spud_Date_Planned_Aries]
---   ,[Big_Rig_Spud_Date_Actual_Aries]
      ,[Wellbore_Name_Antero_Standard_Enertia]
      ,[State_Name_Enertia]
      ,[County_Enertia]
      ,[API_Number_Enertia]
      ,[Pad_Name_Enertia]
      ,[Pad_Name_Antero_Standard_Enertia]
      ,[SEQNUM_Enertia]
      ,[EnertiaID_Enertia]
      ,[Current_Operations_Enertia]
      ,[Operator_Enertia]
      ,[Cost_Center_Enertia]
      ,[Working_Interest_Enertia]
      ,[Net_Revenue_Interest_Enertia]
      ,[First_Production_Date_Gas_Actual_Enertia]
      ,[First_Production_Date_Oil_Actual_Enertia]
      ,[API_State_Name_Enertia]
      ,[API_County_Name_Enertia]
      ,[Pad_AFE_Number_Enertia]
      ,[Well_AFE_Number_Enertia]
      ,[Unit_Name_Enertia]
      ,[Completions_Group_Name_FracSchedule]
      ,[Design_Sand_Lbs_Per_Foot_Planned_FracSchedule]
      ,[Design_Water_BBls_Per_Foot_Planned_FracSchedule]
      ,[Drilled_Lateral_Length_FracSchedule]
      ,[Frac_End_Date_Planned_FracSchedule]
      ,[Longstring_Spud_Date_FracSchedule]
      ,[Plug_Drillout_Days_Planned_FracSchedule]
      ,[Plug_Drillout_End_Date_Planned_FracSchedule]
      ,[Plug_Drillout_Start_Date_Planned_FracSchedule]
      ,[Prospect_FracSchedule]
      ,[SEQNUM_FracSchedule]
      ,[Pad_Name_FracSchedule]
      ,[Pad_Name_Antero_Standard_FracSchedule]
      ,[State_Name_FracSchedule]
      ,[Total_Water_Needed_For_Frac_FracSchedule]
      ,[Well_Rig_Release_Date_FracSchedule]
      ,[Wellbore_Name_Antero_Standard_FracSchedule]
      ,[First_Production_Date_Gas_Planned_FracSchedule]
      ,[Frac_Start_Date_Planned_FracSchedule]
      ,[Pad_Rig_Release_Date_FracSchedule]
      ,[Wellbore_Name_Antero_Standard_Merrick]
      ,[State_Name_Merrick]
      ,[Configuration_Merrick]
      ,[County_Merrick]
      ,[API_Number_Merrick]
      ,[Pad_Name_Merrick]
      ,[Pad_Name_Antero_Standard_Merrick]
      ,[Well_Number_Merrick]
      ,[EnertiaID_Merrick]
      ,[PropNum_Merrick]
      ,[Current_Operations_Merrick]
      ,[Cost_Center_Merrick]
      ,[First_Production_Date_Gas_Actual_Merrick]
      ,[First_Production_Date_Oil_Actual_Merrick]
      ,[First_Sales_Date_Gas_Actual_Merrick]
      ,[First_Sales_Date_Oil_Actual_Merrick]
      ,[Shut_In_Date_Merrick]
      ,[API_State_Name_Merrick]
      ,[API_County_Name_Merrick]
      ,[Current_Production_Status_Merrick]
      ,[Area_Name_Merrick]
      ,[Group_Name_Merrick]
      ,[Route_Name_Merrick]
      ,[Wellbore_Name_Antero_Standard_Petra]
      ,[State_Name_Petra]
      ,[Configuration_Petra]
      ,[County_Petra]
      ,[Prospect_Petra]
      ,[API_Number_Petra]
      ,[Pad_Name_Petra]
      ,[Pad_Name_Antero_Standard_Petra]
      ,[WSN_Number_Petra]
      ,[SEQNUM_Petra]
      ,[Well_Number_Petra]
      ,[Drilled_Lateral_Length_Planned_Petra]
      ,[Drilled_Lateral_Length_Actual_Petra]
      ,[Cased_Lateral_Length_Petra]
      ,[Completable_Lateral_Length_Petra]
      ,[Scrubbed_Lateral_Length_Petra]
      ,[USA_Sticks_Lateral_Length_Petra]
      ,[Third_Party_Lateral_Length_Petra]
      ,[Estimated_Lateral_Length_Petra]
      ,[Drilled_Lateral_Length_Petra]
      ,[Big_Rig_Name_Petra]
      ,[Current_Operations_Petra]
      ,[Total_Measured_Depth_Actual_Petra]
      ,[Operator_Petra]
      ,[Big_Rig_Spud_Date_Actual_Petra]
      ,[Completion_Date_Actual_Petra]
      ,[API_State_Name_Petra]
      ,[API_County_Name_Petra]
      ,[Surface_Latitude_NAD27_Petra]
      ,[Surface_Longitude_NAD27_Petra]
      ,[Producing_Formation_Petra]
      ,[Unit_Name_Petra]
      ,[Ground_Elevation_Petra]
      ,[Symbol_Code_Petra]
      ,[BottomHole_Latitude_NAD27_Petra]
      ,[BottomHole_Longitude_NAD27_Petra]
      ,[Wellbore_Name_Antero_Standard_SigmaFlow]
      ,[State_Name_SigmaFlow]
      ,[County_SigmaFlow]
      ,[Prospect_SigmaFlow]
      ,[API_Number_SigmaFlow]
      ,[Pad_Name_SigmaFlow]
      ,[Pad_Name_Antero_Standard_Sigmaflow]
      ,[WSN_Number_SigmaFlow]
      ,[SEQNUM_SigmaFlow]
      ,[Drilled_Lateral_Length_Planned_SigmaFlow]
      ,[Drilled_Lateral_Length_SigmaFlow]
      ,[Actual_Lateral_Length_Sigmaflow]
      ,[Planned_Lateral_Length_Sigmaflow]
      ,[Permitted_Lateral_Length_Sigmaflow]
      ,[Big_Rig_Name_SigmaFlow]
      ,[Small_Rig_Name_SigmaFlow]
      ,[First_Production_Date_Gas_Planned_SigmaFlow]
      ,[Surface_Spud_Date_Planned_SigmaFlow]
      ,[Surface_Spud_Date_Actual_SigmaFlow]
      ,[Big_Rig_Spud_Date_Actual_SigmaFlow]
      ,[Big_Rig_Spud_Date_Planned_SigmaFlow]
      ,[Small_Rig_Spud_Date_Actual_SigmaFlow]
      ,[Small_Rig_Spud_Date_Planned_SigmaFlow]
      ,[Rig_Release_Date_Actual_SigmaFlow]
      ,[Rig_Release_Date_Planned_SigmaFlow]
      ,[API_State_Name_SigmaFlow]
      ,[API_County_Name_SigmaFlow]
      ,[Frac_Start_Date_SigmaFlow]
      ,[Frac_End_Date_SigmaFlow]
      ,[Drill_Out_Start_Date_Planned_SigmaFlow]
      ,[Drill_Out_End_Date_Planned_SigmaFlow]
      ,[Unit_Name_SigmaFlow]
      ,[Longstring_Spud_Date_Planned_SigmaFlow]
      ,[Planned_To_Spud_In_Next_5_Years_SigmaFlow]
      ,[Planned_To_Spud_In_Next_2_Years_SigmaFlow]
      ,[Permit_Status_Sigmaflow]
      ,[Permit_Status_Date_Sigmaflow]
      ,[State_Name_WellView]
      ,[Configuration_WellView]
      ,[County_WellView]
      ,[Prospect_WellView]
      ,[API_Number_WellView]
      ,[Pad_Name_WellView]
      ,[Pad_Name_Antero_Standard_Wellview]
      ,[Drilled_Lateral_Length_Actual_Wellview]
      ,[Drilled_Completed_Lateral_Length]
      ,[Completable_Lateral_Length_WellView]
      ,[Completed_Lateral_Length_Wellview]
      ,[Completed_Stages_Lateral_Length]
      ,[Big_Rig_Name_WellView]
      ,[Current_Operations_WellView]
      ,[Total_Measured_Depth_Actual_WellView]
      ,[Operator_WellView]
      ,[Small_Rig_Name_WellView]
      ,[Cost_Center_WellView]
      ,[Working_Interest_WellView]
      ,[Net_Revenue_Interest_WellView]
      ,[Operations_Comments_WellView]
      ,[First_Sales_Date_Gas_Actual_WellView]
      ,[Conductor_Spud_Date_Actual_WellView]
      ,[Surface_Spud_Date_Actual_WellView]
      ,[Big_Rig_Spud_Date_Actual_WellView]
      ,[Small_Rig_Spud_Date_Actual_WellView]
      ,[Completion_Date_Actual_WellView]
      ,[Shut_In_Date_WellView]
      ,[Rig_Release_Date_Actual_WellView]
      ,[Drilling_Operations_Pause_Date_WellView]
      ,[Drilling_Operations_Resume_Date_WellView]
      ,[Basin_WellView]
      ,[Critical_Date_Report_WellView]
      ,[API_State_Name_WellView]
      ,[API_County_Name_WellView]
      ,[Surface_Latitude_NAD27_WellView]
      ,[Surface_Longitude_NAD27_WellView]
      ,[Current_Operations_Status_WellView]
      ,[Current_Operations_SubStatus_WellView]
      ,[Producing_Formation_WellView]
      ,[Frac_Start_Date_Actual_WellView]
      ,[Frac_End_Date_Actual_WellView]
      ,[Planned_To_Spud_In_Next_5_Years_WellView]
      ,[Planned_To_Spud_In_Next_2_Years_WellView]
      ,[Casing_Set_Depth_Wellview]
      ,[TD_Date_Wellview]
      ,[Top_Hole_End_Date_Wellview]
      ,[Max_TVD_Wellview]
      ,[Last_Survey_MD_Wellview]
      ,[Last_Survey_TVD_Wellview]
      ,[Longstring_Spud_Date_Actual_Wellview]
      ,[API_Number_GIS]
      ,[API_State_Name_GIS]
      ,[Big_Rig_Name_GIS]
      ,[BottomHole_Latitude_NAD27_GIS]
      ,[BottomHole_Longitude_NAD27_GIS]
      ,[BottomHole_Location_Shape_GIS]
      ,[BTU_Grid_Code_GIS]
      ,[Configuration_GIS]
      ,[Planned_Lateral_Length_GIS]
      ,[Is_Antero_Well_GIS]
      ,[Midpoint_Latitude_GIS]
      ,[Midpoint_Longitude_GIS]
      ,[Operator_GIS]
      ,[Pad_Name_GIS]
      ,[Pad_Name_Antero_Standard_GIS]
      ,[Prospect_GIS]
      ,[SEQNUM_GIS]
      ,[Surface_Latitude_NAD27_GIS]
      ,[Surface_Location_Shape_GIS]
      ,[Surface_Longitude_NAD27_GIS]
      ,[Target_Formation_GIS]
      ,[Unit_Name_GIS]
      ,[Unit_Name_Antero_Standard_GIS]
      ,[Wellbore_Shape_GIS]
      ,[Wellbore_Shape_NAD27_BLM_GIS]
      ,[Wellbore_Name_GIS]
      ,[Wellbore_Name_Antero_Standard_GIS]
      ,[Spacing_East_GIS]
      ,[Spacing_West_GIS]
      ,[Type_Curve_Name_GIS]
      ,[Planned_Lateral_Spacing_GIS]
      ,[Oil_Yield_Grid_Code_GIS]
      ,[Unit_Acreage_GIS]
      ,[Property_Direction_GIS]
      ,[Gathering_Fee_Area_GIS]
      ,[Compressor_Area_GIS]
      ,[Compressor_Name_GIS]
      ,[Raw_Reserver_Category_GIS]
      ,[Surface_Location_NAD27_DMS_GIS]
      ,[BottomHole_Location_NAD27_DMS_GIS]
      ,[Aries_ID_Aries_Planning]
      ,[Wellbore_Name_Antero_Standard_Aries_Planning]
      ,[State_Name_Aries_Planning]
      ,[Configuration_Aries_Planning]
      ,[County_Aries_Planning]
      ,[Prospect_Aries_Planning]
      ,[API_Number_Aries_Planning]
      ,[Pad_Name_Aries_Planning]
      ,[Pad_Name_Antero_Standard_Aries_Planning]
      ,[SEQNUM_Aries_Planning]
      ,[Well_Number_Aries_Planning]
      ,[Drilled_Lateral_Length_Aries_Planning]
      ,[Cased_Lateral_Length_Aries_Planning]
      ,[Completed_Lateral_Length_Aries_Planning]
      ,[PropNum_Aries_Planning]
      ,[Current_Operations_Aries_Planning]
      ,[Total_Measured_Depth_Actual_Aries_Planning]
      ,[Total_Vertical_Depth_Aries_Planning]
      ,[Operator_Aries_Planning]
      ,[Working_Interest_Aries_Planning]
      ,[Net_Revenue_Interest_Aries_Planning]
      ,[First_Production_Date_Gas_Coalesced_Aries_Planning]
      ,[First_Production_Date_Gas_Actual_Aries_Planning]
      ,[Surface_Spud_Date_Actual_Aries_Planning]
      ,[Surface_Spud_Date_Aries_Planning]
      ,[Small_Rig_Spud_Date_Actual_Aries_Planning]
      ,[Shut_In_Date_Aries_Planning]
      ,[Basin_Aries_Planning]
      ,[Raw_Reserve_Category_Aries_Planning]
      ,[Reserve_Category_Aries_Planning]
      ,[API_State_Name_Aries_Planning]
      ,[API_County_Name_Aries_Planning]
      ,[Surface_Latitude_NAD27_Aries_Planning]
      ,[Surface_Longitude_NAD27_Aries_Planning]
      ,[Producing_Formation_Aries_Planning]
      ,[Unit_Name_Aries_Planning]
      ,[Longstring_Spud_Date_Actual_Aries_Planning]
      ,[Longstring_Spud_Date_Planned_Aries_Planning]
---   ,[Pad_Header_UID]
---   ,[Unit_Header_UID]

	  ,[Well_Name_Antero_Standard_Aries]
      ,[Well_Name_Antero_Standard_Enertia]
	  ,[Well_Name_Antero_Standard_FracSchedule]
      ,[Well_Name_Antero_Standard_Merrick]
      ,[Well_Name_Antero_Standard_Petra]
      ,[Well_Name_Antero_Standard_SigmaFlow]
      ,[Well_Name_Antero_Standard_WellView]
	  ,[Well_Name_Antero_Standard_GIS]
	  ,[Well_Name_Antero_Standard_Aries_Planning]

---   ,EDW_Is_Deleted_whm                   
---   ,EDW_Is_Deleted_wha                   
---   ,EDW_Is_Deleted_whe                   
---   ,EDW_Is_Deleted_whfs                 
---   ,EDW_Is_Deleted_whmk                 
---   ,EDW_Is_Deleted_whp                   
---   ,EDW_Is_Deleted_whsf                 
---   ,EDW_Is_Deleted_whwv                 
---   ,EDW_Is_Deleted_whg                   
---   ,EDW_Is_Deleted_whap                 
---   ,EDW_Is_Deleted_well_name_title_case 
---   ,EDW_Is_Deleted_well_name_proper_case

--------------SHAPE
FROM (
---1
    SELECT
--- SQL Prompt formatting off
    CONCAT(
	    IIF( whp.Hub_Well_Header_ID	IS NOT NULL, N'P', N'_')
	   ,IIF( wha.Hub_Well_Header_ID	IS NOT NULL, N'A', N'_')
	   ,IIF(whsf.Hub_Well_Header_ID IS NOT NULL, N'S', N'_')
	   ,IIF(whwv.Hub_Well_Header_ID IS NOT NULL, N'W', N'_')
	   ,IIF(whmk.Hub_Well_Header_ID IS NOT NULL, N'M', N'_')
	   ,IIF( whe.Hub_Well_Header_ID	IS NOT NULL, N'E', N'_')
	   ,IIF(whfs.Hub_Well_Header_ID IS NOT NULL, N'F', N'_')
	   ,IIF( whg.Hub_Well_Header_ID IS NOT NULL, N'G', N'_')
	   ,IIF(whap.Hub_Well_Header_ID IS NOT NULL, N'Ap',N'_')
   ) AS Sources

   ,CONCAT(
	    IIF( whm.Hub_Well_Header_ID	IS NOT NULL, N'C', N'_')
	   ,IIF( whp.Hub_Well_Header_ID	IS NOT NULL, N'P', N'_')
	   ,IIF( wha.Hub_Well_Header_ID	IS NOT NULL, N'A', N'_')
	   ,IIF(whsf.Hub_Well_Header_ID IS NOT NULL, N'S', N'_')
	   ,IIF(whwv.Hub_Well_Header_ID IS NOT NULL, N'W', N'_')
	   ,IIF(whmk.Hub_Well_Header_ID IS NOT NULL, N'M', N'_')
	   ,IIF( whe.Hub_Well_Header_ID	IS NOT NULL, N'E', N'_')
	   ,IIF(whfs.Hub_Well_Header_ID IS NOT NULL, N'F', N'_')
	   ,IIF( whg.Hub_Well_Header_ID IS NOT NULL, N'G', N'_')
	   ,IIF(whap.Hub_Well_Header_ID IS NOT NULL, N'Ap',N'_')
   ) AS [Sources With Core]

	  , whm.Hub_Well_Header_ID AS Hub_Well_Header_ID_C
	  , whp.Hub_Well_Header_ID AS Hub_Well_Header_ID_P
	  , wha.Hub_Well_Header_ID AS Hub_Well_Header_ID_A
	  ,whsf.Hub_Well_Header_ID AS Hub_Well_Header_ID_S
	  ,whwv.Hub_Well_Header_ID AS Hub_Well_Header_ID_W
	  ,whmk.Hub_Well_Header_ID AS Hub_Well_Header_ID_M
	  , whe.Hub_Well_Header_ID AS Hub_Well_Header_ID_E
	  ,whfs.Hub_Well_Header_ID AS Hub_Well_Header_ID_F
	  , whg.Hub_Well_Header_ID AS Hub_Well_Header_ID_G
	  ,whap.Hub_Well_Header_ID AS Hub_Well_Header_ID_Ap

--- SQL Prompt formatting on
   ,whm.Well_Name_Antero_Standard AS Well_Name                                      
   ,whm.Well_Name                 AS Well_Name_Original
   ,whm.SEQNUM
   ,whm.API_Number
   ,whm.Cost_Center
   ,wh.Hub_Well_Header_UID              AS Well_Header_UID
   ,wh.Hub_Well_Header_UID
---,Hub_Well_Header_ID
   ,whm.Petra_ID
   ,whm.Aries_ID
   ,whm.SigmaFlow_ID
   ,whm.WellView_ID
   ,whm.Merrick_ID
   ,whm.Enertia_ID
   ,whfs.FracSchedule_ID
   ,whg.GIS_ID
   ,whm.API_County_Name
   ,whm.API_State_Name
   ,whm.Big_Rig_Name
   ,whm.Big_Rig_Spud_Date
   ,whm.BTU_Grid_Code
   ,whm.Configuration

   ,whm.County
---,whm.Critical_Date_Report
   ,MAX(whm.Critical_Date_Report) OVER (PARTITION BY whm.Well_Name_Antero_Standard ORDER BY whm.Well_Name_Antero_Standard) AS Critical_Date_Report
   ,whm.Current_Operations_Status
   ,whm.Current_Operations_SubStatus
   ,whm.Current_Production_Status
   ,whm.Drilling_Operations_Pause_Date
   ,whm.Drilling_Operations_Resume_Date
   ,whm.First_Production_Date
   ,whm.Frac_End_Date
   ,whm.Frac_Start_Date
   ,whm.Net_Revenue_Interest
   ,whm.Operations_Comments
   ,whm.Operator
   ,whm.Pad_AFE_Number
   ,whm.Pad_Name
   ,whm.Pad_Name_Antero_Standard
   ,whm.Producing_Formation
   ,whm.PropNum
   ,whm.Prospect
   ,whm.Raw_Reserve_Category
   ,whm.Reserve_Category
   ,whm.Shut_In_Date
   ,whm.Small_Rig_Name
   ,whm.Small_Rig_Spud_Date
   ,whm.State_Name
   ,whm.Surface_Latitude_NAD27
   ,whm.Surface_Longitude_NAD27
   ,whm.Total_Vertical_Depth
   ,whm.Unit_Name
   ,whm.Unit_Name_Antero_Standard
   ,whm.Well_AFE_Number
   ,whm.Well_Name_Antero_Standard                                                                                                                                                                                                                                                                                                                                                                 AS Well_Name_Antero_Standard
   ,well_name_proper_case.Well_Name AS Well_Name_Proper_Case
   ,well_name_title_case.Well_Name  AS Well_Name_Title_Case
   ,whm.Well_Number
   ,whm.Wellbore_Name_Antero_Standard
   ,whm.Working_Interest
   ,whm.WSN_Number
   ,whm.Big_Rig_Spud_Date_Actual
   ,whm.Big_Rig_Spud_Date_Planned
   ,whm.Completion_Date_Actual
   ,whm.Conductor_Spud_Date_Actual
   ,whm.Drill_Out_End_Date_Planned
   ,whm.Drill_Out_Start_Date_Planned
   ,whm.Drilled_Lateral_Length_Actual
   ,whm.Drilled_Lateral_Length_Planned
   ,whm.Drilled_Lateral_Length
   ,whm.Completable_Lateral_Length
   ,whm.Completed_Lateral_length
   ,whm.Cased_Lateral_Length
   ,whm.Planned_Lateral_Length
   ,whm.First_Production_Date_Gas_Actual
   ,whm.First_Production_Date_Gas_Planned
   ,whm.First_Production_Date_Oil_Actual
   ,whm.First_Sales_Date_Gas_Actual
   ,whm.First_Sales_Date_Oil_Actual
   ,whm.Frac_End_Date_Actual
   ,whm.Frac_Start_Date_Actual
   ,whm.Rig_Release_Date_Actual
   ,whm.Rig_Release_Date_Planned
   ,whm.Small_Rig_Spud_Date_Actual
   ,whm.Small_Rig_Spud_Date_Planned
   ,whm.Surface_Spud_Date_Actual
   ,whm.Surface_Spud_Date_Planned
   ,whm.Total_Measured_Depth_Actual
   ,whm.Production_Id
   ,whm.First_Production_Date_EDW
   ,whm.Surface_Location_Shape
   ,whm.Pad_Name_Pad_Header
   ,whm.Unit_Name_Unit_Header
   ,whm.Well_Name_Pad_Header
   ,whm.Well_Name_Unit_Header
   ,whm.Longstring_Spud_Date_Planned
   ,whm.Longstring_Spud_Date_Actual
   ,whm.Critical_Date_Report_Default
   ,whm.Ground_Elevation
   ,whm.Pad_Id
   ,whm.Unit_Id
   ,whm.Area_Name
   ,whm.Group_Name
   ,whm.Route_Name
   ,whm.Planned_To_Spud_In_Next_2_Years
   ,whm.Planned_To_Spud_In_Next_5_Years
   ,whm.Planned_To_Spud_In_Next_5_Years_Default
   ,whm.Planned_To_Spud_In_Next_2_Years_Default
   ,whm.BottomHole_Latitude_NAD27
   ,whm.BottomHole_Longitude_NAD27
 
   ,whm.Design_Sand_Lbs_Per_Foot_Planned
   ,whm.Design_Water_BBls_Per_Foot_Planned
   ,whm.Frac_End_Date_Planned
   ,whm.Plug_Drillout_Days_Planned
   ,whm.Plug_Drillout_End_Date_Planned
   ,whm.Plug_Drillout_Start_Date_Planned
   --==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
   ,wha.Well_Name                                                                                                                                                                                                                                                                                                                                                                                 AS Well_Name_Aries
   ,wha.Well_Name_Antero_Standard                                                                                                                                                                                                                                                                                                                                                                 AS Well_Name_Antero_Standard_Aries
   ,wha.Wellbore_Name_Antero_Standard                                                                                                                                                                                                                                                                                                                                                             AS Wellbore_Name_Antero_Standard_Aries
   ,wha.State_Name                                                                                                                                                                                                                                                                                                                                                                                AS State_Name_Aries
   ,wha.Configuration                                                                                                                                                                                                                                                                                                                                                                             AS Configuration_Aries
   ,wha.County                                                                                                                                                                                                                                                                                                                                                                                    AS County_Aries
   ,wha.Prospect                                                                                                                                                                                                                                                                                                                                                                                  AS Prospect_Aries
   ,wha.API_Number                                                                                                                                                                                                                                                                                                                                                                                AS API_Number_Aries
   ,wha.Pad_Name                                                                                                                                                                                                                                                                                                                                                                                  AS Pad_Name_Aries
   ,wha.Pad_Name_Antero_Standard																																																																																								  AS Pad_Name_Antero_Standard_Aries
   ,wha.SEQNUM                                                                                                                                                                                                                                                                                                                                                                                    AS SEQNUM_Aries
   ,wha.Well_Number                                                                                                                                                                                                                                                                                                                                                                               AS Well_Number_Aries
   ,wha.Cased_Lateral_Length                                                                                                                                                                                                                                                                                                                                                                    AS Drilled_Lateral_Length_Aries
   ,wha.Cased_Lateral_Length                                                                                                                                                                                                                                                                                                                                                                    AS Cased_Lateral_Length_Aries
   ,wha.Completed_Lateral_Length																																																																																								  AS Completed_Lateral_Length_Aries
   ,wha.PropNum                                                                                                                                                                                                                                                                                                                                                                                   AS PropNum_Aries
   ,wha.Current_Operations                                                                                                                                                                                                                                                                                                                                                                        AS Current_Operations_Aries
   ,wha.Total_Measured_Depth_Actual                                                                                                                                                                                                                                                                                                                                                               AS Total_Measured_Depth_Actual_Aries
   ,wha.Total_Vertical_Depth                                                                                                                                                                                                                                                                                                                                                                      AS Total_Vertical_Depth_Aries
   ,wha.Operator                                                                                                                                                                                                                                                                                                                                                                                  AS Operator_Aries
   ,wha.Working_Interest                                                                                                                                                                                                                                                                                                                                                                          AS Working_Interest_Aries
   ,wha.Net_Revenue_Interest                                                                                                                                                                                                                                                                                                                                                                      AS Net_Revenue_Interest_Aries
   ,wha.First_Production_Date_Gas_Coalesced                                                                                                                                                                                                                                                                                                                                                       AS First_Production_Date_Gas_Coalesced_Aries
   ,wha.First_Production_Date_Gas_Actual                                                                                                                                                                                                                                                                                                                                                          AS First_Production_Date_Gas_Actual_Aries
   ,wha.Surface_Spud_Date_Actual                                                                                                                                                                                                                                                                                                                                                                  AS Surface_Spud_Date_Actual_Aries
   ,wha.Surface_Spud_Date                                                                                                                                                                                                                                                                                                                                                                         AS Surface_Spud_Date_Aries
   ,wha.Small_Rig_Spud_Date_Actual                                                                                                                                                                                                                                                                                                                                                                AS Small_Rig_Spud_Date_Actual_Aries
   ,wha.Shut_In_Date                                                                                                                                                                                                                                                                                                                                                                              AS Shut_In_Date_Aries
   ,wha.Basin                                                                                                                                                                                                                                                                                                                                                                                     AS Basin_Aries
   ,wha.Raw_Reserve_Category                                                                                                                                                                                                                                                                                                                                                                      AS Raw_Reserve_Category_Aries
   ,wha.RCNUM                           AS RCNUM_Aries
   ,wha.Reserve_Category                                                                                                                                                                                                                                                                                                                                                                          AS Reserve_Category_Aries
   ,wha.API_State_Name                                                                                                                                                                                                                                                                                                                                                                            AS API_State_Name_Aries
   ,wha.API_County_Name                                                                                                                                                                                                                                                                                                                                                                           AS API_County_Name_Aries
   ,wha.Surface_Latitude_NAD27                                                                                                                                                                                                                                                                                                                                                                    AS Surface_Latitude_NAD27_Aries
   ,wha.Surface_Longitude_NAD27                                                                                                                                                                                                                                                                                                                                                                   AS Surface_Longitude_NAD27_Aries
   ,wha.Producing_Formation																																																																																										  AS Producing_Formation_Aries
   ,wha.Eur_Gas_All																																																																																												  AS Eur_Gas_All_Aries     
   ,wha.Eur_BCF_1000FT																																																																																											  AS Eur_BCF_1000FT_Aries
   ,wha.EUR_PDP_ALL_BCFE																																																																																										  AS EUR_PDP_ALL_BCFE_Aries
   ,wha.EUR_BCFE_1000FT                                                                                                                                                                                                                                                                                                                                                         				  AS EUR_BCFE_1000FT_Aries 
   ,wha.EUR_BO_ALL                      AS EUR_BO_ALL_Aries
   ,wha.[EUR_BO/FT]                     AS [EUR_BO/FT_Aries]
   ,wha.Unit_Name                                                                                                                                                                                                                                                                                                                                                                                 AS Unit_Name_Aries
   ,wha.Longstring_Spud_Date_Actual		AS Longstring_Spud_Date_Actual_Aries
   ,wha.Longstring_Spud_Date_Planned	AS Longstring_Spud_Date_Planned_Aries
---,NULL		                        AS Big_Rig_Spud_Date_Planned_Aries
---,NULL                                AS Big_Rig_Spud_Date_Actual_Aries
   --==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
   ,whe.Well_Name                                                                                                                                                                                                                                                                                                                                                                                 AS Well_Name_Enertia
   ,whe.Well_Name_Antero_Standard                                                                                                                                                                                                                                                                                                                                                                 AS Well_Name_Antero_Standard_Enertia
   ,whe.Wellbore_Name_Antero_Standard                                                                                                                                                                                                                                                                                                                                                             AS Wellbore_Name_Antero_Standard_Enertia
   ,whe.State_Name                                                                                                                                                                                                                                                                                                                                                                                AS State_Name_Enertia
   ,whe.County                                                                                                                                                                                                                                                                                                                                                                                    AS County_Enertia
   ,whe.API_Number                                                                                                                                                                                                                                                                                                                                                                                AS API_Number_Enertia
   ,whe.Pad_Name                                                                                                                                                                                                                                                                                                                                                                                  AS Pad_Name_Enertia
   ,whe.Pad_Name_Antero_Standard																																																																																								  AS Pad_Name_Antero_Standard_Enertia
   ,whe.SEQNUM                                                                                                                                                                                                                                                                                                                                                                                    AS SEQNUM_Enertia
   ,whe.Enertia_ID                                                                                                                                                                                                                                                                                                                                                                                AS EnertiaID_Enertia
   ,whe.Current_Operations                                                                                                                                                                                                                                                                                                                                                                        AS Current_Operations_Enertia
   ,whe.Operator                                                                                                                                                                                                                                                                                                                                                                                  AS Operator_Enertia
   ,whe.Cost_Center                                                                                                                                                                                                                                                                                                                                                                               AS Cost_Center_Enertia
   ,whe.Working_Interest                                                                                                                                                                                                                                                                                                                                                                          AS Working_Interest_Enertia
   ,whe.Net_Revenue_Interest                                                                                                                                                                                                                                                                                                                                                                      AS Net_Revenue_Interest_Enertia
   ,whe.First_Production_Date_Gas_Actual                                                                                                                                                                                                                                                                                                                                                          AS First_Production_Date_Gas_Actual_Enertia
   ,whe.First_Production_Date_Oil_Actual                                                                                                                                                                                                                                                                                                                                                          AS First_Production_Date_Oil_Actual_Enertia
   ,whe.API_State_Name                                                                                                                                                                                                                                                                                                                                                                            AS API_State_Name_Enertia
   ,whe.API_County_Name                                                                                                                                                                                                                                                                                                                                                                           AS API_County_Name_Enertia
   ,whe.Pad_AFE_Number                                                                                                                                                                                                                                                                                                                                                                            AS Pad_AFE_Number_Enertia
   ,whe.Well_AFE_Number                                                                                                                                                                                                                                                                                                                                                                           AS Well_AFE_Number_Enertia
   ,whe.Unit_Name                                                                                                                                                                                                                                                                                                                                                                                 AS Unit_Name_Enertia
   --==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
   ,whfs.Completions_Group_Name                                                                                                                                                                                                                                                                                                                                                                   AS Completions_Group_Name_FracSchedule
   ,whfs.Design_Sand_Lbs_Per_Foot_Planned                                                                                                                                                                                                                                                                                                                                                         AS Design_Sand_Lbs_Per_Foot_Planned_FracSchedule
   ,whfs.Design_Water_BBls_Per_Foot_Planned                                                                                                                                                                                                                                                                                                                                                       AS Design_Water_BBls_Per_Foot_Planned_FracSchedule
   ,whfs.Drilled_Lateral_Length                                                                                                                                                                                                                                                                                                                                                                   AS Drilled_Lateral_Length_FracSchedule
   ,whfs.Frac_End_Date_Planned                                                                                                                                                                                                                                                                                                                                                                    AS Frac_End_Date_Planned_FracSchedule
   ,whfs.Longstring_Spud_Date                                                                                                                                                                                                                                                                                                                                                                     AS Longstring_Spud_Date_FracSchedule
   ,whfs.Plug_Drillout_Days_Planned                                                                                                                                                                                                                                                                                                                                                               AS Plug_Drillout_Days_Planned_FracSchedule
   ,whfs.Plug_Drillout_End_Date_Planned                                                                                                                                                                                                                                                                                                                                                           AS Plug_Drillout_End_Date_Planned_FracSchedule
   ,whfs.Plug_Drillout_Start_Date_Planned                                                                                                                                                                                                                                                                                                                                                         AS Plug_Drillout_Start_Date_Planned_FracSchedule
   ,whfs.Prospect                                                                                                                                                                                                                                                                                                                                                                                 AS Prospect_FracSchedule
   ,whfs.SEQNUM                                                                                                                                                                                                                                                                                                                                                                                   AS SEQNUM_FracSchedule
   ,whfs.Pad_Name																																																																																												  AS Pad_Name_FracSchedule
   ,whfs.Pad_Name_Antero_Standard																																																																																								  AS Pad_Name_Antero_Standard_FracSchedule
   ,whfs.State_Name                                                                                                                                                                                                                                                                                                                                                                               AS State_Name_FracSchedule
   ,whfs.Total_Water_Needed_For_Frac                                                                                                                                                                                                                                                                                                                                                              AS Total_Water_Needed_For_Frac_FracSchedule
   ,whfs.Well_Name_Antero_Standard                                                                                                                                                                                                                                                                                                                                                                AS Well_Name_Antero_Standard_FracSchedule
   ,whfs.Well_Name                                                                                                                                                                                                                                                                                                                                                                                AS Well_Name_FracSchedule
   ,whfs.Well_Rig_Release_Date                                                                                                                                                                                                                                                                                                                                                                    AS Well_Rig_Release_Date_FracSchedule
   ,whfs.Wellbore_Name_Antero_Standard                                                                                                                                                                                                                                                                                                                                                            AS Wellbore_Name_Antero_Standard_FracSchedule
   ,whfs.First_Production_Date_Gas_Planned                                                                                                                                                                                                                                                                                                                                                        AS First_Production_Date_Gas_Planned_FracSchedule
---,whfs.FracSchedule_ID
   ,whfs.Frac_Start_Date_Planned         AS Frac_Start_Date_Planned_FracSchedule
   ,whfs.Pad_Rig_Release_Date            AS Pad_Rig_Release_Date_FracSchedule
   --==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
   ,whmk.Well_Name                                                                                                                                                                                                                                                                                                                                                                                AS Well_Name_Merrick
   ,whmk.Well_Name_Antero_Standard                                                                                                                                                                                                                                                                                                                                                                AS Well_Name_Antero_Standard_Merrick
   ,whmk.Wellbore_Name_Antero_Standard                                                                                                                                                                                                                                                                                                                                                            AS Wellbore_Name_Antero_Standard_Merrick
   ,whmk.State_Name                                                                                                                                                                                                                                                                                                                                                                               AS State_Name_Merrick
   ,whmk.Configuration                                                                                                                                                                                                                                                                                                                                                                            AS Configuration_Merrick
   ,whmk.County                                                                                                                                                                                                                                                                                                                                                                                   AS County_Merrick
   ,whmk.API_Number                                                                                                                                                                                                                                                                                                                                                                               AS API_Number_Merrick
   ,whmk.Pad_Name                                                                                                                                                                                                                                                                                                                                                                                 AS Pad_Name_Merrick
   ,whmk.Pad_Name_Antero_Standard        AS Pad_Name_Antero_Standard_Merrick   
   ,whmk.Well_Number                                                                                                                                                                                                                                                                                                                                                                              AS Well_Number_Merrick
   ,whmk.Enertia_ID                                                                                                                                                                                                                                                                                                                                                                               AS EnertiaID_Merrick
   ,whmk.PropNum                                                                                                                                                                                                                                                                                                                                                                                  AS PropNum_Merrick
   ,whmk.Current_Operations                                                                                                                                                                                                                                                                                                                                                                       AS Current_Operations_Merrick
   ,whmk.Cost_Center                                                                                                                                                                                                                                                                                                                                                                              AS Cost_Center_Merrick
   ,whmk.First_Production_Date_Gas_Actual                                                                                                                                                                                                                                                                                                                                                         AS First_Production_Date_Gas_Actual_Merrick
   ,whmk.First_Production_Date_Oil_Actual                                                                                                                                                                                                                                                                                                                                                         AS First_Production_Date_Oil_Actual_Merrick
   ,whmk.First_Sales_Date_Gas_Actual                                                                                                                                                                                                                                                                                                                                                              AS First_Sales_Date_Gas_Actual_Merrick
   ,whmk.First_Sales_Date_Oil_Actual                                                                                                                                                                                                                                                                                                                                                              AS First_Sales_Date_Oil_Actual_Merrick
   ,whmk.Shut_In_Date                                                                                                                                                                                                                                                                                                                                                                             AS Shut_In_Date_Merrick
   ,whmk.API_State_Name                                                                                                                                                                                                                                                                                                                                                                           AS API_State_Name_Merrick
   ,whmk.API_County_Name                                                                                                                                                                                                                                                                                                                                                                          AS API_County_Name_Merrick
   ,whmk.Current_Production_Status                                                                                                                                                                                                                                                                                                                                                                AS Current_Production_Status_Merrick
   ,whmk.Area_Name                                                                                                                                                                                                                                                                                                                                                                                AS Area_Name_Merrick
   ,whmk.Group_Name                                                                                                                                                                                                                                                                                                                                                                               AS Group_Name_Merrick
   ,whmk.Route_Name                                                                                                                                                                                                                                                                                                                                                                               AS Route_Name_Merrick
   --==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
   ,whp.Well_Name                                                                                                                                                                                                                                                                                                                                                                                 AS Well_Name_Petra
   ,whp.Well_Name_Antero_Standard                                                                                                                                                                                                                                                                                                                                                                 AS Well_Name_Antero_Standard_Petra
   ,whp.Wellbore_Name_Antero_Standard                                                                                                                                                                                                                                                                                                                                                             AS Wellbore_Name_Antero_Standard_Petra
   ,whp.State_Name                                                                                                                                                                                                                                                                                                                                                                                AS State_Name_Petra
   ,whp.Configuration                                                                                                                                                                                                                                                                                                                                                                             AS Configuration_Petra
   ,whp.County                                                                                                                                                                                                                                                                                                                                                                                    AS County_Petra
   ,whp.Prospect                                                                                                                                                                                                                                                                                                                                                                                  AS Prospect_Petra
   ,whp.API_Number                                                                                                                                                                                                                                                                                                                                                                                AS API_Number_Petra
   ,whp.Pad_Name                                                                                                                                                                                                                                                                                                                                                                                  AS Pad_Name_Petra
   ,whp.Pad_Name_Antero_Standard																																																																																								  AS Pad_Name_Antero_Standard_Petra
   ,whp.WSN_Number                                                                                                                                                                                                                                                                                                                                                                                AS WSN_Number_Petra
   ,whp.SEQNUM                                                                                                                                                                                                                                                                                                                                                                                    AS SEQNUM_Petra
   ,whp.Well_Number                                                                                                                                                                                                                                                                                                                                                                               AS Well_Number_Petra
   ,whp.Drilled_Lateral_Length_Planned                                                                                                                                                                                                                                                                                                                                                            AS Drilled_Lateral_Length_Planned_Petra
   ,whp.Drilled_Lateral_Length_Actual                                                                                                                                                                                                                                                                                                                                                             AS Drilled_Lateral_Length_Actual_Petra
   ,whp.Cased_Lateral_Length																																																																																									  AS Cased_Lateral_Length_Petra
   ,whp.Completable_Lateral_Length																																																																																								  AS Completable_Lateral_Length_Petra
   ,whp.Scrubbed_Lateral_Length																																																																																									  AS Scrubbed_Lateral_Length_Petra
   ,whp.USA_Sticks_Lateral_Length																																																																																								  AS USA_Sticks_Lateral_Length_Petra
   ,whp.Third_Party_Lateral_Length																																																																																								  AS Third_Party_Lateral_Length_Petra
   ,whp.Estimated_Lateral_Length																																																																																							      AS Estimated_Lateral_Length_Petra
   ,whp.Drilled_Lateral_Length																																																																																									  AS Drilled_Lateral_Length_Petra
   ,whp.Big_Rig_Name                                                                                                                                                                                                                                                                                                                                                                              AS Big_Rig_Name_Petra
   ,whp.Current_Operations                                                                                                                                                                                                                                                                                                                                                                        AS Current_Operations_Petra
   ,whp.Total_Measured_Depth_Actual                                                                                                                                                                                                                                                                                                                                                               AS Total_Measured_Depth_Actual_Petra
   ,whp.Operator                                                                                                                                                                                                                                                                                                                                                                                  AS Operator_Petra
   ,whp.Big_Rig_Spud_Date_Actual                                                                                                                                                                                                                                                                                                                                                                  AS Big_Rig_Spud_Date_Actual_Petra
   ,whp.Completion_Date_Actual                                                                                                                                                                                                                                                                                                                                                                    AS Completion_Date_Actual_Petra
   ,whp.API_State_Name                                                                                                                                                                                                                                                                                                                                                                            AS API_State_Name_Petra
   ,whp.API_County_Name                                                                                                                                                                                                                                                                                                                                                                           AS API_County_Name_Petra
   ,whp.Surface_Latitude_NAD27                                                                                                                                                                                                                                                                                                                                                                    AS Surface_Latitude_NAD27_Petra
   ,whp.Surface_Longitude_NAD27                                                                                                                                                                                                                                                                                                                                                                   AS Surface_Longitude_NAD27_Petra
   ,whp.Producing_Formation                                                                                                                                                                                                                                                                                                                                                                       AS Producing_Formation_Petra
   ,whp.Unit_Name                                                                                                                                                                                                                                                                                                                                                                                 AS Unit_Name_Petra
   ,whp.Ground_Elevation                                                                                                                                                                                                                                                                                                                                                                          AS Ground_Elevation_Petra
   ,whp.Symbol_Code                                                                                                                                                                                                                                                                                                                                                                               AS Symbol_Code_Petra
   ,whp.BottomHole_Latitude_NAD27                                                                                                                                                                                                                                                                                                                                                                 AS BottomHole_Latitude_NAD27_Petra
   ,whp.BottomHole_Longitude_NAD27                                                                                                                                                                                                                                                                                                                                                                AS BottomHole_Longitude_NAD27_Petra
   --==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
   ,whsf.Well_Name                                                                                                                                                                                                                                                                                                                                                                                AS Well_Name_SigmaFlow
   ,whsf.Well_Name_Antero_Standard                                                                                                                                                                                                                                                                                                                                                                AS Well_Name_Antero_Standard_SigmaFlow
   ,whsf.Wellbore_Name_Antero_Standard                                                                                                                                                                                                                                                                                                                                                            AS Wellbore_Name_Antero_Standard_SigmaFlow
   ,whsf.State_Name                                                                                                                                                                                                                                                                                                                                                                               AS State_Name_SigmaFlow
   ,whsf.County                                                                                                                                                                                                                                                                                                                                                                                   AS County_SigmaFlow
   ,whsf.Prospect                                                                                                                                                                                                                                                                                                                                                                                 AS Prospect_SigmaFlow
   ,whsf.API_Number                                                                                                                                                                                                                                                                                                                                                                               AS API_Number_SigmaFlow
   ,whsf.Pad_Name                                                                                                                                                                                                                                                                                                                                                                                 AS Pad_Name_SigmaFlow
   ,whsf.Pad_Name_Antero_Standard																																																																																								  AS Pad_Name_Antero_Standard_Sigmaflow															
   ,whsf.WSN_Number                                                                                                                                                                                                                                                                                                                                                                               AS WSN_Number_SigmaFlow
   ,whsf.SEQNUM                                                                                                                                                                                                                                                                                                                                                                                   AS SEQNUM_SigmaFlow
   ,whsf.Drilled_Lateral_Length_Planned																																																																																							  AS Drilled_Lateral_Length_Planned_SigmaFlow
   ,whsf.Drilled_Lateral_Length																																																																																									  AS Drilled_Lateral_Length_SigmaFlow
   ,whsf.Actual_Lateral_Length																																																																																									  AS Actual_Lateral_Length_Sigmaflow
   ,whsf.Planned_Lateral_Length																																																																																									  AS Planned_Lateral_Length_Sigmaflow
   ,whsf.Permitted_Lateral_Length																																																																																								  AS Permitted_Lateral_Length_Sigmaflow   
   ,whsf.Big_Rig_Name                                                                                                                                                                                                                                                                                                                                                                             AS Big_Rig_Name_SigmaFlow
   ,whsf.Small_Rig_Name                                                                                                                                                                                                                                                                                                                                                                           AS Small_Rig_Name_SigmaFlow
   ,whsf.First_Production_Date_Gas_Planned                                                                                                                                                                                                                                                                                                                                                        AS First_Production_Date_Gas_Planned_SigmaFlow
   ,whsf.Surface_Spud_Date_Planned                                                                                                                                                                                                                                                                                                                                                                AS Surface_Spud_Date_Planned_SigmaFlow
   ,whsf.Surface_Spud_Date_Actual                                                                                                                                                                                                                                                                                                                                                                 AS Surface_Spud_Date_Actual_SigmaFlow
   ,whsf.Big_Rig_Spud_Date_Actual                                                                                                                                                                                                                                                                                                                                                                 AS Big_Rig_Spud_Date_Actual_SigmaFlow
   ,whsf.Big_Rig_Spud_Date_Planned                                                                                                                                                                                                                                                                                                                                                                AS Big_Rig_Spud_Date_Planned_SigmaFlow
   ,whsf.Small_Rig_Spud_Date_Actual                                                                                                                                                                                                                                                                                                                                                               AS Small_Rig_Spud_Date_Actual_SigmaFlow
   ,whsf.Small_Rig_Spud_Date_Planned                                                                                                                                                                                                                                                                                                                                                              AS Small_Rig_Spud_Date_Planned_SigmaFlow
   ,whsf.Rig_Release_Date_Actual                                                                                                                                                                                                                                                                                                                                                                  AS Rig_Release_Date_Actual_SigmaFlow
   ,whsf.Rig_Release_Date_Planned                                                                                                                                                                                                                                                                                                                                                                 AS Rig_Release_Date_Planned_SigmaFlow
   ,whsf.API_State_Name                                                                                                                                                                                                                                                                                                                                                                           AS API_State_Name_SigmaFlow
   ,whsf.API_County_Name                                                                                                                                                                                                                                                                                                                                                                          AS API_County_Name_SigmaFlow
   ,whsf.Frac_Start_Date                                                                                                                                                                                                                                                                                                                                                                          AS Frac_Start_Date_SigmaFlow
   ,whsf.Frac_End_Date                                                                                                                                                                                                                                                                                                                                                                            AS Frac_End_Date_SigmaFlow
   ,whsf.Drill_Out_Start_Date_Planned                                                                                                                                                                                                                                                                                                                                                             AS Drill_Out_Start_Date_Planned_SigmaFlow
   ,whsf.Drill_Out_End_Date_Planned                                                                                                                                                                                                                                                                                                                                                               AS Drill_Out_End_Date_Planned_SigmaFlow
   ,whsf.Unit_Name                                                                                                                                                                                                                                                                                                                                                                                AS Unit_Name_SigmaFlow
   ,whsf.Longstring_Spud_Date_Planned                                                                                                                                                                                                                                                                                                                                                             AS Longstring_Spud_Date_Planned_SigmaFlow
   ,whsf.Planned_To_Spud_In_Next_5_Years                                                                                                                                                                                                                                                                                                                                                          AS Planned_To_Spud_In_Next_5_Years_SigmaFlow
   ,whsf.Planned_To_Spud_In_Next_2_Years                                                                                                                                                                                                                                                                                                                                                          AS Planned_To_Spud_In_Next_2_Years_SigmaFlow
   ,whsf.Permit_Status                  AS Permit_Status_Sigmaflow
   ,whsf.Permit_Status_Date             AS Permit_Status_Date_Sigmaflow
   --==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
   ,whwv.Well_Name                                                                                                                                                                                                                                                                                                                                                                                AS Well_Name_WellView
   ,whwv.Well_Name_Antero_Standard                                                                                                                                                                                                                                                                                                                                                                AS Well_Name_Antero_Standard_WellView
   ,whwv.State_Name                                                                                                                                                                                                                                                                                                                                                                               AS State_Name_WellView
   ,whwv.Configuration                                                                                                                                                                                                                                                                                                                                                                            AS Configuration_WellView
   ,whwv.County                                                                                                                                                                                                                                                                                                                                                                                   AS County_WellView
   ,whwv.Prospect                                                                                                                                                                                                                                                                                                                                                                                 AS Prospect_WellView
   ,whwv.API_Number                                                                                                                                                                                                                                                                                                                                                                               AS API_Number_WellView
   ,whwv.Pad_Name                                                                                                                                                                                                                                                                                                                                                                                 AS Pad_Name_WellView
   ,whwv.Pad_Name_Antero_Standard																																																																																							      AS Pad_Name_Antero_Standard_Wellview
   ,whwv.Completable_Lateral_Length                                                                                                                                                                                                                                                                                                                                                               AS Drilled_Lateral_Length_Actual_Wellview
   ,whwv.Completable_Lateral_Length                                                                                                                                                                                                                                                                                                                                                               AS Drilled_Completed_Lateral_Length
   ,whwv.Completable_Lateral_Length                                                                                                                                                                                                                                                                                                                                                               AS Completable_Lateral_Length_WellView
   ,whwv.Completed_Lateral_Length																																																																																								  AS Completed_Lateral_Length_Wellview
   ,whwv.Completed_Lateral_Length																																																																																								  AS Completed_Stages_Lateral_Length
   ,whwv.Big_Rig_Name                                                                                                                                                                                                                                                                                                                                                                             AS Big_Rig_Name_WellView
   ,whwv.Current_Operations                                                                                                                                                                                                                                                                                                                                                                       AS Current_Operations_WellView
   ,whwv.Total_Measured_Depth_Actual                                                                                                                                                                                                                                                                                                                                                              AS Total_Measured_Depth_Actual_WellView
   ,whwv.Operator                                                                                                                                                                                                                                                                                                                                                                                 AS Operator_WellView
   ,whwv.Small_Rig_Name                                                                                                                                                                                                                                                                                                                                                                           AS Small_Rig_Name_WellView
   ,whwv.Cost_Center                                                                                                                                                                                                                                                                                                                                                                              AS Cost_Center_WellView
   ,whwv.Working_Interest                                                                                                                                                                                                                                                                                                                                                                         AS Working_Interest_WellView
   ,whwv.Net_Revenue_Interest                                                                                                                                                                                                                                                                                                                                                                     AS Net_Revenue_Interest_WellView
   ,whwv.Operations_Comments                                                                                                                                                                                                                                                                                                                                                                      AS Operations_Comments_WellView
   ,whwv.First_Sales_Date_Gas_Actual                                                                                                                                                                                                                                                                                                                                                              AS First_Sales_Date_Gas_Actual_WellView
   ,whwv.Conductor_Spud_Date_Actual                                                                                                                                                                                                                                                                                                                                                               AS Conductor_Spud_Date_Actual_WellView
   ,whwv.Surface_Spud_Date_Actual                                                                                                                                                                                                                                                                                                                                                                 AS Surface_Spud_Date_Actual_WellView
   ,whwv.Big_Rig_Spud_Date_Actual                                                                                                                                                                                                                                                                                                                                                                 AS Big_Rig_Spud_Date_Actual_WellView
   ,whwv.Small_Rig_Spud_Date_Actual                                                                                                                                                                                                                                                                                                                                                               AS Small_Rig_Spud_Date_Actual_WellView
   ,whwv.Completion_Date_Actual                                                                                                                                                                                                                                                                                                                                                                   AS Completion_Date_Actual_WellView
   ,whwv.Shut_In_Date                                                                                                                                                                                                                                                                                                                                                                             AS Shut_In_Date_WellView
   ,whwv.Rig_Release_Date_Actual                                                                                                                                                                                                                                                                                                                                                                  AS Rig_Release_Date_Actual_WellView
   ,whwv.Drilling_Operations_Pause_Date                                                                                                                                                                                                                                                                                                                                                           AS Drilling_Operations_Pause_Date_WellView
   ,whwv.Drilling_Operations_Resume_Date                                                                                                                                                                                                                                                                                                                                                          AS Drilling_Operations_Resume_Date_WellView
   ,whwv.Basin                                                                                                                                                                                                                                                                                                                                                                                    AS Basin_WellView
---,whwv.Critical_Date_Report                                                                                                                                                                                                                                                                                                                                                                     AS Critical_Date_Report_WellView
   ,MAX(whwv.Critical_Date_Report) OVER (PARTITION BY whwv.Well_Name_Antero_Standard ORDER BY whwv.Well_Name)                                                                                                                                                                                                                                                                                     AS Critical_Date_Report_WellView                                       
   ,whwv.API_State_Name                                                                                                                                                                                                                                                                                                                                                                           AS API_State_Name_WellView
   ,whwv.API_County_Name                                                                                                                                                                                                                                                                                                                                                                          AS API_County_Name_WellView
   ,whwv.Surface_Latitude_NAD27                                                                                                                                                                                                                                                                                                                                                                   AS Surface_Latitude_NAD27_WellView
   ,whwv.Surface_Longitude_NAD27                                                                                                                                                                                                                                                                                                                                                                  AS Surface_Longitude_NAD27_WellView
   ,whwv.Current_Operations_Status                                                                                                                                                                                                                                                                                                                                                                AS Current_Operations_Status_WellView
   ,whwv.Current_Operations_SubStatus                                                                                                                                                                                                                                                                                                                                                             AS Current_Operations_SubStatus_WellView
   ,whwv.Producing_Formation                                                                                                                                                                                                                                                                                                                                                                      AS Producing_Formation_WellView
   ,whwv.Frac_Start_Date_Actual                                                                                                                                                                                                                                                                                                                                                                   AS Frac_Start_Date_Actual_WellView
   ,whwv.Frac_End_Date_Actual                                                                                                                                                                                                                                                                                                                                                                     AS Frac_End_Date_Actual_WellView
   ,whwv.Planned_To_Spud_In_Next_5_Years                                                                                                                                                                                                                                                                                                                                                          AS Planned_To_Spud_In_Next_5_Years_WellView
   ,whwv.Planned_To_Spud_In_Next_2_Years                                                                                                                                                                                                                                                                                                                                                          AS Planned_To_Spud_In_Next_2_Years_WellView
   ,whwv.Casing_Set_Depth            AS Casing_Set_Depth_Wellview
   ,whwv.TD_Date                     AS TD_Date_Wellview
   ,whwv.Top_Hole_End_Date           AS Top_Hole_End_Date_Wellview
   ,whwv.Max_TVD                     AS Max_TVD_Wellview
   ,whwv.Last_Survey_MD              AS Last_Survey_MD_Wellview
   ,whwv.Last_Survey_TVD             AS Last_Survey_TVD_Wellview
   ,whwv.Longstring_Spud_Date_Actual																																																																																							  AS Longstring_Spud_Date_Actual_Wellview
   --==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
    ,whg.API_Number                  AS API_Number_GIS
    ,whg.API_State_Name              AS API_State_Name_GIS
    ,whg.Big_Rig_Name                AS Big_Rig_Name_GIS
    ,whg.BottomHole_Latitude_NAD27   AS BottomHole_Latitude_NAD27_GIS
    ,whg.BottomHole_Longitude_NAD27  AS BottomHole_Longitude_NAD27_GIS
    ,whg.BottomHole_Location_Shape   AS BottomHole_Location_Shape_GIS
	,whg.BTU_Grid_Code               AS BTU_Grid_Code_GIS
    ,whg.Configuration               AS Configuration_GIS
---	,whg.GIS_ID
    ,whg.Planned_Lateral_Length      AS Planned_Lateral_Length_GIS
	,whg.Is_Antero_Well              AS Is_Antero_Well_GIS
    ,whg.Midpoint_Latitude           AS Midpoint_Latitude_GIS
	,whg.Midpoint_Longitude          AS Midpoint_Longitude_GIS
	,whg.Operator                    AS Operator_GIS
    ,whg.Pad_Name                    AS Pad_Name_GIS
    ,whg.Pad_Name_Antero_Standard    AS Pad_Name_Antero_Standard_GIS
    ,whg.Prospect                    AS Prospect_GIS
    ,whg.SEQNUM                      AS SEQNUM_GIS
    ,whg.Surface_Latitude_NAD27      AS Surface_Latitude_NAD27_GIS
    ,whg.Surface_Location_Shape      AS Surface_Location_Shape_GIS
    ,whg.Surface_Longitude_NAD27     AS Surface_Longitude_NAD27_GIS
    ,whg.Target_Formation            AS Target_Formation_GIS
    ,whg.Unit_Name                   AS Unit_Name_GIS
    ,whg.Unit_Name_Antero_Standard   AS Unit_Name_Antero_Standard_GIS
    ,whg.Well_Name                   AS Well_Name_GIS
    ,whg.Well_Name_Antero_Standard   AS Well_Name_Antero_Standard_GIS
    ,whg.Wellbore_Shape              AS Wellbore_Shape_GIS
    ,whg.Wellbore_Shape_NAD27_BLM    AS Wellbore_Shape_NAD27_BLM_GIS
	,whg.Wellbore_Name               AS Wellbore_Name_GIS
	,whg.Wellbore_Name_Antero_Standard AS Wellbore_Name_Antero_Standard_GIS 
	,whg.Spacing_East                  AS Spacing_East_GIS
	,whg.Spacing_West                  AS Spacing_West_GIS
	,whg.Type_Curve_Name               AS Type_Curve_Name_GIS
	,whg.Planned_Lateral_Spacing       AS Planned_Lateral_Spacing_GIS
	,whg.Oil_Yield_Grid_Code           AS Oil_Yield_Grid_Code_GIS
	,whg.Unit_Acreage                  AS Unit_Acreage_GIS
	,whg.Property_Direction            AS Property_Direction_GIS
	,whg.Gathering_Fee_Area            AS Gathering_Fee_Area_GIS
	,whg.Compressor_Area               AS Compressor_Area_GIS
	,whg.Compressor_Name               AS Compressor_Name_GIS
	,whg.Raw_Reserve_Category          AS Raw_Reserver_Category_GIS
	, IIF(whg.Surface_Latitude_NAD27 IS NOT NULL AND whg.Surface_Latitude_NAD27 IS NOT NULL,
      CONCAT(FLOOR(ABS(whg.Surface_latitude_nad27)), 
	  NCHAR(176) , 	' ',	
		 	 CONVERT(INT,CONVERT(DECIMAL(17,10),ABS(whg.Surface_Latitude_NAD27*60)) % 60),
			  ''' ',
			 CONVERT(DECIMAL(4,2),CONVERT(DECIMAL(17,10),ABS(whg.Surface_Latitude_NAD27)*3600) % 60) ,  IIF(whg.Surface_Latitude_NAD27 < 0,'" S & ', '" N & '),
			 FLOOR(ABS(whg.Surface_longitude_nad27)), 
	  NCHAR(176) , 	' ',	
		 	 CONVERT(INT,CONVERT(DECIMAL(17,10),ABS(whg.Surface_longitude_NAD27*60)) % 60),
			  ''' ',
			 CONVERT(DECIMAL(4,2),CONVERT(DECIMAL(17,10),ABS(whg.Surface_longitude_NAD27)*3600) % 60) , IIF(whg.Surface_longitude_NAD27 < 0,'" W', '" E')),NULL) AS Surface_Location_NAD27_DMS_GIS
     ,IIF(whg.BottomHole_Latitude_NAD27 IS NOT NULL AND whg.BottomHole_Latitude_NAD27 IS NOT NULL,CONCAT(FLOOR(ABS(whg.BottomHole_latitude_nad27)), 
	  NCHAR(176) , 	' ',	
		 	 CONVERT(INT,CONVERT(DECIMAL(17,10),ABS(whg.BottomHole_Latitude_NAD27*60)) % 60),
			  ''' ',
			 CONVERT(DECIMAL(4,2),CONVERT(DECIMAL(17,10),ABS(whg.BottomHole_Latitude_NAD27)*3600) % 60) ,  IIF(whg.BottomHole_Latitude_NAD27 < 0,'" S & ', '" N & '),
			 FLOOR(ABS(whg.BottomHole_longitude_nad27)) , 
	  NCHAR(176) , 	' ',	
		 	 CONVERT(INT,CONVERT(DECIMAL(17,10),ABS(whg.BottomHole_longitude_NAD27*60)) % 60),
			  ''' ',
			 CONVERT(DECIMAL(4,2),CONVERT(DECIMAL(17,10),ABS(whg.BottomHole_longitude_NAD27)*3600) % 60) , IIF(whg.BottomHole_longitude_NAD27 < 0,'" W', '" E')),NULL) AS BottomHole_Location_NAD27_DMS_GIS
   --==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
   ,whap.Aries_ID AS Aries_ID_Aries_Planning
   ,whap.Well_Name                                                                                                                                                                                                                                                                                                                                                                                 AS Well_Name_Aries_Planning
   ,whap.Well_Name_Antero_Standard                                                                                                                                                                                                                                                                                                                                                                 AS Well_Name_Antero_Standard_Aries_Planning
   ,whap.Wellbore_Name_Antero_Standard                                                                                                                                                                                                                                                                                                                                                             AS Wellbore_Name_Antero_Standard_Aries_Planning
   ,whap.State_Name                                                                                                                                                                                                                                                                                                                                                                                AS State_Name_Aries_Planning
   ,whap.Configuration                                                                                                                                                                                                                                                                                                                                                                             AS Configuration_Aries_Planning
   ,whap.County                                                                                                                                                                                                                                                                                                                                                                                    AS County_Aries_Planning
   ,whap.Prospect                                                                                                                                                                                                                                                                                                                                                                                  AS Prospect_Aries_Planning
   ,whap.API_Number                                                                                                                                                                                                                                                                                                                                                                                AS API_Number_Aries_Planning
   ,whap.Pad_Name                                                                                                                                                                                                                                                                                                                                                                                  AS Pad_Name_Aries_Planning
   ,whap.Pad_Name_Antero_Standard																																																																																								  AS Pad_Name_Antero_Standard_Aries_Planning
   ,whap.SEQNUM                                                                                                                                                                                                                                                                                                                                                                                    AS SEQNUM_Aries_Planning
   ,whap.Well_Number                                                                                                                                                                                                                                                                                                                                                                               AS Well_Number_Aries_Planning
   ,whap.Cased_Lateral_Length                                                                                                                                                                                                                                                                                                                                                                    AS Drilled_Lateral_Length_Aries_Planning
   ,whap.Cased_Lateral_Length                                                                                                                                                                                                                                                                                                                                                                    AS Cased_Lateral_Length_Aries_Planning
   ,whap.Completed_Lateral_Length																																																																																								  AS Completed_Lateral_Length_Aries_Planning
   ,whap.PropNum                                                                                                                                                                                                                                                                                                                                                                                   AS PropNum_Aries_Planning
   ,whap.Current_Operations                                                                                                                                                                                                                                                                                                                                                                        AS Current_Operations_Aries_Planning
   ,whap.Total_Measured_Depth_Actual                                                                                                                                                                                                                                                                                                                                                               AS Total_Measured_Depth_Actual_Aries_Planning
   ,whap.Total_Vertical_Depth                                                                                                                                                                                                                                                                                                                                                                      AS Total_Vertical_Depth_Aries_Planning
   ,whap.Operator                                                                                                                                                                                                                                                                                                                                                                                  AS Operator_Aries_Planning
   ,whap.Working_Interest                                                                                                                                                                                                                                                                                                                                                                          AS Working_Interest_Aries_Planning
   ,whap.Net_Revenue_Interest                                                                                                                                                                                                                                                                                                                                                                      AS Net_Revenue_Interest_Aries_Planning
   ,whap.First_Production_Date_Gas_Coalesced                                                                                                                                                                                                                                                                                                                                                       AS First_Production_Date_Gas_Coalesced_Aries_Planning
   ,whap.First_Production_Date_Gas_Actual                                                                                                                                                                                                                                                                                                                                                          AS First_Production_Date_Gas_Actual_Aries_Planning
   ,whap.Surface_Spud_Date_Actual                                                                                                                                                                                                                                                                                                                                                                  AS Surface_Spud_Date_Actual_Aries_Planning
   ,whap.Surface_Spud_Date                                                                                                                                                                                                                                                                                                                                                                         AS Surface_Spud_Date_Aries_Planning
   ,whap.Small_Rig_Spud_Date_Actual                                                                                                                                                                                                                                                                                                                                                                AS Small_Rig_Spud_Date_Actual_Aries_Planning
   ,whap.Shut_In_Date                                                                                                                                                                                                                                                                                                                                                                              AS Shut_In_Date_Aries_Planning
   ,whap.Basin                                                                                                                                                                                                                                                                                                                                                                                     AS Basin_Aries_Planning
   ,whap.Raw_Reserve_Category                                                                                                                                                                                                                                                                                                                                                                      AS Raw_Reserve_Category_Aries_Planning
   ,whap.Reserve_Category                                                                                                                                                                                                                                                                                                                                                                          AS Reserve_Category_Aries_Planning
   ,whap.API_State_Name                                                                                                                                                                                                                                                                                                                                                                            AS API_State_Name_Aries_Planning
   ,whap.API_County_Name                                                                                                                                                                                                                                                                                                                                                                           AS API_County_Name_Aries_Planning
   ,whap.Surface_Latitude_NAD27                                                                                                                                                                                                                                                                                                                                                                    AS Surface_Latitude_NAD27_Aries_Planning
   ,whap.Surface_Longitude_NAD27                                                                                                                                                                                                                                                                                                                                                                   AS Surface_Longitude_NAD27_Aries_Planning
   ,whap.Producing_Formation																																																																																										  AS Producing_Formation_Aries_Planning
   ,whap.Unit_Name                                                                                                                                                                                                                                                                                                                                                                                 AS Unit_Name_Aries_Planning
   ,whap.Longstring_Spud_Date_Actual	AS Longstring_Spud_Date_Actual_Aries_Planning
   ,whap.Longstring_Spud_Date_Planned	AS Longstring_Spud_Date_Planned_Aries_Planning
   --==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
---,pad_link.Hub_Pad_Header_UID                                                                                                                                                                                                                                                                                                                                                                   AS Pad_Header_UID
---,unit_link.Hub_Unit_Header_UID                                                                                                                                                                                                                                                                                                                                                                 AS Unit_Header_UID
   --==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
   ,whm.                  EDW_Is_Deleted AS EDW_Is_Deleted_whm                   
   ,wha.                  EDW_Is_Deleted AS EDW_Is_Deleted_wha                   
   ,whe.                  EDW_Is_Deleted AS EDW_Is_Deleted_whe                   
   ,whfs.                 EDW_Is_Deleted AS EDW_Is_Deleted_whfs                 
   ,whmk.                 EDW_Is_Deleted AS EDW_Is_Deleted_whmk                 
   ,whp.                  EDW_Is_Deleted AS EDW_Is_Deleted_whp                   
   ,whsf.                 EDW_Is_Deleted AS EDW_Is_Deleted_whsf                 
   ,whwv.                 EDW_Is_Deleted AS EDW_Is_Deleted_whwv                 
   ,whg.                  EDW_Is_Deleted AS EDW_Is_Deleted_whg                   
   ,whap.                 EDW_Is_Deleted AS EDW_Is_Deleted_whap                 
   ,well_name_title_case. EDW_Is_Deleted AS EDW_Is_Deleted_well_name_title_case 
   ,well_name_proper_case.EDW_Is_Deleted AS EDW_Is_Deleted_well_name_proper_case
   ,whm.                  EDW_Create_Date AS EDW_Create_Date_whm                   
   ,wha.                  EDW_Create_Date AS EDW_Create_Date_wha                   
   ,whe.                  EDW_Create_Date AS EDW_Create_Date_whe                   
   ,whfs.                 EDW_Create_Date AS EDW_Create_Date_whfs                 
   ,whmk.                 EDW_Create_Date AS EDW_Create_Date_whmk                 
   ,whp.                  EDW_Create_Date AS EDW_Create_Date_whp                   
   ,whsf.                 EDW_Create_Date AS EDW_Create_Date_whsf                 
   ,whwv.                 EDW_Create_Date AS EDW_Create_Date_whwv                 
   ,whg.                  EDW_Create_Date AS EDW_Create_Date_whg                   
   ,whap.                 EDW_Create_Date AS EDW_Create_Date_whap   

---select *
FROM          
              Master.Hub_Well_Header                 AS wh
    LEFT JOIN 
              Master.Sat_Well_Header                 AS whm       ON wh.Hub_Well_Header_ID   = whm.Hub_Well_Header_ID
---                                                                 AND whm.EDW_Is_Deleted   = 0
    LEFT JOIN Master.Sat_Well_Header_Aries           AS wha       ON wh.Hub_Well_Header_ID   = wha.Hub_Well_Header_ID
                                                                    AND wha.EDW_Is_Deleted   = 0
    LEFT JOIN Master.Sat_Well_Header_Enertia         AS whe       ON wh.Hub_Well_Header_ID   = whe.Hub_Well_Header_ID
                                                                    AND whe.EDW_Is_Deleted   = 0
    LEFT JOIN Master.Sat_Well_Header_FracSchedule    AS whfs      ON wh.Hub_Well_Header_ID   = whfs.Hub_Well_Header_ID
                                                                    AND whfs.EDW_Is_Deleted = 0
    LEFT JOIN Master.Sat_Well_Header_Merrick         AS whmk      ON wh.Hub_Well_Header_ID   = whmk.Hub_Well_Header_ID
                                                                    AND whmk.EDW_Is_Deleted = 0
    LEFT JOIN Master.Sat_Well_Header_Petra           AS whp       ON wh.Hub_Well_Header_ID   = whp.Hub_Well_Header_ID
                                                                    AND whp.EDW_Is_Deleted   = 0
    LEFT JOIN Master.Sat_Well_Header_SigmaFlow       AS whsf      ON wh.Hub_Well_Header_ID   = whsf.Hub_Well_Header_ID
                                                                    AND whsf.EDW_Is_Deleted = 0
    LEFT JOIN Master.Sat_Well_Header_WellView        AS whwv      ON wh.Hub_Well_Header_ID   = whwv.Hub_Well_Header_ID
                                                                    AND whwv.EDW_Is_Deleted = 0
    LEFT JOIN Master.Sat_Well_Header_GIS			 AS whg       ON wh.Hub_Well_Header_ID   = whg.Hub_Well_Header_ID
                                                                    AND whg.EDW_Is_Deleted  = 0
	LEFT JOIN Master.Sat_Well_Header_Aries_Planning  AS whap      ON wh.Hub_Well_Header_ID   = whap.Hub_Well_Header_ID
                                                                    AND whap.EDW_Is_Deleted = 0
--- LEFT JOIN Master.Link_Pad_Header__Well_Header    AS pad_link  ON whm.Hub_Well_Header_UID  = pad_link.Hub_Well_Header_UID
---                                                                     AND pad_link.EDW_Is_Deleted  = 0
--- LEFT JOIN Master.Link_Unit_Header__Well_Header   AS unit_link ON whm.Hub_Well_Header_UID  = unit_link.Hub_Well_Header_UID
---                                                                     AND unit_link.EDW_Is_Deleted = 0
    LEFT JOIN Master.Sat_Well_Header_Alias_Well_Name AS well_name_title_case  ON wh.Hub_Well_Header_UID = well_name_title_case.Hub_Well_Header_UID
                                                                              AND well_name_title_case.Sat_Well_Header_Alias_Well_Name_Type_ID = 1
                                                                              AND well_name_title_case.EDW_Is_Deleted = 0
    LEFT JOIN Master.Sat_Well_Header_Alias_Well_Name AS well_name_proper_case ON wh.Hub_Well_Header_UID = well_name_proper_case.Hub_Well_Header_UID
                                                                              AND well_name_proper_case.Sat_Well_Header_Alias_Well_Name_Type_ID = 2
                                                                              AND well_name_proper_case.EDW_Is_Deleted = 0
WHERE
     wh.EDW_Is_Deleted = 0
---AND  wha.EDW_Is_Deleted = 0
---AND  whe.EDW_Is_Deleted = 0
---AND whfs.EDW_Is_Deleted = 0
---AND whmk.EDW_Is_Deleted = 0
---AND  whp.EDW_Is_Deleted = 0
---AND whsf.EDW_Is_Deleted = 0
---AND whwv.EDW_Is_Deleted = 0
---AND  whg.EDW_Is_Deleted = 0
---AND whap.EDW_Is_Deleted = 0
AND
(
whm.well_name                   IS NOT NULL OR 
wha.well_name                   IS NOT NULL OR 
whe.well_name                   IS NOT NULL OR 
whfs.well_name                  IS NOT NULL OR 
whmk.well_name                  IS NOT NULL OR 
whp.well_name                   IS NOT NULL OR 
whsf.well_name                  IS NOT NULL OR 
whwv.well_name                  IS NOT NULL OR 
whg.well_name                   IS NOT NULL OR 
whap.well_name                  IS NOT NULL OR
well_name_title_case.well_name  IS NOT NULL OR 
well_name_proper_case.well_name IS NOT NULL
)
---1
) aa
---2
---AND   wh.Hub_Well_Header_UID NOT IN 
---(SELECT DISTINCT Well_Header_Uid FROM [Master].[Dim_Well_Header_Dedup])

) bb
---3
) cc
---4
GO


