USE EDW
SELECT
    dwh.Well_Header_UID
   ,upper(dwh.Well_Name_Antero_Standard)                                                            AS [Well Name]
   ,dwh.Sources                                                                                     AS Well_Name_Source
   ,dwh.Well_Name_Aries
   ,dwh.Well_Name_Enertia
   ,dwh.Well_Name_Merrick
   ,dwh.Well_Name_Petra
   ,dwh.Well_Name_SigmaFlow
   ,dwh.Well_Name_WellView
   ,dwh.Well_Name                                                                                   AS [Well Name Orig]
   ,dwh.Current_Operations_Status                                                                   AS [Current Well Ops]
   ,dwh.Current_Operations_SubStatus                                                                AS [Current Well SubStatus]
   ,dwh.Configuration                                                                               AS [Well Configuration]
   ,isnull(dwh.Producing_Formation, dwh.Producing_Formation_WellView)                               AS [Producing Formation]
   ,upper(dwh.Prospect)                                                                             AS [Field Name (Prospect)]
   ,upper(dwh.County)                                                                               AS County
   ,upper(isnull(dwh.State_Name, dwh.State_Name_WellView))                                          AS [State/Province]
   ,dwh.Pad_AFE_Number                                                                              AS [Pad AFE #]
   ,isnull(dwh.Cost_Center, dwh.Cost_Center_WellView)                                               AS [Cost Center #]
   ,dwh.API_Number                                                                                  AS [API/UWI]
   ,upper(isnull(dwh.Pad_Name, dwh.Pad_Name_WellView))                                              AS [Pad Name]
   ,dbo.fn_proper_case(dwh.Operator)                                                                AS Operator
   ,isnull(dwh.Working_Interest, dwh.Working_Interest_WellView) / 100.000000                        AS [Working Interest (%)]
   ,cast(dwh.Conductor_Spud_Date_Actual AS DATE)                                                    AS [Conductor Spud Date]
   ,dbo.fn_proper_case(dwh.Small_Rig_Name)                                                          AS [Small Rig Name]
   ,cast(dwh.Surface_Spud_Date_Actual AS DATE)                                                      AS [Surface Spud Date]
   ,CASE
        WHEN dwh.Big_Rig_Spud_Date_Actual IS NULL THEN
            NULL
        ELSE
            dbo.fn_proper_case(replace(dwh.Big_Rig_Name, 'Patterson', 'PAT UTI'))
    END                                                                                             AS [Big Rig Name]
   ,cast(dwh.Drilling_Operations_Resume_Date AS DATE)                                               AS [Resume Drilling Operations Date]
   ,cast(dwh.Rig_Release_Date_Actual AS DATE)                                                       AS [RR Date]
   ,cast(dwh.Completion_Date_Actual AS DATE)                                                        AS [Completion Date]
   ,cast(dwh.First_Production_Date_Gas_Actual AS DATE)                                              AS [1st Production Date]
   ,cast(isnull(dwh.First_Sales_Date_Gas_Actual, dwh.First_Sales_Date_Gas_Actual_WellView) AS DATE) AS [First Sales Date - Gas]
   ,cast(dwh.First_Sales_Date_Oil_Actual AS DATE)                                                   AS [First Sales Date - Oil]
   ,cast(dwh.Shut_In_Date AS DATE)                                                                  AS [Shut In Date]
   ,dwh.Operations_Comments                                                                         AS Comments
   ,dwh.Total_Measured_Depth_Actual                                                                 AS [Total Measured Depth]
   ,dwh.Drilled_Lateral_Length_Actual                                                               AS [Gross Lateral Length]
   ,Frac.[Pad Ready to RU Frac Date]
   ,NULL                                                                                            AS [Well Name Source]
   ,NULL                                                                                            AS [Current Well Ops Source]
   ,NULL                                                                                            AS [Current Well SubStatus Source]
   ,NULL                                                                                            AS [Well Configuration Source]
   ,NULL                                                                                            AS [Producing Formation Source]
   ,NULL                                                                                            AS [Field Name (Prospect) Source]
   ,NULL                                                                                            AS [County Source]
   ,NULL                                                                                            AS [State/Province Source]
   ,NULL                                                                                            AS [Pad AFE # Source]
   ,NULL                                                                                            AS [Cost Center # Source]
   ,NULL                                                                                            AS [API/UWI Source]
   ,NULL                                                                                            AS [Pad Name Source]
   ,NULL                                                                                            AS [Operator Source]
   ,NULL                                                                                            AS [Working Interest (%) Source]
   ,NULL                                                                                            AS [Conductor Spud Date Source]
   ,NULL                                                                                            AS [Small Rig Name Source]
   ,NULL                                                                                            AS [Surface Spud Date Source]
   ,NULL                                                                                            AS [Big Rig Name Source]
   ,NULL                                                                                            AS [Resume Drilling Operations Date Source]
   ,NULL                                                                                            AS [RR Date Source]
   ,NULL                                                                                            AS [Completion Date Source]
   ,NULL                                                                                            AS [1st Production Date Source]
   ,NULL                                                                                            AS [First Sales Date - Gas Source]
   ,NULL                                                                                            AS [First Sales Date - Oil Source]
   ,NULL                                                                                            AS [Shut In Date Source]
   ,NULL                                                                                            AS [Comments Source]
   ,NULL                                                                                            AS [Total Measured Depth Source]
   ,NULL                                                                                            AS [Gross Lateral Length Source]
   ,dwh.Surface_Location_Shape
   ,dwh.Surface_Latitude_NAD27
   ,dwh.Surface_Longitude_NAD27
   ,dwh.BottomHole_Latitude_NAD27
   ,dwh.BottomHole_Longitude_NAD27
   ,cast(getdate() AS DATE)                                                                         AS ETLLoadDate
---1975
FROM Master.Dim_Well_Header AS dwh
LEFT OUTER JOIN
[EDW_Stage].[Stage].[Frac_Schedule] Frac
ON dwh.SEQNUM = Frac.SEQNUM
WHERE RTRIM(LTRIM(dwh.Critical_Date_Report)) = 'Yes';
GO
