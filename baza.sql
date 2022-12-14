USE [master]
GO
/****** Object:  Database [MojaBaza]    Script Date: 24.8.2022. 02:15:14 ******/
CREATE DATABASE [MojaBaza]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MojaBaza', FILENAME = N'C:\Users\Korisnik\MojaBaza.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MojaBaza_log', FILENAME = N'C:\Users\Korisnik\MojaBaza_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [MojaBaza] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MojaBaza].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MojaBaza] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MojaBaza] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MojaBaza] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MojaBaza] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MojaBaza] SET ARITHABORT OFF 
GO
ALTER DATABASE [MojaBaza] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MojaBaza] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MojaBaza] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MojaBaza] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MojaBaza] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MojaBaza] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MojaBaza] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MojaBaza] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MojaBaza] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MojaBaza] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MojaBaza] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MojaBaza] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MojaBaza] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MojaBaza] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MojaBaza] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MojaBaza] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MojaBaza] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MojaBaza] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MojaBaza] SET  MULTI_USER 
GO
ALTER DATABASE [MojaBaza] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MojaBaza] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MojaBaza] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MojaBaza] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MojaBaza] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MojaBaza] SET QUERY_STORE = OFF
GO
USE [MojaBaza]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [MojaBaza]
GO
/****** Object:  Table [dbo].[Korisnik]    Script Date: 24.8.2022. 02:15:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Korisnik](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ime] [varchar](50) NULL,
	[prezime] [varchar](50) NULL,
	[korisnickoIme] [varchar](50) NULL,
	[sifra] [int] NULL,
	[adresa] [varchar](50) NULL,
	[mestoId] [int] NULL,
 CONSTRAINT [PK_Korisnik] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mesto]    Script Date: 24.8.2022. 02:15:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mesto](
	[ID] [int] NOT NULL,
	[PostanskiBroj] [int] NULL,
	[Naziv] [varchar](50) NULL,
 CONSTRAINT [PK_Mesto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Narudzbenica]    Script Date: 24.8.2022. 02:15:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Narudzbenica](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[kolicina] [int] NULL,
	[korisnikId] [int] NULL,
 CONSTRAINT [PK_Narudzbenica] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proizvod]    Script Date: 24.8.2022. 02:15:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proizvod](
	[ID] [int] NOT NULL,
	[naziv] [varchar](50) NULL,
	[pol] [varchar](50) NULL,
	[boja] [varchar](50) NULL,
	[materijal] [varchar](50) NULL,
	[duzina] [varchar](50) NULL,
	[proizvodjac] [varchar](50) NULL,
	[cena] [numeric](18, 0) NULL,
	[velicina] [int] NULL,
	[kolicina] [int] NULL,
 CONSTRAINT [PK_Proizvod] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StavkaNarudzbenice]    Script Date: 24.8.2022. 02:15:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StavkaNarudzbenice](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[narudzbenicaId] [int] NOT NULL,
	[proizvodId] [int] NOT NULL,
	[brojKomada] [int] NULL,
 CONSTRAINT [PK_Stavka Narudzbenice] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[narudzbenicaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Korisnik] ON 

INSERT [dbo].[Korisnik] ([ID], [ime], [prezime], [korisnickoIme], [sifra], [adresa], [mestoId]) VALUES (1, N'Petar', N'Petrovic', N'pera', 1111, N'Kneza Milosa 120', 1)
SET IDENTITY_INSERT [dbo].[Korisnik] OFF
GO
INSERT [dbo].[Mesto] ([ID], [PostanskiBroj], [Naziv]) VALUES (1, 11000, N'Beograd')
GO
SET IDENTITY_INSERT [dbo].[Narudzbenica] ON 

INSERT [dbo].[Narudzbenica] ([ID], [kolicina], [korisnikId]) VALUES (1, 1, 1)
INSERT [dbo].[Narudzbenica] ([ID], [kolicina], [korisnikId]) VALUES (9, 1, 1)
INSERT [dbo].[Narudzbenica] ([ID], [kolicina], [korisnikId]) VALUES (13, 1, 1)
SET IDENTITY_INSERT [dbo].[Narudzbenica] OFF
GO
INSERT [dbo].[Proizvod] ([ID], [naziv], [pol], [boja], [materijal], [duzina], [proizvodjac], [cena], [velicina], [kolicina]) VALUES (1, N'helanke', N'zenski', N'crna', N'pamuk', N'duge', N'nike', CAST(8000 AS Numeric(18, 0)), 32, 4)
INSERT [dbo].[Proizvod] ([ID], [naziv], [pol], [boja], [materijal], [duzina], [proizvodjac], [cena], [velicina], [kolicina]) VALUES (2, N'nho', N'm', N'on', N'o', N'np', N'npp', CAST(122 AS Numeric(18, 0)), 12, 122)
INSERT [dbo].[Proizvod] ([ID], [naziv], [pol], [boja], [materijal], [duzina], [proizvodjac], [cena], [velicina], [kolicina]) VALUES (3, N'Majica', N'm', N'Siva', N'Poliester', N'Kratak rukav', N'Adidas', CAST(3200 AS Numeric(18, 0)), 42, 1)
INSERT [dbo].[Proizvod] ([ID], [naziv], [pol], [boja], [materijal], [duzina], [proizvodjac], [cena], [velicina], [kolicina]) VALUES (4, N'Duks', N'ž', N'Roze', N'Pamuk', N'Dug', N'Nike', CAST(6800 AS Numeric(18, 0)), 38, 1)
GO
SET IDENTITY_INSERT [dbo].[StavkaNarudzbenice] ON 

INSERT [dbo].[StavkaNarudzbenice] ([ID], [narudzbenicaId], [proizvodId], [brojKomada]) VALUES (1, 1, 1, NULL)
INSERT [dbo].[StavkaNarudzbenice] ([ID], [narudzbenicaId], [proizvodId], [brojKomada]) VALUES (2, 1, 1, 1)
INSERT [dbo].[StavkaNarudzbenice] ([ID], [narudzbenicaId], [proizvodId], [brojKomada]) VALUES (3, 9, 1, 1)
SET IDENTITY_INSERT [dbo].[StavkaNarudzbenice] OFF
GO
ALTER TABLE [dbo].[Korisnik]  WITH CHECK ADD  CONSTRAINT [FK_Korisnik_Mesto] FOREIGN KEY([mestoId])
REFERENCES [dbo].[Mesto] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Korisnik] CHECK CONSTRAINT [FK_Korisnik_Mesto]
GO
ALTER TABLE [dbo].[Narudzbenica]  WITH CHECK ADD  CONSTRAINT [FK_Narudzbenica_Korisnik1] FOREIGN KEY([korisnikId])
REFERENCES [dbo].[Korisnik] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Narudzbenica] CHECK CONSTRAINT [FK_Narudzbenica_Korisnik1]
GO
ALTER TABLE [dbo].[StavkaNarudzbenice]  WITH CHECK ADD  CONSTRAINT [FK_Stavka Narudzbenice_Narudzbenica] FOREIGN KEY([narudzbenicaId])
REFERENCES [dbo].[Narudzbenica] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StavkaNarudzbenice] CHECK CONSTRAINT [FK_Stavka Narudzbenice_Narudzbenica]
GO
ALTER TABLE [dbo].[StavkaNarudzbenice]  WITH CHECK ADD  CONSTRAINT [FK_Stavka Narudzbenice_Proizvod] FOREIGN KEY([proizvodId])
REFERENCES [dbo].[Proizvod] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[StavkaNarudzbenice] CHECK CONSTRAINT [FK_Stavka Narudzbenice_Proizvod]
GO
USE [master]
GO
ALTER DATABASE [MojaBaza] SET  READ_WRITE 
GO
