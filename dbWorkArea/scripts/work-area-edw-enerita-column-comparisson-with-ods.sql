-- Enertia to EDW Column Comparison
USE EDW_Stage
DROP TABLE IF EXISTS #Test

;WITH cteOdsObjects AS (
	SELECT
		 ObjectId	
		,SchemaName	
		,TableName	
	FROM
		openquery(LINKSERV_SQLODS_SPOTFIRE_USER, '
			SELECT 
				 ObjectId		= t1.object_id
				,SchemaName		= t0.name
				,TableName		= t1.name
			FROM 
				EnertiaLive.sys.schemas t0
				INNER JOIN EnertiaLive.sys.objects t1
					ON t0.schema_id = t1.schema_id
			WHERE 
				t1.type = ''U''
		')
)
,cteEdwObjects AS (
	SELECT
		 ObjectId			= t1.object_id
		,SchemaName			= t0.name
		,TableName			= t1.name
		,ComparisonName		= CASE t1.name
								WHEN 'Enertia_aaTxnActionDtl' THEN 'apTxnActionDtl'
								ELSE substring(t1.name,9,2147483647)
							  END
	FROM
		sys.schemas t0

		INNER JOIN sys.objects t1
			ON t0.schema_id = t1.schema_id

	WHERE 1=1
		AND t0.name = 'Stage'
		AND t1.name LIKE 'Enertia\_%' ESCAPE '\'
)
,cteOdsColumns AS (
	SELECT
		 ObjectId		
		,ColumnName		
		,DataType		
		,Length			
		,Precision		
		,Scale	
		,IsNullable
	FROM
		openquery(LINKSERV_SQLODS_SPOTFIRE_USER, '
			SELECT
				 ObjectId		= t1.object_id
				,ColumnName		= t2.name
				,DataType		= t3.name
				,Length			= CASE 
									WHEN t3.name IN (''NVARCHAR'', ''NCHAR'') AND t2.max_length > -1 THEN t2.max_length / 2
									ELSE t2.max_length
								  END
				,Precision		= t2.Precision
				,Scale			= t2.Scale
				,IsNullable		= t2.is_nullable
			FROM 
				EnertiaLive.sys.schemas t0
			
				INNER JOIN EnertiaLive.sys.objects t1
					ON t0.schema_id = t1.schema_id
				
				INNER JOIN EnertiaLive.sys.columns t2
					ON t1.object_id = t2.object_id

				INNER JOIN EnertiaLive.sys.types t3
					ON t2.system_type_id = t3.system_type_id
					AND t3.system_type_id = t3.user_type_id
			WHERE 1=1
				AND t1.type = ''U''
				AND t2.name NOT IN (
					 ''_rowhash''
					,''_delete''
					,''_error''
					,''_message''
					,''_duplicate''
					,''etl_load_date''
					,''rowhash''
				)
		')
)
,cteEdwColumns AS (
	SELECT
		 ObjectId		= t1.object_id
		,ColumnName		= t2.name
		,DataType		= t3.name
		,Length			= CASE 
							WHEN t3.name IN ('NVARCHAR', 'NCHAR') AND t2.max_length > -1 THEN t2.max_length / 2
							ELSE t2.max_length
							END
		,Precision		= t2.Precision
		,Scale			= t2.Scale
		,IsNullable		= t2.is_nullable
	FROM 
		sys.schemas t0
	
		INNER JOIN sys.objects t1
			ON t0.schema_id = t1.schema_id
		
		INNER JOIN sys.columns t2
			ON t1.object_id = t2.object_id

		INNER JOIN sys.types t3
			ON t2.system_type_id = t3.system_type_id
			AND t3.system_type_id = t3.user_type_id
	WHERE 1=1
		AND t1.type = 'U'
		AND t2.name NOT IN (
			 '_rowhash'
			,'_delete'
			,'_error'
			,'_message'
			,'_duplicate'
			,'etl_load_date'
			,'rowhash'
		)
)
,cteEdwOdsObjectMapping AS (
	SELECT
		 EdwObjectId		= t0.ObjectId
		,EdwSchemaName		= t0.SchemaName
		,EdwTableName		= t0.TableName
	
		,OdsObjectId		= t1.ObjectId
		,OdsSchemaName		= t1.SchemaName
		,OdsTableName		= t1.TableName
	FROM
		cteEdwObjects t0

		INNER JOIN cteOdsObjects t1
			ON t0.ComparisonName = t1.TableName
)

SELECT
	*
FROM
	cteEdwColumns t0

	INNER JOIN cteEdwOdsObjectMapping t1
		ON t0.ObjectId = t1.EdwObjectId

	INNER JOIN cteOdsColumns t2
		ON t1.OdsObjectId = t2.ObjectId
		AND t0.ColumnName = t2.ColumnName

WHERE 1=1
	AND (
		t0.DataType != t2.DataType
		OR t0.Length != t2.Length
		OR t0.Precision != t2.Precision
		OR t0.Scale != t2.Scale
		OR (t2.IsNullable = 1 AND t0.IsNullable = 0)
	)
ORDER BY t1.EdwTableName, t2.ColumnName 


DECLARE @a CHAR(10) = 'A'
DECLARE @b VARCHAR(10) = 'A'
DECLARE @c SMALLDATETIME = '2000-04-01'
DECLARE @d DATETIME = '2000-04-01'

SELECT
	 hashbytes('SHA2_256', concat('|', @a))
	,hashbytes('SHA2_256', concat('|', @b))
	,hashbytes('SHA2_256', concat('|', @c))
	,hashbytes('SHA2_256', concat('|', @d))