SELECT
	 Type														= CAST(NULL AS VARCHAR(11))
	,cc.Well_Name
	,Sources													= CAST(cc.Sources AS VARCHAR(10))
	,Sources_Core												= CAST(NULL AS VARCHAR(10))
	,Sources_Max												= CAST(NULL AS VARCHAR(10))
	,cc.SEQNUM
	,cc.API_Number
	,cc.Cost_Center
	,cc.Well_Header_UID
	,cc.Petra_ID
	,cc.Aries_ID
	,cc.SigmaFlow_ID
	,cc.WellView_ID
	,cc.Merrick_ID
	,cc.Enertia_ID
	,cc.FracSchedule_ID
	,cc.GIS_ID
	,cc.API_County_Name
	,cc.API_State_Name
	,cc.Big_Rig_Name
	,cc.Big_Rig_Spud_Date
	,cc.BTU_Grid_Code
	,cc.CONFIGURATION
	,cc.County
	,cc.Critical_Date_Report
	,cc.Current_Operations_Status
	,cc.Current_Operations_SubStatus
	,cc.Current_Production_Status
	,cc.Drilling_Operations_Pause_Date
	,cc.Drilling_Operations_Resume_Date
	,cc.First_Production_Date
	,cc.Frac_End_Date
	,cc.Frac_Start_Date
	,cc.Net_Revenue_Interest
	,cc.Operations_Comments
	,cc.Operator
	,cc.Pad_AFE_Number
	,cc.Pad_Name
	,cc.Pad_Name_Antero_Standard
	,cc.Producing_Formation
	,cc.PropNum
	,cc.Prospect
	,cc.Raw_Reserve_Category
	,cc.Reserve_Category
	,cc.Shut_In_Date
	,cc.Small_Rig_Name
	,cc.Small_Rig_Spud_Date
	,cc.State_Name
	,cc.Surface_Latitude_NAD27
	,cc.Surface_Longitude_NAD27
	,cc.Total_Vertical_Depth
	,cc.Unit_Name
	,cc.Unit_Name_Antero_Standard
	,cc.Well_AFE_Number
	,cc.Well_Name_Antero_Standard
	,cc.Well_Number
	,cc.Wellbore_Name_Antero_Standard
	,cc.Working_Interest
	,cc.WSN_Number
	,cc.Big_Rig_Spud_Date_Actual
	,cc.Big_Rig_Spud_Date_Planned
	,cc.Completion_Date_Actual
	,cc.Conductor_Spud_Date_Actual
	,cc.Drill_Out_End_Date_Planned
	,cc.Drill_Out_Start_Date_Planned
	,cc.Drilled_Lateral_Length_Actual
	,cc.Drilled_Lateral_Length_Planned
	,cc.Drilled_Lateral_Length
	,cc.Completable_Lateral_Length
	,cc.Completed_Lateral_Length
	,cc.Cased_Lateral_Length
	,cc.Planned_Lateral_Length
	,cc.First_Production_Date_Gas_Actual
	,cc.First_Production_Date_Gas_Planned
	,cc.First_Production_Date_Oil_Actual
	,cc.First_Sales_Date_Gas_Actual
	,cc.First_Sales_Date_Oil_Actual
	,cc.Frac_End_Date_Actual
	,cc.Frac_Start_Date_Actual
	,cc.Rig_Release_Date_Actual
	,cc.Rig_Release_Date_Planned
	,cc.Small_Rig_Spud_Date_Actual
	,cc.Small_Rig_Spud_Date_Planned
	,cc.Surface_Spud_Date_Actual
	,cc.Surface_Spud_Date_Planned
	,cc.Total_Measured_Depth_Actual
	,cc.Production_Id
	,cc.First_Production_Date_EDW
	,cc.Pad_Name_Pad_Header
	,cc.Unit_Name_Unit_Header
	,cc.Well_Name_Pad_Header
	,cc.Well_Name_Unit_Header
	,cc.Longstring_Spud_Date_Planned
	,cc.Longstring_Spud_Date_Actual
	,cc.Critical_Date_Report_Default
	,cc.Ground_Elevation
	,cc.Pad_Id
	,cc.Unit_Id
	,cc.Area_Name
	,cc.Group_Name
	,cc.Route_Name
	,cc.Planned_To_Spud_In_Next_2_Years
	,cc.Planned_To_Spud_In_Next_5_Years
	,cc.Planned_To_Spud_In_Next_5_Years_Default
	,cc.Planned_To_Spud_In_Next_2_Years_Default
	,cc.BottomHole_Latitude_NAD27
	,cc.BottomHole_Longitude_NAD27
	,cc.Design_Sand_Lbs_Per_Foot_Planned
	,cc.Design_Water_BBls_Per_Foot_Planned
	,cc.Frac_End_Date_Planned
	,cc.Plug_Drillout_Days_Planned
	,cc.Plug_Drillout_End_Date_Planned
	,cc.Plug_Drillout_Start_Date_Planned
	,cc.Well_Name_Aries
	,cc.Well_Name_Antero_Standard_Aries
	,cc.Wellbore_Name_Antero_Standard_Aries
	,cc.State_Name_Aries
	,cc.Configuration_Aries
	,cc.County_Aries
	,cc.Prospect_Aries
	,cc.API_Number_Aries
	,cc.Pad_Name_Aries
	,cc.Pad_Name_Antero_Standard_Aries
	,cc.SEQNUM_Aries
	,cc.Well_Number_Aries
	,cc.Cased_Lateral_Length_Aries
	,cc.Completed_Lateral_Length_Aries
	,cc.PropNum_Aries
	,cc.Current_Operations_Aries
	,cc.Total_Measured_Depth_Actual_Aries
	,cc.Total_Vertical_Depth_Aries
	,cc.Operator_Aries
	,cc.Working_Interest_Aries
	,cc.Net_Revenue_Interest_Aries
	,cc.First_Production_Date_Gas_Coalesced_Aries
	,cc.First_Production_Date_Gas_Actual_Aries
	,cc.Surface_Spud_Date_Actual_Aries
	,cc.Surface_Spud_Date_Aries
	,cc.Small_Rig_Spud_Date_Actual_Aries
	,cc.Shut_In_Date_Aries
	,cc.Basin_Aries
	,cc.Raw_Reserve_Category_Aries
	,cc.RCNUM_Aries
	,cc.Reserve_Category_Aries
	,cc.API_State_Name_Aries
	,cc.API_County_Name_Aries
	,cc.Surface_Latitude_NAD27_Aries
	,cc.Surface_Longitude_NAD27_Aries
	,cc.Producing_Formation_Aries
	,cc.Eur_Gas_All_Aries
	,cc.Eur_BCF_1000FT_Aries
	,cc.EUR_PDP_ALL_BCFE_Aries
	,cc.EUR_BCFE_1000FT_Aries
	,cc.EUR_BO_ALL_Aries
	,cc.[EUR_BO/FT_Aries]
	,cc.Unit_Name_Aries
	,cc.Longstring_Spud_Date_Actual_Aries
	,cc.Longstring_Spud_Date_Planned_Aries
	,cc.Well_Name_Enertia
	,cc.Well_Name_Antero_Standard_Enertia
	,cc.Wellbore_Name_Antero_Standard_Enertia
	,cc.State_Name_Enertia
	,cc.County_Enertia
	,cc.API_Number_Enertia
	,cc.Pad_Name_Enertia
	,cc.Pad_Name_Antero_Standard_Enertia
	,cc.SEQNUM_Enertia
	,cc.EnertiaID_Enertia
	,cc.Current_Operations_Enertia
	,cc.Operator_Enertia
	,cc.Cost_Center_Enertia
	,cc.Working_Interest_Enertia
	,cc.Net_Revenue_Interest_Enertia
	,cc.First_Production_Date_Gas_Actual_Enertia
	,cc.First_Production_Date_Oil_Actual_Enertia
	,cc.API_State_Name_Enertia
	,cc.API_County_Name_Enertia
	,cc.Pad_AFE_Number_Enertia
	,cc.Well_AFE_Number_Enertia
	,cc.Unit_Name_Enertia
	,cc.Completions_Group_Name_FracSchedule
	,cc.Design_Sand_Lbs_Per_Foot_Planned_FracSchedule
	,cc.Design_Water_BBls_Per_Foot_Planned_FracSchedule
	,cc.Drilled_Lateral_Length_FracSchedule
	,cc.Frac_End_Date_Planned_FracSchedule
	,cc.Longstring_Spud_Date_FracSchedule
	,cc.Plug_Drillout_Days_Planned_FracSchedule
	,cc.Plug_Drillout_End_Date_Planned_FracSchedule
	,cc.Plug_Drillout_Start_Date_Planned_FracSchedule
	,cc.Prospect_FracSchedule
	,cc.SEQNUM_FracSchedule
	,cc.Pad_Name_FracSchedule
	,cc.Pad_Name_Antero_Standard_FracSchedule
	,cc.State_Name_FracSchedule
	,cc.Total_Water_Needed_For_Frac_FracSchedule
	,cc.Well_Name_Antero_Standard_FracSchedule
	,cc.Well_Name_FracSchedule
	,cc.Well_Rig_Release_Date_FracSchedule
	,cc.Wellbore_Name_Antero_Standard_FracSchedule
	,cc.First_Production_Date_Gas_Planned_FracSchedule
	,cc.Frac_Start_Date_Planned_FracSchedule
	,cc.Pad_Rig_Release_Date_FracSchedule
	,cc.Well_Name_Merrick
	,cc.Well_Name_Antero_Standard_Merrick
	,cc.Wellbore_Name_Antero_Standard_Merrick
	,cc.State_Name_Merrick
	,cc.Configuration_Merrick
	,cc.County_Merrick
	,cc.API_Number_Merrick
	,cc.Pad_Name_Merrick
	,cc.Pad_Name_Antero_Standard_Merrick
	,cc.Well_Number_Merrick
	,cc.EnertiaID_Merrick
	,cc.PropNum_Merrick
	,cc.Current_Operations_Merrick
	,cc.Cost_Center_Merrick
	,cc.First_Production_Date_Gas_Actual_Merrick
	,cc.First_Production_Date_Oil_Actual_Merrick
	,cc.First_Sales_Date_Gas_Actual_Merrick
	,cc.First_Sales_Date_Oil_Actual_Merrick
	,cc.Shut_In_Date_Merrick
	,cc.API_State_Name_Merrick
	,cc.API_County_Name_Merrick
	,cc.Current_Production_Status_Merrick
	,cc.Area_Name_Merrick
	,cc.Group_Name_Merrick
	,cc.Route_Name_Merrick
	,cc.Well_Name_Petra
	,cc.Well_Name_Antero_Standard_Petra
	,cc.Wellbore_Name_Antero_Standard_Petra
	,cc.State_Name_Petra
	,cc.Configuration_Petra
	,cc.County_Petra
	,cc.Prospect_Petra
	,cc.API_Number_Petra
	,cc.Pad_Name_Petra
	,cc.Pad_Name_Antero_Standard_Petra
	,cc.WSN_Number_Petra
	,cc.SEQNUM_Petra
	,cc.Well_Number_Petra
	,cc.Drilled_Lateral_Length_Planned_Petra
	,cc.Drilled_Lateral_Length_Actual_Petra
	,cc.Cased_Lateral_Length_Petra
	,cc.Completable_Lateral_Length_Petra
	,cc.Scrubbed_Lateral_Length_Petra
	,cc.USA_Sticks_Lateral_Length_Petra
	,cc.Third_Party_Lateral_Length_Petra
	,cc.Estimated_Lateral_Length_Petra
	,cc.Drilled_Lateral_Length_Petra
	,cc.Big_Rig_Name_Petra
	,cc.Current_Operations_Petra
	,cc.Total_Measured_Depth_Actual_Petra
	,cc.Operator_Petra
	,cc.Big_Rig_Spud_Date_Actual_Petra
	,cc.Completion_Date_Actual_Petra
	,cc.API_State_Name_Petra
	,cc.API_County_Name_Petra
	,cc.Surface_Latitude_NAD27_Petra
	,cc.Surface_Longitude_NAD27_Petra
	,cc.Producing_Formation_Petra
	,cc.Unit_Name_Petra
	,cc.Ground_Elevation_Petra
	,cc.Symbol_Code_Petra
	,cc.BottomHole_Latitude_NAD27_Petra
	,cc.BottomHole_Longitude_NAD27_Petra
	,cc.Well_Name_SigmaFlow
	,cc.Well_Name_Antero_Standard_SigmaFlow
	,cc.Wellbore_Name_Antero_Standard_SigmaFlow
	,cc.State_Name_SigmaFlow
	,cc.County_SigmaFlow
	,cc.Prospect_SigmaFlow
	,cc.API_Number_SigmaFlow
	,cc.Pad_Name_SigmaFlow
	,cc.Pad_Name_Antero_Standard_Sigmaflow
	,cc.WSN_Number_SigmaFlow
	,cc.SEQNUM_SigmaFlow
	,cc.Drilled_Lateral_Length_Planned_SigmaFlow
	,cc.Drilled_Lateral_Length_SigmaFlow
	,cc.Actual_Lateral_Length_Sigmaflow
	,cc.Planned_Lateral_Length_Sigmaflow
	,cc.Permitted_Lateral_Length_Sigmaflow
	,cc.Big_Rig_Name_SigmaFlow
	,cc.Small_Rig_Name_SigmaFlow
	,cc.First_Production_Date_Gas_Planned_SigmaFlow
	,cc.Surface_Spud_Date_Planned_SigmaFlow
	,cc.Surface_Spud_Date_Actual_SigmaFlow
	,cc.Big_Rig_Spud_Date_Actual_SigmaFlow
	,cc.Big_Rig_Spud_Date_Planned_SigmaFlow
	,cc.Small_Rig_Spud_Date_Actual_SigmaFlow
	,cc.Small_Rig_Spud_Date_Planned_SigmaFlow
	,cc.Rig_Release_Date_Actual_SigmaFlow
	,cc.Rig_Release_Date_Planned_SigmaFlow
	,cc.API_State_Name_SigmaFlow
	,cc.API_County_Name_SigmaFlow
	,cc.Frac_Start_Date_SigmaFlow
	,cc.Frac_End_Date_SigmaFlow
	,cc.Drill_Out_Start_Date_Planned_SigmaFlow
	,cc.Drill_Out_End_Date_Planned_SigmaFlow
	,cc.Unit_Name_SigmaFlow
	,cc.Longstring_Spud_Date_Planned_SigmaFlow
	,cc.Planned_To_Spud_In_Next_5_Years_SigmaFlow
	,cc.Planned_To_Spud_In_Next_2_Years_SigmaFlow
	,cc.Permit_Status_Sigmaflow
	,cc.Permit_Status_Date_Sigmaflow
	,cc.Well_Name_WellView
	,cc.Well_Name_Antero_Standard_WellView
	,cc.State_Name_WellView
	,cc.Configuration_WellView
	,cc.County_WellView
	,cc.Prospect_WellView
	,cc.API_Number_WellView
	,cc.Pad_Name_WellView
	,cc.Pad_Name_Antero_Standard_Wellview
	,cc.Completable_Lateral_Length_WellView
	,cc.Completed_Lateral_Length_Wellview
	,cc.Big_Rig_Name_WellView
	,cc.Current_Operations_WellView
	,cc.Total_Measured_Depth_Actual_WellView
	,cc.Operator_WellView
	,cc.Small_Rig_Name_WellView
	,cc.Cost_Center_WellView
	,cc.Working_Interest_WellView
	,cc.Net_Revenue_Interest_WellView
	,cc.Operations_Comments_WellView
	,cc.First_Sales_Date_Gas_Actual_WellView
	,cc.Conductor_Spud_Date_Actual_WellView
	,cc.Surface_Spud_Date_Actual_WellView
	,cc.Big_Rig_Spud_Date_Actual_WellView
	,cc.Small_Rig_Spud_Date_Actual_WellView
	,cc.Completion_Date_Actual_WellView
	,cc.Shut_In_Date_WellView
	,cc.Rig_Release_Date_Actual_WellView
	,cc.Drilling_Operations_Pause_Date_WellView
	,cc.Drilling_Operations_Resume_Date_WellView
	,cc.Basin_WellView
	,cc.Critical_Date_Report_WellView
	,cc.API_State_Name_WellView
	,cc.API_County_Name_WellView
	,cc.Surface_Latitude_NAD27_WellView
	,cc.Surface_Longitude_NAD27_WellView
	,cc.Current_Operations_Status_WellView
	,cc.Current_Operations_SubStatus_WellView
	,cc.Producing_Formation_WellView
	,cc.Frac_Start_Date_Actual_WellView
	,cc.Frac_End_Date_Actual_WellView
	,cc.Planned_To_Spud_In_Next_5_Years_WellView
	,cc.Planned_To_Spud_In_Next_2_Years_WellView
	,cc.Casing_Set_Depth_Wellview
	,cc.TD_Date_Wellview
	,cc.Top_Hole_End_Date_Wellview
	,cc.Max_TVD_Wellview
	,cc.Last_Survey_MD_Wellview
	,cc.Last_Survey_TVD_Wellview
	,cc.Longstring_Spud_Date_Actual_Wellview
	,cc.API_Number_GIS
	,cc.API_State_Name_GIS
	,cc.Big_Rig_Name_GIS
	,cc.BottomHole_Latitude_NAD27_GIS
	,cc.BottomHole_Longitude_NAD27_GIS
	,cc.BTU_Grid_Code_GIS
	,cc.Configuration_GIS
	,cc.Planned_Lateral_Length_GIS
	,cc.Is_Antero_Well_GIS
	,cc.Midpoint_Latitude_GIS
	,cc.Midpoint_Longitude_GIS
	,cc.Operator_GIS
	,cc.Pad_Name_GIS
	,cc.Pad_Name_Antero_Standard_GIS
	,cc.Prospect_GIS
	,cc.SEQNUM_GIS
	,cc.Surface_Latitude_NAD27_GIS
	,cc.Surface_Longitude_NAD27_GIS
	,cc.Target_Formation_GIS
	,cc.Unit_Name_GIS
	,cc.Unit_Name_Antero_Standard_GIS
	,cc.Well_Name_GIS
	,cc.Well_Name_Antero_Standard_GIS
	,cc.Wellbore_Name_GIS
	,cc.Wellbore_Name_Antero_Standard_GIS
	,cc.Spacing_East_GIS
	,cc.Spacing_West_GIS
	,cc.Type_Curve_Name_GIS
	,cc.Planned_Lateral_Spacing_GIS
	,cc.Oil_Yield_Grid_Code_GIS
	,cc.Unit_Acreage_GIS
	,cc.Property_Direction_GIS
	,cc.Gathering_Fee_Area_GIS
	,cc.Compressor_Area_GIS
	,cc.Compressor_Name_GIS
	,cc.Raw_Reserver_Category_GIS
	,cc.Aries_ID_Aries_Planning
	,cc.Well_Name_Aries_Planning
	,cc.Well_Name_Antero_Standard_Aries_Planning
	,cc.Wellbore_Name_Antero_Standard_Aries_Planning
	,cc.State_Name_Aries_Planning
	,cc.Configuration_Aries_Planning
	,cc.County_Aries_Planning
	,cc.Prospect_Aries_Planning
	,cc.API_Number_Aries_Planning
	,cc.Pad_Name_Aries_Planning
	,cc.Pad_Name_Antero_Standard_Aries_Planning
	,cc.SEQNUM_Aries_Planning
	,cc.Well_Number_Aries_Planning
	,cc.Cased_Lateral_Length_Aries_Planning
	,cc.Completed_Lateral_Length_Aries_Planning
	,cc.PropNum_Aries_Planning
	,cc.Current_Operations_Aries_Planning
	,cc.Total_Measured_Depth_Actual_Aries_Planning
	,cc.Total_Vertical_Depth_Aries_Planning
	,cc.Operator_Aries_Planning
	,cc.Working_Interest_Aries_Planning
	,cc.Net_Revenue_Interest_Aries_Planning
	,cc.First_Production_Date_Gas_Coalesced_Aries_Planning
	,cc.First_Production_Date_Gas_Actual_Aries_Planning
	,cc.Surface_Spud_Date_Actual_Aries_Planning
	,cc.Surface_Spud_Date_Aries_Planning
	,cc.Small_Rig_Spud_Date_Actual_Aries_Planning
	,cc.Shut_In_Date_Aries_Planning
	,cc.Basin_Aries_Planning
	,cc.Raw_Reserve_Category_Aries_Planning
	,cc.Reserve_Category_Aries_Planning
	,cc.API_State_Name_Aries_Planning
	,cc.API_County_Name_Aries_Planning
	,cc.Surface_Latitude_NAD27_Aries_Planning
	,cc.Surface_Longitude_NAD27_Aries_Planning
	,cc.Producing_Formation_Aries_Planning
	,cc.Unit_Name_Aries_Planning
	,cc.Longstring_Spud_Date_Actual_Aries_Planning
	,cc.Longstring_Spud_Date_Planned_Aries_Planning
	,cc.Surface_Location_Shape
	,cc.Surface_Location_Shape_GIS
	,cc.Wellbore_Shape_GIS
	,cc.Wellbore_Shape_NAD27_BLM_GIS
	,cc.BottomHole_Location_Shape_GIS
	,EDW_Create_Date											= cast(NULL AS DATETIME)
	,Hub_Well_Header_ID											= cast(NULL AS BIGINT)
	,[Rownum Seqnum Length Date Hub]							= cast(NULL AS BIGINT)
	,[Rownum Seqnum LengthMax Date Hub]							= cast(NULL AS BIGINT)
	,[Rownum Seqnum LengthMax Date Hub2]						= cast(NULL AS BIGINT)
	,[Rownum Well Length Date Hub]								= cast(NULL AS BIGINT)
	,[Rownum Well LengthMax Date Hub]							= cast(NULL AS BIGINT)
	,[Rownum Well Seq Length Date Hub]							= cast(NULL AS BIGINT)
	,[Rownum Well Seq LengthMax Date Hub]						= cast(NULL AS BIGINT)
	,[Source Length Base]										= cast(NULL AS INT)
	,[Source Length Core]										= cast(NULL AS INT)
	,[Source Length Max]										= cast(NULL AS INT)
	,[Source Length Max_SEQNUM]									= cast(NULL AS INT)
	,Sources_CGAWMPESFAp										= cast(NULL AS NVARCHAR(11))
	,cc.Drilled_Lateral_Length_Actual_Wellview
	,cc.Drilled_Lateral_Length_Aries
	,Pad_Header_UID												= cast(NULL AS UNIQUEIDENTIFIER)
	,Unit_Header_UID											= cast(NULL AS UNIQUEIDENTIFIER)
	,ETL_Load_Date												= cast(NULL AS DATETIME)
	,cc.[Sources Rownum]
	,cc.[Sources Rank]
	,cc.[Sources Length]
	,cc.[SigmaFlow Integration GIS]
	,cc.[SigmaFlow Integration GIS with SEQNUM]
	,cc.[Wellview Integration Wellview]
	,cc.[SigmaFlow Integration]
	,cc.[SigmaFlow Integration with SEQNUM]
	,cc.[Wellview Integration]
	,cc.[Row Count Test]
	,cc.[Sources With Core]
	,cc.[Sources With Core ID]
	,cc.Hub_Well_Header_ID_C
	,cc.Hub_Well_Header_ID_P
	,cc.Hub_Well_Header_ID_A
	,cc.Hub_Well_Header_ID_S
	,cc.Hub_Well_Header_ID_W
	,cc.Hub_Well_Header_ID_M
	,cc.Hub_Well_Header_ID_E
	,cc.Hub_Well_Header_ID_F
	,cc.Hub_Well_Header_ID_G
	,cc.Hub_Well_Header_ID_Ap
	,cc.EDW_Is_Deleted_whm
	,cc.EDW_Is_Deleted_wha
	,cc.EDW_Is_Deleted_whe
	,cc.EDW_Is_Deleted_whfs
	,cc.EDW_Is_Deleted_whmk
	,cc.EDW_Is_Deleted_whp
	,cc.EDW_Is_Deleted_whsf
	,cc.EDW_Is_Deleted_whwv
	,cc.EDW_Is_Deleted_whg
	,cc.EDW_Is_Deleted_whap
	,cc.EDW_Create_Date_whm
	,cc.EDW_Create_Date_wha
	,cc.EDW_Create_Date_whe
	,cc.EDW_Create_Date_whfs
	,cc.EDW_Create_Date_whmk
	,cc.EDW_Create_Date_whp
	,cc.EDW_Create_Date_whsf
	,cc.EDW_Create_Date_whwv
	,cc.EDW_Create_Date_whg
	,cc.EDW_Create_Date_whap
	,cc.Well_Name_Original
	,cc.Drilled_Completed_Lateral_Length
	,cc.Completed_Stages_Lateral_Length
	,cc.Surface_Location_NAD27_DMS_GIS
	,cc.BottomHole_Location_NAD27_DMS_GIS
	,cc.Drilled_Lateral_Length_Aries_Planning
