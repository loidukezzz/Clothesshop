USE [master]
GO
/****** Object:  Database [CLOTHESSHOP]    Script Date: 1/31/2022 2:21:54 PM ******/
CREATE DATABASE [CLOTHESSHOP]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CLOTHESSHOP', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\CLOTHESSHOP.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CLOTHESSHOP_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\CLOTHESSHOP_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CLOTHESSHOP] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CLOTHESSHOP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CLOTHESSHOP] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CLOTHESSHOP] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CLOTHESSHOP] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CLOTHESSHOP] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CLOTHESSHOP] SET ARITHABORT OFF 
GO
ALTER DATABASE [CLOTHESSHOP] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [CLOTHESSHOP] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CLOTHESSHOP] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CLOTHESSHOP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CLOTHESSHOP] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CLOTHESSHOP] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CLOTHESSHOP] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CLOTHESSHOP] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CLOTHESSHOP] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CLOTHESSHOP] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CLOTHESSHOP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CLOTHESSHOP] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CLOTHESSHOP] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CLOTHESSHOP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CLOTHESSHOP] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CLOTHESSHOP] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [CLOTHESSHOP] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CLOTHESSHOP] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CLOTHESSHOP] SET  MULTI_USER 
GO
ALTER DATABASE [CLOTHESSHOP] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CLOTHESSHOP] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CLOTHESSHOP] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CLOTHESSHOP] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [CLOTHESSHOP] SET DELAYED_DURABILITY = DISABLED 
GO
USE [CLOTHESSHOP]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 1/31/2022 2:21:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 1/31/2022 2:21:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Category_Id] [int] IDENTITY(1,1) NOT NULL,
	[Category_Name] [nvarchar](100) NOT NULL,
	[Slug] [nvarchar](max) NULL,
	[Parent_Id] [int] NULL,
	[Image] [nvarchar](max) NULL,
	[Orders] [int] NULL,
	[Decription] [nvarchar](2000) NOT NULL,
	[Metakey] [nvarchar](max) NOT NULL,
	[Top_Category] [nvarchar](max) NULL,
	[Created_By] [int] NOT NULL,
	[Created_At] [datetime] NULL,
	[Updated_By] [int] NOT NULL,
	[Updated_At] [datetime] NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Category] PRIMARY KEY CLUSTERED 
(
	[Category_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Config]    Script Date: 1/31/2022 2:21:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Config](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.Config] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Contact]    Script Date: 1/31/2022 2:21:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[User_Id] [int] NOT NULL,
	[Full_Name] [nvarchar](100) NOT NULL,
	[Phone] [nvarchar](20) NULL,
	[Email] [nvarchar](max) NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Detail] [nvarchar](max) NOT NULL,
	[Created_By] [int] NULL,
	[Created_At] [datetime] NULL,
	[Updated_By] [int] NOT NULL,
	[Updated_At] [datetime] NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Contact] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CouponCode]    Script Date: 1/31/2022 2:21:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CouponCode](
	[Coupon_Code_Id] [int] IDENTITY(1,1) NOT NULL,
	[Coupon_Code] [nvarchar](50) NOT NULL,
	[Discount_Percent] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Created_By] [int] NOT NULL,
	[Created_At] [datetime] NULL,
	[Updated_By] [int] NOT NULL,
	[Updated_At] [datetime] NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_dbo.CouponCode] PRIMARY KEY CLUSTERED 
(
	[Coupon_Code_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Decentralization]    Script Date: 1/31/2022 2:21:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Decentralization](
	[Decentralization_Id] [int] IDENTITY(1,1) NOT NULL,
	[Decentralization] [nvarchar](max) NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Decentralization] PRIMARY KEY CLUSTERED 
(
	[Decentralization_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Distributor]    Script Date: 1/31/2022 2:21:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Distributor](
	[Distributor_Id] [int] IDENTITY(1,1) NOT NULL,
	[Full_Name] [nvarchar](max) NOT NULL,
	[Phone] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Url_Site] [nvarchar](max) NOT NULL,
	[Import_Quantity] [int] NOT NULL,
	[Sum_Import_Price] [decimal](18, 2) NOT NULL,
	[Import_Day] [datetime] NOT NULL,
	[Created_By] [int] NOT NULL,
	[Created_At] [datetime] NULL,
	[Updated_By] [int] NOT NULL,
	[Updated_At] [datetime] NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Distributor] PRIMARY KEY CLUSTERED 
