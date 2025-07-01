USE Rockwell_Integration

SELECT
	 AA.RowNum
	,AA.Derived_Key
	,AA.Timestamp_Min
	,AA.Timestamp_Max
	,AA.[Ticket Number]
	,AA.[Timestamp ME Eastern]
	,AA.[Timestamp ME String]
	,AA.Location
	,AA.[Company Name]
	,AA.[Truck Name]
	,AA.Operator
	,AA.[Bay ID]
	,AA.[Truck Capacity]
	,AA.[Observed Volume]
	,AA.[Total Volume]
	,AA.[Volume Differential]
	,AA.[Conductivity Max]
	,AA.[Conductivity Min]
	,AA.[Conductivity Avg]
	,AA.[Total Minutes]
	,AA.[Pressure Max]
	,AA.[Pressure Min]
	,AA.[Pressure Avg]
	,AA.[Flow Max]
	,AA.[Flow Min]
	,AA.[Flow Avg]
FROM (
	SELECT
		 RowNum					= row_number() OVER (PARTITION BY (SELECT 1) ORDER BY (SELECT 1))
		,Derived_Key			= Derived_WaterTagKey
		,Timestamp_Min			= min(time)
		,Timestamp_Max			= max(time)
		,[Company Name]			= max(
									CASE
										WHEN Derived_tag IN (
											 'Derived_Pioneer_Water.Truck_Offloading.Historian_Truck_Data.Company_Name'
											,'Derived_Mobile_01_Water.Truck_Offloading.Historian_Truck_Data.Company_Name'
											,'Derived_Mobile_02_Water.Truck_Offloading.Historian_Truck_Data.Company_Name'
										) THEN Derived_Value_Conditioned
									END
								  )
		,[Conductivity Max]		= max(
									CASE
										WHEN Derived_tag IN (
											 'Derived_Pioneer_Water.Truck_Offloading.Historian_Truck_Data.Conductivity_MIN_MAX.MAX'
											,'Derived_Mobile_01_Water.Truck_Offloading.Historian_Truck_Data.Conductivity_MIN_MAX.MAX'
											,'Derived_Mobile_02_Water.Truck_Offloading.Historian_Truck_Data.Conductivity_MIN_MAX.MAX'
										) THEN cast(Derived_Value_Conditioned AS FLOAT)
									END
								  )
		,[Conductivity Min]		= max(
									CASE
										WHEN Derived_tag IN (
											 'Derived_Pioneer_Water.Truck_Offloading.Historian_Truck_Data.Conductivity_MIN_MAX.MIN'
											,'Derived_Mobile_01_Water.Truck_Offloading.Historian_Truck_Data.Conductivity_MIN_MAX.MIN'
											,'Derived_Mobile_02_Water.Truck_Offloading.Historian_Truck_Data.Conductivity_MIN_MAX.MIN'
										) THEN cast(Derived_Value_Conditioned AS FLOAT)
										END
									)
		,[Conductivity Avg]		= max(
									CASE
										WHEN Derived_tag IN (
											 'Derived_Pioneer_Water.Truck_Offloading.Historian_Truck_Data.Conductivity_MOV_AVE.AVE'
											,'Derived_Mobile_01_Water.Truck_Offloading.Historian_Truck_Data.Conductivity_MOV_AVE.AVE'
											,'Derived_Mobile_02_Water.Truck_Offloading.Historian_Truck_Data.Conductivity_MOV_AVE.AVE'
										) THEN cast(Derived_Value_Conditioned AS FLOAT)
									END
								  )
		,[Flow Max]				= max(
									CASE
										WHEN Derived_tag IN (
											 'Derived_Pioneer_Water.Truck_Offloading.Historian_Truck_Data.Flow_MIN_MAX.MAX'
											,'Derived_Mobile_01_Water.Truck_Offloading.Historian_Truck_Data.Flow_MIN_MAX.MAX'
											,'Derived_Mobile_02_Water.Truck_Offloading.Historian_Truck_Data.Flow_MIN_MAX.MAX'
										) THEN cast(Derived_Value_Conditioned AS FLOAT)
									END
								  )
		,[Flow Min]				= max(
									CASE
										WHEN Derived_tag IN (
											 'Derived_Pioneer_Water.Truck_Offloading.Historian_Truck_Data.Flow_MIN_MAX.MIN'
											,'Derived_Mobile_01_Water.Truck_Offloading.Historian_Truck_Data.Flow_MIN_MAX.MIN'
											,'Derived_Mobile_02_Water.Truck_Offloading.Historian_Truck_Data.Flow_MIN_MAX.MIN'
										) THEN cast(Derived_Value_Conditioned AS FLOAT)
									END
								  )
		,[Flow Avg]				= max(	
									CASE
										WHEN Derived_tag IN (
											 'Derived_Pioneer_Water.Truck_Offloading.Historian_Truck_Data.Flow_MOV_AVE.AVE'
											,'Derived_Mobile_01_Water.Truck_Offloading.Historian_Truck_Data.Flow_MOV_AVE.AVE'
											,'Derived_Mobile_02_Water.Truck_Offloading.Historian_Truck_Data.Flow_MOV_AVE.AVE'
										) THEN cast(Derived_Value_Conditioned AS FLOAT)
									END
								  )
		,[Bay ID]				= max(
									CASE
										WHEN Derived_tag IN (
											 'Derived_Pioneer_Water.Truck_Offloading.Historian_Truck_Data.Historian_Bay_ID'
											,'Derived_Mobile_01_Water.Truck_Offloading.Historian_Truck_Data.Historian_Bay_ID'
											,'Derived_Mobile_02_Water.Truck_Offloading.Historian_Truck_Data.Historian_Bay_ID'
										) THEN Derived_Value_Conditioned
									END
								  )
		,[Timestamp ME String]	= max(	
									CASE
										WHEN Derived_tag IN (
											 'Derived_Pioneer_Water.Truck_Offloading.Historian_Truck_Data.Historian_ME_DateTimeStamp'
											,'Derived_Mobile_01_Water.Truck_Offloading.Historian_Truck_Data.Historian_ME_DateTimeStamp'
											,'Derived_Mobile_02_Water.Truck_Offloading.Historian_Truck_Data.Historian_ME_DateTimeStamp'
										) THEN Derived_Value_Conditioned
									END
								  )
		,[Timestamp ME Eastern] = max(
									CASE
										WHEN Derived_tag IN (
											 'Derived_Pioneer_Water.Truck_Offloading.Historian_Truck_Data.Historian_ME_DateTimeStamp_EST_EDT'
											,'Derived_Mobile_01_Water.Truck_Offloading.Historian_Truck_Data.Historian_ME_DateTimeStamp_EST_EDT'
											,'Derived_Mobile_02_Water.Truck_Offloading.Historian_Truck_Data.Historian_ME_DateTimeStamp_EST_EDT'
										) THEN cast(Derived_Value_Conditioned AS DATETIME)
									END
								  )
		,Location				= max(	
									CASE
										WHEN Derived_tag IN (
											 'Derived_Pioneer_Water.Truck_Offloading.Historian_Truck_Data.Location'
											,'Derived_Mobile_01_Water.Truck_Offloading.Historian_Truck_Data.Location'
											,'Derived_Mobile_02_Water.Truck_Offloading.Historian_Truck_Data.Location'
										) THEN Derived_Value_Conditioned
									END
								  )
		,[Observed Volume]		= max(
									CASE
										WHEN Derived_tag IN (
											 'Derived_Pioneer_Water.Truck_Offloading.Historian_Truck_Data.Observed_Volume'
											,'Derived_Mobile_01_Water.Truck_Offloading.Historian_Truck_Data.Observed_Volume'
											,'Derived_Mobile_02_Water.Truck_Offloading.Historian_Truck_Data.Observed_Volume'
										) THEN cast(Derived_Value_Conditioned AS FLOAT)
									END
								  )
		,Operator				= max(	
									CASE
										WHEN Derived_tag IN (
											 'Derived_Pioneer_Water.Truck_Offloading.Historian_Truck_Data.Operator'
											,'Derived_Mobile_01_Water.Truck_Offloading.Historian_Truck_Data.Operator'
											,'Derived_Mobile_02_Water.Truck_Offloading.Historian_Truck_Data.Operator'
										) THEN Derived_Value_Conditioned
									END
								  )
		,[Pressure Max]			= max(
									CASE
										WHEN Derived_tag IN (
											 'Derived_Pioneer_Water.Truck_Offloading.Historian_Truck_Data.Pressure_MIN_MAX.MAX'
											,'Derived_Mobile_01_Water.Truck_Offloading.Historian_Truck_Data.Pressure_MIN_MAX.MAX'
											,'Derived_Mobile_02_Water.Truck_Offloading.Historian_Truck_Data.Pressure_MIN_MAX.MAX'
										) THEN cast(Derived_Value_Conditioned AS FLOAT)
									END
								  )
		,[Pressure Min]			= max(	
									CASE
										WHEN Derived_tag IN (
											 'Derived_Pioneer_Water.Truck_Offloading.Historian_Truck_Data.Pressure_MIN_MAX.MIN'
											,'Derived_Mobile_01_Water.Truck_Offloading.Historian_Truck_Data.Pressure_MIN_MAX.MIN'
											,'Derived_Mobile_02_Water.Truck_Offloading.Historian_Truck_Data.Pressure_MIN_MAX.MIN'
										) THEN cast(Derived_Value_Conditioned AS FLOAT)
									END
								  )
		,[Pressure Avg]			= max(	
									CASE
										WHEN Derived_tag IN (
											 'Derived_Pioneer_Water.Truck_Offloading.Historian_Truck_Data.Pressure_MOV_AVE.AVE'
											,'Derived_Mobile_01_Water.Truck_Offloading.Historian_Truck_Data.Pressure_MOV_AVE.AVE'
											,'Derived_Mobile_02_Water.Truck_Offloading.Historian_Truck_Data.Pressure_MOV_AVE.AVE'
										) THEN cast(Derived_Value_Conditioned AS FLOAT)
									END
								  )
		,[Ticket Number]		= max(
									CASE
										WHEN Derived_tag IN (
											 'Derived_Pioneer_Water.Truck_Offloading.Historian_Truck_Data.Ticket_Number'
											,'Derived_Mobile_01_Water.Truck_Offloading.Historian_Truck_Data.Ticket_Number'
											,'Derived_Mobile_02_Water.Truck_Offloading.Historian_Truck_Data.Ticket_Number'
										) THEN Derived_Value_Conditioned
									END
								  )
		,[Total Minutes]		= max(
									CASE
										WHEN Derived_tag IN (
											 'Derived_Pioneer_Water.Truck_Offloading.Historian_Truck_Data.Total_Time_Mins'
											,'Derived_Mobile_01_Water.Truck_Offloading.Historian_Truck_Data.Total_Time_Mins'
											,'Derived_Mobile_02_Water.Truck_Offloading.Historian_Truck_Data.Total_Time_Mins'
										) THEN cast(Derived_Value_Conditioned AS FLOAT)
									END
								  )
		,[Total Volume]			= max(
									CASE
										WHEN Derived_tag IN (
											 'Derived_Pioneer_Water.Truck_Offloading.Historian_Truck_Data.Total_Volume'
											,'Derived_Mobile_01_Water.Truck_Offloading.Historian_Truck_Data.Total_Volume'
											,'Derived_Mobile_02_Water.Truck_Offloading.Historian_Truck_Data.Total_Volume'
										) THEN cast(Derived_Value_Conditioned AS FLOAT)
									END
								  )
		,[Truck Capacity]		= max(
									CASE
										WHEN Derived_tag IN (
											 'Derived_Pioneer_Water.Truck_Offloading.Historian_Truck_Data.Truck_Capacity'
											,'Derived_Mobile_01_Water.Truck_Offloading.Historian_Truck_Data.Truck_Capacity'
											,'Derived_Mobile_02_Water.Truck_Offloading.Historian_Truck_Data.Truck_Capacity'
										) THEN cast(Derived_Value_Conditioned AS FLOAT)
									END
								  )
		,[Truck Name]			= max(
									CASE
										WHEN Derived_tag IN (
											 'Derived_Pioneer_Water.Truck_Offloading.Historian_Truck_Data.Truck_Name'
											,'Derived_Mobile_01_Water.Truck_Offloading.Historian_Truck_Data.Truck_Name'
											,'Derived_Mobile_02_Water.Truck_Offloading.Historian_Truck_Data.Truck_Name'
										) THEN Derived_Value_Conditioned
									END
								  )
		,[Volume Differential]	= max(	
									CASE
										WHEN Derived_tag IN (
											 'Derived_Pioneer_Water.Truck_Offloading.Historian_Truck_Data.Volume_Differential'
											,'Derived_Mobile_01_Water.Truck_Offloading.Historian_Truck_Data.Volume_Differential'
											,'Derived_Mobile_02_Water.Truck_Offloading.Historian_Truck_Data.Volume_Differential'
										) THEN cast(Derived_Value_Conditioned AS FLOAT)
									END
								  )
	FROM
		pioneer.[Haul Report All Rows Conditioned]
	GROUP BY
		Derived_WaterTagKey
) AA

WHERE 1=1
	AND [Company Name] NOT LIKE '%TEST COMPANY%' 
	AND [Truck Name] NOT LIKE '%QWER%'
	AND AA.[Ticket Number] = '300000173'

RowNum	Derived_Key	Timestamp_Min	Timestamp_Max	Ticket Number	Timestamp ME Eastern	Timestamp ME String	Location	Company Name	Truck Name	Operator	Bay ID	Truck Capacity	Observed Volume	Total Volume	Volume Differential	Conductivity Max	Conductivity Min	Conductivity Avg	Total Minutes	Pressure Max	Pressure Min	Pressure Avg	Flow Max	Flow Min	Flow Avg
331411	371311	2025-04-02 01:17:12.0170100	2025-04-02 01:17:12.0250000	300000173	2025-04-02 04:17:10.000	1743581830	Cashew	Hall Drilling	1057	Antero	10	112	112	108.373146	0	0	0	0	13.7699337	0	0	0	9.7804966	1.15111589	8.01713943