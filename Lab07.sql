create table suppliers(
	SupplierID numeric,
	SupplierName varchar(255),
	ContactName varchar(255),
	Address varchar(255),
	City varchar(255),
	PostalCode varchar(255),
	Country varchar(255),
	Phone numeric,
	constraint pk_SupplierID primary key (SupplierID)
);

create table categories(
	CategoryID numeric,
	CategoryName varchar(255),
	Description text,
	constraint pk_CategoryID primary key (categoryID)
);

create table products(
	ProductID numeric,
	ProductName varchar(255),
	SupplierID numeric,
	CategoryID numeric,
	Unit numeric,
	Price float,
	constraint pk_ProductID primary key (ProductID),
	constraint fk_SupplierID foreign key (SupplierID) references suppliers (SupplierID),
	constraint fk_CategoryID foreign key (CategoryID) references categories (CategoryID)
);

create table employees(
	EmployeeID numeric,
	FirstName varchar(255),
	LastName varchar(255),
	BirthDate datetime,
	Salary numeric
	constraint pk_EmployeeID primary key (EmployeeID)
);

create table customers(
	CustomerID numeric,
	CustomerName varchar(255),
	ContactName varchar(255),
	Address varchar(255),
	City varchar(255),
	PostalCode varchar(255),
	Country varchar(255),
	constraint pk_CustomerID primary key (CustomerID)
);

create table shippers(
	ShipperID numeric,
	ShipperName varchar(255),
	Phone numeric
	constraint pk_ShipperID primary key (ShipperID)
);

create table orders(
	OrderID numeric,
	CustomerID numeric,
	EmployeeID numeric,
	OrderDate datetime,
	ShipperID numeric
	constraint pk_OrderID primary key (OrderID),
	constraint fk_CustomerID foreign key (CustomerID) references customers (CustomerID),
	constraint fk_EmployeeID foreign key (EmployeeID) references employees (EmployeeID),
	constraint fk_ShipperID foreign key (ShipperID) references shippers (ShipperID)
);

create table orderdetails(
	OrderDetailID numeric,
	OrderID numeric,
	ProductID numeric,
	Quantity numeric
	constraint pk_OrderDetailID primary key (OrderDetailID),
	constraint fk_OrderID foreign key (OrderID) references orders (OrderID),
	constraint fk_ProductID foreign key (ProductID) references products (ProductID)
);

insert into suppliers values (001, 'Tom', 'Harry', '63-B, Street-1', 'London', '52531', 'UK', 335627891)
insert into suppliers values (002, 'John', 'Sparrow', '6-A, Street-1', 'London', '56531', 'UK', 856149237)
insert into suppliers values (003, 'Mary', 'Ronald', '63-B, Street-20', 'London', '82531', 'UK', 456123489)
insert into suppliers values (004, 'Wick', 'Maguire', '63-C, Street-4', 'London', '92531', 'UK', 245634517)
insert into suppliers values (005, 'Hardy', 'Hiddleston', '2-B, Street-5', 'London', '50231', 'UK', 256314957)

insert into categories values (001, 'Sports','Shoes,Equipments,Footballs etc')
insert into categories values (002, 'Stationary','Pencils,Books etc')
insert into categories values (003, 'Clothes','Jackets,Trousers etc')

insert into products values (001, 'Brazuca Football', 005, 001, 20, 20.5)
insert into products values (002, 'Predators Shoes', 003, 001, 10, 10.5)
insert into products values (003, 'Stadtler Pencil', 002, 002, 15, 5.75)
insert into products values (004, 'Dollar Pen', 001, 002, 25, 7.99)
insert into products values (005, 'Leather Jacket', 004, 003, 30, 20.99)
insert into products values (006, 'Black Trousers', 002, 003, 10, 10.0)

insert into customers values (001, 'Alex', 'Farhan', 'A-6, Street-4', 'London', '52541', 'UK')
insert into customers values (002, 'Isabelle', 'Aby', 'B-63, Street-4', 'London', '62541', 'UK')
insert into customers values (003, 'Ema', 'Ron', 'A-23, Street-10', 'London', '53541', 'UK')
insert into customers values (004, 'Hassan', 'Rahul', 'C-6, Street-7', 'London', '86541', 'UK')
insert into customers values (005, 'Ali', 'Fawad', 'D-8, Street-8', 'London', '39541', 'UK')

insert into shippers values (001, 'Kamran', 099942331)
insert into shippers values (002, 'Ben', 567942331)

insert into employees values (001, 'Ron', 'Weasley', '20 August, 1995', 2000)
insert into employees values (002, 'Tom', 'Riddle', '07 August, 1997', 3000)
insert into employees values (003, 'Alex', 'Ferguson', '25 July, 1993', 2500)

insert into orders values (001, 005, 003, '25 July, 2008', 001)
insert into orders values (002, 002, 002, '3 July, 2008', 002)
insert into orders values (003, 004, 001, '2 August, 2008', 001)
insert into orders values (004, 001, 001, '1 July, 2008', 002)
insert into orders values (005, 003, 003, '5 July, 2008', 001)
insert into orders values (006, 005, 001, '6 March, 2008', 001)
insert into orders values (007, 003, 003, '3 June, 2008', 002)
insert into orders values (008, 001, 002, '8 July, 2008', 002)
insert into orders values (009, 004, 002, '9 June, 2008', 001)
insert into orders values (010, 001, 001, '10 July, 2008', 002)

insert into orderdetails values (001, 007, 006, 1)
insert into orderdetails values (002, 003, 001, 2)
insert into orderdetails values (003, 002, 004, 4)

select * from suppliers order by SupplierID asc
select * from employees where DATEDIFF(year,BirthDate, GETDATE())>30
select * from customers where CustomerName like '%an%'
select * from products order by Price asc
select count(ProductID) as Count from products
select min(Price) as Minimum , max(Price) as Maximum, avg(Price) as Average from products
select * from products as p join categories as c on p.CategoryID=c.CategoryID where p.Unit<2
select * from customers as c join orders as o on c.CustomerID=o.CustomerID order by o.OrderDate asc
select * from customers as c left join orders as o on c.CustomerID=o.CustomerID
select count(*) as NoOfOrdersDelivered, s.ShipperName from shippers as s join orders as o on s.ShipperID=o.ShipperID group by s.ShipperName





