/* Hasin Zaman -- 23010 -- Lab Task 3 */
create table person_23010(
personId int,
firstName varchar(max),
lastName varchar(max),
CNIC numeric unique,
dateOfBirth datetime,
contactNumber numeric check(len(contactNumber)=11),
email varchar(max),
constraint pk_person_23010 primary key (personId)
);

create table bank_23010(
bankId int,
name varchar(max),
establishedIn datetime,
address varchar(max),
constraint pk_bank_23010 primary key (bankId)
);

create table person_bank_23010(
personId int,
bankId int,
accountType varchar(max),
currentBalance numeric(15,2),
constraint fk_person_23010 foreign key (personId) references person_23010(personId),
constraint fk_bank_23010 foreign key (bankId) references bank_23010(bankId)
);

insert into bank_23010 values(101, 'XYZ Bank', '02 August, 2002', 'B-68, Street-30')
insert into bank_23010 values(102, 'MNO Bank', '07 June, 2006', 'A-64, Street-10')
insert into bank_23010 values(103, 'ABC Bank', '03 March, 2008', 'C-118, Street-20')
insert into bank_23010 values(104, 'EFG Bank', '20 August, 2012', 'D-10, Street-3')

insert into person_23010 values(1, 'Harry', 'Potter', 222015282961, '30 July, 1993', 23456123451, 'hbsdhb@hdhbd.com')
insert into person_23010 values(2, 'Ali', 'Hassan', 421015282962, '04 May, 1984', 25648632155, 'bdjh@kjdsbk.com')
insert into person_23010 values(3, 'Eric', 'Hale', 322315282963, '02 September, 1956', 55648754655, 'skjkd@abdkh.com')
insert into person_23010 values(4, 'Stephen', 'Hawkings', 412015282964, '18 January, 2000', 47562148963, 'sdhbda@nkjab.com')
insert into person_23010 values(5, 'Saad', 'Ahmed', 422015202965, '15 October, 1976', 78965412314, 'ahbdhab@dnajk.com')

insert into person_bank_23010 values(1, 102, 'current', 345.7)
insert into person_bank_23010 values(2, 102, 'current', 101.1)
insert into person_bank_23010 values(2, 101, 'savings', 1200.34)
insert into person_bank_23010 values(3, 104, 'current', 875.45)
insert into person_bank_23010 values(3, 104, 'savings', 500)
insert into person_bank_23010 values(4, 102, 'savings', 2500.75)
insert into person_bank_23010 values(5, 101, 'current', 610.25)

select * from person_23010
select * from bank_23010
select * from person_bank_23010
select * from person_23010, person_bank_23010 where person_23010.personId=person_bank_23010.personId
select * from bank_23010, person_bank_23010 where bank_23010.bankId=person_bank_23010.bankId
select * from person_23010, bank_23010, person_bank_23010 where person_23010.personId=person_bank_23010.personId and bank_23010.bankId=person_bank_23010.bankId
select datediff(year, establishedIn, getdate()) as Years_since_establishment from bank_23010
select datediff(month, dateOfBirth, getdate()) as Age_In_Months from person_23010
select person_23010.firstName, person_23010.lastName, person_bank_23010.accountType from person_23010, person_bank_23010 where person_bank_23010.accountType='current' and person_23010.personId=person_bank_23010.personId

update person_23010 set dateOfBirth=dateadd(year, -90, dateOfBirth) where dateOfBirth='18 January, 2000'
select dateOfBirth from person_23010

select *, floor(currentBalance) as Current_Balance from person_bank_23010
