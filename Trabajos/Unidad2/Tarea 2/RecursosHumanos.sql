-- Crear tabla Empresa
CREATE TABLE Empresa (
    id_empresa SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion TEXT NOT NULL,
    telefono VARCHAR(20) NOT NULL
);

-- Crear tabla Departamento
CREATE TABLE Departamento (
    id_departamento SERIAL PRIMARY KEY,
    id_empresa INT NOT NULL REFERENCES Empresa(id_empresa) ON DELETE CASCADE,
    nombre VARCHAR(100) NOT NULL
);

-- Crear tabla Empleado
CREATE TABLE Empleado (
    id_empleado SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    salario DECIMAL(10,2) NOT NULL CHECK (salario >= 0),
    id_departamento INT NOT NULL REFERENCES Departamento(id_departamento) ON DELETE SET NULL
);

--Insertar Empresas
INSERT INTO Empresa (nombre, direccion, telefono) VALUES
('TechCorp', 'Avenida Principal 123, CDMX', '555-123-4567'),
('Innovatech', 'Calle Secundaria 456, Guadalajara', '555-987-6543'),
('BioHealth', 'Avenida Salud 789, Monterrey', '555-222-3333'),
('EcoEnergy', 'Calle Verde 321, Querétaro', '555-444-5555');

--Insertar Departamentos, les puse unos comentarios pasa saber cual es de cual
INSERT INTO Departamento (id_empresa, nombre) VALUES
--TechCorp
(1, 'Desarrollo de Software'), (1, 'Recursos Humanos'), (1, 'Ventas'), (1, 'Soporte Técnico'),
--Innovatech
(2, 'Investigación y Desarrollo'), (2, 'Marketing'), (2, 'Atención al Cliente'), (2, 'Finanzas'),
--BioHealth
(3, 'Producción'), (3, 'Calidad'), (3, 'Regulaciones'), (3, 'Logística'),
--EcoEnergy
(4, 'Ingeniería'), (4, 'Sustentabilidad'), (4, 'Operaciones'), (4, 'Administración');




INSERT INTO Empleado (nombre, apellido, cargo, salario, id_departamento) VALUES
-- Los departamentos de TechCorp
-- Desarrollo de Software
('Juan', 'Pérez', 'Desarrollador Senior', 50000, 1),
('Ana', 'López', 'Desarrollador Junior', 30000, 1),
('Carlos', 'Sánchez', 'Desarrollador Backend', 40000, 1),
('Laura', 'Fernández', 'Desarrollador Frontend', 38000, 1),
('Mario', 'Gómez', 'Ingeniero de Pruebas', 35000, 1),
-- Recursos Humanos
('Elena', 'Martínez', 'Gerente de RRHH', 60000, 2),
('Javier', 'Rodríguez', 'Especialista en Reclutamiento', 45000, 2),
('María', 'Hernández', 'Coordinador de Capacitación', 42000, 2),
('David', 'Castro', 'Asistente de RRHH', 32000, 2),
('Sofía', 'Gutiérrez', 'Analista de Personal', 39000, 2),
-- Ventas
('Fernando', 'Ortiz', 'Director de Ventas', 70000, 3),
('Carmen', 'Ríos', 'Ejecutivo de Cuenta', 48000, 3),
('Roberto', 'Jiménez', 'Analista de Mercado', 46000, 3),
('Paula', 'Navarro', 'Representante Comercial', 43000, 3),
('Gabriel', 'Ruiz', 'Gestor de Clientes', 41000, 3),
-- Soporte Técnico
('Luis', 'Silva', 'Jefe de Soporte', 55000, 4),
('Andrea', 'Díaz', 'Técnico de Soporte', 38000, 4),
('Pablo', 'Torres', 'Especialista en Redes', 40000, 4),
('Lucía', 'Ramírez', 'Soporte de Aplicaciones', 36000, 4),
('Daniel', 'Muñoz', 'Administrador de Sistemas', 47000, 4),

