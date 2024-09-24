create table courses(
courseID int primary key,
courseName varchar(50)
);

create table departments(
deptID int primary key,
deptName varchar(50)
);

create table student(
stuID int primary key,
stuName varchar(50),
gpa float,
courseID int foreign key references courses(courseID),
deptID int foreign key references departments(deptID)
);

create table faculty(
facID int primary key,
facName varchar(50),
designation varchar(50),
deptID int foreign key references departments(deptID)
);

insert into student values (001, 'Ali', 3.4, 04, 03)
insert into student values (002, 'Imran', 3.3, 02, 01)
insert into student values (003, 'Sam', 3.22, 01, 01)
insert into student values (004, 'Tom', 3.82, 03, 02)
insert into student values (005, 'Hank', 2.9, 04, 01)
insert into student values (006, 'Heisenberg', 2.6, 02, 03)
insert into student values (007, 'Mark', 3.13, 02, 01)
insert into student values (008, 'Rick', 2.59, 01, 02)
insert into student values (009, 'Tom', 3.82, 02, 01, 'N')
insert into student values (010, 'Tom', 3.82, 01, 03, 'N')
insert into student values (011, 'Tom', 3.82, 04, 02, 'N')

insert into faculty values (001, 'Mr. John', 'Associate Professor', 01)
insert into faculty values (002, 'Mr. Wick', 'Assistant Professor', 03)
insert into faculty values (003, 'Mr. Henry', 'Associate Professor', 02)
insert into faculty values (004, 'Mr. Cavill', 'Assistant Professor', 01)

insert into departments values (01, 'Computer Science')
insert into departments values (02, 'Mathematics')
insert into departments values (03, 'Accounting and Finance')

insert into courses values (01, 'Intro to AI')
insert into courses values (02, 'Business Communication')
insert into courses values (03, 'Linear Algebra')
insert into courses values (04, 'Network Security')

alter table faculty add salary int
update faculty set salary=40000 where facID=1
update faculty set salary=55000 where facID=2
update faculty set salary=50000 where facID=3
update faculty set salary=45000 where facID=4

select (sum(salary)*100/(select sum(salary) from faculty)) as PercentageSalary from faculty group by deptID
select max(avgSalary) from (select avg(salary) as avgSalary from faculty group by deptID) temp

create table lowsalary(
facID int foreign key references faculty (facID),
facName varchar(50),
designation varchar(50),
deptID int foreign key references departments(deptID),
salary int
);

update faculty set salary=80000 where facID=4

insert into lowsalary select * from faculty f where f.salary<75000

select * from faculty
select * from lowsalary

select deptName from departments where deptID in (select deptID from faculty group by deptID having avg(salary) > (select avg(salary) from faculty))

select deptName from departments d join faculty f on d.deptID=f.deptID where f.salary in
(select max(avgSalary) from (select avg(salary) as avgSalary from faculty group by deptID having avg(salary) < (select avg(salary) from faculty)) temp)




