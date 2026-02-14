-- Mochammad Fariz Zulfiannur 
-- Learn SQL to be advanced using a SQL 
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

/* ========== FILTERING DATA ============== */

-- COMPARISON OPERATOR
-- Retrieve all customers from Germany
select * from customers where country = 'Germany';

-- Retrieve all customers who are not from Germany 
select * from customers where country <> 'Germany';
select * from customers where country != 'Germany';

 --Retrieve all customers with a score greater than 500
select * from customers where score > 500;

 --Retrieve all customers with a score of 500 or more 
select * from customers where score >= 500;

 --Retrieve all customers with a score less than 500
 select * from customers where score < 500;

  --Retrieve all customers with a score of 500 or under
  select * from customers where score <= 500;

  -- LOGICAL OPERATORS
  -- Retrieve all customers who are from the USA AND have a score greater than 500
  select * from customers where country = 'USA' and score > 500;
  
  -- Retrieve all customers who are either from the USA OR have a score greater than 500
  select * from customers where country = 'USA' or score > 500;

  -- Retrieve all customers with a score not less than 500
  select * from customers where not score < 500;

  -- RANGE OPERATORS 
  -- Retrive all customers whose score falls in the range between 100 and 500
  select * from customers where score >= 100 and score <= 500;
  select * from customers where score between 100 and 500;

  -- Retrieve all customers from either Germany or USA 
  select * from customers where country = 'Germany' or country = 'USA';
  select * from customers where country in ('Germany','USA');

  -- Retrieve all customers from neither Germany or USA 
  select * from customers where country not in ('Germany','USA');

  -- Find all customers whose first name starts with 'M' 
  select * from customers; 
  select * from customers where first_name like 'M%';

  -- Find all customers whose first name ends with 'n'
  select * from customers
  select * from customers where first_name like '%n';

  -- Find all customers whose first name contains 'r'
  select * from customers
  select * from customers where first_name like '%r%';

  -- Find all customers whose first name has 'r' in the third position
  select * from customers where first_name like '%__r%';

  /* SQL JOINS */ 
  -- No Join
  select * from orders
  select * from customers

  -- inner Join
  select c.id, c.first_name, o.order_id, o.sales from customers c inner join orders o
  on c.id = o.customer_id;

  -- left join 
  -- Get all customers along with their orders, including those without orders
	  select c.id, c.first_name, o.order_id, o.sales from customers c left join orders o
	  on c.id = o.customer_id;	

  -- right Join 
  -- Get all customers along with their orders, including orders without matching customers 
	select c.id, c.first_name, o.order_id, o.sales from customers c right join orders o
	on c.id = o.customer_id;	

 -- task 
 -- Get all customers along with their orders, including orders without matching customers (Using 
 -- left join)
 select c.id, c.first_name, o.order_id, o.sales from orders o left join customers c 
 on c.id = o.customer_id;	

 -- full join 
 -- Get all customers and all orders, even if there's no match 
 select c.id, c.first_name, o.order_id, o.sales from customers c full join orders o 
 on c.id = o.customer_id;

 -- Left Anti Join
 -- Get all customers who haven't place any orders 
 select * from customers c left join orders o 
 on c.id = o.customer_id where o.customer_id is null;

 -- Right Anti Join 
 -- Get all order without matching customers 
 select * from customers c right join orders o 
 on c.id = o.customer_id where c.id is null;

 -- task
-- Get all order without matching customers (Must use Left Join)
select * from orders o left join customers c on c.id = o.customer_id
where c.id is null;

-- FULL ANTI JOIN
-- Find customers without orders and orders without customers 
select * from customers c full join orders o
on c.id = o.customer_id where c.id is null or o.customer_id is null;

-- Get all customers along with their orders, 
-- But only for customers who have placed an orders (without inner join)
select * from customers c full join orders o 
on c.id = o.customer_id where c.id is not null and o.customer_id is not null;

-- CROSS JOIN 
-- Generate all possible combinations of customers and orders 
select * from customers c cross join orders o;

