USE [master]
GO
/****** Object:  Database [WarehouseAccounting]    Script Date: 26.02.2025 17:24:48 ******/
CREATE DATABASE [WarehouseAccounting]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WarehouseAccounting', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\WarehouseAccounting.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WarehouseAccounting_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\WarehouseAccounting_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [WarehouseAccounting] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WarehouseAccounting].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WarehouseAccounting] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WarehouseAccounting] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WarehouseAccounting] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WarehouseAccounting] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WarehouseAccounting] SET ARITHABORT OFF 
GO
ALTER DATABASE [WarehouseAccounting] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WarehouseAccounting] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WarehouseAccounting] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WarehouseAccounting] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WarehouseAccounting] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WarehouseAccounting] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WarehouseAccounting] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WarehouseAccounting] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WarehouseAccounting] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WarehouseAccounting] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WarehouseAccounting] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WarehouseAccounting] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WarehouseAccounting] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WarehouseAccounting] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WarehouseAccounting] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WarehouseAccounting] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WarehouseAccounting] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WarehouseAccounting] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WarehouseAccounting] SET  MULTI_USER 
GO
ALTER DATABASE [WarehouseAccounting] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WarehouseAccounting] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WarehouseAccounting] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WarehouseAccounting] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [WarehouseAccounting] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WarehouseAccounting] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [WarehouseAccounting] SET QUERY_STORE = ON
GO
ALTER DATABASE [WarehouseAccounting] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [WarehouseAccounting]
GO
/****** Object:  Table [dbo].[Входящий счет-фактура]    Script Date: 26.02.2025 17:24:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Входящий счет-фактура](
	[ИдентификаторВходящегоСчета] [int] IDENTITY(1,1) NOT NULL,
	[Номер счета_фактуры] [nvarchar](max) NOT NULL,
	[Дата_получения] [date] NOT NULL,
	[IdПоставщик] [int] NOT NULL,
	[Общая_цена] [float] NOT NULL,
 CONSTRAINT [PK_IncomingInvoice] PRIMARY KEY CLUSTERED 
(
	[ИдентификаторВходящегоСчета] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ВходящийСчетСклад]    Script Date: 26.02.2025 17:24:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ВходящийСчетСклад](
	[ИдентификаторВходящийСчетСклад] [int] NOT NULL,
	[ИдентификаторВходящегоСчета] [int] NOT NULL,
	[IdСклада] [int] NOT NULL,
 CONSTRAINT [PK_IncomingInvoiceWarehouse] PRIMARY KEY CLUSTERED 
(
	[ИдентификаторВходящийСчетСклад] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Единица]    Script Date: 26.02.2025 17:24:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Единица](
	[IdЕдиницы] [int] NOT NULL,
	[Заголовок] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Unit] PRIMARY KEY CLUSTERED 
(
	[IdЕдиницы] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Зона хранения]    Script Date: 26.02.2025 17:24:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Зона хранения](
	[IdЗоы_хранения] [int] NOT NULL,
	[Заголовок] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_StorageArea] PRIMARY KEY CLUSTERED 
(
	[IdЗоы_хранения] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Инвентарь]    Script Date: 26.02.2025 17:24:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Инвентарь](
	[IdИнвентаря] [int] IDENTITY(1,1) NOT NULL,
	[ДатаСобытия] [date] NOT NULL,
	[IdResponsible] [int] NOT NULL,
	[Результат] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Inventory] PRIMARY KEY CLUSTERED 
(
	[IdИнвентаря] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ИнвентарьСклад]    Script Date: 26.02.2025 17:24:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ИнвентарьСклад](
	[IdИнвентарьСклад] [int] NOT NULL,
	[IdИнвенторя] [int] NOT NULL,
	[IdСклада] [int] NOT NULL,
	[УчетКоличество] [float] NOT NULL,
	[ФактическоеКоличество] [float] NOT NULL,
 CONSTRAINT [PK_InventoryWarehouse] PRIMARY KEY CLUSTERED 
(
	[IdИнвентарьСклад] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Категория]    Script Date: 26.02.2025 17:24:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Категория](
	[IdКатегории] [int] NOT NULL,
	[Заголовок] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[IdКатегории] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Клиент]    Script Date: 26.02.2025 17:24:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Клиент](
	[IdКлиента] [int] IDENTITY(1,1) NOT NULL,
	[Заголовок] [nvarchar](max) NOT NULL,
	[Телефон] [nvarchar](18) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Адресс] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[IdКлиента] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Поставщик]    Script Date: 26.02.2025 17:24:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Поставщик](
	[IdПоставщика] [int] IDENTITY(1,1) NOT NULL,
	[Заголовок] [nvarchar](max) NOT NULL,
	[ИННОрКПП] [nvarchar](50) NOT NULL,
	[Адресс] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[IdПоставщика] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[РасходыСчет-фактура]    Script Date: 26.02.2025 17:24:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[РасходыСчет-фактура](
	[IdРасходыСчет-фактура] [int] IDENTITY(1,1) NOT NULL,
	[Номер счета-фактуры] [nvarchar](max) NOT NULL,
	[Дата_отправки] [date] NOT NULL,
	[Общая_цена] [float] NOT NULL,
	[IdКлиента] [int] NOT NULL,
 CONSTRAINT [PK_ExpenditureInvoice] PRIMARY KEY CLUSTERED 
(
	[IdРасходыСчет-фактура] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[РасходыСчет-фактураСклад]    Script Date: 26.02.2025 17:24:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[РасходыСчет-фактураСклад](
	[IdРасходыСчет_фактураСклад] [int] NOT NULL,
	[IdРасходыСчет_фактура] [int] NOT NULL,
	[IdСклада] [int] NOT NULL,
 CONSTRAINT [PK_ExpenditureInvoiceWarehouse] PRIMARY KEY CLUSTERED 
(
	[IdРасходыСчет_фактураСклад] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Склад]    Script Date: 26.02.2025 17:24:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Склад](
	[IdСклада] [int] IDENTITY(1,1) NOT NULL,
	[Заголовок] [nvarchar](max) NOT NULL,
	[Адресс] [nvarchar](max) NOT NULL,
	[IdТипСклада] [int] NOT NULL,
	[IdЗоны_хранения] [int] NOT NULL,
 CONSTRAINT [PK_Warehouse] PRIMARY KEY CLUSTERED 
(
	[IdСклада] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Сотрудник]    Script Date: 26.02.2025 17:24:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Сотрудник](
	[IdСотрудника] [int] NOT NULL,
	[Фамилия] [nvarchar](max) NOT NULL,
	[Имя] [nvarchar](max) NOT NULL,
	[Отчество] [nvarchar](max) NOT NULL,
	[Телефон] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[IdСотрудника] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ТипСклада]    Script Date: 26.02.2025 17:24:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ТипСклада](
	[IdТипСклада] [int] NOT NULL,
	[Заголовок] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_WarehouseType] PRIMARY KEY CLUSTERED 
(
	[IdТипСклада] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Товары]    Script Date: 26.02.2025 17:24:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Товары](
	[IdТовара] [int] IDENTITY(1,1) NOT NULL,
	[Заголовок] [nvarchar](max) NOT NULL,
	[Статья] [nvarchar](max) NOT NULL,
	[Штрих-код] [nvarchar](max) NOT NULL,
	[IdКатегория] [int] NOT NULL,
	[IdUnit] [int] NOT NULL,
	[Цена] [float] NOT NULL,
	[Серийный номер] [nvarchar](max) NULL,
	[Минимальный_баланс] [float] NULL,
 CONSTRAINT [PK_Goods] PRIMARY KEY CLUSTERED 
(
	[IdТовара] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ТоварыСклад]    Script Date: 26.02.2025 17:24:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ТоварыСклад](
	[IdGoodsWarehouse] [int] NOT NULL,
	[IdGoods] [int] NOT NULL,
	[IdWarehouse] [int] NOT NULL,
 CONSTRAINT [PK_GoodsWarehouse] PRIMARY KEY CLUSTERED 
(
	[IdGoodsWarehouse] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Входящий счет-фактура]  WITH CHECK ADD  CONSTRAINT [FK_IncomingInvoice_Supplier] FOREIGN KEY([IdПоставщик])
REFERENCES [dbo].[Поставщик] ([IdПоставщика])
GO
ALTER TABLE [dbo].[Входящий счет-фактура] CHECK CONSTRAINT [FK_IncomingInvoice_Supplier]
GO
ALTER TABLE [dbo].[ВходящийСчетСклад]  WITH CHECK ADD  CONSTRAINT [FK_IncomingInvoiceWarehouse_IncomingInvoice] FOREIGN KEY([ИдентификаторВходящегоСчета])
REFERENCES [dbo].[Входящий счет-фактура] ([ИдентификаторВходящегоСчета])
GO
ALTER TABLE [dbo].[ВходящийСчетСклад] CHECK CONSTRAINT [FK_IncomingInvoiceWarehouse_IncomingInvoice]
GO
ALTER TABLE [dbo].[ВходящийСчетСклад]  WITH CHECK ADD  CONSTRAINT [FK_IncomingInvoiceWarehouse_Warehouse] FOREIGN KEY([IdСклада])
REFERENCES [dbo].[Склад] ([IdСклада])
GO
ALTER TABLE [dbo].[ВходящийСчетСклад] CHECK CONSTRAINT [FK_IncomingInvoiceWarehouse_Warehouse]
GO
ALTER TABLE [dbo].[Инвентарь]  WITH CHECK ADD  CONSTRAINT [FK_Inventory_Employee] FOREIGN KEY([IdResponsible])
REFERENCES [dbo].[Сотрудник] ([IdСотрудника])
GO
ALTER TABLE [dbo].[Инвентарь] CHECK CONSTRAINT [FK_Inventory_Employee]
GO
ALTER TABLE [dbo].[ИнвентарьСклад]  WITH CHECK ADD  CONSTRAINT [FK_InventoryWarehouse_Inventory] FOREIGN KEY([IdИнвенторя])
REFERENCES [dbo].[Инвентарь] ([IdИнвентаря])
GO
ALTER TABLE [dbo].[ИнвентарьСклад] CHECK CONSTRAINT [FK_InventoryWarehouse_Inventory]
GO
ALTER TABLE [dbo].[ИнвентарьСклад]  WITH CHECK ADD  CONSTRAINT [FK_InventoryWarehouse_Warehouse] FOREIGN KEY([IdСклада])
REFERENCES [dbo].[Склад] ([IdСклада])
GO
ALTER TABLE [dbo].[ИнвентарьСклад] CHECK CONSTRAINT [FK_InventoryWarehouse_Warehouse]
GO
ALTER TABLE [dbo].[РасходыСчет-фактура]  WITH CHECK ADD  CONSTRAINT [FK_ExpenditureInvoice_Client] FOREIGN KEY([IdКлиента])
REFERENCES [dbo].[Клиент] ([IdКлиента])
GO
ALTER TABLE [dbo].[РасходыСчет-фактура] CHECK CONSTRAINT [FK_ExpenditureInvoice_Client]
GO
ALTER TABLE [dbo].[РасходыСчет-фактураСклад]  WITH CHECK ADD  CONSTRAINT [FK_ExpenditureInvoiceWarehouse_ExpenditureInvoice] FOREIGN KEY([IdРасходыСчет_фактура])
REFERENCES [dbo].[РасходыСчет-фактура] ([IdРасходыСчет-фактура])
GO
ALTER TABLE [dbo].[РасходыСчет-фактураСклад] CHECK CONSTRAINT [FK_ExpenditureInvoiceWarehouse_ExpenditureInvoice]
GO
ALTER TABLE [dbo].[РасходыСчет-фактураСклад]  WITH CHECK ADD  CONSTRAINT [FK_ExpenditureInvoiceWarehouse_Warehouse] FOREIGN KEY([IdСклада])
REFERENCES [dbo].[Склад] ([IdСклада])
GO
ALTER TABLE [dbo].[РасходыСчет-фактураСклад] CHECK CONSTRAINT [FK_ExpenditureInvoiceWarehouse_Warehouse]
GO
ALTER TABLE [dbo].[Склад]  WITH CHECK ADD  CONSTRAINT [FK_Warehouse_StorageArea] FOREIGN KEY([IdЗоны_хранения])
REFERENCES [dbo].[Зона хранения] ([IdЗоы_хранения])
GO
ALTER TABLE [dbo].[Склад] CHECK CONSTRAINT [FK_Warehouse_StorageArea]
GO
ALTER TABLE [dbo].[Склад]  WITH CHECK ADD  CONSTRAINT [FK_Warehouse_WarehouseType] FOREIGN KEY([IdТипСклада])
REFERENCES [dbo].[ТипСклада] ([IdТипСклада])
GO
ALTER TABLE [dbo].[Склад] CHECK CONSTRAINT [FK_Warehouse_WarehouseType]
GO
ALTER TABLE [dbo].[Товары]  WITH CHECK ADD  CONSTRAINT [FK_Goods_Category] FOREIGN KEY([IdКатегория])
REFERENCES [dbo].[Категория] ([IdКатегории])
GO
ALTER TABLE [dbo].[Товары] CHECK CONSTRAINT [FK_Goods_Category]
GO
ALTER TABLE [dbo].[Товары]  WITH CHECK ADD  CONSTRAINT [FK_Goods_Unit] FOREIGN KEY([IdUnit])
REFERENCES [dbo].[Единица] ([IdЕдиницы])
GO
ALTER TABLE [dbo].[Товары] CHECK CONSTRAINT [FK_Goods_Unit]
GO
ALTER TABLE [dbo].[ТоварыСклад]  WITH CHECK ADD  CONSTRAINT [FK_GoodsWarehouse_Goods] FOREIGN KEY([IdGoods])
REFERENCES [dbo].[Товары] ([IdТовара])
GO
ALTER TABLE [dbo].[ТоварыСклад] CHECK CONSTRAINT [FK_GoodsWarehouse_Goods]
GO
ALTER TABLE [dbo].[ТоварыСклад]  WITH CHECK ADD  CONSTRAINT [FK_GoodsWarehouse_Warehouse] FOREIGN KEY([IdWarehouse])
REFERENCES [dbo].[Склад] ([IdСклада])
GO
ALTER TABLE [dbo].[ТоварыСклад] CHECK CONSTRAINT [FK_GoodsWarehouse_Warehouse]
GO
USE [master]
GO
ALTER DATABASE [WarehouseAccounting] SET  READ_WRITE 
GO
