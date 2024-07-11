-- ##################################
-- ###### Creacion de usuarios ######
-- ##################################

use Ambientales;

create user 'Entidad_Responsable'@'%' IDENTIFIED BY 'entidad123';
create user 'Personal_gestion'@'%' IDENTIFIED BY 'gestion321';
create user 'Personal_vigilancia'@'%' IDENTIFIED BY 'vigilancia456';
create user 'Personal_conservacion'@'%' IDENTIFIED BY 'conservacion654';
create user 'Personal_investigador'@'%' IDENTIFIED BY 'investigador789';
create user 'visitante'@'%' IDENTIFIED BY 'visitante987';

-- Permisos de entidad_responsable
grant execute on procedure Ambientales.añadir_entidad to 'Entidad_Responsable'@'%';
grant execute on procedure Ambientales.actualizar_entidad to 'Entidad_Responsable'@'%';
grant select on  Ambientales.ver_entidad to 'Entidad_Responsable'@'%';
grant execute on procedure Ambientales.añadir_departamento to 'Entidad_Responsable'@'%';
grant execute on procedure Ambientales.actualizar_departamento to 'Entidad_Responsable'@'%';
grant select on  Ambientales.ver_departamento to 'Entidad_Responsable'@'%';
grant execute on procedure Ambientales.añadir_parque to 'Entidad_Responsable'@'%';
grant execute on procedure Ambientales.actualizar_parque to 'Entidad_Responsable'@'%';
grant select on  Ambientales.ver_parque to 'Entidad_Responsable'@'%';
grant execute on procedure Ambientales.añadir_parquedepartamento to 'Entidad_Responsable'@'%';
grant execute on procedure Ambientales.actualizar_parquedepartamento to 'Entidad_Responsable'@'%';
grant select on  Ambientales.ver_relacion_parque_departamento to 'Entidad_Responsable'@'%';
grant execute on procedure Ambientales.añadir_area to 'Entidad_Responsable'@'%';
grant execute on procedure Ambientales.actualizar_area to 'Entidad_Responsable'@'%';
grant select on  Ambientales.ver_area to 'Entidad_Responsable'@'%';
grant execute on procedure Ambientales.añadir_especie to 'Entidad_Responsable'@'%';
grant execute on procedure Ambientales.actualizar_especie to 'Entidad_Responsable'@'%';
grant select on  Ambientales.ver_especies to 'Entidad_Responsable'@'%';
grant execute on procedure Ambientales.añadir_personal to 'Entidad_Responsable'@'%';
grant execute on procedure Ambientales.actualizar_personal to 'Entidad_Responsable'@'%';
grant select on  Ambientales.ver_personal to 'Entidad_Responsable'@'%';
grant execute on procedure Ambientales.añadir_personal_gestion to 'Entidad_Responsable'@'%';
grant execute on procedure Ambientales.actualizar_personal_gestion to 'Entidad_Responsable'@'%';
grant select on  Ambientales.ver_personal_gestion to 'Entidad_Responsable'@'%';
grant execute on procedure Ambientales.añadir_personal_vigilancia to 'Entidad_Responsable'@'%';
grant execute on procedure Ambientales.actualizar_personal_vigilancia to 'Entidad_Responsable'@'%';
grant select on  Ambientales.ver_personal_vigilancia to 'Entidad_Responsable'@'%';
grant execute on procedure Ambientales.añadir_personal_conservacion to 'Entidad_Responsable'@'%';
grant execute on procedure Ambientales.actualizar_personal_conservacion to 'Entidad_Responsable'@'%';
grant select on  Ambientales.ver_personal_conservacion to 'Entidad_Responsable'@'%';
grant execute on procedure Ambientales.añadir_personal_investigador to 'Entidad_Responsable'@'%';
grant execute on procedure Ambientales.actualizar_personal_investigador to 'Entidad_Responsable'@'%';
grant select on  Ambientales.ver_personal_investigador to 'Entidad_Responsable'@'%';


-- Permisos de Personal_gestion

grant select on  Ambientales.ver_personal_gestion to 'Personal_gestion'@'%';
grant execute on procedure Ambientales.añadir_visitante to 'Personal_gestion'@'%';
grant execute on procedure Ambientales.actualizar_visitante to 'Personal_gestion'@'%';
grant select on  Ambientales.ver_visitantes to 'Personal_gestion'@'%';
grant execute on procedure Ambientales.anadir_alojamiento to 'Personal_gestion'@'%';
grant execute on procedure Ambientales.actualizar_alojamiento to 'Personal_gestion'@'%';
grant select on  Ambientales.ver_alojamientos to 'Personal_gestion'@'%';

-- Permisos de personal vigilancia

grant select on Ambientales.personal_vigilancia to 'Personal_vigilancia'@'%';
grant select on Ambientales.personal to 'Personal_vigilancia'@'%';
grant select on Ambientales.area to 'Personal_vigilancia'@'%';
grant select on Ambientales.ver_personal_vigilancia to 'Personal_vigilancia'@'%';

-- Permisos de personal conservacion

grant select on Ambientales.personal_conservacion to 'Personal_conservacion'@'%';
grant select on Ambientales.personal to 'Personal_conservacion'@'%';
grant select on Ambientales.area to 'Personal_conservacion'@'%';
grant select on Ambientales.ver_personal_conservacion to 'Personal_conservacion'@'%';

-- Permisos de personal investigadores

grant select on Ambientales.personal_investigador to 'Personal_investigador'@'%';
grant select on Ambientales.personal to 'Personal_investigador'@'%';
grant select on Ambientales.proyecto to 'Personal_investigador'@'%';
grant execute on procedure Ambientales.añadir_proyecto to 'Personal_investigador'@'%';
grant execute on procedure Ambientales.actualizar_proyecto to 'Personal_investigador'@'%';
grant execute on procedure Ambientales.relacion_investigacion to 'Personal_investigador'@'%';
grant execute on procedure Ambientales.actualizar_investigacion to 'Personal_investigador'@'%';

-- Permisos de visitante
grant select on Ambientales.ver_visitantes to 'visitante'@'%';
grant select on Ambientales.ver_alojamientos to 'visitante'@'%';
