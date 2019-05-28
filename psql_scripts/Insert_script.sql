--- reset tables befores inserts

DELETE FROM seat_reservation;
DELETE FROM passengerBelongsToBooking;
DELETE FROM bookings;
DELETE FROM users;
DELETE FROM passenger;
DELETE FROM flights;
DELETE FROM planes;


--------First data entered on table when the server starts--------

INSERT INTO passenger VALUES  
(1,'Nicolas','Coussement', 1, '1999-01-01', '+33-0606060606', 'nico.cous@gmail.com'),
(2,'antoine','root', 1, '1999-09-05', '0606060606', 'antoine@root.com'),
(3,'Brice','root', 1, '1999-09-05', '0606060606', 'brice@root.com'),
(4,'Fa','Brice', 1, '1999-09-05', '0606060606', 'fa.brice@gmail.com'),
(5,'Philipe','Mathieu', 1, '1979-01-01', '0606060606', 'philipe.mathieu@gmail.com'),
(6,'Patrick','Lebegue', 1, '1969-01-01', '0606060606', 'patrick.lebegue@gmail.com'),
(7,'Patricia','Evraere', 0, '1989-01-01', '0606060606', 'patricia.evraere@gmail.com');


INSERT INTO passenger(pno, name, surname, title, dateOfBirth) VALUES  
(8,'Pierre','Martelle', 1, '1999-01-01'),
(9,'Elric','FineEau', 1, '1999-01-01'),
(10,'Alexandre','Desremords', 1, '1999-01-01'),
(11,'Manon','Baudruche', 0, '1905-01-01');

INSERT INTO passenger(pno, name, surname, title, dateOfBirth, phoneNumber, contactEmail) VALUES 
(12, 'Kostas','Koukouletsos', 1, '1979-01-01', '+33-0606060606', 'ccostas@uniwa.gr'); 

INSERT INTO users VALUES  
('nico.cous@gmail.com', 1, '0000', 0),
('antoine@root.com', 2, 'root', 2),
('brice@root.com', 3, 'root', 2);

INSERT INTO planes VALUES
(00000001,'AirVacation','A320',80),
(00000002,'AirVacation','A320',80),
(00000003,'AirVacation','A320',80),
(00000004,'AirVacation','A320',80),
(00000005,'AirVacation','A380',80),
(00000006,'AirVacation','A380',80),
(00000007,'AirVacation','A380',80),
(00000008,'AirVacation','ATR72',80),
(00000009,'AirVacation','A380',80);


--FlightID, PlaneID, departureCityCode, ArrivingCityCode, DepartureDate, DepartureTime, ArrivalDate, ArrivalTime, PlacesLeft
INSERT INTO flights VALUES 

--Charles de gaulles-Marseille-
('FR00764400',00000000000001,'CDG','MRS','2019-05-12', '15:40:00','2019-05-12', '17:00:00','34', '10'),
('FR00764401',00000000000001,'MRS','CDG','2019-05-13', '10:00:00','2019-05-13', '11:20:00','34', '10'),

--Bruxelles-Lyon--
('BL00764400',00000000000002,'BRU','LCY','2019-06-02', '12:00:00','2019-06-02', '13:10:00','52', '10'),
('BL00764401',00000000000002,'LCY','BRU','2019-06-04', '12:00:00','2019-06-04', '13:10:00','52', '10'),

-- Athens-Barcelona --
('GR10450030',00000000000003,'ATH','BCN','2019-05-22', '10:00:00','2019-05-22', '16:00:00','76', '10'),
('GR10450038',00000000000003,'ATH','BCN','2019-05-22', '15:30:00','2019-05-22', '21:30:00','76', '10'),
('GR10450031',00000000000003,'BCN','ATH','2019-05-22', '22:00:00','2019-05-23', '04:00:00','76', '10'),
('GR10450032',00000000000003,'ATH','BCN','2019-05-23', '10:30:00','2019-05-23', '16:30:00','76', '10'),
('GR10450033',00000000000003,'BCN','ATH','2019-05-23', '22:00:00','2019-05-24', '04:00:00','76', '10'),
('GR10450034',00000000000003,'ATH','BCN','2019-05-24', '10:30:00','2019-05-24', '16:30:00','76', '10'),
('GR10450035',00000000000003,'BCN','ATH','2019-05-24', '22:00:00','2019-05-25', '04:00:00','76', '10'),
('GR10450036',00000000000003,'ATH','BCN','2019-05-25', '10:30:00','2019-05-25', '16:30:00','76', '10'),
('GR10450037',00000000000003,'BCN','ATH','2019-05-25', '22:00:00','2019-05-26', '04:00:00','76', '10'),

