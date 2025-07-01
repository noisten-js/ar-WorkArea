USE [EDW]
GO

/****** Object:  StoredProcedure [Master_Etl].[Process_Well_Header]    Script Date: 10/11/2024 1:46:00 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE OR ALTER PROCEDURE [Master_Etl].[Process_Well_Header]
(
    @RebuildMap          BIT            = 1
   ,@TruncateStagingData BIT            = 1
   ,@ProcessingType      TINYINT        = 3
   ,@Resume_Processing   BIT            = 0
   ,@SourceList          NVARCHAR(4000) = NULL
   ,@IncrementalOverride BIT            = 1
   ,@Allow_Duplicates    BIT            = 0
)
AS
BEGIN

    /*--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
	-- 
	-- @ProcessingType Flag:
	-- 	1 = Map 
	-- 	2 = Update
	-- 	1 + 2 = 3 = Both
	-- 
	--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--*/
    SET NOCOUNT, XACT_ABORT ON;

    DECLARE @retval INT = -1;

---    DECLARE
---	   @RebuildMap          BIT            = 1
---   ,@TruncateStagingData BIT            = 1
---   ,@ProcessingType      TINYINT        = 3
---   ,@Resume_Processing   BIT            = 0
---   ,@SourceList          NVARCHAR(4000) = NULL
---   ,@IncrementalOverride BIT            = 0
---   ,@Allow_Duplicates    BIT            = 0

    BEGIN TRY

---	    GOTO FINAL_TABLES

        DECLARE @Sources TABLE
        (
            Source_Name         NVARCHAR(50) PRIMARY KEY CLUSTERED
           ,Source_Abbreviation NCHAR(1)
        )
        IF @SourceList IS NOT NULL
        BEGIN
            INSERT INTO @Sources
            (
                Source_Name
               ,Source_Abbreviation
            )
            SELECT DISTINCT
                RTRIM(LTRIM(ss.value))
               ,s.Source_Abbreviation
            FROM STRING_SPLIT(@SourceList, N',') AS ss
                INNER JOIN Master_Etl.Sources AS s ON RTRIM(LTRIM(ss.value)) = s.Source_Name
        END

		---GOTO SKIP_SOURCE_PROCESSING
        --==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
        -- Load Entity Map with Existing Entities
        --==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
        IF @SourceList IS NULL
        BEGIN

            IF @RebuildMap = 1
            BEGIN
                TRUNCATE TABLE Master_Etl.Map_Well_Header;
            END;

            MERGE INTO Master_Etl.Map_Well_Header AS Target
            USING (SELECT DISTINCT TOP (100) PERCENT
                    wh.Hub_Well_Header_UID
                FROM Master_Etl.Master_Well_Header AS wh
                ORDER BY wh.Hub_Well_Header_UID) AS Source
            ON Target.Master_Hub_Well_Header_UID = Source.Hub_Well_Header_UID
            WHEN NOT MATCHED BY SOURCE
                THEN DELETE
            WHEN NOT MATCHED BY TARGET
                THEN INSERT
                    (
                        Master_Hub_Well_Header_UID
                    )
                    VALUES
                    (
                        Source.Hub_Well_Header_UID
                    );


			DECLARE @Hub_UIDs_Single_Source dbo.List_UNIQUEIDENTIFIER

            INSERT INTO @Hub_UIDs_Single_Source
            SELECT Master_Hub_Well_Header_UID
            FROM Master_etl.Map_Well_Header_Source_With_Count WHERE source_count = 1
                
           
            DELETE FROM mwh
            FROM Master_Etl.Map_Well_Header AS mwh
                INNER JOIN @Hub_UIDs_Single_Source        AS hud ON mwh.Master_Hub_Well_Header_UID = hud.value

            EXEC Master.Delete_Well_Header_By_UID
                @Hub_Well_Header_UIDs = @Hub_UIDs_Single_Source
               ,@Perform_Hard_Delete = 1
               ,@Use_Transaction = 0

        END
        ELSE
        BEGIN

