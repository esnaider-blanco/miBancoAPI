CREATE DATABASE db_miViajeCR_miBanco;
GO

USE db_miViajeCR_miBanco;

CREATE TABLE Usuarios
(
	IdUsuario INT IDENTITY(1,1) PRIMARY KEY,
	Nombre VARCHAR(20) NOT NULL,
	Apellidos VARCHAR(50) NOT NULL,
	FechaNacimiento DATE NOT NULL,
	CorreoElectronico VARBINARY(max) NOT NULL,
	Contraseña VARBINARY(max) NOT NULL,	
	Token VARCHAR(10) NULL,
	EstaBloqueado BIT NOT NULL,
	IntentosFallidos TINYINT NOT NULL,
	EstaActivo BIT NOT NULL,
	FechaCreacion DATETIME NOT NULL,
)
GO

CREATE TABLE HistoricoLogins
(
	Id INT IDENTITY(1,1) PRIMARY KEY,
	IdUsuario INT NOT NULL FOREIGN KEY REFERENCES Usuarios(IdUsuario),
	FechaInicioSesion DATETIME not null,
	FechaFinSesion DATETIME null,
	EstaActivo BIT NOT NULL
)
GO

CREATE TABLE CuentasBancarias
(
	IdCuentaBancaria INT IDENTITY(1,1) PRIMARY KEY,
	IdUsuario INT NOT NULL FOREIGN KEY REFERENCES Usuarios(IdUsuario),
	NumeroCuenta VARCHAR(22) UNIQUE NOT NULL,	
	SaldoDisponible MONEY NOT NULL,
	EsCuentaPrincipal BIT NOT NULL,
	EstaBloqueada BIT NOT NULL,
	FechaCreacion DATETIME NOT NULL,
)
GO


CREATE TABLE TiposTransaccion
(
	IdTipoTransaccion INT IDENTITY(1,1) PRIMARY KEY,
	TipoTransaccion VARCHAR(50) NOT NULL
)
GO

CREATE TABLE Transacciones
(
	IdTransaccion INT IDENTITY(1,1) PRIMARY KEY,
	FechaTransaccion DATETIME NOT NULL,
	IdTipoTransaccion INT NOT NULL FOREIGN KEY REFERENCES TiposTransaccion(IdTipoTransaccion),
	IdCuentaBancaria INT NOT NULL FOREIGN KEY REFERENCES CuentasBancarias(IdCuentaBancaria),
	IdCuentaBancariaOrigen INT NULL FOREIGN KEY REFERENCES CuentasBancarias(IdCuentaBancaria),
	IdCuentaBancariaDestino INT NULL FOREIGN KEY REFERENCES CuentasBancarias(IdCuentaBancaria),
	Monto MONEY NOT NULL,
	Descripcion VARCHAR(200) NULL
)
GO