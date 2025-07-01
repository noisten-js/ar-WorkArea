USE Integration
GO
/***********************************************************************************

	View Name:			enertia.vMassChange
	Author:				Enterprise Database Development Team
	______________________________________________________________________________

	Purpose:			
	This is the view used by the "Land Administration - Mass Change" Report
	todo: add link to report here
	______________________________________________________________________________

***********************************************************************************/
	CREATE VIEW enertia.vMassChange
	AS

	SELECT
		 XferNoteTID			= t01.XferNoteTID
		,XferDate				= t00.XferDate
		,XferNote				= t00.XferNote
		,XferPct				= t01.XferPct
		,XferSuspCode			= t01.XferSuspCode
		,XferIntTypeCode		= t01.XferIntTypeCode
		,XferDOI				= t00.XferDOI
		,XferSuspense			= t00.XferSuspense
		,XferType				= CASE
									WHEN t11.HdrCode = t06.HdrCode THEN 'Pay Code Change'
									ELSE 'Ownership Change'
								  END

		,DcmlFromTID			= t01.DcmlFromTID
		,FromDcmlDeckCode		= t08.DcmlDeckCode
		,FromDcmlIntCode		= t08.DcmlIntCode
		,FromDcmlSuspCode		= t08.DcmlSuspCode
		,FromDcmlNetRevInt		= t08.DcmlNetRevInt

		,FromOwnerHdrCode		= rtrim(t11.HdrCode)
		,FromOwnerHdrName		= t11.HdrName
		,FromOwnerIntTypeCode	= t12.IntTypeCode
		,FromOwnerSysIntCode	= t12.SysIntCode
		,FromOwnerIntTypeDesc	= t12.TypeDesc

		,FromPropertyHdrCode	= rtrim(t10.HdrCode)
		,FromPropertyHdrName	= t10.HdrName

		,DcmlToTID				= t01.DcmlToTID
		,ToDcmlDeckCode			= t02.DcmlDeckCode
		,ToDcmlIntCode			= t02.DcmlIntCode
		,ToDcmlSuspCode			= t02.DcmlSuspCode
		,ToDcmlNetRevInt		= t02.DcmlNetRevInt

		,ToOwnerHdrCode			= rtrim(t06.HdrCode)
		,ToOwnerHdrName			= t06.HdrName
		,ToOwnerIntType			= t07.IntTypeCode
		,ToOwnerSysIntCode		= t07.SysIntCode
		,ToOwnerIntTypeDesc		= t07.TypeDesc

		,ToPropertyHdrCode		= rtrim(t05.HdrCode)
		,ToPropertyHdrName		= t05.HdrName
	FROM
		EnertiaLive.dbo.aaMasXferNote t00

		INNER JOIN EnertiaLive.dbo.rvMasXferXref t01
			ON t00.XferNoteTID = t01.XferNoteTID

		INNER JOIN EnertiaLive.dbo.rvMasDeckDcml t02
			ON t01.DcmlToTID = t02.DcmlTID

		INNER JOIN EnertiaLive.dbo.rvMasDeckProp t04
			ON t02.DcmlDeckCode = t04.DeckCode

		INNER JOIN EnertiaLive.dbo.fbMasHdr t05
			ON t04.DeckRevPropHID = t05.HdrHID

		INNER JOIN EnertiaLive.dbo.fbMasHdr t06
			ON t02.DcmlOwnHID = t06.HdrHID

		INNER JOIN EnertiaLive.dbo.aaTblIntType t07
			ON t02.DcmlIntCode = t07.IntTypeCode

		INNER JOIN EnertiaLive.dbo.rvMasDeckDcml t08
			ON t01.DcmlFromTID = t08.DcmlTID

		INNER JOIN EnertiaLive.dbo.rvMasDeckProp t09
			ON t08.DcmlDeckCode = t09.DeckCode

		INNER JOIN EnertiaLive.dbo.fbMasHdr t10
			ON t09.DeckRevPropHID = t10.HdrHID

		INNER JOIN EnertiaLive.dbo.fbMasHdr t11
			ON t08.DcmlOwnHID = t11.HdrHID

		INNER JOIN EnertiaLive.dbo.aaTblIntType t12
			ON t08.DcmlIntCode = t12.IntTypeCode
	WHERE 1=1
		AND t00.XferDate BETWEEN '1901-01-01 00:00:00' AND '2078-12-31 11:59:59'
		AND t00.XferBegDate BETWEEN '1901-01-01 00:00:00' AND '2078-12-31 11:59:59'
		AND t01.XferType = 'X'