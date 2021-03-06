USE [master]
GO
/****** Object:  Database [APPD_CA2]    Script Date: 5/2/2018 2:41:51 AM ******/
CREATE DATABASE [APPD_CA2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'APPD_CA2', FILENAME = N'C:\Users\Owner\APPD_CA2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'APPD_CA2_log', FILENAME = N'C:\Users\Owner\APPD_CA2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [APPD_CA2] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [APPD_CA2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [APPD_CA2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [APPD_CA2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [APPD_CA2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [APPD_CA2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [APPD_CA2] SET ARITHABORT OFF 
GO
ALTER DATABASE [APPD_CA2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [APPD_CA2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [APPD_CA2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [APPD_CA2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [APPD_CA2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [APPD_CA2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [APPD_CA2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [APPD_CA2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [APPD_CA2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [APPD_CA2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [APPD_CA2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [APPD_CA2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [APPD_CA2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [APPD_CA2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [APPD_CA2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [APPD_CA2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [APPD_CA2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [APPD_CA2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [APPD_CA2] SET  MULTI_USER 
GO
ALTER DATABASE [APPD_CA2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [APPD_CA2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [APPD_CA2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [APPD_CA2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [APPD_CA2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [APPD_CA2] SET QUERY_STORE = OFF
GO
USE [APPD_CA2]
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
USE [APPD_CA2]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 5/2/2018 2:41:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[BookingID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[TransactionTime] [date] NOT NULL,
	[CardNo] [varchar](16) NOT NULL,
	[TourID] [char](4) NOT NULL,
	[HotelStars] [int] NOT NULL,
	[PricePaid] [decimal](15, 2) NOT NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 5/2/2018 2:41:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[UserName] [varchar](50) NOT NULL,
	[CartID] [int] IDENTITY(1,1) NOT NULL,
	[TourID] [char](4) NOT NULL,
	[HotelStars] [int] NOT NULL,
	[Price] [decimal](15, 2) NOT NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserName] ASC,
	[CartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentPremium]    Script Date: 5/2/2018 2:41:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentPremium](
	[UserName] [varchar](50) NOT NULL,
	[CardNo] [varchar](16) NOT NULL,
	[CardName] [varchar](50) NOT NULL,
	[CardED] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tour]    Script Date: 5/2/2018 2:41:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tour](
	[TourID] [char](4) NOT NULL,
	[TourName] [varchar](30) NOT NULL,
	[TourState] [varchar](20) NOT NULL,
	[Country] [varchar](30) NOT NULL,
	[Region] [varchar](20) NOT NULL,
	[Summary] [varchar](100) NOT NULL,
	[Itinerary] [varchar](30) NOT NULL,
	[Price] [decimal](15, 2) NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[Duration] [char](16) NOT NULL,
	[Quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TourID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/2/2018 2:41:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[AccountType] [char](1) NOT NULL,
	[Salution] [varchar](4) NOT NULL,
	[Name] [varchar](70) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[UserPassword] [varchar](30) NOT NULL,
	[UserAddress] [varchar](30) NOT NULL,
	[ZipCode] [int] NOT NULL,
	[PassPortNo] [varchar](9) NOT NULL,
	[PassPortExpiry] [date] NOT NULL,
	[PhoneNo] [int] NOT NULL,
	[Email] [varchar](30) NOT NULL,
	[Discount] [decimal](2, 1) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wishlist]    Script Date: 5/2/2018 2:41:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wishlist](
	[UserName] [varchar](50) NOT NULL,
	[TourID] [char](4) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserName] ASC,
	[TourID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Tour] ([TourID], [TourName], [TourState], [Country], [Region], [Summary], [Itinerary], [Price], [StartDate], [EndDate], [Duration], [Quantity]) VALUES (N'T001', N'JB''s Local Delights 4D3N', N'Johor Bahru', N'Malaysia', N'South-East Asia', N'An unforgettable trip to a city that centers Malaysia and Singapore.', N'JBtourDetails', CAST(500.00 AS Decimal(15, 2)), CAST(N'2018-02-12' AS Date), CAST(N'2018-02-16' AS Date), N'4 Days, 3 Nights', 20)
INSERT [dbo].[Tour] ([TourID], [TourName], [TourState], [Country], [Region], [Summary], [Itinerary], [Price], [StartDate], [EndDate], [Duration], [Quantity]) VALUES (N'T002', N'Malaysia''s Hottest 7D6N', N'Kuala Lumpur', N'Malaysia', N'South-East Asia', N'Capital of Malaysia, home to the Twin-Towers and its modern culture.', N'KLtourDetails', CAST(500.00 AS Decimal(15, 2)), CAST(N'2018-04-04' AS Date), CAST(N'2018-04-11' AS Date), N'7 Days, 6 Nights', NULL)
INSERT [dbo].[Tour] ([TourID], [TourName], [TourState], [Country], [Region], [Summary], [Itinerary], [Price], [StartDate], [EndDate], [Duration], [Quantity]) VALUES (N'T003', N'The Metropolitan Port 5D4N', N'Surabaya', N'Indonesia', N'South-East Asia', N'Come along and enjoy the rich history and culture-filled Metropolis.', N'SurabayatourDetails', CAST(500.00 AS Decimal(15, 2)), CAST(N'2018-06-03' AS Date), CAST(N'2018-06-08' AS Date), N'5 Days, 4 Nights', 15)
INSERT [dbo].[Tour] ([TourID], [TourName], [TourState], [Country], [Region], [Summary], [Itinerary], [Price], [StartDate], [EndDate], [Duration], [Quantity]) VALUES (N'T004', N'Historical Capital 3D2N', N'Jakarta', N'Indonesia', N'South-East Asia', N'Be enlighten about the rich history and culture of Indonesia''s capital.', N'jakatatourDetails', CAST(500.00 AS Decimal(15, 2)), CAST(N'2018-07-04' AS Date), CAST(N'2018-07-07' AS Date), N'3 Days, 2 Nights', 20)
INSERT [dbo].[Tour] ([TourID], [TourName], [TourState], [Country], [Region], [Summary], [Itinerary], [Price], [StartDate], [EndDate], [Duration], [Quantity]) VALUES (N'T005', N'Busy Busan 6D5N', N'Busan', N'South Korea', N'East Asia', N'Enjoy the sunny beaches of Busan with a taste of Korean''s culture.', N'BusantourDetails', CAST(700.00 AS Decimal(15, 2)), CAST(N'2018-07-18' AS Date), CAST(N'2018-07-24' AS Date), N'6Days, 5 Nights ', 25)
INSERT [dbo].[Tour] ([TourID], [TourName], [TourState], [Country], [Region], [Summary], [Itinerary], [Price], [StartDate], [EndDate], [Duration], [Quantity]) VALUES (N'T006', N'Modern Metropolis 7D6N', N'Seoul', N'South Korea', N'East Asia', N'Home to K-pop and a rich fashion industry, enter the land of Korea.', N'SeoultourDetails', CAST(700.00 AS Decimal(15, 2)), CAST(N'2018-08-01' AS Date), CAST(N'2018-08-08' AS Date), N'7 Days, 6 Nights', 5)
INSERT [dbo].[Tour] ([TourID], [TourName], [TourState], [Country], [Region], [Summary], [Itinerary], [Price], [StartDate], [EndDate], [Duration], [Quantity]) VALUES (N'T007', N'The Old Capital 3D2N', N'Kyoto', N'Japan', N'East Asia', N'Discover Kyoto, former-capital of the rich cultured country, Japan.', N'KyototourDetails', CAST(700.00 AS Decimal(15, 2)), CAST(N'2018-08-11' AS Date), CAST(N'2018-08-14' AS Date), N'3 Days, 2 Nights', NULL)
INSERT [dbo].[Tour] ([TourID], [TourName], [TourState], [Country], [Region], [Summary], [Itinerary], [Price], [StartDate], [EndDate], [Duration], [Quantity]) VALUES (N'T008', N'Modern but Traditional 4D3N', N'Tokyo', N'Japan', N'East Asia', N'Experience the tradional roots and modernisation of Japan.', N'tokyotourDetails', CAST(700.00 AS Decimal(15, 2)), CAST(N'2018-08-24' AS Date), CAST(N'2018-08-28' AS Date), N'4 Days, 3 Nights', 10)
INSERT [dbo].[Tour] ([TourID], [TourName], [TourState], [Country], [Region], [Summary], [Itinerary], [Price], [StartDate], [EndDate], [Duration], [Quantity]) VALUES (N'T009', N'The Presidential Palace 7D6N', N'Washington D.C.', N'USA', N'North America', N'Home to the current President of the United States, Donald J. Trump.', N'washington-dcTourDetails', CAST(900.00 AS Decimal(15, 2)), CAST(N'2018-09-02' AS Date), CAST(N'2018-09-09' AS Date), N'7 Days, 6 Nights', 10)
INSERT [dbo].[Tour] ([TourID], [TourName], [TourState], [Country], [Region], [Summary], [Itinerary], [Price], [StartDate], [EndDate], [Duration], [Quantity]) VALUES (N'T010', N'Surfs-Up in Hollywood 5D4N', N'California', N'USA', N'North America', N'Discover glam, glitz and fashion of the most happening state in USA.', N'HollywoodtourDetails', CAST(900.00 AS Decimal(15, 2)), CAST(N'2018-11-11' AS Date), CAST(N'2018-11-16' AS Date), N'5 Days, 4 Nights', 1)
INSERT [dbo].[Tour] ([TourID], [TourName], [TourState], [Country], [Region], [Summary], [Itinerary], [Price], [StartDate], [EndDate], [Duration], [Quantity]) VALUES (N'T011', N'Fine-Artisan 6D5N', N'Montreal, Quebec', N'Canada', N'North America', N'Indulge yourself in the UNESCO-listed Old Quebec and Place Royale.', N'MontrealtourDetails', CAST(900.00 AS Decimal(15, 2)), CAST(N'2018-11-18' AS Date), CAST(N'2018-11-24' AS Date), N'6 Days, 5 Nights', 7)
INSERT [dbo].[Tour] ([TourID], [TourName], [TourState], [Country], [Region], [Summary], [Itinerary], [Price], [StartDate], [EndDate], [Duration], [Quantity]) VALUES (N'T012', N'Winter Wonderland 5D4N', N'Ottawa', N'Canada', N'North America', N'Rock the powdery white snow slopes through Winter Wonderland.', N'ottawatourDetails', CAST(900.00 AS Decimal(15, 2)), CAST(N'2018-12-01' AS Date), CAST(N'2018-12-06' AS Date), N'5 Days, 4 Nights', NULL)
INSERT [dbo].[Tour] ([TourID], [TourName], [TourState], [Country], [Region], [Summary], [Itinerary], [Price], [StartDate], [EndDate], [Duration], [Quantity]) VALUES (N'T013', N'The Kingdom Awakens 4D3N', N'Dublin', N'Ireland', N'Europe', N'Home to MMA legend Conor McGregor, discover his past.', N'DublintourDetails', CAST(800.00 AS Decimal(15, 2)), CAST(N'2018-12-11' AS Date), CAST(N'2018-12-15' AS Date), N'4 Days, 3 Nights', 30)
INSERT [dbo].[Tour] ([TourID], [TourName], [TourState], [Country], [Region], [Summary], [Itinerary], [Price], [StartDate], [EndDate], [Duration], [Quantity]) VALUES (N'T014', N'Culture of the Capital 3D2N', N'Dublin', N'Ireland', N'Europe', N'Discover Dublin''s culture in 4 different top tourists attractions.', N'Dublin2tourDetails', CAST(800.00 AS Decimal(15, 2)), CAST(N'2018-12-18' AS Date), CAST(N'2018-12-21' AS Date), N'3 Days, 2 Nights', 18)
INSERT [dbo].[Tour] ([TourID], [TourName], [TourState], [Country], [Region], [Summary], [Itinerary], [Price], [StartDate], [EndDate], [Duration], [Quantity]) VALUES (N'T015', N'The Sinking City 6D5N', N'Venice', N'Italy', N'Europe', N'Enlighten yourself about the rich heritage of a sinking land, Venice.', N'venicetourDetails', CAST(800.00 AS Decimal(15, 2)), CAST(N'2019-01-01' AS Date), CAST(N'2019-01-07' AS Date), N'6 Days, 5 Nights', 5)
INSERT [dbo].[Tour] ([TourID], [TourName], [TourState], [Country], [Region], [Summary], [Itinerary], [Price], [StartDate], [EndDate], [Duration], [Quantity]) VALUES (N'T016', N'For the Romantics 7D6N', N'Paris', N'France', N'Europe', N'Live the dream of romantics, explore it''s beautiful vintage awe.', N'paristourDetails', CAST(800.00 AS Decimal(15, 2)), CAST(N'2019-02-22' AS Date), CAST(N'2019-03-01' AS Date), N'7 Days, 6 Nights', 20)
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD FOREIGN KEY([TourID])
REFERENCES [dbo].[Tour] ([TourID])
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD FOREIGN KEY([UserName])
REFERENCES [dbo].[Users] ([UserName])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([TourID])
REFERENCES [dbo].[Tour] ([TourID])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([UserName])
REFERENCES [dbo].[Users] ([UserName])
GO
ALTER TABLE [dbo].[PaymentPremium]  WITH CHECK ADD FOREIGN KEY([UserName])
REFERENCES [dbo].[Users] ([UserName])
GO
ALTER TABLE [dbo].[Wishlist]  WITH CHECK ADD FOREIGN KEY([TourID])
REFERENCES [dbo].[Tour] ([TourID])
GO
ALTER TABLE [dbo].[Wishlist]  WITH CHECK ADD FOREIGN KEY([UserName])
REFERENCES [dbo].[Users] ([UserName])
GO
USE [master]
GO
ALTER DATABASE [APPD_CA2] SET  READ_WRITE 
GO
