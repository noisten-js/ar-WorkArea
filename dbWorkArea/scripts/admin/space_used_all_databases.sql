USE [master]
SET NOCOUNT ON

---------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Variable declaration
---------------------------------------------------------------------------------------------------------------------------------------------------------------
	DECLARE 
		@SQL VARCHAR(max)

---------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Initialize temp table, #LogSpace
---------------------------------------------------------------------------------------------------------------------------------------------------------------
	IF NOT(object_id(N'tempdb.dbo.#LogSpace') IS NULL)
		DROP TABLE [#LogSpace]
		
	CREATE TABLE [#LogSpace] (
		 [DBName]			NVARCHAR(128)			NOT NULL
		,[TLogSz]			NUMERIC(15,3)			NOT NULL
		,[LogPctUsed]		NUMERIC(15,3)			NOT NULL
		,[Status]			INT						NOT NULL
	)

	-----------------------------------------------------------------------------------------------------------------------------------------------------------
	-- Get log space data (DBCC SQLPERF(LOGSPACE))
	-----------------------------------------------------------------------------------------------------------------------------------------------------------
		INSERT INTO 
			[#LogSpace] 
		EXEC('DBCC SQLPERF(LOGSPACE)')

---------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Initialize temp table, #DBSize
---------------------------------------------------------------------------------------------------------------------------------------------------------------
	IF NOT(object_id(N'tempdb.dbo.#DBSize') IS NULL)
		DROP TABLE [#DBSize]

	CREATE TABLE [#DBSize] (
		 [RowId]			INT IDENTITY(1,1)		NOT NULL		PRIMARY KEY CLUSTERED
		,[DBName]			NVARCHAR(128)			NOT NULL
		,[DatabaseSz]		NUMERIC(15,3)			NOT NULL
		,[TLogSz]			NUMERIC(15,3)			NOT NULL
		,[DataRows]			BIGINT					NOT NULL
		,[ReservedSz]		NUMERIC(15,3)			NOT NULL
		,[DataSz]			NUMERIC(15,3)			NOT NULL
		,[IndexSz]			NUMERIC(15,3)			NOT NULL
		,[UsedSz]			NUMERIC(15,3)			NOT NULL
	)

---------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Build sql statment to query size stats from each database in sys.databases
---------------------------------------------------------------------------------------------------------------------------------------------------------------
	SET @SQL = (
		SELECT    ';WITH [ctePageData] AS ('
				+ '	SELECT '
				+ '		 [reservedpages]			= sum([reserved_page_count])'
				+ '		,[usedpages]				= sum([used_page_count])'
				+ '		,[pages]					= sum('
				+ '										CASE'
				+ '											WHEN [index_id] < 2 THEN ([in_row_data_page_count] + [lob_used_page_count] + [row_overflow_used_page_count])'
				+ '											ELSE [lob_used_page_count] + [row_overflow_used_page_count]'
				+ '										END'
				+ '									  )'
				+ '		,[rowcount]					= sum('
				+ '										CASE'
				+ '											WHEN [index_id] < 2 THEN [row_count]'
				+ '											ELSE 0'
				+ '										END'
				+ '									   )'
				+ '	FROM'
				+ '		['+[name]+'].[sys].[dm_db_partition_stats]'
				+ ')'
				+ 'SELECT'
				+ '	 [db_name]			= '''+[name]+''''
				+ '	,[DatabaseSz]		= ('
				+ '							SELECT'
				+ '								sum([size]) * 8'
				+ '							FROM'
				+ '								['+[name]+'].[sys].[database_files]'
				+ '							WHERE 1=1'
				+ '								AND [type] = 0'
				+ '						  )'
				+ '	,[TLogSz]			= ('
				+ '							SELECT'
				+ '								sum(size) * 8'
				+ '							FROM'
				+ '								['+[name]+'].[sys].[database_files]'
				+ '							WHERE 1=1'
				+ '								AND [type] = 1'
				+ '						  )'
				+ '	,[DataRows]			= [rowcount]'
				+ '	,[ReservedSz]		= reservedpages * 8'
				+ '	,[DataSz]			= pages * 8'
				+ '	,[IndexSz]			= CASE'
				+ '							WHEN [usedpages] > [pages] THEN ([usedpages] - [pages]) * 8'
				+ '							ELSE 0'
				+ '						  END'
				+ '	,[UsedSz]			= ([pages] * 8) + (CASE WHEN [usedpages] > [pages] THEN ([usedpages] - [pages]) * 8 ELSE 0 END)'
				+ 'FROM'
				+ '	[ctePageData]'
		FROM 
			[sys].[databases]
		WHERE 1=1
			AND [state] = 0
		ORDER BY
			[name]
		FOR XML PATH('')
	)

	-----------------------------------------------------------------------------------------------------------------------------------------------------------
	-- handle special chars reserved for xml used in dynamic query (<, >, &)
	-----------------------------------------------------------------------------------------------------------------------------------------------------------
		SET @SQL = replace(replace(replace(@SQL,'&lt;','<'),'&gt;','>'),'&amp;','&')
		PRINT @SQL
		
---------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Insert results of dynamic query into #DBSize
---------------------------------------------------------------------------------------------------------------------------------------------------------------
	INSERT INTO #DBSize (
		 [DBName]
		,[DatabaseSz]
		,[TLogSz]
		,[DataRows]
		,[ReservedSz]
		,[DataSz]
		,[IndexSz]
		,[UsedSz]
	)
		EXEC (@SQL)

---------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Display results from #DBSize and #LogSpace
---------------------------------------------------------------------------------------------------------------------------------------------------------------
	SELECT
		 [DBName]		= [t1].[DBName]
		,[Recovery]		= databasepropertyex([t1].[DBName], 'Recovery')
		,[DatabaseMB]	= [t1].[DatabaseSz] / 1024.00
		,[TLogMB]		= [t1].[TLogSz] / 1024.00
		,[DataRows]		= [t1].[DataRows]
		,[ReservedMB]	= [t1].[ReservedSz] / 1024.00
		,[DataMB]		= [t1].[DataSz] / 1024.00
		,[IndexMB]		= [t1].[IndexSz] / 1024.00
		,[UsedMB]		= [t1].[UsedSz] / 1024.00
		,[UnusedMB]		= ([t1].[DatabaseSz]-[t1].[UsedSz]) / 1024.00
		,[LogToDBRatio] = cast((([t1].[TLogSz] / [t1].[DatabaseSz]) * 100) AS NUMERIC(15, 2))
		,[DBPctFree]	= cast((([t1].[DatabaseSz]-[t1].[UsedSz]) / [t1].[DatabaseSz]) * 100 AS NUMERIC(15, 2))
		,[LogPctFree]	= 100-[t2].[LogPctUsed]
	FROM
		[#DBSize]				[t1]

		INNER JOIN [#LogSpace] [t2]
			ON [t1].[DBName] = [t2].[DBName]

	ORDER BY
		1