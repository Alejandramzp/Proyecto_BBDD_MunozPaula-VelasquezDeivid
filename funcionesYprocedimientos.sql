-- ########################################
-- ###### FUnciones y Procedimientos ######
-- ########################################

use Ambientales;


-- Superficie total de un parque
delimiter //
create function superficie_total_parque (p_id_parque int) returns decimal(10,2) DETERMINISTIC
begin
    declare v_superficie_total decimal(10,2);

    select sum(extension) into v_superficie_total
    from area 
    where id_parque = p_id_parque;

    return v_superficie_total;
end //
delimiter ;
select superficie_total_parque(1) as superficie_total_parque_1;

-- Añadir una Entidad
DELIMITER //
create procedure añadir_entidad (e_nombre VARCHAR(100))
begin
    insert into entidad(nombre)
    values (e_nombre);
end //
DELIMITER ;

-- Actualizar una Entidad por su id

delimiter //
create Procedure actualizar_entidad(e_id_entidad INT, e_nombre VARCHAR(100))
begin
    if (select COUNT(*) from entidad where id_entidad = e_id_entidad) = 0 THEN
        signal sqlstate '45000' set MESSAGE_TEXT = 'Entidad no existe';
    else
        update entidad
        set nombre = e_nombre
        where id_entidad = e_id_entidad;
    end if;
end //
delimiter ;

create view ver_entidad as select id_entidad, nombre from entidad;
select * from ver_entidad;


-- Añadir un departamento
delimiter //
create procedure añadir_departamento(d_id_entidad int, d_nombre VARCHAR(100), d_capital VARCHAR(100))
begin
    if (select count(*) from entidad where id_entidad = d_id_entidad) = 0 then
        signal sqlstate '45000' set MESSAGE_TEXT = 'Entidad no encontrada';
    else 
        insert into departamento(id_entidad, nombre, capital)
        value (d_id_entidad, d_nombre, d_capital);
    end if;
end //
delimiter ;

-- Actualizar departamento por su id

delimiter //
create procedure actualizar_departamento(d_id_departamento int, d_id_entidad int, d_nombre VARCHAR(100), d_capital varchar(100))
begin
    if (select count(*) from departamento where id_departamento = d_id_departamento) = 0 THEN
        signal sqlstate '45000' set MESSAGE_TEXT = 'Depastamento no existente';
    elseif (select count(*) from entidad where id_entidad = d_id_entidad) = 0 THEN
        signal sqlstate '45000' set MESSAGE_TEXT = 'Entidad no encontrada';
    else 
        update departamento
        set id_entidad = d_id_entidad, nombre = d_nombre, capital = d_capital
        where id_departamento = d_id_departamento;
    end if;
end //
DELIMITER ;

create view ver_departamento as select id_departamento, id_entidad, nombre, capital from departamento; 

select * from ver_departamento;

-- Añadir parque natural

delimiter //
create procedure añadir_parque (p_nombre VARCHAR(100), p_fecha_declaracion date, p_superficie decimal(10,2), p_N_de_entradas int(3), p_id_entidad int)
begin
    if (select count(*) from entidad where id_entidad = p_id_entidad) = 0 THEN
        signal sqlstate '45000' set MESSAGE_TEXT = 'Entidad no encontrada';
    else
        insert into parque(nombre, fecha_declaracion, superficie, N_de_entradas, id_entidad)
        value (p_nombre, p_fecha_declaracion, p_superficie, p_N_de_entradas, p_id_entidad);
    end if;
end //
delimiter ;

-- Actualizar parque natural por su id

delimiter //
create procedure actualizar_parque(p_id_parque int, p_nombre VARCHAR(100), p_fecha_declaracion date, p_superficie decimal(10,2), p_N_entradas int(3), p_id_entidad int)
begin
    if (select count(*) from parque where id_parque = p_id_parque) = 0 THEN
        signal sqlstate '45000' set MESSAGE_TEXT = 'Parque no existente';
    elseif (select count(*) from entidad where id_entidad = p_id_entidad) = 0 THEN
        signal sqlstate '45000' set MESSAGE_TEXT = 'Entidad no encontrada';
    else
        update parque
        set nombre = p_nombre, fecha_declaracion = p_fecha_declaracion, superficie = p_superficie, N_de_entradas = p_N_entradas, id_entidad = p_id_entidad
        where id_parque = p_id_parque;
    end if;
