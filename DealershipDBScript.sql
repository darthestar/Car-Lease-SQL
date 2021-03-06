USE [master]
GO
/****** Object:  Database [Car Dealership]    Script Date: 4/11/2018 2:53:30 PM ******/
CREATE DATABASE [Car Dealership]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Car Dealership', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Car Dealership.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Car Dealership_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Car Dealership_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Car Dealership] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Car Dealership].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Car Dealership] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Car Dealership] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Car Dealership] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Car Dealership] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Car Dealership] SET ARITHABORT OFF 
GO
ALTER DATABASE [Car Dealership] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Car Dealership] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Car Dealership] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Car Dealership] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Car Dealership] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Car Dealership] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Car Dealership] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Car Dealership] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Car Dealership] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Car Dealership] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Car Dealership] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Car Dealership] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Car Dealership] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Car Dealership] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Car Dealership] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Car Dealership] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Car Dealership] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Car Dealership] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Car Dealership] SET  MULTI_USER 
GO
ALTER DATABASE [Car Dealership] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Car Dealership] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Car Dealership] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Car Dealership] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Car Dealership] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Car Dealership] SET QUERY_STORE = OFF
GO
USE [Car Dealership]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Car Dealership]
GO
/****** Object:  Table [dbo].[CarDatas]    Script Date: 4/11/2018 2:53:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarDatas](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Make] [nchar](30) NULL,
	[Model] [nchar](30) NULL,
	[Year] [nchar](4) NULL,
 CONSTRAINT [PK_CarDatas] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cars]    Script Date: 4/11/2018 2:53:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cars](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Color] [nchar](20) NULL,
	[VINNumber] [nchar](20) NULL,
	[DateAddedtoLot] [date] NULL,
	[AvailableforLease] [bit] NULL,
	[MilesDriven] [int] NULL,
	[CarDataID] [int] NULL,
 CONSTRAINT [PK_Cars] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 4/11/2018 2:53:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[PhoneNumber] [nchar](15) NULL,
	[FavoredCustomer] [bit] NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Leases]    Script Date: 4/11/2018 2:53:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Leases](
	[ExpirationDate] [date] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TotalCost] [money] NULL,
	[UpFrontPayment] [money] NULL,
	[CostPerMonth] [money] NULL,
	[CarsID] [int] NULL,
 CONSTRAINT [PK_Leases] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cars]  WITH CHECK ADD  CONSTRAINT [FK_Cars_Cars] FOREIGN KEY([CarDataID])
REFERENCES [dbo].[CarDatas] ([ID])
GO
ALTER TABLE [dbo].[Cars] CHECK CONSTRAINT [FK_Cars_Cars]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_Customers] FOREIGN KEY([ID])
REFERENCES [dbo].[Customers] ([ID])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_Customers]
GO
ALTER TABLE [dbo].[Leases]  WITH CHECK ADD  CONSTRAINT [FK_Leases_Cars] FOREIGN KEY([CarsID])
REFERENCES [dbo].[Cars] ([ID])
GO
ALTER TABLE [dbo].[Leases] CHECK CONSTRAINT [FK_Leases_Cars]
GO
USE [master]
GO
ALTER DATABASE [Car Dealership] SET  READ_WRITE 
GO
