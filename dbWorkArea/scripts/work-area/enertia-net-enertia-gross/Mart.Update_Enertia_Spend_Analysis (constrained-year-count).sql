CREATE PROCEDURE [Mart].[Update_Enertia_Spend_Analysis] (
	 @YearsToInclude INT = 5
)
AS
    BEGIN
	
	DECLARE @sdate DATETIME = datefromparts(datepart(YEAR, dateadd(YEAR, -(@YearsToInclude), sysdatetime())), 1, 1)

    PRINT concat(sysdatetime(), ' | INFO | Gross Start')
	
	PRINT 'Truncate Gross Spend'

	TRUNCATE TABLE     [Mart].[RPT_Enertia_Transaction]
    insert into        [Mart].[RPT_Enertia_Transaction] 
    select *  from     [Mart].[View_Enertia_Transaction] WHERE txnacctgdate >= @sdate

    PRINT 'Gross Spend Complete'
    PRINT 'Create Aggregates'
	  ---2
    truncate table     [Mart].[RPT_Enertia_Transaction_Aggregate_BillingCode_AcctgDate]
    insert into        [Mart].[RPT_Enertia_Transaction_Aggregate_BillingCode_AcctgDate] 
    select * from      [Stage].[View_Enertia_Transaction_Aggregate_BillingCode_AcctgDate]
    
    ---3
    truncate table     [Mart].[RPT_Enertia_Transaction_Aggregate_BillingCode_Inception]
    insert into        [Mart].[RPT_Enertia_Transaction_Aggregate_BillingCode_Inception] 
    select * from      [Stage].[View_Enertia_Transaction_Aggregate_BillingCode_Inception]
    
    ---4
    truncate table     [Mart].[RPT_Enertia_Transaction_Aggregate_PropertyName_Inception]
    insert into        [Mart].[RPT_Enertia_Transaction_Aggregate_PropertyName_Inception] 
    select * from      [Stage].[View_Enertia_Transaction_Aggregate_PropertyName_Inception]
    
    ---5
    truncate table     [Mart].[RPT_Enertia_Transaction_Aggregate_PropertyName_AcctgDate]
    INSERT INTO        [Mart].[RPT_Enertia_Transaction_Aggregate_PropertyName_AcctgDate] 
    SELECT * FROM      [Stage].[View_Enertia_Transaction_Aggregate_PropertyName_AcctgDate]
    
    ---6 Krcek
    TRUNCATE TABLE     [Mart].[RPT_Enertia_Transaction_Aggregate_MI_BillingCode_AcctgDate]
    INSERT INTO        [Mart].[RPT_Enertia_Transaction_Aggregate_MI_BillingCode_AcctgDate] 
    SELECT * FROM      [Stage].[View_Enertia_Transaction_Aggregate_MI_BillingCode_AcctgDate]
    
    ---7
    TRUNCATE TABLE     [Mart].[RPT_Enertia_Transaction_Aggregate_MI_BillingCode_Inception]
    INSERT INTO        [Mart].[RPT_Enertia_Transaction_Aggregate_MI_BillingCode_Inception] 
    SELECT * FROM      [Stage].[View_Enertia_Transaction_Aggregate_MI_BillingCode_Inception]
    
    ---8
    TRUNCATE TABLE     [Mart].[RPT_Enertia_Transaction_Aggregate_MI_BillingCode_Periods]
    INSERT INTO        [Mart].[RPT_Enertia_Transaction_Aggregate_MI_BillingCode_Periods] 
    SELECT * FROM      [Stage].[View_Enertia_Transaction_Aggregate_MI_BillingCode_Periods]
    
    ---9  dependent on [RPT_Enertia_Transaction_Aggregate_MI_BillingCode_AcctgDate]
    TRUNCATE TABLE     [Mart].[RPT_Enertia_Transaction_Aggregate_MI_Inception]
    INSERT INTO        [Mart].[RPT_Enertia_Transaction_Aggregate_MI_Inception] 
    SELECT * FROM      [Stage].[View_Enertia_Transaction_Aggregate_MI_Inception]
    
    ---10 dependent on [RPT_Enertia_Transaction_Aggregate_MI_BillingCode_AcctgDate]
    TRUNCATE TABLE     [Mart].[RPT_Enertia_Transaction_Aggregate_MI_AcctgDate]
    INSERT INTO        [Mart].[RPT_Enertia_Transaction_Aggregate_MI_AcctgDate] 
    SELECT * FROM      [Stage].[View_Enertia_Transaction_Aggregate_MI_AcctgDate]
    
    ---11
    TRUNCATE TABLE     [Mart].[RPT_Enertia_Transaction_Aggregate_AFE_BillingCode_AcctgDate]
    INSERT INTO        [Mart].[RPT_Enertia_Transaction_Aggregate_AFE_BillingCode_AcctgDate] 
    SELECT * FROM      [Stage].[View_Enertia_Transaction_Aggregate_AFE_BillingCode_AcctgDate]
    
    ---12
    TRUNCATE TABLE     [Mart].[RPT_Enertia_Transaction_Aggregate_AFE_BillingCode_Inception]
    INSERT INTO        [Mart].[RPT_Enertia_Transaction_Aggregate_AFE_BillingCode_Inception] 
    SELECT * FROM      [Stage].[View_Enertia_Transaction_Aggregate_AFE_BillingCode_Inception]
    
    ---13
    TRUNCATE TABLE     [Mart].[RPT_Enertia_AFE_Budget_Coalesce]
    INSERT INTO        [Mart].[RPT_Enertia_AFE_Budget_Coalesce] 
    SELECT * FROM      [Stage].[View_Enertia_AFE_Budget_Coalesce]
    
    ---14 dependent on [RPT_Enertia_Transaction_Aggregate_AFE_BillingCode_Inception] and [RPT_Enertia_AFE_Budget_Coalesce]
    TRUNCATE TABLE     [Mart].[RPT_Enertia_AFE_Budget_and_Actual_Coalesce]
    INSERT INTO        [Mart].[RPT_Enertia_AFE_Budget_and_Actual_Coalesce] 
    SELECT * FROM      [Stage].[View_Enertia_AFE_Budget_and_Actual_Coalesce]

    ---15
	TRUNCATE TABLE [Mart].[RPT_Enertia_Transaction_Aggregate_AFE_Property_BillingCode_AcctgDate]
	INSERT INTO    [Mart].[RPT_Enertia_Transaction_Aggregate_AFE_Property_BillingCode_AcctgDate]
	SELECT * FROM  [Stage].[View_Enertia_Transaction_Aggregate_AFE_Property_BillingCode_AcctgDate]
	
	---16
	TRUNCATE TABLE [Mart].[RPT_Enertia_Transaction_Aggregate_AFE_Property_BillingCode_Inception]
	INSERT INTO   [Mart].[RPT_Enertia_Transaction_Aggregate_AFE_Property_BillingCode_Inception]
	SELECT * FROM  [Stage].[View_Enertia_Transaction_Aggregate_AFE_Property_BillingCode_Inception]

	PRINT 'Aggregates Complete'

   PRINT 'Gross Complete'
   
   END
GO