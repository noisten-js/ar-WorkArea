/****** Object:  StoredProcedure [Master_Etl].[Process]    Script Date: 9/10/2024 5:55:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [Master_Etl].[Process]
(
    @TruncateStagingData BIT = 0
   ,@Resume_Processing   BIT = 0
   ,@IncrementalOverride BIT = 0
   ,@Allow_Duplicates    BIT = 0
)
AS
BEGIN

    SET NOCOUNT, XACT_ABORT ON;

    DECLARE @retval INT = -1

    BEGIN TRY
        --==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
        --TODO: There is a bug that requires well header to be run twice
        --==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
        DECLARE @Run_Twice BIT = 0
        DECLARE
            @Process_Execution_Start DATETIME = '1753-01-01 00:00:00.000'
           ,@Process_Execution_End   DATETIME = '1753-01-01 00:00:00.000';
        BEGIN TRY
            EXEC Log.Get_Last_Execution_Time
                @Process_Name = N'MASTER ETL MAP: Master.Sat_Well_Header_Aries'
               ,@Display_Local_Time = 1
               ,@Process_Execution_Start = @Process_Execution_Start OUTPUT
               ,@Process_Execution_End = @Process_Execution_End OUTPUT
        END TRY
        BEGIN CATCH
        END CATCH


        IF DATEDIFF(hh, @Process_Execution_Start, GETDATE()) > 12
        BEGIN
            SET @Run_Twice = 1
        END
        --==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
        -- Load Entities 
        --==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--

        EXEC @retval = Master_Etl.Process_Well_Header
            @TruncateStagingData = @TruncateStagingData
           ,@Resume_Processing = @Resume_Processing
           ,@IncrementalOverride = @IncrementalOverride
           ,@Allow_Duplicates = @Allow_Duplicates;

        IF @Run_Twice = 1
        BEGIN
            EXEC @retval = Master_Etl.Process_Well_Header
                @TruncateStagingData = @TruncateStagingData
               ,@Resume_Processing = @Resume_Processing
               ,@IncrementalOverride = @IncrementalOverride
               ,@Allow_Duplicates = @Allow_Duplicates;

        END

---		EXEC @retval = Master_Etl.Process_Well_Header_Adjust_Operational_Dates
---		EXEC @retval = Master_Etl.Process_Well_Header_Adjust_Cost_Center

        ----------------------------------------------------------------------------------------------------------------------
PRINT '-------------------------------------------------------------------------------------------------------------- Process Pad Header'
        EXEC @retval = Master_Etl.Process_Pad_Header
            @TruncateStagingData = @TruncateStagingData
           ,@Resume_Processing = @Resume_Processing
           ,@IncrementalOverride = @IncrementalOverride;
PRINT '-------------------------------------------------------------------------------------------------------------- Process Unit Header'
EXEC @retval = Master_Etl.Process_Unit_Header
            @TruncateStagingData = @TruncateStagingData
           ,@Resume_Processing = @Resume_Processing
           ,@IncrementalOverride = @IncrementalOverride;
        EXEC @retval = Master_Etl.Process_Well_Header_Cross_Reference;

        IF @retval <> 0
        BEGIN
            RAISERROR('Error Executing Master_Etl.Process', 16, 1);
        END

        SET @retval = 0;
    END TRY
    BEGIN CATCH

        SET @retval = -1;
        THROW;

    END CATCH

    RETURN @retval;

END;
GO