/*
MySQL Data Transfer
Source Host: localhost
Source Database: test
Target Host: localhost
Target Database: test
Date: 2014/2/19 20:30:26
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for phome_enewsgroup
-- ----------------------------
CREATE TABLE `phome_enewsgroup` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `groupname` varchar(50) NOT NULL,
  `dopublic` tinyint(4) DEFAULT '1' COMMENT '1 有权限 0无权限',
  `groupCode` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records 
-- ----------------------------
