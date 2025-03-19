-- Crear tabla Usuario
CREATE TABLE Usuario (
    id_usuario SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido_p VARCHAR(50) NOT NULL,
    apellido_m VARCHAR(50),
    correo VARCHAR(100) UNIQUE NOT NULL,
    telefono VARCHAR(20),
    direccion TEXT
);
-- Crear tabla Libro
CREATE TABLE Libro (
    id_libro SERIAL PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    editorial VARCHAR(100),
    anno_publicacion INT,
    isbn VARCHAR(20) UNIQUE NOT NULL,
    disponible VARCHAR(10) CHECK (disponible IN ('Disponible', 'Prestado')) NOT NULL DEFAULT 'Disponible'
);
-- Crear tabla Préstamo 
CREATE TABLE Prestamo (
    id_prestamo SERIAL PRIMARY KEY,
    id_usuario INT NOT NULL REFERENCES Usuario(id_usuario) ON DELETE CASCADE,
    id_libro INT NOT NULL REFERENCES Libro(id_libro) ON DELETE CASCADE,
    fecha_prestamo DATE NOT NULL DEFAULT CURRENT_DATE,
    fecha_devolucion DATE,
    estatus VARCHAR(15) CHECK (estatus IN ('En curso', 'Devuelto', 'Retrasado')) NOT NULL DEFAULT 'En curso'
);



--Insert 50 registros a tabla Usuario
INSERT INTO Usuario (nombre, apellido_p, apellido_m, correo, telefono, direccion) VALUES
('Juan', 'Pérez', 'López', 'juan.perez1@example.com', '555-0001', 'Calle 1, Ciudad A'),
('María', 'Gómez', 'Ramírez', 'maria.gomez2@example.com', '555-0002', 'Calle 2, Ciudad B'),
('Carlos', 'López', 'Fernández', 'carlos.lopez3@example.com', '555-0003', 'Calle 3, Ciudad C'),
('Ana', 'Martínez', 'González', 'ana.martinez4@example.com', '555-0004', 'Calle 4, Ciudad D'),
('Pedro', 'Rodríguez', 'Santos', 'pedro.rodriguez5@example.com', '555-0005', 'Calle 5, Ciudad E'),
('Luis', 'Fernández', 'Torres', 'luis.fernandez6@example.com', '555-0006', 'Calle 6, Ciudad F'),
('Sofía', 'Jiménez', 'Castro', 'sofia.jimenez7@example.com', '555-0007', 'Calle 7, Ciudad G'),
('Javier', 'Ruiz', 'Ramos', 'javier.ruiz8@example.com', '555-0008', 'Calle 8, Ciudad H'),
('Isabel', 'Díaz', 'Morales', 'isabel.diaz9@example.com', '555-0009', 'Calle 9, Ciudad I'),
('Miguel', 'Hernández', 'Ortiz', 'miguel.hernandez10@example.com', '555-0010', 'Calle 10, Ciudad J'),
('Laura', 'Sánchez', 'Vega', 'laura.sanchez11@example.com', '555-0011', 'Calle 11, Ciudad K'),
('Daniel', 'Cabrera', 'Pérez', 'daniel.cabrera12@example.com', '555-0012', 'Calle 12, Ciudad L'),
('Patricia', 'Navarro', 'Mendoza', 'patricia.navarro13@example.com', '555-0013', 'Calle 13, Ciudad M'),
('Gabriel', 'Ortega', 'Fuentes', 'gabriel.ortega14@example.com', '555-0014', 'Calle 14, Ciudad N'),
('Andrea', 'Salinas', 'Luna', 'andrea.salinas15@example.com', '555-0015', 'Calle 15, Ciudad O'),
('Fernando', 'Mendoza', 'Jiménez', 'fernando.mendoza16@example.com', '555-0016', 'Calle 16, Ciudad P'),
('Rosa', 'Paredes', 'Vargas', 'rosa.paredes17@example.com', '555-0017', 'Calle 17, Ciudad Q'),
('Jorge', 'Castaño', 'Ramos', 'jorge.castano18@example.com', '555-0018', 'Calle 18, Ciudad R'),
('Beatriz', 'Fuentes', 'Ríos', 'beatriz.fuentes19@example.com', '555-0019', 'Calle 19, Ciudad S'),
('Enrique', 'Delgado', 'Suárez', 'enrique.delgado20@example.com', '555-0020', 'Calle 20, Ciudad T'),
('Tomás', 'Estrada', 'Pérez', 'tomas.estrada21@example.com', '555-0021', 'Calle 21, Ciudad U'),
('Gloria', 'Montoya', 'García', 'gloria.montoya22@example.com', '555-0022', 'Calle 22, Ciudad V'),
('Alfredo', 'Miranda', 'Peña', 'alfredo.miranda23@example.com', '555-0023', 'Calle 23, Ciudad W'),
('Cristina', 'Cervantes', 'Duarte', 'cristina.cervantes24@example.com', '555-0024', 'Calle 24, Ciudad X'),
('Antonio', 'Zapata', 'Lara', 'antonio.zapata25@example.com', '555-0025', 'Calle 25, Ciudad Y'),
('Elena', 'Aguilar', 'Ríos', 'elena.aguilar26@example.com', '555-0026', 'Calle 26, Ciudad Z'),
('Julián', 'Núñez', 'Fajardo', 'julian.nunez27@example.com', '555-0027', 'Calle 27, Ciudad A1'),
('Sara', 'Arce', 'Beltrán', 'sara.arce28@example.com', '555-0028', 'Calle 28, Ciudad B1'),
('Ricardo', 'Barrera', 'Cortes', 'ricardo.barrera29@example.com', '555-0029', 'Calle 29, Ciudad C1'),
('Verónica', 'Romero', 'Mena', 'veronica.romero30@example.com', '555-0030', 'Calle 30, Ciudad D1'),
('Pablo', 'Mora', 'Guzmán', 'pablo.mora31@example.com', '555-0031', 'Calle 31, Ciudad E1'),
('Camila', 'Rueda', 'Solís', 'camila.rueda32@example.com', '555-0032', 'Calle 32, Ciudad F1'),
('Gustavo', 'Valencia', 'Rocha', 'gustavo.valencia33@example.com', '555-0033', 'Calle 33, Ciudad G1'),
('Montserrat', 'Bustos', 'Herrera', 'montserrat.bustos34@example.com', '555-0034', 'Calle 34, Ciudad H1'),
('Hugo', 'Duarte', 'Ibarra', 'hugo.duarte35@example.com', '555-0035', 'Calle 35, Ciudad I1'),
('Luisa', 'Maldonado', 'Trejo', 'luisa.maldonado36@example.com', '555-0036', 'Calle 36, Ciudad J1'),
('Ernesto', 'Silva', 'Medina', 'ernesto.silva37@example.com', '555-0037', 'Calle 37, Ciudad K1'),
('Marina', 'López', 'Segovia', 'marina.lopez38@example.com', '555-0038', 'Calle 38, Ciudad L1'),
('Sebastián', 'Ramírez', 'Ochoa', 'sebastian.ramirez39@example.com', '555-0039', 'Calle 39, Ciudad M1'),
('Nadia', 'Villanueva', 'Acevedo', 'nadia.villanueva40@example.com', '555-0040', 'Calle 40, Ciudad N1'),
('César', 'Beltrán', 'Lugo', 'cesar.beltran41@example.com', '555-0041', 'Calle 41, Ciudad O1'),
('Julia', 'Orozco', 'Amaya', 'julia.orozco42@example.com', '555-0042', 'Calle 42, Ciudad P1'),
('Raúl', 'Vega', 'Navarro', 'raul.vega43@example.com', '555-0043', 'Calle 43, Ciudad Q1'),
('Silvia', 'Benítez', 'Reyes', 'silvia.benitez44@example.com', '555-0044', 'Calle 44, Ciudad R1'),
('Adrián', 'Sosa', 'Peralta', 'adrian.sosa45@example.com', '555-0045', 'Calle 45, Ciudad S1'),
('Valeria', 'Quintana', 'Esquivel', 'valeria.quintana46@example.com', '555-0046', 'Calle 46, Ciudad T1'),
('Manuel', 'Farfán', 'Estrada', 'manuel.farfan47@example.com', '555-0047', 'Calle 47, Ciudad U1'),
('Yolanda', 'Cardenas', 'Palacios', 'yolanda.cardenas48@example.com', '555-0048', 'Calle 48, Ciudad V1'),
('Emiliano', 'Espinoza', 'Hernández', 'emiliano.espinoza49@example.com', '555-0049', 'Calle 49, Ciudad W1'),
('Paula', 'Rosales', 'Salazar', 'paula.rosales50@example.com', '555-0050', 'Calle 50, Ciudad X1');

--Insert 50 registros a tabla Libro
INSERT INTO Libro (titulo, autor, editorial, anno_publicacion, isbn, disponible) VALUES
('Cien años de soledad', 'Gabriel García Márquez', 'Sudamericana', 1967, '978-0307474728', 'Disponible'),
('Don Quijote de la Mancha', 'Miguel de Cervantes', 'Francisco de Robles', 1605, '978-8491050410', 'Disponible'),
('1984', 'George Orwell', 'Secker & Warburg', 1949, '978-0451524935', 'Disponible'),
('Orgullo y prejuicio', 'Jane Austen', 'T. Egerton', 1813, '978-1503290563', 'Disponible'),
('El principito', 'Antoine de Saint-Exupéry', 'Reynal & Hitchcock', 1943, '978-0156012195', 'Prestado'),
('Crónica de una muerte anunciada', 'Gabriel García Márquez', 'Editorial Bruguera', 1981, '978-0307387134', 'Disponible'),
('Fahrenheit 451', 'Ray Bradbury', 'Ballantine Books', 1953, '978-1451673319', 'Disponible'),
('Moby-Dick', 'Herman Melville', 'Harper & Brothers', 1851, '978-1503280786', 'Prestado'),
('La sombra del viento', 'Carlos Ruiz Zafón', 'Planeta', 2001, '978-8408163353', 'Disponible'),
('El alquimista', 'Paulo Coelho', 'HarperTorch', 1988, '978-0062315007', 'Disponible'),
('La odisea', 'Homero', 'Penguin Classics', -800, '978-0140268867', 'Disponible'),
('El nombre del viento', 'Patrick Rothfuss', 'DAW Books', 2007, '978-0756404741', 'Prestado'),
('Los juegos del hambre', 'Suzanne Collins', 'Scholastic Press', 2008, '978-0439023528', 'Disponible'),
('El código Da Vinci', 'Dan Brown', 'Doubleday', 2003, '978-0307474278', 'Disponible'),
('Las ventajas de ser invisible', 'Stephen Chbosky', 'MTV Books', 1999, '978-1451696202', 'Prestado'),
('Bajo la misma estrella', 'John Green', 'Dutton Books', 2012, '978-0142424179', 'Disponible'),
('Drácula', 'Bram Stoker', 'Archibald Constable and Company', 1897, '978-0486411095', 'Disponible'),
('El retrato de Dorian Gray', 'Oscar Wilde', 'Lippincott’s Monthly Magazine', 1890, '978-0486278070', 'Disponible'),
('El señor de los anillos', 'J.R.R. Tolkien', 'Allen & Unwin', 1954, '978-0261102385', 'Disponible'),
('Harry Potter y la piedra filosofal', 'J.K. Rowling', 'Bloomsbury', 1997, '978-8478884452', 'Prestado'),
('El hobbit', 'J.R.R. Tolkien', 'Allen & Unwin', 1937, '978-0547928227', 'Disponible'),
('Crimen y castigo', 'Fiódor Dostoievski', 'The Russian Messenger', 1866, '978-0143058144', 'Disponible'),
('La Divina Comedia', 'Dante Alighieri', 'Niccolò di Lorenzo', 1320, '978-0451208637', 'Prestado'),
('La casa de los espíritus', 'Isabel Allende', 'Plaza & Janés', 1982, '978-8401017851', 'Disponible'),
('Los miserables', 'Victor Hugo', 'A. Lacroix', 1862, '978-0451419435', 'Disponible'),
('El perfume', 'Patrick Süskind', 'Diogenes Verlag', 1985, '978-0375725845', 'Prestado'),
('Ensayo sobre la ceguera', 'José Saramago', 'Editorial Caminho', 1995, '978-0156007757', 'Disponible'),
('It', 'Stephen King', 'Viking', 1986, '978-1501142970', 'Disponible'),
('El resplandor', 'Stephen King', 'Doubleday', 1977, '978-0307743657', 'Prestado'),
('American Gods', 'Neil Gaiman', 'William Morrow', 2001, '978-0062572233', 'Disponible'),
('Cementerio de animales', 'Stephen King', 'Doubleday', 1983, '978-1501195433', 'Disponible'),
('Fundación', 'Isaac Asimov', 'Gnome Press', 1951, '978-0553293357', 'Prestado'),
('Dune', 'Frank Herbert', 'Chilton Books', 1965, '978-0441172719', 'Disponible'),
('Neuromante', 'William Gibson', 'Ace Books', 1984, '978-0441569595', 'Disponible'),
('El marciano', 'Andy Weir', 'Crown Publishing', 2011, '978-0553418026', 'Prestado'),
('Ready Player One', 'Ernest Cline', 'Crown Publishing', 2011, '978-0307887445', 'Disponible'),
('Hyperion', 'Dan Simmons', 'Doubleday', 1989, '978-0553283686', 'Disponible'),
('Jurassic Park', 'Michael Crichton', 'Alfred A. Knopf', 1990, '978-0345538987', 'Disponible'),
('La historia interminable', 'Michael Ende', 'Thienemann Verlag', 1979, '978-0140386332', 'Prestado'),
('El extranjero', 'Albert Camus', 'Gallimard', 1942, '978-0679720201', 'Disponible'),
('Rebelión en la granja', 'George Orwell', 'Secker and Warburg', 1945, '978-0451526348', 'Disponible'),
('La carretera', 'Cormac McCarthy', 'Alfred A. Knopf', 2006, '978-0307387891', 'Prestado'),
('El amante japonés', 'Isabel Allende', 'Plaza & Janés', 2015, '978-1501116971', 'Disponible'),
('El hombre en busca de sentido', 'Viktor Frankl', 'Beacon Press', 1946, '978-0807014295', 'Disponible'),
('Los detectives salvajes', 'Roberto Bolaño', 'Editorial Anagrama', 1998, '978-8433922561', 'Prestado'),
('La ciudad y los perros', 'Mario Vargas Llosa', 'Seix Barral', 1963, '978-8432209175', 'Disponible'),
('Rayuela', 'Julio Cortázar', 'Editorial Sudamericana', 1963, '978-8437602452', 'Disponible'),
('Los pilares de la Tierra', 'Ken Follett', 'Macmillan', 1989, '978-0451166896', 'Disponible');

