-- Insert Countries
INSERT INTO Country (Name) VALUES ('India');
INSERT INTO Country (Name) VALUES ('USA');
INSERT INTO Country (Name) VALUES ('UK');

-- Insert Product Categories
INSERT INTO ProductCategory (CategoryName) VALUES ('Electronics');
INSERT INTO ProductCategory (CategoryName) VALUES ('Clothing');
INSERT INTO ProductCategory (CategoryName) VALUES ('Books');

-- Insert Addresses (assuming CountryIds are 1 for India, 2 for USA, 3 for UK)
INSERT INTO Address (City, Street, CountryId) VALUES ('Delhi', 'MG Road', 1);
INSERT INTO Address (City, Street, CountryId) VALUES ('New York', '5th Avenue', 2);
INSERT INTO Address (City, Street, CountryId) VALUES ('London', 'Baker Street', 3);
INSERT INTO Address (City, Street, CountryId) VALUES ('Mumbai', 'Marine Drive', 1);

-- Insert Customers (assuming AddressIds are 1, 2, 3, 4 respectively)
INSERT INTO Customer (AddressRef_Id, Name, Address, EmailAddress, PhoneNumber)
VALUES (1, 'Arjun Sharma', 'House No. 123', 'arjun.sharma@email.com', '9876543210');
INSERT INTO Customer (AddressRef_Id, Name, Address, EmailAddress, PhoneNumber)
VALUES (2, 'Alice Smith', 'Apt 10B, Central Park West', 'alice.smith@email.com', '1234567890');
INSERT INTO Customer (AddressRef_Id, Name, Address, EmailAddress, PhoneNumber)
VALUES (3, 'Bob Jones', 'Flat 5, 221B', 'bob.jones@email.co.uk', '07700900123');
INSERT INTO Customer (AddressRef_Id, Name, Address, EmailAddress, PhoneNumber)
VALUES (4, 'Priya Patel', 'Sea View Bldg, Flat 7', 'priya.patel@email.com', '9988776655');

-- Insert Products (assuming CategoryIds are 1 for Electronics, 2 for Clothing, 3 for Books)
INSERT INTO Product (Name, Quantity, Discount, Price, ProductCategoryRef_Id, CreatedDate, ProductCode)
VALUES ('Smartphone X', 50, 10.00, 25000.00, 1, '2024-05-01', 'SPX1001');
INSERT INTO Product (Name, Quantity, Discount, Price, ProductCategoryRef_Id, CreatedDate, ProductCode)
VALUES ('Wireless Headphones', 30, 5.00, 3500.00, 1, '2024-05-01', 'HPW1001');
INSERT INTO Product (Name, Quantity, Discount, Price, ProductCategoryRef_Id, CreatedDate, ProductCode)
VALUES ('Laptop Pro', 25, 15.00, 75000.00, 1, '2024-05-05', 'LPPRO1001');
INSERT INTO Product (Name, Quantity, Discount, Price, ProductCategoryRef_Id, CreatedDate, ProductCode)
VALUES ('Cotton T-Shirt', 100, 0.00, 800.00, 2, '2024-05-10', 'TSCTN1001');
INSERT INTO Product (Name, Quantity, Discount, Price, ProductCategoryRef_Id, CreatedDate, ProductCode)
VALUES ('Jeans', 80, 5.00, 2200.00, 2, '2024-05-10', 'JNSBLU1001');
INSERT INTO Product (Name, Quantity, Discount, Price, ProductCategoryRef_Id, CreatedDate, ProductCode)
VALUES ('SQL Fundamentals', 75, 2.50, 1200.00, 3, '2024-05-15', 'BKSQL1001');
INSERT INTO Product (Name, Quantity, Discount, Price, ProductCategoryRef_Id, CreatedDate, ProductCode)
VALUES ('The Cloud Compendium', 60, 0.00, 1800.00, 3, '2024-05-15', 'BKCLD1001');


-- Insert Purchase Orders (assuming ProductIds are 1-7 and CustomerIds are 1-4 based on insertion order)
-- Arjun buys a Smartphone X
INSERT INTO PurchaseOrder (ProductRef_Id, CustomerRef_Id, OrderDate, PaymentTotal, OrderQuantity)
VALUES (1, 1, '2024-05-20', 25000.00, 1);

-- Alice buys a Laptop Pro
INSERT INTO PurchaseOrder (ProductRef_Id, CustomerRef_Id, OrderDate, PaymentTotal, OrderQuantity)
VALUES (3, 2, '2024-05-22', 75000.00, 1);

-- Bob buys a T-Shirt and Jeans
INSERT INTO PurchaseOrder (ProductRef_Id, CustomerRef_Id, OrderDate, PaymentTotal, OrderQuantity)
VALUES (4, 3, '2024-05-23', 800.00, 1);
INSERT INTO PurchaseOrder (ProductRef_Id, CustomerRef_Id, OrderDate, PaymentTotal, OrderQuantity)
VALUES (5, 3, '2024-05-23', 2200.00, 1);

-- Priya buys Wireless Headphones and SQL Fundamentals book
INSERT INTO PurchaseOrder (ProductRef_Id, CustomerRef_Id, OrderDate, PaymentTotal, OrderQuantity)
VALUES (2, 4, '2024-05-25', 3500.00, 1);
INSERT INTO PurchaseOrder (ProductRef_Id, CustomerRef_Id, OrderDate, PaymentTotal, OrderQuantity)
VALUES (6, 4, '2024-05-25', 1200.00, 1);

-- Arjun buys another Wireless Headphones
INSERT INTO PurchaseOrder (ProductRef_Id, CustomerRef_Id, OrderDate, PaymentTotal, OrderQuantity)
VALUES (2, 1, '2024-05-26', 3500.00, 1);
