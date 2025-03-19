--Crear tabla de Pacientes
CREATE TABLE Paciente (
    id_paciente SERIAL PRIMARY KEY,
    nombres VARCHAR(100) NOT NULL,
    apellido_p VARCHAR(100) NOT NULL,
    apellido_m VARCHAR(100) NOT NULL
);

--Crear tabla de Médicos
CREATE TABLE Medico (
    id_medico SERIAL PRIMARY KEY,
    nombres VARCHAR(100) NOT NULL,
    apellido_p VARCHAR(100) NOT NULL,
    apellido_m VARCHAR(100) NOT NULL
);

--Crear tabla de Citas
CREATE TABLE Cita (
    id_cita SERIAL PRIMARY KEY,
    id_paciente INT NOT NULL,
    id_medico INT NOT NULL,
    fecha_atendido DATE,
    FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente) ON DELETE CASCADE,
    FOREIGN KEY (id_medico) REFERENCES Medico(id_medico) ON DELETE CASCADE
);

--Crear tabla de Especialidades
CREATE TABLE Especialidad (
    id_especialidad SERIAL PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL
);

--Crear tabla de Tratamientos
CREATE TABLE Tratamiento (
    id_tratamiento SERIAL PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL
);

--Crear tabla intermedia entre Médico y Especialidad
CREATE TABLE Medic_Especi (
    id_medico INT,
    id_especialidad INT,
    PRIMARY KEY (id_medico, id_especialidad),
    FOREIGN KEY (id_medico) REFERENCES Medico(id_medico) ON DELETE CASCADE,
    FOREIGN KEY (id_especialidad) REFERENCES Especialidad(id_especialidad) ON DELETE CASCADE
);

-- Crear tabla intermedia entre Cita y Tratamiento
CREATE TABLE Cita_Tratami (
    id_cita INT,
    id_tratamiento INT,
    PRIMARY KEY (id_cita, id_tratamiento),
    FOREIGN KEY (id_cita) REFERENCES Cita(id_cita) ON DELETE CASCADE,
    FOREIGN KEY (id_tratamiento) REFERENCES Tratamiento(id_tratamiento) ON DELETE CASCADE
);

--Inserción de 50 registros para la tabla Paciente 
INSERT INTO Paciente (nombres, apellido_p, apellido_m) VALUES
('Juan', 'Pérez', 'Gómez'), ('María', 'López', 'Martínez'), ('Carlos', 'González', 'Rodríguez'),
('Ana', 'Fernández', 'Sánchez'), ('Luis', 'Ramírez', 'Hernández'), ('Sofía', 'Torres', 'Díaz'),
('Miguel', 'Vargas', 'Castro'), ('Laura', 'Ortega', 'Morales'), ('Pedro', 'Silva', 'Ramos'),
('Carmen', 'Navarro', 'Mendoza'), ('Daniel', 'Reyes', 'Flores'), ('Elena', 'Cabrera', 'Jiménez'),
('Roberto', 'Molina', 'Aguilar'), ('Lucía', 'Romero', 'Guzmán'), ('Javier', 'Delgado', 'Paredes'),
('Paola', 'Fuentes', 'Cortés'), ('Raúl', 'Herrera', 'Suárez'), ('Patricia', 'Blanco', 'Peña'),
('Andrés', 'Ríos', 'Valenzuela'), ('Gabriela', 'Soto', 'Arce'), ('Héctor', 'Mejía', 'Escobar'),
('Verónica', 'Salazar', 'Carrillo'), ('Fernando', 'Guerra', 'Maldonado'), 
('Monica', 'Arias', 'Bravo'), ('Eduardo', 'Paredes', 'Villanueva'), ('Julia', 'Benítez', 'Lara'),
('Diego', 'Miranda', 'Esquivel'), ('Estefanía', 'Chávez', 'Méndez'), 
('José', 'Domínguez', 'Pérez'), ('Beatriz', 'Acosta', 'Jiménez'),
('Oscar', 'Campos', 'Mora'), ('Cecilia', 'Valdés', 'Herrera'), ('Manuel', 'Correa', 'López'),
('Rosa', 'Méndez', 'Vega'), ('Antonio', 'Vega', 'Rivera'), ('Silvia', 'Paz', 'Estrada'),
('Ramón', 'Bravo', 'Zúñiga'), ('Clara', 'Figueroa', 'Salinas'), ('Guillermo', 'Orozco', 'Montes'),
('Isabel', 'Luna', 'Cardenas'), ('Ricardo', 'Rojas', 'Ortiz'), ('Diana', 'Navarrete', 'Muñoz'),
('Alejandro', 'Ponce', 'Santos'), ('Marta', 'Mendoza', 'Lara'), ('Cristian', 'Velasco', 'Quintana'),
('Natalia', 'Castañeda', 'Ávila'), ('Tomás', 'Carrasco', 'Reyes'), ('Eugenia', 'Gómez', 'Barrera'),
('Emilio', 'Montoya', 'Serrano'), ('Lorena', 'Zamora', 'Galván');

