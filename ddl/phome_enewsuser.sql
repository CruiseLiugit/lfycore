/*
MySQL Data Transfer
Source Host: localhost
Source Database: test
Target Host: localhost
Target Database: test
Date: 2014/2/19 20:30:45
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for phome_enewsuser
-- ----------------------------
CREATE TABLE `phome_enewsuser` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `preUserCode` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `phome_enewsuser` VALUES ('1', '004b5595-8b13-4865-9647-e3640660b59f', '海角七号18', 'F59BD65F7EDAFB087A81D4DCA06C4910', '2014-02-19 14:48:44', '1');
