CREATE TABLE [dbo].[Rating] (
    [Id]      INT     IDENTITY (1, 1) NOT NULL,
    [UserId]  INT     NOT NULL,
    [VideoId] INT     NOT NULL,
    [Rating]  TINYINT NOT NULL,
    CONSTRAINT [PK_Rating] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Rating_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id]),
    CONSTRAINT [FK_Rating_Video] FOREIGN KEY ([VideoId]) REFERENCES [dbo].[Video] ([Id])
);

