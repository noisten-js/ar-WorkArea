----Not Needed
---
---USE [EDW]
---GO
---
------1
---ALTER TABLE [Rules].[Rule] DROP CONSTRAINT [FK_Rules_Rule_Rule_Type_ID_Rules_Rule_Type]
---GO
---
---ALTER TABLE [Rules].[Rule]  WITH NOCHECK ADD  CONSTRAINT [FK_Rules_Rule_Rule_Type_ID_Rules_Rule_Type] FOREIGN KEY([Rule_Type_ID])
---REFERENCES [Rules].[Rule_Type] ([Rule_Type_ID])
---GO
---
---ALTER TABLE [Rules].[Rule] CHECK CONSTRAINT [FK_Rules_Rule_Rule_Type_ID_Rules_Rule_Type]
---GO
---
---
---USE [EDW]
---GO
---
------2
---ALTER TABLE [Rules].[Rule] DROP CONSTRAINT [FK_Rules_Rule_Rule_Entity_ID_Rules_Rule_Entity]
---GO
---
---ALTER TABLE [Rules].[Rule]  WITH NOCHECK ADD  CONSTRAINT [FK_Rules_Rule_Rule_Entity_ID_Rules_Rule_Entity] FOREIGN KEY([Rule_Entity_ID])
---REFERENCES [Rules].[Rule_Entity] ([Rule_Entity_ID])
---GO
---
---ALTER TABLE [Rules].[Rule] CHECK CONSTRAINT [FK_Rules_Rule_Rule_Entity_ID_Rules_Rule_Entity]
---GO
---
---
---USE [EDW]
---GO
---
------3
---ALTER TABLE [Rules].[Rule] DROP CONSTRAINT [FK_Rules_Rule_Rule_Entity_ID_Rules_Rule_Attribute_Group]
---GO
---
---ALTER TABLE [Rules].[Rule]  WITH NOCHECK ADD  CONSTRAINT [FK_Rules_Rule_Rule_Entity_ID_Rules_Rule_Attribute_Group] FOREIGN KEY([Rule_Attribute_Group_ID])
---REFERENCES [Rules].[Rule_Attribute_Group] ([Rule_Attribute_Group_ID])
---GO
---
---ALTER TABLE [Rules].[Rule] CHECK CONSTRAINT [FK_Rules_Rule_Rule_Entity_ID_Rules_Rule_Attribute_Group]
---GO
---
---
---USE [EDW]
---GO
---
------4
---ALTER TABLE [Rules].[Rule] DROP CONSTRAINT [FK_Rules_Rule_Rule_Alias_ID_Unmap_Rules_Rule_Alias]
---GO
---
---ALTER TABLE [Rules].[Rule]  WITH NOCHECK ADD  CONSTRAINT [FK_Rules_Rule_Rule_Alias_ID_Unmap_Rules_Rule_Alias] FOREIGN KEY([Rule_Alias_ID_Unmap])
---REFERENCES [Rules].[Rule_Alias] ([Rule_Alias_ID])
---GO
---
---ALTER TABLE [Rules].[Rule] CHECK CONSTRAINT [FK_Rules_Rule_Rule_Alias_ID_Unmap_Rules_Rule_Alias]
---GO
---
---
---USE [EDW]
---GO
---
------5
---ALTER TABLE [Rules].[Rule] DROP CONSTRAINT [FK_Rules_Rule_Rule_Alias_ID_Map_Rules_Rule_Alias]
---GO
---
---ALTER TABLE [Rules].[Rule]  WITH NOCHECK ADD  CONSTRAINT [FK_Rules_Rule_Rule_Alias_ID_Map_Rules_Rule_Alias] FOREIGN KEY([Rule_Alias_ID_Map])
---REFERENCES [Rules].[Rule_Alias] ([Rule_Alias_ID])
---GO
---
---ALTER TABLE [Rules].[Rule] CHECK CONSTRAINT [FK_Rules_Rule_Rule_Alias_ID_Map_Rules_Rule_Alias]
---GO
---
---

USE [EDW]
GO

ALTER TABLE [Master_Etl].[Map_Well_Header] DROP CONSTRAINT [FK_Map_Well_Header_Master_Hub_Well_Header_UID]
GO

ALTER TABLE [Master_Etl].[Map_Well_Header]  WITH CHECK ADD  CONSTRAINT [FK_Map_Well_Header_Master_Hub_Well_Header_UID] FOREIGN KEY([Master_Hub_Well_Header_UID])
REFERENCES [Master].[Hub_Well_Header] ([Hub_Well_Header_UID])
GO

ALTER TABLE [Master_Etl].[Map_Well_Header] CHECK CONSTRAINT [FK_Map_Well_Header_Master_Hub_Well_Header_UID]
GO


USE [EDW]
GO

ALTER TABLE [Master_Etl].[Map_Well_Header] DROP CONSTRAINT [FK_Map_Well_Header_Merrick_Dim_Well_Header_UID_Dim_Well_Header]
GO

ALTER TABLE [Master_Etl].[Map_Well_Header]  WITH CHECK ADD  CONSTRAINT [FK_Map_Well_Header_Merrick_Dim_Well_Header_UID_Dim_Well_Header] FOREIGN KEY([Merrick_Dim_Well_Header_UID])
REFERENCES [Merrick].[Dim_Well_Header] ([Merrick_Dim_Well_Header_UID])
GO

ALTER TABLE [Master_Etl].[Map_Well_Header] CHECK CONSTRAINT [FK_Map_Well_Header_Merrick_Dim_Well_Header_UID_Dim_Well_Header]
GO


USE [EDW]
GO

ALTER TABLE [Master_Etl].[Map_Well_Header] DROP CONSTRAINT [FK_Map_Well_Header_WellView_Dim_Well_Header_UID_Dim_Well_Header]
GO

ALTER TABLE [Master_Etl].[Map_Well_Header]  WITH CHECK ADD  CONSTRAINT [FK_Map_Well_Header_WellView_Dim_Well_Header_UID_Dim_Well_Header] FOREIGN KEY([WellView_Dim_Well_Header_UID])
REFERENCES [WellView].[Dim_Well_Header] ([WellView_Dim_Well_Header_UID])
GO

ALTER TABLE [Master_Etl].[Map_Well_Header] CHECK CONSTRAINT [FK_Map_Well_Header_WellView_Dim_Well_Header_UID_Dim_Well_Header]
GO
