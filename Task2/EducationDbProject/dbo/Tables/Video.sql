CREATE TABLE [dbo].[Video] (
    [Id]               INT            IDENTITY (1, 1) NOT NULL,
    [ChannelId]        INT            NOT NULL,
    [Title]            NVARCHAR (255) NOT NULL,
    [Description]      NVARCHAR (MAX) NULL,
    [FilePath]         NVARCHAR (500) NOT NULL,
    [IsAllowedForKids] BIT            CONSTRAINT [DF_Video_IsAllowedForKids] DEFAULT ((1)) NOT NULL,
    [Likes]            INT            CONSTRAINT [DF_Video_Rating] DEFAULT ((0)) NOT NULL,
    [Dislikes]         INT            CONSTRAINT [DF_Video_Dislikes] DEFAULT ((0)) NOT NULL,
    [Views]            INT            CONSTRAINT [DF_Video_Views] DEFAULT ((0)) NOT NULL,
    [CreatedAt]        DATETIME2 (7)  NOT NULL,
    [IsDeleted]        BIT            CONSTRAINT [DF_Video_IsDeleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Video] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Video_Channel] FOREIGN KEY ([ChannelId]) REFERENCES [dbo].[Channel] ([Id])
);

