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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(45) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phone_number` varchar(45) DEFAULT NULL,
  `role` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'admin',NULL,NULL,NULL,NULL,'ROLE_ADMIN','admin','{noop}123'),(2,'NguyenVanA','1999-01-29','dn','thanhdiaafktai1@gmail.com','+84302145875','ROLE_USER','a@gmail.com','{noop}123'),(3,'nguyen van b','1999-01-01','qn','b@gmail.com','+84302145875','ROLE_USER','b@gmail.com','{noop}123'),(4,'c','1999-01-01','h','c@gmail.com','+84302145875','ROLE_USER','c@gmail.com','{noop}123'),(5,'d','1999-01-01','qt','d@gmail.com','+84302145875','ROLE_USER','d@gmail.com','{noop}123'),(6,'e','1999-01-01','dn','e@gmail.com','+84302145875','ROLE_USER','e@gmail.com','{noop}123'),(7,'f','1999-01-01','dn','f@gmail.com','+84302145875','ROLE_USER','f@gmail.com','{noop}123'),(8,'g','1999-01-01','dn','g@gmail.com','+84302145875','ROLE_USER','g@gmail.com','{noop}123'),(24,'Nguyen Van Tai','1999-06-08','Quang Nam','nguyenvantai6899@gmail.com','0367524085','ROLE_USER','nguyenvantai','{noop}12345678'),(25,'teo','2023-01-01','quang nam','teo@gmail.com','0123456214','ROLE_USER','teo','{noop}123'),(26,'nguyen van tai','2023-01-01','quang nam','thanhdiaafktai1@gmail.com','01234567852','ROLE_USER','nguyenvantai1','{noop}123');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
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