(
	[Distributor_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Infomation]    Script Date: 1/31/2022 2:21:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Infomation](
	[Infomation_Id] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](max) NULL,
	[Size] [nvarchar](max) NULL,
	[Color] [nvarchar](max) NULL,
	[Quantity_Available] [int] NOT NULL,
	[Product_Id] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Infomation] PRIMARY KEY CLUSTERED 
(
	[Infomation_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Link]    Script Date: 1/31/2022 2:21:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Link](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Slug] [nvarchar](max) NOT NULL,
	[TypeLink] [nvarchar](max) NOT NULL,
	[Table_Id] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Link] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Menu]    Script Date: 1/31/2022 2:21:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[Menu_Id] [int] IDENTITY(1,1) NOT NULL,
	[Menu_Name] [nvarchar](100) NOT NULL,
	[Link] [nvarchar](max) NULL,
	[Table_Id] [int] NOT NULL,
	[Type_Menu] [nvarchar](max) NULL,
	[Position] [nvarchar](max) NULL,
	[Parent_Id] [int] NOT NULL,
	[Orders] [int] NULL,
	[Created_By] [int] NOT NULL,
	[Created_At] [datetime] NULL,
	[Updated_By] [int] NOT NULL,
	[Updated_At] [datetime] NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Menu] PRIMARY KEY CLUSTERED 
(
	[Menu_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order]    Script Date: 1/31/2022 2:21:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Order_Id] [int] IDENTITY(1,1) NOT NULL,
	[User_Id] [int] NOT NULL,
	[Receiver_Address] [nvarchar](max) NULL,
	[Receiver_Phone] [nvarchar](max) NULL,
	[Receiver_Email] [nvarchar](max) NULL,
	[Note] [nvarchar](max) NULL,
	[Created_At] [datetime] NULL,
	[Updated_By] [int] NOT NULL,
	[Updated_At] [datetime] NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Order] PRIMARY KEY CLUSTERED 
(
	[Order_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 1/31/2022 2:21:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Order_Id] [int] NOT NULL,
	[Product_Id] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_dbo.OrderDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Post]    Script Date: 1/31/2022 2:21:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Top_Id] [int] NOT NULL,
	[Slug] [nvarchar](max) NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Detail] [nvarchar](max) NOT NULL,
	[Image] [nvarchar](max) NOT NULL,
	[Post_Type] [nvarchar](max) NULL,
	[Metakey] [nvarchar](max) NOT NULL,
	[Decription] [nvarchar](max) NOT NULL,
	[Created_By] [int] NOT NULL,
	[Created_At] [datetime] NULL,
	[Updated_By] [int] NOT NULL,
	[Updated_At] [datetime] NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Post] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 1/31/2022 2:21:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Product_Id] [int] IDENTITY(1,1) NOT NULL,
	[Product_Name] [nvarchar](100) NOT NULL,
	[Slug] [nvarchar](max) NULL,
	[Category_Id] [int] NOT NULL,
	[Topic_Id] [int] NOT NULL,
	[Distributor_Id] [int] NOT NULL,
	[Price] [real] NOT NULL,
	[Decription] [nvarchar](max) NOT NULL,
	[Preferential] [nvarchar](max) NOT NULL,
	[Discount_percent] [int] NULL,
	[Sales_Volume] [int] NULL,
	[Tag] [nvarchar](max) NULL,
	[Texture] [nvarchar](max) NULL,
	[Import_Day] [datetime] NOT NULL,
	[Created_By] [int] NOT NULL,
	[Created_At] [datetime] NULL,
	[Updated_By] [int] NOT NULL,
	[Updated_At] [datetime] NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Product] PRIMARY KEY CLUSTERED 
(
	[Product_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SaleOff]    Script Date: 1/31/2022 2:21:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SaleOff](
	[SaleOff_Id] [int] IDENTITY(1,1) NOT NULL,
	[Sum_Price_To_Sale] [int] NOT NULL,
	[Created_By] [int] NOT NULL,
	[Created_At] [datetime] NULL,
	[Updated_By] [int] NOT NULL,
	[Updated_At] [datetime] NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_dbo.SaleOff] PRIMARY KEY CLUSTERED 
