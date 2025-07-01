USE EDW

------------------------------------------------------------------------------------
-- Refactored Mart.View_Enertia_AFE_Budget_Pivot
------------------------------------------------------------------------------------
	;WITH AFE_Budget_Category_By_Category_Code AS (
		SELECT
			 BudgetAfeTID
			,BudgetAfeCatCode
			,Work_Over_Budget_TID	= [WO   ]
			,Completion_Budget_TID	= [COMPL]
			,Drilling_Budget_TID	= [DRLNG]
			,Other_Budget_TID		= [OTHER]
		FROM
			[EDW_Stage].Stage.Enertia_aeMasAfeCatBudget
		PIVOT ( 
			max(BudgetTID)

		FOR 
			BudgetType IN ( 
				 [OTHER]
				,[DRLNG]
				,[COMPL]
				,[WO   ]
			)
		) AS Pivoted_Budget_Type 
	)
	SELECT
		 AFE_Number								= ltrim(rtrim(t0.AFE_Code))					
		,Budget_Amount							= isnull(Cat_Drill.BudgetAmt, 0) 
												+ isnull(Cat_Compl.BudgetAmt, 0) 
												+ isnull(Cat_Other.BudgetAmt, 0)
												+ isnull(Cat_Workover.BudgetAmt, 0)
		,AFE_Cat_Code							= ltrim(rtrim(AfeCat.AfeCatCode))			
		,AFE_Cat_Desc							= ltrim(rtrim(AfeCat.AfeCatDesc))			
		,Budget_Amount_Supplement				= isnull(Cat_Drill.BudgetSupplementAmt, 0) 
												+ isnull(Cat_Compl.BudgetSupplementAmt, 0)
												+ isnull(Cat_Other.BudgetSupplementAmt, 0) 
												+ isnull(Cat_Workover.BudgetSupplementAmt, 0)	

		,Corporation_Code						= ltrim(rtrim(t0.Operator_Code))				
		,Corporation_Name						= t0.Operator_Name							
		,Default_Corporation_Code				= ltrim(rtrim(t0.Default_Corporation_Code))	
		,Default_Corporation_Name				= t0.Default_Corporation_Name				
		,AFE_Name								= t0.AFE_Name								
		,AFE_Description						= t0.AFE_Description							
		,AFE_Orig_Number						= ltrim(rtrim(t0.AFE_Alpha))					
		,AfeTID									= t0.AFE_Detail_TID							
		,AfeHID									= t0.AFE_HID									
		,AfeOperHID								= t0.AFE_Operator_HID						
		,AFE_Type_Code							= t0.AFE_Type_Code							
		,AFE_Class_Code							= t0.AFE_Class_Code							
		,AFE_Object_Code						= t0.AFE_Object_Code							
		,AFE_Begin_Date							= t0.AFE_Begin_Date							
		,AFE_Completion_Date					= t0.AFE_Complete_Date						
		,AFE_Close_Date							= t0.AFE_Close_Date							
		,AFE_Status_Code						= t0.AFE_Status_Code							
		,AFE_Net_Ownership						= t0.AFE_Net_Ownership						
		,AFE_Cat_Type_Code						= ltrim(rtrim(CatTyp.AfeCatTypeCode))		
		,AFE_Cat_Type_Desc						= ltrim(rtrim(CatTyp.AfeCatTypeDesc))		
		,AFE_Project_Code						= ltrim(rtrim(t0.AFE_Project_Code))			
		,AFE_Project_Desc						= t0.AFE_Project_Description					
		,Budget_AFE_Cat_Code					= ltrim(rtrim(t1.BudgetAfeCatCode))			
		,Budget_Amount_Drilling					= isnull(Cat_Drill.BudgetAmt, 0)				
		,Budget_Amount_Drilling_Supplement		= isnull(Cat_Drill.BudgetSupplementAmt, 0)	
		,Budget_Amount_Completion				= isnull(Cat_Compl.BudgetAmt, 0)				
		,Budget_Amount_Completion_Supplement	= isnull(Cat_Compl.BudgetSupplementAmt, 0)	
		,Budget_Amount_Other					= isnull(Cat_Other.BudgetAmt, 0)				
		,Budget_Amount_Other_Supplement			= isnull(Cat_Other.BudgetSupplementAmt, 0)	
		,Budget_Amount_Workover					= isnull(Cat_Workover.BudgetAmt, 0)			
		,Budget_Amount_Workover_Supplement		= isnull(Cat_Workover.BudgetSupplementAmt, 0)			
		,Budget_Amount_Total					= isnull(Cat_Drill.BudgetAmt, 0) 
												+ isnull(Cat_Compl.BudgetAmt, 0) 
												+ isnull(Cat_Other.BudgetAmt, 0)
												+ isnull(Cat_Workover.BudgetAmt, 0) 
												+ isnull(Cat_Drill.BudgetSupplementAmt, 0)
												+ isnull(Cat_Compl.BudgetSupplementAmt, 0) 
												+ isnull(Cat_Other.BudgetSupplementAmt, 0)
												+ isnull(Cat_Workover.BudgetSupplementAmt, 0)	 
	FROM
		Translate.Enertia_AFEs t0

		--Billing Category
		LEFT JOIN AFE_Budget_Category_By_Category_Code AS t1
			ON t0.AFE_Detail_TID = t1.BudgetAfeTID

		--Pivoted Categories
		LEFT JOIN [EDW_Stage].Stage.Enertia_aeMasAfeCatBudget	AS Cat_Drill
			ON Cat_Drill.BudgetTID = t1.Drilling_Budget_TID
		
		LEFT JOIN [EDW_Stage].Stage.Enertia_aeMasAfeCatBudget	AS Cat_Compl
			ON t1.Completion_Budget_TID = Cat_Compl.BudgetTID
		
		LEFT JOIN [EDW_Stage].Stage.Enertia_aeMasAfeCatBudget	AS Cat_Other
			ON t1.Other_Budget_TID = Cat_Other.BudgetTID
		
		LEFT JOIN [EDW_Stage].Stage.Enertia_aeMasAfeCatBudget	AS Cat_Workover
			ON t1.Work_Over_Budget_TID = Cat_Workover.BudgetTID

		
		LEFT JOIN [EDW_Stage].Stage.Enertia_aeTblAfeCat			AS AfeCat
			ON t1.BudgetAfeCatCode = AfeCat.AfeCatCode
		
		LEFT JOIN [EDW_Stage].Stage.Enertia_aeTblAfeCatType		AS CatTyp
			ON AfeCat.AfeCatTypeCode = CatTyp.AfeCatTypeCode

	WHERE 1=1
		AND AFE_Detail_TID = 1000015