-- Los departamentos de Innovatech
-- Investigación y Desarrollo 
('Raúl', 'Mendoza', 'Investigador Senior', 75000, 5),
('Patricia', 'Cabrera', 'Ingeniero en Innovación', 62000, 5),
('Tomás', 'Núñez', 'Desarrollador de Producto', 58000, 5),
('Silvana', 'Vega', 'Analista de Datos', 54000, 5),
('Esteban', 'Fuentes', 'Técnico en Desarrollo', 50000, 5),
-- Marketing
('Daniela', 'Salazar', 'Gerente de Marketing', 68000, 6),
('Julio', 'Paredes', 'Especialista en SEO', 50000, 6),
('Mónica', 'León', 'Community Manager', 48000, 6),
('Rafael', 'Suárez', 'Diseñador Gráfico', 45000, 6),
('Valeria', 'Ortega', 'Analista de Publicidad', 47000, 6),
-- Atención al Cliente
('Héctor', 'García', 'Gerente de Atención', 62000, 7),
('Cecilia', 'Vázquez', 'Asesor de Clientes', 40000, 7),
('Fabián', 'Pérez', 'Operador de Soporte', 39000, 7),
('Rosa', 'Morales', 'Coordinador de Servicios', 42000, 7),
('Alberto', 'Flores', 'Ejecutivo de Call Center', 37000, 7),
-- Finanzas 
('Jorge', 'Castillo', 'Director Financiero', 90000, 8),
('Isabel', 'Reyes', 'Contador Senior', 70000, 8),
('Oscar', 'Herrera', 'Analista Financiero', 65000, 8),
('Carolina', 'Aguirre', 'Asistente de Contabilidad', 50000, 8),
('Ernesto', 'Peña', 'Coordinador de Costos', 62000, 8),

-- Los departamentos de BioHealth
-- Producción
('Emmanuel', 'López', 'Jefe de Producción', 80000, 9),
('Natalia', 'Jiménez', 'Supervisor de Planta', 55000, 9),
('Martín', 'Domínguez', 'Operador de Máquinas', 45000, 9),
('Silvia', 'Meza', 'Encargado de Insumos', 48000, 9),
('Fernando', 'Soto', 'Técnico de Línea', 47000, 9),
-- Calidad 
('Rocío', 'Beltrán', 'Gerente de Calidad', 82000, 10),
('Hugo', 'Chávez', 'Inspector de Calidad', 50000, 10),
('Miranda', 'Zamora', 'Técnico en Control', 52000, 10),
('Ángel', 'Serrano', 'Analista de Procesos', 55000, 10),
('Victoria', 'Luna', 'Responsable de Normativas', 59000, 10),
-- Regulaciones
('Camilo', 'Márquez', 'Gerente de Regulaciones', 88000, 11),
('Diana', 'Escobar', 'Especialista en Normas', 62000, 11),
('Luis', 'Estrada', 'Técnico en Documentación', 53000, 11),
('Jimena', 'Valdés', 'Analista de Cumplimiento', 55000, 11),
('Cristian', 'Orozco', 'Coordinador de Permisos', 57000, 11),
-- Logística 
('Gustavo', 'Medina', 'Jefe de Logística', 85000, 12),
('Rebeca', 'Aranda', 'Coordinador de Transporte', 52000, 12),
('Óscar', 'Muñoz', 'Analista de Inventarios', 50000, 12),
('Beatriz', 'Solís', 'Técnico en Distribución', 48000, 12),
('Mauricio', 'Delgado', 'Encargado de Almacén', 46000, 12),

