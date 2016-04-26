DROP TABLE IF EXISTS People;
DROP TABLE IF EXISTS Address;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS EmployeePosition;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS ItemsBought;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Brands;
DROP TABLE IF EXISTS Shipping;
DROP TABLE IF EXISTS Suppliers;
DROP TABLE IF EXISTS Jewelry;
DROP TABLE IF EXISTS Clothing;
DROP TABLE IF EXISTS Shoes;


CREATE TABLE IF NOT EXISTS Address (
zipCode char(5) NOT NULL,
city text NOT NULL,
state char(2) NOT NULL,
PRIMARY KEY (zipCode)
);

CREATE TABLE IF NOT EXISTS People (
people_id int NOT NULL UNIQUE,
fName text NOT NULL,
lName text NOT NULL,
DOB date NOT NULL,
phoneNumber char(12) NOT NULL,
emailAddress varchar(320),
streetAddress text NOT NULL,
zipCode char(5) NOT NULL,
PRIMARY KEY (people_id),
FOREIGN KEY (zipCode) REFERENCES Address(zipCode)
);

CREATE TABLE IF NOT EXISTS EmployeePosition (
position_id int NOT NULL UNIQUE,
positionName text NOT NULL UNIQUE,
PRIMARY KEY (position_id)
);

drop table if exists employees;
CREATE TABLE IF NOT EXISTS Employees (
people_id int NOT NULL,
wagePerHour decimal NOT NULL,
position_id int NOT NULL,
PRIMARY KEY (people_id),
FOREIGN KEY (position_id) REFERENCES EmployeePosition (position_id)
);

CREATE TABLE IF NOT EXISTS Customers (
people_id int NOT NULL,
coupons boolean NOT NULL,
moneySpent decimal NOT NULL,
dateSpent date NOT NULL,
PRIMARY KEY (people_id)
);

CREATE TABLE IF NOT EXISTS ItemsBought (
people_id int NOT NULL,
product_id int NOT NULL,
dateSold date NOT NULL,
PRIMARY KEY (people_id, product_id)
);


CREATE TABLE IF NOT EXISTS Brands (
brand_id int NOT NULL UNIQUE,
name text NOT NULL UNIQUE,
PRIMARY KEY (brand_id)
);

CREATE TABLE IF NOT EXISTS Products (
product_id int NOT NULL UNIQUE,
productName text NOT NULL,
color text NOT NULL,
costUSD decimal NOT NULL,
PRIMARY KEY (product_id)
);

CREATE TABLE IF NOT EXISTS Shipping (
product_id int NOT NULL,
supplier_id int NOT NULL,
dateShipped date NOT NULL,
priceUSD decimal NOT NULL,
expectedArrivalDate date NOT NULL,
PRIMARY KEY (product_id, dateShipped)
);

CREATE TABLE IF NOT EXISTS Suppliers (
supplier_id int NOT NULL,
supplierName text NOT NULL,
PRIMARY KEY (supplier_id)
);


--drop table if exists jewelry;
CREATE TABLE IF NOT EXISTS Jewelry (
product_id int NOT NULL,
brand_id int,
size text,
PRIMARY KEY (product_id),
FOREIGN KEY (brand_id) REFERENCES Brands
);

CREATE TABLE IF NOT EXISTS Clothing (
product_id int NOT NULL,
brand_id int NOT NULL,
size text NOT NULL,
PRIMARY KEY (product_id),
FOREIGN KEY (brand_id) REFERENCES Brands
);

CREATE TABLE IF NOT EXISTS Shoes (
product_id int NOT NULL,
brand_id int NOT NULL,
size decimal NOT NULL,
PRIMARY KEY (product_id),
FOREIGN KEY (brand_id) REFERENCES Brands
);


INSERT INTO Address (zipCode, city, state)
VALUES ('12342', 'Latham', 'NY'),
	('12110', 'Cohoes', 'NY'),
	('15434', 'Loudonville', 'NY'),
	('19426', 'Collegeville', 'PA'),
	('11255', 'Pittsburgh', 'PA'),
	('19876', 'Seattle', 'WA'),
	('13452', 'Baltimore', 'MD'),
	('14629', 'Miami', 'FL'),
	('12953', 'Portland', 'OR'),
	('90210', 'Beverly Hills', 'CA');


