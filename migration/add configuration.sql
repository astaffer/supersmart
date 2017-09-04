CREATE TABLE `configuration` (
  `config_id` int(11) NOT NULL AUTO_INCREMENT,
  `config_name` varchar(45) NOT NULL,
  `effects` varchar(5000) NOT NULL,
  `sensors` varchar(5000) NOT NULL,
  `device` varchar(5000) NOT NULL,
  `gauges` varchar(5000) NOT NULL,
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
