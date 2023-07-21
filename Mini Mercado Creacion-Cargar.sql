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
 
 #CARGAR TABLAS
 
 INSERT INTO cliente(nombre,direccion,correo,telefono) VALUES
('Ana García', 'Avenida 123, Ciudad', 'ana@example.com', '3881234567'),
('Luis Martínez', 'Calle 456, Pueblo', 'luis@example.com', '3882345678'),
('María Rodríguez', 'Plaza 789, Villa', 'maria@example.com', '3883456789'),
('Carlos Gómez', 'Carretera 101, Ciudad', 'carlos@example.com', '3884567890'),
('Laura López', 'Avenida 555, Pueblo', 'laura@example.com', '3885678901'),
('Pedro Ramírez', 'Calle 888, Villa', 'pedro@example.com', '3886789012'),
('Sofía Fernández', 'Avenida 222, Ciudad', 'sofia@example.com', '3887890123'),
('Miguel Torres', 'Carretera 777, Pueblo', 'miguel@example.com', '3888901234'),
('Ana Herrera', 'Plaza 444, Villa', 'ana.h@example.com', '3889012345'),
('Diego Jiménez', 'Avenida 333, Ciudad', 'diego@example.com', '3880123456'),
('María García', 'Calle 666, Pueblo', 'maria.g@example.com', '3881111111'),
('Roberto Méndez', 'Carretera 999, Villa', 'roberto@example.com', '3882222222'),
('Isabel Torres', 'Avenida 777, Ciudad', 'isabel@example.com', '3883333333'),
('Andrés Gómez', 'Calle 888, Pueblo', 'andres@example.com', '3884444444'),
('Fernanda Martínez', 'Plaza 666, Villa', 'fernanda@example.com', '3885555555'),
('Julio Ramírez', 'Avenida 555, Ciudad', 'julio@example.com', '3886666666'),
('Lucía Fernández', 'Carretera 444, Pueblo', 'lucia@example.com', '3887777777'),
('Sergio López', 'Avenida 222, Villa', 'sergio@example.com', '3888888888'),
('Camila Ramírez', 'Plaza 111, Ciudad', 'camila@example.com', '3889999999'),
('Jorge Morales', 'Calle 777, Pueblo', 'jorge@example.com', '3880000000');

INSERT INTO cajero (nombre,direccion,correo,telefono,fecha_contrato,desempeno) VALUES
('Juan Perez', 'Calle 123, Ciudad', 'juanperez1@example.com', 3881122334, '2022-05-10', 8),
('María López', 'Avenida 456, Ciudad', 'marialopez2@example.com', 3885544332, '2021-12-15', 9),
('Carlos Ramírez', 'Calle Principal 789, Ciudad', 'carlosramirez3@example.com', 3879988776, '2023-01-20', 7),
('Laura González', 'Avenida Central 456, Ciudad', 'lauragonzalez4@example.com', 3873322114, '2022-09-05', 6),
('Andrés Martínez', 'Calle Secundaria 321, Ciudad', 'andresmartinez5@example.com', 3887788991, '2021-07-18', 8),
('Ana Rodríguez', 'Avenida Principal 654, Ciudad', 'anarodriguez6@example.com', 3875566778, '2023-03-12', 7),
('Pedro Gómez', 'Calle 789, Ciudad', 'pedrogomez7@example.com', 3883322445, '2022-11-30', 9),
('Lucía Torres', 'Avenida 987, Ciudad', 'luciatorres8@example.com', 3878877665, '2021-09-25', 6),
('Sergio Vargas', 'Calle Principal 159, Ciudad', 'sergiovargas9@example.com', 3885566554, '2023-05-07', 8),
('Mariana Silva', 'Avenida Central 753, Ciudad', 'marianasilva10@example.com', 3879988776, '2022-02-14', 7),
('Roberto Morales', 'Calle Secundaria 246, Ciudad', 'robertomorales11@example.com', 3883322114, '2021-10-09', 9),
('Carolina Castro', 'Avenida Principal 852, Ciudad', 'carolinacastro12@example.com', 3875566778, '2023-07-01', 8),
('Daniel Mendoza', 'Calle 852, Ciudad', 'danielmendoza13@example.com', 3883322445, '2022-04-26', 7),
('Fernanda Paredes', 'Avenida 753, Ciudad', 'fernandaparedes14@example.com', 3878877665, '2021-12-01', 6),
('Gonzalo Hernández', 'Calle Principal 369, Ciudad', 'gonzalohernandez15@example.com', 3885566554, '2023-06-17', 9),
('Marcela Rojas', 'Avenida Central 468, Ciudad', 'marcelarojas16@example.com', 3879988776, '2022-03-22', 7),
('Luisa Navarro', 'Calle Secundaria 975, Ciudad', 'luisanavarro17@example.com', 3883322114, '2021-11-15', 8),
('Ricardo Soto', 'Avenida Principal 258, Ciudad', 'ricardosoto18@example.com', 3875566778, '2023-04-10', 7),
('Camila Valenzuela', 'Calle 147, Ciudad', 'camilavalenzuela19@example.com', 3883322445, '2022-01-05', 9),
('Diego Espinoza', 'Avenida 369, Ciudad', 'diegoespinoza20@example.com', 3878877665, '2021-08-20', 6);

