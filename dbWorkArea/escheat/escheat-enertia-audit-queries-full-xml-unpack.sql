USE EnertiaLive;
WITH cteAuditBase AS (
	SELECT
		 t0.ChgRecordID
		,t0.ChgDate
		,t0.ChgAdd
		,t0.ChgEdit
		,t0.ChgDelete
		,t0.ChgHdrHID

		,AddrTID					= coalesce(
										 try_convert(XML, t0.RowDetails).value('(/aaMasAddress/NEW/AddrTID)[1]', 'INT')
										,try_convert(XML, t0.RowDetails).value('(/aaMasAddress/OLD/AddrTID)[1]', 'INT')
									  )
		,OldAddrState				= try_convert(XML, t0.RowDetails).value('(/aaMasAddress/OLD/AddrState)[1]', 'CHAR(5)')
		--,AddrEntityHID				= try_convert(XML, t0.RowDetails).value('(/aaMasAddress/OLD/AddrEntityHID)[1]', 'INT')
		--,AddrSubCode				= try_convert(XML, t0.RowDetails).value('(/aaMasAddress/OLD/AddrSubCode)[1]', 'CHAR(5)')
		--,AddrSalutation				= try_convert(XML, t0.RowDetails).value('(/aaMasAddress/OLD/AddrSalutation)[1]', 'CHAR(35)')
		--,AddrContact				= try_convert(XML, t0.RowDetails).value('(/aaMasAddress/OLD/AddrContact)[1]', 'CHAR(35)')
		--,AddrAddress				= try_convert(XML, t0.RowDetails).value('(/aaMasAddress/OLD/AddrAddress)[1]', 'VARCHAR(255)')
		--,AddrCity					= try_convert(XML, t0.RowDetails).value('(/aaMasAddress/OLD/AddrCity)[1]', 'CHAR(20)')
		--,AddrCountry				= try_convert(XML, t0.RowDetails).value('(/aaMasAddress/OLD/AddrCountry)[1]', 'CHAR(5)')
		--,AddrZipCode				= try_convert(XML, t0.RowDetails).value('(/aaMasAddress/OLD/AddrZipCode)[1]', 'CHAR(10)')
		--,AddrPhone					= try_convert(XML, t0.RowDetails).value('(/aaMasAddress/OLD/AddrPhone)[1]', 'CHAR(15)')
		--,AddrFax					= try_convert(XML, t0.RowDetails).value('(/aaMasAddress/OLD/AddrFax)[1]', 'CHAR(15)')
		--,AddrModem					= try_convert(XML, t0.RowDetails).value('(/aaMasAddress/OLD/AddrModem)[1]', 'CHAR(15)')
		--,AddrEmail					= try_convert(XML, t0.RowDetails).value('(/aaMasAddress/OLD/AddrEmail)[1]', 'VARCHAR(255)')
		--,AddrEschEligible			= try_convert(XML, t0.RowDetails).value('(/aaMasAddress/OLD/AddrEschEligible)[1]', 'TINYINT')
		--,AddrEschAnnualRpt			= try_convert(XML, t0.RowDetails).value('(/aaMasAddress/OLD/AddrEschAnnualRpt)[1]', 'TINYINT')
		--,AddrUnknown				= try_convert(XML, t0.RowDetails).value('(/aaMasAddress/OLD/AddrUnknown)[1]', 'TINYINT')
		--,AddrMinRevPmtEligible		= try_convert(XML, t0.RowDetails).value('(/aaMasAddress/OLD/AddrMinRevPmtEligible)[1]', 'TINYINT')
		--,AddrNonResident			= try_convert(XML, t0.RowDetails).value('(/aaMasAddress/OLD/AddrNonResident)[1]', 'TINYINT')
		--,AddrSalesTaxGrp			= try_convert(XML, t0.RowDetails).value('(/aaMasAddress/OLD/AddrSalesTaxGrp)[1]', 'CHAR(10)')
		--,AddrCorpInvCode			= try_convert(XML, t0.RowDetails).value('(/aaMasAddress/OLD/AddrCorpInvCode)[1]', 'CHAR(2)')
		--,RemitToAddrTID				= try_convert(XML, t0.RowDetails).value('(/aaMasAddress/OLD/RemitToAddrTID)[1]', 'INT')
		--,AddrEschEligibleDate		= try_convert(XML, t0.RowDetails).value('(/aaMasAddress/OLD/AddrEschEligibleDate)[1]', 'SMALLDATETIME')
		--,AddrRemittableDate			= try_convert(XML, t0.RowDetails).value('(/aaMasAddress/OLD/AddrRemittableDate)[1]', 'SMALLDATETIME')

		--,t0.ChgUserID
		--,t0.LastUpdateID
		--,t0.LastUpdated
	FROM
		EnertiaLive.dbo.aaMasAuditChangeHdr t0

		INNER JOIN dbo.aaMasAuditTable t1
			ON t0.ChgTableTID = t1.AuditTableTID
			AND t1.AuditTableName = 'aaMasAddress'
)
,cteAuditEx AS (
	SELECT
		 ChgRecordID				= t0.ChgRecordID
		,ChgIndex					= row_number() OVER (PARTITION BY t0.AddrTID ORDER BY t0.ChgDate)
		,ChgDate					= t0.ChgDate
		,ChgAdd						= t0.ChgAdd
		,ChgEdit					= t0.ChgEdit
		,ChgDelete					= t0.ChgDelete
		,ChgHdrHID					= t0.ChgHdrHID
		,AddrTID					= t0.AddrTID
		,AddrEntityHID				= t0.AddrEntityHID
		,AddrSubCode				= t0.AddrSubCode
		,AddrSalutation				= t0.AddrSalutation
		,AddrContact				= t0.AddrContact
		,AddrAddress				= t0.AddrAddress
		,AddrCity					= t0.AddrCity
		,AddrState					= t0.AddrState
		,AddrCountry				= t0.AddrCountry
		,AddrZipCode				= t0.AddrZipCode
		,AddrPhone					= t0.AddrPhone
		,AddrFax					= t0.AddrFax
		,AddrModem					= t0.AddrModem
		,AddrEmail					= t0.AddrEmail
		,AddrEschEligible			= t0.AddrEschEligible
		,AddrEschAnnualRpt			= t0.AddrEschAnnualRpt
		,AddrUnknown				= t0.AddrUnknown
		,AddrMinRevPmtEligible		= t0.AddrMinRevPmtEligible
		,AddrNonResident			= t0.AddrNonResident
		,AddrSalesTaxGrp			= t0.AddrSalesTaxGrp
		,AddrCorpInvCode			= t0.AddrCorpInvCode
		,RemitToAddrTID				= t0.RemitToAddrTID
		,AddrEschEligibleDate		= t0.AddrEschEligibleDate
		,AddrRemittableDate			= t0.AddrRemittableDate
		,ChgUserID					= t0.ChgUserID
		,LastUpdateID				= t0.LastUpdateID
		,LastUpdated				= t0.LastUpdated
	FROM
		cteAuditBase t0
)

