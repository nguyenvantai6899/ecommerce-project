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
-- Table structure for table `comment_rate`
--

DROP TABLE IF EXISTS `comment_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment_rate` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customerId` int DEFAULT NULL,
  `productDetailId` int DEFAULT NULL,
  `rate` double DEFAULT NULL,
  `comment` varchar(45) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_rate`
--

LOCK TABLES `comment_rate` WRITE;
/*!40000 ALTER TABLE `comment_rate` DISABLE KEYS */;
INSERT INTO `comment_rate` VALUES (1,2,1,5,'very good','2022-10-02'),(2,2,2,5,'very good','2022-10-03'),(3,3,3,5,'very good','2022-10-02'),(4,4,4,5,'very good','2022-10-02'),(5,3,1,4,'good','2022-10-02'),(6,4,1,4,'good','2022-10-02'),(7,5,2,4,'good','2022-10-02'),(8,6,2,4,'good','2022-10-02'),(9,2,1,3,'oke','2023-03-11'),(10,2,2,3,'oke','2023-03-11'),(11,8,4,4,'tam dc','2023-03-11'),(18,7,2,5,'abc','2023-03-12'),(19,2,3,5,'abcxyz','2023-03-12'),(20,2,1,4,'b','2023-03-22'),(21,2,6,4,'a','2023-03-22'),(22,2,3,2,'','2023-03-22'),(23,26,4,4,'good','2023-03-23'),(24,2,23,5,'','2023-03-29'),(25,2,2,4,'good','2023-04-12'),(26,6,7,3,'A','2023-04-12');
/*!40000 ALTER TABLE `comment_rate` ENABLE KEYS */;
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