INSERT INTO productos(nombre,descripcion,stock,precio) VALUES 
('Arroz', 'Arroz blanco de grano largo', 10, 300.50),
('Fideos', 'Fideos de trigo duro', 5, 200),
('Aceite de oliva', 'Aceite de oliva extra virgen', 8, 800.25),
('Sal', 'Sal marina gruesa', 15, 100.75),
('Azúcar', 'Azúcar blanca granulada', 12, 150),
('Vinagre de manzana', 'Vinagre de sidra de manzana', 7, 350.80),
('Condimento de ajo', 'Condimento de ajo en polvo', 4, 300.60),
('Harina', 'Harina de trigo todo uso', 6, 250.35),
('Levadura', 'Levadura instantánea para pan', 9, 200),
('Salsa de tomate', 'Salsa de tomate tradicional', 20, 200),
('Especias mixtas', 'Mezcla de especias para sazonar', 3, 400.90),
('Café', 'Café molido de tueste medio', 18, 600),
('Té', 'Té negro de hojas sueltas', 11, 500),
('Miel', 'Miel pura de abeja', 14, 700.70),
('Salsa de soja', 'Salsa de soja tradicional', 2, 250.25),
('Avena', 'Avena en hojuelas de cocción rápida', 10, 350.50),
('Pimienta negra', 'Pimienta negra molida', 5, 200),
('Sopa enlatada', 'Sopa de pollo enlatada', 16, 200),
('Vino de cocina', 'Vino de cocina tinto seco', 8, 700.30),
('Mantequilla', 'Mantequilla sin sal', 25, 300.75);

INSERT INTO compra(id_cliente, id_cajero, fecha_hora)
VALUES
(1, 6, '2023-07-01 10:00:00'),
(2, 11, '2023-07-02 15:30:00'),
(3, 8, '2023-07-03 09:45:00'),
(4, 3, '2023-07-04 16:20:00'),
(5, 12, '2023-07-05 11:10:00'),
(6, 6, '2023-07-06 14:00:00'),
(7, 18, '2023-07-07 12:05:00'),
(8, 2, '2023-07-08 13:45:00'),
(9, 15, '2023-07-09 17:30:00'),
(10, 5, '2023-07-10 10:25:00'),
(11, 13, '2023-07-11 09:15:00'),
(12, 14, '2023-07-12 16:50:00'),
(13, 7, '2023-07-13 11:40:00'),
(14, 9, '2023-07-14 13:20:00'),
(15, 19, '2023-07-15 15:55:00'),
(16, 3, '2023-07-16 14:30:00'),
(17, 1, '2023-07-17 12:15:00'),
(18, 4, '2023-07-18 16:05:00'),
(19, 16, '2023-07-19 09:00:00'),
(20, 10, '2023-07-20 17:00:00');

-- Datos para la compra 1
INSERT INTO compra_producto(id_compra, id_producto, cantidad) VALUES
(1, 20, 12),
(1, 15, 7),
(1, 18, 7),
(1, 6, 1),
(1, 4, 8),
(1, 19, 5),
(1, 3, 11),
(1, 12, 9),
(1, 1, 2),
(1, 9, 6),
(1, 7, 14),
(1, 10, 9),
(1, 16, 12),
(1, 5, 11),
(1, 2, 3),
(1, 8, 11),
(1, 13, 6),
(1, 17, 14),
(1, 11, 11),
(1, 14, 3);

