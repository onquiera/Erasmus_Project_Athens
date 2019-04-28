drop table if exists users;
drop table if exists bookings;
drop table if exists flights;
drop table if exists planes;

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
	--Id of the flight, 2 letter for the country and 8 number for the id
	--Example --> FR00764400 (Unique to determine if the is a delay or something)
	planeID integer,

	departureCityCode VARCHAR(3),
	arrivingCityCode VARCHAR(3),

	departureDate DATE,
	departureTime TIME,
	arrivalDate DATE,
	arrivalTime TIME,
	placesLeft INT,
	FOREIGN KEY (planeID) REFERENCES planes(planeID),
	FOREIGN KEY (departureCityCode) REFERENCES airports(code),
	FOREIGN KEY (arrivingCityCode) REFERENCES airports(code)
);

--Bookings table, where all the informations about any book is written. The user can have a partial access to this table.
CREATE TABLE bookings(
	reservationNumber integer PRIMARY KEY,
	--Need to be at least 10 number, to be sure to have enough place about the future bookings.
	flightID text,
	seatNumber integer,
	clientName text,
	clientEmail text,
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
(00000000000001,'AirVacation','A320',120,30),
(00000000000002,'AirVacation','A320',120,30),
(00000000000003,'AirVacation','A320',120,30),
(00000000000004,'AirVacation','A320',120,30),
(00000000000005,'AirVacation','A380',600,200),
(00000000000006,'AirVacation','A380',600,200),
(00000000000007,'AirVacation','A380',600,200),
(00000000000008,'AirVacation','ATR72',78,0);

INSERT INTO flights VALUES 
('FR00764400',00000000000001,'CDG','MRS','2019-05-12', '15:40:00','2019-05-12', '17:00:00','10'),
('FR00764401',00000000000001,'MRS','CDG','2019-05-13', '10:00:00','2019-05-13', '11:20:00','10'),

('BL00764400',00000000000002,'BRU','LCY','2019-06-02', '12:00:00','2019-06-02', '13:10:00','10'),
('BL00764401',00000000000002,'LCY','BRU','2019-06-04', '12:00:00','2019-06-04', '13:10:00','10'),

('FR00450030',00000000000008,'LIL','MAD','2019-04-22', '15:30:00','2019-04-22', '17:55:00','10'),
('FR00450038',00000000000008,'LIL','MAD','2019-04-22', '20:30:00','2019-04-22', '22:55:00','10'),
('FR00450031',00000000000008,'MAD','LIL','2019-04-22', '22:40:00','2019-04-23', '00:05:00','10'),
('FR00450032',00000000000008,'LIL','MAD','2019-04-23', '15:30:00','2019-04-23', '17:55:00','10'),
('FR00450033',00000000000008,'MAD','LIL','2019-04-23', '22:40:00','2019-04-24', '00:05:00','10'),
('FR00450034',00000000000008,'LIL','MAD','2019-04-24', '15:30:00','2019-04-24', '17:55:00','10'),
('FR00450035',00000000000008,'MAD','LIL','2019-04-24', '22:40:00','2019-04-25', '00:05:00','10'),
('FR00450036',00000000000008,'LIL','MAD','2019-04-25', '15:30:00','2019-04-25', '17:55:00','10'),
('FR00450037',00000000000008,'MAD','LIL','2019-04-25', '22:40:00','2019-04-26', '00:05:00','10');

INSERT INTO bookings VALUES
(0000000001,'FR00764400',120,'Despelchin','bricedespelchin@gmail.com'),
(0000000002,'FR00764400',121,'Onquiert','bricedespelchin@gmail.com'),
(0000000003,'FR00764401',144,'Despelchin','bricedespelchin@gmail.com'),
(0000000004,'FR00764401',002,'Onquiert','antoine.onquiert@gmail.com'),

(0000000005,'FR00450036',30,'Colombe','colombe.guillemin@gmail.com'),
(0000000006,'FR00450037',78,'Colombe','colombe.guillemin@gmail.com');
