-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: hotel
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `camere`
--

DROP TABLE IF EXISTS `camere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `camere` (
  `idcamera` int NOT NULL AUTO_INCREMENT,
  `capacitate` int DEFAULT NULL,
  `pret` int DEFAULT NULL,
  PRIMARY KEY (`idcamera`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `camere`
--

LOCK TABLES `camere` WRITE;
/*!40000 ALTER TABLE `camere` DISABLE KEYS */;
INSERT INTO `camere` VALUES (1,2,175),(2,1,200),(3,1,250),(4,2,400),(5,2,400);
/*!40000 ALTER TABLE `camere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clienti`
--

DROP TABLE IF EXISTS `clienti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clienti` (
  `idclient` int NOT NULL AUTO_INCREMENT,
  `nume` varchar(45) DEFAULT NULL,
  `prenume` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `data_nastere` date DEFAULT NULL,
  PRIMARY KEY (`idclient`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clienti`
--

LOCK TABLES `clienti` WRITE;
/*!40000 ALTER TABLE `clienti` DISABLE KEYS */;
INSERT INTO `clienti` VALUES (1,'Nita','Razvan','georgenita@gmail.com','2004-06-25'),(2,'Nita','Mariana','mariananita123@gmail.com','1995-12-12'),(3,'Mihai','Catalin','catalinmihai5@gmail.com','1994-10-14'),(5,'Oprea','Marian','opreamarian00@gmai.com','2003-03-02'),(6,'Eminescu','Georgescu','eminescugeorge100@gmail.com','1976-11-21');
/*!40000 ALTER TABLE `clienti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rezervari`
--

DROP TABLE IF EXISTS `rezervari`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rezervari` (
  `idrezervare` int NOT NULL AUTO_INCREMENT,
  `idcamera` int NOT NULL,
  `idclient` int NOT NULL,
  `checkin` datetime DEFAULT NULL,
  `checkout` datetime DEFAULT NULL,
  PRIMARY KEY (`idrezervare`),
  KEY `fk_idcamera_idx` (`idcamera`),
  KEY `fk_idclient_idx` (`idclient`),
  CONSTRAINT `fk_idcamera` FOREIGN KEY (`idcamera`) REFERENCES `camere` (`idcamera`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_idclient` FOREIGN KEY (`idclient`) REFERENCES `clienti` (`idclient`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rezervari`
--

LOCK TABLES `rezervari` WRITE;
/*!40000 ALTER TABLE `rezervari` DISABLE KEYS */;
INSERT INTO `rezervari` VALUES (2,1,5,'2025-01-01 12:00:00','2025-01-04 12:00:00'),(3,3,2,'2025-02-15 13:30:00','2025-02-20 13:30:00'),(5,2,1,'2025-02-15 13:30:00','2025-02-20 13:30:00'),(9,4,5,'2025-10-13 13:30:00','2025-10-14 13:30:00'),(10,1,3,'2025-05-20 13:30:00','2025-05-24 13:30:00');
/*!40000 ALTER TABLE `rezervari` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-23 17:45:12