-- Los departamentos de EcoEnergy
-- Ingeniería
('Álvaro', 'Villanueva', 'Director de Ingeniería', 93000, 13),
('Carla', 'Fierro', 'Ingeniero en Energía', 68000, 13),
('Ramiro', 'Espinosa', 'Analista de Innovación', 64000, 13),
('Fabiola', 'González', 'Coordinador de Proyectos', 70000, 13),
('Lucas', 'Peralta', 'Especialista en Mecánica', 65000, 13),
-- Sustentabilidad 
('Brenda', 'Méndez', 'Gerente de Sustentabilidad', 87000, 14),
('Rodrigo', 'Lara', 'Analista Ambiental', 56000, 14),
('Paola', 'Tovar', 'Especialista en Energía', 62000, 14),
('Sergio', 'Palacios', 'Ingeniero en Recursos', 60000, 14),
('Mónica', 'Bautista', 'Coordinador de Innovación', 58000, 14),
-- Operaciones
('Javier', 'Ávila', 'Gerente de Operaciones', 90000, 15),
('Liliana', 'Cortez', 'Supervisor de Planta', 54000, 15),
('Edgar', 'Rosales', 'Coordinador de Producción', 58000, 15),
('Nayeli', 'Ponce', 'Especialista en Seguridad', 60000, 15),
('Ignacio', 'Reyes', 'Técnico de Mantenimiento', 57000, 15),
-- Administración
('Marcos', 'Castañeda', 'Director Administrativo', 95000, 16),
('Teresa', 'Zúñiga', 'Coordinador de Personal', 62000, 16),
('Adrián', 'Rentería', 'Especialista en Finanzas', 67000, 16),
('Laura', 'Juárez', 'Analista de Procesos', 60000, 16),
('Guillermo', 'Salinas', 'Encargado de Recursos', 59000, 16);

--SELECT Solo
SELECT * FROM empresa;
SELECT * FROM departamento;
SELECT * FROM empleado;

--Consultar empleados por departamento
SELECT E.id_empresa AS clave_empresa, E.nombre AS nombre_empresa, 
D.id_departamento AS clave_departamento, D.nombre AS nombre_Deprt,  
P.id_empleado AS clave_empleado, (P.nombre || ' ' || P.apellido) AS nombre_completo,
P.cargo AS cargo, P.salario AS sueldo
FROM Empresa E INNER JOIN Departamento D ON E.id_empresa = D.id_empresa
INNER JOIN Empleado P ON D.id_departamento = P.id_departamento
WHERE D.id_departamento IN (1);

--Variante uno (ORDER BY)
SELECT E.id_empresa AS clave_empresa, E.nombre AS nombre_empresa, 
D.id_departamento AS clave_departamento, D.nombre AS nombre_Deprt,  
P.id_empleado AS clave_empleado, (P.nombre || ' ' || P.apellido) AS nombre_completo,
P.cargo AS cargo, P.salario AS sueldo
FROM Empresa E INNER JOIN Departamento D ON E.id_empresa = D.id_empresa
INNER JOIN Empleado P ON D.id_departamento = P.id_departamento
WHERE D.id_departamento IN (1)
ORDER BY P.id_empleado DESC;

--Variante dos (LIKE)
SELECT E.id_empresa AS clave_empresa, E.nombre AS nombre_empresa, 
D.id_departamento AS clave_departamento, D.nombre AS nombre_Deprt,  
P.id_empleado AS clave_empleado, (P.nombre || ' ' || P.apellido) AS nombre_completo,
P.cargo AS cargo, P.salario AS sueldo
FROM Empresa E INNER JOIN Departamento D ON E.id_empresa = D.id_empresa
INNER JOIN Empleado P ON D.id_departamento = P.id_departamento
WHERE E.nombre LIKE 'TechCorp' AND D.nombre LIKE 'Desarrollo de Software'
ORDER BY P.id_empleado DESC;

--Variante tres (GROUP BY)
SELECT E.id_empresa AS clave_empresa, E.nombre AS nombre_empresa, 
D.id_departamento AS clave_departamento, D.nombre AS nombre_Deprt,  
P.id_empleado AS clave_empleado, (P.nombre || ' ' || P.apellido) AS nombre_completo,
P.cargo AS cargo, P.salario AS sueldo
FROM Empresa E INNER JOIN Departamento D ON E.id_empresa = D.id_empresa
INNER JOIN Empleado P ON D.id_departamento = P.id_departamento
WHERE D.id_departamento IN (1)
GROUP BY E.id_empresa, E.nombre, D.id_departamento, D.nombre, 
P.id_empleado, P.nombre, P.apellido, P.cargo, P.salario;