-- Datos para la compra 2
INSERT INTO compra_producto(id_compra, id_producto, cantidad) VALUES
(2, 14, 5),
(2, 1, 1),
(2, 15, 7),
(2, 7, 9),
(2, 10, 7),
(2, 19, 5),
(2, 8, 7),
(2, 12, 1),
(2, 18, 12),
(2, 3, 14),
(2, 2, 5),
(2, 11, 13),
(2, 20, 14),
(2, 9, 4),
(2, 4, 11),
(2, 13, 10),
(2, 5, 4),
(2, 17, 7),
(2, 16, 6),
(2, 6, 5);

-- Datos para la compra 3
INSERT INTO compra_producto(id_compra, id_producto, cantidad) VALUES
(3, 9, 6),
(3, 11, 7),
(3, 1, 9),
(3, 4, 9),
(3, 6, 5),
(3, 10, 4),
(3, 19, 2),
(3, 15, 2),
(3, 13, 12),
(3, 14, 11),
(3, 2, 10),
(3, 3, 11),
(3, 8, 1),
(3, 12, 10),
(3, 7, 13),
(3, 5, 12),
(3, 20, 11),
(3, 16, 10),
(3, 18, 6),
(3, 17, 2);

-- Datos para la compra 4
INSERT INTO compra_producto(id_compra, id_producto, cantidad) VALUES
(4, 2, 2),
(4, 10, 4),
(4, 9, 12),
(4, 7, 14),
(4, 5, 2),
(4, 12, 2),
(4, 8, 14),
(4, 4, 4),
(4, 11, 14),
(4, 14, 6),
(4, 19, 3),
(4, 17, 5);

-- Datos para la compra 5
INSERT INTO compra_producto(id_compra, id_producto, cantidad) VALUES
(5, 8, 6),
(5, 20, 8),
(5, 9, 3),
(5, 7, 2),
(5, 5, 11),
(5, 6, 5),
(5, 3, 4),
(5, 1, 13),
(5, 17, 10),
(5, 18, 9),
(5, 15, 6);

-- Datos para la compra 6
INSERT INTO compra_producto(id_compra, id_producto, cantidad) VALUES
(6, 4, 2),
(6, 2, 8),
(6, 16, 7),
(6, 15, 14),
(6, 1, 8),
(6, 12, 5),
(6, 17, 9);

-- Datos para la compra 7
INSERT INTO compra_producto(id_compra, id_producto, cantidad) VALUES
(7, 13, 10),
(7, 11, 2),
(7, 18, 9),
(7, 5, 15),
(7, 19, 4),
(7, 3, 10),
(7, 17, 10),
(7, 8, 10),
(7, 2, 15),
(7, 12, 15),
(7, 9, 9);

-- Datos para la compra 8
INSERT INTO compra_producto(id_compra, id_producto, cantidad) VALUES
(8, 14, 10),
(8, 1, 5),
(8, 6, 10);

-- Datos para la compra 9
INSERT INTO compra_producto(id_compra, id_producto, cantidad) VALUES
(9, 6, 7),
(9, 4, 7),
(9, 10, 8),
(9, 18, 7);

-- Datos para la compra 10
INSERT INTO compra_producto(id_compra, id_producto, cantidad) VALUES
(10, 20, 14),
(10, 11, 6),
(10, 3, 11),
(10, 1, 4),
(10, 2, 4),
(10, 16, 1),
(10, 15, 1),
(10, 7, 1),
(10, 17, 5),
(10, 14, 4),
(10, 9, 7),
(10, 12, 10);

-- Datos para la compra 11
INSERT INTO compra_producto(id_compra, id_producto, cantidad) VALUES
(11, 14, 14),
(11, 18, 8),
(11, 8, 11),
(11, 7, 5),
(11, 20, 6),
(11, 1, 7),
(11, 11, 15),
(11, 16, 4),
(11, 5, 12),
(11, 17, 6),
(11, 2, 6);

-- Datos para la compra 12
INSERT INTO compra_producto(id_compra, id_producto, cantidad) VALUES
(12, 6, 4),
(12, 3, 2),
(12, 7, 5),
(12, 18, 12),
(12, 13, 2),
(12, 19, 8),
(12, 16, 8),
(12, 11, 6),
(12, 15, 11),
(12, 17, 10),
(12, 9, 4),
(12, 4, 4),
(12, 14, 7);

-- Datos para la compra 13
INSERT INTO compra_producto(id_compra, id_producto, cantidad) VALUES
(13, 7, 7),
(13, 11, 7),
(13, 14, 1),
(13, 1, 2),
(13, 4, 10),
(13, 17, 3),
(13, 20, 11),
(13, 13, 3),
(13, 9, 2),
(13, 16, 5),
(13, 19, 7);

