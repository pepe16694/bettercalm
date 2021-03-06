USE [master]
GO
/****** Object:  Database [BetterCalmDB]    Script Date: 17-Jun-21 14:51:14 ******/
CREATE DATABASE [BetterCalmDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BetterCalmDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\BetterCalmDB.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BetterCalmDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\BetterCalmDB_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BetterCalmDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BetterCalmDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BetterCalmDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BetterCalmDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BetterCalmDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BetterCalmDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BetterCalmDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [BetterCalmDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BetterCalmDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BetterCalmDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BetterCalmDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BetterCalmDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BetterCalmDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BetterCalmDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BetterCalmDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BetterCalmDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BetterCalmDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BetterCalmDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BetterCalmDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BetterCalmDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BetterCalmDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BetterCalmDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BetterCalmDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [BetterCalmDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BetterCalmDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BetterCalmDB] SET  MULTI_USER 
GO
ALTER DATABASE [BetterCalmDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BetterCalmDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BetterCalmDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BetterCalmDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [BetterCalmDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [BetterCalmDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 17-Jun-21 14:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppointmentDiscount]    Script Date: 17-Jun-21 14:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppointmentDiscount](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Discount] [float] NOT NULL,
 CONSTRAINT [PK_AppointmentDiscount] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppointmentDuration]    Script Date: 17-Jun-21 14:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppointmentDuration](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Duration] [time](7) NOT NULL,
 CONSTRAINT [PK_AppointmentDuration] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Appointments]    Script Date: 17-Jun-21 14:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime2](7) NOT NULL,
	[PatientId] [int] NULL,
	[PsychologistId] [int] NULL,
	[IllnessId] [int] NULL,
	[ScheduleId] [int] NULL,
	[Address] [nvarchar](max) NULL,
	[DurationId] [int] NULL,
	[DiscountId] [int] NULL,
	[TotalCost] [float] NOT NULL,
 CONSTRAINT [PK_Appointments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 17-Jun-21 14:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryContent]    Script Date: 17-Jun-21 14:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryContent](
	[CategoriesId] [int] NOT NULL,
	[ContentsId] [int] NOT NULL,
 CONSTRAINT [PK_CategoryContent] PRIMARY KEY CLUSTERED 
(
	[CategoriesId] ASC,
	[ContentsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryPlaylist]    Script Date: 17-Jun-21 14:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryPlaylist](
	[CategoriesId] [int] NOT NULL,
	[PlayListsId] [int] NOT NULL,
 CONSTRAINT [PK_CategoryPlaylist] PRIMARY KEY CLUSTERED 
(
	[CategoriesId] ASC,
	[PlayListsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContentPlaylist]    Script Date: 17-Jun-21 14:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContentPlaylist](
	[ContentsId] [int] NOT NULL,
	[PlayListsId] [int] NOT NULL,
 CONSTRAINT [PK_ContentPlaylist] PRIMARY KEY CLUSTERED 
(
	[ContentsId] ASC,
	[PlayListsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contents]    Script Date: 17-Jun-21 14:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contents](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[ContentLength] [time](7) NOT NULL,
	[ArtistName] [nvarchar](max) NOT NULL,
	[ImageUrl] [nvarchar](max) NULL,
	[ContentUrl] [nvarchar](max) NOT NULL,
	[ContentTypeId] [int] NULL,
 CONSTRAINT [PK_Contents] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContentTypes]    Script Date: 17-Jun-21 14:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContentTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_ContentTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Illnesses]    Script Date: 17-Jun-21 14:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Illnesses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Illnesses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IllnessPsychologist]    Script Date: 17-Jun-21 14:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IllnessPsychologist](
	[IllnessesId] [int] NOT NULL,
	[PsychologistsId] [int] NOT NULL,
 CONSTRAINT [PK_IllnessPsychologist] PRIMARY KEY CLUSTERED 
(
	[IllnessesId] ASC,
	[PsychologistsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patients]    Script Date: 17-Jun-21 14:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patients](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BirthDate] [datetime2](7) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Phone] [nvarchar](max) NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[AppointmentDiscountId] [int] NULL,
	[AppointmentQuantity] [int] NOT NULL,
 CONSTRAINT [PK_Patients] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Playlists]    Script Date: 17-Jun-21 14:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Playlists](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](150) NOT NULL,
	[ImageUrl] [nvarchar](max) NULL,
 CONSTRAINT [PK_Playlists] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PsychologistRate]    Script Date: 17-Jun-21 14:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PsychologistRate](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[HourlyRate] [int] NOT NULL,
 CONSTRAINT [PK_PsychologistRate] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Psychologists]    Script Date: 17-Jun-21 14:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Psychologists](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[Format] [int] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[RateId] [int] NULL,
 CONSTRAINT [PK_Psychologists] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 17-Jun-21 14:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleUser]    Script Date: 17-Jun-21 14:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleUser](
	[RolesId] [int] NOT NULL,
	[UsersId] [int] NOT NULL,
 CONSTRAINT [PK_RoleUser] PRIMARY KEY CLUSTERED 
(
	[RolesId] ASC,
	[UsersId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 17-Jun-21 14:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PsychologistId] [int] NULL,
	[Date] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Schedule] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sessions]    Script Date: 17-Jun-21 14:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sessions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Token] [nvarchar](max) NULL,
	[UserId] [int] NULL,
 CONSTRAINT [PK_Sessions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 17-Jun-21 14:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](450) NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210426125056_Sessions', N'5.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210429010426_AudioUrlMigration', N'5.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210430213450_PsychologistIllnessRelation', N'5.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210501152313_ScheduleMigration', N'5.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210501175137_AddressToAppointment', N'5.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210502004108_UserImprovent', N'5.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210502004439_RemoveRoles', N'5.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210502012825_RoleBasedUsers', N'5.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210502022213_AddNameToUser', N'5.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210503234226_UserConstraints', N'5.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210504021824_PalylistConstraints', N'5.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210504024501_ContentConstraints', N'5.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210504194639_PsychologistConstraints', N'5.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210504235056_PatientConstraints', N'5.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210530014750_ContentType', N'5.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210530184732_AppointmentDuration', N'5.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210605184214_PsychologistRate', N'5.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210607185231_PatientQuantityAndDiscounts', N'5.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210607222320_AppointmentDiscount', N'5.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210612234349_EmailRename', N'5.0.4')
GO
SET IDENTITY_INSERT [dbo].[AppointmentDiscount] ON 

INSERT [dbo].[AppointmentDiscount] ([Id], [Discount]) VALUES (1, 0)
INSERT [dbo].[AppointmentDiscount] ([Id], [Discount]) VALUES (2, 15)
INSERT [dbo].[AppointmentDiscount] ([Id], [Discount]) VALUES (3, 25)
INSERT [dbo].[AppointmentDiscount] ([Id], [Discount]) VALUES (4, 50)
SET IDENTITY_INSERT [dbo].[AppointmentDiscount] OFF
GO
SET IDENTITY_INSERT [dbo].[AppointmentDuration] ON 

INSERT [dbo].[AppointmentDuration] ([Id], [Duration]) VALUES (1, CAST(N'01:00:00' AS Time))
INSERT [dbo].[AppointmentDuration] ([Id], [Duration]) VALUES (2, CAST(N'01:30:00' AS Time))
INSERT [dbo].[AppointmentDuration] ([Id], [Duration]) VALUES (3, CAST(N'02:00:00' AS Time))
SET IDENTITY_INSERT [dbo].[AppointmentDuration] OFF
GO
SET IDENTITY_INSERT [dbo].[Appointments] ON 

INSERT [dbo].[Appointments] ([Id], [Date], [PatientId], [PsychologistId], [IllnessId], [ScheduleId], [Address], [DurationId], [DiscountId], [TotalCost]) VALUES (3, CAST(N'2021-06-18T00:00:00.0000000' AS DateTime2), 1, 5, 6, 2, N'1247 Golden Oak Street', 1, NULL, 1000)
INSERT [dbo].[Appointments] ([Id], [Date], [PatientId], [PsychologistId], [IllnessId], [ScheduleId], [Address], [DurationId], [DiscountId], [TotalCost]) VALUES (4, CAST(N'2021-06-18T00:00:00.0000000' AS DateTime2), 1, 5, 6, 2, N'1247 Golden Oak Street', 2, NULL, 1500)
INSERT [dbo].[Appointments] ([Id], [Date], [PatientId], [PsychologistId], [IllnessId], [ScheduleId], [Address], [DurationId], [DiscountId], [TotalCost]) VALUES (5, CAST(N'2021-06-18T00:00:00.0000000' AS DateTime2), 1, 5, 6, 2, N'1247 Golden Oak Street', 3, NULL, 2000)
INSERT [dbo].[Appointments] ([Id], [Date], [PatientId], [PsychologistId], [IllnessId], [ScheduleId], [Address], [DurationId], [DiscountId], [TotalCost]) VALUES (6, CAST(N'2021-06-18T00:00:00.0000000' AS DateTime2), 1, 5, 6, 2, N'1247 Golden Oak Street', 1, NULL, 1000)
INSERT [dbo].[Appointments] ([Id], [Date], [PatientId], [PsychologistId], [IllnessId], [ScheduleId], [Address], [DurationId], [DiscountId], [TotalCost]) VALUES (7, CAST(N'2021-06-18T00:00:00.0000000' AS DateTime2), 1, 5, 6, 2, N'1247 Golden Oak Street', 3, NULL, 2000)
INSERT [dbo].[Appointments] ([Id], [Date], [PatientId], [PsychologistId], [IllnessId], [ScheduleId], [Address], [DurationId], [DiscountId], [TotalCost]) VALUES (8, CAST(N'2021-06-18T00:00:00.0000000' AS DateTime2), 2, 6, 6, 3, N'Berggasse 19', 1, NULL, 2000)
INSERT [dbo].[Appointments] ([Id], [Date], [PatientId], [PsychologistId], [IllnessId], [ScheduleId], [Address], [DurationId], [DiscountId], [TotalCost]) VALUES (9, CAST(N'2021-06-18T00:00:00.0000000' AS DateTime2), 2, 6, 6, 3, N'Berggasse 19', 2, NULL, 3000)
INSERT [dbo].[Appointments] ([Id], [Date], [PatientId], [PsychologistId], [IllnessId], [ScheduleId], [Address], [DurationId], [DiscountId], [TotalCost]) VALUES (10, CAST(N'2021-06-18T00:00:00.0000000' AS DateTime2), 2, 7, 6, 4, N'Kolymazhnyy Pereulok 14', 1, NULL, 500)
INSERT [dbo].[Appointments] ([Id], [Date], [PatientId], [PsychologistId], [IllnessId], [ScheduleId], [Address], [DurationId], [DiscountId], [TotalCost]) VALUES (11, CAST(N'2021-06-18T00:00:00.0000000' AS DateTime2), 2, 7, 6, 4, N'Kolymazhnyy Pereulok 14', 2, NULL, 750)
INSERT [dbo].[Appointments] ([Id], [Date], [PatientId], [PsychologistId], [IllnessId], [ScheduleId], [Address], [DurationId], [DiscountId], [TotalCost]) VALUES (12, CAST(N'2021-06-18T00:00:00.0000000' AS DateTime2), 2, 7, 6, 4, N'Kolymazhnyy Pereulok 14', 2, NULL, 750)
INSERT [dbo].[Appointments] ([Id], [Date], [PatientId], [PsychologistId], [IllnessId], [ScheduleId], [Address], [DurationId], [DiscountId], [TotalCost]) VALUES (13, CAST(N'2021-06-18T00:00:00.0000000' AS DateTime2), 3, 7, 6, 4, N'Kolymazhnyy Pereulok 14', 1, NULL, 500)
INSERT [dbo].[Appointments] ([Id], [Date], [PatientId], [PsychologistId], [IllnessId], [ScheduleId], [Address], [DurationId], [DiscountId], [TotalCost]) VALUES (14, CAST(N'2021-06-18T00:00:00.0000000' AS DateTime2), 3, 7, 6, 4, N'Kolymazhnyy Pereulok 14', 2, NULL, 750)
INSERT [dbo].[Appointments] ([Id], [Date], [PatientId], [PsychologistId], [IllnessId], [ScheduleId], [Address], [DurationId], [DiscountId], [TotalCost]) VALUES (15, CAST(N'2021-06-18T00:00:00.0000000' AS DateTime2), 3, 8, 6, 5, N'http://bettercalm.com.uy/meeting_id/78e25e73-f562-4491-b312-994255a5f55b', 3, NULL, 1500)
INSERT [dbo].[Appointments] ([Id], [Date], [PatientId], [PsychologistId], [IllnessId], [ScheduleId], [Address], [DurationId], [DiscountId], [TotalCost]) VALUES (16, CAST(N'2021-06-18T00:00:00.0000000' AS DateTime2), 3, 8, 6, 5, N'http://bettercalm.com.uy/meeting_id/bd842a68-5077-48b5-baf9-5afd8a6531a2', 3, NULL, 1500)
INSERT [dbo].[Appointments] ([Id], [Date], [PatientId], [PsychologistId], [IllnessId], [ScheduleId], [Address], [DurationId], [DiscountId], [TotalCost]) VALUES (17, CAST(N'2021-06-18T00:00:00.0000000' AS DateTime2), 3, 8, 6, 5, N'http://bettercalm.com.uy/meeting_id/ee0c8bb3-96e8-4f36-80d3-2a71239515cc', 2, NULL, 1125)
SET IDENTITY_INSERT [dbo].[Appointments] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name]) VALUES (1, N'Dormir')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (2, N'Meditar')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (3, N'Música')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (4, N'Cuerpo')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
INSERT [dbo].[CategoryContent] ([CategoriesId], [ContentsId]) VALUES (2, 5)
INSERT [dbo].[CategoryContent] ([CategoriesId], [ContentsId]) VALUES (3, 6)
INSERT [dbo].[CategoryContent] ([CategoriesId], [ContentsId]) VALUES (3, 7)
INSERT [dbo].[CategoryContent] ([CategoriesId], [ContentsId]) VALUES (1, 8)
INSERT [dbo].[CategoryContent] ([CategoriesId], [ContentsId]) VALUES (2, 9)
INSERT [dbo].[CategoryContent] ([CategoriesId], [ContentsId]) VALUES (2, 10)
INSERT [dbo].[CategoryContent] ([CategoriesId], [ContentsId]) VALUES (2, 11)
INSERT [dbo].[CategoryContent] ([CategoriesId], [ContentsId]) VALUES (1, 12)
INSERT [dbo].[CategoryContent] ([CategoriesId], [ContentsId]) VALUES (2, 12)
INSERT [dbo].[CategoryContent] ([CategoriesId], [ContentsId]) VALUES (1, 13)
INSERT [dbo].[CategoryContent] ([CategoriesId], [ContentsId]) VALUES (3, 14)
INSERT [dbo].[CategoryContent] ([CategoriesId], [ContentsId]) VALUES (1, 15)
INSERT [dbo].[CategoryContent] ([CategoriesId], [ContentsId]) VALUES (3, 16)
GO
INSERT [dbo].[CategoryPlaylist] ([CategoriesId], [PlayListsId]) VALUES (3, 4)
INSERT [dbo].[CategoryPlaylist] ([CategoriesId], [PlayListsId]) VALUES (2, 5)
INSERT [dbo].[CategoryPlaylist] ([CategoriesId], [PlayListsId]) VALUES (1, 6)
INSERT [dbo].[CategoryPlaylist] ([CategoriesId], [PlayListsId]) VALUES (2, 6)
INSERT [dbo].[CategoryPlaylist] ([CategoriesId], [PlayListsId]) VALUES (2, 7)
INSERT [dbo].[CategoryPlaylist] ([CategoriesId], [PlayListsId]) VALUES (4, 7)
INSERT [dbo].[CategoryPlaylist] ([CategoriesId], [PlayListsId]) VALUES (2, 8)
INSERT [dbo].[CategoryPlaylist] ([CategoriesId], [PlayListsId]) VALUES (4, 8)
INSERT [dbo].[CategoryPlaylist] ([CategoriesId], [PlayListsId]) VALUES (3, 9)
INSERT [dbo].[CategoryPlaylist] ([CategoriesId], [PlayListsId]) VALUES (3, 10)
GO
INSERT [dbo].[ContentPlaylist] ([ContentsId], [PlayListsId]) VALUES (6, 4)
INSERT [dbo].[ContentPlaylist] ([ContentsId], [PlayListsId]) VALUES (7, 5)
INSERT [dbo].[ContentPlaylist] ([ContentsId], [PlayListsId]) VALUES (8, 6)
INSERT [dbo].[ContentPlaylist] ([ContentsId], [PlayListsId]) VALUES (9, 7)
INSERT [dbo].[ContentPlaylist] ([ContentsId], [PlayListsId]) VALUES (10, 7)
INSERT [dbo].[ContentPlaylist] ([ContentsId], [PlayListsId]) VALUES (12, 7)
INSERT [dbo].[ContentPlaylist] ([ContentsId], [PlayListsId]) VALUES (13, 7)
INSERT [dbo].[ContentPlaylist] ([ContentsId], [PlayListsId]) VALUES (11, 8)
INSERT [dbo].[ContentPlaylist] ([ContentsId], [PlayListsId]) VALUES (12, 8)
INSERT [dbo].[ContentPlaylist] ([ContentsId], [PlayListsId]) VALUES (13, 8)
INSERT [dbo].[ContentPlaylist] ([ContentsId], [PlayListsId]) VALUES (14, 9)
INSERT [dbo].[ContentPlaylist] ([ContentsId], [PlayListsId]) VALUES (16, 10)
GO
SET IDENTITY_INSERT [dbo].[Contents] ON 

