CREATE DATABASE DataEcommerce;
GO

USE DataEcommerce

-- Crear una nueva tabla
CREATE TABLE Customers (
	customer_id INT IDENTITY(1,1) PRIMARY KEY,
	fname NVARCHAR(100) NOT NULL,
	email NVARCHAR(100) UNIQUE NOT NULL,
	pwd NVARCHAR(255) NOT NULL
)

SELECT * FROM Customers

-- Agregar la columna lname a la entidad Customers 
ALTER TABLE Customers
ADD lname NVARCHAR(100) NOT NULL;

SELECT * FROM Customers

-- Modificar el valor de email a NVARCHAR 200
ALTER TABLE Customers
ALTER COLUMN email NVARCHAR(200);

SELECT * FROM Customers

-- Eliminar la columna lname creada anteriormente
ALTER TABLE Customers
DROP COLUMN lname

SELECT * FROM Customers

-- Insertar algunos registros
INSERT INTO Customers VALUES('Miguel', 'mallqui@gmail.com', '*********')

SELECT * FROM Customers

-- Eliminar los registro pero no la estructura
TRUNCATE TABLE Customers
SELECT * FROM Customers

-- Eliminar por completo la tabla
DROP TABLE Customers