-- Datos para la compra 14
INSERT INTO compra_producto(id_compra, id_producto, cantidad) VALUES
(14, 10, 15),
(14, 14, 9),
(14, 15, 10),
(14, 20, 1),
(14, 18, 12),
(14, 2, 6),
(14, 17, 12),
(14, 4, 12),
(14, 12, 10),
(14, 16, 14),
(14, 11, 15),
(14, 5, 14);

-- Datos para la compra 15
INSERT INTO compra_producto(id_compra, id_producto, cantidad) VALUES
(15, 6, 2),
(15, 19, 10),
(15, 3, 7),
(15, 10, 1),
(15, 8, 4),
(15, 4, 2),
(15, 16, 5),
(15, 15, 5),
(15, 7, 3),
(15, 13, 14),
(15, 5, 3),
(15, 9, 6),
(15, 17, 3);

-- Datos para la compra 16
INSERT INTO compra_producto(id_compra, id_producto, cantidad) VALUES
(16, 4, 7),
(16, 2, 2),
(16, 19, 11),
(16, 8, 5),
(16, 11, 14),
(16, 5, 9),
(16, 12, 14),
(16, 17, 8),
(16, 3, 7),
(16, 16, 11);

-- Datos para la compra 17
INSERT INTO compra_producto(id_compra, id_producto, cantidad) VALUES
(17, 15, 8),
(17, 4, 9),
(17, 1, 1),
(17, 9, 6),
(17, 20, 4),
(17, 19, 11),
(17, 18, 6),
(17, 6, 2),
(17, 14, 10),
(17, 16, 6),
(17, 3, 10),
(17, 8, 14),
(17, 12, 9),
(17, 10, 3),
(17, 2, 12),
(17, 11, 2),
(17, 17, 2),
(17, 7, 2);

-- Datos para la compra 18
INSERT INTO compra_producto(id_compra, id_producto, cantidad) VALUES
(18, 8, 14),
(18, 14, 11),
(18, 11, 9),
(18, 16, 15),
(18, 15, 6),
(18, 10, 5),
(18, 19, 4),
(18, 20, 8),
(18, 1, 10),
(18, 13, 8),
(18, 12, 3),
(18, 17, 2),
(18, 18, 5),
(18, 4, 1),
(18, 7, 2),
(18, 9, 4);

-- Datos para la compra 19
INSERT INTO compra_producto(id_compra, id_producto, cantidad) VALUES
(19, 12, 14),
(19, 4, 10),
(19, 3, 1),
(19, 20, 7),
(19, 13, 1),
(19, 11, 7),
(19, 5, 4),
(19, 6, 9),
(19, 8, 12),
(19, 14, 6),
(19, 7, 10),
(19, 18, 1),
(19, 19, 6),
(19, 9, 10),
(19, 10, 11),
(19, 15, 8),
(19, 2, 1),
(19, 1, 3),
(19, 17, 9),
(19, 16, 10);

-- Datos para la compra 20
INSERT INTO compra_producto(id_compra, id_producto, cantidad) VALUES
(20, 12, 5),
(20, 3, 2),
(20, 1, 5),
(20, 8, 2),
(20, 19, 10),
(20, 15, 12),
(20, 16, 4),
(20, 17, 10),
(20, 9, 14),
(20, 7, 11),
(20, 18, 1);

-- Datos de Pago 1
INSERT INTO pago(id_compra, forma_pago, cantidad_pago, estado_pago) VALUES
(1, 'EFECTIVO', 
(SELECT  sum(p.precio * cp.cantidad)
 FROM compra c
 INNER JOIN compra_producto cp
 ON c.id_compra = cp.id_compra
 INNER JOIN productos p
 ON cp.id_producto = p.id_producto
 WHERE cp.id_compra = 1
 GROUP BY cp.id_compra),
'PAGADO');

-- Datos de Pago 2
INSERT INTO pago(id_compra, forma_pago, cantidad_pago, estado_pago) VALUES
(2, 'CREDITO', 
(SELECT  sum(p.precio * cp.cantidad)
 FROM compra c
 INNER JOIN compra_producto cp
 ON c.id_compra = cp.id_compra
 INNER JOIN productos p
 ON cp.id_producto = p.id_producto
 WHERE cp.id_compra = 2
 GROUP BY cp.id_compra),
'PAGADO');

