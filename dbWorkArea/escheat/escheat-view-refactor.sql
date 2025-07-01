--USE Integration
/*******************************************************************
	This query returns the oldest and newest dates that changes 
	made to the aaMasAddress table that were audited. 
 *******************************************************************/
SELECT min(t1.ChgDate), max(t1.ChgDate) FROM 
	EnertiaLive.dbo.aaMasAuditTable t0
	INNER JOIN EnertiaLive.dbo.aaMasAuditChangeHdr t1
		ON t0.AuditTableTID = t1.ChgTableTID
		AND t0.AuditTableName = 'aaMasAddress'
	
SELECT * FROM EnertiaLive.dbo.fbMasHdr WHERE HdrCode = '27972'
SELECT * FROM dbo.rvBalOwnTxn WHERE OwnSuspCode = 'DNUES' AND OwnEschPmtTID IS NULL AND OwnHID = 1022046 
SELECT * FROM dbo.aaMasAddress WHERE AddrEntityHID = 1022046
SELECT
	*
FROM
	EnertiaLive.dbo.aaMasAddress
WHERE
	AddrEntityHID = 1022046

;WITH cteBase AS (
	SELECT 
		 AddrTID			= coalesce(
								 try_convert(XML, t1.RowDetails).value('(/aaMasAddress/NEW/AddrTID)[1]', 'INT')
								,try_convert(XML, t1.RowDetails).value('(/aaMasAddress/OLD/AddrTID)[1]', 'INT')
							  )
		,ChgDate			= t1.ChgDate
		,AddrState			= try_convert(XML, t1.RowDetails).value('(/aaMasAddress/NEW/AddrState)[1]', 'VARCHAR(128)')
		,ChgDetails			= convert(XML, t1.ChgDetails)
	FROM 
		dbo.aaMasAuditTable t0
	
		INNER JOIN dbo.aaMasAuditChangeHdr t1
			ON t0.AuditTableTID = t1.ChgTableTID
			AND t0.AuditTableName = 'aaMasAddress'
)

SELECT
	 OwnHdrHID		= t0.HdrHID
	,OwnHdrCode		= t0.HdrCode
	,OwnHdrName		= t0.HdrName
	,OwnAddrTID		= t2.AddrTID
	,OwnAddrState	= t2.AddrState
	,DateOfChange	= t2.ChgDate
	,ChgDetails		= t2.ChgDetails
FROM
	dbo.fbMasHdr t0
	
	INNER JOIN dbo.aaMasAddress t1
		ON t0.HdrHID = t1.AddrEntityHID

	INNER JOIN cteBase t2
		ON t1.AddrTID = t2.AddrTID

WHERE 1=1
	AND t0.HdrCode = '27972'
ORDER BY 
	t2.ChgDate

RETURN

;WITH cteBase AS (
	SELECT 
		 AddrTID			= coalesce(
								 try_convert(XML, t1.RowDetails).value('(/aaMasAddress/NEW/AddrTID)[1]', 'INT')
								,try_convert(XML, t1.RowDetails).value('(/aaMasAddress/OLD/AddrTID)[1]', 'INT')
							  )
		,ChgDate			= t1.ChgDate
		,AddrState			= try_convert(XML, t1.RowDetails).value('(/aaMasAddress/NEW/AddrState)[1]', 'VARCHAR(128)')
		,ChgDetails			= convert(XML, t1.ChgDetails)
	FROM 
		dbo.aaMasAuditTable t0
	
		INNER JOIN dbo.aaMasAuditChangeHdr t1
			ON t0.AuditTableTID = t1.ChgTableTID
			AND t0.AuditTableName = 'aaMasAddress'
)
,cteAddrStateHist AS (
	SELECT
		 AddrTID				= t0.AddrTID
		,AddrState				= coalesce(t1.AddrState, t0.AddrState)
		,LastChangeDate			= lag(t1.ChgDate, 1) OVER (PARTITION BY t0.AddrTID ORDER BY t1.ChgDate)
		,EffectiveStartDate		= t1.ChgDate
		,EffectiveEndDate		= lead(t1.ChgDate, 1) OVER (PARTITION BY t0.AddrTID ORDER BY t1.ChgDate)
		,t1.ChgDetails
	FROM 
		dbo.aaMasAddress t0

		LEFT OUTER JOIN cteBase t1
			ON t0.AddrTID = t1.AddrTID
)
,cteAddrStateHistEx AS (
	SELECT
		 AddrTID				= t0.AddrTID
		,AddrState				= t0.AddrState
		,LastChangeDate			= t0.LastChangeDate
		,EffectiveStartDate		= CASE 
									WHEN t0.LastChangeDate IS NULL THEN try_convert(DATETIME,'1753-01-01')
									ELSE t0.EffectiveStartDate
								  END
		,EffectiveEndDate		= coalesce(t0.EffectiveEndDate, getdate())
		,t0.ChgDetails
	FROM
		cteAddrStateHist t0
)
SELECT
	*
FROM
	cteAddrStateHistEx
