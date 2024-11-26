-- Tabla Estudiante
CREATE TABLE Estudiante (
    idEstudiante INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    fechaRegistro DATE NOT NULL
);

-- Tabla Instructor
CREATE TABLE Instructor (
    idInstructor INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    especialidad VARCHAR(100) NOT NULL
);

-- Tabla Curso
CREATE TABLE Curso (
    idCurso INT PRIMARY KEY IDENTITY(1,1),
    idInstructor INT NOT NULL,
    nombre VARCHAR(150) NOT NULL,
    descripcion TEXT NOT NULL,
    fechaInicio DATE NOT NULL,
    fechaFin DATE NOT NULL,
    estado VARCHAR(50) NOT NULL,
    FOREIGN KEY (idInstructor) REFERENCES Instructor(idInstructor)
);

-- Tabla Inscripción
CREATE TABLE Inscripcion (
    idInscripcion INT PRIMARY KEY IDENTITY(1,1),
    idEstudiante INT NOT NULL,
    idCurso INT NOT NULL,
    fechaInscripcion DATE NOT NULL,
    FOREIGN KEY (idEstudiante) REFERENCES Estudiante(idEstudiante),
    FOREIGN KEY (idCurso) REFERENCES Curso(idCurso)
);

-- Tabla Evaluación
CREATE TABLE Evaluacion (
    idEvaluacion INT PRIMARY KEY IDENTITY(1,1),
    idCurso INT NOT NULL,
    nombre VARCHAR(150) NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    fecha DATE NOT NULL,
    puntajeMax DECIMAL(5,2) NOT NULL,
    FOREIGN KEY (idCurso) REFERENCES Curso(idCurso)
);

-- Tabla Resultado
CREATE TABLE Resultado (
    idResultado INT PRIMARY KEY IDENTITY(1,1),
    idEstudiante INT NOT NULL,
    idEvaluacion INT NOT NULL,
    puntajeObtenido DECIMAL(5,2) NOT NULL,
    FOREIGN KEY (idEstudiante) REFERENCES Estudiante(idEstudiante),
    FOREIGN KEY (idEvaluacion) REFERENCES Evaluacion(idEvaluacion)
);

-- Tabla Material Educativo
CREATE TABLE MaterialEducativo (
    idMaterial INT PRIMARY KEY IDENTITY(1,1),
    idCurso INT NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    url VARCHAR(255) NOT NULL,
    FOREIGN KEY (idCurso) REFERENCES Curso(idCurso)
);