(
	[SaleOff_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ShippingUnit]    Script Date: 1/31/2022 2:21:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShippingUnit](
	[Shipping_Unit_Id] [int] IDENTITY(1,1) NOT NULL,
	[Shipping_Unit_Name] [nvarchar](50) NOT NULL,
	[Phone_Number_Shipping_Unit] [int] NOT NULL,
	[Shipping_Price] [real] NOT NULL,
	[Created_By] [int] NOT NULL,
	[Created_At] [datetime] NULL,
	[Updated_By] [int] NOT NULL,
	[Updated_At] [datetime] NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_dbo.ShippingUnit] PRIMARY KEY CLUSTERED 
(
	[Shipping_Unit_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Slider]    Script Date: 1/31/2022 2:21:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slider](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Url] [nvarchar](max) NOT NULL,
	[Image] [nvarchar](max) NULL,
	[Orders] [int] NULL,
	[Created_By] [int] NOT NULL,
	[Created_At] [datetime] NULL,
	[Updated_By] [int] NOT NULL,
	[Updated_At] [datetime] NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Slider] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Topic]    Script Date: 1/31/2022 2:21:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topic](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Slug] [nvarchar](max) NULL,
	[Parent_Id] [int] NULL,
	[Orders] [int] NULL,
	[Tag] [nvarchar](max) NULL,
	[Decription] [nvarchar](max) NOT NULL,
	[Created_By] [int] NOT NULL,
	[Created_At] [datetime] NULL,
	[Updated_By] [int] NOT NULL,
	[Updated_At] [datetime] NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Topic] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 1/31/2022 2:21:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[User_Id] [int] IDENTITY(1,1) NOT NULL,
	[Full_Name] [nvarchar](100) NOT NULL,
	[Phone_Number] [nvarchar](15) NOT NULL,
	[Photo] [nvarchar](max) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Zip_Code] [int] NOT NULL,
	[Address] [nvarchar](255) NOT NULL,
	[Decentralization_Id] [int] NULL,
	[Created_By] [int] NULL,
	[Created_At] [datetime] NULL,
	[Updated_By] [int] NULL,
	[Updated_At] [datetime] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_dbo.User] PRIMARY KEY CLUSTERED 
