/*
MySQL Data Transfer
Source Host: localhost
Source Database: test
Target Host: localhost
Target Database: test
Date: 2014/2/19 20:30:57
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for phome_enewsuserclass
-- ----------------------------
CREATE TABLE `phome_enewsuserclass` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `classCode` varchar(50) NOT NULL,
  `classname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records 
-- ----------------------------
