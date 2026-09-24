

USE OrderingDb
GO 


USE OrderingDb
GO
DROP TABLE IF EXISTS Currency
GO
CREATE TABLE Currency(
Id NUMERIC(11) IDENTITY(1,1) NOT NULL PRIMARY KEY,
Code VARCHAR(3) NOT NULL UNIQUE,
Name VARCHAR(50) NOT NULL UNIQUE,
Symbol VARCHAR(10) NULL);

USE OrderingDb
GO
DROP TABLE IF EXISTS Order
GO
CREATE TABLE [Order](
Id NUMERIC(11) IDENTITY(1,1) NOT NULL PRIMARY KEY,
OrderNumber NUMERIC(20) NOT NULL UNIQUE,
CustomerId NUMERIC(11) NOT NULL,
OrderDate DATETIME NOT NULL,
StatusId NUMERIC(11) NOT NULL,
ExchangeRate DECIMAL(12,6) NULL,
Total DECIMAL(12,2) NOT NULL,
CurrencyId NUMERIC(11) NOT NULL,
CreatedAt DATETIME NULL,
CreatedBy NUMERIC(11)  NULL,
CONSTRAINT FK_CustomerId FOREIGN KEY(CustomerId) REFERENCES Customer(Id),
CONSTRAINT FK_StatusId FOREIGN KEY(StatusId) REFERENCES TblListSource(Id),
CONSTRAINT FK_Order_CurrencyId FOREIGN KEY(CurrencyId) REFERENCES Currency(Id),
CONSTRAINT FK_Order_CreatedBy FOREIGN KEY(CreatedBy) REFERENCES [User](Id));

SET IDENTITY_INSERT [Order] ON;
INSERT INTO [Order]
(Id, OrderNumber, CustomerId, OrderDate, StatusId, ExchangeRate, Total, CurrencyId, CreatedAt, CreatedBy)
VALUES
(1, 10001, 1, '2026-09-10 10:00', 6, 1.000000, 70000.00, 1, '2026-09-10 10:00', 1),
(2, 10002, 2, '2026-09-10 11:00', 7, 1.000000, 83000.00, 1, '2026-09-10 11:00', 1),
(3, 10003, 3, '2026-09-11 09:30', 8, 1.000000, 75000.00, 1, '2026-09-11 09:30', 1),
(4, 10004, 2, '2026-09-11 14:00', 5, 1.000000, 110000.00, 1, '2026-09-11 14:00', 1),
(5, 10005, 1, '2026-09-12 16:00', 6, 1.000000, 60000.00, 1, '2026-09-12 16:00', 1);

SELECT * FROM [Order];

GO
CREATE TABLE OrderDetails(
Id NUMERIC(11) IDENTITY(1,1) NOT NULL PRIMARY KEY,
ProductId NUMERIC(11) NOT NULL,
OrderId NUMERIC(11) NULL,
Quantity NUMERIC(11) NOT NULL,
UnitPrice DECIMAL(12,2) NOT NULL,
CurrencyId NUMERIC(11) NOT NULL,
Total DECIMAL(12,2) NOT NULL,
ExchangeRate DECIMAL(12,6) NULL,
CreatedAt DATETIME NOT NULL,
CreatedBy NUMERIC(11) NOT NULL,
CONSTRAINT FK_OrderDetails_ProductId FOREIGN KEY(ProductId) REFERENCES Product(Id),
CONSTRAINT FK_OrderDetails_OrderId FOREIGN KEY(OrderId) REFERENCES [Order](Id),
CONSTRAINT FK_OrderDetails_CurrencyId FOREIGN KEY(CurrencyId) REFERENCES Currency(Id),
CONSTRAINT FK_OrderDetails_CreatedBy FOREIGN KEY(CreatedBy) REFERENCES [User](Id));

SET IDENTITY_INSERT OrderDetails ON;
INSERT INTO OrderDetails
(Id, ProductId, OrderId, Quantity, UnitPrice, CurrencyId, Total, ExchangeRate, CreatedAt, CreatedBy)
VALUES
(1, 1, 1, 2, 35000.00, 1, 70000.00, 1.000000, '2026-09-10 10:00',1),
(2, 2, 2, 1, 45000.00, 1, 45000.00, 1.000000, '2026-09-10 11:00',1),
(3, 3, 2, 1, 38000.00, 1, 38000.00, 1.000000, '2026-09-10 11:00',1),
(4, 4, 3, 1, 75000.00, 1, 75000.00, 1.000000, '2026-09-11 09:30',1),
(5, 2, 4, 2, 25000.00, 1, 50000.00, 1.000000, '2026-09-11 14:00',1);

SELECT * FROM OrderDetails;


CREATE TABLE [User](
Id NUMERIC (11) IDENTITY(1,1) NOT NULL PRIMARY KEY,
PhoneNumber VARCHAR(20) NOT NULL UNIQUE,
Email VARCHAR(100) NULL UNIQUE,
PasswordHash VARCHAR(255) NOT NULL,
CreatedAt DATETIME NOT NULL,
UpdatedAt DATETIME NULL,
CreatedBy NUMERIC(11) NOT NULL,
UpdatedBy NUMERIC(11) NULL,
CONSTRAINT FK_CreatedBy
FOREIGN KEY(CreatedBy) REFERENCES [User](Id),
CONSTRAINT FK_UpdatedBy
FOREIGN KEY(UpdatedBy) REFERENCES [User](Id));


