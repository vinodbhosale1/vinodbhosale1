USE [master]
GO
/****** Object:  Database [EmployeeManagementDB]    Script Date: 3/11/2022 4:01:53 PM ******/
CREATE DATABASE [EmployeeManagementDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EmployeeManagementDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\EmployeeManagementDB.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EmployeeManagementDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\EmployeeManagementDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [EmployeeManagementDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EmployeeManagementDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EmployeeManagementDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EmployeeManagementDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EmployeeManagementDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EmployeeManagementDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EmployeeManagementDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [EmployeeManagementDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [EmployeeManagementDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EmployeeManagementDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EmployeeManagementDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EmployeeManagementDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EmployeeManagementDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EmployeeManagementDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EmployeeManagementDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EmployeeManagementDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EmployeeManagementDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [EmployeeManagementDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EmployeeManagementDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EmployeeManagementDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EmployeeManagementDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EmployeeManagementDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EmployeeManagementDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EmployeeManagementDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EmployeeManagementDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EmployeeManagementDB] SET  MULTI_USER 
GO
ALTER DATABASE [EmployeeManagementDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EmployeeManagementDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EmployeeManagementDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EmployeeManagementDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EmployeeManagementDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EmployeeManagementDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'EmployeeManagementDB', N'ON'
GO
ALTER DATABASE [EmployeeManagementDB] SET QUERY_STORE = OFF
GO
USE [EmployeeManagementDB]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 3/11/2022 4:01:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 3/11/2022 4:01:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 3/11/2022 4:01:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 3/11/2022 4:01:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 3/11/2022 4:01:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 3/11/2022 4:01:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 3/11/2022 4:01:53 PM ******/
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
	[LeadId] [varchar](50) NULL,
	[LeadName] [varchar](100) NULL,
	[LeadMobile] [varchar](10) NULL,
	[LeadOfficialEmail] [varchar](500) NULL,
	[CompanyLogo] [varbinary](max) NULL,
	[CompanyAddress] [varchar](500) NULL,
	[CompanyOfficialEmail] [varchar](500) NULL,
	[CompanyOfficialContact] [varchar](50) NULL,
	[CompanyWebsite] [varchar](500) NULL,
	[CompanyFounder] [varchar](500) NULL,
	[CompanyFoundedMonthYear] [varchar](100) NULL,
	[CompanyEmployeeStrength] [varchar](500) NULL,
 CONSTRAINT [PK__Company__2D971CACDD8287B0] PRIMARY KEY CLUSTERED 
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompanyDocumentConfigurableValues]    Script Date: 3/11/2022 4:01:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyDocumentConfigurableValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NULL,
	[FieldName] [varchar](100) NULL,
	[ValueType] [varchar](50) NULL,
	[FieldValue] [varchar](5000) NULL,
	[AddedDate] [datetime] NULL,
	[CompanyDocumentId] [int] NULL,
	[FieldFormat] [varchar](2000) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompanyDocuments]    Script Date: 3/11/2022 4:01:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyDocuments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DocumentName] [varchar](200) NULL,
	[DocumentPath] [varchar](2000) NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetime] NULL,
	[CompanyId] [int] NULL,
	[DocumentType] [varchar](10) NULL,
 CONSTRAINT [PK__CompanyD__3214EC07B6632A45] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 3/11/2022 4:01:53 PM ******/
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
	[OfferSalary] [numeric](18, 2) NULL,
	[CurrentSalary] [numeric](18, 2) NULL,
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
 CONSTRAINT [PK__Employee__3214EC07C3D75858] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ__Employee__6FAE07827E70FAF8] UNIQUE NONCLUSTERED 
(
	[Mobile] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ__Employee__7ED91ACE36777FD4] UNIQUE NONCLUSTERED 
(
	[EmailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ__Employee__C577943D1D751E58] UNIQUE NONCLUSTERED 
(
	[PAN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeIncrement]    Script Date: 3/11/2022 4:01:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeIncrement](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NULL,
	[HikeMonthYear] [varchar](100) NULL,
	[HikeInPercentage] [int] NULL,
	[HikeAmount] [numeric](18, 2) NULL,
	[SalaryAfterHike] [numeric](18, 2) NULL,
	[SalaryEffectiveFrom] [date] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK__Employee__3214EC071D71C395] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 3/11/2022 4:01:53 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 3/11/2022 4:01:53 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 3/11/2022 4:01:53 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RoleId]    Script Date: 3/11/2022 4:01:53 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 3/11/2022 4:01:53 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 3/11/2022 4:01:53 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [DF__Employee__OfferD__4BAC3F29]  DEFAULT ('Trainee Engineer') FOR [OfferDesignation]
GO
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [DF__Employee__Curren__4CA06362]  DEFAULT ('Software Engineer') FOR [CurrentDesignation]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Company]  WITH CHECK ADD  CONSTRAINT [FK__Company__Created__66603565] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [FK__Company__Created__66603565]
GO
ALTER TABLE [dbo].[CompanyDocumentConfigurableValues]  WITH CHECK ADD  CONSTRAINT [FK__CompanyDo__Compa__1AD3FDA4] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([CompanyId])
GO
ALTER TABLE [dbo].[CompanyDocumentConfigurableValues] CHECK CONSTRAINT [FK__CompanyDo__Compa__1AD3FDA4]
GO
ALTER TABLE [dbo].[CompanyDocumentConfigurableValues]  WITH CHECK ADD FOREIGN KEY([CompanyDocumentId])
REFERENCES [dbo].[CompanyDocuments] ([Id])
GO
ALTER TABLE [dbo].[CompanyDocuments]  WITH CHECK ADD  CONSTRAINT [FK__CompanyDo__Compa__6C190EBB] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([CompanyId])
GO
ALTER TABLE [dbo].[CompanyDocuments] CHECK CONSTRAINT [FK__CompanyDo__Compa__6C190EBB]
GO
ALTER TABLE [dbo].[CompanyDocuments]  WITH CHECK ADD  CONSTRAINT [FK__CompanyDo__Creat__6B24EA82] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[CompanyDocuments] CHECK CONSTRAINT [FK__CompanyDo__Creat__6B24EA82]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK__Employee__Compan__6754599E] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([CompanyId])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK__Employee__Compan__6754599E]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK__Employee__UserId__4AB81AF0] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK__Employee__UserId__4AB81AF0]
GO
ALTER TABLE [dbo].[EmployeeIncrement]  WITH CHECK ADD  CONSTRAINT [FK__EmployeeI__UserI__4F7CD00D] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[EmployeeIncrement] CHECK CONSTRAINT [FK__EmployeeI__UserI__4F7CD00D]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetEmployeeTableColumns]    Script Date: 3/11/2022 4:01:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usp_GetEmployeeTableColumns]
as
begin 
	SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.Columns WHERE TABLE_NAME = 'Employee'
	and COLUMN_NAME not in ('Id', 'UserId')
	union all
	SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.Columns WHERE TABLE_NAME = 'EmployeeIncrement'
	and COLUMN_NAME not in ('Id', 'UserId', 'ModifiedDate')
end 
GO
USE [master]
GO
ALTER DATABASE [EmployeeManagementDB] SET  READ_WRITE 
GO
