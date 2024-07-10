-- ################################
-- ###### Creacion de Tablas ######
-- ################################

create database Ambientales;
DROP DATABASE Ambientales;
use Ambientales;

create table entidad (
    id_entidad INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

create table departamento (
    id_departamento INT AUTO_INCREMENT PRIMARY KEY,
    id_entidad INT NOT NULL,
    Foreign Key (id_entidad) REFERENCES entidad(id_entidad),
    nombre VARCHAR(100) NOT NULL,
    capital VARCHAR(100) NOT NULL
);

create table parque (
    id_parque INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    fecha_declaracion DATE NOT NULL,
    superficie DECIMAL(10,2) NOT NULL,
    N_de_entradas INT(3) NOT NULL,
    id_entidad INT NOT NULL,
    Foreign Key (id_entidad) REFERENCES entidad(id_entidad)
);

create table parque_departamento (
    id_parque INT,
    id_departamento INT,
    PRIMARY KEY (id_parque, id_departamento),
    Foreign Key (id_parque) REFERENCES parque(id_parque),
    Foreign Key (id_departamento) REFERENCES departamento(id_departamento)
);

create table area (
    id_area INT AUTO_INCREMENT PRIMARY KEY,
    id_parque INT NOT NULL,
    Foreign Key (id_parque) REFERENCES parque(id_parque),
    nombre VARCHAR(100) NOT NULL,
    extension DECIMAL(10,2) NOT NULL
);

create table especie (
    id_especie INT AUTO_INCREMENT PRIMARY KEY,
    id_area INT NOT NULL,
    Foreign Key (id_area) REFERENCES area(id_area),
    tipo ENUM('Vegetales', 'Animales', 'Minerales') NOT NULL,
    nombre_cientifico VARCHAR(100) NOT NULL,
    nombre_vulgar VARCHAR(100) NOT NULL,
    cantidad INT(10) NOT NULL
);

create table personal (
    id_personal INT AUTO_INCREMENT PRIMARY KEY,
    id_parque INT NOT NULL,
    cedula VARCHAR(20) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    celular VARCHAR(20),
    sueldo DECIMAL(10,2) NOT NULL 
);

create table personal_gestion (
    id_gestion INT AUTO_INCREMENT PRIMARY KEY,
    id_personal INT NOT NULL,
    Foreign Key (id_personal) REFERENCES personal(id_personal),
    n_entrada INT(10) NOT NULL
);

create table personal_vigilancia (
    id_vigilancia INT AUTO_INCREMENT PRIMARY KEY,
    id_personal INT NOT NULL,
    Foreign Key (id_personal) REFERENCES personal(id_personal),
    id_area INT NOT NULL,
    Foreign Key (id_area) REFERENCES area(id_area),
    tipo_vehiculo VARCHAR(100) NOT NULL,
    marca_vehiculo VARCHAR(100) NOT NULL
);

create table personal_conservacion (
    id_conservacion INT AUTO_INCREMENT PRIMARY KEY,
    id_personal INT NOT NULL,
    Foreign Key (id_personal) REFERENCES personal(id_personal),
    id_area INT NOT NULL,
    Foreign Key (id_area) REFERENCES area(id_area),
    especialidad ENUM('limpieza', 'caminos', 'alojamiento') NOT NULL
);

create table personal_investigador (
    id_investigador INT AUTO_INCREMENT PRIMARY KEY,
    id_personal INT NOT NULL,
    Foreign Key (id_personal) REFERENCES personal(id_personal),
    titulacion VARCHAR(100)
);

create table proyecto (
    id_proyecto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    presupuesto DECIMAL(10,2) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL
);

create table investigacion(
    id_proyecto INT,
    id_investigador INT,
    id_especie INT,
    PRIMARY KEY (id_proyecto, id_investigador, id_especie),
    Foreign Key (id_proyecto) REFERENCES proyecto(id_proyecto),
    Foreign Key (id_investigador) REFERENCES personal_investigador(id_investigador),
    Foreign Key (id_especie) REFERENCES especie(id_especie)
);

create table visitante(
    id_visitante INT AUTO_INCREMENT PRIMARY KEY,
    id_personal_gestion INT NOT NULL,
    Foreign Key (id_personal_gestion) REFERENCES personal_gestion(id_gestion),
    cedula VARCHAR(20) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    profesion VARCHAR(100)
);

create table alojamiento (
    id_alojamiento INT AUTO_INCREMENT PRIMARY KEY,
    id_visitante INT NOT NULL,
    Foreign Key (id_visitante) REFERENCES visitante(id_visitante),
    nombre VARCHAR(100) NOT NULL,
    capacidad INT(10) NOT NULL,
    categoria ENUM ('Cabaña', 'Camping', 'Hotel', 'Hostales') NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_final DATE NOT NULL
);

SHOW TABLES;
