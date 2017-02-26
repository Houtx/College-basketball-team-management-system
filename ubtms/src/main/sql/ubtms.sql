/*
Navicat MySQL Data Transfer

Source Server         : ubtms
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : ubtms

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2017-02-26 23:57:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `content` text,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `article_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('1', '在在', '2017-02-26 22:18:13', '<p>要工<img src=\"http://localhost:8080/images/upload/e3200ab0-1ef8-4d94-b774-473fff67e812.jpg\" alt=\"hp\" style=\"max-width: 100%;\"></p><p><br></p>', '3');
INSERT INTO `article` VALUES ('2', '在在', '2017-02-26 22:19:34', '<p>要工<img src=\"http://localhost:8080/images/upload/e3200ab0-1ef8-4d94-b774-473fff67e812.jpg\" alt=\"hp\" style=\"max-width: 100%;\"></p><p><br></p>', '3');
INSERT INTO `article` VALUES ('3', 'sdafsadfds', '2017-02-26 22:20:35', '<p>翨</p>', '3');
INSERT INTO `article` VALUES ('4', 'sdafsadfdstrjtj', '2017-02-26 22:20:54', '<p>翨jjhhjty</p>', '3');
INSERT INTO `article` VALUES ('5', 'dsfgdfg', '2017-02-26 22:28:26', '<p>dfvbdvf</p>', '3');

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of game
-- ----------------------------
INSERT INTO `game` VALUES ('1', '2017-02-24 12:17:00', '北师大大', '北理工新篮球场', '届时请看管好各自家的啦啦队', '2');
INSERT INTO `game` VALUES ('7', '2017-02-02 07:20:00', '哈佛', '我家', '打你啊', '2');
INSERT INTO `game` VALUES ('8', '2017-02-08 11:09:00', 'kjlkjlk', 'sdfsdf', 'sadfsadfsadf', '2');
INSERT INTO `game` VALUES ('9', '2017-02-07 12:18:00', 'dfgdfg', 'gdfgdfgdf', 'sdgdxf', '2');
INSERT INTO `game` VALUES ('10', '2017-02-04 12:18:00', 'fghdf', 'g二', '无奇不有', '30');
INSERT INTO `game` VALUES ('11', '2017-02-28 12:41:00', '楔', 'sdfgds g', '夺顶替', '2');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '&#xe62d;', '人员管理', '3', '1', '1');
INSERT INTO `menu` VALUES ('2', '&#xe62d;', '球队管理', '1', '1', '1');
INSERT INTO `menu` VALUES ('3', '&#xe62d;', '球队动态', '2', '1', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

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
INSERT INTO `permission` VALUES ('17', '5', '1', '1', null);
INSERT INTO `permission` VALUES ('18', '5', '2', '1', null);
INSERT INTO `permission` VALUES ('19', '5', '3', '1', null);
INSERT INTO `permission` VALUES ('20', '5', '4', '1', null);

-- ----------------------------
-- Table structure for player_data
-- ----------------------------
DROP TABLE IF EXISTS `player_data`;
CREATE TABLE `player_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of player_data
-- ----------------------------
INSERT INTO `player_data` VALUES ('1', '12', '12', '12', '12', '7', '5', '5', '3', '5', '1');
INSERT INTO `player_data` VALUES ('2', '11', '2', '3', '1', '7', '9', '0', '0', '2', '8');
INSERT INTO `player_data` VALUES ('7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('8', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('9', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('10', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('11', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('12', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('13', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('14', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('15', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('16', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('17', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('18', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('19', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('20', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('21', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('22', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('23', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('24', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('25', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('26', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('27', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('28', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('29', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('30', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('31', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('32', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('33', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('34', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('35', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('36', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('37', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('38', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('39', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('40', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('41', '22', '0', '0', '0', '0', '0', '0', '0', '0', '3');
INSERT INTO `player_data` VALUES ('42', '11', '0', '0', '6', '5', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('43', '11', '4', '2', '0', '0', '0', '2', '0', '0', '2');
INSERT INTO `player_data` VALUES ('44', '0', '0', '0', '0', '0', '2', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('45', '2', '0', '0', '11', '0', '0', '0', '0', '0', '1');
INSERT INTO `player_data` VALUES ('46', '3', '0', '0', '0', '0', '0', '1', '2', '0', '0');
INSERT INTO `player_data` VALUES ('47', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('48', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('49', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('50', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('51', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('52', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('53', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('54', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('55', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('56', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('57', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('58', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('59', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('60', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('61', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('62', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('63', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('64', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('65', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('66', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('67', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('68', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('69', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('70', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('71', '12', '0', '0', '5', '4', '1', '0', '1', '1', '1');
INSERT INTO `player_data` VALUES ('72', '23', '13', '10', '3', '1', '2', '1', '1', '2', '2');
INSERT INTO `player_data` VALUES ('73', '11', '0', '0', '0', '0', '0', '0', '0', '0', '7');
INSERT INTO `player_data` VALUES ('74', '22', '3', '0', '12', '10', '0', '2', '3', '0', '0');
INSERT INTO `player_data` VALUES ('75', '1', '2', '0', '0', '0', '0', '2', '0', '0', '2');

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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_name` varchar(12) NOT NULL,
  `school_name` varchar(60) DEFAULT NULL,
  `duty` tinyint(4) DEFAULT NULL,
  `game_id` int(11) NOT NULL,
  `data_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `game_id` (`game_id`),
  KEY `rival_player_data_ibfk_3` (`data_id`),
  CONSTRAINT `rival_player_data_ibfk_2` FOREIGN KEY (`game_id`) REFERENCES `game` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rival_player_data_ibfk_3` FOREIGN KEY (`data_id`) REFERENCES `player_data` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rival_player_data
-- ----------------------------
INSERT INTO `rival_player_data` VALUES ('8', '威少', null, '1', '1', '72');
INSERT INTO `rival_player_data` VALUES ('9', '村上春树', null, '5', '1', '73');
INSERT INTO `rival_player_data` VALUES ('10', '海明威', null, '3', '1', '74');
INSERT INTO `rival_player_data` VALUES ('11', '杜兰奇', null, '2', '1', '75');
INSERT INTO `rival_player_data` VALUES ('12', '你妹', null, '1', '1', '75');

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
INSERT INTO `role` VALUES ('6', 'xxx', '1', '1');
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
INSERT INTO `school` VALUES ('2', '北理珠', '1486813342607.jpg', '1', 'fsdgfsdgdfg');
INSERT INTO `school` VALUES ('15', '北师珠13', null, '1', null);
INSERT INTO `school` VALUES ('21', 'sdfsdf', '1486641897458.jpg', '1', 'sdfsdfsdf');
INSERT INTO `school` VALUES ('23', 'ssssssssssssss', null, '1', 'sdf');
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) NOT NULL,
  `game_id` int(11) NOT NULL COMMENT '出手',
  `data_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `game_id` (`game_id`),
  KEY `player_id` (`player_id`),
  KEY `data_id` (`data_id`),
  CONSTRAINT `school_player_data_ibfk_1` FOREIGN KEY (`game_id`) REFERENCES `game` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `school_player_data_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `user` (`id`),
  CONSTRAINT `school_player_data_ibfk_3` FOREIGN KEY (`data_id`) REFERENCES `player_data` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of school_player_data
-- ----------------------------
INSERT INTO `school_player_data` VALUES ('1', '5', '1', '1');
INSERT INTO `school_player_data` VALUES ('2', '8', '1', '2');
INSERT INTO `school_player_data` VALUES ('37', '5', '1', '41');
INSERT INTO `school_player_data` VALUES ('38', '8', '1', '42');
INSERT INTO `school_player_data` VALUES ('39', '9', '1', '43');
INSERT INTO `school_player_data` VALUES ('40', '10', '1', '44');
INSERT INTO `school_player_data` VALUES ('41', '11', '1', '45');
INSERT INTO `school_player_data` VALUES ('42', '12', '1', '46');
INSERT INTO `school_player_data` VALUES ('43', '5', '8', '47');
INSERT INTO `school_player_data` VALUES ('44', '8', '8', '48');
INSERT INTO `school_player_data` VALUES ('45', '9', '8', '49');
INSERT INTO `school_player_data` VALUES ('46', '10', '8', '50');
INSERT INTO `school_player_data` VALUES ('47', '11', '8', '51');
INSERT INTO `school_player_data` VALUES ('48', '12', '8', '52');
INSERT INTO `school_player_data` VALUES ('49', '13', '8', '53');
INSERT INTO `school_player_data` VALUES ('50', '14', '8', '54');
INSERT INTO `school_player_data` VALUES ('51', '5', '9', '55');
INSERT INTO `school_player_data` VALUES ('52', '8', '9', '56');
INSERT INTO `school_player_data` VALUES ('53', '9', '9', '57');
INSERT INTO `school_player_data` VALUES ('54', '10', '9', '58');
INSERT INTO `school_player_data` VALUES ('55', '11', '9', '59');
INSERT INTO `school_player_data` VALUES ('56', '12', '9', '60');
INSERT INTO `school_player_data` VALUES ('57', '13', '9', '61');
INSERT INTO `school_player_data` VALUES ('58', '14', '9', '62');
INSERT INTO `school_player_data` VALUES ('59', '5', '11', '63');
INSERT INTO `school_player_data` VALUES ('60', '8', '11', '64');
INSERT INTO `school_player_data` VALUES ('61', '9', '11', '65');
INSERT INTO `school_player_data` VALUES ('62', '10', '11', '66');
INSERT INTO `school_player_data` VALUES ('63', '11', '11', '67');
INSERT INTO `school_player_data` VALUES ('64', '12', '11', '68');
INSERT INTO `school_player_data` VALUES ('65', '13', '11', '69');
INSERT INTO `school_player_data` VALUES ('66', '14', '11', '70');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sub_menu
-- ----------------------------
INSERT INTO `sub_menu` VALUES ('1', '1', '/school/schoolMngPage', '学校管理', '2', '1');
INSERT INTO `sub_menu` VALUES ('2', '1', '/role/roleMngPage', '角色管理', '3', '1');
INSERT INTO `sub_menu` VALUES ('3', '1', '/user/userMngPage', '人员管理', '1', '1');
INSERT INTO `sub_menu` VALUES ('4', '2', '/game/gameMngPage', '赛程管理', '1', '1');
INSERT INTO `sub_menu` VALUES ('5', '3', '/community/communityMngPage', '球队动态', '1', '1');

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
INSERT INTO `user` VALUES ('6', '13152587415', '58745138587', '领队', '1', '1487480787259.jpg', '1', null, null, '', '2', '5', '5');
INSERT INTO `user` VALUES ('8', '13254156748', '5416354135', '叶一', '1', '1487480816379.jpg', '1', null, null, '', '2', '1', '4');
INSERT INTO `user` VALUES ('9', '13254156748', '5416354135', '叶二', '1', '1487480963277.jpg', '1', '541', '3541', '大三', '11', '1', '4');
INSERT INTO `user` VALUES ('10', '13152158745', 'sadfsdaf', '肖', '1', '', '1', '111', '11', 'sadf', '111', '1', '4');
INSERT INTO `user` VALUES ('11', '13160672584', 'asddasdf', '叶', '0', '', '1', '1212', '333', '212', '111', '1', '4');
INSERT INTO `user` VALUES ('12', '13160672222', 'asddasdf', '叶', '0', '', '1', '1212', '333', '212', '111', '1', '4');
INSERT INTO `user` VALUES ('13', '13160672221', 'asddasdf', '叶', '0', '', '1', '1212', '333', '212', '111', '1', '4');
INSERT INTO `user` VALUES ('14', '13162587158', '3213213', '135', '1', '1487481474906.jpg', '1', '213', '321', '131', '11', '1', '4');
DROP TRIGGER IF EXISTS `Delect_RivalPlayerData`;
DELIMITER ;;
CREATE TRIGGER `Delect_RivalPlayerData` AFTER DELETE ON `rival_player_data` FOR EACH ROW BEGIN
	DELETE FROM player_data WHERE id = old.data_id;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `Delete_SchoolPlayerData`;
DELIMITER ;;
CREATE TRIGGER `Delete_SchoolPlayerData` AFTER DELETE ON `school_player_data` FOR EACH ROW BEGIN
 DELETE FROM player_data WHERE id = old.data_id;
END
;;
DELIMITER ;
