--Crear la Tabla Cliente
CREATE TABLE Cliente (
    Id_Cliente SERIAL PRIMARY KEY,
    Correo VARCHAR(255) UNIQUE NOT NULL,
    Dirección TEXT,
    Codigo_Postal VARCHAR(10),
    Nombre VARCHAR(100) NOT NULL,
    Apellido_Paterno VARCHAR(100) NOT NULL,
    Apellido_Materno VARCHAR(100),
);

--Crear la Tabla Pedido
CREATE TABLE Pedido (
    Id_Pedido SERIAL PRIMARY KEY,
    Id_Cliente INT REFERENCES Cliente(Id_Cliente) ON DELETE CASCADE,
    Fecha_hecho TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Estatus VARCHAR(20) CHECK (Estatus IN ('Pendiente', 'Enviado', 'Entregado', 'Cancelado')),
);

--Crear la Tabla Producto
CREATE TABLE Producto (
    Id_Producto SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL,
    Precio DECIMAL(10,2) NOT NULL,
    Stock INT DEFAULT 0
);

--Crear la Tabla DetallePedido
CREATE TABLE DetallePedido (
    Id_Detalle SERIAL PRIMARY KEY,
    Id_Pedido INT REFERENCES Pedido(Id_Pedido) ON DELETE CASCADE,
    Id_Producto INT REFERENCES Producto(Id_Producto) ON DELETE CASCADE,
    Cantidad INT NOT NULL CHECK (Cantidad > 0),
    Precio_Unitario DECIMAL(10,2) NOT NULL,
    Subtotal DECIMAL(10,2) GENERATED ALWAYS AS (Cantidad * Precio_Unitario) STORED
);

