/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50547
Source Host           : localhost:3306
Source Database       : chart

Target Server Type    : MYSQL
Target Server Version : 50547
File Encoding         : 65001

Date: 2019-03-08 11:27:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for chart
-- ----------------------------
DROP TABLE IF EXISTS `chart`;
CREATE TABLE `chart` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `score` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of chart
-- ----------------------------
INSERT INTO `chart` VALUES ('1', '小明', '80');
INSERT INTO `chart` VALUES ('2', '小红', '90');
INSERT INTO `chart` VALUES ('3', '小黑', '70');
INSERT INTO `chart` VALUES ('4', '小白', '85');
INSERT INTO `chart` VALUES ('5', '小黄', '95');
