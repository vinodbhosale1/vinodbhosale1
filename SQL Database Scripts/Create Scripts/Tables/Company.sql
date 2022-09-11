/****** Object:  Table [dbo].[Company]    Script Date: 4/1/2021 12:13:06 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Company](
	[CompanyId] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [varchar](100) NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetime] NULL,
	[ManagerId] [varchar](50) NULL,
	[ManagerName] [varchar](100) NULL,
	[ManagerMobile] [varchar](10) NULL,
	[ManagerOfficialEmail] [varchar](500) NULL,
	[HRId] [varchar](50) NULL,
	[HRName] [varchar](100) NULL,
	[HRMobile] [varchar](10) NULL,
	[HROfficialEmail] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Company]  WITH CHECK ADD FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO


