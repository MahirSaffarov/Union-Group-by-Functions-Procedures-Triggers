


create Database Course
use Course

create Table Student(
Id int primary key identity,
Name nvarchar(50),
Surname nvarchar(50),
Age int,
Email nvarchar(100),
Address nvarchar(100)
)

insert into Student(Name,Surname,Age,Email,Address)
values
('Mahir','Safarov',21,'mahir@gmail.com','Sahil'),
('Musa','Afandiyev',19,'musa@gmail.com','Ehmedli'),
('Murad','Ceferov',20,'murad@gmail.com','Ehmedli'),
('Fatime','Bayramova',20,'fatime@gmail.com','Genclik'),
('Anar','Salmanov',36,'anar@gmail.com','Sumqayit'),
('Ramil','Allahverdiyev',26,'ramil@gmail.com','Xirdalan'),
('Nicat','Ferecov',20,'nicat@gmail.com','Neftciler'),
('Resul','Quliyev',15,'resul@gmail.com','Nerimanov'),
('Gultac','Ceferov',20,'gultac@gmail.com','Yasamal'),
('Novreste','Aslanzade',20,'novreste@gmail.com','28 may')

create table StudentArchive(
Id int primary key identity,
StudentId int,
Operation nvarchar(10),
[Date] date,
)

create trigger trg_DeleteStudent on Student
for delete
as
Begin
	insert into StudentArchive(StudentId,Operation,[Date])
	select Id, 'Delete',GetDate() from deleted
End

create procedure usp_DeleteStudent
@Id int
as
delete from Student where Id = @Id

exec usp_DeleteStudent 6
