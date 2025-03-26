-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: wildbite_ab
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `djur_föda`
--

DROP TABLE IF EXISTS `djur_föda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `djur_föda` (
  `Djur_FödaID` int NOT NULL AUTO_INCREMENT,
  `Vetenskapligt_Namn` varchar(255) NOT NULL,
  `FödaID` int NOT NULL,
  PRIMARY KEY (`Djur_FödaID`),
  KEY `Vetenskapligt_Namn` (`Vetenskapligt_Namn`),
  KEY `FödaID` (`FödaID`),
  CONSTRAINT `djur_föda_ibfk_1` FOREIGN KEY (`Vetenskapligt_Namn`) REFERENCES `djurdata` (`Vetenskapligt_Namn`),
  CONSTRAINT `djur_föda_ibfk_2` FOREIGN KEY (`FödaID`) REFERENCES `föda` (`FödaID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djur_föda`
--

LOCK TABLES `djur_föda` WRITE;
/*!40000 ALTER TABLE `djur_föda` DISABLE KEYS */;
INSERT INTO `djur_föda` VALUES (1,'Alces alces',1),(2,'Alces alces',7),(3,'Canis lupus',2),(4,'Canis lupus',8),(5,'Esox lucius',3),(6,'Rutilus rutilus',4),(7,'Rutilus rutilus',6),(8,'Parus major',6),(9,'Parus major',5),(10,'Corvus corone',6),(11,'Corvus corone',5);
/*!40000 ALTER TABLE `djur_föda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djur_livsmiljö`
--

DROP TABLE IF EXISTS `djur_livsmiljö`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `djur_livsmiljö` (
  `Djur_LivsMiljö` int NOT NULL AUTO_INCREMENT,
  `Vetenskapligt_Namn` varchar(255) NOT NULL,
  `MiljöID` int NOT NULL,
  PRIMARY KEY (`Djur_LivsMiljö`),
  KEY `Vetenskapligt_Namn` (`Vetenskapligt_Namn`),
  KEY `MiljöID` (`MiljöID`),
  CONSTRAINT `djur_livsmiljö_ibfk_1` FOREIGN KEY (`Vetenskapligt_Namn`) REFERENCES `djurdata` (`Vetenskapligt_Namn`),
  CONSTRAINT `djur_livsmiljö_ibfk_2` FOREIGN KEY (`MiljöID`) REFERENCES `livsmiljö` (`MiljöID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djur_livsmiljö`
--

LOCK TABLES `djur_livsmiljö` WRITE;
/*!40000 ALTER TABLE `djur_livsmiljö` DISABLE KEYS */;
INSERT INTO `djur_livsmiljö` VALUES (1,'Alces alces',1),(2,'Alces alces',4),(3,'Canis lupus',1),(4,'Canis lupus',4),(5,'Esox lucius',2),(6,'Rutilus rutilus',2),(7,'Parus major',1),(8,'Parus major',3),(9,'Corvus corone',1),(10,'Corvus corone',3),(11,'Corvus corone',4);
/*!40000 ALTER TABLE `djur_livsmiljö` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djurdata`
--

DROP TABLE IF EXISTS `djurdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `djurdata` (
  `Vetenskapligt_Namn` varchar(255) NOT NULL,
  `Namn` varchar(255) NOT NULL,
  `KLass` varchar(255) NOT NULL,
  PRIMARY KEY (`Vetenskapligt_Namn`),
  KEY `idx_DjurNamn` (`Namn`),
  CONSTRAINT `tre_klass` CHECK ((`Klass` in (_utf8mb4'Däggdjur',_utf8mb4'Fisk',_utf8mb4'Fågel')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djurdata`
--

