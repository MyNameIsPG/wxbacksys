/*
Navicat MySQL Data Transfer

Source Server         : 本机
Source Server Version : 60011
Source Host           : localhost:3306
Source Database       : wxxcx

Target Server Type    : MYSQL
Target Server Version : 60011
File Encoding         : 65001

Date: 2018-08-10 16:36:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_xcx_activity`
-- ----------------------------
DROP TABLE IF EXISTS `t_xcx_activity`;
CREATE TABLE `t_xcx_activity` (
  `uuid` varchar(32) NOT NULL COMMENT '活动uuid',
  `name` varchar(125) DEFAULT NULL COMMENT '活动名称',
  `cover` text COMMENT '活动封面',
  `activity_starttime` datetime NOT NULL COMMENT '活动开始时间',
  `activity_endtime` datetime NOT NULL COMMENT '活动结束时间',
  `sign_starttime` date NOT NULL COMMENT '报名开始时间',
  `sign_endtime` date NOT NULL COMMENT '报名结束时间',
  `limit_people` int(10) DEFAULT NULL COMMENT '人数限制',
  `activity_place` varchar(255) NOT NULL COMMENT '活动地点',
  `activity_detail` text COMMENT '活动详情',
  `volunteer_team_id` varchar(32) NOT NULL COMMENT '所属志愿者团队',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='活动';

-- ----------------------------
-- Records of t_xcx_activity
-- ----------------------------
INSERT INTO `t_xcx_activity` VALUES ('153049835481205', '西湖保护活动', 'http://www.hao123.com', '2018-07-30 09:30:00', '2018-08-31 18:00:00', '2018-07-01', '2018-07-31', '30', '西湖公园', 'adsfdsfsdf', '153049797815994', '2018-07-02 10:25:54', '2018-07-02 11:10:02');
INSERT INTO `t_xcx_activity` VALUES ('153049841232148', '梅溪湖保护活动', 'http://www.hao123.com', '2018-07-30 09:30:00', '2018-08-31 18:00:00', '2018-07-01', '2018-07-31', '30', '梅溪湖', 'adsfdsfsdf', '153049797815994', '2018-07-02 10:26:52', '2018-07-02 10:26:52');

-- ----------------------------
-- Table structure for `t_xcx_activity_registration`
-- ----------------------------
DROP TABLE IF EXISTS `t_xcx_activity_registration`;
CREATE TABLE `t_xcx_activity_registration` (
  `uuid` varchar(32) NOT NULL,
  `activity_id` varchar(32) NOT NULL COMMENT '活动id',
  `user_id` varchar(32) NOT NULL,
  `name` varchar(125) NOT NULL COMMENT '姓名',
  `age` int(3) NOT NULL COMMENT '年龄',
  `address` varchar(255) NOT NULL COMMENT '住址',
  `phone` varchar(32) DEFAULT NULL COMMENT '电话号码',
  `people_number` int(3) NOT NULL COMMENT '人数',
  `create_time` varchar(255) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='活动报名';

-- ----------------------------
-- Records of t_xcx_activity_registration
-- ----------------------------
INSERT INTO `t_xcx_activity_registration` VALUES ('153110183071658', '153049835481205', '153023746011592', '李四', '18', 'tttt', null, '2', '2018-07-09 10:03:50');

-- ----------------------------
-- Table structure for `t_xcx_authentication`
-- ----------------------------
DROP TABLE IF EXISTS `t_xcx_authentication`;
CREATE TABLE `t_xcx_authentication` (
  `uuid` varchar(32) NOT NULL COMMENT 'uuid',
  `user_id` varchar(32) NOT NULL COMMENT '用户id',
  `resident_id` varchar(32) NOT NULL COMMENT '居民id',
  `name` varchar(125) NOT NULL COMMENT '认证姓名',
  `card_number` varchar(32) NOT NULL COMMENT '认证身份证号码',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`,`resident_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='实名认证表';

-- ----------------------------
-- Records of t_xcx_authentication
-- ----------------------------
INSERT INTO `t_xcx_authentication` VALUES ('153067331104298', '153023693735376', '1', '张三', '11', '2018-07-04 11:01:51');

-- ----------------------------
-- Table structure for `t_xcx_booking_service`
-- ----------------------------
DROP TABLE IF EXISTS `t_xcx_booking_service`;
CREATE TABLE `t_xcx_booking_service` (
  `uuid` varchar(32) NOT NULL DEFAULT '' COMMENT 'uuid',
  `type` varchar(32) NOT NULL COMMENT '预约类型',
  `book_type` varchar(32) NOT NULL COMMENT '预约类别',
  `address` varchar(125) NOT NULL COMMENT '预约地点',
  `booking_time` datetime NOT NULL COMMENT '预约时间',
  `phone` varchar(32) NOT NULL COMMENT '联系电话',
  `remark` text COMMENT '备注',
  `user_id` varchar(32) NOT NULL COMMENT '预约人',
  `status` int(2) NOT NULL COMMENT '(状态 1：已读 2：未读)',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='预约服务';

-- ----------------------------
-- Records of t_xcx_booking_service
-- ----------------------------
INSERT INTO `t_xcx_booking_service` VALUES ('153069716975338', '153049720572388', '', 'test', '2018-07-04 09:00:00', '111111', '备注', '153023693735376', '2', '2018-07-04 17:39:29', '2018-07-04 17:55:53');

-- ----------------------------
-- Table structure for `t_xcx_committee`
-- ----------------------------
DROP TABLE IF EXISTS `t_xcx_committee`;
CREATE TABLE `t_xcx_committee` (
  `uuid` varchar(32) NOT NULL,
  `name` varchar(125) NOT NULL COMMENT '社区名称',
  `phone` varchar(32) NOT NULL COMMENT '社区联系电话',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='社区信息';

-- ----------------------------
-- Records of t_xcx_committee
-- ----------------------------

-- ----------------------------
-- Table structure for `t_xcx_hotline`
-- ----------------------------
DROP TABLE IF EXISTS `t_xcx_hotline`;
CREATE TABLE `t_xcx_hotline` (
  `uuid` varchar(32) NOT NULL COMMENT 'uuid',
  `phone` varchar(32) NOT NULL COMMENT '热线号码',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='热线号码';

-- ----------------------------
-- Records of t_xcx_hotline
-- ----------------------------
INSERT INTO `t_xcx_hotline` VALUES ('1', '18508477706');

-- ----------------------------
-- Table structure for `t_xcx_message`
-- ----------------------------
DROP TABLE IF EXISTS `t_xcx_message`;
CREATE TABLE `t_xcx_message` (
  `uuid` varchar(32) NOT NULL COMMENT 'uuid',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `user_id` varchar(32) NOT NULL COMMENT '用户uuid',
  `flag` int(2) NOT NULL COMMENT '状态（1：未读 2：已读）',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息';

-- ----------------------------
-- Records of t_xcx_message
-- ----------------------------
INSERT INTO `t_xcx_message` VALUES ('153060345614724', '志愿者申请', '恭喜你，环境保护志愿者团队审批通过！', '153023746011592', '1', '2018-07-03 15:37:36', '2018-07-03 15:37:36');
INSERT INTO `t_xcx_message` VALUES ('153060406250343', '志愿者申请', '对不起，环境保护志愿者团队拒绝了您的加入！', '153023746011592', '1', '2018-07-03 15:47:42', '2018-07-03 15:47:42');
INSERT INTO `t_xcx_message` VALUES ('153060460095394', '志愿者退出申请', '您好，环境保护志愿者团队已成功退出！', '153023746011592', '1', '2018-07-03 15:56:40', '2018-07-03 15:56:40');
INSERT INTO `t_xcx_message` VALUES ('153060468179280', '志愿者退出申请', '对不起，环境保护志愿者团队拒绝了您的申请！', '153023746011592', '2', '2018-07-03 15:58:01', '2018-07-05 15:22:28');

-- ----------------------------
-- Table structure for `t_xcx_resident`
-- ----------------------------
DROP TABLE IF EXISTS `t_xcx_resident`;
CREATE TABLE `t_xcx_resident` (
  `uuid` varchar(32) NOT NULL COMMENT 'uuid',
  `name` varchar(125) NOT NULL COMMENT '姓名',
  `phone` varchar(32) NOT NULL COMMENT '联系电话',
  `card_number` varchar(32) NOT NULL COMMENT '身份证号码',
  `sex` int(2) DEFAULT NULL COMMENT '(性别 1：男 2：女)',
  `flag` int(2) NOT NULL COMMENT '是否有效（1：有效 2：无效）',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='居民表';

-- ----------------------------
-- Records of t_xcx_resident
-- ----------------------------
INSERT INTO `t_xcx_resident` VALUES ('1', '张三', '1111', '11', '1', '1', '2018-07-04 10:55:38', '2018-07-04 10:55:43');
INSERT INTO `t_xcx_resident` VALUES ('153110886649040', '王五', '18508477707', '432503198803110014', '2', '1', '2018-07-09 12:01:06', '2018-07-09 12:01:06');

-- ----------------------------
-- Table structure for `t_xcx_type`
-- ----------------------------
DROP TABLE IF EXISTS `t_xcx_type`;
CREATE TABLE `t_xcx_type` (
  `uuid` varchar(32) NOT NULL COMMENT 'uuid',
  `name` varchar(125) NOT NULL COMMENT '名称',
  `code` varchar(32) NOT NULL COMMENT '类型编码',
  `flag` int(2) NOT NULL COMMENT '是否有效（1：有效 2：无效）',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='类型表';

-- ----------------------------
-- Records of t_xcx_type
-- ----------------------------
INSERT INTO `t_xcx_type` VALUES ('153025823239054', '志愿者团队类型', 'fwlx', '1', '2018-07-02 09:57:06', '2018-07-02 09:57:08');

-- ----------------------------
-- Table structure for `t_xcx_type_detail`
-- ----------------------------
DROP TABLE IF EXISTS `t_xcx_type_detail`;
CREATE TABLE `t_xcx_type_detail` (
  `uuid` varchar(32) NOT NULL COMMENT 'uuid',
  `name` varchar(125) NOT NULL COMMENT '名称',
  `type_id` varchar(32) NOT NULL COMMENT '所属类型',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_xcx_type_detail
-- ----------------------------
INSERT INTO `t_xcx_type_detail` VALUES ('153049720572388', '环境保护', '153025823239054', '2018-07-02 10:06:45', '2018-07-02 10:06:45');
INSERT INTO `t_xcx_type_detail` VALUES ('153049724075277', '老人关爱', '153025823239054', '2018-07-02 10:07:20', '2018-07-02 10:07:20');
INSERT INTO `t_xcx_type_detail` VALUES ('153049725197393', '手工课堂', '153025823239054', '2018-07-02 10:07:31', '2018-07-02 10:07:31');
INSERT INTO `t_xcx_type_detail` VALUES ('153049726659970', '科创园地', '153025823239054', '2018-07-02 10:07:46', '2018-07-02 10:07:46');
INSERT INTO `t_xcx_type_detail` VALUES ('153049728164352', '亲子活动', '153025823239054', '2018-07-02 10:08:01', '2018-07-02 10:08:01');
INSERT INTO `t_xcx_type_detail` VALUES ('153049730503275', '家电维修', '153025823239054', '2018-07-02 10:08:25', '2018-07-02 10:08:25');

-- ----------------------------
-- Table structure for `t_xcx_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_xcx_user`;
CREATE TABLE `t_xcx_user` (
  `uuid` varchar(32) NOT NULL COMMENT '用户uuid',
  `nick_name` varchar(125) DEFAULT NULL COMMENT '昵称',
  `real_name` varchar(125) DEFAULT NULL COMMENT '真实姓名',
  `head_url` varchar(255) DEFAULT NULL COMMENT '头像',
  `sex` int(2) DEFAULT NULL COMMENT '(性别 1：男 2：女)',
  `phone` varchar(32) DEFAULT NULL COMMENT '手机号码',
  `card_number` varchar(32) DEFAULT NULL COMMENT '身份证号码',
  `birthday` varchar(32) DEFAULT NULL COMMENT '出生日期',
  `domicile` varchar(255) DEFAULT NULL COMMENT '居住地',
  `vocation` varchar(125) DEFAULT NULL COMMENT '职业',
  `industry` varchar(125) DEFAULT NULL COMMENT '所属行业',
  `openid` varchar(32) DEFAULT NULL COMMENT '小程序openId',
  `appid` varchar(64) DEFAULT NULL COMMENT '应用id',
  `role` int(2) NOT NULL COMMENT '角色（1：普通用户  2：志愿者团队管理员  3:社区管理员）',
  `is_authentication` int(2) DEFAULT NULL COMMENT '是否实名认证（1：是 2：否）',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户';

-- ----------------------------
-- Records of t_xcx_user
-- ----------------------------
INSERT INTO `t_xcx_user` VALUES ('153023693735376', '张三', '张三', null, null, null, '11', '2000-01-21', null, null, null, 'xxxx111', '34343242', '1', '1', '2018-06-29 09:48:57', '2018-07-04 11:01:51');
INSERT INTO `t_xcx_user` VALUES ('153023746011592', '李四', null, null, null, null, null, '2001-01-21', null, null, null, 'xxxx111', '34343242', '2', '2', '2018-06-29 09:57:40', '2018-07-04 15:09:47');
INSERT INTO `t_xcx_user` VALUES ('153023746011593', 'admin', 'admin', null, null, null, null, null, null, null, null, '123456', null, '3', '1', '2018-07-05 14:14:51', '2018-07-05 14:14:56');
INSERT INTO `t_xcx_user` VALUES ('153076074368740', null, null, null, null, null, null, null, null, null, null, 'oBzz60KcpdjYEAe_rN91SL6r0cBU', 'wx886ac99b96a07e94', '1', '2', '2018-07-05 11:19:03', '2018-07-05 11:19:03');

-- ----------------------------
-- Table structure for `t_xcx_volunteer`
-- ----------------------------
DROP TABLE IF EXISTS `t_xcx_volunteer`;
CREATE TABLE `t_xcx_volunteer` (
  `uuid` varchar(32) NOT NULL COMMENT '志愿者uuid',
  `user_id` varchar(32) NOT NULL COMMENT '用户id',
  `name` varchar(32) NOT NULL COMMENT '志愿者姓名',
  `sex` int(2) DEFAULT NULL COMMENT '性别（1：男 2 女）',
  `birthday` varchar(32) DEFAULT NULL COMMENT '出生日期',
  `educational_level` int(2) DEFAULT NULL COMMENT '教育程度(1:中专及以下  2：大专 3：本科 4：本科以上)',
  `identity` int(2) DEFAULT NULL COMMENT '身份(1:学生 2：在职 3：待业 4其他)',
  `school_name` varchar(32) DEFAULT NULL COMMENT '学校名称',
  `major_class` varchar(32) DEFAULT NULL COMMENT '专业/班级',
  `industry` varchar(32) DEFAULT NULL COMMENT '所属行业',
  `is_duty` int(2) DEFAULT NULL COMMENT '是否参与义务服务（1：有  2 否）',
  `service_time` int(2) DEFAULT NULL COMMENT '服务时间(1:工作日 2：周末)',
  `phone` varchar(32) DEFAULT NULL COMMENT '联系电话',
  `domicile` varchar(255) DEFAULT NULL COMMENT '居住地',
  `stauts` int(2) DEFAULT NULL COMMENT '状态（1：待审批  2：已加入  3：失败 4：退出待审核 5：已退出）',
  `volunteer_team_id` varchar(32) NOT NULL COMMENT '所属志愿者团队',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='志愿者';

-- ----------------------------
-- Records of t_xcx_volunteer
-- ----------------------------
INSERT INTO `t_xcx_volunteer` VALUES ('153060057429667', '153023693735376', '张三', '1', '1988-07-12', '3', '2', 'test', 'test', 'test', '1', '2', '11111', '1111', '2', '153049797815994', '2018-07-03 14:49:34', '2018-07-03 15:58:01');
INSERT INTO `t_xcx_volunteer` VALUES ('153060103263939', '153023746011592', '李四', '1', '1988-07-12', '3', '2', 'test', 'test', 'test', '1', '2', '11111', '1111', '2', '153049797815994', '2018-07-03 14:57:12', '2018-07-03 15:37:36');

-- ----------------------------
-- Table structure for `t_xcx_volunteer_team`
-- ----------------------------
DROP TABLE IF EXISTS `t_xcx_volunteer_team`;
CREATE TABLE `t_xcx_volunteer_team` (
  `uuid` varchar(32) NOT NULL COMMENT '志愿者团队uuid',
  `name` varchar(255) NOT NULL COMMENT '志愿者团队名称',
  `type` varchar(32) NOT NULL COMMENT '所属类型',
  `service_type` varchar(125) DEFAULT NULL COMMENT '服务类型',
  `recruit_starttime` date NOT NULL COMMENT '招募开始时间',
  `recruit_endtime` date NOT NULL COMMENT '招募结束时间',
  `service_time` varchar(255) NOT NULL COMMENT '服务时间',
  `join_type` varchar(255) NOT NULL COMMENT '加入方式',
  `introduction` text COMMENT '简介',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='志愿者团队';

-- ----------------------------
-- Records of t_xcx_volunteer_team
-- ----------------------------
INSERT INTO `t_xcx_volunteer_team` VALUES ('153049797815994', '环境保护志愿者团队', '153049720572388', 'yyyyyyyyyy', '2018-06-29', '2019-06-30', 'xxxx', 'gggggg', 'kooafkosdf', '2018-07-02 10:19:38', '2018-07-02 10:39:43');

-- ----------------------------
-- Table structure for `t_xcx_vteam_evaluate`
-- ----------------------------
DROP TABLE IF EXISTS `t_xcx_vteam_evaluate`;
CREATE TABLE `t_xcx_vteam_evaluate` (
  `uuid` varchar(32) NOT NULL COMMENT 'uuid',
  `star_level` int(2) NOT NULL COMMENT '评星（1：一颗星 2：两颗星 3：三颗星 4：四颗星 5：五颗星）',
  `content` text COMMENT '评价内容',
  `user_id` varchar(32) NOT NULL COMMENT '用户id',
  `volunteer_team_id` varchar(32) NOT NULL COMMENT '所属志愿者团队id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评价';

-- ----------------------------
-- Records of t_xcx_vteam_evaluate
-- ----------------------------
INSERT INTO `t_xcx_vteam_evaluate` VALUES ('153051690275662', '1', 'teeee', '153023693735376', '153049797815994', '2018-07-02 15:35:02', '2018-07-02 15:35:02');
INSERT INTO `t_xcx_vteam_evaluate` VALUES ('153051692121497', '2', 'aaaa', '153023693735376', '153049797815994', '2018-07-02 15:35:21', '2018-07-02 15:35:21');
INSERT INTO `t_xcx_vteam_evaluate` VALUES ('153051692690562', '2', 'bbb', '153023693735376', '153049797815994', '2018-07-02 15:35:26', '2018-07-02 15:35:26');

-- ----------------------------
-- Table structure for `t_xcx_vteam_picture`
-- ----------------------------
DROP TABLE IF EXISTS `t_xcx_vteam_picture`;
CREATE TABLE `t_xcx_vteam_picture` (
  `uuid` varchar(32) NOT NULL COMMENT '志愿者团队图片uuid',
  `volunteer_team_id` varchar(32) NOT NULL COMMENT '志愿者团队uuid',
  `name` varchar(32) DEFAULT NULL COMMENT '图片名称',
  `url` varchar(255) NOT NULL COMMENT '图片链接',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='志愿者团队图片表';

-- ----------------------------
-- Records of t_xcx_vteam_picture
-- ----------------------------
INSERT INTO `t_xcx_vteam_picture` VALUES ('153049918365055', '153049797815994', 'aa.png', 'http://www.baidu.com', '2018-07-02 10:39:43', '2018-07-02 10:39:43');
INSERT INTO `t_xcx_vteam_picture` VALUES ('153049918365558', '153049797815994', 'bb.png', 'http://www.hao123.com', '2018-07-02 10:39:43', '2018-07-02 10:39:43');

-- ----------------------------
-- Table structure for `t_xcx_vteam_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_xcx_vteam_user`;
CREATE TABLE `t_xcx_vteam_user` (
  `uuid` varchar(32) NOT NULL COMMENT '志愿者团队管理员uuid',
  `volunteer_team_id` varchar(32) NOT NULL COMMENT '志愿者团队id',
  `user_id` varchar(32) NOT NULL COMMENT '用户id',
  `flag` int(2) NOT NULL COMMENT '是否有效（1：有效 2：无效）',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='志愿者管理人员表';

-- ----------------------------
-- Records of t_xcx_vteam_user
-- ----------------------------
INSERT INTO `t_xcx_vteam_user` VALUES ('153068788249979', '153049797815994', '153023746011592', '1', '2018-07-04 15:04:42', '2018-07-04 15:09:35');
