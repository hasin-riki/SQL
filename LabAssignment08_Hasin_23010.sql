create table department(
Dept_ID int primary key,
Dept_Name varchar(50)
);

insert into department values (10, 'HR'), (20, 'ACCOUNTING'), (30, 'MARKETING');

select * from department;

create table Employee(
ID int primary key identity,
Name varchar(50),
Designation varchar(50),
Salary varchar(50),
Grade varchar(50),
Experience int,
Dept_ID int foreign key references department(Dept_ID)
);

insert into Employee values ('Hassan', 'manager', '12000', 'A', 1, 10),
('Hina', 'Assistant manager', '17000', 'B', 2, 20),
('Hafsa', 'Engineer', '16600', 'B', 3, 30),
('Hassan', 'Assistant Manager', '12600', 'C', 4, 20),
('Ali', 'manager', '15840', 'A', 5, 10),
('Arsalan', 'Professor', '12700', 'A+', 6, 30),
('Asad', 'Scientist', '28700', 'A+', 7, 20),
('Usaid', 'Professor', '29700', 'C+', 8, 10),
('Owais', 'Professor', '18700', 'B+', 9, 30);

select * from Employee;

select Name, Designation, Salary from Employee where Salary = (select max(Salary) from Employee)

select Name, Experience from Employee where Experience = (select max(Experience) from Employee)

select Name, Salary from Employee where cast(Salary as int) > (select avg(cast(Salary as int)) from Employee);

select * from Employee where cast(Salary as int) in (select max(cast(Salary as int)) from Employee group by Dept_ID);



