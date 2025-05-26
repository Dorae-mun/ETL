CREATE DATABASE STAGING_ADVENTUREWORK_2022


create database DataWarehouse


-- Bảng VendorProductInfo
CREATE TABLE VendorProductInfo (
    VendorID INT PRIMARY KEY,
    ProductID INT,
    VendorName NVARCHAR(255),
    CreditRating INT,
    StandardPrice DECIMAL(18,2),
    MinOrderQty INT,
    MaxOrderQty INT
);




-- Bảng Products
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(255),
    ProductNumber NVARCHAR(50),
    StandardCost DECIMAL(18,2),
    ListPrice DECIMAL(18,2),
    Color NVARCHAR(50),
    Size NVARCHAR(50),
    Weight DECIMAL(18,2),
    ModifiedDate DATETIME
);

-- Bảng Customers
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    BusinessEntityID INT,
    FirstName NVARCHAR(100),
    LastName NVARCHAR(100),
    EmailAddress NVARCHAR(255),
    PhoneNumber NVARCHAR(50),
    Address NVARCHAR(255),
    City NVARCHAR(100),
    ModifiedDate DATETIME
);





-- Bảng SalesPersons
CREATE TABLE SalesPersons (
    SalesPersonID INT PRIMARY KEY,
    FullName NVARCHAR(255),
    BirthDate DATE,
    Gender NVARCHAR(10),
    JobTitle NVARCHAR(100),
    TerritoryID INT,
    SalesYTD DECIMAL(18,2),
    SalesLastYear DECIMAL(18,2)
);

-- Bảng SalesTerritories
CREATE TABLE SalesTerritories (
    TerritoryID INT PRIMARY KEY,
    TerritoryName NVARCHAR(255),
    CountryRegionCode NVARCHAR(10),
    SalesYTD DECIMAL(18,2),
    SalesLastYear DECIMAL(18,2),
	[Group] nvarchar(100)
);



-- Bảng SalesOrderOverview
CREATE TABLE SalesOrderOverview (
    SalesOrderID INT PRIMARY KEY,
    CustomerID INT,
    AccountNumber NVARCHAR(50),
    SalesPersonID INT,
    TerritoryID INT,
	Order_date DATE,
    Duedate DATE,
    SubTotal DECIMAL(18,2),
    TaxAmt DECIMAL(18,2),
    TotalDue DECIMAL(18,2),
    Freight DECIMAL(18,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (SalesPersonID) REFERENCES SalesPersons(SalesPersonID),
    FOREIGN KEY (TerritoryID) REFERENCES SalesTerritories(TerritoryID)
);









-- Bảng OrderDetails
CREATE TABLE OrderDetails (
    SaleOrderDetail_ID INT PRIMARY KEY,
    SalesOrderID INT,
    ProductID INT,
    OrderQty INT,
    UnitPrice DECIMAL(18,2),
    UnitPriceDiscount DECIMAL(18,2),
    LineTotal DECIMAL(18,2),
    FOREIGN KEY (SalesOrderID) REFERENCES SalesOrderOverview(SalesOrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);




create table [Currency_Rate] (
    Currency_Rate_ID int IDENTITY(1,1) primary key,
	[From_currency] varchar(50),
    [To_currency] varchar(50),
	[Exchange_Rate] float,
    [EffectiveDate] date,
	end_date date,
	[Start Date] date
)



create table dbo.[STG_DimDate] (
	[OrderDate] date primary key,
	[Month] int,
	[Year] int
)







