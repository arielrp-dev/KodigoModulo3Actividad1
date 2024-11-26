-- Consultas Básicas
-- 1.	Listar todos los estudiantes registrados:
SELECT * FROM Estudiante;
-- 2.	Obtener los cursos ofrecidos actualmente:
SELECT * FROM Curso WHERE estado = 'activo';
-- 3.	Listar todos los instructores:
SELECT * FROM Instructor;
-- 4.	Mostrar las inscripciones por estudiante:
SELECT idEstudiante, COUNT(idInscripcion) AS totalInscripciones
FROM Inscripcion
GROUP BY idEstudiante;
-- 5.   Obtener materiales educativos de un curso específico:
SELECT * FROM MaterialEducativo WHERE idCurso = 1;

-- Consultas Intermedias
-- 1.	Listar los estudiantes inscritos en un curso específico:
SELECT e.nombre, e.apellido
FROM Estudiante AS e
JOIN Inscripcion AS i ON e.idEstudiante = i.idEstudiante
WHERE i.idCurso = 2;
-- 2.	Obtener el puntaje promedio de un curso en una evaluación específica:
SELECT AVG(r.puntajeObtenido) AS promedioPuntaje
FROM Resultado AS r
JOIN Evaluacion AS e ON r.idEvaluacion = e.idEvaluacion
WHERE e.idCurso = 3 AND e.nombre = 'Evaluación 1';				-- Especificar evaluacion
-- 3.	Listar los cursos impartidos por cada instructor:
SELECT i.nombre AS instructor, c.nombre AS curso
FROM Instructor AS i
JOIN Curso AS c ON i.idInstructor = c.idInstructor;
-- 4.	Mostrar el número total de evaluaciones realizadas por curso:
SELECT c.nombre AS curso, COUNT(e.idEvaluacion) AS totalEvaluaciones
FROM Curso AS c
JOIN Evaluacion AS e ON c.idCurso = e.idCurso
GROUP BY c.nombre;
-- 5.	Listar los resultados de evaluación por estudiante y curso:
SELECT e.nombre AS estudiante, c.nombre AS curso, r.puntajeObtenido
FROM Estudiante AS e
JOIN Resultado AS r ON e.idEstudiante = r.idEstudiante
JOIN Evaluacion AS ev ON r.idEvaluacion = ev.idEvaluacion
JOIN Curso AS c ON ev.idCurso = c.idCurso;

-- Consultas Avanzadas
-- 1.   Obtener el curso con mayor número de estudiantes inscritos:
SELECT TOP 1 
    c.nombre AS curso, 
    COUNT(i.idEstudiante) AS totalEstudiantes
FROM Curso AS c
JOIN Inscripcion AS i ON c.idCurso = i.idCurso
GROUP BY c.nombre
ORDER BY totalEstudiantes DESC;
-- 2.	Listar a los estudiantes con el puntaje promedio más alto por curso:
SELECT e.nombre AS estudiante, c.nombre AS curso, AVG(r.puntajeObtenido) AS promedioPuntaje
FROM Estudiante AS e
JOIN Resultado AS r ON e.idEstudiante = r.idEstudiante
JOIN Evaluacion AS ev ON r.idEvaluacion = ev.idEvaluacion
JOIN Curso AS c ON ev.idCurso = c.idCurso
GROUP BY e.nombre, c.nombre
ORDER BY promedioPuntaje DESC;

-- 3.	Identificar los cursos sin estudiantes inscritos:
SELECT c.nombre
FROM Curso AS c
LEFT JOIN Inscripcion AS i ON c.idCurso = i.idCurso
WHERE i.idInscripcion IS NULL;

-- 4.	Mostrar la distribución de tipos de evaluaciones por curso:
SELECT c.nombre AS curso, e.tipo AS tipoEvaluacion, COUNT(e.idEvaluacion) AS totalEvaluaciones
FROM Curso AS c
JOIN Evaluacion AS e ON c.idCurso = e.idCurso
GROUP BY c.nombre, e.tipo;

-- 5.	Listar los instructores cuyos cursos tienen el promedio más alto en evaluaciones:
SELECT i.nombre AS instructor, AVG(r.puntajeObtenido) AS promedioCurso
FROM Instructor AS i
JOIN Curso AS c ON i.idInstructor = c.idInstructor
JOIN Evaluacion AS e ON c.idCurso = e.idCurso
JOIN Resultado AS r ON e.idEvaluacion = r.idEvaluacion
GROUP BY i.nombre
ORDER BY promedioCurso DESC;