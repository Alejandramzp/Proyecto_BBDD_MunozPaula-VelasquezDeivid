-- #######################################
-- ###### Inserciones de las Tablas ######
-- #######################################

USE Ambientales;

-- ENTIDAD
INSERT INTO entidad (nombre) VALUES
('Sistema Nacional de Áreas Protegidas (SINAP)'),
('Corporación Autónoma Regional del Magdalena (CORPAMAG)'), 
('Corporación Autónoma Regional del Cesar (CORPOCESAR)'),
('Ministerio de Ambiente y Desarrollo Sostenible'),
('Parques Nacionales Naturales de Colombia (PNN)'),
('Unidad Administrativa Especial del Sistema de Parques Nacionales Naturales (UAESPNN)'),
('Corporación Autónoma Regional de Santander (CAS)'),
('Sistema de Parques Nacionales Naturales (SPNN)'),
('Corporación para el Desarrollo Sostenible del Norte y el Oriente Amazónico (CDA)');

-- DEPARTAMENTO
INSERT INTO departamento (id_entidad,nombre,capital) VALUES
(1,'Magdalena','Santa Marta'),
(3,'Cesar','Valledupar'),
(2,'La Guajira','Rioacha'),
(4,'Caldas','Manizales'),
(4,'Quindío','Armenia'),
(4,'Risaralda','Pereira'),
(4,'Tolima','Ibagué'),
(5,'Meta','Villavicencio'),
(1,'Amazonas','Leticia'),
(6,'Valle del Cauca','Cali'),
(6,'Cundinamarca','Bogotá'),
(7,'Santander','Bucaramanga'),
(8,'Arauca','Arauca'),
(8,'Casanare','Yopal'),
(8,'Boyacá','Tunja'),
(9,'Vichada','Puerto Careño');

-- PARQUE
INSERT INTO parque (nombre,fecha_declaracion,superficie,N_de_entradas,id_entidad) VALUES
('Parque Nacional Natural Tayrona','1964-08-30',15000,3,1),
('Parque Nacional Natural Sierra Nevada de Santa Marta','1964-08-31',573312,6,2),
('Parque Nacional Natural Los Nevados','1974-04-30',61388.24,4,4),
('Valle del Cocora','1985-09-16',59080,4,5),
('Parque Nacional Natural Sierra de la Macarena','1989-10-01',629280,2,5),
('Parque Nacional Natural Amacayacu','1975-10-27',267241,1,1),
('Parque Nacional Natural Uramba Bahía Málaga','2010-08-04',47094,3,6),
('Parque Nacional Natural Sumapaz','1977-06-06',210739,3,6),
('Parque Nacional del Chicamocha','2006-10-13',264,2,7),
('Parque Nacional Natural El Cocuy','1977-06-06',305879,3,8);

-- PARQUE DEPARTAMENTO
INSERT INTO parque_departamento (id_parque,id_departamento) VALUES
(1,1),
(2,1),
(2,2),
(2,3),
(3,4),
(3,5),
(3,6),
(3,7),
(4,5),
(5,8),
(6,9),
(7,10),
(8,8),
(8,11),
(9,12),
(10,13),
(10,14),
(10,15);

-- AREA
INSERT INTO area (id_parque,nombre,extension) VALUES
(1,'Sector Calabazo',4585), -- caminata
(1,'Sector Arrecifes',6247), -- acampar
(1,'Sector Cañaveral',2919), -- playas
(1,'Sector Palangana',1249), -- bosques ...4

(2,'Sector Tayrona',266756), -- playas
(2,'Sector Páramo de San Lorenzo',153842), -- paramo montaña
(2,'Sector Páramo de Macotama',152714), -- paramo ...7

(3,'Sector del Nevado del Ruiz',19672.8), -- paramo y lagunas
(3,'Sector del Nevado de Santa Isabel',12792.9), -- glaciares lagunas
(3,'Sector del Nevado del Tolima',28924.7), -- paramo y lagunas ....10

(4,'Bosque de Palma de Cera',22743), -- la palma de cera 
(4,'Finca La Montaña',14895), -- la naturaleza y observar aves
(4,'Bosque de niebla',21442), -- bosques de montaña....13

(5,'Sector Caño Cristales',126473), -- río de los cinco colores
(5,'Sector Raudal Angosturas',121499), -- raudales y formaciones rocosas
(5,'Sector La Cachivera',98762), --  biodiversidad y paisajes  
(5,'Sector Piedra de Loros',124629), -- la diversidad de aves
(5,'Sector El Mirador',157917), -- aves y fauna silvestre ....18

(6,'Sector Yavari',92864), -- 
(6,'Sector Zafire',89723), --
(6,'Sector Araracuara',84654), -- ......21 

(7,'Zona Núcleo',15642), -- conservación estricta de la biodiversidad y los ecosistemas
(7,'Zona de Amortiguamiento',12893), --  ecosistemas protegidos
(7,'Zona de Uso Sostenible',18559), -- pesca artesanal .....24 

(8,'Sector Chisacá',73562), -- páramos y lagunas glaciares
(8,'Sector Sumapaz Central',86429), -- páramos, lagunas y montañas.
(8,'Sector Sumapaz Sur',50748), -- ecosistemas de páramo ....27

(9,'Mirador Panorámico',84),
(9,'Zona Teleférico',88),
(9,'Zona Extrema',92), -- parapente, rappel y escalada ......30

(10,'Zona del Pan de Azúcar',43580), --  Senderos para los visitantes
(10,'Zona del Ritacuba Blanco',98473), --  Pico Ritacuba Blanco el más alto
(10,'Zona de Güicán y Chita',163826); -- montañas y pico .......33

-- ESPECIE
INSERT INTO especie (id_area,tipo,nombre_cientifico,nombre_vulgar,cantidad) VALUES
(4,'Animales','Panthera onca','Jaguar',18),
(1,'Animales','Caiman crocodilus fuscus','Caimán de anteojos',350),
(4,'Vegetales','Anacardium excelsum','Caracolí',5000),
(3,'Vegetales','Attalea butyracea','Palma de corozo',40000),
(3,'Animales','Ara macao','Guacamayo rojo',58), -- #####

