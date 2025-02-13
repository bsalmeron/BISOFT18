USE Northwind

--1 Mostrar la categoria del producto 
SELECT  P.ProductName, C.CategoryName FROM Products P 
INNER JOIN Categories C
ON P.CategoryID = C.CategoryID
order by C.CategoryName desc

--2 Realizar una consulta que muestre el nombre de contacto, la orden, 
--y datos entrega 
SELECT C.ContactName,O.OrderID,O.ShipAddress,O.Freight,CONVERT(DATE,O.ShippedDate) 
DATE from Customers C
INNER JOIN ORDERS O 
ON C.CustomerID = O.CustomerID

-- 3 Realizar una consulta que muestre los clientes (id, nombre compañia)
-- el numero de orden, y muestre el nombre del empleado que la atendio
SELECT C.CUSTOMERID,C.CompanyName,O.OrderID,CONCAT(E.FirstName,' ',E.LastName)
NAME FROM CUSTOMERS C
INNER JOIN ORDERS O
ON C.CustomerID = O.CustomerID
INNER JOIN EMPLOYEES E 
ON O.EmployeeID = E.EmployeeID
ORDER BY C.CustomerID

/* 4 Obtener todos los clientes y sus pedidos (incluyendo clientes sin pedidos)*/
SELECT C.CustomerID, C.CompanyName, O.OrderID, O.OrderDate
FROM Customers C
LEFT JOIN Orders O ON C.CustomerID = O.CustomerID

/* 5 Mostrar todos los empleados y los territorios donde 
 trabajan (incluyendo empleados sin territorio)*/
SELECT E.EmployeeID, E.FirstName, E.LastName, T.TerritoryDescription
FROM Employees E
LEFT JOIN EmployeeTerritories ET ON E.EmployeeID = ET.EmployeeID
LEFT JOIN Territories T ON ET.TerritoryID = T.TerritoryID

/*Contar los pedidos por cliente (incluyendo clientes sin pedidos)*/

SELECT C.CustomerID, C.CompanyName, COUNT(o.OrderID) cantidadOrdenes --, O.OrderID, O.OrderDate
FROM Customers C
LEFT JOIN Orders O ON C.CustomerID = O.CustomerID
Group by C.CustomerID, C.CompanyName
Having COUNT(o.OrderID)>15
order by COUNT(o.OrderID) desc


---Ejemplo group by 

Select   C.CategoryName, COUNT(p.ProductID)cantidadProductos from Categories C 
INNER JOIN Products P on C.CategoryID = P.CategoryID
GROUP BY  C.CategoryName
Having COUNT(p.ProductID)>10
Order by COUNT(p.ProductID) desc


--Funciones de agregacion 
--Funciones creadas por el usuario (escalares y tabla)


--Vistas

Create View Vista_Reporte_Productos AS
Select   C.CategoryName, COUNT(p.ProductID)cantidadProductos from Categories C 
INNER JOIN Products P on C.CategoryID = P.CategoryID
GROUP BY  C.CategoryName
Having COUNT(p.ProductID)>10
  

Select * from [dbo].[Vista_Reporte_Productos]
order by cantidadProductos desc