INSERT INTO People (people_id, fName, lName, DOB, phoneNumber, emailAddress, streetAddress, zipCode)
VALUES (100, 'Carlie', 'Maxwell', '1996-06-27', '111-123-2343', 'database@aol.com', '12 database lane', '12342'),
	(101, 'Tim', 'Reese', '1994-02-12', '112-256-2980', 'desktop@aol.com', '11 notebook lane', '12110'),
	(102, 'Rob', 'Bush', '1992-01-11', '125-246-2250', 'robbie@aol.com', '164 shoes drive', '15434'),
	(103, 'Lindsey', 'Hans', '1998-07-16', '254-142-5849', 'backpack@aol.com', '934 waterbottle drive', '19426'),
	(104, 'Renee', 'Savs', '1996-02-05', '516-253-3110', 'flower@yahoo.com', '243 comforter ave', '11255'),
	(105, 'Michelle', 'Marge', '1986-03-15', '518-383-9876', 'brush@aol.com', '1764 hero ave', '19876'),
	(106, 'Kerry', 'Forte', '1991-09-03', '734-937-1847', 'gameofthrones@gmail.com', '8437 ring ave', '13452'),
	(107, 'Jessie', 'James', '1973-06-17', '395-023-2034', 'guitar@aol.com', '3827 football court', '14629'),
	(108, 'Ryan', 'Reynolds', '1999-11-29', '611-584-2958', 'xoxo@aol.com', '2 drury lane', '12953'),
	(109, 'Blake', 'Lively', '1976-12-25', '777-234-9584', 'christmas@yahoo.com', '164 bond drive', '90210');



--DELETE FROM Employees;
INSERT INTO Employees (people_id, position_id, wagePerHour)
VALUES (100, 200, 14.50),
	(102, 201, 30.00),
	(103, 202, 25.67),
	(106, 208, 11.50),
	(108, 207, 10.00);


INSERT INTO EmployeePosition (position_id, positionName)
VALUES (200, 'General Manager'),
	(201, 'Assistant Manager'),
	(202, 'Cashier'),
	(203, 'Floor Leader'),
	(204, 'Regional Manager'),
	(205, 'Customer Service'),
	(206, 'Sales Associate'),
	(207, 'Stocker'),
	(208, 'Sales Manager'),
	(209, 'Team Leader');


INSERT INTO Customers (people_id, coupons, moneySpent, dateSpent)
VALUES (101, True, 1320.45, '2016-02-21'),
	(104, True, 88.22, '2016-05-08'),
	(105, False, 450.11, '2015-03-09'),
	(107, True, 269.09, '2015-12-25'),
	(109, False, 1245.67, '2016-08-10');
	

INSERT INTO ItemsBought (people_id, product_id, dateSold)
VALUES (101, 306, '2016-01-14'),
	(102, 304, '2016-01-14'),
	(104, 303, '2016-08-10'),
	(105, 300, '2015-03-09'),
	(107, 309, '2016-12-10'),
	(109, 301, '2016-04-21');

INSERT INTO Suppliers (supplier_ID, supplierName)
VALUES (500, 'FedEx'),
	(501, 'UPS'),
	(502, 'DHL Express'),
	(503, 'USPS');


--DELETE FROM Products;
INSERT INTO Products (product_id, productName, color, costUSD)
VALUES (300, 'Watch', 'Black', 145.60),
	(301, 'Ring', 'Silver', 400.60),
	(302, 'Wind-breaker', 'Blue', 95.10),
	(303, 'Earrings', 'Rose Gold', 65.00),
	(304, 'Tanktop', 'Red/White', 35.12),
	(305, 'V-neck', 'Brown', 115.10),
	(306, 'Belt', 'Silver', 500.60),
	(307, 'Oversized Sweater', 'Cream', 85.90),
	(308, 'Ripped Jeans', 'Black', 78.12),
	(309, 'Sneakers', 'Gold/Black', 92.10),
	(310, 'Flats', 'Blue/White', 52.10),
	(311, 'Heels', 'Black', 102.50),
	(312, 'Boat Shoes', 'Beige', 49.99),
	(313, 'Rain Boots', 'Yellow', 115.70);

--DELETE FROM SHIPPING;
INSERT INTO Shipping (product_id, supplier_ID, dateShipped, expectedArrivalDate, priceUSD)
VALUES (300, 503, '2016-05-25', '2016-05-28', 140.00),
	(301, 502, '2016-05-30', '2016-06-05', 395.00),
	(302, 500, '2016-02-06', '2016-02-10', 78.00),
	(303, 500, '2016-04-10', '2016-04-15', 50.00),
	(304, 501, '2016-08-05', '2016-08-11', 38.00),
	(305, 503, '2016-10-11', '2016-10-17', 114.00),
	(306, 500, '2016-11-12', '2016-11-18', 497.00),
	(307, 502, '2016-12-10', '2016-12-17', 84.00),
	(308, 502, '2016-01-05', '2016-01-12', 68.00),
	(309, 501, '2016-06-27', '2016-07-02', 80.00),
	(310, 503,'2016-01-20', '2016-01-24', 49.00),
	(311, 501,'2016-03-11', '2016-03-12', 98.00),
	(312, 500,'2016-04-13', '2016-04-21', 43.00),
	(313, 502,'2016-07-11', '2016-07-21', 101.00);


--DELETE FROM Brands;
INSERT INTO Brands (brand_id, name) 
VALUES (400, 'Fossil'),
	(401, 'Prada'),
	(402, 'Nautica'),
	(403, 'Ralph Lauren'),
	(404, 'Inc.'),
	(405, 'Kate Spade'),
	(406, 'Gucci'),
	(407, 'Free People'),
	(408, 'American Rag'),
	(409, 'Coach'),
	(410, 'Steve Madden'),
	(411, 'Sperry'),
	(412, 'Michael Kors');

