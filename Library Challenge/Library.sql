CREATE DATABASE Library
USE Library


CREATE TABLE tbl_librarybranch (
	branch_id INT PRIMARY KEY NOT NULL IDENTITY (100,5), 
	branch_name VARCHAR(50) NOT NULL,
	branch_add VARCHAR(50) NOT NULL
);


CREATE TABLE tbl_pub (
	pub_name VARCHAR(50) PRIMARY KEY NOT NULL,
	pub_add VARCHAR(50) NOT NULL,
	pub_phone VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_books (
	book_id INT PRIMARY KEY NOT NULL IDENTITY (50,1),
	book_title VARCHAR(50) NOT NULL,
	pub_name VARCHAR(50) NOT NULL CONSTRAINT fk_pub_name FOREIGN KEY REFERENCES tbl_pub(pub_name) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE tbl_authors (
	book_id INT NOT NULL CONSTRAINT fk_book_id FOREIGN KEY REFERENCES tbl_books(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
	author_name VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_bookcopies (
	book_id INT NOT NULL CONSTRAINT fk2_book_id FOREIGN KEY REFERENCES tbl_books(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
	branch_id INT NOT NULL CONSTRAINT fk_branch_id FOREIGN KEY REFERENCES tbl_librarybranch(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
	num_copies INT NOT NULL
);

CREATE TABLE tbl_borrower (
	card_num INT PRIMARY KEY NOT NULL IDENTITY (21,1),
	borrower_name VARCHAR(30) NOT NULL,
	borrower_add VARCHAR(30) NOT NULL,
	borrower_phone VARCHAR(20) NOT NULL 
);

CREATE TABLE tbl_bookloans (
	book_id INT NOT NULL CONSTRAINT fk3_book_id FOREIGN KEY REFERENCES tbl_books(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
	branch_id INT NOT NULL CONSTRAINT fk2_branch_id FOREIGN KEY REFERENCES tbl_librarybranch(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
	card_num INT NOT NULL CONSTRAINT fk_card_num FOREIGN KEY REFERENCES tbl_borrower(card_num) ON UPDATE CASCADE ON DELETE CASCADE,
	date_out VARCHAR(10) NOT NULL,
	date_due VARCHAR(10) NOT NULL 
);

INSERT INTO tbl_librarybranch
	(branch_name, branch_add)
	VALUES
	('Sharpstown', '4 Privet Dr'),
	('Godrics Hollow', '578 Expecto Patronum Ave'), 
	('Hogsmead', '6453 Accio Ln'),
	('Beauxbatons', '89 Expelliarmus Dr'),
	('Durmstrang', '2893 Wingardium Leviosa Blvd'),
	('Diagon Alley', '2314 Oblivate Ave')
;


INSERT INTO tbl_borrower 
	(borrower_Name, borrower_add, borrower_phone)
	VALUES
	('Harry', '23892 Felix Felicis Dr', '818-341-7829'),
	('Hermoine', '17382 Veritaserum St', '314-892-3426'),
	('Ron', '87 Mandrake Dr', '515-234-2948'),
	('Luna', '927 Floberworm Ave', '576-297-2341'),
	('Neville', '12 Gillyweed Dr', '514-564-8690'),
	('Padma', '6732 Wiggentree St', '515-234-9372'),
	('Ginny', '709 Mimbulus Ave', '829-582-0922'),
	('Draco', '23 Devil Snare', '617-234-9837')
;


INSERT INTO tbl_pub 
	(pub_name, pub_add, pub_phone)
	VALUES
	('Sorcer Stone', '953 Monroe Drive', '364-345-1234'),
	('Fire Goblet', '620 Hilltop Court', '546-737-2983'),
	('Deathly Hollows', '696 Highland Circle', '483-234-3827'),
	('Phoenix Orders', '775 Sussex Dr', '433-674-1582'),
	('Azkaban', '8193 Proctor Ave', '305-234-2891'),
	('HBP', '73 Henry St', '636-624-0837'),
	('Cursed Child', '11 San Pablo Lane', '515-504-9382'),
	('Ickabog', '853 Gartner Lane', '404-234-9823'),
	('Grindelwald', '81 South Joy Ridge St.', '717-324-5467'),
	('Qudditch', '3 Chestnut St.', '717-758-0934')
;



INSERT INTO tbl_books
	(book_title, pub_name)
	VALUES
	('The Lost Tribe', 'Sorcer Stone'),
	('The Lord of the Rings', 'Sorcer Stone'),
	('Songs of Solomon', 'Deathly Hollows'),
	('The Golden Compass', 'Qudditch'),
	('American Gods', 'Deathly Hollows'),
	('Grapes of Wrath', 'Ickabog'),
	('Braiding Sweetgrass', 'Grindelwald'),
	('Nature Fix', 'Cursed Child'),
	('Secret Lives of Trees', 'HBP'),
	('Desert Solitaire', 'Azkaban'),
	('Kafka on the Shore', 'Phoenix Orders'),
	('Collapse', 'Fire Goblet'),
	('Sum', 'Cursed Child'),
	('Chaos Theory', 'HBP'),
	('Uncanny Valley', 'Qudditch'), 
	('Dirt', 'Ickabog'),
	('1984', 'Grindelwald'),
	('Just Us', 'Fire Goblet'),
	('The Dead Are Arising', 'HBP'),
	('Empty Planet', 'Azkaban')
;

INSERT INTO tbl_authors
	(book_id, author_name)
	VALUES
	(50, 'Severus Snape'),
	(51, 'Minerva McGonagall'),
	(52, 'Albus Dumbledore'),
	(53, 'Remus Lupin'),
	(54, 'Sirius Black'),
	(55, 'Dolores Umbridge'),
	(56, 'Gellert Grindelwald'),
	(57, 'J.K. Rowling'),
	(58, 'Poppy Pomfrey'),
	(59, 'Sybill Trelawney')
;

INSERT INTO tbl_bookcopies
	(num_copies, book_id, branch_id)
	VALUES
	(2, 50, 100),
	(2, 51, 100),
	(3, 52, 100),
	(2, 53, 100),
	(4, 54, 100),
	(3, 55, 105),
	(2, 55, 105),
	(5, 57, 105),
	(4, 58, 105),
	(6, 59, 105),
	(2, 55, 110),
	(3, 51, 110),
	(2, 56, 110),
	(4, 59, 115),
	(2, 50, 115),
	(2, 53, 120),
	(3, 57, 120),
	(2, 58, 120),
	(2, 50, 125),
	(5, 57, 125),
	(2, 56, 125)
;



INSERT INTO tbl_bookloans 
	(book_id, branch_id, card_num, date_out, date_due)
	VALUES
	(57, 115, 25, '02/15/2021', '02/25/2021'),
	(55, 105, 22, '02/11/2021', '02/21/2021'),
	(51, 120, 27, '02/13/2021', '02/23/2021'),
	(53, 120, 28, '02/25/2021', '03/07/2021'),
	(59, 125, 25, '02/26/2021', '03/08/2021'),
	(58, 110, 26, '02/05/2021', '02/15/2021'),
	(56, 115, 25, '02/13/2021', '02/23/2021'),
	(55, 125, 23, '02/16/2021', '02/26/2021'),
	(52, 110, 24, '02/17/2021', '02/27/2021'),
	(54, 105, 22, '02/11/2021', '02/21/2021'),
	(60, 120, 27, '02/13/2021', '02/23/2021'),
	(61, 120, 28, '02/25/2021', '03/07/2021'),
	(62, 125, 25, '02/26/2021', '03/08/2021'),
	(63, 110, 26, '02/05/2021', '02/15/2021'),
	(64, 115, 25, '02/13/2021', '02/23/2021'),
	(65, 125, 23, '02/16/2021', '02/26/2021'),
	(66, 110, 24, '02/17/2021', '02/27/2021'),
	(67, 105, 22, '02/11/2021', '02/21/2021'),
	(69, 120, 28, '02/25/2021', '03/07/2021')
;

