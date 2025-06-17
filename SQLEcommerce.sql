CREATE database Ecommerce

CREATE TABLE products (
  productID      INT PRIMARY KEY,
  name           NVARCHAR(50),
  description    NVARCHAR(60),
  price          DECIMAL(10,2),
  stockQuantity  INT
);

CREATE TABLE customers (
  customerID INT PRIMARY KEY,
  firstName  NVARCHAR(50),
  lastName   NVARCHAR(50),
  Email      NVARCHAR(100),
  address    NVARCHAR(100)
);

CREATE TABLE orders (
  orderID     INT PRIMARY KEY,
  customerID  INT,
  orderDate   DATE,
  totalAmount DECIMAL(10,2),
  FOREIGN KEY (customerID) REFERENCES customers(customerID)
);

CREATE TABLE order_items (
  orderItemID INT PRIMARY KEY,
  orderID     INT,
  productID   INT,
  quantity    INT,
  itemAmount  DECIMAL(10,2),
  FOREIGN KEY (orderID) REFERENCES orders(orderID),
  FOREIGN KEY (productID) REFERENCES products(productID)
);

CREATE TABLE cart (
  cartID     INT PRIMARY KEY,
  customerID INT,
  productID  INT,
  quantity   INT,
  FOREIGN KEY (customerID) REFERENCES customers(customerID),
  FOREIGN KEY (productID) REFERENCES products(productID)
);

INSERT INTO products VALUES
(1,'Laptop','High-performance laptop',800.00,10),
(2,'Smartphone','Latest smartphone',600.00,15),
(3,'Tablet','Portable tablet',300.00,20),
(4,'Headphones','Noise‑canceling',150.00,30),
(5,'TV','4K Smart TV',900.00,5),
(6,'Coffee Maker','Automatic coffee maker',50.00,25),
(7,'Refrigerator','Energy-efficient',700.00,10),
(8,'Microwave Oven','Countertop microwave',80.00,15),
(9,'Blender','High-speed blender',70.00,20),
(10,'Vacuum Cleaner','Bagless vacuum cleaner',120.00,10);
SELECT * from products


INSERT INTO customers VALUES
(1,'John','Doe','johndoe@example.com','123 Main St, City'),
(2,'Jane','Smith','janesmith@example.com','456 Elm St, Town'),
(3,'Robert','Johnson','robert@example.com','789 Oak St, Village'),
(4,'Sarah','Brown','sarah@example.com','101 Pine St, Suburb'),
(5,'David','Lee','david@example.com','234 Cedar St, District'),
(6,'Laura','Hall','laura@example.com','567 Birch St, County'),
(7,'Michael','Davis','michael@example.com','890 Maple St, State'),
(8,'Emma','Wilson','emma@example.com','321 Redwood St, Country'),
(9,'William','Taylor','william@example.com','432 Spruce St, Province'),
(10,'Olivia','Adams','olivia@example.com','765 Fir St, Territory');
SELECT * from customers;

INSERT INTO orders VALUES
(1,1,'2023-01-05',1200.00),
(2,2,'2023-02-10',900.00),
(3,3,'2023-03-15',300.00),
(4,4,'2023-04-20',150.00),
(5,5,'2023-05-25',1800.00),
(6,6,'2023-06-30',400.00),
(7,7,'2023-07-05',700.00),
(8,8,'2023-08-10',160.00),
(9,9,'2023-09-15',140.00),
(10,10,'2023-10-20',1400.00);
SELECT * from orders;

INSERT INTO order_items VALUES
(1,1,1,2,1600.00),
(2,1,3,1,300.00),
(3,2,2,3,1800.00),
(4,3,5,2,1800.00),
(5,4,4,4,600.00),
(6,4,6,1,50.00),
(7,5,1,1,800.00),
(8,5,2,2,1200.00),
(9,6,10,2,240.00),
(10,6,9,3,210.00);
SELECT * from order_items;

INSERT INTO cart VALUES
(1,1,1,2),
(2,1,3,1),
(3,2,2,3),
(4,3,4,4),
(5,3,5,2),
(6,4,6,1),
(7,5,1,1),
(8,6,10,2),
(9,6,9,3),
(10,7,7,2);
SELECT * from cart;


UPDATE products SET price = 800.00 WHERE name = 'Refrigerator';
SELECT * FROM products WHERE name='Refrigerator';

DELETE FROM cart WHERE customerID = 3;
SELECT * FROM cart ;

SELECT * FROM products WHERE price < 100;

SELECT * FROM products WHERE StockQuantity > 5;

SELECT * FROM orders WHERE totalAmount BETWEEN 500 AND 1000;

SELECT * FROM products WHERE name LIKE '%r';

SELECT * FROM cart WHERE customerID = 5;

SELECT DISTINCT cu.*
FROM customers cu
JOIN orders o ON cu.customerID = o.customerID
WHERE o.orderDate BETWEEN '2023-01-01' AND '2023-12-31';

SELECT MIN(StockQuantity) AS MIN_STOCK FROM products;

SELECT o.customerID, SUM(o.totalAmount) AS totalAmountSpent FROM orders o GROUP BY customerID;

SELECT o.customerID, AVG(o.totalAmount) AS Averageamount FROM orders o GROUP BY customerID;

SELECT customerID, COUNT(*) AS cnt FROM orders GROUP BY customerID;

SELECT o.customerID, MAX(o.totalAmount) AS totalAmountSpent FROM orders o GROUP BY customerID;

SELECT customerID, SUM(totalAmount) AS Total FROM orders GROUP BY customerID HAVING SUM (totalAmount)>1000;

SELECT * FROM products WHERE productID NOT IN (SELECT productID FROM cart);

SELECT * FROM customers WHERE customerID NOT IN (SELECT customerID FROM orders);

SELECT p.productID,p.name,SUM(oi.itemAmount) * 100.0 / (SELECT SUM(itemAmount) FROM order_items) AS revenuePercent
FROM products p JOIN order_items oi ON p.productID = oi.productID
WHERE p.productID = 1
GROUP BY p.productID, p.name;

SELECT * FROM products WHERE stockQUANTITY <5;

SELECT customerID from customers WHERE customerID IN(SELECT customerID FROM orders WHERE totalAmount >1000);