end //
delimiter ;

create view ver_parque as select id_parque, nombre, fecha_declaracion, superficie, N_de_entradas, id_entidad from parque;

-- Añadir relacion entre parque_departamento

delimiter //
create procedure añadir_parquedepartamento(p_id_parque int, p_id_departamento int)
begin
    if (select count(*) from parque where id_parque = p_id_parque) = 0 THEN
        signal sqlstate '45000' set MESSAGE_TEXT = 'Parque no existente';
    elseif (select count(*) from departamento where id_departamento = p_id_departamento) = 0 THEN
        signal sqlstate '45000' set MESSAGE_TEXT = 'Departamento no existente';
    else 
        insert into parque_departamento(id_parque, id_departamento)
        value (p_id_parque, p_id_departamento);
    end if;
end //
delimiter ;

-- Actualizar relacion entre parque_departamento segun el id de parque y el departamento

delimiter //
create procedure actualizar_parquedepartamento(b_id_parque int, b_id_departamento int, a_id_parque int, a_id_departamento int)
begin
    if (select count(*) from parque where id_parque = b_id_parque) = 0 THEN
        signal sqlstate '45000' set MESSAGE_TEXT = 'Parque no encontrado';
    elseif (select count(*) from departamento where id_departamento = b_id_departamento) = 0 THEN
        signal sqlstate '45000' set MESSAGE_TEXT = 'Departamento no encontrado';
    elseif (select count(*) from parque where id_parque = a_id_parque) = 0 THEN
        signal sqlstate '45000' set MESSAGE_TEXT = 'Parque actualizado no existente';
    elseif (select count(*) from departamento where id_departamento = a_id_departamento) = 0 THEN
        signal sqlstate '45000' set MESSAGE_TEXT = 'Departamento actualizado no existente';
    else
        update parque_departamento
        set id_parque = a_id_parque, id_departamento = a_id_departamento
        where id_parque = b_id_parque and id_departamento = b_id_departamento;  
    end if; 
end //
delimiter ;

create view ver_relacion_parque_departamento as select id_parque, id_departamento from parque_departamento;

-- Añadir un area del parque
delimiter //
create procedure añadir_area(a_id_parque int, a_nombre varchar(100), a_extension decimal(10,2))
begin
    if (select count(*) from parque where id_parque = a_id_parque) = 0 THEN
        signal sqlstate '45000' set MESSAGE_TEXT = 'parque no existente';
    else
        insert into area(id_parque, nombre, extension)
        value (a_id_parque, a_nombre, a_extension);
    end if;
end //
delimiter ;

-- Actualizar area del parque por id
delimiter //
create procedure actualizar_area (a_id_area int, a_id_parque int, a_nombre VARCHAR(100), a_extension decimal(10,2))
begin
    if (select count(*) from area where id_area = a_id_area) = 0 THEN
        signal sqlstate '45000' set MESSAGE_TEXT = 'area no existente';
    elseif (select count(*) from parque where id_parque = a_id_parque) = 0 THEN
        signal sqlstate '45000' set MESSAGE_TEXT = 'parque no existente';
    else
        update area
        set id_parque = a_id_parque, nombre = a_nombre, extension = a_extension
        where id_area = a_id_area;
    end if;
end //
delimiter ;

create view ver_area as select id_area, id_parque, nombre, extension from area;

