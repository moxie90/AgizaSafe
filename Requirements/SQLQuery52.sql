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