--Inserción de 50 registros para la tabla Medico 
INSERT INTO Medico (nombres, apellido_p, apellido_m) VALUES
('Jorge', 'Fernández', 'Gutiérrez'), ('Adriana', 'Hernández', 'López'),
('Roberto', 'García', 'Pérez'), ('Elena', 'Sánchez', 'Ramírez'),
('Alberto', 'Martínez', 'González'), ('Carolina', 'Díaz', 'Morales'), ('Esteban', 'Torres', 'Aguilar'),
('Marcela', 'Castro', 'Vargas'), ('Francisco', 'Navarro', 'Reyes'), ('Daniela', 'Silva', 'Jiménez'), ('Hugo', 'Ortega', 'Cabrera'), ('Beatriz', 'Ramos', 'Molina'), ('Pablo', 'Flores', 'Romero'), ('Mónica', 'Delgado', 'Guzmán'), ('Felipe', 'Fuentes', 'Paredes'), ('Patricia', 'Herrera', 'Suárez'),
('Gustavo', 'Blanco', 'Peña'), ('Victoria', 'Ríos', 'Valenzuela'), ('Luis', 'Soto', 'Arce'),
('Cecilia', 'Mejía', 'Escobar'), ('Martín', 'Salazar', 'Carrillo'), ('Teresa', 'Guerra', 'Maldonado'),
('Héctor', 'Arias', 'Bravo'), ('Norma', 'Paredes', 'Villanueva'), ('Samuel', 'Benítez', 'Lara'),
('Claudia', 'Miranda', 'Esquivel'), ('Fernando', 'Chávez', 'Méndez'), 
('Gabriela', 'Domínguez', 'Pérez'), ('Javier', 'Acosta', 'Jiménez'), ('Lorena', 'Campos', 'Mora'),
('Andrés', 'Valdés', 'Herrera'), ('Alejandra', 'Correa', 'López'), ('Manuel', 'Méndez', 'Vega'),
('María', 'Vega', 'Rivera'), ('Tomás', 'Paz', 'Estrada'), ('Isabel', 'Bravo', 'Zúñiga'),
('Cristina', 'Figueroa', 'Salinas'), ('Óscar', 'Orozco', 'Montes'), ('Liliana', 'Luna', 'Cardenas'), ('José', 'Rojas', 'Ortiz'), ('Gloria', 'Navarrete', 'Muñoz'), ('Eduardo', 'Ponce', 'Santos'),
('Daniela', 'Mendoza', 'Lara'), ('Ramón', 'Velasco', 'Quintana'), ('Natalia', 'Castañeda', 'Ávila'), ('Eugenio', 'Carrasco', 'Reyes'), ('Miriam', 'Gómez', 'Barrera'), ('Felipe', 'Montoya', 'Serrano'),
('Sofía', 'Zamora', 'Galván'), ('Santa', 'Sabina', 'Rifa');

--Inserción de 50 registros para la tabla Especialidad 
INSERT INTO Especialidad (nombre) VALUES
('Cardiología'), ('Dermatología'), ('Endocrinología'), ('Gastroenterología'),
('Geriatría'), ('Ginecología'), ('Hematología'), ('Infectología'), ('Medicina Interna'),
('Nefrología'), ('Neumología'), ('Neurología'), ('Obstetricia'), ('Oncología'), ('Oftalmología'),
('Ortopedia'), ('Otorrinolaringología'), ('Pediatría'), ('Psiquiatría'), ('Reumatología'), ('Urología'), ('Cirugía General'), ('Cirugía Plástica'), ('Cirugía Cardiovascular'), ('Anestesiología'), ('Radiología'), ('Medicina Familiar'), ('Traumatología'), 
('Medicina del Deporte'), ('Medicina del Trabajo'), ('Fisiatría'), ('Neurocirugía'),
('Neonatología'), ('Patología'), ('Toxicología'), ('Genética Médica'), ('Alergología'),
('Medicina Preventiva'), ('Gastroenterología Pediátrica'), ('Otorrinolaringología Pediátrica'),
('Cirugía Pediátrica'), ('Hepatología'), ('Cuidados Paliativos'), ('Dermatología Pediátrica'),
('Medicina Estética'), ('Endocrinología Pediátrica'), ('Nutrición Clínica'), ('Psicología Clínica'),
('Medicina Nuclear'), ('Rehabilitación Física');