-- Añadir nueva especie en area especifica
delimiter //
create procedure añadir_especie (e_id_area int, e_tipo enum('Vegetales', 'Animales', 'Minerales'), e_nombre_cientifico varchar(100), e_nombre_vulgar varchar(100), e_cantidad int(10))
begin
    if (select count(*) from area where id_area = e_id_area) = 0 THEN
        signal sqlstate '45000' set MESSAGE_TEXT = 'area no existente';
    else
        insert into especie(id_area, tipo, nombre_cientifico, nombre_vulgar, cantidad)
        value (e_id_area, e_tipo, e_nombre_cientifico, e_nombre_vulgar, e_cantidad);
    end if;
end //
delimiter ;

-- Actualizar especie por su id
delimiter //
create procedure actualizar_especie (e_id_especie int, e_id_area int, e_tipo enum('Vegetales', 'Animales', 'Minerales'), e_nombre_cientifico varchar(100), e_nombre_vulgar varchar(100), e_cantidad int(10))
begin
    if (select count(*) from especie where id_especie = e_id_especie) = 0 THEN
        signal sqlstate '45000' set MESSAGE_TEXT = 'Especie no existente';
    elseif (select count(*) from area where id_area = e_id_area) = 0 THEN
        signal sqlstate '45000' set MESSAGE_TEXT = 'Area no existente';
    else 
        update especie
        set id_area = e_id_area, tipo = e_tipo, nombre_cientifico = e_nombre_cientifico, nombre_vulgar = e_nombre_vulgar, cantidad = e_cantidad
        where id_especie = e_id_especie;
    end if;
end //
delimiter ;

create view ver_especies as select id_especie, id_area, tipo, nombre_cientifico, nombre_vulgar, cantidad from especie;

-- Añadir personal
delimiter //
create procedure añadir_personal(p_id_parque int, p_cedula varchar(20), p_nombre varchar(100), p_direccion varchar(100), p_telefono varchar(20), p_celular varchar(20), p_sueldo decimal(10,2))
begin
    if (select count(*) from parque where id_parque = p_id_parque) = 0 THEN
        signal sqlstate '45000' set MESSAGE_TEXT = 'Parque no existente';
    else 
        insert into personal(id_parque, cedula, nombre, direccion, telefono, celular, sueldo)
        value (p_id_parque, p_cedula, p_nombre, p_direccion, p_telefono, p_celular, p_sueldo);
    end if;
end //
delimiter ;


-- Actualizar personal por id
delimiter //
create procedure actualizar_personal(p_id_personal int, p_id_parque int, p_cedula varchar(20), p_nombre varchar(100), p_direccion varchar(100), p_telefono varchar(20), celular varchar(20), sueldo decimal(10,2))
begin
    if (select count(*) from personal where id_personal = p_id_personal) = 0 THEN
        signal sqlstate '45000' set MESSAGE_TEXT = 'Personal no existente';
    elseif (select count(*) from parque where id_parque = p_id_parque) = 0 THEN
        signal sqlstate '45000' set MESSAGE_TEXT = 'Parque no existente';
    else
        update personal
        set id_parque = p_id_parque, cedual = p_cedula, nombre = p_nombre, direccion = p_direccion, telefono = p_telefono, celular = p_celular, sueldo = p_sueldo
        where id_personal = p_id_personal;
    end if;
end //
delimiter ;

create view ver_personal as select id_personal, id_parque, cedula, nombre, direccion, telefono, celular, sueldo from personal;

-- Añadir un personal_gestion
delimiter //
create procedure añadir_personal_gestion (p_id_personal int, p_n_entrada int(10))
begin
    declare v_id_parque int;
    declare v_N_de_entradas int;
    declare v_error_msg varchar(255);
    
    -- Obtener los valores de id_parque y N_de_entradas
    select p.id_parque, p.N_de_entradas
    into v_id_parque, v_N_de_entradas
    from personal pe
    join parque p on pe.id_parque = p.id_parque
    where pe.id_personal = p_id_personal;

    -- Verificar si p_n_entrada está dentro del rango permitido
    if p_n_entrada < 1 or p_n_entrada > v_N_de_entradas THEN
        set v_error_msg = CONCAT('El número de entrada debe estar dentro del rango de 1 a ', CAST(v_N_de_entradas AS CHAR));
        signal sqlstate '45000' set MESSAGE_TEXT = v_error_msg;
    end if;

    if exists (select 1 from personal_gestion pg where pg.id_personal = p_id_personal and pg.n_entrada = p_n_entrada) THEN
        signal sqlstate '45000' set MESSAGE_TEXT = 'El número de entrada ya está ocupado para este parque';
    end if;

    insert into personal_gestion(id_personal, n_entrada)
    value (p_id_personal, p_n_entrada);
