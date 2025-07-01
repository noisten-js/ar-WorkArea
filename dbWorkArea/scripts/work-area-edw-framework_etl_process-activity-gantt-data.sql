;WITH cteBase AS (
	SELECT
		 t0.Etl_Process_Name
		,t1.Execution_Start_Date
		,StartDate = convert(DATE, t1.Execution_Start_Date)
		,EndDate = convert(DATE, t1.Execution_End_Date)
		,StartTime = convert(TIME, t1.Execution_Start_Date)
		,CntOfStartingSameHour = count(*) OVER (PARTITION BY t0.Etl_Process_Name, datepart(hh, t1.Execution_Start_Date))
		,Duration = datediff(MILLISECOND, t1.Execution_Start_Date, t1.Execution_End_Date)*.001/60.00
		,StartingHour = datepart(hh, t1.Execution_Start_Date)
	FROM
		dbo.Etl_Process t0

		INNER JOIN dbo.Etl_Process_Execution_Log t1
			ON t0.Etl_Process_Name = t1.Etl_Process_Name

	WHERE 1=1
		AND t0.Is_Active = 1
		AND t1.Execution_Status = 'Success' 
		AND t1.Execution_Start_Date > '2024-12-25'
		AND t1.Execution_End_Date IS NOT NULL
)
,cteBaseEx AS (
	SELECT
		Etl_Process_Name			= t0.Etl_Process_Name
	   ,StartingHour				= t0.StartingHour
	   ,CntOfStartingSameHour		= t0.CntOfStartingSameHour
	   ,Duration					= t0.Duration
	   ,AverageDuration				= avg(t0.Duration) OVER (PARTITION BY t0.Etl_Process_Name, t0.StartingHour)
	   ,idx = row_number() OVER (PARTITION BY t0.Etl_Process_Name ORDER BY t0.CntOfStartingSameHour DESC, t0.StartingHour)
	FROM
		cteBase t0
)
SELECT
	 t0.Etl_Process_Name
	,t0.CntOfStartingSameHour
	,t0.Duration
	,t0.StartingHour
	,StartTime			= convert(TIME, dateadd(hh, t0.StartingHour, '00:00'))
	,DurationMinHour	= ceiling(t0.AverageDuration/60.00)

FROM
	cteBaseEx t0
WHERE 1=1
	AND t0.idx = 1
ORDER BY 
	t0.Etl_Process_Name
