CREATE TABLE [dbo].[Comment] (
    [Id]       INT            IDENTITY (1, 1) NOT NULL,
    [VideoId]  INT            NOT NULL,
    [UserId]   INT            NOT NULL,
    [ParentId] INT            NULL,
    [Text]     NVARCHAR (MAX) NOT NULL,
    CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Comment_Comment] FOREIGN KEY ([ParentId]) REFERENCES [dbo].[Comment] ([Id]),
    CONSTRAINT [FK_Comment_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id]),
    CONSTRAINT [FK_Comment_Video] FOREIGN KEY ([VideoId]) REFERENCES [dbo].[Video] ([Id])
);

