--Exitoso

DECLARE @OrderDetailID INT, @ProductName NVARCHAR(100), @ResponseCode INT, @ResponseMessage NVARCHAR(255);

EXEC InsertDetail 
    @OrderID = 10252, 
    @ProductID = 1,  -- Producto existente
    @Quantity = 5,    -- Stock suficiente
    @UnitPrice = 15.00, 
    @Discount = 0.1, 
    @OrderDetailID = @OrderDetailID OUTPUT, 
    @ProductName = @ProductName OUTPUT, 
    @ResponseCode = @ResponseCode OUTPUT, 
    @ResponseMessage = @ResponseMessage OUTPUT;

SELECT @ResponseCode AS Codigo, @ResponseMessage AS Mensaje, @OrderDetailID AS NuevoID, @ProductName AS Producto;

-- Escenario 2: Producto no encontrado (404 - Producto inexistente)
DECLARE @OrderDetailID INT, @ProductName NVARCHAR(100), @ResponseCode INT, @ResponseMessage NVARCHAR(255);

EXEC InsertDetail 
    @OrderID = 10250, 
    @ProductID = 9999,  -- Producto inexistente
    @Quantity = 5, 
    @UnitPrice = 15.00, 
    @Discount = 0.1, 
    @OrderDetailID = @OrderDetailID OUTPUT, 
    @ProductName = @ProductName OUTPUT, 
    @ResponseCode = @ResponseCode OUTPUT, 
    @ResponseMessage = @ResponseMessage OUTPUT;

SELECT @ResponseCode AS Codigo, @ResponseMessage AS Mensaje, @OrderDetailID AS NuevoID, @ProductName AS Producto;

--Escenario 3: Producto sin stock disponible (404 - Stock agotado)
DECLARE @OrderDetailID INT, @ProductName NVARCHAR(100), @ResponseCode INT, @ResponseMessage NVARCHAR(255);

EXEC InsertDetail 
    @OrderID = 10250, 
    @ProductID = 2,   
    @Quantity = 5000, 
    @UnitPrice = 10.00, 
    @Discount = 0.05, 
    @OrderDetailID = @OrderDetailID OUTPUT, 
    @ProductName = @ProductName OUTPUT, 
    @ResponseCode = @ResponseCode OUTPUT, 
    @ResponseMessage = @ResponseMessage OUTPUT;

SELECT @ResponseCode AS Codigo, @ResponseMessage AS Mensaje, @OrderDetailID AS NuevoID, @ProductName AS Producto;

-- Escenario 4: Error inesperado (500 - Error interno del servidor)
 
 DECLARE @OrderDetailID INT, @ProductName NVARCHAR(100), @ResponseCode INT, @ResponseMessage NVARCHAR(255);

EXEC InsertDetail 
    @OrderID = 10252, 
    @ProductID = 1,  -- Producto existente
    @Quantity = 5,    -- Stock suficiente
    @UnitPrice = 15.00, 
    @Discount = 0.1, 
    @OrderDetailID = @OrderDetailID OUTPUT, 
    @ProductName = @ProductName OUTPUT, 
    @ResponseCode = @ResponseCode OUTPUT, 
    @ResponseMessage = @ResponseMessage OUTPUT;

SELECT @ResponseCode AS Codigo, @ResponseMessage AS Mensaje, @OrderDetailID AS NuevoID, @ProductName AS Producto;