-- Insertar 50 Clientes
INSERT INTO Cliente (Correo, Dirección, Codigo_Postal, Nombre, Apellido_paterno, Apellido_materno) VALUES
('juan.perez@email.com', 'Calle 1, Ciudad A', '12345', 'Juan', 'Pérez', 'Gómez'),
('maria.lopez@email.com', 'Calle 2, Ciudad B', '54321', 'María', 'López', 'Fernández'),
('carlos.mendez@email.com', 'Calle 3, Ciudad C', '67890', 'Carlos', 'Méndez', 'Ruiz'),
('ana.martinez@email.com', 'Calle 4, Ciudad D', '98765', 'Ana', 'Martínez', 'Díaz'),
('luis.hernandez@email.com', 'Calle 5, Ciudad E', '13579', 'Luis', 'Hernández', 'Torres'),
('sofia.ramirez@email.com', 'Calle 6, Ciudad F', '24680', 'Sofía', 'Ramírez', 'Molina'),
('andres.gutierrez@email.com', 'Calle 7, Ciudad G', '11223', 'Andrés', 'Gutiérrez', 'Santos'),
('paula.fernandez@email.com', 'Calle 8, Ciudad H', '33445', 'Paula', 'Fernández', 'Delgado'),
('diego.navarro@email.com', 'Calle 9, Ciudad I', '55667', 'Diego', 'Navarro', 'Ortega'),
('valeria.vera@email.com', 'Calle 10, Ciudad J', '77889', 'Valeria', 'Vera', 'Cabrera'),
('fernando.silva@email.com', 'Calle 11, Ciudad K', '88990', 'Fernando', 'Silva', 'Muñoz'),
('gabriela.morales@email.com', 'Calle 12, Ciudad L', '99101', 'Gabriela', 'Morales', 'Paredes'),
('roberto.soto@email.com', 'Calle 13, Ciudad M', '11212', 'Roberto', 'Soto', 'Castillo'),
('camila.rios@email.com', 'Calle 14, Ciudad N', '22323', 'Camila', 'Ríos', 'García'),
('julian.espinoza@email.com', 'Calle 15, Ciudad O', '33434', 'Julián', 'Espinoza', 'Alvarez'),
('beatriz.vargas@email.com', 'Calle 16, Ciudad P', '44545', 'Beatriz', 'Vargas', 'Peña'),
('sergio.romero@email.com', 'Calle 17, Ciudad Q', '55656', 'Sergio', 'Romero', 'Carrasco'),
('lucia.guzman@email.com', 'Calle 18, Ciudad R', '66767', 'Lucía', 'Guzmán', 'Rojas'),
('eduardo.acosta@email.com', 'Calle 19, Ciudad S', '77878', 'Eduardo', 'Acosta', 'Mendoza'),
('alejandra.perez@email.com', 'Calle 20, Ciudad T', '88989', 'Alejandra', 'Pérez', 'Castro'),
('manuel.fuentes@email.com', 'Calle 21, Ciudad U', '99090', 'Manuel', 'Fuentes', 'Herrera'),
('renata.cabrera@email.com', 'Calle 22, Ciudad V', '10101', 'Renata', 'Cabrera', 'Navarro'),
('sebastian.vera@email.com', 'Calle 23, Ciudad W', '21212', 'Sebastián', 'Vera', 'Ortega'),
('angela.lozano@email.com', 'Calle 24, Ciudad X', '32323', 'Ángela', 'Lozano', 'Mejía'),
('ignacio.rosales@email.com', 'Calle 25, Ciudad Y', '43434', 'Ignacio', 'Rosales', 'Salazar'),
('daniela.montoya@email.com', 'Calle 26, Ciudad Z', '54545', 'Daniela', 'Montoya', 'Guerrero'),
('esteban.luna@email.com', 'Calle 27, Ciudad A1', '65656', 'Esteban', 'Luna', 'Serrano'),
('natalia.arroyo@email.com', 'Calle 28, Ciudad B1', '76767', 'Natalia', 'Arroyo', 'Miranda'),
('francisco.leyva@email.com', 'Calle 29, Ciudad C1', '87878', 'Francisco', 'Leyva', 'Valencia'),
('valentina.saenz@email.com', 'Calle 30, Ciudad D1', '98989', 'Valentina', 'Sáenz', 'Bustamante'),
('hugo.estrada@email.com', 'Calle 31, Ciudad E1', '09090', 'Hugo', 'Estrada', 'Vega'),
('monica.salinas@email.com', 'Calle 32, Ciudad F1', '10111', 'Mónica', 'Salinas', 'Campos'),
('felipe.cortés@email.com', 'Calle 33, Ciudad G1', '20222', 'Felipe', 'Cortés', 'Delgado'),
('karla.fuentes@email.com', 'Calle 34, Ciudad H1', '30333', 'Karla', 'Fuentes', 'Ramírez'),
('oscar.barrera@email.com', 'Calle 35, Ciudad I1', '40444', 'Óscar', 'Barrera', 'Solís'),
('luisa.maldonado@email.com', 'Calle 36, Ciudad J1', '50555', 'Luisa', 'Maldonado', 'Núñez'),
('pedro.campos@email.com', 'Calle 37, Ciudad K1', '60666', 'Pedro', 'Campos', 'Reyes'),
('adriana.pacheco@email.com', 'Calle 38, Ciudad L1', '70777', 'Adriana', 'Pacheco', 'Lara'),
('victor.rubio@email.com', 'Calle 39, Ciudad M1', '80888', 'Víctor', 'Rubio', 'Estrada'),
('mariana.valenzuela@email.com', 'Calle 40, Ciudad N1', '90999', 'Mariana', 'Valenzuela', 'Soto'),
('raul.espinosa@email.com', 'Calle 41, Ciudad O1', '11100', 'Raúl', 'Espinosa', 'Acosta'),
('daniela.nunez@email.com', 'Calle 42, Ciudad P1', '22211', 'Daniela', 'Núñez', 'Moreno'),
('cristian.morales@email.com', 'Calle 43, Ciudad Q1', '33322', 'Cristian', 'Morales', 'Guerra'),
('fernanda.mendoza@email.com', 'Calle 44, Ciudad R1', '44433', 'Fernanda', 'Mendoza', 'Rosales'),
('jorge.paredes@email.com', 'Calle 45, Ciudad S1', '55544', 'Jorge', 'Paredes', 'Herrera'),
('veronica.delgado@email.com', 'Calle 46, Ciudad T1', '66655', 'Verónica', 'Delgado', 'Ávila'),
('armando.vargas@email.com', 'Calle 47, Ciudad U1', '77766', 'Armando', 'Vargas', 'López'),
('paola.reyes@email.com', 'Calle 48, Ciudad V1', '88877', 'Paola', 'Reyes', 'Gómez'),
('hector.ojeda@email.com', 'Calle 49, Ciudad W1', '99988', 'Héctor', 'Ojeda', 'García'),
('claudia.flores@email.com', 'Calle 50, Ciudad X1', '00099', 'Claudia', 'Flores', 'Mendoza');

