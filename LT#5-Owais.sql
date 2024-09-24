/* Syed Owais ALi -23053 LT-3 */
CREATE TABLE Author_23053 (
authorID int,
first_name varchar(max) NOT NULL,
last_name varchar(max) NOT NULL,
date_of_birth datetime,
contact_number numeric CHECK (len(contact_number) = 11 )
CONSTRAINT pk_author primary key(authorID)
);

CREATE TABLE Book_23053 (
bookID int,
title varchar(max) NOT NULL,
ISBN numeric NOT NULL unique CHECK (len(ISBN) = 10),
price numeric(10,2) NOT NULL,
publishing_date datetime,
CONSTRAINT pk_book primary key(bookID)
);

CREATE TABLE Author_Book_23053 (
Auhtor_book_ID int unique,
authorID int,
bookID int,
CONSTRAINT fk_author foreign key(authorID) references Author_23053(authorID),
CONSTRAINT fk_book foreign key(bookID) references Book_23053(bookID),
);

INSERT INTO Author_23053 values(1,'Peter', 'Rob', '2001-08-16', '12345678999')
INSERT INTO Author_23053 values(2,'Stephen', 'Morris', '2001-02-16', '22345678999')
INSERT INTO Author_23053 values(3,'Carlos', ' M. Coronel', '2001-10-16', '56345678999')
INSERT INTO Author_23053 values(4,'Neil', ' Gaiman', '2005-07-16', '31345678999')
INSERT INTO Author_23053 values(5,'Terry', 'Pratchett', '2001-01-16', '12311278999')

INSERT INTO Book_23053 values(101,'Database Systems: Design, Implementation, & Management 13th Edition', '1337627909', '12.75', '2009-8-12')
INSERT INTO Book_23053 values(102,'Good Omens', '1060853964', '8.99', '2006-2-8')
INSERT INTO Book_23053 values(103,'American Gods', '2018391014', '9.45', '2001-6-19')
INSERT INTO Book_23053 values(104,'Database Principles', '3067829402', '20.13', '2013-6-23')

INSERT INTO Author_Book_23053 values(001,3, 101)
INSERT INTO Author_Book_23053 values(002,2, 101)
INSERT INTO Author_Book_23053 values(003,4, 102)
INSERT INTO Author_Book_23053 values(004,5, 102)
INSERT INTO Author_Book_23053 values(005,5, 103)
INSERT INTO Author_Book_23053 values(006,1, 104)
INSERT INTO Author_Book_23053 values(007,2, 104)
INSERT INTO Author_Book_23053 values(008,3, 104)

SELECT * from Book_23053
SELECT * from Author_23053
SELECT * from Author_Book_23053
SELECT min(price) from Book_23053
SELECT max(price) from Book_23053
SELECT authorID, count(authorID) books_by_each_author from Author_Book_23053 group by authorID