---         SELECT * INTO [Master_Etl].[Map_Well_Header_Backup_03152024]
---                  FROM [Master_Etl].[Map_Well_Header]
			MERGE INTO Master_Etl.Map_Well_Header AS Target
            USING (SELECT DISTINCT TOP (100) PERCENT
                    wh.Hub_Well_Header_UID
                FROM Master_Etl.Master_Well_Header AS wh
                    INNER JOIN @Sources AS s ON wh.Sources LIKE CONCAT(N'%', s.Source_Abbreviation, N'%')
                ORDER BY wh.Hub_Well_Header_UID) AS Source
            ON Target.Master_Hub_Well_Header_UID = Source.Hub_Well_Header_UID
            WHEN NOT MATCHED BY TARGET
                THEN INSERT
                    (
                        Master_Hub_Well_Header_UID
                    )
                    VALUES
                    (
                        Source.Hub_Well_Header_UID
                    );

            DELETE FROM mwh
            FROM Master_Etl.Map_Well_Header_Source_With_Count AS muhswc
                INNER JOIN Master_Etl.Map_Well_Header AS mwh ON muhswc.Master_Hub_Well_Header_UID = mwh.Master_Hub_Well_Header_UID
                INNER JOIN @Sources AS s ON muhswc.Sources LIKE CONCAT(N'%', s.Source_Abbreviation, N'%')
            WHERE muhswc.Source_Count = 1
                AND NOT EXISTS (SELECT
                        1
                    FROM Master.Hub_Well_Header AS hwh
                    WHERE hwh.Hub_Well_Header_UID = muhswc.Master_Hub_Well_Header_UID)
        END


        --==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
        -- Mark Unmapped Aliases as Inactive
        --==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
       
	   ---
	    UPDATE a
        SET a.Is_Active = 0		
		FROM Rules_Alias.Master_Sat_Well_Header_Aries AS a
        WHERE NOT EXISTS (SELECT
                    1
                FROM Master.Hub_Well_Header AS wh
                WHERE wh.Hub_Well_Header_UID = a.UID_Right
            --AND wh.EDW_Is_Deleted = 0
            )
			OR NOT EXISTS (SELECT
                    1
                FROM aries.dim_Well_header AS wh
                WHERE wh.Aries_Dim_Well_Header_UID = a.UID_Left)
            --AND wh.EDW_Is_Deleted = 0
		
        UPDATE a
        SET a.Is_Active = 0
        FROM Rules_Alias.Master_Sat_Well_Header_Enertia AS a
        WHERE NOT EXISTS (SELECT
                    1
                FROM Master.Hub_Well_Header AS wh
                WHERE wh.Hub_Well_Header_UID = a.UID_Right
            --AND wh.EDW_Is_Deleted = 0
            )
			OR NOT EXISTS (SELECT
                    1
                FROM enertia.Dim_Well_Header AS wh
                WHERE wh.Enertia_Dim_Well_Header_UID = a.UID_Left)
            --AND wh.EDW_Is_Deleted = 0
        UPDATE a
        SET a.Is_Active = 0
        FROM Rules_Alias.Master_Sat_Well_Header_FracSchedule AS a
        WHERE NOT EXISTS (SELECT
                    1
                FROM Master.Hub_Well_Header AS wh
                WHERE wh.Hub_Well_Header_UID = a.UID_Right
            --AND wh.EDW_Is_Deleted = 0
            )
			OR NOT EXISTS (SELECT
                    1
                FROM Fracschedule.Dim_Well_Header AS wh
                WHERE wh.FracSchedule_Dim_Well_Header_UID = a.UID_Left)
            --AND wh.EDW_Is_Deleted = 0
        UPDATE a
        SET a.Is_Active = 0
        FROM Rules_Alias.Master_Sat_Well_Header_Merrick AS a
        WHERE NOT EXISTS (SELECT
                    1
                FROM Master.Hub_Well_Header AS wh
                WHERE wh.Hub_Well_Header_UID = a.UID_Right
            --AND wh.EDW_Is_Deleted = 0
            )
			OR NOT EXISTS (SELECT
                    1
                FROM Merrick.Dim_Well_Header AS wh
                WHERE wh.Merrick_Dim_Well_Header_UID = a.UID_Left)
            --AND wh.EDW_Is_Deleted = 0
        UPDATE a
        SET a.Is_Active = 0
        FROM Rules_Alias.Master_Sat_Well_Header_Petra AS a
        WHERE NOT EXISTS (SELECT
                    1
                FROM Master.Hub_Well_Header AS wh
                WHERE wh.Hub_Well_Header_UID = a.UID_Right
            --AND wh.EDW_Is_Deleted = 0
            )
			OR NOT EXISTS (SELECT
                    1
                FROM Petra.Dim_Well_Header AS wh
                WHERE wh.Petra_Dim_Well_Header_UID = a.UID_Left)
            --AND wh.EDW_Is_Deleted = 0
        UPDATE a
        SET a.Is_Active = 0
        FROM Rules_Alias.Master_Sat_Well_Header_SigmaFlow AS a
        WHERE NOT EXISTS (SELECT
                    1
                FROM Master.Hub_Well_Header AS wh
                WHERE wh.Hub_Well_Header_UID = a.UID_Right
            --AND wh.EDW_Is_Deleted = 0
            )
			OR NOT EXISTS (SELECT
                    1
                FROM Sigmaflow.Dim_Well_Header AS wh
                WHERE wh.SigmaFlow_Dim_Well_Header_UID = a.UID_Left)
            --AND wh.EDW_Is_Deleted = 0
        UPDATE a
        SET a.Is_Active = 0
        FROM Rules_Alias.Master_Sat_Well_Header_WellView AS a
        WHERE NOT EXISTS (SELECT
                    1
                FROM Master.Hub_Well_Header AS wh
                WHERE wh.Hub_Well_Header_UID = a.UID_Right
            --AND wh.EDW_Is_Deleted = 0
            )
			OR NOT EXISTS (SELECT
                    1
                FROM Wellview.Dim_Well_Header AS wh
                WHERE wh.WellView_Dim_Well_Header_UID = a.UID_Left)
            --AND wh.EDW_Is_Deleted = 0
		UPDATE a
        SET a.Is_Active = 0
        FROM Rules_Alias.Master_Sat_Well_Header_GIS AS a
        WHERE NOT EXISTS (SELECT
                    1
                FROM Master.Hub_Well_Header AS wh
                WHERE wh.Hub_Well_Header_UID = a.UID_Right
            --AND wh.EDW_Is_Deleted = 0
            )
			OR NOT EXISTS (SELECT
                    1
                FROM Gis.Dim_Well_Header AS wh
                WHERE wh.GIS_Dim_Well_Header_UID = a.UID_Left)
		UPDATE a
        SET a.Is_Active = 0
        FROM Rules_Alias.Master_Sat_Well_Header_Aries_Planning AS a
        WHERE NOT EXISTS (SELECT
                    1
                FROM Master.Hub_Well_Header AS wh
                WHERE wh.Hub_Well_Header_UID = a.UID_Right
            --AND wh.EDW_Is_Deleted = 0
            )
			OR NOT EXISTS (SELECT
                    1
                FROM Aries_Planning.Dim_Well_Header AS wh
                WHERE wh.Aries_Planning_Dim_Well_Header_UID = a.UID_Left)
            --AND wh.EDW_Is_Deleted = 0

        --==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
        -- Load Processing Order
        --==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
        IF @Resume_Processing = 0
            OR NOT EXISTS (SELECT
                    1
                FROM Master_Staging.Process_Order AS po
                WHERE po.Is_Processed = 0)
        BEGIN
            IF (OBJECT_ID(N'Master_Staging.Process_Order') IS NOT NULL)
            BEGIN
                DROP TABLE Master_Staging.Process_Order
            END
            SELECT
                spo.Source_ID
               ,spo.Source_Order
               ,Source_Name
               ,CAST(0 AS BIT) AS Is_Processed
            INTO Master_Staging.Process_Order
            FROM Master_Etl.Source_Process_Order AS spo
                INNER JOIN Master_Etl.Sources ON spo.Source_ID = Sources.Source_ID
        END


        --==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
        -- Load Entities (Optimally in Source Creation Order but not requried.)
        --==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--

        WHILE EXISTS (SELECT
                    1
                FROM Master_Staging.Process_Order AS po
                WHERE po.Is_Processed = 0)
        BEGIN

            DECLARE @Source_Name NVARCHAR(50)

            SELECT TOP (1)
                @Source_Name = po.Source_Name
            FROM Master_Staging.Process_Order AS po
            WHERE po.Is_Processed = 0
            ORDER BY po.Source_Order

            IF @SourceList IS NOT NULL
            BEGIN
                IF NOT EXISTS (SELECT
                            1
                        FROM @Sources AS s
                        WHERE s.Source_Name = @Source_Name)
                BEGIN
                    GOTO SKIP_PROCESSING
                END
            END

            -- Map and Load Petra
            IF @Source_Name = N'Petra'
            BEGIN
                IF (@ProcessingType & 1) = 1
                BEGIN
                    EXEC @retval = Master_Etl.Map_Master_Sat_Well_Header_Petra
                        @TruncateStagingData = @TruncateStagingData
                       ,@IncrementalOverride = @IncrementalOverride
                       ,@Allow_Duplicates    = @Allow_Duplicates;
                END;
                IF (@ProcessingType & 2) = 2
                BEGIN
                    EXEC @retval = Master_Etl.Load_Master_Sat_Well_Header_Petra;
                END
            END
            -- Map and Load Aries
            ELSE
            IF @Source_Name = N'Aries'
            BEGIN
                IF (@ProcessingType & 1) = 1
                BEGIN
                    EXEC @retval = Master_Etl.Map_Master_Sat_Well_Header_Aries
                        @TruncateStagingData = @TruncateStagingData
                       ,@IncrementalOverride = @IncrementalOverride
                       ,@Allow_Duplicates    = @Allow_Duplicates;
                END;
                IF (@ProcessingType & 2) = 2
                BEGIN
                    EXEC @retval = Master_Etl.Load_Master_Sat_Well_Header_Aries;
                END
            END
            -- Map and Load Merrick
            ELSE
            IF @Source_Name = N'Merrick'
            BEGIN

                IF (@ProcessingType & 1) = 1
                BEGIN
                    EXEC @retval = Master_Etl.Map_Master_Sat_Well_Header_Merrick
                        @TruncateStagingData = @TruncateStagingData
                       ,@IncrementalOverride = @IncrementalOverride
                       ,@Allow_Duplicates    = @Allow_Duplicates;
                END;
                IF (@ProcessingType & 2) = 2
                BEGIN
                    EXEC @retval = Master_Etl.Load_Master_Sat_Well_Header_Merrick;
                END
            END
            -- Map and Load SigmaFlow
            ELSE
            IF @Source_Name = N'SigmaFlow'
            BEGIN

                IF (@ProcessingType & 1) = 1
                BEGIN