------------------------------------------------------------------------------------
-- Refactored Mart.Seven_Lakes_AFE_Budget_Pivot
------------------------------------------------------------------------------------
	SELECT
		 AFE_Number								= t0.AFE_Number
		,Budget_Amount							= t0.Budget_Amount
		,AFE_Cat_Code							= t1.AFE_Cat_Code
		,AFE_Cat_Desc							= t1.AFE_Cat_Desc
		,Budget_Amount_Supplement				= t0.Budget_Amount_Supplement
	 
		,Corporation_Code						= t0.Corporation_Code
		,Corporation_Name						= t0.Corporation_Name
		,Default_Corporation_Code				= t0.Default_Corporation_Code
		,Default_Corporation_Name				= t0.Default_Corporation_Name
		,AFE_Name								= t0.AFE_Name
		,AFE_Description						= t0.AFE_Description
		,AFE_Orig_Number						= t0.AFE_Orig_Number
		,AfeTID									= t0.AfeTID
		,AfeHID									= t0.AfeHID
		,AfeOperHID								= t0.AfeOperHID
		,AFE_Type_Code							= t0.AFE_Type_Code
		,AFE_Class_Code							= t0.AFE_Class_Code
		,AFE_Object_Code						= t0.AFE_Object_Code
		,AFE_Begin_Date							= t0.AFE_Begin_Date
		,AFE_Completion_Date					= t0.AFE_Completion_Date
		,AFE_Close_Date							= t0.AFE_Close_Date
		,AFE_Status_Code						= t0.AFE_Status_Code
		,AFE_Net_Ownership						= t0.AFE_Net_Ownership
		,AFE_Cat_Type_Code						= t0.AFE_Cat_Type_Code
		,AFE_Cat_Type_Desc						= t0.AFE_Cat_Type_Desc
		,AFE_Project_Code						= t0.AFE_Project_Code
		,AFE_Project_Desc						= t0.AFE_Project_Desc
		,AFE_Cat_Code_Orig						= t0.AFE_Cat_Code
		,AFE_Cat_Desc_Orig						= t0.AFE_Cat_Desc
		,Budget_AFE_Cat_Code					= t0.Budget_AFE_Cat_Code
		,Budget_Amount_Drilling					= t0.Budget_Amount_Drilling
		,Budget_Amount_Drilling_Supplement		= t0.Budget_Amount_Drilling_Supplement
		,Budget_Amount_Completion				= t0.Budget_Amount_Completion
		,Budget_Amount_Completion_Supplement	= t0.Budget_Amount_Completion_Supplement
		,Budget_Amount_Other					= t0.Budget_Amount_Other
		,Budget_Amount_Other_Supplement			= t0.Budget_Amount_Other_Supplement
		,Budget_Amount_Workover					= t0.Budget_Amount_Workover
		,Budget_Amount_Workover_Supplement		= t0.Budget_Amount_Workover_Supplement
		,Budget_Amount_Total					= t0.Budget_Amount_Total
	FROM 
		(
			SELECT
				 Corporation_Code						= s0.Corporation_Code
				,Corporation_Name						= s0.Corporation_Name
				,Default_Corporation_Code				= s0.Default_Corporation_Code
				,Default_Corporation_Name				= s0.Default_Corporation_Name
				,AFE_Number								= s0.AFE_Number
				,AFE_Name								= s0.AFE_Name
				,AFE_Description						= s0.AFE_Description
				,AFE_Orig_Number						= s0.AFE_Orig_Number
				,AfeTID									= s0.AfeTID
				,AfeHID									= s0.AfeHID
				,AfeOperHID								= s0.AfeOperHID
				,AFE_Type_Code							= s0.AFE_Type_Code
				,AFE_Class_Code							= s0.AFE_Class_Code
				,AFE_Object_Code						= s0.AFE_Object_Code
				,AFE_Begin_Date							= s0.AFE_Begin_Date
				,AFE_Completion_Date					= s0.AFE_Completion_Date
				,AFE_Close_Date							= s0.AFE_Close_Date
				,AFE_Status_Code						= s0.AFE_Status_Code
				,AFE_Net_Ownership						= s0.AFE_Net_Ownership
				,AFE_Cat_Type_Code						= s0.AFE_Cat_Type_Code
				,AFE_Cat_Type_Desc						= s0.AFE_Cat_Type_Desc
				,AFE_Project_Code						= s0.AFE_Project_Code
				,AFE_Project_Desc						= s0.AFE_Project_Desc
				,AFE_Cat_Code							= s0.AFE_Cat_Code
				,AFE_Cat_Desc							= s0.AFE_Cat_Desc
				,Budget_AFE_Cat_Code					= s0.Budget_AFE_Cat_Code
				,Budget_Amount_Drilling					= s0.Budget_Amount_Drilling
				,Budget_Amount_Drilling_Supplement		= s0.Budget_Amount_Drilling_Supplement
				,Budget_Amount_Completion				= s0.Budget_Amount_Completion
				,Budget_Amount_Completion_Supplement	= s0.Budget_Amount_Completion_Supplement
				,Budget_Amount_Other					= s0.Budget_Amount_Other
				,Budget_Amount_Other_Supplement			= s0.Budget_Amount_Other_Supplement
				,Budget_Amount_Workover					= s0.Budget_Amount_Workover
				,Budget_Amount_Workover_Supplement		= s0.Budget_Amount_Workover_Supplement
				,Budget_Amount							= s0.Budget_Amount
				,Budget_Amount_Supplement				= s0.Budget_Amount_Supplement
				,Budget_Amount_Total					= s0.Budget_Amount_Total
				,Active									= s1.Active
				,AFE_Type								= s1.AFE_Type
				,AFE_Cat_Code_Modified					= CASE
															WHEN s1.Original IS NOT NULL AND s1.Active = 'Yes' THEN s1.Modified
															ELSE s0.AFE_Cat_Code
														  END
			FROM
				Mart.View_Enertia_AFE_Budget_Pivot s0
	
				LEFT OUTER JOIN EDW_Stage.Stage_Manual.Enertia_to_Wellview_Billing_Code_Mapping s1
					ON s0.AFE_Cat_Code = s1.Original
			
			WHERE 1=1
				AND Corporation_Name = 'Antero Resources Corporation'
		) t0
	
		LEFT OUTER JOIN
			(   
				SELECT DISTINCT
					AFE_Cat_Code,
					AFE_Cat_Desc
				FROM 
					Mart.View_Enertia_AFE_Budget_Pivot
				WHERE 
					Corporation_Name = 'Antero Resources Corporation'
		) t1
			ON t0.AFE_Cat_Code_Modified = t1.AFE_Cat_Code