(6,'Animales','Puma concolor','Puma',24),
(7,'Animales','Tapirus terrestris','Tapir',62),
(5,'Vegetales','Brownea macrophylla','Cuerno de loro',246),
(5,'Vegetales','Passiflora quadrangularis','Granadilla gigante',135),
(6,'Vegetales','Quercus humboldtii','Roble de montaña',215),-- ###

(8,'Animales','Tremarctos ornatus','Oso de anteojos',40),
(8,'Vegetales','Polylepis spp','Árbol de papel',162),
(9,'Animales','Oreotrochilus estella','Colibrí del Nevado',50),
(10,'Vegetales','Valeriana spp','Valeriana',347), -- ###

(11,'Vegetales','Ceroxylon quindiuense','Palma de cera',1200),
(13,'Animales','Rupicola peruvianus','Gallito de roca',38),
(12,'Minerales','Silice','Cuarzo',652), -- ###

(14,'Animales','Podocnemis spp','Tortuga de río',126),
(17,'Animales','Crax rubra','Paujil',21),
(18,'Vegetales','Mauritia flexuosa','Moriche',1028), -- ###

(21,'Animales','Inia geoffrensis','Delfín rosado',46),
(21,'Animales','Caiman crocodilus','Caimán blanco',32),
(19,'Vegetales','Ceiba pentandra','Ceiba',183),
(20,'Vegetales','Victoria amazonica','Victoria regia',598), 
(20,'Minerales','Thalurania','Zafiro',192), -- ###

(22,'Animales','Megaptera novaeangliae','Ballena jorobada',29),
(22,'Animales','Dermochelys coriacea','Tortuga laúd',64),
(23,'Vegetales','Coccoloba uvifera','Uvita de playa',36),
(24,'Vegetales','Rhizophora mangle','Mangle rojo',385), -- ###

(26,'Animales','Oreotrochilus estella','Colibrí del Sumapaz',48),
(27,'Animales','Pseudoryzomys simplex','Rata de páramo',164),
(25,'Vegetales','Lupinus pubescens','Chocho de páramo',1386), -- ####

(30,'Animales','Vultur gryphus','Cóndor andino',16),
(28,'Vegetales','Stenocereus griseus','Cardón',1523),
(29,'Animales','Mazama americana','Venado conejo',11),-- ####

(32,'Vegetales','Espeletia grandiflora','Frailejón gigante',1642),
(31,'Animales','Atelopus spp','Ranas de cristal',47),
(32,'Animales','Cinclodes excelsior','Churrete real',36),
(33,'Animales','Draba spp','Draba',2450);

-- PERSONAL
INSERT INTO personal (id_parque,cedula,nombre,direccion,telefono,celular,sueldo) VALUES
(1, '1234567890', 'Carlos García', 'Carrera 10 #20-30', '1234567', '3219876543', 2500000),
(1, '2345678901', 'María López', 'Calle 15 #25-40', '2345678', '3456789123', 2800000),
(1, '3456789012', 'Pedro Gómez', 'Avenida 5 #15-25', '3456789', '4567891234', 2700000),
(1, '4567890123', 'Laura Gómez', 'Carrera 8 #21-35', '4567890', '5678912345', 2600000),
(1, '5678901234', 'Javier Ramírez', 'Carrera 5 #9-14', '5678901', '6789123456', 3000000),
(1, '6789012345', 'Ana Rodríguez', 'Avenida 12 #18-23', '6789012', '7891234567', 2900000),
(1, '7890123456', 'Andrés Sánchez', 'Transversal 15 #22-27', '7890123', '8912345678', 2800000),
(1, '8901234567', 'Valentina Pérez', 'Diagonal 10 #12-17', '8901234', '9123456789', 3100000),
(1, '9012345678', 'Diego Martínez', 'Calle 20 #14-19', '9012345', '1234567890', 3000000),
(1, '0123456789', 'Sofía Gómez', 'Avenida 18 #23-28', '0123456', '2345678901', 2900000),
(1, '1234567890', 'María García', 'Carrera 12 #20-30', '1234567', '3219876543', 2600000),
(1, '2345678901', 'Juan López', 'Calle 17 #25-40', '2345678', '3456789123', 2700000),
(1, '4567890123', 'Carlos Gómez', 'Carrera 9 #21-35', '4567890', '5678912345', 2900000), -- 13

(2, '5678901234', 'Sofía Ramírez', 'Carrera 6 #9-14', '5678901', '6789123456', 3000000),-- 14
(2, '6789012345', 'Andrés Rodríguez', 'Avenida 11 #18-23', '6789012', '7891234567', 3100000),
(2, '7890123456', 'Ana Sánchez', 'Transversal 16 #22-27', '7890123', '8912345678', 2800000),
(2, '8901234567', 'Javier Pérez', 'Diagonal 11 #12-17', '8901234', '9123456789', 2900000),
(2, '9012345678', 'Valentina Martínez', 'Calle 21 #14-19', '9012345', '1234567890', 3000000),
(2, '0123456789', 'Diego Gómez', 'Avenida 19 #23-28', '0123456', '2345678901', 3100000),
(2, '1234567890', 'Carolina Ramírez', 'Carrera 11 #20-30', '1234567', '3219876543', 3200000),
(2, '2345678901', 'Miguel López', 'Calle 16 #25-40', '2345678', '3456789123', 3300000),
(2, '3456789012', 'Laura Martínez', 'Avenida 8 #15-25', '3456789', '4567891234', 3400000),
(2, '4567890123', 'Jorge Gómez', 'Carrera 7 #21-35', '4567890', '5678912345', 3500000),
(2, '3456789012', 'Laura Martínez', 'Avenida 7 #15-25', '3456789', '4567891234', 2800000),
(2, '5678901234', 'Valeria Ramírez', 'Carrera 4 #9-14', '5678901', '6789123456', 3600000),
(2, '3456789013', 'Laura Martínez', 'Avenida 5 #15-25', '3456789', '4567891234', 3500000),
(2, '4567890124', 'Jorge Ramírez', 'Carrera 8 #21-35', '4567890', '5678912345', 3600000), -- 27

