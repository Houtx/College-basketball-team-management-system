/*
Navicat MySQL Data Transfer

Source Server         : ubtms
Source Server Version : 50716
Source Host           : 127.0.0.1:3306
Source Database       : ubtms

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2017-03-19 16:54:24
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
  CONSTRAINT `article_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('2', '在在', '2017-02-26 22:19:34', '<p>要工<img src=\"http://localhost:8080/images/upload/e3200ab0-1ef8-4d94-b774-473fff67e812.jpg\" alt=\"hp\" style=\"max-width: 100%;\"></p><p><br></p>', '3');
INSERT INTO `article` VALUES ('6', '一只猪的故事', '2017-03-06 10:41:12', '<p></p><p>&nbsp; &nbsp; &nbsp; 我一直认为我是个非常幸运的人，在餐厅打工两个星期的时候，就遇到了一个能帮助我的人。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p><p>&nbsp; &nbsp; &nbsp; &nbsp;一个西西里女孩儿叫giovanna，她是罗马大学中文系大一的学生。两个人一拍即合，留下了联系方式，每周见两次，每次两个小时，练习意大利语和中文。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;记得第一次两个人约时间第二天在B线地铁PIRAMIDE站9：30见面，这么简单的事情，用中文+英文+意大利语，连比带划的约时间约了半小时。因为GIOVANNA中文也不好，我意大利语也说不利索。瞬间的挫败感，其实就是一句话的事情，如果用中文早就说的明明白白的了。这件小事记忆深刻。我们约好做语言互换，每个人两个小时。之后的几个星期我们都坚持见面学习语言。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p><p><b>&nbsp; &nbsp; &nbsp;这样坚持了2个月。很快，我的语言水平就进步很多，至少能进行非常缓慢的生活交流。&nbsp;</b></p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<img src=\"http://localhost:8080/images/upload/fa5f8604-3f1c-45b3-8f03-1f2a52a30421.jpg\" alt=\"1486778992212\" style=\"max-width:100%;\"><b><br></b></p><p><br></p>', '3');

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
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '2017-03-06 12:26:51', '<p><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/f2/wg_thumb.gif\"><br></p><p>在在</p>', '6', '3');
INSERT INTO `comment` VALUES ('2', '2017-03-06 15:30:00', '<p>踩场<img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/89/hufen_thumb.gif\" style=\"line-height: 1;\"></p><p><br></p>', '6', '3');
INSERT INTO `comment` VALUES ('3', '2017-03-06 22:20:47', '<p>测试评论哥<img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/6e/panda_thumb.gif\"></p>', '6', '3');

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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of game
-- ----------------------------
INSERT INTO `game` VALUES ('1', '2017-02-24 12:17:00', '北师大', '北理工新篮球场', '届时请看管好各自家的啦啦队', '2');
INSERT INTO `game` VALUES ('12', '2017-03-16 17:56:00', '华南理工大学', '北理珠', '无', '2');
INSERT INTO `game` VALUES ('47', '2017-02-22 18:41:44', '吉林大学', '操场', '无', '2');
INSERT INTO `game` VALUES ('48', '2016-02-06 20:59:06', '吉林大学', '操场', '无', '2');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '&#xe62d;', '人员管理', '3', '1', '1');
INSERT INTO `menu` VALUES ('2', '&#xe62d;', '球队管理', '1', '1', '1');
INSERT INTO `menu` VALUES ('3', '&#xe62d;', '球队动态', '2', '1', '1');
INSERT INTO `menu` VALUES ('4', '&#xe62d;', '个人信息', null, '4', '1');
INSERT INTO `menu` VALUES ('5', '&#xe62d;', '球队管理', null, '4', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

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
INSERT INTO `permission` VALUES ('21', '6', '1', '1', null);
INSERT INTO `permission` VALUES ('22', '6', '2', '1', null);
INSERT INTO `permission` VALUES ('23', '6', '3', '1', null);
INSERT INTO `permission` VALUES ('24', '6', '4', '1', null);
INSERT INTO `permission` VALUES ('25', '7', '1', '1', null);
INSERT INTO `permission` VALUES ('26', '7', '2', '1', null);
INSERT INTO `permission` VALUES ('27', '7', '3', '1', null);
INSERT INTO `permission` VALUES ('28', '7', '4', '1', null);
INSERT INTO `permission` VALUES ('29', '8', '1', '1', null);
INSERT INTO `permission` VALUES ('30', '8', '2', '1', null);
INSERT INTO `permission` VALUES ('31', '8', '3', '1', null);
INSERT INTO `permission` VALUES ('32', '8', '4', '1', null);
INSERT INTO `permission` VALUES ('33', '9', '1', '1', null);
INSERT INTO `permission` VALUES ('34', '9', '2', '1', null);
INSERT INTO `permission` VALUES ('35', '9', '3', '1', null);
INSERT INTO `permission` VALUES ('36', '9', '4', '1', null);
INSERT INTO `permission` VALUES ('37', '10', '1', '1', null);
INSERT INTO `permission` VALUES ('38', '10', '2', '1', null);
INSERT INTO `permission` VALUES ('39', '10', '3', '1', null);
INSERT INTO `permission` VALUES ('40', '10', '4', '1', null);
INSERT INTO `permission` VALUES ('41', '11', '1', '1', null);
INSERT INTO `permission` VALUES ('42', '11', '2', '1', null);
INSERT INTO `permission` VALUES ('43', '11', '3', '1', null);
INSERT INTO `permission` VALUES ('44', '11', '4', '1', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=524 DEFAULT CHARSET=utf8;

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
INSERT INTO `player_data` VALUES ('76', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('77', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('78', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('79', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('80', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('81', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('82', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('83', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('84', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('85', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('86', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('87', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('88', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('89', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('90', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('91', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('92', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('93', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('94', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('95', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('96', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('97', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('98', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('99', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('101', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('102', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('103', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('104', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('105', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('106', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('107', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('108', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('109', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('110', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('111', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('112', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('113', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('114', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('115', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('116', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('117', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('118', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('119', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('120', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('121', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('122', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('123', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('124', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('125', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('126', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('127', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('128', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('129', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('130', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('131', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('132', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('133', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('134', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('135', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('136', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('137', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('138', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('139', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('140', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('141', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('142', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('143', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('144', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('145', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('146', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('147', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('148', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('149', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('150', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('151', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('152', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('153', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('154', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('155', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('156', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('157', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('158', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('159', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('160', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('161', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('162', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('163', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('164', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('165', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('166', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('167', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('168', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('169', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('170', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('171', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('172', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('173', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('174', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('175', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('176', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('177', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('178', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('179', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('180', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('181', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('182', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('183', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('184', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('185', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('186', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('187', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('188', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('189', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('190', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('191', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('192', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('193', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('194', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('195', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('196', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('197', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('198', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('199', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('200', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('201', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('202', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('203', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('204', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('205', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('206', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('207', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('208', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('209', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('210', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('211', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('212', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('213', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('214', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('215', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('216', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('217', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('218', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('219', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('220', '8', '6', '4', '0', '0', '3', '3', '0', '3', '4');
INSERT INTO `player_data` VALUES ('221', '0', '1', '0', '0', '0', '0', '4', '1', '3', '2');
INSERT INTO `player_data` VALUES ('222', '8', '3', '3', '3', '2', '4', '9', '1', '3', '1');
INSERT INTO `player_data` VALUES ('223', '21', '11', '10', '3', '1', '1', '1', '2', '2', '0');
INSERT INTO `player_data` VALUES ('224', '23', '10', '9', '10', '5', '3', '4', '0', '2', '2');
INSERT INTO `player_data` VALUES ('225', '6', '13', '1', '4', '4', '2', '4', '0', '3', '0');
INSERT INTO `player_data` VALUES ('226', '6', '3', '2', '3', '2', '5', '4', '1', '1', '0');
INSERT INTO `player_data` VALUES ('227', '7', '13', '2', '5', '3', '4', '3', '2', '1', '1');
INSERT INTO `player_data` VALUES ('228', '10', '6', '5', '6', '0', '4', '1', '2', '1', '1');
INSERT INTO `player_data` VALUES ('229', '5', '5', '2', '2', '1', '4', '4', '1', '0', '0');
INSERT INTO `player_data` VALUES ('230', '11', '17', '5', '13', '1', '0', '3', '2', '0', '2');
INSERT INTO `player_data` VALUES ('231', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('232', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('233', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('234', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('235', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('236', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('237', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('238', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('239', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('240', '14', '11', '6', '11', '2', '2', '9', '0', '1', '3');
INSERT INTO `player_data` VALUES ('241', '0', '0', '0', '0', '0', '1', '3', '1', '1', '1');
INSERT INTO `player_data` VALUES ('242', '26', '14', '13', '0', '0', '1', '5', '1', '1', '4');
INSERT INTO `player_data` VALUES ('243', '13', '16', '5', '9', '3', '1', '5', '2', '3', '1');
INSERT INTO `player_data` VALUES ('244', '23', '11', '11', '4', '1', '0', '9', '2', '2', '4');
INSERT INTO `player_data` VALUES ('245', '1', '2', '0', '1', '1', '1', '0', '1', '2', '2');
INSERT INTO `player_data` VALUES ('246', '7', '3', '3', '3', '1', '0', '5', '0', '1', '3');
INSERT INTO `player_data` VALUES ('247', '3', '13', '1', '1', '1', '4', '2', '1', '2', '4');
INSERT INTO `player_data` VALUES ('248', '34', '17', '15', '8', '4', '2', '8', '2', '2', '1');
INSERT INTO `player_data` VALUES ('249', '2', '5', '1', '0', '0', '3', '7', '1', '0', '3');
INSERT INTO `player_data` VALUES ('250', '9', '17', '1', '9', '7', '0', '5', '1', '0', '4');
INSERT INTO `player_data` VALUES ('251', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('252', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('253', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('254', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('255', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('256', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('257', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('258', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('259', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('260', '4', '2', '2', '0', '0', '0', '0', '2', '1', '1');
INSERT INTO `player_data` VALUES ('261', '2', '18', '1', '0', '0', '3', '5', '0', '1', '3');
INSERT INTO `player_data` VALUES ('262', '10', '9', '3', '6', '4', '3', '9', '1', '2', '3');
INSERT INTO `player_data` VALUES ('263', '2', '7', '0', '5', '2', '4', '2', '1', '0', '0');
INSERT INTO `player_data` VALUES ('264', '6', '3', '3', '3', '0', '0', '5', '2', '3', '3');
INSERT INTO `player_data` VALUES ('265', '8', '17', '4', '0', '0', '4', '0', '1', '3', '0');
INSERT INTO `player_data` VALUES ('266', '22', '16', '11', '1', '0', '0', '8', '1', '2', '1');
INSERT INTO `player_data` VALUES ('267', '11', '7', '5', '7', '1', '0', '2', '1', '1', '1');
INSERT INTO `player_data` VALUES ('268', '3', '12', '0', '7', '3', '0', '8', '2', '0', '1');
INSERT INTO `player_data` VALUES ('269', '10', '11', '4', '8', '2', '4', '8', '2', '2', '1');
INSERT INTO `player_data` VALUES ('270', '16', '14', '7', '4', '2', '3', '7', '1', '1', '3');
INSERT INTO `player_data` VALUES ('271', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('272', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('273', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('274', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('275', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('276', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('277', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('278', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('279', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('280', '5', '11', '1', '5', '3', '3', '6', '2', '0', '3');
INSERT INTO `player_data` VALUES ('281', '6', '10', '3', '5', '0', '5', '1', '1', '2', '3');
INSERT INTO `player_data` VALUES ('282', '2', '6', '1', '0', '0', '5', '4', '0', '0', '3');
INSERT INTO `player_data` VALUES ('283', '0', '0', '0', '0', '0', '2', '9', '0', '3', '2');
INSERT INTO `player_data` VALUES ('284', '17', '10', '7', '4', '3', '0', '2', '2', '1', '0');
INSERT INTO `player_data` VALUES ('285', '7', '12', '3', '8', '1', '5', '5', '1', '3', '2');
INSERT INTO `player_data` VALUES ('286', '2', '15', '1', '10', '0', '0', '7', '2', '1', '1');
INSERT INTO `player_data` VALUES ('287', '4', '3', '2', '0', '0', '3', '4', '1', '2', '2');
INSERT INTO `player_data` VALUES ('288', '36', '19', '18', '0', '0', '0', '5', '2', '1', '3');
INSERT INTO `player_data` VALUES ('289', '2', '2', '1', '0', '0', '1', '4', '1', '1', '2');
INSERT INTO `player_data` VALUES ('290', '3', '1', '1', '1', '1', '3', '7', '2', '1', '0');
INSERT INTO `player_data` VALUES ('291', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('292', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('293', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('294', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('295', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('296', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('297', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('298', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('299', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('300', '8', '12', '2', '5', '4', '2', '8', '2', '1', '0');
INSERT INTO `player_data` VALUES ('301', '3', '17', '0', '8', '3', '3', '7', '1', '2', '4');
INSERT INTO `player_data` VALUES ('302', '15', '11', '7', '5', '1', '2', '2', '1', '1', '2');
INSERT INTO `player_data` VALUES ('303', '1', '19', '0', '12', '1', '2', '0', '2', '1', '3');
INSERT INTO `player_data` VALUES ('304', '8', '4', '4', '4', '0', '4', '6', '1', '2', '3');
INSERT INTO `player_data` VALUES ('305', '9', '14', '1', '10', '7', '3', '6', '2', '3', '1');
INSERT INTO `player_data` VALUES ('306', '27', '19', '13', '3', '1', '0', '0', '1', '0', '3');
INSERT INTO `player_data` VALUES ('307', '10', '8', '4', '3', '2', '3', '8', '2', '1', '3');
INSERT INTO `player_data` VALUES ('308', '6', '18', '3', '0', '0', '3', '1', '1', '2', '4');
INSERT INTO `player_data` VALUES ('309', '40', '19', '19', '3', '2', '0', '2', '1', '0', '3');
INSERT INTO `player_data` VALUES ('310', '6', '10', '1', '4', '4', '4', '5', '2', '1', '2');
INSERT INTO `player_data` VALUES ('311', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('312', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('313', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('314', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('315', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('316', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('317', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('318', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('319', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('320', '4', '13', '2', '5', '0', '4', '0', '0', '2', '2');
INSERT INTO `player_data` VALUES ('321', '1', '2', '0', '1', '1', '3', '3', '2', '2', '1');
INSERT INTO `player_data` VALUES ('322', '0', '0', '0', '0', '0', '4', '3', '2', '3', '0');
INSERT INTO `player_data` VALUES ('323', '15', '9', '6', '8', '3', '5', '7', '2', '1', '1');
INSERT INTO `player_data` VALUES ('324', '29', '13', '13', '5', '3', '2', '6', '2', '2', '4');
INSERT INTO `player_data` VALUES ('325', '7', '11', '3', '2', '1', '0', '6', '1', '2', '1');
INSERT INTO `player_data` VALUES ('326', '16', '10', '8', '1', '0', '0', '7', '1', '2', '3');
INSERT INTO `player_data` VALUES ('327', '0', '1', '0', '0', '0', '2', '2', '0', '3', '3');
INSERT INTO `player_data` VALUES ('328', '25', '12', '11', '10', '3', '3', '0', '2', '1', '1');
INSERT INTO `player_data` VALUES ('329', '3', '2', '1', '1', '1', '3', '1', '0', '3', '2');
INSERT INTO `player_data` VALUES ('330', '2', '4', '0', '4', '2', '4', '6', '2', '1', '0');
INSERT INTO `player_data` VALUES ('331', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('332', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('333', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('334', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('335', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('336', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('337', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('338', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('339', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('340', '0', '8', '0', '0', '0', '2', '7', '0', '3', '3');
INSERT INTO `player_data` VALUES ('341', '10', '19', '0', '12', '10', '4', '3', '0', '2', '0');
INSERT INTO `player_data` VALUES ('342', '12', '4', '4', '4', '4', '5', '3', '0', '1', '2');
INSERT INTO `player_data` VALUES ('343', '14', '12', '7', '0', '0', '3', '4', '1', '1', '3');
INSERT INTO `player_data` VALUES ('344', '4', '2', '2', '1', '0', '0', '7', '1', '2', '0');
INSERT INTO `player_data` VALUES ('345', '0', '4', '0', '0', '0', '4', '3', '2', '2', '2');
INSERT INTO `player_data` VALUES ('346', '3', '18', '0', '16', '3', '4', '0', '2', '3', '2');
INSERT INTO `player_data` VALUES ('347', '4', '7', '2', '4', '0', '1', '7', '0', '2', '1');
INSERT INTO `player_data` VALUES ('348', '37', '18', '17', '4', '3', '5', '4', '1', '0', '2');
INSERT INTO `player_data` VALUES ('349', '31', '16', '14', '3', '3', '0', '8', '2', '3', '4');
INSERT INTO `player_data` VALUES ('350', '21', '12', '9', '3', '3', '3', '7', '1', '0', '1');
INSERT INTO `player_data` VALUES ('351', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('352', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('353', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('354', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('355', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('356', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('357', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('358', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('359', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('360', '15', '7', '6', '3', '3', '5', '1', '0', '1', '4');
INSERT INTO `player_data` VALUES ('361', '10', '10', '5', '0', '0', '2', '6', '1', '1', '4');
INSERT INTO `player_data` VALUES ('362', '12', '5', '4', '4', '4', '1', '6', '0', '3', '0');
INSERT INTO `player_data` VALUES ('363', '17', '8', '7', '3', '3', '1', '5', '0', '3', '0');
INSERT INTO `player_data` VALUES ('364', '1', '4', '0', '1', '1', '5', '2', '1', '3', '3');
INSERT INTO `player_data` VALUES ('365', '13', '8', '4', '6', '5', '4', '9', '1', '1', '2');
INSERT INTO `player_data` VALUES ('366', '5', '3', '2', '1', '1', '1', '1', '0', '0', '4');
INSERT INTO `player_data` VALUES ('367', '25', '17', '11', '13', '3', '3', '1', '1', '3', '0');
INSERT INTO `player_data` VALUES ('368', '2', '19', '1', '3', '0', '0', '7', '1', '0', '3');
INSERT INTO `player_data` VALUES ('369', '6', '6', '3', '0', '0', '4', '8', '0', '3', '4');
INSERT INTO `player_data` VALUES ('370', '18', '10', '7', '4', '4', '3', '7', '0', '0', '0');
INSERT INTO `player_data` VALUES ('371', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('372', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('373', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('374', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('375', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('376', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('377', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('378', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('379', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('380', '10', '7', '5', '0', '0', '3', '6', '1', '2', '4');
INSERT INTO `player_data` VALUES ('381', '6', '19', '3', '17', '0', '5', '7', '2', '1', '0');
INSERT INTO `player_data` VALUES ('382', '35', '17', '17', '10', '1', '0', '6', '2', '2', '1');
INSERT INTO `player_data` VALUES ('383', '12', '15', '2', '15', '8', '1', '2', '2', '3', '4');
INSERT INTO `player_data` VALUES ('384', '10', '18', '4', '5', '2', '5', '7', '0', '2', '4');
INSERT INTO `player_data` VALUES ('385', '1', '2', '0', '2', '1', '3', '1', '1', '1', '0');
INSERT INTO `player_data` VALUES ('386', '5', '15', '1', '7', '3', '3', '7', '0', '0', '1');
INSERT INTO `player_data` VALUES ('387', '8', '8', '3', '2', '2', '3', '7', '1', '3', '2');
INSERT INTO `player_data` VALUES ('388', '6', '5', '3', '1', '0', '5', '1', '2', '3', '3');
INSERT INTO `player_data` VALUES ('389', '3', '4', '1', '2', '1', '1', '5', '0', '2', '1');
INSERT INTO `player_data` VALUES ('390', '16', '16', '8', '1', '0', '2', '5', '1', '2', '1');
INSERT INTO `player_data` VALUES ('391', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('392', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('393', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('394', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('395', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('396', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('397', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('398', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('399', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('400', '8', '15', '4', '2', '0', '3', '4', '2', '2', '1');
INSERT INTO `player_data` VALUES ('401', '31', '13', '12', '9', '7', '3', '0', '2', '0', '2');
INSERT INTO `player_data` VALUES ('402', '0', '0', '0', '0', '0', '5', '4', '2', '0', '3');
INSERT INTO `player_data` VALUES ('403', '3', '5', '0', '3', '3', '5', '3', '0', '0', '4');
INSERT INTO `player_data` VALUES ('404', '1', '14', '0', '1', '1', '0', '0', '0', '2', '3');
INSERT INTO `player_data` VALUES ('405', '0', '0', '0', '0', '0', '1', '5', '2', '2', '0');
INSERT INTO `player_data` VALUES ('406', '26', '14', '12', '7', '2', '2', '8', '1', '1', '1');
INSERT INTO `player_data` VALUES ('407', '10', '12', '4', '5', '2', '3', '6', '2', '3', '3');
INSERT INTO `player_data` VALUES ('408', '8', '14', '3', '4', '2', '5', '3', '2', '2', '0');
INSERT INTO `player_data` VALUES ('409', '8', '13', '4', '0', '0', '1', '0', '2', '1', '4');
INSERT INTO `player_data` VALUES ('410', '26', '17', '6', '14', '14', '5', '6', '2', '0', '4');
INSERT INTO `player_data` VALUES ('411', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('412', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('413', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('414', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('415', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('416', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('417', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('418', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('419', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('420', '27', '19', '12', '5', '3', '1', '5', '0', '2', '0');
INSERT INTO `player_data` VALUES ('421', '11', '19', '1', '14', '9', '2', '0', '2', '1', '2');
INSERT INTO `player_data` VALUES ('422', '12', '9', '4', '4', '4', '4', '7', '2', '0', '2');
INSERT INTO `player_data` VALUES ('423', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('424', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('425', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('426', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('427', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('428', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('429', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('430', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('431', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('432', '11', '17', '5', '6', '1', '5', '9', '0', '3', '3');
INSERT INTO `player_data` VALUES ('433', '2', '1', '1', '0', '0', '0', '9', '0', '1', '2');
INSERT INTO `player_data` VALUES ('434', '26', '15', '13', '3', '0', '1', '0', '0', '3', '2');
INSERT INTO `player_data` VALUES ('435', '6', '9', '0', '7', '6', '0', '1', '1', '2', '2');
INSERT INTO `player_data` VALUES ('436', '11', '19', '0', '13', '11', '1', '2', '0', '1', '1');
INSERT INTO `player_data` VALUES ('437', '6', '9', '3', '8', '0', '1', '2', '2', '3', '3');
INSERT INTO `player_data` VALUES ('438', '34', '18', '15', '4', '4', '4', '9', '1', '2', '4');
INSERT INTO `player_data` VALUES ('439', '0', '0', '0', '0', '0', '2', '0', '1', '0', '3');
INSERT INTO `player_data` VALUES ('440', '7', '11', '3', '3', '1', '4', '8', '0', '2', '2');
INSERT INTO `player_data` VALUES ('441', '10', '13', '5', '0', '0', '1', '4', '2', '1', '1');
INSERT INTO `player_data` VALUES ('442', '5', '11', '0', '5', '5', '0', '7', '0', '3', '0');
INSERT INTO `player_data` VALUES ('443', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('444', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('445', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('446', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('447', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('448', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('449', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('450', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('451', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('452', '22', '14', '8', '9', '6', '3', '8', '0', '0', '1');
INSERT INTO `player_data` VALUES ('453', '32', '18', '12', '11', '8', '4', '4', '2', '3', '4');
INSERT INTO `player_data` VALUES ('454', '10', '7', '4', '4', '2', '3', '2', '1', '0', '2');
INSERT INTO `player_data` VALUES ('455', '35', '19', '17', '1', '1', '3', '3', '0', '0', '0');
INSERT INTO `player_data` VALUES ('456', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('457', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('458', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('459', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('460', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('461', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('462', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('463', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('464', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('465', '29', '18', '13', '6', '3', '2', '8', '0', '0', '3');
INSERT INTO `player_data` VALUES ('466', '0', '2', '0', '0', '0', '4', '3', '2', '0', '3');
INSERT INTO `player_data` VALUES ('467', '2', '3', '1', '0', '0', '5', '4', '2', '3', '0');
INSERT INTO `player_data` VALUES ('468', '10', '12', '5', '3', '0', '4', '9', '0', '3', '2');
INSERT INTO `player_data` VALUES ('469', '34', '16', '14', '9', '6', '3', '0', '1', '3', '1');
INSERT INTO `player_data` VALUES ('470', '0', '0', '0', '0', '0', '3', '3', '0', '1', '1');
INSERT INTO `player_data` VALUES ('471', '6', '4', '3', '2', '0', '2', '2', '1', '2', '1');
INSERT INTO `player_data` VALUES ('472', '2', '3', '0', '3', '2', '5', '8', '1', '0', '2');
INSERT INTO `player_data` VALUES ('473', '36', '19', '18', '1', '0', '4', '4', '1', '0', '0');
INSERT INTO `player_data` VALUES ('474', '14', '13', '5', '9', '4', '0', '1', '0', '0', '0');
INSERT INTO `player_data` VALUES ('475', '12', '13', '2', '9', '8', '1', '3', '0', '2', '0');
INSERT INTO `player_data` VALUES ('476', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('477', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('478', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('479', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('480', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('481', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('482', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('483', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('484', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('485', '26', '18', '11', '13', '4', '2', '5', '1', '0', '0');
INSERT INTO `player_data` VALUES ('486', '7', '9', '3', '4', '1', '3', '3', '1', '2', '0');
INSERT INTO `player_data` VALUES ('487', '18', '10', '9', '0', '0', '0', '1', '0', '0', '4');
INSERT INTO `player_data` VALUES ('488', '3', '5', '0', '3', '3', '1', '7', '0', '0', '4');
INSERT INTO `player_data` VALUES ('489', '9', '13', '3', '8', '3', '1', '5', '0', '1', '1');
INSERT INTO `player_data` VALUES ('490', '15', '11', '6', '3', '3', '5', '1', '1', '2', '2');
INSERT INTO `player_data` VALUES ('491', '43', '19', '16', '19', '11', '3', '9', '1', '1', '0');
INSERT INTO `player_data` VALUES ('492', '11', '9', '5', '2', '1', '2', '1', '2', '1', '2');
INSERT INTO `player_data` VALUES ('493', '4', '6', '2', '0', '0', '4', '4', '0', '1', '0');
INSERT INTO `player_data` VALUES ('494', '14', '15', '2', '11', '10', '1', '7', '1', '3', '1');
INSERT INTO `player_data` VALUES ('495', '29', '15', '13', '5', '3', '0', '9', '1', '1', '1');
INSERT INTO `player_data` VALUES ('496', '8', '9', '3', '3', '2', '0', '0', '1', '0', '2');
INSERT INTO `player_data` VALUES ('497', '17', '8', '8', '1', '1', '4', '0', '0', '1', '0');
INSERT INTO `player_data` VALUES ('498', '2', '7', '1', '4', '0', '1', '3', '1', '3', '1');
INSERT INTO `player_data` VALUES ('499', '20', '10', '8', '10', '4', '1', '4', '1', '2', '1');
INSERT INTO `player_data` VALUES ('500', '9', '10', '4', '2', '1', '0', '2', '1', '3', '4');
INSERT INTO `player_data` VALUES ('501', '14', '8', '7', '0', '0', '2', '5', '1', '3', '0');
INSERT INTO `player_data` VALUES ('502', '8', '12', '4', '2', '0', '2', '3', '0', '1', '4');
INSERT INTO `player_data` VALUES ('503', '12', '13', '4', '9', '4', '1', '0', '1', '0', '3');
INSERT INTO `player_data` VALUES ('504', '33', '14', '10', '14', '13', '4', '2', '2', '2', '3');
INSERT INTO `player_data` VALUES ('505', '3', '17', '1', '1', '1', '3', '0', '1', '0', '2');
INSERT INTO `player_data` VALUES ('506', '0', '3', '0', '3', '0', '4', '2', '0', '3', '0');
INSERT INTO `player_data` VALUES ('507', '0', '0', '0', '0', '0', '0', '1', '0', '2', '0');
INSERT INTO `player_data` VALUES ('508', '13', '19', '5', '2', '3', '0', '2', '2', '0', '0');
INSERT INTO `player_data` VALUES ('509', '3', '4', '1', '3', '1', '1', '2', '1', '2', '2');
INSERT INTO `player_data` VALUES ('510', '3', '10', '1', '4', '1', '1', '5', '1', '3', '2');
INSERT INTO `player_data` VALUES ('511', '3', '15', '1', '8', '1', '5', '1', '0', '2', '4');
INSERT INTO `player_data` VALUES ('512', '10', '6', '5', '5', '0', '0', '2', '2', '0', '0');
INSERT INTO `player_data` VALUES ('513', '4', '17', '2', '9', '0', '3', '0', '0', '0', '1');
INSERT INTO `player_data` VALUES ('514', '29', '18', '12', '15', '5', '4', '3', '1', '3', '3');
INSERT INTO `player_data` VALUES ('515', '0', '16', '0', '9', '0', '4', '2', '1', '1', '1');
INSERT INTO `player_data` VALUES ('516', '6', '8', '2', '4', '2', '5', '0', '0', '1', '0');
INSERT INTO `player_data` VALUES ('517', '0', '6', '0', '3', '0', '1', '0', '1', '3', '2');
INSERT INTO `player_data` VALUES ('518', '11', '7', '4', '6', '3', '5', '1', '0', '3', '1');
INSERT INTO `player_data` VALUES ('519', '2', '7', '1', '4', '0', '3', '4', '1', '3', '1');
INSERT INTO `player_data` VALUES ('520', '6', '7', '3', '4', '0', '5', '4', '0', '0', '3');
INSERT INTO `player_data` VALUES ('521', '14', '18', '6', '16', '2', '1', '2', '2', '0', '3');
INSERT INTO `player_data` VALUES ('522', '15', '8', '6', '0', '3', '0', '3', '1', '2', '0');
INSERT INTO `player_data` VALUES ('523', '33', '18', '14', '8', '5', '5', '1', '1', '0', '2');

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
  CONSTRAINT `reply_ibfk_1` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`id`) ON DELETE CASCADE,
  CONSTRAINT `reply_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reply
-- ----------------------------
INSERT INTO `reply` VALUES ('2', '2017-03-06 20:34:45', '<p>@超级管理员：你会<img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/c9/geili_thumb.gif\"></p><p><br></p>', '1', '3');
INSERT INTO `reply` VALUES ('3', '2017-03-06 21:05:29', '@超级管理员：在要工在', '1', '3');

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
INSERT INTO `rival_player_data` VALUES ('12', '呵呵呵', null, '1', '1', '75');

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
INSERT INTO `role` VALUES ('1', '超级管理员', '1', '1');
INSERT INTO `role` VALUES ('2', '系统管理员', '1', '1');
INSERT INTO `role` VALUES ('3', '教练', '2', '1');
INSERT INTO `role` VALUES ('4', '球员', '2', '1');
INSERT INTO `role` VALUES ('5', '领队', '2', '1');
INSERT INTO `role` VALUES ('6', '球员', '1', '1');
INSERT INTO `role` VALUES ('7', '球员', '1', '1');
INSERT INTO `role` VALUES ('8', '球员', '1', '1');
INSERT INTO `role` VALUES ('9', '球员', '1', '1');
INSERT INTO `role` VALUES ('10', '球员', '1', '1');
INSERT INTO `role` VALUES ('11', '球员', '1', '1');

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
INSERT INTO `school` VALUES ('23', 'ssssssssssssss', null, '0', 'sdf');
INSERT INTO `school` VALUES ('24', 'sdfsdfsssssssss', null, '1', 'sadf');
INSERT INTO `school` VALUES ('25', '测试state1', null, '1', '');
INSERT INTO `school` VALUES ('26', 'fhfgh', null, '1', 'fdghd');
INSERT INTO `school` VALUES ('27', '测试', null, '1', '');
INSERT INTO `school` VALUES ('28', '测试3', '1486778992212.jpg', '1', '');
INSERT INTO `school` VALUES ('29', '地', null, '1', '');
INSERT INTO `school` VALUES ('30', 'ddfvdxvdv', '1486793243506.jpg', '1', 'dfvdfvdvdfv');
INSERT INTO `school` VALUES ('31', '你122', '1486793853620.jpg', '1', '嗯嗯，不是');
INSERT INTO `school` VALUES ('32', '鑫', '1486797901804.jpg', '1', '绂');
INSERT INTO `school` VALUES ('33', '测试机', '1486799729824.jpg', '1', 'asdfsdafsdfdsf');
INSERT INTO `school` VALUES ('34', '你11', '1486806946180.jpg', '1', '呵呵');
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
  CONSTRAINT `school_player_data_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `school_player_data_ibfk_3` FOREIGN KEY (`data_id`) REFERENCES `player_data` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=400 DEFAULT CHARSET=utf8;

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
INSERT INTO `school_player_data` VALUES ('67', '5', '12', '76');
INSERT INTO `school_player_data` VALUES ('68', '8', '12', '77');
INSERT INTO `school_player_data` VALUES ('69', '9', '12', '78');
INSERT INTO `school_player_data` VALUES ('70', '10', '12', '79');
INSERT INTO `school_player_data` VALUES ('71', '11', '12', '80');
INSERT INTO `school_player_data` VALUES ('72', '12', '12', '81');
INSERT INTO `school_player_data` VALUES ('73', '13', '12', '82');
INSERT INTO `school_player_data` VALUES ('74', '14', '12', '83');
INSERT INTO `school_player_data` VALUES ('75', '15', '12', '84');
INSERT INTO `school_player_data` VALUES ('382', '5', '47', '506');
INSERT INTO `school_player_data` VALUES ('383', '8', '47', '507');
INSERT INTO `school_player_data` VALUES ('384', '9', '47', '508');
INSERT INTO `school_player_data` VALUES ('385', '10', '47', '509');
INSERT INTO `school_player_data` VALUES ('386', '11', '47', '510');
INSERT INTO `school_player_data` VALUES ('387', '12', '47', '511');
INSERT INTO `school_player_data` VALUES ('388', '13', '47', '512');
INSERT INTO `school_player_data` VALUES ('389', '14', '47', '513');
INSERT INTO `school_player_data` VALUES ('390', '15', '47', '514');
INSERT INTO `school_player_data` VALUES ('391', '5', '48', '515');
INSERT INTO `school_player_data` VALUES ('392', '8', '48', '516');
INSERT INTO `school_player_data` VALUES ('393', '9', '48', '517');
INSERT INTO `school_player_data` VALUES ('394', '10', '48', '518');
INSERT INTO `school_player_data` VALUES ('395', '11', '48', '519');
INSERT INTO `school_player_data` VALUES ('396', '12', '48', '520');
INSERT INTO `school_player_data` VALUES ('397', '13', '48', '521');
INSERT INTO `school_player_data` VALUES ('398', '14', '48', '522');
INSERT INTO `school_player_data` VALUES ('399', '15', '48', '523');

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sub_menu
-- ----------------------------
INSERT INTO `sub_menu` VALUES ('1', '1', '/school/schoolMngPage', '学校管理', '2', '1');
INSERT INTO `sub_menu` VALUES ('2', '1', '/role/roleMngPage', '角色管理', '3', '1');
INSERT INTO `sub_menu` VALUES ('3', '1', '/user/userMngPage', '人员管理', '1', '1');
INSERT INTO `sub_menu` VALUES ('4', '2', '/game/gameMngPage', '赛程管理', '1', '1');
INSERT INTO `sub_menu` VALUES ('5', '3', '/community/communityMngPage', '球队动态', '1', '1');
INSERT INTO `sub_menu` VALUES ('6', '4', '/user/userAddAndEditPage', '基本信息', null, '1');
INSERT INTO `sub_menu` VALUES ('7', '4', '/user/userData', '个人数据', null, '1');
INSERT INTO `sub_menu` VALUES ('8', '5', '/game/gameMngPage', '赛程管理', null, '1');
INSERT INTO `sub_menu` VALUES ('9', '3', '/community/commentMngPage', '评论管理', null, '1');
INSERT INTO `sub_menu` VALUES ('10', '3', '/community/replyMngPage', '回复管理', null, '1');
INSERT INTO `sub_menu` VALUES ('11', '2', '/training/trainingMngPage', '训练计划', null, '1');

-- ----------------------------
-- Table structure for training
-- ----------------------------
DROP TABLE IF EXISTS `training`;
CREATE TABLE `training` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `school_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `training_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `school` (`sch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of training
-- ----------------------------
INSERT INTO `training` VALUES ('4', '2', '在');
INSERT INTO `training` VALUES ('5', '2', '测试');
INSERT INTO `training` VALUES ('6', '2', '测试');
INSERT INTO `training` VALUES ('7', '2', '测试');
INSERT INTO `training` VALUES ('8', '2', '测试标题');

-- ----------------------------
-- Table structure for training_item
-- ----------------------------
DROP TABLE IF EXISTS `training_item`;
CREATE TABLE `training_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item` tinyint(4) DEFAULT NULL COMMENT '1身体训练 \n2 技术训练  \n3 战术训练\n4 理论知识',
  `content` varchar(100) DEFAULT NULL COMMENT '训练内容',
  `cost` int(11) DEFAULT NULL COMMENT '训练花费时间',
  `day` tinyint(4) NOT NULL COMMENT '1-5代表星期一至星期五',
  `trainging_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `trainging_id` (`trainging_id`),
  CONSTRAINT `training_item_ibfk_1` FOREIGN KEY (`trainging_id`) REFERENCES `training` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of training_item
-- ----------------------------
INSERT INTO `training_item` VALUES ('1', '1', '111', '11', '1', '5');
INSERT INTO `training_item` VALUES ('2', '1', '123', '231423', '1', '6');
INSERT INTO `training_item` VALUES ('3', '1', '234', '2133214', '1', '6');
INSERT INTO `training_item` VALUES ('4', '1', 'sdffd', '2314', '1', '6');
INSERT INTO `training_item` VALUES ('5', '1', '3234', '1212', '1', '6');
INSERT INTO `training_item` VALUES ('6', '1', null, null, '1', '7');
INSERT INTO `training_item` VALUES ('7', '1', '234', '2133214', '1', '7');
INSERT INTO `training_item` VALUES ('8', '1', 'sdffd', '2314', '1', '7');
INSERT INTO `training_item` VALUES ('9', '1', '3234', '1212', '1', '7');
INSERT INTO `training_item` VALUES ('10', '1', null, null, '2', '7');
INSERT INTO `training_item` VALUES ('11', '1', null, null, '2', '7');
INSERT INTO `training_item` VALUES ('12', '1', null, null, '2', '7');
INSERT INTO `training_item` VALUES ('13', '1', null, null, '2', '7');
INSERT INTO `training_item` VALUES ('14', '1', null, null, '3', '7');
INSERT INTO `training_item` VALUES ('15', '1', null, null, '3', '7');
INSERT INTO `training_item` VALUES ('16', '1', null, null, '3', '7');
INSERT INTO `training_item` VALUES ('17', '1', null, null, '3', '7');
INSERT INTO `training_item` VALUES ('18', '1', null, null, '4', '7');
INSERT INTO `training_item` VALUES ('19', '1', null, null, '4', '7');
INSERT INTO `training_item` VALUES ('20', '1', null, null, '4', '7');
INSERT INTO `training_item` VALUES ('21', '1', null, null, '4', '7');
INSERT INTO `training_item` VALUES ('22', '1', null, null, '5', '7');
INSERT INTO `training_item` VALUES ('23', '1', null, null, '5', '7');
INSERT INTO `training_item` VALUES ('24', '1', null, null, '5', '7');
INSERT INTO `training_item` VALUES ('25', '1', null, null, '5', '7');
INSERT INTO `training_item` VALUES ('26', '1', null, null, '1', '8');
INSERT INTO `training_item` VALUES ('27', '1', null, null, '1', '8');
INSERT INTO `training_item` VALUES ('28', '1', null, null, '1', '8');
INSERT INTO `training_item` VALUES ('29', '1', null, null, '1', '8');
INSERT INTO `training_item` VALUES ('30', '1', null, null, '2', '8');
INSERT INTO `training_item` VALUES ('31', '1', null, null, '2', '8');
INSERT INTO `training_item` VALUES ('32', '1', null, null, '2', '8');
INSERT INTO `training_item` VALUES ('33', '1', null, null, '2', '8');
INSERT INTO `training_item` VALUES ('34', '1', null, null, '3', '8');
INSERT INTO `training_item` VALUES ('35', '1', null, null, '3', '8');
INSERT INTO `training_item` VALUES ('36', '1', null, null, '3', '8');
INSERT INTO `training_item` VALUES ('37', '1', null, null, '3', '8');
INSERT INTO `training_item` VALUES ('38', '1', null, null, '4', '8');
INSERT INTO `training_item` VALUES ('39', '1', null, null, '4', '8');
INSERT INTO `training_item` VALUES ('40', '1', null, null, '4', '8');
INSERT INTO `training_item` VALUES ('41', '1', null, null, '4', '8');
INSERT INTO `training_item` VALUES ('42', '1', null, null, '5', '8');
INSERT INTO `training_item` VALUES ('43', '1', null, null, '5', '8');
INSERT INTO `training_item` VALUES ('44', '1', null, null, '5', '8');
INSERT INTO `training_item` VALUES ('45', '1', null, null, '5', '8');

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('3', 'admin', '123456', '超级管理员', '0', '1487480787259.jpg', '1', null, null, null, null, null, '1');
INSERT INTO `user` VALUES ('4', '13160672604', 'sdfsdasfasd', '教练', '1', '1487480787259.jpg', '1', null, null, null, null, null, '3');
INSERT INTO `user` VALUES ('5', '13160672621', '123456', '麦迪', '1', '1487480787259.jpg', '1', '111', '222', '13级软件工程1班', '1', '2', '4');
INSERT INTO `user` VALUES ('6', '13152587415', '58745138587', '领队', '1', '1487480787259.jpg', '1', null, null, '', '2', '5', '5');
INSERT INTO `user` VALUES ('8', '13254156748', '5416354135', '哈登', '1', '1487480816379.jpg', '0', '11', '22', '13级软件工程1班', '13', '1', '4');
INSERT INTO `user` VALUES ('9', '13254156748', '5416354135', '考辛斯', '1', '1487480963277.jpg', '1', '541', '3541', '大13级软件工程1班', '22', '5', '4');
INSERT INTO `user` VALUES ('10', '13152158745', 'sadfsdaf', '詹姆斯', '1', '1487480787259.jpg', '1', '111', '11', '13级软件工程1班', '6', '3', '4');
INSERT INTO `user` VALUES ('11', '13160672584', 'asddasdf', '威少', '1', '', '0', '1212', '333', '13级软件工程1班', '0', '1', '4');
INSERT INTO `user` VALUES ('12', '13160672222', 'asddasdf', '张继科', '1', '', '0', '1212', '333', '13级软件工程1班', '77', '4', '4');
INSERT INTO `user` VALUES ('13', '13160672221', 'asddasdf', '科比', '1', '', '1', '1212', '333', '13级软件工程1班', '24', '2', '4');
INSERT INTO `user` VALUES ('14', '13162587158', '3213213', '乔丹', '1', '1487481474906.jpg', '0', '213', '321', '13级软件工程1班', '23', '2', '4');
INSERT INTO `user` VALUES ('15', '13160672604', '123456', '叶同学', '1', '1489574650710.jpg', '1', '190', '0', '13级软件工程1班', '9', '1', '4');
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
