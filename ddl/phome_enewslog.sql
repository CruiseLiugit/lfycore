/*
MySQL Data Transfer
Source Host: localhost
Source Database: test
Target Host: localhost
Target Database: test
Date: 2014/2/19 20:30:32
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for phome_enewslog
-- ----------------------------
CREATE TABLE `phome_enewslog` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `logintime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records 
-- ----------------------------
