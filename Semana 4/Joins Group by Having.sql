USE Northwind

--1 Mostrar la categoria del producto 
SELECT  P.ProductName, C.CategoryName FROM Products P 
INNER JOIN Categories C
ON P.CategoryID = C.CategoryID
order by C.CategoryName desc

--2 Realizar una consulta que muestre el nombre de contacto, la orden, 
--y datos entrega 

-- 3 Realizar una consulta que muestre los clientes (id, nombre compañia)
-- el numero de orden, y muestre el nombre del empleado que la atendio