--Insertar 50 Producto 
INSERT INTO Producto (Nombre, Precio) VALUES
('Laptop Gamer', 25000), ('Smartphone', 12000), ('Teclado Mecánico', 2500),
('Mouse Inalámbrico', 1500), ('Monitor 24"', 5000), ('Silla Ergonómica', 8500),
('Audífonos Inalámbricos', 3000), ('Cámara Web HD', 2000), ('Microondas', 3200),
('Refrigerador', 18000), ('Televisión 50"', 22000), ('Consola de Videojuegos', 15000),
('Cafetera', 2700), ('Impresora Multifuncional', 4500), ('Ventilador de Torre', 2800),
('Tablet', 7000), ('Smartwatch', 5500), ('Bocina Bluetooth', 2800), ('Mochila Antirrobo', 1900),
('Reloj Inteligente', 4200), ('Freidora de Aire', 4600), ('Horno Eléctrico', 3800),
('Plancha de Vapor', 2500), ('Bicicleta de Montaña', 12000), ('Smart TV 4K', 25000),
('Barra de Sonido', 5000), ('Celular Gama Media', 8000), ('Cámara Reflex', 27000),
('Licuadora', 3200), ('Disco Duro Externo 1TB', 4500), ('Cargador Inalámbrico', 1800),
('Escritorio Gamer', 7800), ('Base para Laptop', 1200), ('Batería Externa', 2300),
('Router WiFi 6', 6000), ('Cerradura Digital', 9000), ('Termo Inteligente', 1700),
('Altavoz Inteligente', 3500), ('Colchón Ortopédico', 15000), ('Mando para Consola', 3000),
('Cámara de Seguridad', 7500), ('Foco Inteligente', 900), ('Smart Lock', 8800),
('Dron con Cámara', 15000), ('Gafas de Realidad Virtual', 13000),
('Coche de Juguete RC', 2500), ('Proyector HD', 11000), ('Teclado Inalámbrico', 2000),
('Aspiradora Robot', 14000), ('Cargador para Auto', 1600);

