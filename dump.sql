-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sbox
-- ------------------------------------------------------
-- Server version	5.7.17

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
-- Table structure for table `configuration`
--

DROP TABLE IF EXISTS `configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuration` (
  `config_id` int(11) NOT NULL AUTO_INCREMENT,
  `config_name` varchar(45) NOT NULL,
  `effects` varchar(5000) NOT NULL,
  `sensors` varchar(5000) NOT NULL,
  `device` varchar(5000) NOT NULL,
  `gauges` varchar(5000) NOT NULL,
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuration`
--

LOCK TABLES `configuration` WRITE;
/*!40000 ALTER TABLE `configuration` DISABLE KEYS */;
INSERT INTO `configuration` VALUES (1,'theFirst','[ {\r\n  \"bar_id\" : 1,\r\n  \"bar_label\" : \"План\",\r\n  \"bar_color\" : \"255, 99, 132\",\r\n  \"bar_type\" : \"Plan\",\r\n  \"sensor_id\" : 0,\r\n  \"sort_order\" : 1,\r\n  \"hours\" : 0\r\n}, {\r\n  \"bar_id\" : 2,\r\n  \"bar_label\" : \"Время включения\",\r\n  \"bar_color\" : \"54, 162, 235\",\r\n  \"bar_type\" : \"SensorOn\",\r\n  \"sensor_id\" : 1,\r\n  \"sort_order\" : 2,\r\n  \"hours\" : 0\r\n}, {\r\n  \"bar_id\" : 3,\r\n  \"bar_label\" : \"Время работы\",\r\n  \"bar_color\" : \"255, 206, 86\",\r\n  \"bar_type\" : \"SensorOn\",\r\n  \"sensor_id\" : 3,\r\n  \"sort_order\" : 3,\r\n  \"hours\" : 0\r\n}, {\r\n  \"bar_id\" : 4,\r\n  \"bar_label\" : \"Свет\",\r\n  \"bar_color\" : \"75, 192, 192\",\r\n  \"bar_type\" : \"SensorOn\",\r\n  \"sensor_id\" : 2,\r\n  \"sort_order\" : 4,\r\n  \"hours\" : 0\r\n}, {\r\n  \"bar_id\" : 5,\r\n  \"bar_label\" : \"Завеса\",\r\n  \"bar_color\" : \"153, 102, 255\",\r\n  \"bar_type\" : \"SensorOn\",\r\n  \"sensor_id\" : 4,\r\n  \"sort_order\" : 5,\r\n  \"hours\" : 0\r\n}, {\r\n  \"bar_id\" : 6,\r\n  \"bar_label\" : \"Вентиляция\",\r\n  \"bar_color\" : \"255, 159, 64\",\r\n  \"bar_type\" : \"SensorOn\",\r\n  \"sensor_id\" : 3,\r\n  \"sort_order\" : 6,\r\n  \"hours\" : 0\r\n}, {\r\n  \"bar_id\" : 7,\r\n  \"bar_label\" : \"Нет Завеса – насос\",\r\n  \"bar_color\" : \"75, 192, 12\",\r\n  \"bar_type\" : \"SensorOff\",\r\n  \"sensor_id\" : 4,\r\n  \"sort_order\" : 7,\r\n  \"hours\" : 0\r\n}, {\r\n  \"bar_id\" : 13,\r\n  \"bar_label\" : \"ЧЧЧ\",\r\n  \"bar_color\" : \"255, 99, 132\",\r\n  \"bar_type\" : \"SensorOn\",\r\n  \"sensor_id\" : 4,\r\n  \"sort_order\" : 1,\r\n  \"hours\" : 0\r\n} ]','[ {\r\n  \"sensor_id\" : 1,\r\n  \"sensor_name\" : \"Общее питание\",\r\n  \"sensor_type\" : false,\r\n  \"sensor_hide\" : false\r\n}, {\r\n  \"sensor_id\" : 2,\r\n  \"sensor_name\" : \"Циркуляция нагрева\",\r\n  \"sensor_type\" : false,\r\n  \"sensor_hide\" : false\r\n}, {\r\n  \"sensor_id\" : 3,\r\n  \"sensor_name\" : \"Тены\",\r\n  \"sensor_type\" : false,\r\n  \"sensor_hide\" : false\r\n}, {\r\n  \"sensor_id\" : 4,\r\n  \"sensor_name\" : \"Гидростанция\",\r\n  \"sensor_type\" : false,\r\n  \"sensor_hide\" : false\r\n}, {\r\n  \"sensor_id\" : 5,\r\n  \"sensor_name\" : \"Давление набрано\",\r\n  \"sensor_type\" : false,\r\n  \"sensor_hide\" : false\r\n}, {\r\n  \"sensor_id\" : 6,\r\n  \"sensor_name\" : \"Свободный вход\",\r\n  \"sensor_type\" : false,\r\n  \"sensor_hide\" : true\r\n} ]','{\r\n  \"device_id\" : 1,\r\n  \"device_name\" : \"Покрасочная камера\",\r\n  \"device_shifts\" : 1.0\r\n}','[ {\r\n  \"gauge_id\" : 2,\r\n  \"gauge_label\" : \"Показатель\",\r\n  \"gauge_unit\" : \"часы\",\r\n  \"sort_order\" : 1,\r\n  \"limit_value\" : 1000,\r\n  \"init_value\" : 10,\r\n  \"start_green\" : 120,\r\n  \"start_yellow\" : 20,\r\n  \"start_red\" : 500,\r\n  \"sensor_id\" : 1,\r\n  \"init_date\" : \"26.04.2017\",\r\n  \"mileage_date\" : \"26.08.2017\",\r\n  \"value\" : 0,\r\n  \"mileage_value\" : 0\r\n}, {\r\n  \"gauge_id\" : 3,\r\n  \"gauge_label\" : \"Сервис\",\r\n  \"gauge_unit\" : \"Часы\",\r\n  \"sort_order\" : 2,\r\n  \"limit_value\" : 500,\r\n  \"init_value\" : 10,\r\n  \"start_green\" : 100,\r\n  \"start_yellow\" : 20,\r\n  \"start_red\" : 300,\r\n  \"sensor_id\" : 1,\r\n  \"init_date\" : \"01.06.2017\",\r\n  \"mileage_date\" : \"26.08.2017\",\r\n  \"value\" : 0,\r\n  \"mileage_value\" : 0\r\n} ]');
/*!40000 ALTER TABLE `configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `decdata`
--

DROP TABLE IF EXISTS `decdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `decdata` (
  `dec_id` int(11) NOT NULL AUTO_INCREMENT,
  `sensor_id` tinyint(4) NOT NULL,
  `dec_date` datetime NOT NULL,
  `dec_value` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`dec_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `decdata`
--

LOCK TABLES `decdata` WRITE;
/*!40000 ALTER TABLE `decdata` DISABLE KEYS */;
INSERT INTO `decdata` VALUES (1,4,'2017-04-03 02:07:17',26.18),(2,6,'2016-04-29 19:19:49',92.82),(3,2,'2017-09-02 14:57:03',87.65),(4,1,'2017-08-11 00:31:21',82.54),(5,6,'2017-03-23 06:05:30',95.23),(6,2,'2017-06-13 20:20:56',76.22),(7,2,'2016-08-23 11:44:04',28.94),(8,5,'2018-03-07 19:27:45',85.16),(9,3,'2016-08-28 17:59:37',55.50),(10,4,'2018-03-19 07:38:24',3.32),(11,5,'2018-01-17 12:20:43',71.73),(12,4,'2017-01-13 11:05:46',57.26),(13,2,'2017-03-24 13:18:33',87.56),(14,3,'2016-12-30 05:19:24',8.46),(15,6,'2017-05-05 21:36:50',99.92),(16,2,'2016-05-31 11:17:23',76.41),(17,1,'2016-10-14 18:05:57',87.62),(18,6,'2016-09-14 15:31:21',18.48),(19,4,'2016-11-17 16:41:45',51.86),(20,4,'2016-11-18 15:47:10',13.03),(21,4,'2016-05-28 01:21:00',95.43),(22,6,'2018-04-10 03:24:49',28.36),(23,1,'2018-03-12 03:44:33',31.25),(24,4,'2017-07-06 03:21:43',28.58),(25,3,'2016-12-08 10:27:50',47.47),(26,2,'2017-10-31 02:11:34',80.34),(27,4,'2016-06-07 20:33:03',49.70),(28,4,'2017-09-15 21:19:06',63.60),(29,4,'2016-07-20 21:43:44',68.20),(30,2,'2017-07-14 04:39:53',33.25),(31,4,'2016-08-02 12:20:47',35.72),(32,4,'2016-06-09 14:22:22',11.75),(33,4,'2018-02-03 13:13:36',65.45),(34,5,'2016-12-21 03:08:37',96.22),(35,6,'2017-12-10 00:52:58',10.98),(36,3,'2016-06-04 02:22:38',14.65),(37,6,'2017-07-03 18:46:06',93.41),(38,4,'2018-01-19 15:55:25',43.85),(39,6,'2016-05-17 07:40:14',42.90),(40,4,'2017-06-24 14:50:57',28.74),(41,5,'2017-04-25 10:15:01',99.22),(42,3,'2016-10-01 03:23:31',84.46),(43,2,'2017-11-07 19:53:56',27.37),(44,5,'2016-10-12 07:47:50',56.10),(45,2,'2017-04-26 10:12:46',7.22),(46,5,'2018-02-26 06:01:14',74.80),(47,3,'2018-01-15 10:07:15',74.60),(48,2,'2016-12-06 21:15:09',37.48),(49,2,'2017-10-25 06:24:36',30.72),(50,4,'2017-11-03 18:13:42',72.46),(51,1,'2017-06-08 21:00:42',0.87),(52,3,'2016-08-18 20:54:47',44.07),(53,1,'2017-02-20 23:44:51',97.09),(54,3,'2017-09-10 08:20:24',43.97),(55,5,'2017-06-11 02:50:27',57.46),(56,5,'2017-06-14 22:13:53',65.84),(57,2,'2018-02-01 10:05:41',71.62),(58,6,'2017-07-01 02:30:29',32.97),(59,4,'2017-07-02 23:03:01',37.60),(60,4,'2017-12-23 21:04:04',51.07),(61,5,'2017-02-10 07:14:59',32.73),(62,4,'2018-04-11 09:05:58',12.45),(63,3,'2016-12-09 00:08:52',53.16),(64,2,'2017-12-18 12:32:06',76.81),(65,5,'2016-11-11 11:30:42',75.46),(66,1,'2016-08-07 07:01:37',98.19),(67,4,'2017-08-13 04:36:41',18.71),(68,5,'2017-12-15 05:33:06',87.17),(69,4,'2016-06-03 13:35:00',80.54),(70,1,'2018-03-18 08:33:27',59.86),(71,1,'2017-09-23 04:29:13',20.92),(72,5,'2017-08-28 21:33:09',91.05),(73,6,'2018-04-07 08:45:40',43.07),(74,2,'2016-09-20 01:08:16',9.52),(75,1,'2017-11-13 21:21:16',23.68),(76,5,'2017-10-30 09:18:52',88.98),(77,1,'2016-09-24 23:52:19',71.68),(78,6,'2016-05-23 02:40:18',90.79),(79,4,'2018-02-18 07:31:07',22.29),(80,3,'2016-07-05 16:49:51',53.62),(81,6,'2018-04-05 15:30:51',92.63),(82,6,'2017-02-01 17:34:50',90.62),(83,1,'2018-04-01 17:55:58',39.67),(84,3,'2017-02-13 20:04:45',86.91),(85,5,'2017-04-16 04:13:50',70.46),(86,3,'2017-09-22 07:13:57',78.80),(87,1,'2016-05-16 23:56:23',25.11),(88,6,'2017-03-26 17:47:58',68.21),(89,5,'2017-10-16 10:21:25',1.01),(90,5,'2018-02-09 08:32:29',55.30),(91,2,'2016-12-02 04:22:38',81.44),(92,6,'2016-04-16 15:00:29',52.25),(93,5,'2018-03-04 00:40:49',52.79),(94,6,'2017-05-20 07:12:58',77.49),(95,4,'2018-03-10 02:10:02',1.76),(96,6,'2016-10-04 19:06:33',21.10),(97,5,'2017-04-01 09:13:43',52.79),(98,3,'2016-05-19 06:53:12',74.67),(99,2,'2017-12-01 14:34:05',27.44),(100,2,'2016-06-15 12:24:10',13.42);
/*!40000 ALTER TABLE `decdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device`
--

DROP TABLE IF EXISTS `device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device` (
  `device_id` int(11) NOT NULL,
  `device_name` varchar(100) NOT NULL,
  `device_shifts` float unsigned NOT NULL,
  PRIMARY KEY (`device_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device`
--

LOCK TABLES `device` WRITE;
/*!40000 ALTER TABLE `device` DISABLE KEYS */;
INSERT INTO `device` VALUES (1,'Покрасочная камера',1);
/*!40000 ALTER TABLE `device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `effectsbar`
--

DROP TABLE IF EXISTS `effectsbar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `effectsbar` (
  `bar_id` int(11) NOT NULL AUTO_INCREMENT,
  `bar_label` varchar(100) NOT NULL,
  `bar_color` varchar(100) NOT NULL,
  `bar_type` enum('Plan','SensorOn','SensorOff') DEFAULT NULL,
  `sensor_id` tinyint(4) NOT NULL,
  `sort_order` tinyint(4) NOT NULL,
  PRIMARY KEY (`bar_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `effectsbar`
--

LOCK TABLES `effectsbar` WRITE;
/*!40000 ALTER TABLE `effectsbar` DISABLE KEYS */;
INSERT INTO `effectsbar` VALUES (1,'План','255, 99, 132','Plan',0,1),(2,'Время включения','54, 162, 235','SensorOn',1,2),(3,'Время работы','255, 206, 86','SensorOn',1,3),(4,'Ц','255, 205, 255','SensorOn',2,4);
/*!40000 ALTER TABLE `effectsbar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `int_data`
--

DROP TABLE IF EXISTS `int_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `int_data` (
  `int_id` int(11) NOT NULL AUTO_INCREMENT,
  `sensor_id` tinyint(4) NOT NULL,
  `prev_stop_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `start_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `stop_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `delta_date` int(11) NOT NULL DEFAULT '0',
  `complete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`int_id`),
  UNIQUE KEY `int_id_UNIQUE` (`int_id`),
  KEY `sensor_id_INDEX` (`sensor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `int_data`
--

LOCK TABLES `int_data` WRITE;
/*!40000 ALTER TABLE `int_data` DISABLE KEYS */;
INSERT INTO `int_data` VALUES (1,1,'2017-09-24 01:25:49','2017-09-24 01:25:49','2017-09-24 11:26:00',36011,1),(2,1,'2017-09-24 11:26:00','2017-09-24 11:26:02','2017-09-24 11:26:19',17,1),(3,1,'2017-09-24 11:26:19','2017-09-24 11:26:22','2017-09-24 11:26:29',7,1),(4,1,'2017-09-24 11:26:29','2017-09-24 11:26:29','2017-09-24 11:26:39',10,1),(5,1,'2017-09-24 11:26:39','2017-09-24 11:26:49','2017-09-24 11:26:59',10,1),(6,1,'2017-09-24 11:26:59','2017-09-24 11:27:09','2017-09-24 11:27:19',10,1),(7,1,'2017-09-24 11:27:19','2017-09-24 11:27:20','2017-09-24 11:27:30',10,1),(8,1,'2017-09-24 11:27:30','2017-09-24 11:27:40','2017-09-24 11:27:50',10,1),(9,1,'2017-09-24 11:27:50','2017-09-24 11:27:51','2017-09-24 11:28:00',9,1),(10,1,'2017-09-24 11:28:00','2017-09-24 11:28:10','2017-09-24 11:28:20',10,1),(11,1,'2017-09-24 11:28:20','2017-09-24 11:28:21','2017-09-24 11:28:40',19,1),(12,1,'2017-09-24 11:28:40','2017-09-24 11:28:41','2017-09-24 11:28:50',9,1),(13,1,'2017-09-24 11:28:50','2017-09-24 11:28:51','2017-09-24 11:28:59',8,1),(14,1,'2017-09-24 11:28:59','2017-09-24 11:29:21','2017-09-24 11:29:31',10,1),(15,1,'2017-09-24 11:29:31','2017-09-24 11:29:41','2017-09-24 11:29:41',0,0);
/*!40000 ALTER TABLE `int_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `role_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'admin'),(2,'user');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sensor`
--

DROP TABLE IF EXISTS `sensor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sensor` (
  `sensor_id` tinyint(4) NOT NULL,
  `sensor_name` varchar(100) NOT NULL,
  `sensor_type` tinyint(1) NOT NULL DEFAULT '0',
  `sensor_hide` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sensor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sensor`
--

LOCK TABLES `sensor` WRITE;
/*!40000 ALTER TABLE `sensor` DISABLE KEYS */;
INSERT INTO `sensor` VALUES (1,'Общее питание',0,0),(2,'Циркуляция нагрева',0,0),(3,'Тены',0,0),(4,'Гидростанция',0,0),(5,'Давление набрано',0,0),(6,'Свободный вход',0,1);
/*!40000 ALTER TABLE `sensor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicegauge`
--

DROP TABLE IF EXISTS `servicegauge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicegauge` (
  `gauge_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `gauge_label` varchar(30) NOT NULL,
  `gauge_unit` varchar(10) NOT NULL,
  `sort_order` tinyint(4) NOT NULL,
  `init_value` int(11) NOT NULL,
  `limit_value` int(11) NOT NULL,
  `start_green` int(11) NOT NULL,
  `start_yellow` int(11) NOT NULL,
  `start_red` int(11) NOT NULL,
  `sensor_id` tinyint(4) NOT NULL,
  `init_date` datetime NOT NULL,
  `mileage_date` datetime NOT NULL,
  PRIMARY KEY (`gauge_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicegauge`
--

LOCK TABLES `servicegauge` WRITE;
/*!40000 ALTER TABLE `servicegauge` DISABLE KEYS */;
INSERT INTO `servicegauge` VALUES (2,'Показатель','часы',1,10,1000,120,20,500,1,'2017-09-05 19:42:28','2017-08-26 00:00:00'),(3,'Сервис','Часы',2,10,500,100,20,300,1,'2017-09-05 19:44:50','2017-08-26 00:00:00');
/*!40000 ALTER TABLE `servicegauge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_dimension`
--

DROP TABLE IF EXISTS `time_dimension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_dimension` (
  `id` int(11) NOT NULL,
  `db_date` date NOT NULL,
  `year` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `day` int(11) NOT NULL,
  `quarter` int(11) NOT NULL,
  `week` int(11) NOT NULL,
  `day_name` varchar(9) NOT NULL,
  `month_name` varchar(9) NOT NULL,
  `holiday_flag` char(1) DEFAULT 'f',
  `weekend_flag` char(1) DEFAULT 'f',
  `event` varchar(50) DEFAULT NULL,
  `work_hours` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `td_ymd_idx` (`year`,`month`,`day`),
  UNIQUE KEY `td_dbdate_idx` (`db_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_dimension`
--

LOCK TABLES `time_dimension` WRITE;
/*!40000 ALTER TABLE `time_dimension` DISABLE KEYS */;
INSERT INTO `time_dimension` VALUES (20160101,'2016-01-01',2016,1,1,1,53,'Friday','January','f','f',NULL,8),(20160102,'2016-01-02',2016,1,2,1,53,'Saturday','January','f','t',NULL,0),(20160103,'2016-01-03',2016,1,3,1,53,'Sunday','January','f','t',NULL,0),(20160104,'2016-01-04',2016,1,4,1,1,'Monday','January','f','f',NULL,8),(20160105,'2016-01-05',2016,1,5,1,1,'Tuesday','January','f','f',NULL,8),(20160106,'2016-01-06',2016,1,6,1,1,'Wednesday','January','f','f',NULL,8),(20160107,'2016-01-07',2016,1,7,1,1,'Thursday','January','f','f',NULL,8),(20160108,'2016-01-08',2016,1,8,1,1,'Friday','January','f','f',NULL,8),(20160109,'2016-01-09',2016,1,9,1,1,'Saturday','January','f','t',NULL,0),(20160110,'2016-01-10',2016,1,10,1,1,'Sunday','January','f','t',NULL,0),(20160111,'2016-01-11',2016,1,11,1,2,'Monday','January','f','f',NULL,8),(20160112,'2016-01-12',2016,1,12,1,2,'Tuesday','January','f','f',NULL,8),(20160113,'2016-01-13',2016,1,13,1,2,'Wednesday','January','f','f',NULL,8),(20160114,'2016-01-14',2016,1,14,1,2,'Thursday','January','f','f',NULL,8),(20160115,'2016-01-15',2016,1,15,1,2,'Friday','January','f','f',NULL,8),(20160116,'2016-01-16',2016,1,16,1,2,'Saturday','January','f','t',NULL,0),(20160117,'2016-01-17',2016,1,17,1,2,'Sunday','January','f','t',NULL,0),(20160118,'2016-01-18',2016,1,18,1,3,'Monday','January','f','f',NULL,8),(20160119,'2016-01-19',2016,1,19,1,3,'Tuesday','January','f','f',NULL,8),(20160120,'2016-01-20',2016,1,20,1,3,'Wednesday','January','f','f',NULL,8),(20160121,'2016-01-21',2016,1,21,1,3,'Thursday','January','f','f',NULL,8),(20160122,'2016-01-22',2016,1,22,1,3,'Friday','January','f','f',NULL,8),(20160123,'2016-01-23',2016,1,23,1,3,'Saturday','January','f','t',NULL,0),(20160124,'2016-01-24',2016,1,24,1,3,'Sunday','January','f','t',NULL,0),(20160125,'2016-01-25',2016,1,25,1,4,'Monday','January','f','f',NULL,8),(20160126,'2016-01-26',2016,1,26,1,4,'Tuesday','January','f','f',NULL,8),(20160127,'2016-01-27',2016,1,27,1,4,'Wednesday','January','f','f',NULL,8),(20160128,'2016-01-28',2016,1,28,1,4,'Thursday','January','f','f',NULL,8),(20160129,'2016-01-29',2016,1,29,1,4,'Friday','January','f','f',NULL,8),(20160130,'2016-01-30',2016,1,30,1,4,'Saturday','January','f','t',NULL,0),(20160131,'2016-01-31',2016,1,31,1,4,'Sunday','January','f','t',NULL,0),(20160201,'2016-02-01',2016,2,1,1,5,'Monday','February','f','f',NULL,8),(20160202,'2016-02-02',2016,2,2,1,5,'Tuesday','February','f','f',NULL,8),(20160203,'2016-02-03',2016,2,3,1,5,'Wednesday','February','f','f',NULL,8),(20160204,'2016-02-04',2016,2,4,1,5,'Thursday','February','f','f',NULL,8),(20160205,'2016-02-05',2016,2,5,1,5,'Friday','February','f','f',NULL,8),(20160206,'2016-02-06',2016,2,6,1,5,'Saturday','February','f','t',NULL,0),(20160207,'2016-02-07',2016,2,7,1,5,'Sunday','February','f','t',NULL,0),(20160208,'2016-02-08',2016,2,8,1,6,'Monday','February','f','f',NULL,8),(20160209,'2016-02-09',2016,2,9,1,6,'Tuesday','February','f','f',NULL,8),(20160210,'2016-02-10',2016,2,10,1,6,'Wednesday','February','f','f',NULL,8),(20160211,'2016-02-11',2016,2,11,1,6,'Thursday','February','f','f',NULL,8),(20160212,'2016-02-12',2016,2,12,1,6,'Friday','February','f','f',NULL,8),(20160213,'2016-02-13',2016,2,13,1,6,'Saturday','February','f','t',NULL,0),(20160214,'2016-02-14',2016,2,14,1,6,'Sunday','February','f','t',NULL,0),(20160215,'2016-02-15',2016,2,15,1,7,'Monday','February','f','f',NULL,8),(20160216,'2016-02-16',2016,2,16,1,7,'Tuesday','February','f','f',NULL,8),(20160217,'2016-02-17',2016,2,17,1,7,'Wednesday','February','f','f',NULL,8),(20160218,'2016-02-18',2016,2,18,1,7,'Thursday','February','f','f',NULL,8),(20160219,'2016-02-19',2016,2,19,1,7,'Friday','February','f','f',NULL,8),(20160220,'2016-02-20',2016,2,20,1,7,'Saturday','February','f','t',NULL,0),(20160221,'2016-02-21',2016,2,21,1,7,'Sunday','February','f','t',NULL,0),(20160222,'2016-02-22',2016,2,22,1,8,'Monday','February','f','f',NULL,8),(20160223,'2016-02-23',2016,2,23,1,8,'Tuesday','February','f','f',NULL,8),(20160224,'2016-02-24',2016,2,24,1,8,'Wednesday','February','f','f',NULL,8),(20160225,'2016-02-25',2016,2,25,1,8,'Thursday','February','f','f',NULL,8),(20160226,'2016-02-26',2016,2,26,1,8,'Friday','February','f','f',NULL,8),(20160227,'2016-02-27',2016,2,27,1,8,'Saturday','February','f','t',NULL,0),(20160228,'2016-02-28',2016,2,28,1,8,'Sunday','February','f','t',NULL,0),(20160229,'2016-02-29',2016,2,29,1,9,'Monday','February','f','f',NULL,8),(20160301,'2016-03-01',2016,3,1,1,9,'Tuesday','March','f','f',NULL,8),(20160302,'2016-03-02',2016,3,2,1,9,'Wednesday','March','f','f',NULL,8),(20160303,'2016-03-03',2016,3,3,1,9,'Thursday','March','f','f',NULL,8),(20160304,'2016-03-04',2016,3,4,1,9,'Friday','March','f','f',NULL,8),(20160305,'2016-03-05',2016,3,5,1,9,'Saturday','March','f','t',NULL,0),(20160306,'2016-03-06',2016,3,6,1,9,'Sunday','March','f','t',NULL,0),(20160307,'2016-03-07',2016,3,7,1,10,'Monday','March','f','f',NULL,8),(20160308,'2016-03-08',2016,3,8,1,10,'Tuesday','March','f','f',NULL,8),(20160309,'2016-03-09',2016,3,9,1,10,'Wednesday','March','f','f',NULL,8),(20160310,'2016-03-10',2016,3,10,1,10,'Thursday','March','f','f',NULL,8),(20160311,'2016-03-11',2016,3,11,1,10,'Friday','March','f','f',NULL,8),(20160312,'2016-03-12',2016,3,12,1,10,'Saturday','March','f','t',NULL,0),(20160313,'2016-03-13',2016,3,13,1,10,'Sunday','March','f','t',NULL,0),(20160314,'2016-03-14',2016,3,14,1,11,'Monday','March','f','f',NULL,8),(20160315,'2016-03-15',2016,3,15,1,11,'Tuesday','March','f','f',NULL,8),(20160316,'2016-03-16',2016,3,16,1,11,'Wednesday','March','f','f',NULL,8),(20160317,'2016-03-17',2016,3,17,1,11,'Thursday','March','f','f',NULL,8),(20160318,'2016-03-18',2016,3,18,1,11,'Friday','March','f','f',NULL,8),(20160319,'2016-03-19',2016,3,19,1,11,'Saturday','March','f','t',NULL,0),(20160320,'2016-03-20',2016,3,20,1,11,'Sunday','March','f','t',NULL,0),(20160321,'2016-03-21',2016,3,21,1,12,'Monday','March','f','f',NULL,8),(20160322,'2016-03-22',2016,3,22,1,12,'Tuesday','March','f','f',NULL,8),(20160323,'2016-03-23',2016,3,23,1,12,'Wednesday','March','f','f',NULL,8),(20160324,'2016-03-24',2016,3,24,1,12,'Thursday','March','f','f',NULL,8),(20160325,'2016-03-25',2016,3,25,1,12,'Friday','March','f','f',NULL,8),(20160326,'2016-03-26',2016,3,26,1,12,'Saturday','March','f','t',NULL,0),(20160327,'2016-03-27',2016,3,27,1,12,'Sunday','March','f','t',NULL,0),(20160328,'2016-03-28',2016,3,28,1,13,'Monday','March','f','f',NULL,8),(20160329,'2016-03-29',2016,3,29,1,13,'Tuesday','March','f','f',NULL,8),(20160330,'2016-03-30',2016,3,30,1,13,'Wednesday','March','f','f',NULL,8),(20160331,'2016-03-31',2016,3,31,1,13,'Thursday','March','f','f',NULL,8),(20160401,'2016-04-01',2016,4,1,2,13,'Friday','April','f','f',NULL,8),(20160402,'2016-04-02',2016,4,2,2,13,'Saturday','April','f','t',NULL,0),(20160403,'2016-04-03',2016,4,3,2,13,'Sunday','April','f','t',NULL,0),(20160404,'2016-04-04',2016,4,4,2,14,'Monday','April','f','f',NULL,8),(20160405,'2016-04-05',2016,4,5,2,14,'Tuesday','April','f','f',NULL,8),(20160406,'2016-04-06',2016,4,6,2,14,'Wednesday','April','f','f',NULL,8),(20160407,'2016-04-07',2016,4,7,2,14,'Thursday','April','f','f',NULL,8),(20160408,'2016-04-08',2016,4,8,2,14,'Friday','April','f','f',NULL,8),(20160409,'2016-04-09',2016,4,9,2,14,'Saturday','April','f','t',NULL,0),(20160410,'2016-04-10',2016,4,10,2,14,'Sunday','April','f','t',NULL,0),(20160411,'2016-04-11',2016,4,11,2,15,'Monday','April','f','f',NULL,8),(20160412,'2016-04-12',2016,4,12,2,15,'Tuesday','April','f','f',NULL,8),(20160413,'2016-04-13',2016,4,13,2,15,'Wednesday','April','f','f',NULL,8),(20160414,'2016-04-14',2016,4,14,2,15,'Thursday','April','f','f',NULL,8),(20160415,'2016-04-15',2016,4,15,2,15,'Friday','April','f','f',NULL,8),(20160416,'2016-04-16',2016,4,16,2,15,'Saturday','April','f','t',NULL,0),(20160417,'2016-04-17',2016,4,17,2,15,'Sunday','April','f','t',NULL,0),(20160418,'2016-04-18',2016,4,18,2,16,'Monday','April','f','f',NULL,8),(20160419,'2016-04-19',2016,4,19,2,16,'Tuesday','April','f','f',NULL,8),(20160420,'2016-04-20',2016,4,20,2,16,'Wednesday','April','f','f',NULL,8),(20160421,'2016-04-21',2016,4,21,2,16,'Thursday','April','f','f',NULL,8),(20160422,'2016-04-22',2016,4,22,2,16,'Friday','April','f','f',NULL,8),(20160423,'2016-04-23',2016,4,23,2,16,'Saturday','April','f','t',NULL,0),(20160424,'2016-04-24',2016,4,24,2,16,'Sunday','April','f','t',NULL,0),(20160425,'2016-04-25',2016,4,25,2,17,'Monday','April','f','f',NULL,8),(20160426,'2016-04-26',2016,4,26,2,17,'Tuesday','April','f','f',NULL,8),(20160427,'2016-04-27',2016,4,27,2,17,'Wednesday','April','f','f',NULL,8),(20160428,'2016-04-28',2016,4,28,2,17,'Thursday','April','f','f',NULL,8),(20160429,'2016-04-29',2016,4,29,2,17,'Friday','April','f','f',NULL,8),(20160430,'2016-04-30',2016,4,30,2,17,'Saturday','April','f','t',NULL,0),(20160501,'2016-05-01',2016,5,1,2,17,'Sunday','May','f','t',NULL,0),(20160502,'2016-05-02',2016,5,2,2,18,'Monday','May','f','f',NULL,8),(20160503,'2016-05-03',2016,5,3,2,18,'Tuesday','May','f','f',NULL,8),(20160504,'2016-05-04',2016,5,4,2,18,'Wednesday','May','f','f',NULL,8),(20160505,'2016-05-05',2016,5,5,2,18,'Thursday','May','f','f',NULL,8),(20160506,'2016-05-06',2016,5,6,2,18,'Friday','May','f','f',NULL,8),(20160507,'2016-05-07',2016,5,7,2,18,'Saturday','May','f','t',NULL,0),(20160508,'2016-05-08',2016,5,8,2,18,'Sunday','May','f','t',NULL,0),(20160509,'2016-05-09',2016,5,9,2,19,'Monday','May','f','f',NULL,8),(20160510,'2016-05-10',2016,5,10,2,19,'Tuesday','May','f','f',NULL,8),(20160511,'2016-05-11',2016,5,11,2,19,'Wednesday','May','f','f',NULL,8),(20160512,'2016-05-12',2016,5,12,2,19,'Thursday','May','f','f',NULL,8),(20160513,'2016-05-13',2016,5,13,2,19,'Friday','May','f','f',NULL,8),(20160514,'2016-05-14',2016,5,14,2,19,'Saturday','May','f','t',NULL,0),(20160515,'2016-05-15',2016,5,15,2,19,'Sunday','May','f','t',NULL,0),(20160516,'2016-05-16',2016,5,16,2,20,'Monday','May','f','f',NULL,8),(20160517,'2016-05-17',2016,5,17,2,20,'Tuesday','May','f','f',NULL,8),(20160518,'2016-05-18',2016,5,18,2,20,'Wednesday','May','f','f',NULL,8),(20160519,'2016-05-19',2016,5,19,2,20,'Thursday','May','f','f',NULL,8),(20160520,'2016-05-20',2016,5,20,2,20,'Friday','May','f','f',NULL,8),(20160521,'2016-05-21',2016,5,21,2,20,'Saturday','May','f','t',NULL,0),(20160522,'2016-05-22',2016,5,22,2,20,'Sunday','May','f','t',NULL,0),(20160523,'2016-05-23',2016,5,23,2,21,'Monday','May','f','f',NULL,8),(20160524,'2016-05-24',2016,5,24,2,21,'Tuesday','May','f','f',NULL,8),(20160525,'2016-05-25',2016,5,25,2,21,'Wednesday','May','f','f',NULL,8),(20160526,'2016-05-26',2016,5,26,2,21,'Thursday','May','f','f',NULL,8),(20160527,'2016-05-27',2016,5,27,2,21,'Friday','May','f','f',NULL,8),(20160528,'2016-05-28',2016,5,28,2,21,'Saturday','May','f','t',NULL,0),(20160529,'2016-05-29',2016,5,29,2,21,'Sunday','May','f','t',NULL,0),(20160530,'2016-05-30',2016,5,30,2,22,'Monday','May','f','f',NULL,8),(20160531,'2016-05-31',2016,5,31,2,22,'Tuesday','May','f','f',NULL,8),(20160601,'2016-06-01',2016,6,1,2,22,'Wednesday','June','f','f',NULL,8),(20160602,'2016-06-02',2016,6,2,2,22,'Thursday','June','f','f',NULL,8),(20160603,'2016-06-03',2016,6,3,2,22,'Friday','June','f','f',NULL,8),(20160604,'2016-06-04',2016,6,4,2,22,'Saturday','June','f','t',NULL,0),(20160605,'2016-06-05',2016,6,5,2,22,'Sunday','June','f','t',NULL,0),(20160606,'2016-06-06',2016,6,6,2,23,'Monday','June','f','f',NULL,8),(20160607,'2016-06-07',2016,6,7,2,23,'Tuesday','June','f','f',NULL,8),(20160608,'2016-06-08',2016,6,8,2,23,'Wednesday','June','f','f',NULL,8),(20160609,'2016-06-09',2016,6,9,2,23,'Thursday','June','f','f',NULL,8),(20160610,'2016-06-10',2016,6,10,2,23,'Friday','June','f','f',NULL,8),(20160611,'2016-06-11',2016,6,11,2,23,'Saturday','June','f','t',NULL,0),(20160612,'2016-06-12',2016,6,12,2,23,'Sunday','June','f','t',NULL,0),(20160613,'2016-06-13',2016,6,13,2,24,'Monday','June','f','f',NULL,8),(20160614,'2016-06-14',2016,6,14,2,24,'Tuesday','June','f','f',NULL,8),(20160615,'2016-06-15',2016,6,15,2,24,'Wednesday','June','f','f',NULL,8),(20160616,'2016-06-16',2016,6,16,2,24,'Thursday','June','f','f',NULL,8),(20160617,'2016-06-17',2016,6,17,2,24,'Friday','June','f','f',NULL,8),(20160618,'2016-06-18',2016,6,18,2,24,'Saturday','June','f','t',NULL,0),(20160619,'2016-06-19',2016,6,19,2,24,'Sunday','June','f','t',NULL,0),(20160620,'2016-06-20',2016,6,20,2,25,'Monday','June','f','f',NULL,8),(20160621,'2016-06-21',2016,6,21,2,25,'Tuesday','June','f','f',NULL,8),(20160622,'2016-06-22',2016,6,22,2,25,'Wednesday','June','f','f',NULL,8),(20160623,'2016-06-23',2016,6,23,2,25,'Thursday','June','f','f',NULL,8),(20160624,'2016-06-24',2016,6,24,2,25,'Friday','June','f','f',NULL,8),(20160625,'2016-06-25',2016,6,25,2,25,'Saturday','June','f','t',NULL,0),(20160626,'2016-06-26',2016,6,26,2,25,'Sunday','June','f','t',NULL,0),(20160627,'2016-06-27',2016,6,27,2,26,'Monday','June','f','f',NULL,8),(20160628,'2016-06-28',2016,6,28,2,26,'Tuesday','June','f','f',NULL,8),(20160629,'2016-06-29',2016,6,29,2,26,'Wednesday','June','f','f',NULL,8),(20160630,'2016-06-30',2016,6,30,2,26,'Thursday','June','f','f',NULL,8),(20160701,'2016-07-01',2016,7,1,3,26,'Friday','July','f','f',NULL,8),(20160702,'2016-07-02',2016,7,2,3,26,'Saturday','July','f','t',NULL,0),(20160703,'2016-07-03',2016,7,3,3,26,'Sunday','July','f','t',NULL,0),(20160704,'2016-07-04',2016,7,4,3,27,'Monday','July','f','f',NULL,8),(20160705,'2016-07-05',2016,7,5,3,27,'Tuesday','July','f','f',NULL,8),(20160706,'2016-07-06',2016,7,6,3,27,'Wednesday','July','f','f',NULL,8),(20160707,'2016-07-07',2016,7,7,3,27,'Thursday','July','f','f',NULL,8),(20160708,'2016-07-08',2016,7,8,3,27,'Friday','July','f','f',NULL,8),(20160709,'2016-07-09',2016,7,9,3,27,'Saturday','July','f','t',NULL,0),(20160710,'2016-07-10',2016,7,10,3,27,'Sunday','July','f','t',NULL,0),(20160711,'2016-07-11',2016,7,11,3,28,'Monday','July','f','f',NULL,8),(20160712,'2016-07-12',2016,7,12,3,28,'Tuesday','July','f','f',NULL,8),(20160713,'2016-07-13',2016,7,13,3,28,'Wednesday','July','f','f',NULL,8),(20160714,'2016-07-14',2016,7,14,3,28,'Thursday','July','f','f',NULL,8),(20160715,'2016-07-15',2016,7,15,3,28,'Friday','July','f','f',NULL,8),(20160716,'2016-07-16',2016,7,16,3,28,'Saturday','July','f','t',NULL,0),(20160717,'2016-07-17',2016,7,17,3,28,'Sunday','July','f','t',NULL,0),(20160718,'2016-07-18',2016,7,18,3,29,'Monday','July','f','f',NULL,8),(20160719,'2016-07-19',2016,7,19,3,29,'Tuesday','July','f','f',NULL,8),(20160720,'2016-07-20',2016,7,20,3,29,'Wednesday','July','f','f',NULL,8),(20160721,'2016-07-21',2016,7,21,3,29,'Thursday','July','f','f',NULL,8),(20160722,'2016-07-22',2016,7,22,3,29,'Friday','July','f','f',NULL,8),(20160723,'2016-07-23',2016,7,23,3,29,'Saturday','July','f','t',NULL,0),(20160724,'2016-07-24',2016,7,24,3,29,'Sunday','July','f','t',NULL,0),(20160725,'2016-07-25',2016,7,25,3,30,'Monday','July','f','f',NULL,8),(20160726,'2016-07-26',2016,7,26,3,30,'Tuesday','July','f','f',NULL,8),(20160727,'2016-07-27',2016,7,27,3,30,'Wednesday','July','f','f',NULL,8),(20160728,'2016-07-28',2016,7,28,3,30,'Thursday','July','f','f',NULL,8),(20160729,'2016-07-29',2016,7,29,3,30,'Friday','July','f','f',NULL,8),(20160730,'2016-07-30',2016,7,30,3,30,'Saturday','July','f','t',NULL,0),(20160731,'2016-07-31',2016,7,31,3,30,'Sunday','July','f','t',NULL,0),(20160801,'2016-08-01',2016,8,1,3,31,'Monday','August','f','f',NULL,8),(20160802,'2016-08-02',2016,8,2,3,31,'Tuesday','August','f','f',NULL,8),(20160803,'2016-08-03',2016,8,3,3,31,'Wednesday','August','f','f',NULL,8),(20160804,'2016-08-04',2016,8,4,3,31,'Thursday','August','f','f',NULL,8),(20160805,'2016-08-05',2016,8,5,3,31,'Friday','August','f','f',NULL,8),(20160806,'2016-08-06',2016,8,6,3,31,'Saturday','August','f','t',NULL,0),(20160807,'2016-08-07',2016,8,7,3,31,'Sunday','August','f','t',NULL,0),(20160808,'2016-08-08',2016,8,8,3,32,'Monday','August','f','f',NULL,8),(20160809,'2016-08-09',2016,8,9,3,32,'Tuesday','August','f','f',NULL,8),(20160810,'2016-08-10',2016,8,10,3,32,'Wednesday','August','f','f',NULL,8),(20160811,'2016-08-11',2016,8,11,3,32,'Thursday','August','f','f',NULL,8),(20160812,'2016-08-12',2016,8,12,3,32,'Friday','August','f','f',NULL,8),(20160813,'2016-08-13',2016,8,13,3,32,'Saturday','August','f','t',NULL,0),(20160814,'2016-08-14',2016,8,14,3,32,'Sunday','August','f','t',NULL,0),(20160815,'2016-08-15',2016,8,15,3,33,'Monday','August','f','f',NULL,8),(20160816,'2016-08-16',2016,8,16,3,33,'Tuesday','August','f','f',NULL,8),(20160817,'2016-08-17',2016,8,17,3,33,'Wednesday','August','f','f',NULL,8),(20160818,'2016-08-18',2016,8,18,3,33,'Thursday','August','f','f',NULL,8),(20160819,'2016-08-19',2016,8,19,3,33,'Friday','August','f','f',NULL,8),(20160820,'2016-08-20',2016,8,20,3,33,'Saturday','August','f','t',NULL,0),(20160821,'2016-08-21',2016,8,21,3,33,'Sunday','August','f','t',NULL,0),(20160822,'2016-08-22',2016,8,22,3,34,'Monday','August','f','f',NULL,8),(20160823,'2016-08-23',2016,8,23,3,34,'Tuesday','August','f','f',NULL,8),(20160824,'2016-08-24',2016,8,24,3,34,'Wednesday','August','f','f',NULL,8),(20160825,'2016-08-25',2016,8,25,3,34,'Thursday','August','f','f',NULL,8),(20160826,'2016-08-26',2016,8,26,3,34,'Friday','August','f','f',NULL,8),(20160827,'2016-08-27',2016,8,27,3,34,'Saturday','August','f','t',NULL,0),(20160828,'2016-08-28',2016,8,28,3,34,'Sunday','August','f','t',NULL,0),(20160829,'2016-08-29',2016,8,29,3,35,'Monday','August','f','f',NULL,8),(20160830,'2016-08-30',2016,8,30,3,35,'Tuesday','August','f','f',NULL,8),(20160831,'2016-08-31',2016,8,31,3,35,'Wednesday','August','f','f',NULL,8),(20160901,'2016-09-01',2016,9,1,3,35,'Thursday','September','f','f',NULL,8),(20160902,'2016-09-02',2016,9,2,3,35,'Friday','September','f','f',NULL,8),(20160903,'2016-09-03',2016,9,3,3,35,'Saturday','September','f','t',NULL,0),(20160904,'2016-09-04',2016,9,4,3,35,'Sunday','September','f','t',NULL,0),(20160905,'2016-09-05',2016,9,5,3,36,'Monday','September','f','f',NULL,8),(20160906,'2016-09-06',2016,9,6,3,36,'Tuesday','September','f','f',NULL,8),(20160907,'2016-09-07',2016,9,7,3,36,'Wednesday','September','f','f',NULL,8),(20160908,'2016-09-08',2016,9,8,3,36,'Thursday','September','f','f',NULL,8),(20160909,'2016-09-09',2016,9,9,3,36,'Friday','September','f','f',NULL,8),(20160910,'2016-09-10',2016,9,10,3,36,'Saturday','September','f','t',NULL,0),(20160911,'2016-09-11',2016,9,11,3,36,'Sunday','September','f','t',NULL,0),(20160912,'2016-09-12',2016,9,12,3,37,'Monday','September','f','f',NULL,8),(20160913,'2016-09-13',2016,9,13,3,37,'Tuesday','September','f','f',NULL,8),(20160914,'2016-09-14',2016,9,14,3,37,'Wednesday','September','f','f',NULL,8),(20160915,'2016-09-15',2016,9,15,3,37,'Thursday','September','f','f',NULL,8),(20160916,'2016-09-16',2016,9,16,3,37,'Friday','September','f','f',NULL,8),(20160917,'2016-09-17',2016,9,17,3,37,'Saturday','September','f','t',NULL,0),(20160918,'2016-09-18',2016,9,18,3,37,'Sunday','September','f','t',NULL,0),(20160919,'2016-09-19',2016,9,19,3,38,'Monday','September','f','f',NULL,8),(20160920,'2016-09-20',2016,9,20,3,38,'Tuesday','September','f','f',NULL,8),(20160921,'2016-09-21',2016,9,21,3,38,'Wednesday','September','f','f',NULL,8),(20160922,'2016-09-22',2016,9,22,3,38,'Thursday','September','f','f',NULL,8),(20160923,'2016-09-23',2016,9,23,3,38,'Friday','September','f','f',NULL,8),(20160924,'2016-09-24',2016,9,24,3,38,'Saturday','September','f','t',NULL,0),(20160925,'2016-09-25',2016,9,25,3,38,'Sunday','September','f','t',NULL,0),(20160926,'2016-09-26',2016,9,26,3,39,'Monday','September','f','f',NULL,8),(20160927,'2016-09-27',2016,9,27,3,39,'Tuesday','September','f','f',NULL,8),(20160928,'2016-09-28',2016,9,28,3,39,'Wednesday','September','f','f',NULL,8),(20160929,'2016-09-29',2016,9,29,3,39,'Thursday','September','f','f',NULL,8),(20160930,'2016-09-30',2016,9,30,3,39,'Friday','September','f','f',NULL,8),(20161001,'2016-10-01',2016,10,1,4,39,'Saturday','October','f','t',NULL,0),(20161002,'2016-10-02',2016,10,2,4,39,'Sunday','October','f','t',NULL,0),(20161003,'2016-10-03',2016,10,3,4,40,'Monday','October','f','f',NULL,8),(20161004,'2016-10-04',2016,10,4,4,40,'Tuesday','October','f','f',NULL,8),(20161005,'2016-10-05',2016,10,5,4,40,'Wednesday','October','f','f',NULL,8),(20161006,'2016-10-06',2016,10,6,4,40,'Thursday','October','f','f',NULL,8),(20161007,'2016-10-07',2016,10,7,4,40,'Friday','October','f','f',NULL,8),(20161008,'2016-10-08',2016,10,8,4,40,'Saturday','October','f','t',NULL,0),(20161009,'2016-10-09',2016,10,9,4,40,'Sunday','October','f','t',NULL,0),(20161010,'2016-10-10',2016,10,10,4,41,'Monday','October','f','f',NULL,8),(20161011,'2016-10-11',2016,10,11,4,41,'Tuesday','October','f','f',NULL,8),(20161012,'2016-10-12',2016,10,12,4,41,'Wednesday','October','f','f',NULL,8),(20161013,'2016-10-13',2016,10,13,4,41,'Thursday','October','f','f',NULL,8),(20161014,'2016-10-14',2016,10,14,4,41,'Friday','October','f','f',NULL,8),(20161015,'2016-10-15',2016,10,15,4,41,'Saturday','October','f','t',NULL,0),(20161016,'2016-10-16',2016,10,16,4,41,'Sunday','October','f','t',NULL,0),(20161017,'2016-10-17',2016,10,17,4,42,'Monday','October','f','f',NULL,8),(20161018,'2016-10-18',2016,10,18,4,42,'Tuesday','October','f','f',NULL,8),(20161019,'2016-10-19',2016,10,19,4,42,'Wednesday','October','f','f',NULL,8),(20161020,'2016-10-20',2016,10,20,4,42,'Thursday','October','f','f',NULL,8),(20161021,'2016-10-21',2016,10,21,4,42,'Friday','October','f','f',NULL,8),(20161022,'2016-10-22',2016,10,22,4,42,'Saturday','October','f','t',NULL,0),(20161023,'2016-10-23',2016,10,23,4,42,'Sunday','October','f','t',NULL,0),(20161024,'2016-10-24',2016,10,24,4,43,'Monday','October','f','f',NULL,8),(20161025,'2016-10-25',2016,10,25,4,43,'Tuesday','October','f','f',NULL,8),(20161026,'2016-10-26',2016,10,26,4,43,'Wednesday','October','f','f',NULL,8),(20161027,'2016-10-27',2016,10,27,4,43,'Thursday','October','f','f',NULL,8),(20161028,'2016-10-28',2016,10,28,4,43,'Friday','October','f','f',NULL,8),(20161029,'2016-10-29',2016,10,29,4,43,'Saturday','October','f','t',NULL,0),(20161030,'2016-10-30',2016,10,30,4,43,'Sunday','October','f','t',NULL,0),(20161031,'2016-10-31',2016,10,31,4,44,'Monday','October','f','f',NULL,8),(20161101,'2016-11-01',2016,11,1,4,44,'Tuesday','November','f','f',NULL,8),(20161102,'2016-11-02',2016,11,2,4,44,'Wednesday','November','f','f',NULL,8),(20161103,'2016-11-03',2016,11,3,4,44,'Thursday','November','f','f',NULL,8),(20161104,'2016-11-04',2016,11,4,4,44,'Friday','November','f','f',NULL,8),(20161105,'2016-11-05',2016,11,5,4,44,'Saturday','November','f','t',NULL,0),(20161106,'2016-11-06',2016,11,6,4,44,'Sunday','November','f','t',NULL,0),(20161107,'2016-11-07',2016,11,7,4,45,'Monday','November','f','f',NULL,8),(20161108,'2016-11-08',2016,11,8,4,45,'Tuesday','November','f','f',NULL,8),(20161109,'2016-11-09',2016,11,9,4,45,'Wednesday','November','f','f',NULL,8),(20161110,'2016-11-10',2016,11,10,4,45,'Thursday','November','f','f',NULL,8),(20161111,'2016-11-11',2016,11,11,4,45,'Friday','November','f','f',NULL,8),(20161112,'2016-11-12',2016,11,12,4,45,'Saturday','November','f','t',NULL,0),(20161113,'2016-11-13',2016,11,13,4,45,'Sunday','November','f','t',NULL,0),(20161114,'2016-11-14',2016,11,14,4,46,'Monday','November','f','f',NULL,8),(20161115,'2016-11-15',2016,11,15,4,46,'Tuesday','November','f','f',NULL,8),(20161116,'2016-11-16',2016,11,16,4,46,'Wednesday','November','f','f',NULL,8),(20161117,'2016-11-17',2016,11,17,4,46,'Thursday','November','f','f',NULL,8),(20161118,'2016-11-18',2016,11,18,4,46,'Friday','November','f','f',NULL,8),(20161119,'2016-11-19',2016,11,19,4,46,'Saturday','November','f','t',NULL,0),(20161120,'2016-11-20',2016,11,20,4,46,'Sunday','November','f','t',NULL,0),(20161121,'2016-11-21',2016,11,21,4,47,'Monday','November','f','f',NULL,8),(20161122,'2016-11-22',2016,11,22,4,47,'Tuesday','November','f','f',NULL,8),(20161123,'2016-11-23',2016,11,23,4,47,'Wednesday','November','f','f',NULL,8),(20161124,'2016-11-24',2016,11,24,4,47,'Thursday','November','f','f',NULL,8),(20161125,'2016-11-25',2016,11,25,4,47,'Friday','November','f','f',NULL,8),(20161126,'2016-11-26',2016,11,26,4,47,'Saturday','November','f','t',NULL,0),(20161127,'2016-11-27',2016,11,27,4,47,'Sunday','November','f','t',NULL,0),(20161128,'2016-11-28',2016,11,28,4,48,'Monday','November','f','f',NULL,8),(20161129,'2016-11-29',2016,11,29,4,48,'Tuesday','November','f','f',NULL,8),(20161130,'2016-11-30',2016,11,30,4,48,'Wednesday','November','f','f',NULL,8),(20161201,'2016-12-01',2016,12,1,4,48,'Thursday','December','f','f',NULL,8),(20161202,'2016-12-02',2016,12,2,4,48,'Friday','December','f','f',NULL,8),(20161203,'2016-12-03',2016,12,3,4,48,'Saturday','December','f','t',NULL,0),(20161204,'2016-12-04',2016,12,4,4,48,'Sunday','December','f','t',NULL,0),(20161205,'2016-12-05',2016,12,5,4,49,'Monday','December','f','f',NULL,8),(20161206,'2016-12-06',2016,12,6,4,49,'Tuesday','December','f','f',NULL,8),(20161207,'2016-12-07',2016,12,7,4,49,'Wednesday','December','f','f',NULL,8),(20161208,'2016-12-08',2016,12,8,4,49,'Thursday','December','f','f',NULL,8),(20161209,'2016-12-09',2016,12,9,4,49,'Friday','December','f','f',NULL,8),(20161210,'2016-12-10',2016,12,10,4,49,'Saturday','December','f','t',NULL,0),(20161211,'2016-12-11',2016,12,11,4,49,'Sunday','December','f','t',NULL,0),(20161212,'2016-12-12',2016,12,12,4,50,'Monday','December','f','f',NULL,8),(20161213,'2016-12-13',2016,12,13,4,50,'Tuesday','December','f','f',NULL,8),(20161214,'2016-12-14',2016,12,14,4,50,'Wednesday','December','f','f',NULL,8),(20161215,'2016-12-15',2016,12,15,4,50,'Thursday','December','f','f',NULL,8),(20161216,'2016-12-16',2016,12,16,4,50,'Friday','December','f','f',NULL,8),(20161217,'2016-12-17',2016,12,17,4,50,'Saturday','December','f','t',NULL,0),(20161218,'2016-12-18',2016,12,18,4,50,'Sunday','December','f','t',NULL,0),(20161219,'2016-12-19',2016,12,19,4,51,'Monday','December','f','f',NULL,8),(20161220,'2016-12-20',2016,12,20,4,51,'Tuesday','December','f','f',NULL,8),(20161221,'2016-12-21',2016,12,21,4,51,'Wednesday','December','f','f',NULL,8),(20161222,'2016-12-22',2016,12,22,4,51,'Thursday','December','f','f',NULL,8),(20161223,'2016-12-23',2016,12,23,4,51,'Friday','December','f','f',NULL,8),(20161224,'2016-12-24',2016,12,24,4,51,'Saturday','December','f','t',NULL,0),(20161225,'2016-12-25',2016,12,25,4,51,'Sunday','December','f','t',NULL,0),(20161226,'2016-12-26',2016,12,26,4,52,'Monday','December','f','f',NULL,8),(20161227,'2016-12-27',2016,12,27,4,52,'Tuesday','December','f','f',NULL,8),(20161228,'2016-12-28',2016,12,28,4,52,'Wednesday','December','f','f',NULL,8),(20161229,'2016-12-29',2016,12,29,4,52,'Thursday','December','f','f',NULL,8),(20161230,'2016-12-30',2016,12,30,4,52,'Friday','December','f','f',NULL,8),(20161231,'2016-12-31',2016,12,31,4,52,'Saturday','December','f','t',NULL,0),(20170101,'2017-01-01',2017,1,1,1,52,'Sunday','January','f','t',NULL,0),(20170102,'2017-01-02',2017,1,2,1,1,'Monday','January','f','f',NULL,8),(20170103,'2017-01-03',2017,1,3,1,1,'Tuesday','January','f','f',NULL,8),(20170104,'2017-01-04',2017,1,4,1,1,'Wednesday','January','f','f',NULL,8),(20170105,'2017-01-05',2017,1,5,1,1,'Thursday','January','f','f',NULL,8),(20170106,'2017-01-06',2017,1,6,1,1,'Friday','January','f','f',NULL,8),(20170107,'2017-01-07',2017,1,7,1,1,'Saturday','January','f','t',NULL,0),(20170108,'2017-01-08',2017,1,8,1,1,'Sunday','January','f','t',NULL,0),(20170109,'2017-01-09',2017,1,9,1,2,'Monday','January','f','f',NULL,8),(20170110,'2017-01-10',2017,1,10,1,2,'Tuesday','January','f','f',NULL,8),(20170111,'2017-01-11',2017,1,11,1,2,'Wednesday','January','f','f',NULL,8),(20170112,'2017-01-12',2017,1,12,1,2,'Thursday','January','f','f',NULL,8),(20170113,'2017-01-13',2017,1,13,1,2,'Friday','January','f','f',NULL,8),(20170114,'2017-01-14',2017,1,14,1,2,'Saturday','January','f','t',NULL,0),(20170115,'2017-01-15',2017,1,15,1,2,'Sunday','January','f','t',NULL,0),(20170116,'2017-01-16',2017,1,16,1,3,'Monday','January','f','f',NULL,8),(20170117,'2017-01-17',2017,1,17,1,3,'Tuesday','January','f','f',NULL,8),(20170118,'2017-01-18',2017,1,18,1,3,'Wednesday','January','f','f',NULL,8),(20170119,'2017-01-19',2017,1,19,1,3,'Thursday','January','f','f',NULL,8),(20170120,'2017-01-20',2017,1,20,1,3,'Friday','January','f','f',NULL,8),(20170121,'2017-01-21',2017,1,21,1,3,'Saturday','January','f','t',NULL,0),(20170122,'2017-01-22',2017,1,22,1,3,'Sunday','January','f','t',NULL,0),(20170123,'2017-01-23',2017,1,23,1,4,'Monday','January','f','f',NULL,8),(20170124,'2017-01-24',2017,1,24,1,4,'Tuesday','January','f','f',NULL,8),(20170125,'2017-01-25',2017,1,25,1,4,'Wednesday','January','f','f',NULL,8),(20170126,'2017-01-26',2017,1,26,1,4,'Thursday','January','f','f',NULL,8),(20170127,'2017-01-27',2017,1,27,1,4,'Friday','January','f','f',NULL,8),(20170128,'2017-01-28',2017,1,28,1,4,'Saturday','January','f','t',NULL,0),(20170129,'2017-01-29',2017,1,29,1,4,'Sunday','January','f','t',NULL,0),(20170130,'2017-01-30',2017,1,30,1,5,'Monday','January','f','f',NULL,8),(20170131,'2017-01-31',2017,1,31,1,5,'Tuesday','January','f','f',NULL,8),(20170201,'2017-02-01',2017,2,1,1,5,'Wednesday','February','f','f',NULL,8),(20170202,'2017-02-02',2017,2,2,1,5,'Thursday','February','f','f',NULL,8),(20170203,'2017-02-03',2017,2,3,1,5,'Friday','February','f','f',NULL,8),(20170204,'2017-02-04',2017,2,4,1,5,'Saturday','February','f','t',NULL,0),(20170205,'2017-02-05',2017,2,5,1,5,'Sunday','February','f','t',NULL,0),(20170206,'2017-02-06',2017,2,6,1,6,'Monday','February','f','f',NULL,8),(20170207,'2017-02-07',2017,2,7,1,6,'Tuesday','February','f','f',NULL,8),(20170208,'2017-02-08',2017,2,8,1,6,'Wednesday','February','f','f',NULL,8),(20170209,'2017-02-09',2017,2,9,1,6,'Thursday','February','f','f',NULL,8),(20170210,'2017-02-10',2017,2,10,1,6,'Friday','February','f','f',NULL,8),(20170211,'2017-02-11',2017,2,11,1,6,'Saturday','February','f','t',NULL,0),(20170212,'2017-02-12',2017,2,12,1,6,'Sunday','February','f','t',NULL,0),(20170213,'2017-02-13',2017,2,13,1,7,'Monday','February','f','f',NULL,8),(20170214,'2017-02-14',2017,2,14,1,7,'Tuesday','February','f','f',NULL,8),(20170215,'2017-02-15',2017,2,15,1,7,'Wednesday','February','f','f',NULL,8),(20170216,'2017-02-16',2017,2,16,1,7,'Thursday','February','f','f',NULL,8),(20170217,'2017-02-17',2017,2,17,1,7,'Friday','February','f','f',NULL,8),(20170218,'2017-02-18',2017,2,18,1,7,'Saturday','February','f','t',NULL,0),(20170219,'2017-02-19',2017,2,19,1,7,'Sunday','February','f','t',NULL,0),(20170220,'2017-02-20',2017,2,20,1,8,'Monday','February','f','f',NULL,8),(20170221,'2017-02-21',2017,2,21,1,8,'Tuesday','February','f','f',NULL,8),(20170222,'2017-02-22',2017,2,22,1,8,'Wednesday','February','f','f',NULL,8),(20170223,'2017-02-23',2017,2,23,1,8,'Thursday','February','f','f',NULL,8),(20170224,'2017-02-24',2017,2,24,1,8,'Friday','February','f','f',NULL,8),(20170225,'2017-02-25',2017,2,25,1,8,'Saturday','February','f','t',NULL,0),(20170226,'2017-02-26',2017,2,26,1,8,'Sunday','February','f','t',NULL,0),(20170227,'2017-02-27',2017,2,27,1,9,'Monday','February','f','f',NULL,8),(20170228,'2017-02-28',2017,2,28,1,9,'Tuesday','February','f','f',NULL,8),(20170301,'2017-03-01',2017,3,1,1,9,'Wednesday','March','f','f',NULL,8),(20170302,'2017-03-02',2017,3,2,1,9,'Thursday','March','f','f',NULL,8),(20170303,'2017-03-03',2017,3,3,1,9,'Friday','March','f','f',NULL,8),(20170304,'2017-03-04',2017,3,4,1,9,'Saturday','March','f','t',NULL,0),(20170305,'2017-03-05',2017,3,5,1,9,'Sunday','March','f','t',NULL,0),(20170306,'2017-03-06',2017,3,6,1,10,'Monday','March','f','f',NULL,8),(20170307,'2017-03-07',2017,3,7,1,10,'Tuesday','March','f','f',NULL,8),(20170308,'2017-03-08',2017,3,8,1,10,'Wednesday','March','f','f',NULL,8),(20170309,'2017-03-09',2017,3,9,1,10,'Thursday','March','f','f',NULL,8),(20170310,'2017-03-10',2017,3,10,1,10,'Friday','March','f','f',NULL,8),(20170311,'2017-03-11',2017,3,11,1,10,'Saturday','March','f','t',NULL,0),(20170312,'2017-03-12',2017,3,12,1,10,'Sunday','March','f','t',NULL,0),(20170313,'2017-03-13',2017,3,13,1,11,'Monday','March','f','f',NULL,8),(20170314,'2017-03-14',2017,3,14,1,11,'Tuesday','March','f','f',NULL,8),(20170315,'2017-03-15',2017,3,15,1,11,'Wednesday','March','f','f',NULL,8),(20170316,'2017-03-16',2017,3,16,1,11,'Thursday','March','f','f',NULL,8),(20170317,'2017-03-17',2017,3,17,1,11,'Friday','March','f','f',NULL,8),(20170318,'2017-03-18',2017,3,18,1,11,'Saturday','March','f','t',NULL,0),(20170319,'2017-03-19',2017,3,19,1,11,'Sunday','March','f','t',NULL,0),(20170320,'2017-03-20',2017,3,20,1,12,'Monday','March','f','f',NULL,8),(20170321,'2017-03-21',2017,3,21,1,12,'Tuesday','March','f','f',NULL,8),(20170322,'2017-03-22',2017,3,22,1,12,'Wednesday','March','f','f',NULL,8),(20170323,'2017-03-23',2017,3,23,1,12,'Thursday','March','f','f',NULL,8),(20170324,'2017-03-24',2017,3,24,1,12,'Friday','March','f','f',NULL,8),(20170325,'2017-03-25',2017,3,25,1,12,'Saturday','March','f','t',NULL,0),(20170326,'2017-03-26',2017,3,26,1,12,'Sunday','March','f','t',NULL,0),(20170327,'2017-03-27',2017,3,27,1,13,'Monday','March','f','f',NULL,8),(20170328,'2017-03-28',2017,3,28,1,13,'Tuesday','March','f','f',NULL,8),(20170329,'2017-03-29',2017,3,29,1,13,'Wednesday','March','f','f',NULL,8),(20170330,'2017-03-30',2017,3,30,1,13,'Thursday','March','f','f',NULL,8),(20170331,'2017-03-31',2017,3,31,1,13,'Friday','March','f','f',NULL,8),(20170401,'2017-04-01',2017,4,1,2,13,'Saturday','April','f','t',NULL,0),(20170402,'2017-04-02',2017,4,2,2,13,'Sunday','April','f','t',NULL,0),(20170403,'2017-04-03',2017,4,3,2,14,'Monday','April','f','f',NULL,8),(20170404,'2017-04-04',2017,4,4,2,14,'Tuesday','April','f','f',NULL,8),(20170405,'2017-04-05',2017,4,5,2,14,'Wednesday','April','f','f',NULL,8),(20170406,'2017-04-06',2017,4,6,2,14,'Thursday','April','f','f',NULL,8),(20170407,'2017-04-07',2017,4,7,2,14,'Friday','April','f','f',NULL,8),(20170408,'2017-04-08',2017,4,8,2,14,'Saturday','April','f','t',NULL,0),(20170409,'2017-04-09',2017,4,9,2,14,'Sunday','April','f','t',NULL,0),(20170410,'2017-04-10',2017,4,10,2,15,'Monday','April','f','f',NULL,8),(20170411,'2017-04-11',2017,4,11,2,15,'Tuesday','April','f','f',NULL,8),(20170412,'2017-04-12',2017,4,12,2,15,'Wednesday','April','f','f',NULL,8),(20170413,'2017-04-13',2017,4,13,2,15,'Thursday','April','f','f',NULL,8),(20170414,'2017-04-14',2017,4,14,2,15,'Friday','April','f','f',NULL,8),(20170415,'2017-04-15',2017,4,15,2,15,'Saturday','April','f','t',NULL,0),(20170416,'2017-04-16',2017,4,16,2,15,'Sunday','April','f','t',NULL,0),(20170417,'2017-04-17',2017,4,17,2,16,'Monday','April','f','f',NULL,8),(20170418,'2017-04-18',2017,4,18,2,16,'Tuesday','April','f','f',NULL,8),(20170419,'2017-04-19',2017,4,19,2,16,'Wednesday','April','f','f',NULL,8),(20170420,'2017-04-20',2017,4,20,2,16,'Thursday','April','f','f',NULL,8),(20170421,'2017-04-21',2017,4,21,2,16,'Friday','April','f','f',NULL,8),(20170422,'2017-04-22',2017,4,22,2,16,'Saturday','April','f','t',NULL,0),(20170423,'2017-04-23',2017,4,23,2,16,'Sunday','April','f','t',NULL,0),(20170424,'2017-04-24',2017,4,24,2,17,'Monday','April','f','f',NULL,8),(20170425,'2017-04-25',2017,4,25,2,17,'Tuesday','April','f','f',NULL,8),(20170426,'2017-04-26',2017,4,26,2,17,'Wednesday','April','f','f',NULL,8),(20170427,'2017-04-27',2017,4,27,2,17,'Thursday','April','f','f',NULL,8),(20170428,'2017-04-28',2017,4,28,2,17,'Friday','April','f','f',NULL,8),(20170429,'2017-04-29',2017,4,29,2,17,'Saturday','April','f','t',NULL,0),(20170430,'2017-04-30',2017,4,30,2,17,'Sunday','April','f','t',NULL,0),(20170501,'2017-05-01',2017,5,1,2,18,'Monday','May','f','f',NULL,8),(20170502,'2017-05-02',2017,5,2,2,18,'Tuesday','May','f','f',NULL,8),(20170503,'2017-05-03',2017,5,3,2,18,'Wednesday','May','f','f',NULL,8),(20170504,'2017-05-04',2017,5,4,2,18,'Thursday','May','f','f',NULL,8),(20170505,'2017-05-05',2017,5,5,2,18,'Friday','May','f','f',NULL,8),(20170506,'2017-05-06',2017,5,6,2,18,'Saturday','May','f','t',NULL,0),(20170507,'2017-05-07',2017,5,7,2,18,'Sunday','May','f','t',NULL,0),(20170508,'2017-05-08',2017,5,8,2,19,'Monday','May','f','f',NULL,8),(20170509,'2017-05-09',2017,5,9,2,19,'Tuesday','May','f','f',NULL,8),(20170510,'2017-05-10',2017,5,10,2,19,'Wednesday','May','f','f',NULL,8),(20170511,'2017-05-11',2017,5,11,2,19,'Thursday','May','f','f',NULL,8),(20170512,'2017-05-12',2017,5,12,2,19,'Friday','May','f','f',NULL,8),(20170513,'2017-05-13',2017,5,13,2,19,'Saturday','May','f','t',NULL,0),(20170514,'2017-05-14',2017,5,14,2,19,'Sunday','May','f','t',NULL,0),(20170515,'2017-05-15',2017,5,15,2,20,'Monday','May','f','f',NULL,8),(20170516,'2017-05-16',2017,5,16,2,20,'Tuesday','May','f','f',NULL,8),(20170517,'2017-05-17',2017,5,17,2,20,'Wednesday','May','f','f',NULL,8),(20170518,'2017-05-18',2017,5,18,2,20,'Thursday','May','f','f',NULL,8),(20170519,'2017-05-19',2017,5,19,2,20,'Friday','May','f','f',NULL,8),(20170520,'2017-05-20',2017,5,20,2,20,'Saturday','May','f','t',NULL,0),(20170521,'2017-05-21',2017,5,21,2,20,'Sunday','May','f','t',NULL,0),(20170522,'2017-05-22',2017,5,22,2,21,'Monday','May','f','f',NULL,8),(20170523,'2017-05-23',2017,5,23,2,21,'Tuesday','May','f','f',NULL,8),(20170524,'2017-05-24',2017,5,24,2,21,'Wednesday','May','f','f',NULL,8),(20170525,'2017-05-25',2017,5,25,2,21,'Thursday','May','f','f',NULL,8),(20170526,'2017-05-26',2017,5,26,2,21,'Friday','May','f','f',NULL,8),(20170527,'2017-05-27',2017,5,27,2,21,'Saturday','May','f','t',NULL,0),(20170528,'2017-05-28',2017,5,28,2,21,'Sunday','May','f','t',NULL,0),(20170529,'2017-05-29',2017,5,29,2,22,'Monday','May','f','f',NULL,8),(20170530,'2017-05-30',2017,5,30,2,22,'Tuesday','May','f','f',NULL,8),(20170531,'2017-05-31',2017,5,31,2,22,'Wednesday','May','f','f',NULL,8),(20170601,'2017-06-01',2017,6,1,2,22,'Thursday','June','f','f',NULL,8),(20170602,'2017-06-02',2017,6,2,2,22,'Friday','June','f','f',NULL,8),(20170603,'2017-06-03',2017,6,3,2,22,'Saturday','June','f','t',NULL,0),(20170604,'2017-06-04',2017,6,4,2,22,'Sunday','June','f','t',NULL,0),(20170605,'2017-06-05',2017,6,5,2,23,'Monday','June','f','f',NULL,8),(20170606,'2017-06-06',2017,6,6,2,23,'Tuesday','June','f','f',NULL,8),(20170607,'2017-06-07',2017,6,7,2,23,'Wednesday','June','f','f',NULL,8),(20170608,'2017-06-08',2017,6,8,2,23,'Thursday','June','f','f',NULL,8),(20170609,'2017-06-09',2017,6,9,2,23,'Friday','June','f','f',NULL,8),(20170610,'2017-06-10',2017,6,10,2,23,'Saturday','June','f','t',NULL,0),(20170611,'2017-06-11',2017,6,11,2,23,'Sunday','June','f','t',NULL,0),(20170612,'2017-06-12',2017,6,12,2,24,'Monday','June','f','f',NULL,8),(20170613,'2017-06-13',2017,6,13,2,24,'Tuesday','June','f','f',NULL,8),(20170614,'2017-06-14',2017,6,14,2,24,'Wednesday','June','f','f',NULL,8),(20170615,'2017-06-15',2017,6,15,2,24,'Thursday','June','f','f',NULL,8),(20170616,'2017-06-16',2017,6,16,2,24,'Friday','June','f','f',NULL,8),(20170617,'2017-06-17',2017,6,17,2,24,'Saturday','June','f','t',NULL,0),(20170618,'2017-06-18',2017,6,18,2,24,'Sunday','June','f','t',NULL,0),(20170619,'2017-06-19',2017,6,19,2,25,'Monday','June','f','f',NULL,8),(20170620,'2017-06-20',2017,6,20,2,25,'Tuesday','June','f','f',NULL,8),(20170621,'2017-06-21',2017,6,21,2,25,'Wednesday','June','f','f',NULL,8),(20170622,'2017-06-22',2017,6,22,2,25,'Thursday','June','f','f',NULL,8),(20170623,'2017-06-23',2017,6,23,2,25,'Friday','June','f','f',NULL,8),(20170624,'2017-06-24',2017,6,24,2,25,'Saturday','June','f','t',NULL,0),(20170625,'2017-06-25',2017,6,25,2,25,'Sunday','June','f','t',NULL,0),(20170626,'2017-06-26',2017,6,26,2,26,'Monday','June','f','f',NULL,8),(20170627,'2017-06-27',2017,6,27,2,26,'Tuesday','June','f','f',NULL,8),(20170628,'2017-06-28',2017,6,28,2,26,'Wednesday','June','f','f',NULL,8),(20170629,'2017-06-29',2017,6,29,2,26,'Thursday','June','f','f',NULL,8),(20170630,'2017-06-30',2017,6,30,2,26,'Friday','June','f','f',NULL,8),(20170701,'2017-07-01',2017,7,1,3,26,'Saturday','July','f','t',NULL,0),(20170702,'2017-07-02',2017,7,2,3,26,'Sunday','July','f','t',NULL,0),(20170703,'2017-07-03',2017,7,3,3,27,'Monday','July','f','f',NULL,8),(20170704,'2017-07-04',2017,7,4,3,27,'Tuesday','July','f','f',NULL,8),(20170705,'2017-07-05',2017,7,5,3,27,'Wednesday','July','f','f',NULL,8),(20170706,'2017-07-06',2017,7,6,3,27,'Thursday','July','f','f',NULL,8),(20170707,'2017-07-07',2017,7,7,3,27,'Friday','July','f','f',NULL,8),(20170708,'2017-07-08',2017,7,8,3,27,'Saturday','July','f','t',NULL,0),(20170709,'2017-07-09',2017,7,9,3,27,'Sunday','July','f','t',NULL,0),(20170710,'2017-07-10',2017,7,10,3,28,'Monday','July','f','f',NULL,8),(20170711,'2017-07-11',2017,7,11,3,28,'Tuesday','July','f','f',NULL,8),(20170712,'2017-07-12',2017,7,12,3,28,'Wednesday','July','f','f',NULL,8),(20170713,'2017-07-13',2017,7,13,3,28,'Thursday','July','f','f',NULL,8),(20170714,'2017-07-14',2017,7,14,3,28,'Friday','July','f','f',NULL,8),(20170715,'2017-07-15',2017,7,15,3,28,'Saturday','July','f','t',NULL,0),(20170716,'2017-07-16',2017,7,16,3,28,'Sunday','July','f','t',NULL,0),(20170717,'2017-07-17',2017,7,17,3,29,'Monday','July','f','f',NULL,8),(20170718,'2017-07-18',2017,7,18,3,29,'Tuesday','July','f','f',NULL,8),(20170719,'2017-07-19',2017,7,19,3,29,'Wednesday','July','f','f',NULL,8),(20170720,'2017-07-20',2017,7,20,3,29,'Thursday','July','f','f',NULL,8),(20170721,'2017-07-21',2017,7,21,3,29,'Friday','July','f','f',NULL,8),(20170722,'2017-07-22',2017,7,22,3,29,'Saturday','July','f','t',NULL,0),(20170723,'2017-07-23',2017,7,23,3,29,'Sunday','July','f','t',NULL,0),(20170724,'2017-07-24',2017,7,24,3,30,'Monday','July','f','f',NULL,8),(20170725,'2017-07-25',2017,7,25,3,30,'Tuesday','July','f','f',NULL,8),(20170726,'2017-07-26',2017,7,26,3,30,'Wednesday','July','f','f',NULL,8),(20170727,'2017-07-27',2017,7,27,3,30,'Thursday','July','f','f',NULL,8),(20170728,'2017-07-28',2017,7,28,3,30,'Friday','July','f','f',NULL,8),(20170729,'2017-07-29',2017,7,29,3,30,'Saturday','July','f','t',NULL,0),(20170730,'2017-07-30',2017,7,30,3,30,'Sunday','July','f','t',NULL,0),(20170731,'2017-07-31',2017,7,31,3,31,'Monday','July','f','f',NULL,8),(20170801,'2017-08-01',2017,8,1,3,31,'Tuesday','August','f','f',NULL,8),(20170802,'2017-08-02',2017,8,2,3,31,'Wednesday','August','f','f',NULL,8),(20170803,'2017-08-03',2017,8,3,3,31,'Thursday','August','f','f',NULL,8),(20170804,'2017-08-04',2017,8,4,3,31,'Friday','August','f','f',NULL,8),(20170805,'2017-08-05',2017,8,5,3,31,'Saturday','August','f','t',NULL,0),(20170806,'2017-08-06',2017,8,6,3,31,'Sunday','August','f','t',NULL,0),(20170807,'2017-08-07',2017,8,7,3,32,'Monday','August','f','f',NULL,8),(20170808,'2017-08-08',2017,8,8,3,32,'Tuesday','August','f','f',NULL,8),(20170809,'2017-08-09',2017,8,9,3,32,'Wednesday','August','f','f',NULL,8),(20170810,'2017-08-10',2017,8,10,3,32,'Thursday','August','f','f',NULL,8),(20170811,'2017-08-11',2017,8,11,3,32,'Friday','August','f','f',NULL,8),(20170812,'2017-08-12',2017,8,12,3,32,'Saturday','August','f','t',NULL,0),(20170813,'2017-08-13',2017,8,13,3,32,'Sunday','August','f','t',NULL,0),(20170814,'2017-08-14',2017,8,14,3,33,'Monday','August','f','f',NULL,8),(20170815,'2017-08-15',2017,8,15,3,33,'Tuesday','August','f','f',NULL,8),(20170816,'2017-08-16',2017,8,16,3,33,'Wednesday','August','f','f',NULL,8),(20170817,'2017-08-17',2017,8,17,3,33,'Thursday','August','f','f',NULL,8),(20170818,'2017-08-18',2017,8,18,3,33,'Friday','August','f','f',NULL,8),(20170819,'2017-08-19',2017,8,19,3,33,'Saturday','August','f','t',NULL,0),(20170820,'2017-08-20',2017,8,20,3,33,'Sunday','August','f','t',NULL,0),(20170821,'2017-08-21',2017,8,21,3,34,'Monday','August','f','f',NULL,8),(20170822,'2017-08-22',2017,8,22,3,34,'Tuesday','August','f','f',NULL,8),(20170823,'2017-08-23',2017,8,23,3,34,'Wednesday','August','f','f',NULL,8),(20170824,'2017-08-24',2017,8,24,3,34,'Thursday','August','f','f',NULL,8),(20170825,'2017-08-25',2017,8,25,3,34,'Friday','August','f','f',NULL,8),(20170826,'2017-08-26',2017,8,26,3,34,'Saturday','August','f','t',NULL,0),(20170827,'2017-08-27',2017,8,27,3,34,'Sunday','August','f','t',NULL,0),(20170828,'2017-08-28',2017,8,28,3,35,'Monday','August','f','f',NULL,8),(20170829,'2017-08-29',2017,8,29,3,35,'Tuesday','August','f','f',NULL,8),(20170830,'2017-08-30',2017,8,30,3,35,'Wednesday','August','f','f',NULL,8),(20170831,'2017-08-31',2017,8,31,3,35,'Thursday','August','f','f',NULL,8),(20170901,'2017-09-01',2017,9,1,3,35,'Friday','September','f','f',NULL,8),(20170902,'2017-09-02',2017,9,2,3,35,'Saturday','September','f','t',NULL,0),(20170903,'2017-09-03',2017,9,3,3,35,'Sunday','September','f','t',NULL,0),(20170904,'2017-09-04',2017,9,4,3,36,'Monday','September','f','f',NULL,8),(20170905,'2017-09-05',2017,9,5,3,36,'Tuesday','September','f','f',NULL,8),(20170906,'2017-09-06',2017,9,6,3,36,'Wednesday','September','f','f',NULL,8),(20170907,'2017-09-07',2017,9,7,3,36,'Thursday','September','f','f',NULL,8),(20170908,'2017-09-08',2017,9,8,3,36,'Friday','September','f','f',NULL,8),(20170909,'2017-09-09',2017,9,9,3,36,'Saturday','September','f','t',NULL,0),(20170910,'2017-09-10',2017,9,10,3,36,'Sunday','September','f','t',NULL,0),(20170911,'2017-09-11',2017,9,11,3,37,'Monday','September','f','f',NULL,8),(20170912,'2017-09-12',2017,9,12,3,37,'Tuesday','September','f','f',NULL,8),(20170913,'2017-09-13',2017,9,13,3,37,'Wednesday','September','f','f',NULL,8),(20170914,'2017-09-14',2017,9,14,3,37,'Thursday','September','f','f',NULL,8),(20170915,'2017-09-15',2017,9,15,3,37,'Friday','September','f','f',NULL,8),(20170916,'2017-09-16',2017,9,16,3,37,'Saturday','September','f','t',NULL,0),(20170917,'2017-09-17',2017,9,17,3,37,'Sunday','September','f','t',NULL,0),(20170918,'2017-09-18',2017,9,18,3,38,'Monday','September','f','f',NULL,8),(20170919,'2017-09-19',2017,9,19,3,38,'Tuesday','September','f','f',NULL,8),(20170920,'2017-09-20',2017,9,20,3,38,'Wednesday','September','f','f',NULL,8),(20170921,'2017-09-21',2017,9,21,3,38,'Thursday','September','f','f',NULL,8),(20170922,'2017-09-22',2017,9,22,3,38,'Friday','September','f','f',NULL,8),(20170923,'2017-09-23',2017,9,23,3,38,'Saturday','September','f','t',NULL,0),(20170924,'2017-09-24',2017,9,24,3,38,'Sunday','September','f','t',NULL,0),(20170925,'2017-09-25',2017,9,25,3,39,'Monday','September','f','f',NULL,8),(20170926,'2017-09-26',2017,9,26,3,39,'Tuesday','September','f','f',NULL,8),(20170927,'2017-09-27',2017,9,27,3,39,'Wednesday','September','f','f',NULL,8),(20170928,'2017-09-28',2017,9,28,3,39,'Thursday','September','f','f',NULL,8),(20170929,'2017-09-29',2017,9,29,3,39,'Friday','September','f','f',NULL,8),(20170930,'2017-09-30',2017,9,30,3,39,'Saturday','September','f','t',NULL,0),(20171001,'2017-10-01',2017,10,1,4,39,'Sunday','October','f','t',NULL,0),(20171002,'2017-10-02',2017,10,2,4,40,'Monday','October','f','f',NULL,8),(20171003,'2017-10-03',2017,10,3,4,40,'Tuesday','October','f','f',NULL,8),(20171004,'2017-10-04',2017,10,4,4,40,'Wednesday','October','f','f',NULL,8),(20171005,'2017-10-05',2017,10,5,4,40,'Thursday','October','f','f',NULL,8),(20171006,'2017-10-06',2017,10,6,4,40,'Friday','October','f','f',NULL,8),(20171007,'2017-10-07',2017,10,7,4,40,'Saturday','October','f','t',NULL,0),(20171008,'2017-10-08',2017,10,8,4,40,'Sunday','October','f','t',NULL,0),(20171009,'2017-10-09',2017,10,9,4,41,'Monday','October','f','f',NULL,8),(20171010,'2017-10-10',2017,10,10,4,41,'Tuesday','October','f','f',NULL,8),(20171011,'2017-10-11',2017,10,11,4,41,'Wednesday','October','f','f',NULL,8),(20171012,'2017-10-12',2017,10,12,4,41,'Thursday','October','f','f',NULL,8),(20171013,'2017-10-13',2017,10,13,4,41,'Friday','October','f','f',NULL,8),(20171014,'2017-10-14',2017,10,14,4,41,'Saturday','October','f','t',NULL,0),(20171015,'2017-10-15',2017,10,15,4,41,'Sunday','October','f','t',NULL,0),(20171016,'2017-10-16',2017,10,16,4,42,'Monday','October','f','f',NULL,8),(20171017,'2017-10-17',2017,10,17,4,42,'Tuesday','October','f','f',NULL,8),(20171018,'2017-10-18',2017,10,18,4,42,'Wednesday','October','f','f',NULL,8),(20171019,'2017-10-19',2017,10,19,4,42,'Thursday','October','f','f',NULL,8),(20171020,'2017-10-20',2017,10,20,4,42,'Friday','October','f','f',NULL,8),(20171021,'2017-10-21',2017,10,21,4,42,'Saturday','October','f','t',NULL,0),(20171022,'2017-10-22',2017,10,22,4,42,'Sunday','October','f','t',NULL,0),(20171023,'2017-10-23',2017,10,23,4,43,'Monday','October','f','f',NULL,8),(20171024,'2017-10-24',2017,10,24,4,43,'Tuesday','October','f','f',NULL,8),(20171025,'2017-10-25',2017,10,25,4,43,'Wednesday','October','f','f',NULL,8),(20171026,'2017-10-26',2017,10,26,4,43,'Thursday','October','f','f',NULL,8),(20171027,'2017-10-27',2017,10,27,4,43,'Friday','October','f','f',NULL,8),(20171028,'2017-10-28',2017,10,28,4,43,'Saturday','October','f','t',NULL,0),(20171029,'2017-10-29',2017,10,29,4,43,'Sunday','October','f','t',NULL,0),(20171030,'2017-10-30',2017,10,30,4,44,'Monday','October','f','f',NULL,8),(20171031,'2017-10-31',2017,10,31,4,44,'Tuesday','October','f','f',NULL,8),(20171101,'2017-11-01',2017,11,1,4,44,'Wednesday','November','f','f',NULL,8),(20171102,'2017-11-02',2017,11,2,4,44,'Thursday','November','f','f',NULL,8),(20171103,'2017-11-03',2017,11,3,4,44,'Friday','November','f','f',NULL,8),(20171104,'2017-11-04',2017,11,4,4,44,'Saturday','November','f','t',NULL,0),(20171105,'2017-11-05',2017,11,5,4,44,'Sunday','November','f','t',NULL,0),(20171106,'2017-11-06',2017,11,6,4,45,'Monday','November','f','f',NULL,8),(20171107,'2017-11-07',2017,11,7,4,45,'Tuesday','November','f','f',NULL,8),(20171108,'2017-11-08',2017,11,8,4,45,'Wednesday','November','f','f',NULL,8),(20171109,'2017-11-09',2017,11,9,4,45,'Thursday','November','f','f',NULL,8),(20171110,'2017-11-10',2017,11,10,4,45,'Friday','November','f','f',NULL,8),(20171111,'2017-11-11',2017,11,11,4,45,'Saturday','November','f','t',NULL,0),(20171112,'2017-11-12',2017,11,12,4,45,'Sunday','November','f','t',NULL,0),(20171113,'2017-11-13',2017,11,13,4,46,'Monday','November','f','f',NULL,8),(20171114,'2017-11-14',2017,11,14,4,46,'Tuesday','November','f','f',NULL,8),(20171115,'2017-11-15',2017,11,15,4,46,'Wednesday','November','f','f',NULL,8),(20171116,'2017-11-16',2017,11,16,4,46,'Thursday','November','f','f',NULL,8),(20171117,'2017-11-17',2017,11,17,4,46,'Friday','November','f','f',NULL,8),(20171118,'2017-11-18',2017,11,18,4,46,'Saturday','November','f','t',NULL,0),(20171119,'2017-11-19',2017,11,19,4,46,'Sunday','November','f','t',NULL,0),(20171120,'2017-11-20',2017,11,20,4,47,'Monday','November','f','f',NULL,8),(20171121,'2017-11-21',2017,11,21,4,47,'Tuesday','November','f','f',NULL,8),(20171122,'2017-11-22',2017,11,22,4,47,'Wednesday','November','f','f',NULL,8),(20171123,'2017-11-23',2017,11,23,4,47,'Thursday','November','f','f',NULL,8),(20171124,'2017-11-24',2017,11,24,4,47,'Friday','November','f','f',NULL,8),(20171125,'2017-11-25',2017,11,25,4,47,'Saturday','November','f','t',NULL,0),(20171126,'2017-11-26',2017,11,26,4,47,'Sunday','November','f','t',NULL,0),(20171127,'2017-11-27',2017,11,27,4,48,'Monday','November','f','f',NULL,8),(20171128,'2017-11-28',2017,11,28,4,48,'Tuesday','November','f','f',NULL,8),(20171129,'2017-11-29',2017,11,29,4,48,'Wednesday','November','f','f',NULL,8),(20171130,'2017-11-30',2017,11,30,4,48,'Thursday','November','f','f',NULL,8),(20171201,'2017-12-01',2017,12,1,4,48,'Friday','December','f','f',NULL,8),(20171202,'2017-12-02',2017,12,2,4,48,'Saturday','December','f','t',NULL,0),(20171203,'2017-12-03',2017,12,3,4,48,'Sunday','December','f','t',NULL,0),(20171204,'2017-12-04',2017,12,4,4,49,'Monday','December','f','f',NULL,8),(20171205,'2017-12-05',2017,12,5,4,49,'Tuesday','December','f','f',NULL,8),(20171206,'2017-12-06',2017,12,6,4,49,'Wednesday','December','f','f',NULL,8),(20171207,'2017-12-07',2017,12,7,4,49,'Thursday','December','f','f',NULL,8),(20171208,'2017-12-08',2017,12,8,4,49,'Friday','December','f','f',NULL,8),(20171209,'2017-12-09',2017,12,9,4,49,'Saturday','December','f','t',NULL,0),(20171210,'2017-12-10',2017,12,10,4,49,'Sunday','December','f','t',NULL,0),(20171211,'2017-12-11',2017,12,11,4,50,'Monday','December','f','f',NULL,8),(20171212,'2017-12-12',2017,12,12,4,50,'Tuesday','December','f','f',NULL,8),(20171213,'2017-12-13',2017,12,13,4,50,'Wednesday','December','f','f',NULL,8),(20171214,'2017-12-14',2017,12,14,4,50,'Thursday','December','f','f',NULL,8),(20171215,'2017-12-15',2017,12,15,4,50,'Friday','December','f','f',NULL,8),(20171216,'2017-12-16',2017,12,16,4,50,'Saturday','December','f','t',NULL,0),(20171217,'2017-12-17',2017,12,17,4,50,'Sunday','December','f','t',NULL,0),(20171218,'2017-12-18',2017,12,18,4,51,'Monday','December','f','f',NULL,8),(20171219,'2017-12-19',2017,12,19,4,51,'Tuesday','December','f','f',NULL,8),(20171220,'2017-12-20',2017,12,20,4,51,'Wednesday','December','f','f',NULL,8),(20171221,'2017-12-21',2017,12,21,4,51,'Thursday','December','f','f',NULL,8),(20171222,'2017-12-22',2017,12,22,4,51,'Friday','December','f','f',NULL,8),(20171223,'2017-12-23',2017,12,23,4,51,'Saturday','December','f','t',NULL,0),(20171224,'2017-12-24',2017,12,24,4,51,'Sunday','December','f','t',NULL,0),(20171225,'2017-12-25',2017,12,25,4,52,'Monday','December','f','f',NULL,8),(20171226,'2017-12-26',2017,12,26,4,52,'Tuesday','December','f','f',NULL,8),(20171227,'2017-12-27',2017,12,27,4,52,'Wednesday','December','f','f',NULL,8),(20171228,'2017-12-28',2017,12,28,4,52,'Thursday','December','f','f',NULL,8),(20171229,'2017-12-29',2017,12,29,4,52,'Friday','December','f','f',NULL,8),(20171230,'2017-12-30',2017,12,30,4,52,'Saturday','December','f','t',NULL,0),(20171231,'2017-12-31',2017,12,31,4,52,'Sunday','December','f','t',NULL,0);
/*!40000 ALTER TABLE `time_dimension` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userrole`
--

DROP TABLE IF EXISTS `userrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userrole` (
  `userrole_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `user_id` tinyint(4) DEFAULT NULL,
  `role_id` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`userrole_id`),
  UNIQUE KEY `user_id_role_id_UNIQUE` (`user_id`,`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userrole`
--

LOCK TABLES `userrole` WRITE;
/*!40000 ALTER TABLE `userrole` DISABLE KEYS */;
INSERT INTO `userrole` VALUES (3,1,1),(34,1,2),(6,4,1),(18,4,2),(4,5,1),(10,6,1),(41,6,2),(15,7,1);
/*!40000 ALTER TABLE `userrole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `access_id` varchar(250) NOT NULL,
  `salt` varchar(50) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name_UNIQUE` (`user_name`),
  UNIQUE KEY `access_id_UNIQUE` (`access_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','astaffer@mail.ru','$2a$10$jq9P/sjBL0d7.0dzDeLjee61byENxnS1r46LrhlQZSWlY/1a8wXae','$2a$10$jq9P/sjBL0d7.0dzDeLjee'),(4,'filaa','astaffer@mail.ru','$2a$10$gSO3NJooBj3Lx3t7COkvLuufIaBg2e26r7ys515stJZQz4KcTJ6aO','$2a$10$gSO3NJooBj3Lx3t7COkvLu'),(5,'astaff','astaffer@mail.ru','$2a$10$0MZmUCzDyIm30Y/ON1Tvpe8MHxbusvqqA5.R/ADipMRWLnu5ChVk.','$2a$10$0MZmUCzDyIm30Y/ON1Tvpe'),(6,'user','pwd@mail.ru','$2a$10$jFPPu6c0sO55YRQJXUr1O.LcpGwgOI6fuFsk5IcMlVfKfvVLlNT.u','$2a$10$jFPPu6c0sO55YRQJXUr1O.'),(7,'Dmitry','dm@dm.ru','$2a$10$BhpC0/RIWhBegwPDfMv.8OCfMdYrc6aEdnIqecQbfDNcu/XIRbbdO','$2a$10$BhpC0/RIWhBegwPDfMv.8O');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'sbox'
--
/*!50003 DROP FUNCTION IF EXISTS `count_hours` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `count_hours`(sensorid int,fromdate datetime, todate datetime) RETURNS int(11)
BEGIN
	DECLARE result int;
	DECLARE sensorType int;
    DECLARE deviceshifts float;
    DECLARE TD datetime;
    SET @deviceshifts = (SELECT device_shifts FROM device limit 1);
    SET @TD = NOW();
	IF sensorid = 0 then SET @result= (
								SELECT floor(sum(work_hours*@deviceshifts*3600)) FROM sbox.time_dimension WHERE db_date >=fromdate AND db_date <todate
								);
	ELSE    
		BEGIN                        
			SET @sensorType = (SELECT sensor_type FROM sensor WHERE sensor_id = sensorid);
			SET @result = 0; 
			IF @sensorType IS NOT NULL 
				THEN 
					IF @sensorType = 0 THEN
							SET @result = ( SELECT  sum(
									time_to_sec(
												timediff(
													(case when complete = 1 and stop_date > todate 
														then todate 
														when complete = 0 and todate  > @TD
														then @TD
														when complete = 0 and todate  <= @TD
														then todate
														else stop_date end),
													case when start_date < fromdate 
														then fromdate 
														else start_date end)))
									FROM sbox.int_data  
									where 
										sensor_id = sensorid and 
										fromdate < stop_date and
										todate > start_date);
					END IF;
			END IF;
		END;
    END IF;
RETURN @result;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `effects` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `effects`(fromdate datetime, todate datetime)
BEGIN
SELECT 
	bar_id,
	bar_label,
	bar_color,
	sort_order,
    bar_type,
	IFNULL((select count_hours(sensor_id,fromdate,todate)),0) as hours
FROM sbox.effectsbar
ORDER by sort_order, bar_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `fill_date_dimension` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `fill_date_dimension`(IN startdate DATE,IN stopdate DATE)
BEGIN
    DECLARE currentdate DATE;
    SET currentdate = startdate;
    WHILE currentdate < stopdate DO
        INSERT INTO time_dimension VALUES (
                        YEAR(currentdate)*10000+MONTH(currentdate)*100 + DAY(currentdate),
                        currentdate,
                        YEAR(currentdate),
                        MONTH(currentdate),
                        DAY(currentdate),
                        QUARTER(currentdate),
                        WEEKOFYEAR(currentdate),
                        DATE_FORMAT(currentdate,'%W'),
                        DATE_FORMAT(currentdate,'%M'),
                        'f',
                        CASE DAYOFWEEK(currentdate) WHEN 1 THEN 't' WHEN 7 then 't' ELSE 'f' END,
                        NULL);
        SET currentdate = ADDDATE(currentdate,INTERVAL 1 DAY);
    END WHILE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `gauges` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `gauges`(todate datetime)
BEGIN
SELECT gauge_id  ,
    gauge_label  ,
    gauge_unit  ,
    sort_order  ,
	init_value   ,
	limit_value  ,
	start_green  ,
	start_yellow  ,
	start_red  ,
	sensor_id  ,
    init_date  ,
	mileage_date ,
 IFNULL(count_hours(g.sensor_id,g.init_date,todate),0) as value,
 IFNULL(count_hours(g.sensor_id,g.mileage_date,todate),0) as mileage_value
FROM sbox.servicegauge g;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-24 22:18:47
