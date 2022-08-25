USE [master]
GO
/****** Object:  Database [Assignment]    Script Date: 8/15/2022 3:01:00 PM ******/
CREATE DATABASE [Assignment]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Assignment', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.TIENLE\MSSQL\DATA\Assignment.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Assignment_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.TIENLE\MSSQL\DATA\Assignment_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Assignment] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Assignment].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Assignment] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Assignment] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Assignment] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Assignment] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Assignment] SET ARITHABORT OFF 
GO
ALTER DATABASE [Assignment] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Assignment] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Assignment] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Assignment] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Assignment] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Assignment] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Assignment] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Assignment] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Assignment] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Assignment] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Assignment] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Assignment] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Assignment] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Assignment] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Assignment] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Assignment] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Assignment] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Assignment] SET RECOVERY FULL 
GO
ALTER DATABASE [Assignment] SET  MULTI_USER 
GO
ALTER DATABASE [Assignment] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Assignment] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Assignment] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Assignment] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Assignment] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Assignment] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Assignment] SET QUERY_STORE = OFF
GO
USE [Assignment]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 8/15/2022 3:01:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[categoryID] [nvarchar](10) NOT NULL,
	[categoryName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblCategory] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrder]    Script Date: 8/15/2022 3:01:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrder](
	[orderID] [varchar](100) NOT NULL,
	[orderDate] [date] NOT NULL,
	[total] [float] NOT NULL,
	[userID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblOrder] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderDetail]    Script Date: 8/15/2022 3:01:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetail](
	[detailID] [varchar](100) NOT NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[orderID] [varchar](100) NOT NULL,
	[productID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblOrderDetail] PRIMARY KEY CLUSTERED 
(
	[detailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProduct]    Script Date: 8/15/2022 3:01:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProduct](
	[productID] [nvarchar](50) NOT NULL,
	[productName] [nvarchar](50) NOT NULL,
	[image] [varchar](250) NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[categoryID] [nvarchar](10) NOT NULL,
	[importDate] [date] NULL,
	[usingDate] [date] NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_tblProduct] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 8/15/2022 3:01:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoles](
	[roleID] [nvarchar](10) NOT NULL,
	[roleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblRoles] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 8/15/2022 3:01:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userID] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[fullName] [nvarchar](50) NOT NULL,
	[roleID] [nvarchar](10) NOT NULL,
	[address] [nvarchar](50) NOT NULL,
	[birthday] [date] NOT NULL,
	[phone] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'D01', N'Other')