PRINT '-------------------------------------------------------------------------------------------------------------- Map SigmaFlow'
                    EXEC @retval = Master_Etl.Map_Master_Sat_Well_Header_SigmaFlow
                        @TruncateStagingData = @TruncateStagingData
                       ,@IncrementalOverride = @IncrementalOverride
                       ,@Allow_Duplicates    = @Allow_Duplicates;
                END;
                IF (@ProcessingType & 2) = 2
                BEGIN
PRINT '-------------------------------------------------------------------------------------------------------------- Load SigmaFlow'
                    EXEC @retval = Master_Etl.Load_Master_Sat_Well_Header_SigmaFlow;
                END
            END
            -- Map and Load FracSchedule
            ELSE
            IF @Source_Name = N'FracSchedule'
            BEGIN

                IF (@ProcessingType & 1) = 1
                BEGIN
                    EXEC @retval = Master_Etl.Map_Master_Sat_Well_Header_FracSchedule
                        @TruncateStagingData = @TruncateStagingData
                       ,@IncrementalOverride = @IncrementalOverride
                       ,@Allow_Duplicates    = @Allow_Duplicates;
                END;
                IF (@ProcessingType & 2) = 2
                BEGIN
                    EXEC @retval = Master_Etl.Load_Master_Sat_Well_Header_FracSchedule;
                END
            END
            -- Map and Load WellView
            ELSE
            IF @Source_Name = N'WellView'
            BEGIN

                IF (@ProcessingType & 1) = 1
                BEGIN
