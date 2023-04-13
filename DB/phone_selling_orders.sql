-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: phone_selling
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customerID` int DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `transportID` int DEFAULT NULL,
  `payment` varchar(45) DEFAULT NULL,
  `note` varchar(45) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `totalPrice` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=188 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (165,2,'paid',1,'online payment','','2023-03-29',1125),(166,2,'paid',1,'online payment','','2023-04-05',360),(167,2,'unpaid',1,'online payment','','2023-04-10',11250),(168,2,'unpaid',1,'online payment','','2023-04-10',3000),(169,2,'paid',1,'online payment','','2023-04-10',10330),(170,2,'paid',1,'online payment','','2023-04-10',2280),(171,2,'unpaid',1,'online payment','','2023-04-12',3425),(172,2,'unpaid',1,'online payment','','2023-04-12',2000),(173,2,'unpaid',1,'online payment','','2023-04-12',1125),(174,2,'unpaid',1,'online payment','','2023-04-12',1125),(176,2,'unpaid',1,'online payment','','2023-04-12',935),(179,3,'unpaid',14,'online payment','','2023-04-12',1000),(180,3,'unpaid',3,'online payment','','2023-04-12',935),(181,3,'unpaid',3,'online payment','','2023-04-12',1125),(182,3,'unpaid',3,'online payment','','2023-04-12',1125),(183,3,'paid',3,'online payment','','2023-04-12',1000),(184,3,'unpaid',3,'online payment','','2023-04-12',NULL),(185,3,'paid',3,'online payment','','2023-04-12',4725),(186,2,'paid',12,'online payment','','2023-04-12',1120),(187,6,'paid',7,'online payment','','2023-04-12',880);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-13  9:55:38