-- Datos de Pago 3
INSERT INTO pago(id_compra, forma_pago, cantidad_pago, estado_pago) VALUES
(3, 'DEBITO', 
(SELECT  sum(p.precio * cp.cantidad)
 FROM compra c
 INNER JOIN compra_producto cp
 ON c.id_compra = cp.id_compra
 INNER JOIN productos p
 ON cp.id_producto = p.id_producto
 WHERE cp.id_compra = 3
 GROUP BY cp.id_compra),
'PAGADO');

-- Datos de Pago 4
INSERT INTO pago(id_compra, forma_pago, cantidad_pago, estado_pago) VALUES
(4, 'TRANSFERENCIA', 
(SELECT  sum(p.precio * cp.cantidad)
 FROM compra c
 INNER JOIN compra_producto cp
 ON c.id_compra = cp.id_compra
 INNER JOIN productos p
 ON cp.id_producto = p.id_producto
 WHERE cp.id_compra = 4
 GROUP BY cp.id_compra),
'PAGADO');

-- Datos de Pago 5
INSERT INTO pago(id_compra, forma_pago, cantidad_pago, estado_pago) VALUES
(5, 'EFECTIVO', 
(SELECT  sum(p.precio * cp.cantidad)
 FROM compra c
 INNER JOIN compra_producto cp
 ON c.id_compra = cp.id_compra
 INNER JOIN productos p
 ON cp.id_producto = p.id_producto
 WHERE cp.id_compra = 5
 GROUP BY cp.id_compra),
'PAGADO');

-- Datos de Pago 6
INSERT INTO pago(id_compra, forma_pago, cantidad_pago, estado_pago) VALUES
(6, 'DEBITO', 
(SELECT  sum(p.precio * cp.cantidad)
 FROM compra c
 INNER JOIN compra_producto cp
 ON c.id_compra = cp.id_compra
 INNER JOIN productos p
 ON cp.id_producto = p.id_producto
 WHERE cp.id_compra = 6
 GROUP BY cp.id_compra),
'PAGADO');

-- Datos de Pago 7
INSERT INTO pago(id_compra, forma_pago, cantidad_pago, estado_pago) VALUES
(7, 'CREDITO', 
(SELECT  sum(p.precio * cp.cantidad)
 FROM compra c
 INNER JOIN compra_producto cp
 ON c.id_compra = cp.id_compra
 INNER JOIN productos p
 ON cp.id_producto = p.id_producto
 WHERE cp.id_compra = 7
 GROUP BY cp.id_compra),
'PAGADO');

-- Datos de Pago 8
INSERT INTO pago(id_compra, forma_pago, cantidad_pago, estado_pago) VALUES
(8, 'TRANSFERENCIA', 
(SELECT  sum(p.precio * cp.cantidad)
 FROM compra c
 INNER JOIN compra_producto cp
 ON c.id_compra = cp.id_compra
 INNER JOIN productos p
 ON cp.id_producto = p.id_producto
 WHERE cp.id_compra = 8
 GROUP BY cp.id_compra),
'PAGADO');

-- Datos de Pago 9
INSERT INTO pago(id_compra, forma_pago, cantidad_pago, estado_pago) VALUES
(9, 'EFECTIVO', 
(SELECT  sum(p.precio * cp.cantidad)
 FROM compra c
 INNER JOIN compra_producto cp
 ON c.id_compra = cp.id_compra
 INNER JOIN productos p
 ON cp.id_producto = p.id_producto
 WHERE cp.id_compra = 9
 GROUP BY cp.id_compra),
'PAGADO');

-- Datos de Pago 10
INSERT INTO pago(id_compra, forma_pago, cantidad_pago, estado_pago) VALUES
(10, 'DEBITO', 
(SELECT  sum(p.precio * cp.cantidad)
 FROM compra c
 INNER JOIN compra_producto cp
 ON c.id_compra = cp.id_compra
 INNER JOIN productos p
 ON cp.id_producto = p.id_producto
 WHERE cp.id_compra = 10
 GROUP BY cp.id_compra),
'PAGADO');

-- Datos de Pago 11
INSERT INTO pago(id_compra, forma_pago, cantidad_pago, estado_pago) VALUES
(11, 'TRANSFERENCIA', 
(SELECT  sum(p.precio * cp.cantidad)
 FROM compra c
 INNER JOIN compra_producto cp
 ON c.id_compra = cp.id_compra
 INNER JOIN productos p
 ON cp.id_producto = p.id_producto
 WHERE cp.id_compra = 11
 GROUP BY cp.id_compra),
'PAGADO');

