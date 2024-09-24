create table PURCHASE_23010(
	PUR_ID int,
	PDATE date,
	PRODUCT varchar(50),
	QTY int,
	RATE int,
	AMOUNT int
);

insert into PURCHASE_23010 values(101, '2014-08-01', 'KIWI', 5, 80, 400)
insert into PURCHASE_23010 values(102, '2014-08-05', 'LUX', 2, 60, 120)
insert into PURCHASE_23010 (PUR_ID, PDATE, QTY, RATE, AMOUNT) values(103, '2014-08-15', 1, 85, 85)
insert into PURCHASE_23010 (PUR_ID, PDATE, PRODUCT, QTY, RATE) values(104, '2014-08-22', 'KIWI', 3, 80)
insert into PURCHASE_23010 (PUR_ID, PDATE, PRODUCT, QTY, AMOUNT) values(105, '2014-09-01', 'SURF', 2, 200)

select * from PURCHASE_23010
select * from PURCHASE_23010 order by RATE
select * from PURCHASE_23010 order by AMOUNT desc
select * from PURCHASE_23010 where AMOUNT > 100
select * from PURCHASE_23010 where PDATE = '2014-08-05' and QTY = 2
select * from PURCHASE_23010 where PDATE = '2014-08-01' or PDATE = '2022-08-15'
select distinct PRODUCT from PURCHASE_23010 where PRODUCT IS NOT NULL
select PUR_ID as PURCHASE_ID, PDATE, PRODUCT, QTY as PRODUCT_QUANTITY, RATE, AMOUNT from PURCHASE_23010
select AMOUNT*0.12 as DISCOUNT from PURCHASE_23010 where AMOUNT IS NOT NULL

select * from PURCHASE_23010 where PRODUCT like 'K%'
select * from PURCHASE_23010 where PRODUCT like '%I'
select * from PURCHASE_23010 where PRODUCT like '_U%'
select * from PURCHASE_23010 where PRODUCT like '%X%' and PRODUCT like '%U%'
select PRODUCT,AMOUNT from PURCHASE_23010 where AMOUNT between 100 and 300
select * from PURCHASE_23010 where RATE in (80, 60)
update PURCHASE_23010 set QTY=5 where PUR_ID=101
delete from PURCHASE_23010 where PRODUCT is NULL
alter table PURCHASE_23010 add DISCOUNT float
update PURCHASE_23010 set DISCOUNT=AMOUNT*0.12 where AMOUNT is not NULL
alter table PURCHASE_23010 drop column DISCOUNT

update PURCHASE_23010 set PRODUCT='SURF EXCEL' where PRODUCT is NULL
update PURCHASE_23010 set AMOUNT=160 where PDATE='2014-08-22'
update PURCHASE_23010 set RATE=100 where PUR_ID=105
select * from PURCHASE_23010 where PRODUCT like '%SURF%'
select * from PURCHASE_23010 where QTY IN(1,3,5)
select * from PURCHASE_23010 where AMOUNT!=80
select PRODUCT,AMOUNT from PURCHASE_23010 where AMOUNT between 80 and 150
delete from PURCHASE_23010 where PRODUCT='KIWI'


