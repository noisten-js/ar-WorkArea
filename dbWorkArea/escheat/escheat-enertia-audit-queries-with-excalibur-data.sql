-- #####   #####    #####   #####
-- #    #  #    #  #     #  #    #
-- #####   #####   #     #  #     #
-- #       #  #    #     #  #    #
-- #       #   #    #####   #####

-- This is the right logic for creating an "Add" record based on the Excalibur data
-- Next step is to UNION to the rest of the audit data and ensure that there are no
-- overlapping changes (eff beg/end) and no duplication of changes (same date but 
-- different values or complete duplicates. the resutling dataset should be unique 
-- by AddrTID, ChgDate and LastUpdated and the "Excalibur Add" records must be the 
-- first in the audit chain.

USE EnertiaLive;

		WITH cteAuditBase AS (
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
		
				INNER JOIN dbo.aaMasAuditTable t1
					ON t0.ChgTableTID = t1.AuditTableTID
					AND t1.AuditTableName = 'aaMasAddress'
		
			WHERE 1=1
		)
		,cteAuditEx AS (
			SELECT
				 ChgRecordID				= t0.ChgRecordID
				,ChgDate					= t0.ChgDate
				,AddrTID					= t0.AddrTID
				,OldAddrState				= t0.OldAddrState
				,ChgIndex					= row_number() OVER (PARTITION BY t0.AddrTID ORDER BY t0.ChgDate)
			FROM
				cteAuditBase t0
		)
		,cteMasAddressAuditEx AS (
			SELECT
				 t0.AddrTID
				,t2.ChgRecordID
				,SysEffectiveStart	= convert(DATETIME, t0.LastUpdated)
				,SysEffectiveEnd	= coalesce(t2.ChgDate, getdate())
				,CalcAddrState		= CASE 
										WHEN t2.ChgRecordID IS NULL THEN t1.AddrState
										ELSE t2.OldAddrState
									  END
			FROM
				dbo.aaMasAddressXref t0
		
				INNER JOIN dbo.aaMasAddress t1
					ON t0.AddrTID = t1.AddrTID
		
				LEFT OUTER JOIN cteAuditEx t2
					ON t0.AddrTID = t2.AddrTID
					AND t2.ChgIndex = 1
		
			UNION
		
			SELECT
				 t0.AddrTID
				,t0.ChgRecordID
				,SysEffectiveStart		= t0.ChgDate
				,SysEffectiveEnd		= lead(t0.ChgDate, 1, getdate()) OVER (PARTITION BY t0.AddrTID ORDER BY t0.ChgDate)
				,CalcAddrState			= t0.NewAddrState
			FROM
				cteAuditBase t0
		)

SELECT
	*
FROM
	cteMasAddressAuditEx
ORDER BY AddrTID

SELECT * FROM Integration.enertia.Escheat