PRINT '-------------------------------------------------------------------------------------------------------------- Map Wellview'
                    EXEC @retval = Master_Etl.Map_Master_Sat_Well_Header_WellView
                        @TruncateStagingData = @TruncateStagingData
                       ,@IncrementalOverride = @IncrementalOverride
                       ,@Allow_Duplicates    = @Allow_Duplicates;
                END;
                IF (@ProcessingType & 2) = 2
                BEGIN
PRINT '-------------------------------------------------------------------------------------------------------------- Load Wellview'
                    EXEC @retval = Master_Etl.Load_Master_Sat_Well_Header_WellView;
                END
            END
            -- Map and Load Enertia
            ELSE
            IF @Source_Name = N'Enertia'
            BEGIN

                IF (@ProcessingType & 1) = 1
                BEGIN
PRINT '-------------------------------------------------------------------------------------------------------------- Map Enertia'
                    EXEC @retval = Master_Etl.Map_Master_Sat_Well_Header_Enertia
                        @TruncateStagingData = @TruncateStagingData
                       ,@IncrementalOverride = @IncrementalOverride
                       ,@Allow_Duplicates    = @Allow_Duplicates;
                END;
                IF (@ProcessingType & 2) = 2
                BEGIN
PRINT '-------------------------------------------------------------------------------------------------------------- Load Enertia'
                    EXEC @retval = Master_Etl.Load_Master_Sat_Well_Header_Enertia;
                END
            END
			   -- Map and Load GIS
            ELSE
			IF @Source_Name = N'GIS'
            BEGIN
                IF (@ProcessingType & 1) = 1
                BEGIN
