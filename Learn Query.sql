
select * from customers;
select country, sum(score) from customers group by country;
select country, sum(score) as total_score, count(id) as total_customers from customers group by country;

-- TOP to filter rows 
select top 3 * from customers;
select top 3 * from customers where score > 400 
order by score desc;
select max(id) from customers
--insert into customers(id,first_name,country,score)values(
--(select max(id) from customers)+1,'Donny','Europe','1500'
--);

select count(id) from customers;
--delete from customers where id = '7';

select * from customers;
--insert into customers(id,first_name,country,score) values ((select max(id) from customers)+1,
--'Pier','USA','2000');

-- Find the average score for each country considering only customers with a score not equal 
-- to 0 and return only those countries with an average score greater than 430

select * from customers;
select id,first_name,country,score from customers;

select country,avg(score) as Average_Score from customers
where score != 0 
group by country
having avg(score) > 430;


/* DDL */

-- Create New Table 
-- Name Table, Type Data, Constraint 

Create table persons (
	id INT not null, 
	person_name varchar(50) not null, 
	number varchar(50) not null
	constraint pk_person PRIMARY KEY(id)
);

--select * from persons;
--select max(id) from persons;
---- syntax coalesce(null,0);
--select coalesce(max(id),0) from persons;

--insert into persons(id,person_name,number) values 
--(coalesce((select max(id) from persons),0)+1,'Dhani','08123020202');


-- ALTER TABLE to add,drop coloumn in existing table 

ALTER TABLE persons ADD email VARCHAR(50) not null;

select * from persons;

ALTER TABLE persons DROP column phone;
select * from persons;

-- DROP to delete table 
drop table persons;

/* DML (Data Manipulation Language) */ 

-- INSERT 
select * from customers;
insert into customers(id,first_name,country,score) values 
(coalesce((select max(id) from customers),0)+1,'Geer','Indonesian','400');

-- Kalau double insert, id harus auto increment atau check dahulu max id nya
select * from customers;
select max(id) from customers;
select top 1 id from customers order by id desc;
insert into customers(id,first_name,country,score) values 
(10,'Agung','Indonesian','600'),
(11,'Gong','Indonesian','800');
-- bisa juga 
insert into customers(id,first_name,country,score) values 
((select top 1 id from customers order by id desc)+1,'Heri','Indonesian','1000'),
((select top 1 id from customers order by id desc)+2,'Heni','Indonesian','1200');

-- Insert tapi ambil value dari customers ke persons

select * from persons;

--insert into persons(id,person_name,number,email,birth_date)
--select id,first_name,'Unknown Phone Number',null,null from customers;


-- UPDATE 
select * from customers
update customers set score = '1000' where id = 13;

-- Update 2 values 
update customers set score = null, country = null where id ='13'

-- DELETE
select * from customers
delete from customers where id = '13';

-- DELETE ALL ROWS IN TABLE 
select * from persons
truncate table persons


