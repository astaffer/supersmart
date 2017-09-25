SET GLOBAL log_bin_trust_function_creators = 1;

DROP PROCEDURE `sbox`.`effects`;
DROP FUNCTION `sbox`.`count_hours`;


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
