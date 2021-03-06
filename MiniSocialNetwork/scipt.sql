USE [master]
GO
/****** Object:  Database [MiniSocialNetwork]    Script Date: 9/29/2020 10:19:43 PM ******/
CREATE DATABASE [MiniSocialNetwork]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MiniSocialNetwork', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEPRESS\MSSQL\DATA\MiniSocialNetwork.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MiniSocialNetwork_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEPRESS\MSSQL\DATA\MiniSocialNetwork_log.ldf' , SIZE = 1088KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MiniSocialNetwork] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MiniSocialNetwork].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MiniSocialNetwork] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MiniSocialNetwork] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MiniSocialNetwork] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MiniSocialNetwork] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MiniSocialNetwork] SET ARITHABORT OFF 
GO
ALTER DATABASE [MiniSocialNetwork] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MiniSocialNetwork] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [MiniSocialNetwork] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MiniSocialNetwork] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MiniSocialNetwork] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MiniSocialNetwork] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MiniSocialNetwork] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MiniSocialNetwork] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MiniSocialNetwork] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MiniSocialNetwork] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MiniSocialNetwork] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MiniSocialNetwork] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MiniSocialNetwork] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MiniSocialNetwork] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MiniSocialNetwork] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MiniSocialNetwork] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MiniSocialNetwork] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MiniSocialNetwork] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MiniSocialNetwork] SET RECOVERY FULL 
GO
ALTER DATABASE [MiniSocialNetwork] SET  MULTI_USER 
GO
ALTER DATABASE [MiniSocialNetwork] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MiniSocialNetwork] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MiniSocialNetwork] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MiniSocialNetwork] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
USE [MiniSocialNetwork]
GO
/****** Object:  Table [dbo].[Article]    Script Date: 9/29/2020 10:19:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Article](
	[articleId] [int] IDENTITY(1,1) NOT NULL,
	[userId] [nvarchar](50) NOT NULL,
	[title] [nvarchar](50) NOT NULL,
	[description] [nvarchar](4000) NOT NULL,
	[imagePath] [nvarchar](200) NULL,
	[date] [datetime] NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_Article] PRIMARY KEY CLUSTERED 
(
	[articleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Comment]    Script Date: 9/29/2020 10:19:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[commentId] [int] IDENTITY(1,1) NOT NULL,
	[userId] [nvarchar](50) NOT NULL,
	[articleId] [int] NOT NULL,
	[commentContent] [nvarchar](200) NOT NULL,
	[date] [datetime] NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[commentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Emotion]    Script Date: 9/29/2020 10:19:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Emotion](
	[userId] [nvarchar](50) NOT NULL,
	[emotionType] [int] NOT NULL,
	[articleId] [int] NOT NULL,
 CONSTRAINT [PK_Emotion] PRIMARY KEY CLUSTERED 
(
	[userId] ASC,
	[articleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Notification]    Script Date: 9/29/2020 10:19:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[notificationId] [int] IDENTITY(1,1) NOT NULL,
	[activityType] [int] NOT NULL,
	[userId] [nvarchar](50) NOT NULL,
	[isSeen] [bit] NOT NULL,
	[date] [datetime] NOT NULL,
	[articleId] [int] NOT NULL,
 CONSTRAINT [PK_Notification] PRIMARY KEY CLUSTERED 
(
	[notificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 9/29/2020 10:19:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[roleId] [int] NOT NULL,
	[roleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[roleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 9/29/2020 10:19:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[userId] [nvarchar](50) NOT NULL,
	[fullName] [nvarchar](50) NULL,
	[password] [nvarchar](100) NULL,
	[status] [nvarchar](50) NULL,
	[roleId] [int] NULL,
	[verifyCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Article] ON 

INSERT [dbo].[Article] ([articleId], [userId], [title], [description], [imagePath], [date], [status]) VALUES (104, N'hoaldse140830@fpt.edu.vn', N'My picture', N'Learn spoken English and Grammar from Hindi, Indonesian, Thai, Arabic, Malay, Urdu, Malay, Bangladeshi Bengali, Bengali, Punjabi, Telugu, Tamil, Kannada, Marathi, Gujarati, Oriya, Assamese, Malayalam, Chinese, Portuguese, Turkish and Nepali. A free English learning course used by over 50 Million learners for spoken English, grammar, and vocabulary building.', N'DSCF8391_edited (21601390191483.jpg', CAST(0x0000AC45016419E6 AS DateTime), 1)
INSERT [dbo].[Article] ([articleId], [userId], [title], [description], [imagePath], [date], [status]) VALUES (105, N'hoaldse140830@fpt.edu.vn', N'This is my story', N'Corey Blake is the founder and CEO of Round Table Companies, the publisher of Conscious Capitalism Press, and a speaker, artist, and storyteller. He has been featured on the cover of the Wall Street Journal, and his work in storytelling has appeared in the New York Times, USA Today, Inc., Forbes, and Wired magazines. Corey has spent more than 15 years guiding CEOs, founders, and thought leaders to build storytelling ecosystems around their brands. He is also the creator of the Vulnerability Wall and the âVulnerability is Sexyâ card game. His documentary of the same name won 2017 ADDY and HERMES awards for branded content, and his recently released animated short film âWe Heard You,â has generated more than 2 million views. Corey delivers keynotes and facilitates storytelling workshops and vulnerability sessions for conferences, leadership groups, and organizations of all sizes.', N'', CAST(0x0000AC450164A78C AS DateTime), 1)
INSERT [dbo].[Article] ([articleId], [userId], [title], [description], [imagePath], [date], [status]) VALUES (106, N'nguyenmauhieu@gmail.com', N'Hiiii', N'Goodmoring everyoneeee!!!!!!!!', N'', CAST(0x0000AC4501656CEF AS DateTime), 1)
INSERT [dbo].[Article] ([articleId], [userId], [title], [description], [imagePath], [date], [status]) VALUES (107, N'phamthanhphuong@gmail.com', N'My Friend', N'She is so cuteeeee', N'IMG_4699_edited (21601391580317.jpg', CAST(0x0000AC45016A7573 AS DateTime), 1)
INSERT [dbo].[Article] ([articleId], [userId], [title], [description], [imagePath], [date], [status]) VALUES (108, N'vuthugiang@gmail.com', N'hihi', N'good?????', N'IMG_4721_edited (21601391971780.jpg', CAST(0x0000AC45016C402F AS DateTime), 1)
INSERT [dbo].[Article] ([articleId], [userId], [title], [description], [imagePath], [date], [status]) VALUES (109, N'vuthugiang@gmail.com', N'Hello', N'Ib meeee!!! so boringgg :((((', N'', CAST(0x0000AC45016D1213 AS DateTime), 1)
INSERT [dbo].[Article] ([articleId], [userId], [title], [description], [imagePath], [date], [status]) VALUES (110, N'hoaldse140830@fpt.edu.vn', N'this post', N'Will be delete by admin :(', N'', CAST(0x0000AC45016DC8DE AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Article] OFF
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([commentId], [userId], [articleId], [commentContent], [date], [status]) VALUES (56, N'buingochuy@gmail.com', 104, N'xinh quá điiii', CAST(0x0000AC4501661209 AS DateTime), 1)
INSERT [dbo].[Comment] ([commentId], [userId], [articleId], [commentContent], [date], [status]) VALUES (57, N'tranleduy@gmail.com', 106, N'hello cậu', CAST(0x0000AC450169F31F AS DateTime), 1)
INSERT [dbo].[Comment] ([commentId], [userId], [articleId], [commentContent], [date], [status]) VALUES (58, N'nguyenkenam@gmail.com', 106, N'chàooooo', CAST(0x0000AC45016B4489 AS DateTime), 0)
INSERT [dbo].[Comment] ([commentId], [userId], [articleId], [commentContent], [date], [status]) VALUES (59, N'nguyenkenam@gmail.com', 106, N'chào ', CAST(0x0000AC45016B5486 AS DateTime), 1)
INSERT [dbo].[Comment] ([commentId], [userId], [articleId], [commentContent], [date], [status]) VALUES (60, N'vuthugiang@gmail.com', 108, N'Mọi người ơi vô cmt đi nè :v', CAST(0x0000AC45016C66E4 AS DateTime), 1)
INSERT [dbo].[Comment] ([commentId], [userId], [articleId], [commentContent], [date], [status]) VALUES (61, N'vuthugiang@gmail.com', 107, N'gooddddd', CAST(0x0000AC45016C8BF3 AS DateTime), 1)
INSERT [dbo].[Comment] ([commentId], [userId], [articleId], [commentContent], [date], [status]) VALUES (62, N'vuthugiang@gmail.com', 106, N'hé luuuuuu', CAST(0x0000AC45016CA504 AS DateTime), 1)
INSERT [dbo].[Comment] ([commentId], [userId], [articleId], [commentContent], [date], [status]) VALUES (63, N'vuthugiang@gmail.com', 105, N'wow wow', CAST(0x0000AC45016CB5D8 AS DateTime), 1)
INSERT [dbo].[Comment] ([commentId], [userId], [articleId], [commentContent], [date], [status]) VALUES (64, N'vuthugiang@gmail.com', 105, N'hehe\nhihi', CAST(0x0000AC45016CD667 AS DateTime), 0)
INSERT [dbo].[Comment] ([commentId], [userId], [articleId], [commentContent], [date], [status]) VALUES (65, N'vuthugiang@gmail.com', 104, N'wowwwww', CAST(0x0000AC45016CF0FB AS DateTime), 1)
INSERT [dbo].[Comment] ([commentId], [userId], [articleId], [commentContent], [date], [status]) VALUES (66, N'hoaldse140830@fpt.edu.vn', 109, N'check ibbbbb', CAST(0x0000AC45016D3CDD AS DateTime), 1)
INSERT [dbo].[Comment] ([commentId], [userId], [articleId], [commentContent], [date], [status]) VALUES (67, N'hoaldse140830@fpt.edu.vn', 108, N'love uuuuu <3', CAST(0x0000AC45016D4E08 AS DateTime), 1)
INSERT [dbo].[Comment] ([commentId], [userId], [articleId], [commentContent], [date], [status]) VALUES (68, N'nguyenmauhieu@gmail.com', 110, N'reallyyy??', CAST(0x0000AC45016DF68A AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Comment] OFF
INSERT [dbo].[Emotion] ([userId], [emotionType], [articleId]) VALUES (N'buingochuy@gmail.com', 1, 104)
INSERT [dbo].[Emotion] ([userId], [emotionType], [articleId]) VALUES (N'buingochuy@gmail.com', 1, 105)
INSERT [dbo].[Emotion] ([userId], [emotionType], [articleId]) VALUES (N'buingochuy@gmail.com', 2, 106)
INSERT [dbo].[Emotion] ([userId], [emotionType], [articleId]) VALUES (N'hoaldse140830@fpt.edu.vn', 1, 105)
INSERT [dbo].[Emotion] ([userId], [emotionType], [articleId]) VALUES (N'hoaldse140830@fpt.edu.vn', 1, 108)
INSERT [dbo].[Emotion] ([userId], [emotionType], [articleId]) VALUES (N'hoaldse140830@fpt.edu.vn', 1, 109)
INSERT [dbo].[Emotion] ([userId], [emotionType], [articleId]) VALUES (N'hoaldse140830@fpt.edu.vn', 1, 110)
INSERT [dbo].[Emotion] ([userId], [emotionType], [articleId]) VALUES (N'nguyenkenam@gmail.com', 1, 106)
INSERT [dbo].[Emotion] ([userId], [emotionType], [articleId]) VALUES (N'nguyenmauhieu@gmail.com', 1, 104)
INSERT [dbo].[Emotion] ([userId], [emotionType], [articleId]) VALUES (N'nguyenmauhieu@gmail.com', 1, 110)
INSERT [dbo].[Emotion] ([userId], [emotionType], [articleId]) VALUES (N'phamthanhphuong@gmail.com', 1, 104)
INSERT [dbo].[Emotion] ([userId], [emotionType], [articleId]) VALUES (N'phamthanhphuong@gmail.com', 1, 107)
INSERT [dbo].[Emotion] ([userId], [emotionType], [articleId]) VALUES (N'tranleduy@gmail.com', 1, 106)
INSERT [dbo].[Emotion] ([userId], [emotionType], [articleId]) VALUES (N'vuthugiang@gmail.com', 1, 104)
INSERT [dbo].[Emotion] ([userId], [emotionType], [articleId]) VALUES (N'vuthugiang@gmail.com', 1, 105)
INSERT [dbo].[Emotion] ([userId], [emotionType], [articleId]) VALUES (N'vuthugiang@gmail.com', 1, 106)
INSERT [dbo].[Emotion] ([userId], [emotionType], [articleId]) VALUES (N'vuthugiang@gmail.com', 1, 107)
INSERT [dbo].[Emotion] ([userId], [emotionType], [articleId]) VALUES (N'vuthugiang@gmail.com', 1, 108)
INSERT [dbo].[Emotion] ([userId], [emotionType], [articleId]) VALUES (N'vuthugiang@gmail.com', 1, 109)
SET IDENTITY_INSERT [dbo].[Notification] ON 

INSERT [dbo].[Notification] ([notificationId], [activityType], [userId], [isSeen], [date], [articleId]) VALUES (37, 1, N'nguyenmauhieu@gmail.com', 0, CAST(0x0000AC4501657D6C AS DateTime), 104)
INSERT [dbo].[Notification] ([notificationId], [activityType], [userId], [isSeen], [date], [articleId]) VALUES (38, 1, N'buingochuy@gmail.com', 0, CAST(0x0000AC4501660442 AS DateTime), 104)
INSERT [dbo].[Notification] ([notificationId], [activityType], [userId], [isSeen], [date], [articleId]) VALUES (39, 2, N'buingochuy@gmail.com', 0, CAST(0x0000AC4501661209 AS DateTime), 104)
INSERT [dbo].[Notification] ([notificationId], [activityType], [userId], [isSeen], [date], [articleId]) VALUES (40, 1, N'buingochuy@gmail.com', 0, CAST(0x0000AC450167EE12 AS DateTime), 105)
INSERT [dbo].[Notification] ([notificationId], [activityType], [userId], [isSeen], [date], [articleId]) VALUES (41, 0, N'buingochuy@gmail.com', 0, CAST(0x0000AC450167F6F6 AS DateTime), 106)
INSERT [dbo].[Notification] ([notificationId], [activityType], [userId], [isSeen], [date], [articleId]) VALUES (42, 1, N'tranleduy@gmail.com', 0, CAST(0x0000AC450169E976 AS DateTime), 106)
INSERT [dbo].[Notification] ([notificationId], [activityType], [userId], [isSeen], [date], [articleId]) VALUES (43, 2, N'tranleduy@gmail.com', 0, CAST(0x0000AC450169F31F AS DateTime), 106)
INSERT [dbo].[Notification] ([notificationId], [activityType], [userId], [isSeen], [date], [articleId]) VALUES (44, 1, N'phamthanhphuong@gmail.com', 0, CAST(0x0000AC45016AB3F9 AS DateTime), 104)
INSERT [dbo].[Notification] ([notificationId], [activityType], [userId], [isSeen], [date], [articleId]) VALUES (45, 1, N'nguyenkenam@gmail.com', 0, CAST(0x0000AC45016B3DDF AS DateTime), 106)
INSERT [dbo].[Notification] ([notificationId], [activityType], [userId], [isSeen], [date], [articleId]) VALUES (46, 2, N'nguyenkenam@gmail.com', 0, CAST(0x0000AC45016B4489 AS DateTime), 106)
INSERT [dbo].[Notification] ([notificationId], [activityType], [userId], [isSeen], [date], [articleId]) VALUES (47, 2, N'nguyenkenam@gmail.com', 0, CAST(0x0000AC45016B5486 AS DateTime), 106)
INSERT [dbo].[Notification] ([notificationId], [activityType], [userId], [isSeen], [date], [articleId]) VALUES (48, 1, N'vuthugiang@gmail.com', 0, CAST(0x0000AC45016C8059 AS DateTime), 107)
INSERT [dbo].[Notification] ([notificationId], [activityType], [userId], [isSeen], [date], [articleId]) VALUES (49, 2, N'vuthugiang@gmail.com', 0, CAST(0x0000AC45016C8BF3 AS DateTime), 107)
INSERT [dbo].[Notification] ([notificationId], [activityType], [userId], [isSeen], [date], [articleId]) VALUES (50, 1, N'vuthugiang@gmail.com', 0, CAST(0x0000AC45016C98DD AS DateTime), 106)
INSERT [dbo].[Notification] ([notificationId], [activityType], [userId], [isSeen], [date], [articleId]) VALUES (51, 2, N'vuthugiang@gmail.com', 0, CAST(0x0000AC45016CA504 AS DateTime), 106)
INSERT [dbo].[Notification] ([notificationId], [activityType], [userId], [isSeen], [date], [articleId]) VALUES (52, 1, N'vuthugiang@gmail.com', 0, CAST(0x0000AC45016CAFED AS DateTime), 105)
INSERT [dbo].[Notification] ([notificationId], [activityType], [userId], [isSeen], [date], [articleId]) VALUES (53, 2, N'vuthugiang@gmail.com', 0, CAST(0x0000AC45016CB5D8 AS DateTime), 105)
INSERT [dbo].[Notification] ([notificationId], [activityType], [userId], [isSeen], [date], [articleId]) VALUES (54, 2, N'vuthugiang@gmail.com', 0, CAST(0x0000AC45016CD667 AS DateTime), 105)
INSERT [dbo].[Notification] ([notificationId], [activityType], [userId], [isSeen], [date], [articleId]) VALUES (55, 1, N'vuthugiang@gmail.com', 0, CAST(0x0000AC45016CE8B4 AS DateTime), 104)
INSERT [dbo].[Notification] ([notificationId], [activityType], [userId], [isSeen], [date], [articleId]) VALUES (56, 2, N'vuthugiang@gmail.com', 0, CAST(0x0000AC45016CF0FB AS DateTime), 104)
INSERT [dbo].[Notification] ([notificationId], [activityType], [userId], [isSeen], [date], [articleId]) VALUES (57, 1, N'hoaldse140830@fpt.edu.vn', 0, CAST(0x0000AC45016D341F AS DateTime), 109)
INSERT [dbo].[Notification] ([notificationId], [activityType], [userId], [isSeen], [date], [articleId]) VALUES (58, 2, N'hoaldse140830@fpt.edu.vn', 0, CAST(0x0000AC45016D3CDD AS DateTime), 109)
INSERT [dbo].[Notification] ([notificationId], [activityType], [userId], [isSeen], [date], [articleId]) VALUES (59, 1, N'hoaldse140830@fpt.edu.vn', 0, CAST(0x0000AC45016D43E3 AS DateTime), 108)
INSERT [dbo].[Notification] ([notificationId], [activityType], [userId], [isSeen], [date], [articleId]) VALUES (60, 2, N'hoaldse140830@fpt.edu.vn', 0, CAST(0x0000AC45016D4E08 AS DateTime), 108)
INSERT [dbo].[Notification] ([notificationId], [activityType], [userId], [isSeen], [date], [articleId]) VALUES (61, 2, N'nguyenmauhieu@gmail.com', 0, CAST(0x0000AC45016DF68A AS DateTime), 110)
INSERT [dbo].[Notification] ([notificationId], [activityType], [userId], [isSeen], [date], [articleId]) VALUES (62, 1, N'nguyenmauhieu@gmail.com', 0, CAST(0x0000AC45016DF83B AS DateTime), 110)
SET IDENTITY_INSERT [dbo].[Notification] OFF
INSERT [dbo].[Role] ([roleId], [roleName]) VALUES (1, N'member')
INSERT [dbo].[Role] ([roleId], [roleName]) VALUES (2, N'admin')
INSERT [dbo].[Users] ([userId], [fullName], [password], [status], [roleId], [verifyCode]) VALUES (N'admin@gmail.com', N'admin', N'ŒivåµA½é½Mîß±g©ÈsüK¸¨o*´H©', N'Active', 2, N'2GMECO')
INSERT [dbo].[Users] ([userId], [fullName], [password], [status], [roleId], [verifyCode]) VALUES (N'buingochuy@gmail.com', N'Ngọc Huy', N'adfffffffffffffffffff', N'Active', 1, N'7HP7TU')
INSERT [dbo].[Users] ([userId], [fullName], [password], [status], [roleId], [verifyCode]) VALUES (N'hoaldse140830@fpt.edu.vn', N'Lưu Diệu Hoa', N'aaaaaaaaaaaaaaaaaaaa', N'Active', 1, N'YZIZG0')
INSERT [dbo].[Users] ([userId], [fullName], [password], [status], [roleId], [verifyCode]) VALUES (N'nguyenkenam@gmail.com', N'Kế Nam', N'ÿYôÛÓöƒŸ×zÄïflmrºõÝ¾­ÈÚO‚ýF=s§', N'Active', 1, N'XIPJ80')
INSERT [dbo].[Users] ([userId], [fullName], [password], [status], [roleId], [verifyCode]) VALUES (N'nguyenmauhieu@gmail.com', N'Mậu Hiếu', N'#„ÍdÚßx®�Lñ±Ú?Eµ=ÿ&äQD]n•$…6ê', N'Active', 1, N'YEJTTF')
INSERT [dbo].[Users] ([userId], [fullName], [password], [status], [roleId], [verifyCode]) VALUES (N'phamthanhphuong@gmail.com', N'Thanh Phương', N'Ò=RxZ¨T4vóD«<šíÿø¶Þ~iUZ÷\fD³Ï', N'Active', 1, N'0BMVAP')
INSERT [dbo].[Users] ([userId], [fullName], [password], [status], [roleId], [verifyCode]) VALUES (N'tranleduy@gmail.com', N'Lê Duy', N'á¢>ð
�6F§$ð‚�¾ËÕ‘}ºƒì¿Ð‘y™2È{^', N'Active', 1, N'36PS36')
INSERT [dbo].[Users] ([userId], [fullName], [password], [status], [roleId], [verifyCode]) VALUES (N'vuthugiang@gmail.com', N'Thu Giang', N'û-IŸ¾‡ÿøú­2à�o†wNª^.P7þu¿�MÁ', N'Active', 1, N'FFX5FD')
ALTER TABLE [dbo].[Article] ADD  CONSTRAINT [DF_Article_status]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[Comment] ADD  CONSTRAINT [DF_Comment_status]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_User_status]  DEFAULT (N'new') FOR [status]
GO
ALTER TABLE [dbo].[Article]  WITH CHECK ADD  CONSTRAINT [FK_Article_User1] FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([userId])
GO
ALTER TABLE [dbo].[Article] CHECK CONSTRAINT [FK_Article_User1]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Article] FOREIGN KEY([articleId])
REFERENCES [dbo].[Article] ([articleId])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Article]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_User] FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([userId])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_User]
GO
ALTER TABLE [dbo].[Emotion]  WITH CHECK ADD  CONSTRAINT [FK_Emotion_Article1] FOREIGN KEY([articleId])
REFERENCES [dbo].[Article] ([articleId])
GO
ALTER TABLE [dbo].[Emotion] CHECK CONSTRAINT [FK_Emotion_Article1]
GO
ALTER TABLE [dbo].[Emotion]  WITH CHECK ADD  CONSTRAINT [FK_Emotion_User] FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([userId])
GO
ALTER TABLE [dbo].[Emotion] CHECK CONSTRAINT [FK_Emotion_User]
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD  CONSTRAINT [FK_Notification_Article] FOREIGN KEY([articleId])
REFERENCES [dbo].[Article] ([articleId])
GO
ALTER TABLE [dbo].[Notification] CHECK CONSTRAINT [FK_Notification_Article]
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD  CONSTRAINT [FK_Notification_User] FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([userId])
GO
ALTER TABLE [dbo].[Notification] CHECK CONSTRAINT [FK_Notification_User]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([roleId])
REFERENCES [dbo].[Role] ([roleId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [MiniSocialNetwork] SET  READ_WRITE 
GO
