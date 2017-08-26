ALTER TABLE `sbox`.`sensor` 
CHANGE COLUMN `sensor_type` `sensor_type` TINYINT(1) NOT NULL DEFAULT 0 ,
ADD COLUMN `sensor_hide`   TINYINT(1) NOT NULL DEFAULT 0 ;