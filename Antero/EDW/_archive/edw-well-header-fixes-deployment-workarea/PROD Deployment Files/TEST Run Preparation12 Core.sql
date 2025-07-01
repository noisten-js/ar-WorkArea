USE [EDW]
GO

/****** Object:  Table [Master].[Dim_Well_Header_Core_Update_Hub_Table]    Script Date: 11/1/2024 12:23:21 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Master].[Dim_Well_Header_Core_Update_Hub_Table]') AND type IN (N'U'))
DROP TABLE [Master].[Dim_Well_Header_Core_Update_Hub_Table]
GO

/****** Object:  Table [Master].[Dim_Well_Header_Core_Update_Hub_Table]    Script Date: 11/1/2024 12:23:21 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Master].[Dim_Well_Header_Core_Update_Hub_Table](
	[Well_Name_Antero_Standard] [VARCHAR](300) NULL,
	[Sources] [NVARCHAR](10) NULL,
	[Sources Rank] [BIGINT] NULL,
	[Sources Length] [INT] NULL,
	[Type] [VARCHAR](9) NULL,
	[Well_Header_UID] [UNIQUEIDENTIFIER] NULL,
	[Hub_Well_Header_ID_C] [BIGINT] NULL,
	[SEQNUM] [INT] NULL,
	[API_Number] [VARCHAR](30) NULL,
	[Cost_Center] [VARCHAR](20) NULL,
	[Sources_Unique] [NVARCHAR](10) NULL,
	[Type_Unique] [VARCHAR](6) NULL,
	[Well_Header_UID_Unique] [UNIQUEIDENTIFIER] NULL,
	[Hub_Well_Header_ID_C_Unique] [BIGINT] NULL,
	[SEQNUM_Unique] [INT] NULL,
	[API_Number_Unique] [VARCHAR](30) NULL,
	[Cost_Center_Unique] [VARCHAR](20) NULL,
	[SigmaFlow Integration with SEQNUM Unique] [VARCHAR](3) NULL,
	[SigmaFlow Integration GIS with SEQNUM Unique] [VARCHAR](3) NULL,
	[Sources_Duplicate] [NVARCHAR](10) NULL,
	[Type_Duplicate] [VARCHAR](9) NULL,
	[Well_Header_UID_Duplicate] [UNIQUEIDENTIFIER] NULL,
	[Hub_Well_Header_ID_C_Duplicate] [BIGINT] NULL,
	[SEQNUM_Duplicate] [INT] NULL,
	[API_Number_Duplicate] [VARCHAR](30) NULL,
	[Cost_Center_Duplicate] [VARCHAR](20) NULL,
	[SigmaFlow Integration with SEQNUM Duplicate] [VARCHAR](3) NULL,
	[SigmaFlow Integration GIS with SEQNUM Duplicate] [VARCHAR](3) NULL
) ON [PRIMARY]
GO





USE [EDW]
GO

/****** Object:  View [Master].[Dim_Well_Header_Core]    Script Date: 11/1/2024 12:26:00 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO











CREATE   VIEW [Master].[Dim_Well_Header_Core]
AS

SELECT * FROM [Master].[Dim_Well_Header] 

GO


