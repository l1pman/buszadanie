Use Bus;
go
-- 01 -- __________________________________________________________________________________________________________
 select Route.StartTime, Route.PriceRoute from Route
 where Route.StartCity=4 and Route.FinalyCity=5
 go
 --   -- __________________________________________________________________________________________________________

-- 02 -- __________________________________________________________________________________________________________
 select sum(Route.PriceRoute) as Summa from Route join Trip
 on Route.ID_Route = Trip.ID_Route join TradeTrip
 on Trip.ID_Trip = TradeTrip.ID_Trip 
 where TradeTrip.ID_TicketOffice = 4 
--   -- ___________________________________________________________________________________________________________

-- 03 -- __________________________________________________________________________________________________________
 select sum(Route.PriceRoute) as Summa from Route join Trip
 on Route.ID_Route = Trip.ID_Route join TradeTrip
 on Trip.ID_Trip = TradeTrip.ID_Trip join TicketOffice
 on TradeTrip.ID_TicketOffice = TicketOffice.ID_TicketOffice join City
 on TicketOffice.City = City.ID_City
 where City.NameCity = 'Tomsk'
 --   -- __________________________________________________________________________________________________________

-- 04 -- __________________________________________________________________________________________________________
select COUNT(Trip.ID_Trip) as REISI_ZA_GOD_VOD from Trip join Driver
on Trip.ID_Driver = Driver.ID_Driver
where Driver.ID_Driver = 2 and Trip.DataTrip between '2014-01-01' and '2015-01-01' 
--   -- ___________________________________________________________________________________________________________

-- 05 -- __________________________________________________________________________________________________________
--insert into Trip values (9,'2014-10-19',3,4,2)
--   -- ___________________________________________________________________________________________________________

-- 06 -- __________________________________________________________________________________________________________
--insert into TradeTrip values(10,2,2,4,'2015-01-17',9)
--   -- ___________________________________________________________________________________________________________

-- 07 -- __________________________________________________________________________________________________________
select count(Trip.ID_Trip) as SUMMA_AVTOBUSOV from Trip 
where Trip.ID_AutoBus in(select Bus.ID_Bus from Bus
						where Bus.NameBus='IKARUS' or Bus.NameBus='PAZ' )
--   -- ___________________________________________________________________________________________________________

-- 08 -- __________________________________________________________________________________________________________
exec BusSeatsss 1
--IF OBJECT_ID('BusSeatsss', 'P') IS NOT NULL  
--    DROP PROCEDURE BusSeatsss;  
--GO
--Create procedure BusSeatsss
--@reis as int as 
--begin
--declare @a int = 0;
--select @a = @a + (select Bus.Seats from Bus join Trip on Bus.ID_Bus = Trip.ID_AutoBus where Trip.ID_Trip = @reis)

--select KOLVO_MEST = @a - count(TradeTrip.ID_TradeTrip) from TradeTrip where TradeTrip.ID_Trip = @reis
--end
--   -- ___________________________________________________________________________________________________________

-- 09 -- __________________________________________________________________________________________________________
select TradeTrip.ID_TicketOffice, count(TradeTrip.ID_TicketOffice) as KOLVO_PROD_BILET from TradeTrip
group by TradeTrip.ID_TicketOffice
--   -- ___________________________________________________________________________________________________________

-- 10 -- __________________________________________________________________________________________________________
select avg(Route.PriceRoute) as SR_PRICE_BIL from Route
--   -- ___________________________________________________________________________________________________________

-- 11 -- __________________________________________________________________________________________________________
select Route.ID_Route, Route.PriceRoute from Route 
where (Route.PriceRoute>(select avg(Route.PriceRoute) from route))
group by Route.ID_Route, Route.PriceRoute
--   -- ___________________________________________________________________________________________________________

-- 12 -- __________________________________________________________________________________________________________
-- delete from TradeTrip  where TradeTrip.ID_People=3 
--   -- ___________________________________________________________________________________________________________

-- 13 -- __________________________________________________________________________________________________________
select City.NameCity,FinalyCity,PriceRoute,StartTime,FinalyTime from Route inner join City
on Route.StartCity = City.ID_City
where City.NameCity = 'Tomsk'
--   -- ___________________________________________________________________________________________________________

-- 14 -- __________________________________________________________________________________________________________
select COUNT(TradeTrip.ID_Trip) as KOLVO_Tomsk_TO_Novosibirsk from TradeTrip
join Trip on TradeTrip.ID_Trip = Trip.ID_Trip
join Route on Trip.ID_Route = Route.ID_Route
where (TradeTrip.DateTrade between '2014-01-01' and '2015-12-31') and Route.StartCity = 5 and Route.FinalyCity = 4
--   -- ___________________________________________________________________________________________________________

-- 15 -- __________________________________________________________________________________________________________
--insert into Trip values (11,2015-01-07,5,9,5)
--   -- ___________________________________________________________________________________________________________

-- 16 -- __________________________________________________________________________________________________________
select * from Trip join Bus
on Trip.ID_AutoBus = Bus.ID_Bus
Where Seats > 30 and ID_Driver = 3
--   -- ___________________________________________________________________________________________________________

-- 17 -- __________________________________________________________________________________________________________
--update Bus 
--set Bus.Seats+=3 where Bus.ID_Bus = 3
--   -- ___________________________________________________________________________________________________________
go