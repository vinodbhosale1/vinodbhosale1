/****** Object:  Table [dbo].[CompanyDocuments]    Script Date: 4/1/2021 12:13:25 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CompanyDocuments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DocumentName] [varchar](200) NULL,
	[DocumentPath] [varbinary](max) NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetime] NULL,
	[CompanyId] [int] NULL,
	[DocumentType] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[CompanyDocuments]  WITH CHECK ADD FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([CompanyId])
GO

ALTER TABLE [dbo].[CompanyDocuments]  WITH CHECK ADD FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO


