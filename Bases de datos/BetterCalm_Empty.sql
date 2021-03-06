USE [master]
GO
/****** Object:  Database [BetterCalmDB]    Script Date: 17-Jun-21 14:03:57 ******/
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
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 17-Jun-21 14:03:57 ******/
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
/****** Object:  Table [dbo].[AppointmentDiscount]    Script Date: 17-Jun-21 14:03:57 ******/
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
/****** Object:  Table [dbo].[AppointmentDuration]    Script Date: 17-Jun-21 14:03:57 ******/
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
/****** Object:  Table [dbo].[Appointments]    Script Date: 17-Jun-21 14:03:57 ******/
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
/****** Object:  Table [dbo].[Categories]    Script Date: 17-Jun-21 14:03:57 ******/
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
/****** Object:  Table [dbo].[CategoryContent]    Script Date: 17-Jun-21 14:03:57 ******/
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
/****** Object:  Table [dbo].[CategoryPlaylist]    Script Date: 17-Jun-21 14:03:57 ******/
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
/****** Object:  Table [dbo].[ContentPlaylist]    Script Date: 17-Jun-21 14:03:57 ******/
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
/****** Object:  Table [dbo].[Contents]    Script Date: 17-Jun-21 14:03:57 ******/
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
/****** Object:  Table [dbo].[ContentTypes]    Script Date: 17-Jun-21 14:03:57 ******/
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
/****** Object:  Table [dbo].[Illnesses]    Script Date: 17-Jun-21 14:03:57 ******/
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
/****** Object:  Table [dbo].[IllnessPsychologist]    Script Date: 17-Jun-21 14:03:57 ******/
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
/****** Object:  Table [dbo].[Patients]    Script Date: 17-Jun-21 14:03:57 ******/
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
/****** Object:  Table [dbo].[Playlists]    Script Date: 17-Jun-21 14:03:57 ******/
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
/****** Object:  Table [dbo].[PsychologistRate]    Script Date: 17-Jun-21 14:03:57 ******/
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
/****** Object:  Table [dbo].[Psychologists]    Script Date: 17-Jun-21 14:03:57 ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 17-Jun-21 14:03:57 ******/
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
/****** Object:  Table [dbo].[RoleUser]    Script Date: 17-Jun-21 14:03:57 ******/
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
/****** Object:  Table [dbo].[Schedule]    Script Date: 17-Jun-21 14:03:57 ******/
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
/****** Object:  Table [dbo].[Sessions]    Script Date: 17-Jun-21 14:03:57 ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 17-Jun-21 14:03:57 ******/
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
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name]) VALUES (1, N'Dormir')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (2, N'Meditar')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (3, N'Música')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (4, N'Cuerpo')
SET IDENTITY_INSERT [dbo].[Categories] OFF
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
SET IDENTITY_INSERT [dbo].[PsychologistRate] ON 

INSERT [dbo].[PsychologistRate] ([Id], [HourlyRate]) VALUES (1, 500)
INSERT [dbo].[PsychologistRate] ([Id], [HourlyRate]) VALUES (2, 750)
INSERT [dbo].[PsychologistRate] ([Id], [HourlyRate]) VALUES (3, 1000)
INSERT [dbo].[PsychologistRate] ([Id], [HourlyRate]) VALUES (4, 2000)
SET IDENTITY_INSERT [dbo].[PsychologistRate] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Name], [Description]) VALUES (1, N'Administrator', N'Administrator')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
INSERT [dbo].[RoleUser] ([RolesId], [UsersId]) VALUES (1, 1)
GO
SET IDENTITY_INSERT [dbo].[Sessions] ON 

INSERT [dbo].[Sessions] ([Id], [Token], [UserId]) VALUES (51, N'9ab88210-0cae-4897-825f-5e49ab6e7dec', 1)
SET IDENTITY_INSERT [dbo].[Sessions] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [Email], [Password], [Name]) VALUES (1, N'admin@admin.com', N'admin1234', N'Admin')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
/****** Object:  Index [IX_Appointments_DiscountId]    Script Date: 17-Jun-21 14:03:57 ******/
CREATE NONCLUSTERED INDEX [IX_Appointments_DiscountId] ON [dbo].[Appointments]
(
	[DiscountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Appointments_DurationId]    Script Date: 17-Jun-21 14:03:57 ******/
CREATE NONCLUSTERED INDEX [IX_Appointments_DurationId] ON [dbo].[Appointments]
(
	[DurationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Appointments_IllnessId]    Script Date: 17-Jun-21 14:03:57 ******/
CREATE NONCLUSTERED INDEX [IX_Appointments_IllnessId] ON [dbo].[Appointments]
(
	[IllnessId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Appointments_PatientId]    Script Date: 17-Jun-21 14:03:57 ******/
CREATE NONCLUSTERED INDEX [IX_Appointments_PatientId] ON [dbo].[Appointments]
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Appointments_PsychologistId]    Script Date: 17-Jun-21 14:03:57 ******/
CREATE NONCLUSTERED INDEX [IX_Appointments_PsychologistId] ON [dbo].[Appointments]
(
	[PsychologistId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Appointments_ScheduleId]    Script Date: 17-Jun-21 14:03:57 ******/
CREATE NONCLUSTERED INDEX [IX_Appointments_ScheduleId] ON [dbo].[Appointments]
(
	[ScheduleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CategoryContent_ContentsId]    Script Date: 17-Jun-21 14:03:57 ******/
CREATE NONCLUSTERED INDEX [IX_CategoryContent_ContentsId] ON [dbo].[CategoryContent]
(
	[ContentsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CategoryPlaylist_PlayListsId]    Script Date: 17-Jun-21 14:03:57 ******/
CREATE NONCLUSTERED INDEX [IX_CategoryPlaylist_PlayListsId] ON [dbo].[CategoryPlaylist]
(
	[PlayListsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ContentPlaylist_PlayListsId]    Script Date: 17-Jun-21 14:03:57 ******/
CREATE NONCLUSTERED INDEX [IX_ContentPlaylist_PlayListsId] ON [dbo].[ContentPlaylist]
(
	[PlayListsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Contents_ContentTypeId]    Script Date: 17-Jun-21 14:03:57 ******/
CREATE NONCLUSTERED INDEX [IX_Contents_ContentTypeId] ON [dbo].[Contents]
(
	[ContentTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IllnessPsychologist_PsychologistsId]    Script Date: 17-Jun-21 14:03:57 ******/
CREATE NONCLUSTERED INDEX [IX_IllnessPsychologist_PsychologistsId] ON [dbo].[IllnessPsychologist]
(
	[PsychologistsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Patients_AppointmentDiscountId]    Script Date: 17-Jun-21 14:03:57 ******/
CREATE NONCLUSTERED INDEX [IX_Patients_AppointmentDiscountId] ON [dbo].[Patients]
(
	[AppointmentDiscountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Psychologists_RateId]    Script Date: 17-Jun-21 14:03:57 ******/
CREATE NONCLUSTERED INDEX [IX_Psychologists_RateId] ON [dbo].[Psychologists]
(
	[RateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RoleUser_UsersId]    Script Date: 17-Jun-21 14:03:57 ******/
CREATE NONCLUSTERED INDEX [IX_RoleUser_UsersId] ON [dbo].[RoleUser]
(
	[UsersId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Schedule_PsychologistId]    Script Date: 17-Jun-21 14:03:57 ******/
CREATE NONCLUSTERED INDEX [IX_Schedule_PsychologistId] ON [dbo].[Schedule]
(
	[PsychologistId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Sessions_UserId]    Script Date: 17-Jun-21 14:03:57 ******/
CREATE NONCLUSTERED INDEX [IX_Sessions_UserId] ON [dbo].[Sessions]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_User_Email]    Script Date: 17-Jun-21 14:03:57 ******/
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
