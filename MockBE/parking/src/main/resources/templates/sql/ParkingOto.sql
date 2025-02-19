USE [master]
GO
/****** Object:  Database [ParkingProject]    Script Date: 3/29/2021 8:27:02 AM ******/
CREATE DATABASE [ParkingProject]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'J3.L.P0011', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.HUYNVDE140065\MSSQL\DATA\J3.L.P0011.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'J3.L.P0011_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.HUYNVDE140065\MSSQL\DATA\J3.L.P0011_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ParkingProject] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ParkingProject].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ParkingProject] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ParkingProject] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ParkingProject] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ParkingProject] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ParkingProject] SET ARITHABORT OFF 
GO
ALTER DATABASE [ParkingProject] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ParkingProject] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ParkingProject] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ParkingProject] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ParkingProject] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ParkingProject] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ParkingProject] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ParkingProject] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ParkingProject] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ParkingProject] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ParkingProject] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ParkingProject] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ParkingProject] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ParkingProject] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ParkingProject] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ParkingProject] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ParkingProject] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ParkingProject] SET RECOVERY FULL 
GO
ALTER DATABASE [ParkingProject] SET  MULTI_USER 
GO
ALTER DATABASE [ParkingProject] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ParkingProject] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ParkingProject] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ParkingProject] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ParkingProject] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ParkingProject]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 3/29/2021 8:27:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [nvarchar](7) NOT NULL,
	[FirstName] [nvarchar](45) NOT NULL,
	[LastName] [nvarchar](45) NOT NULL,
	[Birthdate] [date] NULL,
	[Gender] [bit] NOT NULL,
	[Phone] [char](10) NULL,
	[Email] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[HaveMonthLyPasss] [bit] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 3/29/2021 8:27:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee](
	[EmpID] [nvarchar](5) NOT NULL,
	[Password] [nvarchar](max) NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Email] [nvarchar](255) NULL,
	[Phone] [char](10) NOT NULL,
	[Role] [bit] NOT NULL CONSTRAINT [DF_Employee_Role]  DEFAULT ((0)),
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmpID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MonthlyPass]    Script Date: 3/29/2021 8:27:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MonthlyPass](
	[PassID] [nvarchar](7) NOT NULL,
	[Type] [nvarchar](7) NOT NULL,
	[RegisterDate] [date] NOT NULL,
	[ExpiryDate] [date] NOT NULL,
	[TimeIn] [date] NOT NULL,
	[TimeOut] [date] NULL,
	[VehicleID] [nvarchar](7) NULL,
 CONSTRAINT [PK_MonthlyPass] PRIMARY KEY CLUSTERED 
(
	[PassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MonthlyPassPrice]    Script Date: 3/29/2021 8:27:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MonthlyPassPrice](
	[Type] [nvarchar](7) NOT NULL,
	[Price] [money] NOT NULL,
 CONSTRAINT [PK_MonthlyPassPrice] PRIMARY KEY CLUSTERED 
(
	[Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OneTimeParking]    Script Date: 3/29/2021 8:27:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OneTimeParking](
	[ParkingID] [nvarchar](10) NOT NULL,
	[VehicleID] [nvarchar](7) NOT NULL,
	[TimeIn] [date] NOT NULL,
	[Type] [nvarchar](5) NULL,
	[TimeOut] [date] NULL,
 CONSTRAINT [PK_OneTimeParking] PRIMARY KEY CLUSTERED 
(
	[ParkingID] ASC,
	[VehicleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ParkingArea]    Script Date: 3/29/2021 8:27:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParkingArea](
	[AreaID] [nvarchar](5) NOT NULL,
	[SlotNumber] [int] NOT NULL,
	[EmpID] [nvarchar](5) NOT NULL,
	[IsMonthlyPassAllow] [bit] NOT NULL,
 CONSTRAINT [PK_ParkingArea_1] PRIMARY KEY CLUSTERED 
(
	[AreaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ParkingPrice]    Script Date: 3/29/2021 8:27:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParkingPrice](
	[Type] [nvarchar](5) NOT NULL,
	[CostPerHour] [decimal](10, 0) NULL,
	[CostPerDay] [decimal](10, 0) NULL,
 CONSTRAINT [PK_ParkingPrice] PRIMARY KEY CLUSTERED 
(
	[Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Slot]    Script Date: 3/29/2021 8:27:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slot](
	[SlotID] [nvarchar](5) NOT NULL,
	[AreaID] [nvarchar](5) NOT NULL,
	[VehicleID] [nvarchar](7) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Slot_1] PRIMARY KEY CLUSTERED 
(
	[SlotID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Vehicle]    Script Date: 3/29/2021 8:27:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicle](
	[VehicleID] [nvarchar](7) NOT NULL,
	[CustomerID] [nvarchar](7) NOT NULL,
	[Manufacturer] [nvarchar](50) NULL,
	[Color] [nvarchar](30) NULL,
	[SeatNumber] [int] NULL,
 CONSTRAINT [PK_Vehicle] PRIMARY KEY CLUSTERED 
(
	[VehicleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Birthdate], [Gender], [Phone], [Email], [Address], [HaveMonthLyPasss]) VALUES (N'C001', N'Nguyễn Văn', N'Huy', CAST(N'2021-03-21' AS Date), 1, N'0702484393', N'Huy@gmail.com', N'DN', 0)
INSERT [dbo].[Employee] ([EmpID], [Password], [FirstName], [LastName], [Email], [Phone], [Role]) VALUES (N'E001', NULL, N'Nguyễn Hoàng', N'My', N'My@gmail.com', N'0819028121', 0)
INSERT [dbo].[MonthlyPass] ([PassID], [Type], [RegisterDate], [ExpiryDate], [TimeIn], [TimeOut], [VehicleID]) VALUES (N'P001', N'T001', CAST(N'2021-02-03' AS Date), CAST(N'2021-03-03' AS Date), CAST(N'2021-02-03' AS Date), NULL, N'V002')
INSERT [dbo].[MonthlyPassPrice] ([Type], [Price]) VALUES (N'T001', 1000000.0000)
INSERT [dbo].[OneTimeParking] ([ParkingID], [VehicleID], [TimeIn], [Type], [TimeOut]) VALUES (N'P001', N'V001', CAST(N'2021-03-03' AS Date), NULL, NULL)
INSERT [dbo].[ParkingArea] ([AreaID], [SlotNumber], [EmpID], [IsMonthlyPassAllow]) VALUES (N'A001', 111, N'E001', 1)
INSERT [dbo].[Slot] ([SlotID], [AreaID], [VehicleID], [Status]) VALUES (N'S001', N'A001', N'V001', N'Taken')
INSERT [dbo].[Slot] ([SlotID], [AreaID], [VehicleID], [Status]) VALUES (N'S002', N'A001', N'V002', N'Taken')
INSERT [dbo].[Vehicle] ([VehicleID], [CustomerID], [Manufacturer], [Color], [SeatNumber]) VALUES (N'V001', N'C001', N'Porche', N'White', 2)
INSERT [dbo].[Vehicle] ([VehicleID], [CustomerID], [Manufacturer], [Color], [SeatNumber]) VALUES (N'V002', N'C001', N'Lamboghini', N'Black', 4)
ALTER TABLE [dbo].[MonthlyPass]  WITH CHECK ADD  CONSTRAINT [FK_MonthlyPass_MonthlyPassPrice] FOREIGN KEY([Type])
REFERENCES [dbo].[MonthlyPassPrice] ([Type])
GO
ALTER TABLE [dbo].[MonthlyPass] CHECK CONSTRAINT [FK_MonthlyPass_MonthlyPassPrice]
GO
ALTER TABLE [dbo].[MonthlyPass]  WITH CHECK ADD  CONSTRAINT [FK_MonthlyPass_Vehicle] FOREIGN KEY([VehicleID])
REFERENCES [dbo].[Vehicle] ([VehicleID])
GO
ALTER TABLE [dbo].[MonthlyPass] CHECK CONSTRAINT [FK_MonthlyPass_Vehicle]
GO
ALTER TABLE [dbo].[OneTimeParking]  WITH CHECK ADD  CONSTRAINT [FK_OneTimeParking_ParkingPrice] FOREIGN KEY([Type])
REFERENCES [dbo].[ParkingPrice] ([Type])
GO
ALTER TABLE [dbo].[OneTimeParking] CHECK CONSTRAINT [FK_OneTimeParking_ParkingPrice]
GO
ALTER TABLE [dbo].[OneTimeParking]  WITH CHECK ADD  CONSTRAINT [FK_OneTimeParking_Vehicle] FOREIGN KEY([VehicleID])
REFERENCES [dbo].[Vehicle] ([VehicleID])
GO
ALTER TABLE [dbo].[OneTimeParking] CHECK CONSTRAINT [FK_OneTimeParking_Vehicle]
GO
ALTER TABLE [dbo].[ParkingArea]  WITH CHECK ADD  CONSTRAINT [FK_ParkingArea_Employee] FOREIGN KEY([EmpID])
REFERENCES [dbo].[Employee] ([EmpID])
GO
ALTER TABLE [dbo].[ParkingArea] CHECK CONSTRAINT [FK_ParkingArea_Employee]
GO
ALTER TABLE [dbo].[Slot]  WITH CHECK ADD  CONSTRAINT [FK_Slot_ParkingArea] FOREIGN KEY([AreaID])
REFERENCES [dbo].[ParkingArea] ([AreaID])
GO
ALTER TABLE [dbo].[Slot] CHECK CONSTRAINT [FK_Slot_ParkingArea]
GO
ALTER TABLE [dbo].[Slot]  WITH CHECK ADD  CONSTRAINT [FK_Slot_Vehicle] FOREIGN KEY([VehicleID])
REFERENCES [dbo].[Vehicle] ([VehicleID])
GO
ALTER TABLE [dbo].[Slot] CHECK CONSTRAINT [FK_Slot_Vehicle]
GO
ALTER TABLE [dbo].[Vehicle]  WITH CHECK ADD  CONSTRAINT [FK_Vehicle_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Vehicle] CHECK CONSTRAINT [FK_Vehicle_Customer]
GO
USE [master]
GO
ALTER DATABASE [ParkingProject] SET  READ_WRITE 
GO