INSERT [dbo].[Contents] ([Id], [Name], [ContentLength], [ArtistName], [ImageUrl], [ContentUrl], [ContentTypeId]) VALUES (5, N'Bass Loop', CAST(N'00:00:16' AS Time), N'FreeSound', N'', N'https://freesound.org/data/previews/576/576035_5674468-lq.mp3', 1)
INSERT [dbo].[Contents] ([Id], [Name], [ContentLength], [ArtistName], [ImageUrl], [ContentUrl], [ContentTypeId]) VALUES (6, N'Piano Blues', CAST(N'00:00:21' AS Time), N'FreeSound', N'https://estaticos.muyinteresante.es/media/cache/1140x_thumb/uploads/images/gallery/60620cfa5bafe8e014e6d939/dia-mundial-piano.jpg', N'https://freesound.org/data/previews/444/444867_907272-lq.mp3', 1)
INSERT [dbo].[Contents] ([Id], [Name], [ContentLength], [ArtistName], [ImageUrl], [ContentUrl], [ContentTypeId]) VALUES (7, N'American Idiot', CAST(N'00:04:04' AS Time), N'Green Day', N'https://upload.wikimedia.org/wikipedia/en/e/ed/Green_Day_-_American_Idiot_album_cover.png', N'https://www.youtube.com/embed/Ee_uujKuJMI', 2)
INSERT [dbo].[Contents] ([Id], [Name], [ContentLength], [ArtistName], [ImageUrl], [ContentUrl], [ContentTypeId]) VALUES (8, N'Rain and Thunder', CAST(N'02:40:46' AS Time), N'FreeSound', N'https://www.thoughtco.com/thmb/e-lNG0rEXRiAfHNtR6RLOL98XPo=/2576x2576/smart/filters:no_upscale()/drops-of-rain-on-glass-838815210-5a823cc0a18d9e0036e325e2.jpg', N'https://freesound.org/data/previews/574/574753_6970469-lq.mp3', 1)
INSERT [dbo].[Contents] ([Id], [Name], [ContentLength], [ArtistName], [ImageUrl], [ContentUrl], [ContentTypeId]) VALUES (9, N'Garden Warbler', CAST(N'00:01:30' AS Time), N'Acclivity', N'https://cdn.download.ams.birds.cornell.edu/api/v1/asset/256752121/1800', N'https://freesound.org/data/previews/575/575761_37876-lq.mp3', 1)
INSERT [dbo].[Contents] ([Id], [Name], [ContentLength], [ArtistName], [ImageUrl], [ContentUrl], [ContentTypeId]) VALUES (10, N'Netherlands Forest', CAST(N'00:01:37' AS Time), N'Klankbeeld', N'https://dutchreview.com/wp-content/uploads/Screenshot-2020-07-08-at-11.57.17.png', N'https://freesound.org/data/previews/575/575746_1648170-lq.mp3', 1)
INSERT [dbo].[Contents] ([Id], [Name], [ContentLength], [ArtistName], [ImageUrl], [ContentUrl], [ContentTypeId]) VALUES (11, N'Fireplace', CAST(N'00:00:28' AS Time), N'Leosalom', N'https://yvo5j1mzyhq2blucz2y3mq61-wpengine.netdna-ssl.com/wp-content/uploads/2019/12/glowing-fireplace-1.jpg', N'https://freesound.org/data/previews/234/234288_3120802-lq.mp3', 1)
INSERT [dbo].[Contents] ([Id], [Name], [ContentLength], [ArtistName], [ImageUrl], [ContentUrl], [ContentTypeId]) VALUES (12, N'Fountain', CAST(N'00:00:10' AS Time), N'SophronsineSoundDesign', N'', N'https://freesound.org/data/previews/320/320308_4830131-lq.mp3', 1)
INSERT [dbo].[Contents] ([Id], [Name], [ContentLength], [ArtistName], [ImageUrl], [ContentUrl], [ContentTypeId]) VALUES (13, N'Zen Ocean Waves', CAST(N'00:01:35' AS Time), N'INNO Records', N'https://oceanvodka.com/uploads/2019/04/HP-Hero-Header@2x.jpg', N'https://freesound.org/data/previews/456/456899_9518146-lq.mp3', 1)
INSERT [dbo].[Contents] ([Id], [Name], [ContentLength], [ArtistName], [ImageUrl], [ContentUrl], [ContentTypeId]) VALUES (14, N'More Than A Feeling (Live)', CAST(N'00:05:13' AS Time), N'Boston', N'https://positive-feedback.com/wp-content/uploads/2019/09/boston-lp-cover.jpg', N'https://www.youtube.com/embed/_kXzZXvtlAA', 2)
INSERT [dbo].[Contents] ([Id], [Name], [ContentLength], [ArtistName], [ImageUrl], [ContentUrl], [ContentTypeId]) VALUES (15, N'Soothing Rain', CAST(N'03:00:19' AS Time), N'Lucasta', N'', N'https://www.youtube.com/embed/0-bA3kfC0VU', 1)
INSERT [dbo].[Contents] ([Id], [Name], [ContentLength], [ArtistName], [ImageUrl], [ContentUrl], [ContentTypeId]) VALUES (16, N'Highway Star (Live)', CAST(N'00:07:38' AS Time), N'Deep Purple', N'https://img.discogs.com/qhECdCx8elgaoKc94fzzXi4xPVU=/fit-in/600x597/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/R-1393661-1215874847.jpeg.jpg', N'https://www.youtube.com/embed/kb5EfvVkcfA', 2)
SET IDENTITY_INSERT [dbo].[Contents] OFF
GO
SET IDENTITY_INSERT [dbo].[ContentTypes] ON 

