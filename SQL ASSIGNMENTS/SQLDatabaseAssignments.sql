/*ZOO DATABASE ASSIGNMENT 1*/
USE db_zoo
SELECT * FROM tbl_habitat;

/*ZOO DATABASE ASSIGNMENT 2*/
SELECT species_name FROM tbl_species WHERE species_order=3;

/*ZOO DATABASE ASSIGNMENT 3*/
SELECT nutrition_type FROM tbl_nutrition WHERE nutrition_cost <= 600.00;

/*ZOO DATABASE ASSIGNMENT 4*/
SELECT species_name FROM tbl_species WHERE species_nutrition BETWEEN 2202 AND 2206;

/*ZOO DATABASE ASSIGNMENT 5*/
SELECT species_name AS "Species Name:", nutrition_type AS "Nutrition Type:" FROM tbl_species, tbl_nutrition;

/*ZOO DATABASE ASSIGNMENT 6*/
SELECT species_name, specialist_fname, specialist_lname, specialist_contact
	FROM tbl_specialist
	INNER JOIN tbl_care ON tbl_specialist.specialist_id = care_specialist
	INNER JOIN tbl_species ON care_id = species_care
	WHERE species_name = 'penguin';

/*ZOO DATABASE ASSIGNMENT 7*/
CREATE DATABASE muppets
USE muppets

CREATE TABLE tbl_muppet (
	muppet_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	first_name VARCHAR(30) NOT NULL,
	mup_type VARCHAR(30) NOT NULL,
);

INSERT INTO tbl_muppet (first_name, mup_type)
	VALUES
	('Kermit', 'Frog'),
	('Gonzo', 'Bird'),
	('Fozzie', 'Bear');

CREATE TABLE tbl_info (
	info_id INT PRIMARY KEY NOT NULL IDENTITY(1,1), 
	muppet_id INT NOT NULL CONSTRAINT fk_muppet_id FOREIGN KEY REFERENCES tbl_muppet(muppet_id) ON UPDATE CASCADE ON DELETE CASCADE,
	mup_movie VARCHAR(100) NOT NULL,
	movie_year INT NOT NULL,
	mup_phrase VARCHAR(100) NOT NULL,
);

INSERT INTO tbl_info (muppet_id, mup_movie, movie_year, mup_phrase)
	VALUES
	(1,'The Muppet Movie', 1979, 'Sometimes it sucks being green'),
	(2,'The Muppets Take Manhattan', 1984, 'Whatever'),
	(3,'Muppets Treasure Island', 1996, 'Waka Waka');

SELECT first_name AS 'NAME', mup_movie AS 'MOVIE', movie_year AS 'MOVIE YEAR', mup_phrase AS 'PHRASE'
	FROM tbl_muppet
	INNER JOIN tbl_info ON tbl_info.muppet_id = tbl_muppet.muppet_id;

