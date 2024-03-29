/****** Object:  ForeignKey [FK_Connection_Connection]    Script Date: 02/02/2010 12:53:03 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Connection_Connection]') AND parent_object_id = OBJECT_ID(N'[dbo].[Connection]'))
ALTER TABLE [dbo].[Connection] DROP CONSTRAINT [FK_Connection_Connection]
GO
/****** Object:  ForeignKey [FK_Description_Connection]    Script Date: 02/02/2010 12:53:03 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Description_Connection]') AND parent_object_id = OBJECT_ID(N'[dbo].[Description]'))
ALTER TABLE [dbo].[Description] DROP CONSTRAINT [FK_Description_Connection]
GO
/****** Object:  ForeignKey [FK_Icon_Connection]    Script Date: 02/02/2010 12:53:03 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Icon_Connection]') AND parent_object_id = OBJECT_ID(N'[dbo].[Icon]'))
ALTER TABLE [dbo].[Icon] DROP CONSTRAINT [FK_Icon_Connection]
GO
/****** Object:  ForeignKey [FK_Icon_IconLibrary]    Script Date: 02/02/2010 12:53:03 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Icon_IconLibrary]') AND parent_object_id = OBJECT_ID(N'[dbo].[Icon]'))
ALTER TABLE [dbo].[Icon] DROP CONSTRAINT [FK_Icon_IconLibrary]
GO
/****** Object:  ForeignKey [FK_IconCondition_Icon]    Script Date: 02/02/2010 12:53:03 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_IconCondition_Icon]') AND parent_object_id = OBJECT_ID(N'[dbo].[IconCondition]'))
ALTER TABLE [dbo].[IconCondition] DROP CONSTRAINT [FK_IconCondition_Icon]
GO
/****** Object:  ForeignKey [FK_Mapping_Connection]    Script Date: 02/02/2010 12:53:03 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Mapping_Connection]') AND parent_object_id = OBJECT_ID(N'[dbo].[Mapping]'))
ALTER TABLE [dbo].[Mapping] DROP CONSTRAINT [FK_Mapping_Connection]
GO
/****** Object:  ForeignKey [FK_Overlay_Connection]    Script Date: 02/02/2010 12:53:03 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Overlay_Connection]') AND parent_object_id = OBJECT_ID(N'[dbo].[Overlay]'))
ALTER TABLE [dbo].[Overlay] DROP CONSTRAINT [FK_Overlay_Connection]
GO
/****** Object:  ForeignKey [FK_OverlayCondition_Overlay]    Script Date: 02/02/2010 12:53:03 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OverlayCondition_Overlay]') AND parent_object_id = OBJECT_ID(N'[dbo].[OverlayCondition]'))
ALTER TABLE [dbo].[OverlayCondition] DROP CONSTRAINT [FK_OverlayCondition_Overlay]
GO
/****** Object:  Table [dbo].[IconCondition]    Script Date: 02/02/2010 12:53:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IconCondition]') AND type in (N'U'))
DROP TABLE [dbo].[IconCondition]
GO
/****** Object:  Table [dbo].[Description]    Script Date: 02/02/2010 12:53:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Description]') AND type in (N'U'))
DROP TABLE [dbo].[Description]
GO
/****** Object:  Table [dbo].[Mapping]    Script Date: 02/02/2010 12:53:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mapping]') AND type in (N'U'))
DROP TABLE [dbo].[Mapping]
GO
/****** Object:  Table [dbo].[Icon]    Script Date: 02/02/2010 12:53:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Icon]') AND type in (N'U'))
DROP TABLE [dbo].[Icon]
GO
/****** Object:  Table [dbo].[OverlayCondition]    Script Date: 02/02/2010 12:53:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OverlayCondition]') AND type in (N'U'))
DROP TABLE [dbo].[OverlayCondition]
GO
/****** Object:  Table [dbo].[Overlay]    Script Date: 02/02/2010 12:53:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Overlay]') AND type in (N'U'))
DROP TABLE [dbo].[Overlay]
GO
/****** Object:  Table [dbo].[Connection]    Script Date: 02/02/2010 12:53:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Connection]') AND type in (N'U'))
DROP TABLE [dbo].[Connection]
GO
/****** Object:  Table [dbo].[IconLibrary]    Script Date: 02/02/2010 12:53:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IconLibrary]') AND type in (N'U'))
DROP TABLE [dbo].[IconLibrary]
GO
/****** Object:  Table [dbo].[IconLibrary]    Script Date: 02/02/2010 12:53:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IconLibrary]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[IconLibrary](
	[ID] [int] NOT NULL,
	[location] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[isLocal] [bit] NOT NULL,
 CONSTRAINT [PK_IconLibrary] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Connection]    Script Date: 02/02/2010 12:53:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Connection]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Connection](
	[ID] [int] NOT NULL,
	[name] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[dbName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[userName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[password] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[port] [int] NOT NULL,
	[address] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_Connection] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Overlay]    Script Date: 02/02/2010 12:53:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Overlay]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Overlay](
	[ID] [int] NOT NULL,
	[connID] [int] NOT NULL,
	[color] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_Overlay] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[connID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[OverlayCondition]    Script Date: 02/02/2010 12:53:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OverlayCondition]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OverlayCondition](
	[ID] [int] NOT NULL,
	[overlayID] [int] NOT NULL,
	[connID] [int] NOT NULL,
	[lowerBound] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[upperBound] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[lowerOperator] [int] NULL,
	[upperOperator] [int] NULL,
	[fieldName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[tableName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_OverlayCondition] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[OverlayCondition]') AND name = N'IX_OverlayCondition')
CREATE NONCLUSTERED INDEX [IX_OverlayCondition] ON [dbo].[OverlayCondition] 
(
	[overlayID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[OverlayCondition]') AND name = N'IX_OverlayCondition_1')
CREATE NONCLUSTERED INDEX [IX_OverlayCondition_1] ON [dbo].[OverlayCondition] 
(
	[connID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO
/****** Object:  Table [dbo].[Icon]    Script Date: 02/02/2010 12:53:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Icon]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Icon](
	[ID] [int] NOT NULL,
	[connID] [int] NOT NULL,
 CONSTRAINT [PK_Icon] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[connID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Mapping]    Script Date: 02/02/2010 12:53:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mapping]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Mapping](
	[ID] [int] NOT NULL,
	[tableName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[latFieldName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[longFieldName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[format] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[connID] [int] NOT NULL,
 CONSTRAINT [PK_Mapping] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Mapping]') AND name = N'IX_Mapping')
CREATE NONCLUSTERED INDEX [IX_Mapping] ON [dbo].[Mapping] 
(
	[connID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO
/****** Object:  Table [dbo].[Description]    Script Date: 02/02/2010 12:53:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Description]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Description](
	[connID] [int] NOT NULL,
	[description] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_Description] PRIMARY KEY CLUSTERED 
(
	[connID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[IconCondition]    Script Date: 02/02/2010 12:53:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IconCondition]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[IconCondition](
	[ID] [int] NOT NULL,
	[connID] [int] NOT NULL,
	[iconID] [int] NOT NULL,
	[lowerBound] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[upperBound] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[lowerOperator] [int] NULL,
	[upperOperator] [int] NULL,
	[fieldName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[tableName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_IconCondition] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[IconCondition]') AND name = N'IX_IconCondition')
CREATE NONCLUSTERED INDEX [IX_IconCondition] ON [dbo].[IconCondition] 
(
	[iconID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[IconCondition]') AND name = N'IX_IconCondition_1')
CREATE NONCLUSTERED INDEX [IX_IconCondition_1] ON [dbo].[IconCondition] 
(
	[connID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO
/****** Object:  ForeignKey [FK_Connection_Connection]    Script Date: 02/02/2010 12:53:03 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Connection_Connection]') AND parent_object_id = OBJECT_ID(N'[dbo].[Connection]'))
ALTER TABLE [dbo].[Connection]  WITH CHECK ADD  CONSTRAINT [FK_Connection_Connection] FOREIGN KEY([ID])
REFERENCES [dbo].[Connection] ([ID])
GO
ALTER TABLE [dbo].[Connection] CHECK CONSTRAINT [FK_Connection_Connection]
GO
/****** Object:  ForeignKey [FK_Description_Connection]    Script Date: 02/02/2010 12:53:03 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Description_Connection]') AND parent_object_id = OBJECT_ID(N'[dbo].[Description]'))
ALTER TABLE [dbo].[Description]  WITH CHECK ADD  CONSTRAINT [FK_Description_Connection] FOREIGN KEY([connID])
REFERENCES [dbo].[Connection] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Description] CHECK CONSTRAINT [FK_Description_Connection]
GO
/****** Object:  ForeignKey [FK_Icon_Connection]    Script Date: 02/02/2010 12:53:03 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Icon_Connection]') AND parent_object_id = OBJECT_ID(N'[dbo].[Icon]'))
ALTER TABLE [dbo].[Icon]  WITH CHECK ADD  CONSTRAINT [FK_Icon_Connection] FOREIGN KEY([connID])
REFERENCES [dbo].[Connection] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Icon] CHECK CONSTRAINT [FK_Icon_Connection]
GO
/****** Object:  ForeignKey [FK_Icon_IconLibrary]    Script Date: 02/02/2010 12:53:03 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Icon_IconLibrary]') AND parent_object_id = OBJECT_ID(N'[dbo].[Icon]'))
ALTER TABLE [dbo].[Icon]  WITH CHECK ADD  CONSTRAINT [FK_Icon_IconLibrary] FOREIGN KEY([ID])
REFERENCES [dbo].[IconLibrary] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Icon] CHECK CONSTRAINT [FK_Icon_IconLibrary]
GO
/****** Object:  ForeignKey [FK_IconCondition_Icon]    Script Date: 02/02/2010 12:53:03 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_IconCondition_Icon]') AND parent_object_id = OBJECT_ID(N'[dbo].[IconCondition]'))
ALTER TABLE [dbo].[IconCondition]  WITH CHECK ADD  CONSTRAINT [FK_IconCondition_Icon] FOREIGN KEY([iconID], [connID])
REFERENCES [dbo].[Icon] ([ID], [connID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[IconCondition] CHECK CONSTRAINT [FK_IconCondition_Icon]
GO
/****** Object:  ForeignKey [FK_Mapping_Connection]    Script Date: 02/02/2010 12:53:03 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Mapping_Connection]') AND parent_object_id = OBJECT_ID(N'[dbo].[Mapping]'))
ALTER TABLE [dbo].[Mapping]  WITH CHECK ADD  CONSTRAINT [FK_Mapping_Connection] FOREIGN KEY([connID])
REFERENCES [dbo].[Connection] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Mapping] CHECK CONSTRAINT [FK_Mapping_Connection]
GO
/****** Object:  ForeignKey [FK_Overlay_Connection]    Script Date: 02/02/2010 12:53:03 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Overlay_Connection]') AND parent_object_id = OBJECT_ID(N'[dbo].[Overlay]'))
ALTER TABLE [dbo].[Overlay]  WITH CHECK ADD  CONSTRAINT [FK_Overlay_Connection] FOREIGN KEY([connID])
REFERENCES [dbo].[Connection] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Overlay] CHECK CONSTRAINT [FK_Overlay_Connection]
GO
/****** Object:  ForeignKey [FK_OverlayCondition_Overlay]    Script Date: 02/02/2010 12:53:03 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OverlayCondition_Overlay]') AND parent_object_id = OBJECT_ID(N'[dbo].[OverlayCondition]'))
ALTER TABLE [dbo].[OverlayCondition]  WITH CHECK ADD  CONSTRAINT [FK_OverlayCondition_Overlay] FOREIGN KEY([overlayID], [connID])
REFERENCES [dbo].[Overlay] ([ID], [connID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OverlayCondition] CHECK CONSTRAINT [FK_OverlayCondition_Overlay]
GO
