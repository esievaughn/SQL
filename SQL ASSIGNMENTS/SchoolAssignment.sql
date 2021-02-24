
CREATE DATABASE School
USE School



CREATE TABLE tbl_classes (
	class_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	class_name VARCHAR(30) NOT NULL,
);

INSERT INTO tbl_classes (class_name)
	VALUES
	('Software Developer Boot Camp'),
	('C# Boot Camp');



CREATE TABLE tbl_instructors (
	instructor_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	instructor_name VARCHAR(50) NOT NULL,
);

INSERT INTO tbl_instructors (instructor_name)
	VALUES 
	('Severus Snape'),
	('Minerva McGonagall');

CREATE TABLE tbl_students(
	student_id INT PRIMARY KEY NOT NULL IDENTITY(1,1), 
	student_name VARCHAR(50),
	class_id INT CONSTRAINT fk_class_id FOREIGN KEY REFERENCES tbl_classes(class_id) ON UPDATE CASCADE ON DELETE CASCADE,
	instructor_id INT CONSTRAINT fk_instructor_id FOREIGN KEY REFERENCES tbl_instructors(instructor_id) ON UPDATE CASCADE ON DELETE CASCADE,
);

INSERT INTO tbl_students(student_name, class_id, instructor_id)
	VALUES
	('Harry Potter', 1, 2),
	('Hermoine Granger', 1, 2),
	('Ron Weasly', 1, 2),
	('Luna Lovegood', 2, 1),
	('Cho Chang', 2, 1),
	('Dean Thomas', 2, 1),
	('Seamus Finnigan', 2, 1);


SELECT instructor_name FROM tbl_instructors;

SELECT student_name FROM tbl_students ORDER BY student_name ASC;

SELECT class_name, student_name, instructor_name
	FROM tbl_students
	INNER JOIN tbl_instructors ON tbl_instructors.instructor_id = tbl_students.instructor_id
	INNER JOIN tbl_classes ON tbl_classes.class_id = tbl_students.class_id
