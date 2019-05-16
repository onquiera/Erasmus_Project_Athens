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

INSERT INTO passenger(pno, name, surname, title, dateOfBirth, phoneNumber, email) VALUES 
(12, 'Kostas','Koukouletsos', 1, '1979-01-01', '+33-0606060606', 'ccostas@uniwa.gr'); 

INSERT INTO users(pno, password, role) VALUES  
(1, '0000', 0),
(2, 'root', 2),
(3, 'root', 2),
(4, '00000000000', 0),
(5, 'olives', 1),
(6, '43210-1-2-3-4', 0),
(7, '12345678910', 0);

INSERT INTO planes VALUES
(00000001,'AirVacation','A320',20,8),
(00000002,'AirVacation','A320',20,8),
(00000003,'AirVacation','A320',20,8),
(00000004,'AirVacation','A320',20,8),
(00000005,'AirVacation','A380',30,8),
(00000006,'AirVacation','A380',30,8),
(00000007,'AirVacation','A380',30,8),
(00000008,'AirVacation','ATR72',30,0);

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

INSERT INTO  seat_reservation  ( flightID ,  SEAT_NUMBER ,  CUSTOMER_NAME ) VALUES
('FR00764400', '1A', 'Angela Warren'),
('FR00764400', '1B', 'Catherine Perry'),
('FR00764400', '2D', 'Steven Wells'),
('FR00764400', '2B', 'Betty Cox'),
('FR00764400', '3A', 'Samuel Murphy'),
('FR00764400', '4C', 'Shawn Hall'),
('FR00764400', '4A', 'Scott Taylor'),
('BL00764400', '1D', 'Edward Rodriguez'),
('BL00764400', '1B', 'Ruth Holmes'),
('BL00764400', '2A', 'Julie Peters'),
('BL00764400', '2C', 'Roy Cunningham'),
('BL00764400', '3B', 'Kathryn Johnston'),
('BL00764400', '4D', 'Betty Peterson'),
('FR00764401', '1A', 'Kathryn Wallace'),
('FR00764401', '1B', 'Sarah Young'),
('FR00764401', '2A', 'Mary Bradley'),
('FR00764401', '2B', 'Irene Grant'),
('FR00764401', '3D', 'Theresa Bradley'),
('FR00764401', '4B', 'Randy Castillo'),
('FR00764401', '5D', 'Antonio Ferguson'),
('FR00764401', '5C', 'Lori Perry'),
('FR00764401', '6A', 'Kevin Mcdonald'),
('FR00764401', '7A', 'Phyllis Elliott'),
('FR00764401', '7B', 'Paula Ford'),
('FR00450030', '1D', 'Kathryn Wallace'),
('FR00450030', '1C', 'Sarah Young'),
('FR00450030', '3A', 'Theresa Bradley'),
('FR00450030', '3B', 'Gerald Price'),
('FR00450030', '4D', 'Henry Webb'),
('FR00450030', '4B', 'Randy Castillo'),
('FR00450030', '5A', 'Antonio Ferguson'),
('FR00450030', '6D', 'Kevin Mcdonald'),
('FR00450030', '6B', 'Benjamin Jenkins'),
('FR00450030', '7A', 'Phyllis Elliott'),
('FR00450030', '7B', 'Paula Ford');
