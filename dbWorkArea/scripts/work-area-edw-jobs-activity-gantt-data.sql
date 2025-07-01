-- Job run times
USE msdb
;WITH cteBase AS (
	SELECT
		 job_name		= t0.name
		,step_id		= t1.step_id
		,step_name		= t1.step_name
		,start_time		= concat(left('000000', abs(len(t1.run_time)-6)), t1.run_time)
		,duration		= concat(left('000000', abs(len(t1.run_duration)-6)), t1.run_duration)
	FROM
		dbo.sysjobs t0

		INNER JOIN dbo.sysjobhistory t1
			ON t0.job_id = t1.job_id

	WHERE 1=1
		AND t0.enabled = 1
		AND t1.run_status = 1
		AND t1.step_id = 0
)
,cteBaseEx AS (
	SELECT 
		 job_name			= t0.job_name
		,step_id			= t0.step_id
		,step_name			= t0.step_name
		,str_start_time		= t0.start_time
		,str_duration		= t0.duration
		,start_time			= try_convert(TIME, concat_ws(':'
								,substring(t0.start_time, 1, 2)
								,substring(t0.start_time, 3, 2)
								,substring(t0.start_time, 5, 2)
							))
		,duration			=  convert(INT, substring(t0.duration, 1, 2))*60
							  +convert(INT, substring(t0.duration, 3, 2))
							  +convert(INT, substring(t0.duration, 5, 2))/60.00
	FROM 
		cteBase t0
)
,cteJobStats AS (
	SELECT
		 t0.job_name
		,t0.step_id
		,t0.step_name
		,t0.str_start_time
		,t0.str_duration
		,t0.start_time
		,t0.duration

		,starting_minute	= datediff(MINUTE, '00:00:00.000', t0.start_time)
		,CntOfExecution		= count(*) OVER (PARTITION BY t0.job_name)
		,CntOfStartSameHour	= count(*) OVER (PARTITION BY t0.job_name, datediff(HOUR, '00:00:00.000', t0.start_time))
	FROM
		cteBaseEx t0
)
,cteJobStatsEx AS (
	SELECT
		t0.job_name
	   ,t0.step_id
	   ,t0.step_name
	   ,t0.str_start_time
	   ,t0.str_duration
	   ,t0.start_time
	   ,t0.duration
	   ,t0.starting_minute
	   ,t0.CntOfExecution
	   ,t0.CntOfStartSameHour
	   
	   ,AverageDuration			= avg(t0.duration) OVER (PARTITION BY t0.job_name, t0.starting_minute)
	   ,idx						= row_number() OVER (PARTITION BY t0.job_name ORDER BY t0.CntOfStartSameHour DESC, t0.starting_minute)


	FROM
		cteJobStats t0
)
SELECT
	t0.job_name
   ,t0.step_id
   ,t0.step_name
   ,t0.str_start_time
   ,t0.str_duration
   ,t0.start_time
   ,t0.duration
   ,t0.starting_minute
   ,t0.CntOfExecution
   ,t0.CntOfStartSameHour
   ,t0.AverageDuration
   ,t0.idx

   ,ceiling(t0.starting_minute/60.00)
   ,ceiling(t0.AverageDuration/60.00)

FROM
	cteJobStatsEx t0
WHERE 1=1
	AND t0.idx = 1
	
ORDER BY 
	t0.job_name