USE EDW_Stage
GO
CREATE SCHEMA petra AUTHORIZATION dbo
GO

USE EDW_Stage
DROP TABLE IF EXISTS petra.ImportProjectList
GO
CREATE TABLE petra.ImportProjectList (
	 ImportProjectListId		INT IDENTITY(1,1)	NOT NULL
	,ProjectName				VARCHAR(128)		NOT NULL
	,ExecutionOrder				INT					NOT NULL

	,CONSTRAINT PK_petra_ImportProjectList_ImportProjectListId
	 	PRIMARY KEY CLUSTERED (
	 		ImportProjectListId
	 	)

	,CONSTRAINT udx_petra_ImportProjectList_ProjectName
	 	UNIQUE NONCLUSTERED (
	 		ProjectName
	 	)
)
USE EDW_Stage
CREATE NONCLUSTERED INDEX idx_petra_ImportProjectList_ProjectName_ExecutionOrder
	ON petra.ImportProjectList (
		 ProjectName ASC
		,ExecutionOrder ASC
	)


INSERT INTO petra.ImportProjectList (
	 ProjectName
	,ExecutionOrder
)
VALUES 
	 ('WEST VIRGINIA', 1)
	,('EAGLE FORD', 2)
	,('WILLISTON BASIN', 3)
	,('PERMIAN BASIN', 4)
	,('HAYNESVILLE-AR-LA-TX', 5)




