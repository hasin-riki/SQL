create table department_log(
	username varchar(100),
	curr_DateTime datetime,
	deptName varchar(100)
);

go
create trigger deptAfterInsert
on department
for insert
as
begin
	declare @dept_name varchar(100);
	select @dept_name = Dept_Name from inserted;

	insert into department_log values (USER_NAME(),getdate(),@dept_name);

	print 'After Insert Trigger Fired'
end
go

insert into department values (40, 'Tech')
select * from department
select * from department_log

create table Employee_Test(
Emp_ID int identity,
Emp_name varchar(100),
Emp_Sal Decimal(10,3),
Designation varchar(100)
);

insert into Employee_Test values ('Anees',1000,'Manager'),('Rick',1200,'CEO'),('John',1100,'CTO'),('Stephen',1300,'CFO'),('Maria',1400,'CTO')

create table Employee_Test_Audit(
Emp_ID int identity,
Emp_name varchar(100),
Emp_Sal Decimal(10,3),
Designation varchar(100),
Audit_Action varchar(100),
Audit_Timestamp datetime
);

set identity_insert Employee_Test_Audit on;

create trigger employeeAfterDelete
on Employee_Test
for delete
as
begin
	declare @Emp_ID int;
	declare @Emp_name varchar(100);
	declare @Emp_Sal decimal(10,3);
	declare @Audit_Action varchar(100) = 'Record Deleted -- After Delete Trigger';

	select @Emp_ID = Emp_ID from deleted;
	select @Emp_name = Emp_name from deleted;
	select @Emp_Sal = Emp_Sal from deleted;

	insert into Employee_Test_Audit (Emp_ID,Emp_name,Emp_Sal,Audit_Action,Audit_Timestamp) values (@Emp_ID,@Emp_name,@Emp_Sal,@Audit_Action,getdate());

	print 'After Delete Trigger Fired'
end

delete from Employee_Test where Emp_ID=4

select * from Employee_Test
select * from Employee_Test_Audit

go
create proc salaryByDesignation
@designation varchar(100)
as
begin
	if (@designation in (select Designation from Employee_Test))
	begin
		select Emp_Sal from Employee_Test where Designation=@designation
	end
	else
	begin
		RAISERROR('No such Employee with such designation',16,1);
	end
end
go

salaryByDesignation 'CEO'
salaryByDesignation 'CFO'


