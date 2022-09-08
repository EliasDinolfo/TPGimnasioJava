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
  `id_plan` int NOT NULL,
  `id_usuario` int NOT NULL,
  PRIMARY KEY (`fecha_pago`,`id_plan`,`id_usuario`),
  KEY `fk_cuota_usuario_idx` (`id_usuario`),
  KEY `fk_cuota_plan_idx` (`id_plan`),
  CONSTRAINT `fk_cuota_plan` FOREIGN KEY (`id_plan`) REFERENCES `plan` (`id_plan`),
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ejercicio`
--

LOCK TABLES `ejercicio` WRITE;
/*!40000 ALTER TABLE `ejercicio` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo_musculo`
--

LOCK TABLES `grupo_musculo` WRITE;
/*!40000 ALTER TABLE `grupo_musculo` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
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
  `id_plan` int DEFAULT NULL,
  `id_rol` int NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `id_usuario_UNIQUE` (`id_usuario`),
  UNIQUE KEY `usuariocol_UNIQUE` (`username`),
  KEY `fk_usuario_rol_idx` (`id_rol`),
  KEY `fk_usuario_plan_idx` (`id_plan`),
  CONSTRAINT `fk_usuario_plan` FOREIGN KEY (`id_plan`) REFERENCES `plan` (`id_plan`),
  CONSTRAINT `fk_usuario_rol` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-08  2:17:40
