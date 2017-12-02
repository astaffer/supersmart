SET GLOBAL log_bin_trust_function_creators = 1;

USE `sbox`;
  alter table `effectsbar` add column `bar_colors` varchar(5000) NOT NULL DEFAULT '';
  
DROP PROCEDURE `sbox`.`effects`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `effects`(fromdate datetime, todate datetime)
BEGIN
SELECT 
	bar_id,
	bar_label,
	bar_color,
	sort_order,
    bar_type,
    bar_colors,
	IFNULL((select count_hours(sensor_id,fromdate,todate)),0) as hours
FROM sbox.effectsbar
ORDER by sort_order, bar_id;
END$$
DELIMITER ;
