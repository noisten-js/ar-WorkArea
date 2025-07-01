USE [EDW]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER   PROCEDURE [Master_Etl].[Map_Master_Sat_Well_Header_WellView]
(
    @Process_Name        NVARCHAR(256) = NULL
   ,@Page_Size           INT           = 500
   ,@TruncateStagingData BIT           = 0
   ,@LoadStagingData     BIT           = 1
   ,@ProcessData         BIT           = 1
   ,@IncrementalOverride BIT           = 1
   ,@Allow_Duplicates    BIT           = 1
   ,@Debug               TINYINT       = 1
)
AS
BEGIN

    SET NOCOUNT, XACT_ABORT ON;

    DECLARE @retval INT = -1

    BEGIN TRY

        DECLARE
            @Execution_Start      DATETIME        = GETUTCDATE()
           ,@Execution_Step_Start DATETIME
           ,@Debug_Message        NVARCHAR(256)
           ,@Formatted_Count      VARCHAR(50)
           ,@Procedure_ID         INT             = @@PROCID
           ,@Execution_ID         UNIQUEIDENTIFIER;
        SET @Process_Name = COALESCE(@Process_Name, N'MASTER ETL MAP: Master.Sat_Well_Header_WellView');


        -- DEBUG: Log Start Execution
        EXEC Log.Execution_Start
            @Process_Name = @Process_Name
           ,@Execution_ID = @Execution_ID OUTPUT;

        IF (OBJECT_ID(N'tempdb..#rules_result_matched') IS NOT NULL)
        BEGIN
            DROP TABLE #rules_result_matched;
        END;
        CREATE TABLE #rules_result_matched
        (
            UID_Left                  UNIQUEIDENTIFIER NOT NULL
           ,UID_Right                 UNIQUEIDENTIFIER NOT NULL
           ,Match_Confidence          FLOAT            NOT NULL
           ,Relative_Match_Confidence FLOAT            NOT NULL
           ,
           PRIMARY KEY CLUSTERED (
                                     UID_Left
                                    ,UID_Right
                                 )
        );

        IF (OBJECT_ID(N'tempdb..#rules_result_unmatched') IS NOT NULL)
        BEGIN
            DROP TABLE #rules_result_unmatched;
        END;
        CREATE TABLE #rules_result_unmatched
        (
            UID_Left UNIQUEIDENTIFIER NOT NULL
           ,
           PRIMARY KEY CLUSTERED (UID_Left)
        );

        -- DEBUG: Execution Time
        IF (@Debug & 1) = 1
        BEGIN
            SET @Debug_Message = N'BEGIN => Paging';
            EXEC Log.Track_Execution_Time
                @Execution_Start = @Execution_Start
               ,@Execution_Step_Start = @Execution_Step_Start OUTPUT
               ,@Message = @Debug_Message
               ,@Write_Log = 1
               ,@Write_Log_Execution_ID = @Execution_ID
               ,@Write_Log_Executing_Object_ID = @Procedure_ID;
        END;

        IF @TruncateStagingData = 1
        BEGIN
            IF (OBJECT_ID(N'Master_Staging.WellView_Dim_Well_Header') IS NOT NULL)
            BEGIN
                DROP TABLE Master_Staging.WellView_Dim_Well_Header;

                SELECT TOP (0)
                       dwh.WellView_Dim_Well_Header_UID
                      ,dwh.EDW_Checksum
                      ,CAST(0 AS TINYINT) AS Processing_State
                INTO Master_Staging.WellView_Dim_Well_Header
                FROM WellView.Dim_Well_Header AS dwh;

                -- SQL Prompt formatting off
                CREATE CLUSTERED INDEX IX_Master_Staging_WellView_Dim_Well_Header_01 ON Master_Staging.WellView_Dim_Well_Header (WellView_Dim_Well_Header_UID)
                CREATE NONCLUSTERED INDEX IX_Master_Staging_WellView_Dim_Well_Header_02 ON Master_Staging.WellView_Dim_Well_Header (Processing_State) INCLUDE (WellView_Dim_Well_Header_UID, EDW_Checksum)
            -- SQL Prompt formatting on

				EXEC('CREATE TRIGGER tr_js_ms ON Master_Staging.WellView_Dim_Well_Header FOR INSERT, UPDATE, DELETE AS INSERT INTO master_etl.mappinglog_delete_this_anytime SELECT *, SYSDATETIME() FROM inserted')
            END;
        END;

        IF @LoadStagingData = 1
        BEGIN
            MERGE INTO Master_Staging.WellView_Dim_Well_Header AS Target
            USING
            (
                SELECT TOP (100) PERCENT
                       dwh.WellView_Dim_Well_Header_UID
                      ,dwh.EDW_Checksum
                      ,CAST(0 AS TINYINT) AS Processing_State
                FROM WellView.Dim_Well_Header AS dwh
                WHERE dwh.EDW_Is_Deleted = 0
                ORDER BY dwh.WellView_Dim_Well_Header_UID
            ) AS Source
            ON Source.WellView_Dim_Well_Header_UID = Target.WellView_Dim_Well_Header_UID
            WHEN MATCHED THEN
                UPDATE SET
                    Target.EDW_Checksum = Source.EDW_Checksum
                   ,Target.Processing_State = IIF(@IncrementalOverride = 1, 0, IIF(Target.EDW_Checksum <> Source.EDW_Checksum, 0, 9 /* Do Not Process */))
            WHEN NOT MATCHED BY SOURCE THEN
                DELETE
            WHEN NOT MATCHED BY TARGET THEN
                INSERT
                (
                    WellView_Dim_Well_Header_UID
                   ,EDW_Checksum
                   ,Processing_State
                )
                VALUES
                (
                    Source.WellView_Dim_Well_Header_UID
                   ,Source.EDW_Checksum
                   ,Source.Processing_State
                );


            --==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
            -- Reprocess Unmatched Wells
            --==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