GO
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'F01       ', N'Fruit')
GO
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'V01       ', N'Vegetable')
GO
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID]) VALUES (N'ab3ed341-3483-41e9-869b-a1cf956a27dd', CAST(N'2022-03-11' AS Date), 119700, N'chi2k')
GO
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID]) VALUES (N'd2fc7cc6-269c-4467-a4ae-1d0da549a1ea', CAST(N'2022-03-11' AS Date), 454500, N'doan2k2')
GO
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID]) VALUES (N'oNo3', CAST(N'2022-03-12' AS Date), 25750, N'doan2k2')
GO
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID]) VALUES (N'oNo4', CAST(N'2022-03-12' AS Date), 48900, N'doan2k2')
GO
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (N'15aae912-8067-45f7-abab-57faf9b57ce7', 39900, 3, N'ab3ed341-3483-41e9-869b-a1cf956a27dd', N'1')
GO
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (N'9789d860-6901-450f-9630-f0d6fdb37ab6', 85000, 3, N'd2fc7cc6-269c-4467-a4ae-1d0da549a1ea', N'8')
GO
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (N'f751b1b4-9982-4e3b-a4d1-8656ed0e42ae', 39900, 5, N'd2fc7cc6-269c-4467-a4ae-1d0da549a1ea', N'1')
GO
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (N'oNo3_d1', 25750, 1, N'oNo3', N'12')
GO
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (N'oNo4_d1', 39900, 1, N'oNo4', N'1')
GO
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate], [status]) VALUES (N'1', N'Khoai tây', N'https://product.hstatic.net/1000282430/product/upload_4cf55b050da744589e0b9ac7a3e8db1a_large.jpg', 36750, 29, N'V01', CAST(N'2022-03-04' AS Date), CAST(N'2022-02-28' AS Date), 0)
GO
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate], [status]) VALUES (N'10', N'Đậu cove', N'https://trongraudothi.com/Uploads/rausach/rausach/avata/img/20190406111352H%E1%BA%A1t%20gi%E1%BB%91ng%20%C4%91%E1%BA%ADu%20cove%20l%C3%B9n%20qu%E1%BA%A3%20xanh.png', 39900, 8, N'V01       ', CAST(N'2022-03-04' AS Date), CAST(N'2022-03-04' AS Date), 1)
GO
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate], [status]) VALUES (N'11', N'Việt quất', N'https://baocantho.com.vn/image/fckeditor/upload/2019/20190802/images/vietquat.jpg', 148900, 10, N'F01', CAST(N'2022-02-07' AS Date), CAST(N'2022-02-28' AS Date), 1)
GO
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate], [status]) VALUES (N'12', N'Chuối Fohla', N'https://product.hstatic.net/1000282430/product/chuoi-fohla_large.jpg', 25750, 14, N'F01', CAST(N'2022-02-07' AS Date), CAST(N'2022-02-28' AS Date), 1)
GO
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate], [status]) VALUES (N'13', N'Ổi', N'https://traicaycaonghe.vn/wp-content/uploads/2021/05/oinuhoang7.jpg', 29950, 20, N'F01', CAST(N'2022-02-07' AS Date), CAST(N'2022-02-28' AS Date), 1)
GO
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate], [status]) VALUES (N'15', N'Táo xanh', N'http://bizweb.dktcdn.net/thumb/grande/100/279/546/products/11.jpg?v=1514883108847', 155900, 35, N'F01', CAST(N'2022-02-07' AS Date), CAST(N'2022-02-28' AS Date), 1)
GO
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate], [status]) VALUES (N'16', N'Bơ Đà Lạt', N'https://product.hstatic.net/1000282430/product/bo_large.jpg', 49950, 55, N'F01', CAST(N'2022-02-07' AS Date), CAST(N'2022-02-28' AS Date), 1)
GO
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate], [status]) VALUES (N'17', N'Quýt', N'https://product.hstatic.net/1000282430/product/quyt_large.jpg', 84950, 60, N'F01', CAST(N'2022-02-07' AS Date), CAST(N'2022-02-28' AS Date), 1)
GO
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate], [status]) VALUES (N'18', N'Dưa lưới', N'https://product.hstatic.net/1000282430/product/cantaloupe_002e4fedb6dc45aaa6be6e679c77f62b_large.jpg', 109900, 10, N'F01', CAST(N'2022-02-07' AS Date), CAST(N'2022-02-28' AS Date), 1)
GO
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate], [status]) VALUES (N'19', N'Cải xanh Đà Lạt', N'https://cdn.tgdd.vn/Products/Images/8820/223329/bhx/cai-be-xanh-baby-tui-300g-202012082224129697.jpg', 14500, 21, N'V01', CAST(N'2022-02-07' AS Date), CAST(N'2022-02-28' AS Date), 1)
GO
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate], [status]) VALUES (N'2', N'Đu đủ ruột đỏ', N'https://product.hstatic.net/1000282430/product/du_d__large.jpg', 39900, 15, N'F01', CAST(N'2022-02-07' AS Date), CAST(N'2022-02-28' AS Date), 1)
GO
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate], [status]) VALUES (N'20', N'Cam sành', N'https://storage.googleapis.com/mm-online-bucket/ecommerce-website/uploads/media/171268.jpg', 83900, 30, N'F01', CAST(N'2022-02-07' AS Date), CAST(N'2022-02-28' AS Date), 1)
GO
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate], [status]) VALUES (N'21', N'Dưa hấu không hạt', N'https://product.hstatic.net/1000282430/product/seedless-watermelon-around-2.5kg-whole-fruit_23a860613aa94413aca16b9d766f6291_large.jpg', 137700, 40, N'F01', CAST(N'2022-02-07' AS Date), CAST(N'2022-02-28' AS Date), 1)
GO
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate], [status]) VALUES (N'22', N'Cải thìa Đà Lạt', N'https://cdn.tgdd.vn/Products/Images/8820/271524/bhx/cai-thia-goi-500g-202202261905199595.jpg', 14500, 20, N'V01       ', CAST(N'2022-02-07' AS Date), CAST(N'2022-02-28' AS Date), 1)
GO
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate], [status]) VALUES (N'23', N'Măng tây', N'https://cdn.tgdd.vn/Products/Images/8820/222783/bhx/mang-tay-bo-200g-202012082233230054.jpg', 25000, 30, N'V01', CAST(N'2022-02-07' AS Date), CAST(N'2022-02-28' AS Date), 1)
GO
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate], [status]) VALUES (N'25', N'Lá giang', N'https://cdn.tgdd.vn/Products/Images/8820/271745/bhx/la-giang-tuoi-goi-200g-202202121608455174.jpg', 12000, 10, N'V01', CAST(N'2022-02-07' AS Date), CAST(N'2022-02-28' AS Date), 1)
GO
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate], [status]) VALUES (N'26', N'Bắp cải trắng', N'https://csfood.vn/wp-content/uploads/2016/05/B%E1%BA%AFp-c%E1%BA%A3i-tr%E1%BA%AFng-%C4%90%C3%A0-L%E1%BA%A1t-1.jpg', 11000, 10, N'V01', CAST(N'2022-02-07' AS Date), CAST(N'2022-02-28' AS Date), 1)
GO
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate], [status]) VALUES (N'27', N'Xà lách', N'https://cdn.tgdd.vn/Products/Images/8820/226900/bhx/xa-lach-lolo-xanh-tui-500g-202009300006152955.jpg', 9000, 4, N'V01', CAST(N'2022-02-07' AS Date), CAST(N'2022-02-28' AS Date), 1)
GO
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate], [status]) VALUES (N'28', N'Củ cải trắng', N'https://cdn.tgdd.vn/Products/Images/8785/271469/bhx/cu-cai-trang-tui-500g-4-6-cu-202203030852549834.jpg', 9000, 10, N'V01', CAST(N'2022-02-07' AS Date), CAST(N'2022-02-28' AS Date), 1)
GO
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate], [status]) VALUES (N'29', N'Trái Bắp', N'https://media.phunutoday.vn/files/phuong.lai/2017/12/19/bap-ngo-1447-phunutoday.jpg', 15000, 25, N'V01', CAST(N'2022-02-28' AS Date), CAST(N'2023-03-31' AS Date), NULL)
GO
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate], [status]) VALUES (N'3', N'Bưởi da xanh', N'https://nongsananphat.com/wp-content/uploads/2020/10/BUOI-DA-XANH.png', 97500, 100, N'F01', CAST(N'2022-02-07' AS Date), CAST(N'2022-02-28' AS Date), 1)
GO
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate], [status]) VALUES (N'30', N'Trái Dứa', N'https://anhoafood.com/wp-content/uploads/2020/11/th%C6%A1m-m%E1%BA%ADt-kh%C3%B3m-m%E1%BA%ADt-d%E1%BB%A9a-m%E1%BA%ADt-h%E1%BB%AFu-c%C6%A1-%C4%90%C3%A0-L%E1%BA%A1t-anhoafood-3-600x600.jpg', 30000, 15, N'F01', CAST(N'2022-02-27' AS Date), CAST(N'2022-03-30' AS Date), NULL)
GO
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate], [status]) VALUES (N'31', N'Măng cụt ', N'https://www.conngongvang.com/wp-content/uploads/2021/02/mang_cut_huu_co.jpg', 45000, 50, N'F01', CAST(N'2002-03-14' AS Date), CAST(N'2022-03-30' AS Date), NULL)
GO
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate], [status]) VALUES (N'4', N'Trái Bầu', N'https://cooponline.vn/wp-content/uploads/2020/02/trai-bau-1-300x300.jpg', 14500, 15, N'V01', CAST(N'2022-02-07' AS Date), CAST(N'2022-02-28' AS Date), 1)
GO
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate], [status]) VALUES (N'5', N'Cà rốt Đà Lạt', N'https://cooponline.vn/wp-content/uploads/2020/06/ca-rot-da-lat-300x300.jpg', 32000, 30, N'V01', CAST(N'2022-02-07' AS Date), CAST(N'2022-02-28' AS Date), 1)
GO
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate], [status]) VALUES (N'6', N'Khoai lang tím', N'https://cooponline.vn/wp-content/uploads/2021/10/khoai-lang-tim-giong-nhat-kg-300x300.jpg', 23000, 50, N'V01', CAST(N'2022-02-07' AS Date), CAST(N'2022-02-28' AS Date), 1)
GO
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate], [status]) VALUES (N'7', N'Chanh không hạt', N'https://product.hstatic.net/1000282430/product/organic-seedless-lime_456e3363df7240c0a755876157124fde_grande.jpg', 39950, 40, N'V01', CAST(N'2022-02-07' AS Date), CAST(N'2022-02-28' AS Date), 1)
GO
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate], [status]) VALUES (N'8', N'Ớt chuông xanh', N'https://product.hstatic.net/1000282430/product/ot-chuong-xanh_large.jpg', 19975, 35, N'V01', CAST(N'2022-02-07' AS Date), CAST(N'2022-02-28' AS Date), 1)
GO
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'0', N'admin')
GO
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'1', N'user')
GO
INSERT [dbo].[tblUsers] ([userID], [password], [fullName], [roleID], [address], [birthday], [phone], [email], [status]) VALUES (N'admin', N'123', N'user07', N'AD', N'DaNang', CAST(N'2000-04-01' AS Date), N'0972447882', N'admin@gmail.com', 0)
GO
INSERT [dbo].[tblUsers] ([userID], [password], [fullName], [roleID], [address], [birthday], [phone], [email], [status]) VALUES (N'chi2k', N'123', N'user03', N'AD', N'TPHCM', CAST(N'2000-01-02' AS Date), N'01688534475', N'chi@gmail.com', 0)
GO
INSERT [dbo].[tblUsers] ([userID], [password], [fullName], [roleID], [address], [birthday], [phone], [email], [status]) VALUES (N'doan2k2', N'123', N'user01', N'US', N'TPHCM', CAST(N'2000-10-10' AS Date), N'0916024635', N'doan@gmail.com', 0)
GO
INSERT [dbo].[tblUsers] ([userID], [password], [fullName], [roleID], [address], [birthday], [phone], [email], [status]) VALUES (N'tien2k1', N'123', N'user02', N'AD', N'DakLak', CAST(N'2001-02-03' AS Date), N'09647885633', N'tien@gmail.com', 0)
GO
INSERT [dbo].[tblUsers] ([userID], [password], [fullName], [roleID], [address], [birthday], [phone], [email], [status]) VALUES (N'toan2k4', N'123', N'user04', N'US', N'DakLak', CAST(N'2004-12-10' AS Date), N'0847667867', N'toan@gmail.com', 0)
GO
INSERT [dbo].[tblUsers] ([userID], [password], [fullName], [roleID], [address], [birthday], [phone], [email], [status]) VALUES (N'tung2k3', N'123', N'user05', N'US', N'DakLak', CAST(N'2003-07-09' AS Date), N'0905662244', N'tung@gmail.com', 0)
GO
USE [master]
GO
ALTER DATABASE [Assignment] SET  READ_WRITE 
GO
