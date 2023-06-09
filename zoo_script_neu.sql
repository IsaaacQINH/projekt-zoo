USE [master]
GO
/****** Object:  Database [Zoo]    Script Date: 18.04.2023 09:03:31 ******/
CREATE DATABASE [Zoo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Zoo', FILENAME = N'H:\he\Zoo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Zoo_log', FILENAME = N'H:\he\Zoo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Zoo] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Zoo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Zoo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Zoo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Zoo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Zoo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Zoo] SET ARITHABORT OFF 
GO
ALTER DATABASE [Zoo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Zoo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Zoo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Zoo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Zoo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Zoo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Zoo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Zoo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Zoo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Zoo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Zoo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Zoo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Zoo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Zoo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Zoo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Zoo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Zoo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Zoo] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Zoo] SET  MULTI_USER 
GO
ALTER DATABASE [Zoo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Zoo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Zoo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Zoo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Zoo] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Zoo] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Zoo] SET QUERY_STORE = OFF
GO
/****** Object:  Login [Verwaltung1]    Script Date: 18.04.2023 09:03:31 ******/
CREATE LOGIN [Verwaltung1] WITH PASSWORD=N'1verwaltungdings', DEFAULT_DATABASE=[Zoo], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
/****** Object:  Login [Mitarbeiter2]    Script Date: 18.04.2023 09:03:31 ******/
CREATE LOGIN [Mitarbeiter2] WITH PASSWORD=N'2mitarbeiterdings', DEFAULT_DATABASE=[Zoo], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
/****** Object:  Login [Mitarbeiter1]    Script Date: 18.04.2023 09:03:31 ******/
CREATE LOGIN [Mitarbeiter1] WITH PASSWORD=N'1mitarbeiterdings', DEFAULT_DATABASE=[Zoo], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
/****** Object:  Login [Lagerist1]    Script Date: 18.04.2023 09:03:31 ******/
CREATE LOGIN [Lagerist1] WITH PASSWORD=N'1lageristdings', DEFAULT_DATABASE=[Zoo], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
USE [Zoo]
GO
/****** Object:  User [Verwaltung1]    Script Date: 18.04.2023 09:03:31 ******/
CREATE USER [Verwaltung1] FOR LOGIN [Verwaltung1] WITH DEFAULT_SCHEMA=[Verwaltung]
GO
/****** Object:  User [Mitarbeiter2]    Script Date: 18.04.2023 09:03:31 ******/
CREATE USER [Mitarbeiter2] FOR LOGIN [Mitarbeiter2] WITH DEFAULT_SCHEMA=[Mitarbeiter]
GO
/****** Object:  User [Mitarbeiter1]    Script Date: 18.04.2023 09:03:31 ******/
CREATE USER [Mitarbeiter1] FOR LOGIN [Mitarbeiter1] WITH DEFAULT_SCHEMA=[Mitarbeiter]
GO
/****** Object:  User [Lagerist1]    Script Date: 18.04.2023 09:03:31 ******/
CREATE USER [Lagerist1] FOR LOGIN [Lagerist1] WITH DEFAULT_SCHEMA=[Lageristen]
GO
/****** Object:  DatabaseRole [Verwaltung]    Script Date: 18.04.2023 09:03:31 ******/
CREATE ROLE [Verwaltung]
GO
/****** Object:  DatabaseRole [Mitarbeiter]    Script Date: 18.04.2023 09:03:31 ******/
CREATE ROLE [Mitarbeiter]
GO
/****** Object:  DatabaseRole [Lageristen]    Script Date: 18.04.2023 09:03:31 ******/
CREATE ROLE [Lageristen]
GO
ALTER AUTHORIZATION ON ROLE::[Verwaltung] TO [dbo]
GO
ALTER AUTHORIZATION ON ROLE::[Mitarbeiter] TO [dbo]
GO
ALTER AUTHORIZATION ON ROLE::[Lageristen] TO [dbo]
GO
ALTER ROLE [Verwaltung] ADD MEMBER [Verwaltung1]
GO
ALTER ROLE [Mitarbeiter] ADD MEMBER [Mitarbeiter2]
GO
ALTER ROLE [Mitarbeiter] ADD MEMBER [Mitarbeiter1]
GO
ALTER ROLE [Lageristen] ADD MEMBER [Lagerist1]
GO
GRANT CONNECT TO [Lagerist1] AS [dbo]
GO
GRANT CONNECT TO [Mitarbeiter1] AS [dbo]
GO
GRANT CONNECT TO [Mitarbeiter2] AS [dbo]
GO
GRANT VIEW ANY COLUMN ENCRYPTION KEY DEFINITION TO [public] AS [dbo]
GO
GRANT VIEW ANY COLUMN MASTER KEY DEFINITION TO [public] AS [dbo]
GO
GRANT CONNECT TO [Verwaltung1] AS [dbo]
GO
/****** Object:  Schema [Lageristen]    Script Date: 18.04.2023 09:03:32 ******/
CREATE SCHEMA [Lageristen] AUTHORIZATION [dbo]
GO
/****** Object:  Schema [Mitarbeiter]    Script Date: 18.04.2023 09:03:32 ******/
CREATE SCHEMA [Mitarbeiter] AUTHORIZATION [dbo]
GO
/****** Object:  Schema [Verwaltung]    Script Date: 18.04.2023 09:03:32 ******/
CREATE SCHEMA [Verwaltung] AUTHORIZATION [dbo]
GO
/****** Object:  Table [dbo].[Gehege]    Script Date: 18.04.2023 09:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gehege](
	[Gehege_ID] [smallint] NOT NULL,
	[Bezeichnung] [nvarchar](255) NULL,
	[Objekt_Nr] [smallint] NULL,
 CONSTRAINT [PK_Gehege] PRIMARY KEY CLUSTERED 
(
	[Gehege_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[Gehege] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Gehegebetreuung]    Script Date: 18.04.2023 09:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gehegebetreuung](
	[Pfleger_Nr] [smallint] NOT NULL,
	[Gehege_Nr] [smallint] NOT NULL,
 CONSTRAINT [PK_Gehegebetreuung] PRIMARY KEY CLUSTERED 
(
	[Pfleger_Nr] ASC,
	[Gehege_Nr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[Gehegebetreuung] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Mitarbeiter]    Script Date: 18.04.2023 09:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mitarbeiter](
	[MitArb_ID] [smallint] NOT NULL,
	[TaetigkeitNr] [smallint] NULL,
	[Name] [nvarchar](10) NULL,
	[Vorname] [nvarchar](10) NULL,
	[Strasse] [nvarchar](30) NULL,
	[PLZ] [nvarchar](255) NULL,
	[Ort] [nvarchar](255) NULL,
 CONSTRAINT [PK_Mitarbeiter] PRIMARY KEY CLUSTERED 
(
	[MitArb_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[Mitarbeiter] TO  SCHEMA OWNER 
GO
/****** Object:  View [dbo].[Gehegebetreuung_View]    Script Date: 18.04.2023 09:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** View Gehegebetreuung ******/
CREATE VIEW [dbo].[Gehegebetreuung_View]
AS
SELECT Mitarbeiter.Name AS Name, Mitarbeiter.Vorname AS Vorname, Gehege.Bezeichnung AS Gehege FROM Gehegebetreuung
JOIN Mitarbeiter ON Gehegebetreuung.Pfleger_Nr = Mitarbeiter.MitArb_ID 
JOIN Gehege ON Gehegebetreuung.Gehege_Nr = Gehege.Gehege_ID
GO
ALTER AUTHORIZATION ON [dbo].[Gehegebetreuung_View] TO  SCHEMA OWNER 
GO
DENY ALTER ON [dbo].[Gehegebetreuung_View] TO [Mitarbeiter] AS [dbo]
GO
DENY CONTROL ON [dbo].[Gehegebetreuung_View] TO [Mitarbeiter] AS [dbo]
GO
DENY DELETE ON [dbo].[Gehegebetreuung_View] TO [Mitarbeiter] AS [dbo]
GO
DENY INSERT ON [dbo].[Gehegebetreuung_View] TO [Mitarbeiter] AS [dbo]
GO
DENY REFERENCES ON [dbo].[Gehegebetreuung_View] TO [Mitarbeiter] AS [dbo]
GO
GRANT SELECT ON [dbo].[Gehegebetreuung_View] TO [Mitarbeiter] AS [dbo]
GO
GRANT UPDATE ON [dbo].[Gehegebetreuung_View] TO [Mitarbeiter] AS [dbo]
GO
GRANT TAKE OWNERSHIP ON [dbo].[Gehegebetreuung_View] TO [Mitarbeiter] WITH GRANT OPTION  AS [dbo]
GO
GRANT VIEW DEFINITION ON [dbo].[Gehegebetreuung_View] TO [Mitarbeiter] WITH GRANT OPTION  AS [dbo]
GO
DENY ALTER ON [dbo].[Gehegebetreuung_View] TO [Verwaltung] AS [dbo]
GO
DENY CONTROL ON [dbo].[Gehegebetreuung_View] TO [Verwaltung] AS [dbo]
GO
DENY DELETE ON [dbo].[Gehegebetreuung_View] TO [Verwaltung] AS [dbo]
GO
DENY INSERT ON [dbo].[Gehegebetreuung_View] TO [Verwaltung] AS [dbo]
GO
DENY REFERENCES ON [dbo].[Gehegebetreuung_View] TO [Verwaltung] AS [dbo]
GO
GRANT SELECT ON [dbo].[Gehegebetreuung_View] TO [Verwaltung] AS [dbo]
GO
GRANT UPDATE ON [dbo].[Gehegebetreuung_View] TO [Verwaltung] AS [dbo]
GO
GRANT TAKE OWNERSHIP ON [dbo].[Gehegebetreuung_View] TO [Verwaltung] WITH GRANT OPTION  AS [dbo]
GO
GRANT VIEW DEFINITION ON [dbo].[Gehegebetreuung_View] TO [Verwaltung] WITH GRANT OPTION  AS [dbo]
GO
/****** Object:  Table [dbo].[Tiere]    Script Date: 18.04.2023 09:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tiere](
	[TierNr] [smallint] NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Bezeichnung] [nvarchar](255) NULL,
	[Art] [smallint] NULL,
	[Anzahl] [smallint] NULL,
	[Gehege_Nr] [smallint] NULL,
 CONSTRAINT [PK_Tiere] PRIMARY KEY CLUSTERED 
(
	[TierNr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[Tiere] TO  SCHEMA OWNER 
GO
/****** Object:  View [dbo].[Tiere_View]    Script Date: 18.04.2023 09:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** View Tiere ******/
CREATE VIEW [dbo].[Tiere_View]
AS
SELECT Tiere.Name, Tiere.Bezeichnung, Art, Anzahl, Gehege_Nr AS Gehege FROM Tiere
JOIN Gehege ON Tiere.Gehege_NR = Gehege.Gehege_ID
GO
ALTER AUTHORIZATION ON [dbo].[Tiere_View] TO  SCHEMA OWNER 
GO
DENY ALTER ON [dbo].[Tiere_View] TO [Lageristen] AS [dbo]
GO
DENY CONTROL ON [dbo].[Tiere_View] TO [Lageristen] AS [dbo]
GO
DENY DELETE ON [dbo].[Tiere_View] TO [Lageristen] AS [dbo]
GO
DENY INSERT ON [dbo].[Tiere_View] TO [Lageristen] AS [dbo]
GO
DENY REFERENCES ON [dbo].[Tiere_View] TO [Lageristen] AS [dbo]
GO
GRANT SELECT ON [dbo].[Tiere_View] TO [Lageristen] AS [dbo]
GO
GRANT UPDATE ON [dbo].[Tiere_View] TO [Lageristen] AS [dbo]
GO
GRANT TAKE OWNERSHIP ON [dbo].[Tiere_View] TO [Lageristen] WITH GRANT OPTION  AS [dbo]
GO
GRANT VIEW DEFINITION ON [dbo].[Tiere_View] TO [Lageristen] WITH GRANT OPTION  AS [dbo]
GO
DENY ALTER ON [dbo].[Tiere_View] TO [Mitarbeiter] AS [dbo]
GO
DENY CONTROL ON [dbo].[Tiere_View] TO [Mitarbeiter] AS [dbo]
GO
DENY DELETE ON [dbo].[Tiere_View] TO [Mitarbeiter] AS [dbo]
GO
DENY INSERT ON [dbo].[Tiere_View] TO [Mitarbeiter] AS [dbo]
GO
DENY REFERENCES ON [dbo].[Tiere_View] TO [Mitarbeiter] AS [dbo]
GO
GRANT SELECT ON [dbo].[Tiere_View] TO [Mitarbeiter] AS [dbo]
GO
GRANT UPDATE ON [dbo].[Tiere_View] TO [Mitarbeiter] AS [dbo]
GO
GRANT TAKE OWNERSHIP ON [dbo].[Tiere_View] TO [Mitarbeiter] WITH GRANT OPTION  AS [dbo]
GO
GRANT VIEW DEFINITION ON [dbo].[Tiere_View] TO [Mitarbeiter] WITH GRANT OPTION  AS [dbo]
GO
DENY ALTER ON [dbo].[Tiere_View] TO [Verwaltung] AS [dbo]
GO
DENY CONTROL ON [dbo].[Tiere_View] TO [Verwaltung] AS [dbo]
GO
DENY DELETE ON [dbo].[Tiere_View] TO [Verwaltung] AS [dbo]
GO
DENY INSERT ON [dbo].[Tiere_View] TO [Verwaltung] AS [dbo]
GO
DENY REFERENCES ON [dbo].[Tiere_View] TO [Verwaltung] AS [dbo]
GO
GRANT SELECT ON [dbo].[Tiere_View] TO [Verwaltung] AS [dbo]
GO
GRANT UPDATE ON [dbo].[Tiere_View] TO [Verwaltung] AS [dbo]
GO
GRANT TAKE OWNERSHIP ON [dbo].[Tiere_View] TO [Verwaltung] WITH GRANT OPTION  AS [dbo]
GO
GRANT VIEW DEFINITION ON [dbo].[Tiere_View] TO [Verwaltung] WITH GRANT OPTION  AS [dbo]
GO
/****** Object:  Table [dbo].[Futterration]    Script Date: 18.04.2023 09:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Futterration](
	[Rations_ID] [smallint] NOT NULL,
	[Tiernummer] [smallint] NOT NULL,
	[Häufigkeit] [smallint] NULL,
 CONSTRAINT [PK_Futterration_1] PRIMARY KEY CLUSTERED 
(
	[Rations_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[Futterration] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Personal_Fuetterung]    Script Date: 18.04.2023 09:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personal_Fuetterung](
	[FuetterungNr] [smallint] NOT NULL,
	[PersonalNr] [smallint] NOT NULL,
	[Fuetterungstermin] [date] NULL,
 CONSTRAINT [PK_Personal_Fuetterung] PRIMARY KEY CLUSTERED 
(
	[FuetterungNr] ASC,
	[PersonalNr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[Personal_Fuetterung] TO  SCHEMA OWNER 
GO
/****** Object:  View [dbo].[VerantwortlicherFuetterung]    Script Date: 18.04.2023 09:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** View Personal_Fuetterung ******/
CREATE VIEW [dbo].[VerantwortlicherFuetterung]
AS
SELECT FuetterungNr AS Futterration , Mitarbeiter.Name AS Name, Mitarbeiter.Vorname AS Vorname, Fuetterungstermin FROM Personal_Fuetterung
JOIN Futterration ON FuetterungNr = Futterration.Rations_ID
JOIN Mitarbeiter ON PersonalNr = Mitarbeiter.MitArb_ID
GO
ALTER AUTHORIZATION ON [dbo].[VerantwortlicherFuetterung] TO  SCHEMA OWNER 
GO
DENY ALTER ON [dbo].[VerantwortlicherFuetterung] TO [Mitarbeiter] AS [dbo]
GO
DENY CONTROL ON [dbo].[VerantwortlicherFuetterung] TO [Mitarbeiter] AS [dbo]
GO
DENY DELETE ON [dbo].[VerantwortlicherFuetterung] TO [Mitarbeiter] AS [dbo]
GO
DENY INSERT ON [dbo].[VerantwortlicherFuetterung] TO [Mitarbeiter] AS [dbo]
GO
DENY REFERENCES ON [dbo].[VerantwortlicherFuetterung] TO [Mitarbeiter] AS [dbo]
GO
GRANT SELECT ON [dbo].[VerantwortlicherFuetterung] TO [Mitarbeiter] AS [dbo]
GO
GRANT UPDATE ON [dbo].[VerantwortlicherFuetterung] TO [Mitarbeiter] AS [dbo]
GO
GRANT TAKE OWNERSHIP ON [dbo].[VerantwortlicherFuetterung] TO [Mitarbeiter] WITH GRANT OPTION  AS [dbo]
GO
GRANT VIEW DEFINITION ON [dbo].[VerantwortlicherFuetterung] TO [Mitarbeiter] WITH GRANT OPTION  AS [dbo]
GO
/****** Object:  Table [dbo].[Behandlung]    Script Date: 18.04.2023 09:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Behandlung](
	[Behandlung_ID] [smallint] NOT NULL,
	[Diagnose] [nvarchar](255) NOT NULL,
	[Tier] [smallint] NULL,
 CONSTRAINT [PK_Behandlung] PRIMARY KEY CLUSTERED 
(
	[Behandlung_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[Behandlung] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Personal_Behandlung]    Script Date: 18.04.2023 09:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personal_Behandlung](
	[BehandlungNr] [smallint] NOT NULL,
	[PersonalNr] [smallint] NOT NULL,
	[Behandlungstermin] [date] NULL,
 CONSTRAINT [PK_Personal_Behandlung] PRIMARY KEY CLUSTERED 
(
	[BehandlungNr] ASC,
	[PersonalNr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[Personal_Behandlung] TO  SCHEMA OWNER 
GO
/****** Object:  View [dbo].[VerantwortlicherBehandlung]    Script Date: 18.04.2023 09:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** View Personal_Behandlung ******/
CREATE VIEW [dbo].[VerantwortlicherBehandlung]
AS
SELECT BehandlungNr AS Behandlung, Mitarbeiter.Name AS Nachname, Mitarbeiter.Vorname AS Vorname, Behandlungstermin FROM Personal_Behandlung
JOIN Behandlung ON BehandlungNr = Behandlung.Behandlung_ID
JOIN Mitarbeiter ON PersonalNr = Mitarbeiter.MitArb_ID
GO
ALTER AUTHORIZATION ON [dbo].[VerantwortlicherBehandlung] TO  SCHEMA OWNER 
GO
DENY ALTER ON [dbo].[VerantwortlicherBehandlung] TO [Mitarbeiter] AS [dbo]
GO
DENY CONTROL ON [dbo].[VerantwortlicherBehandlung] TO [Mitarbeiter] AS [dbo]
GO
DENY DELETE ON [dbo].[VerantwortlicherBehandlung] TO [Mitarbeiter] AS [dbo]
GO
DENY INSERT ON [dbo].[VerantwortlicherBehandlung] TO [Mitarbeiter] AS [dbo]
GO
DENY REFERENCES ON [dbo].[VerantwortlicherBehandlung] TO [Mitarbeiter] AS [dbo]
GO
GRANT SELECT ON [dbo].[VerantwortlicherBehandlung] TO [Mitarbeiter] AS [dbo]
GO
GRANT UPDATE ON [dbo].[VerantwortlicherBehandlung] TO [Mitarbeiter] AS [dbo]
GO
GRANT TAKE OWNERSHIP ON [dbo].[VerantwortlicherBehandlung] TO [Mitarbeiter] WITH GRANT OPTION  AS [dbo]
GO
GRANT VIEW DEFINITION ON [dbo].[VerantwortlicherBehandlung] TO [Mitarbeiter] WITH GRANT OPTION  AS [dbo]
GO
/****** Object:  Table [dbo].[Behandlung_Diagnose]    Script Date: 18.04.2023 09:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Behandlung_Diagnose](
	[BehandlungNr] [smallint] NOT NULL,
	[DiagnoseNr] [smallint] NOT NULL,
	[Diagnosedatum] [date] NOT NULL,
 CONSTRAINT [PK_Behandlung_Diagnose] PRIMARY KEY CLUSTERED 
(
	[BehandlungNr] ASC,
	[DiagnoseNr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[Behandlung_Diagnose] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Diagnose]    Script Date: 18.04.2023 09:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Diagnose](
	[Diagnose_ID] [smallint] NOT NULL,
	[Beschreibung] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Diagnose] PRIMARY KEY CLUSTERED 
(
	[Diagnose_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[Diagnose] TO  SCHEMA OWNER 
GO
/****** Object:  View [dbo].[Behandlung_View]    Script Date: 18.04.2023 09:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** View Behandlung ******/
CREATE VIEW [dbo].[Behandlung_View]
AS
SELECT Behandlung_ID, Diagnose, Tier FROM Behandlung
JOIN Behandlung_Diagnose ON Behandlung_ID = Behandlung_Diagnose.BehandlungNr
JOIN Diagnose ON Behandlung_Diagnose.DiagnoseNr = Diagnose.Diagnose_ID
GO
ALTER AUTHORIZATION ON [dbo].[Behandlung_View] TO  SCHEMA OWNER 
GO
DENY ALTER ON [dbo].[Behandlung_View] TO [Mitarbeiter] AS [dbo]
GO
DENY CONTROL ON [dbo].[Behandlung_View] TO [Mitarbeiter] AS [dbo]
GO
DENY DELETE ON [dbo].[Behandlung_View] TO [Mitarbeiter] AS [dbo]
GO
DENY INSERT ON [dbo].[Behandlung_View] TO [Mitarbeiter] AS [dbo]
GO
DENY REFERENCES ON [dbo].[Behandlung_View] TO [Mitarbeiter] AS [dbo]
GO
GRANT SELECT ON [dbo].[Behandlung_View] TO [Mitarbeiter] AS [dbo]
GO
GRANT UPDATE ON [dbo].[Behandlung_View] TO [Mitarbeiter] AS [dbo]
GO
GRANT TAKE OWNERSHIP ON [dbo].[Behandlung_View] TO [Mitarbeiter] WITH GRANT OPTION  AS [dbo]
GO
GRANT VIEW DEFINITION ON [dbo].[Behandlung_View] TO [Mitarbeiter] WITH GRANT OPTION  AS [dbo]
GO
/****** Object:  Table [dbo].[Arbeitsgruppe]    Script Date: 18.04.2023 09:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Arbeitsgruppe](
	[Taetigkeit_ID] [smallint] NOT NULL,
	[AbtNr] [smallint] NOT NULL,
	[Bezeichnung] [nvarchar](255) NULL,
 CONSTRAINT [PK_Arbeitsgruppe] PRIMARY KEY CLUSTERED 
(
	[Taetigkeit_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[Arbeitsgruppe] TO  SCHEMA OWNER 
GO
/****** Object:  View [dbo].[Mitarbeiter_View]    Script Date: 18.04.2023 09:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** View Mitarbeiter ******/
CREATE VIEW [dbo].[Mitarbeiter_View]
AS
SELECT        dbo.Mitarbeiter.Name, dbo.Mitarbeiter.Vorname, dbo.Arbeitsgruppe.Bezeichnung AS Beruf, dbo.Mitarbeiter.MitArb_ID AS ID, dbo.Mitarbeiter.Strasse, dbo.Mitarbeiter.PLZ, dbo.Mitarbeiter.Ort
FROM            dbo.Mitarbeiter INNER JOIN
                         dbo.Arbeitsgruppe ON dbo.Mitarbeiter.TaetigkeitNr = dbo.Arbeitsgruppe.Taetigkeit_ID
