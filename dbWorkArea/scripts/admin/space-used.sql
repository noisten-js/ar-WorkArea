USE master
SET NOCOUNT ON

------------------------------------------------------------------------------------
-- Variable declaration
------------------------------------------------------------------------------------
	DECLARE 
		 @SQL	VARCHAR(MAX)

------------------------------------------------------------------------------------
-- Initialize temp table, #LogSpace
------------------------------------------------------------------------------------
	PRINT concat(sysdatetime(), ' | INFO | Intialize temp table, #LogSpace')
	
	IF NOT(object_id(N'tempdb.dbo.#LogSpace') IS NULL)
		DROP TABLE #LogSpace

	CREATE TABLE #LogSpace (
		 DBName			VARCHAR(128)			NOT NULL
		,TLogSz			NUMERIC(38, 8)			NOT NULL
		,LogPctUsed		NUMERIC(38, 8)			NOT NULL
		,Status			INT						NOT NULL
	)

	--------------------------------------------------------------------------------
	-- Get log space data (DBCC SQLPERF(LOGSPACE))
	--------------------------------------------------------------------------------
		PRINT concat(sysdatetime(), ' | INFO | Get log sapce data (DBCC SQLPERF(LOGSPACE))')
		INSERT INTO 
			#LogSpace 
		EXEC('DBCC SQLPERF(LOGSPACE)')

------------------------------------------------------------------------------------
-- Initialize temp table, #DBSize
------------------------------------------------------------------------------------
	PRINT concat(sysdatetime(), ' | INFO | Initialize temp table, #DBSize')
	IF NOT(object_id(N'tempdb.dbo.#DBSize') IS NULL)
		DROP TABLE #DBSize

	CREATE TABLE #DBSize (
		 RowId			INT IDENTITY(1,1)		NOT NULL		PRIMARY KEY CLUSTERED
		,DBName			VARCHAR(128)			NOT NULL
		,DatabaseSz		NUMERIC(38, 8)			NOT NULL
		,TLogSz			NUMERIC(38, 8)			NOT NULL
		,DataRows		BIGINT					NOT NULL
		,ReservedSz		NUMERIC(38, 8)			NOT NULL
		,DataSz			NUMERIC(38, 8)			NOT NULL
		,IndexSz		NUMERIC(38, 8)			NOT NULL
		,UsedSz			NUMERIC(38, 8)			NOT NULL
	)

------------------------------------------------------------------------------------
-- Build sql statment to query size stats from each database in sys.databases
------------------------------------------------------------------------------------
	PRINT concat(sysdatetime(), ' | INFO | Build sql statment to query size stats from each database in sys.databases')
	SELECT
		@SQL = coalesce(@SQL, '') + concat(
			 ' PRINT concat(sysdatetime(), '' | INFO | Load size statistics from ',quotename(name),''')'
			,' ;WITH ctePageData AS ('
			, '	SELECT'
			, '		 reservedpages			= sum(reserved_page_count)'
			, '		,usedpages				= sum(used_page_count)'
			, '		,pages					= sum('
			, '									CASE'
			, '										WHEN index_id < 2 THEN (in_row_data_page_count + lob_used_page_count + row_overflow_used_page_count)'
			, '										ELSE lob_used_page_count + row_overflow_used_page_count'
			, '									END'
			, '								 )'
			, '		,[rowcount]				= sum('
			, '									CASE'
			, '										WHEN index_id < 2 THEN row_count'
			, '										ELSE 0'
			, '									END'
			, '								   )'
			, '	FROM'
			, '		',quotename(name),'.sys.dm_db_partition_stats WITH (NOLOCK)'
			, ' )'
			,' INSERT INTO #DBSize ('
			,'	 DBName'
			,'	,DatabaseSz'
			,'	,TLogSz'
			,'	,DataRows'
			,'	,ReservedSz'
			,'	,DataSz'
			,'	,IndexSz'
			,'	,UsedSz'
			,' )'
			,' SELECT'
			,'	 db_name			= ''',name,''''
			,'	,DatabaseSz		= ('
			,'							SELECT'
			,'								sum(try_convert(BIGINT, size)) * 8'
			,'							FROM'
			,'								',quotename(name),'.sys.database_files'
			,'							WHERE 1=1'
			,'								AND type = 0'
			,'						  )'
			,'	,TLogSz			= ('
			,'							SELECT'
			,'								sum(size) * 8'
			,'							FROM'
			,'								',quotename(name),'.sys.database_files'
			,'							WHERE 1=1'
			,'								AND type = 1'
			,'						  )'
			,'	,DataRows			= [rowcount]'
			,'	,ReservedSz		= reservedpages * 8'
			,'	,DataSz			= pages * 8'
			,'	,IndexSz			= CASE'
			,'							WHEN usedpages > pages THEN (usedpages - pages) * 8'
			,'							ELSE 0'
			,'						  END'
			,'	,UsedSz			= (pages * 8) + (CASE WHEN usedpages > pages THEN (usedpages - pages) * 8 ELSE 0 END)'
			,' FROM'
			,'	ctePageData'
	)
	FROM 
		sys.databases
	WHERE 1=1
		AND state = 0
	ORDER BY
		name

------------------------------------------------------------------------------------
-- Execute @SQL
------------------------------------------------------------------------------------
	PRINT concat(sysdatetime(), ' | INFO | Execute SQL')
	EXEC(@SQL)

------------------------------------------------------------------------------------
-- Display results from #DBSize and #LogSpace
------------------------------------------------------------------------------------
	SELECT
		 DBName				= t0.DBName
		,Recovery			= databasepropertyex(t0.DBName, 'Recovery')
		,DatabaseMB			= format(t0.DatabaseSz / 1024.00,'N6')
		,TLogMB				= format(t0.TLogSz / 1024.00,'N6')
		,DataRows			= format(t0.DataRows,'N0')
		,ReservedMB			= format(t0.ReservedSz / 1024.00,'N6')
		,DataMB				= format(t0.DataSz / 1024.00,'N6')
		,IndexMB			= format(t0.IndexSz / 1024.00,'N6')
		,UsedMB				= format(t0.UsedSz / 1024.00,'N6')
		,UnusedMB			= format((t0.DatabaseSz-t0.UsedSz) / 1024.00,'N6')
		,LogToDBRatio		= format(convert(NUMERIC(15,2), ((t0.TLogSz / t0.DatabaseSz) * 100)), 'N3')
		,DBPctFree			= format(convert(NUMERIC(15,2), ((t0.DatabaseSz-t0.UsedSz) / t0.DatabaseSz) * 100), 'N3')
		,LogPctFree			= format(100-t1.LogPctUsed, 'N8')
	FROM
		#DBSize	t0

		INNER JOIN #LogSpace t1
			ON t0.DBName = t1.DBName
	ORDER BY
		 t0.DBName
