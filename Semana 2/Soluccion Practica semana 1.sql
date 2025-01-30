 --1
 Use Northwind

 Select P.ProductName, C.CategoryName  from Products P 
 INNER JOIN Categories  C
 ON P.CategoryID = c.CategoryID

 Select O.OrderID, o.OrderDate,P.ProductName from Customers C
 INNER JOIN Orders O 
 ON C.CustomerID = O.CustomerID 
 INNER JOIN [Order Details] OD
 ON o.OrderID = OD.OrderID
 INNER JOIN Products P 
 ON OD.ProductID = P.ProductID
 where C.CustomerID='ALFKI'

 -- 6 

 Select * from Products
 Where ProductName Like '%Chai%'

