USE Library

--Full outer join on three tables
SELECT *
FROM tbl_bookloans
	FULL OUTER JOIN tbl_borrower ON tbl_bookloans.card_num= tbl_borrower.card_num
	FULL OUTER JOIN tbl_books ON tbl_bookloans.book_id= tbl_books.book_id;

--Query that returns all book titles and author names
SELECT *
FROM tbl_authors
	INNER JOIN tbl_books ON tbl_authors.book_id= tbl_books.book_id
	ORDER BY book_title ASC;

--How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is Sharpstown?

GO
CREATE PROCEDURE usp_LostTribeCopies_Sharpstown
	AS
	SELECT a.num_copies
	FROM tbl_bookcopies a
	INNER JOIN tbl_librarybranch b ON b.branch_id = a.branch_id
	INNER JOIN tbl_books c ON c.book_id = a.book_id
	WHERE b.branch_name = 'Sharpstown'
	AND c.book_title = 'The Lost Tribe'
GO

--How many copies of the book titled "The Lost Tribe" are ownedy by each library branch?
CREATE PROCEDURE usp_LostTribeCopies
	AS
	SELECT a.num_copies, b.branch_name
	FROM tbl_bookcopies a
	INNER JOIN tbl_librarybranch b ON b.branch_id = a.branch_id
	INNER JOIN tbl_books c ON c.book_id = a.book_id
	WHERE c.book_title = 'The Lost Tribe'
GO

--Retrieve Names of all borrowers who do not have books checked out 
CREATE PROCEDURE usp_NoBookLoans
AS
SELECT a.borrower_name
FROM tbl_borrower a
LEFT JOIN tbl_bookloans b ON a.card_num = b.card_num
WHERE b.card_num IS NULL
GO

SELECT * FROM tbl_bookloans