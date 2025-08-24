USE AdventureWorks2022

-- Totalizar las ventas de los clientes

-- Con funciones de agregación
SELECT
	SalesOrderID,
	COUNT(SalesOrderDetailID) AS CantProductosUnicos,
	SUM(LineTotal) AS MontoTotal
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID

-- Con funciones de ventana
SELECT
	SalesOrderID,
	SalesOrderDetailID,
	LineTotal,
	SUM(LineTotal) OVER(PARTITION BY SalesOrderID ORDER BY SalesOrderID) AS MontoTotal
FROM Sales.SalesOrderDetail

-- Ahora quiero una sumarización de Line Total
SELECT
	SalesOrderID,
	SalesOrderDetailID,
	LineTotal,
	SUM(LineTotal) OVER(PARTITION BY SalesOrderID ORDER BY SalesOrderID) AS MontoTotal,
	SUM(LineTotal) OVER(ORDER BY SalesOrderDetailID) AS TotalAcumulado
FROM Sales.SalesOrderDetail

-- Mostrar la primera dirección de estas personas por cada cliente ya que algunos tienen 2 direcciones.
SELECT *
FROM Person.BusinessEntityAddress
WHERE 
BusinessEntityID IN (
	472, 616, 932, 1028, 1126, 1170, 1204, 1330
)

-- PASOS: Primero crear un contador y solamente filtrar lo que tiene el primer valor.
-- Subconsulta

SELECT *
FROM 
(
	SELECT
	ROW_NUMBER() OVER(PARTITION BY BusinessEntityID ORDER BY BusinessEntityID) AS ItemPorPersona,
	*
	FROM Person.BusinessEntityAddress
	WHERE 
	BusinessEntityID IN (
		472, 616, 932, 1028, 1126, 1170, 1204, 1330
	)
) AS SubConsulta
WHERE SubConsulta.ItemPorPersona = 1