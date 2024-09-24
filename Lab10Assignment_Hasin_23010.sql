select * from Employee

create clustered index indexSalary on Employee (Salary asc) 

create proc highestPaid
as
begin
	select Name, Designation, Salary from Employee where salary in (select max(salary) from Employee)
end

highestPaid

create proc lessThanBound
@salaryBound int
as
begin
	select * from Employee where Salary<@salaryBound
end

lessThanBound '15000'

create proc maxFromAvgDept
as
begin
	select max(avgSalaryDept) as MaxAvgSalaryByDept from (select avg(cast(Salary as float)) as avgSalaryDept from Employee group by Dept_ID) temp
end

maxFromAvgDept
