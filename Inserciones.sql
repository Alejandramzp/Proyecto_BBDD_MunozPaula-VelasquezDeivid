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
(1,'Sector Palangana',1249), -- bosques ##########
(2,'Sector Tayrona',266756), -- playas
(2,'Sector Páramo de San Lorenzo',153842), -- paramo montaña
(2,'Sector Páramo de Macotama',152714), -- paramo ##################
(3,'Sector del Nevado del Ruiz',19672.8), -- paramo y lagunas
(3,'Sector del Nevado de Santa Isabel',12792.9), -- glaciares lagunas
(3,'Sector del Nevado del Tolima',28924.7), -- paramo y lagunas ##########
(4,'Bosque de Palma de Cera',22743), -- la palma de cera 
(4,'Finca La Montaña',14895), -- la naturaleza y observar aves
(4,'Bosque de niebla',21442), -- bosques de montaña. #########
(5,'Sector Caño Cristales',126473), -- río de los cinco colores
(5,'Sector Raudal Angosturas',121499), -- raudales y formaciones rocosas
(5,'Sector La Cachivera',98762), --  biodiversidad y paisajes  
(5,'Sector Piedra de Loros',124629), -- la diversidad de aves
(5,'Sector El Mirador',157917), -- aves y fauna silvestre #######
(6,'Sector Yavari',92864), -- 
(6,'Sector Zafire',89723), --
(6,'Sector Araracuara',84654), -- ########## 
(7,'Zona Núcleo',15642), -- conservación estricta de la biodiversidad y los ecosistemas
(7,'Zona de Amortiguamiento',12893), --  ecosistemas protegidos
(7,'Zona de Uso Sostenible',18559), -- pesca artesanal ##### 
(8,'Sector Chisacá',73562), -- páramos y lagunas glaciares
(8,'Sector Sumapaz Central',86429), -- páramos, lagunas y montañas.
(8,'Sector Sumapaz Sur',50748), -- ecosistemas de páramo ####### 
(9,'Mirador Panorámico',84),
(9,'Zona Teleférico',88),
(9,'Zona Extrema',92), -- parapente, rappel y escalada ############# 30
(10,'Zona del Pan de Azúcar',43580), --  senderos para los visitantes
(10,'Zona del Ritacuba Blanco',98473), --  pico Ritacuba Blanco el más alto
(10,'Zona de Güicán y Chita',163826); -- montañas y pico

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
(1,'Vegetales','Espeletia grandiflora','Frailejón gigante',1642),
(1,'Animales','Atelopus spp','Ranas de cristal',47),
(1,'Animales','Cinclodes excelsior','Churrete real',36),
(1,'Animales','Draba spp','Draba',2450);

