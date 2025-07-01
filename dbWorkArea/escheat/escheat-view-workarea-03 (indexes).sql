ALTER TABLE [dbo].[rvBalOwnTxn] ADD CONSTRAINT [PKrvBalOwnTxn] PRIMARY KEY CLUSTERED ([OwnTxnTID]) ON [PRIMARY]
CREATE UNIQUE NONCLUSTERED INDEX [XAK1rvBalOwnTxn] ON [dbo].[rvBalOwnTxn] ([OwnHID], [OwnAddrTID], [OwnTxnTID]) ON [PRIMARY]
CREATE NONCLUSTERED INDEX [XIE1rvBalOwnTxn] ON [dbo].[rvBalOwnTxn] ([OwnPmtStatCode], [OwnHID], [OwnTxnTID]) INCLUDE ([OwnCorpHID], [OwnPropHID]) ON [PRIMARY]
CREATE NONCLUSTERED INDEX [XIE2rvBalOwnTxn] ON [dbo].[rvBalOwnTxn] ([OwnTxnDtlTID], [OwnPmtStatCode], [OwnHID], [OwnAddrTID]) ON [PRIMARY]
CREATE NONCLUSTERED INDEX [XIE3rvBalOwnTxn] ON [dbo].[rvBalOwnTxn] ([OwnAddrTID], [OwnProcessTID], [OwnCorpHID], [OwnPmtStatCode]) ON [PRIMARY]
CREATE NONCLUSTERED INDEX [XIE4rvBalOwnTxn] ON [dbo].[rvBalOwnTxn] ([OwnProcessTID], [OwnHID]) ON [PRIMARY]
CREATE NONCLUSTERED INDEX [XIE5rvBalOwnTxn] ON [dbo].[rvBalOwnTxn] ([OwnProcessTID], [OwnTxnTID]) ON [PRIMARY]
CREATE NONCLUSTERED INDEX [XIE6rvBalOwnTxn] ON [dbo].[rvBalOwnTxn] ([OwnCorpHID], [OwnPmtStatCode], [OwnProcessTID]) INCLUDE ([OwnTxnTID], [OwnAcctDate], [OwnProdDate], [OwnAddrTID], [OwnPropHID], [OwnSuspCode]) ON [PRIMARY]

CREATE NONCLUSTERED INDEX [XIF1210rvBalOwnTxn] ON [dbo].[rvBalOwnTxn] ([OwnAddrTID]) ON [PRIMARY]
CREATE NONCLUSTERED INDEX [XIF1230rvBalOwnTxn] ON [dbo].[rvBalOwnTxn] ([OwnSuspCode]) ON [PRIMARY]
CREATE NONCLUSTERED INDEX [XIF1772rvBalOwnTxn] ON [dbo].[rvBalOwnTxn] ([OwnEschPmtTID]) ON [PRIMARY]

CREATE NONCLUSTERED INDEX [XIF1220rvBalOwnTxn] ON [dbo].[rvBalOwnTxn] ([OwnIntCode]) ON [PRIMARY]
CREATE NONCLUSTERED INDEX [XIF1240rvBalOwnTxn] ON [dbo].[rvBalOwnTxn] ([OwnHID]) ON [PRIMARY]
CREATE NONCLUSTERED INDEX [XIF1970rvBalOwnTxn] ON [dbo].[rvBalOwnTxn] ([OwnPmtStatCode]) ON [PRIMARY]
CREATE NONCLUSTERED INDEX [XIF1113rvBalOwnTxn] ON [dbo].[rvBalOwnTxn] ([OwnTxnDtlTID]) ON [PRIMARY]
CREATE NONCLUSTERED INDEX [XIF1681rvBalOwnTxn] ON [dbo].[rvBalOwnTxn] ([OwnPayeeHID]) ON [PRIMARY]
CREATE NONCLUSTERED INDEX [XIF1682rvBalOwnTxn] ON [dbo].[rvBalOwnTxn] ([OwnPayeeAddrTID]) ON [PRIMARY]
CREATE NONCLUSTERED INDEX [XIF1685rvBalOwnTxn] ON [dbo].[rvBalOwnTxn] ([OwnProcessTID]) INCLUDE ([OwnTxnTID], [OwnHID], [OwnAddrTID], [OwnPayeeHID], [OwnPayeeAddrTID], [OwnTxnDtlTID], [OwnPostVol], [OwnMmbtu], [OwnNet], [OwnEschPmtTID], [OwnZeroPPASuppress]) ON [PRIMARY]
CREATE NONCLUSTERED INDEX [XIF3067rvBalOwnTxn] ON [dbo].[rvBalOwnTxn] ([OwnCorpHID]) ON [PRIMARY]
CREATE NONCLUSTERED INDEX [XIF3068rvBalOwnTxn] ON [dbo].[rvBalOwnTxn] ([OwnPropHID]) ON [PRIMARY]
CREATE NONCLUSTERED INDEX [XIF6542rvBalOwnTxn] ON [dbo].[rvBalOwnTxn] ([OwnReDistProcessTID]) ON [PRIMARY]
CREATE NONCLUSTERED INDEX [XIF6543rvBalOwnTxn] ON [dbo].[rvBalOwnTxn] ([OwnReDistTxnHdrTID]) ON [PRIMARY]
CREATE NONCLUSTERED INDEX [XIF7351rvBalOwnTxn] ON [dbo].[rvBalOwnTxn] ([OwnAcctHID]) ON [PRIMARY]
CREATE NONCLUSTERED INDEX [IX_rvBalOwnTxn_OwnZeroPPASuppress_20170719] ON [dbo].[rvBalOwnTxn] ([OwnZeroPPASuppress]) INCLUDE ([OwnTxnTID], [OwnCorpHID], [OwnPayeeHID], [OwnPayeeAddrTID], [OwnVal], [OwnRltyBurdenChgBkVal], [OwnTax], [OwnDed], [OwnNet]) ON [PRIMARY]
CREATE NONCLUSTERED INDEX [IX_rvBalOwnTxn_OwnCorpHID_OwnPayeeHID_OwnPayeeAddrTID_20170719] ON [dbo].[rvBalOwnTxn] ([OwnCorpHID], [OwnPayeeHID], [OwnPayeeAddrTID]) INCLUDE ([OwnTxnTID], [OwnVal], [OwnRltyBurdenChgBkVal], [OwnTax], [OwnDed], [OwnNet], [OwnZeroPPASuppress]) ON [PRIMARY]
CREATE NONCLUSTERED INDEX [EDI1] ON [dbo].[rvBalOwnTxn] ([OwnAddrTID], [OwnCorpHID]) INCLUDE ([OwnVal], [OwnRltyBurdenChgBkVal], [OwnTax], [OwnDed]) ON [PRIMARY]
CREATE NONCLUSTERED INDEX [EDI2] ON [dbo].[rvBalOwnTxn] ([OwnZeroPPASuppress]) INCLUDE ([OwnTxnDtlTID], [OwnIntCode], [OwnTax], [OwnDed]) ON [PRIMARY]
CREATE NONCLUSTERED INDEX [EDI4] ON [dbo].[rvBalOwnTxn] ([OwnZeroPPASuppress]) INCLUDE ([OwnTxnDtlTID], [OwnIntCode], [OwnDeckDcml], [OwnDistribDcml], [OwnDistribChgBkDcml], [OwnVal], [OwnRltyBurdenChgBkVal], [OwnTax], [OwnDed], [OwnNet]) ON [PRIMARY]


