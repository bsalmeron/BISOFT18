USE Northwind
--CHARINDEX busca la el incio (posicion) de coincidencia de la cadena 
SELECT ProductName, CHARINDEX('an', ProductName) 'Ubicacion' FROM Products

--LEFT Devuelve los N primeros caracteres de una columna
SELECT ProductName, LEFT(  ProductName,5)   FROM Products

--LEN  retorna la cantidad # de caracteres de una cadena 

SELECT ProductName, LEN(  ProductName)   FROM Products

--LOWER convierte  una cadena minuscula 

SELECT ProductName, LOWER(  ProductName)   FROM Products

--UPPER  convierte  una cadena mayuscula 

SELECT ProductName, UPPER(  ProductName)   FROM Products

--LTRIM quita espacios al inicio de la cadena
--RTRIM quita espacios al final de la cadena
--TRIM  quita espacios tanto al inicio como al final de la cadena
SELECT LTRIM('      Ejemplo')  , '      Ejemplo' 
SELECT RTRIM('Ejemplo      ')  , 'Ejemplo      ' 
SELECT TRIM('  Ejemplo      ')  , '  Ejemplo      ' 

-- NCHAR Retorna el caracter Unicode correspondiente a un código

 Select   'Cenfotec 2025'+NCHAR(169)
 
 -- Replace remplaza las ocurrencias de una subcadena en una cadena 

 SELECT ProductName, Replace(  ProductName, 'an','MODIFCADO') 'NombreModificado'  FROM Products

 Update Products
 set ProductName = Replace(  ProductName, 'a','A')

 --REPLICATE repetir N una cadena 
  SELECT ProductName, REPLICATE(  ProductName + ' ',3)    FROM Products

 -- REVERSE reversar  el orden de una cadena 
 SELECT ProductName, REVERSE(  ProductName )    FROM Products

 --SPACE genera una cantidad N de espacios 
 SELECT  FirstName+SPACE(3)+LastName   FROM Employees

 --STR Convertir un numero a cadena 
  SELECT ProductName, STR( UnitPrice + 10,2)    FROM Products
  SELECT ProductName, CAST( UnitPrice AS varchar(10)), 
  REPLACE( CAST( UnitPrice AS varchar(10)),'.00','')    FROM Products  

  -- Cast 
  /*
  El operador CAST en SQL Server se utiliza para convertir explícitamente 
  un valor de un tipo de datos a otro. Es útil cuando necesitas cambiar 
  el tipo de datos en consultas, cálculos o para asegurar compatibilidad entre 
  tipos de datos diferentes 
  
  */
   
--Convertir un número a cadena (STRING)
SELECT ProductName, 
       CAST(UnitPrice AS VARCHAR(10)) AS PrecioComoTexto
FROM Products;

-- Convertir una cadena en número
SELECT CAST('123.45' AS DECIMAL(10,2)) AS Numero;

--Convertir una fecha en cadena 
SELECT OrderID, 
       OrderDate, 
       CAST(OrderDate AS VARCHAR(20)) AS FechaComoTexto
FROM Orders;

--Convert 

 