INSERT [dbo].[ContentTypes] ([Id], [Name]) VALUES (1, N'audio')
INSERT [dbo].[ContentTypes] ([Id], [Name]) VALUES (2, N'video')
SET IDENTITY_INSERT [dbo].[ContentTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Illnesses] ON 

INSERT [dbo].[Illnesses] ([Id], [Name]) VALUES (1, N'Depresión')
INSERT [dbo].[Illnesses] ([Id], [Name]) VALUES (2, N'Estrés')
INSERT [dbo].[Illnesses] ([Id], [Name]) VALUES (3, N'Ansiedad')
INSERT [dbo].[Illnesses] ([Id], [Name]) VALUES (4, N'Autoestima')
INSERT [dbo].[Illnesses] ([Id], [Name]) VALUES (5, N'Enojo')
INSERT [dbo].[Illnesses] ([Id], [Name]) VALUES (6, N'Relaciones')
INSERT [dbo].[Illnesses] ([Id], [Name]) VALUES (7, N'Duelo')
INSERT [dbo].[Illnesses] ([Id], [Name]) VALUES (8, N'Otros')
SET IDENTITY_INSERT [dbo].[Illnesses] OFF
GO
INSERT [dbo].[IllnessPsychologist] ([IllnessesId], [PsychologistsId]) VALUES (4, 5)
INSERT [dbo].[IllnessPsychologist] ([IllnessesId], [PsychologistsId]) VALUES (6, 5)
INSERT [dbo].[IllnessPsychologist] ([IllnessesId], [PsychologistsId]) VALUES (8, 5)
INSERT [dbo].[IllnessPsychologist] ([IllnessesId], [PsychologistsId]) VALUES (8, 6)
INSERT [dbo].[IllnessPsychologist] ([IllnessesId], [PsychologistsId]) VALUES (1, 7)
INSERT [dbo].[IllnessPsychologist] ([IllnessesId], [PsychologistsId]) VALUES (3, 7)
INSERT [dbo].[IllnessPsychologist] ([IllnessesId], [PsychologistsId]) VALUES (6, 7)
INSERT [dbo].[IllnessPsychologist] ([IllnessesId], [PsychologistsId]) VALUES (1, 8)
INSERT [dbo].[IllnessPsychologist] ([IllnessesId], [PsychologistsId]) VALUES (2, 8)
INSERT [dbo].[IllnessPsychologist] ([IllnessesId], [PsychologistsId]) VALUES (6, 8)
GO
SET IDENTITY_INSERT [dbo].[Patients] ON 

