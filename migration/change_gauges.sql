ALTER TABLE `sbox`.`servicegauge` 
ADD COLUMN `detail` VARCHAR(45) NOT NULL AFTER `mileage_date`;

USE `sbox`;
DROP procedure IF EXISTS `gauges`;

DELIMITER $$
USE `sbox`$$
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
    detail,
 IFNULL(count_hours(g.sensor_id,g.init_date,todate),0) as value,
 IFNULL(count_hours(g.sensor_id,g.mileage_date,todate),0) as mileage_value
FROM sbox.servicegauge g;
END$$

DELIMITER ;

update servicegauge set detail='hour';
