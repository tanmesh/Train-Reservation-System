-- MySQL dump 10.13  Distrib 5.7.20, for osx10.11 (x86_64)
--
-- Host: localhost    Database: railwaySystem
-- ------------------------------------------------------
-- Server version	5.7.20

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
-- Table structure for table `route`
--

DROP TABLE IF EXISTS `route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `route` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `train_id` int(10) NOT NULL,
  `start_station_id` int(10) NOT NULL,
  `end_station_id` int(10) NOT NULL,
  `departure_time` time NOT NULL,
  `duration` time NOT NULL,
  `fare` double(10,3) NOT NULL,
  `stops_no` int(20) DEFAULT NULL,
  `distance` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `train_id` (`train_id`),
  KEY `start_station_id` (`start_station_id`),
  KEY `end_station_id` (`end_station_id`),
  CONSTRAINT `route_ibfk_1` FOREIGN KEY (`train_id`) REFERENCES `train` (`id`),
  CONSTRAINT `route_ibfk_2` FOREIGN KEY (`start_station_id`) REFERENCES `station` (`id`),
  CONSTRAINT `route_ibfk_3` FOREIGN KEY (`end_station_id`) REFERENCES `station` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route`
--

LOCK TABLES `route` WRITE;
/*!40000 ALTER TABLE `route` DISABLE KEYS */;
INSERT INTO `route` VALUES (1,1,1,2,'05:30:00','02:50:00',140.000,20,139),(2,2,1,2,'05:30:00','02:50:00',140.000,29,139),(3,3,1,3,'07:20:00','08:35:00',315.000,39,500),(4,4,1,3,'20:30:00','10:30:00',315.000,23,500),(5,5,3,2,'06:00:00','04:00:00',1000.000,4,392),(6,6,3,2,'21:35:00','04:50:00',150.000,13,392),(7,7,2,8,'13:00:00','13:00:00',385.000,43,667),(10,7,2,9,'13:00:00','41:15:00',800.000,42,2348),(11,8,2,10,'20:45:00','19:10:00',455.000,34,962),(12,9,5,7,'06:20:00','06:00:00',210.000,28,324),(13,10,1,4,'20:10:00','39:42:00',800.000,31,2319),(14,11,7,6,'00:35:00','27:10:00',620.000,13,1496);
/*!40000 ALTER TABLE `route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `station`
--

DROP TABLE IF EXISTS `station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `station` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `city` varchar(10) NOT NULL,
  `state` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `station`
--

LOCK TABLES `station` WRITE;
/*!40000 ALTER TABLE `station` DISABLE KEYS */;
INSERT INTO `station` VALUES (1,'MYS','Mysore','Karnataka'),(2,'SBC','Banglore','Karnataka'),(3,'MAS','Chennai','Tamil Nadu'),(4,'GWL','Gwalior','Madhya Pradesh'),(5,'LKO','Lucknow','Uttar Pradesh'),(6,'BCT','Mumbai','Maharastra'),(7,'BSB','Varnasi','Uttar Pradesh'),(8,'HYB','Hyderabad','Telangana'),(9,'JP','Jaipur','Rajasthan'),(10,'PUNE','Pune','Maharastra');
/*!40000 ALTER TABLE `station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket` (
  `PNR` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `route_id` int(10) NOT NULL,
  `date_of_jouney` date NOT NULL,
  PRIMARY KEY (`PNR`),
  KEY `user_id` (`user_id`),
  KEY `route_id` (`route_id`),
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`route_id`) REFERENCES `route` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (1,1,1,'2018-05-14'),(2,1,2,'2018-05-15'),(3,2,2,'2019-03-17'),(4,1,2,'3019-03-17');
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `train`
--

DROP TABLE IF EXISTS `train`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `train` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `model_no` varchar(10) NOT NULL,
  `no_of_compartment` int(10) NOT NULL,
  `sleeper_class` tinyint(1) NOT NULL,
  `ac1_class` tinyint(1) NOT NULL,
  `ac2_class` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `train`
--

LOCK TABLES `train` WRITE;
/*!40000 ALTER TABLE `train` DISABLE KEYS */;
INSERT INTO `train` VALUES (1,'Banglore Exp','16518',10,1,1,1),(2,'Banglore Exp','16524',10,1,1,1),(3,'Bagmati Exp','12578',10,1,1,1),(4,'Kaveri Exp','16021',10,1,1,0),(5,'Satabdi','12007',10,1,1,1),(6,'Lalbagh Exp','12608',10,1,0,0),(7,'Jaipur Exp','12975',12,1,1,1),(8,'Udyan Exp','11302',12,1,1,1),(9,'KOTA PNBE EXP','13238',12,1,1,1),(10,'Swarna Jayanhi','12781',12,1,1,1),(11,'LTT BSB SUP EXP','12167',12,1,1,1);
/*!40000 ALTER TABLE `train` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(10) NOT NULL,
  `email_id` varchar(40) DEFAULT NULL,
  `phone_no` varchar(20) NOT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `dob` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Tanmesh','Mishra','tanmeshnm@gmail.com','9686029281','Male','1997-02-22'),(2,'Sushant','Srivastava','sushantsrivastava198@ gmail.com','9008019183','Male','1997-09-01'),(3,'Tanmoy','Debnath','debnathtanmoy59@gmail.com','7019774571','Male','1997-09-04'),(4,'Vijayalakshmi','R.A.','vijayalakshmirevur@gmail.com','9986137570','Female','1997-09-07'),(5,'Vinay','Katare','vinaykatare123@gmail.com','9907425135','Male','1997-01-04'),(6,'Kundan','Gowswami','kundan@gmail.com','7975461361','Male','1997-02-09'),(7,'Shashank','Wagle','shashankwagle@gmail.com','8660548858','Male','1997-03-23');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-20  0:07:24
