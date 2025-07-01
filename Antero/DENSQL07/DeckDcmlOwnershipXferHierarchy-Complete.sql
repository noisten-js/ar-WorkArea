SET NOCOUNT ON
SET XACT_ABORT ON

------------------------------------------------------------------------------------
-- Initialize #DeckDcmlOwnershipXfer
------------------------------------------------------------------------------------
	PRINT concat(sysdatetime(), ' | INFO | Initialize #DeckDcmlOwnershipXfer')

	DROP TABLE IF EXISTS #DeckDcmlOwnershipXfer
	CREATE TABLE #DeckDcmlOwnershipXfer (
		 IsRoot			BIT				NOT NULL
		,DcmlFromTID	INT				NOT NULL
		,DcmlToTID		INT				NOT NULL
		,DcmlDeckCode	CHAR(10)		NOT NULL
		,XferDate		SMALLDATETIME	NOT NULL

		,PRIMARY KEY CLUSTERED (
			 DcmlDeckCode
			,DcmlFromTID
			,DcmlToTID
		 )

		,INDEX idx_tempdb_DeckDcmlOwnershipXfer_IsRoot
		 	NONCLUSTERED (
		 		IsRoot
		 	)
	)

------------------------------------------------------------------------------------
-- Populate #DeckDcmlOwnershipXfer
------------------------------------------------------------------------------------
	PRINT concat(sysdatetime(), ' | INFO | Populate #DeckDcmlOwnershipXfer')

	;WITH cteBase AS (
		SELECT
			 t0.DcmlFromTID
			,t0.DcmlToTID
			,t2.DcmlDeckCode
			,t1.XferDate
		FROM 
			EnertiaLive.dbo.rvMasXferXref t0
	
			INNER JOIN EnertiaLive.dbo.aaMasXferNote t1
				ON t0.XferNoteTID = t1.XferNoteTID
	
			INNER JOIN EnertiaLive.dbo.rvMasDeckDcml t2
				ON t0.DcmlFromTID = t2.DcmlTID
	
			INNER JOIN EnertiaLive.dbo.rvMasDeckDcml t3
				ON t0.DcmlToTID = t3.DcmlTID
	
		WHERE 1=1
			AND t2.DcmlOwnHID != t3.DcmlOwnHID
			AND t0.XferType = 'X'
	)
	INSERT INTO 
		#DeckDcmlOwnershipXfer (
			 IsRoot
			,DcmlFromTID
			,DcmlToTID
			,DcmlDeckCode
			,XferDate
		)
		SELECT
			 IsRoot				= CASE WHEN t1.DcmlFromTID IS NULL THEN 1 ELSE 0 END
			,DcmlFromTID		= t0.DcmlFromTID
			,DcmlToTID			= t0.DcmlToTID
			,DcmlDeckCode		= t0.DcmlDeckCode
			,XferDate			= t0.XferDate	
		FROM
			cteBase t0
			
			LEFT OUTER JOIN cteBase t1
				ON t0.DcmlFromTID = t1.DcmlToTID

	PRINT concat(sysdatetime(), ' | INFO | Populate #DeckDcmlOwnershipXfer [ ', @@rowcount, ' ]')

------------------------------------------------------------------------------------
-- Return the hierarchy data
------------------------------------------------------------------------------------
	;WITH cteDeckOwnershipHierarchy AS (
		SELECT
			 DcmlFromTID	= t0.DcmlFromTID
			,DcmlToTID		= t0.DcmlToTID
			,DcmlDeckCode	= t0.DcmlDeckCode
			,XferDate		= t0.XferDate
			,OwnershipPath	= convert(VARCHAR(4096), concat(t0.DcmlFromTID,'\', t0.DcmlToTID))
		FROM
			#DeckDcmlOwnershipXfer t0
		WHERE 1=1
			AND t0.IsRoot = 1

		UNION ALL
    
		SELECT
			 DcmlFromTID	= t0.DcmlFromTID
			,DcmlToTID		= t0.DcmlToTID
			,DcmlDeckCode	= t0.DcmlDeckCode
			,XferDate		= t0.XferDate
			,OwnershipPath = convert(VARCHAR(4096), concat(t1.OwnershipPath, '\', t0.DcmlToTID))
		FROM
			#DeckDcmlOwnershipXfer t0

			INNER JOIN cteDeckOwnershipHierarchy t1
				ON t0.DcmlFromTID = t1.DcmlToTID

		WHERE 1=1
			AND t0.IsRoot = 0
	)
	SELECT 
		 DcmlTID		= t0.DcmlTID
		,XferDate		= t1.XferDate
		,OwnershipPath	= coalesce(t1.OwnershipPath, try_convert(VARCHAR(4096), t0.DcmlTID))
	FROM
		EnertiaLive.dbo.rvMasDeckDcml t0

		LEFT OUTER JOIN cteDeckOwnershipHierarchy t1
			ON t0.DcmlTID = t1.DcmlToTID

	ORDER BY 
		 t1.DcmlDeckCode
		,t1.XferDate


-- DcmlHierarchy (complete)
-- DcmlProperty
-- DcmlProperty+Lease??