SELECT
	 t0.AddrTID
	,t2.ChgRecordID
	,t2.ChgIndex
	,t2.ChgDate
	,t2.ChgAdd
	,t2.ChgEdit
	,t2.ChgDelete
	,t2.ChgHdrHID
	,t1.AddrTID							,t2.AddrTID
	,t1.AddrEntityHID					,t2.AddrEntityHID
	,t1.AddrSubCode						,t2.AddrSubCode
	,t1.AddrSalutation					,t2.AddrSalutation
	,t1.AddrContact						,t2.AddrContact
	,t1.AddrAddress						,t2.AddrAddress
	,t1.AddrCity						,t2.AddrCity
	,t1.AddrState						,t2.AddrState
	,t1.AddrCountry						,t2.AddrCountry
	,t1.AddrZipCode						,t2.AddrZipCode
	,t1.AddrPhone						,t2.AddrPhone
	,t1.AddrFax							,t2.AddrFax
	,t1.AddrModem						,t2.AddrModem
	,t1.AddrEmail						,t2.AddrEmail
	,t1.AddrEschEligible				,t2.AddrEschEligible
	,t1.AddrEschAnnualRpt				,t2.AddrEschAnnualRpt
	,t1.AddrUnknown						,t2.AddrUnknown
	,t1.AddrMinRevPmtEligible			,t2.AddrMinRevPmtEligible
	,t1.AddrNonResident					,t2.AddrNonResident
	,t1.AddrSalesTaxGrp					,t2.AddrSalesTaxGrp
	,t1.AddrCorpInvCode					,t2.AddrCorpInvCode
	,t1.RemitToAddrTID					,t2.RemitToAddrTID
	,t1.AddrEschEligibleDate			,t2.AddrEschEligibleDate
	,t1.AddrRemittableDate				,t2.AddrRemittableDate
	,t1.LastUpdateID					,t2.LastUpdateID
	,t1.LastUpdated						,t2.LastUpdated
FROM
	dbo.aaMasAddressXref t0

	INNER JOIN dbo.aaMasAddress t1
		ON t0.AddrTID = t1.AddrTID

	LEFT OUTER JOIN cteAuditEx t2
		ON t0.AddrTID = t2.AddrTID
		AND t2.ChgIndex = 1