PRINT '-------------------------------------------------------------------------------------------------------------- Map GIS'
                    EXEC @retval = Master_Etl.Map_Master_Sat_Well_Header_GIS
                        @TruncateStagingData = @TruncateStagingData
                       ,@IncrementalOverride = @IncrementalOverride
                       ,@Allow_Duplicates    = @Allow_Duplicates;
                END;
                IF (@ProcessingType & 2) = 2
                BEGIN
PRINT '-------------------------------------------------------------------------------------------------------------- Load GIS'
                    EXEC @retval = Master_Etl.Load_Master_Sat_Well_Header_GIS;
                END
            END
            ELSE
            BEGIN
                SET @retval = 0
            END

			IF @Source_Name = N'Aries Planning'
            BEGIN
                IF (@ProcessingType & 1) = 1
                BEGIN
     				PRINT 'Mapping Aries Planning'
                    EXEC @retval = Master_Etl.Map_Master_Sat_Well_Header_Aries_Planning
                        @TruncateStagingData = @TruncateStagingData
                       ,@IncrementalOverride = @IncrementalOverride
                       ,@Allow_Duplicates    = @Allow_Duplicates;
                END;
                IF (@ProcessingType & 2) = 2
                BEGIN
				    PRINT 'Loading Aries Planning'
                    EXEC @retval = Master_Etl.Load_Master_Sat_Well_Header_Aries_Planning;
                END
            END
            ELSE
            BEGIN
                SET @retval = 0
            END

            IF @retval <> 0
            BEGIN
                RAISERROR (N'Master_Etl.Process Error Processing: %s', 16, 1, @Source_Name)
            END

        SKIP_PROCESSING:
            UPDATE po
            SET po.Is_Processed = 1
            FROM Master_Staging.Process_Order AS po
            WHERE po.Source_Name = @Source_Name

        END

		SKIP_SOURCE_PROCESSING:

        -- Load Main Well Data
        PRINT 'Calling Load_Master_Sat_Well_Header'
		IF (@ProcessingType & 2) = 2
        BEGIN
