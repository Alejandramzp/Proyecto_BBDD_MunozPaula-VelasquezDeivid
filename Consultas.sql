-- #######################
-- ###### Consultas ######
-- #######################

use Ambientales;

-- Departamentos con varios parques 
select d.nombre as NombreDepartamento, count(pd.id_parque) as Numero_parques
from departamento d
join parque_departamento pd on d.id_departamento = pd.id_departamento
group by d.id_departamento
HAVING count(pd.id_parque) > 1;

-- número de parques existentes en cada departamento y la superficie total declarada de cada parque.
select d.nombre as NombreDepartamento, p.nombre as NombreParque, p.superficie
from departamento d
inner join parque_departamento pd on d.id_departamento = pd.id_departamento
inner join parque p on pd.id_parque = p.id_parque;

-- observar investigacion por id
select p.nombre AS nombre_proyecto, p.presupuesto, p.fecha_inicio, p.fecha_fin, pi.titulacion, per.nombre AS nombre_personal, e.nombre_cientifico, e.nombre_vulgar, e.tipo, e.cantidad
from investigacion i
join proyecto p ON i.id_proyecto = p.id_proyecto
join personal_investigador pi ON i.id_investigador = pi.id_investigador
join personal per ON pi.id_personal = per.id_personal
join especie e ON i.id_especie = e.id_especie;
