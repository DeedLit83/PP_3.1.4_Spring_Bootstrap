-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: user_pass
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
                         `id` bigint NOT NULL AUTO_INCREMENT,
                         `role_name` varchar(20) NOT NULL,
                         PRIMARY KEY (`id`),
                         UNIQUE KEY `UK_716hgxp60ym1lifrdgp67xt5k` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (2,'ROLE_ADMIN'),(1,'ROLE_USER');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_db`
--

DROP TABLE IF EXISTS `users_db`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_db` (
                            `id` bigint NOT NULL AUTO_INCREMENT,
                            `age` tinyint NOT NULL,
                            `email` varchar(100) NOT NULL,
                            `login` varchar(20) NOT NULL,
                            `name` varchar(50) NOT NULL,
                            `password` varchar(100) NOT NULL,
                            `surname` varchar(50) NOT NULL,
                            PRIMARY KEY (`id`),
                            UNIQUE KEY `UK_gxdtgt0w5ksleaucy6u8qmyx1` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_db`
--

LOCK TABLES `users_db` WRITE;
/*!40000 ALTER TABLE `users_db` DISABLE KEYS */;
INSERT INTO `users_db` VALUES (1,22,'admin@users.com','admin','admin_firstname','$2a$10$jfYiBXPYpgxOoVeVEmx1yOlk0J6KdBcIRc8uhRVmawj3GfqxdGR.K','admin_secondname'),(2,30,'user@users.com','user','user_firstname','$2a$10$wrFlFZC0LVDHb7en.FFsEeCMxuVAX/NGuosVdZaRhoUwiFbgM2S6u','user_secondname'),(4,45,'user16@user.com','user16','user16_firstname','$2a$10$gKbk/4bDkRP8AKCU8kGu7.BDSYdZi/RQRDDsBbAnYinXo/whJbp6.','user16_secondname'),(8,54,'user11@users.com','user11','user11_firstname','$2a$10$9TVa4WEEg249.qlpGkMqT.inYIljmC9OcrfqnkzLF5hazza9eVK.6','user11_secondname');
/*!40000 ALTER TABLE `users_db` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_roles` (
                               `id` bigint NOT NULL,
                               `role_id` bigint NOT NULL,
                               PRIMARY KEY (`id`,`role_id`),
                               KEY `FKj6m8fwv7oqv74fcehir1a9ffy` (`role_id`),
                               CONSTRAINT `FKj6m8fwv7oqv74fcehir1a9ffy` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
                               CONSTRAINT `FKr431fmox9riiuhbwuviq8cbar` FOREIGN KEY (`id`) REFERENCES `users_db` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_roles`
--

LOCK TABLES `users_roles` WRITE;
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
INSERT INTO `users_roles` VALUES (2,1),(4,1),(8,1),(1,2),(8,2);
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-02 16:02:23