--Insertar 50 Pedido 
INSERT INTO Pedido (Id_Cliente, Fecha_hecho, Estatus) VALUES
(1, '2024-03-01', 'Entregado'), (1, '2024-03-10', 'Pendiente'), (1, '2024-03-15', 'Enviado'),
(2, '2024-02-20', 'Entregado'), (2, '2024-03-05', 'Pendiente'), (2, '2024-03-18', 'Cancelado'),
(3, '2024-01-15', 'Entregado'), (3, '2024-02-12', 'Pendiente'), (3, '2024-03-22', 'Enviado'),
(4, '2024-02-25', 'Entregado'), (4, '2024-03-08', 'Pendiente'), (4, '2024-03-19', 'Cancelado'),
(5, '2024-03-02', 'Entregado'), (5, '2024-03-09', 'Pendiente'), (5, '2024-03-21', 'Cancelado'),
(6, '2024-03-12', 'Entregado'), (7, '2024-03-14', 'Pendiente'), (8, '2024-03-17', 'Cancelado'),
(9, '2024-03-19', 'Enviado'), (10, '2024-03-23', 'Pendiente'), (11, '2024-03-24', 'Cancelado'),
(12, '2024-03-25', 'Entregado'), (13, '2024-03-26', 'Pendiente'), (14, '2024-03-27', 'Enviado'),
(15, '2024-03-28', 'Entregado'), (16, '2024-03-29', 'Pendiente'), 
(17, '2024-03-30', 'Cancelado'), (18, '2024-03-31', 'Enviado'), (19, '2024-04-01', 'Pendiente'),
(20, '2024-04-02', 'Cancelado'), (21, '2024-04-03', 'Entregado'), 
(22, '2024-04-04', 'Pendiente'), (23, '2024-04-05', 'Cancelado'), (24, '2024-04-06', 'Enviado'),
(25, '2024-04-07', 'Pendiente'), (26, '2024-04-08', 'Cancelado'),
(27, '2024-04-09', 'Entregado'), (28, '2024-04-10', 'Pendiente'), (29, '2024-04-11', 'Enviado'),
(30, '2024-04-12', 'Entregado'), (31, '2024-04-13', 'Pendiente'), 
(32, '2024-04-14', 'Cancelado'), (33, '2024-04-15', 'Enviado'), (34, '2024-04-16', 'Pendiente'),
(35, '2024-04-17', 'Cancelado'), (36, '2024-04-18', 'Entregado'),
(37, '2024-04-19', 'Pendiente'), (38, '2024-04-20', 'Cancelado'),(39, '2024-04-21', 'Enviado'),
(40, '2024-04-22', 'Pendiente');

--Insertar 50 DetallePedido 
INSERT INTO DetallePedido (Id_Pedido, Id_Producto, Cantidad, Precio_Unitario) VALUES
(1, 1, 1, 25000), (1, 2, 2, 12000), (2, 3, 1, 2500), (2, 4, 3, 1500), 
(3, 5, 1, 5000), (4, 6, 1, 8500), (4, 7, 2, 3000), (5, 8, 1, 2000), (5, 9, 1, 3200),
(6, 10, 1, 18000), (7, 11, 1, 22000), (7, 12, 1, 15000), (8, 13, 2, 2700), (8, 14, 1, 4500), 
(9, 15, 1, 2800), (10, 16, 1, 7000), (10, 17, 2, 5500), (11, 18, 1, 2800), (11, 19, 1, 1900), 
(12, 20, 2, 4200), (13, 21, 1, 4600), (13, 22, 1, 3800), (14, 23, 1, 2500), (14, 24, 1, 12000),
(15, 25, 1, 25000), (16, 26, 2, 5000), (17, 27, 1, 8000), (18, 28, 1, 27000), (19, 29, 1, 3200), (20, 30, 1, 4500), (21, 31, 1, 1800), (22, 32, 1, 7800), (23, 33, 1, 1200), (24, 34, 1, 2300), (25, 35, 1, 6000), (26, 36, 1, 9000), (27, 37, 1, 1700), (28, 38, 1, 3500), (29, 39, 1, 15000),
(30, 40, 1, 3000), (31, 41, 1, 7500), (32, 42, 1, 900), (33, 43, 1, 8800), (34, 44, 1, 15000), (35, 45, 1, 13000), (36, 46, 1, 2500), (37, 47, 1, 11000), (38, 48, 1, 2000), (39, 49, 1, 14000), (40, 50, 1, 1600);

--SELECT solo
SELECT * FROM Cliente;
SELECT * FROM Producto;
SELECT * FROM Pedido;
SELECT * FROM Detallepedido;

