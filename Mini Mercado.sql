CREATE SCHEMA mini_mercado;
USE mini_mercado;

CREATE TABLE cliente 
(id_cliente INT NOT NULL AUTO_INCREMENT, PRIMARY KEY(id_cliente),
 nombre TEXT(20) NOT NULL, 
 direccion VARCHAR(50) NOT NULL,
 correo VARCHAR(40) NOT NULL,
 telefono varchar(10) NOT NULL);

CREATE TABLE cajero 
(id_cajero INT NOT NULL AUTO_INCREMENT, PRIMARY KEY(id_cajero),
 nombre TEXT(20) NOT NULL,
 direccion VARCHAR(50) NOT NULL,
 correo VARCHAR(40) NOT NULL,
 telefono VARCHAR(10) NOT NULL,
 fecha_contrato DATE NOT NULL,
 desempeno INT NOT NULL);

CREATE TABLE compra 
(id_compra INT NOT NULL AUTO_INCREMENT, PRIMARY KEY(id_compra),
 id_cliente INT NOT NULL, CONSTRAINT FK_compra_cliente FOREIGN KEY(id_cliente) REFERENCES cliente(id_cliente),
 id_cajero INT NOT NULL, CONSTRAINT FK_compra_cajero FOREIGN KEY(id_cajero) REFERENCES cajero(id_cajero),
 fecha_hora DATETIME NOT NULL);

CREATE TABLE productos
(id_producto INT NOT NULL AUTO_INCREMENT, PRIMARY KEY(id_producto),
 nombre TEXT(20) NOT NULL,
 descripcion TEXT(50) NOT NULL,
 stock INT NOT NULL,
 precio DECIMAL(10,2) NOT NULL);

CREATE TABLE compra_producto 
(id_cp INT NOT NULL AUTO_INCREMENT, PRIMARY KEY(id_cp),
 id_compra INT NOT NULL, CONSTRAINT FK_cp_compra FOREIGN KEY(id_compra) REFERENCES compra(id_compra),
 id_producto INT NOT NULL,CONSTRAINT FK_cp_producto FOREIGN KEY(id_producto) REFERENCES productos(id_producto),
 cantidad int NOT NULL);

CREATE TABLE pago
(id_pago INT NOT NULL AUTO_INCREMENT, PRIMARY KEY(id_pago),
 id_compra INT, CONSTRAINT FK_pago_compra FOREIGN KEY(id_compra) REFERENCES compra(id_compra),
 forma_pago TEXT(20) NOT NULL,
 cantidad_pago DECIMAL(10,2) NOT NULL,
 estado_pago TEXT(30) NOT NULL);