--Insert 50 registros a tabla Prestamo
INSERT INTO Prestamo (id_usuario, id_libro, fecha_prestamo, fecha_devolucion, estatus) VALUES
(1, 5, '2024-03-10', '2024-03-24', 'En curso'),
(2, 12, '2024-03-12', '2024-03-26', 'En curso'),
(3, 21, '2024-03-15', '2024-03-29', 'En curso'),
(4, 8, '2024-03-18', '2024-04-01', 'En curso'),
(5, 15, '2024-03-20', '2024-04-03', 'En curso'),
(6, 3, '2024-03-22', '2024-04-05', 'En curso'),
(7, 18, '2024-03-25', '2024-04-08', 'En curso'),
(8, 27, '2024-03-27', '2024-04-10', 'En curso'),
(9, 36, '2024-03-30', '2024-04-13', 'En curso'),
(10, 45, '2024-04-02', '2024-04-16', 'En curso'),
(11, 7, '2024-04-05', '2024-04-19', 'En curso'),
(12, 14, '2024-04-07', '2024-04-21', 'En curso'),
(13, 22, '2024-04-10', '2024-04-24', 'En curso'),
(14, 30, '2024-04-12', '2024-04-26', 'En curso'),
(15, 39, '2024-04-15', '2024-04-29', 'En curso'),
(16, 48, '2024-04-18', '2024-05-02', 'En curso'),
(17, 2, '2024-04-20', '2024-05-04', 'En curso'),
(18, 11, '2024-04-22', '2024-05-06', 'En curso'),
(19, 19, '2024-04-25', '2024-05-09', 'En curso'),
(20, 26, '2024-04-27', '2024-05-11', 'En curso'),
(21, 34, '2024-02-10', '2024-02-25', 'Devuelto'),
(22, 41, '2024-02-12', '2024-02-27', 'Devuelto'),
(23, 47, '2024-02-15', '2024-03-02', 'Devuelto'),
(24, 6, '2024-02-17', '2024-03-04', 'Devuelto'),
(25, 13, '2024-02-20', '2024-03-07', 'Devuelto'),
(26, 20, '2024-02-22', '2024-03-09', 'Devuelto'),
(27, 28, '2024-02-25', '2024-03-12', 'Devuelto'),
(28, 35, '2024-02-27', '2024-03-14', 'Devuelto'),
(29, 44, '2024-03-01', '2024-03-16', 'Devuelto'),
(30, 18, '2024-03-04', '2024-03-19', 'Devuelto'),
(31, 9, '2024-03-06', '2024-03-21', 'Devuelto'),
(32, 17, '2024-03-09', '2024-03-24', 'Devuelto'),
(33, 24, '2024-03-11', '2024-03-26', 'Devuelto'),
(34, 32, '2024-03-14', '2024-03-29', 'Devuelto'),
(35, 40, '2024-03-16', '2024-03-31', 'Devuelto'),
(36, 47, '2024-03-19', '2024-04-03', 'Devuelto'),
(37, 4, '2024-03-21', '2024-04-05', 'Devuelto'),
(38, 10, '2024-03-24', '2024-04-08', 'Devuelto'),
(39, 23, '2024-03-26', '2024-04-10', 'Devuelto'),
(40, 31, '2024-03-29', '2024-04-13', 'Devuelto'),
(41, 38, '2024-03-01', '2024-03-15', 'Retrasado'),
(42, 46, '2024-03-03', '2024-03-17', 'Retrasado'),
(43, 1, '2024-03-05', '2024-03-19', 'Retrasado'),
(44, 16, '2024-03-07', '2024-03-21', 'Retrasado'),
(45, 25, '2024-03-09', '2024-03-23', 'Retrasado'),
(46, 33, '2024-03-11', '2024-03-25', 'Retrasado'),
(47, 42, '2024-03-13', '2024-03-27', 'Retrasado'),
(48, 29, '2024-03-15', '2024-03-29', 'Retrasado'),
(49, 37, '2024-03-17', '2024-03-31', 'Retrasado'),
(50, 43, '2024-03-19', '2024-04-02', 'Retrasado');



