select * from student

create nonclustered index indexGPA on student (gpa asc)
drop index student.indexGPA

create proc stuResult
@passMarks float
as
begin
	select count(stuID) as NoOfStudentsPassedByDept from student where gpa>@passMarks group by deptID
end

stuResult '2.5'

select * from faculty

create proc salaryRaise
@facID int,
@bonus float
as
begin
	select salary as OldSalary from faculty where facID=@facID
	update faculty set salary=salary+(salary*@bonus) where facID=@facID
	select salary as NewSalary from faculty where facID=@facID
end

salaryRaise '1','0.1'
