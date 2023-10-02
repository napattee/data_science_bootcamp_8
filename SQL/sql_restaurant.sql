https://replit.com/@NapatTeekasuk/bootcampbatch08sqlrestaurant#main.sql

--create table & insert table
.mode column
CREATE TABLE IF NOT EXISTS customers (
    customerID int,
    name text,
    city text
);
INSERT INTO customers VALUES 
    (1, "Lebron", "Los Angeles"),
    (2, "Taeyeon", "Seoul"),
    (3, "IU", "Seoul"),
    (4, "Rashford", "Manchester"),
    (5, "Salah", "Liverpool"),
    (6, "Baifern", "Bangkok");

CREATE TABLE IF NOT EXISTS invoices (
    innvoiceID int unique,
    customerID int,
    invoiceDate date,
    orderID int,
    Total real) 

INSERT INTO invoices VALUES 
    (1, 1, "2023-01-12", 1, 15),
    (2, 2, "2023-01-07", 2, 9),
    (3, 3, "2023-02-06", 3, 6),
    (4, 4, "2023-03-16", 4, 8),
    (5, 5, "2023-04-28", 5, 8),
    (6, 6, "2023-05-31", 6, 4); 


CREATE TABLE IF NOT EXISTS orders (
    orderId int unique,
    innvoiceID int,
    menuID int,
    unitPrice real,
    quantity int);

  INSERT INTO orders VALUES 
    (1, 1, 1, 7.5, 2),
    (2, 2, 2, 9, 1),
    (3, 3, 3, 6, 1),
    (4, 4, 4, 2, 4),
    (5, 5, 5, 4, 2),
    (6, 6, 6, 4, 1); 
select * from orders; 

CREATE TABLE IF NOT EXISTS menu (
    menuID int,
    menuName text,
    unitPrice real
  );

INSERT INTO menu VALUES 
  (1, "hot dog",  7.5),
  (2, "steak",    9),
  (3, "burger",   6),
  (4, "cookie",   2),
  (5, "ice cream",4),
  (6, "sandwich", 4);*/

--display all tables
SELECT * FROM customers;
SELECT * FROM invoices;
SELECT * FROM orders;
SELECT * FROM menu;
  
--aggregate functions
select
  COUNT(*),
  MIN(ord.unitPrice),
  MAX(ord.unitPrice),
  SUM(inv.total),
  AVG(inv.total)
from invoices inv
join orders ord 
on inv.innvoiceID = ord.innvoiceID; 

--join
select
  A.Name,
  D.menuName,
  C.quantity,
  C.unitPrice,
  B.Total
from customers A
join invoices B on A.customerID = B.customerID
join orders C   on B.orderID    = C.orderID
join menu D     on C.menuID     = D.menuID;

--subquery
select 
  A.Name,
  B.Total
from (select * from customers 
      where city LIKE 'L%') A
join (select * from invoices
      where STRFTIME("%Y",invoiceDate) = "2023") B
on A.customerID = B.customerID;

--with
with A AS (select * from customers 
          where city like 'L%'),
     B AS (select * from invoices
          where STRFTIME("%Y",invoiceDate) = "2023")

select 
  A.Name,
  B.Total
From A join B ON A.customerID = B.customerID;
