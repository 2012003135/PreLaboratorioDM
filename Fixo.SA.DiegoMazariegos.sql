DROP DATABASE IF EXISTS FixoSaDM;
CREATE DATABASE FixoSaDM;
USE FixoSaDM;

CREATE TABLE Direccion (
    IdDireccion INT(11) PRIMARY KEY,
    Direccion VARCHAR(45),
    Ciudad VARCHAR(45),
    Pais VARCHAR(45)
);

INSERT INTO Direccion (IdDireccion, Direccion, Ciudad, Pais) VALUES
(1, 'Zona 14 10 avenida','Ciudad de Guatemala','Guatemala'),
(2, 'Zona 12 2 avenida','Ciudad de Guatemala','Guatemala'),
(3, 'Zona 15 7 avenida','Ciudad de Guatemala','Guatemala'),
(4, 'Zona 18 7 calle','Ciudad de Guatemala','Guatemala'),
(5, 'Zona 10 17 avenida','Ciudad de Guatemala','Guatemala');

DROP TABLE IF EXISTS Cliente;
CREATE TABLE Cliente (
    IdCliente INT(11) PRIMARY KEY,
    Nombre VARCHAR(45),
    Apellido VARCHAR(45),
    Edad INT(11),
    Direccion_IdDireccion INT(11),
    FOREIGN KEY (Direccion_IdDireccion) REFERENCES Direccion(IdDireccion)
);

INSERT INTO Cliente (IdCliente, Nombre, Apellido, Edad, Direccion_IdDireccion) VALUES
(1, 'Diego', 'Mazariegos', 18, 1),
(2, 'Jose', 'Alegria', 17, 3),
(3, 'Rodrigo', 'De la Cruz', 70, 12),
(4, 'Juliana', 'Alvarez', 16, 5),
(5, 'Isabel', 'Rodriguez', 12, 7);

DROP TABLE IF EXISTS Categoria;
CREATE TABLE Categoria (
    idCategoria INT(11) PRIMARY KEY,
    Nombre VARCHAR(45)
);

INSERT INTO Categoria (idCategoria, Nombre) VALUES
(1, 'Terror'),
(2, 'Accion'),
(3, 'Fantasia'),
(4, 'Comedia'),
(5, 'Romance');

DROP TABLE IF EXISTS Peliculas;
CREATE TABLE Peliculas (
    idPeliculas INT(11) PRIMARY KEY,
    Nombre VARCHAR(45),
    Duracion INT(11),
    Descripcion TEXT,
    año INT(11),
    Categoria_IdCategoria INT(11),
    FOREIGN KEY (Categoria_IdCategoria) REFERENCES Categoria(idCategoria)
);

INSERT INTO Peliculas (idPeliculas, Nombre, Duracion, Descripcion, año, Categoria_IdCategoria) VALUES
(1, 'The Conjuring', 112, 'Investigadores paranormales enfrentan una presencia demoníaca.', 2013, 5),
(2, 'Titanic', 195, 'Una historia de amor a bordo del trágico RMS Titanic.', 1997, 8),
(3, 'Toy Story', 81, 'Los juguetes cobran vida cuando no los ves.', 1995, 11),
(4, 'Gladiator', 155, 'Un general romano busca venganza tras ser traicionado.', 2000, 14),
(5, 'POKEMON1', 150, 'Un Joven quiere atrapar a criaturas', 1999, 5);

DROP TABLE IF EXISTS Inventario;
CREATE TABLE Inventario (
    IdCopiasPeliculas INT(11) PRIMARY KEY,
    Peliculas_idPeliculas INT(11),
    Disponible TINYINT(1),
    FOREIGN KEY (Peliculas_idPeliculas) REFERENCES Peliculas(idPeliculas)
);

INSERT INTO Inventario (IdCopiasPeliculas, Peliculas_idPeliculas, Disponible) VALUES
(1,2,3),
(6,5,4),
(7,8,9),
(2, 5, 0),
(1, 4, 2);

DROP TABLE IF EXISTS Renta;
CREATE TABLE Renta (
    IdRenta INT(11) PRIMARY KEY,
    Fecha_Renta DATE,
    Fecha_Entrega DATE,
    Inventario_idCopiasPeliculas INT(11),
    Cliente_idCliente INT(11),
    FOREIGN KEY (Inventario_idCopiasPeliculas) REFERENCES Inventario(IdCopiasPeliculas),
    FOREIGN KEY (Cliente_idCliente) REFERENCES Cliente(IdCliente)
);

INSERT INTO Renta (IdRenta, Fecha_Renta, Fecha_Entrega, Inventario_idCopiasPeliculas, Cliente_idCliente) VALUES
(1, '2024-02-21', '2024-08-23', 3, 2),
(2, '2024-05-12', '2024-09-03', 4, 2),
(3, '2024-04-23', '2024-12-12', 2, 2),
(4, '2024-8-24', '2024-07-01', 1, 1),
(5, '2024-01-05', '2024-03-30', 3, 1);

DROP TABLE IF EXISTS Comida;
CREATE TABLE Comida (
    idComida INT(11) PRIMARY KEY,
    Nombre VARCHAR(45),
    Bebidas VARCHAR(45),
    Tamaño VARCHAR(45),
    Pago VARCHAR(45),
    Cliente_idCliente INT(11),
    FOREIGN KEY (Cliente_idCliente) REFERENCES Cliente(IdCliente)
);

INSERT INTO Comida (idComida, Nombre, Bebidas, Tamaño, Pago, Cliente_idCliente) VALUES
(1, 'PopCorn', 'Gaseosa', 'Grande', 'Tarjeta', 1),
(2, 'Chocolate', 'Café', 'Pequeño', 'Efectivo', 2),
(3, 'Nachos', 'Gaseosa', 'Mediano', 'Efectivo', 3),
(4, 'HotDog', 'Gaseosa', 'Mediano', 'Efectivo', 4),
(5, 'Pizza', 'Agua', 'Pequeño', 'Tarjeta', 5);

DROP TABLE IF EXISTS Membresias;
CREATE TABLE Membresias (
    idMembresia INT(11) PRIMARY KEY,
    Nombre VARCHAR(45),
    Costo VARCHAR(45),
    Pago VARCHAR(45),
    Cliente_idCliente INT(11),
    FOREIGN KEY (Cliente_idCliente) REFERENCES Cliente(IdCliente)
);

INSERT INTO Membresias (idMembresia, Nombre, Costo, Pago, Cliente_idCliente) VALUES
(1, 'Membresía Básica', '100', 'Efectivo', 1),
(2, 'Membresía Premium', '350', 'Efectivo', 2),
(3, 'Membresía VIP', '500', 'Tarjeta', 3),
(4, 'Membresía Familiar', '300', 'Efectivo', 4),
(5, 'Membresía Estudiante', '50', 'Tarjeta', 5);

SELECT * FROM Direccion;
SELECT * FROM Cliente;
SELECT * FROM Renta;
SELECT * FROM Inventario;
SELECT * FROM Peliculas;
SELECT * FROM Categoria;
SELECT * FROM Comida;
SELECT * FROM Membresias;
SELECT * FROM Cliente WHERE Nombre = 'Juliana';
UPDATE Peliculas 
SET Nombre = '', Duracion = NULL, Descripcion = '', año = NULL, Categoria_IdCategoria = NULL
WHERE Nombre = 'POKEMON1';
SELECT * FROM Peliculas;
SELECT * FROM Categoria ORDER BY Nombre ASC;
SELECT * FROM Peliculas ORDER BY año DESC;