(3, '6789012345', 'Daniel Rodríguez', 'Avenida 10 #18-23', '6789012', '7891234567', 3700000),-- 28
(3, '7890123456', 'Santiago Sánchez', 'Transversal 17 #22-27', '7890123', '8912345678', 3800000),
(3, '8901234567', 'María Pérez', 'Diagonal 12 #12-17', '8901234', '9123456789', 3900000),
(3, '9012345678', 'Juan Martínez', 'Calle 22 #14-19', '9012345', '1234567890', 4000000),
(3, '0123456789', 'Carolina Gómez', 'Avenida 20 #23-28', '0123456', '2345678901', 4100000),
(3, '1234567890', 'Andrés Ramírez', 'Carrera 12 #20-30', '1234567', '3219876543', 4200000),
(3, '2345678901', 'Valentina López', 'Calle 17 #25-40', '2345678', '3456789123', 4300000),
(3, '3456789012', 'Diego Martínez', 'Avenida 7 #15-25', '3456789', '4567891234', 4400000),
(3, '4567890123', 'Ana Gómez', 'Carrera 9 #21-35', '4567890', '5678912345', 4500000),
(3, '5678901234', 'Javier Ramírez', 'Carrera 6 #9-14', '5678901', '6789123456', 4600000),
(3, '6789012345', 'Sofía Rodríguez', 'Avenida 11 #18-23', '6789012', '7891234567', 4700000), -- 38


(4, '7890123456', 'Andrea Sánchez', 'Transversal 16 #22-27', '7890123', '8912345678', 4800000), -- 39
(4, '6789012345', 'Gabriela García', 'Carrera 13 #24-31', '6789012', '7891234567', 2800000),
(4, '7890123456', 'Luisa Martínez', 'Avenida 6 #16-26', '7890123', '8912345678', 2900000),
(4, '8901234567', 'Carlos Pérez', 'Diagonal 9 #13-18', '8901234', '9123456789', 3000000),
(4, '9012345678', 'María Sánchez', 'Calle 19 #15-20', '9012345', '1234567890', 3100000),
(4, '0123456789', 'Pedro Ramírez', 'Avenida 17 #22-27', '0123456', '2345678901', 3200000),
(4, '1234567891', 'Ana López', 'Carrera 10 #20-30', '1234567', '3219876543', 3300000),
(4, '2345678902', 'Diego Sánchez', 'Calle 15 #25-40', '2345678', '3456789123', 3400000),
(4, '3456789013', 'Valentina Gómez', 'Avenida 5 #15-25', '3456789', '4567891234', 3500000),
(4, '4567890124', 'Javier Martínez', 'Carrera 8 #21-35', '4567890', '5678912345', 3600000),
(4, '5678901235', 'Laura Ramírez', 'Carrera 5 #9-14', '5678901', '6789123456', 3700000),
(4, '6789012346', 'Santiago Rodríguez', 'Avenida 12 #18-23', '6789012', '7891234567', 3800000), -- 50


(5, '7890123457', 'Carolina Pérez', 'Transversal 15 #22-27', '7890123', '8912345678', 3900000), -- 51
(5, '8901234568', 'Andrés Martínez', 'Diagonal 10 #12-17', '8901234', '9123456789', 4000000),
(5, '9012345679', 'Valeria Gómez', 'Calle 20 #14-19', '9012345', '1234567890', 4100000),
(5, '0123456780', 'Jorge Ramírez', 'Avenida 18 #23-28', '0123456', '2345678901', 4200000),
(5, '1234567892', 'Miguel Rodríguez', 'Carrera 12 #20-30', '1234567', '3219876543', 4300000),
(5, '2345678903', 'Laura López', 'Calle 17 #25-40', '2345678', '3456789123', 4400000),
(5, '3456789014', 'Diego Martínez', 'Avenida 7 #15-25', '3456789', '4567891234', 4500000),
(5, '4567890125', 'Ana Gómez', 'Carrera 9 #21-35', '4567890', '5678912345', 4600000),
(5, '5678901236', 'Javier Ramírez', 'Carrera 6 #9-14', '5678901', '6789123456', 4700000),
(5, '6789012346', 'Gabriela Rodríguez', 'Carrera 13 #24-31', '6789012', '7891234567', 2800000),
(5, '7890123457', 'Luis Martínez', 'Avenida 6 #16-26', '7890123', '8912345678', 2900000),
(5, '8901234568', 'Carlos Pérez', 'Diagonal 9 #13-18', '8901234', '9123456789', 3000000),
(5, '9012345679', 'María Sánchez', 'Calle 19 #15-20', '9012345', '1234567890', 3100000), -- 63

(6, '0123456780', 'Pedro Ramírez', 'Avenida 17 #22-27', '0123456', '2345678901', 3200000), -- 64
(6, '1234567891', 'Gloria López', 'Carrera 10 #20-30', '1234567', '3219876543', 3300000),
(6, '2345678902', 'Juan Gómez', 'Calle 15 #25-40', '2345678', '3456789123', 3400000),
(6, '5678901235', 'Valeria Gómez', 'Carrera 5 #9-14', '5678901', '6789123456', 3700000),
(6, '6789012346', 'Santiago Rodríguez', 'Avenida 12 #18-23', '6789012', '7891234567', 3800000),
(6, '7890123457', 'Carolina Pérez', 'Transversal 15 #22-27', '7890123', '8912345678', 3900000),
(6, '8901234568', 'Andrés Martínez', 'Diagonal 10 #12-17', '8901234', '9123456789', 4000000),
(6, '9012345679', 'Valentina Gómez', 'Calle 20 #14-19', '9012345', '1234567890', 4100000), -- 71

(7, '0123456780', 'Jorge Ramírez', 'Avenida 18 #23-28', '0123456', '2345678901', 4200000), -- 72
(7, '1234567891', 'María Rodríguez', 'Carrera 12 #20-30', '1234567', '3219876543', 4300000),
(7, '2345678902', 'Diego López', 'Calle 17 #25-40', '2345678', '3456789123', 4400000),
(7, '3456789013', 'Ana Martínez', 'Avenida 7 #15-25', '3456789', '4567891234', 4500000),
(7, '4567890124', 'Javier Gómez', 'Carrera 9 #21-35', '4567890', '5678912345', 4600000),
(7, '5678901235', 'Sofía Ramírez', 'Carrera 6 #9-14', '5678901', '6789123456', 4700000),
(7, '6789012346', 'Andrés Rodríguez', 'Avenida 11 #18-23', '6789012', '7891234567', 4800000),
(7, '7890123457', 'Laura Sánchez', 'Transversal 16 #22-27', '7890123', '8912345678', 4900000),
(7, '8901234568', 'Diego Pérez', 'Diagonal 11 #12-17', '8901234', '9123456789', 5000000), -- 80