PRINT '-------------------------------------------------------------------------------------------------------------- Load Sat Well Header'
            EXEC Master_Etl.Load_Master_Sat_Well_Header;
PRINT '-------------------------------------------------------------------------------------------------------------- Done Loading Sat Well Header'
        END

        DECLARE @Hub_UIDs dbo.List_UNIQUEIDENTIFIER

PRINT '-------------------------------------------------------------------------------------------------------------- Update Hub'
        INSERT INTO @Hub_UIDs
        SELECT
            b.Master_Hub_Well_Header_UID
        FROM (SELECT
                    mwh.Master_Hub_Well_Header_UID
                FROM Master_Etl.Map_Well_Header AS mwh
                WHERE mwh.Aries_Dim_Well_Header_UID IS NULL
                INTERSECT
                SELECT
                    mwh.Master_Hub_Well_Header_UID
                FROM Master_Etl.Map_Well_Header AS mwh
                WHERE mwh.Petra_Dim_Well_Header_UID IS NULL
                INTERSECT
                SELECT
                    mwh.Master_Hub_Well_Header_UID
                FROM Master_Etl.Map_Well_Header AS mwh
                WHERE mwh.Merrick_Dim_Well_Header_UID IS NULL
                INTERSECT
                SELECT
                    mwh.Master_Hub_Well_Header_UID
                FROM Master_Etl.Map_Well_Header AS mwh
                WHERE mwh.SigmaFlow_Dim_Well_Header_UID IS NULL
                INTERSECT
                SELECT
                    mwh.Master_Hub_Well_Header_UID
                FROM Master_Etl.Map_Well_Header AS mwh
                WHERE mwh.FracSchedule_Dim_Well_Header_UID IS NULL
                INTERSECT
                SELECT
                    mwh.Master_Hub_Well_Header_UID
                FROM Master_Etl.Map_Well_Header AS mwh
                WHERE mwh.WellView_Dim_Well_Header_UID IS NULL
                INTERSECT
                SELECT
                    mwh.Master_Hub_Well_Header_UID
                FROM Master_Etl.Map_Well_Header AS mwh
                WHERE mwh.Enertia_Dim_Well_Header_UID IS NULL
				INTERSECT
                SELECT
                    mwh.Master_Hub_Well_Header_UID
                FROM Master_Etl.Map_Well_Header AS mwh
                WHERE mwh.GIS_Dim_Well_Header_UID IS NULL

   				INTERSECT
                SELECT
                mwh.Master_Hub_Well_Header_UID
                FROM Master_Etl.Map_Well_Header AS mwh
                WHERE mwh.Aries_Planning_Dim_Well_Header_UID IS NULL
        ) AS b

PRINT '-------------------------------------------------------------------------------------------------------------- Perform Deletes'
        EXEC Master.Delete_Well_Header_By_UID
            @Hub_Well_Header_UIDs = @Hub_UIDs
           ,@Perform_Hard_Delete  = 1
           ,@Use_Transaction      = 0


        -- Normally want to re-process all links
        IF (@ProcessingType & 2) = 2
        BEGIN
