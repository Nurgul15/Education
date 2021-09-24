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
Declare @ScriptName4 varchar(250) = 'Script.PostDeploymentAlterRoleIdInUser';
IF NOT EXISTS (SELECT *
                    FROM dbo.ScriptsHistory
                   WHERE ScriptName = @ScriptName4 AND DatabaseName = DB_NAME())
BEGIN
 BEGIN TRY   
    Alter table dbo.[User] alter column RoleId int not null;
    Alter table dbo.[User] Add CONSTRAINT [FK_User_ToUserRole] FOREIGN KEY (RoleId) REFERENCES UserRole(Id);
    INSERT INTO dbo.ScriptsHistory
            VALUES (@ScriptName4, DB_NAME(), SYSDATETIME());
  END TRY
        BEGIN CATCH
            DECLARE @err4 VARCHAR(MAX) = ERROR_MESSAGE();

            RAISERROR('RoleId add script %s failed %d', 16, 1,@ScriptName4, @err4);
        END CATCH;
End

GO