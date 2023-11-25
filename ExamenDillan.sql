CREATE DATABASE EXAMENDDILLAN
GO

CREATE TABLE Equipos
(
EquipoID INT IDENTITY (1,1)PRIMARY KEY,
TipoEquipo VARCHAR(255),
Modelo VARCHAR(50),
UsuarioID VARCHAR(50)
);

CREATE TABLE Usuarios (
    UsuarioID INT IDENTITY (1,1)PRIMARY KEY,
    Nombre VARCHAR(100),
    CorreoElectronico VARCHAR(100),
	Telefono VARCHAR (20)
);

CREATE TABLE Tecnicos (
    TecnicoID INT PRIMARY KEY,
    NombreTecnico VARCHAR(100),
    Especialidad VARCHAR(50)
);

CREATE TABLE Reparaciones (
    ReparacionID INT IDENTITY (1,1) PRIMARY KEY,
    EquipoID INT,
    FechaSolicitud DATE,
    Estado VARCHAR(50),
    FOREIGN KEY (EquipoID) REFERENCES Equipos(EquipoID),
);

CREATE TABLE Asignaciones (
    AsignacionID INT IDENTITY (1,1) PRIMARY KEY,
    ReparacionID INT,
    TecnicoID INT,
    FechaAsignacion DATE,
);

CREATE TABLE DetallesReparacion (
    DetalleID INT IDENTITY (1,1 )PRIMARY KEY,
    ReparacionID INT,
    Descripcion VARCHAR(255),
	FechaInicio DATE,
    FechaFin DATE,
    FOREIGN KEY (ReparacionID) REFERENCES Reparaciones(ReparacionID)
);

--CONSULTAR LOS REGISTROS

-- Equipos
SELECT * FROM Equipos;

-- Usuarios
SELECT * FROM Usuarios;

-- Tecnicos
SELECT * FROM Tecnicos;

--CONSULTAR CON FILTRO

-- Equipos con filtro por Modelo
SELECT * FROM Equipos WHERE Modelo = 'Galaxy';

-- Usuarios con filtro por Correo Electrónico
SELECT * FROM Usuarios WHERE CorreoElectronico LIKE '%@dominio.com%';

-- Tecnicos con filtro por Especialidad
SELECT * FROM Tecnicos WHERE Especialidad = 'Redes';
	

--AGREGAR NUEVO REGISTRO

-- Equipos
INSERT INTO Equipos (TipoEquipo, Modelo, UsuarioID) VALUES ('Celular', 'Galaxy', 1);

-- Usuarios
INSERT INTO Usuarios (Nombre, CorreoElectronico) VALUES ('Roy Obando', 'Roy@example.com');

-- Tecnicos
INSERT INTO Tecnicos (NombreTecnico, Especialidad) VALUES ('Nancy Samudio', 'Software');

--MODIFICAR REGISTRO EXISTENTE

-- Modificar el Modelo de un Equipo
UPDATE Equipos SET Modelo = 'Xperia' WHERE EquipoID = 1;

-- Modificar el Correo Electrónico de un Usuario
UPDATE Usuarios SET CorreoElectronico = 'roy.obando@nuevoemail.com' WHERE UsuarioID = 1;

-- Modificar la Especialidad de un Técnico
UPDATE Tecnicos SET Especialidad = 'Hardware' WHERE TecnicoID = 1;

-- Borrar un Equipo
DELETE FROM Equipos WHERE EquipoID = 1;

-- Borrar un Usuario
DELETE FROM Usuarios WHERE UsuarioID = 1;

-- Borrar un Técnico
DELETE FROM Tecnicos WHERE TecnicoID = 1;