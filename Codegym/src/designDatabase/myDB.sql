-- MySQL dump 10.13  Distrib 5.7.23, for Linux (x86_64)
--
-- Host: localhost    Database: my_database
-- ------------------------------------------------------
-- Server version	5.7.23-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Customers`
--

DROP TABLE IF EXISTS `Customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Customers` (
  `customer_number` int(11) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(50) NOT NULL,
  `customer_last_name` varchar(50) NOT NULL,
  `customer_frist_name` varchar(50) NOT NULL,
  `address_line1` varchar(45) NOT NULL,
  `address_line2` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `state` varchar(15) NOT NULL,
  `country` varchar(45) NOT NULL,
  `credit_limit` float DEFAULT NULL,
  PRIMARY KEY (`customer_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customers`
--

LOCK TABLES `Customers` WRITE;
/*!40000 ALTER TABLE `Customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `Customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employees`
--

DROP TABLE IF EXISTS `Employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Employees` (
  `employee_id` int(11) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `frist_name` varchar(45) NOT NULL,
  `email` varchar(100) NOT NULL,
  `job_title` varchar(45) NOT NULL,
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employees`
--

LOCK TABLES `Employees` WRITE;
/*!40000 ALTER TABLE `Employees` DISABLE KEYS */;
/*!40000 ALTER TABLE `Employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Offices`
--

DROP TABLE IF EXISTS `Offices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Offices` (
  `office_id` int(11) NOT NULL,
  `city` varchar(45) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `address_line1` varchar(45) NOT NULL,
  `address_line2` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `postal_code` varchar(15) NOT NULL,
  PRIMARY KEY (`office_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Offices`
--

LOCK TABLES `Offices` WRITE;
/*!40000 ALTER TABLE `Offices` DISABLE KEYS */;
/*!40000 ALTER TABLE `Offices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Order details`
--

DROP TABLE IF EXISTS `Order details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Order details` (
  `order_number` varchar(45) NOT NULL,
  `product_code` varchar(45) NOT NULL,
  `quantity_ordered` varchar(45) NOT NULL,
  `price_each` int(11) NOT NULL,
  `order_line_number` varchar(45) NOT NULL,
  PRIMARY KEY (`order_number`,`product_code`),
  KEY `productCode_idx` (`product_code`),
  CONSTRAINT `orderNumber` FOREIGN KEY (`order_number`) REFERENCES `Orders` (`order_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `productCode` FOREIGN KEY (`product_code`) REFERENCES `Products` (`product_code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order details`
--

LOCK TABLES `Order details` WRITE;
/*!40000 ALTER TABLE `Order details` DISABLE KEYS */;
/*!40000 ALTER TABLE `Order details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Orders` (
  `order_id` varchar(45) NOT NULL,
  `order_date` date NOT NULL,
  `required_date` date NOT NULL,
  `shipped_date` date NOT NULL,
  `status` varchar(15) NOT NULL,
  `comment` varchar(100) DEFAULT NULL,
  `price_each` int(11) NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Payments`
--

DROP TABLE IF EXISTS `Payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Payments` (
  `customer_number` int(11) NOT NULL,
  `check_number` varchar(50) NOT NULL,
  `payment_date` date NOT NULL,
  `amount` float NOT NULL,
  PRIMARY KEY (`check_number`),
  KEY `customerNumber_idx` (`customer_number`),
  CONSTRAINT `customerNumber` FOREIGN KEY (`customer_number`) REFERENCES `Customers` (`customer_number`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Payments`
--

LOCK TABLES `Payments` WRITE;
/*!40000 ALTER TABLE `Payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `Payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Products`
--

DROP TABLE IF EXISTS `Products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Products` (
  `product_code` varchar(15) NOT NULL,
  `product_name` varchar(45) NOT NULL,
  `product_scale` varchar(45) NOT NULL,
  `product_vendor` varchar(45) NOT NULL,
  `product_description` varchar(45) NOT NULL,
  `quantity_in_stock` varchar(45) NOT NULL,
  `MSRP` float NOT NULL,
  PRIMARY KEY (`product_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Products`
--

LOCK TABLES `Products` WRITE;
/*!40000 ALTER TABLE `Products` DISABLE KEYS */;
/*!40000 ALTER TABLE `Products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductsLine`
--

DROP TABLE IF EXISTS `ProductsLine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProductsLine` (
  `product_line` varchar(50) NOT NULL,
  `Description` varchar(45) DEFAULT NULL,
  `Image` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`product_line`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductsLine`
--

LOCK TABLES `ProductsLine` WRITE;
/*!40000 ALTER TABLE `ProductsLine` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProductsLine` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-16 22:18:04