-- Athens-Washington --
('GR20450030',00000000000004,'ATH','BWI','2019-05-21', '00:30:00','2019-05-21', '17:00:00','480', '10'),
('GR20450038',00000000000004,'ATH','BWI','2019-05-21', '20:00:00','2019-05-22', '12:30:00','480', '10'),
('GR20450031',00000000000004,'BWI','ATH','2019-05-22', '14:00:00','2019-05-23', '06:30:00','480', '10'),
('GR20450032',00000000000004,'ATH','BWI','2019-05-23', '08:00:00','2019-05-24', '00:30:00','480', '10'),
('GR20450033',00000000000004,'BWI','ATH','2019-05-24', '02:30:00','2019-05-24', '19:00:00','480', '10'),
('GR20450034',00000000000004,'ATH','BWI','2019-05-24', '21:30:00','2019-05-25', '14:00:00','480', '10'),
('GR20450035',00000000000004,'BWI','ATH','2019-05-25', '15:00:00','2019-05-26', '07:30:00','480', '10'),
('GR20450036',00000000000004,'ATH','BWI','2019-05-26', '09:30:00','2019-05-27', '02:00:00','480', '10'),
('GR20450037',00000000000004,'BWI','ATH','2019-05-27', '04:00:00','2019-05-26', '20:30:00','480', '10'),

-- Athens-Rome --
('GR30450030',00000000000005,'ATH','FCO','2019-05-22', '10:30:00','2019-05-22', '16:00:00','80', '10'),
('GR30450038',00000000000005,'ATH','FCO','2019-05-22', '16:30:00','2019-05-22', '22:00:00','80', '10'),
('GR30450031',00000000000005,'FCO','ATH','2019-05-22', '23:00:00','2019-05-23', '04:30:00','80', '10'),
('GR30450032',00000000000005,'ATH','FCO','2019-05-23', '06:30:00','2019-05-23', '12:00:00','80', '10'),
('GR30450033',00000000000005,'FCO','ATH','2019-05-23', '21:00:00','2019-05-24', '02:30:00','80', '10'),
('GR30450034',00000000000005,'ATH','FCO','2019-05-24', '05:30:00','2019-05-24', '11:00:00','80', '10'),
('GR30450035',00000000000005,'FCO','ATH','2019-05-24', '22:00:00','2019-05-25', '03:30:00','80', '10'),
('GR30450036',00000000000005,'ATH','FCO','2019-05-25', '05:30:00','2019-05-25', '11:00:00','80', '10'),
('GR30450037',00000000000005,'FCO','ATH','2019-05-25', '22:30:00','2019-05-26', '03:00:00','80', '10'),

-- Athens-Paris --
('GR40450030',00000000000006,'ATH','CDG','2019-05-22', '14:30:00','2019-05-22', '18:00:00','62', '10'),
('GR40450038',00000000000006,'ATH','CDG','2019-05-22', '19:30:00','2019-05-22', '23:00:00','62', '10'),
('GR40450031',00000000000006,'CDG','ATH','2019-05-22', '22:30:00','2019-05-23', '02:00:00','62', '10'),
('GR40450032',00000000000006,'ATH','CDG','2019-05-23', '14:30:00','2019-05-23', '17:55:00','62', '10'),
('GR40450033',00000000000006,'CDG','ATH','2019-05-23', '22:40:00','2019-05-24', '23:00:00','62', '10'),
('GR40450034',00000000000006,'ATH','CDG','2019-05-24', '14:30:00','2019-05-24', '17:55:00','62', '10'),
('GR40450035',00000000000006,'CDG','ATH','2019-05-24', '22:40:00','2019-05-25', '23:00:00','62', '10'),
('GR40450036',00000000000006,'ATH','CDG','2019-05-25', '14:30:00','2019-05-25', '17:55:00','62', '10'),
('GR40450037',00000000000006,'CDG','ATH','2019-05-25', '22:40:00','2019-05-26', '23:05:00','62', '10'),

-- Paris CDG - Marseille --
('FR00450030',00000000000007,'CDG','MRS','2019-05-22', '15:30:00','2019-05-22', '17:55:00','34', '10'),
('FR00450038',00000000000007,'CDG','MRS','2019-05-22', '20:30:00','2019-05-22', '22:55:00','34', '10'),
('FR00450031',00000000000007,'MRS','CDG','2019-05-22', '22:40:00','2019-05-23', '00:05:00','34', '10'),
('FR00450032',00000000000007,'CDG','MRS','2019-05-23', '15:30:00','2019-05-23', '17:55:00','34', '10'),
('FR00450033',00000000000007,'MRS','CDG','2019-05-23', '22:40:00','2019-05-24', '00:05:00','34', '10'),
('FR00450034',00000000000007,'CDG','MRS','2019-05-24', '15:30:00','2019-05-24', '17:55:00','34', '10'),
('FR00450035',00000000000007,'MRS','CDG','2019-05-24', '22:40:00','2019-05-25', '00:05:00','34', '10'),
('FR00450036',00000000000007,'CDG','MRS','2019-05-25', '15:30:00','2019-05-25', '17:55:00','34', '10'),
('FR00450037',00000000000007,'MRS','CDG','2019-05-25', '22:40:00','2019-05-26', '00:05:00','34', '10'),

