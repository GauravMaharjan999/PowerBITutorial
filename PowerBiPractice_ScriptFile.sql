USE [master]
GO
/****** Object:  Database [PowerBiPractice]    Script Date: 5/22/2024 3:10:39 PM ******/
CREATE DATABASE [PowerBiPractice]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PowerBiPractice', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\PowerBiPractice.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PowerBiPractice_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\PowerBiPractice_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PowerBiPractice] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PowerBiPractice].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PowerBiPractice] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PowerBiPractice] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PowerBiPractice] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PowerBiPractice] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PowerBiPractice] SET ARITHABORT OFF 
GO
ALTER DATABASE [PowerBiPractice] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PowerBiPractice] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PowerBiPractice] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PowerBiPractice] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PowerBiPractice] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PowerBiPractice] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PowerBiPractice] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PowerBiPractice] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PowerBiPractice] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PowerBiPractice] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PowerBiPractice] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PowerBiPractice] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PowerBiPractice] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PowerBiPractice] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PowerBiPractice] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PowerBiPractice] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PowerBiPractice] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PowerBiPractice] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PowerBiPractice] SET  MULTI_USER 
GO
ALTER DATABASE [PowerBiPractice] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PowerBiPractice] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PowerBiPractice] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PowerBiPractice] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [PowerBiPractice]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 5/22/2024 3:10:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[Phone] [nvarchar](20) NULL,
	[Country] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 5/22/2024 3:10:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NULL,
	[ProductId] [int] NULL,
	[Quantity] [int] NULL,
	[UnitPrice] [decimal](10, 2) NULL,
	[Discount] [decimal](5, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 5/22/2024 3:10:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NULL,
	[OrderDate] [date] NULL,
	[TotalAmount] [decimal](10, 2) NULL,
	[PaymentMethod] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdersProducts]    Script Date: 5/22/2024 3:10:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdersProducts](
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 5/22/2024 3:10:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Description] [nvarchar](255) NULL,
	[Price] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([Id], [Name], [Email], [Phone], [Country]) VALUES (1, N'John Doe', N'john@example.com', N'+1234567890', N'USA')
INSERT [dbo].[Customers] ([Id], [Name], [Email], [Phone], [Country]) VALUES (2, N'Jane Smith', N'jane@example.com', N'+9876543210', N'Canada')
INSERT [dbo].[Customers] ([Id], [Name], [Email], [Phone], [Country]) VALUES (3, N'Alice Johnson', N'alice@example.com', N'+1122334455', N'UK')
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity], [UnitPrice], [Discount]) VALUES (1, 1, 1, 2, CAST(25.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity], [UnitPrice], [Discount]) VALUES (2, 1, 2, 1, CAST(50.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(5, 2)))
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity], [UnitPrice], [Discount]) VALUES (3, 2, 3, 3, CAST(30.00 AS Decimal(10, 2)), CAST(0.05 AS Decimal(5, 2)))
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity], [UnitPrice], [Discount]) VALUES (4, 3, 4, 1, CAST(75.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)))
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [CustomerId], [OrderDate], [TotalAmount], [PaymentMethod]) VALUES (1, 1, CAST(N'2024-05-01' AS Date), CAST(150.00 AS Decimal(10, 2)), N'Credit Card')
INSERT [dbo].[Orders] ([Id], [CustomerId], [OrderDate], [TotalAmount], [PaymentMethod]) VALUES (2, 2, CAST(N'2024-05-02' AS Date), CAST(200.50 AS Decimal(10, 2)), N'PayPal')
INSERT [dbo].[Orders] ([Id], [CustomerId], [OrderDate], [TotalAmount], [PaymentMethod]) VALUES (3, 3, CAST(N'2024-05-03' AS Date), CAST(100.75 AS Decimal(10, 2)), N'Cash')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
INSERT [dbo].[OrdersProducts] ([OrderId], [ProductId]) VALUES (1, 1)
INSERT [dbo].[OrdersProducts] ([OrderId], [ProductId]) VALUES (1, 2)
INSERT [dbo].[OrdersProducts] ([OrderId], [ProductId]) VALUES (2, 3)
INSERT [dbo].[OrdersProducts] ([OrderId], [ProductId]) VALUES (3, 4)
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Description], [Price]) VALUES (1, N'Product A', N'Description for Product A', CAST(25.00 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price]) VALUES (2, N'Product B', N'Description for Product B', CAST(50.00 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price]) VALUES (3, N'Product C', N'Description for Product C', CAST(30.00 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price]) VALUES (4, N'Product D', N'Description for Product D', CAST(75.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([Id])
GO
ALTER TABLE [dbo].[OrdersProducts]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrdersProducts]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
/****** Object:  StoredProcedure [dbo].[GetCustomerOrderSummary]    Script Date: 5/22/2024 3:10:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCustomerOrderSummary]
AS
BEGIN
    SELECT 
        c.Id AS CustomerId,
        c.Name AS CustomerName,
        COUNT(o.Id) AS TotalOrders,
        SUM(od.Quantity) AS TotalItemsOrdered,
        SUM(od.Quantity * od.UnitPrice) AS TotalSpending
    FROM 
        Customers c
    LEFT JOIN 
        Orders o ON c.Id = o.CustomerId
    LEFT JOIN 
        OrderDetails od ON o.Id = od.OrderId
    GROUP BY 
        c.Id, c.Name;
END;
GO
USE [master]
GO
ALTER DATABASE [PowerBiPractice] SET  READ_WRITE 
GO
