/* ---------------------------------------------------- */
/*  Generated by Enterprise Architect Version 15.0 		*/
/*  Created On : 16-Nov-2022 11:39:43 AM 				*/
/*  DBMS       : SQL Server 2012 						*/
/* ---------------------------------------------------- */

/* Drop Foreign Key Constraints */

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[FK_LibroAutor_Autor]') AND OBJECTPROPERTY(id, N'IsForeignKey') = 1) 
ALTER TABLE [LibroAutor] DROP CONSTRAINT [FK_LibroAutor_Autor]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[FK_LibroAutor_Libro]') AND OBJECTPROPERTY(id, N'IsForeignKey') = 1) 
ALTER TABLE [LibroAutor] DROP CONSTRAINT [FK_LibroAutor_Libro]
GO

/* Drop Tables */

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[Autor]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1) 
DROP TABLE [Autor]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[Libro]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1) 
DROP TABLE [Libro]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[LibroAutor]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1) 
DROP TABLE [LibroAutor]
GO

/* Create Tables */

CREATE TABLE [Autor]
(
	[AuthorID] int NOT NULL IDENTITY (1, 1),
	[Firstname] nvarchar(30) NULL,
	[Lastname] nvarchar(30) NULL
)
GO

CREATE TABLE [Libro]
(
	[isbn] nvarchar(13) NOT NULL,
	[Title] nvarchar(50) NULL,
	[Editionnumber] nvarchar(3) NULL,
	[Copyright] int NULL
)
GO

CREATE TABLE [LibroAutor]
(
	[AuthorID] int NULL,
	[isbn] nvarchar(13) NULL
)
GO

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE [Autor] 
 ADD CONSTRAINT [PK_Autor]
	PRIMARY KEY CLUSTERED ([AuthorID] ASC)
GO

ALTER TABLE [Libro] 
 ADD CONSTRAINT [PK_Libro]
	PRIMARY KEY CLUSTERED ([isbn] ASC)
GO

/* Create Foreign Key Constraints */

ALTER TABLE [LibroAutor] ADD CONSTRAINT [FK_LibroAutor_Autor]
	FOREIGN KEY ([AuthorID]) REFERENCES [Autor] ([AuthorID]) ON DELETE Cascade ON UPDATE Cascade
GO

ALTER TABLE [LibroAutor] ADD CONSTRAINT [FK_LibroAutor_Libro]
	FOREIGN KEY ([isbn]) REFERENCES [Libro] ([isbn]) ON DELETE Cascade ON UPDATE Cascade
GO
