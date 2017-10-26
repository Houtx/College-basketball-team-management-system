/*
Navicat MySQL Data Transfer

Source Server         : ubtms
Source Server Version : 50716
Source Host           : 127.0.0.1:3306
Source Database       : ubtms

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2017-04-12 17:13:54
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
  CONSTRAINT `article_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('2', '在在', '2017-02-26 22:19:34', '<p>要工<img src=\"http://localhost:8080/images/upload/e3200ab0-1ef8-4d94-b774-473fff67e812.jpg\" alt=\"hp\" style=\"max-width: 100%;\"></p><p><br></p>', '3');
INSERT INTO `article` VALUES ('6', '一只猪的故事', '2017-03-06 10:41:12', '<p></p><p>&nbsp; &nbsp; &nbsp; 我一直认为我是个非常幸运的人，在餐厅打工两个星期的时候，就遇到了一个能帮助我的人。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p><p>&nbsp; &nbsp; &nbsp; &nbsp;一个西西里女孩儿叫giovanna，她是罗马大学中文系大一的学生。两个人一拍即合，留下了联系方式，每周见两次，每次两个小时，练习意大利语和中文。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;记得第一次两个人约时间第二天在B线地铁PIRAMIDE站9：30见面，这么简单的事情，用中文+英文+意大利语，连比带划的约时间约了半小时。因为GIOVANNA中文也不好，我意大利语也说不利索。瞬间的挫败感，其实就是一句话的事情，如果用中文早就说的明明白白的了。这件小事记忆深刻。我们约好做语言互换，每个人两个小时。之后的几个星期我们都坚持见面学习语言。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p><p><b>&nbsp; &nbsp; &nbsp;这样坚持了2个月。很快，我的语言水平就进步很多，至少能进行非常缓慢的生活交流。&nbsp;</b></p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<img src=\"http://localhost:8080/images/upload/fa5f8604-3f1c-45b3-8f03-1f2a52a30421.jpg\" alt=\"1486778992212\" style=\"max-width:100%;\"><b><br></b></p><p><br></p>', '3');
INSERT INTO `article` VALUES ('7', '北理测试贴', '2017-03-26 08:51:20', '\n                    \n                <p><img src=\"http://localhost:8080/resources/images/common/bdf09bf3-1d64-4ce2-a980-c4a555018e31.jpg\" alt=\"hp\" style=\"max-width:100%;\"><br></p><p>头像很好</p>', '6');
INSERT INTO `article` VALUES ('8', '北理教练测试', '2017-03-26 10:18:52', '\n                    \n                <p><img src=\"http://localhost:8080/resources/images/common/7b7099f4-73dc-4e1e-9c5b-801295d143f4.jpg\" alt=\"1486793243506\" style=\"max-width:100%;\"><br></p><p>测试</p>', '4');
INSERT INTO `article` VALUES ('9', '一只假猪的故事', '2017-04-08 12:01:25', '\n                    \n                <p><b>&nbsp; &nbsp; &nbsp; 我一直认为我是个非常幸运的人，在餐厅打工两个星期的时候，就遇到了一个能帮助我的人。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></p><p>&nbsp; &nbsp; &nbsp; &nbsp;一个西西里女孩儿叫giovanna，她是罗马大学中文系大一的学生。两个人一拍即合，留下了联系方式，每周见两次，每次两个小时，练习意大利语和中文。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;记得第一次两个人约时间第二天在B线地铁PIRAMIDE站9：30见面，这么简单的事情，用中文+英文+意大利语，连比带划的约时间约了半小时。因为GIOVANNA中文也不好，我意大利语也说不利索。瞬间的挫败感，其实就是一句话的事情，如果用中文早就说的明明白白的了。这件小事记忆深刻。我们约好做语言互换，每个人两个小时。之后的几个星期我们都坚持见面学习语言。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p><p></p><p>&nbsp; &nbsp; &nbsp;这样坚持了2个月。很快，我的语言水平就进步很多，至少能进行非常缓慢的生活交流。</p><p><img src=\"resources/images/common/1d6a98aa-a22c-4ac8-8499-9952d1535c5c.jpg\" alt=\"1486778992212\" style=\"max-width:100%;\" class=\"\"><br></p><p><br></p>', '3');

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
  CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=580 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of attendance
-- ----------------------------
INSERT INTO `attendance` VALUES ('38', '0', '1', '5', '2017-03-01 00:00:00');
INSERT INTO `attendance` VALUES ('39', '0', '0', '5', '2017-03-02 00:00:00');
INSERT INTO `attendance` VALUES ('40', '1', null, '5', '2017-03-03 00:00:00');
INSERT INTO `attendance` VALUES ('41', '1', null, '5', '2017-03-04 00:00:00');
INSERT INTO `attendance` VALUES ('42', '0', '0', '5', '2017-03-05 00:00:00');
INSERT INTO `attendance` VALUES ('43', '1', null, '5', '2017-03-06 00:00:00');
INSERT INTO `attendance` VALUES ('44', '1', null, '5', '2017-03-07 00:00:00');
INSERT INTO `attendance` VALUES ('45', '1', null, '5', '2017-03-08 00:00:00');
INSERT INTO `attendance` VALUES ('46', '0', '2', '5', '2017-03-09 00:00:00');
INSERT INTO `attendance` VALUES ('47', '1', null, '5', '2017-03-10 00:00:00');
INSERT INTO `attendance` VALUES ('48', '0', '0', '5', '2017-03-11 00:00:00');
INSERT INTO `attendance` VALUES ('49', '0', '2', '5', '2017-03-12 00:00:00');
INSERT INTO `attendance` VALUES ('50', '1', null, '5', '2017-03-13 00:00:00');
INSERT INTO `attendance` VALUES ('51', '1', null, '5', '2017-03-14 00:00:00');
INSERT INTO `attendance` VALUES ('52', '1', null, '5', '2017-03-15 00:00:00');
INSERT INTO `attendance` VALUES ('53', '0', '1', '5', '2017-03-16 00:00:00');
INSERT INTO `attendance` VALUES ('54', '1', null, '5', '2017-03-17 00:00:00');
INSERT INTO `attendance` VALUES ('55', '0', '0', '5', '2017-03-18 00:00:00');
INSERT INTO `attendance` VALUES ('56', '1', null, '5', '2017-03-19 00:00:00');
INSERT INTO `attendance` VALUES ('57', '0', '0', '5', '2017-03-20 00:00:00');
INSERT INTO `attendance` VALUES ('58', '1', null, '5', '2017-03-21 00:00:00');
INSERT INTO `attendance` VALUES ('59', '0', '2', '5', '2017-03-22 00:00:00');
INSERT INTO `attendance` VALUES ('60', '0', '1', '5', '2017-03-23 00:00:00');
INSERT INTO `attendance` VALUES ('61', '1', null, '5', '2017-03-24 00:00:00');
INSERT INTO `attendance` VALUES ('62', '1', null, '5', '2017-03-25 00:00:00');
INSERT INTO `attendance` VALUES ('63', '0', '2', '5', '2017-03-26 00:00:00');
INSERT INTO `attendance` VALUES ('64', '0', '1', '5', '2017-03-27 00:00:00');
INSERT INTO `attendance` VALUES ('65', '1', null, '5', '2017-03-28 00:00:00');
INSERT INTO `attendance` VALUES ('66', '0', '1', '5', '2017-03-29 00:00:00');
INSERT INTO `attendance` VALUES ('67', '1', null, '5', '2017-03-30 00:00:00');
INSERT INTO `attendance` VALUES ('68', '0', '2', '5', '2017-03-31 00:00:00');
INSERT INTO `attendance` VALUES ('69', '1', null, '15', '2017-03-01 00:00:00');
INSERT INTO `attendance` VALUES ('70', '1', null, '15', '2017-03-02 00:00:00');
INSERT INTO `attendance` VALUES ('71', '0', '0', '15', '2017-03-03 00:00:00');
INSERT INTO `attendance` VALUES ('72', '1', null, '15', '2017-03-04 00:00:00');
INSERT INTO `attendance` VALUES ('73', '1', null, '15', '2017-03-05 00:00:00');
INSERT INTO `attendance` VALUES ('74', '1', null, '15', '2017-03-06 00:00:00');
INSERT INTO `attendance` VALUES ('75', '1', null, '15', '2017-03-07 00:00:00');
INSERT INTO `attendance` VALUES ('76', '1', null, '15', '2017-03-08 00:00:00');
INSERT INTO `attendance` VALUES ('77', '1', null, '15', '2017-03-09 00:00:00');
INSERT INTO `attendance` VALUES ('78', '1', null, '15', '2017-03-10 00:00:00');
INSERT INTO `attendance` VALUES ('79', '0', '1', '15', '2017-03-11 00:00:00');
INSERT INTO `attendance` VALUES ('80', '0', '2', '15', '2017-03-12 00:00:00');
INSERT INTO `attendance` VALUES ('81', '0', '0', '15', '2017-03-13 00:00:00');
INSERT INTO `attendance` VALUES ('82', '1', null, '15', '2017-03-14 00:00:00');
INSERT INTO `attendance` VALUES ('83', '1', null, '15', '2017-03-15 00:00:00');
INSERT INTO `attendance` VALUES ('84', '0', '1', '15', '2017-03-16 00:00:00');
INSERT INTO `attendance` VALUES ('85', '1', null, '15', '2017-03-17 00:00:00');
INSERT INTO `attendance` VALUES ('86', '1', null, '15', '2017-03-18 00:00:00');
INSERT INTO `attendance` VALUES ('87', '0', '2', '15', '2017-03-19 00:00:00');
INSERT INTO `attendance` VALUES ('88', '1', null, '15', '2017-03-20 00:00:00');
INSERT INTO `attendance` VALUES ('89', '1', null, '15', '2017-03-21 00:00:00');
INSERT INTO `attendance` VALUES ('90', '0', '1', '15', '2017-03-22 00:00:00');
INSERT INTO `attendance` VALUES ('91', '0', '1', '15', '2017-03-23 00:00:00');
INSERT INTO `attendance` VALUES ('92', '0', '2', '15', '2017-03-24 00:00:00');
INSERT INTO `attendance` VALUES ('93', '1', null, '15', '2017-03-25 00:00:00');
INSERT INTO `attendance` VALUES ('94', '1', null, '15', '2017-03-26 00:00:00');
INSERT INTO `attendance` VALUES ('95', '1', null, '15', '2017-03-27 00:00:00');
INSERT INTO `attendance` VALUES ('96', '0', '0', '15', '2017-03-28 00:00:00');
INSERT INTO `attendance` VALUES ('97', '0', '0', '15', '2017-03-29 00:00:00');
INSERT INTO `attendance` VALUES ('98', '1', null, '15', '2017-03-30 00:00:00');
INSERT INTO `attendance` VALUES ('99', '0', '2', '15', '2017-03-31 00:00:00');
INSERT INTO `attendance` VALUES ('100', '0', '1', '5', '2017-04-01 00:00:00');
INSERT INTO `attendance` VALUES ('101', '0', '0', '8', '2017-04-01 00:00:00');
INSERT INTO `attendance` VALUES ('102', '0', '2', '9', '2017-04-01 00:00:00');
INSERT INTO `attendance` VALUES ('103', '1', null, '10', '2017-04-01 00:00:00');
INSERT INTO `attendance` VALUES ('104', '1', null, '11', '2017-04-01 00:00:00');
INSERT INTO `attendance` VALUES ('105', '1', null, '12', '2017-04-01 00:00:00');
INSERT INTO `attendance` VALUES ('106', '1', null, '13', '2017-04-01 00:00:00');
INSERT INTO `attendance` VALUES ('107', '1', null, '14', '2017-04-01 00:00:00');
INSERT INTO `attendance` VALUES ('108', '0', '0', '5', '2017-04-02 00:00:00');
INSERT INTO `attendance` VALUES ('109', '0', '0', '8', '2017-04-02 00:00:00');
INSERT INTO `attendance` VALUES ('110', '1', null, '9', '2017-04-02 00:00:00');
INSERT INTO `attendance` VALUES ('111', '1', null, '10', '2017-04-02 00:00:00');
INSERT INTO `attendance` VALUES ('112', '1', null, '11', '2017-04-02 00:00:00');
INSERT INTO `attendance` VALUES ('113', '1', null, '12', '2017-04-02 00:00:00');
INSERT INTO `attendance` VALUES ('114', '1', null, '13', '2017-04-02 00:00:00');
INSERT INTO `attendance` VALUES ('115', '1', null, '14', '2017-04-02 00:00:00');
INSERT INTO `attendance` VALUES ('116', '1', null, '5', '2017-04-03 00:00:00');
INSERT INTO `attendance` VALUES ('117', '0', '0', '8', '2017-04-03 00:00:00');
INSERT INTO `attendance` VALUES ('118', '1', null, '9', '2017-04-03 00:00:00');
INSERT INTO `attendance` VALUES ('119', '1', null, '10', '2017-04-03 00:00:00');
INSERT INTO `attendance` VALUES ('120', '1', null, '11', '2017-04-03 00:00:00');
INSERT INTO `attendance` VALUES ('121', '1', null, '12', '2017-04-03 00:00:00');
INSERT INTO `attendance` VALUES ('122', '1', null, '13', '2017-04-03 00:00:00');
INSERT INTO `attendance` VALUES ('123', '1', null, '14', '2017-04-03 00:00:00');
INSERT INTO `attendance` VALUES ('124', '1', null, '5', '2017-04-04 00:00:00');
INSERT INTO `attendance` VALUES ('125', '0', '0', '8', '2017-04-04 00:00:00');
INSERT INTO `attendance` VALUES ('126', '1', null, '9', '2017-04-04 00:00:00');
INSERT INTO `attendance` VALUES ('127', '1', null, '10', '2017-04-04 00:00:00');
INSERT INTO `attendance` VALUES ('128', '1', null, '11', '2017-04-04 00:00:00');
INSERT INTO `attendance` VALUES ('129', '1', null, '12', '2017-04-04 00:00:00');
INSERT INTO `attendance` VALUES ('130', '1', null, '13', '2017-04-04 00:00:00');
INSERT INTO `attendance` VALUES ('131', '1', null, '14', '2017-04-04 00:00:00');
INSERT INTO `attendance` VALUES ('132', '0', '0', '5', '2017-04-05 00:00:00');
INSERT INTO `attendance` VALUES ('133', '0', '0', '8', '2017-04-05 00:00:00');
INSERT INTO `attendance` VALUES ('134', '1', null, '9', '2017-04-05 00:00:00');
INSERT INTO `attendance` VALUES ('135', '1', null, '10', '2017-04-05 00:00:00');
INSERT INTO `attendance` VALUES ('136', '1', null, '11', '2017-04-05 00:00:00');
INSERT INTO `attendance` VALUES ('137', '1', null, '12', '2017-04-05 00:00:00');
INSERT INTO `attendance` VALUES ('138', '1', null, '13', '2017-04-05 00:00:00');
INSERT INTO `attendance` VALUES ('139', '1', null, '14', '2017-04-05 00:00:00');
INSERT INTO `attendance` VALUES ('140', '1', null, '5', '2017-04-06 00:00:00');
INSERT INTO `attendance` VALUES ('141', '0', '0', '8', '2017-04-06 00:00:00');
INSERT INTO `attendance` VALUES ('142', '0', '2', '9', '2017-04-06 00:00:00');
INSERT INTO `attendance` VALUES ('143', '0', '2', '10', '2017-04-06 00:00:00');
INSERT INTO `attendance` VALUES ('144', '0', '2', '11', '2017-04-06 00:00:00');
INSERT INTO `attendance` VALUES ('145', '0', '2', '12', '2017-04-06 00:00:00');
INSERT INTO `attendance` VALUES ('146', '0', '2', '13', '2017-04-06 00:00:00');
INSERT INTO `attendance` VALUES ('147', '0', '1', '14', '2017-04-06 00:00:00');
INSERT INTO `attendance` VALUES ('148', '1', null, '5', '2017-04-07 00:00:00');
INSERT INTO `attendance` VALUES ('149', '0', '0', '8', '2017-04-07 00:00:00');
INSERT INTO `attendance` VALUES ('150', '0', '2', '9', '2017-04-07 00:00:00');
INSERT INTO `attendance` VALUES ('151', '0', '2', '10', '2017-04-07 00:00:00');
INSERT INTO `attendance` VALUES ('152', '0', '2', '11', '2017-04-07 00:00:00');
INSERT INTO `attendance` VALUES ('153', '0', '2', '12', '2017-04-07 00:00:00');
INSERT INTO `attendance` VALUES ('154', '0', '2', '13', '2017-04-07 00:00:00');
INSERT INTO `attendance` VALUES ('155', '0', '1', '14', '2017-04-07 00:00:00');
INSERT INTO `attendance` VALUES ('156', '1', null, '5', '2017-04-08 00:00:00');
INSERT INTO `attendance` VALUES ('157', '0', '0', '8', '2017-04-08 00:00:00');
INSERT INTO `attendance` VALUES ('158', '0', '2', '9', '2017-04-08 00:00:00');
INSERT INTO `attendance` VALUES ('159', '0', '2', '10', '2017-04-08 00:00:00');
INSERT INTO `attendance` VALUES ('160', '0', '2', '11', '2017-04-08 00:00:00');
INSERT INTO `attendance` VALUES ('161', '0', '2', '12', '2017-04-08 00:00:00');
INSERT INTO `attendance` VALUES ('162', '0', '2', '13', '2017-04-08 00:00:00');
INSERT INTO `attendance` VALUES ('163', '0', '1', '14', '2017-04-08 00:00:00');
INSERT INTO `attendance` VALUES ('164', '0', '2', '5', '2017-04-09 00:00:00');
INSERT INTO `attendance` VALUES ('165', '0', '0', '8', '2017-04-09 00:00:00');
INSERT INTO `attendance` VALUES ('166', '0', '2', '9', '2017-04-09 00:00:00');
INSERT INTO `attendance` VALUES ('167', '0', '2', '10', '2017-04-09 00:00:00');
INSERT INTO `attendance` VALUES ('168', '0', '2', '11', '2017-04-09 00:00:00');
INSERT INTO `attendance` VALUES ('169', '0', '2', '12', '2017-04-09 00:00:00');
INSERT INTO `attendance` VALUES ('170', '0', '2', '13', '2017-04-09 00:00:00');
INSERT INTO `attendance` VALUES ('171', '0', '1', '14', '2017-04-09 00:00:00');
INSERT INTO `attendance` VALUES ('172', '1', null, '5', '2017-04-10 00:00:00');
INSERT INTO `attendance` VALUES ('173', '0', '0', '8', '2017-04-10 00:00:00');
INSERT INTO `attendance` VALUES ('174', '0', '2', '9', '2017-04-10 00:00:00');
INSERT INTO `attendance` VALUES ('175', '0', '2', '10', '2017-04-10 00:00:00');
INSERT INTO `attendance` VALUES ('176', '0', '2', '11', '2017-04-10 00:00:00');
INSERT INTO `attendance` VALUES ('177', '0', '2', '12', '2017-04-10 00:00:00');
INSERT INTO `attendance` VALUES ('178', '0', '2', '13', '2017-04-10 00:00:00');
INSERT INTO `attendance` VALUES ('179', '0', '1', '14', '2017-04-10 00:00:00');
INSERT INTO `attendance` VALUES ('180', '0', '0', '5', '2017-04-11 00:00:00');
INSERT INTO `attendance` VALUES ('181', '0', '0', '8', '2017-04-11 00:00:00');
INSERT INTO `attendance` VALUES ('182', '0', '1', '9', '2017-04-11 00:00:00');
INSERT INTO `attendance` VALUES ('183', '0', '1', '10', '2017-04-11 00:00:00');
INSERT INTO `attendance` VALUES ('184', '0', '1', '11', '2017-04-11 00:00:00');
INSERT INTO `attendance` VALUES ('185', '0', '1', '12', '2017-04-11 00:00:00');
INSERT INTO `attendance` VALUES ('186', '0', '1', '13', '2017-04-11 00:00:00');
INSERT INTO `attendance` VALUES ('187', '0', '1', '14', '2017-04-11 00:00:00');
INSERT INTO `attendance` VALUES ('188', '0', '2', '5', '2017-04-12 00:00:00');
INSERT INTO `attendance` VALUES ('189', '0', '0', '8', '2017-04-12 00:00:00');
INSERT INTO `attendance` VALUES ('190', '0', '1', '9', '2017-04-12 00:00:00');
INSERT INTO `attendance` VALUES ('191', '0', '1', '10', '2017-04-12 00:00:00');
INSERT INTO `attendance` VALUES ('192', '0', '1', '11', '2017-04-12 00:00:00');
INSERT INTO `attendance` VALUES ('193', '0', '1', '12', '2017-04-12 00:00:00');
INSERT INTO `attendance` VALUES ('194', '0', '1', '13', '2017-04-12 00:00:00');
INSERT INTO `attendance` VALUES ('195', '0', '1', '14', '2017-04-12 00:00:00');
INSERT INTO `attendance` VALUES ('196', '1', null, '5', '2017-04-13 00:00:00');
INSERT INTO `attendance` VALUES ('197', '0', '0', '8', '2017-04-13 00:00:00');
INSERT INTO `attendance` VALUES ('198', '0', '1', '9', '2017-04-13 00:00:00');
INSERT INTO `attendance` VALUES ('199', '0', '1', '10', '2017-04-13 00:00:00');
INSERT INTO `attendance` VALUES ('200', '0', '1', '11', '2017-04-13 00:00:00');
INSERT INTO `attendance` VALUES ('201', '0', '1', '12', '2017-04-13 00:00:00');
INSERT INTO `attendance` VALUES ('202', '0', '1', '13', '2017-04-13 00:00:00');
INSERT INTO `attendance` VALUES ('203', '0', '1', '14', '2017-04-13 00:00:00');
INSERT INTO `attendance` VALUES ('204', '1', null, '5', '2017-04-14 00:00:00');
INSERT INTO `attendance` VALUES ('205', '0', '0', '8', '2017-04-14 00:00:00');
INSERT INTO `attendance` VALUES ('206', '0', '1', '9', '2017-04-14 00:00:00');
INSERT INTO `attendance` VALUES ('207', '1', null, '10', '2017-04-14 00:00:00');
INSERT INTO `attendance` VALUES ('208', '1', null, '11', '2017-04-14 00:00:00');
INSERT INTO `attendance` VALUES ('209', '1', null, '12', '2017-04-14 00:00:00');
INSERT INTO `attendance` VALUES ('210', '1', null, '13', '2017-04-14 00:00:00');
INSERT INTO `attendance` VALUES ('211', '1', null, '14', '2017-04-14 00:00:00');
INSERT INTO `attendance` VALUES ('212', '1', null, '5', '2017-04-15 00:00:00');
INSERT INTO `attendance` VALUES ('213', '0', '1', '8', '2017-04-15 00:00:00');
INSERT INTO `attendance` VALUES ('214', '0', '1', '9', '2017-04-15 00:00:00');
INSERT INTO `attendance` VALUES ('215', '0', '1', '10', '2017-04-15 00:00:00');
INSERT INTO `attendance` VALUES ('216', '0', '1', '11', '2017-04-15 00:00:00');
INSERT INTO `attendance` VALUES ('217', '0', '1', '12', '2017-04-15 00:00:00');
INSERT INTO `attendance` VALUES ('218', '0', '1', '13', '2017-04-15 00:00:00');
INSERT INTO `attendance` VALUES ('219', '0', '1', '14', '2017-04-15 00:00:00');
INSERT INTO `attendance` VALUES ('220', '0', '1', '5', '2017-04-16 00:00:00');
INSERT INTO `attendance` VALUES ('221', '0', '1', '8', '2017-04-16 00:00:00');
INSERT INTO `attendance` VALUES ('222', '0', '1', '9', '2017-04-16 00:00:00');
INSERT INTO `attendance` VALUES ('223', '1', null, '10', '2017-04-16 00:00:00');
INSERT INTO `attendance` VALUES ('224', '1', null, '11', '2017-04-16 00:00:00');
INSERT INTO `attendance` VALUES ('225', '1', null, '12', '2017-04-16 00:00:00');
INSERT INTO `attendance` VALUES ('226', '1', null, '13', '2017-04-16 00:00:00');
INSERT INTO `attendance` VALUES ('227', '1', null, '14', '2017-04-16 00:00:00');
INSERT INTO `attendance` VALUES ('228', '1', null, '5', '2017-04-17 00:00:00');
INSERT INTO `attendance` VALUES ('229', '0', '1', '8', '2017-04-17 00:00:00');
INSERT INTO `attendance` VALUES ('230', '0', '1', '9', '2017-04-17 00:00:00');
INSERT INTO `attendance` VALUES ('231', '1', null, '10', '2017-04-17 00:00:00');
INSERT INTO `attendance` VALUES ('232', '1', null, '11', '2017-04-17 00:00:00');
INSERT INTO `attendance` VALUES ('233', '1', null, '12', '2017-04-17 00:00:00');
INSERT INTO `attendance` VALUES ('234', '1', null, '13', '2017-04-17 00:00:00');
INSERT INTO `attendance` VALUES ('235', '1', null, '14', '2017-04-17 00:00:00');
INSERT INTO `attendance` VALUES ('236', '1', null, '5', '2017-04-18 00:00:00');
INSERT INTO `attendance` VALUES ('237', '1', null, '8', '2017-04-18 00:00:00');
INSERT INTO `attendance` VALUES ('238', '1', null, '9', '2017-04-18 00:00:00');
INSERT INTO `attendance` VALUES ('239', '1', null, '10', '2017-04-18 00:00:00');
INSERT INTO `attendance` VALUES ('240', '1', null, '11', '2017-04-18 00:00:00');
INSERT INTO `attendance` VALUES ('241', '1', null, '12', '2017-04-18 00:00:00');
INSERT INTO `attendance` VALUES ('242', '1', null, '13', '2017-04-18 00:00:00');
INSERT INTO `attendance` VALUES ('243', '1', null, '14', '2017-04-18 00:00:00');
INSERT INTO `attendance` VALUES ('244', '1', null, '5', '2017-04-19 00:00:00');
INSERT INTO `attendance` VALUES ('245', '1', null, '8', '2017-04-19 00:00:00');
INSERT INTO `attendance` VALUES ('246', '1', null, '9', '2017-04-19 00:00:00');
INSERT INTO `attendance` VALUES ('247', '1', null, '10', '2017-04-19 00:00:00');
INSERT INTO `attendance` VALUES ('248', '1', null, '11', '2017-04-19 00:00:00');
INSERT INTO `attendance` VALUES ('249', '1', null, '12', '2017-04-19 00:00:00');
INSERT INTO `attendance` VALUES ('250', '1', null, '13', '2017-04-19 00:00:00');
INSERT INTO `attendance` VALUES ('251', '1', null, '14', '2017-04-19 00:00:00');
INSERT INTO `attendance` VALUES ('252', '0', '0', '5', '2017-04-20 00:00:00');
INSERT INTO `attendance` VALUES ('253', '1', null, '8', '2017-04-20 00:00:00');
INSERT INTO `attendance` VALUES ('254', '1', null, '9', '2017-04-20 00:00:00');
INSERT INTO `attendance` VALUES ('255', '1', null, '10', '2017-04-20 00:00:00');
INSERT INTO `attendance` VALUES ('256', '1', null, '11', '2017-04-20 00:00:00');
INSERT INTO `attendance` VALUES ('257', '1', null, '12', '2017-04-20 00:00:00');
INSERT INTO `attendance` VALUES ('258', '1', null, '13', '2017-04-20 00:00:00');
INSERT INTO `attendance` VALUES ('259', '1', null, '14', '2017-04-20 00:00:00');
INSERT INTO `attendance` VALUES ('260', '1', null, '5', '2017-04-21 00:00:00');
INSERT INTO `attendance` VALUES ('261', '1', null, '8', '2017-04-21 00:00:00');
INSERT INTO `attendance` VALUES ('262', '1', null, '9', '2017-04-21 00:00:00');
INSERT INTO `attendance` VALUES ('263', '1', null, '10', '2017-04-21 00:00:00');
INSERT INTO `attendance` VALUES ('264', '1', null, '11', '2017-04-21 00:00:00');
INSERT INTO `attendance` VALUES ('265', '1', null, '12', '2017-04-21 00:00:00');
INSERT INTO `attendance` VALUES ('266', '1', null, '13', '2017-04-21 00:00:00');
INSERT INTO `attendance` VALUES ('267', '1', null, '14', '2017-04-21 00:00:00');
INSERT INTO `attendance` VALUES ('268', '0', '2', '5', '2017-04-22 00:00:00');
INSERT INTO `attendance` VALUES ('269', '1', null, '8', '2017-04-22 00:00:00');
INSERT INTO `attendance` VALUES ('270', '1', null, '9', '2017-04-22 00:00:00');
INSERT INTO `attendance` VALUES ('271', '1', null, '10', '2017-04-22 00:00:00');
INSERT INTO `attendance` VALUES ('272', '1', null, '11', '2017-04-22 00:00:00');
INSERT INTO `attendance` VALUES ('273', '1', null, '12', '2017-04-22 00:00:00');
INSERT INTO `attendance` VALUES ('274', '1', null, '13', '2017-04-22 00:00:00');
INSERT INTO `attendance` VALUES ('275', '1', null, '14', '2017-04-22 00:00:00');
INSERT INTO `attendance` VALUES ('276', '0', '1', '5', '2017-04-23 00:00:00');
INSERT INTO `attendance` VALUES ('277', '1', null, '8', '2017-04-23 00:00:00');
INSERT INTO `attendance` VALUES ('278', '1', null, '9', '2017-04-23 00:00:00');
INSERT INTO `attendance` VALUES ('279', '1', null, '10', '2017-04-23 00:00:00');
INSERT INTO `attendance` VALUES ('280', '1', null, '11', '2017-04-23 00:00:00');
INSERT INTO `attendance` VALUES ('281', '1', null, '12', '2017-04-23 00:00:00');
INSERT INTO `attendance` VALUES ('282', '1', null, '13', '2017-04-23 00:00:00');
INSERT INTO `attendance` VALUES ('283', '1', null, '14', '2017-04-23 00:00:00');
INSERT INTO `attendance` VALUES ('284', '1', null, '5', '2017-04-24 00:00:00');
INSERT INTO `attendance` VALUES ('285', '1', null, '8', '2017-04-24 00:00:00');
INSERT INTO `attendance` VALUES ('286', '1', null, '9', '2017-04-24 00:00:00');
INSERT INTO `attendance` VALUES ('287', '1', null, '10', '2017-04-24 00:00:00');
INSERT INTO `attendance` VALUES ('288', '1', null, '11', '2017-04-24 00:00:00');
INSERT INTO `attendance` VALUES ('289', '1', null, '12', '2017-04-24 00:00:00');
INSERT INTO `attendance` VALUES ('290', '1', null, '13', '2017-04-24 00:00:00');
INSERT INTO `attendance` VALUES ('291', '1', null, '14', '2017-04-24 00:00:00');
INSERT INTO `attendance` VALUES ('292', '1', null, '5', '2017-04-25 00:00:00');
INSERT INTO `attendance` VALUES ('293', '1', null, '8', '2017-04-25 00:00:00');
INSERT INTO `attendance` VALUES ('294', '1', null, '9', '2017-04-25 00:00:00');
INSERT INTO `attendance` VALUES ('295', '1', null, '10', '2017-04-25 00:00:00');
INSERT INTO `attendance` VALUES ('296', '1', null, '11', '2017-04-25 00:00:00');
INSERT INTO `attendance` VALUES ('297', '1', null, '12', '2017-04-25 00:00:00');
INSERT INTO `attendance` VALUES ('298', '1', null, '13', '2017-04-25 00:00:00');
INSERT INTO `attendance` VALUES ('299', '1', null, '14', '2017-04-25 00:00:00');
INSERT INTO `attendance` VALUES ('300', '0', '2', '5', '2017-04-26 00:00:00');
INSERT INTO `attendance` VALUES ('301', '1', null, '8', '2017-04-26 00:00:00');
INSERT INTO `attendance` VALUES ('302', '1', null, '9', '2017-04-26 00:00:00');
INSERT INTO `attendance` VALUES ('303', '1', null, '10', '2017-04-26 00:00:00');
INSERT INTO `attendance` VALUES ('304', '1', null, '11', '2017-04-26 00:00:00');
INSERT INTO `attendance` VALUES ('305', '1', null, '12', '2017-04-26 00:00:00');
INSERT INTO `attendance` VALUES ('306', '1', null, '13', '2017-04-26 00:00:00');
INSERT INTO `attendance` VALUES ('307', '1', null, '14', '2017-04-26 00:00:00');
INSERT INTO `attendance` VALUES ('308', '0', '1', '5', '2017-04-27 00:00:00');
INSERT INTO `attendance` VALUES ('309', '1', null, '8', '2017-04-27 00:00:00');
INSERT INTO `attendance` VALUES ('310', '1', null, '9', '2017-04-27 00:00:00');
INSERT INTO `attendance` VALUES ('311', '1', null, '10', '2017-04-27 00:00:00');
INSERT INTO `attendance` VALUES ('312', '1', null, '11', '2017-04-27 00:00:00');
INSERT INTO `attendance` VALUES ('313', '1', null, '12', '2017-04-27 00:00:00');
INSERT INTO `attendance` VALUES ('314', '1', null, '13', '2017-04-27 00:00:00');
INSERT INTO `attendance` VALUES ('315', '1', null, '14', '2017-04-27 00:00:00');
INSERT INTO `attendance` VALUES ('316', '1', null, '5', '2017-04-28 00:00:00');
INSERT INTO `attendance` VALUES ('317', '1', null, '8', '2017-04-28 00:00:00');
INSERT INTO `attendance` VALUES ('318', '1', null, '9', '2017-04-28 00:00:00');
INSERT INTO `attendance` VALUES ('319', '1', null, '10', '2017-04-28 00:00:00');
INSERT INTO `attendance` VALUES ('320', '1', null, '11', '2017-04-28 00:00:00');
INSERT INTO `attendance` VALUES ('321', '1', null, '12', '2017-04-28 00:00:00');
INSERT INTO `attendance` VALUES ('322', '1', null, '13', '2017-04-28 00:00:00');
INSERT INTO `attendance` VALUES ('323', '1', null, '14', '2017-04-28 00:00:00');
INSERT INTO `attendance` VALUES ('324', '0', '1', '5', '2017-04-29 00:00:00');
INSERT INTO `attendance` VALUES ('325', '1', null, '8', '2017-04-29 00:00:00');
INSERT INTO `attendance` VALUES ('326', '1', null, '9', '2017-04-29 00:00:00');
INSERT INTO `attendance` VALUES ('327', '1', null, '10', '2017-04-29 00:00:00');
INSERT INTO `attendance` VALUES ('328', '1', null, '11', '2017-04-29 00:00:00');
INSERT INTO `attendance` VALUES ('329', '1', null, '12', '2017-04-29 00:00:00');
INSERT INTO `attendance` VALUES ('330', '1', null, '13', '2017-04-29 00:00:00');
INSERT INTO `attendance` VALUES ('331', '1', null, '14', '2017-04-29 00:00:00');
INSERT INTO `attendance` VALUES ('332', '1', null, '5', '2017-04-30 00:00:00');
INSERT INTO `attendance` VALUES ('333', '0', '1', '8', '2017-04-30 00:00:00');
INSERT INTO `attendance` VALUES ('334', '0', '1', '9', '2017-04-30 00:00:00');
INSERT INTO `attendance` VALUES ('335', '0', '1', '10', '2017-04-30 00:00:00');
INSERT INTO `attendance` VALUES ('336', '0', '1', '11', '2017-04-30 00:00:00');
INSERT INTO `attendance` VALUES ('337', '0', '1', '12', '2017-04-30 00:00:00');
INSERT INTO `attendance` VALUES ('338', '0', '1', '13', '2017-04-30 00:00:00');
INSERT INTO `attendance` VALUES ('339', '0', '1', '14', '2017-04-30 00:00:00');
INSERT INTO `attendance` VALUES ('340', '0', '1', '5', '2017-12-01 00:00:00');
INSERT INTO `attendance` VALUES ('341', '0', '0', '8', '2017-12-01 00:00:00');
INSERT INTO `attendance` VALUES ('342', '1', null, '9', '2017-12-01 00:00:00');
INSERT INTO `attendance` VALUES ('343', '1', null, '10', '2017-12-01 00:00:00');
INSERT INTO `attendance` VALUES ('344', '1', null, '11', '2017-12-01 00:00:00');
INSERT INTO `attendance` VALUES ('345', '1', null, '12', '2017-12-01 00:00:00');
INSERT INTO `attendance` VALUES ('346', '1', null, '13', '2017-12-01 00:00:00');
INSERT INTO `attendance` VALUES ('347', '1', null, '14', '2017-12-01 00:00:00');
INSERT INTO `attendance` VALUES ('348', '0', '0', '8', '2017-12-02 00:00:00');
INSERT INTO `attendance` VALUES ('349', '1', null, '9', '2017-12-02 00:00:00');
INSERT INTO `attendance` VALUES ('350', '1', null, '10', '2017-12-02 00:00:00');
INSERT INTO `attendance` VALUES ('351', '1', null, '11', '2017-12-02 00:00:00');
INSERT INTO `attendance` VALUES ('352', '1', null, '12', '2017-12-02 00:00:00');
INSERT INTO `attendance` VALUES ('353', '1', null, '13', '2017-12-02 00:00:00');
INSERT INTO `attendance` VALUES ('354', '1', null, '14', '2017-12-02 00:00:00');
INSERT INTO `attendance` VALUES ('355', '1', null, '5', '2017-12-03 00:00:00');
INSERT INTO `attendance` VALUES ('356', '0', '0', '8', '2017-12-03 00:00:00');
INSERT INTO `attendance` VALUES ('357', '1', null, '9', '2017-12-03 00:00:00');
INSERT INTO `attendance` VALUES ('358', '1', null, '10', '2017-12-03 00:00:00');
INSERT INTO `attendance` VALUES ('359', '1', null, '11', '2017-12-03 00:00:00');
INSERT INTO `attendance` VALUES ('360', '1', null, '12', '2017-12-03 00:00:00');
INSERT INTO `attendance` VALUES ('361', '1', null, '13', '2017-12-03 00:00:00');
INSERT INTO `attendance` VALUES ('362', '1', null, '14', '2017-12-03 00:00:00');
INSERT INTO `attendance` VALUES ('363', '1', null, '5', '2017-12-04 00:00:00');
INSERT INTO `attendance` VALUES ('364', '0', '0', '8', '2017-12-04 00:00:00');
INSERT INTO `attendance` VALUES ('365', '1', null, '9', '2017-12-04 00:00:00');
INSERT INTO `attendance` VALUES ('366', '1', null, '10', '2017-12-04 00:00:00');
INSERT INTO `attendance` VALUES ('367', '1', null, '11', '2017-12-04 00:00:00');
INSERT INTO `attendance` VALUES ('368', '1', null, '12', '2017-12-04 00:00:00');
INSERT INTO `attendance` VALUES ('369', '1', null, '13', '2017-12-04 00:00:00');
INSERT INTO `attendance` VALUES ('370', '1', null, '14', '2017-12-04 00:00:00');
INSERT INTO `attendance` VALUES ('371', '0', '0', '5', '2017-12-05 00:00:00');
INSERT INTO `attendance` VALUES ('372', '0', '0', '8', '2017-12-05 00:00:00');
INSERT INTO `attendance` VALUES ('373', '1', null, '9', '2017-12-05 00:00:00');
INSERT INTO `attendance` VALUES ('374', '1', null, '10', '2017-12-05 00:00:00');
INSERT INTO `attendance` VALUES ('375', '1', null, '11', '2017-12-05 00:00:00');
INSERT INTO `attendance` VALUES ('376', '1', null, '12', '2017-12-05 00:00:00');
INSERT INTO `attendance` VALUES ('377', '1', null, '13', '2017-12-05 00:00:00');
INSERT INTO `attendance` VALUES ('378', '1', null, '14', '2017-12-05 00:00:00');
INSERT INTO `attendance` VALUES ('379', '1', null, '5', '2017-12-06 00:00:00');
INSERT INTO `attendance` VALUES ('380', '0', '0', '8', '2017-12-06 00:00:00');
INSERT INTO `attendance` VALUES ('381', '0', '2', '9', '2017-12-06 00:00:00');
INSERT INTO `attendance` VALUES ('382', '0', '2', '10', '2017-12-06 00:00:00');
INSERT INTO `attendance` VALUES ('383', '0', '2', '11', '2017-12-06 00:00:00');
INSERT INTO `attendance` VALUES ('384', '0', '2', '12', '2017-12-06 00:00:00');
INSERT INTO `attendance` VALUES ('385', '0', '2', '13', '2017-12-06 00:00:00');
INSERT INTO `attendance` VALUES ('386', '0', '1', '14', '2017-12-06 00:00:00');
INSERT INTO `attendance` VALUES ('387', '1', null, '5', '2017-12-07 00:00:00');
INSERT INTO `attendance` VALUES ('388', '0', '0', '8', '2017-12-07 00:00:00');
INSERT INTO `attendance` VALUES ('389', '0', '2', '9', '2017-12-07 00:00:00');
INSERT INTO `attendance` VALUES ('390', '0', '2', '10', '2017-12-07 00:00:00');
INSERT INTO `attendance` VALUES ('391', '0', '2', '11', '2017-12-07 00:00:00');
INSERT INTO `attendance` VALUES ('392', '0', '2', '12', '2017-12-07 00:00:00');
INSERT INTO `attendance` VALUES ('393', '0', '2', '13', '2017-12-07 00:00:00');
INSERT INTO `attendance` VALUES ('394', '0', '1', '14', '2017-12-07 00:00:00');
INSERT INTO `attendance` VALUES ('395', '1', null, '5', '2017-12-08 00:00:00');
INSERT INTO `attendance` VALUES ('396', '0', '0', '8', '2017-12-08 00:00:00');
INSERT INTO `attendance` VALUES ('397', '0', '2', '9', '2017-12-08 00:00:00');
INSERT INTO `attendance` VALUES ('398', '0', '2', '10', '2017-12-08 00:00:00');
INSERT INTO `attendance` VALUES ('399', '0', '2', '11', '2017-12-08 00:00:00');
INSERT INTO `attendance` VALUES ('400', '0', '2', '12', '2017-12-08 00:00:00');
INSERT INTO `attendance` VALUES ('401', '0', '2', '13', '2017-12-08 00:00:00');
INSERT INTO `attendance` VALUES ('402', '0', '1', '14', '2017-12-08 00:00:00');
INSERT INTO `attendance` VALUES ('403', '0', '2', '5', '2017-12-09 00:00:00');
INSERT INTO `attendance` VALUES ('404', '0', '0', '8', '2017-12-09 00:00:00');
INSERT INTO `attendance` VALUES ('405', '0', '2', '9', '2017-12-09 00:00:00');
INSERT INTO `attendance` VALUES ('406', '0', '2', '10', '2017-12-09 00:00:00');
INSERT INTO `attendance` VALUES ('407', '0', '2', '11', '2017-12-09 00:00:00');
INSERT INTO `attendance` VALUES ('408', '0', '2', '12', '2017-12-09 00:00:00');
INSERT INTO `attendance` VALUES ('409', '0', '2', '13', '2017-12-09 00:00:00');
INSERT INTO `attendance` VALUES ('410', '0', '1', '14', '2017-12-09 00:00:00');
INSERT INTO `attendance` VALUES ('411', '1', null, '5', '2017-12-10 00:00:00');
INSERT INTO `attendance` VALUES ('412', '0', '0', '8', '2017-12-10 00:00:00');
INSERT INTO `attendance` VALUES ('413', '0', '2', '9', '2017-12-10 00:00:00');
INSERT INTO `attendance` VALUES ('414', '0', '2', '10', '2017-12-10 00:00:00');
INSERT INTO `attendance` VALUES ('415', '0', '2', '11', '2017-12-10 00:00:00');
INSERT INTO `attendance` VALUES ('416', '0', '2', '12', '2017-12-10 00:00:00');
INSERT INTO `attendance` VALUES ('417', '0', '2', '13', '2017-12-10 00:00:00');
INSERT INTO `attendance` VALUES ('418', '0', '1', '14', '2017-12-10 00:00:00');
INSERT INTO `attendance` VALUES ('419', '0', '0', '5', '2017-12-11 00:00:00');
INSERT INTO `attendance` VALUES ('420', '0', '0', '8', '2017-12-11 00:00:00');
INSERT INTO `attendance` VALUES ('421', '0', '1', '9', '2017-12-11 00:00:00');
INSERT INTO `attendance` VALUES ('422', '0', '1', '10', '2017-12-11 00:00:00');
INSERT INTO `attendance` VALUES ('423', '0', '1', '11', '2017-12-11 00:00:00');
INSERT INTO `attendance` VALUES ('424', '0', '1', '12', '2017-12-11 00:00:00');
INSERT INTO `attendance` VALUES ('425', '0', '1', '13', '2017-12-11 00:00:00');
INSERT INTO `attendance` VALUES ('426', '0', '1', '14', '2017-12-11 00:00:00');
INSERT INTO `attendance` VALUES ('427', '0', '2', '5', '2017-12-12 00:00:00');
INSERT INTO `attendance` VALUES ('428', '0', '0', '8', '2017-12-12 00:00:00');
INSERT INTO `attendance` VALUES ('429', '0', '1', '9', '2017-12-12 00:00:00');
INSERT INTO `attendance` VALUES ('430', '0', '1', '10', '2017-12-12 00:00:00');
INSERT INTO `attendance` VALUES ('431', '0', '1', '11', '2017-12-12 00:00:00');
INSERT INTO `attendance` VALUES ('432', '0', '1', '12', '2017-12-12 00:00:00');
INSERT INTO `attendance` VALUES ('433', '0', '1', '13', '2017-12-12 00:00:00');
INSERT INTO `attendance` VALUES ('434', '0', '1', '14', '2017-12-12 00:00:00');
INSERT INTO `attendance` VALUES ('435', '1', null, '5', '2017-12-13 00:00:00');
INSERT INTO `attendance` VALUES ('436', '0', '0', '8', '2017-12-13 00:00:00');
INSERT INTO `attendance` VALUES ('437', '0', '1', '9', '2017-12-13 00:00:00');
INSERT INTO `attendance` VALUES ('438', '0', '1', '10', '2017-12-13 00:00:00');
INSERT INTO `attendance` VALUES ('439', '0', '1', '11', '2017-12-13 00:00:00');
INSERT INTO `attendance` VALUES ('440', '0', '1', '12', '2017-12-13 00:00:00');
INSERT INTO `attendance` VALUES ('441', '0', '1', '13', '2017-12-13 00:00:00');
INSERT INTO `attendance` VALUES ('442', '0', '1', '14', '2017-12-13 00:00:00');
INSERT INTO `attendance` VALUES ('443', '1', null, '5', '2017-12-14 00:00:00');
INSERT INTO `attendance` VALUES ('444', '0', '0', '8', '2017-12-14 00:00:00');
INSERT INTO `attendance` VALUES ('445', '0', '1', '9', '2017-12-14 00:00:00');
INSERT INTO `attendance` VALUES ('446', '1', null, '10', '2017-12-14 00:00:00');
INSERT INTO `attendance` VALUES ('447', '1', null, '11', '2017-12-14 00:00:00');
INSERT INTO `attendance` VALUES ('448', '1', null, '12', '2017-12-14 00:00:00');
INSERT INTO `attendance` VALUES ('449', '1', null, '13', '2017-12-14 00:00:00');
INSERT INTO `attendance` VALUES ('450', '1', null, '14', '2017-12-14 00:00:00');
INSERT INTO `attendance` VALUES ('451', '1', null, '5', '2017-12-15 00:00:00');
INSERT INTO `attendance` VALUES ('452', '0', '1', '8', '2017-12-15 00:00:00');
INSERT INTO `attendance` VALUES ('453', '0', '1', '9', '2017-12-15 00:00:00');
INSERT INTO `attendance` VALUES ('454', '0', '1', '10', '2017-12-15 00:00:00');
INSERT INTO `attendance` VALUES ('455', '0', '1', '11', '2017-12-15 00:00:00');
INSERT INTO `attendance` VALUES ('456', '0', '1', '12', '2017-12-15 00:00:00');
INSERT INTO `attendance` VALUES ('457', '0', '1', '13', '2017-12-15 00:00:00');
INSERT INTO `attendance` VALUES ('458', '0', '1', '14', '2017-12-15 00:00:00');
INSERT INTO `attendance` VALUES ('459', '0', '1', '5', '2017-12-16 00:00:00');
INSERT INTO `attendance` VALUES ('460', '0', '1', '8', '2017-12-16 00:00:00');
INSERT INTO `attendance` VALUES ('461', '0', '1', '9', '2017-12-16 00:00:00');
INSERT INTO `attendance` VALUES ('462', '1', null, '10', '2017-12-16 00:00:00');
INSERT INTO `attendance` VALUES ('463', '1', null, '11', '2017-12-16 00:00:00');
INSERT INTO `attendance` VALUES ('464', '1', null, '12', '2017-12-16 00:00:00');
INSERT INTO `attendance` VALUES ('465', '1', null, '13', '2017-12-16 00:00:00');
INSERT INTO `attendance` VALUES ('466', '1', null, '14', '2017-12-16 00:00:00');
INSERT INTO `attendance` VALUES ('467', '1', null, '5', '2017-12-17 00:00:00');
INSERT INTO `attendance` VALUES ('468', '0', '1', '8', '2017-12-17 00:00:00');
INSERT INTO `attendance` VALUES ('469', '0', '1', '9', '2017-12-17 00:00:00');
INSERT INTO `attendance` VALUES ('470', '1', null, '10', '2017-12-17 00:00:00');
INSERT INTO `attendance` VALUES ('471', '1', null, '11', '2017-12-17 00:00:00');
INSERT INTO `attendance` VALUES ('472', '1', null, '12', '2017-12-17 00:00:00');
INSERT INTO `attendance` VALUES ('473', '1', null, '13', '2017-12-17 00:00:00');
INSERT INTO `attendance` VALUES ('474', '1', null, '14', '2017-12-17 00:00:00');
INSERT INTO `attendance` VALUES ('475', '1', null, '5', '2017-12-18 00:00:00');
INSERT INTO `attendance` VALUES ('476', '1', null, '8', '2017-12-18 00:00:00');
INSERT INTO `attendance` VALUES ('477', '1', null, '9', '2017-12-18 00:00:00');
INSERT INTO `attendance` VALUES ('478', '1', null, '10', '2017-12-18 00:00:00');
INSERT INTO `attendance` VALUES ('479', '1', null, '11', '2017-12-18 00:00:00');
INSERT INTO `attendance` VALUES ('480', '1', null, '12', '2017-12-18 00:00:00');
INSERT INTO `attendance` VALUES ('481', '1', null, '13', '2017-12-18 00:00:00');
INSERT INTO `attendance` VALUES ('482', '1', null, '14', '2017-12-18 00:00:00');
INSERT INTO `attendance` VALUES ('483', '1', null, '5', '2017-12-19 00:00:00');
INSERT INTO `attendance` VALUES ('484', '1', null, '8', '2017-12-19 00:00:00');
INSERT INTO `attendance` VALUES ('485', '1', null, '9', '2017-12-19 00:00:00');
INSERT INTO `attendance` VALUES ('486', '1', null, '10', '2017-12-19 00:00:00');
INSERT INTO `attendance` VALUES ('487', '1', null, '11', '2017-12-19 00:00:00');
INSERT INTO `attendance` VALUES ('488', '1', null, '12', '2017-12-19 00:00:00');
INSERT INTO `attendance` VALUES ('489', '1', null, '13', '2017-12-19 00:00:00');
INSERT INTO `attendance` VALUES ('490', '1', null, '14', '2017-12-19 00:00:00');
INSERT INTO `attendance` VALUES ('491', '0', '0', '5', '2017-12-20 00:00:00');
INSERT INTO `attendance` VALUES ('492', '1', null, '8', '2017-12-20 00:00:00');
INSERT INTO `attendance` VALUES ('493', '1', null, '9', '2017-12-20 00:00:00');
INSERT INTO `attendance` VALUES ('494', '1', null, '10', '2017-12-20 00:00:00');
INSERT INTO `attendance` VALUES ('495', '1', null, '11', '2017-12-20 00:00:00');
INSERT INTO `attendance` VALUES ('496', '1', null, '12', '2017-12-20 00:00:00');
INSERT INTO `attendance` VALUES ('497', '1', null, '13', '2017-12-20 00:00:00');
INSERT INTO `attendance` VALUES ('498', '1', null, '14', '2017-12-20 00:00:00');
INSERT INTO `attendance` VALUES ('499', '1', null, '5', '2017-12-21 00:00:00');
INSERT INTO `attendance` VALUES ('500', '1', null, '8', '2017-12-21 00:00:00');
INSERT INTO `attendance` VALUES ('501', '1', null, '9', '2017-12-21 00:00:00');
INSERT INTO `attendance` VALUES ('502', '1', null, '10', '2017-12-21 00:00:00');
INSERT INTO `attendance` VALUES ('503', '1', null, '11', '2017-12-21 00:00:00');
INSERT INTO `attendance` VALUES ('504', '1', null, '12', '2017-12-21 00:00:00');
INSERT INTO `attendance` VALUES ('505', '1', null, '13', '2017-12-21 00:00:00');
INSERT INTO `attendance` VALUES ('506', '1', null, '14', '2017-12-21 00:00:00');
INSERT INTO `attendance` VALUES ('507', '0', '2', '5', '2017-12-22 00:00:00');
INSERT INTO `attendance` VALUES ('508', '1', null, '8', '2017-12-22 00:00:00');
INSERT INTO `attendance` VALUES ('509', '1', null, '9', '2017-12-22 00:00:00');
INSERT INTO `attendance` VALUES ('510', '1', null, '10', '2017-12-22 00:00:00');
INSERT INTO `attendance` VALUES ('511', '1', null, '11', '2017-12-22 00:00:00');
INSERT INTO `attendance` VALUES ('512', '1', null, '12', '2017-12-22 00:00:00');
INSERT INTO `attendance` VALUES ('513', '1', null, '13', '2017-12-22 00:00:00');
INSERT INTO `attendance` VALUES ('514', '1', null, '14', '2017-12-22 00:00:00');
INSERT INTO `attendance` VALUES ('515', '0', '1', '5', '2017-12-23 00:00:00');
INSERT INTO `attendance` VALUES ('516', '1', null, '8', '2017-12-23 00:00:00');
INSERT INTO `attendance` VALUES ('517', '1', null, '9', '2017-12-23 00:00:00');
INSERT INTO `attendance` VALUES ('518', '1', null, '10', '2017-12-23 00:00:00');
INSERT INTO `attendance` VALUES ('519', '1', null, '11', '2017-12-23 00:00:00');
INSERT INTO `attendance` VALUES ('520', '1', null, '12', '2017-12-23 00:00:00');
INSERT INTO `attendance` VALUES ('521', '1', null, '13', '2017-12-23 00:00:00');
INSERT INTO `attendance` VALUES ('522', '1', null, '14', '2017-12-23 00:00:00');
INSERT INTO `attendance` VALUES ('523', '1', null, '5', '2017-12-24 00:00:00');
INSERT INTO `attendance` VALUES ('524', '1', null, '8', '2017-12-24 00:00:00');
INSERT INTO `attendance` VALUES ('525', '1', null, '9', '2017-12-24 00:00:00');
INSERT INTO `attendance` VALUES ('526', '1', null, '10', '2017-12-24 00:00:00');
INSERT INTO `attendance` VALUES ('527', '1', null, '11', '2017-12-24 00:00:00');
INSERT INTO `attendance` VALUES ('528', '1', null, '12', '2017-12-24 00:00:00');
INSERT INTO `attendance` VALUES ('529', '1', null, '13', '2017-12-24 00:00:00');
INSERT INTO `attendance` VALUES ('530', '1', null, '14', '2017-12-24 00:00:00');
INSERT INTO `attendance` VALUES ('531', '1', null, '5', '2017-12-25 00:00:00');
INSERT INTO `attendance` VALUES ('532', '1', null, '8', '2017-12-25 00:00:00');
INSERT INTO `attendance` VALUES ('533', '1', null, '9', '2017-12-25 00:00:00');
INSERT INTO `attendance` VALUES ('534', '1', null, '10', '2017-12-25 00:00:00');
INSERT INTO `attendance` VALUES ('535', '1', null, '11', '2017-12-25 00:00:00');
INSERT INTO `attendance` VALUES ('536', '1', null, '12', '2017-12-25 00:00:00');
INSERT INTO `attendance` VALUES ('537', '1', null, '13', '2017-12-25 00:00:00');
INSERT INTO `attendance` VALUES ('538', '1', null, '14', '2017-12-25 00:00:00');
INSERT INTO `attendance` VALUES ('539', '0', '2', '5', '2017-12-26 00:00:00');
INSERT INTO `attendance` VALUES ('540', '1', null, '8', '2017-12-26 00:00:00');
INSERT INTO `attendance` VALUES ('541', '1', null, '9', '2017-12-26 00:00:00');
INSERT INTO `attendance` VALUES ('542', '1', null, '10', '2017-12-26 00:00:00');
INSERT INTO `attendance` VALUES ('543', '1', null, '11', '2017-12-26 00:00:00');
INSERT INTO `attendance` VALUES ('544', '1', null, '12', '2017-12-26 00:00:00');
INSERT INTO `attendance` VALUES ('545', '1', null, '13', '2017-12-26 00:00:00');
INSERT INTO `attendance` VALUES ('546', '1', null, '14', '2017-12-26 00:00:00');
INSERT INTO `attendance` VALUES ('547', '0', '1', '5', '2017-12-27 00:00:00');
INSERT INTO `attendance` VALUES ('548', '1', null, '8', '2017-12-27 00:00:00');
INSERT INTO `attendance` VALUES ('549', '1', null, '9', '2017-12-27 00:00:00');
INSERT INTO `attendance` VALUES ('550', '1', null, '10', '2017-12-27 00:00:00');
INSERT INTO `attendance` VALUES ('551', '1', null, '11', '2017-12-27 00:00:00');
INSERT INTO `attendance` VALUES ('552', '1', null, '12', '2017-12-27 00:00:00');
INSERT INTO `attendance` VALUES ('553', '1', null, '13', '2017-12-27 00:00:00');
INSERT INTO `attendance` VALUES ('554', '1', null, '14', '2017-12-27 00:00:00');
INSERT INTO `attendance` VALUES ('555', '1', null, '5', '2017-12-28 00:00:00');
INSERT INTO `attendance` VALUES ('556', '1', null, '8', '2017-12-28 00:00:00');
INSERT INTO `attendance` VALUES ('557', '1', null, '9', '2017-12-28 00:00:00');
INSERT INTO `attendance` VALUES ('558', '1', null, '10', '2017-12-28 00:00:00');
INSERT INTO `attendance` VALUES ('559', '1', null, '11', '2017-12-28 00:00:00');
INSERT INTO `attendance` VALUES ('560', '1', null, '12', '2017-12-28 00:00:00');
INSERT INTO `attendance` VALUES ('561', '1', null, '13', '2017-12-28 00:00:00');
INSERT INTO `attendance` VALUES ('562', '1', null, '14', '2017-12-28 00:00:00');
INSERT INTO `attendance` VALUES ('563', '0', '1', '5', '2017-12-29 00:00:00');
INSERT INTO `attendance` VALUES ('564', '1', null, '8', '2017-12-29 00:00:00');
INSERT INTO `attendance` VALUES ('565', '1', null, '9', '2017-12-29 00:00:00');
INSERT INTO `attendance` VALUES ('566', '1', null, '10', '2017-12-29 00:00:00');
INSERT INTO `attendance` VALUES ('567', '1', null, '11', '2017-12-29 00:00:00');
INSERT INTO `attendance` VALUES ('568', '1', null, '12', '2017-12-29 00:00:00');
INSERT INTO `attendance` VALUES ('569', '1', null, '13', '2017-12-29 00:00:00');
INSERT INTO `attendance` VALUES ('570', '1', null, '14', '2017-12-29 00:00:00');
INSERT INTO `attendance` VALUES ('571', '1', null, '5', '2017-12-30 00:00:00');
INSERT INTO `attendance` VALUES ('572', '0', '1', '8', '2017-12-30 00:00:00');
INSERT INTO `attendance` VALUES ('573', '0', '1', '9', '2017-12-30 00:00:00');
INSERT INTO `attendance` VALUES ('574', '0', '1', '10', '2017-12-30 00:00:00');
INSERT INTO `attendance` VALUES ('575', '0', '1', '11', '2017-12-30 00:00:00');
INSERT INTO `attendance` VALUES ('576', '0', '1', '12', '2017-12-30 00:00:00');
INSERT INTO `attendance` VALUES ('577', '0', '1', '13', '2017-12-30 00:00:00');
INSERT INTO `attendance` VALUES ('578', '0', '1', '14', '2017-12-30 00:00:00');
INSERT INTO `attendance` VALUES ('579', '0', '2', '15', '2017-06-23 00:00:00');

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '2017-03-06 12:26:51', '<p><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/f2/wg_thumb.gif\"><br></p><p>在在</p>', '6', '3');
INSERT INTO `comment` VALUES ('2', '2017-03-06 15:30:00', '<p>踩场<img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/89/hufen_thumb.gif\" style=\"line-height: 1;\"></p><p><br></p>', '6', '3');
INSERT INTO `comment` VALUES ('3', '2017-03-06 22:20:47', '<p>测试评论哥<img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/6e/panda_thumb.gif\"></p>', '6', '3');
INSERT INTO `comment` VALUES ('4', '2017-03-26 09:10:03', '<p>哈哈不错<img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/6e/panda_thumb.gif\" style=\"line-height: 1;\"></p><p><br></p>', '7', '4');
INSERT INTO `comment` VALUES ('5', '2017-03-26 09:11:43', '<p>为什么变了教练？</p>', '7', '4');
INSERT INTO `comment` VALUES ('6', '2017-03-26 09:15:07', '<p>教练？</p>', '7', '4');
INSERT INTO `comment` VALUES ('7', '2017-03-26 09:17:56', '<p>测试</p>', '7', '15');
INSERT INTO `comment` VALUES ('8', '2017-04-05 12:38:32', '<p>测试评论</p>', '8', '3');
INSERT INTO `comment` VALUES ('9', '2017-04-05 12:48:34', '<p>再测试多一次</p>', '8', '3');
INSERT INTO `comment` VALUES ('10', '2017-04-05 12:54:08', '<p>还要测试</p>', '8', '3');
INSERT INTO `comment` VALUES ('11', '2017-04-08 12:19:44', '<p><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/bc/otm_thumb.gif\">加油<br></p><p><br></p>', '9', '6');

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
  CONSTRAINT `game_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `school` (`sch_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of game
-- ----------------------------
INSERT INTO `game` VALUES ('1', '2017-02-24 12:17:00', '北师大', '北理工新篮球场', '届时请看管好各自家的啦啦队', '2');
INSERT INTO `game` VALUES ('12', '2017-03-16 17:56:00', '华南理工大学', '北理珠', '无', '2');
INSERT INTO `game` VALUES ('47', '2017-02-22 18:41:44', '吉林大学', '操场', '无', '2');
INSERT INTO `game` VALUES ('48', '2016-02-06 20:59:06', '吉林大学', '操场', '无', '2');
INSERT INTO `game` VALUES ('55', '2017-03-01 16:30:00', '北理工本部', '北京航空球场', '无备注', '2');

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
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '&#xe62d;', '人员管理', '3', '1', '1');
INSERT INTO `menu` VALUES ('2', '&#xe62b;', '球队管理', '1', '1', '1');
INSERT INTO `menu` VALUES ('3', '&#xe6c5;', '球队动态', '2', '1', '1');
INSERT INTO `menu` VALUES ('4', '&#xe62d;', '个人信息', null, '4', '1');
INSERT INTO `menu` VALUES ('5', '&#xe62b;', '球队管理', null, '4', '1');
INSERT INTO `menu` VALUES ('6', '&#xe62d;', '人员管理', null, '5', '1');
INSERT INTO `menu` VALUES ('7', '&#xe62b;', '球队管理', '1', '5', '1');
INSERT INTO `menu` VALUES ('9', '&#xe6c5;', '球队动态', null, '5', '1');
INSERT INTO `menu` VALUES ('10', '&#xe6c5;', '球队动态', null, '4', '1');
INSERT INTO `menu` VALUES ('11', '&#xe62d;', '个人信息', null, '3', '1');
INSERT INTO `menu` VALUES ('12', '&#xe62b;', '球队管理', null, '3', '1');
INSERT INTO `menu` VALUES ('13', '&#xe6c5;', '球队动态', null, '3', '1');
INSERT INTO `menu` VALUES ('14', '&#xe62b;', '球队管理', '1', '13', '1');
INSERT INTO `menu` VALUES ('15', '&#xe6c5;', '球队动态', '2', '13', '1');
INSERT INTO `menu` VALUES ('16', '&#xe62d;', '人员管理', '3', '13', '1');
INSERT INTO `menu` VALUES ('17', '&#xe62d;', '个人信息', '4', '13', '1');
INSERT INTO `menu` VALUES ('18', '&#xe62b;', '球队管理', '1', '15', '1');
INSERT INTO `menu` VALUES ('19', '&#xe6c5;', '球队动态', '2', '15', '1');
INSERT INTO `menu` VALUES ('20', '&#xe62d;', '个人信息', '3', '15', '1');
INSERT INTO `menu` VALUES ('21', '&#xe62b;', '球队管理', '1', '16', '1');
INSERT INTO `menu` VALUES ('22', '&#xe6c5;', '球队动态', '2', '16', '1');
INSERT INTO `menu` VALUES ('23', '&#xe62d;', '人员管理', '3', '16', '1');
INSERT INTO `menu` VALUES ('24', '&#xe62b;', '球队管理', '1', '17', '1');
INSERT INTO `menu` VALUES ('25', '&#xe6c5;', '球队动态', '2', '17', '1');
INSERT INTO `menu` VALUES ('26', '&#xe62d;', '个人信息', '3', '17', '1');
INSERT INTO `menu` VALUES ('27', '&#xe62b;', '球队管理', '1', '18', '1');
INSERT INTO `menu` VALUES ('28', '&#xe6c5;', '球队动态', '2', '18', '1');
INSERT INTO `menu` VALUES ('29', '&#xe62d;', '个人信息', '3', '18', '1');
INSERT INTO `menu` VALUES ('30', '&#xe62b;', '球队管理', '1', '19', '1');
INSERT INTO `menu` VALUES ('31', '&#xe6c5;', '球队动态', '2', '19', '1');
INSERT INTO `menu` VALUES ('32', '&#xe62d;', '人员管理', '3', '19', '1');
INSERT INTO `menu` VALUES ('33', '&#xe62b;', '球队管理', '1', '20', '1');
INSERT INTO `menu` VALUES ('34', '&#xe6c5;', '球队动态', '2', '20', '1');
INSERT INTO `menu` VALUES ('35', '&#xe62d;', '个人信息', '3', '20', '1');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `suser_id` int(11) NOT NULL,
  `target_id` int(11) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `article_id` int(11) NOT NULL,
  `is_read` int(255) DEFAULT NULL COMMENT '0未读 1已读',
  `replyTime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `suser_id` (`suser_id`),
  KEY `target_id` (`target_id`),
  KEY `article_id` (`article_id`),
  CONSTRAINT `notice_ibfk_1` FOREIGN KEY (`suser_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `notice_ibfk_2` FOREIGN KEY (`target_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `notice_ibfk_3` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('1', '3', '4', '<p>还要测试</p>', '8', '0', null);
INSERT INTO `notice` VALUES ('5', '3', '6', '超级管理员@无敌领队：tty', '8', '0', null);
INSERT INTO `notice` VALUES ('6', '6', '3', '无敌领队@超级管理员：呵呵', '8', '1', null);
INSERT INTO `notice` VALUES ('7', '6', '3', '无敌领队@超级管理员：哈哈', '8', '1', '2017-04-05 15:14:05');
INSERT INTO `notice` VALUES ('8', '6', '3', '无敌领队@超级管理员：起来了', '8', '1', '2017-04-05 16:24:48');
INSERT INTO `notice` VALUES ('9', '6', '3', '无敌领队@超级管理员：再没', '8', '1', '2017-04-05 18:57:32');
INSERT INTO `notice` VALUES ('10', '6', '3', '无敌领队@超级管理员：111', '8', '1', '2017-04-05 18:58:43');
INSERT INTO `notice` VALUES ('11', '6', '3', '无敌领队@超级管理员：222', '8', '1', '2017-04-05 18:58:47');
INSERT INTO `notice` VALUES ('12', '3', '6', '超级管理员@无敌领队：呵呵', '8', '0', '2017-04-05 19:01:55');
INSERT INTO `notice` VALUES ('13', '6', '3', '<p><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/bc/otm_thumb.gif\">加油<br></p><p><br></p>', '9', '0', '2017-04-08 12:19:44');
INSERT INTO `notice` VALUES ('14', '3', '6', '超级管理员@无敌领队：必须的', '9', '0', '2017-04-08 12:20:09');
INSERT INTO `notice` VALUES ('15', '6', '3', '无敌领队@超级管理员：哈哈', '9', '0', '2017-04-08 12:20:32');

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
) ENGINE=InnoDB AUTO_INCREMENT=494 DEFAULT CHARSET=utf8;

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
INSERT INTO `permission` VALUES ('24', '6', '4', '1', null);
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
INSERT INTO `permission` VALUES ('43', '11', '3', '1', null);
INSERT INTO `permission` VALUES ('44', '11', '4', '1', null);
INSERT INTO `permission` VALUES ('45', '12', '1', '1', null);
INSERT INTO `permission` VALUES ('46', '12', '2', '1', null);
INSERT INTO `permission` VALUES ('47', '12', '3', '1', null);
INSERT INTO `permission` VALUES ('48', '12', '4', '1', null);
INSERT INTO `permission` VALUES ('49', '13', '1', '1', null);
INSERT INTO `permission` VALUES ('50', '13', '2', '1', null);
INSERT INTO `permission` VALUES ('51', '13', '3', '1', null);
INSERT INTO `permission` VALUES ('52', '13', '4', '1', null);
INSERT INTO `permission` VALUES ('53', '11', '1', '1', null);
INSERT INTO `permission` VALUES ('54', '11', '2', '1', null);
INSERT INTO `permission` VALUES ('55', '14', '3', '1', null);
INSERT INTO `permission` VALUES ('56', '14', '4', '1', null);
INSERT INTO `permission` VALUES ('57', '15', '1', '1', null);
INSERT INTO `permission` VALUES ('58', '15', '2', '1', null);
INSERT INTO `permission` VALUES ('59', '15', '3', '1', null);
INSERT INTO `permission` VALUES ('60', '15', '4', '1', null);
INSERT INTO `permission` VALUES ('61', '16', '1', '1', null);
INSERT INTO `permission` VALUES ('62', '16', '2', '1', null);
INSERT INTO `permission` VALUES ('63', '16', '3', '1', null);
INSERT INTO `permission` VALUES ('64', '16', '4', '1', null);
INSERT INTO `permission` VALUES ('65', '17', '1', '1', null);
INSERT INTO `permission` VALUES ('66', '17', '2', '1', null);
INSERT INTO `permission` VALUES ('67', '17', '3', '1', null);
INSERT INTO `permission` VALUES ('68', '17', '4', '1', null);
INSERT INTO `permission` VALUES ('72', '18', '4', '1', null);
INSERT INTO `permission` VALUES ('73', '19', '1', '1', null);
INSERT INTO `permission` VALUES ('74', '19', '2', '1', null);
INSERT INTO `permission` VALUES ('75', '19', '3', '1', null);
INSERT INTO `permission` VALUES ('76', '19', '4', '1', null);
INSERT INTO `permission` VALUES ('78', '20', '2', '1', null);
INSERT INTO `permission` VALUES ('80', '20', '4', '1', null);
INSERT INTO `permission` VALUES ('82', '21', '2', '1', null);
INSERT INTO `permission` VALUES ('84', '21', '4', '1', null);
INSERT INTO `permission` VALUES ('87', '22', '3', '1', null);
INSERT INTO `permission` VALUES ('88', '22', '4', '1', null);
INSERT INTO `permission` VALUES ('89', '23', '1', '1', null);
INSERT INTO `permission` VALUES ('90', '23', '2', '1', null);
INSERT INTO `permission` VALUES ('91', '23', '3', '1', null);
INSERT INTO `permission` VALUES ('92', '23', '4', '1', null);
INSERT INTO `permission` VALUES ('98', '25', '2', '1', null);
INSERT INTO `permission` VALUES ('100', '25', '4', '1', null);
INSERT INTO `permission` VALUES ('102', '26', '2', '1', null);
INSERT INTO `permission` VALUES ('104', '26', '4', '1', null);
INSERT INTO `permission` VALUES ('105', '24', '1', '1', null);
INSERT INTO `permission` VALUES ('106', '24', '2', '1', null);
INSERT INTO `permission` VALUES ('107', '24', '3', '1', null);
INSERT INTO `permission` VALUES ('108', '24', '4', '1', null);
INSERT INTO `permission` VALUES ('119', '27', '3', '1', null);
INSERT INTO `permission` VALUES ('120', '27', '4', '1', null);
INSERT INTO `permission` VALUES ('121', '28', '1', '1', null);
INSERT INTO `permission` VALUES ('122', '28', '2', '1', null);
INSERT INTO `permission` VALUES ('123', '28', '3', '1', null);
INSERT INTO `permission` VALUES ('124', '28', '4', '1', null);
INSERT INTO `permission` VALUES ('125', '29', '1', '1', null);
INSERT INTO `permission` VALUES ('126', '29', '2', '1', null);
INSERT INTO `permission` VALUES ('127', '29', '3', '1', null);
INSERT INTO `permission` VALUES ('128', '29', '4', '1', null);
INSERT INTO `permission` VALUES ('129', '30', '1', '1', null);
INSERT INTO `permission` VALUES ('130', '30', '2', '1', null);
INSERT INTO `permission` VALUES ('131', '30', '3', '1', null);
INSERT INTO `permission` VALUES ('132', '30', '4', '1', null);
INSERT INTO `permission` VALUES ('133', '31', '1', '1', null);
INSERT INTO `permission` VALUES ('134', '31', '2', '1', null);
INSERT INTO `permission` VALUES ('135', '31', '3', '1', null);
INSERT INTO `permission` VALUES ('136', '31', '4', '1', null);
INSERT INTO `permission` VALUES ('138', '32', '2', '1', null);
INSERT INTO `permission` VALUES ('140', '32', '4', '1', null);
INSERT INTO `permission` VALUES ('142', '33', '2', '1', null);
INSERT INTO `permission` VALUES ('144', '33', '4', '1', null);
INSERT INTO `permission` VALUES ('151', '35', '3', '1', null);
INSERT INTO `permission` VALUES ('152', '35', '4', '1', null);
INSERT INTO `permission` VALUES ('156', '34', '4', '1', null);
INSERT INTO `permission` VALUES ('161', '34', '3', '1', null);
INSERT INTO `permission` VALUES ('162', '38', '1', '1', '1');
INSERT INTO `permission` VALUES ('163', '38', '2', '1', '2');
INSERT INTO `permission` VALUES ('164', '38', '3', '1', '3');
INSERT INTO `permission` VALUES ('165', '38', '4', '1', '4');
INSERT INTO `permission` VALUES ('170', '40', '1', '1', '1');
INSERT INTO `permission` VALUES ('171', '40', '2', '1', '2');
INSERT INTO `permission` VALUES ('172', '40', '3', '1', '3');
INSERT INTO `permission` VALUES ('173', '40', '4', '1', '4');
INSERT INTO `permission` VALUES ('174', '41', '1', '1', '1');
INSERT INTO `permission` VALUES ('175', '41', '2', '1', '2');
INSERT INTO `permission` VALUES ('176', '41', '3', '1', '3');
INSERT INTO `permission` VALUES ('177', '41', '4', '1', '4');
INSERT INTO `permission` VALUES ('178', '42', '1', '1', '1');
INSERT INTO `permission` VALUES ('179', '42', '2', '1', '2');
INSERT INTO `permission` VALUES ('180', '42', '3', '1', '3');
INSERT INTO `permission` VALUES ('181', '42', '4', '1', '4');
INSERT INTO `permission` VALUES ('182', '43', '1', '1', '1');
INSERT INTO `permission` VALUES ('183', '43', '2', '1', '2');
INSERT INTO `permission` VALUES ('184', '43', '3', '1', '3');
INSERT INTO `permission` VALUES ('185', '43', '4', '1', '4');
INSERT INTO `permission` VALUES ('186', '44', '1', '1', '1');
INSERT INTO `permission` VALUES ('187', '44', '2', '1', '2');
INSERT INTO `permission` VALUES ('188', '44', '3', '1', '3');
INSERT INTO `permission` VALUES ('189', '44', '4', '1', '4');
INSERT INTO `permission` VALUES ('190', '45', '1', '1', '1');
INSERT INTO `permission` VALUES ('191', '45', '2', '1', '2');
INSERT INTO `permission` VALUES ('192', '45', '3', '1', '3');
INSERT INTO `permission` VALUES ('193', '45', '4', '1', '4');
INSERT INTO `permission` VALUES ('194', '46', '1', '1', '1');
INSERT INTO `permission` VALUES ('195', '46', '2', '1', '2');
INSERT INTO `permission` VALUES ('196', '46', '3', '1', '3');
INSERT INTO `permission` VALUES ('197', '46', '4', '1', '4');
INSERT INTO `permission` VALUES ('198', '47', '1', '1', '1');
INSERT INTO `permission` VALUES ('199', '47', '2', '1', '2');
INSERT INTO `permission` VALUES ('200', '47', '3', '1', '3');
INSERT INTO `permission` VALUES ('201', '47', '4', '1', '4');
INSERT INTO `permission` VALUES ('202', '48', '1', '1', '1');
INSERT INTO `permission` VALUES ('203', '48', '2', '1', '2');
INSERT INTO `permission` VALUES ('204', '48', '3', '1', '3');
INSERT INTO `permission` VALUES ('205', '48', '4', '1', '4');
INSERT INTO `permission` VALUES ('338', '82', '1', '1', null);
INSERT INTO `permission` VALUES ('339', '82', '2', '1', null);
INSERT INTO `permission` VALUES ('340', '82', '3', '1', null);
INSERT INTO `permission` VALUES ('341', '82', '4', '1', null);
INSERT INTO `permission` VALUES ('342', '83', '1', '1', '1');
INSERT INTO `permission` VALUES ('343', '83', '2', '1', '2');
INSERT INTO `permission` VALUES ('344', '83', '3', '1', '3');
INSERT INTO `permission` VALUES ('345', '83', '4', '1', '4');
INSERT INTO `permission` VALUES ('346', '84', '1', '1', '1');
INSERT INTO `permission` VALUES ('347', '84', '2', '1', '2');
INSERT INTO `permission` VALUES ('348', '84', '3', '1', '3');
INSERT INTO `permission` VALUES ('349', '84', '4', '1', '4');
INSERT INTO `permission` VALUES ('350', '85', '1', '1', '1');
INSERT INTO `permission` VALUES ('351', '85', '2', '1', '2');
INSERT INTO `permission` VALUES ('352', '85', '3', '1', '3');
INSERT INTO `permission` VALUES ('353', '85', '4', '1', '4');
INSERT INTO `permission` VALUES ('354', '86', '4', '1', null);
INSERT INTO `permission` VALUES ('355', '87', '3', '1', null);
INSERT INTO `permission` VALUES ('356', '87', '4', '1', null);
INSERT INTO `permission` VALUES ('357', '88', '1', '1', '1');
INSERT INTO `permission` VALUES ('358', '88', '2', '1', '2');
INSERT INTO `permission` VALUES ('359', '88', '3', '1', '3');
INSERT INTO `permission` VALUES ('360', '88', '4', '1', '4');
INSERT INTO `permission` VALUES ('361', '89', '2', '1', null);
INSERT INTO `permission` VALUES ('362', '89', '4', '1', null);
INSERT INTO `permission` VALUES ('363', '90', '2', '1', null);
INSERT INTO `permission` VALUES ('364', '90', '4', '1', null);
INSERT INTO `permission` VALUES ('365', '91', '3', '1', null);
INSERT INTO `permission` VALUES ('366', '91', '4', '1', null);
INSERT INTO `permission` VALUES ('367', '92', '1', '1', '1');
INSERT INTO `permission` VALUES ('368', '92', '2', '1', '2');
INSERT INTO `permission` VALUES ('369', '92', '3', '1', '3');
INSERT INTO `permission` VALUES ('370', '92', '4', '1', '4');
INSERT INTO `permission` VALUES ('371', '93', '1', '1', '1');
INSERT INTO `permission` VALUES ('372', '93', '2', '1', '2');
INSERT INTO `permission` VALUES ('373', '93', '3', '1', '3');
INSERT INTO `permission` VALUES ('374', '93', '4', '1', '4');
INSERT INTO `permission` VALUES ('375', '94', '1', '1', '1');
INSERT INTO `permission` VALUES ('376', '94', '2', '1', '2');
INSERT INTO `permission` VALUES ('377', '94', '3', '1', '3');
INSERT INTO `permission` VALUES ('378', '94', '4', '1', '4');
INSERT INTO `permission` VALUES ('379', '95', '4', '1', null);
INSERT INTO `permission` VALUES ('380', '96', '3', '1', null);
INSERT INTO `permission` VALUES ('381', '96', '4', '1', null);
INSERT INTO `permission` VALUES ('382', '97', '1', '1', '1');
INSERT INTO `permission` VALUES ('383', '97', '2', '1', '2');
INSERT INTO `permission` VALUES ('384', '97', '3', '1', '3');
INSERT INTO `permission` VALUES ('385', '97', '4', '1', '4');
INSERT INTO `permission` VALUES ('386', '98', '2', '1', null);
INSERT INTO `permission` VALUES ('387', '98', '4', '1', null);
INSERT INTO `permission` VALUES ('388', '99', '2', '1', null);
INSERT INTO `permission` VALUES ('389', '99', '4', '1', null);
INSERT INTO `permission` VALUES ('390', '100', '3', '1', null);
INSERT INTO `permission` VALUES ('391', '100', '4', '1', null);
INSERT INTO `permission` VALUES ('392', '101', '1', '1', '1');
INSERT INTO `permission` VALUES ('393', '101', '2', '1', '2');
INSERT INTO `permission` VALUES ('394', '101', '3', '1', '3');
INSERT INTO `permission` VALUES ('395', '101', '4', '1', '4');
INSERT INTO `permission` VALUES ('396', '102', '1', '1', '1');
INSERT INTO `permission` VALUES ('397', '102', '2', '1', '2');
INSERT INTO `permission` VALUES ('398', '102', '3', '1', '3');
INSERT INTO `permission` VALUES ('399', '102', '4', '1', '4');
INSERT INTO `permission` VALUES ('400', '103', '1', '1', '1');
INSERT INTO `permission` VALUES ('401', '103', '2', '1', '2');
INSERT INTO `permission` VALUES ('402', '103', '3', '1', '3');
INSERT INTO `permission` VALUES ('403', '103', '4', '1', '4');
INSERT INTO `permission` VALUES ('404', '104', '3', '1', null);
INSERT INTO `permission` VALUES ('405', '104', '4', '1', null);
INSERT INTO `permission` VALUES ('406', '105', '1', '1', '1');
INSERT INTO `permission` VALUES ('407', '105', '2', '1', '2');
INSERT INTO `permission` VALUES ('408', '105', '3', '1', '3');
INSERT INTO `permission` VALUES ('409', '105', '4', '1', '4');
INSERT INTO `permission` VALUES ('410', '106', '2', '1', null);
INSERT INTO `permission` VALUES ('411', '106', '4', '1', null);
INSERT INTO `permission` VALUES ('412', '107', '2', '1', null);
INSERT INTO `permission` VALUES ('413', '107', '4', '1', null);
INSERT INTO `permission` VALUES ('414', '108', '3', '1', null);
INSERT INTO `permission` VALUES ('415', '108', '4', '1', null);
INSERT INTO `permission` VALUES ('416', '109', '4', '1', null);
INSERT INTO `permission` VALUES ('417', '110', '4', '1', null);
INSERT INTO `permission` VALUES ('418', '111', '1', '1', '1');
INSERT INTO `permission` VALUES ('419', '111', '2', '1', '2');
INSERT INTO `permission` VALUES ('420', '111', '3', '1', '3');
INSERT INTO `permission` VALUES ('421', '111', '4', '1', '4');
INSERT INTO `permission` VALUES ('422', '112', '1', '1', '1');
INSERT INTO `permission` VALUES ('423', '112', '2', '1', '2');
INSERT INTO `permission` VALUES ('424', '112', '3', '1', '3');
INSERT INTO `permission` VALUES ('425', '112', '4', '1', '4');
INSERT INTO `permission` VALUES ('426', '113', '1', '1', '1');
INSERT INTO `permission` VALUES ('427', '113', '2', '1', '2');
INSERT INTO `permission` VALUES ('428', '113', '3', '1', '3');
INSERT INTO `permission` VALUES ('429', '113', '4', '1', '4');
INSERT INTO `permission` VALUES ('430', '114', '4', '1', null);
INSERT INTO `permission` VALUES ('431', '115', '3', '1', null);
INSERT INTO `permission` VALUES ('432', '115', '4', '1', null);
INSERT INTO `permission` VALUES ('433', '116', '1', '1', '1');
INSERT INTO `permission` VALUES ('434', '116', '2', '1', '2');
INSERT INTO `permission` VALUES ('435', '116', '3', '1', '3');
INSERT INTO `permission` VALUES ('436', '116', '4', '1', '4');
INSERT INTO `permission` VALUES ('437', '117', '2', '1', null);
INSERT INTO `permission` VALUES ('438', '117', '4', '1', null);
INSERT INTO `permission` VALUES ('439', '118', '2', '1', null);
INSERT INTO `permission` VALUES ('440', '118', '4', '1', null);
INSERT INTO `permission` VALUES ('441', '119', '3', '1', null);
INSERT INTO `permission` VALUES ('442', '119', '4', '1', null);
INSERT INTO `permission` VALUES ('443', '120', '1', '1', '1');
INSERT INTO `permission` VALUES ('444', '120', '2', '1', '2');
INSERT INTO `permission` VALUES ('445', '120', '3', '1', '3');
INSERT INTO `permission` VALUES ('446', '120', '4', '1', '4');
INSERT INTO `permission` VALUES ('447', '121', '1', '1', '1');
INSERT INTO `permission` VALUES ('448', '121', '2', '1', '2');
INSERT INTO `permission` VALUES ('449', '121', '3', '1', '3');
INSERT INTO `permission` VALUES ('450', '121', '4', '1', '4');
INSERT INTO `permission` VALUES ('451', '122', '1', '1', '1');
INSERT INTO `permission` VALUES ('452', '122', '2', '1', '2');
INSERT INTO `permission` VALUES ('453', '122', '3', '1', '3');
INSERT INTO `permission` VALUES ('454', '122', '4', '1', '4');
INSERT INTO `permission` VALUES ('455', '123', '4', '1', null);
INSERT INTO `permission` VALUES ('456', '124', '3', '1', null);
INSERT INTO `permission` VALUES ('457', '124', '4', '1', null);
INSERT INTO `permission` VALUES ('458', '125', '1', '1', '1');
INSERT INTO `permission` VALUES ('459', '125', '2', '1', '2');
INSERT INTO `permission` VALUES ('460', '125', '3', '1', '3');
INSERT INTO `permission` VALUES ('461', '125', '4', '1', '4');
INSERT INTO `permission` VALUES ('462', '126', '2', '1', null);
INSERT INTO `permission` VALUES ('463', '126', '4', '1', null);
INSERT INTO `permission` VALUES ('464', '127', '2', '1', null);
INSERT INTO `permission` VALUES ('465', '127', '4', '1', null);
INSERT INTO `permission` VALUES ('466', '128', '1', '1', '1');
INSERT INTO `permission` VALUES ('467', '128', '2', '1', '2');
INSERT INTO `permission` VALUES ('468', '128', '3', '1', '3');
INSERT INTO `permission` VALUES ('469', '128', '4', '1', '4');
INSERT INTO `permission` VALUES ('470', '129', '3', '1', null);
INSERT INTO `permission` VALUES ('471', '129', '4', '1', null);
INSERT INTO `permission` VALUES ('472', '130', '1', '1', '1');
INSERT INTO `permission` VALUES ('473', '130', '2', '1', '2');
INSERT INTO `permission` VALUES ('474', '130', '3', '1', '3');
INSERT INTO `permission` VALUES ('475', '130', '4', '1', '4');
INSERT INTO `permission` VALUES ('476', '131', '1', '1', '1');
INSERT INTO `permission` VALUES ('477', '131', '2', '1', '2');
INSERT INTO `permission` VALUES ('478', '131', '3', '1', '3');
INSERT INTO `permission` VALUES ('479', '131', '4', '1', '4');
INSERT INTO `permission` VALUES ('480', '132', '3', '1', null);
INSERT INTO `permission` VALUES ('481', '132', '4', '1', null);
INSERT INTO `permission` VALUES ('482', '133', '1', '1', '1');
INSERT INTO `permission` VALUES ('483', '133', '2', '1', '2');
INSERT INTO `permission` VALUES ('484', '133', '3', '1', '3');
INSERT INTO `permission` VALUES ('485', '133', '4', '1', '4');
INSERT INTO `permission` VALUES ('486', '134', '2', '1', null);
INSERT INTO `permission` VALUES ('487', '134', '4', '1', null);
INSERT INTO `permission` VALUES ('488', '135', '2', '1', null);
INSERT INTO `permission` VALUES ('489', '135', '4', '1', null);
INSERT INTO `permission` VALUES ('490', '136', '3', '1', null);
INSERT INTO `permission` VALUES ('491', '136', '4', '1', null);
INSERT INTO `permission` VALUES ('492', '137', '4', '1', null);
INSERT INTO `permission` VALUES ('493', '138', '4', '1', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=593 DEFAULT CHARSET=utf8;

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
INSERT INTO `player_data` VALUES ('84', '12', '0', '0', '0', '0', '0', '0', '0', '0', '0');
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
INSERT INTO `player_data` VALUES ('524', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('525', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('526', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('527', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('528', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('529', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('530', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('531', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('532', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player_data` VALUES ('534', '23', '0', '0', '55', '0', '5', '0', '4', '0', '5');
INSERT INTO `player_data` VALUES ('535', '30', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `player_data` VALUES ('536', '12', '3', '2', '2', '1', '1', '1', '1', '1', '1');
INSERT INTO `player_data` VALUES ('537', '32', '5', '3', '4', '1', '2', '2', '2', '2', '1');
INSERT INTO `player_data` VALUES ('538', '11', '4', '4', '3', '3', '2', '2', '2', '2', '1');
INSERT INTO `player_data` VALUES ('539', '22', '8', '4', '4', '3', '2', '2', '2', '2', '1');
INSERT INTO `player_data` VALUES ('540', '21', '6', '5', '5', '2', '2', '2', '2', '2', '1');
INSERT INTO `player_data` VALUES ('541', '2', '8', '5', '3', '3', '2', '2', '2', '2', '1');
INSERT INTO `player_data` VALUES ('542', '1', '2', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `player_data` VALUES ('543', '3', '3', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `player_data` VALUES ('544', '22', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `player_data` VALUES ('545', '30', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `player_data` VALUES ('546', '12', '3', '2', '2', '1', '1', '1', '1', '1', '1');
INSERT INTO `player_data` VALUES ('547', '32', '5', '3', '4', '1', '2', '2', '2', '2', '1');
INSERT INTO `player_data` VALUES ('548', '11', '4', '4', '3', '3', '2', '2', '2', '2', '1');
INSERT INTO `player_data` VALUES ('549', '22', '8', '4', '4', '3', '2', '2', '2', '2', '1');
INSERT INTO `player_data` VALUES ('550', '21', '6', '5', '5', '2', '2', '2', '2', '2', '1');
INSERT INTO `player_data` VALUES ('551', '2', '8', '5', '3', '3', '2', '2', '2', '2', '1');
INSERT INTO `player_data` VALUES ('552', '1', '2', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `player_data` VALUES ('553', '3', '3', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `player_data` VALUES ('554', '22', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `player_data` VALUES ('555', '3', '3', '2', '2', '1', '1', '1', '1', '1', '1');
INSERT INTO `player_data` VALUES ('556', '33', '5', '3', '4', '1', '2', '2', '2', '2', '1');
INSERT INTO `player_data` VALUES ('557', '2', '4', '4', '3', '3', '2', '2', '2', '2', '1');
INSERT INTO `player_data` VALUES ('558', '22', '8', '4', '4', '3', '2', '2', '2', '2', '1');
INSERT INTO `player_data` VALUES ('559', '22', '6', '5', '5', '2', '2', '2', '2', '2', '1');
INSERT INTO `player_data` VALUES ('560', '11', '8', '5', '3', '3', '2', '2', '2', '2', '1');
INSERT INTO `player_data` VALUES ('561', '30', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `player_data` VALUES ('562', '12', '3', '2', '2', '1', '1', '1', '1', '1', '1');
INSERT INTO `player_data` VALUES ('563', '32', '5', '3', '4', '1', '2', '2', '2', '2', '1');
INSERT INTO `player_data` VALUES ('564', '11', '4', '4', '3', '3', '2', '2', '2', '2', '1');
INSERT INTO `player_data` VALUES ('565', '22', '8', '4', '4', '3', '2', '2', '2', '2', '1');
INSERT INTO `player_data` VALUES ('566', '21', '6', '5', '5', '2', '2', '2', '2', '2', '1');
INSERT INTO `player_data` VALUES ('567', '2', '8', '5', '3', '3', '2', '2', '2', '2', '1');
INSERT INTO `player_data` VALUES ('568', '1', '2', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `player_data` VALUES ('569', '3', '3', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `player_data` VALUES ('570', '22', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `player_data` VALUES ('571', '3', '3', '2', '2', '1', '1', '1', '1', '1', '1');
INSERT INTO `player_data` VALUES ('572', '33', '5', '3', '4', '1', '2', '2', '2', '2', '1');
INSERT INTO `player_data` VALUES ('573', '2', '4', '4', '3', '3', '2', '2', '2', '2', '1');
INSERT INTO `player_data` VALUES ('574', '22', '8', '4', '4', '3', '2', '2', '2', '2', '1');
INSERT INTO `player_data` VALUES ('575', '22', '6', '5', '5', '2', '2', '2', '2', '2', '1');
INSERT INTO `player_data` VALUES ('576', '11', '8', '5', '3', '3', '2', '2', '2', '2', '1');
INSERT INTO `player_data` VALUES ('577', '30', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `player_data` VALUES ('578', '12', '3', '2', '2', '1', '1', '1', '1', '1', '1');
INSERT INTO `player_data` VALUES ('579', '32', '5', '3', '4', '1', '2', '2', '2', '2', '1');
INSERT INTO `player_data` VALUES ('580', '11', '4', '4', '3', '3', '2', '2', '2', '2', '1');
INSERT INTO `player_data` VALUES ('581', '22', '8', '4', '4', '3', '2', '2', '2', '2', '1');
INSERT INTO `player_data` VALUES ('582', '21', '6', '5', '5', '2', '2', '2', '2', '2', '1');
INSERT INTO `player_data` VALUES ('583', '2', '8', '5', '3', '3', '2', '2', '2', '2', '1');
INSERT INTO `player_data` VALUES ('584', '1', '2', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `player_data` VALUES ('585', '3', '3', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `player_data` VALUES ('586', '22', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `player_data` VALUES ('587', '3', '3', '2', '2', '1', '1', '1', '1', '1', '1');
INSERT INTO `player_data` VALUES ('588', '33', '5', '3', '4', '1', '2', '2', '2', '2', '1');
INSERT INTO `player_data` VALUES ('589', '2', '4', '4', '3', '3', '2', '2', '2', '2', '1');
INSERT INTO `player_data` VALUES ('590', '22', '8', '4', '4', '3', '2', '2', '2', '2', '1');
INSERT INTO `player_data` VALUES ('591', '22', '6', '5', '5', '2', '2', '2', '2', '2', '1');
INSERT INTO `player_data` VALUES ('592', '11', '8', '5', '3', '3', '2', '2', '2', '2', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reply
-- ----------------------------
INSERT INTO `reply` VALUES ('2', '2017-03-06 20:34:45', '<p>@超级管理员：你会<img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/c9/geili_thumb.gif\"></p><p><br></p>', '1', '3');
INSERT INTO `reply` VALUES ('3', '2017-03-06 21:05:29', '@超级管理员：在要工在', '1', '3');
INSERT INTO `reply` VALUES ('4', '2017-03-26 09:41:01', '超级管理员@叶同学：管理员回复你的测试', '7', '3');
INSERT INTO `reply` VALUES ('5', '2017-03-26 09:45:28', '叶同学@超级管理员：呵呵', '7', '15');
INSERT INTO `reply` VALUES ('6', '2017-03-26 10:18:10', '教练@叶同学：哈哈', '7', '4');
INSERT INTO `reply` VALUES ('7', '2017-04-05 12:54:57', '无敌领队@超级管理员：测试回复', '9', '6');
INSERT INTO `reply` VALUES ('8', '2017-04-05 13:00:24', '超级管理员@无敌领队：收到', '9', '3');
INSERT INTO `reply` VALUES ('9', '2017-04-05 14:48:08', '超级管理员@无敌领队：再收一次', '9', '3');
INSERT INTO `reply` VALUES ('10', '2017-04-05 14:55:29', '超级管理员@无敌领队：现', '9', '3');
INSERT INTO `reply` VALUES ('11', '2017-04-05 15:01:58', '超级管理员@无敌领队：tty', '9', '3');
INSERT INTO `reply` VALUES ('12', '2017-04-05 15:02:23', '超级管理员@无敌领队：tty', '9', '3');
INSERT INTO `reply` VALUES ('13', '2017-04-05 15:04:35', '无敌领队@超级管理员：呵呵', '9', '6');
INSERT INTO `reply` VALUES ('14', '2017-04-05 15:14:04', '无敌领队@超级管理员：哈哈', '9', '6');
INSERT INTO `reply` VALUES ('15', '2017-04-05 16:24:48', '无敌领队@超级管理员：起来了', '10', '6');
INSERT INTO `reply` VALUES ('16', '2017-04-05 18:57:32', '无敌领队@超级管理员：再没', '10', '6');
INSERT INTO `reply` VALUES ('17', '2017-04-05 18:58:43', '无敌领队@超级管理员：111', '10', '6');
INSERT INTO `reply` VALUES ('18', '2017-04-05 18:58:46', '无敌领队@超级管理员：222', '10', '6');
INSERT INTO `reply` VALUES ('19', '2017-04-05 19:01:55', '超级管理员@无敌领队：呵呵', '10', '3');
INSERT INTO `reply` VALUES ('20', '2017-04-08 12:20:09', '超级管理员@无敌领队：必须的', '11', '3');
INSERT INTO `reply` VALUES ('21', '2017-04-08 12:20:32', '无敌领队@超级管理员：哈哈', '11', '6');

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
  `shirt_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `game_id` (`game_id`),
  KEY `rival_player_data_ibfk_3` (`data_id`),
  CONSTRAINT `rival_player_data_ibfk_2` FOREIGN KEY (`game_id`) REFERENCES `game` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rival_player_data_ibfk_3` FOREIGN KEY (`data_id`) REFERENCES `player_data` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rival_player_data
-- ----------------------------
INSERT INTO `rival_player_data` VALUES ('19', '测试', null, '2', '1', '534', '33');
INSERT INTO `rival_player_data` VALUES ('34', '杜兰奇', '北理工本部', '2', '55', '586', '3');
INSERT INTO `rival_player_data` VALUES ('35', '杜兰金', '北理工本部', '1', '55', '587', '6');
INSERT INTO `rival_player_data` VALUES ('36', '杜兰森', '北理工本部', '3', '55', '588', '22');
INSERT INTO `rival_player_data` VALUES ('37', '杜兰木', '北理工本部', '4', '55', '589', '2');
INSERT INTO `rival_player_data` VALUES ('38', '杜兰工具', '北理工本部', '5', '55', '590', '5');
INSERT INTO `rival_player_data` VALUES ('39', '杜兰收入', '北理工本部', '2', '55', '591', '45');
INSERT INTO `rival_player_data` VALUES ('40', '杜兰喷火器', '北理工本部', '3', '55', '592', '24');

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
  CONSTRAINT `role_ibfk_2` FOREIGN KEY (`school_id`) REFERENCES `school` (`sch_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '超级管理员', '1', '1');
INSERT INTO `role` VALUES ('3', '教练', '2', '1');
INSERT INTO `role` VALUES ('4', '球员', '2', '1');
INSERT INTO `role` VALUES ('5', '领队', '2', '1');
INSERT INTO `role` VALUES ('12', '教练', '40', '1');
INSERT INTO `role` VALUES ('13', '领队', '40', '1');
INSERT INTO `role` VALUES ('14', '球员', '40', '1');
INSERT INTO `role` VALUES ('15', '教练', '41', '1');
INSERT INTO `role` VALUES ('16', '领队', '41', '1');
INSERT INTO `role` VALUES ('17', '球员', '41', '1');
INSERT INTO `role` VALUES ('18', '教练', '42', '1');
INSERT INTO `role` VALUES ('19', '领队', '42', '1');
INSERT INTO `role` VALUES ('20', '球员', '42', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of school
-- ----------------------------
INSERT INTO `school` VALUES ('1', '系统', '1486812729623.jpg', '1', '在在');
INSERT INTO `school` VALUES ('2', '北理珠', '1486813342607.jpg', '1', 'fsdgfsdgdfg');
INSERT INTO `school` VALUES ('40', '北师珠', null, '1', '');
INSERT INTO `school` VALUES ('41', '哈工大', null, '1', '珠海国际赛车场');
INSERT INTO `school` VALUES ('42', '北京理工大学珠海学院', '1491445758748.jpg', '1', '创办于2004年，是经教育部批准的本科院校。学校位于广东省珠海市唐家湾，为全国国际商务人才培养基地。');

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
) ENGINE=InnoDB AUTO_INCREMENT=446 DEFAULT CHARSET=utf8;

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
INSERT INTO `school_player_data` VALUES ('437', '5', '55', '577');
INSERT INTO `school_player_data` VALUES ('438', '8', '55', '578');
INSERT INTO `school_player_data` VALUES ('439', '9', '55', '579');
INSERT INTO `school_player_data` VALUES ('440', '10', '55', '580');
INSERT INTO `school_player_data` VALUES ('441', '11', '55', '581');
INSERT INTO `school_player_data` VALUES ('442', '12', '55', '582');
INSERT INTO `school_player_data` VALUES ('443', '13', '55', '583');
INSERT INTO `school_player_data` VALUES ('444', '14', '55', '584');
INSERT INTO `school_player_data` VALUES ('445', '15', '55', '585');

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
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sub_menu
-- ----------------------------
INSERT INTO `sub_menu` VALUES ('1', '1', '/school/schoolMngPage', '学校管理', '2', '1');
INSERT INTO `sub_menu` VALUES ('2', '1', '/role/roleMngPage', '角色管理', '3', '1');
INSERT INTO `sub_menu` VALUES ('3', '1', '/user/userMngPage', '人员管理', '1', '1');
INSERT INTO `sub_menu` VALUES ('4', '2', '/game/gameMngPage', '赛程管理', '1', '1');
INSERT INTO `sub_menu` VALUES ('5', '3', '/community/communityMngPage', '球队动态', '1', '1');
INSERT INTO `sub_menu` VALUES ('6', '4', '/user/userAddAndEditPage', '基本信息', null, '1');
INSERT INTO `sub_menu` VALUES ('7', '4', '/game/playerDataDetailPage', '个人数据', null, '1');
INSERT INTO `sub_menu` VALUES ('8', '5', '/game/gameMngPage', '赛程管理', null, '1');
INSERT INTO `sub_menu` VALUES ('9', '3', '/community/commentMngPage', '评论管理', null, '1');
INSERT INTO `sub_menu` VALUES ('10', '3', '/community/replyMngPage', '回复管理', null, '1');
INSERT INTO `sub_menu` VALUES ('11', '2', '/training/trainingMngPage', '训练计划', null, '1');
INSERT INTO `sub_menu` VALUES ('12', '2', '/attendance/attendanceMngPage', '考勤管理', null, '1');
INSERT INTO `sub_menu` VALUES ('13', '6', '/user/userMngPage', '人员管理', null, '1');
INSERT INTO `sub_menu` VALUES ('14', '6', '/role/roleMngPage', '角色管理', null, '1');
INSERT INTO `sub_menu` VALUES ('15', '7', '/game/gameMngPage', '赛程管理', null, '1');
INSERT INTO `sub_menu` VALUES ('16', '7', '/training/trainingMngPage', '训练计划', null, '1');
INSERT INTO `sub_menu` VALUES ('17', '7', '/attendance/attendanceMngPage', '考勤管理', null, '1');
INSERT INTO `sub_menu` VALUES ('18', '4', '/attendance/attendanceMngPage', '考勤记录', null, '1');
INSERT INTO `sub_menu` VALUES ('19', '9', '/community/communityMngPage', '球队动态', null, '1');
INSERT INTO `sub_menu` VALUES ('20', '9', '/community/commentMngPage', '评论管理', null, '1');
INSERT INTO `sub_menu` VALUES ('21', '9', '/community/replyMngPage', '回复管理', null, '1');
INSERT INTO `sub_menu` VALUES ('22', '7', '/school/schoolViewAndEditAction', '球队信息', null, '1');
INSERT INTO `sub_menu` VALUES ('23', '5', '/training/trainingMngPage', '训练计划', null, '1');
INSERT INTO `sub_menu` VALUES ('24', '10', '/community/communityMngPage', '球队动态', null, '1');
INSERT INTO `sub_menu` VALUES ('25', '10', '/community/commentMngPage', '个人评论', null, '1');
INSERT INTO `sub_menu` VALUES ('26', '10', '/community/replyMngPage', '个人回复', null, '1');
INSERT INTO `sub_menu` VALUES ('27', '11', '/user/userAddAndEditPage', '基本信息', null, '1');
INSERT INTO `sub_menu` VALUES ('28', '12', '/game/gameMngPage', '赛程管理', null, '1');
INSERT INTO `sub_menu` VALUES ('29', '12', '/training/trainingMngPage', '训练计划', null, '1');
INSERT INTO `sub_menu` VALUES ('30', '12', '/attendance/attendanceMngPage', '考勤管理', null, '1');
INSERT INTO `sub_menu` VALUES ('31', '13', '/community/communityMngPage', '球队动态', null, '1');
INSERT INTO `sub_menu` VALUES ('32', '13', '/community/commentMngPage', '个人评论', null, '1');
INSERT INTO `sub_menu` VALUES ('33', '13', '/community/replyMngPage', '个人回复', null, '1');
INSERT INTO `sub_menu` VALUES ('34', '5', '/school/schoolViewAndEditAction', '球队信息', null, '1');
INSERT INTO `sub_menu` VALUES ('35', '12', '/school/schoolViewAndEditAction', '球队信息', null, '1');
INSERT INTO `sub_menu` VALUES ('37', '2', '/game/playerMngPage', '球员数据', null, '1');
INSERT INTO `sub_menu` VALUES ('38', '14', '/attendance/attendanceMngPage', '考勤管理', '2', '1');
INSERT INTO `sub_menu` VALUES ('40', '14', '/game/playerMngPage', '球员数据', '5', '1');
INSERT INTO `sub_menu` VALUES ('41', '14', '/game/', '球队信息', '6', '1');
INSERT INTO `sub_menu` VALUES ('42', '15', '/community/communityMngPage', '球队动态', '1', '1');
INSERT INTO `sub_menu` VALUES ('43', '15', '/game/', '帖子管理', '2', '1');
INSERT INTO `sub_menu` VALUES ('44', '15', '/game/', '评论管理', '3', '1');
INSERT INTO `sub_menu` VALUES ('45', '15', '/bill/', '回复管理', '4', '1');
INSERT INTO `sub_menu` VALUES ('46', '17', '/game/', '基本信息', '1', '1');
INSERT INTO `sub_menu` VALUES ('47', '16', '/school/roleMng', '角色管理', '2', '1');
INSERT INTO `sub_menu` VALUES ('48', '16', '/school/userMng', '人员管理', '3', '1');
INSERT INTO `sub_menu` VALUES ('82', '7', '/game/playerMngPage', '球员数据', null, '1');
INSERT INTO `sub_menu` VALUES ('83', '18', '/game/gameMngPage', '赛程管理', '1', '1');
INSERT INTO `sub_menu` VALUES ('84', '18', '/attendance/attendanceMngPage', '考勤管理', '3', '1');
INSERT INTO `sub_menu` VALUES ('85', '18', '/training/trainingMngPage', '训练计划', '4', '1');
INSERT INTO `sub_menu` VALUES ('86', '18', '/game/playerMngPage', '球员数据', '2', '1');
INSERT INTO `sub_menu` VALUES ('87', '18', '/school/schoolViewAndEditAction', '球队信息', '5', '1');
INSERT INTO `sub_menu` VALUES ('88', '19', '/community/communityMngPage', '球队动态', '1', '1');
INSERT INTO `sub_menu` VALUES ('89', '19', '/community/commentMngPage', '个人评论', '2', '1');
INSERT INTO `sub_menu` VALUES ('90', '19', '/community/replyMngPage', '个人回复', '3', '1');
INSERT INTO `sub_menu` VALUES ('91', '20', '/user/userAddAndEditPage', '基本信息', '1', '1');
INSERT INTO `sub_menu` VALUES ('92', '21', '/game/gameMngPage', '赛程管理', '1', '1');
INSERT INTO `sub_menu` VALUES ('93', '21', '/attendance/attendanceMngPage', '考勤管理', '3', '1');
INSERT INTO `sub_menu` VALUES ('94', '21', '/training/trainingMngPage', '训练计划', '4', '1');
INSERT INTO `sub_menu` VALUES ('95', '21', '/game/playerMngPage', '球员数据', '2', '1');
INSERT INTO `sub_menu` VALUES ('96', '21', '/school/schoolViewAndEditAction', '球队信息', '5', '1');
INSERT INTO `sub_menu` VALUES ('97', '22', '/community/communityMngPage', '球队动态', '1', '1');
INSERT INTO `sub_menu` VALUES ('98', '22', '/community/commentMngPage', '评论管理', '2', '1');
INSERT INTO `sub_menu` VALUES ('99', '22', '/community/replyMngPage', '回复管理', '3', '1');
INSERT INTO `sub_menu` VALUES ('100', '23', '/role/roleMngPage', '角色管理', '2', '1');
INSERT INTO `sub_menu` VALUES ('101', '23', '/user/userMngPage', '人员管理', '1', '1');
INSERT INTO `sub_menu` VALUES ('102', '24', '/game/gameMngPage', '赛程管理', '1', '1');
INSERT INTO `sub_menu` VALUES ('103', '24', '/training/trainingMngPage', '训练计划', '2', '1');
INSERT INTO `sub_menu` VALUES ('104', '24', '/school/schoolViewAndEditAction', '球队信息', '3', '1');
INSERT INTO `sub_menu` VALUES ('105', '25', '/community/communityMngPage', '球队动态', '1', '1');
INSERT INTO `sub_menu` VALUES ('106', '25', '/community/commentMngPage', '个人评论', '2', '1');
INSERT INTO `sub_menu` VALUES ('107', '25', '/community/replyMngPage', '个人回复', '3', '1');
INSERT INTO `sub_menu` VALUES ('108', '26', '/user/userAddAndEditPage', '基本信息', '1', '1');
INSERT INTO `sub_menu` VALUES ('109', '26', '/game/playerMngPage', '个人数据', '2', '1');
INSERT INTO `sub_menu` VALUES ('110', '26', '/attendance/attendanceMngPage', '考勤记录', '3', '1');
INSERT INTO `sub_menu` VALUES ('111', '27', '/game/gameMngPage', '赛程管理', '1', '1');
INSERT INTO `sub_menu` VALUES ('112', '27', '/attendance/attendanceMngPage', '考勤管理', '3', '1');
INSERT INTO `sub_menu` VALUES ('113', '27', '/training/trainingMngPage', '训练计划', '4', '1');
INSERT INTO `sub_menu` VALUES ('114', '27', '/game/playerMngPage', '球员数据', '2', '1');
INSERT INTO `sub_menu` VALUES ('115', '27', '/school/schoolViewAndEditAction', '球队信息', '5', '1');
INSERT INTO `sub_menu` VALUES ('116', '28', '/community/communityMngPage', '球队动态', '1', '1');
INSERT INTO `sub_menu` VALUES ('117', '28', '/community/commentMngPage', '个人评论', '2', '1');
INSERT INTO `sub_menu` VALUES ('118', '28', '/community/replyMngPage', '个人回复', '3', '1');
INSERT INTO `sub_menu` VALUES ('119', '29', '/user/userAddAndEditPage', '基本信息', '1', '1');
INSERT INTO `sub_menu` VALUES ('120', '30', '/game/gameMngPage', '赛程管理', '1', '1');
INSERT INTO `sub_menu` VALUES ('121', '30', '/attendance/attendanceMngPage', '考勤管理', '3', '1');
INSERT INTO `sub_menu` VALUES ('122', '30', '/training/trainingMngPage', '训练计划', '4', '1');
INSERT INTO `sub_menu` VALUES ('123', '30', '/game/playerMngPage', '球员数据', '2', '1');
INSERT INTO `sub_menu` VALUES ('124', '30', '/school/schoolViewAndEditAction', '球队信息', '5', '1');
INSERT INTO `sub_menu` VALUES ('125', '31', '/community/communityMngPage', '球队动态', '1', '1');
INSERT INTO `sub_menu` VALUES ('126', '31', '/community/commentMngPage', '评论管理', '2', '1');
INSERT INTO `sub_menu` VALUES ('127', '31', '/community/replyMngPage', '回复管理', '3', '1');
INSERT INTO `sub_menu` VALUES ('128', '32', '/user/userMngPage', '人员管理', '1', '1');
INSERT INTO `sub_menu` VALUES ('129', '32', '/role/roleMngPage', '角色管理', '2', '1');
INSERT INTO `sub_menu` VALUES ('130', '33', '/game/gameMngPage', '赛程管理', '1', '1');
INSERT INTO `sub_menu` VALUES ('131', '33', '/training/trainingMngPage', '训练计划', '2', '1');
INSERT INTO `sub_menu` VALUES ('132', '33', '/school/schoolViewAndEditAction', '球队信息', '3', '1');
INSERT INTO `sub_menu` VALUES ('133', '34', '/community/communityMngPage', '球队动态', '1', '1');
INSERT INTO `sub_menu` VALUES ('134', '34', '/community/commentMngPage', '个人评论', '2', '1');
INSERT INTO `sub_menu` VALUES ('135', '34', '/community/replyMngPage', '个人回复', '3', '1');
INSERT INTO `sub_menu` VALUES ('136', '35', '/user/userAddAndEditPage', '基本信息', '1', '1');
INSERT INTO `sub_menu` VALUES ('137', '35', '/game/playerMngPage', '个人数据', '2', '1');
INSERT INTO `sub_menu` VALUES ('138', '35', '/attendance/attendanceMngPage', '考勤记录', '3', '1');

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
  CONSTRAINT `training_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `school` (`sch_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of training
-- ----------------------------
INSERT INTO `training` VALUES ('6', '2', '测试');
INSERT INTO `training` VALUES ('7', '2', '测试');
INSERT INTO `training` VALUES ('8', '2', '测试标题');
INSERT INTO `training` VALUES ('9', '2', '梦');

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
  CONSTRAINT `training_item_ibfk_1` FOREIGN KEY (`trainging_id`) REFERENCES `training` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of training_item
-- ----------------------------
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
INSERT INTO `training_item` VALUES ('46', '3', '32423543545', '99', '1', '9');
INSERT INTO `training_item` VALUES ('47', '3', '6666', '62', '1', '9');
INSERT INTO `training_item` VALUES ('48', '2', '311', '150', '1', '9');
INSERT INTO `training_item` VALUES ('49', '4', '425', '167', '1', '9');
INSERT INTO `training_item` VALUES ('50', '4', '844', '48', '2', '9');
INSERT INTO `training_item` VALUES ('51', '3', '842', '47', '2', '9');
INSERT INTO `training_item` VALUES ('52', '3', '90', '153', '2', '9');
INSERT INTO `training_item` VALUES ('53', '4', '554', '169', '2', '9');
INSERT INTO `training_item` VALUES ('54', '1', '392', '101', '3', '9');
INSERT INTO `training_item` VALUES ('55', '4', '540', '152', '3', '9');
INSERT INTO `training_item` VALUES ('56', '2', '302', '82', '3', '9');
INSERT INTO `training_item` VALUES ('57', '4', '531', '48', '3', '9');
INSERT INTO `training_item` VALUES ('58', '1', '673', '78', '4', '9');
INSERT INTO `training_item` VALUES ('59', '1', '395', '141', '4', '9');
INSERT INTO `training_item` VALUES ('60', '3', '652', '148', '4', '9');
INSERT INTO `training_item` VALUES ('61', '1', '321', '145', '4', '9');
INSERT INTO `training_item` VALUES ('62', '4', '958', '80', '5', '9');
INSERT INTO `training_item` VALUES ('63', '4', '328', '21', '5', '9');
INSERT INTO `training_item` VALUES ('64', '2', '929', '77', '5', '9');
INSERT INTO `training_item` VALUES ('65', '4', '665', '150', '5', '9');

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('3', 'admin', '123456', '超级管理员', '0', '1487480787259.jpg', '1', null, null, null, null, null, '1');
INSERT INTO `user` VALUES ('4', '13160672605', '123456', '教练', '1', '1487480787259.jpg', '1', null, null, null, null, null, '3');
INSERT INTO `user` VALUES ('5', '13160672621', '123456', '麦迪', '1', '1487480787259.jpg', '1', '1233', '222', '13级软件工程1班', '1', '2', '4');
INSERT INTO `user` VALUES ('6', '13160672603', '123456', '无敌领队', '1', '1487480787259.jpg', '1', '0', '0', '', '2', '5', '5');
INSERT INTO `user` VALUES ('8', '13254156748', '5416354135', '哈登', '1', '1487480816379.jpg', '0', '11', '22', '13级软件工程1班', '13', '1', '4');
INSERT INTO `user` VALUES ('9', '13254156748', '5416354135', '考辛斯', '1', '1487480963277.jpg', '1', '541', '3541', '大13级软件工程1班', '22', '5', '4');
INSERT INTO `user` VALUES ('10', '13152158745', 'sadfsdaf', '詹姆斯', '1', '1487480787259.jpg', '1', '111', '11', '13级软件工程1班', '6', '3', '4');
INSERT INTO `user` VALUES ('11', '13160672584', 'asddasdf', '威少', '1', '', '0', '1212', '333', '13级软件工程1班', '0', '1', '4');
INSERT INTO `user` VALUES ('12', '13160672222', 'asddasdf', '张继科', '1', '', '0', '1212', '333', '13级软件工程1班', '77', '4', '4');
INSERT INTO `user` VALUES ('13', '13160672221', 'asddasdf', '科比', '1', '', '1', '1212', '333', '13级软件工程1班', '24', '2', '4');
INSERT INTO `user` VALUES ('14', '13162587158', '3213213', '乔丹', '1', '1487481474906.jpg', '0', '213', '321', '13级软件工程1班', '23', '2', '4');
INSERT INTO `user` VALUES ('15', '13160672604', '123456', '叶同学', '1', '1489574650710.jpg', '1', '190', '0', '13级软件工程1班', '9', '1', '4');
INSERT INTO `user` VALUES ('16', '13160678954', '123456', '测试了', '1', '', '1', null, null, '', null, '1', '4');
INSERT INTO `user` VALUES ('17', '13160672123', '123456', '哈哈领队', '1', '', '1', null, null, '', null, null, '16');
INSERT INTO `user` VALUES ('19', '13160672121', '123456', '哈工学生', '1', '', '1', null, null, '', '1', '5', '17');
INSERT INTO `user` VALUES ('20', '13160682541', '123456', '余文乐', '1', '1491446178184.jpg', '1', '184', '68', '13级机械工程2班', '16', '1', '20');

-- ----------------------------
-- Procedure structure for pro_1
-- ----------------------------
DROP PROCEDURE IF EXISTS `pro_1`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_1`(IN account VARCHAR(20))
BEGIN
	DECLARE i INT DEFAULT 0;
	WHILE i<3 DO
		INSERT INTO user(phone,password,real_name,state) VALUES (account,'123456','测试过程',1);
	SET i=i+1;
  END WHILE;
END
;;
DELIMITER ;
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