-- Datos de Pago 12
INSERT INTO pago(id_compra, forma_pago, cantidad_pago, estado_pago) VALUES
(12, 'EFECTIVO', 
(SELECT  sum(p.precio * cp.cantidad)
 FROM compra c
 INNER JOIN compra_producto cp
 ON c.id_compra = cp.id_compra
 INNER JOIN productos p
 ON cp.id_producto = p.id_producto
 WHERE cp.id_compra = 12
 GROUP BY cp.id_compra),
'PAGADO');

-- Datos de Pago 13
INSERT INTO pago(id_compra, forma_pago, cantidad_pago, estado_pago) VALUES
(13, 'CREDITO', 
(SELECT  sum(p.precio * cp.cantidad)
 FROM compra c
 INNER JOIN compra_producto cp
 ON c.id_compra = cp.id_compra
 INNER JOIN productos p
 ON cp.id_producto = p.id_producto
 WHERE cp.id_compra = 13
 GROUP BY cp.id_compra),
'PAGADO');

-- Datos de Pago 14
INSERT INTO pago(id_compra, forma_pago, cantidad_pago, estado_pago) VALUES
(14, 'DEBITO', 
(SELECT  sum(p.precio * cp.cantidad)
 FROM compra c
 INNER JOIN compra_producto cp
 ON c.id_compra = cp.id_compra
 INNER JOIN productos p
 ON cp.id_producto = p.id_producto
 WHERE cp.id_compra = 14
 GROUP BY cp.id_compra),
'PAGADO');

-- Datos de Pago 15
INSERT INTO pago(id_compra, forma_pago, cantidad_pago, estado_pago) VALUES
(15, 'EFECTIVO', 
(SELECT  sum(p.precio * cp.cantidad)
 FROM compra c
 INNER JOIN compra_producto cp
 ON c.id_compra = cp.id_compra
 INNER JOIN productos p
 ON cp.id_producto = p.id_producto
 WHERE cp.id_compra = 15
 GROUP BY cp.id_compra),
'PAGADO');

-- Datos de Pago 16
INSERT INTO pago(id_compra, forma_pago, cantidad_pago, estado_pago) VALUES
(16, 'TRANSFERENCIA', 
(SELECT  sum(p.precio * cp.cantidad)
 FROM compra c
 INNER JOIN compra_producto cp
 ON c.id_compra = cp.id_compra
 INNER JOIN productos p
 ON cp.id_producto = p.id_producto
 WHERE cp.id_compra = 16
 GROUP BY cp.id_compra),
'PAGADO');

-- Datos de Pago 17
INSERT INTO pago(id_compra, forma_pago, cantidad_pago, estado_pago) VALUES
(17, 'DEBITO', 
(SELECT  sum(p.precio * cp.cantidad)
 FROM compra c
 INNER JOIN compra_producto cp
 ON c.id_compra = cp.id_compra
 INNER JOIN productos p
 ON cp.id_producto = p.id_producto
 WHERE cp.id_compra = 17
 GROUP BY cp.id_compra),
'PAGADO');

-- Datos de Pago 18
INSERT INTO pago(id_compra, forma_pago, cantidad_pago, estado_pago) VALUES
(18, 'CREDITO', 
(SELECT  sum(p.precio * cp.cantidad)
 FROM compra c
 INNER JOIN compra_producto cp
 ON c.id_compra = cp.id_compra
 INNER JOIN productos p
 ON cp.id_producto = p.id_producto
 WHERE cp.id_compra = 18
 GROUP BY cp.id_compra),
'PAGADO');

-- Datos de Pago 19
INSERT INTO pago(id_compra, forma_pago, cantidad_pago, estado_pago) VALUES
(19, 'EFECTIVO', 
(SELECT  sum(p.precio * cp.cantidad)
 FROM compra c
 INNER JOIN compra_producto cp
 ON c.id_compra = cp.id_compra
 INNER JOIN productos p
 ON cp.id_producto = p.id_producto
 WHERE cp.id_compra = 19
 GROUP BY cp.id_compra),
'PAGADO');

-- Datos de Pago 20
INSERT INTO pago(id_compra, forma_pago, cantidad_pago, estado_pago) VALUES
(20, 'TRANSFERENCIA', 
(SELECT  sum(p.precio * cp.cantidad)
 FROM compra c
 INNER JOIN compra_producto cp
 ON c.id_compra = cp.id_compra
 INNER JOIN productos p
 ON cp.id_producto = p.id_producto
 WHERE cp.id_compra = 20
 GROUP BY cp.id_compra),
'PAGADO');

