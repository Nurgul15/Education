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
Declare @ScriptName2 varchar(250) = 'Script.PostDeploymentInsertUserRoles';
IF NOT EXISTS (SELECT *
                    FROM dbo.ScriptsHistory
                   WHERE ScriptName = @ScriptName2 AND DatabaseName = DB_NAME())

BEGIN
    BEGIN TRY
         INSERT INTO dbo.UserRole (Name) Values ('Admin');
            
         INSERT INTO dbo.UserRole (Name) Values ('User');

         INSERT INTO dbo.ScriptsHistory
                    VALUES (@ScriptName2, DB_NAME(), SYSDATETIME());
    END TRY
        BEGIN CATCH
        DECLARE @err2 VARCHAR(MAX) = ERROR_MESSAGE();

        RAISERROR('One time script %s failed %d', 16, 1, @ScriptName2, @err2);
    END CATCH;
END