USE [master]
GO
/****** Object:  Database [UserRegDB]    Script Date: 12-Mar-19 10:57:14 AM ******/
CREATE DATABASE [UserRegDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UserRegDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\UserRegDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'UserRegDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\UserRegDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [UserRegDB] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UserRegDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UserRegDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UserRegDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UserRegDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UserRegDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UserRegDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [UserRegDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UserRegDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UserRegDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UserRegDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UserRegDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UserRegDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UserRegDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UserRegDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UserRegDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UserRegDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UserRegDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UserRegDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UserRegDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UserRegDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UserRegDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UserRegDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UserRegDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UserRegDB] SET RECOVERY FULL 
GO
ALTER DATABASE [UserRegDB] SET  MULTI_USER 
GO
ALTER DATABASE [UserRegDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UserRegDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UserRegDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UserRegDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [UserRegDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [UserRegDB] SET QUERY_STORE = OFF
GO
USE [UserRegDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [UserRegDB]
GO
/****** Object:  Table [dbo].[CityTable]    Script Date: 12-Mar-19 10:57:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CityTable](
	[CityId] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [varchar](50) NULL,
	[CountryId] [int] NULL,
 CONSTRAINT [PK_CityTable] PRIMARY KEY CLUSTERED 
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CountryTable]    Script Date: 12-Mar-19 10:57:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CountryTable](
	[CountryId] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [varchar](50) NULL,
 CONSTRAINT [PK_CountryTable] PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTable]    Script Date: 12-Mar-19 10:57:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTable](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[DoB] [varchar](50) NULL,
	[CountryId] [int] NULL,
	[CityId] [int] NULL,
 CONSTRAINT [PK_UserTable] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CityTable] ON 
GO
INSERT [dbo].[CityTable] ([CityId], [CityName], [CountryId]) VALUES (1, N'Dhaka', 1)
GO
INSERT [dbo].[CityTable] ([CityId], [CityName], [CountryId]) VALUES (2, N'Khulna', 1)
GO
INSERT [dbo].[CityTable] ([CityId], [CityName], [CountryId]) VALUES (3, N'Satkhira', 1)
GO
INSERT [dbo].[CityTable] ([CityId], [CityName], [CountryId]) VALUES (4, N'Florida', 2)
GO
INSERT [dbo].[CityTable] ([CityId], [CityName], [CountryId]) VALUES (5, N'Washington DC', 2)
GO
INSERT [dbo].[CityTable] ([CityId], [CityName], [CountryId]) VALUES (6, N'New Jersy', 2)
GO
INSERT [dbo].[CityTable] ([CityId], [CityName], [CountryId]) VALUES (7, N'California', 2)
GO
SET IDENTITY_INSERT [dbo].[CityTable] OFF
GO
SET IDENTITY_INSERT [dbo].[CountryTable] ON 
GO
INSERT [dbo].[CountryTable] ([CountryId], [CountryName]) VALUES (1, N'Bangladesh')
GO
INSERT [dbo].[CountryTable] ([CountryId], [CountryName]) VALUES (2, N'USA')
GO
SET IDENTITY_INSERT [dbo].[CountryTable] OFF
GO
SET IDENTITY_INSERT [dbo].[UserTable] ON 
GO
INSERT [dbo].[UserTable] ([UserId], [UserName], [Password], [Email], [DoB], [CountryId], [CityId]) VALUES (10, N'P M Toufiqur Rahman Chanchal', N'1234', N'c@mail.com', N'2018-10-24', 2, 6)
GO
INSERT [dbo].[UserTable] ([UserId], [UserName], [Password], [Email], [DoB], [CountryId], [CityId]) VALUES (16, N'Belal', N'1234', N'b@mail.com', N'2018-10-24', 1, 1)
GO
INSERT [dbo].[UserTable] ([UserId], [UserName], [Password], [Email], [DoB], [CountryId], [CityId]) VALUES (17, N'Belal', N'1234', N's@m.com', N'2018-10-17', 1, 2)
GO
INSERT [dbo].[UserTable] ([UserId], [UserName], [Password], [Email], [DoB], [CountryId], [CityId]) VALUES (18, N'Belal', N'1234', N's@m.com', N'2018-10-17', 2, 4)
GO
INSERT [dbo].[UserTable] ([UserId], [UserName], [Password], [Email], [DoB], [CountryId], [CityId]) VALUES (19, N'Belal', N'1234', N'b@mail.com', N'2018-10-10', 1, 2)
GO
INSERT [dbo].[UserTable] ([UserId], [UserName], [Password], [Email], [DoB], [CountryId], [CityId]) VALUES (20, N'Belal', N'1234', N'b@mail.com', N'2018-10-17', 1, 1)
GO
INSERT [dbo].[UserTable] ([UserId], [UserName], [Password], [Email], [DoB], [CountryId], [CityId]) VALUES (21, N'Belal', N'1234', N'b@mail.com', N'2018-10-17', 1, 1)
GO
INSERT [dbo].[UserTable] ([UserId], [UserName], [Password], [Email], [DoB], [CountryId], [CityId]) VALUES (22, N'Belal', N'1234', N'b@mail.com', N'2018-10-17', 1, 1)
GO
INSERT [dbo].[UserTable] ([UserId], [UserName], [Password], [Email], [DoB], [CountryId], [CityId]) VALUES (23, N'Belal', N'1234', N'b@mail.com', N'2018-10-24', 1, 3)
GO
INSERT [dbo].[UserTable] ([UserId], [UserName], [Password], [Email], [DoB], [CountryId], [CityId]) VALUES (24, N'Belal', N'1234', N'asdf@asdf.com', N'2018-10-24', 1, 2)
GO
INSERT [dbo].[UserTable] ([UserId], [UserName], [Password], [Email], [DoB], [CountryId], [CityId]) VALUES (25, N'Belal', N'1234', N'asdf@asdf.com', N'2018-10-24', 1, 2)
GO
INSERT [dbo].[UserTable] ([UserId], [UserName], [Password], [Email], [DoB], [CountryId], [CityId]) VALUES (26, N'Belal', N'1234', N'asdf@asdf.com', N'2018-10-24', 1, 2)
GO
INSERT [dbo].[UserTable] ([UserId], [UserName], [Password], [Email], [DoB], [CountryId], [CityId]) VALUES (27, N'Belal', N'1234', N'asdf@asdf.com', N'2018-10-24', 1, 2)
GO
INSERT [dbo].[UserTable] ([UserId], [UserName], [Password], [Email], [DoB], [CountryId], [CityId]) VALUES (28, N'Belal', N'1234', N'b@mail.com', N'2018-10-12', 1, 1)
GO
INSERT [dbo].[UserTable] ([UserId], [UserName], [Password], [Email], [DoB], [CountryId], [CityId]) VALUES (29, N'Belal', N'1234', N'b@mail.com', N'2018-10-12', 1, 1)
GO
INSERT [dbo].[UserTable] ([UserId], [UserName], [Password], [Email], [DoB], [CountryId], [CityId]) VALUES (30, N'fdgdf', N'dfgd', N'b@mail.com', N'2018-10-24', 2, 4)
GO
INSERT [dbo].[UserTable] ([UserId], [UserName], [Password], [Email], [DoB], [CountryId], [CityId]) VALUES (33, N'test edited', N'test', N'test@tst.com', N'2019-03-12', 1, 2)
GO
SET IDENTITY_INSERT [dbo].[UserTable] OFF
GO
ALTER TABLE [dbo].[CityTable]  WITH CHECK ADD  CONSTRAINT [FK_CityTable_CountryTable] FOREIGN KEY([CountryId])
REFERENCES [dbo].[CountryTable] ([CountryId])
GO
ALTER TABLE [dbo].[CityTable] CHECK CONSTRAINT [FK_CityTable_CountryTable]
GO
ALTER TABLE [dbo].[UserTable]  WITH CHECK ADD  CONSTRAINT [FK_UserTable_CountryTable] FOREIGN KEY([CountryId])
REFERENCES [dbo].[CountryTable] ([CountryId])
GO
ALTER TABLE [dbo].[UserTable] CHECK CONSTRAINT [FK_UserTable_CountryTable]
GO
/****** Object:  StoredProcedure [dbo].[CREATE_SP]    Script Date: 12-Mar-19 10:57:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--EXEC CREATE_SP 'Inv_FabricRollMaster','RollMasterID'
CREATE PROCEDURE [dbo].[CREATE_SP]
	--DECLARE @TableName VARCHAR(50)='Product',@PrimaryColumnName VARCHAR(150)='ProductID'
	@TableName VARCHAR(200)='',
	@PrimaryColumnName VARCHAR(150)=''

AS

CREATE TABLE #tablColumn(ID INT IDENTITY, ColName VARCHAR(50),ColType VARCHAR(50),ColLen VARCHAR(50))

INSERT INTO #tablColumn
SELECT COLUMN_NAME,DATA_TYPE,
CASE WHEN UPPER(DATA_TYPE) IN('NUMERIC','DECIMAL') THEN CAST(NUMERIC_PRECISION AS VARCHAR(50))+','+ CAST(NUMERIC_SCALE AS VARCHAR(50))
ELSE CAST(CHARACTER_MAXIMUM_LENGTH AS VARCHAR(50)) END CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = @TableName

SET NOCOUNT ON

DECLARE @NewLineChar AS CHAR(2) = CHAR(13) + CHAR(10)
DECLARE @ID INT = 1, @COUNT INT,@ColName VARCHAR(50)='',@ColType VARCHAR(50)='',@ColLen VARCHAR(50) = 0,
@DeclareSection VARCHAR(MAX)='',
@SaveSection VARCHAR(MAX)='',
@UpdateSection VARCHAR(MAX)='',
@LoadAllSection VARCHAR(MAX)='',
@LoadSelectedSection VARCHAR(MAX)='',
@DeleteSelectedSection VARCHAR(MAX)='',
@ColumnNames VARCHAR(MAX),
@SaveColumnNames VARCHAR(MAX),
@UpdateColumnNames VARCHAR(MAX),
@VariableNames VARCHAR(MAX),
@SaveVariableNames  VARCHAR(MAX)

SELECT @ColumnNames = COALESCE(@ColumnNames + ', ', '') + ColName,@VariableNames = COALESCE(@VariableNames + ', ', '') +'@'+ColName
FROM #tablColumn
WHERE ColName NOT IN ('AddedBy','DateAdded','UpdatedBy','DateUpdated')

SELECT @SaveColumnNames = COALESCE(@SaveColumnNames + ',', '') + ColName,@SaveVariableNames = COALESCE(@SaveVariableNames + ', ', '') +'@'+ColName
FROM #tablColumn
WHERE ColName NOT IN ('AddedBy','DateAdded','UpdatedBy','DateUpdated')
AND ColName <> @PrimaryColumnName

SET @COUNT = (SELECT COUNT(*) FROM #tablColumn)
SET @DeclareSection += 'CREATE PROCEDURE SP_SET_'+UPPER(@TableName)+@NewLineChar+'@QryOption AS INT = -1,'+@NewLineChar
SET @SaveSection = 'IF @QryOption = @SAVE_DATA'+@NewLineChar+
					'BEGIN'+@NewLineChar+
					'	INSERT INTO '+@TableName+'('+@SaveColumnNames+',AddedBy,DateAdded) VALUES('+@SaveVariableNames+',@AddedBy,GETDATE())'+@NewLineChar+
					'END'+@NewLineChar

SELECT @UpdateColumnNames = COALESCE(@UpdateColumnNames + ', ', '') + ColName+' = @'+ColName
FROM #tablColumn
WHERE ColName NOT IN ('AddedBy','DateAdded','UpdatedBy','DateUpdated') AND ColName <> @PrimaryColumnName

SET @UpdateSection = 'ELSE IF @QryOption = @UPDATE_DATA'+@NewLineChar+
					 'BEGIN'+@NewLineChar+
					 '	UPDATE '+@TableName + ' SET '+ @UpdateColumnNames+', UpdatedBy=@AddedBy, DateUpdated = GETDATE()'+@NewLineChar+
					 '	WHERE '+@PrimaryColumnName +' = @'+@PrimaryColumnName+@NewLineChar+
					 'END'+@NewLineChar

SET @LoadAllSection = 'ELSE IF @QryOption = @LOAD_ALL_DATA'+@NewLineChar+
					 'BEGIN'+@NewLineChar+
					 '	SELECT '+@ColumnNames+@NewLineChar+
					 '	FROM '+@TableName+@NewLineChar+
					 'END'+@NewLineChar

SET @LoadSelectedSection = 'ELSE IF @QryOption = @LOAD_SELECTED_DATA'+@NewLineChar+
					 'BEGIN'+@NewLineChar+
					 '	SELECT '+@ColumnNames+@NewLineChar+
					 '	FROM '+@TableName+@NewLineChar+
					 '	WHERE '+@PrimaryColumnName +' = @'+@PrimaryColumnName+@NewLineChar+
					 'END'+@NewLineChar

SET @DeleteSelectedSection = 'ELSE IF @QryOption = @DELETE_DATA'+@NewLineChar+
					 'BEGIN'+@NewLineChar+					 
					 '	DELETE	FROM '+@TableName+@NewLineChar+
					 '	WHERE '+@PrimaryColumnName +' = @'+@PrimaryColumnName+@NewLineChar+
					 'END'+@NewLineChar

WHILE @ID <= @COUNT
BEGIN
	SELECT @ColName = ColName,@ColType = ColType,@ColLen = ColLen FROM #tablColumn WHERE ID = @ID
	
	IF UPPER(@ColType) = 'INT' AND @ColName NOT IN ('AddedBy','DateAdded','UpdatedBy','DateUpdated')
	BEGIN
		SET @DeclareSection += '@'+@ColName +' INT = -1,'+@NewLineChar
	END
	ELSE IF UPPER(@ColType) = 'VARCHAR' AND @ColName NOT IN ('AddedBy','DateAdded','UpdatedBy','DateUpdated')
	BEGIN
		SET @DeclareSection += '@'+@ColName +' VARCHAR('+@ColLen+') = '''','+@NewLineChar
	END
	ELSE IF UPPER(@ColType) = 'BIT' AND @ColName NOT IN ('AddedBy','DateAdded','UpdatedBy','DateUpdated')
	BEGIN
		SET @DeclareSection += '@'+@ColName +' BIT = 0,'+@NewLineChar
	END
	ELSE IF UPPER(@ColType) = 'DECIMAL' AND @ColName NOT IN ('AddedBy','DateAdded','UpdatedBy','DateUpdated')
	BEGIN
		SET @DeclareSection += '@'+@ColName +' DECIMAL('+@ColLen+') = 0.00,'+@NewLineChar
	END
	ELSE IF UPPER(@ColType) = 'NUMERIC' AND @ColName NOT IN ('AddedBy','DateAdded','UpdatedBy','DateUpdated')
	BEGIN
		SET @DeclareSection += '@'+@ColName +' NUMERIC('+@ColLen+') = 0.00,'+@NewLineChar
	END
	ELSE IF UPPER(@ColType) = 'NVARCHAR' AND @ColName NOT IN ('AddedBy','DateAdded','UpdatedBy','DateUpdated')
	BEGIN
		SET @DeclareSection += '@'+@ColName +' NVARCHAR('+@ColLen+') = '''','+@NewLineChar
	END
	ELSE IF UPPER(@ColType) ='DATE' AND @ColName NOT IN ('AddedBy','DateAdded','UpdatedBy','DateUpdated')
	BEGIN
		SET @DeclareSection += '@'+@ColName +' DATE = ''1/1/1900'','+@NewLineChar
	END
	ELSE IF UPPER(@ColType) = 'DATETIME' AND @ColName NOT IN ('AddedBy','DateAdded','UpdatedBy','DateUpdated')
	BEGIN
		SET @DeclareSection += '@'+@ColName +' DATETIME = ''1/1/1900'','+@NewLineChar
	END
	ELSE IF UPPER(@ColType) = 'BIGINT' AND @ColName NOT IN ('AddedBy','DateAdded','UpdatedBy','DateUpdated')
	BEGIN
		SET @DeclareSection += '@'+@ColName +' BIGINT = -1,'+@NewLineChar
	END

	SET @ID += 1
END

SET @DeclareSection += '@AddedBy VARCHAR(50) = '''''+@NewLineChar

SET @DeclareSection +='AS'+@NewLineChar+@NewLineChar+'DECLARE @SAVE_DATA INT = -1,
@UPDATE_DATA INT = -1,
@LOAD_ALL_DATA INT = -1,
@LOAD_SELECTED_DATA INT = -1,
@DELETE_DATA INT = -1

SET @SAVE_DATA = 1
SET @UPDATE_DATA=2
SET @LOAD_ALL_DATA=3
SET @LOAD_SELECTED_DATA=4
SET @DELETE_DATA=5'+@NewLineChar+@NewLineChar

PRINT @DeclareSection
PRINT @SaveSection
PRINT @UpdateSection
PRINT @LoadAllSection
PRINT @LoadSelectedSection
PRINT @DeleteSelectedSection

DROP TABLE #tablColumn
GO
/****** Object:  StoredProcedure [dbo].[SP_SET_USERTABLE]    Script Date: 12-Mar-19 10:57:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SP_SET_USERTABLE]
@QryOption AS INT = -1,
@UserId INT = -1,
@UserName VARCHAR(50) = '',
@Password VARCHAR(50) = '',
@Email VARCHAR(50) = '',
@DoB VARCHAR(50) = '',
@CountryId INT = -1,
@CityId INT = -1,
@AddedBy VARCHAR(50) = ''
AS

DECLARE @SAVE_DATA INT = -1,
@UPDATE_DATA INT = -1,
@LOAD_ALL_DATA INT = -1,
@LOAD_SELECTED_DATA INT = -1,
@DELETE_DATA INT = -1

SET @SAVE_DATA = 1
SET @UPDATE_DATA=2
SET @LOAD_ALL_DATA=3
SET @LOAD_SELECTED_DATA=4
SET @DELETE_DATA=5

IF @QryOption = @SAVE_DATA
BEGIN
	INSERT INTO UserTable(UserName,Password,Email,DoB,CountryId,CityId) 
	VALUES(@UserName, @Password, @Email, @DoB, @CountryId, @CityId)
END
ELSE IF @QryOption = @UPDATE_DATA
BEGIN
	UPDATE UserTable SET UserName = @UserName, Password = @Password, Email = @Email, DoB = @DoB, 
	CountryId = @CountryId, CityId = @CityId
	WHERE UserId = @UserId
END
ELSE IF @QryOption = @LOAD_ALL_DATA
BEGIN
	SELECT UserId, UserName, Password, Email, DoB, CountryId, CityId
	FROM UserTable
END
ELSE IF @QryOption = @LOAD_SELECTED_DATA
BEGIN
	SELECT UserId, UserName, Password, Email, DoB, CountryId, CityId
	FROM UserTable
	WHERE UserId = @UserId
END
ELSE IF @QryOption = @DELETE_DATA
BEGIN
	DELETE	FROM UserTable
	WHERE UserId = @UserId
END
GO
USE [master]
GO
ALTER DATABASE [UserRegDB] SET  READ_WRITE 
GO