-- Multiple Table Joins 
-- Use SalesDB 
-- Retrieve a list of all orders, along with the related customers, 
-- product, and employee details : 
-- Foreach : Order ID, Customer's Name, Product Name, Sales Amount, Product price, and Salesperson's name
select * from Sales.Customers;
select * from sales.Employees;
select * from sales.Orders;
select * from sales.Products;
SELECT * from sales.OrdersArchive;
select * from sales.Orders so left join sales.Customers sc on
so.CustomerID = sc.CustomerID left join sales.Products sp
on so.ProductID = sp.ProductID left join sales.Employees se
on so.SalesPersonID = se.EmployeeID;

select so.OrderID, SC.FirstName as Customers_Name,sp.Product as Product_Name,
so.Sales as Sales_Amount, sp.Price as Product_Price, se.FirstName as Salespersons_Name
from sales.Orders so left join sales.Customers sc on
so.CustomerID = sc.CustomerID left join sales.Products sp
on so.ProductID = sp.ProductID left join sales.Employees se
on so.SalesPersonID = se.EmployeeID;


/* SQL SET OPERATORS */
-- Set Operator Rules
select FirstName, LastName from sales.Customers 
union 
select FirstName, LastName from sales.Employees

-- Must same the type data 
select CustomerID, LastName from Sales.Customers 
union 
select FirstName, LastName from sales.Employees;
-- error bcz customerID is a type data INT and FirstName is a type data varchar

-- First query is display as a coloumn name 
select firstname as First_name, LastName from Sales.Customers 
union 
select FirstName, LastName from sales.Employees;

-- Order by can be used only once
select firstname as First_name, LastName from Sales.Customers as sc
union 
select FirstName, LastName from sales.Employees as se
order by sc.FirstName asc;

-- UNION 
-- Combine the data from employees and customers into one table 
select * from sales.Customers;
select * from sales.Employees;
select FirstName,LastName,score from sales.Customers sc
union 
select FirstName,LastName, null from sales.Employees se;

select FirstName,LastName from sales.Employees se
union
select FirstName,LastName from sales.Customers sc;

-- UNION 
-- Combine the data from employees and customers into one table, including duplicates 
select FirstName,LastName from sales.Employees se
union all
select FirstName,LastName from sales.Customers sc;

-- Except 
-- Find employees who are not customers at the same time 
select FirstName,LastName from sales.Employees;
except 
select FirstName,LastName from sales.Customers;

-- insert into sales.Customers(CustomerID,FirstName,LastName) values 
-- ((select top 1 customerID from sales.Customers order by CustomerID desc)+1,'Carol','Konlak');
select * from sales.Customers;

--delete from sales.Customers where FirstName = 'Carol' and LastName = 'Konlak';

-- INTERSECT 
-- Find the employees, who are also Customers
select FirstName,LastName from sales.Customers
intersect 
select FirstName,LastName from sales.Employees

-- USE CASE COMBINE INFORMATION (MERGE DATA)
-- Orders are stored in separate tables (Orders and OrdersArchive). 
-- Combine all orders into one reports without duplicates

select * from sales.Orders;
select * from sales.OrdersArchive;

select * from sales.Orders
union
select * from sales.OrdersArchive;

select 'OrderTable' as OrderTable,
        [OrderID]
      ,[ProductID]
      ,[CustomerID]
      ,[SalesPersonID]
      ,[OrderDate]
      ,[ShipDate]
      ,[OrderStatus]
      ,[ShipAddress]
      ,[BillAddress]
      ,[Quantity]
      ,[Sales]
      ,[CreationTime]
from sales.Orders
union 
SELECT 'OrderArchiveTable' as OrderArchiveTable,
        [OrderID]
      ,[ProductID]
      ,[CustomerID]
      ,[SalesPersonID]
      ,[OrderDate]
      ,[ShipDate]
      ,[OrderStatus]
      ,[ShipAddress]
      ,[BillAddress]
      ,[Quantity]
      ,[Sales]
      ,[CreationTime]
FROM sales.OrdersArchive
order by OrderID asc
