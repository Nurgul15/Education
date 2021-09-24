CREATE TABLE [dbo].[ScriptsHistory]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [ScriptName] VARCHAR(250) NOT NULL, 
    [DatabaseName] [sys].[sysname] NOT NULL, 
    [ExecutionTime] DATETIME2 NOT NULL
)
