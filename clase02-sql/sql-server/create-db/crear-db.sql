USE master
GO
IF EXISTS(
    SELECT name
    FROM sysdatabases
    WHERE name = 'oti'
)
DROP DATABASE [oti]
GO
CREATE DATABASE [oti]
ON PRIMARY
(
    NAME = N'empresa_dat',
    FILENAME = N'C:\db\oti_dat.mdf',
    SIZE = 30720KB,
    MAXSIZE = 51200KB,
    FILEGROWTH = 10240KB
)
LOG ON
(
    NAME = N'empresa_log',
    FILENAME = N'C:\db\oti_log.ldf',
    SIZE = 10240KB,
    FILEGROWTH = 10240kb
)