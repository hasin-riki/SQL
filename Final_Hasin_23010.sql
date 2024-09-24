create database finalExam
use finalExam

--a
select * from Customers
select * from Products
select * from Orders
select * from Suppliers

--b
select o.ordid,c.custname from Customers c join Orders o on c.custid=o.custid where o.ordstatus=1 order by o.ordid asc

--c
select * from Products order by prodprice asc

--d
create view supView
as
select supid,supname,supestablish from Suppliers where supestablish<='2019-01-01'

select * from supView

--e
insert into supView (supestablish) values ('2019-02-21')
--f
select p.prodname from Products p join Orders o on p.prodid=o.prodid where o.prodid in 
(select prodid from Orders group by prodid having count(prodid)=(select max(count) from (select (count(prodid)) as count from Orders group by prodid) temp))

--g
select p.prodname, s.supname, p.prodprice from Products p join Suppliers s on p.supid=s.supid where prodprice in (select min(prodprice) from Products group by prodcategory) 

--h
go
create proc supStatus
@supid int
as
begin
declare @supname varchar(50)
declare @status varchar(50)
declare @supProd int

select @supProd=count(supid) from Products where supid=@supid
select @supname=supname from Suppliers

if(@supProd<5)
	set @status='Least Preferred Supplier'
else
	begin
	if(@supProd>=5 and @supProd<8)
		set @status='Average Preferred Supplier'
	else
		set @status='Most Preferred Supplier'
	end
	print @supname + ': ' + @status
end
go

supStatus '2'

--i
create proc Customers_Shipping
AS
BEGIN
declare @custId int
declare @city varchar(50);
declare @charges float;
Set @city = (Select custcity from CUSTOMERS where custid = @custID);
while(@custId in (select custId from Customers)
begin
	IF(@city = 'Berlin')
		Begin
		set @charges = 2.5
		END
	Else IF(@city = 'Boston')
		Begin
		set @charges = 0.5
		END
	Else IF(@city = 'Chicago')
		Begin
		set @charges = 1.0
		END
	Else IF(@city = 'Melbourne')
		Begin
		set @charges = 3.5
		END
end
		Select *, @charges Shipping_Charges From CUSTOMERS where custid = @custID
end

--j
go
create trigger beforeInsertPrice
on Products
instead of insert
as
begin
declare @price float
select @price=prodprice from inserted

if(@price<0)
	begin
	RAISERROR('Price cannot be negative',16,1)
	ROLLBACK
	end
end
go

insert into Products (prodprice) values (-2)

--k
create Table Orders_log(
action varchar(50),
username varchar(50),
dateandtime datetime,
productId varchar(50)
)
go
create trigger Orders_trig
on Orders
for update
as
begin
	declare @productId int;
	declare @username varchar(100);
	declare @dateandtime datetime;
	declare @action varchar(100);
	declare @newid varchar(50)='1';

	select @productId=prodid from inserted;
	select @username = SYSTEM_USER
	select @dateandtime = GETDATE()
	

	if(update(ordid) or update(custid) or update(prodid) or update(ordstatus))
		begin
		set @action = 'UPDATE';
		set @productId=@productId+@newid
		end
	
	insert into Orders_LOG values (@action, @username, @dateandtime, @productId)
	Print 'After Insert Trigger fired'
end
go

update Orders set ordStatus=1 where ordid=1