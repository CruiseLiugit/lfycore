/*
MySQL Data Transfer
Source Host: localhost
Source Database: test
Target Host: localhost
Target Database: test
Date: 2014/2/19 20:30:19
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for phome_enewsdolog
-- ----------------------------
CREATE TABLE `phome_enewsdolog` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `logip` varchar(20) NOT NULL,
  `logtime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records 
-- ----------------------------
