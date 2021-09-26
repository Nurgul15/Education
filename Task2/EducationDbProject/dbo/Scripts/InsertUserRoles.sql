IF NOT EXISTS (SELECT TOP 1 * FROM [dbo].[UserRole] where Name = 'Admin')
BEGIN
	INSERT INTO [dbo].[UserRole] (Name) Values ('Admin');
END
go
IF NOT EXISTS (SELECT TOP 1 * FROM [dbo].[UserRole] where Name = 'User')
BEGIN
	INSERT INTO [dbo].[UserRole] (Name) Values ('User');
END
GO