USE [EDW]
GO

/****** Object:  View [Translate].[View_Well_Header_GIS_NOT_NULL_SEQNUM]    Script Date: 11/1/2024 9:18:00 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER VIEW [Translate].[View_Well_Header_GIS_NOT_NULL_SEQNUM]

AS

SELECT * FROM [Translate].[View_Well_Header_GIS_Base]     WHERE well_name_antero_standard IS NOT NULL AND SEQNUM IS NOT NULL
GO

