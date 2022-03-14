USE [master]
GO
/****** Object:  Database [Criptocatamarca]    Script Date: 14/03/2022 20:22:14 ******/
CREATE DATABASE [Criptocatamarca]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Criptocatamarca', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Criptocatamarca.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Criptocatamarca_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Criptocatamarca_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Criptocatamarca] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Criptocatamarca].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Criptocatamarca] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Criptocatamarca] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Criptocatamarca] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Criptocatamarca] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Criptocatamarca] SET ARITHABORT OFF 
GO
ALTER DATABASE [Criptocatamarca] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Criptocatamarca] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Criptocatamarca] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Criptocatamarca] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Criptocatamarca] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Criptocatamarca] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Criptocatamarca] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Criptocatamarca] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Criptocatamarca] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Criptocatamarca] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Criptocatamarca] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Criptocatamarca] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Criptocatamarca] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Criptocatamarca] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Criptocatamarca] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Criptocatamarca] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Criptocatamarca] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Criptocatamarca] SET RECOVERY FULL 
GO
ALTER DATABASE [Criptocatamarca] SET  MULTI_USER 
GO
ALTER DATABASE [Criptocatamarca] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Criptocatamarca] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Criptocatamarca] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Criptocatamarca] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Criptocatamarca] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Criptocatamarca] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Criptocatamarca', N'ON'
GO
ALTER DATABASE [Criptocatamarca] SET QUERY_STORE = OFF
GO
USE [Criptocatamarca]
GO
/****** Object:  Table [dbo].[Cuenta]    Script Date: 14/03/2022 20:22:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cuenta](
	[idCuenta] [bigint] IDENTITY(1,1) NOT NULL,
	[idUsuario] [bigint] NOT NULL,
	[idMoneda] [int] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[estado] [int] NOT NULL,
 CONSTRAINT [PK_Cuenta] PRIMARY KEY CLUSTERED 
(
	[idCuenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Moneda]    Script Date: 14/03/2022 20:22:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Moneda](
	[idMoneda] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](3) NOT NULL,
	[descripcion] [varchar](40) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[estado] [varchar](1) NOT NULL,
 CONSTRAINT [PK_Moneda] PRIMARY KEY CLUSTERED 
(
	[idMoneda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movimientos]    Script Date: 14/03/2022 20:22:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movimientos](
	[idMov] [bigint] IDENTITY(1,1) NOT NULL,
	[idCuenta] [bigint] NOT NULL,
	[cbu] [varchar](30) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[tipo] [varchar](1) NOT NULL,
	[importe] [decimal](10, 2) NOT NULL,
	[estado] [varchar](1) NOT NULL,
 CONSTRAINT [PK_Movimientos] PRIMARY KEY CLUSTERED 
(
	[idMov] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Operaciones]    Script Date: 14/03/2022 20:22:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Operaciones](
	[idOperacion] [bigint] IDENTITY(1,1) NOT NULL,
	[idCuenta] [bigint] NOT NULL,
	[tipo] [varchar](1) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[cotizacion] [decimal](20, 6) NOT NULL,
	[impoOrigen] [decimal](20, 6) NOT NULL,
	[idMonedaOrigen] [int] NOT NULL,
	[impoDestino] [decimal](20, 6) NOT NULL,
	[idMonedaDest] [int] NOT NULL,
	[estado] [varchar](1) NOT NULL,
	[nip] [bigint] NOT NULL,
 CONSTRAINT [PK_Operaciones] PRIMARY KEY CLUSTERED 
(
	[idOperacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provincia]    Script Date: 14/03/2022 20:22:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provincia](
	[idProvincia] [int] NOT NULL,
	[nombre] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Provincia] PRIMARY KEY CLUSTERED 
(
	[idProvincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoMovimiento]    Script Date: 14/03/2022 20:22:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoMovimiento](
	[idMovimiento] [bigint] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](30) NOT NULL,
 CONSTRAINT [PK_TipoMovimiento] PRIMARY KEY CLUSTERED 
(
	[idMovimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 14/03/2022 20:22:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[idUsuario] [bigint] IDENTITY(1,1) NOT NULL,
	[cuil] [varchar](11) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[fnac] [date] NOT NULL,
	[domicilio] [varchar](40) NOT NULL,
	[idProvincia] [int] NOT NULL,
	[pais] [varchar](50) NOT NULL,
	[tipo] [varchar](1) NOT NULL,
	[estado] [varchar](1) NOT NULL,
	[fechaAlta] [datetime] NOT NULL,
	[cbu] [varchar](40) NOT NULL,
	[Banco] [varchar](40) NOT NULL,
	[dniFrente] [varchar](50) NOT NULL,
	[dniDorso] [varchar](50) NOT NULL,
	[pass] [varchar](200) NOT NULL,
	[mail] [varchar](100) NOT NULL,
	[telefono] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cuenta]  WITH CHECK ADD  CONSTRAINT [FK_Cuenta_Moneda] FOREIGN KEY([idMoneda])
REFERENCES [dbo].[Moneda] ([idMoneda])
GO
ALTER TABLE [dbo].[Cuenta] CHECK CONSTRAINT [FK_Cuenta_Moneda]
GO
ALTER TABLE [dbo].[Cuenta]  WITH CHECK ADD  CONSTRAINT [FK_Cuenta_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[Cuenta] CHECK CONSTRAINT [FK_Cuenta_Usuario]
GO
ALTER TABLE [dbo].[Movimientos]  WITH CHECK ADD  CONSTRAINT [FK_Movimientos_Cuenta] FOREIGN KEY([idCuenta])
REFERENCES [dbo].[Cuenta] ([idCuenta])
GO
ALTER TABLE [dbo].[Movimientos] CHECK CONSTRAINT [FK_Movimientos_Cuenta]
GO
ALTER TABLE [dbo].[Movimientos]  WITH CHECK ADD  CONSTRAINT [FK_Movimientos_TipoMovimiento] FOREIGN KEY([idMov])
REFERENCES [dbo].[TipoMovimiento] ([idMovimiento])
GO
ALTER TABLE [dbo].[Movimientos] CHECK CONSTRAINT [FK_Movimientos_TipoMovimiento]
GO
ALTER TABLE [dbo].[Operaciones]  WITH CHECK ADD  CONSTRAINT [FK_Operaciones_Cuenta] FOREIGN KEY([idCuenta])
REFERENCES [dbo].[Cuenta] ([idCuenta])
GO
ALTER TABLE [dbo].[Operaciones] CHECK CONSTRAINT [FK_Operaciones_Cuenta]
GO
ALTER TABLE [dbo].[Operaciones]  WITH CHECK ADD  CONSTRAINT [FK_Operaciones_Moneda] FOREIGN KEY([idMonedaOrigen])
REFERENCES [dbo].[Moneda] ([idMoneda])
GO
ALTER TABLE [dbo].[Operaciones] CHECK CONSTRAINT [FK_Operaciones_Moneda]
GO
ALTER TABLE [dbo].[Operaciones]  WITH CHECK ADD  CONSTRAINT [FK_Operaciones_Moneda1] FOREIGN KEY([idMonedaDest])
REFERENCES [dbo].[Moneda] ([idMoneda])
GO
ALTER TABLE [dbo].[Operaciones] CHECK CONSTRAINT [FK_Operaciones_Moneda1]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Provincia] FOREIGN KEY([idProvincia])
REFERENCES [dbo].[Provincia] ([idProvincia])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Provincia]
GO
/****** Object:  StoredProcedure [dbo].[insertarPersona]    Script Date: 14/03/2022 20:22:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Horacio Hernandez>
-- Create date: <Create Date,,10/03/2022>
-- Description:	<Description,,Insertar Usuarios>
-- =============================================
CREATE PROCEDURE [dbo].[insertarPersona] 
	@cuil varchar(11),
	@nombre varchar(50),
	@fnac date,
	@domicilio varchar(40),
    @idProvincia int,
    @pais varchar(50),
    @tipo varchar(1),
    @estado varchar(1),
    @fechaAlta date,
    @cbu varchar(40),
    @Banco varchar(40),
    @dniFrente varchar(50),
    @dniDorso varchar(50),
    @pass varchar(200),
    @mail varchar(100),
    @telefono varchar(30)
AS
BEGIN
	INSERT INTO [dbo].[Usuario]
           ([cuil]
           ,[nombre]
           ,[fnac]
		   ,[domicilio]
		   ,[idProvincia]
		   ,[pais]
		   ,[tipo]
		   ,[estado]
		   ,[fechaAlta]
		   ,[cbu]
		   ,[Banco]
		   ,[dniFrente]
		   ,[dniDorso]
		   ,[pass]
		   ,[mail]
		   ,[telefono])           
     VALUES
           (@cuil,
           @nombre,
           @fnac,
		   @domicilio,
           @idProvincia,
           @pais,
           @tipo,
           @estado,
           @fechaAlta,
           @cbu,
           @Banco,
           @dniFrente,
           @dniDorso,
           @pass,
           @mail,
           @telefono)           
END
GO
/****** Object:  StoredProcedure [dbo].[listarPersonasPorCuil]    Script Date: 14/03/2022 20:22:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Horacio Hernández>
-- Create date: <Create Date,, 10/03/2022>
-- Description:	<Description,,Listado de Personas>
-- =============================================
CREATE PROCEDURE [dbo].[listarPersonasPorCuil] 
	--@cuil varchar(11)
AS
BEGIN
	SET NOCOUNT ON;

    SELECT idUsuario, cuil, nombre, fnac
	FROM Usuario
	--WHERE cuil = @cuil	
END
GO
USE [master]
GO
ALTER DATABASE [Criptocatamarca] SET  READ_WRITE 
GO
