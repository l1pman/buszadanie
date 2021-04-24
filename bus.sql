USE Bus;
go

IF OBJECT_ID('Bus.TradeTrip', 'U') is not null 
drop table TradeTrip;

IF OBJECT_ID('Bus.Route', 'U') is not null 
drop table Route;

IF OBJECT_ID('Bus.Trip', 'U') is not null 
drop table Trip;

IF OBJECT_ID('Bus.Bus', 'U') is not null 
Drop table Bus;

IF OBJECT_ID('Bus.TicketOffice', 'U') is not null 
drop table TicketOffice;

IF OBJECT_ID('Bus.People', 'U') is not null 
drop table People;

IF OBJECT_ID('Bus.Driver', 'U') is not null 
drop table Driver;

IF OBJECT_ID('Bus.City', 'U') is not null 
drop table City;


USE Master;
GO


IF DB_ID('Bus') is not null 
begin
drop database Bus;
end 


IF DB_ID('Bus') is null 
CREATE DATABASE Bus;


GO
USE Bus;

create table City(
	ID_City int not null primary key (ID_City),
	NameCity varchar(50) not null
)
go
create table Driver(
	ID_Driver int not null primary key(ID_Driver),
	NameDriver varchar(40) not null,
	ID_CityDriver int not null
	constraint foreign_City3 Foreign key (ID_CityDriver) references City (ID_City)
	)
go
create table People(
	ID_People int not null primary key(ID_People),
	NamePeople varchar(40) not null,
	SurnamePeople varchar(40) not null
	)
go
create table TicketOffice (
	ID_TicketOffice int Not Null primary key(ID_TicketOffice),
	City int Not null,
	Adres varchar(50) not null,
	constraint foreign_City Foreign key(City) references City (ID_City)
	)
go
create table Bus(
	ID_Bus int not null primary key(ID_Bus),
	NameBus varchar(50) not null,
	Seats int not null,
	)
go 

create table Route(
	ID_Route int not null Primary key(ID_Route),
	StartCity int Not NUll,
	FinalyCity int Not NUll,
	StartTime time not null,
	FinalyTime time not null,
	Napravlenie varchar(50) not null,
	PriceRoute int not null,
	constraint foreign_City6 Foreign key(StartCity) references City (ID_City),
	constraint foreign_City2 Foreign key(FinalyCity) references City (ID_City),
	
)
go
create table Trip(
	ID_Trip int Not null primary key (ID_Trip),
	DataTrip date Not Null,
	ID_AutoBus int Not null,
	ID_Route int not null,
	ID_Driver int not null,
	constraint foreign_Bus Foreign key(ID_AutoBus) references Bus(ID_Bus),
	constraint foreign_Route Foreign key(ID_Route) references Route(ID_route)
)
go 
create table TradeTrip(
	ID_TradeTrip int not null primary key(ID_TradeTrip),
	ID_TicketOffice int not null,
	ID_Trip int not null,
	ID_People int not null,
	DateTrade date not null,
	Seat int not null,
	constraint foreign_TicketOffice Foreign key(ID_TicketOffice) references TicketOffice(ID_TicketOffice),
	constraint foreign_People Foreign key(ID_People) references People(ID_People),
	constraint foreign_Trip Foreign key (ID_Trip) references Trip(ID_Trip)
)
go

insert into People values(1,'Alexander','Loshchinin')
insert into People values(2,'Nikolay','Evdokimov')
insert into People values(3,'Ivan','Ivanov')
insert into People values(4,'Nikolay','Lipman')
insert into People values(5,'Alina','Melnikova')
insert into People values(6,'Snezhana','Baranova')
insert into People values(7,'Roman','Truhachev')
insert into People values(8,'Nikita','Kucenko')
insert into People values(9,'Vlad','Troshin')
insert into People values(10,'Petr','Petrov')

insert into City values(1,'Krasnoyarsk')
insert into City values(2,'Achinsk')
insert into City values(3,'Kansk')
insert into City values(4,'Novosibirsk')
insert into City values(5,'Tomsk')

insert into Driver values (1,'Albert',1)
insert into Driver values (2,'Boris',2)
insert into Driver values (3,'Danil',3)
insert into Driver values (4,'Evgeniy',4)
insert into Driver values (5,'Fedor',5)

insert into Bus values(1,'PAZ',3)
insert into Bus values(2,'IKARUS',33)
insert into Bus values(3,'DAEWOO',32)
insert into Bus values(4,'TOYOTA',2)

insert into TicketOffice values (1,1,'1-Pobeda St.')
insert into TicketOffice values (2,5,'1-Svoboda St.')
insert into TicketOffice values (3,2,'1-Lomonosova St.')
insert into TicketOffice values (4,4,'5-Lomonosova St.')
insert into TicketOffice values (5,2,'1-Mira St.')
insert into TicketOffice values (6,1,'1-Lenina St.')
insert into TicketOffice values (7,5,'1-Kirenskogo St.')

insert into Route values(1,1,4,'08:30','9:30','Go',500)
insert into Route values(2,4,5,'08:00','9:30','Go',500)
-- insert into Route values(3,5,1,'06:30','9:30','Go',500)
insert into Route values(4,2,4,'09:30','11:30','Go',1500)
insert into Route values(5,4,3,'09:00','12:30','Go',300)
insert into Route values(6,3,5,'11:40','15:30','Return',400)
insert into Route values(7,1,3,'11:30','14:30','Return',1000)
insert into Route values(8,3,4,'07:50','11:00','Go',350)

insert into Trip values (1,'2014-10-12',1,1,1)
insert into Trip values (2,'2014-10-15',4,2,4)
--insert into Trip values (3,'2014-10-17',2,3,5)
insert into Trip values (4,'2014-10-12',2,4,2)
insert into Trip values (5,'2014-10-17',4,5,4)
insert into Trip values (6,'2014-10-21',3,6,3)
insert into Trip values (7,'2014-10-12',1,7,1)
insert into Trip values (8,'2014-10-18',3,8,3)

insert into TradeTrip values(1,1,2,3,'2015-01-17',10)
insert into TradeTrip values(2,4,1,1,'2015-01-17',10)
--insert into TradeTrip values(3,6,3,4,'2015-01-17',10)
insert into TradeTrip values(4,4,7,2,'2015-01-17',10)
insert into TradeTrip values(5,5,4,5,'2015-01-18',10)
insert into TradeTrip values(6,7,2,8,'2015-01-18',10)
insert into TradeTrip values(7,2,4,5,'2015-01-18',10)
insert into TradeTrip values(8,4,6,9,'2015-01-18',10)
insert into TradeTrip values(9,5,6,10,'2015-01-17',10)

go

