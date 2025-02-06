--Crear base de datos 
Drop database EnmascaramientoBD;
CREATE DATABASE EnmascaramientoBD; 
Go

USE EnmascaramientoBD

-- 2️ CREAR UNA TABLA CON DATOS SENSIBLES
CREATE TABLE Clientes (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL,
    Email NVARCHAR(150) MASKED WITH (FUNCTION = 'email()') NULL,
    Telefono VARCHAR(15) MASKED WITH (FUNCTION = 'partial(2,"XXXXXX",2)') NULL,
    TarjetaCredito VARCHAR(16) MASKED WITH (FUNCTION = 'default()') NULL
);


-- 3️ INSERTAR DATOS DE PRUEBA
INSERT INTO Clientes (Nombre, Email, Telefono, TarjetaCredito)
VALUES 
    ('Juan Pérez', 'juan.perez@email.com', '5551234567', '1234567812345678'),
    ('Ana Gómez', 'ana.gomez@email.com', '5559876543', '8765432187654321');
GO

-- 4️ CREAR UN LOGIN Y USUARIO RESTRINGIDO
CREATE LOGIN UsuarioDDM WITH PASSWORD = '123';
CREATE USER UsuarioDDM FOR LOGIN UsuarioDDM;
GO 
-- 5 Crear Rol
Create Role leerDatos;

--6 Agregar El usuario al rol 

Alter Role leerDatos Add Member UsuarioDDM

--Agregar Grant a el rol 

GRANT SELECT ON Clientes To leerDatos

REVOKE UNMASK ON Clientes To leerDatos