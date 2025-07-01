USE Integration

SELECT 
	min(t0.OwnPmtDate), max(t0.OwnPmtDate), t0.OwnSuspCode
FROM 
	EnertiaLive.dbo.rvBalOwnTxn t0 
WHERE 
	t0.OwnEschPmtTID IS NULL
GROUP BY 
	t0.OwnSuspCode
ORDER BY 
	t0.OwnSuspCode

SELECT
	min([Escheat Payment Period]), max([Escheat Payment Period])
FROM
	enertia.Escheat

SELECT
	*
FROM
	EnertiaLive.dbo.rvBalOwnTxn WHERE OwnSuspCode = 'DNUES' AND OwnPmtDate BETWEEN '2017-10-02 00:00:00' AND '2018-02-01 00:00:00'
-- No Escheat Payments from Oct-2017 - Feb-2018, does that raise any concerns?
-- Planning to use OwnPmtDate for Excheat Payment Period (will be first of month for OwnPmtDate), is this wrong?
-- 

SELECT * FROM EnertiaLive.dbo.rvMasEscheatPmt
SELECT * FROM EnertiaLive.dbo.fbMasHdr WHERE HdrCode = '42632'
SELECT * FROM EnertiaLive.dbo.fbMasHdr WHERE HdrCode = '10205.1'
SELECT * FROM EnertiaLive.dbo.fbMasHdr WHERE HdrHID = 1017769
SELECT * FROM EnertiaLive.dbo.fbMasHdr WHERE HdrCode = '56580'
SELECT * FROM EnertiaLive.dbo.fbMasHdr WHERE HdrName LIKE '%KEANE%'
SELECT DISTINCT OwnSuspCode FROM EnertiaLive.dbo.rvBalOwnTxn

SELECT * FROM EnertiaLive.dbo.aaDetXref WHERE  XrefRemark LIKE '%ESCH%'


1048236
1017769
SELECT * FROM EnertiaLive.dbo.rvBalOwnTxn WHERE OwnHID = 1031371 AND OwnSuspCode = 'ESCH' OwnPmtDate BETWEEN '2009-01-01' AND '2009-12-31' AND OwnPropHID = 1048236 AND OwnVal = 6.28 AND OwnSuspCode = 'S03'
SELECT * FROM EnertiaLive.dbo.aaTxn WHERE TxnPayeeHID = 1017769


SELECT * FROM EnertiaLive.dbo.rvBalOwnTxn WHERE OwnProcessTID = 1035058

SELECT 
	min(OwnPmtDate), max(OwnPmtDate) 
FROM 
	EnertiaLive.dbo.rvBalOwnTxn WHERE OwnSuspCode = 'DNUES' AND OwnEschPmtTID IS NULL AND OwnProcessTID IS NOT NULL OwnPayeeHID = 1044894 AND OwnVal IN (6.28, -372.32, 39.99) AND OwnPmtDate <= '2016-01-01'

SELECT * FROM EnertiaLive.dbo.aaMasProcess WHERE ProcessTID = 1035058
SELECT * FROM EnertiaLive.dbo.aaMasProcess WHERE ProcessOverridePmtType = 'Escheat'

SELECT * FROM EnertiaLive.dbo.rvTblSusp
SELECT * FROM EnertiaLive.dbo.susp
SELECT * FROM EnertiaLive.dbo.fbMasHdr WHERE HdrCode = '41147'
SELECT * FROM EnertiaLive.dbo.fbMasHdr WHERE HdrCode = 'O062'
SELECT * FROM EnertiaLive.dbo.rvBalOwnTxn WHERE OwnHID = 1030344 AND OwnPropHID = 1049976
SELECT * FROM EnertiaLive.dbo.rvTxnDtl WHERE TxnRevPropHID = 1049976 AND TxnDirectOwnHID