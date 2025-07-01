---Not Needed
USE [EDW]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Rules].[Rule](
	[Rule_ID] [int] IDENTITY(1,1) NOT NULL,
	[Rule_Type_ID] [int] NOT NULL,
	[Rule_Entity_ID] [int] NOT NULL,
	[Rule_Attribute_Group_ID] [int] NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Criteria] [nvarchar](max) NOT NULL,
	[ResultType] [varchar](7) NOT NULL,
	[Matched_Weight] [float] NOT NULL,
	[Unmatched_Weight] [float] NOT NULL,
	[IsEnabled] [bit] NOT NULL,
	[IsDelayed] [bit] NOT NULL,
	[DelayThreshold] [float] NOT NULL,
	[IsExclusive] [bit] NOT NULL,
	[Rule_Alias_ID_Map] [int] NULL,
	[Rule_Alias_ID_Unmap] [int] NULL,
	[EDW_Effective_Start_Date] [datetime2](7) GENERATED ALWAYS AS ROW START NOT NULL,
	[EDW_Effective_End_Date] [datetime2](7) GENERATED ALWAYS AS ROW END NOT NULL,
 CONSTRAINT [PK_Rules_Rule] PRIMARY KEY CLUSTERED 
(
	[Rule_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([EDW_Effective_Start_Date], [EDW_Effective_End_Date])
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON (HISTORY_TABLE = [Rules].[Rule_History])
)
GO

ALTER TABLE [Rules].[Rule] ADD  CONSTRAINT [DF_Rules_Rule_Matched_Weight]  DEFAULT ((0.01)) FOR [Matched_Weight]
GO

ALTER TABLE [Rules].[Rule] ADD  CONSTRAINT [DF_Rules_Rule_Unmatched_Weight]  DEFAULT ((0.0)) FOR [Unmatched_Weight]
GO

ALTER TABLE [Rules].[Rule] ADD  CONSTRAINT [DF_Rules_Rule_IsEnabled]  DEFAULT ((1)) FOR [IsEnabled]
GO

ALTER TABLE [Rules].[Rule] ADD  CONSTRAINT [DF_Rules_Rule_IsDelayed]  DEFAULT ((0)) FOR [IsDelayed]
GO

ALTER TABLE [Rules].[Rule] ADD  CONSTRAINT [DF_Rules_Rule_DelayThreshold]  DEFAULT ((0)) FOR [DelayThreshold]
GO

ALTER TABLE [Rules].[Rule] ADD  CONSTRAINT [DF_Rules_Rule_IsExclusive]  DEFAULT ((0)) FOR [IsExclusive]
GO

ALTER TABLE [Rules].[Rule] ADD  CONSTRAINT [DF_Rules_Rule_EDW_Effective_Start_Date]  DEFAULT (sysutcdatetime()) FOR [EDW_Effective_Start_Date]
GO

ALTER TABLE [Rules].[Rule] ADD  CONSTRAINT [DF_Rules_Rule_EDW_Effective_End_Date]  DEFAULT (CONVERT([datetime2],'9999-12-31 23:59:59.9999999',(0))) FOR [EDW_Effective_End_Date]
GO

ALTER TABLE [Rules].[Rule]  WITH NOCHECK ADD  CONSTRAINT [FK_Rules_Rule_Rule_Alias_ID_Map_Rules_Rule_Alias] FOREIGN KEY([Rule_Alias_ID_Map])
REFERENCES [Rules].[Rule_Alias] ([Rule_Alias_ID])
GO

ALTER TABLE [Rules].[Rule] CHECK CONSTRAINT [FK_Rules_Rule_Rule_Alias_ID_Map_Rules_Rule_Alias]
GO

ALTER TABLE [Rules].[Rule]  WITH NOCHECK ADD  CONSTRAINT [FK_Rules_Rule_Rule_Alias_ID_Unmap_Rules_Rule_Alias] FOREIGN KEY([Rule_Alias_ID_Unmap])
REFERENCES [Rules].[Rule_Alias] ([Rule_Alias_ID])
GO

ALTER TABLE [Rules].[Rule] CHECK CONSTRAINT [FK_Rules_Rule_Rule_Alias_ID_Unmap_Rules_Rule_Alias]
GO

ALTER TABLE [Rules].[Rule]  WITH NOCHECK ADD  CONSTRAINT [FK_Rules_Rule_Rule_Entity_ID_Rules_Rule_Attribute_Group] FOREIGN KEY([Rule_Attribute_Group_ID])
REFERENCES [Rules].[Rule_Attribute_Group] ([Rule_Attribute_Group_ID])
GO

ALTER TABLE [Rules].[Rule] CHECK CONSTRAINT [FK_Rules_Rule_Rule_Entity_ID_Rules_Rule_Attribute_Group]
GO

ALTER TABLE [Rules].[Rule]  WITH NOCHECK ADD  CONSTRAINT [FK_Rules_Rule_Rule_Entity_ID_Rules_Rule_Entity] FOREIGN KEY([Rule_Entity_ID])
REFERENCES [Rules].[Rule_Entity] ([Rule_Entity_ID])
GO

ALTER TABLE [Rules].[Rule] CHECK CONSTRAINT [FK_Rules_Rule_Rule_Entity_ID_Rules_Rule_Entity]
GO

ALTER TABLE [Rules].[Rule]  WITH NOCHECK ADD  CONSTRAINT [FK_Rules_Rule_Rule_Type_ID_Rules_Rule_Type] FOREIGN KEY([Rule_Type_ID])
REFERENCES [Rules].[Rule_Type] ([Rule_Type_ID])
GO

ALTER TABLE [Rules].[Rule] CHECK CONSTRAINT [FK_Rules_Rule_Rule_Type_ID_Rules_Rule_Type]
GO

ALTER TABLE [Rules].[Rule]  WITH CHECK ADD  CONSTRAINT [CK_Rules_Rule_Matched_Weight] CHECK  (([Matched_Weight]>=(0.0) AND [Matched_Weight]<=(1.0)))
GO

ALTER TABLE [Rules].[Rule] CHECK CONSTRAINT [CK_Rules_Rule_Matched_Weight]
GO

ALTER TABLE [Rules].[Rule]  WITH CHECK ADD  CONSTRAINT [CK_Rules_Rule_Result_Type] CHECK  (([ResultType]='PERCENT' OR [ResultType]='FLOAT' OR [ResultType]='BIT'))
GO

ALTER TABLE [Rules].[Rule] CHECK CONSTRAINT [CK_Rules_Rule_Result_Type]
GO

ALTER TABLE [Rules].[Rule]  WITH CHECK ADD  CONSTRAINT [CK_Rules_Rule_Unmatched_Weight] CHECK  (([Unmatched_Weight]>=(0.0) AND [Unmatched_Weight]<=(1.0)))
GO

ALTER TABLE [Rules].[Rule] CHECK CONSTRAINT [CK_Rules_Rule_Unmatched_Weight]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Reference to a Rules.Rule_Type' , @level0type=N'SCHEMA',@level0name=N'Rules', @level1type=N'TABLE',@level1name=N'Rule', @level2type=N'COLUMN',@level2name=N'Rule_Type_ID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Reference to a Rules.Rule_Entity' , @level0type=N'SCHEMA',@level0name=N'Rules', @level1type=N'TABLE',@level1name=N'Rule', @level2type=N'COLUMN',@level2name=N'Rule_Entity_ID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Reference to a Rules.Rule_Attribute_Type' , @level0type=N'SCHEMA',@level0name=N'Rules', @level1type=N'TABLE',@level1name=N'Rule', @level2type=N'COLUMN',@level2name=N'Rule_Attribute_Group_ID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The name of the rule.' , @level0type=N'SCHEMA',@level0name=N'Rules', @level1type=N'TABLE',@level1name=N'Rule', @level2type=N'COLUMN',@level2name=N'Name'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Optional description of the rule.' , @level0type=N'SCHEMA',@level0name=N'Rules', @level1type=N'TABLE',@level1name=N'Rule', @level2type=N'COLUMN',@level2name=N'Description'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SQL Query that returns the following:
    UID_Left UNIQUEIDENTIFIER NOT NULL
    UID_Right UNIQUEIDENTIFIER NOT NULL
    X [ BIT | FLOAT ] NULL

Optimally the query should return all possible right hand values when a left hand value is unknown.' , @level0type=N'SCHEMA',@level0name=N'Rules', @level1type=N'TABLE',@level1name=N'Rule', @level2type=N'COLUMN',@level2name=N'Criteria'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Based upon the return value of X from the Criteria SQL Query. Can be either BIT, FLOAT, or PERCENT.' , @level0type=N'SCHEMA',@level0name=N'Rules', @level1type=N'TABLE',@level1name=N'Rule', @level2type=N'COLUMN',@level2name=N'ResultType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The weight or importance of a matched value. 
Allowed range is 0 to 1.
Note: Should be balanced among the Rule_Entity_Type grouping. Additionally a value of 0 will cause the match to be ignored.' , @level0type=N'SCHEMA',@level0name=N'Rules', @level1type=N'TABLE',@level1name=N'Rule', @level2type=N'COLUMN',@level2name=N'Matched_Weight'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The weight or importance of an unmatched value. 
Allowed range is 0 to 1
Note: Should be balanced among the Rule_Entity_Type grouping. To ignore an unmatched value, this should be set to 0. However, if an unmatched value definitely excludes the match on every level then set to a value between 0 and 1.' , @level0type=N'SCHEMA',@level0name=N'Rules', @level1type=N'TABLE',@level1name=N'Rule', @level2type=N'COLUMN',@level2name=N'Unmatched_Weight'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Sets whether or not the rule is evaluated.' , @level0type=N'SCHEMA',@level0name=N'Rules', @level1type=N'TABLE',@level1name=N'Rule', @level2type=N'COLUMN',@level2name=N'IsEnabled'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Not Implemented.' , @level0type=N'SCHEMA',@level0name=N'Rules', @level1type=N'TABLE',@level1name=N'Rule', @level2type=N'COLUMN',@level2name=N'IsDelayed'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Not Implemented.' , @level0type=N'SCHEMA',@level0name=N'Rules', @level1type=N'TABLE',@level1name=N'Rule', @level2type=N'COLUMN',@level2name=N'DelayThreshold'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Determines if the rule is an exclusive or primary match. If a match for a record is positive for an exclusive rule, no other rules are evaluated for that record.
Note: Only one exclusive rule is allowed per Rule_Entity. If a match is positive for an exclusive rule, a potential issue is that if the matching criteria is incorrect, it cannot be overridden by additional match criteria.' , @level0type=N'SCHEMA',@level0name=N'Rules', @level1type=N'TABLE',@level1name=N'Rule', @level2type=N'COLUMN',@level2name=N'IsExclusive'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Reference to a Rules.Rule_Alias of type map. This will override any calculated matches at a rule level.' , @level0type=N'SCHEMA',@level0name=N'Rules', @level1type=N'TABLE',@level1name=N'Rule', @level2type=N'COLUMN',@level2name=N'Rule_Alias_ID_Map'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Reference to a Rules.Rule_Alias of type unmap. This will override any calculated matches by breaking the calculated match relationship at a rule level.' , @level0type=N'SCHEMA',@level0name=N'Rules', @level1type=N'TABLE',@level1name=N'Rule', @level2type=N'COLUMN',@level2name=N'Rule_Alias_ID_Unmap'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contains the core settings of the Rule Matching process.
Rules are evaluated by the following hierarchy of groupings: 
1. Rule Entity 
2. Rule Type
3. Rule Attribute Type' , @level0type=N'SCHEMA',@level0name=N'Rules', @level1type=N'TABLE',@level1name=N'Rule'
GO


