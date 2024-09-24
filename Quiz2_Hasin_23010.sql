create table Product(
prodID varchar(50) primary key,
prodName varchar(100),
prodCategory varchar(100),
prodPrice float
);

insert into Product values ('BT044','Baby Sleeping Bag','Babies & Toys',750.00),('BT064','Baby Winter Suit','Babies & Toys',528.78),
('BT500','Baby Skincare Soft Wipes','Babies & Toys',390.54),('BT527','Baby Bath Blue','Babies & Toys',260.08),
('EF264','Royal Fitness Jogging Machine','Exercise & Fitness',50700.00),('HB122','Clean & Clear Face Wash','Health & Beauty',174.66),
('HB581','Nova Hair Straightner','Health & Beauty',2040.75),('HL278','Silk Curtain','Home & Lifestyle',1990.20),
('HL296','Printed Silk Cushion Cover','Home & Lifestyle',120.00),('HL878','Ethnic Cushion Cover','Home & Lifestyle',230.97)

create table Orderss(
	custNumber int,
	prodNumber varchar(50),
	ordStatus int
);


insert into Orderss values (2,'HL278',1),(2,'HL296',1),(4,'HB581',1),(5,'HL878',1),(6,'HL278',1),(6,'HL296',1),(6,'HL878',1),(7,'BT500',1),
(7,'BT527',1),(7,'HB122',1),(8,'BT044',1),(10,'BT044',1),(10,'BT062',1),(10,'BT500',1),(11,'HB581',1),(12,'BT044',1),(12,'BT062',1)

select * from Product
select * from Orderss

go
create proc orderStatus(@custNumber int)
as
begin
declare @ordStatus int;
select @ordStatus=ordStatus from Orderss where custNumber=@custNumber
if(@ordStatus=1)
	print 'Order placed by customer'
else
	print 'Order not placed by customer'
end
go

orderStatus 2

create trigger priceConditions on Product
instead of insert
as
	declare @price float;
	select @price=prodPrice from inserted;
begin
	if(@price<=0)
	begin
		RAISERROR('Price cannot be negative or 0',16,1)
		ROLLBACK
	end
	else
		print 'Price is valid'
end