end //
delimiter ;


-- actualizar personal de gestion
delimiter //
create procedure actualizar_personal_gestion(p_id_gestion int, p_id_personal int, p_n_entrada int)
begin
    declare v_id_parque int;
    declare v_N_entradas int;
    declare v_error_msg VARCHAR(225);

    select p.id_parque, p.N_entradas
    into v_id_parque, v_N_entradas
    from personal_gestion pg
    join personal pe on pg.id_personal = pe.id_personal
    join parque p on pe.id_parque = p.id_parque
    where pg.id_gestion = p_id_gestion;

    if p_n_entrada < 1 or p_n_entrada > v_N_entradas THEN
    set v_error_msg = concat('EL número de entrada debe estar dentro del rango de 1 a ', cast(v_N_entradas as char));
    signal sqlstate '45000' set MESSAGE_TEXT = v_error_msg;
    end if;

    if exists (select 1 from personal_gestion pg join personal pe on pg.id_personal = pe.id_personal
                where pe.id_parque = v_id_parque and pg.n_entrada = v_N_entradas and pg.id_gestion <> p_id_gestion) THEN
        signal sqlstate '45000' set MESSAGE_TEXT = 'El número de entradas ya esta ocupado para este parque';
    end if;

    update personal_gestion
    set id_personal = p_id_personal, n_entrada = p_n_entrada
    where id_gestion = p_id_gestion;
end //
delimiter ;

create view ver_personal_gestion as select id_gestion, id_personal, n_entrada from personal_gestion;

-- Añadir personal_vigilancia
delimiter //
create procedure añadir_personal_vigilancia(p_id_personal int, p_id_area int, p_tipo_vehiculo varchar(100), p_marca_vehiculo varchar(100))
begin
    if (select count(*) from personal where id_personal = p_id_personal) = 0 THEN
        signal sqlstate '45000' set MESSAGE_TEXT = 'Personal no existente';
    elseif (select count(*) from area where id_area = p_id_area) = 0 THEN
        signal sqlstate '45000' set MESSAGE_TEXT = 'Area no existente';
    else
    
    insert into personal_vigilancia(id_personal, id_area, tipo_vehiculo, marca_vehiculo)
    value (p_id_personal, p_id_area, p_tipo_vehiculo, p_marca_vehiculo);
    end if;
end //
delimiter ;

-- Actualizar personal_vigilancia 
delimiter //
create procedure actualizar_personal_vigilancia (p_id_vigilancia int, p_id_personal int, p_id_area int, p_tipo_vehiculo varchar(100), p_marca_vehiculo varchar(100))
begin
    if (select count(*) from personal_vigilancia where id_vigilancia = p_id_vigilancia) = 0 THEN
        signal sqlstate '45000' set MESSAGE_TEXT = 'Personal de vigilancia no existente';
    elseif (select count(*) from personal where id_personal = p_id_personal) = 0 THEN
        signal sqlstate '45000' set MESSAGE_TEXT = 'Personal no existente';
    elseif (select count(*) from area where id_area = p_id_area) = 0 THEN
        signal sqlstate '45000' set MESSAGE_TEXT = 'Area no existente';
    else
    update personal_vigilancia
    set id_personal = p_id_personal, id_area = p_id_area, tipo_vehiculo = p_tipo_vehiculo, marca_vehiculo = p_marca_vehiculo
    where id_vigilancia = p_id_vigilancia;
    end if;
end //
delimiter ;

