USE [EDW]
GO

/****** Object:  StoredProcedure [Etl].[Process]    Script Date: 10/11/2024 1:36:38 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER PROCEDURE [Etl].[Process]
(
    @Resume_Processing BIT = 0
)
AS
BEGIN

    SET NOCOUNT, XACT_ABORT ON;
    DECLARE @retval INT = -1;
    --==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
    -- Process Entities (Optimally in Source Creation Order but not requried.)
    --==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
    BEGIN TRY

        --==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
        -- Load Processing Order
        --==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
        IF @Resume_Processing = 0
           OR NOT EXISTS
        (
            SELECT 1
            FROM Staging.Process_Order AS po
            WHERE po.Is_Processed = 0
        )
        BEGIN
            IF (OBJECT_ID(N'Staging.Process_Order') IS NOT NULL)
            BEGIN
                DROP TABLE Staging.Process_Order
            END
            SELECT
                spo.Source_ID
               ,spo.Source_Order
               ,Source_Name
               ,CAST(0 AS BIT) AS Is_Processed
            INTO Staging.Process_Order
            FROM Etl.Source_Process_Order AS spo
                INNER JOIN Etl.Sources ON spo.Source_ID = Sources.Source_ID
        END

        --==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
        -- Process
        --==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
        WHILE EXISTS
              (
                  SELECT 1
                  FROM Staging.Process_Order AS po
                  WHERE po.Is_Processed = 0
              )
        BEGIN

            DECLARE @Source_Name NVARCHAR(50)

            SELECT TOP (1)
                   @Source_Name = po.Source_Name
            FROM Staging.Process_Order AS po
            WHERE po.Is_Processed = 0
            ORDER BY po.Source_Order


            -- Load Enertia
            IF @Source_Name = N'Enertia'
            BEGIN
                EXEC @retval = Etl.Process_Enertia;
            END

            -- Load Petra
            IF @Source_Name = N'Petra'
            BEGIN
                EXEC @retval = Etl.Process_Petra;
            END

            -- Load Aries
            IF @Source_Name = N'Aries'
            BEGIN
               EXEC @retval = Etl.Process_Aries;
            END

            -- Load Merrick
            IF @Source_Name = N'Merrick'
            BEGIN
                EXEC @retval = Etl.Process_Merrick;
            END

            -- Load SigmaFlow
            IF @Source_Name = N'SigmaFlow'
            BEGIN
                EXEC @retval = Etl.Process_SigmaFlow;
            END

            -- Load FracSchedule
            IF @Source_Name = N'FracSchedule'
            BEGIN
                EXEC @retval = Etl.Process_FracSchedule;
            END

            -- Load WellView
            IF @Source_Name = N'WellView'
            BEGIN
                EXEC @retval = Etl.Process_WellView;
            END

			 -- Load GIS
            IF @Source_Name = N'GIS'
            BEGIN
                EXEC @retval = Etl.Process_GIS;
            END

            IF @retval <> 0
            BEGIN
                RAISERROR(N'Etl.Process Error Processing: %s', 16, 1, @Source_Name)
            END

		    -- Load Aries Planning
            IF @Source_Name = N'Aries Planning'
            BEGIN
                EXEC @retval = Etl.Process_Aries_Planning;
            END

            IF @retval <> 0
            BEGIN
                RAISERROR(N'Etl.Process Error Processing: %s', 16, 1, @Source_Name)
            END

            UPDATE po
            SET po.Is_Processed = 1
            FROM Staging.Process_Order AS po
            WHERE po.Source_Name = @Source_Name

        END

        SET @retval = 0;

    END TRY
    BEGIN CATCH

        SET @retval = -1;
        THROW;

    END CATCH;

    RETURN @retval;

END;
GO


