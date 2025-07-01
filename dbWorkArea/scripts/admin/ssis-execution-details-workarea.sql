USE SSISDB
GO

DECLARE 
	 @executionIdFilter		BIGINT			= NULL
	,@PackageName			VARCHAR(128)	= NULL

;WITH ctePRE AS (
	SELECT 
		 em.event_message_id
		,em.operation_id
		,em.message_time
		,em.message_type
		,em.message_source_type
		,em.message
		,em.extended_info_id
		,em.package_name
		,em.event_name
		,em.message_source_name
		,em.message_source_id
		,em.subcomponent_name
		,em.package_path
		,em.execution_path
		,em.threadID
		,em.message_code
	FROM 
		catalog.event_messages em
	WHERE 1=1
		AND em.event_name IN ('OnPreExecute')
		AND (
			em.message_source_name = @PackageName
			OR @PackageName IS NULL
		)
)
,ctePOST AS (
	SELECT 
		 em.event_message_id
		,em.operation_id
		,em.message_time
		,em.message_type
		,em.message_source_type
		,em.message
		,em.extended_info_id
		,em.package_name
		,em.event_name
		,em.message_source_name
		,em.message_source_id
		,em.subcomponent_name
		,em.package_path
		,em.execution_path
		,em.threadID
		,em.message_code 
	FROM 
		catalog.event_messages em 
	WHERE 
		em.event_name IN ('OnPostExecute')
		AND (
			em.message_source_name = @PackageName
			OR @PackageName IS NULL
		)
)

SELECT
	 b.operation_id
	,b.event_message_id
	,b.package_path
	,b.message_source_name
	,pre_message_time		= b.message_time
	,post_message_time		= e.message_time
	,duration_minutes		= datediff(mi, b.message_time, e.message_time)
FROM
	ctePRE b

	LEFT OUTER JOIN ctePOST e 
		ON b.operation_id = e.operation_id 
		AND b.package_name = e.package_name 
		AND b.message_source_id = e.message_source_id
WHERE 1=1
	AND (
		b.operation_id = @executionIdFilter
		OR @executionIdFilter IS NULL
	)
	AND b.package_path = '\Package'

ORDER BY
	b.event_message_id desc

;WITH cte AS (
	SELECT
		 event_message_id
		,operation_id
		,message_time
		,message_type
		,message_source_type
		,message
		,extended_info_id
		,package_name
		,event_name
		,message_source_name
		,message_source_id
		,subcomponent_name
		,package_path
		,execution_path
		,threadID
		,message_code 
		,token_destination_name_start	= charindex(': "', [message]) + 3
		,token_destination_name_end		= charindex('" wrote', [message])
		,token_rows_start				= len([message]) - charindex('e', reverse([message]), 1) + 3
		,token_rows_end					= len([message]) - charindex('r', reverse([message]), 1)
	FROM
		[catalog].[event_messages] 
	WHERE 1=1
		AND (
			operation_id = @executionIdFilter
			OR @executionIdFilter IS NULL
		)
		AND (
			message_source_name = @PackageName
			OR @PackageName IS NULL
		)
)
SELECT
	 operation_id
	,event_message_id
	,package_name
	,message_source_name
	,message_time
	,TableName				= parsename(replace(execution_path, '\', '.'), 2)
	,loaded_rows			= substring([message], token_rows_start, token_rows_end - token_rows_start)
FROM 
	cte c 
WHERE 1=1
	AND subcomponent_name = 'SSIS.Pipeline' 
	AND [message] like '%rows.%'
	AND (
		c.operation_id = @executionIdFilter
		OR @executionIdFilter IS NULL
	)
	AND (
		[message] like '%Load Incremental Data To Target%'  
		OR parsename(replace(execution_path, '\', '.'), 2) = 'Enertia_glMasDtlPostTxn'
	)

ORDER BY 
	event_message_id DESC


SELECT 
    ex.execution_id,
    ex.package_name,
    ex.start_time,
    ex.end_time,
    em.message_source_name,
    em.message
	,charindex('wrote ', em.message)+6
	,charindex('rows.', em.message)
FROM 
    SSISDB.catalog.executions AS ex
INNER JOIN 
    SSISDB.catalog.event_messages AS em
ON 
    ex.execution_id = em.operation_id
WHERE 
    em.message LIKE '%wrote % rows.%'
ORDER BY 
    ex.start_time DESC;

SELECT
	*
FROM
	internal.execution_component_phases