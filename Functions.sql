
create function getCategoryID(@CategoryName nvarchar(30))
returns int
as
begin

return(Select CategoryID from Category where CategoryName = @CategoryName)

end

select dbo.getCategoryID('Black Steal')


create function getAssemblySupplierID()
returns int
as
begin

return(Select ContactID from Contact where ContactName = 'BIT Manufacturing Ltd.')

end

select dbo.getAssemblySupplierID()



/*drop proc createAssembly
*/
create proc createAssembly(@componentName nvarchar(50), @componentDescription nvarchar(50))
as
begin

declare @SupplierID int
set @SupplierID = dbo.getAssemblySupplierID()

declare @CategoryID int
set @CategoryID = dbo.getCategoryID('Assembly')

insert Component (ComponentName, ComponentDescription, SupplierID, ListPrice, TradePrice, TimeToFit, CategoryID)
values (@componentName, @componentDescription, @SupplierID, 0,0,0, @CategoryID)
end

exec  createAssembly 'please', 'work'

select * from AssemblySubcomponent



create proc	addSubComponent(@AssemblyName nvarchar(50), @subComponentName nvarchar(50), @quantity int)
as
insert into AssemblySubcomponent (AssemblyID, SubcomponentID,Quantity)
select c1.ComponentID, c2.ComponentID, @quantity from Component c1 cross join Component c2 where c1.ComponentName = @AssemblyName and c2.ComponentName = @subComponentName