create view ver_personal_vigilancia as select id_vigilancia, id_personal, id_area, tipo_vehiculo, marca_vehiculo from personal_vigilancia;

-- Añadir personal_conservacion
delimiter //
create procedure añadir_personal_conservacion(p_id_personal int, p_id_area int, p_especialidad ENUM('limpieza', 'caminos', 'alojamiento'))
begin
    if (select count(*) from personal where id_personal = p_id_personal) = 0 THEN
            signal sqlstate '45000' set MESSAGE_TEXT = 'Personal no existente';
    elseif (select count(*) from area where id_area = p_id_area) = 0 THEN
        signal sqlstate '45000' set MESSAGE_TEXT = 'Area no existente';
    else
    insert into personal_conservacion(id_personal, id_area, especialidad)
    value (p_id_personal, p_id_area, p_especialidad);
    end if;
end //
delimiter ;

-- Actualizar personla_conservacion
delimiter //
create procedure actualizar_personal_conservacion (p_id_conservacion int, p_id_personal int, p_id_area int, p_especialidad enum('limpieza', 'caminos', 'alojamientos'))
begin
    if (select count(*) from personal_conservacion where id_conservacion = p_id_conservacion) = 0 THEN
        signal sqlstate '45000' set MESSAGE_TEXT = 'Personal de conservacion no existente';
    elseif (select count(*) from personal where id_personal = p_id_personal) = 0 THEN
            signal sqlstate '45000' set MESSAGE_TEXT = 'Personal no existente';
    elseif (select count(*) from area where id_area = p_id_area) = 0 THEN
        signal sqlstate '45000' set MESSAGE_TEXT = 'Area no existente';
    else
    update personal_conservacion
    set id_personal = p_id_personal, id_area = p_id_area, especialidad = p_especialidad
    where id_conservacion = p_id_conservacion;
    end if;
end //
delimiter ;

create view ver_personal_conservacion as select id_conservacion, id_personal, id_area, especialidad from personal_conservacion;

-- Añadir personal_investigador
delimiter //
create procedure añadir_personal_investigador(p_id_personal int, p_titulacion varchar(100))
begin
    if (select count(*) from personal where id_personal = p_id_personal) = 0 THEN
        signal sqlstate '45000' set MESSAGE_TEXT = 'Personal no existente';
    else
        insert into personal_investigador( id_personal, titulacion)
        value (p_id_personal, p_titulacion);
    end if;
end //
delimiter ;

-- Actualizar personal_investigador
delimiter //
create procedure actualizar_personal_investigador(p_id_investigador int, p_id_personal int, p_titulacion varchar(100))
begin
    if (select count(*) from personal_investigador where id_investigador = p_id_investigador) = 0 THEN
        signal sqlstate '45000' set MESSAGE_TEXT = 'Personal investigador no encontrado';
    elseif (select count(*) from personal where id_personal = p_id_personal) = 0 THEN
        signal sqlstate '45000' set MESSAGE_TEXT = 'Personal no existente';
    else
    update personal_investigador
    set id_personal = p_id_personal, titulacion = p_titulacion
    where id_investigador = p_id_investigador;
    end if;
end //
delimiter ;

create view ver_personal_investigador as select id_investigador, id_personal, titulacion from personal_investigador;

-- Añadir proyecto
delimiter //
create procedure añadir_proyecto (p_nombre varchar(100), p_presupuesto decimal(10,2), p_fecha_inicio date, p_fecha_fin date)
begin
    insert into proyecto(nombre, presupuesto, fecha_inicio, fecha_fin)
    value (p_nombre, p_presupuesto, p_fecha_inicio, p_fecha_fin);
end //
delimiter ;

-- Actualizar proyecto
delimiter //
create procedure actualizar_proyecto(p_id_proyecto int, p_nombre varchar(100), p_presupuesto decimal(10,2), p_fecha_inicio date, p_fecha_fin date)
begin
    if (select count(*) from proyecto where id_proyecto = p_id_proyecto) = 0 THEN
        signal sqlstate '45000' set MESSAGE_TEXT = 'Proyecto no existente';
    else
        update proyecto
        set nombre = p_nombre, presupuesto = p_presupuesto, fecha_inicio = p_fecha_inicio, fecha_fin = p_fecha_fin
        where id_proyecto = p_id_proyecto;
    end if;
