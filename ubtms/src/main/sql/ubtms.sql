/*
Navicat MySQL Data Transfer

Source Server         : ubtms
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : ubtms

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2017-01-13 20:59:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for attendance
-- ----------------------------
DROP TABLE IF EXISTS `attendance`;
CREATE TABLE `attendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attend` tinyint(4) NOT NULL COMMENT '0到 1未到',
  `absence_type` tinyint(4) DEFAULT NULL COMMENT '0无故缺勤 1病假 2事假',
  `user_id` int(11) DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of attendance
-- ----------------------------

-- ----------------------------
-- Table structure for bill
-- ----------------------------
DROP TABLE IF EXISTS `bill`;
CREATE TABLE `bill` (
  `bill_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) DEFAULT NULL COMMENT '1衣\n2食\n3住\n4行',
  `remark` varchar(45) DEFAULT NULL,
  `pay` varchar(45) DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `school_id` int(11) NOT NULL,
  PRIMARY KEY (`bill_id`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `school` (`sch_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bill
-- ----------------------------

-- ----------------------------
-- Table structure for game
-- ----------------------------
DROP TABLE IF EXISTS `game`;
CREATE TABLE `game` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_time` timestamp NULL DEFAULT NULL,
  `rival` varchar(100) DEFAULT NULL COMMENT '对手',
  `place` varchar(100) DEFAULT NULL COMMENT '地点',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `school_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `game_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `school` (`sch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of game
-- ----------------------------

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `icon` varchar(20) DEFAULT NULL,
  `name` varchar(20) NOT NULL,
  `sort` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------

-- ----------------------------
-- Table structure for player_data
-- ----------------------------
DROP TABLE IF EXISTS `player_data`;
CREATE TABLE `player_data` (
  `id` int(11) NOT NULL,
  `score` tinyint(4) DEFAULT NULL,
  `shot` int(11) DEFAULT NULL COMMENT '出手',
  `field_goal` tinyint(4) DEFAULT NULL COMMENT '命中球数',
  `three_point_shot` tinyint(4) DEFAULT NULL,
  `three_point_shot_goal` tinyint(4) DEFAULT NULL COMMENT '三分球命中个数',
  `backboard` tinyint(4) DEFAULT NULL COMMENT '篮板',
  `assist` tinyint(4) DEFAULT NULL,
  `steal` tinyint(4) DEFAULT NULL COMMENT '抢断',
  `blockshot` tinyint(4) DEFAULT NULL,
  `turnover` tinyint(4) DEFAULT NULL COMMENT '失误',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of player_data
-- ----------------------------

-- ----------------------------
-- Table structure for right
-- ----------------------------
DROP TABLE IF EXISTS `right`;
CREATE TABLE `right` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `type` tinyint(4) DEFAULT NULL COMMENT '0查 1增 2改 3删',
  `state` tinyint(4) DEFAULT NULL COMMENT '0启用 1禁用',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  CONSTRAINT `right_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `sub_menu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of right
-- ----------------------------

-- ----------------------------
-- Table structure for rival_player_data
-- ----------------------------
DROP TABLE IF EXISTS `rival_player_data`;
CREATE TABLE `rival_player_data` (
  `id` int(11) NOT NULL,
  `player_name` varchar(12) NOT NULL,
  `school_name` varchar(60) DEFAULT NULL,
  `duty` tinyint(4) DEFAULT NULL,
  `game_id` int(11) NOT NULL,
  `data_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `data_id` (`data_id`),
  KEY `game_id` (`game_id`),
  CONSTRAINT `rival_player_data_ibfk_1` FOREIGN KEY (`data_id`) REFERENCES `player_data` (`id`),
  CONSTRAINT `rival_player_data_ibfk_2` FOREIGN KEY (`game_id`) REFERENCES `game` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rival_player_data
-- ----------------------------

-- ----------------------------
-- Table structure for school
-- ----------------------------
DROP TABLE IF EXISTS `school`;
CREATE TABLE `school` (
  `sch_id` int(11) NOT NULL AUTO_INCREMENT,
  `sch_name` varchar(60) NOT NULL,
  `sch_logo` text,
  `state` tinyint(4) DEFAULT NULL COMMENT '0启用 1禁用',
  ` introduction` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`sch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of school
-- ----------------------------

-- ----------------------------
-- Table structure for school_player_data
-- ----------------------------
DROP TABLE IF EXISTS `school_player_data`;
CREATE TABLE `school_player_data` (
  `id` int(11) NOT NULL,
  `player_id` int(11) DEFAULT NULL,
  `game_id` int(11) DEFAULT NULL COMMENT '出手',
  `data_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `game_id` (`game_id`),
  KEY `player_id` (`player_id`),
  KEY `data_id` (`data_id`),
  CONSTRAINT `school_player_data_ibfk_1` FOREIGN KEY (`game_id`) REFERENCES `game` (`id`),
  CONSTRAINT `school_player_data_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `user` (`id`),
  CONSTRAINT `school_player_data_ibfk_3` FOREIGN KEY (`data_id`) REFERENCES `player_data` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of school_player_data
-- ----------------------------

-- ----------------------------
-- Table structure for sub_menu
-- ----------------------------
DROP TABLE IF EXISTS `sub_menu`;
CREATE TABLE `sub_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `url` varchar(200) NOT NULL,
  `name` varchar(20) NOT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  CONSTRAINT `sub_menu_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `menu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sub_menu
-- ----------------------------

-- ----------------------------
-- Table structure for training
-- ----------------------------
DROP TABLE IF EXISTS `training`;
CREATE TABLE `training` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `school_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `training_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `school` (`sch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of training
-- ----------------------------

-- ----------------------------
-- Table structure for training_item
-- ----------------------------
DROP TABLE IF EXISTS `training_item`;
CREATE TABLE `training_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item` tinyint(4) DEFAULT NULL COMMENT '1身体训练 \n2 技术训练  \n3 战术训练\n4 理论知识',
  `content` varchar(100) DEFAULT NULL COMMENT '训练内容',
  `cost` tinyint(4) DEFAULT NULL COMMENT '训练花费时间',
  `day` tinyint(4) NOT NULL COMMENT '1-5代表星期一至星期五',
  `trainging_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `trainging_id` (`trainging_id`),
  CONSTRAINT `training_item_ibfk_1` FOREIGN KEY (`trainging_id`) REFERENCES `training` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of training_item
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(11) NOT NULL COMMENT '11位手机号码',
  `password` varchar(16) NOT NULL COMMENT '密码限制6-16位',
  `real_name` varchar(12) NOT NULL,
  `sex` tinyint(4) DEFAULT NULL COMMENT '0女性 1男性',
  `head_pic` text,
  `type` tinyint(4) NOT NULL,
  `state` tinyint(4) NOT NULL,
  `height` float DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `grade` varchar(50) DEFAULT NULL,
  `shirt_num` tinyint(4) DEFAULT NULL COMMENT '球衣号码',
  `duty` tinyint(4) DEFAULT NULL COMMENT '1-5表示1到5号位',
  `school_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_ibfk_1` (`school_id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `school` (`sch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
SET FOREIGN_KEY_CHECKS=1;
