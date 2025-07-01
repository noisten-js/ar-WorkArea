
/****************************************************************************************************
-- Connection Capture - ALL
****************************************************************************************************/

IF object_id('[tempdb]..[#ConnectionCapture]') IS NOT NULL
    DROP TABLE [#ConnectionCapture]

SELECT 
     [object_name]
    ,[event_data_XML]    = cast([event_data] AS XML)
    --,* 
INTO [#ConnectionCapture]
FROM 
    sys.fn_xe_file_target_read_file(
        --'E:\FileStore\Extended Event Collection\Connection Capture - Login ONLY*.xel'
        '\\dencifs01\sql_backup_prod\_ExtendedEvents\Login\*.xel'
        ,NULL
        ,NULL
        ,NULL
    )
WHERE
    1=1
	AND event_data LIKE '%Log_Detail%' ESCAPE '\'
    --AND [object_name] like '%Log_Detail_History%'
    --AND [event_data] LIKE '%Office%'

SELECT * FROM [#ConnectionCapture]

