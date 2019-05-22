DROP TABLE IF EXISTS seat_reservation;
DROP TABLE IF EXISTS passengerBelongsToBooking;
DROP table if exists bookings;
DROP table if exists users;
DROP table if exists passenger;
DROP table if exists flights;
DROP table if exists planes;

--title > 0 woman, 1 man
CREATE TABLE passenger(
	pno int primary key,
	name text,
	surname text,
	title integer,
	dateOfBirth DATE,
	phoneNumber text DEFAULT NULL, --only for the booking customer > the person to contact
	contactEmail text DEFAULT NULL --only for the booking customer > for the person to contact
);

--User table, if a user wants an account on the website, but it's not an obligation to book a flight.
--role > 0 user, 1 maintainer, 2 admin > the bigger it is, the more permissions you have.
CREATE TABLE users(
	loginEmail text primary key,
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
	nbPlace integer
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

CREATE TABLE bookings(
	bookingID int PRIMARY KEY,
	flightID text,
	category int,
	insurance int, --0 insurance taken, 1 insurance not taken
	mainPassengerNO int, 
	FOREIGN KEY (flightID) REFERENCES flights(flightID),
	FOREIGN KEY (mainPassengerNO) REFERENCES passenger(pno)
);

--association > when multiple passengers on one booking
CREATE TABLE passengerBelongsToBooking(
	passengerNO integer,
	bookingID integer,
	FOREIGN KEY (bookingID) REFERENCES bookings(bookingID),
	FOREIGN KEY (passengerNO) REFERENCES passenger(pno)
);

CREATE TABLE IF NOT EXISTS  seat_reservation  (
   flightID text,
   SEAT_NUMBER  varchar(4) NOT NULL,
   bookingID integer,
   FOREIGN KEY(flightID) REFERENCES  flights(flightID),
   FOREIGN KEY(bookingID) REFERENCES  bookings(bookingID)
);

ALTER TABLE  seat_reservation 
 ADD PRIMARY KEY (flightID , SEAT_NUMBER);