INSERT [dbo].[Patients] ([Id], [BirthDate], [Email], [Phone], [FirstName], [LastName], [AppointmentDiscountId], [AppointmentQuantity]) VALUES (1, CAST(N'1985-06-19T00:00:00.0000000' AS DateTime2), N'juan.perez@gmail.com', N'095475963', N'Juan', N'Perez', NULL, 6)
INSERT [dbo].[Patients] ([Id], [BirthDate], [Email], [Phone], [FirstName], [LastName], [AppointmentDiscountId], [AppointmentQuantity]) VALUES (2, CAST(N'1990-01-25T00:00:00.0000000' AS DateTime2), N'emiliano.sanchez@hotmail.com', N'099123456', N'Emiliano', N'Sanchez', NULL, 6)
INSERT [dbo].[Patients] ([Id], [BirthDate], [Email], [Phone], [FirstName], [LastName], [AppointmentDiscountId], [AppointmentQuantity]) VALUES (3, CAST(N'1967-03-12T00:00:00.0000000' AS DateTime2), N'rgonzalez@yahoo.com', N'094741852', N'Roberto', N'Gonzalez', NULL, 5)
SET IDENTITY_INSERT [dbo].[Patients] OFF
GO
SET IDENTITY_INSERT [dbo].[Playlists] ON 

INSERT [dbo].[Playlists] ([Id], [Name], [Description], [ImageUrl]) VALUES (4, N'FreeSound', N'FreeSound Loops', N'https://i1.sndcdn.com/avatars-000653353839-yj891e-t500x500.jpg')
INSERT [dbo].[Playlists] ([Id], [Name], [Description], [ImageUrl]) VALUES (5, N'American Idiot', N'2004 American Idiot - Green Day', N'https://images-na.ssl-images-amazon.com/images/I/61Oz6VUs1fL.jpg')
INSERT [dbo].[Playlists] ([Id], [Name], [Description], [ImageUrl]) VALUES (6, N'Lluvia', N'Contenido de lluvia', N'https://d1ymz67w5raq8g.cloudfront.net/Pictures/480xAny/8/5/1/130851_shutterstock_411220273.jpg')
INSERT [dbo].[Playlists] ([Id], [Name], [Description], [ImageUrl]) VALUES (7, N'Naturaleza', N'Sonidos de la Naturaleza', N'https://natureconservancy-h.assetsadobe.com/is/image/content/dam/tnc/nature/en/photos/Zugpsitze_mountain.jpg?crop=0,176,3008,1654&wid=4000&hei=2200&scl=0.752')
INSERT [dbo].[Playlists] ([Id], [Name], [Description], [ImageUrl]) VALUES (8, N'Relaxing Sounds', N'Sounds to relax', NULL)
INSERT [dbo].[Playlists] ([Id], [Name], [Description], [ImageUrl]) VALUES (9, N'Best of Boston', N'Best song by Boston', N'https://images-na.ssl-images-amazon.com/images/I/812OnYErLwL._SL1500_.jpg')
INSERT [dbo].[Playlists] ([Id], [Name], [Description], [ImageUrl]) VALUES (10, N'Deep Purple Hits', N'Best hit songs by Deep Purple', N'https://pbs.twimg.com/profile_images/1225705654620319745/kffXOTYz_400x400.jpg')
SET IDENTITY_INSERT [dbo].[Playlists] OFF
GO
SET IDENTITY_INSERT [dbo].[PsychologistRate] ON 

