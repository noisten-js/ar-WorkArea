USE [EDW]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER PROCEDURE [Etl].[Load_SigmaFlow_Dim_Well_Header]
(
    @Process_Name            NVARCHAR(256) = NULL
   ,@Page_Size               INT           = 200
   ,@TruncateStagingData     BIT           = 1
   ,@LoadStagingData         BIT           = 1
   ,@ProcessData             BIT           = 1
   ,@ExcludeMatchedChecksums BIT           = 1
   ,@Debug                   TINYINT       = 1
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
        SET @Process_Name = COALESCE(@Process_Name, N'ETL: SigmaFlow.Dim_Well_Header');

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

        -- Create Source Data Since it is a calculated subset of Well Header information
        IF @TruncateStagingData = 1
        BEGIN
            IF (OBJECT_ID(N'Staging.SigmaFlow_Dim_Well_Header') IS NOT NULL)
            BEGIN
                DROP TABLE Staging.SigmaFlow_Dim_Well_Header;
            END;
            CREATE TABLE Staging.SigmaFlow_Dim_Well_Header
            (
                UID_Left                          UNIQUEIDENTIFIER NOT NULL
                    DEFAULT NEWSEQUENTIALID()
               ,API_County_Name                   NVARCHAR(255)    NULL
               ,API_Number                        VARCHAR(30)      NULL
               ,API_State_Name                    NVARCHAR(255)    NULL
               ,Big_Rig_Name                      NVARCHAR(500)    NULL
               ,Big_Rig_Spud_Date_Actual          DATETIME         NULL
               ,Big_Rig_Spud_Date_Planned         DATETIME         NULL
               ,County                            NVARCHAR(250)    NULL
               ,Drill_Out_End_Date_Planned        DATETIME         NULL
               ,Drill_Out_Start_Date_Planned      DATETIME         NULL
               ,Drilling_Group_Name               VARCHAR(2000)    NULL
               ,First_Production_Date_Gas_Planned DATETIME         NULL
               ,Frac_End_Date                     DATETIME         NULL
               ,Frac_Start_Date                   DATETIME         NULL
               ,Longstring_Spud_Date_Planned      DATETIME         NULL
               ,Pad_Name                          NVARCHAR(255)    NULL
               ,Pad_Name_Antero_Standard          NVARCHAR(255)    NULL
			   ,Permit_Status					  NVARCHAR(255)    NULL
			   ,Permit_Status_Date				  DATETIME         NULL
               ,Planned_To_Spud_In_Next_2_Years   VARCHAR(3)       NOT NULL
               ,Planned_To_Spud_In_Next_5_Years   VARCHAR(3)       NOT NULL
               ,Prospect                          NVARCHAR(300)    NULL
               ,Rig_Release_Date_Actual           DATETIME         NULL
               ,Rig_Release_Date_Planned          DATETIME         NULL
               ,SEQNUM                            INT              NULL
               ,SigmaFlow_Dim_Pad_Header_UID      UNIQUEIDENTIFIER NULL
               ,SigmaFlow_Dim_Unit_Header_UID     UNIQUEIDENTIFIER NULL
               ,SigmaFlow_ID                      UNIQUEIDENTIFIER NULL
               ,Small_Rig_Name                    NVARCHAR(500)    NULL
               ,Small_Rig_Spud_Date_Actual        DATETIME         NULL
               ,Small_Rig_Spud_Date_Planned       DATETIME         NULL
               ,State_Name                        NVARCHAR(255)    NULL
               ,Surface_Spud_Date_Actual          DATETIME         NULL
               ,Surface_Spud_Date_Planned         DATETIME         NULL
               ,Unit_Id                           UNIQUEIDENTIFIER NULL
               ,Unit_Name                         NVARCHAR(255)    NULL
               ,Unit_Name_Antero_Standard         NVARCHAR(255)    NULL
               ,Well_Name                         NVARCHAR(255)    NULL
               ,Well_Name_Antero_Standard         VARCHAR(300)     NULL
               ,Wellbore_Name_Antero_Standard     VARCHAR(300)     NULL
               ,Wellbore_Name                     VARCHAR(300)     NULL
               ,WSN_Number                        INT              NULL
               ,Processing_State                  TINYINT          NOT NULL
                    DEFAULT (0)
               ,EDW_Checksum                      AS CAST(HASHBYTES('SHA1', CONCAT(API_County_Name, API_Number, API_State_Name, Big_Rig_Name, Frac_End_Date, Frac_Start_Date, Pad_Name, Pad_Name_Antero_Standard, Planned_To_Spud_In_Next_2_Years, Planned_To_Spud_In_Next_5_Years, Prospect, SEQNUM, Small_Rig_Name, State_Name, Unit_Id, Unit_Name, Unit_Name_Antero_Standard, Well_Name, WSN_Number, SigmaFlow_ID, County, Drill_Out_End_Date_Planned, Drill_Out_Start_Date_Planned, Longstring_Spud_Date_Planned, Rig_Release_Date_Actual, Rig_Release_Date_Planned, Surface_Spud_Date_Actual, Surface_Spud_Date_Planned, Wellbore_Name_Antero_Standard, Wellbore_Name, SigmaFlow_Dim_Unit_Header_UID, SigmaFlow_Dim_Pad_Header_UID, Well_Name_Antero_Standard, Big_Rig_Spud_Date_Actual, Big_Rig_Spud_Date_Planned, Small_Rig_Spud_Date_Actual, Small_Rig_Spud_Date_Planned, First_Production_Date_Gas_Planned, Drilling_Group_Name, Permit_Status_Date,Permit_Status)) AS VARBINARY(20))PERSISTED
               ,CONSTRAINT PK_Staging_SigmaFlow_Dim_Well_Header
                    PRIMARY KEY CLUSTERED (UID_Left)
            );

        END;
        IF @LoadStagingData = 1
        BEGIN

            -- DEBUG: Execution Time
            IF (@Debug & 1) = 1
            BEGIN
                SET @Debug_Message = N'BEGIN => Load Staging Data';
                EXEC Log.Track_Execution_Time
                    @Execution_Start = @Execution_Start
                   ,@Execution_Step_Start = @Execution_Step_Start OUTPUT
                   ,@Message = @Debug_Message
                   ,@Write_Log = 1
                   ,@Write_Log_Execution_ID = @Execution_ID
                   ,@Write_Log_Executing_Object_ID = @Procedure_ID;
            END;


            INSERT INTO Staging.SigmaFlow_Dim_Well_Header
            (
                API_County_Name
               ,API_Number
               ,API_State_Name
               ,Big_Rig_Name
               ,Big_Rig_Spud_Date_Actual
               ,Big_Rig_Spud_Date_Planned
               ,Drilling_Group_Name
               ,First_Production_Date_Gas_Planned
               ,Frac_End_Date
               ,Frac_Start_Date
               ,Pad_Name
               ,Pad_Name_Antero_Standard
			   ,Permit_Status
			   ,Permit_Status_Date
               ,Planned_To_Spud_In_Next_2_Years
               ,Planned_To_Spud_In_Next_5_Years
               ,Prospect
               ,SEQNUM
               ,Small_Rig_Name
               ,Small_Rig_Spud_Date_Actual
               ,Small_Rig_Spud_Date_Planned
               ,State_Name
               ,Well_Name
               ,WSN_Number
               ,Unit_Id
               ,Unit_Name
               ,Unit_Name_Antero_Standard
               ,SigmaFlow_ID
               ,County
               ,Drill_Out_End_Date_Planned
               ,Drill_Out_Start_Date_Planned
               ,Longstring_Spud_Date_Planned
               ,Rig_Release_Date_Actual
               ,Rig_Release_Date_Planned
               ,Surface_Spud_Date_Actual
               ,Surface_Spud_Date_Planned
               ,Wellbore_Name_Antero_Standard
               ,Wellbore_Name
               ,SigmaFlow_Dim_Unit_Header_UID
               ,SigmaFlow_Dim_Pad_Header_UID
               ,Well_Name_Antero_Standard
            )
------------------------------------------------
---3
---             SELECT Well_Name_Antero_Standard,COUNT(*) FROM (
---2
                SELECT
                API_County_Name
               ,API_Number
               ,API_State_Name
               ,Big_Rig_Name
               ,Big_Rig_Spud_Date_Actual
               ,Big_Rig_Spud_Date_Planned
               ,Drilling_Group_Name
               ,First_Production_Date_Gas_Planned
               ,Frac_End_Date
               ,Frac_Start_Date
               ,Pad_Name
               ,Pad_Name_Antero_Standard
			   ,Permit_Status_Calculated
			   ,Permit_Status_Date_Calculated
               ,Planned_To_Spud_In_Next_2_Years
               ,Planned_To_Spud_In_Next_5_Years
               ,Prospect
               ,SEQNUM
               ,Small_Rig_Name
               ,Small_Rig_Spud_Date_Actual
               ,Small_Rig_Spud_Date_Planned
               ,State_Name
               ,Well_Name_Antero_Standard
               ,WSN_Number
               ,Related_Unit_Unique_Identifier
               ,Unit_Name
               ,Unit_Name_Antero_Standard
               ,SigmaFlow_ID
               ,County
               ,Drill_Out_End_Date_Planned
               ,Drill_Out_Start_Date_Planned
               ,Longstring_Spud_Date_Planned
               ,Rig_Release_Date_Actual
               ,Rig_Release_Date_Planned
               ,Surface_Spud_Date_Actual
               ,Surface_Spud_Date_Planned
               ,Wellbore_Name_Antero_Standard
               ,Wellbore_Name
               ,SigmaFlow_Dim_Unit_Header_UID
               ,SigmaFlow_Dim_Pad_Header_UID
			   ,Well_Name_Antero_Standard

				FROM (
---1
                SELECT
			    ROW_NUMBER() OVER (PARTITION BY [Well_Name_Antero_Standard] ORDER BY SEQNUM DESC) AS [Row Num Dim],
                vwhs.API_County_Name
               ,vwhs.API_Number
               ,vwhs.API_State_Name
               ,vwhs.Big_Rig_Name
               ,vwhs.Big_Rig_Spud_Date_Actual
               ,vwhs.Big_Rig_Spud_Date_Planned
               ,vwhs.Drilling_Group_Name
               ,vwhs.First_Production_Date_Gas_Planned
               ,vwhs.Frac_End_Date
               ,vwhs.Frac_Start_Date
               ,vwhs.Pad_Name
               ,Translate.fn_Standardize_Pad_Name(vwhs.Pad_Name)   AS Pad_Name_Antero_Standard
			   ,vwhs.Permit_Status_Calculated
			   ,vwhs.Permit_Status_Date_Calculated
               ,vwhs.Planned_To_Spud_In_Next_2_Years
               ,vwhs.Planned_To_Spud_In_Next_5_Years
               ,vwhs.Prospect
               ,vwhs.SEQNUM
               ,vwhs.Small_Rig_Name
               ,vwhs.Small_Rig_Spud_Date_Actual
               ,vwhs.Small_Rig_Spud_Date_Planned
               ,vwhs.State_Name
               ,vwhs.Well_Name_Antero_Standard
               ,vwhs.WSN_Number
               ,vwhs.Related_Unit_Unique_Identifier
               ,vwhs.Unit_Name
               ,Translate.fn_Standardize_Unit_Name(vwhs.Unit_Name) AS Unit_Name_Antero_Standard
               ,vwhs.sigmaguid                                     AS SigmaFlow_ID
               ,vwhs.API_County_Name                               AS County
               ,vwhs.Drill_Out_End_Date                            AS Drill_Out_End_Date_Planned
               ,vwhs.Drill_Out_Start_Date                          AS Drill_Out_Start_Date_Planned
               ,vwhs.Longstring_Spud_Date_Planned
               ,vwhs.Rig_Release_Date_Actual
               ,vwhs.Rig_Release_Date_Planned
               ,vwhs.Surface_Spud_Date_Actual
               ,vwhs.Surface_Spud_Date_Planned
               ,vwhs.Wellbore_Name_Antero_Standard
               ,vwhs.Wellbore_Name_Title_Case                      AS Wellbore_Name
               ,duh.SigmaFlow_Dim_Unit_Header_UID
               ,dph.SigmaFlow_Dim_Pad_Header_UID
            FROM Translate.View_Well_Header_SigmaFlow AS vwhs
                LEFT JOIN 
				(SELECT DISTINCT Unit_Id ,SigmaFlow_Dim_Unit_Header_UID FROM SigmaFlow.Dim_Unit_Header) AS duh ON vwhs.Related_Unit_Unique_Identifier = duh.Unit_Id
                LEFT JOIN 
				(SELECT DISTINCT Pad_Id ,SigmaFlow_Dim_Pad_Header_UID   FROM SigmaFlow.Dim_Pad_Header)   AS dph ON vwhs.Related_Pad_Unique_Identifier = dph.Pad_ID
---1
            ) aa
            WHERE [Row Num Dim] = 1
---2

---        ) bb GROUP BY Well_Name_Antero_Standard
---        ORDER BY 2 DESC
---3
------------------------------------------------

            -- DEBUG: Execution Time
            IF (@Debug & 1) = 1
            BEGIN
                SET @Debug_Message = N'END => Load Staging Data';
                EXEC Log.Track_Execution_Time
                    @Execution_Start = @Execution_Start
                   ,@Execution_Step_Start = @Execution_Step_Start OUTPUT
                   ,@Message = @Debug_Message
                   ,@Write_Log = 1
                   ,@Write_Log_Execution_ID = @Execution_ID
                   ,@Write_Log_Executing_Object_ID = @Procedure_ID;
            END;



        END;

        IF @TruncateStagingData = 1
        BEGIN
            -- SQL Prompt formatting off
            CREATE NONCLUSTERED INDEX IX_SigmaFlow_Dim_Well_Header_01 ON Staging.SigmaFlow_Dim_Well_Header (Processing_State) INCLUDE (UID_Left, SigmaFlow_ID)
            CREATE NONCLUSTERED INDEX IX_SigmaFlow_Dim_Well_Header_02 ON Staging.SigmaFlow_Dim_Well_Header (Processing_State) INCLUDE (UID_Left, SEQNUM)
            CREATE NONCLUSTERED INDEX IX_SigmaFlow_Dim_Well_Header_03 ON Staging.SigmaFlow_Dim_Well_Header (Processing_State) INCLUDE (UID_Left, WSN_Number)
            CREATE NONCLUSTERED INDEX IX_SigmaFlow_Dim_Well_Header_04 ON Staging.SigmaFlow_Dim_Well_Header (Processing_State) INCLUDE (UID_Left, API_Number)
            CREATE NONCLUSTERED INDEX IX_SigmaFlow_Dim_Well_Header_05 ON Staging.SigmaFlow_Dim_Well_Header (Processing_State) INCLUDE (UID_Left, Well_Name_Antero_Standard)
            CREATE NONCLUSTERED INDEX IX_SigmaFlow_Dim_Well_Header_06 ON Staging.SigmaFlow_Dim_Well_Header (Processing_State) INCLUDE (UID_Left, EDW_Checksum)
        -- SQL Prompt formatting on
        END;

        IF @ProcessData = 0
        BEGIN
            RETURN 0;
        END;

        IF @ExcludeMatchedChecksums = 1
        BEGIN
            UPDATE st
            SET st.Processing_State = 9
            --OUTPUT INSERTED.SigmaFlow_Dim_Pad_Header_UID
            FROM Staging.SigmaFlow_Dim_Well_Header   AS st
                INNER JOIN SigmaFlow.Dim_Well_Header AS dt ON st.EDW_Checksum = dt.EDW_Checksum;
        END;

        WHILE EXISTS
              (
                  SELECT 1
                  FROM Staging.SigmaFlow_Dim_Well_Header AS src
                  WHERE src.Processing_State = 0
              )
        BEGIN

            UPDATE TOP (@Page_Size)
                src
            SET src.Processing_State = 1
            FROM Staging.SigmaFlow_Dim_Well_Header AS src
            WHERE src.Processing_State = 0;

            EXEC Rules.Process
                @Entity_Name = N'SigmaFlow.Dim_Well_Header'
               ,@Matched_Result_Table_Name = N'#rules_result_matched'
               ,@Unmatched_Result_Table_Name = N'#rules_result_unmatched';

            UPDATE src
            SET src.Processing_State = 2
            FROM Staging.SigmaFlow_Dim_Well_Header AS src
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
                    FROM Staging.SigmaFlow_Dim_Well_Header AS src
                ) AS cc;

                DECLARE
                    @Progress_Count       INT
                   ,@Progress_Total_Count INT;

                SELECT
                    @Progress_Count       = SUM(IIF(src.Processing_State = 2, 1, 0))
                   ,@Progress_Total_Count = COUNT(*)
                FROM Staging.SigmaFlow_Dim_Well_Header AS src;

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
        CREATE NONCLUSTERED INDEX IX_#rules_result_matched_Processed_State ON #rules_result_matched (Processed_State) INCLUDE (UID_Right)
    -- SQL Prompt formatting on

        DO_MERGE:

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
                                           rrmf.Relative_Match_Confidence
                                          ,rrmf.UID_Left
                                      ) AS RID
                FROM #rules_result_matched AS rrmf
                WHERE rrmf.Processed_State = 0
            )                      AS f ON rrm.UID_Left = f.UID_Left
                                           AND rrm.UID_Right = f.UID_Right
                                           AND f.RID = 1;

        MERGE INTO SigmaFlow.Dim_Well_Header AS Target
        USING
        (
            SELECT
                rrm.UID_Right
               ,src.*
               ,GETUTCDATE() AS EDW_Update_Date
            FROM #rules_result_matched                       AS rrm
                INNER JOIN Staging.SigmaFlow_Dim_Well_Header AS src ON rrm.UID_Left = src.UID_Left
            WHERE rrm.Processed_State = 1
        ) AS Source
        ON (Target.SigmaFlow_Dim_Well_Header_UID = Source.UID_Right)
        WHEN MATCHED AND (Target.EDW_Checksum <> Source.EDW_Checksum) THEN
            UPDATE SET
                Target.API_County_Name = Source.API_County_Name
               ,Target.API_Number = Source.API_Number
               ,Target.API_State_Name = Source.API_State_Name
               ,Target.Big_Rig_Name = Source.Big_Rig_Name
               ,Target.Big_Rig_Spud_Date_Actual = Source.Big_Rig_Spud_Date_Actual
               ,Target.Big_Rig_Spud_Date_Planned = Source.Big_Rig_Spud_Date_Planned
               ,Target.Drilling_Group_Name = Source.Drilling_Group_Name
               ,Target.First_Production_Date_Gas_Planned = Source.First_Production_Date_Gas_Planned
               ,Target.Frac_End_Date = Source.Frac_End_Date
               ,Target.Frac_Start_Date = Source.Frac_Start_Date
               ,Target.Pad_Name = Source.Pad_Name
               ,Target.Pad_Name_Antero_Standard = Source.Pad_Name_Antero_Standard
			   ,Target.Permit_Status = Source.Permit_Status
			   ,Target.Permit_Status_Date = Source.Permit_Status_Date
               ,Target.Planned_To_Spud_In_Next_2_Years = Source.Planned_To_Spud_In_Next_2_Years
               ,Target.Planned_To_Spud_In_Next_5_Years = Source.Planned_To_Spud_In_Next_5_Years
               ,Target.Prospect = Source.Prospect
               ,Target.SEQNUM = Source.SEQNUM
               ,Target.Small_Rig_Name = Source.Small_Rig_Name
               ,Target.Small_Rig_Spud_Date_Actual = Source.Small_Rig_Spud_Date_Actual
               ,Target.Small_Rig_Spud_Date_Planned = Source.Small_Rig_Spud_Date_Planned
               ,Target.State_Name = Source.State_Name
               ,Target.Well_Name = Source.Well_Name
               ,Target.WSN_Number = Source.WSN_Number
               ,Target.Unit_Id = Source.Unit_Id
               ,Target.Unit_Name = Source.Unit_Name
               ,Target.Unit_Name_Antero_Standard = Source.Unit_Name_Antero_Standard
               ,Target.Sigmaflow_ID = Source.SigmaFlow_ID
               ,Target.County = Source.County
               ,Target.Drill_Out_End_Date_Planned = Source.Drill_Out_End_Date_Planned
               ,Target.Drill_Out_Start_Date_Planned = Source.Drill_Out_Start_Date_Planned
               ,Target.Longstring_Spud_Date_Planned = Source.Longstring_Spud_Date_Planned
               ,Target.Rig_Release_Date_Actual = Source.Rig_Release_Date_Actual
               ,Target.Rig_Release_Date_Planned = Source.Rig_Release_Date_Planned
               ,Target.Surface_Spud_Date_Actual = Source.Surface_Spud_Date_Actual
               ,Target.Surface_Spud_Date_Planned = Source.Surface_Spud_Date_Planned
               ,Target.Wellbore_Name_Antero_Standard = Source.Wellbore_Name_Antero_Standard
               ,Target.Wellbore_Name = Source.Wellbore_Name
               ,Target.SigmaFlow_Dim_Unit_Header_UID = Source.SigmaFlow_Dim_Unit_Header_UID
               ,Target.SigmaFlow_Dim_Pad_Header_UID = Source.SigmaFlow_Dim_Pad_Header_UID
               ,Target.Well_Name_Antero_Standard = Source.Well_Name_Antero_Standard
               ,Target.EDW_Update_Date = Source.EDW_Update_Date
               ,Target.EDW_Checksum = Source.EDW_Checksum
               ,Target.EDW_Is_Deleted = 0;

        UPDATE rrm
        SET Processed_State = 2
        FROM #rules_result_matched AS rrm
        WHERE rrm.Processed_State = 1;

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

        IF EXISTS
        (
            SELECT 1
            FROM #rules_result_matched AS rrm
            WHERE rrm.Processed_State = 0
        )
        BEGIN
            GOTO DO_MERGE;
        END;

        INSERT INTO SigmaFlow.Dim_Well_Header
        (
            API_County_Name
           ,API_Number
           ,API_State_Name
           ,Big_Rig_Name
           ,Big_Rig_Spud_Date_Actual
           ,Big_Rig_Spud_Date_Planned
           ,Drilling_Group_Name
           ,First_Production_Date_Gas_Planned
           ,Frac_End_Date
           ,Frac_Start_Date
           ,Pad_Name
           ,Pad_Name_Antero_Standard
		   ,Permit_Status
		   ,Permit_Status_Date
           ,Planned_To_Spud_In_Next_2_Years
           ,Planned_To_Spud_In_Next_5_Years
           ,Prospect
           ,SEQNUM
           ,Small_Rig_Name
           ,Small_Rig_Spud_Date_Actual
           ,Small_Rig_Spud_Date_Planned
           ,State_Name
           ,Well_Name
           ,WSN_Number
           ,Unit_Id
           ,Unit_Name
           ,Unit_Name_Antero_Standard
           ,Sigmaflow_ID
           ,County
           ,Drill_Out_End_Date_Planned
           ,Drill_Out_Start_Date_Planned
           ,Longstring_Spud_Date_Planned
           ,Rig_Release_Date_Actual
           ,Rig_Release_Date_Planned
           ,Surface_Spud_Date_Actual
           ,Surface_Spud_Date_Planned
           ,Wellbore_Name_Antero_Standard
           ,Wellbore_Name
           ,SigmaFlow_Dim_Unit_Header_UID
           ,SigmaFlow_Dim_Pad_Header_UID
           ,Well_Name_Antero_Standard
           ,EDW_Checksum
        )
        SELECT
            src.API_County_Name
           ,src.API_Number
           ,src.API_State_Name
           ,src.Big_Rig_Name
           ,src.Big_Rig_Spud_Date_Actual
           ,src.Big_Rig_Spud_Date_Planned
           ,src.Drilling_Group_Name
           ,src.First_Production_Date_Gas_Planned
           ,src.Frac_End_Date
           ,src.Frac_Start_Date
           ,src.Pad_Name
           ,src.Pad_Name_Antero_Standard
		   ,src.Permit_Status
		   ,src.Permit_Status_Date
           ,src.Planned_To_Spud_In_Next_2_Years
           ,src.Planned_To_Spud_In_Next_5_Years
           ,src.Prospect
           ,src.SEQNUM
           ,src.Small_Rig_Name
           ,src.Small_Rig_Spud_Date_Actual
           ,src.Small_Rig_Spud_Date_Planned
           ,src.State_Name
           ,src.Well_Name
           ,src.WSN_Number
           ,src.Unit_Id
           ,src.Unit_Name
           ,src.Unit_Name_Antero_Standard
           ,src.SigmaFlow_ID
           ,src.County
           ,src.Drill_Out_End_Date_Planned
           ,src.Drill_Out_Start_Date_Planned
           ,src.Longstring_Spud_Date_Planned
           ,src.Rig_Release_Date_Actual
           ,src.Rig_Release_Date_Planned
           ,src.Surface_Spud_Date_Actual
           ,src.Surface_Spud_Date_Planned
           ,src.Wellbore_Name_Antero_Standard
           ,src.Wellbore_Name
           ,src.SigmaFlow_Dim_Unit_Header_UID
           ,src.SigmaFlow_Dim_Pad_Header_UID
           ,src.Well_Name_Antero_Standard
           ,src.EDW_Checksum
        FROM Staging.SigmaFlow_Dim_Well_Header AS src
        WHERE
            src.Processing_State <> 9
            AND NOT EXISTS
        (
            SELECT 1
            FROM #rules_result_matched AS rrm
            WHERE src.UID_Left = rrm.UID_Left
        );

        -- Remove Deleted Wells
        WITH Deleted_Wells
        AS
        (
            SELECT dwh.Sigmaflow_ID
            FROM SigmaFlow.Dim_Well_Header AS dwh
            EXCEPT
            SELECT vwhs.sigmaguid
            FROM Translate.View_Well_Header_SigmaFlow AS vwhs
        )
        UPDATE dwh
        SET
            dwh.EDW_Is_Deleted = 1
           ,dwh.EDW_Checksum = 0x0
        FROM SigmaFlow.Dim_Well_Header AS dwh
            INNER JOIN Deleted_Wells   AS d ON dwh.Sigmaflow_ID = d.Sigmaflow_ID;


        -- Remove Duplicates
        --WITH Dulicate_Wells
        --AS
        --(
        --    SELECT
        --        dwh.SigmaFlow_Dim_Well_Header_UID
        --       ,ROW_NUMBER() OVER (PARTITION BY dwh.Well_Name_Antero_Standard
        --                           ORDER BY dwh.SEQNUM DESC
        --                          ) AS Well_RID
        --    FROM SigmaFlow.Dim_Well_Header AS dwh
        --    WHERE dwh.EDW_Is_Deleted = 0
        --)
        --UPDATE dwh
        --SET
        --    dwh.EDW_Is_Deleted = 1
        --   ,dwh.EDW_Checksum = 0x0
        --FROM SigmaFlow.Dim_Well_Header AS dwh
        --    INNER JOIN Dulicate_Wells  AS dw ON dwh.SigmaFlow_Dim_Well_Header_UID = dw.SigmaFlow_Dim_Well_Header_UID
        --                                        AND dw.Well_RID > 1;

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


