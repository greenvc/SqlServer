--ʹ�����崴�����ݿ�

-- =============================================
-- �������ݿ�������ļ�   ����־�ļ�
-- =============================================
IF EXISTS (SELECT * 
	   FROM   master..sysdatabases 
	   WHERE  name = N'SUN')
	DROP DATABASE SUN
GO

CREATE DATABASE SUN
ON PRIMARY 
	( NAME = SUN1_data,
          FILENAME = N'e:\database\SUN1_data.mdf',
          SIZE = 10MB,
          MAXSIZE = 200MB,
          FILEGROWTH = 10%),

	( NAME = SUN2_data,
	  FILENAME = N'e:\database\SUN2_data.ndf',
          SIZE = 10MB,
          MAXSIZE = 200MB,
          FILEGROWTH = 10%)

LOG ON 
	( NAME = SUN_log,
	  FILENAME = N'e:\database\SUN_log.ldf',
          SIZE = 10240KB,
          MAXSIZE = 200MB,
          FILEGROWTH = 10%),
	
	( NAME = SUN1_log,
	  FILENAME = N'e:\database\SUN1_log.ldf',
          SIZE = 10240KB,
          MAXSIZE = 200MB,
          FILEGROWTH = 10%)
GO