CREATE TABLE [dbo].[Channel] (
    [Id]          INT            IDENTITY (1, 1) NOT NULL,
    [UserId]      INT            NOT NULL,
    [Title]       NVARCHAR (255) NOT NULL,
    [Description] NVARCHAR (255) NULL,
    [CreatedAt]   DATETIME2 (7)  NOT NULL,
    [IsDeleted]   BIT            CONSTRAINT [DF_Channel_IsDeleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Channel] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Channel_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
);

