-- Crear la base de datos
CREATE DATABASE cineplas;

USE cineplas;

CREATE TABLE Reviews(
	comment NVARCHAR(MAX),
	date date,
	rating INT
);

-- Insertar registros de un archivo CSV
BULK INSERT Reviews
FROM 'C:\Users\HP\Documents\curso-ingenieria-de-datos\clase02-sql\sql-server\builk-insert-csv\cineplas_review_es.csv'
WITH (
	FORMAT = 'CSV', -- Formato
	CODEPAGE = '65001', -- UTF-8 para leer tildes y acentos
	FIRSTROW = 2, -- Leer desde la fila 2 del csv
	FIELDTERMINATOR = ',', -- Carácter separador
	ROWTERMINATOR = '\n', -- Final de cada fila
	TABLOCK -- Bloquea la tabla no puede leer ni escribir
)

SELECT * FROM Reviews

-- Por ejemplo le asignamos un campo id de cliente
ALTER TABLE Reviews
ADD customer_id INT IDENTITY(1,1);

SELECT * FROM Reviews