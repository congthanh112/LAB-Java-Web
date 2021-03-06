USE [master]
GO
/****** Object:  Database [HotelBooking]    Script Date: 28/10/2020 11:15:09 CH ******/
CREATE DATABASE [HotelBooking]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HotelBooking', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\HotelBooking.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HotelBooking_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\HotelBooking_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [HotelBooking] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HotelBooking].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HotelBooking] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HotelBooking] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HotelBooking] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HotelBooking] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HotelBooking] SET ARITHABORT OFF 
GO
ALTER DATABASE [HotelBooking] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HotelBooking] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HotelBooking] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HotelBooking] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HotelBooking] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HotelBooking] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HotelBooking] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HotelBooking] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HotelBooking] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HotelBooking] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HotelBooking] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HotelBooking] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HotelBooking] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HotelBooking] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HotelBooking] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HotelBooking] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HotelBooking] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HotelBooking] SET RECOVERY FULL 
GO
ALTER DATABASE [HotelBooking] SET  MULTI_USER 
GO
ALTER DATABASE [HotelBooking] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HotelBooking] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HotelBooking] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HotelBooking] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HotelBooking] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'HotelBooking', N'ON'
GO
ALTER DATABASE [HotelBooking] SET QUERY_STORE = OFF
GO
USE [HotelBooking]
GO
/****** Object:  Table [dbo].[AuthUser]    Script Date: 28/10/2020 11:15:09 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuthUser](
	[email] [nvarchar](255) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
	[phone] [nvarchar](255) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[address] [nvarchar](255) NOT NULL,
	[createdAt] [datetime] NULL,
	[status] [nvarchar](10) NULL,
	[role] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 28/10/2020 11:15:09 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[bookID] [int] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](255) NULL,
	[createdAt] [date] NULL,
	[total] [float] NOT NULL,
	[userConfirmed] [bit] NULL,
	[status] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[bookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookingDetail]    Script Date: 28/10/2020 11:15:09 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingDetail](
	[detailID] [int] IDENTITY(1,1) NOT NULL,
	[bookID] [int] NULL,
	[roomID] [int] NULL,
	[checkIn] [date] NOT NULL,
	[checkOut] [date] NOT NULL,
	[amount] [int] NOT NULL,
	[price] [float] NOT NULL,
	[total] [float] NOT NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[detailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 28/10/2020 11:15:09 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel](
	[hotelID] [int] IDENTITY(1,1) NOT NULL,
	[hotelName] [nvarchar](255) NOT NULL,
	[hotelArea] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[hotelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 28/10/2020 11:15:09 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[roomID] [int] IDENTITY(1,1) NOT NULL,
	[roomType] [nvarchar](255) NOT NULL,
	[available] [bit] NOT NULL,
	[price] [float] NOT NULL,
	[quantity] [int] NOT NULL,
	[hotelID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[roomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AuthUser] ([email], [password], [phone], [name], [address], [createdAt], [status], [role]) VALUES (N'kn@x.com', N'f2ac564966850ce907c38a877cbec2dad070c0407d581d819d2439f179dda93', N'0', N'N (pw kn)', N'q2', CAST(N'2020-10-27T07:29:26.397' AS DateTime), N'active', N'user')
INSERT [dbo].[AuthUser] ([email], [password], [phone], [name], [address], [createdAt], [status], [role]) VALUES (N'kn@y.com', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', N'1111111111', N'TQKN (pw 123)', N'q9', CAST(N'2020-10-28T22:56:12.980' AS DateTime), N'active', N'user')
INSERT [dbo].[AuthUser] ([email], [password], [phone], [name], [address], [createdAt], [status], [role]) VALUES (N'nguyen@exmaple.com', N'f2ac564966850ce907c38a877cbec2dad070c0407d581d819d2439f179dda93', N'0000000000', N'fn (pw 123)', N'ad', CAST(N'2020-10-27T09:05:55.343' AS DateTime), N'active', N'user')
SET IDENTITY_INSERT [dbo].[Booking] ON 

INSERT [dbo].[Booking] ([bookID], [email], [createdAt], [total], [userConfirmed], [status]) VALUES (6, NULL, CAST(N'2020-10-28' AS Date), 30, 0, N'cancelled')
INSERT [dbo].[Booking] ([bookID], [email], [createdAt], [total], [userConfirmed], [status]) VALUES (7, N'kn@x.com', CAST(N'2020-10-28' AS Date), 30, 0, N'cancelled')
INSERT [dbo].[Booking] ([bookID], [email], [createdAt], [total], [userConfirmed], [status]) VALUES (8, N'kn@x.com', CAST(N'2020-10-28' AS Date), 140, 0, N'cancelled')
INSERT [dbo].[Booking] ([bookID], [email], [createdAt], [total], [userConfirmed], [status]) VALUES (9, N'kn@x.com', CAST(N'2020-10-28' AS Date), 100, 0, N'cancelled')
INSERT [dbo].[Booking] ([bookID], [email], [createdAt], [total], [userConfirmed], [status]) VALUES (10, N'kn@x.com', CAST(N'2020-10-28' AS Date), 100, 0, N'pending')
INSERT [dbo].[Booking] ([bookID], [email], [createdAt], [total], [userConfirmed], [status]) VALUES (11, N'kn@x.com', CAST(N'2020-10-28' AS Date), 100, 0, N'pending')
INSERT [dbo].[Booking] ([bookID], [email], [createdAt], [total], [userConfirmed], [status]) VALUES (12, N'kn@x.com', CAST(N'2020-10-28' AS Date), 640, 0, N'pending')
INSERT [dbo].[Booking] ([bookID], [email], [createdAt], [total], [userConfirmed], [status]) VALUES (13, N'kn@y.com', CAST(N'2020-10-28' AS Date), 180, 0, N'cancelled')
INSERT [dbo].[Booking] ([bookID], [email], [createdAt], [total], [userConfirmed], [status]) VALUES (14, N'kn@y.com', CAST(N'2020-10-28' AS Date), 60, 0, N'pending')
SET IDENTITY_INSERT [dbo].[Booking] OFF
SET IDENTITY_INSERT [dbo].[BookingDetail] ON 

INSERT [dbo].[BookingDetail] ([detailID], [bookID], [roomID], [checkIn], [checkOut], [amount], [price], [total], [status]) VALUES (2, 6, 1, CAST(N'2020-10-16' AS Date), CAST(N'2020-10-09' AS Date), 1, 30, 30, 0)
INSERT [dbo].[BookingDetail] ([detailID], [bookID], [roomID], [checkIn], [checkOut], [amount], [price], [total], [status]) VALUES (3, 7, 1, CAST(N'2020-10-09' AS Date), CAST(N'2020-10-09' AS Date), 1, 30, 30, 0)
INSERT [dbo].[BookingDetail] ([detailID], [bookID], [roomID], [checkIn], [checkOut], [amount], [price], [total], [status]) VALUES (4, 8, 1, CAST(N'2020-10-09' AS Date), CAST(N'2020-10-09' AS Date), 3, 30, 90, 0)
INSERT [dbo].[BookingDetail] ([detailID], [bookID], [roomID], [checkIn], [checkOut], [amount], [price], [total], [status]) VALUES (5, 8, 2, CAST(N'2020-10-15' AS Date), CAST(N'2020-10-23' AS Date), 1, 50, 50, 0)
INSERT [dbo].[BookingDetail] ([detailID], [bookID], [roomID], [checkIn], [checkOut], [amount], [price], [total], [status]) VALUES (6, 9, 2, CAST(N'2020-10-15' AS Date), CAST(N'2020-10-23' AS Date), 2, 50, 100, 0)
INSERT [dbo].[BookingDetail] ([detailID], [bookID], [roomID], [checkIn], [checkOut], [amount], [price], [total], [status]) VALUES (7, 10, 2, CAST(N'2020-10-15' AS Date), CAST(N'2020-10-23' AS Date), 2, 50, 100, 0)
INSERT [dbo].[BookingDetail] ([detailID], [bookID], [roomID], [checkIn], [checkOut], [amount], [price], [total], [status]) VALUES (8, 11, 2, CAST(N'2020-10-15' AS Date), CAST(N'2020-10-23' AS Date), 2, 50, 100, 0)
INSERT [dbo].[BookingDetail] ([detailID], [bookID], [roomID], [checkIn], [checkOut], [amount], [price], [total], [status]) VALUES (9, 12, 2, CAST(N'2020-10-15' AS Date), CAST(N'2020-10-23' AS Date), 4, 50, 200, 0)
INSERT [dbo].[BookingDetail] ([detailID], [bookID], [roomID], [checkIn], [checkOut], [amount], [price], [total], [status]) VALUES (10, 12, 3, CAST(N'2020-10-08' AS Date), CAST(N'2020-10-31' AS Date), 4, 50, 200, 0)
INSERT [dbo].[BookingDetail] ([detailID], [bookID], [roomID], [checkIn], [checkOut], [amount], [price], [total], [status]) VALUES (11, 12, 4, CAST(N'2020-10-08' AS Date), CAST(N'2020-10-31' AS Date), 4, 60, 240, 0)
INSERT [dbo].[BookingDetail] ([detailID], [bookID], [roomID], [checkIn], [checkOut], [amount], [price], [total], [status]) VALUES (12, 13, 1, CAST(N'2020-10-07' AS Date), CAST(N'2020-10-16' AS Date), 6, 30, 180, 0)
INSERT [dbo].[BookingDetail] ([detailID], [bookID], [roomID], [checkIn], [checkOut], [amount], [price], [total], [status]) VALUES (13, 14, 1, CAST(N'2020-10-15' AS Date), CAST(N'2020-10-30' AS Date), 2, 30, 60, 0)
SET IDENTITY_INSERT [dbo].[BookingDetail] OFF
SET IDENTITY_INSERT [dbo].[Hotel] ON 

INSERT [dbo].[Hotel] ([hotelID], [hotelName], [hotelArea]) VALUES (1, N'khanh du', N'q2')
INSERT [dbo].[Hotel] ([hotelID], [hotelName], [hotelArea]) VALUES (2, N'khanh du 2', N'q6')
SET IDENTITY_INSERT [dbo].[Hotel] OFF
SET IDENTITY_INSERT [dbo].[Room] ON 

INSERT [dbo].[Room] ([roomID], [roomType], [available], [price], [quantity], [hotelID]) VALUES (1, N'queen', 1, 30, 10, 1)
INSERT [dbo].[Room] ([roomID], [roomType], [available], [price], [quantity], [hotelID]) VALUES (2, N'king', 1, 50, 5, 1)
INSERT [dbo].[Room] ([roomID], [roomType], [available], [price], [quantity], [hotelID]) VALUES (3, N'family', 1, 50, 5, 2)
INSERT [dbo].[Room] ([roomID], [roomType], [available], [price], [quantity], [hotelID]) VALUES (4, N'double', 1, 60, 15, 2)
SET IDENTITY_INSERT [dbo].[Room] OFF
ALTER TABLE [dbo].[AuthUser] ADD  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[AuthUser] ADD  DEFAULT ('active') FOR [status]
GO
ALTER TABLE [dbo].[AuthUser] ADD  DEFAULT ('user') FOR [role]
GO
ALTER TABLE [dbo].[Booking] ADD  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[Booking] ADD  DEFAULT ((0)) FOR [userConfirmed]
GO
ALTER TABLE [dbo].[Booking] ADD  DEFAULT ('pending') FOR [status]
GO
ALTER TABLE [dbo].[BookingDetail] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[Room] ADD  DEFAULT ((1)) FOR [available]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD FOREIGN KEY([email])
REFERENCES [dbo].[AuthUser] ([email])
GO
ALTER TABLE [dbo].[BookingDetail]  WITH CHECK ADD FOREIGN KEY([bookID])
REFERENCES [dbo].[Booking] ([bookID])
GO
ALTER TABLE [dbo].[BookingDetail]  WITH CHECK ADD FOREIGN KEY([roomID])
REFERENCES [dbo].[Room] ([roomID])
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD FOREIGN KEY([hotelID])
REFERENCES [dbo].[Hotel] ([hotelID])
GO
USE [master]
GO
ALTER DATABASE [HotelBooking] SET  READ_WRITE 
GO
