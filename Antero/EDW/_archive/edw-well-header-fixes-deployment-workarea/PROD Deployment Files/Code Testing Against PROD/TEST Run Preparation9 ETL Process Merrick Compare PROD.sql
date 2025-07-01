/****** Object:  StoredProcedure [Etl].[Process_Merrick]    Script Date: 10/28/2024 7:17:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [Etl].[Process_Merrick]
(
    @Process_Name                   NVARCHAR(256) = NULL
   ,@AllocationHistoryDaysToProcess INT           = 7
   ,@Debug                          TINYINT       = 1
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
           ,@Procedure_ID         INT             = @@PROCID
           ,@Execution_ID         UNIQUEIDENTIFIER;
        SET @Process_Name = COALESCE(@Process_Name, N'ETL: Process_Merrick');

        -- DEBUG: Log Start Execution
        EXEC Log.Execution_Start
            @Process_Name = @Process_Name
           ,@Execution_ID = @Execution_ID OUTPUT;


        -- DEBUG: Execution Time
        IF (@Debug & 1) = 1
        BEGIN
            SET @Debug_Message = N'BEGIN => Execution';
            EXEC Log.Track_Execution_Time
                @Execution_Start = @Execution_Start
               ,@Execution_Step_Start = @Execution_Step_Start OUTPUT
               ,@Message = @Debug_Message
               ,@Write_Log = 1
               ,@Write_Log_Execution_ID = @Execution_ID
               ,@Write_Log_Executing_Object_ID = @Procedure_ID;
        END;


        -- DEBUG: Execution Time
        IF (@Debug & 1) = 1
        BEGIN
            SET @Debug_Message = N'CALL => Etl.Load_Merrick_Dim_Pad_Header';
            EXEC Log.Track_Execution_Time
                @Execution_Start = @Execution_Start
               ,@Execution_Step_Start = @Execution_Step_Start OUTPUT
               ,@Message = @Debug_Message
               ,@Write_Log = 1
               ,@Write_Log_Execution_ID = @Execution_ID
               ,@Write_Log_Executing_Object_ID = @Procedure_ID;
        END;
        EXEC @retval = Etl.Load_Merrick_Dim_Pad_Header;
        -- DEBUG: Execution Time
        IF (@Debug & 1) = 1
        BEGIN
            SET @Debug_Message = N'CALL => Etl.Load_Merrick_Dim_Well_Header';
            EXEC Log.Track_Execution_Time
                @Execution_Start = @Execution_Start
               ,@Execution_Step_Start = @Execution_Step_Start OUTPUT
               ,@Message = @Debug_Message
               ,@Write_Log = 1
               ,@Write_Log_Execution_ID = @Execution_ID
               ,@Write_Log_Executing_Object_ID = @Procedure_ID;
        END;
        EXEC @retval = Etl.Load_Merrick_Dim_Well_Header;
        -- DEBUG: Execution Time
        IF (@Debug & 1) = 1
        BEGIN
            SET @Debug_Message = N'CALL => Etl.Load_Merrick_Fact_Well_Header';
            EXEC Log.Track_Execution_Time
                @Execution_Start = @Execution_Start
               ,@Execution_Step_Start = @Execution_Step_Start OUTPUT
               ,@Message = @Debug_Message
               ,@Write_Log = 1
               ,@Write_Log_Execution_ID = @Execution_ID
               ,@Write_Log_Executing_Object_ID = @Procedure_ID;
        END;
        EXEC @retval = Etl.Load_Merrick_Fact_Well_Header;
        -- DEBUG: Execution Time
        IF (@Debug & 1) = 1
        BEGIN
---            SET @Debug_Message = N'CALL => Etl.Load_Merrick_Fact_Produced_Gas_Analysis';
            EXEC Log.Track_Execution_Time
                @Execution_Start = @Execution_Start
               ,@Execution_Step_Start = @Execution_Step_Start OUTPUT
               ,@Message = @Debug_Message
               ,@Write_Log = 1
               ,@Write_Log_Execution_ID = @Execution_ID
               ,@Write_Log_Executing_Object_ID = @Procedure_ID;
        END;
---        EXEC @retval = Etl.Load_Merrick_Fact_Produced_Gas_Analysis;
        -- DEBUG: Execution Time
        IF (@Debug & 1) = 1
        BEGIN
            SET @Debug_Message = N'CALL => Etl.Load_Merrick_Dim_Daily_Well_Production';
            EXEC Log.Track_Execution_Time
                @Execution_Start = @Execution_Start
               ,@Execution_Step_Start = @Execution_Step_Start OUTPUT
               ,@Message = @Debug_Message
               ,@Write_Log = 1
               ,@Write_Log_Execution_ID = @Execution_ID
               ,@Write_Log_Executing_Object_ID = @Procedure_ID;
        END;
---        EXEC @retval = Etl.Load_Merrick_Dim_Daily_Well_Production @AllocationHistoryDaysToProcess = @AllocationHistoryDaysToProcess;
        -- DEBUG: Execution Time
        IF (@Debug & 1) = 1
        BEGIN
            SET @Debug_Message = N'CALL => Etl.Load_Merrick_Fact_Daily_Well_Production';
            EXEC Log.Track_Execution_Time
                @Execution_Start = @Execution_Start
               ,@Execution_Step_Start = @Execution_Step_Start OUTPUT
               ,@Message = @Debug_Message
               ,@Write_Log = 1
               ,@Write_Log_Execution_ID = @Execution_ID
               ,@Write_Log_Executing_Object_ID = @Procedure_ID;
        END;
---        EXEC @retval = Etl.Load_Merrick_Fact_Daily_Well_Production @AllocationHistoryDaysToProcess = @AllocationHistoryDaysToProcess;

        -- DEBUG: Execution Time
        IF (@Debug & 1) = 1
        BEGIN
            SET @Debug_Message = N'END => Execution';
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