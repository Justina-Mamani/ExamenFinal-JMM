CREATE DATABASE  IF NOT EXISTS `foody` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `foody`;
-- MySQL dump 10.13  Distrib 8.0.19, for macos10.15 (x86_64)
--
-- Host: localhost    Database: foody
-- ------------------------------------------------------
-- Server version	5.7.18

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
  `customer_id` int(255) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email_id` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone_no` varchar(10) NOT NULL,
  `state` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `landmark` varchar(255) NOT NULL,
  `pincode` int(6) NOT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `email_id` (`email_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'mark','berg','berg11@gmail.com','12345','9111111111','karnataka','mangalore','state bank',574154),(2,'winston','dsouza','winstonds12@gmail.com','123456','9764316497','karnataka','mangalore','urva store',574154),(3,'Sheldon','Sam','sam12@gmail.com','2345','9888888856','karnataka','mangalore','urva store',574154),(4,'kishore','kumar','kumar45@gmail.com','12345','9865326598','karnataka','Bangalore','hsr layout',50004),(5,'bob','sin','bob14@gmail.com','45698','9081649731','karnataka','bangalore','bda complex hbr layout',560102),(6,'meril','dsouza','meril11@gmail.com','123456','9632895563','karnataka','bangalore','vijayanagar vijaya bank layout',560040),(7,'max','dsouza','max12@gmail.com','123456','9741628856','karnataka','mangalore','urva store',574154),(8,'maxton','mosses','mos12@gmail.com','123','9741628856','karnataka','bangalore','city centre mall mg road',574154),(9,'Feona','Melisa','melisa@gmail.com','123','9101928856','karnataka','mangalore','near state bank circle',574154);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `menu_id` int(255) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(255) NOT NULL,
  `price` int(20) NOT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'American Pizza',350),(2,'Veg Pizza',250),(3,'Chicken Pizza',400),(4,'Pepperroni Pizza',450),(5,'Veg Burger',50),(6,'Chicken Burger',80),(7,'Power Burger',300),(8,'Sandwich Burger',180),(9,'Gulab Jamun',200),(10,'Chocholate Moose',250),(11,'Naugat Moose',300),(12,'Belgium Waffle',150);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int(255) NOT NULL AUTO_INCREMENT,
  `customer_id` int(255) NOT NULL,
  `menu_id` int(255) NOT NULL,
  `quantity` int(255) NOT NULL DEFAULT '1',
  `order_status` enum('ADDED_TO_CART','CONFIRMED','PAYMENT_CONFIRMED','DELIVERED') DEFAULT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`customer_id`),
  KEY `menu_id` (`menu_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (138,2,8,2,'DELIVERED','2018-11-06 12:58:42'),(139,2,4,2,'DELIVERED','2018-11-06 12:58:37'),(140,2,2,2,'DELIVERED','2018-11-06 12:58:53'),(141,2,1,2,'DELIVERED','2018-11-06 12:58:47'),(143,2,1,1,'DELIVERED','2018-11-07 04:21:26'),(146,2,12,1,'DELIVERED','2018-11-07 05:43:38'),(147,2,11,1,'DELIVERED','2018-11-07 05:43:42'),(148,2,1,1,'DELIVERED','2018-11-07 14:12:03'),(149,2,8,2,'DELIVERED','2018-11-12 09:55:38'),(150,2,7,2,'DELIVERED','2018-11-10 15:28:08'),(151,2,9,2,'PAYMENT_CONFIRMED','2018-11-11 04:36:31'),(152,2,10,1,'PAYMENT_CONFIRMED','2018-11-11 04:36:31'),(153,2,1,2,'DELIVERED','2018-11-12 09:55:47'),(156,2,6,2,'DELIVERED','2018-11-12 04:31:09'),(159,9,1,1,'ADDED_TO_CART','2018-11-11 07:59:28'),(160,2,1,2,'DELIVERED','2018-11-12 04:16:04'),(162,2,1,2,'PAYMENT_CONFIRMED','2018-11-12 09:54:04'),(165,2,1,1,'DELIVERED','2018-11-12 10:58:53');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `order_id` int(255) NOT NULL,
  `payment_type` enum('CASH_ON_DELIVERY','ONLINE_PAYMENT') NOT NULL DEFAULT 'CASH_ON_DELIVERY',
  `payment_status` enum('NOT_CONFIRMED','CONFIRMED') NOT NULL DEFAULT 'NOT_CONFIRMED',
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (209,138,'CASH_ON_DELIVERY','CONFIRMED','2018-11-06 12:53:56'),(210,139,'CASH_ON_DELIVERY','CONFIRMED','2018-11-06 12:53:56'),(212,140,'ONLINE_PAYMENT','CONFIRMED','2018-11-06 12:57:37'),(213,141,'ONLINE_PAYMENT','CONFIRMED','2018-11-06 12:57:37'),(215,143,'CASH_ON_DELIVERY','CONFIRMED','2018-11-06 17:43:49'),(216,146,'ONLINE_PAYMENT','CONFIRMED','2018-11-07 04:20:01'),(217,147,'ONLINE_PAYMENT','CONFIRMED','2018-11-07 04:20:01'),(219,148,'CASH_ON_DELIVERY','CONFIRMED','2018-11-07 05:44:28'),(220,149,'CASH_ON_DELIVERY','CONFIRMED','2018-11-09 07:54:10'),(221,150,'CASH_ON_DELIVERY','CONFIRMED','2018-11-09 07:54:10'),(223,151,'CASH_ON_DELIVERY','CONFIRMED','2018-11-11 04:36:31'),(224,152,'CASH_ON_DELIVERY','CONFIRMED','2018-11-11 04:36:31'),(225,153,'CASH_ON_DELIVERY','CONFIRMED','2018-11-11 04:36:31'),(237,156,'CASH_ON_DELIVERY','CONFIRMED','2018-11-11 06:29:11'),(238,160,'CASH_ON_DELIVERY','CONFIRMED','2018-11-12 04:15:10'),(239,162,'ONLINE_PAYMENT','CONFIRMED','2018-11-12 09:54:04'),(240,165,'ONLINE_PAYMENT','CONFIRMED','2018-11-12 10:57:53');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_details`
--

DROP TABLE IF EXISTS `payment_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_details` (
  `payment_id` int(255) NOT NULL AUTO_INCREMENT,
  `customer_id` int(255) NOT NULL,
  `card_number` varchar(16) NOT NULL,
  `card_holder_name` varchar(255) NOT NULL,
  `cvv` int(3) NOT NULL,
  `exp_month` int(2) NOT NULL,
  `exp_year` int(4) NOT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`payment_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `payment_details_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_details`
--

LOCK TABLES `payment_details` WRITE;
/*!40000 ALTER TABLE `payment_details` DISABLE KEYS */;
INSERT INTO `payment_details` VALUES (8,2,'1234123412341234','winston',123,10,25,'2018-11-04 04:21:29'),(9,2,'1234123412341234','winston',123,12,34,'2018-11-06 09:21:19'),(10,2,'1234123412341234','winston',123,3,19,'2018-11-06 12:57:36'),(11,2,'1234123412341234','winston',122,12,22,'2018-11-07 04:20:01'),(12,2,'1234123412341234','winston',123,12,22,'2018-11-12 09:54:04'),(13,2,'1234123412341234','wins',123,12,22,'2018-11-12 10:57:53');
/*!40000 ALTER TABLE `payment_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant` (
  `restaurant_id` int(255) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `designation` enum('EMPLOYEE','ADMIN') NOT NULL DEFAULT 'EMPLOYEE',
  PRIMARY KEY (`restaurant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1010 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES (101,'123456','Winston','Dsouza','ADMIN'),(1001,'1234','Sham','ram','EMPLOYEE'),(1005,'12345','Mahesh','Kanth','EMPLOYEE'),(1009,'1234','kiran','nath','EMPLOYEE');
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-23 15:24:34