/*----------------------------------------------------------------------------------
	This query provides a list of all database tables in the EDW and EDW_Stage 
	databases that are referenced by one or more reports (dxp's) that have been
	accessed within the last % months.

	This can be used as a list of objects that need to have their lineage analyzed.
	This data doesn't differentiate between access types. It means that some of 
	the reports listed aren't really active, they are simply accessed by the 
	scheduling module or some have only been accessed by developers or other IT 
	staff and not by an interested business user. 
----------------------------------------------------------------------------------*/
	USE spotfire_server

	;WITH cteActiveReports AS (
		SELECT
			 t0.ITEM_ID
			,t1.LABEL
			,t0.TITLE
			,t0.DESCRIPTION
			,t0.ITEM_TYPE
			,t0.FORMAT_VERSION
			,t0.ACCESSED
		FROM
			dbo.LIB_ITEMS t0

			INNER JOIN dbo.LIB_ITEM_TYPES t1
				ON t0.ITEM_TYPE = t1.TYPE_ID
				AND t1.LABEL = 'dxp'

		WHERE 1=1
	)
	,cteBase AS (
		SELECT
			 ReportId			= t0.ITEM_ID
			,ReportName			= t0.TITLE
			,ReportDesc			= t0.DESCRIPTION
			,LastAccessed		= t0.ACCESSED
			,ElementName		= t4.TITLE
			,PropertyName		= t3.PROPERTY_NAME
			,PropertyValue		= t3.PROPERTY_VALUE
		FROM
			-- dxp analysis
			cteActiveReports t0

			-- dxp next level is always a data source/query
			INNER JOIN dbo.LIB_RESOLVED_DEPEND t1
				ON t0.ITEM_ID = t1.DEPENDENT_ID

			-- this is the column/element level and always has database and object level info
			INNER JOIN dbo.LIB_RESOLVED_DEPEND t2
				ON t1.REQUIRED_ID = t2.DEPENDENT_ID

			INNER JOIN dbo.LIB_PROPERTIES t3
				ON t2.REQUIRED_ID = t3.ITEM_ID
				AND t3.PROPERTY_NAME IN ('catalog', 'schema', 'table', 'column')

			INNER JOIN dbo.LIB_ITEMS t4
				ON t2.REQUIRED_ID = t4.ITEM_ID
	)
	,ctePivot AS (
		SELECT
			 ReportId
			,ReportName
			,ReportDesc
			,ElementName
			,LastAccessed
			,DatabaseName		= [catalog]
			,SchemaName			= [schema]
			,ObjectName			= [table]
			,ColumnName			= [column]
		FROM
			(
				SELECT
					 ReportId
					,ReportName
					,ReportDesc
					,ElementName
					,LastAccessed
					,PropertyName
					,PropertyValue
				FROM
					cteBase
			) AS src

			PIVOT (
				max(PropertyValue) FOR PropertyName IN (
					 [catalog]
					,[schema]
					,[table]
					,[column]
				)
			) AS pvt
	)

	SELECT
		 t0.ReportId
		,t0.ReportName
		,t0.ReportDesc
		,t0.LastAccessed
		--,t0.DatabaseName
		--,t0.SchemaName
		--,t0.ObjectName
		--,t0.ColumnName
	FROM
		ctePivot t0
	WHERE 1=1 
		--AND t0.LastAccessed >= dateadd(MONTH, -3, sysdatetime())
		AND t0.SchemaName = 'enertia'
		AND t0.ObjectName IN (
			 'Enertia_Deducts'
			,'Enertia_Deducts'
			,'Enertia_Revenue_Picklist_Table'
			,'Enertia_Revenue_Picklist_Table'
			,'Revenue_Inquiry_Owner_Property_Summary_Table'
			,'Revenue_Inquiry_Owner_Property_Summary_Table'
			,'Revenue_Statistics_Detail_Table'
			,'Revenue_Statistics_Detail_Table'
			,'Revenue_Statistics_Summary_Monthly_Table'
			,'Revenue_Statistics_Summary_Monthly_Table'
			,'Revenue_Statistics_Summary_Table'
			,'Revenue_Statistics_Summary_Table'
			,'Revenue_Statistics_Summary_With_State_And_Property_Table'
			,'Revenue_Statistics_Summary_With_State_And_Property_Table'
			,'Suspense_Statistics_Detail_Table'
			,'Suspense_Statistics_Detail_Table'
			,'Suspense_Statistics_Summary_All_Suspense_With_Date_State_Property_03162022_Table'
			,'Suspense_Statistics_Summary_All_Suspense_With_Date_State_Property_03162022_Table'
			,'Suspense_Statistics_Summary_All_Suspense_With_Year_State_Property_03182022_Table'
			,'Suspense_Statistics_Summary_All_Suspense_With_Year_State_Property_03182022_Table'
		)
	GROUP BY 
		 t0.ReportId
		,t0.ReportName
		,t0.ReportDesc
		,t0.LastAccessed
		--,t0.DatabaseName
		--,t0.SchemaName
		--,t0.ObjectName
	ORDER BY 
		 t0.ReportName
		--,t0.DatabaseName
		--,t0.SchemaName
		--,t0.ObjectName
		--,t0.ColumnName

