USE [EDW]
GO

/****** Object:  View [Translate].[View_Well_Header_GIS]    Script Date: 10/12/2024 7:22:55 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




---SET QUOTED_IDENTIFIER ON
---SET ANSI_NULLS ON
---GO
---
---
---
ALTER VIEW [Translate].[View_Well_Header_GIS]
AS
    WITH Well
    AS (
           SELECT
            well.*
          ,CASE
               WHEN well.Shape.STNumPoints() <= 3
                    AND well.Shape.STEndPoint().STBuffer(well.Shape.STEndPoint().STDistance(well.Shape.STPointN(well.Shape.STNumPoints() - 1)) / 2).STIntersection(well.Shape).STEndPoint().STIntersection(well.Shape.STEndPoint()).STEndPoint().STCrosses(well.Shape.STEndPoint()) = 0
                   THEN well.Shape.STEndPoint().STBuffer(well.Shape.STEndPoint().STDistance(well.Shape.STPointN(well.Shape.STNumPoints() - 1)) / 2).STIntersection(well.Shape).STStartPoint()
               WHEN well.Shape.STNumPoints() <= 3
                    AND well.Shape.STEndPoint().STBuffer(well.Shape.STEndPoint().STDistance(well.Shape.STPointN(well.Shape.STNumPoints() - 1)) / 2).STIntersection(well.Shape).STEndPoint().STIntersection(well.Shape.STEndPoint()).STEndPoint().STCrosses(well.Shape.STEndPoint()) IS NULL
                   THEN well.Shape.STEndPoint().STBuffer(well.Shape.STEndPoint().STDistance(well.Shape.STPointN(well.Shape.STNumPoints() - 1)) / 2).STIntersection(well.Shape).STEndPoint()
               WHEN well.Shape.STNumPoints() >= 3
                    AND well.Shape.STEndPoint().STBuffer(well.Shape.STEndPoint().STDistance(well.Shape.STStartPoint()) / 2).STIntersection(well.Shape).STEndPoint().STIntersection(well.Shape.STEndPoint()).STEndPoint().STCrosses(well.Shape.STEndPoint()) IS NULL
                   THEN well.Shape.STEndPoint().STBuffer(well.Shape.STEndPoint().STDistance(well.Shape.STStartPoint()) / 2).STIntersection(well.Shape).STEndPoint()
               WHEN well.Shape.STNumPoints() >= 3
                    AND well.Shape.STEndPoint().STBuffer(well.Shape.STEndPoint().STDistance(well.Shape.STStartPoint()) / 2).STIntersection(well.Shape).STEndPoint().STIntersection(well.Shape.STEndPoint()).STEndPoint().STCrosses(well.Shape.STEndPoint()) = 0
                   THEN well.Shape.STEndPoint().STBuffer(well.Shape.STEndPoint().STDistance(well.Shape.STStartPoint()) / 2).STIntersection(well.Shape).STStartPoint()
           END                                                    AS MidPointShape
          ,well.Shape.STEndPoint()                                AS EndPointShape
          ,well_nad27.Shape                                       AS shape_nad27
          ,well_nad27.Shape.MakeValid().STStartPoint().ToString() AS Surface_Location
          ,well_nad27.Shape.MakeValid().STStartPoint()            AS Surface_Location_Shape
          ,well_nad27.Shape.MakeValid().STEndPoint().ToString()   AS Bottom_Hole_Location
          ,well_nad27.Shape.MakeValid().STEndPoint()              AS BottomHole_Location_Shape
           FROM
            EDW_Stage.Stage.GIS_AnteroHorizontal                       well
               LEFT JOIN EDW_Stage.Stage.GIS_AnteroHorizontal_Nad_1927 well_nad27
                   ON HASHBYTES('SHA1', CONCAT(well.PetraSequenceNumber, well.PetraWellName, well.GISWellName)) = HASHBYTES('SHA1', CONCAT(well_nad27.PetraSequenceNumber, well_nad27.PetraWellName, well_nad27.GISWellName))
           WHERE
            NOT (
                    well_nad27.PetraSequenceNumber = -99999
                    AND well.PetraWellName IS NULL
                    AND well.GISWellName IS NULL
                ))

    SELECT * FROM (SELECT ROW_NUMBER() OVER (PARTITION BY [Well_Name_Antero_Standard] ORDER BY SEQNUM DESC) AS [Row Num], * FROM (
    SELECT
    CAST(HASHBYTES('SHA1', CONCAT(Well.GISWellName, Well.PetraWellName, Well.PetraAPI, Well.PetraSequenceNumber)) AS VARBINARY(32))                                                           AS GIS_ID
   ,Well.AreaofOperations                                                                                                                                                                     AS Area_Of_Operations
   ,Well.GISFormation                                                                                                                                                                         AS Target_Formation
   ,CAST(NULLIF(Well.PetraSequenceNumber, '-99999') AS FLOAT)                                                                                                                                 AS SEQNUM
   ,CASE WHEN LEN(Well.PetraAPI) = 14 THEN Well.PetraAPI ELSE NULL END                                                                                                                        AS API_number
   ,COALESCE(Translate.fn_Convert_Wellbore_Name_To_Well_Name(Well.GISWellName), Translate.fn_Convert_Wellbore_Name_To_Well_Name(Well.PetraWellName))                                          AS Well_Name
   ,Translate.fn_Standardize_Well_Name(Translate.fn_Convert_Wellbore_Name_To_Well_Name(Well.GISWellName))                                                                                     AS Well_Name_Antero_Standard
   ,COALESCE(Well.GISWellName, Well.PetraWellName)                                                                                                                                            AS Wellbore_Name
   ,Translate.fn_Standardize_Well_Name(Well.GISWellName)                                                                                                                                      AS Wellbore_Name_Antero_Standard
   ,CASE
        WHEN LEN(PetraAPI) = 14
            THEN CASE
                     WHEN LEFT(PetraAPI, 2) = '34'
                         THEN 'Ohio'
                     WHEN LEFT(PetraAPI, 2) = '37'
                         THEN 'Pennsylvania'
                     WHEN LEFT(PetraAPI, 2) = '47'
                         THEN 'West Virginia'
                     ELSE NULL
                 END
        ELSE CASE
                 WHEN Well.AreaofOperations = 'Marcellus'
                     THEN 'West Virginia'
                 WHEN Well.AreaofOperations = 'Utica'
                     THEN 'Ohio'
                 ELSE NULL
             END
    END                                                                                                                                                                                       AS API_State_Name
   ,Well.GISWellStatus                                                                                                                                                                        AS Well_Status
   ,Well.GISPadName                                                                                                                                                                           AS Pad_Name
   ,Well.RigName                                                                                                                                                                              AS Big_Rig_Name
   ,Well.GISLateralLength_ft                                                                                                                                                                  AS Planned_Lateral_Length
   ,'Horizontal'                                                                                                                                                                              AS Configuration
   ,1                                                                                                                                                                                         AS Is_Antero_Well
   ,'Antero Resources'                                                                                                                                                                        AS Operator
   ,Well.Shape                                                                                                                                                                                AS Wellbore_Shape_NAD27_BLM
   ,Well.shape_nad27                                                                                                                                                                          AS Wellbore_Shape
   ,REPLACE(SUBSTRING(Well.Surface_Location, 1, PATINDEX('%[0-9] [0-9]%', Well.Surface_Location)), 'POINT (', '')                                                                             AS Surface_Longitude_NAD27
   ,SUBSTRING(Well.Surface_Location, PATINDEX('%[0-9] [0-9]%', Well.Surface_Location) + 1, LEN(Well.Surface_Location) - PATINDEX('%[0-9] [0-9]%', Well.Surface_Location) - 1)                 AS Surface_Latitude_NAD27
   ,REPLACE(SUBSTRING(Well.Bottom_Hole_Location, 1, PATINDEX('%[0-9] [0-9]%', Well.Bottom_Hole_Location)), 'POINT (', '')                                                                     AS BottomHole_Longitude_NAD27
   ,SUBSTRING(Well.Bottom_Hole_Location, PATINDEX('%[0-9] [0-9]%', Well.Bottom_Hole_Location) + 1, LEN(Well.Bottom_Hole_Location) - PATINDEX('%[0-9] [0-9]%', Well.Bottom_Hole_Location) - 1) AS BottomHole_Latitude_NAD27
   ,Well.Surface_Location_Shape
   ,Well.BottomHole_Location_Shape
   ,Unit.UnitName                                                                                                                                                                             AS Unit_Name
   ,Unit.Prospect                                                                                                                                                                             AS Prospect
   ,wahl.BTUGridCode                                                                                                                                                                          AS Btu_Grid_Code
    ,wahl.MidpointLongitude AS Midpoint_Longitude
	,wahl.MidpointLatitude AS Midpoint_Latitude
	,wahl.EasterlySpacingAllLateral AS Spacing_East
    ,wahl.WesterlySpacingAllLateral AS Spacing_West
	,wahl.WeeklyRigScheduleLateralSpacing AS Planned_Lateral_Spacing_Raw
	,CASE WHEN wahl.WeeklyRigScheduleLateralSpacing >= 0    AND wahl.WeeklyRigScheduleLateralSpacing <= 745 
	      THEN 660.0
		  WHEN wahl.WeeklyRigScheduleLateralSpacing >= 746  AND wahl.WeeklyRigScheduleLateralSpacing <= 915 
	      THEN 830.0
		  WHEN wahl.WeeklyRigScheduleLateralSpacing >= 916  AND wahl.WeeklyRigScheduleLateralSpacing <= 1160 
	      THEN 1000.0
		  WHEN (wahl.WeeklyRigScheduleLateralSpacing >= 1161 OR wahl.WeeklyRigScheduleLateralSpacing IS NULL)
	      THEN 1320.0
		  WHEN wahl.WeeklyRigScheduleLateralSpacing < 0
	      THEN -999
 	 END AS Planned_Lateral_Spacing
	,wahl.OilYieldGridCode AS Oil_Yield_Grid_Code
	,wahl.TypeCurveAreaName AS Type_Curve_Name
	,wahl.GeoUnitMappedUnitAcres AS Unit_Acreage
	,wahl.PadOrientation
	,mra.CompressorName AS Compressor_Name
	,mra.CompressorArea AS Compressor_Area
	,mra.GatheringFeeArea AS Gathering_Fee_Area 
	,wahl.RawReserveCategory AS Raw_Reserve_Category
	FROM
    Well
        LEFT JOIN EDW_Stage.Stage.GIS_UNITSHAPE_Nad_1927_Blm    Unit_Nad27_BLM
            ON Unit_Nad27_BLM.Shape_Geometry.STIntersects(Well.MidPointShape) = 1
        LEFT JOIN EDW_Stage.Stage.GIS_UNITSHAPE                 Unit
            ON Unit_Nad27_BLM.OBJECTID = Unit.OBJECTID
        LEFT JOIN EDW_Stage.Stage.GIS_Well_RPT_ARHorizontalReportLoad wahl
            ON wahl.PetraWellName = Well.PetraWellName
               AND  wahl.PetraEDWAPI = Well.PetraAPI
               AND  wahl.PetraSequenceNumber = Well.PetraSequenceNumber
---Non-Uniqueness starts here
        LEFT JOIN edw_stage.stage.[GIS_MIDSTREAMRESERVESATTRIBUTES] mra
		    ON well.PetraSequenceNumber = mra.seqnum
    WHERE
    CASE
        WHEN (
                 Well.PetraWellName LIKE '%HD%'
                 OR Well.PetraWellName LIKE '%DEEP%'
             )
             AND Unit.UnitName LIKE '%DEEP%'
            THEN 1
        WHEN Well.PetraWellName LIKE '%HD%'
             AND Unit.UnitName NOT LIKE '%DEEP%'
            THEN 0
        WHEN (
                 Well.PetraWellName NOT LIKE '%HD%'
                 OR Well.PetraWellName NOT LIKE '%DEEP%'
             )
             AND Unit.UnitName LIKE '%DEEP%'
            THEN 0
        ELSE 1
    END = 1
)aa)bb WHERE [Row Num] = 1

GO

