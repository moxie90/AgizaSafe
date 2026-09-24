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