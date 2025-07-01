USE EDW_Stage
SELECT
	 t0.name
	,t1.class
	,t1.class_desc
	,objectSchema = object_schema_name(t1.major_id)
	,objectName = object_name(t1.major_id)
	,t1.major_id
	,t1.minor_id
	,t1.grantee_principal_id
	,t1.grantor_principal_id
	,t1.type
	,t1.permission_name
	,t1.state
	,t1.state_desc
	,GrantSql	= CASE 
					WHEN 
						t1.major_id != 0 
					THEN 
						concat(t1.state_desc, ' ', t1.permission_name, ' ON OBJECT::', quotename(object_schema_name(t1.major_id)), '.', quotename(object_name(t1.major_id)), ' TO [ANTERO\rbuesing]') 
					ELSE 
						concat(t1.state_desc, ' ', t1.permission_name, ' TO [ANTERO\rbuesing]') 
				  END
FROM
	sys.database_principals t0
	
	INNER JOIN sys.database_permissions t1
		ON t0.principal_id = t1.grantee_principal_id
WHERE 1=1
	AND t0.name LIKE 'ANTERO\rbeeler'
	

SELECT
	 t0.name
	,t2.name
FROM
	sys.database_principals t0

	INNER JOIN sys.database_role_members t1
		ON t0.principal_id = t1.member_principal_id

	INNER JOIN sys.database_principals t2
		ON t1.role_principal_id = t2.principal_id

WHERE 1=1	
	AND t0.name LIKE 'ANTERO\rbeeler'

Invoke-SqlCmd "USE master IF NOT EXISTS (SELECT NULL FROM sys.server_principals WHERE name = 'ANTERO\rbuesing') CREATE LOGIN [ANTERO\rbuesing] FROM WINDOWS"
Invoke-SqlCmd "USE EDW IF NOT EXISTS (SELECT NULL FROM sys.database_principals WHERE name = 'ANTERO\rbuesing') CREATE USER [ANTERO\rbuesing] FROM LOGIN [ANTERO\rbuesing] WITH DEFAULT_SCHEMA = dbo"

Invoke-SqlCmd "USE EDW GRANT CONNECT TO [ANTERO\rbuesing]"

USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Readings_Integration] TO [ANTERO\rbeeler]
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[ESG_Wellview_Tubing] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Event_Status_Codes] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_VRU_1] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Readings_Base] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Readings_Integration_Tank_VRU] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Blowdowns_Partial_PipeSize_1_Checklists] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Blowdowns_Partial_PipeSize_1_Checklists_Summary] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Blowdowns_Partial_PipeSize_2_Checklists_Data_Quality] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[ESG_Rockwell_Emissions_Grid] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Base] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Prod_Tank_2_Raw] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Release] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Mid_Tank_2_Raw] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Release_Checklists] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Prod_Tank_3_Raw] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Release_Checklists_Data_Quality] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Closing_Codes_Orig] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[ESG_Wellview_Drillout Flare] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[ESG_Wellview_Drillout Flare Data Quality] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[ESG_Wellview_Drillout Flare Summary] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[ESG_Line_Temperature_And_Pressure_Reference_Date] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[ESG_Line_Temperature_And_Pressure_Per_Pad_Per_Day] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Generator_2_Checklists_MAS] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[ESG_GIS_Pipeline_Mileage] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[ESG_Wellview_Casing] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[ESG_Line_Temperature_And_Pressure_Per_Pad_Per_Month] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_LDAR] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_LDAR_ESG] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Dehy_Dewpoint_1_Checklists_AM] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Dehy_Dewpoint_1_Checklists_AR] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Dehy_DownTimeHours_1_Checklists_AM] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Combustors_OneOtherUp_1_Checklists] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Dehy_DownTimeHours_1_Checklists_AR] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Combustors_Downtime_1_Checklists] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Dehy_Dewpoint_1_Checklists] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Dehy_PumpGasSeparatorTankPres_1_Checklists_AM] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Blowdowns_Full_Equipment_Count_1_Checklists_Summary] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Dehy_PumpStroke_1_Checklists] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Dehy_PumpGasSeparatorTankPres_1_Checklists_AR] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Blowdowns_Full_Equipment_Count_2_Checklists_Data_Quality] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Production_Inclusive] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Dehy_PumpGasSeparatorTankTemp_1_Checklists_AM] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Blowdowns_Full_Equipment_Count_1_Checklists] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Events] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Plunger] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Checklists_06292022] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Dehy_PumpGasSeparatorTankTemp_1_Checklists_AR] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Blowdowns_Partial_Pressure_1_Checklists] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Checklists_Questions] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Checklists_Plunger] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Dehy_PumpStroke_1_Checklists_AM] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Blowdowns_Partial_Equipment_1_Checklists] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Checklists_Pivot] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Checklists_Questions_Plunger] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Dehy_PumpStroke_1_Checklists_AR] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Equipment] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Equipment_Production_VRU] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_DumpValves] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Checklists_Pivot_Plunger] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_DumpValves_1] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_DumpValves_2_Checklists] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Production_Work_Orders] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_DumpValves_1_Checklists_Summary] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_ESD] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_ESD_1] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Closing_Codes_Manual] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_ESD_Summary] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Readings_Meter] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_LDAR_AM] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Equipment_Moves] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Readings_Other] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Equipment_Movement] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Dehy_1] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Air_Compressors_Gas_Pneumatics_1_Checklists_Summary] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Dehy_2_Checklists] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Assets] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Air_Compressors_Gas_Pneumatics_2_Checklists_Data_Quality] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[ESG_Merrick_Production_Discharge] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[ESG_Merrick_Production_Inlet] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Air_Tracker] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Tank] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Checklists_Tank] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Checklists_Unpivot_Tank] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Liguids_Unloading] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Checklists_Questions_Tank] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[ESG_Merrick_Production_Air_Quality_Tracker_Compresssor Station] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Liquids_Unloading] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Checklists_Pivot_Tank] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Generator] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Generator_1] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Checklists_Liquids_Unloading] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Dehy_Dewpoint_1_Checklists_Summary] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Generator_2_Checklists] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[ESG_Rockwell_Emissions] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Checklists_Questions_Liquids_Unloading] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[ESG_Merrick_Production_Inlet_Daily] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Dehy_Dewpoint_2_Checklists_Data_Quality] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Combustors_0] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_VRU] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Checklists_Pivot_Liquids_Unloading] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Generator_2_Checklists_Data_Quality] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Dehy_PumpStroke_1_Checklists_Summary] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Combustors_1] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Dehy_PumpStroke_2_Checklists_Data_Quality] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Combustors_2_Checklists] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Dehy_PumpGasSeparatorTankTemp_1_Checklists_Summary] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Combustors_Downtime_1_Checklists_Summary] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Dehy_PumpGasSeparatorTankTemp_2_Checklists_Data_Quality] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Combustors_Downtime_2_Checklists_Data_Quality] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Dehy_PumpGasSeparatorTankPres_1_Checklists_Summary] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Combustors_OneOtherUp_1_Checklists_Summary] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Dehy_PumpGasSeparatorTankPres_2_Checklists_Data_Quality] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[ESG_Gas_GasAnalysis] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[ESG_Wellview_Tubing_Orig] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Dehy_DownTimeHours_1_Checklists_Summary] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Compressors] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Dehy] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_All_Table] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Dehy_DownTimeHours_2_Checklists_Data_Quality] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Compressors_1] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[ESG_Wellview_Casing_Orig] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Production] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Compressors_2_Checklists] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Compressors_EngineCount_1_Checklists_Summary] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Compressors_EngineCount_2_Checklists_Data_Quality] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[ESG_Merrick_Production_Air_Quality_Tracker_Well] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[ESG_Merrick_Production_Air_Quality_Tracker_Pad] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Blowdowns_Full] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Blowdowns_Full_1] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[ESG_Gas_GasAnalysis_Component_Info] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[ESG_Gas_GasAnalysis_Info] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[ESG_Gas_GasAnalysis_Maguire] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_All] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_R5_Events_View] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[ESG_Line_Temperature_And_Pressure] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Blowdowns_Full_2_Checklists] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Prod] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Prod_Checklists] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_R5_Objects_View] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Blowdowns_Partial_1] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Blowdowns_Partial_2_Checklists] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Blowdowns_Partial_Equipment_1_Checklists_Summary] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Blowdowns_Partial_Equipment_2_Checklists_Data_Quality] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Blowdowns_Partial_Pressure_1_Checklists_Summary] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Blowdowns_Partial_Pressure_2_Checklists_Data_Quality] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_LDAR_Failure_Description] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_LDAR_AM_With_Descriptions] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Checklists] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_LDAR_Table_W-1E Classification] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Checklists_Left] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_LDAR_Base] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Generator_2_Checklists_Baseline] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Generator_1_MinMax] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_LDAR_AR_Baseline] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_LDAR_AM_Primitive] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_LDAR_AM_Baseline] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_LDAR_AR] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Closing_Codes] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Combustors] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Air_Compressors] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Air_Compressors_1] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Pipelines_and_Valves_All_Columns] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Air_Compressors_2_Checklists] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Pipelines_and_Valves] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Well_Unloading] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Well_Unloading_1] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Well_Unloading_2_Checklists] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Well_Unloading_WH_Pressure_1_Checklists_Summary] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Combustors_OneOtherUp_2_Checklists_Data_Quality] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Well_Unloading_WH_Pressure_2_Checklists_Data_Quality] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Air_Compressors_Gas_Pneumatics_1_Checklists] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Well_Unloading_Flow_Duration_1_Checklists_Summary] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Air_Compressors_Gas_Pneumatics_1_Checklists_Summary2] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[EAM_Work_Orders_Well_Unloading_Flow_Duration_2_Checklists_Data_Quality] TO [ANTERO\rbuesing]"
Invoke-SqlCmd "USE EDW GRANT SELECT ON OBJECT::[Mart].[ESG_Wellview_Drilling_Fuel_Use] TO [ANTERO\rbuesing]"