--Inserción de 50 registros para la tabla Tratamiento 
INSERT INTO Tratamiento (nombre) VALUES
('Terapia Física'), ('Rehabilitación Pulmonar'), ('Diálisis'), ('Quimioterapia'),
('Radioterapia'), ('Cirugía de Rodilla'), ('Cirugía de Cadera'), ('Tratamiento de Hipertensión'),
('Tratamiento de Diabetes'), ('Tratamiento de Asma'), ('Terapia Cognitiva'), 
('Cirugía Láser Ocular'), ('Tratamiento para Alergias'), ('Terapia Psicológica'),
('Vacunación'), ('Tratamiento para Insomnio'), ('Fisioterapia Deportiva'),
('Rehabilitación Neurológica'), ('Tratamiento para la Obesidad'), ('Tratamiento para Anemia'),
('Cuidados Paliativos'), ('Terapia Hormonal'), ('Tratamiento del Dolor Crónico'),
('Cirugía Cardiaca'), ('Tratamiento de Epilepsia'), ('Tratamiento para Depresión'),
('Tratamiento para VIH'), ('Hemodiálisis'), ('Terapia de Lenguaje'), ('Implantes Dentales'), 
('Terapia de Desensibilización'), ('Rehabilitación Cardiaca'), ('Tratamiento para Artritis'),
('Tratamiento para Enfermedad de Crohn'), ('Manejo del Estrés'), 
('Tratamiento para Varices'), ('Terapia Ocupacional para Niños'), 
('Tratamiento para Síndrome del Intestino Irritable'), ('Terapia de Rehabilitación Vestibular'),
('Tratamiento para Reflujo Gastroesofágico'), ('Terapia de Modificación de Conducta'),
('Tratamiento para Enfermedades Autoinmunes'), ('Tratamiento para Gota'),
('Terapia para Trastornos de la Alimentación'), ('Manejo del Dolor Postoperatorio'),
('Terapia de Estimulación Temprana'), ('Rehabilitación Post-Infarto'), 
('Terapia de Estiramiento Muscular'), ('Manejo Integral del Paciente Geriátrico'),
('Tratamiento para el Déficit de Atención e Hiperactividad (TDAH)');

--Inserción de 50 registros para la tabla Medic_Especi
INSERT INTO Medic_Especi (id_medico, id_especialidad) VALUES
(1, 3), (2, 5), (3, 7), (4, 9), (5, 11), (6, 13), (7, 15),
(8, 17), (9, 19), (10, 21), (11, 23), (12, 25), (13, 27), (14, 29),
(15, 31), (16, 33), (17, 35), (18, 37), (19, 39), (20, 41), (21, 43),
(22, 45), (23, 47), (24, 49), (25, 2), (26, 4), (27, 6), (28, 8), (29, 10),
(30, 12), (31, 14), (32, 16), (33, 18), (34, 20), (35, 22), (36, 24),
(37, 26), (38, 28), (39, 30), (40, 32), (41, 34), (42, 36), (43, 38),
(44, 40), (45, 42), (46, 44), (47, 46), (48, 48), (49, 50), (50, 1);

--Inserción de 50 registros para la tabla Cita 
INSERT INTO Cita (id_paciente, id_medico, fecha_atendido) VALUES
(1, 3, '2025-03-14'), (2, 5, '2025-03-14'), (3, 7, '2025-03-14'), (4, 2, '2025-03-14'),
(5, 9, '2025-03-14'), (6, 12, '2025-03-15'), (7, 15, '2025-03-15'), (8, 18, '2025-03-15'),
(9, 21, '2025-03-15'), (21, 24, '2025-03-15'), (11, 27, '2025-03-16'), (12, 30, '2025-03-16'),
(13, 33, '2025-03-16'), (14, 36, '2025-03-16'), (15, 39, '2025-03-16'), (16, 42, '2025-03-17'),
(17, 45, '2025-03-17'), (18, 48, '2025-03-17'), (19, 1, '2025-03-17'), (8, 4, '2025-03-17'),
(21, 6, '2025-03-18'), (22, 8, '2025-03-18'), (23, 10, '2025-03-18'), (24, 12, '2025-03-18'),
(25, 14, '2025-03-18'), (26, 16, '2025-03-19'), (27, 18, '2025-03-19'), (28, 20, '2025-03-19'),
(29, 22, '2025-03-19'), (13, 24, '2025-03-19'), (31, 26, '2025-03-20'), (32, 28, '2025-03-20'),
(33, 30, '2025-03-20'), (34, 32, '2025-03-20'), (35, 34, '2025-03-20'), (36, 36, '2025-03-21'),
(37, 38, '2025-03-21'), (38, 40, '2025-03-21'), (39, 42, '2025-03-21'), (32, 44, '2025-03-21'),
(41, 46, '2025-03-22'), (42, 48, '2025-03-22'), (43, 50, '2025-03-22'), (44, 2, '2025-03-22'),
(45, 4, '2025-03-22'), (46, 6, '2025-03-23'), (47, 8, '2025-03-23'), (48, 10, '2025-03-23'),
(49, 12, '2025-03-23'), (9, 14, '2025-03-23');