SET IDENTITY_INSERT [User] ON;
INSERT INTO [User]
(Id, PhoneNumber, Email, PasswordHash, CreatedAt, CreatedBy)
VALUES
(1, '0712678902', 'lisa@gmail.com', 'hash001', '2026-09-01 09:00', 1),
(2, '0687954039', 'amina@gmail.com', 'hash002', '2026-09-02 12:00', 1),
(3, '0690789346', 'john@gmail.com', 'hash003', '2026-09-03 11:00', 1);

SELECT * FROM [User];

CONSTRAINT FK_Customer_CreatedBy
FOREIGN KEY(CreatedBy) REFERENCES [User](Id),
CONSTRAINT FK_Customer_UpdatedBy
FOREIGN KEY(UpdatedBy) REFERENCES [User](Id));

CONSTRAINT FK_TblListSource_CreatedBy
FOREIGN KEY(CreatedBy) REFERENCES [User](Id),
CONSTRAINT FK_TblListSource_UpdatedBy
FOREIGN KEY(UpdatedBy) REFERENCES [User](Id));


CONSTRAINT FK_Customer_CreatedBy
FOREIGN KEY(CreatedBy) REFERENCES [User](Id),
CONSTRAINT FK_Customer_UpdatedBy
FOREIGN KEY(UpdatedBy) REFERENCES [User](Id));



USE OrderingDb;
GO 
CREATE TABLE Customer(
Id NUMERIC (11) IDENTITY(1,1) NOT NULL PRIMARY KEY,
FirstName VARCHAR(50) NOT NULL,
MiddleName VARCHAR(50) NULL,
LastName VARCHAR(50) NOT NULL,
BusinessSector VARCHAR(100) NULL,
BusinessName VARCHAR(150) NULL,
BusinessAddress VARCHAR(255) NULL,
CreatedAt DATETIME NOT NULL,
UpdatedAt DATETIME NULL,
CreatedBy NUMERIC(11) NOT NULL,
UpdatedBy NUMERIC(11) NULL
CONSTRAINT FK_Customer_CreatedBy
FOREIGN KEY(CreatedBy) REFERENCES [User](Id),
CONSTRAINT FK_Customer_UpdatedBy
FOREIGN KEY(UpdatedBy) REFERENCES [User](Id));

SET IDENTITY_INSERT Customer ON;
INSERT INTO Customer
(Id, FirstName, MiddleName, LastName, BusinessSector, BusinessName, BusinessAddress, CreatedAt,CreatedBy)
VALUES
(1, 'Asha', 'Neema', 'Mushi', 'Fashion', 'Asha Boutique', 'Sinza Dar es Salaam', '2026-09-05 09:00', 1),
(2, 'Brian', NULL, 'John', 'Beauty', 'BJ Cosmetics', 'Ubungo Dar es Salaam', '2026-09-05 10:00', 1),
(3, 'David', 'Jackson', 'Massawe', 'Electronics', 'Neema Electronics', 'Kinyerezi Dar es Salaam', '2026-09-06 10:00', 1);

SELECT * FROM Customer;

CONSTRAINT FK_CustomerId FOREIGN KEY(CustomerId) REFERENCES Customer(Id),
CONSTRAINT FK_Order_StatusId FOREIGN KEY(StatusId) REFERENCES TblListSource(Id),
CONSTRAINT FK_Order_CurrencyId FOREIGN KEY(CurrencyId) REFERENCES Currency(Id),
CONSTRAINT FK_Order_CreatedBy FOREIGN KEY(CreatedBy) REFERENCES [User](Id));

USE OrderingDb
GO
DROP TABLE IF EXISTS Currency;
CREATE TABLE Currency(
Id NUMERIC(11) IDENTITY(1,1) NOT NULL PRIMARY KEY,
Code VARCHAR(3) NOT NULL UNIQUE,
Name VARCHAR(50) NOT NULL UNIQUE,
Symbol NVARCHAR(10) NULL);