(8, '9012345679', 'Carolina Martínez', 'Calle 21 #14-19', '9012345', '1234567890', 5100000), -- 81
(8, '0123456780', 'Javier Gómez', 'Avenida 19 #23-28', '0123456', '2345678901', 5200000),
(8, '1234567891', 'Valentina Ramírez', 'Carrera 11 #20-30', '1234567', '3219876543', 5300000),
(8, '2345678902', 'Miguel López', 'Calle 16 #25-40', '2345678', '3456789123', 5400000),
(8, '3456789013', 'Laura Martínez', 'Avenida 8 #15-25', '3456789', '4567891234', 5500000),
(8, '4567890124', 'Jorge Gómez', 'Carrera 7 #21-35', '4567890', '5678912345', 5600000),
(8, '5678901235', 'Valeria Ramírez', 'Carrera 4 #9-14', '5678901', '6789123456', 5700000),
(8, '6789012346', 'Daniel Rodríguez', 'Avenida 10 #18-23', '6789012', '7891234567', 5800000),
(8, '7890123457', 'Santiago Sánchez', 'Transversal 17 #22-27', '7890123', '8912345678', 5900000), -- 89

(9, '8901234568', 'María Pérez', 'Diagonal 12 #12-17', '8901234', '9123456789', 6000000), -- 90
(9, '9012345679', 'Juan Martínez', 'Calle 22 #14-19', '9012345', '1234567890', 6100000),
(9, '0123456780', 'Carolina Gómez', 'Avenida 20 #23-28', '0123456', '2345678901', 6200000),
(9, '1234567891', 'Andrés Ramírez', 'Carrera 12 #20-30', '1234567', '3219876543', 6300000),
(9, '2345678902', 'Valentina López', 'Calle 17 #25-40', '2345678', '3456789123', 6400000),
(9, '3456789013', 'Diego Martínez', 'Avenida 7 #15-25', '3456789', '4567891234', 6500000),
(9, '4567890124', 'Ana Gómez', 'Carrera 9 #21-35', '4567890', '5678912345', 6600000),
(9, '5678901235', 'Javier Ramírez', 'Carrera 6 #9-14', '5678901', '6789123456', 6700000),
(9, '6789012347', 'Gabriel Rodríguez', 'Carrera 14 #25-32', '6789012', '7891234567', 2800000),
(9, '7890123458', 'Luisa Martínez', 'Avenida 7 #17-27', '7890123', '8912345678', 2900000), -- 99

(10, '8901234569', 'Carlos Pérez', 'Diagonal 8 #14-19', '8901234', '9123456789', 3000000), -- 100
(10, '9012345680', 'María Sánchez', 'Calle 18 #16-21', '9012345', '1234567890', 3100000),
(10, '0123456781', 'Pedro Ramírez', 'Avenida 16 #21-26', '0123456', '2345678901', 3200000),
(10, '1234567892', 'Gloria López', 'Carrera 11 #19-29', '1234567', '3219876543', 3300000),
(10, '2345678903', 'Juan Gómez', 'Calle 16 #26-41', '2345678', '3456789123', 3400000),
(10, '3456789014', 'Laura Martínez', 'Avenida 6 #16-26', '3456789', '4567891234', 3500000),
(10, '4567890125', 'Jorge Ramírez', 'Carrera 7 #20-36', '4567890', '5678912345', 3600000),
(10, '5678901236', 'Valeria Gómez', 'Carrera 4 #10-15', '5678901', '6789123456', 3700000),
(10, '6789012347', 'Santiago Rodríguez', 'Avenida 13 #19-24', '6789012', '7891234567', 3800000),
(10, '7890123458', 'Carolina Pérez', 'Transversal 14 #23-28', '7890123', '8912345678', 3900000), -- 109

(2, '8901234569', 'Andrés Martínez', 'Diagonal 9 #11-16', '8901234', '9123456789', 4000000), 
(1, '9012345680', 'Valentina Gómez', 'Calle 21 #13-18', '9012345', '1234567890', 4100000),
(2, '0123456781', 'Jorge Ramírez', 'Avenida 15 #20-25', '0123456', '2345678901', 4200000),
(2, '1234567892', 'María Rodríguez', 'Carrera 13 #18-23', '1234567', '3219876543', 4300000),
(1, '2345678903', 'Diego López', 'Calle 15 #27-32', '2345678', '3456789123', 4400000),
(2, '3456789014', 'Ana Martínez', 'Avenida 5 #16-21', '3456789', '4567891234', 4500000),
(2, '4567890125', 'Javier Gómez', 'Carrera 8 #22-27', '4567890', '5678912345', 4600000);

-- PERSONAL GESTION
INSERT INTO personal_gestion (id_personal,n_entrada) VALUES
(5,1),
(6,2),
(7,3), 

(14,1),
(15,2),
(16,3),
(17,4),
(18,5),
(19,6),

(28,1),
(29,2),
(30,3),
(31,4),

(39,1),
(40,2),
(41,3),
(42,4),

(51,1),
(52,2),

(64,1),

(72,1),
(73,2),
(74,3),

(81,1),
(82,2),
(83,3),

(90,1),
(91,2),

(100,1),
(101,2),
(102,3);

-- PERSONAL VIGILANCIA 
INSERT INTO personal_vigilancia (id_personal,id_area,tipo_vehiculo,marca_vehiculo) VALUES
(1, 1, 'Camioneta', 'Peugeot'),
(2, 2, 'Moto', 'Suzuki'),
(3, 3, 'Bicicleta', 'Scott'),
(4, 4, 'Cuatrimoto', 'Yamaha'),

(20, 5, 'Moto', 'Honda'),
(21, 6, 'Cuatrimoto', 'Polaris'),
(22, 7, 'Bicicleta', 'Galano Toxic'),

(32, 8, 'Cuatrimoto', 'Suzuki'),
(33, 9, 'Camioneta', 'Jeep'),
(34, 10, 'Moto', 'BMW'),

