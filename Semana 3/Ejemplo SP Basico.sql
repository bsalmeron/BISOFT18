USE[Northwind]  

CREATE PROCEDURE sp_consultaOrden
 @OrderID INT
AS
 BEGIN 
   Select * from Orders
   where OrderID = @OrderID 
 END

 EXEC  sp_consultaOrden 10248