-- PERSONAL
INSERT INTO personal (id_parque,cedula,nombre,direccion,telefono,celular,sueldo) VALUES
(1, '1234567890', 'Carlos García', 'Carrera 10 #20-30', '1234567', '3219876543', 2500000),
(1, '2345678901', 'María López', 'Calle 15 #25-40', '2345678', '3456789123', 2800000),
(1, '3456789012', 'Pedro Martínez', 'Avenida 5 #15-25', '3456789', '4567891234', 2700000),
(2, '4567890123', 'Laura Gómez', 'Carrera 8 #21-35', '4567890', '5678912345', 2600000),
(2, '5678901234', 'Javier Ramírez', 'Carrera 5 #9-14', '5678901', '6789123456', 3000000),
(2, '6789012345', 'Ana Rodríguez', 'Avenida 12 #18-23', '6789012', '7891234567', 2900000),
(3, '7890123456', 'Andrés Sánchez', 'Transversal 15 #22-27', '7890123', '8912345678', 2800000),
(3, '8901234567', 'Valentina Pérez', 'Diagonal 10 #12-17', '8901234', '9123456789', 3100000),
(3, '9012345678', 'Diego Martínez', 'Calle 20 #14-19', '9012345', '1234567890', 3000000),
(4, '0123456789', 'Sofía Gómez', 'Avenida 18 #23-28', '0123456', '2345678901', 2900000),
(5, '1234567890', 'María García', 'Carrera 12 #20-30', '1234567', '3219876543', 2600000),
(5, '2345678901', 'Juan López', 'Calle 17 #25-40', '2345678', '3456789123', 2700000),
(5, '3456789012', 'Laura Martínez', 'Avenida 7 #15-25', '3456789', '4567891234', 2800000),
(6, '4567890123', 'Carlos Gómez', 'Carrera 9 #21-35', '4567890', '5678912345', 2900000),
(6, '5678901234', 'Sofía Ramírez', 'Carrera 6 #9-14', '5678901', '6789123456', 3000000),
(6, '6789012345', 'Andrés Rodríguez', 'Avenida 11 #18-23', '6789012', '7891234567', 3100000),
(7, '7890123456', 'Ana Sánchez', 'Transversal 16 #22-27', '7890123', '8912345678', 2800000),
(7, '8901234567', 'Javier Pérez', 'Diagonal 11 #12-17', '8901234', '9123456789', 2900000),
(7, '9012345678', 'Valentina Martínez', 'Calle 21 #14-19', '9012345', '1234567890', 3000000),
(8, '0123456789', 'Diego Gómez', 'Avenida 19 #23-28', '0123456', '2345678901', 3100000),
(8, '1234567890', 'Carolina Ramírez', 'Carrera 11 #20-30', '1234567', '3219876543', 3200000),
(8, '2345678901', 'Miguel López', 'Calle 16 #25-40', '2345678', '3456789123', 3300000),
(9, '3456789012', 'Laura Martínez', 'Avenida 8 #15-25', '3456789', '4567891234', 3400000),
(9, '4567890123', 'Jorge Gómez', 'Carrera 7 #21-35', '4567890', '5678912345', 3500000),
(9, '5678901234', 'Valeria Ramírez', 'Carrera 4 #9-14', '5678901', '6789123456', 3600000),
(10, '6789012345', 'Daniel Rodríguez', 'Avenida 10 #18-23', '6789012', '7891234567', 3700000),
(10, '7890123456', 'Santiago Sánchez', 'Transversal 17 #22-27', '7890123', '8912345678', 3800000),
(10, '8901234567', 'María Pérez', 'Diagonal 12 #12-17', '8901234', '9123456789', 3900000),
(11, '9012345678', 'Juan Martínez', 'Calle 22 #14-19', '9012345', '1234567890', 4000000),
(11, '0123456789', 'Carolina Gómez', 'Avenida 20 #23-28', '0123456', '2345678901', 4100000),
(11, '1234567890', 'Andrés Ramírez', 'Carrera 12 #20-30', '1234567', '3219876543', 4200000),
(12, '2345678901', 'Valentina López', 'Calle 17 #25-40', '2345678', '3456789123', 4300000),
(12, '3456789012', 'Diego Martínez', 'Avenida 7 #15-25', '3456789', '4567891234', 4400000),
(12, '4567890123', 'Ana Gómez', 'Carrera 9 #21-35', '4567890', '5678912345', 4500000),
(13, '5678901234', 'Javier Ramírez', 'Carrera 6 #9-14', '5678901', '6789123456', 4600000),
(13, '6789012345', 'Sofía Rodríguez', 'Avenida 11 #18-23', '6789012', '7891234567', 4700000),
(13, '7890123456', 'Andrea Sánchez', 'Transversal 16 #22-27', '7890123', '8912345678', 4800000);

-- PERSONAL GESTION
INSERT INTO personal_gestion (id_personal,n_entrada) VALUES
();

-- PERSONAL VIGILANCIA 
INSERT INTO personal_vigilancia (id_personal,id_area,tipo_vehiculo,marca_vehiculo) VALUES
(1, 1, 'Camioneta', 'Toyota'),
(2, 1, 'Moto', 'Honda'),
(3, 2, 'Camioneta', 'Ford'),
(4, 2, 'Cuatrimoto', 'Polaris'),
(5, 3, 'Camioneta', 'Chevrolet'),
(6, 3, 'Moto', 'Yamaha'),
(7, 4, 'Camioneta', 'Nissan'),
(8, 4, 'Cuatrimoto', 'Can-Am'),
(9, 5, 'Camioneta', 'Mitsubishi'),
(10, 5, 'Moto', 'Kawasaki'),
(11, 6, 'Camioneta', 'Hyundai'),
(12, 6, 'Cuatrimoto', 'Suzuki'),
(13, 7, 'Camioneta', 'Jeep'),
(14, 7, 'Moto', 'BMW'),
(15, 8, 'Camioneta', 'Volvo'),
(16, 8, 'Cuatrimoto', 'Arctic Cat'),
(17, 9, 'Camioneta', 'Dodge'),
(18, 9, 'Moto', 'Ducati'),
(19, 10, 'Camioneta', 'Volkswagen'),
(20, 10, 'Cuatrimoto', 'KTM'),
(21, 11, 'Camioneta', 'Mercedes-Benz'),
(22, 11, 'Moto', 'Harley-Davidson'),
(23, 12, 'Camioneta', 'Ram'),
(24, 12, 'Cuatrimoto', 'Yamaha'),
(25, 13, 'Camioneta', 'Subaru'),
(26, 13, 'Moto', 'Triumph'),
(27, 14, 'Camioneta', 'Renault'),
(28, 14, 'Cuatrimoto', 'Kawasaki'),
(29, 15, 'Camioneta', 'Peugeot'),
(30, 15, 'Moto', 'Suzuki'),
(31, 1, 'Bicicleta', NULL),
(32, 2, 'Bicicleta', NULL),
(33, 3, 'Bicicleta', NULL);

