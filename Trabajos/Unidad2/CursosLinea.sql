-- Crear tabla Usuario
CREATE TABLE Usuario (
    Id_Usuario SERIAL PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Correo VARCHAR(100) UNIQUE NOT NULL,
    Contrasena VARCHAR(255) NOT NULL
);
-- Crear tabla Curso
CREATE TABLE Curso (
    Id_Curso SERIAL PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Descripcion TEXT,
    Duracion INT CHECK (Duracion > 0), -- Duración en horas
    Instructor VARCHAR(100) NOT NULL
);
-- Crear tabla Inscripción
CREATE TABLE Inscripcion (
    Id_Inscripcion SERIAL PRIMARY KEY,
    Id_Usuario INT NOT NULL REFERENCES Usuario(Id_Usuario) ON DELETE CASCADE,
    Id_Curso INT NOT NULL REFERENCES Curso(Id_Curso) ON DELETE CASCADE,
    Fecha_Inscripcion DATE NOT NULL DEFAULT CURRENT_DATE,
    Estado VARCHAR(15) CHECK (Estado IN ('Inscrito', 'Completado', 'Cancelado')) NOT NULL DEFAULT 'Inscrito'
);
-- INSERT en la tabla Usuario
INSERT INTO Usuario (Nombre, Apellido, Correo, Contrasena) VALUES
('Juan', 'Pérez', 'juan.perez@email.com', 'password123'),
('María', 'Gómez', 'maria.gomez@email.com', 'pass456'),
('Carlos', 'López', 'carlos.lopez@email.com', 'clave789'),
('Ana', 'Fernández', 'ana.fernandez@email.com', 'seguro123'),
('Pedro', 'Rodríguez', 'pedro.rodriguez@email.com', 'abc321'),
('Laura', 'Díaz', 'laura.diaz@email.com', 'xyz456'),
('José', 'Martínez', 'jose.martinez@email.com', 'qwerty789'),
('Sofía', 'Hernández', 'sofia.hernandez@email.com', 'clave987'),
('Miguel', 'Torres', 'miguel.torres@email.com', 'pass852'),
('Elena', 'Ruiz', 'elena.ruiz@email.com', 'seguro741'),
('David', 'Ramírez', 'david.ramirez@email.com', 'abc654'),
('Carmen', 'Jiménez', 'carmen.jimenez@email.com', 'xyz963'),
('Andrés', 'Morales', 'andres.morales@email.com', 'pass159'),
('Paula', 'Ortega', 'paula.ortega@email.com', 'clave357'),
('Ricardo', 'Navarro', 'ricardo.navarro@email.com', 'seguro258'),
('Beatriz', 'Rojas', 'beatriz.rojas@email.com', 'qwerty654'),
('Francisco', 'Santos', 'francisco.santos@email.com', 'abc753'),
('Natalia', 'Castro', 'natalia.castro@email.com', 'xyz159'),
('Luis', 'Vargas', 'luis.vargas@email.com', 'pass357'),
('Gabriela', 'Mendoza', 'gabriela.mendoza@email.com', 'seguro951');
-- INSERT para tabla Curso 
INSERT INTO Curso (Nombre, Descripcion, Duracion, Instructor) VALUES
('Matemáticas Básicas', 'Curso de fundamentos matemáticos', 40, 'Prof. González'),
('Programación en Python', 'Introducción a Python desde cero', 50, 'Ing. Ramírez'),
('Historia Universal', 'Repaso de los eventos más importantes', 35, 'Dra. Ortega'),
('Diseño Gráfico', 'Principios de diseño y herramientas', 45, 'Mtro. Navarro'),
('Bases de Datos', 'Modelado y administración de bases de datos', 60, 'Dr. Martínez'),
('Física para Ingenieros', 'Conceptos avanzados de física', 55, 'Prof. Sánchez'),
('Inteligencia Artificial', 'Conceptos y aplicaciones de la IA', 70, 'Ing. Torres'),
('Desarrollo Web', 'HTML, CSS, JS y frameworks', 65, 'Lic. Fernández');

