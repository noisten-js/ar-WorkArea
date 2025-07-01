USE [EDW]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE OR ALTER PROCEDURE [Etl].[Load_Petra_Dim_Well_Header]
(
    @Process_Name            NVARCHAR(256) = NULL
   ,@Page_Size               INT           = 2000
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
        SET @Process_Name = COALESCE(@Process_Name, N'ETL: Petra.Dim_Well_Header');

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
            IF (OBJECT_ID(N'Staging.Petra_Dim_Well_Header') IS NOT NULL)
            BEGIN
                DROP TABLE Staging.Petra_Dim_Well_Header;
            END;
            CREATE TABLE Staging.Petra_Dim_Well_Header
            (
                UID_Left                      UNIQUEIDENTIFIER NOT NULL
                    DEFAULT NEWSEQUENTIALID()
               ,API_County_Name               NVARCHAR(255)    NULL
               ,API_Number                    VARCHAR(30)      NULL
               ,API_State_Name                NVARCHAR(255)    NULL
               ,Big_Rig_Name                  NVARCHAR(500)    NULL
               ,Big_Rig_Spud_Date             DATETIME         NULL
               ,BottomHole_Latitude_NAD27     FLOAT(53)        NULL
               ,BottomHole_Longitude_NAD27    FLOAT(53)        NULL
               ,Completion_Date_Actual        DATETIME         NULL
               ,Configuration                 NVARCHAR(300)    NULL
               ,County                        NVARCHAR(250)    NULL
               ,Current_Operations            VARCHAR(300)     NULL
               ,Is_Antero_Well                BIT              NULL
               ,Operator                      NVARCHAR(255)    NULL
               ,Pad_Name                      NVARCHAR(255)    NULL
               ,Pad_Name_Antero_Standard      NVARCHAR(255)    NULL
               ,Petra_Dim_Pad_Header_UID      UNIQUEIDENTIFIER NULL
               ,Petra_Dim_Unit_Header_UID     UNIQUEIDENTIFIER NULL
               ,Petra_ID                      VARCHAR(200)     NULL
               ,Producing_Formation           NVARCHAR(300)    NULL
               ,Prospect                      NVARCHAR(300)    NULL
               ,SEQNUM                        INT              NULL
               ,State_Name                    NVARCHAR(255)    NULL
               ,Surface_Latitude_NAD27        FLOAT(53)        NULL
               ,Surface_Location_Shape        GEOMETRY         NULL
               ,Surface_Longitude_NAD27       FLOAT(53)        NULL
               ,Symbol_Code                   VARCHAR(8)       NULL
               ,Total_Measured_Depth_Actual   FLOAT            NULL
               ,Unit_Name                     NVARCHAR(255)    NULL
               ,Unit_Name_Antero_Standard     NVARCHAR(255)    NULL
               ,Well_Name                     NVARCHAR(255)    NULL
               ,Well_Name_Antero_Standard     VARCHAR(300)     NULL
               ,Well_Number                   NVARCHAR(200)    NULL
               ,Wellbore_Name                 VARCHAR(300)     NULL
               ,Wellbore_Name_Antero_Standard VARCHAR(300)     NULL
               ,WSN_Number                    INT              NULL
               ,Scrubbed_Lateral_Length       FLOAT            NULL
               ,Cased_Lateral_Length          FLOAT            NULL
               ,Completable_Lateral_Length    FLOAT            NULL
               ,Drilled_Lateral_Length        FLOAT            NULL
               ,Third_Party_Lateral_Length    FLOAT            NULL
               ,Estimated_Lateral_Length      FLOAT            NULL
               ,Official_Lateral_Length       FLOAT            NULL
               ,USA_Sticks_Lateral_Length     FLOAT            NULL
			   ,Abandon_Date			      DATETIME		   NULL
			   ,Current_SEC_Reserves_Category VARCHAR(300)     NULL
			   ,Field_Name					  VARCHAR(40)      NULL
			   ,Historical_Operator	          VARCHAR(40)	   NULL
			   ,Lease_Name					  VARCHAR(40)      NULL
			   ,Lease_Number				  VARCHAR(12)      NULL
			   ,Permit_Date					  DATETIME	       NULL
			   ,Rig_Release_Date			  DATETIME		   NULL
			   ,Target_Formation			  VARCHAR(300)     NULL
               ,Processing_State              TINYINT          NOT NULL
                    DEFAULT (0)
               ,EDW_Checksum                  AS CAST(HASHBYTES('SHA1', CONCAT(API_County_Name, API_Number, API_State_Name, Big_Rig_Name, Big_Rig_Spud_Date, BottomHole_Latitude_NAD27, BottomHole_Longitude_NAD27, Configuration, County, Operator, Pad_Name, Pad_Name_Antero_Standard, Prospect, SEQNUM, State_Name, Surface_Latitude_NAD27, Surface_Longitude_NAD27, Unit_Name, Unit_Name_Antero_Standard, Well_Name, Well_Number, WSN_Number, Is_Antero_Well, Completion_Date_Actual, Current_Operations, Producing_Formation, Symbol_Code, Total_Measured_Depth_Actual, Wellbore_Name_Antero_Standard, Petra_Dim_Pad_Header_UID, Petra_Dim_Unit_Header_UID, Well_Name_Antero_Standard, Petra_ID, Surface_Location_Shape.STAsText(), Scrubbed_Lateral_Length, Cased_Lateral_Length, Completable_Lateral_Length, Drilled_Lateral_Length, Third_Party_Lateral_Length, Estimated_Lateral_Length, Official_Lateral_Length, USA_Sticks_Lateral_Length,Abandon_Date,Current_SEC_Reserves_Category,Field_Name,Historical_Operator,Lease_Name,Lease_Number,Permit_Date,Rig_Release_Date,Target_Formation)) AS VARBINARY(20))PERSISTED
               ,CONSTRAINT PK_Staging_Petra_Dim_Well_Header
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

            INSERT INTO Staging.Petra_Dim_Well_Header
            (
                County
               ,Operator
               ,Pad_Name
               ,Pad_Name_Antero_Standard
               ,State_Name
               ,Well_Name
               ,API_County_Name
               ,API_Number
               ,API_State_Name
               ,Big_Rig_Name
               ,Big_Rig_Spud_Date
               ,BottomHole_Latitude_NAD27
               ,BottomHole_Longitude_NAD27
               ,Configuration
               ,Prospect
               ,SEQNUM
               ,Surface_Latitude_NAD27
               ,Surface_Longitude_NAD27
               ,Unit_Name
               ,Unit_Name_Antero_Standard
               ,Well_Number
               ,WSN_Number
               ,Is_Antero_Well
               ,Completion_Date_Actual
               ,Current_Operations
               ,Producing_Formation
               ,Symbol_Code
               ,Total_Measured_Depth_Actual
               ,Wellbore_Name
               ,Wellbore_Name_Antero_Standard
               ,Well_Name_Antero_Standard
               ,Petra_ID
               ,Scrubbed_Lateral_Length
               ,Cased_Lateral_Length
               ,Completable_Lateral_Length
               ,Drilled_Lateral_Length
               ,Third_Party_Lateral_Length
               ,Estimated_Lateral_Length
               ,Official_Lateral_Length
               ,USA_Sticks_Lateral_Length
			   ,Abandon_Date			      
			   ,Current_SEC_Reserves_Category 
			   ,Field_Name					  
			   ,Historical_Operator	          
			   ,Lease_Name					  
			   ,Lease_Number				  
			   ,Permit_Date					  
			   ,Rig_Release_Date			  
			   ,Target_Formation			  
            )
            SELECT
                vwhp.County
               ,vwhp.Operator
               ,vwhp.Pad_Name
               ,Translate.fn_Standardize_Pad_Name(vwhp.Pad_Name)   AS Pad_Name_Antero_Standard
               ,vwhp.State_Name
               ,vwhp.Well_Name_Antero_Standard
               ,vwhp.API_County_Name
               ,vwhp.API_Number
               ,vwhp.API_State_Name
               ,vwhp.Big_Rig_Name
               ,vwhp.Big_Rig_Spud_Date_Actual
               ,vwhp.BottomHole_Latitude_NAD27
               ,vwhp.BottomHole_Longitude_NAD27
               ,vwhp.Configuration
               ,vwhp.Prospect
               ,vwhp.SEQNUM
               ,vwhp.Surface_Latitude_NAD27
               ,vwhp.Surface_Longitude_NAD27
               ,vwhp.Unit_Name
               ,Translate.fn_Standardize_Unit_Name(vwhp.Unit_Name) AS Unit_Name_Antero_Standard
               ,vwhp.Well_Number
               ,vwhp.WSN                                           AS WSN_Number
               ,vwhp.Is_Antero_Well
               ,vwhp.Completion_Date_Actual
               ,vwhp.Producing_Status                              AS Current_Operations
               ,vwhp.Reservoir                                     AS Producing_Formation
               ,vwhp.Symbol_Code
               ,vwhp.Total_Measured_Depth_Actual
               ,vwhp.Wellbore_Name_Original
               ,vwhp.Wellbore_Name_Antero_Standard
               ,vwhp.Well_Name_Antero_Standard
               ,vwhp.Petra_ID
               ,vwhp.Scrubbed_Lateral_Length
               ,vwhp.Cased_Lateral_Length
               ,vwhp.Completable_Lateral_Length
               ,vwhp.Drilled_Lateral_Length
               ,vwhp.Third_Party_Lateral_Length
               ,vwhp.Estimated_Lateral_Length
               ,vwhp.Official_Lateral_Length
               ,vwhp.USA_Sticks_Lateral_Length
			   ,vwhp.Abandon_Date			      
			   ,vwhp.Current_SEC_Reserves_Category 
			   ,vwhp.Field_Name					  
			   ,vwhp.Historical_Operator	          
			   ,vwhp.Lease_Name					  
			   ,vwhp.Lease_Number				  
			   ,vwhp.Permit_Date					  
			   ,vwhp.Rig_Release_Date			  
			   ,vwhp.Target_Formation
            FROM 
			(
			    SELECT * FROM 
			   (
			   SELECT ROW_NUMBER() OVER (PARTITION BY [Well_Name_Antero_Standard] ORDER BY SEQNUM DESC) AS [Row Num Dim], * FROM
			   Translate.Well_Header_Petra
			   )aa
               WHERE [Row Num Dim] = 1
            ) AS vwhp
            WHERE vwhp.Is_Antero_Well = 1



---            UNION
---
---
---
---            SELECT
---                vwhp.County
---               ,vwhp.Operator
---               ,vwhp.Pad_Name
---               ,Translate.fn_Standardize_Pad_Name(vwhp.Pad_Name)   AS Pad_Name_Antero_Standard
---               ,vwhp.State_Name
---               ,vwhp.Well_Name_Antero_Standard
---               ,vwhp.API_County_Name
---               ,vwhp.API_Number
---               ,vwhp.API_State_Name
---               ,vwhp.Big_Rig_Name
---               ,vwhp.Big_Rig_Spud_Date_Actual
---               ,vwhp.BottomHole_Latitude_NAD27
---               ,vwhp.BottomHole_Longitude_NAD27
---               ,vwhp.Configuration
---               ,vwhp.Prospect
---               ,vwhp.SEQNUM
---               ,vwhp.Surface_Latitude_NAD27
---               ,vwhp.Surface_Longitude_NAD27
---               ,vwhp.Unit_Name
---               ,Translate.fn_Standardize_Unit_Name(vwhp.Unit_Name) AS Unit_Name_Antero_Standard
---               ,vwhp.Well_Number
---               ,vwhp.WSN                                           AS WSN_Number
---               ,vwhp.Is_Antero_Well
---               ,vwhp.Completion_Date_Actual
---               ,vwhp.Producing_Status                              AS Current_Operations
---               ,vwhp.Reservoir                                     AS Producing_Formation
---               ,vwhp.Symbol_Code
---               ,vwhp.Total_Measured_Depth_Actual
---               ,vwhp.Wellbore_Name_Original
---               ,vwhp.Wellbore_Name_Antero_Standard
---               ,vwhp.Well_Name_Antero_Standard
---               ,vwhp.Petra_ID
---               ,vwhp.Scrubbed_Lateral_Length
---               ,vwhp.Cased_Lateral_Length
---               ,vwhp.Completable_Lateral_Length
---               ,vwhp.Drilled_Lateral_Length
---               ,vwhp.Third_Party_Lateral_Length
---               ,vwhp.Estimated_Lateral_Length
---               ,vwhp.Official_Lateral_Length
---			   ,vwhp.USA_Sticks_Lateral_Length
---			   ,vwhp.Abandon_Date			      
---			   ,vwhp.Current_SEC_Reserves_Category 
---			   ,vwhp.Field_Name					  
---			   ,vwhp.Historical_Operator	          
---			   ,vwhp.Lease_Name					  
---			   ,vwhp.Lease_Number				  
---			   ,vwhp.Permit_Date					  
---			   ,vwhp.Rig_Release_Date			  
---			   ,vwhp.Target_Formation
---            FROM Translate.Well_Header_Petra AS vwhp
---            WHERE
---                EXISTS
---            (
---                SELECT 1
---                FROM Staging.Wells_With_Interest AS iw
---                WHERE vwhp.SEQNUM = iw.SEQNUM
---            )
---
---            UNION
---
---
---            SELECT
---                vwhp.County
---               ,vwhp.Operator
---               ,vwhp.Pad_Name
---               ,Translate.fn_Standardize_Pad_Name(vwhp.Pad_Name)   AS Pad_Name_Antero_Standard
---               ,vwhp.State_Name
---               ,vwhp.Well_Name_Antero_Standard
---               ,vwhp.API_County_Name
---               ,vwhp.API_Number
---               ,vwhp.API_State_Name
---               ,vwhp.Big_Rig_Name
---               ,vwhp.Big_Rig_Spud_Date_Actual
---               ,vwhp.BottomHole_Latitude_NAD27
---               ,vwhp.BottomHole_Longitude_NAD27
---               ,vwhp.Configuration
---               ,vwhp.Prospect
---               ,vwhp.SEQNUM
---               ,vwhp.Surface_Latitude_NAD27
---               ,vwhp.Surface_Longitude_NAD27
---               ,vwhp.Unit_Name
---               ,Translate.fn_Standardize_Unit_Name(vwhp.Unit_Name) AS Unit_Name_Antero_Standard
---               ,vwhp.Well_Number
---               ,vwhp.WSN                                           AS WSN_Number
---               ,vwhp.Is_Antero_Well
---               ,vwhp.Completion_Date_Actual
---               ,vwhp.Producing_Status                              AS Current_Operations
---               ,vwhp.Reservoir                                     AS Producing_Formation
---               ,vwhp.Symbol_Code
---               ,vwhp.Total_Measured_Depth_Actual
---               ,vwhp.Wellbore_Name_Original
---               ,vwhp.Wellbore_Name_Antero_Standard
---               ,vwhp.Well_Name_Antero_Standard
---               ,vwhp.Petra_ID
---               ,vwhp.Scrubbed_Lateral_Length
---               ,vwhp.Cased_Lateral_Length
---               ,vwhp.Completable_Lateral_Length
---               ,vwhp.Drilled_Lateral_Length
---               ,vwhp.Third_Party_Lateral_Length
---               ,vwhp.Estimated_Lateral_Length
---               ,vwhp.Official_Lateral_Length
---               ,vwhp.USA_Sticks_Lateral_Length
---			   ,vwhp.Abandon_Date			      
---			   ,vwhp.Current_SEC_Reserves_Category 
---			   ,vwhp.Field_Name					  
---			   ,vwhp.Historical_Operator	          
---			   ,vwhp.Lease_Name					  
---			   ,vwhp.Lease_Number				  
---			   ,vwhp.Permit_Date					  
---			   ,vwhp.Rig_Release_Date			  
---			   ,vwhp.Target_Formation
---            FROM Translate.Well_Header_Petra AS vwhp
---            WHERE
---                EXISTS
---            (
---                SELECT 1
---                FROM Staging.Wells_With_Interest AS iw
---                WHERE vwhp.API_Number = iw.API_Number
---            );

            UPDATE pdwh
            SET pdwh.Surface_Location_Shape = vwhp.Surface_Location_Shape
            FROM Staging.Petra_Dim_Well_Header              AS pdwh
                INNER JOIN Translate.Well_Header_Petra AS vwhp ON pdwh.Petra_ID = vwhp.Petra_ID
                                                                       AND vwhp.Surface_Location_Shape IS NOT NULL
            WHERE pdwh.Surface_Location_Shape IS NULL;

            UPDATE vwhp
            SET
                vwhp.Petra_Dim_Pad_Header_UID = Pad.Petra_Dim_Pad_Header_UID
               ,vwhp.Petra_Dim_Unit_Header_UID = Unit.Petra_Dim_Unit_Header_UID
            FROM Staging.Petra_Dim_Well_Header AS vwhp
                OUTER APPLY
            (
                SELECT TOP (1)
                       dph.Petra_Dim_Pad_Header_UID
                FROM Petra.Dim_Pad_Header AS dph
                WHERE
                    ISNULL(dph.County, N'{NULL}') = ISNULL(vwhp.County, N'{NULL}')
                    AND dph.Pad_Name = vwhp.Pad_Name
                    AND ISNULL(dph.State_Name, N'{NULL}') = ISNULL(vwhp.State_Name, N'{NULL}')
            )                                  AS Pad
                OUTER APPLY
            (
                SELECT TOP (1)
                       duh.Petra_Dim_Unit_Header_UID
                FROM Petra.Dim_Unit_Header AS duh
                WHERE
                    ISNULL(duh.County, N'{NULL}') = ISNULL(vwhp.County, N'{NULL}')
                    AND duh.Unit_Name = vwhp.Unit_Name
                    AND ISNULL(duh.State_Name, N'{NULL}') = ISNULL(vwhp.State_Name, N'{NULL}')
            ) AS Unit;


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
            CREATE NONCLUSTERED INDEX IX_Staging_Petra_Dim_Well_Header_01 ON Staging.Petra_Dim_Well_Header (Processing_State) INCLUDE (UID_Left, Petra_ID)
            CREATE NONCLUSTERED INDEX IX_Staging_Petra_Dim_Well_Header_02 ON Staging.Petra_Dim_Well_Header (Processing_State) INCLUDE (UID_Left, SEQNUM)
            CREATE NONCLUSTERED INDEX IX_Staging_Petra_Dim_Well_Header_03 ON Staging.Petra_Dim_Well_Header (Processing_State) INCLUDE (UID_Left, API_Number)
            CREATE NONCLUSTERED INDEX IX_Staging_Petra_Dim_Well_Header_04 ON Staging.Petra_Dim_Well_Header (Processing_State) INCLUDE (UID_Left, WSN_Number)
            CREATE NONCLUSTERED INDEX IX_Staging_Petra_Dim_Well_Header_05 ON Staging.Petra_Dim_Well_Header (Processing_State) INCLUDE (UID_Left, EDW_Checksum)
            CREATE NONCLUSTERED INDEX IX_Staging_Petra_Dim_Well_Header_06 ON Staging.Petra_Dim_Well_Header (Processing_State) INCLUDE (UID_Left, Well_Name_Antero_Standard)
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
            FROM Staging.Petra_Dim_Well_Header   AS st
                INNER JOIN Petra.Dim_Well_Header AS dt ON st.EDW_Checksum = dt.EDW_Checksum;
        END;

        WHILE EXISTS
              (
                  SELECT 1
                  FROM Staging.Petra_Dim_Well_Header AS src
                  WHERE src.Processing_State = 0
              )
        BEGIN

            UPDATE TOP (@Page_Size)
                src
            SET src.Processing_State = 1
            FROM Staging.Petra_Dim_Well_Header AS src
            WHERE src.Processing_State = 0;

            EXEC Rules.Process
                @Entity_Name = N'Petra.Dim_Well_Header'
               ,@Matched_Result_Table_Name = N'#rules_result_matched'
               ,@Unmatched_Result_Table_Name = N'#rules_result_unmatched';

            UPDATE src
            SET src.Processing_State = 2
            FROM Staging.Petra_Dim_Well_Header AS src
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
                    FROM Staging.Petra_Dim_Well_Header AS src
                ) AS cc;

                DECLARE
                    @Progress_Count       INT
                   ,@Progress_Total_Count INT;

                SELECT
                    @Progress_Count       = SUM(IIF(src.Processing_State = 2, 1, 0))
                   ,@Progress_Total_Count = COUNT(*)
                FROM Staging.Petra_Dim_Well_Header AS src;

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

        MERGE INTO Petra.Dim_Well_Header AS Target
        USING
        (
            SELECT
                rrm.UID_Right
               ,src.*
               ,GETUTCDATE() AS EDW_Update_Date
            FROM #rules_result_matched                   AS rrm
                INNER JOIN Staging.Petra_Dim_Well_Header AS src ON rrm.UID_Left = src.UID_Left
            WHERE rrm.Processed_State = 1
        ) AS Source
        ON (Target.Petra_Dim_Well_Header_UID = Source.UID_Right)
        WHEN MATCHED AND (
                             Target.EDW_Checksum <> Source.EDW_Checksum
                             OR Target.Surface_Location_Shape.STEquals(Source.Surface_Location_Shape) = 0
                         ) THEN
            UPDATE SET
                Target.County = Source.County
               ,Target.Operator = Source.Operator
               ,Target.Pad_Name = Source.Pad_Name
               ,Target.Pad_Name_Antero_Standard = Source.Pad_Name_Antero_Standard
               ,Target.State_Name = Source.State_Name
               ,Target.Well_Name = Source.Well_Name
               ,Target.API_County_Name = Source.API_County_Name
               ,Target.API_Number = Source.API_Number
               ,Target.API_State_Name = Source.API_State_Name
               ,Target.Big_Rig_Name = Source.Big_Rig_Name
               ,Target.Big_Rig_Spud_Date = Source.Big_Rig_Spud_Date
               ,Target.BottomHole_Latitude_NAD27 = Source.BottomHole_Latitude_NAD27
               ,Target.BottomHole_Longitude_NAD27 = Source.BottomHole_Longitude_NAD27
               ,Target.Configuration = Source.Configuration
               ,Target.Prospect = Source.Prospect
               ,Target.SEQNUM = Source.SEQNUM
               ,Target.Surface_Latitude_NAD27 = Source.Surface_Latitude_NAD27
               ,Target.Surface_Location_Shape = Source.Surface_Location_Shape
               ,Target.Surface_Longitude_NAD27 = Source.Surface_Longitude_NAD27
               ,Target.Unit_Name = Source.Unit_Name
               ,Target.Unit_Name_Antero_Standard = Source.Unit_Name_Antero_Standard
               ,Target.Well_Number = Source.Well_Number
               ,Target.WSN_Number = Source.WSN_Number
               ,Target.Is_Antero_Well = Source.Is_Antero_Well
               ,Target.Completion_Date_Actual = Source.Completion_Date_Actual
               ,Target.Current_Operations = Source.Current_Operations
               ,Target.Producing_Formation = Source.Producing_Formation
               ,Target.Symbol_Code = Source.Symbol_Code
               ,Target.Total_Measured_Depth_Actual = Source.Total_Measured_Depth_Actual
               ,Target.Wellbore_Name_Antero_Standard = Source.Wellbore_Name_Antero_Standard
               ,Target.Wellbore_Name = Source.Wellbore_Name
               ,Target.Well_Name_Antero_Standard = Source.Well_Name_Antero_Standard
               ,Target.EDW_Update_Date = Source.EDW_Update_Date
               ,Target.EDW_Checksum = Source.EDW_Checksum
               ,Target.Petra_ID = Source.Petra_ID
               ,Target.Scrubbed_Lateral_Length = Source.Scrubbed_Lateral_Length
               ,Target.Cased_Lateral_Length = Source.Cased_Lateral_Length
               ,Target.Completable_Lateral_Length = Source.Completable_Lateral_Length
               ,Target.Drilled_Lateral_Length = Source.Drilled_Lateral_Length
               ,Target.Third_Party_Lateral_Length = Source.Third_Party_Lateral_Length
               ,Target.Estimated_Lateral_Length = Source.Estimated_Lateral_Length
               ,Target.Official_Lateral_Length = Source.Official_Lateral_Length
               ,Target.USA_Sticks_Lateral_Length = Source.USA_Sticks_Lateral_Length
			   ,Target.Abandon_Date = Source.Abandon_Date		      
			   ,Target.Current_SEC_Reserves_Category = Source.Current_SEC_Reserves_Category
			   ,Target.Field_Name = Source.Field_Name				  
			   ,Target.Historical_Operator = Source.Historical_Operator          
			   ,Target.Lease_Name = Source.Lease_Name				  
			   ,Target.Lease_Number = Source.Lease_Number		  
			   ,Target.Permit_Date = Source.Permit_Date				  
			   ,Target.Rig_Release_Date = Source.Rig_Release_Date	  
			   ,Target.Target_Formation = Source.Target_Formation
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

        INSERT INTO Petra.Dim_Well_Header
        (
            County
           ,Operator
           ,Pad_Name
           ,Pad_Name_Antero_Standard
           ,State_Name
           ,Well_Name
           ,API_County_Name
           ,API_Number
           ,API_State_Name
           ,Big_Rig_Name
           ,Big_Rig_Spud_Date
           ,BottomHole_Latitude_NAD27
           ,BottomHole_Longitude_NAD27
           ,Configuration
           ,Prospect
           ,SEQNUM
           ,Surface_Latitude_NAD27
           ,Surface_Location_Shape
           ,Surface_Longitude_NAD27
           ,Unit_Name
           ,Unit_Name_Antero_Standard
           ,Well_Number
           ,WSN_Number
           ,Is_Antero_Well
           ,Completion_Date_Actual
           ,Current_Operations
           ,Producing_Formation
           ,Symbol_Code
           ,Total_Measured_Depth_Actual
           ,Wellbore_Name_Antero_Standard
           ,Wellbore_Name
           ,Well_Name_Antero_Standard
           ,EDW_Checksum
           ,Petra_ID
           ,Scrubbed_Lateral_Length
           ,Cased_Lateral_Length
           ,Completable_Lateral_Length
           ,Drilled_Lateral_Length
           ,Third_Party_Lateral_Length
           ,Estimated_Lateral_Length
           ,Official_Lateral_Length
           ,USA_Sticks_Lateral_Length
		   ,Abandon_Date			      
		   ,Current_SEC_Reserves_Category 
		   ,Field_Name					  
		   ,Historical_Operator	          
		   ,Lease_Name					  
		   ,Lease_Number				  
		   ,Permit_Date					  
		   ,Rig_Release_Date			  
		   ,Target_Formation	
        )
        SELECT
            src.County
           ,src.Operator
           ,src.Pad_Name
           ,src.Pad_Name_Antero_Standard
           ,src.State_Name
           ,src.Well_Name
           ,src.API_County_Name
           ,src.API_Number
           ,src.API_State_Name
           ,src.Big_Rig_Name
           ,src.Big_Rig_Spud_Date
           ,src.BottomHole_Latitude_NAD27
           ,src.BottomHole_Longitude_NAD27
           ,src.Configuration
           ,src.Prospect
           ,src.SEQNUM
           ,src.Surface_Latitude_NAD27
           ,src.Surface_Location_Shape
           ,src.Surface_Longitude_NAD27
           ,src.Unit_Name
           ,src.Unit_Name_Antero_Standard
           ,src.Well_Number
           ,src.WSN_Number
           ,src.Is_Antero_Well
           ,src.Completion_Date_Actual
           ,src.Current_Operations
           ,src.Producing_Formation
           ,src.Symbol_Code
           ,src.Total_Measured_Depth_Actual
           ,src.Wellbore_Name_Antero_Standard
           ,src.Wellbore_Name
           ,src.Well_Name_Antero_Standard
           ,src.EDW_Checksum
           ,src.Petra_ID
           ,src.Scrubbed_Lateral_Length
           ,src.Cased_Lateral_Length
           ,src.Completable_Lateral_Length
           ,src.Drilled_Lateral_Length
           ,src.Third_Party_Lateral_Length
           ,src.Estimated_Lateral_Length
           ,src.Official_Lateral_Length
           ,src.USA_Sticks_Lateral_Length
		   ,src.Abandon_Date			      
		   ,src.Current_SEC_Reserves_Category 
		   ,src.Field_Name					  
		   ,src.Historical_Operator	          
		   ,src.Lease_Name					  
		   ,src.Lease_Number				  
		   ,src.Permit_Date					  
		   ,src.Rig_Release_Date			  
		   ,src.Target_Formation	
        FROM Staging.Petra_Dim_Well_Header AS src
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
		(SELECT dwh.Petra_ID
            FROM Petra.Dim_Well_Header AS dwh
			EXCEPT 
        (
            SELECT vwhp.Petra_ID
            FROM Translate.Well_Header_Petra AS vwhp
            WHERE vwhp.Is_Antero_Well = 1
            UNION
            SELECT vwhp.Petra_ID
            FROM Translate.Well_Header_Petra AS vwhp
            WHERE
                EXISTS
            (
                SELECT 1
                FROM Staging.Wells_With_Interest AS iw
                WHERE vwhp.SEQNUM = iw.SEQNUM
            )
            UNION
            SELECT vwhp.Petra_ID
            FROM Translate.Well_Header_Petra AS vwhp
            WHERE
                EXISTS
            (
                SELECT 1
                FROM Staging.Wells_With_Interest AS iw
                WHERE vwhp.API_Number = iw.API_Number
            )
         
            
        ))
        UPDATE dwh
        SET
            dwh.EDW_Is_Deleted = 1
           ,dwh.EDW_Checksum = 0x0
        FROM Petra.Dim_Well_Header   AS dwh
            INNER JOIN Deleted_Wells AS d ON dwh.Petra_ID = d.Petra_ID;

        -- Remove Duplicates
        WITH Dulicate_Wells
        AS
        (
            SELECT
                dwh.Petra_Dim_Well_Header_UID
               ,ROW_NUMBER() OVER (PARTITION BY
                                       dwh.Petra_ID
                                      ,dwh.Wellbore_Name_Antero_Standard
                                   ORDER BY
                                       dwh.SEQNUM DESC
                                      ,dwh.WSN_Number DESC
                                  ) AS Well_RID
            FROM Petra.Dim_Well_Header AS dwh
            WHERE dwh.EDW_Is_Deleted = 0
        )
        UPDATE dwh
        SET
            dwh.EDW_Is_Deleted = 1
           ,dwh.EDW_Checksum = 0x0
        FROM Petra.Dim_Well_Header    AS dwh
            INNER JOIN Dulicate_Wells AS dw ON dwh.Petra_Dim_Well_Header_UID = dw.Petra_Dim_Well_Header_UID
                                               AND dw.Well_RID > 1;

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


