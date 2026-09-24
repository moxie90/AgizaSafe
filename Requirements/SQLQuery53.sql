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