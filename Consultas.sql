-- #######################
-- ###### Consultas ######
-- #######################

use Ambientales;

create index idx_parque_count on parque(id_parque);
-- Departamentos con varios parques 
select d.nombre as NombreDepartamento, count(pd.id_parque) as Numero_parques
from departamento d
join parque_departamento pd on d.id_departamento = pd.id_departamento
group by d.id_departamento
HAVING count(pd.id_parque) > 1;

create index idx_superficie_parque on parque(superficie);
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


-- Consulta para mostrar al profe pedro trabajando XD
select p.nombre AS nombre_personal, pa.nombre AS nombre_parque, a.nombre AS nombre_area, pv.tipo_vehiculo, pv.marca_vehiculo
from personal p
join parque pa ON p.id_parque = pa.id_parque
join personal_vigilancia pv ON p.id_personal = pv.id_personal
join area a ON pv.id_area = a.id_area
where p.id_personal = 3;