--SELECT Solo
SELECT * FROM Usuario;
SELECT * FROM Libro;
SELECT * FROM Prestamo;

--Query para ver los prestamos activos(En este caso sería "En Curso") de un usuario
SELECT U.id_usuario AS Clave_User, U.nombre AS Nombre_User, 
(U.apellido_p || ' ' || U.apellido_m) AS Apellidos_User, P.id_libro AS Clave_libro,
P.fecha_prestamo AS fecha_prestamo, P.fecha_devolucion AS fecha_devolucion, 
(P.fecha_devolucion - P.fecha_prestamo) AS Dias_prestado, P.estatus AS estatus_libro
FROM Usuario U INNER JOIN Prestamo P ON U.id_usuario = P.id_usuario 
WHERE U.id_usuario IN (1) AND P.estatus IN ('En curso');
--Como solo tengo un préstamo en curso solo aparece uno, pero si tuviera más aparecerian

--Variante uno (ORDER BY)
SELECT U.id_usuario AS Clave_User, U.nombre AS Nombre_User, 
(U.apellido_p || ' ' || U.apellido_m) AS Apellidos_User, P.id_libro AS Clave_libro,
P.fecha_prestamo AS fecha_prestamo, P.fecha_devolucion AS fecha_devolucion, 
(P.fecha_devolucion - P.fecha_prestamo) AS Dias_prestado, P.estatus AS estatus_libro
FROM Usuario U INNER JOIN Prestamo P ON U.id_usuario = P.id_usuario 
WHERE P.estatus IN ('En curso')
ORDER BY P.fecha_prestamo DESC;

--Variante dos (LIKE)
SELECT U.id_usuario AS Clave_User, U.nombre AS Nombre_User, 
(U.apellido_p || ' ' || U.apellido_m) AS Apellidos_User, P.id_libro AS Clave_libro,
P.fecha_prestamo AS fecha_prestamo, P.fecha_devolucion AS fecha_devolucion, 
(P.fecha_devolucion - P.fecha_prestamo) AS Dias_prestado, P.estatus AS estatus_libro
FROM Usuario U INNER JOIN Prestamo P ON U.id_usuario = P.id_usuario 
WHERE P.estatus LIKE 'R%' ORDER BY P.fecha_prestamo DESC;

--Variante tres (GROUP BY)
SELECT U.id_usuario AS Clave_User, U.nombre AS Nombre_User, 
(U.apellido_p || ' ' || U.apellido_m) AS Apellidos_User, P.id_libro AS Clave_libro,
P.fecha_prestamo AS fecha_prestamo, P.fecha_devolucion AS fecha_devolucion, 
(P.fecha_devolucion - P.fecha_prestamo) AS Dias_prestado, P.estatus AS estatus_libro
FROM Usuario U INNER JOIN Prestamo P ON U.id_usuario = P.id_usuario 
WHERE P.estatus LIKE 'D%' GROUP BY U.id_usuario, U.nombre, U.apellido_p, 
U.apellido_m, P.id_libro, P.fecha_prestamo, P.fecha_devolucion, P.estatus;