GRANT CONNECT TO [ANTERO\rbuesing]
GRANT SELECT ON OBJECT::[Stage].[EAM_R5_Closing_Codes] TO [ANTERO\rbuesing]
GRANT SELECT ON OBJECT::[Stage].[EAM_R5_Readings] TO [ANTERO\rbuesing]
GRANT SELECT ON OBJECT::[Stage].[EAM_R5_Related_Meter_Readings] TO [ANTERO\rbuesing]
GRANT SELECT ON OBJECT::[Stage].[EAM_R5_Assets] TO [ANTERO\rbuesing]
GRANT SELECT ON OBJECT::[Stage].[EAM_R5_U5AIR_TRACK] TO [ANTERO\rbuesing]
GRANT SELECT ON OBJECT::[Stage].[EAM_R5_ActChecklists] TO [ANTERO\rbuesing]
GRANT SELECT ON OBJECT::[Stage].[EAM_R5_ActSchedules] TO [ANTERO\rbuesing]
GRANT SELECT ON OBJECT::[Stage].[EAM_R5_AudValues] TO [ANTERO\rbuesing]
GRANT SELECT ON OBJECT::[Stage].[EAM_R5_BookedHours] TO [ANTERO\rbuesing]
GRANT SELECT ON OBJECT::[Stage].[EAM_R5_Descriptions] TO [ANTERO\rbuesing]
GRANT SELECT ON OBJECT::[Stage].[EAM_R5_Events] TO [ANTERO\rbuesing]
GRANT SELECT ON OBJECT::[Stage].[EAM_R5_Objects] TO [ANTERO\rbuesing]
GRANT SELECT ON OBJECT::[Stage].[EAM_R5_Parts] TO [ANTERO\rbuesing]
GRANT SELECT ON OBJECT::[Stage].[EAM_R5_Personnel] TO [ANTERO\rbuesing]
GRANT SELECT ON OBJECT::[Stage].[EAM_R5_PPMS] TO [ANTERO\rbuesing]
GRANT SELECT ON OBJECT::[Stage].[EAM_R5_Structures] TO [ANTERO\rbuesing]
GRANT SELECT ON OBJECT::[Stage].[EAM_R5_TaskChecklists] TO [ANTERO\rbuesing]
GRANT SELECT ON OBJECT::[Stage].[EAM_R5_Tasks] TO [ANTERO\rbuesing]
GRANT SELECT ON OBJECT::[Stage].[EAM_R5_Comments] TO [ANTERO\rbuesing]