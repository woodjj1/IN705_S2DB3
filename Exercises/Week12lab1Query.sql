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

DROP TABLE [Staff].[tblStaffDetails]

CREATE TABLE [Staff].[tblStaffDetails]
	(
		[StaffID] int identity(1,1) PRIMARY KEY,
		[Firstname] nvarchar(100) NOT NULL,
		[Lastname] nvarchar(100) NOT NULL
	)

INSERT INTO Staff.tblStaffDetails(Firstname, Lastname) VALUES
('Michael', 'Harrington'), 
('Paul', 'Simons'), 
('Dave', 'Stern')

 DROP TABLE [Sales].[tblCarDetails]
 CREATE TABLE [Sales].[tblCarDetails]
	(
		[CarID] int identity(1,1) PRIMARY KEY,
		[VINNumber] nvarchar(255) NOT NULL,
		[NumberOfDoors] nvarchar(10) NOT NULL
	)

INSERT INTO Sales.tblCarDetails(VINNumber, NumberOfDoors) VALUES
('00001AB', '4'), 
('00007AS', '3'), 
('00006AT', '3'),
('00004AY', '4'),
('00002AJ', '1')

DROP TABLE [Maintenance].[tblBuildMaintenance]
 CREATE TABLE [Maintenance].[tblBuildMaintenance]
	(
		[Maintenance] int identity(1,1) PRIMARY KEY,
		[BuildingID] nvarchar(255) NOT NULL,
		[Fault] nvarchar(500) NOT NULL
	)

INSERT INTO Maintenance.tblBuildMaintenance(BuildingID, Fault) VALUES
('1', 'Blown light'), 
('2', 'Blocked toilet'), 
('3', 'Broken door'),
('4', 'Broken window')