SET IDENTITY_INSERT Currency ON;
INSERT INTO Currency
(Id, Code, Name, Symbol)
VALUES
(1, 'TZS', 'Tanzanian Shilling', 'TSh'),
(2, 'USD', 'United States Dollar', '$');
 SELECT * FROM Currency;


 CREATE TABLE Product(
Id NUMERIC(11) IDENTITY(1,1) NOT NULL PRIMARY KEY,
CategoryId NUMERIC(11) NOT NULL,
Name VARCHAR(150) NOT NULL,
UnitPrice DECIMAL(12,2) NOT NULL,
CurrencyId NUMERIC(11) NOT NULL,
Description TEXT NULL,
CreatedAt DATETIME NOT NULL,
CreatedBy NUMERIC(11) NOT NULL,
UpdatedAt DATETIME NULL,
UpdatedBy NUMERIC(11) NULL,
CONSTRAINT FK_Product_CreatedBy FOREIGN KEY(CreatedBy) REFERENCES [User](Id),
CONSTRAINT FK_Product_UpdatedBy FOREIGN KEY(UpdatedBy) REFERENCES [User](Id),
CONSTRAINT FK_CategoryId FOREIGN KEY(CategoryId) REFERENCES TblListSource(Id),
CONSTRAINT FK_Product_CurrencyId FOREIGN KEY(CurrencyId) REFERENCES Currency(Id)
);
SET IDENTITY_INSERT Product ON;
INSERT INTO Product
(Id,CategoryId, Name, UnitPrice, CurrencyId, Description, CreatedAt, CreatedBy)
VALUES 
(1, 1, 'Bodycon Dress', 35000.00, 1, 'Fitted women dress', '2026-09-07 09:00', 1),
(2, 1, 'Maxi Skirt', 28000.00, 1, 'Long fashionable skirt', '2026-09-07 09:10', 1),
(3, 2, 'Face Moisturizer', 45000.00, 1, 'Daily facial moisturizer', '2026-09-07 09:20', 1),
(4, 2, 'Sunscreen', 38000.00, 1, 'Facial Sunscreen', '2026-09-07 09:30', 1);
SELECT * FROM Product;


CREATE TABLE [User](
Id NUMERIC (11) IDENTITY(1,1) NOT NULL PRIMARY KEY,
PhoneNumber VARCHAR(20) NOT NULL UNIQUE,
Email VARCHAR(100) NULL UNIQUE,
PasswordHash VARCHAR(255) NOT NULL,
CreatedAt DATETIME NOT NULL,
UpdatedAt DATETIME NULL,
CreatedBy NUMERIC(11) NOT NULL,
UpdatedBy NUMERIC(11) NULL,
CONSTRAINT FK_TblListSource_CreatedBy
FOREIGN KEY(CreatedBy) REFERENCES [User](Id),
CONSTRAINT FK_TblListSource_UpdatedBy
FOREIGN KEY(UpdatedBy) REFERENCES [User](Id));


SET IDENTITY_INSERT [User] ON;
INSERT INTO [User]
(Id, PhoneNumber, Email, PasswordHash, CreatedAt, CreatedBy)
VALUES
(1, '0712678902', 'lisa@gmail.com', 'hash001', '2026-09-01 09:00', 1),
(2, '0687954039', 'amina@gmail.com', 'hash002', '2026-09-02 12:00', 1),
(3, '0690789346', 'john@gmail.com', 'hash003', '2026-09-03 11:00', 1);

SELECT * FROM [User];

CREATE TABLE TblListSource(
Id NUMERIC(11) IDENTITY(1,1) NOT NULL PRIMARY KEY,
Code VARCHAR(100) NOT NULL UNIQUE,
Text VARCHAR(100) NOT NULL,
Description VARCHAR(255) NULL,
ListName VARCHAR(100) NOT NULL,
IsActive BIT NOT NULL DEFAULT 1,
CreatedBy NUMERIC(11) NOT NULL,
UpdatedBy NUMERIC(11) NULL,
CreatedAt DATETIME NOT NULL,
UpdatedAt DATETIME NULL,
CONSTRAINT FK_ListSource_CreatedBy
FOREIGN KEY(CreatedBy) REFERENCES [User](Id),
CONSTRAINT FK_ListSource_UpdatedBy
FOREIGN KEY(UpdatedBy) REFERENCES [User](Id));

SET IDENTITY_INSERT TblListSource ON;
INSERT INTO TblListSource
(Id, Code, Text, Description, ListName, IsActive, CreatedAt, CreatedBy)
VALUES
(1, 'PRODUCT_CATEGORIES.CLOTHING', 'Clothing', 'Clothing products', 'ProductCategories', 'True', '2026-09-01 09:00', 1),
(2, 'PRODUCT_CATEGORIES.BEAUTY', 'Beauty', 'Beauty products', 'ProductCategories', 'True', '2026-09-01 09:15', 1),
(3, 'PRODUCT_CATEGORIES.ELECTRONICS', 'Electronics', 'Electronic products', 'ProductCategories', 'True', '2026-09-01 09:25', 1),
(4, 'PRODUCT_CATEGORIES.ACCESSORIES', 'Accessories', 'Fashion Accessories', 'ProductCategories', 'True', '2026-09-01 09:55', 1),
(5, 'ORDER_STATUSES.CREATED', 'Created', 'Order has been created', 'OrderStatuses', 'True', '2026-09-01 10:00', 1),
(6, 'ORDER_STATUSES.PAID', 'Paid', 'Order has been paid', 'OrderStatuses', 'True', '2026-09-01 10:12', 1),
(7, 'ORDER_STATUSES.PROCESSING', 'Processing', 'Order has been processed', 'OrderStatuses', 'True', '2026-09-01 10:30', 1),
(8, 'ORDER_STATUSES.COMPLETED', 'Completed', 'Order has been completed', 'OrderStatuses', 'True', '2026-09-24 10:50', 1);

SELECT * FROM TblListSource;