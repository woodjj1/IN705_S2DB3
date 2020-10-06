USE [Cars]
GO
CREATE SCHEMA [Sales] AUTHORIZATION [dbo]
GO

USE [Cars]
GO
CREATE SCHEMA [Maintenance] AUTHORIZATION [dbo]
GO

USE [Cars]
GO
CREATE SCHEMA [Staff] AUTHORIZATION [dbo]
GO

Drop table [Student]
CREATE TABLE [Student]
	(
		[StudentID] int PRIMARY KEY,
		[LastName] nvarchar(100) NOT NULL,
		[FirstName] nvarchar(100) NOT NULL,
		[UserName] nvarchar(100) NOT NULL,
		[Password] nvarchar(20) NOT NULL
	)


	SELECT * FROM Student