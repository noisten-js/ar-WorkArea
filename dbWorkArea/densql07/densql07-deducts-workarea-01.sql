SELECT TOP 20 [Search Key], * FROM enertia.Enertia_Deducts

SELECT * FROM EnertiaLive.dbo.rvMasDed 

SELECT * FROM EnertiaLive.dbo.rvBalOwnTxn

SELECT 
	*
FROM 
	EnertiaLive.dbo.rvBalOwnTxnDed


SELECT 
	 [Owner Header Code]			= rtrim(Own.HdrCode)
	,[Owner Header Name]			= rtrim(Own.HdrName)
	,[Payee Header Code]			= rtrim(Payee.HdrCode)
	,[Payee Header Name]			= rtrim(Payee.HdrName)
	,[Property Header Code]			= rtrim(Prop.HdrCode)
	,[Property Header Name]			= rtrim(Prop.HdrName)
	,[Acct Date]					= OwnTxn.OwnAcctDate
	,[Prod Date]					= OwnTxn.OwnProdDate
	,[Corporation Header Code]		= rtrim(Corp.HdrCode)
	,[Corporation Header Name]		= rtrim(Corp.HdrName)
	,Deduction						= rtrim(Root.OwnDedCode)
	,[Deduction Description]		= rtrim(Ded.DedDesc)
	,[Deduction Type]				= rtrim(Ded.DedTypeDeduct)
	,[Computed Amount]				= Root.OwnDedComputedAmt
	,[ChgBk Proportional Amount]	= Root.OwnDedChgBkPropAmt
	,[ChgBk Disproportional Amount] = Root.OwnDedChgBkDispAmt
	,[Free Redistributed Amount]	= Root.OwnDedFreeRedistAmt
	,[State Tax Exempt Amount]		= Root.OwnDedStateTaxExemptAmt
	,[Original Computed Amount]		= Root.OwnDedOrigComputedAmt
	,[Owner Level Deduct]			= Root.OwnLevelDeduct
	,Product						= rtrim(RvTxn.TxnProdCode)
	,[Interest Type]				= rtrim(OwnTxn.OwnIntCode)
	,[Suspense Handling]			= rtrim(OwnTxn.OwnSuspCode)
	,[Deck Decimal]					= OwnTxn.OwnDeckDcml
	,[Distribution Decimal]			= OwnTxn.OwnDistribDcml
	,[Distribution Method Code]		= rtrim(RvTxnDet.TxnDistribMthdCode)
	,[Disposition Code]				= rtrim(RvTxn.TxnDispCode)
	,Volume							= OwnTxn.OwnChkVol
	,[Post Volume]					= OwnTxn.OwnPostVol
	,[Gross Volume]					= OwnTxn.OwnGrsVol
	,MMBTU							= OwnTxn.OwnMmbtu
	,Value							= OwnTxn.OwnVal
	,[Total Netting]				= OwnTxn.OwnNetting
	,[Total Taxes]					= OwnTxn.OwnTax
	,[Total Deductions]				= OwnTxn.OwnDed
	,Net							= OwnTxn.OwnNet
	,[Payment Status]				= rtrim(OwnTxn.OwnPmtStatCode)
	,[Pmt Date]						= OwnTxn.OwnPmtDate
	,[Gross Taxes]					= RvTxnDet.TxnGrsTax
	,[Paid Taxes]					= RvTxnDet.TxnPdTax
	,[Contract Code]				= RvTxn.TxnCntrctCode
	-- Search Key
	,[Search Key]					= replace(concat(rtrim(Own.HdrCode),rtrim(Own.HdrName),rtrim(Prop.HdrCode),rtrim(Prop.HdrName),rtrim(OwnTxn.OwnIntCode),rtrim(OwnTxn.OwnSuspCode),rtrim(OwnTxn.OwnPmtStatCode)),'*',' ')
	,OwnTxn.LastUpdated

FROM
	EnertiaLive.dbo.rvBalOwnTxn OwnTxn

	INNER JOIN EnertiaLive.dbo.fbMasHdr Own
		ON OwnTxn.OwnHID = Own.HdrHID

	INNER JOIN EnertiaLive.dbo.fbMasHdr Payee
		ON OwnTxn.OwnPayeeHID = Payee.HdrHID

	INNER JOIN EnertiaLive.dbo.rvTxnDtl RvTxnDet
		ON OwnTxn.OwnTxnDtlTID = RvTxnDet.TxnDtlTID

	INNER JOIN EnertiaLive.dbo.rvTxnHdr RvTxn
		ON RvTxnDet.TxnHdrTID = RvTxn.TxnHdrTID

	INNER JOIN EnertiaLive.dbo.fbMasHdr Corp
		ON OwnTxn.OwnCorpHID = Corp.HdrHID
        AND RvTxnDet.TxnCorpHID = Corp.HdrHID 

	INNER JOIN EnertiaLive.dbo.fbMasHdr Prop
		ON OwnTxn.OwnPropHID = Prop.HdrHID

	INNER JOIN EnertiaLive.dbo.rvBalOwnTxnDed			Root
		ON Root.OwnTxnTID = OwnTxn.OwnTxnTID

	INNER JOIN EnertiaLive.dbo.rvMasDed Ded
		ON Root.OwnDedCode = Ded.DedCode


WHERE 1=1
                   AND (
					Root.OwnDedOrigComputedAmt <> 0 
					OR Root.OwnDedOrigComputedAmt IS NULL
				   ) 
                   AND OwnTxn.OwnPmtStatCode IN (
						 'AFFIL'
						,'CORP' 
						,'PD'   
						,'UNPD'
				   )

SELECT * FROM #test
				   SELECT count(*) FROM EnertiaLive.dbo.rvBalOwnTxnDed WHERE OwnDedComputedAmt IS NULL