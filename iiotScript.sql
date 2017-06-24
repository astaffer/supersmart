CREATE USER 'sparkuser'@'localhost' IDENTIFIED BY '123123';
CREATE DATABASE sbox
	DEFAULT CHARACTER SET utf8
	DEFAULT COLLATE utf8_general_ci;
GRANT ALL PRIVILEGES ON   sbox.* TO 'sparkuser'@'localhost';
USE sbox;
CREATE TABLE Sensor(
    sensor_id tinyint PRIMARY KEY,
    sensor_name varchar(100) not null,
    sensor_type enum ('Int','Dec') 
);
CREATE TABLE Users(
    user_id tinyint auto_increment PRIMARY KEY,
    user_name  varchar(50) not null,
    user_email varchar(100) not null,
    user_login varchar(50) not null,
    access_id  varchar(50) not null
);
CREATE TABLE Role(
    role_id tinyint auto_increment PRIMARY KEY,
    role_name  varchar(50) not null
);
CREATE TABLE UserRole(
	userrole_id tinyint auto_increment PRIMARY KEY,
    user_id tinyint ,
    role_id tinyint
);
CREATE TABLE DecData(
    dec_id int auto_increment PRIMARY KEY,
    sensor_id tinyint not null,
    dec_date datetime not null,
    dec_value decimal(8,2) 
);

CREATE TABLE IntData(
    int_id int auto_increment PRIMARY KEY,
    sensor_id tinyint not null,
    int_date datetime not null,
    int_value tinyint
);
CREATE TABLE EffectsBar(
    bar_id int auto_increment PRIMARY KEY,
    bar_label varchar(100) not null,
    bar_color varchar(100) not null,
    bar_type enum ('Plan','SensorOn','SensorOff') ,
    sensor_id tinyint not null,
    sort_order tinyint not null
);
INSERT INTO `sbox`.`sensor`
(`sensor_id`,
`sensor_name`,
`sensor_type`)
VALUES
(1,'Power','Int'),
(2,'Light','Int'),
(3,'Pull Engine','Int'),
(4,'Water pump','Int'),
(5,'Min water','Int'),
(6,'Preasure diff','Int')
;
CREATE TABLE servicegauge(
    gauge_id tinyint auto_increment PRIMARY KEY,
    gauge_label varchar(30) not null,
    gauge_unit varchar(10) not null,
    sort_order tinyint not null,
	init_value  int not null,
	limit_value int not null,
	start_green int not null,
	start_yellow int not null,
	start_red int not null,
	sensor_id tinyint not null,
    init_date datetime not null,
	mileage_date datetime not null
);
CREATE TABLE Device(
    device_id int PRIMARY KEY,
    device_name varchar(100) not null
);
DELIMITER $$
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
END$$
DELIMITER ;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `int_values` AS (select `base`.`sensor_id` AS `sensor_id`,min(`base`.`int_date`) AS `date_start`,(select `intdata`.`int_date` from `intdata` where ((`intdata`.`sensor_id` = `base`.`sensor_id`) and (`intdata`.`int_date` > `base`.`int_date`) and (`intdata`.`int_value` <> `base`.`int_value`)) order by `intdata`.`int_date` limit 1) AS `date_end`,`base`.`int_value` AS `int_value` from `intdata` `base` group by `base`.`sensor_id`,`base`.`int_value`,`date_end`);

DELIMITER $$
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
END$$
DELIMITER ;
DELIMITER $$
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
 IFNULL(count_hours(g.sensor_id,g.init_date,todate),0) as value
FROM sbox.servicegauge g;
END$$
DELIMITER ;

INSERT INTO `sensor` VALUES (1,'Power',0),(2,'Light',0),(3,'Pull Engine',0),(4,'Water pump',0),(5,'Min water',0),(6,'Preasure diff',0);
