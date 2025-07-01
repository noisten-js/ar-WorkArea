DECLARE @sql VARCHAR(MAX)

;WITH cteSrc AS (
	SELECT
		 ObjectSchema	= t0.name
		,ObjectName		= t1.name
		,ColumnName		= t2.name
	FROM
		sys.schemas t0

		INNER JOIN sys.objects t1
			ON t0.schema_id = t1.schema_id

		INNER JOIN sys.columns t2
			ON t1.object_id = t2.object_id
	WHERE 1=1
		AND t0.name = 'enertia'
		AND t1.name IN (
			 'Enertia_Deducts_20250604'
			,'Enertia_Revenue_Picklist_Table_20250604'
			,'Revenue_Inquiry_Legal_20250604'
			,'Revenue_Inquiry_Owner_Property_Summary_Table_20250604'
			,'Revenue_Statistics_Detail_Table_20250604'
			,'Revenue_Statistics_Detail_Table_With_Purchase_Code_20250604'
			,'Revenue_Statistics_Summary_Monthly_Table_20250604'
			,'Revenue_Statistics_Summary_Table_20250604'
			,'Revenue_Statistics_Summary_With_State_And_Property_Table_20250604'
			,'Suspense_Statistics_Detail_Table_20250604'
			,'Suspense_Statistics_Summary_All_Suspense_With_Date_State_Property_03162022_Table_20250604'
			,'Suspense_Statistics_Summary_All_Suspense_With_Year_State_Property_03182022_Table_20250604'			
		)
		AND t2.name NOT IN ('ETL_Load_Date')
)
,cteDst AS (
	SELECT
		 ObjectSchema	= t0.name
		,ObjectName		= t1.name
		,ColumnName		= t2.name
	FROM
		sys.schemas t0

		INNER JOIN sys.objects t1
			ON t0.schema_id = t1.schema_id

		INNER JOIN sys.columns t2
			ON t1.object_id = t2.object_id
	WHERE 1=1
		AND t0.name = 'enertia'
		AND t1.name IN (
			 'Enertia_Deducts'
			,'Enertia_Revenue_Picklist_Table'
			,'Revenue_Inquiry_Legal'
			,'Revenue_Inquiry_Owner_Property_Summary_Table'
			,'Revenue_Statistics_Detail_Table'
			,'Revenue_Statistics_Detail_Table_With_Purchase_Code'
			,'Revenue_Statistics_Summary_Monthly_Table'
			,'Revenue_Statistics_Summary_Table'
			,'Revenue_Statistics_Summary_With_State_And_Property_Table'
			,'Suspense_Statistics_Detail_Table'
			,'Suspense_Statistics_Summary_All_Suspense_With_Date_State_Property_03162022_Table'
			,'Suspense_Statistics_Summary_All_Suspense_With_Year_State_Property_03182022_Table'			
		)
		AND t2.name NOT IN ('ETL_Load_Date', 'Source', 'OwnPmtStatCode')
)
,cteBase AS (
	SELECT
		 ObjectSchema
		,ObjectName
		,ColumnName
	FROM
		cteDst

	INTERSECT

	SELECT
		 ObjectSchema
		,ObjectName		= replace(cteSrc.ObjectName, '_20250604', '')
		,ColumnName
	FROM
		cteSrc
)
,cteColumns AS (
	SELECT
		 ObjectSchema
		,ObjectName
		,string_agg(quotename(cteBase.ColumnName), ',') WITHIN GROUP (ORDER BY cteBase.ColumnName) ColumnList
	FROM
		cteBase
	GROUP BY 
		 cteBase.ObjectSchema
		,cteBase.ObjectName
)

SELECT
	 @sql = coalesce(@sql, '') + concat(
		 '	--------------------------------------------------------------------------------', char(10)
		,'	-- Validate ', t0.ObjectSchema, '.', t0.ObjectName, char(10)
		,'	--------------------------------------------------------------------------------', char(10)
		,'		SET @ErrPos = concat(@MsgTitle, ''; Validate ', t0.ObjectSchema, '.', t0.ObjectName, ''')', char(10)
		,'		PRINT concat(sysdatetime(), '' | INFO | '', @ErrPos)', char(10), char(10)

		,'		----------------------------------------------------------------------------', char(10)
		,'		-- Additions/Modifications', char(10)
		,'		----------------------------------------------------------------------------', char(10)
		,'			SET @ErrPos = concat(@MsgTitle, ''; '', @ErrPos, '' (Additions/Modifications)'')', char(10)
		,'			PRINT concat(sysdatetime(), '' | INFO | '' , @ErrPos)', char(10), char(10)

		,'			INSERT INTO enertia.jsDenSql07Validation (', char(10)
		,'				 Category', char(10)
		,'				,TableName', char(10)
		,'				,ValidationErrors', char(10)
		,'			)', char(10)
	)+concat(
		 '			SELECT ''Additions/Modifications'',''', t0.ObjectSchema, '.', t0.ObjectName, ''', count(*) FROM (', char(10)
		,'				SELECT ', t0.ColumnList, ' FROM ', t0.ObjectSchema, '.', t0.ObjectName, char(10)
		,'				EXCEPT', char(10)
		,'				SELECT ', t0.ColumnList, ' FROM ', t0.ObjectSchema, '.', t0.ObjectName, '_20250604', char(10)
		,'			) SQ', char(10), char(10)

		,'			SET @ErrPos += concat('' [ '', @@rowcount, '' ]'')', char(10)
		,'			PRINT concat(sysdatetime(), '' | INFO | ''+@ErrPos)', char(10),char(10)

		,'		----------------------------------------------------------------------------', char(10)
		,'		-- Missing/Modifications', char(10)
		,'		----------------------------------------------------------------------------', char(10)
		,'			SET @ErrPos = concat(@MsgTitle, ''; '', @ErrPos, '' (Missing/Modifications)'')', char(10)
		,'			PRINT concat(sysdatetime(), '' | INFO | '' , @ErrPos)', char(10), char(10)

		,'			INSERT INTO enertia.jsDenSql07Validation (', char(10)
		,'				 Category', char(10)
		,'				,TableName', char(10)
		,'				,ValidationErrors', char(10)
		,'			)', char(10)
	)+concat(
		 '			SELECT ''Missing/Modifications'',''', t0.ObjectSchema, '.', t0.ObjectName, ''', count(*) FROM (', char(10)
		,'				SELECT ', t0.ColumnList, ' FROM ', t0.ObjectSchema, '.', t0.ObjectName, '_20250604', char(10)
		,'				EXCEPT', char(10)
		,'				SELECT ', t0.ColumnList, ' FROM ', t0.ObjectSchema, '.', t0.ObjectName, char(10)
		,'			) SQ', char(10), char(10)

		,'			SET @ErrPos += concat('' [ '', @@rowcount, '' ]'')', char(10)
		,'			PRINT concat(sysdatetime(), '' | INFO | ''+@ErrPos)', char(10),char(10)
		,'GO',char(10)
	)
FROM
	cteColumns t0

SELECT @sql FOR XML PATH('')