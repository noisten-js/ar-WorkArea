USE EnertiaLive
SET STATISTICS IO ON
--DBCC FREESESSIONCACHE
;WITH cteBase AS (
	SELECT 
		 AddrTID			= coalesce(
								 try_convert(XML, t1.RowDetails).value('(/aaMasAddress/NEW/AddrTID)[1]', 'INT')
								,try_convert(XML, t1.RowDetails).value('(/aaMasAddress/OLD/AddrTID)[1]', 'INT')
							  )
		,ChgDate			= t1.ChgDate
		,AddrState			= try_convert(XML, t1.RowDetails).value('(/aaMasAddress/NEW/AddrState)[1]', 'VARCHAR(128)')
	FROM 
		dbo.aaMasAuditTable t0
	
		INNER JOIN dbo.aaMasAuditChangeHdr t1
			ON t0.AuditTableTID = t1.ChgTableTID
			AND t0.AuditTableName = 'aaMasAddress'
)
,cteAddrStateHist AS (
	SELECT
		 AddrTID				= t0.AddrTID
		,AddrState				= t0.AddrState
		,EffectiveStartDate		= t0.ChgDate
		,EffectiveEndDate		= lead(t0.ChgDate, 1, sysdatetime()) OVER (PARTITION BY t0.AddrTID ORDER BY t0.ChgDate)
	FROM 
		cteBase t0
)

SELECT
	*
FROM
	dbo.rvBalOwnTxn t0

	LEFT OUTER JOIN cteAddrStateHist t1
		ON t0.OwnAddrTID = t1.AddrTID
		AND t0.OwnPmtDate BETWEEN t1.EffectiveStartDate AND t1.EffectiveEndDate

WHERE 1=1
	AND t0.OwnSuspCode = 'DNUES'
	AND t0.OwnEschPmtTID IS NULL

CREATE NONCLUSTERED INDEX [XIF1230rvBalOwnTxn] ON [dbo].[rvBalOwnTxn] ([OwnSuspCode]) ON [PRIMARY]