LOCK TABLES `djurdata` WRITE;
/*!40000 ALTER TABLE `djurdata` DISABLE KEYS */;
INSERT INTO `djurdata` VALUES ('Alces alces','Älg','Däggdjur'),('Canis lupus','Varg','Däggdjur'),('Corvus corone','Kråka','Fågel'),('Esox lucius','Gädda','Fisk'),('Parus major','Talgoxe','Fågel'),('Rutilus rutilus','Mört','Fisk');
/*!40000 ALTER TABLE `djurdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djurlogg`
--

DROP TABLE IF EXISTS `djurlogg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `djurlogg` (
  `LoggID` int NOT NULL AUTO_INCREMENT,
  `Händelse` varchar(255) DEFAULT NULL,
  `Tidpunkt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`LoggID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djurlogg`
--

LOCK TABLES `djurlogg` WRITE;
/*!40000 ALTER TABLE `djurlogg` DISABLE KEYS */;
INSERT INTO `djurlogg` VALUES (1,'Ny Djur: Älg','2025-03-26 15:55:12'),(2,'Ny Djur: Varg','2025-03-26 15:55:12'),(3,'Ny Djur: Gädda','2025-03-26 15:55:12'),(4,'Ny Djur: Mört','2025-03-26 15:55:12'),(5,'Ny Djur: Talgoxe','2025-03-26 15:55:12'),(6,'Ny Djur: Kråka','2025-03-26 15:55:12');
/*!40000 ALTER TABLE `djurlogg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `föda`
--

DROP TABLE IF EXISTS `föda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `föda` (
  `FödaID` int NOT NULL AUTO_INCREMENT,
  `Typ` varchar(255) NOT NULL,
  `Säsong` varchar(255) NOT NULL,
  PRIMARY KEY (`FödaID`),
  KEY `idx_föda` (`Typ`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `föda`
--

LOCK TABLES `föda` WRITE;
/*!40000 ALTER TABLE `föda` DISABLE KEYS */;
INSERT INTO `föda` VALUES (1,'Bär','Sommar'),(2,'Kadaver','Året runt'),(3,'Småfisk','Året runt'),(4,'Plankton','Sommar'),(5,'Frön','Året runt'),(6,'Insekter','Sommar'),(7,'Bark','Vinter'),(8,'Hare','Året Runt');
/*!40000 ALTER TABLE `föda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `föda_livsmiljö`
--

DROP TABLE IF EXISTS `föda_livsmiljö`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `föda_livsmiljö` (
  `Föda_LivsMiljö` int NOT NULL AUTO_INCREMENT,
  `FödaID` int NOT NULL,
  `MiljöID` int NOT NULL,
  PRIMARY KEY (`Föda_LivsMiljö`),
  KEY `FödaID` (`FödaID`),
  KEY `MiljöID` (`MiljöID`),
  CONSTRAINT `föda_livsmiljö_ibfk_1` FOREIGN KEY (`FödaID`) REFERENCES `föda` (`FödaID`),
  CONSTRAINT `föda_livsmiljö_ibfk_2` FOREIGN KEY (`MiljöID`) REFERENCES `livsmiljö` (`MiljöID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `föda_livsmiljö`
--

LOCK TABLES `föda_livsmiljö` WRITE;
/*!40000 ALTER TABLE `föda_livsmiljö` DISABLE KEYS */;
INSERT INTO `föda_livsmiljö` VALUES (1,1,1),(2,1,4),(3,2,1),(4,2,4),(5,2,3),(6,3,2),(7,4,2),(8,5,1),(9,5,4),(10,6,1),(11,6,5),(12,6,2),(13,7,1),(14,8,1),(15,8,4);
/*!40000 ALTER TABLE `föda_livsmiljö` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livsmiljö`
--

DROP TABLE IF EXISTS `livsmiljö`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `livsmiljö` (
  `MiljöID` int NOT NULL AUTO_INCREMENT,
  `Typ` varchar(255) NOT NULL,
  `Beskrivning` varchar(255) NOT NULL,
  PRIMARY KEY (`MiljöID`),
  KEY `idx_Miljö` (`Typ`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livsmiljö`
--

LOCK TABLES `livsmiljö` WRITE;
/*!40000 ALTER TABLE `livsmiljö` DISABLE KEYS */;
INSERT INTO `livsmiljö` VALUES (1,'Skog','Blandat skog'),(2,'Sjö','Sötvattenssjö med vass'),(3,'Tätort','Städer'),(4,'Åker','Öppen Mark'),(5,'Myr','Fuktig Område');
/*!40000 ALTER TABLE `livsmiljö` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-26 17:21:15
