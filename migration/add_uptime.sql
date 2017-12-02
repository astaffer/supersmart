SET GLOBAL log_bin_trust_function_creators = 1;
USE `sbox`;
 ALTER TABLE `sbox`.`device` 
ADD COLUMN `device_uptime` DATETIME NOT NULL AFTER `device_shifts`;

USE `sbox`;
DROP function IF EXISTS `count_hours`;

DELIMITER $$
USE `sbox`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `count_hours`(sensorid int,fromdate datetime, todate datetime) RETURNS int(11)
BEGIN
	DECLARE result int;
	DECLARE sensorType int;
    DECLARE deviceshifts float;
    DECLARE TD datetime;
    SET @deviceshifts = (SELECT device_shifts FROM device limit 1);
    SET @TD = NOW();
    IF fromdate > todate then RETURN 0; END IF;
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
										(fromdate < stop_date and todate > start_date
                                        or fromdate > start_date and complete = 0)
                                        );
					END IF;
			END IF;
		END;
    END IF;
RETURN @result;
END$$

DELIMITER ;