SELECT * FROM [dbo].[aaMasAuditChangeHdr]
--------- Formatted ORIGINAL Sql Statement ---------
/*

sqlods

(213118 rows affected)
Table 'aaMasAuditTable'. Scan count 1, logical reads 2, physical reads 1, read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob read-ahead reads 0.
Table 'Workfile'. Scan count 0, logical reads 0, physical reads 0, read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob read-ahead reads 0.
Table 'Worktable'. Scan count 489, logical reads 477944, physical reads 0, read-ahead reads 6062, lob logical reads 0, lob physical reads 0, lob read-ahead reads 0.
Table 'aaMasAuditChangeHdr'. Scan count 5, logical reads 225130, physical reads 1, read-ahead reads 223535, lob logical reads 3796792, lob physical reads 175531, lob read-ahead reads 0.
Table 'rvBalOwnTxn'. Scan count 5, logical reads 10772662, physical reads 2, read-ahead reads 9585547, lob logical reads 0, lob physical reads 0, lob read-ahead reads 0.
Table 'Worktable'. Scan count 0, logical reads 0, physical reads 0, read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob read-ahead reads 0.

(1 row affected)

Completion time: 2025-04-03T10:21:48.5991529-06:00


SELECT
	A.ChgTableTID
	,T.TableName
	,T.TablePrompt
	,A.ChgRecordID
	,A.ChgUserID
	,A.ChgDate
	,A.RowWhere
	,A.ChgHdrHID
	,H.HdrCode
	,H.HdrName
	,A.ChgAdd
	,A.ChgEdit
	,A.ChgDelete
	,A.ChgDsReclose
FROM
	dbo.aaMasAuditChangeHdr			A
	INNER JOIN dbo.aaMasAuditTable AT
		ON AT.AuditTableTID = A.ChgTableTID

	INNER JOIN dbo.suMasTable	T
		ON T.TableName = AT.AuditTableName

	LEFT JOIN dbo.fbMasHdr		H
		ON H.HdrHID = A.ChgHdrHID

	LEFT JOIN dbo.ssMasUserTbl	X
		ON X.Processed = 1
		AND X.TableName = AT.AuditTableName

	LEFT JOIN dbo.ssMasUser		GX
		ON GX.UserId = X.UserId

	LEFT JOIN dbo.ssMasUserFBSType Y
		ON Y.Processed = 1
		AND Y.HdrTypeTID = H.HdrTypeTID

	LEFT JOIN dbo.ssMasUser		GY
		ON GY.UserId = Y.UserId
WHERE
	(
		(
			GX.UserId = 'DKANEB'
			AND X.AuthSelect = 1
		)
		AND (
				isnull(H.HdrHID, 0) = 0
				OR (
					GY.UserId = 'DKANEB'
					AND Y.Functions LIKE '%R%'
				)
			)
	)
	AND (A.ChgHdrHID = 1134465)
ORDER BY
	T.TableName
	,A.RowWhere
	,A.ChgDate DESC


--------- Formatted LAST Sql Statement ---------

SELECT
	A.ChgTableTID
	,T.TableName
	,T.TablePrompt
	,A.ChgRecordID
	,A.ChgUserID
	,A.ChgDate
	,A.RowWhere
	,A.ChgHdrHID
	,H.HdrCode
	,H.HdrName
	,A.ChgAdd
	,A.ChgEdit
	,A.ChgDelete
	,A.ChgDsReclose
FROM
	dbo.aaMasAuditChangeHdr			A
	INNER JOIN dbo.aaMasAuditTable AT
		ON AT.AuditTableTID = A.ChgTableTID

	INNER JOIN dbo.suMasTable	T
		ON T.TableName = AT.AuditTableName

	LEFT JOIN dbo.fbMasHdr		H
		ON H.HdrHID = A.ChgHdrHID

	LEFT JOIN dbo.ssMasUserTbl	X
		ON X.Processed = 1
		AND X.TableName = AT.AuditTableName

	LEFT JOIN dbo.ssMasUser		GX
		ON GX.UserId = X.UserId

	LEFT JOIN dbo.ssMasUserFBSType Y
		ON Y.Processed = 1
		AND Y.HdrTypeTID = H.HdrTypeTID

	LEFT JOIN dbo.ssMasUser		GY
		ON GY.UserId = Y.UserId
WHERE
	(
		(
			GX.UserId = 'DKANEB'
			AND X.AuthSelect = 1
		)
		AND (
				isnull(H.HdrHID, 0) = 0
				OR (
					GY.UserId = 'DKANEB'
					AND Y.Functions LIKE '%R%'
				)
			)
	)
	AND (A.ChgHdrHID = 1134465)
ORDER BY
	T.TableName
	,A.RowWhere
	,A.ChgDate DESC




--------- ORIGINAL Sql Statement ---------

SELECT
	A.ChgTableTID
	,T.TableName
	,T.TablePrompt
	,A.ChgRecordID
	,A.ChgUserID
	,A.ChgDate
	,A.RowWhere
	,A.ChgHdrHID
	,H.HdrCode
	,H.HdrName
	,A.ChgAdd
	,A.ChgEdit
	,A.ChgDelete
	,A.ChgDsReclose
FROM
	dbo.aaMasAuditChangeHdr			A
	INNER JOIN dbo.aaMasAuditTable AT
		ON AT.AuditTableTID = A.ChgTableTID

	INNER JOIN dbo.suMasTable	T
		ON T.TableName = AT.AuditTableName

	LEFT JOIN dbo.fbMasHdr		H
		ON H.HdrHID = A.ChgHdrHID

	LEFT JOIN dbo.ssMasUserTbl	X
		ON X.Processed = 1
		AND X.TableName = AT.AuditTableName

	LEFT JOIN dbo.ssMasUser		GX
		ON GX.UserId = X.UserId

	LEFT JOIN dbo.ssMasUserFBSType Y
		ON Y.Processed = 1
		AND Y.HdrTypeTID = H.HdrTypeTID

	LEFT JOIN dbo.ssMasUser		GY
		ON GY.UserId = Y.UserId
WHERE
	(
		(
			GX.UserId = 'DKANEB'
			AND X.AuthSelect = 1
		)
		AND (
				isnull(H.HdrHID, 0) = 0
				OR (
					GY.UserId = 'DKANEB'
					AND Y.Functions LIKE '%R%'
				)
			)
	)
	AND (A.ChgHdrHID = 1134465)
ORDER BY
	T.TableName
	,A.RowWhere
	,A.ChgDate DESC


--------- LAST Sql Statement ---------

SELECT
	A.ChgTableTID
	,T.TableName
	,T.TablePrompt
	,A.ChgRecordID
	,A.ChgUserID
	,A.ChgDate
	,A.RowWhere
	,A.ChgHdrHID
	,H.HdrCode
	,H.HdrName
	,A.ChgAdd
	,A.ChgEdit
	,A.ChgDelete
	,A.ChgDsReclose
FROM
	dbo.aaMasAuditChangeHdr			A
	INNER JOIN dbo.aaMasAuditTable AT
		ON AT.AuditTableTID = A.ChgTableTID

	INNER JOIN dbo.suMasTable	T
		ON T.TableName = AT.AuditTableName

	LEFT JOIN dbo.fbMasHdr		H
		ON H.HdrHID = A.ChgHdrHID

	LEFT JOIN dbo.ssMasUserTbl	X
		ON X.Processed = 1
		AND X.TableName = AT.AuditTableName

	LEFT JOIN dbo.ssMasUser		GX
		ON GX.UserId = X.UserId

	LEFT JOIN dbo.ssMasUserFBSType Y
		ON Y.Processed = 1
		AND Y.HdrTypeTID = H.HdrTypeTID

	LEFT JOIN dbo.ssMasUser		GY
		ON GY.UserId = Y.UserId
WHERE
	(
		(
			GX.UserId = 'DKANEB'
			AND X.AuthSelect = 1
		)
		AND (
				isnull(H.HdrHID, 0) = 0
				OR (
					GY.UserId = 'DKANEB'
					AND Y.Functions LIKE '%R%'
				)
			)
	)
	AND (A.ChgHdrHID = 1134465)
ORDER BY
	T.TableName
	,A.RowWhere
	,A.ChgDate DESC


-- Copyright © 1996-2025 K3 Software, LLC.


SELECT * FROM dbo.aaMasAuditTable WHERE AuditTableName = 'aaMasAddress'
SELECT * FROM dbo.aaMasAuditColumn WHERE AuditTableTID = 1000001
DECLARE @x1 XML = '<aaMasAddress><OLD><AddrTID>1102154</AddrTID><AddrEntityHID>1134465</AddrEntityHID><AddrSubCode>00001</AddrSubCode><AddrAddress>367 VERNON RD</AddrAddress><AddrCity>MANSFIELD</AddrCity><AddrState>OH</AddrState><AddrCountry>US</AddrCountry><AddrZipCode>44905</AddrZipCode><AddrEschEligible>1</AddrEschEligible><AddrEschAnnualRpt>0</AddrEschAnnualRpt><AddrUnknown>0</AddrUnknown><AddrMinRevPmtEligible>0</AddrMinRevPmtEligible><AddrNonResident>0</AddrNonResident><AddrRemittableDate>2024-09-01 00:00:00</AddrRemittableDate></OLD><NEW><AddrTID>1102154</AddrTID><AddrEntityHID>1134465</AddrEntityHID><AddrSubCode>00001</AddrSubCode><AddrAddress>367 VERNON RD</AddrAddress><AddrCity>MANSFIELD</AddrCity><AddrState>OH</AddrState><AddrCountry>US</AddrCountry><AddrZipCode>44905</AddrZipCode><AddrEschEligible>0</AddrEschEligible><AddrEschAnnualRpt>0</AddrEschAnnualRpt><AddrUnknown>0</AddrUnknown><AddrMinRevPmtEligible>0</AddrMinRevPmtEligible><AddrNonResident>0</AddrNonResident></NEW><AppName>EISif_FBSAttributeImportForm:RDP-TCP#0</AppName><HostName>DENENERTIARDS02</HostName></aaMasAddress>	<aaMasAddress><AddrEschEligible><OLD>1</OLD><NEW>0</NEW></AddrEschEligible><AddrRemittableDate><OLD>2024-09-01 00:00:00</OLD><NEW>2024-10-01 09:02:00</NEW></AddrRemittableDate></aaMasAddress>'
DECLARE @x2 XML = '<aaMasAddress><AddrEschEligible><OLD>1</OLD><NEW>0</NEW></AddrEschEligible><AddrRemittableDate><OLD>2024-09-01 00:00:00</OLD><NEW>2024-10-01 09:02:00</NEW></AddrRemittableDate></aaMasAddress>'

WITH cteA AS (
SELECT
	 t0.ChgRecordID
	,t0.ChgTableTID
	,t0.ChgDate
	,t0.ChgUserID
	,t0.RowWhere
	,RowDetails = try_convert(XML, t0.RowDetails)
	,ChgDetails = try_convert(XML, t0.ChgDetails)
	,t0.ChgHdrHID
	,t0.ChgAdd
	,t0.ChgEdit
	,t0.ChgDelete
	,t0.ChgDsReclose
	,t0.LastUpdateID
	,t0.LastUpdated
FROM
	dbo.aaMasAuditChangeHdr t0
)
SELECT
	*
	,t0.RowDetails.value('(/aaMasAddress/OLD/AddrTID)[1]', 'INT') AS AddrTID
FROM
	cteA t0
*/
