/****** Object:  Table [dbo].[Employee]    Script Date: 4/1/2021 12:13:46 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NULL,
	[FullName] [varchar](200) NULL,
	[Photo] [varbinary](max) NULL,
	[PermanentAddress] [varchar](500) NULL,
	[CurrentAddress] [varchar](500) NULL,
	[PAN] [varchar](100) NULL,
	[Mobile] [varchar](100) NULL,
	[AlternateMobile] [varchar](100) NULL,
	[EmailId] [varchar](100) NULL,
	[AlternateEmailId] [varchar](100) NULL,
	[BloodGroup] [varchar](10) NULL,
	[HighestQualification] [varchar](500) NULL,
	[HighestQualificationPassoutMonthYear] [varchar](500) NULL,
	[Technology] [varchar](2000) NULL,
	[OfferDate] [date] NULL,
	[JoiningDate] [date] NULL,
	[OfferDesignation] [varchar](500) NULL,
	[CurrentDesignation] [varchar](500) NULL,
	[OfferSalary] [numeric](3, 2) NULL,
	[CurrentSalary] [numeric](3, 2) NULL,
	[LastHikeMonthYear] [varchar](500) NULL,
	[ResignationDate] [date] NULL,
	[RelivingDate] [date] NULL,
	[OfficialEmployeeId] [varchar](100) NULL,
	[OfficialEmailId] [varchar](100) NULL,
	[OfficialEmailIdPassword] [varchar](100) NULL,
	[AddedDate] [datetime] NULL,
	[CompanyId] [int] NULL,
	[Gender] [varchar](10) NULL,
	[DateOfBirth] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Mobile] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[EmailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[PAN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Employee] ADD  DEFAULT ('Trainee Engineer') FOR [OfferDesignation]
GO

ALTER TABLE [dbo].[Employee] ADD  DEFAULT ('Software Engineer') FOR [CurrentDesignation]
GO

ALTER TABLE [dbo].[Employee]  WITH CHECK ADD FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([CompanyId])
GO

ALTER TABLE [dbo].[Employee]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO


