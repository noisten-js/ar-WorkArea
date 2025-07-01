USE Integration;
	WITH cteMasAddressAudit AS (
		-- Unpack values from the XML RowDetails Column
		SELECT
			 t0.ChgRecordID
			,t0.ChgDate
			,AddrTID					= coalesce(
											 try_convert(XML, t0.RowDetails).value('(/aaMasAddress/NEW/AddrTID)[1]', 'INT')
											,try_convert(XML, t0.RowDetails).value('(/aaMasAddress/OLD/AddrTID)[1]', 'INT')
										  )
			,OldAddrState				= try_convert(XML, t0.RowDetails).value('(/aaMasAddress/OLD/AddrState)[1]', 'CHAR(5)')
			,NewAddrState				= try_convert(XML, t0.RowDetails).value('(/aaMasAddress/NEW/AddrState)[1]', 'CHAR(5)')
		FROM
			EnertiaLive.dbo.aaMasAuditChangeHdr t0

			INNER JOIN EnertiaLive.dbo.aaMasAuditTable t1
				ON t0.ChgTableTID = t1.AuditTableTID
				AND t1.AuditTableName = 'aaMasAddress'
	)
	,cteMasAddressAuditEx AS (
		-- Combine audit data with aaMasAddress data and apply window functions to audit attributes
		SELECT 
			 t0.AddrTID
			,t1.ChgRecordID
			,AddrState			= coalesce(t1.NewAddrState, t1.OldAddrState, t0.AddrState)

			,SysCreatedDate		= CASE 
									WHEN t1.ChgRecordID IS NULL THEN convert(DATETIME, '1753-01-01')
									ELSE min(t1.ChgDate) OVER (PARTITION BY t1.AddrTID)
								  END
			,SysEffectiveStart	= CASE 
									WHEN t1.ChgRecordID IS NULL THEN convert(DATETIME, '1753-01-01')
									ELSE t1.ChgDate
								  END
			,SysEffectiveEnd	= coalesce(
									 lead(t1.ChgDate, 1, sysdatetime()) OVER (PARTITION BY t1.AddrTID ORDER BY t1.ChgDate)
									,convert(DATETIME, '9999-12-31 23:59:59.997')
								  )

			,t0.AddrState AS CurAddrState
			,t1.OldAddrState
			,t1.NewAddrState
		FROM 
			EnertiaLive.dbo.aaMasAddress t0

			LEFT OUTER JOIN cteMasAddressAudit t1 
				ON t0.AddrTID = t1.AddrTID
	)

	--SELECT
	--	 -- Escheat (rvMasEscheatPmt)
	--	 EschPmtTID				= t0.EschPmtTID
	--	,EschProcessTID			= t0.EschProcessTID
	--	,EschState				= t0.EschState
	--	,EschPmtPeriod			= t0.EschPmtPeriod
	--	,EschTotAmt				= t0.EschTotAmt
 --		,EschPrelim				= t0.EschPrelim
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

	SELECT
		 -- Escheat (rvMasEscheatPmt)
		 EschPmtTID				= convert(INT, NULL)
		,EschProcessTID			= t0.OwnProcessTID
		,EschState				= coalesce(t5.AddrState, 'DE')
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
		,OwnerState				= coalesce(rtrim(t5.AddrState), 'DE')

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
		LEFT OUTER JOIN cteMasAddressAuditEx t5
			ON t0.OwnAddrTID = t5.AddrTID
			AND t0.OwnPmtDate > t5.SysEffectiveStart 
			AND t0.OwnPmtDate <= t5.SysEffectiveEnd

	WHERE 1=1
		AND t0.OwnSuspCode = 'DNUES'
		AND t0.OwnEschPmtTID IS NULL
		AND t0.OwnPmtDate IS NOT NULL
		AND t0.OwnHID = 1015598