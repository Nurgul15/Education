CREATE TABLE [dbo].[Playlist] (
    [Id]          INT            IDENTITY (1, 1) NOT NULL,
    [UserId]      INT            NOT NULL,
    [Title]       NVARCHAR (255) NOT NULL,
    [Description] NVARCHAR (MAX) NULL,
    [CreatedAt]   DATETIME2 (7)  NOT NULL,
    [IsPublic]    BIT            CONSTRAINT [DF_Playlist_IsPublic] DEFAULT ((1)) NOT NULL,
    [IsDeleted]   BIT            CONSTRAINT [DF_Playlist_IsDeleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Playlist] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Playlist_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
);

