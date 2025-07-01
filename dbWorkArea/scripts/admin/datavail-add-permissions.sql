:SETVAR grp "ANTERO\Datavail Developers"

IF NOT EXISTS(SELECT NULL FROM sys.server_principals WHERE name = 'ANTERO\Datavail Developers')
	EXEC ('CREATE LOGIN [$(grp)] FROM WINDOWS WITH DEFAULT_DATABASE = master')

DECLARE @SQL VARCHAR(max)
SELECT 
	@SQL = coalesce(@SQL,'') + concat(
		 'USE ',quotename(name),char(10)
		,'IF NOT EXISTS (SELECT NULL FROM sys.database_principals WHERE name = ''$(grp)'')', char(10)
		,'	CREATE USER [$(grp)] FROM LOGIN [$(grp)] WITH DEFAULT_SCHEMA = dbo', char(10)
		,CASE 
			WHEN serverproperty('MachineName') IN ('devdw01', 'devssis01') 
				THEN concat(
					 'EXEC sys.sp_addrolemember @rolename=''db_owner'', @membername=''$(grp)''',char(10)
					 ,'USE master',char(10)
					 ,'GRANT VIEW SERVER STATE TO [$(grp)]',char(10)
				)
			ELSE concat(
				 'GRANT SELECT TO [$(grp)]', char(10)
				,'GRANT VIEW DEFINITION TO [$(grp)]', char(10)
				,'GRANT SHOWPLAN TO [$(grp)]',char(10)
				,'GRANT EXECUTE TO [$(grp)]',char(10)
				,'USE master',char(10)
				,'GRANT VIEW SERVER STATE TO [$(grp)]',char(10)
			)
		  END
	)
FROM 
	sys.databases
WHERE 1=1
	AND name IN (
		 'EDW'
		,'EDW_Stage'
		,'EnertiaLive'
		,'EnertiaTest'
		,'EnertiaDev'
		,'Edw_Integration_Framework'
		,'Common_Integration_Framework'
	)


IF serverproperty('MachineName') IN ('devssis01', 'testssis01')
BEGIN
	SELECT @SQL = concat(@SQL,
			  'USE msdb',char(10)
			 ,'EXEC sys.sp_addrolemember @rolename=''SQLAgentOperatorRole'', @membername=''$(grp)''', char(10)
			 ,'GRANT SELECT TO [$(grp)]',char(10)
			 ,'USE ssisdb',char(10)
			 ,'EXEC sys.sp_addrolemember @rolename=''ssis_admin'', @membername=''$(grp)''', char(10)
			 ,'EXEC sys.sp_addrolemember @rolename=''db_datareader'', @membername=''$(grp)''', char(10)
			 ,'GRANT SHOWPLAN TO [$(grp)]',char(10)
			 ,'USE master',char(10)
			 ,'GRANT VIEW SERVER STATE TO [$(grp)]',char(10)
		)

END
PRINT @SQL
EXEC (@SQL)
