/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50724
Source Host           : localhost:3306
Source Database       : match

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2019-06-30 11:10:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for match_list
-- ----------------------------
DROP TABLE IF EXISTS `match_list`;
CREATE TABLE `match_list` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `match_name` varchar(50) DEFAULT NULL,
  `match_type` varchar(20) DEFAULT NULL,
  `applicant` varchar(20) DEFAULT NULL,
  `reviewer` varchar(20) DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  `place` varchar(50) DEFAULT NULL,
  `recorder` varchar(20) DEFAULT NULL,
  `result` varchar(50) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `applicant` (`applicant`),
  KEY `reviewer` (`reviewer`),
  KEY `recorder` (`recorder`),
  CONSTRAINT `applicant` FOREIGN KEY (`applicant`) REFERENCES `user` (`realname`),
  CONSTRAINT `recorder` FOREIGN KEY (`recorder`) REFERENCES `user` (`realname`),
  CONSTRAINT `reviewer` FOREIGN KEY (`reviewer`) REFERENCES `user` (`realname`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of match_list
-- ----------------------------
INSERT INTO `match_list` VALUES ('9', '第一次乒乓球比赛', '乒乓球', '张三', '张三', '2019-06-04 15:00:00', '1号台, 2号台', '张三', '无', '已结束');
INSERT INTO `match_list` VALUES ('10', '第一次乒乓球比赛', '乒乓球', '张三', '张三', '2019-06-11 16:00:00', '3号台, 5号台', null, '若未通过，请写明未通过的原因', '已通过');
INSERT INTO `match_list` VALUES ('11', '第一次乒乓球比赛', '乒乓球', '张三', '张三', '2019-06-29 14:00:00', '3号台, 4号台', null, '若未通过，请写明未通过的原因', '未通过');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `username` varchar(20) NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  `realname` varchar(20) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`username`),
  KEY `realname` (`realname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('aaaaaa', '123456', '李四', '普通用户');
INSERT INTO `user` VALUES ('zzzzzz', '123456', '张三', '管理员');
