USE TableCreation_db;
GO
SET IDENTITY_INSERT [User] ON;

INSERT INTO [User](Id, PhoneNumber, Email, Password, FirstName, MiddleName, LastName, CreatedAt, CreatedBy)
SELECT TB.*, 1
FROM (
    SELECT 1 Id, '0712678902' PhoneNumber, 'lisa@gmail.com' Email, 'hash001' Password, 'Mohammed' FirstName, 'James' MiddleName, 'Akbar' LastName, '2026-09-01 09:00' CreatedAt
    UNION ALL
    SELECT 2, '0687954039', 'amina@gmail.com', 'hash002', 'Mia', 'Gabriel', 'Olise', '2026-09-02 12:00'
    UNION ALL
    SELECT 3, '0690789346', 'john@gmail.com', 'hash003', 'Fernandoes', 'Issa', 'Louis', '2026-09-03 11:00'
) TB
WHERE NOT EXISTS (SELECT 1 FROM [User] WHERE [User].Id = TB.Id);

SET IDENTITY_INSERT [User] OFF;
GO

SELECT * FROM [User];
GO

SET IDENTITY_INSERT tblListSource ON;

INSERT INTO tblListSource(Id, Code, Text, Description, ListName, IsActive, CreatedAt, CreatedBy)
SELECT TB.*, 1
FROM (
    SELECT 1 Id, 'PRODUCT_CATEGORIES.CLOTHING' Code, 'Clothing' Text, 'Clothing products' Description, 'ProductCategories' ListName, 1 IsActive, '2026-09-01 09:00' CreatedAt
    UNION ALL
    SELECT 2, 'PRODUCT_CATEGORIES.BEAUTY', 'Beauty', 'Beauty products', 'ProductCategories', 1, '2026-09-01 09:15'
    UNION ALL
    SELECT 3, 'PRODUCT_CATEGORIES.ELECTRONICS', 'Electronics', 'Electronic products', 'ProductCategories', 1, '2026-09-01 09:25'
    UNION ALL
    SELECT 4, 'PRODUCT_CATEGORIES.ACCESSORIES', 'Accessories', 'Fashion Accessories', 'ProductCategories', 1, '2026-09-01 09:55'
    UNION ALL
    SELECT 5, 'ORDER_STATUSES.CREATED', 'Created', 'Order has been created', 'OrderStatuses', 1, '2026-09-01 10:00'
    UNION ALL
    SELECT 6, 'ORDER_STATUSES.PAID', 'Paid', 'Order has been paid', 'OrderStatuses', 1, '2026-09-01 10:12'
    UNION ALL
    SELECT 7, 'ORDER_STATUSES.PROCESSING', 'Processing', 'Order has been processed', 'OrderStatuses', 1, '2026-09-01 10:30'
    UNION ALL
    SELECT 8, 'ORDER_STATUSES.COMPLETED', 'Completed', 'Order has been completed', 'OrderStatuses', 1, '2026-09-24 10:50'
    UNION ALL
    SELECT 9, 'BUSINESS_SECTOR.FASHION', 'Fashion', 'Identifies customers operating in the fashion sector', 'BusinessSector', 1, '2026-09-26 11:30'
    UNION ALL
    SELECT 10, 'BUSINESS_SECTOR.BEAUTY', 'Beauty', 'Identifies customers operating in the beauty sector', 'BusinessSector', 1, '2026-09-27 10:50'
    UNION ALL
    SELECT 11, 'BUSINESS_SECTOR.ELECTRONICS', 'Electronics', 'Identifies customers operating in the electronics sector', 'BusinessSector', 1, '2026-09-28 08:45'
    UNION ALL
    SELECT 12, 'BUSINESS_SECTOR.FOOD', 'Food & Beverage', 'Identifies customers operating in the food and beverage sector', 'BusinessSector', 1, '2026-09-29 12:00'
) TB
WHERE NOT EXISTS (SELECT 1 FROM tblListSource WHERE tblListSource.Id = TB.Id);

SET IDENTITY_INSERT tblListSource OFF;
GO

SELECT * FROM tblListSource;
GO
SET IDENTITY_INSERT Currency ON;

INSERT INTO Currency(Id, Code, Name, Symbol)
SELECT TB.*
FROM (
    SELECT 1 Id, 'TZS' Code, 'Tanzanian Shilling' Name, 'TSh' Symbol
    UNION ALL
    SELECT 2, 'USD', 'United States Dollar', '$'
) TB
WHERE NOT EXISTS (SELECT 1 FROM Currency WHERE Currency.Id = TB.Id);

SET IDENTITY_INSERT Currency OFF;
GO

SELECT * FROM Currency;
GO

SET IDENTITY_INSERT Customer ON;

