go
create procedure result 
@threshold float
as
begin
declare @stuID int=1;
declare @gpa float;
declare @name varchar(100);
	while(@stuID in(select stuID from student))
	begin
		select @gpa=gpa from student where stuID=@stuID;
		select @name=stuName from student where stuID=@stuID;
		if(@gpa>=@threshold)
			print @name + ': passed';
		else
			print @name + ': failed';
		set @stuID=@stuID+1;
	end
end
go

select * from student
result 2.5

go
create proc bonus
as
begin
declare @EmpId int=1;
declare @name varchar(100);
declare @salary float;
declare @maxSalary float;
declare @bonus int;
select @maxSalary=max(cast(Salary as float)) from Employeee
print 'Max Salary: ' + cast(@maxSalary as varchar(100))
while(@EmpId in (select EmpId from Employeee))
begin
	select @salary=Salary from Employeee where EmpId=@EmpId
	select @name=EmpName from Employeee where EmpId=@EmpId
	if(@salary>(0.75*@maxSalary))
		set @bonus=0;
	else
		begin
			if(@salary>(0.5*@maxSalary) and @salary<=(0.75*@maxSalary))
				set @bonus=5;
			else
				begin
				if(@salary>(0.25*@maxSalary) and @salary<=(0.5*@maxSalary))
					set @bonus=10;
				else
					set @bonus=15;
				end
		end
	print @name + ': Salary: ' + cast(@salary as varchar(100)) + ' Bonus: ' + cast(@bonus as varchar(100)) + '%'
	set @EmpId=@EmpId+1;
end
end
go

drop proc bonus

select * from Employeee
bonus




