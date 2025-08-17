CREATE DATABASE SchoolDB;
GO

USE SchoolDB;
GO

-- Crear tabla Students
CREATE TABLE Students (
    rollno INT PRIMARY KEY,
    fname NVARCHAR(50),
    lname NVARCHAR(50),
    age INT,
    gender NVARCHAR(10),
    section NVARCHAR(10)
);
GO

-- Insertar registros
INSERT INTO Students (rollno, fname, lname, age, gender, section)
VALUES
(1001, 'Juan',   'Pérez',     15, 'M', 'A'),
(1002, 'María',  'Gómez',     14, 'F', 'A'),
(1003, 'Pedro',  'Torres',    16, 'M', 'B'),
(1004, 'Lucía',  'Martínez',  13, 'F', 'B'),
(1005, 'Carlos', 'Ramírez',   17, 'M', 'C'),
(1006, 'Ana',    'López',     15, 'F', 'C');
GO


-- Obtener todos los datos de estudiante
SELECT * FROM Students

-- Filtrar por condición
SELECT *
FROM Students
WHERE age <= 15;

-- Obtener columnas especificas
SELECT fname, lname
FROM Students
WHERE age <= 15;

-- Traer máximo 3 filas
SELECT TOP 3 *
FROM Students
ORDER BY age DESC

-- Funciones de agregación
SELECT COUNT(*) AS TotalEstudiantes FROM Students;
SELECT MAX(age) AS MaxEstudiantes FROM Students;
SELECT MIN(age) AS MaxEstudiantes FROM Students;
SELECT SUM(age) AS MaxEstudiantes FROM Students;
SELECT AVG(age) AS MaxEstudiantes FROM Students;

-- Agrupar por sección
SELECT section, COUNT(*) as CantidadAlumnos
FROM Students
GROUP BY section

-- Ordenar resultados
SELECT fname
FROM Students
ORDER BY age DESC

-- Quiero que la edad este en el rango de 14 a 16
SELECT *
FROM Students
WHERE age BETWEEN 14 AND 16

-- Quiero ver cuantos alumnos hay en las selecciones de A y C
SELECT section, COUNT(*) as CantidadAlumnos
FROM Students
WHERE section IN ('A', 'C')
GROUP BY section

-- Quiero a todos los alumnos que comiencen con A
SELECT fname
FROM Students
WHERE fname LIKE 'A%'


-- Ejemplo utilizando un poco de todo
SELECT gender, COUNT(*) as CantidadAlumnos, AVG(age) as PromedioEdad
FROM Students
WHERE age >= 13
GROUP BY gender
HAVING COUNT(*) >= 2
ORDER BY PromedioEdad DESC