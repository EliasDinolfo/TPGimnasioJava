-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: gimnasio
-- ------------------------------------------------------
-- Server version	8.0.21

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
/*!40000 ALTER TABLE `costo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuota`
--

DROP TABLE IF EXISTS `cuota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuota` (
  `fecha_pago` date NOT NULL,
  `monto` decimal(10,0) NOT NULL,
  `forma_pago` varchar(255) NOT NULL,
  `id_usuario` int NOT NULL,
  PRIMARY KEY (`fecha_pago`,`id_usuario`),
  KEY `fk_cuota_usuario_idx` (`id_usuario`),
  CONSTRAINT `fk_cuota_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuota`
--

LOCK TABLES `cuota` WRITE;
/*!40000 ALTER TABLE `cuota` DISABLE KEYS */;
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
INSERT INTO `ejercicio` VALUES (1,'Squat','Sentadillas o cuclillas, ejercicio bÃ¡sico del entrenamiento de fuerza','https://deportesyeducacionfisica.com/wp-content/uploads/2012/03/hacer-sentadillas-correctamente.jpg',NULL),(2,'Crunches','Ejercicio abdominal','https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/crunch-1588842220.jpg?resize=480:*',NULL),(3,'Plank','Ejercicio abdominal','https://mejorconsalud.as.com/wp-content/uploads/2016/11/Hacer-plank-todos-los-di%CC%81as.jpg',NULL),(4,'Push Press','Ejercicios de empuje con hombros','https://www.rutinaejercicios.com/pushpress.jpg',NULL),(5,'SDHP','Sumo Deadlift High Pull. Ejercicio compuesto','https://i.ytimg.com/vi/gh55vVlwlQg/maxresdefault.jpg',NULL),(6,'KB Row','Remo con pesa rusa','https://i.blogs.es/23f5ad/kbinfo_dblbentoverrow/450_1000.webp',NULL),(7,'Power Clean','Ejercicio compuesto decarga de barra','https://i.ytimg.com/vi/0aP3tgKZcHQ/maxresdefault.jpg',NULL),(8,'Front Squat','Sentadilla con barra en la parte posterior','https://static.strengthlevel.com/images/illustrations/front-squat-1000x1000.jpg',NULL),(9,'Box Jump','Salto sobre cajÃ³n','https://media.istockphoto.com/vectors/box-jumps-woman-silhouettes-colorful-plyometric-exercise-illustration-vector-id1214450733?k=20&m=1214450733&s=170667a&w=0&h=sNbGnKZdb10KXppplGN25nYrAtPY82-iqiOsHQn5Q6c=',NULL),(10,'HSPU','Handstand Push Up. Empuje hacia arriba de todo el cuerpo','https://www.estilorx.com/wp-content/uploads/2015/03/handstand-pushup-flexiones-invertidas-crossfit.jpg',NULL),(11,'Hollow Rock','Ejercicio abdominal','https://images.hola.com/imagenes/estar-bien/20210315185932/ejercicio-abdominales-hollow-rock/0-929-847/hollow-rock-z.jpg',NULL),(12,'Run','Correr','https://us.123rf.com/450wm/neyro2008/neyro20081509/neyro2008150900122/45734642-ejecuci%C3%B3n-de-siluetas-de-personas-corrida-deporte-fitness-activo-el-ejercicio-y-la-atleta-ilustraci%C3%B3.jpg',NULL),(13,'Rope Jump','Salto a la cuerda','https://www.mensjournal.com/wp-content/uploads/mf/101-best-workouts-the-best-jump-rope-workout-3.jpg',NULL),(14,'Push Ups','Lagartijas','https://www.outsideonline.com/wp-content/uploads/2017/07/27/perfect-push-up_s.jpg',NULL),(15,'V-Ups','Ejercicio abdominal','https://previews.123rf.com/images/logo3in1/logo3in11806/logo3in1180600007/103193136-mujer-mostrando-paso-de-entrenamiento-abdominal-con-ejercicio-v-ups-ilustraci%C3%B3n-sobre-movimientos-co.jpg',NULL),(16,'Pull Ups',NULL,'https://www.puntofape.com/wp-content/uploads/2016/05/pullup-con-agarre-abierto.jpg',NULL),(17,'Muscle Ups','Ejercicio compuesto','https://mundoentrenamiento.com/wp-content/uploads/2021/08/ejecucion-del-muscle-up.jpeg',NULL),(18,'Deadlift','Peso muerto','https://image.shutterstock.com/image-vector/man-doing-barbell-deadlifts-exercise-260nw-2031951569.jpg',NULL),(19,'Burpee',NULL,'https://i.imgur.com/a56Ib2p.jpg',NULL);
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
INSERT INTO `grupo_musculo` VALUES (1,'Pectoral','MÃºsculo compuesto, conecta la parte delantera del pecho humano'),(2,'Dorsal','MÃºsculo compuesto, localizado posterior al brazo'),(3,'CuÃ¡driceps','Compuesto de cuatro cabezas musculares'),(4,'BÃ­ceps','Pertenece a la regiÃ³n anterior del brazo, formado por dos cabezas'),(5,'TrÃ­ceps','MÃºsculo situado en la regiÃ³n posterior del brazo'),(6,'Hombros',NULL),(7,'Isquios','Grupo de 3 mÃºsculos, extendido a lo largo de la parte posterior del muslo desde la cadera hasta la zona justo debajo de la rodilla'),(8,'GlÃºteos','MÃºsculos situados detras de la pelvis'),(9,'Abdominales',NULL),(10,'Antebrazo',NULL),(11,'Cuello',NULL),(12,'Gemelos','Formado por 2 cabezas musculares, situado en la regiÃ³n posterior de la pierna');
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
  `dias_semana` varchar(45) NOT NULL,
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
INSERT INTO `instructor` VALUES ('37129807','DNI','Aurelio','Buendia','1989-02-12','aurelionsol@gmail.com','2478 51-5909'),('42019128','DNI','Juana','Perello','1996-10-29','juannapep@gmail.com','341 890-9442'),('43149283','DNI','Hugo','Lozano','1999-02-28','hugitoloz@outlook.com','3436 43-0399'),('44874221','DNI','Maria','Carrera','1997-04-25','mariacarrera@gmail.com','341 506-9595');
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
  PRIMARY KEY (`id_plan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan`
--

LOCK TABLES `plan` WRITE;
/*!40000 ALTER TABLE `plan` DISABLE KEYS */;
INSERT INTO `plan` VALUES (1,'All Levels','Entrenamiento apto para todas las edades y gÃ©nero','2022-12-31'),(2,'Advanced','Entrenamiento de crossfit avanzado','2022-12-31'),(3,'Cardio','Ejercicios cardiovasculares','2023-12-31'),(4,'Funcional','Ejercicios que se adaptan a los movimientos naturales del cuerpo humano','2023-12-31'),(5,'Yoga','Posturas fÃ­sicas, ejercicios de respiraciÃ³n y meditaciÃ³n','2022-12-31'),(6,'Fuerza','Entrenamiento de fuerza muscular','2024-12-31');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rutina`
--

LOCK TABLES `rutina` WRITE;
/*!40000 ALTER TABLE `rutina` DISABLE KEYS */;
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
  CONSTRAINT `fk_usuario_rol` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Lucas','Saavedra','341 635-7732','DNI','42044863','luc4ssavv@gmail.com','Masculino','lucassav12','contraseniaa11','Balcarce 1458',2,'1996-03-28'),(2,'Juan Jose','Ibarra','341 228-7356','DNI','39239476','jjibarra@outlook.com','Masculino','jujoabc','milanesagrande892','Italia 892',2,'1989-06-12'),(3,'Luis','Nieto','3329 59-5483','DNI','42965423','luisingnn@gmail.com','Masculino','luchotop','guantelete','9 de Julio 3023',3,'2000-04-26'),(4,'Angela','Castro','341 672-8871','DNI','42164672','angelacastro0@gmail.com.ar','Femenino','angieecc','f4bric4dep4stas','Cerrito 464',3,'1999-12-10'),(5,'German','Perez','3460 69-1417','DNI','38923598','germanoperez@gmail.com','Masculino','germancito','aleatorio0o0','Francia 1221',3,'1985-01-27'),(6,'Sara','Guirado','3415 96-5937','DNI','43077525','saritaguirado20@gmail.com','Femenino','saraa19','unodostres321','Moreno 2013',3,'2002-04-28'),(7,'Camila','Morilla','3412 76-8213','DNI','45698127','acamiliamor@outlook.com',NULL,'camillusy','pizzaconanchoas','Zeballos 1342',3,'2004-02-26'),(8,'Andres','Jimeno','3464 62-0330','DNI','36289631','adresjimeno@abc.gov.ar','Masculino','andresitoo','andresstmb','Saavedra 543',3,'1985-07-22'),(9,'Josefina','Sanchez','341 553-9241','DNI','40123891','josesanchez@gmail.com','Femenino','josesa','facildehackear0','Laprida 2020',2,'1994-12-31'),(10,'Administrador','Supremo','000 000-0000','DNI','1000000','adminsupremo@god.com','UNDEFINED','admin','admin','Nowhere 0000',1,'0000-01-01');
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
  CONSTRAINT `fk_up_plan` FOREIGN KEY (`id_plan`) REFERENCES `plan` (`id_plan`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_up_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_plan`
--

LOCK TABLES `usuario_plan` WRITE;
/*!40000 ALTER TABLE `usuario_plan` DISABLE KEYS */;
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

-- Dump completed on 2022-09-23 15:09:44
