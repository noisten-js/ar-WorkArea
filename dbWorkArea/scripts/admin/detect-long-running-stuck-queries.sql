------------------------------------------------------------------------------------
-- For more details:
-- https://learn.microsoft.com/en-us/troubleshoot/sql/database-engine/performance/troubleshoot-never-ending-query?tabs=2019
------------------------------------------------------------------------------------	

DECLARE @cntr INT = 0

WHILE (@cntr < 3)
BEGIN
    SELECT TOP 10 s.session_id,
                    r.status,
                    r.wait_time,
                    r.wait_type,
                    r.wait_resource,
                    r.cpu_time,
                    r.logical_reads,
                    r.reads,
                    r.writes,
                    r.total_elapsed_time / (1000 * 60) 'Elaps M',
                    substring(st.TEXT, (r.statement_start_offset / 2) + 1,
                    ((CASE r.statement_end_offset
                        WHEN -1 THEN datalength(st.TEXT)
                        ELSE r.statement_end_offset
                    END - r.statement_start_offset) / 2) + 1) AS statement_text,
                    coalesce(quotename(db_name(st.dbid)) + N'.' + quotename(object_schema_name(st.objectid, st.dbid)) 
                    + N'.' + quotename(object_name(st.objectid, st.dbid)), '') AS command_text,
                    r.command,
                    s.login_name,
                    s.host_name,
                    s.program_name,
                    s.last_request_end_time,
                    s.login_time,
                    r.open_transaction_count,
                    atrn.name AS transaction_name,
                    atrn.transaction_id,
                    atrn.transaction_state
        FROM sys.dm_exec_sessions AS s
        JOIN sys.dm_exec_requests AS r ON r.session_id = s.session_id 
                CROSS APPLY sys.Dm_exec_sql_text(r.sql_handle) AS st
        LEFT JOIN (sys.dm_tran_session_transactions AS stran 
             JOIN sys.dm_tran_active_transactions AS atrn
                ON stran.transaction_id = atrn.transaction_id)
        ON stran.session_id =s.session_id
        WHERE r.session_id != @@SPID
        ORDER BY r.cpu_time DESC

    SET @cntr = @cntr + 1
WAITFOR DELAY '00:00:05'
END