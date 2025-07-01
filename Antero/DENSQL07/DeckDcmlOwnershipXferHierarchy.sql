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
	,cteOwnerInterestPropertyLease AS (
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

	SELECT
		 DcmlFromTID	= t0.DcmlFromTID
		,DcmlToTID		= t0.DcmlToTID
		,DcmlDeckCode	= t0.DcmlDeckCode
		,XferDate		= t0.XferDate
		,OwnershipPath	= t0.OwnershipPath

		,t1.DcmlTID
		,t1.DcmlOwnHID
		,t1.DcmlOwnAddrTID
		,t1.DcmlIntCode
		,t1.DcmlOwnDispCode
		,t1.DcmlSuspCode
		,t1.DcmlEffBeg
		,t1.DcmlEffEnd

		,t2.DeckRevPropHID
		,t4.HdrCode
		,t4.HdrName
		,t4.HdrTypeTID

		,t3.HdrCode
		,t3.HdrName
		,t3.HdrTypeTID
		--,t5.value

		,t5.[Lease ID]
	FROM
		cteDeckOwnershipHierarchy t0

		INNER JOIN EnertiaLive.dbo.rvMasDeckDcml t1
			ON t0.DcmlToTID = t1.DcmlTID

		INNER JOIN EnertiaLive.dbo.rvMasDeckProp t2
			ON t1.DcmlDeckCode = t2.DeckCode

		-- Owner Hdr Record
		INNER JOIN EnertiaLive.dbo.fbMasHdr t3
			ON t1.DcmlOwnHID = t3.HdrHID

		-- Property Hdr Record
		INNER JOIN EnertiaLive.dbo.fbMasHdr t4
			ON t2.DeckRevPropHID = t4.HdrHID

		LEFT OUTER JOIN cteOwnerInterestPropertyLease t5
			ON t4.HdrCode = t5.[Well Number]
			AND t4.HdrTypeTID = 400065
			
			AND t3.HdrCode = t5.[Owner ID]
			AND t3.HdrTypeTID = 300005
			
			AND t1.DcmlIntCode = t5.[Type Int]

		--CROSS APPLY string_split(t0.OwnershipPath, '\') t5
	WHERE 1=1
	ORDER BY 
		 t0.DcmlDeckCode
		,t0.XferDate


RETURN

SELECT
	 DcmlFromTID		= t0.DcmlFromTID
	,DcmlToTID			= t0.DcmlToTID
	,DcmlDeckCode		= t0.DcmlDeckCode
	,XferDate			= t0.XferDate
FROM
	#DeckDcmlOwnershipXfer t0
ORDER BY 
	 DcmlDeckCode
	,XferDate
