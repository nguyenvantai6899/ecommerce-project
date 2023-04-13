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
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `orderID` int DEFAULT NULL,
  `productName` varchar(45) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `unitPrice` double DEFAULT NULL,
  `image` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=210 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (175,165,'Iphone 13',1,1125,'i13'),(176,166,'PoCo F4',1,360,'pocof4'),(177,167,'Iphone 13',10,1125,'i13'),(178,168,'Iphone 11',3,1000,'i11'),(179,169,'Iphone 13',1,1125,'i13'),(180,169,'Iphone 12',3,935,'i12'),(181,169,'Iphone 14',4,1600,'i14'),(182,170,'Iphone 11',1,1000,'i11'),(183,170,'Z Flip 4',1,1280,'zflip'),(184,171,'Mi 12',1,490,'mi12'),(185,171,'Iphone 12',1,935,'i12'),(186,171,'Iphone 11',2,1000,'i11'),(187,172,'Iphone 11',2,1000,'i11'),(188,173,'Iphone 13',1,1125,'i13'),(189,174,'Iphone 13',1,1125,'i13'),(190,176,'Iphone 12',1,935,'i12'),(194,179,'Iphone 11',1,1000,'i11'),(199,180,'Iphone 12',1,935,'i12'),(200,181,'Iphone 13',1,1125,'i13'),(201,182,'Iphone 13',1,1125,'i13'),(202,183,'Iphone 11',1,1000,'i11'),(203,184,'Iphone 11',2,1000,'i11'),(204,184,'Iphone 14',1,1600,'i14'),(205,185,'Iphone 11',2,1000,'i11'),(206,185,'Iphone 14',1,1600,'i14'),(207,185,'Iphone 13',1,1125,'i13'),(208,186,'Z Fold 4',1,1120,'zfold'),(209,187,'S 22 Ultra',1,880,'s22ultra');
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
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
