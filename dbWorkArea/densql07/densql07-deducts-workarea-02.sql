USE Integration

SELECT
	 t0.object_id
	,sum(try_convert(BIGINT,t0.max_length)) * 713245036
FROM
	sys.columns t0
WHERE 1=1
	AND t0.object_id = object_id('enertia.ENERTIA_DEDUCTS')
GROUP BY t0.object_id

SELECT 6057590090748/1024/1024/1024

sp_spaceused 'enertia.ENERTIA_DEDUCTS'


SELECT 595558840/1024.00/1024.00, 320921544, 274600304

SELECT * FROM enertia.Enertia_Deducts

CREATE NONCLUSTERED INDEX IX_Deducts
ON enertia.Enertia_Deducts ([Search Key])
INCLUDE (
			 [Owner Header Code]
			,[Owner Header Name]
			,[Property Header Code]
			,[Property Header Name]
			,[Acct Date]
			,[Prod Date]
			,[Corporation Header Code]
			,[Corporation Header Name]
			,Deduction
			,[Deduction Description]
			,[Deduction Type]
			,[Computed Amount]
			,[ChgBk Proportional Amount]
			,[ChgBk Disproportional Amount]
			,[Free Redistributed Amount]
			,[State Tax Exempt Amount]
			,[Original Computed Amount]
			,[Owner Level Deduct]
			,Product
			,[Interest Type]
			,[Suspense Handling]
			,[Deck Decimal]
			,[Distribution Decimal]
			,Volume
			,[Post Volume]
			,[Gross Volume]
			,MMBTU
			,Value
			,[Total Netting]
			,[Total Taxes]
			,[Total Deductions]
			,Net
			,[Payment Status]
			,[Pmt Date]
			,ETL_Load_Date
		)
ON [PRIMARY]

SELECT
	max(datalength([Search Key]))
FROM
	enertia.Enertia_Deducts