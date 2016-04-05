DROP TABLE IF EXISTS People; 

CREATE TABLE IF NOT EXISTS People (
pid int PRIMARY KEY NOT NULL,
fName text NOT NULL,
lName text NOT NULL,
address text NOT NULL
);

DROP TABLE IF EXISTS PeopleWhoAreActors;

CREATE TABLE IF NOT EXISTS PeopleWhoAreActors (
pid int NOT NULL,
aid int NOT NULL,
spouseName text,
PRIMARY KEY (pid, aid)
);

DROP TABLE IF EXISTS Actor;

CREATE TABLE IF NOT EXISTS Actor (
aid int primary key NOT NULL,
Address text NOT NULL,
birthDate text NOT NULL,
hairColor text NOT NULL,
eyeColor text NOT NULL,
height int NOT NULL,
weight int NOT NULL,
favColor text NOT NULL,
anniversary date NOT NULL
);

DROP TABLE IF EXISTS ActorsInMovies;

CREATE TABLE IF NOT EXISTS ActorsInMovies (
aid int NOT NULL,
mid int NOT NULL,
primary key (aid, mid)
);


DROP TABLE IF EXISTS Movie;

CREATE TABLE IF NOT EXISTS Movie (
mid int PRIMARY KEY NOT NULL,
name text NOT NULL,
yearReleased text NOT NULL,
mpaaNumber int NOT NULL,
domesticBoxOffice int NOT NULL,
foreignBoxOffice int NOT NULL,
dvd int NOT NULL
);

DROP TABLE IF EXISTS MovieDirectors;

CREATE TABLE IF NOT EXISTS MovieDirectors (
mid int  NOT NULL,
did int  NOT NULL,
PRIMARY KEY (mid,did)
);

DROP TABLE IF EXISTS Director;

CREATE TABLE IF NOT EXISTS Director (
did int PRIMARY KEY NOT NULL,
name text NOT NULL,
address text NOT NULL,
spouseName text,
filmSchool text NOT NULL,
anniversary text NOT NULL,
lensMaker text NOT NULL
); 

INSERT INTO People (pid, fName, lName, address)
VALUES (1, 'Bob', 'Smith', '10 sunshine lane'),
	(2, 'Sean', 'Connery', '123 Bond Dr'),
	(3, 'Adam', 'Sandler', '45 Light Lane');

INSERT INTO PeopleWhoAreActors (pid, aid, spouseName)
VALUES (2, 4, 'Diane Cilento'),
	(3, 5, 'Jackie Sandler');

INSERT INTO Actor (aid, Address, birthDate, hairColor, eyeColor, height, weight, favColor, anniversary)
VALUES (4, '123 Bond Dr','August 25, 1930', 'brown', 'brown', 68,170, 'blue', 'October 10, 2016' ),
	(5, '45 Light Lane', 'September 9, 1966', 'brown', 'brown', 69, 180, 'green', 'October 10, 2016' );

INSERT INTO ActorsInMovies (aid, mid)
VALUES (4, 7);

INSERT INTO Movie (mid, name, yearReleased, mpaaNumber, 
domesticBoxOffice, foreignBoxOffice, dvd)
VALUES (6, 'Across the Universe', 2007, 400, 345000, 500000, 300000),
	(7, 'James Bond', 1980, 300, 400000, 500000, 200000);

INSERT INTO MovieDirectors (mid, did)
VALUES (7,8),
	(6,10);

INSERT INTO Director (did, name, address, spouseName, filmSchool, anniversary, 
lensMaker)
VALUES (8, 'Terence Young', '23 Director Dr.', 'Sabine Sun', 'Shanghai', '2004', 'Sigma'),
	(9, 'JJ Abrams', '20 Lost Lane', 'Katie McGrath', 'Sarah Lawrence', '2007', 'Sigma'),
	(10, 'Julie Taymor', '15 Strawberry Field' , 'Elliot Goldenthal', 'Oberlin College', '2003', 'sigma');
	
SELECT Director.name
FROM Director
WHERE did IN (SELECT did
	      FROM MovieDirectors
	      WHERE mid IN (SELECT mid
				FROM Movie
				WHERE mid IN ( SELECT mid
						FROM ActorsInMovies
						WHERE aid IN (SELECT aid
								FROM Actor
								WHERE aid IN (SELECT aid
										FROM PeopleWhoAreActors
										WHERE aid IN (SELECT aid
												FROM People
												WHERE fName = 'Sean'
												)
											)
										)
									)
								)
							);
								
				
			
				