PRINT '-------------------------------------------------------------------------------------------------------------- Loading Aliases'
            EXEC Master_Etl.Load_Master_Sat_Well_Header_Alias_Well_Name
        END
        SET @retval = 0;

PRINT '-------------------------------------------------------------------------------------------------------------- Post Integration'
--- Post Integration Engine Adjustments
--- DECLARE @retval INT = -1;

---PRINT '-------------------------------------------------------------------------------------------------------------- Synchronize Well Names'
---         EXEC @retval = Master_Etl.Process_Well_Header_Adjust_1_Set_WellName_Within_Source_Update;
---         EXEC @retval = Master_Etl.Process_Well_Header_Adjust_1_Set_WellName_From_GIS_Update;
---PRINT '-------------------------------------------------------------------------------------------------------------- Deleted Flag'
---         EXEC @retval = Master_Etl.Process_Well_Header_Adjust_2_Set_Deleted_Flag_Update;
---PRINT '-------------------------------------------------------------------------------------------------------------- Hub ID'
---   		EXEC @retval = Master_Etl.Process_Well_Header_Adjust_3_Set_Hub_Id_Update;
---   		EXEC @retval = Master_Etl.Process_Well_Header_Adjust_4_Set_Hub_Filtered_Update;
PRINT '-------------------------------------------------------------------------------------------------------------- Update Attributes'

PRINT '-------------------------------------------------------------------------------------------------------------- Operational Dates'
--- rewrite 1 DONE
--- Operational Dates: updates Core SAT and Wellview SAT Operational Dates from Translate Wellview.
	     EXEC @retval = Master_Etl.Process_Well_Header_Adjust_5_Operational_Dates_Update;
PRINT '-------------------------------------------------------------------------------------------------------------- Formation'
---rewrite 2 DONE
--- Formation: updates Core SAT and Petra SAT formation from Translate Petra.
         EXEC @retval = Master_Etl.Process_Well_Header_Adjust_5_Producing_Formation_Update;
PRINT '-------------------------------------------------------------------------------------------------------------- SEQNUM'
---rewrite 3 DONE
--- SEQNUM: updates Core SAT and GIS SAT SEQNUM from Translate GIS.
---		 EXEC @retval = Master_Etl.Process_Well_Header_Adjust_5_SEQNUM_Update;
PRINT '----To Do: Extend to all Sources------------------------------------------------------------------------------ Cost Center'
---rewrite 4 DONE
--- Cost Center: updates Core SAT and Enertia SAT Cost Center from Translate Enertia.
---		 EXEC @retval = Master_Etl.Process_Well_Header_Adjust_5_Cost_Center_Update;

PRINT '-------------------------------------------------------------------------------------------------------------- All Attributes by Source'
--- All Attributes: updates Core SAT attributes from each Source SAT based on Source of Truth.
--- This follows the above updates from Translate.
--- should I include SEQNUM or not?
---         EXEC @retval = Master_Etl.Process_Well_Header_Adjust_5_Set_Attributes_By_Source_Update;

PRINT '-------------------------------------------------------------------------------------------------------------- Update Pivot Table'
---EXEC @retval = Master_Etl.Process_Well_Header_Pivot;

PRINT '-------------------------------------------------------------------------------------------------------------- Done with Post Integration'


---PRINT '-------------------------------------------------------------------------------------------------------------- Remove Duplicate SEQNUM'
---         EXEC @retval = Master_Etl.Process_Well_Header_Adjust_6_Remove_Duplicate_SEQNUM_Update;