--Query para consultar los productos comprados por un cliente específico
--Este es el query sin filtrar me quedo hermoso jaja
SELECT C.nombre AS Nombre_Cliente, 
(C.apellido_paterno || ' ' || C.apellido_materno) AS Apellidos_Cliente,
P.fecha_hecho AS Fecha_Realizado, P.estatus AS Estatus, 
D.cantidad AS Cantidad_producto, D.precio_unitario AS precio_unitario, 
D.subtotal AS subtotal, I.nombre AS NombreProducto
FROM Cliente C INNER JOIN 
Pedido P ON C.id_cliente = P.id_cliente
INNER JOIN Detallepedido D ON P.id_pedido = D.id_pedido
INNER JOIN Producto I ON D.id_producto = I.id_producto;

--Query para consultar los productos comprados por un cliente específico
--Ya con WHERE
SELECT C.id_cliente, C.nombre AS Nombre_Cliente, 
(C.apellido_paterno || ' ' || C.apellido_materno) AS Apellidos_Cliente,
P.fecha_hecho AS Fecha_Realizado, P.estatus AS Estatus, 
D.cantidad AS Cantidad_producto, D.precio_unitario AS precio_unitario, 
D.subtotal AS subtotal, I.nombre AS NombreProducto
FROM Cliente C INNER JOIN  Pedido P ON C.id_cliente = P.id_cliente
INNER JOIN Detallepedido D ON P.id_pedido = D.id_pedido
INNER JOIN Producto I ON D.id_producto = I.id_producto 
WHERE C.id_cliente IN (1);

--Variante Uno (ORDER BY)
SELECT C.id_cliente, C.nombre AS Nombre_Cliente, 
(C.apellido_paterno || ' ' || C.apellido_materno) AS Apellidos_Cliente,
P.fecha_hecho AS Fecha_Realizado, P.estatus AS Estatus, 
D.cantidad AS Cantidad_producto, D.precio_unitario AS precio_unitario, 
D.subtotal AS subtotal, I.nombre AS NombreProducto
FROM Cliente C INNER JOIN  Pedido P ON C.id_cliente = P.id_cliente
INNER JOIN Detallepedido D ON P.id_pedido = D.id_pedido
INNER JOIN Producto I ON D.id_producto = I.id_producto 
WHERE C.id_cliente IN (1)
ORDER BY P.estatus;

--Variante Dos (LIKE)
SELECT C.id_cliente, C.nombre AS Nombre_Cliente, 
(C.apellido_paterno || ' ' || C.apellido_materno) AS Apellidos_Cliente,
P.fecha_hecho AS Fecha_Realizado, P.estatus AS Estatus, 
D.cantidad AS Cantidad_producto, D.precio_unitario AS precio_unitario, 
D.subtotal AS subtotal, I.nombre AS NombreProducto
FROM Cliente C INNER JOIN 
Pedido P ON C.id_cliente = P.id_cliente
INNER JOIN Detallepedido D ON P.id_pedido = D.id_pedido
INNER JOIN Producto I ON D.id_producto = I.id_producto 
WHERE P.estatus LIKE 'P%';

--Variante Tres (GROUP BY)
SELECT C.id_cliente, C.nombre AS Nombre_Cliente, 
(C.apellido_paterno || ' ' || C.apellido_materno) AS Apellidos_Cliente,
P.fecha_hecho AS Fecha_Realizado, P.estatus AS Estatus, 
D.cantidad AS Cantidad_producto, D.precio_unitario AS precio_unitario, 
D.subtotal AS subtotal, I.nombre AS NombreProducto
FROM Cliente C INNER JOIN 
Pedido P ON C.id_cliente = P.id_cliente
INNER JOIN Detallepedido D ON P.id_pedido = D.id_pedido
INNER JOIN Producto I ON D.id_producto = I.id_producto
GROUP BY C.id_cliente, C.nombre, C.apellido_paterno, C.apellido_materno, 
P.fecha_hecho, P.estatus, D.cantidad, D.precio_unitario, D.subtotal, I.nombre;