-- INSERT para tabla Inscripcion 
INSERT INTO Inscripcion (Id_Usuario, Id_Curso, Fecha_Inscripcion, Estado) VALUES
(1, 1, '2024-01-10', 'Inscrito'), (1, 2, '2024-01-12', 'Completado'),(1, 5, '2024-02-15', 'Inscrito'),
(2, 3, '2024-01-20', 'Inscrito'),(2, 6, '2024-02-05', 'Completado'),(2, 7, '2024-02-18', 'Inscrito'),
(2, 8, '2024-03-01', 'Inscrito'),(3, 2, '2024-02-01', 'Completado'),(3, 5, '2024-02-10', 'Inscrito'),
(3, 6, '2024-02-15', 'Inscrito'),(3, 7, '2024-03-01', 'Inscrito'),(4, 1, '2024-02-12', 'Inscrito'),
(4, 3, '2024-02-25', 'Inscrito'),(4, 4, '2024-03-05', 'Completado'),
(5, 2, '2024-01-15', 'Completado'),(5, 4, '2024-01-20', 'Inscrito'),(5, 5, '2024-02-28', 'Inscrito'),
(5, 6, '2024-03-10', 'Inscrito'),(5, 7, '2024-03-15', 'Inscrito'),(6, 3, '2024-02-05', 'Completado'),
(6, 5, '2024-02-15', 'Inscrito'),(6, 8, '2024-02-28', 'Inscrito'),(7, 1, '2024-02-10', 'Inscrito'),
(7, 3, '2024-02-20', 'Inscrito'),(7, 4, '2024-02-28', 'Completado'),(7, 6, '2024-03-05', 'Inscrito'),
(7, 8, '2024-03-10', 'Inscrito'),(8, 2, '2024-02-08', 'Completado'),(8, 5, '2024-02-18', 'Inscrito'),
(8, 7, '2024-02-28', 'Inscrito'),(8, 8, '2024-03-08', 'Inscrito'),(9, 1, '2024-02-12', 'Inscrito'),
(9, 3, '2024-02-25', 'Inscrito'),(9, 4, '2024-03-05', 'Completado'),(9, 7, '2024-03-15', 'Inscrito'),
(10, 2, '2024-01-15', 'Completado'),(10, 4, '2024-01-20', 'Inscrito'),
(10, 5, '2024-02-28', 'Inscrito'),(10, 6, '2024-03-10', 'Inscrito'),
(11, 3, '2024-02-05', 'Completado'),(11, 5, '2024-02-15', 'Inscrito'),
(11, 8, '2024-02-28', 'Inscrito'),(12, 1, '2024-02-10', 'Inscrito'),
(12, 3, '2024-02-20', 'Inscrito'),(12, 4, '2024-02-28', 'Completado'),
(12, 6, '2024-03-05', 'Inscrito'),(12, 8, '2024-03-10', 'Inscrito'),
(13, 2, '2024-02-08', 'Completado'),(13, 5, '2024-02-18', 'Inscrito'),
(13, 7, '2024-02-28', 'Inscrito'),(13, 8, '2024-03-08', 'Inscrito'),
(14, 1, '2024-02-12', 'Inscrito'),(14, 3, '2024-02-25', 'Inscrito'),
(14, 4, '2024-03-05', 'Completado'),(14, 7, '2024-03-15', 'Inscrito'),
(15, 2, '2024-01-15', 'Completado'),(15, 4, '2024-01-20', 'Inscrito'),
(15, 5, '2024-02-28', 'Inscrito'),(15, 6, '2024-03-10', 'Inscrito');

--SELECT Solo
SELECT * FROM usuario;
SELECT * FROM curso;
SELECT * FROM inscripcion;

--Consultar los cursos inscritos por un usuario
SELECT U.id_usuario AS clave_user, U.nombre AS Nombre_user, U.apellido AS Apellido_user, 
I.fecha_inscripcion AS fecha_inscripcion, I.estado AS Estado_curso, 
C.nombre AS nombre_curso, C.duracion AS Duracion_horas, C.instructor AS profesor
FROM Usuario U INNER JOIN Inscripcion I ON U.id_usuario = I.id_usuario
INNER JOIN Curso C ON I.id_curso = C.id_curso
WHERE I.estado IN ('Inscrito') AND U.id_usuario IN (1);

--Variantes uno (ORDER BY)
SELECT U.id_usuario AS clave_user, U.nombre AS Nombre_user, U.apellido AS Apellido_user, 
I.fecha_inscripcion AS fecha_inscripcion, I.estado AS Estado_curso, 
C.nombre AS nombre_curso, C.duracion AS Duracion_horas, C.instructor AS profesor
FROM Usuario U INNER JOIN Inscripcion I ON U.id_usuario = I.id_usuario
INNER JOIN Curso C ON I.id_curso = C.id_curso
WHERE I.estado IN ('Inscrito') AND U.id_usuario IN (1)
ORDER BY C.nombre;

--Variantes dos (LIKE)
SELECT U.id_usuario AS clave_user, U.nombre AS Nombre_user, U.apellido AS Apellido_user, 
I.fecha_inscripcion AS fecha_inscripcion, I.estado AS Estado_curso, 
C.nombre AS nombre_curso, C.duracion AS Duracion_horas, C.instructor AS profesor
FROM Usuario U INNER JOIN Inscripcion I ON U.id_usuario = I.id_usuario
INNER JOIN Curso C ON I.id_curso = C.id_curso
WHERE I.estado LIKE 'C%'
ORDER BY C.nombre;

--Variantes tres (GROUP BY)
SELECT U.id_usuario AS clave_user, U.nombre AS Nombre_user, U.apellido AS Apellido_user, 
I.fecha_inscripcion AS fecha_inscripcion, I.estado AS Estado_curso, 
C.nombre AS nombre_curso, C.duracion AS Duracion_horas, C.instructor AS profesor
FROM Usuario U INNER JOIN Inscripcion I ON U.id_usuario = I.id_usuario
INNER JOIN Curso C ON I.id_curso = C.id_curso
WHERE I.estado LIKE 'C%'
GROUP BY U.id_usuario, U.nombre, U.apellido, I.fecha_inscripcion, 
I.estado, C.nombre, C.duracion, C.instructor;