USE [master]
GO
/****** Object:  Database [SondageProjet]    Script Date: 25/04/2019 08:48:18 ******/
CREATE DATABASE [SondageProjet]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SondageProjet', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\SondageProjet.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SondageProjet_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\SondageProjet_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [SondageProjet] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SondageProjet].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SondageProjet] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SondageProjet] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SondageProjet] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SondageProjet] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SondageProjet] SET ARITHABORT OFF 
GO
ALTER DATABASE [SondageProjet] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SondageProjet] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SondageProjet] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SondageProjet] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SondageProjet] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SondageProjet] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SondageProjet] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SondageProjet] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SondageProjet] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SondageProjet] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SondageProjet] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SondageProjet] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SondageProjet] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SondageProjet] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SondageProjet] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SondageProjet] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SondageProjet] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SondageProjet] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SondageProjet] SET  MULTI_USER 
GO
ALTER DATABASE [SondageProjet] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SondageProjet] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SondageProjet] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SondageProjet] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SondageProjet] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SondageProjet] SET QUERY_STORE = OFF
GO
USE [SondageProjet]
GO
/****** Object:  Table [dbo].[Reponse]    Script Date: 25/04/2019 08:48:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reponse](
	[IdReponse] [int] IDENTITY(1,1) NOT NULL,
	[NombreVoteC1] [int] NOT NULL,
	[NombreVoteC2] [int] NOT NULL,
	[NombreVoteC3] [int] NOT NULL,
	[NombreVoteC4] [int] NOT NULL,
	[NombreTotalVote] [int] NOT NULL,
	[FKIdSondage] [int] NOT NULL,
 CONSTRAINT [PK_Reponse] PRIMARY KEY CLUSTERED 
(
	[IdReponse] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sondage]    Script Date: 25/04/2019 08:48:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sondage](
	[IdSondage] [int] IDENTITY(1,1) NOT NULL,
	[Question] [nvarchar](200) NOT NULL,
	[Choix1] [nvarchar](150) NOT NULL,
	[Choix2] [nvarchar](150) NOT NULL,
	[Choix3] [nvarchar](150) NOT NULL,
	[Choix4] [nvarchar](150) NOT NULL,
	[IsChoixMultiple] [bit] NOT NULL,
	[IsDisabled] [bit] NOT NULL,
	[NumProtection] [int] NOT NULL,
 CONSTRAINT [PK_Sondage] PRIMARY KEY CLUSTERED 
(
	[IdSondage] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Reponse] ON 

INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (1, 0, 0, 0, 0, 0, 5)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (2, 0, 0, 0, 0, 0, 6)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (3, 0, 0, 0, 0, 0, 7)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (4, 0, 0, 0, 0, 0, 8)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (5, 0, 0, 0, 0, 0, 9)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (6, 0, 0, 0, 0, 0, 10)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (7, 0, 0, 0, 0, 0, 11)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (8, 0, 0, 0, 0, 0, 12)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (9, 0, 0, 0, 0, 0, 13)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (10, 0, 0, 0, 0, 0, 14)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (11, 0, 0, 0, 0, 0, 15)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (12, 0, 0, 0, 0, 0, 16)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (13, 0, 0, 0, 0, 0, 17)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (14, 0, 0, 0, 0, 0, 18)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (15, 0, 0, 0, 0, 0, 19)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (16, 0, 0, 0, 0, 0, 20)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (17, 0, 0, 0, 0, 0, 21)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (18, 0, 0, 0, 0, 0, 22)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (19, 0, 0, 0, 0, 0, 23)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (20, 1, 1, 1, 0, 3, 24)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (21, 0, 2, 1, 0, 3, 25)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (22, 0, 0, 0, 0, 0, 26)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (23, 1, 1, 0, 0, 2, 27)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (24, 0, 0, 0, 0, 0, 28)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (25, 2, 1, 1, 0, 4, 29)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (26, 2, 2, 2, 0, 6, 30)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (27, 1, 0, 1, 0, 2, 31)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (28, 0, 1, 0, 0, 1, 32)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (29, 1, 0, 1, 0, 2, 33)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (30, 0, 0, 0, 0, 0, 34)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (31, 0, 0, 0, 0, 0, 35)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (32, 0, 0, 0, 0, 0, 36)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (33, 1, 0, 1, 0, 2, 37)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (34, 0, 0, 0, 0, 0, 38)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (35, 0, 0, 0, 0, 0, 39)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (36, 0, 0, 1, 0, 1, 40)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (37, 0, 0, 0, 0, 0, 41)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (38, 0, 0, 0, 0, 0, 42)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (39, 1, 0, 1, 0, 2, 43)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (40, 1, 0, 1, 0, 2, 44)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (41, 0, 1, 0, 0, 1, 45)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (42, 1, 0, 1, 0, 2, 46)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (43, 1, 0, 1, 0, 2, 47)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (44, 1, 0, 1, 0, 2, 48)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (45, 1, 0, 1, 0, 2, 49)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (46, 1, 0, 1, 0, 2, 50)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (47, 0, 1, 1, 0, 2, 51)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (48, 1, 0, 1, 0, 2, 52)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (49, 1, 0, 1, 0, 2, 53)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (50, 1, 0, 0, 0, 1, 54)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (51, 1, 0, 1, 0, 2, 55)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (52, 1, 0, 1, 0, 2, 56)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (53, 1, 0, 1, 0, 2, 57)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (54, 1, 0, 1, 0, 2, 58)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (55, 1, 0, 1, 0, 2, 59)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (56, 1, 0, 1, 0, 2, 60)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (57, 0, 0, 0, 0, 0, 61)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (58, 1, 0, 1, 0, 2, 62)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (59, 0, 0, 0, 0, 0, 63)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (60, 0, 0, 0, 0, 0, 64)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (61, 0, 0, 0, 0, 0, 65)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (62, 0, 0, 0, 0, 0, 66)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (63, 0, 0, 0, 0, 0, 67)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (64, 1, 0, 1, 0, 2, 68)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (65, 1, 0, 1, 0, 2, 69)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (66, 1, 0, 1, 0, 2, 70)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (67, 0, 0, 0, 0, 0, 71)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (68, 0, 0, 0, 0, 0, 72)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (69, 1, 0, 1, 0, 2, 73)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (70, 1, 0, 1, 0, 2, 74)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (71, 1, 0, 1, 0, 2, 75)
INSERT [dbo].[Reponse] ([IdReponse], [NombreVoteC1], [NombreVoteC2], [NombreVoteC3], [NombreVoteC4], [NombreTotalVote], [FKIdSondage]) VALUES (72, 0, 0, 0, 0, 0, 76)
SET IDENTITY_INSERT [dbo].[Reponse] OFF
SET IDENTITY_INSERT [dbo].[Sondage] ON 

INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (1, N'dfdf', N'dsdsf', N'dfdfs', N'fddsf', N'dfsdfs', 0, 0, 24154)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (2, N'dsf', N'dsdsfsdf', N'dfdfs', N'df', N'd', 0, 0, 914496)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (3, N'BBBef', N'DDDD', N'fdDD', N'EEE', N'EEE', 0, 0, 527308)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (4, N'fdssd', N'dsfdsf', N'dsfdsf', N'dsfdfs', N'dfs', 0, 0, 148163)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (5, N'dfs', N'ddsffds', N'fsd', N'fds', N'fds', 0, 0, 472430)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (6, N'dfsdsf', N'ddsffdsf', N'sdf', N'dfs', N'dfs', 0, 0, 910284)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (7, N'dfdf', N'da', N'd', N'd', N'g', 0, 0, 603846)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (8, N'votre pays', N'France', N'guinee', N'algerie', N'suisse', 0, 0, 760082)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (9, N'votre pays', N'France', N'guinee', N'algerie', N'suisse', 0, 0, 817287)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (10, N'plat pref', N'riz', N'pates', N'salade', N'tomats', 0, 0, 521995)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (11, N'plat pref', N'riz', N'pates', N'salade', N'tomats', 0, 0, 754209)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (12, N'sport pref', N'foot', N'basket', N'tennis', N'golf', 0, 0, 870025)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (13, N'sport pref', N'foot', N'basket', N'tennis', N'golf', 0, 0, 719896)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (14, N'ffdfd', N'd', N'g', N'h', N'e', 0, 0, 543498)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (15, N'plat pref', N'riz', N'pates', N'salade', N'golf', 0, 0, 209354)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (16, N'plat pref', N'riz', N'pates', N'salade', N'golf', 0, 0, 990852)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (17, N'plat pref', N'riz', N'pates', N'salade', N'd', 0, 0, 503412)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (18, N'plat pref', N'riz', N'pates', N'salade', N'golf', 0, 0, 246462)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (19, N'plat pref', N'riz', N'pates', N'salade', N'golf', 0, 0, 97234)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (20, N'plat pref', N'riz', N'pates', N'salade', N'golf', 0, 0, 206954)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (21, N'plat pref', N'riz', N'pates', N'salade', N'golf', 1, 0, 629759)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (22, N'plat pref', N'riz', N'pates', N'salade', N'golf', 1, 0, 121450)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (23, N'plat pref', N'riz', N'pates', N'salade', N'golf', 1, 0, 663774)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (24, N'plat pref', N'riz', N'pates', N'salade', N'golf', 1, 0, 631426)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (25, N'plat pref', N'riz', N'pates', N'salade', N'golf', 0, 0, 431379)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (26, N'plat pref', N'riz', N'pates', N'salade', N'golf', 0, 0, 572403)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (27, N'plat pref', N'riz', N'pates', N'salade', N'golf', 1, 0, 124271)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (28, N'plat pref', N'riz', N'pates', N'salade', N'golf', 0, 0, 611687)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (29, N'plat pref', N'riz', N'pates', N'algerie', N'df', 1, 0, 933404)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (30, N'plat pref', N'riz', N'pates', N'algerie', N'golf', 1, 0, 962984)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (31, N'plat pref', N'riz', N'pates', N'salade', N'anchois', 1, 0, 673386)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (32, N'plat pref', N'riz', N'pates', N'salade', N'golf', 1, 0, 353673)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (33, N'plat pref', N'riz', N'pates', N'salade', N'golf', 0, 0, 704211)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (34, N'plat pref', N'riz', N'pates', N'salade', N'golf', 1, 0, 366300)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (35, N'plat pref', N'riz', N'basket', N'salade', N'df', 1, 0, 446530)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (36, N'plat pref', N'riz', N'pates', N'salade', N'golf', 1, 0, 1908)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (37, N'plat pref', N'riz', N'pates', N'salade', N'df', 1, 0, 569990)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (38, N'plat pref', N'riz', N'pates', N'salade', N'golf', 0, 0, 794753)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (39, N'plat pref', N'riz', N'pates', N'salade', N'golf', 1, 0, 895719)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (40, N'plat pref', N'riz', N'pates', N'salade', N'golf', 0, 1, 13363)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (41, N'plat pref', N'riz', N'pates', N'salade', N'golf', 1, 1, 835941)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (42, N'plat pref', N'riz', N'pates', N'salade', N'golf', 1, 0, 791979)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (43, N'plat pref', N'riz', N'pates', N'salade', N'golf', 1, 0, 900986)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (44, N'plat pref', N'riz', N'pates', N'salade', N'golf', 1, 0, 868656)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (45, N'plat pref', N'riz', N'pates', N'salade', N'golf', 0, 0, 723905)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (46, N'plat pref', N'riz', N'pates', N'salade', N'golf', 1, 0, 527526)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (47, N'plat pref', N'riz', N'pates', N'salade', N'golf', 1, 0, 656030)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (48, N'plat pref', N'riz', N'pates', N'salade', N'golf', 1, 0, 590240)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (49, N'plat pref', N'riz', N'pates', N'salade', N'golf', 1, 0, 996822)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (50, N'plat pref', N'riz', N'pates', N'salade', N'', 1, 0, 953387)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (51, N'plat pref', N'riz', N'pates', N'salade', N'golf', 1, 0, 242125)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (52, N'plat pref', N'riz', N'pates', N'salade', N'golf', 1, 0, 478562)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (53, N'plat pref', N'riz', N'pates', N'salade', N'', 1, 0, 968056)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (54, N'plat pref', N'riz', N'pates', N'salade', N'', 1, 0, 79472)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (55, N'plat pref', N'riz', N'pates', N'salade', N'anchois', 1, 0, 77194)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (56, N'plat pref', N'riz', N'pates', N'salade', N'anchois', 1, 0, 39499)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (57, N'plat pref', N'riz', N'pates', N'salade', N'anchois', 1, 0, 750101)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (58, N'plat pref', N'riz', N'pates', N'salade', N'golf', 1, 0, 318053)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (59, N'plat pref', N'riz', N'pates', N'salade', N'golf', 1, 0, 359458)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (60, N'plat pref', N'riz', N'pates', N'salade', N'golf', 1, 0, 985172)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (61, N'plat pref', N'riz', N'pates', N'salade', N'golf', 1, 0, 108442)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (62, N'plat pref', N'riz', N'pates', N'salade', N'golf', 1, 0, 302138)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (63, N'plat pref', N'riz', N'pates', N'salade', N'golf', 1, 0, 137056)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (64, N'plat pref', N'da', N'd', N'df', N'df', 1, 0, 225176)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (65, N'plat pref', N'riz', N'pates', N'algerie', N'golf', 1, 0, 361167)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (66, N'plat pref', N'riz', N'pates', N'algerie', N'golf', 1, 0, 601942)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (67, N'plat pref', N'riz', N'pates', N'salade', N'anchois', 1, 0, 514842)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (68, N'plat pref', N'riz', N'pates', N'salade', N'anchois', 1, 0, 869892)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (69, N'plat pref', N'da', N'pates', N'salade', N'anchois', 1, 0, 688841)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (70, N'plat pref', N'riz', N'pates', N'salade', N'golf', 1, 0, 159615)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (71, N'', N'', N'', N'', N'', 0, 1, 936642)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (72, N'plat pref', N'riz', N'pates', N'salade', N'anchois', 1, 0, 903218)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (73, N'plat pref', N'riz', N'pates', N'salade', N'anchois', 1, 0, 648487)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (74, N'plat pref', N'riz', N'pizza', N'salade', N'anchois', 1, 0, 38172)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (75, N'Aimez-vous c#', N'oui', N'non', N'beaucoup', N'je ne sais pas', 1, 0, 480563)
INSERT [dbo].[Sondage] ([IdSondage], [Question], [Choix1], [Choix2], [Choix3], [Choix4], [IsChoixMultiple], [IsDisabled], [NumProtection]) VALUES (76, N'Aimez-vous c#', N'nn', N'pates', N'salade', N'golf', 0, 1, 412036)
SET IDENTITY_INSERT [dbo].[Sondage] OFF
ALTER TABLE [dbo].[Reponse]  WITH CHECK ADD  CONSTRAINT [FK_Reponse_Reponse] FOREIGN KEY([FKIdSondage])
REFERENCES [dbo].[Sondage] ([IdSondage])
GO
ALTER TABLE [dbo].[Reponse] CHECK CONSTRAINT [FK_Reponse_Reponse]
GO
USE [master]
GO
ALTER DATABASE [SondageProjet] SET  READ_WRITE 
GO
