-- Active: 1720143799702@@127.0.0.1@3306@ambientales
-- ########################################
-- ###### FUnciones y Procedimientos ######
-- ########################################

use ambientales;


-- Añadir una Entidad
DELIMITER //
create procedure añadir_entidad (e_nombre VARCHAR(100))
begin
    insert into entidad(nombre)
    values (e_nombre);
end //
DELIMITER ;

call añadir_entidad('Ministerio de educacion ambiental');

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

call actualizar_entidad(2, 'Hola mundo');
select * from entidad;
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

call añadir_departamento (1, 'Santander', 'Bucaramanga');

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

call actualizar_departamento(1, 1, 'Condinamarca', 'Bogota');
select * from departamento;

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

call añadir_parque('Tayrona', '2012-06-21', 50000.20, 12, 1);

select * from parque;

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

call actualizar_parque(1, 'Chicamocha', '2000-01-11', 12000.22, 2, 1);

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

call añadir_parquedepartamento(1, 1);

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

call actualizar_parquedepartamento(1, 1, 1, 1);


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

call añadir_area(1, 'motañosa', 1200.22);

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

call añadir_especie(1, 'Animales', 'Lasius niger', 'hormiga negra de jardineria', 200);

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

call añadir_personal(1, '1096701633', 'Deivid Velasquez Gutierrez', 'calle 84 #43-2', '', '3178925556', 3000000.00);
select * from personal;

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

call añadir_personal_gestion (1, 1);

-- actualizar personal de gestion