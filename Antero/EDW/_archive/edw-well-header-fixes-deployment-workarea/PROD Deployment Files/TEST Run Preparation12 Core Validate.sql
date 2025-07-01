USE [EDW]
GO

/****** Object:  View [Master].[Dim_Well_Header_Core_Validate]    Script Date: 11/1/2024 8:06:16 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [Master].[Dim_Well_Header_Core_Validate]
AS
SELECT 
sources,
seqnum                    AS SEQNUM_Front, 

Well_name,
dph.Well_Header_UID,
well_name_antero_standard AS well_name_antero_standard_Front,   
API_Number                AS API_Number_Front,
Cost_Center               AS Cost_Center_Front,

[SigmaFlow Integration GIS],
[SigmaFlow Integration GIS with SEQNUM],
[Wellview Integration Wellview]
[SigmaFlow Integration],
[SigmaFlow Integration with SEQNUM],
[Wellview Integration],

well_name_antero_standard, 
well_name_antero_standard_Aries,       
Well_Name_Antero_Standard_WellView,    
Well_Name_Antero_Standard_Merrick,     
Well_Name_Antero_Standard_Petra,       
Well_Name_Antero_Standard_enertia,     
Well_Name_Antero_Standard_SigmaFlow,   
well_name_Antero_Standard_Gis,         
Well_Name_Antero_Standard_FracSchedule,

seqnum,     
seqnum_Aries,       
SEQNUM_Petra,       
seqnum_enertia,     
SEQNUM_SigmaFlow,   
seqnum_gis,         
SEQNUM_FracSchedule,

api_number,  
api_number_Aries,    
API_Number_WellView, 
API_Number_Merrick,  
api_number_petra,    
api_number_enertia,  
API_Number_SigmaFlow,
api_number_Gis,

Cost_Center,
Cost_Center_WellView,
Cost_Center_Merrick,
cost_Center_enertia,

WSN_Number_SigmaFlow,
WSN_Number_Petra,
propnum_Aries,


mph.Enertia_Dim_Well_Header_UID,
mph.WellView_Dim_Well_Header_UID,
mph.Aries_Dim_Well_Header_UID,
mph.SigmaFlow_Dim_Well_Header_UID,
mph.FracSchedule_Dim_Well_Header_UID,
mph.Petra_Dim_Well_Header_UID,
mph.Aries_Planning_Dim_Well_Header_UID,
mph.Merrick_Dim_Well_Header_UID,
mph.GIS_Dim_Well_Header_UID

---Aries
---'Aries',       well_name_antero_standard_Aries,       seqnum_Aries,         api_number_Aries,     propnum_Aries,
---'Wellview',    Well_Name_Antero_Standard_WellView,                          API_Number_WellView,  Cost_Center_WellView,
---'Merrick',     Well_Name_Antero_Standard_Merrick,                           API_Number_Merrick,   Cost_Center_Merrick,
---'Petra',       Well_Name_Antero_Standard_Petra,       SEQNUM_Petra,         api_number_petra,     WSN_Number_Petra,
---'Enertia',     Well_Name_Antero_Standard_enertia,     seqnum_enertia,       api_number_enertia,   cost_Center_enertia,
---'Sigmaflow',   Well_Name_Antero_Standard_SigmaFlow,   SEQNUM_SigmaFlow,     API_Number_SigmaFlow, WSN_Number_SigmaFlow,
---'Gis',         well_name_Antero_Standard_Gis,         seqnum_gis,           api_number_Gis,
---'FracSchedule',Well_Name_Antero_Standard_FracSchedule,SEQNUM_FracSchedule
--,*
---FROM master.dim_Well_header
FROM [EDW].master.[Dim_Well_Header_Core] dph 
JOIN 
[EDW].master_etl.Map_Well_Header mph 
ON dph.Well_Header_UID = mph.Master_Hub_Well_Header_UID 
GO


