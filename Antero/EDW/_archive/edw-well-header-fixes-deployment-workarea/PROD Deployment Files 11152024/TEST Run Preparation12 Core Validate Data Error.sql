USE [EDW]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




---SELECT 
---Well_Name_Antero_Standard,
------MAX(SEQNUM_GIS) OVER (partition BY Well_Name_Antero_Standard) as SEQNUM_TRUTH,
------MAX(SEQNUM_GIS) OVER (partition BY Well_Name_Antero_Standard) as SEQNUM_TRUTH,
---MAX(SEQNUM_GIS) OVER (partition BY Well_Name_Antero_Standard) as SEQNUM_TRUTH
---
---FROM (



CREATE OR ALTER VIEW [Master].[Dim_Well_Header_Core_Validate_Data_Error]
AS

---2 all colunns
SELECT 

Sources,

[SigmaFlow Integration],
[SigmaFlow Integration with SEQNUM],

[SigmaFlow Integration GIS],
[SigmaFlow Integration GIS with SEQNUM],

[Wellview Integration],
[Wellview Integration Wellview],

Well_Name_Antero_Standard,
SEQNUM, 
SEQNUM_GIS,

MAX(SEQNUM_GIS)                    OVER (PARTITION BY Well_Name_Antero_Standard) AS SEQNUM_GIS_TRUTH,
MAX(SEQNUM)                        OVER (PARTITION BY Well_Name_Antero_Standard) AS SEQNUM_TRUTH,

MAX(API_NUMBER_GIS)                OVER (PARTITION BY Well_Name_Antero_Standard) AS API_NUMBER_GIS_TRUTH,
MAX(API_NUMBER)                    OVER (PARTITION BY Well_Name_Antero_Standard) AS API_NUMBER_TRUTH,

MAX(COST_CENTER_ENERTIA)           OVER (PARTITION BY Well_Name_Antero_Standard) AS COST_CENTER_ENERTIA_TRUTH,
MAX(COST_CENTER)                   OVER (PARTITION BY Well_Name_Antero_Standard) AS COST_CENTER_TRUTH,

MAX(Critical_Date_Report_WellView) OVER (PARTITION BY Well_Name_Antero_Standard) AS CRITICAL_DATE_REPORT_WELLVIEW_TRUTH,
MAX(Critical_Date_Report)          OVER (PARTITION BY Well_Name_Antero_Standard) AS CRITICAL_DATE_REPORT_TRUTH,

LEN(REPLACE(Sources,'_',''))                                  AS STRING_LENGTH
FROM [EDW].[Master].[Dim_Well_Header_Core]
WHERE Well_Name_Antero_Standard IN (

---1 find duplicates
SELECT Well_Name_Antero_Standard
FROM [EDW].[Master].[Dim_Well_Header_Core]
GROUP BY Well_Name_Antero_Standard
HAVING COUNT(*) > 1
---1
)
---ORDER BY 6
---2


---=SELECT * FROM translate.View_Well_Header_GIS WHERE Well_Name_Antero_Standard = 'ALICE UNIT 2H'
---=
---=
---=)bb
---=GROUP BY
---=Well_Name_Antero_Standard,
---=MAX(SEQNUM_GIS) OVER (PARTITION BY Well_Name_Antero_Standard),
---=MAX(SEQNUM)     OVER (PARTITION BY Well_Name_Antero_Standard),
---=
---=MAX(API_NUMBER_GIS) OVER (PARTITION BY Well_Name_Antero_Standard),
---=MAX(API_NUMBER)     OVER (PARTITION BY Well_Name_Antero_Standard),
---=
---=MAX(COST_CENTER_ENERTIA) OVER (PARTITION BY Well_Name_Antero_Standard),
---=MAX(COST_CENTER)         OVER (PARTITION BY Well_Name_Antero_Standard) 
---=---3
---=ORDER BY 2 DESC
GO

