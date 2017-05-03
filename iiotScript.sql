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