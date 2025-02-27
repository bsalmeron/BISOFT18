  
Create PROCEDURE InsertDetail
    @OrderID INT,
    @ProductID INT,
    @Quantity INT,
    @UnitPrice DECIMAL(10,2),
    @Discount FLOAT,
	@OrderDetailID INT OUTPUT,   -- ID del detalle insertado
    @ProductName NVARCHAR(100) OUTPUT, -- Nombre del producto
    @ResponseCode INT OUTPUT, -- Código de respuesta
    @ResponseMessage NVARCHAR(255) OUTPUT -- Descripción del código
AS
Begin
  Declare @Stock INT;
  --Bloque try validacion de logica 
  BEGIN TRY
    BEGIN TRANSACTION; 
	  --Obtener la cantidad en stock y el nombre 
       SELECT @Stock=UnitsInStock,  @ProductName = ProductName FROM Products
	   WHERE  ProductID=  @ProductID; 
	  -- Validacion 1:  que exista 
	  IF  @Stock IS NULL
	  BEGIN
	    SET @ResponseCode=404;
		SET @ResponseMessage='Producto no encontrado';
		ROLLBACK TRANSACTION;
	 END

	 -- Validacion 2: existencia de productos 
	
	IF  @Stock <0
	  BEGIN
	    SET @ResponseCode=404;
		SET @ResponseMessage='Producto sin stock disponible';
		ROLLBACK TRANSACTION;
		RETURN;
	 END

	 -- Validacion 3: existencia de la cantidad necesaria 

	 IF  @Stock < @Quantity
	  BEGIN
	    SET @ResponseCode=404;
		SET @ResponseMessage='Producto sin la cantidad de stock disponible';
		ROLLBACK TRANSACTION;
		RETURN;
	 END

	 --Insertamos el registro de linea de la orden 
	 Insert into [Order Details] (OrderID, ProductID,Quantity, UnitPrice, Discount )
	 Values(@OrderID,@ProductID,@Quantity,@UnitPrice, @Discount)
	 
	 --Obtener el ID recien insertado 
	 --SET @OrderDetailID = SCOPE_IDENTITY();
	 SET @OrderDetailID = @OrderID;
	 --Confirmar transaccion 
	 COMMIT TRANSACTION
	 SET @ResponseCode=201
	 SET @ResponseMessage='ORDEN CREADA DE FORMA EXITOSA'

  END TRY
  BEGIN CATCH 
    -- Escenario no controlado 
	 IF @@TRANCOUNT>0
	 Begin
	    ROLLBACK TRANSACTION; 
		SET @ResponseCode=500;
		SET @ResponseMessage='Ha ocurrido un error: '+ERROR_MESSAGE()+ ' Numero error:'+CAST(ERROR_NUMBER()AS VARCHAR) ;
		SET @OrderDetailID=NULL;
		SET @ProductName=NULL;
		 
	End
  END CATCH
End 

 