-- ################################################
-- ###### Triggers + Eventos + Transacciones ######
-- ################################################

use Ambientales;

-- Trigger para tener un registro de la hora de entrada de cada visitante o actualizacion.
create table registro_visitante(
    id_visitante INT AUTO_INCREMENT PRIMARY KEY,
    id_personal_gestion INT NOT NULL,
    Foreign Key (id_personal_gestion) REFERENCES personal_gestion(id_gestion),
    cedula VARCHAR(20) UNIQUE NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    profesion VARCHAR(100),
    hora_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

delimiter //
create trigger after_visitante_insert
after insert on visitante
for each row
begin
    insert into registro_visitante (id_visitante, id_personal_gestion, cedula, nombre, direccion, profesion)
    value (new.id_visitante, new.id_personal_gestion, new.cedula, new.nombre, new.direccion, new.profesion);
end //
delimiter ;

INSERT INTO visitante (id_personal_gestion, cedula, nombre, direccion, profesion)
VALUES (1, '1234567890', 'Juan Perez', 'Calle Falsa 123', 'Ingeniero');

SELECT * FROM registro_visitante;

delimiter //
create trigger after_visitante_update
after update on visitante
for each row
begin
    insert into registro_visitante (id_visitante, id_personal_gestion, cedula, nombre, direccion, profesion)
    value (new.id_visitante, new.id_personal_gestion, new.cedula, new.nombre, new.direccion, new.profesion);
end //
delimiter ;

UPDATE visitante
SET nombre = 'Juan P. Perez', direccion = 'Avenida Siempre Viva 742', profesion = 'Arquitecto'
WHERE id_visitante = 1;

SELECT * FROM registro_visitante;

-- Evento para subir el sueldo de los empleados anualmente un 10%
delimiter //
create event if not exists aumentar_sueldo_anual
on SCHEDULE every 1 year
starts (CURRENT_TIMESTAMP)
do
begin
    update personal
    set sueldo = sueldo * 1.10;
end //
delimiter ;

select * from personal;

-- Transacción para registrar un nuevo proyecto de investigación

START TRANSACTION;

INSERT INTO proyecto (nombre, presupuesto, fecha_inicio, fecha_fin)
VALUES ('Ecología del Laurel en Ecosistemas Montañosos', 50000, '2024-06-17', '2025-05-18');

-- Obtenemos el ID del proyecto insertado
SET @id_proyecto = LAST_INSERT_ID();

-- Insertamos el investigador asociado al proyecto
INSERT INTO personal_investigador (id_personal, titulacion)
VALUES (101, 'Ecólogo Especialista en Vegetación');

-- Obtenemos el ID del investigador insertado
SET @id_investigador = LAST_INSERT_ID();

-- Insertamos las especies involucradas en la investigación
INSERT INTO especie (id_area, tipo, nombre_cientifico, nombre_vulgar, cantidad)
VALUES 
    (16, 'Vegetales', 'Ocotea bullata', 'Laurel', 482);

-- Obtenemos el ID de la especie insertada
SET @id_especie = LAST_INSERT_ID();

-- Insertamos la relación entre el proyecto, los investigadores y las especies
INSERT INTO investigacion (id_proyecto, id_investigador, id_especie)
VALUES 
    (@id_proyecto, @id_investigador, @id_especie);

-- Confirmar la transacción realizada
COMMIT;

-- Deshacer los Cambios realizados
ROLLBACK;
