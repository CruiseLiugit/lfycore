/*
MySQL Data Transfer
Source Host: localhost
Source Database: test
Target Host: localhost
Target Database: test
Date: 2014/2/19 22:59:28
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for phome_enewsuseradd
-- ----------------------------
CREATE TABLE `phome_enewsuseradd` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionCode` varchar(50) NOT NULL,
  `equestion` varchar(200) DEFAULT NULL,
  `eanswer` varchar(500) DEFAULT NULL,
  `preUserCode` varchar(50) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `phome_enewsuseradd` VALUES ('1', '2345', 'how are you', 'i am fine', 'dfd', '1', '2014-02-19 22:57:10');
