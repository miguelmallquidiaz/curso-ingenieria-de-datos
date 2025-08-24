CREATE DATABASE EcommerceTottus;

USE EcommerceTottus;

-- Creando tablas:
CREATE TABLE productos (
    id_prod INT PRIMARY KEY IDENTITY(1,1),
    cod_prod NVARCHAR(100),
    name NVARCHAR(100),
    existencia INT -- cantidad en stock
);

CREATE TABLE historial (
    fecha DATE DEFAULT GETDATE(),
    cod_prod NVARCHAR(100),
    descripcion NVARCHAR(200),
    usuario NVARCHAR(100)
);

CREATE TABLE ventas (
	cod_prod NVARCHAR(100),
	precio DECIMAL(3,2),
	cantidad INT
);

ALTER TABLE ventas
ALTER COLUMN precio DECIMAL(4,2);
	
-- Consultar

SELECT * FROM productos;
SELECT * FROM historial;

/*
1. Crear un trigger que al insertar un nuevo producto
se deba insertar en la tabla historial la info necesaria
*/
CREATE TRIGGER trg_Productos_Insert
ON productos
AFTER INSERT
AS
BEGIN
	declare @codProd varchar(4)
	SELECT @codProd = cod_prod
	FROM inserted -- Crear una tabla temporal que los registros nuevos

	INSERT INTO historial
	VALUES (GETDATE(), @codProd, 'Producto Insertado', SYSTEM_USER)
END
-- PRUEBA DE INSERTANDO UN REGISTRO
INSERT productos VALUES ('P1', 'Cargador', 180)

SELECT * FROM productos;
SELECT * FROM historial;

/*
2. Crear un trigger que al realizar una ventana se debe
actualizar el stock en la tabla productos.
*/

CREATE TRIGGER trg_Venta
ON ventas
AFTER INSERT
AS
BEGIN
	UPDATE b
	SET b.existencia = b.existencia - a.cantidad -- asignar un valor a una variable
	FROM inserted a INNER JOIN productos b
	ON (a.cod_prod = b.cod_prod)
END

-- prueba 2
INSERT INTO ventas VALUES ('P1', 30.0, 80)
SELECT * FROM ventas
SELECT * FROM productos