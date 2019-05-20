DROP table if exists bookings;
DROP table if exists users;
DROP table if exists passenger;
DROP TABLE IF EXISTS seat_reservation;
DROP table if exists flights;
DROP table if exists planes;

--title > 0 woman, 1 man
CREATE TABLE passenger(
	pno int primary key,
	name text,
	surname text,
	title integer,
	dateOfBirth DATE,
	phoneNumber text DEFAULT NULL, --optional > for the person to contact
	email text Unique DEFAULT NULL --optional > for the person to contact, but necessary for users(connected to the website)
);

--User table, if a user want an account on the website, but it's not an obligation to book a flight.
--role > 0 user, 1 maintainer, 2 admin > the bigger it is, the more permissions you have.
CREATE TABLE users(
	uno SERIAL primary key,
	pno integer,
	password text,
	role integer,
	FOREIGN KEY (pno) REFERENCES passenger(pno)
);




--Planes table, where a plane is register with all the usefull informations.*
--nbPlacoEco + nbPlaceBui > = total of available places.
CREATE TABLE planes(
	planeID integer PRIMARY KEY,
	--Id of the plane, 8 number.
	--Example --> 88465123
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
	price INT,
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

CREATE TABLE IF NOT EXISTS  seat_reservation  (
   flightID text,
   SEAT_NUMBER  varchar(4) NOT NULL,
   CUSTOMER_NAME  varchar(80) DEFAULT NULL,
   FOREIGN KEY(flightID) REFERENCES  flights(flightID)
);

ALTER TABLE  seat_reservation 
 ADD PRIMARY KEY (flightID , SEAT_NUMBER);


