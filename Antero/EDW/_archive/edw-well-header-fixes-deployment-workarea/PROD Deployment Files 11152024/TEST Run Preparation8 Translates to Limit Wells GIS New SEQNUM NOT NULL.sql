USE [EDW]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER VIEW [Translate].[View_Well_Header_GIS_NOT_NULL_SEQNUM]

AS

SELECT [Row Num]
      ,[GIS_ID]
      ,[Area_Of_Operations]
      ,[Target_Formation]
      ,[SEQNUM]
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
  FROM [EDW].[Translate].[View_Well_Header_GIS_Base]    
  WHERE well_name_antero_standard IS NOT NULL AND SEQNUM IS NOT NULL
GO

