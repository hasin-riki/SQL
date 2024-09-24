create table Employeee(
EmpId int,
EmpName varchar(50),
Designation varchar(50),
Salary int,
City varchar(50),
HireDate date
constraint pk_EmpId primary key (EmpId)
);

insert into Employeee values (01, 'Ali', 'Manager', 20000, 'Karachi', '2009-09-4')  
insert into Employeee values (02, 'Inzemam', 'Assistant Teacher', 30000, 'Islamabad', '2004-09-2')  
insert into Employeee values (03, 'Abdullah', 'Head Teacher', 25000, 'Lahore', '2002-08-21')  
insert into Employeee values (04, 'Hina', 'Assistant Manager', 22000, 'Peshawar', '2010-09-24')  
insert into Employeee values (05, 'Hafsa', 'CFO', 50000, 'Lahore', '2011-08-24')  
insert into Employeee values (06, 'Tariq', 'CTO', 60000, 'Karachi', '2019-07-24')  
insert into Employeee values (07, 'Mehboob', 'CEO', 80000, 'Karachi', '2020-01-23')  
insert into Employeee values (08, 'Khan', 'CFO', 75000, 'Islamabad', '2021-02-24')  
insert into Employeee values (09, 'Elvis', 'Manager', 100000, 'Lahore', '2011-03-22')  
insert into Employeee values (10, 'Presley', 'CFO', 67000, 'Karachi', '2001-10-20')  

select * from Employeee

select * from Employeee where salary>10000

select EmpName, Designation, HireDate from Employeee where HireDate>='2010-01-01' and HireDate<'2019-01-01'

select min(salary) as LowestSalary, max(salary) as HighestSalary from Employeee

select * from Employeee where HireDate='2001-10-20'

select Salary from Employeee where HireDate>='2016-02-01' and HireDate<'2022-03-01'

select count(EmpId) as NoOfEmployeesByCity from Employeee group by City

update Employeee set Salary=Salary+(Salary*0.1) where HireDate>='2019-07-01' and HireDate<'2019-08-01' 

select distinct Designation from Employeee

alter table Employeee rename column EmpName to FirstName

select EmpName from Employeee where EmpName like '%a'

select sum(Salary) as totalSalary from Employeee

select * from Employeee where EmpId<6

alter table Employeee alter column Salary float 

select * from Employeee where HireDate like '%-01-%'