GO
ALTER AUTHORIZATION ON [dbo].[Mitarbeiter_View] TO  SCHEMA OWNER 
GO
DENY ALTER ON [dbo].[Mitarbeiter_View] TO [Verwaltung] AS [dbo]
GO
DENY CONTROL ON [dbo].[Mitarbeiter_View] TO [Verwaltung] AS [dbo]
GO
DENY DELETE ON [dbo].[Mitarbeiter_View] TO [Verwaltung] AS [dbo]
GO
DENY INSERT ON [dbo].[Mitarbeiter_View] TO [Verwaltung] AS [dbo]
GO
DENY REFERENCES ON [dbo].[Mitarbeiter_View] TO [Verwaltung] AS [dbo]
GO
GRANT SELECT ON [dbo].[Mitarbeiter_View] TO [Verwaltung] AS [dbo]
GO
GRANT UPDATE ON [dbo].[Mitarbeiter_View] TO [Verwaltung] AS [dbo]
GO
GRANT TAKE OWNERSHIP ON [dbo].[Mitarbeiter_View] TO [Verwaltung] WITH GRANT OPTION  AS [dbo]
GO
GRANT VIEW DEFINITION ON [dbo].[Mitarbeiter_View] TO [Verwaltung] WITH GRANT OPTION  AS [dbo]
GO
/****** Object:  Table [dbo].[Futter]    Script Date: 18.04.2023 09:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Futter](
	[Futter_ID] [smallint] NOT NULL,
	[KategorieNr] [smallint] NULL,
	[Futter_Name] [nvarchar](255) NULL,
 CONSTRAINT [PK_Futter] PRIMARY KEY CLUSTERED 
(
	[Futter_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[Futter] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Lager]    Script Date: 18.04.2023 09:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lager](
	[Lager_ID] [smallint] NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Standort] [nvarchar](255) NULL,
 CONSTRAINT [PK_Lager] PRIMARY KEY CLUSTERED 
(
	[Lager_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[Lager] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Lagerposition]    Script Date: 18.04.2023 09:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lagerposition](
	[Futter_Nr] [smallint] NOT NULL,
	[Lager_Nr] [smallint] NOT NULL,
	[Lagermenge] [int] NULL,
 CONSTRAINT [PK_Lagerposition] PRIMARY KEY CLUSTERED 
(
	[Futter_Nr] ASC,
	[Lager_Nr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[Lagerposition] TO  SCHEMA OWNER 
GO
/****** Object:  View [dbo].[LagerungFutter]    Script Date: 18.04.2023 09:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** View Lagerposition ******/
CREATE VIEW [dbo].[LagerungFutter]
AS
SELECT Lager_Nr AS PositionLager, Futter_Name AS Futter, Lagermenge FROM Lagerposition
JOIN Lager ON Lager_Nr = Lager.Lager_ID
JOIN Futter ON Futter_Nr = Futter.Futter_ID
GO
ALTER AUTHORIZATION ON [dbo].[LagerungFutter] TO  SCHEMA OWNER 
GO
DENY ALTER ON [dbo].[LagerungFutter] TO [Lageristen] AS [dbo]
GO
DENY CONTROL ON [dbo].[LagerungFutter] TO [Lageristen] AS [dbo]
GO
DENY DELETE ON [dbo].[LagerungFutter] TO [Lageristen] AS [dbo]
GO
DENY INSERT ON [dbo].[LagerungFutter] TO [Lageristen] AS [dbo]
GO
DENY REFERENCES ON [dbo].[LagerungFutter] TO [Lageristen] AS [dbo]
GO
GRANT SELECT ON [dbo].[LagerungFutter] TO [Lageristen] AS [dbo]
GO
GRANT UPDATE ON [dbo].[LagerungFutter] TO [Lageristen] AS [dbo]
GO
GRANT TAKE OWNERSHIP ON [dbo].[LagerungFutter] TO [Lageristen] WITH GRANT OPTION  AS [dbo]
GO
GRANT VIEW DEFINITION ON [dbo].[LagerungFutter] TO [Lageristen] WITH GRANT OPTION  AS [dbo]
GO
/****** Object:  View [dbo].[Mitarbeiter_Taetigkeit_Tierpfleger]    Script Date: 18.04.2023 09:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** View Mitarbeiter_Taetigkeit ******/
CREATE VIEW [dbo].[Mitarbeiter_Taetigkeit_Tierpfleger]
AS
SELECT Name, Vorname FROM Mitarbeiter
JOIN Arbeitsgruppe ON TaetigkeitNr = Arbeitsgruppe.Taetigkeit_ID WHERE Arbeitsgruppe.Bezeichnung = 'Tierpfleger'
GO
ALTER AUTHORIZATION ON [dbo].[Mitarbeiter_Taetigkeit_Tierpfleger] TO  SCHEMA OWNER 
GO
DENY ALTER ON [dbo].[Mitarbeiter_Taetigkeit_Tierpfleger] TO [Verwaltung] AS [dbo]
GO
DENY CONTROL ON [dbo].[Mitarbeiter_Taetigkeit_Tierpfleger] TO [Verwaltung] AS [dbo]
GO
DENY DELETE ON [dbo].[Mitarbeiter_Taetigkeit_Tierpfleger] TO [Verwaltung] AS [dbo]
GO
DENY INSERT ON [dbo].[Mitarbeiter_Taetigkeit_Tierpfleger] TO [Verwaltung] AS [dbo]
GO
DENY REFERENCES ON [dbo].[Mitarbeiter_Taetigkeit_Tierpfleger] TO [Verwaltung] AS [dbo]
GO
GRANT SELECT ON [dbo].[Mitarbeiter_Taetigkeit_Tierpfleger] TO [Verwaltung] AS [dbo]
GO
GRANT UPDATE ON [dbo].[Mitarbeiter_Taetigkeit_Tierpfleger] TO [Verwaltung] AS [dbo]
GO
GRANT TAKE OWNERSHIP ON [dbo].[Mitarbeiter_Taetigkeit_Tierpfleger] TO [Verwaltung] WITH GRANT OPTION  AS [dbo]
GO
GRANT VIEW DEFINITION ON [dbo].[Mitarbeiter_Taetigkeit_Tierpfleger] TO [Verwaltung] WITH GRANT OPTION  AS [dbo]
GO
/****** Object:  View [dbo].[Anzahl_Diagnosen]    Script Date: 18.04.2023 09:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** View Diagnose ******/
CREATE VIEW [dbo].[Anzahl_Diagnosen]
AS 
SELECT COUNT(*) AS AnzahlDiagnosen FROM Diagnose
GO
ALTER AUTHORIZATION ON [dbo].[Anzahl_Diagnosen] TO  SCHEMA OWNER 
GO
DENY ALTER ON [dbo].[Anzahl_Diagnosen] TO [Mitarbeiter] AS [dbo]
GO
DENY CONTROL ON [dbo].[Anzahl_Diagnosen] TO [Mitarbeiter] AS [dbo]
GO
DENY DELETE ON [dbo].[Anzahl_Diagnosen] TO [Mitarbeiter] AS [dbo]
GO
DENY INSERT ON [dbo].[Anzahl_Diagnosen] TO [Mitarbeiter] AS [dbo]
GO
DENY REFERENCES ON [dbo].[Anzahl_Diagnosen] TO [Mitarbeiter] AS [dbo]
GO
GRANT SELECT ON [dbo].[Anzahl_Diagnosen] TO [Mitarbeiter] AS [dbo]
GO
GRANT UPDATE ON [dbo].[Anzahl_Diagnosen] TO [Mitarbeiter] AS [dbo]
GO
GRANT TAKE OWNERSHIP ON [dbo].[Anzahl_Diagnosen] TO [Mitarbeiter] WITH GRANT OPTION  AS [dbo]
GO
GRANT VIEW DEFINITION ON [dbo].[Anzahl_Diagnosen] TO [Mitarbeiter] WITH GRANT OPTION  AS [dbo]
GO
/****** Object:  View [dbo].[Anzahl_Behandlungen]    Script Date: 18.04.2023 09:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** View Behandlung ******/
CREATE VIEW [dbo].[Anzahl_Behandlungen]
AS
SELECT COUNT(*) AS AnzahlBehandlungen FROM Behandlung
GO
ALTER AUTHORIZATION ON [dbo].[Anzahl_Behandlungen] TO  SCHEMA OWNER 
GO
DENY ALTER ON [dbo].[Anzahl_Behandlungen] TO [Mitarbeiter] AS [dbo]
GO
DENY CONTROL ON [dbo].[Anzahl_Behandlungen] TO [Mitarbeiter] AS [dbo]
GO
DENY DELETE ON [dbo].[Anzahl_Behandlungen] TO [Mitarbeiter] AS [dbo]
GO
DENY INSERT ON [dbo].[Anzahl_Behandlungen] TO [Mitarbeiter] AS [dbo]
GO
DENY REFERENCES ON [dbo].[Anzahl_Behandlungen] TO [Mitarbeiter] AS [dbo]
GO
GRANT SELECT ON [dbo].[Anzahl_Behandlungen] TO [Mitarbeiter] AS [dbo]
GO
GRANT UPDATE ON [dbo].[Anzahl_Behandlungen] TO [Mitarbeiter] AS [dbo]
GO
GRANT TAKE OWNERSHIP ON [dbo].[Anzahl_Behandlungen] TO [Mitarbeiter] WITH GRANT OPTION  AS [dbo]
GO
GRANT VIEW DEFINITION ON [dbo].[Anzahl_Behandlungen] TO [Mitarbeiter] WITH GRANT OPTION  AS [dbo]
GO
/****** Object:  View [dbo].[Anzahl_Futter]    Script Date: 18.04.2023 09:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** View Futter ******/
CREATE VIEW [dbo].[Anzahl_Futter]
AS
SELECT COUNT(*) AS AnzahlFutter FROM Futter
GO
ALTER AUTHORIZATION ON [dbo].[Anzahl_Futter] TO  SCHEMA OWNER 
GO
DENY ALTER ON [dbo].[Anzahl_Futter] TO [Lageristen] AS [dbo]
GO
DENY CONTROL ON [dbo].[Anzahl_Futter] TO [Lageristen] AS [dbo]
GO
DENY DELETE ON [dbo].[Anzahl_Futter] TO [Lageristen] AS [dbo]
GO
DENY INSERT ON [dbo].[Anzahl_Futter] TO [Lageristen] AS [dbo]
GO
DENY REFERENCES ON [dbo].[Anzahl_Futter] TO [Lageristen] AS [dbo]
GO
GRANT SELECT ON [dbo].[Anzahl_Futter] TO [Lageristen] AS [dbo]
GO
GRANT UPDATE ON [dbo].[Anzahl_Futter] TO [Lageristen] AS [dbo]
GO
GRANT TAKE OWNERSHIP ON [dbo].[Anzahl_Futter] TO [Lageristen] WITH GRANT OPTION  AS [dbo]
GO
GRANT VIEW DEFINITION ON [dbo].[Anzahl_Futter] TO [Lageristen] WITH GRANT OPTION  AS [dbo]
GO
/****** Object:  Table [dbo].[ObjektArt]    Script Date: 18.04.2023 09:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObjektArt](
	[Art_ID] [smallint] NOT NULL,
	[Bezeichnung] [nvarchar](255) NULL,
 CONSTRAINT [PK_ObjektArt] PRIMARY KEY CLUSTERED 
(
	[Art_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[ObjektArt] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Objekte]    Script Date: 18.04.2023 09:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Objekte](
	[Objekt_ID] [smallint] NOT NULL,
	[ArtNr] [smallint] NULL,
	[Bezeichnung] [nvarchar](255) NULL,
 CONSTRAINT [PK_Objekte] PRIMARY KEY CLUSTERED 
(
	[Objekt_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[Objekte] TO  SCHEMA OWNER 
GO
/****** Object:  View [dbo].[Tier_Gehege_Objekt]    Script Date: 18.04.2023 09:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** View Tier_Gehege_Objekt ******/
CREATE VIEW [dbo].[Tier_Gehege_Objekt]
AS
SELECT Name, Tiere.Bezeichnung, Art AS Tierart, Gehege.Bezeichnung AS Gehege, Objekte.Bezeichnung AS Objekt, ObjektArt.Bezeichnung AS ObjektArt FROM Tiere
JOIN Gehege ON Tiere.Gehege_Nr = Gehege.Gehege_ID
JOIN Objekte ON Gehege.Objekt_Nr = Objekte.Objekt_ID
JOIN ObjektArt ON Objekte.ArtNr = ObjektArt.Art_ID
GO
ALTER AUTHORIZATION ON [dbo].[Tier_Gehege_Objekt] TO  SCHEMA OWNER 
GO
DENY ALTER ON [dbo].[Tier_Gehege_Objekt] TO [Mitarbeiter] AS [dbo]
GO
DENY CONTROL ON [dbo].[Tier_Gehege_Objekt] TO [Mitarbeiter] AS [dbo]
GO
DENY DELETE ON [dbo].[Tier_Gehege_Objekt] TO [Mitarbeiter] AS [dbo]
GO
DENY INSERT ON [dbo].[Tier_Gehege_Objekt] TO [Mitarbeiter] AS [dbo]
GO
DENY REFERENCES ON [dbo].[Tier_Gehege_Objekt] TO [Mitarbeiter] AS [dbo]
GO
GRANT SELECT ON [dbo].[Tier_Gehege_Objekt] TO [Mitarbeiter] AS [dbo]
GO
GRANT UPDATE ON [dbo].[Tier_Gehege_Objekt] TO [Mitarbeiter] AS [dbo]
GO
GRANT TAKE OWNERSHIP ON [dbo].[Tier_Gehege_Objekt] TO [Mitarbeiter] WITH GRANT OPTION  AS [dbo]
GO
GRANT VIEW DEFINITION ON [dbo].[Tier_Gehege_Objekt] TO [Mitarbeiter] WITH GRANT OPTION  AS [dbo]
GO
/****** Object:  Table [dbo].[Futterkategorie]    Script Date: 18.04.2023 09:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Futterkategorie](
	[Kategorie_ID] [smallint] NOT NULL,
	[Name] [nvarchar](255) NULL,
 CONSTRAINT [PK_Futterkategorie] PRIMARY KEY CLUSTERED 
(
	[Kategorie_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[Futterkategorie] TO  SCHEMA OWNER 
GO
/****** Object:  View [dbo].[Futter_View]    Script Date: 18.04.2023 09:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** View Futter ******/
CREATE VIEW [dbo].[Futter_View]
AS
SELECT Futterkategorie.Name AS Kategorie, Futter_Name FROM Futter
JOIN Futterkategorie ON Futter.KategorieNr = Futterkategorie.Kategorie_ID
GO
ALTER AUTHORIZATION ON [dbo].[Futter_View] TO  SCHEMA OWNER 
GO
DENY ALTER ON [dbo].[Futter_View] TO [Lageristen] AS [dbo]
GO
DENY CONTROL ON [dbo].[Futter_View] TO [Lageristen] AS [dbo]
GO
DENY DELETE ON [dbo].[Futter_View] TO [Lageristen] AS [dbo]
GO
DENY INSERT ON [dbo].[Futter_View] TO [Lageristen] AS [dbo]
GO
DENY REFERENCES ON [dbo].[Futter_View] TO [Lageristen] AS [dbo]
GO
GRANT SELECT ON [dbo].[Futter_View] TO [Lageristen] AS [dbo]
GO
GRANT UPDATE ON [dbo].[Futter_View] TO [Lageristen] AS [dbo]
GO
GRANT TAKE OWNERSHIP ON [dbo].[Futter_View] TO [Lageristen] WITH GRANT OPTION  AS [dbo]
GO
GRANT VIEW DEFINITION ON [dbo].[Futter_View] TO [Lageristen] WITH GRANT OPTION  AS [dbo]
GO
/****** Object:  View [dbo].[Anzahl_Mitarbeiter_pro_Arbeitsgruppe]    Script Date: 18.04.2023 09:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** View Mitarbeiter_Anzahl_pro_Arbeitsgruppe ******/
CREATE VIEW [dbo].[Anzahl_Mitarbeiter_pro_Arbeitsgruppe]
AS
SELECT Arbeitsgruppe.Bezeichnung AS Arbeitsgruppe ,COUNT(*) AS AnzahlMitarbeiter FROM Mitarbeiter
JOIN Arbeitsgruppe ON Mitarbeiter.TaetigkeitNr = Arbeitsgruppe.Taetigkeit_ID GROUP BY Arbeitsgruppe.Bezeichnung
GO
ALTER AUTHORIZATION ON [dbo].[Anzahl_Mitarbeiter_pro_Arbeitsgruppe] TO  SCHEMA OWNER 
GO
DENY ALTER ON [dbo].[Anzahl_Mitarbeiter_pro_Arbeitsgruppe] TO [Mitarbeiter] AS [dbo]
GO
DENY CONTROL ON [dbo].[Anzahl_Mitarbeiter_pro_Arbeitsgruppe] TO [Mitarbeiter] AS [dbo]
GO
DENY DELETE ON [dbo].[Anzahl_Mitarbeiter_pro_Arbeitsgruppe] TO [Mitarbeiter] AS [dbo]
GO
DENY INSERT ON [dbo].[Anzahl_Mitarbeiter_pro_Arbeitsgruppe] TO [Mitarbeiter] AS [dbo]
GO
DENY REFERENCES ON [dbo].[Anzahl_Mitarbeiter_pro_Arbeitsgruppe] TO [Mitarbeiter] AS [dbo]
GO
GRANT SELECT ON [dbo].[Anzahl_Mitarbeiter_pro_Arbeitsgruppe] TO [Mitarbeiter] AS [dbo]
GO
GRANT UPDATE ON [dbo].[Anzahl_Mitarbeiter_pro_Arbeitsgruppe] TO [Mitarbeiter] AS [dbo]
GO
GRANT TAKE OWNERSHIP ON [dbo].[Anzahl_Mitarbeiter_pro_Arbeitsgruppe] TO [Mitarbeiter] WITH GRANT OPTION  AS [dbo]
GO
GRANT VIEW DEFINITION ON [dbo].[Anzahl_Mitarbeiter_pro_Arbeitsgruppe] TO [Mitarbeiter] WITH GRANT OPTION  AS [dbo]
GO
DENY ALTER ON [dbo].[Anzahl_Mitarbeiter_pro_Arbeitsgruppe] TO [Verwaltung] AS [dbo]
GO
DENY CONTROL ON [dbo].[Anzahl_Mitarbeiter_pro_Arbeitsgruppe] TO [Verwaltung] AS [dbo]
GO
DENY DELETE ON [dbo].[Anzahl_Mitarbeiter_pro_Arbeitsgruppe] TO [Verwaltung] AS [dbo]
GO
DENY INSERT ON [dbo].[Anzahl_Mitarbeiter_pro_Arbeitsgruppe] TO [Verwaltung] AS [dbo]
GO
DENY REFERENCES ON [dbo].[Anzahl_Mitarbeiter_pro_Arbeitsgruppe] TO [Verwaltung] AS [dbo]
GO
GRANT SELECT ON [dbo].[Anzahl_Mitarbeiter_pro_Arbeitsgruppe] TO [Verwaltung] AS [dbo]
GO
GRANT UPDATE ON [dbo].[Anzahl_Mitarbeiter_pro_Arbeitsgruppe] TO [Verwaltung] AS [dbo]
GO
GRANT TAKE OWNERSHIP ON [dbo].[Anzahl_Mitarbeiter_pro_Arbeitsgruppe] TO [Verwaltung] WITH GRANT OPTION  AS [dbo]
GO
GRANT VIEW DEFINITION ON [dbo].[Anzahl_Mitarbeiter_pro_Arbeitsgruppe] TO [Verwaltung] WITH GRANT OPTION  AS [dbo]
GO
/****** Object:  View [dbo].[Anzahl_Lagerposition]    Script Date: 18.04.2023 09:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** View Lagerposition_Anzahl ******/
CREATE VIEW [dbo].[Anzahl_Lagerposition]
AS
SELECT Lager.Name, Lager.Standort, COUNT(*) AS Anzahl_Lagerpositionen FROM Lagerposition
JOIN Lager ON Lager_Nr = Lager.Lager_ID GROUP BY Lager.Name, Lager.Standort
GO
ALTER AUTHORIZATION ON [dbo].[Anzahl_Lagerposition] TO  SCHEMA OWNER 
GO
DENY ALTER ON [dbo].[Anzahl_Lagerposition] TO [Lageristen] AS [dbo]
GO
DENY CONTROL ON [dbo].[Anzahl_Lagerposition] TO [Lageristen] AS [dbo]
GO
DENY DELETE ON [dbo].[Anzahl_Lagerposition] TO [Lageristen] AS [dbo]
GO
DENY INSERT ON [dbo].[Anzahl_Lagerposition] TO [Lageristen] AS [dbo]
GO
DENY REFERENCES ON [dbo].[Anzahl_Lagerposition] TO [Lageristen] AS [dbo]
GO
GRANT SELECT ON [dbo].[Anzahl_Lagerposition] TO [Lageristen] AS [dbo]
GO
GRANT UPDATE ON [dbo].[Anzahl_Lagerposition] TO [Lageristen] AS [dbo]
GO
GRANT TAKE OWNERSHIP ON [dbo].[Anzahl_Lagerposition] TO [Lageristen] WITH GRANT OPTION  AS [dbo]
GO
GRANT VIEW DEFINITION ON [dbo].[Anzahl_Lagerposition] TO [Lageristen] WITH GRANT OPTION  AS [dbo]
GO
DENY ALTER ON [dbo].[Anzahl_Lagerposition] TO [Verwaltung] AS [dbo]
GO
DENY CONTROL ON [dbo].[Anzahl_Lagerposition] TO [Verwaltung] AS [dbo]
GO
DENY DELETE ON [dbo].[Anzahl_Lagerposition] TO [Verwaltung] AS [dbo]
GO
DENY INSERT ON [dbo].[Anzahl_Lagerposition] TO [Verwaltung] AS [dbo]
GO
DENY REFERENCES ON [dbo].[Anzahl_Lagerposition] TO [Verwaltung] AS [dbo]
GO
GRANT SELECT ON [dbo].[Anzahl_Lagerposition] TO [Verwaltung] AS [dbo]
GO
GRANT UPDATE ON [dbo].[Anzahl_Lagerposition] TO [Verwaltung] AS [dbo]
GO
GRANT TAKE OWNERSHIP ON [dbo].[Anzahl_Lagerposition] TO [Verwaltung] WITH GRANT OPTION  AS [dbo]
GO
GRANT VIEW DEFINITION ON [dbo].[Anzahl_Lagerposition] TO [Verwaltung] WITH GRANT OPTION  AS [dbo]
GO
/****** Object:  View [dbo].[Objekte_View]    Script Date: 18.04.2023 09:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** View Objekte ******/
CREATE VIEW [dbo].[Objekte_View]
AS 
SELECT Objekte.Bezeichnung AS Objekt, ObjektArt.Bezeichnung AS Art FROM Objekte
JOIN ObjektArt ON Objekte.ArtNr = ObjektArt.Art_ID
GO
ALTER AUTHORIZATION ON [dbo].[Objekte_View] TO  SCHEMA OWNER 
GO
DENY ALTER ON [dbo].[Objekte_View] TO [Verwaltung] AS [dbo]
GO
DENY CONTROL ON [dbo].[Objekte_View] TO [Verwaltung] AS [dbo]
GO
DENY DELETE ON [dbo].[Objekte_View] TO [Verwaltung] AS [dbo]
GO
DENY INSERT ON [dbo].[Objekte_View] TO [Verwaltung] AS [dbo]
GO
DENY REFERENCES ON [dbo].[Objekte_View] TO [Verwaltung] AS [dbo]
GO
GRANT SELECT ON [dbo].[Objekte_View] TO [Verwaltung] AS [dbo]
GO
GRANT UPDATE ON [dbo].[Objekte_View] TO [Verwaltung] AS [dbo]
GO
GRANT TAKE OWNERSHIP ON [dbo].[Objekte_View] TO [Verwaltung] WITH GRANT OPTION  AS [dbo]
GO
GRANT VIEW DEFINITION ON [dbo].[Objekte_View] TO [Verwaltung] WITH GRANT OPTION  AS [dbo]
GO
/****** Object:  Table [dbo].[Abteilung]    Script Date: 18.04.2023 09:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Abteilung](
	[Abt_ID] [smallint] NOT NULL,
	[Bezeichnung] [nvarchar](255) NULL,
 CONSTRAINT [PK_Abteilung] PRIMARY KEY CLUSTERED 
(
	[Abt_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[Abteilung] TO  SCHEMA OWNER 
GO
/****** Object:  View [dbo].[Arbeitsgruppe_View]    Script Date: 18.04.2023 09:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** View Arbeitsgruppe ******/
CREATE VIEW [dbo].[Arbeitsgruppe_View]
AS
SELECT Arbeitsgruppe.Bezeichnung AS Arbeitsgruppe, Abteilung.Bezeichnung AS Abteilung FROM Arbeitsgruppe
JOIN Abteilung ON AbtNR = Abt_ID
GO
ALTER AUTHORIZATION ON [dbo].[Arbeitsgruppe_View] TO  SCHEMA OWNER 
GO
DENY ALTER ON [dbo].[Arbeitsgruppe_View] TO [Mitarbeiter] AS [dbo]
GO
DENY CONTROL ON [dbo].[Arbeitsgruppe_View] TO [Mitarbeiter] AS [dbo]
GO
DENY DELETE ON [dbo].[Arbeitsgruppe_View] TO [Mitarbeiter] AS [dbo]
GO
DENY INSERT ON [dbo].[Arbeitsgruppe_View] TO [Mitarbeiter] AS [dbo]
GO
DENY REFERENCES ON [dbo].[Arbeitsgruppe_View] TO [Mitarbeiter] AS [dbo]
GO
GRANT SELECT ON [dbo].[Arbeitsgruppe_View] TO [Mitarbeiter] AS [dbo]
GO
GRANT UPDATE ON [dbo].[Arbeitsgruppe_View] TO [Mitarbeiter] AS [dbo]
GO
GRANT TAKE OWNERSHIP ON [dbo].[Arbeitsgruppe_View] TO [Mitarbeiter] WITH GRANT OPTION  AS [dbo]
GO
GRANT VIEW DEFINITION ON [dbo].[Arbeitsgruppe_View] TO [Mitarbeiter] WITH GRANT OPTION  AS [dbo]
GO
DENY ALTER ON [dbo].[Arbeitsgruppe_View] TO [Verwaltung] AS [dbo]
GO
DENY CONTROL ON [dbo].[Arbeitsgruppe_View] TO [Verwaltung] AS [dbo]
GO
DENY DELETE ON [dbo].[Arbeitsgruppe_View] TO [Verwaltung] AS [dbo]
GO
DENY INSERT ON [dbo].[Arbeitsgruppe_View] TO [Verwaltung] AS [dbo]
GO
DENY REFERENCES ON [dbo].[Arbeitsgruppe_View] TO [Verwaltung] AS [dbo]
GO
GRANT SELECT ON [dbo].[Arbeitsgruppe_View] TO [Verwaltung] AS [dbo]
GO
GRANT UPDATE ON [dbo].[Arbeitsgruppe_View] TO [Verwaltung] AS [dbo]
GO
GRANT TAKE OWNERSHIP ON [dbo].[Arbeitsgruppe_View] TO [Verwaltung] WITH GRANT OPTION  AS [dbo]
GO
GRANT VIEW DEFINITION ON [dbo].[Arbeitsgruppe_View] TO [Verwaltung] WITH GRANT OPTION  AS [dbo]
GO
/****** Object:  Table [dbo].[Art]    Script Date: 18.04.2023 09:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Art](
	[Tierart_ID] [smallint] NOT NULL,
	[Tierart] [nvarchar](255) NULL,
	[Klasse] [smallint] NULL,
 CONSTRAINT [PK_Art] PRIMARY KEY CLUSTERED 
(
	[Tierart_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[Art] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Klasse]    Script Date: 18.04.2023 09:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Klasse](
	[Klasse_ID] [smallint] IDENTITY(1,1) NOT NULL,
	[Klassenname] [nvarchar](255) NULL,
 CONSTRAINT [PK_Klasse] PRIMARY KEY CLUSTERED 
(
	[Klasse_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[Klasse] TO  SCHEMA OWNER 
GO
/****** Object:  View [dbo].[Art_View]    Script Date: 18.04.2023 09:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** View Art ******/
CREATE VIEW [dbo].[Art_View]
AS
SELECT Tierart, Klassenname FROM Art
JOIN Klasse ON Art.Klasse = Klasse.Klasse_ID
GO
ALTER AUTHORIZATION ON [dbo].[Art_View] TO  SCHEMA OWNER 
GO
DENY ALTER ON [dbo].[Art_View] TO [Mitarbeiter] AS [dbo]
GO
DENY CONTROL ON [dbo].[Art_View] TO [Mitarbeiter] AS [dbo]
GO
DENY DELETE ON [dbo].[Art_View] TO [Mitarbeiter] AS [dbo]
GO
DENY INSERT ON [dbo].[Art_View] TO [Mitarbeiter] AS [dbo]
GO
DENY REFERENCES ON [dbo].[Art_View] TO [Mitarbeiter] AS [dbo]
GO
GRANT SELECT ON [dbo].[Art_View] TO [Mitarbeiter] AS [dbo]
GO
GRANT UPDATE ON [dbo].[Art_View] TO [Mitarbeiter] AS [dbo]
GO
GRANT TAKE OWNERSHIP ON [dbo].[Art_View] TO [Mitarbeiter] WITH GRANT OPTION  AS [dbo]
GO
GRANT VIEW DEFINITION ON [dbo].[Art_View] TO [Mitarbeiter] WITH GRANT OPTION  AS [dbo]
GO
/****** Object:  View [dbo].[Diagnose_View]    Script Date: 18.04.2023 09:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** View Diagnose ******/
CREATE VIEW [dbo].[Diagnose_View]
AS
SELECT Beschreibung FROM Diagnose 
GO
ALTER AUTHORIZATION ON [dbo].[Diagnose_View] TO  SCHEMA OWNER 
GO
DENY ALTER ON [dbo].[Diagnose_View] TO [Mitarbeiter] AS [dbo]
GO
DENY CONTROL ON [dbo].[Diagnose_View] TO [Mitarbeiter] AS [dbo]
GO
DENY DELETE ON [dbo].[Diagnose_View] TO [Mitarbeiter] AS [dbo]
GO
DENY INSERT ON [dbo].[Diagnose_View] TO [Mitarbeiter] AS [dbo]
GO
DENY REFERENCES ON [dbo].[Diagnose_View] TO [Mitarbeiter] AS [dbo]
GO
GRANT SELECT ON [dbo].[Diagnose_View] TO [Mitarbeiter] AS [dbo]
GO
GRANT UPDATE ON [dbo].[Diagnose_View] TO [Mitarbeiter] AS [dbo]
GO
GRANT TAKE OWNERSHIP ON [dbo].[Diagnose_View] TO [Mitarbeiter] WITH GRANT OPTION  AS [dbo]
GO
GRANT VIEW DEFINITION ON [dbo].[Diagnose_View] TO [Mitarbeiter] WITH GRANT OPTION  AS [dbo]
GO
/****** Object:  View [dbo].[Lager_View]    Script Date: 18.04.2023 09:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** View Lager ******/
CREATE VIEW [dbo].[Lager_View]
AS
SELECT Name, Standort FROM Lager
GO
ALTER AUTHORIZATION ON [dbo].[Lager_View] TO  SCHEMA OWNER 
GO
DENY ALTER ON [dbo].[Lager_View] TO [Lageristen] AS [dbo]
GO
DENY CONTROL ON [dbo].[Lager_View] TO [Lageristen] AS [dbo]
GO
DENY DELETE ON [dbo].[Lager_View] TO [Lageristen] AS [dbo]
GO
DENY INSERT ON [dbo].[Lager_View] TO [Lageristen] AS [dbo]
GO
DENY REFERENCES ON [dbo].[Lager_View] TO [Lageristen] AS [dbo]
GO
GRANT SELECT ON [dbo].[Lager_View] TO [Lageristen] AS [dbo]
GO
GRANT UPDATE ON [dbo].[Lager_View] TO [Lageristen] AS [dbo]
GO
GRANT TAKE OWNERSHIP ON [dbo].[Lager_View] TO [Lageristen] WITH GRANT OPTION  AS [dbo]
GO
GRANT VIEW DEFINITION ON [dbo].[Lager_View] TO [Lageristen] WITH GRANT OPTION  AS [dbo]
GO
/****** Object:  View [dbo].[Abteilung_View]    Script Date: 18.04.2023 09:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** View Abteilung ******/
CREATE VIEW [dbo].[Abteilung_View]
AS
SELECT Bezeichnung FROM Abteilung
GO
ALTER AUTHORIZATION ON [dbo].[Abteilung_View] TO  SCHEMA OWNER 
GO
DENY ALTER ON [dbo].[Abteilung_View] TO [Mitarbeiter] AS [dbo]
GO
DENY CONTROL ON [dbo].[Abteilung_View] TO [Mitarbeiter] AS [dbo]
GO
DENY DELETE ON [dbo].[Abteilung_View] TO [Mitarbeiter] AS [dbo]
GO
DENY INSERT ON [dbo].[Abteilung_View] TO [Mitarbeiter] AS [dbo]
GO
DENY REFERENCES ON [dbo].[Abteilung_View] TO [Mitarbeiter] AS [dbo]
GO
GRANT SELECT ON [dbo].[Abteilung_View] TO [Mitarbeiter] AS [dbo]
GO
GRANT UPDATE ON [dbo].[Abteilung_View] TO [Mitarbeiter] AS [dbo]
GO
GRANT TAKE OWNERSHIP ON [dbo].[Abteilung_View] TO [Mitarbeiter] WITH GRANT OPTION  AS [dbo]
GO
GRANT VIEW DEFINITION ON [dbo].[Abteilung_View] TO [Mitarbeiter] WITH GRANT OPTION  AS [dbo]
GO
DENY ALTER ON [dbo].[Abteilung_View] TO [Verwaltung] AS [dbo]
GO
DENY CONTROL ON [dbo].[Abteilung_View] TO [Verwaltung] AS [dbo]
GO
DENY DELETE ON [dbo].[Abteilung_View] TO [Verwaltung] AS [dbo]
GO
DENY INSERT ON [dbo].[Abteilung_View] TO [Verwaltung] AS [dbo]
GO
DENY REFERENCES ON [dbo].[Abteilung_View] TO [Verwaltung] AS [dbo]
GO
GRANT SELECT ON [dbo].[Abteilung_View] TO [Verwaltung] AS [dbo]
GO
GRANT UPDATE ON [dbo].[Abteilung_View] TO [Verwaltung] AS [dbo]
GO
GRANT TAKE OWNERSHIP ON [dbo].[Abteilung_View] TO [Verwaltung] WITH GRANT OPTION  AS [dbo]
GO
GRANT VIEW DEFINITION ON [dbo].[Abteilung_View] TO [Verwaltung] WITH GRANT OPTION  AS [dbo]
GO
/****** Object:  View [dbo].[Gehege_View]    Script Date: 18.04.2023 09:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** View Gehege ******/
CREATE VIEW [dbo].[Gehege_View]
AS
SELECT Bezeichnung FROM Gehege 
GO
ALTER AUTHORIZATION ON [dbo].[Gehege_View] TO  SCHEMA OWNER 
GO
DENY ALTER ON [dbo].[Gehege_View] TO [Mitarbeiter] AS [dbo]
GO
DENY CONTROL ON [dbo].[Gehege_View] TO [Mitarbeiter] AS [dbo]
GO
DENY DELETE ON [dbo].[Gehege_View] TO [Mitarbeiter] AS [dbo]
GO
DENY INSERT ON [dbo].[Gehege_View] TO [Mitarbeiter] AS [dbo]
GO
DENY REFERENCES ON [dbo].[Gehege_View] TO [Mitarbeiter] AS [dbo]
GO
GRANT SELECT ON [dbo].[Gehege_View] TO [Mitarbeiter] AS [dbo]
GO
GRANT UPDATE ON [dbo].[Gehege_View] TO [Mitarbeiter] AS [dbo]
GO
GRANT TAKE OWNERSHIP ON [dbo].[Gehege_View] TO [Mitarbeiter] WITH GRANT OPTION  AS [dbo]
GO
GRANT VIEW DEFINITION ON [dbo].[Gehege_View] TO [Mitarbeiter] WITH GRANT OPTION  AS [dbo]
GO
DENY ALTER ON [dbo].[Gehege_View] TO [Verwaltung] AS [dbo]
GO
DENY CONTROL ON [dbo].[Gehege_View] TO [Verwaltung] AS [dbo]
GO
DENY DELETE ON [dbo].[Gehege_View] TO [Verwaltung] AS [dbo]
GO
DENY INSERT ON [dbo].[Gehege_View] TO [Verwaltung] AS [dbo]
GO
DENY REFERENCES ON [dbo].[Gehege_View] TO [Verwaltung] AS [dbo]
GO
GRANT SELECT ON [dbo].[Gehege_View] TO [Verwaltung] AS [dbo]
GO
GRANT UPDATE ON [dbo].[Gehege_View] TO [Verwaltung] AS [dbo]
GO
GRANT TAKE OWNERSHIP ON [dbo].[Gehege_View] TO [Verwaltung] WITH GRANT OPTION  AS [dbo]
GO
GRANT VIEW DEFINITION ON [dbo].[Gehege_View] TO [Verwaltung] WITH GRANT OPTION  AS [dbo]
GO
/****** Object:  View [dbo].[Futterkategorie_View]    Script Date: 18.04.2023 09:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** View Futterkategorie ******/
CREATE VIEW [dbo].[Futterkategorie_View]
AS
SELECT Name FROM Futterkategorie
GO
ALTER AUTHORIZATION ON [dbo].[Futterkategorie_View] TO  SCHEMA OWNER 
GO
DENY ALTER ON [dbo].[Futterkategorie_View] TO [Lageristen] AS [dbo]
GO
DENY CONTROL ON [dbo].[Futterkategorie_View] TO [Lageristen] AS [dbo]
GO
DENY DELETE ON [dbo].[Futterkategorie_View] TO [Lageristen] AS [dbo]
GO
DENY INSERT ON [dbo].[Futterkategorie_View] TO [Lageristen] AS [dbo]
GO
DENY REFERENCES ON [dbo].[Futterkategorie_View] TO [Lageristen] AS [dbo]
GO
GRANT SELECT ON [dbo].[Futterkategorie_View] TO [Lageristen] AS [dbo]
GO
GRANT UPDATE ON [dbo].[Futterkategorie_View] TO [Lageristen] AS [dbo]
GO
GRANT TAKE OWNERSHIP ON [dbo].[Futterkategorie_View] TO [Lageristen] WITH GRANT OPTION  AS [dbo]
GO
GRANT VIEW DEFINITION ON [dbo].[Futterkategorie_View] TO [Lageristen] WITH GRANT OPTION  AS [dbo]
GO
/****** Object:  Table [dbo].[Futtermenge]    Script Date: 18.04.2023 09:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Futtermenge](
	[Futter_Nr] [smallint] NOT NULL,
	[Rations_Nr] [smallint] NOT NULL,
	[Menge] [smallint] NULL,
 CONSTRAINT [PK_Futtermenge] PRIMARY KEY CLUSTERED 
(
	[Futter_Nr] ASC,
	[Rations_Nr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[Futtermenge] TO  SCHEMA OWNER 
GO
/****** Object:  View [dbo].[Futtermenge_View]    Script Date: 18.04.2023 09:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** View Futtermenge ******/
CREATE VIEW [dbo].[Futtermenge_View]
AS
SELECT Futter_Name, COUNT (Häufigkeit) AS Haeufigkeit FROM Futtermenge
JOIN Futter ON Futter_NR = Futter_ID
JOIN Futterration ON Rations_Nr = Rations_ID GROUP BY Futter_Name
GO
ALTER AUTHORIZATION ON [dbo].[Futtermenge_View] TO  SCHEMA OWNER 
GO
DENY ALTER ON [dbo].[Futtermenge_View] TO [Lageristen] AS [dbo]
GO
DENY CONTROL ON [dbo].[Futtermenge_View] TO [Lageristen] AS [dbo]
GO
DENY DELETE ON [dbo].[Futtermenge_View] TO [Lageristen] AS [dbo]
GO
DENY INSERT ON [dbo].[Futtermenge_View] TO [Lageristen] AS [dbo]
GO
DENY REFERENCES ON [dbo].[Futtermenge_View] TO [Lageristen] AS [dbo]
GO
GRANT SELECT ON [dbo].[Futtermenge_View] TO [Lageristen] AS [dbo]
GO
GRANT UPDATE ON [dbo].[Futtermenge_View] TO [Lageristen] AS [dbo]
GO
GRANT TAKE OWNERSHIP ON [dbo].[Futtermenge_View] TO [Lageristen] WITH GRANT OPTION  AS [dbo]
GO
GRANT VIEW DEFINITION ON [dbo].[Futtermenge_View] TO [Lageristen] WITH GRANT OPTION  AS [dbo]
GO
/****** Object:  View [dbo].[Futterration_View]    Script Date: 18.04.2023 09:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** View Futterration ******/
CREATE VIEW [dbo].[Futterration_View]
AS
SELECT Bezeichnung, COUNT (Häufigkeit) AS Haeufigkeit FROM Futterration
JOIN Tiere ON Tiernummer = TierNr GROUP BY Bezeichnung
GO
ALTER AUTHORIZATION ON [dbo].[Futterration_View] TO  SCHEMA OWNER 
GO
DENY ALTER ON [dbo].[Futterration_View] TO [Lageristen] AS [dbo]
GO
DENY CONTROL ON [dbo].[Futterration_View] TO [Lageristen] AS [dbo]
GO
DENY DELETE ON [dbo].[Futterration_View] TO [Lageristen] AS [dbo]
GO
DENY INSERT ON [dbo].[Futterration_View] TO [Lageristen] AS [dbo]
GO
DENY REFERENCES ON [dbo].[Futterration_View] TO [Lageristen] AS [dbo]
GO
GRANT SELECT ON [dbo].[Futterration_View] TO [Lageristen] AS [dbo]
GO
GRANT UPDATE ON [dbo].[Futterration_View] TO [Lageristen] AS [dbo]
GO
GRANT TAKE OWNERSHIP ON [dbo].[Futterration_View] TO [Lageristen] WITH GRANT OPTION  AS [dbo]
GO
GRANT VIEW DEFINITION ON [dbo].[Futterration_View] TO [Lageristen] WITH GRANT OPTION  AS [dbo]
GO
DENY ALTER ON [dbo].[Futterration_View] TO [Mitarbeiter] AS [dbo]
GO
DENY CONTROL ON [dbo].[Futterration_View] TO [Mitarbeiter] AS [dbo]
GO
DENY DELETE ON [dbo].[Futterration_View] TO [Mitarbeiter] AS [dbo]
GO
DENY INSERT ON [dbo].[Futterration_View] TO [Mitarbeiter] AS [dbo]
GO
DENY REFERENCES ON [dbo].[Futterration_View] TO [Mitarbeiter] AS [dbo]
GO
GRANT SELECT ON [dbo].[Futterration_View] TO [Mitarbeiter] AS [dbo]
GO
GRANT UPDATE ON [dbo].[Futterration_View] TO [Mitarbeiter] AS [dbo]
GO
GRANT TAKE OWNERSHIP ON [dbo].[Futterration_View] TO [Mitarbeiter] WITH GRANT OPTION  AS [dbo]
GO
GRANT VIEW DEFINITION ON [dbo].[Futterration_View] TO [Mitarbeiter] WITH GRANT OPTION  AS [dbo]
GO
INSERT [dbo].[Abteilung] ([Abt_ID], [Bezeichnung]) VALUES (1, N'Tierpflege')
GO
INSERT [dbo].[Abteilung] ([Abt_ID], [Bezeichnung]) VALUES (2, N'Verwaltung')
GO
INSERT [dbo].[Abteilung] ([Abt_ID], [Bezeichnung]) VALUES (3, N'Handwerk')
GO
INSERT [dbo].[Arbeitsgruppe] ([Taetigkeit_ID], [AbtNr], [Bezeichnung]) VALUES (1, 1, N'Tierpfleger')
GO
INSERT [dbo].[Arbeitsgruppe] ([Taetigkeit_ID], [AbtNr], [Bezeichnung]) VALUES (2, 1, N'Tierarzt')
GO
INSERT [dbo].[Arbeitsgruppe] ([Taetigkeit_ID], [AbtNr], [Bezeichnung]) VALUES (3, 2, N'Ökonom')
GO
INSERT [dbo].[Arbeitsgruppe] ([Taetigkeit_ID], [AbtNr], [Bezeichnung]) VALUES (4, 2, N'Wachmann')
GO
INSERT [dbo].[Arbeitsgruppe] ([Taetigkeit_ID], [AbtNr], [Bezeichnung]) VALUES (5, 2, N'kaufm. Angestellte')
GO
INSERT [dbo].[Arbeitsgruppe] ([Taetigkeit_ID], [AbtNr], [Bezeichnung]) VALUES (6, 2, N'Sekretärin')
GO
INSERT [dbo].[Arbeitsgruppe] ([Taetigkeit_ID], [AbtNr], [Bezeichnung]) VALUES (7, 2, N'Animator')
GO
INSERT [dbo].[Arbeitsgruppe] ([Taetigkeit_ID], [AbtNr], [Bezeichnung]) VALUES (8, 3, N'Gärtner')
GO
INSERT [dbo].[Arbeitsgruppe] ([Taetigkeit_ID], [AbtNr], [Bezeichnung]) VALUES (9, 3, N'Trockenbauer')
GO
INSERT [dbo].[Arbeitsgruppe] ([Taetigkeit_ID], [AbtNr], [Bezeichnung]) VALUES (10, 3, N'Lagerist')
GO
INSERT [dbo].[Arbeitsgruppe] ([Taetigkeit_ID], [AbtNr], [Bezeichnung]) VALUES (11, 3, N'Elektriker')
GO
INSERT [dbo].[Arbeitsgruppe] ([Taetigkeit_ID], [AbtNr], [Bezeichnung]) VALUES (12, 3, N'Reinigungskraft')
GO
INSERT [dbo].[Arbeitsgruppe] ([Taetigkeit_ID], [AbtNr], [Bezeichnung]) VALUES (13, 3, N'Klemptner')
GO
INSERT [dbo].[Arbeitsgruppe] ([Taetigkeit_ID], [AbtNr], [Bezeichnung]) VALUES (14, 3, N'Maurer')
GO
INSERT [dbo].[Arbeitsgruppe] ([Taetigkeit_ID], [AbtNr], [Bezeichnung]) VALUES (15, 1, N'Futterkoch')
GO
INSERT [dbo].[Art] ([Tierart_ID], [Tierart], [Klasse]) VALUES (1, N'Elefant', 1)
GO
INSERT [dbo].[Art] ([Tierart_ID], [Tierart], [Klasse]) VALUES (2, N'Giraffe', 1)
GO
INSERT [dbo].[Art] ([Tierart_ID], [Tierart], [Klasse]) VALUES (3, N'Affe', 1)
GO
INSERT [dbo].[Art] ([Tierart_ID], [Tierart], [Klasse]) VALUES (4, N'Löwe', 1)
GO
INSERT [dbo].[Art] ([Tierart_ID], [Tierart], [Klasse]) VALUES (5, N'Leopard', 1)
GO
INSERT [dbo].[Art] ([Tierart_ID], [Tierart], [Klasse]) VALUES (6, N'Antilope', 1)
GO
INSERT [dbo].[Art] ([Tierart_ID], [Tierart], [Klasse]) VALUES (7, N'Tapir', 1)
GO
INSERT [dbo].[Art] ([Tierart_ID], [Tierart], [Klasse]) VALUES (8, N'Känguru', 1)
GO
INSERT [dbo].[Art] ([Tierart_ID], [Tierart], [Klasse]) VALUES (9, N'Erdmännchen', 1)
GO
INSERT [dbo].[Art] ([Tierart_ID], [Tierart], [Klasse]) VALUES (10, N'Tiger', 1)
GO
INSERT [dbo].[Art] ([Tierart_ID], [Tierart], [Klasse]) VALUES (11, N'Krokodil', 2)
GO
INSERT [dbo].[Art] ([Tierart_ID], [Tierart], [Klasse]) VALUES (12, N'Schildkröte', 2)
GO
INSERT [dbo].[Art] ([Tierart_ID], [Tierart], [Klasse]) VALUES (13, N'Schlange', 2)
GO
INSERT [dbo].[Art] ([Tierart_ID], [Tierart], [Klasse]) VALUES (14, N'Leguan', 2)
GO
INSERT [dbo].[Art] ([Tierart_ID], [Tierart], [Klasse]) VALUES (15, N'Chamäleon', 2)
GO
INSERT [dbo].[Art] ([Tierart_ID], [Tierart], [Klasse]) VALUES (16, N'Waran', 2)
GO
INSERT [dbo].[Art] ([Tierart_ID], [Tierart], [Klasse]) VALUES (17, N'Ibis', 3)
GO
INSERT [dbo].[Art] ([Tierart_ID], [Tierart], [Klasse]) VALUES (18, N'Kranich', 3)
GO
INSERT [dbo].[Art] ([Tierart_ID], [Tierart], [Klasse]) VALUES (19, N'Papagei', 3)
GO
INSERT [dbo].[Art] ([Tierart_ID], [Tierart], [Klasse]) VALUES (20, N'Flamingo', 3)
GO
INSERT [dbo].[Art] ([Tierart_ID], [Tierart], [Klasse]) VALUES (21, N'Geier', 3)
GO
INSERT [dbo].[Art] ([Tierart_ID], [Tierart], [Klasse]) VALUES (22, N'Wels', 4)
GO
INSERT [dbo].[Art] ([Tierart_ID], [Tierart], [Klasse]) VALUES (23, N'Hai', 4)
GO
INSERT [dbo].[Art] ([Tierart_ID], [Tierart], [Klasse]) VALUES (24, N'Barsch', 4)
GO
INSERT [dbo].[Art] ([Tierart_ID], [Tierart], [Klasse]) VALUES (25, N'Frosch', 5)
GO
INSERT [dbo].[Art] ([Tierart_ID], [Tierart], [Klasse]) VALUES (26, N'Kröte', 5)
GO
INSERT [dbo].[Art] ([Tierart_ID], [Tierart], [Klasse]) VALUES (27, N'Ameise', 6)
GO
INSERT [dbo].[Art] ([Tierart_ID], [Tierart], [Klasse]) VALUES (28, N'Krebs', 6)
GO
INSERT [dbo].[Art] ([Tierart_ID], [Tierart], [Klasse]) VALUES (29, N'Seeigel', 6)
GO
INSERT [dbo].[Art] ([Tierart_ID], [Tierart], [Klasse]) VALUES (30, N'Flusspferd', 1)
GO
INSERT [dbo].[Art] ([Tierart_ID], [Tierart], [Klasse]) VALUES (31, N'Nashorn', 1)
GO
INSERT [dbo].[Futter] ([Futter_ID], [KategorieNr], [Futter_Name]) VALUES (1, 1, N'Schwein')
GO
INSERT [dbo].[Futter] ([Futter_ID], [KategorieNr], [Futter_Name]) VALUES (2, 1, N'Rind')
GO
INSERT [dbo].[Futter] ([Futter_ID], [KategorieNr], [Futter_Name]) VALUES (3, 2, N'Blätter')
GO
INSERT [dbo].[Futter] ([Futter_ID], [KategorieNr], [Futter_Name]) VALUES (4, 2, N'Kräuter')
GO
INSERT [dbo].[Futter] ([Futter_ID], [KategorieNr], [Futter_Name]) VALUES (5, 2, N'Gräßer')
GO
INSERT [dbo].[Futter] ([Futter_ID], [KategorieNr], [Futter_Name]) VALUES (6, 2, N'Pilze')
GO
INSERT [dbo].[Futter] ([Futter_ID], [KategorieNr], [Futter_Name]) VALUES (7, 3, N'Melonen')
GO
INSERT [dbo].[Futter] ([Futter_ID], [KategorieNr], [Futter_Name]) VALUES (8, 3, N'Bananen')
GO
INSERT [dbo].[Futter] ([Futter_ID], [KategorieNr], [Futter_Name]) VALUES (9, 3, N'Äpfel')
GO
INSERT [dbo].[Futter] ([Futter_ID], [KategorieNr], [Futter_Name]) VALUES (10, 3, N'Orangen')
GO
INSERT [dbo].[Futter] ([Futter_ID], [KategorieNr], [Futter_Name]) VALUES (11, 4, N'Hering')
GO
INSERT [dbo].[Futter] ([Futter_ID], [KategorieNr], [Futter_Name]) VALUES (12, 4, N'kleine Wassertiere')
GO
INSERT [dbo].[Futter] ([Futter_ID], [KategorieNr], [Futter_Name]) VALUES (13, 4, N'Krebse')
GO
INSERT [dbo].[Futter] ([Futter_ID], [KategorieNr], [Futter_Name]) VALUES (14, 5, N'Spinnen')
GO
INSERT [dbo].[Futter] ([Futter_ID], [KategorieNr], [Futter_Name]) VALUES (15, 5, N'Würmer')
GO
INSERT [dbo].[Futter] ([Futter_ID], [KategorieNr], [Futter_Name]) VALUES (16, 5, N'Ameisen')
GO
INSERT [dbo].[Futter] ([Futter_ID], [KategorieNr], [Futter_Name]) VALUES (17, 5, N'Raupen')
GO
INSERT [dbo].[Futter] ([Futter_ID], [KategorieNr], [Futter_Name]) VALUES (18, 5, N'Heuschrecken')
GO
INSERT [dbo].[Futter] ([Futter_ID], [KategorieNr], [Futter_Name]) VALUES (19, 6, N'Körner')
GO
INSERT [dbo].[Futter] ([Futter_ID], [KategorieNr], [Futter_Name]) VALUES (20, 6, N'Samen')
GO
INSERT [dbo].[Futter] ([Futter_ID], [KategorieNr], [Futter_Name]) VALUES (21, 6, N'Nüsse')
GO
INSERT [dbo].[Futter] ([Futter_ID], [KategorieNr], [Futter_Name]) VALUES (22, 7, N'Kaninchen')
GO
INSERT [dbo].[Futter] ([Futter_ID], [KategorieNr], [Futter_Name]) VALUES (23, 7, N'Mäuse')
GO
INSERT [dbo].[Futter] ([Futter_ID], [KategorieNr], [Futter_Name]) VALUES (24, 7, N'Vögel')
GO
INSERT [dbo].[Futter] ([Futter_ID], [KategorieNr], [Futter_Name]) VALUES (25, 8, N'Vitamine')
GO
INSERT [dbo].[Futter] ([Futter_ID], [KategorieNr], [Futter_Name]) VALUES (26, 8, N'Mineralien')
GO
INSERT [dbo].[Futterkategorie] ([Kategorie_ID], [Name]) VALUES (1, N'Frischfleisch')
GO
INSERT [dbo].[Futterkategorie] ([Kategorie_ID], [Name]) VALUES (2, N'Pflanzen')
GO
INSERT [dbo].[Futterkategorie] ([Kategorie_ID], [Name]) VALUES (3, N'Früchte')
GO
INSERT [dbo].[Futterkategorie] ([Kategorie_ID], [Name]) VALUES (4, N'Fisch')
GO
INSERT [dbo].[Futterkategorie] ([Kategorie_ID], [Name]) VALUES (5, N'Insekten')
GO
INSERT [dbo].[Futterkategorie] ([Kategorie_ID], [Name]) VALUES (6, N'Trockenfutter')
GO
INSERT [dbo].[Futterkategorie] ([Kategorie_ID], [Name]) VALUES (7, N'Lebende Nahrung')
GO
INSERT [dbo].[Futterkategorie] ([Kategorie_ID], [Name]) VALUES (8, N'Aufbaufutter')
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (1, 17, 2000)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (1, 18, 2500)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (1, 19, 1800)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (1, 20, 1500)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (1, 21, 1500)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (1, 27, 3000)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (1, 28, 2500)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (1, 29, 3200)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (1, 48, 4000)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (1, 57, 600)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (1, 58, 800)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 1, 3000)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 3, 2000)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 5, 2500)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 7, 2000)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 8, 1500)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 9, 2500)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 22, 4000)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 23, 3000)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 25, 6000)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 33, 300)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 34, 250)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 36, 400)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 43, 500)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 44, 250)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 45, 150)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 46, 100)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 52, 1000)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 59, 800)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 63, 500)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 78, 9)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 81, 400)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 83, 200)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 86, 2000)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 87, 3000)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (3, 2, 2000)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (3, 4, 1500)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (3, 6, 1700)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (3, 10, 500)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (3, 11, 400)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (3, 12, 1000)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (3, 13, 600)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (3, 14, 800)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (3, 15, 400)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (3, 16, 550)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (3, 24, 3500)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (3, 33, 200)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (3, 34, 190)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (3, 37, 340)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (3, 61, 30)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (3, 64, 100)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (3, 80, 300)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (3, 81, 500)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (3, 83, 600)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (3, 84, 300)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (3, 85, 400)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (3, 86, 2200)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (4, 30, 1500)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (4, 31, 800)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (4, 32, 750)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (4, 35, 280)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (4, 41, 500)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (4, 62, 1000)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (4, 68, 400)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (4, 69, 500)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (4, 70, 300)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (4, 71, 1000)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (4, 72, 1000)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (4, 73, 500)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (4, 74, 200)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (4, 79, 6)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (5, 26, 1000)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (5, 45, 150)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (5, 49, 500)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (5, 50, 400)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (5, 51, 300)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (5, 52, 2000)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (5, 53, 50)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (5, 56, 1000)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (5, 59, 1600)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (5, 60, 1000)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (5, 63, 500)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (5, 75, 15)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (5, 76, 16)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (5, 77, 17)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (5, 82, 300)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (6, 23, 500)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (6, 36, 50)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (6, 43, 500)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (6, 44, 200)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (6, 46, 60)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (6, 53, 100)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (6, 54, 100)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (6, 61, 20)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (6, 65, 30)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (6, 67, 20)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (6, 83, 500)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (6, 85, 250)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (7, 31, 1460)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (7, 38, 750)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (7, 39, 530)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (7, 40, 480)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (7, 42, 1000)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (7, 48, 2000)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (7, 66, 800)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (8, 11, 50)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (8, 14, 30)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (8, 16, 40)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (8, 47, 30)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (8, 55, 20)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (8, 65, 20)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (8, 72, 50)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (1, 1, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (2, 1, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (3, 2, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (4, 2, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (5, 3, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (6, 3, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (7, 4, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (8, 5, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (9, 6, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (10, 7, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (11, 8, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (12, 9, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (13, 10, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (14, 11, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (15, 12, 2)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (16, 13, 2)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (17, 14, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (18, 15, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (19, 16, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (20, 17, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (21, 18, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (22, 19, 2)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (23, 20, 2)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (24, 20, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (25, 21, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (26, 22, 2)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (27, 23, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (28, 24, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (29, 25, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (30, 26, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (31, 27, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (32, 28, 2)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (33, 29, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (34, 30, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (35, 31, 2)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (36, 32, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (37, 33, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (38, 34, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (39, 35, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (40, 36, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (41, 37, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (42, 37, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (43, 38, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (44, 39, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (45, 40, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (46, 41, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (47, 41, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (48, 42, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (49, 43, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (50, 44, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (51, 45, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (52, 46, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (53, 47, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (54, 48, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (55, 48, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (56, 49, 2)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (57, 50, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (58, 50, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (59, 51, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (60, 52, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (61, 53, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (62, 54, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (63, 55, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (64, 56, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (65, 56, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (66, 57, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (67, 58, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (68, 59, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (69, 60, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (70, 61, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (71, 62, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (72, 62, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (73, 63, 2)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (74, 64, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (75, 65, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (76, 66, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (77, 67, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (78, 68, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (79, 70, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (80, 71, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (81, 72, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (82, 72, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (83, 73, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (84, 74, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (85, 75, 1)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (86, 76, 2)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tiernummer], [Häufigkeit]) VALUES (87, 77, 2)
GO
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (1, N'Elefantentempel', 9)
GO
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (2, N'Savanne', 10)
GO
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (3, N'Affen-Käfig 1', 6)
GO
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (4, N'Affen-Käfig 2', 6)
GO
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (5, N'Affen-Käfig 3', 6)
GO
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (6, N'Affen-Käfig 4', 6)
GO
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (7, N'Löwen-Käfig', 7)
GO
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (8, N'Leoparden-Käfig', 7)
GO
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (9, N'Tiger-Käfig', 7)
GO
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (10, N'Erdmännchenbau', 10)
GO
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (11, N'Schildkröten-Wiese', 10)
GO
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (12, N'Terrarium 1', 8)
GO
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (13, N'Terrarium 2', 8)
GO
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (14, N'Terrarium 3', 8)
GO
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (15, N'Terrarium 4', 8)
GO
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (16, N'Terrarium 5', 8)
GO
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (17, N'Terrarium 6', 8)
GO
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (18, N'Terrarium 7', 8)
GO
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (19, N'Terrarium 8', 8)
GO
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (20, N'Terrarium 9', 8)
GO
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (21, N'Terrarium 10', 8)
GO
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (22, N'Terrarium 11', 8)
GO
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (23, N'Terrarium 12', 8)
GO
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (24, N'Volliere 1', 11)
GO
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (25, N'Volliere 2', 11)
GO
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (26, N'Volliere 3', 11)
GO
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (27, N'Volliere 4', 11)
GO
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (28, N'Flamingoteich', 11)
GO
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (29, N'Aquarium 1', 8)
GO
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (30, N'Aquarium 2', 8)
GO
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (31, N'Aquarium 3', 8)
GO
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (32, N'Aquarium 4', 8)
GO
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (33, N'Aquarium 5', 8)
GO
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (34, N'Vitrine 1', 8)
GO
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (35, N'Vitrine 2', 8)
GO
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (36, N'Vitrine 3', 8)
GO
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (37, N'Ameisenbau', 8)
GO
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (38, N'Aquarium 6', 8)
GO
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (39, N'Flusspferd-Park', 9)
GO
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr]) VALUES (40, N'Nashorn-Anlage', 9)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (1, 27)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (3, 2)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (4, 1)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (5, 1)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (7, 5)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (7, 6)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (8, 12)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (8, 13)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (10, 5)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (10, 6)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (12, 2)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (13, 2)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (14, 12)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (14, 13)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (15, 10)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (15, 11)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (16, 3)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (16, 4)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (18, 7)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (18, 8)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (18, 9)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (20, 10)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (20, 11)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (21, 3)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (21, 4)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (23, 7)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (23, 8)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (23, 9)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (24, 33)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (24, 38)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (25, 24)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (25, 25)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (26, 30)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (26, 32)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (28, 29)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (28, 31)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (29, 29)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (29, 31)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (30, 28)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (32, 28)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (33, 27)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (35, 26)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (36, 34)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (36, 35)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (36, 36)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (36, 37)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (38, 14)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (39, 24)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (39, 25)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (41, 30)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (41, 32)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (45, 23)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (51, 20)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (51, 21)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (51, 22)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (54, 20)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (54, 21)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (54, 22)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (56, 17)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (56, 18)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (56, 19)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (58, 17)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (58, 18)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (58, 19)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (60, 39)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (60, 40)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (63, 16)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (67, 15)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (69, 39)
GO
INSERT [dbo].[Gehegebetreuung] ([Pfleger_Nr], [Gehege_Nr]) VALUES (69, 40)
GO
SET IDENTITY_INSERT [dbo].[Klasse] ON 
GO
INSERT [dbo].[Klasse] ([Klasse_ID], [Klassenname]) VALUES (1, N'Säugetiere')
GO
INSERT [dbo].[Klasse] ([Klasse_ID], [Klassenname]) VALUES (2, N'Reptilien')
GO
INSERT [dbo].[Klasse] ([Klasse_ID], [Klassenname]) VALUES (3, N'Vögel')
GO
INSERT [dbo].[Klasse] ([Klasse_ID], [Klassenname]) VALUES (4, N'Fische')
GO
INSERT [dbo].[Klasse] ([Klasse_ID], [Klassenname]) VALUES (5, N'Amphibien')
GO
INSERT [dbo].[Klasse] ([Klasse_ID], [Klassenname]) VALUES (6, N'Wirbellose')
GO
SET IDENTITY_INSERT [dbo].[Klasse] OFF
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (1, 1, N'Schwarz', N'Heinz', N'Anaberger Str. 22', N'01139', N'Dresden')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (2, 8, N'Schädlich', N'Herbert', N'Plempengasse 25', N'01445', N'Radebeul')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (3, 1, N'Langer', N'Fritz', N'Gablenzer Str. 12', N'01796', N'Pirna')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (4, 1, N'Pollack', N'Wilfried', N'Mühlenstr. 25 b', N'01809', N'Heidenau')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (5, 1, N'Hebel', N'Fritz', N'Waldweg 1', N'01454', N'Radeberg')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (6, 3, N'Kaiser', N'August', N'Südring 98', N'01189', N'Dresden')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (7, 1, N'Schneider', N'Gerda', N'Bergstr. 54', N'01796', N'Pirna')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (8, 1, N'Glöckner', N'Manfred', N'Schneeberger Str. 98', N'01705', N'Freital')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (9, 4, N'Mielke', N'Erich', N'Trabantweg 3', N'01139', N'Dresden')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (10, 1, N'Meister', N'Udo', N'Berghotelweg 1', N'01825', N'Liebstadt')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (11, 2, N'Schüttele', N'Detlef', N'Südhang 16', N'01217', N'Dresden')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (12, 1, N'Diener', N'Minna', N'Hauptstr. 2', N'01796', N'Graupa')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (13, 1, N'Schmidt', N'Tommi', N'Schustergasse 16', N'01640', N'Coswig')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (14, 1, N'Seiten', N'Olivia', N'Bürgerplatz 12', N'09599', N'Freiberg')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (15, 1, N'Weiß', N'Rudolph', N'Stollberger Str. 168', N'01465', N'Dresden')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (16, 1, N'Meier', N'Paul', N'Grüner Hang 3', N'01465', N'Dresden')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (17, 4, N'Schimanski', N'Horst', N'Spitzelweg 3', N'01307', N'Dresden')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (18, 1, N'Pfennig', N'Emil', N'Rosentalstr. 18', N'01139', N'Dresden')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (19, 3, N'Spar', N'Gustav', N'Damaschkestr. 34', N'01307', N'Dresden')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (20, 1, N'Gebemir', N'Gerd', N'Waldweg 123', N'01307', N'Dresden')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (21, 1, N'Suppe', N'Paula', N'Wasserweg 41', N'01809', N'Heidenau')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (22, 5, N'Reich', N'Silvia', N'Dorfstr. 34', N'01809', N'Dohna')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (23, 1, N'Wächter', N'Torsten', N'Hauptstr. 4', N'01796', N'Pirna')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (24, 1, N'Schliesser', N'Gabi', N'Rathausplatz 4', N'01728', N'Bannewitz')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (25, 1, N'Helm', N'Michael', N'Brückenweg 23', N'01328', N'Weißig')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (26, 1, N'Bocuse', N'Paul', N'Annenstr. 45', N'01217', N'Dresden')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (27, 2, N'Krug', N'Manfred', N'Hauptstr. 5', N'01662', N'Meißen')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (28, 1, N'Schnecke', N'Rita', N'Hauptstr.67', N'01445', N'Radebeul')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (29, 1, N'Müller', N'Peter', N'Bernsdorfer Str. 16', N'01640', N'Coswig')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (30, 1, N'Hänker', N'Fritz', N'Am Stadion 1', N'09599', N'Freiberg')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (31, 6, N'Müller', N'Anita', N'Pirnaer Str. 3', N'01809', N'Heidenau')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (32, 1, N'König', N'Friedrich', N'Kohlegasse 5', N'01328', N'Weißig')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (33, 1, N'Kabel', N'Michael', N'Wiesenweg 8 f', N'01468', N'Moritzburg')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (34, 9, N'Franke', N'Ulli', N'Malergasse 17', N'01445', N'Radebeul')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (35, 1, N'Müller', N'Jens', N'Ammernstr. 1', N'01662', N'Meißen')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (36, 1, N'Meier', N'Olaf', N'Fischweg 12', N'01468', N'Moritzburg')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (37, 8, N'Waalkes', N'Otto', N'Friesengasse 11', N'01189', N'Dresden')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (38, 1, N'Zange', N'Wolfgang', N'Stadtring 88', N'01809', N'Heidenau')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (39, 1, N'Grube', N'Klaire', N'Großenhainer Str. 5', N'01097', N'Dresden')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (40, 10, N'Tisch', N'Lothar', N'Am Brühl 13 a', N'01217', N'Dresden')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (41, 1, N'Bringe', N'Konrad', N'Brauerweg 25 c', N'01796', N'Pirna')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (42, 11, N'Schmidt', N'Thomas', N'Großenhainer Str. 37', N'01097', N'Dresden')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (43, 15, N'Koch', N'Jens', N'Bergstr. 6', N'01796', N'Graupa')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (44, 12, N'Dittrich', N'Andrea', N'Hauptstraße 25', N'01723', N'Mohorn')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (45, 1, N'Brinkmann', N'Diana', N'Am Flugplatz 9', N'01465', N'Dresden')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (46, 5, N'Schnelle', N'Linda', N'Am Marktplatz 4', N'01705', N'Freital')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (47, 8, N'Hauptmann', N'Rolf', N'Bachstraße 25 a', N'01796', N'Pirna')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (48, 7, N'Wünsche', N'Silvia', N'Am Gartenheim 5', N'01561', N'Großenhain')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (49, 10, N'Haueisen', N'Egon', N' Bärenweg 4', N'01689', N'Weinböhla')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (50, 7, N'Gottschalk', N'Thomas', N'Am Markt 1', N'01169', N'Cossebaude')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (51, 1, N'Angermann', N'Gerd', N'Kirchgasse 2', N'01454', N'Großerkmannsdorf')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (52, 6, N'Klingel', N'Frieda', N'Postweg 16 c', N'01307', N'Dresden')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (53, 5, N'Baldauf', N'Anja', N'Querweg 123', N'01796', N'Pirna')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (54, 1, N'Diettrich', N'Ulf', N'Wartburgstraße 78', N'01454', N'Radeberg')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (55, 12, N'Meier', N'Ramona', N'Schießgasse 4', N'01445', N'Radebeul')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (56, 1, N'Jäckel', N'Bernd', N'Hauptstrasse 3', N'01561', N'Großenhain')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (57, 13, N'Riegel', N'Leopold', N'Textilweg 24', N'01169', N'Cossebaude')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (58, 1, N'Glaube', N'Rudolph', N'Wiesenweg 16', N'01809', N'Heidenau')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (59, 8, N'Hausmann', N'Marga', N'Am Schloßberg 3', N'01825', N'Liebstadt')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (60, 1, N'Sauger', N'Steffen', N'Gärtnereiweg 8', N'01471', N'Radeburg')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (61, 12, N'Weiss', N'Katja', N'Forstweg 16 a', N'01689', N'Weinböhla')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (62, 14, N'Streßmann', N'Emil', N'Schwarzastraße 16', N'01640', N'Coswig')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (63, 1, N'Wünschmann', N'Holger', N'Andreasstr. 15', N'01465', N'Dresden')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (64, 12, N'Koechel', N'Siegfried', N'Dorfstr. 85', N'01728', N'Bannewitz')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (65, 3, N'Prüfer', N'Ullrich', N'Dorfweg 76', N'01454', N'Großerkmannsdorf')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (66, 15, N'Drummer', N'Kurt', N'Rosenhof 234', N'01217', N'Dresden')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (67, 1, N'Pils', N'Michael', N'Am Anger 10', N'01796', N'Graupa')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (68, 8, N'Sauber', N'Manfred', N'Zolastr. 46', N'01796', N'Pirna')
GO
INSERT [dbo].[Mitarbeiter] ([MitArb_ID], [TaetigkeitNr], [Name], [Vorname], [Strasse], [PLZ], [Ort]) VALUES (69, 1, N'Bertold', N'Jürgen', N'Hauptstr. 26 d', N'01454', N'Radeberg')
GO
INSERT [dbo].[ObjektArt] ([Art_ID], [Bezeichnung]) VALUES (1, N'Gebäude')
GO
INSERT [dbo].[ObjektArt] ([Art_ID], [Bezeichnung]) VALUES (2, N'Freigelände')
GO
INSERT [dbo].[Objekte] ([Objekt_ID], [ArtNr], [Bezeichnung]) VALUES (1, 1, N'Verwaltungsgebäude')
GO
INSERT [dbo].[Objekte] ([Objekt_ID], [ArtNr], [Bezeichnung]) VALUES (2, 1, N'Eingangsgebäude')
GO
INSERT [dbo].[Objekte] ([Objekt_ID], [ArtNr], [Bezeichnung]) VALUES (3, 1, N'Lager')
GO
INSERT [dbo].[Objekte] ([Objekt_ID], [ArtNr], [Bezeichnung]) VALUES (4, 1, N'Futterküche')
GO
INSERT [dbo].[Objekte] ([Objekt_ID], [ArtNr], [Bezeichnung]) VALUES (5, 1, N'Werkstatt')
GO
INSERT [dbo].[Objekte] ([Objekt_ID], [ArtNr], [Bezeichnung]) VALUES (6, 1, N'Affenhaus')
GO
INSERT [dbo].[Objekte] ([Objekt_ID], [ArtNr], [Bezeichnung]) VALUES (7, 1, N'Raubtierhaus')
GO
INSERT [dbo].[Objekte] ([Objekt_ID], [ArtNr], [Bezeichnung]) VALUES (8, 1, N' Aquaterrium')
GO
INSERT [dbo].[Objekte] ([Objekt_ID], [ArtNr], [Bezeichnung]) VALUES (9, 2, N'Areal 1')
GO
INSERT [dbo].[Objekte] ([Objekt_ID], [ArtNr], [Bezeichnung]) VALUES (10, 2, N'Areal 2')
GO
INSERT [dbo].[Objekte] ([Objekt_ID], [ArtNr], [Bezeichnung]) VALUES (11, 2, N'Areal 3')
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (1, N'Jumbo', N'Asiatischer Elefant', 1, 1, 1)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (2, N'Theo', N'Asiatischer Elefant', 1, 1, 1)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (3, N'Elli', N'Asiatischer Elefant', 1, 1, 1)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (4, N'Anna', N'Rothschildgiraffe', 2, 1, 2)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (5, N'Bella', N'Rothschildgiraffe', 2, 1, 2)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (6, N'Micha', N'Rothschildgiraffe', 2, 1, 2)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (7, N'Hans', N'Westafrikanischer Schimpanse', 3, 1, 3)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (8, N'Bea', N'Westafrikanischer Schimpanse', 3, 1, 3)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (9, N'Adana', N'Sumatra-Orang-Utan', 3, 1, 4)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (10, N'Baba', N'Sumatra-Orang-Utan', 3, 1, 4)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (11, N'Gila', N'Bonobo', 3, 1, 4)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (12, N'Rago', N'Westlicher Flachlandgorilla', 3, 1, 5)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (13, N'Ramona', N'Westlicher Flachlandgorilla', 3, 1, 5)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (14, N'Lea', N'Afrikanischer Löwe', 4, 1, 7)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (15, N'Max', N'Afrikanischer Löwe', 4, 1, 7)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (16, N'Jörg', N'Afrikanischer Löwe', 4, 1, 7)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (17, N'Rambo', N'Amurleopard', 5, 1, 8)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (18, N'Edona', N'Schneeleopard', 5, 1, 8)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (19, NULL, N'Säbelantilope', 6, 12, 2)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (20, NULL, N'Schabrackentapir', 7, 5, 2)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (21, NULL, N'Rotes Riesenkänguru', 8, 7, 2)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (22, NULL, N'Erdmännchen', 9, 23, 10)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (23, N'Tacko', N'Amurtiger', 10, 1, 9)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (24, N'Ofra', N'Amurtiger', 10, 1, 9)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (25, N'Venus', N'Amurtiger', 10, 1, 9)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (26, NULL, N'Stumpfkrokodil', 11, 2, 14)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (27, NULL, N'Brauen-Glattstirnkaiman', 11, 3, 15)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (28, NULL, N'Sunda-Gavial', 11, 2, 16)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (29, NULL, N'Strahlenschildkröte', 12, 3, 12)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (30, NULL, N'Braune Landschildkröte', 12, 2, 11)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (31, NULL, N'Roti Schlangenhals-Schildkröte', 12, 4, 13)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (32, NULL, N'Spaltenschildkröte', 12, 5, 11)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (33, NULL, N'Tempelschildkröte', 12, 4, 12)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (34, NULL, N'Ringhalskobra', 13, 2, 17)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (35, NULL, N'Kupferkopf', 13, 2, 18)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (36, NULL, N'Mangroven-Nachtbaumnatter', 13, 4, 18)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (37, N'Vampy', N'Gelbe Anakonda', 13, 1, 19)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (38, NULL, N'Grüner Leguan', 14, 5, 20)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (39, NULL, N'Großer Madagaskarleguan', 14, 2, 21)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (40, N'Farbenfroh', N'Jemenchamäleon', 15, 1, 22)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (41, N'Faruk', N'Blauer Felsenleguan', 14, 1, 20)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (42, NULL, N'Komodowaran', 16, 2, 23)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (43, NULL, N'Sepikwaran', 16, 3, 23)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (44, NULL, N'Schwarzkopfibis', 17, 8, 24)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (45, NULL, N'Schwarzzügelibis', 17, 6, 24)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (46, NULL, N'Mandschurenkranich', 18, 15, 25)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (47, NULL, N'Kea', 19, 4, 26)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (48, NULL, N'Kleiner Soldatenara', 19, 3, 26)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (49, NULL, N'Roter Flamingo', 20, 30, 28)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (50, NULL, N'Gänsegeier', 21, 6, 27)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (51, NULL, N'Weißnackenkranich', 18, 10, 25)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (52, NULL, N'Zwergflamingo', 20, 15, 28)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (53, NULL, N'Allfarbgebirgslori', 19, 2, 26)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (54, NULL, N'Chileflamingo', 20, 10, 28)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (55, NULL, N'Grauer Kronenkranich', 18, 5, 25)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (56, N'Jack', N'Hyazinthara', 19, 1, 26)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (57, NULL, N'Königsgeier', 21, 4, 27)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (58, NULL, N'Glotzaugenbarsch', 24, 5, 29)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (59, NULL, N'Braungebänderter Bambushai', 23, 2, 30)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (60, NULL, N'Tigerspatelwels', 22, 6, 31)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (61, NULL, N'Rotflossen-Antennenwels', 22, 5, 31)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (62, NULL, N'Riesenhaiwels', 22, 1, 32)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (63, NULL, N'Schwarzspitzen-Riffhai', 23, 3, 30)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (64, NULL, N'Gelbflossen-Zackenbarsch', 24, 5, 29)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (65, NULL, N'Azurblauer Pfeilgiftfrosch', 25, 3, 34)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (66, NULL, N'Moosfrosch', 25, 4, 35)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (67, NULL, N'Präriekröte', 26, 5, 36)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (68, NULL, N'Blattschneideameise', 27, NULL, 37)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (69, NULL, N'Diademseeigel', 29, 10, 33)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (70, NULL, N'Mangroven-Pfeilschwanzkrebs', 28, 8, 38)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (71, NULL, N'Silberäffchen', 3, 6, 6)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (72, NULL, N'Gewöhnlicher Totenkopfaffe', 3, 13, 6)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (73, NULL, N'Mantelpavian', 3, 5, 3)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (74, NULL, N'Weißbauch-Zwergseidenäffchen', 3, 4, 6)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (75, NULL, N'Bartaffe', 3, 5, 6)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (76, NULL, N'Zwergflusspferd', 30, 5, 39)
GO
INSERT [dbo].[Tiere] ([TierNr], [Name], [Bezeichnung], [Art], [Anzahl], [Gehege_Nr]) VALUES (77, NULL, N'Ostafrikanisches Spitzmaulnashorn', 31, 4, 40)
GO
ALTER TABLE [dbo].[Arbeitsgruppe]  WITH CHECK ADD  CONSTRAINT [FK_Arbeitsgruppe_Abteilung] FOREIGN KEY([AbtNr])
REFERENCES [dbo].[Abteilung] ([Abt_ID])
GO
ALTER TABLE [dbo].[Arbeitsgruppe] CHECK CONSTRAINT [FK_Arbeitsgruppe_Abteilung]
GO
ALTER TABLE [dbo].[Art]  WITH CHECK ADD  CONSTRAINT [FK_Art_Klasse] FOREIGN KEY([Klasse])
REFERENCES [dbo].[Klasse] ([Klasse_ID])
GO
ALTER TABLE [dbo].[Art] CHECK CONSTRAINT [FK_Art_Klasse]
GO
ALTER TABLE [dbo].[Behandlung]  WITH CHECK ADD  CONSTRAINT [FK_Behandlung_Tiere] FOREIGN KEY([Tier])
REFERENCES [dbo].[Tiere] ([TierNr])
GO
ALTER TABLE [dbo].[Behandlung] CHECK CONSTRAINT [FK_Behandlung_Tiere]
GO
ALTER TABLE [dbo].[Behandlung_Diagnose]  WITH CHECK ADD  CONSTRAINT [FK_Behandlung_Diagnose_Behandlung] FOREIGN KEY([BehandlungNr])
REFERENCES [dbo].[Behandlung] ([Behandlung_ID])
GO
ALTER TABLE [dbo].[Behandlung_Diagnose] CHECK CONSTRAINT [FK_Behandlung_Diagnose_Behandlung]
GO
ALTER TABLE [dbo].[Behandlung_Diagnose]  WITH CHECK ADD  CONSTRAINT [FK_Behandlung_Diagnose_Diagnose] FOREIGN KEY([DiagnoseNr])
REFERENCES [dbo].[Diagnose] ([Diagnose_ID])
GO
ALTER TABLE [dbo].[Behandlung_Diagnose] CHECK CONSTRAINT [FK_Behandlung_Diagnose_Diagnose]
GO
ALTER TABLE [dbo].[Futter]  WITH CHECK ADD  CONSTRAINT [FK_Futter_Futterkategorie] FOREIGN KEY([KategorieNr])
REFERENCES [dbo].[Futterkategorie] ([Kategorie_ID])
GO
ALTER TABLE [dbo].[Futter] CHECK CONSTRAINT [FK_Futter_Futterkategorie]
GO
ALTER TABLE [dbo].[Futtermenge]  WITH CHECK ADD  CONSTRAINT [FK_Futtermenge_Futter] FOREIGN KEY([Futter_Nr])
REFERENCES [dbo].[Futter] ([Futter_ID])
GO
ALTER TABLE [dbo].[Futtermenge] CHECK CONSTRAINT [FK_Futtermenge_Futter]
GO
ALTER TABLE [dbo].[Futtermenge]  WITH CHECK ADD  CONSTRAINT [FK_Futtermenge_Futterration] FOREIGN KEY([Rations_Nr])
REFERENCES [dbo].[Futterration] ([Rations_ID])
GO
ALTER TABLE [dbo].[Futtermenge] CHECK CONSTRAINT [FK_Futtermenge_Futterration]
GO
ALTER TABLE [dbo].[Futterration]  WITH CHECK ADD  CONSTRAINT [FK_Futterration_Tiere] FOREIGN KEY([Tiernummer])
REFERENCES [dbo].[Tiere] ([TierNr])
GO
ALTER TABLE [dbo].[Futterration] CHECK CONSTRAINT [FK_Futterration_Tiere]
GO
ALTER TABLE [dbo].[Gehege]  WITH CHECK ADD  CONSTRAINT [FK_Gehege_Objekte] FOREIGN KEY([Objekt_Nr])
REFERENCES [dbo].[Objekte] ([Objekt_ID])
GO
ALTER TABLE [dbo].[Gehege] CHECK CONSTRAINT [FK_Gehege_Objekte]
GO
ALTER TABLE [dbo].[Gehegebetreuung]  WITH CHECK ADD  CONSTRAINT [FK_Gehegebetreuung_Gehege] FOREIGN KEY([Gehege_Nr])
REFERENCES [dbo].[Gehege] ([Gehege_ID])
GO
ALTER TABLE [dbo].[Gehegebetreuung] CHECK CONSTRAINT [FK_Gehegebetreuung_Gehege]
GO
ALTER TABLE [dbo].[Gehegebetreuung]  WITH CHECK ADD  CONSTRAINT [FK_Gehegebetreuung_Mitarbeiter] FOREIGN KEY([Pfleger_Nr])
REFERENCES [dbo].[Mitarbeiter] ([MitArb_ID])
GO
ALTER TABLE [dbo].[Gehegebetreuung] CHECK CONSTRAINT [FK_Gehegebetreuung_Mitarbeiter]
GO
ALTER TABLE [dbo].[Lagerposition]  WITH CHECK ADD  CONSTRAINT [FK_Lagerposition_Futter] FOREIGN KEY([Futter_Nr])
REFERENCES [dbo].[Futter] ([Futter_ID])
GO
ALTER TABLE [dbo].[Lagerposition] CHECK CONSTRAINT [FK_Lagerposition_Futter]
GO
ALTER TABLE [dbo].[Lagerposition]  WITH CHECK ADD  CONSTRAINT [FK_Lagerposition_Lager] FOREIGN KEY([Lager_Nr])
REFERENCES [dbo].[Lager] ([Lager_ID])
GO
ALTER TABLE [dbo].[Lagerposition] CHECK CONSTRAINT [FK_Lagerposition_Lager]
GO
ALTER TABLE [dbo].[Mitarbeiter]  WITH CHECK ADD  CONSTRAINT [FK_Mitarbeiter_Arbeitsgruppe] FOREIGN KEY([TaetigkeitNr])
REFERENCES [dbo].[Arbeitsgruppe] ([Taetigkeit_ID])
GO
ALTER TABLE [dbo].[Mitarbeiter] CHECK CONSTRAINT [FK_Mitarbeiter_Arbeitsgruppe]
GO
ALTER TABLE [dbo].[Objekte]  WITH CHECK ADD  CONSTRAINT [FK_Objekte_ObjektArt] FOREIGN KEY([ArtNr])
REFERENCES [dbo].[ObjektArt] ([Art_ID])
GO
ALTER TABLE [dbo].[Objekte] CHECK CONSTRAINT [FK_Objekte_ObjektArt]
GO
ALTER TABLE [dbo].[Personal_Behandlung]  WITH CHECK ADD  CONSTRAINT [FK_Personal_Behandlung_Behandlung] FOREIGN KEY([BehandlungNr])
REFERENCES [dbo].[Behandlung] ([Behandlung_ID])
GO
ALTER TABLE [dbo].[Personal_Behandlung] CHECK CONSTRAINT [FK_Personal_Behandlung_Behandlung]
GO
ALTER TABLE [dbo].[Personal_Behandlung]  WITH CHECK ADD  CONSTRAINT [FK_Personal_Behandlung_Mitarbeiter] FOREIGN KEY([PersonalNr])
REFERENCES [dbo].[Mitarbeiter] ([MitArb_ID])
GO
ALTER TABLE [dbo].[Personal_Behandlung] CHECK CONSTRAINT [FK_Personal_Behandlung_Mitarbeiter]
GO
ALTER TABLE [dbo].[Personal_Fuetterung]  WITH CHECK ADD  CONSTRAINT [FK_Personal_Fuetterung_Futterration] FOREIGN KEY([FuetterungNr])
REFERENCES [dbo].[Futterration] ([Rations_ID])
GO
ALTER TABLE [dbo].[Personal_Fuetterung] CHECK CONSTRAINT [FK_Personal_Fuetterung_Futterration]
GO
ALTER TABLE [dbo].[Personal_Fuetterung]  WITH CHECK ADD  CONSTRAINT [FK_Personal_Fuetterung_Mitarbeiter] FOREIGN KEY([PersonalNr])
REFERENCES [dbo].[Mitarbeiter] ([MitArb_ID])
GO
ALTER TABLE [dbo].[Personal_Fuetterung] CHECK CONSTRAINT [FK_Personal_Fuetterung_Mitarbeiter]
GO
ALTER TABLE [dbo].[Tiere]  WITH CHECK ADD  CONSTRAINT [FK_Tiere_Art] FOREIGN KEY([Art])
REFERENCES [dbo].[Art] ([Tierart_ID])
GO
ALTER TABLE [dbo].[Tiere] CHECK CONSTRAINT [FK_Tiere_Art]
GO
ALTER TABLE [dbo].[Tiere]  WITH CHECK ADD  CONSTRAINT [FK_Tiere_Gehege] FOREIGN KEY([Gehege_Nr])
REFERENCES [dbo].[Gehege] ([Gehege_ID])
GO
ALTER TABLE [dbo].[Tiere] CHECK CONSTRAINT [FK_Tiere_Gehege]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Mitarbeiter"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 205
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "Arbeitsgruppe"
            Begin Extent = 
               Top = 6
               Left = 243
               Bottom = 119
               Right = 410
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Mitarbeiter_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Mitarbeiter_View'
GO
USE [master]
GO
ALTER DATABASE [Zoo] SET  READ_WRITE 
GO
