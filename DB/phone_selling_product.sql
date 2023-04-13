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
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `memory` varchar(45) DEFAULT NULL,
  `camera` varchar(45) DEFAULT NULL,
  `pin` int DEFAULT NULL,
  `producer` varchar(45) DEFAULT NULL,
  `image` varchar(45) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `unitPrice` double DEFAULT NULL,
  `sold` int DEFAULT NULL,
  `price` double DEFAULT NULL,
  `rate` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Iphone 11','6GB-128GB','Dual 12 MP',3110,'Apple','i11',95,1000,4,1000,4),(2,'Iphone 12','8GB-128GB','12 MP',4110,'Apple','i12',100,935,3,1100,4.166666666666667),(3,'Iphone 13','8GB-256GB','12 MP',4110,'Apple','i13',8,1125,3,1500,4),(4,'Iphone 14','8GB-256GB','12 MP',5110,'Apple','i14',98,1600,5,2000,4.333333333333333),(5,'Z Fold 4','6GB-128GB','12 MP',5110,'Samsum','zfold',99,1120,1,1400,NULL),(6,'Z Flip 4','8GB-128GB','12 MP',5110,'Samsum','zflip',100,1280,1,1600,4),(7,'S 22 Ultra','6GB-128GB','12 MP',5110,'Samsum','s22ultra',99,880,1,1100,3),(8,'Mi 11','8GB-256GB','12 MP',5110,'Xiaomi','mi11',100,375,0,500,NULL),(9,'Mi 12','6GB-128GB','12 MP',5110,'Xiaomi','mi12',100,490,0,700,NULL),(10,'PoCo F4','8GB-256GB','12 MP',5110,'Xiaomi','pocof4',100,360,1,400,NULL),(11,'Redmi Note 11','8GB-128GB','12 MP',5110,'Xiaomi','redminote11',100,350,0,350,NULL),(12,'Oppo Reno 7','6GB-128GB','12 MP',5110,'Oppo','reno7',100,200,0,200,NULL),(13,'Oppo Reno 8','8GB-128GB','12 MP',5110,'Oppo','reno8',100,150,0,150,NULL),(14,'Vivo Y21','6GB-128GB','12 MP',5110,'Vivo','y21',100,200,0,200,NULL),(15,'Vivo V23','6GB-128GB','12 MP',5110,'Vivo','v23',100,175,0,175,NULL),(16,'Iphone 13 Pro Max','6Gb-512GB','12MP-12MP',4352,'Apple','i13promax',100,1420,0,1420,NULL),(17,'Iphone SE','4GB-64GB','7MP-12MP',2018,'Apple','ise',100,450,0,450,NULL),(18,'OPPO A55','6GB-128GB','16 MP',5000,'Oppo','oppoa55',100,200,0,200,NULL),(19,'Oppo A16','6GB-64GB','14MP',4900,'Oppo','oppoa16',100,197,0,197,NULL),(20,'Samsum Galaxy S23','8GB-256GB','20MP',5200,'Samsum','galaxys23',100,1100,0,1100,NULL),(21,'Samsum Galaxy A14','6GB-64GB','10MP',4500,'Samsum','samsuma14',100,200,0,200,NULL),(22,'Vivo Y33','6GB-128GB','12MP',4320,'Vivo','vivoy33',100,205,0,205,NULL),(23,'Iphone 14 Pro Max','6GB-256GB','40MP-12MP',4323,'Apple','i14promax',100,1500,0,1500,5),(24,'Iphone 14 Pro','6GB-256GB','40MP-12MP',4325,'Apple','i14pro',100,1300,0,1300,NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
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