(43, 11, 'Moto', 'Yamaha'),
(44, 12, 'Camioneta', 'Nissan'),
(45, 13, 'Cuatrimoto', 'Can-Am'),

(53, 14, 'Moto', 'Ducati'),
(54, 15, 'Camioneta', 'Volkswagen'),
(55, 16, 'Cuatrimoto', 'KTM'),
(56, 17, 'Camioneta', 'Mercedes-Benz'),
(57, 18, 'Moto', 'Kawasaki'),

(65, 19, 'Cuatrimoto', 'Arctic Cat'),
(66, 20, 'Camioneta', 'Dodge'),
(67, 21, 'Moto', 'Harley-Davidson'),

(75, 22, 'Camioneta', 'Toyota'),
(76, 23, 'Camioneta', 'Ford'),
(77, 24, 'Camioneta', 'Chevrolet'),

(84, 25, 'Camioneta', 'Ram'),
(85, 26, 'Camioneta', 'Subaru'),
(86, 27, 'Moto', 'Triumph'),

(92, 28, 'Camioneta', 'Mitsubishi'),
(93, 29, 'Camioneta', 'Hyundai'),
(94, 30, 'Bicicleta', 'Schiano Bull'),

(103, 31, 'Camioneta', 'Volvo'),
(104, 32, 'Camioneta', 'Renault'),
(105, 33, 'Cuatrimoto', 'Kawasaki');

-- PERSONAL CONSERVACION
INSERT INTO personal_conservacion (id_personal,id_area,especialidad) VALUES
(8,1,'caminos'),
(9,2,'alojamiento'),
(10,3,'limpieza'),
(11,4,'caminos'),

(23,5,'alojamiento'),
(24,6,'limpieza'),
(25,7,'caminos'),

(35,8,'limpieza'),
(36,9,'caminos'),
(37,10,'limpieza'),

(46,11,'limpieza'),
(47,12,'alojamiento'),
(48,13,'caminos'),

(58,14,'caminos'),
(59,15,'caminos'),
(60,16,'alojamiento'),
(61,17,'limpieza'),
(62,18,'limpieza'),

(68,19,'caminos'),
(69,20,'alojamiento'),
(70,21,'limpieza'),

(78,22,'limpieza'),
(79,23,'caminos'),
(80,24,'alojamiento'),

(87,25,'caminos'),
(88,26,'caminos'),
(89,27,'limpieza'),

(95,28,'limpieza'),
(96,29,'caminos'),
(97,30,'caminos'),

(106,31,'alojamiento'),
(107,32,'caminos'),
(108,33,'limpieza');

-- PERSONAL INVESTIGADOR
INSERT INTO personal_investigador (id_personal,titulacion) VALUES
(12,'Biólogo de la Conservación'),
(13,'Biólogo en Fauna Acuática'),

(26,'Ecólogo Especialista en Vegetación'),
(27,'Biólogo Especialista en Mamíferos'),

(38,'Ecólogo Especialista en Flora'),

(49,'Biólogo Especialista en Conservación de Especies'),
(50,'Geólogo Especialista en Recursos Minerales'),

(63,'Biólogo Especialista en Conservación de Especies Acuáticas'),

(71,'Geólogo Especialista en Recursos Minerales'),


(98,'Biólogo/a especializado/a en aves'),
(99,'Biólogo Especializado en Mamíferos'),

(109,'Ecólogo Especializado en Flora');

-- PROYECTO
INSERT INTO proyecto (nombre,presupuesto,fecha_inicio,fecha_fin) VALUES
('Estudio de hábitat del Jaguar en Parque Natural', 50000, '2024-08-01', '2025-07-31'),
('Conservación del Palma de cera en Zona Protegida', 35000, '2024-09-15', '2025-09-14'),
('Análisis de población del Caimán de anteojos', 25000, '2024-07-01', '2025-06-30'),
('Investigación sobre el Cuerno de loro en Ecosistema Montañoso', 40000, '2024-10-01', '2025-09-30'),
('Estudio de impacto del Cóndor andino en su hábitat', 30000, '2024-11-01', '2025-10-31'),
('Estudio geológico de yacimientos de Cuarzo en Colombia', 55000, '2024-08-01', '2025-07-31'),
('Investigación sobre la minería sostenible de Zafiros en la región', 48000, '2024-09-15', '2025-09-14'),
('Estudio de comportamiento del Tapir en su hábitat natural', 48000, '2024-08-01', '2025-07-31'),
('Conservación de la Tortuga de río en áreas protegidas', 42000, '2024-09-15', '2025-09-14'),
('Análisis de la vegetación del Roble de montaña', 38000, '2024-07-01', '2025-06-30'),
('Investigación sobre la Valeriana en regiones montañosas', 60000, '2024-10-01', '2025-09-30'),
('Estudio de hábitat del Venado conejo en ecosistemas paramunos', 35000, '2024-11-01', '2025-10-31');

-- INVESTIGACION
INSERT INTO investigacion (id_proyecto,id_investigador,id_especie) VALUES
(1,1,1),
(2,6,15),
(3,2,2),
(4,3,8),
(5,10,33),
(6,7,17),
(7,9,25),
(8,3,7),
(9,8,18),
(10,12,10),
(11,5,14),
(12,11,35);

