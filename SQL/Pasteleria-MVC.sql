
CREATE DATABASE BakeryMVC;/*crear base de datos*/
use BakeryMVC;

-- -------------------------------------------------------- Tablas
/*Crear base de datos cargos*/
CREATE TABLE Cargos (
  idCargo int identity primary key not null,
  cargo varchar(50) NOT NULL,
);

/*Crear base de datos CargosporEmpleado*/
CREATE TABLE CargosporEmpleado (
	idCargo int NOT NULL,
	idUsuario int NOT NULL
);


/*Crear base de DetalleVentas*/
CREATE TABLE DetalleVentas (
  idVenta int NOT NULL,
  idProducto int NOT NULL,
  precio float NOT NULL,
  cantidad int NOT NULL
);

/*Crear base de DetalleEncargos*/
CREATE TABLE DetalleEncargos (
	idEncargo  int identity primary key not null,
	idProducto int NOT NULL,
	cantidad int NOT NULL
);

/*Crear base de Usuario*/
CREATE TABLE Usuario (
  idUsuario int identity primary key not null,
  nombres varchar(100) NOT NULL,
  apellidoP varchar(50) NOT NULL,
  apellidoM varchar(50) DEFAULT NULL,
  correo varchar (60) not null,
  pass varchar (60) not null,
  idTipo int not null
);

create table TipoUsuario(
	idTipo int identity primary key not null,
	nombre varchar (60) not null,
);

/*Crear base de Encargos*/
CREATE TABLE Encargos (
  idEncargo int identity primary key not null,
  idCliente int NOT NULL,
  anticipo float  DEFAULT NULL,
  fechaEncargo date DEFAULT NULL,
  fechaEntrega date DEFAULT NULL
);

/*Crear base de Ventas*/
CREATE TABLE Ventas (
  idVenta int identity primary key not null,
  idCliente int NOT NULL,
  idUsuario int NOT NULL,
  fecha date DEFAULT NULL
);

/*Crear base de Productos*/
Create TABLE Productos (
  idProducto int identity primary key not null,
  foto varbinary (max),
  nombre varchar(50) NOT NULL,
  idTam int NOT NULL,
  descripcion varchar(150) DEFAULT NULL,
  precio float NOT NULL
);

create table Tam(
	idTam int identity primary key not null,
	nombre varchar (60) not null
);


-- -------------------------------------------------------- Datos
/*insetar en la tabla cargos*/
INSERT INTO Cargos (cargo) 
	VALUES	('Vendedor'),
			('Panadero'),
			('Repartidor');

/*insetar en la tabla Ventas*/
INSERT INTO TipoUsuario (nombre) VALUES
('Admin'),
('Vendedor')
;

INSERT INTO Tam (nombre) VALUES
('Chico'),
('Mediano'),
('Grande')
;

-- --------------------------------------------------------Alters
-- Filtros para la tabla `CargosporEmpleado`
ALTER TABLE CargosporEmpleado ADD FOREIGN KEY (idCargo) REFERENCES Cargos (idCargo);
ALTER TABLE CargosporEmpleado ADD FOREIGN KEY (idUsuario) REFERENCES Usuario (idUsuario);

-- Filtros para la tabla `detalleencargos`
ALTER TABLE DetalleEncargos ADD FOREIGN KEY (idEncargo) REFERENCES Encargos (idEncargo);
ALTER TABLE DetalleEncargos ADD FOREIGN KEY (idProducto) REFERENCES Productos (idProducto);

-- Filtros para la tabla `detalleventas`
ALTER TABLE Detalleventas ADD FOREIGN KEY (idVenta) REFERENCES Ventas (idVenta);
ALTER TABLE Detalleventas ADD FOREIGN KEY (idProducto) REFERENCES Productos (idProducto);

-- Filtros para la tabla `encargos`
ALTER TABLE Encargos ADD FOREIGN KEY (idCliente) REFERENCES Clientes (idCliente);

-- Filtros para la tabla `ventas`
ALTER TABLE Ventas ADD FOREIGN KEY (idCliente) REFERENCES Clientes (idCliente);
ALTER TABLE Ventas ADD FOREIGN KEY (idUsuario) REFERENCES Usuario (idUsuario);

-- Filtros para la tabla `ventas`
ALTER TABLE Usuario ADD FOREIGN KEY (idTipo) REFERENCES TipoUsuario (idTipo);

-- Filtros para la tabla `Producto`
ALTER TABLE Productos ADD FOREIGN KEY (idTam) REFERENCES Tam (idTam);