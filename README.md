# KodigoModulo3Actividad1
# Documentación del Sistema de Gestión de Cursos para Plataformas de e-Learning

## 1. Introducción

### 1.1. Objetivo del Proyecto
El proyecto tiene como objetivo crear un sistema de gestión de cursos para plataformas de e-Learning, que facilite la administración de estudiantes, instructores, cursos, inscripciones, evaluaciones y materiales educativos.

### 1.2. Alcance
El sistema abarca la gestión de cursos, la inscripción de estudiantes, la asignación de evaluaciones, la consulta de resultados y la distribución de materiales educativos. Además, permitirá la generación de informes sobre el desempeño de los estudiantes y el estado de los cursos.

### 1.3. Importancia de una Base de Datos para la Gestión de e-Learning
Una base de datos es crucial para almacenar, organizar y consultar eficientemente grandes cantidades de información, como los estudiantes inscritos, los cursos disponibles, las evaluaciones y los resultados, permitiendo así una gestión efectiva del sistema.

## 2. Descripción del Dominio y Modelo de Datos

### 2.1. Descripción del Dominio
El dominio está centrado en la gestión de cursos educativos a través de una plataforma de e-Learning. El sistema debe facilitar la administración de usuarios, tanto estudiantes como instructores, así como el seguimiento de su participación en los cursos, evaluaciones y materiales educativos.

### 2.2. Identificación de Entidades Principales
- **Estudiante**: Representa a los usuarios inscritos en la plataforma.
- **Instructor**: Encargado de impartir los cursos.
- **Curso**: Programas educativos ofrecidos en la plataforma.
- **Inscripción**: Asociación entre estudiantes y cursos.
- **Evaluación**: Pruebas para medir el progreso de los estudiantes.
- **Resultado**: Puntajes obtenidos por los estudiantes en las evaluaciones.
- **Material Educativo**: Recursos educativos asociados a los cursos.

### 2.3. Relaciones y Cardinalidades
- **Estudiante - Inscripción**: Uno a Muchos (1:N)
- **Curso - Inscripción**: Uno a Muchos (1:N)
- **Instructor - Curso**: Uno a Muchos (1:N)
- **Curso - Evaluación**: Uno a Muchos (1:N)
- **Evaluación - Resultado**: Uno a Muchos (1:N)
- **Estudiante - Resultado**: Uno a Muchos (1:N)
- **Curso - Material Educativo**: Uno a Muchos (1:N)

### 2.4. Definición de Atributos de Cada Entidad
Cada entidad tiene atributos claves que definen sus características. Por ejemplo:
- **Estudiante**: idEstudiante, nombre, apellido, email, fechaRegistro.
- **Curso**: idCurso, nombre, descripcion, fechaInicio, fechaFin.
- **Evaluación**: idEvaluacion, idCurso, nombre, tipo, fecha, puntajeMax.

## 3. Diagrama Entidad-Relación (ER)

### 3.1. Representación Gráfica del Diagrama ER
El diagrama ER es la representación gráfica de las entidades y sus relaciones. En este caso, se representan entidades como **Estudiante**, **Instructor**, **Curso**, y sus interrelaciones.

### 3.2. Explicación del Diagrama ER
- **Estudiante** se relaciona con **Inscripción** para indicar qué cursos están tomando.
- **Instructor** tiene una relación de uno a muchos con **Curso**.
- **Curso** tiene evaluaciones y materiales educativos asociados.

## 4. Esquema Relacional

### 4.1. Introducción al Esquema Relacional
El esquema relacional describe la estructura de las tablas en la base de datos, incluyendo las relaciones entre ellas.

