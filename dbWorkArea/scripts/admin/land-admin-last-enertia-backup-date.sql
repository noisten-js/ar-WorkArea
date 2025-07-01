-- Not production worthy only for spot analysis. 
-- Future state, use backup job history and get backup details 
-- using RESTORE FILELISTONLY and RESTORE HEADERONLY
-- to avoid naming issues and backupsets with multiple backups
-- contained within

USE msdb

;WITH cteBase AS (
	SELECT
		 t0.restore_history_id
		,t0.restore_date
		,t1.backup_set_id
		,t1.name
		,dtStr = replace(t1.name, 'EnertiaLive_backup_', '')
		,idx = row_number() OVER (ORDER BY t0.restore_history_id desc)
	FROM
		dbo.restorehistory t0

		INNER JOIN dbo.backupset t1
			ON t0.backup_set_id = t1.backup_set_id

	WHERE 1=1
		AND t0.destination_database_name = 'EnertiaLive'
)

SELECT
	*
	,bu_year	= left(t0.dtStr, 4)
	,bu_month	= substring(t0.dtStr, 6, 2)
	,bu_day		= substring(t0.dtStr, 9, 2)
	,bu_hour	= substring(t0.dtStr, 12, 2)
	,bu_min		= substring(t0.dtStr, 14, 2)
	,bu_sec		= substring(t0.dtStr, 16, 2)
	,bu_fs		= substring(t0.dtStr, 19, 2147483647)

	,try_convert(DATETIME2, concat(
		 left(t0.dtStr, 4)
		,'-', substring(t0.dtStr, 6, 2)
		,'-', substring(t0.dtStr, 9, 2)
		,' ', substring(t0.dtStr, 12, 2)
		,':', substring(t0.dtStr, 14, 2)
		,':', substring(t0.dtStr, 16, 2)
		,'.', substring(t0.dtStr, 19, 2147483647)
	 ))
FROM
	cteBase t0
WHERE 1=1
	AND t0.idx = 1
ORDER BY 
	restore_history_id desc