--Inserción de 50 registros para la tabla Cita_Tratami 
INSERT INTO Cita_Tratami (id_cita, id_tratamiento) VALUES
(1, 3),(2, 5),(3, 7),(4, 9),(5, 11),(6, 13),(7, 15),(8, 17),
(9, 19),(10, 21),(11, 23),(12, 25),(13, 27),(14, 29),(15, 31),
(16, 33),(17, 35),(18, 37),(19, 39),(20, 41),(21, 43),(22, 45),
(23, 47),(24, 49),(25, 2),(26, 4),(27, 6),(28, 8),(29, 10),
(30, 12),(31, 14),(32, 16),(33, 18),(34, 20),(35, 22),(36, 24),
(37, 26),(38, 28),(39, 30),(40, 32),(41, 34),(42, 36),(43, 38),
(44, 40),(45, 42),(46, 44),(47, 46),(48, 48),(49, 50),(50, 1);

--Select solo
SELECT * FROM paciente;
SELECT * FROM medico;
SELECT * FROM tratamiento;
SELECT * FROM especialidad;
SELECT * FROM cita;
SELECT * FROM cita_tratami;
SELECT * FROM medic_especi;

--Consultar las citas de un paciente específico 
SELECT (P.nombres || ' ' || P.apellido_p || ' ' || P.apellido_m) AS Nombre_Completo, 
P.id_paciente AS Numero_paciente, C.fecha_atendido AS Fecha_de_cita
FROM Paciente P INNER JOIN Cita C ON P.id_paciente = C.id_paciente
WHERE P.id_paciente IN (8);
--El paciente con id_paciente = 8 tiene más de una cita
--Se pueden ver más de una cita con esta consulta

--Todos tienen Join y where
--Variante uno (con ORDER BY)
SELECT (P.nombres || ' ' || P.apellido_p || ' ' || P.apellido_m) AS Nombre_Completo, 
P.id_paciente AS Numero_paciente, C.fecha_atendido AS Fecha_de_cita
FROM Paciente P INNER JOIN Cita C ON P.id_paciente = C.id_paciente
WHERE P.id_paciente IN (8)
ORDER BY C.fecha_atendido DESC;

--Variante dos (con GROUP BY)
SELECT (P.nombres || ' ' || P.apellido_p || ' ' || P.apellido_m) AS Nombre_paciente, 
P.id_paciente AS Numero_paciente, C.fecha_atendido AS Fecha_de_cita 
FROM Paciente P INNER JOIN Cita C ON P.id_paciente = C.id_paciente 
GROUP BY P.id_paciente,C.fecha_atendido
ORDER BY C.fecha_atendido;

--Variante tres (con LIKE)
SELECT P.nombres AS Nombre_paciente, (P.apellido_p || ' ' || P.apellido_m) AS Apellidos_paciente, 
P.id_paciente AS Numero_paciente, C.fecha_atendido AS Fecha_de_cita 
FROM Paciente P INNER JOIN Cita C ON P.id_paciente = C.id_paciente 
WHERE P.nombres LIKE 'C%'
ORDER BY P.id_paciente;

--Variante tres punto 1 (con LIKE y ORDER BY)
SELECT P.nombres AS Nombre_paciente, (P.apellido_p || ' ' || P.apellido_m) AS Apellidos_paciente, 
P.id_paciente AS Numero_paciente, C.fecha_atendido AS Fecha_de_cita 
FROM Paciente P INNER JOIN Cita C ON P.id_paciente = C.id_paciente 
WHERE P.nombres LIKE 'C%'
ORDER BY C.fecha_atendido;
