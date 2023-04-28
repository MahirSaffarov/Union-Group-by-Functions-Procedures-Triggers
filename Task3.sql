create Database CodeAcademy
use CodeAcademy

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

create table StaffMembers(
	Id int primary key identity,
	Fullname nvarchar(100),
	Email nvarchar(100) unique,
	[Address] nvarchar(100),
	CityId int foreign key references Cities(Id)
)

insert into StaffMembers(Fullname,Email,[Address],CityId)
values
('James Smith','james@gmail.com','MEDITATION LANE, ATKINSON, NH',5),
('Michael Smith','michael@gmail.com','SILVER CANOE WAY, WYLIE, TX',1),
('Robert Smith','robert@gmail.com','GENTLE RAIN DRIVE, MARANA, AZ',2),
('Maria Garcia','maria@gmail.com','LOCH NESS ROAD, TOWSON, MD',3),
('David Smith','david@gmail.com','GRANDIOSE DRIVE, INDIANAPOLIS, IN',4),
('Maria Rodriguez','rodriguez@gmail.com','MELODY DRIVE, METAIRIE, LA',7),
('Maria Hernandez','hernandez@gmail.com','MISTLETOE LANE, REDDING, CA',6),
('Robert Garcia','garcia@gmail.com','REDDING, CA',5)

create table Roles(
Id int primary key identity,
[Name] nvarchar(30)
)

insert into Roles
values
('Super Admin'),
('Admin'),
('Member')

create table MembersRoles(
Id int primary key identity,
StaffMemberId int foreign key references StaffMembers(Id),
RoleId int foreign key references Roles(Id)
)

insert into MembersRoles(StaffMemberId,RoleId)
values
(1,1),
(2,2),
(3,3),
(4,3),
(5,3),
(6,2),
(7,3),
(8,3)

create table Students(
	Id int primary key identity,
	Fullname nvarchar(100),
	Age int,
	Email nvarchar(100) unique,
	[Address] nvarchar(100),
	Phone nvarchar(50),
	CityId int foreign key references Cities(Id)
)

insert into Students(Fullname,Age,Email,[Address],Phone,CityId)
values
('Mahir Safarov',21,'mahir@gmail.com','Sahil','2352325235',1),
('Musa Afandiyev',19,'musa@gmail.com','Ehmedli','2352325235',2),
('Murad Ceferov',20,'murad@gmail.com','Ehmedli','2352325235',2),
('Fatime Bayramova',20,'fatime@gmail.com','Genclik','2352325235',4),
('Anar Salmanov',36,'anar@gmail.com','Sumqayit','2352325235',5),
('Ramil Allahverdiyev',26,'ramil@gmail.com','Xirdalan','2352325235',6),
('Nicat Ferecov',20,'nicat@gmail.com','Neftciler','2352325235',4),
('Resul Quliyev',15,'resul@gmail.com','Nerimanov','2352325235',7),
('Gultac Ceferov',20,'gultac@gmail.com','Yasamal','2352325235',3),
('Novreste Aslanzade',20,'novreste@gmail.com','28 may','2352325235',1)

create Table Teachers(
	Id int primary key identity,
	[Name] nvarchar(30),
	[Surname] nvarchar(30),
	Age int,
	Email nvarchar(100) unique,
	Salary decimal,
	CityId int foreign key references Cities(Id)
)
insert into Teachers([Name],Surname,Age,Email,Salary,CityId)
values
('Cavid','Bashirov',28,'bashirov@gmail.com',3000,1),
('Nigar','Muharrem',32,'nigar@gmail.com',2500,1),
('Rasim','İsmayilov',22,'rasim@gmail.com',1000,7),
('Aysel','Guliyeva',34,'aysel@gmail.com',1400,6),
('Farid','Mustafayev',18,'farid@gmail.com',3300,3)


create table Rooms(
	Id int primary key identity,
	[Name] nvarchar(30),
	Capacity int,
)
insert into Rooms([Name],Capacity)
values
('Neptun',20),
('Venus',40),
('Uranus',30),
('Jupiter',15),
('Saturn',18),
('Pluton',33),
('Mercury',15),
('Mars',45),
('Sun',24),
('Moon',22)

create table Educations(
	Id int primary key identity,
	[Name] nvarchar(30)
)
insert into Educations(Name)
values
('Design'),
('Programming'),
('Cybersecurity'),
('UX UI'),
('Digital Marketing	')

create table Groups(
	Id int primary key identity,
	[Name] nvarchar(30),
	Capacity int,
	RoomId int foreign key references Rooms(Id),
	EducationId int foreign key references Educations(Id)
)

insert into Groups([Name],Capacity,RoomId,EducationId)
values
('P414',18,1,2),
('D314',15,2,1),
('C014',13,5,2),
('E914',15,9,3),
('B814',16,7,4),
('P614',17,8,3),
('A114',11,6,2),
('U214',19,4,1),
('P514',20,3,4),
('E214',15,10,3)

create table StudentsGroups(
	Id int primary key identity,
	StudentId int foreign key references Students(Id),
	GroupId int foreign key references Groups(Id)
)
insert into StudentsGroups(StudentId,GroupId)
values
(10,1),
(11,2),
(12,4),
(14,3),
(15,5),
(16,6),
(17,7),
(18,9),
(19,8),
(13,10)

create table TeachersGroups(
	Id int primary key identity,
	TeacherId int foreign key references Teachers(Id),
	GroupId int foreign key references Groups(Id)
)
insert into TeachersGroups(TeacherId,GroupId)
values
(1,1),
(1,2),
(2,4),
(4,3),
(5,5),
(1,6),
(2,7),
(1,9),
(3,8),
(4,10)

create table Seanses
(
	Id int primary key identity,
	[Name] nvarchar(30)
)

insert into Seanses([Name])
values
('10:00 - 15:00'),
('15:00 - 20:00'),
('10:00 - 14:00'),
('14:00 - 18:00'),
('18:00 - 20:00')


create table WeekDays
(
	Id int primary key identity,
	[Day] nvarchar(30)
)

insert into WeekDays([Day])
values
('Monday'),
('Tuesday'),
('Wednesday'),
('Thursday'),
('Friday'),
('Saturday'),
('Sunday')

create table WeekDaysSeanses(
	Id int primary key identity,
	WeekDayId int foreign key references WeekDays(Id),
	SeansId int foreign key references Seanses(Id)
)
insert into WeekDaysSeanses(WeekDayId,SeansId)
values
(1,2),
(1,3),
(1,4),
(2,2),
(2,3),
(2,4),
(3,2),
(3,3),
(3,4),
(4,2),
(4,3),
(4,4),
(5,2),
(5,3),
(5,4),
(6,1),
(6,2),
(7,1),
(7,2)

create table GroupsWeekDaysSeanses(
	Id int primary key identity,
	GroupId int foreign key references Groups(Id),
	WeekDaySeansId int foreign key references WeekDaysSeanses(Id)
)
insert into GroupsWeekDaysSeanses(GroupId,WeekDaySeansId)
values
(1,1),
(1,2),
(2,3),
(2,4),
(3,15),
(3,6),
(4,8),
(4,9),
(5,12),
(5,13),
(6,17),
(6,11),
(7,9),
(7,7),
(8,5),
(8,16),
(9,14),
(9,10),
(10,19),
(10,18)