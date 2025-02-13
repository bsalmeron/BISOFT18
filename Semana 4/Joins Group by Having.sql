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