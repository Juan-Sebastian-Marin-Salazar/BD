-- 1 Selección Básica
SELECT E.Nombre, E.Apellido
FROM Estudiantes E;

-- 2 Cláusula WHERE
SELECT C.NombreCurso
FROM Cursos C
WHERE C.Creditos = 3;

-- 3 INNER JOIN
SELECT E.Nombre AS NombreEstudiante, C.NombreCurso AS NombreCurso
FROM Inscripciones I
INNER JOIN Estudiantes E ON I.IDEstudiante = E.IDEstudiante
INNER JOIN Cursos C ON I.IDCurso = C.IDCurso;

-- 4 LEFT JOIN
SELECT E.Nombre AS NombreEstudiante, 
E.Apellido AS ApellidoEstudiante,
C.NombreCurso AS NombreCurso
FROM Estudiantes E
LEFT JOIN Inscripciones I ON E.IDEstudiante = I.IDEstudiante
LEFT JOIN Cursos C ON I.IDCurso = C.IDCurso;

-- 5 RIGHT JOIN
SELECT C.NombreCurso, 
E.Nombre AS NombreEstudiante,
E.Apellido AS ApellidoEstudiante
FROM Inscripciones I
RIGHT JOIN Cursos C ON I.IDCurso = C.IDCurso
LEFT JOIN Estudiantes E ON I.IDEstudiante = E.IDEstudiante;

-- 6 GROUP BY y COUNT
SELECT C.NombreCurso, 
COUNT(I.IDEstudiante) AS CantidadEstudiantes
FROM Cursos C
LEFT JOIN Inscripciones I ON C.IDCurso = I.IDCurso
GROUP BY C.NombreCurso;

-- 7 BETWEEN
SELECT *
FROM Estudiantes E
WHERE E.FechaNacimiento BETWEEN '1995-01-01' AND '1998-12-31';

-- 8 ORDER BY
SELECT *
FROM Cursos C
ORDER BY C.NombreCurso ASC;

-- 9 CTE
WITH InscripcionesPorEstudiante AS (
    SELECT E.IDEstudiante, E.Nombre,E.Apellido,
    COUNT(I.IDInscripcion) AS TotalInscripciones
    FROM Estudiantes E
    LEFT JOIN Inscripciones I ON E.IDEstudiante = I.IDEstudiante
    GROUP BY E.IDEstudiante, E.Nombre, E.Apellido
)
SELECT Nombre, Apellido, TotalInscripciones
FROM InscripcionesPorEstudiante
ORDER BY TotalInscripciones DESC
LIMIT 3;

-- 10 Consulta Compleja 1
WITH InscripcionesPorCurso AS (
    SELECT D.Nombredepartamento AS NombreDepartamento,C.Nombrecurso AS NombreCurso,
    COUNT(I.IDInscripcion) AS TotalInscripciones,
    D.IDDepartamento
    FROM Cursos C
    JOIN Departamentos D ON C.IDDepartamento = D.IDDepartamento
    LEFT JOIN Inscripciones I ON C.IDCurso = I.IDCurso
    GROUP BY D.Nombredepartamento, C.Nombrecurso, D.IDDepartamento, C.IDCurso
),
CursoConMasEstudiantesPorDepartamento AS (
    SELECT NombreDepartamento, NombreCurso, TotalInscripciones,
    ROW_NUMBER() OVER (PARTITION BY IDDepartamento ORDER BY TotalInscripciones DESC) AS Posicion
    FROM InscripcionesPorCurso
)
SELECT NombreDepartamento, NombreCurso,TotalInscripciones
FROM CursoConMasEstudiantesPorDepartamento
WHERE Posicion = 1;

-- 11 Consulta Compleja 2
SELECT P.Nombre, P.Apellido,
COUNT(CursosP.IDCurso) AS CantidadCursos
FROM Profesores P
INNER JOIN CursosProfesores CursosP ON P.IDProfesor = CursosP.IDProfesor
GROUP BY P.IDProfesor, P.Nombre, P.Apellido
HAVING COUNT(CursosP.IDCurso) > 2;

-- 12 Consulta Compleja 3
WITH Promedios AS (
    SELECT PE.IDPrograma, PE.Nombreprograma, C.IDCurso,
    C.Nombrecurso, AVG(I.Calificacion) AS Promedio
    FROM Programasestudio PE
    INNER JOIN Programascursos PC ON PE.IDPrograma = PC.IDPrograma
    INNER JOIN Cursos C ON pc.IDCurso = C.IDCurso
    INNER JOIN Inscripciones I ON c.IDCurso = I.IDCurso
    GROUP BY PE.IDPrograma, PE.Nombreprograma, C.IDCurso, C.Nombrecurso
),
Maximos AS (
    SELECT IDPrograma,
    MAX(Promedio) AS MaxPromedio
    FROM Promedios
    GROUP BY IDPrograma
)
SELECT P.Nombreprograma, P.Nombrecurso, P.Promedio
FROM Promedios P
JOIN Maximos M ON P.IDPrograma = M.IDPrograma AND P.Promedio = M.MaxPromedio
ORDER BY P.Nombreprograma;