------------------------------------------------------------------------------------
-- section_header
------------------------------------------------------------------------------------
ALTER TABLE [dbo].[rvBalOwnTxn] ADD CONSTRAINT [PKrvBalOwnTxn] PRIMARY KEY CLUSTERED ([OwnTxnTID]) ON [PRIMARY]
CREATE NONCLUSTERED INDEX [_dta_rvBalOwnTxn_OwnZeroPPASuppress_OwnPmtStatCode_INCLUDE] ON [dbo].[rvBalOwnTxn] ([OwnZeroPPASuppress], [OwnPmtStatCode]) INCLUDE ([OwnTxnTID], [OwnTxnDtlTID], [OwnPropHID], [OwnAcctDate], [OwnPmtDate], [OwnHID], [OwnPayeeHID], [OwnSuspCode], [OwnIntCode], [OwnDeckDcml], [OwnNet], [OwnProcessTID]) ON [PRIMARY]
CREATE NONCLUSTERED INDEX [_dta_rvBalOwnTxn_OwnTxnDtlTID_OwnZeroPPASuppress_INCLUDED] ON [dbo].[rvBalOwnTxn] ([OwnTxnDtlTID], [OwnZeroPPASuppress]) INCLUDE ([OwnTxnTID], [OwnPropHID], [OwnAcctDate], [OwnPmtDate], [OwnHID], [OwnPayeeHID], [OwnSuspCode], [OwnIntCode], [OwnDeckDcml], [OwnNet], [OwnPmtStatCode], [OwnProcessTID]) ON [PRIMARY]
CREATE NONCLUSTERED INDEX [_dta_dbo_rvBalOwnTxn_OwnPmtStatCode_INCLUDE] ON [dbo].[rvBalOwnTxn] ([OwnPmtStatCode]) INCLUDE ([OwnTxnTID], [OwnTxnDtlTID], [OwnCorpHID], [OwnPropHID], [OwnAcctDate], [OwnProdDate], [OwnPmtDate], [OwnHID], [OwnPayeeHID], [OwnSuspCode], [OwnIntCode], [OwnDeckDcml], [OwnDistribDcml], [OwnChkVol], [OwnPostVol], [OwnGrsVol], [OwnMmbtu], [OwnVal], [OwnNetting], [OwnTax], [OwnDed], [OwnNet]) ON [PRIMARY]

CREATE NONCLUSTERED INDEX [XIF1230rvBalOwnTxn] ON [dbo].[rvBalOwnTxn] ([OwnSuspCode]) ON [PRIMARY]
CREATE NONCLUSTERED INDEX [_dta_rvBalOwnTxn_OwnZeroPPASuppress_OwnPmtStatCode_INCLUDED] ON [dbo].[rvBalOwnTxn] ([OwnZeroPPASuppress], [OwnPmtStatCode]) INCLUDE ([OwnTxnTID], [OwnTxnDtlTID], [OwnPropHID], [OwnAcctDate], [OwnProdDate], [OwnPmtDate], [OwnHID], [OwnPayeeHID], [OwnSuspCode], [OwnIntCode], [OwnDeckDcml], [OwnVal], [OwnNetting], [OwnRltyBurdenChgBkVal], [OwnTax], [OwnDed], [OwnNet], [OwnProcessTID]) ON [PRIMARY]


