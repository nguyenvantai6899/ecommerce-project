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
-- Table structure for table `payment_detail`
--

DROP TABLE IF EXISTS `payment_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `orderId` int DEFAULT NULL,
  `cardId` bigint DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_detail`
--

LOCK TABLES `payment_detail` WRITE;
/*!40000 ALTER TABLE `payment_detail` DISABLE KEYS */;
INSERT INTO `payment_detail` VALUES (1,130,123456790,'2023-03-08'),(2,133,123456790,'2023-03-08'),(3,134,123456790,'2023-03-08'),(4,128,123456790,'2023-03-12'),(5,136,123456790,'2023-03-12'),(7,135,123456790,'2023-03-12'),(8,132,123456790,'2023-03-12'),(9,131,123456790,'2023-03-12'),(10,129,123456790,'2023-03-12'),(11,137,123456790,'2023-03-12'),(12,138,123456790,'2023-03-12'),(13,139,123456790,'2023-03-12'),(14,140,123456790,'2023-03-12'),(15,141,123456790,'2023-03-12'),(16,142,123456790,'2023-03-12'),(17,144,123456790,'2023-03-14'),(18,145,123456790,'2023-03-14'),(19,146,123456790,'2023-03-22'),(20,149,123456790,'2023-03-22'),(21,150,123456790,'2023-03-22'),(22,151,123456790,'2023-03-22'),(23,152,123456790,'2023-03-22'),(24,153,1234567891234567,'2023-03-22'),(25,154,123456789,'2023-03-23'),(26,155,1234567891234567,'2023-03-23'),(27,156,1234567891234567,'2023-03-23'),(28,147,1234567891234567,'2023-03-23'),(29,158,1234567891234567,'2023-03-23'),(30,159,1234567891234567,'2023-03-29'),(31,163,1234567891234567,'2023-03-29'),(32,165,1234567891234567,'2023-03-29'),(33,170,1234567891234567,'2023-04-10'),(34,169,1234567891234567,'2023-04-10'),(35,166,1234567891234567,'2023-04-10'),(36,183,1234567891234567,'2023-04-12'),(37,185,1234567891234567,'2023-04-12'),(38,186,1234567891234567,'2023-04-12'),(39,187,1234567891234567,'2023-04-12');
/*!40000 ALTER TABLE `payment_detail` ENABLE KEYS */;
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
