drop table if exists users;
drop table if exists planes;
drop table if exists flights;
drop table if exists bookings;

--User table, if a user want an account on the website, but it's not an obligation to book a flight.
--genre > 0 woman, 1 man, ++ others.
--role > 0 user, 1 maintainer, 2 admin > the bigger it is, the more permissions you have.
create table users(
	email text primary Key,
	name text,
	surname text,
	genre integer,
	password text,
	role integer
);

--Planes table, where a plane is register with all the usefull informations.*
--nbPlacoEco + nbPlaceBui > = total of available places.
CREATE TABLE planes(
	planeID integer PRIMARY KEY,
	--Id of the plane, 14 number.
	--Example --> 00254788465123
	company text,
	planeType text,
	nbPlaceEco integer,
	nbPlaceBui integer
);

--Flights table, where the information like datetime of departure and arrival are.
CREATE TABLE flights(
	flightID text PRIMARY KEY,
	--Id of the flight, 2 letter for the country and 4 number for the id
	--Example --> FR0076 (Unique to determine if the is a delay or something)
	planeID integer,
	departureCity text,
	arrivingCity text,
	departureDate DATETIME,
	arrivalDate DATETIME,
	FOREIGN KEY (planeID) REFERENCES planes(planeID)
);


--Bookings table, where all the informations about any book is written. The user can have a partial access to this table.
CREATE TABLE bookings(
	reservationNumber integer PRIMARY KEY,
	seatNumber integer,
	clientName text,
	clientEmail text,
	flightID integer,
	FOREIGN KEY (flightID) REFERENCES flights(flightID)
);


--------First datas entered on table when the server starts--------

INSERT INTO users VALUES  
('nico.cous@gmail.com','Nicolas','Coussement', 1, '0000', 0),
('antoine@root.com','antoine','root', 1, 'root', 2),
('brice@root.com','brice','root', 1, 'root', 2),
('fa.brice@gmail.com','Brice','fab', 1, '0000', 0),
('philipe.mathieu@gmail.com','Philipe','Mathieu', 1, 'olive', 1),
('patrick.lebegue@gmail.com','Patrick','Lebegue', 1, '4321', 0),
('test@gmail.com','test','test',1,'test',0),
('patricia.evraere@gmail.com','Patricia','Evraere', 0, '1234', 0);

INSERT INTO planes VALUES
('00000000000001','AirVacation','A320','120','30'),
('00000000000002','AirVacation','A320','120','30'),
('00000000000003','AirVacation','A320','120','30'),
('00000000000004','AirVacation','A320','120','30');
