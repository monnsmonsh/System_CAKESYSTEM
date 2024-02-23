USE [master]
GO
/****** Object:  Database [SmallSoft]    Script Date: 22/02/2024 09:20:35 p. m. ******/
CREATE DATABASE [SmallSoft]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SmallSoft', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SmallSoft.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SmallSoft_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SmallSoft_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SmallSoft] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SmallSoft].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SmallSoft] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SmallSoft] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SmallSoft] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SmallSoft] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SmallSoft] SET ARITHABORT OFF 
GO
ALTER DATABASE [SmallSoft] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SmallSoft] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SmallSoft] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SmallSoft] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SmallSoft] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SmallSoft] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SmallSoft] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SmallSoft] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SmallSoft] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SmallSoft] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SmallSoft] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SmallSoft] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SmallSoft] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SmallSoft] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SmallSoft] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SmallSoft] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [SmallSoft] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SmallSoft] SET RECOVERY FULL 
GO
ALTER DATABASE [SmallSoft] SET  MULTI_USER 
GO
ALTER DATABASE [SmallSoft] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SmallSoft] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SmallSoft] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SmallSoft] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SmallSoft] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SmallSoft', N'ON'
GO
ALTER DATABASE [SmallSoft] SET QUERY_STORE = OFF
GO
USE [SmallSoft]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 22/02/2024 09:20:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 22/02/2024 09:20:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 22/02/2024 09:20:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 22/02/2024 09:20:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 22/02/2024 09:20:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 22/02/2024 09:20:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estadoes]    Script Date: 22/02/2024 09:20:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estadoes](
	[EstadoID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Estadoes] PRIMARY KEY CLUSTERED 
(
	[EstadoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Localidads]    Script Date: 22/02/2024 09:20:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Localidads](
	[LocalidadID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NULL,
	[MunicipioID] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Localidads] PRIMARY KEY CLUSTERED 
(
	[LocalidadID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Municipios]    Script Date: 22/02/2024 09:20:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Municipios](
	[MunicipioID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NULL,
	[EstadoID] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Municipios] PRIMARY KEY CLUSTERED 
(
	[MunicipioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblCategorias]    Script Date: 22/02/2024 09:20:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblCategorias](
	[CategoriaID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.TblCategorias] PRIMARY KEY CLUSTERED 
(
	[CategoriaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblClientes]    Script Date: 22/02/2024 09:20:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblClientes](
	[ClienteID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
	[ApPaterno] [nvarchar](max) NOT NULL,
	[ApMaterno] [nvarchar](max) NOT NULL,
	[RFC] [nvarchar](max) NOT NULL,
	[Direccion] [nvarchar](max) NOT NULL,
	[Telefono] [nvarchar](10) NOT NULL,
	[Correo] [nvarchar](max) NOT NULL,
	[Status] [bit] NOT NULL,
	[FechaAlta] [datetime] NULL,
	[Discriminator] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.TblClientes] PRIMARY KEY CLUSTERED 
(
	[ClienteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblCompras]    Script Date: 22/02/2024 09:20:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblCompras](
	[CompraID] [int] IDENTITY(1,1) NOT NULL,
	[ProveedorID] [int] NOT NULL,
	[Folio] [nvarchar](max) NULL,
	[FechaCompra] [datetime] NOT NULL,
	[TblProductoes_ProductoID] [int] NULL,
 CONSTRAINT [PK_dbo.TblCompras] PRIMARY KEY CLUSTERED 
(
	[CompraID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblDetalleCompras]    Script Date: 22/02/2024 09:20:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblDetalleCompras](
	[DetalleCompraID] [int] IDENTITY(1,1) NOT NULL,
	[CompraID] [int] NOT NULL,
	[ProductoID] [int] NOT NULL,
	[PrecioCompra] [float] NOT NULL,
	[SubTotal] [float] NOT NULL,
	[Stock] [int] NOT NULL,
 CONSTRAINT [PK_dbo.TblDetalleCompras] PRIMARY KEY CLUSTERED 
(
	[DetalleCompraID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblDetalleVentas]    Script Date: 22/02/2024 09:20:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblDetalleVentas](
	[DetalleVentaID] [int] IDENTITY(1,1) NOT NULL,
	[VentaID] [int] NOT NULL,
	[ProductoID] [int] NOT NULL,
	[PrecioUnitario] [float] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Total] [float] NOT NULL,
 CONSTRAINT [PK_dbo.TblDetalleVentas] PRIMARY KEY CLUSTERED 
(
	[DetalleVentaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblModoPagoes]    Script Date: 22/02/2024 09:20:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblModoPagoes](
	[ModoPagoID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.TblModoPagoes] PRIMARY KEY CLUSTERED 
(
	[ModoPagoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblProductoes]    Script Date: 22/02/2024 09:20:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblProductoes](
	[ProductoID] [int] IDENTITY(1,1) NOT NULL,
	[SKU] [nvarchar](15) NOT NULL,
	[Descripcion] [nvarchar](60) NOT NULL,
	[CategoriaID] [int] NOT NULL,
	[PrecioUnitario] [float] NOT NULL,
	[PrecioCompra] [float] NOT NULL,
	[Stock] [float] NOT NULL,
	[Status] [bit] NOT NULL,
	[Cantidad] [int] NULL,
	[Discriminator] [nvarchar](128) NOT NULL,
	[IMG] [varbinary](max) NULL,
 CONSTRAINT [PK_dbo.TblProductoes] PRIMARY KEY CLUSTERED 
(
	[ProductoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblProveedorProductoes]    Script Date: 22/02/2024 09:20:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblProveedorProductoes](
	[ProveedorProductoID] [int] IDENTITY(1,1) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[LastBuy] [datetime] NOT NULL,
	[ProveedorID] [int] NOT NULL,
	[ProductoID] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
 CONSTRAINT [PK_dbo.TblProveedorProductoes] PRIMARY KEY CLUSTERED 
(
	[ProveedorProductoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblProveedors]    Script Date: 22/02/2024 09:20:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblProveedors](
	[ProveedorID] [int] IDENTITY(1,1) NOT NULL,
	[RazonSocial] [nvarchar](max) NOT NULL,
	[RUC] [nvarchar](13) NOT NULL,
	[Marca] [nvarchar](max) NOT NULL,
	[Direccion] [nvarchar](max) NOT NULL,
	[Telefono] [nvarchar](10) NOT NULL,
	[Celular] [nvarchar](10) NOT NULL,
	[Representante] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[URL] [nvarchar](max) NULL,
	[FechaCompra] [datetime] NULL,
	[Discriminator] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.TblProveedors] PRIMARY KEY CLUSTERED 
(
	[ProveedorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblPurchases]    Script Date: 22/02/2024 09:20:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblPurchases](
	[PurchaseID] [int] IDENTITY(1,1) NOT NULL,
	[PurchaseProd] [nvarchar](max) NULL,
	[PurchaseCant] [nvarchar](max) NULL,
	[FechaCompra] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.TblPurchases] PRIMARY KEY CLUSTERED 
(
	[PurchaseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblVentas]    Script Date: 22/02/2024 09:20:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblVentas](
	[VentaID] [int] IDENTITY(1,1) NOT NULL,
	[ClienteID] [int] NOT NULL,
	[Folio] [nvarchar](max) NULL,
	[FechaAlta] [datetime] NOT NULL,
	[TblModoPago_ModoPagoID] [int] NULL,
	[SubTotal] [float] NOT NULL,
	[iva] [float] NOT NULL,
	[Total] [float] NOT NULL,
 CONSTRAINT [PK_dbo.TblVentas] PRIMARY KEY CLUSTERED 
(
	[VentaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 22/02/2024 09:20:36 p. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 22/02/2024 09:20:36 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 22/02/2024 09:20:36 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RoleId]    Script Date: 22/02/2024 09:20:36 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 22/02/2024 09:20:36 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 22/02/2024 09:20:36 p. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_MunicipioID]    Script Date: 22/02/2024 09:20:36 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_MunicipioID] ON [dbo].[Localidads]
(
	[MunicipioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_EstadoID]    Script Date: 22/02/2024 09:20:36 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_EstadoID] ON [dbo].[Municipios]
(
	[EstadoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProveedorID]    Script Date: 22/02/2024 09:20:36 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_ProveedorID] ON [dbo].[TblCompras]
(
	[ProveedorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TblProductoes_ProductoID]    Script Date: 22/02/2024 09:20:36 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_TblProductoes_ProductoID] ON [dbo].[TblCompras]
(
	[TblProductoes_ProductoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CompraID]    Script Date: 22/02/2024 09:20:36 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_CompraID] ON [dbo].[TblDetalleCompras]
(
	[CompraID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductoID]    Script Date: 22/02/2024 09:20:36 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_ProductoID] ON [dbo].[TblDetalleCompras]
(
	[ProductoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductoID]    Script Date: 22/02/2024 09:20:36 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_ProductoID] ON [dbo].[TblDetalleVentas]
(
	[ProductoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_VentaID]    Script Date: 22/02/2024 09:20:36 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_VentaID] ON [dbo].[TblDetalleVentas]
(
	[VentaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CategoriaID]    Script Date: 22/02/2024 09:20:36 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_CategoriaID] ON [dbo].[TblProductoes]
(
	[CategoriaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductoID]    Script Date: 22/02/2024 09:20:36 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_ProductoID] ON [dbo].[TblProveedorProductoes]
(
	[ProductoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProveedorID]    Script Date: 22/02/2024 09:20:36 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_ProveedorID] ON [dbo].[TblProveedorProductoes]
(
	[ProveedorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClienteID]    Script Date: 22/02/2024 09:20:36 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_ClienteID] ON [dbo].[TblVentas]
(
	[ClienteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TblModoPago_ModoPagoID]    Script Date: 22/02/2024 09:20:36 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_TblModoPago_ModoPagoID] ON [dbo].[TblVentas]
(
	[TblModoPago_ModoPagoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TblDetalleCompras] ADD  DEFAULT ((0)) FOR [Stock]
GO
ALTER TABLE [dbo].[TblDetalleVentas] ADD  DEFAULT ((0)) FOR [Total]
GO
ALTER TABLE [dbo].[TblProveedorProductoes] ADD  DEFAULT ((0)) FOR [cantidad]
GO
ALTER TABLE [dbo].[TblVentas] ADD  DEFAULT ((0)) FOR [SubTotal]
GO
ALTER TABLE [dbo].[TblVentas] ADD  DEFAULT ((0)) FOR [iva]
GO
ALTER TABLE [dbo].[TblVentas] ADD  DEFAULT ((0)) FOR [Total]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Localidads]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Localidads_dbo.Municipios_MunicipioID] FOREIGN KEY([MunicipioID])
REFERENCES [dbo].[Municipios] ([MunicipioID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Localidads] CHECK CONSTRAINT [FK_dbo.Localidads_dbo.Municipios_MunicipioID]
GO
ALTER TABLE [dbo].[Municipios]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Municipios_dbo.Estadoes_EstadoID] FOREIGN KEY([EstadoID])
REFERENCES [dbo].[Estadoes] ([EstadoID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Municipios] CHECK CONSTRAINT [FK_dbo.Municipios_dbo.Estadoes_EstadoID]
GO
ALTER TABLE [dbo].[TblCompras]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TblCompras_dbo.TblProductoes_TblProductoes_ProductoID] FOREIGN KEY([TblProductoes_ProductoID])
REFERENCES [dbo].[TblProductoes] ([ProductoID])
GO
ALTER TABLE [dbo].[TblCompras] CHECK CONSTRAINT [FK_dbo.TblCompras_dbo.TblProductoes_TblProductoes_ProductoID]
GO
ALTER TABLE [dbo].[TblCompras]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TblCompras_dbo.TblProveedors_ProveedorID] FOREIGN KEY([ProveedorID])
REFERENCES [dbo].[TblProveedors] ([ProveedorID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TblCompras] CHECK CONSTRAINT [FK_dbo.TblCompras_dbo.TblProveedors_ProveedorID]
GO
ALTER TABLE [dbo].[TblDetalleCompras]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TblDetalleCompras_dbo.TblCompras_CompraID] FOREIGN KEY([CompraID])
REFERENCES [dbo].[TblCompras] ([CompraID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TblDetalleCompras] CHECK CONSTRAINT [FK_dbo.TblDetalleCompras_dbo.TblCompras_CompraID]
GO
ALTER TABLE [dbo].[TblDetalleCompras]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TblDetalleCompras_dbo.TblProductoes_ProductoID] FOREIGN KEY([ProductoID])
REFERENCES [dbo].[TblProductoes] ([ProductoID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TblDetalleCompras] CHECK CONSTRAINT [FK_dbo.TblDetalleCompras_dbo.TblProductoes_ProductoID]
GO
ALTER TABLE [dbo].[TblDetalleVentas]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TblDetalleVentas_dbo.TblProductoes_ProductoID] FOREIGN KEY([ProductoID])
REFERENCES [dbo].[TblProductoes] ([ProductoID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TblDetalleVentas] CHECK CONSTRAINT [FK_dbo.TblDetalleVentas_dbo.TblProductoes_ProductoID]
GO
ALTER TABLE [dbo].[TblDetalleVentas]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TblDetalleVentas_dbo.TblVentas_VentaID] FOREIGN KEY([VentaID])
REFERENCES [dbo].[TblVentas] ([VentaID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TblDetalleVentas] CHECK CONSTRAINT [FK_dbo.TblDetalleVentas_dbo.TblVentas_VentaID]
GO
ALTER TABLE [dbo].[TblProductoes]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TblProductoes_dbo.TblCategorias_CategoriaID] FOREIGN KEY([CategoriaID])
REFERENCES [dbo].[TblCategorias] ([CategoriaID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TblProductoes] CHECK CONSTRAINT [FK_dbo.TblProductoes_dbo.TblCategorias_CategoriaID]
GO
ALTER TABLE [dbo].[TblProveedorProductoes]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TblProveedorProductoes_dbo.TblProductoes_ProductoID] FOREIGN KEY([ProductoID])
REFERENCES [dbo].[TblProductoes] ([ProductoID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TblProveedorProductoes] CHECK CONSTRAINT [FK_dbo.TblProveedorProductoes_dbo.TblProductoes_ProductoID]
GO
ALTER TABLE [dbo].[TblProveedorProductoes]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TblProveedorProductoes_dbo.TblProveedors_ProveedorID] FOREIGN KEY([ProveedorID])
REFERENCES [dbo].[TblProveedors] ([ProveedorID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TblProveedorProductoes] CHECK CONSTRAINT [FK_dbo.TblProveedorProductoes_dbo.TblProveedors_ProveedorID]
GO
ALTER TABLE [dbo].[TblVentas]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TblVentas_dbo.TblClientes_ClienteID] FOREIGN KEY([ClienteID])
REFERENCES [dbo].[TblClientes] ([ClienteID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TblVentas] CHECK CONSTRAINT [FK_dbo.TblVentas_dbo.TblClientes_ClienteID]
GO
ALTER TABLE [dbo].[TblVentas]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TblVentas_dbo.TblModoPagoes_TblModoPago_ModoPagoID] FOREIGN KEY([TblModoPago_ModoPagoID])
REFERENCES [dbo].[TblModoPagoes] ([ModoPagoID])
GO
ALTER TABLE [dbo].[TblVentas] CHECK CONSTRAINT [FK_dbo.TblVentas_dbo.TblModoPagoes_TblModoPago_ModoPagoID]
GO
USE [master]
GO
ALTER DATABASE [SmallSoft] SET  READ_WRITE 
GO