--delete from jewelry;
INSERT INTO Jewelry (product_id, brand_id, size)
VALUES (300, 400, '50 mm'),
	(303, 403, '3.8 mm'),
	(301, 409, '7'),
	(306, 406, '30 in');


--DELETE FROM Clothing;
INSERT INTO Clothing (product_id, brand_id, size)
VALUES (302, 402, 'Medium'),
	(304, 401, 'Small'),
	(305, 407, 'Large'),
	(307, 409, 'X-Small'),
	(308, 400, 'Small');
	

INSERT INTO Shoes (product_id, brand_id, size)
VALUES 	(309, 403, 8),
	(310, 405, 7),
	(311, 412, 5),
	(312, 411, 10),
	(313, 409, 9);


--DROP VIEW IF EXISTS MostProfitableProducts;
CREATE VIEW MostProfitableProducts AS
	SELECT Products.productName, Products.costUSD - Shipping.priceUSD AS difference
	FROM Products, Shipping
	WHERE Products.product_id = Shipping.product_id
	ORDER BY difference DESC
	LIMIT 10;

--DROP VIEW IF EXISTS CustomersInNewYork;
CREATE VIEW CustomersInNewYork AS
	SELECT Address.state, COUNT(Address.state)
	FROM Address, Customers, people
	WHERE People.zipCode = Address.zipCode
	AND Customers.people_id = People.people_id
	AND Address.state = 'NY'
	GROUP BY Address.state;

--create a query to find where a product is selling most
SELECT address.city, address.state, products.productName, Count(products.product_id)
FROM products, itemsBought, customers, people, address
WHERE products.product_id = itemsBought.product_id
AND itemsBought.people_id = customers.people_id
AND customers.people_id = people.people_id
AND people.zipCode = address.zipCode
GROUP BY address.city, address.state, products.product_id, products.productName
ORDER BY products.product_id DESC;

--create a query to find out which supplierdelivers most products
SELECT suppliers.supplierName, Count(suppliers.supplierName)
FROM suppliers, shipping, products, itemsBought
WHERE suppliers.supplier_id = shipping.supplier_id
AND shipping.product_id = products.product_id
AND products.product_id = itemsBought.product_id
GROUP BY suppliers.supplierName
ORDER BY suppliers.supplierName DESC;

--security manager
CREATE ROLE employeeManager;
GRANT SELECT ON employees, people, customers, address, products, itemsBought, shipping, jewelry, clothing, shoes, brands
TO employeeManager;
GRANT INSERT, UPDATE ON employees, people, customers, address, products, jewelry, shoes, clothing
To employeeManager;

--security general employees
CREATE ROLE employees;
GRANT SELECT ON products, shipping, brands, itemsBought, jewelry, clothing, shoes
TO employees;

--security on customers
CREATE ROLE customers;
GRANT SELECT ON products, jewelry, clothing, shoes, brands
TO customers;


--insert date and returns what products were sold on that day
CREATE OR REPLACE FUNCTION datesOfProducts(date, refcursor) RETURNS refcursor AS 
$$
DECLARE
  dateOfProducts date 		:=$1;
  resultset refcursor 		:=$2;
BEGIN
  open resultset FOR
    SELECT itemsBought.dateSold, itemsBought.product_id, products.productName, products.color, products.costUSD
    FROM itemsBought, Products
    WHERE itemsBought.product_id = products.product_id
    AND dateOfProducts = itemsBought.dateSold;
  RETURN resultset;
 END
$$
Language plpgsql;

SELECT datesOfProducts('2016-01-14' , 'results');
FETCH ALL FROM results;

--type in a people id and check when their product will come in
CREATE OR REPLACE FUNCTION peopleProductArrivalDate(INT, refcursor) RETURNS refcursor AS 
$$
DECLARE
  person INT 		:=$1;
  resultset refcursor 		:=$2;
BEGIN
  open resultset FOR
    SELECT  people.people_id, people.fName, people.lName, products.productName, shipping.expectedArrivalDate 
    FROM people, customers, itemsBought, products, shipping
    WHERE people.people_id = customers.people_id
    AND customers.people_id = itemsBought.people_id
    AND itemsBought.product_id = products.product_id
    AND products.product_id = shipping.product_id
    AND person = people.people_id;
  RETURN resultset;
 END
$$
Language plpgsql;

SELECT peopleProductArrivalDate(101 , 'results');
FETCH ALL FROM results;

--update jewelry table
CREATE OR REPLACE FUNCTION addToJewelry()
RETURNS TRIGGER AS
$$
BEGIN 
  IF NEW.color = 'sterling silver' THEN
	INSERT INTO jewelry(product_id) 
	VALUES (NEW.product_id);
  END IF;
 RETURN NEW;
 END;
 $$
 LANGUAGE plpgsql;

--trigger for jewelry table
CREATE TRIGGER addToJewelry
AFTER INSERT ON Products
FOR EACH ROW 
EXECUTE PROCEDURE addToJewelry();

Insert into products (product_id, costUSD, color, productName)
values(314, 132.40, 'sterling silver', 'tiffany necklace');







	