INSERT [dbo].[PsychologistRate] ([Id], [HourlyRate]) VALUES (1, 500)
INSERT [dbo].[PsychologistRate] ([Id], [HourlyRate]) VALUES (2, 750)
INSERT [dbo].[PsychologistRate] ([Id], [HourlyRate]) VALUES (3, 1000)
INSERT [dbo].[PsychologistRate] ([Id], [HourlyRate]) VALUES (4, 2000)
SET IDENTITY_INSERT [dbo].[PsychologistRate] OFF
GO
SET IDENTITY_INSERT [dbo].[Psychologists] ON 

INSERT [dbo].[Psychologists] ([Id], [Address], [Format], [CreatedDate], [FirstName], [LastName], [RateId]) VALUES (5, N'1247 Golden Oak Street', 1, CAST(N'2021-06-16T20:26:02.5620683' AS DateTime2), N'Hannibal', N'Lecter', 3)
INSERT [dbo].[Psychologists] ([Id], [Address], [Format], [CreatedDate], [FirstName], [LastName], [RateId]) VALUES (6, N'Berggasse 19', 1, CAST(N'2021-06-16T20:29:00.5964476' AS DateTime2), N'Sigmund', N'Freud', 4)
INSERT [dbo].[Psychologists] ([Id], [Address], [Format], [CreatedDate], [FirstName], [LastName], [RateId]) VALUES (7, N'Kolymazhnyy Pereulok 14', 1, CAST(N'2021-06-16T20:31:01.9716895' AS DateTime2), N'Ivan', N'Pavlov', 1)
INSERT [dbo].[Psychologists] ([Id], [Address], [Format], [CreatedDate], [FirstName], [LastName], [RateId]) VALUES (8, N'200 Eastern Pkwy', 0, CAST(N'2021-06-16T20:41:29.1450260' AS DateTime2), N'Abraham', N'Maslow', 2)
SET IDENTITY_INSERT [dbo].[Psychologists] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Name], [Description]) VALUES (1, N'Administrator', N'Administrator')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
INSERT [dbo].[RoleUser] ([RolesId], [UsersId]) VALUES (1, 1)
INSERT [dbo].[RoleUser] ([RolesId], [UsersId]) VALUES (1, 4)
INSERT [dbo].[RoleUser] ([RolesId], [UsersId]) VALUES (1, 5)
GO
SET IDENTITY_INSERT [dbo].[Schedule] ON 

