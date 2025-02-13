USE Northwind

--Mostrar la categoria del producto 
SELECT  P.ProductName, C.CategoryName FROM Products P 
INNER JOIN Categories C
ON P.CategoryID = C.CategoryID
order by C.CategoryName desc

--