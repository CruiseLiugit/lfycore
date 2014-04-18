/*
MySQL Data Transfer
Source Host: localhost
Source Database: test
Target Host: localhost
Target Database: test
Date: 2014/2/19 20:30:39
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for phome_enewsloginfail
-- ----------------------------
CREATE TABLE `phome_enewsloginfail` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `num` int(10) DEFAULT '0',
  `lasttime` datetime DEFAULT NULL,
  `ip` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records 
-- ----------------------------
