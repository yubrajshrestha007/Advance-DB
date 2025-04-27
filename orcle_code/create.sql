-- Sequences for IDs
CREATE SEQUENCE seq_productcategory START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_product START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_country START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_address START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_customer START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_purchaseorder START WITH 1 INCREMENT BY 1;


-- ProductCategory Table
CREATE TABLE ProductCategory (
    CategoryId NUMBER PRIMARY KEY,
    CategoryName NVARCHAR2(255) NOT NULL UNIQUE
);

-- Product Table
CREATE TABLE Product (
    ProductId NUMBER PRIMARY KEY,
    Name NVARCHAR2(255) NOT NULL,
    Quantity NUMBER,
    Discount NUMBER(5,2),
    Price NUMBER(10,2) CHECK (Price > 0),
    ProductCategoryRef_Id NUMBER,
    CreatedDate DATE DEFAULT SYSDATE,
    ProductCode NVARCHAR2(50) UNIQUE,
    CONSTRAINT CHK_Quantity CHECK (Quantity >= 0),
    CONSTRAINT FK_ProductCategory FOREIGN KEY (ProductCategoryRef_Id) REFERENCES ProductCategory(CategoryId) ON DELETE SET NULL
);

-- Country Table
CREATE TABLE Country (
    CountryId NUMBER PRIMARY KEY,
    Name NVARCHAR2(255) NOT NULL UNIQUE
);

-- Address Table
CREATE TABLE Address (
    AddressId NUMBER PRIMARY KEY,
    City NVARCHAR2(255),
    Street NVARCHAR2(255),
    CountryId NUMBER,
    CONSTRAINT FK_AddressCountry FOREIGN KEY (CountryId) REFERENCES Country(CountryId) ON DELETE SET NULL
);

-- Customer Table
CREATE TABLE Customer (
    CustomerId NUMBER PRIMARY KEY,
    AddressRef_Id NUMBER,
    Name NVARCHAR2(255) NOT NULL,
    EmailAddress NVARCHAR2(255) UNIQUE,
    PhoneNumber NVARCHAR2(20),
    CONSTRAINT CHK_PhoneNumber CHECK (LENGTH(PhoneNumber) >= 10),
    CONSTRAINT FK_CustomerAddress FOREIGN KEY (AddressRef_Id) REFERENCES Address(AddressId) ON DELETE SET NULL
);

-- PurchaseOrder Table
CREATE TABLE PurchaseOrder (
    PurchaseOrderId NUMBER PRIMARY KEY,
    ProductRef_Id NUMBER,
    CustomerRef_Id NUMBER,
    OrderDate DATE DEFAULT SYSDATE,
    PaymentTotal NUMBER(10,2),
    OrderQuantity NUMBER CHECK (OrderQuantity > 0),
    CONSTRAINT FK_PO_Product FOREIGN KEY (ProductRef_Id) REFERENCES Product(ProductId) ON DELETE CASCADE,
    CONSTRAINT FK_PO_Customer FOREIGN KEY (CustomerRef_Id) REFERENCES Customer(CustomerId) ON DELETE CASCADE
);
