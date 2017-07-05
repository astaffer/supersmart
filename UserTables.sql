
DROP TABLE IF EXISTS `role`;
 
CREATE TABLE `role` (
  `role_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
 
INSERT INTO `role` VALUES ('admin'),('user');
 

--
-- Table structure for table `userrole`
--

DROP TABLE IF EXISTS `userrole`;
CREATE TABLE `userrole` (
  `userrole_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `user_id` tinyint(4) DEFAULT NULL,
  `role_id` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`userrole_id`),
  UNIQUE KEY `user_id_role_id_UNIQUE` (`user_id`,`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
  
 INSERT INTO `userrole` VALUES (1,1);
 
--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `access_id` varchar(250) NOT NULL,
  `salt` varchar(50) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name_UNIQUE` (`user_name`),
  UNIQUE KEY `access_id_UNIQUE` (`access_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
 
INSERT INTO `users` VALUES ('admin','astaffer@mail.ru','$2a$10$jq9P/sjBL0d7.0dzDeLjee61byENxnS1r46LrhlQZSWlY/1a8wXae','$2a$10$jq9P/sjBL0d7.0dzDeLjee'),('user','pwd@mail.ru','$2a$10$jFPPu6c0sO55YRQJXUr1O.LcpGwgOI6fuFsk5IcMlVfKfvVLlNT.u','$2a$10$jFPPu6c0sO55YRQJXUr1O.');

-- Dump completed on 2017-07-02  9:43:26
