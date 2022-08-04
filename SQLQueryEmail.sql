USE [master]
GO
/****** Object:  Database [ClientDb]    Script Date: 7/27/2022 11:09:04 PM ******/
CREATE DATABASE [ClientDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ClientDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.FINTRAKSQL\MSSQL\DATA\ClientDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ClientDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.FINTRAKSQL\MSSQL\DATA\ClientDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ClientDb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ClientDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ClientDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ClientDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ClientDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ClientDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ClientDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [ClientDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ClientDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ClientDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ClientDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ClientDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ClientDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ClientDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ClientDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ClientDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ClientDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ClientDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ClientDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ClientDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ClientDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ClientDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ClientDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ClientDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ClientDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ClientDb] SET  MULTI_USER 
GO
ALTER DATABASE [ClientDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ClientDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ClientDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ClientDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ClientDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ClientDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ClientDb] SET QUERY_STORE = OFF
GO
USE [ClientDb]
GO
/****** Object:  Table [dbo].[TBL_MobileEmail]    Script Date: 7/27/2022 11:09:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_MobileEmail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Fullname] [varchar](500) NULL,
	[Phonenumber] [varchar](50) NULL,
	[Passcode] [varchar](50) NULL,
	[Host] [varchar](50) NULL,
	[Ssl] [bit] NOT NULL,
	[Port] [int] NULL,
 CONSTRAINT [PK_TBL_MobileEmail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_WebEmail]    Script Date: 7/27/2022 11:09:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_WebEmail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Fullname] [varchar](500) NULL,
	[Phonenumber] [varchar](50) NULL,
	[Username] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Host] [varchar](50) NULL,
	[Ssl] [bit] NOT NULL,
	[Port] [int] NULL,
 CONSTRAINT [PK_Tbl_WebEmail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Tbl_WebEmail] ON 
GO
INSERT [dbo].[Tbl_WebEmail] ([ID], [Fullname], [Phonenumber], [Username], [Password], [Host], [Ssl], [Port]) VALUES (1, N'Fintrak', N'08096682900', N'wspeterok@gmail.com', N'pcbeqlazeuipeyfl', N'smtp.gmail.com', 1, 465)
GO
SET IDENTITY_INSERT [dbo].[Tbl_WebEmail] OFF
GO
ALTER TABLE [dbo].[Tbl_WebEmail] ADD  CONSTRAINT [DF_Tbl_WebEmail_Ssl]  DEFAULT ((1)) FOR [Ssl]
GO
USE [master]
GO
ALTER DATABASE [ClientDb] SET  READ_WRITE 
GO