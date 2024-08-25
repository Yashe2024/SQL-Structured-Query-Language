
CREATE TABLE Manufacturers (
  Code INTEGER,
  Name VARCHAR(255) NOT NULL,
  PRIMARY KEY (Code)   
);

CREATE TABLE Products (
  Code INTEGER,
  Name VARCHAR(255) NOT NULL ,
  Price DECIMAL NOT NULL ,
  Manufacturer INTEGER NOT NULL,
  PRIMARY KEY (Code), 
  FOREIGN KEY (Manufacturer) REFERENCES Manufacturers(Code)
) ;

INSERT INTO Manufacturers(Code,Name) VALUES(1,'Sony');
INSERT INTO Manufacturers(Code,Name) VALUES(2,'Creative Labs');
INSERT INTO Manufacturers(Code,Name) VALUES(3,'Hewlett-Packard');
INSERT INTO Manufacturers(Code,Name) VALUES(4,'Iomega');
INSERT INTO Manufacturers(Code,Name) VALUES(5,'Fujitsu');
INSERT INTO Manufacturers(Code,Name) VALUES(6,'Winchester');

INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(1,'Hard drive',240,5);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(2,'Memory',120,6);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(3,'ZIP drive',150,4);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(4,'Floppy disk',5,6);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(5,'Monitor',240,1);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(6,'DVD drive',180,2);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(7,'CD drive',90,2);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(8,'Printer',270,3);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(9,'Toner cartridge',66,3);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(10,'DVD burner',180,2);
-- 1.1 Select the names of all the products in the store.
SELECT name 
  FROM [tempdb].[dbo].[Products]

 -- 1.2 Select the names and the prices of all the products in the store.
 SELECT name,Price
  FROM [tempdb].[dbo].[Products]

 -- 1.3 Select the name of the products with a price less than or equal to $200.
  SELECT Name from Products where price <= 200;
  
  -- 1.4 Select all the products with a price between $60 and $120.
  SELECT Name from Products where price between 60 and 200;
  
  -- 1.5 Select the name and price in cents (i.e., the price must be multiplied by 100).
  SELECT name,Price * 100
  FROM [tempdb].[dbo].[Products]

  select name, concat(price*100, ' cents') from products;

  -- 1.6 Compute the average price of all the products.
   SELECT avg(Price) as average_price
  FROM [tempdb].[dbo].[Products]
  select sum(price)/count(price) as AVERAGE_PRICE from products;

  -- 1.7 Compute the average price of all products with manufacturer code equal to 2.
  SELECT avg(Price) as average_price
  FROM [tempdb].[dbo].[Products] where Manufacturer =2;

  -- 1.8 Compute the number of products with a price larger than or equal to $180.

SELECT count(Price) as Count_price
  FROM [tempdb].[dbo].[Products] where Price >=180;

  -- 1.9 Select the name and price of all products with a price larger than or equal to $180, 
  --and sort first by price (in descending order), and then by name (in ascending order).

  SELECT name, price
  FROM [tempdb].[dbo].[Products] where Price >=180
   order by price desc, name asc;

 -- 1.10 Select all the data from the products, including all the data for each product's manufacturer.
select a.*, b.name from products a join Manufacturers b on(a.manufacturer = b.code);
select a.*, b.name from products a, Manufacturers b where a.manufacturer = b.code;

 --1.11 Select the product name, price, and manufacturer name of all the products.
 select a.name, a.price, b.name from products a join Manufacturers b on(a.manufacturer = b.code);

 SELECT Products.Name, Price, Manufacturers.Name
   FROM Products INNER JOIN Manufacturers
   ON Products.Manufacturer = Manufacturers.Code;

   -- 1.12 Select the average price of each manufacturer's products, showing only the manufacturer's code.
 
 SELECT avg(Price) as average_price, Manufacturer
  FROM Products group by Manufacturer;
  
  -- 1.13 Select the average price of each manufacturer's products, showing the manufacturer's name.
  select avg(a.price), b.name 
from Products a join Manufacturers b 
on a.manufacturer = b.code
group by b.name;

-- 1.14 Select the names of manufacturer whose products have an average price larger than or equal to $150.
 select avg(a.price), b.name 
from Manufacturers b join Products a 
on b.code = a.Manufacturer
group by b.name
having avg(a.price)>=150;

-- 1.15 Select the name and price of the cheapest product.
select name, price from Products 
where price = (
select min(price)
from products);

-- 1.16 Select the name of each manufacturer along with the name and price of its most expensive product.

select name, price from Products -- for single product
where price = (
select max(price)
from products);

select max_price_mapping.name as manu_name, max_price_mapping.price, products_with_manu_name.name as product_name
from 
    (SELECT Manufacturers.Name, MAX(Price) price
     FROM Products, Manufacturers
     WHERE Manufacturer = Manufacturers.Code
     GROUP BY Manufacturers.Name)
     as max_price_mapping
   left join
     (select products.*, manufacturers.name manu_name
      from products join manufacturers
      on (products.manufacturer = manufacturers.code))
      as products_with_manu_name
 on
   (max_price_mapping.name = products_with_manu_name.manu_name
    and
    max_price_mapping.price = products_with_manu_name.price); 


	-- 1.17 Add a new product: Loudspeakers, $70, manufacturer 2.
	insert into products
	values( 11, 'Loudspeakers', 70, 2)

	-- 1.18 Update the name of product 8 to "Laser Printer"
	update products
	set name =  'Laser Printer'
	where code = 8;

	-- 1.19 Apply a 10% discount to all products.
	update products 
	set price = 0.9* price;

	-- 1.20 Apply a 10% discount to all products with a price larger than or equal to $120.
		update products 
	set price = 0.9* price 
	where price >=120;