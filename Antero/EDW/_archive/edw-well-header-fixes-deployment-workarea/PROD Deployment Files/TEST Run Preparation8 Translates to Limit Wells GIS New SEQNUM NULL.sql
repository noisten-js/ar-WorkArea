USE [EDW]
GO

/****** Object:  View [Translate].[View_Well_Header_GIS_NULL_SEQNUM]    Script Date: 11/1/2024 9:18:33 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER VIEW [Translate].[View_Well_Header_GIS_NULL_SEQNUM]
AS

SELECT 
       
       [Row Num]
      ,[GIS_ID]
      ,[Area_Of_Operations]
      ,[Target_Formation]
      ,[SEQNUM_Coalesce] AS [SEQNUM]
      ,[API_number]
      ,[Well_Name]
      ,[Well_Name_Antero_Standard]
      ,[Wellbore_Name]
      ,[Wellbore_Name_Antero_Standard]
      ,[API_State_Name]
      ,[Well_Status]
      ,[Pad_Name]
      ,[Big_Rig_Name]
      ,[Planned_Lateral_Length]
      ,[Configuration]
      ,[Is_Antero_Well]
      ,[Operator]
      ,[Wellbore_Shape_NAD27_BLM]
      ,[Wellbore_Shape]
      ,[Surface_Longitude_NAD27]
      ,[Surface_Latitude_NAD27]
      ,[BottomHole_Longitude_NAD27]
      ,[BottomHole_Latitude_NAD27]
      ,[Surface_Location_Shape]
      ,[BottomHole_Location_Shape]
      ,[Unit_Name]
      ,[Prospect]
      ,[Btu_Grid_Code]
      ,[Midpoint_Longitude]
      ,[Midpoint_Latitude]
      ,[Spacing_East]
      ,[Spacing_West]
      ,[Planned_Lateral_Spacing_Raw]
      ,[Planned_Lateral_Spacing]
      ,[Oil_Yield_Grid_Code]
      ,[Type_Curve_Name]
      ,[Unit_Acreage]
      ,[PadOrientation]
      ,[Compressor_Name]
      ,[Compressor_Area]
      ,[Gathering_Fee_Area]
      ,[Raw_Reserve_Category]
FROM (
---xxx   SELECT 'GIS'            AS Source, well_name_antero_standard,SEQNUM FROM [Translate].[View_Well_Header_GIS]            WHERE SEQNUM IS NULL        UNION ALL
---xxx   SELECT 'Aries'          AS Source, well_name_antero_standard,SEQNUM FROM [Translate].[View_Well_Header_Aries]          WHERE SEQNUM IS NOT NULL	UNION ALL
---xxx---SELECT 'Wellview'       as Source, well_name_antero_standard,SEQNUM FROM [Translate].[View_Well_Header_Wellview]       WHERE SEQNUM IS NOT NULL	UNION ALL
---xxx---SELECT 'Merrick'        as Source, well_name_antero_standard,SEQNUM FROM [Translate].[View_Well_Header_Merrick]        WHERE SEQNUM IS NOT NULL	UNION ALL
---xxx   SELECT 'Petra'          AS Source, well_name_antero_standard,SEQNUM FROM [Translate].[View_Well_Header_Petra]          WHERE SEQNUM IS NOT NULL	UNION ALL
---      SELECT 'Enertia'        AS Source, well_name_antero_standard,SEQNUM FROM [Translate].[View_Well_Header_Enertia]        WHERE SEQNUM IS NOT NULL	UNION ALL
---      SELECT 'SigmaFlow'      AS Source, well_name_antero_standard,SEQNUM FROM [Translate].[View_Well_Header_SigmaFlow]      WHERE SEQNUM IS NOT NULL	UNION ALL
---xxx   SELECT 'FracSchedule'   AS Source, well_name_antero_standard,SEQNUM FROM [Translate].[View_Well_Header_FracSchedule]   WHERE SEQNUM IS NOT NULL	UNION ALL
---      SELECT 'Aries_Planning' AS Source, well_name_antero_standard,SEQNUM FROM [Translate].[View_Well_Header_Aries_Planning] WHERE SEQNUM IS NOT NULL


SELECT COALESCE(Petra.SEQNUM, FracSchedule.SEQNUM, Aries.SEQNUM) AS SEQNUM_Coalesce,GIS.* FROM
(SELECT * FROM [Translate].[View_Well_Header_GIS_Base]     WHERE well_name_antero_standard IS NOT NULL AND SEQNUM IS NULL) GIS
LEFT OUTER JOIN
(SELECT * FROM [Translate].[View_Well_Header_Petra]        WHERE well_name_antero_standard IS NOT NULL AND SEQNUM IS NOT NULL) Petra
   ON GIS. Well_Name_Antero_Standard = Petra.Wellbore_Name_Antero_Standard
LEFT OUTER JOIN
(SELECT * FROM [Translate].[View_Well_Header_FracSchedule] WHERE well_name_antero_standard IS NOT NULL AND SEQNUM IS NOT NULL) FracSchedule
   ON GIS. Well_Name_Antero_Standard = FracSchedule.Wellbore_Name_Antero_Standard
LEFT OUTER JOIN
(SELECT * FROM [Translate].[View_Well_Header_Aries]        WHERE well_name_antero_standard IS NOT NULL AND SEQNUM IS NOT NULL) Aries
   ON GIS. Well_Name_Antero_Standard = Aries.Wellbore_Name_Antero_Standard
) aa


GO

