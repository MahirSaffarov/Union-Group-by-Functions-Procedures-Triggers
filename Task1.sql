select * from Teachers
union
select * from Users

select * from Teachers
union all
select * from Users

select * from Teachers
except
select * from Users

select * from Teachers
intersect
select * from Users

select GETDATE()

select * from Teachers
order by age asc

select * from Teachers
order by Name desc

select * from Teachers where Id >3
order by Age desc

select COUNT(*) as 'Count by age', Age from Teachers
group by Age
having Count(*) > 1
order by COUNT(*) desc


create view vw_TeachersByAge
as
select * from Teachers where Age > 30

select * from vw_TeachersByAge

create view vw_TeachersBySalaryMain
as
select top 100 percent
count(*) as 'Count', Salary, Age
from Teachers
group by Salary, Age

select * from vw_TeachersBySalaryMain order by Age 


create function dbo.GetTeachersCount()
returns int 
as
begin 
declare @age int
select @age = COUNT(*)from Teachers
return @age
end

select dbo.GetTeachersCount()

create function dbo.GetTeachersCountByAgeStatic()
returns int 
as
begin 
declare @age int
declare @mainAge int = 30
select @age = COUNT(*)from Teachers where Age > @mainAge
return @age
end

select dbo.GetTeachersCountByAgeStatic()

create function dbo.GetTeachersCountByAge(@age int)
returns int 
as
begin 
declare @count int
select @count = COUNT(*)from Teachers where Age > @age
return @count
end

select dbo.GetTeachersCountByAge(20)

create function dbo.getTeachersAverageAgeByCondition(@id int)
returns float 
as
begin
	declare @sum float = cast((select sum(Age) from Teachers where Id >@id)as float)
	declare @count float = cast((select count(Age) from Teachers where Id > @id)as float)
	return @sum/@count
end

select dbo.getTeachersAverageAgeByCondition(4)


create procedure usp_InsertTeacher
@name nvarchar(50),
@surname nvarchar(50),
@age int,
@email nvarchar(100),
@salary decimal
as
Begin
	insert into Teachers([Name],Surname,Age,Email,Salary)
	values(@name,@surname,@age,@email,@salary)
End

exec usp_InsertTeacher 'Musa','Aslanzade',25,'fjgfj@gmail.com',1500

create procedure usp_SumOfNums
@num1 int,
@num2 int
as
select @num1 + @num2

exec usp_SumOfNums 5,7


create trigger trg_InsertTeacher on Teachers
for insert
as
begin
	insert into TeacherLogs([TeacherId],[Operation],[Date])
	select Id, 'Insert',GetDate() from inserted
end

create trigger trg_DeleteTeacher on Teachers
after delete
as
begin
	insert into TeacherLogs([TeacherId],[Operation],[Date])
	select Id, 'Delete',GetDate() from deleted
end

delete from Teachers where Id = 16