INSERT INTO Customer(Id, FirstName, MiddleName, LastName, BusinessSectorId, BusinessName, BusinessAddress, CreatedAt, CreatedBy)
SELECT TB.*, 1
FROM (
    SELECT 1 Id, 'Asha' FirstName, 'Neema' MiddleName, 'Mushi' LastName, 9 BusinessSectorId, 'Asha Boutique' BusinessName, 'Sinza Dar es Salaam' BusinessAddress, '2026-09-05 09:00' CreatedAt
    UNION ALL
    SELECT 2, 'Brian', NULL, 'John', 10, 'BJ Cosmetics', 'Ubungo Dar es Salaam', '2026-09-05 10:00'
    UNION ALL
    SELECT 3, 'David', 'Jackson', 'Massawe', 11, 'Neema Electronics', 'Kinyerezi Dar es Salaam', '2026-09-06 10:00'
) TB
WHERE NOT EXISTS (SELECT 1 FROM Customer WHERE Customer.Id = TB.Id);

SET IDENTITY_INSERT Customer OFF;
GO

SELECT * FROM Customer;
GO
SET IDENTITY_INSERT Product ON;

INSERT INTO Product(Id, CategoryId, Name, UnitPrice, CurrencyId, Description, CreatedAt, CreatedBy)
SELECT TB.*, 1
FROM (
    SELECT 1 Id, 1 CategoryId, 'Bodycon Dress' Name, 35000.00 UnitPrice, 1 CurrencyId, 'Fitted women dress' Description, '2026-09-07 09:00' CreatedAt
    UNION ALL
    SELECT 2, 1, 'Maxi Skirt', 28000.00, 1, 'Long fashionable skirt', '2026-09-07 09:10'
    UNION ALL
    SELECT 3, 2, 'Face Moisturizer', 45000.00, 1, 'Daily facial moisturizer', '2026-09-07 09:20'
    UNION ALL
    SELECT 4, 2, 'Sunscreen', 38000.00, 1, 'Facial Sunscreen', '2026-09-07 09:30'
) TB
WHERE NOT EXISTS (SELECT 1 FROM Product WHERE Product.Id = TB.Id);

SET IDENTITY_INSERT Product OFF;
GO

SELECT * FROM Product;
GO

SET IDENTITY_INSERT [Order] ON;

INSERT INTO [Order](Id, OrderNumber, CustomerId, OrderDate, StatusId, ExchangeRate, Total, CurrencyId, CreatedAt, CreatedBy)
SELECT TB.*, 1
FROM (
    SELECT 1 Id, 10001 OrderNumber, 1 CustomerId, '2026-09-10 10:00' OrderDate, 6 StatusId, 1.000000 ExchangeRate, 70000.00 Total, 1 CurrencyId, '2026-09-10 10:00' CreatedAt
    UNION ALL
    SELECT 2, 10002, 2, '2026-09-10 11:00', 7, 1.000000, 83000.00, 1, '2026-09-10 11:00'
    UNION ALL
    SELECT 3, 10003, 3, '2026-09-11 09:30', 8, 1.000000, 38000.00, 1, '2026-09-11 09:30'
    UNION ALL
    SELECT 4, 10004, 2, '2026-09-11 14:00', 5, 1.000000, 98000.00, 1, '2026-09-11 14:00'
    UNION ALL
    SELECT 5, 10005, 1, '2026-09-12 16:00', 6, 1.000000, 63000.00, 1, '2026-09-12 16:00'
) TB
WHERE NOT EXISTS (SELECT 1 FROM [Order] WHERE [Order].Id = TB.Id);

SET IDENTITY_INSERT [Order] OFF;
GO

SELECT * FROM [Order];
GO

SET IDENTITY_INSERT OrderDetails ON;

INSERT INTO OrderDetails(Id, ProductId, OrderId, Quantity, UnitPrice, CurrencyId, Total, ExchangeRate, CreatedAt, CreatedBy)
SELECT TB.*, 1
FROM (
    SELECT 1 Id, 1 ProductId, 1 OrderId, 2 Quantity, 35000.00 UnitPrice, 1 CurrencyId, 70000.00 Total, 1.000000 ExchangeRate, '2026-09-10 10:00' CreatedAt
    UNION ALL
    SELECT 2, 3, 2, 1, 45000.00, 1, 45000.00, 1.000000, '2026-09-10 11:00'
    UNION ALL
    SELECT 3, 4, 2, 1, 38000.00, 1, 38000.00, 1.000000, '2026-09-10 11:00'
    UNION ALL
    SELECT 4, 4, 3, 1, 38000.00, 1, 38000.00, 1.000000, '2026-09-11 09:30'
    UNION ALL
    SELECT 5, 1, 4, 2, 35000.00, 1, 70000.00, 1.000000, '2026-09-11 14:00'
    UNION ALL
    SELECT 6, 2, 4, 1, 28000.00, 1, 28000.00, 1.000000, '2026-09-11 14:00'
    UNION ALL
    SELECT 7, 1, 5, 1, 35000.00, 1, 35000.00, 1.000000, '2026-09-12 16:00'
    UNION ALL
    SELECT 8, 2, 5, 1, 28000.00, 1, 28000.00, 1.000000, '2026-09-12 16:00'
) TB
WHERE NOT EXISTS (SELECT 1 FROM OrderDetails WHERE OrderDetails.Id = TB.Id);

SET IDENTITY_INSERT OrderDetails OFF;
GO

SELECT * FROM OrderDetails;
GO