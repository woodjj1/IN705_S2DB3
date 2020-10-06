/* Create tables

alter table AssemblySubComponent
 Alter  Column AssemblyID int NOT Null;

alter table AssemblySubComponent
Alter Column SubcomponentID int NOT Null;

alter table AssemblySubComponent
Alter Column Quantity int Not Null;

Alter table AssemblySubComponent
Add constraint PK_AssemblySubcomponent PRIMARY KEY (AssemblyID,SubcomponentID),
Alter table AssemblySubComponent
ADD
Constraint CHK_AssemblySubComponent_Different
CHECK (AssemblyID != SubcomponentID)

Alter table AssemblySubComponent
ADD
Constraint CHK_AssemblySubComponent_Quantity
CHECK (Quantity >= 0)

Alter table AssemblySubComponent
add constraint FK_Subcomponent_Component FOREIGN KEY (SubcomponentID)
references AssemblySubcomponent (SubcomponentID) on update cascade on delete no action -----need help

Alter table Category
alter column CategoryID int NOT Null;

Alter table Category
alter column CategoryName nvarchar(100) NOT Null;

Alter table Category
Add constraint PK_Category PRIMARY KEY (CategoryID)

Alter table Component
alter column ComponentID int NOT Null;

Alter table Component
alter column ComponentName nvarchar(100) NOT Null;

Alter table Component
alter column ComponentDescription nvarchar(200) NOT NULL;

Alter table Component
alter column TradePrice money NOT Null;

Alter table Component
alter column ListPrice money NOT Null;

Alter table Component
alter column TimeToFit time NOT Null;

Alter table Component
alter column CategoryID int NOT Null;

Alter table Component
alter column SupplierID int NOT Null;

Alter table Component
Add constraint PK_ComponentID PRIMARY KEY (ComponentID)

Alter table Contact
alter column ContactID int NOT Null;

Alter table Contact
alter column ContactName nvarchar(100) NOT Null;

Alter table Contact
alter column ContactPhone int NOT Null;

Alter table Contact
alter column ContactFax int;

Alter table Contact
alter column ContactMobilePhone int;

Alter table Contact
alter column ContactEmail nvarchar(200) not null;

Alter table Contact
alter column ContactWWW nvarchar(100) NOT Null;

Alter table Contact
alter column ContactPostalAddress nvarchar(100) NOT Null;

Alter table Contact
Add constraint PK_ContactID PRIMARY KEY (ContactID);

Alter table Customer
alter column CustomerID int not null;

Alter table Customer
Add constraint PK_CustomerID PRIMARY KEY (CustomerID);

Alter table Quote
alter column QuoteID int not null;

Alter table Quote
alter column QuoteDescription nvarchar(200) not null;

Alter table Quote
alter column QuoteDate datetime not null;

Alter table Quote
alter column QuotePrice money not null;

Alter table Quote
alter column QuoteCompiler nvarchar(50) not null;

Alter table Quote
alter column CustomerID int not null;

Alter table Quote
Add constraint PK_QuoteID PRIMARY KEY (QuoteID);

Alter table QuoteComponent
alter column ComponentID int not null;

Alter table QuoteComponent
alter column QuoteID int not null;

Alter table QuoteComponent
alter column Quantity int not null;

Alter table QuoteComponent
alter column TradePrice money not null;

Alter table QuoteComponent
alter column ListPrice money not null;

Alter table QuoteComponent
alter column TimeToFit time not null;

Alter table QuoteComponent                                                   ------ Need help with this to get both PK on table
Add constraint PK_QuoteComponent PRIMARY KEY (QuoteID,ComponentID);
Alter table QuoteComponent
ADD
Constraint CHK_QuoteComponent_Different
CHECK (QuoteID != ComponentID)

Alter table Supplier
alter column SupplierID int not null;

Alter table Supplier
alter column SupplierGST int not null;

Alter table Supplier
add constraint PK_SupplierID PRIMARY KEY (SupplierID);





