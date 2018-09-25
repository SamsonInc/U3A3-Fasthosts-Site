CREATE TABLE [dbo].[Table]
(
	[UserID] INT NOT NULL PRIMARY KEY, 
    [FirstName] NVARCHAR(50) NOT NULL, 
    [LastName] NVARCHAR(50) NOT NULL, 
    [Email] NVARCHAR(50) NOT NULL, 
    [PhoneNumber] BIGINT NULL, 
    [Password] NVARCHAR(50) NOT NULL
)