---PRINT '-------------------------------------------------------------------------------------------------------------- Operational Dates'
---	     EXEC @retval = Master_Etl.Process_Well_Header_Adjust_Operational_Dates_Update;
---PRINT '----To Do: Extend to all Sources------------------------------------------------------------------------------ Cost Center'
---		 EXEC @retval = Master_Etl.Process_Well_Header_Adjust_Cost_Center;
---PRINT '----To Do: Extend to all Sources------------------------------------------------------------------------------ SEQNUM'
---		 EXEC @retval = Master_Etl.Process_Well_Header_Adjust_SEQNUM_In_SAT_Update;
---PRINT '-------------------------------------------------------------------------------------------------------------- SEQNUM Enertia'
---      EXEC @retval = Master_Etl.Process_Well_Header_Adjust_SEQNUM_In_SAT_Enertia_Update;
---PRINT '-------------------------------------------------------------------------------------------------------------- Formation'
---      EXEC @retval = Master_Etl.Process_Well_Header_Adjust_Producing_Formation_Update;
--------------------------------------------------------------------------------------------------------------------
---Reload DIM Well Header
--------------------------------------------------------------------------------------------------------------------

---     DROP TABLE     [Master].[Dim_Well_Header_9_From_SAT_Table_Backup];
---     SELECT * INTO  [Master].[Dim_Well_Header_9_From_SAT_Table_Backup]
---     FROM           [Master].[Dim_Well_Header_9_From_SAT_Table];

---     DROP TABLE           [Master].[Dim_Well_Header_9_From_SAT_Table];
---     SELECT TOP 0 * INTO  [Master].[Dim_Well_Header_9_From_SAT_Table]
---     FROM                 [Master].[Dim_Well_Header_9_From_SAT];

---     DROP TABLE           [Mart].[Well_Header_Setup_Wellview_Table];
---     SELECT TOP 0 * INTO  [Mart].[Well_Header_Setup_Wellview_Table]
---     FROM                 [Mart].[Well_Header_Setup_Wellview];

FINAL_TABLES:

PRINT '-------------------------------------------------------------------------------------------------------------- DIM Well Header'

---TRUNCATE TABLE Master.[Dim_Well_Header_Core_Update_Hub_Table];
---INSERT INTO    Master.[Dim_Well_Header_Core_Update_Hub_Table]
---SELECT * FROM  Master.[Dim_Well_Header_Core_Update_Hub];

---TRUNCATE TABLE [Master].[Dim_Well_Header_Simple_4_All_Columns_Table];
---INSERT INTO    [Master].[Dim_Well_Header_Simple_4_All_Columns_Table]
---SELECT * FROM  [Master].[Dim_Well_Header_Simple_4_All_Columns];
---
---TRUNCATE TABLE [Master].Dim_Well_Header_Simple_5_Unique_1_Columns_Table;
---INSERT INTO    [Master].Dim_Well_Header_Simple_5_Unique_1_Columns_Table
---SELECT * FROM  [Master].Dim_Well_Header_Simple_5_Unique_1_Columns;
---
---TRUNCATE TABLE [Master].Dim_Well_Header_Simple_5_Unique_2_Columns_Table;
---INSERT INTO    [Master].Dim_Well_Header_Simple_5_Unique_2_Columns_Table
---SELECT * FROM  [Master].Dim_Well_Header_Simple_5_Unique_2_Columns;
---
---TRUNCATE TABLE [Master].Dim_Well_Header_Simple_6_All_Columns_Table;
---INSERT INTO    [Master].Dim_Well_Header_Simple_6_All_Columns_Table
---SELECT * FROM  [Master].Dim_Well_Header_Simple_6_All_Columns;

PRINT '-------------------------------------------------------------------------------------------------------------- Wellview Setup'
---     Process Well Setup Table for Wellview Well Creator

---        TRUNCATE TABLE [Mart].[Well_Header_Setup_Wellview_Table];
---        INSERT INTO    [Mart].[Well_Header_Setup_Wellview_Table]
---        SELECT * FROM  [Mart].[Well_Header_Setup_Wellview];


    END TRY
    BEGIN CATCH

        SET @retval = -1;

        THROW;

    END CATCH;

    RETURN @retval;

END;
GO


