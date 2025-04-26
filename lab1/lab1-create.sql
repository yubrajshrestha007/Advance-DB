CREATE TABLE Country (
    CountryId SERIAL PRIMARY KEY,
    Name VARCHAR(100)
);

CREATE TABLE ProductCategory (
    CategoryId SERIAL PRIMARY KEY,
    CategoryName VARCHAR(100)
);

CREATE TABLE Address (
    AddressId SERIAL PRIMARY KEY,
    City VARCHAR(100),
    Street VARCHAR(100),
    CountryId INT REFERENCES Country(CountryId)
);

CREATE TABLE Customer (
    CustomerId SERIAL PRIMARY KEY,
    AddressRef_Id INT REFERENCES Address(AddressId),
    Name VARCHAR(100),
    Address VARCHAR(255),
    EmailAddress VARCHAR(100),
    PhoneNumber VARCHAR(20)
);

CREATE TABLE Product (
    ProductId SERIAL PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Quantity INT,
    Discount NUMERIC(5,2),
    Price NUMERIC(10,2) CHECK (Price >= 0),
    ProductCategoryRef_Id INT REFERENCES ProductCategory(CategoryId),
    CreatedDate DATE,
    ProductCode VARCHAR(50) UNIQUE
);

CREATE TABLE PurchaseOrder (
    PurchaseOrderId SERIAL PRIMARY KEY,
    ProductRef_Id INT REFERENCES Product(ProductId),
    CustomerRef_Id INT REFERENCES Customer(CustomerId),
    OrderDate DATE,
    PaymentTotal NUMERIC(10,2),
    OrderQuantity INT
);
