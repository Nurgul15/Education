/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
Declare @ScriptName3 varchar(250) = 'Script.PostDeploymentUpdateRoleId';
IF NOT EXISTS (SELECT *
                    FROM dbo.ScriptsHistory
                   WHERE ScriptName = @ScriptName3 AND DatabaseName = DB_NAME())
    BEGIN
    Declare @AdminRoleId int = (select Id from UserRole where Name = 'Admin')
    Declare @UserRoleId int = (select Id from UserRole where Name = 'User')
        BEGIN TRY
            UPDATE [dbo].[User] SET RoleId = @UserRoleId where Id%2 = 0;
            
            UPDATE [dbo].[User] SET  RoleId = @AdminRoleId where Id%2 = 1;

            INSERT INTO dbo.ScriptsHistory
            VALUES (@ScriptName3, DB_NAME(), SYSDATETIME());            

        END TRY
        BEGIN CATCH
            DECLARE @err3 VARCHAR(MAX) = ERROR_MESSAGE();

            RAISERROR('One time script %s failed %d', 16, 1, @ScriptName3, @err3);
        END CATCH;
    END;
GO