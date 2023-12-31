USE [master]
GO
/****** Object:  Database [DapperProject]    Script Date: 13.10.2023 02:14:10 ******/
CREATE DATABASE [DapperProject]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DapperProject', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.FURKANKILIC\MSSQL\DATA\DapperProject.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DapperProject_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.FURKANKILIC\MSSQL\DATA\DapperProject_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DapperProject] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DapperProject].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DapperProject] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DapperProject] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DapperProject] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DapperProject] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DapperProject] SET ARITHABORT OFF 
GO
ALTER DATABASE [DapperProject] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DapperProject] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DapperProject] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DapperProject] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DapperProject] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DapperProject] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DapperProject] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DapperProject] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DapperProject] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DapperProject] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DapperProject] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DapperProject] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DapperProject] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DapperProject] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DapperProject] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DapperProject] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DapperProject] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DapperProject] SET RECOVERY FULL 
GO
ALTER DATABASE [DapperProject] SET  MULTI_USER 
GO
ALTER DATABASE [DapperProject] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DapperProject] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DapperProject] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DapperProject] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DapperProject] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DapperProject] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DapperProject', N'ON'
GO
ALTER DATABASE [DapperProject] SET QUERY_STORE = ON
GO
ALTER DATABASE [DapperProject] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DapperProject]
GO
/****** Object:  Table [dbo].[Kategoriler]    Script Date: 13.10.2023 02:14:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kategoriler](
	[KategoriID] [int] IDENTITY(20,1) NOT NULL,
	[KategoriAdi] [varchar](50) NULL,
 CONSTRAINT [PK__Kategori__1782CC9248A83636] PRIMARY KEY CLUSTERED 
(
	[KategoriID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kullanicilar]    Script Date: 13.10.2023 02:14:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kullanicilar](
	[KullaniciID] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [varchar](50) NULL,
	[Soyadi] [varchar](50) NULL,
	[Email] [varchar](100) NULL,
 CONSTRAINT [PK__Kullanic__E011F09B3B7D831E] PRIMARY KEY CLUSTERED 
(
	[KullaniciID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Siparisler]    Script Date: 13.10.2023 02:14:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Siparisler](
	[SiparisID] [int] IDENTITY(1,1) NOT NULL,
	[KullaniciID] [int] NULL,
	[UrunID] [int] NULL,
	[Miktar] [int] NULL,
	[Tarih] [date] NULL,
 CONSTRAINT [PK__Siparisl__C3F03BDD9C65DD09] PRIMARY KEY CLUSTERED 
(
	[SiparisID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Urunler]    Script Date: 13.10.2023 02:14:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Urunler](
	[UrunID] [int] IDENTITY(1,1) NOT NULL,
	[UrunAdi] [varchar](100) NULL,
	[Fiyat] [decimal](10, 2) NULL,
	[StokMiktari] [int] NULL,
 CONSTRAINT [PK__Urunler__623D364B69520CED] PRIMARY KEY CLUSTERED 
(
	[UrunID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Kategoriler] ON 

INSERT [dbo].[Kategoriler] ([KategoriID], [KategoriAdi]) VALUES (1, N'Bilgisayarlar')
INSERT [dbo].[Kategoriler] ([KategoriID], [KategoriAdi]) VALUES (2, N'Telefonlar')
INSERT [dbo].[Kategoriler] ([KategoriID], [KategoriAdi]) VALUES (3, N'TV ve Elektronik')
INSERT [dbo].[Kategoriler] ([KategoriID], [KategoriAdi]) VALUES (4, N'Tabletler')
INSERT [dbo].[Kategoriler] ([KategoriID], [KategoriAdi]) VALUES (5, N'Kamera ve Fotoğraf')
INSERT [dbo].[Kategoriler] ([KategoriID], [KategoriAdi]) VALUES (6, N'Ses ve Görüntü Sistemleri')
INSERT [dbo].[Kategoriler] ([KategoriID], [KategoriAdi]) VALUES (7, N'Oyun Konsolları')
INSERT [dbo].[Kategoriler] ([KategoriID], [KategoriAdi]) VALUES (8, N'Yazıcılar')
INSERT [dbo].[Kategoriler] ([KategoriID], [KategoriAdi]) VALUES (9, N'Ofis Ekipmanları')
INSERT [dbo].[Kategoriler] ([KategoriID], [KategoriAdi]) VALUES (10, N'Monitörler')
INSERT [dbo].[Kategoriler] ([KategoriID], [KategoriAdi]) VALUES (20, N'DenemeKategoriii')
SET IDENTITY_INSERT [dbo].[Kategoriler] OFF
GO
SET IDENTITY_INSERT [dbo].[Kullanicilar] ON 

INSERT [dbo].[Kullanicilar] ([KullaniciID], [Adi], [Soyadi], [Email]) VALUES (2, N'Mehmett', N'Kara', N'mehmet.kara@example.com')
INSERT [dbo].[Kullanicilar] ([KullaniciID], [Adi], [Soyadi], [Email]) VALUES (3, N'Ayşe', N'Demir', N'ayse.demir@example.com')
INSERT [dbo].[Kullanicilar] ([KullaniciID], [Adi], [Soyadi], [Email]) VALUES (4, N'Fatma', N'Çelik', N'fatma.celik@example.com')
INSERT [dbo].[Kullanicilar] ([KullaniciID], [Adi], [Soyadi], [Email]) VALUES (5, N'Mustafa', N'Aydın', N'mustafa.aydin@example.com')
INSERT [dbo].[Kullanicilar] ([KullaniciID], [Adi], [Soyadi], [Email]) VALUES (6, N'Zeynep', N'Yıldız', N'zeynep.yildiz@example.com')
INSERT [dbo].[Kullanicilar] ([KullaniciID], [Adi], [Soyadi], [Email]) VALUES (7, N'Emre', N'Güneş', N'emre.gunes@example.com')
INSERT [dbo].[Kullanicilar] ([KullaniciID], [Adi], [Soyadi], [Email]) VALUES (8, N'Sevgi', N'Koç', N'sevgi.koc@example.com')
INSERT [dbo].[Kullanicilar] ([KullaniciID], [Adi], [Soyadi], [Email]) VALUES (9, N'Burak', N'Yavuz', N'burak.yavuz@example.com')
INSERT [dbo].[Kullanicilar] ([KullaniciID], [Adi], [Soyadi], [Email]) VALUES (10, N'Elif', N'Aktaş', N'elif.aktas@example.com')
SET IDENTITY_INSERT [dbo].[Kullanicilar] OFF
GO
SET IDENTITY_INSERT [dbo].[Siparisler] ON 

INSERT [dbo].[Siparisler] ([SiparisID], [KullaniciID], [UrunID], [Miktar], [Tarih]) VALUES (1, 2, 2, 2, CAST(N'2023-10-09' AS Date))
INSERT [dbo].[Siparisler] ([SiparisID], [KullaniciID], [UrunID], [Miktar], [Tarih]) VALUES (2, 3, 3, 1, CAST(N'2023-10-09' AS Date))
INSERT [dbo].[Siparisler] ([SiparisID], [KullaniciID], [UrunID], [Miktar], [Tarih]) VALUES (3, 3, 7, 3, CAST(N'2023-10-08' AS Date))
INSERT [dbo].[Siparisler] ([SiparisID], [KullaniciID], [UrunID], [Miktar], [Tarih]) VALUES (4, 4, 8, 2, CAST(N'2023-10-08' AS Date))
INSERT [dbo].[Siparisler] ([SiparisID], [KullaniciID], [UrunID], [Miktar], [Tarih]) VALUES (5, 5, 9, 1, CAST(N'2023-10-07' AS Date))
INSERT [dbo].[Siparisler] ([SiparisID], [KullaniciID], [UrunID], [Miktar], [Tarih]) VALUES (6, 6, 4, 4, CAST(N'2023-10-07' AS Date))
INSERT [dbo].[Siparisler] ([SiparisID], [KullaniciID], [UrunID], [Miktar], [Tarih]) VALUES (7, 7, 5, 2, CAST(N'2023-10-06' AS Date))
INSERT [dbo].[Siparisler] ([SiparisID], [KullaniciID], [UrunID], [Miktar], [Tarih]) VALUES (8, 8, 6, 1, CAST(N'2023-10-06' AS Date))
INSERT [dbo].[Siparisler] ([SiparisID], [KullaniciID], [UrunID], [Miktar], [Tarih]) VALUES (9, 9, 1, 2, CAST(N'2023-10-05' AS Date))
INSERT [dbo].[Siparisler] ([SiparisID], [KullaniciID], [UrunID], [Miktar], [Tarih]) VALUES (10, 1, 11, 3, CAST(N'2023-10-05' AS Date))
INSERT [dbo].[Siparisler] ([SiparisID], [KullaniciID], [UrunID], [Miktar], [Tarih]) VALUES (11, 0, 0, 0, CAST(N'2023-02-01' AS Date))
INSERT [dbo].[Siparisler] ([SiparisID], [KullaniciID], [UrunID], [Miktar], [Tarih]) VALUES (12, 1, 1, 1, CAST(N'2023-02-01' AS Date))
SET IDENTITY_INSERT [dbo].[Siparisler] OFF
GO
SET IDENTITY_INSERT [dbo].[Urunler] ON 

INSERT [dbo].[Urunler] ([UrunID], [UrunAdi], [Fiyat], [StokMiktari]) VALUES (1, N'asdas', CAST(15.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Urunler] ([UrunID], [UrunAdi], [Fiyat], [StokMiktari]) VALUES (2, N'Laptoppp', CAST(15.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Urunler] ([UrunID], [UrunAdi], [Fiyat], [StokMiktari]) VALUES (3, N'Laptoppp', CAST(15.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Urunler] ([UrunID], [UrunAdi], [Fiyat], [StokMiktari]) VALUES (4, N'Laptoppp', CAST(15.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Urunler] ([UrunID], [UrunAdi], [Fiyat], [StokMiktari]) VALUES (5, N'Laptoppp', CAST(15.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Urunler] ([UrunID], [UrunAdi], [Fiyat], [StokMiktari]) VALUES (6, N'Laptoppp', CAST(15.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Urunler] ([UrunID], [UrunAdi], [Fiyat], [StokMiktari]) VALUES (7, N'Laptoppp', CAST(15.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Urunler] ([UrunID], [UrunAdi], [Fiyat], [StokMiktari]) VALUES (8, N'Laptoppp', CAST(15.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Urunler] ([UrunID], [UrunAdi], [Fiyat], [StokMiktari]) VALUES (10, N'Laptoppp', CAST(15.00 AS Decimal(10, 2)), 0)
SET IDENTITY_INSERT [dbo].[Urunler] OFF
GO
/****** Object:  StoredProcedure [dbo].[AddorUpdateKategori]    Script Date: 13.10.2023 02:14:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[AddorUpdateKategori]

@KategoriID int,
@KategoriAdi varchar(50)
as begin 
if @KategoriID=0
insert into kategoriler (KategoriAdi) values (@KategoriAdi) 

else
update kategoriler set KategoriAdi=@KategoriAdi where KategoriID=@KategoriID

end
GO
/****** Object:  StoredProcedure [dbo].[AddorUpdateKullanicilar]    Script Date: 13.10.2023 02:14:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[AddorUpdateKullanicilar] 
@KullaniciID int,
@Adi varchar (50),
@Soyadi varchar (50),
@Email varchar(100)
as begin 
if @KullaniciID=0
insert into kullanicilar (Adi,Soyadi,Email) values (@Adi,@Soyadi,@Email)
else
update kullanicilar set Adi=@Adi, Soyadi=@Soyadi,Email=@Email where KullaniciID=@KullaniciID
end
GO
/****** Object:  StoredProcedure [dbo].[AddorUpdateSiparisler]    Script Date: 13.10.2023 02:14:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[AddorUpdateSiparisler]
@SiparisID int,
@KullaniciID int ,
@UrunID int,
@Miktar int,
@Tarih Date
as begin 
if @SiparisID=0
insert into siparisler (KullaniciID,UrunID,Miktar,Tarih) values (@KullaniciID,@UrunID,@Miktar,@Tarih)
else 

update siparisler set KullaniciID=@KullaniciID , UrunID= @UrunID, Miktar= @Miktar , Tarih=@Tarih where SiparisID=@SiparisID
end
GO
/****** Object:  StoredProcedure [dbo].[AddorUpdateUrunler]    Script Date: 13.10.2023 02:14:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE proc [dbo].[AddorUpdateUrunler] 
 @UrunID int,
 @UrunAdi varchar(50),
 @Fiyat Decimal(10,2),
 @StokMiktari int 
 as begin 
 if @UrunID= 0

 insert into urunler (UrunAdi,Fiyat,StokMiktari) values (@UrunAdi,@Fiyat,@StokMiktari)
 else 

update urunler set  UrunAdi=@UrunAdi,Fiyat=@Fiyat,StokMiktari=@StokMiktari where UrunID=@UrunID
end
GO
/****** Object:  StoredProcedure [dbo].[DeleteKategori]    Script Date: 13.10.2023 02:14:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[DeleteKategori] 
@KategoriID int 

as begin
delete from Kategoriler where KategoriID=@KategoriID
end
GO
/****** Object:  StoredProcedure [dbo].[DeleteKullanicilar]    Script Date: 13.10.2023 02:14:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DeleteKullanicilar]
@KullaniciID int 
as begin 
delete from kullanicilar where KullaniciID=@KullaniciID
end
GO
/****** Object:  StoredProcedure [dbo].[DeleteSiparisler]    Script Date: 13.10.2023 02:14:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[DeleteSiparisler] 
@SiparisID int 
as begin 
delete from siparisler where SiparisID=@SiparisID
end
GO
/****** Object:  StoredProcedure [dbo].[DeleteUrunler]    Script Date: 13.10.2023 02:14:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DeleteUrunler] 
@UrunID int 
as begin 
delete from urunler where UrunID=@UrunID
end
GO
/****** Object:  StoredProcedure [dbo].[ListKategori]    Script Date: 13.10.2023 02:14:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[ListKategori]
as begin 
select * from kategoriler
end
GO
/****** Object:  StoredProcedure [dbo].[ListKategoriByNo]    Script Date: 13.10.2023 02:14:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ListKategoriByNo] 
@kategoriID int
as begin 
select * from kategoriler  where kategoriID = @kategoriID
end
GO
/****** Object:  StoredProcedure [dbo].[listKullanicilar]    Script Date: 13.10.2023 02:14:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[listKullanicilar]
as begin  
select * from kullanicilar
end
GO
/****** Object:  StoredProcedure [dbo].[ListKullanicilarByNo]    Script Date: 13.10.2023 02:14:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ListKullanicilarByNo] 
@KullaniciID int 
as begin 
select * from Kullanicilar where KullaniciID=@KullaniciID
end
GO
/****** Object:  StoredProcedure [dbo].[listSiparisler]    Script Date: 13.10.2023 02:14:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create proc [dbo].[listSiparisler]

as begin 
select *from siparisler

end
GO
/****** Object:  StoredProcedure [dbo].[listSiparislerByNo]    Script Date: 13.10.2023 02:14:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[listSiparislerByNo] 
@SiparisID int 

as begin 
select * from Siparisler where SiparisID = @SiparisID
end
GO
/****** Object:  StoredProcedure [dbo].[listUrunler]    Script Date: 13.10.2023 02:14:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[listUrunler] 
as begin 
select * from urunler
end
GO
/****** Object:  StoredProcedure [dbo].[listUrunlerByNo]    Script Date: 13.10.2023 02:14:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[listUrunlerByNo] 
@UrunID int 
as begin select*from Urunler where UrunID=@UrunID
end
GO
USE [master]
GO
ALTER DATABASE [DapperProject] SET  READ_WRITE 
GO