(
	[User_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WishList]    Script Date: 1/31/2022 2:21:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WishList](
	[WishList_Id] [int] IDENTITY(1,1) NOT NULL,
	[User_Id] [int] NOT NULL,
	[Product_Id] [int] NOT NULL,
 CONSTRAINT [PK_dbo.WishList] PRIMARY KEY CLUSTERED 
(
	[WishList_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Category_Id], [Category_Name], [Slug], [Parent_Id], [Image], [Orders], [Decription], [Metakey], [Top_Category], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (2, N'Thời trang nữ', N'thoi-trang-nu', 0, N'category-1.jpg', 1, N'woman', N'thoitrangnu', N'1', 1, CAST(N'2022-03-01 00:00:00.000' AS DateTime), 1, NULL, 1)
INSERT [dbo].[Category] ([Category_Id], [Category_Name], [Slug], [Parent_Id], [Image], [Orders], [Decription], [Metakey], [Top_Category], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (5, N'Thời trang nam', N'thoi-trang-nam', 0, N'category-2.jpg', 2, N'men', N'thoitrangnam', NULL, 1, CAST(N'2022-03-01 00:00:00.000' AS DateTime), 1, NULL, 1)
INSERT [dbo].[Category] ([Category_Id], [Category_Name], [Slug], [Parent_Id], [Image], [Orders], [Decription], [Metakey], [Top_Category], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (6, N'Thời trang trẻ em', N'thoi-trang-tre-em', 0, N'category-3.jpg', 3, N'kid', N'thoitrangtreem', NULL, 1, NULL, 1, NULL, 1)
INSERT [dbo].[Category] ([Category_Id], [Category_Name], [Slug], [Parent_Id], [Image], [Orders], [Decription], [Metakey], [Top_Category], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (7, N'Phụ kiện', N'phu-kien', 0, N'category-4.jpg', 4, N'accessories', N'phukien', NULL, 1, NULL, 1, NULL, 1)
INSERT [dbo].[Category] ([Category_Id], [Category_Name], [Slug], [Parent_Id], [Image], [Orders], [Decription], [Metakey], [Top_Category], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (9, N'Mỹ phẩm', N'my-pham', 0, N'category-5.jpg', 5, N'cosmetic', N'mypham', NULL, 1, NULL, 1, NULL, 1)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Infomation] ON 

INSERT [dbo].[Infomation] ([Infomation_Id], [Image], [Size], [Color], [Quantity_Available], [Product_Id]) VALUES (1, N'product-1.jpg', N'L', N'vang', 121, 1)
INSERT [dbo].[Infomation] ([Infomation_Id], [Image], [Size], [Color], [Quantity_Available], [Product_Id]) VALUES (2, N'product-2.jpg', N'XL', N'xanh', 121, 1)
INSERT [dbo].[Infomation] ([Infomation_Id], [Image], [Size], [Color], [Quantity_Available], [Product_Id]) VALUES (3, N'product-3.jpg', N'L', N'vang', 121, 2)
INSERT [dbo].[Infomation] ([Infomation_Id], [Image], [Size], [Color], [Quantity_Available], [Product_Id]) VALUES (4, N'product-3.jpg', N'L', N'do', 121, 2)
INSERT [dbo].[Infomation] ([Infomation_Id], [Image], [Size], [Color], [Quantity_Available], [Product_Id]) VALUES (5, N'product-1.jpg', N'M', N'tim', 121, 3)
INSERT [dbo].[Infomation] ([Infomation_Id], [Image], [Size], [Color], [Quantity_Available], [Product_Id]) VALUES (6, N'product-3.jpg', N'L', N'vang', 121, 3)
INSERT [dbo].[Infomation] ([Infomation_Id], [Image], [Size], [Color], [Quantity_Available], [Product_Id]) VALUES (7, N'product-2.jpg', N'XL', N'trang', 121, 4)
INSERT [dbo].[Infomation] ([Infomation_Id], [Image], [Size], [Color], [Quantity_Available], [Product_Id]) VALUES (8, N'product-1.jpg', N'L', N'vang', 121, 4)
INSERT [dbo].[Infomation] ([Infomation_Id], [Image], [Size], [Color], [Quantity_Available], [Product_Id]) VALUES (9, N'product-5.jpg', N'M', N'den', 121, 5)
INSERT [dbo].[Infomation] ([Infomation_Id], [Image], [Size], [Color], [Quantity_Available], [Product_Id]) VALUES (10, N'product-8.jpg', N'L', N'vang', 121, 5)
INSERT [dbo].[Infomation] ([Infomation_Id], [Image], [Size], [Color], [Quantity_Available], [Product_Id]) VALUES (11, N'product-1.jpg', N'M', N'xanh', 121, 6)
INSERT [dbo].[Infomation] ([Infomation_Id], [Image], [Size], [Color], [Quantity_Available], [Product_Id]) VALUES (12, N'product-5.jpg', N'L', N'vang', 121, 6)
INSERT [dbo].[Infomation] ([Infomation_Id], [Image], [Size], [Color], [Quantity_Available], [Product_Id]) VALUES (13, N'product-6.jpg', N'XL', N'do', 121, 7)
INSERT [dbo].[Infomation] ([Infomation_Id], [Image], [Size], [Color], [Quantity_Available], [Product_Id]) VALUES (14, N'product-6.jpg', N'L', N'vang', 121, 7)
INSERT [dbo].[Infomation] ([Infomation_Id], [Image], [Size], [Color], [Quantity_Available], [Product_Id]) VALUES (15, N'product-4.jpg', N'M', N'den', 121, 8)
INSERT [dbo].[Infomation] ([Infomation_Id], [Image], [Size], [Color], [Quantity_Available], [Product_Id]) VALUES (16, N'product-1.jpg', N'L', N'vang', 121, 8)
INSERT [dbo].[Infomation] ([Infomation_Id], [Image], [Size], [Color], [Quantity_Available], [Product_Id]) VALUES (23, N'product-4.jpg', N'M', N'den', 121, 9)
INSERT [dbo].[Infomation] ([Infomation_Id], [Image], [Size], [Color], [Quantity_Available], [Product_Id]) VALUES (24, N'product-1.jpg', N'L', N'vang', 121, 9)
SET IDENTITY_INSERT [dbo].[Infomation] OFF
SET IDENTITY_INSERT [dbo].[Link] ON 

INSERT [dbo].[Link] ([Id], [Slug], [TypeLink], [Table_Id]) VALUES (1, N'adfasfasd', N'categorys', 10)
SET IDENTITY_INSERT [dbo].[Link] OFF
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([Menu_Id], [Menu_Name], [Link], [Table_Id], [Type_Menu], [Position], [Parent_Id], [Orders], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (1, N'Trang chủ', N'http://localhost:53177/', 1, N'default', N'mainmenu', 0, 1, 1, NULL, 1, NULL, 1)
INSERT [dbo].[Menu] ([Menu_Id], [Menu_Name], [Link], [Table_Id], [Type_Menu], [Position], [Parent_Id], [Orders], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (2, N'Tất cả sản phẩm', N'tat-ca-san-pham', 1, N'allproduct', N'mainmenu', 0, 1, 1, NULL, 1, NULL, 1)
INSERT [dbo].[Menu] ([Menu_Id], [Menu_Name], [Link], [Table_Id], [Type_Menu], [Position], [Parent_Id], [Orders], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (3, N'Thời trang nam', N'thoi-trang-nam', 1, N'category', N'mainmenu', 0, 1, 1, NULL, 1, NULL, 1)
INSERT [dbo].[Menu] ([Menu_Id], [Menu_Name], [Link], [Table_Id], [Type_Menu], [Position], [Parent_Id], [Orders], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (4, N'Thời trang nữ', N'thoi-trang-nu', 1, N'category', N'mainmenu', 0, 1, 1, NULL, 1, NULL, 1)
SET IDENTITY_INSERT [dbo].[Menu] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Product_Id], [Product_Name], [Slug], [Category_Id], [Topic_Id], [Distributor_Id], [Price], [Decription], [Preferential], [Discount_percent], [Sales_Volume], [Tag], [Texture], [Import_Day], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (1, N'Sản phẩm 1', N'san-pham-1', 2, 1, 1, 25000, N'Sản phẩm 1', N'1', 5, 0, N'men', N'new', CAST(N'2022-02-03 00:00:00.000' AS DateTime), 1, NULL, 1, NULL, 1)
INSERT [dbo].[Product] ([Product_Id], [Product_Name], [Slug], [Category_Id], [Topic_Id], [Distributor_Id], [Price], [Decription], [Preferential], [Discount_percent], [Sales_Volume], [Tag], [Texture], [Import_Day], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (2, N'Sản phẩm 2', N'san-pham-2', 5, 2, 1, 25000, N'Sản phẩm 1', N'1', 5, 0, N'women', N'', CAST(N'2022-02-03 00:00:00.000' AS DateTime), 1, NULL, 1, NULL, 1)
INSERT [dbo].[Product] ([Product_Id], [Product_Name], [Slug], [Category_Id], [Topic_Id], [Distributor_Id], [Price], [Decription], [Preferential], [Discount_percent], [Sales_Volume], [Tag], [Texture], [Import_Day], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (3, N'Sản phẩm 3', N'san-pham-3', 6, 1, 1, 25000, N'Sản phẩm 1', N'1', 5, 0, N'accessories', N'sale', CAST(N'2022-02-03 00:00:00.000' AS DateTime), 1, NULL, 1, NULL, 1)
INSERT [dbo].[Product] ([Product_Id], [Product_Name], [Slug], [Category_Id], [Topic_Id], [Distributor_Id], [Price], [Decription], [Preferential], [Discount_percent], [Sales_Volume], [Tag], [Texture], [Import_Day], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (4, N'Sản phẩm 4', N'san-pham-4', 2, 2, 1, 25000, N'Sản phẩm 1', N'1', 5, 0, N'men', N'new', CAST(N'2022-02-03 00:00:00.000' AS DateTime), 1, NULL, 1, NULL, 1)
INSERT [dbo].[Product] ([Product_Id], [Product_Name], [Slug], [Category_Id], [Topic_Id], [Distributor_Id], [Price], [Decription], [Preferential], [Discount_percent], [Sales_Volume], [Tag], [Texture], [Import_Day], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (5, N'Sản phẩm 5', N'san-pham-5', 7, 4, 1, 25000, N'Sản phẩm 1', N'1', 5, 0, N'cosmetic', N'sale', CAST(N'2022-02-03 00:00:00.000' AS DateTime), 1, NULL, 1, NULL, 1)
INSERT [dbo].[Product] ([Product_Id], [Product_Name], [Slug], [Category_Id], [Topic_Id], [Distributor_Id], [Price], [Decription], [Preferential], [Discount_percent], [Sales_Volume], [Tag], [Texture], [Import_Day], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (6, N'Sản phẩm 6', N'san-pham-6', 2, 4, 1, 25000, N'Sản phẩm 1', N'1', 5, 0, N'women', N'', CAST(N'2022-02-03 00:00:00.000' AS DateTime), 1, NULL, 1, NULL, 1)
INSERT [dbo].[Product] ([Product_Id], [Product_Name], [Slug], [Category_Id], [Topic_Id], [Distributor_Id], [Price], [Decription], [Preferential], [Discount_percent], [Sales_Volume], [Tag], [Texture], [Import_Day], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (7, N'Sản phẩm 7', N'san-pham-7', 9, 1, 1, 25000, N'Sản phẩm 1', N'1', 5, 0, N'kid', N'', CAST(N'2022-02-03 00:00:00.000' AS DateTime), 1, NULL, 1, NULL, 1)
INSERT [dbo].[Product] ([Product_Id], [Product_Name], [Slug], [Category_Id], [Topic_Id], [Distributor_Id], [Price], [Decription], [Preferential], [Discount_percent], [Sales_Volume], [Tag], [Texture], [Import_Day], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (8, N'Sản phẩm 8', N'san-pham-8', 5, 4, 1, 25000, N'Sản phẩm 1', N'1', 5, 0, N'cosmetic', N'sale', CAST(N'2022-02-03 00:00:00.000' AS DateTime), 1, NULL, 1, NULL, 1)
INSERT [dbo].[Product] ([Product_Id], [Product_Name], [Slug], [Category_Id], [Topic_Id], [Distributor_Id], [Price], [Decription], [Preferential], [Discount_percent], [Sales_Volume], [Tag], [Texture], [Import_Day], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (9, N'Sản phẩm 9', N'san-pham-9', 5, 2, 1, 25000, N'Sản phẩm 1', N'1', 5, 0, N'cosmetic', N'sale', CAST(N'2022-02-03 00:00:00.000' AS DateTime), 1, NULL, 1, NULL, 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[Slider] ON 

INSERT [dbo].[Slider] ([Id], [Name], [Url], [Image], [Orders], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (1, N'slide1', N'slide1', N'slider-1.jpg', 1, 1, NULL, 1, NULL, 1)
INSERT [dbo].[Slider] ([Id], [Name], [Url], [Image], [Orders], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (2, N'slide2', N'slide2', N'slider-1.jpg', 2, 1, NULL, 1, NULL, 1)
INSERT [dbo].[Slider] ([Id], [Name], [Url], [Image], [Orders], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (3, N'slide3', N'slide2', N'slider-1.jpg', 3, 1, NULL, 1, NULL, 1)
SET IDENTITY_INSERT [dbo].[Slider] OFF
SET IDENTITY_INSERT [dbo].[Topic] ON 

INSERT [dbo].[Topic] ([Id], [Name], [Slug], [Parent_Id], [Orders], [Tag], [Decription], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (1, N'HOT TREND', N'hot-trend', 0, 1, N'hottrend', N'hottrend', 1, NULL, 1, NULL, 1)
INSERT [dbo].[Topic] ([Id], [Name], [Slug], [Parent_Id], [Orders], [Tag], [Decription], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (2, N'BEST SELLER', N'best-seller', 0, 2, N'bestseller', N'bestseller', 1, NULL, 1, NULL, 1)
INSERT [dbo].[Topic] ([Id], [Name], [Slug], [Parent_Id], [Orders], [Tag], [Decription], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (4, N'FEATURE', N'feature', 0, 3, N'feature', N'feature', 1, NULL, 1, NULL, 1)
SET IDENTITY_INSERT [dbo].[Topic] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([User_Id], [Full_Name], [Phone_Number], [Photo], [Email], [Password], [Zip_Code], [Address], [Decentralization_Id], [Created_By], [Created_At], [Updated_By], [Updated_At], [Status]) VALUES (1, N'mai xuan loi', N'0379191764', N'photo.jpg', N'xuanloi.2017mwg@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', 700000, N'46/24, đường 22,phường Phươc· Long B, Thủ Đức', 3, 0, CAST(N'2022-01-29 22:21:49.177' AS DateTime), 1, CAST(N'2021-01-12 00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[User] OFF
USE [master]
GO
ALTER DATABASE [CLOTHESSHOP] SET  READ_WRITE 
GO
