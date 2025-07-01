:SETVAR enertia_db EnertiaLive
USE EnertiaExtension
		;WITH cteA AS (
		SELECT
			 BudgetAfeTID
			,BudgetAfeCatCode
			,COMPL
			,DRLNG
			,OTHER
			,TFC
			,WO
		FROM (
			SELECT
				 BudgetAfeTID
				,BudgetAfeCatCode
				,BudgetType
				,BudgetAmt
			FROM
				[$(enertia_db)].dbo.aeMasAfeCatBudget
		) AS pvt_src
		PIVOT (
			sum(BudgetAmt)
			FOR 
				BudgetType IN (COMPL, DRLNG, OTHER, TFC, WO)
		) AS pvt
		)
		SELECT
			t0.BudgetAfeTID
		   ,t0.BudgetAfeCatCode
		   ,t0.COMPL
		   ,t0.DRLNG
		   ,t0.OTHER
		   ,t0.TFC
		   ,t0.WO

		   ,t2.HdrCode
		   ,t1.AfeStatusCode
		   ,t3.HdrTypeClass
		   ,t3.HdrTypeCode
		   ,t3.HdrTypeName
		  
		  ,t4.HdrTypeTID
		  ,t4.HdrCode
		  ,t4.HdrName
		  
		  ,A4.HdrTypeClass
		  ,A4.HdrTypeCode
		  ,A4.HdrTypeName
		FROM
			cteA t0

			INNER JOIN EnertiaLive.dbo.aeMasAfe t1
				ON t0.BudgetAfeTID = t1.AfeTID

			INNER JOIN EnertiaLive.dbo.fbMasHdr t2
				ON t1.AfeHID = t2.HdrHID

			INNER JOIN EnertiaLive.dbo.fbMasHdrType t3
				ON t2.HdrTypeTID = t3.HdrTypeTID

			INNER JOIN EnertiaLive.dbo.fbMasHdr t4
				
				INNER JOIN EnertiaLive.dbo.fbMasHdrType A4
					ON t4.HdrTypeTID = A4.HdrTypeTID
					AND A4.HdrTypeCode = 'Corp'

				ON t1.AfeOperHID = t4.HdrHID
				AND t4.HdrName = 'Antero Resources Corporation'
