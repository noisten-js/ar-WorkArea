USE [EDW]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Master].[Dim_Well_Header_Core_Update_Hub_Table]') AND type IN (N'U'))
DROP TABLE [Master].[Dim_Well_Header_Core_Update_Hub_Table]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Master].[Dim_Well_Header_Core_Update_Hub_Table](
	[Well_Name_Antero_Standard] [VARCHAR](300) NULL,
	[Sources] [NVARCHAR](10) NULL,
	[Sources Rank] [BIGINT] NULL,
	[Sources Length] [INT] NULL,
	[Type] [VARCHAR](9) NULL,
	[Well_Header_UID] [UNIQUEIDENTIFIER] NULL,
	[Hub_Well_Header_ID_C] [BIGINT] NULL,
	[SEQNUM] [INT] NULL,
	[API_Number] [VARCHAR](30) NULL,
	[Cost_Center] [VARCHAR](20) NULL,
	[Sources_Unique] [NVARCHAR](10) NULL,
	[Type_Unique] [VARCHAR](6) NULL,
	[Well_Header_UID_Unique] [UNIQUEIDENTIFIER] NULL,
	[Hub_Well_Header_ID_C_Unique] [BIGINT] NULL,
	[SEQNUM_Unique] [INT] NULL,
	[API_Number_Unique] [VARCHAR](30) NULL,
	[Cost_Center_Unique] [VARCHAR](20) NULL,
	[SigmaFlow Integration with SEQNUM Unique] [VARCHAR](3) NULL,
	[SigmaFlow Integration GIS with SEQNUM Unique] [VARCHAR](3) NULL,
	[Sources_Duplicate] [NVARCHAR](10) NULL,
	[Type_Duplicate] [VARCHAR](9) NULL,
	[Well_Header_UID_Duplicate] [UNIQUEIDENTIFIER] NULL,
	[Hub_Well_Header_ID_C_Duplicate] [BIGINT] NULL,
	[SEQNUM_Duplicate] [INT] NULL,
	[API_Number_Duplicate] [VARCHAR](30) NULL,
	[Cost_Center_Duplicate] [VARCHAR](20) NULL,
	[SigmaFlow Integration with SEQNUM Duplicate] [VARCHAR](3) NULL,
	[SigmaFlow Integration GIS with SEQNUM Duplicate] [VARCHAR](3) NULL
) ON [PRIMARY]
GO

-------------------------------------------------------------------------------------------------------------

USE [EDW]


GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER VIEW [Master].[Dim_Well_Header_Core]
AS

SELECT 
---    [Type]
       [Well_Name]
      ,[Sources]
      ,[Sources Core]
      ,[Sources Max]
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
      ,[EDW_Create_Date]
      ,[Hub_Well_Header_ID]
      ,[Rownum Seqnum Length Date Hub]
      ,[Rownum Seqnum LengthMax Date Hub]
      ,[Rownum Seqnum LengthMax Date Hub2]
      ,[Rownum Well Length Date Hub]
      ,[Rownum Well LengthMax Date Hub]
      ,[Rownum Well Seq Length Date Hub]
      ,[Rownum Well Seq LengthMax Date Hub]
      ,[Source Length Base]
      ,[Source Length Core]
      ,[Source Length Max]
      ,[Source Length Max_SEQNUM]
      ,[Sources_CGAWMPESFAp]
      ,[Drilled_Lateral_Length_Actual_Wellview]
      ,[Drilled_Lateral_Length_Aries]
      ,[Pad_Header_UID]
      ,[Unit_Header_UID]
      ,[ETL_Load_Date]
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
  FROM [EDW].[Master].[Dim_Well_Header]
GO