end //
delimiter ;

create view ver_proyecto as select id_proyecto, nombre, presupuesto, fecha_inicio, fecha_fin from proyecto;

-- Relaciona una investigacion
delimiter //
create procedure relacion_investigacion(r_id_proyecto int, r_id_investigador int, r_id_especie int)
begin
    if (select count(*) from proyecto where id_proyecto = r_id_proyecto) = 0 THEN
        signal sqlstate '45000' set MESSAGE_TEXT = 'Proyecto no existente';
    elseif (select count(*) from personal_investigador where id_investigador = r_id_investigador) = 0 THEN
        signal sqlstate '45000' set MESSAGE_TEXT = 'Investigador no existente';
    elseif (select count(*) from especie where id_especie = r_id_especie) = 0 THEN
        signal sqlstate '45000' set MESSAGE_TEXT = 'Especie no existente';
    else
        insert into investigacion(id_proyecto, id_investigador, id_especie)
        value (r_id_proyecto, r_id_investigador, r_id_especie);
    end if;
end //
delimiter ;

-- Actualizar relacion de una investigacion
delimiter //
create procedure actualizar_investigacion(r_id_proyecto int, r_id_investigador int, r_id_especie int, nuevo_id_proyecto int, nuevo_id_investigador int, nuevo_id_especie int)
begin
    if (select count(*) from proyecto where id_proyecto = r_id_proyecto) = 0 then
        signal sqlstate '45000' set message_text = 'proyecto no existente';
    elseif (select count(*) from personal_investigador where id_investigador = r_id_investigador) = 0 then
        signal sqlstate '45000' set message_text = 'investigador no existente';
    elseif (select count(*) from especie where id_especie = r_id_especie) = 0 then
        signal sqlstate '45000' set message_text = 'especie no existente';
    elseif (select count(*) from proyecto where id_proyecto = nuevo_id_proyecto) = 0 then
        signal sqlstate '45000' set message_text = 'nuevo proyecto no existente';
    elseif (select count(*) from personal_investigador where id_investigador = nuevo_id_investigador) = 0 then
        signal sqlstate '45000' set message_text = 'nuevo investigador no existente';
    elseif (select count(*) from especie where id_especie = nuevo_id_especie) = 0 then
        signal sqlstate '45000' set message_text = 'nueva especie no existente';
    else
        update investigacion
        set id_proyecto = nuevo_id_proyecto,
            id_investigador = nuevo_id_investigador,
            id_especie = nuevo_id_especie
        where id_proyecto = r_id_proyecto
          and id_investigador = r_id_investigador
          and id_especie = r_id_especie;
    end if;
end //
delimiter ;

create view ver_investigacion as select id_proyecto, id_investigador, id_especie from investigacion;

-- Añadir visitante
delimiter //
create procedure añadir_visitante(v_id_personal_gestion int, v_cedula varchar(20), v_nombre varchar(100), v_direccion varchar(100), v_profesion varchar(100))
begin
    if (select count(*) from personal_gestion where id_gestion = v_id_personal_gestion) = 0 THEN
        signal sqlstate '45000' set MESSAGE_TEXT = 'Personal de gestion no existente';
    else
        insert into visitante(id_personal_gestion, cedula, nombre, direccion, profesion)
        value (v_id_personal_gestion, v_cedula, v_nombre, v_direccion, v_profesion);
    end if;
end //
delimiter ;

