USE `sbox`;
ALTER TABLE `sbox`.`device` 
ADD COLUMN `device_shifts` FLOAT UNSIGNED NOT NULL AFTER `device_name`;

USE `sbox`;
DROP function IF EXISTS `count_hours`;

DELIMITER $$
USE `sbox`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `count_hours`(sensorid int,fromdate date, todate date) RETURNS int(11)
BEGIN 
	DECLARE result int;
	DECLARE sensorType int;
    DECLARE deviceshifts float;
    SET @deviceshifts = (SELECT device_shifts FROM device limit 1);
    
	IF sensorid = 0 then SET @result= (
								SELECT floor(sum(work_hours*@deviceshifts)) FROM sbox.time_dimension WHERE db_date >=fromdate AND db_date <todate
								);
	ELSE    
		BEGIN                        
			SET @sensorType = (SELECT sensor_type FROM sensor WHERE sensor_id = sensorid);
			SET @result = 0; 
			IF @sensorType IS NOT NULL 
				THEN 
					IF @sensorType = 0 THEN
							SET @result = ( SELECT
									floor(sum(
									time_to_sec(timediff(case when date_end > todate then todate else date_end end,
									case when date_start < fromdate then fromdate else date_start end
									))/3600)) as caks
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