WHERE
	cteAddrStateHistEx.AddrTID = 1016916
--SELECT --count(*) /*
--	 -- Escheat (rvMasEscheatPmt)
--	 EschPmtTID				= t0.EschPmtTID
--	,EschProcessTID			= t0.EschProcessTID
--	,EschState				= t0.EschState
--	,EschPmtPeriod			= t0.EschPmtPeriod
--	,EschTotAmt				= t0.EschTotAmt
-- 	,EschPrelim				= t0.EschPrelim
--	,EschTotNettingAmt		= t0.EschTotNettingAmt
--	,EschBankTxnTID			= t0.EschBankTxnTID
--	,EscheatKey				= concat(t0.EschPmtTID, t0.EschProcessTID)

--	 -- Revenue (rvBalOwnTxn)
--	,OwnTxnTID				= t1.OwnTxnTID
--	,OwnAcctDate			= t1.OwnAcctDate
--	,OwnProdDate			= t1.OwnProdDate
--	,OwnPmtDate				= t1.OwnPmtDate
--	,OwnSuspCode			= t1.OwnSuspCode
--	,OwnIntCode				= t1.OwnIntCode
--	,OwnDeckDcml			= t1.OwnDeckDcml
--	,OwnDistribDcml			= t1.OwnDistribDcml
--	,OwnDistribChgBkDcml	= t1.OwnDistribChgBkDcml
--	,OwnVal					= t1.OwnVal
--	,OwnNetting				= t1.OwnNetting
--	,OwnRltyBurdenChgBkVal	= t1.OwnRltyBurdenChgBkVal
--	,OwnTax					= t1.OwnTax
--	,OwnDed					= t1.OwnDed
--	,OwnNet					= t1.OwnNet
--	,OwnChkVol				= t1.OwnChkVol
--	,OwnPostVol				= t1.OwnPostVol
--	,OwnGrsVol				= t1.OwnGrsVol
--	,OwnMmbtu				= t1.OwnMmbtu
--	,OwnPmtStatCode			= t1.OwnPmtStatCode
--	,OwnRpt1099				= t1.OwnRpt1099
--	,OwnEscheated			= t1.OwnEscheated
--	,OwnProcessTID			= t1.OwnProcessTID
--	,OwnEschPmtTID			= t1.OwnEschPmtTID
--	,OwnReDistProcessTID	= t1.OwnReDistProcessTID
--	,OwnReDistTxnHdrTID		= t1.OwnReDistTxnHdrTID
--	,OwnZeroPPASuppress		= t1.OwnZeroPPASuppress
--	,OwnZeroPPASummaryID	= t1.OwnZeroPPASummaryID
--	,OwnTxnDtlTID			= t1.OwnTxnDtlTID
--	,OwnCorpHID				= t1.OwnCorpHID
--	,OwnPropHID				= t1.OwnPropHID
--	,OwnHID					= t1.OwnHID
--	,OwnAddrTID				= t1.OwnAddrTID
--	,OwnPayeeHID			= t1.OwnPayeeHID
--	,OwnPayeeAddrTID		= t1.OwnPayeeAddrTID
--	,OwnAcctHID				= t1.OwnAcctHID

--	 -- Property
--	,PropHdrHID				= t2.HdrHID
--	,PropHdrCode			= t2.HdrCode
--	,PropHdrName			= t2.HdrName

--	 -- Corp
--	,CorpHdrHID				= t3.HdrHID
--	,CorpHdrCode			= t3.HdrCode
--	,CorpHdrName			= t3.HdrName

--	 -- Owner
--	,OwnerHdrHID			= t4.HdrHID
--	,OwnerHdrCode			= t4.HdrCode
--	,OwnerHdrName			= t4.HdrName
--	,OwnerState				= t6.AddrState

--	 -- Payee
--	,PayeeHdrHID			= t5.HdrHID
--	,PayeeHdrCode			= t5.HdrCode
--	,PayeeHdrName			= t5.HdrName
----*/
--FROM
--	EnertiaLive.dbo.rvMasEscheatPmt t0

--	INNER JOIN EnertiaLive.dbo.rvBalOwnTxn t1
--		ON t0.EschPmtTID = t1.OwnEschPmtTID

--	-- Property
--	INNER JOIN EnertiaLive.dbo.fbMasHdr t2
--		ON t1.OwnPropHID = t2.HdrHID
		
--	-- Corp
--	INNER JOIN EnertiaLive.dbo.fbMasHdr t3
--		ON t1.OwnCorpHID = t3.HdrHID

--	-- Owner
--	INNER JOIN EnertiaLive.dbo.fbMasHdr t4
--		ON t1.OwnHID = t4.HdrHID

--	-- Payee
--	INNER JOIN EnertiaLive.dbo.fbMasHdr t5
--		ON t1.OwnPayeeHID = t5.HdrHID

--	-- Address
--	INNER JOIN EnertiaLive.dbo.aaMasAddress t6
--		ON t1.OwnAddrTID = t6.AddrTID

--UNION ALL