-- Lille-Madrid --
('GR50450030',00000000000008,'LIL','MAD','2019-05-22', '10:30:00','2019-05-22', '15:30:00','96', '10'),
('GR50450038',00000000000008,'LIL','MAD','2019-05-22', '16:30:00','2019-05-22', '21:30:00','96', '10'),
('GR50450031',00000000000008,'MAD','LIL','2019-05-22', '22:30:00','2019-05-23', '03:30:00','96', '10'),
('GR50450032',00000000000008,'LIL','MAD','2019-05-23', '15:30:00','2019-05-23', '20:30:00','96', '10'),
('GR50450033',00000000000008,'MAD','LIL','2019-05-23', '22:00:00','2019-05-24', '03:00:00','96', '10'),
('GR50450034',00000000000008,'LIL','MAD','2019-05-24', '15:30:00','2019-05-24', '20:30:00','96', '10'),
('GR50450035',00000000000008,'MAD','LIL','2019-05-24', '22:40:00','2019-05-25', '03:40:00','96', '10'),
('GR50450036',00000000000008,'LIL','MAD','2019-05-25', '15:30:00','2019-05-25', '21:30:00','96', '10'),
('GR50450037',00000000000008,'MAD','LIL','2019-05-25', '22:40:00','2019-05-26', '03:40:00','96','10'),

-- Athens-London --
('GR00450030',00000000000009,'ATH','LCY','2019-05-22', '10:30:00','2019-05-22', '15:30:00','96', '10'),
('GR00450038',00000000000009,'ATH','LCY','2019-05-22', '16:30:00','2019-05-22', '21:30:00','96', '10'),
('GR00450031',00000000000009,'LCY','ATH','2019-05-22', '22:30:00','2019-05-23', '03:30:00','96', '10'),
('GR00450032',00000000000009,'ATH','LCY','2019-05-23', '15:30:00','2019-05-23', '20:30:00','96', '10'),
('GR00450033',00000000000009,'LCY','ATH','2019-05-23', '22:00:00','2019-05-24', '03:00:00','96', '10'),
('GR00450034',00000000000009,'ATH','LCY','2019-05-24', '15:30:00','2019-05-24', '20:30:00','96', '10'),
('GR00450035',00000000000009,'LCY','ATH','2019-05-24', '22:40:00','2019-05-25', '03:40:00','96', '10'),
('GR00450036',00000000000009,'ATH','LCY','2019-05-25', '15:30:00','2019-05-25', '21:30:00','96', '10'),
('GR00450037',00000000000009,'LCY','ATH','2019-05-25', '22:40:00','2019-05-26', '03:40:00','96', '10');


INSERT INTO bookings VALUES
(0,'FR00764400', 0, 0, 1),
(1,'FR00764400', 2, 0, 1),
(2,'FR00764400', 1, 0, 1);


INSERT INTO passengerBelongsToBooking VALUES
(1,0),
(1,0);

INSERT INTO  seat_reservation VALUES
('FR00764400', '1A', '0'),
('FR00764400', '1B', '0'),
('FR00764400', '2D', '0'),
('FR00764400', '2B', '0'),
('FR00764400', '3A', '0'),
('FR00764400', '4C', '0'),
('FR00764400', '4A', '0'),
('BL00764400', '1D', '0'),
('BL00764400', '1B', '0'),
('BL00764400', '2A', '0'),
('BL00764400', '2C', '0'),
('BL00764400', '3B', '0'),
('BL00764400', '4D', '0'),
('FR00764401', '1A', '0'),
('FR00764401', '1B', '0'),
('FR00764401', '2A', '0'),
('FR00764401', '2B', '0'),
('FR00764401', '3D', '0'),
('FR00764401', '4B', '0'),
('FR00764401', '5D', '0'),
('FR00764401', '5C', '0'),
('FR00764401', '6A', '0'),
('FR00764401', '7A', '0'),
('FR00764401', '7B', '0'),
('FR00450030', '1D', '0'),
('FR00450030', '1C', '0'),
('FR00450030', '3B', '0'),
('FR00450030', '4D', '0'),
('FR00450030', '4B', '0'),
('FR00450030', '5A', '0'),
('FR00450030', '6D', '0'),
('FR00450030', '6B', '0'),
('FR00450030', '7A', '0'),
('FR00450030', '7B', '0'),
('GR50450030', '6D', '0'),
('GR50450030', '6B', '0'),
('GR50450030', '7A', '0'),
('GR50450030', '7B', '0');

