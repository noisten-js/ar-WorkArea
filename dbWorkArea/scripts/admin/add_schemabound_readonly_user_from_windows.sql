------------------------------------------------
-- SQLCMD Variables
------------------------------------------------
:SETVAR dbname "EDW_Stage"
:SETVAR schemaname "Stage_Persistent"
:SETVAR uname "ANTERO\abrugger"
------------------------------------------------

	USE master
	IF NOT EXISTS (SELECT NULL FROM sys.server_principals WHERE name = '$(uname)')
	BEGIN
		PRINT concat(sysdatetime(),' | INFO | Creating Login $(uname)')
		CREATE LOGIN [$(uname)] FROM WINDOWS
	END

	USE [$(dbname)]

	IF NOT EXISTS (SELECT NULL FROM sys.database_principals WHERE name = '$(uname)')
	BEGIN
		PRINT concat(sysdatetime(),' | INFO | Creating database user $(uname)')
		CREATE USER [$(uname)] FROM LOGIN [$(uname)]
	END

	PRINT concat(sysdatetime(),' | INFO | Granting read permissions on $(schemaname) to $(uname)')
	GRANT CONNECT TO [$(uname)]
	GRANT SHOWPLAN TO [$(uname)]
	GRANT VIEW DEFINITION ON SCHEMA::[$(schemaname)] TO [$(uname)]
	GRANT SELECT ON SCHEMA::[$(schemaname)] TO [$(uname)]
