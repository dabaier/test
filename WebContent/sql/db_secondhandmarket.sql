/*
Navicat MySQL Data Transfer

Source Server         : mymarket
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : db_secondhandmarket

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2020-05-21 15:18:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(25) DEFAULT NULL COMMENT '账号',
  `phone` bigint(25) NOT NULL,
  `password` varchar(25) NOT NULL COMMENT '密码',
  `userRole` varchar(25) DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', '管理员1号', '18360920370', '1234567', '超级管理员');

-- ----------------------------
-- Table structure for `catelog`
-- ----------------------------
DROP TABLE IF EXISTS `catelog`;
CREATE TABLE `catelog` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(30) DEFAULT NULL COMMENT '分类名',
  `number` int(11) DEFAULT '0' COMMENT '该分类下的商品数量',
  `status` tinyint(10) DEFAULT '0' COMMENT '分类状态，0正常，1暂用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of catelog
-- ----------------------------
INSERT INTO `catelog` VALUES ('1', '闲置数码', '10', '1');
INSERT INTO `catelog` VALUES ('2', '校园代步', '4', '1');
INSERT INTO `catelog` VALUES ('3', '电器日用', '7', '1');
INSERT INTO `catelog` VALUES ('4', '图书教材', '8', '1');
INSERT INTO `catelog` VALUES ('5', '美妆衣物', '17', '1');
INSERT INTO `catelog` VALUES ('6', '运动棋牌', '5', '1');
INSERT INTO `catelog` VALUES ('7', '票券小物', '5', '1');

-- ----------------------------
-- Table structure for `comments`
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论主键',
  `user_id` int(11) DEFAULT NULL COMMENT '用户，外键',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品，外键',
  `content` varchar(255) DEFAULT NULL COMMENT '评论内容',
  `create_at` varchar(250) DEFAULT NULL COMMENT '评论时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES ('124', '23', '20', 'yyyyy', '2020-03-15 01:11:46');
INSERT INTO `comments` VALUES ('125', '23', '110', 'okokok', '2020-03-15 01:12:21');
INSERT INTO `comments` VALUES ('126', '23', '107', 'HHH', '2020-03-15 02:49:59');
INSERT INTO `comments` VALUES ('127', '1', '107', 'aaaaa', '2020-03-15 04:45:11');
INSERT INTO `comments` VALUES ('128', '25', '106', 'wow', '2020-03-15 02:20:06');
INSERT INTO `comments` VALUES ('130', '27', '5', 'hhhhhhh', '2020-04-19 10:23:27');

-- ----------------------------
-- Table structure for `focus`
-- ----------------------------
DROP TABLE IF EXISTS `focus`;
CREATE TABLE `focus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL COMMENT '外键 商品id',
  `user_id` int(11) DEFAULT NULL COMMENT '外键 用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of focus
-- ----------------------------
INSERT INTO `focus` VALUES ('1', '77', '5');
INSERT INTO `focus` VALUES ('4', '94', '4');
INSERT INTO `focus` VALUES ('5', '94', '4');
INSERT INTO `focus` VALUES ('6', '94', '4');
INSERT INTO `focus` VALUES ('8', '90', '9');
INSERT INTO `focus` VALUES ('9', '90', '22');
INSERT INTO `focus` VALUES ('18', '5', '23');
INSERT INTO `focus` VALUES ('19', '85', '23');
INSERT INTO `focus` VALUES ('20', '107', '1');
INSERT INTO `focus` VALUES ('33', '115', '25');
INSERT INTO `focus` VALUES ('34', '106', '25');
INSERT INTO `focus` VALUES ('35', '103', '25');
INSERT INTO `focus` VALUES ('36', '11', '25');
INSERT INTO `focus` VALUES ('37', '116', '25');
INSERT INTO `focus` VALUES ('38', '115', '26');
INSERT INTO `focus` VALUES ('39', '5', '30');
INSERT INTO `focus` VALUES ('40', '118', '27');
INSERT INTO `focus` VALUES ('41', '17', '31');
INSERT INTO `focus` VALUES ('43', '119', '32');
INSERT INTO `focus` VALUES ('44', '119', '33');

-- ----------------------------
-- Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品主键',
  `catelog_id` int(11) DEFAULT NULL COMMENT '商品分类，外键',
  `user_id` int(11) DEFAULT NULL COMMENT '用户外键',
  `name` varchar(50) DEFAULT NULL COMMENT '商品名称',
  `price` float(11,2) DEFAULT NULL COMMENT '出售价格',
  `real_price` float(11,2) DEFAULT NULL COMMENT '真实价格',
  `start_time` varchar(25) DEFAULT NULL COMMENT '发布时间',
  `polish_time` varchar(30) DEFAULT NULL COMMENT '擦亮时间，按该时间进行查询，精确到时分秒',
  `end_time` varchar(25) DEFAULT NULL COMMENT '下架时间',
  `describle` text COMMENT '详细信息',
  `status` int(11) DEFAULT '1' COMMENT '状态 上架1 下架0',
  PRIMARY KEY (`id`),
  KEY `catelog_id` (`catelog_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '6', '1', '小哑铃', '30.00', '50.00', '2020-03-18', '2020-03-18', '2020-04-18', '9成新，低价出售，有意者联系。', '0');
INSERT INTO `goods` VALUES ('2', '2', '1', '山地车', '1520.00', '890.00', '2020-03-18', '2020-03-18', '2020-04-18', '八成新山地车，无损坏，喜欢Call我。', '1');
INSERT INTO `goods` VALUES ('5', '1', '2', '数码相机', '580.00', '1350.00', '2020-03-18', '2020-03-18', '2020-04-18', '自用的数码相机，一年前购买，非常爱好，无磕碰。可议价。', '0');
INSERT INTO `goods` VALUES ('6', '1', '2', '笔记本电脑', '690.00', '2300.00', '2020-03-18', '2020-03-18', '2020-04-18', '7成新14寸笔记本电脑，商务本，适合办公，2G内存。', '1');
INSERT INTO `goods` VALUES ('8', '3', '1', '台灯', '32.00', '58.00', '2020-03-18', '2020-03-18', '2020-04-18', '考研时购买的台灯，可插USB接口。', '0');
INSERT INTO `goods` VALUES ('16', '6', '2', '瑜伽垫', '20.00', '40.00', '2020-03-18', '2020-03-18', '2020-04-18', '8成新，无损坏', '0');
INSERT INTO `goods` VALUES ('17', '4', '2', '二手小说', '10.00', '65.00', '2020-03-18', '2020-03-18', '2020-04-18', '毕业季，一书架小说，便宜出售。', '0');
INSERT INTO `goods` VALUES ('18', '4', '2', '公务员考试资料', '35.00', '79.00', '2020-03-18', '2020-03-18', '2020-04-18', '刚刚考完公务员的复习资料。淘宝购买，低价出售。', '1');
INSERT INTO `goods` VALUES ('20', '1', '4', 'Thinkpad笔记本', '1600.00', '2300.00', '2020-03-18', '2020-03-18', '2020-04-18', '京东购买的Thinkpad笔记本电脑，九成新。', '1');
INSERT INTO `goods` VALUES ('81', '2', '4', '168元出售全新自行车', '168.00', '899.00', '2020-03-18', '2020-03-18', '2020-04-18', '要毕业了，低价出手吧 要得给我打电话', '0');
INSERT INTO `goods` VALUES ('82', '2', '5', '二手 电动车', '1700.00', '2580.00', '2020-03-18', '2020-03-18', '2020-04-18', '羽铃电动车，购于2017年9月，个人原因想出，原价2850，现在二手出1700可刀，证牌齐全自用车，左后方车轮防护板断裂(如图)，车前头购买的时候就有划痕因为不影响使用就没叫老板换新的，一切破损不影响使用。', '1');
INSERT INTO `goods` VALUES ('83', '2', '6', '全新山地车特价：现价380元，原价498元，21速碟刹加厚铝合金轮子', '398.00', '498.00', '2020-03-18', '2020-03-18', '2020-04-18', '自身原因起不了。全新山地车特价：现价380元，原价498元，21速碟刹加厚铝合金轮子', '1');
INSERT INTO `goods` VALUES ('86', '7', '7', '收纳箱', '15.00', '20.00', '2020-03-18', '2020-03-18', '2020-04-18', '收纳箱9成新', '1');
INSERT INTO `goods` VALUES ('87', '7', '8', '存钱罐', '20.00', '35.00', '2020-03-18', '2020-03-18', '2020-04-18', '马口铁存钱罐，8成新', '1');
INSERT INTO `goods` VALUES ('88', '6', '9', '九成新仰卧板 便宜出售', '50.00', '150.00', '2020-03-18', '2020-03-18', '2020-04-18', '没用多少次 带不走便宜卖了', '1');
INSERT INTO `goods` VALUES ('90', '1', '10', '傲慢与偏见', '28.00', '58.00', '2020-03-18', '2020-03-18', '2020-04-18', '傲慢与偏见 百词斩阅读计划，全英文小说，词汇量2401-3200 正版全新 用百词斩软件扫描书内二维码可获取书籍配套全英文音频以及书籍配套词汇', '0');
INSERT INTO `goods` VALUES ('92', '5', '10', 'nyx眼影', '100.00', '160.00', '2020-03-18', '2020-03-18', '2020-04-18', '刚买的', '1');
INSERT INTO `goods` VALUES ('94', '3', '1', '烧水壶', '22.00', '50.00', '2020-03-18', '2020-03-18', '2020-04-18', '烧水壶功能一切都好，请放心使用', '1');
INSERT INTO `goods` VALUES ('95', '3', '1', '电风扇', '28.00', '59.00', '2020-03-18', '2020-03-18', '2020-04-18', '九成新', '1');
INSERT INTO `goods` VALUES ('105', '1', '23', '七七', '1.00', '1.00', '2020-03-18', '2020-03-18', '2020-04-18', '没脑没胸', '0');
INSERT INTO `goods` VALUES ('106', '5', '23', '资生堂金瓶防晒霜', '50.00', '260.00', '2020-03-18', '2020-03-18', '2020-04-18', '夏天必不可少的一款防晒霜，真的晒不黑哦。', '1');
INSERT INTO `goods` VALUES ('107', '5', '23', '露得清防晒喷雾', '40.00', '110.00', '2020-03-18', '2020-03-18', '2020-04-18', '很方便的防晒喷雾，可以随身携带，随时喷一喷。而且这款喷雾很清爽，一点也不油腻。', '0');
INSERT INTO `goods` VALUES ('108', '5', '23', '太阳镜', '10.00', '30.00', '2020-03-18', '2020-03-18', '2020-04-18', '可以用来遮阳的', '0');
INSERT INTO `goods` VALUES ('109', '5', '23', '傲滴 隐形眼镜护理液', '30.00', '60.00', '2020-03-18', '2020-03-18', '2020-04-18', '一款超级舒服的隐形眼镜护理液。', '1');
INSERT INTO `goods` VALUES ('111', '4', '23', '《你好，旧时光》', '30.00', '59.00', '2020-03-18', '2020-03-18', '2020-04-18', '八月长安的青春小说', '0');
INSERT INTO `goods` VALUES ('118', '5', '28', 'MAC口红', '110.00', '175.00', '2020-04-21', '2020-04-21', '2020-05-01', '新买的', '0');
INSERT INTO `goods` VALUES ('119', '5', '31', 'mac316', '125.00', '175.00', '2020-04-21', '2020-04-21', '2020-05-01', 'chili', '0');
INSERT INTO `goods` VALUES ('120', '5', '33', 'mac321', '140.00', '175.00', '2020-04-21', '2020-04-21', '2020-05-01', 'mac322', '0');

-- ----------------------------
-- Table structure for `image`
-- ----------------------------
DROP TABLE IF EXISTS `image`;
CREATE TABLE `image` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '图片主键',
  `goods_id` int(11) NOT NULL COMMENT '商品外键',
  `img_url` text NOT NULL COMMENT '图片链接',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of image
-- ----------------------------
INSERT INTO `image` VALUES ('1', '1', 'timg9.jpg');
INSERT INTO `image` VALUES ('2', '2', 'timg2.jpg');
INSERT INTO `image` VALUES ('3', '3', 'nopic3.png');
INSERT INTO `image` VALUES ('4', '4', 'nopic4.png');
INSERT INTO `image` VALUES ('5', '5', 'timg12.jpg');
INSERT INTO `image` VALUES ('6', '6', 'nopic6.png');
INSERT INTO `image` VALUES ('7', '7', 'nopic7.png');
INSERT INTO `image` VALUES ('8', '8', 'timg3.jpg');
INSERT INTO `image` VALUES ('9', '9', 'nopic9.png');
INSERT INTO `image` VALUES ('13', '13', 'nopic13.png');
INSERT INTO `image` VALUES ('16', '16', 'timg10.jpg');
INSERT INTO `image` VALUES ('17', '17', 'timg5.jpg');
INSERT INTO `image` VALUES ('18', '18', 'nopic18.png');
INSERT INTO `image` VALUES ('20', '20', 'nopic20.png');
INSERT INTO `image` VALUES ('21', '77', '4f320b75-427a-484e-b725-a2f5d066af6f.jpg');
INSERT INTO `image` VALUES ('81', '81', 'e62acc43-8122-421a-940b-a68e6aeadd30.jpg');
INSERT INTO `image` VALUES ('82', '82', '67a5f2ee-a09a-488d-9e7a-87ac6d8ab9c4.jpg');
INSERT INTO `image` VALUES ('83', '83', '110456d4-cc20-4fe2-b0a6-217b023d7dd6.jpg');
INSERT INTO `image` VALUES ('84', '84', '499afa59-53bc-4d23-99ef-5d0f9d60de69.jpg');
INSERT INTO `image` VALUES ('86', '86', 'timg8.jpg');
INSERT INTO `image` VALUES ('87', '87', 'timg7.jpg');
INSERT INTO `image` VALUES ('88', '88', '5c212d57-d8a4-4cc0-8853-dba957fba3d5.jpg');
INSERT INTO `image` VALUES ('89', '89', 'ec5369f6-7c87-43db-98aa-112efa91c8c6.JPG');
INSERT INTO `image` VALUES ('90', '90', 'fd680315-9ac8-4268-803e-7da7b492e8b0.JPG');
INSERT INTO `image` VALUES ('91', '91', '455e9ee5-92a7-4c7c-aa94-55f4373a16ee.JPG');
INSERT INTO `image` VALUES ('92', '92', 'timg13.jpg');
INSERT INTO `image` VALUES ('93', '93', 'dc4f9591-bd1a-4eac-b1ea-be6412296fb6.png');
INSERT INTO `image` VALUES ('94', '94', '7eb89aaa-56c0-4283-893f-bd5718301d80.jpg');
INSERT INTO `image` VALUES ('95', '95', 'timg11.jpg');
INSERT INTO `image` VALUES ('96', '96', '451c3aa2-529d-449d-b69f-b8771af1d806.jpg');
INSERT INTO `image` VALUES ('97', '97', 'ee6e735c-6479-40bb-b45f-69888c42862e.jpg');
INSERT INTO `image` VALUES ('98', '98', '2f92136b-af5b-45f4-902d-7bb1d0ad0809.png');
INSERT INTO `image` VALUES ('99', '99', '022fe88a-5328-4b42-8333-10b782d39373.png');
INSERT INTO `image` VALUES ('100', '100', 'a1f11b39-490b-42ef-a8e1-44285c4a80d4.png');
INSERT INTO `image` VALUES ('101', '101', '0f022547-b2cb-45fe-ab86-fb8b6d70adbc.jpg');
INSERT INTO `image` VALUES ('105', '105', '504d47df-32b0-4195-b63c-10d1562896cc.jpg');
INSERT INTO `image` VALUES ('106', '106', 'a634ca2b-70cc-404d-95cb-fc4166fe6706.jpg');
INSERT INTO `image` VALUES ('107', '107', '1ba8f318-fbf3-42f6-b8d9-0baa7e678cec.jpg');
INSERT INTO `image` VALUES ('108', '108', 'afd57674-338c-414f-98ae-78e0d25b12f8.jpg');
INSERT INTO `image` VALUES ('109', '109', '330a9a46-6434-4d04-a72b-a91a14035229.jpg');
INSERT INTO `image` VALUES ('110', '110', '0583cb1e-6acd-46da-bebc-4a9f1d6c3ac7.jpg');
INSERT INTO `image` VALUES ('111', '111', 'timg6.jpg');
INSERT INTO `image` VALUES ('112', '112', '854dff80-d049-4381-ae40-d1d23cd0e88b.jpg');
INSERT INTO `image` VALUES ('116', '116', 'f0983943-2dea-4a19-a96f-989d6ee70780.png');
INSERT INTO `image` VALUES ('117', '117', 'mac.jpg');
INSERT INTO `image` VALUES ('118', '118', '76aefff2-407d-40db-bbed-8523a7076d34.jpg');
INSERT INTO `image` VALUES ('119', '119', '339e2f38-8fbb-41f6-b7d6-4f9f32fff7f3.jpg');
INSERT INTO `image` VALUES ('120', '120', 'd7f4903b-759c-4cb3-ab76-7aff4081db47.jpg');
INSERT INTO `image` VALUES ('121', '121', '61a3cbde-b9aa-4224-8614-0deca2f8beae.jpg');

-- ----------------------------
-- Table structure for `notice`
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统信息主键',
  `user_id` int(11) DEFAULT NULL COMMENT '用户，外键',
  `context` text COMMENT '信息内容',
  `create_at` varchar(25) DEFAULT NULL COMMENT '推送信息时间',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态，0未读，1已读',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('13', '8', '啦啦啦啦', '2020-03-15 18:05:40', '0');
INSERT INTO `notice` VALUES ('14', '8', '哈哈哈哈', '2020-03-15 18:06:04', '0');
INSERT INTO `notice` VALUES ('15', '23', 'ok', '2020-03-15 17:15:37', '0');
INSERT INTO `notice` VALUES ('16', '23', 'ok', '2020-03-15 23:25:55', '0');
INSERT INTO `notice` VALUES ('17', '25', 'yep', '2020-03-15 13:40:45', '0');
INSERT INTO `notice` VALUES ('18', '27', '有没有小桌子呀', '2020-04-20 21:06:48', '0');
INSERT INTO `notice` VALUES ('19', '28', '求台灯', '2020-04-21 20:04:26', '0');

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单表id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `order_num` bigint(25) DEFAULT NULL COMMENT '订单编号',
  `order_price` float(11,0) DEFAULT NULL COMMENT '订单价格',
  `order_state` int(11) DEFAULT '1' COMMENT '订单状态 1待发货 2待收货 3已完成',
  `order_information` varchar(50) DEFAULT NULL,
  `order_date` varchar(50) DEFAULT NULL COMMENT '下单时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('7', '26', '115', '28449530', '128', '1', '', '2020-03-15 03:55:18');
INSERT INTO `orders` VALUES ('8', '26', '116', '11362720', '216', '2', '', '2020-03-15 04:43:21');
INSERT INTO `orders` VALUES ('9', '25', '108', '18028926', '10', '1', '', '2020-03-15 04:45:03');
INSERT INTO `orders` VALUES ('10', '25', '111', '306706', '10', '1', '', '2020-03-15 04:45:34');
INSERT INTO `orders` VALUES ('11', '27', '1', '14541323', '30', '1', '', '2020-04-20 09:11:44');
INSERT INTO `orders` VALUES ('12', '30', '5', '72615466', '580', '1', '', '2020-04-21 07:57:52');
INSERT INTO `orders` VALUES ('13', '27', '118', '84959316', '100', '1', '', '2020-04-21 08:02:12');
INSERT INTO `orders` VALUES ('14', '31', '17', '53948007', '15', '1', '', '2020-04-21 08:24:18');
INSERT INTO `orders` VALUES ('15', '33', '119', '40212829', '130', '1', '', '2020-04-21 10:04:37');
INSERT INTO `orders` VALUES ('16', '27', '16', '87110025', '20', '1', '', '2020-05-21 12:31:30');
INSERT INTO `orders` VALUES ('17', '27', '120', '77773814', '140', '1', '', '2020-05-21 12:51:46');
INSERT INTO `orders` VALUES ('18', '27', '111', '38043981', '30', '1', '', '2020-05-21 12:55:30');
INSERT INTO `orders` VALUES ('19', '27', '8', '16444571', '32', '1', '', '2020-05-21 01:34:38');

-- ----------------------------
-- Table structure for `purse`
-- ----------------------------
DROP TABLE IF EXISTS `purse`;
CREATE TABLE `purse` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '钱包id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `balance` float(11,0) unsigned zerofill DEFAULT '00000000000' COMMENT '总钱数',
  `recharge` float(11,0) DEFAULT NULL COMMENT '充值钱数',
  `withdrawals` float(11,0) DEFAULT NULL COMMENT '提现钱数',
  `state` int(11) DEFAULT NULL COMMENT '状态 0未审核   已审核（1不通过 2通过）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of purse
-- ----------------------------
INSERT INTO `purse` VALUES ('1', '1', '00000000901', null, null, null);
INSERT INTO `purse` VALUES ('2', '2', '00000001138', null, null, null);
INSERT INTO `purse` VALUES ('3', '3', '00000002800', null, null, '2');
INSERT INTO `purse` VALUES ('4', '4', '00000007745', null, null, null);
INSERT INTO `purse` VALUES ('5', '5', '00000000052', null, null, null);
INSERT INTO `purse` VALUES ('6', '11', '00000001005', null, null, null);
INSERT INTO `purse` VALUES ('13', '18', '00000000000', null, null, null);
INSERT INTO `purse` VALUES ('14', '19', '00000000000', null, null, null);
INSERT INTO `purse` VALUES ('15', '20', '00000000000', null, null, null);
INSERT INTO `purse` VALUES ('16', '21', '00000001000', null, null, '2');
INSERT INTO `purse` VALUES ('17', '22', '00000000500', null, null, '2');
INSERT INTO `purse` VALUES ('18', '23', '00000001141', null, null, null);
INSERT INTO `purse` VALUES ('19', '24', '00000000000', null, null, null);
INSERT INTO `purse` VALUES ('20', '25', '00000000970', null, null, null);
INSERT INTO `purse` VALUES ('21', '26', '00000000156', null, null, null);
INSERT INTO `purse` VALUES ('22', '27', '00000000778', '100', null, '0');
INSERT INTO `purse` VALUES ('23', '28', '00000000000', null, null, null);
INSERT INTO `purse` VALUES ('24', '29', '00000000000', null, null, null);
INSERT INTO `purse` VALUES ('25', '30', '00000000420', null, null, '2');
INSERT INTO `purse` VALUES ('26', '31', '00000000990', null, null, '2');
INSERT INTO `purse` VALUES ('27', '32', '00000000000', null, null, null);
INSERT INTO `purse` VALUES ('28', '33', '00000000875', null, null, '2');

-- ----------------------------
-- Table structure for `reply`
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论回复主键',
  `user_id` int(11) DEFAULT NULL COMMENT '用户，外键',
  `atuser_id` int(11) DEFAULT NULL,
  `commet_id` int(11) DEFAULT NULL COMMENT '评论，外键',
  `content` text COMMENT '回复内容',
  `create_at` varchar(25) DEFAULT NULL COMMENT '回复时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reply
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` char(11) CHARACTER SET utf8 DEFAULT NULL COMMENT '登录使用的手机号',
  `username` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户名',
  `password` char(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '密码',
  `QQ` varchar(12) CHARACTER SET utf8 DEFAULT NULL COMMENT '即时通讯',
  `create_at` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '创建时间',
  `goods_num` int(11) DEFAULT '0' COMMENT '发布过的物品数量',
  `power` int(10) unsigned zerofill DEFAULT '0000000100' COMMENT '信用分，普通用户默认为100',
  `last_login` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '最近一次登陆时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '账号是否冻结，默认0未冻结',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '15190793001', 'one', '8B119459242727E19DBE572ED4710019', '2396769801', '2020-03-14 02:15', '3', '0000000100', null, '1');
INSERT INTO `user` VALUES ('2', '15190793002', 'aa', 'C4CA4238A0B923820DCC509A6F75849B', '2396769802', '2020-03-14 10:30', '2', '0000000100', null, '1');
INSERT INTO `user` VALUES ('3', '15190793003', 'bb', 'C4CA4238A0B923820DCC509A6F75849B', '2396769803', '2020-03-14 10:35', '2', '0000000100', null, '1');
INSERT INTO `user` VALUES ('4', '15190793004', 'cc', 'C4CA4238A0B923820DCC509A6F75849B', '2396769804', '2020-03-14 17:35', '2', '0000000100', '', '1');
INSERT INTO `user` VALUES ('5', '15190793005', 'dd', 'C4CA4238A0B923820DCC509A6F75849B', '2396769805', '2020-03-14 17:12', '1', '0000000100', null, '1');
INSERT INTO `user` VALUES ('6', '15190793006', 'ee', 'C4CA4238A0B923820DCC509A6F75849B', '2396769806', '2020-03-15 17:35', '1', '0000000100', null, '1');
INSERT INTO `user` VALUES ('7', '15190793007', 'aaa', 'C4CA4238A0B923820DCC509A6F75849B', '2396769807', '2020-03-15 17:48', '3', '0000000100', null, '1');
INSERT INTO `user` VALUES ('8', '15190793008', 'bbbb', 'C4CA4238A0B923820DCC509A6F75849B', '2396769808', '2020-03-15 17:35', '1', '0000000100', null, '1');
INSERT INTO `user` VALUES ('9', '15190793009', 'wen', 'C4CA4238A0B923820DCC509A6F75849B', '', '2020-03-15 17:12', '2', '0000000100', null, '1');
INSERT INTO `user` VALUES ('10', '15190793010', 'bbbb', 'C4CA4238A0B923820DCC509A6F75849B', '', '2020-03-15 02:15', '5', '0000000100', null, '1');
INSERT INTO `user` VALUES ('12', '15190793011', 'jun', 'C4CA4238A0B923820DCC509A6F75849B', '', '2020-03-15 17:37', '1', '0000000100', null, '1');
INSERT INTO `user` VALUES ('23', '15190793012', 'xiaojun', '202CB962AC59075B964B07152D234B70', '', '2020-03-15 12:25', '7', '0000000100', null, '1');
INSERT INTO `user` VALUES ('25', '15190793013', 'xiaoer', 'E10ADC3949BA59ABBE56E057F20F883E', '', '2020-03-15 13:41', '1', '0000000100', null, '1');
INSERT INTO `user` VALUES ('26', '15190793014', 'xiaoyi', 'E10ADC3949BA59ABBE56E057F20F883E', null, '2020-03-15 15:52', '0', '0000000100', null, '1');
INSERT INTO `user` VALUES ('27', '18360920370', 'LYLLY', 'E10ADC3949BA59ABBE56E057F20F883E', null, '2020-03-24 19:37', '3', '0000000100', null, '1');
INSERT INTO `user` VALUES ('28', '18360920371', 'ly', 'E10ADC3949BA59ABBE56E057F20F883E', null, '2020-04-21 19:35', '1', '0000000100', null, '1');
INSERT INTO `user` VALUES ('29', '18360920372', 'llll', 'E10ADC3949BA59ABBE56E057F20F883E', null, '2020-04-21 19:50', '0', '0000000100', null, '1');
INSERT INTO `user` VALUES ('30', '18360920373', 'ww', 'E10ADC3949BA59ABBE56E057F20F883E', '', '2020-04-21 19:51', '0', '0000000100', null, '1');
INSERT INTO `user` VALUES ('31', '18360920374', 'qqq', 'E10ADC3949BA59ABBE56E057F20F883E', '2396769800', '2020-04-21 20:22', '1', '0000000100', null, '1');
INSERT INTO `user` VALUES ('32', '18360920375', 'zzz', 'E10ADC3949BA59ABBE56E057F20F883E', null, '2020-04-21 20:52', '0', '0000000100', null, '1');
INSERT INTO `user` VALUES ('33', '18360920376', 'xx', 'E10ADC3949BA59ABBE56E057F20F883E', null, '2020-04-21 22:02', '1', '0000000100', null, '1');
