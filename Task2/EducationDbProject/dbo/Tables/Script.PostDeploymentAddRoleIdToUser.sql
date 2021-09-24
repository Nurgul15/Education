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
Declare @ScriptName1 varchar(250) = 'Script.PostDeploymentAddRoleIdToUser';
IF NOT EXISTS (SELECT *
                    FROM dbo.ScriptsHistory
                   WHERE ScriptName = @ScriptName1 AND DatabaseName = DB_NAME())
BEGIN
 BEGIN TRY
    Alter table dbo.[User] add RoleId int null;
    
    INSERT INTO dbo.ScriptsHistory
            VALUES (@ScriptName1, DB_NAME(), SYSDATETIME());
  END TRY
        BEGIN CATCH
            DECLARE @err1 VARCHAR(MAX) = ERROR_MESSAGE();

            RAISERROR('RoleId add script %s failed %d', 16, 1,@ScriptName1, @err1);
        END CATCH;
End

GO