### 4.2. Sentencias SQL para la Creación de Tablas
Las tablas se crean utilizando sentencias **CREATE TABLE**, las cuales definen los atributos y las claves primarias y foráneas.
- Ejemplo:
  ```sql
  CREATE TABLE Estudiante (
      idEstudiante INT PRIMARY KEY,
      nombre VARCHAR(100),
      apellido VARCHAR(100),
      email VARCHAR(100) UNIQUE,
      fechaRegistro DATE
  );
## 4.3. Diagrama Relacional
El **diagrama relacional** muestra la representación visual de las tablas en la base de datos, sus relaciones y dependencias. A continuación, se presentan las tablas principales del sistema:

- **Estudiante**
  - idEstudiante (PK)
  - nombre
  - apellido
  - email
  - fechaRegistro

- **Curso**
  - idCurso (PK)
  - nombre
  - descripcion
  - fechaInicio
  - fechaFin
  - idInstructor (FK)

- **Inscripción**
  - idInscripcion (PK)
  - idEstudiante (FK)
  - idCurso (FK)
  - fechaInscripcion

- **Evaluación**
  - idEvaluacion (PK)
  - idCurso (FK)
  - nombre
  - tipo
  - fecha
  - puntajeMax

- **Resultado**
  - idResultado (PK)
  - idEstudiante (FK)
  - idEvaluacion (FK)
  - puntajeObtenido

- **MaterialEducativo**
  - idMaterial (PK)
  - idCurso (FK)
  - tipo
  - url

## 5. Normalización de la Base de Datos

### 5.1. Proceso de Normalización

#### 5.1.1. Primera Forma Normal (1NF)
La **Primera Forma Normal (1NF)** exige que todos los atributos de una tabla sean atómicos, es decir, cada campo debe contener un solo valor. Esto elimina las estructuras de datos complejas o múltiples valores en una sola columna.

- **Ejemplo**: Si una tabla tiene una columna que contiene múltiples números de teléfono, debe dividirse en registros individuales para cumplir con la 1NF.

#### 5.1.2. Segunda Forma Normal (2NF)
La **Segunda Forma Normal (2NF)** se alcanza cuando una tabla ya está en 1NF y, además, se eliminan las dependencias parciales de la clave primaria. Esto significa que los atributos no clave deben depender completamente de la clave primaria.

- **Ejemplo**: Si una tabla contiene la información del estudiante y del curso, y la clave primaria es una combinación de `idEstudiante` y `idCurso`, los atributos como `nombreEstudiante` deben depender solo de `idEstudiante`, no de la combinación de claves.

#### 5.1.3. Tercera Forma Normal (3NF)
La **Tercera Forma Normal (3NF)** se alcanza cuando una tabla está en 2NF y no tiene dependencias transitivas, es decir, los atributos no clave no deben depender de otros atributos no clave.

- **Ejemplo**: Si una tabla contiene la información de un estudiante y su dirección, y la dirección depende del nombre del estudiante en lugar de su id, esto debe corregirse para cumplir con la 3NF.

### 5.2. Resultados del Proceso de Normalización
Como resultado de la normalización, se crearon múltiples tablas independientes como **Estudiante**, **Curso**, **Inscripción**, y **Evaluación**, eliminando redundancias y mejorando la integridad de los datos. Las tablas que inicialmente contenían múltiples valores se desglosaron en registros individuales, y las dependencias entre los atributos fueron optimizadas para evitar anomalías.

## 6. Consultas SQL

### 6.1. Introducción a las Consultas SQL en el Sistema
Las consultas SQL son fundamentales para interactuar con la base de datos, permitiendo la manipulación y recuperación de datos. En el contexto del sistema de gestión de cursos, se utilizan consultas para obtener información sobre estudiantes, cursos, inscripciones, evaluaciones, resultados, y materiales educativos. Estas consultas están clasificadas en tres niveles: básicas, intermedias y avanzadas.

### 6.2. Listado de Consultas

#### 6.2.1. Consultas Básicas
- **Obtener todos los estudiantes inscritos en un curso**: Esta consulta se utiliza para recuperar el nombre y apellido de los estudiantes que están inscritos en un curso específico.
  
- **Obtener todos los cursos en los que un estudiante está inscrito**: Permite consultar todos los cursos a los que un estudiante está registrado.

#### 6.2.2. Consultas Intermedias
- **Contar el número de estudiantes por curso**: Esta consulta agrupa los cursos por su nombre y cuenta cuántos estudiantes están inscritos en cada uno, proporcionando una visión general de la participación estudiantil en los cursos.
  
- **Listar los cursos con más de 10 estudiantes inscritos**: Filtra los cursos que tienen más de 10 estudiantes, lo que ayuda a identificar los cursos más populares.

#### 6.2.3. Consultas Avanzadas
- **Obtener el curso con más estudiantes inscritos**: Recupera el curso con el mayor número de estudiantes, útil para determinar qué curso tiene más demanda.
  
- **Obtener el puntaje promedio por evaluación**: Calcula el puntaje promedio obtenido por los estudiantes en cada evaluación, ofreciendo una visión del rendimiento general en los cursos.

### 6.3. Ejemplos de Uso y Resultados Esperados
- **Consulta de estudiantes inscritos en "Java Básico"**: Al ejecutar la consulta, se espera obtener una lista de estudiantes con su nombre y apellido que están inscritos en el curso **Java Básico**.
  
- **Consulta del curso con más estudiantes**: El resultado esperado es el nombre del curso y el total de estudiantes inscritos en el curso con el mayor número de inscripciones.

## 7. Conclusiones y Recomendaciones

### 7.1. Resumen del Proyecto
El proyecto consistió en diseñar e implementar un sistema para gestionar cursos de e-Learning, utilizando una base de datos relacional. Se abordaron los aspectos clave como la gestión de estudiantes, inscripciones, evaluaciones, y materiales educativos. El sistema está basado en un modelo de datos normalizado que permite almacenar de manera eficiente la información y asegura la integridad de los datos.

### 7.2. Beneficios Obtenidos
- **Mayor eficiencia**: El diseño y la normalización de la base de datos mejoran la eficiencia en la consulta y manipulación de los datos, lo que permite un acceso más rápido a la información.
- **Mejora de la integridad de los datos**: Se ha logrado reducir la redundancia de los datos, lo que mejora la consistencia y confiabilidad de la base de datos.

### 7.3. Posibles Mejoras y Expansiones
- **Soporte multilingüe**: Ampliar la plataforma para soportar múltiples idiomas, permitiendo a estudiantes de diferentes países acceder a los cursos.
- **Análisis de rendimiento**: Incorporar herramientas de análisis y seguimiento para evaluar el rendimiento de los estudiantes, identificar áreas de mejora y proporcionar recomendaciones personalizadas.
- **Automatización de evaluaciones**: Implementar un sistema que permita la corrección automática de evaluaciones, ahorrando tiempo y recursos en la gestión de resultados.

## 8. Anexos

### 8.1. Scripts Completos
En esta sección se incluyen todos los scripts necesarios para la creación de las tablas, inserción de datos y ejecución de consultas. Esto permite una implementación rápida y sencilla del sistema en cualquier entorno compatible.

### 8.2. Recursos y Herramientas Utilizadas
- **SQL Server**: Se utilizó SQL Server como el sistema de gestión de bases de datos para almacenar y gestionar la información.
- **DB Designer**: Herramienta utilizada para la creación y visualización del diagrama de relaciones entre las tablas.
- **SQL Server Management Studio (SSMS)**: Utilizado para la ejecución de consultas y la administración de la base de datos.
  
### 8.3. Glosario de Términos
- **Entidad**: Un objeto o concepto representado en la base de datos, como un estudiante, curso, o evaluación.
- **Clave primaria (PK)**: Un identificador único para cada registro en una tabla, que garantiza la unicidad de cada entrada.
- **Clave foránea (FK)**: Un campo que establece una relación entre dos tablas, vincula una tabla con otra mediante una clave primaria.