-- PERSONAL CONSERVACION
INSERT INTO personal_conservacion (id_personal,id_area,especialidad) VALUES
();

-- PERSONAL INVESTIGADOR
INSERT INTO personal_investigador (id_personal,titulacion) VALUES
();

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
();

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
(32, '6655778899', 'Juanita López', 'Carrera 12 #14-16', NULL),
(33, '7766889900', 'Roberto Sánchez', 'Calle 25 #30-35', 'Médico'),
(34, '8877990011', 'Lucía Pérez', 'Avenida 7 #11-15', NULL),
(35, '9988001122', 'Diego Martínez', 'Transversal 18 #25-30', 'Ingeniero Agrónomo'),
(36, '1100112233', 'Valentina Ramírez', 'Diagonal 24 #22-18', NULL),
(37, '2211223344', 'Mateo Gómez', 'Carrera 10 #5-10', 'Chef'),
(38, '3322334455', 'Laura Duarte', 'Calle 18 #20-25', NULL),
(39, '4433445566', 'Andrea Rodríguez', 'Avenida 11 #13-17', 'Antropóloga'),
(40, '5544556677', 'Daniel Sánchez', 'Transversal 15 #12-16', NULL),
(41, '6655667788', 'Carolina López', 'Diagonal 10 #8-12', 'Periodista'),
(42, '7766778899', 'Jorge Pérez', 'Carrera 6 #11-14', NULL),
(43, '8877889900', 'María Fernández', 'Calle 23 #18-22', 'Contadora Pública'),
(44, '9988990011', 'Sergio Martínez', 'Avenida 13 #25-30', NULL),
(45, '1100001122', 'Julia Ramírez', 'Transversal 22 #19-23', 'Fotógrafa'),
(46, '2200112233', 'Fernando Gómez', 'Diagonal 15 #17-21', NULL),
(47, '3300223344', 'Sofía Duarte', 'Carrera 9 #12-15', 'Economista'),
(48, '4400334455', 'Pablo Sánchez', 'Calle 21 #10-14', NULL),
(49, '5500445566', 'Valeria Rodríguez', 'Avenida 16 #22-26', 'Bióloga'),
(50, '6600556677', 'Ricardo López', 'Transversal 14 #18-22', NULL),
(51, '7700667788', 'Ana Pérez', 'Diagonal 11 #9-13', 'Ingeniera Ambiental'),
(52, '8800778899', 'Juan Martínez', 'Carrera 13 #15-19', NULL),
(53, '9900889900', 'Carolina Ramírez', 'Calle 19 #20-24', 'Músico'),
(54, '0011990011', 'Javier Gómez', 'Avenida 17 #30-35', NULL),
(55, '1122001122', 'María José Duarte', 'Transversal 21 #25-29', 'Abogada'),
(56, '2233112233', 'Andrés Sánchez', 'Diagonal 13 #17-21', NULL),
(57, '3344223344', 'Gabriela Rodríguez', 'Carrera 11 #10-14', 'Ingeniera Industrial'),
(58, '4455334455', 'Diego López', 'Calle 24 #12-16', NULL),
(59, '5566445566', 'Valentina Pérez', 'Avenida 15 #8-12', 'Estudiante'),
(60, '6677556677', 'Miguel Martínez', 'Transversal 16 #22-26', NULL),
(61, '7788667788', 'Camila Ramírez', 'Diagonal 17 #19-23', 'Administradora'),
(62, '8899778899', 'David Gómez', 'Carrera 14 #25-29', NULL),
(63, '9900889900', 'Laura Duarte', 'Calle 22 #30-34', 'Diseñadora de Modas'),
(64, '0011990011', 'Santiago Sánchez', 'Avenida 18 #14-18', NULL),
(65, '1122001122', 'Isabela Rodríguez', 'Transversal 23 #10-14', 'Ingeniera Civil'),
(66, '2233112233', 'Nicolás López', 'Diagonal 15 #19-23', NULL),
(67, '3344223344', 'Valeria Pérez', 'Carrera 12 #12-16', 'Estudiante de Arquitectura'),
(68, '4455334455', 'Jorge Martínez', 'Calle 25 #9-13', NULL),
(69, '5566445566', 'Mariana Ramírez', 'Avenida 16 #22-26', 'Bióloga'),
(70, '6677556677', 'Daniel Gómez', 'Transversal 17 #18-22', NULL),
(71, '7788667788', 'Sofía Duarte', 'Diagonal 18 #20-24', 'Economista'),
(72, '8899778899', 'Andrés Sánchez', 'Carrera 15 #25-29', NULL),
(73, '9900889900', 'Laura López', 'Calle 23 #12-16', 'Psicóloga'),
(74, '0011990011', 'Gabriela Pérez', 'Avenida 19 #8-12', NULL),
(75, '1122001122', 'Diego Martínez', 'Transversal 24 #10-14', 'Contador'),
(76, '2233112233', 'Carolina Ramírez', 'Diagonal 16 #19-23', NULL),
(77, '3344223344', 'Javier Rodríguez', 'Carrera 13 #12-16', 'Chef'),
(78, '4455334455', 'Valentina Gómez', 'Calle 26 #9-13', NULL),
(79, '5566445566', 'Santiago Ramírez', 'Avenida 17 #22-26', 'Abogado'),
(80, '6677556677', 'María Gómez', 'Transversal 18 #18-22', NULL),
(81, '7788667788', 'Juan Duarte', 'Diagonal 19 #20-24', 'Ingeniero de Sistemas'),
(82, '8899778899', 'Camila Sánchez', 'Carrera 16 #25-29', NULL),
(83, '9900889900', 'Andrés López', 'Calle 24 #12-16', 'Médico'),
(84, '0011990011', 'Laura Pérez', 'Avenida 20 #8-12', NULL),
(85, '1122001122', 'Daniel Martínez', 'Transversal 25 #10-14', 'Arquitecto'),
(86, '2233112233', 'Valeria Ramírez', 'Diagonal 17 #19-23', NULL),
(87, '3344223344', 'Jorge Gómez', 'Carrera 14 #12-16', 'Economista'),
(88, '4455334455', 'Carolina Duarte', 'Calle 27 #9-13', NULL),
(89, '5566445566', 'Diego Sánchez', 'Avenida 18 #22-26', 'Contadora Pública'),
(90, '6677556677', 'Sofía Rodríguez', 'Transversal 19 #18-22', NULL),
(91, '7788667788', 'Juan Ramírez', 'Diagonal 20 #20-24', 'Fotógrafo'),
(92, '8899778899', 'María Gómez', 'Carrera 17 #25-29', NULL),
(93, '9900889900', 'Andrés Duarte', 'Calle 25 #12-16', 'Ingeniero Agrónomo'),
(94, '0011990011', 'Laura Sánchez', 'Avenida 21 #8-12', NULL),
(95, '1122001122', 'Daniel Martínez', 'Transversal 26 #10-14', 'Psicóloga'),
(96, '2233112233', 'Valentina Ramírez', 'Diagonal 18 #19-23', NULL),
(97, '3344223344', 'Jorge Gómez', 'Carrera 15 #12-16', 'Periodista'),
(98, '4455334455', 'Carolina Duarte', 'Calle 28 #9-13', NULL),
(99, '5566445566', 'Diego Sánchez', 'Avenida 19 #22-26', 'Músico'),
(100, '6677556677', 'Sofía Rodríguez', 'Transversal 20 #18-22', NULL),
(101, '7788990011', 'Lucas Ramírez', 'Carrera 18 #25-30', 'Ingeniero Químico'),
(102, '8899001122', 'Ana Martínez', 'Calle 26 #15-20', 'Arqueóloga'),
(103, '9900112233', 'Diego Gómez', 'Avenida 20 #10-15', 'Geólogo'),
(104, '0011223344', 'Valentina Ramírez', 'Transversal 27 #12-17', 'Piloto'),
(105, '1122334455', 'Santiago Pérez', 'Diagonal 19 #22-27', 'Nutricionista'),
(106, '2233445566', 'Isabela Gómez', 'Carrera 16 #18-23', 'Fisioterapeuta'),
(107, '3344556677', 'Andrés Sánchez', 'Calle 28 #11-16', 'Ingeniero Electrónico'),
(108, '4455667788', 'María Duarte', 'Avenida 22 #9-14', 'Periodista'),
(109, '5566778899', 'Juan López', 'Transversal 21 #13-18', 'Biólogo Marino'),
(110, '6677889900', 'Valeria Pérez', 'Diagonal 21 #24-29', 'Administrador de Empresas'),
(111, '7788990011', 'Gabriel Ramírez', 'Carrera 19 #30-35', 'Psiquiatra'),
(112, '8899001122', 'Laura Martínez', 'Calle 27 #16-21', 'Dentista'),
(113, '9900112233', 'Javier Gómez', 'Avenida 23 #11-16', 'Artista Plástico'),
(114, '0011223344', 'Sofía Ramírez', 'Transversal 28 #12-17', 'Ingeniera Química'),
(115, '1122334455', 'Andrés Pérez', 'Diagonal 20 #22-27', 'Antropólogo'),
(116, '2233445566', 'María Gómez', 'Carrera 17 #18-23', 'Psicopedagoga'),
(117, '3344556677', 'Diego Sánchez', 'Calle 29 #11-16', 'Historiador'),
(118, '4455667788', 'Valentina Duarte', 'Avenida 24 #9-14', 'Economista'),
(119, '5566778899', 'Jorge López', 'Transversal 22 #13-18', 'Ingeniero Mecánico'),
(120, '6677889900', 'Carolina Pérez', 'Diagonal 22 #24-29', 'Sociólogo'),
(121, '7788990011', 'Lucía Ramírez', 'Carrera 20 #30-35', 'Veterinario'),
(122, '8899001122', 'Miguel Martínez', 'Calle 28 #16-21', 'Chef'),
(123, '9900112233', 'Camila Gómez', 'Avenida 25 #11-16', 'Abogada'),
(124, '0011223344', 'Santiago Ramírez', 'Transversal 29 #12-17', 'Biólogo'),
(125, '1122334455', 'Valeria Pérez', 'Diagonal 21 #22-27', 'Ingeniero Industrial'),
(126, '2233445566', 'Juan Sánchez', 'Carrera 18 #18-23', 'Geógrafo'),
(127, '3344556677', 'Laura Duarte', 'Calle 30 #11-16', 'Fotógrafo'),
(128, '4455667788', 'Andrés López', 'Avenida 26 #9-14', 'Nutriólogo'),
(129, '5566778899', 'María Rodríguez', 'Transversal 23 #13-18', 'Diseñador Gráfico'),
(130, '6677889900', 'Diego Pérez', 'Diagonal 23 #24-29', 'Ingeniero de Telecomunicaciones'),
(131, '7788990011', 'Valentina Ramírez', 'Carrera 21 #30-35', 'Arquitecto'),
(132, '8899001122', 'Javier Martínez', 'Calle 29 #16-21', 'Economista'),
(133, '9900112233', 'Carolina Gómez', 'Avenida 27 #11-16', 'Ingeniero Ambiental'),
(134, '0011223344', 'Andrés Ramírez', 'Transversal 30 #12-17', 'Científico de Datos'),
(135, '1122334455', 'Mariana Pérez', 'Diagonal 22 #22-27', 'Médico'),
(136, '2233445566', 'Santiago Duarte', 'Carrera 19 #18-23', 'Profesor'),
(137, '3344556677', 'Gabriela López', 'Calle 31 #11-16', 'Actriz'),
(138, '4455667788', 'Daniel Sánchez', 'Avenida 28 #9-14', 'Ingeniero Civil'),
(139, '5566778899', 'Valeria Martínez', 'Transversal 24 #13-18', 'Biocientífico'),
(140, '6677889900', 'Jorge Pérez', 'Diagonal 24 #24-29', 'Comunicador Social'),
(141, '7788990011', 'Laura Ramírez', 'Carrera 22 #30-35', 'Químico'),
(142, '8899001122', 'Diego Martínez', 'Calle 30 #16-21', 'Analista Financiero'),
(143, '9900112233', 'María Gómez', 'Avenida 29 #11-16', 'Artista Visual'),
(144, '0011223344', 'Andrés Duarte', 'Transversal 31 #12-17', 'Ingeniero Industrial'),
(145, '1122334455', 'Carolina López', 'Diagonal 23 #22-27', 'Estadístico'),
(146, '2233445566', 'Santiago Pérez', 'Carrera 20 #18-23', 'Geólogo'),
(147, '3344556677', 'Valentina Ramírez', 'Calle 32 #11-16', 'Historiador del Arte'),
(148, '4455667788', 'Juan Sánchez', 'Avenida 30 #9-14', 'Ingeniero Agrónomo'),
(149, '5566778899', 'Laura Rodríguez', 'Transversal 25 #13-18', 'Etnobotánico'),
(150, '6677889900', 'Diego Pérez', 'Diagonal 25 #24-29', 'Analista de Sistemas');

