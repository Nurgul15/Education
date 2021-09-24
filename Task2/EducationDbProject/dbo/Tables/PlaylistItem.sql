CREATE TABLE [dbo].[PlaylistItem] (
    [Id]         INT IDENTITY (1, 1) NOT NULL,
    [PlaylistId] INT NOT NULL,
    [VideoId]    INT NOT NULL,
    CONSTRAINT [PK_PlaylistItem] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_PlaylistItem_Playlist] FOREIGN KEY ([PlaylistId]) REFERENCES [dbo].[Playlist] ([Id]),
    CONSTRAINT [FK_PlaylistItem_Video] FOREIGN KEY ([VideoId]) REFERENCES [dbo].[Video] ([Id])
);

