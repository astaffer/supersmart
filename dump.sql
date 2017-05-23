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
-- Table structure for table `device`
--

DROP TABLE IF EXISTS `device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device` (
  `device_id` int(11) NOT NULL,
  `device_name` varchar(100) NOT NULL,
  PRIMARY KEY (`device_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `int_values`
--

DROP TABLE IF EXISTS `int_values`;
/*!50001 DROP VIEW IF EXISTS `int_values`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `int_values` (
  `sensor_id` tinyint NOT NULL,
  `date_start` tinyint NOT NULL,
  `date_end` tinyint NOT NULL,
  `int_value` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `intdata`
--

DROP TABLE IF EXISTS `intdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `intdata` (
  `int_id` int(11) NOT NULL AUTO_INCREMENT,
  `sensor_id` tinyint(4) NOT NULL,
  `int_date` datetime NOT NULL,
  `int_value` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`int_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sensor`
--

DROP TABLE IF EXISTS `sensor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sensor` (
  `sensor_id` tinyint(4) NOT NULL,
  `sensor_name` varchar(100) NOT NULL,
  `sensor_type` enum('Int','Dec') DEFAULT NULL,
  PRIMARY KEY (`sensor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
CREATE DEFINER=`root`@`localhost` FUNCTION `count_hours`(sensorid int,fromdate date, todate date) RETURNS int(11)
BEGIN
	DECLARE result int;
	DECLARE sensorType enum('Int','Dec');
	IF sensorid = 0 then SET @result= (
								SELECT sum(work_hours) FROM sbox.time_dimension WHERE db_date >=fromdate AND db_date <todate
								);
	ELSE    
		BEGIN                        
			SET @sensorType = (SELECT sensor_type FROM SENSOR WHERE sensor_id = sensorid);
			SET @result = 0; 
			IF @sensorType IS NOT NULL 
				THEN 
					IF @sensorType = 'Int' THEN
							SET @result = ( SELECT
									sum(
									time_to_sec(timediff(case when date_end > todate then todate else date_end end,
									case when date_start < fromdate then fromdate else date_start end
									))/3600) as caks
								 FROM sbox.int_values
								where 
									sensor_id = sensorid and 
									fromdate < date_end and
									todate > date_start and
									int_value = 1);
					ELSE 
						SET @result = (select count(*)
							from (SELECT 
								date( dec_date )
								,hour( dec_date )
								, count(*)
							FROM 
								sbox.decdata
							WHERE sensor_id = sensorid
								AND dec_date >=fromdate
								AND dec_date <todate
							GROUP BY 
								hour( dec_date )
								,date( dec_date )
							HAVING 
								count(*) > 0) HOURS);
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `effects`(fromdate date, todate date)
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

--
-- Final view structure for view `int_values`
--

/*!50001 DROP TABLE IF EXISTS `int_values`*/;
/*!50001 DROP VIEW IF EXISTS `int_values`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `int_values` AS (select `base`.`sensor_id` AS `sensor_id`,min(`base`.`int_date`) AS `date_start`,(select `intdata`.`int_date` from `intdata` where ((`intdata`.`sensor_id` = `base`.`sensor_id`) and (`intdata`.`int_date` > `base`.`int_date`) and (`intdata`.`int_value` <> `base`.`int_value`)) order by `intdata`.`int_date` limit 1) AS `date_end`,`base`.`int_value` AS `int_value` from `intdata` `base` group by `base`.`sensor_id`,`base`.`int_value`,`date_end`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-24  0:05:08
