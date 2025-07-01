/*
Run this script on:

dendw02.EDW    -  This database will be modified

to synchronize it with:

testdw01.EDW

You are recommended to back up your database before running this script

Script created by SQL Data Compare version 15.3.6.25729 from Red Gate Software Ltd at 11/5/2024 5:04:20 PM

*/
		
SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS, NOCOUNT ON
GO
SET DATEFORMAT YMD
GO
SET XACT_ABORT ON
GO
SET TRANSACTION ISOLATION LEVEL Serializable
GO
BEGIN TRANSACTION

PRINT(N'Drop constraints from [Rules].[Rule]')
ALTER TABLE [Rules].[Rule] NOCHECK CONSTRAINT [FK_Rules_Rule_Rule_Alias_ID_Map_Rules_Rule_Alias]
ALTER TABLE [Rules].[Rule] NOCHECK CONSTRAINT [FK_Rules_Rule_Rule_Alias_ID_Unmap_Rules_Rule_Alias]
ALTER TABLE [Rules].[Rule] NOCHECK CONSTRAINT [FK_Rules_Rule_Rule_Entity_ID_Rules_Rule_Attribute_Group]
ALTER TABLE [Rules].[Rule] NOCHECK CONSTRAINT [FK_Rules_Rule_Rule_Entity_ID_Rules_Rule_Entity]
ALTER TABLE [Rules].[Rule] NOCHECK CONSTRAINT [FK_Rules_Rule_Rule_Type_ID_Rules_Rule_Type]

PRINT(N'Delete rows from [Rules].[Rule]')
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = -1
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 9
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 17
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 23
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 24
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 27
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 31
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 32
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 35
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 36
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 37
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 39
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 40
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 44
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 62
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 68
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 69
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 70
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 73
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 75
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 77
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 84
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 85
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 86
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 87
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 89
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 91
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 93
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 94
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 107
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 108
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 109
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 110
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 112
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 113
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 114
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 124
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 125
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 127
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 128
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 131
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 132
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 133
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 323
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 324
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 325
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 326
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 328
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 330
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 331
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 332
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 333
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 339
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 340
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 359
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 365
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 368
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 370
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 372
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 376
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 397
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 400
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 426
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 427
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 436
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 441
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 446
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 452
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 456
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 457
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 462
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 482
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 488
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 510
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 512
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 527
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 528
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 529
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 531
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 535
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 536
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 537
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 538
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 539
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 540
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 570
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 576
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 581
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 582
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 585
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 586
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 587
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 594
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 595
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 601
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 603
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 604
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 605
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 606
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 607
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 608
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 610
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 611
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 612
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 613
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 614
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 615
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 616
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 617
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1614
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1615
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1616
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1619
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1625
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1626
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1627
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1628
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1629
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1631
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1632
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1633
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1635
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1636
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1637
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1638
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1639
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1640
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1641
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1642
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1643
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1644
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1645
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1646
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1647
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1648
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1649
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1650
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1651
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1652
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1653
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1654
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1655
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1656
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1657
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1658
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1659
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1660
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1661
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1662
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1663
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1664
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1665
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1666
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1667
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1668
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1669
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1670
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1671
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1672
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1673
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1674
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1675
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1676
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1677
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1678
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1679
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1680
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1681
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1682
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1683
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1685
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1686
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1689
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1690
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1691
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1693
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1695
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1696
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1697
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1698
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1699
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1700
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1701
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1702
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1703
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1705
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1706
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1709
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1710
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1711
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1712
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1713
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1715
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1716
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1717
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1718
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1719
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1720
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1721
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1722
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1723
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1724
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1725
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1726
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1727
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1728
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1729
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1730
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1731
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1732
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1733
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1734
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1735
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1736
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1737
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1738
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1739
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1740
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1741
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1742
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1743
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1744
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1745
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1746
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1747
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1748
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1749
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1750
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1751
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1753
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1754
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1755
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1756
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1757
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1758
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1760
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1761
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1762
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1763
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1764
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1765
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1766
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1767
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1768
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1769
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1775
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1776
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1778
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1779
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1780
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1782
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1783
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1784
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1785
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1786
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1787
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1788
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1790
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1791
DELETE FROM [Rules].[Rule] WHERE [Rule_ID] = 1792
PRINT(N'Operation applied to 260 rows out of 260')

PRINT(N'Add rows to [Rules].[Rule]')
SET IDENTITY_INSERT [Rules].[Rule] ON
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2111, 1, -1, -1, N'Rules.Debug', NULL, N'SELECT NEWID() AS UID_Left, NEWID() AS UID_Right, CAST(1 AS BIT) AS X', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2112, 1, 2, 1, N'Match SEQNUM', N'Master Aries', N'SELECT
    src.Aries_Dim_Well_Header_UID      AS UID_Left
   ,hub.Hub_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.SEQNUM IS NULL THEN
                 0
             WHEN dst.SEQNUM = src.SEQNUM THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Aries.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.Aries_Dim_Well_Header AS pag ON src.Aries_Dim_Well_Header_UID = pag.Aries_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Master_Well_Header          AS dst ON dst.SEQNUM = src.SEQNUM
    INNER JOIN Master.Hub_Well_Header               AS hub ON dst.Hub_Well_Header_ID = hub.Hub_Well_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Aries_Dim_Well_Header_UID IS NOT NULL
        AND hub.Hub_Well_Header_UID IS NOT NULL
    )
--ORDER BY
--    src.Aries_Dim_Well_Header_UID
--   ,map.Master_Etl_Well_Header_Map_UID
', 'BIT', 0.75, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2113, 1, 2, 3, N'Match API Number', N'Master Aries', N'SELECT
    src.Aries_Dim_Well_Header_UID      AS UID_Left
   ,hub.Hub_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.API_Number IS NULL THEN
                 0
             WHEN dst.API_Number = src.API_Number THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Aries.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.Aries_Dim_Well_Header AS pag ON src.Aries_Dim_Well_Header_UID = pag.Aries_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Master_Well_Header          AS dst ON dst.API_Number = src.API_Number
    INNER JOIN Master.Hub_Well_Header               AS hub ON dst.Hub_Well_Header_ID = hub.Hub_Well_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Aries_Dim_Well_Header_UID IS NOT NULL
        AND hub.Hub_Well_Header_UID IS NOT NULL
    )
--ORDER BY
--    src.Aries_Dim_Well_Header_UID
--   ,map.Master_Etl_Well_Header_Map_UID
', 'BIT', 0.6, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2114, 1, 2, 2, N'Match Well Name Antero Standard', NULL, N'SELECT
    src.Aries_Dim_Well_Header_UID      AS UID_Left
   ,hub.Hub_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Wellbore_Name_Antero_Standard IS NULL THEN
                 0
             WHEN dst.Wellbore_Name_Antero_Standard = src.Wellbore_Name_Antero_Standard THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Aries.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.Aries_Dim_Well_Header AS pag ON src.Aries_Dim_Well_Header_UID = pag.Aries_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Master_Well_Header          AS dst ON dst.Wellbore_Name_Antero_Standard = src.Wellbore_Name_Antero_Standard
    INNER JOIN Master.Hub_Well_Header               AS hub ON dst.Hub_Well_Header_ID = hub.Hub_Well_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Aries_Dim_Well_Header_UID IS NOT NULL
        AND hub.Hub_Well_Header_UID IS NOT NULL
    )
--ORDER BY
--    src.Aries_Dim_Well_Header_UID
--   ,map.Master_Etl_Well_Header_Map_UID
', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2115, 1, 3, 1, N'Match Pad Name', NULL, N'SELECT
    src.UID_Left AS UID_Left
   ,dst.Aries_Dim_Pad_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Pad_Name_Antero_Standard IS NULL
                  OR dst.Pad_Name_Antero_Standard IS NULL THEN
                 0
             WHEN src.Pad_Name_Antero_Standard = dst.Pad_Name_Antero_Standard THEN
                 1
             ELSE
                 0
         END AS BIT)             AS X
   --,*
FROM Staging.Aries_Dim_Pad_Header      AS src
    FULL JOIN Aries.Dim_Pad_Header AS dst ON dst.Pad_Name_Antero_Standard = src.Pad_Name_Antero_Standard
WHERE
    (
        src.UID_Left IS NOT NULL
        AND dst.Aries_Dim_Pad_Header_UID IS NOT NULL
    )
    AND src.Processing_State = 1
--ORDER BY
--    src.UID_Left
--   ,dst.Aries_Dim_Pad_Header_UID
', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2116, 1, 9, 2, N'Match Pad Name', NULL, N'SELECT
    src.UID_Left AS UID_Left
   ,dst.Enertia_Dim_Pad_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Pad_Name_Antero_Standard IS NULL
                  OR dst.Pad_Name_Antero_Standard IS NULL THEN
                 0
             WHEN src.Pad_Name_Antero_Standard = dst.Pad_Name_Antero_Standard THEN
                 1
             ELSE
                 0
         END AS BIT)             AS X
   --,*
FROM Staging.Enertia_Dim_Pad_Header      AS src
    FULL JOIN Enertia.Dim_Pad_Header AS dst ON dst.Pad_Name_Antero_Standard LIKE ISNULL(src.Pad_Name_Antero_Standard, N''%'')
WHERE
    (
        src.UID_Left IS NOT NULL
        AND dst.Enertia_Dim_Pad_Header_UID IS NOT NULL
    )
    AND src.Processing_State = 1
--ORDER BY
--    src.Dim_Aries_Pad_Header_UID
--   ,dst.Dim_Aries_Pad_Header_UID', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2117, 1, 9, 1, N'Match Pad ID', NULL, N'SELECT
    src.UID_Left AS UID_Left
   ,dst.Enertia_Dim_Pad_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Pad_ID IS NULL
                  OR dst.Pad_ID IS NULL THEN
                 0
             WHEN src.Pad_ID = dst.Pad_ID THEN
                 1
             ELSE
                 0
         END AS BIT)             AS X
   --,*
FROM Staging.Enertia_Dim_Pad_Header      AS src
    FULL JOIN Enertia.Dim_Pad_Header AS dst ON dst.Pad_ID LIKE ISNULL(src.Pad_ID, dst.Pad_ID)
WHERE
    (
        src.UID_Left IS NOT NULL
        AND dst.Enertia_Dim_Pad_Header_UID IS NOT NULL
    )
    AND src.Processing_State = 1
--ORDER BY
--    src.Dim_Aries_Pad_Header_UID
--   ,dst.Dim_Aries_Pad_Header_UID
', 'BIT', 0, 0, 0, 0, 0, 1, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2118, 1, 12, 2, N'Match Unit Name', NULL, N'SELECT
    src.UID_Left AS UID_Left
   ,dst.Enertia_Dim_Unit_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Unit_Name_Antero_Standard IS NULL
                  OR dst.Unit_Name_Antero_Standard IS NULL THEN
                 0
             WHEN src.Unit_Name_Antero_Standard = dst.Unit_Name_Antero_Standard THEN
                 1
             ELSE
                 0
         END AS BIT)             AS X
   --,*
FROM Staging.Enertia_Dim_Unit_Header      AS src
    FULL JOIN Enertia.Dim_Unit_Header AS dst ON dst.Unit_Name_Antero_Standard LIKE ISNULL(src.Unit_Name_Antero_Standard, N''%'')
WHERE
    (
        src.UID_Left IS NOT NULL
        AND dst.Enertia_Dim_Unit_Header_UID IS NOT NULL
    )
    AND src.Processing_State = 1
--ORDER BY
--    src.Dim_Aries_Pad_Header_UID
--   ,dst.Dim_Aries_Pad_Header_UID
', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2119, 1, 12, 3, N'Match Unit Code', NULL, N'SELECT
    src.UID_Left AS UID_Left
   ,dst.Enertia_Dim_Unit_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Unit_Code IS NULL
                  OR dst.Unit_Code IS NULL THEN
                 0
             WHEN src.Unit_Code = dst.Unit_Code THEN
                 1
             ELSE
                 0
         END AS BIT)             AS X
   --,*
FROM Staging.Enertia_Dim_Unit_Header      AS src
    FULL JOIN Enertia.Dim_Unit_Header AS dst ON dst.Unit_Code LIKE ISNULL(src.Unit_Code, N''%'')
WHERE
    (
        src.UID_Left IS NOT NULL
        AND dst.Enertia_Dim_Unit_Header_UID IS NOT NULL
    )
    AND src.Processing_State = 1
--ORDER BY
--    src.Dim_Aries_Pad_Header_UID
--   ,dst.Dim_Aries_Pad_Header_UID

', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2120, 1, 12, 1, N'Match Unit ID', NULL, N'SELECT
    src.UID_Left AS UID_Left
   ,dst.Enertia_Dim_Unit_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Unit_ID IS NULL
                  OR dst.Unit_ID IS NULL THEN
                 0
             WHEN src.Unit_ID = dst.Unit_ID THEN
                 1
             ELSE
                 0
         END AS BIT)             AS X
   --,*
FROM Staging.Enertia_Dim_Unit_Header      AS src
    FULL JOIN Enertia.Dim_Unit_Header AS dst ON dst.Unit_ID LIKE ISNULL(src.Unit_ID, dst.Unit_ID)
WHERE
    (
        src.UID_Left IS NOT NULL
        AND dst.Enertia_Dim_Unit_Header_UID IS NOT NULL
    )
    AND src.Processing_State = 1
--ORDER BY
--    src.Dim_Aries_Pad_Header_UID
--   ,dst.Dim_Aries_Pad_Header_UID
', 'BIT', 0, 0, 0, 0, 0, 1, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2121, 1, 13, 3, N'Match API Number', N'Dimension Enertia', N'SELECT
    src.UID_Left AS UID_Left
   ,dst.Enertia_Dim_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.API_Number IS NULL
                  OR dst.API_Number IS NULL THEN
                 0
             WHEN src.API_Number = dst.API_Number THEN
                 1
             ELSE
                 0
         END AS BIT)             AS X
   
FROM Staging.Enertia_Dim_Well_Header      AS src
    FULL JOIN Enertia.Dim_Well_Header AS dst ON dst.API_Number = src.API_Number
WHERE
    (
        src.UID_Left IS NOT NULL
        AND dst.Enertia_Dim_Well_Header_UID IS NOT NULL
    )
    AND src.Processing_State = 1', 'BIT', 0.6, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2122, 1, 13, 1, N'Match SEQNUM', N'Dimension Enertia', N'SELECT src.UID_Left AS UID_Left,
       dst.Enertia_Dim_Well_Header_UID AS UID_Right,
       CAST(CASE
                WHEN src.SEQNUM IS NULL
                     OR dst.SEQNUM IS NULL THEN
                    0
                WHEN src.SEQNUM = dst.SEQNUM THEN
                    1
                ELSE
                    0
            END AS BIT) AS X  FROM Staging.Enertia_Dim_Well_Header      AS src      FULL JOIN Enertia.Dim_Well_Header AS dst ON dst.SEQNUM = src.SEQNUM  WHERE      (          src.UID_Left IS NOT NULL          AND dst.Enertia_Dim_Well_Header_UID IS NOT NULL      )      AND src.Processing_State = 1', 'BIT', 0.75, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2123, 1, 13, 3, N'Match Cost Center', N'Dimension Enertia', N'SELECT
    src.UID_Left AS UID_Left
   ,dst.Enertia_Dim_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Cost_Center IS NULL
                  OR dst.Cost_Center IS NULL THEN
                 0
             WHEN src.Cost_Center = dst.Cost_Center THEN
                 1
             ELSE
                 0
         END AS BIT)             AS X
   
FROM Staging.Enertia_Dim_Well_Header      AS src
    FULL JOIN Enertia.Dim_Well_Header AS dst ON dst.Cost_Center = src.Cost_Center
WHERE
    (
        src.UID_Left IS NOT NULL
        AND dst.Enertia_Dim_Well_Header_UID IS NOT NULL
    )
    AND src.Processing_State = 1', 'BIT', 0.55, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2124, 1, 13, 2, N'Match Well Name', N'Dimension Enertia', N'SELECT
    src.UID_Left AS UID_Left
   ,dst.Enertia_Dim_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Well_Name_Antero_Standard IS NULL
                  OR dst.Well_Name_Antero_Standard IS NULL THEN
                 0
             WHEN src.Well_Name_Antero_Standard = dst.Well_Name_Antero_Standard THEN
                 1
             ELSE
                 0
         END AS BIT)             AS X
   
FROM Staging.Enertia_Dim_Well_Header      AS src
    FULL JOIN Enertia.Dim_Well_Header AS dst ON dst.Well_Name_Antero_Standard LIKE ISNULL(src.Well_Name_Antero_Standard,  N''%'')
WHERE
    (
        src.UID_Left IS NOT NULL
        AND dst.Enertia_Dim_Well_Header_UID IS NOT NULL
    )
    AND src.Processing_State = 1', 'BIT', 0.65, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2125, 1, 16, 1, N'Match Pad ID', NULL, N'SELECT
    src.UID_Left AS UID_Left
   ,dst.Enertia_Fact_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Pad_ID IS NULL
                  OR dst.Pad_ID IS NULL THEN
                 0
             WHEN src.Pad_ID = dst.Pad_ID THEN
                 1
             ELSE
                 0
         END AS BIT)             AS X
   --,*
FROM Staging.Enertia_Fact_Well_Header      AS src
    FULL JOIN Enertia.Fact_Well_Header AS dst ON dst.Pad_ID = src.Pad_ID
WHERE
    (
        src.UID_Left IS NOT NULL
        AND dst.Enertia_Fact_Well_Header_UID IS NOT NULL
    )
    AND src.Processing_State = 1', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2126, 1, 48, 1, N'Match County', NULL, N'SELECT
    src.UID_Left AS UID_Left
   ,dst.Petra_Dim_Unit_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.County IS NULL
                  OR dst.County IS NULL THEN
                 0
             WHEN src.County = dst.County THEN
                 1
             ELSE
                 0
         END AS BIT)             AS X
   --,*
FROM Staging.Petra_Dim_Unit_Header      AS src
    FULL JOIN Petra.Dim_Unit_Header AS dst ON dst.County LIKE ISNULL(src.County,  N''%'')
WHERE
    (
        src.UID_Left IS NOT NULL
        AND dst.Petra_Dim_Unit_Header_UID IS NOT NULL
    )
    AND src.Processing_State = 1', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2127, 1, 48, 1, N'Match State', NULL, N'SELECT
    src.UID_Left AS UID_Left
   ,dst.Petra_Dim_Unit_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.State_Name IS NULL
                  OR dst.State_Name IS NULL THEN
                 0
             WHEN src.State_Name = dst.State_Name THEN
                 1
             ELSE
                 0
         END AS BIT)             AS X
   --,*
FROM Staging.Petra_Dim_Unit_Header      AS src
    FULL JOIN Petra.Dim_Unit_Header AS dst ON dst.State_Name LIKE ISNULL(src.State_Name, N''%'')
WHERE
    (
        src.UID_Left IS NOT NULL
        AND dst.Petra_Dim_Unit_Header_UID IS NOT NULL
    )
    AND src.Processing_State = 1', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2128, 1, 48, 2, N'Match Unit Name', NULL, N'SELECT
    src.UID_Left AS UID_Left
   ,dst.Petra_Dim_Unit_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Unit_Name_Antero_Standard IS NULL
                  OR dst.Unit_Name_Antero_Standard IS NULL THEN
                 0
             WHEN src.Unit_Name_Antero_Standard = dst.Unit_Name_Antero_Standard THEN
                 1
             ELSE
                 0
         END AS BIT)             AS X
   --,*
FROM Staging.Petra_Dim_Unit_Header      AS src
    FULL JOIN Petra.Dim_Unit_Header AS dst ON dst.Unit_Name_Antero_Standard LIKE ISNULL(src.Unit_Name_Antero_Standard, N''%'')
WHERE
    (
        src.UID_Left IS NOT NULL
        AND dst.Petra_Dim_Unit_Header_UID IS NOT NULL
    )
    AND src.Processing_State = 1', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2129, 1, 49, 1, N'Match SEQNUM', N'Dimension Petra', N'SELECT src.UID_Left AS UID_Left,
       dst.Petra_Dim_Well_Header_UID AS UID_Right,
       CAST(CASE
                WHEN src.SEQNUM IS NULL
                     OR dst.SEQNUM IS NULL THEN
                    0
                WHEN src.SEQNUM = dst.SEQNUM THEN
                    1
                ELSE
                    0
            END AS BIT) AS X  FROM Staging.Petra_Dim_Well_Header  AS src      FULL JOIN Petra.Dim_Well_Header AS dst ON dst.SEQNUM = src.SEQNUM  WHERE      (          src.UID_Left IS NOT NULL          AND dst.Petra_Dim_Well_Header_UID IS NOT NULL      )      AND src.Processing_State = 1', 'BIT', 0.75, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2130, 1, 49, 4, N'Match Well Name', N'Dimension Petra', N'SELECT
    src.UID_Left AS UID_Left
   ,dst.Petra_Dim_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Well_Name_Antero_Standard IS NULL
                  OR dst.Well_Name_Antero_Standard IS NULL THEN
                 0
             WHEN src.Well_Name_Antero_Standard = dst.Well_Name_Antero_Standard THEN
                 1
             ELSE
                 0
         END AS BIT)             AS X
   
FROM Staging.Petra_Dim_Well_Header      AS src
    FULL JOIN Petra.Dim_Well_Header AS dst ON dst.Well_Name_Antero_Standard LIKE ISNULL(src.Well_Name_Antero_Standard, N''%'')
WHERE
    (
        src.UID_Left IS NOT NULL
        AND dst.Petra_Dim_Well_Header_UID IS NOT NULL
    )
    AND src.Processing_State = 1', 'BIT', 0.65, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2131, 1, 49, 2, N'Match API Number', N'Dimension Petra', N'SELECT
    src.UID_Left AS UID_Left
   ,dst.Petra_Dim_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.API_Number IS NULL
                  OR dst.API_Number IS NULL THEN
                 0
             WHEN src.API_Number = dst.API_Number THEN
                 1
             ELSE
                 0
         END AS BIT)             AS X
   
FROM Staging.Petra_Dim_Well_Header      AS src
    FULL JOIN Petra.Dim_Well_Header AS dst ON dst.API_Number = src.API_Number
WHERE
    (
        src.UID_Left IS NOT NULL
        AND dst.Petra_Dim_Well_Header_UID IS NOT NULL
    )
    AND src.Processing_State = 1', 'BIT', 0.6, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2132, 1, 50, 1, N'Match API_Number ', N'Fact Petra', N'SELECT
    src.UID_Left AS UID_Left
   ,dst.Petra_Fact_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.API_Number IS NULL
                  OR dst.API_Number IS NULL THEN
                 0
             WHEN src.API_Number = dst.API_Number THEN
                 1
             ELSE
                 0
         END AS BIT)             AS X
   
FROM Staging.Petra_Fact_Well_Header      AS src
    FULL JOIN Petra.Fact_Well_Header AS dst ON dst.API_Number = src.API_Number
WHERE
    (
        src.UID_Left IS NOT NULL
        AND dst.Petra_Fact_Well_Header_UID IS NOT NULL
    )
    AND src.Processing_State = 1', 'BIT', 0.6, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2133, 1, 50, 1, N'Match SEQNUM', N'Fact Petra', N'SELECT src.UID_Left AS UID_Left,
       dst.Petra_Fact_Well_Header_UID AS UID_Right,
       CAST(CASE
                WHEN src.SEQNUM IS NULL
                     OR dst.SEQNUM IS NULL THEN
                    0
                WHEN src.SEQNUM = dst.SEQNUM THEN
                    1
                ELSE
                    0
            END AS BIT) AS X  FROM Staging.Petra_Fact_Well_Header      AS src      FULL JOIN Petra.Fact_Well_Header AS dst ON dst.SEQNUM = src.SEQNUM  WHERE      (          src.UID_Left IS NOT NULL          AND dst.Petra_Fact_Well_Header_UID IS NOT NULL      )      AND src.Processing_State = 1', 'BIT', 0.75, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2134, 1, 45, 1, N'Match Longitude NAD27', NULL, N'SELECT
    src.UID_Left AS UID_Left
   ,dst.Petra_Dim_Pad_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Longitude_NAD27 IS NULL
                  OR dst.Longitude_NAD27 IS NULL THEN
                 0
             WHEN src.Longitude_NAD27 = dst.Longitude_NAD27 THEN
                 1
             ELSE
                 0
         END AS BIT)             AS X
   --,*
FROM Staging.Petra_Dim_Pad_Header      AS src
    FULL JOIN Petra.Dim_Pad_Header AS dst ON dst.Longitude_NAD27 = ISNULL(src.Longitude_NAD27,  dst.Longitude_NAD27)
WHERE
    (
        src.UID_Left IS NOT NULL
        AND dst.Petra_Dim_Pad_Header_UID IS NOT NULL
    )
    AND src.Processing_State = 1', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2135, 1, 45, 1, N'Match Latitude NAD27', NULL, N'SELECT
    src.UID_Left AS UID_Left
   ,dst.Petra_Dim_Pad_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Latitude_NAD27 IS NULL
                  OR dst.Latitude_NAD27 IS NULL THEN
                 0
             WHEN src.Latitude_NAD27 = dst.Latitude_NAD27 THEN
                 1
             ELSE
                 0
         END AS BIT)             AS X
   --,*
FROM Staging.Petra_Dim_Pad_Header      AS src
    FULL JOIN Petra.Dim_Pad_Header AS dst ON dst.Latitude_NAD27 = ISNULL(src.Latitude_NAD27, dst.Longitude_NAD27)
WHERE
    (
        src.UID_Left IS NOT NULL
        AND dst.Petra_Dim_Pad_Header_UID IS NOT NULL
    )
    AND src.Processing_State = 1', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2136, 1, 16, 1, N'Match Well ID', NULL, N'SELECT
    src.UID_Left AS UID_Left
   ,dst.Enertia_Fact_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Well_ID IS NULL
                  OR dst.Well_ID IS NULL THEN
                 0
             WHEN src.Well_ID = dst.Well_ID THEN
                 1
             ELSE
                 0
         END AS BIT)                 AS X
--,*
FROM Staging.Enertia_Fact_Well_Header  AS src
    FULL JOIN Enertia.Fact_Well_Header AS dst ON dst.Well_ID = src.Well_ID
WHERE
  src.Processing_State = 1', 'BIT', 0, 0, 0, 0, 0, 1, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2137, 1, 13, 1, N'Match Well ID', NULL, N'SELECT
    src.UID_Left AS UID_Left
   ,dst.Enertia_Dim_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Well_ID IS NULL
                  OR dst.Well_ID IS NULL THEN
                 0
             WHEN src.Well_ID = dst.Well_ID THEN
                 1
             ELSE
                 0
         END AS BIT)             AS X
   --,*
FROM Staging.Enertia_Dim_Well_Header      AS src
    FULL JOIN Enertia.Dim_Well_Header AS dst ON dst.Well_ID = src.Well_ID
WHERE
    (
        src.UID_Left IS NOT NULL
        AND dst.Enertia_Dim_Well_Header_UID IS NOT NULL
    )
    AND src.Processing_State = 1', 'BIT', 0, 0, 0, 0, 0, 1, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2138, 1, 50, 1, N'Match WSN', NULL, N'SELECT
    src.UID_Left AS UID_Left
   ,dst.Petra_Fact_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.WSN IS NULL
                  OR dst.WSN IS NULL THEN
                 0
             WHEN src.WSN = dst.WSN THEN
                 1
             ELSE
                 0
         END AS BIT)             AS X
   --,*
FROM Staging.Petra_Fact_Well_Header      AS src
    FULL JOIN Petra.Fact_Well_Header AS dst ON dst.WSN = src.WSN
WHERE
    (
        src.UID_Left IS NOT NULL
        AND dst.Petra_Fact_Well_Header_UID IS NOT NULL
    )
    AND src.Processing_State = 1
	', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2139, 1, 49, 2, N'Match WSN', NULL, N'SELECT
    src.UID_Left AS UID_Left
   ,dst.Petra_Dim_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.WSN_Number IS NULL
                  OR dst.WSN_Number IS NULL THEN
                 0
             WHEN src.WSN_Number = dst.WSN_Number THEN
                 1
             ELSE
                 0
         END AS BIT)             AS X
   --,*
FROM Staging.Petra_Dim_Well_Header      AS src
    FULL JOIN Petra.Dim_Well_Header AS dst ON dst.WSN_Number = src.WSN_Number
WHERE
    (
        src.UID_Left IS NOT NULL
        AND dst.Petra_Dim_Well_Header_UID IS NOT NULL
    )
    AND src.Processing_State = 1', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2140, 1, 66, 1, N'Match WellView_ID', NULL, N'SELECT
    src.UID_Left AS UID_Left
   ,dst.WellView_Dim_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.WellView_ID IS NULL
                  OR dst.WellView_ID IS NULL THEN
                 0
             WHEN src.WellView_ID = dst.WellView_ID THEN
                 1
             ELSE
                 0
         END AS BIT)             AS X
   --,*
FROM Staging.WellView_Dim_Well_Header      AS src
    FULL JOIN WellView.Dim_Well_Header AS dst ON dst.WellView_ID = ISNULL(src.WellView_ID, dst.WellView_ID)
WHERE
    (
        src.UID_Left IS NOT NULL
        AND dst.WellView_Dim_Well_Header_UID IS NOT NULL
    )
    AND src.Processing_State = 1', 'BIT', 0, 0, 0, 0, 0, 1, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2141, 1, 66, 1, N'Match API Number', N'Dimension Wellview', N'SELECT src.UID_Left AS UID_Left,         dst.WellView_Dim_Well_Header_UID AS UID_Right,         CAST(CASE                  WHEN src.API_Number IS NULL                        OR dst.API_Number IS NULL THEN                      0                  WHEN src.API_Number = dst.API_Number THEN                        1                  ELSE                      0              END AS BIT) AS X           FROM Staging.WellView_Dim_Well_Header AS src      FULL JOIN WellView.Dim_Well_Header AS dst          ON dst.API_Number = ISNULL(src.API_Number, dst.API_Number)      WHERE (            src.UID_Left IS NOT NULL            AND dst.WellView_Dim_Well_Header_UID IS NOT NULL        )        AND src.Processing_State = 1', 'BIT', 0.6, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2142, 1, 66, 1, N'Match Cost Center', N'Dimension Wellview', N'SELECT src.UID_Left AS UID_Left,         dst.WellView_Dim_Well_Header_UID AS UID_Right,         CAST(CASE                  WHEN src.Cost_Center IS NULL                       OR dst.Cost_Center IS NULL THEN                     0                  WHEN src.Cost_Center = dst.Cost_Center THEN                      1                  ELSE                      0              END AS BIT) AS X           FROM Staging.WellView_Dim_Well_Header AS src      FULL JOIN WellView.Dim_Well_Header AS dst          ON dst.Cost_Center = ISNULL(src.Cost_Center, dst.Cost_Center)   WHERE (            src.UID_Left IS NOT NULL            AND dst.WellView_Dim_Well_Header_UID IS NOT NULL        )        AND src.Processing_State = 1', 'BIT', 0.55, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2143, 1, 66, 1, N'Match Well Name', N'Dimension Wellview', N'SELECT src.UID_Left AS UID_Left,         dst.WellView_Dim_Well_Header_UID AS UID_Right,         CAST(CASE                  WHEN src.Well_Name_Antero_Standard IS NULL                         OR dst.Well_Name_Antero_Standard IS NULL THEN                       0                  WHEN src.Well_Name_Antero_Standard = dst.Well_Name_Antero_Standard THEN                          1                  ELSE                       0             END AS BIT) AS X           FROM Staging.WellView_Dim_Well_Header AS src      FULL JOIN WellView.Dim_Well_Header AS dst          ON dst.Well_Name_Antero_Standard   = ISNULL(src.Well_Name_Antero_Standard,src.Well_Name_Antero_Standard)        WHERE (            src.UID_Left IS NOT NULL            AND dst.WellView_Dim_Well_Header_UID IS NOT NULL        )        AND src.Processing_State = 1', 'BIT', 0.65, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2144, 1, 67, 1, N'Match WellView_ID', NULL, N'SELECT src.UID_Left AS UID_Left,
       dst.WellView_Fact_Well_Header_UID AS UID_Right,
       CAST(CASE
                WHEN src.WellView_ID IS NULL
                     OR dst.WellView_ID IS NULL THEN
                    0
                WHEN src.WellView_ID = dst.WellView_ID THEN
                    1
                ELSE
                    0
            END AS BIT) AS X
--,*  
FROM Staging.WellView_Fact_Well_Header AS src
    FULL JOIN WellView.Fact_Well_Header AS dst
        ON dst.WellView_ID = ISNULL(src.WellView_ID, dst.WellView_ID)
WHERE (
          src.UID_Left IS NOT NULL
          AND dst.WellView_Fact_Well_Header_UID IS NOT NULL
      )
      AND src.Processing_State = 1;', 'BIT', 0, 0, 0, 0, 0, 1, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2145, 1, 67, 1, N'Match Cost Center', N'Fact Wellview', N'SELECT src.UID_Left AS UID_Left,         dst.WellView_Fact_Well_Header_UID AS UID_Right,         CAST(CASE                  WHEN src.Cost_Center IS NULL                       OR dst.Cost_Center IS NULL THEN                      0                  WHEN src.Cost_Center = dst.Cost_Center THEN                      1                  ELSE                      0              END AS BIT) AS X           FROM Staging.WellView_Fact_Well_Header AS src      FULL JOIN WellView.Fact_Well_Header AS dst          ON dst.Cost_Center = ISNULL(src.Cost_Center, dst.Cost_Center)  WHERE (            src.UID_Left IS NOT NULL            AND dst.WellView_Fact_Well_Header_UID IS NOT NULL        )        AND src.Processing_State = 1', 'BIT', 0.55, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2146, 1, 67, 1, N'Match API_Number', N'Fact Wellview', N'SELECT src.UID_Left AS UID_Left,         dst.WellView_Fact_Well_Header_UID AS UID_Right,         CAST(CASE                  WHEN src.API_Number IS NULL                       OR dst.API_Number IS NULL THEN                      0                  WHEN src.API_Number = dst.API_Number THEN                      1                  ELSE                      0              END AS BIT) AS X     FROM Staging.WellView_Fact_Well_Header AS src      FULL JOIN WellView.Fact_Well_Header AS dst          ON dst.API_Number = ISNULL(src.API_Number, dst.API_Number)  WHERE (            src.UID_Left IS NOT NULL            AND dst.WellView_Fact_Well_Header_UID IS NOT NULL        )        AND src.Processing_State = 1;  ', 'BIT', 0.6, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2147, 1, 59, 1, N'Match Unit ID', NULL, N'SELECT
    src.UID_Left AS UID_Left
   ,dst.SigmaFlow_Dim_Unit_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Unit_ID IS NULL
                  OR dst.Unit_ID IS NULL THEN
                 0
             WHEN src.Unit_ID = dst.Unit_ID THEN
                 1
             ELSE
                 0
         END AS BIT)             AS X
   --,*
FROM Staging.SigmaFlow_Dim_Unit_Header      AS src
    FULL JOIN SigmaFlow.Dim_Unit_Header AS dst ON dst.Unit_ID = ISNULL(src.Unit_ID, dst.Unit_ID)
WHERE
    (
        src.UID_Left IS NOT NULL
        AND dst.SigmaFlow_Dim_Unit_Header_UID IS NOT NULL
    )
    AND src.Processing_State = 1', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2148, 1, 59, 1, N'Match Unit Name', NULL, N'SELECT
    src.UID_Left AS UID_Left
   ,dst.SigmaFlow_Dim_Unit_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Unit_Name_Antero_Standard IS NULL
                  OR dst.Unit_Name_Antero_Standard IS NULL THEN
                 0
             WHEN src.Unit_Name_Antero_Standard = dst.Unit_Name_Antero_Standard THEN
                 1
             ELSE
                 0
         END AS BIT)             AS X
   --,*
FROM Staging.SigmaFlow_Dim_Unit_Header      AS src
    FULL JOIN SigmaFlow.Dim_Unit_Header AS dst ON dst.Unit_Name_Antero_Standard = ISNULL(src.Unit_Name_Antero_Standard, dst.Unit_Name_Antero_Standard)
WHERE
    (
        src.UID_Left IS NOT NULL
        AND dst.SigmaFlow_Dim_Unit_Header_UID IS NOT NULL
    )
    AND src.Processing_State = 1', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2149, 1, 60, 1, N'Match SigmaFlow_ID', NULL, N'SELECT
    src.UID_Left AS UID_Left
   ,dst.SigmaFlow_Dim_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.SigmaFlow_ID IS NULL
                  OR dst.SigmaFlow_ID IS NULL THEN
                 0
             WHEN src.SigmaFlow_ID = dst.SigmaFlow_ID THEN
                 1
             ELSE
                 0
         END AS BIT)             AS X
   --,*
FROM Staging.SigmaFlow_Dim_Well_Header      AS src
    FULL JOIN SigmaFlow.Dim_Well_Header AS dst ON dst.SigmaFlow_ID = src.SigmaFlow_ID
WHERE
   src.Processing_State = 1', 'BIT', 0, 0.001, 0, 0, 0, 1, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2150, 1, 60, 1, N'Match SEQNUM', N'Dimension SigmaFlow', N'SELECT src.UID_Left AS UID_Left,
       dst.SigmaFlow_Dim_Well_Header_UID AS UID_Right,
       CAST(CASE
                WHEN src.SEQNUM IS NULL
                     OR dst.SEQNUM IS NULL THEN
                    0
                WHEN src.SEQNUM = dst.SEQNUM THEN
                    1
                ELSE
                    0
            END AS BIT) AS X FROM Staging.SigmaFlow_Dim_Well_Header      AS src      FULL JOIN SigmaFlow.Dim_Well_Header AS dst ON dst.SEQNUM = ISNULL(src.SEQNUM, dst.SEQNUM)  WHERE      (          src.UID_Left IS NOT NULL          AND dst.SigmaFlow_Dim_Well_Header_UID IS NOT NULL      )      AND src.Processing_State = 1', 'BIT', 0.75, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2151, 1, 60, 1, N'Match Well Name', N'Dimension SigmaFlow', N'SELECT
    src.UID_Left AS UID_Left
   ,dst.SigmaFlow_Dim_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Well_Name_Antero_Standard IS NULL
                  OR dst.Well_Name_Antero_Standard IS NULL THEN
                 0
             WHEN src.Well_Name_Antero_Standard = dst.Well_Name_Antero_Standard THEN
                 1
             ELSE
                 0
         END AS BIT)             AS X
   
FROM Staging.SigmaFlow_Dim_Well_Header      AS src
    FULL JOIN SigmaFlow.Dim_Well_Header AS dst ON dst.Well_Name_Antero_Standard = ISNULL(src.Well_Name_Antero_Standard, dst.Well_Name_Antero_Standard)
WHERE
    (
        src.UID_Left IS NOT NULL
        AND dst.SigmaFlow_Dim_Well_Header_UID IS NOT NULL
    )
    AND src.Processing_State = 1', 'BIT', 0.65, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2152, 1, 61, 1, N'Match SigmaFlow_ID', NULL, N'SELECT
    src.UID_Left AS UID_Left
   ,dst.SigmaFlow_Fact_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.SigmaFlow_ID IS NULL
                  OR dst.SigmaFlow_ID IS NULL THEN
                 0
             WHEN src.SigmaFlow_ID = dst.SigmaFlow_ID THEN
                 1
             ELSE
                 0
         END AS BIT)             AS X
   --,*
FROM Staging.SigmaFlow_Fact_Well_Header      AS src
    FULL JOIN SigmaFlow.Fact_Well_Header AS dst ON dst.SigmaFlow_ID = src.SigmaFlow_ID
WHERE
    src.Processing_State = 1
	
', 'BIT', 0, 0, 0, 0, 0, 1, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2153, 1, 61, 1, N'Match SEQNUM', N'Fact SigmaFlow', N'SELECT src.UID_Left AS UID_Left,
       dst.SigmaFlow_Fact_Well_Header_UID AS UID_Right,
       CAST(CASE
                WHEN src.SEQNUM IS NULL
                     OR dst.SEQNUM IS NULL THEN
                    0
                WHEN src.SEQNUM = dst.SEQNUM THEN
                    1
                ELSE
                    0
            END AS BIT) AS X FROM Staging.SigmaFlow_Fact_Well_Header      AS src      FULL JOIN SigmaFlow.Fact_Well_Header AS dst ON dst.SEQNUM = ISNULL(src.SEQNUM, dst.SEQNUM)  WHERE      (          src.UID_Left IS NOT NULL          AND dst.SigmaFlow_Fact_Well_Header_UID IS NOT NULL      )      AND src.Processing_State = 1', 'BIT', 0.75, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2154, 1, 20, 1, N'Match First Production Date', NULL, N'SELECT
       src.UID_Left AS UID_Left
      ,dst.FracSchedule_Dim_Well_Header_UID AS UID_Right
      ,CAST(CASE
                WHEN src.First_Production_Date IS NULL THEN
                    0
                WHEN dst.First_Production_Date = src.First_Production_Date THEN
                    1
                ELSE
                    0
            END AS BIT)    AS X
FROM Staging.FracSchedule_Dim_Well_Header        AS src
    FULL JOIN FracSchedule.Dim_Well_Header AS dst ON 
		dst.First_Production_Date = src.First_Production_Date
		-- dst.First_Production_Date LIKE ISNULL(src.First_Production_Date , ''%'')
WHERE
    src.Processing_State = 1
    AND
    (
        src.UID_Left IS NOT NULL
        AND dst.FracSchedule_Dim_Well_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2155, 1, 20, 1, N'Match Frac End Date', NULL, N'SELECT
       src.UID_Left AS UID_Left
      ,dst.FracSchedule_Dim_Well_Header_UID AS UID_Right
      ,CAST(CASE
                WHEN src.Frac_End_Date IS NULL THEN
                    0
                WHEN dst.Frac_End_Date = src.Frac_End_Date THEN
                    1
                ELSE
                    0
            END AS BIT)    AS X
FROM Staging.FracSchedule_Dim_Well_Header        AS src
    FULL JOIN FracSchedule.Dim_Well_Header AS dst ON 
		dst.Frac_End_Date = src.Frac_End_Date
		-- dst.Frac_End_Date LIKE ISNULL(src.Frac_End_Date , ''%'')
WHERE
    src.Processing_State = 1
    AND
    (
        src.UID_Left IS NOT NULL
        AND dst.FracSchedule_Dim_Well_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2156, 1, 20, 1, N'Match Frac Start Date', NULL, N'SELECT
       src.UID_Left AS UID_Left
      ,dst.FracSchedule_Dim_Well_Header_UID AS UID_Right
      ,CAST(CASE
                WHEN src.Frac_Start_Date_Planned IS NULL THEN
                    0
                WHEN dst.Frac_Start_Date_Planned = src.Frac_Start_Date_Planned THEN
                    1
                ELSE
                    0
            END AS BIT)    AS X
FROM Staging.FracSchedule_Dim_Well_Header        AS src
    FULL JOIN FracSchedule.Dim_Well_Header AS dst ON 
		dst.Frac_Start_Date_Planned = src.Frac_Start_Date_Planned
		-- dst.Frac_Start_Date_Planned LIKE ISNULL(src.Frac_Start_Date_Planned , ''%'')
WHERE
    src.Processing_State = 1
    AND
    (
        src.UID_Left IS NOT NULL
        AND dst.FracSchedule_Dim_Well_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2157, 1, 20, 3, N'Match FracSchedule ID', NULL, N'SELECT
       src.UID_Left AS UID_Left
      ,dst.FracSchedule_Dim_Well_Header_UID AS UID_Right
      ,CAST(CASE
                WHEN src.FracSchedule_ID IS NULL THEN
                    0
                WHEN dst.FracSchedule_ID = src.FracSchedule_ID THEN
                    1
                ELSE
                    0
            END AS BIT)    AS X
FROM Staging.FracSchedule_Dim_Well_Header        AS src
    FULL JOIN FracSchedule.Dim_Well_Header AS dst ON 
		dst.FracSchedule_ID = src.FracSchedule_ID
		-- dst.FracSchedule_ID LIKE ISNULL(src.FracSchedule_ID , ''%'')
WHERE
    src.Processing_State = 1
    AND
    (
        src.UID_Left IS NOT NULL
        AND dst.FracSchedule_Dim_Well_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 1, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2158, 1, 20, 1, N'Match SEQNUM', N'Dimension FracSchedule', N'SELECT src.UID_Left AS UID_Left,
       dst.FracSchedule_Dim_Well_Header_UID AS UID_Right,
       CAST(CASE
                WHEN src.SEQNUM IS NULL THEN
                    0
                WHEN dst.SEQNUM = src.SEQNUM THEN
                    1
                ELSE
                    0
            END AS BIT) AS X
FROM Staging.FracSchedule_Dim_Well_Header AS src
    FULL JOIN FracSchedule.Dim_Well_Header AS dst
        ON dst.SEQNUM = src.SEQNUM WHERE      src.Processing_State = 1      AND      (          src.UID_Left IS NOT NULL          AND dst.FracSchedule_Dim_Well_Header_UID IS NOT NULL      )', 'BIT', 0.75, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2159, 1, 20, 1, N'Match Well Name', N'Dimension FracSchedule', N'SELECT
       src.UID_Left AS UID_Left
      ,dst.FracSchedule_Dim_Well_Header_UID AS UID_Right
      ,CAST(CASE
                WHEN src.Well_Name_Antero_Standard IS NULL THEN
                    0
                WHEN dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard THEN
                    1
                ELSE
                    0
            END AS BIT)    AS X
FROM Staging.FracSchedule_Dim_Well_Header        AS src
    FULL JOIN FracSchedule.Dim_Well_Header AS dst ON 
		dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard
		-- dst.Well_Name_Antero_Standard LIKE ISNULL(src.Well_Name_Antero_Standard , ''%'')
WHERE
    src.Processing_State = 1
    AND
    (
        src.UID_Left IS NOT NULL
        AND dst.FracSchedule_Dim_Well_Header_UID IS NOT NULL
    )', 'BIT', 0.65, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2160, 1, 21, 1, N'Match First Production Date', NULL, N'SELECT
       src.UID_Left AS UID_Left
      ,dst.Fact_FracSchedule_Well_Header_UID AS UID_Right
      ,CAST(CASE
                WHEN src.First_Production_Date_Gas_Planned IS NULL THEN
                    0
                WHEN dst.First_Production_Date_Gas_Planned = src.First_Production_Date_Gas_Planned THEN
                    1
                ELSE
                    0
            END AS BIT)    AS X
FROM Staging.FracSchedule_Fact_Well_Header        AS src
    FULL JOIN FracSchedule.Fact_Well_Header AS dst ON 
		dst.First_Production_Date_Gas_Planned = src.First_Production_Date_Gas_Planned
		-- dst.First_Production_Date_Gas_Planned LIKE ISNULL(src.First_Production_Date_Gas_Planned , ''%'')
WHERE
    src.Processing_State = 1
    AND
    (
        src.UID_Left IS NOT NULL
        AND dst.Fact_FracSchedule_Well_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2161, 1, 21, 1, N'Match Frac End Date', NULL, N'SELECT
       src.UID_Left AS UID_Left
      ,dst.Fact_FracSchedule_Well_Header_UID AS UID_Right
      ,CAST(CASE
                WHEN src.Frac_End_Date_Planned IS NULL THEN
                    0
                WHEN dst.Frac_End_Date_Planned = src.Frac_End_Date_Planned THEN
                    1
                ELSE
                    0
            END AS BIT)    AS X
FROM Staging.FracSchedule_Fact_Well_Header        AS src
    FULL JOIN FracSchedule.Fact_Well_Header AS dst ON 
		dst.Frac_End_Date_Planned = src.Frac_End_Date_Planned
		-- dst.Frac_End_Date_Planned LIKE ISNULL(src.Frac_End_Date_Planned , ''%'')
WHERE
    src.Processing_State = 1
    AND
    (
        src.UID_Left IS NOT NULL
        AND dst.Fact_FracSchedule_Well_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2162, 1, 21, 1, N'Match Frac Start Date', NULL, N'SELECT
       src.UID_Left AS UID_Left
      ,dst.Fact_FracSchedule_Well_Header_UID AS UID_Right
      ,CAST(CASE
                WHEN src.Frac_Start_Date_Planned IS NULL THEN
                    0
                WHEN dst.Frac_Start_Date_Planned = src.Frac_Start_Date_Planned THEN
                    1
                ELSE
                    0
            END AS BIT)    AS X
FROM Staging.FracSchedule_Fact_Well_Header        AS src
    FULL JOIN FracSchedule.Fact_Well_Header AS dst ON 
		dst.Frac_Start_Date_Planned = src.Frac_Start_Date_Planned
		-- dst.Frac_Start_Date_Planned LIKE ISNULL(src.Frac_Start_Date_Planned , ''%'')
WHERE
    src.Processing_State = 1
    AND
    (
        src.UID_Left IS NOT NULL
        AND dst.Fact_FracSchedule_Well_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2163, 1, 22, 1, N'Match Production Date', NULL, N'SELECT
       src.UID_Left AS UID_Left
      ,dst.Merrick_Dim_Daily_Well_Production_UID AS UID_Right
      ,CAST(CASE
                WHEN src.Production_Date IS NULL THEN
                    0
                WHEN dst.Production_Date = src.Production_Date THEN
                    1
                ELSE
                    0
            END AS BIT)    AS X
FROM Staging.Merrick_Dim_Daily_Well_Production        AS src
    FULL JOIN Merrick.Dim_Daily_Well_Production AS dst ON 
		dst.Production_Date = src.Production_Date
		-- dst.Production_Date LIKE ISNULL(src.Production_Date , ''%'')
WHERE
    src.Processing_State = 1
    AND
    (
        src.UID_Left IS NOT NULL
        AND dst.Merrick_Dim_Daily_Well_Production_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2164, 1, 22, 2, N'Match Well Production ID', NULL, N'SELECT
       src.UID_Left AS UID_Left
      ,dst.Merrick_Dim_Daily_Well_Production_UID AS UID_Right
      ,CAST(CASE
                WHEN src.Well_Production_ID IS NULL THEN
                    0
                WHEN dst.Well_Production_ID = src.Well_Production_ID THEN
                    1
                ELSE
                    0
            END AS BIT)    AS X
FROM Staging.Merrick_Dim_Daily_Well_Production        AS src
    FULL JOIN Merrick.Dim_Daily_Well_Production AS dst ON 
		dst.Well_Production_ID = src.Well_Production_ID
		-- dst.Well_Production_ID LIKE ISNULL(src.Well_Production_ID , ''%'')
WHERE
    src.Processing_State = 1
    AND
    (
        src.UID_Left IS NOT NULL
        AND dst.Merrick_Dim_Daily_Well_Production_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2165, 1, 28, 1, N'Match API Number', N'Dimension Merrick', N'SELECT         src.UID_Left AS UID_Left        ,dst.Merrick_Dim_Well_Header_UID AS UID_Right        ,CAST(CASE                  WHEN src.API_Number IS NULL THEN                      0                  WHEN dst.API_Number = src.API_Number THEN                      1                  ELSE                      0              END AS BIT)    AS X  FROM Staging.Merrick_Dim_Well_Header        AS src      FULL JOIN Merrick.Dim_Well_Header AS dst ON     dst.API_Number = src.API_Number    WHERE      src.Processing_State = 1      AND      (          src.UID_Left IS NOT NULL          AND dst.Merrick_Dim_Well_Header_UID IS NOT NULL      )', 'BIT', 0.6, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2166, 1, 28, 1, N'Match Enertia ID', N'Dimension Merrick', N'SELECT         src.UID_Left AS UID_Left        ,dst.Merrick_Dim_Well_Header_UID AS UID_Right        ,CAST(CASE                  WHEN src.Enertia_ID IS NULL THEN                      0                  WHEN dst.Enertia_ID = src.Enertia_ID THEN                      1                  ELSE                      0              END AS BIT)    AS X  FROM Staging.Merrick_Dim_Well_Header        AS src      FULL JOIN Merrick.Dim_Well_Header AS dst ON     dst.Enertia_ID = src.Enertia_ID    WHERE      src.Processing_State = 1      AND      (          src.UID_Left IS NOT NULL          AND dst.Merrick_Dim_Well_Header_UID IS NOT NULL      )', 'BIT', 0.55, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2167, 1, 28, 1, N'Match Merrick ID', NULL, N'SELECT
       src.UID_Left AS UID_Left
      ,dst.Merrick_Dim_Well_Header_UID AS UID_Right
      ,CAST(CASE
                WHEN src.Merrick_ID IS NULL THEN
                    0
                WHEN dst.Merrick_ID = src.Merrick_ID THEN
                    1
                ELSE
                    0
            END AS BIT)    AS X
FROM Staging.Merrick_Dim_Well_Header        AS src
    FULL JOIN Merrick.Dim_Well_Header AS dst ON 
		dst.Merrick_ID = src.Merrick_ID
		-- dst.Merrick_ID LIKE ISNULL(src.Merrick_ID , ''%'')
WHERE
    src.Processing_State = 1
    AND
    (
        src.UID_Left IS NOT NULL
        AND dst.Merrick_Dim_Well_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 1, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2168, 1, 28, 2, N'Match Pad Name', NULL, N'SELECT
       src.UID_Left AS UID_Left
      ,dst.Merrick_Dim_Well_Header_UID AS UID_Right
      ,CAST(CASE
                WHEN src.Pad_Name_Antero_Standard IS NULL THEN
                    0
                WHEN dst.Pad_Name_Antero_Standard = src.Pad_Name_Antero_Standard THEN
                    1
                ELSE
                    0
            END AS BIT)    AS X
FROM Staging.Merrick_Dim_Well_Header        AS src
    FULL JOIN Merrick.Dim_Well_Header AS dst ON 
		dst.Pad_Name_Antero_Standard = src.Pad_Name_Antero_Standard
		-- dst.Pad_Name LIKE ISNULL(src.Pad_Name_Antero_Standard , ''%'')
WHERE
    src.Processing_State = 1
    AND
    (
        src.UID_Left IS NOT NULL
        AND dst.Merrick_Dim_Well_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2169, 1, 28, 1, N'Match PropNum', NULL, N'SELECT
       src.UID_Left AS UID_Left
      ,dst.Merrick_Dim_Well_Header_UID AS UID_Right
      ,CAST(CASE
                WHEN src.PropNum IS NULL THEN
                    0
                WHEN dst.PropNum = src.PropNum THEN
                    1
                ELSE
                    0
            END AS BIT)    AS X
FROM Staging.Merrick_Dim_Well_Header        AS src
    FULL JOIN Merrick.Dim_Well_Header AS dst ON 
		dst.PropNum = src.PropNum
		-- dst.PropNum LIKE ISNULL(src.PropNum , ''%'')
WHERE
    src.Processing_State = 1
    AND
    (
        src.UID_Left IS NOT NULL
        AND dst.Merrick_Dim_Well_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2170, 1, 28, 1, N'Match Well Name', N'Dimension Merrick', N'SELECT         src.UID_Left AS UID_Left        ,dst.Merrick_Dim_Well_Header_UID AS UID_Right        ,CAST(CASE                  WHEN src.Well_Name_Antero_Standard IS NULL THEN                      0                  WHEN dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard THEN                      1                  ELSE                      0              END AS BIT)    AS X  FROM Staging.Merrick_Dim_Well_Header        AS src      FULL JOIN Merrick.Dim_Well_Header AS dst ON     dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard      WHERE      src.Processing_State = 1      AND      (          src.UID_Left IS NOT NULL          AND dst.Merrick_Dim_Well_Header_UID IS NOT NULL      )', 'BIT', 0.65, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2171, 1, 29, 1, N'Match Production Date', NULL, N'SELECT
       src.UID_Left AS UID_Left
      ,dst.Merrick_Fact_Daily_Well_Production_UID AS UID_Right
      ,CAST(CASE
                WHEN src.Production_Date IS NULL THEN
                    0
                WHEN dst.Production_Date = src.Production_Date THEN
                    1
                ELSE
                    0
            END AS BIT)    AS X
FROM Staging.Merrick_Fact_Daily_Well_Production        AS src
    FULL JOIN Merrick.Fact_Daily_Well_Production AS dst ON 
		dst.Production_Date = src.Production_Date
		-- dst.Production_Date LIKE ISNULL(src.Production_Date , ''%'')
WHERE
    src.Processing_State = 1
    AND
    (
        src.UID_Left IS NOT NULL
        AND dst.Merrick_Fact_Daily_Well_Production_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2172, 1, 29, 1, N'Match Well Production ID', NULL, N'SELECT
       src.UID_Left AS UID_Left
      ,dst.Merrick_Fact_Daily_Well_Production_UID AS UID_Right
      ,CAST(CASE
                WHEN src.Well_Production_ID IS NULL THEN
                    0
                WHEN dst.Well_Production_ID = src.Well_Production_ID THEN
                    1
                ELSE
                    0
            END AS BIT)    AS X
FROM Staging.Merrick_Fact_Daily_Well_Production        AS src
    FULL JOIN Merrick.Fact_Daily_Well_Production AS dst ON 
		dst.Well_Production_ID = src.Well_Production_ID
		-- dst.Well_Production_ID LIKE ISNULL(src.Well_Production_ID , ''%'')
WHERE
    src.Processing_State = 1
    AND
    (
        src.UID_Left IS NOT NULL
        AND dst.Merrick_Fact_Daily_Well_Production_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2173, 1, 31, 1, N'Match First Production Date', NULL, N'SELECT
       src.UID_Left AS UID_Left
      ,dst.Merrick_Fact_Well_Header_UID AS UID_Right
      ,CAST(CASE
                WHEN src.First_Production_Date IS NULL THEN
                    0
                WHEN dst.First_Production_Date = src.First_Production_Date THEN
                    1
                ELSE
                    0
            END AS BIT)    AS X
FROM Staging.Merrick_Fact_Well_Header        AS src
    FULL JOIN Merrick.Fact_Well_Header AS dst ON 
		dst.First_Production_Date = src.First_Production_Date
		-- dst.First_Production_Date LIKE ISNULL(src.First_Production_Date , ''%'')
WHERE
    src.Processing_State = 1
    AND
    (
        src.UID_Left IS NOT NULL
        AND dst.Merrick_Fact_Well_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2174, 1, 31, 1, N'Match Merrick ID', NULL, N'SELECT
       src.UID_Left AS UID_Left
      ,dst.Merrick_Fact_Well_Header_UID AS UID_Right
      ,CAST(CASE
                WHEN src.Merrick_ID IS NULL THEN
                    0
                WHEN dst.Merrick_ID = src.Merrick_ID THEN
                    1
                ELSE
                    0
            END AS BIT)    AS X
FROM Staging.Merrick_Fact_Well_Header        AS src
    FULL JOIN Merrick.Fact_Well_Header AS dst ON 
		dst.Merrick_ID = src.Merrick_ID
		-- dst.Merrick_ID LIKE ISNULL(src.Merrick_ID , ''%'')
WHERE
    src.Processing_State = 1
    AND
    (
        src.UID_Left IS NOT NULL
        AND dst.Merrick_Fact_Well_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 1, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2175, 1, 35, 1, N'Match API Number', N'Dimension Third', N'SELECT
       src.UID_Left AS UID_Left
      ,dst.Odnr_Dim_Third_Party_Well_Header_UID AS UID_Right
      ,CAST(CASE
                WHEN src.API_Number IS NULL THEN
                    0
                WHEN dst.API_Number = src.API_Number THEN
                    1
                ELSE
                    0
            END AS BIT)    AS X
FROM Staging.Odnr_Dim_Third_Party_Well_Header        AS src
    FULL JOIN Odnr.Dim_Third_Party_Well_Header AS dst ON 
		dst.API_Number = src.API_Number
WHERE
    src.Processing_State = 1
    AND
    (
        src.UID_Left IS NOT NULL
        AND dst.Odnr_Dim_Third_Party_Well_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2176, 1, 35, 1, N'Match Well Name', N'Dimension Third', N'SELECT
       src.UID_Left AS UID_Left
      ,dst.Odnr_Dim_Third_Party_Well_Header_UID AS UID_Right
      ,CAST(CASE
                WHEN src.Well_Name_Antero_Standard IS NULL THEN
                    0
                WHEN dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard THEN
                    1
                ELSE
                    0
            END AS BIT)    AS X
FROM Staging.Odnr_Dim_Third_Party_Well_Header        AS src
    FULL JOIN Odnr.Dim_Third_Party_Well_Header AS dst ON 
		dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard
		
WHERE
    src.Processing_State = 1
    AND
    (
        src.UID_Left IS NOT NULL
        AND dst.Odnr_Dim_Third_Party_Well_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2177, 1, 37, 1, N'Match API Number', N'Dimension Third', N'SELECT
       src.UID_Left AS UID_Left
      ,dst.Odnr_Dim_Well_Header_UID AS UID_Right
      ,CAST(CASE
                WHEN src.API_Number IS NULL THEN
                    0
                WHEN dst.API_Number = src.API_Number THEN
                    1
                ELSE
                    0
            END AS BIT)    AS X
FROM Staging.Odnr_Dim_Well_Header        AS src
    FULL JOIN Odnr.Dim_Well_Header AS dst ON 
		dst.API_Number = src.API_Number
		-- dst.API_Number LIKE ISNULL(src.API_Number , ''%'')
WHERE
    src.Processing_State = 1
    AND
    (
        src.UID_Left IS NOT NULL
        AND dst.Odnr_Dim_Well_Header_UID IS NOT NULL
    )', 'BIT', 0.6, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2178, 1, 37, 1, N'Match Well Name', N'Dimension Third', N'SELECT
       src.UID_Left AS UID_Left
      ,dst.Odnr_Dim_Well_Header_UID AS UID_Right
      ,CAST(CASE
                WHEN src.Well_Name_Antero_Standard IS NULL THEN
                    0
                WHEN dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard THEN
                    1
                ELSE
                    0
            END AS BIT)    AS X
FROM Staging.Odnr_Dim_Well_Header        AS src
    FULL JOIN Odnr.Dim_Well_Header AS dst ON 
		dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard
		-- dst.Well_Name_Antero_Standard LIKE ISNULL(src.Well_Name_Antero_Standard , ''%'')
WHERE
    src.Processing_State = 1
    AND
    (
        src.UID_Left IS NOT NULL
        AND dst.Odnr_Dim_Well_Header_UID IS NOT NULL
    )', 'BIT', 0.65, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2179, 1, 39, 1, N'Match Production End Date', N'Fact Third', N'SELECT
       src.UID_Left AS UID_Left
      ,dst.Odnr_Fact_Third_Party_Monthly_Well_Production_UID AS UID_Right
      ,CAST(CASE
                WHEN src.Production_End_Date IS NULL THEN
                    0
                WHEN dst.Production_End_Date = src.Production_End_Date THEN
                    1
                ELSE
                    0
            END AS BIT)    AS X
FROM Staging.Odnr_Fact_Third_Party_Monthly_Well_Production        AS src
    FULL JOIN Odnr.Fact_Third_Party_Monthly_Well_Production AS dst ON 
		dst.Production_End_Date = src.Production_End_Date
		-- dst.Production_End_Date LIKE ISNULL(src.Production_End_Date , ''%'')
WHERE
    src.Processing_State = 1
    AND
    (
        src.UID_Left IS NOT NULL
        AND dst.Odnr_Fact_Third_Party_Monthly_Well_Production_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2180, 1, 39, 1, N'Match Production Start Date', N'Fact Third', N'SELECT
       src.UID_Left AS UID_Left
      ,dst.Odnr_Fact_Third_Party_Monthly_Well_Production_UID AS UID_Right
      ,CAST(CASE
                WHEN src.Production_Start_Date IS NULL THEN
                    0
                WHEN dst.Production_Start_Date = src.Production_Start_Date THEN
                    1
                ELSE
                    0
            END AS BIT)    AS X
FROM Staging.Odnr_Fact_Third_Party_Monthly_Well_Production        AS src
    FULL JOIN Odnr.Fact_Third_Party_Monthly_Well_Production AS dst ON 
		dst.Production_Start_Date = src.Production_Start_Date
		-- dst.Production_Start_Date LIKE ISNULL(src.Production_Start_Date , ''%'')
WHERE
    src.Processing_State = 1
    AND
    (
        src.UID_Left IS NOT NULL
        AND dst.Odnr_Fact_Third_Party_Monthly_Well_Production_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2181, 1, 42, 1, N'Match API Number', N'Dimension Third', N'SELECT
       src.UID_Left AS UID_Left
      ,dst.Dim_Pasda_Third_Party_Well_Header_UID AS UID_Right
      ,CAST(CASE
                WHEN src.API_Number IS NULL THEN
                    0
                WHEN dst.API_Number = src.API_Number THEN
                    1
                ELSE
                    0
            END AS BIT)    AS X
FROM Staging.Pasda_Dim_Third_Party_Well_Header        AS src
    FULL JOIN Pasda.Dim_Third_Party_Well_Header AS dst ON 
		dst.API_Number = src.API_Number
		-- dst.API_Number LIKE ISNULL(src.API_Number , ''%'')
WHERE
    src.Processing_State = 1
    AND
    (
        src.UID_Left IS NOT NULL
        AND dst.Dim_Pasda_Third_Party_Well_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2182, 1, 53, 1, N'Match API Number', N'Dimension Third', N'SELECT
       src.UID_Left AS UID_Left
      ,dst.Seneca_Dim_Third_Party_Well_Header_UID AS UID_Right
      ,CAST(CASE
                WHEN src.API_Number IS NULL THEN
                    0
                WHEN dst.API_Number = src.API_Number THEN
                    1
                ELSE
                    0
            END AS BIT)    AS X
FROM Staging.Seneca_Dim_Third_Party_Well_Header        AS src
    FULL JOIN Seneca.Dim_Third_Party_Well_Header AS dst ON 
		dst.API_Number = src.API_Number
		-- dst.API_Number LIKE ISNULL(src.API_Number , ''%'')
WHERE
    src.Processing_State = 1
    AND
    (
        src.UID_Left IS NOT NULL
        AND dst.Seneca_Dim_Third_Party_Well_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2183, 1, 53, 1, N'Match Well Name', N'Dimension Third', N'SELECT
       src.UID_Left AS UID_Left
      ,dst.Seneca_Dim_Third_Party_Well_Header_UID AS UID_Right
      ,CAST(CASE
                WHEN src.Well_Name_Antero_Standard IS NULL THEN
                    0
                WHEN dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard THEN
                    1
                ELSE
                    0
            END AS BIT)    AS X
FROM Staging.Seneca_Dim_Third_Party_Well_Header        AS src
    FULL JOIN Seneca.Dim_Third_Party_Well_Header AS dst ON 
		dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard
		-- dst.Well_Name_Antero_Standard LIKE ISNULL(src.Well_Name_Antero_Standard , ''%'')
WHERE
    src.Processing_State = 1
    AND
    (
        src.UID_Left IS NOT NULL
        AND dst.Seneca_Dim_Third_Party_Well_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2184, 1, 21, 3, N'Match FracSchedule ID', NULL, N'SELECT
       src.UID_Left AS UID_Left
      ,dst.Fact_FracSchedule_Well_Header_UID AS UID_Right
      ,CAST(CASE
                WHEN src.FracSchedule_ID IS NULL THEN
                    0
                WHEN dst.FracSchedule_ID = src.FracSchedule_ID THEN
                    1
                ELSE
                    0
            END AS BIT)    AS X
FROM Staging.FracSchedule_Fact_Well_Header        AS src
    FULL JOIN FracSchedule.Fact_Well_Header AS dst ON 
		dst.FracSchedule_ID = src.FracSchedule_ID
		-- dst.FracSchedule_ID LIKE ISNULL(src.FracSchedule_ID , ''%'')
WHERE
    src.Processing_State = 1
    AND
    (
        src.UID_Left IS NOT NULL
        AND dst.Fact_FracSchedule_Well_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 1, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2185, 1, 21, 1, N'Match SEQNUM', N'Fact FracSchedule', N'SELECT src.UID_Left AS UID_Left,
       dst.Fact_FracSchedule_Well_Header_UID AS UID_Right,
       CAST(CASE
                WHEN src.SEQNUM IS NULL THEN
                    0
                WHEN dst.SEQNUM = src.SEQNUM THEN
                    1
                ELSE
                    0
            END AS BIT) AS X
FROM Staging.FracSchedule_Fact_Well_Header AS src
    FULL JOIN FracSchedule.Fact_Well_Header AS dst
        ON dst.SEQNUM = src.SEQNUM WHERE      src.Processing_State = 1      AND      (          src.UID_Left IS NOT NULL          AND dst.Fact_FracSchedule_Well_Header_UID IS NOT NULL      )', 'BIT', 0.75, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2186, 1, 7, 1, N'Match Aries ID', NULL, N'SELECT
    src.UID_Left AS UID_Left
   ,dst.Aries_Dim_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Aries_ID IS NULL
                  OR dst.Aries_ID IS NULL THEN
                 0
             WHEN src.Aries_ID = dst.Aries_ID THEN
                 1
             ELSE
                 0
         END AS BIT)             AS X
   --,*
FROM Staging.Aries_Dim_Well_Header      AS src
    FULL JOIN Aries.Dim_Well_Header AS dst ON dst.Aries_ID = ISNULL(src.Aries_ID, dst.Aries_ID)
WHERE
    (
        src.UID_Left IS NOT NULL
        AND dst.Aries_Dim_Well_Header_UID IS NOT NULL
    )
    AND src.Processing_State = 1', 'BIT', 0, 0, 0, 0, 0, 1, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2187, 1, 7, 1, N'Match PropNum', NULL, N'SELECT
    src.UID_Left AS UID_Left
   ,dst.Aries_Dim_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.PropNum IS NULL
                  OR dst.PropNum IS NULL THEN
                 0
             WHEN src.PropNum = dst.PropNum THEN
                 1
             ELSE
                 0
         END AS BIT)             AS X
   --,*
FROM Staging.Aries_Dim_Well_Header      AS src
    FULL JOIN Aries.Dim_Well_Header AS dst ON dst.PropNum = ISNULL(src.PropNum, dst.PropNum)
WHERE
    (
        src.UID_Left IS NOT NULL
        AND dst.Aries_Dim_Well_Header_UID IS NOT NULL
    )
    AND src.Processing_State = 1', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2188, 1, 7, 1, N'Match SEQNUM', N'Dimension Aries', N'SELECT src.UID_Left AS UID_Left,
       dst.Aries_Dim_Well_Header_UID AS UID_Right,
       CAST(CASE
                WHEN src.SEQNUM IS NULL
                     OR dst.SEQNUM IS NULL THEN
                    0
                WHEN src.SEQNUM = dst.SEQNUM THEN
                    1
                ELSE
                    0
            END AS BIT) AS X FROM Staging.Aries_Dim_Well_Header      AS src      FULL JOIN Aries.Dim_Well_Header AS dst ON dst.SEQNUM = ISNULL(src.SEQNUM, dst.SEQNUM)  WHERE      (          src.UID_Left IS NOT NULL          AND dst.Aries_Dim_Well_Header_UID IS NOT NULL      )      AND src.Processing_State = 1', 'BIT', 0.75, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2189, 1, 7, 1, N'Match Well Name', N'Dimension Aries', N'SELECT
    src.UID_Left AS UID_Left
   ,dst.Aries_Dim_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Well_Name_Antero_Standard IS NULL
                  OR dst.Well_Name_Antero_Standard IS NULL THEN
                 0
             WHEN src.Well_Name_Antero_Standard = dst.Well_Name_Antero_Standard THEN
                 1
             ELSE
                 0
         END AS BIT)             AS X
   
FROM Staging.Aries_Dim_Well_Header      AS src
    FULL JOIN Aries.Dim_Well_Header AS dst ON dst.Well_Name_Antero_Standard like ISNULL(src.Well_Name_Antero_Standard, N''%'')
WHERE
    (
        src.UID_Left IS NOT NULL
        AND dst.Aries_Dim_Well_Header_UID IS NOT NULL
    )
    AND src.Processing_State = 1
	', 'BIT', 0.65, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2190, 1, 38, 1, N'Match API Number', N'Fact Third', N'SELECT
       src.UID_Left AS UID_Left
      ,dst.Fact_Odnr_Daily_Well_Production_UID AS UID_Right
      ,CAST(CASE
                WHEN src.API_Number IS NULL THEN
                    0
                WHEN dst.API_Number = src.API_Number THEN
                    1
                ELSE
                    0
            END AS BIT)    AS X
FROM Staging.Odnr_Fact_Daily_Well_Production        AS src
    FULL JOIN Odnr.Fact_Daily_Well_Production AS dst ON 
		dst.API_Number = src.API_Number
		-- dst.API_Number LIKE ISNULL(src.API_Number , ''%'')
WHERE
    src.Processing_State = 1
    AND
    (
        src.UID_Left IS NOT NULL
        AND dst.Fact_Odnr_Daily_Well_Production_UID IS NOT NULL
    )', 'BIT', 0.6, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2191, 1, 38, 1, N'Match Gas Volume MCF', N'Fact Third', N'SELECT
       src.UID_Left AS UID_Left
      ,dst.Fact_Odnr_Daily_Well_Production_UID AS UID_Right
      ,CAST(CASE
                WHEN src.Gas_Volume_MCF IS NULL THEN
                    0
                WHEN dst.Gas_Volume_MCF = src.Gas_Volume_MCF THEN
                    1
                ELSE
                    0
            END AS BIT)    AS X
FROM Staging.Odnr_Fact_Daily_Well_Production        AS src
    FULL JOIN Odnr.Fact_Daily_Well_Production AS dst ON 
		dst.Gas_Volume_MCF = src.Gas_Volume_MCF
		-- dst.Gas_Volume_MCF LIKE ISNULL(src.Gas_Volume_MCF , ''%'')
WHERE
    src.Processing_State = 1
    AND
    (
        src.UID_Left IS NOT NULL
        AND dst.Fact_Odnr_Daily_Well_Production_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2192, 1, 38, 1, N'Match Oil Volume BBLS', N'Fact Third', N'SELECT
       src.UID_Left AS UID_Left
      ,dst.Fact_Odnr_Daily_Well_Production_UID AS UID_Right
      ,CAST(CASE
                WHEN src.Oil_Volume_BBLS IS NULL THEN
                    0
                WHEN dst.Oil_Volume_BBLS = src.Oil_Volume_BBLS THEN
                    1
                ELSE
                    0
            END AS BIT)    AS X
FROM Staging.Odnr_Fact_Daily_Well_Production        AS src
    FULL JOIN Odnr.Fact_Daily_Well_Production AS dst ON 
		dst.Oil_Volume_BBLS = src.Oil_Volume_BBLS
		-- dst.Oil_Volume_BBLS LIKE ISNULL(src.Oil_Volume_BBLS , ''%'')
WHERE
    src.Processing_State = 1
    AND
    (
        src.UID_Left IS NOT NULL
        AND dst.Fact_Odnr_Daily_Well_Production_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2193, 1, 38, 1, N'Match Production End Date', N'Fact Third', N'SELECT
       src.UID_Left AS UID_Left
      ,dst.Fact_Odnr_Daily_Well_Production_UID AS UID_Right
      ,CAST(CASE
                WHEN src.Production_End_Date IS NULL THEN
                    0
                WHEN dst.Production_End_Date = src.Production_End_Date THEN
                    1
                ELSE
                    0
            END AS BIT)    AS X
FROM Staging.Odnr_Fact_Daily_Well_Production        AS src
    FULL JOIN Odnr.Fact_Daily_Well_Production AS dst ON 
		dst.Production_End_Date = src.Production_End_Date
		-- dst.Production_End_Date LIKE ISNULL(src.Production_End_Date , ''%'')
WHERE
    src.Processing_State = 1
    AND
    (
        src.UID_Left IS NOT NULL
        AND dst.Fact_Odnr_Daily_Well_Production_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2194, 1, 38, 1, N'Match Production Start Date', N'Fact Third', N'SELECT
       src.UID_Left AS UID_Left
      ,dst.Fact_Odnr_Daily_Well_Production_UID AS UID_Right
      ,CAST(CASE
                WHEN src.Production_Start_Date IS NULL THEN
                    0
                WHEN dst.Production_Start_Date = src.Production_Start_Date THEN
                    1
                ELSE
                    0
            END AS BIT)    AS X
FROM Staging.Odnr_Fact_Daily_Well_Production        AS src
    FULL JOIN Odnr.Fact_Daily_Well_Production AS dst ON 
		dst.Production_Start_Date = src.Production_Start_Date
		-- dst.Production_Start_Date LIKE ISNULL(src.Production_Start_Date , ''%'')
WHERE
    src.Processing_State = 1
    AND
    (
        src.UID_Left IS NOT NULL
        AND dst.Fact_Odnr_Daily_Well_Production_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2195, 1, 39, 1, N'Match API Number', N'Fact Third', N'SELECT
       src.UID_Left AS UID_Left
      ,dst.Odnr_Fact_Third_Party_Monthly_Well_Production_UID AS UID_Right
      ,CAST(CASE
                WHEN src.API_Number IS NULL THEN
                    0
                WHEN dst.API_Number = src.API_Number THEN
                    1
                ELSE
                    0
            END AS BIT)    AS X
FROM Staging.Odnr_Fact_Third_Party_Monthly_Well_Production        AS src
    FULL JOIN Odnr.Fact_Third_Party_Monthly_Well_Production AS dst ON 
		dst.API_Number = src.API_Number
		-- dst.API_Number LIKE ISNULL(src.API_Number , ''%'')
WHERE
    src.Processing_State = 1
    AND
    (
        src.UID_Left IS NOT NULL
        AND dst.Odnr_Fact_Third_Party_Monthly_Well_Production_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2196, 1, 44, 1, N'Match API Number', N'Dimension Third', N'SELECT
       src.UID_Left AS UID_Left
      ,dst.Pasda_Dim_Third_Party_Well_Header_UID AS UID_Right
      ,CAST(CASE
                WHEN src.API_Number IS NULL THEN
                    0
                WHEN dst.API_Number = src.API_Number THEN
                    1
                ELSE
                    0
            END AS BIT)    AS X
FROM Staging.Pasda_Dim_Third_Party_Well_Header        AS src
    FULL JOIN Pasda.Dim_Third_Party_Well_Header AS dst ON 
		dst.API_Number = src.API_Number
		-- dst.API_Number LIKE ISNULL(src.API_Number , ''%'')
WHERE
    src.Processing_State = 1
    AND
    (
        src.UID_Left IS NOT NULL
        AND dst.Pasda_Dim_Third_Party_Well_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2197, 1, 44, 1, N'Match Well Name', N'Dimension Third', N'SELECT
       src.UID_Left AS UID_Left
      ,dst.Pasda_Dim_Third_Party_Well_Header_UID AS UID_Right
      ,CAST(CASE
                WHEN src.Well_Name_Antero_Standard IS NULL THEN
                    0
                WHEN dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard THEN
                    1
                ELSE
                    0
            END AS BIT)    AS X
FROM Staging.Pasda_Dim_Third_Party_Well_Header        AS src
    FULL JOIN Pasda.Dim_Third_Party_Well_Header AS dst ON 
		dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard
		-- dst.Well_Name_Antero_Standard LIKE ISNULL(src.Well_Name_Antero_Standard , ''%'')
WHERE
    src.Processing_State = 1
    AND
    (
        src.UID_Left IS NOT NULL
        AND dst.Pasda_Dim_Third_Party_Well_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2198, 1, 6, 1, N'Match Unit Name', NULL, N'SELECT
    src.UID_Left AS UID_Left
   ,dst.Aries_Dim_Unit_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Unit_Name_Antero_Standard IS NULL
                  OR dst.Unit_Name_Antero_Standard IS NULL THEN
                 0
             WHEN src.Unit_Name_Antero_Standard = dst.Unit_Name_Antero_Standard THEN
                 1
             ELSE
                 0
         END AS BIT)             AS X
   --,*
FROM Staging.Aries_Dim_Unit_Header      AS src
    FULL JOIN Aries.Dim_Unit_Header AS dst ON dst.Unit_Name_Antero_Standard like ISNULL(src.Unit_Name_Antero_Standard, N''%'')
WHERE
    (
        src.UID_Left IS NOT NULL
        AND dst.Aries_Dim_Unit_Header_UID IS NOT NULL
    )
    AND src.Processing_State = 1', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2199, 1, 6, 1, N'Match County and State Name', NULL, N'SELECT
    src.UID_Left                  AS UID_Left
   ,dst.Aries_Dim_Unit_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN NULLIF(CONCAT(dst.County, dst.State_Name), N'''') IS NULL
                  OR NULLIF(CONCAT(src.County, src.State_Name), N'''') IS NULL THEN
                 0
             WHEN CONCAT(dst.County, dst.State_Name) = CONCAT(src.County, src.State_Name) THEN
                 1
             ELSE
                 0
         END AS BIT)              AS X
--,*
FROM Staging.Aries_Dim_Unit_Header  AS src
    FULL JOIN Aries.Dim_Unit_Header AS dst ON CONCAT(dst.County, dst.State_Name) = ISNULL(NULLIF(CONCAT(src.County, src.State_Name), N''''), N''%'')
WHERE
    (
        src.UID_Left IS NOT NULL
        AND dst.Aries_Dim_Unit_Header_UID IS NOT NULL
    )
    AND src.Processing_State = 1', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2200, 1, 8, 1, N'Match Aries ID', NULL, N'SELECT
    src.UID_Left AS UID_Left
   ,dst.Aries_Fact_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Aries_ID IS NULL
                  OR dst.Aries_ID IS NULL THEN
                 0
             WHEN src.Aries_ID = dst.Aries_ID THEN
                 1
             ELSE
                 0
         END AS BIT)             AS X
   --,*
FROM Staging.Aries_Fact_Well_Header      AS src
    FULL JOIN Aries.Fact_Well_Header AS dst ON dst.Aries_ID = ISNULL(src.Aries_ID, dst.Aries_ID)
WHERE
    (
        src.UID_Left IS NOT NULL
        AND dst.Aries_Fact_Well_Header_UID IS NOT NULL
    )
    AND src.Processing_State = 1', 'BIT', 0, 0, 0, 0, 0, 1, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2201, 1, 8, 1, N'Match SEQNUM', N'Fact Aries', N'SELECT src.UID_Left AS UID_Left,
       dst.Aries_Fact_Well_Header_UID AS UID_Right,
       CAST(CASE
                WHEN src.SEQNUM IS NULL
                     OR dst.SEQNUM IS NULL THEN
                    0
                WHEN src.SEQNUM = dst.SEQNUM THEN
                    1
                ELSE
                    0
            END AS BIT) AS X FROM Staging.Aries_Fact_Well_Header      AS src      FULL JOIN Aries.Fact_Well_Header AS dst ON dst.SEQNUM = ISNULL(src.SEQNUM, dst.SEQNUM)  WHERE      (          src.UID_Left IS NOT NULL          AND dst.Aries_Fact_Well_Header_UID IS NOT NULL      )      AND src.Processing_State = 1', 'BIT', 0.75, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2202, 1, 8, 1, N'Match PropNum', NULL, N'SELECT
    src.UID_Left AS UID_Left
   ,dst.Aries_Fact_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.PropNum IS NULL
                  OR dst.PropNum IS NULL THEN
                 0
             WHEN src.PropNum = dst.PropNum THEN
                 1
             ELSE
                 0
         END AS BIT)             AS X
   --,*
FROM Staging.Aries_Fact_Well_Header      AS src
    FULL JOIN Aries.Fact_Well_Header AS dst ON dst.PropNum = ISNULL(src.PropNum, dst.PropNum)
WHERE
    (
        src.UID_Left IS NOT NULL
        AND dst.Aries_Fact_Well_Header_UID IS NOT NULL
    )
    AND src.Processing_State = 1', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2203, 1, 23, 1, N'Match Pad Name Antero Standard', NULL, N'SELECT
    src.UID_Left AS UID_Left
   ,dst.Merrick_Dim_Pad_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Pad_Name_Antero_Standard IS NULL
                  OR dst.Pad_Name_Antero_Standard IS NULL THEN
                 0
             WHEN src.Pad_Name_Antero_Standard = dst.Pad_Name_Antero_Standard THEN
                 1
             ELSE
                 0
         END AS BIT)             AS X
   --,*
FROM Staging.Merrick_Dim_Pad_Header      AS src
    FULL JOIN Merrick.Dim_Pad_Header AS dst ON dst.Pad_Name_Antero_Standard = ISNULL(src.Pad_Name_Antero_Standard, N''%'')
WHERE
    (
        src.UID_Left IS NOT NULL
        AND dst.Merrick_Dim_Pad_Header_UID IS NOT NULL
    )
    AND src.Processing_State = 1', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2204, 1, 23, 1, N'Match County and State Name', NULL, N'SELECT
    src.UID_Left                  AS UID_Left
   ,dst.Merrick_Dim_Pad_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN NULLIF(dst.State_Name, N'''') IS NULL
                  OR NULLIF( src.State_Name, N'''') IS NULL THEN
                 0
             WHEN  dst.State_Name =  src.State_Name THEN
                 1
             ELSE
                 0
         END AS BIT)              AS X
--,*
FROM Staging.Merrick_Dim_Pad_Header  AS src
    FULL JOIN Merrick.Dim_Pad_Header AS dst ON  dst.State_Name = ISNULL(NULLIF(src.State_Name, N''''), N''%'')
WHERE
    (
        src.UID_Left IS NOT NULL
        AND dst.Merrick_Dim_Pad_Header_UID IS NOT NULL
    )
    AND src.Processing_State = 1
', 'BIT', 0, 0.01, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2205, 1, 56, 1, N'Match Pad Name', NULL, N'SELECT
    src.UID_Left AS UID_Left
   ,dst.SigmaFlow_Dim_Pad_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Pad_Name_Antero_Standard IS NULL
                  OR dst.Pad_Name_Antero_Standard IS NULL THEN
                 0
             WHEN src.Pad_Name_Antero_Standard = dst.Pad_Name_Antero_Standard THEN
                 1
             ELSE
                 0
         END AS BIT)             AS X
   --,*
FROM Staging.SigmaFlow_Dim_Pad_Header      AS src
    FULL JOIN SigmaFlow.Dim_Pad_Header AS dst ON dst.Pad_Name_Antero_Standard like ISNULL(src.Pad_Name_Antero_Standard, N''%'')
WHERE
    (
        src.UID_Left IS NOT NULL
        AND dst.SigmaFlow_Dim_Pad_Header_UID IS NOT NULL
    )
    AND src.Processing_State = 1', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2206, 1, 45, 2, N'Match Pad Name', NULL, N'SELECT
    src.UID_Left AS UID_Left
   ,dst.Petra_Dim_Pad_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Pad_Name_Antero_Standard IS NULL
                  OR dst.Pad_Name_Antero_Standard IS NULL THEN
                 0
             WHEN src.Pad_Name_Antero_Standard = dst.Pad_Name_Antero_Standard THEN
                 1
             ELSE
                 0
         END AS BIT)             AS X
   --,*
FROM Staging.Petra_Dim_Pad_Header      AS src
    FULL JOIN Petra.Dim_Pad_Header AS dst ON dst.Pad_Name_Antero_Standard = ISNULL(src.Pad_Name_Antero_Standard,  dst.Pad_Name_Antero_Standard)
WHERE
    (
        src.UID_Left IS NOT NULL
        AND dst.Petra_Dim_Pad_Header_UID IS NOT NULL
    )
    AND src.Processing_State = 1', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2207, 1, 45, 2, N'Match WSN ', NULL, N'SELECT
    src.UID_Left AS UID_Left
   ,dst.Petra_Dim_Pad_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.WSN IS NULL
                  OR dst.WSN IS NULL THEN
                 0
             WHEN src.WSN = dst.WSN THEN
                 1
             ELSE
                 0
         END AS BIT)             AS X
   --,*
FROM Staging.Petra_Dim_Pad_Header      AS src
    FULL JOIN Petra.Dim_Pad_Header AS dst ON dst.WSN = ISNULL(src.WSN,  dst.WSN)
WHERE
    (
        src.UID_Left IS NOT NULL
        AND dst.Petra_Dim_Pad_Header_UID IS NOT NULL
    )
    AND src.Processing_State = 1', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2208, 1, 30, 1, N'Match ObjectID', NULL, N'SELECT
       src.UID_Left AS UID_Left
      ,dst.Merrick_Fact_Produced_Gas_Analysis_UID AS UID_Right
      ,CAST(CASE
                WHEN src.ObjectID IS NULL THEN
                    0
                WHEN dst.ObjectID = src.ObjectID THEN
                    1
                ELSE
                    0
            END AS BIT)    AS X
FROM Staging.Merrick_Fact_Produced_Gas_Analysis        AS src
    FULL JOIN Merrick.Fact_Produced_Gas_Analysis AS dst ON 
		dst.ObjectID = src.ObjectID
		-- dst.ObjectID LIKE ISNULL(src.ObjectID , ''%'')
WHERE
    src.Processing_State = 1
   ', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2209, 1, 30, 1, N'Match Record Date', NULL, N'SELECT
       src.UID_Left AS UID_Left
      ,dst.Merrick_Fact_Produced_Gas_Analysis_UID AS UID_Right
      ,CAST(CASE
                WHEN src.Record_Date IS NULL THEN
                    0
                WHEN dst.Record_Date = src.Record_Date THEN
                    1
                ELSE
                    0
            END AS BIT)    AS X
FROM Staging.Merrick_Fact_Produced_Gas_Analysis        AS src
    FULL JOIN Merrick.Fact_Produced_Gas_Analysis AS dst ON 
		dst.Record_Date = src.Record_Date
		-- dst.Record_Date LIKE ISNULL(src.Record_Date , ''%'')
WHERE
    src.Processing_State = 1
  ', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2210, 1, 9, 2, N'Match Pad Code', NULL, N'SELECT
    src.UID_Left AS UID_Left
   ,dst.Enertia_Dim_Pad_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Pad_Code IS NULL
                  OR dst.Pad_Code IS NULL THEN
                 0
             WHEN src.Pad_Code = dst.Pad_Code THEN
                 1
             ELSE
                 0
         END AS BIT)             AS X
   --,*
FROM Staging.Enertia_Dim_Pad_Header      AS src
    FULL JOIN Enertia.Dim_Pad_Header AS dst ON dst.Pad_Code LIKE ISNULL(src.Pad_Code, dst.Pad_Code)
WHERE
    (
        src.UID_Left IS NOT NULL
        AND dst.Enertia_Dim_Pad_Header_UID IS NOT NULL
    )
    AND src.Processing_State = 1
--ORDER BY
--    src.Dim_Aries_Pad_Header_UID
--   ,dst.Dim_Aries_Pad_Header_UID
', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2211, 1, 56, 1, N'Match Pad ID', NULL, N'SELECT
    src.UID_Left AS UID_Left
   ,dst.SigmaFlow_Dim_Pad_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Pad_ID IS NULL
                  OR dst.Pad_ID IS NULL THEN
                 0
             WHEN src.Pad_ID = dst.Pad_ID THEN
                 1
             ELSE
                 0
         END AS BIT)             AS X
   --,*
FROM Staging.SigmaFlow_Dim_Pad_Header      AS src
    FULL JOIN SigmaFlow.Dim_Pad_Header AS dst ON dst.Pad_ID like ISNULL(src.Pad_ID, dst.Pad_ID)
WHERE
    (
        src.UID_Left IS NOT NULL
        AND dst.SigmaFlow_Dim_Pad_Header_UID IS NOT NULL
    )
    AND src.Processing_State = 1', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2212, 1, 16, 1, N'Match Unit ID', NULL, N'SELECT
    src.UID_Left AS UID_Left
   ,dst.Enertia_Fact_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Unit_ID IS NULL
                  OR dst.Unit_ID IS NULL THEN
                 0
             WHEN src.Unit_ID = dst.Unit_ID THEN
                 1
             ELSE
                 0
         END AS BIT)             AS X
   --,*
FROM Staging.Enertia_Fact_Well_Header      AS src
    FULL JOIN Enertia.Fact_Well_Header AS dst ON dst.Unit_ID = src.Unit_ID
WHERE
    (
        src.UID_Left IS NOT NULL
        AND dst.Enertia_Fact_Well_Header_UID IS NOT NULL
    )
    AND src.Processing_State = 1', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2213, 1, 2, 4, N'Match Latitude', NULL, N'SELECT
    src.Aries_Dim_Well_Header_UID      AS UID_Left
   ,hub.Hub_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Surface_Latitude_NAD27 IS NULL THEN
                 0
             WHEN dst.Surface_Latitude_NAD27 = src.Surface_Latitude_NAD27 THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Aries.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.Aries_Dim_Well_Header AS pag ON src.Aries_Dim_Well_Header_UID = pag.Aries_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Master_Well_Header          AS dst ON dst.Surface_Latitude_NAD27 = src.Surface_Latitude_NAD27
    INNER JOIN Master.Hub_Well_Header               AS hub ON dst.Hub_Well_Header_ID = hub.Hub_Well_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Aries_Dim_Well_Header_UID IS NOT NULL
        AND hub.Hub_Well_Header_UID IS NOT NULL
    )
--ORDER BY
--    src.Aries_Dim_Well_Header_UID
--   ,map.Master_Etl_Well_Header_Map_UID
', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2214, 1, 2, 4, N'Match Longitude', NULL, N'SELECT
    src.Aries_Dim_Well_Header_UID      AS UID_Left
   ,hub.Hub_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Surface_Longitude_NAD27 IS NULL THEN
                 0
             WHEN dst.Surface_Longitude_NAD27 = src.Surface_Longitude_NAD27 THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Aries.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.Aries_Dim_Well_Header AS pag ON src.Aries_Dim_Well_Header_UID = pag.Aries_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Master_Well_Header          AS dst ON dst.Surface_Longitude_NAD27 = src.Surface_Longitude_NAD27
    INNER JOIN Master.Hub_Well_Header               AS hub ON dst.Hub_Well_Header_ID = hub.Hub_Well_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Aries_Dim_Well_Header_UID IS NOT NULL
        AND hub.Hub_Well_Header_UID IS NOT NULL
    )
--ORDER BY
--    src.Aries_Dim_Well_Header_UID
--   ,map.Master_Etl_Well_Header_Map_UID
', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2215, 1, 2, 3, N'Match PropNum', NULL, N'SELECT
    src.Aries_Dim_Well_Header_UID      AS UID_Left
   ,hub.Hub_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.PropNum IS NULL THEN
                 0
             WHEN dst.PropNum = src.PropNum THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Aries.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.Aries_Dim_Well_Header AS pag ON src.Aries_Dim_Well_Header_UID = pag.Aries_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Master_Well_Header          AS dst ON dst.PropNum = src.PropNum
    INNER JOIN Master.Hub_Well_Header               AS hub ON dst.Hub_Well_Header_ID = hub.Hub_Well_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Aries_Dim_Well_Header_UID IS NOT NULL
        AND hub.Hub_Well_Header_UID IS NOT NULL
    )
--ORDER BY
--    src.Aries_Dim_Well_Header_UID
--   ,map.Master_Etl_Well_Header_Map_UID
', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2216, 1, 76, 1, N'Match SEQNUM', N'Master Enertia', N'SELECT
    src.Enertia_Dim_Well_Header_UID      AS UID_Left
   ,hub.Hub_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.SEQNUM IS NULL THEN
                 0
             WHEN dst.SEQNUM = src.SEQNUM THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Enertia.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.Enertia_Dim_Well_Header AS pag ON src.Enertia_Dim_Well_Header_UID = pag.Enertia_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Master_Well_Header          AS dst ON dst.SEQNUM = src.SEQNUM
    INNER JOIN Master.Hub_Well_Header               AS hub ON dst.Hub_Well_Header_ID = hub.Hub_Well_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Enertia_Dim_Well_Header_UID IS NOT NULL
        AND hub.Hub_Well_Header_UID IS NOT NULL
    )
--ORDER BY
--    src.Enertia_Dim_Well_Header_UID
--   ,map.Master_Etl_Well_Header_Map_UID
', 'BIT', 0.75, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2217, 1, 61, 1, N'Match Well Name and SEQNUM', N'Fact SigmaFlow', N'SELECT src.UID_Left AS UID_Left,
       dst.SigmaFlow_Fact_Well_Header_UID AS UID_Right,
       CAST(CASE
                WHEN src.SEQNUM IS NULL OR dst.SEQNUM IS NULL THEN
                    0
                WHEN dst.SEQNUM = src.SEQNUM THEN
                    1
                ELSE
                    0
            END AS BIT) AS X
FROM Staging.SigmaFlow_Fact_Well_Header AS src
    FULL JOIN SigmaFlow.Fact_Well_Header AS dst
        ON dst.SEQNUM = src.SEQNUM 
WHERE (
          src.UID_Left IS NOT NULL
          AND dst.SigmaFlow_Fact_Well_Header_UID IS NOT NULL
      )
      AND src.Processing_State = 1;', 'BIT', 0.85, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2218, 1, 76, 2, N'Match Well Name Antero Standard', NULL, N'SELECT
    src.Enertia_Dim_Well_Header_UID      AS UID_Left
   ,hub.Hub_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Wellbore_Name_Antero_Standard IS NULL THEN
                 0
             WHEN dst.Wellbore_Name_Antero_Standard = src.Wellbore_Name_Antero_Standard THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Enertia.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.Enertia_Dim_Well_Header AS pag ON src.Enertia_Dim_Well_Header_UID = pag.Enertia_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Master_Well_Header          AS dst ON dst.Wellbore_Name_Antero_Standard = src.Wellbore_Name_Antero_Standard
    INNER JOIN Master.Hub_Well_Header               AS hub ON dst.Hub_Well_Header_ID = hub.Hub_Well_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Enertia_Dim_Well_Header_UID IS NOT NULL
        AND hub.Hub_Well_Header_UID IS NOT NULL
    )
--ORDER BY
--    src.Enertia_Dim_Well_Header_UID
--   ,map.Master_Etl_Well_Header_Map_UID
', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2219, 1, 76, 3, N'Match API Number', N'Master Enertia', N'SELECT
    src.Enertia_Dim_Well_Header_UID      AS UID_Left
   ,hub.Hub_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.API_Number IS NULL THEN
                 0
             WHEN dst.API_Number = src.API_Number THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Enertia.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.Enertia_Dim_Well_Header AS pag ON src.Enertia_Dim_Well_Header_UID = pag.Enertia_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Master_Well_Header          AS dst ON dst.API_Number = src.API_Number
    INNER JOIN Master.Hub_Well_Header               AS hub ON dst.Hub_Well_Header_ID = hub.Hub_Well_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Enertia_Dim_Well_Header_UID IS NOT NULL
        AND hub.Hub_Well_Header_UID IS NOT NULL
    )
--ORDER BY
--    src.Enertia_Dim_Well_Header_UID
--   ,map.Master_Etl_Well_Header_Map_UID
', 'BIT', 0.6, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2220, 1, 76, 3, N'Match Cost Center', N'Master Enertia', N'SELECT
    src.Enertia_Dim_Well_Header_UID      AS UID_Left
   ,hub.Hub_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Cost_Center IS NULL THEN
                 0
             WHEN dst.Cost_Center = src.Cost_Center THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Enertia.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.Enertia_Dim_Well_Header AS pag ON src.Enertia_Dim_Well_Header_UID = pag.Enertia_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Master_Well_Header          AS dst ON dst.Cost_Center = src.Cost_Center
    INNER JOIN Master.Hub_Well_Header               AS hub ON dst.Hub_Well_Header_ID = hub.Hub_Well_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Enertia_Dim_Well_Header_UID IS NOT NULL
        AND hub.Hub_Well_Header_UID IS NOT NULL
    )
--ORDER BY
--    src.Enertia_Dim_Well_Header_UID
--   ,map.Master_Etl_Well_Header_Map_UID
', 'BIT', 0.55, 0, 0, 0, 0, 1, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2221, 1, 77, 1, N'Match SEQNUM', N'Master FracSchedule', N'SELECT
    src.FracSchedule_Dim_Well_Header_UID      AS UID_Left
   ,hub.Hub_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.SEQNUM IS NULL THEN
                 0
             WHEN dst.SEQNUM = src.SEQNUM THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM FracSchedule.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.FracSchedule_Dim_Well_Header AS pag ON src.FracSchedule_Dim_Well_Header_UID = pag.FracSchedule_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Master_Well_Header          AS dst ON dst.SEQNUM = src.SEQNUM
    INNER JOIN Master.Hub_Well_Header               AS hub ON dst.Hub_Well_Header_ID = hub.Hub_Well_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.FracSchedule_Dim_Well_Header_UID IS NOT NULL
        AND hub.Hub_Well_Header_UID IS NOT NULL
    )
--ORDER BY
--    src.FracSchedule_Dim_Well_Header_UID
--   ,map.Master_Etl_Well_Header_Map_UID
', 'BIT', 0.75, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2222, 1, 77, 1, N'Match Well Name Antero Standard', NULL, N'SELECT
    src.FracSchedule_Dim_Well_Header_UID      AS UID_Left
   ,hub.Hub_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Well_Name_Antero_Standard IS NULL THEN
                 0
             WHEN dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM FracSchedule.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.FracSchedule_Dim_Well_Header AS pag ON src.FracSchedule_Dim_Well_Header_UID = pag.FracSchedule_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Master_Well_Header          AS dst ON dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard
    INNER JOIN Master.Hub_Well_Header               AS hub ON dst.Hub_Well_Header_ID = hub.Hub_Well_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.FracSchedule_Dim_Well_Header_UID IS NOT NULL
        AND hub.Hub_Well_Header_UID IS NOT NULL
    )
--ORDER BY
--    src.FracSchedule_Dim_Well_Header_UID
--   ,map.Master_Etl_Well_Header_Map_UID
', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2223, 1, 77, 1, N'Match Pad Name Antero Standard', NULL, N'SELECT
    src.FracSchedule_Dim_Well_Header_UID      AS UID_Left
   ,hub.Hub_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Pad_Name_Antero_Standard IS NULL THEN
                 0
             WHEN dst.Pad_Name_Antero_Standard = src.Pad_Name_Antero_Standard THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM FracSchedule.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.FracSchedule_Dim_Well_Header AS pag ON src.FracSchedule_Dim_Well_Header_UID = pag.FracSchedule_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Master_Well_Header          AS dst ON dst.Pad_Name_Antero_Standard = src.Pad_Name_Antero_Standard
    INNER JOIN Master.Hub_Well_Header               AS hub ON dst.Hub_Well_Header_ID = hub.Hub_Well_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.FracSchedule_Dim_Well_Header_UID IS NOT NULL
        AND hub.Hub_Well_Header_UID IS NOT NULL
    )
--ORDER BY
--    src.FracSchedule_Dim_Well_Header_UID
--   ,map.Master_Etl_Well_Header_Map_UID
', 'BIT', 0, 0.25, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2224, 1, 62, 1, N'Match Pad Name', NULL, N'SELECT
    src.UID_Left AS UID_Left
   ,dst.WellView_Dim_Pad_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Pad_Name_Antero_Standard IS NULL
                  OR dst.Pad_Name_Antero_Standard IS NULL THEN
                 0
             WHEN src.Pad_Name_Antero_Standard = dst.Pad_Name_Antero_Standard THEN
                 1
             ELSE
                 0
         END AS BIT)             AS X
   --,*
FROM Staging.WellView_Dim_Pad_Header      AS src
    FULL JOIN WellView.Dim_Pad_Header AS dst ON dst.Pad_Name_Antero_Standard like ISNULL(src.Pad_Name_Antero_Standard, N''%'')
WHERE
    (
        src.UID_Left IS NOT NULL
        AND dst.WellView_Dim_Pad_Header_UID IS NOT NULL
    )
    AND src.Processing_State = 1', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2225, 1, 78, 1, N'Match Enertia_ID', N'Master Merrick', N'SELECT      src.Merrick_Dim_Well_Header_UID      AS UID_Left     ,hub.Hub_Well_Header_UID AS UID_Right     ,CAST(CASE               WHEN src.Enertia_ID IS NULL THEN                   0               WHEN dst.Enertia_ID = src.Enertia_ID THEN                   1               ELSE                   0           END AS BIT)                   AS X  FROM Merrick.Dim_Well_Header                          AS src      INNER JOIN Master_Staging.Merrick_Dim_Well_Header AS pag ON src.Merrick_Dim_Well_Header_UID = pag.Merrick_Dim_Well_Header_UID      FULL JOIN Master_Etl.Master_Well_Header          AS dst ON dst.Enertia_ID = src.Enertia_ID      INNER JOIN Master.Hub_Well_Header               AS hub ON dst.Hub_Well_Header_ID = hub.Hub_Well_Header_ID        WHERE      pag.Processing_State = 1      AND      (          src.Merrick_Dim_Well_Header_UID IS NOT NULL          AND hub.Hub_Well_Header_UID IS NOT NULL      )  --ORDER BY  --    src.Merrick_Dim_Well_Header_UID  --   ,map.Master_Etl_Well_Header_Map_UID', 'BIT', 0.55, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2226, 1, 78, 1, N'Match Well Name', N'Master Merrick', N'SELECT      src.Merrick_Dim_Well_Header_UID      AS UID_Left     ,hub.Hub_Well_Header_UID AS UID_Right     ,CAST(CASE               WHEN src.Well_Name_Antero_Standard IS NULL THEN                   0               WHEN dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard THEN                   1               ELSE                   0           END AS BIT)                   AS X  FROM Merrick.Dim_Well_Header                          AS src      INNER JOIN Master_Staging.Merrick_Dim_Well_Header AS pag ON src.Merrick_Dim_Well_Header_UID = pag.Merrick_Dim_Well_Header_UID      FULL JOIN Master_Etl.Master_Well_Header          AS dst ON dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard      INNER JOIN Master.Hub_Well_Header               AS hub ON dst.Hub_Well_Header_ID = hub.Hub_Well_Header_ID        WHERE      pag.Processing_State = 1      AND      (          src.Merrick_Dim_Well_Header_UID IS NOT NULL          AND hub.Hub_Well_Header_UID IS NOT NULL      )  --ORDER BY  --    src.Merrick_Dim_Well_Header_UID  --   ,map.Master_Etl_Well_Header_Map_UID', 'BIT', 0.65, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2227, 1, 78, 1, N'Match API Number', N'Master Merrick', N'SELECT      src.Merrick_Dim_Well_Header_UID      AS UID_Left     ,hub.Hub_Well_Header_UID AS UID_Right     ,CAST(CASE               WHEN src.API_Number IS NULL THEN                   0               WHEN dst.API_Number = src.API_Number THEN                   1               ELSE                   0           END AS BIT)                   AS X  FROM Merrick.Dim_Well_Header                          AS src      INNER JOIN Master_Staging.Merrick_Dim_Well_Header AS pag ON src.Merrick_Dim_Well_Header_UID = pag.Merrick_Dim_Well_Header_UID      FULL JOIN Master_Etl.Master_Well_Header          AS dst ON dst.API_Number = src.API_Number      INNER JOIN Master.Hub_Well_Header               AS hub ON dst.Hub_Well_Header_ID = hub.Hub_Well_Header_ID        WHERE      pag.Processing_State = 1      AND      (          src.Merrick_Dim_Well_Header_UID IS NOT NULL          AND hub.Hub_Well_Header_UID IS NOT NULL      )  --ORDER BY  --    src.Merrick_Dim_Well_Header_UID  --   ,map.Master_Etl_Well_Header_Map_UID', 'BIT', 0.6, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2228, 1, 20, 1, N'Match Well Name and SEQNUM', N'Dimension FracSchedule', N'SELECT src.UID_Left AS UID_Left,
       dst.FracSchedule_Dim_Well_Header_UID AS UID_Right,
       CAST(CASE
                WHEN CONCAT(src.Well_Name_Antero_Standard,src.SEQNUM) IS NULL OR CONCAT(dst.Well_Name_Antero_Standard,dst.SEQNUM) IS NULL THEN
                    0
                WHEN CONCAT(dst.Well_Name_Antero_Standard,dst.SEQNUM) = CONCAT(src.Well_Name_Antero_Standard,src.SEQNUM) THEN
                    1
                ELSE
                    0
            END AS BIT) AS X
FROM Staging.FracSchedule_Dim_Well_Header AS src
    FULL JOIN FracSchedule.Dim_Well_Header AS dst
        ON CONCAT(dst.Well_Name_Antero_Standard,dst.SEQNUM) = CONCAT(src.Well_Name_Antero_Standard,src.SEQNUM)
WHERE src.Processing_State = 1
      AND
      (
          src.UID_Left IS NOT NULL
          AND dst.FracSchedule_Dim_Well_Header_UID IS NOT NULL
      );', 'BIT', 0.85, 0, 1, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2229, 1, 78, 1, N'Match Production Id', NULL, N'SELECT
    src.Merrick_Dim_Well_Header_UID      AS UID_Left
   ,hub.Hub_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Production_Id IS NULL THEN
                 0
             WHEN dst.Production_Id = src.Production_Id THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Merrick.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.Merrick_Dim_Well_Header AS pag ON src.Merrick_Dim_Well_Header_UID = pag.Merrick_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Master_Well_Header          AS dst ON dst.Production_Id = src.Production_Id
    INNER JOIN Master.Hub_Well_Header               AS hub ON dst.Hub_Well_Header_ID = hub.Hub_Well_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Merrick_Dim_Well_Header_UID IS NOT NULL
        AND hub.Hub_Well_Header_UID IS NOT NULL
    )
--ORDER BY
--    src.Merrick_Dim_Well_Header_UID
--   ,map.Master_Etl_Well_Header_Map_UID
', 'BIT', 0, 0, 0, 0, 0, 1, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2230, 1, 78, 2, N'Match PropNum', NULL, N'SELECT
    src.Merrick_Dim_Well_Header_UID      AS UID_Left
   ,hub.Hub_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.PropNum IS NULL THEN
                 0
             WHEN dst.PropNum = src.PropNum THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Merrick.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.Merrick_Dim_Well_Header AS pag ON src.Merrick_Dim_Well_Header_UID = pag.Merrick_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Master_Well_Header          AS dst ON dst.PropNum = src.PropNum
    INNER JOIN Master.Hub_Well_Header               AS hub ON dst.Hub_Well_Header_ID = hub.Hub_Well_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Merrick_Dim_Well_Header_UID IS NOT NULL
        AND hub.Hub_Well_Header_UID IS NOT NULL
    )
--ORDER BY
--    src.Merrick_Dim_Well_Header_UID
--   ,map.Master_Etl_Well_Header_Map_UID
', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2231, 1, 79, 1, N'Match Well Name', N'Master Wellview', N'SELECT      src.WellView_Dim_Well_Header_UID      AS UID_Left     ,hub.Hub_Well_Header_UID AS UID_Right     ,CAST(CASE               WHEN src.Well_Name_Antero_Standard IS NULL THEN                   0               WHEN dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard THEN                   1               ELSE                   0           END AS BIT)                   AS X  FROM WellView.Dim_Well_Header                          AS src      INNER JOIN Master_Staging.WellView_Dim_Well_Header AS pag ON src.WellView_Dim_Well_Header_UID = pag.WellView_Dim_Well_Header_UID      FULL JOIN Master_Etl.Master_Well_Header          AS dst ON dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard      INNER JOIN Master.Hub_Well_Header               AS hub ON dst.Hub_Well_Header_ID = hub.Hub_Well_Header_ID        WHERE      pag.Processing_State = 1      AND      (          src.WellView_Dim_Well_Header_UID IS NOT NULL          AND hub.Hub_Well_Header_UID IS NOT NULL      )', 'BIT', 0.65, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2232, 1, 21, 1, N'Match Well Name and SEQNUM', N'Fact FracSchedule', N'SELECT src.UID_Left AS UID_Left,
       dst.Fact_FracSchedule_Well_Header_UID AS UID_Right,
       CAST(CASE
                WHEN src.SEQNUM IS NULL OR dst.SEQNUM IS NULL THEN
                    0
                WHEN dst.SEQNUM = src.SEQNUM THEN
                    1
                ELSE
                    0
            END AS BIT) AS X
FROM Staging.FracSchedule_Fact_Well_Header AS src
    FULL JOIN FracSchedule.Fact_Well_Header AS dst
        ON dst.SEQNUM = src.SEQNUM 
WHERE src.Processing_State = 1
      AND
      (
          src.UID_Left IS NOT NULL
          AND dst.Fact_FracSchedule_Well_Header_UID IS NOT NULL
      );', 'BIT', 0.85, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2233, 1, 79, 1, N'Match API Number', N'Master Wellview', N'SELECT
    src.WellView_Dim_Well_Header_UID      AS UID_Left
   ,hub.Hub_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.API_Number IS NULL THEN
                 0
             WHEN dst.API_Number = src.API_Number THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM WellView.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.WellView_Dim_Well_Header AS pag ON src.WellView_Dim_Well_Header_UID = pag.WellView_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Master_Well_Header          AS dst ON dst.API_Number = src.API_Number
    INNER JOIN Master.Hub_Well_Header               AS hub ON dst.Hub_Well_Header_ID = hub.Hub_Well_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.WellView_Dim_Well_Header_UID IS NOT NULL
        AND hub.Hub_Well_Header_UID IS NOT NULL
    )', 'BIT', 0.6, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2234, 1, 79, 1, N'Match Cost Center', N'Master Wellview', N'SELECT
    src.WellView_Dim_Well_Header_UID      AS UID_Left
   ,hub.Hub_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Cost_Center IS NULL THEN
                 0
             WHEN dst.Cost_Center = src.Cost_Center THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM WellView.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.WellView_Dim_Well_Header AS pag ON src.WellView_Dim_Well_Header_UID = pag.WellView_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Master_Well_Header          AS dst ON dst.Cost_Center = src.Cost_Center
    INNER JOIN Master.Hub_Well_Header               AS hub ON dst.Hub_Well_Header_ID = hub.Hub_Well_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.WellView_Dim_Well_Header_UID IS NOT NULL
        AND hub.Hub_Well_Header_UID IS NOT NULL
    )', 'BIT', 0.55, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2235, 1, 80, 2, N'Match Well Name', N'Master Sigmaflow', N'SELECT
    src.SigmaFlow_Dim_Well_Header_UID      AS UID_Left
   ,hub.Hub_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Well_Name_Antero_Standard IS NULL THEN
                 0
             WHEN dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM SigmaFlow.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.SigmaFlow_Dim_Well_Header AS pag ON src.SigmaFlow_Dim_Well_Header_UID = pag.SigmaFlow_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Master_Well_Header          AS dst ON dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard
    INNER JOIN Master.Hub_Well_Header               AS hub ON dst.Hub_Well_Header_ID = hub.Hub_Well_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.SigmaFlow_Dim_Well_Header_UID IS NOT NULL
        AND hub.Hub_Well_Header_UID IS NOT NULL
    )', 'BIT', 0.65, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2236, 1, 80, 2, N'Match API Number', N'Master Sigmaflow', N'SELECT
    src.SigmaFlow_Dim_Well_Header_UID      AS UID_Left
   ,hub.Hub_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.API_Number IS NULL THEN
                 0
             WHEN dst.API_Number = src.API_Number THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM SigmaFlow.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.SigmaFlow_Dim_Well_Header AS pag ON src.SigmaFlow_Dim_Well_Header_UID = pag.SigmaFlow_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Master_Well_Header          AS dst ON dst.API_Number = src.API_Number
    INNER JOIN Master.Hub_Well_Header               AS hub ON dst.Hub_Well_Header_ID = hub.Hub_Well_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.SigmaFlow_Dim_Well_Header_UID IS NOT NULL
        AND hub.Hub_Well_Header_UID IS NOT NULL
    )', 'BIT', 0.6, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2237, 1, 80, 2, N'Match WSN Number', NULL, N'SELECT
    src.SigmaFlow_Dim_Well_Header_UID      AS UID_Left
   ,hub.Hub_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.WSN_Number IS NULL THEN
                 0
             WHEN dst.WSN_Number = src.WSN_Number THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM SigmaFlow.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.SigmaFlow_Dim_Well_Header AS pag ON src.SigmaFlow_Dim_Well_Header_UID = pag.SigmaFlow_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Master_Well_Header          AS dst ON dst.WSN_Number = src.WSN_Number
    INNER JOIN Master.Hub_Well_Header               AS hub ON dst.Hub_Well_Header_ID = hub.Hub_Well_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.SigmaFlow_Dim_Well_Header_UID IS NOT NULL
        AND hub.Hub_Well_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2238, 1, 80, 1, N'Match SEQNUM and SigmaFlow ID', NULL, N'SELECT
    src.SigmaFlow_Dim_Well_Header_UID AS UID_Left
   ,hub.Hub_Well_Header_UID           AS UID_Right--, NULLIF(CONCAT(dst.SEQNUM, dst.SigmaFlow_ID), '''') , NULLIF(CONCAT(src.SEQNUM, dst.SigmaFlow_ID), '''')
   ,CAST(CASE
             WHEN NULLIF(CONCAT(src.SEQNUM, src.SigmaFlow_ID), '''') IS NULL THEN
                 0
             WHEN NULLIF(CONCAT(dst.SEQNUM, dst.SigmaFlow_ID), '''') = NULLIF(CONCAT(src.SEQNUM, dst.SigmaFlow_ID), '''') THEN
                 1
             ELSE
                 0
         END AS BIT)                  AS X
FROM SigmaFlow.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.SigmaFlow_Dim_Well_Header AS pag ON src.SigmaFlow_Dim_Well_Header_UID = pag.SigmaFlow_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Master_Well_Header             AS dst ON NULLIF(CONCAT(dst.SEQNUM, dst.SigmaFlow_ID), '''') = NULLIF(CONCAT(src.SEQNUM, dst.SigmaFlow_ID), '''')
    INNER JOIN Master.Hub_Well_Header                   AS hub ON dst.Hub_Well_Header_ID = hub.Hub_Well_Header_ID
WHERE
    pag.Processing_State = 1
    AND
    (
        src.SigmaFlow_Dim_Well_Header_UID IS NOT NULL
        AND hub.Hub_Well_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2239, 1, 81, 1, N'Match Pad ID', NULL, N'SELECT
    src.SigmaFlow_Dim_Pad_Header_UID      AS UID_Left
   ,hub.Hub_Pad_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Pad_ID IS NULL THEN
                 0
             WHEN dst.Pad_ID = src.Pad_ID THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM SigmaFlow.Dim_Pad_Header                          AS src
    INNER JOIN Master_Staging.SigmaFlow_Dim_Pad_Header AS pag ON src.SigmaFlow_Dim_Pad_Header_UID = pag.SigmaFlow_Dim_Pad_Header_UID
    FULL JOIN Master_Etl.Master_Pad_Header          AS dst ON dst.Pad_ID = src.Pad_ID
    INNER JOIN Master.Hub_Pad_Header               AS hub ON dst.Hub_Pad_Header_ID = hub.Hub_Pad_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.SigmaFlow_Dim_Pad_Header_UID IS NOT NULL
        AND hub.Hub_Pad_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2240, 1, 7, 1, N'Match Well Name and SEQNUM', N'Dimension Aries', N'SELECT src.UID_Left AS UID_Left,
       dst.Aries_Dim_Well_Header_UID AS UID_Right,
       CAST(CASE
                WHEN CONCAT(src.Well_Name_Antero_Standard,src.SEQNUM) IS NULL OR CONCAT(dst.Well_Name_Antero_Standard,dst.SEQNUM) IS NULL THEN
                    0
                WHEN CONCAT(dst.Well_Name_Antero_Standard,dst.SEQNUM) = CONCAT(src.Well_Name_Antero_Standard,src.SEQNUM) THEN
                    1
                ELSE
                    0
            END AS BIT) AS X
FROM Staging.Aries_Dim_Well_Header AS src
    FULL JOIN Aries.Dim_Well_Header AS dst
        ON CONCAT(dst.Well_Name_Antero_Standard,dst.SEQNUM) = CONCAT(src.Well_Name_Antero_Standard,src.SEQNUM)
WHERE (
          src.UID_Left IS NOT NULL
          AND dst.Aries_Dim_Well_Header_UID IS NOT NULL
      )
      AND src.Processing_State = 1;', 'BIT', 0.85, 0, 1, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2241, 1, 81, 1, N'Match Pad Name', NULL, N'SELECT
    src.SigmaFlow_Dim_Pad_Header_UID      AS UID_Left
   ,hub.Hub_Pad_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Pad_Name_Antero_Standard IS NULL THEN
                 0
             WHEN dst.Pad_Name_Antero_Standard = src.Pad_Name_Antero_Standard THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM SigmaFlow.Dim_Pad_Header                          AS src
    INNER JOIN Master_Staging.SigmaFlow_Dim_Pad_Header AS pag ON src.SigmaFlow_Dim_Pad_Header_UID = pag.SigmaFlow_Dim_Pad_Header_UID
    FULL JOIN Master_Etl.Master_Pad_Header          AS dst ON dst.Pad_Name_Antero_Standard = src.Pad_Name_Antero_Standard
    INNER JOIN Master.Hub_Pad_Header               AS hub ON dst.Hub_Pad_Header_ID = hub.Hub_Pad_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.SigmaFlow_Dim_Pad_Header_UID IS NOT NULL
        AND hub.Hub_Pad_Header_UID IS NOT NULL
    )
', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2242, 1, 82, 1, N'Match Pad Name', NULL, N'SELECT
    src.Enertia_Dim_Pad_Header_UID      AS UID_Left
   ,hub.Hub_Pad_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Pad_Name_Antero_Standard IS NULL THEN
                 0
             WHEN dst.Pad_Name_Antero_Standard = src.Pad_Name_Antero_Standard THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Enertia.Dim_Pad_Header                          AS src
    INNER JOIN Master_Staging.Enertia_Dim_Pad_Header AS pag ON src.Enertia_Dim_Pad_Header_UID = pag.Enertia_Dim_Pad_Header_UID
    FULL JOIN Master_Etl.Master_Pad_Header          AS dst ON dst.Pad_Name_Antero_Standard = src.Pad_Name_Antero_Standard
    INNER JOIN Master.Hub_Pad_Header               AS hub ON dst.Hub_Pad_Header_ID = hub.Hub_Pad_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Enertia_Dim_Pad_Header_UID IS NOT NULL
        AND hub.Hub_Pad_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2243, 1, 82, 1, N'Match Pad Code', NULL, N'SELECT
    src.Enertia_Dim_Pad_Header_UID      AS UID_Left
   ,hub.Hub_Pad_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Pad_Code IS NULL THEN
                 0
             WHEN dst.Pad_Code = src.Pad_Code THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Enertia.Dim_Pad_Header                          AS src
    INNER JOIN Master_Staging.Enertia_Dim_Pad_Header AS pag ON src.Enertia_Dim_Pad_Header_UID = pag.Enertia_Dim_Pad_Header_UID
    FULL JOIN Master_Etl.Master_Pad_Header          AS dst ON dst.Pad_Code = src.Pad_Code
    INNER JOIN Master.Hub_Pad_Header               AS hub ON dst.Hub_Pad_Header_ID = hub.Hub_Pad_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Enertia_Dim_Pad_Header_UID IS NOT NULL
        AND hub.Hub_Pad_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2244, 1, 83, 1, N'Match Pad Name', NULL, N'SELECT
    src.Petra_Dim_Pad_Header_UID      AS UID_Left
   ,hub.Hub_Pad_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Pad_Name_Antero_Standard IS NULL THEN
                 0
             WHEN dst.Pad_Name_Antero_Standard = src.Pad_Name_Antero_Standard THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Petra.Dim_Pad_Header                          AS src
    INNER JOIN Master_Staging.Petra_Dim_Pad_Header AS pag ON src.Petra_Dim_Pad_Header_UID = pag.Petra_Dim_Pad_Header_UID
    FULL JOIN Master_Etl.Master_Pad_Header          AS dst ON dst.Pad_Name_Antero_Standard = src.Pad_Name_Antero_Standard
    INNER JOIN Master.Hub_Pad_Header               AS hub ON dst.Hub_Pad_Header_ID = hub.Hub_Pad_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Petra_Dim_Pad_Header_UID IS NOT NULL
        AND hub.Hub_Pad_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2245, 1, 83, 2, N'Match Pad WSN', NULL, N'SELECT
    src.Petra_Dim_Pad_Header_UID      AS UID_Left
   ,hub.Hub_Pad_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.WSN IS NULL THEN
                 0
             WHEN dst.Pad_WSN = src.WSN THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Petra.Dim_Pad_Header                          AS src
    INNER JOIN Master_Staging.Petra_Dim_Pad_Header AS pag ON src.Petra_Dim_Pad_Header_UID = pag.Petra_Dim_Pad_Header_UID
    FULL JOIN Master_Etl.Master_Pad_Header          AS dst ON dst.Pad_WSN = src.WSN
    INNER JOIN Master.Hub_Pad_Header               AS hub ON dst.Hub_Pad_Header_ID = hub.Hub_Pad_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Petra_Dim_Pad_Header_UID IS NOT NULL
        AND hub.Hub_Pad_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2246, 1, 84, 1, N'Match Unit Name', NULL, N'SELECT
    src.Enertia_Dim_Unit_Header_UID      AS UID_Left
   ,hub.Hub_Unit_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Unit_Name_Antero_Standard IS NULL THEN
                 0
             WHEN dst.Unit_Name_Antero_Standard = src.Unit_Name_Antero_Standard THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Enertia.Dim_Unit_Header                          AS src
    INNER JOIN Master_Staging.Enertia_Dim_Unit_Header AS pag ON src.Enertia_Dim_Unit_Header_UID = pag.Enertia_Dim_Unit_Header_UID
    FULL JOIN Master_Etl.Master_Unit_Header          AS dst ON dst.Unit_Name_Antero_Standard = src.Unit_Name_Antero_Standard
    INNER JOIN Master.Hub_Unit_Header               AS hub ON dst.Hub_Unit_Header_ID = hub.Hub_Unit_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Enertia_Dim_Unit_Header_UID IS NOT NULL
        AND hub.Hub_Unit_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2247, 1, 84, 1, N'Match County', NULL, N'SELECT
    src.Enertia_Dim_Unit_Header_UID      AS UID_Left
   ,hub.Hub_Unit_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.County IS NULL THEN
                 0
             WHEN dst.County = src.County THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Enertia.Dim_Unit_Header                          AS src
    INNER JOIN Master_Staging.Enertia_Dim_Unit_Header AS pag ON src.Enertia_Dim_Unit_Header_UID = pag.Enertia_Dim_Unit_Header_UID
    FULL JOIN Master_Etl.Master_Unit_Header          AS dst ON dst.County = src.County
    INNER JOIN Master.Hub_Unit_Header               AS hub ON dst.Hub_Unit_Header_ID = hub.Hub_Unit_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Enertia_Dim_Unit_Header_UID IS NOT NULL
        AND hub.Hub_Unit_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2248, 1, 85, 1, N'Match Unit Name', NULL, N'SELECT
    src.SigmaFlow_Dim_Unit_Header_UID      AS UID_Left
   ,hub.Hub_Unit_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Unit_Name_Antero_Standard IS NULL THEN
                 0
             WHEN dst.Unit_Name_Antero_Standard = src.Unit_Name_Antero_Standard THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM SigmaFlow.Dim_Unit_Header                          AS src
    INNER JOIN Master_Staging.SigmaFlow_Dim_Unit_Header AS pag ON src.SigmaFlow_Dim_Unit_Header_UID = pag.SigmaFlow_Dim_Unit_Header_UID
    FULL JOIN Master_Etl.Master_Unit_Header          AS dst ON dst.Unit_Name_Antero_Standard = src.Unit_Name_Antero_Standard
    INNER JOIN Master.Hub_Unit_Header               AS hub ON dst.Hub_Unit_Header_ID = hub.Hub_Unit_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.SigmaFlow_Dim_Unit_Header_UID IS NOT NULL
        AND hub.Hub_Unit_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2249, 1, 85, 1, N'Match State Name', NULL, N'SELECT
    src.SigmaFlow_Dim_Unit_Header_UID      AS UID_Left
   ,hub.Hub_Unit_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.State_Name IS NULL THEN
                 0
             WHEN dst.State_Name = src.State_Name THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM SigmaFlow.Dim_Unit_Header                          AS src
    INNER JOIN Master_Staging.SigmaFlow_Dim_Unit_Header AS pag ON src.SigmaFlow_Dim_Unit_Header_UID = pag.SigmaFlow_Dim_Unit_Header_UID
    FULL JOIN Master_Etl.Master_Unit_Header          AS dst ON dst.State_Name = src.State_Name
    INNER JOIN Master.Hub_Unit_Header               AS hub ON dst.Hub_Unit_Header_ID = hub.Hub_Unit_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.SigmaFlow_Dim_Unit_Header_UID IS NOT NULL
        AND hub.Hub_Unit_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2250, 1, 86, 1, N'Match WSN', NULL, N'SELECT
    src.Petra_Dim_Well_Header_UID      AS UID_Left
   ,hub.Hub_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.WSN_Number IS NULL THEN
                 0
             WHEN dst.WSN_Number = src.WSN_Number THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Petra.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.Petra_Dim_Well_Header AS pag ON src.Petra_Dim_Well_Header_UID = pag.Petra_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Master_Well_Header          AS dst ON dst.WSN_Number = src.WSN_Number
    INNER JOIN Master.Hub_Well_Header               AS hub ON dst.Hub_Well_Header_ID = hub.Hub_Well_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Petra_Dim_Well_Header_UID IS NOT NULL
        AND hub.Hub_Well_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2251, 1, 86, 1, N'Match API Number', N'Master Petra', N'SELECT
    src.Petra_Dim_Well_Header_UID      AS UID_Left
   ,hub.Hub_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.API_Number IS NULL THEN
                 0
             WHEN dst.API_Number = src.API_Number THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Petra.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.Petra_Dim_Well_Header AS pag ON src.Petra_Dim_Well_Header_UID = pag.Petra_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Master_Well_Header          AS dst ON dst.API_Number = src.API_Number
    INNER JOIN Master.Hub_Well_Header               AS hub ON dst.Hub_Well_Header_ID = hub.Hub_Well_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Petra_Dim_Well_Header_UID IS NOT NULL
        AND hub.Hub_Well_Header_UID IS NOT NULL
    )', 'BIT', 0.6, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2252, 1, 86, 1, N'Match SEQNUM', N'Master Petra', N'SELECT
    src.Petra_Dim_Well_Header_UID      AS UID_Left
   ,hub.Hub_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.SEQNUM IS NULL THEN
                 0
             WHEN dst.SEQNUM = src.SEQNUM THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Petra.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.Petra_Dim_Well_Header AS pag ON src.Petra_Dim_Well_Header_UID = pag.Petra_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Master_Well_Header          AS dst ON dst.SEQNUM = src.SEQNUM
    INNER JOIN Master.Hub_Well_Header               AS hub ON dst.Hub_Well_Header_ID = hub.Hub_Well_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Petra_Dim_Well_Header_UID IS NOT NULL
        AND hub.Hub_Well_Header_UID IS NOT NULL
    )', 'BIT', 0.75, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2253, 1, 87, 1, N'Match API Number', N'Master Dimension Third', N'SELECT
    src.Odnr_Dim_Well_Header_UID      AS UID_Left
   ,hub.Master_Hub_Third_Party_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.API_Number IS NULL THEN
                 0
             WHEN dst.API_Number = src.API_Number THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Odnr.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.Odnr_Dim_Well_Header AS pag ON src.Odnr_Dim_Well_Header_UID = pag.Odnr_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Unified_Third_Party_Well_Header          AS dst ON dst.API_Number = src.API_Number
    INNER JOIN Master.Hub_Third_Party_Well_Header               AS hub ON dst.Master_Hub_Third_Party_Well_Header_ID = hub.Master_Hub_Third_Party_Well_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Odnr_Dim_Well_Header_UID IS NOT NULL
        AND hub.Master_Hub_Third_Party_Well_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2254, 1, 87, 1, N'Match Well Name', N'Master Dimension Third', N'SELECT
    src.Odnr_Dim_Well_Header_UID      AS UID_Left
   ,hub.Master_Hub_Third_Party_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Well_Name_Antero_Standard IS NULL THEN
                 0
             WHEN dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Odnr.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.Odnr_Dim_Well_Header AS pag ON src.Odnr_Dim_Well_Header_UID = pag.Odnr_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Unified_Third_Party_Well_Header          AS dst ON dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard
    INNER JOIN Master.Hub_Third_Party_Well_Header               AS hub ON dst.Master_Hub_Third_Party_Well_Header_ID = hub.Master_Hub_Third_Party_Well_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Odnr_Dim_Well_Header_UID IS NOT NULL
        AND hub.Master_Hub_Third_Party_Well_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2255, 1, 88, 1, N'Match API Number', N'Master Dimension Third', N'SELECT
    src.Pasda_Dim_Well_Header_UID      AS UID_Left
   ,hub.Master_Hub_Third_Party_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.API_Number IS NULL THEN
                 0
             WHEN dst.API_Number = src.API_Number THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Pasda.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.Pasda_Dim_Well_Header AS pag ON src.Pasda_Dim_Well_Header_UID = pag.Pasda_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Unified_Third_Party_Well_Header          AS dst ON dst.API_Number = src.API_Number
    INNER JOIN Master.Hub_Third_Party_Well_Header               AS hub ON dst.Master_Hub_Third_Party_Well_Header_ID = hub.Master_Hub_Third_Party_Well_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Pasda_Dim_Well_Header_UID IS NOT NULL
        AND hub.Master_Hub_Third_Party_Well_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2256, 1, 88, 1, N'Match Well Name', N'Master Dimension Third', N'SELECT
    src.Pasda_Dim_Well_Header_UID      AS UID_Left
   ,hub.Master_Hub_Third_Party_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Well_Name_Antero_Standard IS NULL THEN
                 0
             WHEN dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Pasda.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.Pasda_Dim_Well_Header AS pag ON src.Pasda_Dim_Well_Header_UID = pag.Pasda_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Unified_Third_Party_Well_Header          AS dst ON dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard
    INNER JOIN Master.Hub_Third_Party_Well_Header               AS hub ON dst.Master_Hub_Third_Party_Well_Header_ID = hub.Master_Hub_Third_Party_Well_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Pasda_Dim_Well_Header_UID IS NOT NULL
        AND hub.Master_Hub_Third_Party_Well_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2257, 1, 89, 1, N'Match API Number', N'Master Dimension Third', N'SELECT
    src.Petra_Dim_Well_Header_UID      AS UID_Left
   ,hub.Master_Hub_Third_Party_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.API_Number IS NULL THEN
                 0
             WHEN dst.API_Number = src.API_Number THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Petra.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.Petra_Dim_Well_Header AS pag ON src.Petra_Dim_Well_Header_UID = pag.Petra_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Unified_Third_Party_Well_Header          AS dst ON dst.API_Number = src.API_Number
    INNER JOIN Master.Hub_Third_Party_Well_Header               AS hub ON dst.Master_Hub_Third_Party_Well_Header_ID = hub.Master_Hub_Third_Party_Well_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Petra_Dim_Well_Header_UID IS NOT NULL
        AND hub.Master_Hub_Third_Party_Well_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2258, 1, 89, 1, N'Match WSN Number', N'Master Dimension Third', N'SELECT
    src.Petra_Dim_Well_Header_UID      AS UID_Left
   ,hub.Master_Hub_Third_Party_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.WSN_Number IS NULL THEN
                 0
             WHEN dst.WSN_Number = src.WSN_Number THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Petra.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.Petra_Dim_Well_Header AS pag ON src.Petra_Dim_Well_Header_UID = pag.Petra_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Unified_Third_Party_Well_Header          AS dst ON dst.WSN_Number = src.WSN_Number
    INNER JOIN Master.Hub_Third_Party_Well_Header               AS hub ON dst.Master_Hub_Third_Party_Well_Header_ID = hub.Master_Hub_Third_Party_Well_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Petra_Dim_Well_Header_UID IS NOT NULL
        AND hub.Master_Hub_Third_Party_Well_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2259, 1, 89, 1, N'Match SEQNUM', N'Master Dimension Third', N'SELECT
    src.Petra_Dim_Well_Header_UID      AS UID_Left
   ,hub.Master_Hub_Third_Party_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.SEQNUM IS NULL THEN
                 0
             WHEN dst.SEQNUM = src.SEQNUM THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Petra.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.Petra_Dim_Well_Header AS pag ON src.Petra_Dim_Well_Header_UID = pag.Petra_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Unified_Third_Party_Well_Header          AS dst ON dst.SEQNUM = src.SEQNUM
    INNER JOIN Master.Hub_Third_Party_Well_Header               AS hub ON dst.Master_Hub_Third_Party_Well_Header_ID = hub.Master_Hub_Third_Party_Well_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Petra_Dim_Well_Header_UID IS NOT NULL
        AND hub.Master_Hub_Third_Party_Well_Header_UID IS NOT NULL
    )', 'BIT', 0.95, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2260, 1, 90, 1, N'Match API Number', N'Master Dimension Third', N'SELECT
    src.Seneca_Dim_Well_Header_UID      AS UID_Left
   ,hub.Master_Hub_Third_Party_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.API_Number IS NULL THEN
                 0
             WHEN dst.API_Number = src.API_Number THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Seneca.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.Seneca_Dim_Well_Header AS pag ON src.Seneca_Dim_Well_Header_UID = pag.Seneca_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Unified_Third_Party_Well_Header          AS dst ON dst.API_Number = src.API_Number
    INNER JOIN Master.Hub_Third_Party_Well_Header               AS hub ON dst.Master_Hub_Third_Party_Well_Header_ID = hub.Master_Hub_Third_Party_Well_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Seneca_Dim_Well_Header_UID IS NOT NULL
        AND hub.Master_Hub_Third_Party_Well_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2261, 1, 90, 1, N'Match Well Name', N'Master Dimension Third', N'SELECT
    src.Seneca_Dim_Well_Header_UID      AS UID_Left
   ,hub.Master_Hub_Third_Party_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Well_Name_Antero_Standard IS NULL THEN
                 0
             WHEN dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Seneca.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.Seneca_Dim_Well_Header AS pag ON src.Seneca_Dim_Well_Header_UID = pag.Seneca_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Unified_Third_Party_Well_Header          AS dst ON dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard
    INNER JOIN Master.Hub_Third_Party_Well_Header               AS hub ON dst.Master_Hub_Third_Party_Well_Header_ID = hub.Master_Hub_Third_Party_Well_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Seneca_Dim_Well_Header_UID IS NOT NULL
        AND hub.Master_Hub_Third_Party_Well_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2262, 1, 91, 1, N'Match API Number', N'Master Dimension Third', N'SELECT
    src.Wvdep_Dim_Well_Header_UID      AS UID_Left
   ,hub.Master_Hub_Third_Party_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.API_Number IS NULL THEN
                 0
             WHEN dst.API_Number = src.API_Number THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Wvdep.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.Wvdep_Dim_Well_Header AS pag ON src.Wvdep_Dim_Well_Header_UID = pag.Wvdep_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Unified_Third_Party_Well_Header          AS dst ON dst.API_Number = src.API_Number
    INNER JOIN Master.Hub_Third_Party_Well_Header               AS hub ON dst.Master_Hub_Third_Party_Well_Header_ID = hub.Master_Hub_Third_Party_Well_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Wvdep_Dim_Well_Header_UID IS NOT NULL
        AND hub.Master_Hub_Third_Party_Well_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2263, 1, 91, 1, N'Match Well Name', N'Master Dimension Third', N'SELECT
    src.Wvdep_Dim_Well_Header_UID      AS UID_Left
   ,hub.Master_Hub_Third_Party_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Well_Name_Antero_Standard IS NULL THEN
                 0
             WHEN dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Wvdep.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.Wvdep_Dim_Well_Header AS pag ON src.Wvdep_Dim_Well_Header_UID = pag.Wvdep_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Unified_Third_Party_Well_Header          AS dst ON dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard
    INNER JOIN Master.Hub_Third_Party_Well_Header               AS hub ON dst.Master_Hub_Third_Party_Well_Header_ID = hub.Master_Hub_Third_Party_Well_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Wvdep_Dim_Well_Header_UID IS NOT NULL
        AND hub.Master_Hub_Third_Party_Well_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2264, 1, 92, 1, N'Match API Number', N'Dimension Third', N'SELECT 
      src.UID_Left AS UID_Left 
	 ,dst.Padep_Dim_Third_Party_Well_Header_UID AS UID_Right
     ,CAST(CASE
		       WHEN src.API_Number IS NULL
     			   OR dst.API_Number IS NULL THEN 
				   0 
			   WHEN src.API_Number = dst.API_Number THEN
                   1
			   ELSE 
				   0 
			   END AS BIT)             AS X 
   --,* 
FROM Staging.Padep_Dim_Third_Party_Well_Header      AS src
      FULL JOIN Padep.Dim_Third_Party_Well_Header AS dst ON dst.API_Number = ISNULL(src.API_Number, dst.API_Number)
	  WHERE
      (
			src.UID_Left IS NOT NULL
			AND dst.Padep_Dim_Third_Party_Well_Header_UID IS NOT NULL 
      )
      AND src.Processing_State = 1', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2265, 1, 92, 1, N'Match Farm Name Number', N'Dimension Third', N'SELECT
    src.UID_Left AS UID_Left
   ,dst.Padep_Dim_Third_Party_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Farm_Name_Well_Num IS NULL
                  OR dst.Farm_Name_Well_Num IS NULL THEN
                 0
             WHEN src.Farm_Name_Well_Num = dst.Farm_Name_Well_Num THEN
                 1
             ELSE
                 0
         END AS BIT)             AS X
   --,*
FROM Staging.Padep_Dim_Third_Party_Well_Header      AS src
    FULL JOIN Padep.Dim_Third_Party_Well_Header AS dst ON dst.Farm_Name_Well_Num = ISNULL(src.Farm_Name_Well_Num, dst.Farm_Name_Well_Num)
WHERE
    (
        src.UID_Left IS NOT NULL
        AND dst.Padep_Dim_Third_Party_Well_Header_UID IS NOT NULL
    )
    AND src.Processing_State = 1
	', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2266, 1, 93, 1, N'Match API Number', N'Master Dimension Third', N'SELECT
    src.Padep_Dim_Well_Header_UID      AS UID_Left
   ,hub.Master_Hub_Third_Party_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.API_Number IS NULL THEN
                 0
             WHEN dst.API_Number = src.API_Number THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Padep.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.Padep_Dim_Well_Header AS pag ON src.Padep_Dim_Well_Header_UID = pag.Padep_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Unified_Third_Party_Well_Header          AS dst ON dst.API_Number = src.API_Number
    INNER JOIN Master.Hub_Third_Party_Well_Header               AS hub ON dst.Master_Hub_Third_Party_Well_Header_ID = hub.Master_Hub_Third_Party_Well_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Padep_Dim_Well_Header_UID IS NOT NULL
        AND hub.Master_Hub_Third_Party_Well_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2267, 1, 93, 1, N'Match Farm Name Number', N'Master Dimension Third', N'	SELECT
    src.Padep_Dim_Third_Party_Well_Header_UID      AS UID_Left
   ,hub.Master_Hub_Third_Party_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Farm_Name_Well_Num IS NULL THEN
                 0
             WHEN dst.Farm_Name_Well_Num = src.Farm_Name_Well_Num THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Padep.Dim_Third_Party_Well_Header                          AS src
    INNER JOIN Master_Staging.Padep_Dim_Third_Party_Well_Header AS pag ON src.Padep_Dim_Third_Party_Well_Header_UID = pag.Padep_Dim_Third_Party_Well_Header_UID
    FULL JOIN Master_Etl.Unified_Third_Party_Well_Header          AS dst ON dst.Farm_Name_Well_Num = src.Farm_Name_Well_Num
    INNER JOIN Master.Hub_Third_Party_Well_Header               AS hub ON dst.Master_Hub_Third_Party_Well_Header_ID = hub.Master_Hub_Third_Party_Well_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Padep_Dim_Third_Party_Well_Header_UID IS NOT NULL
        AND hub.Master_Hub_Third_Party_Well_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2268, 1, 94, 1, N'Match API Number', N'Master Fact Third', N'SELECT
    src.Wvdep_Fact_Third_Party_Monthly_Well_Production_UID      AS UID_Left
   ,hub.Master_Hub_Third_Party_Monthly_Well_Production_UID AS UID_Right
   ,CAST(CASE
             WHEN src.API_Number IS NULL THEN
                 0
             WHEN dst.API_Number = src.API_Number THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Wvdep.Fact_Third_Party_Monthly_Well_Production                          AS src
    INNER JOIN Master_Staging.Wvdep_Fact_Third_Party_Monthly_Well_Production AS pag ON src.Wvdep_Fact_Third_Party_Monthly_Well_Production_UID = pag.Wvdep_Fact_Third_Party_Monthly_Well_Production_UID
    FULL JOIN Master_Etl.Unified_Third_Party_Monthly_Well_Production          AS dst ON dst.API_Number = src.API_Number
    INNER JOIN Master.Hub_Third_Party_Monthly_Well_Production               AS hub ON dst.Master_Hub_Third_Party_Monthly_Well_Production_ID = hub.Master_Hub_Third_Party_Monthly_Well_Production_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Wvdep_Fact_Third_Party_Monthly_Well_Production_UID IS NOT NULL
        AND hub.Master_Hub_Third_Party_Monthly_Well_Production_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2269, 1, 94, 1, N'Match Production Start Date', N'Master Fact Third', N'SELECT
    src.Wvdep_Fact_Third_Party_Monthly_Well_Production_UID      AS UID_Left
   ,hub.Master_Hub_Third_Party_Monthly_Well_Production_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Production_Start_Date IS NULL THEN
                 0
             WHEN dst.Production_Start_Date = src.Production_Start_Date THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Wvdep.Fact_Third_Party_Monthly_Well_Production                          AS src
    INNER JOIN Master_Staging.Wvdep_Fact_Third_Party_Monthly_Well_Production AS pag ON src.Wvdep_Fact_Third_Party_Monthly_Well_Production_UID = pag.Wvdep_Fact_Third_Party_Monthly_Well_Production_UID
    FULL JOIN Master_Etl.Unified_Third_Party_Monthly_Well_Production          AS dst ON dst.Production_Start_Date = src.Production_Start_Date
    INNER JOIN Master.Hub_Third_Party_Monthly_Well_Production               AS hub ON dst.Master_Hub_Third_Party_Monthly_Well_Production_ID = hub.Master_Hub_Third_Party_Monthly_Well_Production_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Wvdep_Fact_Third_Party_Monthly_Well_Production_UID IS NOT NULL
        AND hub.Master_Hub_Third_Party_Monthly_Well_Production_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2270, 1, 94, 1, N'Match Production End Date', N'Master Fact Third', N'SELECT
    src.Wvdep_Fact_Third_Party_Monthly_Well_Production_UID      AS UID_Left
   ,hub.Master_Hub_Third_Party_Monthly_Well_Production_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Production_End_Date IS NULL THEN
                 0
             WHEN dst.Production_End_Date = src.Production_End_Date THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Wvdep.Fact_Third_Party_Monthly_Well_Production                          AS src
    INNER JOIN Master_Staging.Wvdep_Fact_Third_Party_Monthly_Well_Production AS pag ON src.Wvdep_Fact_Third_Party_Monthly_Well_Production_UID = pag.Wvdep_Fact_Third_Party_Monthly_Well_Production_UID
    FULL JOIN Master_Etl.Unified_Third_Party_Monthly_Well_Production          AS dst ON dst.Production_End_Date = src.Production_End_Date
    INNER JOIN Master.Hub_Third_Party_Monthly_Well_Production               AS hub ON dst.Master_Hub_Third_Party_Monthly_Well_Production_ID = hub.Master_Hub_Third_Party_Monthly_Well_Production_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Wvdep_Fact_Third_Party_Monthly_Well_Production_UID IS NOT NULL
        AND hub.Master_Hub_Third_Party_Monthly_Well_Production_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2271, 1, 3, 1, N'Match County and State Name', NULL, N'SELECT
    src.UID_Left                 AS UID_Left
   ,dst.Aries_Dim_Pad_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN NULLIF( dst.State_Name, N'''') IS NULL
                  OR NULLIF( src.State_Name, N'''') IS NULL THEN
                 0
             WHEN  dst.State_Name =  src.State_Name THEN
                 1
             ELSE
                 0
         END AS BIT)             AS X
--,*
FROM Staging.Aries_Dim_Pad_Header  AS src
    FULL JOIN Aries.Dim_Pad_Header AS dst ON  dst.State_Name = ISNULL(NULLIF( src.State_Name, N''''), N''%'')
WHERE
    (
        src.UID_Left IS NOT NULL
        AND dst.Aries_Dim_Pad_Header_UID IS NOT NULL
    )
    AND src.Processing_State = 1
', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2272, 1, 62, 1, N'Match County and State Name', NULL, N'SELECT
    src.UID_Left                    AS UID_Left
   ,dst.WellView_Dim_Pad_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN NULLIF(dst.State_Name, N'''') IS NULL
                  OR NULLIF( src.State_Name, N'''') IS NULL THEN
                 0
             WHEN dst.State_Name =  src.State_Name THEN
                 1
             ELSE
                 0
         END AS BIT)                AS X
--,*
FROM Staging.WellView_Dim_Pad_Header  AS src
    FULL JOIN WellView.Dim_Pad_Header AS dst ON  dst.State_Name = ISNULL(NULLIF( src.State_Name, N''''), N''%'')
WHERE
    (
        src.UID_Left IS NOT NULL
        AND dst.WellView_Dim_Pad_Header_UID IS NOT NULL
    )
    AND src.Processing_State = 1', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2273, 1, 86, 1, N'Match Well Name', N'Master Petra', N'SELECT
    src.Petra_Dim_Well_Header_UID      AS UID_Left
   ,hub.Hub_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Well_Name_Antero_Standard IS NULL THEN
                 0
             WHEN dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Petra.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.Petra_Dim_Well_Header AS pag ON src.Petra_Dim_Well_Header_UID = pag.Petra_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Master_Well_Header          AS dst ON dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard
    INNER JOIN Master.Hub_Well_Header               AS hub ON dst.Hub_Well_Header_ID = hub.Hub_Well_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Petra_Dim_Well_Header_UID IS NOT NULL
        AND hub.Hub_Well_Header_UID IS NOT NULL
    )', 'BIT', 0.65, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2274, 1, 62, 1, N'Match Pad Code', NULL, N'SELECT
    src.UID_Left AS UID_Left
   ,dst.WellView_Dim_Pad_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Pad_Code IS NULL
                  OR dst.Pad_Code IS NULL THEN
                 0
             WHEN src.Pad_Code = dst.Pad_Code THEN
                 1
             ELSE
                 0
         END AS BIT)             AS X
   --,*
FROM Staging.WellView_Dim_Pad_Header      AS src
    FULL JOIN WellView.Dim_Pad_Header AS dst ON dst.Pad_Code = src.Pad_Code
WHERE
    (
        src.UID_Left IS NOT NULL
        AND dst.WellView_Dim_Pad_Header_UID IS NOT NULL
    )
    AND src.Processing_State = 1', 'BIT', 0, 0, 0, 0, 0, 1, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2275, 1, 95, 1, N'Match Pad Name', NULL, N'SELECT
    src.Aries_Dim_Pad_Header_UID      AS UID_Left
   ,hub.Hub_Pad_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Pad_Name_Antero_Standard IS NULL THEN
                 0
             WHEN dst.Pad_Name_Antero_Standard = src.Pad_Name_Antero_Standard THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Aries.Dim_Pad_Header                          AS src
    INNER JOIN Master_Staging.Aries_Dim_Pad_Header AS pag ON src.Aries_Dim_Pad_Header_UID = pag.Aries_Dim_Pad_Header_UID
    FULL JOIN Master_Etl.Master_Pad_Header          AS dst ON dst.Pad_Name_Antero_Standard = src.Pad_Name_Antero_Standard
    INNER JOIN Master.Hub_Pad_Header               AS hub ON dst.Hub_Pad_Header_ID = hub.Hub_Pad_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Aries_Dim_Pad_Header_UID IS NOT NULL
        AND hub.Hub_Pad_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2276, 1, 95, 2, N'Match Pad County and State', NULL, N'SELECT
    src.Aries_Dim_Pad_Header_UID      AS UID_Left
   ,hub.Hub_Pad_Header_UID AS UID_Right
   ,CAST(CASE
           when   src.State_Name IS NULL THEN
                 0
             WHEN dst.State_Name = src.State_Name THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Aries.Dim_Pad_Header                          AS src
    INNER JOIN Master_Staging.Aries_Dim_Pad_Header AS pag ON src.Aries_Dim_Pad_Header_UID = pag.Aries_Dim_Pad_Header_UID
    FULL JOIN Master_Etl.Master_Pad_Header          AS dst ON dst.State_Name = src.State_Name
    INNER JOIN Master.Hub_Pad_Header               AS hub ON dst.Hub_Pad_Header_ID = hub.Hub_Pad_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Aries_Dim_Pad_Header_UID IS NOT NULL
        AND hub.Hub_Pad_Header_UID IS NOT NULL
    )', 'BIT', 0, 0.1, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2277, 1, 96, 1, N'Match Pad Name', NULL, N'SELECT
    src.Merrick_Dim_Pad_Header_UID      AS UID_Left
   ,hub.Hub_Pad_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Pad_Name_Antero_Standard IS NULL THEN
                 0
             WHEN dst.Pad_Name_Antero_Standard = src.Pad_Name_Antero_Standard THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Merrick.Dim_Pad_Header                          AS src
    INNER JOIN Master_Staging.Merrick_Dim_Pad_Header AS pag ON src.Merrick_Dim_Pad_Header_UID = pag.Merrick_Dim_Pad_Header_UID
    FULL JOIN Master_Etl.Master_Pad_Header          AS dst ON dst.Pad_Name_Antero_Standard = src.Pad_Name_Antero_Standard
    INNER JOIN Master.Hub_Pad_Header               AS hub ON dst.Hub_Pad_Header_ID = hub.Hub_Pad_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Merrick_Dim_Pad_Header_UID IS NOT NULL
        AND hub.Hub_Pad_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2278, 1, 97, 1, N'Match Pad Name', NULL, N'SELECT
    src.WellView_Dim_Pad_Header_UID      AS UID_Left
   ,hub.Hub_Pad_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Pad_Name_Antero_Standard IS NULL THEN
                 0
             WHEN dst.Pad_Name_Antero_Standard = src.Pad_Name_Antero_Standard THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM WellView.Dim_Pad_Header                          AS src
    INNER JOIN Master_Staging.WellView_Dim_Pad_Header AS pag ON src.WellView_Dim_Pad_Header_UID = pag.WellView_Dim_Pad_Header_UID
    FULL JOIN Master_Etl.Master_Pad_Header          AS dst ON dst.Pad_Name_Antero_Standard = src.Pad_Name_Antero_Standard
    INNER JOIN Master.Hub_Pad_Header               AS hub ON dst.Hub_Pad_Header_ID = hub.Hub_Pad_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.WellView_Dim_Pad_Header_UID IS NOT NULL
        AND hub.Hub_Pad_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2279, 1, 97, 2, N'Match Pad County and State', NULL, N'SELECT
    src.WellView_Dim_Pad_Header_UID      AS UID_Left
   ,hub.Hub_Pad_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.State_Name IS NULL THEN
                 0
             WHEN dst.State_Name = src.State_Name THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM WellView.Dim_Pad_Header                          AS src
    INNER JOIN Master_Staging.WellView_Dim_Pad_Header AS pag ON src.WellView_Dim_Pad_Header_UID = pag.WellView_Dim_Pad_Header_UID
    FULL JOIN Master_Etl.Master_Pad_Header          AS dst ON dst.State_Name = src.State_Name
    INNER JOIN Master.Hub_Pad_Header               AS hub ON dst.Hub_Pad_Header_ID = hub.Hub_Pad_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.WellView_Dim_Pad_Header_UID IS NOT NULL
        AND hub.Hub_Pad_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2280, 1, 98, 2, N'Match Pad Name', NULL, N'SELECT
    src.Hub_Well_Header_UID AS UID_Left
   ,dst.Hub_Pad_Header_UID  AS UID_Right
   ,CAST(CASE
             WHEN src.Pad_Name_Antero_Standard IS NULL THEN
                 0
             WHEN dst.Pad_Name_Antero_Standard = src.Pad_Name_Antero_Standard THEN
                 1
             ELSE
                 0
         END AS BIT)        AS X
FROM
(
    SELECT
        hwh.Hub_Well_Header_UID
       ,swh.Pad_Name_Antero_Standard
    FROM Master.Hub_Well_Header           AS hwh
        INNER JOIN Master.Sat_Well_Header AS swh ON hwh.Hub_Well_Header_ID = swh.Hub_Well_Header_ID
    WHERE hwh.EDW_Is_Deleted = 0
)                                                             AS src
    INNER JOIN Master_Staging.Master_Sat_Well_Header_Link_Pad AS pag ON src.Hub_Well_Header_UID = pag.UID_Left
    FULL JOIN
    (
        SELECT
            hph.Hub_Pad_Header_UID
           ,sph.Pad_Name_Antero_Standard
        FROM Master.Hub_Pad_Header           AS hph
            INNER JOIN Master.Sat_Pad_Header AS sph ON hph.Hub_Pad_Header_ID = sph.Hub_Pad_Header_ID
        WHERE hph.EDW_Is_Deleted = 0
    )                                                         AS dst ON dst.Pad_Name_Antero_Standard = src.Pad_Name_Antero_Standard
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Hub_Well_Header_UID IS NOT NULL
        AND dst.Hub_Pad_Header_UID IS NOT NULL
    )', 'BIT', 0, 0.001, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2281, 1, 98, 2, N'Match Pad Name and Location', NULL, N'SELECT
    src.Hub_Well_Header_UID AS UID_Left
   ,dst.Hub_Pad_Header_UID  AS UID_Right
   ,CAST(CASE
             WHEN src.Pad_Name_Antero_Standard IS NULL
                  AND dst.Pad_Name_Antero_Standard IS NULL THEN
                 1
             WHEN src.Pad_Name_Antero_Standard = dst.Pad_Name_Antero_Standard THEN
                 1
             ELSE
                 0
         END AS BIT)        AS X
FROM
(
    SELECT
        hwh.Hub_Well_Header_UID
       ,swh.Pad_Name_Antero_Standard
       ,swh.Surface_Location_Shape
       ,swh.Surface_Location_Shape_StartPoint
    FROM Master.Hub_Well_Header           AS hwh
        INNER JOIN Master.Sat_Well_Header AS swh ON hwh.Hub_Well_Header_ID = swh.Hub_Well_Header_ID
    WHERE hwh.EDW_Is_Deleted = 0
)                                                             AS src
    INNER JOIN Master_Staging.Master_Sat_Well_Header_Link_Pad AS pag ON src.Hub_Well_Header_UID = pag.UID_Left
                                                                        AND pag.Processing_State = 1
    INNER JOIN -- Slight Performance Gain Over Full Join
    --FULL JOIN
    (
        SELECT
            hph.Hub_Pad_Header_UID
           ,sph.Pad_Name_Antero_Standard
           ,sph.Surface_Location_Shape
           ,sph.Surface_Location_Shape_Buffered_StartPoint AS Buffered_Surface_Location_Shape
        FROM Master.Hub_Pad_Header           AS hph
            INNER JOIN Master.Sat_Pad_Header AS sph ON hph.Hub_Pad_Header_ID = sph.Hub_Pad_Header_ID
        WHERE hph.EDW_Is_Deleted = 0
    )                                                         AS dst ON dst.Buffered_Surface_Location_Shape.STIntersects(src.Surface_Location_Shape_StartPoint) = 1
WHERE (
          src.Hub_Well_Header_UID IS NOT NULL
          AND dst.Hub_Pad_Header_UID IS NOT NULL
      )', 'BIT', 0, 0.001, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2282, 1, 99, 1, N'Match Unit Name', NULL, N'SELECT
    src.Hub_Well_Header_UID AS UID_Left
   ,dst.Hub_Unit_Header_UID  AS UID_Right
   ,CAST(CASE
             WHEN src.Unit_Name_Antero_Standard IS NULL THEN
                 0
             WHEN dst.Unit_Name_Antero_Standard = src.Unit_Name_Antero_Standard THEN
                 1
             ELSE
                 0
         END AS BIT)        AS X
FROM
(
    SELECT
        hwh.Hub_Well_Header_UID
       ,swh.Unit_Name_Antero_Standard
    FROM Master.Hub_Well_Header           AS hwh
        INNER JOIN Master.Sat_Well_Header AS swh ON hwh.Hub_Well_Header_ID = swh.Hub_Well_Header_ID
    WHERE hwh.EDW_Is_Deleted = 0
)                                                             AS src
    INNER JOIN Master_Staging.Master_Sat_Well_Header_Link_Unit AS pag ON src.Hub_Well_Header_UID = pag.UID_Left
    FULL JOIN
    (
        SELECT
            hph.Hub_Unit_Header_UID
           ,sph.Unit_Name_Antero_Standard
        FROM Master.Hub_Unit_Header           AS hph
            INNER JOIN Master.Sat_Unit_Header AS sph ON hph.Hub_Unit_Header_ID = sph.Hub_Unit_Header_ID
        WHERE hph.EDW_Is_Deleted = 0
    )                                                         AS dst ON dst.Unit_Name_Antero_Standard = src.Unit_Name_Antero_Standard
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Hub_Well_Header_UID IS NOT NULL
        AND dst.Hub_Unit_Header_UID IS NOT NULL
    )', 'BIT', 0, 0.001, 0, 0, 0, 1, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2283, 1, 99, 2, N'Match Unit County and State', NULL, N'SELECT
    src.Hub_Well_Header_UID AS UID_Left
   ,dst.Hub_Unit_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.County_State IS NULL THEN
                 0
             WHEN dst.County_State = src.County_State THEN
                 1
             ELSE
                 0
         END AS BIT)        AS X
FROM
(
    SELECT
        hwh.Hub_Well_Header_UID
       ,CONCAT(TRIM(swh.County), TRIM(swh.State_Name)) AS County_State
    FROM Master.Hub_Well_Header           AS hwh
        INNER JOIN Master.Sat_Well_Header AS swh ON hwh.Hub_Well_Header_ID = swh.Hub_Well_Header_ID
    WHERE hwh.EDW_Is_Deleted = 0
)                                                              AS src
    INNER JOIN Master_Staging.Master_Sat_Well_Header_Link_Unit AS pag ON src.Hub_Well_Header_UID = pag.UID_Left
    FULL JOIN
    (
        SELECT
            hph.Hub_Unit_Header_UID
           ,CONCAT(TRIM(sph.County), TRIM(sph.State_Name)) AS County_State
        FROM Master.Hub_Unit_Header           AS hph
            INNER JOIN Master.Sat_Unit_Header AS sph ON hph.Hub_Unit_Header_ID = sph.Hub_Unit_Header_ID
        WHERE hph.EDW_Is_Deleted = 0
    )                                                          AS dst ON dst.County_State = src.County_State
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Hub_Well_Header_UID IS NOT NULL
        AND dst.Hub_Unit_Header_UID IS NOT NULL
    )', 'BIT', 0, 0.5, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2284, 1, 8, 1, N'Match Well Name and SEQNUM', N'Fact Aries', N'SELECT src.UID_Left AS UID_Left,
       dst.Aries_Fact_Well_Header_UID AS UID_Right,
       CAST(CASE
                WHEN src.SEQNUM IS NULL OR dst.SEQNUM IS NULL THEN
                    0
                WHEN dst.SEQNUM = src.SEQNUM THEN
                    1
                ELSE
                    0
            END AS BIT) AS X
FROM Staging.Aries_Fact_Well_Header AS src
    FULL JOIN Aries.Fact_Well_Header AS dst
        ON dst.SEQNUM = src.SEQNUM WHERE (
          src.UID_Left IS NOT NULL
          AND dst.Aries_Fact_Well_Header_UID IS NOT NULL
      )
      AND src.Processing_State = 1;', 'BIT', 0.85, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2285, 1, 98, 1, N'Match Merrick Pad ID, County, and State', NULL, N'SELECT
    src.Hub_Well_Header_UID AS UID_Left
   ,dst.Hub_Pad_Header_UID  AS UID_Right
   ,CAST(CASE
             WHEN src.Pad_ID_County_State IS NULL THEN
                 0
             WHEN dst.Pad_ID_County_State = src.Pad_ID_County_State THEN
                 1
             ELSE
                 0
         END AS BIT)        AS X
FROM
(
    SELECT
        hwh.Hub_Well_Header_UID
       ,swh.Pad_ID
       ,NULLIF(RTRIM(LTRIM(CONCAT(swh.Pad_ID, swh.County, swh.State_Name))), '''') AS Pad_ID_County_State
    FROM Master.Hub_Well_Header                   AS hwh
        INNER JOIN Master.Sat_Well_Header_Merrick AS swh ON hwh.Hub_Well_Header_ID = swh.Hub_Well_Header_ID
                                                            AND swh.First_Production_Date IS NOT NULL
                                                            AND
                                                            (
                                                                swh.Current_Production_Status IS NOT NULL
                                                                AND swh.Current_Production_Status NOT IN
                                                                    (
                                                                        ''Abandoned''
                                                                       ,''Plugged and Abandoned''
                                                                       ,''Shut In''
                                                                       ,''Shut In: SIMOPS''
                                                                       ,''Temporarily Abandoned''
                                                                       ,''Waiting on Pipeline''
                                                                    )
                                                            )
    WHERE hwh.EDW_Is_Deleted = 0
)                                                             AS src
    INNER JOIN Master_Staging.Master_Sat_Well_Header_Link_Pad AS pag ON src.Hub_Well_Header_UID = pag.UID_Left
    FULL JOIN
    (
        SELECT
            hph.Hub_Pad_Header_UID
           ,sph.Pad_ID
           ,NULLIF(RTRIM(LTRIM(CONCAT(sph.Pad_ID, sph.County, sph.State_Name))), '''') AS Pad_ID_County_State
        FROM Master.Hub_Pad_Header                   AS hph
            INNER JOIN Master.Sat_Pad_Header_Merrick AS sph ON hph.Hub_Pad_Header_ID = sph.Hub_Pad_Header_ID
        WHERE hph.EDW_Is_Deleted = 0
    )                                                         AS dst ON dst.Pad_ID_County_State = src.Pad_ID_County_State
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Hub_Well_Header_UID IS NOT NULL
        AND dst.Hub_Pad_Header_UID IS NOT NULL
    )
', 'BIT', 0, 0, 0, 0, 0, 1, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2286, 1, 86, 1, N'Match Petra_ID', NULL, N'SELECT
    src.Petra_Dim_Well_Header_UID      AS UID_Left
   ,hub.Hub_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Petra_ID IS NULL THEN
                 0
             WHEN dst.Petra_ID = src.Petra_ID THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Petra.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.Petra_Dim_Well_Header AS pag ON src.Petra_Dim_Well_Header_UID = pag.Petra_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Master_Well_Header          AS dst ON dst.Petra_ID = src.Petra_ID
    INNER JOIN Master.Hub_Well_Header               AS hub ON dst.Hub_Well_Header_ID = hub.Hub_Well_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Petra_Dim_Well_Header_UID IS NOT NULL
        AND hub.Hub_Well_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 1, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2287, 1, 49, 2, N'Match Petra_ID', NULL, N'SELECT
    src.UID_Left                  AS UID_Left
   ,dst.Petra_Dim_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Petra_ID IS NULL
                  OR dst.Petra_ID IS NULL THEN
                 0
             WHEN src.Petra_ID = dst.Petra_ID THEN
                 1
             ELSE
                 0
         END AS BIT)              AS X
--,*
FROM Staging.Petra_Dim_Well_Header  AS src
    FULL JOIN Petra.Dim_Well_Header AS dst ON dst.Petra_ID = src.Petra_ID
WHERE
    (
        src.UID_Left IS NOT NULL
        AND dst.Petra_Dim_Well_Header_UID IS NOT NULL
    )
    AND src.Processing_State = 1
', 'BIT', 0, 0, 0, 0, 0, 1, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2288, 1, 2, 1, N'Match Aries_ID', NULL, N'SELECT
    src.Aries_Dim_Well_Header_UID      AS UID_Left
   ,hub.Hub_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Aries_ID IS NULL THEN
                 0
             WHEN dst.Aries_ID = src.Aries_ID THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Aries.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.Aries_Dim_Well_Header AS pag ON src.Aries_Dim_Well_Header_UID = pag.Aries_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Master_Well_Header          AS dst ON dst.Aries_ID = src.Aries_ID
    INNER JOIN Master.Hub_Well_Header               AS hub ON dst.Hub_Well_Header_ID = hub.Hub_Well_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Aries_Dim_Well_Header_UID IS NOT NULL
        AND hub.Hub_Well_Header_UID IS NOT NULL
    )
--ORDER BY
--    src.Aries_Dim_Well_Header_UID
--   ,map.Master_Etl_Well_Header_Map_UID
', 'BIT', 0, 0, 0, 0, 0, 1, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2289, 1, 96, 1, N'Match County, State Name', NULL, N'SELECT
    src.Merrick_Dim_Pad_Header_UID AS UID_Left
   ,hub.Hub_Pad_Header_UID         AS UID_Right
   ,CAST(CASE
             WHEN NULLIF( src.State_Name, '''') IS NULL THEN
                 0
             WHEN  dst.State_Name =  src.State_Name THEN
                 1
             ELSE
                 0
         END AS BIT)               AS X
FROM Merrick.Dim_Pad_Header                          AS src
    INNER JOIN Master_Staging.Merrick_Dim_Pad_Header AS pag ON src.Merrick_Dim_Pad_Header_UID = pag.Merrick_Dim_Pad_Header_UID
    FULL JOIN Master_Etl.Master_Pad_Header           AS dst ON dst.State_Name = src.State_Name
    INNER JOIN Master.Hub_Pad_Header                 AS hub ON dst.Hub_Pad_Header_ID = hub.Hub_Pad_Header_ID
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Merrick_Dim_Pad_Header_UID IS NOT NULL
        AND hub.Hub_Pad_Header_UID IS NOT NULL
    )

', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2290, 1, 102, 1, N'Match Well Name', N'Fact Third', N'SELECT
       src.UID_Left AS UID_Left
      ,dst.Odnr_Fact_Third_Party_Well_Header_UID AS UID_Right
      ,CAST(CASE
                WHEN src.Well_Name_Antero_Standard IS NULL THEN
                    0
                WHEN dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard THEN
                    1
                ELSE
                    0
            END AS BIT)    AS X
FROM Staging.Odnr_Fact_Third_Party_Well_Header        AS src
    FULL JOIN Odnr.Fact_Third_Party_Well_Header AS dst ON 
		dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard
		-- dst.Well_Name_Antero_Standard LIKE ISNULL(src.Well_Name_Antero_Standard , ''%'')
WHERE
    src.Processing_State = 1
    AND
    (
        src.UID_Left IS NOT NULL
        AND dst.Odnr_Fact_Third_Party_Well_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2291, 1, 71, 1, N'Match Well Name and Number', N'Dimension Third', N'SELECT
    src.UID_Left AS UID_Left
   ,dst.Wvdep_Dim_Third_Party_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN NULLIF(CONCAT(src.Well_Name_Antero_Standard,src.Well_Number),N'''') IS NULL
                  OR NULLIF(CONCAT(dst.Well_Name_Antero_Standard,dst.Well_Number),N'''') IS NULL THEN
                 0
             WHEN NULLIF(CONCAT(src.Well_Name_Antero_Standard,src.Well_Number),N'''') = NULLIF(CONCAT(dst.Well_Name_Antero_Standard,dst.Well_Number),N'''') THEN
                 1
             ELSE
                 0
         END AS BIT)             AS X
   --,*
FROM Staging.Wvdep_Dim_Third_Party_Well_Header      AS src
    INNER JOIN Wvdep.Dim_Third_Party_Well_Header AS dst ON NULLIF(CONCAT(dst.Well_Name_Antero_Standard,dst.Well_Number),N'''') = NULLIF(CONCAT(src.Well_Name_Antero_Standard,src.Well_Number),N'''')
WHERE
  (
        src.UID_Left IS NOT NULL
        AND dst.Wvdep_Dim_Third_Party_Well_Header_UID IS NOT NULL
    )
   and src.Processing_State = 1', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2292, 1, 71, 1, N'Match API Number', N'Dimension Third', N'SELECT
    src.UID_Left AS UID_Left
   ,dst.Wvdep_Dim_Third_Party_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.API_Number IS NULL
                  OR dst.API_Number IS NULL THEN
                 0
             WHEN src.API_Number = dst.API_Number THEN
                 1
             ELSE
                 0
         END AS BIT)             AS X
   --,*
FROM Staging.Wvdep_Dim_Third_Party_Well_Header      AS src
    INNER JOIN Wvdep.Dim_Third_Party_Well_Header AS dst ON dst.API_Number = src.API_Number
WHERE
(
        src.UID_Left IS NOT NULL
        AND dst.Wvdep_Dim_Third_Party_Well_Header_UID IS NOT NULL
    )
   and src.Processing_State = 1', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2293, 1, 103, 1, N'Match API Number', N'Fact Third', N'SELECT
    src.UID_Left AS UID_Left
   ,dst.Wvdep_Fact_Third_Party_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Well_Number IS NULL
                  OR dst.Well_Number IS NULL THEN
                 0
             WHEN src.Well_Number = dst.Well_Number THEN
                 1
             ELSE
                 0
         END AS BIT)             AS X
   --,*
FROM Staging.Wvdep_Fact_Third_Party_Well_Header      AS src
    FULL JOIN Wvdep.Fact_Third_Party_Well_Header AS dst ON dst.Well_Number = ISNULL(src.Well_Number, dst.Well_Number)
WHERE
    (
        src.UID_Left IS NOT NULL
        AND dst.Wvdep_Fact_Third_Party_Well_Header_UID IS NOT NULL
    )
    AND src.Processing_State = 1', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2294, 1, 103, 1, N'Match Well Name', N'Fact Third', N'SELECT
    src.UID_Left AS UID_Left
   ,dst.Wvdep_Fact_Third_Party_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.API_Number IS NULL
                  OR dst.API_Number IS NULL THEN
                 0
             WHEN src.API_Number = dst.API_Number THEN
                 1
             ELSE
                 0
         END AS BIT)             AS X
   --,*
FROM Staging.Wvdep_Fact_Third_Party_Well_Header      AS src
    INNER JOIN Wvdep.Fact_Third_Party_Well_Header AS dst ON dst.API_Number = src.API_Number
WHERE
(
        src.UID_Left IS NOT NULL
        AND dst.Wvdep_Fact_Third_Party_Well_Header_UID IS NOT NULL
    )
   and src.Processing_State = 1', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2295, 1, 103, 1, N'Match Well Number', N'Fact Third', N'SELECT
    src.UID_Left AS UID_Left
   ,dst.Wvdep_Fact_Third_Party_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Well_Number IS NULL
                  OR dst.Well_Number IS NULL THEN
                 0
             WHEN src.Well_Number = dst.Well_Number THEN
                 1
             ELSE
                 0
         END AS BIT)             AS X
   --,*
FROM Staging.Wvdep_Fact_Third_Party_Well_Header      AS src
    FULL JOIN Wvdep.Fact_Third_Party_Well_Header AS dst ON dst.Well_Number = ISNULL(src.Well_Number, dst.Well_Number)
WHERE
    (
        src.UID_Left IS NOT NULL
        AND dst.Wvdep_Fact_Third_Party_Well_Header_UID IS NOT NULL
    )
    AND src.Processing_State = 1', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2296, 1, 104, 1, N'Match API Number', N'Dimension Third', N'SELECT
    src.UID_Left AS UID_Left
   ,dst.Enerdeq_Dim_Third_Party_Wellbore_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.API12 IS NULL
                  OR dst.API12 IS NULL THEN
                 0
             WHEN src.API12 = dst.API12 THEN
                 1
             ELSE
                 0
         END AS BIT)             AS X
   --,*
FROM Staging.Enerdeq_Dim_Third_Party_Wellbore_Header      AS src
    FULL JOIN Enerdeq.Dim_Third_Party_Wellbore_Header AS dst ON dst.API12 = src.API12
WHERE
    (
        src.UID_Left IS NOT NULL
        AND dst.Enerdeq_Dim_Third_Party_Wellbore_Header_UID IS NOT NULL
    )
    AND src.Processing_State = 1', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2297, 1, 104, 1, N'Match Well Name, State, And County', N'Dimension Third', N'SELECT
    src.UID_Left AS UID_Left
   ,dst.Enerdeq_Dim_Third_Party_Wellbore_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN NULLIF(CONCAT(src.Well_Name,src.County_Name,src.State_Name),N'''') IS NULL
                  OR NULLIF(CONCAT(dst.Well_Name,dst.County_Name,dst.State_Name),N'''') IS NULL THEN
                 0
             WHEN CONCAT(src.Well_Name,src.County_Name,src.State_Name) = CONCAT(dst.Well_Name,dst.County_Name,dst.State_Name) THEN
                 1
             ELSE
                 0
         END AS BIT)             AS X
   --,*
FROM Staging.Enerdeq_Dim_Third_Party_Wellbore_Header      AS src
    FULL JOIN Enerdeq.Dim_Third_Party_Wellbore_Header AS dst ON CONCAT(dst.Well_Name,dst.County_Name,dst.State_Name)= ISNULL(NULLIF(CONCAT(src.Well_Name,src.County_Name,src.State_Name),N''''),N''%'')
WHERE
    (
        src.UID_Left IS NOT NULL
        AND dst.Enerdeq_Dim_Third_Party_Wellbore_Header_UID IS NOT NULL
    )
    AND src.Processing_State = 1', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2298, 1, 105, 1, N'Match API Number', N'Fact Third', N'SELECT
    src.UID_Left AS UID_Left
   ,dst.Enerdeq_Fact_Third_Party_Wellbore_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.API12 IS NULL
                  OR dst.API12 IS NULL THEN
                 0
             WHEN src.API12 = dst.API12 THEN
                 1
             ELSE
                 0
         END AS BIT)             AS X
   --,*
FROM Staging.Enerdeq_Fact_Third_Party_Wellbore_Header      AS src
    FULL JOIN Enerdeq.Fact_Third_Party_Wellbore_Header AS dst ON dst.API12 = src.API12
WHERE
    (
        src.UID_Left IS NOT NULL
        AND dst.Enerdeq_Fact_Third_Party_Wellbore_Header_UID IS NOT NULL
    )
    AND src.Processing_State = 1', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2299, 1, 105, 1, N'Match Well Name', N'Fact Third', N'SELECT
    src.UID_Left AS UID_Left
   ,dst.Enerdeq_Fact_Third_Party_Wellbore_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN NULLIF(CONCAT(src.Well_Name_Antero_Standard,src.County_Name,src.State_Name),N'''') IS NULL
                  OR NULLIF(CONCAT(dst.Well_Name_Antero_Standard,dst.County_Name,dst.State_Name),N'''') IS NULL THEN
                 0
             WHEN CONCAT(src.Well_Name_Antero_Standard,src.County_Name,src.State_Name) = CONCAT(dst.Well_Name_Antero_Standard,dst.County_Name,dst.State_Name) THEN
                 1
             ELSE
                 0
         END AS BIT)             AS X
   --,*
FROM Staging.Enerdeq_Fact_Third_Party_Wellbore_Header      AS src
    FULL JOIN Enerdeq.Fact_Third_Party_Wellbore_Header AS dst ON CONCAT(dst.Well_Name_Antero_Standard,dst.County_Name,dst.State_Name)= ISNULL(NULLIF(CONCAT(src.Well_Name_Antero_Standard,src.County_Name,src.State_Name),N''''),N''%'')
WHERE
    (
        src.UID_Left IS NOT NULL
        AND dst.Enerdeq_Fact_Third_Party_Wellbore_Header_UID IS NOT NULL
    )
    AND src.Processing_State = 1
	', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2300, 1, 106, 1, N'Match API Number', N'Dimension Third', N'SELECT
    src.UID_Left AS UID_Left
   ,dst.Enerdeq_Dim_Third_Party_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.API10 IS NULL
                  OR dst.API10 IS NULL THEN
                 0
             WHEN src.API10 = dst.API10 THEN
                 1
             ELSE
                 0
         END AS BIT)             AS X
   --,*
FROM Staging.Enerdeq_Dim_Third_Party_Well_Header      AS src
    FULL JOIN Enerdeq.Dim_Third_Party_Well_Header AS dst ON dst.API10 = src.API10
WHERE
    (
        src.UID_Left IS NOT NULL
        AND dst.Enerdeq_Dim_Third_Party_Well_Header_UID IS NOT NULL
    )
    AND src.Processing_State = 1', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2301, 1, 106, 1, N'Match Well Name', N'Dimension Third', N'SELECT
    src.UID_Left AS UID_Left
   ,dst.Enerdeq_Dim_Third_Party_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN NULLIF(CONCAT(src.Well_Name,src.County_Name,src.State_Name),N'''') IS NULL
                  OR NULLIF(CONCAT(dst.Well_Name,dst.County_Name,dst.State_Name),N'''') IS NULL THEN
                 0
             WHEN CONCAT(src.Well_Name,src.County_Name,src.State_Name) = CONCAT(dst.Well_Name,dst.County_Name,dst.State_Name) THEN
                 1
             ELSE
                 0
         END AS BIT)             AS X
   --,*
FROM Staging.Enerdeq_Dim_Third_Party_Well_Header      AS src
    FULL JOIN Enerdeq.Dim_Third_Party_Well_Header AS dst ON CONCAT(dst.Well_Name,dst.County_Name,dst.State_Name)= ISNULL(NULLIF(CONCAT(src.Well_Name,src.County_Name,src.State_Name),N''''),N''%'')
WHERE
    (
        src.UID_Left IS NOT NULL
        AND dst.Enerdeq_Dim_Third_Party_Well_Header_UID IS NOT NULL
    )
    AND src.Processing_State = 1', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2302, 1, 107, 1, N'Match API Number', N'Fact Third', N'SELECT
    src.UID_Left AS UID_Left
   ,dst.Enerdeq_Fact_Third_Party_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.API10 IS NULL
                  OR dst.API10 IS NULL THEN
                 0
             WHEN src.API10 = dst.API10 THEN
                 1
             ELSE
                 0
         END AS BIT)             AS X
   --,*
FROM Staging.Enerdeq_Fact_Third_Party_Well_Header      AS src
    FULL JOIN Enerdeq.Fact_Third_Party_Well_Header AS dst ON dst.API10 = src.API10
WHERE
    (
        src.UID_Left IS NOT NULL
        AND dst.Enerdeq_Fact_Third_Party_Well_Header_UID IS NOT NULL
    )
    AND src.Processing_State = 1', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2303, 1, 107, 1, N'Match Well Name, State, And County', N'Fact Third', N'SELECT
    src.UID_Left AS UID_Left
   ,dst.Enerdeq_Fact_Third_Party_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN NULLIF(CONCAT(src.Well_Name_Antero_Standard,src.County_Name,src.State_Name),N'''') IS NULL
                  OR NULLIF(CONCAT(dst.Well_Name_Antero_Standard,dst.County_Name,dst.State_Name),N'''') IS NULL THEN
                 0
             WHEN CONCAT(src.Well_Name_Antero_Standard,src.County_Name,src.State_Name) = CONCAT(dst.Well_Name_Antero_Standard,dst.County_Name,dst.State_Name) THEN
                 1
             ELSE
                 0
         END AS BIT)             AS X
   --,*
FROM Staging.Enerdeq_Fact_Third_Party_Well_Header      AS src
    FULL JOIN Enerdeq.Fact_Third_Party_Well_Header AS dst ON CONCAT(dst.Well_Name_Antero_Standard,dst.County_Name,dst.State_Name)= ISNULL(NULLIF(CONCAT(src.Well_Name_Antero_Standard,src.County_Name,src.State_Name),N''''),N''%'')
WHERE
    (
        src.UID_Left IS NOT NULL
        AND dst.Enerdeq_Fact_Third_Party_Well_Header_UID IS NOT NULL
    )
    AND src.Processing_State = 1
	', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2304, 1, 108, 1, N'Match Wellbore Key', N'Dimension Third', N'SELECT
    src.UID_Left AS UID_Left
   ,dst.Petra_Dim_Third_Party_Wellbore_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Wellbore_Key IS NULL
                  OR dst.Wellbore_Key IS NULL THEN
                 0
             WHEN src.Wellbore_Key = dst.Wellbore_Key THEN
                 1
             ELSE
                 0
         END AS BIT)             AS X
   --,*
FROM Staging.Petra_Dim_Third_Party_Wellbore_Header      AS src
    FULL JOIN Petra.Dim_Third_Party_Wellbore_Header AS dst ON dst.Wellbore_Key = src.Wellbore_Key
WHERE
    (
        src.UID_Left IS NOT NULL
        AND dst.Petra_Dim_Third_Party_Wellbore_Header_UID IS NOT NULL
    )
    AND src.Processing_State = 1', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2305, 1, 108, 1, N'Match Wellbore Name', N'Dimension Third', N'SELECT
       src.UID_Left AS UID_Left
      ,dst.Petra_Dim_Third_Party_Wellbore_Header_UID AS UID_Right
      ,CAST(CASE
                WHEN src.Wellbore_Name_Antero_Standard IS NULL THEN
                    0
                WHEN dst.Wellbore_Name_Antero_Standard = src.Wellbore_Name_Antero_Standard THEN
                    1
                ELSE
                    0
            END AS BIT)    AS X
FROM Staging.Petra_Dim_Third_Party_Wellbore_Header        AS src
    FULL JOIN Petra.Dim_Third_Party_Wellbore_Header AS dst ON 
		dst.Wellbore_Name_Antero_Standard = src.Wellbore_Name_Antero_Standard
		-- dst.Wellbore_Name_Antero_Standard LIKE ISNULL(src.Wellbore_Name_Antero_Standard , ''%'')
WHERE
    src.Processing_State = 1
    AND
    (
        src.UID_Left IS NOT NULL
        AND dst.Petra_Dim_Third_Party_Wellbore_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2306, 1, 109, 1, N'Match Wellbore Key', N'Fact Third', N'SELECT
    src.UID_Left AS UID_Left
   ,dst.Petra_Fact_Third_Party_Wellbore_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Wellbore_Key IS NULL
                  OR dst.Wellbore_Key IS NULL THEN
                 0
             WHEN src.Wellbore_Key = dst.Wellbore_Key THEN
                 1
             ELSE
                 0
         END AS BIT)             AS X
   --,*
FROM Staging.Petra_Fact_Third_Party_Wellbore_Header      AS src
    FULL JOIN Petra.Fact_Third_Party_Wellbore_Header AS dst ON dst.Wellbore_Key = src.Wellbore_Key
WHERE
    (
        src.UID_Left IS NOT NULL
        AND dst.Petra_Fact_Third_Party_Wellbore_Header_UID IS NOT NULL
    )
    AND src.Processing_State = 1', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2307, 1, 109, 1, N'Match Wellbore Name', N'Fact Third', N'SELECT
       src.UID_Left AS UID_Left
      ,dst.Petra_Fact_Third_Party_Wellbore_Header_UID AS UID_Right
      ,CAST(CASE
                WHEN src.Wellbore_Name_Antero_Standard IS NULL THEN
                    0
                WHEN dst.Wellbore_Name_Antero_Standard = src.Wellbore_Name_Antero_Standard THEN
                    1
                ELSE
                    0
            END AS BIT)    AS X
FROM Staging.Petra_Fact_Third_Party_Wellbore_Header        AS src
    FULL JOIN Petra.Fact_Third_Party_Wellbore_Header AS dst ON 
		dst.Wellbore_Name_Antero_Standard = src.Wellbore_Name_Antero_Standard
		-- dst.Wellbore_Name_Antero_Standard LIKE ISNULL(src.Wellbore_Name_Antero_Standard , ''%'')
WHERE
    src.Processing_State = 1
    AND
    (
        src.UID_Left IS NOT NULL
        AND dst.Petra_Fact_Third_Party_Wellbore_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2308, 1, 110, 1, N'Match Well Key', N'Dimension Third', N'SELECT
    src.UID_Left AS UID_Left
   ,dst.Petra_Dim_Third_Party_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Well_Key IS NULL
                  OR dst.Well_Key IS NULL THEN
                 0
             WHEN src.Well_Key = dst.Well_Key THEN
                 1
             ELSE
                 0
         END AS BIT)             AS X
   --,*
FROM Staging.Petra_Dim_Third_Party_Well_Header      AS src
    FULL JOIN Petra.Dim_Third_Party_Well_Header AS dst ON dst.Well_Key = src.Well_Key
WHERE
    (
        src.UID_Left IS NOT NULL
        AND dst.Petra_Dim_Third_Party_Well_Header_UID IS NOT NULL
    )
    AND src.Processing_State = 1', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2309, 1, 110, 1, N'Match Well Name', N'Dimension Third', N'SELECT
       src.UID_Left AS UID_Left
      ,dst.Petra_Dim_Third_Party_Well_Header_UID AS UID_Right
      ,CAST(CASE
                WHEN src.Well_Name_Antero_Standard IS NULL THEN
                    0
                WHEN dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard THEN
                    1
                ELSE
                    0
            END AS BIT)    AS X
FROM Staging.Petra_Dim_Third_Party_Well_Header        AS src
    FULL JOIN Petra.Dim_Third_Party_Well_Header AS dst ON 
		dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard
		-- dst.Well_Name_Antero_Standard LIKE ISNULL(src.Well_Name_Antero_Standard , ''%'')
WHERE
    src.Processing_State = 1
    AND
    (
        src.UID_Left IS NOT NULL
        AND dst.Petra_Dim_Third_Party_Well_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2310, 1, 111, 1, N'Match Well Key', N'Fact Third', N'SELECT
    src.UID_Left AS UID_Left
   ,dst.Petra_Fact_Third_Party_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Well_Key IS NULL
                  OR dst.Well_Key IS NULL THEN
                 0
             WHEN src.Well_Key = dst.Well_Key THEN
                 1
             ELSE
                 0
         END AS BIT)             AS X
   --,*
FROM Staging.Petra_Fact_Third_Party_Well_Header      AS src
    FULL JOIN Petra.Fact_Third_Party_Well_Header AS dst ON dst.Well_Key = src.Well_Key
WHERE
    (
        src.UID_Left IS NOT NULL
        AND dst.Petra_Fact_Third_Party_Well_Header_UID IS NOT NULL
    )
    AND src.Processing_State = 1', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2311, 1, 111, 1, N'Match Well Name', N'Fact Third', N'SELECT
       src.UID_Left AS UID_Left
      ,dst.Petra_Fact_Third_Party_Well_Header_UID AS UID_Right
      ,CAST(CASE
                WHEN src.Well_Name_Antero_Standard IS NULL THEN
                    0
                WHEN dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard THEN
                    1
                ELSE
                    0
            END AS BIT)    AS X
FROM Staging.Petra_Fact_Third_Party_Well_Header        AS src
    FULL JOIN Petra.Fact_Third_Party_Well_Header AS dst ON 
		dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard
		-- dst.Well_Name_Antero_Standard LIKE ISNULL(src.Well_Name_Antero_Standard , ''%'')
WHERE
    src.Processing_State = 1
    AND
    (
        src.UID_Left IS NOT NULL
        AND dst.Petra_Fact_Third_Party_Well_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2312, 1, 100, 1, N'Match API Number', N'Fact Third', N'SELECT
       src.UID_Left AS UID_Left
      ,dst.Pasda_Fact_Third_Party_Well_Header_UID AS UID_Right
      ,CAST(CASE
                WHEN src.API_Number IS NULL THEN
                    0
                WHEN dst.API_Number = src.API_Number THEN
                    1
                ELSE
                    0
            END AS BIT)    AS X
FROM Staging.Pasda_Fact_Third_Party_Well_Header        AS src
    FULL JOIN Pasda.Fact_Third_Party_Well_Header AS dst ON 
		dst.API_Number = src.API_Number
		-- dst.API_Number LIKE ISNULL(src.API_Number , ''%'')
WHERE
    src.Processing_State = 1
    AND
    (
        src.UID_Left IS NOT NULL
        AND dst.Pasda_Fact_Third_Party_Well_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2313, 1, 100, 1, N'Match Well Name', N'Fact Third', N'SELECT
       src.UID_Left AS UID_Left
      ,dst.Pasda_Fact_Third_Party_Well_Header_UID AS UID_Right
      ,CAST(CASE
                WHEN src.Well_Name_Antero_Standard IS NULL THEN
                    0
                WHEN dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard THEN
                    1
                ELSE
                    0
            END AS BIT)    AS X
FROM Staging.Pasda_Fact_Third_Party_Well_Header        AS src
    FULL JOIN Pasda.Fact_Third_Party_Well_Header AS dst ON 
		dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard
		-- dst.Well_Name_Antero_Standard LIKE ISNULL(src.Well_Name_Antero_Standard , ''%'')
WHERE
    src.Processing_State = 1
    AND
    (
        src.UID_Left IS NOT NULL
        AND dst.Pasda_Fact_Third_Party_Well_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2314, 1, 101, 1, N'Match API Number', N'Fact Third', N'SELECT
       src.UID_Left AS UID_Left
      ,dst.Seneca_Fact_Third_Party_Well_Header_UID AS UID_Right
      ,CAST(CASE
                WHEN src.API_Number IS NULL THEN
                    0
                WHEN dst.API_Number = src.API_Number THEN
                    1
                ELSE
                    0
            END AS BIT)    AS X
FROM Staging.Seneca_Fact_Third_Party_Well_Header        AS src
    FULL JOIN Seneca.Fact_Third_Party_Well_Header AS dst ON 
		dst.API_Number = src.API_Number
		-- dst.API_Number LIKE ISNULL(src.API_Number , ''%'')
WHERE
    src.Processing_State = 1
    AND
    (
        src.UID_Left IS NOT NULL
        AND dst.Seneca_Fact_Third_Party_Well_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2315, 1, 101, 1, N'Match Well Name', N'Fact Third', N'SELECT
       src.UID_Left AS UID_Left
      ,dst.Seneca_Fact_Third_Party_Well_Header_UID AS UID_Right
      ,CAST(CASE
                WHEN src.Well_Name_Antero_Standard IS NULL THEN
                    0
                WHEN dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard THEN
                    1
                ELSE
                    0
            END AS BIT)    AS X
FROM Staging.Seneca_Fact_Third_Party_Well_Header        AS src
    FULL JOIN Seneca.Fact_Third_Party_Well_Header AS dst ON 
		dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard
		-- dst.Well_Name_Antero_Standard LIKE ISNULL(src.Well_Name_Antero_Standard , ''%'')
WHERE
    src.Processing_State = 1
    AND
    (
        src.UID_Left IS NOT NULL
        AND dst.Seneca_Fact_Third_Party_Well_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2316, 1, 102, 1, N'Match API Number', N'Fact Third', N'SELECT         
	   src.UID_Left AS UID_Left        
	  ,dst.Odnr_Fact_Third_Party_Well_Header_UID AS UID_Right        
	  ,CAST(CASE                  
			    WHEN src.API_Number IS NULL THEN                      
					0                  
				WHEN dst.API_Number = src.API_Number THEN                     
					1                  
				ELSE                      
					0              
		    END AS BIT)    AS X  
FROM Staging.Odnr_Fact_Third_Party_Well_Header        AS src
      FULL JOIN Odnr.Fact_Third_Party_Well_Header AS dst ON
	  dst.API_Number = src.API_Number 
	  -- dst.API_Number LIKE ISNULL(src.API_Number , ''%'')  
WHERE
      src.Processing_State = 1
      AND
      (
	  src.UID_Left IS NOT NULL
	  AND dst.Odnr_Fact_Third_Party_Well_Header_UID IS NOT NULL
      )	', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2317, 1, 87, 1, N'Match API Number', N'Master Dimension Third', N'	
	SELECT
    src.Odnr_Dim_Third_Party_Well_Header_UID      AS UID_Left
   ,dst.Hub_Third_Party_Wellbore_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.API_Number IS NULL THEN
                 0
             WHEN dst.API_Number = src.API_Number THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Odnr.Dim_Third_Party_Well_Header                          AS src
    INNER JOIN Master_Staging.Odnr_Dim_Third_Party_Wellbore_Header AS pag ON src.Odnr_Dim_Third_Party_Well_Header_UID = pag.Odnr_Dim_Third_Party_Wellbore_Header_UID
    FULL JOIN Master_Etl.Master_Third_Party_Wellbore_Header          AS dst ON dst.API_Number = src.API_Number
  --  INNER JOIN Master.Hub_Third_Party_Wellbore_Header               AS hub ON dst.Hub_Third_Party_Wellbore_Header_ID = hub.Hub_Third_Party_Wellbore_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Odnr_Dim_Third_Party_Well_Header_UID IS NOT NULL
        AND dst.Hub_Third_Party_Wellbore_Header_UID IS NOT NULL
    )
', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2318, 1, 87, 1, N'Match Well Name', N'Master Dimension Third', N'	SELECT src.Odnr_Dim_Third_Party_Well_Header_UID AS UID_LEFT
	,dst.Hub_Third_Party_Well_Header_UID AS UID_Right
	,CAST(CASE
             WHEN src.Well_Name_Antero_Standard IS NULL THEN
                 0
             WHEN c.similarity > .7  THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X

		  
	FROM Odnr.Dim_Third_Party_Well_Header                          AS src
    INNER JOIN Master_Staging.Odnr_Dim_Third_Party_Well_Header AS pag ON src.Odnr_Dim_Third_Party_Well_Header_UID = pag.Odnr_Dim_Third_Party_Well_Header_UID
    FULL JOIN Master_Etl.Master_Third_Party_Well_Header          AS dst 
	ON Left(src.API10,5) = left(dst.API10,5)
	--AND dst.Well_Name_Antero_Standard = ISNULL(src.Well_Name_Antero_Standard,dst.Well_Name_Antero_Standard)
	--AND src.well_name_Antero_Standard IS NOT NULL 
    ---INNER JOIN Master.Hub_Third_Party_Well_Header               AS hub ON dst.Hub_Third_Party_Well_Header_ID = hub.Hub_Third_Party_Well_Header_ID
cross APPLY Util.String_Similarity(src.well_name_Antero_Standard,dst.well_name_Antero_Standard, N'' '') c
WHERE pag.processing_State =1 and
src.Odnr_Dim_Third_Party_Well_Header_UID IS NOT null
	AND dst.Hub_Third_Party_Well_Header_UID  IS NOT null', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2319, 1, 113, 1, N'Match APINumber', N'Master Dimension Third', N'SELECT
    src.Enerdeq_Dim_Third_Party_Well_Header_UID      AS UID_Left
   ,dst.Hub_Third_Party_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.API10 IS NULL THEN
                 0
             WHEN dst.API10 = src.API10 THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Enerdeq.Dim_Third_Party_Well_Header                          AS src
    INNER JOIN Master_Staging.Enerdeq_Dim_Third_Party_Well_Header AS pag ON src.Enerdeq_Dim_Third_Party_Well_Header_UID = pag.Enerdeq_Dim_Third_Party_Well_Header_UID
    FULL JOIN Master_Etl.Master_Third_Party_Well_Header          AS dst ON dst.API10 = src.API10
   -- INNER JOIN Master.Hub_Third_Party_Well_Header               AS hub ON dst.Hub_Third_Party_Well_Header_ID = hub.Hub_Third_Party_Well_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Enerdeq_Dim_Third_Party_Well_Header_UID IS NOT NULL
        AND dst.Hub_Third_Party_Well_Header_UID IS NOT NULL
    )
', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2320, 1, 113, 1, N'Match Well Name Similarity, State And County', N'Master Dimension Third', N'	SELECT src.Enerdeq_Dim_Third_Party_Well_Header_UID AS UID_LEF
	,dst.Hub_Third_Party_Well_Header_UID AS UID_Right
	,CAST(CASE
             WHEN src.Well_Name_Antero_Standard IS NULL THEN
                 0
             WHEN c.similarity > .7 AND CONCAT(src.state_name,src.county_name) = CONCAT(dst.state_name,dst.county) THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X

		  
	FROM Enerdeq.Dim_Third_Party_Well_Header                          AS src
    INNER JOIN Master_Staging.Enerdeq_Dim_Third_Party_Well_Header AS pag ON src.Enerdeq_Dim_Third_Party_Well_Header_UID = pag.Enerdeq_Dim_Third_Party_Well_Header_UID
    FULL JOIN Master_Etl.Master_Third_Party_Well_Header          AS dst 
	ON dst.State_Name = src.State_Name
	AND dst.county = src.County_Name
	AND dst.Well_Name_Antero_Standard = ISNULL(src.Well_Name_Antero_Standard,dst.Well_Name_Antero_Standard)
    INNER JOIN Master.Hub_Third_Party_Well_Header               AS hub ON dst.Hub_Third_Party_Well_Header_ID = hub.Hub_Third_Party_Well_Header_ID
cross APPLY Util.String_Similarity(src.well_name_Antero_Standard,dst.well_name_Antero_Standard, N'' '') c
WHERE pag.processing_State =1', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2321, 1, 87, 1, N'Match API12', N'Master Dimension Third', N'SELECT
    src.Odnr_Dim_Third_Party_Well_Header_UID      AS UID_Left
   ,dst.Hub_Third_Party_Wellbore_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN LEFT(src.API_Number,12) IS NULL THEN
                 0
             WHEN dst.API12 = LEFT(src.API_Number,12) THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Odnr.Dim_Third_Party_Well_Header                          AS src
    INNER JOIN Master_Staging.Odnr_Dim_Third_Party_Wellbore_Header AS pag ON src.Odnr_Dim_Third_Party_Well_Header_UID = pag.Odnr_Dim_Third_Party_Wellbore_Header_UID
    FULL JOIN Master_Etl.Master_Third_Party_Wellbore_Header          AS dst ON dst.API12 = LEFT(src.API_Number,12)
   -- INNER JOIN Master.Hub_Third_Party_Wellbore_Header               AS hub ON dst.Hub_Third_Party_Wellbore_Header_ID = hub.Hub_Third_Party_Wellbore_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Odnr_Dim_Third_Party_Well_Header_UID IS NOT NULL
        AND dst.Hub_Third_Party_Wellbore_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2322, 1, 87, 1, N'Match Well Name', N'Master Dimension Third', N'SELECT
    src.Odnr_Dim_Third_Party_Well_Header_UID      AS UID_Left
   ,dst.Hub_Third_Party_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Well_Name_Antero_Standard IS NULL THEN
                 0
             WHEN dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Odnr.Dim_Third_Party_Well_Header                          AS src
    INNER JOIN Master_Staging.Odnr_Dim_Third_Party_Wellbore_Header AS pag ON src.Odnr_Dim_Third_Party_Well_Header_UID = pag.Odnr_Dim_Third_Party_Wellbore_Header_UID
    FULL JOIN Master_Etl.Master_Third_Party_Wellbore_Header          AS dst ON dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard
   -- INNER JOIN Master.Hub_Third_Party_Wellbore_Header               AS hub ON dst.Hub_Third_Party_Wellbore_Header_ID = hub.Hub_Third_Party_Wellbore_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Odnr_Dim_Third_Party_Well_Header_UID IS NOT NULL
        AND dst.Hub_Third_Party_Wellbore_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2323, 1, 87, 1, N'Match Compl Date', N'Master Dimension Third', N'SELECT
    src.Odnr_Dim_Third_Party_Well_Header_UID      AS UID_Left
   ,dst.Hub_Third_Party_Wellbore_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Comp_Date IS NULL THEN
                 0
             WHEN dst.Completion_Date = src.Comp_Date THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Odnr.Dim_Third_Party_Well_Header                          AS src
    INNER JOIN Master_Staging.Odnr_Dim_Third_Party_Wellbore_Header AS pag ON src.Odnr_Dim_Third_Party_Well_Header_UID = pag.Odnr_Dim_Third_Party_Wellbore_Header_UID
    FULL JOIN Master_Etl.Master_Third_Party_Wellbore_Header          AS dst ON dst.Completion_Date = src.Comp_Date
   -- INNER JOIN Master.Hub_Third_Party_Wellbore_Header               AS hub ON dst.Hub_Third_Party_Wellbore_Header_ID = hub.Hub_Third_Party_Wellbore_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Odnr_Dim_Third_Party_Well_Header_UID IS NOT NULL
        AND dst.Hub_Third_Party_Wellbore_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2324, 1, 88, 1, N'Match API Number', N'Master Dimension Third', N'SELECT
    src.Pasda_Dim_Third_Party_Well_Header_UID      AS UID_Left
   ,dst.Hub_Third_Party_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.API_Number IS NULL THEN
                 0
             WHEN dst.API_Number = src.API_Number THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Pasda.Dim_Third_Party_Well_Header                          AS src
    INNER JOIN Master_Staging.Pasda_Dim_Third_Party_Well_Header AS pag ON src.Pasda_Dim_Third_Party_Well_Header_UID = pag.Pasda_Dim_Third_Party_Well_Header_UID
    FULL JOIN Master_Etl.Master_Third_Party_Well_Header          AS dst ON dst.API_Number = src.API_Number
   -- INNER JOIN Master.Hub_Third_Party_Well_Header               AS hub ON dst.Hub_Third_Party_Well_Header_ID = hub.Hub_Third_Party_Well_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Pasda_Dim_Third_Party_Well_Header_UID IS NOT NULL
        AND dst.Hub_Third_Party_Well_Header_UID IS NOT NULL
    )
', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2325, 1, 88, 1, N'Match API10', N'Master Dimension Third', N'SELECT
    src.Pasda_Dim_Third_Party_Well_Header_UID      AS UID_Left
   ,dst.Hub_Third_Party_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.API10 IS NULL THEN
                 0
             WHEN dst.API10 = src.API10 THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Pasda.Dim_Third_Party_Well_Header                          AS src
    INNER JOIN Master_Staging.Pasda_Dim_Third_Party_Well_Header AS pag ON src.Pasda_Dim_Third_Party_Well_Header_UID = pag.Pasda_Dim_Third_Party_Well_Header_UID
    FULL JOIN Master_Etl.Master_Third_Party_Well_Header          AS dst ON dst.API10 = src.API10
   -- INNER JOIN Master.Hub_Third_Party_Well_Header               AS hub ON dst.Hub_Third_Party_Well_Header_ID = hub.Hub_Third_Party_Well_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Pasda_Dim_Third_Party_Well_Header_UID IS NOT NULL
        AND dst.Hub_Third_Party_Well_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2326, 1, 88, 1, N'Match Well Name', N'Master Dimension Third', N'SELECT
    src.Pasda_Dim_Third_Party_Well_Header_UID      AS UID_Left
   ,dst.Hub_Third_Party_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Well_Name_Antero_Standard IS NULL THEN
                 0
             WHEN dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Pasda.Dim_Third_Party_Well_Header                          AS src
    INNER JOIN Master_Staging.Pasda_Dim_Third_Party_Well_Header AS pag ON src.Pasda_Dim_Third_Party_Well_Header_UID = pag.Pasda_Dim_Third_Party_Well_Header_UID
    FULL JOIN Master_Etl.Master_Third_Party_Well_Header          AS dst ON dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard
   -- INNER JOIN Master.Hub_Third_Party_Well_Header               AS hub ON dst.Hub_Third_Party_Well_Header_ID = hub.Hub_Third_Party_Well_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Pasda_Dim_Third_Party_Well_Header_UID IS NOT NULL
        AND dst.Hub_Third_Party_Well_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2327, 1, 93, 1, N'Match API Number', N'Master Dimension Third', N'SELECT
    src.Padep_Dim_Third_Party_Well_Header_UID      AS UID_Left
   ,dst.Hub_Third_Party_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.API_Number IS NULL THEN
                 0
             WHEN dst.API_Number = src.API_Number THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Padep.Dim_Third_Party_Well_Header                          AS src
    INNER JOIN Master_Staging.Padep_Dim_Third_Party_Well_Header AS pag ON src.Padep_Dim_Third_Party_Well_Header_UID = pag.Padep_Dim_Third_Party_Well_Header_UID
    FULL JOIN Master_Etl.Master_Third_Party_Well_Header          AS dst ON dst.API_Number = src.API_Number
   -- INNER JOIN Master.Hub_Third_Party_Well_Header               AS hub ON dst.Hub_Third_Party_Well_Header_ID = hub.Hub_Third_Party_Well_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Padep_Dim_Third_Party_Well_Header_UID IS NOT NULL
        AND dst.Hub_Third_Party_Well_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2328, 1, 93, 1, N'Match API10', N'Master Dimension Third', N'SELECT
    src.Padep_Dim_Third_Party_Well_Header_UID      AS UID_Left
   ,dst.Hub_Third_Party_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.API10 IS NULL THEN
                 0
             WHEN dst.API10 = src.API10 THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Padep.Dim_Third_Party_Well_Header                          AS src
    INNER JOIN Master_Staging.Padep_Dim_Third_Party_Well_Header AS pag ON src.Padep_Dim_Third_Party_Well_Header_UID = pag.Padep_Dim_Third_Party_Well_Header_UID
    FULL JOIN Master_Etl.Master_Third_Party_Well_Header          AS dst ON dst.API10 = src.API10
   -- INNER JOIN Master.Hub_Third_Party_Well_Header               AS hub ON dst.Hub_Third_Party_Well_Header_ID = hub.Hub_Third_Party_Well_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Padep_Dim_Third_Party_Well_Header_UID IS NOT NULL
        AND dst.Hub_Third_Party_Well_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2329, 1, 93, 1, N'Match State and Well Name', N'Master Dimension Third', N'
	SELECT
    src.Padep_Dim_Third_Party_Well_Header_UID      AS UID_Left
   ,dst.Hub_Third_Party_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Well_Name_Antero_Standard IS NULL THEN
                 0
             WHEN concat(dst.Well_Name_Antero_Standard,dst.State_Name) = concat(src.Well_Name_Antero_Standard,src.State_Name) THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Padep.Dim_Third_Party_Well_Header                          AS src
    INNER JOIN Master_Staging.Padep_Dim_Third_Party_Well_Header AS pag ON src.Padep_Dim_Third_Party_Well_Header_UID = pag.Padep_Dim_Third_Party_Well_Header_UID
    FULL JOIN Master_Etl.Master_Third_Party_Well_Header          AS dst ON concat(dst.Well_Name_Antero_Standard,dst.State_Name) = concat(src.Well_Name_Antero_Standard,src.State_Name)
   -- INNER JOIN Master.Hub_Third_Party_Well_Header               AS hub ON dst.Hub_Third_Party_Well_Header_ID = hub.Hub_Third_Party_Well_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Padep_Dim_Third_Party_Well_Header_UID IS NOT NULL
        AND dst.Hub_Third_Party_Well_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2330, 1, 113, 1, N'Match Well Name', N'Dimension Third', N'SELECT
       src.UID_Left AS UID_Left
      ,dst.Enerdeq_Dim_Third_Party_Well_Header_UID AS UID_Right
      ,CAST(CASE
                WHEN src.Well_Name_Antero_Standard IS NULL THEN
                    0
                WHEN dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard THEN
                    1
                ELSE
                    0
            END AS BIT)    AS X
FROM Staging.Enerdeq_Dim_Third_Party_Well_Header        AS src
    FULL JOIN Enerdeq.Dim_Third_Party_Well_Header AS dst ON 
		dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard
		-- dst.Well_Name_Antero_Standard LIKE ISNULL(src.Well_Name_Antero_Standard , ''%'')
WHERE
    src.Processing_State = 1
    AND
    (
        src.UID_Left IS NOT NULL
        AND dst.Enerdeq_Dim_Third_Party_Well_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2331, 1, 91, 1, N'Match API10', N'Master Dimension Third', N'SELECT
    src.Wvdep_Dim_Third_Party_Well_Header_UID      AS UID_Left
   ,dst.Hub_Third_Party_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.API10 IS NULL THEN
                 0
             WHEN concat(dst.API10,dst.state_name) = concat(src.API10,src.state_name) THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Wvdep.Dim_Third_Party_Well_Header                          AS src
    INNER JOIN Master_Staging.Wvdep_Dim_Third_Party_Well_Header AS pag ON src.Wvdep_Dim_Third_Party_Well_Header_UID = pag.Wvdep_Dim_Third_Party_Well_Header_UID
    FULL JOIN Master_Etl.Master_Third_Party_Well_Header          AS dst ON concat(dst.API10,dst.state_name) = concat(src.API10,src.state_name)
   -- INNER JOIN Master.Hub_Third_Party_Well_Header               AS hub ON dst.Hub_Third_Party_Well_Header_ID = hub.Hub_Third_Party_Well_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Wvdep_Dim_Third_Party_Well_Header_UID IS NOT NULL
        AND dst.Hub_Third_Party_Well_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2332, 1, 91, 1, N'Match API_Number', N'Master Dimension Third', N'	SELECT
    src.Wvdep_Dim_Third_Party_Well_Header_UID      AS UID_Left
   ,dst.Hub_Third_Party_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.API_Number IS NULL THEN
                 0
             WHEN concat(dst.API_Number,dst.state_name) = concat(src.API_Number,src.state_name) THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Wvdep.Dim_Third_Party_Well_Header                          AS src
    INNER JOIN Master_Staging.Wvdep_Dim_Third_Party_Well_Header AS pag ON src.Wvdep_Dim_Third_Party_Well_Header_UID = pag.Wvdep_Dim_Third_Party_Well_Header_UID
    FULL JOIN Master_Etl.Master_Third_Party_Well_Header          AS dst ON concat(dst.API_Number,dst.state_name) = concat(src.API_Number,src.state_name) 
   -- INNER JOIN Master.Hub_Third_Party_Well_Header               AS hub ON dst.Hub_Third_Party_Well_Header_ID = hub.Hub_Third_Party_Well_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Wvdep_Dim_Third_Party_Well_Header_UID IS NOT NULL
        AND dst.Hub_Third_Party_Well_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2333, 1, 91, 1, N'Match Well Name', N'Master Dimension Third', N'SELECT
    src.Wvdep_Dim_Third_Party_Well_Header_UID      AS UID_Left
   ,dst.Hub_Third_Party_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Well_Name_Antero_Standard IS NULL THEN
                 0
             WHEN concat(dst.Well_Name_Antero_Standard,dst.state_name) = concat(src.Well_Name_Antero_Standard,src.state_name) THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Wvdep.Dim_Third_Party_Well_Header                          AS src
    INNER JOIN Master_Staging.Wvdep_Dim_Third_Party_Well_Header AS pag ON src.Wvdep_Dim_Third_Party_Well_Header_UID = pag.Wvdep_Dim_Third_Party_Well_Header_UID
    FULL JOIN Master_Etl.Master_Third_Party_Well_Header          AS dst ON  concat(dst.Well_Name_Antero_Standard,dst.state_name)= concat(src.Well_Name_Antero_Standard,src.state_name)
   -- INNER JOIN Master.Hub_Third_Party_Well_Header               AS hub ON dst.Hub_Third_Party_Well_Header_ID = hub.Hub_Third_Party_Well_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Wvdep_Dim_Third_Party_Well_Header_UID IS NOT NULL
        AND dst.Hub_Third_Party_Well_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2334, 1, 114, 1, N'Match Well Name', N'Dimension GIS', N'SELECT     src.UID_Left                                AS UID_Left     ,dst.GIS_Dim_Well_Header_UID             AS UID_Right     ,CAST(CASE               WHEN src.Well_Name_Antero_Standard IS NULL THEN                   0               WHEN dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard THEN                   1               ELSE                   0           END AS BIT)    AS X  FROM Staging.GIS_Dim_Well_Header                    AS src      FULL  JOIN GIS.Dim_Well_Header                           AS dst ON dst.Well_Name_Antero_Standard          = src.Well_Name_Antero_Standard        WHERE      src.Processing_State = 1      AND      (          src.UID_Left                           IS NOT NULL          AND dst.GIS_Dim_Well_Header_UID              IS NOT NULL      )', 'BIT', 0.9, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2335, 1, 114, 1, N'Match SEQNUM', N'Dimension GIS', N'SELECT     src.UID_Left                                AS UID_Left     ,dst.GIS_Dim_Well_Header_UID             AS UID_Right     ,CAST(CASE               WHEN src.SEQNUM                    IS NULL THEN                   0               WHEN dst.SEQNUM                    = src.SEQNUM                    THEN                   1               ELSE                   0           END AS BIT)    AS X  FROM Staging.GIS_Dim_Well_Header                    AS src      FULL  JOIN GIS.Dim_Well_Header                           AS dst ON dst.SEQNUM                             = src.SEQNUM                           WHERE      src.Processing_State = 1      AND      (          src.UID_Left                           IS NOT NULL          AND dst.GIS_Dim_Well_Header_UID              IS NOT NULL      )', 'BIT', 0.95, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2336, 1, 114, 1, N'Match Latitude', NULL, N'SELECT
       src.UID_Left AS UID_Left
      ,dst.GIS_Dim_Well_Header_UID AS UID_Right
      ,CAST(CASE
                WHEN src.Surface_Latitude_NAD27 IS NULL THEN
                    0
                WHEN dst.Surface_Latitude_NAD27 = src.Surface_Latitude_NAD27 THEN
                    1
                ELSE
                    0
            END AS BIT)    AS X
FROM Staging.GIS_Dim_Well_Header        AS src
    FULL JOIN GIS.Dim_Well_Header AS dst ON 
		dst.Surface_Latitude_NAD27 = src.Surface_Latitude_NAD27
		-- dst.Surface_Latitude_NAD27 LIKE ISNULL(src.Surface_Latitude_NAD27 , ''%'')
WHERE
    src.Processing_State = 1
    AND
    (
        src.UID_Left IS NOT NULL
        AND dst.GIS_Dim_Well_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2337, 1, 114, 1, N'Match Longitude', NULL, N'SELECT
       src.UID_Left AS UID_Left
      ,dst.GIS_Dim_Well_Header_UID AS UID_Right
      ,CAST(CASE
                WHEN src.Surface_Longitude_NAD27 IS NULL THEN
                    0
                WHEN dst.Surface_Longitude_NAD27 = src.Surface_Longitude_NAD27 THEN
                    1
                ELSE
                    0
            END AS BIT)    AS X
FROM Staging.GIS_Dim_Well_Header        AS src
    FULL JOIN GIS.Dim_Well_Header AS dst ON 
		dst.Surface_Longitude_NAD27 = src.Surface_Longitude_NAD27
		-- dst.Surface_Longitude_NAD27 LIKE ISNULL(src.Surface_Longitude_NAD27 , ''%'')
WHERE
    src.Processing_State = 1
    AND
    (
        src.UID_Left IS NOT NULL
        AND dst.GIS_Dim_Well_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2338, 1, 115, 1, N'Match SEQNUM', N'Master GIS', N'SELECT
    src.GIS_Dim_Well_Header_UID      AS UID_Left
   ,hub.Hub_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.SEQNUM IS NULL THEN
                 0
             WHEN dst.SEQNUM = src.SEQNUM THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM GIS.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.GIS_Dim_Well_Header AS pag ON src.GIS_Dim_Well_Header_UID = pag.GIS_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Master_Well_Header          AS dst ON dst.SEQNUM = src.SEQNUM
    INNER JOIN Master.Hub_Well_Header               AS hub ON dst.Hub_Well_Header_ID = hub.Hub_Well_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.GIS_Dim_Well_Header_UID IS NOT NULL
        AND hub.Hub_Well_Header_UID IS NOT NULL
    )
', 'BIT', 0.95, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2339, 1, 115, 1, N'Match API_Number', N'Master GIS', N'SELECT
    src.GIS_Dim_Well_Header_UID      AS UID_Left
   ,hub.Hub_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.API_Number IS NULL THEN
                 0
             WHEN dst.API_Number = src.API_Number THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM GIS.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.GIS_Dim_Well_Header AS pag ON src.GIS_Dim_Well_Header_UID = pag.GIS_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Master_Well_Header          AS dst ON dst.API_Number = src.API_Number
    INNER JOIN Master.Hub_Well_Header               AS hub ON dst.Hub_Well_Header_ID = hub.Hub_Well_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.GIS_Dim_Well_Header_UID IS NOT NULL
        AND hub.Hub_Well_Header_UID IS NOT NULL
    )
', 'BIT', 0.6, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2340, 1, 115, 1, N'Match Well Name', N'Master GIS', N'SELECT
    src.GIS_Dim_Well_Header_UID      AS UID_Left
   ,hub.Hub_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Well_Name_Antero_Standard IS NULL THEN
                 0
             WHEN dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM GIS.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.GIS_Dim_Well_Header AS pag ON src.GIS_Dim_Well_Header_UID = pag.GIS_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Master_Well_Header          AS dst ON dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard
    INNER JOIN Master.Hub_Well_Header               AS hub ON dst.Hub_Well_Header_ID = hub.Hub_Well_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.GIS_Dim_Well_Header_UID IS NOT NULL
        AND hub.Hub_Well_Header_UID IS NOT NULL
    )
', 'BIT', 0.9, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2341, 1, 115, 1, N'Match Latitude', NULL, N'SELECT
    src.GIS_Dim_Well_Header_UID      AS UID_Left
   ,hub.Hub_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Surface_Latitude_NAD27 IS NULL THEN
                 0
             WHEN dst.Surface_Latitude_NAD27 = src.Surface_Latitude_NAD27 THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM GIS.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.GIS_Dim_Well_Header AS pag ON src.GIS_Dim_Well_Header_UID = pag.GIS_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Master_Well_Header          AS dst ON dst.Surface_Latitude_NAD27 = src.Surface_Latitude_NAD27
    INNER JOIN Master.Hub_Well_Header               AS hub ON dst.Hub_Well_Header_ID = hub.Hub_Well_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.GIS_Dim_Well_Header_UID IS NOT NULL
        AND hub.Hub_Well_Header_UID IS NOT NULL
    )
', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2342, 1, 115, 1, N'Match Longitude', NULL, N'SELECT
    src.GIS_Dim_Well_Header_UID      AS UID_Left
   ,hub.Hub_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Surface_Longitude_NAD27 IS NULL THEN
                 0
             WHEN dst.Surface_Longitude_NAD27 = src.Surface_Longitude_NAD27 THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM GIS.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.GIS_Dim_Well_Header AS pag ON src.GIS_Dim_Well_Header_UID = pag.GIS_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Master_Well_Header          AS dst ON dst.Surface_Longitude_NAD27 = src.Surface_Longitude_NAD27
    INNER JOIN Master.Hub_Well_Header               AS hub ON dst.Hub_Well_Header_ID = hub.Hub_Well_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.GIS_Dim_Well_Header_UID IS NOT NULL
        AND hub.Hub_Well_Header_UID IS NOT NULL
    )
', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2343, 1, 116, 1, N'Match Well Name', N'Master Dimension Third', N'SELECT
    src.Enerdeq_Dim_Third_Party_Wellbore_Header_UID      AS UID_Left
   ,dst.Hub_Third_Party_Wellbore_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Well_Name_Antero_Standard IS NULL THEN
                 0
             WHEN dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Enerdeq.Dim_Third_Party_Wellbore_Header                          AS src
    INNER JOIN Master_Staging.Enerdeq_Dim_Third_Party_Wellbore_Header AS pag ON src.Enerdeq_Dim_Third_Party_Wellbore_Header_UID = pag.Enerdeq_Dim_Third_Party_Wellbore_Header_UID
    FULL JOIN Master_Etl.Master_Third_Party_Wellbore_Header          AS dst ON dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard
   -- INNER JOIN Master.Hub_Third_Party_Wellbore_Header               AS hub ON dst.Hub_Third_Party_Wellbore_Header_ID = hub.Hub_Third_Party_Wellbore_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Enerdeq_Dim_Third_Party_Wellbore_Header_UID IS NOT NULL
        AND dst.Hub_Third_Party_Wellbore_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2344, 1, 116, 1, N'Match API12', N'Master Dimension Third', N'SELECT
    src.Enerdeq_Dim_Third_Party_Wellbore_Header_UID      AS UID_Left
   ,dst.Hub_Third_Party_Wellbore_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.API12 IS NULL THEN
                 0
             WHEN dst.API12 = src.API12 THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Enerdeq.Dim_Third_Party_Wellbore_Header                          AS src
    INNER JOIN Master_Staging.Enerdeq_Dim_Third_Party_Wellbore_Header AS pag ON src.Enerdeq_Dim_Third_Party_Wellbore_Header_UID = pag.Enerdeq_Dim_Third_Party_Wellbore_Header_UID
    FULL JOIN Master_Etl.Master_Third_Party_Wellbore_Header          AS dst ON dst.API12 = src.API12
   -- INNER JOIN Master.Hub_Third_Party_Wellbore_Header               AS hub ON dst.Hub_Third_Party_Wellbore_Header_ID = hub.Hub_Third_Party_Wellbore_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Enerdeq_Dim_Third_Party_Wellbore_Header_UID IS NOT NULL
        AND dst.Hub_Third_Party_Wellbore_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2345, 1, 90, 1, N'Match Well Name', N'Master Dimension Third', N'SELECT
    src.Seneca_Dim_Third_Party_Well_Header_UID      AS UID_Left
   ,dst.Hub_Third_Party_Wellbore_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Well_Name_Antero_Standard IS NULL THEN
                 0
             WHEN dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Seneca.Dim_Third_Party_Well_Header                          AS src
    INNER JOIN Master_Staging.Seneca_Dim_Third_Party_Wellbore_Header AS pag ON src.Seneca_Dim_Third_Party_Well_Header_UID = pag.Seneca_Dim_Third_Party_Wellbore_Header_UID
    FULL JOIN Master_Etl.Master_Third_Party_Wellbore_Header          AS dst ON dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard
   -- INNER JOIN Master.Hub_Third_Party_Wellbore_Header               AS hub ON dst.Hub_Third_Party_Wellbore_Header_ID = hub.Hub_Third_Party_Wellbore_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Seneca_Dim_Third_Party_Well_Header_UID IS NOT NULL
        AND dst.Hub_Third_Party_Wellbore_Header_UID IS NOT NULL
    )
	
	', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2346, 1, 90, 1, N'Match API Number', N'Master Dimension Third', N'SELECT
    src.Seneca_Dim_Third_Party_Well_Header_UID      AS UID_Left
   ,dst.Hub_Third_Party_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.API_Number IS NULL THEN
                 0
             WHEN dst.API_Number = src.API_Number THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Seneca.Dim_Third_Party_Well_Header                          AS src
    INNER JOIN Master_Staging.Seneca_Dim_Third_Party_Well_Header AS pag ON src.Seneca_Dim_Third_Party_Well_Header_UID = pag.Seneca_Dim_Third_Party_Well_Header_UID
    FULL JOIN Master_Etl.Master_Third_Party_Well_Header          AS dst ON dst.API_Number = src.API_Number
   -- INNER JOIN Master.Hub_Third_Party_Well_Header               AS hub ON dst.Hub_Third_Party_Well_Header_ID = hub.Hub_Third_Party_Well_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Seneca_Dim_Third_Party_Well_Header_UID IS NOT NULL
        AND dst.Hub_Third_Party_Well_Header_UID IS NOT NULL
    )
	
	', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2347, 1, 90, 1, N'Match API10', N'Master Dimension Third', N'SELECT
    src.Seneca_Dim_Third_Party_Well_Header_UID      AS UID_Left
   ,dst.Hub_Third_Party_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.API10 IS NULL THEN
                 0
             WHEN dst.API10 = src.API10 THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Seneca.Dim_Third_Party_Well_Header                          AS src
    INNER JOIN Master_Staging.Seneca_Dim_Third_Party_Well_Header AS pag ON src.Seneca_Dim_Third_Party_Well_Header_UID = pag.Seneca_Dim_Third_Party_Well_Header_UID
    FULL JOIN Master_Etl.Master_Third_Party_Well_Header          AS dst ON dst.API10 = src.API10
   -- INNER JOIN Master.Hub_Third_Party_Well_Header               AS hub ON dst.Hub_Third_Party_Well_Header_ID = hub.Hub_Third_Party_Well_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Seneca_Dim_Third_Party_Well_Header_UID IS NOT NULL
        AND dst.Hub_Third_Party_Well_Header_UID IS NOT NULL
    )
	
	', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2348, 1, 117, 1, N'Match Well Name', N'Master Dimension Third', N'SELECT
    src.Petra_Dim_Third_Party_Wellbore_Header_UID      AS UID_Left
   ,dst.Hub_Third_Party_Wellbore_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Well_Name_Antero_Standard IS NULL THEN
                 0
             WHEN dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Petra.Dim_Third_Party_Wellbore_Header                          AS src
    INNER JOIN Master_Staging.Petra_Dim_Third_Party_Wellbore_Header AS pag ON src.Petra_Dim_Third_Party_Wellbore_Header_UID = pag.Petra_Dim_Third_Party_Wellbore_Header_UID
    FULL JOIN Master_Etl.Master_Third_Party_Wellbore_Header          AS dst ON dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard
   -- INNER JOIN Master.Hub_Third_Party_Wellbore_Header               AS hub ON dst.Hub_Third_Party_Wellbore_Header_ID = hub.Hub_Third_Party_Wellbore_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Petra_Dim_Third_Party_Wellbore_Header_UID IS NOT NULL
        AND dst.Hub_Third_Party_Wellbore_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2349, 1, 117, 1, N'Match API12', N'Master Dimension Third', N'SELECT
    src.Petra_Dim_Third_Party_Wellbore_Header_UID      AS UID_Left
   ,dst.Hub_Third_Party_Wellbore_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.API12 IS NULL THEN
                 0
             WHEN dst.API12 = src.API12 THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Petra.Dim_Third_Party_Wellbore_Header                          AS src
    INNER JOIN Master_Staging.Petra_Dim_Third_Party_Wellbore_Header AS pag ON src.Petra_Dim_Third_Party_Wellbore_Header_UID = pag.Petra_Dim_Third_Party_Wellbore_Header_UID
    FULL JOIN Master_Etl.Master_Third_Party_Wellbore_Header          AS dst ON dst.API12 = src.API12
   -- INNER JOIN Master.Hub_Third_Party_Wellbore_Header               AS hub ON dst.Hub_Third_Party_Wellbore_Header_ID = hub.Hub_Third_Party_Wellbore_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Petra_Dim_Third_Party_Wellbore_Header_UID IS NOT NULL
        AND dst.Hub_Third_Party_Wellbore_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2350, 1, 117, 1, N'Match Comp Date', N'Master Dimension Third', N'SELECT
    src.Petra_Dim_Third_Party_Wellbore_Header_UID      AS UID_Left
   ,dst.Hub_Third_Party_Wellbore_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Completion_Date_Actual IS NULL THEN
                 0
             WHEN dst.completion_date = src.completion_date_Actual AND 
			 CONCAT(dst.state_name,dst.county) = CONCAT(src.state_name,src.county) THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Petra.Dim_Third_Party_Wellbore_Header                          AS src
    INNER JOIN Master_Staging.Petra_Dim_Third_Party_Wellbore_Header AS pag ON src.Petra_Dim_Third_Party_Wellbore_Header_UID = pag.Petra_Dim_Third_Party_Wellbore_Header_UID
    FULL JOIN Master_Etl.Master_Third_Party_Wellbore_Header          AS dst ON 
	dst.completion_Date = src.completion_date_actual
	AND CONCAT(dst.state_name,dst.county) = CONCAT(src.state_name,src.county)
   -- INNER JOIN Master.Hub_Third_Party_Wellbore_Header               AS hub ON dst.Hub_Third_Party_Wellbore_Header_ID = hub.Hub_Third_Party_Wellbore_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Petra_Dim_Third_Party_Wellbore_Header_UID IS NOT NULL
        AND dst.Hub_Third_Party_Wellbore_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2351, 1, 89, 1, N'Match Well Name ', N'Master Dimension Third', N'SELECT
    src.Petra_Dim_Third_Party_Well_Header_UID      AS UID_Left
   ,dst.Hub_Third_Party_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Well_Name_Antero_Standard IS NULL THEN
                 0
             WHEN dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Petra.Dim_Third_Party_Well_Header                          AS src
    INNER JOIN Master_Staging.Petra_Dim_Third_Party_Well_Header AS pag ON src.Petra_Dim_Third_Party_Well_Header_UID = pag.Petra_Dim_Third_Party_Well_Header_UID
    FULL JOIN Master_Etl.Master_Third_Party_Well_Header          AS dst ON dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard
   -- INNER JOIN Master.Hub_Third_Party_Well_Header               AS hub ON dst.Hub_Third_Party_Well_Header_ID = hub.Hub_Third_Party_Well_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Petra_Dim_Third_Party_Well_Header_UID IS NOT NULL
        AND dst.Hub_Third_Party_Well_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2352, 1, 89, 1, N'Match API10', N'Master Dimension Third', N'SELECT
    src.Petra_Dim_Third_Party_Well_Header_UID      AS UID_Left
   ,dst.Hub_Third_Party_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.API10 IS NULL THEN
                 0
             WHEN dst.API10 = src.API10 THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Petra.Dim_Third_Party_Well_Header                          AS src
    INNER JOIN Master_Staging.Petra_Dim_Third_Party_Well_Header AS pag ON src.Petra_Dim_Third_Party_Well_Header_UID = pag.Petra_Dim_Third_Party_Well_Header_UID
    FULL JOIN Master_Etl.Master_Third_Party_Well_Header          AS dst ON dst.API10 = src.API10
   -- INNER JOIN Master.Hub_Third_Party_Well_Header               AS hub ON dst.Hub_Third_Party_Well_Header_ID = hub.Hub_Third_Party_Well_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Petra_Dim_Third_Party_Well_Header_UID IS NOT NULL
        AND dst.Hub_Third_Party_Well_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2353, 1, 89, 1, N'Match Comp Date', N'Master Dimension Third', N'SELECT
    src.Petra_Dim_Third_Party_Well_Header_UID      AS UID_Left
   ,dst.Hub_Third_Party_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Completion_Date_Actual IS NULL THEN
                 0
             WHEN NULLIF(dst.completion_date,''1901-01-01 00:00:00.000'')= NULLIF(src.completion_date_Actual,''1901-01-01 00:00:00.000'') AND 
			 CONCAT(dst.state_name,dst.county) = CONCAT(src.state_name,src.county) THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Petra.Dim_Third_Party_Well_Header                          AS src
    INNER JOIN Master_Staging.Petra_Dim_Third_Party_Well_Header AS pag ON src.Petra_Dim_Third_Party_Well_Header_UID = pag.Petra_Dim_Third_Party_Well_Header_UID
    FULL JOIN Master_Etl.Master_Third_Party_Well_Header          AS dst ON 
	NULLIF(dst.completion_date,''1901-01-01 00:00:00.000'') = NULLIF(src.completion_date_Actual,''1901-01-01 00:00:00.000'') 
	AND CONCAT(dst.state_name,dst.county) = CONCAT(src.state_name,src.county)
   -- INNER JOIN Master.Hub_Third_Party_Well_Header               AS hub ON dst.Hub_Third_Party_Well_Header_ID = hub.Hub_Third_Party_Well_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Petra_Dim_Third_Party_Well_Header_UID IS NOT NULL
        AND dst.Hub_Third_Party_Well_Header_UID IS NOT NULL
    )
', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2354, 1, 118, 1, N'Match Pad Name', NULL, N'SELECT
    src.UID_Left AS UID_Left
   ,dst.GIS_Dim_Pad_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Pad_Name_Antero_Standard IS NULL
                  OR dst.Pad_Name_Antero_Standard IS NULL THEN
                 0
             WHEN src.Pad_Name_Antero_Standard = dst.Pad_Name_Antero_Standard THEN
                 1
             ELSE
                 0
         END AS BIT)             AS X
   --,*
FROM Staging.GIS_Dim_Pad_Header      AS src
    FULL JOIN GIS.Dim_Pad_Header AS dst ON dst.Pad_Name_Antero_Standard like ISNULL(src.Pad_Name_Antero_Standard, N''%'')
WHERE
    (
        src.UID_Left IS NOT NULL
        AND dst.GIS_Dim_Pad_Header_UID IS NOT NULL
    )
    AND src.Processing_State = 1', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2355, 1, 118, 1, N'Match State Name', NULL, N'SELECT
    src.UID_Left                    AS UID_Left
   ,dst.GIS_Dim_Pad_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN NULLIF( dst.State_Name, N'''') IS NULL
                  OR NULLIF(src.State_Name, N'''') IS NULL THEN
                 0
             WHEN dst.State_Name =  src.State_Name THEN
                 1
             ELSE
                 0
         END AS BIT)                AS X
--,*
FROM Staging.GIS_Dim_Pad_Header  AS src
    FULL JOIN GIS.Dim_Pad_Header AS dst ON  dst.State_Name = ISNULL(NULLIF( src.State_Name,N''''), N''%'')
WHERE
    (
        src.UID_Left IS NOT NULL
        AND dst.GIS_Dim_Pad_Header_UID IS NOT NULL
    )
    AND src.Processing_State = 1', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2356, 1, 119, 1, N'Match Pad Name', NULL, N'SELECT
    src.GIS_Dim_Pad_Header_UID      AS UID_Left
   ,hub.Hub_Pad_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Pad_Name_Antero_Standard IS NULL THEN
                 0
             WHEN dst.Pad_Name_Antero_Standard = src.Pad_Name_Antero_Standard THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM GIS.Dim_Pad_Header                          AS src
    INNER JOIN Master_Staging.GIS_Dim_Pad_Header AS pag ON src.GIS_Dim_Pad_Header_UID = pag.GIS_Dim_Pad_Header_UID
    FULL JOIN Master_Etl.Master_Pad_Header          AS dst ON dst.Pad_Name_Antero_Standard = src.Pad_Name_Antero_Standard
    INNER JOIN Master.Hub_Pad_Header               AS hub ON dst.Hub_Pad_Header_ID = hub.Hub_Pad_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.GIS_Dim_Pad_Header_UID IS NOT NULL
        AND hub.Hub_Pad_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2357, 1, 119, 1, N'Match State Name', NULL, N'SELECT
    src.GIS_Dim_Pad_Header_UID      AS UID_Left
   ,hub.Hub_Pad_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.State_Name IS NULL THEN
                 0
             WHEN dst.State_Name = src.State_Name THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM GIS.Dim_Pad_Header                          AS src
    INNER JOIN Master_Staging.GIS_Dim_Pad_Header AS pag ON src.GIS_Dim_Pad_Header_UID = pag.GIS_Dim_Pad_Header_UID
    FULL JOIN Master_Etl.Master_Pad_Header          AS dst ON dst.State_Name = src.State_Name
    INNER JOIN Master.Hub_Pad_Header               AS hub ON dst.Hub_Pad_Header_ID = hub.Hub_Pad_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.GIS_Dim_Pad_Header_UID IS NOT NULL
        AND hub.Hub_Pad_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2358, 1, 21, 1, N'Match Well Name', N'Fact FracSchedule', N'SELECT
       src.UID_Left AS UID_Left
      ,dst.Fact_FracSchedule_Well_Header_UID AS UID_Right
      ,CAST(CASE
                WHEN src.Well_Name_Antero_Standard IS NULL THEN
                    0
                WHEN dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard THEN
                    1
                ELSE
                    0
            END AS BIT)    AS X
FROM Staging.FracSchedule_Fact_Well_Header        AS src
    FULL JOIN FracSchedule.Fact_Well_Header AS dst ON 
		dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard
		-- dst.Well_Name_Antero_Standard LIKE ISNULL(src.Well_Name_Antero_Standard , ''%'')
WHERE
    src.Processing_State = 1
    AND
    (
        src.UID_Left IS NOT NULL
        AND dst.Fact_FracSchedule_Well_Header_UID IS NOT NULL
    )', 'BIT', 0.65, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2359, 1, 120, 1, N'Match Well Name', N'Master Dimension Third', N'SELECT
    src.Odnr_Dim_Third_Party_Well_Header_UID      AS UID_Left
   ,dst.Hub_Third_Party_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Well_Name_Antero_Standard IS NULL THEN
                 0
             WHEN concat(dst.Well_Name_Antero_Standard,dst.state_name) = concat(src.Well_Name_Antero_Standard,src.state_name) THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Odnr.Dim_Third_Party_Well_Header                          AS src
    INNER JOIN Master_Staging.Odnr_Dim_Third_Party_Well_Header AS pag ON src.Odnr_Dim_Third_Party_Well_Header_UID = pag.Odnr_Dim_Third_Party_Well_Header_UID
    FULL JOIN Master_Etl.Master_Third_Party_Well_Header          AS dst ON dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard

WHERE
    pag.Processing_State = 1
    AND
    (
        src.Odnr_Dim_Third_Party_Well_Header_UID IS NOT NULL
        AND dst.Hub_Third_Party_Well_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2360, 1, 120, 1, N'Match API Number', N'Master Dimension Third', N'SELECT
    src.Odnr_Dim_Third_Party_Well_Header_UID      AS UID_Left
   ,dst.Hub_Third_Party_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.API10 IS NULL THEN
                 0
             WHEN dst.API10 = src.API10 THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Odnr.Dim_Third_Party_Well_Header                          AS src
    INNER JOIN Master_Staging.Odnr_Dim_Third_Party_Well_Header AS pag ON src.Odnr_Dim_Third_Party_Well_Header_UID = pag.Odnr_Dim_Third_Party_Well_Header_UID
    FULL JOIN Master_Etl.Master_Third_Party_Well_Header          AS dst ON dst.API10 = src.API10
   -- INNER JOIN Master.Hub_Third_Party_Wellbore_Header               AS hub ON dst.Hub_Third_Party_Wellbore_Header_ID = hub.Hub_Third_Party_Wellbore_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Odnr_Dim_Third_Party_Well_Header_UID IS NOT NULL
        AND dst.Hub_Third_Party_Well_Header_UID IS NOT NULL
    )', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2361, 1, 123, 1, N'Match API Number', N'Dimension Third', N'SELECT
    src.UID_Left AS UID_Left
   ,dst.Aries_Dim_Third_Party_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.API_Number IS NULL
                  OR dst.API_Number IS NULL THEN
                 0
             WHEN src.API_Number = dst.API_Number THEN
                 1
             ELSE
                 0
         END AS BIT)             AS X
   --,*
FROM Staging.Aries_Dim_Third_Party_Well_Header      AS src
    FULL JOIN Aries.Dim_Third_Party_Well_Header AS dst ON dst.API_Number = src.API_Number
WHERE
    (
        src.UID_Left IS NOT NULL
        AND dst.Aries_Dim_Third_Party_Well_Header_UID IS NOT NULL
    )
    AND src.Processing_State = 1', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2362, 1, 123, 1, N'Match Well Name', N'Dimension Third', N'SELECT
    src.UID_Left AS UID_Left
   ,dst.Aries_Dim_Third_Party_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Well_Name_Antero_Standard IS NULL
                  OR dst.Well_Name_Antero_Standard IS NULL THEN
                 0
             WHEN src.Well_Name_Antero_Standard = dst.Well_Name_Antero_Standard THEN
                 1
             ELSE
                 0
         END AS BIT)             AS X
   --,*
FROM Staging.Aries_Dim_Third_Party_Well_Header      AS src
    FULL JOIN Aries.Dim_Third_Party_Well_Header AS dst ON dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard
WHERE
    (
        src.UID_Left IS NOT NULL
        AND dst.Aries_Dim_Third_Party_Well_Header_UID IS NOT NULL
    )
    AND src.Processing_State = 1', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2363, 1, 124, 1, N'Match SEQNUM', N'Dimension Aries', N'SELECT src.UID_Left AS UID_Left,
       dst.Aries_Dim_Well_Header_UID AS UID_Right,
       CAST(CASE
                WHEN src.SEQNUM IS NULL
                     OR dst.SEQNUM IS NULL THEN
                    0
                WHEN src.SEQNUM = dst.SEQNUM THEN
                    1
                ELSE
                    0
            END AS BIT) AS X FROM Staging.Aries_Dim_Well_Header      AS src      FULL JOIN Aries.Dim_Well_Header AS dst ON dst.SEQNUM = ISNULL(src.SEQNUM, dst.SEQNUM)  WHERE      (          src.UID_Left IS NOT NULL          AND dst.Aries_Dim_Well_Header_UID IS NOT NULL      )      AND src.Processing_State = 1', 'BIT', 0.75, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2364, 1, 124, 1, N'Match API Number', N'Dimension Aries', N'SELECT
    src.UID_Left AS UID_Left
   ,dst.Aries_Dim_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.API_Number IS NULL
                  OR dst.API_Number IS NULL THEN
                 0
             WHEN src.API_Number = dst.API_Number THEN
                 1
             ELSE
                 0
         END AS BIT)             AS X
   
FROM Staging.Aries_Dim_Well_Header      AS src
    FULL JOIN Aries.Dim_Well_Header AS dst ON dst.API_Number like ISNULL(src.API_Number, N''%'')
WHERE
    (
        src.UID_Left IS NOT NULL
        AND dst.Aries_Dim_Well_Header_UID IS NOT NULL
    )
    AND src.Processing_State = 1', 'BIT', 0.6, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2365, 1, 124, 1, N'Match Well Name', N'Dimension Aries', N'SELECT
    src.UID_Left AS UID_Left
   ,dst.Aries_Dim_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Well_Name_Antero_Standard IS NULL
                  OR dst.Well_Name_Antero_Standard IS NULL THEN
                 0
             WHEN src.Well_Name_Antero_Standard = dst.Well_Name_Antero_Standard THEN
                 1
             ELSE
                 0
         END AS BIT)             AS X
   
FROM Staging.Aries_Dim_Well_Header      AS src
    FULL JOIN Aries.Dim_Well_Header AS dst ON dst.Well_Name_Antero_Standard like ISNULL(src.Well_Name_Antero_Standard, N''%'')
WHERE
    (
        src.UID_Left IS NOT NULL
        AND dst.Aries_Dim_Well_Header_UID IS NOT NULL
    )
    AND src.Processing_State = 1
', 'BIT', 0.65, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2366, 1, 124, 1, N'Match PropNum', NULL, N'SELECT
    src.UID_Left AS UID_Left
   ,dst.Aries_Dim_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.PropNum IS NULL
                  OR dst.PropNum IS NULL THEN
                 0
             WHEN src.PropNum = dst.PropNum THEN
                 1
             ELSE
                 0
         END AS BIT)             AS X
   --,*
FROM Staging.Aries_Dim_Well_Header      AS src
    FULL JOIN Aries.Dim_Well_Header AS dst ON dst.PropNum = ISNULL(src.PropNum, dst.PropNum)
WHERE
    (
        src.UID_Left IS NOT NULL
        AND dst.Aries_Dim_Well_Header_UID IS NOT NULL
    )
    AND src.Processing_State = 1', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2367, 1, 125, 1, N'Match SEQNUM', N'Fact Aries Planning', N'SELECT src.UID_Left AS UID_Left,
       dst.Aries_Planning_Fact_Well_Header_UID AS UID_Right,
       CAST(CASE
                WHEN src.SEQNUM IS NULL
                     OR dst.SEQNUM IS NULL THEN
                    0
                WHEN src.SEQNUM = dst.SEQNUM THEN
                    1
                ELSE
                    0
            END AS BIT) AS X FROM Staging.Aries_Planning_Fact_Well_Header      AS src      FULL JOIN Aries_Planning.Fact_Well_Header AS dst ON dst.SEQNUM = ISNULL(src.SEQNUM, dst.SEQNUM)  WHERE      (          src.UID_Left IS NOT NULL          AND dst.Aries_Planning_Fact_Well_Header_UID IS NOT NULL      )      AND src.Processing_State = 1', 'BIT', 0.75, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2368, 1, 125, 1, N'Match Well Name ', N'Fact Aries Planning', N'SELECT
    src.UID_Left AS UID_Left
   ,dst.Aries_Planning_Fact_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Well_Name_Antero_Standard IS NULL
                  OR dst.Well_Name_Antero_Standard IS NULL THEN
                 0
             WHEN src.Well_Name_Antero_Standard = dst.Well_Name_Antero_Standard THEN
                 1
             ELSE
                 0
         END AS BIT)             AS X
   
FROM Staging.Aries_Planning_Fact_Well_Header      AS src
    FULL JOIN Aries_Planning.Fact_Well_Header AS dst ON dst.Well_Name_Antero_Standard = ISNULL(src.Well_Name_Antero_Standard, dst.Well_Name_Antero_Standard)
WHERE
    (
        src.UID_Left IS NOT NULL
        AND dst.Aries_Planning_Fact_Well_Header_UID IS NOT NULL
    )
    AND src.Processing_State = 1
	', 'BIT', 0.65, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2369, 1, 125, 1, N'Match API Number', N'Fact Aries Planning', N'SELECT
    src.UID_Left AS UID_Left
   ,dst.Aries_Planning_Fact_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.API_Number IS NULL
                  OR dst.API_Number IS NULL THEN
                 0
             WHEN src.API_Number = dst.API_Number THEN
                 1
             ELSE
                 0
         END AS BIT)             AS X
   
FROM Staging.Aries_Planning_Fact_Well_Header      AS src
    FULL JOIN Aries_Planning.Fact_Well_Header AS dst ON dst.API_Number = ISNULL(src.API_Number, dst.API_Number)
WHERE
    (
        src.UID_Left IS NOT NULL
        AND dst.Aries_Planning_Fact_Well_Header_UID IS NOT NULL
    )
    AND src.Processing_State = 1', 'BIT', 0.6, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2370, 1, 125, 1, N'Match PropNum', NULL, N'SELECT
    src.UID_Left AS UID_Left
   ,dst.Aries_Planning_Fact_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.PropNum IS NULL
                  OR dst.PropNum IS NULL THEN
                 0
             WHEN src.PropNum = dst.PropNum THEN
                 1
             ELSE
                 0
         END AS BIT)             AS X
   --,*
FROM Staging.Aries_Planning_Fact_Well_Header      AS src
    FULL JOIN Aries_Planning.Fact_Well_Header AS dst ON dst.PropNum = ISNULL(src.PropNum, dst.PropNum)
WHERE
    (
        src.UID_Left IS NOT NULL
        AND dst.Aries_Planning_Fact_Well_Header_UID IS NOT NULL
    )
    AND src.Processing_State = 1', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2371, 1, 126, 1, N'Match API Number', N'Master Aries Planning', N'SELECT
    src.Aries_Planning_Dim_Well_Header_UID      AS UID_Left
   ,hub.Hub_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.API_Number IS NULL THEN
                 0
             WHEN dst.API_Number = src.API_Number THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Aries_Planning.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.Aries_Planning_Dim_Well_Header AS pag ON src.Aries_Planning_Dim_Well_Header_UID = pag.Aries_Planning_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Master_Well_Header          AS dst ON dst.API_Number = src.API_Number
    INNER JOIN Master.Hub_Well_Header               AS hub ON dst.Hub_Well_Header_ID = hub.Hub_Well_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Aries_Planning_Dim_Well_Header_UID IS NOT NULL
        AND hub.Hub_Well_Header_UID IS NOT NULL
    )
--ORDER BY
--    src.Aries_Planning_Dim_Well_Header_UID
--   ,map.Master_Etl_Well_Header_Map_UID', 'BIT', 0.6, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2372, 1, 126, 1, N'Match Well Name', N'Master Aries Planning', N'SELECT
    src.Aries_Planning_Dim_Well_Header_UID      AS UID_Left
   ,hub.Hub_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.Well_Name_Antero_Standard IS NULL THEN
                 0
             WHEN dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Aries_Planning.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.Aries_Planning_Dim_Well_Header AS pag ON src.Aries_Planning_Dim_Well_Header_UID = pag.Aries_Planning_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Master_Well_Header          AS dst ON dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard
    INNER JOIN Master.Hub_Well_Header               AS hub ON dst.Hub_Well_Header_ID = hub.Hub_Well_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Aries_Planning_Dim_Well_Header_UID IS NOT NULL
        AND hub.Hub_Well_Header_UID IS NOT NULL
    )
--ORDER BY
--    src.Aries_Planning_Dim_Well_Header_UID
--   ,map.Master_Etl_Well_Header_Map_UID', 'BIT', 0.65, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2373, 1, 126, 1, N'Match PropNum', NULL, N'SELECT
    src.Aries_Planning_Dim_Well_Header_UID      AS UID_Left
   ,hub.Hub_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.PropNum IS NULL THEN
                 0
             WHEN dst.PropNum = src.PropNum THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Aries_Planning.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.Aries_Planning_Dim_Well_Header AS pag ON src.Aries_Planning_Dim_Well_Header_UID = pag.Aries_Planning_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Master_Well_Header          AS dst ON dst.PropNum = src.PropNum
    INNER JOIN Master.Hub_Well_Header               AS hub ON dst.Hub_Well_Header_ID = hub.Hub_Well_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Aries_Planning_Dim_Well_Header_UID IS NOT NULL
        AND hub.Hub_Well_Header_UID IS NOT NULL
    )
--ORDER BY
--    src.Aries_Planning_Dim_Well_Header_UID
--   ,map.Master_Etl_Well_Header_Map_UID', 'BIT', 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2374, 1, 126, 1, N'Match SEQNUM', N'Master Aries Planning', N'SELECT
    src.Aries_Planning_Dim_Well_Header_UID      AS UID_Left
   ,hub.Hub_Well_Header_UID AS UID_Right
   ,CAST(CASE
             WHEN src.SEQNUM IS NULL THEN
                 0
             WHEN dst.SEQNUM = src.SEQNUM THEN
                 1
             ELSE
                 0
         END AS BIT)                   AS X
FROM Aries_Planning.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.Aries_Planning_Dim_Well_Header AS pag ON src.Aries_Planning_Dim_Well_Header_UID = pag.Aries_Planning_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Master_Well_Header          AS dst ON dst.SEQNUM = src.SEQNUM
    INNER JOIN Master.Hub_Well_Header               AS hub ON dst.Hub_Well_Header_ID = hub.Hub_Well_Header_ID
    
WHERE
    pag.Processing_State = 1
    AND
    (
        src.Aries_Planning_Dim_Well_Header_UID IS NOT NULL
        AND hub.Hub_Well_Header_UID IS NOT NULL
    )
--ORDER BY
--    src.Aries_Planning_Dim_Well_Header_UID
--   ,map.Master_Etl_Well_Header_Map_UID', 'BIT', 0.75, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2375, 1, 80, 1, N'Match SEQNUM', N'Master Sigmaflow', N'SELECT src.SigmaFlow_Dim_Well_Header_UID AS UID_Left,
       hub.Hub_Well_Header_UID AS UID_Right,
       CAST(CASE
                WHEN src.SEQNUM IS NULL THEN
                    0
                WHEN dst.SEQNUM = src.SEQNUM THEN
                    1
                ELSE
                    0
            END AS BIT) AS X
FROM SigmaFlow.Dim_Well_Header AS src
    INNER JOIN Master_Staging.SigmaFlow_Dim_Well_Header AS pag
        ON src.SigmaFlow_Dim_Well_Header_UID = pag.SigmaFlow_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Master_Well_Header AS dst
        ON dst.SEQNUM = src.SEQNUM
    INNER JOIN Master.Hub_Well_Header AS hub
        ON dst.Hub_Well_Header_ID = hub.Hub_Well_Header_ID
WHERE pag.Processing_State = 1
      AND
      (
          src.SigmaFlow_Dim_Well_Header_UID IS NOT NULL
          AND hub.Hub_Well_Header_UID IS NOT NULL
      );', 'BIT', 0.75, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2376, 1, 8, 1, N'Match Well Name and API', N'Fact Aries', N'SELECT src.UID_Left AS UID_Left,
       dst.Aries_Fact_Well_Header_UID AS UID_Right,
       CAST(CASE
                WHEN src.API_Number IS NULL
                     OR dst.API_Number IS NULL THEN
                    0
                WHEN src.API_Number = dst.API_Number THEN
                    1
                ELSE
                    0
            END AS BIT) AS X FROM Staging.Aries_Fact_Well_Header      AS src      FULL JOIN Aries.Fact_Well_Header AS dst ON dst.API_Number = ISNULL(src.API_Number, dst.API_Number)  WHERE      (          src.UID_Left IS NOT NULL          AND dst.Aries_Fact_Well_Header_UID IS NOT NULL      )      AND src.Processing_State = 1', 'BIT', 0.8, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2377, 1, 8, 1, N'Match Well Name and API', N'Fact Wellview', N'SELECT src.UID_Left AS UID_Left,
       dst.Aries_Fact_Well_Header_UID AS UID_Right,
       CAST(CASE
                WHEN src.API_Number IS NULL
                     OR dst.API_Number IS NULL THEN
                    0
                WHEN src.API_Number = dst.API_Number THEN
                    1
                ELSE
                    0
            END AS BIT) AS X FROM Staging.Aries_Fact_Well_Header      AS src      FULL JOIN Aries.Fact_Well_Header AS dst ON dst.API_Number = ISNULL(src.API_Number, dst.API_Number)  WHERE      (          src.UID_Left IS NOT NULL          AND dst.Aries_Fact_Well_Header_UID IS NOT NULL      )      AND src.Processing_State = 1', 'BIT', 0.8, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2378, 1, 50, 1, N'Match Well Name and API', N'Fact Petra', N'SELECT src.UID_Left AS UID_Left,
       dst.Petra_Fact_Well_Header_UID AS UID_Right,
       CAST(CASE
                WHEN src.API_Number IS NULL
                     OR dst.API_Number IS NULL THEN
                    0
                WHEN src.API_Number = dst.API_Number THEN
                    1
                ELSE
                    0
            END AS BIT) AS X  FROM Staging.Petra_Fact_Well_Header      AS src      FULL JOIN Petra.Fact_Well_Header AS dst ON dst.API_Number = src.API_Number  WHERE      (          src.UID_Left IS NOT NULL          AND dst.Petra_Fact_Well_Header_UID IS NOT NULL      )      AND src.Processing_State = 1', 'BIT', 0.8, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2379, 1, 8, 1, N'Match Well Name and API', N'Fact Enertia', N'SELECT src.UID_Left AS UID_Left,
       dst.Enertia_Fact_Well_Header_UID AS UID_Right,
       CAST(CASE
                WHEN src.API_Number IS NULL
                     OR dst.API_Number IS NULL THEN
                    0
                WHEN src.API_Number = dst.API_Number THEN
                    1
                ELSE
                    0
            END AS BIT) AS X FROM Staging.Enertia_Fact_Well_Header      AS src      FULL JOIN Enertia.Fact_Well_Header AS dst ON dst.API_Number = ISNULL(src.API_Number, dst.API_Number)  WHERE      (          src.UID_Left IS NOT NULL          AND dst.Enertia_Fact_Well_Header_UID IS NOT NULL      )      AND src.Processing_State = 1', 'BIT', 0.8, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2380, 1, 13, 1, N'Match Well Name and Cost Center', N'Dimension Enertia', N'SELECT src.UID_Left AS UID_Left,
       dst.Enertia_Dim_Well_Header_UID AS UID_Right,
       CAST(CASE
                WHEN CONCAT(src.Well_Name_Antero_Standard,src.Cost_Center) IS NULL OR CONCAT(dst.Well_Name_Antero_Standard,dst.Cost_Center) IS NULL THEN
                    0
                WHEN CONCAT(dst.Well_Name_Antero_Standard,dst.Cost_Center) = CONCAT(src.Well_Name_Antero_Standard,src.Cost_Center) THEN
                    1
                ELSE
                    0
            END AS BIT) AS X
FROM Staging.Enertia_Dim_Well_Header AS src
    FULL JOIN Enertia.Dim_Well_Header AS dst
        ON CONCAT(dst.Well_Name_Antero_Standard,dst.Cost_Center) = CONCAT(src.Well_Name_Antero_Standard,src.Cost_Center)
WHERE (
          src.UID_Left IS NOT NULL
          AND dst.Enertia_Dim_Well_Header_UID IS NOT NULL
      )
      AND src.Processing_State = 1;', 'BIT', 0.75, 0, 1, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2381, 1, 66, 1, N'Match Well Name and Cost Center', N'Dimension Wellview', N'SELECT src.UID_Left AS UID_Left,         dst.WellView_Dim_Well_Header_UID AS UID_Right,         CAST(CASE                  WHEN CONCAT(src.Well_Name_Antero_Standard, src.Cost_Center) IS NULL OR CONCAT(dst.Well_Name_Antero_Standard, dst.Cost_Center) IS NULL THEN                       0                  WHEN CONCAT(dst.Well_Name_Antero_Standard, dst.Cost_Center) = CONCAT(src.Well_Name_Antero_Standard,src.Cost_Center) THEN                          1                  ELSE                       0             END AS BIT) AS X           FROM Staging.WellView_Dim_Well_Header AS src      FULL JOIN WellView.Dim_Well_Header AS dst          ON CONCAT(dst.Well_Name_Antero_Standard, dst.Cost_Center) = CONCAT(src.Well_Name_Antero_Standard,src.Cost_Center)        WHERE (            src.UID_Left IS NOT NULL            AND dst.WellView_Dim_Well_Header_UID IS NOT NULL        )        AND src.Processing_State = 1', 'BIT', 0.75, 0, 1, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2382, 1, 28, 1, N'Match Well Name and Cost Center', N'Dimension Merrick', N'SELECT         src.UID_Left AS UID_Left        ,dst.Merrick_Dim_Well_Header_UID AS UID_Right        ,CAST(CASE                  WHEN CONCAT(src.Well_Name_Antero_Standard, src.Cost_Center) IS NULL OR CONCAT(dst.Well_Name_Antero_Standard, dst.Cost_Center) IS NULL THEN                      0                  WHEN CONCAT(dst.Well_Name_Antero_Standard, dst.Cost_Center) = CONCAT(src.Well_Name_Antero_Standard,src.Cost_Center) THEN                      1                  ELSE                      0              END AS BIT)    AS X  FROM Staging.Merrick_Dim_Well_Header        AS src      FULL JOIN Merrick.Dim_Well_Header AS dst ON CONCAT(dst.Well_Name_Antero_Standard, dst.Cost_Center) = CONCAT(src.Well_Name_Antero_Standard,src.Cost_Center)      WHERE      src.Processing_State = 1      AND      (          src.UID_Left IS NOT NULL          AND dst.Merrick_Dim_Well_Header_UID IS NOT NULL      )', 'BIT', 0.75, 0, 1, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2383, 1, 8, 1, N'Match Well Name and SEQNUM', N'Fact Wellview', N'SELECT src.UID_Left AS UID_Left,         dst.WellView_Fact_Well_Header_UID AS UID_Right,         CAST(CASE                  WHEN src.Well_Name_Antero_Standard IS NULL                         OR dst.Well_Name_Antero_Standard IS NULL THEN                       0                  WHEN src.Well_Name_Antero_Standard = dst.Well_Name_Antero_Standard THEN                          1                  ELSE                       0             END AS BIT) AS X           FROM Staging.WellView_Fact_Well_Header AS src      FULL JOIN WellView.Fact_Well_Header AS dst          ON dst.Well_Name_Antero_Standard   = ISNULL(src.Well_Name_Antero_Standard,src.Well_Name_Antero_Standard)        WHERE (            src.UID_Left IS NOT NULL            AND dst.WellView_Fact_Well_Header_UID IS NOT NULL        )        AND src.Processing_State = 1', 'BIT', 0.85, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2384, 1, 2, 1, N'Match Well Name and SEQNUM', N'Master Aries', N'SELECT src.Aries_Dim_Well_Header_UID AS UID_Left,
       hub.Hub_Well_Header_UID AS UID_Right,
       CAST(CASE
                WHEN NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.SEQNUM), N'''') IS NULL THEN
                    0
                WHEN NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.SEQNUM), N'''') = 
				     NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.SEQNUM), N'''') THEN
                    1
                ELSE
                    0
            END AS BIT) AS X
FROM Aries.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.Aries_Dim_Well_Header AS pag
        ON src.Aries_Dim_Well_Header_UID = pag.Aries_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Master_Well_Header             AS dst
        ON NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.SEQNUM), N'''') = NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.SEQNUM), N'''')
    INNER JOIN Master.Hub_Well_Header                   AS hub
        ON dst.Hub_Well_Header_ID = hub.Hub_Well_Header_ID
WHERE pag.Processing_State = 1
      AND
      (
          src.Aries_Dim_Well_Header_UID IS NOT NULL
          AND hub.Hub_Well_Header_UID IS NOT NULL
      );', 'BIT', 0.85, 0, 1, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2385, 1, 13, 1, N'Match Well Name and SEQNUM', N'Dimension Enertia', N'SELECT src.UID_Left AS UID_Left,
       dst.Enertia_Dim_Well_Header_UID AS UID_Right,
       CAST(CASE
                WHEN CONCAT(src.Well_Name_Antero_Standard,src.SEQNUM) IS NULL OR CONCAT(dst.Well_Name_Antero_Standard,dst.SEQNUM) IS NULL THEN
                    0
                WHEN CONCAT(dst.Well_Name_Antero_Standard,dst.SEQNUM) = CONCAT(src.Well_Name_Antero_Standard,src.SEQNUM) THEN
                    1
                ELSE
                    0
            END AS BIT) AS X
FROM Staging.Enertia_Dim_Well_Header AS src
    FULL JOIN Enertia.Dim_Well_Header AS dst
        ON CONCAT(dst.Well_Name_Antero_Standard,dst.SEQNUM) = CONCAT(src.Well_Name_Antero_Standard,src.SEQNUM)
WHERE (
          src.UID_Left IS NOT NULL
          AND dst.Enertia_Dim_Well_Header_UID IS NOT NULL
      )
      AND src.Processing_State = 1;', 'BIT', 0.85, 0, 1, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2386, 1, 49, 1, N'Match Well Name and SEQNUM', N'Dimension Petra', N'SELECT src.UID_Left AS UID_Left,
       dst.Petra_Dim_Well_Header_UID AS UID_Right,
       CAST(CASE
                WHEN CONCAT(src.Well_Name_Antero_Standard,src.SEQNUM) IS NULL OR CONCAT(dst.Well_Name_Antero_Standard,dst.SEQNUM) IS NULL THEN
                    0
                WHEN CONCAT(dst.Well_Name_Antero_Standard, dst.SEQNUM) = CONCAT(src.Well_Name_Antero_Standard,src.SEQNUM) THEN
                    1
                ELSE
                    0
            END AS BIT) AS X
FROM Staging.Petra_Dim_Well_Header AS src
    FULL JOIN Petra.Dim_Well_Header AS dst
        ON CONCAT(dst.Well_Name_Antero_Standard,dst.SEQNUM) = CONCAT(src.Well_Name_Antero_Standard,src.SEQNUM)
WHERE (
          src.UID_Left IS NOT NULL
          AND dst.Petra_Dim_Well_Header_UID IS NOT NULL
      )
      AND src.Processing_State = 1;', 'BIT', 0.85, 0, 1, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2387, 1, 50, 1, N'Match Well Name and SEQNUM', N'Fact Petra', N'SELECT src.UID_Left AS UID_Left,
       dst.Petra_Fact_Well_Header_UID AS UID_Right,
       CAST(CASE
                WHEN src.SEQNUM IS NULL OR dst.SEQNUM  IS NULL THEN
                    0
                WHEN src.SEQNUM = dst.SEQNUM THEN
                    1
                ELSE
                    0
            END AS BIT) AS X
FROM Staging.Petra_Fact_Well_Header AS src
    FULL JOIN Petra.Fact_Well_Header AS dst
        ON dst.SEQNUM = src.SEQNUM 
WHERE (
          src.UID_Left IS NOT NULL
          AND dst.Petra_Fact_Well_Header_UID IS NOT NULL
      )
      AND src.Processing_State = 1;', 'BIT', 0.85, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2388, 1, 76, 1, N'Match Well Name and SEQNUM', N'Master Enertia', N'SELECT src.Enertia_Dim_Well_Header_UID AS UID_Left,
       hub.Hub_Well_Header_UID AS UID_Right,
       CAST(CASE
                WHEN NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.SEQNUM), N'''') IS NULL THEN
                    0
                WHEN NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.SEQNUM), N'''') = 
				     NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.SEQNUM), N'''') THEN
                    1
                ELSE
                    0
            END AS BIT) AS X
FROM Enertia.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.Enertia_Dim_Well_Header AS pag
        ON src.Enertia_Dim_Well_Header_UID = pag.Enertia_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Master_Well_Header             AS dst
        ON NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.SEQNUM), N'''') = NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.SEQNUM), N'''')
    INNER JOIN Master.Hub_Well_Header                   AS hub
        ON dst.Hub_Well_Header_ID = hub.Hub_Well_Header_ID
WHERE pag.Processing_State = 1
      AND
      (
          src.Enertia_Dim_Well_Header_UID IS NOT NULL
          AND hub.Hub_Well_Header_UID IS NOT NULL
      );', 'BIT', 0.85, 0, 1, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2389, 1, 77, 1, N'Match Well Name and SEQNUM', N'Master FracSchedule', N'SELECT src.FracSchedule_Dim_Well_Header_UID AS UID_Left,
       hub.Hub_Well_Header_UID AS UID_Right,
       CAST(CASE
                WHEN NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.SEQNUM), N'''') IS NULL THEN
                    0
                WHEN NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.SEQNUM), N'''') = 
				     NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.SEQNUM), N'''') THEN
                    1
                ELSE
                    0
            END AS BIT) AS X
FROM FracSchedule.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.FracSchedule_Dim_Well_Header AS pag
        ON src.FracSchedule_Dim_Well_Header_UID = pag.FracSchedule_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Master_Well_Header             AS dst
        ON NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.SEQNUM), N'''') = NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.SEQNUM), N'''')
    INNER JOIN Master.Hub_Well_Header                   AS hub
        ON dst.Hub_Well_Header_ID = hub.Hub_Well_Header_ID
WHERE pag.Processing_State = 1
      AND
      (
          src.FracSchedule_Dim_Well_Header_UID IS NOT NULL
          AND hub.Hub_Well_Header_UID IS NOT NULL
      );', 'BIT', 0.85, 0, 1, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2390, 1, 86, 1, N'Match Well Name and SEQNUM', N'Master Petra', N'SELECT src.Petra_Dim_Well_Header_UID AS UID_Left,
       hub.Hub_Well_Header_UID AS UID_Right,
       CAST(CASE
                WHEN NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.SEQNUM), N'''') IS NULL THEN
                    0
                WHEN NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.SEQNUM), N'''') = 
				     NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.SEQNUM), N'''') THEN
                    1
                ELSE
                    0
            END AS BIT) AS X
FROM Petra.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.Petra_Dim_Well_Header AS pag
        ON src.Petra_Dim_Well_Header_UID = pag.Petra_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Master_Well_Header             AS dst
        ON NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.SEQNUM), N'''') = NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.SEQNUM), N'''')
    INNER JOIN Master.Hub_Well_Header                   AS hub
        ON dst.Hub_Well_Header_ID = hub.Hub_Well_Header_ID
WHERE pag.Processing_State = 1
      AND
      (
          src.Petra_Dim_Well_Header_UID IS NOT NULL
          AND hub.Hub_Well_Header_UID IS NOT NULL
      );', 'BIT', 0.85, 0, 1, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2391, 1, 8, 1, N'Match Well Name and SEQNUM', N'Fact Enertia', N'SELECT src.UID_Left AS UID_Left,
       dst.Enertia_Fact_Well_Header_UID AS UID_Right,
       CAST(CASE
                WHEN src.SEQNUM IS NULL OR dst.SEQNUM IS NULL THEN
                    0
                WHEN dst.SEQNUM = src.SEQNUM  THEN
                    1
                ELSE
                    0
            END AS BIT) AS X
FROM Staging.Enertia_Fact_Well_Header AS src
    FULL JOIN Enertia.Fact_Well_Header AS dst
        ON dst.SEQNUM = src.SEQNUM 
WHERE (
          src.UID_Left IS NOT NULL
          AND dst.Enertia_Fact_Well_Header_UID IS NOT NULL
      )
      AND src.Processing_State = 1;', 'BIT', 0.85, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2392, 1, 114, 1, N'Match Well Name and SEQNUM', N'Dimension GIS', N'SELECT src.UID_Left AS UID_Left,
       dst.GIS_Dim_Well_Header_UID AS UID_Right,
       CAST(CASE
                WHEN CONCAT(src.Well_Name_Antero_Standard,src.SEQNUM) IS NULL OR CONCAT(dst.Well_Name_Antero_Standard,dst.SEQNUM) IS NULL THEN
                    0
                WHEN CONCAT(dst.Well_Name_Antero_Standard,dst.SEQNUM) = CONCAT(src.Well_Name_Antero_Standard,src.SEQNUM) THEN
                    1
                ELSE
                    0
            END AS BIT) AS X
FROM Staging.GIS_Dim_Well_Header AS src
    FULL JOIN GIS.Dim_Well_Header AS dst
        ON CONCAT(dst.Well_Name_Antero_Standard,dst.SEQNUM) = CONCAT(src.Well_Name_Antero_Standard,src.SEQNUM)
WHERE src.Processing_State = 1
      AND
      (
          src.UID_Left IS NOT NULL
          AND dst.GIS_Dim_Well_Header_UID IS NOT NULL
      );', 'BIT', 1, 0, 1, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2393, 1, 115, 1, N'Match Well Name and SEQNUM', N'Master GIS', N'SELECT src.GIS_Dim_Well_Header_UID AS UID_Left,
       hub.Hub_Well_Header_UID AS UID_Right,
       CAST(CASE
                WHEN NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.SEQNUM), N'''') IS NULL THEN
                    0
                WHEN NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.SEQNUM), N'''') = 
				     NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.SEQNUM), N'''') THEN
                    1
                ELSE
                    0
            END AS BIT) AS X
FROM GIS.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.GIS_Dim_Well_Header AS pag
        ON src.GIS_Dim_Well_Header_UID = pag.GIS_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Master_Well_Header             AS dst
        ON NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.SEQNUM), N'''') = NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.SEQNUM), N'''')
    INNER JOIN Master.Hub_Well_Header                   AS hub
        ON dst.Hub_Well_Header_ID = hub.Hub_Well_Header_ID
WHERE pag.Processing_State = 1
      AND
      (
          src.GIS_Dim_Well_Header_UID IS NOT NULL
          AND hub.Hub_Well_Header_UID IS NOT NULL
      );', 'BIT', 1, 0, 1, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2394, 1, 125, 1, N'Match Well Name and SEQNUM', N'Fact Aries Planning', N'SELECT src.UID_Left AS UID_Left,
       dst.Aries_Planning_Fact_Well_Header_UID AS UID_Right,
       CAST(CASE
                WHEN src.SEQNUM IS NULL OR dst.SEQNUM IS NULL THEN
                    0
                WHEN dst.SEQNUM = src.SEQNUM THEN
                    1
                ELSE
                    0
            END AS BIT) AS X
FROM Staging.Aries_Planning_Fact_Well_Header AS src
    FULL JOIN Aries_Planning.Fact_Well_Header AS dst
        ON dst.SEQNUM = src.SEQNUM 
WHERE (
          src.UID_Left IS NOT NULL
          AND dst.Aries_Planning_Fact_Well_Header_UID IS NOT NULL
      )
      AND src.Processing_State = 1;', 'BIT', 0.85, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2395, 1, 126, 1, N'Match Well Name and SEQNUM', N'Master Aries Planning', N'SELECT src.Aries_Planning_Dim_Well_Header_UID AS UID_Left,
       hub.Hub_Well_Header_UID AS UID_Right,
       CAST(CASE
                WHEN NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.SEQNUM), N'''') IS NULL THEN
                    0
                WHEN NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.SEQNUM), N'''') = 
				     NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.SEQNUM), N'''') THEN
                    1
                ELSE
                    0
            END AS BIT) AS X
FROM Aries_Planning.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.Aries_Planning_Dim_Well_Header AS pag
        ON src.Aries_Planning_Dim_Well_Header_UID = pag.Aries_Planning_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Master_Well_Header             AS dst
        ON NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.SEQNUM), N'''') = NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.SEQNUM), N'''')
    INNER JOIN Master.Hub_Well_Header                   AS hub
        ON dst.Hub_Well_Header_ID = hub.Hub_Well_Header_ID
WHERE pag.Processing_State = 1
      AND
      (
          src.Aries_Planning_Dim_Well_Header_UID IS NOT NULL
          AND hub.Hub_Well_Header_UID IS NOT NULL
      );', 'BIT', 0.85, 0, 1, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2396, 1, 125, 1, N'Match Well Name and API', N'Fact Aries Planning', N'SELECT src.UID_Left AS UID_Left,
       dst.Aries_Planning_Fact_Well_Header_UID AS UID_Right,
       CAST(CASE
                WHEN src.API_Number IS NULL
                     OR dst.API_Number IS NULL THEN
                    0
                WHEN src.API_Number = dst.API_Number THEN
                    1
                ELSE
                    0
            END AS BIT) AS X FROM Staging.Aries_Planning_Fact_Well_Header      AS src      FULL JOIN Aries_Planning.Fact_Well_Header AS dst ON dst.API_Number = ISNULL(src.API_Number, dst.API_Number)  WHERE      (          src.UID_Left IS NOT NULL          AND dst.Aries_Planning_Fact_Well_Header_UID IS NOT NULL      )      AND src.Processing_State = 1', 'BIT', 0.8, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2397, 1, 66, 1, N'Match Well Name and SEQNUM', N'Dimension Wellview', N'SELECT src.UID_Left AS UID_Left,         dst.WellView_Dim_Well_Header_UID AS UID_Right,         CAST(CASE                  WHEN src.Well_Name_Antero_Standard IS NULL                         OR dst.Well_Name_Antero_Standard IS NULL THEN                       0                  WHEN src.Well_Name_Antero_Standard = dst.Well_Name_Antero_Standard THEN                          1                  ELSE                       0             END AS BIT) AS X           FROM Staging.WellView_Dim_Well_Header AS src      FULL JOIN WellView.Dim_Well_Header AS dst          ON dst.Well_Name_Antero_Standard   = ISNULL(src.Well_Name_Antero_Standard,src.Well_Name_Antero_Standard)        WHERE (            src.UID_Left IS NOT NULL            AND dst.WellView_Dim_Well_Header_UID IS NOT NULL        )        AND src.Processing_State = 1', 'BIT', 0.85, 0, 1, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2398, 1, 60, 1, N'Match Well Name and SEQNUM', N'Dimension SigmaFlow', N'SELECT src.UID_Left AS UID_Left,
       dst.SigmaFlow_Dim_Well_Header_UID AS UID_Right,
       CAST(CASE
                WHEN CONCAT(src.Well_Name_Antero_Standard,src.SEQNUM) IS NULL OR CONCAT(dst.Well_Name_Antero_Standard,dst.SEQNUM) IS NULL THEN
                    0
                WHEN CONCAT(dst.Well_Name_Antero_Standard,dst.SEQNUM) = CONCAT(src.Well_Name_Antero_Standard,src.SEQNUM) THEN
                    1
                ELSE
                    0
            END AS BIT) AS X
FROM Staging.SigmaFlow_Dim_Well_Header AS src
    FULL JOIN SigmaFlow.Dim_Well_Header AS dst
        ON CONCAT(dst.Well_Name_Antero_Standard,dst.SEQNUM) = CONCAT(src.Well_Name_Antero_Standard,src.SEQNUM)
WHERE (
          src.UID_Left IS NOT NULL
          AND dst.SigmaFlow_Dim_Well_Header_UID IS NOT NULL
      )
      AND src.Processing_State = 1;', 'BIT', 0.85, 0, 1, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2399, 1, 28, 1, N'Match Well Name and SEQNUM', N'Dimension Merrick', N'SELECT         src.UID_Left AS UID_Left        ,dst.Merrick_Dim_Well_Header_UID AS UID_Right        ,CAST(CASE                  WHEN src.Well_Name_Antero_Standard IS NULL THEN                      0                  WHEN dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard THEN                      1                  ELSE                      0              END AS BIT)    AS X  FROM Staging.Merrick_Dim_Well_Header        AS src      FULL JOIN Merrick.Dim_Well_Header AS dst ON     dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard      WHERE      src.Processing_State = 1      AND      (          src.UID_Left IS NOT NULL          AND dst.Merrick_Dim_Well_Header_UID IS NOT NULL      )', 'BIT', 0.85, 0, 1, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2400, 1, 78, 1, N'Match Well Name and SEQNUM', N'Master Merrick', N'SELECT      src.Merrick_Dim_Well_Header_UID      AS UID_Left     ,hub.Hub_Well_Header_UID AS UID_Right     ,CAST(CASE               WHEN src.Well_Name_Antero_Standard IS NULL THEN                   0               WHEN dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard THEN                   1               ELSE                   0           END AS BIT)                   AS X  FROM Merrick.Dim_Well_Header                          AS src      INNER JOIN Master_Staging.Merrick_Dim_Well_Header AS pag ON src.Merrick_Dim_Well_Header_UID = pag.Merrick_Dim_Well_Header_UID      FULL JOIN Master_Etl.Master_Well_Header          AS dst ON dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard      INNER JOIN Master.Hub_Well_Header               AS hub ON dst.Hub_Well_Header_ID = hub.Hub_Well_Header_ID        WHERE      pag.Processing_State = 1      AND      (          src.Merrick_Dim_Well_Header_UID IS NOT NULL          AND hub.Hub_Well_Header_UID IS NOT NULL      )  --ORDER BY  --    src.Merrick_Dim_Well_Header_UID  --   ,map.Master_Etl_Well_Header_Map_UID', 'BIT', 0.85, 0, 1, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2401, 1, 79, 1, N'Match Well Name and SEQNUM', N'Master Wellview', N'SELECT      src.WellView_Dim_Well_Header_UID      AS UID_Left     ,hub.Hub_Well_Header_UID AS UID_Right     ,CAST(CASE               WHEN src.Well_Name_Antero_Standard IS NULL THEN                   0               WHEN dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard THEN                   1               ELSE                   0           END AS BIT)                   AS X  FROM WellView.Dim_Well_Header                          AS src      INNER JOIN Master_Staging.WellView_Dim_Well_Header AS pag ON src.WellView_Dim_Well_Header_UID = pag.WellView_Dim_Well_Header_UID      FULL JOIN Master_Etl.Master_Well_Header          AS dst ON dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard      INNER JOIN Master.Hub_Well_Header               AS hub ON dst.Hub_Well_Header_ID = hub.Hub_Well_Header_ID        WHERE      pag.Processing_State = 1      AND      (          src.WellView_Dim_Well_Header_UID IS NOT NULL          AND hub.Hub_Well_Header_UID IS NOT NULL      )', 'BIT', 0.85, 0, 1, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2402, 1, 80, 2, N'Match Well Name and SEQNUM', N'Master Sigmaflow', N'SELECT src.SigmaFlow_Dim_Well_Header_UID AS UID_Left,
       hub.Hub_Well_Header_UID AS UID_Right,
       CAST(CASE
                WHEN NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.SEQNUM), N'''') IS NULL THEN
                    0
                WHEN NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.SEQNUM), N'''') = 
				     NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.SEQNUM), N'''') THEN
                    1
                ELSE
                    0
            END AS BIT) AS X
FROM SigmaFlow.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.SigmaFlow_Dim_Well_Header AS pag
        ON src.SigmaFlow_Dim_Well_Header_UID = pag.SigmaFlow_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Master_Well_Header             AS dst
        ON NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.SEQNUM), N'''') = NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.SEQNUM), N'''')
    INNER JOIN Master.Hub_Well_Header                   AS hub
        ON dst.Hub_Well_Header_ID = hub.Hub_Well_Header_ID
WHERE pag.Processing_State = 1
      AND
      (
          src.SigmaFlow_Dim_Well_Header_UID IS NOT NULL
          AND hub.Hub_Well_Header_UID IS NOT NULL
      );', 'BIT', 0.85, 0, 1, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2403, 1, 8, 1, N'Match Well Name and API', N'Fact Merrick', N'SELECT src.UID_Left AS UID_Left,
       dst.Merrick_Fact_Well_Header_UID AS UID_Right,
       CAST(CASE
                WHEN src.Merrick_ID IS NULL
                     OR dst.Merrick_ID IS NULL THEN
                    0
                WHEN src.Merrick_ID = dst.Merrick_ID THEN
                    1
                ELSE
                    0
            END AS BIT) AS X FROM Staging.Merrick_Fact_Well_Header      AS src      FULL JOIN Merrick.Fact_Well_Header AS dst ON dst.Merrick_ID = ISNULL(src.Merrick_ID, dst.Merrick_ID)  WHERE      (          src.UID_Left IS NOT NULL          AND dst.Merrick_Fact_Well_Header_UID IS NOT NULL      )      AND src.Processing_State = 1', 'BIT', 0.8, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2404, 1, 8, 1, N'Match Well Name and Cost Center', N'Fact Merrick', N'SELECT src.UID_Left AS UID_Left,
       dst.Merrick_Fact_Well_Header_UID AS UID_Right,
       CAST(CASE
                WHEN src.Cost_Center IS NULL
                     OR dst.Cost_Center IS NULL THEN
                    0
                WHEN src.Cost_Center = dst.Cost_Center THEN
                    1
                ELSE
                    0
            END AS BIT) AS X FROM Staging.Merrick_Fact_Well_Header      AS src      FULL JOIN Merrick.Fact_Well_Header AS dst ON dst.Cost_Center = ISNULL(src.Cost_Center, dst.Cost_Center)  WHERE      (          src.UID_Left IS NOT NULL          AND dst.Merrick_Fact_Well_Header_UID IS NOT NULL      )      AND src.Processing_State = 1', 'BIT', 0.75, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2405, 1, 7, 1, N'Match Well Name and SEQNUM', N'Dimension Aries Planning', N'SELECT src.UID_Left AS UID_Left,
       dst.Aries_Planning_Dim_Well_Header_UID AS UID_Right,
       CAST(CASE
                WHEN CONCAT(src.Well_Name_Antero_Standard,src.SEQNUM) IS NULL OR CONCAT(dst.Well_Name_Antero_Standard,dst.SEQNUM) IS NULL THEN
                    0
                WHEN CONCAT(dst.Well_Name_Antero_Standard,dst.SEQNUM) = CONCAT(src.Well_Name_Antero_Standard,src.SEQNUM) THEN
                    1
                ELSE
                    0
            END AS BIT) AS X
FROM Staging.Aries_Planning_Dim_Well_Header AS src
    FULL JOIN Aries_Planning.Dim_Well_Header AS dst
        ON CONCAT(dst.Well_Name_Antero_Standard,dst.SEQNUM) = CONCAT(src.Well_Name_Antero_Standard,src.SEQNUM)
WHERE (
          src.UID_Left IS NOT NULL
          AND dst.Aries_Planning_Dim_Well_Header_UID IS NOT NULL
      )
      AND src.Processing_State = 1;', 'BIT', 0.85, 0, 1, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2406, 1, 8, 1, N'Match Well Name and SEQNUM', N'Fact Merrick', N'SELECT         src.UID_Left AS UID_Left        ,dst.Merrick_Fact_Well_Header_UID AS UID_Right        ,CAST(CASE                  WHEN src.Well_Name_Antero_Standard IS NULL THEN                      0                  WHEN dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard THEN                      1                  ELSE                      0              END AS BIT)    AS X  FROM Staging.Merrick_Fact_Well_Header        AS src      FULL JOIN Merrick.Fact_Well_Header AS dst ON     dst.Well_Name_Antero_Standard = src.Well_Name_Antero_Standard      WHERE      src.Processing_State = 1      AND      (          src.UID_Left IS NOT NULL          AND dst.Merrick_Fact_Well_Header_UID IS NOT NULL      )', 'BIT', 0.85, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2407, 1, 20, 1, N'Match Well Name and API', N'Dimension GIS', N'SELECT src.UID_Left AS UID_Left,
       dst.GIS_Dim_Well_Header_UID AS UID_Right,
       CAST(CASE
                WHEN CONCAT(src.Well_Name_Antero_Standard,src.API_Number) IS NULL OR CONCAT(dst.Well_Name_Antero_Standard,dst.API_Number) IS NULL THEN
                    0
                WHEN CONCAT(dst.Well_Name_Antero_Standard,dst.API_Number) = CONCAT(src.Well_Name_Antero_Standard,src.API_Number) THEN
                    1
                ELSE
                    0
            END AS BIT) AS X
FROM Staging.GIS_Dim_Well_Header AS src
    FULL JOIN GIS.Dim_Well_Header AS dst
        ON CONCAT(dst.Well_Name_Antero_Standard,dst.API_Number) = CONCAT(src.Well_Name_Antero_Standard,src.API_Number)
WHERE src.Processing_State = 1
      AND
      (
          src.UID_Left IS NOT NULL
          AND dst.GIS_Dim_Well_Header_UID IS NOT NULL
      );', 'BIT', 0.95, 0, 1, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2408, 1, 7, 1, N'Match Well Name and API', N'Dimension Aries', N'SELECT src.UID_Left AS UID_Left,
       dst.Aries_Dim_Well_Header_UID AS UID_Right,
       CAST(CASE
                WHEN CONCAT(src.Well_Name_Antero_Standard,src.API_Number) IS NULL OR CONCAT(dst.Well_Name_Antero_Standard,dst.API_Number) IS NULL THEN
                    0
                WHEN CONCAT(dst.Well_Name_Antero_Standard,dst.API_Number) = CONCAT(src.Well_Name_Antero_Standard,src.API_Number) THEN
                    1
                ELSE
                    0
            END AS BIT) AS X
FROM Staging.Aries_Dim_Well_Header AS src
    FULL JOIN Aries.Dim_Well_Header AS dst
        ON CONCAT(dst.Well_Name_Antero_Standard,dst.API_Number) = CONCAT(src.Well_Name_Antero_Standard,src.API_Number)
WHERE (
          src.UID_Left IS NOT NULL
          AND dst.Aries_Dim_Well_Header_UID IS NOT NULL
      )
      AND src.Processing_State = 1;', 'BIT', 0.8, 0, 1, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2409, 1, 13, 1, N'Match Well Name and API', N'Dimension Enertia', N'SELECT src.UID_Left AS UID_Left,
       dst.Enertia_Dim_Well_Header_UID AS UID_Right,
       CAST(CASE
                WHEN CONCAT(src.Well_Name_Antero_Standard,src.API_Number) IS NULL OR CONCAT(dst.Well_Name_Antero_Standard,dst.API_Number) IS NULL THEN
                    0
                WHEN CONCAT(dst.Well_Name_Antero_Standard,dst.API_Number) = CONCAT(src.Well_Name_Antero_Standard,src.API_Number) THEN
                    1
                ELSE
                    0
            END AS BIT) AS X
FROM Staging.Enertia_Dim_Well_Header AS src
    FULL JOIN Enertia.Dim_Well_Header AS dst
        ON CONCAT(dst.Well_Name_Antero_Standard,dst.API_Number) = CONCAT(src.Well_Name_Antero_Standard,src.API_Number)
WHERE (
          src.UID_Left IS NOT NULL
          AND dst.Enertia_Dim_Well_Header_UID IS NOT NULL
      )
      AND src.Processing_State = 1;', 'BIT', 0.8, 0, 1, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2410, 1, 49, 1, N'Match Well Name and API', N'Dimension Petra', N'SELECT src.UID_Left AS UID_Left,
       dst.Petra_Dim_Well_Header_UID AS UID_Right,
       CAST(CASE
                WHEN CONCAT(src.Well_Name_Antero_Standard,src.API_Number) IS NULL OR CONCAT(dst.Well_Name_Antero_Standard,dst.API_Number) IS NULL THEN
                    0
                WHEN CONCAT(dst.Well_Name_Antero_Standard, dst.API_Number) = CONCAT(src.Well_Name_Antero_Standard,src.API_Number) THEN
                    1
                ELSE
                    0
            END AS BIT) AS X
FROM Staging.Petra_Dim_Well_Header AS src
    FULL JOIN Petra.Dim_Well_Header AS dst
        ON CONCAT(dst.Well_Name_Antero_Standard,dst.API_Number) = CONCAT(src.Well_Name_Antero_Standard,src.API_Number)
WHERE (
          src.UID_Left IS NOT NULL
          AND dst.Petra_Dim_Well_Header_UID IS NOT NULL
      )
      AND src.Processing_State = 1;', 'BIT', 0.8, 0, 1, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2411, 1, 66, 1, N'Match Well Name and API', N'Dimension Wellview', N'SELECT src.UID_Left AS UID_Left,         dst.WellView_Dim_Well_Header_UID AS UID_Right,         CAST(CASE                  WHEN CONCAT(src.Well_Name_Antero_Standard, src.API_Number) IS NULL OR CONCAT(dst.Well_Name_Antero_Standard, dst.API_Number) IS NULL THEN
                    0               WHEN CONCAT(dst.Well_Name_Antero_Standard, dst.API_Number) = CONCAT(src.Well_Name_Antero_Standard,src.API_Number) THEN                          1                  ELSE                       0             END AS BIT) AS X           FROM Staging.WellView_Dim_Well_Header AS src      FULL JOIN WellView.Dim_Well_Header AS dst          ON CONCAT(dst.Well_Name_Antero_Standard, dst.API_Number) = CONCAT(src.Well_Name_Antero_Standard, src.API_Number)        WHERE (            src.UID_Left IS NOT NULL            AND dst.WellView_Dim_Well_Header_UID IS NOT NULL        )        AND src.Processing_State = 1', 'BIT', 0.8, 0, 1, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2412, 1, 60, 1, N'Match Well Name and API', N'Dimension SigmaFlow', N'SELECT src.UID_Left AS UID_Left,
       dst.SigmaFlow_Dim_Well_Header_UID AS UID_Right,
       CAST(CASE
                WHEN CONCAT(src.Well_Name_Antero_Standard,src.API_Number) IS NULL OR CONCAT(dst.Well_Name_Antero_Standard,dst.API_Number) IS NULL THEN
                    0
                WHEN CONCAT(dst.Well_Name_Antero_Standard,dst.API_Number) = CONCAT(src.Well_Name_Antero_Standard,src.API_Number) THEN
                    1
                ELSE
                    0
            END AS BIT) AS X
FROM Staging.SigmaFlow_Dim_Well_Header AS src
    FULL JOIN SigmaFlow.Dim_Well_Header AS dst
        ON CONCAT(dst.Well_Name_Antero_Standard,dst.API_Number) = CONCAT(src.Well_Name_Antero_Standard,src.API_Number)
WHERE (
          src.UID_Left IS NOT NULL
          AND dst.SigmaFlow_Dim_Well_Header_UID IS NOT NULL
      )
      AND src.Processing_State = 1;', 'BIT', 0.8, 0, 1, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2413, 1, 28, 1, N'Match Well Name and API', N'Dimension Merrick', N'SELECT         src.UID_Left AS UID_Left        ,dst.Merrick_Dim_Well_Header_UID AS UID_Right        ,CAST(CASE                  WHEN CONCAT(src.Well_Name_Antero_Standard, src.API_Number) IS NULL OR CONCAT(dst.Well_Name_Antero_Standard, dst.API_Number) IS NULL THEN                      0                  WHEN CONCAT(dst.Well_Name_Antero_Standard, dst.API_Number) = CONCAT(src.Well_Name_Antero_Standard,src.API_Number) THEN                      1                  ELSE                      0              END AS BIT)    AS X  FROM Staging.Merrick_Dim_Well_Header        AS src      FULL JOIN Merrick.Dim_Well_Header AS dst ON CONCAT(dst.Well_Name_Antero_Standard, dst.API_Number) = CONCAT(src.Well_Name_Antero_Standard, src.API_Number)      WHERE      src.Processing_State = 1      AND      (          src.UID_Left IS NOT NULL          AND dst.Merrick_Dim_Well_Header_UID IS NOT NULL      )', 'BIT', 0.8, 0, 1, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2414, 1, 7, 1, N'Match Well Name and API', N'Dimension Aries Planning', N'SELECT src.UID_Left AS UID_Left,
       dst.Aries_Dim_Well_Header_UID AS UID_Right,
       CAST(CASE
                WHEN CONCAT(src.Well_Name_Antero_Standard,src.API_Number) IS NULL OR CONCAT(dst.Well_Name_Antero_Standard,dst.API_Number) IS NULL THEN
                    0
                WHEN CONCAT(dst.Well_Name_Antero_Standard,dst.API_Number) = CONCAT(src.Well_Name_Antero_Standard,src.API_Number) THEN
                    1
                ELSE
                    0
            END AS BIT) AS X
FROM Staging.Aries_Dim_Well_Header AS src
    FULL JOIN Aries.Dim_Well_Header AS dst
        ON CONCAT(dst.Well_Name_Antero_Standard,dst.API_Number) = CONCAT(src.Well_Name_Antero_Standard,src.API_Number)
WHERE (
          src.UID_Left IS NOT NULL
          AND dst.Aries_Dim_Well_Header_UID IS NOT NULL
      )
      AND src.Processing_State = 1;', 'BIT', 0.8, 0, 1, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2415, 1, 61, 1, N'Match Well Name and API', N'Fact SigmaFlow', N'SELECT src.UID_Left AS UID_Left,
       dst.SigmaFlow_Fact_Well_Header_UID AS UID_Right,
       CAST(CASE
                WHEN src.API_Number IS NULL
                     OR dst.API_Number IS NULL THEN
                    0
                WHEN src.API_Number = dst.API_Number THEN
                    1
                ELSE
                    0
            END AS BIT) AS X FROM Staging.SigmaFlow_Fact_Well_Header      AS src      FULL JOIN SigmaFlow.Fact_Well_Header AS dst ON dst.API_Number = ISNULL(src.API_Number, dst.API_Number)  WHERE      (          src.UID_Left IS NOT NULL          AND dst.SigmaFlow_Fact_Well_Header_UID IS NOT NULL      )      AND src.Processing_State = 1', 'BIT', 0.8, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2416, 1, 8, 1, N'Match Well Name and Cost Center', N'Fact Wellview', N'SELECT src.UID_Left AS UID_Left,
       dst.Wellview_Fact_Well_Header_UID AS UID_Right,
       CAST(CASE
                WHEN src.Cost_Center IS NULL
                     OR dst.Cost_Center IS NULL THEN
                    0
                WHEN src.Cost_Center = dst.Cost_Center THEN
                    1
                ELSE
                    0
            END AS BIT) AS X FROM Staging.Wellview_Fact_Well_Header      AS src      FULL JOIN Wellview.Fact_Well_Header AS dst ON dst.Cost_Center = ISNULL(src.Cost_Center, dst.Cost_Center)  WHERE      (          src.UID_Left IS NOT NULL          AND dst.Wellview_Fact_Well_Header_UID IS NOT NULL      )      AND src.Processing_State = 1', 'BIT', 0.75, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2417, 1, 8, 1, N'Match Well Name and Cost Center', N'Fact Enertia', N'SELECT src.UID_Left AS UID_Left,
       dst.Enertia_Fact_Well_Header_UID AS UID_Right,
       CAST(CASE
                WHEN src.Enertia_ID IS NULL
                     OR dst.Enertia_ID IS NULL THEN
                    0
                WHEN src.Enertia_ID = dst.Enertia_ID THEN
                    1
                ELSE
                    0
            END AS BIT) AS X FROM Staging.Enertia_Fact_Well_Header      AS src      FULL JOIN Enertia.Fact_Well_Header AS dst ON dst.Enertia_ID = ISNULL(src.Enertia_ID, dst.Enertia_ID)  WHERE      (          src.UID_Left IS NOT NULL          AND dst.Enertia_Fact_Well_Header_UID IS NOT NULL      )      AND src.Processing_State = 1', 'BIT', 0.75, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2418, 1, 76, 1, N'Match Well Name and Cost Center', N'Master Enertia', N'SELECT src.Enertia_Dim_Well_Header_UID AS UID_Left,
       hub.Hub_Well_Header_UID AS UID_Right,
       CAST(CASE
                WHEN NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.Cost_Center), N'''') IS NULL THEN
                    0
                WHEN NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.Cost_Center), N'''') = 
				     NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.Cost_Center), N'''') THEN
                    1
                ELSE
                    0
            END AS BIT) AS X
FROM Enertia.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.Enertia_Dim_Well_Header AS pag
        ON src.Enertia_Dim_Well_Header_UID = pag.Enertia_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Master_Well_Header             AS dst
        ON NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.Cost_Center), N'''') = NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.Cost_Center), N'''')
    INNER JOIN Master.Hub_Well_Header                   AS hub
        ON dst.Hub_Well_Header_ID = hub.Hub_Well_Header_ID
WHERE pag.Processing_State = 1
      AND
      (
          src.Enertia_Dim_Well_Header_UID IS NOT NULL
          AND hub.Hub_Well_Header_UID IS NOT NULL
      );', 'BIT', 0.75, 0, 1, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2419, 1, 78, 1, N'Match Well Name and Cost Center', N'Master Merrick', N'SELECT      src.Merrick_Dim_Well_Header_UID      AS UID_Left     ,hub.Hub_Well_Header_UID AS UID_Right     ,CAST(CASE               WHEN NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.Cost_Center), N'''') IS NULL THEN                   0               WHEN NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.Cost_Center), N'''') = NULLIF(CONCAT(src.Well_Name_Antero_Standard,src.Cost_Center),N'''') THEN                  1               ELSE                   0           END AS BIT)                   AS X  FROM Merrick.Dim_Well_Header                          AS src      INNER JOIN Master_Staging.Merrick_Dim_Well_Header AS pag ON src.Merrick_Dim_Well_Header_UID = pag.Merrick_Dim_Well_Header_UID      FULL JOIN Master_Etl.Master_Well_Header          AS dst ON NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.Cost_Center), N'''') = NULLIF(CONCAT(src.Well_Name_Antero_Standard,src.Cost_Center),N'''')      INNER JOIN Master.Hub_Well_Header               AS hub ON dst.Hub_Well_Header_ID = hub.Hub_Well_Header_ID        WHERE      pag.Processing_State = 1      AND      (          src.Merrick_Dim_Well_Header_UID IS NOT NULL          AND hub.Hub_Well_Header_UID IS NOT NULL      )  --ORDER BY  --    src.Merrick_Dim_Well_Header_UID  --   ,map.Master_Etl_Well_Header_Map_UID', 'BIT', 0.75, 0, 1, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2420, 1, 79, 1, N'Match Well Name and Cost Center', N'Master Wellview', N'SELECT      src.WellView_Dim_Well_Header_UID      AS UID_Left     ,hub.Hub_Well_Header_UID AS UID_Right     ,CAST(CASE               WHEN NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.Cost_Center), N'''') IS NULL THEN                   0               WHEN NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.Cost_Center), N'''') = NULLIF(CONCAT(src.Well_Name_Antero_Standard,src.Cost_Center),N'''') THEN                   1               ELSE                   0           END AS BIT)                   AS X  FROM WellView.Dim_Well_Header                          AS src      INNER JOIN Master_Staging.WellView_Dim_Well_Header AS pag ON src.WellView_Dim_Well_Header_UID = pag.WellView_Dim_Well_Header_UID      FULL JOIN Master_Etl.Master_Well_Header          AS dst ON NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.Cost_Center), N'''') = NULLIF(CONCAT(src.Well_Name_Antero_Standard,src.Cost_Center),N'''')      INNER JOIN Master.Hub_Well_Header               AS hub ON dst.Hub_Well_Header_ID = hub.Hub_Well_Header_ID        WHERE      pag.Processing_State = 1      AND      (          src.WellView_Dim_Well_Header_UID IS NOT NULL          AND hub.Hub_Well_Header_UID IS NOT NULL      )', 'BIT', 0.75, 0, 1, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2421, 1, 76, 1, N'Match Well Name and API', N'Master Enertia', N'SELECT src.Enertia_Dim_Well_Header_UID AS UID_Left,
       hub.Hub_Well_Header_UID AS UID_Right,
       CAST(CASE
                WHEN NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.API_Number), N'''') IS NULL THEN
                    0
                WHEN NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.API_Number), N'''') = 
				     NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.API_Number), N'''') THEN
                    1
                ELSE
                    0
            END AS BIT) AS X
FROM Enertia.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.Enertia_Dim_Well_Header AS pag
        ON src.Enertia_Dim_Well_Header_UID = pag.Enertia_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Master_Well_Header             AS dst
        ON NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.API_Number), N'''') = NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.API_Number), N'''')
    INNER JOIN Master.Hub_Well_Header                   AS hub
        ON dst.Hub_Well_Header_ID = hub.Hub_Well_Header_ID
WHERE pag.Processing_State = 1
      AND
      (
          src.Enertia_Dim_Well_Header_UID IS NOT NULL
          AND hub.Hub_Well_Header_UID IS NOT NULL
      );', 'BIT', 0.8, 0, 1, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2422, 1, 78, 1, N'Match Well Name and API', N'Master Merrick', N'SELECT      src.Merrick_Dim_Well_Header_UID      AS UID_Left     ,hub.Hub_Well_Header_UID AS UID_Right     ,CAST(CASE               WHEN NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.API_Number), N'''') IS NULL THEN                  0               WHEN NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.API_Number), N'''') = NULLIF(CONCAT(src.Well_Name_Antero_Standard,src.API_Number), N'''') THEN                   1               ELSE                   0           END AS BIT)                   AS X  FROM Merrick.Dim_Well_Header                          AS src      INNER JOIN Master_Staging.Merrick_Dim_Well_Header AS pag ON src.Merrick_Dim_Well_Header_UID = pag.Merrick_Dim_Well_Header_UID      FULL JOIN Master_Etl.Master_Well_Header          AS dst ON NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.API_Number), N'''') = NULLIF(CONCAT(src.Well_Name_Antero_Standard,src.API_Number),N'''')      INNER JOIN Master.Hub_Well_Header               AS hub ON dst.Hub_Well_Header_ID = hub.Hub_Well_Header_ID        WHERE      pag.Processing_State = 1      AND      (          src.Merrick_Dim_Well_Header_UID IS NOT NULL          AND hub.Hub_Well_Header_UID IS NOT NULL      )  --ORDER BY  --    src.Merrick_Dim_Well_Header_UID  --   ,map.Master_Etl_Well_Header_Map_UID', 'BIT', 0.8, 0, 1, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2423, 1, 79, 1, N'Match Well Name and API', N'Master Wellview', N'SELECT      src.WellView_Dim_Well_Header_UID      AS UID_Left     ,hub.Hub_Well_Header_UID AS UID_Right     ,CAST(CASE               WHEN NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.API_Number), N'''') IS NULL THEN                   0               WHEN NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.API_Number), N'''') = NULLIF(CONCAT(src.Well_Name_Antero_Standard,src.API_Number), N'''') THEN                  1               ELSE                   0           END AS BIT)                   AS X  FROM WellView.Dim_Well_Header                          AS src      INNER JOIN Master_Staging.WellView_Dim_Well_Header AS pag ON src.WellView_Dim_Well_Header_UID = pag.WellView_Dim_Well_Header_UID      FULL JOIN Master_Etl.Master_Well_Header          AS dst ON NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.API_Number), N'''') = NULLIF(CONCAT(src.Well_Name_Antero_Standard,src.API_Number),N'''')      INNER JOIN Master.Hub_Well_Header               AS hub ON dst.Hub_Well_Header_ID = hub.Hub_Well_Header_ID        WHERE      pag.Processing_State = 1      AND      (          src.WellView_Dim_Well_Header_UID IS NOT NULL          AND hub.Hub_Well_Header_UID IS NOT NULL      )', 'BIT', 0.8, 0, 1, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2424, 1, 76, 1, N'Match Well Name and API', N'Master Aries', N'SELECT src.Aries_Dim_Well_Header_UID AS UID_Left,
       hub.Hub_Well_Header_UID AS UID_Right,
       CAST(CASE
                WHEN NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.API_Number), N'''') IS NULL THEN
                    0
                WHEN NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.API_Number), N'''') = 
				     NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.API_Number), N'''') THEN
                    1
                ELSE
                    0
            END AS BIT) AS X
FROM Aries.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.Aries_Dim_Well_Header AS pag
        ON src.Aries_Dim_Well_Header_UID = pag.Aries_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Master_Well_Header             AS dst
        ON NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.API_Number), N'''') = NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.API_Number), N'''')
    INNER JOIN Master.Hub_Well_Header                   AS hub
        ON dst.Hub_Well_Header_ID = hub.Hub_Well_Header_ID
WHERE pag.Processing_State = 1
      AND
      (
          src.Aries_Dim_Well_Header_UID IS NOT NULL
          AND hub.Hub_Well_Header_UID IS NOT NULL
      );', 'BIT', 0.8, 0, 1, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2425, 1, 76, 1, N'Match Well Name and API', N'Master Aries Planning', N'SELECT src.Aries_Planning_Dim_Well_Header_UID AS UID_Left,
       hub.Hub_Well_Header_UID AS UID_Right,
       CAST(CASE
                WHEN NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.API_Number), N'''') IS NULL THEN
                    0
                WHEN NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.API_Number), N'''') = 
				     NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.API_Number), N'''') THEN
                    1
                ELSE
                    0
            END AS BIT) AS X
FROM Aries_Planning.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.Aries_Planning_Dim_Well_Header AS pag
        ON src.Aries_Planning_Dim_Well_Header_UID = pag.Aries_Planning_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Master_Well_Header             AS dst
        ON NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.API_Number), N'''') = NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.API_Number), N'''')
    INNER JOIN Master.Hub_Well_Header                   AS hub
        ON dst.Hub_Well_Header_ID = hub.Hub_Well_Header_ID
WHERE pag.Processing_State = 1
      AND
      (
          src.Aries_Planning_Dim_Well_Header_UID IS NOT NULL
          AND hub.Hub_Well_Header_UID IS NOT NULL
      );', 'BIT', 0.8, 0, 1, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2426, 1, 76, 1, N'Match Well Name and API', N'Master Petra', N'SELECT src.Petra_Dim_Well_Header_UID AS UID_Left,
       hub.Hub_Well_Header_UID AS UID_Right,
       CAST(CASE
                WHEN NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.API_Number), N'''') IS NULL THEN
                    0
                WHEN NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.API_Number), N'''') = 
				     NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.API_Number), N'''') THEN
                    1
                ELSE
                    0
            END AS BIT) AS X
FROM Petra.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.Petra_Dim_Well_Header AS pag
        ON src.Petra_Dim_Well_Header_UID = pag.Petra_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Master_Well_Header             AS dst
        ON NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.API_Number), N'''') = NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.API_Number), N'''')
    INNER JOIN Master.Hub_Well_Header                   AS hub
        ON dst.Hub_Well_Header_ID = hub.Hub_Well_Header_ID
WHERE pag.Processing_State = 1
      AND
      (
          src.Petra_Dim_Well_Header_UID IS NOT NULL
          AND hub.Hub_Well_Header_UID IS NOT NULL
      );', 'BIT', 0.8, 0, 1, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2427, 1, 76, 1, N'Match Well Name and API', N'Master SigmaFlow', N'SELECT src.SigmaFlow_Dim_Well_Header_UID AS UID_Left,
       hub.Hub_Well_Header_UID AS UID_Right,
       CAST(CASE
                WHEN NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.API_Number), N'''') IS NULL THEN
                    0
                WHEN NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.API_Number), N'''') = 
				     NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.API_Number), N'''') THEN
                    1
                ELSE
                    0
            END AS BIT) AS X
FROM SigmaFlow.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.SigmaFlow_Dim_Well_Header AS pag
        ON src.SigmaFlow_Dim_Well_Header_UID = pag.SigmaFlow_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Master_Well_Header             AS dst
        ON NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.API_Number), N'''') = NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.API_Number), N'''')
    INNER JOIN Master.Hub_Well_Header                   AS hub
        ON dst.Hub_Well_Header_ID = hub.Hub_Well_Header_ID
WHERE pag.Processing_State = 1
      AND
      (
          src.SigmaFlow_Dim_Well_Header_UID IS NOT NULL
          AND hub.Hub_Well_Header_UID IS NOT NULL
      );', 'BIT', 0.8, 0, 1, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2428, 1, 76, 1, N'Match Well Name and API', N'Master GIS', N'SELECT src.GIS_Dim_Well_Header_UID AS UID_Left,
       hub.Hub_Well_Header_UID AS UID_Right,
       CAST(CASE
                WHEN NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.API_Number), N'''') IS NULL THEN
                    0
                WHEN NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.API_Number), N'''') = 
				     NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.API_Number), N'''') THEN
                    1
                ELSE
                    0
            END AS BIT) AS X
FROM GIS.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.GIS_Dim_Well_Header AS pag
        ON src.GIS_Dim_Well_Header_UID = pag.GIS_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Master_Well_Header             AS dst
        ON NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.API_Number), N'''') = NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.API_Number), N'''')
    INNER JOIN Master.Hub_Well_Header                   AS hub
        ON dst.Hub_Well_Header_ID = hub.Hub_Well_Header_ID
WHERE pag.Processing_State = 1
      AND
      (
          src.GIS_Dim_Well_Header_UID IS NOT NULL
          AND hub.Hub_Well_Header_UID IS NOT NULL
      );', 'BIT', 0.95, 0, 1, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2429, 1, 2, 1, N'Match Well Name SEQNUM API Cost', N'Master Aries', N'SELECT src.Aries_Dim_Well_Header_UID AS UID_Left,
       hub.Hub_Well_Header_UID AS UID_Right,
	   	   
       CAST(CASE WHEN CONCAT(src.Well_Name_Antero_Standard, src.SEQNUM)      IS NOT NULL AND CONCAT(dst.Well_Name_Antero_Standard, dst.SEQNUM)      IS NOT NULL AND
				      NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.SEQNUM), N'''')      =  NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.SEQNUM), N'''')      THEN 1    
                 WHEN CONCAT(src.Well_Name_Antero_Standard, src.API_NUMBER)  IS NOT NULL AND CONCAT(dst.Well_Name_Antero_Standard, dst.API_NUMBER)  IS NOT NULL AND
				      NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.API_NUMBER), N'''')  =  NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.API_NUMBER), N'''')  THEN 1    
	   ELSE 0 END AS BIT) AS X

FROM Aries.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.Aries_Dim_Well_Header AS pag
        ON src.Aries_Dim_Well_Header_UID = pag.Aries_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Master_Well_Header             AS dst
        ON 

CASE WHEN CONCAT(src.Well_Name_Antero_Standard, src.SEQNUM)      IS NOT NULL AND CONCAT(dst.Well_Name_Antero_Standard, dst.SEQNUM)      IS NOT NULL THEN NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.SEQNUM), N'''')  
     WHEN CONCAT(src.Well_Name_Antero_Standard, src.API_NUMBER)  IS NOT NULL AND CONCAT(dst.Well_Name_Antero_Standard, dst.API_NUMBER)  IS NOT NULL THEN NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.API_NUMBER), N'''')  
	 END
	 =
CASE WHEN CONCAT(src.Well_Name_Antero_Standard, src.SEQNUM)      IS NOT NULL AND CONCAT(dst.Well_Name_Antero_Standard, dst.SEQNUM)      IS NOT NULL THEN NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.SEQNUM), N'''')  
     WHEN CONCAT(src.Well_Name_Antero_Standard, src.API_NUMBER)  IS NOT NULL AND CONCAT(dst.Well_Name_Antero_Standard, dst.API_NUMBER)  IS NOT NULL THEN NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.API_NUMBER), N'''')  
	 END

INNER JOIN Master.Hub_Well_Header                   AS hub
        ON dst.Hub_Well_Header_ID = hub.Hub_Well_Header_ID
WHERE pag.Processing_State = 1
      AND
      (
          src.Aries_Dim_Well_Header_UID IS NOT NULL
          AND hub.Hub_Well_Header_UID IS NOT NULL
      );', 'BIT', 0.85, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2430, 1, 79, 1, N'Match Well Name SEQNUM API Cost', N'Master Wellview', N'SELECT src.Wellview_Dim_Well_Header_UID AS UID_Left,
       hub.Hub_Well_Header_UID AS UID_Right,
	   	   
       CAST(CASE 
                 WHEN CONCAT(src.Well_Name_Antero_Standard, src.API_NUMBER)  IS NOT NULL AND CONCAT(dst.Well_Name_Antero_Standard, dst.API_NUMBER)  IS NOT NULL AND
				      NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.API_NUMBER), N'''')  =  NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.API_NUMBER), N'''')  THEN 1    
              WHEN CONCAT(src.Well_Name_Antero_Standard, src.Cost_Center) IS NOT NULL AND CONCAT(dst.Well_Name_Antero_Standard, dst.Cost_Center) IS NOT NULL AND
                   NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.Cost_Center), N'''') =  NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.Cost_Center), N'''') THEN 1 
	   ELSE 0 END AS BIT) AS X

FROM Wellview.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.Wellview_Dim_Well_Header AS pag
        ON src.Wellview_Dim_Well_Header_UID = pag.Wellview_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Master_Well_Header             AS dst
        ON 

CASE 
     WHEN CONCAT(src.Well_Name_Antero_Standard, src.API_NUMBER)  IS NOT NULL AND CONCAT(dst.Well_Name_Antero_Standard, dst.API_NUMBER)  IS NOT NULL THEN NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.API_NUMBER), N'''')  
     WHEN CONCAT(src.Well_Name_Antero_Standard, src.Cost_Center) IS NOT NULL AND CONCAT(dst.Well_Name_Antero_Standard, dst.Cost_Center) IS NOT NULL THEN NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.Cost_Center), N'''')
	 END
	 =
CASE 
     WHEN CONCAT(src.Well_Name_Antero_Standard, src.API_NUMBER)  IS NOT NULL AND CONCAT(dst.Well_Name_Antero_Standard, dst.API_NUMBER)  IS NOT NULL THEN NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.API_NUMBER), N'''')  
     WHEN CONCAT(src.Well_Name_Antero_Standard, src.Cost_Center) IS NOT NULL AND CONCAT(dst.Well_Name_Antero_Standard, dst.Cost_Center) IS NOT NULL THEN NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.Cost_Center), N'''')
	 END

INNER JOIN Master.Hub_Well_Header                   AS hub
        ON dst.Hub_Well_Header_ID = hub.Hub_Well_Header_ID
WHERE pag.Processing_State = 1
      AND
      (
          src.Wellview_Dim_Well_Header_UID IS NOT NULL
          AND hub.Hub_Well_Header_UID IS NOT NULL
      );', 'BIT', 0.85, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2431, 1, 78, 1, N'Match Well Name SEQNUM API Cost', N'Master Merrick', N'SELECT src.Merrick_Dim_Well_Header_UID AS UID_Left,
       hub.Hub_Well_Header_UID AS UID_Right,
	   	   
       CAST(CASE 
                 WHEN CONCAT(src.Well_Name_Antero_Standard, src.API_NUMBER)  IS NOT NULL AND CONCAT(dst.Well_Name_Antero_Standard, dst.API_NUMBER)  IS NOT NULL AND
				      NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.API_NUMBER), N'''')  =  NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.API_NUMBER), N'''')  THEN 1    
                 WHEN CONCAT(src.Well_Name_Antero_Standard, src.Cost_Center) IS NOT NULL AND CONCAT(dst.Well_Name_Antero_Standard, dst.Cost_Center) IS NOT NULL AND
                      NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.Cost_Center), N'''') =  NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.Cost_Center), N'''') THEN 1 
	   ELSE 0 END AS BIT) AS X

FROM Merrick.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.Merrick_Dim_Well_Header AS pag
        ON src.Merrick_Dim_Well_Header_UID = pag.Merrick_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Master_Well_Header             AS dst
        ON 

CASE 
     WHEN CONCAT(src.Well_Name_Antero_Standard, src.API_NUMBER)  IS NOT NULL AND CONCAT(dst.Well_Name_Antero_Standard, dst.API_NUMBER)  IS NOT NULL THEN NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.API_NUMBER), N'''')  
     WHEN CONCAT(src.Well_Name_Antero_Standard, src.Cost_Center) IS NOT NULL AND CONCAT(dst.Well_Name_Antero_Standard, dst.Cost_Center) IS NOT NULL THEN NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.Cost_Center), N'''')
	 END
	 =
CASE 
     WHEN CONCAT(src.Well_Name_Antero_Standard, src.API_NUMBER)  IS NOT NULL AND CONCAT(dst.Well_Name_Antero_Standard, dst.API_NUMBER)  IS NOT NULL THEN NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.API_NUMBER), N'''')  
     WHEN CONCAT(src.Well_Name_Antero_Standard, src.Cost_Center) IS NOT NULL AND CONCAT(dst.Well_Name_Antero_Standard, dst.Cost_Center) IS NOT NULL THEN NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.Cost_Center), N'''')
	 END

INNER JOIN Master.Hub_Well_Header                   AS hub
        ON dst.Hub_Well_Header_ID = hub.Hub_Well_Header_ID
WHERE pag.Processing_State = 1
      AND
      (
          src.Merrick_Dim_Well_Header_UID IS NOT NULL
          AND hub.Hub_Well_Header_UID IS NOT NULL
      );', 'BIT', 0.85, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2432, 1, 86, 1, N'Match Well Name SEQNUM API Cost', N'Master Petra', N'SELECT src.Petra_Dim_Well_Header_UID AS UID_Left,
       hub.Hub_Well_Header_UID AS UID_Right,
	   	   
       CAST(CASE WHEN CONCAT(src.Well_Name_Antero_Standard, src.SEQNUM)      IS NOT NULL AND CONCAT(dst.Well_Name_Antero_Standard, dst.SEQNUM)      IS NOT NULL AND
				      NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.SEQNUM), N'''')      =  NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.SEQNUM), N'''')      THEN 1    
                 WHEN CONCAT(src.Well_Name_Antero_Standard, src.API_NUMBER)  IS NOT NULL AND CONCAT(dst.Well_Name_Antero_Standard, dst.API_NUMBER)  IS NOT NULL AND
				      NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.API_NUMBER), N'''')  =  NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.API_NUMBER), N'''')  THEN 1    
	   ELSE 0 END AS BIT) AS X

FROM Petra.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.Petra_Dim_Well_Header AS pag
        ON src.Petra_Dim_Well_Header_UID = pag.Petra_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Master_Well_Header             AS dst
        ON 

CASE WHEN CONCAT(src.Well_Name_Antero_Standard, src.SEQNUM)      IS NOT NULL AND CONCAT(dst.Well_Name_Antero_Standard, dst.SEQNUM)      IS NOT NULL THEN NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.SEQNUM), N'''')  
     WHEN CONCAT(src.Well_Name_Antero_Standard, src.API_NUMBER)  IS NOT NULL AND CONCAT(dst.Well_Name_Antero_Standard, dst.API_NUMBER)  IS NOT NULL THEN NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.API_NUMBER), N'''')  
	 END
	 =
CASE WHEN CONCAT(src.Well_Name_Antero_Standard, src.SEQNUM)      IS NOT NULL AND CONCAT(dst.Well_Name_Antero_Standard, dst.SEQNUM)      IS NOT NULL THEN NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.SEQNUM), N'''')  
     WHEN CONCAT(src.Well_Name_Antero_Standard, src.API_NUMBER)  IS NOT NULL AND CONCAT(dst.Well_Name_Antero_Standard, dst.API_NUMBER)  IS NOT NULL THEN NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.API_NUMBER), N'''')  
	 END

INNER JOIN Master.Hub_Well_Header                   AS hub
        ON dst.Hub_Well_Header_ID = hub.Hub_Well_Header_ID
WHERE pag.Processing_State = 1
      AND
      (
          src.Petra_Dim_Well_Header_UID IS NOT NULL
          AND hub.Hub_Well_Header_UID IS NOT NULL
      );', 'BIT', 0.85, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2433, 1, 76, 1, N'Match Well Name SEQNUM API Cost', N'Master Enertia', N'SELECT src.Enertia_Dim_Well_Header_UID AS UID_Left,
       hub.Hub_Well_Header_UID AS UID_Right,
	   	   
       CAST(CASE WHEN CONCAT(src.Well_Name_Antero_Standard, src.SEQNUM)      IS NOT NULL AND CONCAT(dst.Well_Name_Antero_Standard, dst.SEQNUM)      IS NOT NULL AND
				      NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.SEQNUM), N'''')      =  NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.SEQNUM), N'''')      THEN 1    
                 WHEN CONCAT(src.Well_Name_Antero_Standard, src.API_NUMBER)  IS NOT NULL AND CONCAT(dst.Well_Name_Antero_Standard, dst.API_NUMBER)  IS NOT NULL AND
				      NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.API_NUMBER), N'''')  =  NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.API_NUMBER), N'''')  THEN 1    
                 WHEN CONCAT(src.Well_Name_Antero_Standard, src.Cost_Center) IS NOT NULL AND CONCAT(dst.Well_Name_Antero_Standard, dst.Cost_Center) IS NOT NULL AND
                      NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.Cost_Center), N'''') =  NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.Cost_Center), N'''') THEN 1 
	   ELSE 0 END AS BIT) AS X

FROM Enertia.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.Enertia_Dim_Well_Header AS pag
        ON src.Enertia_Dim_Well_Header_UID = pag.Enertia_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Master_Well_Header             AS dst
        ON 

CASE WHEN CONCAT(src.Well_Name_Antero_Standard, src.SEQNUM)      IS NOT NULL AND CONCAT(dst.Well_Name_Antero_Standard, dst.SEQNUM)      IS NOT NULL THEN NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.SEQNUM), N'''')  
     WHEN CONCAT(src.Well_Name_Antero_Standard, src.API_NUMBER)  IS NOT NULL AND CONCAT(dst.Well_Name_Antero_Standard, dst.API_NUMBER)  IS NOT NULL THEN NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.API_NUMBER), N'''')  
     WHEN CONCAT(src.Well_Name_Antero_Standard, src.Cost_Center) IS NOT NULL AND CONCAT(dst.Well_Name_Antero_Standard, dst.Cost_Center) IS NOT NULL THEN NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.Cost_Center), N'''')
	 END
	 =
CASE WHEN CONCAT(src.Well_Name_Antero_Standard, src.SEQNUM)      IS NOT NULL AND CONCAT(dst.Well_Name_Antero_Standard, dst.SEQNUM)      IS NOT NULL THEN NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.SEQNUM), N'''')  
     WHEN CONCAT(src.Well_Name_Antero_Standard, src.API_NUMBER)  IS NOT NULL AND CONCAT(dst.Well_Name_Antero_Standard, dst.API_NUMBER)  IS NOT NULL THEN NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.API_NUMBER), N'''')  
     WHEN CONCAT(src.Well_Name_Antero_Standard, src.Cost_Center) IS NOT NULL AND CONCAT(dst.Well_Name_Antero_Standard, dst.Cost_Center) IS NOT NULL THEN NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.Cost_Center), N'''')
	 END

INNER JOIN Master.Hub_Well_Header                   AS hub
        ON dst.Hub_Well_Header_ID = hub.Hub_Well_Header_ID
WHERE pag.Processing_State = 1
      AND
      (
          src.Enertia_Dim_Well_Header_UID IS NOT NULL
          AND hub.Hub_Well_Header_UID IS NOT NULL
      );', 'BIT', 0.85, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2434, 1, 80, 1, N'Match Well Name SEQNUM API Cost', N'Master Sigmaflow', N'SELECT src.SigmaFlow_Dim_Well_Header_UID AS UID_Left,
       hub.Hub_Well_Header_UID AS UID_Right,
	   	   
       CAST(CASE WHEN CONCAT(src.Well_Name_Antero_Standard, src.SEQNUM)      IS NOT NULL AND CONCAT(dst.Well_Name_Antero_Standard, dst.SEQNUM)      IS NOT NULL AND
				      NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.SEQNUM), N'''')      =  NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.SEQNUM), N'''')      THEN 1    
                 WHEN CONCAT(src.Well_Name_Antero_Standard, src.API_NUMBER)  IS NOT NULL AND CONCAT(dst.Well_Name_Antero_Standard, dst.API_NUMBER)  IS NOT NULL AND
				      NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.API_NUMBER), N'''')  =  NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.API_NUMBER), N'''')  THEN 1    
	   ELSE 0 END AS BIT) AS X

FROM SigmaFlow.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.SigmaFlow_Dim_Well_Header AS pag
        ON src.SigmaFlow_Dim_Well_Header_UID = pag.SigmaFlow_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Master_Well_Header             AS dst
        ON 

CASE WHEN CONCAT(src.Well_Name_Antero_Standard, src.SEQNUM)      IS NOT NULL AND CONCAT(dst.Well_Name_Antero_Standard, dst.SEQNUM)      IS NOT NULL THEN NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.SEQNUM), N'''')  
     WHEN CONCAT(src.Well_Name_Antero_Standard, src.API_NUMBER)  IS NOT NULL AND CONCAT(dst.Well_Name_Antero_Standard, dst.API_NUMBER)  IS NOT NULL THEN NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.API_NUMBER), N'''')  
	 END
	 =
CASE WHEN CONCAT(src.Well_Name_Antero_Standard, src.SEQNUM)      IS NOT NULL AND CONCAT(dst.Well_Name_Antero_Standard, dst.SEQNUM)      IS NOT NULL THEN NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.SEQNUM), N'''')  
     WHEN CONCAT(src.Well_Name_Antero_Standard, src.API_NUMBER)  IS NOT NULL AND CONCAT(dst.Well_Name_Antero_Standard, dst.API_NUMBER)  IS NOT NULL THEN NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.API_NUMBER), N'''')  
	 END

INNER JOIN Master.Hub_Well_Header                   AS hub
        ON dst.Hub_Well_Header_ID = hub.Hub_Well_Header_ID
WHERE pag.Processing_State = 1
      AND
      (
          src.SigmaFlow_Dim_Well_Header_UID IS NOT NULL
          AND hub.Hub_Well_Header_UID IS NOT NULL
      );', 'BIT', 0.85, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2435, 1, 115, 1, N'Match Well Name SEQNUM API Cost', N'Master Gis', N'SELECT src.GIS_Dim_Well_Header_UID AS UID_Left,
       hub.Hub_Well_Header_UID AS UID_Right,
	   	   
       CAST(CASE WHEN CONCAT(src.Well_Name_Antero_Standard, src.SEQNUM)      IS NOT NULL AND CONCAT(dst.Well_Name_Antero_Standard, dst.SEQNUM)      IS NOT NULL AND
				      NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.SEQNUM), N'''')      =  NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.SEQNUM), N'''')      THEN 1    
                 WHEN CONCAT(src.Well_Name_Antero_Standard, src.API_NUMBER)  IS NOT NULL AND CONCAT(dst.Well_Name_Antero_Standard, dst.API_NUMBER)  IS NOT NULL AND
				      NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.API_NUMBER), N'''')  =  NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.API_NUMBER), N'''')  THEN 1    
	   ELSE 0 END AS BIT) AS X

FROM GIS.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.GIS_Dim_Well_Header AS pag
        ON src.GIS_Dim_Well_Header_UID = pag.GIS_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Master_Well_Header             AS dst
        ON 

CASE WHEN CONCAT(src.Well_Name_Antero_Standard, src.SEQNUM)      IS NOT NULL AND CONCAT(dst.Well_Name_Antero_Standard, dst.SEQNUM)      IS NOT NULL THEN NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.SEQNUM), N'''')  
     WHEN CONCAT(src.Well_Name_Antero_Standard, src.API_NUMBER)  IS NOT NULL AND CONCAT(dst.Well_Name_Antero_Standard, dst.API_NUMBER)  IS NOT NULL THEN NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.API_NUMBER), N'''')  
	 END
	 =
CASE WHEN CONCAT(src.Well_Name_Antero_Standard, src.SEQNUM)      IS NOT NULL AND CONCAT(dst.Well_Name_Antero_Standard, dst.SEQNUM)      IS NOT NULL THEN NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.SEQNUM), N'''')  
     WHEN CONCAT(src.Well_Name_Antero_Standard, src.API_NUMBER)  IS NOT NULL AND CONCAT(dst.Well_Name_Antero_Standard, dst.API_NUMBER)  IS NOT NULL THEN NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.API_NUMBER), N'''')  
	 END

INNER JOIN Master.Hub_Well_Header                   AS hub
        ON dst.Hub_Well_Header_ID = hub.Hub_Well_Header_ID
WHERE pag.Processing_State = 1
      AND
      (
          src.GIS_Dim_Well_Header_UID IS NOT NULL
          AND hub.Hub_Well_Header_UID IS NOT NULL
      );', 'BIT', 1, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2436, 1, 77, 1, N'Match Well Name SEQNUM API Cost', N'Master Fracschedule', N'SELECT src.FracSchedule_Dim_Well_Header_UID AS UID_Left,
       hub.Hub_Well_Header_UID AS UID_Right,
	   	   
       CAST(CASE WHEN CONCAT(src.Well_Name_Antero_Standard, src.SEQNUM)      IS NOT NULL AND CONCAT(dst.Well_Name_Antero_Standard, dst.SEQNUM)      IS NOT NULL AND
				      NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.SEQNUM), N'''')      =  NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.SEQNUM), N'''')      THEN 1    
	   ELSE 0 END AS BIT) AS X

FROM FracSchedule.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.FracSchedule_Dim_Well_Header AS pag
        ON src.FracSchedule_Dim_Well_Header_UID = pag.FracSchedule_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Master_Well_Header             AS dst
        ON 

CASE WHEN CONCAT(src.Well_Name_Antero_Standard, src.SEQNUM)      IS NOT NULL AND CONCAT(dst.Well_Name_Antero_Standard, dst.SEQNUM)      IS NOT NULL THEN NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.SEQNUM), N'''')  
	 END
	 =
CASE WHEN CONCAT(src.Well_Name_Antero_Standard, src.SEQNUM)      IS NOT NULL AND CONCAT(dst.Well_Name_Antero_Standard, dst.SEQNUM)      IS NOT NULL THEN NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.SEQNUM), N'''')  
	 END

INNER JOIN Master.Hub_Well_Header                   AS hub
        ON dst.Hub_Well_Header_ID = hub.Hub_Well_Header_ID
WHERE pag.Processing_State = 1
      AND
      (
          src.FracSchedule_Dim_Well_Header_UID IS NOT NULL
          AND hub.Hub_Well_Header_UID IS NOT NULL
      );', 'BIT', 0.85, 0, 0, 0, 0, 0, NULL, NULL)
INSERT INTO [Rules].[Rule] ([Rule_ID], [Rule_Type_ID], [Rule_Entity_ID], [Rule_Attribute_Group_ID], [Name], [Description], [Criteria], [ResultType], [Matched_Weight], [Unmatched_Weight], [IsEnabled], [IsDelayed], [DelayThreshold], [IsExclusive], [Rule_Alias_ID_Map], [Rule_Alias_ID_Unmap]) VALUES (2437, 1, 126, 1, N'Match Well Name SEQNUM API Cost', N'Master Aries Planning', N'SELECT src.Aries_Planning_Dim_Well_Header_UID AS UID_Left,
       hub.Hub_Well_Header_UID AS UID_Right,
	   	   
       CAST(CASE WHEN CONCAT(src.Well_Name_Antero_Standard, src.SEQNUM)      IS NOT NULL AND CONCAT(dst.Well_Name_Antero_Standard, dst.SEQNUM)      IS NOT NULL AND
				      NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.SEQNUM), N'''')      =  NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.SEQNUM), N'''')      THEN 1    
                 WHEN CONCAT(src.Well_Name_Antero_Standard, src.API_NUMBER)  IS NOT NULL AND CONCAT(dst.Well_Name_Antero_Standard, dst.API_NUMBER)  IS NOT NULL AND
				      NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.API_NUMBER), N'''')  =  NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.API_NUMBER), N'''')  THEN 1    
	   ELSE 0 END AS BIT) AS X

FROM Aries_Planning.Dim_Well_Header                          AS src
    INNER JOIN Master_Staging.Aries_Planning_Dim_Well_Header AS pag
        ON src.Aries_Planning_Dim_Well_Header_UID = pag.Aries_Planning_Dim_Well_Header_UID
    FULL JOIN Master_Etl.Master_Well_Header             AS dst
        ON 

CASE WHEN CONCAT(src.Well_Name_Antero_Standard, src.SEQNUM)      IS NOT NULL AND CONCAT(dst.Well_Name_Antero_Standard, dst.SEQNUM)      IS NOT NULL THEN NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.SEQNUM), N'''')  
     WHEN CONCAT(src.Well_Name_Antero_Standard, src.API_NUMBER)  IS NOT NULL AND CONCAT(dst.Well_Name_Antero_Standard, dst.API_NUMBER)  IS NOT NULL THEN NULLIF(CONCAT(src.Well_Name_Antero_Standard, src.API_NUMBER), N'''')  
	 END
	 =
CASE WHEN CONCAT(src.Well_Name_Antero_Standard, src.SEQNUM)      IS NOT NULL AND CONCAT(dst.Well_Name_Antero_Standard, dst.SEQNUM)      IS NOT NULL THEN NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.SEQNUM), N'''')  
     WHEN CONCAT(src.Well_Name_Antero_Standard, src.API_NUMBER)  IS NOT NULL AND CONCAT(dst.Well_Name_Antero_Standard, dst.API_NUMBER)  IS NOT NULL THEN NULLIF(CONCAT(dst.Well_Name_Antero_Standard, dst.API_NUMBER), N'''')  
	 END

INNER JOIN Master.Hub_Well_Header                   AS hub
        ON dst.Hub_Well_Header_ID = hub.Hub_Well_Header_ID
WHERE pag.Processing_State = 1
      AND
      (
          src.Aries_Planning_Dim_Well_Header_UID IS NOT NULL
          AND hub.Hub_Well_Header_UID IS NOT NULL
      );', 'BIT', 0.85, 0, 0, 0, 0, 0, NULL, NULL)
SET IDENTITY_INSERT [Rules].[Rule] OFF
PRINT(N'Operation applied to 327 rows out of 327')

PRINT(N'Add constraints to [Rules].[Rule]')
ALTER TABLE [Rules].[Rule] CHECK CONSTRAINT [FK_Rules_Rule_Rule_Alias_ID_Map_Rules_Rule_Alias]
ALTER TABLE [Rules].[Rule] CHECK CONSTRAINT [FK_Rules_Rule_Rule_Alias_ID_Unmap_Rules_Rule_Alias]
ALTER TABLE [Rules].[Rule] CHECK CONSTRAINT [FK_Rules_Rule_Rule_Entity_ID_Rules_Rule_Attribute_Group]
ALTER TABLE [Rules].[Rule] CHECK CONSTRAINT [FK_Rules_Rule_Rule_Entity_ID_Rules_Rule_Entity]
ALTER TABLE [Rules].[Rule] CHECK CONSTRAINT [FK_Rules_Rule_Rule_Type_ID_Rules_Rule_Type]
COMMIT TRANSACTION
GO
