/***********************************************************************************

	Procedure Name:		Mart.UpdateEnertiaSpendAnalysisGrossEx
	Author:				Enterprise Database Development Team
	______________________________________________________________________________

	Purpose:			
	  This is a work around version of the Mart.Update_Enertia_Spend_Analysis
	  stored procedure. The current procedure is frequently failing when during
	  collection of data from 2012 and earlier. The whole process is being 
	  analyzed with the intention to re-write the entire process with better
	  design patterns, standards and more efficient code. 

	  This procedure allows the date that data is pulled back from to be done
	  in one query instead of broken into smaller queries (the over-use of
	  nesting from the Mart.View_Enertia_Transaction being repeated over and
	  over is the suspected root cause of this process hanging during procedure
	  compile operations (unconfirmed)).

	  The intention of this process is to reduce the frequency of failures 
	  caused by hung compilation processes to be used until a more stable
	  and better designed procedure is implemented to replace both.

	Remarks:
	  As this is only a work around without intention to be permanent the 
	  existing design patterns like "trunc and load" nesting sub-views
	  iterative style and most formatting has been retained. Section headers
	  standard prints with dates and row counts have been added and SELECT *
	  have been replaced with explicilty expanded. No transaction or error 
	  handling was added and all data contracts are expected to remain.

	  The column count for some of the tables is very wide. For readability,
	  when the column lists exceeds 15 columns each column in both the 
	  INSERT INTO ... SELECT portions were commented with:
		-- insert_list (schema.table)
		-- select_list (schema.table)
	  respectively. This deviates from normal commenting standards strictly for 
	  readability while scrolling the long lists of columns. The intention
	  is to make knowing what part of the INSERT INTO ... SELECT statement a 
	  line with a column is related to.
	______________________________________________________________________________

***********************************************************************************/
	CREATE PROCEDURE Mart.UpdateEnertiaSpendAnalysisGrossEx (					  
		@SyncDate DATE
	)
	AS
		BEGIN

			------------------------------------------------------------------------
			-- Variable Declaration and Parameter Override
			------------------------------------------------------------------------		
				DECLARE
					 @ErrPos			VARCHAR(512)	= ''
					,@ErrMsg			VARCHAR(2048)	= ''
					,@MsgTitle			VARCHAR(256)	= concat('Execute ', object_schema_name(@@procid), '.', object_name(@@procid))
				
				DECLARE 
					 @sdate				DATETIME 

			------------------------------------------------------------------------
			-- Set runtime values
			------------------------------------------------------------------------
				SET @ErrPos = concat(@MsgTitle, '; Set runtime values')
				PRINT concat(sysdatetime(),' | INFO | ',@ErrPos)
				
				  -- @sdate
				  PRINT concat(sysdatetime(),' | INFO | ',@ErrPos,'; @sdate')
				  SELECT @sdate = coaleasce(@SyncDate, datefromparts(datepart(YEAR, dateadd(YEAR, -5, sysdatetime())), 1, 1))

			------------------------------------------------------------------------
			-- Truncate Mart.RPT_Enertia_Transaction
			------------------------------------------------------------------------
				SET @ErrPos = concat(@MsgTitle, '; Truncate Mart.RPT_Enertia_Transaction'
				TRUNCATE TABLE Mart.RPT_Enertia_Transaction
			
			------------------------------------------------------------------------
			-- Populate Mart.RPT_Enertia_Transaction
			------------------------------------------------------------------------
				SET @ErrPos = concat(@MsgTitle, '; Populate Mart.RPT_Enertia_Transaction ( ', @sdate, ' )')
				PRINT concat(sysdatetime(), ' | INFO | ' , @ErrPos)

				INSERT INTO 
					Mart.RPT_Enertia_Transaction (
						 TxnTID									-- insert_list (Mart.RPT_Enertia_Transaction)
						,TxnDtlTID								-- insert_list (Mart.RPT_Enertia_Transaction)
						,TxnHdrTID								-- insert_list (Mart.RPT_Enertia_Transaction)
						,CorpCode								-- insert_list (Mart.RPT_Enertia_Transaction)
						,CorpName								-- insert_list (Mart.RPT_Enertia_Transaction)
						,VendorCode								-- insert_list (Mart.RPT_Enertia_Transaction)
						,VendorName								-- insert_list (Mart.RPT_Enertia_Transaction)
						,InvoiceNum								-- insert_list (Mart.RPT_Enertia_Transaction)
						,TxnAmount								-- insert_list (Mart.RPT_Enertia_Transaction)
						,TxnNetAmount							-- insert_list (Mart.RPT_Enertia_Transaction)
						,TxnGrossAmount							-- insert_list (Mart.RPT_Enertia_Transaction)
						,TxnPayableAmt							-- insert_list (Mart.RPT_Enertia_Transaction)
						,TxnDesc								-- insert_list (Mart.RPT_Enertia_Transaction)
						,TxnTypeCode							-- insert_list (Mart.RPT_Enertia_Transaction)
						,TxnTypeDesc							-- insert_list (Mart.RPT_Enertia_Transaction)
						,SysTypeTxnTypeCode						-- insert_list (Mart.RPT_Enertia_Transaction)
						,TxnInvDate								-- insert_list (Mart.RPT_Enertia_Transaction)
						,TxnSvcDate								-- insert_list (Mart.RPT_Enertia_Transaction)
						,TxnAcctgDate							-- insert_list (Mart.RPT_Enertia_Transaction)
						,PropHdrHID								-- insert_list (Mart.RPT_Enertia_Transaction)
						,PropCode								-- insert_list (Mart.RPT_Enertia_Transaction)
						,PropName								-- insert_list (Mart.RPT_Enertia_Transaction)
						,PropType								-- insert_list (Mart.RPT_Enertia_Transaction)
						,TxnAfeCatCode							-- insert_list (Mart.RPT_Enertia_Transaction)
						,AfeCode								-- insert_list (Mart.RPT_Enertia_Transaction)
						,AfeName								-- insert_list (Mart.RPT_Enertia_Transaction)
						,AfeName_Alpha							-- insert_list (Mart.RPT_Enertia_Transaction)
						,TxnBillCatCode							-- insert_list (Mart.RPT_Enertia_Transaction)
						,BillCatCode							-- insert_list (Mart.RPT_Enertia_Transaction)
						,BillCatTypeCode						-- insert_list (Mart.RPT_Enertia_Transaction)
						,BillCatGrpCode							-- insert_list (Mart.RPT_Enertia_Transaction)
						,BillCatSummCode						-- insert_list (Mart.RPT_Enertia_Transaction)
						,BillCatAfeCatCode						-- insert_list (Mart.RPT_Enertia_Transaction)
						,BillCatDesc							-- insert_list (Mart.RPT_Enertia_Transaction)
						,BillCatJIB								-- insert_list (Mart.RPT_Enertia_Transaction)
						,BillCatComment							-- insert_list (Mart.RPT_Enertia_Transaction)
						,TypePropClassCode						-- insert_list (Mart.RPT_Enertia_Transaction)
						,TypeDesc								-- insert_list (Mart.RPT_Enertia_Transaction)
						,TxnAcctHID								-- insert_list (Mart.RPT_Enertia_Transaction)
						,AccountCode							-- insert_list (Mart.RPT_Enertia_Transaction)
						,AccountName							-- insert_list (Mart.RPT_Enertia_Transaction)
						,CapexOpex_Billing						-- insert_list (Mart.RPT_Enertia_Transaction)
						,CapexOpex								-- insert_list (Mart.RPT_Enertia_Transaction)
						,InqSection								-- insert_list (Mart.RPT_Enertia_Transaction)
						,InqClass								-- insert_list (Mart.RPT_Enertia_Transaction)
						,InqDetail								-- insert_list (Mart.RPT_Enertia_Transaction)
						,InqItem								-- insert_list (Mart.RPT_Enertia_Transaction)
						,Opex_Cost_Category						-- insert_list (Mart.RPT_Enertia_Transaction)
						,Opex_Fixed_or_Variable					-- insert_list (Mart.RPT_Enertia_Transaction)
						,AssetActivity2							-- insert_list (Mart.RPT_Enertia_Transaction)
						,AssetActivity							-- insert_list (Mart.RPT_Enertia_Transaction)
						,Gathering_Activity						-- insert_list (Mart.RPT_Enertia_Transaction)
						,Compression_Activity					-- insert_list (Mart.RPT_Enertia_Transaction)
						,AfeCatCode_Land						-- insert_list (Mart.RPT_Enertia_Transaction)
						,Midstream_Land							-- insert_list (Mart.RPT_Enertia_Transaction)
						,Midstream_Projects						-- insert_list (Mart.RPT_Enertia_Transaction)
						,Midstream_Projects2					-- insert_list (Mart.RPT_Enertia_Transaction)
						,Midstream_Operations					-- insert_list (Mart.RPT_Enertia_Transaction)
						,Midstream_Operations2					-- insert_list (Mart.RPT_Enertia_Transaction)
						,TxnHdrTxnBalance						-- insert_list (Mart.RPT_Enertia_Transaction)
						,TxnDtlTxnBalance						-- insert_list (Mart.RPT_Enertia_Transaction)
						,TxnDocRefNo							-- insert_list (Mart.RPT_Enertia_Transaction)
						,ImportNumber							-- insert_list (Mart.RPT_Enertia_Transaction)
						,TxnBilled								-- insert_list (Mart.RPT_Enertia_Transaction)
						,TxnReversal							-- insert_list (Mart.RPT_Enertia_Transaction)
						,TxnReversed							-- insert_list (Mart.RPT_Enertia_Transaction)
						,TxnCorrecting							-- insert_list (Mart.RPT_Enertia_Transaction)
						,TxnPpaProcessTID						-- insert_list (Mart.RPT_Enertia_Transaction)
						,TxnDeckCode							-- insert_list (Mart.RPT_Enertia_Transaction)
						,BatchAcctDate							-- insert_list (Mart.RPT_Enertia_Transaction)
						,BatchHistorical						-- insert_list (Mart.RPT_Enertia_Transaction)
						,BatchPosted							-- insert_list (Mart.RPT_Enertia_Transaction)
						,Txn88Reportable						-- insert_list (Mart.RPT_Enertia_Transaction)
						,TxnAfeHID								-- insert_list (Mart.RPT_Enertia_Transaction)
						,TxnAllocated							-- insert_list (Mart.RPT_Enertia_Transaction)
						,TxnAllocGrpHID							-- insert_list (Mart.RPT_Enertia_Transaction)
						,TxnBatchTID							-- insert_list (Mart.RPT_Enertia_Transaction)
						,TxnCorpHID								-- insert_list (Mart.RPT_Enertia_Transaction)
						,TxnJIBSuppress							-- insert_list (Mart.RPT_Enertia_Transaction)
						,TxnOrigEnt								-- insert_list (Mart.RPT_Enertia_Transaction)
						,TxnPosted								-- insert_list (Mart.RPT_Enertia_Transaction)
						,TxnSrcCode								-- insert_list (Mart.RPT_Enertia_Transaction)
						,SysTypeTxnSrcCode						-- insert_list (Mart.RPT_Enertia_Transaction)
						,TxnTypeTxnSrcCode						-- insert_list (Mart.RPT_Enertia_Transaction)
						,TxnSummarized							-- insert_list (Mart.RPT_Enertia_Transaction)
						,TxnVendorHID							-- insert_list (Mart.RPT_Enertia_Transaction)
						,TxnVoid								-- insert_list (Mart.RPT_Enertia_Transaction)
						,BatchNumber							-- insert_list (Mart.RPT_Enertia_Transaction)
						,BatchDesc								-- insert_list (Mart.RPT_Enertia_Transaction)
						,OriginalBatch							-- insert_list (Mart.RPT_Enertia_Transaction)
						,ReversalBatch							-- insert_list (Mart.RPT_Enertia_Transaction)
						,Amount_Payment							-- insert_list (Mart.RPT_Enertia_Transaction)
						,Amount_Discount						-- insert_list (Mart.RPT_Enertia_Transaction)
						,Amount_Bckwh							-- insert_list (Mart.RPT_Enertia_Transaction)
						,Amount_Bank_Clear_Achout				-- insert_list (Mart.RPT_Enertia_Transaction)
						,Amount_Bank_Clear_Check				-- insert_list (Mart.RPT_Enertia_Transaction)
						,Amount_Bank_Clear_Wire					-- insert_list (Mart.RPT_Enertia_Transaction)
						,AfeTID									-- insert_list (Mart.RPT_Enertia_Transaction)
						,BankClearAmt							-- insert_list (Mart.RPT_Enertia_Transaction)
						,BankTxnAmount							-- insert_list (Mart.RPT_Enertia_Transaction)
						,BankTxnDate							-- insert_list (Mart.RPT_Enertia_Transaction)
						,BankTxnNumber							-- insert_list (Mart.RPT_Enertia_Transaction)
						,BankTxnStatus							-- insert_list (Mart.RPT_Enertia_Transaction)
						,BankTxnType							-- insert_list (Mart.RPT_Enertia_Transaction)
						,CorpTID								-- insert_list (Mart.RPT_Enertia_Transaction)
						,CorrectingBatch						-- insert_list (Mart.RPT_Enertia_Transaction)
						,DtlAdjAmt								-- insert_list (Mart.RPT_Enertia_Transaction)
						,DtlAdjDate								-- insert_list (Mart.RPT_Enertia_Transaction)
						,DtlAdjDesc								-- insert_list (Mart.RPT_Enertia_Transaction)
						,DtlAdjTypeCode							-- insert_list (Mart.RPT_Enertia_Transaction)
						,ProdCode								-- insert_list (Mart.RPT_Enertia_Transaction)
						,ProdDesc								-- insert_list (Mart.RPT_Enertia_Transaction)
						,PropClassAsset							-- insert_list (Mart.RPT_Enertia_Transaction)
						,PropClassBillCat						-- insert_list (Mart.RPT_Enertia_Transaction)
						,PropClassDesc							-- insert_list (Mart.RPT_Enertia_Transaction)
						,PropClassExp							-- insert_list (Mart.RPT_Enertia_Transaction)
						,SysProdClass							-- insert_list (Mart.RPT_Enertia_Transaction)
						,SysProdCode							-- insert_list (Mart.RPT_Enertia_Transaction)
						,SysPropClassCode						-- insert_list (Mart.RPT_Enertia_Transaction)
						,SysPropClassDesc						-- insert_list (Mart.RPT_Enertia_Transaction)
						,TxnAtrCode								-- insert_list (Mart.RPT_Enertia_Transaction)
						,TxnAtrType								-- insert_list (Mart.RPT_Enertia_Transaction)
						,TxnBalance								-- insert_list (Mart.RPT_Enertia_Transaction)
						,TxnCurrency							-- insert_list (Mart.RPT_Enertia_Transaction)
						,TxnCurrencyGrossAmount					-- insert_list (Mart.RPT_Enertia_Transaction)
						,TxnCurrencyNetAmount					-- insert_list (Mart.RPT_Enertia_Transaction)
						,TxnDateReceived						-- insert_list (Mart.RPT_Enertia_Transaction)
						,TxnDiscount							-- insert_list (Mart.RPT_Enertia_Transaction)
						,TxnDiscountDate						-- insert_list (Mart.RPT_Enertia_Transaction)
						,TxnDueDate								-- insert_list (Mart.RPT_Enertia_Transaction)
						,TxnEquipType							-- insert_list (Mart.RPT_Enertia_Transaction)
						,TxnInterest							-- insert_list (Mart.RPT_Enertia_Transaction)
						,TxnInvNo								-- insert_list (Mart.RPT_Enertia_Transaction)
						,TxnPayableAcctHID						-- insert_list (Mart.RPT_Enertia_Transaction)
						,TxnPONumber							-- insert_list (Mart.RPT_Enertia_Transaction)
						,TxnPropHID								-- insert_list (Mart.RPT_Enertia_Transaction)
						,TxnQuantity							-- insert_list (Mart.RPT_Enertia_Transaction)
						,TxnTypeComment							-- insert_list (Mart.RPT_Enertia_Transaction)
						,TxnTypeTID								-- insert_list (Mart.RPT_Enertia_Transaction)
						,TxnTypeUserDefCode						-- insert_list (Mart.RPT_Enertia_Transaction)
						,TxnUomCode								-- insert_list (Mart.RPT_Enertia_Transaction)
						,TxnVendorAddrTID						-- insert_list (Mart.RPT_Enertia_Transaction)
						,TxnVendorName							-- insert_list (Mart.RPT_Enertia_Transaction)
						,VendTID								-- insert_list (Mart.RPT_Enertia_Transaction)
						,TxnBillingCorpHID						-- insert_list (Mart.RPT_Enertia_Transaction)
						,Well_ID								-- insert_list (Mart.RPT_Enertia_Transaction)
						,Well_Well_Name							-- insert_list (Mart.RPT_Enertia_Transaction)
						,Well_Pad_Name							-- insert_list (Mart.RPT_Enertia_Transaction)
						,Well_Pod_Name							-- insert_list (Mart.RPT_Enertia_Transaction)
						,Well_Prospect							-- insert_list (Mart.RPT_Enertia_Transaction)
						,Well_State								-- insert_list (Mart.RPT_Enertia_Transaction)
						,Well_County							-- insert_list (Mart.RPT_Enertia_Transaction)
						,Well_Formation							-- insert_list (Mart.RPT_Enertia_Transaction)
						,Well_Surface_Spud_Date					-- insert_list (Mart.RPT_Enertia_Transaction)
						,Well_Drilling_Pause_Date				-- insert_list (Mart.RPT_Enertia_Transaction)
						,Well_Resume_Drilling_Date				-- insert_list (Mart.RPT_Enertia_Transaction)
						,Well_Final_Rig_Release					-- insert_list (Mart.RPT_Enertia_Transaction)
						,Well_Frac_Start_Date					-- insert_list (Mart.RPT_Enertia_Transaction)
						,Well_Frac_End_Date						-- insert_list (Mart.RPT_Enertia_Transaction)
						,Well_Drillout_Start_Date				-- insert_list (Mart.RPT_Enertia_Transaction)
						,Well_Drillout_End_Date					-- insert_list (Mart.RPT_Enertia_Transaction)
						,Well_First_Sales_Date					-- insert_list (Mart.RPT_Enertia_Transaction)
						,Well_Total_Measured_Depth				-- insert_list (Mart.RPT_Enertia_Transaction)
						,Well_Lateral_Length_Actual				-- insert_list (Mart.RPT_Enertia_Transaction)
						,Well_Lateral_Length_Planned			-- insert_list (Mart.RPT_Enertia_Transaction)
						,Well_Configuration						-- insert_list (Mart.RPT_Enertia_Transaction)
						,Well_Cost_Center						-- insert_list (Mart.RPT_Enertia_Transaction)
						,Well_Pad_Lateral_Length				-- insert_list (Mart.RPT_Enertia_Transaction)
						,Well_Stage_Count						-- insert_list (Mart.RPT_Enertia_Transaction)
						,Pad_Stage_count						-- insert_list (Mart.RPT_Enertia_Transaction)
						,Well_Proppant							-- insert_list (Mart.RPT_Enertia_Transaction)
						,Well_Proppant_Load						-- insert_list (Mart.RPT_Enertia_Transaction)
						,Well_Recover_Load						-- insert_list (Mart.RPT_Enertia_Transaction)
						,ETL_Load_Date							-- insert_list (Mart.RPT_Enertia_Transaction)
						,AFE_Inquiry							-- insert_list (Mart.RPT_Enertia_Transaction)
						,Mgmt_Inquiry							-- insert_list (Mart.RPT_Enertia_Transaction)
						,APJIB_Inquiry							-- insert_list (Mart.RPT_Enertia_Transaction)
						,SpendHeader							-- insert_list (Mart.RPT_Enertia_Transaction)
						,SpendType								-- insert_list (Mart.RPT_Enertia_Transaction)
					)
				SELECT
					 TxnTID									-- select_list (Mart.RPT_Enertia_Transaction)
					,TxnDtlTID								-- select_list (Mart.RPT_Enertia_Transaction)
					,TxnHdrTID								-- select_list (Mart.RPT_Enertia_Transaction)
					,CorpCode								-- select_list (Mart.RPT_Enertia_Transaction)
					,CorpName								-- select_list (Mart.RPT_Enertia_Transaction)
					,VendorCode								-- select_list (Mart.RPT_Enertia_Transaction)
					,VendorName								-- select_list (Mart.RPT_Enertia_Transaction)
					,InvoiceNum								-- select_list (Mart.RPT_Enertia_Transaction)
					,TxnAmount								-- select_list (Mart.RPT_Enertia_Transaction)
					,TxnNetAmount							-- select_list (Mart.RPT_Enertia_Transaction)
					,TxnGrossAmount							-- select_list (Mart.RPT_Enertia_Transaction)
					,TxnPayableAmt							-- select_list (Mart.RPT_Enertia_Transaction)
					,TxnDesc								-- select_list (Mart.RPT_Enertia_Transaction)
					,TxnTypeCode							-- select_list (Mart.RPT_Enertia_Transaction)
					,TxnTypeDesc							-- select_list (Mart.RPT_Enertia_Transaction)
					,SysTypeTxnTypeCode						-- select_list (Mart.RPT_Enertia_Transaction)
					,TxnInvDate								-- select_list (Mart.RPT_Enertia_Transaction)
					,TxnSvcDate								-- select_list (Mart.RPT_Enertia_Transaction)
					,TxnAcctgDate							-- select_list (Mart.RPT_Enertia_Transaction)
					,PropHdrHID								-- select_list (Mart.RPT_Enertia_Transaction)
					,PropCode								-- select_list (Mart.RPT_Enertia_Transaction)
					,PropName								-- select_list (Mart.RPT_Enertia_Transaction)
					,PropType								-- select_list (Mart.RPT_Enertia_Transaction)
					,TxnAfeCatCode							-- select_list (Mart.RPT_Enertia_Transaction)
					,AfeCode								-- select_list (Mart.RPT_Enertia_Transaction)
					,AfeName								-- select_list (Mart.RPT_Enertia_Transaction)
					,AfeName_Alpha							-- select_list (Mart.RPT_Enertia_Transaction)
					,TxnBillCatCode							-- select_list (Mart.RPT_Enertia_Transaction)
					,BillCatCode							-- select_list (Mart.RPT_Enertia_Transaction)
					,BillCatTypeCode						-- select_list (Mart.RPT_Enertia_Transaction)
					,BillCatGrpCode							-- select_list (Mart.RPT_Enertia_Transaction)
					,BillCatSummCode						-- select_list (Mart.RPT_Enertia_Transaction)
					,BillCatAfeCatCode						-- select_list (Mart.RPT_Enertia_Transaction)
					,BillCatDesc							-- select_list (Mart.RPT_Enertia_Transaction)
					,BillCatJIB								-- select_list (Mart.RPT_Enertia_Transaction)
					,BillCatComment							-- select_list (Mart.RPT_Enertia_Transaction)
					,TypePropClassCode						-- select_list (Mart.RPT_Enertia_Transaction)
					,TypeDesc								-- select_list (Mart.RPT_Enertia_Transaction)
					,TxnAcctHID								-- select_list (Mart.RPT_Enertia_Transaction)
					,AccountCode							-- select_list (Mart.RPT_Enertia_Transaction)
					,AccountName							-- select_list (Mart.RPT_Enertia_Transaction)
					,CapexOpex_Billing						-- select_list (Mart.RPT_Enertia_Transaction)
					,CapexOpex								-- select_list (Mart.RPT_Enertia_Transaction)
					,InqSection								-- select_list (Mart.RPT_Enertia_Transaction)
					,InqClass								-- select_list (Mart.RPT_Enertia_Transaction)
					,InqDetail								-- select_list (Mart.RPT_Enertia_Transaction)
					,InqItem								-- select_list (Mart.RPT_Enertia_Transaction)
					,Opex_Cost_Category						-- select_list (Mart.RPT_Enertia_Transaction)
					,Opex_Fixed_or_Variable					-- select_list (Mart.RPT_Enertia_Transaction)
					,AssetActivity2							-- select_list (Mart.RPT_Enertia_Transaction)
					,AssetActivity							-- select_list (Mart.RPT_Enertia_Transaction)
					,Gathering_Activity						-- select_list (Mart.RPT_Enertia_Transaction)
					,Compression_Activity					-- select_list (Mart.RPT_Enertia_Transaction)
					,AfeCatCode_Land						-- select_list (Mart.RPT_Enertia_Transaction)
					,Midstream_Land							-- select_list (Mart.RPT_Enertia_Transaction)
					,Midstream_Projects						-- select_list (Mart.RPT_Enertia_Transaction)
					,Midstream_Projects2					-- select_list (Mart.RPT_Enertia_Transaction)
					,Midstream_Operations					-- select_list (Mart.RPT_Enertia_Transaction)
					,Midstream_Operations2					-- select_list (Mart.RPT_Enertia_Transaction)
					,TxnHdrTxnBalance						-- select_list (Mart.RPT_Enertia_Transaction)
					,TxnDtlTxnBalance						-- select_list (Mart.RPT_Enertia_Transaction)
					,TxnDocRefNo							-- select_list (Mart.RPT_Enertia_Transaction)
					,ImportNumber							-- select_list (Mart.RPT_Enertia_Transaction)
					,TxnBilled								-- select_list (Mart.RPT_Enertia_Transaction)
					,TxnReversal							-- select_list (Mart.RPT_Enertia_Transaction)
					,TxnReversed							-- select_list (Mart.RPT_Enertia_Transaction)
					,TxnCorrecting							-- select_list (Mart.RPT_Enertia_Transaction)
					,TxnPpaProcessTID						-- select_list (Mart.RPT_Enertia_Transaction)
					,TxnDeckCode							-- select_list (Mart.RPT_Enertia_Transaction)
					,BatchAcctDate							-- select_list (Mart.RPT_Enertia_Transaction)
					,BatchHistorical						-- select_list (Mart.RPT_Enertia_Transaction)
					,BatchPosted							-- select_list (Mart.RPT_Enertia_Transaction)
					,Txn88Reportable						-- select_list (Mart.RPT_Enertia_Transaction)
					,TxnAfeHID								-- select_list (Mart.RPT_Enertia_Transaction)
					,TxnAllocated							-- select_list (Mart.RPT_Enertia_Transaction)
					,TxnAllocGrpHID							-- select_list (Mart.RPT_Enertia_Transaction)
					,TxnBatchTID							-- select_list (Mart.RPT_Enertia_Transaction)
					,TxnCorpHID								-- select_list (Mart.RPT_Enertia_Transaction)
					,TxnJIBSuppress							-- select_list (Mart.RPT_Enertia_Transaction)
					,TxnOrigEnt								-- select_list (Mart.RPT_Enertia_Transaction)
					,TxnPosted								-- select_list (Mart.RPT_Enertia_Transaction)
					,TxnSrcCode								-- select_list (Mart.RPT_Enertia_Transaction)
					,SysTypeTxnSrcCode						-- select_list (Mart.RPT_Enertia_Transaction)
					,TxnTypeTxnSrcCode						-- select_list (Mart.RPT_Enertia_Transaction)
					,TxnSummarized							-- select_list (Mart.RPT_Enertia_Transaction)
					,TxnVendorHID							-- select_list (Mart.RPT_Enertia_Transaction)
					,TxnVoid								-- select_list (Mart.RPT_Enertia_Transaction)
					,BatchNumber							-- select_list (Mart.RPT_Enertia_Transaction)
					,BatchDesc								-- select_list (Mart.RPT_Enertia_Transaction)
					,OriginalBatch							-- select_list (Mart.RPT_Enertia_Transaction)
					,ReversalBatch							-- select_list (Mart.RPT_Enertia_Transaction)
					,Amount_Payment							-- select_list (Mart.RPT_Enertia_Transaction)
					,Amount_Discount						-- select_list (Mart.RPT_Enertia_Transaction)
					,Amount_Bckwh							-- select_list (Mart.RPT_Enertia_Transaction)
					,Amount_Bank_Clear_Achout				-- select_list (Mart.RPT_Enertia_Transaction)
					,Amount_Bank_Clear_Check				-- select_list (Mart.RPT_Enertia_Transaction)
					,Amount_Bank_Clear_Wire					-- select_list (Mart.RPT_Enertia_Transaction)
					,AfeTID									-- select_list (Mart.RPT_Enertia_Transaction)
					,BankClearAmt							-- select_list (Mart.RPT_Enertia_Transaction)
					,BankTxnAmount							-- select_list (Mart.RPT_Enertia_Transaction)
					,BankTxnDate							-- select_list (Mart.RPT_Enertia_Transaction)
					,BankTxnNumber							-- select_list (Mart.RPT_Enertia_Transaction)
					,BankTxnStatus							-- select_list (Mart.RPT_Enertia_Transaction)
					,BankTxnType							-- select_list (Mart.RPT_Enertia_Transaction)
					,CorpTID								-- select_list (Mart.RPT_Enertia_Transaction)
					,CorrectingBatch						-- select_list (Mart.RPT_Enertia_Transaction)
					,DtlAdjAmt								-- select_list (Mart.RPT_Enertia_Transaction)
					,DtlAdjDate								-- select_list (Mart.RPT_Enertia_Transaction)
					,DtlAdjDesc								-- select_list (Mart.RPT_Enertia_Transaction)
					,DtlAdjTypeCode							-- select_list (Mart.RPT_Enertia_Transaction)
					,ProdCode								-- select_list (Mart.RPT_Enertia_Transaction)
					,ProdDesc								-- select_list (Mart.RPT_Enertia_Transaction)
					,PropClassAsset							-- select_list (Mart.RPT_Enertia_Transaction)
					,PropClassBillCat						-- select_list (Mart.RPT_Enertia_Transaction)
					,PropClassDesc							-- select_list (Mart.RPT_Enertia_Transaction)
					,PropClassExp							-- select_list (Mart.RPT_Enertia_Transaction)
					,SysProdClass							-- select_list (Mart.RPT_Enertia_Transaction)
					,SysProdCode							-- select_list (Mart.RPT_Enertia_Transaction)
					,SysPropClassCode						-- select_list (Mart.RPT_Enertia_Transaction)
					,SysPropClassDesc						-- select_list (Mart.RPT_Enertia_Transaction)
					,TxnAtrCode								-- select_list (Mart.RPT_Enertia_Transaction)
					,TxnAtrType								-- select_list (Mart.RPT_Enertia_Transaction)
					,TxnBalance								-- select_list (Mart.RPT_Enertia_Transaction)
					,TxnCurrency							-- select_list (Mart.RPT_Enertia_Transaction)
					,TxnCurrencyGrossAmount					-- select_list (Mart.RPT_Enertia_Transaction)
					,TxnCurrencyNetAmount					-- select_list (Mart.RPT_Enertia_Transaction)
					,TxnDateReceived						-- select_list (Mart.RPT_Enertia_Transaction)
					,TxnDiscount							-- select_list (Mart.RPT_Enertia_Transaction)
					,TxnDiscountDate						-- select_list (Mart.RPT_Enertia_Transaction)
					,TxnDueDate								-- select_list (Mart.RPT_Enertia_Transaction)
					,TxnEquipType							-- select_list (Mart.RPT_Enertia_Transaction)
					,TxnInterest							-- select_list (Mart.RPT_Enertia_Transaction)
					,TxnInvNo								-- select_list (Mart.RPT_Enertia_Transaction)
					,TxnPayableAcctHID						-- select_list (Mart.RPT_Enertia_Transaction)
					,TxnPONumber							-- select_list (Mart.RPT_Enertia_Transaction)
					,TxnPropHID								-- select_list (Mart.RPT_Enertia_Transaction)
					,TxnQuantity							-- select_list (Mart.RPT_Enertia_Transaction)
					,TxnTypeComment							-- select_list (Mart.RPT_Enertia_Transaction)
					,TxnTypeTID								-- select_list (Mart.RPT_Enertia_Transaction)
					,TxnTypeUserDefCode						-- select_list (Mart.RPT_Enertia_Transaction)
					,TxnUomCode								-- select_list (Mart.RPT_Enertia_Transaction)
					,TxnVendorAddrTID						-- select_list (Mart.RPT_Enertia_Transaction)
					,TxnVendorName							-- select_list (Mart.RPT_Enertia_Transaction)
					,VendTID								-- select_list (Mart.RPT_Enertia_Transaction)
					,TxnBillingCorpHID						-- select_list (Mart.RPT_Enertia_Transaction)
					,Well_ID								-- select_list (Mart.RPT_Enertia_Transaction)
					,Well_Well_Name							-- select_list (Mart.RPT_Enertia_Transaction)
					,Well_Pad_Name							-- select_list (Mart.RPT_Enertia_Transaction)
					,Well_Pod_Name							-- select_list (Mart.RPT_Enertia_Transaction)
					,Well_Prospect							-- select_list (Mart.RPT_Enertia_Transaction)
					,Well_State								-- select_list (Mart.RPT_Enertia_Transaction)
					,Well_County							-- select_list (Mart.RPT_Enertia_Transaction)
					,Well_Formation							-- select_list (Mart.RPT_Enertia_Transaction)
					,Well_Surface_Spud_Date					-- select_list (Mart.RPT_Enertia_Transaction)
					,Well_Drilling_Pause_Date				-- select_list (Mart.RPT_Enertia_Transaction)
					,Well_Resume_Drilling_Date				-- select_list (Mart.RPT_Enertia_Transaction)
					,Well_Final_Rig_Release					-- select_list (Mart.RPT_Enertia_Transaction)
					,Well_Frac_Start_Date					-- select_list (Mart.RPT_Enertia_Transaction)
					,Well_Frac_End_Date						-- select_list (Mart.RPT_Enertia_Transaction)
					,Well_Drillout_Start_Date				-- select_list (Mart.RPT_Enertia_Transaction)
					,Well_Drillout_End_Date					-- select_list (Mart.RPT_Enertia_Transaction)
					,Well_First_Sales_Date					-- select_list (Mart.RPT_Enertia_Transaction)
					,Well_Total_Measured_Depth				-- select_list (Mart.RPT_Enertia_Transaction)
					,Well_Lateral_Length_Actual				-- select_list (Mart.RPT_Enertia_Transaction)
					,Well_Lateral_Length_Planned			-- select_list (Mart.RPT_Enertia_Transaction)
					,Well_Configuration						-- select_list (Mart.RPT_Enertia_Transaction)
					,Well_Cost_Center						-- select_list (Mart.RPT_Enertia_Transaction)
					,Well_Pad_Lateral_Length				-- select_list (Mart.RPT_Enertia_Transaction)
					,Well_Stage_Count						-- select_list (Mart.RPT_Enertia_Transaction)
					,Pad_Stage_count						-- select_list (Mart.RPT_Enertia_Transaction)
					,Well_Proppant							-- select_list (Mart.RPT_Enertia_Transaction)
					,Well_Proppant_Load						-- select_list (Mart.RPT_Enertia_Transaction)
					,Well_Recover_Load						-- select_list (Mart.RPT_Enertia_Transaction)
					,ETL_Load_Date							-- select_list (Mart.RPT_Enertia_Transaction)
					,AFE_Inquiry							-- select_list (Mart.RPT_Enertia_Transaction)
					,Mgmt_Inquiry							-- select_list (Mart.RPT_Enertia_Transaction)
					,APJIB_Inquiry							-- select_list (Mart.RPT_Enertia_Transaction)
					,SpendHeader							-- select_list (Mart.RPT_Enertia_Transaction)
					,SpendType								-- select_list (Mart.RPT_Enertia_Transaction)
				FROM
					Mart.View_Enertia_Transaction
				WHERE
					TxnAcctgDate >= @sdate

				SET @ErrPos += concat(' [ ', @@rowcount, ' ]')
				PRINT concat(sysdatetime(), ' | INFO | '+@ErrPos)

			------------------------------------------------------------------------
			-- Truncate Mart.RPT_Enertia_Transaction_Aggregate_BillingCode_AcctgDate
			------------------------------------------------------------------------
				SET @ErrPos = concat(@MsgTitle, '; Truncate Mart.RPT_Enertia_Transaction_Aggregate_BillingCode_AcctgDate'
				PRINT concat(sysdatetime(), ' | INFO | ' , @ErrPos)

				TRUNCATE TABLE Mart.RPT_Enertia_Transaction_Aggregate_BillingCode_AcctgDate
			
			------------------------------------------------------------------------
			-- Populate Mart.RPT_Enertia_Transaction_Aggregate_BillingCode_AcctgDate
			------------------------------------------------------------------------
				SET @ErrPos = concat(@MsgTitle, '; Populate Mart.RPT_Enertia_Transaction_Aggregate_BillingCode_AcctgDate')
				PRINT concat(sysdatetime(), ' | INFO | ' , @ErrPos)

				INSERT INTO 
					Mart.RPT_Enertia_Transaction_Aggregate_BillingCode_AcctgDate (
						 CorpName
						,BillCatCode
						,BillCatDesc
						,PropType
						,TxnAcctgDate
						,TxnNetAmount
						,TxnCount
						,AFE_Inquiry					
					)
				SELECT
					 CorpName
					,BillCatCode
					,BillCatDesc
					,PropType
					,TxnAcctgDate
					,TxnNetAmount
					,TxnCount
					,AFE_Inquiry
				FROM
					Stage.View_Enertia_Transaction_Aggregate_BillingCode_AcctgDate
    
				SET @ErrPos += concat(' [ ', @@rowcount, ' ]')
				PRINT concat(sysdatetime(), ' | INFO | '+@ErrPos)

			------------------------------------------------------------------------
			-- Truncate Mart.RPT_Enertia_Transaction_Aggregate_BillingCode_Inception
			------------------------------------------------------------------------
				SET @ErrPos = concat(@MsgTitle, '; Truncate Mart.RPT_Enertia_Transaction_Aggregate_BillingCode_Inception'
				PRINT concat(sysdatetime(), ' | INFO | ' , @ErrPos)

				TRUNCATE TABLE Mart.RPT_Enertia_Transaction_Aggregate_BillingCode_Inception
			
			------------------------------------------------------------------------
			-- Populate Mart.RPT_Enertia_Transaction_Aggregate_BillingCode_Inception
			------------------------------------------------------------------------
				SET @ErrPos = concat(@MsgTitle, '; Populate Mart.RPT_Enertia_Transaction_Aggregate_BillingCode_Inception')
				PRINT concat(sysdatetime(), ' | INFO | ' , @ErrPos)

				INSERT INTO 
					Mart.RPT_Enertia_Transaction_Aggregate_BillingCode_Inception (
						 CorpName
						,BillCatCode
						,BillCatDesc
						,PropType
						,TxnNetAmount
						,TxnCount
						,AFE_Inquiry					
					)
				SELECT
					 CorpName
					,BillCatCode
					,BillCatDesc
					,PropType
					,TxnNetAmount
					,TxnCount
					,AFE_Inquiry
				FROM
					Stage.View_Enertia_Transaction_Aggregate_BillingCode_Inception

				SET @ErrPos += concat(' [ ', @@rowcount, ' ]')
				PRINT concat(sysdatetime(), ' | INFO | '+@ErrPos)
				
			------------------------------------------------------------------------
			-- Truncate Mart.RPT_Enertia_Transaction_Aggregate_PropertyName_Inception
			------------------------------------------------------------------------
				SET @ErrPos = concat(@MsgTitle, '; Truncate Mart.RPT_Enertia_Transaction_Aggregate_PropertyName_Inception'
				PRINT concat(sysdatetime(), ' | INFO | ' , @ErrPos)

				TRUNCATE TABLE Mart.RPT_Enertia_Transaction_Aggregate_PropertyName_Inception
			
			------------------------------------------------------------------------
			-- Populate Mart.RPT_Enertia_Transaction_Aggregate_PropertyName_Inception
			------------------------------------------------------------------------
				SET @ErrPos = concat(@MsgTitle, '; Populate Mart.RPT_Enertia_Transaction_Aggregate_PropertyName_Inception')
				PRINT concat(sysdatetime(), ' | INFO | ' , @ErrPos)

				INSERT INTO 
					Mart.RPT_Enertia_Transaction_Aggregate_PropertyName_Inception (
						 CorpName
						,PropName
						,PropType
						,TxnNetAmount
						,TxnCount
						,AFE_Inquiry
					)
				SELECT
					 CorpName
					,PropName
					,PropType
					,TxnNetAmount
					,TxnCount
					,AFE_Inquiry
				FROM
					Stage.View_Enertia_Transaction_Aggregate_PropertyName_Inception

				SET @ErrPos += concat(' [ ', @@rowcount, ' ]')
				PRINT concat(sysdatetime(), ' | INFO | '+@ErrPos)
				
			------------------------------------------------------------------------
			-- Truncate Mart.RPT_Enertia_Transaction_Aggregate_PropertyName_AcctgDate
			------------------------------------------------------------------------
				SET @ErrPos = concat(@MsgTitle, '; Truncate Mart.RPT_Enertia_Transaction_Aggregate_PropertyName_AcctgDate'
				PRINT concat(sysdatetime(), ' | INFO | ' , @ErrPos)

				TRUNCATE TABLE Mart.RPT_Enertia_Transaction_Aggregate_PropertyName_AcctgDate
			
			------------------------------------------------------------------------
			-- Populate Mart.RPT_Enertia_Transaction_Aggregate_PropertyName_AcctgDate
			------------------------------------------------------------------------
				SET @ErrPos = concat(@MsgTitle, '; Populate Mart.RPT_Enertia_Transaction_Aggregate_PropertyName_AcctgDate')
				PRINT concat(sysdatetime(), ' | INFO | ' , @ErrPos)

				INSERT INTO 
					Mart.RPT_Enertia_Transaction_Aggregate_PropertyName_AcctgDate (
						 CorpName
						,PropName
						,PropType
						,TxnAcctgDate
						,TxnNetAmount
						,TxnCount
						,AFE_Inquiry					
					)
				SELECT
					 CorpName
					,PropName
					,PropType
					,TxnAcctgDate
					,TxnNetAmount
					,TxnCount
					,AFE_Inquiry
				FROM
					Stage.View_Enertia_Transaction_Aggregate_PropertyName_AcctgDate

				SET @ErrPos += concat(' [ ', @@rowcount, ' ]')
				PRINT concat(sysdatetime(), ' | INFO | '+@ErrPos)
				
			------------------------------------------------------------------------
			-- Truncate Mart.RPT_Enertia_Transaction_Aggregate_MI_BillingCode_AcctgDate
			------------------------------------------------------------------------
				SET @ErrPos = concat(@MsgTitle, '; Truncate Mart.RPT_Enertia_Transaction_Aggregate_MI_BillingCode_AcctgDate'
				PRINT concat(sysdatetime(), ' | INFO | ' , @ErrPos)

				TRUNCATE TABLE Mart.RPT_Enertia_Transaction_Aggregate_MI_BillingCode_AcctgDate
			
			------------------------------------------------------------------------
			-- Populate Mart.RPT_Enertia_Transaction_Aggregate_MI_BillingCode_AcctgDate
			------------------------------------------------------------------------
				SET @ErrPos = concat(@MsgTitle, '; Populate Mart.RPT_Enertia_Transaction_Aggregate_MI_BillingCode_AcctgDate')
				PRINT concat(sysdatetime(), ' | INFO | ' , @ErrPos)

				INSERT INTO 
					Mart.RPT_Enertia_Transaction_Aggregate_MI_BillingCode_AcctgDate (
						 SpendHeader
						,SpendType
						,Metric_Target
						,CorpName
						,CapexOpex
						,AssetActivity
						,AccountingDate
						,BillCatCode
						,BillCatDesc
						,Amount
						,ETL_Load_Date					
					)
				SELECT
					 SpendHeader
					,SpendType
					,Metric_Target
					,CorpName
					,CapexOpex
					,AssetActivity
					,AccountingDate
					,BillCatCode
					,BillCatDesc
					,Amount
					,ETL_Load_Date
				FROM
					Stage.View_Enertia_Transaction_Aggregate_MI_BillingCode_AcctgDate
    
				SET @ErrPos += concat(' [ ', @@rowcount, ' ]')
				PRINT concat(sysdatetime(), ' | INFO | '+@ErrPos)

			------------------------------------------------------------------------
			-- Truncate Mart.RPT_Enertia_Transaction_Aggregate_MI_BillingCode_Inception
			------------------------------------------------------------------------
				SET @ErrPos = concat(@MsgTitle, '; Truncate Mart.RPT_Enertia_Transaction_Aggregate_MI_BillingCode_Inception'
				PRINT concat(sysdatetime(), ' | INFO | ' , @ErrPos)

				TRUNCATE TABLE Mart.RPT_Enertia_Transaction_Aggregate_MI_BillingCode_Inception
			
			------------------------------------------------------------------------
			-- Populate Mart.RPT_Enertia_Transaction_Aggregate_MI_BillingCode_Inception
			------------------------------------------------------------------------
				SET @ErrPos = concat(@MsgTitle, '; Populate Mart.RPT_Enertia_Transaction_Aggregate_MI_BillingCode_Inception')
				PRINT concat(sysdatetime(), ' | INFO | ' , @ErrPos)

				INSERT INTO 
					Mart.RPT_Enertia_Transaction_Aggregate_MI_BillingCode_Inception (
						 SpendHeader
						,SpendType
						,Metric_Target
						,CorpName
						,CapexOpex
						,AssetActivity
						,BillCatCode
						,BillCatDesc
						,Amount					
					)
				SELECT
					 SpendHeader
					,SpendType
					,Metric_Target
					,CorpName
					,CapexOpex
					,AssetActivity
					,BillCatCode
					,BillCatDesc
					,Amount
				FROM
					Stage.View_Enertia_Transaction_Aggregate_MI_BillingCode_Inception
    
				SET @ErrPos += concat(' [ ', @@rowcount, ' ]')
				PRINT concat(sysdatetime(), ' | INFO | '+@ErrPos)

			------------------------------------------------------------------------
			-- Truncate Mart.RPT_Enertia_Transaction_Aggregate_MI_BillingCode_Periods
			------------------------------------------------------------------------
				SET @ErrPos = concat(@MsgTitle, '; Truncate Mart.RPT_Enertia_Transaction_Aggregate_MI_BillingCode_Periods'
				PRINT concat(sysdatetime(), ' | INFO | ' , @ErrPos)

				TRUNCATE TABLE Mart.RPT_Enertia_Transaction_Aggregate_MI_BillingCode_Periods
			
			------------------------------------------------------------------------
			-- Populate Mart.RPT_Enertia_Transaction_Aggregate_MI_BillingCode_Periods
			------------------------------------------------------------------------
				SET @ErrPos = concat(@MsgTitle, '; Populate Mart.RPT_Enertia_Transaction_Aggregate_MI_BillingCode_Periods')
				PRINT concat(sysdatetime(), ' | INFO | ' , @ErrPos)

				INSERT INTO 
					Mart.RPT_Enertia_Transaction_Aggregate_MI_BillingCode_Periods (
						 SpendHeader
						,SpendType
						,Metric_Target
						,CorpName
						,CapexOpex
						,AssetActivity
						,BillCatCode
						,BillCatDesc
						,Amount_Current_Month
						,Amount_Current_Month_Minus_One
						,Amount_Current_Month_Minus_Two
						,Amount_Current_Month_Minus_Three
						,Amount_Current_Month_Minus_Four
						,Amount_Current_Month_Minus_Five
						,Amount_Year_To_Date
						,Amount_Last_Year
						,Amount_Inception					
					)
				SELECT
					 SpendHeader
					,SpendType
					,Metric_Target
					,CorpName
					,CapexOpex
					,AssetActivity
					,BillCatCode
					,BillCatDesc
					,Amount_Current_Month
					,Amount_Current_Month_Minus_One
					,Amount_Current_Month_Minus_Two
					,Amount_Current_Month_Minus_Three
					,Amount_Current_Month_Minus_Four
					,Amount_Current_Month_Minus_Five
					,Amount_Year_To_Date
					,Amount_Last_Year
					,Amount_Inception
				FROM
					Stage.View_Enertia_Transaction_Aggregate_MI_BillingCode_Periods
    
				SET @ErrPos += concat(' [ ', @@rowcount, ' ]')
				PRINT concat(sysdatetime(), ' | INFO | '+@ErrPos)

			------------------------------------------------------------------------
			-- Truncate Mart.RPT_Enertia_Transaction_Aggregate_MI_Inception
			------------------------------------------------------------------------
				SET @ErrPos = concat(@MsgTitle, '; Truncate Mart.RPT_Enertia_Transaction_Aggregate_MI_Inception'
				PRINT concat(sysdatetime(), ' | INFO | ' , @ErrPos)

				TRUNCATE TABLE Mart.RPT_Enertia_Transaction_Aggregate_MI_Inception
			
			------------------------------------------------------------------------
			-- Populate Mart.RPT_Enertia_Transaction_Aggregate_MI_Inception
			------------------------------------------------------------------------
				SET @ErrPos = concat(@MsgTitle, '; Populate Mart.RPT_Enertia_Transaction_Aggregate_MI_Inception')
				PRINT concat(sysdatetime(), ' | INFO | ' , @ErrPos)

				INSERT INTO 
					Mart.RPT_Enertia_Transaction_Aggregate_MI_Inception (
						 SpendHeader
						,SpendType
						,Metric_Target
						,CorpName
						,CapexOpex
						,AssetActivity
						,Amount
						,ETL_Load_Date
					)
				SELECT
					 SpendHeader
					,SpendType
					,Metric_Target
					,CorpName
					,CapexOpex
					,AssetActivity
					,Amount
					,ETL_Load_Date
				FROM
					Stage.View_Enertia_Transaction_Aggregate_MI_Inception
    
				SET @ErrPos += concat(' [ ', @@rowcount, ' ]')
				PRINT concat(sysdatetime(), ' | INFO | '+@ErrPos)

			------------------------------------------------------------------------
			-- Truncate Mart.RPT_Enertia_Transaction_Aggregate_MI_AcctgDate
			------------------------------------------------------------------------
				SET @ErrPos = concat(@MsgTitle, '; Truncate Mart.RPT_Enertia_Transaction_Aggregate_MI_AcctgDate'
				PRINT concat(sysdatetime(), ' | INFO | ' , @ErrPos)

				TRUNCATE TABLE Mart.RPT_Enertia_Transaction_Aggregate_MI_AcctgDate
			
			------------------------------------------------------------------------
			-- Populate Mart.RPT_Enertia_Transaction_Aggregate_MI_AcctgDate
			------------------------------------------------------------------------
				SET @ErrPos = concat(@MsgTitle, '; Populate Mart.RPT_Enertia_Transaction_Aggregate_MI_AcctgDate')
				PRINT concat(sysdatetime(), ' | INFO | ' , @ErrPos)

				INSERT INTO 
					Mart.RPT_Enertia_Transaction_Aggregate_MI_AcctgDate (
						 SpendHeader
						,SpendType
						,Metric_Target
						,CorpName
						,CapexOpex
						,AssetActivity
						,AccountingDate
						,Amount
						,ETL_Load_Date					
					)
				SELECT
					 SpendHeader
					,SpendType
					,Metric_Target
					,CorpName
					,CapexOpex
					,AssetActivity
					,AccountingDate
					,Amount
					,ETL_Load_Date
				FROM
					Stage.View_Enertia_Transaction_Aggregate_MI_AcctgDate
    
				SET @ErrPos += concat(' [ ', @@rowcount, ' ]')
				PRINT concat(sysdatetime(), ' | INFO | '+@ErrPos)

			------------------------------------------------------------------------
			-- Truncate Mart.RPT_Enertia_Transaction_Aggregate_AFE_BillingCode_AcctgDate
			------------------------------------------------------------------------
				SET @ErrPos = concat(@MsgTitle, '; Truncate Mart.RPT_Enertia_Transaction_Aggregate_AFE_BillingCode_AcctgDate'
				PRINT concat(sysdatetime(), ' | INFO | ' , @ErrPos)

				TRUNCATE TABLE Mart.RPT_Enertia_Transaction_Aggregate_AFE_BillingCode_AcctgDate
			
			------------------------------------------------------------------------
			-- Populate Mart.RPT_Enertia_Transaction_Aggregate_AFE_BillingCode_AcctgDate
			------------------------------------------------------------------------
				SET @ErrPos = concat(@MsgTitle, '; Populate Mart.RPT_Enertia_Transaction_Aggregate_AFE_BillingCode_AcctgDate')
				PRINT concat(sysdatetime(), ' | INFO | ' , @ErrPos)

				INSERT INTO 
					Mart.RPT_Enertia_Transaction_Aggregate_AFE_BillingCode_AcctgDate (
						 CorpName
						,AfeCode
						,AfeName_Alpha
						,AfeName
						,BillCatCode
						,BillCatDesc
						,PropType
						,TxnAcctgDate
						,TxnNetAmount
						,TxnCount
						,AFE_Inquiry					
					)
				SELECT
					 CorpName
					,AfeCode
					,AfeName_Alpha
					,AfeName
					,BillCatCode
					,BillCatDesc
					,PropType
					,TxnAcctgDate
					,TxnNetAmount
					,TxnCount
					,AFE_Inquiry
				FROM
					Stage.View_Enertia_Transaction_Aggregate_AFE_BillingCode_AcctgDate
    
				SET @ErrPos += concat(' [ ', @@rowcount, ' ]')
				PRINT concat(sysdatetime(), ' | INFO | '+@ErrPos)

			------------------------------------------------------------------------
			-- Truncate Mart.RPT_Enertia_Transaction_Aggregate_AFE_BillingCode_Inception
			------------------------------------------------------------------------
				SET @ErrPos = concat(@MsgTitle, '; Truncate Mart.RPT_Enertia_Transaction_Aggregate_AFE_BillingCode_Inception'
				PRINT concat(sysdatetime(), ' | INFO | ' , @ErrPos)

				TRUNCATE TABLE Mart.RPT_Enertia_Transaction_Aggregate_AFE_BillingCode_Inception
			
			------------------------------------------------------------------------
			-- Populate Mart.RPT_Enertia_Transaction_Aggregate_AFE_BillingCode_Inception
			------------------------------------------------------------------------
				SET @ErrPos = concat(@MsgTitle, '; Populate Mart.RPT_Enertia_Transaction_Aggregate_AFE_BillingCode_Inception')
				PRINT concat(sysdatetime(), ' | INFO | ' , @ErrPos)

				INSERT INTO 
					Mart.RPT_Enertia_Transaction_Aggregate_AFE_BillingCode_Inception (
						 CorpName
						,AfeCode
						,AfeName_Alpha
						,AfeName
						,BillCatCode
						,BillCatDesc
						,PropType
						,TxnNetAmount
						,TxnCount
						,AFE_Inquiry					
					)
				SELECT
					 CorpName
					,AfeCode
					,AfeName_Alpha
					,AfeName
					,BillCatCode
					,BillCatDesc
					,PropType
					,TxnNetAmount
					,TxnCount
					,AFE_Inquiry
				FROM
					Stage.View_Enertia_Transaction_Aggregate_AFE_BillingCode_Inception
    
				SET @ErrPos += concat(' [ ', @@rowcount, ' ]')
				PRINT concat(sysdatetime(), ' | INFO | '+@ErrPos)

			------------------------------------------------------------------------
			-- Truncate Mart.RPT_Enertia_AFE_Budget_Coalesce
			------------------------------------------------------------------------
				SET @ErrPos = concat(@MsgTitle, '; Truncate Mart.RPT_Enertia_AFE_Budget_Coalesce'
				PRINT concat(sysdatetime(), ' | INFO | ' , @ErrPos)

				TRUNCATE TABLE Mart.RPT_Enertia_AFE_Budget_Coalesce
			
			------------------------------------------------------------------------
			-- Populate Mart.RPT_Enertia_AFE_Budget_Coalesce
			------------------------------------------------------------------------
				SET @ErrPos = concat(@MsgTitle, '; Populate Mart.RPT_Enertia_AFE_Budget_Coalesce')
				PRINT concat(sysdatetime(), ' | INFO | ' , @ErrPos)

				INSERT INTO 
					Mart.RPT_Enertia_AFE_Budget_Coalesce (
						 AfeNumber
						,AfeName
						,AfeOrigNumber
						,CorpCode
						,CorpName
						,AfeDesc
						,AfeTID
						,AfeHID
						,AfeTypeCode
						,AfeClassCode
						,AfeObjCode
						,AfeBeginDate
						,AfeCompleteDate
						,AfeCloseDate
						,AfeStatusCode
						,AfeNetOwnership
						,BudgetAfeCatCode
						,BudgetType_Drill
						,BudgetAmt_Drill
						,BudgetSupplementAmt_Drill
						,BudgetType_Compl
						,BudgetAmt_Compl
						,BudgetSupplementAmt_Compl
						,BudgetType_Other
						,BudgetAmt_Other
						,BudgetSupplementAmt_Other
						,BudgetAmt
						,BudgetSupplementAmt
						,TotalBudget
						,AfeCatTypeCode
						,AfeCatTypeDesc
						,AfeProjectCode
						,AfeProjectDesc
						,AfeCatCode
						,AfeCatDesc				
					)
				SELECT
					 AfeNumber
					,AfeName
					,AfeOrigNumber
					,CorpCode
					,CorpName
					,AfeDesc
					,AfeTID
					,AfeHID
					,AfeTypeCode
					,AfeClassCode
					,AfeObjCode
					,AfeBeginDate
					,AfeCompleteDate
					,AfeCloseDate
					,AfeStatusCode
					,AfeNetOwnership
					,BudgetAfeCatCode
					,BudgetType_Drill
					,BudgetAmt_Drill
					,BudgetSupplementAmt_Drill
					,BudgetType_Compl
					,BudgetAmt_Compl
					,BudgetSupplementAmt_Compl
					,BudgetType_Other
					,BudgetAmt_Other
					,BudgetSupplementAmt_Other
					,BudgetAmt
					,BudgetSupplementAmt
					,TotalBudget
					,AfeCatTypeCode
					,AfeCatTypeDesc
					,AfeProjectCode
					,AfeProjectDesc
					,AfeCatCode
					,AfeCatDesc
				FROM
					Stage.View_Enertia_AFE_Budget_Coalesce
    
				SET @ErrPos += concat(' [ ', @@rowcount, ' ]')
				PRINT concat(sysdatetime(), ' | INFO | '+@ErrPos)

			------------------------------------------------------------------------
			-- Truncate Mart.RPT_Enertia_AFE_Budget_and_Actual_Coalesce
			------------------------------------------------------------------------
				SET @ErrPos = concat(@MsgTitle, '; Truncate Mart.RPT_Enertia_AFE_Budget_and_Actual_Coalesce'
				PRINT concat(sysdatetime(), ' | INFO | ' , @ErrPos)

				TRUNCATE TABLE Mart.RPT_Enertia_AFE_Budget_and_Actual_Coalesce
			
			------------------------------------------------------------------------
			-- Populate Mart.RPT_Enertia_AFE_Budget_and_Actual_Coalesce
			------------------------------------------------------------------------
				SET @ErrPos = concat(@MsgTitle, '; Populate Mart.RPT_Enertia_AFE_Budget_and_Actual_Coalesce')
				PRINT concat(sysdatetime(), ' | INFO | ' , @ErrPos)

				INSERT INTO 
					Mart.RPT_Enertia_AFE_Budget_and_Actual_Coalesce (
						 Corpname
						,AfeNumber
						,AfeName_Alpha
						,AfeName
						,BillCatCode
						,BillCatDesc
						,TxnNetAmount
						,TotalBudget
						,Variance					
					)
				SELECT
					 Corpname
					,AfeNumber
					,AfeName_Alpha
					,AfeName
					,BillCatCode
					,BillCatDesc
					,TxnNetAmount
					,TotalBudget
					,Variance
				FROM
					Stage.View_Enertia_AFE_Budget_and_Actual_Coalesce

				SET @ErrPos += concat(' [ ', @@rowcount, ' ]')
				PRINT concat(sysdatetime(), ' | INFO | '+@ErrPos)

			------------------------------------------------------------------------
			-- Truncate Mart.RPT_Enertia_Transaction_Aggregate_AFE_Property_BillingCode_AcctgDate
			------------------------------------------------------------------------
				SET @ErrPos = concat(@MsgTitle, '; Truncate Mart.RPT_Enertia_Transaction_Aggregate_AFE_Property_BillingCode_AcctgDate'
				PRINT concat(sysdatetime(), ' | INFO | ' , @ErrPos)

				TRUNCATE TABLE Mart.RPT_Enertia_Transaction_Aggregate_AFE_Property_BillingCode_AcctgDate
			
			------------------------------------------------------------------------
			-- Populate Mart.RPT_Enertia_Transaction_Aggregate_AFE_Property_BillingCode_AcctgDate
			------------------------------------------------------------------------
				SET @ErrPos = concat(@MsgTitle, '; Populate Mart.RPT_Enertia_Transaction_Aggregate_AFE_Property_BillingCode_AcctgDate')
				PRINT concat(sysdatetime(), ' | INFO | ' , @ErrPos)

				INSERT INTO 
					Mart.RPT_Enertia_Transaction_Aggregate_AFE_Property_BillingCode_AcctgDate (
						 CorpName
						,AfeCode
						,PropName
						,PropType
						,AfeName_Alpha
						,AfeName
						,BillCatCode
						,BillCatDesc
						,TxnAcctgDate
						,TxnNetAmount
						,TxnCount
						,AFE_Inquiry					
					)
				SELECT
					 CorpName
					,AfeCode
					,PropName
					,PropType
					,AfeName_Alpha
					,AfeName
					,BillCatCode
					,BillCatDesc
					,TxnAcctgDate
					,TxnNetAmount
					,TxnCount
					,AFE_Inquiry
				FROM
					Stage.View_Enertia_Transaction_Aggregate_AFE_Property_BillingCode_AcctgDate
	
				SET @ErrPos += concat(' [ ', @@rowcount, ' ]')
				PRINT concat(sysdatetime(), ' | INFO | '+@ErrPos)

			------------------------------------------------------------------------
			-- Truncate Mart.RPT_Enertia_Transaction_Aggregate_AFE_Property_BillingCode_Inception
			------------------------------------------------------------------------
				SET @ErrPos = concat(@MsgTitle, '; Truncate Mart.RPT_Enertia_Transaction_Aggregate_AFE_Property_BillingCode_Inception'
				PRINT concat(sysdatetime(), ' | INFO | ' , @ErrPos)

				TRUNCATE TABLE Mart.RPT_Enertia_Transaction_Aggregate_AFE_Property_BillingCode_Inception
			
			------------------------------------------------------------------------
			-- Populate Mart.RPT_Enertia_Transaction_Aggregate_AFE_BillingCode_Inception
			------------------------------------------------------------------------
				SET @ErrPos = concat(@MsgTitle, '; Populate Mart.RPT_Enertia_Transaction_Aggregate_AFE_Property_BillingCode_Inception')
				PRINT concat(sysdatetime(), ' | INFO | ' , @ErrPos)

				INSERT INTO 
					Mart.RPT_Enertia_Transaction_Aggregate_AFE_Property_BillingCode_Inception (
						 CorpName
						,AfeCode
						,PropName
						,PropType
						,AfeName_Alpha
						,AfeName
						,BillCatCode
						,BillCatDesc
						,TxnNetAmount
						,TxnCount
						,AFE_Inquiry					
					)
				SELECT
					 CorpName
					,AfeCode
					,PropName
					,PropType
					,AfeName_Alpha
					,AfeName
					,BillCatCode
					,BillCatDesc
					,TxnNetAmount
					,TxnCount
					,AFE_Inquiry
				FROM
					Stage.View_Enertia_Transaction_Aggregate_AFE_Property_BillingCode_Inception

				SET @ErrPos += concat(' [ ', @@rowcount, ' ]')
				PRINT concat(sysdatetime(), ' | INFO | '+@ErrPos)
	   END