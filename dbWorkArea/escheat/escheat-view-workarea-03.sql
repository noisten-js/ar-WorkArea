--21406

USE EnertiaLive

SELECT
	*
FROM
	dbo.aaMasAddressXref t0


	INNER JOIN dbo.aaMasAuditChangeHdr t1
		ON t0.AddrTID = try_convert(XML, t1.RowDetails).value('(/aaMasAddress/NEW/AddrTID)[1]', 'INT')

	INNER JOIN dbo.aaMasAuditTable t2
		ON t1.ChgTableTID = t2.AuditTableTID
		AND t2.AuditTableName = 'aaMasAddress'

WHERE 1=1
	AND t1.ChgAdd = 1

	-- If through audit there is a state eff date where pmt is between use that
	-- if not, check if the state has ever changed. If not ever changed use what the current state is
	-- if state has changed and 1 is not met, then use DE

	AUDIT

WHERE AddrTID = 1016196

SELECT * FROM dbo.fbMasHdr WHERE HdrCode = '21406'
SELECT * FROM dbo.aaMasAddress WHERE AddrEntityHID = 1015598



SELECT min(chgdate) FROM dbo.aaMasAuditChangeHdr WHERE ChgAdd = 1
SELECT
	*
FROM
	dbo.aaMasAuditChangeHdr t0

	INNER JOIN dbo.aaMasAuditTable t1
		ON t0.ChgTableTID = t1.AuditTableTID
		AND t1.AuditTableName = 'aaMasAddress'

WHERE
	try_convert(XML, t0.RowDetails).value('(/aaMasAddress/NEW/AddrTID)[1]', 'INT') = 1002576

USE EnertiaLive

SELECT
	*
FROM
	dbo.aaMasAddressXref WHERE AddrTID = 1016196

SELECT * FROM dbo.fbMasHdr WHERE HdrCode = '644859'
SELECT * FROM dbo.aaMasAddress WHERE AddrEntityHID = 1324554

SELECT
	*
FROM
	dbo.aaMasAuditChangeHdr t0

	INNER JOIN dbo.aaMasAuditTable t1
		ON t0.ChgTableTID = t1.AuditTableTID
		AND t1.AuditTableName = 'aaMasAddress'

WHERE
	try_convert(XML, t0.RowDetails).value('(/aaMasAddress/NEW/AddrTID)[1]', 'INT') = 1132585

