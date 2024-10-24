USE [master]
GO
/****** Object:  Database [PIT]    Script Date: 21.10.2024 13:57:09 ******/
CREATE DATABASE [PIT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PIT', FILENAME = N'C:\SQL\MSSQL15.SQLEXPRESS\MSSQL\DATA\PIT.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PIT_log', FILENAME = N'C:\SQL\MSSQL15.SQLEXPRESS\MSSQL\DATA\PIT_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PIT] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PIT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PIT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PIT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PIT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PIT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PIT] SET ARITHABORT OFF 
GO
ALTER DATABASE [PIT] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PIT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PIT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PIT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PIT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PIT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PIT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PIT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PIT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PIT] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PIT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PIT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PIT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PIT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PIT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PIT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PIT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PIT] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PIT] SET  MULTI_USER 
GO
ALTER DATABASE [PIT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PIT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PIT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PIT] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PIT] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PIT] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PIT] SET QUERY_STORE = OFF
GO
USE [PIT]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 21.10.2024 13:57:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[Client_ID] [int] IDENTITY(1,1) NOT NULL,
	[Full_Name] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](200) NOT NULL,
	[Phone] [int] NOT NULL,
	[Date_fo_Bith] [date] NOT NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[Client_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 21.10.2024 13:57:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Employee_ID] [int] IDENTITY(1,1) NOT NULL,
	[Full_name] [nvarchar](max) NOT NULL,
	[Date_of_Bith] [date] NOT NULL,
	[Phone] [int] NOT NULL,
	[Role] [nvarchar](100) NOT NULL,
	[Login] [nvarchar](150) NOT NULL,
	[Password] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Employee_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 21.10.2024 13:57:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Order_ID] [int] IDENTITY(1,1) NOT NULL,
	[Client_ID] [int] NOT NULL,
	[Product_ID] [int] NOT NULL,
	[Employee_ID] [int] NOT NULL,
	[Product__Name] [nvarchar](150) NOT NULL,
	[Data] [date] NOT NULL,
	[Sum] [money] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Order_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 21.10.2024 13:57:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Product_ID] [int] IDENTITY(1,1) NOT NULL,
	[Provider_ID] [int] NOT NULL,
	[Product_Name] [nvarchar](150) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Cost] [money] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Product_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provider]    Script Date: 21.10.2024 13:57:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provider](
	[Provider_ID] [int] IDENTITY(1,1) NOT NULL,
	[Company] [nvarchar](100) NOT NULL,
	[Payment_Account] [int] NOT NULL,
	[Address] [nvarchar](150) NOT NULL,
	[Phone] [int] NOT NULL,
	[Email] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Provider] PRIMARY KEY CLUSTERED 
(
	[Provider_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([Client_ID], [Full_Name], [Email], [Phone], [Date_fo_Bith]) VALUES (3, N'Зубенко Михаил Петрович', N'zybenko@mail.ru', 1234, CAST(N'2005-12-12' AS Date))
INSERT [dbo].[Client] ([Client_ID], [Full_Name], [Email], [Phone], [Date_fo_Bith]) VALUES (4, N'Приколось Валерий Трофимович', N'valerapipipi@ya.ru', 123456, CAST(N'2000-11-10' AS Date))
INSERT [dbo].[Client] ([Client_ID], [Full_Name], [Email], [Phone], [Date_fo_Bith]) VALUES (5, N'Шашко Дмитрий Зубила', N'zubilla@gmail.com', 1235564, CAST(N'2001-04-05' AS Date))
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([Employee_ID], [Full_name], [Date_of_Bith], [Phone], [Role], [Login], [Password]) VALUES (1, N'Шишов Валерий Мирославович', CAST(N'2001-02-10' AS Date), 123354, N'Менеджер', N'managerINI', N'managermanager')
INSERT [dbo].[Employee] ([Employee_ID], [Full_name], [Date_of_Bith], [Phone], [Role], [Login], [Password]) VALUES (2, N'Петросян Андрей Петрович', CAST(N'2002-04-15' AS Date), 123456, N'Менеждер', N'managertree', N'manager123')
INSERT [dbo].[Employee] ([Employee_ID], [Full_name], [Date_of_Bith], [Phone], [Role], [Login], [Password]) VALUES (5, N'Юреспруденович Юрий Успугал', CAST(N'1980-01-01' AS Date), 123, N'Менеждер', N'managertwo', N'managertwotwo')
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Order_ID], [Client_ID], [Product_ID], [Employee_ID], [Product__Name], [Data], [Sum]) VALUES (1, 3, 2, 2, N'BCAA', CAST(N'2024-12-05' AS Date), 1000.0000)
INSERT [dbo].[Order] ([Order_ID], [Client_ID], [Product_ID], [Employee_ID], [Product__Name], [Data], [Sum]) VALUES (5, 5, 7, 5, N'Protein', CAST(N'2024-01-21' AS Date), 150.0000)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Product_ID], [Provider_ID], [Product_Name], [Quantity], [Description], [Cost]) VALUES (2, 1, N'Protein', 1000, NULL, 150000.0000)
INSERT [dbo].[Product] ([Product_ID], [Provider_ID], [Product_Name], [Quantity], [Description], [Cost]) VALUES (7, 2, N'BCAA', 500, NULL, 150400.0000)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Provider] ON 

INSERT [dbo].[Provider] ([Provider_ID], [Company], [Payment_Account], [Address], [Phone], [Email]) VALUES (1, N'ОАО ПИТАЕМСЯ', 164545, N'Цемнтнозаводская ', 12682, N'slavavkysnoest@ya.ru')
INSERT [dbo].[Provider] ([Provider_ID], [Company], [Payment_Account], [Address], [Phone], [Email]) VALUES (2, N'ОАО ПОЕЛИ', 456972, N'Автозаводская ', 26981, N'kolyatochepoel@ya.ru')
SET IDENTITY_INSERT [dbo].[Provider] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Client] FOREIGN KEY([Client_ID])
REFERENCES [dbo].[Client] ([Client_ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Client]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Employee] FOREIGN KEY([Employee_ID])
REFERENCES [dbo].[Employee] ([Employee_ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Employee]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Product] FOREIGN KEY([Product_ID])
REFERENCES [dbo].[Product] ([Product_ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Provider] FOREIGN KEY([Provider_ID])
REFERENCES [dbo].[Provider] ([Provider_ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Provider]
GO
USE [master]
GO
ALTER DATABASE [PIT] SET  READ_WRITE 
GO
