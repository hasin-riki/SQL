create table lawyer_23010(
lawyerId varchar(10),
lawyerName varchar(max),
joiningDate datetime,
birthCountry varchar(max),
licenseToPractice varchar(max),
salary int,
constraint pk_lawyer_23010 primary key (lawyerId)
);

create table client_23010(
clientId varchar(10),
clientName varchar(max),
country varchar(max),
lawyerId varchar(10),
constraint pk_client_23010 primary key (clientId),
constraint fk_lawyer_23010 foreign key (lawyerId) references lawyer_23010 (lawyerId)
);

delete client_23010
insert into lawyer_23010 values ('L1', 'Harry', '30 December, 2009', 'USA', 'USA', 120000)
insert into lawyer_23010 values ('L2', 'James', '30 December, 2008', 'Pakistan', 'Pakistan', 100000)
insert into lawyer_23010 values ('L3', 'Saul', '1 January, 2007', 'UAE', 'USA', 90000)
insert into lawyer_23010 values ('L4', 'Harvey', '1 January, 2010', 'USA', 'USA', 150000)
insert into lawyer_23010 values ('L5', 'Anna', '3 January, 2010', 'Pakistan', 'USA', 110000)

insert into client_23010 values ('C1', 'Nike', 'Switzerland', 'L3')
insert into client_23010 values ('C2', 'Puma', 'Italy', 'L4')
insert into client_23010 values ('C3', 'Sephora', 'USA', 'L1')
insert into client_23010 values ('C4', 'Adidas', 'USA', 'L1')
insert into client_23010 (clientId, clientName, country) values ('C5', 'Macys', 'USA')
insert into client_23010 values ('C6', 'H&M', 'USA', 'L2')
insert into client_23010 values ('C7', 'Unilever', 'India', 'L3')
insert into client_23010 values ('C8', 'Tapal', 'Pakistan', 'L2')
insert into client_23010 values ('C9', 'Shan Foods', 'Pakistan', 'L2')
insert into client_23010 (clientId, clientName) values ('C10', 'Zara')
insert into client_23010 values ('C11', 'Nokia', 'Switzerland', 'L4')

select * from lawyer_23010
select * from client_23010
select c.clientName from lawyer_23010 l join client_23010 c on l.lawyerId=c.lawyerId
select clientName from client_23010
select * from lawyer_23010 l left join client_23010 c on l.lawyerId=c.lawyerId where DATEDIFF(year,l.joiningDate, GETDATE())>13 order by lawyerName asc
select * from lawyer_23010 l full join client_23010 c on l.lawyerId=c.lawyerId
select * from lawyer_23010 l full join client_23010 c on l.lawyerId=c.lawyerId where l.licenseToPractice=c.country
select * from lawyer_23010 where licenseToPractice='USA'
select * from lawyer_23010 where licenseToPractice=birthCountry
select * from lawyer_23010 l join lawyer_23010 ll on l.birthCountry=ll.birthCountry
