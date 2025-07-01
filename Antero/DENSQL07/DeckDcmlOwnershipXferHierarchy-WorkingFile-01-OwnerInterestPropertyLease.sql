DROP TABLE IF EXISTS enertia.OwnerInterestPropertyLease

CREATE TABLE enertia.OwnerInterestPropertyLease (
	 [Owner ID]		CHAR(20)	NOT NULL
	,[Lease ID]		INT			NOT NULL
	,[Type Int]		CHAR(5)		NOT NULL
	,[Well Number]	CHAR(20)	NOT NULL

	,CONSTRAINT PK_enertia_OwnershipInterestPropertyLease_column
	 	PRIMARY KEY CLUSTERED (
	 		 [Owner ID]
			,[Well Number]
			,[Lease ID]
			,[Type Int]
	 	)

)
;WITH cteOwnerInterestPropertyLease AS (
	SELECT
		 [Owner ID]		= try_convert(CHAR(20), [Owner ID])
		,[Lease ID]		= try_convert(INT, coalesce([Lease ID], [Excalibur Lease #]))
		,[Type Int]		= try_convert(CHAR(5), [Type Int])
		,[Well Number]	= try_convert(CHAR(20), try_convert(NUMERIC(19, 1), [Well Number]))
	FROM
		steptoe.Ownership_Detail_New
	WHERE 1=1
		AND [Owner ID] IS NOT NULL
		AND (
			[Lease ID] IS NOT NULL
			OR [Excalibur Lease #] IS NOT NULL
		)
		AND [Type Int] IS NOT NULL
		AND [Well Number] IS NOT NULL
		AND Active = 'Yes'
	
	UNION

	SELECT
		 [Owner ID]		= try_convert(CHAR(20), [Owner ID])
		,[Lease ID]		= try_convert(INT, coalesce([Lease ID], [Excalibur Lease #]))
		,[Type Int]		= try_convert(CHAR(5), [Type Int])
		,[Well Number]	= try_convert(CHAR(20), try_convert(NUMERIC(19, 1), [Well Number]))
	FROM
		steptoe.[Ownership Detail Automation]
	WHERE 1=1
		AND [Owner ID] IS NOT NULL
		AND (
			[Lease ID] IS NOT NULL
			OR [Excalibur Lease #] IS NOT NULL
		)
		AND [Type Int] IS NOT NULL
		AND [Well Number] IS NOT NULL
		AND Active = 'Yes'
)

INSERT INTO enertia.OwnerInterestPropertyLease (
	 [Owner ID]
	,[Lease ID]
	,[Type Int]
	,[Well Number]
)
SELECT
	 [Owner ID]
	,[Lease ID]
	,[Type Int]
	,[Well Number]
FROM
	cteOwnerInterestPropertyLease t0
WHERE 1=1
	AND t0.[Owner ID] IS NOT NULL
	AND [Lease ID] IS NOT NULL
	AND [Type Int] IS NOT NULL
	AND [Well Number] IS NOT NULL