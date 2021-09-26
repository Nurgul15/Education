:r .\InsertUserRoles.sql

Declare @ScriptName varchar(250) = 'Script.PostDeploymentUpdateRoleId';
IF NOT EXISTS (SELECT *
                    FROM dbo.ScriptsHistory
                   WHERE ScriptName = @ScriptName AND DatabaseName = DB_NAME())
    BEGIN
    Declare @AdminRoleId int = (select Id from UserRole where Name = 'Admin')
    Declare @UserRoleId int = (select Id from UserRole where Name = 'User')
        BEGIN TRY
            UPDATE [dbo].[User] SET RoleId = @UserRoleId where Id%2 = 0;
            
            UPDATE [dbo].[User] SET  RoleId = @AdminRoleId where Id%2 = 1;

            INSERT INTO dbo.ScriptsHistory
            VALUES (@ScriptName, DB_NAME(), SYSDATETIME());            

        END TRY
        BEGIN CATCH
            DECLARE @err3 VARCHAR(MAX) = ERROR_MESSAGE();

            RAISERROR('One time script %s failed %d', 16, 1, @ScriptName, @err3);
        END CATCH;
    END;
GO