SELECT --count(*) /*
	 -- Escheat (rvMasEscheatPmt)
	 EschPmtTID				= convert(INT, NULL)
	,EschProcessTID			= t0.OwnProcessTID
	,EschState				= t5.AddrState
	,EschPmtPeriod			= dateadd(DAY, 1, eomonth(t0.OwnPmtDate, -1))
	,EschTotAmt				= sum(t0.OwnNet) OVER (PARTITION BY t0.OwnProcessTID, datepart(MONTH, t0.OwnPmtDate), datepart(YEAR, t0.OwnPmtDate))
 	,EschPrelim				= convert(TINYINT, NULL)
	,EschTotNettingAmt		= convert(MONEY, NULL)
	,EschBankTxnTID			= convert(INT, NULL)
	,EscheatKey				= convert(VARCHAR(32), t0.OwnProcessTID)

	 -- Revenue (rvBalOwnTxn)
	,OwnTxnTID				= t0.OwnTxnTID
	,OwnAcctDate			= t0.OwnAcctDate
	,OwnProdDate			= t0.OwnProdDate
	,OwnPmtDate				= t0.OwnPmtDate
	,OwnSuspCode			= t0.OwnSuspCode
	,OwnIntCode				= t0.OwnIntCode
	,OwnDeckDcml			= t0.OwnDeckDcml
	,OwnDistribDcml			= t0.OwnDistribDcml
	,OwnDistribChgBkDcml	= t0.OwnDistribChgBkDcml
	,OwnVal					= t0.OwnVal
	,OwnNetting				= t0.OwnNetting
	,OwnRltyBurdenChgBkVal	= t0.OwnRltyBurdenChgBkVal
	,OwnTax					= t0.OwnTax
	,OwnDed					= t0.OwnDed
	,OwnNet					= t0.OwnNet
	,OwnChkVol				= t0.OwnChkVol
	,OwnPostVol				= t0.OwnPostVol
	,OwnGrsVol				= t0.OwnGrsVol
	,OwnMmbtu				= t0.OwnMmbtu
	,OwnPmtStatCode			= t0.OwnPmtStatCode
	,OwnRpt1099				= t0.OwnRpt1099
	,OwnEscheated			= t0.OwnEscheated
	,OwnProcessTID			= t0.OwnProcessTID
	,OwnEschPmtTID			= t0.OwnEschPmtTID
	,OwnReDistProcessTID	= t0.OwnReDistProcessTID
	,OwnReDistTxnHdrTID		= t0.OwnReDistTxnHdrTID
	,OwnZeroPPASuppress		= t0.OwnZeroPPASuppress
	,OwnZeroPPASummaryID	= t0.OwnZeroPPASummaryID
	,OwnTxnDtlTID			= t0.OwnTxnDtlTID
	,OwnCorpHID				= t0.OwnCorpHID
	,OwnPropHID				= t0.OwnPropHID
	,OwnHID					= t0.OwnHID
	,OwnAddrTID				= t0.OwnAddrTID
	,OwnPayeeHID			= t0.OwnPayeeHID
	,OwnPayeeAddrTID		= t0.OwnPayeeAddrTID
	,OwnAcctHID				= t0.OwnAcctHID

	 -- Property
	,PropHdrHID				= t1.HdrHID
	,PropHdrCode			= t1.HdrCode
	,PropHdrName			= t1.HdrName

	 -- Corp
	,CorpHdrHID				= t2.HdrHID
	,CorpHdrCode			= t2.HdrCode
	,CorpHdrName			= t2.HdrName

	 -- Owner
	,OwnerHdrHID			= t3.HdrHID
	,OwnerHdrCode			= t3.HdrCode
	,OwnerHdrName			= t3.HdrName
	,OwnerState				= t5.AddrState

	 -- Payee
	,PayeeHdrHID			= t4.HdrHID
	,PayeeHdrCode			= t4.HdrCode
	,PayeeHdrName			= t4.HdrName
--*/
FROM
	EnertiaLive.dbo.rvBalOwnTxn t0
	
	-- Property
	INNER JOIN EnertiaLive.dbo.fbMasHdr t1
		ON t0.OwnPropHID = t1.HdrHID
		
	-- Corp
	INNER JOIN EnertiaLive.dbo.fbMasHdr t2
		ON t0.OwnCorpHID = t2.HdrHID

	-- Owner
	INNER JOIN EnertiaLive.dbo.fbMasHdr t3
		ON t0.OwnHID = t3.HdrHID

	-- Payee
	INNER JOIN EnertiaLive.dbo.fbMasHdr t4
		ON t0.OwnPayeeHID = t4.HdrHID

	-- Address
	INNER JOIN cteAddrStateHistEx t5
		ON t0.OwnAddrTID = t5.AddrTID
		AND t0.OwnPmtDate > t5.EffectiveStartDate 
		AND t0.OwnPmtDate <= t5.EffectiveEndDate

WHERE 1=1
	AND t0.OwnSuspCode = 'DNUES'
	AND t0.OwnEschPmtTID IS NULL

