CREATE DATABASE  IF NOT EXISTS `gimnasio` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `gimnasio`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: gimnasio
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `costo`
--

DROP TABLE IF EXISTS `costo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `costo` (
  `costo` decimal(10,0) NOT NULL,
  `fecha_vigencia` date NOT NULL,
  `id_plan` int NOT NULL,
  PRIMARY KEY (`id_plan`,`fecha_vigencia`),
  CONSTRAINT `fk_costo_plan` FOREIGN KEY (`id_plan`) REFERENCES `plan` (`id_plan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `costo`
--

LOCK TABLES `costo` WRITE;
/*!40000 ALTER TABLE `costo` DISABLE KEYS */;
INSERT INTO `costo` VALUES (3100,'2021-12-01',1),(3500,'2022-06-01',1),(3800,'2022-10-01',1),(3300,'2021-12-01',2),(4000,'2022-10-01',2),(3800,'2022-10-01',3),(3000,'2022-05-01',4),(3500,'2022-10-01',4),(3300,'2022-06-01',5),(3800,'2022-10-01',5),(3000,'2021-12-01',6),(3400,'2022-06-01',6),(3800,'2022-10-01',6);
/*!40000 ALTER TABLE `costo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuota`
--

DROP TABLE IF EXISTS `cuota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuota` (
  `fecha_vencimiento` date NOT NULL,
  `fecha_pago` date NULL,
  `monto` decimal(10,0) NOT NULL,
  `forma_pago` varchar(255) NOT NULL,
  `id_usuario` int NOT NULL,
  PRIMARY KEY (`fecha_vencimiento`,`id_usuario`),
  KEY `fk_cuota_usuario_idx` (`id_usuario`),
  CONSTRAINT `fk_cuota_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuota`
--

LOCK TABLES `cuota` WRITE;
/*!40000 ALTER TABLE `cuota` DISABLE KEYS */;
INSERT INTO `cuota` VALUES ('2022-06-01','2022-03-01',3000,'Efectivo',4),('2022-07-01','2022-06-28',2500,'Tarjeta Credito',4),('2022-08-01','2022-07-25',3000,'Tarjeta Debito',4),('2022-09-01','2022-08-29',3000,'Tarjeta Debito',4),('2022-10-01','2022-09-21',3400,'Tarjeta Credito',4),('2022-11-01','2022-11-01',3000,'Efectivo',4),('2022-09-15','2022-09-15',3300,'Tarjeta Debito',5),('2022-10-15','2022-10-17',6300,'Efectivo',5),('2022-11-15','2022-11-13',3400,'Tarjeta Credito',5),('2022-10-23','2022-10-20',3000,'Tarjeta Credito',6),('2022-11-23','2022-11-19',6300,'Efectivo',6),('2022-09-08','2022-09-13',3000,'Tarjeta Credito',7),('2022-10-08','2022-10-08',3300,'Efectivo',7),('2022-11-08','2022-11-06',3300,'Tarjeta Debito',7),('2022-11-20',null,3400,'Tarjeta Credito',8),('2022-11-18',null,3400,'Tarjeta Credito',17);
/*!40000 ALTER TABLE `cuota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ejercicio`
--

DROP TABLE IF EXISTS `ejercicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ejercicio` (
  `id_ejercicio` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `comentario` varchar(255) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `video` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_ejercicio`),
  UNIQUE KEY `id_ejercicio_UNIQUE` (`id_ejercicio`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ejercicio`
--

LOCK TABLES `ejercicio` WRITE;
/*!40000 ALTER TABLE `ejercicio` DISABLE KEYS */;
INSERT INTO `ejercicio` VALUES (1,'Squat','Sentadillas o cuclillas, ejercicio basico del entrenamiento de fuerza','https://deportesyeducacionfisica.com/wp-content/uploads/2012/03/hacer-sentadillas-correctamente.jpg',NULL),(2,'Crunches','Ejercicio abdominal','https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/crunch-1588842220.jpg?resize=480:*',NULL),(3,'Plank','Ejercicio abdominal','https://mejorconsalud.as.com/wp-content/uploads/2016/11/Hacer-plank-todos-los-di%CC%81as.jpg',NULL),(4,'Push Press','Ejercicios de empuje con hombros','https://www.rutinaejercicios.com/pushpress.jpg',NULL),(5,'SDHP','Sumo Deadlift High Pull. Ejercicio compuesto','https://i.ytimg.com/vi/gh55vVlwlQg/maxresdefault.jpg',NULL),(6,'KB Row','Remo con pesa rusa','https://i.blogs.es/23f5ad/kbinfo_dblbentoverrow/450_1000.webp',NULL),(7,'Power Clean','Ejercicio compuesto decarga de barra','https://i.ytimg.com/vi/0aP3tgKZcHQ/maxresdefault.jpg',NULL),(8,'Front Squat','Sentadilla con barra en la parte posterior','https://static.strengthlevel.com/images/illustrations/front-squat-1000x1000.jpg',NULL),(9,'Box Jump','Salto sobre cajon','https://media.istockphoto.com/vectors/box-jumps-woman-silhouettes-colorful-plyometric-exercise-illustration-vector-id1214450733?k=20&m=1214450733&s=170667a&w=0&h=sNbGnKZdb10KXppplGN25nYrAtPY82-iqiOsHQn5Q6c=',NULL),(10,'HSPU','Handstand Push Up. Empuje hacia arriba de todo el cuerpo','https://www.estilorx.com/wp-content/uploads/2015/03/handstand-pushup-flexiones-invertidas-crossfit.jpg',NULL),(11,'Hollow Rock','Ejercicio abdominal','https://images.hola.com/imagenes/estar-bien/20210315185932/ejercicio-abdominales-hollow-rock/0-929-847/hollow-rock-z.jpg',NULL),(12,'Run','Correr','https://us.123rf.com/450wm/neyro2008/neyro20081509/neyro2008150900122/45734642-ejecuci%C3%B3n-de-siluetas-de-personas-corrida-deporte-fitness-activo-el-ejercicio-y-la-atleta-ilustraci%C3%B3.jpg',NULL),(13,'Rope Jump','Salto a la cuerda','https://www.mensjournal.com/wp-content/uploads/mf/101-best-workouts-the-best-jump-rope-workout-3.jpg',NULL),(14,'Push Ups','Lagartijas','https://www.outsideonline.com/wp-content/uploads/2017/07/27/perfect-push-up_s.jpg',NULL),(15,'V-Ups','Ejercicio abdominal','https://previews.123rf.com/images/logo3in1/logo3in11806/logo3in1180600007/103193136-mujer-mostrando-paso-de-entrenamiento-abdominal-con-ejercicio-v-ups-ilustraci%C3%B3n-sobre-movimientos-co.jpg',NULL),(16,'Pull Ups',NULL,'https://www.puntofape.com/wp-content/uploads/2016/05/pullup-con-agarre-abierto.jpg',NULL),(17,'Muscle Ups','Ejercicio compuesto','https://mundoentrenamiento.com/wp-content/uploads/2021/08/ejecucion-del-muscle-up.jpeg',NULL),(18,'Deadlift','Peso muerto','https://image.shutterstock.com/image-vector/man-doing-barbell-deadlifts-exercise-260nw-2031951569.jpg',NULL),(19,'Burpee',NULL,'https://i.imgur.com/a56Ib2p.jpg',NULL);
/*!40000 ALTER TABLE `ejercicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ejercicio_grupo`
--

DROP TABLE IF EXISTS `ejercicio_grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ejercicio_grupo` (
  `id_grupo` int NOT NULL,
  `id_ejercicio` int NOT NULL,
  PRIMARY KEY (`id_grupo`,`id_ejercicio`),
  KEY `fk_ejercicio_idx` (`id_ejercicio`),
  CONSTRAINT `fk_ejercicio` FOREIGN KEY (`id_ejercicio`) REFERENCES `ejercicio` (`id_ejercicio`),
  CONSTRAINT `fk_grupo` FOREIGN KEY (`id_grupo`) REFERENCES `grupo_musculo` (`id_grupo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ejercicio_grupo`
--

LOCK TABLES `ejercicio_grupo` WRITE;
/*!40000 ALTER TABLE `ejercicio_grupo` DISABLE KEYS */;
INSERT INTO `ejercicio_grupo` VALUES (3,1),(7,1),(8,1),(9,2),(9,3),(2,4),(6,4),(3,5),(6,5),(7,5),(8,5),(2,6),(10,6),(3,7),(7,7),(10,7),(3,8),(7,8),(8,8),(3,9),(7,9),(8,9),(12,9),(2,10),(4,10),(5,10),(6,10),(10,10),(9,11),(3,12),(7,12),(8,12),(12,12),(3,13),(7,13),(8,13),(12,13),(1,14),(4,14),(5,14),(10,14),(9,15),(2,16),(4,16),(5,16),(6,16),(10,16),(1,17),(2,17),(4,17),(5,17),(6,17),(10,17),(7,18),(1,19),(3,19),(4,19),(5,19),(7,19),(8,19),(10,19),(12,19);
/*!40000 ALTER TABLE `ejercicio_grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo_musculo`
--

DROP TABLE IF EXISTS `grupo_musculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grupo_musculo` (
  `id_grupo` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `comentario` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_grupo`),
  UNIQUE KEY `id_grupo_UNIQUE` (`id_grupo`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo_musculo`
--

LOCK TABLES `grupo_musculo` WRITE;
/*!40000 ALTER TABLE `grupo_musculo` DISABLE KEYS */;
INSERT INTO `grupo_musculo` VALUES (1,'Pectoral','Musculo compuesto, conecta la parte delantera del pecho humano'),(2,'Dorsal','Musculo compuesto, localizado posterior al brazo'),(3,'Cuadriceps','Compuesto de cuatro cabezas musculares'),(4,'Biceps','Pertenece a la region anterior del brazo, formado por dos cabezas'),(5,'Triceps','Musculo situado en la regiÃƒÂ³n posterior del brazo'),(6,'Hombros',NULL),(7,'Isquios','Grupo de 3 musculos, extendido a lo largo de la parte posterior del muslo desde la cadera hasta la zona justo debajo de la rodilla'),(8,'Gluteos','Musculos situados detras de la pelvis'),(9,'Abdominales',NULL),(10,'Antebrazo',NULL),(11,'Cuello',NULL),(12,'Gemelos','Formado por 2 cabezas musculares, situado en la region posterior de la pierna');
/*!40000 ALTER TABLE `grupo_musculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horario`
--

DROP TABLE IF EXISTS `horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horario` (
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  `dias_semana` varchar(255) NOT NULL,
  `id_plan` int NOT NULL,
  PRIMARY KEY (`hora_inicio`,`id_plan`),
  KEY `fk_horario_plan_idx` (`id_plan`),
  CONSTRAINT `fk_horario_plan` FOREIGN KEY (`id_plan`) REFERENCES `plan` (`id_plan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horario`
--

LOCK TABLES `horario` WRITE;
/*!40000 ALTER TABLE `horario` DISABLE KEYS */;
INSERT INTO `horario` VALUES ('07:00:00','08:00:00','lunes, miercoles, viernes',1),('08:00:00','09:30:00','lunes, miercoles, viernes',3),('10:00:00','11:00:00','Lunes a Viernes',4),('12:00:00','13:00:00','lunes, miercoles, viernes',6),('14:00:00','15:00:00','Lunes a Jueves',5),('15:00:00','16:00:00','martes, jueves',1),('16:00:00','17:30:00','lunes, miercoles, viernes',3),('18:00:00','19:00:00','Martes, Jueves, Sabado',4),('19:00:00','20:00:00','lunes a viernes',1),('20:00:00','21:00:00','lunes, miercoles, viernes',2);
/*!40000 ALTER TABLE `horario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor`
--

DROP TABLE IF EXISTS `instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instructor` (
  `dni` varchar(45) NOT NULL,
  `tipo_doc` varchar(55) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  PRIMARY KEY (`dni`),
  UNIQUE KEY `dni_UNIQUE` (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor`
--

LOCK TABLES `instructor` WRITE;
/*!40000 ALTER TABLE `instructor` DISABLE KEYS */;
INSERT INTO `instructor` VALUES ('37129807','DNI','Aurelio','Buendia','1989-02-12','aurelionsol@gmail.com','2478 51-5909'),('42019128','DNI','Juana','Perello','1996-10-29','juannapep@gmail.com','341 890-9442'),('44874221','DNI','Maria','Carrera','1997-04-25','mariacarrera@gmail.com','341 506-9595');
/*!40000 ALTER TABLE `instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan`
--

DROP TABLE IF EXISTS `plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan` (
  `id_plan` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `fecha_expiracion` date NOT NULL,
  `baja_logica` tinyint DEFAULT NULL,
  PRIMARY KEY (`id_plan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan`
--

LOCK TABLES `plan` WRITE;
/*!40000 ALTER TABLE `plan` DISABLE KEYS */;
INSERT INTO `plan` VALUES (1,'All Levels','Entrenamiento apto para todas las edades y genero','2022-12-31',NULL),(2,'Advanced','Entrenamiento de crossfit avanzado','2022-12-31',NULL),(3,'Cardio','Ejercicios cardiovasculares','2023-12-31',NULL),(4,'Funcional','Ejercicios que se adaptan a los movimientos naturales del cuerpo humano','2023-12-31',NULL),(5,'Yoga','Posturas fisicas, ejercicios de respiracion y meditacion','2022-12-31',NULL),(6,'Fuerza','Entrenamiento de fuerza muscular','2024-12-31',NULL);
/*!40000 ALTER TABLE `plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan_instructor`
--

DROP TABLE IF EXISTS `plan_instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan_instructor` (
  `dni` varchar(255) NOT NULL,
  `id_plan` int NOT NULL,
  PRIMARY KEY (`dni`,`id_plan`),
  KEY `fk_planes_idx` (`id_plan`),
  CONSTRAINT `fk_instructor` FOREIGN KEY (`dni`) REFERENCES `instructor` (`dni`),
  CONSTRAINT `fk_planes` FOREIGN KEY (`id_plan`) REFERENCES `plan` (`id_plan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan_instructor`
--

LOCK TABLES `plan_instructor` WRITE;
/*!40000 ALTER TABLE `plan_instructor` DISABLE KEYS */;
INSERT INTO `plan_instructor` VALUES ('42019128',1),('44874221',1),('37129807',2),('37129807',3),('42019128',4),('42019128',5),('37129807',6);
/*!40000 ALTER TABLE `plan_instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan_rutina`
--

DROP TABLE IF EXISTS `plan_rutina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan_rutina` (
  `id_plan` int NOT NULL,
  `id_rutina` int NOT NULL,
  PRIMARY KEY (`id_plan`,`id_rutina`),
  KEY `fk_rutinas_idx` (`id_rutina`),
  CONSTRAINT `fk_rutina_plan` FOREIGN KEY (`id_plan`) REFERENCES `plan` (`id_plan`),
  CONSTRAINT `fk_rutinas` FOREIGN KEY (`id_rutina`) REFERENCES `rutina` (`id_rutina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan_rutina`
--

LOCK TABLES `plan_rutina` WRITE;
/*!40000 ALTER TABLE `plan_rutina` DISABLE KEYS */;
INSERT INTO `plan_rutina` VALUES (2,1),(2,2),(1,4),(4,4),(1,5),(1,6),(6,6),(3,7);
/*!40000 ALTER TABLE `plan_rutina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `id_rol` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  PRIMARY KEY (`id_rol`),
  UNIQUE KEY `id_rol_UNIQUE` (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'admin'),(2,'encargado'),(3,'usuario');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rutina`
--

DROP TABLE IF EXISTS `rutina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rutina` (
  `id_rutina` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `semanas` varchar(45) NOT NULL,
  `nivel` varchar(45) NOT NULL,
  `comentario` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_rutina`),
  UNIQUE KEY `id_rutina_UNIQUE` (`id_rutina`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rutina`
--

LOCK TABLES `rutina` WRITE;
/*!40000 ALTER TABLE `rutina` DISABLE KEYS */;
INSERT INTO `rutina` VALUES (1,'Intensiva 1A','3','Dificil','Rutina compuesta por ejercicios avanzados para los mas experimentados'),(2,'Intensiva 1B','1','Dificil','Rutina con solo ejercicios compuestos'),(3,'Intensiva 2B','2','Dificil',NULL),(4,'Regular 1A','4','Facil','Rutina basica'),(5,'Regular 3B','3','Medio',NULL),(6,'Tecnica 1A','1','Medio','Rutina diseÃƒÂ±ada para practicar tecnica'),(7,'Cardiovascular','3','Medio','Rutina de cardio');
/*!40000 ALTER TABLE `rutina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rutina_ejercicio`
--

DROP TABLE IF EXISTS `rutina_ejercicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rutina_ejercicio` (
  `id_rutina` int NOT NULL,
  `id_ejercicio` int NOT NULL,
  PRIMARY KEY (`id_rutina`,`id_ejercicio`),
  KEY `fk_ejercicio_idx` (`id_ejercicio`),
  CONSTRAINT `fk_ejercicio_rutina` FOREIGN KEY (`id_ejercicio`) REFERENCES `ejercicio` (`id_ejercicio`),
  CONSTRAINT `fk_rutina` FOREIGN KEY (`id_rutina`) REFERENCES `rutina` (`id_rutina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rutina_ejercicio`
--

LOCK TABLES `rutina_ejercicio` WRITE;
/*!40000 ALTER TABLE `rutina_ejercicio` DISABLE KEYS */;
INSERT INTO `rutina_ejercicio` VALUES (4,1),(4,2),(7,2),(3,3),(2,4),(1,5),(2,5),(6,5),(1,6),(3,6),(2,7),(6,7),(3,8),(5,8),(3,9),(1,10),(6,10),(1,11),(5,11),(4,12),(7,12),(5,13),(7,13),(4,14),(1,15),(1,16),(3,16),(2,17),(1,18),(3,19),(5,19),(7,19);
/*!40000 ALTER TABLE `rutina_ejercicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  `tipo_doc` varchar(45) NOT NULL,
  `dni` varchar(45) NOT NULL,
  `email` varchar(255) NOT NULL,
  `genero` varchar(45) DEFAULT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `id_rol` int NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `id_usuario_UNIQUE` (`id_usuario`),
  UNIQUE KEY `usuariocol_UNIQUE` (`username`),
  KEY `fk_usuario_rol_idx` (`id_rol`),
  CONSTRAINT `fk_usuario_rol` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (4,'Angela','Castro','341 672-8871','DNI','42164672','angelacastro0@gmail.com.ar','Femenino','angieecc','f4bric4dep4stas','Cerrito 464',3,'1999-12-10'),(5,'German','Perez','3460 69-1417','DNI','38923598','germanoperez@gmail.com','Masculino','germancito','aleatorio0o0','Francia 1221',3,'1985-01-27'),(6,'Sara','Guirado','3415 96-5937','DNI','43077525','saritaguirado20@gmail.com','Femenino','saraa19','unodostres321','Moreno 2013',3,'2002-04-28'),(7,'asus','asusa','123','dni','32323233','32323233','masculino','jujoabc','123','123',3,'2000-02-02'),(8,'Andres','Jimeno','3464 62-0330','DNI','36289631','adresjimeno@abc.gov.ar','Masculino','andresitoo','andresstmb','Saavedra 543',3,'1985-07-22'),(10,'Administrador','Supremo','000 000-0000','DNI','1000000','adminsupremo@god.com','UNDEFINED','admin','admin','Nowhere 0000',1,'0000-01-01'),(14,'Novo','Encargado','55555','dni','55555','55555','notAnswered','yoshitvv','123','Calle Falsa 123',2,'1000-01-01'),(17,'Mauro Nicolas','User','63','pasaporte','42130241','42130241','masculino','maurojjzz','123','Calle Falsa 123',3,'1999-10-08');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_plan`
--

DROP TABLE IF EXISTS `usuario_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_plan` (
  `id_usuario` int NOT NULL,
  `id_plan` int NOT NULL,
  PRIMARY KEY (`id_usuario`,`id_plan`),
  KEY `fk_up_plan_idx` (`id_plan`),
  CONSTRAINT `fk_up_plan` FOREIGN KEY (`id_plan`) REFERENCES `plan` (`id_plan`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_plan`
--

LOCK TABLES `usuario_plan` WRITE;
/*!40000 ALTER TABLE `usuario_plan` DISABLE KEYS */;
INSERT INTO `usuario_plan` VALUES (7,2),(5,3),(4,4),(6,4),(4,5),(8,5),(5,6);
/*!40000 ALTER TABLE `usuario_plan` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-05 13:57:31