INSERT [dbo].[Schedule] ([Id], [PsychologistId], [Date]) VALUES (2, 5, CAST(N'2021-06-18T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Schedule] ([Id], [PsychologistId], [Date]) VALUES (3, 6, CAST(N'2021-06-18T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Schedule] ([Id], [PsychologistId], [Date]) VALUES (4, 7, CAST(N'2021-06-18T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Schedule] ([Id], [PsychologistId], [Date]) VALUES (5, 8, CAST(N'2021-06-18T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Schedule] OFF
GO
SET IDENTITY_INSERT [dbo].[Sessions] ON 

INSERT [dbo].[Sessions] ([Id], [Token], [UserId]) VALUES (50, N'221e3fe9-9f9f-4a4b-81ce-b99d34a5a8e2', 1)
SET IDENTITY_INSERT [dbo].[Sessions] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [Email], [Password], [Name]) VALUES (1, N'admin@admin.com', N'admin1234', N'Admin')
INSERT [dbo].[User] ([Id], [Email], [Password], [Name]) VALUES (4, N'jose.pedro.amado@gmail.com', N'password', N'José Pedro Amado')
INSERT [dbo].[User] ([Id], [Email], [Password], [Name]) VALUES (5, N'dscaffo@gmail.com', N'password', N'Diego Scaffo')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
/****** Object:  Index [IX_Appointments_DiscountId]    Script Date: 17-Jun-21 14:51:15 ******/
CREATE NONCLUSTERED INDEX [IX_Appointments_DiscountId] ON [dbo].[Appointments]
(
	[DiscountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Appointments_DurationId]    Script Date: 17-Jun-21 14:51:15 ******/
CREATE NONCLUSTERED INDEX [IX_Appointments_DurationId] ON [dbo].[Appointments]
(
	[DurationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Appointments_IllnessId]    Script Date: 17-Jun-21 14:51:15 ******/
CREATE NONCLUSTERED INDEX [IX_Appointments_IllnessId] ON [dbo].[Appointments]
(
	[IllnessId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Appointments_PatientId]    Script Date: 17-Jun-21 14:51:15 ******/
CREATE NONCLUSTERED INDEX [IX_Appointments_PatientId] ON [dbo].[Appointments]
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Appointments_PsychologistId]    Script Date: 17-Jun-21 14:51:15 ******/
CREATE NONCLUSTERED INDEX [IX_Appointments_PsychologistId] ON [dbo].[Appointments]
(
	[PsychologistId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Appointments_ScheduleId]    Script Date: 17-Jun-21 14:51:15 ******/
CREATE NONCLUSTERED INDEX [IX_Appointments_ScheduleId] ON [dbo].[Appointments]
(
	[ScheduleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CategoryContent_ContentsId]    Script Date: 17-Jun-21 14:51:15 ******/
CREATE NONCLUSTERED INDEX [IX_CategoryContent_ContentsId] ON [dbo].[CategoryContent]
(
	[ContentsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CategoryPlaylist_PlayListsId]    Script Date: 17-Jun-21 14:51:15 ******/
CREATE NONCLUSTERED INDEX [IX_CategoryPlaylist_PlayListsId] ON [dbo].[CategoryPlaylist]
(
	[PlayListsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ContentPlaylist_PlayListsId]    Script Date: 17-Jun-21 14:51:15 ******/
CREATE NONCLUSTERED INDEX [IX_ContentPlaylist_PlayListsId] ON [dbo].[ContentPlaylist]
(
	[PlayListsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Contents_ContentTypeId]    Script Date: 17-Jun-21 14:51:15 ******/
CREATE NONCLUSTERED INDEX [IX_Contents_ContentTypeId] ON [dbo].[Contents]
(
	[ContentTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IllnessPsychologist_PsychologistsId]    Script Date: 17-Jun-21 14:51:15 ******/
CREATE NONCLUSTERED INDEX [IX_IllnessPsychologist_PsychologistsId] ON [dbo].[IllnessPsychologist]
(
	[PsychologistsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Patients_AppointmentDiscountId]    Script Date: 17-Jun-21 14:51:15 ******/
CREATE NONCLUSTERED INDEX [IX_Patients_AppointmentDiscountId] ON [dbo].[Patients]
(
	[AppointmentDiscountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Psychologists_RateId]    Script Date: 17-Jun-21 14:51:15 ******/
CREATE NONCLUSTERED INDEX [IX_Psychologists_RateId] ON [dbo].[Psychologists]
(
	[RateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RoleUser_UsersId]    Script Date: 17-Jun-21 14:51:15 ******/
CREATE NONCLUSTERED INDEX [IX_RoleUser_UsersId] ON [dbo].[RoleUser]
(
	[UsersId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Schedule_PsychologistId]    Script Date: 17-Jun-21 14:51:15 ******/
CREATE NONCLUSTERED INDEX [IX_Schedule_PsychologistId] ON [dbo].[Schedule]
(
	[PsychologistId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Sessions_UserId]    Script Date: 17-Jun-21 14:51:15 ******/
CREATE NONCLUSTERED INDEX [IX_Sessions_UserId] ON [dbo].[Sessions]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_User_Email]    Script Date: 17-Jun-21 14:51:15 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_User_Email] ON [dbo].[User]
(
	[Email] ASC
)
WHERE ([Email] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Appointments] ADD  DEFAULT ((0.000000000000000e+000)) FOR [TotalCost]
GO
ALTER TABLE [dbo].[Contents] ADD  DEFAULT (N'') FOR [Name]
GO
ALTER TABLE [dbo].[Contents] ADD  DEFAULT (N'') FOR [ArtistName]
GO
ALTER TABLE [dbo].[Contents] ADD  DEFAULT (N'') FOR [ContentUrl]
GO
ALTER TABLE [dbo].[Patients] ADD  DEFAULT (N'') FOR [Email]
GO
ALTER TABLE [dbo].[Patients] ADD  DEFAULT (N'') FOR [Phone]
GO
ALTER TABLE [dbo].[Patients] ADD  DEFAULT (N'') FOR [FirstName]
GO
ALTER TABLE [dbo].[Patients] ADD  DEFAULT (N'') FOR [LastName]
GO
ALTER TABLE [dbo].[Patients] ADD  DEFAULT ((0)) FOR [AppointmentQuantity]
GO
ALTER TABLE [dbo].[Playlists] ADD  DEFAULT (N'') FOR [Name]
GO
ALTER TABLE [dbo].[Playlists] ADD  DEFAULT (N'') FOR [Description]
GO
ALTER TABLE [dbo].[Psychologists] ADD  DEFAULT (N'') FOR [Address]
GO
ALTER TABLE [dbo].[Psychologists] ADD  DEFAULT (N'') FOR [FirstName]
GO
ALTER TABLE [dbo].[Psychologists] ADD  DEFAULT (N'') FOR [LastName]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT (N'') FOR [Password]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT (N'') FOR [Name]
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD  CONSTRAINT [FK_Appointments_AppointmentDiscount_DiscountId] FOREIGN KEY([DiscountId])
REFERENCES [dbo].[AppointmentDiscount] ([Id])
GO
ALTER TABLE [dbo].[Appointments] CHECK CONSTRAINT [FK_Appointments_AppointmentDiscount_DiscountId]
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD  CONSTRAINT [FK_Appointments_AppointmentDuration_DurationId] FOREIGN KEY([DurationId])
REFERENCES [dbo].[AppointmentDuration] ([Id])
GO
ALTER TABLE [dbo].[Appointments] CHECK CONSTRAINT [FK_Appointments_AppointmentDuration_DurationId]
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD  CONSTRAINT [FK_Appointments_Illnesses_IllnessId] FOREIGN KEY([IllnessId])
REFERENCES [dbo].[Illnesses] ([Id])
GO
ALTER TABLE [dbo].[Appointments] CHECK CONSTRAINT [FK_Appointments_Illnesses_IllnessId]
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD  CONSTRAINT [FK_Appointments_Patients_PatientId] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patients] ([Id])
GO
ALTER TABLE [dbo].[Appointments] CHECK CONSTRAINT [FK_Appointments_Patients_PatientId]
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD  CONSTRAINT [FK_Appointments_Psychologists_PsychologistId] FOREIGN KEY([PsychologistId])
REFERENCES [dbo].[Psychologists] ([Id])
GO
ALTER TABLE [dbo].[Appointments] CHECK CONSTRAINT [FK_Appointments_Psychologists_PsychologistId]
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD  CONSTRAINT [FK_Appointments_Schedule_ScheduleId] FOREIGN KEY([ScheduleId])
REFERENCES [dbo].[Schedule] ([Id])
GO
ALTER TABLE [dbo].[Appointments] CHECK CONSTRAINT [FK_Appointments_Schedule_ScheduleId]
GO
ALTER TABLE [dbo].[CategoryContent]  WITH CHECK ADD  CONSTRAINT [FK_CategoryContent_Categories_CategoriesId] FOREIGN KEY([CategoriesId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CategoryContent] CHECK CONSTRAINT [FK_CategoryContent_Categories_CategoriesId]
GO
ALTER TABLE [dbo].[CategoryContent]  WITH CHECK ADD  CONSTRAINT [FK_CategoryContent_Contents_ContentsId] FOREIGN KEY([ContentsId])
REFERENCES [dbo].[Contents] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CategoryContent] CHECK CONSTRAINT [FK_CategoryContent_Contents_ContentsId]
GO
ALTER TABLE [dbo].[CategoryPlaylist]  WITH CHECK ADD  CONSTRAINT [FK_CategoryPlaylist_Categories_CategoriesId] FOREIGN KEY([CategoriesId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CategoryPlaylist] CHECK CONSTRAINT [FK_CategoryPlaylist_Categories_CategoriesId]
GO
ALTER TABLE [dbo].[CategoryPlaylist]  WITH CHECK ADD  CONSTRAINT [FK_CategoryPlaylist_Playlists_PlayListsId] FOREIGN KEY([PlayListsId])
REFERENCES [dbo].[Playlists] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CategoryPlaylist] CHECK CONSTRAINT [FK_CategoryPlaylist_Playlists_PlayListsId]
GO
ALTER TABLE [dbo].[ContentPlaylist]  WITH CHECK ADD  CONSTRAINT [FK_ContentPlaylist_Contents_ContentsId] FOREIGN KEY([ContentsId])
REFERENCES [dbo].[Contents] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ContentPlaylist] CHECK CONSTRAINT [FK_ContentPlaylist_Contents_ContentsId]
GO
ALTER TABLE [dbo].[ContentPlaylist]  WITH CHECK ADD  CONSTRAINT [FK_ContentPlaylist_Playlists_PlayListsId] FOREIGN KEY([PlayListsId])
REFERENCES [dbo].[Playlists] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ContentPlaylist] CHECK CONSTRAINT [FK_ContentPlaylist_Playlists_PlayListsId]
GO
ALTER TABLE [dbo].[Contents]  WITH CHECK ADD  CONSTRAINT [FK_Contents_ContentTypes_ContentTypeId] FOREIGN KEY([ContentTypeId])
REFERENCES [dbo].[ContentTypes] ([Id])
GO
ALTER TABLE [dbo].[Contents] CHECK CONSTRAINT [FK_Contents_ContentTypes_ContentTypeId]
GO
ALTER TABLE [dbo].[IllnessPsychologist]  WITH CHECK ADD  CONSTRAINT [FK_IllnessPsychologist_Illnesses_IllnessesId] FOREIGN KEY([IllnessesId])
REFERENCES [dbo].[Illnesses] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[IllnessPsychologist] CHECK CONSTRAINT [FK_IllnessPsychologist_Illnesses_IllnessesId]
GO
ALTER TABLE [dbo].[IllnessPsychologist]  WITH CHECK ADD  CONSTRAINT [FK_IllnessPsychologist_Psychologists_PsychologistsId] FOREIGN KEY([PsychologistsId])
REFERENCES [dbo].[Psychologists] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[IllnessPsychologist] CHECK CONSTRAINT [FK_IllnessPsychologist_Psychologists_PsychologistsId]
GO
ALTER TABLE [dbo].[Patients]  WITH CHECK ADD  CONSTRAINT [FK_Patients_AppointmentDiscount_AppointmentDiscountId] FOREIGN KEY([AppointmentDiscountId])
REFERENCES [dbo].[AppointmentDiscount] ([Id])
GO
ALTER TABLE [dbo].[Patients] CHECK CONSTRAINT [FK_Patients_AppointmentDiscount_AppointmentDiscountId]
GO
ALTER TABLE [dbo].[Psychologists]  WITH CHECK ADD  CONSTRAINT [FK_Psychologists_PsychologistRate_RateId] FOREIGN KEY([RateId])
REFERENCES [dbo].[PsychologistRate] ([Id])
GO
ALTER TABLE [dbo].[Psychologists] CHECK CONSTRAINT [FK_Psychologists_PsychologistRate_RateId]
GO
ALTER TABLE [dbo].[RoleUser]  WITH CHECK ADD  CONSTRAINT [FK_RoleUser_Role_RolesId] FOREIGN KEY([RolesId])
REFERENCES [dbo].[Role] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RoleUser] CHECK CONSTRAINT [FK_RoleUser_Role_RolesId]
GO
ALTER TABLE [dbo].[RoleUser]  WITH CHECK ADD  CONSTRAINT [FK_RoleUser_User_UsersId] FOREIGN KEY([UsersId])
REFERENCES [dbo].[User] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RoleUser] CHECK CONSTRAINT [FK_RoleUser_User_UsersId]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Psychologists_PsychologistId] FOREIGN KEY([PsychologistId])
REFERENCES [dbo].[Psychologists] ([Id])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_Psychologists_PsychologistId]
GO
ALTER TABLE [dbo].[Sessions]  WITH CHECK ADD  CONSTRAINT [FK_Sessions_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Sessions] CHECK CONSTRAINT [FK_Sessions_User_UserId]
GO
USE [master]
GO
ALTER DATABASE [BetterCalmDB] SET  READ_WRITE 
GO