---         SELECT * FROM Master_Etl.Map_Well_Header_Unmatched_WellView         
---         SELECT * FROM Master_Etl.Map_Well_Header_Duplicate_Matches_WellView 
---         SELECT * FROM Master_Etl.Map_Well_Header_Source_With_Count          
---         SELECT * FROM [Master_Etl].[Map_Well_Header_Source_Count]
---         SELECT * FROM [Master_Etl].[Map_Well_Header_Single_Source_Count]

            UPDATE pdwh
            SET pdwh.Processing_State = 0
            FROM Master_Staging.WellView_Dim_Well_Header                 AS pdwh
                INNER JOIN Master_Etl.Map_Well_Header_Unmatched_WellView AS mwhup ON pdwh.WellView_Dim_Well_Header_UID = mwhup.WellView_Dim_Well_Header_UID
            WHERE pdwh.Processing_State = 9


            UPDATE pdwh
            SET pdwh.Processing_State = 0
            FROM Master_Staging.WellView_Dim_Well_Header                         AS pdwh
                INNER JOIN Master_Etl.Map_Well_Header_Duplicate_Matches_WellView AS mwhp ON pdwh.WellView_Dim_Well_Header_UID = mwhp.WellView_Dim_Well_Header_UID
            WHERE pdwh.Processing_State = 9

            UPDATE dwh
            SET dwh.Processing_State = 0
            FROM Master_Etl.Map_Well_Header                             AS mwh
                INNER JOIN Master_Staging.WellView_Dim_Well_Header         AS dwh ON dwh.WellView_Dim_Well_Header_UID = mwh.WellView_Dim_Well_Header_UID
                INNER JOIN Master_Etl.Map_Well_Header_Source_With_Count AS msc ON dwh.WellView_Dim_Well_Header_UID = msc.WellView_Dim_Well_Header_UID
                                                                                  AND msc.Source_Count = 1
            WHERE dwh.Processing_State = 9

            UPDATE dwh
            SET dwh.Processing_State = 0
            FROM Master_Staging.WellView_Dim_Well_Header AS dwh
            WHERE
                NOT EXISTS
            (
                SELECT 1
                FROM Master_Etl.Map_Well_Header AS mwh
                WHERE mwh.WellView_Dim_Well_Header_UID = dwh.WellView_Dim_Well_Header_UID
            )
                AND dwh.Processing_State = 9


            --==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
            -- Manage Map Table
            --==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
            DECLARE @Merge_Result TABLE
            (
                Master_Hub_Well_Header_UID UNIQUEIDENTIFIER INDEX IX_@Merge_Result_01
               ,Action                     NVARCHAR(50)
            )

            MERGE INTO Master_Etl.Map_Well_Header AS Target
            USING
            (
                SELECT
                    dwh.WellView_Dim_Well_Header_UID
                   ,dwh.EDW_Checksum
                   ,dwh.Processing_State
                   ,ISNULL(msc.Source_Count, 0) AS Source_Count
                FROM Master_Staging.WellView_Dim_Well_Header                  AS dwh
                    LEFT JOIN Master_Etl.Map_Well_Header_Source_With_Count AS msc ON dwh.WellView_Dim_Well_Header_UID = msc.WellView_Dim_Well_Header_UID
            ) AS Source
            ON Source.WellView_Dim_Well_Header_UID = Target.WellView_Dim_Well_Header_UID
            WHEN MATCHED AND (
                                 Source.Processing_State = 0
                                 AND Source.Source_Count > 1
                             ) THEN
                UPDATE SET
                    Target.WellView_Dim_Well_Header_UID = NULL
                   ,Target.WellView_Dim_Well_Header_Match_Confidence = NULL
            WHEN MATCHED AND (
                                 Source.Processing_State = 0
                                 AND Source.Source_Count = 1
                             ) THEN
                DELETE
            WHEN NOT MATCHED BY SOURCE AND (Target.WellView_Dim_Well_Header_UID IS NOT NULL) THEN
                UPDATE SET
                    Target.WellView_Dim_Well_Header_UID = NULL
                   ,Target.WellView_Dim_Well_Header_Match_Confidence = NULL
            OUTPUT
                Deleted.Master_Hub_Well_Header_UID
               ,$ACTION
            INTO @Merge_Result
            (
                Master_Hub_Well_Header_UID
               ,Action
            );

            IF (@Debug & 2) = 2
            BEGIN
                SELECT
                    mr.Master_Hub_Well_Header_UID
                   ,mr.Action
                FROM @Merge_Result AS mr
            END

            DECLARE @Hub_UIDs dbo.List_UNIQUEIDENTIFIER

            INSERT INTO @Hub_UIDs
            SELECT hwh.Hub_Well_Header_UID
            FROM Master.Hub_Well_Header  AS hwh
                INNER JOIN @Merge_Result AS mr ON hwh.Hub_Well_Header_UID = mr.Master_Hub_Well_Header_UID
                                                  AND mr.Action = 'DELETE'
            UNION
            SELECT hwhm.Hub_Well_Header_UID
            FROM Master.Hub_Well_Header AS hwhm
            WHERE
                EXISTS
            (
                SELECT 1
                FROM Master_Etl.Map_Well_Header                             AS mwh
                    INNER JOIN Master_Etl.Map_Well_Header_Source_With_Count AS mwhsc ON mwh.Master_Hub_Well_Header_UID = mwhsc.Master_Hub_Well_Header_UID
                                                                                        AND mwhsc.Source_Count = 0
                WHERE hwhm.Hub_Well_Header_UID = mwh.Master_Hub_Well_Header_UID
            )
            DELETE FROM mwh
            FROM Master_Etl.Map_Well_Header AS mwh
                INNER JOIN @Hub_UIDs        AS hud ON mwh.Master_Hub_Well_Header_UID = hud.value

            EXEC Master.Delete_Well_Header_By_UID
                @Hub_Well_Header_UIDs = @Hub_UIDs
               ,@Perform_Hard_Delete = 1
               ,@Use_Transaction = 0


        END;

        IF @ProcessData = 0
        BEGIN
            RETURN @retval;
        END;

        WHILE EXISTS
              (
                  SELECT 1
                  FROM Master_Staging.WellView_Dim_Well_Header AS src
                  WHERE src.Processing_State = 0
              )
        BEGIN


            UPDATE TOP (@Page_Size)
                src
            SET src.Processing_State = 1
            FROM Master_Staging.WellView_Dim_Well_Header AS src
            WHERE src.Processing_State = 0;

            EXEC Rules.Process
                @Entity_Name = N'MAP:Master.Sat_Well_Header_WellView'
               ,@Matched_Result_Table_Name = N'#rules_result_matched'
               ,@Unmatched_Result_Table_Name = N'#rules_result_unmatched';

            UPDATE src
            SET src.Processing_State = 2
            FROM Master_Staging.WellView_Dim_Well_Header AS src
            WHERE src.Processing_State = 1;

            -- DEBUG: Execution Time
            IF (@Debug & 1) = 1
            BEGIN
                SELECT @Debug_Message = CONCAT('Unprocessed: ', cc.Unprocessed, ', Processing: ', cc.Processing, ', Processed: ', cc.Processed)
                FROM
                (
                    SELECT
                        SUM(IIF(src.Processing_State = 0, 1, 0)) AS Unprocessed
                       ,SUM(IIF(src.Processing_State = 1, 1, 0)) AS Processing
                       ,SUM(IIF(src.Processing_State = 2, 1, 0)) AS Processed
                    FROM Master_Staging.WellView_Dim_Well_Header AS src
                ) AS cc;


                DECLARE
                    @Progress_Count       INT
                   ,@Progress_Total_Count INT;

                SELECT
                    @Progress_Count       = SUM(IIF(src.Processing_State = 2, 1, 0))
                   ,@Progress_Total_Count = COUNT(*)
                FROM Master_Staging.WellView_Dim_Well_Header AS src
                WHERE src.Processing_State <> 9;

                --SET @Debug_Message = NULL
                EXEC Log.Track_Execution_Time
                    @Execution_Start = @Execution_Start
                   ,@Message = @Debug_Message
                   ,@Progress_Count = @Progress_Count
                   ,@Progress_Total_Count = @Progress_Total_Count
                   ,@Write_Log = 1
                   ,@Write_Log_Execution_ID = @Execution_ID
                   ,@Write_Log_Executing_Object_ID = @Procedure_ID;

            END;

        END;


        -- DEBUG: Execution Time
        IF (@Debug & 1) = 1
        BEGIN
            SET @Debug_Message = N'END => Paging';
            EXEC Log.Track_Execution_Time
                @Execution_Start = @Execution_Start
               ,@Execution_Step_Start = @Execution_Step_Start OUTPUT
               ,@Message = @Debug_Message
               ,@Write_Log = 1
               ,@Write_Log_Execution_ID = @Execution_ID
               ,@Write_Log_Executing_Object_ID = @Procedure_ID;
        END;

        --==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
        -- Merge 
        --==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--	
        -- Handle Duplicate Updates

        ALTER TABLE #rules_result_matched
        ADD Processed_State TINYINT NOT NULL
                DEFAULT (0);
        -- SQL Prompt formatting off
        CREATE NONCLUSTERED INDEX IX_#rules_result_matched_Processed_State ON #rules_result_matched (Processed_State) INCLUDE (UID_Right, Match_Confidence)
    -- SQL Prompt formatting on

        --DO_MERGE:

        -- DEBUG: Execution Time
        IF (@Debug & 1) = 1
        BEGIN
            SET @Debug_Message = N'BEGIN => Merging';
            EXEC Log.Track_Execution_Time
                @Execution_Start = @Execution_Start
               ,@Execution_Step_Start = @Execution_Step_Start OUTPUT
               ,@Message = @Debug_Message
               ,@Write_Log = 1
               ,@Write_Log_Execution_ID = @Execution_ID
               ,@Write_Log_Executing_Object_ID = @Procedure_ID;
        END;

        UPDATE rrm
        SET Processed_State = 1
        FROM #rules_result_matched AS rrm
            INNER JOIN
            (
                SELECT
                    rrmf.UID_Left
                   ,rrmf.UID_Right
                   ,rrmf.Match_Confidence
                   ,rrmf.Relative_Match_Confidence
                   ,ROW_NUMBER() OVER (PARTITION BY rrmf.UID_Right
                                       ORDER BY
                                           rrmf.Match_Confidence DESC
                                          ,rrmf.UID_Left
                                      ) AS RID
                FROM #rules_result_matched AS rrmf
                WHERE rrmf.Processed_State = 0
            )                      AS f ON rrm.UID_Left = f.UID_Left
                                           AND rrm.UID_Right = f.UID_Right
                                           AND f.RID = 1;

        MERGE INTO Master_Etl.Map_Well_Header AS Target
        USING
        (
            SELECT
                rrm.UID_Right
               ,rrm.Match_Confidence
               ,src.*
            FROM #rules_result_matched                          AS rrm
                INNER JOIN Master_Staging.WellView_Dim_Well_Header AS pag ON rrm.UID_Left = pag.WellView_Dim_Well_Header_UID
                                                                          AND pag.Processing_State = 2
                INNER JOIN WellView.Dim_Well_Header                AS src ON pag.WellView_Dim_Well_Header_UID = src.WellView_Dim_Well_Header_UID
            WHERE rrm.Processed_State = 1
        ) AS Source
        ON (Target.Master_Hub_Well_Header_UID = Source.UID_Right)
        WHEN MATCHED AND (Target.WellView_Dim_Well_Header_UID IS NULL) THEN
            UPDATE SET
                Target.WellView_Dim_Well_Header_UID = Source.WellView_Dim_Well_Header_UID
               ,Target.WellView_Dim_Well_Header_Match_Confidence = Source.Match_Confidence;

        UPDATE rrm
        SET Processed_State = 2
        FROM #rules_result_matched AS rrm
        WHERE rrm.Processed_State = 1;

        -- reprocess duplicates
        UPDATE rrm
        SET Processed_State = 0
        FROM #rules_result_matched AS rrm
        WHERE
            rrm.Processed_State = 2
            AND NOT EXISTS
        (
            SELECT 1
            FROM Master_Etl.Map_Well_Header AS mwh
            WHERE rrm.UID_Left = mwh.WellView_Dim_Well_Header_UID
        )
            AND NOT EXISTS
        (
            SELECT 1
            FROM Master_Etl.Map_Well_Header_WellView AS mwh
            WHERE rrm.UID_Left = mwh.WellView_Dim_Well_Header_UID
        );

        IF @Allow_Duplicates = 0
        BEGIN

            INSERT INTO #rules_result_unmatched
            (
                UID_Left
            )
            SELECT
                rrm.UID_Left
            FROM #rules_result_matched AS rrm
            WHERE rrm.Processed_State = 0

            DELETE FROM rrm
            FROM #rules_result_matched AS rrm
            WHERE rrm.Processed_State = 0

        END

        -- DEBUG: Execution Time
        IF (@Debug & 1) = 1
        BEGIN
            SET @Debug_Message = N'END => Merging';
            EXEC Log.Track_Execution_Time
                @Execution_Start = @Execution_Start
               ,@Execution_Step_Start = @Execution_Step_Start OUTPUT
               ,@Message = @Debug_Message
               ,@Write_Log = 1
               ,@Write_Log_Execution_ID = @Execution_ID
               ,@Write_Log_Executing_Object_ID = @Procedure_ID;
        END;

        --==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
        DECLARE @Match_Order INT = 2
        TRUNCATE TABLE Master_Etl.Map_Well_Header_WellView

        WHILE EXISTS
              (
                  SELECT 1
                  FROM #rules_result_matched AS rrm
                  WHERE rrm.Processed_State = 0
              )
        BEGIN

            UPDATE rrm
            SET Processed_State = 1
            FROM #rules_result_matched AS rrm
                INNER JOIN
                (
                    SELECT
                        rrmf.UID_Left
                       ,rrmf.UID_Right
                       ,rrmf.Match_Confidence
                       ,rrmf.Relative_Match_Confidence
                       ,ROW_NUMBER() OVER (PARTITION BY rrmf.UID_Right
                                           ORDER BY
                                               rrmf.Match_Confidence DESC
                                              ,rrmf.UID_Left
                                          ) AS RID
                    FROM #rules_result_matched AS rrmf
                    WHERE rrmf.Processed_State = 0
                )                      AS f ON rrm.UID_Left = f.UID_Left
                                               AND rrm.UID_Right = f.UID_Right
                                               AND f.RID = 1;

            MERGE INTO Master_Etl.Map_Well_Header_WellView AS Target
            USING
            (
                SELECT
                    rrm.UID_Right
                   ,rrm.Match_Confidence
                   ,@Match_Order AS Match_Order
                   ,src.*
                FROM #rules_result_matched                          AS rrm
                    INNER JOIN Master_Staging.WellView_Dim_Well_Header AS pag ON rrm.UID_Left = pag.WellView_Dim_Well_Header_UID
                                                                              AND pag.Processing_State = 2
                    INNER JOIN WellView.Dim_Well_Header                AS src ON pag.WellView_Dim_Well_Header_UID = src.WellView_Dim_Well_Header_UID
                WHERE rrm.Processed_State = 1
            ) AS Source
            ON (
                   Target.Master_Hub_Well_Header_UID = Source.UID_Right
                   AND Target.WellView_Dim_Well_Header_UID = Source.WellView_Dim_Well_Header_UID
               )
            WHEN NOT MATCHED BY TARGET THEN
                INSERT
                (
                    Master_Hub_Well_Header_UID
                   ,WellView_Dim_Well_Header_UID
                   ,WellView_Dim_Well_Header_Match_Confidence
                   ,Match_Order
                )
                VALUES
                (
                    Source.UID_Right
                   ,Source.WellView_Dim_Well_Header_UID
                   ,Source.Match_Confidence
                   ,Source.Match_Order
                );

            UPDATE rrm
            SET Processed_State = 2
            FROM #rules_result_matched AS rrm
            WHERE rrm.Processed_State = 1;

            SELECT @Match_Order += 1



        --==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--

        END;

        -- DEBUG: Execution Time
        IF (@Debug & 1) = 1
        BEGIN
            SET @Debug_Message = N'BEGIN => Inserting';
            EXEC Log.Track_Execution_Time
                @Execution_Start = @Execution_Start
               ,@Execution_Step_Start = @Execution_Step_Start OUTPUT
               ,@Message = @Debug_Message
               ,@Write_Log = 1
               ,@Write_Log_Execution_ID = @Execution_ID
               ,@Write_Log_Executing_Object_ID = @Procedure_ID;
        END;

        MERGE INTO Master_Etl.Map_Well_Header AS Target
        USING
        (
            SELECT src.WellView_Dim_Well_Header_UID
            FROM Master_Staging.WellView_Dim_Well_Header AS src
            WHERE
                src.Processing_State = 2
                AND NOT EXISTS
            (
                SELECT 1
                FROM #rules_result_matched AS rrm
                WHERE
                    src.WellView_Dim_Well_Header_UID = rrm.UID_Left
                    AND rrm.Processed_State = 2
            )
            UNION
            SELECT rru.UID_Left
            FROM #rules_result_unmatched AS rru
        ) AS Source
        ON (Target.WellView_Dim_Well_Header_UID = Source.WellView_Dim_Well_Header_UID)
        WHEN NOT MATCHED BY TARGET THEN
            INSERT
            (
                WellView_Dim_Well_Header_UID
            )
            VALUES
            (
                Source.WellView_Dim_Well_Header_UID
            );

        -- DEBUG: Execution Time
        IF (@Debug & 1) = 1
        BEGIN
            SET @Debug_Message = N'END => Inserting';
            EXEC Log.Track_Execution_Time
                @Execution_Start = @Execution_Start
               ,@Execution_Step_Start = @Execution_Step_Start OUTPUT
               ,@Message = @Debug_Message
               ,@Write_Log = 1
               ,@Write_Log_Execution_ID = @Execution_ID
               ,@Write_Log_Executing_Object_ID = @Procedure_ID;
        END;


        -- DEBUG: Log End Execution
        EXEC Log.Execution_End @Execution_ID = @Execution_ID;


        SET @retval = 0;
    END TRY
    BEGIN CATCH

        SET @retval = -1;
        THROW;

    END CATCH

    RETURN @retval;

END;
GO


