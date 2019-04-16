drop table if exists users;

create table users(
	email text primary Key,
	name text,
	surname text,
	genre integer,
	password text,
	role integer
	 );
--genre > 0 woman, 1 man, ++ others
--role > 0 user, 1 maintainer, 2 admin > the bigger it is, the more permissions you have

INSERT INTO users VALUES  ('nico.cous@gmail.com','Nicolas','Coussement', 1, '0000', 0),
('antoine@root.com','antoine','root', 1, 'root', 2),
('brice@root.com','brice','root', 1, 'root', 2),
('fa.brice@gmail.com','Brice','DeNice', 1, '0000', 0),
('philipe.mathieu@gmail.com','Philipe','Mathieu', 1, 'JesuisleDieudelaBDD', 1),
('patrick.lebegue@gmail.com','Patrick','Lebegue', 1, 'uneBonneNotesvp', 0), ('patricia.evraere@gmail.com','Patricia','Evraere', 0, 'onvousaime', 0);


















