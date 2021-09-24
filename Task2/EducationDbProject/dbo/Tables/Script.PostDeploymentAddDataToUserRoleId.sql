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
Declare @ScriptName5 varchar(250) = 'Script.PostDeploymentAddDataToUserRoleId';
IF NOT EXISTS (SELECT *
                    FROM dbo.ScriptsHistory
                   WHERE ScriptName = @ScriptName5 AND DatabaseName = DB_NAME())
BEGIN
Declare @ValidRoleId int =(select top 1 Id from UserRole order by Id);
 BEGIN TRY
    Update dbo.[User] set RoleId = @ValidRoleId;
    
    INSERT INTO dbo.ScriptsHistory
            VALUES (@ScriptName5, DB_NAME(), SYSDATETIME());
  END TRY
        BEGIN CATCH
            DECLARE @err4 VARCHAR(MAX) = ERROR_MESSAGE();

            RAISERROR('RoleId add script %s failed %d', 16, 1,@ScriptName5, @err4);
        END CATCH;
End

GO