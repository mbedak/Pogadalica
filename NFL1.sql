USE [master]
GO
/****** Object:  Database [NFL]    Script Date: 16/08/2022 15:16:00 ******/
CREATE DATABASE [NFL]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NFL', FILENAME = N'C:\Databse\NFL_data\NFL_Projekt_Martin_Bedak.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'NFL_log', FILENAME = N'C:\Databse\NFL_data\NFL_log_Projekt_Martin_Bedak.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [NFL] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NFL].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NFL] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NFL] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NFL] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NFL] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NFL] SET ARITHABORT OFF 
GO
ALTER DATABASE [NFL] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [NFL] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NFL] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NFL] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NFL] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NFL] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NFL] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NFL] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NFL] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NFL] SET  DISABLE_BROKER 
GO
ALTER DATABASE [NFL] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NFL] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NFL] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NFL] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NFL] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NFL] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NFL] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NFL] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [NFL] SET  MULTI_USER 
GO
ALTER DATABASE [NFL] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NFL] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NFL] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NFL] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [NFL] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [NFL] SET QUERY_STORE = OFF
GO
USE [NFL]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [NFL]
GO
/****** Object:  User [NFL]    Script Date: 16/08/2022 15:16:00 ******/
CREATE USER [NFL] FOR LOGIN [NFL] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[auth_group]    Script Date: 16/08/2022 15:16:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_group](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_group_permissions]    Script Date: 16/08/2022 15:16:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_group_permissions](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[group_id] [int] NOT NULL,
	[permission_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_permission]    Script Date: 16/08/2022 15:16:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_permission](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[content_type_id] [int] NOT NULL,
	[codename] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_user]    Script Date: 16/08/2022 15:16:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[password] [nvarchar](128) NOT NULL,
	[last_login] [datetime2](7) NULL,
	[is_superuser] [bit] NOT NULL,
	[username] [nvarchar](150) NOT NULL,
	[first_name] [nvarchar](150) NOT NULL,
	[last_name] [nvarchar](150) NOT NULL,
	[email] [nvarchar](254) NOT NULL,
	[is_staff] [bit] NOT NULL,
	[is_active] [bit] NOT NULL,
	[date_joined] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_user_groups]    Script Date: 16/08/2022 15:16:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_user_groups](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[group_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_user_user_permissions]    Script Date: 16/08/2022 15:16:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_user_user_permissions](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[permission_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[django_admin_log]    Script Date: 16/08/2022 15:16:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[django_admin_log](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[action_time] [datetime2](7) NOT NULL,
	[object_id] [nvarchar](max) NULL,
	[object_repr] [nvarchar](200) NOT NULL,
	[action_flag] [smallint] NOT NULL,
	[change_message] [nvarchar](max) NOT NULL,
	[content_type_id] [int] NULL,
	[user_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[django_content_type]    Script Date: 16/08/2022 15:16:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[django_content_type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[app_label] [nvarchar](100) NOT NULL,
	[model] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[django_migrations]    Script Date: 16/08/2022 15:16:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[django_migrations](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[app] [nvarchar](255) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[applied] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[django_session]    Script Date: 16/08/2022 15:16:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[django_session](
	[session_key] [nvarchar](40) NOT NULL,
	[session_data] [nvarchar](max) NOT NULL,
	[expire_date] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[session_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[django_site]    Script Date: 16/08/2022 15:16:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[django_site](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[domain] [nvarchar](100) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ekipe]    Script Date: 16/08/2022 15:16:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ekipe](
	[ID_ekipa] [int] NOT NULL,
	[Kratica] [nchar](10) NOT NULL,
	[Ekipa] [nvarchar](50) NOT NULL,
	[Stadion] [nvarchar](50) NOT NULL,
	[Trener] [nvarchar](50) NOT NULL,
	[Konferencija] [nchar](10) NULL,
	[Divizija] [nchar](10) NULL,
 CONSTRAINT [PK_Ekipe_1] PRIMARY KEY CLUSTERED 
(
	[ID_ekipa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[igraci]    Script Date: 16/08/2022 15:16:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[igraci](
	[id_igraca] [int] NOT NULL,
	[ime_natjecatelj] [nvarchar](150) NULL,
	[prezime_natjecatelj] [nvarchar](150) NULL,
	[username] [nvarchar](150) NULL,
	[lozinka] [nvarchar](128) NULL,
 CONSTRAINT [PK__igraci__B39E98F41D162D98] PRIMARY KEY CLUSTERED 
(
	[id_igraca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[kolo]    Script Date: 16/08/2022 15:16:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[kolo](
	[id_kolo] [int] IDENTITY(1,1) NOT NULL,
	[broj_kola] [int] NULL,
	[broj_TD] [int] NULL,
	[startdate] [smalldatetime] NULL,
	[enddate] [smalldatetime] NULL,
 CONSTRAINT [PK_kolo] PRIMARY KEY CLUSTERED 
(
	[id_kolo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Oklada_kolo]    Script Date: 16/08/2022 15:16:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Oklada_kolo](
	[id_oklada_kolo] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[broj_kola] [int] NULL,
	[broj_TD] [int] NULL,
 CONSTRAINT [PK_Oklada_kolo] PRIMARY KEY CLUSTERED 
(
	[id_oklada_kolo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Oklada_utakmice]    Script Date: 16/08/2022 15:16:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Oklada_utakmice](
	[id_oklada_utakmica] [int] IDENTITY(1,1) NOT NULL,
	[utakmica_id] [int] NULL,
	[pobjednik_utakmica] [int] NULL,
	[dvostruko] [bit] NULL,
	[oklada_kolo_id] [int] NULL,
 CONSTRAINT [PK_Oklada_utakmice] PRIMARY KEY CLUSTERED 
(
	[id_oklada_utakmica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PTS_week]    Script Date: 16/08/2022 15:16:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PTS_week](
	[id_pts_week] [int] NOT NULL,
	[korisnik] [nvarchar](150) NOT NULL,
	[kolo] [int] NULL,
	[broj_bodova] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_pts_week] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Utakmice]    Script Date: 16/08/2022 15:16:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Utakmice](
	[id_utakmica] [int] IDENTITY(1,1) NOT NULL,
	[kolo] [int] NULL,
	[gosti] [int] NULL,
	[domacini] [int] NULL,
	[pobjednik] [int] NULL,
	[datum_vrijeme] [smalldatetime] NULL,
	[gosti_spread] [int] NULL,
	[domaci_spread] [int] NULL,
	[rez_doma] [int] NULL,
	[rez_gosti] [int] NULL,
 CONSTRAINT [PK_Utakmice] PRIMARY KEY CLUSTERED 
(
	[id_utakmica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[auth_permission] ON 

INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (1, N'Can add log entry', 1, N'add_logentry')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (2, N'Can change log entry', 1, N'change_logentry')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (3, N'Can delete log entry', 1, N'delete_logentry')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (4, N'Can view log entry', 1, N'view_logentry')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (5, N'Can add permission', 2, N'add_permission')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (6, N'Can change permission', 2, N'change_permission')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (7, N'Can delete permission', 2, N'delete_permission')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (8, N'Can view permission', 2, N'view_permission')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (9, N'Can add group', 3, N'add_group')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (10, N'Can change group', 3, N'change_group')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (11, N'Can delete group', 3, N'delete_group')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (12, N'Can view group', 3, N'view_group')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (13, N'Can add user', 4, N'add_user')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (14, N'Can change user', 4, N'change_user')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (15, N'Can delete user', 4, N'delete_user')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (16, N'Can view user', 4, N'view_user')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (17, N'Can add content type', 5, N'add_contenttype')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (18, N'Can change content type', 5, N'change_contenttype')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (19, N'Can delete content type', 5, N'delete_contenttype')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (20, N'Can view content type', 5, N'view_contenttype')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (21, N'Can add session', 6, N'add_session')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (22, N'Can change session', 6, N'change_session')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (23, N'Can delete session', 6, N'delete_session')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (24, N'Can view session', 6, N'view_session')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (25, N'Can add utakmica', 7, N'add_utakmica')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (26, N'Can change utakmica', 7, N'change_utakmica')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (27, N'Can delete utakmica', 7, N'delete_utakmica')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (28, N'Can view utakmica', 7, N'view_utakmica')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (29, N'Can add auth user', 12, N'add_authuser')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (30, N'Can change auth user', 12, N'change_authuser')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (31, N'Can delete auth user', 12, N'delete_authuser')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (32, N'Can view auth user', 12, N'view_authuser')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (33, N'Can add ekipe', 8, N'add_ekipe')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (34, N'Can change ekipe', 8, N'change_ekipe')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (35, N'Can delete ekipe', 8, N'delete_ekipe')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (36, N'Can view ekipe', 8, N'view_ekipe')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (37, N'Can add igraci', 11, N'add_igraci')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (38, N'Can change igraci', 11, N'change_igraci')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (39, N'Can delete igraci', 11, N'delete_igraci')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (40, N'Can view igraci', 11, N'view_igraci')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (41, N'Can add kolo', 10, N'add_kolo')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (42, N'Can change kolo', 10, N'change_kolo')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (43, N'Can delete kolo', 10, N'delete_kolo')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (44, N'Can view kolo', 10, N'view_kolo')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (45, N'Can add oklada', 13, N'add_oklada')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (46, N'Can change oklada', 13, N'change_oklada')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (47, N'Can delete oklada', 13, N'delete_oklada')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (48, N'Can view oklada', 13, N'view_oklada')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (49, N'Can add utakmice', 9, N'add_utakmice')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (50, N'Can change utakmice', 9, N'change_utakmice')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (51, N'Can delete utakmice', 9, N'delete_utakmice')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (52, N'Can view utakmice', 9, N'view_utakmice')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (53, N'Can add oklada kolo', 14, N'add_okladakolo')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (54, N'Can change oklada kolo', 14, N'change_okladakolo')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (55, N'Can delete oklada kolo', 14, N'delete_okladakolo')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (56, N'Can view oklada kolo', 14, N'view_okladakolo')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (57, N'Can add oklada utakmice', 15, N'add_okladautakmice')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (58, N'Can change oklada utakmice', 15, N'change_okladautakmice')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (59, N'Can delete oklada utakmice', 15, N'delete_okladautakmice')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (60, N'Can view oklada utakmice', 15, N'view_okladautakmice')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (61, N'Can add site', 16, N'add_site')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (62, N'Can change site', 16, N'change_site')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (63, N'Can delete site', 16, N'delete_site')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (64, N'Can view site', 16, N'view_site')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (65, N'Can add pts week', 17, N'add_ptsweek')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (66, N'Can change pts week', 17, N'change_ptsweek')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (67, N'Can delete pts week', 17, N'delete_ptsweek')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (68, N'Can view pts week', 17, N'view_ptsweek')
SET IDENTITY_INSERT [dbo].[auth_permission] OFF
GO
SET IDENTITY_INSERT [dbo].[auth_user] ON 

INSERT [dbo].[auth_user] ([id], [password], [last_login], [is_superuser], [username], [first_name], [last_name], [email], [is_staff], [is_active], [date_joined]) VALUES (1, N'pbkdf2_sha256$320000$nvfiUTBxNgaUGBx5NUpWbt$l5YCQDbuqP8MA2rRzihOgLDY6Vtjf2IOeoJXSBFik5U=', CAST(N'2022-08-14T21:36:41.1934550' AS DateTime2), 1, N'mbedak', N'Martin', N'Bedak', N'bedakmartin@gmail.com', 1, 1, CAST(N'2022-06-05T16:56:00.0000000' AS DateTime2))
INSERT [dbo].[auth_user] ([id], [password], [last_login], [is_superuser], [username], [first_name], [last_name], [email], [is_staff], [is_active], [date_joined]) VALUES (2, N'pbkdf2_sha256$320000$McU8qOKSZuFVoJrDP1yyhK$mGsDbMMj7jjHddcvXgXdM1+XmRyyXofliTjKl/WNtVo=', CAST(N'2022-06-09T10:15:36.0000000' AS DateTime2), 0, N'testerzser', N'', N'', N'', 0, 1, CAST(N'2022-06-08T15:15:15.0000000' AS DateTime2))
INSERT [dbo].[auth_user] ([id], [password], [last_login], [is_superuser], [username], [first_name], [last_name], [email], [is_staff], [is_active], [date_joined]) VALUES (3, N'pbkdf2_sha256$320000$KhCQHbSKcrTuRb412bxMKx$RIZyX/Ea5nNOnKctILMKpb1LHjCG9ZiNC6YCXMY2Tzk=', CAST(N'2022-08-14T21:36:25.2261960' AS DateTime2), 0, N'fmusic', N'', N'', N'fmusic@gmail.com', 0, 1, CAST(N'2022-07-23T18:39:33.6566730' AS DateTime2))
SET IDENTITY_INSERT [dbo].[auth_user] OFF
GO
SET IDENTITY_INSERT [dbo].[django_admin_log] ON 

INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (1, CAST(N'2022-06-08T15:15:15.8310740' AS DateTime2), N'2', N'ndobrovic', 1, N'[{"added": {}}]', 4, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (2, CAST(N'2022-06-12T18:10:55.3011240' AS DateTime2), N'1', N'mbedak', 2, N'[{"changed": {"fields": ["First name", "Last name"]}}]', 4, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (3, CAST(N'2022-06-12T18:11:08.7282400' AS DateTime2), N'2', N'testerzser', 2, N'[{"changed": {"fields": ["Username"]}}]', 4, 1)
SET IDENTITY_INSERT [dbo].[django_admin_log] OFF
GO
SET IDENTITY_INSERT [dbo].[django_content_type] ON 

INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (1, N'admin', N'logentry')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (3, N'auth', N'group')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (2, N'auth', N'permission')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (4, N'auth', N'user')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (5, N'contenttypes', N'contenttype')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (12, N'NflWeb', N'authuser')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (8, N'NflWeb', N'ekipe')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (11, N'NflWeb', N'igraci')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (10, N'NflWeb', N'kolo')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (13, N'NflWeb', N'oklada')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (14, N'NflWeb', N'okladakolo')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (15, N'NflWeb', N'okladautakmice')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (17, N'NflWeb', N'ptsweek')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (7, N'NflWeb', N'utakmica')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (9, N'NflWeb', N'utakmice')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (6, N'sessions', N'session')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (16, N'sites', N'site')
SET IDENTITY_INSERT [dbo].[django_content_type] OFF
GO
SET IDENTITY_INSERT [dbo].[django_migrations] ON 

INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (1, N'contenttypes', N'0001_initial', CAST(N'2022-06-05T16:18:18.4774430' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (2, N'auth', N'0001_initial', CAST(N'2022-06-05T16:18:18.5292250' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (3, N'admin', N'0001_initial', CAST(N'2022-06-05T16:18:18.5469400' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (4, N'admin', N'0002_logentry_remove_auto_add', CAST(N'2022-06-05T16:18:18.5569410' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (5, N'admin', N'0003_logentry_add_action_flag_choices', CAST(N'2022-06-05T16:18:18.5669420' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (6, N'contenttypes', N'0002_remove_content_type_name', CAST(N'2022-06-05T16:18:18.9369950' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (7, N'auth', N'0002_alter_permission_name_max_length', CAST(N'2022-06-05T16:18:18.9479960' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (8, N'auth', N'0003_alter_user_email_max_length', CAST(N'2022-06-05T16:18:18.9589990' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (9, N'auth', N'0004_alter_user_username_opts', CAST(N'2022-06-05T16:18:18.9699990' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (10, N'auth', N'0005_alter_user_last_login_null', CAST(N'2022-06-05T16:18:19.2621050' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (11, N'auth', N'0006_require_contenttypes_0002', CAST(N'2022-06-05T16:18:19.2688460' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (12, N'auth', N'0007_alter_validators_add_error_messages', CAST(N'2022-06-05T16:18:19.2786100' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (13, N'auth', N'0008_alter_user_username_max_length', CAST(N'2022-06-05T16:18:19.3210610' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (14, N'auth', N'0009_alter_user_last_name_max_length', CAST(N'2022-06-05T16:18:19.3310620' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (15, N'auth', N'0010_alter_group_name_max_length', CAST(N'2022-06-05T16:18:19.6520860' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (16, N'auth', N'0011_update_proxy_permissions', CAST(N'2022-06-05T16:18:19.6620860' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (17, N'auth', N'0012_alter_user_first_name_max_length', CAST(N'2022-06-05T16:18:19.6720890' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (18, N'sessions', N'0001_initial', CAST(N'2022-06-05T16:18:19.6792820' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (19, N'NflWeb', N'0001_initial', CAST(N'2022-06-05T16:41:51.5272590' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (20, N'sites', N'0001_initial', CAST(N'2022-06-15T22:28:55.3269720' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (21, N'sites', N'0002_alter_domain_unique', CAST(N'2022-06-15T22:28:55.3352300' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (22, N'NflWeb', N'0002_ptsweek', CAST(N'2022-06-15T22:31:10.7960400' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (23, N'NflWeb', N'0003_delete_okladakolo', CAST(N'2022-06-28T16:25:16.3847900' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (24, N'NflWeb', N'0004_okladakolo_delete_oklada', CAST(N'2022-07-06T19:44:26.5112130' AS DateTime2))
SET IDENTITY_INSERT [dbo].[django_migrations] OFF
GO
INSERT [dbo].[django_session] ([session_key], [session_data], [expire_date]) VALUES (N'1zd9op5g6vt2t4wdmgh2vodv5gsiu0m9', N'e30:1o0Rm3:edo77eA8U1xyhlZYrgoc6Ad4i1U5CO7AJA--ik9X1zM', CAST(N'2022-06-26T17:53:19.0704810' AS DateTime2))
INSERT [dbo].[django_session] ([session_key], [session_data], [expire_date]) VALUES (N'2nwka7qa6amlbx0prwwxnqniexr152mg', N'.eJxVjMEOwiAQRP-FsyHQUigevfcbyO6ySNVAUtqT8d9tkx70OPPezFsE2NYctsZLmKO4Ci0uvx0CPbkcID6g3KukWtZlRnko8qRNTjXy63a6fwcZWt7X3uAAyro0REUdxASsfNTJjXtC1sQ0EibTKexJOw8erCK2XiVDPRrx-QIQnTkQ:1o9BSy:3WLDC5Nx-3wM-T4zCKTBimP7MXLgq-sof_lmbSlJIX0', CAST(N'2022-07-20T20:17:44.6174150' AS DateTime2))
INSERT [dbo].[django_session] ([session_key], [session_data], [expire_date]) VALUES (N'd9e1xj2co541821wmvqk89se3t9jhe8o', N'.eJxVjMEOwiAQRP-FsyHQUigevfcbyO6ySNVAUtqT8d9tkx70OPPezFsE2NYctsZLmKO4Ci0uvx0CPbkcID6g3KukWtZlRnko8qRNTjXy63a6fwcZWt7X3uAAyro0REUdxASsfNTJjXtC1sQ0EibTKexJOw8erCK2XiVDPRrx-QIQnTkQ:1o3gs2:CfXTCwxsAqNEkAlHn9FnzMtUYpaTVSkzSK5QV7Z5VQs', CAST(N'2022-07-05T16:36:54.2121170' AS DateTime2))
INSERT [dbo].[django_session] ([session_key], [session_data], [expire_date]) VALUES (N'qducw7re7enit3h2b5mz22ky8mcfa96m', N'e30:1o0Rmz:IU7TY0YqB_CLHSw6lOeOhu4T3ZMPbuD3hVm015nCYw0', CAST(N'2022-06-26T17:54:17.0773430' AS DateTime2))
INSERT [dbo].[django_session] ([session_key], [session_data], [expire_date]) VALUES (N'rujv3hp0t08vwou6p7asx96tmmatztix', N'.eJxVjMEOwiAQRP-FsyHQUigevfcbyO6ySNVAUtqT8d9tkx70OPPezFsE2NYctsZLmKO4Ci0uvx0CPbkcID6g3KukWtZlRnko8qRNTjXy63a6fwcZWt7X3uAAyro0REUdxASsfNTJjXtC1sQ0EibTKexJOw8erCK2XiVDPRrx-QIQnTkQ:1oNLHl:JJAesIkSj8aRVC72zoGqdd4XaKpf-QA418lRpaJOX0U', CAST(N'2022-08-28T21:36:41.1954540' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[django_site] ON 

INSERT [dbo].[django_site] ([id], [domain], [name]) VALUES (1, N'example.com', N'example.com')
SET IDENTITY_INSERT [dbo].[django_site] OFF
GO
INSERT [dbo].[Ekipe] ([ID_ekipa], [Kratica], [Ekipa], [Stadion], [Trener], [Konferencija], [Divizija]) VALUES (1, N'ARZ       ', N'Arizona Cardinals', N'State Farm Stadium', N'Kliff Kingsbury', N'NFC       ', N'West      ')
INSERT [dbo].[Ekipe] ([ID_ekipa], [Kratica], [Ekipa], [Stadion], [Trener], [Konferencija], [Divizija]) VALUES (2, N'ATL       ', N'Atlanta Falcons', N'Mercedes-Benz Stadium', N'Arthur Smith', N'NFC       ', N'South     ')
INSERT [dbo].[Ekipe] ([ID_ekipa], [Kratica], [Ekipa], [Stadion], [Trener], [Konferencija], [Divizija]) VALUES (3, N'BLT       ', N'Baltimore Ravens', N'M&T Bank Stadium', N'John Harbaugh', N'AFC       ', N'North     ')
INSERT [dbo].[Ekipe] ([ID_ekipa], [Kratica], [Ekipa], [Stadion], [Trener], [Konferencija], [Divizija]) VALUES (4, N'BUF       ', N'Buffalo Bills', N'Highmark Stadium', N'Sean McDermott', N'AFC       ', N'East      ')
INSERT [dbo].[Ekipe] ([ID_ekipa], [Kratica], [Ekipa], [Stadion], [Trener], [Konferencija], [Divizija]) VALUES (5, N'CAR       ', N'Carolina Panthers', N'Bank of America Stadium', N'Matt Rhule', N'NFC       ', N'South     ')
INSERT [dbo].[Ekipe] ([ID_ekipa], [Kratica], [Ekipa], [Stadion], [Trener], [Konferencija], [Divizija]) VALUES (6, N'CIN       ', N'Cincinnati Bengals', N'Paul Brown Stadium', N'Zac Taylor', N'AFC       ', N'North     ')
INSERT [dbo].[Ekipe] ([ID_ekipa], [Kratica], [Ekipa], [Stadion], [Trener], [Konferencija], [Divizija]) VALUES (7, N'CHI       ', N'Chicago Bears', N'Soldier Field', N'Matt Eberflus', N'NFC       ', N'North     ')
INSERT [dbo].[Ekipe] ([ID_ekipa], [Kratica], [Ekipa], [Stadion], [Trener], [Konferencija], [Divizija]) VALUES (8, N'CLV       ', N'Cleveland Browns', N'FirstEnergy Stadium', N'Kevin Stefanski', N'AFC       ', N'North     ')
INSERT [dbo].[Ekipe] ([ID_ekipa], [Kratica], [Ekipa], [Stadion], [Trener], [Konferencija], [Divizija]) VALUES (9, N'DAL       ', N'Dallas Cowboys', N'AT&T Stadium', N'Mike McCarthy', N'NFC       ', N'East      ')
INSERT [dbo].[Ekipe] ([ID_ekipa], [Kratica], [Ekipa], [Stadion], [Trener], [Konferencija], [Divizija]) VALUES (10, N'DEN       ', N'Denver Broncos', N'Empower Field at Mile High', N'Nathaniel Hackett', N'AFC       ', N'West      ')
INSERT [dbo].[Ekipe] ([ID_ekipa], [Kratica], [Ekipa], [Stadion], [Trener], [Konferencija], [Divizija]) VALUES (11, N'DET       ', N'Detroit Lions', N'Ford Field', N'Dan Campbell', N'NFC       ', N'North     ')
INSERT [dbo].[Ekipe] ([ID_ekipa], [Kratica], [Ekipa], [Stadion], [Trener], [Konferencija], [Divizija]) VALUES (12, N'HST       ', N'Houston Texans', N'NRG Stadium', N'Lovie Smith', N'AFC       ', N'South     ')
INSERT [dbo].[Ekipe] ([ID_ekipa], [Kratica], [Ekipa], [Stadion], [Trener], [Konferencija], [Divizija]) VALUES (13, N'GB        ', N'Green Bay Packers', N'Lembeau Field', N'Matt LaFleur', N'NFC       ', N'North     ')
INSERT [dbo].[Ekipe] ([ID_ekipa], [Kratica], [Ekipa], [Stadion], [Trener], [Konferencija], [Divizija]) VALUES (14, N'IND       ', N'Indianapolis Colts', N'Lucas Oil Stadium', N'Frank Reich', N'AFC       ', N'South     ')
INSERT [dbo].[Ekipe] ([ID_ekipa], [Kratica], [Ekipa], [Stadion], [Trener], [Konferencija], [Divizija]) VALUES (15, N'LAR       ', N'Los Angeles Rams', N'SoFi Stadium', N'Sean McVay', N'NFC       ', N'West      ')
INSERT [dbo].[Ekipe] ([ID_ekipa], [Kratica], [Ekipa], [Stadion], [Trener], [Konferencija], [Divizija]) VALUES (16, N'JAX       ', N'Jacksonville Jaguars', N'TIAA Bank Field', N'Doug Pederson', N'AFC       ', N'South     ')
INSERT [dbo].[Ekipe] ([ID_ekipa], [Kratica], [Ekipa], [Stadion], [Trener], [Konferencija], [Divizija]) VALUES (17, N'MIN       ', N'Minnesota Vikings', N'U.S. Bank Stadium', N'Kevin OConnell', N'NFC       ', N'North     ')
INSERT [dbo].[Ekipe] ([ID_ekipa], [Kratica], [Ekipa], [Stadion], [Trener], [Konferencija], [Divizija]) VALUES (18, N'KC        ', N'Kansas City Chiefs', N'GEHA Field at Arrowhead Stadium', N'Andy Reid', N'AFC       ', N'West      ')
INSERT [dbo].[Ekipe] ([ID_ekipa], [Kratica], [Ekipa], [Stadion], [Trener], [Konferencija], [Divizija]) VALUES (19, N'NO        ', N'New Orleans Saints', N'Caesars Superdome', N'Dennis Allen', N'NFC       ', N'South     ')
INSERT [dbo].[Ekipe] ([ID_ekipa], [Kratica], [Ekipa], [Stadion], [Trener], [Konferencija], [Divizija]) VALUES (20, N'LVR       ', N'Las Vegas Raiders', N'Allegiant Stadium', N'Josh McDaniels', N'AFC       ', N'West      ')
INSERT [dbo].[Ekipe] ([ID_ekipa], [Kratica], [Ekipa], [Stadion], [Trener], [Konferencija], [Divizija]) VALUES (21, N'NYG       ', N'New York Giants', N'MetLife Stadium', N'Brian Daboll', N'NFC       ', N'East      ')
INSERT [dbo].[Ekipe] ([ID_ekipa], [Kratica], [Ekipa], [Stadion], [Trener], [Konferencija], [Divizija]) VALUES (22, N'LAC       ', N'Los Angeles Chargers', N'SoFi Stadium', N'Brandon Staley', N'AFC       ', N'West      ')
INSERT [dbo].[Ekipe] ([ID_ekipa], [Kratica], [Ekipa], [Stadion], [Trener], [Konferencija], [Divizija]) VALUES (23, N'PHI       ', N'Philadelphia Eagles', N'Lincoln Financial Field', N'Nick Sirianni', N'NFC       ', N'East      ')
INSERT [dbo].[Ekipe] ([ID_ekipa], [Kratica], [Ekipa], [Stadion], [Trener], [Konferencija], [Divizija]) VALUES (24, N'MIA       ', N'Miami Dolphins', N'Hard Rock Stadium', N'Mike McDaniel', N'AFC       ', N'East      ')
INSERT [dbo].[Ekipe] ([ID_ekipa], [Kratica], [Ekipa], [Stadion], [Trener], [Konferencija], [Divizija]) VALUES (25, N'SF        ', N'San Francisco 49ers', N'Levis Stadium', N'Kyle Shanahan', N'NFC       ', N'West      ')
INSERT [dbo].[Ekipe] ([ID_ekipa], [Kratica], [Ekipa], [Stadion], [Trener], [Konferencija], [Divizija]) VALUES (26, N'NE        ', N'New England Patriots', N'Gillette Stadium', N'Bill Belichick', N'AFC       ', N'East      ')
INSERT [dbo].[Ekipe] ([ID_ekipa], [Kratica], [Ekipa], [Stadion], [Trener], [Konferencija], [Divizija]) VALUES (27, N'SEA       ', N'Seattle Seahawks', N'Lumen Field', N'Pete Carroll', N'NFC       ', N'West      ')
INSERT [dbo].[Ekipe] ([ID_ekipa], [Kratica], [Ekipa], [Stadion], [Trener], [Konferencija], [Divizija]) VALUES (28, N'NYJ       ', N'New York Jets', N'MetLife Stadium', N'Robert Saleh', N'AFC       ', N'East      ')
INSERT [dbo].[Ekipe] ([ID_ekipa], [Kratica], [Ekipa], [Stadion], [Trener], [Konferencija], [Divizija]) VALUES (29, N'TB        ', N'Tampa Bay Buccaneers', N'Raymond James Stadium', N'Todd Bowles', N'NFC       ', N'South     ')
INSERT [dbo].[Ekipe] ([ID_ekipa], [Kratica], [Ekipa], [Stadion], [Trener], [Konferencija], [Divizija]) VALUES (30, N'PIT       ', N'Pittsburgh Steelers', N'Heinz Field', N'Mike Tomlin', N'AFC       ', N'North     ')
INSERT [dbo].[Ekipe] ([ID_ekipa], [Kratica], [Ekipa], [Stadion], [Trener], [Konferencija], [Divizija]) VALUES (31, N'WAS       ', N'Washington Commanders', N'FedExField', N'Ron Rivera', N'NFC       ', N'East      ')
INSERT [dbo].[Ekipe] ([ID_ekipa], [Kratica], [Ekipa], [Stadion], [Trener], [Konferencija], [Divizija]) VALUES (32, N'TEN       ', N'Tennessee Titans', N'Nissan Stadium', N'Mike Vrabel', N'AFC       ', N'South     ')
GO
SET IDENTITY_INSERT [dbo].[kolo] ON 

INSERT [dbo].[kolo] ([id_kolo], [broj_kola], [broj_TD], [startdate], [enddate]) VALUES (1, 1, 49, CAST(N'2022-09-09T00:20:00' AS SmallDateTime), CAST(N'2022-09-13T03:00:00' AS SmallDateTime))
INSERT [dbo].[kolo] ([id_kolo], [broj_kola], [broj_TD], [startdate], [enddate]) VALUES (2, 2, 45, CAST(N'2022-09-16T00:15:00' AS SmallDateTime), CAST(N'2022-09-20T03:00:00' AS SmallDateTime))
INSERT [dbo].[kolo] ([id_kolo], [broj_kola], [broj_TD], [startdate], [enddate]) VALUES (3, 3, 45, CAST(N'2022-09-23T00:15:00' AS SmallDateTime), CAST(N'2022-09-27T03:00:00' AS SmallDateTime))
INSERT [dbo].[kolo] ([id_kolo], [broj_kola], [broj_TD], [startdate], [enddate]) VALUES (4, 4, 30, CAST(N'2022-09-30T00:15:00' AS SmallDateTime), CAST(N'2022-10-04T03:00:00' AS SmallDateTime))
INSERT [dbo].[kolo] ([id_kolo], [broj_kola], [broj_TD], [startdate], [enddate]) VALUES (5, 5, 79, CAST(N'2022-10-07T00:15:00' AS SmallDateTime), CAST(N'2022-10-11T03:00:00' AS SmallDateTime))
INSERT [dbo].[kolo] ([id_kolo], [broj_kola], [broj_TD], [startdate], [enddate]) VALUES (6, 6, 80, CAST(N'2022-10-14T00:15:00' AS SmallDateTime), CAST(N'2022-10-18T03:00:00' AS SmallDateTime))
INSERT [dbo].[kolo] ([id_kolo], [broj_kola], [broj_TD], [startdate], [enddate]) VALUES (7, 7, 90, CAST(N'2022-10-21T00:15:00' AS SmallDateTime), CAST(N'2022-10-25T03:00:00' AS SmallDateTime))
INSERT [dbo].[kolo] ([id_kolo], [broj_kola], [broj_TD], [startdate], [enddate]) VALUES (8, 8, NULL, CAST(N'2022-10-28T00:15:00' AS SmallDateTime), CAST(N'2022-11-01T03:00:00' AS SmallDateTime))
INSERT [dbo].[kolo] ([id_kolo], [broj_kola], [broj_TD], [startdate], [enddate]) VALUES (9, 9, NULL, NULL, NULL)
INSERT [dbo].[kolo] ([id_kolo], [broj_kola], [broj_TD], [startdate], [enddate]) VALUES (10, 10, NULL, NULL, NULL)
INSERT [dbo].[kolo] ([id_kolo], [broj_kola], [broj_TD], [startdate], [enddate]) VALUES (11, 11, NULL, NULL, NULL)
INSERT [dbo].[kolo] ([id_kolo], [broj_kola], [broj_TD], [startdate], [enddate]) VALUES (12, 12, NULL, NULL, NULL)
INSERT [dbo].[kolo] ([id_kolo], [broj_kola], [broj_TD], [startdate], [enddate]) VALUES (13, 13, NULL, NULL, NULL)
INSERT [dbo].[kolo] ([id_kolo], [broj_kola], [broj_TD], [startdate], [enddate]) VALUES (14, 14, NULL, NULL, NULL)
INSERT [dbo].[kolo] ([id_kolo], [broj_kola], [broj_TD], [startdate], [enddate]) VALUES (15, 15, NULL, NULL, NULL)
INSERT [dbo].[kolo] ([id_kolo], [broj_kola], [broj_TD], [startdate], [enddate]) VALUES (16, 16, NULL, NULL, NULL)
INSERT [dbo].[kolo] ([id_kolo], [broj_kola], [broj_TD], [startdate], [enddate]) VALUES (17, 17, NULL, NULL, NULL)
INSERT [dbo].[kolo] ([id_kolo], [broj_kola], [broj_TD], [startdate], [enddate]) VALUES (18, 18, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[kolo] OFF
GO
SET IDENTITY_INSERT [dbo].[Oklada_kolo] ON 

INSERT [dbo].[Oklada_kolo] ([id_oklada_kolo], [user_id], [broj_kola], [broj_TD]) VALUES (1070, 3, 3, 25)
INSERT [dbo].[Oklada_kolo] ([id_oklada_kolo], [user_id], [broj_kola], [broj_TD]) VALUES (1071, 1, 2, 45)
INSERT [dbo].[Oklada_kolo] ([id_oklada_kolo], [user_id], [broj_kola], [broj_TD]) VALUES (1072, 3, 2, 28)
INSERT [dbo].[Oklada_kolo] ([id_oklada_kolo], [user_id], [broj_kola], [broj_TD]) VALUES (1073, 1, 3, 45)
SET IDENTITY_INSERT [dbo].[Oklada_kolo] OFF
GO
SET IDENTITY_INSERT [dbo].[Oklada_utakmice] ON 

INSERT [dbo].[Oklada_utakmice] ([id_oklada_utakmica], [utakmica_id], [pobjednik_utakmica], [dvostruko], [oklada_kolo_id]) VALUES (321, 33, 8, 0, 1070)
INSERT [dbo].[Oklada_utakmice] ([id_oklada_utakmica], [utakmica_id], [pobjednik_utakmica], [dvostruko], [oklada_kolo_id]) VALUES (322, 34, 5, 1, 1070)
INSERT [dbo].[Oklada_utakmice] ([id_oklada_utakmica], [utakmica_id], [pobjednik_utakmica], [dvostruko], [oklada_kolo_id]) VALUES (323, 35, 12, 1, 1070)
INSERT [dbo].[Oklada_utakmice] ([id_oklada_utakmica], [utakmica_id], [pobjednik_utakmica], [dvostruko], [oklada_kolo_id]) VALUES (324, 36, 14, 0, 1070)
INSERT [dbo].[Oklada_utakmice] ([id_oklada_utakmica], [utakmica_id], [pobjednik_utakmica], [dvostruko], [oklada_kolo_id]) VALUES (325, 37, 24, 0, 1070)
INSERT [dbo].[Oklada_utakmice] ([id_oklada_utakmica], [utakmica_id], [pobjednik_utakmica], [dvostruko], [oklada_kolo_id]) VALUES (326, 38, 17, 0, 1070)
INSERT [dbo].[Oklada_utakmice] ([id_oklada_utakmica], [utakmica_id], [pobjednik_utakmica], [dvostruko], [oklada_kolo_id]) VALUES (327, 39, 3, 0, 1070)
INSERT [dbo].[Oklada_utakmice] ([id_oklada_utakmica], [utakmica_id], [pobjednik_utakmica], [dvostruko], [oklada_kolo_id]) VALUES (328, 40, 28, 0, 1070)
INSERT [dbo].[Oklada_utakmice] ([id_oklada_utakmica], [utakmica_id], [pobjednik_utakmica], [dvostruko], [oklada_kolo_id]) VALUES (329, 41, 32, 0, 1070)
INSERT [dbo].[Oklada_utakmice] ([id_oklada_utakmica], [utakmica_id], [pobjednik_utakmica], [dvostruko], [oklada_kolo_id]) VALUES (330, 42, 23, 0, 1070)
INSERT [dbo].[Oklada_utakmice] ([id_oklada_utakmica], [utakmica_id], [pobjednik_utakmica], [dvostruko], [oklada_kolo_id]) VALUES (331, 43, 16, 0, 1070)
INSERT [dbo].[Oklada_utakmice] ([id_oklada_utakmica], [utakmica_id], [pobjednik_utakmica], [dvostruko], [oklada_kolo_id]) VALUES (332, 44, 1, 0, 1070)
INSERT [dbo].[Oklada_utakmice] ([id_oklada_utakmica], [utakmica_id], [pobjednik_utakmica], [dvostruko], [oklada_kolo_id]) VALUES (333, 45, 27, 0, 1070)
INSERT [dbo].[Oklada_utakmice] ([id_oklada_utakmica], [utakmica_id], [pobjednik_utakmica], [dvostruko], [oklada_kolo_id]) VALUES (334, 46, 29, 0, 1070)
INSERT [dbo].[Oklada_utakmice] ([id_oklada_utakmica], [utakmica_id], [pobjednik_utakmica], [dvostruko], [oklada_kolo_id]) VALUES (335, 47, 10, 0, 1070)
INSERT [dbo].[Oklada_utakmice] ([id_oklada_utakmica], [utakmica_id], [pobjednik_utakmica], [dvostruko], [oklada_kolo_id]) VALUES (336, 48, 21, 0, 1070)
INSERT [dbo].[Oklada_utakmice] ([id_oklada_utakmica], [utakmica_id], [pobjednik_utakmica], [dvostruko], [oklada_kolo_id]) VALUES (337, 17, 22, 0, 1071)
INSERT [dbo].[Oklada_utakmice] ([id_oklada_utakmica], [utakmica_id], [pobjednik_utakmica], [dvostruko], [oklada_kolo_id]) VALUES (338, 18, 24, 0, 1071)
INSERT [dbo].[Oklada_utakmice] ([id_oklada_utakmica], [utakmica_id], [pobjednik_utakmica], [dvostruko], [oklada_kolo_id]) VALUES (339, 19, 28, 0, 1071)
INSERT [dbo].[Oklada_utakmice] ([id_oklada_utakmica], [utakmica_id], [pobjednik_utakmica], [dvostruko], [oklada_kolo_id]) VALUES (340, 20, 31, 0, 1071)
INSERT [dbo].[Oklada_utakmice] ([id_oklada_utakmica], [utakmica_id], [pobjednik_utakmica], [dvostruko], [oklada_kolo_id]) VALUES (341, 21, 16, 1, 1071)
INSERT [dbo].[Oklada_utakmice] ([id_oklada_utakmica], [utakmica_id], [pobjednik_utakmica], [dvostruko], [oklada_kolo_id]) VALUES (342, 22, 29, 0, 1071)
INSERT [dbo].[Oklada_utakmice] ([id_oklada_utakmica], [utakmica_id], [pobjednik_utakmica], [dvostruko], [oklada_kolo_id]) VALUES (343, 23, 5, 0, 1071)
INSERT [dbo].[Oklada_utakmice] ([id_oklada_utakmica], [utakmica_id], [pobjednik_utakmica], [dvostruko], [oklada_kolo_id]) VALUES (344, 24, 30, 0, 1071)
INSERT [dbo].[Oklada_utakmice] ([id_oklada_utakmica], [utakmica_id], [pobjednik_utakmica], [dvostruko], [oklada_kolo_id]) VALUES (345, 25, 2, 0, 1071)
INSERT [dbo].[Oklada_utakmice] ([id_oklada_utakmica], [utakmica_id], [pobjednik_utakmica], [dvostruko], [oklada_kolo_id]) VALUES (346, 26, 25, 0, 1071)
INSERT [dbo].[Oklada_utakmice] ([id_oklada_utakmica], [utakmica_id], [pobjednik_utakmica], [dvostruko], [oklada_kolo_id]) VALUES (347, 27, 6, 0, 1071)
INSERT [dbo].[Oklada_utakmice] ([id_oklada_utakmica], [utakmica_id], [pobjednik_utakmica], [dvostruko], [oklada_kolo_id]) VALUES (348, 28, 10, 0, 1071)
INSERT [dbo].[Oklada_utakmice] ([id_oklada_utakmica], [utakmica_id], [pobjednik_utakmica], [dvostruko], [oklada_kolo_id]) VALUES (349, 29, 1, 0, 1071)
INSERT [dbo].[Oklada_utakmice] ([id_oklada_utakmica], [utakmica_id], [pobjednik_utakmica], [dvostruko], [oklada_kolo_id]) VALUES (350, 30, 13, 0, 1071)
INSERT [dbo].[Oklada_utakmice] ([id_oklada_utakmica], [utakmica_id], [pobjednik_utakmica], [dvostruko], [oklada_kolo_id]) VALUES (351, 31, 4, 0, 1071)
INSERT [dbo].[Oklada_utakmice] ([id_oklada_utakmica], [utakmica_id], [pobjednik_utakmica], [dvostruko], [oklada_kolo_id]) VALUES (352, 32, 23, 0, 1071)
INSERT [dbo].[Oklada_utakmice] ([id_oklada_utakmica], [utakmica_id], [pobjednik_utakmica], [dvostruko], [oklada_kolo_id]) VALUES (353, 17, 18, 0, 1072)
INSERT [dbo].[Oklada_utakmice] ([id_oklada_utakmica], [utakmica_id], [pobjednik_utakmica], [dvostruko], [oklada_kolo_id]) VALUES (354, 18, 24, 0, 1072)
INSERT [dbo].[Oklada_utakmice] ([id_oklada_utakmica], [utakmica_id], [pobjednik_utakmica], [dvostruko], [oklada_kolo_id]) VALUES (355, 19, 8, 0, 1072)
INSERT [dbo].[Oklada_utakmice] ([id_oklada_utakmica], [utakmica_id], [pobjednik_utakmica], [dvostruko], [oklada_kolo_id]) VALUES (356, 20, 11, 0, 1072)
INSERT [dbo].[Oklada_utakmice] ([id_oklada_utakmica], [utakmica_id], [pobjednik_utakmica], [dvostruko], [oklada_kolo_id]) VALUES (357, 21, 14, 1, 1072)
INSERT [dbo].[Oklada_utakmice] ([id_oklada_utakmica], [utakmica_id], [pobjednik_utakmica], [dvostruko], [oklada_kolo_id]) VALUES (358, 22, 19, 0, 1072)
INSERT [dbo].[Oklada_utakmice] ([id_oklada_utakmica], [utakmica_id], [pobjednik_utakmica], [dvostruko], [oklada_kolo_id]) VALUES (359, 23, 5, 0, 1072)
INSERT [dbo].[Oklada_utakmice] ([id_oklada_utakmica], [utakmica_id], [pobjednik_utakmica], [dvostruko], [oklada_kolo_id]) VALUES (360, 24, 26, 0, 1072)
INSERT [dbo].[Oklada_utakmice] ([id_oklada_utakmica], [utakmica_id], [pobjednik_utakmica], [dvostruko], [oklada_kolo_id]) VALUES (361, 25, 15, 0, 1072)
INSERT [dbo].[Oklada_utakmice] ([id_oklada_utakmica], [utakmica_id], [pobjednik_utakmica], [dvostruko], [oklada_kolo_id]) VALUES (362, 26, 27, 0, 1072)
INSERT [dbo].[Oklada_utakmice] ([id_oklada_utakmica], [utakmica_id], [pobjednik_utakmica], [dvostruko], [oklada_kolo_id]) VALUES (363, 27, 9, 0, 1072)
INSERT [dbo].[Oklada_utakmice] ([id_oklada_utakmica], [utakmica_id], [pobjednik_utakmica], [dvostruko], [oklada_kolo_id]) VALUES (364, 28, 12, 0, 1072)
INSERT [dbo].[Oklada_utakmice] ([id_oklada_utakmica], [utakmica_id], [pobjednik_utakmica], [dvostruko], [oklada_kolo_id]) VALUES (365, 29, 20, 0, 1072)
INSERT [dbo].[Oklada_utakmice] ([id_oklada_utakmica], [utakmica_id], [pobjednik_utakmica], [dvostruko], [oklada_kolo_id]) VALUES (366, 30, 7, 0, 1072)
INSERT [dbo].[Oklada_utakmice] ([id_oklada_utakmica], [utakmica_id], [pobjednik_utakmica], [dvostruko], [oklada_kolo_id]) VALUES (367, 31, 32, 0, 1072)
INSERT [dbo].[Oklada_utakmice] ([id_oklada_utakmica], [utakmica_id], [pobjednik_utakmica], [dvostruko], [oklada_kolo_id]) VALUES (368, 32, 23, 0, 1072)
INSERT [dbo].[Oklada_utakmice] ([id_oklada_utakmica], [utakmica_id], [pobjednik_utakmica], [dvostruko], [oklada_kolo_id]) VALUES (369, 33, 30, 0, 1073)
INSERT [dbo].[Oklada_utakmice] ([id_oklada_utakmica], [utakmica_id], [pobjednik_utakmica], [dvostruko], [oklada_kolo_id]) VALUES (370, 34, 5, 1, 1073)
INSERT [dbo].[Oklada_utakmice] ([id_oklada_utakmica], [utakmica_id], [pobjednik_utakmica], [dvostruko], [oklada_kolo_id]) VALUES (371, 35, 12, 1, 1073)
INSERT [dbo].[Oklada_utakmice] ([id_oklada_utakmica], [utakmica_id], [pobjednik_utakmica], [dvostruko], [oklada_kolo_id]) VALUES (372, 36, 14, 0, 1073)
INSERT [dbo].[Oklada_utakmice] ([id_oklada_utakmica], [utakmica_id], [pobjednik_utakmica], [dvostruko], [oklada_kolo_id]) VALUES (373, 37, 4, 0, 1073)
INSERT [dbo].[Oklada_utakmice] ([id_oklada_utakmica], [utakmica_id], [pobjednik_utakmica], [dvostruko], [oklada_kolo_id]) VALUES (374, 38, 11, 0, 1073)
INSERT [dbo].[Oklada_utakmice] ([id_oklada_utakmica], [utakmica_id], [pobjednik_utakmica], [dvostruko], [oklada_kolo_id]) VALUES (375, 39, 26, 0, 1073)
INSERT [dbo].[Oklada_utakmice] ([id_oklada_utakmica], [utakmica_id], [pobjednik_utakmica], [dvostruko], [oklada_kolo_id]) VALUES (376, 40, 28, 0, 1073)
INSERT [dbo].[Oklada_utakmice] ([id_oklada_utakmica], [utakmica_id], [pobjednik_utakmica], [dvostruko], [oklada_kolo_id]) VALUES (377, 41, 20, 0, 1073)
INSERT [dbo].[Oklada_utakmice] ([id_oklada_utakmica], [utakmica_id], [pobjednik_utakmica], [dvostruko], [oklada_kolo_id]) VALUES (378, 42, 31, 0, 1073)
INSERT [dbo].[Oklada_utakmice] ([id_oklada_utakmica], [utakmica_id], [pobjednik_utakmica], [dvostruko], [oklada_kolo_id]) VALUES (379, 43, 16, 0, 1073)
INSERT [dbo].[Oklada_utakmice] ([id_oklada_utakmica], [utakmica_id], [pobjednik_utakmica], [dvostruko], [oklada_kolo_id]) VALUES (380, 44, 1, 0, 1073)
INSERT [dbo].[Oklada_utakmice] ([id_oklada_utakmica], [utakmica_id], [pobjednik_utakmica], [dvostruko], [oklada_kolo_id]) VALUES (381, 45, 27, 0, 1073)
INSERT [dbo].[Oklada_utakmice] ([id_oklada_utakmica], [utakmica_id], [pobjednik_utakmica], [dvostruko], [oklada_kolo_id]) VALUES (382, 46, 13, 0, 1073)
INSERT [dbo].[Oklada_utakmice] ([id_oklada_utakmica], [utakmica_id], [pobjednik_utakmica], [dvostruko], [oklada_kolo_id]) VALUES (383, 47, 25, 0, 1073)
INSERT [dbo].[Oklada_utakmice] ([id_oklada_utakmica], [utakmica_id], [pobjednik_utakmica], [dvostruko], [oklada_kolo_id]) VALUES (384, 48, 21, 0, 1073)
SET IDENTITY_INSERT [dbo].[Oklada_utakmice] OFF
GO
SET IDENTITY_INSERT [dbo].[Utakmice] ON 

INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (1, 1, 4, 15, NULL, CAST(N'2022-09-09T00:20:00' AS SmallDateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (2, 1, 19, 2, NULL, CAST(N'2022-09-11T17:00:00' AS SmallDateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (3, 1, 25, 7, NULL, CAST(N'2022-09-11T17:00:00' AS SmallDateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (4, 1, 30, 6, NULL, CAST(N'2022-09-11T17:00:00' AS SmallDateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (5, 1, 23, 11, NULL, CAST(N'2022-09-11T17:00:00' AS SmallDateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (6, 1, 26, 24, NULL, CAST(N'2022-09-11T17:00:00' AS SmallDateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (7, 1, 3, 28, NULL, CAST(N'2022-09-11T17:00:00' AS SmallDateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (8, 1, 8, 5, NULL, CAST(N'2022-09-11T17:00:00' AS SmallDateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (9, 1, 14, 12, NULL, CAST(N'2022-09-11T17:00:00' AS SmallDateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (10, 1, 21, 32, NULL, CAST(N'2022-09-11T17:00:00' AS SmallDateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (11, 1, 13, 17, NULL, CAST(N'2022-09-11T17:00:00' AS SmallDateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (12, 1, 18, 1, NULL, CAST(N'2022-09-11T17:00:00' AS SmallDateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (13, 1, 20, 22, NULL, CAST(N'2022-09-11T17:00:00' AS SmallDateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (14, 1, 29, 9, NULL, CAST(N'2022-09-12T00:20:00' AS SmallDateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (15, 1, 10, 27, NULL, CAST(N'2022-09-13T00:15:00' AS SmallDateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (16, 1, 16, 31, NULL, CAST(N'2022-09-11T17:00:00' AS SmallDateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (17, 2, 22, 18, 18, CAST(N'2022-09-16T00:15:00' AS SmallDateTime), -7, 7, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (18, 2, 24, 3, 3, CAST(N'2022-09-18T17:00:00' AS SmallDateTime), 3, -3, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (19, 2, 28, 8, 8, CAST(N'2022-09-18T17:00:00' AS SmallDateTime), 15, -15, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (20, 2, 31, 11, 31, CAST(N'2022-09-18T17:00:00' AS SmallDateTime), -5, 5, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (21, 2, 14, 16, 16, CAST(N'2022-09-18T17:00:00' AS SmallDateTime), -1, 1, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (22, 2, 29, 19, 19, CAST(N'2022-09-18T17:00:00' AS SmallDateTime), -3, 3, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (23, 2, 5, 21, 5, CAST(N'2022-09-18T17:00:00' AS SmallDateTime), 5, -5, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (24, 2, 26, 30, 30, CAST(N'2022-09-18T17:00:00' AS SmallDateTime), -2, 2, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (25, 2, 2, 15, 2, CAST(N'2022-09-19T20:05:00' AS SmallDateTime), 7, 7, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (26, 2, 27, 25, 25, CAST(N'2022-09-19T20:05:00' AS SmallDateTime), 11, -11, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (27, 2, 6, 9, 9, CAST(N'2022-09-19T20:25:00' AS SmallDateTime), 2, -2, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (28, 2, 12, 10, 10, CAST(N'2022-09-19T20:25:00' AS SmallDateTime), 11, -11, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (29, 2, 1, 20, 1, CAST(N'2022-09-19T20:25:00' AS SmallDateTime), 8, -8, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (30, 2, 7, 13, 13, CAST(N'2022-09-19T00:20:00' AS SmallDateTime), -9, 9, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (31, 2, 32, 4, 4, CAST(N'2022-09-20T00:15:00' AS SmallDateTime), 4, -4, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (32, 2, 17, 23, 17, CAST(N'2022-09-20T00:30:00' AS SmallDateTime), 6, -6, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (33, 3, 30, 8, 30, CAST(N'2022-09-23T00:15:00' AS SmallDateTime), -3, 3, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (34, 3, 19, 5, 5, CAST(N'2022-09-25T17:00:00' AS SmallDateTime), 1, -1, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (35, 3, 12, 7, 12, CAST(N'2022-09-25T17:00:00' AS SmallDateTime), -12, 12, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (36, 3, 18, 14, 18, CAST(N'2022-09-25T17:00:00' AS SmallDateTime), -5, 5, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (37, 3, 4, 24, 4, CAST(N'2022-09-25T17:00:00' AS SmallDateTime), -3, 3, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (38, 3, 11, 17, 17, CAST(N'2022-09-25T17:00:00' AS SmallDateTime), -7, 7, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (39, 3, 3, 26, 3, CAST(N'2022-09-25T17:00:00' AS SmallDateTime), -8, 8, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (40, 3, 6, 28, 6, CAST(N'2022-09-25T17:00:00' AS SmallDateTime), 2, -2, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (41, 3, 20, 32, 32, CAST(N'2022-09-25T17:00:00' AS SmallDateTime), -4, 4, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (42, 3, 23, 31, 23, CAST(N'2022-09-25T17:00:00' AS SmallDateTime), 1, -1, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (43, 3, 16, 22, 16, CAST(N'2022-09-26T20:05:00' AS SmallDateTime), -3, 3, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (44, 3, 15, 1, 1, CAST(N'2022-09-26T20:25:00' AS SmallDateTime), 5, -5, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (45, 3, 2, 27, 2, CAST(N'2022-09-26T20:25:00' AS SmallDateTime), -6, 6, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (46, 3, 13, 29, 13, CAST(N'2022-09-26T20:25:00' AS SmallDateTime), -11, 11, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (47, 3, 25, 10, 10, CAST(N'2022-09-26T00:20:00' AS SmallDateTime), -12, 12, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (48, 3, 9, 21, 9, CAST(N'2022-09-27T00:15:00' AS SmallDateTime), -7, 7, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (49, 4, 24, 6, NULL, CAST(N'2022-09-30T00:15:00' AS SmallDateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (50, 4, 17, 19, NULL, CAST(N'2022-10-02T13:30:00' AS SmallDateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (51, 4, 8, 2, NULL, CAST(N'2022-10-02T17:00:00' AS SmallDateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (52, 4, 4, 3, NULL, CAST(N'2022-10-02T17:00:00' AS SmallDateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (53, 4, 31, 9, NULL, CAST(N'2022-10-02T17:00:00' AS SmallDateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (54, 4, 27, 11, NULL, CAST(N'2022-10-02T17:00:00' AS SmallDateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (55, 4, 22, 12, NULL, CAST(N'2022-10-02T17:00:00' AS SmallDateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (56, 4, 32, 14, NULL, CAST(N'2022-10-02T17:00:00' AS SmallDateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (57, 4, 7, 21, NULL, CAST(N'2022-10-02T17:00:00' AS SmallDateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (58, 4, 16, 23, NULL, CAST(N'2022-10-02T17:00:00' AS SmallDateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (59, 4, 28, 30, NULL, CAST(N'2022-10-02T17:00:00' AS SmallDateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (60, 4, 1, 5, NULL, CAST(N'2022-10-02T20:05:00' AS SmallDateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (61, 4, 26, 13, NULL, CAST(N'2022-10-02T20:25:00' AS SmallDateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (62, 4, 10, 20, NULL, CAST(N'2022-10-02T20:25:00' AS SmallDateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (63, 4, 18, 29, NULL, CAST(N'2022-10-03T00:20:00' AS SmallDateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (64, 4, 15, 25, NULL, CAST(N'2022-10-04T00:15:00' AS SmallDateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (65, 5, 14, 10, NULL, CAST(N'2022-10-07T00:15:00' AS SmallDateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (66, 5, 21, 13, NULL, CAST(N'2022-10-09T13:30:00' AS SmallDateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (67, 5, 30, 4, NULL, CAST(N'2022-10-09T17:00:00' AS SmallDateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (68, 5, 22, 8, NULL, CAST(N'2022-10-09T17:00:00' AS SmallDateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (69, 5, 12, 16, NULL, CAST(N'2022-10-09T17:00:00' AS SmallDateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (70, 5, 7, 17, NULL, CAST(N'2022-10-09T17:00:00' AS SmallDateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (71, 5, 11, 26, NULL, CAST(N'2022-10-09T17:00:00' AS SmallDateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (72, 5, 27, 19, NULL, CAST(N'2022-10-09T17:00:00' AS SmallDateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (73, 5, 24, 28, NULL, CAST(N'2022-10-09T17:00:00' AS SmallDateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (74, 5, 2, 29, NULL, CAST(N'2022-10-09T17:00:00' AS SmallDateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (75, 5, 32, 31, NULL, CAST(N'2022-10-09T17:00:00' AS SmallDateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (76, 5, 25, 5, NULL, CAST(N'2022-10-09T20:05:00' AS SmallDateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (77, 5, 23, 1, NULL, CAST(N'2022-10-09T20:25:00' AS SmallDateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (78, 5, 9, 15, NULL, CAST(N'2022-10-09T20:25:00' AS SmallDateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (79, 5, 6, 3, NULL, CAST(N'2022-10-10T00:20:00' AS SmallDateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (80, 5, 20, 18, NULL, CAST(N'2022-10-11T00:15:00' AS SmallDateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (81, 6, 31, 7, NULL, CAST(N'2022-10-14T00:15:00' AS SmallDateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (82, 6, 25, 2, NULL, CAST(N'2022-10-16T17:00:00' AS SmallDateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (83, 6, 26, 8, NULL, CAST(N'2022-10-16T17:00:00' AS SmallDateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (84, 6, 28, 13, NULL, CAST(N'2022-10-16T17:00:00' AS SmallDateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (85, 6, 16, 14, NULL, CAST(N'2022-10-16T17:00:00' AS SmallDateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (86, 6, 17, 24, NULL, CAST(N'2022-10-16T17:00:00' AS SmallDateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (87, 6, 6, 19, NULL, CAST(N'2022-10-16T17:00:00' AS SmallDateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (88, 6, 3, 21, NULL, CAST(N'2022-10-16T17:00:00' AS SmallDateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (89, 6, 29, 30, NULL, CAST(N'2022-10-16T17:00:00' AS SmallDateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (90, 6, 5, 15, NULL, CAST(N'2022-10-16T20:05:00' AS SmallDateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (91, 6, 1, 27, NULL, CAST(N'2022-10-16T20:05:00' AS SmallDateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (92, 6, 4, 18, NULL, CAST(N'2022-10-16T20:25:00' AS SmallDateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (93, 6, 9, 23, NULL, CAST(N'2022-10-17T00:20:00' AS SmallDateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (94, 6, 10, 22, NULL, CAST(N'2022-10-18T00:15:00' AS SmallDateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (95, 7, 19, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (96, 7, 8, 3, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (97, 7, 29, 5, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (98, 7, 2, 6, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (99, 7, 11, 9, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (100, 7, 21, 16, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (101, 7, 14, 32, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (102, 7, 13, 31, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (103, 7, 28, 10, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (104, 7, 12, 20, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (105, 7, 27, 22, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (106, 7, 18, 25, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (107, 7, 30, 24, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (108, 7, 7, 26, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (109, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (110, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (111, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (112, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (113, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (114, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (115, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (116, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (117, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (118, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (119, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (120, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (121, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (122, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (123, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (124, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (125, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (126, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (127, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (128, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (129, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (130, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (131, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (132, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (133, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (134, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (135, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (136, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (137, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (138, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (139, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (140, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (141, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (142, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (143, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (144, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (145, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (146, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (147, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (148, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (149, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (150, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (151, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (152, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (153, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (154, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (155, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (156, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (157, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (158, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (159, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (160, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (161, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (162, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (163, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (164, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (165, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (167, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (168, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (169, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (170, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (171, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (172, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (173, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (174, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (175, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (176, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (177, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (178, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (179, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (180, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (181, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (182, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (183, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (184, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (185, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (186, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (187, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (188, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (189, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (190, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (191, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (192, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (193, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (194, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (195, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (196, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (197, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (198, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (199, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (200, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (201, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (202, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (203, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (204, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (205, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (206, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (207, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (208, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (209, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (210, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (211, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (212, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (213, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (214, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (215, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (216, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (217, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (218, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (219, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (220, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (221, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (222, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (223, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (224, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (225, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (226, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (227, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (228, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (229, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (230, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (231, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (232, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (233, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (234, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (235, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (236, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (237, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (238, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (239, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (240, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (241, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (242, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (243, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (244, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (245, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (246, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (247, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (248, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (249, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (250, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (251, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (252, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (253, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (254, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (256, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (257, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (258, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (259, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (260, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (261, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (262, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (263, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (264, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (265, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (266, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (267, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (268, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (269, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (270, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (271, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (272, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (273, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (274, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utakmice] ([id_utakmica], [kolo], [gosti], [domacini], [pobjednik], [datum_vrijeme], [gosti_spread], [domaci_spread], [rez_doma], [rez_gosti]) VALUES (275, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Utakmice] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [auth_group_name_a6ea08ec_uniq]    Script Date: 16/08/2022 15:16:00 ******/
ALTER TABLE [dbo].[auth_group] ADD  CONSTRAINT [auth_group_name_a6ea08ec_uniq] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [auth_group_permissions_group_id_b120cbf9]    Script Date: 16/08/2022 15:16:00 ******/
CREATE NONCLUSTERED INDEX [auth_group_permissions_group_id_b120cbf9] ON [dbo].[auth_group_permissions]
(
	[group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [auth_group_permissions_group_id_permission_id_0cd325b0_uniq]    Script Date: 16/08/2022 15:16:00 ******/
CREATE UNIQUE NONCLUSTERED INDEX [auth_group_permissions_group_id_permission_id_0cd325b0_uniq] ON [dbo].[auth_group_permissions]
(
	[group_id] ASC,
	[permission_id] ASC
)
WHERE ([group_id] IS NOT NULL AND [permission_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [auth_group_permissions_permission_id_84c5c92e]    Script Date: 16/08/2022 15:16:00 ******/
CREATE NONCLUSTERED INDEX [auth_group_permissions_permission_id_84c5c92e] ON [dbo].[auth_group_permissions]
(
	[permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [auth_permission_content_type_id_2f476e4b]    Script Date: 16/08/2022 15:16:00 ******/
CREATE NONCLUSTERED INDEX [auth_permission_content_type_id_2f476e4b] ON [dbo].[auth_permission]
(
	[content_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [auth_permission_content_type_id_codename_01ab375a_uniq]    Script Date: 16/08/2022 15:16:00 ******/
CREATE UNIQUE NONCLUSTERED INDEX [auth_permission_content_type_id_codename_01ab375a_uniq] ON [dbo].[auth_permission]
(
	[content_type_id] ASC,
	[codename] ASC
)
WHERE ([content_type_id] IS NOT NULL AND [codename] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [auth_user_username_6821ab7c_uniq]    Script Date: 16/08/2022 15:16:00 ******/
ALTER TABLE [dbo].[auth_user] ADD  CONSTRAINT [auth_user_username_6821ab7c_uniq] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [auth_user_groups_group_id_97559544]    Script Date: 16/08/2022 15:16:00 ******/
CREATE NONCLUSTERED INDEX [auth_user_groups_group_id_97559544] ON [dbo].[auth_user_groups]
(
	[group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [auth_user_groups_user_id_6a12ed8b]    Script Date: 16/08/2022 15:16:00 ******/
CREATE NONCLUSTERED INDEX [auth_user_groups_user_id_6a12ed8b] ON [dbo].[auth_user_groups]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [auth_user_groups_user_id_group_id_94350c0c_uniq]    Script Date: 16/08/2022 15:16:00 ******/
CREATE UNIQUE NONCLUSTERED INDEX [auth_user_groups_user_id_group_id_94350c0c_uniq] ON [dbo].[auth_user_groups]
(
	[user_id] ASC,
	[group_id] ASC
)
WHERE ([user_id] IS NOT NULL AND [group_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [auth_user_user_permissions_permission_id_1fbb5f2c]    Script Date: 16/08/2022 15:16:00 ******/
CREATE NONCLUSTERED INDEX [auth_user_user_permissions_permission_id_1fbb5f2c] ON [dbo].[auth_user_user_permissions]
(
	[permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [auth_user_user_permissions_user_id_a95ead1b]    Script Date: 16/08/2022 15:16:00 ******/
CREATE NONCLUSTERED INDEX [auth_user_user_permissions_user_id_a95ead1b] ON [dbo].[auth_user_user_permissions]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [auth_user_user_permissions_user_id_permission_id_14a6b632_uniq]    Script Date: 16/08/2022 15:16:00 ******/
CREATE UNIQUE NONCLUSTERED INDEX [auth_user_user_permissions_user_id_permission_id_14a6b632_uniq] ON [dbo].[auth_user_user_permissions]
(
	[user_id] ASC,
	[permission_id] ASC
)
WHERE ([user_id] IS NOT NULL AND [permission_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [django_admin_log_content_type_id_c4bce8eb]    Script Date: 16/08/2022 15:16:00 ******/
CREATE NONCLUSTERED INDEX [django_admin_log_content_type_id_c4bce8eb] ON [dbo].[django_admin_log]
(
	[content_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [django_admin_log_user_id_c564eba6]    Script Date: 16/08/2022 15:16:00 ******/
CREATE NONCLUSTERED INDEX [django_admin_log_user_id_c564eba6] ON [dbo].[django_admin_log]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [django_content_type_app_label_model_76bd3d3b_uniq]    Script Date: 16/08/2022 15:16:00 ******/
CREATE UNIQUE NONCLUSTERED INDEX [django_content_type_app_label_model_76bd3d3b_uniq] ON [dbo].[django_content_type]
(
	[app_label] ASC,
	[model] ASC
)
WHERE ([app_label] IS NOT NULL AND [model] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [django_session_expire_date_a5c62663]    Script Date: 16/08/2022 15:16:00 ******/
CREATE NONCLUSTERED INDEX [django_session_expire_date_a5c62663] ON [dbo].[django_session]
(
	[expire_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [django_site_domain_a2e37b91_uniq]    Script Date: 16/08/2022 15:16:00 ******/
ALTER TABLE [dbo].[django_site] ADD  CONSTRAINT [django_site_domain_a2e37b91_uniq] UNIQUE NONCLUSTERED 
(
	[domain] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_kolo]    Script Date: 16/08/2022 15:16:00 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_kolo] ON [dbo].[kolo]
(
	[broj_kola] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__PTS_week__CA6977234C67A034]    Script Date: 16/08/2022 15:16:00 ******/
ALTER TABLE [dbo].[PTS_week] ADD UNIQUE NONCLUSTERED 
(
	[korisnik] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[auth_group_permissions]  WITH CHECK ADD  CONSTRAINT [auth_group_permissions_group_id_b120cbf9_fk_auth_group_id] FOREIGN KEY([group_id])
REFERENCES [dbo].[auth_group] ([id])
GO
ALTER TABLE [dbo].[auth_group_permissions] CHECK CONSTRAINT [auth_group_permissions_group_id_b120cbf9_fk_auth_group_id]
GO
ALTER TABLE [dbo].[auth_group_permissions]  WITH CHECK ADD  CONSTRAINT [auth_group_permissions_permission_id_84c5c92e_fk_auth_permission_id] FOREIGN KEY([permission_id])
REFERENCES [dbo].[auth_permission] ([id])
GO
ALTER TABLE [dbo].[auth_group_permissions] CHECK CONSTRAINT [auth_group_permissions_permission_id_84c5c92e_fk_auth_permission_id]
GO
ALTER TABLE [dbo].[auth_permission]  WITH CHECK ADD  CONSTRAINT [auth_permission_content_type_id_2f476e4b_fk_django_content_type_id] FOREIGN KEY([content_type_id])
REFERENCES [dbo].[django_content_type] ([id])
GO
ALTER TABLE [dbo].[auth_permission] CHECK CONSTRAINT [auth_permission_content_type_id_2f476e4b_fk_django_content_type_id]
GO
ALTER TABLE [dbo].[auth_user_groups]  WITH CHECK ADD  CONSTRAINT [auth_user_groups_group_id_97559544_fk_auth_group_id] FOREIGN KEY([group_id])
REFERENCES [dbo].[auth_group] ([id])
GO
ALTER TABLE [dbo].[auth_user_groups] CHECK CONSTRAINT [auth_user_groups_group_id_97559544_fk_auth_group_id]
GO
ALTER TABLE [dbo].[auth_user_groups]  WITH CHECK ADD  CONSTRAINT [auth_user_groups_user_id_6a12ed8b_fk_auth_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[auth_user_groups] CHECK CONSTRAINT [auth_user_groups_user_id_6a12ed8b_fk_auth_user_id]
GO
ALTER TABLE [dbo].[auth_user_user_permissions]  WITH CHECK ADD  CONSTRAINT [auth_user_user_permissions_permission_id_1fbb5f2c_fk_auth_permission_id] FOREIGN KEY([permission_id])
REFERENCES [dbo].[auth_permission] ([id])
GO
ALTER TABLE [dbo].[auth_user_user_permissions] CHECK CONSTRAINT [auth_user_user_permissions_permission_id_1fbb5f2c_fk_auth_permission_id]
GO
ALTER TABLE [dbo].[auth_user_user_permissions]  WITH CHECK ADD  CONSTRAINT [auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[auth_user_user_permissions] CHECK CONSTRAINT [auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id]
GO
ALTER TABLE [dbo].[django_admin_log]  WITH CHECK ADD  CONSTRAINT [django_admin_log_content_type_id_c4bce8eb_fk_django_content_type_id] FOREIGN KEY([content_type_id])
REFERENCES [dbo].[django_content_type] ([id])
GO
ALTER TABLE [dbo].[django_admin_log] CHECK CONSTRAINT [django_admin_log_content_type_id_c4bce8eb_fk_django_content_type_id]
GO
ALTER TABLE [dbo].[django_admin_log]  WITH CHECK ADD  CONSTRAINT [django_admin_log_user_id_c564eba6_fk_auth_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[django_admin_log] CHECK CONSTRAINT [django_admin_log_user_id_c564eba6_fk_auth_user_id]
GO
ALTER TABLE [dbo].[igraci]  WITH CHECK ADD  CONSTRAINT [FK_igraci_igraci] FOREIGN KEY([id_igraca])
REFERENCES [dbo].[igraci] ([id_igraca])
GO
ALTER TABLE [dbo].[igraci] CHECK CONSTRAINT [FK_igraci_igraci]
GO
ALTER TABLE [dbo].[Oklada_kolo]  WITH CHECK ADD  CONSTRAINT [FK_Oklada_kolo_auth_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[Oklada_kolo] CHECK CONSTRAINT [FK_Oklada_kolo_auth_user]
GO
ALTER TABLE [dbo].[Oklada_kolo]  WITH CHECK ADD  CONSTRAINT [FK_Oklada_kolo_kolo] FOREIGN KEY([broj_kola])
REFERENCES [dbo].[kolo] ([id_kolo])
GO
ALTER TABLE [dbo].[Oklada_kolo] CHECK CONSTRAINT [FK_Oklada_kolo_kolo]
GO
ALTER TABLE [dbo].[Oklada_utakmice]  WITH CHECK ADD  CONSTRAINT [FK_Oklada_utakmice_Ekipe] FOREIGN KEY([pobjednik_utakmica])
REFERENCES [dbo].[Ekipe] ([ID_ekipa])
GO
ALTER TABLE [dbo].[Oklada_utakmice] CHECK CONSTRAINT [FK_Oklada_utakmice_Ekipe]
GO
ALTER TABLE [dbo].[Oklada_utakmice]  WITH CHECK ADD  CONSTRAINT [FK_Oklada_utakmice_utakmica_id] FOREIGN KEY([utakmica_id])
REFERENCES [dbo].[Utakmice] ([id_utakmica])
GO
ALTER TABLE [dbo].[Oklada_utakmice] CHECK CONSTRAINT [FK_Oklada_utakmice_utakmica_id]
GO
ALTER TABLE [dbo].[PTS_week]  WITH CHECK ADD  CONSTRAINT [FK__PTS_week__kolo__6166761E] FOREIGN KEY([kolo])
REFERENCES [dbo].[kolo] ([broj_kola])
GO
ALTER TABLE [dbo].[PTS_week] CHECK CONSTRAINT [FK__PTS_week__kolo__6166761E]
GO
ALTER TABLE [dbo].[PTS_week]  WITH CHECK ADD FOREIGN KEY([korisnik])
REFERENCES [dbo].[auth_user] ([username])
GO
ALTER TABLE [dbo].[Utakmice]  WITH CHECK ADD  CONSTRAINT [FK__Utakmice__domaci__3D5E1FD2] FOREIGN KEY([domacini])
REFERENCES [dbo].[Ekipe] ([ID_ekipa])
GO
ALTER TABLE [dbo].[Utakmice] CHECK CONSTRAINT [FK__Utakmice__domaci__3D5E1FD2]
GO
ALTER TABLE [dbo].[Utakmice]  WITH CHECK ADD  CONSTRAINT [FK__Utakmice__gosti__3C69FB99] FOREIGN KEY([gosti])
REFERENCES [dbo].[Ekipe] ([ID_ekipa])
GO
ALTER TABLE [dbo].[Utakmice] CHECK CONSTRAINT [FK__Utakmice__gosti__3C69FB99]
GO
ALTER TABLE [dbo].[Utakmice]  WITH CHECK ADD  CONSTRAINT [FK_Utakmice_Ekipe] FOREIGN KEY([pobjednik])
REFERENCES [dbo].[Ekipe] ([ID_ekipa])
GO
ALTER TABLE [dbo].[Utakmice] CHECK CONSTRAINT [FK_Utakmice_Ekipe]
GO
ALTER TABLE [dbo].[Utakmice]  WITH CHECK ADD  CONSTRAINT [FK_Utakmice_kolo] FOREIGN KEY([kolo])
REFERENCES [dbo].[kolo] ([id_kolo])
GO
ALTER TABLE [dbo].[Utakmice] CHECK CONSTRAINT [FK_Utakmice_kolo]
GO
ALTER TABLE [dbo].[django_admin_log]  WITH CHECK ADD  CONSTRAINT [django_admin_log_action_flag_a8637d59_check] CHECK  (([action_flag]>=(0)))
GO
ALTER TABLE [dbo].[django_admin_log] CHECK CONSTRAINT [django_admin_log_action_flag_a8637d59_check]
GO
USE [master]
GO
ALTER DATABASE [NFL] SET  READ_WRITE 
GO