FROM (
	SELECT
		 bb.Sources
		,[Sources Rownum]										= row_number() OVER (PARTITION BY bb.Well_Name_Antero_Standard ORDER BY len(rtrim(ltrim(replace(bb.Sources, '_', '')))) DESC)
		,[Sources Rank]											= rank() OVER (PARTITION BY bb.Well_Name_Antero_Standard ORDER BY len(rtrim(ltrim(replace(bb.Sources, '_', '')))) DESC)
		,[Sources Length]										= len(rtrim(ltrim(replace(bb.Sources, '_', ''))))
		,bb.[SigmaFlow Integration GIS]
		,bb.[SigmaFlow Integration GIS with SEQNUM]
		,bb.[Wellview Integration Wellview]
		,[SigmaFlow Integration]								= max(bb.[SigmaFlow Integration GIS]) OVER (PARTITION BY bb.Well_Name_Antero_Standard)
		,[SigmaFlow Integration with SEQNUM]					= max(bb.[SigmaFlow Integration GIS with SEQNUM]) OVER (PARTITION BY bb.Well_Name_Antero_Standard)
		,[Wellview Integration]									= max(bb.[Wellview Integration Wellview]) OVER (PARTITION BY bb.Well_Name_Antero_Standard)
		,[Row Count Test]										= count(*) OVER (PARTITION BY bb.Well_Name_Antero_Standard)
		,bb.Well_Name_Antero_Standard
		,SEQNUM													= cast(bb.SEQNUM AS FLOAT)
		,API_Number												= cast(bb.API_Number AS NVARCHAR(100))
		,bb.Cost_Center
		,bb.Well_Header_UID
		,bb.Well_Name_Antero_Standard_Aries
		,bb.Well_Name_Antero_Standard_Aries_Planning
		,bb.Well_Name_Antero_Standard_Enertia
		,bb.Well_Name_Antero_Standard_FracSchedule
		,bb.Well_Name_Antero_Standard_GIS
		,bb.Well_Name_Antero_Standard_Merrick
		,bb.Well_Name_Antero_Standard_Petra
		,bb.Well_Name_Antero_Standard_SigmaFlow
		,bb.Well_Name_Antero_Standard_WellView
		,bb.SEQNUM_Aries
		,bb.SEQNUM_Aries_Planning
		,bb.SEQNUM_Enertia
		,bb.SEQNUM_FracSchedule
		,bb.SEQNUM_GIS
		,bb.SEQNUM_Petra
		,bb.SEQNUM_SigmaFlow
		,bb.API_Number_Aries
		,bb.API_Number_Aries_Planning
		,bb.API_Number_Enertia
		,bb.API_Number_GIS
		,bb.API_Number_Merrick
		,bb.API_Number_Petra
		,bb.API_Number_SigmaFlow
		,bb.API_Number_WellView
		,bb.Cost_Center_Enertia
		,bb.Cost_Center_Merrick
		,bb.Cost_Center_WellView
		,bb.[Sources With Core]
		,bb.[Sources With Core ID]
		,bb.Hub_Well_Header_ID_C
		,bb.Hub_Well_Header_ID_P
		,bb.Hub_Well_Header_ID_A
		,bb.Hub_Well_Header_ID_S
		,bb.Hub_Well_Header_ID_W
		,bb.Hub_Well_Header_ID_M
		,bb.Hub_Well_Header_ID_E
		,bb.Hub_Well_Header_ID_F
		,bb.Hub_Well_Header_ID_G
		,bb.Hub_Well_Header_ID_Ap
		,bb.EDW_Is_Deleted_whm
		,bb.EDW_Is_Deleted_wha
		,bb.EDW_Is_Deleted_whe
		,bb.EDW_Is_Deleted_whfs
		,bb.EDW_Is_Deleted_whmk
		,bb.EDW_Is_Deleted_whp
		,bb.EDW_Is_Deleted_whsf
		,bb.EDW_Is_Deleted_whwv
		,bb.EDW_Is_Deleted_whg
		,bb.EDW_Is_Deleted_whap
		,bb.EDW_Create_Date_whm
		,bb.EDW_Create_Date_wha
		,bb.EDW_Create_Date_whe
		,bb.EDW_Create_Date_whfs
		,bb.EDW_Create_Date_whmk
		,bb.EDW_Create_Date_whp
		,bb.EDW_Create_Date_whsf
		,bb.EDW_Create_Date_whwv
		,bb.EDW_Create_Date_whg
		,bb.EDW_Create_Date_whap
		,bb.Well_Name
		,bb.Well_Name_Original
		,bb.Well_Name_Aries
		,bb.Well_Name_Enertia
		,bb.Well_Name_FracSchedule
		,bb.Well_Name_Merrick
		,bb.Well_Name_Petra
		,bb.Well_Name_SigmaFlow
		,bb.Well_Name_WellView
		,Well_Name_GIS											= cast(bb.Well_Name_GIS AS VARCHAR(300))
		,bb.Well_Name_Aries_Planning
		,bb.Petra_ID
		,bb.Aries_ID
		,bb.SigmaFlow_ID
		,bb.WellView_ID
		,bb.Merrick_ID
		,bb.Enertia_ID
		,bb.FracSchedule_ID
		,bb.GIS_ID
		,bb.API_County_Name
		,bb.API_State_Name
		,bb.Big_Rig_Name
		,bb.Big_Rig_Spud_Date
		,bb.BTU_Grid_Code
		,bb.Configuration
		,bb.County
		,bb.Critical_Date_Report
		,bb.Current_Operations_Status
		,bb.Current_Operations_SubStatus
		,bb.Current_Production_Status
		,bb.Drilling_Operations_Pause_Date
		,bb.Drilling_Operations_Resume_Date
		,bb.First_Production_Date
		,bb.Frac_End_Date
		,bb.Frac_Start_Date
		,bb.Net_Revenue_Interest
		,bb.Operations_Comments
		,bb.Operator
		,bb.Pad_AFE_Number
		,bb.Pad_Name
		,bb.Pad_Name_Antero_Standard
		,bb.Producing_Formation
		,bb.PropNum
		,bb.Prospect
		,bb.Raw_Reserve_Category
		,bb.Reserve_Category
		,bb.Shut_In_Date
		,bb.Small_Rig_Name
		,bb.Small_Rig_Spud_Date
		,bb.State_Name
		,bb.Surface_Latitude_NAD27
		,bb.Surface_Longitude_NAD27
		,bb.Total_Vertical_Depth
		,bb.Unit_Name
		,bb.Unit_Name_Antero_Standard
		,bb.Well_AFE_Number
		,bb.Well_Number
		,bb.Wellbore_Name_Antero_Standard
		,bb.Working_Interest
		,bb.WSN_Number
		,bb.Big_Rig_Spud_Date_Actual
		,bb.Big_Rig_Spud_Date_Planned
		,bb.Completion_Date_Actual
		,bb.Conductor_Spud_Date_Actual
		,bb.Drill_Out_End_Date_Planned
		,bb.Drill_Out_Start_Date_Planned
		,bb.Drilled_Lateral_Length_Actual
		,bb.Drilled_Lateral_Length_Planned
		,bb.Drilled_Lateral_Length
		,bb.Completable_Lateral_Length
		,bb.Completed_Lateral_Length
		,bb.Cased_Lateral_Length
		,bb.Planned_Lateral_Length
		,bb.First_Production_Date_Gas_Actual
		,bb.First_Production_Date_Gas_Planned
		,bb.First_Production_Date_Oil_Actual
		,bb.First_Sales_Date_Gas_Actual
		,bb.First_Sales_Date_Oil_Actual
		,bb.Frac_End_Date_Actual
		,bb.Frac_Start_Date_Actual
		,bb.Rig_Release_Date_Actual
		,bb.Rig_Release_Date_Planned
		,bb.Small_Rig_Spud_Date_Actual
		,bb.Small_Rig_Spud_Date_Planned
		,bb.Surface_Spud_Date_Actual
		,bb.Surface_Spud_Date_Planned
		,bb.Total_Measured_Depth_Actual
		,bb.Production_Id
		,bb.First_Production_Date_EDW
		,bb.Pad_Name_Pad_Header
		,bb.Unit_Name_Unit_Header
		,bb.Well_Name_Pad_Header
		,bb.Well_Name_Unit_Header
		,bb.Longstring_Spud_Date_Planned
		,bb.Longstring_Spud_Date_Actual
		,bb.Critical_Date_Report_Default
		,bb.Ground_Elevation
		,bb.Pad_Id
		,bb.Unit_Id
		,bb.Area_Name
		,bb.Group_Name
		,bb.Route_Name
		,bb.Planned_To_Spud_In_Next_2_Years
		,bb.Planned_To_Spud_In_Next_5_Years
		,bb.Planned_To_Spud_In_Next_5_Years_Default
		,bb.Planned_To_Spud_In_Next_2_Years_Default
		,bb.BottomHole_Latitude_NAD27
		,bb.BottomHole_Longitude_NAD27
		,bb.Design_Sand_Lbs_Per_Foot_Planned
		,bb.Design_Water_BBls_Per_Foot_Planned
		,bb.Frac_End_Date_Planned
		,bb.Plug_Drillout_Days_Planned
		,bb.Plug_Drillout_End_Date_Planned
		,bb.Plug_Drillout_Start_Date_Planned
		,bb.Wellbore_Name_Antero_Standard_Aries
		,bb.State_Name_Aries
		,bb.Configuration_Aries
		,bb.County_Aries
		,bb.Prospect_Aries
		,bb.Pad_Name_Aries
		,bb.Pad_Name_Antero_Standard_Aries
		,bb.Well_Number_Aries
		,bb.Drilled_Lateral_Length_Aries
		,bb.Cased_Lateral_Length_Aries
		,bb.Completed_Lateral_Length_Aries
		,bb.PropNum_Aries
		,bb.Current_Operations_Aries
		,bb.Total_Measured_Depth_Actual_Aries
		,bb.Total_Vertical_Depth_Aries
		,bb.Operator_Aries
		,bb.Working_Interest_Aries
		,bb.Net_Revenue_Interest_Aries
		,bb.First_Production_Date_Gas_Coalesced_Aries
		,bb.First_Production_Date_Gas_Actual_Aries
		,bb.Surface_Spud_Date_Actual_Aries
		,bb.Surface_Spud_Date_Aries
		,bb.Small_Rig_Spud_Date_Actual_Aries
		,bb.Shut_In_Date_Aries
		,bb.Basin_Aries
		,bb.Raw_Reserve_Category_Aries
		,bb.RCNUM_Aries
		,bb.Reserve_Category_Aries
		,bb.API_State_Name_Aries
		,bb.API_County_Name_Aries
		,bb.Surface_Latitude_NAD27_Aries
		,bb.Surface_Longitude_NAD27_Aries
		,bb.Producing_Formation_Aries
		,bb.Eur_Gas_All_Aries
		,bb.Eur_BCF_1000FT_Aries
		,bb.EUR_PDP_ALL_BCFE_Aries
		,bb.EUR_BCFE_1000FT_Aries
		,bb.EUR_BO_ALL_Aries
		,bb.[EUR_BO/FT_Aries]
		,bb.Unit_Name_Aries
		,bb.Longstring_Spud_Date_Actual_Aries
		,bb.Longstring_Spud_Date_Planned_Aries
		,bb.Wellbore_Name_Antero_Standard_Enertia
		,bb.State_Name_Enertia
		,bb.County_Enertia
		,bb.Pad_Name_Enertia
		,bb.Pad_Name_Antero_Standard_Enertia
		,bb.EnertiaID_Enertia
		,bb.Current_Operations_Enertia
		,bb.Operator_Enertia
		,bb.Working_Interest_Enertia
		,bb.Net_Revenue_Interest_Enertia
		,bb.First_Production_Date_Gas_Actual_Enertia
		,bb.First_Production_Date_Oil_Actual_Enertia
		,bb.API_State_Name_Enertia
		,bb.API_County_Name_Enertia
		,bb.Pad_AFE_Number_Enertia
		,bb.Well_AFE_Number_Enertia
		,bb.Unit_Name_Enertia
		,bb.Completions_Group_Name_FracSchedule
		,bb.Design_Sand_Lbs_Per_Foot_Planned_FracSchedule
		,bb.Design_Water_BBls_Per_Foot_Planned_FracSchedule
		,bb.Drilled_Lateral_Length_FracSchedule
		,bb.Frac_End_Date_Planned_FracSchedule
		,bb.Longstring_Spud_Date_FracSchedule
		,bb.Plug_Drillout_Days_Planned_FracSchedule
		,bb.Plug_Drillout_End_Date_Planned_FracSchedule
		,bb.Plug_Drillout_Start_Date_Planned_FracSchedule
		,bb.Prospect_FracSchedule
		,bb.Pad_Name_FracSchedule
		,bb.Pad_Name_Antero_Standard_FracSchedule
		,bb.State_Name_FracSchedule
		,bb.Total_Water_Needed_For_Frac_FracSchedule
		,bb.Well_Rig_Release_Date_FracSchedule
		,bb.Wellbore_Name_Antero_Standard_FracSchedule
		,bb.First_Production_Date_Gas_Planned_FracSchedule
		,bb.Frac_Start_Date_Planned_FracSchedule
		,bb.Pad_Rig_Release_Date_FracSchedule
		,bb.Wellbore_Name_Antero_Standard_Merrick
		,bb.State_Name_Merrick
		,bb.Configuration_Merrick
		,bb.County_Merrick
		,bb.Pad_Name_Merrick
		,bb.Pad_Name_Antero_Standard_Merrick
		,bb.Well_Number_Merrick
		,bb.EnertiaID_Merrick
		,bb.PropNum_Merrick
		,bb.Current_Operations_Merrick
		,bb.First_Production_Date_Gas_Actual_Merrick
		,bb.First_Production_Date_Oil_Actual_Merrick
		,bb.First_Sales_Date_Gas_Actual_Merrick
		,bb.First_Sales_Date_Oil_Actual_Merrick
		,bb.Shut_In_Date_Merrick
		,bb.API_State_Name_Merrick
		,bb.API_County_Name_Merrick
		,bb.Current_Production_Status_Merrick
		,bb.Area_Name_Merrick
		,bb.Group_Name_Merrick
		,bb.Route_Name_Merrick
		,bb.Wellbore_Name_Antero_Standard_Petra
		,bb.State_Name_Petra
		,bb.Configuration_Petra
		,bb.County_Petra
		,bb.Prospect_Petra
		,bb.Pad_Name_Petra
		,bb.Pad_Name_Antero_Standard_Petra
		,bb.WSN_Number_Petra
		,bb.Well_Number_Petra
		,bb.Drilled_Lateral_Length_Planned_Petra
		,bb.Drilled_Lateral_Length_Actual_Petra
		,bb.Cased_Lateral_Length_Petra
		,bb.Completable_Lateral_Length_Petra
		,bb.Scrubbed_Lateral_Length_Petra
		,bb.USA_Sticks_Lateral_Length_Petra
		,bb.Third_Party_Lateral_Length_Petra
		,bb.Estimated_Lateral_Length_Petra
		,bb.Drilled_Lateral_Length_Petra
		,bb.Big_Rig_Name_Petra
		,bb.Current_Operations_Petra
		,bb.Total_Measured_Depth_Actual_Petra
		,bb.Operator_Petra
		,bb.Big_Rig_Spud_Date_Actual_Petra
		,bb.Completion_Date_Actual_Petra
		,bb.API_State_Name_Petra
		,bb.API_County_Name_Petra
		,bb.Surface_Latitude_NAD27_Petra
		,bb.Surface_Longitude_NAD27_Petra
		,bb.Producing_Formation_Petra
		,bb.Unit_Name_Petra
		,bb.Ground_Elevation_Petra
		,bb.Symbol_Code_Petra
		,bb.BottomHole_Latitude_NAD27_Petra
		,bb.BottomHole_Longitude_NAD27_Petra
		,bb.Wellbore_Name_Antero_Standard_SigmaFlow
		,bb.State_Name_SigmaFlow
		,bb.County_SigmaFlow
		,bb.Prospect_SigmaFlow
		,bb.Pad_Name_SigmaFlow
		,bb.Pad_Name_Antero_Standard_Sigmaflow
		,bb.WSN_Number_SigmaFlow
		,bb.Drilled_Lateral_Length_Planned_SigmaFlow
		,bb.Drilled_Lateral_Length_SigmaFlow
		,bb.Actual_Lateral_Length_Sigmaflow
		,bb.Planned_Lateral_Length_Sigmaflow
		,bb.Permitted_Lateral_Length_Sigmaflow
		,bb.Big_Rig_Name_SigmaFlow
		,bb.Small_Rig_Name_SigmaFlow
		,bb.First_Production_Date_Gas_Planned_SigmaFlow
		,bb.Surface_Spud_Date_Planned_SigmaFlow
		,bb.Surface_Spud_Date_Actual_SigmaFlow
		,bb.Big_Rig_Spud_Date_Actual_SigmaFlow
		,bb.Big_Rig_Spud_Date_Planned_SigmaFlow
		,bb.Small_Rig_Spud_Date_Actual_SigmaFlow
		,bb.Small_Rig_Spud_Date_Planned_SigmaFlow
		,bb.Rig_Release_Date_Actual_SigmaFlow
		,bb.Rig_Release_Date_Planned_SigmaFlow
		,bb.API_State_Name_SigmaFlow
		,bb.API_County_Name_SigmaFlow
		,bb.Frac_Start_Date_SigmaFlow
		,bb.Frac_End_Date_SigmaFlow
		,bb.Drill_Out_Start_Date_Planned_SigmaFlow
		,bb.Drill_Out_End_Date_Planned_SigmaFlow
		,bb.Unit_Name_SigmaFlow
		,bb.Longstring_Spud_Date_Planned_SigmaFlow
		,bb.Planned_To_Spud_In_Next_5_Years_SigmaFlow
		,bb.Planned_To_Spud_In_Next_2_Years_SigmaFlow
		,bb.Permit_Status_Sigmaflow
		,bb.Permit_Status_Date_Sigmaflow
		,bb.State_Name_WellView
		,bb.Configuration_WellView
		,bb.County_WellView
		,bb.Prospect_WellView
		,bb.Pad_Name_WellView
		,bb.Pad_Name_Antero_Standard_Wellview
		,bb.Drilled_Lateral_Length_Actual_Wellview
		,bb.Drilled_Completed_Lateral_Length
		,bb.Completable_Lateral_Length_WellView
		,bb.Completed_Lateral_Length_Wellview
		,bb.Completed_Stages_Lateral_Length
		,bb.Big_Rig_Name_WellView
		,bb.Current_Operations_WellView
		,bb.Total_Measured_Depth_Actual_WellView
		,bb.Operator_WellView
		,bb.Small_Rig_Name_WellView
		,bb.Working_Interest_WellView
		,bb.Net_Revenue_Interest_WellView
		,bb.Operations_Comments_WellView
		,bb.First_Sales_Date_Gas_Actual_WellView
		,bb.Conductor_Spud_Date_Actual_WellView
		,bb.Surface_Spud_Date_Actual_WellView
		,bb.Big_Rig_Spud_Date_Actual_WellView
		,bb.Small_Rig_Spud_Date_Actual_WellView
		,bb.Completion_Date_Actual_WellView
		,bb.Shut_In_Date_WellView
		,bb.Rig_Release_Date_Actual_WellView
		,bb.Drilling_Operations_Pause_Date_WellView
		,bb.Drilling_Operations_Resume_Date_WellView
		,bb.Basin_WellView
		,bb.Critical_Date_Report_WellView
		,bb.API_State_Name_WellView
		,bb.API_County_Name_WellView
		,bb.Surface_Latitude_NAD27_WellView
		,bb.Surface_Longitude_NAD27_WellView
		,bb.Current_Operations_Status_WellView
		,bb.Current_Operations_SubStatus_WellView
		,bb.Producing_Formation_WellView
		,bb.Frac_Start_Date_Actual_WellView
		,bb.Frac_End_Date_Actual_WellView
		,bb.Planned_To_Spud_In_Next_5_Years_WellView
		,bb.Planned_To_Spud_In_Next_2_Years_WellView
		,bb.Casing_Set_Depth_Wellview
		,bb.TD_Date_Wellview
		,bb.Top_Hole_End_Date_Wellview
		,bb.Max_TVD_Wellview
		,bb.Last_Survey_MD_Wellview
		,bb.Last_Survey_TVD_Wellview
		,bb.Longstring_Spud_Date_Actual_Wellview
		,bb.API_State_Name_GIS
		,bb.Big_Rig_Name_GIS
		,bb.BottomHole_Latitude_NAD27_GIS
		,bb.BottomHole_Longitude_NAD27_GIS
		,bb.BTU_Grid_Code_GIS
		,bb.Configuration_GIS
		,bb.Planned_Lateral_Length_GIS
		,bb.Is_Antero_Well_GIS
		,bb.Midpoint_Latitude_GIS
		,bb.Midpoint_Longitude_GIS
		,bb.Operator_GIS
		,bb.Pad_Name_GIS
		,bb.Pad_Name_Antero_Standard_GIS
		,bb.Prospect_GIS
		,bb.Surface_Latitude_NAD27_GIS
		,bb.Surface_Longitude_NAD27_GIS
		,bb.Target_Formation_GIS
		,bb.Unit_Name_GIS
		,bb.Unit_Name_Antero_Standard_GIS
		,bb.Wellbore_Name_GIS
		,bb.Wellbore_Name_Antero_Standard_GIS
		,bb.Spacing_East_GIS
		,bb.Spacing_West_GIS
		,bb.Type_Curve_Name_GIS
		,bb.Planned_Lateral_Spacing_GIS
		,bb.Oil_Yield_Grid_Code_GIS
		,bb.Unit_Acreage_GIS
		,bb.Property_Direction_GIS
		,bb.Gathering_Fee_Area_GIS
		,bb.Compressor_Area_GIS
		,bb.Compressor_Name_GIS
		,bb.Raw_Reserver_Category_GIS
		,bb.Surface_Location_NAD27_DMS_GIS
		,bb.BottomHole_Location_NAD27_DMS_GIS
		,bb.Aries_ID_Aries_Planning
		,bb.Wellbore_Name_Antero_Standard_Aries_Planning
		,bb.State_Name_Aries_Planning
		,bb.Configuration_Aries_Planning
		,bb.County_Aries_Planning
		,bb.Prospect_Aries_Planning
		,bb.Pad_Name_Aries_Planning
		,bb.Pad_Name_Antero_Standard_Aries_Planning
		,bb.Well_Number_Aries_Planning
		,bb.Drilled_Lateral_Length_Aries_Planning
		,bb.Cased_Lateral_Length_Aries_Planning
		,bb.Completed_Lateral_Length_Aries_Planning
		,bb.PropNum_Aries_Planning
		,bb.Current_Operations_Aries_Planning
		,bb.Total_Measured_Depth_Actual_Aries_Planning
		,bb.Total_Vertical_Depth_Aries_Planning
		,bb.Operator_Aries_Planning
		,bb.Working_Interest_Aries_Planning
		,bb.Net_Revenue_Interest_Aries_Planning
		,bb.First_Production_Date_Gas_Coalesced_Aries_Planning
		,bb.First_Production_Date_Gas_Actual_Aries_Planning
		,bb.Surface_Spud_Date_Actual_Aries_Planning
		,bb.Surface_Spud_Date_Aries_Planning
		,bb.Small_Rig_Spud_Date_Actual_Aries_Planning
		,bb.Shut_In_Date_Aries_Planning
		,bb.Basin_Aries_Planning
		,bb.Raw_Reserve_Category_Aries_Planning
		,bb.Reserve_Category_Aries_Planning
		,bb.API_State_Name_Aries_Planning
		,bb.API_County_Name_Aries_Planning
		,bb.Surface_Latitude_NAD27_Aries_Planning
		,bb.Surface_Longitude_NAD27_Aries_Planning
		,bb.Producing_Formation_Aries_Planning
		,bb.Unit_Name_Aries_Planning
		,bb.Longstring_Spud_Date_Actual_Aries_Planning
		,bb.Longstring_Spud_Date_Planned_Aries_Planning
		,Surface_Location_Shape									= bb.Surface_Location_Shape_GIS
		,bb.BottomHole_Location_Shape_GIS
		,bb.Surface_Location_Shape_GIS
		,bb.Wellbore_Shape_GIS
		,bb.Wellbore_Shape_NAD27_BLM_GIS
	FROM (
		SELECT
			 aa.Sources
			,aa.[Sources With Core]
			,[SigmaFlow Integration GIS with SEQNUM]	= CASE
															WHEN 
																aa.Sources LIKE '%G%'
																AND aa.SEQNUM IS NOT NULL 
															THEN
																'Yes'
															ELSE
																'No'
														  END
			,[SigmaFlow Integration GIS]				= CASE 
															WHEN 
																aa.Sources LIKE '%G%' 
															THEN 
																'Yes' 
															ELSE 
																'No' 
														  END
			,[Wellview Integration Wellview]			= CASE
															WHEN 
																coalesce(aa.Critical_Date_Report,aa.Critical_Date_Report_WellView) = 'Yes' 
															THEN
																'Yes'
															ELSE
																'No'
														  END
			,[Sources With Core ID]						= CASE
															WHEN 
																aa.[Sources With Core] = 'C_________' 
															THEN
																concat(
																	 N'C'
																	,iif(aa.Petra_ID IS NOT NULL, N'P', N'_')
																	,iif(aa.Aries_ID IS NOT NULL, N'A', N'_')
																	,iif(aa.SigmaFlow_ID IS NOT NULL, N'S', N'_')
																	,iif(aa.WellView_ID IS NOT NULL, N'W', N'_')
																	,iif(aa.Merrick_ID IS NOT NULL, N'M', N'_')
																	,iif(aa.Enertia_ID IS NOT NULL, N'E', N'_')
																	,iif(aa.FracSchedule_ID IS NOT NULL, N'F', N'_')
																	,iif(aa.GIS_ID IS NOT NULL, N'G', N'_')
																)
															ELSE
																aa.[Sources With Core]
														  END
			,aa.Hub_Well_Header_ID_C
			,aa.Hub_Well_Header_ID_P
			,aa.Hub_Well_Header_ID_A
			,aa.Hub_Well_Header_ID_S
			,aa.Hub_Well_Header_ID_W
			,aa.Hub_Well_Header_ID_M
			,aa.Hub_Well_Header_ID_E
			,aa.Hub_Well_Header_ID_F
			,aa.Hub_Well_Header_ID_G
			,aa.Hub_Well_Header_ID_Ap
			,aa.EDW_Is_Deleted_whm
			,aa.EDW_Is_Deleted_wha
			,aa.EDW_Is_Deleted_whe
			,aa.EDW_Is_Deleted_whfs
			,aa.EDW_Is_Deleted_whmk
			,aa.EDW_Is_Deleted_whp
			,aa.EDW_Is_Deleted_whsf
			,aa.EDW_Is_Deleted_whwv
			,aa.EDW_Is_Deleted_whg
			,aa.EDW_Is_Deleted_whap
			,aa.EDW_Create_Date_whm
			,aa.EDW_Create_Date_wha
			,aa.EDW_Create_Date_whe
			,aa.EDW_Create_Date_whfs
			,aa.EDW_Create_Date_whmk
			,aa.EDW_Create_Date_whp
			,aa.EDW_Create_Date_whsf
			,aa.EDW_Create_Date_whwv
			,aa.EDW_Create_Date_whg
			,aa.EDW_Create_Date_whap
			,aa.Well_Name
			,aa.Well_Name_Original
			,aa.Well_Name_Aries
			,aa.Well_Name_Enertia
			,aa.Well_Name_FracSchedule
			,aa.Well_Name_Merrick
			,aa.Well_Name_Petra
			,aa.Well_Name_SigmaFlow
			,aa.Well_Name_WellView
			,aa.Well_Name_GIS
			,aa.Well_Name_Aries_Planning
			,aa.SEQNUM
			,aa.API_Number
			,aa.Cost_Center
			,aa.Well_Header_UID
			,aa.Hub_Well_Header_UID
			,aa.Petra_ID
			,aa.Aries_ID
			,aa.SigmaFlow_ID
			,aa.WellView_ID
			,aa.Merrick_ID
			,aa.Enertia_ID
			,aa.FracSchedule_ID
			,aa.GIS_ID
			,aa.API_County_Name
			,aa.API_State_Name
			,aa.Big_Rig_Name
			,aa.Big_Rig_Spud_Date
			,aa.BTU_Grid_Code
			,aa.Configuration
			,aa.County
			,Critical_Date_Report						= coalesce(aa.Critical_Date_Report, aa.Critical_Date_Report_WellView)
			,aa.Current_Operations_Status
			,aa.Current_Operations_SubStatus
			,aa.Current_Production_Status
			,aa.Drilling_Operations_Pause_Date
			,aa.Drilling_Operations_Resume_Date
			,aa.First_Production_Date
			,aa.Frac_End_Date
			,aa.Frac_Start_Date
			,aa.Net_Revenue_Interest
			,aa.Operations_Comments
			,aa.Operator
			,aa.Pad_AFE_Number
			,aa.Pad_Name
			,aa.Pad_Name_Antero_Standard
			,aa.Producing_Formation
			,aa.PropNum
			,aa.Prospect
			,aa.Raw_Reserve_Category
			,aa.Reserve_Category
			,aa.Shut_In_Date
			,aa.Small_Rig_Name
			,aa.Small_Rig_Spud_Date
			,aa.State_Name
			,aa.Surface_Latitude_NAD27
			,aa.Surface_Longitude_NAD27
			,aa.Total_Vertical_Depth
			,aa.Unit_Name
			,aa.Unit_Name_Antero_Standard
			,aa.Well_AFE_Number
			,aa.Well_Name_Antero_Standard
			,aa.Well_Name_Proper_Case
			,aa.Well_Name_Title_Case
			,aa.Well_Number
			,aa.Wellbore_Name_Antero_Standard
			,aa.Working_Interest
			,aa.WSN_Number
			,aa.Big_Rig_Spud_Date_Actual
			,aa.Big_Rig_Spud_Date_Planned
			,aa.Completion_Date_Actual
			,aa.Conductor_Spud_Date_Actual
			,aa.Drill_Out_End_Date_Planned
			,aa.Drill_Out_Start_Date_Planned
			,aa.Drilled_Lateral_Length_Actual
			,aa.Drilled_Lateral_Length_Planned
			,aa.Drilled_Lateral_Length
			,aa.Completable_Lateral_Length
			,aa.Completed_Lateral_Length
			,aa.Cased_Lateral_Length
			,aa.Planned_Lateral_Length
			,aa.First_Production_Date_Gas_Actual
			,aa.First_Production_Date_Gas_Planned
			,aa.First_Production_Date_Oil_Actual
			,aa.First_Sales_Date_Gas_Actual
			,aa.First_Sales_Date_Oil_Actual
			,aa.Frac_End_Date_Actual
			,aa.Frac_Start_Date_Actual
			,aa.Rig_Release_Date_Actual
			,aa.Rig_Release_Date_Planned
			,aa.Small_Rig_Spud_Date_Actual
			,aa.Small_Rig_Spud_Date_Planned
			,aa.Surface_Spud_Date_Actual
			,aa.Surface_Spud_Date_Planned
			,aa.Total_Measured_Depth_Actual
			,aa.Production_Id
			,aa.First_Production_Date_EDW
			,aa.Surface_Location_Shape
			,aa.Pad_Name_Pad_Header
			,aa.Unit_Name_Unit_Header
			,aa.Well_Name_Pad_Header
			,aa.Well_Name_Unit_Header
			,aa.Longstring_Spud_Date_Planned
			,aa.Longstring_Spud_Date_Actual
			,aa.Critical_Date_Report_Default
			,aa.Ground_Elevation
			,aa.Pad_Id
			,aa.Unit_Id
			,aa.Area_Name
			,aa.Group_Name
			,aa.Route_Name
			,aa.Planned_To_Spud_In_Next_2_Years
			,aa.Planned_To_Spud_In_Next_5_Years
			,aa.Planned_To_Spud_In_Next_5_Years_Default
			,aa.Planned_To_Spud_In_Next_2_Years_Default
			,aa.BottomHole_Latitude_NAD27
			,aa.BottomHole_Longitude_NAD27
			,aa.Design_Sand_Lbs_Per_Foot_Planned
			,aa.Design_Water_BBls_Per_Foot_Planned
			,aa.Frac_End_Date_Planned
			,aa.Plug_Drillout_Days_Planned
			,aa.Plug_Drillout_End_Date_Planned
			,aa.Plug_Drillout_Start_Date_Planned
			,aa.Wellbore_Name_Antero_Standard_Aries
			,aa.State_Name_Aries
			,aa.Configuration_Aries
			,aa.County_Aries
			,aa.Prospect_Aries
			,aa.API_Number_Aries
			,aa.Pad_Name_Aries
			,aa.Pad_Name_Antero_Standard_Aries
			,aa.SEQNUM_Aries
			,aa.Well_Number_Aries
			,aa.Drilled_Lateral_Length_Aries
			,aa.Cased_Lateral_Length_Aries
			,aa.Completed_Lateral_Length_Aries
			,aa.PropNum_Aries
			,aa.Current_Operations_Aries
			,aa.Total_Measured_Depth_Actual_Aries
			,aa.Total_Vertical_Depth_Aries
			,aa.Operator_Aries
			,aa.Working_Interest_Aries
			,aa.Net_Revenue_Interest_Aries
			,aa.First_Production_Date_Gas_Coalesced_Aries
			,aa.First_Production_Date_Gas_Actual_Aries
			,aa.Surface_Spud_Date_Actual_Aries
			,aa.Surface_Spud_Date_Aries
			,aa.Small_Rig_Spud_Date_Actual_Aries
			,aa.Shut_In_Date_Aries
			,aa.Basin_Aries
			,aa.Raw_Reserve_Category_Aries
			,aa.RCNUM_Aries
			,aa.Reserve_Category_Aries
			,aa.API_State_Name_Aries
			,aa.API_County_Name_Aries
			,aa.Surface_Latitude_NAD27_Aries
			,aa.Surface_Longitude_NAD27_Aries
			,aa.Producing_Formation_Aries
			,aa.Eur_Gas_All_Aries
			,aa.Eur_BCF_1000FT_Aries
			,aa.EUR_PDP_ALL_BCFE_Aries
			,aa.EUR_BCFE_1000FT_Aries
			,aa.EUR_BO_ALL_Aries
			,aa.[EUR_BO/FT_Aries]
			,aa.Unit_Name_Aries
			,aa.Longstring_Spud_Date_Actual_Aries
			,aa.Longstring_Spud_Date_Planned_Aries
			,aa.Wellbore_Name_Antero_Standard_Enertia
			,aa.State_Name_Enertia
			,aa.County_Enertia
			,aa.API_Number_Enertia
			,aa.Pad_Name_Enertia
			,aa.Pad_Name_Antero_Standard_Enertia
			,aa.SEQNUM_Enertia
			,aa.EnertiaID_Enertia
			,aa.Current_Operations_Enertia
			,aa.Operator_Enertia
			,aa.Cost_Center_Enertia
			,aa.Working_Interest_Enertia
			,aa.Net_Revenue_Interest_Enertia
			,aa.First_Production_Date_Gas_Actual_Enertia
			,aa.First_Production_Date_Oil_Actual_Enertia
			,aa.API_State_Name_Enertia
			,aa.API_County_Name_Enertia
			,aa.Pad_AFE_Number_Enertia
			,aa.Well_AFE_Number_Enertia
			,aa.Unit_Name_Enertia
			,aa.Completions_Group_Name_FracSchedule
			,aa.Design_Sand_Lbs_Per_Foot_Planned_FracSchedule
			,aa.Design_Water_BBls_Per_Foot_Planned_FracSchedule
			,aa.Drilled_Lateral_Length_FracSchedule
			,aa.Frac_End_Date_Planned_FracSchedule
			,aa.Longstring_Spud_Date_FracSchedule
			,aa.Plug_Drillout_Days_Planned_FracSchedule
			,aa.Plug_Drillout_End_Date_Planned_FracSchedule
			,aa.Plug_Drillout_Start_Date_Planned_FracSchedule
			,aa.Prospect_FracSchedule
			,aa.SEQNUM_FracSchedule
			,aa.Pad_Name_FracSchedule
			,aa.Pad_Name_Antero_Standard_FracSchedule
			,aa.State_Name_FracSchedule
			,aa.Total_Water_Needed_For_Frac_FracSchedule
			,aa.Well_Rig_Release_Date_FracSchedule
			,aa.Wellbore_Name_Antero_Standard_FracSchedule
			,aa.First_Production_Date_Gas_Planned_FracSchedule
			,aa.Frac_Start_Date_Planned_FracSchedule
			,aa.Pad_Rig_Release_Date_FracSchedule
			,aa.Wellbore_Name_Antero_Standard_Merrick
			,aa.State_Name_Merrick
			,aa.Configuration_Merrick
			,aa.County_Merrick
			,aa.API_Number_Merrick
			,aa.Pad_Name_Merrick
			,aa.Pad_Name_Antero_Standard_Merrick
			,aa.Well_Number_Merrick
			,aa.EnertiaID_Merrick
			,aa.PropNum_Merrick
			,aa.Current_Operations_Merrick
			,aa.Cost_Center_Merrick
			,aa.First_Production_Date_Gas_Actual_Merrick
			,aa.First_Production_Date_Oil_Actual_Merrick
			,aa.First_Sales_Date_Gas_Actual_Merrick
			,aa.First_Sales_Date_Oil_Actual_Merrick
			,aa.Shut_In_Date_Merrick
			,aa.API_State_Name_Merrick
			,aa.API_County_Name_Merrick
			,aa.Current_Production_Status_Merrick
			,aa.Area_Name_Merrick
			,aa.Group_Name_Merrick
			,aa.Route_Name_Merrick
			,aa.Wellbore_Name_Antero_Standard_Petra
			,aa.State_Name_Petra
			,aa.Configuration_Petra
			,aa.County_Petra
			,aa.Prospect_Petra
			,aa.API_Number_Petra
			,aa.Pad_Name_Petra
			,aa.Pad_Name_Antero_Standard_Petra
			,aa.WSN_Number_Petra
			,aa.SEQNUM_Petra
			,aa.Well_Number_Petra
			,aa.Drilled_Lateral_Length_Planned_Petra
			,aa.Drilled_Lateral_Length_Actual_Petra
			,aa.Cased_Lateral_Length_Petra
			,aa.Completable_Lateral_Length_Petra
			,aa.Scrubbed_Lateral_Length_Petra
			,aa.USA_Sticks_Lateral_Length_Petra
			,aa.Third_Party_Lateral_Length_Petra
			,aa.Estimated_Lateral_Length_Petra
			,aa.Drilled_Lateral_Length_Petra
			,aa.Big_Rig_Name_Petra
			,aa.Current_Operations_Petra
			,aa.Total_Measured_Depth_Actual_Petra
			,aa.Operator_Petra
			,aa.Big_Rig_Spud_Date_Actual_Petra
			,aa.Completion_Date_Actual_Petra
			,aa.API_State_Name_Petra
			,aa.API_County_Name_Petra
			,aa.Surface_Latitude_NAD27_Petra
			,aa.Surface_Longitude_NAD27_Petra
			,aa.Producing_Formation_Petra
			,aa.Unit_Name_Petra
			,aa.Ground_Elevation_Petra
			,aa.Symbol_Code_Petra
			,aa.BottomHole_Latitude_NAD27_Petra
			,aa.BottomHole_Longitude_NAD27_Petra
			,aa.Wellbore_Name_Antero_Standard_SigmaFlow
			,aa.State_Name_SigmaFlow
			,aa.County_SigmaFlow
			,aa.Prospect_SigmaFlow
			,aa.API_Number_SigmaFlow
			,aa.Pad_Name_SigmaFlow
			,aa.Pad_Name_Antero_Standard_Sigmaflow
			,aa.WSN_Number_SigmaFlow
			,aa.SEQNUM_SigmaFlow
			,aa.Drilled_Lateral_Length_Planned_SigmaFlow
			,aa.Drilled_Lateral_Length_SigmaFlow
			,aa.Actual_Lateral_Length_Sigmaflow
			,aa.Planned_Lateral_Length_Sigmaflow
			,aa.Permitted_Lateral_Length_Sigmaflow
			,aa.Big_Rig_Name_SigmaFlow
			,aa.Small_Rig_Name_SigmaFlow
			,aa.First_Production_Date_Gas_Planned_SigmaFlow
			,aa.Surface_Spud_Date_Planned_SigmaFlow
			,aa.Surface_Spud_Date_Actual_SigmaFlow
			,aa.Big_Rig_Spud_Date_Actual_SigmaFlow
			,aa.Big_Rig_Spud_Date_Planned_SigmaFlow
			,aa.Small_Rig_Spud_Date_Actual_SigmaFlow
			,aa.Small_Rig_Spud_Date_Planned_SigmaFlow
			,aa.Rig_Release_Date_Actual_SigmaFlow
			,aa.Rig_Release_Date_Planned_SigmaFlow
			,aa.API_State_Name_SigmaFlow
			,aa.API_County_Name_SigmaFlow
			,aa.Frac_Start_Date_SigmaFlow
			,aa.Frac_End_Date_SigmaFlow
			,aa.Drill_Out_Start_Date_Planned_SigmaFlow
			,aa.Drill_Out_End_Date_Planned_SigmaFlow
			,aa.Unit_Name_SigmaFlow
			,aa.Longstring_Spud_Date_Planned_SigmaFlow
			,aa.Planned_To_Spud_In_Next_5_Years_SigmaFlow
			,aa.Planned_To_Spud_In_Next_2_Years_SigmaFlow
			,aa.Permit_Status_Sigmaflow
			,aa.Permit_Status_Date_Sigmaflow
			,aa.State_Name_WellView
			,aa.Configuration_WellView
			,aa.County_WellView
			,aa.Prospect_WellView
			,aa.API_Number_WellView
			,aa.Pad_Name_WellView
			,aa.Pad_Name_Antero_Standard_Wellview
			,aa.Drilled_Lateral_Length_Actual_Wellview
			,aa.Drilled_Completed_Lateral_Length
			,aa.Completable_Lateral_Length_WellView
			,aa.Completed_Lateral_Length_Wellview
			,aa.Completed_Stages_Lateral_Length
			,aa.Big_Rig_Name_WellView
			,aa.Current_Operations_WellView
			,aa.Total_Measured_Depth_Actual_WellView
			,aa.Operator_WellView
			,aa.Small_Rig_Name_WellView
			,aa.Cost_Center_WellView
			,aa.Working_Interest_WellView
			,aa.Net_Revenue_Interest_WellView
			,aa.Operations_Comments_WellView
			,aa.First_Sales_Date_Gas_Actual_WellView
			,aa.Conductor_Spud_Date_Actual_WellView
			,aa.Surface_Spud_Date_Actual_WellView
			,aa.Big_Rig_Spud_Date_Actual_WellView
			,aa.Small_Rig_Spud_Date_Actual_WellView
			,aa.Completion_Date_Actual_WellView
			,aa.Shut_In_Date_WellView
			,aa.Rig_Release_Date_Actual_WellView
			,aa.Drilling_Operations_Pause_Date_WellView
			,aa.Drilling_Operations_Resume_Date_WellView
			,aa.Basin_WellView
			,aa.Critical_Date_Report_WellView
			,aa.API_State_Name_WellView
			,aa.API_County_Name_WellView
			,aa.Surface_Latitude_NAD27_WellView
			,aa.Surface_Longitude_NAD27_WellView
			,aa.Current_Operations_Status_WellView
			,aa.Current_Operations_SubStatus_WellView
			,aa.Producing_Formation_WellView
			,aa.Frac_Start_Date_Actual_WellView
			,aa.Frac_End_Date_Actual_WellView
			,aa.Planned_To_Spud_In_Next_5_Years_WellView
			,aa.Planned_To_Spud_In_Next_2_Years_WellView
			,aa.Casing_Set_Depth_Wellview
			,aa.TD_Date_Wellview
			,aa.Top_Hole_End_Date_Wellview
			,aa.Max_TVD_Wellview
			,aa.Last_Survey_MD_Wellview
			,aa.Last_Survey_TVD_Wellview
			,aa.Longstring_Spud_Date_Actual_Wellview
			,aa.API_Number_GIS
			,aa.API_State_Name_GIS
			,aa.Big_Rig_Name_GIS
			,aa.BottomHole_Latitude_NAD27_GIS
			,aa.BottomHole_Longitude_NAD27_GIS
			,aa.BottomHole_Location_Shape_GIS
			,aa.BTU_Grid_Code_GIS
			,aa.Configuration_GIS
			,aa.Planned_Lateral_Length_GIS
			,aa.Is_Antero_Well_GIS
			,aa.Midpoint_Latitude_GIS
			,aa.Midpoint_Longitude_GIS
			,aa.Operator_GIS
			,aa.Pad_Name_GIS
			,aa.Pad_Name_Antero_Standard_GIS
			,aa.Prospect_GIS
			,aa.SEQNUM_GIS
			,aa.Surface_Latitude_NAD27_GIS
			,aa.Surface_Location_Shape_GIS
			,aa.Surface_Longitude_NAD27_GIS
			,aa.Target_Formation_GIS
			,aa.Unit_Name_GIS
			,aa.Unit_Name_Antero_Standard_GIS
			,aa.Wellbore_Shape_GIS
			,aa.Wellbore_Shape_NAD27_BLM_GIS
			,aa.Wellbore_Name_GIS
			,aa.Wellbore_Name_Antero_Standard_GIS
			,aa.Spacing_East_GIS
			,aa.Spacing_West_GIS
			,aa.Type_Curve_Name_GIS
			,aa.Planned_Lateral_Spacing_GIS
			,aa.Oil_Yield_Grid_Code_GIS
			,aa.Unit_Acreage_GIS
			,aa.Property_Direction_GIS
			,aa.Gathering_Fee_Area_GIS
			,aa.Compressor_Area_GIS
			,aa.Compressor_Name_GIS
			,aa.Raw_Reserver_Category_GIS
			,aa.Surface_Location_NAD27_DMS_GIS
			,aa.BottomHole_Location_NAD27_DMS_GIS
			,aa.Aries_ID_Aries_Planning
			,aa.Wellbore_Name_Antero_Standard_Aries_Planning
			,aa.State_Name_Aries_Planning
			,aa.Configuration_Aries_Planning
			,aa.County_Aries_Planning
			,aa.Prospect_Aries_Planning
			,aa.API_Number_Aries_Planning
			,aa.Pad_Name_Aries_Planning
			,aa.Pad_Name_Antero_Standard_Aries_Planning
			,aa.SEQNUM_Aries_Planning
			,aa.Well_Number_Aries_Planning
			,aa.Drilled_Lateral_Length_Aries_Planning
			,aa.Cased_Lateral_Length_Aries_Planning
			,aa.Completed_Lateral_Length_Aries_Planning
			,aa.PropNum_Aries_Planning
			,aa.Current_Operations_Aries_Planning
			,aa.Total_Measured_Depth_Actual_Aries_Planning
			,aa.Total_Vertical_Depth_Aries_Planning
			,aa.Operator_Aries_Planning
			,aa.Working_Interest_Aries_Planning
			,aa.Net_Revenue_Interest_Aries_Planning
			,aa.First_Production_Date_Gas_Coalesced_Aries_Planning
			,aa.First_Production_Date_Gas_Actual_Aries_Planning
			,aa.Surface_Spud_Date_Actual_Aries_Planning
			,aa.Surface_Spud_Date_Aries_Planning
			,aa.Small_Rig_Spud_Date_Actual_Aries_Planning
			,aa.Shut_In_Date_Aries_Planning
			,aa.Basin_Aries_Planning
			,aa.Raw_Reserve_Category_Aries_Planning
			,aa.Reserve_Category_Aries_Planning
			,aa.API_State_Name_Aries_Planning
			,aa.API_County_Name_Aries_Planning
			,aa.Surface_Latitude_NAD27_Aries_Planning
			,aa.Surface_Longitude_NAD27_Aries_Planning
			,aa.Producing_Formation_Aries_Planning
			,aa.Unit_Name_Aries_Planning
			,aa.Longstring_Spud_Date_Actual_Aries_Planning
			,aa.Longstring_Spud_Date_Planned_Aries_Planning
			,aa.Well_Name_Antero_Standard_Aries
			,aa.Well_Name_Antero_Standard_Enertia
			,aa.Well_Name_Antero_Standard_FracSchedule
			,aa.Well_Name_Antero_Standard_Merrick
			,aa.Well_Name_Antero_Standard_Petra
			,aa.Well_Name_Antero_Standard_SigmaFlow
			,aa.Well_Name_Antero_Standard_WellView
			,aa.Well_Name_Antero_Standard_GIS
			,aa.Well_Name_Antero_Standard_Aries_Planning
		FROM (
			SELECT
				Sources												= concat(
																		 iif(whp.Hub_Well_Header_ID IS NOT NULL, N'P', N'_')
																		,iif(wha.Hub_Well_Header_ID IS NOT NULL, N'A', N'_')
																		,iif(whsf.Hub_Well_Header_ID IS NOT NULL, N'S', N'_')
																		,iif(whwv.Hub_Well_Header_ID IS NOT NULL, N'W', N'_')
																		,iif(whmk.Hub_Well_Header_ID IS NOT NULL, N'M', N'_')
																		,iif(whe.Hub_Well_Header_ID IS NOT NULL, N'E', N'_')
																		,iif(whfs.Hub_Well_Header_ID IS NOT NULL, N'F', N'_')
																		,iif(whg.Hub_Well_Header_ID IS NOT NULL, N'G', N'_')
																		,iif(whap.Hub_Well_Header_ID IS NOT NULL, N'Ap', N'_')
																	  )
				,[Sources With Core]								= concat(
																		 iif(whm.Hub_Well_Header_ID IS NOT NULL, N'C', N'_')
																		,iif(whp.Hub_Well_Header_ID IS NOT NULL, N'P', N'_')
																		,iif(wha.Hub_Well_Header_ID IS NOT NULL, N'A', N'_')
																		,iif(whsf.Hub_Well_Header_ID IS NOT NULL, N'S', N'_')
																		,iif(whwv.Hub_Well_Header_ID IS NOT NULL, N'W', N'_')
																		,iif(whmk.Hub_Well_Header_ID IS NOT NULL, N'M', N'_')
																		,iif(whe.Hub_Well_Header_ID IS NOT NULL, N'E', N'_')
																		,iif(whfs.Hub_Well_Header_ID IS NOT NULL, N'F', N'_')
																		,iif(whg.Hub_Well_Header_ID IS NOT NULL, N'G', N'_')
																		,iif(whap.Hub_Well_Header_ID IS NOT NULL, N'Ap', N'_')
																	  )
				,Hub_Well_Header_ID_C								= whm.Hub_Well_Header_ID
				,Hub_Well_Header_ID_P								= whp.Hub_Well_Header_ID
				,Hub_Well_Header_ID_A								= wha.Hub_Well_Header_ID
				,Hub_Well_Header_ID_S								= whsf.Hub_Well_Header_ID
				,Hub_Well_Header_ID_W								= whwv.Hub_Well_Header_ID
				,Hub_Well_Header_ID_M								= whmk.Hub_Well_Header_ID
				,Hub_Well_Header_ID_E								= whe.Hub_Well_Header_ID
				,Hub_Well_Header_ID_F								= whfs.Hub_Well_Header_ID
				,Hub_Well_Header_ID_G								= whg.Hub_Well_Header_ID
				,Hub_Well_Header_ID_Ap								= whap.Hub_Well_Header_ID
				,Well_Name											= whm.Well_Name_Antero_Standard
				,Well_Name_Original									= whm.Well_Name
				,whm.SEQNUM
				,whm.API_Number
				,whm.Cost_Center
				,Well_Header_UID									= wh.Hub_Well_Header_UID
				,wh.Hub_Well_Header_UID
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
				,Critical_Date_Report								= max(whm.Critical_Date_Report) OVER (PARTITION BY whm.Well_Name_Antero_Standard ORDER BY whm.Well_Name_Antero_Standard)
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
				,Well_Name_Antero_Standard							= whm.Well_Name_Antero_Standard
				,Well_Name_Proper_Case								= well_name_proper_case.Well_Name
				,Well_Name_Title_Case								= well_name_title_case.Well_Name
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
				,whm.Completed_Lateral_Length
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
				,Well_Name_Aries									= wha.Well_Name
				,Well_Name_Antero_Standard_Aries					= wha.Well_Name_Antero_Standard
				,Wellbore_Name_Antero_Standard_Aries				= wha.Wellbore_Name_Antero_Standard
				,State_Name_Aries									= wha.State_Name
				,Configuration_Aries								= wha.Configuration
				,County_Aries										= wha.County
				,Prospect_Aries										= wha.Prospect
				,API_Number_Aries									= wha.API_Number
				,Pad_Name_Aries										= wha.Pad_Name
				,Pad_Name_Antero_Standard_Aries						= wha.Pad_Name_Antero_Standard
				,SEQNUM_Aries										= wha.SEQNUM
				,Well_Number_Aries									= wha.Well_Number
				,Drilled_Lateral_Length_Aries						= wha.Cased_Lateral_Length
				,Cased_Lateral_Length_Aries							= wha.Cased_Lateral_Length
				,Completed_Lateral_Length_Aries						= wha.Completed_Lateral_Length
				,PropNum_Aries										= wha.PropNum
				,Current_Operations_Aries							= wha.Current_Operations
				,Total_Measured_Depth_Actual_Aries					= wha.Total_Measured_Depth_Actual
				,Total_Vertical_Depth_Aries							= wha.Total_Vertical_Depth
				,Operator_Aries										= wha.Operator
				,Working_Interest_Aries								= wha.Working_Interest
				,Net_Revenue_Interest_Aries							= wha.Net_Revenue_Interest
				,First_Production_Date_Gas_Coalesced_Aries			= wha.First_Production_Date_Gas_Coalesced
				,First_Production_Date_Gas_Actual_Aries				= wha.First_Production_Date_Gas_Actual
				,Surface_Spud_Date_Actual_Aries						= wha.Surface_Spud_Date_Actual
				,Surface_Spud_Date_Aries							= wha.Surface_Spud_Date
				,Small_Rig_Spud_Date_Actual_Aries					= wha.Small_Rig_Spud_Date_Actual
				,Shut_In_Date_Aries									= wha.Shut_In_Date
				,Basin_Aries										= wha.Basin
				,Raw_Reserve_Category_Aries							= wha.Raw_Reserve_Category
				,RCNUM_Aries										= wha.RCNUM
				,Reserve_Category_Aries								= wha.Reserve_Category
				,API_State_Name_Aries								= wha.API_State_Name
				,API_County_Name_Aries								= wha.API_County_Name
				,Surface_Latitude_NAD27_Aries						= wha.Surface_Latitude_NAD27
				,Surface_Longitude_NAD27_Aries						= wha.Surface_Longitude_NAD27
				,Producing_Formation_Aries							= wha.Producing_Formation
				,Eur_Gas_All_Aries									= wha.Eur_Gas_All
				,Eur_BCF_1000FT_Aries								= wha.Eur_BCF_1000FT
				,EUR_PDP_ALL_BCFE_Aries								= wha.EUR_PDP_ALL_BCFE
				,EUR_BCFE_1000FT_Aries								= wha.EUR_BCFE_1000FT
				,EUR_BO_ALL_Aries									= wha.EUR_BO_ALL
				,[EUR_BO/FT_Aries]									= wha.[EUR_BO/FT]
				,Unit_Name_Aries									= wha.Unit_Name
				,Longstring_Spud_Date_Actual_Aries					= wha.Longstring_Spud_Date_Actual
				,Longstring_Spud_Date_Planned_Aries					= wha.Longstring_Spud_Date_Planned
				--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
				,Well_Name_Enertia									= whe.Well_Name
				,Well_Name_Antero_Standard_Enertia					= whe.Well_Name_Antero_Standard
				,Wellbore_Name_Antero_Standard_Enertia				= whe.Wellbore_Name_Antero_Standard
				,State_Name_Enertia									= whe.State_Name
				,County_Enertia										= whe.County
				,API_Number_Enertia									= whe.API_Number
				,Pad_Name_Enertia									= whe.Pad_Name
				,Pad_Name_Antero_Standard_Enertia					= whe.Pad_Name_Antero_Standard
				,SEQNUM_Enertia										= whe.SEQNUM
				,EnertiaID_Enertia									= whe.Enertia_ID
				,Current_Operations_Enertia							= whe.Current_Operations
				,Operator_Enertia									= whe.Operator
				,Cost_Center_Enertia								= whe.Cost_Center
				,Working_Interest_Enertia							= whe.Working_Interest
				,Net_Revenue_Interest_Enertia						= whe.Net_Revenue_Interest
				,First_Production_Date_Gas_Actual_Enertia			= whe.First_Production_Date_Gas_Actual
				,First_Production_Date_Oil_Actual_Enertia			= whe.First_Production_Date_Oil_Actual
				,API_State_Name_Enertia								= whe.API_State_Name
				,API_County_Name_Enertia							= whe.API_County_Name
				,Pad_AFE_Number_Enertia								= whe.Pad_AFE_Number
				,Well_AFE_Number_Enertia							= whe.Well_AFE_Number
				,Unit_Name_Enertia									= whe.Unit_Name
				--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
				,Completions_Group_Name_FracSchedule				= whfs.Completions_Group_Name
				,Design_Sand_Lbs_Per_Foot_Planned_FracSchedule		= whfs.Design_Sand_Lbs_Per_Foot_Planned
				,Design_Water_BBls_Per_Foot_Planned_FracSchedule	= whfs.Design_Water_BBls_Per_Foot_Planned
				,Drilled_Lateral_Length_FracSchedule				= whfs.Drilled_Lateral_Length
				,Frac_End_Date_Planned_FracSchedule					= whfs.Frac_End_Date_Planned
				,Longstring_Spud_Date_FracSchedule					= whfs.Longstring_Spud_Date
				,Plug_Drillout_Days_Planned_FracSchedule			= whfs.Plug_Drillout_Days_Planned
				,Plug_Drillout_End_Date_Planned_FracSchedule		= whfs.Plug_Drillout_End_Date_Planned
				,Plug_Drillout_Start_Date_Planned_FracSchedule		= whfs.Plug_Drillout_Start_Date_Planned
				,Prospect_FracSchedule								= whfs.Prospect
				,SEQNUM_FracSchedule								= whfs.SEQNUM
				,Pad_Name_FracSchedule								= whfs.Pad_Name
				,Pad_Name_Antero_Standard_FracSchedule				= whfs.Pad_Name_Antero_Standard
				,State_Name_FracSchedule							= whfs.State_Name
				,Total_Water_Needed_For_Frac_FracSchedule			= whfs.Total_Water_Needed_For_Frac
				,Well_Name_Antero_Standard_FracSchedule				= whfs.Well_Name_Antero_Standard
				,Well_Name_FracSchedule								= whfs.Well_Name
				,Well_Rig_Release_Date_FracSchedule					= whfs.Well_Rig_Release_Date
				,Wellbore_Name_Antero_Standard_FracSchedule			= whfs.Wellbore_Name_Antero_Standard
				,First_Production_Date_Gas_Planned_FracSchedule		= whfs.First_Production_Date_Gas_Planned
				,Frac_Start_Date_Planned_FracSchedule				= whfs.Frac_Start_Date_Planned
				,Pad_Rig_Release_Date_FracSchedule					= whfs.Pad_Rig_Release_Date
				--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
				,Well_Name_Merrick									= whmk.Well_Name
				,Well_Name_Antero_Standard_Merrick					= whmk.Well_Name_Antero_Standard
				,Wellbore_Name_Antero_Standard_Merrick				= whmk.Wellbore_Name_Antero_Standard
				,State_Name_Merrick									= whmk.State_Name
				,Configuration_Merrick								= whmk.Configuration
				,County_Merrick										= whmk.County
				,API_Number_Merrick									= whmk.API_Number
				,Pad_Name_Merrick									= whmk.Pad_Name
				,Pad_Name_Antero_Standard_Merrick					= whmk.Pad_Name_Antero_Standard
				,Well_Number_Merrick								= whmk.Well_Number
				,EnertiaID_Merrick									= whmk.Enertia_ID
				,PropNum_Merrick									= whmk.PropNum
				,Current_Operations_Merrick							= whmk.Current_Operations
				,Cost_Center_Merrick								= whmk.Cost_Center
				,First_Production_Date_Gas_Actual_Merrick			= whmk.First_Production_Date_Gas_Actual
				,First_Production_Date_Oil_Actual_Merrick			= whmk.First_Production_Date_Oil_Actual
				,First_Sales_Date_Gas_Actual_Merrick				= whmk.First_Sales_Date_Gas_Actual
				,First_Sales_Date_Oil_Actual_Merrick				= whmk.First_Sales_Date_Oil_Actual
				,Shut_In_Date_Merrick								= whmk.Shut_In_Date
				,API_State_Name_Merrick								= whmk.API_State_Name
				,API_County_Name_Merrick							= whmk.API_County_Name
				,Current_Production_Status_Merrick					= whmk.Current_Production_Status
				,Area_Name_Merrick									= whmk.Area_Name
				,Group_Name_Merrick									= whmk.Group_Name
				,Route_Name_Merrick									= whmk.Route_Name
				--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
				,Well_Name_Petra									= whp.Well_Name
				,Well_Name_Antero_Standard_Petra					= whp.Well_Name_Antero_Standard
				,Wellbore_Name_Antero_Standard_Petra				= whp.Wellbore_Name_Antero_Standard
				,State_Name_Petra									= whp.State_Name
				,Configuration_Petra								= whp.Configuration
				,County_Petra										= whp.County
				,Prospect_Petra										= whp.Prospect
				,API_Number_Petra									= whp.API_Number
				,Pad_Name_Petra										= whp.Pad_Name
				,Pad_Name_Antero_Standard_Petra						= whp.Pad_Name_Antero_Standard
				,WSN_Number_Petra									= whp.WSN_Number
				,SEQNUM_Petra										= whp.SEQNUM
				,Well_Number_Petra									= whp.Well_Number
				,Drilled_Lateral_Length_Planned_Petra				= whp.Drilled_Lateral_Length_Planned
				,Drilled_Lateral_Length_Actual_Petra				= whp.Drilled_Lateral_Length_Actual
				,Cased_Lateral_Length_Petra							= whp.Cased_Lateral_Length
				,Completable_Lateral_Length_Petra					= whp.Completable_Lateral_Length
				,Scrubbed_Lateral_Length_Petra						= whp.Scrubbed_Lateral_Length
				,USA_Sticks_Lateral_Length_Petra					= whp.USA_Sticks_Lateral_Length
				,Third_Party_Lateral_Length_Petra					= whp.Third_Party_Lateral_Length
				,Estimated_Lateral_Length_Petra						= whp.Estimated_Lateral_Length
				,Drilled_Lateral_Length_Petra						= whp.Drilled_Lateral_Length
				,Big_Rig_Name_Petra									= whp.Big_Rig_Name
				,Current_Operations_Petra							= whp.Current_Operations
				,Total_Measured_Depth_Actual_Petra					= whp.Total_Measured_Depth_Actual
				,Operator_Petra										= whp.Operator
				,Big_Rig_Spud_Date_Actual_Petra						= whp.Big_Rig_Spud_Date_Actual
				,Completion_Date_Actual_Petra						= whp.Completion_Date_Actual
				,API_State_Name_Petra								= whp.API_State_Name
				,API_County_Name_Petra								= whp.API_County_Name
				,Surface_Latitude_NAD27_Petra						= whp.Surface_Latitude_NAD27
				,Surface_Longitude_NAD27_Petra						= whp.Surface_Longitude_NAD27
				,Producing_Formation_Petra							= whp.Producing_Formation
				,Unit_Name_Petra									= whp.Unit_Name
				,Ground_Elevation_Petra								= whp.Ground_Elevation
				,Symbol_Code_Petra									= whp.Symbol_Code
				,BottomHole_Latitude_NAD27_Petra					= whp.BottomHole_Latitude_NAD27
				,BottomHole_Longitude_NAD27_Petra					= whp.BottomHole_Longitude_NAD27
				--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
				,Well_Name_SigmaFlow								= whsf.Well_Name
				,Well_Name_Antero_Standard_SigmaFlow				= whsf.Well_Name_Antero_Standard
				,Wellbore_Name_Antero_Standard_SigmaFlow			= whsf.Wellbore_Name_Antero_Standard
				,State_Name_SigmaFlow								= whsf.State_Name
				,County_SigmaFlow									= whsf.County
				,Prospect_SigmaFlow									= whsf.Prospect
				,API_Number_SigmaFlow								= whsf.API_Number
				,Pad_Name_SigmaFlow									= whsf.Pad_Name
				,Pad_Name_Antero_Standard_Sigmaflow					= whsf.Pad_Name_Antero_Standard
				,WSN_Number_SigmaFlow								= whsf.WSN_Number
				,SEQNUM_SigmaFlow									= whsf.SEQNUM
				,Drilled_Lateral_Length_Planned_SigmaFlow			= whsf.Drilled_Lateral_Length_Planned
				,Drilled_Lateral_Length_SigmaFlow					= whsf.Drilled_Lateral_Length
				,Actual_Lateral_Length_Sigmaflow					= whsf.Actual_Lateral_Length
				,Planned_Lateral_Length_Sigmaflow					= whsf.Planned_Lateral_Length
				,Permitted_Lateral_Length_Sigmaflow					= whsf.Permitted_Lateral_Length
				,Big_Rig_Name_SigmaFlow								= whsf.Big_Rig_Name
				,Small_Rig_Name_SigmaFlow							= whsf.Small_Rig_Name
				,First_Production_Date_Gas_Planned_SigmaFlow		= whsf.First_Production_Date_Gas_Planned
				,Surface_Spud_Date_Planned_SigmaFlow				= whsf.Surface_Spud_Date_Planned
				,Surface_Spud_Date_Actual_SigmaFlow					= whsf.Surface_Spud_Date_Actual
				,Big_Rig_Spud_Date_Actual_SigmaFlow					= whsf.Big_Rig_Spud_Date_Actual
				,Big_Rig_Spud_Date_Planned_SigmaFlow				= whsf.Big_Rig_Spud_Date_Planned
				,Small_Rig_Spud_Date_Actual_SigmaFlow				= whsf.Small_Rig_Spud_Date_Actual
				,Small_Rig_Spud_Date_Planned_SigmaFlow				= whsf.Small_Rig_Spud_Date_Planned
				,Rig_Release_Date_Actual_SigmaFlow					= whsf.Rig_Release_Date_Actual
				,Rig_Release_Date_Planned_SigmaFlow					= whsf.Rig_Release_Date_Planned
				,API_State_Name_SigmaFlow							= whsf.API_State_Name
				,API_County_Name_SigmaFlow							= whsf.API_County_Name
				,Frac_Start_Date_SigmaFlow							= whsf.Frac_Start_Date
				,Frac_End_Date_SigmaFlow							= whsf.Frac_End_Date
				,Drill_Out_Start_Date_Planned_SigmaFlow				= whsf.Drill_Out_Start_Date_Planned
				,Drill_Out_End_Date_Planned_SigmaFlow				= whsf.Drill_Out_End_Date_Planned
				,Unit_Name_SigmaFlow								= whsf.Unit_Name
				,Longstring_Spud_Date_Planned_SigmaFlow				= whsf.Longstring_Spud_Date_Planned
				,Planned_To_Spud_In_Next_5_Years_SigmaFlow			= whsf.Planned_To_Spud_In_Next_5_Years
				,Planned_To_Spud_In_Next_2_Years_SigmaFlow			= whsf.Planned_To_Spud_In_Next_2_Years
				,Permit_Status_Sigmaflow							= whsf.Permit_Status
				,Permit_Status_Date_Sigmaflow						= whsf.Permit_Status_Date
				--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
				,Well_Name_WellView									= whwv.Well_Name
				,Well_Name_Antero_Standard_WellView					= whwv.Well_Name_Antero_Standard
				,State_Name_WellView								= whwv.State_Name
				,Configuration_WellView								= whwv.Configuration
				,County_WellView									= whwv.County
				,Prospect_WellView									= whwv.Prospect
				,API_Number_WellView								= whwv.API_Number
				,Pad_Name_WellView									= whwv.Pad_Name
				,Pad_Name_Antero_Standard_Wellview					= whwv.Pad_Name_Antero_Standard
				,Drilled_Lateral_Length_Actual_Wellview				= whwv.Completable_Lateral_Length
				,Drilled_Completed_Lateral_Length					= whwv.Completable_Lateral_Length
				,Completable_Lateral_Length_WellView				= whwv.Completable_Lateral_Length
				,Completed_Lateral_Length_Wellview					= whwv.Completed_Lateral_Length
				,Completed_Stages_Lateral_Length					= whwv.Completed_Lateral_Length
				,Big_Rig_Name_WellView								= whwv.Big_Rig_Name
				,Current_Operations_WellView						= whwv.Current_Operations
				,Total_Measured_Depth_Actual_WellView				= whwv.Total_Measured_Depth_Actual
				,Operator_WellView									= whwv.Operator
				,Small_Rig_Name_WellView							= whwv.Small_Rig_Name
				,Cost_Center_WellView								= whwv.Cost_Center
				,Working_Interest_WellView							= whwv.Working_Interest
				,Net_Revenue_Interest_WellView						= whwv.Net_Revenue_Interest
				,Operations_Comments_WellView						= whwv.Operations_Comments
				,First_Sales_Date_Gas_Actual_WellView				= whwv.First_Sales_Date_Gas_Actual
				,Conductor_Spud_Date_Actual_WellView				= whwv.Conductor_Spud_Date_Actual
				,Surface_Spud_Date_Actual_WellView					= whwv.Surface_Spud_Date_Actual
				,Big_Rig_Spud_Date_Actual_WellView					= whwv.Big_Rig_Spud_Date_Actual
				,Small_Rig_Spud_Date_Actual_WellView				= whwv.Small_Rig_Spud_Date_Actual
				,Completion_Date_Actual_WellView					= whwv.Completion_Date_Actual
				,Shut_In_Date_WellView								= whwv.Shut_In_Date
				,Rig_Release_Date_Actual_WellView					= whwv.Rig_Release_Date_Actual
				,Drilling_Operations_Pause_Date_WellView			= whwv.Drilling_Operations_Pause_Date
				,Drilling_Operations_Resume_Date_WellView			= whwv.Drilling_Operations_Resume_Date
				,Basin_WellView										= whwv.Basin
				,Critical_Date_Report_WellView						= max(whwv.Critical_Date_Report) OVER (PARTITION BY whwv.Well_Name_Antero_Standard ORDER BY whwv.Well_Name)
				,API_State_Name_WellView							= whwv.API_State_Name
				,API_County_Name_WellView							= whwv.API_County_Name
				,Surface_Latitude_NAD27_WellView					= whwv.Surface_Latitude_NAD27
				,Surface_Longitude_NAD27_WellView					= whwv.Surface_Longitude_NAD27
				,Current_Operations_Status_WellView					= whwv.Current_Operations_Status
				,Current_Operations_SubStatus_WellView				= whwv.Current_Operations_SubStatus
				,Producing_Formation_WellView						= whwv.Producing_Formation
				,Frac_Start_Date_Actual_WellView					= whwv.Frac_Start_Date_Actual
				,Frac_End_Date_Actual_WellView						= whwv.Frac_End_Date_Actual
				,Planned_To_Spud_In_Next_5_Years_WellView			= whwv.Planned_To_Spud_In_Next_5_Years
				,Planned_To_Spud_In_Next_2_Years_WellView			= whwv.Planned_To_Spud_In_Next_2_Years
				,Casing_Set_Depth_Wellview							= whwv.Casing_Set_Depth
				,TD_Date_Wellview									= whwv.TD_Date
				,Top_Hole_End_Date_Wellview							= whwv.Top_Hole_End_Date
				,Max_TVD_Wellview									= whwv.Max_TVD
				,Last_Survey_MD_Wellview							= whwv.Last_Survey_MD
				,Last_Survey_TVD_Wellview							= whwv.Last_Survey_TVD
				,Longstring_Spud_Date_Actual_Wellview				= whwv.Longstring_Spud_Date_Actual
				--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
				,API_Number_GIS										= whg.API_Number
				,API_State_Name_GIS									= whg.API_State_Name
				,Big_Rig_Name_GIS									= whg.Big_Rig_Name
				,BottomHole_Latitude_NAD27_GIS						= whg.BottomHole_Latitude_NAD27
				,BottomHole_Longitude_NAD27_GIS						= whg.BottomHole_Longitude_NAD27
				,BottomHole_Location_Shape_GIS						= whg.BottomHole_Location_Shape
				,BTU_Grid_Code_GIS									= whg.Btu_Grid_Code
				,Configuration_GIS									= whg.Configuration
				,Planned_Lateral_Length_GIS							= whg.Planned_Lateral_Length
				,Is_Antero_Well_GIS									= whg.Is_Antero_Well
				,Midpoint_Latitude_GIS								= whg.Midpoint_Latitude
				,Midpoint_Longitude_GIS								= whg.Midpoint_Longitude
				,Operator_GIS										= whg.Operator
				,Pad_Name_GIS										= whg.Pad_Name
				,Pad_Name_Antero_Standard_GIS						= whg.Pad_Name_Antero_Standard
				,Prospect_GIS										= whg.Prospect
				,SEQNUM_GIS											= whg.SEQNUM
				,Surface_Latitude_NAD27_GIS							= whg.Surface_Latitude_NAD27
				,Surface_Location_Shape_GIS							= whg.Surface_Location_Shape
				,Surface_Longitude_NAD27_GIS						= whg.Surface_Longitude_NAD27
				,Target_Formation_GIS								= whg.Target_Formation
				,Unit_Name_GIS										= whg.Unit_Name
				,Unit_Name_Antero_Standard_GIS						= whg.Unit_Name_Antero_Standard
				,Well_Name_GIS										= whg.Well_Name
				,Well_Name_Antero_Standard_GIS						= whg.Well_Name_Antero_Standard
				,Wellbore_Shape_GIS									= whg.Wellbore_Shape
				,Wellbore_Shape_NAD27_BLM_GIS						= whg.Wellbore_Shape_NAD27_BLM
				,Wellbore_Name_GIS									= whg.Wellbore_Name
				,Wellbore_Name_Antero_Standard_GIS					= whg.Wellbore_Name_Antero_Standard
				,Spacing_East_GIS									= whg.Spacing_East
				,Spacing_West_GIS									= whg.Spacing_West
				,Type_Curve_Name_GIS								= whg.Type_Curve_Name
				,Planned_Lateral_Spacing_GIS						= whg.Planned_Lateral_Spacing
				,Oil_Yield_Grid_Code_GIS							= whg.Oil_Yield_Grid_Code
				,Unit_Acreage_GIS									= whg.Unit_Acreage
				,Property_Direction_GIS								= whg.Property_Direction
				,Gathering_Fee_Area_GIS								= whg.Gathering_Fee_Area
				,Compressor_Area_GIS								= whg.Compressor_Area
				,Compressor_Name_GIS								= whg.Compressor_Name
				,Raw_Reserver_Category_GIS							= whg.Raw_Reserve_Category
				,Surface_Location_NAD27_DMS_GIS						= iif(whg.Surface_Latitude_NAD27 IS NOT NULL AND whg.Surface_Latitude_NAD27 IS NOT NULL ,concat(
																		floor(abs(whg.Surface_Latitude_NAD27))
																		,nchar(176)
																		,' '
																		,convert(INT,convert(DECIMAL(17, 10),abs(whg.Surface_Latitude_NAD27 * 60)) % 60)
																		,''' '
																		,convert(DECIMAL(4, 2),convert(DECIMAL(17, 10),abs(whg.Surface_Latitude_NAD27) * 3600) % 60)
																		,iif(whg.Surface_Latitude_NAD27 < 0,'" S & ','" N & ')
																		,floor(abs(whg.Surface_Longitude_NAD27))
																		,nchar(176)
																		,' '
																		,convert(INT,convert(DECIMAL(17, 10),abs(whg.Surface_Longitude_NAD27 * 60)) % 60),''' '
																		,convert(DECIMAL(4, 2),convert(DECIMAL(17, 10),abs(whg.Surface_Longitude_NAD27) * 3600) % 60)
																		,iif(whg.Surface_Longitude_NAD27 < 0,'" W','" E')
																	  ),NULL)
				,BottomHole_Location_NAD27_DMS_GIS					= iif(whg.BottomHole_Latitude_NAD27 IS NOT NULL AND whg.BottomHole_Latitude_NAD27 IS NOT NULL,concat(
																		 floor(abs(whg.BottomHole_Latitude_NAD27))
																		,nchar(176)
																		,' '
																		,convert(INT,convert(DECIMAL(17, 10),abs(whg.BottomHole_Latitude_NAD27 * 60)) % 60)
																		,''' '
																		,convert(DECIMAL(4, 2)
																		,convert(
																								DECIMAL(17, 10)
																								,abs(whg.BottomHole_Latitude_NAD27)
																								* 3600
																							) % 60
																				)
																		,iif(whg.BottomHole_Latitude_NAD27 < 0
															,'" S & '
															,'" N & ')
																					,floor(abs(whg.BottomHole_Longitude_NAD27))
																					,nchar(176)
																					,' '
																					,convert(
																								INT
																								,convert(
																											DECIMAL(17, 10)
																											,abs(whg.BottomHole_Longitude_NAD27
																												* 60
																												)
																										) % 60
																							)
																					,''' '
																					,convert(
																								DECIMAL(4, 2)
																								,convert(
																											DECIMAL(17, 10)
																											,abs(whg.BottomHole_Longitude_NAD27)
																											* 3600
																										) % 60
																							)
																					,iif(whg.BottomHole_Longitude_NAD27 < 0
															,'" W'
															,'" E')
																				)
																		,NULL)
				--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
				,Aries_ID_Aries_Planning							= whap.Aries_ID
				,Well_Name_Aries_Planning							= whap.Well_Name
				,Well_Name_Antero_Standard_Aries_Planning			= whap.Well_Name_Antero_Standard
				,Wellbore_Name_Antero_Standard_Aries_Planning		= whap.Wellbore_Name_Antero_Standard
				,State_Name_Aries_Planning							= whap.State_Name
				,Configuration_Aries_Planning						= whap.Configuration
				,County_Aries_Planning								= whap.County
				,Prospect_Aries_Planning							= whap.Prospect
				,API_Number_Aries_Planning							= whap.API_Number
				,Pad_Name_Aries_Planning							= whap.Pad_Name
				,Pad_Name_Antero_Standard_Aries_Planning			= whap.Pad_Name_Antero_Standard
				,SEQNUM_Aries_Planning								= whap.SEQNUM
				,Well_Number_Aries_Planning							= whap.Well_Number
				,Drilled_Lateral_Length_Aries_Planning				= whap.Cased_Lateral_Length
				,Cased_Lateral_Length_Aries_Planning				= whap.Cased_Lateral_Length
				,Completed_Lateral_Length_Aries_Planning			= whap.Completed_Lateral_Length
				,PropNum_Aries_Planning								= whap.PropNum
				,Current_Operations_Aries_Planning					= whap.Current_Operations
				,Total_Measured_Depth_Actual_Aries_Planning			= whap.Total_Measured_Depth_Actual
				,Total_Vertical_Depth_Aries_Planning				= whap.Total_Vertical_Depth
				,Operator_Aries_Planning							= whap.Operator
				,Working_Interest_Aries_Planning					= whap.Working_Interest
				,Net_Revenue_Interest_Aries_Planning				= whap.Net_Revenue_Interest
				,First_Production_Date_Gas_Coalesced_Aries_Planning = whap.First_Production_Date_Gas_Coalesced
				,First_Production_Date_Gas_Actual_Aries_Planning	= whap.First_Production_Date_Gas_Actual
				,Surface_Spud_Date_Actual_Aries_Planning			= whap.Surface_Spud_Date_Actual
				,Surface_Spud_Date_Aries_Planning					= whap.Surface_Spud_Date
				,Small_Rig_Spud_Date_Actual_Aries_Planning			= whap.Small_Rig_Spud_Date_Actual
				,Shut_In_Date_Aries_Planning						= whap.Shut_In_Date
				,Basin_Aries_Planning								= whap.Basin
				,Raw_Reserve_Category_Aries_Planning				= whap.Raw_Reserve_Category
				,Reserve_Category_Aries_Planning					= whap.Reserve_Category
				,API_State_Name_Aries_Planning						= whap.API_State_Name
				,API_County_Name_Aries_Planning						= whap.API_County_Name
				,Surface_Latitude_NAD27_Aries_Planning				= whap.Surface_Latitude_NAD27
				,Surface_Longitude_NAD27_Aries_Planning				= whap.Surface_Longitude_NAD27
				,Producing_Formation_Aries_Planning					= whap.Producing_Formation
				,Unit_Name_Aries_Planning							= whap.Unit_Name
				,Longstring_Spud_Date_Actual_Aries_Planning			= whap.Longstring_Spud_Date_Actual
				,Longstring_Spud_Date_Planned_Aries_Planning		= whap.Longstring_Spud_Date_Planned
				--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
				,EDW_Is_Deleted_whm									= whm.EDW_Is_Deleted
				,EDW_Is_Deleted_wha									= wha.EDW_Is_Deleted
				,EDW_Is_Deleted_whe									= whe.EDW_Is_Deleted
				,EDW_Is_Deleted_whfs								= whfs.EDW_Is_Deleted
				,EDW_Is_Deleted_whmk								= whmk.EDW_Is_Deleted
				,EDW_Is_Deleted_whp									= whp.EDW_Is_Deleted
				,EDW_Is_Deleted_whsf								= whsf.EDW_Is_Deleted
				,EDW_Is_Deleted_whwv								= whwv.EDW_Is_Deleted
				,EDW_Is_Deleted_whg									= whg.EDW_Is_Deleted
				,EDW_Is_Deleted_whap								= whap.EDW_Is_Deleted
				,EDW_Is_Deleted_well_name_title_case				= well_name_title_case.EDW_Is_Deleted
				,EDW_Is_Deleted_well_name_proper_case				= well_name_proper_case.EDW_Is_Deleted
				,EDW_Create_Date_whm								= whm.EDW_Create_Date
				,EDW_Create_Date_wha								= wha.EDW_Create_Date
				,EDW_Create_Date_whe								= whe.EDW_Create_Date
				,EDW_Create_Date_whfs								= whfs.EDW_Create_Date
				,EDW_Create_Date_whmk								= whmk.EDW_Create_Date
				,EDW_Create_Date_whp								= whp.EDW_Create_Date
				,EDW_Create_Date_whsf								= whsf.EDW_Create_Date
				,EDW_Create_Date_whwv								= whwv.EDW_Create_Date
				,EDW_Create_Date_whg								= whg.EDW_Create_Date
				,EDW_Create_Date_whap								= whap.EDW_Create_Date
			FROM
				Master.Hub_Well_Header								wh
				LEFT JOIN Master.Sat_Well_Header			whm
					ON wh.Hub_Well_Header_ID = whm.Hub_Well_Header_ID

				LEFT JOIN Master.Sat_Well_Header_Aries		wha
					ON wh.Hub_Well_Header_ID = wha.Hub_Well_Header_ID
					AND wha.EDW_Is_Deleted = 0

				LEFT JOIN Master.Sat_Well_Header_Enertia	whe
					ON wh.Hub_Well_Header_ID = whe.Hub_Well_Header_ID
					AND whe.EDW_Is_Deleted = 0

				LEFT JOIN Master.Sat_Well_Header_FracSchedule whfs
					ON wh.Hub_Well_Header_ID = whfs.Hub_Well_Header_ID
					AND whfs.EDW_Is_Deleted = 0

				LEFT JOIN Master.Sat_Well_Header_Merrick	whmk
					ON wh.Hub_Well_Header_ID = whmk.Hub_Well_Header_ID
					AND whmk.EDW_Is_Deleted = 0

				LEFT JOIN Master.Sat_Well_Header_Petra		whp
					ON wh.Hub_Well_Header_ID = whp.Hub_Well_Header_ID
					AND whp.EDW_Is_Deleted = 0

				LEFT JOIN Master.Sat_Well_Header_Sigmaflow	whsf
					ON wh.Hub_Well_Header_ID = whsf.Hub_Well_Header_ID
					AND whsf.EDW_Is_Deleted = 0

				LEFT JOIN Master.Sat_Well_Header_Wellview	whwv
					ON wh.Hub_Well_Header_ID = whwv.Hub_Well_Header_ID
					AND whwv.EDW_Is_Deleted = 0

				LEFT JOIN Master.Sat_Well_Header_GIS		whg
					ON wh.Hub_Well_Header_ID = whg.Hub_Well_Header_ID
					AND whg.EDW_Is_Deleted = 0

				LEFT JOIN Master.Sat_Well_Header_Aries_Planning whap
					ON wh.Hub_Well_Header_ID = whap.Hub_Well_Header_ID
					AND whap.EDW_Is_Deleted = 0

				LEFT JOIN Master.Sat_Well_Header_Alias_Well_Name well_name_title_case
					ON wh.Hub_Well_Header_UID = well_name_title_case.Hub_Well_Header_UID
					AND well_name_title_case.Sat_Well_Header_Alias_Well_Name_Type_ID = 1
					AND well_name_title_case.EDW_Is_Deleted = 0

				LEFT JOIN Master.Sat_Well_Header_Alias_Well_Name well_name_proper_case
					ON wh.Hub_Well_Header_UID = well_name_proper_case.Hub_Well_Header_UID
					AND well_name_proper_case.Sat_Well_Header_Alias_Well_Name_Type_ID = 2
					AND well_name_proper_case.EDW_Is_Deleted = 0
			WHERE
				wh.EDW_Is_Deleted = 0
				AND (
						whm.Well_Name IS NOT NULL
						OR wha.Well_Name IS NOT NULL
						OR whe.Well_Name IS NOT NULL
						OR whfs.Well_Name IS NOT NULL
						OR whmk.Well_Name IS NOT NULL
						OR whp.Well_Name IS NOT NULL
						OR whsf.Well_Name IS NOT NULL
						OR whwv.Well_Name IS NOT NULL
						OR whg.Well_Name IS NOT NULL
						OR whap.Well_Name IS NOT NULL
						OR well_name_title_case.Well_Name IS NOT NULL
						OR well_name_proper_case.Well_Name IS NOT NULL
					)
			) aa
	) bb
) cc