-- ALOJAMIENTO
INSERT INTO alojamiento (id_visitante,nombre,capacidad,categoria,fecha_inicio,fecha_final) VALUES
(1, 'Cabaña La Tranquilidad', 4, 'Cabaña', '2024-07-10', '2024-07-15'),
(2, 'Camping El Bosque', 20, 'Camping', '2024-07-12', '2024-07-14'),
(3, 'Hotel Vista Verde', 50, 'Hotel', '2024-07-11', '2024-07-13'),
(4, 'Hostal La Montaña', 10, 'Hostal', '2024-07-10', '2024-07-12'),
(5, 'Cabaña El Refugio', 6, 'Cabaña', '2024-07-13', '2024-07-16'),
(6, 'Camping Estrella', 30, 'Camping', '2024-07-15', '2024-07-17'),
(7, 'Hotel Paraíso Natural', 100, 'Hotel', '2024-07-11', '2024-07-14'),
(8, 'Hostal La Casona', 15, 'Hostal', '2024-07-12', '2024-07-15'),
(9, 'Cabaña El Descanso', 8, 'Cabaña', '2024-07-14', '2024-07-16'),
(10, 'Camping Aventura', 25, 'Camping', '2024-07-16', '2024-07-18'),
(11, 'Hotel Montaña Azul', 80, 'Hotel', '2024-07-13', '2024-07-17'),
(12, 'Hostal El Refugio', 12, 'Hostal', '2024-07-14', '2024-07-16'),
(13, 'Cabaña La Paz', 5, 'Cabaña', '2024-07-17', '2024-07-19'),
(14, 'Camping Verde Vivo', 15, 'Camping', '2024-07-18', '2024-07-20'),
(15, 'Hotel Bosque Encantado', 60, 'Hotel', '2024-07-15', '2024-07-18'),
(16, 'Hostal El Descanso', 10, 'Hostal', '2024-07-16', '2024-07-19'),
(17, 'Cabaña La Alegría', 6, 'Cabaña', '2024-07-19', '2024-07-21'),
(18, 'Camping Aventura Extrema', 40, 'Camping', '2024-07-20', '2024-07-23'),
(19, 'Hotel Paraíso Eco', 120, 'Hotel', '2024-07-17', '2024-07-20'),
(20, 'Hostal El Paraíso', 20, 'Hostal', '2024-07-18', '2024-07-21'),
(21, 'Cabaña El Paraíso', 4, 'Cabaña', '2024-07-22', '2024-07-24'),
(22, 'Camping Luna Llena', 18, 'Camping', '2024-07-23', '2024-07-25'),
(23, 'Hotel Montaña Alta', 40, 'Hotel', '2024-07-21', '2024-07-24'),
(24, 'Hostal La Aventura', 8, 'Hostal', '2024-07-20', '2024-07-22'),
(25, 'Cabaña El Refugio Verde', 6, 'Cabaña', '2024-07-25', '2024-07-27'),
(26, 'Camping Naturalis', 25, 'Camping', '2024-07-26', '2024-07-28'),
(27, 'Hotel Bosque Fresco', 70, 'Hotel', '2024-07-23', '2024-07-26'),
(28, 'Hostal La Comodidad', 12, 'Hostal', '2024-07-24', '2024-07-27'),
(29, 'Cabaña Vista Hermosa', 5, 'Cabaña', '2024-07-27', '2024-07-29'),
(30, 'Camping Aventura en la Montaña', 30, 'Camping', '2024-07-29', '2024-07-31');