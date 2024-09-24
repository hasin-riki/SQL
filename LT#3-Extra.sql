/* Hasin Zaman -- 23010 -- Lab 3 */
create table author(
authorId int,
firstName varchar(max) not null,
lastName varchar(max) not null,
dateOfBirth datetime,
contactNumber numeric check(len(contactNumber)=11),
constraint pk_author primary key (authorId)
);

create table book(
bookId int,
title varchar(max) not null,
ISBN numeric not null unique check(len(ISBN)=10),
price numeric(6,2) not null,
publishingDate datetime,
constraint pk_book primary key (bookId)
);

create table author_book(
authorBookId int unique,
authorId int,
bookId int,
constraint fk_author foreign key (authorId) references author(authorId),
constraint fk_book foreign key (bookId) references book(bookId)
);

insert into book values(101, 'Database Systems: Design, Implementation, & Management 13th Edition', 1337627909, 12.75, '12 August, 2009')
insert into book values(102, 'Good Omens', 1060853964, 8.99, '8 February, 2006')
insert into book values(103, 'American Gods', 2018391014, 9.45, '19 June, 2001')
insert into book values(104, 'Database Principles', 3067829402, 20.13, '23 June, 2013')

insert into author values(1, 'Peter', 'Rob', '20 August, 1990', 92557684341)
insert into author values(2, 'Stephen', 'Morris', '11 March, 1996', 25344762457)
insert into author values(3, 'Carlos', 'M. Coronel', '05 September, 1985', 21563487921)
insert into author values(4, 'Neil', 'Gaiman', '10 February, 1997', 12451318421)
insert into author values(5, 'Terry', 'Pratchett', '29 June, 2001', 12454213542)

insert into author_book values(001, 3, 101)
insert into author_book values(002, 2, 101)
insert into author_book values(003, 5, 102)
insert into author_book values(004, 4, 102)
insert into author_book values(005, 4, 103)
insert into author_book values(006, 1, 104)
insert into author_book values(007, 2, 104)
insert into author_book values(008, 3, 104)

select * from author
select * from book
select * from author_book
select * from author, author_book where author.authorId=author_book.authorId
select * from book, author_book where book.bookId=author_book.bookId
select * from author, book, author_book where author.authorId=author_book.authorId and book.bookId=author_book.bookId
select datediff(year, dateOfBirth, getdate()) as Age from author