-- VISITANTE
INSERT INTO visitante (id_personal_gestion,cedula,nombre,direccion,profesion) VALUES
(1,'1234567890','Ana García','Carrera 10 #20-30','Ingeniera de Sistemas'),
(2,'2345678901','Juan López','Calle 15 #25-40','Abogado'),
(3,'3456789012','Marta Martínez','Avenida 5 #15-25',NULL),
(4,'7890123456','Sofía Gómez','Avenida 8 #21-35','Psicóloga'),
(5,'0066334455','Gabriel Ramírez','Carrera 5 #9-14','Estudiante de Medicina'),
(6, '4567890123', 'Pedro Pérez', 'Transversal 7 #30-15', 'Abogado'),
(7, '5678901234', 'María Rodríguez', 'Diagonal 12 #18-22', NULL),
(8, '6789012345', 'Luis Ramírez', 'Carrera 3 #12-18', 'Ingeniero Civil'),
(9, '8901234567', 'Javier Sánchez', 'Calle 20 #10-5', NULL),
(10, '1122334455', 'Diana Herrera', 'Calle 30 #22-17', 'Administradora'),
(11, '2233445566', 'Felipe Medina', 'Avenida 12 #17-8', NULL),
(12, '3344556677', 'Valentina Duarte', 'Diagonal 18 #25-30', 'Estudiante'),
(13, '4455667788', 'Miguel González', 'Transversal 10 #7-3', NULL),
(14, '5566778899', 'Isabela Giraldo', 'Carrera 7 #9-11', 'Ingeniera Industrial'),
(15, '6677889900', 'Alejandro Jiménez', 'Calle 18 #13-20', NULL),
(16, '7788990011', 'Laura López', 'Avenida 6 #11-25', 'Estudiante'),
(17, '8899001122', 'David Ramírez', 'Diagonal 22 #19-27', NULL),
(18, '9900112233', 'Valeria Martínez', 'Transversal 25 #14-18', 'Contadora'),
(19, '0011223344', 'Ricardo Pérez', 'Carrera 17 #23-19', NULL),
(20, '0022446688', 'Juliana Castro', 'Calle 12 #16-21', 'Arquitecta'),
(21, '0033669977', 'Manuel Gómez', 'Avenida 10 #7-15', NULL),
(22, '0044889922', 'Verónica Sánchez', 'Transversal 8 #30-22', 'Economista'),
(23, '0055112266', 'Mariana López', 'Diagonal 14 #18-23', NULL),
(24, '0077556677', 'Santiago Pérez', 'Calle 22 #25-30', NULL),
(25, '0088779900', 'Adriana García', 'Avenida 9 #12-17', 'Ingeniera de Sistemas'),
(26, '0099001122', 'Fernando Vargas', 'Transversal 20 #15-19', NULL),
(27, '1100223344', 'Isabel Duarte', 'Diagonal 16 #21-25', 'Profesora'),
(28, '2211334455', 'Nicolás González', 'Carrera 8 #10-12', NULL),
(29, '3322445566', 'Gabriela Martínez', 'Avenida 14 #19-21', 'Veterinaria'),
(30, '4433556677', 'Andrés Ramírez', 'Transversal 6 #8-11', NULL),
(31, '5544667788', 'Camila Gómez', 'Diagonal 20 #17-22', 'Diseñadora Gráfica'),
(1, '6655778899', 'Juanita López', 'Carrera 12 #14-16', NULL),
(2, '7766889900', 'Roberto Sánchez', 'Calle 25 #30-35', 'Médico'),
(3, '8877990011', 'Lucía Pérez', 'Avenida 7 #11-15', NULL),
(4, '9988001122', 'Diego Martínez', 'Transversal 18 #25-30', 'Ingeniero Agrónomo'),
(5, '1100112233', 'Valentina Ramírez', 'Diagonal 24 #22-18', NULL),
(6, '2211223344', 'Mateo Gómez', 'Carrera 10 #5-10', 'Chef'),
(7, '3322334455', 'Laura Duarte', 'Calle 18 #20-25', NULL),
(8, '4433445566', 'Andrea Rodríguez', 'Avenida 11 #13-17', 'Antropóloga'),
(9, '5544556677', 'Daniel Sánchez', 'Transversal 15 #12-16', NULL),
(10, '6655667788', 'Carolina López', 'Diagonal 10 #8-12', 'Periodista'),
(11, '7766778899', 'Jorge Pérez', 'Carrera 6 #11-14', NULL),
(12, '8877889900', 'María Fernández', 'Calle 23 #18-22', 'Contadora Pública'),
(13, '9988990011', 'Sergio Martínez', 'Avenida 13 #25-30', NULL),
(14, '1100001122', 'Julia Ramírez', 'Transversal 22 #19-23', 'Fotógrafa'),
(15, '2200112233', 'Fernando Gómez', 'Diagonal 15 #17-21', NULL),
(16, '3300223344', 'Sofía Duarte', 'Carrera 9 #12-15', 'Economista'),
(17, '4400334455', 'Pablo Sánchez', 'Calle 21 #10-14', NULL),
(18, '5500445566', 'Valeria Rodríguez', 'Avenida 16 #22-26', 'Bióloga'),
(19, '6600556677', 'Ricardo López', 'Transversal 14 #18-22', NULL),
(20, '7700667788', 'Ana Pérez', 'Diagonal 11 #9-13', 'Ingeniera Ambiental'),
(21, '8800778899', 'Juan Martínez', 'Carrera 13 #15-19', NULL),
(22, '9900889900', 'Carolina Ramírez', 'Calle 19 #20-24', 'Músico'),
(23, '0011990011', 'Javier Gómez', 'Avenida 17 #30-35', NULL),
(24, '1122001122', 'María José Duarte', 'Transversal 21 #25-29', 'Abogada'),
(25, '2233112233', 'Andrés Sánchez', 'Diagonal 13 #17-21', NULL),
(26, '3344223344', 'Gabriela Rodríguez', 'Carrera 11 #10-14', 'Ingeniera Industrial'),
(27, '4455334455', 'Diego López', 'Calle 24 #12-16', NULL),
(28, '5566445566', 'Valentina Pérez', 'Avenida 15 #8-12', 'Estudiante'),
(29, '6677556677', 'Miguel Martínez', 'Transversal 16 #22-26', NULL),
(30, '7788667788', 'Camila Ramírez', 'Diagonal 17 #19-23', 'Administradora'),
(31, '8899778899', 'David Gómez', 'Carrera 14 #25-29', NULL),
(1, '9900889900', 'Laura Duarte', 'Calle 22 #30-34', 'Diseñadora de Modas'),
(2, '0011990011', 'Santiago Sánchez', 'Avenida 18 #14-18', NULL),
(3, '1122001122', 'Isabela Rodríguez', 'Transversal 23 #10-14', 'Ingeniera Civil'),
(4, '2233112233', 'Nicolás López', 'Diagonal 15 #19-23', NULL),
(5, '3344223344', 'Valeria Pérez', 'Carrera 12 #12-16', 'Estudiante de Arquitectura'),
(6, '4455334455', 'Jorge Martínez', 'Calle 25 #9-13', NULL),
(7, '5566445566', 'Mariana Ramírez', 'Avenida 16 #22-26', 'Bióloga'),
(8, '6677556677', 'Daniel Gómez', 'Transversal 17 #18-22', NULL),
(9, '7788667788', 'Sofía Duarte', 'Diagonal 18 #20-24', 'Economista'),
(10, '8899778899', 'Andrés Sánchez', 'Carrera 15 #25-29', NULL),
(11, '9900889900', 'Laura López', 'Calle 23 #12-16', 'Psicóloga'),
(12, '0011990011', 'Gabriela Pérez', 'Avenida 19 #8-12', NULL),
(13, '1122001122', 'Diego Martínez', 'Transversal 24 #10-14', 'Contador'),
(14, '2233112233', 'Carolina Ramírez', 'Diagonal 16 #19-23', NULL),
(15, '3344223344', 'Javier Rodríguez', 'Carrera 13 #12-16', 'Chef'),
(16, '4455334455', 'Valentina Gómez', 'Calle 26 #9-13', NULL),
(17, '5566445566', 'Santiago Ramírez', 'Avenida 17 #22-26', 'Abogado'),
(18, '6677556677', 'María Gómez', 'Transversal 18 #18-22', NULL),
(19, '7788667788', 'Juan Duarte', 'Diagonal 19 #20-24', 'Ingeniero de Sistemas'),
(20, '8899778899', 'Camila Sánchez', 'Carrera 16 #25-29', NULL),
(21, '9900889900', 'Andrés López', 'Calle 24 #12-16', 'Médico'),
(22, '0011990011', 'Laura Pérez', 'Avenida 20 #8-12', NULL),
(23, '1122001122', 'Daniel Martínez', 'Transversal 25 #10-14', 'Arquitecto'),
(24, '2233112233', 'Valeria Ramírez', 'Diagonal 17 #19-23', NULL),
(25, '3344223344', 'Jorge Gómez', 'Carrera 14 #12-16', 'Economista'),
(26, '4455334455', 'Carolina Duarte', 'Calle 27 #9-13', NULL),
(27, '5566445566', 'Diego Sánchez', 'Avenida 18 #22-26', 'Contadora Pública'),
(28, '6677556677', 'Sofía Rodríguez', 'Transversal 19 #18-22', NULL),
(29, '7788667788', 'Juan Ramírez', 'Diagonal 20 #20-24', 'Fotógrafo'),
(30, '8899778899', 'María Gómez', 'Carrera 17 #25-29', NULL),
(31, '9900889900', 'Andrés Duarte', 'Calle 25 #12-16', 'Ingeniero Agrónomo'),
(1, '0011990011', 'Laura Sánchez', 'Avenida 21 #8-12', NULL),
(2, '1122001122', 'Daniel Martínez', 'Transversal 26 #10-14', 'Psicóloga'),
(3, '2233112233', 'Valentina Ramírez', 'Diagonal 18 #19-23', NULL),
(4, '3344223344', 'Jorge Gómez', 'Carrera 15 #12-16', 'Periodista'),
(5, '4455334455', 'Carolina Duarte', 'Calle 28 #9-13', NULL),
(6, '5566445566', 'Diego Sánchez', 'Avenida 19 #22-26', 'Músico'),
(7, '6677556677', 'Sofía Rodríguez', 'Transversal 20 #18-22', NULL),
(8, '7788990011', 'Lucas Ramírez', 'Carrera 18 #25-30', 'Ingeniero Químico'),
(9, '8899001122', 'Ana Martínez', 'Calle 26 #15-20', 'Arqueóloga'),
(10, '9900112233', 'Diego Gómez', 'Avenida 20 #10-15', 'Geólogo'),
(11, '0011223344', 'Valentina Ramírez', 'Transversal 27 #12-17', 'Piloto'),
(12, '1122334455', 'Santiago Pérez', 'Diagonal 19 #22-27', 'Nutricionista'),
(13, '2233445566', 'Isabela Gómez', 'Carrera 16 #18-23', 'Fisioterapeuta'),
(14, '3344556677', 'Andrés Sánchez', 'Calle 28 #11-16', 'Ingeniero Electrónico'),
(15, '4455667788', 'María Duarte', 'Avenida 22 #9-14', 'Periodista'),
(16, '5566778899', 'Juan López', 'Transversal 21 #13-18', 'Biólogo Marino'),
(17, '6677889900', 'Valeria Pérez', 'Diagonal 21 #24-29', 'Administrador de Empresas'),
(18, '7788990011', 'Gabriel Ramírez', 'Carrera 19 #30-35', 'Psiquiatra'),
(19, '8899001122', 'Laura Martínez', 'Calle 27 #16-21', 'Dentista'),
(20, '9900112233', 'Javier Gómez', 'Avenida 23 #11-16', 'Artista Plástico'),
(21, '0011223344', 'Sofía Ramírez', 'Transversal 28 #12-17', 'Ingeniera Química'),
(22, '1122334455', 'Andrés Pérez', 'Diagonal 20 #22-27', 'Antropólogo'),
(23, '2233445566', 'María Gómez', 'Carrera 17 #18-23', 'Psicopedagoga'),
(24, '3344556677', 'Diego Sánchez', 'Calle 29 #11-16', 'Historiador'),
(25, '4455667788', 'Valentina Duarte', 'Avenida 24 #9-14', 'Economista'),
(26, '5566778899', 'Jorge López', 'Transversal 22 #13-18', 'Ingeniero Mecánico'),
(27, '6677889900', 'Carolina Pérez', 'Diagonal 22 #24-29', 'Sociólogo'),
(28, '7788990011', 'Lucía Ramírez', 'Carrera 20 #30-35', 'Veterinario'),
(29, '8899001122', 'Miguel Martínez', 'Calle 28 #16-21', 'Chef'),
(30, '9900112233', 'Camila Gómez', 'Avenida 25 #11-16', 'Abogada'),
(31, '0011223344', 'Santiago Ramírez', 'Transversal 29 #12-17', 'Biólogo'),
(1, '1122334455', 'Valeria Pérez', 'Diagonal 21 #22-27', 'Ingeniero Industrial'),
(2, '2233445566', 'Juan Sánchez', 'Carrera 18 #18-23', 'Geógrafo'),
(3, '3344556677', 'Laura Duarte', 'Calle 30 #11-16', 'Fotógrafo'),
(4, '4455667788', 'Andrés López', 'Avenida 26 #9-14', 'Nutriólogo'),
(5, '5566778899', 'María Rodríguez', 'Transversal 23 #13-18', 'Diseñador Gráfico'),
(6, '6677889900', 'Diego Pérez', 'Diagonal 23 #24-29', 'Ingeniero de Telecomunicaciones'),
(7, '7788990011', 'Valentina Ramírez', 'Carrera 21 #30-35', 'Arquitecto'),
(8, '8899001122', 'Javier Martínez', 'Calle 29 #16-21', 'Economista'),
(9, '9900112233', 'Carolina Gómez', 'Avenida 27 #11-16', 'Ingeniero Ambiental'),
(10, '0011223344', 'Andrés Ramírez', 'Transversal 30 #12-17', 'Científico de Datos'),
(11, '1122334455', 'Mariana Pérez', 'Diagonal 22 #22-27', 'Médico'),
(12, '2233445566', 'Santiago Duarte', 'Carrera 19 #18-23', 'Profesor'),
(13, '3344556677', 'Gabriela López', 'Calle 31 #11-16', 'Actriz'),
(14, '4455667788', 'Daniel Sánchez', 'Avenida 28 #9-14', 'Ingeniero Civil'),
(15, '5566778899', 'Valeria Martínez', 'Transversal 24 #13-18', 'Biocientífico'),
(16, '6677889900', 'Jorge Pérez', 'Diagonal 24 #24-29', 'Comunicador Social'),
(17, '7788990011', 'Laura Ramírez', 'Carrera 22 #30-35', 'Químico'),
(18, '8899001122', 'Diego Martínez', 'Calle 30 #16-21', 'Analista Financiero'),
(19, '9900112233', 'María Gómez', 'Avenida 29 #11-16', 'Artista Visual'),
(20, '0011223344', 'Andrés Duarte', 'Transversal 31 #12-17', 'Ingeniero Industrial'),
(21, '1122334455', 'Carolina López', 'Diagonal 23 #22-27', 'Estadístico'),
(22, '2233445566', 'Santiago Pérez', 'Carrera 20 #18-23', 'Geólogo'),
(23, '3344556677', 'Valentina Ramírez', 'Calle 32 #11-16', 'Historiador del Arte'),
(24, '4455667788', 'Juan Sánchez', 'Avenida 30 #9-14', 'Ingeniero Agrónomo'),
(25, '5566778899', 'Laura Rodríguez', 'Transversal 25 #13-18', 'Etnobotánico'),
(26, '6677889900', 'Diego Pérez', 'Diagonal 25 #24-29', 'Analista de Sistemas');

