CREATE DATABASE  IF NOT EXISTS `diagnostico_medico` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `diagnostico_medico`;
-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: diagnostico_medico
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
-- Table structure for table `diagnostico`
--

DROP TABLE IF EXISTS `diagnostico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diagnostico` (
  `id_diagnostico` int NOT NULL AUTO_INCREMENT,
  `fecha_diagnostico` date NOT NULL,
  `idenfermedad` int DEFAULT NULL,
  PRIMARY KEY (`id_diagnostico`),
  KEY `idenfermedad_idx` (`idenfermedad`),
  CONSTRAINT `idenfermedad` FOREIGN KEY (`idenfermedad`) REFERENCES `enfermedades` (`id_enfermedad`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnostico`
--

LOCK TABLES `diagnostico` WRITE;
/*!40000 ALTER TABLE `diagnostico` DISABLE KEYS */;
INSERT INTO `diagnostico` VALUES (1,'2020-08-20',1),(2,'2020-08-20',2);
/*!40000 ALTER TABLE `diagnostico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enfermedades`
--

DROP TABLE IF EXISTS `enfermedades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enfermedades` (
  `id_enfermedad` int NOT NULL AUTO_INCREMENT,
  `nombre_enfermedad` varchar(45) NOT NULL,
  `descripcion_enfermedad` varchar(900) NOT NULL,
  `tratamiento_enfermedad` varchar(900) DEFAULT NULL,
  PRIMARY KEY (`id_enfermedad`),
  UNIQUE KEY `nombre_enfermedad_UNIQUE` (`nombre_enfermedad`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enfermedades`
--

LOCK TABLES `enfermedades` WRITE;
/*!40000 ALTER TABLE `enfermedades` DISABLE KEYS */;
INSERT INTO `enfermedades` VALUES (1,'amigdalitis','La amigdalitis es la inflamación de las amígdalas, dos masas de tejido de forma ovalada situadas a ambos lados de la parte posterior de la garganta. Los signos y síntomas de la amigdalitis comprenden hinchazón de las amígdalas, dolor de garganta, dificultad para tragar y sensibilidad de los ganglios linfáticos a los lados del cuello','El tratamiento de la amigdalitis depende de la causa. Si la causa es un virus, no hay medicina para tratarlo. Si la causa es una infección bacteriana, como la faringitis estreptocócica, necesitará tomar antibióticos. Es importante que termine el tratamiento con antibióticos incluso si se siente mejor. Si el tratamiento se detiene demasiado pronto, algunas bacterias pueden sobrevivir y volver a infectar.'),(2,'laringitis','La laringitis es la inflamación de la glotis (laringe) por uso excesivo, irritación o infección.','La laringitis aguda generalmente mejora por sí sola aproximadamente en una semana. Las medidas de cuidado personal pueden ayudar a mejorar los síntomas. En casos más graves se puede hacer uso de antibióticos.');
/*!40000 ALTER TABLE `enfermedades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre_usuario` varchar(45) NOT NULL,
  `edad_usuario` int NOT NULL,
  `correo_usuario` varchar(45) DEFAULT NULL,
  `peso_usuario` decimal(10,2) NOT NULL,
  `altura_usuario` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `correo_usuario_UNIQUE` (`correo_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Pepito ',32,'pepito@gmail.com',64.32,170.00),(2,'Adonisedec',48,'adn@gmail.com',84.00,195.00);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_diagnostico`
--

DROP TABLE IF EXISTS `usuario_diagnostico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_diagnostico` (
  `idusuario` int NOT NULL,
  `iddiagnostico` int NOT NULL,
  PRIMARY KEY (`idusuario`,`iddiagnostico`),
  KEY `idusuario_idx` (`idusuario`),
  KEY `iddiagnostico_idx` (`iddiagnostico`),
  CONSTRAINT `iddiagnostico` FOREIGN KEY (`iddiagnostico`) REFERENCES `diagnostico` (`id_diagnostico`),
  CONSTRAINT `idusuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_diagnostico`
--

LOCK TABLES `usuario_diagnostico` WRITE;
/*!40000 ALTER TABLE `usuario_diagnostico` DISABLE KEYS */;
INSERT INTO `usuario_diagnostico` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `usuario_diagnostico` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-20 20:36:49
