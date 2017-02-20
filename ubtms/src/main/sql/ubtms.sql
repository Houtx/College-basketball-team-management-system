/*
Navicat MySQL Data Transfer

Source Server         : ubtms
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : ubtms

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2017-02-20 20:22:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `content` text,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `article_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------

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
  `time` timestamp NULL DEFAULT NULL,
  `school_id` int(11) NOT NULL,
  PRIMARY KEY (`bill_id`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `school` (`sch_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bill
-- ----------------------------

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `content` text,
  `article_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `article_id` (`article_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`),
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
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
  `role_id` int(11) DEFAULT NULL,
  `state` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_ibfk_1` (`role_id`),
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '&#xe62d;', '人员管理', '3', '1', '1');
INSERT INTO `menu` VALUES ('2', '&#xe62d;', '球队管理', '1', '1', '1');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `type` tinyint(4) DEFAULT NULL COMMENT '1增 2删 3改 4查 禁用即修改',
  `state` tinyint(4) DEFAULT NULL COMMENT '1启用状态 0禁用状态',
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  CONSTRAINT `permission_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `sub_menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', '1', '1', '1', null);
INSERT INTO `permission` VALUES ('2', '1', '2', '1', null);
INSERT INTO `permission` VALUES ('3', '1', '3', '1', null);
INSERT INTO `permission` VALUES ('4', '1', '4', '1', null);
INSERT INTO `permission` VALUES ('5', '2', '1', '1', null);
INSERT INTO `permission` VALUES ('6', '2', '2', '1', null);
INSERT INTO `permission` VALUES ('7', '2', '3', '1', null);
INSERT INTO `permission` VALUES ('8', '2', '4', '1', null);
INSERT INTO `permission` VALUES ('9', '3', '1', '1', null);
INSERT INTO `permission` VALUES ('10', '3', '2', '1', null);
INSERT INTO `permission` VALUES ('11', '3', '3', '1', null);
INSERT INTO `permission` VALUES ('12', '3', '4', '1', null);
INSERT INTO `permission` VALUES ('13', '4', '1', '1', null);
INSERT INTO `permission` VALUES ('14', '4', '2', '1', null);
INSERT INTO `permission` VALUES ('15', '4', '3', '1', null);
INSERT INTO `permission` VALUES ('16', '4', '4', '1', null);

-- ----------------------------
-- Table structure for player_data
-- ----------------------------
DROP TABLE IF EXISTS `player_data`;
CREATE TABLE `player_data` (
  `id` int(11) NOT NULL,
  `score` int(11) DEFAULT NULL,
  `shot` int(11) DEFAULT NULL COMMENT '出手',
  `field_goal` int(11) DEFAULT NULL COMMENT '命中球数',
  `three_point_shot` int(11) DEFAULT NULL,
  `three_point_shot_goal` int(11) DEFAULT NULL COMMENT '三分球命中个数',
  `backboard` int(11) DEFAULT NULL COMMENT '篮板',
  `assist` int(11) DEFAULT NULL,
  `steal` int(11) DEFAULT NULL COMMENT '抢断',
  `blockshot` int(11) DEFAULT NULL,
  `turnover` int(11) DEFAULT NULL COMMENT '失误',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of player_data
-- ----------------------------

-- ----------------------------
-- Table structure for reply
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `content` text,
  `comment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `article_id` (`comment_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `reply_ibfk_1` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`id`),
  CONSTRAINT `reply_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reply
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
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(20) DEFAULT NULL,
  `school_id` int(11) NOT NULL,
  `state` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_ibfk_2` (`school_id`),
  CONSTRAINT `role_ibfk_2` FOREIGN KEY (`school_id`) REFERENCES `school` (`sch_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '超级系统管理员', '1', '1');
INSERT INTO `role` VALUES ('2', '系统管理员', '1', '1');
INSERT INTO `role` VALUES ('3', '教练', '2', '1');
INSERT INTO `role` VALUES ('4', '球员', '2', '1');
INSERT INTO `role` VALUES ('5', '球队领队', '2', '1');
INSERT INTO `role` VALUES ('6', 'xxx', '1', '0');
INSERT INTO `role` VALUES ('7', 'dvik', '1', '1');
INSERT INTO `role` VALUES ('8', 'cxbn', '1', '1');
INSERT INTO `role` VALUES ('9', 'dsssd', '1', '1');
INSERT INTO `role` VALUES ('10', '22', '1', '1');
INSERT INTO `role` VALUES ('11', 'gnvgm', '1', '1');

-- ----------------------------
-- Table structure for school
-- ----------------------------
DROP TABLE IF EXISTS `school`;
CREATE TABLE `school` (
  `sch_id` int(11) NOT NULL AUTO_INCREMENT,
  `sch_name` varchar(60) NOT NULL,
  `sch_logo` text,
  `state` tinyint(4) DEFAULT NULL COMMENT '0启用 1禁用',
  `introduction` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`sch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of school
-- ----------------------------
INSERT INTO `school` VALUES ('1', '系统', '1486812729623.jpg', '1', '在在');
INSERT INTO `school` VALUES ('2', '北理珠', '1486813342607.jpg', '0', 'fsdgfsdgdfg');
INSERT INTO `school` VALUES ('15', '北师珠13', null, '0', null);
INSERT INTO `school` VALUES ('21', 'sdfsdf', '1486641897458.jpg', '0', 'sdfsdfsdf');
INSERT INTO `school` VALUES ('23', 'ssssssssssssss', null, null, 'sdf');
INSERT INTO `school` VALUES ('24', 'sdfsdfsssssssss', null, '1', 'sadf');
INSERT INTO `school` VALUES ('25', '测试state1', null, '1', '');
INSERT INTO `school` VALUES ('26', 'fhfgh', null, '1', 'fdghd');
INSERT INTO `school` VALUES ('27', '测试', null, '1', '');
INSERT INTO `school` VALUES ('28', '测试3', '1486778992212.jpg', '1', '');
INSERT INTO `school` VALUES ('29', '地', null, '1', '');
INSERT INTO `school` VALUES ('30', 'ddfvdxvdv', '1486793243506.jpg', '1', 'dfvdfvdvdfv');
INSERT INTO `school` VALUES ('31', '你大爷啊', '1486793853620.jpg', '1', '嗯嗯，不是你大爷');
INSERT INTO `school` VALUES ('32', '鑫', '1486797901804.jpg', '1', '绂');
INSERT INTO `school` VALUES ('33', '测试机', '1486799729824.jpg', '1', 'asdfsdafsdfdsf');
INSERT INTO `school` VALUES ('34', '你妹啊', '1486806946180.jpg', '1', '呵呵');
INSERT INTO `school` VALUES ('39', 'dsfsdfdf', '1486877336940.jpg', '1', 'sdfsdfdd');

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
  `state` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  CONSTRAINT `sub_menu_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sub_menu
-- ----------------------------
INSERT INTO `sub_menu` VALUES ('1', '1', '/school/schoolMngPage', '学校管理', '2', '1');
INSERT INTO `sub_menu` VALUES ('2', '1', '/role/roleMngPage', '角色管理', '3', '1');
INSERT INTO `sub_menu` VALUES ('3', '1', '/user/userMngPage', '人员管理', '1', '1');
INSERT INTO `sub_menu` VALUES ('4', '2', '/game/gameMngPage', '赛程管理', '1', '1');

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
  `state` tinyint(4) NOT NULL COMMENT '1启用 0禁用',
  `height` float DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `grade` varchar(50) DEFAULT NULL,
  `shirt_num` tinyint(4) DEFAULT NULL COMMENT '球衣号码',
  `duty` tinyint(4) DEFAULT NULL COMMENT '1-5表示1到5号位',
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `user_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('2', '13160672601', '123', '哈哈哈', '1', null, '1', null, null, null, null, null, '1');
INSERT INTO `user` VALUES ('3', 'admin', '123456', '系统管理员1', '0', null, '1', null, null, null, null, null, '1');
INSERT INTO `user` VALUES ('4', '13160672604', 'sdfsdasfasd', '教练', '1', null, '1', null, null, null, null, null, '3');
INSERT INTO `user` VALUES ('5', '13160672621', '123456', '球员', '1', '1487480787259.jpg', '1', '111', '222', '112323', '11', '3', '4');
INSERT INTO `user` VALUES ('6', '13152587415', '58745138587', '领队', '1', '1487480787259.jpg', '1', null, null, '', null, null, '5');
INSERT INTO `user` VALUES ('8', '13254156748', '5416354135', '叶', '1', '1487480816379.jpg', '1', null, null, '', null, null, '5');
INSERT INTO `user` VALUES ('9', '13254156748', '5416354135', '叶', '1', '1487480963277.jpg', '1', '541', '3541', '大三', '11', '1', '4');
INSERT INTO `user` VALUES ('10', '13152158745', 'sadfsdaf', '肖', '1', '', '1', '111', '11', 'sadf', '111', '1', '4');
INSERT INTO `user` VALUES ('11', '13160672584', 'asddasdf', '叶', '0', '', '1', '1212', '333', '212', '111', '1', '4');
INSERT INTO `user` VALUES ('12', '13160672222', 'asddasdf', '叶', '0', '', '1', '1212', '333', '212', '111', '1', '4');
INSERT INTO `user` VALUES ('13', '13160672221', 'asddasdf', '叶', '0', '', '1', '1212', '333', '212', '111', '1', '4');
INSERT INTO `user` VALUES ('14', '13162587158', '3213213', '135', '1', '1487481474906.jpg', '1', '213', '321', '131', '11', '1', '4');
SET FOREIGN_KEY_CHECKS=1;
