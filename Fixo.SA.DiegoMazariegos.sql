DROP DATABASE IF EXISTS practica1;
CREATE DATABASE practica1;
USE practica1;

CREATE TABLE Direccion (
    IdDireccion INT(11) PRIMARY KEY,
    Direccion VARCHAR(45),
    Ciudad VARCHAR(45),
    Pais VARCHAR(45)
);

INSERT INTO Direccion (IdDireccion, Direccion, Ciudad, Pais) VALUES
(1, 'Buenos Aires', 'Buenos Aires', 'Argentina'),
(2, 'Buenos Aires', 'Buenos Aires', 'Argentina'),
(3, 'Buenos Aires', 'Buenos Aires', 'Argentina'),
(4, 'Buenos Aires', 'Buenos Aires', 'Argentina'),
(5, 'Buenos Aires', 'Buenos Aires', 'Argentina');

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
(1, 'Juliana', 'Martinez', 30, 3),
(2, 'Luis', 'Martinez', 30, 4),
(3, 'Fernando', 'Martinez', 30, 5),
(4, 'Alberto', 'Martinez', 30, 1),
(5, 'Ignacio', 'Martinez', 30, 2);

DROP TABLE IF EXISTS Categoria;
CREATE TABLE Categoria (
    idCategoria INT(11) PRIMARY KEY,
    Nombre VARCHAR(45)
);

INSERT INTO Categoria (idCategoria, Nombre) VALUES
(1, 'Accion'),
(2, 'Ficcion'),
(3, 'Fantasia'),
(4, 'Terror'),
(5, 'Deportes');

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
(1, 'Inception', 148, 'Un ladrón que roba secretos a través de los sueños es dado la tarea de implantar una idea en la mente de un CEO.', 2010, 1),
(2, 'The Matrix', 136, 'Un programador informático descubre la verdad sobre su realidad y su papel en la guerra contra sus controladores.', 1999, 2),
(3, 'Interstellar', 169, 'Un grupo de exploradores viaja a través de un agujero de gusano en el espacio en un intento de asegurar la supervivencia de la humanidad.', 2014, 3),
(4, 'POKEMON YO TE ELIJO!', 150, 'Ash cumple 10 años y se convierte en entrenador Pokémon cuando el profesor Oak le entrega a su primer Pokémon.', 2017, 4),
(5, 'POKEMON1', 150, 'Ash y sus amigos luchan contra un malvado coleccionista de Pokémon que quiere capturar tres aves elementales.', 1999, 5);

DROP TABLE IF EXISTS Inventario;
CREATE TABLE Inventario (
    IdCopiasPeliculas INT(11) PRIMARY KEY,
    Peliculas_idPeliculas INT(11),
    Disponible TINYINT(1),
    FOREIGN KEY (Peliculas_idPeliculas) REFERENCES Peliculas(idPeliculas)
);

INSERT INTO Inventario (IdCopiasPeliculas, Peliculas_idPeliculas, Disponible) VALUES
(1, 1, 1),
(2, 1, 0),
(3, 2, 1),
(4, 2, 0),
(5, 3, 1);

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
(1, '2023-09-01', '2023-08-14', 1, 1),
(2, '2023-10-02', '2023-09-13', 2, 1),
(3, '2023-11-03', '2023-10-12', 3, 2),
(4, '2023-12-04', '2023-11-11', 4, 3),
(5, '2023-01-05', '2023-12-10', 5, 4);

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