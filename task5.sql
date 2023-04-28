create Database Corporation
use Corporation

create table Countries(
Id int primary key identity,
[Name] nvarchar(50)
)

insert into Countries(Name)
values
('Azerbaijan'),
('Turkey'),
('Russia'),
('Iran'),
('America'),
('England'),
('Germany')

create table Cities(
Id int primary key identity,
[Name] nvarchar(50),
CountryId int foreign key references Countries(Id)
)

insert into Cities([Name],CountryId)
values
('Baku',1),
('Ankara',2),
('Moscow',3),
('Tehran',4),
('Washington',5),
('London',6),
('Berlin',7)

create table Employees(
	Id int primary key identity,
	[Name] nvarchar(50),
	[Surname] nvarchar(50),
	Age int,
	Salary decimal,
	Position nvarchar(50),
	IsDeleted bit default 0,
	CityId int foreign key references Cities(Id)
)

INSERT INTO Employees([Name], [Surname], Age, Salary, Position, IsDeleted, CityId)
VALUES 
('Nigar', 'Mammadova', 25, 5000.00, 'Developer', 0, 1),
('Tural', 'Abbasov', 30, 6000.00, 'Manager', 1, 2),
('Rufat', 'Ibrahimli', 28, 5500.00, 'Developer', 0, 3),
('Lala', 'Mehdiyeva', 26, 5200.00, 'Designer', 1, 1),
('Seymur', 'Aliyev', 27, 5300.00, 'Developer', 0, 2),
('Aysel', 'Guliyeva', 32, 7000.00, 'Manager', 1, 3),
('Nail', 'Mammadov', 29, 5800.00, 'Developer', 0, 1),
('Aynur', 'Jafarova', 24, 4800.00, 'Designer', 1, 2),
('Elnur', 'Huseynov', 31, 6500.00, 'Manager', 0, 3),
('Fidan', 'Mustafayeva', 26, 5200.00, 'Developer', 1, 1)


-- *  Ishcilerin ozlerini, yashadiqi sheherlerini ve olkelerini gosterin.

SELECT Employees.Name, Employees.Surname, Employees.Age, Employees.Position, Employees.Salary, 
Cities.Name AS CityName, 
Countries.Name AS CountryName
FROM Employees 
INNER JOIN Cities ON Employees.CityId = Cities.Id
INNER JOIN Countries ON Cities.CountryId = Countries.Id

--     *  Maashi 2000-den yuxari olan ishcilerin adlari ve yashadiqi olkeleri gosterin.

SELECT Employees.Name,
Countries.Name as CountryName
from Employees
INNER JOIN Cities ON Employees.CityId = Cities.Id
INNER JOIN Countries ON Cities.CountryId = Countries.Id
where Salary > 2000

--     *  Hansi sheherin hansi olkeye aid olduqunu gosterin.

select Cities.Name as CityName,
Countries.Name As CountryName
from Cities
inner join Countries on Cities.CountryId = Countries.Id

--     *  Positioni "Reseption" olan ishcilerin table-larin id-leri daxil olmamaq sherti ile daxil olmamaq sherti ile butun melumatlarini                          gostermek.

SELECT Employees.Name, Employees.Surname, Employees.Age, Employees.Salary, Employees.Position,Employees.IsDeleted,
Cities.Name as CityName,
Countries.Name as CountryName
FROM Employees
inner join Cities on Employees.CityId = Cities.Id
inner join Countries on Cities.CountryId = Countries.Id
WHERE Position = 'Developer'

--     * Ishden cixan ishcilerin yashadiqi sheher ve olkeleri, hemcinin ishcilerin oz ad ve soyadlarini gosteren query yazin.

select Employees.Name, Employees.Surname,
Cities.Name as CityName,
Countries.Name as CountryName
from Employees
inner join Cities on Employees.CityId = Cities.Id
inner join Countries on Cities.CountryId = Countries.Id
where IsDeleted = 1