--CREATE TABLE dbo.aaMasAddress (
--	 AddrTID					INT				NOT NULL
--	,AddrEntityHID			INT				NOT NULL
--	,AddrSubCode			CHAR(5)			COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
--	,AddrSalutation			CHAR(35)		COLLATE SQL_Latin1_General_CP1_CI_AS NULL
--	,AddrContact			CHAR(35)		COLLATE SQL_Latin1_General_CP1_CI_AS NULL
--	,AddrAddress			VARCHAR(255)	COLLATE SQL_Latin1_General_CP1_CI_AS NULL
--	,AddrCity				CHAR(20)		COLLATE SQL_Latin1_General_CP1_CI_AS NULL
--	,AddrState				CHAR(5)			COLLATE SQL_Latin1_General_CP1_CI_AS NULL
--	,AddrCountry			CHAR(5)			COLLATE SQL_Latin1_General_CP1_CI_AS NULL
--	,AddrZipCode			CHAR(10)		COLLATE SQL_Latin1_General_CP1_CI_AS NULL
--	,AddrPhone				CHAR(15)		COLLATE SQL_Latin1_General_CP1_CI_AS NULL
--	,AddrFax				CHAR(15)		COLLATE SQL_Latin1_General_CP1_CI_AS NULL
--	,AddrModem				CHAR(15)		COLLATE SQL_Latin1_General_CP1_CI_AS NULL
--	,AddrEmail				VARCHAR(255)	COLLATE SQL_Latin1_General_CP1_CI_AS NULL
--	,AddrEschEligible		TINYINT			NOT NULL CONSTRAINT DF__aaMasAddr__AddrE__1886FA46 DEFAULT ((0))
--	,AddrEschAnnualRpt		TINYINT			NOT NULL CONSTRAINT DF__aaMasAddr__AddrE__197B1E7F DEFAULT ((0))
--	,AddrUnknown			TINYINT			NOT NULL CONSTRAINT DF__aaMasAddr__AddrU__1A6F42B8 DEFAULT ((0))
--	,AddrMinRevPmtEligible	TINYINT			NOT NULL CONSTRAINT DF__aaMasAddr__AddrM__1B6366F1 DEFAULT ((0))
--	,AddrNonResident		TINYINT			NOT NULL CONSTRAINT DF__aaMasAddr__AddrN__1C578B2A DEFAULT ((0))
--	,AddrSalesTaxGrp		CHAR(10)		COLLATE SQL_Latin1_General_CP1_CI_AS NULL
--	,AddrCorpInvCode		CHAR(2)			COLLATE SQL_Latin1_General_CP1_CI_AS NULL
--	,RemitToAddrTID			INT				NULL
--	,AddrEschEligibleDate	SMALLDATETIME	NULL
--	,AddrRemittableDate		SMALLDATETIME	NULL
--	,LastUpdateID			VARCHAR(20)		COLLATE SQL_Latin1_General_CP1_CI_AS NULL
--	,LastUpdated			SMALLDATETIME	NULL CONSTRAINT DF__aaMasAddr__LastU__1D4BAF63 DEFAULT (getdate())
--) ON [PRIMARY]
--GO
--ALTER TABLE dbo.aaMasAddress
--ADD
--CONSTRAINT	PKaaMasAddress PRIMARY KEY CLUSTERED (AddrTID) ON [PRIMARY]
--GO
--CREATE UNIQUE NONCLUSTERED INDEX XAK1aaMasAddress
--ON dbo.aaMasAddress (
--						AddrEntityHID
--						,AddrSubCode
--					)
--ON [PRIMARY]
--GO
--CREATE NONCLUSTERED INDEX XIF490aaMasAddress
--ON dbo.aaMasAddress (AddrEntityHID)
--ON [PRIMARY]
--GO
--CREATE NONCLUSTERED INDEX XIF2341aaMasAddress
--ON dbo.aaMasAddress (AddrSalesTaxGrp)
--ON [PRIMARY]
--GO
--CREATE NONCLUSTERED INDEX XIF2601aaMasAddress
--ON dbo.aaMasAddress (AddrState)
--ON [PRIMARY]
--GO
--CREATE NONCLUSTERED INDEX XIF2602aaMasAddress
--ON dbo.aaMasAddress (AddrCountry)
--ON [PRIMARY]
--GO
--CREATE NONCLUSTERED INDEX XIF4482aaMasAddress
--ON dbo.aaMasAddress (RemitToAddrTID)
--ON [PRIMARY]
--GO