-- ALOJAMIENTO
INSERT INTO alojamiento (id_visitante,nombre,capacidad,categoria,fecha_inicio,fecha_final) VALUES
(4, 'Cabaña La Tranquilidad', 4, 'Cabaña', '2024-07-10', '2024-07-15'),
(5, 'Camping El Bosque', 20, 'Camping', '2024-07-12', '2024-07-14'),
(6, 'Hotel Vista Verde', 50, 'Hotel', '2024-07-11', '2024-07-13'),
(7, 'Hostal La Montaña', 10, 'Hostales', '2024-07-10', '2024-07-12'),
(8, 'Cabaña El Refugio', 6, 'Cabaña', '2024-07-13', '2024-07-16'),
(9, 'Camping Estrella', 30, 'Camping', '2024-07-15', '2024-07-17'),
(1, 'Hotel Paraíso Natural', 100, 'Hotel', '2024-07-11', '2024-07-14'),
(2, 'Hostal La Casona', 15, 'Hostales', '2024-07-12', '2024-07-15'),
(3, 'Cabaña El Descanso', 8, 'Cabaña', '2024-07-14', '2024-07-16'),
(14, 'Camping Aventura', 25, 'Camping', '2024-07-16', '2024-07-18'),
(15, 'Hotel Montaña Azul', 80, 'Hotel', '2024-07-13', '2024-07-17'),
(16, 'Hostal El Refugio', 12, 'Hostales', '2024-07-14', '2024-07-16'),
(17, 'Cabaña La Paz', 5, 'Cabaña', '2024-07-17', '2024-07-19'),
(18, 'Camping Verde Vivo', 15, 'Camping', '2024-07-18', '2024-07-20'),
(19, 'Hotel Bosque Encantado', 60, 'Hotel', '2024-07-15', '2024-07-18'),
(20, 'Hostal El Descanso', 10, 'Hostales', '2024-07-16', '2024-07-19'),
(21, 'Cabaña La Alegría', 6, 'Cabaña', '2024-07-19', '2024-07-21'),
(22, 'Camping Aventura Extrema', 40, 'Camping', '2024-07-20', '2024-07-23'),
(23, 'Hotel Paraíso Eco', 120, 'Hotel', '2024-07-17', '2024-07-20'),
(24, 'Hostal El Paraíso', 20, 'Hostales', '2024-07-18', '2024-07-21'),
(25, 'Cabaña El Paraíso', 4, 'Cabaña', '2024-07-22', '2024-07-24'),
(26, 'Camping Luna Llena', 18, 'Camping', '2024-07-23', '2024-07-25'),
(29, 'Hotel Montaña Alta', 40, 'Hotel', '2024-07-21', '2024-07-24'),
(30, 'Hostal La Aventura', 8, 'Hostales', '2024-07-20', '2024-07-22'),
(31, 'Cabaña El Refugio Verde', 6, 'Cabaña', '2024-07-25', '2024-07-27'),
(26, 'Camping Naturalis', 25, 'Camping', '2024-07-26', '2024-07-28'),
(35, 'Hotel Bosque Fresco', 70, 'Hotel', '2024-07-23', '2024-07-26'),
(36, 'Hostal La Comodidad', 12, 'Hostales', '2024-07-24', '2024-07-27'),
(37, 'Cabaña Vista Hermosa', 5, 'Cabaña', '2024-07-27', '2024-07-29'),
(38, 'Camping Aventura en la Montaña', 30, 'Camping', '2024-07-29', '2024-07-31');
