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