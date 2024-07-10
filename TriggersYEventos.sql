-- ################################
-- ###### Triggers y Eventos ######
-- ################################

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

delimiter //
create trigger after_visitante_update
after update on visitante
for each row
begin
    insert into registro_visitante (id_visitante, id_personal_gestion, cedula, nombre, direccion, profesion)
    value (new.id_visitante, new.id_personal_gestion, new.cedula, new.nombre, new.direccion, new.profesion);
end //
delimiter ;

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
