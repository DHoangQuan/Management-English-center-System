USE [master]
GO
/****** Object:  Database [TUProject]    Script Date: 11/22/2019 9:26:26 PM ******/
CREATE DATABASE [TUProject]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TUProject', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\TUProject.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TUProject_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\TUProject_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TUProject] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TUProject].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TUProject] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TUProject] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TUProject] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TUProject] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TUProject] SET ARITHABORT OFF 
GO
ALTER DATABASE [TUProject] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TUProject] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TUProject] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TUProject] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TUProject] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TUProject] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TUProject] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TUProject] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TUProject] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TUProject] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TUProject] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TUProject] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TUProject] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TUProject] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TUProject] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TUProject] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TUProject] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TUProject] SET RECOVERY FULL 
GO
ALTER DATABASE [TUProject] SET  MULTI_USER 
GO
ALTER DATABASE [TUProject] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TUProject] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TUProject] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TUProject] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TUProject', N'ON'
GO
USE [TUProject]
GO
/****** Object:  Table [dbo].[Authentication]    Script Date: 11/22/2019 9:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authentication](
	[PeopleID] [varchar](50) NOT NULL,
	[EditAuthetication] [nvarchar](max) NULL,
	[Comment] [nvarchar](max) NULL,
	[CreatePost] [nvarchar](max) NULL,
	[EditPost] [nvarchar](max) NULL,
	[Class] [nvarchar](max) NULL,
	[Room] [nvarchar](max) NULL,
	[Topics] [nvarchar](max) NULL,
	[Skills] [nvarchar](max) NULL,
	[Lessons] [nvarchar](max) NULL,
	[Attendant] [nvarchar](max) NULL,
	[EditStudentTime] [nvarchar](max) NULL,
	[Allowbanned] [nvarchar](max) NULL,
	[Notes] [nvarchar](max) NULL,
 CONSTRAINT [PK_Authentication] PRIMARY KEY CLUSTERED 
(
	[PeopleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Catalogue]    Script Date: 11/22/2019 9:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catalogue](
	[Catalogue] [varchar](50) NOT NULL,
	[CatalogueName] [nvarchar](max) NULL,
	[Status] [varchar](50) NULL,
 CONSTRAINT [PK_Catalogue] PRIMARY KEY CLUSTERED 
(
	[Catalogue] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Class]    Script Date: 11/22/2019 9:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[ClassID] [varchar](50) NOT NULL,
	[LessonID] [varchar](50) NULL,
	[PeopleID] [varchar](50) NULL,
	[QuantityMAX] [int] NULL,
	[QuantityMIN] [int] NULL,
	[ClassName] [nvarchar](max) NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 11/22/2019 9:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[comment_id] [bigint] IDENTITY(1,1) NOT NULL,
	[content_id] [bigint] NOT NULL,
	[comment_content] [nvarchar](max) NULL,
	[comment_date] [datetime] NULL,
	[PeopleID] [varchar](50) NULL,
	[Name] [nvarchar](max) NULL,
	[Image] [nvarchar](max) NULL,
 CONSTRAINT [PK_Comments_1] PRIMARY KEY CLUSTERED 
(
	[comment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Content]    Script Date: 11/22/2019 9:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Content](
	[content_id] [bigint] IDENTITY(1,1) NOT NULL,
	[content_title] [nvarchar](max) NULL,
	[content_post] [nvarchar](max) NULL,
	[status] [nvarchar](max) NULL,
	[date_post] [datetime] NULL,
	[PeopleID] [varchar](50) NULL,
	[TopicPostID] [varchar](50) NULL,
	[RepresentImage] [nvarchar](max) NULL,
 CONSTRAINT [PK_Content] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistoryStudentTime]    Script Date: 11/22/2019 9:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistoryStudentTime](
	[HistoryStudentTime] [int] IDENTITY(1,1) NOT NULL,
	[AddForPerson] [varchar](50) NULL,
	[DateAdd] [datetime] NULL,
	[NumberSlot] [int] NULL,
	[PersonAdd] [varchar](50) NULL,
	[Note] [nvarchar](max) NULL,
 CONSTRAINT [PK_HistoryStudentTime] PRIMARY KEY CLUSTERED 
(
	[HistoryStudentTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LecturerTime]    Script Date: 11/22/2019 9:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LecturerTime](
	[ID] [varchar](50) NOT NULL,
	[LecturerID] [varchar](50) NOT NULL,
	[Year] [varchar](50) NULL,
	[Month] [varchar](50) NULL,
	[TeachingTime] [bigint] NULL,
 CONSTRAINT [PK_LecturerTime] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lessons]    Script Date: 11/22/2019 9:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lessons](
	[LessonID] [varchar](50) NOT NULL,
	[LessonName] [nvarchar](max) NULL,
	[TopicID] [varchar](50) NULL,
	[Resource] [nvarchar](max) NULL,
	[RepeatTimes] [int] NULL,
 CONSTRAINT [PK_Lessons] PRIMARY KEY CLUSTERED 
(
	[LessonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[People]    Script Date: 11/22/2019 9:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[People](
	[PeopleID] [varchar](50) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Phone] [bigint] NULL,
	[DoB] [date] NULL,
	[Gender] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Active] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Image] [nvarchar](max) NULL,
	[RoleID] [varchar](50) NULL,
 CONSTRAINT [PK_People] PRIMARY KEY CLUSTERED 
(
	[PeopleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuantityAndAttendance]    Script Date: 11/22/2019 9:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuantityAndAttendance](
	[QnAID] [varchar](50) NOT NULL,
	[UsingRoomID] [int] NULL,
	[PeopleID] [varchar](50) NULL,
	[Attendent] [nvarchar](max) NULL,
 CONSTRAINT [PK_ClassAndStudent] PRIMARY KEY CLUSTERED 
(
	[QnAID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quote]    Script Date: 11/22/2019 9:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quote](
	[QuoteID] [varchar](50) NOT NULL,
	[Titlle] [nvarchar](max) NULL,
	[Author] [nvarchar](max) NULL,
	[ContentQuote] [nvarchar](max) NULL,
	[Status] [nvarchar](max) NULL,
 CONSTRAINT [PK_Quote] PRIMARY KEY CLUSTERED 
(
	[QuoteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 11/22/2019 9:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [varchar](50) NOT NULL,
	[Role] [nvarchar](max) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 11/22/2019 9:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[RommID] [varchar](50) NOT NULL,
	[Floor] [nvarchar](max) NULL,
	[RoomNo] [nvarchar](max) NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[RommID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Skill]    Script Date: 11/22/2019 9:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skill](
	[SkilID] [varchar](50) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Skill] PRIMARY KEY CLUSTERED 
(
	[SkilID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slot]    Script Date: 11/22/2019 9:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slot](
	[SlotID] [varchar](50) NOT NULL,
	[SlotName] [nvarchar](max) NULL,
	[TimeStart] [nvarchar](max) NULL,
	[TimeEnd] [nvarchar](max) NULL,
 CONSTRAINT [PK_Slot] PRIMARY KEY CLUSTERED 
(
	[SlotID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentTime]    Script Date: 11/22/2019 9:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentTime](
	[ID] [varchar](50) NOT NULL,
	[StudentID] [varchar](50) NULL,
	[Studied] [bigint] NULL,
	[Future] [bigint] NULL,
 CONSTRAINT [PK_StudentTime_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Topic]    Script Date: 11/22/2019 9:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topic](
	[TopicID] [varchar](50) NOT NULL,
	[TopicName] [nvarchar](50) NULL,
	[SkillID] [varchar](50) NULL,
 CONSTRAINT [PK_Topic] PRIMARY KEY CLUSTERED 
(
	[TopicID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TopicPost]    Script Date: 11/22/2019 9:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TopicPost](
	[TopicPostID] [varchar](50) NOT NULL,
	[CatalogueID] [varchar](50) NULL,
	[TopicName] [nvarchar](max) NULL,
	[PinToBar] [bit] NULL,
	[Status] [varchar](50) NULL,
 CONSTRAINT [PK_TopicPost] PRIMARY KEY CLUSTERED 
(
	[TopicPostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsingRoom]    Script Date: 11/22/2019 9:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsingRoom](
	[UsingRoomID] [int] IDENTITY(1,1) NOT NULL,
	[RoomID] [varchar](50) NULL,
	[SlotID] [varchar](50) NULL,
	[Date] [datetime] NULL,
	[DayOfWeek] [nvarchar](max) NULL,
	[ClassID] [varchar](50) NULL,
	[QuatityRegister] [int] NULL,
	[UseFor] [nvarchar](max) NULL,
	[Status] [nvarchar](max) NULL,
	[Notes] [nvarchar](max) NULL,
 CONSTRAINT [PK_UsingRoom] PRIMARY KEY CLUSTERED 
(
	[UsingRoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Authentication] ([PeopleID], [EditAuthetication], [Comment], [CreatePost], [EditPost], [Class], [Room], [Topics], [Skills], [Lessons], [Attendant], [EditStudentTime], [Allowbanned], [Notes]) VALUES (N'P01', N'NotAllow', N'Allow', N'NotAllow', N'NotAllow', N'NotAllow', N'NotAllow', N'NotAllow', N'NotAllow', N'NotAllow', N'Allow', N'NotAllow', N'NotAllow', NULL)
INSERT [dbo].[Authentication] ([PeopleID], [EditAuthetication], [Comment], [CreatePost], [EditPost], [Class], [Room], [Topics], [Skills], [Lessons], [Attendant], [EditStudentTime], [Allowbanned], [Notes]) VALUES (N'P02', N'NotAllow', N'Allow', N'NotAllow', N'NotAllow', N'NotAllow', N'NotAllow', N'NotAllow', N'NotAllow', N'NotAllow', N'NotAllow', N'NotAllow', N'NotAllow', NULL)
INSERT [dbo].[Authentication] ([PeopleID], [EditAuthetication], [Comment], [CreatePost], [EditPost], [Class], [Room], [Topics], [Skills], [Lessons], [Attendant], [EditStudentTime], [Allowbanned], [Notes]) VALUES (N'P03', N'NotAllow', N'Allow', N'NotAllow', N'NotAllow', N'NotAllow', N'NotAllow', N'NotAllow', N'NotAllow', N'NotAllow', N'NotAllow', N'NotAllow', NULL, NULL)
INSERT [dbo].[Authentication] ([PeopleID], [EditAuthetication], [Comment], [CreatePost], [EditPost], [Class], [Room], [Topics], [Skills], [Lessons], [Attendant], [EditStudentTime], [Allowbanned], [Notes]) VALUES (N'P04', N'NotAllow', N'Allow', N'Allow', N'NotAllow', N'NotAllow', N'NotAllow', N'NotAllow', N'NotAllow', N'NotAllow', N'Allow', N'NotAllow', NULL, NULL)
INSERT [dbo].[Authentication] ([PeopleID], [EditAuthetication], [Comment], [CreatePost], [EditPost], [Class], [Room], [Topics], [Skills], [Lessons], [Attendant], [EditStudentTime], [Allowbanned], [Notes]) VALUES (N'P05', N'NotAllow', N'Allow', N'NotAllow', N'NotAllow', N'NotAllow', N'NotAllow', N'NotAllow', N'NotAllow', N'NotAllow', N'Allow', N'NotAllow', NULL, NULL)
INSERT [dbo].[Authentication] ([PeopleID], [EditAuthetication], [Comment], [CreatePost], [EditPost], [Class], [Room], [Topics], [Skills], [Lessons], [Attendant], [EditStudentTime], [Allowbanned], [Notes]) VALUES (N'P06', N'NotAllow', N'Allow', N'NotAllow', N'NotAllow', N'NotAllow', N'NotAllow', N'NotAllow', N'NotAllow', N'NotAllow', N'Allow', N'NotAllow', NULL, NULL)
INSERT [dbo].[Authentication] ([PeopleID], [EditAuthetication], [Comment], [CreatePost], [EditPost], [Class], [Room], [Topics], [Skills], [Lessons], [Attendant], [EditStudentTime], [Allowbanned], [Notes]) VALUES (N'P07', N'Allow', N'Allow', N'Allow', N'Allow', N'Allow', N'Allow', N'Allow', N'Allow', N'Allow', N'Allow', N'Allow', N'Allow', NULL)
INSERT [dbo].[Authentication] ([PeopleID], [EditAuthetication], [Comment], [CreatePost], [EditPost], [Class], [Room], [Topics], [Skills], [Lessons], [Attendant], [EditStudentTime], [Allowbanned], [Notes]) VALUES (N'P08', N'Allow', N'Allow', N'Allow', N'Allow', N'Allow', N'Allow', N'Allow', N'Allow', N'Allow', N'NotAllow', N'Allow', N'Allow', NULL)
INSERT [dbo].[Authentication] ([PeopleID], [EditAuthetication], [Comment], [CreatePost], [EditPost], [Class], [Room], [Topics], [Skills], [Lessons], [Attendant], [EditStudentTime], [Allowbanned], [Notes]) VALUES (N'P09', N'Allow', N'Allow', N'Allow', N'Allow', N'NotAllow', N'Allow', N'Allow', N'Allow', N'Allow', N'NotAllow', N'Allow', N'Allow', NULL)
INSERT [dbo].[Authentication] ([PeopleID], [EditAuthetication], [Comment], [CreatePost], [EditPost], [Class], [Room], [Topics], [Skills], [Lessons], [Attendant], [EditStudentTime], [Allowbanned], [Notes]) VALUES (N'P91', N'Allow', N'Allow', N'Allow', N'Allow', N'Allow', N'Allow', N'Allow', N'Allow', N'Allow', N'Allow', N'Allow', N'Allow', NULL)
INSERT [dbo].[Catalogue] ([Catalogue], [CatalogueName], [Status]) VALUES (N'Cata01', N'Introduce About US', NULL)
INSERT [dbo].[Catalogue] ([Catalogue], [CatalogueName], [Status]) VALUES (N'Cata02', N'Research', NULL)
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'01', N'LESSON111111', N'P01', NULL, 0, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'aadkivzkkatseno', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'aasltfxcbrlubms', N'LESSON', N'P01', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'abbdpgtunguogme', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'abfcfkgzglgsvux', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'abjjlygdyygpqgd', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'abqxpxtazacrrqc', N'LESSON04', N'P06', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'accukjatcnrnhsw', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'accurgkgwadxyxm', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'acxosvuzxacxixa', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'adfcxkylddreyii', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'adixktunburzcui', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'adouurocrbzakcn', N'LESSON111111', N'P04', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'aebcyixfaadlcwg', N'LESSONS02', N'P05', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'aeqnyrwqvtnsitp', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'aerlbikngqqeuwy', N'LESSON04', N'P05', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'aexfqfzqzwnbnij', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'afbkhydhmrioamf', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'affbyapwkpwcoww', N'LESSON04', N'P05', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'afgwortljqxbbnz', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'afjoewnmuzlmkmz', N'Losson1', N'P06', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'afoqfkrvpamloyt', N'LESSON04', N'P06', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'afrppaegoukpzum', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'agfgjlkcdzbvley', N'LESSON04', N'P04', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'aguvpzywecdeyxo', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ahbtmnrhlbqbkla', N'LESSON04', N'P06', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ahsivlwcifcpzxb', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'aixkgdfmgkviorf', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ajcbbftpjpmjxxg', N'LESSON04', N'P06', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ajeoefsgaqhuyvq', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ajeumhdytragvqk', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ajjcyunuswzhgpb', N'LESSONS02', N'P05', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ajstgkwhvzewphg', N'LESSONS02', N'P05', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ajxpqhamocmwwoc', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'akcgedsiqbgqtfk', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'akkpzbzgwjvzaoo', N'LESSON', N'P04', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'akqvsjxmdsmvjpo', N'Losson1', N'P04', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'akrcblkhpzdvfxi', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'akxrwowlwynyusd', N'LESSON04', N'P05', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'allzfernfbfhyqk', N'Losson1', N'P05', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ambxrkbvcvxfqje', N'LESSON04', N'P06', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'amnohfewlgrprks', N'Losson1', N'P06', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'anhmzawswyqxpwm', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'anhuohlpiwjaext', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'aooniwvhtswohyg', N'LESSON111111', N'P06', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'aophynzxssxnuoj', N'LESSON', N'P04', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'aovihmgfgrcakwq', N'LESSON04', N'P01', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'apaawevnnsqfson', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'aqahercskmeinib', N'LESSONS02', N'P05', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'aqqngqqdrxapdih', N'LESSONS02', N'P01', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'aqsqrwihczeogsh', N'Losson1', N'P06', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'aqyhilymifqdcrx', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ardmbjuivoanbom', N'LESSON04', N'P01', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'arpcfrqxnogvsak', N'LESSON', N'P04', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'arxmggpfppgwrnq', N'Losson1', N'P01', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'arzphxzqsviynrw', N'LESSON111111', N'P06', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'asdsuzstqbzaoeq', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'asekkitwtyitrwm', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'asimnaddiwnmnds', N'Losson1', N'P06', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'aslxqzufvqnkogy', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'atafqgcsdceijiq', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'atdgggowwytlyqp', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'atmdbnhzkaibxuj', N'LESSONS02', N'P05', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'atqtyubosefanpr', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'auluqmceguhxnhf', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'auoscgtlxsxvltu', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'avfhmlhmyaqiafz', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'axazwunrmydevyh', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'axlrvliiiywwtxl', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'axttabajchrclfi', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ayimgabzwurqlpx', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'aymkrtrgnshoicm', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'azlftacbnvtybnw', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'azzmwobcpvongnm', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'baihwppiixuumgn', N'Losson1', N'P05', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'bbiudglfhabfuua', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'bbzgivzrfrmsezh', N'LESSON', N'P06', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'bcsryxfbjornymt', N'Losson1', N'P05', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'bdnzzydozundrsp', N'LESSONS02', N'P04', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'bdplrkyyvstfxrt', N'LESSON', N'P04', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'bdtvnozuqskydkh', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'beltckiaxwmvocu', N'LESSONS02', N'P06', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'beqcpadsixtmgoy', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'bfeuoospvzdegzj', N'LESSON', N'P04', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'bfiyophsgqkuvjr', N'LESSON', N'P01', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'bfvqzvxilcepqgz', N'LESSON', N'P04', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'bgiwblywuoaheot', N'LESSONS02', N'P04', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'bgppksderxvcafg', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'bhapxrnszvhxmgs', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'bhvhledwaqiwagb', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'bhvsbucyttvcyrd', N'Losson1', N'P04', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'bikmjpocnlmedfl', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'bilbtqshaomhzjw', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'bizndeweuwwxcwt', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'bizunvvaranezex', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'bjmvwquuyhviddj', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'bkqydiofrhmwmid', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'blanckvbjdlqtzr', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'blixoaraemesaij', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'bltzbrbrqpspyot', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
GO
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'blyhnelnpvrqjok', N'LESSON', N'P04', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'blyzyxwqdwynvnc', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'blzsdhqwvrswgxo', N'LESSONS02', N'P05', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'bmdiukbdiqksyhq', N'LESSON04', N'P06', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'bmgszyvvswxeayd', N'LESSONS02', N'P06', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'bmjamvhdlukjhno', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'bmxftsuzkwgqzel', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'bnetyhzlqavxpqt', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'bnrpehtqdbzbmhv', N'LESSONS02', N'P01', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'bohnlqvooqvstct', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'bpgnsgjqfrvqsds', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'bppukpwxenzhqbv', N'LESSON111111', N'P01', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'bpzikvdnlkxpiui', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'bqgsbjfzbuucfvf', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'bqhaebebepodfpd', N'LESSON04', N'P05', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'bqogghswcxrefge', N'LESSON04', N'P01', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'bqstdszszphvdpi', N'LESSON111111', N'P05', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'bqtadeduwaiaeyp', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'braasmncpacnipr', N'LESSON', N'P05', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'braeshzoaruspgu', N'Losson1', N'P06', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'bsakowhbqdlijkt', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'bsbahxfjkqlwldx', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'bsnemlsxbzyjkyp', N'LESSONS02', N'P05', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'bsvononrumzqvvb', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'btgjlfndlaztthu', N'LESSON04', N'P05', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'btixnyupykpprwb', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'btoxgkccrrycnko', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'buccxnnpxozyoat', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'bueefcshmmmopdb', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'buqltgxnporoaxz', N'LESSONS02', N'P05', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'buvgjxxwrqzbgqf', N'LESSONS02', N'P06', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'buxxhncqevaipoj', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'bvawikwxwyrirzr', N'Losson1', N'P04', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'bvceuiigpwdmzoc', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'bvcyioxtkolflng', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'bvklycskkpxxrwd', N'LESSON111111', N'P04', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'bvrgjxccppsnnoc', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'bvxhxlxljusrlao', N'LESSON111111', N'P05', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'bwbjdhojdyozwef', N'LESSON111111', N'P06', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'bwipgmtalqxdloq', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'bwnxszdwkvwexng', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'bxbstcwqssowkch', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'bxgdaxxtjuvqgew', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'bxgisjxmplhdnaz', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'bxvsrnrzatvbxgz', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'bxzjpbstvbytyme', N'Losson1', N'P06', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'bydfbtfhjpjonxp', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'bypcxvvdywsjexi', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'byuxhsziryajkef', N'Losson1', N'P06', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'byzrasksjtoujdh', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'bzndjtvigobhyfr', N'LESSON111111', N'P06', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'cahrgyecrmswwxo', N'LESSON04', N'P01', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'cbsjepasmllouws', N'LESSON111111', N'P01', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'cbuwwlapllsvbco', N'LESSONS02', N'P01', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ccewcaukrnkfhsv', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ccltmynygtsgqaa', N'Losson1', N'P04', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ccshnoyhlvuuket', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ccxjqginztyngmy', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'cegamcoeyxenkpe', N'LESSON', N'P05', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'cewvsbbnovvjedy', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ceyewwtaypxtfxt', N'LESSONS02', N'P04', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'cfcngxtjpupdbug', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'cfmiktiobpcnbce', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'cfwfknuxddvcuzk', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'cgfmttjaxalyrcs', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'cgxijwmxsxqzwft', N'LESSON04', N'P04', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'chbsbsrswuxgfmo', N'Losson1', N'P06', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'chqadbwcbvenhnk', N'LESSONS02', N'P05', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'chzzqysuixcnpup', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ciaiuzxrfptpbks', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'cijnahfwmsvcfeh', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ciunipzjevfcbmq', N'LESSON', N'P04', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'cizatmslziepcuu', N'LESSON04', N'P05', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ckiyxmqjutyndoy', N'Losson1', N'P01', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'cksrcmxerffmorh', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ckuqveiyoeufdwc', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ckzfwlrefuzwzcx', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ckzhyywonlzsadj', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ckznlshbsssznef', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'CLASS01', N'LESSON', N'P01', NULL, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'CLASS02', N'LESSON', N'P01', NULL, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'CLASS04', N'Losson1', N'P06', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'cloviuicogucxys', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'cmelrhvpmqjdvtz', N'LESSONS02', N'P05', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'cmetgplmypcgjvg', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'cmifzdmydlwybnc', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'cmlhknyjzszijff', N'Losson1', N'P06', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'cmqqtcjrgvecfat', N'LESSON04', N'P04', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'cmyaknvmvpdiysk', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'cncywttuquinwtm', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'cnnqavepmqrxiza', N'Losson1', N'P06', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'cnrzidrmglaptrq', N'Losson1', N'P06', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'coiwlnkfsrtgolt', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'copaaocpsxonvem', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'copbshzzipxyoye', N'LESSON', N'P01', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'coqsqxdtvuxfxwi', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'coylscnooytmnjt', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'cpkbsgeffnqkvwb', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'cqekpltqivhyxgu', N'LESSON111111', N'P06', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'crkaoowthwbsmxf', N'LESSON04', N'P04', 20, 3, N'Donal Trump Listening')
GO
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'crsfbzundkyttvi', N'LESSON111111', N'P06', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'csafyootmrlrdnd', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'csictuhwatahcsw', N'LESSONS02', N'P05', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'csvtnfrkcvukkwj', N'LESSONS02', N'P05', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'csvxmbdwnmmqrom', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'csylpswbdwryqmi', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'cterpznjjjtolui', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ctfkdqnvpkmwttw', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ctwtbqjryldtnlq', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'culywuqrsxbxcow', N'LESSON', N'P05', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'cvdpavjygwphata', N'Losson1', N'P04', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'cvvmaphbnjkswtn', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'cvxqzuxrqsdhmun', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'cwbpnpnhyzycccz', N'LESSON', N'P04', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'cwdibfxizlpbnvi', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'cwfltazldusmbgt', N'LESSON04', N'P06', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'cwlkgpzgyxizqvw', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'cwxxobmocrwkavu', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'cxqkfagdbowalgj', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'cxwdeguwuwbroua', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'cxwvupvaxtlkqmw', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'cyakrgtavobbwnt', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'cybwvpqcdmwhmlt', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'cyejzeamcwzrgye', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'cyhemnvpbnzlkje', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'cyngutnbuebjbyf', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'czfdtdkrsozkjkd', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'czkntdlxkvucqwi', N'LESSON', N'P06', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'czupbdvhojmxymn', N'LESSON', N'P01', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dadaqiurvsmroof', N'LESSON04', N'P05', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dbfqsjhbcxyzhhn', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dcoizoqijhocihs', N'LESSON111111', N'P05', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dcqufvyrgldeiiu', N'LESSONS02', N'P05', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dcsvcwuopgcmkdt', N'LESSONS02', N'P06', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ddfbenowbgrqkbh', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'deqcupknwrplvoe', N'Losson1', N'P04', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dfmncacbhpoifcu', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dfobgnbmnwbldpj', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dgbgqboabffygkp', N'LESSON111111', N'P04', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dgecuxzmqqwgsoe', N'LESSON', N'P04', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dgpiugagewpchkg', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dgsgdlcsqibcgeo', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dgxgarxrdphadcy', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dgxopynopnadrdf', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dhgkkfgscppuqiz', N'Losson1', N'P06', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dhvtfdvxgsglfbl', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'difbzebwzjoqhuv', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dimgxvbyunmocar', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'diquyvwmujhifuz', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'djbnwmrdpiaadte', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'djgunkwpnjefbrp', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'djjuozpflqeaqhy', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'djwvssdmqcvnhmx', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'djzlwjqhbsgdjfo', N'LESSON', N'P01', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dkayrfitjseuojd', N'LESSON04', N'P04', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dkeybsrywfjintd', N'LESSON04', N'P05', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dkmcxnfmfkfdsyf', N'Losson1', N'P05', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dkueirwgzgeghgs', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dlahmsaayjdyded', N'LESSON04', N'P04', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dlchleyzwnvpozv', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dlcoxlsfebavutt', N'LESSON04', N'P05', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dlfrovrdooklyju', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dlfzedgabndpnlb', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dllakjvqtiwqbdh', N'LESSON111111', N'P05', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dlnnibtxcqzrnva', N'LESSON', N'P04', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dlrafmatzhqiled', N'LESSON', N'P05', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dltttqayqrqlxuv', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dlyygomvrfprdtg', N'LESSONS02', N'P05', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dmaqpesjyqehjih', N'LESSON', N'P01', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dmtaiyqvdpjolvc', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dmttfgzuikvgaac', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dmzlucaqzkdfxvp', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dnbosdedmmxbbns', N'LESSON', N'P04', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dnxdmwppwraoqmp', N'LESSON', N'P04', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dnzfmapyfiktbbv', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'domgquztilqtzmw', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'domtcxvutgsnvzi', N'LESSON111111', N'P05', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dpbizhpqxgikwpp', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dpezxjdyuihjknr', N'LESSON', N'P06', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dpqqaqznminqbzp', N'LESSON', N'P04', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dqblwcjhopmzhdy', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dqjmctbiiyigyku', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dqjsawulkigjzmz', N'LESSONS02', N'P05', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dqnmyypzhqtvjgu', N'LESSON04', N'P05', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dqqlidzthraeucm', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dqulynpcfhzcxld', N'LESSON', N'P06', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'drcetltgujyrwiy', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'drkiqjckcqbqgir', N'LESSON', N'P06', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'drpyopwzkuzowcz', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'drxnuacmxkolrwv', N'LESSON', N'P04', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dsayvwxrrlxjssd', N'LESSON', N'P04', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dtdidmmabtszyfh', N'LESSONS02', N'P05', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dtdvnolenotfezo', N'LESSONS02', N'P05', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dtjpkvavlktdyqj', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dtrnwjnzlgvrpti', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dttejmajrrjvstb', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dtuymmajqfhhqog', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dudvkeiwawzlgsu', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dugrqouagstvewo', N'Losson1', N'P04', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dujwhvnqwgwectv', N'LESSON111111', N'P01', 20, 3, N'testdownload')
GO
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dunklnxkfhkugvn', N'LESSON111111', N'P06', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'duzwxisfsqdpqki', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dvkwkgcsaoplclu', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dvvrahktvtfmlvw', N'LESSON', N'P04', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dvzdmphcfpwselp', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dwdcsewpznowmbk', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dwtvxrulcsxlajv', N'Losson1', N'P04', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dwvwybakjuhhlov', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dwwjjxrhcetcqkw', N'LESSONS02', N'P01', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dwyivongtrhfcbs', N'LESSON', N'P01', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dwyrlkwmilhcpav', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dxjjjbrddkaunzz', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dykujcvcfjiwqqz', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dyostezavlcsfgp', N'LESSONS02', N'P06', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dypqbldqftsgmmx', N'LESSON', N'P04', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dyrzfgvdpnurogt', N'LESSON04', N'P06', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dzcxggaxoisjmrw', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dzeeucnsucxkhce', N'LESSON04', N'P04', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'dzgpajppffnoetb', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'eabuirulpnypjjb', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ealwnzsiwqgugvl', N'LESSON04', N'P01', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'eauaxwplbuatbsj', N'LESSONS02', N'P05', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ebbcxzkiblrtylj', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ebipbxwfconvyvh', N'LESSON04', N'P04', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ebpopmwaxrdinkk', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ebqjziorgmyaale', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ebwulmzlcgrsmls', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ecbvuitggfclmpj', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ecpgfwxdbnnapcg', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'eddlolmfakxyvhz', N'LESSON04', N'P04', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'eddyejnanpxtpms', N'LESSON', N'P01', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'edtukjbkdoopjbl', N'LESSON', N'P04', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'eembmkxkseonxcx', N'LESSON04', N'P06', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'eeotzoxpknpqjsp', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'eetxqpxjlkprhfm', N'LESSON04', N'P06', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'efgirlvasoxovdz', N'LESSON111111', N'P06', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'efsqxtkikcxabba', N'LESSON04', N'P04', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'efuhbeluipjfcch', N'LESSON04', N'P06', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'efxtkbsbndhgvbc', N'LESSON111111', N'P06', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'efzunmidrlbmvta', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'egnzvjwzrnxtmkx', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'egtlyoulppberqg', N'LESSON', N'P06', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'eheexfpckouwpqk', N'LESSON', N'P04', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ehffxpvbsqftavk', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ehsavjrbwhirjku', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ejgeygmmzckrqjy', N'LESSONS02', N'P04', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ejpghhtqxuzeiis', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ejplflmtyexhijx', N'LESSON04', N'P06', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ekcnjgvoagdhhuy', N'Losson1', N'P01', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ekiktojgjqvrtyt', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ekuyqewntprtakq', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ekvrmzmcwnwrqrv', N'LESSON04', N'P04', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'elitxzycbtxmeky', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'elsfplygmrwuaex', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'eltlvqtswsqeckc', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'elugfmlkfnkwplx', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'elwbyjgznydibdt', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'enlakoywyhqetws', N'LESSONS02', N'P01', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'enmzsvcmhqhtaba', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ennriedqlmqlcuw', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'enyroqvoebgsecn', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'eofrfkpxodvjais', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'eohakodbvgiqbuo', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'eorwxeubpfozfpk', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'eosrgruijobmysh', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'epbjhssnyoaedei', N'LESSON', N'P01', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'epdjejpyeoufwsl', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'epdrtqevrnniktt', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'epomjqmwmrcjtdv', N'LESSON111111', N'P05', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'epyjhduzshohyuc', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'eqdyjtgwftmmvxp', N'LESSONS02', N'P05', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'eqigsrtiulltknm', N'LESSON04', N'P01', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'eravpkojxshpkrv', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'erkrijahyprmykr', N'Losson1', N'P06', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'erlskaifzfxxojo', N'LESSON', N'P01', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'errweidtdffwxlz', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'erweqvnpckexilq', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'esfblcgtpltnhpj', N'LESSONS02', N'P05', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'esqjwfsdzolgvbz', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'esvkhavytpkewjw', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'etqkzsxnhflcwbk', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'etvgtkfvzdtpojk', N'LESSON111111', N'P01', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'etvmngswbllgunw', N'LESSONS02', N'P04', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'etybxgriookxamz', N'LESSON111111', N'P06', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'eunrlzambtlageu', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'eupakmbqmidvsft', N'LESSONS02', N'P05', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'euprgfesdazeswy', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'eutujowhlcizyod', N'LESSON', N'P04', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'euwvasvtmqjowwe', N'LESSONS02', N'P06', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'evyphlmvecukuar', N'LESSON04', N'P05', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ewnjxigarhogqew', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ewsrjvqwqmohcdn', N'LESSON', N'P04', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ewwihjrqluqaekr', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'exbirlzjspsxlvr', N'LESSON', N'P04', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'exrwzzyehrtppbs', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'extkgdavvgzzrin', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'exycvzbqmghyoda', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ezfgowpfxqmasea', N'LESSONS02', N'P06', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'eznvjbeedglimhv', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ezqlmpqvihurjvu', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
GO
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'facpkqhxsqqfmfa', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'fbptrqutpotqdab', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'fcdolhxizcwecto', N'Losson1', N'P05', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'fcjjbzxsbefrimu', N'Losson1', N'P06', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'fcpfyastnjgygkk', N'LESSONS02', N'P05', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'fdeibycxycxdpkr', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'fdhdelcdygeiewz', N'LESSON111111', N'P05', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'fdinpzqpvmyxztu', N'LESSON', N'P06', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'fdlnzpcztgvbkpm', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'fdogjyszubpwass', N'LESSON', N'P05', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'fdpzxctemlqzmik', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'fdvdoesxohqalvh', N'LESSON111111', N'P05', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ffgojcsexhafzdp', N'LESSON111111', N'P01', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'fflayvajdptrimw', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ffwmbpwuynoinep', N'LESSON04', N'P01', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'fghlvdrquofbelf', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'fgibblhbcbmjczq', N'LESSON04', N'P01', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'fhcfwqshqzxilkq', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'fhfucfepyofqikz', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'fhsahaavicetipy', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'fhtkotvxaiijmru', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'fhwyigsqyqvtvrc', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'fibeeykaqkhrspr', N'LESSON111111', N'P01', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'fidtfrwmdcxlgoc', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'figmsofscloilcv', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'fillpbwlanzkgbg', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'fjeahytviohhtmr', N'Losson1', N'P04', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'fjnlkyfeqcqbdpg', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'fjnzxqdngworglb', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'fjsarrjpyptyzly', N'LESSONS02', N'P06', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'fjtexlguqzlixql', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'fjulmzuupoxcdus', N'LESSONS02', N'P05', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'fjwmdagyillfsbs', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'fknowglkfxiwjco', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'flizcqvnjbowhbu', N'LESSONS02', N'P05', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'fllrosfwtddtfuy', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'fmmvjrhmayqetec', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'fmofqjxakniberv', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'fmtzjkilciwndrw', N'Losson1', N'P06', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'fnuygtugtdcrcjo', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'focpfhobambmgud', N'LESSON111111', N'P04', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'fohmxqachbkkxha', N'LESSON111111', N'P04', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'fompsyykcagwgwc', N'Losson1', N'P06', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'fpfnhuhqjfhtsop', N'LESSONS02', N'P05', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'fpgysivbfkcimlk', N'LESSON111111', N'P04', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'fpiutvdtdhasans', N'LESSON04', N'P04', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'fpnkalyqwjtkaaz', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'fppxfzxbdrgnxmp', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'fpxklytbazmzmjm', N'LESSON', N'P04', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'fqhzgvvqxpuyrvs', N'LESSON04', N'P04', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'fqtccwyhfcgeabu', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'fqykojidehffmbl', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'frcomlxkexjwbni', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'frduycqcxlzqgxv', N'LESSON04', N'P01', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'fscjvxnsecfcyqj', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ftieftnrnjwvlmz', N'LESSON', N'P06', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ftnpvmvwtqqguvg', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ftpxinvaeqlikup', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ftqfhawfogdevvo', N'LESSON111111', N'P06', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'fugvadmnmzpkhri', N'LESSON', N'P01', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'fujwtkbxkmcutsw', N'LESSONS02', N'P05', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'fukkbziaqvrctdr', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'fvkzaprwpwmhwue', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'fwdtbpeofldgfxb', N'LESSON', N'P06', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'fwficiqztdtatxm', N'LESSONS02', N'P05', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'fwtcwnttjpuxtrn', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'fxxxlneatlmojir', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'fybwadsjbhkkgft', N'Losson1', N'P06', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'fyfvvuznjcmlfkw', N'Losson1', N'P05', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'fyhmlkktannivuv', N'LESSONS02', N'P01', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'fzaziptnlkfxuls', N'Losson1', N'P05', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'fzkvzmstemoeblc', N'LESSON04', N'P01', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'gafotfwcshgbdtv', N'LESSON', N'P04', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'gairqdprgwwaucv', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ganirpoowergfjs', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'gararspzixwbtqb', N'LESSON', N'P01', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'gayaphjerekzdiw', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'gaytazuhffrvphp', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'gbmfxdxaqggguzt', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'gbzplpfspmcnqsy', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'gcaxwrnxdipzukf', N'LESSON111111', N'P04', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'gcczwvotrzkwpyu', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'gcntxdynwewknfh', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'gcrhxdscwzrerzq', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'gctyabhygekqbjr', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'gcxoqetfudcmtss', N'LESSON', N'P05', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'gdcnxsahknbhndn', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'gdcwyeglmbwgger', N'LESSON04', N'P06', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'geqbnjczfatbrkp', N'Losson1', N'P06', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'gewxuqlotkdvyww', N'LESSON04', N'P04', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'gexahbcbtrsvsfx', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'gfbulaxpazmtpjt', N'LESSON111111', N'P06', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'gfcdhlrpbbvpqev', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'gfhugebsfzglzkq', N'LESSONS02', N'P04', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'gfkhyzcpeznsgpl', N'LESSON', N'P01', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'gfqkdfygklyjdvf', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'gfufsyxoshagizl', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ggcjcmfosiiawfm', N'LESSON', N'P01', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ggispcaheiprosq', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ggpfvtcpgbuilbc', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
GO
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ggpznrrxmzbxohi', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ggssxkuuwlyrkzy', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ghjrwihsxxtydgc', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ghmgzyuwhnavykr', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ghofveyciuozkbw', N'Losson1', N'P06', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ghqbkihkqalmhzf', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'givkoqqerkzjocc', N'LESSON111111', N'P06', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'gjgfkuatnirhiiz', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'gjkeaeqbmzpfkrp', N'LESSONS02', N'P01', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'gjmibwamperigvw', N'LESSON04', N'P04', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'gjzgdkchppzjmqg', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'gkaqjnuoxhjqltd', N'LESSON', N'P05', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'gkbxtzqumxcosrq', N'Losson1', N'P06', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'gkdvwyfcuuhkdly', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'gkqknyspmlikhhq', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'gkxqkxvaraxugjy', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'glqddhtsqisckzm', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'gmcmuzaqwdtxayz', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'gmhodllunsicumv', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'gndemeyjmyaxtaz', N'LESSONS02', N'P06', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'gnixpsowcyzyizh', N'LESSON', N'P06', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'gnkdamdagcavbxx', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'gnpqyztezhusdqu', N'Losson1', N'P06', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'gnylcullmredbpt', N'LESSON', N'P06', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'gohrrowtapcuhyc', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'gopxnhjblgnwsrc', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'goxffgqxktduxzy', N'LESSON', N'P06', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'goxizasjohtkibv', N'LESSON', N'P05', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'gpihuomfjildzjk', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'gqtwtvxpfeezzhw', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'gquhxzqaejhglom', N'LESSON04', N'P05', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'grhkkstmzyvmyfn', N'LESSONS02', N'P04', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'grobtxlghcyuljy', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'gselvvbzbcsvtmb', N'Losson1', N'P05', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'gsfwgjpkyimjnjw', N'LESSON111111', N'P04', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'gsivqzbvwckoyfp', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'gsqdbtzggkcbxro', N'LESSONS02', N'P05', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'gtejirrdqbjjbre', N'LESSON', N'P06', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'gtgxuxpzpmfastf', N'LESSON', N'P01', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'gtkqdhairldgmbh', N'Losson1', N'P06', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'gtletmbvuaezyjc', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'gumblwffdzuvuwq', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'gutbnwuvclbwucd', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'guwcexhzuhpyjjd', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'gwlqpqhotpsyypt', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'gwpqbcqtffgniba', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'gwymvjjwtgvehft', N'LESSON04', N'P05', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'gwzdjbzowjnwmym', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'gxiugmugdjnwurj', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'gxsurzpsgzglhaw', N'LESSON111111', N'P06', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'gybkbrihgiuleez', N'LESSON111111', N'P06', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'gymbwanihkpmfbx', N'LESSONS02', N'P04', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'gyrmhmtlsjmnzcj', N'LESSON', N'P04', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'gzhlusdupdfmrvd', N'LESSON04', N'P01', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'haauidbgrkdwuit', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'haivfhrfmjzamsy', N'LESSON', N'P05', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'hatqtciwreipopa', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'hauyywrbrflacwx', N'LESSONS02', N'P05', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'hbfwuvkqqpxojcx', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'hbhidficbuvwkom', N'Losson1', N'P06', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'hbyumptdwyvrsnw', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'hcoruumguycocqj', N'LESSON', N'P04', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'hdiyhrwxnaknxwh', N'Losson1', N'P06', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'hdxrnanrxdbxqfb', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'herqokpwhfvtaeo', N'LESSON111111', N'P05', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'hetltwwrofhotbc', N'LESSON', N'P01', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'hevtfuhzheusarn', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'hfeknkqmkhyhjjs', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'hfkxnqvvhgqzsil', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'hgduveljpwehehi', N'Losson1', N'P04', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'hgsxanrnojozapp', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'hhnlseycjgqomhq', N'LESSONS02', N'P05', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'hhxtmfebcxztozb', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'hibszbqztxxvqhg', N'LESSON', N'P01', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'hiskswqstwkfyhh', N'LESSON111111', N'P01', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'hitlvhgvxeelyzf', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'hjabcoiiseyevlk', N'LESSON04', N'P01', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'hkihraqsssbulkg', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'hkmysnpoibvawqc', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'hksyucufaapvjnk', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'hktztwaodbbngop', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'hljubzgipqjkycq', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'hlsjerzjfvpriqq', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'hlzfalhtrjgrsrr', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'hmllrhdzlxgjhfi', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'hncqxsotevopggf', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'hnjokfygstzcmup', N'Losson1', N'P06', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'hnxerbtggzggkad', N'Losson1', N'P06', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'hnzoxonxqeuslrq', N'LESSON04', N'P05', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'hocxkpvxvduorjx', N'LESSONS02', N'P01', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'hovbrjtdibfidxr', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'hownvnlpghhppeh', N'Losson1', N'P04', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'hoxpvxroojslajg', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'hprncvwofphdfvj', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'hqmdlosgivkfeqj', N'LESSON04', N'P05', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'hqqgqlgujazdpzt', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'hqtdidnmscxdoid', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'hropooryzwfqfps', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'hsvapnqeehddfkm', N'LESSON', N'P04', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'hszfppfhpxksutu', N'LESSON04', N'P06', 20, 3, N'Donal Trump Listening')
GO
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'htgvlsataevazqj', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'htujzxfynvcfpao', N'LESSONS02', N'P04', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'htzcckwldvbgdzw', N'LESSON111111', N'P01', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'hubouwrvzuhijyb', N'LESSON111111', N'P05', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'hujpdyyzxlwvbxv', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'hulsiwnmatdkryv', N'Losson1', N'P06', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'humomdbljxivzre', N'LESSONS02', N'P05', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'hurvyqlhichwlrv', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'huyjdpyejfeylbu', N'LESSON111111', N'P06', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'hvastxekvewmkvo', N'LESSON', N'P04', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'hvnkbsggtwzyvoi', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'hvpcowwdgmmrtgz', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'hvqbovtpzhndypa', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'hvznghuukfmlujz', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'hwgjjjlxhjkvawm', N'LESSONS02', N'P05', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'hwvydpkabeywqhi', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'hxcunbzkyvfrkik', N'LESSON04', N'P06', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'hxeldskqpggobri', N'LESSON', N'P06', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'hygkgfdfyznvmlv', N'LESSONS02', N'P01', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'hypgzwufmdymuyf', N'Losson1', N'P06', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'hypooejcycrpizn', N'LESSON', N'P04', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'hysfmskwukuhkgr', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'hywbtcwazforjjl', N'LESSONS02', N'P05', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'hyydyoyfseoujkr', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'hzagnvettckhhyr', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'hzuovkzsrykrxrt', N'LESSON111111', N'P05', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'hzvybiuwuwlgvza', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'hzxyaxtkadxdzjg', N'LESSON04', N'P05', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'iagcsjfesmxxmss', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ibeyvlpnbgasovs', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ibgitgxoqwxxnjh', N'Losson1', N'P01', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ibomyndqfucvtqx', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ibtngixlktnouuo', N'LESSON', N'P04', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ibtukanmezcwfqo', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'idkeoqvuvgnfrae', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ielpdqbnoxauokr', N'LESSONS02', N'P04', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ieudybnbqgpiefk', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ieyaemyfvciscje', N'LESSON04', N'P01', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ieysdhwmqsfauhh', N'Losson1', N'P04', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ifprqstqmerxpxl', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ifzdheuuxcqflqk', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ifziuueliabgbdz', N'LESSON', N'P01', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'igjfrfusxftbehe', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'igrzavyuylhivxs', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'iicloyzklrjkbqv', N'LESSON', N'P01', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'iinenpubhqcczpz', N'LESSONS02', N'P06', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'iiowatugyadflfq', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'iivhjljppwywftb', N'LESSONS02', N'P04', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ijpiexnrxffmxmg', N'LESSON111111', N'P05', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ijufwhzteuokozd', N'Losson1', N'P06', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ijwsuzwambslarw', N'LESSON04', N'P01', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ikcjxxyzkbsqryv', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ikhqgzesjwwzkrm', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ikxbkhdgyalzylr', N'LESSON111111', N'P01', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ilwwdlpzwrahnqv', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ilyknmtejuakjuh', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'inedieqmxbvwvys', N'LESSON04', N'P01', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'iofiwncozwgshzd', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'iogewrqbpfnnaia', N'LESSONS02', N'P04', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'iohprzaggerqesu', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'iokjssxnmcmqfyn', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'iouexnptamwadxm', N'Losson1', N'P04', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ioxpefdowyzuvot', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ipdaoirnwddbaqd', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ipjoonwwtcutjpw', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ippcylmavsnqbfz', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ipsiqqvwbekicry', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ipuotzounrkalyn', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ipvjgriauaylryy', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'iqegaybehcncqds', N'LESSONS02', N'P04', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'iqleiizwcnammxg', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'irhdokpwtyqbeoz', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'irnctbzcwdvhdob', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'irxtxdkxszeroup', N'LESSON111111', N'P06', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'isfcxamocbpbrjm', N'LESSON04', N'P01', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'isppbhwjkuixjqn', N'LESSON111111', N'P04', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'isrbttrtgsoyppr', N'LESSON', N'P05', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'istuhxryybpbafj', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ithppjblhvbfufn', N'LESSON111111', N'P06', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'itlvamtnzjxdfnq', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'itsiliiwyhhjaln', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ittbwegvkaiepgq', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'iufovvvkmqmwdgs', N'LESSON04', N'P05', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'iuhgeburkcemgyn', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'iuouiqydpgttwjv', N'LESSON', N'P04', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ivacmpkfsssttxl', N'Losson1', N'P05', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ivlorlphjuwbvyw', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ivrovzugnwtoavv', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ivvlnqitjzokmdh', N'LESSON04', N'P06', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ivzccbxbmyclozg', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'iwidwmkohrrwxwa', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ixlcsedayukdyns', N'LESSONS02', N'P05', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ixptjhpowszrmxj', N'LESSON', N'P04', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ixqmxkptobzuyna', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ixwvqvzqttdvwmx', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ixyhqqrobdpamzg', N'LESSON111111', N'P06', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'iybtzmcikgkuvsi', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'iyuxjttxapwobbe', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'izfqikoovopgzaj', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'izwewkmptdmiglr', N'Losson1', N'P04', 20, 3, N'Pinocchio Reading')
GO
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'izxfwuspafwerrr', N'Losson1', N'P06', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jaimzbvtdcpuxfk', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jajeplwwgzymaxg', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jbbboabwerqupra', N'LESSON04', N'P04', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jbiuircvotuwwvk', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jcgywzwdxpaaixy', N'LESSON04', N'P04', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jcjkpnqphtvleyb', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jcpgcewkxqnqaxx', N'LESSONS02', N'P04', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jcrnoyopdiknrno', N'Losson1', N'P01', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jdafbattyzjagyz', N'LESSON', N'P05', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jdatdszxrgieyvx', N'LESSON', N'P04', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jdhzzkmgcxtgipw', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jdnklowayrnxupk', N'LESSONS02', N'P05', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jdrruqrutotsgwc', N'LESSON111111', N'P01', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jdssxbhwxwmygob', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jebjfspjzzrnpgf', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jeumqzclfhfjrfx', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jflyfyqucsudufv', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jfrfwwvgatxhrdg', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jgkkklyyzzjuree', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jhaxcdezntqyodk', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jhfjzquefylwrwh', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jhlnqsuxhvlwpie', N'LESSON111111', N'P04', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jhlqauzpitjqmco', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jhxltfxshgsyvep', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jhxyrnspozttdhr', N'LESSON04', N'P01', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jijumzzirmhpujl', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jikgxvhwfntfjes', N'LESSON111111', N'P04', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jikmxahojiyxtop', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jjjwdozhmtxhohh', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jjqylezltuutlmd', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jlqbwlnvxdcjrih', N'LESSONS02', N'P01', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jmbxudcvbrucmpp', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jnmhmbjqsyrwyun', N'Losson1', N'P05', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jnmoqgtbpanyini', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jnshrstsxtatjpc', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jnylrjgjoqtfcjp', N'LESSON', N'P04', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'joaecqkzxmifhjd', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jopyrhtbnhoyeee', N'LESSON04', N'P01', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jpfjctrsmwxrvgm', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jpjcdwsdyocljow', N'LESSON111111', N'P05', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jpjmygmdzqmgkjx', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jpluoxcmiqrihga', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jpqcakmihvqjtgr', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jpquldxlvwxffej', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jptwuhekibkgkfo', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jqejcztiprosdca', N'Losson1', N'P04', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jqequphyeqjjzeo', N'LESSON111111', N'P06', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jqgxcbdeqitjofz', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jqkmhsqlfyoqaxz', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jreryevzlxeagjs', N'LESSON04', N'P05', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jrszhvqbuzwjlha', N'LESSON111111', N'P05', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jtawsuqwqwhysre', N'LESSONS02', N'P04', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jtonbqvglwhzcnb', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jtylruqqmnndhii', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jucijdftvqtcwng', N'Losson1', N'P04', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jumagcsmpagjemo', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jvwiaeylhropgfy', N'LESSON', N'P04', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jwfhlbxaxegfohm', N'LESSON', N'P04', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jwfzzrtstaxbupw', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jxbdddpfuectcee', N'LESSONS02', N'P05', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jxgqjoyfhtyaail', N'LESSON', N'P06', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jxhstqdxjrxuxcv', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jxmrvhmnabuzlci', N'Losson1', N'P01', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jxolzutihbfteaw', N'LESSON111111', N'P05', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jxwdhhpmcnxxerz', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jxyxbruircixwqy', N'LESSON', N'P04', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jyekmadqfwyswsq', N'LESSON', N'P05', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jyiggmyihpqgkpg', N'LESSONS02', N'P06', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jykzupynzyqjwfy', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jyxoivdsmqxomqc', N'LESSON', N'P05', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jzfzxkdomsklyho', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jzkhjxnklxjmkgf', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jzueuwovzooucgy', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'jzvzhojbhxcfigj', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'kacvmdjmghpuozk', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'kagqhsxhbpiwyai', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'kaonlqbopwitrmj', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'kaowyxlwmuralsr', N'LESSONS02', N'P06', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'kbnnnwgaioqxcfn', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'kbsmafpyxsgpoil', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'kbttlmjdfglwvcj', N'Losson1', N'P06', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'kcclzopiaxkjjou', N'LESSON04', N'P05', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'kcexklxyfqvnzfb', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'kcjfwyhuevuolfr', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'kcogbcbtxogmvch', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'kctxsenivmuajmx', N'Losson1', N'P06', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'kdndcnwhytmstum', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'keczlaguhnyvnur', N'LESSON111111', N'P06', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'kenlrvlekrfvhwt', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'kevzwtyclubyigs', N'LESSONS02', N'P05', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'kfbfsyeysoxnvlu', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'kfiicpjyzrfnfwo', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'kfwhmbeiytumgam', N'LESSON', N'P01', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'kfytenzsuraomzr', N'LESSON', N'P04', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'kgakcdemhwauvxv', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'kgelfvoswueoseb', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'kgskyjptlmfstlr', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'khggllyfuqdurqw', N'LESSONS02', N'P06', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'khncbrtiuyknvhh', N'LESSON', N'P04', 20, 3, N'Chart writting')
GO
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'kitoalfmeeikisj', N'LESSONS02', N'P05', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'kjjpvmzomvvdnni', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'kjjxkuolyuogboq', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'kjnoiipfubrydvu', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'kjzranepymipkci', N'LESSONS02', N'P06', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'kkivqixxtvdgrfr', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'klcdsrxjdpvlpfk', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'klikjocvbqzpndv', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'klrkuactiqctrfg', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'klvqhbqkezdnbpj', N'LESSON', N'P01', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'kmckzefnzkjokzy', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'kmnywktizivctuf', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'knhilaxjcvfwkva', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'knlgywnakbbradm', N'Losson1', N'P06', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'koeljueavjmjbhv', N'LESSONS02', N'P05', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'kogvqmupgydgmvn', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'kogwrdcmhokrcuj', N'LESSONS02', N'P01', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'kohpahmgotyzzwh', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'kooqgazwftjsykg', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'kosiyyhxktrrxwm', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'koucrvzykzkoovj', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'kpidapyssgtssvu', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'kpnbkkafozcgeyr', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'kpnfjsgrzssjuwg', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'kppdknaoypmmoox', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'kquffjlpwxxroxv', N'LESSON111111', N'P06', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'kqxygznuggdyzzs', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'krdhnkvzalomwna', N'LESSON04', N'P04', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'krfaanvesvppids', N'LESSONS02', N'P05', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'krizojlvabllyle', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'kslsczvwbocjifm', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ksqszeqvnuihgdw', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ksrecijgmzkoskm', N'Losson1', N'P06', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'kstrmahlvaedwli', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ksxbucytucxrmlz', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ksxoskspbwxnuoc', N'LESSON04', N'P05', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ktaacgdjjzthdhe', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ktefwitozvxsmva', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'kubhilxwtbnrgnj', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'kvgniqtoachnsxh', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'kvzufvkgiusatpr', N'LESSON', N'P01', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'kwjyrfyllpydbsq', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'kwnlpsoqeusadlo', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'kwnmrftallswelz', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'kxcobrjxagkocor', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'kxhavcmqeztpvgg', N'Losson1', N'P06', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'kxlfrdtcbwrszvt', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'kzisetselkhfavh', N'LESSON111111', N'P04', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'kzqplkishxbvtnn', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'kzsmveelvyozbny', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'kzuaqrxgxryieoq', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'laidhpqanuithfb', N'LESSON111111', N'P05', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'lalfhsrvblcqcur', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'lasmzdujacrdhcj', N'LESSON', N'P04', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'lbdvtxwzligvghf', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'lbxohwoutchsqhd', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'lbzsqoejcgxazpa', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'lcgdgyuqlyglwxs', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'lcwuitffrmisrzs', N'LESSONS02', N'P04', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'lcxethtqoscglwn', N'Losson1', N'P06', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'lddvxfuomrbmddl', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ldpqpjgtnpfelmo', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ldyghvtffwuxqgv', N'LESSON111111', N'P06', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'leidfibilmfuwwc', N'LESSONS02', N'P05', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'lejbvrkwlrdlsdx', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'lfxsftkcvhqtpcj', N'Losson1', N'P06', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'lgzkgslgvqwtkwc', N'LESSON04', N'P04', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'lhacujzmttdtsdz', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'lhndtcubyhxqvtk', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'liecktpurkbrvmq', N'LESSON', N'P04', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'lifzrometildllk', N'LESSON', N'P01', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'lihqwzmrrvxilnr', N'LESSON', N'P04', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'likjoahsjrljauf', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'lildhijzbrpofel', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'lipugwktwzrhglp', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'lisenzbbubkvxlh', N'Losson1', N'P06', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ljhrkkeymlgrpcy', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ljkixnriswuwscq', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ljtupzsmduteowp', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ljuzcpcdotefeie', N'LESSON111111', N'P05', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ljzipfxvaulwwvi', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'lkbnaneorumejqv', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'lkejqfsxfnwttuf', N'LESSONS02', N'P05', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'lkevirbdsulvblv', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'lknaotnsnvvpwfu', N'LESSON111111', N'P04', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'lksdwbflhuttsvj', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'llfdfvefpbbwwuu', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'llqcbqszmkssuvd', N'LESSONS02', N'P01', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'lmdyayxakqnnoyo', N'LESSON', N'P05', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'lmgnlywmytmevxr', N'LESSONS02', N'P01', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'lmhvukssnjfccve', N'LESSONS02', N'P01', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'lmjvxwhvrrzicmc', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'lmxwmkbrqknirmc', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'lnbgxgblvhkgtzv', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'lncfedlyptwpjel', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'lneojhadvxkwkph', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'lnxduxjwnfblmgq', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'lonbssmfxojpyde', N'Losson1', N'P06', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'lorihbwcannusds', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'lpsbvhrvpndjmam', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
GO
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'lpzedniijeehcpn', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'lqbwtvfzflbgmsf', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'lqfnkyqodjpvzdv', N'LESSON111111', N'P06', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'lqkailwlnhuvonx', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'lqyjfkashoehdhc', N'LESSON111111', N'P04', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'lqzuqyoedtyvyex', N'Losson1', N'P01', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'lsfwmizghmhnixh', N'LESSON111111', N'P01', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'luegzeeqmltygwk', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'lujnlrpmlqszswa', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'luuswcrmhxrwcbe', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'luwadebehwfohvc', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'luwbuyynxnoabpu', N'Losson1', N'P06', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'luyakuqavkrrgif', N'LESSON04', N'P05', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'lvbgdjxxnxzlufz', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'lvrbvxdtumgminq', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'lwhbkmdwomdjekg', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'lwvgiyrkrvhgsxu', N'Losson1', N'P06', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'lwvukqwokchkjur', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'lxbjehcnvoqycqe', N'LESSON111111', N'P04', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'lxvfngcttsqxddh', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'lycyprdlcldrefb', N'Losson1', N'P06', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'lyggbenhbqctqes', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'lyotfdaectzvqor', N'LESSON111111', N'P05', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'lyusssazxvpifdt', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'lyzfdqtcsipvgmx', N'LESSON04', N'P06', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'lzlifdmaustsvvf', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'lzpcvlgkprrjpim', N'LESSON04', N'P05', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'lzvkibbdbsyahvp', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'mabyodzyfeyjcfv', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'maxaghattkiaupn', N'LESSONS02', N'P06', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'mbsfpqaksianpvh', N'LESSON04', N'P06', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'mbulliisqbpybwt', N'LESSON', N'P04', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'mclzwiddlzisfug', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'mdwmuxhemasurfp', N'LESSON', N'P04', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'mefssduuqlnylep', N'Losson1', N'P06', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'melyfkhoytqqadi', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'mezydhfrxfqbsse', N'LESSONS02', N'P04', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'mfctqmyyjpbaqwx', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'mfojqqppafxyzjf', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'mfpxfdzfiikhmez', N'LESSON111111', N'P04', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'mfvswvyokksusxe', N'LESSON', N'P04', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'mgvpjqpsyijhach', N'LESSON', N'P01', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'mhibtjusekqwxup', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'mhkbtztfkqdtbfu', N'Losson1', N'P01', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'mhmquzgprwobuyc', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'mhnjfweodppxiug', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'miboqodlphhlvmm', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'mixjtrcfmvhusxh', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'mjzfzxncghcjypk', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'mkckfejgagzpqjq', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'mkfeynspnnovsoj', N'LESSONS02', N'P06', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'mkkvlhhaxmaftjk', N'Losson1', N'P06', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'mkyiuhsquhnsilu', N'LESSON04', N'P05', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'mmdmuuwzxekoxpq', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'mmyrvsbjylfkqgg', N'LESSON111111', N'P01', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'mobkbbdwlbfqgfi', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'modmycvpzogfukw', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'moinbufwnmkyqsc', N'LESSONS02', N'P05', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'momggzrzqfvesds', N'LESSONS02', N'P05', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'motgzlamjmdqorg', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'moxaiogsdjrvpfj', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'moxuamvbjiykskp', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'moxwisugstyqhng', N'LESSON111111', N'P05', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'mpkwehfwlkejqvp', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'mplfphjspqfnzit', N'Losson1', N'P06', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'mprexqkmmqqxuvi', N'LESSON111111', N'P04', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'mpuxygmqwzweexf', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'mrhhoizonhtaqvs', N'LESSON111111', N'P01', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'mruenrepmnovkyd', N'LESSON', N'P01', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'msatvhznfqhnjlk', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'msbnzyaengnrfao', N'LESSON04', N'P04', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'msdsicqdnwdiztw', N'LESSON', N'P04', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'msshnexxorqkwwu', N'LESSON', N'P01', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'mtedpnodlqrpdde', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'mtglwsaeojuhkmf', N'Losson1', N'P06', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'mtjzyksjftzpjkb', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'mtltifkanotiwmv', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'mtzyqcywnqpqndt', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'muezrctysjankcq', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'mvmqpqntaszinnf', N'Losson1', N'P06', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'mvrvprcwkigycxm', N'LESSON111111', N'P04', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'mwaypiwtcxejegr', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'mwgdmvwnlpqxmfc', N'LESSON04', N'P04', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'mwiejltyrpkyftg', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'mwifmyxizgkugtr', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'mwmdxhjpzvgtvbs', N'LESSONS02', N'P05', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'mwpprdhhilfpzhr', N'Losson1', N'P04', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'mwqzdrvteqadtem', N'LESSONS02', N'P06', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'mwxlluyiwprghtc', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'mxciizkawezpabn', N'LESSON', N'P04', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'mxwqgpwrdqzjllk', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'mycwfamybqbjalw', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'myfabvduphvedsa', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'myfqtmsjktxitsp', N'LESSONS02', N'P05', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'mypxjvwuethizwx', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'namnkvlzlzuvgvs', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'nanfuxysnxjbijb', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'naoksarvphgfjlg', N'LESSON', N'P05', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'naquynlmzmurlct', N'LESSON111111', N'P04', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'nawriwdgszqgemo', N'LESSON', N'P05', 20, 0, N'Chart writting')
GO
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'naynyamoaemtbjx', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'nbcbxwontppvqpf', N'LESSON111111', N'P01', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'nbdcyfunbrzscvf', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'nbooazqywotihmy', N'Losson1', N'P06', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'nbttabebhfbywwf', N'Losson1', N'P06', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'nccfmezvcjpgbvc', N'LESSON', N'P04', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ncdijzqeashbqbh', N'LESSONS02', N'P05', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ncsqnwvfvdrmfch', N'Losson1', N'P04', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ndjoxkqvtbjqgtv', N'LESSON', N'P04', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ndujzyfogffidul', N'LESSONS02', N'P05', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ndvezcscvpndvdi', N'LESSON04', N'P04', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ndzrllpkflejpuc', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'nefwpnpnhdfpeav', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'nehevrdsohtwfls', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'neiqziwwzucxvjl', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'nflxkkxnextugst', N'Losson1', N'P06', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ngoftahivhkjqpc', N'LESSON111111', N'P06', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ngowsocdtupkxox', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ngzpqfxupticvnc', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'nhcfdtyckiwawnj', N'LESSON04', N'P05', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'nhiczqjwqkhvkby', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'nhpqeovtrnexkmx', N'Losson1', N'P06', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'nihhpureipncxad', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'nirrscvijrwnpvf', N'LESSON', N'P06', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'njbiinsuvfpzyss', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'njqpjvxeagwhato', N'LESSONS02', N'P05', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'nkmxingdlhucnxt', N'LESSON111111', N'P05', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'nlfodjwecczguju', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'nljmqficscxiwrz', N'Losson1', N'P06', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'nlniubuphnoqiuo', N'Losson1', N'P04', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'nmtoeqbpwofkstj', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'nnbnbozzlqdcpnv', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'nnrcjdcihwcjokv', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'nomccvakoifsulk', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'nowdvvifzwxnina', N'Losson1', N'P06', 20, 1, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'npgyjboadlxlbql', N'LESSON', N'P04', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'npinkuzmqdneppw', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'npvhhgamoespkqg', N'LESSON', N'P04', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'nqbzsvvbinivnbf', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'nqdsxfohaiceylr', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'nqluxqmhwxsglae', N'LESSON04', N'P05', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'nqwtignatmrbdck', N'LESSONS02', N'P05', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'nrbavizlpeirobq', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'nrbgickyumbybcm', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'nrunkssmroqtamp', N'Losson1', N'P06', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'nsjuriygeiplrtc', N'LESSONS02', N'P05', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'nsmgvxhqestvlgn', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'nsupnaiclmokxov', N'LESSON', N'P06', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ntcrzccwmyuymqz', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ntuawejyyeefdsl', N'LESSON111111', N'P05', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ntymfkudrbxiobt', N'LESSON', N'P01', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'nuakntmcqimxvuj', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'nuestdwrsornlst', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'nuvhxdekjctnlvd', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'nvkkhzontnlgiib', N'Losson1', N'P06', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'nvwsxdjcymlgzme', N'LESSONS02', N'P04', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'nwpguiswjkcvxeb', N'Losson1', N'P05', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'nxdxeexgekcvhay', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'nxejhiqsdpfctho', N'LESSON04', N'P01', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'nxhwranxmqyrxik', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'nxkgrqdklywmflj', N'Losson1', N'P06', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'nxnudwbhlksdvnk', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'nxpbgzljyoxurgs', N'Losson1', N'P05', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'nxqscdupijyrwcy', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'nyhecrgwajpshzn', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'nyrvkauxcglnoxu', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'nyssmrhtoeozbad', N'LESSON04', N'P01', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'nzcssgboufgigql', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'nznlqxwepezaepp', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'nzplnlehkqhfhlm', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'nzvjcfvsmnsyydt', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'oajdntvdcbzcksy', N'Losson1', N'P06', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'oanvctlbbxfmuhy', N'LESSON111111', N'P06', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'obawgovxdammssy', N'Losson1', N'P04', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'obbptsvcvkmpeiq', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'obfoholsdqikurc', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'obfpjclktalmhrh', N'LESSON', N'P06', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'obwamcafbhtxewj', N'LESSONS02', N'P06', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ocaczeshynlzgid', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ocjhvtugkjlgjuq', N'LESSON04', N'P04', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ocrymuybkenmtcy', N'LESSONS02', N'P05', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ocuhphocfldzzbg', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'odakiuzjkfqbeyc', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'odfagbzghxjihwu', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'odfanyksakwrxak', N'LESSON', N'P04', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'odqtfsvwcxcafvy', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'oetimscfnhmggsw', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'oeznkdtmlhngwsh', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ofnqocdrxbemeso', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ofqcpcxswrqtbes', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ogjpmhgmhphhzwq', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ogrvbcriulffocs', N'LESSONS02', N'P06', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ohcswoybxxtbeel', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ohjwvtyeyfgfwhd', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'oicaknvnvkfzzhw', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'oiivwysvwetnzgy', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'oimroqgirgpjlok', N'LESSON', N'P01', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'oirjnoiubatssio', N'LESSONS02', N'P01', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'okbwxxfkbyokshk', N'Losson1', N'P06', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'okcitdbphblcxyv', N'LESSON', N'P05', 20, 0, N'Chart writting')
GO
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'okiiqkbimdmxlui', N'LESSON111111', N'P06', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'oknbtxrvcdlyasr', N'LESSONS02', N'P05', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'okporqpdkkpzlkj', N'Losson1', N'P05', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'omwwjkmdewpfylm', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ondykwrfnpmvhis', N'LESSON', N'P04', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'onmuewddnnvsvbo', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'onuzavgpsckcucw', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'onzhmiqlrhjdgbn', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'oohzuzzyukosptr', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'opcmcfqktcibfaj', N'Losson1', N'P04', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'opdgtwuzscjasrl', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'opxvldevudumrqs', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'oqblpqtjenneqlh', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'oqomtlcegqudowi', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'oqqbrldxkbplkmi', N'LESSON04', N'P06', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'orbsuwrivugdnim', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'orillfuaritlnib', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'orrcfzdmbfhbpwq', N'Losson1', N'P06', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'orvzzkzeezzqdsg', N'LESSONS02', N'P04', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'orwsnozjviatpix', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'orwzcwogihtwdke', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'osisanjxdgmobjj', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ostvligapwhgfvs', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'oswgtsemabfohig', N'LESSON', N'P01', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'oswxijxscjiwtag', N'LESSONS02', N'P05', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'otfnmbcordhjtbu', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'otpiigceqmwvhnv', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'otvnbqcrldefoyk', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'oujphxnppksotks', N'LESSONS02', N'P04', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'oumrhboldbmlnzh', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ouzlnwazfjjknzm', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ovfdbssvhidekqt', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ovhqfgrgnpqhici', N'Losson1', N'P06', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ovlejybzwqexmea', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ovomzhzrwabmkxq', N'LESSON111111', N'P05', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ovrmswoklhddauw', N'LESSON111111', N'P04', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'owfkqaistgwhzra', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'owgofwlgfnflwxj', N'LESSONS02', N'P01', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'owtyjfciqbpheqy', N'LESSONS02', N'P05', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'oxdetmmdrivzvbf', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'oxyxhzchsdwxjcp', N'LESSONS02', N'P05', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'oyatwoicdcnbfzs', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ozfbzwqwdnbzndp', N'LESSON04', N'P06', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ozxgjqvtdfufime', N'LESSON', N'P06', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'padcgngnjggawas', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'padvrgqqxhnxiyl', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'payvuavrkbhzkab', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'pbahbhqbqlahwyu', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'pbwiolzkifemgqi', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'pcwqdtphudxpurp', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'pddglmhoijiwavc', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'pdfmxzikifmgtwj', N'LESSON111111', N'P05', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'pdtlmfgbbtlawcd', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'peapkhtvvyxmgho', N'LESSONS02', N'P05', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'pegwbeyitzbrdfz', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'petpairappfsjpk', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'pevdcndrxaizfgu', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'pewbjgyhucdtcof', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'pflvkvbajmiqdll', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'pgfbrxitgdabqzl', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'pgftcqtwuehxbye', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'pghggdrhaluazkt', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'pgryelhyoidwley', N'LESSONS02', N'P01', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'phtpkcdidytbvxj', N'Losson1', N'P04', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'pidorswdjzlkboq', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'pidvujneefasmjq', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'piiepzxzgsereli', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'piklbqqrzguljwv', N'LESSON111111', N'P01', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'pirimwawalmhbir', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'pjwfarrhchxataz', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'pkcnvqwbrvsnagh', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'pkfsatqxqjfsdkz', N'Losson1', N'P06', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'pkugyavlvmlbytg', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'pkxwknwuqbzzzto', N'LESSON111111', N'P05', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'plqnwybmmhyqxrw', N'Losson1', N'P06', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'plrhaqbetydutga', N'LESSON111111', N'P01', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'pmeeilmtpnmdlyn', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'pmefkzmlgxpgyzr', N'LESSONS02', N'P01', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'pmoabkyrqkwayqj', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'pmujudnemvgzqzh', N'LESSON', N'P06', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'pmwfyjbdvakkysr', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'pnfqovktnhaloiv', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'pnkmxtsmoohzphr', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'pnmzfwqpvyovwvm', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'pnxbnzgyfybotpv', N'LESSON', N'P04', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'poeyjwythhzkeyx', N'LESSON', N'P04', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'pondpykicijezsv', N'LESSON', N'P05', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'potgxgccwhhhvhl', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'poutstuxzarqxic', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'pozajrzkxbvvvgn', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'pptidnzaediktml', N'LESSON04', N'P01', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'pqeqmoupgznvtan', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'pqhqmdtcngasxkt', N'Losson1', N'P01', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'pqjyybflfenxfze', N'Losson1', N'P06', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'pqutobnmajcynjg', N'LESSONS02', N'P01', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'pqyfakjvkfuehaz', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'pqyykcuyygbbsys', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'prsnqnrxylbpktl', N'LESSON111111', N'P06', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'prspgrnyihrmori', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'prxkijpyzhfrepc', N'LESSONS02', N'P04', 20, 3, N'Hobbies Speaking')
GO
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'prymrgzbczgxkxb', N'LESSONS02', N'P01', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ptoogbkicrzehck', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ptrzolivowxmjpz', N'LESSON111111', N'P06', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'puoesnpexhtscsu', N'LESSON111111', N'P06', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'pwdcecwjaijdrcp', N'LESSON', N'P05', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'pwdjaavoakiejkb', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'pwsyhpyxwriliib', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'pwzaxmfnfdsrdlt', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'pzbcdcqlfymuwit', N'LESSON111111', N'P06', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'pzhlxlftozbjnao', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'qacnzvlpsjbqzop', N'Losson1', N'P06', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'qafjffxtyevaysj', N'LESSON04', N'P01', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'qanvnizipdmclhz', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'qayolzvykcfvjgd', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'qbxajgqzldjkvxn', N'LESSONS02', N'P05', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'qcdglzsupesiseu', N'LESSON111111', N'P06', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'qcrirgelvyyoisy', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'qcsdrksyligjbbw', N'LESSON04', N'P01', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'qcwjabygaxjhjwp', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'qcxthuthsdnynym', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'qdxddabtyqtinqc', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'qenkivctnxdxzck', N'LESSON', N'P06', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'qeqruxxwhzwwhbn', N'LESSONS02', N'P05', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'qeunojtojtplvyd', N'LESSON111111', N'P01', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'qevieaxeitpkipg', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'qezpovhvuvxbmvp', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'qfczdytljvcihpp', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'qfoutkqejdyltzf', N'LESSON111111', N'P05', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'qgatfkywhxbzeau', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'qgkknnsoipfaibd', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'qgrhdgbyshtgcsh', N'Losson1', N'P06', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'qguitgncldhirah', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'qhsnjlvlcinqfym', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'qipmtnbkyxfjcep', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'qjfhirbfbvfdrrw', N'Losson1', N'P01', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'qjhljjkqebhgnvc', N'LESSON04', N'P01', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'qkkalfrsrweefqe', N'LESSON04', N'P04', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'qknoxloprhavwrf', N'LESSON111111', N'P05', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'qkrsumwaoezyahr', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'qlcthkgowckunhd', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'qlwprrjtotgitpc', N'LESSON04', N'P06', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'qmwgeqpihacjlza', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'qnklmmddhcyqdqx', N'LESSON', N'P04', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'qnkuxvkxevvjrxy', N'LESSON111111', N'P06', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'qoadiqpmaeckwon', N'LESSONS02', N'P05', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'qoeuowdprwqvbqq', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'qoutdkeskwnswof', N'Losson1', N'P06', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'qovoabupgbjswbg', N'LESSONS02', N'P06', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'qpfmcbzigwgkunk', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'qpvdaytilbdrcey', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'qqdrqjtrprlogpx', N'Losson1', N'P04', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'qqhxiashniyuqse', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'qqobxgdjryahvtd', N'Losson1', N'P04', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'qqphtqpgirrvxbw', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'qqucjzrrkgvfgna', N'LESSONS02', N'P05', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'qqzqgxknbefzifx', N'LESSON', N'P05', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'qrqudpfwepamksf', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'qspzfnxhczamlku', N'LESSON04', N'P06', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'qssmtycnawxluwx', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'qstjarxcxzrfrei', N'LESSONS02', N'P05', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'qsydjtdjrwfkrrk', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'qtaggvgwfyzgvjn', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'qteetrsuvyxiwqs', N'Losson1', N'P04', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'qtyxbrsryumzuxq', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'qutwzxvmhipvpbr', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'qvpdxvbnzdcjoyh', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'qvxrqxbogvoxuip', N'LESSONS02', N'P05', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'qwawwmwducvbmyl', N'LESSONS02', N'P05', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'qwevjinucjrxcgx', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'qwirpsyxielhajr', N'LESSON111111', N'P01', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'qwvhowbgaackmle', N'LESSON111111', N'P06', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'qxnqfowzkwfikec', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'qxoitqawgdkmsqq', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'qxwvotazfzxjsnw', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'qytwdluljivqcir', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'qyzrkoakkyzomoy', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'rakbmpcbjfrdlbg', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ramkardfufmfaap', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'raojvxhlvmbklrt', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'rasmxfzaeokfsky', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'raueighgvlbmspc', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'rbitmflglrdfpgd', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'rbxgtopxgetobwh', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'rcfwpzgheecclyj', N'LESSON', N'P04', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'rdafstmtvaedvdb', N'LESSON', N'P05', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'rddvtmyejsuxjdm', N'Losson1', N'P06', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'rdpqgkxhpvegcsf', N'Losson1', N'P01', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'rdqoorbyzdvujxn', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'rdscuvconsbfldi', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'rdtaboydkvwzils', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'redvuotviucbnyd', N'LESSON', N'P06', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'refvubrugyusytv', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'reontfoletvtlxh', N'LESSON111111', N'P01', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'rfgnvdbzqaydofb', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'rfiddpgbaswvbkc', N'LESSON111111', N'P01', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'rftmauwnueuogic', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'rgncuaeshlozzih', N'Losson1', N'P06', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'rgpyxcmuldgzchl', N'LESSON', N'P04', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'rgqockcftqmhbvw', N'LESSON', N'P01', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'rhaumrmbtysyrhd', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
GO
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'rhvmadcfustxghn', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'rietvwgudymreel', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'rinonufvbukpfwe', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'rityrarprczhexm', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'rjcrsbqtgcyyjin', N'LESSON', N'P05', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'rjlalpudskhjieu', N'LESSONS02', N'P05', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'rjyhllblwudidvj', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'rkmmofajczrwcok', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'rlbdasmqfffjqwa', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'rlfagcxtlazupzu', N'LESSON111111', N'P05', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'rlteqraaksdqdpe', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'rlxmcelwkxdrppv', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'rmgzmkzettreegl', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'rmrwimoziaazwge', N'LESSON', N'P04', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'rmxaatfqpvatxef', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'rngeqoqsvqgqdyt', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'rnrskbuuotkwdfp', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'roozwiytjgjuniz', N'Losson1', N'P06', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'roqzrocyloxzyad', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'roydlataueijdaj', N'LESSON04', N'P05', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'rpiyhedpqbagwhg', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'rpvyfxyevqudzwr', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'rpzvqfklvfpdoer', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'rqbpevulwsgbyxa', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'rqoqiqdhyunbxib', N'LESSONS02', N'P05', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'rqsyrsybtrswiqt', N'LESSON04', N'P01', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'rqtyudodxamcihs', N'LESSONS02', N'P05', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'rqujaqpvozxxknq', N'LESSON', N'P04', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'rrcvokgglbbshml', N'LESSON04', N'P04', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'rrfkpdssytrmvlw', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'rstwarxpsbbcyyt', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'rufxjobfosjxizh', N'LESSONS02', N'P04', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'rumuntbehykasbv', N'LESSON111111', N'P06', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'rurjvjwbbbdsroc', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'rvjkoyzqdiluwwk', N'LESSONS02', N'P05', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'rvjxngumkclqezm', N'LESSONS02', N'P05', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'rvxbwvxskuqmspx', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'rvzbwkvgqacjwad', N'LESSON04', N'P01', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'rwjzqokceajgbct', N'LESSONS02', N'P06', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'rwqoqevkiblvvgl', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'rwycutzwofaclst', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'rxjbnjeetyckuyi', N'Losson1', N'P06', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'rxjjxadaqctrrgm', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'rxkkyslyrrzcifi', N'LESSON', N'P04', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'rygfrfewewbuhkj', N'LESSON04', N'P06', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ryidolindestzhz', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'rypblwvwrbnlpxu', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'rzabyvfkzzzgbxf', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'rzaujnqnnagdnwy', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'rzhdemxltivntec', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'rzhpctshacvjbie', N'LESSON111111', N'P05', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'rztyibiprpvuiff', N'LESSON04', N'P04', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'sadklawefbgxizf', N'LESSONS02', N'P06', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'saenoupgelqqbnd', N'Losson1', N'P04', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'saiicgrdeuuwegr', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'sajimteikpkejdv', N'LESSONS02', N'P05', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'sbtpvaodkwqvzpd', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'scebqattlqvgmth', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'scmtbktriaxemfl', N'Losson1', N'P06', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'scsulfwmbbwdnni', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'sctisjycpqcnotd', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'scxoefiwtwkomnk', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'scxsaznxeyhvfgq', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'sdkjadcpdqwdezx', N'LESSON04', N'P04', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'sdkzzrwlbdcfmzt', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'sdotwhclyqowktl', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'secfeinbulajyvv', N'LESSON111111', N'P01', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'segeacnnsapopqq', N'LESSONS02', N'P01', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'seggxpcltyotkxj', N'LESSON', N'P04', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'seiucdbwzfbwijy', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'selkorcfuuoujjg', N'LESSON04', N'P06', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'sfazhtsnsnaavfa', N'LESSON111111', N'P01', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'sfrhlomzawaoxxu', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'sgcajfipwvthvwy', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'sgqerbvlvypomow', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'sgvkqmlsuyrocoh', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'sgxbhdauervtfpw', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'shkntkwxfrhtloo', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'shlisathzckcuqb', N'Losson1', N'P06', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'shpukibjdslyimz', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'sihqrfnmsifoxaf', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'sijayxdbdyxlinx', N'LESSONS02', N'P05', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'sjgvscfwqsgoysu', N'Losson1', N'P01', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'sjhgeqtinyacspp', N'Losson1', N'P01', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'sjhtfjymgezgkmm', N'LESSON', N'P04', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'sjkfogfslsxhdlh', N'LESSONS02', N'P05', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'sjormtvxexregef', N'LESSONS02', N'P05', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'sjotphahmosahfq', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'skuknfvonqezgfz', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'skzszsgkmvdasfq', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'slgdkutjmahhyha', N'Losson1', N'P06', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'slksnmdcvbvwcir', N'Losson1', N'P06', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'sltcgaknkybhzwz', N'Losson1', N'P06', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'smfcjlnjfyxkmca', N'LESSON', N'P06', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'snpfpobymaznafy', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'snqfuwthmekdqyu', N'Losson1', N'P06', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'snrsvsdpapgyclt', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'snsnsitlwtcyczt', N'LESSON', N'P04', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'soeyterddykvqyg', N'LESSON', N'P06', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'sojsqbcbxbbsoqr', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
GO
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'solsmhghyjpwahw', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'sphuqwenzlrsvza', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'squblzynvjbceni', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'srucbbdfhpyqwpx', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'srzknonbguxrioo', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ssadkwwalojkxto', N'Losson1', N'P06', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ssadlzsrlqqocof', N'LESSON04', N'P05', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'sswfycgtursmaga', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ssxojdloywtqjtd', N'LESSON111111', N'P01', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'staynvzokgskbnb', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'stldkupamzmyiph', N'LESSON', N'P01', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'stnzliwskwljwrq', N'Losson1', N'P05', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'strwftskmpdxjog', N'LESSONS02', N'P05', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'sttwhfhmqxxejfe', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'suywmxgbawuftju', N'LESSON04', N'P04', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'svfjhvwbsnavyfh', N'LESSON04', N'P01', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'svmcpcbjpwvptwu', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'svrkhzvxtuinvuk', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'svsfgeacqsvqsir', N'Losson1', N'P05', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'svxvotwakvohrvz', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'swlqwggntpallvd', N'LESSONS02', N'P04', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'swwitftfoznstvl', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'swxcdblxwuhlgwg', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'swzqnijlkczjexq', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'sxilptzkgucdlae', N'LESSONS02', N'P01', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'sybbjpqlxphisme', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'sybplmczqdztqrx', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'szbymyierrtsjsb', N'Losson1', N'P04', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'szfltlpfbmefuzx', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'szhwukqkfvyafhu', N'LESSON', N'P06', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'szvndhuvavybpdq', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'szxtmxtbgamcuiu', N'LESSON111111', N'P06', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'tavvtojsnuredfy', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'tbrjwrfrynjgndk', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'tckjdhjhmbudslo', N'LESSONS02', N'P05', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'tcxekalplsxjabo', N'LESSONS02', N'P04', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'tcxrzznkzyxevgh', N'LESSON', N'P04', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'tdhmvdxavvpcome', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'tdkwtwokjlavlui', N'LESSON', N'P04', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'tdnqmfxtxspcnzb', N'LESSON111111', N'P01', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'tedfhtddytupymt', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'teqfwewekvottye', N'LESSONS02', N'P06', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'teshwixaymiqnmt', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'tesnicindubxanp', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'tfvsbnwvfisyxms', N'LESSON04', N'P06', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'tgpsgjrsajygnmw', N'LESSON111111', N'P04', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'tgraiwwxgqmhmcu', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'thqxjhrlhvsnjua', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'tibskmqmjllbjup', N'Losson1', N'P06', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'tihzaebhkncydtf', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'tiibqqaltqgwbip', N'LESSON', N'P01', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'tijmbfowpwblwfk', N'Losson1', N'P06', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'tiqzmvvvomsjlvl', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'tivgdsaimnwoitw', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'tiwgfvvympesmon', N'LESSON', N'P01', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'tjquuygjyhdtgxi', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'tjwahsdvkfgomni', N'Losson1', N'P06', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'tkpoxozytpkcgyu', N'Losson1', N'P05', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'tljznqfiwloxalg', N'Losson1', N'P06', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'tllfyiuzolhrhet', N'LESSONS02', N'P01', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'tloxkkeiynvofxx', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'tltfwxpexsvpqwn', N'LESSON', N'P04', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'tltqkqsbrvbfhlo', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'tlykdrdljqpqgkq', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'tmbcreiikukfpbh', N'LESSON111111', N'P05', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'tmbweoxravzezos', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'tmftgeygjqqqzqh', N'LESSONS02', N'P06', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'tmtytgydcmghfbo', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'tnlyopxpzzcasgm', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'tnnxjvbvbgqfdxr', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'tnygdjhauniexie', N'LESSON', N'P06', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'tothyvmccwpupai', N'Losson1', N'P04', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'toucdisxjxbpiyx', N'LESSON', N'P06', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'tpfxzmcmfutmbet', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'tpjxowtuelrkenk', N'LESSON111111', N'P05', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'tpomyzimyltqjcy', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'tpylqjaxovbkope', N'LESSONS02', N'P01', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'tqqxmlnznsfioff', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'tqwiypyujnyzafs', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'trjduiwxsomncvz', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'trpllfbkqpqrztk', N'LESSONS02', N'P05', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'trpvsywmiuuidvh', N'LESSON', N'P04', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ttitfbaaxrdgxzi', N'LESSON04', N'P05', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ttqvrevjxbibuyf', N'LESSONS02', N'P05', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ttshammozastnub', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ttygduriskbdchw', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'tuamplkalyrxhsj', N'LESSONS02', N'P01', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'tunvsctdvxuiylc', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'turcexudoawsztb', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'tusidamgpkuwzug', N'LESSON04', N'P06', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'tuwaorvcgtvpcxq', N'LESSON04', N'P06', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'tuziapglzsitjmb', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'tvixtbtxrzwmogi', N'Losson1', N'P05', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'tvmkekqgbuosixc', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'tvnwtubbwnbtply', N'LESSONS02', N'P06', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'tvspldfnnsiuxle', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'twmdbsafgoalxcc', N'Losson1', N'P06', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'twyvakvvcotdvbg', N'LESSON', N'P04', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'txgczjwfslxssbi', N'LESSONS02', N'P01', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'tylcfrzdpkgnvvs', N'Losson1', N'P06', 20, 0, N'Pinocchio Reading')
GO
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'tyrdtfumjqgsthe', N'LESSON111111', N'P04', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'tyxaqcfgprsmhvt', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'tyxtbvpjdtzjstl', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'uadafvaswuwqulr', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ualgbvdebkkatnz', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'uaonkxyywhqvfvr', N'LESSON04', N'P05', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'uaqgyaydoqqyqlj', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ucfcyboqzwmbtsg', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ucjstrsoxtqkscz', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ucobmcckdlulqbv', N'Losson1', N'P06', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ucpwjtshzqqlqpw', N'Losson1', N'P04', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ucunuwsoakjyrco', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'uefcvwgyqlobghq', N'LESSON04', N'P04', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'uevuhtztrrqxcfg', N'LESSON111111', N'P06', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ufkbmhepxehfegv', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ufurfmvlkmvrsjp', N'LESSONS02', N'P05', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ufwcxcfzeqilbzb', N'Losson1', N'P01', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ughstuglpmtlnfw', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ugmtcqagtleenjn', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'uhkvvovnahxxsyu', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'uinjjloamletwme', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ujggbkukwptlyni', N'LESSONS02', N'P05', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ujkfkeaxzjpgdbb', N'LESSON04', N'P06', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ujwlffuuxgezkbi', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ujxvgwjwoufjvim', N'LESSON', N'P06', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ukiylzxlvwimjlk', N'LESSON', N'P04', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ulcyeryajmjkkey', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ulveruurfkhpjrj', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'umwiawnlmubxmos', N'LESSONS02', N'P06', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'unmehvbvcsstfcl', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'unvrkfcfvjaavet', N'LESSONS02', N'P01', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'unwvlxmqypcdrjz', N'LESSON04', N'P05', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'uomaufltihbfyca', N'LESSONS02', N'P04', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'uongncxujouwehm', N'LESSON', N'P01', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'uopvxbwfxrtmkfp', N'LESSON04', N'P04', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'uordhotmlimkrdb', N'Losson1', N'P04', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'uowuinjhlyijtbf', N'Losson1', N'P06', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'upornbembkxtbtn', N'Losson1', N'P06', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'uprbqmraksuqhlc', N'Losson1', N'P06', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'uqmvvavwnugjnsg', N'LESSON04', N'P04', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'uqowwkbwuwqfzxf', N'LESSON', N'P04', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'uqrqjtxysmqadjf', N'LESSON', N'P04', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'urhrusidoxiqgar', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'urjxpbwaikmywfv', N'LESSON', N'P05', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'urkwxizqsscndld', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'usaioagrfnjqajj', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'usexpbagfjekddr', N'LESSON', N'P04', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'uskydpwpzoepbpd', N'LESSONS02', N'P05', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'usovxbrhciwdplt', N'LESSON04', N'P05', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'usvweqbizjbhzah', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'usxgspcvkdjfsrp', N'LESSONS02', N'P05', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'utavngebpwigygt', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'utipeuubvzeifks', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'utygmfqrirwyfnl', N'LESSON04', N'P05', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'uutbsxvriegklcv', N'LESSONS02', N'P06', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'uuuugbvwaohnxtm', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'uvgefehwycvjpgc', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'uviponfjjitrrsr', N'LESSON04', N'P05', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'uxgafrdbjrvqzvv', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'uxrbnzxnbufpvce', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'uxtpudzepjlawjy', N'Losson1', N'P06', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'uyjgblxmbvlruoo', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'uysoeuixfwagnez', N'Losson1', N'P01', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'uyuseftxwtfizfh', N'LESSON111111', N'P05', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'uzcppeutsqqxhpm', N'LESSON04', N'P06', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'uzwigghhdyrrszp', N'Losson1', N'P06', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vaaqfccsqozahhe', N'Losson1', N'P01', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vavtubchmnddvas', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vawwpviiwobknty', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vbkmygarfphguso', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vbqhkqxzfjvturq', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vbudcilmblqpgyc', N'Losson1', N'P04', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vcsxqukqaqmfmyu', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vdbnctbdrhhweef', N'LESSON04', N'P01', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vdcfpwbiiqhzquw', N'LESSONS02', N'P05', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vdigfrubivjcwrd', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vdkeowxnthvculm', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vdpelcsngobarjv', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vdpmbjhktmudglc', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vdvxnnsephouskq', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vdxafiuhtpqfgvb', N'LESSON', N'P05', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vedqigvfspqlxca', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vejwhrlnqpslncl', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'velenvzsxsfsnni', N'LESSON', N'P04', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vgfugbixlzzcgnn', N'LESSONS02', N'P05', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vgjnqkbvidmspdt', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vheaiyzhjjzchfc', N'LESSON04', N'P01', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vhfyqfdysrqrolk', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vhihuavlclsbpfg', N'Losson1', N'P01', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vhsfvazecfpunqj', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vilqebvtuqkklcs', N'Losson1', N'P06', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vilytikqgodoadz', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vjdhzgiuxprzvpi', N'Losson1', N'P05', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vjujfctyjpjcqns', N'LESSON111111', N'P04', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vkeebftolkktntt', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vkqbyhjkaqunfum', N'LESSONS02', N'P05', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vldrgsbtjrakltc', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vleshkjrkghvbsy', N'LESSON', N'P04', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vlpeofobnlnvwub', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vlyvwvxoposkfmf', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
GO
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vmornzclqhzehjg', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vmqxnqtqshhrpus', N'LESSON04', N'P01', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vmvjshodpeoalau', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'voizhvccxjmtfoe', N'LESSON', N'P01', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vollqghjndmwpal', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vozxgotpvmekvfo', N'LESSONS02', N'P05', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vpifdfozncdiiww', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vpmcuxueuqdvgby', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vpnwesmwdlyotcs', N'LESSONS02', N'P05', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vqjkhuivpfpqdaf', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vramjulflpwgjdg', N'LESSON111111', N'P05', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vrgcmpwuigfthtm', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vrmjdnbgghjxerx', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vrnhkgwwdkdrczi', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vrrvlgrkdgylfsr', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vrxccewxbhcqdqc', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vrzcdruzcxmzkaj', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vscblvzpruipcwo', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vsfrxiaxnjwmdwv', N'LESSONS02', N'P06', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vsmehmdueasyjlk', N'LESSON', N'P04', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vtwhsxgipkbzpko', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vuebkefhsiixbvy', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vujbhkageoovzti', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vujjwrpdrnhynvp', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vukvlcbxmfuzuim', N'LESSON04', N'P04', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vunavgqwmvkrpbu', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vuxvofcvnttocuq', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vvjctazcwhtrczp', N'Losson1', N'P06', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vvubviltmmarlut', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vvuusrusrhmjayt', N'Losson1', N'P06', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vwbuoxumwineoug', N'LESSON', N'P05', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vwiwwmenujsiyju', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vwnuwrdxepwxhbe', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vxgypkyvafkbdyc', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vybvtdanfgpptia', N'LESSON04', N'P05', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vyktnhpjtfwmzkq', N'Losson1', N'P04', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vymxozyuwlypvow', N'LESSON04', N'P05', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vyqtiltmyeqeilm', N'LESSON04', N'P01', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vysmwotrqorhube', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'vyzhpuwmdpgmjnk', N'Losson1', N'P04', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wabbyuinncvhqib', N'LESSON111111', N'P06', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wawjawgadjryjox', N'LESSONS02', N'P04', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wblaekbhtenrvyi', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wbyfcwpvwnroklw', N'LESSONS02', N'P01', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wcloidfdnbraqix', N'LESSONS02', N'P01', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wcxsedsoofnnytd', N'LESSON111111', N'P05', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wdfiygbyagagueg', N'LESSON111111', N'P05', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wdneolvbaohzyvr', N'LESSON', N'P04', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wduxrirgxzlmfaa', N'LESSON', N'P04', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wdvvwzrfvzzcymu', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wferlbgheemrsdj', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wfheotymvprzrbf', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wfjsuxacjexktha', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wfjzxoqdejlseca', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wfrqffzqgmqhnue', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wfrwsvjhrlaidht', N'LESSON', N'P01', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wfupwtlzdxpanen', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wgcjewuhbmjzlui', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wgdrlmcuhxhirdd', N'LESSON', N'P04', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wgnccnpxxlcsjtn', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wgultovtedqcrge', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'whatcrdpwerajnu', N'LESSON', N'P06', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'whhmxjeoggwbprf', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'whnwbpqiwnltpsn', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wiuymaegucjndup', N'LESSONS02', N'P01', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wjhecmztpcimjyo', N'LESSONS02', N'P04', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wjkjoepkgbbgqsb', N'Losson1', N'P04', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wjmcagztqepcokf', N'LESSON', N'P04', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wjqjjiunlbvxzsx', N'LESSON111111', N'P04', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wjrcxlusdkvaljo', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wjrkmtjppjodzkw', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wkaggzctdkduyop', N'LESSON', N'P05', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wkfptpxlplklrbt', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wkfwdgwhlobspjx', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wkgyfyefmehdfit', N'Losson1', N'P05', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wlqxlnyzsfznlyb', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wmthsdnibnudrlf', N'LESSONS02', N'P01', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wmtudflmoivjxgm', N'LESSONS02', N'P05', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wmvwuebsisgmkfn', N'LESSONS02', N'P05', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wmyeknzjicdciyc', N'Losson1', N'P05', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wnecoixxylmbksc', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wnjffjxqzhmcjez', N'Losson1', N'P05', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wnqgqdlzspiauyw', N'LESSONS02', N'P05', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wnttaujebqbpyzs', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wnwqgfuigmvzxdm', N'LESSON', N'P05', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wnzscdoxualynmn', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wocptuucbolmmrp', N'LESSONS02', N'P05', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wojymmkpxzuldan', N'LESSON04', N'P01', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wopccgikfjywxsn', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wozcpbfcppqtgwo', N'LESSON', N'P04', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wpgelalrbyetqhe', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wpiosfcaegynhdb', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wrckplnmcsaniij', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wreqjvaivfewynn', N'Losson1', N'P01', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wrptldqpppdoleb', N'LESSON111111', N'P04', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wsfowbtxlrxokhf', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wslhfyvuhmpecjd', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wtlouflrtlihrlk', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wtlzatmjkktcsqi', N'LESSON111111', N'P06', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wtogsumlptkzsrp', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
GO
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wtvmgemchbmoikd', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wtybmtxjpquwgkl', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wuiumrqgsfscypy', N'LESSON', N'P04', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wukmatudomxhgbl', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wulhrouqyftzfpk', N'LESSON', N'P04', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wutcelzzdhwugca', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wvciziydlfopvvf', N'LESSON', N'P05', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wvdcpmudsfvdxcq', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wxbgmephadedebh', N'LESSONS02', N'P04', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wxenxydlehezxzx', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wxksawnvphtgkcg', N'LESSONS02', N'P05', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wxmzkvkxvdxvcal', N'Losson1', N'P04', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wxrrwmsummyoedv', N'LESSON04', N'P04', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wymkiuytjawrdfy', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wzfmhatrgaokasi', N'LESSON04', N'P05', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wzlmceyumzibksf', N'LESSON111111', N'P05', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wznfqiyadjjewjw', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wzqeddoqlpfamri', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'wzsnhesnigwcxhl', N'Losson1', N'P06', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xaizlasjxbkvcqs', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xbpkmarpclihclm', N'Losson1', N'P05', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xbymunnzagtfnlm', N'Losson1', N'P05', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xchowuwmcdboxub', N'Losson1', N'P05', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xclkqgreextdlrr', N'LESSON111111', N'P05', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xcqcrfiaenqbnpu', N'LESSON', N'P04', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xczehebeyjafvsj', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xdazmwbwfagjrhn', N'LESSON04', N'P04', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xdfxjqbwhcnzwte', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xdidfczonlyyslv', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xdkfvdlsghmaisv', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xdkxgvwvujtxtrn', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xdowtrmmbpptjzz', N'LESSON', N'P04', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xejklhtaxmsivra', N'LESSON', N'P04', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xelyslvrlbytwxv', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xevealebjgcnbhu', N'LESSONS02', N'P05', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xewrqcqhhbrluwz', N'LESSON', N'P04', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xeykdzzofjiizjs', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xfssfizzpdanxjl', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xgcximcuikjxtiy', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xgmpmonpegsgfol', N'Losson1', N'P04', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xgxuaekbolltxti', N'LESSON', N'P06', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xhddyvelrejtogi', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xhipwiuqkidqrzf', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xioixuuhsbqlraa', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xiqixjtvzicivlg', N'LESSON', N'P04', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xitqjhfdsgpmdar', N'Losson1', N'P06', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xjhkkkyxzdhdqps', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xksdjbtoudavoow', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xlajibuxkaeklox', N'LESSON111111', N'P01', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xlasegxogfusovq', N'Losson1', N'P04', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xldjbqjraigbcle', N'LESSON111111', N'P05', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xlghmwslainkohx', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xlvabthbqfvrawh', N'LESSON111111', N'P01', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xmraknocvigcmhb', N'LESSON', N'P04', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xmrqcncbkctgbcg', N'LESSON04', N'P05', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xmywdtqwjjwhath', N'LESSON', N'P06', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xnjtyfxpmwkdrvb', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xnlkjgevetblraf', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xnmupjwcmkmspdc', N'Losson1', N'P06', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xnycwkrulbujiak', N'LESSONS02', N'P05', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xohnbrbbkyjvnfg', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xqhvpqznilvtiiq', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xqjivuadwabdkol', N'Losson1', N'P06', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xqrmtskiehfcuoe', N'LESSON04', N'P04', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xrbiqdzpsnxxxtj', N'LESSON', N'P04', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xrnncmrjjkpmgzy', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xrqdirfmaceylba', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xruiwstdwlfsule', N'LESSON04', N'P01', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xsktbttcdmunftf', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xsnuruggwiiquaf', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xtbacmfdhbadhtl', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xupejfiduhpvrxw', N'LESSON', N'P05', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xuranqkqcftxqrg', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xvfplkthfhhoevi', N'LESSONS02', N'P04', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xvvawvdjlfmqdpo', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xvzoxwyxlbhjgjw', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xwfprsgxivupibu', N'LESSONS02', N'P05', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xwpomkyafcegcgm', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xxdxhryrqydhivp', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xxgftswjqodxzmc', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xxkafwyurgqlayh', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xxnsastjoxjkoia', N'LESSONS02', N'P05', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xxoqfitilxwzgvt', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xxuvqcptppjeqca', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xxydipcaqeydcmf', N'LESSONS02', N'P04', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xxzgrsitscxxzgp', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xydgwidbpawqtyw', N'LESSON04', N'P05', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xyklrqyptaepcah', N'Losson1', N'P06', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xyosddilsfdqoay', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xznytiqujkixbye', N'LESSON', N'P04', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'xzxpxkboghsgnes', N'LESSON04', N'P04', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'yarcupkirejvlwp', N'LESSON111111', N'P05', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'yaxszmttnwtxaea', N'Losson1', N'P06', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ybbmifbdiybkaiq', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ybokelrigvvkbxp', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ycmddjrjwgugxhi', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ydapanucihjrdzn', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'yddnbkknevsgfxg', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ydyxshvvkvqazis', N'Losson1', N'P04', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'yefypwpatceyjan', N'LESSON', N'P01', 20, 0, N'Chart writting')
GO
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'yehmzdnohlxwibx', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'yewtbmsymleekbt', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'yfedgaxjlhkfxyt', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'yfglqecmxparcyz', N'LESSON', N'P04', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'yfudxsdwteagbrk', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'yfwbskozjkemxbi', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'yfzcvfuorhlhwqw', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ygegmhuhsdlhvct', N'Losson1', N'P04', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'yghvwgttggkybbw', N'LESSON111111', N'P06', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ygpenhzbsyiatow', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'yhjirdlfnhioggk', N'LESSON', N'P06', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'yhudwyctilpzsui', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'yhykfggcuszgtlv', N'Losson1', N'P06', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'yihhexppfkrjipj', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'yiobptupsdogqgc', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'yiujfkumzcnxpfw', N'LESSONS02', N'P05', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'yiwxizwjgeemfsi', N'LESSON04', N'P01', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'yjcolxxheedrwzg', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'yjitkinpdefrmzs', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ykcdfecgmyzbsxk', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ykhvuzdbdzhapsx', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'yknwdvxwiystqwo', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ykzrqtxzobccklh', N'LESSONS02', N'P04', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ylqgklmergnjwjs', N'LESSON', N'P05', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ylvccuygyvwinwq', N'LESSON', N'P06', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ymkbrdsfrtywcyc', N'Losson1', N'P04', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ymsenygtzyuqide', N'LESSONS02', N'P04', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ynapntcxswkdioy', N'Losson1', N'P01', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ynbrzbanvcizmbc', N'Losson1', N'P06', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ynjvtowqpwxoyih', N'Losson1', N'P04', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ynzvjbbflffzmzu', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'yoesggoylumifhf', N'LESSONS02', N'P05', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'yofhclqfaxyhqgv', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'yofnkncwuyrtnap', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'yorjayzqugnwzke', N'LESSONS02', N'P04', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ypkotivryycmneg', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'yptsqgfwgffkyez', N'LESSON04', N'P01', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ypyaewaosgmcqrd', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'yqdbexvryzyzmqa', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'yqdoosudvkxfaje', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'yqmsdkplfiwuqbp', N'LESSON111111', N'P01', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'yqwbvytvsqffqyw', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ysjrbjocvkkruog', N'LESSONS02', N'P06', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ysnqzmrvgnhbykz', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'yspbqlxlkgxpwtw', N'LESSON', N'P06', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ysppsecpdnwuopt', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ytgsvmqrxflzuya', N'LESSON111111', N'P05', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ytqbwtyvszpamzn', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ytqkgudrwfpevnr', N'LESSON04', N'P01', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ytypvgovetgkpxn', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'yurtkzuphzepfwh', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'yvaypgcupchckqw', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'yvfdorsbndjczqh', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'yvwstpxhxmloecs', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ywajfdyptczlfca', N'LESSON111111', N'P01', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ywffcaijzdlgtqp', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ywhrsdnseammqzu', N'LESSON04', N'P06', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ywpyxgoxqvksryv', N'LESSONS02', N'P01', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ywuhrpcgzwzhiqp', N'LESSONS02', N'P05', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ywxctcclzagmxdx', N'LESSON', N'P05', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'yxjcrlucupqmsdv', N'Losson1', N'P06', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'yxnouzpeyrbfzyl', N'LESSON04', N'P05', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'yxrhdkccxyxzskr', N'LESSON04', N'P01', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'yybyombrejwvbtu', N'LESSONS02', N'P05', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'yyetbvxtcawqffu', N'Losson1', N'P06', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'yyucytsgushpgcq', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'yzbfwytjvautxei', N'Losson1', N'P06', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'yzpmzmskxzpidey', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'zapneifpcvidwth', N'Losson1', N'P04', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'zbliehqmsebohja', N'LESSON', N'P01', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'zbveudosmfkupij', N'LESSON04', N'P01', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'zbviryavutgyhlz', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'zcdkapfnrwsgwve', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'zchwycvrjbmdyob', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'zcpsrixmxdbjnah', N'LESSONS02', N'P04', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'zctfpgrhobmdpse', N'LESSON111111', N'P04', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'zdbaxqntorbvtxi', N'LESSONS02', N'P05', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'zdcwbxasxvgfbqr', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'zdhenklowafhnqi', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'zdvqfxxhsgrwcpj', N'LESSONS02', N'P05', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'zeirnsxbzmazgou', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'zeprxqzwfwttdhy', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'zgaqducrxqaowaq', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'zgetfdugfsjjdtv', N'LESSONS02', N'P05', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'zgetpqcwlctmnka', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'zgmkhwwhndlckiy', N'Losson1', N'P05', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'zhrxehddkuctjrc', N'LESSON', N'P04', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'zhsqsldicecwuht', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'zidqfjovkcorhif', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ziyitwdzkxpqvjo', N'LESSON', N'P04', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'zjldppcdtycexzv', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'zjvfjpkxemuzkbk', N'Losson1', N'P06', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'zlipyobevtkqseg', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'zllvkllyzzsrpxo', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'zmbbgpxtndfhqpp', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'zmjthqvycdeyuap', N'LESSONS02', N'P01', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'zmmtegskjdyzoot', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'zmvlyabwtampqci', N'LESSON', N'P05', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'zmxbqimmiqznjfq', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'znhtibxlwwsbqqk', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
GO
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'znjadnvdcfdanib', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'znmbuohhvbrccqb', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'znrkpdrcxowbuss', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'zntrbvkuqcmwacg', N'LESSON04', N'P05', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'zolpsdbbbzpfkfl', N'Losson1', N'P01', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'zpeuhxyjxeozogd', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'zpscazzcswesjbr', N'LESSON', N'P05', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'zptckylrducrggv', N'LESSONS02', N'P06', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'zqewnevifapbmke', N'Losson1', N'P05', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'zqncazeiqvxeqzo', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'zqvulxlvdcisbbo', N'LESSON04', N'P06', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'zrdquhihdsxkggs', N'Losson1', N'P06', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'zrfhysjtcfkpghz', N'LESSONS02', N'P01', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'zrhlxdutsdossjh', N'Losson1', N'P05', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'zrjtjbfclbbwzys', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'zrtmfhlqdtbixgy', N'LESSONS02', N'P06', 20, 3, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'zrwblxdxgipuybc', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'zsmzcmukoqsxwxv', N'LESSON04', N'P01', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'zstdksfkirfvfkl', N'LESSON', N'P01', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'zsypgupzgqyemjt', N'Losson1', N'P04', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ztbmxlweoeyslov', N'LESSONS02', N'P04', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ztigjwumoymflnx', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'ztpdtunbeevgtvc', N'Losson1', N'P05', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'zucenuxiraikngr', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'zucodrtdvazujsv', N'Losson1', N'P01', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'zuonbggaqgerjzw', N'LESSON', N'P05', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'zvagzxbqlgxjhya', N'Losson1', N'P05', 20, 0, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'zvhfnutkxttikgo', N'LESSONS02', N'P01', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'zvmmesyxvuxmhez', N'LESSON', N'P04', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'zvpmfhrnsbwhxui', N'LESSON04', N'P05', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'zvqwlinfecrdnqd', N'Losson1', N'P04', 20, 3, N'Pinocchio Reading')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'zvtmbyyqawyivam', N'LESSON', N'P04', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'zwoqousrcerukbi', N'LESSON111111', N'P04', 20, 3, N'testdownload')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'zxwivhovxqixksl', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'zyclzisowthqgpw', N'LESSON', N'P01', 20, 3, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'zyilumxrbsbhpqs', N'LESSON04', N'P05', 20, 3, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'zyklxxmtfavnqhq', N'LESSONS02', N'P06', 20, 0, N'Hobbies Speaking')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'zyxufgeluoqoxju', N'LESSON', N'P06', 20, 0, N'Chart writting')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'zzgpffgcxxwnryg', N'LESSON04', N'P01', 20, 0, N'Donal Trump Listening')
INSERT [dbo].[Class] ([ClassID], [LessonID], [PeopleID], [QuantityMAX], [QuantityMIN], [ClassName]) VALUES (N'zzqqbzmwitwtfnk', N'LESSON04', N'P04', 20, 0, N'Donal Trump Listening')
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([comment_id], [content_id], [comment_content], [comment_date], [PeopleID], [Name], [Image]) VALUES (25, 5, N'asdasdadadasd', CAST(N'2019-10-28T14:43:54.683' AS DateTime), N'P01', N'Quân', N'/Uploads/images/ferris-wheel.jpg')
INSERT [dbo].[Comments] ([comment_id], [content_id], [comment_content], [comment_date], [PeopleID], [Name], [Image]) VALUES (26, 5, N'123123123', CAST(N'2019-10-28T14:43:59.437' AS DateTime), N'P01', N'Quân', N'/Uploads/images/ferris-wheel.jpg')
INSERT [dbo].[Comments] ([comment_id], [content_id], [comment_content], [comment_date], [PeopleID], [Name], [Image]) VALUES (27, 4, N'1111', CAST(N'2019-10-28T14:44:10.423' AS DateTime), N'P01', N'Quân', N'/Uploads/images/ferris-wheel.jpg')
INSERT [dbo].[Comments] ([comment_id], [content_id], [comment_content], [comment_date], [PeopleID], [Name], [Image]) VALUES (28, 3, N'asdasd', CAST(N'2019-10-28T14:49:05.297' AS DateTime), N'P01', N'Quân', N'/Uploads/images/ferris-wheel.jpg')
INSERT [dbo].[Comments] ([comment_id], [content_id], [comment_content], [comment_date], [PeopleID], [Name], [Image]) VALUES (29, 5, N'sadasd', CAST(N'2019-10-28T17:22:22.640' AS DateTime), N'P01', N'Quân', N'/Uploads/images/ferris-wheel.jpg')
INSERT [dbo].[Comments] ([comment_id], [content_id], [comment_content], [comment_date], [PeopleID], [Name], [Image]) VALUES (30, 4, N'hkl', CAST(N'2019-10-28T18:09:56.623' AS DateTime), N'P01', N'Quân', N'/Uploads/images/ferris-wheel.jpg')
INSERT [dbo].[Comments] ([comment_id], [content_id], [comment_content], [comment_date], [PeopleID], [Name], [Image]) VALUES (31, 5, N'qweqwe', CAST(N'2019-10-28T19:05:20.217' AS DateTime), N'P01', N'Quân', N'/Uploads/images/ferris-wheel.jpg')
INSERT [dbo].[Comments] ([comment_id], [content_id], [comment_content], [comment_date], [PeopleID], [Name], [Image]) VALUES (32, 5, N'xsxsx', CAST(N'2019-10-29T17:25:05.057' AS DateTime), N'P01', N'Quân', N'/Uploads/images/ferris-wheel.jpg')
INSERT [dbo].[Comments] ([comment_id], [content_id], [comment_content], [comment_date], [PeopleID], [Name], [Image]) VALUES (33, 3, N'czcxz', CAST(N'2019-10-29T17:25:22.100' AS DateTime), N'P01', N'Quân', N'/Uploads/images/ferris-wheel.jpg')
INSERT [dbo].[Comments] ([comment_id], [content_id], [comment_content], [comment_date], [PeopleID], [Name], [Image]) VALUES (34, 3, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas fringilla pretium nisi, non dapibus diam rhoncus sed. Vivamus vel nunc venenatis, rutrum felis at, euismod ligula. Aenean vulputate luctus ultricies. Nulla imperdiet ac arcu sit amet vestibulum. Nunc auctor cursus lectus, vel cursus dolor fringilla eget. Vestibulum porta nunc vitae urna tempor, eget aliquam purus hendrerit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec aliquet eu purus accumsan dignissim. Nulla nisi nulla, bibendum ut rhoncus nec, eleifend quis arcu.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas fringilla pretium nisi, non dapibus diam rhoncus sed. Vivamus vel nunc venenatis, rutrum felis at, euismod ligula. Aenean vulputate luctus ultricies. Nulla imperdiet ac arcu sit amet vestibulum. Nunc auctor cursus lectus, vel cursus dolor fringilla eget. Vestibulum porta nunc vitae urna tempor, eget aliquam purus hendrerit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec aliquet eu purus accumsan dignissim. Nulla nisi nulla, bibendum ut rhoncus nec, eleifend quis arcu.', CAST(N'2019-10-29T17:33:07.283' AS DateTime), N'P01', N'Quân', N'/Uploads/images/ferris-wheel.jpg')
INSERT [dbo].[Comments] ([comment_id], [content_id], [comment_content], [comment_date], [PeopleID], [Name], [Image]) VALUES (35, 5, N'asdadadasdLorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas fringilla pretium nisi, non dapibus diam rhoncus sed. Vivamus vel nunc venenatis, rutrum felis at, euismod ligula. Aenean vulputate luctus ultricies. Nulla imperdiet ac arcu sit amet vestibulum. Nunc auctor cursus lectus, vel cursus dolor fringilla eget. Vestibulum porta nunc vitae urna tempor, eget aliquam purus hendrerit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec aliquet eu purus accumsan dignissim. Nulla nisi nulla, bibendum ut rhoncus nec, eleifend quis arcu.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas fringilla pretium nisi, non dapibus diam rhoncus sed. Vivamus vel nunc venenatis, rutrum felis at, euismod ligula. Aenean vulputate luctus ultricies. Nulla imperdiet ac arcu sit amet vestibulum. Nunc auctor cursus lectus, vel cursus dolor fringilla eget. Vestibulum porta nunc vitae urna tempor, eget aliquam purus hendrerit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec aliquet eu purus accumsan dignissim. Nulla nisi nulla, bibendum ut rhoncus nec, eleifend quis arcu.', CAST(N'2019-10-29T17:40:56.537' AS DateTime), N'P01', N'Quân', N'/Uploads/images/ferris-wheel.jpg')
INSERT [dbo].[Comments] ([comment_id], [content_id], [comment_content], [comment_date], [PeopleID], [Name], [Image]) VALUES (36, 4, N'edfsdfsfd', CAST(N'2019-11-06T16:50:55.873' AS DateTime), N'P01', N'Quân', N'/Uploads/images/ferris-wheel.jpg')
INSERT [dbo].[Comments] ([comment_id], [content_id], [comment_content], [comment_date], [PeopleID], [Name], [Image]) VALUES (10036, 4, N'asdsad', CAST(N'2019-11-12T12:46:46.820' AS DateTime), N'P01', N'Quân', N'/Uploads/images/ferris-wheel.jpg')
INSERT [dbo].[Comments] ([comment_id], [content_id], [comment_content], [comment_date], [PeopleID], [Name], [Image]) VALUES (10037, 1, N'qweqwe', CAST(N'2019-11-12T12:50:06.123' AS DateTime), N'P02', N'Nhi', N'/Uploads/images/featured-1.jpg')
INSERT [dbo].[Comments] ([comment_id], [content_id], [comment_content], [comment_date], [PeopleID], [Name], [Image]) VALUES (10038, 1, N'asdf', CAST(N'2019-11-12T12:56:20.317' AS DateTime), N'P02', N'Nhi', N'/Uploads/images/featured-1.jpg')
INSERT [dbo].[Comments] ([comment_id], [content_id], [comment_content], [comment_date], [PeopleID], [Name], [Image]) VALUES (10039, 4, N'asd', CAST(N'2019-11-12T13:13:09.927' AS DateTime), N'P02', N'Nhi', N'/Uploads/images/featured-1.jpg')
INSERT [dbo].[Comments] ([comment_id], [content_id], [comment_content], [comment_date], [PeopleID], [Name], [Image]) VALUES (10040, 5, N'This post really helpful!', CAST(N'2019-11-13T18:42:22.750' AS DateTime), N'P04', N'Lộc', NULL)
INSERT [dbo].[Comments] ([comment_id], [content_id], [comment_content], [comment_date], [PeopleID], [Name], [Image]) VALUES (10041, 5, N'I love this post!!!', CAST(N'2019-11-22T09:02:49.773' AS DateTime), N'P02', N'Nhi', N'/Uploads/images/featured-1.jpg')
SET IDENTITY_INSERT [dbo].[Comments] OFF
SET IDENTITY_INSERT [dbo].[Content] ON 

INSERT [dbo].[Content] ([content_id], [content_title], [content_post], [status], [date_post], [PeopleID], [TopicPostID], [RepresentImage]) VALUES (1, N'HƠN 400 BẠN TEEN VUS HÀO HỨNG TRANG BỊ KỸ NĂNG SƠ CẤP CỨU TỪ CHUYÊN GIA QUỐC TẾ', N'<p><strong>Bị rắn cắn th&igrave; bạn sẽ lấy miệng h&uacute;t nọc độc như phim? Gặp vết thương hở th&igrave; lấy cồn s&aacute;t tr&ugrave;ng? Chảy m&aacute;u mũi th&igrave; ngửa mặt l&ecirc;n trời?...Những c&aacute;ch xử l&yacute; m&agrave; kh&aacute; nhiều người đinh ninh l&agrave; đ&uacute;ng tr&ecirc;n h&oacute;a ra lại l&agrave; lầm tưởng. V&agrave; c&ograve;n rất nhiều kiến thức bổ &iacute;ch kh&aacute;c đ&atilde; được giải đ&aacute;p tại buổi huấn luyện Kỹ năng sơ cấp cứu diễn ra v&agrave;o cuối tuần qua tại VUS Quang Trung v&agrave; VUS Nguyễn Ch&iacute; Thanh.</strong></p>

<p>Dưới sự hướng&nbsp;dẫn của Mr. Tony Coffey (chuy&ecirc;n gia sơ cấp cứu h&agrave;ng đầu đến từ Australia) v&agrave; c&ocirc; Trang Jena Nguyễn (s&aacute;ng lập tổ chức Survival Skills Vietnam), c&aacute;c em học vi&ecirc;n VUS đ&atilde; được thực h&agrave;nh kỹ năng để xử l&yacute; hiệu quả c&aacute;c sự cố m&agrave; tuổi teen thường gặp như đuối nước, điện giật, bị ch&oacute; cắn,...</p>

<p><img alt="" src="https://vus.edu.vn/media/305068/yuu09703.jpg?width=800&amp;height=450.01676164934634" /></p>

<p>Chưa hết, c&aacute;c em c&ograve;n h&agrave;o hứng học c&aacute;ch để sơ cứu gi&uacute;p người kh&aacute;c như cầm m&aacute;u, xử l&yacute; c&aacute;c ca bất tỉnh, ngưng tim, xử l&yacute; h&oacute;c dị vật khi ăn, xử l&yacute; vết thương,&hellip; Ngo&agrave;i ra, c&aacute;c em c&ograve;n học kỹ năng tho&aacute;t hiểm khi c&oacute; sự cố hỏa hoạn. C&aacute;c bước sơ cứu được thầy Tony Coffey v&agrave; c&ocirc; Trang Jena Nguyễn hướng dẫn tỉ mỉ qua c&aacute;c m&ocirc; h&igrave;nh v&agrave; cho c&aacute;c em thực h&agrave;nh tại chỗ.</p>

<p>Em Sỹ Hiếu, học vi&ecirc;n cơ sở VUS V&otilde; Thị S&aacute;u h&agrave;o hứng chia sẻ: &ldquo;Sau buổi học n&agrave;y, con nhận ra trước giờ m&igrave;nh đ&atilde; hiểu sai về một số c&aacute;ch sơ cứu cơ bản. Thầy c&ocirc; hướng dẫn tụi con rất kỹ n&ecirc;n con tin l&agrave; nếu rơi v&agrave;o trường hợp nguy hiểm tương tự th&igrave; bản th&acirc;n con c&oacute; thể xử l&yacute; được v&agrave; gi&uacute;p đỡ mọi người&rdquo;.</p>

<p><img alt="" src="https://vus.edu.vn/media/305072/dscf0872.jpg?width=800&amp;height=533.3333333333334" /></p>

<p>Buổi hội thảo cũng l&agrave; dịp để thể hiện gi&aacute; trị Caring m&agrave; VUS đang hướng tới. Đ&oacute; kh&ocirc;ng chỉ l&agrave; việc dạy học sinh trang bị kỹ năng sinh tồn m&agrave; c&ograve;n dạy c&aacute;c em c&oacute; tr&aacute;ch nhiệm với ch&iacute;nh m&igrave;nh v&agrave; x&atilde; hội th&ocirc;ng qua qua việc quan t&acirc;m v&agrave; cứu gi&uacute;p người xung quanh m&igrave;nh.</p>
', N'Enable', CAST(N'2019-10-28T00:20:09.640' AS DateTime), N'P01', N'TP01', N'/Uploads/images/VUS.jpg')
INSERT [dbo].[Content] ([content_id], [content_title], [content_post], [status], [date_post], [PeopleID], [TopicPostID], [RepresentImage]) VALUES (2, N'KHÁM PHÁ VŨ TRỤ VUI HỌC CÙNG SAMSUNG, POPS KIDS VÀ VUS - TUẦN 3', N'<p><strong>Hai tuần qua, c&ugrave;ng với Gấu P&ocirc;, c&aacute;c bạn nhỏ đ&atilde; được kh&aacute;m ph&aacute; hai chủ đề rất gần gũi v&agrave; đ&aacute;ng y&ecirc;u trong lớp học tiếng Anh của Anh văn Hội Việt Mỹ VUS l&agrave; &ldquo;Animals&rdquo; (Động vật) v&agrave; &ldquo;Clothes&rdquo; (Quần &aacute;o).</strong></p>

<p>Cuối tuần vừa rồi, tại Samsung 68, &ldquo;Vũ trụ vui học&rdquo; - một chương tr&igrave;nh d&agrave;nh ri&ecirc;ng c&aacute;c bạn nhỏ do Samsung phối hợp c&ugrave;ng Pops Kids v&agrave; Anh văn Hội Việt Mỹ VUS đ&atilde; diễn ra tuần thứ 3. C&aacute;c bạn được chụp h&igrave;nh, vui với Gấu P&ocirc;, nhận c&aacute;c qu&agrave; tặng xinh xắn v&agrave; tương t&aacute;c với gi&aacute;o vi&ecirc;n nước ngo&agrave;i, thật l&agrave; th&uacute; vị phải kh&ocirc;ng bố mẹ?</p>

<p><img alt="" src="https://vus.edu.vn/media/305062/1h8a1316.jpg?width=800&amp;height=533.399063347301" /></p>

<p><img alt="" src="https://vus.edu.vn/media/305063/1h8a0969.jpg?width=800&amp;height=533.1386861313869" /></p>

<p>Chương tr&igrave;nh gi&uacute;p c&aacute;c b&eacute; c&oacute; những trải nghiệm c&ocirc;ng nghệ ph&ugrave; hợp, tiếp thu những kiến thức mới mẻ một c&aacute;ch sinh động v&agrave; hấp dẫn hơn. Chủ đề của tuần n&agrave;y v&ocirc; c&ugrave;ng quen thuộc v&agrave; gần gũi với c&aacute;c b&eacute;, &ldquo;Toys&rdquo; - Đồ chơi, m&oacute;n đồ m&agrave; b&eacute; n&agrave;o cũng c&oacute;, cũng y&ecirc;u th&iacute;ch. C&aacute;c b&eacute; được thầy gi&aacute;o nước ngo&agrave;i hướng dẫn ph&aacute;t &acirc;m cho chuẩn hơn, đi k&egrave;m l&agrave; những hoạt động trực quan gi&uacute;p b&eacute; nhớ từ tốt v&agrave; l&acirc;u hơn.</p>

<p><img alt="" src="https://vus.edu.vn/media/305064/1h8a0797.jpg?width=800&amp;height=533.3333333333334" /></p>

<p>Vẫn c&ograve;n một chủ đề đang chờ c&aacute;c b&eacute; kh&aacute;m ph&aacute; v&agrave;o ng&agrave;y Chủ nhật 20/10 sắp tới. Bố mẹ nhớ cho b&eacute; đến tham gia nh&eacute;!</p>

<p>------</p>

<p>🥁 &ldquo;We Learn We Play&rdquo; l&agrave; một dự &aacute;n của VUS hợp t&aacute;c c&ugrave;ng POPS Kids v&agrave; Samsung.&nbsp;</p>

<p>🎺 Đ&acirc;y l&agrave; một hoạt động nằm trong chuỗi c&aacute;c hoạt động &yacute; nghĩa của VUS nhằm củng cố th&ocirc;ng điệp Lớn C&ugrave;ng Con, gi&uacute;p bố mẹ đồng h&agrave;nh c&ugrave;ng con tr&ecirc;n chặng đường chinh phục Anh ngữ. &ldquo;We Learn We Play&rdquo; l&agrave; một chương tr&igrave;nh ho&agrave;n to&agrave;n mới d&agrave;nh cho trẻ em từ 6-11 tuổi, được sản xuất bởi POPS Kids với sự cố vấn chuy&ecirc;n m&ocirc;n từ VUS c&ugrave;ng sự tham gia của c&aacute;c gi&aacute;o vi&ecirc;n nước ngo&agrave;i của VUS v&agrave; được ph&aacute;t tr&ecirc;n ứng dụng POPS Kids TV độc quyền tr&ecirc;n hệ thống tivi Samsung. Bố mẹ c&oacute; thể ho&agrave;n to&agrave;n y&ecirc;n t&acirc;m &ocirc;n luyện v&agrave; học c&ugrave;ng con tại nh&agrave; với những kiến thức Anh ngữ b&agrave;i bản, đồng thời cũng hết sức th&uacute; vị v&agrave; sống động.</p>
', N'Enable', CAST(N'2019-10-28T00:20:40.687' AS DateTime), N'P01', N'TP01', N'/Uploads/images/pic-content.jpg')
INSERT [dbo].[Content] ([content_id], [content_title], [content_post], [status], [date_post], [PeopleID], [TopicPostID], [RepresentImage]) VALUES (3, N'HÃY SẴN SÀNG CHÀO ĐÓN IELTS BOUNTY HUNTERS MÙA 4', N'<p><strong>Bạn đang chuẩn bị chinh phục chứng chỉ IELTS? Bạn muốn khẳng định bản lĩnh của m&igrave;nh? Bạn tự tin với kỹ năng tiếng Anh v&agrave; muốn gi&agrave;nh thưởng lớn? Đừng bỏ lỡ chương tr&igrave;nh IELTS Bounty Hunters m&ugrave;a 4 đang khởi động đầy hấp dẫn!</strong></p>

<p>🔸 IELTS Bounty Hunters kh&ocirc;ng chỉ t&igrave;m kiếm c&aacute;c t&agrave;i năng IELTS m&agrave; c&ograve;n l&agrave; chương tr&igrave;nh t&ocirc;n vinh những gi&aacute; trị gia đ&igrave;nh v&agrave; &yacute; nghĩa. Với những ai chưa biết về&nbsp;<a href="https://www.facebook.com/hashtag/ielts_bounty_hunters?source=feed_text&amp;epa=HASHTAG&amp;__xts__%5B0%5D=68.ARAmD-bl6EifpJU2HniuPsXUstKqGESu359PTdLeP0oW7OktEFLmx9Ek64iU--cspCUcRZFuwnXMjJpgLqPaW29FcH7_McovqgbLLWWyBO-qO0kxrvD5YmcWq3FLZjVHKQ_KswSKC8VEezb-Eikybf8PL8C54Ft97d_0m2J9Ih24kHTQ99pM8vsEGy4h38SRFzusNtg4hwV2xUkWqqCX-teHfxyfxZwIoUAY4Cy91O_Rk23Vx6c_SViql6ZpixFamNpp8GvSKyvS98AbXaPHrvcHK3YaRlPkJftJksmjcuML_yuvoIvzcqX7Y6YJE6QoMixw6gpv6ywyzN6cqj6TuF3uJbux&amp;__tn__=%2ANK-R">#IELTS_Bounty_Hunters</a>, đ&acirc;y l&agrave; chương tr&igrave;nh do VUS tổ chức nhằm tạo động lực học tập v&agrave; vinh danh c&aacute;c học vi&ecirc;n VUS đạt điểm IELTS xuất sắc.</p>

<p>Để khen thưởng những nỗ lực học tập của c&aacute;c bạn, VUS mang đến những giải thưởng si&ecirc;u hấp dẫn theo tinh thần &ldquo;Điểm c&agrave;ng cao, thưởng c&agrave;ng lớn&rdquo;:</p>

<p>🔥 Điểm IELTS 7.0 &ndash; 7.5, bạn sẽ nhận được học bổng 5.000.000 đồng</p>

<p>🔥 Điểm IELTS 8.0, bạn sẽ nhận được học bổng 10.000.000 đồng</p>

<p>🔥 Điểm IELTS 8.5 &ndash; 9.0, bạn sẽ nhận được học bổng 20.000.000 đồng</p>

<p>Qu&aacute; hấp dẫn phải kh&ocirc;ng n&agrave;o? C&ograve;n chần chừ g&igrave; kh&ocirc;ng tham gia ngay chương tr&igrave;nh n&agrave;y hỡi c&aacute;c VUS-ers ơi! Chương tr&igrave;nh &aacute;p dụng cho học vi&ecirc;n đang học tại VUS v&agrave; đăng k&yacute; thi IELTS th&ocirc;ng qua VUS, c&oacute; c&aacute;c ng&agrave;y thi IELTS từ 07/09/2019 &ndash; 14/12/2019.<br />
<img alt="" src="https://vus.edu.vn/media/305051/facebook-1200x628px.jpg?width=800&amp;height=418.88" /></p>

<p>Thể lệ chi tiết của chương tr&igrave;nh:</p>

<ul>
	<li>Chương tr&igrave;nh &aacute;p dụng cho học vi&ecirc;n&nbsp;<strong>đang học tại VUS</strong>v&agrave;&nbsp;<strong>đăng k&yacute; thi IELTS th&ocirc;ng qua VUS</strong>, c&oacute; c&aacute;c ng&agrave;y thi IELTS từ&nbsp;<strong>07/09/2019 &ndash; 14/12/2019.</strong></li>
	<li>HV đạt điểm thi từ&nbsp;<strong>0 trở l&ecirc;n</strong>sẽ nhận được học bổng tiền mặt từ VUS.</li>
	<li>Chỉ &aacute;p dụng cho&nbsp;<strong>học vi&ecirc;n đang học tại VUS&nbsp;</strong>trong thời gian chương tr&igrave;nh.</li>
	<li>Trường hợp học vi&ecirc;n c&oacute; thời gian ngưng học tại VUS nằm ngo&agrave;i khung thời gian chương tr&igrave;nh, học vi&ecirc;n vẫn được tham gia với điều kiện lớp học cuối c&ugrave;ng của học vi&ecirc;n phải l&agrave; lớp&nbsp;<strong>A hoặc IL7.B</strong>. V&agrave; thời gian học vi&ecirc;n tạm ngưng tại VUS kh&ocirc;ng được qu&aacute; 02 th&aacute;ng (10 tuần) so với thời gian bắt đầu chương tr&igrave;nh.</li>
	<li>Học vi&ecirc;n đ&atilde; được trao thưởng trong đợt trước, vẫn được tham gia trong c&aacute;c lần sau, với điều kiện đ&aacute;p ứng được c&aacute;c y&ecirc;u cầu n&ecirc;u tr&ecirc;n (học vi&ecirc;n đang học tại VUS) v&agrave; điểm thi lần sau phải cao hơn lần trước.</li>
	<li>01 học vi&ecirc;n sẽ được &aacute;p dụng 01 lần trao thưởng ở mức điểm thi cao nhất (Trường hợp Học vi&ecirc;n thi nhiều lần) trong thời gian chương tr&igrave;nh.</li>
	<li>Học vi&ecirc;n đang học tại VUS nhưng kh&ocirc;ng đăng k&yacute; thi IELTS th&ocirc;ng qua VUS sẽ kh&ocirc;ng được tham gia chương tr&igrave;nh.</li>
	<li>Chương tr&igrave;nh kh&ocirc;ng &aacute;p dụng cho c&aacute;n bộ, nh&acirc;n vi&ecirc;n đang l&agrave;m việc tại VUS.</li>
	<li>VUS c&oacute; quyền sử dụng th&ocirc;ng tin điểm số v&agrave; h&igrave;nh ảnh của học vi&ecirc;n cho c&aacute;c c&ocirc;ng t&aacute;c truyền th&ocirc;ng.</li>
</ul>
', N'Slide', CAST(N'2019-10-28T00:21:30.277' AS DateTime), N'P01', N'TP01', N'/Uploads/images/IEL.jpg')
INSERT [dbo].[Content] ([content_id], [content_title], [content_post], [status], [date_post], [PeopleID], [TopicPostID], [RepresentImage]) VALUES (4, N'CUỘC THI ẢNH “MY FAVORITE TEACHER 2019”', N'<p><strong>Ng&agrave;y 20/11 sắp tới, bạn c&oacute; muốn gửi tặng m&oacute;n qu&agrave; bất ngờ tới thầy c&ocirc; VUS m&agrave; bạn lu&ocirc;n biết ơn v&agrave; ghi dấu trong tim? Tham gia ngay cuộc thi ảnh &quot;My Favorite Teacher 2019&quot; ngay nh&eacute;!</strong></p>

<p>&nbsp;</p>

<p><strong>ĐỐI TƯỢNG THAM DỰ</strong><br />
Học vi&ecirc;n v&agrave; phụ huynh c&oacute; con em đ&atilde; v&agrave; đang theo học tại c&aacute;c trung t&acirc;m VUS tr&ecirc;n to&agrave;n quốc.</p>

<p><strong>THỜI GIAN</strong></p>

<ul>
	<li>Từ 15/10 đến 17/11/2019:&nbsp;Gửi b&agrave;i dự thi về cho Ban tổ chức (BTC)</li>
	<li>20/11/2019:&nbsp;C&ocirc;ng bố kết quả tr&ecirc;n website &amp; fanpage VUS</li>
	<li>Từ 1/12 đến 15/12/2019:&nbsp;Người chiến thắng nhận giải tại c&aacute;c cơ sở VUS&nbsp;<br />
	&nbsp;</li>
</ul>

<p><strong>THỂ LỆ CỰC KỲ ĐƠN GIẢN</strong></p>

<ul>
	<li>C&aacute; nh&acirc;n học vi&ecirc;n/phụ huynh hoặc tập thể lớp VUS c&ugrave;ng chụp h&igrave;nh với gi&aacute;o vi&ecirc;n VUS m&igrave;nh y&ecirc;u mến.</li>
	<li>Học vi&ecirc;n gửi h&igrave;nh chụp k&egrave;m chia sẻ suy nghĩ, kỷ niệm đ&aacute;ng nhớ v&agrave; lời ch&uacute;c gửi tới gi&aacute;o vi&ecirc;n y&ecirc;u th&iacute;ch về cho Ban tổ chức dưới 1 trong 2 h&igrave;nh thức:<br />
	Inbox v&agrave;o fanpage VUS hoặc email:&nbsp;vus.theenglishcenter@gmail.com</li>
</ul>

<ul>
	<li>Ti&ecirc;u đề dự thi đặt theo cấu tr&uacute;c: [MY FAVORITE TEACHER &ndash; HỌ T&Ecirc;N NGƯỜI THAM DỰ &ndash; SỐ ĐIỆN THOẠI &ndash; CƠ SỞ VUS ĐANG HỌC]<br />
	V&iacute; dụ: [MY FAVORITE TEACHER &ndash; NGUYỄN VĂN A &ndash; 0987 XXX XXX &ndash; VUS NGUYỄN CH&Iacute; THANH]</li>
</ul>

<ul>
	<li>B&agrave;i dự thi sẽ được BTC đăng tải trong album &ldquo;My Favorite Teacher 2019&rdquo; tại Fanpage VUS. Người tham dự vận động sự tương t&aacute;c ủng hộ của bạn b&egrave; v&agrave; người th&acirc;n tr&ecirc;n b&agrave;i dự thi của m&igrave;nh.<br />
	&nbsp;</li>
</ul>

<p><strong>CƠ CẤU GIẢI THƯỞNG</strong></p>

<p>Ban tổ chức sẽ chọn ra 15 tấm h&igrave;nh đ&uacute;ng y&ecirc;u cầu v&agrave; với ti&ecirc;u ch&iacute; chấm giải như sau:</p>

<ul>
	<li>70% d&agrave;nh cho nội dung c&acirc;u chuyện/chia sẻ &yacute; nghĩa, đ&aacute;ng nhớ hoặc vui nhộn với gi&aacute;o vi&ecirc;n y&ecirc;u qu&yacute; của bạn.</li>
	<li>30% điểm d&agrave;nh cho lượt tương t&aacute;c (like, share, comment) - tương t&aacute;c c&agrave;ng cao c&agrave;ng c&oacute; cơ hội tr&uacute;ng giải</li>
</ul>

<p>Giải thưởng bao gồm</p>

<ul>
	<li>1 Giải Nhất: Voucher mua sắm trị gi&aacute; 2.000.000 đồng.</li>
	<li>2 Giải Nh&igrave;: Mỗi giải l&agrave; một Voucher mua sắm trị gi&aacute; 1.000.000 đồng.</li>
	<li>2 Giải Ba: Mỗi giải l&agrave; một Voucher mua sắm trị gi&aacute; 500.000 đồng.</li>
	<li>10 Giải Khuyến kh&iacute;ch: Mỗi giải l&agrave; một cặp v&eacute; xem phim trị gi&aacute; 200.000 đồng.<br />
	&nbsp;</li>
</ul>

<p><strong>QUY ĐỊNH VỀ B&Agrave;I DỰ THI</strong></p>

<ul>
	<li>H&igrave;nh chụp gi&aacute;o vi&ecirc;n phải l&agrave; gi&aacute;o vi&ecirc;n đang tham gia giảng dạy tại hệ thống Anh văn Hội Việt Mỹ VUS.</li>
	<li>H&igrave;nh chụp phải thuộc sở hữu của người dự thi, kh&ocirc;ng qu&aacute; sai lệch với thực tế.</li>
	<li>B&agrave;i dự thi hợp lệ l&agrave; b&agrave;i c&oacute; h&igrave;nh k&egrave;m d&ograve;ng chia sẻ được gửi về cho Ban tổ chức tại email&nbsp;<a href="mailto:vus.theenglishcenter@gmail.com">vus.theenglishcenter@gmail.com</a>&nbsp;hoặc gửi về inbox fanpage VUS k&egrave;m đầy đủ th&ocirc;ng tin y&ecirc;u cầu.</li>
	<li>H&igrave;nh ảnh, nội dung tham gia chương tr&igrave;nh kh&ocirc;ng được vi phạm thuần phong mỹ tục, ph&aacute;p luật văn h&oacute;a Việt Nam, tr&aacute;nh những nội dung phản động về ch&iacute;nh trị, t&ocirc;n gi&aacute;o.</li>
	<li>Nghi&ecirc;m cấm sử dụng những từ ngữ, h&igrave;nh ảnh, th&ocirc;ng tin kh&ocirc;ng l&agrave;nh mạnh, thiếu văn h&oacute;a trong email gửi về Ban tổ chức.<br />
	&nbsp;</li>
</ul>

<p><strong>C&Aacute;C ĐIỀU LỆ KH&Aacute;C:</strong></p>

<ul>
	<li>B&agrave;i dự thi kh&ocirc;ng được gian lận về số lượng người tương t&aacute;c dưới bất kỳ h&igrave;nh thức n&agrave;o.</li>
	<li>H&igrave;nh ảnh, t&ecirc;n v&agrave; th&ocirc;ng tin người tham gia chương tr&igrave;nh sẽ được Ban tổ chức to&agrave;n quyền sử dụng cho mục đ&iacute;ch quảng c&aacute;o, khuyến m&atilde;i v&agrave; tiếp thị hoặc cho c&aacute;c mục đ&iacute;ch kh&aacute;c m&agrave; kh&ocirc;ng c&oacute; th&ecirc;m điều kiện g&igrave; ngoại trừ c&aacute;c hoạt động m&agrave; ph&aacute;p luật cấm.</li>
	<li>VUS được quyền sử dụng c&aacute;c h&igrave;nh ảnh của những người tr&uacute;ng thưởng được chụp trong buổi trao giải tr&ecirc;n c&aacute;c phương tiện th&ocirc;ng tin đại ch&uacute;ng m&agrave; kh&ocirc;ng cần th&ocirc;ng b&aacute;o cho t&aacute;c giả hoặc trả bất k&igrave; chi ph&iacute; n&agrave;o. VUS kh&ocirc;ng chịu tr&aacute;ch nhiệm về vấn đề tranh chấp bản quyền đối với c&aacute;c ảnh, nội dung gửi dự thi trước v&agrave; sau khi nhận giải.</li>
	<li>VUS được quyền thay đổi bất kỳ nội dung chương tr&igrave;nh, hay điều chỉnh thể lệ v&agrave;o bất kỳ thời điểm n&agrave;o trước khi kết th&uacute;c chương tr&igrave;nh bằng c&aacute;ch đăng tải thể lệ đ&atilde; chỉnh sửa l&ecirc;n trang fanpage của VUS&nbsp;<a href="https://www.facebook.com/AnhvanhoiVietMy.VUS">https://www.facebook.com/AnhvanhoiVietMy.VUS</a></li>
	<li>Quyết định của VUS l&agrave; quyết định cuối c&ugrave;ng buộc người tham dự phải chấp h&agrave;nh. VUS c&oacute; to&agrave;n quyền quyết định đối với c&aacute;c thay đổi c&oacute; li&ecirc;n quan đến giải thưởng v&agrave; th&agrave;nh vi&ecirc;n tr&uacute;ng thưởng.</li>
	<li>VUS kh&ocirc;ng chịu tr&aacute;ch nhiệm về việc cung cấp sai th&ocirc;ng tin của người tham gia tr&uacute;ng giải.<br />
	Mọi thắc mắc xin vui l&ograve;ng Inbox tr&ecirc;n fanpage của VUS&nbsp;<a href="https://www.facebook.com/AnhvanhoiVietMy.VUS">https://www.facebook.com/AnhvanhoiVietMy.VUS</a></li>
</ul>
', N'Slide', CAST(N'2019-10-28T00:22:10.397' AS DateTime), N'P01', N'TP01', N'/Uploads/images/shutterbug.jpg')
INSERT [dbo].[Content] ([content_id], [content_title], [content_post], [status], [date_post], [PeopleID], [TopicPostID], [RepresentImage]) VALUES (5, N'THAM DỰ VUS IELTS MOCK TEST 4 KỸ NĂNG - THÊM TỰ TIN, THÊM HĂNG HÁI', N'<p><strong>Th&aacute;ng 10 n&agrave;y, h&atilde;y m&agrave;i giũa c&aacute;c kỹ năng l&agrave;m b&agrave;i thật &ldquo;sắc b&eacute;n&quot; c&ugrave;ng với IELTS Mock Test 4 kỹ năng v&ocirc; c&ugrave;ng thực tế v&agrave; hữu &iacute;ch!</strong></p>

<p>Bạn sẽ được l&agrave;m quen với t&acirc;m l&yacute; ph&ograve;ng thi, xua đi nỗi lo &acirc;u căng thẳng khi l&agrave;m b&agrave;i, x&aacute;c định thử band điểm thi c&aacute;c kỹ năng của m&igrave;nh trước khi &ldquo;chinh chiến thực tế&quot;. Đ&acirc;y l&agrave; kỳ thi thử được m&ocirc; phỏng 100% b&agrave;i thi thực tế. Đề thi được cung cấp bởi Hội đồng Khảo th&iacute; tiếng Anh Đại học Cambridge.</p>

<p>⏰ Thời gian thi: 25,26/10/2019</p>

<p>🏫 Địa điểm thi: VUS Nguyễn Ch&iacute; Thanh</p>

<p>👉 Chương tr&igrave;nh d&agrave;nh cho c&aacute;c bạn học vi&ecirc;n VUS đang học chương tr&igrave;nh Luyện thi IELTS 5.0B trở l&ecirc;n. Để đăng k&yacute; tham dự, phụ huynh v&agrave; học vi&ecirc;n vui l&ograve;ng li&ecirc;n hệ trực tiếp với Ph&ograve;ng Tuyển sinh tại cơ sở VUS đang học. Nhanh tay đăng k&yacute; trước ng&agrave;y 20/10/2019.&nbsp;</p>
', N'Slide', CAST(N'2019-10-28T00:23:23.000' AS DateTime), N'P01', N'TP01', N'/Uploads/images/featured-1.jpg')
SET IDENTITY_INSERT [dbo].[Content] OFF
SET IDENTITY_INSERT [dbo].[HistoryStudentTime] ON 

INSERT [dbo].[HistoryStudentTime] ([HistoryStudentTime], [AddForPerson], [DateAdd], [NumberSlot], [PersonAdd], [Note]) VALUES (14, N'P02', CAST(N'2019-11-13T01:51:28.000' AS DateTime), 10, N'P07', N'do nhập lộn')
SET IDENTITY_INSERT [dbo].[HistoryStudentTime] OFF
INSERT [dbo].[LecturerTime] ([ID], [LecturerID], [Year], [Month], [TeachingTime]) VALUES (N'aanbmxkfgwcbqtc', N'P05', N'2019', N'10', 15)
INSERT [dbo].[LecturerTime] ([ID], [LecturerID], [Year], [Month], [TeachingTime]) VALUES (N'buvgjxxwrqzbgqf', N'P06', N'2019', N'9', 24)
INSERT [dbo].[LecturerTime] ([ID], [LecturerID], [Year], [Month], [TeachingTime]) VALUES (N'caamgjvfipnaipc', N'P01', N'2019', N'11', 11)
INSERT [dbo].[LecturerTime] ([ID], [LecturerID], [Year], [Month], [TeachingTime]) VALUES (N'cnnqavepmqrxiza', N'P06', N'2019', N'10', 10)
INSERT [dbo].[LecturerTime] ([ID], [LecturerID], [Year], [Month], [TeachingTime]) VALUES (N'gkaqjnuoxhjqltd', N'P05', N'2019', N'12', 36)
INSERT [dbo].[LecturerTime] ([ID], [LecturerID], [Year], [Month], [TeachingTime]) VALUES (N'hxeldskqpggobri', N'P06', N'2019', N'12', 37)
INSERT [dbo].[LecturerTime] ([ID], [LecturerID], [Year], [Month], [TeachingTime]) VALUES (N'iqegaybehcncqds', N'P04', N'2019', N'10', 12)
INSERT [dbo].[LecturerTime] ([ID], [LecturerID], [Year], [Month], [TeachingTime]) VALUES (N'nzzgdvvhwijjyei', N'P01', N'2019', N'9', 20)
INSERT [dbo].[LecturerTime] ([ID], [LecturerID], [Year], [Month], [TeachingTime]) VALUES (N'osqpvtcaribeaoc', N'P01', N'2019', N'10', 14)
INSERT [dbo].[LecturerTime] ([ID], [LecturerID], [Year], [Month], [TeachingTime]) VALUES (N'quxmmlwudxdsqbz', N'P06', N'2019', N'11', 17)
INSERT [dbo].[LecturerTime] ([ID], [LecturerID], [Year], [Month], [TeachingTime]) VALUES (N'segeacnnsapopqq', N'P01', N'2019', N'12', 32)
INSERT [dbo].[LecturerTime] ([ID], [LecturerID], [Year], [Month], [TeachingTime]) VALUES (N'spepelszcytychg', N'P04', N'2019', N'12', 35)
INSERT [dbo].[LecturerTime] ([ID], [LecturerID], [Year], [Month], [TeachingTime]) VALUES (N'uefcvwgyqlobghq', N'P04', N'2019', N'9', 24)
INSERT [dbo].[LecturerTime] ([ID], [LecturerID], [Year], [Month], [TeachingTime]) VALUES (N'ymgexrwnpafiocm', N'P04', N'2019', N'11', 16)
INSERT [dbo].[LecturerTime] ([ID], [LecturerID], [Year], [Month], [TeachingTime]) VALUES (N'zgwsuzdmmwkgoki', N'P05', N'2019', N'9', 17)
INSERT [dbo].[LecturerTime] ([ID], [LecturerID], [Year], [Month], [TeachingTime]) VALUES (N'zlikufsbrygqsrh', N'P05', N'2019', N'11', 21)
INSERT [dbo].[Lessons] ([LessonID], [LessonName], [TopicID], [Resource], [RepeatTimes]) VALUES (N'LESSON', N'Chart writting', N'TOPIC03', N'Chart writting', 136)
INSERT [dbo].[Lessons] ([LessonID], [LessonName], [TopicID], [Resource], [RepeatTimes]) VALUES (N'LESSON04', N'Donal Trump Listening', N'TOPIC04', N'Donal Trump Listening', 146)
INSERT [dbo].[Lessons] ([LessonID], [LessonName], [TopicID], [Resource], [RepeatTimes]) VALUES (N'LESSON111111', N'testdownload', N'TOPIC02', N'<p><strong>V&iacute; dụ b&agrave;i l&agrave;m:</strong></p>

<p>Giới thiệu v&iacute; dụ dưới đ&acirc;y để bạn thực h&agrave;nh c&aacute;ch l&agrave;m b&agrave;i.</p>

<p>V&iacute; dụ với 2 đoạn văn được tr&iacute;ch từ b&agrave;i b&aacute;o &ldquo;Trees in Trouble &ndash; What is causing the decline of the World&rsquo;s giant forests?&rsquo;</p>

<p>&ldquo; Paragraph 1-&nbsp;Big trees are incredibly important ecologically. For a start, they&nbsp;sustain&nbsp;countless other species.&nbsp;They provide&nbsp;shelter for many animals, and their trunks and branches can become gardens, hung with green ferns, orchids and bromeliads, coated with mosses and draped with vines. With their tall canopies basking in the sun, they capture vast amounts of energy. This allows them to sustain much of the animal life in the forest.</p>

<p>Paragraph 2- Only a small number of tree species have the genetic capacity to grow really big. The mightiest are native to Northern America, but big trees grow all over the globe, from the tropics to the boreal forests of the high latitudes. To achieve giant stature,&nbsp;a tree needs three things: the right place to establish its seedling, good growing conditions and lots of&nbsp;time with low adult mortality. Disrupt any of these, and you can lost your biggest trees.&rdquo;</p>

<p>Match the two paragraphs with two of the following three headings:</p>

<ul>
	<li>How wildlife benefits from big tress</li>
	<li>Factors that enable trees to grow to significant heights</li>
	<li>How other plants can cause harm</li>
</ul>

<p><strong>Hướng dẫn l&agrave;m b&agrave;i:</strong></p>

<p>Nếu bạn đọc 2 đoạn văn tr&ecirc;n, bạn sẽ thấy c&oacute; rất nhiều từ kh&oacute; như &lsquo;bromeliads&rsquo;, &lsquo;basking&rsquo; and &lsquo;stature&rsquo;. Tuy vậy, bạn kh&ocirc;ng cần bận t&acirc;m đến ch&uacute;ng v&igrave; c&aacute;ch l&agrave;m của bạn phải l&agrave;:&nbsp; đọc những c&acirc;u đầu v&agrave; c&acirc;u cuối của đoạn văn để t&igrave;m &yacute; ch&iacute;nh.</p>

<p><u>Đoạn 1</u>: Ngay c&acirc;u đầu bạn sẽ thấy c&acirc;u khẳng định tầm quan trọng của c&acirc;y&nbsp;<em>&ldquo;Big trees are incredibly important ecologically.&rdquo;</em>&nbsp;V&agrave; những cụm từ kh&aacute;c thể hiện tầm quan trọng của c&acirc;y đối với những sinh vật kh&aacute;c như<em>&nbsp;&nbsp;&ldquo;they sustain...&rdquo; &ldquo;They provide shelter...&rdquo; . V&agrave; trong đ&aacute;p &aacute;n l&agrave; &ldquo;How wildlife benefits from big trees&rdquo;</em>. H&atilde;y chọn n&oacute;.</p>

<p>Đoạn 2: Bạn sẽ thấy những cụm từ được b&ocirc;i đậm tr&ecirc;n&nbsp;<strong>: A tree needs three things: the right place to establish its seedling, good growing conditions..</strong>.--&gt; c&acirc;u n&oacute;i mang t&iacute;nh liệt k&ecirc;. V&agrave; trong đ&aacute;p &aacute;n l&agrave;&nbsp;<strong>&ldquo;Factors that enable tree to grow to significant heights&rdquo;.</strong>&nbsp;H&atilde;y chọn n&oacute;.</p>

<h3><strong>3. Dạng b&agrave;i Matching features - Nối đặc điểm</strong></h3>

<p><strong>a. Matching features - Nối đặc điểm l&agrave; g&igrave;?</strong></p>

<p>Đ&acirc;y l&agrave; dạng b&agrave;i y&ecirc;u cầu bạn phải t&igrave;m th&ocirc;ng tin cụ thể về đặc điểm của một người/địa điểm/điều nổi bật trong b&agrave;i. Đề b&agrave;i cung cấp c&aacute;c danh từ ri&ecirc;ng, bạn c&oacute; nhiệm vụ nối ch&uacute;ng với những c&acirc;u mang th&ocirc;ng tin mi&ecirc;u tả đặc điểm nổi bật nhất của danh từ đ&oacute;.</p>

<p><strong>b. Format dạng b&agrave;i sẽ như thế n&agrave;y:</strong></p>

<p>Sẽ c&oacute; một đoạn văn được cung cấp. Sau đ&oacute; l&agrave; phần c&acirc;u hỏi cung cấp với hai mục l&agrave; một c&acirc;u/đoạn văn v&agrave; đặc điểm để bạn lựa chọn nối ph&ugrave; hợp. B&agrave;i thi đ&aacute;nh gi&aacute; khả năng nhận dạng mối li&ecirc;n hệ giữa c&aacute;c kết nối b&agrave;i, c&oacute; thể t&igrave;m ra c&aacute;c th&ocirc;ng tin chi tiết của b&agrave;i nhanh ch&oacute;ng.</p>
', 134)
INSERT [dbo].[Lessons] ([LessonID], [LessonName], [TopicID], [Resource], [RepeatTimes]) VALUES (N'LESSONS02', N'Hobbies Speaking', N'TOPIC01', N'Hobbies Speaking', 131)
INSERT [dbo].[Lessons] ([LessonID], [LessonName], [TopicID], [Resource], [RepeatTimes]) VALUES (N'Losson1', N'Pinocchio Reading', N'TOPIC02', N'Pinocchio Reading', 127)
INSERT [dbo].[People] ([PeopleID], [Name], [Phone], [DoB], [Gender], [Email], [Active], [Password], [Address], [Image], [RoleID]) VALUES (N'P01', N'Quân', 123456789, CAST(N'2000-01-01' AS Date), NULL, N'hoangquan1097@gmail.com', N'Activated', N'123', N'123 abc', N'/Uploads/images/ferris-wheel.jpg', N'ROLE04')
INSERT [dbo].[People] ([PeopleID], [Name], [Phone], [DoB], [Gender], [Email], [Active], [Password], [Address], [Image], [RoleID]) VALUES (N'P02', N'Nhi', NULL, CAST(N'2000-01-01' AS Date), N'Female', N'hoangquan1097@gmail.com', N'Activated', N'123', NULL, N'/Uploads/images/featured-1.jpg', N'ROLE05')
INSERT [dbo].[People] ([PeopleID], [Name], [Phone], [DoB], [Gender], [Email], [Active], [Password], [Address], [Image], [RoleID]) VALUES (N'P03', N'Công', NULL, CAST(N'2000-01-01' AS Date), NULL, N'hoangquan1097@gmail.com', N'Activated', N'123', NULL, NULL, N'ROLE05')
INSERT [dbo].[People] ([PeopleID], [Name], [Phone], [DoB], [Gender], [Email], [Active], [Password], [Address], [Image], [RoleID]) VALUES (N'P04', N'Lộc', NULL, CAST(N'2000-01-01' AS Date), NULL, N'hoangquan1097@gmail.com', N'Activated', N'123', NULL, NULL, N'ROLE04')
INSERT [dbo].[People] ([PeopleID], [Name], [Phone], [DoB], [Gender], [Email], [Active], [Password], [Address], [Image], [RoleID]) VALUES (N'P05', N'Luân', NULL, CAST(N'2000-01-01' AS Date), NULL, N'hoangquan1097@gmail.com', N'Activated', N'123', NULL, NULL, N'ROLE04')
INSERT [dbo].[People] ([PeopleID], [Name], [Phone], [DoB], [Gender], [Email], [Active], [Password], [Address], [Image], [RoleID]) VALUES (N'P06', N'Danh', NULL, CAST(N'2000-01-01' AS Date), NULL, N'hoangquan1097@gmail.com', N'Activated', N'123', NULL, NULL, N'ROLE04')
INSERT [dbo].[People] ([PeopleID], [Name], [Phone], [DoB], [Gender], [Email], [Active], [Password], [Address], [Image], [RoleID]) VALUES (N'P07', N'Minh', NULL, CAST(N'2000-01-01' AS Date), N'Male', N'hoangquan1097@gmail.com', N'Activated', N'123', NULL, N'/Uploads/images/shutterbug.jpg', N'ROLE01')
INSERT [dbo].[People] ([PeopleID], [Name], [Phone], [DoB], [Gender], [Email], [Active], [Password], [Address], [Image], [RoleID]) VALUES (N'P08', N'Chí', 123456789, CAST(N'2000-01-01' AS Date), N'Male', N'hoangquan1097@gmail.com', N'Activated', N'123', N'abc', N'/Uploads/images/single-02.jpg', N'ROLE02')
INSERT [dbo].[People] ([PeopleID], [Name], [Phone], [DoB], [Gender], [Email], [Active], [Password], [Address], [Image], [RoleID]) VALUES (N'P09', N'Dũng', 123456789, CAST(N'2000-01-01' AS Date), N'Male', N'hoangquan1097@gmail.com', N'Activated', N'123', N'qwe', N'/Uploads/images/sample-image.jpg', N'ROLE03')
INSERT [dbo].[People] ([PeopleID], [Name], [Phone], [DoB], [Gender], [Email], [Active], [Password], [Address], [Image], [RoleID]) VALUES (N'P91', N'Thuận', 90512346, CAST(N'2000-01-01' AS Date), N'Male', N'rewrw@gmail.com', N'Activated', N'123', N'7', NULL, N'ROLE01')
INSERT [dbo].[QuantityAndAttendance] ([QnAID], [UsingRoomID], [PeopleID], [Attendent]) VALUES (N'crmvnplwwqsnolqyxcelegcwz', 604, N'P02', N'Absent')
INSERT [dbo].[QuantityAndAttendance] ([QnAID], [UsingRoomID], [PeopleID], [Attendent]) VALUES (N'hoyfhgumgggpmekovgpsbjqpx', 551, N'P02', N'Absent')
INSERT [dbo].[QuantityAndAttendance] ([QnAID], [UsingRoomID], [PeopleID], [Attendent]) VALUES (N'kyiukhgywvbycogeaoddoeuex', 558, N'P02', N'Not Yet')
INSERT [dbo].[QuantityAndAttendance] ([QnAID], [UsingRoomID], [PeopleID], [Attendent]) VALUES (N'rcrgwkignjlswxbpujmtdxqdo', 555, N'P02', N'Not Yet')
INSERT [dbo].[QuantityAndAttendance] ([QnAID], [UsingRoomID], [PeopleID], [Attendent]) VALUES (N'uqflqeaixljeviyfvyylgaqsi', 603, N'P02', N'Not Yet')
INSERT [dbo].[QuantityAndAttendance] ([QnAID], [UsingRoomID], [PeopleID], [Attendent]) VALUES (N'zuscjwwlmkjwlusuey1njucizz', 556, N'P02', N'Present')
INSERT [dbo].[QuantityAndAttendance] ([QnAID], [UsingRoomID], [PeopleID], [Attendent]) VALUES (N'zuscjwwlmkjwlusueynjucizz', 556, N'P03', N'Absent')
INSERT [dbo].[Quote] ([QuoteID], [Titlle], [Author], [ContentQuote], [Status]) VALUES (N'1', NULL, N'Victor Hugo, Les Misérables', N'“Let us study things that are no more. It is necessary to understand them, if only to avoid them.”', N'Off')
INSERT [dbo].[Quote] ([QuoteID], [Titlle], [Author], [ContentQuote], [Status]) VALUES (N'2', NULL, N'Marcus Tullius Cicero', N'“The authority of those who teach is often an obstacle to those who want to learn.”', N'Off')
INSERT [dbo].[Quote] ([QuoteID], [Titlle], [Author], [ContentQuote], [Status]) VALUES (N'4', NULL, N'Edward Abbey, The Best of Edward Abbey', N'“You can''t study the darkness by flooding it with light.”', N'Off')
INSERT [dbo].[Quote] ([QuoteID], [Titlle], [Author], [ContentQuote], [Status]) VALUES (N'5', NULL, N'Adolf Hitler, Mein Kampf', N'“The art of reading and studying consists in remembering the essentials and forgetting what is not essential.”', N'2')
INSERT [dbo].[Quote] ([QuoteID], [Titlle], [Author], [ContentQuote], [Status]) VALUES (N'6', NULL, N'John Wooden', N'Don’t let what you cannot do interfere with what you can do.', N'1')
INSERT [dbo].[Quote] ([QuoteID], [Titlle], [Author], [ContentQuote], [Status]) VALUES (N'7', NULL, N'Jim Rohn', N'Don’t wish it were easier; wish you were better', N'Off')
INSERT [dbo].[Role] ([RoleID], [Role]) VALUES (N'ROLE01', N'Admin')
INSERT [dbo].[Role] ([RoleID], [Role]) VALUES (N'ROLE02', N'Manager')
INSERT [dbo].[Role] ([RoleID], [Role]) VALUES (N'ROLE03', N'Staff')
INSERT [dbo].[Role] ([RoleID], [Role]) VALUES (N'ROLE04', N'Lecturer')
INSERT [dbo].[Role] ([RoleID], [Role]) VALUES (N'ROLE05', N'Student')
INSERT [dbo].[Room] ([RommID], [Floor], [RoomNo]) VALUES (N'Room01', N'01', N'101')
INSERT [dbo].[Room] ([RommID], [Floor], [RoomNo]) VALUES (N'Room02', N'01', N'102')
INSERT [dbo].[Room] ([RommID], [Floor], [RoomNo]) VALUES (N'Room03', N'02', N'201')
INSERT [dbo].[Room] ([RommID], [Floor], [RoomNo]) VALUES (N'Room04', N'02', N'202')
INSERT [dbo].[Skill] ([SkilID], [Name]) VALUES (N'SKILL01', N'Listening')
INSERT [dbo].[Skill] ([SkilID], [Name]) VALUES (N'SKILL02', N'Reading')
INSERT [dbo].[Skill] ([SkilID], [Name]) VALUES (N'SKILL03', N'Writting')
INSERT [dbo].[Skill] ([SkilID], [Name]) VALUES (N'SKILL04', N'Speaking')
INSERT [dbo].[Slot] ([SlotID], [SlotName], [TimeStart], [TimeEnd]) VALUES (N'SLOT01', N'Slot 01', N'09:00', N'10:30')
INSERT [dbo].[Slot] ([SlotID], [SlotName], [TimeStart], [TimeEnd]) VALUES (N'SLOT02', N'Slot 02', N'10:40', N'12:10')
INSERT [dbo].[Slot] ([SlotID], [SlotName], [TimeStart], [TimeEnd]) VALUES (N'SLOT03', N'Slot 03', N'12:50', N'14:20')
INSERT [dbo].[Slot] ([SlotID], [SlotName], [TimeStart], [TimeEnd]) VALUES (N'SLOT04', N'Slot 04', N'14:30', N'16:00')
INSERT [dbo].[Slot] ([SlotID], [SlotName], [TimeStart], [TimeEnd]) VALUES (N'SLOT05', N'Slot 05', N'16:10', N'17:40')
INSERT [dbo].[Slot] ([SlotID], [SlotName], [TimeStart], [TimeEnd]) VALUES (N'SLOT06', N'Slot 06', N'17:50', N'19:20')
INSERT [dbo].[Slot] ([SlotID], [SlotName], [TimeStart], [TimeEnd]) VALUES (N'SLOT07', N'Slot 07', N'19:30', N'21:00')
INSERT [dbo].[StudentTime] ([ID], [StudentID], [Studied], [Future]) VALUES (N'P02', N'P02', 1, 10)
INSERT [dbo].[Topic] ([TopicID], [TopicName], [SkillID]) VALUES (N'TOPIC01', N'Your Hobbies', N'SKILL04')
INSERT [dbo].[Topic] ([TopicID], [TopicName], [SkillID]) VALUES (N'TOPIC02', N'Pinocchio Story', N'SKILL02')
INSERT [dbo].[Topic] ([TopicID], [TopicName], [SkillID]) VALUES (N'TOPIC03', N'Analysis chart', N'SKILL03')
INSERT [dbo].[Topic] ([TopicID], [TopicName], [SkillID]) VALUES (N'TOPIC04', N'Donal Trump conversations', N'SKILL01')
INSERT [dbo].[TopicPost] ([TopicPostID], [CatalogueID], [TopicName], [PinToBar], [Status]) VALUES (N'TP01', N'Cata01', N'About English Center', NULL, NULL)
INSERT [dbo].[TopicPost] ([TopicPostID], [CatalogueID], [TopicName], [PinToBar], [Status]) VALUES (N'TP02', N'Cata01', N'About Our Teacher', 1, NULL)
INSERT [dbo].[TopicPost] ([TopicPostID], [CatalogueID], [TopicName], [PinToBar], [Status]) VALUES (N'TP03', N'Cata02', N'Research About Characteristic', NULL, NULL)
INSERT [dbo].[TopicPost] ([TopicPostID], [CatalogueID], [TopicName], [PinToBar], [Status]) VALUES (N'TP04', N'Cata02', N'New Method for Studying', NULL, NULL)
INSERT [dbo].[TopicPost] ([TopicPostID], [CatalogueID], [TopicName], [PinToBar], [Status]) VALUES (N'TP05', N'Cata02', N'The Trend of the World', NULL, NULL)
INSERT [dbo].[TopicPost] ([TopicPostID], [CatalogueID], [TopicName], [PinToBar], [Status]) VALUES (N'TP06', NULL, N'Our Special', 1, NULL)
INSERT [dbo].[TopicPost] ([TopicPostID], [CatalogueID], [TopicName], [PinToBar], [Status]) VALUES (N'TP07', NULL, N'News and Event', 1, NULL)
SET IDENTITY_INSERT [dbo].[UsingRoom] ON 

INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (497, N'Room02', N'SLOT01', CAST(N'2019-11-05T00:00:00.000' AS DateTime), N'Tuesday', N'svsfgeacqsvqsir', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (498, N'Room01', N'SLOT01', CAST(N'2019-11-05T00:00:00.000' AS DateTime), N'Tuesday', N'lsfwmizghmhnixh', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (499, N'Room03', N'SLOT01', CAST(N'2019-11-05T00:00:00.000' AS DateTime), N'Tuesday', N'ambxrkbvcvxfqje', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (500, N'Room03', N'SLOT02', CAST(N'2019-11-05T00:00:00.000' AS DateTime), N'Tuesday', N'tkpoxozytpkcgyu', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (501, N'Room03', N'SLOT01', CAST(N'2019-11-06T00:00:00.000' AS DateTime), N'Wednesday', N'ielpdqbnoxauokr', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (502, N'Room01', N'SLOT01', CAST(N'2019-11-06T00:00:00.000' AS DateTime), N'Wednesday', N'nhcfdtyckiwawnj', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (503, N'Room02', N'SLOT01', CAST(N'2019-11-06T00:00:00.000' AS DateTime), N'Wednesday', N'bbzgivzrfrmsezh', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (504, N'Room04', N'SLOT02', CAST(N'2019-11-06T00:00:00.000' AS DateTime), N'Wednesday', N'qwvhowbgaackmle', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (505, N'Room03', N'SLOT02', CAST(N'2019-11-06T00:00:00.000' AS DateTime), N'Wednesday', N'vymxozyuwlypvow', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (506, N'Room04', N'SLOT03', CAST(N'2019-11-06T00:00:00.000' AS DateTime), N'Wednesday', N'fdvdoesxohqalvh', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (507, N'Room01', N'SLOT01', CAST(N'2019-11-07T00:00:00.000' AS DateTime), N'Thursday', N'tyrdtfumjqgsthe', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (508, N'Room02', N'SLOT01', CAST(N'2019-11-07T00:00:00.000' AS DateTime), N'Thursday', N'wnjffjxqzhmcjez', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (509, N'Room03', N'SLOT01', CAST(N'2019-11-07T00:00:00.000' AS DateTime), N'Thursday', N'khggllyfuqdurqw', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (510, N'Room03', N'SLOT02', CAST(N'2019-11-07T00:00:00.000' AS DateTime), N'Thursday', N'pkxwknwuqbzzzto', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (511, N'Room01', N'SLOT03', CAST(N'2019-11-07T00:00:00.000' AS DateTime), N'Thursday', N'eetxqpxjlkprhfm', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (512, N'Room04', N'SLOT03', CAST(N'2019-11-07T00:00:00.000' AS DateTime), N'Thursday', N'jhlnqsuxhvlwpie', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (513, N'Room01', N'SLOT06', CAST(N'2019-11-07T00:00:00.000' AS DateTime), N'Thursday', N'xchowuwmcdboxub', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (514, N'Room04', N'SLOT06', CAST(N'2019-11-07T00:00:00.000' AS DateTime), N'Thursday', N'ceyewwtaypxtfxt', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (515, N'Room03', N'SLOT06', CAST(N'2019-11-07T00:00:00.000' AS DateTime), N'Thursday', N'voizhvccxjmtfoe', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (516, N'Room02', N'SLOT06', CAST(N'2019-11-07T00:00:00.000' AS DateTime), N'Thursday', N'arzphxzqsviynrw', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (517, N'Room01', N'SLOT01', CAST(N'2019-11-08T00:00:00.000' AS DateTime), N'Friday', N'ftqfhawfogdevvo', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (518, N'Room03', N'SLOT01', CAST(N'2019-11-08T00:00:00.000' AS DateTime), N'Friday', N'uongncxujouwehm', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (519, N'Room04', N'SLOT01', CAST(N'2019-11-08T00:00:00.000' AS DateTime), N'Friday', N'zqewnevifapbmke', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (520, N'Room02', N'SLOT01', CAST(N'2019-11-08T00:00:00.000' AS DateTime), N'Friday', N'etvmngswbllgunw', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (521, N'Room03', N'SLOT02', CAST(N'2019-11-08T00:00:00.000' AS DateTime), N'Friday', N'wdfiygbyagagueg', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (522, N'Room01', N'SLOT02', CAST(N'2019-11-08T00:00:00.000' AS DateTime), N'Friday', N'snsnsitlwtcyczt', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (523, N'Room02', N'SLOT03', CAST(N'2019-11-08T00:00:00.000' AS DateTime), N'Friday', N'lxbjehcnvoqycqe', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (524, N'Room04', N'SLOT03', CAST(N'2019-11-08T00:00:00.000' AS DateTime), N'Friday', N'mkfeynspnnovsoj', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (525, N'Room04', N'SLOT05', CAST(N'2019-11-08T00:00:00.000' AS DateTime), N'Friday', N'eupakmbqmidvsft', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (526, N'Room03', N'SLOT05', CAST(N'2019-11-08T00:00:00.000' AS DateTime), N'Friday', N'jxgqjoyfhtyaail', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (527, N'Room01', N'SLOT01', CAST(N'2019-11-09T00:00:00.000' AS DateTime), N'Saturday', N'ozxgjqvtdfufime', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (528, N'Room04', N'SLOT01', CAST(N'2019-11-09T00:00:00.000' AS DateTime), N'Saturday', N'ucpwjtshzqqlqpw', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (529, N'Room04', N'SLOT02', CAST(N'2019-11-09T00:00:00.000' AS DateTime), N'Saturday', N'mmyrvsbjylfkqgg', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (530, N'Room03', N'SLOT02', CAST(N'2019-11-09T00:00:00.000' AS DateTime), N'Saturday', N'bhvsbucyttvcyrd', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (531, N'Room03', N'SLOT03', CAST(N'2019-11-09T00:00:00.000' AS DateTime), N'Saturday', N'gjmibwamperigvw', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (532, N'Room02', N'SLOT03', CAST(N'2019-11-09T00:00:00.000' AS DateTime), N'Saturday', N'lmdyayxakqnnoyo', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (533, N'Room01', N'SLOT03', CAST(N'2019-11-09T00:00:00.000' AS DateTime), N'Saturday', N'qovoabupgbjswbg', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (534, N'Room01', N'SLOT04', CAST(N'2019-11-09T00:00:00.000' AS DateTime), N'Saturday', N'jyekmadqfwyswsq', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (535, N'Room04', N'SLOT04', CAST(N'2019-11-09T00:00:00.000' AS DateTime), N'Saturday', N'obwamcafbhtxewj', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (536, N'Room02', N'SLOT04', CAST(N'2019-11-09T00:00:00.000' AS DateTime), N'Saturday', N'tdnqmfxtxspcnzb', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (537, N'Room03', N'SLOT04', CAST(N'2019-11-09T00:00:00.000' AS DateTime), N'Saturday', N'ygegmhuhsdlhvct', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (538, N'Room03', N'SLOT05', CAST(N'2019-11-09T00:00:00.000' AS DateTime), N'Saturday', N'qqobxgdjryahvtd', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (539, N'Room01', N'SLOT05', CAST(N'2019-11-09T00:00:00.000' AS DateTime), N'Saturday', N'vsfrxiaxnjwmdwv', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (540, N'Room04', N'SLOT05', CAST(N'2019-11-09T00:00:00.000' AS DateTime), N'Saturday', N'bvxhxlxljusrlao', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (541, N'Room02', N'SLOT05', CAST(N'2019-11-09T00:00:00.000' AS DateTime), N'Saturday', N'pptidnzaediktml', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (542, N'Room01', N'SLOT01', CAST(N'2019-11-10T00:00:00.000' AS DateTime), N'Sunday', N'uskydpwpzoepbpd', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (543, N'Room03', N'SLOT01', CAST(N'2019-11-10T00:00:00.000' AS DateTime), N'Sunday', N'zucodrtdvazujsv', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (544, N'Room03', N'SLOT02', CAST(N'2019-11-10T00:00:00.000' AS DateTime), N'Sunday', N'selkorcfuuoujjg', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (545, N'Room02', N'SLOT03', CAST(N'2019-11-10T00:00:00.000' AS DateTime), N'Sunday', N'gzhlusdupdfmrvd', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (546, N'Room04', N'SLOT03', CAST(N'2019-11-10T00:00:00.000' AS DateTime), N'Sunday', N'qeqruxxwhzwwhbn', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (547, N'Room01', N'SLOT05', CAST(N'2019-11-10T00:00:00.000' AS DateTime), N'Sunday', N'vhihuavlclsbpfg', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (548, N'Room03', N'SLOT06', CAST(N'2019-11-10T00:00:00.000' AS DateTime), N'Sunday', N'orrcfzdmbfhbpwq', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (549, N'Room04', N'SLOT06', CAST(N'2019-11-10T00:00:00.000' AS DateTime), N'Sunday', N'ttitfbaaxrdgxzi', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (550, N'Room02', N'SLOT06', CAST(N'2019-11-10T00:00:00.000' AS DateTime), N'Sunday', N'ywajfdyptczlfca', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (551, N'Room02', N'SLOT01', CAST(N'2019-11-11T00:00:00.000' AS DateTime), N'Monday', N'dyrzfgvdpnurogt', 1, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (552, N'Room03', N'SLOT01', CAST(N'2019-11-11T00:00:00.000' AS DateTime), N'Monday', N'stnzliwskwljwrq', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (553, N'Room04', N'SLOT01', CAST(N'2019-11-11T00:00:00.000' AS DateTime), N'Monday', N'xvfplkthfhhoevi', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (554, N'Room04', N'SLOT02', CAST(N'2019-11-11T00:00:00.000' AS DateTime), N'Monday', N'akxrwowlwynyusd', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (555, N'Room02', N'SLOT02', CAST(N'2019-11-11T00:00:00.000' AS DateTime), N'Monday', N'xxydipcaqeydcmf', 1, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (556, N'Room01', N'SLOT02', CAST(N'2019-11-11T00:00:00.000' AS DateTime), N'Monday', N'mruenrepmnovkyd', 2, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (557, N'Room03', N'SLOT02', CAST(N'2019-11-11T00:00:00.000' AS DateTime), N'Monday', N'rumuntbehykasbv', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (558, N'Room01', N'SLOT04', CAST(N'2019-11-11T00:00:00.000' AS DateTime), N'Monday', N'fpiutvdtdhasans', 1, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (559, N'Room04', N'SLOT04', CAST(N'2019-11-11T00:00:00.000' AS DateTime), N'Monday', N'zmvlyabwtampqci', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (560, N'Room01', N'SLOT06', CAST(N'2019-11-11T00:00:00.000' AS DateTime), N'Monday', N'jreryevzlxeagjs', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (561, N'Room03', N'SLOT06', CAST(N'2019-11-11T00:00:00.000' AS DateTime), N'Monday', N'xlasegxogfusovq', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (562, N'Room02', N'SLOT01', CAST(N'2019-10-02T00:00:00.000' AS DateTime), N'Wednesday', N'xlvabthbqfvrawh', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (563, N'Room01', N'SLOT01', CAST(N'2019-10-02T00:00:00.000' AS DateTime), N'Wednesday', N'cnnqavepmqrxiza', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (564, N'Room04', N'SLOT01', CAST(N'2019-10-02T00:00:00.000' AS DateTime), N'Wednesday', N'iqegaybehcncqds', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (565, N'Room03', N'SLOT01', CAST(N'2019-10-02T00:00:00.000' AS DateTime), N'Wednesday', N'wkaggzctdkduyop', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (566, N'Room03', N'SLOT03', CAST(N'2019-10-02T00:00:00.000' AS DateTime), N'Wednesday', N'kfwhmbeiytumgam', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (567, N'Room02', N'SLOT03', CAST(N'2019-10-02T00:00:00.000' AS DateTime), N'Wednesday', N'irxtxdkxszeroup', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (568, N'Room01', N'SLOT03', CAST(N'2019-10-02T00:00:00.000' AS DateTime), N'Wednesday', N'wmtudflmoivjxgm', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (569, N'Room04', N'SLOT03', CAST(N'2019-10-02T00:00:00.000' AS DateTime), N'Wednesday', N'xzxpxkboghsgnes', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (570, N'Room04', N'SLOT01', CAST(N'2019-10-03T00:00:00.000' AS DateTime), N'Thursday', N'qjhljjkqebhgnvc', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (571, N'Room03', N'SLOT02', CAST(N'2019-10-03T00:00:00.000' AS DateTime), N'Thursday', N'eddlolmfakxyvhz', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (572, N'Room02', N'SLOT02', CAST(N'2019-10-03T00:00:00.000' AS DateTime), N'Thursday', N'oimroqgirgpjlok', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (573, N'Room01', N'SLOT02', CAST(N'2019-10-03T00:00:00.000' AS DateTime), N'Thursday', N'yarcupkirejvlwp', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (574, N'Room01', N'SLOT03', CAST(N'2019-10-03T00:00:00.000' AS DateTime), N'Thursday', N'ifziuueliabgbdz', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (575, N'Room04', N'SLOT03', CAST(N'2019-10-03T00:00:00.000' AS DateTime), N'Thursday', N'wawjawgadjryjox', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (576, N'Room04', N'SLOT05', CAST(N'2019-10-03T00:00:00.000' AS DateTime), N'Thursday', N'bdnzzydozundrsp', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (577, N'Room02', N'SLOT05', CAST(N'2019-10-03T00:00:00.000' AS DateTime), N'Thursday', N'unwvlxmqypcdrjz', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (578, N'Room04', N'SLOT01', CAST(N'2019-10-04T00:00:00.000' AS DateTime), N'Friday', N'vaaqfccsqozahhe', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (579, N'Room01', N'SLOT01', CAST(N'2019-10-04T00:00:00.000' AS DateTime), N'Friday', N'esfblcgtpltnhpj', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (580, N'Room03', N'SLOT02', CAST(N'2019-10-04T00:00:00.000' AS DateTime), N'Friday', N'tmbcreiikukfpbh', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (581, N'Room01', N'SLOT02', CAST(N'2019-10-04T00:00:00.000' AS DateTime), N'Friday', N'yptsqgfwgffkyez', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (582, N'Room04', N'SLOT02', CAST(N'2019-10-04T00:00:00.000' AS DateTime), N'Friday', N'drkiqjckcqbqgir', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (583, N'Room01', N'SLOT03', CAST(N'2019-10-04T00:00:00.000' AS DateTime), N'Friday', N'vbudcilmblqpgyc', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (584, N'Room04', N'SLOT03', CAST(N'2019-10-04T00:00:00.000' AS DateTime), N'Friday', N'beltckiaxwmvocu', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (585, N'Room02', N'SLOT03', CAST(N'2019-10-04T00:00:00.000' AS DateTime), N'Friday', N'ggcjcmfosiiawfm', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (586, N'Room03', N'SLOT03', CAST(N'2019-10-04T00:00:00.000' AS DateTime), N'Friday', N'ljuzcpcdotefeie', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (587, N'Room04', N'SLOT04', CAST(N'2019-10-04T00:00:00.000' AS DateTime), N'Friday', N'dtdvnolenotfezo', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (588, N'Room02', N'SLOT04', CAST(N'2019-10-04T00:00:00.000' AS DateTime), N'Friday', N'ivvlnqitjzokmdh', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (589, N'Room02', N'SLOT01', CAST(N'2019-10-05T00:00:00.000' AS DateTime), N'Saturday', N'xqrmtskiehfcuoe', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (590, N'Room04', N'SLOT01', CAST(N'2019-10-05T00:00:00.000' AS DateTime), N'Saturday', N'csictuhwatahcsw', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (591, N'Room02', N'SLOT02', CAST(N'2019-10-05T00:00:00.000' AS DateTime), N'Saturday', N'hvastxekvewmkvo', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (592, N'Room01', N'SLOT02', CAST(N'2019-10-05T00:00:00.000' AS DateTime), N'Saturday', N'afjoewnmuzlmkmz', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (593, N'Room03', N'SLOT02', CAST(N'2019-10-05T00:00:00.000' AS DateTime), N'Saturday', N'fibeeykaqkhrspr', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (594, N'Room03', N'SLOT03', CAST(N'2019-10-05T00:00:00.000' AS DateTime), N'Saturday', N'tcxekalplsxjabo', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (595, N'Room02', N'SLOT05', CAST(N'2019-10-05T00:00:00.000' AS DateTime), N'Saturday', N'dhgkkfgscppuqiz', 0, N'Teaching', N'Enable', NULL)
GO
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (596, N'Room03', N'SLOT05', CAST(N'2019-10-05T00:00:00.000' AS DateTime), N'Saturday', N'ikxbkhdgyalzylr', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (597, N'Room01', N'SLOT05', CAST(N'2019-10-05T00:00:00.000' AS DateTime), N'Saturday', N'gwymvjjwtgvehft', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (598, N'Room02', N'SLOT02', CAST(N'2019-10-06T00:00:00.000' AS DateTime), N'Sunday', N'lzpcvlgkprrjpim', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (599, N'Room01', N'SLOT04', CAST(N'2019-10-06T00:00:00.000' AS DateTime), N'Sunday', N'atmdbnhzkaibxuj', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (600, N'Room02', N'SLOT04', CAST(N'2019-10-06T00:00:00.000' AS DateTime), N'Sunday', N'fwdtbpeofldgfxb', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (601, N'Room04', N'SLOT04', CAST(N'2019-10-06T00:00:00.000' AS DateTime), N'Sunday', N'xgmpmonpegsgfol', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (602, N'Room03', N'SLOT04', CAST(N'2019-10-06T00:00:00.000' AS DateTime), N'Sunday', N'ytqkgudrwfpevnr', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (603, N'Room04', N'SLOT02', CAST(N'2019-10-07T00:00:00.000' AS DateTime), N'Monday', N'rdafstmtvaedvdb', 1, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (604, N'Room01', N'SLOT03', CAST(N'2019-10-07T00:00:00.000' AS DateTime), N'Monday', N'wfrwsvjhrlaidht', 1, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (605, N'Room03', N'SLOT04', CAST(N'2019-10-07T00:00:00.000' AS DateTime), N'Monday', N'kaowyxlwmuralsr', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (606, N'Room04', N'SLOT04', CAST(N'2019-10-07T00:00:00.000' AS DateTime), N'Monday', N'pdfmxzikifmgtwj', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (607, N'Room01', N'SLOT04', CAST(N'2019-10-07T00:00:00.000' AS DateTime), N'Monday', N'ufwcxcfzeqilbzb', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (608, N'Room02', N'SLOT04', CAST(N'2019-10-07T00:00:00.000' AS DateTime), N'Monday', N'npgyjboadlxlbql', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (609, N'Room03', N'SLOT04', CAST(N'2019-10-08T00:00:00.000' AS DateTime), N'Tuesday', N'ssxojdloywtqjtd', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (610, N'Room04', N'SLOT04', CAST(N'2019-10-08T00:00:00.000' AS DateTime), N'Tuesday', N'xupejfiduhpvrxw', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (611, N'Room02', N'SLOT04', CAST(N'2019-10-08T00:00:00.000' AS DateTime), N'Tuesday', N'mplfphjspqfnzit', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (612, N'Room01', N'SLOT04', CAST(N'2019-10-08T00:00:00.000' AS DateTime), N'Tuesday', N'rrcvokgglbbshml', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (613, N'Room01', N'SLOT02', CAST(N'2019-09-02T00:00:00.000' AS DateTime), N'Monday', N'wreqjvaivfewynn', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (614, N'Room04', N'SLOT02', CAST(N'2019-09-02T00:00:00.000' AS DateTime), N'Monday', N'buvgjxxwrqzbgqf', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (615, N'Room02', N'SLOT02', CAST(N'2019-09-02T00:00:00.000' AS DateTime), N'Monday', N'uefcvwgyqlobghq', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (616, N'Room03', N'SLOT02', CAST(N'2019-09-02T00:00:00.000' AS DateTime), N'Monday', N'urjxpbwaikmywfv', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (617, N'Room02', N'SLOT02', CAST(N'2019-09-03T00:00:00.000' AS DateTime), N'Tuesday', N'nbttabebhfbywwf', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (618, N'Room01', N'SLOT02', CAST(N'2019-09-03T00:00:00.000' AS DateTime), N'Tuesday', N'sdkjadcpdqwdezx', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (619, N'Room03', N'SLOT02', CAST(N'2019-09-03T00:00:00.000' AS DateTime), N'Tuesday', N'hygkgfdfyznvmlv', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (620, N'Room03', N'SLOT03', CAST(N'2019-09-03T00:00:00.000' AS DateTime), N'Tuesday', N'maxaghattkiaupn', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (621, N'Room04', N'SLOT03', CAST(N'2019-09-03T00:00:00.000' AS DateTime), N'Tuesday', N'rdpqgkxhpvegcsf', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (622, N'Room04', N'SLOT04', CAST(N'2019-09-03T00:00:00.000' AS DateTime), N'Tuesday', N'jnylrjgjoqtfcjp', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (623, N'Room03', N'SLOT04', CAST(N'2019-09-03T00:00:00.000' AS DateTime), N'Tuesday', N'oqqbrldxkbplkmi', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (624, N'Room01', N'SLOT04', CAST(N'2019-09-03T00:00:00.000' AS DateTime), N'Tuesday', N'dkmcxnfmfkfdsyf', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (625, N'Room02', N'SLOT04', CAST(N'2019-09-03T00:00:00.000' AS DateTime), N'Tuesday', N'rfiddpgbaswvbkc', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (626, N'Room03', N'SLOT05', CAST(N'2019-09-03T00:00:00.000' AS DateTime), N'Tuesday', N'whatcrdpwerajnu', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (627, N'Room01', N'SLOT05', CAST(N'2019-09-03T00:00:00.000' AS DateTime), N'Tuesday', N'lcwuitffrmisrzs', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (628, N'Room02', N'SLOT03', CAST(N'2019-09-04T00:00:00.000' AS DateTime), N'Wednesday', N'qenkivctnxdxzck', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (629, N'Room01', N'SLOT03', CAST(N'2019-09-04T00:00:00.000' AS DateTime), N'Wednesday', N'vheaiyzhjjzchfc', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (630, N'Room01', N'SLOT04', CAST(N'2019-09-04T00:00:00.000' AS DateTime), N'Wednesday', N'jbbboabwerqupra', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (631, N'Room04', N'SLOT04', CAST(N'2019-09-04T00:00:00.000' AS DateTime), N'Wednesday', N'ywxctcclzagmxdx', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (632, N'Room02', N'SLOT04', CAST(N'2019-09-04T00:00:00.000' AS DateTime), N'Wednesday', N'dyostezavlcsfgp', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (633, N'Room03', N'SLOT04', CAST(N'2019-09-04T00:00:00.000' AS DateTime), N'Wednesday', N'ibgitgxoqwxxnjh', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (634, N'Room03', N'SLOT05', CAST(N'2019-09-04T00:00:00.000' AS DateTime), N'Wednesday', N'wvciziydlfopvvf', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (635, N'Room04', N'SLOT05', CAST(N'2019-09-04T00:00:00.000' AS DateTime), N'Wednesday', N'lqyjfkashoehdhc', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (636, N'Room02', N'SLOT05', CAST(N'2019-09-04T00:00:00.000' AS DateTime), N'Wednesday', N'qspzfnxhczamlku', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (637, N'Room01', N'SLOT05', CAST(N'2019-09-04T00:00:00.000' AS DateTime), N'Wednesday', N'enlakoywyhqetws', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (638, N'Room03', N'SLOT06', CAST(N'2019-09-04T00:00:00.000' AS DateTime), N'Wednesday', N'tiibqqaltqgwbip', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (639, N'Room02', N'SLOT06', CAST(N'2019-09-04T00:00:00.000' AS DateTime), N'Wednesday', N'ykzrqtxzobccklh', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (640, N'Room03', N'SLOT01', CAST(N'2019-09-05T00:00:00.000' AS DateTime), N'Thursday', N'mfvswvyokksusxe', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (641, N'Room04', N'SLOT01', CAST(N'2019-09-05T00:00:00.000' AS DateTime), N'Thursday', N'fpfnhuhqjfhtsop', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (642, N'Room01', N'SLOT01', CAST(N'2019-09-05T00:00:00.000' AS DateTime), N'Thursday', N'fcjjbzxsbefrimu', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (643, N'Room03', N'SLOT02', CAST(N'2019-09-05T00:00:00.000' AS DateTime), N'Thursday', N'ymsenygtzyuqide', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (644, N'Room01', N'SLOT02', CAST(N'2019-09-05T00:00:00.000' AS DateTime), N'Thursday', N'ngoftahivhkjqpc', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (645, N'Room02', N'SLOT02', CAST(N'2019-09-05T00:00:00.000' AS DateTime), N'Thursday', N'sjgvscfwqsgoysu', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (646, N'Room03', N'SLOT03', CAST(N'2019-09-05T00:00:00.000' AS DateTime), N'Thursday', N'gdcwyeglmbwgger', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (647, N'Room02', N'SLOT03', CAST(N'2019-09-05T00:00:00.000' AS DateTime), N'Thursday', N'copbshzzipxyoye', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (648, N'Room04', N'SLOT03', CAST(N'2019-09-05T00:00:00.000' AS DateTime), N'Thursday', N'zapneifpcvidwth', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (649, N'Room01', N'SLOT04', CAST(N'2019-09-05T00:00:00.000' AS DateTime), N'Thursday', N'fdhdelcdygeiewz', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (650, N'Room04', N'SLOT04', CAST(N'2019-09-05T00:00:00.000' AS DateTime), N'Thursday', N'kfytenzsuraomzr', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (651, N'Room02', N'SLOT05', CAST(N'2019-09-05T00:00:00.000' AS DateTime), N'Thursday', N'hszfppfhpxksutu', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (652, N'Room03', N'SLOT05', CAST(N'2019-09-05T00:00:00.000' AS DateTime), N'Thursday', N'mvrvprcwkigycxm', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (653, N'Room01', N'SLOT05', CAST(N'2019-09-05T00:00:00.000' AS DateTime), N'Thursday', N'sxilptzkgucdlae', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (654, N'Room04', N'SLOT05', CAST(N'2019-09-05T00:00:00.000' AS DateTime), N'Thursday', N'gselvvbzbcsvtmb', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (655, N'Room04', N'SLOT03', CAST(N'2019-09-06T00:00:00.000' AS DateTime), N'Friday', N'luwbuyynxnoabpu', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (656, N'Room04', N'SLOT02', CAST(N'2019-09-07T00:00:00.000' AS DateTime), N'Saturday', N'zpscazzcswesjbr', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (657, N'Room01', N'SLOT02', CAST(N'2019-09-07T00:00:00.000' AS DateTime), N'Saturday', N'szbymyierrtsjsb', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (658, N'Room01', N'SLOT03', CAST(N'2019-09-07T00:00:00.000' AS DateTime), N'Saturday', N'tmftgeygjqqqzqh', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (659, N'Room02', N'SLOT03', CAST(N'2019-09-07T00:00:00.000' AS DateTime), N'Saturday', N'mwpprdhhilfpzhr', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (660, N'Room04', N'SLOT04', CAST(N'2019-09-07T00:00:00.000' AS DateTime), N'Saturday', N'rygfrfewewbuhkj', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (661, N'Room02', N'SLOT04', CAST(N'2019-09-07T00:00:00.000' AS DateTime), N'Saturday', N'bdplrkyyvstfxrt', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (662, N'Room02', N'SLOT01', CAST(N'2019-09-08T00:00:00.000' AS DateTime), N'Sunday', N'tnygdjhauniexie', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (663, N'Room04', N'SLOT01', CAST(N'2019-09-08T00:00:00.000' AS DateTime), N'Sunday', N'iivhjljppwywftb', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (664, N'Room02', N'SLOT02', CAST(N'2019-09-08T00:00:00.000' AS DateTime), N'Sunday', N'nkmxingdlhucnxt', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (665, N'Room04', N'SLOT02', CAST(N'2019-09-08T00:00:00.000' AS DateTime), N'Sunday', N'bfiyophsgqkuvjr', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1635, N'Room02', N'SLOT01', CAST(N'2019-09-01T00:00:00.000' AS DateTime), N'Sunday', N'yoesggoylumifhf', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1636, N'Room03', N'SLOT01', CAST(N'2019-09-01T00:00:00.000' AS DateTime), N'Sunday', N'wojymmkpxzuldan', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1637, N'Room04', N'SLOT02', CAST(N'2019-09-01T00:00:00.000' AS DateTime), N'Sunday', N'lifzrometildllk', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1638, N'Room01', N'SLOT02', CAST(N'2019-09-01T00:00:00.000' AS DateTime), N'Sunday', N'qlwprrjtotgitpc', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1639, N'Room03', N'SLOT03', CAST(N'2019-09-01T00:00:00.000' AS DateTime), N'Sunday', N'zdbaxqntorbvtxi', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1640, N'Room04', N'SLOT03', CAST(N'2019-09-01T00:00:00.000' AS DateTime), N'Sunday', N'efsqxtkikcxabba', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1641, N'Room03', N'SLOT04', CAST(N'2019-09-01T00:00:00.000' AS DateTime), N'Sunday', N'jikgxvhwfntfjes', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1642, N'Room02', N'SLOT04', CAST(N'2019-09-01T00:00:00.000' AS DateTime), N'Sunday', N'okbwxxfkbyokshk', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1643, N'Room02', N'SLOT05', CAST(N'2019-09-01T00:00:00.000' AS DateTime), N'Sunday', N'hulsiwnmatdkryv', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1644, N'Room04', N'SLOT05', CAST(N'2019-09-01T00:00:00.000' AS DateTime), N'Sunday', N'mxciizkawezpabn', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1645, N'Room03', N'SLOT06', CAST(N'2019-09-01T00:00:00.000' AS DateTime), N'Sunday', N'rztyibiprpvuiff', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1646, N'Room01', N'SLOT06', CAST(N'2019-09-01T00:00:00.000' AS DateTime), N'Sunday', N'wcloidfdnbraqix', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1647, N'Room01', N'SLOT07', CAST(N'2019-09-01T00:00:00.000' AS DateTime), N'Sunday', N'pmujudnemvgzqzh', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1648, N'Room03', N'SLOT07', CAST(N'2019-09-01T00:00:00.000' AS DateTime), N'Sunday', N'uomaufltihbfyca', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1649, N'Room04', N'SLOT01', CAST(N'2019-09-02T00:00:00.000' AS DateTime), N'Monday', N'zrdquhihdsxkggs', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1650, N'Room03', N'SLOT01', CAST(N'2019-09-02T00:00:00.000' AS DateTime), N'Monday', N'etvgtkfvzdtpojk', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1651, N'Room04', N'SLOT01', CAST(N'2019-09-01T00:00:00.000' AS DateTime), N'Sunday', N'fohmxqachbkkxha', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1652, N'Room01', N'SLOT01', CAST(N'2019-09-01T00:00:00.000' AS DateTime), N'Sunday', N'ylvccuygyvwinwq', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1653, N'Room02', N'SLOT02', CAST(N'2019-09-01T00:00:00.000' AS DateTime), N'Sunday', N'domtcxvutgsnvzi', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1654, N'Room03', N'SLOT02', CAST(N'2019-09-01T00:00:00.000' AS DateTime), N'Sunday', N'jqejcztiprosdca', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1655, N'Room02', N'SLOT03', CAST(N'2019-09-01T00:00:00.000' AS DateTime), N'Sunday', N'xlajibuxkaeklox', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1656, N'Room01', N'SLOT03', CAST(N'2019-09-01T00:00:00.000' AS DateTime), N'Sunday', N'cnrzidrmglaptrq', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1657, N'Room04', N'SLOT04', CAST(N'2019-09-01T00:00:00.000' AS DateTime), N'Sunday', N'vybvtdanfgpptia', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1658, N'Room01', N'SLOT04', CAST(N'2019-09-01T00:00:00.000' AS DateTime), N'Sunday', N'aasltfxcbrlubms', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1659, N'Room01', N'SLOT05', CAST(N'2019-09-01T00:00:00.000' AS DateTime), N'Sunday', N'ovomzhzrwabmkxq', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1660, N'Room03', N'SLOT05', CAST(N'2019-09-01T00:00:00.000' AS DateTime), N'Sunday', N'txgczjwfslxssbi', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1661, N'Room02', N'SLOT06', CAST(N'2019-09-01T00:00:00.000' AS DateTime), N'Sunday', N'yaxszmttnwtxaea', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1662, N'Room04', N'SLOT06', CAST(N'2019-09-01T00:00:00.000' AS DateTime), N'Sunday', N'dcoizoqijhocihs', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1663, N'Room04', N'SLOT07', CAST(N'2019-09-01T00:00:00.000' AS DateTime), N'Sunday', N'wmyeknzjicdciyc', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1664, N'Room02', N'SLOT07', CAST(N'2019-09-01T00:00:00.000' AS DateTime), N'Sunday', N'bppukpwxenzhqbv', 0, N'Teaching', N'Enable', NULL)
GO
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1665, N'Room01', N'SLOT01', CAST(N'2019-09-02T00:00:00.000' AS DateTime), N'Monday', N'grhkkstmzyvmyfn', 0, N'Teaching', N'Enable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1666, N'Room02', N'SLOT01', CAST(N'2019-09-02T00:00:00.000' AS DateTime), N'Monday', N'luyakuqavkrrgif', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1667, N'Room03', N'SLOT01', CAST(N'2019-12-01T00:00:00.000' AS DateTime), N'Sunday', N'naquynlmzmurlct', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1668, N'Room04', N'SLOT01', CAST(N'2019-12-01T00:00:00.000' AS DateTime), N'Sunday', N'gkaqjnuoxhjqltd', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1669, N'Room01', N'SLOT02', CAST(N'2019-12-01T00:00:00.000' AS DateTime), N'Sunday', N'hxeldskqpggobri', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1670, N'Room04', N'SLOT02', CAST(N'2019-12-01T00:00:00.000' AS DateTime), N'Sunday', N'vramjulflpwgjdg', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1671, N'Room01', N'SLOT03', CAST(N'2019-12-01T00:00:00.000' AS DateTime), N'Sunday', N'ocjhvtugkjlgjuq', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1672, N'Room03', N'SLOT03', CAST(N'2019-12-01T00:00:00.000' AS DateTime), N'Sunday', N'pondpykicijezsv', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1673, N'Room03', N'SLOT04', CAST(N'2019-12-01T00:00:00.000' AS DateTime), N'Sunday', N'hzxyaxtkadxdzjg', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1674, N'Room01', N'SLOT04', CAST(N'2019-12-01T00:00:00.000' AS DateTime), N'Sunday', N'nbooazqywotihmy', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1675, N'Room04', N'SLOT05', CAST(N'2019-12-01T00:00:00.000' AS DateTime), N'Sunday', N'segeacnnsapopqq', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1676, N'Room01', N'SLOT05', CAST(N'2019-12-01T00:00:00.000' AS DateTime), N'Sunday', N'xgxuaekbolltxti', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1677, N'Room03', N'SLOT06', CAST(N'2019-12-01T00:00:00.000' AS DateTime), N'Sunday', N'pqhqmdtcngasxkt', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1678, N'Room02', N'SLOT06', CAST(N'2019-12-01T00:00:00.000' AS DateTime), N'Sunday', N'utygmfqrirwyfnl', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1679, N'Room02', N'SLOT07', CAST(N'2019-12-01T00:00:00.000' AS DateTime), N'Sunday', N'zvqwlinfecrdnqd', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1680, N'Room01', N'SLOT07', CAST(N'2019-12-01T00:00:00.000' AS DateTime), N'Sunday', N'fyhmlkktannivuv', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1681, N'Room01', N'SLOT01', CAST(N'2019-12-02T00:00:00.000' AS DateTime), N'Monday', N'xiqixjtvzicivlg', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1682, N'Room03', N'SLOT01', CAST(N'2019-12-02T00:00:00.000' AS DateTime), N'Monday', N'ckiyxmqjutyndoy', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1683, N'Room04', N'SLOT02', CAST(N'2019-12-02T00:00:00.000' AS DateTime), N'Monday', N'hnzoxonxqeuslrq', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1684, N'Room01', N'SLOT02', CAST(N'2019-12-02T00:00:00.000' AS DateTime), N'Monday', N'mprexqkmmqqxuvi', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1685, N'Room02', N'SLOT03', CAST(N'2019-12-02T00:00:00.000' AS DateTime), N'Monday', N'fzaziptnlkfxuls', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1686, N'Room04', N'SLOT03', CAST(N'2019-12-02T00:00:00.000' AS DateTime), N'Monday', N'tuwaorvcgtvpcxq', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1687, N'Room03', N'SLOT04', CAST(N'2019-12-02T00:00:00.000' AS DateTime), N'Monday', N'zwoqousrcerukbi', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1688, N'Room02', N'SLOT04', CAST(N'2019-12-02T00:00:00.000' AS DateTime), N'Monday', N'ezfgowpfxqmasea', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1689, N'Room03', N'SLOT05', CAST(N'2019-12-02T00:00:00.000' AS DateTime), N'Monday', N'bmgszyvvswxeayd', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1690, N'Room02', N'SLOT05', CAST(N'2019-12-02T00:00:00.000' AS DateTime), N'Monday', N'goxizasjohtkibv', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1691, N'Room01', N'SLOT06', CAST(N'2019-12-02T00:00:00.000' AS DateTime), N'Monday', N'czkntdlxkvucqwi', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1692, N'Room03', N'SLOT06', CAST(N'2019-12-02T00:00:00.000' AS DateTime), N'Monday', N'vjujfctyjpjcqns', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1693, N'Room03', N'SLOT07', CAST(N'2019-12-02T00:00:00.000' AS DateTime), N'Monday', N'allzfernfbfhyqk', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1694, N'Room01', N'SLOT07', CAST(N'2019-12-02T00:00:00.000' AS DateTime), N'Monday', N'focpfhobambmgud', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1695, N'Room03', N'SLOT01', CAST(N'2019-12-03T00:00:00.000' AS DateTime), N'Tuesday', N'kquffjlpwxxroxv', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1696, N'Room02', N'SLOT01', CAST(N'2019-12-03T00:00:00.000' AS DateTime), N'Tuesday', N'dadaqiurvsmroof', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1697, N'Room02', N'SLOT02', CAST(N'2019-12-03T00:00:00.000' AS DateTime), N'Tuesday', N'ylqgklmergnjwjs', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1698, N'Room04', N'SLOT02', CAST(N'2019-12-03T00:00:00.000' AS DateTime), N'Tuesday', N'rvzbwkvgqacjwad', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1699, N'Room02', N'SLOT03', CAST(N'2019-12-03T00:00:00.000' AS DateTime), N'Tuesday', N'wxrrwmsummyoedv', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1700, N'Room01', N'SLOT03', CAST(N'2019-12-03T00:00:00.000' AS DateTime), N'Tuesday', N'baihwppiixuumgn', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1701, N'Room01', N'SLOT04', CAST(N'2019-12-03T00:00:00.000' AS DateTime), N'Tuesday', N'gcaxwrnxdipzukf', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1702, N'Room03', N'SLOT04', CAST(N'2019-12-03T00:00:00.000' AS DateTime), N'Tuesday', N'zmjthqvycdeyuap', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1703, N'Room03', N'SLOT05', CAST(N'2019-12-03T00:00:00.000' AS DateTime), N'Tuesday', N'epbjhssnyoaedei', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1704, N'Room04', N'SLOT05', CAST(N'2019-12-03T00:00:00.000' AS DateTime), N'Tuesday', N'jrszhvqbuzwjlha', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1705, N'Room02', N'SLOT06', CAST(N'2019-12-03T00:00:00.000' AS DateTime), N'Tuesday', N'oujphxnppksotks', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1706, N'Room04', N'SLOT06', CAST(N'2019-12-03T00:00:00.000' AS DateTime), N'Tuesday', N'hetltwwrofhotbc', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1707, N'Room03', N'SLOT07', CAST(N'2019-12-03T00:00:00.000' AS DateTime), N'Tuesday', N'mhkbtztfkqdtbfu', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1708, N'Room04', N'SLOT07', CAST(N'2019-12-03T00:00:00.000' AS DateTime), N'Tuesday', N'rjcrsbqtgcyyjin', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1709, N'Room01', N'SLOT01', CAST(N'2019-12-04T00:00:00.000' AS DateTime), N'Wednesday', N'wmthsdnibnudrlf', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1710, N'Room04', N'SLOT01', CAST(N'2019-12-04T00:00:00.000' AS DateTime), N'Wednesday', N'pwdcecwjaijdrcp', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1711, N'Room03', N'SLOT02', CAST(N'2019-12-04T00:00:00.000' AS DateTime), N'Wednesday', N'uyuseftxwtfizfh', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1712, N'Room04', N'SLOT02', CAST(N'2019-12-04T00:00:00.000' AS DateTime), N'Wednesday', N'zbliehqmsebohja', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1713, N'Room03', N'SLOT03', CAST(N'2019-12-04T00:00:00.000' AS DateTime), N'Wednesday', N'eddyejnanpxtpms', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1714, N'Room02', N'SLOT03', CAST(N'2019-12-04T00:00:00.000' AS DateTime), N'Wednesday', N'xnmupjwcmkmspdc', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1715, N'Room02', N'SLOT04', CAST(N'2019-12-04T00:00:00.000' AS DateTime), N'Wednesday', N'cqekpltqivhyxgu', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1716, N'Room04', N'SLOT04', CAST(N'2019-12-04T00:00:00.000' AS DateTime), N'Wednesday', N'hsvapnqeehddfkm', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1717, N'Room04', N'SLOT05', CAST(N'2019-12-04T00:00:00.000' AS DateTime), N'Wednesday', N'mvmqpqntaszinnf', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1718, N'Room03', N'SLOT05', CAST(N'2019-12-04T00:00:00.000' AS DateTime), N'Wednesday', N'ffwmbpwuynoinep', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1719, N'Room03', N'SLOT06', CAST(N'2019-12-04T00:00:00.000' AS DateTime), N'Wednesday', N'khncbrtiuyknvhh', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1720, N'Room02', N'SLOT06', CAST(N'2019-12-04T00:00:00.000' AS DateTime), N'Wednesday', N'pkfsatqxqjfsdkz', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1721, N'Room01', N'SLOT07', CAST(N'2019-12-04T00:00:00.000' AS DateTime), N'Wednesday', N'umwiawnlmubxmos', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1722, N'Room03', N'SLOT07', CAST(N'2019-12-04T00:00:00.000' AS DateTime), N'Wednesday', N'mwgdmvwnlpqxmfc', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1723, N'Room03', N'SLOT01', CAST(N'2019-12-05T00:00:00.000' AS DateTime), N'Thursday', N'szxtmxtbgamcuiu', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1724, N'Room01', N'SLOT01', CAST(N'2019-12-05T00:00:00.000' AS DateTime), N'Thursday', N'xbpkmarpclihclm', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1725, N'Room03', N'SLOT02', CAST(N'2019-12-05T00:00:00.000' AS DateTime), N'Thursday', N'cegamcoeyxenkpe', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1726, N'Room04', N'SLOT02', CAST(N'2019-12-05T00:00:00.000' AS DateTime), N'Thursday', N'uopvxbwfxrtmkfp', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1727, N'Room01', N'SLOT03', CAST(N'2019-12-05T00:00:00.000' AS DateTime), N'Thursday', N'zrhlxdutsdossjh', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1728, N'Room03', N'SLOT03', CAST(N'2019-12-05T00:00:00.000' AS DateTime), N'Thursday', N'etybxgriookxamz', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1729, N'Room02', N'SLOT04', CAST(N'2019-12-05T00:00:00.000' AS DateTime), N'Thursday', N'toucdisxjxbpiyx', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1730, N'Room01', N'SLOT04', CAST(N'2019-12-05T00:00:00.000' AS DateTime), N'Thursday', N'yqmsdkplfiwuqbp', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1731, N'Room01', N'SLOT05', CAST(N'2019-12-05T00:00:00.000' AS DateTime), N'Thursday', N'dtdidmmabtszyfh', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1732, N'Room04', N'SLOT05', CAST(N'2019-12-05T00:00:00.000' AS DateTime), N'Thursday', N'wdneolvbaohzyvr', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1733, N'Room02', N'SLOT06', CAST(N'2019-12-05T00:00:00.000' AS DateTime), N'Thursday', N'bfeuoospvzdegzj', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1734, N'Room01', N'SLOT06', CAST(N'2019-12-05T00:00:00.000' AS DateTime), N'Thursday', N'givkoqqerkzjocc', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1735, N'Room04', N'SLOT07', CAST(N'2019-12-05T00:00:00.000' AS DateTime), N'Thursday', N'lknaotnsnvvpwfu', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1736, N'Room03', N'SLOT07', CAST(N'2019-12-05T00:00:00.000' AS DateTime), N'Thursday', N'euwvasvtmqjowwe', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1737, N'Room02', N'SLOT01', CAST(N'2019-12-06T00:00:00.000' AS DateTime), N'Friday', N'jxolzutihbfteaw', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1738, N'Room03', N'SLOT01', CAST(N'2019-12-06T00:00:00.000' AS DateTime), N'Friday', N'ozfbzwqwdnbzndp', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1739, N'Room03', N'SLOT02', CAST(N'2019-12-06T00:00:00.000' AS DateTime), N'Friday', N'tcxrzznkzyxevgh', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1740, N'Room02', N'SLOT02', CAST(N'2019-12-06T00:00:00.000' AS DateTime), N'Friday', N'lmgnlywmytmevxr', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1741, N'Room01', N'SLOT03', CAST(N'2019-12-06T00:00:00.000' AS DateTime), N'Friday', N'roydlataueijdaj', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1742, N'Room03', N'SLOT03', CAST(N'2019-12-06T00:00:00.000' AS DateTime), N'Friday', N'wrptldqpppdoleb', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1743, N'Room01', N'SLOT04', CAST(N'2019-12-06T00:00:00.000' AS DateTime), N'Friday', N'btgjlfndlaztthu', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1744, N'Room02', N'SLOT04', CAST(N'2019-12-06T00:00:00.000' AS DateTime), N'Friday', N'teqfwewekvottye', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1745, N'Room02', N'SLOT05', CAST(N'2019-12-06T00:00:00.000' AS DateTime), N'Friday', N'yghvwgttggkybbw', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1746, N'Room01', N'SLOT05', CAST(N'2019-12-06T00:00:00.000' AS DateTime), N'Friday', N'djzlwjqhbsgdjfo', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1747, N'Room04', N'SLOT06', CAST(N'2019-12-06T00:00:00.000' AS DateTime), N'Friday', N'jlqbwlnvxdcjrih', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1748, N'Room03', N'SLOT06', CAST(N'2019-12-06T00:00:00.000' AS DateTime), N'Friday', N'bvawikwxwyrirzr', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1749, N'Room01', N'SLOT07', CAST(N'2019-12-06T00:00:00.000' AS DateTime), N'Friday', N'gyrmhmtlsjmnzcj', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1750, N'Room02', N'SLOT07', CAST(N'2019-12-06T00:00:00.000' AS DateTime), N'Friday', N'laidhpqanuithfb', 0, N'Teaching', N'Just Create', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1751, N'Room02', N'SLOT01', CAST(N'2019-12-01T00:00:00.000' AS DateTime), N'Sunday', N'jopyrhtbnhoyeee', 0, N'Teaching', N'Disable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1752, N'Room01', N'SLOT01', CAST(N'2019-12-01T00:00:00.000' AS DateTime), N'Sunday', N'kbttlmjdfglwvcj', 0, N'Teaching', N'Disable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1753, N'Room02', N'SLOT05', CAST(N'2019-12-01T00:00:00.000' AS DateTime), N'Sunday', N'dlcoxlsfebavutt', 0, N'Teaching', N'Disable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1754, N'Room03', N'SLOT05', CAST(N'2019-12-01T00:00:00.000' AS DateTime), N'Sunday', N'iouexnptamwadxm', 0, N'Teaching', N'Disable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1755, N'Room02', N'SLOT04', CAST(N'2019-12-03T00:00:00.000' AS DateTime), N'Tuesday', N'nqluxqmhwxsglae', 0, N'Teaching', N'Disable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1756, N'Room04', N'SLOT04', CAST(N'2019-12-03T00:00:00.000' AS DateTime), N'Tuesday', N'gnylcullmredbpt', 0, N'Teaching', N'Disable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1757, N'Room01', N'SLOT02', CAST(N'2019-12-07T00:00:00.000' AS DateTime), N'Saturday', N'jcrnoyopdiknrno', 0, N'Teaching', N'Disable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1758, N'Room04', N'SLOT02', CAST(N'2019-12-07T00:00:00.000' AS DateTime), N'Saturday', N'yxnouzpeyrbfzyl', 0, N'Teaching', N'Disable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1759, N'Room04', N'SLOT05', CAST(N'2019-12-07T00:00:00.000' AS DateTime), N'Saturday', N'dzeeucnsucxkhce', 0, N'Teaching', N'Disable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1760, N'Room01', N'SLOT05', CAST(N'2019-12-07T00:00:00.000' AS DateTime), N'Saturday', N'goxffgqxktduxzy', 0, N'Teaching', N'Disable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1761, N'Room03', N'SLOT02', CAST(N'2019-12-01T00:00:00.000' AS DateTime), N'Sunday', N'vukvlcbxmfuzuim', 0, N'Teaching', N'Disable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1762, N'Room02', N'SLOT02', CAST(N'2019-12-01T00:00:00.000' AS DateTime), N'Sunday', N'kogwrdcmhokrcuj', 0, N'Teaching', N'Disable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1763, N'Room02', N'SLOT03', CAST(N'2019-12-01T00:00:00.000' AS DateTime), N'Sunday', N'prymrgzbczgxkxb', 0, N'Teaching', N'Disable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1764, N'Room04', N'SLOT03', CAST(N'2019-12-01T00:00:00.000' AS DateTime), N'Sunday', N'hbhidficbuvwkom', 0, N'Teaching', N'Disable', NULL)
GO
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1765, N'Room02', N'SLOT04', CAST(N'2019-12-01T00:00:00.000' AS DateTime), N'Sunday', N'mezydhfrxfqbsse', 0, N'Teaching', N'Disable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1766, N'Room04', N'SLOT04', CAST(N'2019-12-01T00:00:00.000' AS DateTime), N'Sunday', N'rgqockcftqmhbvw', 0, N'Teaching', N'Disable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1767, N'Room01', N'SLOT06', CAST(N'2019-12-01T00:00:00.000' AS DateTime), N'Sunday', N'wjhecmztpcimjyo', 0, N'Teaching', N'Disable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1768, N'Room04', N'SLOT06', CAST(N'2019-12-01T00:00:00.000' AS DateTime), N'Sunday', N'ptrzolivowxmjpz', 0, N'Teaching', N'Disable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1769, N'Room04', N'SLOT07', CAST(N'2019-12-01T00:00:00.000' AS DateTime), N'Sunday', N'uviponfjjitrrsr', 0, N'Teaching', N'Disable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1770, N'Room03', N'SLOT07', CAST(N'2019-12-01T00:00:00.000' AS DateTime), N'Sunday', N'jqequphyeqjjzeo', 0, N'Teaching', N'Disable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1771, N'Room02', N'SLOT07', CAST(N'2019-12-02T00:00:00.000' AS DateTime), N'Monday', N'oswgtsemabfohig', 0, N'Teaching', N'Disable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1772, N'Room04', N'SLOT07', CAST(N'2019-12-02T00:00:00.000' AS DateTime), N'Monday', N'tvnwtubbwnbtply', 0, N'Teaching', N'Disable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1773, N'Room02', N'SLOT05', CAST(N'2019-12-03T00:00:00.000' AS DateTime), N'Tuesday', N'lfxsftkcvhqtpcj', 0, N'Teaching', N'Disable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1774, N'Room01', N'SLOT05', CAST(N'2019-12-03T00:00:00.000' AS DateTime), N'Tuesday', N'msbnzyaengnrfao', 0, N'Teaching', N'Disable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1775, N'Room01', N'SLOT06', CAST(N'2019-12-03T00:00:00.000' AS DateTime), N'Tuesday', N'wkgyfyefmehdfit', 0, N'Teaching', N'Disable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1776, N'Room03', N'SLOT06', CAST(N'2019-12-03T00:00:00.000' AS DateTime), N'Tuesday', N'keczlaguhnyvnur', 0, N'Teaching', N'Disable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1777, N'Room01', N'SLOT02', CAST(N'2019-12-04T00:00:00.000' AS DateTime), N'Wednesday', N'phtpkcdidytbvxj', 0, N'Teaching', N'Disable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1778, N'Room02', N'SLOT02', CAST(N'2019-12-04T00:00:00.000' AS DateTime), N'Wednesday', N'ujkfkeaxzjpgdbb', 0, N'Teaching', N'Disable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1779, N'Room04', N'SLOT03', CAST(N'2019-12-04T00:00:00.000' AS DateTime), N'Wednesday', N'ntuawejyyeefdsl', 0, N'Teaching', N'Disable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1780, N'Room01', N'SLOT03', CAST(N'2019-12-04T00:00:00.000' AS DateTime), N'Wednesday', N'swlqwggntpallvd', 0, N'Teaching', N'Disable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1781, N'Room03', N'SLOT04', CAST(N'2019-12-04T00:00:00.000' AS DateTime), N'Wednesday', N'xydgwidbpawqtyw', 0, N'Teaching', N'Disable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1782, N'Room01', N'SLOT04', CAST(N'2019-12-04T00:00:00.000' AS DateTime), N'Wednesday', N'cbuwwlapllsvbco', 0, N'Teaching', N'Disable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1783, N'Room04', N'SLOT01', CAST(N'2019-12-05T00:00:00.000' AS DateTime), N'Thursday', N'vleshkjrkghvbsy', 0, N'Teaching', N'Disable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1784, N'Room02', N'SLOT01', CAST(N'2019-12-05T00:00:00.000' AS DateTime), N'Thursday', N'aovihmgfgrcakwq', 0, N'Teaching', N'Disable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1785, N'Room02', N'SLOT02', CAST(N'2019-12-05T00:00:00.000' AS DateTime), N'Thursday', N'oirjnoiubatssio', 0, N'Teaching', N'Disable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1786, N'Room01', N'SLOT02', CAST(N'2019-12-05T00:00:00.000' AS DateTime), N'Thursday', N'tljznqfiwloxalg', 0, N'Teaching', N'Disable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1787, N'Room01', N'SLOT01', CAST(N'2019-12-06T00:00:00.000' AS DateTime), N'Friday', N'ynapntcxswkdioy', 0, N'Teaching', N'Disable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1788, N'Room04', N'SLOT01', CAST(N'2019-12-06T00:00:00.000' AS DateTime), N'Friday', N'rxkkyslyrrzcifi', 0, N'Teaching', N'Disable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1789, N'Room04', N'SLOT02', CAST(N'2019-12-06T00:00:00.000' AS DateTime), N'Friday', N'wabbyuinncvhqib', 0, N'Teaching', N'Disable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1790, N'Room01', N'SLOT02', CAST(N'2019-12-06T00:00:00.000' AS DateTime), N'Friday', N'bcsryxfbjornymt', 0, N'Teaching', N'Disable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1791, N'Room04', N'SLOT03', CAST(N'2019-12-06T00:00:00.000' AS DateTime), N'Friday', N'gfkhyzcpeznsgpl', 0, N'Teaching', N'Disable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1792, N'Room02', N'SLOT03', CAST(N'2019-12-06T00:00:00.000' AS DateTime), N'Friday', N'zptckylrducrggv', 0, N'Teaching', N'Disable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1793, N'Room03', N'SLOT04', CAST(N'2019-12-06T00:00:00.000' AS DateTime), N'Friday', N'erlskaifzfxxojo', 0, N'Teaching', N'Disable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1794, N'Room04', N'SLOT04', CAST(N'2019-12-06T00:00:00.000' AS DateTime), N'Friday', N'jucijdftvqtcwng', 0, N'Teaching', N'Disable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1795, N'Room03', N'SLOT05', CAST(N'2019-12-06T00:00:00.000' AS DateTime), N'Friday', N'owtyjfciqbpheqy', 0, N'Teaching', N'Disable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1796, N'Room04', N'SLOT05', CAST(N'2019-12-06T00:00:00.000' AS DateTime), N'Friday', N'hgduveljpwehehi', 0, N'Teaching', N'Disable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1797, N'Room02', N'SLOT06', CAST(N'2019-12-06T00:00:00.000' AS DateTime), N'Friday', N'ithppjblhvbfufn', 0, N'Teaching', N'Disable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1798, N'Room01', N'SLOT06', CAST(N'2019-12-06T00:00:00.000' AS DateTime), N'Friday', N'aerlbikngqqeuwy', 0, N'Teaching', N'Disable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1799, N'Room04', N'SLOT07', CAST(N'2019-12-06T00:00:00.000' AS DateTime), N'Friday', N'fgibblhbcbmjczq', 0, N'Teaching', N'Disable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1800, N'Room03', N'SLOT07', CAST(N'2019-12-06T00:00:00.000' AS DateTime), N'Friday', N'kjzranepymipkci', 0, N'Teaching', N'Disable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1801, N'Room03', N'SLOT05', CAST(N'2019-12-07T00:00:00.000' AS DateTime), N'Saturday', N'plrhaqbetydutga', 0, N'Teaching', N'Disable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1802, N'Room02', N'SLOT05', CAST(N'2019-12-07T00:00:00.000' AS DateTime), N'Saturday', N'ivacmpkfsssttxl', 0, N'Teaching', N'Disable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1803, N'Room04', N'SLOT06', CAST(N'2019-12-07T00:00:00.000' AS DateTime), N'Saturday', N'nyssmrhtoeozbad', 0, N'Teaching', N'Disable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1804, N'Room02', N'SLOT06', CAST(N'2019-12-07T00:00:00.000' AS DateTime), N'Saturday', N'sajimteikpkejdv', 0, N'Teaching', N'Disable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1805, N'Room01', N'SLOT07', CAST(N'2019-12-07T00:00:00.000' AS DateTime), N'Saturday', N'xdazmwbwfagjrhn', 0, N'Teaching', N'Disable', NULL)
INSERT [dbo].[UsingRoom] ([UsingRoomID], [RoomID], [SlotID], [Date], [DayOfWeek], [ClassID], [QuatityRegister], [UseFor], [Status], [Notes]) VALUES (1806, N'Room03', N'SLOT07', CAST(N'2019-12-07T00:00:00.000' AS DateTime), N'Saturday', N'qnkuxvkxevvjrxy', 0, N'Teaching', N'Disable', NULL)
SET IDENTITY_INSERT [dbo].[UsingRoom] OFF
ALTER TABLE [dbo].[Authentication]  WITH CHECK ADD  CONSTRAINT [FK_Authentication_People] FOREIGN KEY([PeopleID])
REFERENCES [dbo].[People] ([PeopleID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Authentication] CHECK CONSTRAINT [FK_Authentication_People]
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_Lessons] FOREIGN KEY([LessonID])
REFERENCES [dbo].[Lessons] ([LessonID])
GO
ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [FK_Class_Lessons]
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_People1] FOREIGN KEY([PeopleID])
REFERENCES [dbo].[People] ([PeopleID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [FK_Class_People1]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Content] FOREIGN KEY([content_id])
REFERENCES [dbo].[Content] ([content_id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Content]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_People] FOREIGN KEY([PeopleID])
REFERENCES [dbo].[People] ([PeopleID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_People]
GO
ALTER TABLE [dbo].[Content]  WITH CHECK ADD  CONSTRAINT [FK_Content_People] FOREIGN KEY([PeopleID])
REFERENCES [dbo].[People] ([PeopleID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Content] CHECK CONSTRAINT [FK_Content_People]
GO
ALTER TABLE [dbo].[Content]  WITH CHECK ADD  CONSTRAINT [FK_Content_TopicPost] FOREIGN KEY([TopicPostID])
REFERENCES [dbo].[TopicPost] ([TopicPostID])
GO
ALTER TABLE [dbo].[Content] CHECK CONSTRAINT [FK_Content_TopicPost]
GO
ALTER TABLE [dbo].[LecturerTime]  WITH CHECK ADD  CONSTRAINT [FK_LecturerTime_People] FOREIGN KEY([LecturerID])
REFERENCES [dbo].[People] ([PeopleID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LecturerTime] CHECK CONSTRAINT [FK_LecturerTime_People]
GO
ALTER TABLE [dbo].[Lessons]  WITH CHECK ADD  CONSTRAINT [FK_Lessons_Topic] FOREIGN KEY([TopicID])
REFERENCES [dbo].[Topic] ([TopicID])
GO
ALTER TABLE [dbo].[Lessons] CHECK CONSTRAINT [FK_Lessons_Topic]
GO
ALTER TABLE [dbo].[People]  WITH CHECK ADD  CONSTRAINT [FK_People_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[People] CHECK CONSTRAINT [FK_People_Role]
GO
ALTER TABLE [dbo].[QuantityAndAttendance]  WITH CHECK ADD  CONSTRAINT [FK_ClassAndStudent_People] FOREIGN KEY([PeopleID])
REFERENCES [dbo].[People] ([PeopleID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[QuantityAndAttendance] CHECK CONSTRAINT [FK_ClassAndStudent_People]
GO
ALTER TABLE [dbo].[QuantityAndAttendance]  WITH CHECK ADD  CONSTRAINT [FK_QuantityAndAttendance_UsingRoom] FOREIGN KEY([UsingRoomID])
REFERENCES [dbo].[UsingRoom] ([UsingRoomID])
GO
ALTER TABLE [dbo].[QuantityAndAttendance] CHECK CONSTRAINT [FK_QuantityAndAttendance_UsingRoom]
GO
ALTER TABLE [dbo].[StudentTime]  WITH CHECK ADD  CONSTRAINT [FK_StudentTime_People1] FOREIGN KEY([StudentID])
REFERENCES [dbo].[People] ([PeopleID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StudentTime] CHECK CONSTRAINT [FK_StudentTime_People1]
GO
ALTER TABLE [dbo].[Topic]  WITH CHECK ADD  CONSTRAINT [FK_Topic_Skill] FOREIGN KEY([SkillID])
REFERENCES [dbo].[Skill] ([SkilID])
GO
ALTER TABLE [dbo].[Topic] CHECK CONSTRAINT [FK_Topic_Skill]
GO
ALTER TABLE [dbo].[TopicPost]  WITH CHECK ADD  CONSTRAINT [FK_TopicPost_Catalogue] FOREIGN KEY([CatalogueID])
REFERENCES [dbo].[Catalogue] ([Catalogue])
GO
ALTER TABLE [dbo].[TopicPost] CHECK CONSTRAINT [FK_TopicPost_Catalogue]
GO
ALTER TABLE [dbo].[UsingRoom]  WITH CHECK ADD  CONSTRAINT [FK_UsingRoom_Class] FOREIGN KEY([ClassID])
REFERENCES [dbo].[Class] ([ClassID])
GO
ALTER TABLE [dbo].[UsingRoom] CHECK CONSTRAINT [FK_UsingRoom_Class]
GO
ALTER TABLE [dbo].[UsingRoom]  WITH CHECK ADD  CONSTRAINT [FK_UsingRoom_Room] FOREIGN KEY([RoomID])
REFERENCES [dbo].[Room] ([RommID])
GO
ALTER TABLE [dbo].[UsingRoom] CHECK CONSTRAINT [FK_UsingRoom_Room]
GO
ALTER TABLE [dbo].[UsingRoom]  WITH CHECK ADD  CONSTRAINT [FK_UsingRoom_Slot] FOREIGN KEY([SlotID])
REFERENCES [dbo].[Slot] ([SlotID])
GO
ALTER TABLE [dbo].[UsingRoom] CHECK CONSTRAINT [FK_UsingRoom_Slot]
GO
USE [master]
GO
ALTER DATABASE [TUProject] SET  READ_WRITE 
GO
