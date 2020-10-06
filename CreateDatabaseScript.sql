/*CREATE DATABASE woodkerr_IN705Assignment1
GO*/





DROP TABLE AssemblySubcomponent
DROP TABLE QuoteComponent
DROP TABLE Component
DROP TABLE Quote
DROP TABLE Category
DROP TABLE Customer
DROP TABLE Supplier
DROP TABLE Contact


-- Create table Contact
CREATE TABLE Contact
(
	ContactID			INT          NOT NULL IDENTITY,
	ContactName			NVARCHAR(100) NOT NULL,
	ContactPhone		NVARCHAR(50) NOT NULL,
	ContactFax			NVARCHAR(50) NULL,
	ContactMobilePhone	NVARCHAR(50) NULL,
	ContactEmail		NVARCHAR(100) NULL,
	ContactWWW			NVARCHAR(100) NULL,
	ContactPostalAddress	NVARCHAR(100) NOT NULL,
	CONSTRAINT PK_ContactID PRIMARY KEY(ContactID) 
)	

-- Create table Supplier
CREATE TABLE Supplier
(
	SupplierID		INT     NOT NULL,
	SupplierGST		INT		NOT NULL,
	CONSTRAINT PK_SupplierID PRIMARY KEY(SupplierID),
	CONSTRAINT FK_Supplier_Contact FOREIGN KEY(SupplierID)
	REFERENCES Contact(ContactID) ON UPDATE cascade on delete cascade
	 
)

-- Create table Customer
 CREATE TABLE Customer
(
	CustomerID  INT     NOT NULL,
	CONSTRAINT PK_CustomerID PRIMARY KEY(CustomerID),
	CONSTRAINT FK_Customer_Contact  FOREIGN KEY(CustomerID)
	REFERENCES Contact(ContactID) ON UPDATE cascade on delete cascade
)


-- Create table Category
CREATE TABLE Category
(
  CategoryID		     INT			NOT NULL IDENTITY,
  CategoryName			 NVARCHAR(100)	NOT NULL,
  CONSTRAINT PK_Category PRIMARY KEY(CategoryID) 

 
 )
 -- Create table Quote
 CREATE TABLE Quote
 (
	QuoteID			INT NOT NULL,
	QuoteDescription  NVARCHAR(200) NOT NULL,
	QuoteDate		 DATETIME NOT NULL,
	QuotePrice		MONEY NOT NULL,
	QuoteCompiler	NVARCHAR(50) NOT NULL,
	CustomerID		INT NOT NULL,
	CONSTRAINT PK_QuoteID PRIMARY KEY(QuoteID), 
	CONSTRAINT FK_Quote_Customer FOREIGN KEY (CustomerID)
	REFERENCES Customer(CustomerID) ON UPDATE cascade on delete no action
 )



 -- Create table Component
 CREATE TABLE Component
 (
	ComponentID		INT IDENTITY,
	ComponentName	NVARCHAR(100) NOT NULL,
	ComponentDescription	NVARCHAR(200) NOT NULL,
	TradePrice		MONEY	NOT NULL,
	ListPrice		MONEY	NOT NULL,
	TimeToFit		DECIMAL	NOT NULL,
	CategoryID		INT		NOT NULL,
	SupplierID		INT		NOT NULL,
	CONSTRAINT PK_ComponentID	PRIMARY KEY(ComponentID),
	CONSTRAINT FK_Component_Category FOREIGN KEY (CategoryID)
	REFERENCES Category(CategoryID) ON DELETE  no action,
	CONSTRAINT FK_Component_Supplier FOREIGN KEY (SupplierID)
	REFERENCES Supplier(SupplierID) ON UPDATE cascade 


 )
 -- Create table QuoteComponent
  CREATE TABLE QuoteComponent
 (
	ComponentID		INT NOT NULL,
	QuoteID			INT NOT NULL,
	Quantity		INT NOT NULL,
	TradePrice		MONEY	NOT NULL,
	ListPrice		MONEY	NOT NULL,
	TimeToFit		DECIMAL		NOT NULL
	CONSTRAINT PK_QuoteComponent PRIMARY KEY(QuoteID, ComponentID), 
	CONSTRAINT FK_QuoteComponent FOREIGN KEY (QuoteID)
	REFERENCES Quote(QuoteID)  ON UPDATE cascade, 
	CONSTRAINT FK_QuoteComponent_Component FOREIGN KEY (ComponentID)
	REFERENCES Component(ComponentID) 
 )
 -- Create table AssemblySubcomponent
  CREATE TABLE AssemblySubcomponent
 (
	AssemblyID		INT		NOT NULL,
	SubcomponentID	INT		NOT NULL,
	Quantity		INT		NOT NULL CONSTRAINT ASQuantity default 0,

	CONSTRAINT PK_AssemblySubcomponent PRIMARY KEY(AssemblyID, SubcomponentID),
	
	CONSTRAINT CHK_AssemblySubcomponent_Different
	CHECK (AssemblyID != SubcomponentID),
	
	CONSTRAINT CHK_AssemblySubcomponent_Quantity
	CHECK (Quantity >= 0),
	CONSTRAINT FK_Subcomponent_Component FOREIGN KEY (SubComponentID)
	REFERENCES Component(ComponentID) ON UPDATE cascade on delete no action,
	CONSTRAINT FK_Assembly_Component FOREIGN KEY (AssemblyID)
	REFERENCES Component(ComponentID) 
 )


select * from Contact
select * from Supplier
select * from Category
select * from Component
select * from AssemblySubcomponent
select * from Customer
select * from Quote
select * from QuoteComponent