-- Actualizar visitante por id
delimiter //
create procedure actualizar_visitante(v_id_visitante int, v_id_personal_gestion int, v_cedula varchar(20), v_nombre varchar(100), v_direccion varchar(100), v_profesion varchar(100))
begin
    if (select count(*) from visitante where id_visitante = v_id_visitante) = 0 THEN
        signal sqlstate '45000' set MESSAGE_TEXT = 'Visitante no existente';
    elseif (select count(*) from personal_gestion where id_gestion = v_id_personal_gestion) = 0 THEN
        signal sqlstate '45000' set MESSAGE_TEXT = 'Personal de gestion no existente';
    else
        update visitante
        set id_personal_gestion = v_id_personal_gestion, cedula = v_cedula, nombre = v_nombre, direccion = v_direccion, profesion = v_profesion
        where id_visitante = v_id_visitante;
    end if;
end //
delimiter ;

create view ver_visitantes as select id_visitante, id_personal_gestion, cedula, nombre, direccion, profesion from visitante;

-- añadir alojamiento
delimiter //
create procedure anadir_alojamiento (p_id_visitante int, p_nombre varchar(100), p_capacidad int, p_categoria enum('Cabaña', 'Camping', 'Hotel', 'Hostales'), p_fecha_inicio date, p_fecha_final date)
begin
    declare v_capacidad_actual int;
    declare v_capacidad_maxima int;
    declare v_error_msg varchar(255);

    select capacidad into v_capacidad_maxima
    from alojamiento
    where nombre = p_nombre
      and categoria = p_categoria
    limit 1;

    select count(*) into v_capacidad_actual
    from alojamiento
    where nombre = p_nombre
      and categoria = p_categoria
      and ((p_fecha_inicio between fecha_inicio and fecha_final) 
           or (p_fecha_final between fecha_inicio and fecha_final) 
           or (fecha_inicio between p_fecha_inicio and p_fecha_final) 
           or (fecha_final between p_fecha_inicio and p_fecha_final));

    if v_capacidad_actual + 1 > v_capacidad_maxima then
        set v_error_msg = 'Capacidad excedida para el alojamiento ' || p_nombre || ' en las fechas especificadas';
        signal sqlstate '45000' set message_text = v_error_msg;
    else
        insert into alojamiento (id_visitante, nombre, capacidad, categoria, fecha_inicio, fecha_final) 
        values (p_id_visitante, p_nombre, p_capacidad, p_categoria, p_fecha_inicio, p_fecha_final);
    end if;
end //
delimiter ;

-- Actualizar alojamiento

delimiter //
create procedure actualizar_alojamiento (p_id_alojamiento int, p_id_visitante int, p_nombre varchar(100), p_capacidad int, p_categoria enum('Cabaña', 'Camping', 'Hotel', 'Hostales'), p_fecha_inicio date, p_fecha_final date)
begin
    declare v_capacidad_actual int;
    declare v_capacidad_maxima int;
    declare v_error_msg varchar(255);

    select capacidad into v_capacidad_maxima
    from alojamiento
    where nombre = p_nombre
      and categoria = p_categoria
    limit 1;

    select count(*) into v_capacidad_actual
    from alojamiento
    where nombre = p_nombre
      and categoria = p_categoria
      and id_alojamiento <> p_id_alojamiento
      and ((p_fecha_inicio between fecha_inicio and fecha_final) 
           or (p_fecha_final between fecha_inicio and fecha_final) 
           or (fecha_inicio between p_fecha_inicio and p_fecha_final) 
           or (fecha_final between p_fecha_inicio and p_fecha_final));

    if v_capacidad_actual + 1 > v_capacidad_maxima then
        set v_error_msg = 'Capacidad excedida para el alojamiento ' || p_nombre || ' en las fechas especificadas';
        signal sqlstate '45000' set message_text = v_error_msg;
    else
        update alojamiento
        set id_visitante = p_id_visitante, nombre = p_nombre, capacidad = p_capacidad, categoria = p_categoria, fecha_inicio = p_fecha_inicio, fecha_final = p_fecha_final
        where id_alojamiento = p_id_alojamiento;
    end if;
end //
delimiter ;

create view ver_alojamientos as select id_alojamiento, id_visitante, nombre, capacidad, categoria, fecha_inicio, fecha_final from alojamiento;
