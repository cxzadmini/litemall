/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50725
Source Host           : localhost:3306
Source Database       : litemall

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2019-03-22 19:47:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for litemall_ad
-- ----------------------------
DROP TABLE IF EXISTS `litemall_ad`;
CREATE TABLE `litemall_ad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(63) NOT NULL DEFAULT '' COMMENT '广告标题',
  `link` varchar(255) NOT NULL DEFAULT '' COMMENT '所广告的商品页面或者活动页面链接地址',
  `url` varchar(255) NOT NULL COMMENT '广告宣传图片',
  `position` tinyint(3) DEFAULT '1' COMMENT '广告位置：1则是首页',
  `content` varchar(255) DEFAULT '' COMMENT '活动内容',
  `start_time` datetime DEFAULT NULL COMMENT '广告开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '广告结束时间',
  `enabled` tinyint(1) DEFAULT '0' COMMENT '是否启动',
  `add_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`),
  KEY `enabled` (`enabled`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='广告表';

-- ----------------------------
-- Records of litemall_ad
-- ----------------------------
INSERT INTO `litemall_ad` VALUES ('1', '合作 谁是你的菜', '', 'http://yanxuan.nosdn.127.net/65091eebc48899298171c2eb6696fe27.jpg', '1', '合作 谁是你的菜', null, null, '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_ad` VALUES ('2', '活动 美食节', '', 'http://yanxuan.nosdn.127.net/bff2e49136fcef1fd829f5036e07f116.jpg', '1', '活动 美食节', null, null, '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_ad` VALUES ('3', '活动 母亲节', '', 'http://yanxuan.nosdn.127.net/8e50c65fda145e6dd1bf4fb7ee0fcecc.jpg', '1', '活动 母亲节5', null, null, '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');

-- ----------------------------
-- Table structure for litemall_address
-- ----------------------------
DROP TABLE IF EXISTS `litemall_address`;
CREATE TABLE `litemall_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(63) NOT NULL DEFAULT '' COMMENT '收货人名称',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户表的用户ID',
  `province_id` int(11) NOT NULL DEFAULT '0' COMMENT '行政区域表的省ID',
  `city_id` int(11) NOT NULL DEFAULT '0' COMMENT '行政区域表的市ID',
  `area_id` int(11) NOT NULL DEFAULT '0' COMMENT '行政区域表的区县ID',
  `address` varchar(127) NOT NULL DEFAULT '' COMMENT '具体收货地址',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号码',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否默认地址',
  `add_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='收货地址表';

-- ----------------------------
-- Records of litemall_address
-- ----------------------------

-- ----------------------------
-- Table structure for litemall_admin
-- ----------------------------
DROP TABLE IF EXISTS `litemall_admin`;
CREATE TABLE `litemall_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(63) NOT NULL DEFAULT '' COMMENT '管理员名称',
  `password` varchar(63) NOT NULL DEFAULT '' COMMENT '管理员密码',
  `last_login_ip` varchar(63) DEFAULT '' COMMENT '最近一次登录IP地址',
  `last_login_time` datetime DEFAULT NULL COMMENT '最近一次登录时间',
  `avatar` varchar(255) DEFAULT '''' COMMENT '头像图片',
  `add_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  `role_ids` varchar(127) DEFAULT '[]' COMMENT '角色列表',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='管理员表';

-- ----------------------------
-- Records of litemall_admin
-- ----------------------------
INSERT INTO `litemall_admin` VALUES ('1', 'admin123', '$2a$10$.rEfyBb/GURD9P2p0fRg/OAJGloGNDkJS4lY0cQHeqDgsbdTylBpu', null, null, 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0', '[1]');
INSERT INTO `litemall_admin` VALUES ('4', 'promotion123', '$2a$10$wDZLOLLnzZ1EFZ3ldZ1XFOUWDEX6TnQCUFdJz4g.PoMaLTzS8TjWq', '', null, '\'', '2019-01-07 15:16:59', '2019-01-07 15:17:34', '0', '[3]');
INSERT INTO `litemall_admin` VALUES ('5', 'mall123', '$2a$10$aCtsc4rG6KmxQ59.IkYse.oRyKuwQoU2CPCmxSdB.d5nXq6aw/z4O', '', null, '\'', '2019-01-07 15:17:25', '2019-01-07 15:21:05', '0', '[2]');

-- ----------------------------
-- Table structure for litemall_brand
-- ----------------------------
DROP TABLE IF EXISTS `litemall_brand`;
CREATE TABLE `litemall_brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '品牌商名称',
  `desc` varchar(255) NOT NULL DEFAULT '' COMMENT '品牌商简介',
  `pic_url` varchar(255) NOT NULL DEFAULT '' COMMENT '品牌商页的品牌商图片',
  `sort_order` tinyint(3) DEFAULT '50',
  `floor_price` decimal(10,2) DEFAULT '0.00' COMMENT '品牌商的商品低价，仅用于页面展示',
  `add_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1024004 DEFAULT CHARSET=utf8mb4 COMMENT='品牌商表';

-- ----------------------------
-- Records of litemall_brand
-- ----------------------------
INSERT INTO `litemall_brand` VALUES ('1024000', '深大达科技有限公司', '深大达科技有限公司', 'http://yanxuan.nosdn.127.net/2018e9ac91ec37d9aaf437a1fd5d7070.png', '8', '9.90', '2018-02-01 00:00:00', '2019-03-19 20:14:41', '0');
INSERT INTO `litemall_brand` VALUES ('1024001', '雷曼斯特科技有限公司', '雷曼斯特科技有限公司', 'http://yanxuan.nosdn.127.net/bf3499ac17a11ffb9bb7caa47ebef2dd.png', '42', '39.00', '2018-02-01 00:00:00', '2019-03-19 20:14:36', '0');
INSERT INTO `litemall_brand` VALUES ('1024003', '江源科技有限公司', '江源科技有限公司', 'http://yanxuan.nosdn.127.net/3a44ae7db86f3f9b6e542720c54cc349.png', '28', '9.90', '2018-02-01 00:00:00', '2019-03-19 20:14:27', '0');

-- ----------------------------
-- Table structure for litemall_cart
-- ----------------------------
DROP TABLE IF EXISTS `litemall_cart`;
CREATE TABLE `litemall_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户表的用户ID',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品表的商品ID',
  `goods_sn` varchar(63) DEFAULT NULL COMMENT '商品编号',
  `goods_name` varchar(127) DEFAULT NULL COMMENT '商品名称',
  `product_id` int(11) DEFAULT NULL COMMENT '商品货品表的货品ID',
  `price` decimal(10,2) DEFAULT '0.00' COMMENT '商品货品的价格',
  `number` smallint(5) DEFAULT '0' COMMENT '商品货品的数量',
  `specifications` varchar(1023) DEFAULT NULL COMMENT '商品规格值列表，采用JSON数组格式',
  `checked` tinyint(1) DEFAULT '1' COMMENT '购物车中商品是否选择状态',
  `pic_url` varchar(255) DEFAULT NULL COMMENT '商品图片或者商品货品图片',
  `add_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='购物车商品表';

-- ----------------------------
-- Records of litemall_cart
-- ----------------------------

-- ----------------------------
-- Table structure for litemall_category
-- ----------------------------
DROP TABLE IF EXISTS `litemall_category`;
CREATE TABLE `litemall_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(63) NOT NULL DEFAULT '' COMMENT '类目名称',
  `keywords` varchar(1023) NOT NULL DEFAULT '' COMMENT '类目关键字，以JSON数组格式',
  `desc` varchar(255) DEFAULT '' COMMENT '类目广告语介绍',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父类目ID',
  `icon_url` varchar(255) DEFAULT '' COMMENT '类目图标',
  `pic_url` varchar(255) DEFAULT '' COMMENT '类目图片',
  `level` varchar(255) DEFAULT 'L1',
  `sort_order` tinyint(3) DEFAULT '50' COMMENT '排序',
  `add_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=1036006 DEFAULT CHARSET=utf8mb4 COMMENT='类目表';

-- ----------------------------
-- Records of litemall_category
-- ----------------------------
INSERT INTO `litemall_category` VALUES ('1005000', '锂电池', '', '回家，放松身心', '0', 'http://yanxuan.nosdn.127.net/a45c2c262a476fea0b9fc684fed91ef5.png', 'http://yanxuan.nosdn.127.net/e8bf0cf08cf7eda21606ab191762e35c.png', 'L1', '2', '2018-02-01 00:00:00', '2019-03-19 13:08:22', '0');
INSERT INTO `litemall_category` VALUES ('1005001', '聚合物', '', '爱，囿于厨房', '0', 'http://yanxuan.nosdn.127.net/ad8b00d084cb7d0958998edb5fee9c0a.png', 'http://yanxuan.nosdn.127.net/3708dbcb35ad5abf9e001500f73db615.png', 'L1', '3', '2018-02-01 00:00:00', '2019-03-19 13:08:33', '0');
INSERT INTO `litemall_category` VALUES ('1005002', '保护板', '', '好吃，高颜值美食', '0', 'http://yanxuan.nosdn.127.net/c9280327a3fd2374c000f6bf52dff6eb.png', 'http://yanxuan.nosdn.127.net/fb670ff3511182833e5b035275e4ac09.png', 'L1', '9', '2018-02-01 00:00:00', '2019-03-19 13:09:37', '0');
INSERT INTO `litemall_category` VALUES ('1005007', '锅具', '', '一口好锅，炖煮生活一日三餐', '1005001', 'http://yanxuan.nosdn.127.net/4aab4598017b5749e3b63309d25e9f6b.png', 'http://yanxuan.nosdn.127.net/d2db0d1d0622c621a8aa5a7c06b0fc6d.png', 'L2', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1005008', '餐具', '', '餐桌上的舞蹈', '1005001', 'http://yanxuan.nosdn.127.net/f109afbb7e7a00c243c1da29991a5aa3.png', 'http://yanxuan.nosdn.127.net/695ed861a63d8c0fc51a51f42a5a993b.png', 'L2', '4', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1005009', '清洁', '', '环保便利，聪明之选', '1005001', 'http://yanxuan.nosdn.127.net/e8b67fe8b8db2ecc2e126a0aa631def0.png', 'http://yanxuan.nosdn.127.net/3a40faaef0a52627357d98ceed7a3c45.png', 'L2', '9', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1005010', '炒货', '', '精选原产地，美味加营养', '1005002', 'http://yanxuan.nosdn.127.net/6c43063003207168c1d8e83a923e8515.png', 'http://yanxuan.nosdn.127.net/3972963a4b6f9588262d2a667f4c1c73.png', 'L2', '5', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1005011', '小食', '', '原香鲜材，以小食之味，带来味蕾惊喜', '1005002', 'http://yanxuan.nosdn.127.net/663f568475c994358bf31bcb67d122fe.png', 'http://yanxuan.nosdn.127.net/418f86049f957108a31ad55cec42c349.png', 'L2', '2', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1005012', '食材', '', '天时地利人和，寻找这个时节这个地点的味道', '1005002', 'http://yanxuan.nosdn.127.net/e050980992725b7932bb3645fe5aec08.png', 'http://yanxuan.nosdn.127.net/80db363e0687b1a65edc6e75c1b99726.png', 'L2', '10', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1005013', '冲饮', '', '以用料天然之美，尽享闲雅之意', '1005002', 'http://yanxuan.nosdn.127.net/2919b0d6eec79182cca31dc827f4d00a.png', 'http://yanxuan.nosdn.127.net/1e3d8f65c7c7811baccdfda6711cbfd5.png', 'L2', '6', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1007000', '杯壶', '', '精工生产制作，匠人手艺', '1005001', 'http://yanxuan.nosdn.127.net/0b244d3575b737c8f0ed7e84c5c4abd2.png', 'http://yanxuan.nosdn.127.net/ec53828a3814171079178a59fb2593da.png', 'L2', '2', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1008000', '贴标', '', '配角，亦是主角', '0', 'http://yanxuan.nosdn.127.net/11abb11c4cfdee59abfb6d16caca4c6a.png', 'http://yanxuan.nosdn.127.net/02f9a44d05c05c0dd439a5eb674570a2.png', 'L1', '4', '2018-02-01 00:00:00', '2019-03-19 13:10:43', '0');
INSERT INTO `litemall_category` VALUES ('1008001', '毛巾', '', '日本皇室专供，内野制造商出品', '1013001', 'http://yanxuan.nosdn.127.net/44ad9a739380aa6b7cf956fb2a06e7a7.png', 'http://yanxuan.nosdn.127.net/c53d2dd5ba6b1cfb55bd42ea0783f051.png', 'L2', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1008002', '布艺软装', '', '各种风格软装装点你的家', '1005000', 'http://yanxuan.nosdn.127.net/8bbcd7de60a678846664af998f57e71c.png', 'http://yanxuan.nosdn.127.net/2e2fb4f2856a021bbcd1b4c8400f2b06.png', 'L2', '6', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1008003', '鞋', '', '一双好鞋，才能带你到远方', '1008000', 'http://yanxuan.nosdn.127.net/4316c2d05745bc90d1f333e363e571bd.png', 'http://yanxuan.nosdn.127.net/85566d138ea55e6aaeda2cda02df66f8.png', 'L2', '4', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1008004', '袜子', '', '新百伦、阿迪达斯等制造商出品', '1010000', 'http://yanxuan.nosdn.127.net/f123c74f54d9acff0bd1546c60034814.png', 'http://yanxuan.nosdn.127.net/13f256bac02bb27d74e035ad25cbd375.png', 'L2', '4', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1008005', '户外', '', 'MUJI、Nike等制造商出品', '1012000', 'http://yanxuan.nosdn.127.net/83d22ca3d1c8f94ee23ca96de489864c.png', 'http://yanxuan.nosdn.127.net/833476fc3ecc30a7446279b787328775.png', 'L2', '7', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1008006', '口罩', '', '为你遮挡雾霾', '1012000', 'http://yanxuan.nosdn.127.net/9b93e661ff59cbda6094e8b30a63724e.png', 'http://yanxuan.nosdn.127.net/11d9700da759f2c962c2f6d9412ac2a1.png', 'L2', '6', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1008007', '围巾件套', '', '围上它，你的造型才完整', '1008000', 'http://yanxuan.nosdn.127.net/3a8c7ae5b9dc5c1c4b7f2b656abb0279.png', 'http://yanxuan.nosdn.127.net/6beb3fd67106e42dc0f026b173373d16.png', 'L2', '7', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1008008', '被枕', '', '守护你的睡眠时光', '1005000', 'http://yanxuan.nosdn.127.net/927bc33f7ae2895dd6c11cf91f5e3228.png', 'http://yanxuan.nosdn.127.net/b43ef7cececebe6292d2f7f590522e05.png', 'L2', '2', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1008009', '床品件套', '', 'MUJI等品牌制造商出品', '1005000', 'http://yanxuan.nosdn.127.net/243e5bf327a87217ad1f54592f0176ec.png', 'http://yanxuan.nosdn.127.net/81f671bd36bce05d5f57827e5c88dd1b.png', 'L2', '4', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1008010', '拖鞋', '', '穿上拖鞋，回到自我', '1008000', 'http://yanxuan.nosdn.127.net/1121696544ed9b0c2a70e82f1088fa0e.png', 'http://yanxuan.nosdn.127.net/984ddb9671aab41651784ba55b2cbdcf.png', 'L2', '6', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1008011', '清洁保鲜', '', '真空保鲜，美味不限时', '1005001', 'http://yanxuan.nosdn.127.net/dc4d6c35b9f4abb42d2eeaf345710589.png', 'http://yanxuan.nosdn.127.net/04cd632e1589adcc4345e40e8ad75d2b.png', 'L2', '6', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1008012', '功能厨具', '', '下厨省力小帮手', '1005001', 'http://yanxuan.nosdn.127.net/22db4ccbf52dc62c723ac83aa587812a.png', 'http://yanxuan.nosdn.127.net/5b94463017437467a93ae4af17c2ba4f.png', 'L2', '3', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1008013', '茶具咖啡具', '', '先进工艺制造，功夫体验', '1005001', 'http://yanxuan.nosdn.127.net/9ea192cd2719c8348f42ec17842ba763.png', 'http://yanxuan.nosdn.127.net/be3ba4056e274e311d1c23bd2931018d.png', 'L2', '5', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1008014', '糖巧', '', '糖心蜜意，甜而不腻', '1005002', 'http://yanxuan.nosdn.127.net/db48a1db4daab74233656caaea4a06f3.png', 'http://yanxuan.nosdn.127.net/c12cf29b574c7e9d1fcff6a57a12eea2.png', 'L2', '3', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1008015', '糕点', '', '四季糕点，用心烘焙', '1005002', 'http://yanxuan.nosdn.127.net/93168242df456b5f7bf3c89653b3db76.png', 'http://yanxuan.nosdn.127.net/66ea1d6ad602a8e441af7cada93bdc7a.png', 'L2', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1008016', '灯具', '', '一盏灯，温暖一个家', '1005000', 'http://yanxuan.nosdn.127.net/c48e0d9dcfac01499a437774a915842b.png', 'http://yanxuan.nosdn.127.net/f702dc399d14d4e1509d5ed6e57acd19.png', 'L2', '8', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1008017', '收纳', '', '选自古驰竹柄原料供应商', '1012000', 'http://yanxuan.nosdn.127.net/fdc048e1bf4f04d1c20b32eda5d1dc6e.png', 'http://yanxuan.nosdn.127.net/2a62f6c53f4ff089fa6a210c7a0c2e63.png', 'L2', '2', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1008018', '单肩包', '', '单肩装上惬意心情', '1008000', 'http://yanxuan.nosdn.127.net/2f71c7710f0bf857e787e1adb449c8a2.png', 'http://yanxuan.nosdn.127.net/55f34f23ed31f31e1313ff33602f90cc.png', 'L2', '3', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1009000', '日用清洁', '', '洁净才能带来清爽心情', '1013001', 'http://yanxuan.nosdn.127.net/e071686c212e93aa2fcafd0062a9c613.png', 'http://yanxuan.nosdn.127.net/729638bb13997f9c4c435b41ce6ed910.png', 'L2', '6', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1010000', '服装', '', '贴身的，要亲肤', '0', 'http://yanxuan.nosdn.127.net/28a685c96f91584e7e4876f1397767db.png', 'http://yanxuan.nosdn.127.net/622c8d79292154017b0cbda97588a0d7.png', 'L1', '5', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1010001', '内衣', '', '给你贴身的关怀', '1010000', 'http://yanxuan.nosdn.127.net/20279e1753e4eedc6e347857acda9681.png', 'http://yanxuan.nosdn.127.net/02fede55aba1bc6c9d7f7c01682f9e2d.png', 'L2', '2', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1010002', '内裤', '', '来自李维斯、爱慕等制造商', '1010000', 'http://yanxuan.nosdn.127.net/364269344ed69adafe1b70ab7998fc50.png', 'http://yanxuan.nosdn.127.net/0a7fe0a08c195ca2cf55d12cd3c30f09.png', 'L2', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1010003', '地垫', '', '家里的第“五”面墙', '1005000', 'http://yanxuan.nosdn.127.net/83d4c87f28c993af1aa8d3e4d30a2fa2.png', 'http://yanxuan.nosdn.127.net/1611ef6458e244d1909218becfe87c4d.png', 'L2', '5', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1010004', '双肩包', '', '背上的时髦', '1008000', 'http://yanxuan.nosdn.127.net/5197c44b610d786796f955334b55c7a5.png', 'http://yanxuan.nosdn.127.net/506d19510c967ba137283035a93738a1.png', 'L2', '2', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1011000', '婴童', '', '爱，从心开始', '0', 'http://yanxuan.nosdn.127.net/1ba9967b8de1ac50fad21774a4494f5d.png', 'http://yanxuan.nosdn.127.net/9cc0b3e0d5a4f4a22134c170f10b70f2.png', 'L1', '7', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1011001', '妈咪', '', '犬印、Harvest Hills制造商', '1011000', 'http://yanxuan.nosdn.127.net/720aebaa529df9391b95a078dfb2fd5c.png', 'http://yanxuan.nosdn.127.net/844e2f4dce94f71283840c141d4ca71b.png', 'L2', '2', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1011002', '海外', '', '来自海外制造商的好物', '1012000', 'http://yanxuan.nosdn.127.net/da884ff3b9e9d5276986c99e85722461.png', 'http://yanxuan.nosdn.127.net/fd1de05d274222f1e56d057d2f2c20c6.png', 'L2', '5', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1011003', '床垫', '', '承托你的好时光', '1005000', 'http://yanxuan.nosdn.127.net/316afeb3948b295dfe073e4c51f77a42.png', 'http://yanxuan.nosdn.127.net/d6e0e84961032fc70fd52a8d4d0fb514.png', 'L2', '3', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1011004', '家饰', '', '装饰你的家', '1005000', 'http://yanxuan.nosdn.127.net/ab0df9445d985bf6719ac415313a8e88.png', 'http://yanxuan.nosdn.127.net/79275db76b5865e6167b0fbd141f2d7e.png', 'L2', '9', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1012000', '杂货', '', '解忧，每个烦恼', '0', 'http://yanxuan.nosdn.127.net/c2a3d6349e72c35931fe3b5bcd0966be.png', 'http://yanxuan.nosdn.127.net/547853361d29a37282f377b9a755dd37.png', 'L1', '8', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1012001', '功能箱包', '', '范思哲、Coach等品牌制造商出品', '1008000', 'http://yanxuan.nosdn.127.net/3050a2b3052d766c4b460d4b766353a3.png', 'http://yanxuan.nosdn.127.net/0645dcda6172118f9295630c2a6f234f.png', 'L2', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1012002', '雨具', '', 'WPC制作商出品', '1012000', 'http://yanxuan.nosdn.127.net/4e929a21baebdb1200361d8097e35e45.png', 'http://yanxuan.nosdn.127.net/589da0f02917b8393197a43175764381.png', 'L2', '4', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1012003', '文具', '', '找回书写的力量', '1012000', 'http://yanxuan.nosdn.127.net/e1743239e41ca9af76875aedc73be7f0.png', 'http://yanxuan.nosdn.127.net/e074795f61a83292d0f20eb7d124e2ac.png', 'L2', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1013000', '靴', '', '经典的温暖', '1008000', 'http://yanxuan.nosdn.127.net/868c2a976719cd508e9ddf807167a446.png', 'http://yanxuan.nosdn.127.net/59485f1aa100e4210e16175f3412fa41.png', 'L2', '5', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1013001', '洗护', '', '亲肤之物，严选天然', '0', 'http://yanxuan.nosdn.127.net/9fe068776b6b1fca13053d68e9c0a83f.png', 'http://yanxuan.nosdn.127.net/1526ab0f5982722adbc8726f9f2a338c.png', 'L1', '6', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1013002', '美妆', '', '为你的面容添色', '1013001', 'http://yanxuan.nosdn.127.net/aa49c088f74a1c318f1765cc2703495a.png', 'http://yanxuan.nosdn.127.net/d6a7b9a2eb6af92d709429798a4ca3ea.png', 'L2', '3', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1013003', '护发', '', '呵护秀发，柔顺不同发质', '1013001', 'http://yanxuan.nosdn.127.net/672ddbed88d9762d2be789080880b16a.png', 'http://yanxuan.nosdn.127.net/398375d0e39574c6e87273d328316186.png', 'L2', '5', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1013004', '香薰', '', '爱马仕集团制造商出品', '1013001', 'http://yanxuan.nosdn.127.net/d43e7af0a6a9385d88be2ca1df679158.png', 'http://yanxuan.nosdn.127.net/fc7764ff8e12d18f6c5881a32318ed16.png', 'L2', '2', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1013005', '刀剪砧板', '', '传统工艺 源自中国刀城', '1005001', 'http://yanxuan.nosdn.127.net/9d481ea4c2e9e6eda35aa720d407332e.png', 'http://yanxuan.nosdn.127.net/555afbfe05dab48c1a3b90dcaf89b4f2.png', 'L2', '7', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1013006', '家居服', '', '舒适亲肤', '1010000', 'http://yanxuan.nosdn.127.net/71f391af17fce739a6a57a1eeadbcbf0.png', 'http://yanxuan.nosdn.127.net/5da102ea4c64081ce3a05a91c855fbc9.png', 'L2', '6', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1015000', '家具', '', '大师级工艺', '1005000', 'http://yanxuan.nosdn.127.net/4f00675caefd0d4177892ad18bfc2df6.png', 'http://yanxuan.nosdn.127.net/d5d41841136182bf49c1f99f5c452dd6.png', 'L2', '7', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1015001', 'T恤', '', '自在而潇洒的穿着感', '1010000', 'http://yanxuan.nosdn.127.net/24a7a33cfeac0bb87a737480db79e053.png', 'http://yanxuan.nosdn.127.net/505c9a5a794b79e85fef4654722b3447.png', 'L2', '3', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1017000', '宠物', '', '抑菌除味，打造宠物舒适空间', '1005000', 'http://yanxuan.nosdn.127.net/a0352c57c60ce4f68370ecdab6a30857.png', 'http://yanxuan.nosdn.127.net/dae4d6e89ab8a0cd3e8da026e4660137.png', 'L2', '10', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1018000', '夏日甜心', '', '湖南卫视《夏日甜心》周边', '1019000', 'http://yanxuan.nosdn.127.net/b5e9f174404ef81b8603d6ecc304c62e.png', 'http://yanxuan.nosdn.127.net/2b8497fe583d3c9759128b2d76f89dfd.png', 'L2', '10', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1019000', '志趣', '', '周边精品，共享热爱', '0', 'http://yanxuan.nosdn.127.net/7093cfecb9dde1dd3eaf459623df4071.png', 'http://yanxuan.nosdn.127.net/1706e24a5e605870ba3b37ff5f49aa18.png', 'L1', '10', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1020000', '出行用品', '', '出行小物，贴心相伴', '1012000', 'http://yanxuan.nosdn.127.net/b29a11afa76b9f4a57131555f1a54c77.png', 'http://yanxuan.nosdn.127.net/81e18c6970a7809ee0d86f0545428aa4.png', 'L2', '3', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1020001', '面部护理', '', '温和无刺激的呵护', '1013001', 'http://yanxuan.nosdn.127.net/f73df75f334126cf1f3823696ea0663c.png', 'http://yanxuan.nosdn.127.net/babf6573f8acd53f21205a7577ec03e1.png', 'L2', '4', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1020002', '用具', '', '小工具成就美好浴室', '1013001', 'http://yanxuan.nosdn.127.net/1a851b2b3c9e16bdfd020a5fc03e9140.png', 'http://yanxuan.nosdn.127.net/4e3aebbd7ffef5bb250d19f13cb85620.png', 'L2', '7', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1020003', '服饰', '', '萌宝穿搭，柔软舒适触感', '1011000', 'http://yanxuan.nosdn.127.net/4e50f3c4e4d0a64cd0ad14cfc0b6bd17.png', 'http://yanxuan.nosdn.127.net/004f5f96df4aeb0645abbd70c0637239.png', 'L2', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1020004', '婴童洗护', '', '天然，呵护宝宝肌肤', '1011000', 'http://yanxuan.nosdn.127.net/c55338691ebd46bee9ebf225f80363ce.png', 'http://yanxuan.nosdn.127.net/f2e301b189befff1d99adf917ba8ce20.png', 'L2', '5', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1020005', '寝居', '', '无荧光剂，婴幼儿A类标准', '1011000', 'http://yanxuan.nosdn.127.net/0f3c5ad63139096fd0760219e12149af.png', 'http://yanxuan.nosdn.127.net/476995896abea91d3f2e9ec20d56bd8d.png', 'L2', '3', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1020006', '玩具', '', '萌宝童趣必备', '1011000', 'http://yanxuan.nosdn.127.net/7aac7c5819f71345a52a4b9df23d6239.png', 'http://yanxuan.nosdn.127.net/34b3267efcddad09cd652f181d87aab0.png', 'L2', '4', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1020007', '喂养', '', '宝宝吃得香，妈妈才放心', '1011000', 'http://yanxuan.nosdn.127.net/5db40a5bf84c177515610471d4d08687.png', 'http://yanxuan.nosdn.127.net/6b6f1672fe041594245fe56a5dd80871.png', 'L2', '6', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1020008', '配饰', '', '与众不同的点睛之笔', '1008000', 'http://yanxuan.nosdn.127.net/d835a76e56a88905194f543b67089b4b.png', 'http://yanxuan.nosdn.127.net/57ce29ca06f592d65aabfa5f0f87ad43.png', 'L2', '8', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1020009', '外衣', '', '穿出时尚感', '1010000', 'http://yanxuan.nosdn.127.net/883d89e54a9287569a201eca388a7cda.png', 'http://yanxuan.nosdn.127.net/647f7c39eb7c353958274a59fd821d03.png', 'L2', '10', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1020010', '衬衫', '', '细节讲究，合身剪裁', '1010000', 'http://yanxuan.nosdn.127.net/94aa4a4814e2a7a97639438f1d52dcee.png', 'http://yanxuan.nosdn.127.net/7927f8422c341f7353041a30d01045a2.png', 'L2', '7', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1021000', '节日礼盒', '', '限量礼盒限时发售', '1012000', 'http://yanxuan.nosdn.127.net/e7b37b1ed5c18d63dc3e6c3f1aa85d8a.png', 'http://yanxuan.nosdn.127.net/bbb6f0ab4f6321121250c12583b0ff9a.png', 'L2', '8', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1022000', '数码', '', '智能硬件，匠心出品', '1008000', 'http://yanxuan.nosdn.127.net/3ec003761d346bc866de2ec249d7ff19.png', 'http://yanxuan.nosdn.127.net/c33b13875a86da535c935e3d454a6fd2.png', 'L2', '9', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1023000', '厨房小电', '', '厨房里的省心小电器', '1005001', 'http://yanxuan.nosdn.127.net/521bd0c02d283b80ba49e73ca84df250.png', 'http://yanxuan.nosdn.127.net/c09d784ba592e4fadabbaef6b2e95a95.png', 'L2', '8', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1025000', '礼品卡', '', '送礼、福利首选', '1019000', 'http://yanxuan.nosdn.127.net/bb9232716b2fc96d9bdbac4955360dfa.png', 'http://yanxuan.nosdn.127.net/1266f0767a3f67298a40574df0d177fb.png', 'L2', '11', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1027000', '茗茶', '', '一品茶香，品茗即是观心，饮茶涤净尘虑', '1005002', 'http://yanxuan.nosdn.127.net/0c5af0575176c4a3023783bef7a87a0f.png', 'http://yanxuan.nosdn.127.net/cfeb623929f3936cc882ffc6a9a2e927.png', 'L2', '7', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1027001', '果干', '', '品尝与收获到的是自然的味道', '1005002', 'http://yanxuan.nosdn.127.net/60f4ae2beef4754347fa36208f84efab.png', 'http://yanxuan.nosdn.127.net/4cdbf6ae196671cca154fe16e152d8d4.png', 'L2', '4', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1028001', '唱片', '', '经典音乐，用心典藏，瑞鸣音乐大师匠心打造', '1019000', 'http://yanxuan.nosdn.127.net/71feb3efd3eaee01a74e8aa78430de9d.png', 'http://yanxuan.nosdn.127.net/3b69079ea27f90b4f539e8c3b76680f5.png', 'L2', '8', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1032000', '魔兽世界', '', '艾泽拉斯的冒险，才刚刚开始', '1019000', 'http://yanxuan.nosdn.127.net/336f0186a9920eb0f93a3912f3662ffe.png', 'http://yanxuan.nosdn.127.net/becfba90e8a5c95d403b8a6b9bb77825.png', 'L2', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1032001', '炉石传说', '', '快进来坐下吧，看看酒馆的新玩意', '1019000', 'http://yanxuan.nosdn.127.net/97937fcf2defb864d9e53d98a337d78a.png', 'http://yanxuan.nosdn.127.net/b5af3f6bfcbeb459d6c448ba87f8cc35.png', 'L2', '2', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1032002', '守望先锋', '', '物美价廉的补给箱', '1019000', 'http://yanxuan.nosdn.127.net/8cab7bf1225dc9893bd9de06fc51921d.png', 'http://yanxuan.nosdn.127.net/a562f05bf38f5ee478fefb81856aad3d.png', 'L2', '3', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1032003', '暗黑破坏神III', '', '奈非天们，停下脚步整理下行囊', '1019000', 'http://yanxuan.nosdn.127.net/8fe4eb999f748236228a73e09878e277.png', 'http://yanxuan.nosdn.127.net/1e19e948de63a1d0895a8620250c441f.png', 'L2', '4', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1032004', '星际争霸II', '', '记录科普卢星区的战斗时光', '1019000', 'http://yanxuan.nosdn.127.net/433ff879a3686625535ca0304be22ab2.png', 'http://yanxuan.nosdn.127.net/7394ce778791ae8242013d6c974f47e0.png', 'L2', '5', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1032005', '风暴英雄', '', '时空枢纽，是个充满惊喜的地方', '1019000', 'http://yanxuan.nosdn.127.net/e091aae0c8cafc5ab48dfabcc52c79b6.png', 'http://yanxuan.nosdn.127.net/ff1e28fb7151008f8dc46bbf8b357f63.png', 'L2', '6', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1033000', '梦幻西游', '', '梦幻西游精品周边', '1019000', 'http://yanxuan.nosdn.127.net/f0698297aaac41b778c1ea65eefb8b34.png', 'http://yanxuan.nosdn.127.net/36711325781ca50fdfe234489fca973e.png', 'L2', '7', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1034000', '丝袜', '', '厚木制造商，专利冰丝', '1010000', 'http://yanxuan.nosdn.127.net/d82d0bacfd7243c2ad09dbf2513cfcf9.png', 'http://yanxuan.nosdn.127.net/4f8f86dfd1d4b46a9cf783b4980db47f.png', 'L2', '5', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1034001', '童车童椅', '', '安全舒适，给宝宝一个快乐童年', '1011000', 'http://yanxuan.nosdn.127.net/06bbfb293b6194b27ebdb3350203a1f7.png', 'http://yanxuan.nosdn.127.net/4d16871eb80dac59d1796c7d806a5cea.png', 'L2', '7', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1035000', '卫衣', '', '舒适百搭，时尚选择', '1010000', 'http://yanxuan.nosdn.127.net/97bb55280b8ffa40390f2ee36486314a.png', 'http://yanxuan.nosdn.127.net/0282a81bbcae6c39918808fe7c4e1b93.png', 'L2', '9', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1035001', '毛衣', '', '温暖柔软，品质之选', '1010000', 'http://yanxuan.nosdn.127.net/cc886f16c8b9893305f1b3b6ad4eb0b1.png', 'http://yanxuan.nosdn.127.net/b610b058cfd73a9211dc890b7b0cbc66.png', 'L2', '8', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1035002', '裤装', '', '高质感面料，休闲商务两相宜', '1010000', 'http://yanxuan.nosdn.127.net/a3906045b1367d70f658ce9de03e8193.png', 'http://yanxuan.nosdn.127.net/1728b4eeaa7a3928f5416884f0e75b1c.png', 'L2', '11', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1035003', '肉制品', '', '真嗜肉者，都爱这一味，佳肴美馔真滋味', '1005002', 'http://yanxuan.nosdn.127.net/db3e11b8a6974a253818ae0d6fb2d24e.png', 'http://yanxuan.nosdn.127.net/94480324b376a51af47cf92df70d1ade.png', 'L2', '8', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1036000', '夏凉', '', '夏凉床品，舒适一夏', '1005000', 'http://yanxuan.nosdn.127.net/13ff4decdf38fe1a5bde34f0e0cc635a.png', 'http://yanxuan.nosdn.127.net/bd17c985bacb9b9ab1ab6e9d66ee343c.png', 'L2', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1036001', '眼镜', '', '实用加时尚，造型百搭单品', '1012000', 'http://yanxuan.nosdn.127.net/97f5f75ea1209dfbb85e91932d26c3ed.png', 'http://yanxuan.nosdn.127.net/c25fb420ccb6f692a2d16f1740b60d21.png', 'L2', '9', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1036002', '汽车用品', '', '给你的爱车添装备', '1012000', 'http://yanxuan.nosdn.127.net/382cda1ef9cca77d99bcef05070d7db0.png', 'http://yanxuan.nosdn.127.net/552e943e585a999169fdbc57b59524d6.png', 'L2', '10', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1036003', '调味', '', '烹饪必备，美食调味', '1005002', 'http://yanxuan.nosdn.127.net/2ae44a3944f2bc737416e1cff3d4bcef.png', 'http://yanxuan.nosdn.127.net/13d58949a8c72ec914b5ef63ac726a43.png', 'L2', '9', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1036004', '大话西游', '', '大话西游正版周边', '1019000', 'http://yanxuan.nosdn.127.net/b60618db213322bdc2c5b1208655bd7e.png', 'http://yanxuan.nosdn.127.net/470a017f508e9a18f3068be7b315e14b.png', 'L2', '9', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_category` VALUES ('1036005', '锂电池', '锂电池', '锂电池', '1005000', '', '', 'L2', '50', '2019-03-21 21:57:16', '2019-03-21 21:57:16', '0');

-- ----------------------------
-- Table structure for litemall_collect
-- ----------------------------
DROP TABLE IF EXISTS `litemall_collect`;
CREATE TABLE `litemall_collect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户表的用户ID',
  `value_id` int(11) NOT NULL DEFAULT '0' COMMENT '如果type=0，则是商品ID；如果type=1，则是专题ID',
  `type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '收藏类型，如果type=0，则是商品ID；如果type=1，则是专题ID',
  `add_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `goods_id` (`value_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='收藏表';

-- ----------------------------
-- Records of litemall_collect
-- ----------------------------

-- ----------------------------
-- Table structure for litemall_comment
-- ----------------------------
DROP TABLE IF EXISTS `litemall_comment`;
CREATE TABLE `litemall_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value_id` int(11) NOT NULL DEFAULT '0' COMMENT '如果type=0，则是商品评论；如果是type=1，则是专题评论。',
  `type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '评论类型，如果type=0，则是商品评论；如果是type=1，则是专题评论；如果type=3，则是订单商品评论。',
  `content` varchar(1023) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '评论内容',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户表的用户ID',
  `has_picture` tinyint(1) DEFAULT '0' COMMENT '是否含有图片',
  `pic_urls` varchar(1023) DEFAULT NULL COMMENT '图片地址列表，采用JSON数组格式',
  `star` smallint(6) DEFAULT '1' COMMENT '评分， 1-5',
  `add_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`),
  KEY `id_value` (`value_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1012 DEFAULT CHARSET=utf8 COMMENT='评论表';

-- ----------------------------
-- Records of litemall_comment
-- ----------------------------
INSERT INTO `litemall_comment` VALUES ('1', '1181000', '0', '布料很厚实，触感不错，洗过之后不缩水不掉色', '1', '1', '[\"https://yanxuan.nosdn.127.net/218783173f303ec6d8766810951d0790.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('2', '1181000', '0', '料子很舒服，凉凉的，配合蚕丝被，夏天很凉快~', '1', '1', '[\"https://yanxuan.nosdn.127.net/33978a0d6f56d94c45e4fc594b4b8606.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('3', '1181000', '0', '一直喜欢粗布的床上用品。冬暖夏凉。这套看起来非常漂亮。实际感觉有点粗布的感觉。很好！', '1', '1', '[\"https://yanxuan.nosdn.127.net/d3975d1b6d88e9f9d762cd9a879d1a14.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('4', '1006002', '0', '3899床，2399白鹅绒被，899四件套。网易严选我要疯了！', '1', '1', '[\"https://yanxuan.nosdn.127.net/7215309e93c48cca08ca6910194eb3b0.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('5', '1006002', '0', '漂亮', '1', '1', '[\"http://yanxuan.nosdn.127.net/d85a556893919038b56a95b71c9a1228.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('6', '1006002', '0', '四件套已经收到 还没使用 不过手感很好 也没异味 相信严选的眼光  应该不会让我失望的', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('7', '1006002', '0', '这个很沉，但是同一套既有白色又有深蓝色，我用了吸色布，才避免染色，根本不敢一起洗，，，，', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('8', '1006002', '0', '特别喜欢的床品。漂亮', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('9', '1006002', '0', '还没有使用，看起来还不错', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('10', '1006002', '0', '不错质量很好', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('11', '1006002', '0', '很好看，质量也很好', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('12', '1006002', '0', '超美，特别喜欢', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('13', '1006002', '0', '惊艳！', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('14', '1006002', '0', '还没打开，绣花不错。', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('15', '1006002', '0', '不错', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('16', '1006002', '0', '材质好，无味，赞', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('17', '1006002', '0', '现在都还在盖着', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('18', '1006002', '0', '太厚了，质量很好，只适合冬天', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('19', '1006002', '0', '对这套床品垂涎已久，但对于价格又有点犯嘀咕，这次降价，使我下决心下了单。拿在手里沉甸甸的，祈愿别辜负聊我对严选的期望', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('20', '1006002', '0', '第二次买了', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('21', '1006002', '0', '质量很好，就是太白了，怪怪的', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('22', '1006002', '0', '。。。。。。。', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('23', '1006002', '0', '严选鼓励评价每一件商品，我喜欢严选的东西，一如既往的支持！', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('24', '1006002', '0', '素雅，只是硬些', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('25', '1006002', '0', '美，面料舒服。', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('26', '1006002', '0', '刺绣很漂亮，非常非常值。', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('27', '1006002', '0', '超级好用', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('28', '1006002', '0', '有点素，刺绣不错', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('29', '1006002', '0', '高端大气上档次。低调奢华有内涵。  很厚 很重', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('30', '1006002', '0', '非常好，质量，', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('31', '1006007', '0', '很棒～很有质感，产品想是市面上千元以上的产品规格；被子侧面还有心的设计了一段小拉链扣可以真实的触摸到被子里面的填充物-是羊毛（羊�', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('32', '1006007', '0', '表面摸起来很舒服，线都处理得很好，里面有些地方填充物不太均匀', '1', '1', '[\"http://yanxuan.nosdn.127.net/1637021a44433992f403a4b925401a3b.jpg\", \"http://yanxuan.nosdn.127.net/5fd615a8f21050ac8f20a542f8e688a1.jpg\", \"http://yanxuan.nosdn.127.net/968836b81e80750944ca350808763281.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('33', '1006007', '0', '做工真的不错，我婆婆说有点硬，可能对比蚕丝被，还是有点不一样。个人觉得还是值得买的', '1', '1', '[\"http://yanxuan.nosdn.127.net/1943a9a6a203fa2ff56bc0800ed5cbfd.png\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('34', '1006007', '0', '被子很轻很薄，不是很暖，南方现在春天18度左右的气温，盖着比较合适，冬天再冷点肯定就不行了。', '1', '1', '[\"https://yanxuan.nosdn.127.net/b8b063c9b0199ed290f4b3ca49bf4b6c.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('35', '1006007', '0', '配上针织帽，妥妥的。不厚不薄无异味，也很亲肤，满意。', '1', '1', '[\"https://yanxuan.nosdn.127.net/f0ec4c28b64d4b676ba629c1fb006429.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('36', '1006007', '0', '超大一个包裹，棉被摸起来不错，等待盖', '1', '1', '[\"https://yanxuan.nosdn.127.net/4eff94aed684b2d8255e73686f570be8.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('37', '1006007', '0', '很舒服的秋冬羊毛被，不厚不薄，买了一点都不后悔！', '1', '1', '[\"https://yanxuan.nosdn.127.net/2ef5ee9903685928d7d1e1bf2fd5c1de.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('38', '1006007', '0', '看着好，摸着好，重量感觉也正好，还没盖，已经套上被套，4年前的小被子终于可以退役了。PS 那一坨是只喵～', '1', '1', '[\"https://yanxuan.nosdn.127.net/01c3db0f9bfb16e969c4e968fe8a68f4.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('39', '1006007', '0', '盖上了 还成', '1', '1', '[\"https://yanxuan.nosdn.127.net/5bf789025ccc72802ce58561e494c3aa.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('40', '1006007', '0', '好大一箱啊 被子尺寸还挺准 准备晒下 可以用一用 一直冬天盖4+6的合被 这个5斤的样子 不知道冬天单盖是不是好冷 还没有盖过羊毛被 会5斤羊毛�', '1', '1', '[\"https://yanxuan.nosdn.127.net/20dfd145606fc60d914b2b7833e92c01.jpg\", \"https://yanxuan.nosdn.127.net/1dcc038f9e39998a43f2d3fd9315469e.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('41', '1006007', '0', '被子没有味道 包边很好 凉了两天 昨晚15度 睡着发热 很轻很舒适 配上水洗棉四件套和丝绒枕头 完美！！', '1', '1', '[\"https://yanxuan.nosdn.127.net/a70b34d03da3d280d0fd79181d56589c.jpg\", \"https://yanxuan.nosdn.127.net/4f07e2b6d807ff345a473d5da3c26968.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('42', '1006007', '0', '没有缺点。', '1', '1', '[\"https://yanxuan.nosdn.127.net/c82b3ab3d224aa76740b9e3255adf3fb.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('43', '1006007', '0', '整体满意', '1', '1', '[\"https://yanxuan.nosdn.127.net/c35d48dcada22ec1c44294f6b0a428e1.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('44', '1006007', '0', '白天晒过，今晚已盖上，这久盖刚好合适', '1', '1', '[\"https://yanxuan.nosdn.127.net/1f8547923b6ffcba581239611f693ac2.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('45', '1006007', '0', '下单后第二天早上顺丰到货，先赞快递！再说被子，一口气买了3床被子，和老公商量着不好就退掉，开箱后拿起来都很沉的很有分量，包边走线�', '1', '1', '[\"https://yanxuan.nosdn.127.net/90b284e3610a519a46aaa2f68eda2c48.jpg\", \"https://yanxuan.nosdn.127.net/cc6273be455c3316dce5cf704401df43.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('46', '1006007', '0', '包装很好，被子很好，广东的冬天够了', '1', '1', '[\"https://yanxuan.nosdn.127.net/7609fb3c38f9bd7dd9af11f5818f0be5.jpg\", \"https://yanxuan.nosdn.127.net/c4061c4d985e27d323bb0129b86ec55a.jpg\", \"https://yanxuan.nosdn.127.net/2161ee60cc43edcff1e31a2bdf86a903.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('47', '1006007', '0', '今天才换上，好暖和。质量比我想象中的好。好评。希望晚上睡觉时不要太热啊！', '1', '1', '[\"https://yanxuan.nosdn.127.net/91ec809b19884e57c0d109b4412ee030.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('48', '1006007', '0', '租来的房 这样就够了', '1', '1', '[\"https://yanxuan.nosdn.127.net/a2a7cc43bfab52175f6b8c12703f87d9.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('49', '1006007', '0', '相当不错的被子，南方春秋盖正好，冬天需要加一床毛毯不然太冷。', '1', '1', '[\"https://yanxuan.nosdn.127.net/7d7199ef7682089c9c7b45d3d2c4fed9.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('50', '1006007', '0', '柔软，厚实，没有异味，不跑毛，从留的小口能清楚看到里面羊毛品质很不错，盖着很暖和。环扣有八个，套被套也很方便，不用担心被套错位�', '1', '1', '[\"https://yanxuan.nosdn.127.net/0e10cb5879b7559415a9f8271b0d8fb0.jpg\", \"https://yanxuan.nosdn.127.net/31dd362b4c47ba25994cec82020a466a.jpg\", \"https://yanxuan.nosdn.127.net/33c360c34b5fd14fbd51ab7f96a23f93.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('51', '1006007', '0', '包裝很好！打開後摸著質量也非常不錯！滿意的一次購物體驗.', '1', '1', '[\"http://yanxuan.nosdn.127.net/76735794dcee4fc7763c9e5387e0c2ce.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('52', '1006007', '0', '看上去不错，媳妇要过来了，买了四件套和被芯，都要换新的给她一个惊喜！', '1', '1', '[\"https://yanxuan.nosdn.127.net/5043098d243e80629ab3d45efbc46f2a.jpg\", \"https://yanxuan.nosdn.127.net/a599a3df10cb2ae5f8d4aa293f6f7ef5.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('53', '1006007', '0', '网易买了220×240被套，结果回家发现大了又来买了被芯，发现网易严选质量真不错，多推出精品', '1', '1', '[\"https://yanxuan.nosdn.127.net/940ba0e376afe987fffbf0174151980b.jpg\", \"https://yanxuan.nosdn.127.net/91730445ae6b47e989fb112cd13df259.jpg\", \"https://yanxuan.nosdn.127.net/bbd62a0f2f60443812c1dc51ee61e55f.jpg\", \"https://yanxuan.nosdn.127.net/55dc0ff04281a0a3ccc3bf58b86d080d.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('54', '1006007', '0', '不错不错不错的，喜欢上严选', '1', '1', '[\"https://yanxuan.nosdn.127.net/1d3b96140cd0cd9da2781aed350f65ca.jpg\", \"https://yanxuan.nosdn.127.net/c98e86e420c3c50f377054ad465663b6.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('55', '1006007', '0', '巨大无比的箱子，做工，质感都超赞，已经装好被套，盖在身上，具体效果如何，回头追评', '1', '1', '[\"https://yanxuan.nosdn.127.net/4b36085027dfa17f41ae18a8a59866bf.jpg\", \"https://yanxuan.nosdn.127.net/e7f5b357910d79b6da7ab159500ed112.jpg\", \"https://yanxuan.nosdn.127.net/bf3a081b3859ff62c21249c2b5443857.jpg\", \"https://yanxuan.nosdn.127.net/442180cdbc773cd453447acbe18076a4.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('56', '1006007', '0', '成都二月底，空调开25度，妈妈说被子很暖和', '1', '1', '[\"https://yanxuan.nosdn.127.net/5995203d941cd9ec29d72f88e2068470.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('57', '1006007', '0', '包装很结实，里一层外一层。东西也很好哟', '1', '1', '[\"https://yanxuan.nosdn.127.net/e952e01ca4cc9a6e98ac1b94c22897c1.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('58', '1006007', '0', '喜欢', '1', '1', '[\"https://yanxuan.nosdn.127.net/ef9baeb4716e707430504c85a31bf23d.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('59', '1006007', '0', '面料摸起来很舒服，没有羊毛味，但是有点新布料的味道。被子没有羽绒被轻，但也不算厚重。好评！', '1', '1', '[\"http://yanxuan.nosdn.127.net/3be9a5226968a712d0f070ad68f64dec.jpg\", \"http://yanxuan.nosdn.127.net/8fdc01147eb50e9087aa00a2f62fac2d.jpg\", \"http://yanxuan.nosdn.127.net/4235a53cf606ae4bc0fea7a30af393bd.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('60', '1006007', '0', '非常好，很暖和', '1', '1', '[\"https://yanxuan.nosdn.127.net/3369a66fb9df9b7d5b6ae2978d36610f.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('61', '1006010', '0', '被子收到先晾晒两天。没有异味，做工精细，手感不错，拿了一撮烧是纯羊毛的。相信严选的品质。', '1', '1', '[\"https://yanxuan.nosdn.127.net/709c587f5f7d92f48332d06eb18e7126.jpg\", \"https://yanxuan.nosdn.127.net/6e1774068ce6b020c50c3c5d4a8e7dfc.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('62', '1006010', '0', '质量很好，还没用，看着就非常喜欢！', '1', '1', '[\"https://yanxuan.nosdn.127.net/5e10bd6ac6cb217268b4483a10bea56f.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('63', '1006010', '0', '不错', '1', '1', '[\"https://yanxuan.nosdn.127.net/a3078f1431a1aca14caa560a6ff908a5.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('64', '1006010', '0', '尺寸蛮好！质感好！非常棒！', '1', '1', '[\"https://yanxuan.nosdn.127.net/62c0b62ad5eb0c20337eabbf367e4278.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('65', '1006010', '0', '我确实没有发现有什么异味，羊毛被非常舒服，纯新羊毛品质非常好，这个价格商场里面是买不到的，提花做工也非常精细。配上去年买的床单�', '1', '1', '[\"https://yanxuan.nosdn.127.net/681b2327038b1c2c10af89b2527d7eda.jpg\", \"https://yanxuan.nosdn.127.net/71ccaffde9e79a89ad185ff9bdab40d7.jpg\", \"https://yanxuan.nosdn.127.net/e7742118d188ea3173ad5112a8a6f061.jpg\", \"https://yanxuan.nosdn.127.net/3d77a201cbff3fae0c2d35c8dbe7ce30.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('66', '1006010', '0', '收到了，还没用', '1', '1', '[\"https://yanxuan.nosdn.127.net/e44577b3101696c64196ca2ac6aed4d0.jpg\", \"https://yanxuan.nosdn.127.net/19dc77eb45ad562080ae3f1b26220ecb.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('67', '1006010', '0', '包装盒子很大。\n和四件套一起买的，先晒晒再套上。', '1', '1', '[\"https://yanxuan.nosdn.127.net/c7ddd8ce4d2588f88bee2bdc325b16e8.jpg\", \"https://yanxuan.nosdn.127.net/63917d8d98648a1f6780113b81eaf49d.jpg\", \"https://yanxuan.nosdn.127.net/3cb128218eb997e9f3b9e2b3f977bb42.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('68', '1006010', '0', '发货很快，服务很好！', '1', '1', '[\"https://yanxuan.nosdn.127.net/d9c4a183033024979794f5d125718c36.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('69', '1006010', '0', '超喜欢，晒一晒，就准备换上用了！', '1', '1', '[\"https://yanxuan.nosdn.127.net/a9f9168ce83e7d73345aec85d3a58a48.jpg\", \"https://yanxuan.nosdn.127.net/683e47e56d8a123ef101d64afb22b293.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('70', '1006010', '0', '很棒啊 超级好 忠实粉丝', '1', '1', '[\"https://yanxuan.nosdn.127.net/2edff0244918811c38ce88eccd67d979.jpg\", \"https://yanxuan.nosdn.127.net/ee205358200c2834f6fe1457e6b8cc0c.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('71', '1006010', '0', '吓死个人，包装太大了。为快递行业废物担忧！被子还没用的，厚薄可以', '1', '1', '[\"https://yanxuan.nosdn.127.net/874a5450cc4a013fafbb699d1be8f7e6.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('72', '1006010', '0', '非常好的商品，挺厚实，套在严选被罩里正好。很舒适的感觉，今晚试试再跟评。', '1', '1', '[\"http://yanxuan.nosdn.127.net/6086f9c60725981a62bcb7cb9b16f96d.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('73', '1006010', '0', '细羊毛比羊毛又更柔软舒服，包装依旧强大，第二床了，等着再团第三床给小孩。', '1', '1', '[\"http://yanxuan.nosdn.127.net/a80a47d1da70aecda367c8346f6c4b28.jpg\", \"http://yanxuan.nosdn.127.net/c03e0d833114a274c14e78078e209f23.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('74', '1006010', '0', '很好，喜欢', '1', '1', '[\"https://yanxuan.nosdn.127.net/d604e96c8fd278287b0b5938a6329d91.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('75', '1006010', '0', '不错，挺好的，打算晒一天，再用', '1', '1', '[\"https://yanxuan.nosdn.127.net/d1a19fc34300d9777fa461e429953f47.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('76', '1006010', '0', '质量手感很好，值得购买。嘿嘿。感谢我中的优惠券买满599少105！划算', '1', '1', '[\"http://yanxuan.nosdn.127.net/f66f5867db18972a129da330db4c1a62.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('77', '1006010', '0', '东西还不错，家里20度盖着稍微有点热。', '1', '1', '[\"https://yanxuan.nosdn.127.net/a74a0afeb7565c6e4faaa6eb9cf4749f.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('78', '1006010', '0', '没有味道呀，摸起来手感不错的……严选脑残粉，不多说了，赞', '1', '1', '[\"http://yanxuan.nosdn.127.net/d0ba5d4d2e3749630dea1e22f5cea279.jpg\", \"http://yanxuan.nosdn.127.net/47cfc56cbe26aab5c357b8f202d0e1ff.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('79', '1006010', '0', '手感太棒了，收到晒了一天就用上了，超暖和！赞', '1', '1', '[\"https://yanxuan.nosdn.127.net/a6efb53eb88e7a64d2684e40f7a52d3f.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('80', '1006010', '0', '简约，干净！四件套，被子，床垫全都换成严选的', '1', '1', '[\"https://yanxuan.nosdn.127.net/011740faaf3a95b9199098814e36e385.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('81', '1006010', '0', '被子柔软手感很好', '1', '1', '[\"http://yanxuan.nosdn.127.net/998e430d04f8bb8b1d884bac1a02e313.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('82', '1006010', '0', '炒鸡大的包装盒，这几天天气不给力，还没有晒，后续追评。', '1', '1', '[\"http://yanxuan.nosdn.127.net/9e81c34c4ff7c22bc349c6d268307dd2.jpg\", \"http://yanxuan.nosdn.127.net/44e4a90615bece2401be24a2bf93ee69.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('83', '1006010', '0', '收到被包装箱吓了一跳，箱中箱好安全，被子羊毛分为一格格缝好，不走位，好柔软，妈妈可以过个暖暖的冬天了。', '1', '1', '[\"http://yanxuan.nosdn.127.net/3afa633ff158ed7739e99f242e6217d0.jpg\", \"http://yanxuan.nosdn.127.net/ab1c13bd41274a8c42d58cfd9c905aa1.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('84', '1006010', '0', '严选的质量没有让人失望，品质真心好！做工让我没有什么可挑剔的，参加了感恩节的活动，感觉赚到了实惠！ 希望严选继续推出高品质，性价�', '1', '1', '[\"http://yanxuan.nosdn.127.net/1ddafd57c3cc4c7fd3cd605ce6e5fdff.JPG\", \"http://yanxuan.nosdn.127.net/a7d5e47ef16d5a6cadec4a62846e28e1.JPG\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('85', '1006010', '0', '很大很温暖，女盆友很喜欢', '1', '1', '[\"http://yanxuan.nosdn.127.net/49ce7f46d4978157321812d2ca8e4846.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('86', '1006010', '0', '一次买了几套，很不错', '1', '1', '[\"http://yanxuan.nosdn.127.net/8bb54ef41cc46ebd96577c38eb87715d.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('87', '1006010', '0', '很好，很舒服。已经套上了被套（也是网易严选的）。', '1', '1', '[\"http://yanxuan.nosdn.127.net/2b52a8a6e59e8b2124cf2739af13910f.jpg\", \"http://yanxuan.nosdn.127.net/96c5f2780a71c0b24ab6741f531a5711.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('88', '1006010', '0', '两层保护，套了个大箱子，基于对严选的信任，人生第一次网上买被子，而且是我没盖过的羊毛被，白白的，软软的，立马跟一起到的被套结合�', '1', '1', '[\"http://yanxuan.nosdn.127.net/20553ede4645fed898754f06a3bd9d9c.jpg\", \"http://yanxuan.nosdn.127.net/0213cae3ef5a865bb6dd8db6015cfc86.jpg\", \"http://yanxuan.nosdn.127.net/aa4f3ead32776fc29f6d065ce3292c08.jpg\", \"http://yanxuan.nosdn.127.net/d437f107e112d9b6dd944efadbb9f451.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('89', '1006010', '0', '质量很好，还没用，希望是个好东西。', '1', '1', '[\"http://yanxuan.nosdn.127.net/b0b43ef8aee2a518e256904ed9fd09fc.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('90', '1006010', '0', '比想象中的好好多！以至于我第一次愿意发买家秀！', '1', '1', '[\"http://yanxuan.nosdn.127.net/1de092f2aad814487558f41b3de008cf.jpg\", \"http://yanxuan.nosdn.127.net/3172ec3dd5de21b03310dcffdcc218c6.jpg\", \"http://yanxuan.nosdn.127.net/490ea866acd1e3ee81515bbe5b2b6825.jpg\", \"http://yanxuan.nosdn.127.net/7a4dd625b8189905b263d23e5ecc0e23.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('91', '1006013', '0', '晾了两天 现在盖了 好舒服啊！已经爱上网易了严选了 要剁手了', '1', '1', '[\"https://yanxuan.nosdn.127.net/5779110874e03e1364ae2d3e74e78cee.jpg\", \"https://yanxuan.nosdn.127.net/06f11a4b428f316dbab2b664c2838faa.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('92', '1006013', '0', '被子质量很好，比实体店的便宜质量又好，值了！', '1', '1', '[\"https://yanxuan.nosdn.127.net/501c14b56ed0d7a6fb6a5f47ca90f51d.jpg\", \"https://yanxuan.nosdn.127.net/488c125fb54f8a6ee5f66cc3849a6b55.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('93', '1006013', '0', '顺丰快递，物流很快！宝贝手感很舒服！', '1', '1', '[\"https://yanxuan.nosdn.127.net/2c0edd6951c4ccdc6816a6654ae153ea.jpg\", \"https://yanxuan.nosdn.127.net/d2cf24a8b7e98fdc14e55213f7a12f1f.jpg\", \"https://yanxuan.nosdn.127.net/044ad064291fdd00fdb7222634ea1c00.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('94', '1006013', '0', '快递超级快 一天不到就送来了 对严选的质量从来没有担心过 这次更是出乎意料的好 赞', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('95', '1006013', '0', '很棒的一个产品！非常满意！盖起来轻薄又透气，在冷气房的保暖度也足够。很喜欢网易的蚕丝系列产品。', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('96', '1006013', '0', '对蚕丝被非常挑剔的我表示对严选的品质非常满意，货品的确是100%桑蚕丝，做工精细，面料厚实，价格真心划算，真是太惊艳了，已经推荐给身�', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('97', '1006013', '0', '蚕丝用的很好，轻薄舒适，性价比很高。准备回购。', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('98', '1006013', '0', '我在罗莱实体店看到是400g要八百多，是桑蚕长丝。严选这个收到后感觉也不错，有淡淡的那种蚕丝香味，触感也很好，还没盖，应该会很好！', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('99', '1006013', '0', '严选地球日活动买的，两条也差不多八折，正好和老妈一人一条，夏天快到啦，感觉一斤也不是很薄，蚕丝看着也不错，没什么味道，稍微通风�', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('100', '1006013', '0', '真的不错，收到之后马上体验了。整体感觉非常柔和舒适，很有质感。感觉使用温度需要20度到25度。非常喜欢。', '1', '1', '[\"https://yanxuan.nosdn.127.net/692898a037906863f4130cc28aa96f54.jpg\", \"https://yanxuan.nosdn.127.net/daea9059182226688f60b1c7ee943b1a.jpg\", \"https://yanxuan.nosdn.127.net/13026a745b1269591968eb5774beea93.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('101', '1006013', '0', '太舒服啦！又轻又舒服！简直太值了。还想买一套。睡觉都成了一种享受啦！', '1', '1', '[\"https://yanxuan.nosdn.127.net/a5e70db6cb702cdb15c25410240da4e0.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('102', '1006013', '0', '摸着滑滑的，没有味道，南京这个天盖稍微有点凉，等假日温度上来就能用了。', '1', '1', '[\"https://yanxuan.nosdn.127.net/0eaedb093836fc19b44c9762ec4245f9.jpg\", \"https://yanxuan.nosdn.127.net/64b07866551aca5ab545b6945c3aa238.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('103', '1006013', '0', '包装真是太严实了，质量很好，0.5公斤的盖着不沉，很贴身，没有异味', '1', '1', '[\"https://yanxuan.nosdn.127.net/31d573ea8e20c70c46f3e2a981201587.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('104', '1006013', '0', '手感超级棒，本来买了2床，还担心不合意退货麻烦，现在看来担心完全是多余的啦。', '1', '1', '[\"https://yanxuan.nosdn.127.net/f48b64fc44e30b9353699d75cae4d38d.jpg\", \"https://yanxuan.nosdn.127.net/8be7358f3367af5f9b4607bb5904185a.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('105', '1006013', '0', '手感超级棒，本来买了2床，还担心不合意退货麻烦，现在看来担心完全是多余的啦。', '1', '1', '[\"https://yanxuan.nosdn.127.net/ed462bd77a20e2442c2d56d98d32ee8d.jpg\", \"https://yanxuan.nosdn.127.net/31388ad9b235215a4f0974a66e748575.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('106', '1006013', '0', '到了就打开装好了，这个天盖着正合适。柔软亲肤。价格美丽。真心不错。', '1', '1', '[\"https://yanxuan.nosdn.127.net/19876c8e3661289f0b9a07a3948ad2b1.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('107', '1006013', '0', '超级超级舒服。用券以后感觉也挺划算的。希望能推出再厚一点的。', '1', '1', '[\"https://yanxuan.nosdn.127.net/d6d444376770e922138b1d12c18c020a.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('108', '1006013', '0', '丁磊真是个最有情怀的CEO，也是养猪专业户里最有情怀的！中毒严选！', '1', '1', '[\"https://yanxuan.nosdn.127.net/9285abeba996f87ffb126d761a7bea29.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('109', '1006013', '0', '挺服帖的，天气热了刚好网上，就是有股味道，得晾晾', '1', '1', '[\"https://yanxuan.nosdn.127.net/b38e68c198d8b1d41be27c9e8c4ee73d.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('110', '1006013', '0', '保证严实，质量杠杠的', '1', '1', '[\"https://yanxuan.nosdn.127.net/01ce532366fb5dc49eb88e490d5d3984.jpg\", \"https://yanxuan.nosdn.127.net/c509586b0e728860a8d14870f06112fb.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('111', '1006013', '0', '一起买的，很好', '1', '1', '[\"https://yanxuan.nosdn.127.net/6b6a073e6d7caad43f5e8cf9833da01e.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('112', '1006013', '0', '真心好！赞一个！支持国货', '1', '1', '[\"https://yanxuan.nosdn.127.net/3853600951a35647609c6844dcdd6c86.jpg\", \"https://yanxuan.nosdn.127.net/b1638f9674d1d8e9ca1872b12312f68f.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('113', '1006013', '0', '不错', '1', '1', '[\"https://yanxuan.nosdn.127.net/4c5dfff639bc36a67ee8a35892f8d200.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('114', '1006013', '0', '质量很好，很舒服', '1', '1', '[\"https://yanxuan.nosdn.127.net/0ed20445542ab57b134ac1c7d3a0faea.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('115', '1006013', '0', '套进去了很舒服啊。就是想要这种薄点的，家里的都太厚', '1', '1', '[\"https://yanxuan.nosdn.127.net/c5f4909c19090e6e61157fa9eda1d0de.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('116', '1006013', '0', '包装很仔细，缝合做工好，填充柔软轻薄。等天气暖和后就用', '1', '1', '[\"https://yanxuan.nosdn.127.net/e94d6adaec4edf5702d3210b3d6ebe58.jpg\", \"https://yanxuan.nosdn.127.net/42369e5b147025746542231936d63ac5.jpg\", \"https://yanxuan.nosdn.127.net/03a66e35f55d08c2de10834ce415bf89.jpg\", \"https://yanxuan.nosdn.127.net/2bd45812d820f727c2e7f3fa3988dbce.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('117', '1006013', '0', '有点薄，但是柔软蓬松。适合这个季节。', '1', '1', '[\"https://yanxuan.nosdn.127.net/66f272393658392a6f023898dccb9e90.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('118', '1006013', '0', '感觉还行，要用过才知道好不好', '1', '1', '[\"https://yanxuan.nosdn.127.net/84b6457d734c73414da6ba6247ac18af.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('119', '1006013', '0', '很舒服，适合夏天吹空调时盖', '1', '1', '[\"https://yanxuan.nosdn.127.net/a27659551c60008c31b1b48a2fa62c88.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('120', '1006013', '0', '三层包装，收到后刚好晴天暴晒了！不错', '1', '1', '[\"https://yanxuan.nosdn.127.net/6b06e92c9783ebbdda81346912296b58.jpg\", \"https://yanxuan.nosdn.127.net/2b4c5c819f6af06e79d57ea098a39a56.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('121', '1006014', '0', '超级喜欢这个被子，这个组合广东已经够用了，真好，好像一朵云盖在身上，比以前买的蚕丝被都好～', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('122', '1006014', '0', '妈妈说非常好，字母被设计非常好用，面料很好高档，比某些大牌划算多了，蚕丝被是天然的很养皮肤', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('123', '1006014', '0', '性价比超高，子母被四季适用，宝宝睡觉容易出汗，蚕丝被透气保暖最合适。', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('124', '1006014', '0', '被子收到了，凉了两天后就开始用母被，正合适，很舒服。', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('125', '1006014', '0', '被子质量很好，非常舒服，母被正适合春秋，子被适合夏天，冬天子母合体，第一次在严选，很棒的购物体验，又接连下了几单，期待中。', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('126', '1006014', '0', '收到后晾味两天，厚的收起来等天冷了盖，薄的已经盖上了，手感非常好，丝滑，盖起来也很舒适，亲肤，透气，桑蚕丝的被子对人身体好，总�', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('127', '1006014', '0', '超舒服，买的是字母被，1.5➕0.5的，冬天肯定很舒服，这个季节用的是1.5的稍微有点热，过几天就用0.5的啦。打算后期再入一床1公斤的，感觉会�', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('128', '1006014', '0', '舒服，柔软，双层，冬夏两用，好', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('129', '1006014', '0', '还是有那么重那么沉～原本还在担心会不会冬天盖了少了～铺上以后觉得应该也很差不多了！', '1', '1', '[\"https://yanxuan.nosdn.127.net/8736be0264f1d722cef01939836973e0.jpg\", \"https://yanxuan.nosdn.127.net/d0a72092ca8ca6077215e9f23efa31e2.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('130', '1006014', '0', '包装的很用心，马上晾晒起来，子母被叠在一起冬天应该不冷了，春秋被正好用上。', '1', '1', '[\"https://yanxuan.nosdn.127.net/6364c9dd6affe4796937326445ecc064.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('131', '1006014', '0', '刚买就有活动了，用着挺好再给父母买一套，比自己那套划算多了~~', '1', '1', '[\"https://yanxuan.nosdn.127.net/eba8499ab70da5138d0d5511a79a8e35.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('132', '1006014', '0', '很舒服，对比了罗莱家纺，还是选择了严选，没有令人失望。', '1', '1', '[\"https://yanxuan.nosdn.127.net/c2fa7ba74c8b80fb36a5224931570be0.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('133', '1006014', '0', '尺寸蛮好！质感也好！蛮喜欢，以后有需要还会光顾的！', '1', '1', '[\"https://yanxuan.nosdn.127.net/f997931b3715affcb7546ca70010d558.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('134', '1006014', '0', '好重一大包，质量应该不错，相信严选', '1', '1', '[\"https://yanxuan.nosdn.127.net/e871c512e6183395b40eea65033633ec.jpg\", \"https://yanxuan.nosdn.127.net/3abc075b9a60c6b99507636a96dd001f.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('135', '1006014', '0', '蚕丝被非常好非常好非常好，换下羽绒被正好用它，超级丝滑，外面的面料也高大上，太对得起它的价格了，隔着被罩都能感到丝滑，必须赞一�', '1', '1', '[\"https://yanxuan.nosdn.127.net/52d48f5df17c94de6efc03220e808f60.jpg\", \"https://yanxuan.nosdn.127.net/4caaf0a13a70f801f62efdcc0b12c69e.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('136', '1006014', '0', '温馨福袋揭秘', '1', '1', '[\"https://yanxuan.nosdn.127.net/27bd18e109bfec677acb114f0df15049.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('137', '1006014', '0', '不错不错', '1', '1', '[\"https://yanxuan.nosdn.127.net/97b8b982e976f2b7e3fd8f453378212d.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('138', '1006014', '0', '春天到了，一直没有用起来，被我塞到了柜子角落里，真是不好意思！子母被可以一年四季都用上，夏天用0.5公斤的，春秋用1.5公斤的，冬天两�', '1', '1', '[\"https://yanxuan.nosdn.127.net/7b0bc93f9eaa88ea9354d6e33afa514d.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('139', '1006014', '0', '蚕丝被是在看过评价后买的，所以还是很满意的。个人觉得有淡淡的很正常的味道。其实包装并不是最重要的，重要的是商品的品质。', '1', '1', '[\"https://yanxuan.nosdn.127.net/0fcae1110d09b0c7ef44778781c39a5d.jpg\", \"https://yanxuan.nosdn.127.net/505f58c738ca26fc35a5f58e2e5d2db7.jpg\", \"https://yanxuan.nosdn.127.net/cb6db0c1f24151323f0bd8e40e6c63db.jpg\", \"https://yanxuan.nosdn.127.net/a4d3db8aec4933a24b031b3c331829da.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('140', '1006014', '0', '能看到蚕丝呢，两床被子有拉扣能锁住，没什么味道，外面的被套很舒服，不沉很暖和，东北的冬天一床就够够的了，推荐！', '1', '1', '[\"https://yanxuan.nosdn.127.net/e1466fdabc2df0ec42261139858eac99.jpg\", \"https://yanxuan.nosdn.127.net/64a7d1ed37be1b9f5f45552cf0c59eb7.jpg\", \"https://yanxuan.nosdn.127.net/5a4dfa6ffe661f52705fa01b3db10217.jpg\", \"https://yanxuan.nosdn.127.net/8dd061631aca0194517f2e17826c4571.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('141', '1006014', '0', '品质真的太好了，有图有真相，必须给严选十二分好评', '1', '1', '[\"http://yanxuan.nosdn.127.net/b536d19af6299dfbea2362954e7b3ba2.jpg\", \"http://yanxuan.nosdn.127.net/3629cb676c071af26023f2cae21520e6.jpg\", \"http://yanxuan.nosdn.127.net/57e702c6068668e6a025ff799162dcb4.jpg\", \"http://yanxuan.nosdn.127.net/1e7a50c0866931982f64ebc4dcf1dd07.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('142', '1006014', '0', '很重一大袋，应该是不错', '1', '1', '[\"https://yanxuan.nosdn.127.net/01671ffc2f8f533dc10b9fae5e888b02.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('143', '1006014', '0', '不错', '1', '1', '[\"https://yanxuan.nosdn.127.net/0551f86464a85f7bef8636e82d2a16c1.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('144', '1006014', '0', '东西真得很不错，份量足，比预期的重一些。包装有三层，够结实的。', '1', '1', '[\"http://yanxuan.nosdn.127.net/8bae8bc13f53b8d77e3da8a339a826b8.jpg\", \"http://yanxuan.nosdn.127.net/6eadf3d5235e875a13fb9e094c25d3ca.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('145', '1006014', '0', '第一次用蚕丝被 原来这么薄 但是保暖性能相当好 略微有一点气味 可以忽略', '1', '1', '[\"http://yanxuan.nosdn.127.net/0203d4a921a735a03a9ec2509a4ca5f9.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('146', '1006014', '0', '严选买蚕丝被放心', '1', '1', '[\"https://yanxuan.nosdn.127.net/ccd0091d097f9da975848aeedf729da3.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('147', '1006014', '0', '不错', '1', '1', '[\"https://yanxuan.nosdn.127.net/117da716695d4cd0666b4a4f1614a00d.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('148', '1006014', '0', '使用后再追加评价☺', '1', '1', '[\"http://yanxuan.nosdn.127.net/0d9bd7d05a75234ac5fb56569fa3afbf.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('149', '1006014', '0', '蚕丝被质量真的好  冬天也足够啦', '1', '1', '[\"http://yanxuan.nosdn.127.net/161eaf989138d13499c4b0ec83f4a4fb.jpg\", \"http://yanxuan.nosdn.127.net/8e4a2ecdf1b4586ad54a666f6c9ddb6b.jpg\", \"http://yanxuan.nosdn.127.net/cd0efbf8cd0c2aacb6e3a4de8aee0f0c.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('150', '1006014', '0', '包装不错质量应该还行和小宝被子的味道一样', '1', '1', '[\"http://yanxuan.nosdn.127.net/37741286381028ce1db15966140ad90c.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('151', '1009009', '0', '相信这个是高品质的鹅绒做成的，每次晒完被子蓬松得不得了，整理床被也方便，只要轻轻一掀，被子就平整服帖了；盖在身上既轻又贴身，柔�', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('152', '1009009', '0', '羽绒被真的太棒了，很暖很轻，活动价格1300+很给力，而且盖着也不会有太大响声，买了两套，一套给爸妈，一套自己用。', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('153', '1009009', '0', '到货搭到阳台晒了几天，没有异味！舒服的抱着不想起来！去大商场看了，同款鹅绒都要2千多！某宝又怕假货！只要严选没有辜负我的关注！真�', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('154', '1009009', '0', '外包装是好的，可被子的箱子为啥灰辣么多而且破破烂烂的，还没打开看，但仓储差评差评！', '1', '1', '[\"https://yanxuan.nosdn.127.net/0b698871fee771050538f9e98d6cc1bf.jpg\", \"https://yanxuan.nosdn.127.net/243c459a1195839cf45084f35540c2dc.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('155', '1009009', '0', '被子不错，一大箱，但是这个箱子能设计个提手么，这么大的箱子想让人怎么拿啊', '1', '1', '[\"https://yanxuan.nosdn.127.net/e3573ec3d123bde7311edd874ff9e3b2.jpg\", \"https://yanxuan.nosdn.127.net/9b2308745635c95764a32e122d52e2dd.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('156', '1009009', '0', '双十一1279买的，结果发现有一处钻绒。网易竟然没有换货服务，搞笑。在考虑要不要退货', '1', '1', '[\"http://yanxuan.nosdn.127.net/0eaea152d968cb88ba8a6082f49254c9.jpg\", \"http://yanxuan.nosdn.127.net/4a13a803fc6993845c98754a7dd714cd.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('157', '1009009', '0', '很轻很厚，现在用不了了囤着冬天用。限时购1359，价格实惠。', '1', '1', '[\"https://yanxuan.nosdn.127.net/163aa25c63783f245b2903f7230db795.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('158', '1009009', '0', '超级暖，平时很怕冷的。盖这个绝对够了，可以抵御零下好几度。加上60s暖绒被套舒服', '1', '1', '[\"https://yanxuan.nosdn.127.net/6815e6e715e469f9e0498a84c248f3b7.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('159', '1009009', '0', '不错', '1', '1', '[\"https://yanxuan.nosdn.127.net/3c86f256e559dfcb5c6ac12ee6f0957e.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('160', '1009009', '0', '相见恨晚的感觉。使用后才来评价。太暖和太舒服了，大大改善了我长期失眠的状态。非常赞！', '1', '1', '[\"https://yanxuan.nosdn.127.net/0d35feb8182002ce0efa39dd04c8e188.jpg\", \"https://yanxuan.nosdn.127.net/15802fa58be1a8c9ee114f526ee88337.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('161', '1009009', '0', '又轻又暖，就是觉得短了点？严选的包装真是杠杠的，盒子质量不要太好啊！', '1', '1', '[\"https://yanxuan.nosdn.127.net/5f996396607421ab20f91d12fbd84f97.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('162', '1009009', '0', '赞，很保暖很舒适，陪伴度过了一个美好的冬天', '1', '1', '[\"https://yanxuan.nosdn.127.net/ba6c27952db325c72f5b1f2ad76c2acd.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('163', '1009009', '0', '好大的箱子啊，一定要直接寄回家。我想当然的寄到单位了，快递帮我往上搬的时候同事们以为发东西了呢。快递小哥人真好，强烈要求帮我送�', '1', '1', '[\"https://yanxuan.nosdn.127.net/357dfd5e73d3c7b8d93b598dc5cfa3c2.jpg\", \"https://yanxuan.nosdn.127.net/d80005eeb4a494fe820a2a993d8c10bf.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('164', '1009009', '0', '活动是买的 这个羽绒被超值！非常暖和！很厚 很蓬松，比原来盖的波司登还要好，绝对物超所值！', '1', '1', '[\"https://yanxuan.nosdn.127.net/3aa16a41e998d7cb01646612a085d74e.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('165', '1009009', '0', '被子很轻柔，舒服，包布质量密实，两千块钱值得。', '1', '1', '[\"http://yanxuan.nosdn.127.net/71fd5f70b7da24c755370aff3767d0e2.JPG\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('166', '1009009', '0', '东西很好，给娃买的，很蓬松，降温也不怕了，换上新被套，更棒！', '1', '1', '[\"https://yanxuan.nosdn.127.net/1f8379242fa0dfe2be0b63299a92de8a.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('167', '1009009', '0', '老妈表示超级暖和，满意。', '1', '1', '[\"https://yanxuan.nosdn.127.net/303f07460c563b2809e8a28c42ec2974.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('168', '1009009', '0', '喜欢，软软的，还没用，先晒晒阳阳希望更蓬松', '1', '1', '[\"https://yanxuan.nosdn.127.net/5f9179e49cd6f301d933a20b9ea15ff7.jpg\", \"https://yanxuan.nosdn.127.net/e3598c1c76af2977f8e47657e79073d8.jpg\", \"https://yanxuan.nosdn.127.net/cd2a1ce5f8c8c6462873cbc883064cab.jpg\", \"https://yanxuan.nosdn.127.net/b0e5cc9f65ce8c473bb60e33d702c174.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('169', '1009009', '0', '睡了两天，被子很轻，但是非常暖和', '1', '1', '[\"https://yanxuan.nosdn.127.net/ca5f41ddb4e996752eaee88c603f89db.jpg\", \"https://yanxuan.nosdn.127.net/ccc7e1ced6ae6653d27db2d2a5dad2bc.jpg\", \"https://yanxuan.nosdn.127.net/a676fec8d311b18352041938eb47f2fa.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('170', '1009009', '0', '不错', '1', '1', '[\"https://yanxuan.nosdn.127.net/510daeeeb0d7ab374d19118b56907d03.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('171', '1009009', '0', '包装一如既往的高端大气上档次，羽绒被一拿出来就完全蓬松了，手感超级舒服，真的有睡在云朵里的感觉哟', '1', '1', '[\"http://yanxuan.nosdn.127.net/acf4545e5f5155610a9920639554eaca.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('172', '1009009', '0', '非常暖和，也时很厚的感觉，搭配有垂坠质感的被套，这样就完美了。', '1', '1', '[\"https://yanxuan.nosdn.127.net/32867c025eda5d3fdceb6106420cfff3.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('173', '1009009', '0', '被子太棒，很厚实很蓬。就是没有口子打开看到底是什么绒，不过无所谓啦，相信严选。', '1', '1', '[\"http://yanxuan.nosdn.127.net/2ac89fe52540efd8343791fc1fd2b155.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('174', '1009009', '0', '八折买的 颜色蛮好看 也很蓬松 透透气 还没有使用 不知道效果怎样 相信网易严选的品质', '1', '1', '[\"http://yanxuan.nosdn.127.net/d78ca7784908b91c720ec735c5a804c8.jpg\", \"http://yanxuan.nosdn.127.net/a00bd908f3cb0e5a20e1a47574d1c243.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('175', '1009009', '0', '特别厚 怀疑买厚了 蓬松度很好 没有异味 虽然不是无声的 但是绝对可以接受 没多大声', '1', '1', '[\"http://yanxuan.nosdn.127.net/d83c8a7bea22d11b5c87f90eac4dc39a.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('176', '1009009', '0', '被子还没用，手摸了下，手感不错，而且也比较轻薄，期待暖暖的被窝效果。纸巾很划算。买了几次了，感觉严选产品质量真心不错', '1', '1', '[\"https://yanxuan.nosdn.127.net/9abf716e255f1436439559a9792d0741.jpg\", \"https://yanxuan.nosdn.127.net/5c4ceaa303be30f8dea7e6d797fb48c7.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('177', '1009009', '0', '活动送了299的泡泡纱可水洗空调被 用不上 全新250转 粉色', '1', '1', '[\"https://yanxuan.nosdn.127.net/789eabd8acb8033a645d657761d664b2.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('178', '1009009', '0', '非常舒服像睡在云朵里，拿出包装很快就膨胀起来，厚厚的冬天不怕冷了。', '1', '1', '[\"http://yanxuan.nosdn.127.net/b31f1ba01ad55a1c5c211fc78c9151ce.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('179', '1009009', '0', '被子整体约重7斤 体重称抱猫量法 摸起来不错 绒比较细 毛杆子不明显', '1', '1', '[\"http://yanxuan.nosdn.127.net/081d8d7ba1363e567f1a4ba3a510746f.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('180', '1009009', '0', '很舒服。当然四件套也是在严选买的。盖在身上很轻却很暖。半夜都会觉得热出了汗，但真的觉得很暖和。之前买了严选的羊绒被，质量也蛮好�', '1', '1', '[\"https://yanxuan.nosdn.127.net/38efadd5eee61fb44488062a4cb13f50.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('181', '1009012', '0', '枕头确实好，打卡包装后，很快完成充气，蓬松柔软。高度也合适，睡觉变得很享受。', '1', '1', '[\"https://yanxuan.nosdn.127.net/827017ba882ecc73bbc84b158ce52f58.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('182', '1009012', '0', '真空包装哦！拆开后就会膨胀起来，触摸感很好，尺寸有点大，枕头套刚好能装进去。明天洗了看效果怎么样，很实惠哦！', '1', '1', '[\"https://yanxuan.nosdn.127.net/642f783d1a82bcddca5c8b6d60a50587.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('183', '1009012', '0', '超级舒服，跟我去住五星级酒店的枕头一样，空气感超强', '1', '1', '[\"https://yanxuan.nosdn.127.net/490b249734045af43acec2bd059a9e17.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('184', '1009012', '0', '抱着试试看想法买了一只，结果很蓬很弹，睡着非常舒服，网易果然没让我失望！昨天又下单买了一只呢！', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('185', '1009012', '0', '枕头很舒服，蓬蓬的但睡下去就会到合适的高度，是在很舒服', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('186', '1009012', '0', '枕头是很划算，当时做活动也就三十来块钱，用了大半年，还是很舒服的，可水洗，揉揉软软的，喜欢低枕的可以试试', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('187', '1009012', '0', '一口气买了好几个，软绵绵的，舒服得舍不得离开自己的窝了', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('188', '1009012', '0', '枕头很舒服，弹力很好，有助睡眠。', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('189', '1009012', '0', '枕头质量非常，做工精制，喜欢。', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('190', '1009012', '0', '枕头充气很快 媲美外面一两百的枕头', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('191', '1009012', '0', '第一次在严选下单，就被严选的认真态度圈粉了！严选的包装很细致，枕头是真空包装，打开袋子后自动鼓起来。整体软硬适中，枕上去只会压�', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('192', '1009012', '0', '收到昨晚就试了。感觉好舒服。\n好评，还会再次购买的。\n一起买了好几样。没有单独拍枕头。', '1', '1', '[\"https://yanxuan.nosdn.127.net/a411c758836a8e5f785f9c887c9eade7.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('193', '1009012', '0', '包装精美，便宜又好的枕芯境内，以后就严选了。快递员态度也很好', '1', '1', '[\"https://yanxuan.nosdn.127.net/510bdb612db9dc0afcf521ecfab0d544.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('194', '1009012', '0', '好喜欢！好蓬松！好软！扯出包装袋立马蓬松起来，小伙伴不要看照片以为很低，总归很超值！', '1', '1', '[\"https://yanxuan.nosdn.127.net/ec18a1d6f7570d91ffcb00522992a7b9.jpg\", \"https://yanxuan.nosdn.127.net/f5ca9301a37bfc4ffb9159b7a0dc9058.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('195', '1009012', '0', '枕头很棒，枕着特别舒服，也没有异味，顺丰发货也快的没话说，包装好，都满意，好评~支持网易严选！', '1', '1', '[\"https://yanxuan.nosdn.127.net/59df349a01837ab721218fb7809871d2.jpg\", \"https://yanxuan.nosdn.127.net/5148b82159c373293feda182407596c8.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('196', '1009012', '0', '质量挺好的，就是稍微有点大，打算再给父母买两个，当时买的是限时够，现在贵了十几块呢', '1', '1', '[\"https://yanxuan.nosdn.127.net/5d775bd76f04920099a642ba183ac9cf.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('197', '1009012', '0', '别的都挺好的，就是上面的洗涤说明看起来像放了几百年的布一样……希望换一种布料，不然总感觉怪怪的', '1', '1', '[\"https://yanxuan.nosdn.127.net/49030becc853b68b813089a0ac1a6c4e.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('198', '1009012', '0', '最柔软的羽绒枕，很软枕上去没有高度，是我脖子喜欢的高度，从此不再落枕，套上枕套美美哒～', '1', '1', '[\"https://yanxuan.nosdn.127.net/f1a26f246acd80b93a3ffd3b71be93ce.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('199', '1009012', '0', '我的天真的好，用网易新闻金币换的没有花钱，真的帅气。推荐推荐，舒服舒服。', '1', '1', '[\"https://yanxuan.nosdn.127.net/b4f1e58479a242366bea4d6dbf2ff4ec.jpg\", \"https://yanxuan.nosdn.127.net/fe732c746cccc711667b0cd337ccfba3.jpg\", \"https://yanxuan.nosdn.127.net/756d3468dab3c5a5de9685d8faa6dd18.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('200', '1009012', '0', '不错，很蓬松，也挺厚实，睡着有支撑感，就是不知道，这个蓬松度可以保持多久，希望可以耐用点吧！', '1', '1', '[\"https://yanxuan.nosdn.127.net/0cea9a7b366b8e3fcef5269137294359.jpg\", \"https://yanxuan.nosdn.127.net/051786f7e3eb36cabb458779c5fae9fe.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('201', '1009012', '0', '先前买了两个，又买了两个，还推荐朋友买了。严选东西就是好。', '1', '1', '[\"https://yanxuan.nosdn.127.net/3161beb18ccf054115315cf09557ed59.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('202', '1009012', '0', '看评价好多人说矮 我枕着正好 也很有弹性 非常喜欢 还不贵', '1', '1', '[\"https://yanxuan.nosdn.127.net/bc547322ad5a8164a388d56508fc93eb.jpg\", \"https://yanxuan.nosdn.127.net/5894aad819e9c15ecffe88e9445884ae.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('203', '1009012', '0', '枕头很棒。但是喜欢睡矮一点的人，这个枕头或许太高。不过质量包装都是没得说的。严选很棒。继续加油吧。', '1', '1', '[\"https://yanxuan.nosdn.127.net/1c62d0c41cebccd9e06dc23fe6ed111e.jpg\", \"https://yanxuan.nosdn.127.net/47a2b22b14723f79eb1e89cd26606fcb.jpg\", \"https://yanxuan.nosdn.127.net/a2991ed5eac58e80a356dc784307490d.jpg\", \"https://yanxuan.nosdn.127.net/546c5ed73a242dc0f11949d1e8607519.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('204', '1009012', '0', '京东plus会员，现在对严选也很喜欢，节省了挑选东西的时间，喜欢的话可以放心下单。好的生活，没那么贵。', '1', '1', '[\"https://yanxuan.nosdn.127.net/d29440e326ad54261947b202a3f26f8b.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('205', '1009012', '0', '和好的东东，看着很有质感，一下买了4只，已经用上了，柔软舒服，', '1', '1', '[\"https://yanxuan.nosdn.127.net/fb163c8f9605e606ecab378434cc8587.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('206', '1009012', '0', '枕头有点矮，不建议习惯高枕头的朋友买，另外上面没有拉链，以后清洗的时候有些麻烦。质量蛮好的，网易严选加油', '1', '1', '[\"https://yanxuan.nosdn.127.net/ed6084e670a4ea08448305f4fb6e5a81.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('207', '1009012', '0', '非常柔软舒服！软软的，但是睡觉的时候又能够支撑起来，不错哦！', '1', '1', '[\"https://yanxuan.nosdn.127.net/3b789d855d6db896392a71364356b927.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('208', '1009012', '0', '包装太好了，物流也很快，枕头很好用，高度合适，好评！', '1', '1', '[\"https://yanxuan.nosdn.127.net/78060b1c3cb24079d7a771536019f990.jpg\", \"https://yanxuan.nosdn.127.net/ae1d9d70310386d7acae2e7b74e03fd2.jpg\", \"https://yanxuan.nosdn.127.net/d4e20b69d45c2b1cac898146b53e758e.jpg\", \"https://yanxuan.nosdn.127.net/25da72ece123bb0a092c183c5eac342c.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('209', '1009012', '0', '枕头不错，很软。', '1', '1', '[\"https://yanxuan.nosdn.127.net/30d544de9c2596371557c9309c843eb1.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('210', '1009012', '0', '很软，很舒服', '1', '1', '[\"https://yanxuan.nosdn.127.net/debd2800a3e746d420e450eb05ad4125.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('211', '1009013', '0', '枕头很棒，蓬起来有17、8厘米高，枕下去有7-8cm高，很软又不会很低，舒服！', '1', '1', '[\"https://yanxuan.nosdn.127.net/b007ab3de1c4c9fbea625db5615d49aa.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('212', '1009013', '0', '包装很结实 箱子也很有特色 快递过来一点都没有压坏 枕头是压缩那种的 一打开就变得好大 很软很舒服 相信严选 以后肯定长剁手', '1', '1', '[\"https://yanxuan.nosdn.127.net/b255ead740392bd237ef95a676342833.jpg\", \"https://yanxuan.nosdn.127.net/79b7fc5c13193a2ab5f4d816fd01f91a.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('213', '1009013', '0', '非常不错，打开后立即膨胀起来了，面料挺特殊的，睡起来也很舒服，脖子不会痛了！棒棒哒！', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('214', '1009013', '0', '直接放洗衣机了。没问题。稍稍一拍打就恢复原型了。很喜欢，关键是随意洗不变形', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('215', '1009013', '0', '质量很好啊，一次买了两个，用了好久了才来评价，是好东西哦，信赖严选，发货快，顺丰快递也是隔天到，棒棒哒，满分', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('216', '1009013', '0', '个人不喜欢枕高枕头，这个枕头大小略大，但觉得很好，枕上去会凹陷出合适的大小深度，很舒服。早起拍一拍就变回鼓鼓饱满的形状了！大赞', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('217', '1009013', '0', '枕头越用越蓬松，触感非常好，很满意五分', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('218', '1009013', '0', '没有气味，厚实、蓬松。先收起来，冬天用。', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('219', '1009013', '0', '这个真的很惊喜 很舒服也很软 躺着抱着都很舒服 推荐 包装质量感觉也很棒', '1', '1', '[\"https://yanxuan.nosdn.127.net/7fb1a52e793f738cb9db3660e88756b7.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('220', '1009013', '0', '配合宜家的枕头套，真的很舒服，回弹快，内陷深度也刚好可以承托颈部', '1', '1', '[\"https://yanxuan.nosdn.127.net/44668cb4f55f120a5fe9ebda02e4b3a8.jpg\", \"https://yanxuan.nosdn.127.net/1e2647e8db48c19aec29a9b43c30d4a3.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('221', '1009013', '0', '枕头很柔软，枕上很支撑力很好很舒服。可以直接水洗很方便，确实是款好物！', '1', '1', '[\"https://yanxuan.nosdn.127.net/859dbc341a909ba142c907ff4adb3ae9.jpg\", \"https://yanxuan.nosdn.127.net/36c37e008facb551c60398e61244499b.jpg\", \"https://yanxuan.nosdn.127.net/21430602d5024448e6928d2c28a9c0aa.jpg\", \"https://yanxuan.nosdn.127.net/66a07ac23e1b31f040af1db1c26e9db3.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('222', '1009013', '0', '严选第一单，物流极速，对比以后我才知道这是严选，好的生活不用太贵', '1', '1', '[\"https://yanxuan.nosdn.127.net/b3f1dff629e4552bd48dc7bc448c87cc.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('223', '1009013', '0', '简直不能再满意！枕头太舒服了！以前的枕头睡着做噩梦，这个枕头每天睡的踏实不想起炒鸡喜欢！', '1', '1', '[\"https://yanxuan.nosdn.127.net/2c8ea07e47fd634985763f7542edb147.jpg\", \"https://yanxuan.nosdn.127.net/255aa07962209d5efc43db25b9fc420d.jpg\", \"https://yanxuan.nosdn.127.net/a0dee9b14a716c912ce7b129ed659943.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('224', '1009013', '0', '蛮好的、相信中国人自己也可以做出高品质的产品、国产品牌加油', '1', '1', '[\"https://yanxuan.nosdn.127.net/1493e2f39572135d26d7d44e2ee8a17d.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('225', '1009013', '0', '第二个枕头了 真的很舒服 比59元那款要软很多 舒服', '1', '1', '[\"https://yanxuan.nosdn.127.net/d27341b40f9dded7af6d48b17b3900b0.jpg\", \"https://yanxuan.nosdn.127.net/3311e083d8a6e2600a8efd6767141940.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('226', '1009013', '0', '枕头很大很大。。还没枕，应该不错。', '1', '1', '[\"https://yanxuan.nosdn.127.net/ab40216e0e13bd43e6ce05cb70bf70ed.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('227', '1009013', '0', '超级软超级棒啊 第二次买枕头了 之前那款就很软很舒服 这次也不错 对网易的好感度是从同学实习食堂巨好吃开始的 哈哈网易的东西都靠谱！！', '1', '1', '[\"https://yanxuan.nosdn.127.net/28c3fe99d7c0845d2159821c775daa53.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('228', '1009013', '0', '怎么说呢，枕头实在是太大了，可能在我的单人床上格格不入，能做到真空包装，也算是配的起这么贵的价格！顺丰包邮，即使贵，有这么好的�', '1', '1', '[\"https://yanxuan.nosdn.127.net/bff1a43f24ffe812cc66906199515076.jpg\", \"https://yanxuan.nosdn.127.net/ef5442e53f8e7af08a883bd63b14288d.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('229', '1009013', '0', '这是我用过最大的枕头', '1', '1', '[\"https://yanxuan.nosdn.127.net/0f8e9999e678270f398508fe2b2410ed.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('230', '1009013', '0', '超级喜欢，枕头很软，就是我想买的这种～从此种草网易严选～', '1', '1', '[\"https://yanxuan.nosdn.127.net/67987297b5cbf94ab90d7b2170fb3296.jpg\", \"https://yanxuan.nosdn.127.net/e94869548ec9f377051f2e1d18341885.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('231', '1009013', '0', '枕上去感觉不错，是一体的不能拆，包装很好，物流很快', '1', '1', '[\"https://yanxuan.nosdn.127.net/24ca01952605584b0290ccbaa9a6f199.jpg\", \"https://yanxuan.nosdn.127.net/113358276be0129a8057b095220d308d.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('232', '1009013', '0', '枕头高度正好，软软的', '1', '1', '[\"https://yanxuan.nosdn.127.net/4a5bbc43ce53d987ab8e6348ea85dd2f.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('233', '1009013', '0', '很舒服，空气感，喜欢矮一点点枕头的选这个', '1', '1', '[\"https://yanxuan.nosdn.127.net/2bb50e6bfe365614f6ae5aa1155703b2.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('234', '1009013', '0', '货收到了，看着不错，冲着抗菌防螨买的，期待不一样的效果', '1', '1', '[\"https://yanxuan.nosdn.127.net/c8eaaf0aae9f2ede1f9d33744ba7f8ff.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('235', '1009013', '0', '很蓬松，棒棒哒', '1', '1', '[\"https://yanxuan.nosdn.127.net/0094a3508a0b37d8759597d183c85222.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('236', '1009013', '0', '很柔软', '1', '1', '[\"https://yanxuan.nosdn.127.net/b8bab304cbf3c2991d0bb367c05298da.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('237', '1009013', '0', '软的不行，睡着挺舒服，喜欢硬的不要买', '1', '1', '[\"https://yanxuan.nosdn.127.net/2f9c157a74efe18716c367c83eb05cd7.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('238', '1009013', '0', '舒服', '1', '1', '[\"https://yanxuan.nosdn.127.net/4a474f7688de05eab8f015132cef432c.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('239', '1009013', '0', '超级棒，昨天刚到就直接用了，睡的很轻松，直接做了一个美梦！', '1', '1', '[\"https://yanxuan.nosdn.127.net/969eb7f65ab6aa69e7f242d11a29c32d.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('240', '1009013', '0', '很舒服，比较软的，哈哈哈', '1', '1', '[\"https://yanxuan.nosdn.127.net/a8cd41200248e7b36e90482e9caa7e94.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('241', '1009024', '0', '好舒服！可以变换各种形状！比我之前在朋友家看到的懒人沙发好很多啊！', '1', '1', '[\"https://yanxuan.nosdn.127.net/a3bd6f130fe3ee340037a37b6c721d16.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('242', '1009024', '0', '和MUJI的一毛一样，性价比够高，猫咪亲测舒服。', '1', '1', '[\"https://yanxuan.nosdn.127.net/6a10b3f27172cba92c05cd0530655aff.jpg\", \"https://yanxuan.nosdn.127.net/85e5548a59543b56e668cc0e4dfc45fc.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('243', '1009024', '0', '家里两个懒在地上的沙发，虽然其中一个是狗沙发。感觉跟MUJI 的很像，没有那么软更有型一些，舒适感不错，老公完全陷在这两个沙发里起不来', '1', '1', '[\"https://yanxuan.nosdn.127.net/932ce1df5850a70e25c997ae74682ae4.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('244', '1009024', '0', '物流很快，包装简单，但是实物质量很不错，出乎我的意料，坐上去比想象的舒适，根据你的坐姿调整形状，支撑软硬度也很合适，身体接触面�', '1', '1', '[\"https://yanxuan.nosdn.127.net/7215aa51acd444921885a6df839c4c97.jpg\", \"https://yanxuan.nosdn.127.net/8ca6c7d1609b2cf9a6da9cf9d28946e8.jpg\", \"https://yanxuan.nosdn.127.net/742cb4d878399dbc16ee016bdcc8a1fc.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('245', '1009024', '0', '这个沙发真是太好用了，可塑性极强，随便用什么姿势坐上去都很舒服~', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('246', '1009024', '0', '这个和MUJI 的没什么差别，坐在上面很舒服，家里放一个很赞', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('247', '1009024', '0', '一直很喜欢这个样式的懒人沙发，超级喜。本来打算等新房子装好了，买两个懒人沙发，可以和她一人一个瘫在房间里看电视，听音乐，或者什�', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('248', '1009024', '0', '太棒了，哈哈，躺上去很舒服，休闲用', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('249', '1009024', '0', '很满意，放在客厅沙发旁边，颜色很搭，自己觉得比无印良品的懒人沙发不差哦，值得推荐～', '1', '1', '[\"https://yanxuan.nosdn.127.net/0ecf956ee0cfe4b660e5dc435d6cf6e8.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('250', '1009024', '0', '质量非常的好，第一次用严选，效果超乎想象的好。送的雨伞也不是糊弄的。质量超级好', '1', '1', '[\"https://yanxuan.nosdn.127.net/988d68ce481b4e1425bb12489787900a.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('251', '1009024', '0', '东西不错，感觉和MUJI的差距不大，而且相对很便宜。非常符合人体工程学。希望能出更多优秀产品。', '1', '1', '[\"https://yanxuan.nosdn.127.net/3e1738e13e6dbfc758906ba604738fab.jpg\", \"https://yanxuan.nosdn.127.net/11847bb011f62259378b0a6ba94e04a1.jpg\", \"https://yanxuan.nosdn.127.net/b3eebbdb1e5fdaf2afd91141284c53d0.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('252', '1009024', '0', '坐上去舒适，比MUJI的稍有差别，比较价格有好大差异，做活动一次买了2个，值！', '1', '1', '[\"https://yanxuan.nosdn.127.net/ccc0fd11392c2880ba9958da9c9d7e2b.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('253', '1009024', '0', '买来很久了……非常舒服，躺下就不想起来，粉色也比较耐脏，两个人也可以靠', '1', '1', '[\"https://yanxuan.nosdn.127.net/6c96022a4cfaa246baecd50076eb9f42.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('254', '1009024', '0', '非常满意，看上muji店里的一直下不去手，这次严选做活动就买了。没味道，很舒服', '1', '1', '[\"https://yanxuan.nosdn.127.net/b020d52ddc614fdcf9ec816482bbb464.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('255', '1009024', '0', '打开坐了一下午，坐着腰非常舒服，但整体舒适度肯定不如大沙发，胜在灵活轻便可随意折腾。', '1', '1', '[\"https://yanxuan.nosdn.127.net/e337cf4321f2e318fcd703c13a073b19.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('256', '1009024', '0', '一大坨，单独放地上当凳子没有依靠，不舒服。但放沙发上做垫背很舒服，但有些占地。', '1', '1', '[\"https://yanxuan.nosdn.127.net/5789a2ddfc467d218e6a85cb842833f3.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('257', '1009024', '0', '瘫上去就出不来了，很舒服，跟muji差距不大，回头买个套换换颜色又是另一个风格。', '1', '1', '[\"https://yanxuan.nosdn.127.net/1811203fecc7b720d3d00cd33acfdbfd.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('258', '1009024', '0', '和MUJI毫无差别，质量棒价格却只有一半，推荐很多朋友买了。真是超舒服，家里喵也喜欢躺上面', '1', '1', '[\"https://yanxuan.nosdn.127.net/71ada136cdd64373601825214011af22.jpg\", \"https://yanxuan.nosdn.127.net/07cad4eb2ac9535220388f0614518be0.jpg\", \"https://yanxuan.nosdn.127.net/ab01443acbffa84c8a979f61086e2feb.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('259', '1009024', '0', '很舒服，这个价位还是比较值的，跟muji在坐感上还是有些差异，胜在性价比', '1', '1', '[\"https://yanxuan.nosdn.127.net/47161cc3669b3a91e3a7c95aced21815.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('260', '1009024', '0', '比良品的填充物多摸上去质感差不多，舒适度比良品差些，孩子的原话就是没有良品的舒服。', '1', '1', '[\"https://yanxuan.nosdn.127.net/9e7936d8eae4f7a45a5bbe37879b298c.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('261', '1009024', '0', '沙发我很喜欢，刚刚收到就体验了一下，确实给人一个惊喜，怎么坐都很舒服。', '1', '1', '[\"https://yanxuan.nosdn.127.net/a07e1324bca05e5c2198c7fdcdbbfef5.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('262', '1009024', '0', '感觉跟muji的还是不一样。没有muji的柔软。不过很好了，价格便宜，很划算', '1', '1', '[\"https://yanxuan.nosdn.127.net/d74f0faab980d50255486c550b920e23.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('263', '1009024', '0', '很好，虽然没有muji的爽，但是价格差这么多的情况下还是非常满意的', '1', '1', '[\"https://yanxuan.nosdn.127.net/9d9ecac6a61f7b1c0fcdfe332426fa75.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('264', '1009024', '0', '做工确实比淘宝的好，但是比无印要硬点，舒适度差点，套子料子很好，总得来说不错的。', '1', '1', '[\"https://yanxuan.nosdn.127.net/5946e8e602b1e00ed1a96c9c878b7c73.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('265', '1009024', '0', '很舒服的懒人沙发，放在客厅小阳台，忍不住幻想搬家后坐着读一本书喝一杯咖啡晒一晒太阳的幸福生活啊！', '1', '1', '[\"https://yanxuan.nosdn.127.net/0f451fb2b42e6437c158cd7bebc42b7c.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('266', '1009024', '0', '确实偏硬，没有不想起来的感觉。拿掉外套感觉就来了。请在做大点，外套再大点，体验一定会提升不少。', '1', '1', '[\"https://yanxuan.nosdn.127.net/633602f256da4e2c6d42b3fe3cf9b2cd.jpg\", \"https://yanxuan.nosdn.127.net/d0c54709e1e2cfe4e4e5a088941dc65b.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('267', '1009024', '0', '外头的软套还欠大，跟无印良品比坐进去的感觉，还是那个陷入感好，这个略硬，面皮上的软面多点会好。', '1', '1', '[\"https://yanxuan.nosdn.127.net/56d816049828593feba466b2726f261a.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('268', '1009024', '0', '舒服 惬意 不过身为两百斤的胖子没人拉一把甭想优雅的起来..', '1', '1', '[\"https://yanxuan.nosdn.127.net/7bc086b44be7d9b817e12241a88b6220.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('269', '1009024', '0', '很舒服，坐下后不想起来…颜色不是很好看，再买一个套换着用~', '1', '1', '[\"https://yanxuan.nosdn.127.net/431be25b6a30a2ed03ac47cf8300b03b.jpg\", \"https://yanxuan.nosdn.127.net/2a0ade4dd55807a40cc4f1fd0d94c68b.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('270', '1009024', '0', '本来以为这个颜色耐脏，结果毛毛粘上去很明显，坐着还算舒服但是没有muji的陷的深', '1', '1', '[\"https://yanxuan.nosdn.127.net/02cb14b2e29256273d8c29a0dea86f1f.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('271', '1010000', '0', '天然之物.颜色纯正.手感柔滑.纯羊毛.绝对相信严选....严格筛选', '1', '1', '[\"https://yanxuan.nosdn.127.net/3fcd5c4831a8c6ae297d2df19194843c.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('272', '1010000', '0', '加厚款并不厚，不过保暖效果还是不错的，摸起来手感也很舒服，毯子大小也合适。', '1', '1', '[\"https://yanxuan.nosdn.127.net/156aa67d25e08d2bb0e07c36f3949b38.jpg\", \"https://yanxuan.nosdn.127.net/662f6f65414bf0b96deaed9032c72378.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('273', '1010000', '0', '超喜欢这款羊毛毯，每天躺沙发时都盖在身上，非常保暖。猫也很喜欢。', '1', '1', '[\"https://yanxuan.nosdn.127.net/7f986d83a287bce0544c34a52361d862.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('274', '1010000', '0', '颜色款式材质都是我喜欢的。', '1', '1', '[\"https://yanxuan.nosdn.127.net/014108f56d8cfa0a789b2630ea657a83.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('275', '1010000', '0', '风一般的物流速度，给赞！产品也很好，确实很暖和！', '1', '1', '[\"https://yanxuan.nosdn.127.net/7ecd64239acdbf3d880e3c0d89ddc954.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('276', '1010000', '0', '手感很好，今天拿去干洗一下就可以送给婆婆了✌️', '1', '1', '[\"https://yanxuan.nosdn.127.net/cd8cffb16f9dbd42d26c2467c3b82363.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('277', '1010000', '0', '质感不错，超大，超暖，有股羊味', '1', '1', '[\"https://yanxuan.nosdn.127.net/d19829938e1089c751b4bec660b302e8.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('278', '1010000', '0', '包装很粗糙啊，感觉都不像严选的了。款型很靓，摩擦皮肤也不痒，够厚可以拿来垫床单下面。', '1', '1', '[\"https://yanxuan.nosdn.127.net/647c6245bb7a41323c3ce2cff9bb639e.jpg\", \"https://yanxuan.nosdn.127.net/1da70ad5d263120bbe8a309c9d87eb10.jpg\", \"https://yanxuan.nosdn.127.net/096ee1bcd1e8143916c89d0b756bf0b6.jpg\", \"https://yanxuan.nosdn.127.net/cd60d3af53d09fed72352c310457bd98.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('279', '1010000', '0', '非常不错的一款羊毛毯，冬天窝在沙发追剧必备，值得再入手', '1', '1', '[\"https://yanxuan.nosdn.127.net/e682cb83a0f6c72b6a7bab66e310c093.jpg\", \"https://yanxuan.nosdn.127.net/ebc6cbf55475566f7a383a04acbfef5d.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('280', '1010000', '0', '严选质优，值的拥有。', '1', '1', '[\"https://yanxuan.nosdn.127.net/7638d404f13588d32f32989767e58b4f.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('281', '1010000', '0', '挺厚实的，不错', '1', '1', '[\"https://yanxuan.nosdn.127.net/f086163bcb8ba408a5862f275e6067a9.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('282', '1010000', '0', '很舒服 质量不错', '1', '1', '[\"https://yanxuan.nosdn.127.net/9d1baa05053cbdbd89149d9fd3cdc448.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('283', '1010000', '0', '这是在严选上买的最贵的一次单价的产品 目前为止，看上去还不错。虽然说已经知道他的尺寸了，但是看到他本尊的时候，还是觉得很大。', '1', '1', '[\"https://yanxuan.nosdn.127.net/afd45ceb55bc6bddc44cf50a5325401d.jpg\", \"https://yanxuan.nosdn.127.net/27b45e94dd7a987829c32dd7422819f0.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('284', '1010000', '0', '铲子我很喜欢，盖毯我老婆喜欢，不过没想象的厚', '1', '1', '[\"https://yanxuan.nosdn.127.net/771bef5ae8b66de0852e6e1a7a40319b.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('285', '1010000', '0', '毯子很不错！包装稍显简陋', '1', '1', '[\"https://yanxuan.nosdn.127.net/c5e2f6adb442afda75887456a2c7842b.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('286', '1010000', '0', '正好在下雨天到了', '1', '1', '[\"https://yanxuan.nosdn.127.net/caf4a75974f6d2ef220b47c7f0df0738.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('287', '1010000', '0', '满意！！！', '1', '1', '[\"https://yanxuan.nosdn.127.net/dd181bbf2b271c1c66eff6068de50dc8.jpg\", \"https://yanxuan.nosdn.127.net/4ca7b2d4e1b193e378de57645e0338ec.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('288', '1010000', '0', '很厚', '1', '1', '[\"https://yanxuan.nosdn.127.net/d14c3df3856e42532ca3627243b56e5c.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('289', '1010000', '0', '都非常喜欢！柔软舒适！全羊毛的', '1', '1', '[\"http://yanxuan.nosdn.127.net/01dfbe2416893d0429da5516cdd9502d.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('290', '1010000', '0', '好，完美', '1', '1', '[\"http://yanxuan.nosdn.127.net/e969eaebf84ce032638940d4a99cf842.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('291', '1010000', '0', '感觉还可以，就是没有礼盒包装，就简单一个塑料袋装的。', '1', '1', '[\"http://yanxuan.nosdn.127.net/0b4748f99e520ce931291fa92b98a723.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('292', '1010000', '0', '赠品不给补寄，垃圾服务，以后想转去必要买了', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('293', '1010000', '0', '非常有份量、有質感的一款羊毛盖毯。舒適度也很好，窩在沙發里的首選盖毯。值得推薦！', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('294', '1010000', '0', '非常厚实，真材实料。\n天气渐热，还没用上，但感觉是非常好的质量', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('295', '1010000', '0', '这款虽然没有其他的精致，但是又厚又软，很舒服，限购时买还是蛮实惠的', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('296', '1010000', '0', '很好，性价比超高，和我前两年买的西班牙产毛毯简直一模一样，太赞', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('297', '1010000', '0', '很厚实，很大。家里有暖气的时候盖着小睡一会午觉非常舒服。就是不知道该怎么清洗。', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('298', '1010000', '0', '买给老妈冬天坐在床上看电视披肩膀保暖用的。老妈用了很开心。', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('299', '1010000', '0', '挺厚实的羊毛毯，颜色看起来也非常的自然，没有过度染色，适合配合被子一起使用', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('300', '1010000', '0', '包装精致，做工非常好，颜色也正。网易严选好赞，以后还会继续关注。最主要妈妈很喜欢。', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('301', '1010001', '0', '很不错 比较柔软暖和 春秋用刚好 这个价位算是物有所值', '1', '1', '[\"https://yanxuan.nosdn.127.net/3057506509b4cc0e612516375fde2408.jpg\", \"https://yanxuan.nosdn.127.net/32ed6eab4918d9bc749e8083111bf180.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('302', '1010001', '0', '超出想象的好！又大又暖，冬天客厅看电视的最佳装备', '1', '1', '[\"https://yanxuan.nosdn.127.net/052e2518fae1f5d772ca0d1352e9bc25.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('303', '1010001', '0', '今天收到了，老婆很喜欢', '1', '1', '[\"https://yanxuan.nosdn.127.net/839197bb4193cadec20c7a668f164abb.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('304', '1010001', '0', '这下看电视不用担心冻腿了', '1', '1', '[\"https://yanxuan.nosdn.127.net/38f5c1f70a9c9c5e45f2fcb0b5184641.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('305', '1010001', '0', '我很喜欢，猫更喜欢。。', '1', '1', '[\"http://yanxuan.nosdn.127.net/1c2bcd3005dbf06b98518524afb04f4e.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('306', '1010001', '0', '比图片白一点 有点怕脏 好大 暖和', '1', '1', '[\"http://yanxuan.nosdn.127.net/f1f1e1333d1274e0787f1d805767cc2d.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('307', '1010001', '0', '可能是刚开始 的缘故，有点掉毛，希望往后会好点 还是大力支持严选 希望不忘初心 找寻到更多好产品', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('308', '1010001', '0', '挺软，就是纹理不太明显，质感看起来有点旧旧的', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('309', '1010001', '0', '摸起来很舒服，不错不错…', '1', '1', '[\"http://yanxuan.nosdn.127.net/4c965af8feecdff00f8ef2083041d211.jpg\", \"http://yanxuan.nosdn.127.net/5db2ec27fe5f4da0ad15e745fb190703.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('310', '1010001', '0', '送给闺密的结婚礼物，她非常喜欢。说好大的一个毯子，我打算自己再买一个', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('311', '1010001', '0', '冬天坐在办公室里的保暖神器啊，又软又舒服，一摸就知道是纯羊毛的', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('312', '1010001', '0', '收到很惊喜，厚实、柔软、颜色超美，不必澳洲带回来的差！超级舒服和显档次。', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('313', '1010001', '0', '冬天买的 超爱羊毛毯 虽然多少会扎 但看着都温暖', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('314', '1010001', '0', '喜欢', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('315', '1010001', '0', '感觉很厚实，就是有点掉毛', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('316', '1010001', '0', '非常柔软', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('317', '1010001', '0', '很大，也很暖和。但是也存在其他评论里提到的，有点掉毛。可能需要先干洗一次才行。', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('318', '1010001', '0', '不错', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('319', '1010001', '0', '有档次', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('320', '1010001', '0', '十分柔软亲肤，铺在沙发上做盖毯了。', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('321', '1010001', '0', '收到迫不及待打开，是我想要的，比想象的要好，质量、手感，颜色超喜欢', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('322', '1010001', '0', '手感很好！', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('323', '1010001', '0', '还没用，看着还行，无异味。', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('324', '1010001', '0', '非常好的产品，严选第一选择', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('325', '1010001', '0', '保暖效果不错，就是掉毛的实在是厉害，基本上盖完以后，身上就跟金毛玩了一天一样。', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('326', '1010001', '0', '好东西', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('327', '1010001', '0', '已退货更换', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('328', '1010001', '0', '倒春寒正好用上，可以当披肩又用作盖被，实用。', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('329', '1010001', '0', '好', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('330', '1010001', '0', '很好', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('331', '1011004', '0', '这款毛巾被特别厚实，做工非常精致，质地柔软挺妥，能满足春季和夏天空调间使用，适合我用来午睡✌', '1', '1', '[\"https://yanxuan.nosdn.127.net/635170b308fb7488adcc916c50513998.jpg\", \"https://yanxuan.nosdn.127.net/f53167e6e44205599d358e88fc1d0b27.jpg\", \"https://yanxuan.nosdn.127.net/e7b57b47db189cc8b9dba730953048f0.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('332', '1011004', '0', '厚实，舒适，洗水的时候正常掉绒，洗过后不掉毛，不缩水，不掉色。值！又买了床红色寄给家人用。', '1', '1', '[\"https://yanxuan.nosdn.127.net/a4930439358a64cd1ae391ac021a1267.jpg\", \"https://yanxuan.nosdn.127.net/6bfc27e44113c231c809ecbbe8fc30b0.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('333', '1011004', '0', '质量可以，颜色挺喜欢的，盖了一下，挺暖和的，留着夏天来就可以用了，好评！', '1', '1', '[\"https://yanxuan.nosdn.127.net/21ba531d3d76877f426de429d57f1f91.jpg\", \"https://yanxuan.nosdn.127.net/999578493838a59218230b19fc57f91d.jpg\", \"https://yanxuan.nosdn.127.net/0e49046b0ab483c0b4935ae6da13c1af.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('334', '1011004', '0', '在寝室用不错哦', '1', '1', '[\"https://yanxuan.nosdn.127.net/fd0a27fd1d0753fda7b3b51aca10048a.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('335', '1011004', '0', '不错', '1', '1', '[\"https://yanxuan.nosdn.127.net/a7f4a05abc17737d47e1d87d4803de86.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('336', '1011004', '0', '质量特别好，物超所值！', '1', '1', '[\"https://yanxuan.nosdn.127.net/ddb730d6b3a0405ba62da7e1015d9058.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('337', '1011004', '0', '质量好，盖着很舒服，好评。', '1', '1', '[\"https://yanxuan.nosdn.127.net/07367c480302a7536edf39eb66927f22.jpg\", \"https://yanxuan.nosdn.127.net/adf211d67143b56433a5949131b2376d.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('338', '1011004', '0', '分量足，手感好。\n(^_^)', '1', '1', '[\"https://yanxuan.nosdn.127.net/37f07aeff1f2ca0f266c3b63ed14ddb6.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('339', '1011004', '0', '还是感觉有些薄啊…………', '1', '1', '[\"https://yanxuan.nosdn.127.net/d7f22f2bab32a044d649b1c73f2b9a95.jpg\", \"https://yanxuan.nosdn.127.net/8d074111cbe37a96b4c5bde64eda7747.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('340', '1011004', '0', '物流配送很快，质量非常不错。', '1', '1', '[\"https://yanxuan.nosdn.127.net/1cc9dbaf08d59f1e8e20ceacf37b528f.jpg\", \"https://yanxuan.nosdn.127.net/2a34ee756c626188683150636e5a97cd.jpg\", \"https://yanxuan.nosdn.127.net/d15b196d104468b9af5336460d668ac9.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('341', '1011004', '0', '之前买了一条好好……果断又买了3条', '1', '1', '[\"https://yanxuan.nosdn.127.net/5db4b968c03ca319772f5f8fc19fb499.jpg\", \"https://yanxuan.nosdn.127.net/b29e848512311c2ae3b41c281dfdd7c3.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('342', '1011004', '0', '之前买了一条好好……果断又买了3条', '1', '1', '[\"https://yanxuan.nosdn.127.net/28c2258831b97c2ee2d023c903b2e479.jpg\", \"https://yanxuan.nosdn.127.net/c6ed25afdd223e407ff5e4c5ba1a36a8.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('343', '1011004', '0', '不错', '1', '1', '[\"https://yanxuan.nosdn.127.net/0eab994ad4bce67a91a31c8b8ba6b779.jpg\", \"https://yanxuan.nosdn.127.net/f1a6a066ce0870e42251b8de39a8dadd.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('344', '1011004', '0', '不错', '1', '1', '[\"https://yanxuan.nosdn.127.net/3e03a9d133ca322c436215aa31ce9560.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('345', '1011004', '0', '质量非常好，又密又细，厚实', '1', '1', '[\"https://yanxuan.nosdn.127.net/34c2152720a488a7f15986a693c8c9bc.jpg\", \"https://yanxuan.nosdn.127.net/9e20d4848260f11b14966a96b13ccdca.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('346', '1011004', '0', '不错很厚实', '1', '1', '[\"https://yanxuan.nosdn.127.net/0c9c3aaad0ee1db23010f2882fbe1b33.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('347', '1011004', '0', '被子真心很不错   很重很扎实，在厦门一床这个被子一床空调被就可以过冬天了   喜欢！！！', '1', '1', '[\"https://yanxuan.nosdn.127.net/b53073ebee0024459ee2fe0e4d3c5fc5.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('348', '1011004', '0', '听简洁大气的，颜色挺好看的', '1', '1', '[\"https://yanxuan.nosdn.127.net/6a7825a1ddf67d61c7433df105a6baba.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('349', '1011004', '0', '实物非常好，空调被很厚实，拿到手满满的幸福感～', '1', '1', '[\"https://yanxuan.nosdn.127.net/8459e0a6e239c46942de324a55e2c99e.jpg\", \"https://yanxuan.nosdn.127.net/fe615d5dad609e8221b4667243fbd5d4.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('350', '1011004', '0', '首先对快递表示一下肯定，昨天刚下的单今天就收到了。真的很大很舒服，料子是稍微有一些硬的，不过洗过应该就会好一些了。我买的蓝色的�', '1', '1', '[\"https://yanxuan.nosdn.127.net/377394ea763cf519a56d8f0dd0d8f7db.jpg\", \"https://yanxuan.nosdn.127.net/52991510bc74fad033e7b249d7b9be13.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('351', '1011004', '0', '很好，喜欢，满意，好评，5分！', '1', '1', '[\"https://yanxuan.nosdn.127.net/1d132318eb02ffe326361b49106885cf.jpg\", \"https://yanxuan.nosdn.127.net/6129ceaf1df0a28270c8ac3f14e0bbce.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('352', '1011004', '0', '很好，喜欢，满意，好评，5分！', '1', '1', '[\"https://yanxuan.nosdn.127.net/415967bab62b55d5bd253a5b26784d06.jpg\", \"https://yanxuan.nosdn.127.net/71504a1c7520729d501dec2430f834c2.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('353', '1011004', '0', '与想象中的没差别，好喜欢！', '1', '1', '[\"https://yanxuan.nosdn.127.net/9ea5e29bc21bd9ec70fe7842183c2489.jpg\", \"https://yanxuan.nosdn.127.net/540d6c43e5158695e99d7d4b3ace78bd.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('354', '1011004', '0', '质量好，盖着特别舒服，很软和，这是买的第二创了。', '1', '1', '[\"https://yanxuan.nosdn.127.net/1f9dec128763bd92305fb76adf6e7371.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('355', '1011004', '0', '没味道，质地手感都很好，AB面不错……相信严选', '1', '1', '[\"https://yanxuan.nosdn.127.net/0a2dabac03704e85b7b61b224aa69832.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('356', '1011004', '0', '很好，超出了想象，摸着手感不错，有很厚实很重的感觉，稍微有些味道（商品介绍里说了），现在正在按照商家的介绍放在洗衣机里洗。', '1', '1', '[\"https://yanxuan.nosdn.127.net/990daee00e22c42b1b79eeae9981c673.jpg\", \"https://yanxuan.nosdn.127.net/dc071c856d9fffd31b53eec17e274a67.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('357', '1011004', '0', '挺沉的毛巾被', '1', '1', '[\"https://yanxuan.nosdn.127.net/0e5afb723baf9d1e863ae0d97337aefe.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('358', '1011004', '0', '又大又舒服，质量可靠，还买一件', '1', '1', '[\"https://yanxuan.nosdn.127.net/662393c53e638f08d81035f611b1e4fc.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('359', '1011004', '0', '这个非常满意，很舒服。', '1', '1', '[\"https://yanxuan.nosdn.127.net/b6459dfc4274559982b0389884dd30d1.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('360', '1011004', '0', '厚实阿，很舒服。童年睡觉的感觉。老爸老妈都喜欢。买了两张，还想再买', '1', '1', '[\"http://yanxuan.nosdn.127.net/8108f53f41effcb7581cc1c03b3191de.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('361', '1015007', '0', '严选的商品不论是发货，物流，到品质都是无可挑剔的！从心里说确实好令人满意！', '1', '1', '[\"https://yanxuan.nosdn.127.net/4c3d137c1e299e5502fd0537281e5d04.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('362', '1015007', '0', '一见钟情的抱枕，铃兰的图案美得不行，质量超好的，性价比高。', '1', '1', '[\"https://yanxuan.nosdn.127.net/b54ed26bd3fa54e53e7b7c50ae514751.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('363', '1015007', '0', '放在心理咨询工作室的，图案有的说像花儿，有的说像太阳，充分发挥自由联想，有的来访者从头到尾一直抱着，很有安全感。背面是白色，素�', '1', '1', '[\"https://yanxuan.nosdn.127.net/f019d4ff0e4fdaf4c4123167870c28b7.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('364', '1015007', '0', '必须好评！质量比想象的还要好，做工精细，颜色和图案都很漂亮，喜欢！', '1', '1', '[\"https://yanxuan.nosdn.127.net/75bab0a63713b6a37b83ff6e900c10d0.jpg\", \"https://yanxuan.nosdn.127.net/f0246ffca30bd97a32cf47da0d1b42e1.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('365', '1015007', '0', '绣花美美哒，布的材质也不错！靠垫弹性也不错', '1', '1', '[\"https://yanxuan.nosdn.127.net/6b32775ff2d3b7a4c8b81d78161209fc.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('366', '1015007', '0', '很好看，很美式，准备活动的时候再买一个', '1', '1', '[\"https://yanxuan.nosdn.127.net/90f664150dd6a28f4ea74ad7e9ec4a28.jpg\", \"https://yanxuan.nosdn.127.net/8774ba9d9239f3e39877f555acaf15b8.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('367', '1015007', '0', '真空包装，收到的时候扁扁的，打开拍几下就很蓬松很舒服，做工精细，物超所值', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('368', '1015007', '0', '第一次在严选购物，收到的抱枕让人惊喜！物美价格还不贵！值！', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('369', '1015007', '0', '特别喜欢，跟家里的沙发很配。所有花色都买了，喜欢。。。', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('370', '1015007', '0', '质量很好，花色是我喜欢的类型，刺绣很精致', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('371', '1015007', '0', '花色漂亮，刺绣精致，非常喜欢，严选质量很好', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('372', '1015007', '0', '东西质量好漂亮好喜欢', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('373', '1015007', '0', '做工精细，没异味，回弹性能好，抱着很舒服。就是两个款式厚度有点差异。', '1', '1', '[\"https://yanxuan.nosdn.127.net/45573a8d626928fefcb8fb7c7bcdc6b7.jpg\", \"https://yanxuan.nosdn.127.net/0307884c4b73c2e6b0a5fd70ecb6235a.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('374', '1015007', '0', '做工精细，没异味，回弹性能好，抱着很舒服。就是两个款式厚度有点差异。', '1', '1', '[\"https://yanxuan.nosdn.127.net/65084b80fa3a0a5c40c6af4f4574e257.jpg\", \"https://yanxuan.nosdn.127.net/ba42c4196b5e35820e3876edfa271d10.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('375', '1015007', '0', '全五星！包装用心东西又好！抱着很舒服，也没有什么味道，重点是颜色和花纹很高级很好看。', '1', '1', '[\"https://yanxuan.nosdn.127.net/b57c8ed5c06023a9602e181d0616ca47.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('376', '1015007', '0', '包装用心东西又好！抱着很舒服，也没有什么味道，重点是颜色和花纹很高级很好看。', '1', '1', '[\"https://yanxuan.nosdn.127.net/59e2113b257f591aac6cd05fe01bb34f.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('377', '1015007', '0', '绣花的线材和预期不一样，这种线材类似于毛衣线，图案设计还不错，线头的细节处理有待提高。', '1', '1', '[\"https://yanxuan.nosdn.127.net/6f872a084f469dbf1d2071e1502b7265.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('378', '1015007', '0', '老婆埋怨买少了，高端大气上档次，低调奢华有内涵的一对抱枕，买到就是赚到，严选处女评。', '1', '1', '[\"https://yanxuan.nosdn.127.net/1709ad9668080f5d68e4d99af71e2715.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('379', '1015007', '0', '刺绣图样很漂亮，和图片一模一样，但是怎么只有一面有花样，这不合理啊。和严选的枕头一样好。', '1', '1', '[\"https://yanxuan.nosdn.127.net/d31116d0a2308816f7132058cf65996b.jpg\", \"https://yanxuan.nosdn.127.net/476d82da9638aa3c078a85fe86f33455.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('380', '1015007', '0', '3种颜色都买了，都好看，质量也超级棒，放车上放沙发都很般配！外壳可以脱卸清洗，拉链也很顺滑', '1', '1', '[\"https://yanxuan.nosdn.127.net/4fe031edec3f8274be884cf3ecc179de.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('381', '1015007', '0', '3种颜色都买了，都好看，质量也超级棒，放车上放沙发都很般配！外壳可以脱卸清洗，拉链也很顺滑', '1', '1', '[\"https://yanxuan.nosdn.127.net/107d05282780754c9caa389cbc675931.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('382', '1015007', '0', '3种颜色都买了，都好看，质量也超级棒，放车上放沙发都很般配！外壳可以脱卸清洗，拉链也很顺滑', '1', '1', '[\"https://yanxuan.nosdn.127.net/771d79c61b79683b575d6896945626b9.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('383', '1015007', '0', '同上，这款是美式的，配皮沙发很搭。不过比想象中的花一些', '1', '1', '[\"https://yanxuan.nosdn.127.net/78ddc578bc98934b2afc1235d04a2ce8.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('384', '1015007', '0', '本来想要买铃兰，可以没货了，这款花纹略显凌乱，材质还不错', '1', '1', '[\"https://yanxuan.nosdn.127.net/82d0bb3c13ebb8c12759a604ebfecf46.jpg\", \"https://yanxuan.nosdn.127.net/8830ef8eed5b08626e5d63bd18ca2511.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('385', '1015007', '0', '一共买了4个，质量工艺都蛮好的，配上深棕色的沙发，很漂亮，好评!', '1', '1', '[\"https://yanxuan.nosdn.127.net/1939b8c48f5fa5c7bd421399bb47195a.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('386', '1015007', '0', '非常满意非常满意非常满意非常满意非常满意非常满意', '1', '1', '[\"https://yanxuan.nosdn.127.net/afcadcb617c6fbe9296333f34e84a910.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('387', '1015007', '0', '很漂亮，细看稍微有些线头，不影响整体美观。稍微有点味道，放了两天没味道了。拉链比较顺滑，还没拆洗过，希望不会缩水。', '1', '1', '[\"https://yanxuan.nosdn.127.net/3c427d485030de309dbb05082833485e.jpg\", \"https://yanxuan.nosdn.127.net/7de21d869a06cec111430043e9476807.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('388', '1015007', '0', '真的是价廉物美，质感特别好，很精致', '1', '1', '[\"https://yanxuan.nosdn.127.net/0b6dacaa8a042d32aba41eba382831fe.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('389', '1015007', '0', '真的是价廉物美，质感特别好，很精致', '1', '1', '[\"https://yanxuan.nosdn.127.net/d848bb60aebae7cad32bf1b3ad20eec5.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('390', '1015007', '0', '这款很漂亮，图案配色都很经典', '1', '1', '[\"https://yanxuan.nosdn.127.net/82d0bb3c13ebb8c12759a604ebfecf46.jpg\", \"https://yanxuan.nosdn.127.net/8830ef8eed5b08626e5d63bd18ca2511.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('391', '1019000', '0', '第一次在这买东西，感觉可以，高大上的样子~~', '1', '1', '[\"https://yanxuan.nosdn.127.net/977b2150ba8d0eb116fe28d5007be2b7.jpg\", \"https://yanxuan.nosdn.127.net/e146d5dd0edcede5bc6e34ad4fb7705d.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('392', '1019000', '0', '没有味道，用了一段时间了，感觉挺舒服的，为家里人也买了几个', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('393', '1019000', '0', '限时购抢到的，正好买了新的床搭配上这款记忆枕，很柔软，回弹也不错，再也不怕落枕了～～', '1', '1', '[\"https://yanxuan.nosdn.127.net/fbfd0741f4296cd6ef8494703f2012a4.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('394', '1019000', '0', '枕头非常舒适，恢复速度也很快，基本没有任何异味，网易严选值得信赖，值得推荐！', '1', '1', '[\"https://yanxuan.nosdn.127.net/af231880521c66710957202477b0d00b.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('395', '1019000', '0', '包装高大上，看起来不是很高，味道也不大，不过还得放几天再用，第一次尝试护颈记忆枕，应该挺好的！', '1', '1', '[\"https://yanxuan.nosdn.127.net/34ab034f68d41a1c929e05616f17c5e5.jpg\", \"https://yanxuan.nosdn.127.net/fb330041a2215d63a6dda00d0d1f74f7.jpg\", \"https://yanxuan.nosdn.127.net/0e05c2b6991b08e0c57df46588a93392.jpg\", \"https://yanxuan.nosdn.127.net/d941f8ca89634db5b8b32ab435b5034a.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('396', '1019000', '0', '手感不错，等晚上用了再来评价。不过物流真心快，昨天下午下的订单，今天早上就送到家了。给个赞', '1', '1', '[\"https://yanxuan.nosdn.127.net/e7be56d46a0076091e873413d5b7f630.jpg\", \"https://yanxuan.nosdn.127.net/72bf1ac2cab80221b79cf4d49d2deae3.jpg\", \"https://yanxuan.nosdn.127.net/f9fb4f6cf50bd3097004f4bd2cbcb91f.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('397', '1019000', '0', '特别好特别舒服，原来用荞麦的枕头，现在再也不用自己砸个坑了', '1', '1', '[\"https://yanxuan.nosdn.127.net/3efd90c51ccb43ff93d23d96b156ab7a.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('398', '1019000', '0', '感觉挺好！其实外面的应该是个枕套吧。白色不耐脏，上淘宝买了个深色枕套，谁叫你们没有。', '1', '1', '[\"https://yanxuan.nosdn.127.net/db5f2acb16b53aa0ee0dacd9ebf7a572.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('399', '1019000', '0', '还行吧，对我来说高了，虽然会软下去，其实也没有非常软，第一次用这种枕头，还没办法客观评价。中间有点小瑕疵，总体一般。', '1', '1', '[\"https://yanxuan.nosdn.127.net/d276cf117e469d6f594889a517536d8d.jpg\", \"https://yanxuan.nosdn.127.net/9e5ab36536442c1cf5d908151c8ef658.jpg\", \"https://yanxuan.nosdn.127.net/e280fe74f962b7cc9efbb07fa10050d2.jpg\", \"https://yanxuan.nosdn.127.net/39ba6fa7d9e810104bc050b59b293cae.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('400', '1019000', '0', '枕头有点味道，可能刚送过来的原因吧。不过震起来确实很舒服。', '1', '1', '[\"https://yanxuan.nosdn.127.net/9acc2457fae7b44f46cbf38dfc46a207.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('401', '1019000', '0', '针头不错，侧睡比普通针头舒服很多，减轻了颈部肩部的力量，建议喜欢侧睡的人都入手一个，不然很容易变成习惯性耸肩', '1', '1', '[\"https://yanxuan.nosdn.127.net/00fb73c8a948f8079217a24c80d43ca2.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('402', '1019000', '0', '枕头的弧形并没有想象的高，还不错，买了四个，未来婆婆公公男朋友我各一个，挺好的……很清爽，婆婆给做了枕套，哈哈啊哈哈哈哈', '1', '1', '[\"https://yanxuan.nosdn.127.net/bff23e525e949e872b930e710d08ccc8.jpg\", \"https://yanxuan.nosdn.127.net/e838d02a8dbe90a22e3d552dcc873118.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('403', '1019000', '0', '放宿舍用的，平常的枕套也可以用，也不会说小很多。喜欢仰睡的最好还是枕低一点～之前脖子不舒服枕了这个枕头好多了，超级开心！', '1', '1', '[\"https://yanxuan.nosdn.127.net/22b0065c003aa2e567870cef17292b2f.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('404', '1019000', '0', '第一次买。比想象中软。很白。睡过之后才知道。', '1', '1', '[\"https://yanxuan.nosdn.127.net/7a729ed5625387171597be75d99d82b7.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('405', '1019000', '0', '东西不错，很少买到和描述一样的商品！！！', '1', '1', '[\"http://yanxuan.nosdn.127.net/4a066e86af7fae026b8bfc1d4acd26d3.png\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('406', '1019000', '0', '东西不错，用了之后睡觉的积极性都高了。', '1', '1', '[\"https://yanxuan.nosdn.127.net/034359a1d899f2e3de6666a987284704.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('407', '1019000', '0', '东西不错', '1', '1', '[\"https://yanxuan.nosdn.127.net/f2ff354d8d573ef7265a04b3213b0657.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('408', '1019000', '0', '很舒服的枕头，值得购买', '1', '1', '[\"https://yanxuan.nosdn.127.net/9e0e131d1c9ac1694a4a21d95f10d13c.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('409', '1019000', '0', '不错', '1', '1', '[\"https://yanxuan.nosdn.127.net/f878ae2a2c8950d11d35fcf93115968d.jpg\", \"https://yanxuan.nosdn.127.net/bc5fd9cf526fd74cec4ac931369dc9b4.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('410', '1019000', '0', '买给婆婆用的，评价非常好', '1', '1', '[\"https://yanxuan.nosdn.127.net/110d61a1bb10ab2c1273859589e06aaa.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('411', '1019000', '0', '没味道，不过没想象中软，用一段时间再看。', '1', '1', '[\"https://yanxuan.nosdn.127.net/a76de192aa1df77f12336275abc705a9.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('412', '1019000', '0', '回弹不错，手感很好，柔软厚实', '1', '1', '[\"https://yanxuan.nosdn.127.net/0fbb7573e64ebf5db125401fb129403d.jpg\", \"https://yanxuan.nosdn.127.net/f56dcadfa362b6e53239ebc91753aba8.jpg\", \"https://yanxuan.nosdn.127.net/bed16cde08d5035a14bc2cb2fab9376b.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('413', '1019000', '0', '非常好，枕着很舒服', '1', '1', '[\"https://yanxuan.nosdn.127.net/c634bca55395e106ed9d9e73f15e2b23.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('414', '1019000', '0', '物美价廉，性价比杠杠的。其实我是限时抢购的', '1', '1', '[\"https://yanxuan.nosdn.127.net/4d74146663ff6bf900ad47f1843bf451.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('415', '1019000', '0', '不错', '1', '1', '[\"https://yanxuan.nosdn.127.net/04ede9f5591458715b3cf4013edf5239.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('416', '1019000', '0', '有一点点味道，要晒几天吧，不敢直接枕', '1', '1', '[\"https://yanxuan.nosdn.127.net/20842408304e34045e2c5c95d98657da.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('417', '1019000', '0', '买了一对，制作得比较精良。', '1', '1', '[\"https://yanxuan.nosdn.127.net/efa79ae21d5235c277d6e2b14eb67d76.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('418', '1019000', '0', '不错', '1', '1', '[\"https://yanxuan.nosdn.127.net/70318a0f18f00cc63294f4d0f865c1a0.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('419', '1019000', '0', '使用了几点已经适应了，弹力适中，快速回弹。', '1', '1', '[\"https://yanxuan.nosdn.127.net/154652fd3dfbe7ad2d1414f280518be9.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('420', '1019000', '0', '一直再在用很棒', '1', '1', '[\"https://yanxuan.nosdn.127.net/143711134f3cb97409ddcd1e19d67956.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('421', '1019001', '0', '特意用了很长时间才来评价的，枕头不错，刚开始不太习惯，用了一段时间，感觉挺不错，再也没有落枕过，脖子也挺舒服的。', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('422', '1019001', '0', '不错，很舒服，昨天晚上开始试用，睡的挺好的', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('423', '1019001', '0', '买回来就迫不及待试了试，果然超级舒服。就是稍稍有点味道。总体来说还是很好的', '1', '1', '[\"https://yanxuan.nosdn.127.net/40e4859453a6cfaa129fbb740f335cc7.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('424', '1019001', '0', '自从买了记忆枕，睡觉再也不会落枕了就是短了些，如果能做成一般枕头的长度就好了', '1', '1', '[\"https://yanxuan.nosdn.127.net/46e9a8a98f52712c49871e60d706d79c.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('425', '1019001', '0', '这个价位的品质比卖场的好多了，手感和回弹确实理想，赶着限时购抢了两个。', '1', '1', '[\"https://yanxuan.nosdn.127.net/d6c2b3a13609142f36bb8f58984e82e6.jpg\", \"https://yanxuan.nosdn.127.net/e343c8d89cea3e513b0335e8adcddb65.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('426', '1019001', '0', '挺舒服的，虽然对我来说有点点高，但是因为弹力好，并没有不适的感觉。之前总是落枕，这次醒来，颈部还挺舒服。', '1', '1', '[\"https://yanxuan.nosdn.127.net/c9da1feb565f8d0aa7c7fb2804b700f1.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('427', '1019001', '0', '绿茶真的是不错，味道很正。\n枕头很舒服，就是白色不耐脏，套个枕套。', '1', '1', '[\"https://yanxuan.nosdn.127.net/de21e4f108b4802ae9c0c29fe93ef606.jpg\", \"https://yanxuan.nosdn.127.net/1e5877efb64d03264d86fd7cecf5a16b.jpg\", \"https://yanxuan.nosdn.127.net/433a70e334bcc9b42aa9dd6e37ae5223.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('428', '1019001', '0', '略微有点硬，不过睡着挺舒服，侧卧很爽，要是再有枕套就好了', '1', '1', '[\"https://yanxuan.nosdn.127.net/d6f4939f66356b71139914724d99378d.jpg\", \"https://yanxuan.nosdn.127.net/1fff5064bd1c6a9663a2e78e49e0b2fa.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('429', '1019001', '0', '第二次买了，之前买了一个很舒服。不过上次是压缩包装的，这次没压缩。', '1', '1', '[\"https://yanxuan.nosdn.127.net/deaac3830cc1b39f4036aad11481911d.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('430', '1019001', '0', '挺好的～收到货了，拆开也没发现有味道，可能是个别的吧，挺舒服的', '1', '1', '[\"https://yanxuan.nosdn.127.net/fabdf1c9e3502a4a7880ab62234c4b08.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('431', '1019001', '0', '使用三晚，睡眠品質明顯改善，頭頸獲得很好的支撐，左右護頸有效加分，會推薦給朋友', '1', '1', '[\"https://yanxuan.nosdn.127.net/b88cfd6f084f637f3c384282b377693f.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('432', '1019001', '0', '不错', '1', '1', '[\"https://yanxuan.nosdn.127.net/39827391676935a0b5b438063217e650.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('433', '1019001', '0', '高颜值枕头，很舒服，让我每天睡好觉', '1', '1', '[\"https://yanxuan.nosdn.127.net/2def98a9ebeb2ab21928ef22de8969e9.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('434', '1019001', '0', '我很满意 枕头很松软 喜欢严选的简约和高质量', '1', '1', '[\"https://yanxuan.nosdn.127.net/dc4abe070c7d90fa1567b5a102259445.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('435', '1019001', '0', '非常不错的东西，以后购物就严选了，大家快点买吧！', '1', '1', '[\"https://yanxuan.nosdn.127.net/46de2bb73159a6d39e2486aba890b43e.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('436', '1019001', '0', '枕头的软硬程度刚好是我喜欢的，开始枕的时候觉得高了点，现在习惯了也挺好，睡在上面脖子很舒服。', '1', '1', '[\"https://yanxuan.nosdn.127.net/38519811d2a30ef63cd9a5347ec1d21f.jpg\", \"https://yanxuan.nosdn.127.net/d01f3c7c39febd471ce3051097ddffed.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('437', '1019001', '0', '不错', '1', '1', '[\"https://yanxuan.nosdn.127.net/6b8f525cf1190b213c75b3c041724f98.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('438', '1019001', '0', '超级好，还可以呀，，爸妈很喜欢', '1', '1', '[\"https://yanxuan.nosdn.127.net/1be7ecf2c80c3e1d5ed273fc4a6b1d05.jpg\", \"https://yanxuan.nosdn.127.net/3781e0e8f999e6ffaebd116a63b092e4.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('439', '1019001', '0', '给爸妈买的。很棒', '1', '1', '[\"https://yanxuan.nosdn.127.net/89b164312caa1ab479d4d4776754d64f.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('440', '1019001', '0', '符合人体工学，柔软回弹好，睡眠好伴侣', '1', '1', '[\"https://yanxuan.nosdn.127.net/8387a4c36cf221875e442ff79ee8e2d7.jpg\", \"https://yanxuan.nosdn.127.net/668a9e7d80a55d6182b1fa831bd7ca10.jpg\", \"https://yanxuan.nosdn.127.net/a244df8022193c5dcf240c509349af39.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('441', '1019001', '0', '晚上试试', '1', '1', '[\"https://yanxuan.nosdn.127.net/9fa9b008ee0cd8ca7d0cb8d5a374a3f9.jpg\", \"https://yanxuan.nosdn.127.net/a740874a93fb86758e9bfc6ce5edcc07.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('442', '1019001', '0', '好用，和老公一人一个。', '1', '1', '[\"https://yanxuan.nosdn.127.net/2fc64ae459ba627b350058cd2a9fcd9a.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('443', '1019001', '0', '手感不错，后续追评', '1', '1', '[\"https://yanxuan.nosdn.127.net/d5c64c787daf196c781ce89c212161de.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('444', '1019001', '0', '开始觉得挺高的。枕上去发现刚好。回弹比较快 。没有味道。包装挺好。唯一的缺点就是我觉得太小了 感觉一转就枕不到了', '1', '1', '[\"https://yanxuan.nosdn.127.net/f88dc1f34457cd746bf69d56f9007864.jpg\", \"https://yanxuan.nosdn.127.net/d1869783fac3c7ba1eb25cbd79c7d8fb.jpg\", \"https://yanxuan.nosdn.127.net/5ba061e6048ff7cf3ffc86c736b73fe7.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('445', '1019001', '0', '我对产品的要求是很高,的，枕头手感很好', '1', '1', '[\"https://yanxuan.nosdn.127.net/351d16f83bbc87c7e95a730d5a939f0b.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('446', '1019001', '0', '严选夸张的包装，我就不上图了，总之就是高端大气上档次！说说感受1.软硬适中，比mengjie的一款100多的枕头硬一些，和luolai的一款枕头差不多�', '1', '1', '[\"http://yanxuan.nosdn.127.net/8c57c950d9ffb76b895b80a7fe1acab7.jpg\", \"http://yanxuan.nosdn.127.net/ab9303135e7a016c4d06129e44075d37.jpg\", \"http://yanxuan.nosdn.127.net/b4c0519875ccf2927f53027b603644a8.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('447', '1019001', '0', '放在1.5米床上正合适，1.8的床枕头会显小，但枕着是蛮舒服的。', '1', '1', '[\"http://yanxuan.nosdn.127.net/c47fef50da78c59ae95e40c4a602e5fc.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('448', '1019001', '0', '没感觉很保护颈椎, 反而睡久了会酸疼.', '1', '1', '[\"http://yanxuan.nosdn.127.net/eab951dd532a3f2e05fb707e2e9895c7.jpg\", \"http://yanxuan.nosdn.127.net/efb925c430e3983e289a6b93cb41e0df.jpg\", \"http://yanxuan.nosdn.127.net/c417161df96586b583f99958cb572a42.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('449', '1019001', '0', '手感很好，记忆能力也很强。味道是有一点，但不致于很浓烈，拿到阳台上晒一下，看看会不会好很多。', '1', '1', '[\"https://yanxuan.nosdn.127.net/19e929005c199443ee3a16c011941670.jpg\", \"https://yanxuan.nosdn.127.net/431da993fcc0eb5b4f769b1fe732d7e1.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('450', '1019001', '0', '看着还不错，没有什么味道。三星半。', '1', '1', '[\"https://yanxuan.nosdn.127.net/3809b558a500ff7f003dae2bf1c24d01.jpg\", \"https://yanxuan.nosdn.127.net/f8d0f0c1d7d06cbb6eb4186ae4e01ac8.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('451', '1019002', '0', '很舒适，很宽大，回弹效果算是过得去吧。', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('452', '1019002', '0', '京东plus会员，现在对严选也很喜欢，节省了挑选东西的时间，喜欢的话可以放心下单。好的生活，没那么贵。', '1', '1', '[\"https://yanxuan.nosdn.127.net/920e65862ada7abdc90a557bb52bb5a9.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('453', '1019002', '0', '包装太好了，物流也很快，枕头很好用，高度合适，好评！', '1', '1', '[\"https://yanxuan.nosdn.127.net/2b605f9207ed20a204657239b7e3aa54.jpg\", \"https://yanxuan.nosdn.127.net/0537d635b0681d808a49c938eb1e5bd0.jpg\", \"https://yanxuan.nosdn.127.net/3fc181758d5f01eec774fee18eb504cf.jpg\", \"https://yanxuan.nosdn.127.net/f49797d3383f97f5943e625c1f0f1d91.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('454', '1019002', '0', '非常的舒适，男盆友一直让我上淘宝买双人枕头，刚好在严选上看到，199觉得好贵！但是一看淘宝也是这个价格！但是严选有5.1减价券嘻嘻嘻嘻', '1', '1', '[\"https://yanxuan.nosdn.127.net/df6d961b8b7fb26fae2e88535de262c6.jpg\", \"https://yanxuan.nosdn.127.net/89fb73ced773b39fab4082c11ab58673.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('455', '1019002', '0', '双人枕头，收拾方便一点哈！枕着也舒服哈！', '1', '1', '[\"https://yanxuan.nosdn.127.net/7498e2940b28af120cd0ec92a0c66638.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('456', '1019002', '0', '特别好', '1', '1', '[\"https://yanxuan.nosdn.127.net/dd77d62b07a89101bc5a0a1ebc6957cc.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('457', '1019002', '0', '昨天中午下的单，今天早上就到了，枕头质量很好，赞^_^', '1', '1', '[\"https://yanxuan.nosdn.127.net/376436f6099e0fa98a7f9ec27af993cb.jpg\", \"https://yanxuan.nosdn.127.net/e0986515721ad7aba8a4788c1eed0a02.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('458', '1019002', '0', '性价比高！舒服！', '1', '1', '[\"https://yanxuan.nosdn.127.net/f407f00c3a782907f3bd947597f1ea4b.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('459', '1019002', '0', '东西质感不错', '1', '1', '[\"https://yanxuan.nosdn.127.net/3cfd42b6bbb132b7c28b169711bd4a18.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('460', '1019002', '0', '看着很好，顺丰也很快', '1', '1', '[\"https://yanxuan.nosdn.127.net/e00891ae79fe658b8e3de2917205015f.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('461', '1019002', '0', '散散味', '1', '1', '[\"https://yanxuan.nosdn.127.net/1e22290cbe14a2e98441939baab3cf58.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('462', '1019002', '0', '包装好，物流好，味道大，得放几天。质量好。外面得套个枕套。赠送的连裤袜两双。', '1', '1', '[\"https://yanxuan.nosdn.127.net/2a68e9bbc4d675c1bd723a5338a82528.jpg\", \"https://yanxuan.nosdn.127.net/a0cb6796e54659385946120e430dae59.jpg\", \"https://yanxuan.nosdn.127.net/4392e767d216022e5359b7709a5ae3b9.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('463', '1019002', '0', '枕头不错，很舒服', '1', '1', '[\"https://yanxuan.nosdn.127.net/05d02da308e3989c9fca0d5f4896a72b.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('464', '1019002', '0', '很满意', '1', '1', '[\"https://yanxuan.nosdn.127.net/0c5620ccad56f071205697e37885fd62.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('465', '1019002', '0', '妈妈很满意~', '1', '1', '[\"https://yanxuan.nosdn.127.net/061ae0703caf5ebadccc08eea088fdf8.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('466', '1019002', '0', '非常舒服，非常好，再买一个，哈哈哈', '1', '1', '[\"https://yanxuan.nosdn.127.net/bd13195748611dd22bba00b6a194f980.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('467', '1019002', '0', '感恩节给老爸老妈买的，看着很好，摸着也舒服，希望他们睡个好觉。', '1', '1', '[\"http://yanxuan.nosdn.127.net/d51d8ca125798583b4c317d4918b8e0a.jpg\", \"http://yanxuan.nosdn.127.net/635d93871385e2fc2c6fc6eee1f8c383.jpg\", \"http://yanxuan.nosdn.127.net/5cc284cb123784f42d8ffeb342ac0e08.jpg\", \"http://yanxuan.nosdn.127.net/9c4ecd1c979ea4c518dd013bee05b711.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('468', '1019002', '0', '这款枕头确实也是我买过睡的比较舒服的一款！大小高低合适，脖子不累！弹性好！特别适合双人！', '1', '1', '[\"http://yanxuan.nosdn.127.net/bfa855a97f4c260766d2d949f5a4623f.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('469', '1019002', '0', '慢慢的诚意，好旧没看到这样的双层包装，已经把app推荐给朋友', '1', '1', '[\"https://yanxuan.nosdn.127.net/adeb8c4ce257ce5ed8b42ad926bf2f39.jpg\", \"https://yanxuan.nosdn.127.net/f3cbccb526b8bfe70f19fd8dc6474cac.jpg\", \"https://yanxuan.nosdn.127.net/edfe4f2f59733f47420044ec803d3511.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('470', '1019002', '0', '很好', '1', '1', '[\"https://yanxuan.nosdn.127.net/9c5d81d2e894be9a2edf15e4ffce5c86.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('471', '1019002', '0', '论包装我只服严选。论快递我只服顺丰！看商品，究竟是枕头太长还是人太矮呢！赶紧入手验证吧亲们。。。', '1', '1', '[\"https://yanxuan.nosdn.127.net/55eda2d46e781602fe1732ab087dd6ec.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('472', '1019002', '0', '网易的包装太好了，我觉得完全可以回收，如果产品再丰富点就好了，枕头还可以，我喜欢睡低，', '1', '1', '[\"http://yanxuan.nosdn.127.net/ac7f99a0d6ed0630595896754d22ecaa.jpg\", \"http://yanxuan.nosdn.127.net/6c2c98716fc61299d19be8d1484f95e2.jpg\", \"http://yanxuan.nosdn.127.net/a755022c0d6fe33716aea91aad8eb752.jpg\", \"http://yanxuan.nosdn.127.net/729e5d7f1424d8b43873f7fa33d1ad6d.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('473', '1019002', '0', '严选品质没的说，物流也快', '1', '1', '[\"https://yanxuan.nosdn.127.net/aca9c69d3b7c13312dbd3a37509b51c3.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('474', '1019002', '0', '不错很棒！睡着很舒服！', '1', '1', '[\"https://yanxuan.nosdn.127.net/84d494d5b7f0c28a326c8092ee1a55ea.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('475', '1019002', '0', '飞机盒+礼品盒，包装很到位，快递是顺丰。看评论说枕着舒服买来试试，枕高的一头刚刚好', '1', '1', '[\"http://yanxuan.nosdn.127.net/f54ba5cceada35bd0afc275760ebbac0.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('476', '1019002', '0', '不错', '1', '1', '[\"https://yanxuan.nosdn.127.net/f2bded32842321014e42237e44e354f8.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('477', '1019002', '0', '枕头不错，家里人都说质量可以价格便宜。最好有附带枕头套卖最好。', '1', '1', '[\"http://yanxuan.nosdn.127.net/e6ba6f9d97f304ca62d417fec4a3fbde.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('478', '1019002', '0', '妈妈给好评！她颈椎不好，说用了这款枕头非常舒服', '1', '1', '[\"https://yanxuan.nosdn.127.net/ba5d1d8c134420dc12044b34f5124f7b.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('479', '1019002', '0', '很不错', '1', '1', '[\"https://yanxuan.nosdn.127.net/c5af0a8d29ab91608dc382026cf28b7f.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('480', '1019002', '0', '很好，很满意', '1', '1', '[\"https://yanxuan.nosdn.127.net/3248f4e4255c42604a0434417c086831.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('481', '1019006', '0', '好用！特别舒服！', '1', '1', '[\"https://yanxuan.nosdn.127.net/3743c2d0fb230661399466105afb5d7a.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('482', '1019006', '0', '还不错哦~~~很舒服，很大', '1', '1', '[\"http://yanxuan.nosdn.127.net/62c27ea54e33932e563afeec1c476241.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('483', '1019006', '0', '下单后到货及时，感谢！\n尚未使用，使用后再追加评价✺◟(∗❛ัᴗ❛ั∗)◞✺', '1', '1', '[\"https://yanxuan.nosdn.127.net/1754d66ddacaa93156bfe018a46d3762.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('484', '1019006', '0', '到货速度很快，手感也很好，非常不错，气味问起来像中药，感觉很好！用一段时间后再来评价…', '1', '1', '[\"https://yanxuan.nosdn.127.net/244f35238f3e8a49444d51f71faf6e62.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('485', '1019006', '0', '快递挺迅速的 东西也很满意 用一段时间再来评价效果吧', '1', '1', '[\"https://yanxuan.nosdn.127.net/c57a8dc16113bd7c01a3d707cb97f7db.jpg\", \"https://yanxuan.nosdn.127.net/d5afdb995c94d703f890237c92e7c2bc.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('486', '1019006', '0', '还没用，不过手工不错，应该很好用。', '1', '1', '[\"https://yanxuan.nosdn.127.net/7b4d2e62598b06a44588bd522f3da4d8.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('487', '1019006', '0', '第一次在严选购物，很满意。', '1', '1', '[\"https://yanxuan.nosdn.127.net/2ea24ad589d12d7ad7764069000436f9.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('488', '1019006', '0', '很快到了，还没用', '1', '1', '[\"https://yanxuan.nosdn.127.net/cffd147b1f0565d02b985f79ccf25636.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('489', '1019006', '0', '枕头很大，睡起来也很舒服，是个好东西。外观也很美。', '1', '1', '[\"http://yanxuan.nosdn.127.net/cd1ae96536d55fcafb5d3707c0a3479e.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('490', '1019006', '0', '看到实物感觉不错，物流挺快的，还没有使用，期待效果，相信网易逼格高。', '1', '1', '[\"http://yanxuan.nosdn.127.net/8a339c4213d38c26e7434d904b7ef44e.jpg\", \"http://yanxuan.nosdn.127.net/0987c789450e8578e8771182cc4f8b74.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('491', '1019006', '0', '已经枕上了，还不错，正好适合我的高度，太赞了', '1', '1', '[\"http://yanxuan.nosdn.127.net/e121edd11baa997bf99ce28ecd9c57d1.jpg\", \"http://yanxuan.nosdn.127.net/73a22cd09dcce6c143bf13ed2d87f411.jpg\", \"http://yanxuan.nosdn.127.net/666d89f0b2f8082b853bcc85b05f80f8.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('492', '1019006', '0', '做工精美，功能性佳，改进睡眠品质，真是物有所值', '1', '1', '[\"http://yanxuan.nosdn.127.net/3295e86831e58a547c9d02af398ebdf2.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('493', '1019006', '0', '小枕头很好', '1', '1', '[\"http://yanxuan.nosdn.127.net/d501148d4be2683fc216f4820587aa19.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('494', '1019006', '0', '睡眠效果不错，但 发票寄送很慢，不满意', '1', '1', '[\"http://yanxuan.nosdn.127.net/38173cfe72e6a3c7399fd9bce2b1a508.jpg\", \"http://yanxuan.nosdn.127.net/6c1c7dcdcb8a3d67c46859b81fcd54fb.jpg\", \"http://yanxuan.nosdn.127.net/4975a8cd6eaeccb64104190cebe83fef.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('495', '1019006', '0', '本来买去宿舍用的 谁知道对于一米五的床已经这么大了 我们家居然没有合适的枕头套 最后还是把这个枕头套的边缘拆了才合适 总的来说很满意 ', '1', '1', '[\"http://yanxuan.nosdn.127.net/849ce52f9c5eb124a4e309b04f8ad455.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('496', '1019006', '0', '包装严密 枕头不错 是最满意的', '1', '1', '[\"http://yanxuan.nosdn.127.net/720c372249378c53e24d952c8e4b371d.jpg\", \"http://yanxuan.nosdn.127.net/ce7617ebaca5705074401054626025e1.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('497', '1019006', '0', '果然没有让我失望。网易的东西都是我一直很喜欢的，良心产品。枕头很舒服、软硬度和厚度都很合适。', '1', '1', '[\"http://yanxuan.nosdn.127.net/faea0a3bdf26a4976b9944979a0aac5e.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('498', '1019006', '0', '不错，好低合适还可以调节。质优价廉', '1', '1', '[\"http://yanxuan.nosdn.127.net/2208450720dd7bf51abacc8ac5d751ff.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('499', '1019006', '0', '还没真实使用，看起来挺大。', '1', '1', '[\"http://yanxuan.nosdn.127.net/e6c3665c5b5cf77f306ad470473f63f9.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('500', '1019006', '0', '果然没有让我失望。网易的东西都是我一直很喜欢的，良心产品。枕头很舒服、软硬度和厚度都很合适。支持严选。', '1', '1', '[\"http://yanxuan.nosdn.127.net/3d30bd75af0cf2e5bca67650c85dc72c.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('501', '1019006', '0', '朋友推荐的APP 价钱不贵 睡着也很舒服 以后会常来严选', '1', '1', '[\"http://yanxuan.nosdn.127.net/e424bc35c6e4eb4d31b58e06c4ff95f8.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('502', '1019006', '0', '东西很好，很大，物流略慢，给妈妈买的枕头，希望妈妈枕着这个枕头每晚都能睡好觉，支持网易严选，还会再来购物的，会推荐给朋友们好的�', '1', '1', '[\"http://yanxuan.nosdn.127.net/b12ac1dea50b7293bfbd23957508fb17.jpg\", \"http://yanxuan.nosdn.127.net/1ce39f5f3618a0298ddbb8a02eda63ef.jpg\", \"http://yanxuan.nosdn.127.net/319bb56d8b76ed9dac75a0264b7332b4.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('503', '1019006', '0', '枕头高度正好 非常舒服 一觉到天亮', '1', '1', '[\"http://yanxuan.nosdn.127.net/1ee3507c19892c726bf817fdf4d808a8.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('504', '1019006', '0', '枕头非常好，两年买了无数的枕头，这是唯一一个用的觉得特别好的，要换枕头的时候肯定会回购', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('505', '1019006', '0', '软软的睡着挺舒服，严选质量不用说，就是中间有点小，滚来滚去总枕不到。', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('506', '1019006', '0', '买了一堆东西，手工皂是送的，然后为了这个手工皂，我又买了皂托，买皂托的时候顺便买了袜子。', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('507', '1019006', '0', '我感觉一般，没觉得睡了和一般通俗的枕头有什么区别。护颈没多好，反而还没平常的那种舒服。', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('508', '1019006', '0', '抽了一个垫子出来用着很舒服，严选的东西，买着有瘾。品质好，真的不错。', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('509', '1019006', '0', '高度合适，而且质量超级棒，对于我这么爱碎觉且挑剔枕头的人来说，真的好棒~', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('510', '1019006', '0', '我和严选的故事，从一个很好的枕头开始，每个疲惫的夜，我们一起相伴度过……', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('511', '1020000', '0', '靠垫很赞。我在沙发拿来当枕头，也挺舒服的。hhh', '1', '1', '[\"https://yanxuan.nosdn.127.net/c9c5b3f9928980e9c9005e90fa569efb.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('512', '1020000', '0', '选择网易严选没选择错，东西很软，有回弹，靠着很舒服，我个人偏向喜欢硬一些的，这个偏软，但是也很好啦。包装还有快递都没得说，必须�', '1', '1', '[\"https://yanxuan.nosdn.127.net/06d74a02957e20cedca8c809a42d7114.jpg\", \"https://yanxuan.nosdn.127.net/373992f52f275ffc7eafcc7104a2b310.jpg\", \"https://yanxuan.nosdn.127.net/2bb835d88a0869ab3ef71eb823c0ca6f.jpg\", \"https://yanxuan.nosdn.127.net/2524c9e01b537f6f47f775d6aef36af4.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('513', '1020000', '0', '正合适，很舒服，上班终于不再难熬', '1', '1', '[\"https://yanxuan.nosdn.127.net/809fa35edcaae9a3c0b603e4f4418bef.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('514', '1020000', '0', '靠在腰间，舒服，上班久坐不酸。现在想买写可靠有品质的东西都上严选', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('515', '1020000', '0', '绝对舒服，办公室腰靠。贴心的记忆力。', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('516', '1020000', '0', '好用，有缓解一点腰酸', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('517', '1020000', '0', '简直不能太舒服，开车太实用了', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('518', '1020000', '0', '这个真的超级好用！完美解决了开车时腰部酸痛的问题，好评！以后准备再买来办公的时候用～', '1', '1', '[\"https://yanxuan.nosdn.127.net/ce1c368ebff8ab2c7b8bc93cb04942ef.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('519', '1020000', '0', '包装的很精致，我很喜欢，没有想象中的大，但东西感觉很好。明天带到办公室试一下。应该会不错。', '1', '1', '[\"https://yanxuan.nosdn.127.net/7c750b62d6fb0c0f0783b5b87b346c4c.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('520', '1020000', '0', '和描述说的一样的确有点气味，得晾几天。没有想象中的硬，觉得偏软，像枕头一样', '1', '1', '[\"https://yanxuan.nosdn.127.net/f121df81266b5ead7cebc1631877ace6.jpg\", \"https://yanxuan.nosdn.127.net/5a22c27871fad83331c162755d0d1470.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('521', '1020000', '0', '一直想买个腰靠，终于在严选下手了，大小合适，软硬也适中，包装袋尤其惊喜，软软的，还可以拿来装装别的东西', '1', '1', '[\"https://yanxuan.nosdn.127.net/550e8928c05388e5b2a5b01283702fd8.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('522', '1020000', '0', '体验了一上午，咋说呢，如果再大一点儿就好了，可以照顾到腰部以上的位置，不过还是挺软乎的。', '1', '1', '[\"https://yanxuan.nosdn.127.net/4fffdb82fa6ab43a6365c2029f6df519.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('523', '1020000', '0', '放办公室椅子上，一直在用，挺好，做工质量不错，价格合适。还没形成习惯，过了这么久再次来关注严选，希望多多有活动。', '1', '1', '[\"https://yanxuan.nosdn.127.net/34cdf7cb9c69a64fde058e68ca7982d2.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('524', '1020000', '0', '还不错   慢回弹的那种   材质很舒服颜色特别满意   淡粉不骚', '1', '1', '[\"https://yanxuan.nosdn.127.net/8bf5549a93222415180503e0016cdded.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('525', '1020000', '0', '真的特别好用！买的第二个腰靠，之前买的放在车上，后来又买了一个打算放在办公室用～做工很好，能完美的支撑起腰部～', '1', '1', '[\"https://yanxuan.nosdn.127.net/8dc64013c5f2415d552975293b7ec31f.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('526', '1020000', '0', '比较软 但是放在椅子上还是觉得一个不够 这个感觉价格还是有点贵', '1', '1', '[\"https://yanxuan.nosdn.127.net/1356367de183000f92789cb0cc1bd242.jpg\", \"https://yanxuan.nosdn.127.net/1e7a72baa7fee3723c0fb489161eda58.jpg\", \"https://yanxuan.nosdn.127.net/49678012c43a0c3537c4cd35b35471d1.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('527', '1020000', '0', '很软  放在椅子上很舒适  就是容易压的很扁…', '1', '1', '[\"https://yanxuan.nosdn.127.net/94ec44fd7daea95d46f184ad3bb8a68a.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('528', '1020000', '0', '超级棒啊 办公室必备… 可调节带子伸缩性很强 在严选买东西从没失望过', '1', '1', '[\"https://yanxuan.nosdn.127.net/28d2de003efe4566a9bd1de3cd45b4f5.jpg\", \"https://yanxuan.nosdn.127.net/82c3cab9b69f61bcd50e5fbab3aa5baf.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('529', '1020000', '0', '蛮好的，希望时间久了不会压下去就不能恢复了……', '1', '1', '[\"https://yanxuan.nosdn.127.net/62fc3fa5cb0a0185277a1e0b53fb0b34.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('530', '1020000', '0', '这个组合不错吧，坐垫比靠垫缓释要好。', '1', '1', '[\"https://yanxuan.nosdn.127.net/9fe8daa5581acff11096306b9607bb82.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('531', '1020000', '0', '垫了之后很舒服，弹性也不错', '1', '1', '[\"https://yanxuan.nosdn.127.net/fb29b948cae39766c37fa3aa4f164d58.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('532', '1020000', '0', '挺软乎的，不错。是记忆棉，可以恢复。', '1', '1', '[\"https://yanxuan.nosdn.127.net/dabf8a152140604c8c033549f408e324.jpg\", \"https://yanxuan.nosdn.127.net/d404e0e3edf0eae7e80f12c6372bce94.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('533', '1020000', '0', '公司的意思很难受 放了它腰舒服很多', '1', '1', '[\"https://yanxuan.nosdn.127.net/49fbf82054a53d7a6176fc793ff57917.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('534', '1020000', '0', '好的生活，没那么贵', '1', '1', '[\"http://yanxuan.nosdn.127.net/37334e62e1c8b53562768522bcbcc13f.png\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('535', '1020000', '0', '希望放放就没气味了', '1', '1', '[\"https://yanxuan.nosdn.127.net/f1d1f25800dd4e7a1406f18708c56950.jpg\", \"https://yanxuan.nosdn.127.net/162c475af76421c5bd4848cbbd29efaa.jpg\", \"https://yanxuan.nosdn.127.net/5498420b755644f1bd275152dd6716cf.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('536', '1020000', '0', '大小正好，放办公室用。', '1', '1', '[\"https://yanxuan.nosdn.127.net/4a354c99b743c91063f8f6cbc213220e.jpg\", \"https://yanxuan.nosdn.127.net/f4d1aae3a27fc895fbdfe2598451e06f.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('537', '1020000', '0', '非常舒服 还是很不错的', '1', '1', '[\"https://yanxuan.nosdn.127.net/fc6844a7331ac8b7b07ae78e803a7d45.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('538', '1020000', '0', '已经买了两个，办公室必备', '1', '1', '[\"https://yanxuan.nosdn.127.net/b56a20b9a282747a1047933e25ed94e9.jpg\", \"https://yanxuan.nosdn.127.net/e81787ee465b0804e1f320899d9bea6c.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('539', '1020000', '0', '固定的带子如果固定起来就会翘，所以没固定，这个支撑角度应该可以的', '1', '1', '[\"https://yanxuan.nosdn.127.net/bc8ccb8692e92a75c6dfe71664510830.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('540', '1020000', '0', '很舒服，坐着终于不再是一种煎熬', '1', '1', '[\"https://yanxuan.nosdn.127.net/9919d565b801e84addd8f68f44b61050.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('541', '1021004', '0', '超喜欢 摸着柔柔软软的赶脚 这个季节马上就可以单独改了 柔肤滑腻', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('542', '1021004', '0', '包装完整～毯子很薄～触感很棒不扎人～一个人很够用', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('543', '1021004', '0', '细腻，手感好。不错', '1', '1', '[\"https://yanxuan.nosdn.127.net/95c04489fe537931d46712efe33150b2.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('544', '1021004', '0', '摸起来手感不错，柔软，盖着也舒适。但是染色在边上没染到，有一条边。严选还号称质量把关呢，有点怀疑。', '1', '1', '[\"https://yanxuan.nosdn.127.net/a161e2f52440acf5a3020b18b46cc8b1.jpg\", \"https://yanxuan.nosdn.127.net/ec0a51ff14b0a8643868f98e10c5fa4c.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('545', '1021004', '0', '盖毯很大一块，摸起来也很舒服，比想象中的好多了，赞赞赞，好开心', '1', '1', '[\"https://yanxuan.nosdn.127.net/d62c8e52b81ad641e840be162c4deeb4.jpg\", \"https://yanxuan.nosdn.127.net/3cf1977b037354dd9135b2924f01807e.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('546', '1021004', '0', '严选里面，认为最赞的货品，特别适合女生，白天可以当披肩，晚上可以搭被子上更暖和，穿裙子睡衣时候可以搭一下保暖，质量感觉也很棒，�', '1', '1', '[\"https://yanxuan.nosdn.127.net/458788add98d177564744c1e64805aa6.jpg\", \"https://yanxuan.nosdn.127.net/ec32609a76df38733f1352b8279c19e1.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('547', '1021004', '0', '轻柔舒适手感佳，沙发上待着就靠它', '1', '1', '[\"https://yanxuan.nosdn.127.net/09e6f7935abe6919fbb85c045453d649.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('548', '1021004', '0', '非常棒的毛毯，手感细腻柔软，喜欢', '1', '1', '[\"https://yanxuan.nosdn.127.net/97f82258d18ecb3bf33e13c8d1264522.jpg\", \"https://yanxuan.nosdn.127.net/9b1c323751b77840d8e01f82f10c7a3f.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('549', '1021004', '0', '有点薄，不过很软摸着挺舒服，因为羊毛絮絮有点多', '1', '1', '[\"https://yanxuan.nosdn.127.net/dd235ed4c86af50dfffb08a11ee1b6d3.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('550', '1021004', '0', '这个毯子很赞 很舒服也很保暖 又入了一条姜黄色 羊毛毯难免有些扎 不贴身就好了', '1', '1', '[\"http://yanxuan.nosdn.127.net/e5bad28ebdf9a355d38fbc5e55865b55.jpg\", \"http://yanxuan.nosdn.127.net/0dfcd3a55f00b6dcdce1e4bbb28b5981.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('551', '1021004', '0', '料子很不错，手感很好，挺舒服的，就是感觉有点薄。', '1', '1', '[\"https://yanxuan.nosdn.127.net/a8d700cb145afb5238c59fadb917ecf2.jpg\", \"https://yanxuan.nosdn.127.net/1c07b35ae6d1211045289944c9062b1f.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('552', '1021004', '0', '宝贝质量好，货正价实！', '1', '1', '[\"http://yanxuan.nosdn.127.net/171da27ecbbc4ad321f94d6e08a6cd9e.png\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('553', '1021004', '0', '宝贝质量优质，与描述完全一致，值得购买！', '1', '1', '[\"http://yanxuan.nosdn.127.net/7b08d1772f9a8bf6b69e0d360c562396.png\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('554', '1021004', '0', '好喜欢', '1', '1', '[\"https://yanxuan.nosdn.127.net/99501eb64c85b80f8441bb29c7e0404d.jpg\", \"https://yanxuan.nosdn.127.net/611b91b36cdf83550e8ff51519b70b71.jpg\", \"https://yanxuan.nosdn.127.net/3b5f7c7979f28313a9ed0b4c2e9d0935.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('555', '1021004', '0', '容易起球，较薄', '1', '1', '[\"https://yanxuan.nosdn.127.net/1680a1a0d0f15461b45c7c7ddb0e286e.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('556', '1021004', '0', '非常满意这条盖毯，几乎可以当作毛毯来用，因为首先真的好大张，第二很厚实，折起来相当重，本来想当披肩，试了下可以把整个人裹起来了�', '1', '1', '[\"https://yanxuan.nosdn.127.net/58a4c9453b58c42961f84c668571a7ed.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('557', '1021004', '0', '手感不错，很喜欢！', '1', '1', '[\"http://yanxuan.nosdn.127.net/b7350262c6e28c90629e62c94371c35b.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('558', '1021004', '0', '超级棒 有质感～提升床品逼格的利器', '1', '1', '[\"http://yanxuan.nosdn.127.net/8547f26652a6c2059b4e0a246a16209b.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('559', '1021004', '0', '柔软细腻，是第一反应，降温后盖在腿上，非常舒服', '1', '1', '[\"http://yanxuan.nosdn.127.net/c98335cc4cb2411d90e7a0b806412383.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('560', '1021004', '0', '刚收到货，包装讲究，看上去不错，双十一三天到的货。', '1', '1', '[\"http://yanxuan.nosdn.127.net/35e36e81f65499831b278b57909c23a5.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('561', '1021004', '0', '用来送礼，做生日礼物，都很爱', '1', '1', '[\"http://yanxuan.nosdn.127.net/1d269667e4726de78e50ab31eadb6195.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('562', '1021004', '0', '手感不错 颜色很适合冬天', '1', '1', '[\"http://yanxuan.nosdn.127.net/2165d24376b3601a69fa527363ead10e.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('563', '1021004', '0', '满意，相信严选，质量非常好。', '1', '1', '[\"http://yanxuan.nosdn.127.net/e8fd89a7508fc53b83b7fba07e809a48.jpg\", \"http://yanxuan.nosdn.127.net/3794b5a39646825076be8ca906dd68f1.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('564', '1021004', '0', '质量很好！拿到家最好再透透风', '1', '1', '[\"http://yanxuan.nosdn.127.net/d10f75cea70f3c9deece05f45d5182cd.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('565', '1021004', '0', '收到马上就用了，第一次用网易精选，品质不错', '1', '1', '[\"http://yanxuan.nosdn.127.net/e4e1354ce6559657aea7262fe64c23be.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('566', '1021004', '0', '很柔软暖和的毯子，如被子一样大，靠在沙发上用也很合适。平时还可以当披肩，颜色百搭。', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('567', '1021004', '0', '送给男朋友的奶奶，感觉厚实又大方，自己也想再买一条', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('568', '1021004', '0', '给爸爸买的，冬天盖着在沙发上看电视不错', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('569', '1021004', '0', '公司年终奖品，都很满意', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('570', '1021004', '0', '公司年终奖品，都很满意', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('571', '1021010', '0', '很厚实。灯光问题。实物和照片一样颜色，没有色差。质量很好！大爱啊！', '1', '1', '[\"https://yanxuan.nosdn.127.net/a8a0454723859c92af1dc6a10272b535.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('572', '1021010', '0', '颜色好看，触感舒服，刚好和窗帘很配，喜欢，爱上网易严选~', '1', '1', '[\"https://yanxuan.nosdn.127.net/b7e3e6d54808e7bc296699e41d597543.jpg\", \"https://yanxuan.nosdn.127.net/65e0859c700533fcc37ce691978ea68e.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('573', '1021010', '0', '发货好快呀，昨天下午订货今天就收到了。感觉颜色还不错，像水洗牛仔布。', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('574', '1021010', '0', '尺寸合适，设计很好，盖在身上很舒服，很喜欢四个角的设计', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('575', '1021010', '0', '被子很不错，材质很舒服！搭配之前买的芥麦枕头真的睡觉不要太赞了！价格也很合适，快递严选一直是顺丰，速度大家都懂！值得拥有！', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('576', '1021010', '0', '颜色很清爽，有点儿牛仔水洗布的感觉，性价比高。', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('577', '1021010', '0', '颜色超级赞，铺上也很舒服，适合夏天～', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('578', '1021010', '0', '收到货就洗了，喜欢的颜色，不暗也不亮，以后的四件套就是严选了。', '1', '1', '[\"https://yanxuan.nosdn.127.net/c55679696d860ec563e18b366982d09e.jpg\", \"https://yanxuan.nosdn.127.net/bd1fd4276a9bb4e770397ec227512225.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('579', '1021010', '0', '1.5米的床，买了1.8米的尺寸，不过质量很好，性价比很高！', '1', '1', '[\"https://yanxuan.nosdn.127.net/abd45ff67391e8e176f7e503e75c4283.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('580', '1021010', '0', '收到了就下水清洗劳动节晒好了就准备给儿子换上用的(⑉°з°)-♡', '1', '1', '[\"https://yanxuan.nosdn.127.net/f3daf5ae597a91cbfe0ab36a603a716b.jpg\", \"https://yanxuan.nosdn.127.net/d407a299c050a00bb3f8c19c1bbe5ce9.jpg\", \"https://yanxuan.nosdn.127.net/39584183f2fcaad576f84949ec7b6cfc.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('581', '1021010', '0', '怎么滚，怎么扔…都是好姿态…随意随性，自然！床品应该这样子！没有方向，正反，没有任何条框…', '1', '1', '[\"https://yanxuan.nosdn.127.net/62571b423e27cd69ffb391457a5916de.jpg\", \"https://yanxuan.nosdn.127.net/e99535c6492b6c01bfc85b72872b2304.jpg\", \"https://yanxuan.nosdn.127.net/2c6c6a59044bed5367533b478d145430.jpg\", \"https://yanxuan.nosdn.127.net/b6e369f36cf152ebd7147644f7f70fd5.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('582', '1021010', '0', '因为迫不及待就要拆开洗。所以忘记拍照。是我喜欢的颜色。由于光线原因，拍的有的变色。很舒适。爱。爱。爱。', '1', '1', '[\"https://yanxuan.nosdn.127.net/46e48ab353bddccec633f12b5a521121.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('583', '1021010', '0', '无色差，纯棉。灰暗那种紫，毫不张扬，洗后在用，很好！那个同材料的小袋，很可爱。', '1', '1', '[\"https://yanxuan.nosdn.127.net/94fb9d130db489471b7706e7156b9a21.jpg\", \"https://yanxuan.nosdn.127.net/1f1d98dc5095455b2689ca61c624057f.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('584', '1021010', '0', '照出来有色差，实物比图片略深。不得不说的是质量真的很不错，很亲肤，躺在上面真的很舒服。中了严选的毒了', '1', '1', '[\"https://yanxuan.nosdn.127.net/06cc1e8d844bac13f1a86665200d7e06.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('585', '1021010', '0', '非常好！漂亮大气质量好！下回有优惠时再来买另一种颜色。', '1', '1', '[\"https://yanxuan.nosdn.127.net/62a25ab3e6125a6ffb4b805300025dbc.jpg\", \"https://yanxuan.nosdn.127.net/efc8416ff62cbdaaa1aff5a8554b2ebe.jpg\", \"https://yanxuan.nosdn.127.net/53f6044d48b5f83be9d35b23d738dd94.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('586', '1021010', '0', '还不错，性冷淡的灰紫色，发来的时候有一小块污渍，洗掉了。', '1', '1', '[\"https://yanxuan.nosdn.127.net/f2d4bf919bf85438207094e34f8ebffa.jpg\", \"https://yanxuan.nosdn.127.net/98968a2e332cba9ac0a6f80503fc4f6e.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('587', '1021010', '0', '超棒,晚上裸睡啦', '1', '1', '[\"https://yanxuan.nosdn.127.net/08040bdcfc774498e07e0b13c4a6723d.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('588', '1021010', '0', '严选品满意！', '1', '1', '[\"https://yanxuan.nosdn.127.net/f110b82871829aac038e1fb510511c91.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('589', '1021010', '0', '颜色好看。挺舒服的。', '1', '1', '[\"https://yanxuan.nosdn.127.net/dda9a1c41db0001848bcbc2819af17ca.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('590', '1021010', '0', '被套质量没得说，相当好，只是颜色稍稍灰点，高级灰才最漂亮嘛', '1', '1', '[\"https://yanxuan.nosdn.127.net/a3e192773af517323ee0ac09ef79ee84.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('591', '1021010', '0', '太舒服了，比淘宝500百多的还好！！！', '1', '1', '[\"https://yanxuan.nosdn.127.net/a674065cd6ea8d9708e2105304fb95ca.jpg\", \"https://yanxuan.nosdn.127.net/b20a0f0e4722f7833d63c94c27ae7a11.jpg\", \"https://yanxuan.nosdn.127.net/2b5ae81d7182072323d4fd9bf4a5c6b4.jpg\", \"https://yanxuan.nosdn.127.net/04db196793abaf5b197abfafe4f5e702.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('592', '1021010', '0', '08年考上县里的二高，妈妈带着我在镇上买了一套床单被罩，没有枕头罩，天蓝色的，上面是史努比，一共四十多，质量不怎么好，一直用到大学', '1', '1', '[\"https://yanxuan.nosdn.127.net/7f1d3d8f3630374566ce945bcc5aed04.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('593', '1021010', '0', '这颜色很喜欢 每天都会有好的心情 质量也好得不要不要D', '1', '1', '[\"https://yanxuan.nosdn.127.net/17fb23e441621e775c772c5c912023f0.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('594', '1021010', '0', '晚上加上家里的灯光，感觉更像牛仔色', '1', '1', '[\"https://yanxuan.nosdn.127.net/237be23e775e718b5807c2e7821db508.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('595', '1021010', '0', '质量不错，纯色看起来就会很舒服，还特意给家里的被子四角缝上了一段绳，为了与被罩里的绳子系上……臭小子非要上来当模特', '1', '1', '[\"https://yanxuan.nosdn.127.net/262e60c88bb8c311ac2fe899e91d38a4.jpg\", \"https://yanxuan.nosdn.127.net/8d4e1d65263bcf6f9f9959a9be217bb8.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('596', '1021010', '0', '确实没有介绍中那种紫好看，实物更偏灰色，但质量还是挺好的，所以就留下用了', '1', '1', '[\"https://yanxuan.nosdn.127.net/f86d9c02d903cda604d1b9d9fc76d8ef.jpg\", \"https://yanxuan.nosdn.127.net/787926f1b714f6f6b35c3da615b3a788.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('597', '1021010', '0', '很重，颜色挺好看，但是拍不出来，还会再关注的', '1', '1', '[\"https://yanxuan.nosdn.127.net/cfea23e4f65e5492d3f833e29559811c.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('598', '1021010', '0', '不错', '1', '1', '[\"https://yanxuan.nosdn.127.net/fe4048e0ab7956f7f09726705f972078.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('599', '1021010', '0', '装在一个小布袋子，好萌，灰紫颜色很喜欢，蓝色的有色差', '1', '1', '[\"https://yanxuan.nosdn.127.net/c29a35eff0c1f0c778c03d56d5ceb488.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('600', '1021010', '0', '昨天才下的单，今天就到了，一看到就好喜欢', '1', '1', '[\"https://yanxuan.nosdn.127.net/c1737ac2361f9e2aeda91382d35ca20e.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('601', '1022000', '0', '超美 超喜欢 一直喜欢的调', '1', '1', '[\"https://yanxuan.nosdn.127.net/6d3a49740677455d0fb899267765e7dc.jpg\", \"https://yanxuan.nosdn.127.net/4982866d44171c1d1f376cad111d55f5.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('602', '1022000', '0', '拿到手马上就洗了，快递超级给力，包装也很精致，是我喜欢的样子', '1', '1', '[\"https://yanxuan.nosdn.127.net/db0917423ddfc7d51127f3a4bfa67305.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('603', '1022000', '0', '超级爱！', '1', '1', '[\"https://yanxuan.nosdn.127.net/5d0b6d9aeac3e29dfe427792dd5fcd22.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('604', '1022000', '0', '真的非常好看哎，洗了一下毛球都没有掉。扣子和走线都非常好。唯一的缺点是支数太低，就是薄露透。如果被子和褥子是花的，铺这套就很尴�', '1', '1', '[\"https://yanxuan.nosdn.127.net/a56dfe21a69ad1f9f3bbccaa8ded7799.jpg\", \"https://yanxuan.nosdn.127.net/7aa1d24c5e2c5a8624d0390a6d170a31.jpg\", \"https://yanxuan.nosdn.127.net/96ee70bdf77d62f82b1ddc9989f10ad9.jpg\", \"https://yanxuan.nosdn.127.net/1f0398106b3e75f3e8fe0b85a051d937.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('605', '1022000', '0', '洗過之後使用發現整套床單的尺寸偏大然後看起來就有點怪怪的但是基本上存棉的質感還是不錯', '1', '1', '[\"https://yanxuan.nosdn.127.net/f2754cd849fc7202daff2643bf2d8783.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('606', '1022000', '0', '整体很好。不过洗了一次、还是放网兜里洗的 毛球就掉了一个 略微失望 懒得退换了。相信严选，不过这些细节的质量还是希望继续努力。', '1', '1', '[\"https://yanxuan.nosdn.127.net/1b14d8c62aab87e8897e8534e8d08d30.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('607', '1022000', '0', '不要买，洗完球掉了好多', '1', '1', '[\"https://yanxuan.nosdn.127.net/5cd0ebe5edaab4fe0dd5a20beab9973f.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('608', '1022000', '0', '品质优良，制作精良，材质考究，满意度5星！', '1', '1', '[\"https://yanxuan.nosdn.127.net/e02ca8a637c311e2d8a7c93a683e9d20.jpg\", \"https://yanxuan.nosdn.127.net/ea78ba8241e4e0bf8bbe5038da19a72a.jpg\", \"https://yanxuan.nosdn.127.net/ad662ac8a06d7ef7a3c66a0317cb6ccf.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('609', '1022000', '0', '真的不错，手感也很好。就是我的猫有强迫症，估计边上的毛球不久就会牺牲！满意！', '1', '1', '[\"http://yanxuan.nosdn.127.net/5cc5f18c584d773fae633b6563b8713e.jpg\", \"http://yanxuan.nosdn.127.net/4afc42f76816931ea4bd6bac28625289.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('610', '1022000', '0', '质量很好！大采购', '1', '1', '[\"http://yanxuan.nosdn.127.net/74493d3423183023fc617aa2b14345d5.jpg\", \"http://yanxuan.nosdn.127.net/14e196fbca9e656ffd2456e636221d51.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('611', '1022000', '0', '非常好看哦！纯棉的，做工好，没有很柔软，球球超级萌，很喜欢', '1', '1', '[\"http://yanxuan.nosdn.127.net/b3463ea8bc10368ee81b829fe11bd487.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('612', '1022000', '0', '还行吧', '1', '1', '[\"http://yanxuan.nosdn.127.net/1281ddf340551bcdd484388fe46be141.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('613', '1022000', '0', '非常好的质量，颜色白白的没色差，价格很实惠，是纯棉的，有五星级酒店床单的感觉，已经中了严选的毒', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('614', '1022000', '0', '球球睡觉的时候不知不觉会拽掉 不过还能再绑上去看不太出来 实物很有质感', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('615', '1022000', '0', '铺在床上之后真的超可爱，最喜欢白色的球球们，睡起来也很舒服', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('616', '1022000', '0', '很好，但是.我家1.8的\\晚安的羽绒被套进去有点挤，被套还是适合1.5的被子', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('617', '1022000', '0', '面料手感不错，就是绒球一洗就掉了，睡觉的时候也有点碍事', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('618', '1022000', '0', '灰常透明，只能用白色的被絮，边上的球秀并不牢固', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('619', '1022000', '0', '毛球要掉毛，第二次洗的时候掉了个毛球，心痛。白色太不经脏了，哭', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('620', '1022000', '0', '款式非常好看，但是面料太薄，会透出内褥的颜色', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('621', '1022000', '0', '非常棒 好看 又柔暖', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('622', '1022000', '0', '好好好好好好好', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('623', '1022000', '0', '好看厚实，就是容易粘毛', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('624', '1022000', '0', '还没打开用，质量不错，比较重', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('625', '1022000', '0', '很喜欢', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('626', '1022000', '0', '好好好', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('627', '1022000', '0', '觉得好看买的 布料不错 防尘袋收纳很贴心 唯一的不足就是机洗后 毛球掉了不少', '1', '1', '[\"https://yanxuan.nosdn.127.net/4f82acbd3717611306137018282047fe.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('628', '1022000', '0', '质量真心不错，严选上瘾了', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('629', '1022000', '0', '很好，可以反过来洗，球球不会掉', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('630', '1022000', '0', '盖着舒服', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('631', '1022001', '0', '喜欢严选的这个四件套，\n真的炒鸡好看！\n虽然洗完有点皱，\n但一点儿也不影响呀，\n配上宜家的鸭毛靠枕更配喔！', '1', '1', '[\"https://yanxuan.nosdn.127.net/60ea9abdc146361d85c23d25502d63b6.jpg\", \"https://yanxuan.nosdn.127.net/052f9f4432392c7c218a1534902acefa.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('632', '1022001', '0', '在春天季节收到如此美好的东东，心情也变得愉悦了起来呢！', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('633', '1022001', '0', '包装很精制，里面包装袋很好用，可以出差派上用场了', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('634', '1022001', '0', '快递很快就到了，看着也很好看，质量也很好，网易东西都很赞', '1', '1', '[\"https://yanxuan.nosdn.127.net/a8d21e18d3902010ddf5d01bfa546e78.jpg\", \"https://yanxuan.nosdn.127.net/9ba7a9fbb56fa85a94bfbbf3540c6c96.jpg\", \"https://yanxuan.nosdn.127.net/976c474e5bbc687467b8b27a5b9a0796.jpg\", \"https://yanxuan.nosdn.127.net/4f517fd870b2fa0b0d0577baf9b951a3.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('635', '1022001', '0', '非常柔软舒服，用包装的袋子自己手工缝了个布袋，还挺漂亮的。满分', '1', '1', '[\"https://yanxuan.nosdn.127.net/9cdaf0bda6c875f8ba9e1baf17b4df2f.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('636', '1022001', '0', '挺好看的，就是床单是纯白的，好不耐脏，有点受不鸟', '1', '1', '[\"https://yanxuan.nosdn.127.net/5638b05b2f7f0c3c4605878bbe8d5dff.jpg\", \"https://yanxuan.nosdn.127.net/2b628823d155af9a6e2cb27f1dbc057b.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('637', '1022001', '0', '这个略薄，里面的颜色能透出来，然后纯白色床单不是很能接受。总体一般吧', '1', '1', '[\"https://yanxuan.nosdn.127.net/9d41ed14d278a29f3284135b5eaaab1c.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('638', '1022001', '0', '很好。只不过刚铺上就被娃尿了', '1', '1', '[\"https://yanxuan.nosdn.127.net/dbfb7913eb778363595004e18765e5c8.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('639', '1022001', '0', '漂亮哦！大爱', '1', '1', '[\"https://yanxuan.nosdn.127.net/a6a5a04bbcf72df70a24e8d13eca060c.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('640', '1022001', '0', '已经洗洗铺上了，是纯棉的，有一股淡淡的棉花味，限时购买的价格划算，好的生活没那么贵，希望继续加强品控，推出更好的产品。', '1', '1', '[\"https://yanxuan.nosdn.127.net/ece318e743ceaa23149f772ba6031b03.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('641', '1022001', '0', '摸着挺舒服的，但是买家秀怎么和效果图不同。。。', '1', '1', '[\"https://yanxuan.nosdn.127.net/134049bd13f120c24450b268f02b08ec.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('642', '1022001', '0', '很漂亮。', '1', '1', '[\"https://yanxuan.nosdn.127.net/5494f065d611215430847bcd2c463057.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('643', '1022001', '0', '非常喜欢。就是尺寸小了希望出220*240的', '1', '1', '[\"https://yanxuan.nosdn.127.net/16f8f015384610efe99154e7643a83b6.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('644', '1022001', '0', '刚洗咯，还没有铺，觉得应该还是蛮漂亮的', '1', '1', '[\"https://yanxuan.nosdn.127.net/0ea2b71863166f483e0b7210229caa9f.jpg\", \"https://yanxuan.nosdn.127.net/3ec26a344972521786d0bbc531ebece7.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('645', '1022001', '0', '质量特别好', '1', '1', '[\"https://yanxuan.nosdn.127.net/d65b9d64714ae14745e54e862232f3a6.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('646', '1022001', '0', '很质感，很喜欢，哇咔咔', '1', '1', '[\"https://yanxuan.nosdn.127.net/1131321e97086a8f36adf9e9fc9b8efe.jpg\", \"https://yanxuan.nosdn.127.net/789b8b698d5ed987956fa04842cccd99.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('647', '1022001', '0', '收到很惊喜，买之前没仔细看，就看了评论以为上面的花色是印染的还略微有些将就，收到打开一看原来是用线织出来的，而且布还夹杂着丝状�', '1', '1', '[\"https://yanxuan.nosdn.127.net/bd36e5e737766d6038cbedf78d9b4104.jpg\", \"https://yanxuan.nosdn.127.net/d050def0183e7ff1a2d5719b01c3e770.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('648', '1022001', '0', '太棒了', '1', '1', '[\"https://yanxuan.nosdn.127.net/61a8235883d29885426a1b46a26c198a.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('649', '1022001', '0', '不错', '1', '1', '[\"https://yanxuan.nosdn.127.net/51764b9aad0eb2c1c9f63c04f426c372.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('650', '1022001', '0', '不错不错。。。就是猫喜欢挠。。。', '1', '1', '[\"https://yanxuan.nosdn.127.net/1510fc4f3cb6ad70c7a6d5c800ef3582.jpg\", \"https://yanxuan.nosdn.127.net/b070ad49f34eb7230526be131e90e37f.jpg\", \"https://yanxuan.nosdn.127.net/846c2c947b1e16ea48fe45eaf10ba8d5.jpg\", \"https://yanxuan.nosdn.127.net/1b21db23cf0b66204f995b03f6599ac3.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('651', '1022001', '0', '喜欢，买了好几套还没用，但很喜欢', '1', '1', '[\"https://yanxuan.nosdn.127.net/2db07c73bd33799d9faa0f81c2effa08.jpg\", \"https://yanxuan.nosdn.127.net/3cdfaf928cc82ed8bb4393b16503e1fc.jpg\", \"https://yanxuan.nosdn.127.net/90ffc9ac073531cf5c916e23dda1f801.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('652', '1022001', '0', '包装精美，做工精细，回去就洗了。外面的包装袋也是跟床单一个材质的棉布袋子，可以留着当旅行收纳袋用，很好。', '1', '1', '[\"https://yanxuan.nosdn.127.net/2b09774e999d31164adabddc65136476.jpg\", \"https://yanxuan.nosdn.127.net/c810a49af0e195e8c58bbae9f988edb4.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('653', '1022001', '0', '质量非常棒，价格虽有点小贵，但很喜欢 ，很值得购买，赞', '1', '1', '[\"https://yanxuan.nosdn.127.net/842ac31942b2629b04f799a77a0f3ba8.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('654', '1022001', '0', '第一次用 洗完变成这样了', '1', '1', '[\"https://yanxuan.nosdn.127.net/d26629d083fa34b55edc6468c86b59a2.jpg\", \"https://yanxuan.nosdn.127.net/0a448cad97e277cc274ad92b855e38ee.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('655', '1022001', '0', '非常舒适，漂亮', '1', '1', '[\"https://yanxuan.nosdn.127.net/7f392750ace1fa1423d4bf233c3bde0a.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('656', '1022001', '0', '都是很实用，漂亮，质量好的东西，大爱！', '1', '1', '[\"https://yanxuan.nosdn.127.net/be868b285026c4671db000ca77457972.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('657', '1022001', '0', '没有熨烫，洗了就用上了，白色提亮整个房间，质感也很好，喜欢❤️', '1', '1', '[\"http://yanxuan.nosdn.127.net/f39999946017eef65aab38260e08de8d.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('658', '1022001', '0', '很漂亮！配上宜家的流苏靠垫，更美了～唯一的缺陷是，只能装五尺的被子，冬天用不了了。', '1', '1', '[\"http://yanxuan.nosdn.127.net/82a3e6a6e3fcced4a597d4edb0ad62a2.jpg\", \"http://yanxuan.nosdn.127.net/30874df735f1db24229b318896c6747a.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('659', '1022001', '0', '包装尚可，还没来得及触碰', '1', '1', '[\"http://yanxuan.nosdn.127.net/9afaacec380dc7d203b427e070b3aa54.jpg\", \"http://yanxuan.nosdn.127.net/da4b6a08cce4d8a10e21d91c2d6f3de0.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('660', '1022001', '0', '很棒！还没使用', '1', '1', '[\"http://yanxuan.nosdn.127.net/18cf5680b41bb410bfc88cbc5e06d9f8.jpg\", \"http://yanxuan.nosdn.127.net/5a851b672f640a4d1cd4f96730fc7046.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('661', '1023012', '0', '手感很舒服的条毛巾被，有一点浮毛，不过洗过干了之后抖一抖就好了。颜色非常喜欢。', '1', '1', '[\"https://yanxuan.nosdn.127.net/9f75d85a4bd001818fa4f2a8f2c29e3c.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('662', '1023012', '0', '摸起来很舒服，暂时还未使用，到手第一件事先清洗了一遍，仔细检查过，没有质量问题，优秀', '1', '1', '[\"https://yanxuan.nosdn.127.net/2dd23da488a4d07fb2b64cc3d2c4e806.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('663', '1023012', '0', '照片偏灰 实际要普蓝色一些的 ，打开包装 手感不错！厚度就相当于厚实的毛巾差不多', '1', '1', '[\"https://yanxuan.nosdn.127.net/7a0e7b7df09c42762e972d557dc534a4.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('664', '1023012', '0', '有少年提到的掉絮，勾线现象，絮絮估计是需要多洗几次，勾线用针一点点，一节节的挑也能行。东西不错。', '1', '1', '[\"https://yanxuan.nosdn.127.net/35e37bc6928c93a631f2b3b1740ff372.jpg\", \"https://yanxuan.nosdn.127.net/6398bcdc7436ebe90109b240079f712c.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('665', '1023012', '0', '已经是买的第二床了，另一床是蓝色，掉絮严重，也许是白色的不容易看见，多洗几次可能好点，优点，盖着亲肤。', '1', '1', '[\"https://yanxuan.nosdn.127.net/e6e70b7625ac4bf13f5a1d04857d1db8.jpg\", \"https://yanxuan.nosdn.127.net/f204578c9da9828343296c2d4eb45946.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('666', '1023012', '0', '真心觉得不错的产品 收到后很满意 够分量 等时机适宜的时候再用', '1', '1', '[\"https://yanxuan.nosdn.127.net/30b40a6fade9533e1bc2afe208f050c8.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('667', '1023012', '0', '两色各入一床，两个颜色都喜欢，很柔软。限时购比较优惠。', '1', '1', '[\"https://yanxuan.nosdn.127.net/6064876ae6e9ebfaf9c9ec0e5f35dab7.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('668', '1023012', '0', '凉快啊', '1', '1', '[\"https://yanxuan.nosdn.127.net/cca672a276c7835243a70d7fc1aac70d.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('669', '1023012', '0', '质量不错，就是以为还能在限时购的折扣下再八折', '1', '1', '[\"https://yanxuan.nosdn.127.net/cb1fcaa7bc69a55ae0c474248ce962f3.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('670', '1023012', '0', '两色各入一床，喜欢，很柔软。限时购比较优惠。', '1', '1', '[\"https://yanxuan.nosdn.127.net/3caebeae559571fd6478426f7dd767bf.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('671', '1023012', '0', '面料不错，盖着很舒服，中了严选的毒了哈哈哈', '1', '1', '[\"https://yanxuan.nosdn.127.net/cce740576b97af0812f1df57eee9813f.jpg\", \"https://yanxuan.nosdn.127.net/40541e1761b33eeaa454580437942813.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('672', '1023012', '0', '彻底爱上网易严选，想把所有东西你回家', '1', '1', '[\"https://yanxuan.nosdn.127.net/c70a8cd8eff8dbd8360cc55fce9f43c1.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('673', '1023012', '0', '被子不错，摸的也舒服', '1', '1', '[\"https://yanxuan.nosdn.127.net/c5408297544de75b1abdea6fba6a2aa7.jpg\", \"https://yanxuan.nosdn.127.net/5419af51367403ced87cecaef018678f.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('674', '1023012', '0', '颜色很喜欢，初夏初秋盖着都很舒服。', '1', '1', '[\"https://yanxuan.nosdn.127.net/235cb2276828b8620f5d9f812b74d277.jpg\", \"https://yanxuan.nosdn.127.net/7f6bbe6232b289dc9e075ae8c089f633.jpg\", \"https://yanxuan.nosdn.127.net/ef3726418b70741be8fcd221bb24ffeb.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('675', '1023012', '0', '很喜欢  舒服  颜值也高   刚好碰上活动 很划', '1', '1', '[\"https://yanxuan.nosdn.127.net/dc27105cf7ef60cf15f47550a9ad5a1e.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('676', '1023012', '0', '布料很舒服，真的舒心', '1', '1', '[\"https://yanxuan.nosdn.127.net/52c7bae9d4476b2a7588003ef486358d.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('677', '1023012', '0', '摸上去很舒服，喜欢毛巾被', '1', '1', '[\"https://yanxuan.nosdn.127.net/c3bab17fb65e36810867c2e62958084f.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('678', '1023012', '0', '好好好', '1', '1', '[\"https://yanxuan.nosdn.127.net/fbc3e351a1c14d0ef70d53909f749f86.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('679', '1023012', '0', '不错', '1', '1', '[\"https://yanxuan.nosdn.127.net/c72264ef9edaf220b555c4073b60896d.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('680', '1023012', '0', '手感不错，还有试盖，应该不错的', '1', '1', '[\"https://yanxuan.nosdn.127.net/9bc7321e6cab101eeb80f7cf81d6bf62.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('681', '1023012', '0', '手感不错，已丢洗衣机', '1', '1', '[\"https://yanxuan.nosdn.127.net/89179186775daf9833d49a0c77d07a6c.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('682', '1023012', '0', '手感很好，期待盖的效果！', '1', '1', '[\"https://yanxuan.nosdn.127.net/5fe2399928dd3c90a4c8841d5668dd78.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('683', '1023012', '0', '被子，很好，温暖适中', '1', '1', '[\"https://yanxuan.nosdn.127.net/6cae0aa81bc1a0244a116a4abf3839a5.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('684', '1023012', '0', '质量很好，柔软舒服，非常喜欢。', '1', '1', '[\"https://yanxuan.nosdn.127.net/a38a9bdd3eb2bef7706a478fb73ceb83.jpg\", \"https://yanxuan.nosdn.127.net/7784023ce0d3d8f661d977b59f4679eb.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('685', '1023012', '0', '非常满意 从颜色到质地 使用以后再来追评', '1', '1', '[\"https://yanxuan.nosdn.127.net/e0ca28bce4d92eedb239ea60ac99260c.jpg\", \"https://yanxuan.nosdn.127.net/2858a6c28f2c6f6402fad39069ae48a3.jpg\", \"https://yanxuan.nosdn.127.net/427431006fefeca537e61d37940147c3.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('686', '1023012', '0', '空调被质量赏可 线纱掉毛不会太多 实物颜色有一定色差', '1', '1', '[\"https://yanxuan.nosdn.127.net/7a7884f4863abe114ee2f4faad1b364f.jpg\", \"https://yanxuan.nosdn.127.net/fd739b388596b39039f2a695147ee5ac.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('687', '1023012', '0', '不错，我喜欢薄薄的', '1', '1', '[\"https://yanxuan.nosdn.127.net/e839eaa10c9c04e3b904c87182289cbe.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('688', '1023012', '0', '喜欢', '1', '1', '[\"https://yanxuan.nosdn.127.net/075f10ce762b652b345c6682b537b2d7.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('689', '1023012', '0', '不错', '1', '1', '[\"https://yanxuan.nosdn.127.net/b801aef265eb9509204afc0609053372.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('690', '1023012', '0', '不错', '1', '1', '[\"https://yanxuan.nosdn.127.net/8e91915bb739af606136a9fd73625adb.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('691', '1023032', '0', '高质量的评价，高质量的评价，高质量的评价，高质量的评价，高质量的评价，高质量的评价，高质量的评价，高质量的评价，高质量的评价，�', '1', '1', '[\"https://yanxuan.nosdn.127.net/3bac7631effc2f0c3749b5a78b2edf27.jpg\", \"https://yanxuan.nosdn.127.net/bd7cf1d02ab7c112879239a161b36d85.jpg\", \"https://yanxuan.nosdn.127.net/8e22d927ded0f0bd170830f6bd65cdac.jpg\", \"https://yanxuan.nosdn.127.net/e704b49044b98e3cbc9d46f399a5e06e.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('692', '1023032', '0', '高质量的评价，高质量的评价，高质量的评价，高质量的评价，高质量的评价，高质量的评价，高质量的评价，高质量的评价，高质量的评价，�', '1', '1', '[\"https://yanxuan.nosdn.127.net/062e060a5bf6708a8765c1f7ee2cbe58.jpg\", \"https://yanxuan.nosdn.127.net/883d1f066fb7d502b775d042244ee248.jpg\", \"https://yanxuan.nosdn.127.net/5e9bb9c40eee150c3f5e6db90ca0eae5.jpg\", \"https://yanxuan.nosdn.127.net/d25f2738b9dfb101cabc6ffbf8e643a2.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('693', '1023032', '0', '手感较柔软，贴身很舒适，也不像之前买的一套软的撑不起形。质量没得说，唯一不足的如大家所说，扣子不太有质感。', '1', '1', '[\"https://yanxuan.nosdn.127.net/83bac5372bb94d285a9b7cb7244bacbd.jpg\", \"https://yanxuan.nosdn.127.net/42a8e3a6f1e7102ab4155c3fc89f7a1a.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('694', '1023032', '0', '贴肤很舒服呢', '1', '1', '[\"https://yanxuan.nosdn.127.net/fed84f99370c5c3be71b3822ebd9b93a.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('695', '1023032', '0', '不错 很舒适很好看！', '1', '1', '[\"https://yanxuan.nosdn.127.net/06a0bc6b753239b72a5806b780948a49.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('696', '1023032', '0', '我一直以为是被子的四件套，收到一看包装心里想肯定不是被子，小心翼翼的拆开，果然……怪我自己没看好，只能再重新买被子了，但东西还�', '1', '1', '[\"https://yanxuan.nosdn.127.net/ae535db21f5b4bcb21a357aef1bd20d8.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('697', '1023032', '0', '收到立刻洗了，不缩水，柔软舒适，贴身很舒服', '1', '1', '[\"https://yanxuan.nosdn.127.net/f21092b191df521b7b166187c5a483d9.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('698', '1023032', '0', '颜色和图片差距大，面料很舒服', '1', '1', '[\"https://yanxuan.nosdn.127.net/15fd0d9fcafa149985f2ea482ec40dc2.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('699', '1023032', '0', '很漂亮 非常喜欢 不过金属扣在枕头上感觉有点危险', '1', '1', '[\"https://yanxuan.nosdn.127.net/53cddbfd559e0b7a592b60ebdaff209c.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('700', '1023032', '0', '睡起来挺舒服的，很柔软。', '1', '1', '[\"https://yanxuan.nosdn.127.net/05ab9dc44e3e145095435c8e053aaa0a.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('701', '1023032', '0', '很好！洗了用上了。', '1', '1', '[\"https://yanxuan.nosdn.127.net/cd1e68034831bcaedbadf662e8c2acd6.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('702', '1023032', '0', '东西很不错 包装相当于一个同材质的收纳袋 扣子似乎只是装饰 挺喜欢的', '1', '1', '[\"http://yanxuan.nosdn.127.net/9568f7b3475d7a661eece12a6adbb962.jpg\", \"http://yanxuan.nosdn.127.net/e0503f144ae9ecd630c7316c0edb1f81.jpg\", \"http://yanxuan.nosdn.127.net/788d59055a27ae9ea96aca198e524170.jpg\", \"http://yanxuan.nosdn.127.net/c3538d8bb6a0d8dbe3abb3676d2a515d.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('703', '1023032', '0', '手感是不错 但带荧光剂 虽说这是国内大多数纺织类产品的通病，但希望严选能在这方面更加严格把控。', '1', '1', '[\"http://yanxuan.nosdn.127.net/81cc392a3c8da91d00b655f56e215e49.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('704', '1023032', '0', '包装高大上，感觉还是偏薄，买了另外一种磨毛的四件套，价格两倍左右，差不多的感觉，质感很好，估计用起来肯定不错', '1', '1', '[\"http://yanxuan.nosdn.127.net/4085c4e87b6d016cf857dd1582ba7a97.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('705', '1023032', '0', '一如既往的好，包装都给人那么舒服的感觉，严选一如既往的那么用心，细心。', '1', '1', '[\"http://yanxuan.nosdn.127.net/b5d40bf84c572224c6ad65b90899a79b.jpg\", \"http://yanxuan.nosdn.127.net/264911e117b8a5ea5ed829b10783e48e.jpg\", \"http://yanxuan.nosdn.127.net/0a3f0c41104fe3f681c4dd2aca9e949e.jpg\", \"http://yanxuan.nosdn.127.net/87611d9d17d3ab7a46f60ce52e6c9cd8.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('706', '1023032', '0', '质感很好！', '1', '1', '[\"https://yanxuan.nosdn.127.net/bcd07ba53cca44579466390a69855974.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('707', '1023032', '0', '这款还没有用，摸起来挺舒服的，感觉是贴肤类的，自动垂平感应该比较好。', '1', '1', '[\"http://yanxuan.nosdn.127.net/0677ec012ea010f8335c26d31512297d.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('708', '1023032', '0', '不错', '1', '1', '[\"https://yanxuan.nosdn.127.net/966f53e8781775f05a252f6bc6b899ee.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('709', '1023032', '0', '不如那几套磨毛的好。但也质地不错。', '1', '1', '[\"http://yanxuan.nosdn.127.net/cd7a4c223497c3f438adaa4a9ee1fae5.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('710', '1023032', '0', '价格真的没的说。质量真的没的说。速度也没的说。东西一到马上先把被套套上了。一切都刚刚好。。。', '1', '1', '[\"http://yanxuan.nosdn.127.net/5475a1f79f787cdded23be7b6f413e19.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('711', '1023032', '0', '面料柔软舒适，但太薄了', '1', '1', '[\"http://yanxuan.nosdn.127.net/0da9ce2de0ee9efcce4fbae5777d9075.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('712', '1023032', '0', '收货快，内外包装很细心，产品手感软滑细腻，颜色与宣传照接近，深灰搭浅灰很耐看，味道不大,如果洗后不脱色就perfect 了。总体感觉good !', '1', '1', '[\"http://yanxuan.nosdn.127.net/f686c636292c742f83cab009f7d177d4.jpg\", \"http://yanxuan.nosdn.127.net/9d6c10a99e5316ef24443644de76bc13.jpg\", \"http://yanxuan.nosdn.127.net/8063a9ad43c8b2f3a6175772ade87a64.jpg\", \"http://yanxuan.nosdn.127.net/0aa52522dac9fc1a42cb7cbf7a9db0f5.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('713', '1023032', '0', '不错', '1', '1', '[\"http://yanxuan.nosdn.127.net/be62a63f1d1f34344eafc4a9439cda09.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('714', '1023032', '0', '严选，质量超好，很有格调。', '1', '1', '[\"http://yanxuan.nosdn.127.net/45b0c3696557aa9171b8b3b0e5b9db05.jpg\", \"http://yanxuan.nosdn.127.net/5bfcb3bd63a0f8d7203781a06b242cd0.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('715', '1023032', '0', '没有想象中的那么好，比起第一次买睡衣被惊艳到，这次有点小失望。主要是这个棉料有点薄，对于这个价位来说织得不够密，而且还有点味道�', '1', '1', '[\"http://yanxuan.nosdn.127.net/0e8fdb5e2d9aff68348b7adf76cc82ea.jpg\", \"http://yanxuan.nosdn.127.net/f583550776bf9e65a834a2f5829717eb.jpg\", \"http://yanxuan.nosdn.127.net/b1f5c3b311732bcfc159efc6e2e61e2b.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('716', '1023032', '0', '颜色素净，舒服，手感也是没的说', '1', '1', '[\"http://yanxuan.nosdn.127.net/0a36510f3e91726808658629e2c87139.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('717', '1023032', '0', '很棒 还没使用', '1', '1', '[\"http://yanxuan.nosdn.127.net/a29520b9a2ebe870e544a035e100a963.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('718', '1023032', '0', '东西不错的，一切刚刚好。做工是比较精细。就是六根固定绑带系上以后，被套铺平有点扯得不整齐，估计还是系得太紧了吧。熨烫一下会舒服�', '1', '1', '[\"http://yanxuan.nosdn.127.net/9e9a5eea34c3027b949b6a389a8dafc6.jpg\", \"http://yanxuan.nosdn.127.net/10f594c0d0110cc274b16ef69183dd5e.jpg\", \"http://yanxuan.nosdn.127.net/bef0054faf1abe16d1f1acd20909acb6.jpg\", \"http://yanxuan.nosdn.127.net/b2b40c71d4828263aada7c4fd9a7addc.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('719', '1023032', '0', '非常舒服啊！料子很好，这个价位买到真是觉得捡了个便宜，这套被子比较大，很难买到合适又好看料子又舒服的被套，后续还会再在严选买一�', '1', '1', '[\"http://yanxuan.nosdn.127.net/08f9f3defacb5e292d1edfb5ed06bdf5.jpg\", \"http://yanxuan.nosdn.127.net/d4dbbd3c5e1e811b28b136ba23b41dfd.jpg\", \"http://yanxuan.nosdn.127.net/7cfb477cc26bf4e2cf5c551b73e785a7.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('720', '1023032', '0', '杯子很舒服，很柔软，挺喜欢', '1', '1', '[\"http://yanxuan.nosdn.127.net/5899097cd481fc58c9b89c80d522ddc1.jpg\", \"http://yanxuan.nosdn.127.net/8e22c2851bbab5d6fa3f158b784d9dc2.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('721', '1023034', '0', '盖着很舒服，很亲肤，也挺暖和！没有色差，支持严选！！！严选有毒', '1', '1', '[\"https://yanxuan.nosdn.127.net/6170afd3f89cc8497f883e04fcb745db.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('722', '1023034', '0', '空调被，颜色无色差，尺寸合适，贴身使用无不适感。包装精美，发货速度快！赞！', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('723', '1023034', '0', '春天很适合盖，有鸭绒很轻，保暖效果还是不错的，不用盖大厚棉被', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('724', '1023034', '0', '真心好的被子，夏天盖一点也不热，凉凉的触感，很舒服。', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('725', '1023034', '0', '整体质地及做工满意，正反双面料设计很用心，尤其一侧的外翻包边很人性体验.', '1', '1', '[\"https://yanxuan.nosdn.127.net/3c5683a1ba3e71475ce10cf4dfa9538c.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('726', '1023034', '0', '夏凉被很柔软、手感很小，这次买了水粉，剛剛又买了水蓝，如果有其它颜色还会再买', '1', '1', '[\"https://yanxuan.nosdn.127.net/5e7768781da0f976c058b69fc49584ee.jpg\", \"https://yanxuan.nosdn.127.net/2f4f59f8d7201a6984d130ecae76af41.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('727', '1023034', '0', '被子是买给女儿用的，单人床，1.5米刚好，自身有个小袋子，收纳也很方便。', '1', '1', '[\"https://yanxuan.nosdn.127.net/e71aabbf15fadc6dfff0e3fc614d99b9.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('728', '1023034', '0', '挺快的，顺丰服务好。被子刚打开，还没盖，看上去还行，，下次还在严选买，让人放心。', '1', '1', '[\"https://yanxuan.nosdn.127.net/59f03bcc980dce726bc85d94cf889d46.jpg\", \"https://yanxuan.nosdn.127.net/7250913912c7400bd9978a4381adeab5.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('729', '1023034', '0', '大家评论好，趁限时购果断买了二床，轻薄温暖，没有异味，喜欢。只是在唯品会买的150*210的被套不吻和。', '1', '1', '[\"https://yanxuan.nosdn.127.net/fe32dc20c222126372d44b77a707e414.jpg\", \"https://yanxuan.nosdn.127.net/8cae3963075ac4e1628fdc9bbd9781b5.jpg\", \"https://yanxuan.nosdn.127.net/89f5f7f71ecf8d3905f9e01d8fab0be6.jpg\", \"https://yanxuan.nosdn.127.net/4d002b7e1b797918d3e57f39ddbb16a1.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('730', '1023034', '0', '质量很好，羽绒被，江苏江南地区，4月下旬到五月中旬，盖得应该正好，不冷不热', '1', '1', '[\"https://yanxuan.nosdn.127.net/bfc631af83e81eea39ac731229932cde.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('731', '1023034', '0', '好吧。 不是我想要的感觉。但质量很好。 留下来了', '1', '1', '[\"https://yanxuan.nosdn.127.net/914b65d13dca66952ce479510bffea38.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('732', '1023034', '0', '限时购了二床，颜色非常喜爱，质量也好，不喜欢厚重被的朋友可以考虑。', '1', '1', '[\"https://yanxuan.nosdn.127.net/f0cc6c191b402c3d672af33fec94bad2.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('733', '1023034', '0', '出乎意料的好，还有个袋子装起来，开始还以为是睡袋呢，哈哈哈，最近中了严选的毒，还有三个包裹明天到～', '1', '1', '[\"https://yanxuan.nosdn.127.net/e960ba694a64bd325d1da1e2e645501a.jpg\", \"https://yanxuan.nosdn.127.net/6d7888decc4dbff22cdbafcd4c2b832f.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('734', '1023034', '0', '第三次买了，全家一人一个。厚薄大小都很合适。有一层薄薄的羽绒，推荐。', '1', '1', '[\"https://yanxuan.nosdn.127.net/20cdbfbcabe83d1853145f9d2d5b61b3.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('735', '1023034', '0', '被子的质量超级好，我特别喜欢！我已经是严选的铁粉喽！', '1', '1', '[\"https://yanxuan.nosdn.127.net/c3641a83243a2f114a53bd2678c5da0f.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('736', '1023034', '0', '包装很好，拿在手里也很有分量，摸着挺舒服的。刚拆开有一股鸭毛的味道，洗一次就没有了。洗了不掉色，不褶皱，好评。', '1', '1', '[\"https://yanxuan.nosdn.127.net/2e7071c0c9b6767b7e7f296636c9e147.jpg\", \"https://yanxuan.nosdn.127.net/81846d5503897013aed2f0aac9b1b244.jpg\", \"https://yanxuan.nosdn.127.net/323134fa126b1a9cd98d7486ecb85cf3.jpg\", \"https://yanxuan.nosdn.127.net/e7e31b7df68f3a520e7159001853a196.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('737', '1023034', '0', '被子又轻又软 这个季节盖正合适', '1', '1', '[\"https://yanxuan.nosdn.127.net/fd53e167497bbbb97e3770718f6996fa.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('738', '1023034', '0', '太好用了，虽薄但挺暖和的，现在用挺好', '1', '1', '[\"https://yanxuan.nosdn.127.net/7a14329425e91d548476883acacb6aba.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('739', '1023034', '0', '很舒服哦，夏天用正好', '1', '1', '[\"https://yanxuan.nosdn.127.net/4bfb1a135cb9ba245547f44084c5e89e.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('740', '1023034', '0', '昨天下午收到，还没打开看，晚上回家后再验收。', '1', '1', '[\"https://yanxuan.nosdn.127.net/656bd34fe25c3f628f4da98d8b64822d.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('741', '1023034', '0', '摸起来很舒服，轻薄，颜色也喜欢', '1', '1', '[\"https://yanxuan.nosdn.127.net/f694324ff5889ba7f8a8f668187772dd.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('742', '1023034', '0', '很舒服很可爱呀', '1', '1', '[\"https://yanxuan.nosdn.127.net/42d2187e546b7106147bfdb2c6eb8230.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('743', '1023034', '0', '还没拆 看着还不错，等用了再来回评', '1', '1', '[\"https://yanxuan.nosdn.127.net/783e288df5837acb5c58d95c026c3da9.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('744', '1023034', '0', '摸了摸还是很柔软的', '1', '1', '[\"https://yanxuan.nosdn.127.net/1d2b8fa0f32beb9cb118ee8509498d2f.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('745', '1023034', '0', '包装很好。隔天就到了，质量没得说，而且很舒服，就是比想象中小了点，形状有点奇怪，不像双人被，也不像单人被，什么鬼哈哈', '1', '1', '[\"https://yanxuan.nosdn.127.net/a45ecc0098671df5228f0c57f260878c.jpg\", \"https://yanxuan.nosdn.127.net/40ec203b83a452c5f0c5aea9227007ae.jpg\", \"https://yanxuan.nosdn.127.net/339978754e04337b75301f9a38bf4698.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('746', '1023034', '0', '盖着很舒服  网易东西挺好的', '1', '1', '[\"https://yanxuan.nosdn.127.net/4469ccfbe048afe16ed740f954ee1505.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('747', '1023034', '0', '质感不错，买个套，这个夏天不怕热死也不怕着凉啦哈哈', '1', '1', '[\"https://yanxuan.nosdn.127.net/5bee13beb6aad11e1a5f52dc55f219a3.jpg\", \"https://yanxuan.nosdn.127.net/00374131d4a0e96276ffbb8146708eea.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('748', '1023034', '0', '轻便，实物颜色更好些', '1', '1', '[\"https://yanxuan.nosdn.127.net/04157d6013ce501cc25f592b4057fa1c.jpg\", \"https://yanxuan.nosdn.127.net/ec5ce24e7816b2535d76a678d8ed882f.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('749', '1023034', '0', '质地优良，水蓝色特别适合厦门的天气！', '1', '1', '[\"https://yanxuan.nosdn.127.net/a6cabf73f34e08ad423cedb625386786.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('750', '1023034', '0', '收到 包装好好 大爱', '1', '1', '[\"https://yanxuan.nosdn.127.net/d1c8c41a9f469076d11680777b5ea2cb.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('751', '1027004', '0', '太喜欢这个颜色了，纱布质地柔肤透气，中了严选的毒，买买买不停。', '1', '1', '[\"https://yanxuan.nosdn.127.net/cdecde7bf71220849f9c3cfe1720305d.jpg\", \"https://yanxuan.nosdn.127.net/d811ba10f8618b7d79cf9a52f2fdd4bd.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('752', '1027004', '0', '不错，颜值高，拿起来也有一定的重量，准备给儿子用', '1', '1', '[\"https://yanxuan.nosdn.127.net/c5d24cd977f7e6a22b2c49d95a016506.jpg\", \"https://yanxuan.nosdn.127.net/d49149d0bd4feed76a315112bb19c1e7.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('753', '1027004', '0', '大人小孩都能用的空调被，柔软，特别适合过敏体质', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('754', '1027004', '0', '6层纱布，薄厚很合适，触感舒服，透气很好。', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('755', '1027004', '0', '做工不错，颜色还很漂亮，大爱啊', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('756', '1027004', '0', '很柔软，也比较保暖，挺好的', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('757', '1027004', '0', '包装很妥帖 送货很快！被子软软的很舒服 没有什么味道 已经洗了 晾干了就能用了 觉得挺适合夏天 透气柔软舒适！', '1', '1', '[\"https://yanxuan.nosdn.127.net/f96d2b67ebbdea6fa5e35e54bf0051a6.jpg\", \"https://yanxuan.nosdn.127.net/ad3b11cc8a6efa68e2a3bf0a1287db79.jpg\", \"https://yanxuan.nosdn.127.net/2a3a2e4c8a8fa61129f8f63cc3b18e67.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('758', '1027004', '0', '很好很喜欢，回老家了，先生说很好很舒服发了两张照给我，相信严选限时抢购买的很好，活动很多很喜欢', '1', '1', '[\"https://yanxuan.nosdn.127.net/0ed3434a8d9f34a9c9cb163271b2b351.jpg\", \"https://yanxuan.nosdn.127.net/d610e4e5e96e331b37fb2660e75d68b7.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('759', '1027004', '0', '不厚的凉被，有点份量。手感不错，素雅的风格，这样子挺喜欢的！', '1', '1', '[\"https://yanxuan.nosdn.127.net/ccf3d20d22cc236f18645a31440d01eb.jpg\", \"https://yanxuan.nosdn.127.net/13d0b4c8f12f86a6f7b22b1f33e33996.jpg\", \"https://yanxuan.nosdn.127.net/563b6276a8301b54a282db2f4e81aea3.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('760', '1027004', '0', '今年爱上纱布，颜色淡雅宜人，柔软又透气。如果有宝宝版就更好了。', '1', '1', '[\"https://yanxuan.nosdn.127.net/ffbdbc7663e2cb91aa0ad6b8cfb2a718.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('761', '1027004', '0', '今年爱上纱布，颜色淡雅宜人，柔软又透气。如果有宝宝版就更好了。', '1', '1', '[\"https://yanxuan.nosdn.127.net/9fcf69c825c9e0d5710e0266b6d40866.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('762', '1027004', '0', '质量很好，细节也无可挑剔，手感颜色都很满意，是我和老公喜欢的调调，严选的东西每样都惊喜，真是好的生活没那么贵！', '1', '1', '[\"https://yanxuan.nosdn.127.net/c139c422e588bcb9e4ac33ee6bd184e3.jpg\", \"https://yanxuan.nosdn.127.net/319f26a8f035a0e256de94f798ccac70.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('763', '1027004', '0', '很好，拿出来有点味能用之前细细估计会好，比想象中厚', '1', '1', '[\"https://yanxuan.nosdn.127.net/7484a3371c630347d6b938f281461891.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('764', '1027004', '0', '第一次知道有纱布被，也是第一次买，被子很漂亮，手感也很好，希望到夏天给小朋友好用。只是这个颜色应该叫紫白格更合适', '1', '1', '[\"https://yanxuan.nosdn.127.net/0d195542a6802d85e8e7d2a0e01e0765.jpg\", \"https://yanxuan.nosdn.127.net/70de86f834585eb526a511c30b2f3210.jpg\", \"https://yanxuan.nosdn.127.net/f035f61f705f7c003565b529fbf44cbf.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('765', '1027004', '0', '很柔软', '1', '1', '[\"https://yanxuan.nosdn.127.net/f314a6af836f4729b6d056ae89a425a4.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('766', '1027004', '0', '摸着很舒服，女儿超喜欢', '1', '1', '[\"https://yanxuan.nosdn.127.net/0ac042af63b99779a3ff4aa45c87f669.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('767', '1027004', '0', '第一次买严选的床品 纯纱布的被子', '1', '1', '[\"https://yanxuan.nosdn.127.net/a5cd307aeb90e8a82fa0dea5b5eb21de.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('768', '1027004', '0', '买了两床被子 都好喜欢 有收纳很方便', '1', '1', '[\"https://yanxuan.nosdn.127.net/e22e5333296b2449a7efe2f8da18da74.jpg\", \"https://yanxuan.nosdn.127.net/9d2e95b6788b928e46e3342b8bed8618.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('769', '1027004', '0', '挺厚实的纱布凉被 不错......', '1', '1', '[\"https://yanxuan.nosdn.127.net/882203bf19bae17f4677e6417afff6cf.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('770', '1027004', '0', '质量很好，而且棉纱很软，透气性很好', '1', '1', '[\"https://yanxuan.nosdn.127.net/0bce6fa312b6f1c3e929c448fdb5e6c5.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('771', '1027004', '0', '洗过还没用，等天热一些再试试看', '1', '1', '[\"https://yanxuan.nosdn.127.net/3c560b411191814d224b2ff1969c67a3.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('772', '1027004', '0', '包装很严实，打开有些气味，洗洗应该就好了，质量很好，喜欢', '1', '1', '[\"https://yanxuan.nosdn.127.net/eb94697660a4c5c9fd18ed864182de21.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('773', '1027004', '0', '颜色素雅，纯棉纱布摸起来很舒服，不过真的蛮薄的，而且太小了，只适合单个成人用，所以打算对折起来给宝宝夏天用（6月初预产期）。', '1', '1', '[\"https://yanxuan.nosdn.127.net/06ee54a135f605d55165a7810ed98ecd.jpg\", \"https://yanxuan.nosdn.127.net/9439bc7eff6e5b0a2baf63e73693dc56.jpg\", \"https://yanxuan.nosdn.127.net/8401ea124553d6d7a204796b689573b8.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('774', '1027004', '0', '粉嫩的颜色很好看，摸着也柔软，不知下水会怎样', '1', '1', '[\"https://yanxuan.nosdn.127.net/6c26ef6c0367e93f4903545eab9b4633.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('775', '1027004', '0', '超爱哒', '1', '1', '[\"https://yanxuan.nosdn.127.net/1ddb72f23ddad3e07ebcda5ef94085b5.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('776', '1027004', '0', '还没开始用，应该不错的相信网易严选。', '1', '1', '[\"https://yanxuan.nosdn.127.net/13339d32178b0c752137cbec4b25595a.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('777', '1027004', '0', '特价入的，面料手感挺好，夏天到了正好可以用了。', '1', '1', '[\"https://yanxuan.nosdn.127.net/5bac771eeac478c87ca0188512fa2d2b.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('778', '1027004', '0', '没拆，应该不错。颜色偏深', '1', '1', '[\"https://yanxuan.nosdn.127.net/8eacf960a27bc0c30edca041d7d4426d.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('779', '1027004', '0', '但愿可以水洗', '1', '1', '[\"https://yanxuan.nosdn.127.net/8f3f29af175491ca569c3ecf1ffc3099.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('780', '1027004', '0', '买给女儿用的，应该还不错吧', '1', '1', '[\"https://yanxuan.nosdn.127.net/f107eac213d14fe2beaed9cd76742719.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('781', '1029005', '0', '非常喜欢很不错', '1', '1', '[\"https://yanxuan.nosdn.127.net/b4322ca1ad69c3fc7342943e0fdbf96c.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('782', '1029005', '0', '不错', '1', '1', '[\"https://yanxuan.nosdn.127.net/34fae145174f359ea4f21776666eded6.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('783', '1029005', '0', '老婆说还行，比较冰，颜色喜欢', '1', '1', '[\"https://yanxuan.nosdn.127.net/e56df06bd57fb972cd02628adf6c3588.jpg\", \"https://yanxuan.nosdn.127.net/3d19058f5f0a91ef713f60f9873782a4.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('784', '1029005', '0', '非常有质感，拎着很重，而且非常舒服，大爱，赞美之词无以言表。', '1', '1', '[\"https://yanxuan.nosdn.127.net/82a6dfc95ff74175592dec88fd2d3eb7.jpg\", \"https://yanxuan.nosdn.127.net/232f54fdb4d0c7f7d941c6a2e1b5a7d7.jpg\", \"https://yanxuan.nosdn.127.net/2c16bbd157bf60112c81767e98fbf6b2.jpg\", \"https://yanxuan.nosdn.127.net/fa90fe5835c499154d63fa3a85749d5e.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('785', '1029005', '0', '还是不错的 很漂亮 不过价格也真的蛮贵的', '1', '1', '[\"http://yanxuan.nosdn.127.net/b9af549bff801596eea08b7cadfc33ca.png\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('786', '1029005', '0', '我觉得跟照片一样，没有色差，很漂亮，很舒服', '1', '1', '[\"http://yanxuan.nosdn.127.net/b501fd63bcbebae706f53512adf7e4e3.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('787', '1029005', '0', '很好的床品。感觉和纯棉的没有很大的区别。颜色不错，很喜欢。', '1', '1', '[\"http://yanxuan.nosdn.127.net/74c24d248c54bd59c3a2889e4eeb25a9.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('788', '1029005', '0', '非常不错，太舒服了', '1', '1', '[\"http://yanxuan.nosdn.127.net/99971f16173b839091795ff084895811.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('789', '1029005', '0', '比之前别人评价的颜色更和网上图片接近一些', '1', '1', '[\"http://yanxuan.nosdn.127.net/7198431f3033432f02cf051b0b16922b.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('790', '1029005', '0', '图片还是比较漂亮，体感还可以吧！', '1', '1', '[\"http://yanxuan.nosdn.127.net/f6374cebaf4a8c3569b7919b07ebf3ee.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('791', '1029005', '0', '面料舒服，手感柔和，做工精细，好!希望严选继续严选，提供更多质优价实的货品给买家。', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('792', '1029005', '0', '还没有开始用呢^_^', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('793', '1029005', '0', '质量真的很好', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('794', '1029005', '0', '颜色大爱     质感也不错    就是感觉好贵。。。', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('795', '1029005', '0', '比预想好。还可以的。', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('796', '1029005', '0', '水墨画的感觉，挺漂亮的，质地也舒服', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('797', '1029005', '0', '手感一流', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('798', '1029005', '0', '质感还是很不错的，颜色没有图片上的鲜艳～总体不错', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('799', '1029005', '0', '好，比便宜的滑一点', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('800', '1029005', '0', '非常舒服', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('801', '1029005', '0', '好', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('802', '1029005', '0', '很好', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('803', '1029005', '0', '颜色很漂亮 摸上去凉凉的', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('804', '1029005', '0', '不错', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('805', '1029005', '0', '好', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('806', '1029005', '0', '很不错，夏天特别合适，非常舒服', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('807', '1029005', '0', '颜色和手感都不错', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('808', '1029005', '0', '好', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('809', '1029005', '0', '今天开始使用，滑、软，不论是身体接触还是颜色，都喜欢', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('810', '1029005', '0', '冰冰的 很丝滑 适合夏天用', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('811', '1030001', '0', '虽然很长，包装很仔细。完全不用担心快递途中损坏，高端大气。羊毛的很有质感。', '1', '1', '[\"https://yanxuan.nosdn.127.net/2f79497bf891df4b1e80b38c3ffcece2.jpg\", \"https://yanxuan.nosdn.127.net/ff2ae826208f45fd2b2a72e2b62f3f9e.jpg\", \"https://yanxuan.nosdn.127.net/ef9a10ab35dc14a0ace6972f6de8a79c.jpg\", \"https://yanxuan.nosdn.127.net/325f815a4d141d47b129b7783fc5566a.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('812', '1030001', '0', '还不错。多拍了一块退货也挺积极的～', '1', '1', '[\"https://yanxuan.nosdn.127.net/3053c03b415a6c11d324b199027bc27d.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('813', '1030001', '0', '还不错。', '1', '1', '[\"https://yanxuan.nosdn.127.net/c6ef20cd6a48735c666b33b1b9f4c04f.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('814', '1030001', '0', '还可以，喜欢', '1', '1', '[\"https://yanxuan.nosdn.127.net/318b45d885ca1ec7164f3772b353a1f3.jpg\", \"https://yanxuan.nosdn.127.net/e3a917edd481b0cbd43d595ed1cf3359.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('815', '1030001', '0', '地毯不错，厚实，没啥异味，不适合光脚。', '1', '1', '[\"https://yanxuan.nosdn.127.net/7b8a275bb7b1d0bd3e46fa31792d3eed.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('816', '1030001', '0', '还未使用，但已屯货。', '1', '1', '[\"https://yanxuan.nosdn.127.net/b969bd9868cac8b8f7a8f2351fb905a4.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('817', '1030001', '0', '正合适，质量不错', '1', '1', '[\"https://yanxuan.nosdn.127.net/c040519ed5837697873bc3b5865ff9ec.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('818', '1030001', '0', '书房用，没有特意拍照片。', '1', '1', '[\"https://yanxuan.nosdn.127.net/612f864bd517838d2557087da58ef449.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('819', '1030001', '0', '好看，且非常厚实，满意。', '1', '1', '[\"https://yanxuan.nosdn.127.net/c460a8ec1823a70b6c9961ce4f845ee2.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('820', '1030001', '0', '地毯厚度约一公分 拆封时有点淡淡的羊膻味 赤脚踩上去感觉有点糙 很满意', '1', '1', '[\"https://yanxuan.nosdn.127.net/fafae471e228da34674aa87c2ade2f72.jpg\", \"https://yanxuan.nosdn.127.net/08f900afdd6ad904814e43b663f9436f.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('821', '1030001', '0', '棕色不明显啊', '1', '1', '[\"https://yanxuan.nosdn.127.net/2287477c1dfcd1ec4e6ffe41fc9af67e.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('822', '1030001', '0', '手感不错，花纹跟看起来不一样，是格纹的', '1', '1', '[\"https://yanxuan.nosdn.127.net/df783bf33034094085d9e3339fecee72.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('823', '1030001', '0', '非常划算，很重，不是特别厚的款式，稍微有点味道，晾了两天就好了，非常满意！', '1', '1', '[\"http://yanxuan.nosdn.127.net/36f0f0daac56f48ddf68db0de836f9f5.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('824', '1030001', '0', '非常喜欢，简单朴素，平时扫地机器人就能够打理', '1', '1', '[\"https://yanxuan.nosdn.127.net/5d64118e8e9cd7a5e21e202b74519d54.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('825', '1030001', '0', '很好，超值', '1', '1', '[\"https://yanxuan.nosdn.127.net/6c43f5a8b46bafb538ab3edbe39973e0.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('826', '1030001', '0', '等我把画一挂，有木有很完美，哈哈！想入手好久的地毯，一直没舍得，趁着活动入手，感觉还是买贵了…考拉才785，打折便宜有560买的，我花�', '1', '1', '[\"https://yanxuan.nosdn.127.net/c048754ce8df7c349e3ecd9da447541a.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('827', '1030001', '0', '不错，很厚实，没有想象中那么扎，铺在卧室瞬间幸福感提升', '1', '1', '[\"http://yanxuan.nosdn.127.net/a046988f58b30ca8c85418c773dd36f2.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('828', '1030001', '0', '好 最好有更大的', '1', '1', '[\"http://yanxuan.nosdn.127.net/87ae5aa545acd4aad83196321d998466.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('829', '1030001', '0', '还用说么？看图……严选脑残粉，不多说了，赞', '1', '1', '[\"http://yanxuan.nosdn.127.net/c861524983d483a940e7f9f0d5533694.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('830', '1030001', '0', '不错~挺厚的~性价比高~有点儿味儿，希望过几天就好了~', '1', '1', '[\"http://yanxuan.nosdn.127.net/40aa13edb134d75adccd955d61191fac.jpg\", \"http://yanxuan.nosdn.127.net/a19c2a0e56f1fda17155f024dd6edec0.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('831', '1030001', '0', '两块对接，铺在了客厅很合适。和图片不同，但是很好看。', '1', '1', '[\"http://yanxuan.nosdn.127.net/498b29a4fde8826560353a01a85d87f1.jpg\", \"http://yanxuan.nosdn.127.net/9a01b320bef853904c64cadca194c9fa.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('832', '1030001', '0', '总体效果还可以，仔细看应该不是全羊毛的，希望不要掉渣', '1', '1', '[\"http://yanxuan.nosdn.127.net/bcd59ba1375fc55b34e0c44499a87ea2.jpg\", \"http://yanxuan.nosdn.127.net/34e7e2a8fe9587b52a8aff3a8de1a9c0.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('833', '1030001', '0', '米色的！我的地砖是米色的！刚好配米色地毯！薄！两面都是一样的', '1', '1', '[\"http://yanxuan.nosdn.127.net/f272b8cae554ad4dccafe07858338a54.jpg\", \"http://yanxuan.nosdn.127.net/62e274fe5ce7ec08cb1c452869b12ad0.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('834', '1030001', '0', '家里的猫表示满意', '1', '1', '[\"http://yanxuan.nosdn.127.net/f40ca520b3783c406c3f124175d1339b.jpg\", \"http://yanxuan.nosdn.127.net/de71f77e64c5249724feb3b3c6df4b5f.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('835', '1030001', '0', '跟沙发很搭', '1', '1', '[\"http://yanxuan.nosdn.127.net/cdc89f079d96bd5edc92db11c03bc4d5.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('836', '1030001', '0', '还成', '1', '1', '[\"http://yanxuan.nosdn.127.net/24005064eb747cf88c727926e296a4b1.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('837', '1030001', '0', '质地不错。颜色搭配地板在也可以，不过可能略深了', '1', '1', '[\"http://yanxuan.nosdn.127.net/aa36bd32c6aafcd2c7d07bb975664521.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('838', '1030001', '0', '刚收到货，包装好，看上去不错，双十一三天到的货。', '1', '1', '[\"http://yanxuan.nosdn.127.net/7b5fd267b222ebaa942c20f1f4433d30.jpg\", \"http://yanxuan.nosdn.127.net/855c6e8e34a66fcffdba04155bc662c2.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('839', '1030001', '0', '地毯不错，赶在双十一期间买的，支持网易严选！', '1', '1', '[\"http://yanxuan.nosdn.127.net/c0755383bcb4f621bf90cfce50eb512f.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('840', '1030001', '0', '地毯没有打开，看上去很不错。我已经爱上网易了', '1', '1', '[\"http://yanxuan.nosdn.127.net/56d754e102babbf3089811fc8824fd95.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('841', '1030002', '0', '不错呦', '1', '1', '[\"https://yanxuan.nosdn.127.net/7bb3b32966993aacd903b2f24466cae5.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('842', '1030002', '0', '妥妥的用上了，还拍了照片，绝美背景墙。', '1', '1', '[\"https://yanxuan.nosdn.127.net/275eda2f67b16f91180197746be05ffb.jpg\", \"https://yanxuan.nosdn.127.net/3e9e44ddd976ca68d2dfce46b47cff17.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('843', '1030002', '0', '脚感很厚，效果不错。', '1', '1', '[\"https://yanxuan.nosdn.127.net/e35f1e24822d0c7458a40acdcd45ca7f.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('844', '1030002', '0', '客厅用，没有特意拍照片。', '1', '1', '[\"https://yanxuan.nosdn.127.net/07e03eee27c2563b3e90fcee8d672990.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('845', '1030002', '0', '买了两块，把自己的房间装饰成这样的样子，很满意^_^', '1', '1', '[\"https://yanxuan.nosdn.127.net/994a35a72e099f986158cf531a3a618e.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('846', '1030002', '0', '貌美', '1', '1', '[\"https://yanxuan.nosdn.127.net/0c2490962517aa6ea8c5e6432b92f7f7.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('847', '1030002', '0', '地毯质量比想象中的还要好，很厚实，比我之前淘宝里买的好太多了，还送了个收纳架。', '1', '1', '[\"http://yanxuan.nosdn.127.net/eeb5f9d76d341e1671305d813d9d39c6.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('848', '1030002', '0', '厚实，喜欢，淘宝的两三百跟这个完全无法比', '1', '1', '[\"https://yanxuan.nosdn.127.net/a53d6f7b860dcb6952ef30a494bc1c4e.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('849', '1030002', '0', '这个很美，本来想买折扣大的那款，可是看评价怕札脚还是选了这个，大爱啊！', '1', '1', '[\"http://yanxuan.nosdn.127.net/83c871636070b26e4e61b476da9c31fb.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('850', '1030002', '0', '棉质底的羊毛毯生态值很高哦！感谢印度！感谢严选！', '1', '1', '[\"http://yanxuan.nosdn.127.net/c186af83f0cb31bc9aabc06389e57e24.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('851', '1030002', '0', '还不错，由于墙面是弧形铺不到位实在是没法', '1', '1', '[\"http://yanxuan.nosdn.127.net/55dad2cbefa4ed317015664bc57ee145.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('852', '1030002', '0', '很好', '1', '1', '[\"http://yanxuan.nosdn.127.net/85e4b5add3a613eeb6311177dbcab51c.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('853', '1030002', '0', '光脚踩着没有很扎还是蛮舒服的', '1', '1', '[\"http://yanxuan.nosdn.127.net/d4bc6beaeb7514ad2d42dcc5b3134484.jpg\", \"http://yanxuan.nosdn.127.net/a0a6d1cc8be2c17c48bc855bb812b674.jpg\", \"http://yanxuan.nosdn.127.net/e51ca1b85413f5539a60c0535d2f6d42.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('854', '1030002', '0', '质量很好', '1', '1', '[\"http://yanxuan.nosdn.127.net/2c1643dfe3bdbe2a446ec57d4f4aa0a3.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('855', '1030002', '0', '感觉不错，好看也耐脏', '1', '1', '[\"http://yanxuan.nosdn.127.net/9b0462e86060217e56bcfdc9ffc446ef.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('856', '1030002', '0', '非常好看', '1', '1', '[\"http://yanxuan.nosdn.127.net/82ce49069472c58af5efe1ea8bf8b9db.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('857', '1030002', '0', '地毯厚度合适 ，颜色喜欢 ，没有掉毛的情况而且没有异味，整体很满意', '1', '1', '[\"http://yanxuan.nosdn.127.net/1c21a8a68e8d23997fcc45eaf9b88905.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('858', '1030002', '0', '很不错，家人都很喜欢！', '1', '1', '[\"http://yanxuan.nosdn.127.net/1403f2c969126cbe037116a6a81b4015.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('859', '1030002', '0', '确实很大骚味，如果躺在上面。身高超过一米的站起来闻不到。猫狗略有不爱', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('860', '1030002', '0', '这个真的不能更赞了！！！颜色和我家沙发超级配，也没有出现评论里掉毛神马的现象，老公特别特别喜欢！', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('861', '1030002', '0', '特别舒服，美，踩在上面软软的，限时特惠买下来的，价格也好给力，开心喜欢值得入手', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('862', '1030002', '0', '刚开始觉得羊毛的味道太重了 后来多通通风就好了 颜色什么的都挺好看的', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('863', '1030002', '0', '开始有一点点掉毛，不过地毯很厚重几乎也没什么味道，总的来说，严选这次没有让我失望。', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('864', '1030002', '0', '还行 就是猫子爱在上面抓来抓去当猫抓板', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('865', '1030002', '0', '还好，冲着印度手工生产去，', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('866', '1030002', '0', '好', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('867', '1030002', '0', '好', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('868', '1030002', '0', '非常好！', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('869', '1030002', '0', '挺好的，没有多少气味，是真羊毛。', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('870', '1030002', '0', '不错', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('871', '1030003', '0', '特别特别好看！！！价格真的很划算', '1', '1', '[\"https://yanxuan.nosdn.127.net/8c2d79eafce30b33981623b5602764db.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('872', '1030003', '0', '大爱啊！发货很快！宝贝惊艳了！喜欢的颜色和花色，立体感强！有一点儿羊毛的味儿，应该凉凉就好了', '1', '1', '[\"https://yanxuan.nosdn.127.net/0a4cf3b05d448fe3eab0b27780f8c187.jpg\", \"https://yanxuan.nosdn.127.net/64758242eba35c7a877ee002b8c209a6.jpg\", \"https://yanxuan.nosdn.127.net/ead4aee12a369b84288051c3c6000483.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('873', '1030003', '0', '物流在过年期间也顺利达到！点赞！实物颜色无偏差！就是这种纯羊地毯手感毛会有些扎', '1', '1', '[\"https://yanxuan.nosdn.127.net/aa79c0bd1fd09987e0c39dac814c1c64.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('874', '1030003', '0', '超喜欢！淘宝同款要贵好几百呢！另外给快递小哥点赞，春节期间还给我送货！', '1', '1', '[\"https://yanxuan.nosdn.127.net/78ac06394b23de5e513919e41eccb3e9.jpg\", \"https://yanxuan.nosdn.127.net/b76613c7c826ce002bd1c8fd14bd0a2e.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('875', '1030003', '0', '新房子还没拿出来用，囤着的，就是信赖严选。', '1', '1', '[\"https://yanxuan.nosdn.127.net/3f87b2886be7b41ff2bbcf0ccddb947d.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('876', '1030003', '0', '质感非常好，送给爸妈的小礼物，满意！', '1', '1', '[\"https://yanxuan.nosdn.127.net/15fa1943125e2e137c9064ac90dc1866.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('877', '1030003', '0', '完美契合家里的配色，踩上去也不是很扎人，一家人包括猫主子都很喜欢。', '1', '1', '[\"https://yanxuan.nosdn.127.net/b32f86638f2fd142256068f2ac3c1961.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('878', '1030003', '0', '不错', '1', '1', '[\"https://yanxuan.nosdn.127.net/170ffe4237c3e60cf6f1ad67bc6a3dc5.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('879', '1030003', '0', '搬新家准备的，严选的超级粉丝了，要剁手的节奏', '1', '1', '[\"https://yanxuan.nosdn.127.net/34e5d442c699c3b7f7e8b47a75dd352c.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('880', '1030003', '0', '好看！', '1', '1', '[\"https://yanxuan.nosdn.127.net/af59bf890bcbe03f1319702ca2b422cd.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('881', '1030003', '0', '客厅沙发搭配中，靠地毯来补救，协调了一下。挺好！试铺了一下，不滑。', '1', '1', '[\"https://yanxuan.nosdn.127.net/a92cfa969a468ff2145e31c0683693f4.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('882', '1030003', '0', '效果不错', '1', '1', '[\"https://yanxuan.nosdn.127.net/21eeacf0f39aaf8ae7716a457d4b7f1a.jpg\", \"https://yanxuan.nosdn.127.net/d7202fa92aaa88f60c7927803633bfe7.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('883', '1030003', '0', '还没蒲，打算到了天气转暖时，把家弄干净妥妥滴铺上保鲜膜，再铺地毯。', '1', '1', '[\"http://yanxuan.nosdn.127.net/4cfb39eb0b927e00621011c54a6b951b.png\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('884', '1030003', '0', '还行，价格更美丽就好了，就是不知道日后咋清洗。', '1', '1', '[\"https://yanxuan.nosdn.127.net/457043886189b21710a4922cf3cc4841.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('885', '1030003', '0', '颜色偏暗，看起来脏脏的感觉', '1', '1', '[\"https://yanxuan.nosdn.127.net/e35e6096f55159e96a179feb3512bb93.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('886', '1030003', '0', '这个是我喜欢的款式，非常满意', '1', '1', '[\"https://yanxuan.nosdn.127.net/11f78c67c1a3959310ded640591a8172.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('887', '1030003', '0', '不错', '1', '1', '[\"https://yanxuan.nosdn.127.net/4f97a5727a3712d580edfdd95592603d.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('888', '1030003', '0', '地毯很赞噢，踩着感觉不是很渣，有没有什么味道，与家里的瓷砖和家具也很搭，总体上非常喜欢，如果尺寸能再大点就更好了。', '1', '1', '[\"https://yanxuan.nosdn.127.net/d638aa55a696467effbf481b53c58fac.jpg\", \"https://yanxuan.nosdn.127.net/15bd39cc0aeb8d25401e3af19a1d3720.jpg\", \"https://yanxuan.nosdn.127.net/b1301a3efdb5fa1650c4169b0e9a606a.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('889', '1030003', '0', '好看，跟家里很搭呢，后悔当时而且赶上了特价很划算', '1', '1', '[\"https://yanxuan.nosdn.127.net/90a5c9028839b67b067613928aadceb7.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('890', '1030003', '0', '漂亮，还没放沙发，所以显得有点小，其实还好，当上沙发应该正好吧', '1', '1', '[\"http://yanxuan.nosdn.127.net/edf3d1345b3c091015e64651222e0d47.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('891', '1030003', '0', '棒棒哒 配白色地板超有感觉 薄薄的 摸上有点渣 但脚踩上去不觉得 边角会有点小滑 如果反面能防滑那就更完美啦', '1', '1', '[\"http://yanxuan.nosdn.127.net/7b31bf2e3df8a241ea8a7da372b9402c.jpg\", \"http://yanxuan.nosdn.127.net/a8a66f882b60538ba55a23b5aa09ece4.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('892', '1030003', '0', '不错', '1', '1', '[\"http://yanxuan.nosdn.127.net/822074577bb1bb822c9a021c502dcb8b.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('893', '1030003', '0', '不是特别扎，颜色如图，配灰色地砖很好看~~严选的东西虽然稍微贵一点点，但是收到后从不会失望，不像某些……精挑细选总是和描述差别太多', '1', '1', '[\"http://yanxuan.nosdn.127.net/1ab41f9e615b88b0784225cbdfd9c0d6.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('894', '1030003', '0', '双十一买下了一个家，图中地毯尚未打开', '1', '1', '[\"http://yanxuan.nosdn.127.net/8df06db908d81bff38b8689ec68ab714.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('895', '1030003', '0', '稍微薄了点，不过总体很棒', '1', '1', '[\"http://yanxuan.nosdn.127.net/42008c255804d6e0f06f31744a1e22ee.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('896', '1030003', '0', '棒棒棒', '1', '1', '[\"http://yanxuan.nosdn.127.net/1cc43a6771511e760b983e0a52b30dec.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('897', '1030003', '0', '颜色稍暗，做旧感，总体不错', '1', '1', '[\"http://yanxuan.nosdn.127.net/7df109e1a62f0fe6b8afbef55e24b3fb.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('898', '1030003', '0', '不错，好看，做过精细～支持网易严选', '1', '1', '[\"http://yanxuan.nosdn.127.net/1cc84f5e4016d2b9b83ca1d77c7d860c.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('899', '1030003', '0', '照片一拍都很艳丽，但是实物很灰黯，地毯厚实', '1', '1', '[\"http://yanxuan.nosdn.127.net/dbe3d7a2091ab13b715c4825f50d5a05.jpg\", \"http://yanxuan.nosdn.127.net/cbee7f9389c280a11dbf3ae5bb8ad0e7.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('900', '1030003', '0', '有点扎。但很好啦很喜欢^_^', '1', '1', '[\"http://yanxuan.nosdn.127.net/e6be3da1ff67bf4111c569fa8c47ac43.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('901', '1181000', '0', '太好了，舒服的不得了，腰，腿，脊柱，头，颈椎！\n无一处不舒服，真没想到这么优惠！\n搬了新家还要买！', '1', '1', '[\"https://yanxuan.nosdn.127.net/5fe1121396458cfe0dc1b25ec86f7ff9.jpg\", \"https://yanxuan.nosdn.127.net/d5a55abd6ced5c811d775b04929aaabc.jpg\", \"https://yanxuan.nosdn.127.net/f1764d820ba6ddaf51d297e3cf3826cd.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('902', '1181000', '0', '抱着试试的态度 先买了小的 果然感觉很舒服 深陷其中 把自己全身心都给了它 第二个床垫已经在路上', '1', '1', '[\"https://yanxuan.nosdn.127.net/f753f91430dfb56f574c737d4b2fde46.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('903', '1181000', '0', '这个床垫现在垫上去之后舒服多了，软软的，弹性不错，你们睡硬床板的考虑一下呗？', '1', '1', '[\"https://yanxuan.nosdn.127.net/556cb7799b8218db00c3a65241e0f92b.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('904', '1181000', '0', '弹性挺好！软硬适中，气味不大！八五折还是挺优惠的！主要是中毒严选了！', '1', '1', '[\"https://yanxuan.nosdn.127.net/f3376d3767e3cd7a899773d680189d37.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('905', '1181000', '0', '大小合适，厚度也正好。很适合放踏踏米使用，床垫很软比一般的床垫好太多了，不知道夏天睡觉会不会热', '1', '1', '[\"https://yanxuan.nosdn.127.net/9f835306fae8b851a834cc904630a5b3.jpg\", \"https://yanxuan.nosdn.127.net/5ef2a535450ae53897ac7700912c3b42.jpg\", \"https://yanxuan.nosdn.127.net/c2fedbb59dc123a23c9521076848d0dc.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('906', '1181000', '0', '尺寸刚好，很舒服，味道不算太重，需要吹吹风', '1', '1', '[\"https://yanxuan.nosdn.127.net/f45ad4b14d9da7e3093e5c3b4d036753.jpg\", \"https://yanxuan.nosdn.127.net/a3ee0882bc45fb2caa264a90975f856b.jpg\", \"https://yanxuan.nosdn.127.net/1ea4c31b4ee206c04a49da856f0fe677.jpg\", \"https://yanxuan.nosdn.127.net/93d17fbea0a17301bf9c6433199dcb0b.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('907', '1181000', '0', '晾味中，质感不错。软，但是支撑够。', '1', '1', '[\"https://yanxuan.nosdn.127.net/05e880ce4068ca33e53e191185fb811f.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('908', '1181000', '0', '非常不错的床垫，第二个了', '1', '1', '[\"https://yanxuan.nosdn.127.net/cee78b5874dc15f3f4711e3b220cfafd.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('909', '1181000', '0', '很舒服的床垫 非常满意 对比了好多家还是选了这一款', '1', '1', '[\"https://yanxuan.nosdn.127.net/67370cdb21d9ff8c1bb4ed2dae87a5c3.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('910', '1181000', '0', '刚刚买个1.5的睡觉挺舒服！再入手一个1.8的，慢回弹很不错！躺在上面有些漂浮的感觉，腰下不感觉空，值得拥有！', '1', '1', '[\"https://yanxuan.nosdn.127.net/8e474c5d740ef49115c7f0572ac8ea31.jpg\", \"https://yanxuan.nosdn.127.net/75ba158e6f8c5f62413707082d9cf8ae.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('911', '1181000', '0', '不错', '1', '1', '[\"https://yanxuan.nosdn.127.net/cdb53b25adba61ea490ce9ec84b159b3.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('912', '1181000', '0', '最开始我老婆还很不理解，家里有床垫为什么还要买，体验完的第一天就觉得很舒服。还让我给她爸也买一个…', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('913', '1181000', '0', '舒服的不行', '1', '1', '[\"https://yanxuan.nosdn.127.net/43fdb1502679c50f6aa09acfb24cdfe3.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('914', '1181000', '0', '严选粉', '1', '1', '[\"https://yanxuan.nosdn.127.net/db13b4127fd18a55c6e401be96ba877a.jpg\", \"https://yanxuan.nosdn.127.net/ae1c1dd61cdbfc8ffe68bba8479c1d1e.jpg\", \"https://yanxuan.nosdn.127.net/d09e0a2ad05ea9c5600f92fd612726b8.jpg\", \"https://yanxuan.nosdn.127.net/e86109c6c174a3901dffaa8787f6cb72.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('915', '1181000', '0', '挺舒服，需要放放味，以为包裹很轻，没想到那么沉', '1', '1', '[\"https://yanxuan.nosdn.127.net/0c540031d15549707903f616c150b9fc.jpg\", \"https://yanxuan.nosdn.127.net/029881404b69292f7c502379db227d9a.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('916', '1181000', '0', '没什么味道，晾了两天，就迫不及待地铺上了。软软的，很舒服，性价比超高，商场里要一万多呢', '1', '1', '[\"http://yanxuan.nosdn.127.net/0efd8cd4dd510844333671fc60f19734.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('917', '1181000', '0', '很喜欢', '1', '1', '[\"https://yanxuan.nosdn.127.net/2b93c0d0d194e3fb09fa5d43b949a3d9.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('918', '1181000', '0', '严选床垫真心不错，很厚实，还带了质量超赞的套子，双十一八折真心赞', '1', '1', '[\"http://yanxuan.nosdn.127.net/a87adeaa315060be6c5c6d7bb3a6b203.jpg\", \"http://yanxuan.nosdn.127.net/6d8a8f800ccd811ff770a2c6c75545eb.jpg\", \"http://yanxuan.nosdn.127.net/a2746d61dae1f250ffd79fc73ec221ce.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('919', '1181000', '0', '早上不想起床有木有', '1', '1', '[\"http://yanxuan.nosdn.127.net/d18f3783f352afee5ff78af88940df22.jpg\", \"http://yanxuan.nosdn.127.net/814d347fdca2087cb8b12abd334c1c23.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('920', '1181000', '0', '非常好，散了一下味就睡上了。第二天睡完后腰很舒服，但是觉得自己可能需要换个枕头', '1', '1', '[\"http://yanxuan.nosdn.127.net/b8c4879ffc89318aea3fbf8f20a126ef.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('921', '1181000', '0', '不错，没什么味道躺了试了下很舒服，决定再跟孩子买一个，好评！', '1', '1', '[\"http://yanxuan.nosdn.127.net/5091f0f6ae132a2f3cece0619ee9ea0d.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('922', '1181000', '0', '刚收到 有重量！', '1', '1', '[\"http://yanxuan.nosdn.127.net/525c0db54abb9f496b8dca944963a18e.jpg\", \"http://yanxuan.nosdn.127.net/b3ef54154c756043c23ae027251a5b5d.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('923', '1181000', '0', '还没用呢，不过我相信网易严选的质量', '1', '1', '[\"http://yanxuan.nosdn.127.net/9f63b36112e51106414b8aa14b1e1073.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('924', '1181000', '0', '真心不错，比较舒适的选择', '1', '1', '[\"http://yanxuan.nosdn.127.net/c78e6a9e8afdf38f20cd54831327236d.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('925', '1181000', '0', '正在晾味，蛮厚重，感觉不错', '1', '1', '[\"http://yanxuan.nosdn.127.net/b294a2c44e67b4e616b484684d0a472d.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('926', '1181000', '0', '超级舒服', '1', '1', '[\"http://yanxuan.nosdn.127.net/6f85c85e3926e1a1e20dd5a4f5b1296a.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('927', '1181000', '0', '自己去快递点取得 累尿了。', '1', '1', '[\"http://yanxuan.nosdn.127.net/0c40f1b1de316fe3bf34462d222d4fc6.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('928', '1181000', '0', '很舒服 房东给了我一破床垫，再加上这个，躺着就舒服了，非常满意！', '1', '1', '[\"http://yanxuan.nosdn.127.net/a6e7b13576b56af9d0868c94d4130d69.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('929', '1181000', '0', '好重的份量，回弹快。打开时有点味，通风2天就好了', '1', '1', '[\"http://yanxuan.nosdn.127.net/a1bc975c41d14de42a5e751fb1f9a69f.jpg\", \"http://yanxuan.nosdn.127.net/5b95705cb60e8a884cf0de925938159d.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('930', '1181000', '0', '非常非常舒服，第一次在严选买东西，真的很好！！！睡上去很舒服！', '1', '1', '[\"http://yanxuan.nosdn.127.net/e9955c289e13c8b54d2c10cc59a97a5c.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('931', '1181000', '0', '挺厚的，刚打开会有点味，放两天就好了，躺在上面很软很舒服，性价比高', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('932', '1181000', '0', '挺厚的，刚打开会有点味，放两天就好了，躺在上面很软很舒服', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('933', '1181000', '0', '同事给推荐的严选，第一次购物貌似还不错！等新家收拾好再打开用吧', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('934', '1181000', '0', '很柔软，有漂浮感，太好睡了，就是有点热热的，质量很棒，包的套都很重', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('935', '1181000', '0', '感觉特别好，物美价廉，到货当天下午散了散味道，晚上就用了。感觉味道不大，很舒服，特别是腰部支撑好。', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('936', '1181000', '0', '送货挺及时，床垫是朋友推荐的说很好我就买了，看上去不错，下去铺上试试看。', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('937', '1181000', '0', '已经用了两个月了，贴合身体曲线，回弹很好，早上起来不再腰酸背疼了！很棒的床垫，强推！', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('938', '1181000', '0', '高品质的网易严选表现，高逼格的包装，文艺范的表现，实在耐用的使用性质，推荐，推荐哦', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('939', '1181000', '0', '不错啊，稍微有点味道，放了两天就OK了，躺上去很舒服，第一次在网易购物，送货很快，性价比很高', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('940', '1181000', '0', '睡在上面特别实在，身体的每个部位都被托着。老公说睡醒后身上再不会有酸痛了。于是再次回购。', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('941', '1181000', '0', '我一个女孩子，说实话，套套子的时候有点费劲，床垫挺沉的，不过睡着是真舒服，也没什么异味，不想起床', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('942', '1181000', '0', '这个记忆棉床垫我觉得还不错，比一般的床垫舒服，比较贴合身体能够给予足够的支撑。', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('943', '1181000', '0', '味道放了一周，不错了', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('944', '1181000', '0', '昨晚铺上床，试睡了一下，真的太舒服了，严选的东西真的是物美价廉！', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('945', '1181000', '0', '这个床单强烈推荐，十周年800元。\n睡着非常舒服，家里有榻榻米的可以考虑下。', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('946', '1181000', '0', '不错，这种慢性回弹刚躺上去不习惯，但醒来后不会有腰背酸痛。', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('947', '1181000', '0', '不好意思，早就收到货了，一直忘了确认！茶香很正！睡时间长腰疼~总体不错！', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('948', '1181000', '0', '抱歉，第一次被严选伤害到。收到床垫很快还蛮开心的的，看了说明书说散散味再用，放了两天可能正好遇到阴雨天吧，也没有暴晒。也可能房间小，不够通风。今早醒来头晕目眩，上吐下泻，俨然一副中毒的迹象。真心第一次被网易的产品给伤害，是不是碰上搞活动，产品质量把关不严了', '1', '1', '[\"https://yanxuan.nosdn.127.net/c4110c2c5355951cd1072ef50cb3d747.jpg\", \"https://yanxuan.nosdn.127.net/fe5793902da1d1c699b74b89246a2b36.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('949', '1181000', '0', '不错 就是味儿大', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('950', '1181000', '0', '收到货物时开箱一看，居然是这样。被刮开了一个口子。心疼。想要退货，联系客服还没人理。。。\n这种体验真的不好', '1', '1', '[\"https://yanxuan.nosdn.127.net/4ac4120ce2686db84fd0147a53497f5a.jpg\", \"https://yanxuan.nosdn.127.net/fb39c5ecdb034a4a9444fa84c6916fe8.jpg\"]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('951', '1181000', '0', '晾咯两天才没有味道，真的很舒服，感觉整个身体都会被贴合的很好，买的很值，第一次买严选很值！！！！！！', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('952', '1181000', '0', '一开始有味道，放了一个礼拜就好了，挺舒服的，性价比不错。', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('953', '1181000', '0', '还没打开使用，但是看能卷起来小小的一盒，就很喜欢，方便携带', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('954', '1181000', '0', '比预想的还要好，铺在榻榻米垫上睡觉舒适感提升', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('955', '1181000', '0', '就是味道很大  很舒服', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('956', '1181000', '0', '非常棒，用了几个月来评价的。网易的整体包装杠杠的，这个垫子睡的也舒服。比较贴身，不会有感觉酸酸的地方。', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('957', '1181000', '0', '刚到！凉几天再说！味道有点重！', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('958', '1181000', '0', '很好，很舒服，不知道时间长了会不会睡薄！', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('959', '1181000', '0', '还不错，不是很软很软的那种，承托性挺好', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('960', '1181000', '0', '睡起来很舒服，放在席梦思床垫上，腰部有支撑，只是味道真的很大！我在书房凉了三个半星期！睡上去之后还能隐隐闻到味道！希望没毒！', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('961', '1181000', '0', '买给爸爸的，中午自己体验了一下，非常舒服，弹性适中，', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('962', '1181000', '0', '非常好，还是活动的时候买的。性价比上天了！', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('963', '1181000', '0', '有点软，只能收起来了', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('964', '1181000', '0', '还不错，有点味道，放阳台吹下就好。', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('965', '1181000', '0', '比想象中好，够软可是承托力好，不会睡到腰痛', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('966', '1181000', '0', '还没用感觉不错！', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('967', '1181000', '0', '正品，没味道，质量不错', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('968', '1181000', '0', '很舒适的垫子', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('969', '1181000', '0', '质量灰常好', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('970', '1181000', '0', '挺好的', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('971', '1181000', '0', '不错', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('972', '1181000', '0', '不错…………', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('973', '1181000', '0', '不舒适，差评', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('974', '1181000', '0', '用后评价，刚打开味儿确实不小，晾了一周左右吧，味儿就散了，腰部贴合的很好，很舒服，不错。', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('975', '1181000', '0', '很舒服，就是夏天有点热', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('976', '1181000', '0', '打算再回购2床', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('977', '1181000', '0', '还没拆应该不错', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('978', '1181000', '0', '收到货到现在有十天了，怎么还没回弹啊。', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('979', '1181000', '0', '通风几天，已经没味道了，还不错', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('980', '1181000', '0', '非常舒服，用上马上感觉好多了，软但有支撑。非常棒。', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('981', '1181000', '0', '很好买的第三个', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('982', '1181000', '0', '睡着还不错', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('983', '1181000', '0', '第二次买了，很好，睡着舒服', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('984', '1181000', '0', '性价比很高', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('985', '1181000', '0', '尺寸刚刚好', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('986', '1181000', '0', '好', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('987', '1181000', '0', '一点点味道，还行，摸着手感不错，等睡过后再来追评', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('988', '1181000', '0', '一开始有些味道，需要多晾一阵。睡起来还不错，蛮舒服的', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('989', '1181000', '0', '外套不错，摸起来挺好', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('990', '1181000', '0', '很舒适 值得这个价格', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('991', '1181000', '0', '特别好。很舒适', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('992', '1181000', '0', '还没用', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('993', '1181000', '0', '床垫不错，相信网易', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('994', '314', '1', '是记忆棉 很满意', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('995', '314', '1', '很好的东西', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('996', '314', '1', '很舒服，有没有那么的软，不错！', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('997', '314', '1', '确实舒服，不过夏天会不会热啊？', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('998', '314', '1', '有点过软。等到夏季，上面直接铺凉席的话，不知道透气性会怎样？', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('999', '314', '1', '包装完好\n无异味\n厚度适中\n慢回弹\n\n我直接放置在地板上，当做孩子的爬爬垫使用，上面铺床单，便于洗涤。作为直接铺地板的，有一个问题就是是否透气，否则用了1个月，反面肯定是发霉的状态，等实际效果', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('1000', '314', '1', '东西挺好，为了脊柱而买', '1', '0', '[]', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_comment` VALUES ('1011', '1116011', '1', '烦烦烦', '1', '0', '[]', '1', '2018-11-09 19:24:20', '2018-11-09 19:24:20', '0');

-- ----------------------------
-- Table structure for litemall_coupon
-- ----------------------------
DROP TABLE IF EXISTS `litemall_coupon`;
CREATE TABLE `litemall_coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(63) NOT NULL COMMENT '优惠券名称',
  `desc` varchar(127) DEFAULT '' COMMENT '优惠券介绍，通常是显示优惠券使用限制文字',
  `tag` varchar(63) DEFAULT '' COMMENT '优惠券标签，例如新人专用',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '优惠券数量，如果是0，则是无限量',
  `discount` decimal(10,2) DEFAULT '0.00' COMMENT '优惠金额，',
  `min` decimal(10,2) DEFAULT '0.00' COMMENT '最少消费金额才能使用优惠券。',
  `limit` smallint(6) DEFAULT '1' COMMENT '用户领券限制数量，如果是0，则是不限制；默认是1，限领一张.',
  `type` smallint(6) DEFAULT '0' COMMENT '优惠券赠送类型，如果是0则通用券，用户领取；如果是1，则是注册赠券；如果是2，则是优惠券码兑换；',
  `status` smallint(6) DEFAULT '0' COMMENT '优惠券状态，如果是0则是正常可用；如果是1则是过期; 如果是2则是下架。',
  `goods_type` smallint(6) DEFAULT '0' COMMENT '商品限制类型，如果0则全商品，如果是1则是类目限制，如果是2则是商品限制。',
  `goods_value` varchar(1023) DEFAULT '[]' COMMENT '商品限制值，goods_type如果是0则空集合，如果是1则是类目集合，如果是2则是商品集合。',
  `code` varchar(63) DEFAULT NULL COMMENT '优惠券兑换码',
  `time_type` smallint(6) DEFAULT '0' COMMENT '有效时间限制，如果是0，则基于领取时间的有效天数days；如果是1，则start_time和end_time是优惠券有效期；',
  `days` smallint(6) DEFAULT '0' COMMENT '基于领取时间的有效天数days。',
  `start_time` datetime DEFAULT NULL COMMENT '使用券开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '使用券截至时间',
  `add_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='优惠券信息及规则表';

-- ----------------------------
-- Records of litemall_coupon
-- ----------------------------
INSERT INTO `litemall_coupon` VALUES ('1', '限时满减券', '全场通用', '无限制', '0', '5.00', '99.00', '1', '0', '0', '0', '[]', null, '0', '10', null, null, '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_coupon` VALUES ('2', '限时满减券', '全场通用', '无限制', '0', '10.00', '99.00', '1', '0', '0', '0', '[]', null, '0', '10', null, null, '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_coupon` VALUES ('3', '新用户优惠券', '全场通用', '无限制', '0', '10.00', '99.00', '1', '1', '0', '0', '[]', null, '0', '10', null, null, '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_coupon` VALUES ('8', '可兑换优惠券', '全场通用', '仅兑换领券', '0', '15.00', '99.00', '1', '2', '0', '0', '[]', 'DC6FF8SE', '0', '7', null, null, '2018-12-23 09:29:57', '2018-12-23 09:29:57', '0');

-- ----------------------------
-- Table structure for litemall_coupon_user
-- ----------------------------
DROP TABLE IF EXISTS `litemall_coupon_user`;
CREATE TABLE `litemall_coupon_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `coupon_id` int(11) NOT NULL COMMENT '优惠券ID',
  `status` smallint(6) DEFAULT '0' COMMENT '使用状态, 如果是0则未使用；如果是1则已使用；如果是2则已过期；如果是3则已经下架；',
  `used_time` datetime DEFAULT NULL COMMENT '使用时间',
  `start_time` datetime DEFAULT NULL COMMENT '有效期开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '有效期截至时间',
  `order_id` int(11) DEFAULT NULL COMMENT '订单ID',
  `add_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券用户使用表';

-- ----------------------------
-- Records of litemall_coupon_user
-- ----------------------------

-- ----------------------------
-- Table structure for litemall_feedback
-- ----------------------------
DROP TABLE IF EXISTS `litemall_feedback`;
CREATE TABLE `litemall_feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户表的用户ID',
  `username` varchar(63) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '用户名称',
  `mobile` varchar(20) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '手机号',
  `feed_type` varchar(63) NOT NULL DEFAULT '' COMMENT '反馈类型',
  `content` varchar(1023) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '反馈内容',
  `status` int(3) NOT NULL DEFAULT '0' COMMENT '状态',
  `has_picture` tinyint(1) DEFAULT '0' COMMENT '是否含有图片',
  `pic_urls` varchar(1023) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '图片地址列表，采用JSON数组格式',
  `add_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`),
  KEY `id_value` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='意见反馈表';

-- ----------------------------
-- Records of litemall_feedback
-- ----------------------------

-- ----------------------------
-- Table structure for litemall_footprint
-- ----------------------------
DROP TABLE IF EXISTS `litemall_footprint`;
CREATE TABLE `litemall_footprint` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户表的用户ID',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '浏览商品ID',
  `add_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户浏览足迹表';

-- ----------------------------
-- Records of litemall_footprint
-- ----------------------------

-- ----------------------------
-- Table structure for litemall_goods
-- ----------------------------
DROP TABLE IF EXISTS `litemall_goods`;
CREATE TABLE `litemall_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_sn` varchar(63) NOT NULL DEFAULT '' COMMENT '商品编号',
  `name` varchar(127) NOT NULL DEFAULT '' COMMENT '商品名称',
  `category_id` int(11) DEFAULT '0' COMMENT '商品所属类目ID',
  `brand_id` int(11) DEFAULT '0',
  `gallery` varchar(1023) DEFAULT NULL COMMENT '商品宣传图片列表，采用JSON数组格式',
  `keywords` varchar(255) DEFAULT '' COMMENT '商品关键字，采用逗号间隔',
  `brief` varchar(255) DEFAULT '' COMMENT '商品简介',
  `is_on_sale` tinyint(1) DEFAULT '1' COMMENT '是否上架',
  `sort_order` smallint(4) DEFAULT '100',
  `pic_url` varchar(255) DEFAULT NULL COMMENT '商品页面商品图片',
  `share_url` varchar(255) DEFAULT NULL COMMENT '商品分享朋友圈图片',
  `is_new` tinyint(1) DEFAULT '0' COMMENT '是否新品首发，如果设置则可以在新品首发页面展示',
  `is_hot` tinyint(1) DEFAULT '0' COMMENT '是否人气推荐，如果设置则可以在人气推荐页面展示',
  `unit` varchar(31) DEFAULT '’件‘' COMMENT '商品单位，例如件、盒',
  `counter_price` decimal(10,2) DEFAULT '0.00' COMMENT '专柜价格',
  `retail_price` decimal(10,2) DEFAULT '100000.00' COMMENT '零售价格',
  `detail` text COMMENT '商品详细介绍，是富文本格式',
  `add_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`),
  KEY `goods_sn` (`goods_sn`),
  KEY `cat_id` (`category_id`),
  KEY `brand_id` (`brand_id`),
  KEY `sort_order` (`sort_order`)
) ENGINE=InnoDB AUTO_INCREMENT=1009011 DEFAULT CHARSET=utf8mb4 COMMENT='商品基本信息表';

-- ----------------------------
-- Records of litemall_goods
-- ----------------------------
INSERT INTO `litemall_goods` VALUES ('1006002', '1006002', '轻奢纯棉刺绣水洗四件套', '1036005', '1024000', '[\"http://yanxuan.nosdn.127.net/4eb09e08ac9de543d2291d27a6be0b54.jpg\",\"http://yanxuan.nosdn.127.net/0c9eb81c7594dbe42802ff1ebbece51a.jpg\",\"http://yanxuan.nosdn.127.net/8cfc7b6bfd28687ab3399da08e5ba61b.jpg\",\"http://yanxuan.nosdn.127.net/b98cfd7f197b62abd1679321eae253a6.jpg\"]', '', '设计师原款，精致绣花', '1', '23', 'http://yanxuan.nosdn.127.net/8ab2d3287af0cefa2cc539e40600621d.png', '', '0', '0', '件', '919.00', '899.00', '<p><img src=\"http://yanxuan.nosdn.127.net/2597f9e2e41093f50761837eb4c2e6be.jpg\" _src=\"http://yanxuan.nosdn.127.net/2597f9e2e41093f50761837eb4c2e6be.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/4377adc892bf9d16f9d0fd78f88a6986.jpg\" _src=\"http://yanxuan.nosdn.127.net/4377adc892bf9d16f9d0fd78f88a6986.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/986bd3a7517a356265049443cbb747d9.jpg\" _src=\"http://yanxuan.nosdn.127.net/986bd3a7517a356265049443cbb747d9.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/5cdf3958b3a8d9982b879e3fea1fd616.jpg\" _src=\"http://yanxuan.nosdn.127.net/5cdf3958b3a8d9982b879e3fea1fd616.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/47e5be34ef476258f44f307982c705d4.jpg\" _src=\"http://yanxuan.nosdn.127.net/47e5be34ef476258f44f307982c705d4.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/a2220e4cbb5ebc49e9cecb64176983d9.jpg\" _src=\"http://yanxuan.nosdn.127.net/a2220e4cbb5ebc49e9cecb64176983d9.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/dee62e466465b370c349e37fccd3b596.jpg\" _src=\"http://yanxuan.nosdn.127.net/dee62e466465b370c349e37fccd3b596.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/c021b91f965ac022182eb03b2780e5de.jpg\" _src=\"http://yanxuan.nosdn.127.net/c021b91f965ac022182eb03b2780e5de.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/b9f7afd9441928d7f670fd7879ba869d.jpg\" _src=\"http://yanxuan.nosdn.127.net/b9f7afd9441928d7f670fd7879ba869d.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/8a73b69a2fefbd154a2a6ad45102b565.jpg\" _src=\"http://yanxuan.nosdn.127.net/8a73b69a2fefbd154a2a6ad45102b565.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/5836d918faa9b11eb8d9f97f9787cda9.jpg\" _src=\"http://yanxuan.nosdn.127.net/5836d918faa9b11eb8d9f97f9787cda9.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/8216a8addae2f02a5a570ef45d5ecffc.jpg\" _src=\"http://yanxuan.nosdn.127.net/8216a8addae2f02a5a570ef45d5ecffc.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/da382973dcb0e524a36519baab880204.jpg\" _src=\"http://yanxuan.nosdn.127.net/da382973dcb0e524a36519baab880204.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/f1c6e84d49f74e228bc57934ec7b7500.jpg\" _src=\"http://yanxuan.nosdn.127.net/f1c6e84d49f74e228bc57934ec7b7500.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/2f1d0a20e54d3e2e59a44ffe44ebe405.jpg\" _src=\"http://yanxuan.nosdn.127.net/2f1d0a20e54d3e2e59a44ffe44ebe405.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/a39f2c7580ce5cadc62e8b39d58aca71.jpg\" _src=\"http://yanxuan.nosdn.127.net/a39f2c7580ce5cadc62e8b39d58aca71.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/c71dc416f04615b634d2b6cd0c4215ee.jpg\" _src=\"http://yanxuan.nosdn.127.net/c71dc416f04615b634d2b6cd0c4215ee.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/06ac26ed7d870c5c6f0ce3e07c629471.jpg\" _src=\"http://yanxuan.nosdn.127.net/06ac26ed7d870c5c6f0ce3e07c629471.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/99b180d02726e0213e54dddf4b9b32fd.jpg\" _src=\"http://yanxuan.nosdn.127.net/99b180d02726e0213e54dddf4b9b32fd.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/97de8d2687052976e51fff40d04af2ce.jpg\" _src=\"http://yanxuan.nosdn.127.net/97de8d2687052976e51fff40d04af2ce.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/3f527003599be237095995c98039ef87.jpg\" _src=\"http://yanxuan.nosdn.127.net/3f527003599be237095995c98039ef87.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/ec30289dc1b2beb4b84a08c02a97ef6e.jpg\" _src=\"http://yanxuan.nosdn.127.net/ec30289dc1b2beb4b84a08c02a97ef6e.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/685da1eaddcd26e8e2a1ff4d5d83f29f.jpg\" _src=\"http://yanxuan.nosdn.127.net/685da1eaddcd26e8e2a1ff4d5d83f29f.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/2610f487a733a88973d101dcd1766ee1.jpg\" _src=\"http://yanxuan.nosdn.127.net/2610f487a733a88973d101dcd1766ee1.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/eab3633e648ab2e8412c6801feb6231e.jpg\" _src=\"http://yanxuan.nosdn.127.net/eab3633e648ab2e8412c6801feb6231e.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/7b6c4f220592ea7d5af0072a816fe946.jpg\" _src=\"http://yanxuan.nosdn.127.net/7b6c4f220592ea7d5af0072a816fe946.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/310a777685204ece08592a6e2716c6c9.jpg\" _src=\"http://yanxuan.nosdn.127.net/310a777685204ece08592a6e2716c6c9.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/198239985c74597717e639089ffae25f.jpg\" _src=\"http://yanxuan.nosdn.127.net/198239985c74597717e639089ffae25f.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/dec6b498c899351fe94d99a6dde0ee79.jpg\" _src=\"http://yanxuan.nosdn.127.net/dec6b498c899351fe94d99a6dde0ee79.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/516a17ca73846bc871902b298ce38a97.jpg\" _src=\"http://yanxuan.nosdn.127.net/516a17ca73846bc871902b298ce38a97.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/d8231b81b5ba0e1c244074598c19f003.jpg\" _src=\"http://yanxuan.nosdn.127.net/d8231b81b5ba0e1c244074598c19f003.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/92c704dcf169e9a177a3c762a6a54a46.jpg\" _src=\"http://yanxuan.nosdn.127.net/92c704dcf169e9a177a3c762a6a54a46.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/5b9294ad5f78d890453d4a225feed518.jpg\" _src=\"http://yanxuan.nosdn.127.net/5b9294ad5f78d890453d4a225feed518.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/9bb1b8fdfaa7f895bdd7d5c65c42a59b.jpg\" _src=\"http://yanxuan.nosdn.127.net/9bb1b8fdfaa7f895bdd7d5c65c42a59b.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/f342e6d6b75dc1f80972feb415fd4e75.jpg\" _src=\"http://yanxuan.nosdn.127.net/f342e6d6b75dc1f80972feb415fd4e75.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/6c9597cf206066861b3244f634c98e32.jpg\" _src=\"http://yanxuan.nosdn.127.net/6c9597cf206066861b3244f634c98e32.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/970d4dad7d958293fd41ec1f444684f1.jpg\" _src=\"http://yanxuan.nosdn.127.net/970d4dad7d958293fd41ec1f444684f1.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/6f93819b03de07abef8b2d94f1d5c84b.jpg\" _src=\"http://yanxuan.nosdn.127.net/6f93819b03de07abef8b2d94f1d5c84b.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/58c8c56aac61da4ee9fcf34930b76e4e.jpg\" _src=\"http://yanxuan.nosdn.127.net/58c8c56aac61da4ee9fcf34930b76e4e.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/fb6435ec714189d6ad5053bf12d41db7.jpg\" _src=\"http://yanxuan.nosdn.127.net/fb6435ec714189d6ad5053bf12d41db7.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/19cc85ae097247d5d868df993de64e7b.jpg\" _src=\"http://yanxuan.nosdn.127.net/19cc85ae097247d5d868df993de64e7b.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/0ab8e27757cabd39fccdb5fd8ef7b013.jpg\" _src=\"http://yanxuan.nosdn.127.net/0ab8e27757cabd39fccdb5fd8ef7b013.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/03e6f02f8f77b71a82a05dd1a9705057.jpg\" _src=\"http://yanxuan.nosdn.127.net/03e6f02f8f77b71a82a05dd1a9705057.jpg\" style=\"\"/></p><p><br/></p>', '2018-02-01 00:00:00', '2019-03-21 21:58:04', '0');
INSERT INTO `litemall_goods` VALUES ('1006007', '1006007', '秋冬保暖加厚澳洲羊毛被', '1008008', '0', '[\"http://yanxuan.nosdn.127.net/b7e3438c473a296a7e9feecbd4139af5.jpg\", \"http://yanxuan.nosdn.127.net/70422011e5a9855a0723c9c08d0cbbb0.jpg\", \"http://yanxuan.nosdn.127.net/f65dbb00aff8b43be02f2c8104208877.jpg\", \"http://yanxuan.nosdn.127.net/85e8575c8e473a2f71054e9e36b1211c.jpg\"]', '', '臻品级澳洲进口羊毛', '1', '17', 'http://yanxuan.nosdn.127.net/66425d1ed50b3968fed27c822fdd32e0.png', '', '0', '0', '件', '479.00', '459.00', '<p><img src=\"http://yanxuan.nosdn.127.net/c78ec6e16d8477525c0a59e3c9d847b8.jpg\" _src=\"http://yanxuan.nosdn.127.net/c78ec6e16d8477525c0a59e3c9d847b8.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/294185760b75f364f6ed42784877e59c.jpg\" _src=\"http://yanxuan.nosdn.127.net/294185760b75f364f6ed42784877e59c.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/2468d1851e29930cc3802f125da5d6e8.jpg\" _src=\"http://yanxuan.nosdn.127.net/2468d1851e29930cc3802f125da5d6e8.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/0794791277945c1577776724778124f8.jpg\" _src=\"http://yanxuan.nosdn.127.net/0794791277945c1577776724778124f8.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/6973ca1e6f264620d5d25e581a0d623d.jpg\" _src=\"http://yanxuan.nosdn.127.net/6973ca1e6f264620d5d25e581a0d623d.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/26f01273c833c2ae75177a5c8d9310ef.jpg\" _src=\"http://yanxuan.nosdn.127.net/26f01273c833c2ae75177a5c8d9310ef.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/bf0207da5160588acf58d0f02ea9d360.jpg\" _src=\"http://yanxuan.nosdn.127.net/bf0207da5160588acf58d0f02ea9d360.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/dbd5d5171a309344d05663952930441f.jpg\" _src=\"http://yanxuan.nosdn.127.net/dbd5d5171a309344d05663952930441f.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/e7a65ac0824fc1584c2f1943ed1eaed0.jpg\" _src=\"http://yanxuan.nosdn.127.net/e7a65ac0824fc1584c2f1943ed1eaed0.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/88871ed9eccf7fbdfccf7912bb8f9d21.jpg\" _src=\"http://yanxuan.nosdn.127.net/88871ed9eccf7fbdfccf7912bb8f9d21.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/7aa0e4c0abeb157e231b17e91cfa8f02.jpg\" _src=\"http://yanxuan.nosdn.127.net/7aa0e4c0abeb157e231b17e91cfa8f02.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/a38f897200e305e7b23d62431b9c4d18.jpg\" _src=\"http://yanxuan.nosdn.127.net/a38f897200e305e7b23d62431b9c4d18.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/bb147c0e96cdac2d77ab4eef1785e99d.jpg\" _src=\"http://yanxuan.nosdn.127.net/bb147c0e96cdac2d77ab4eef1785e99d.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/c6a270f7aed68cfe74e66d720c776fca.jpg\" _src=\"http://yanxuan.nosdn.127.net/c6a270f7aed68cfe74e66d720c776fca.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/c2c0b548be17f620db8afbe039a99452.jpg\" _src=\"http://yanxuan.nosdn.127.net/c2c0b548be17f620db8afbe039a99452.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/155fe0023e17bac4af486a6c1c098537.jpg\" _src=\"http://yanxuan.nosdn.127.net/155fe0023e17bac4af486a6c1c098537.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/8f1f120ca7e362595fd986ea6de8814f.jpg\" _src=\"http://yanxuan.nosdn.127.net/8f1f120ca7e362595fd986ea6de8814f.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/6971f0333e0eeef7d9951edad068d4ec.jpg\" _src=\"http://yanxuan.nosdn.127.net/6971f0333e0eeef7d9951edad068d4ec.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/c307630edf971e408938f1007169fa53.jpg\" _src=\"http://yanxuan.nosdn.127.net/c307630edf971e408938f1007169fa53.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/4ea2ba74fb518a298ef825c43ed634f4.jpg\" _src=\"http://yanxuan.nosdn.127.net/4ea2ba74fb518a298ef825c43ed634f4.jpg\" style=\"\"/></p><p><br/></p>', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods` VALUES ('1006010', '1006010', '秋冬保暖加厚细羊毛被', '1008008', '0', '[\"http://yanxuan.nosdn.127.net/9b40ba300851af1b84ca0749bae70718.jpg\", \"http://yanxuan.nosdn.127.net/fd7465ba32e23fd107161306d6b580cc.jpg\", \"http://yanxuan.nosdn.127.net/288dc3fe3238962519f3abd5201e411e.jpg\", \"http://yanxuan.nosdn.127.net/06cb7ac0991cb4ea236c826e8e6f0a9c.jpg\"]', 'ddd', '细腻绵羊毛，保暖性增加一倍', '0', '16', 'http://yanxuan.nosdn.127.net/8fe022126a2789d970f82853be13a5e6.png', '', '0', '0', '件', '679.00', '659.00', '<p><img src=\"http://yanxuan.nosdn.127.net/01c77e998005297e0fad16b25433409f.jpg\" _src=\"http://yanxuan.nosdn.127.net/01c77e998005297e0fad16b25433409f.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/36bffed3bd139e0135f35e1c30dfab01.jpg\" _src=\"http://yanxuan.nosdn.127.net/36bffed3bd139e0135f35e1c30dfab01.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/400b9395fb6947977a27da56baf07fcb.jpg\" _src=\"http://yanxuan.nosdn.127.net/400b9395fb6947977a27da56baf07fcb.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/7d6aef8e60f6bf2a438774ae114a9206.jpg\" _src=\"http://yanxuan.nosdn.127.net/7d6aef8e60f6bf2a438774ae114a9206.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/13521752a26971ad793d5e3e7061305b.jpg\" _src=\"http://yanxuan.nosdn.127.net/13521752a26971ad793d5e3e7061305b.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/8e4beb6669d9a83e19540727c01ced37.jpg\" _src=\"http://yanxuan.nosdn.127.net/8e4beb6669d9a83e19540727c01ced37.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/9c2e31cb55507bcb4653181f64a069a4.jpg\" _src=\"http://yanxuan.nosdn.127.net/9c2e31cb55507bcb4653181f64a069a4.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/2a65159336d1e2991ef93ed2aab15b7f.jpg\" _src=\"http://yanxuan.nosdn.127.net/2a65159336d1e2991ef93ed2aab15b7f.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/4bade2a9a72c78749f2a0126a43f5943.jpg\" _src=\"http://yanxuan.nosdn.127.net/4bade2a9a72c78749f2a0126a43f5943.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/15cf85dc65d2d857bfd1e45516775944.jpg\" _src=\"http://yanxuan.nosdn.127.net/15cf85dc65d2d857bfd1e45516775944.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/dffc49e67aa11308b8e408d7539ddf84.jpg\" _src=\"http://yanxuan.nosdn.127.net/dffc49e67aa11308b8e408d7539ddf84.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/0826118b3dbd1a123419d1f7f46784de.jpg\" _src=\"http://yanxuan.nosdn.127.net/0826118b3dbd1a123419d1f7f46784de.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/2cc7573ddb418a0f9fc0483367fce877.jpg\" _src=\"http://yanxuan.nosdn.127.net/2cc7573ddb418a0f9fc0483367fce877.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/62b67fcc05f65b26be987e2576ac1b97.jpg\" _src=\"http://yanxuan.nosdn.127.net/62b67fcc05f65b26be987e2576ac1b97.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/61a604a7f4ec39a7383265d4fb4ba1fe.jpg\" _src=\"http://yanxuan.nosdn.127.net/61a604a7f4ec39a7383265d4fb4ba1fe.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/5b04ba442e1d859cce4a945b5fee0ec2.jpg\" _src=\"http://yanxuan.nosdn.127.net/5b04ba442e1d859cce4a945b5fee0ec2.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/0aae1850fdc689eb42103b43709a3de9.jpg\" _src=\"http://yanxuan.nosdn.127.net/0aae1850fdc689eb42103b43709a3de9.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/9a82fdc70b5da5c802dca76410c80dac.jpg\" _src=\"http://yanxuan.nosdn.127.net/9a82fdc70b5da5c802dca76410c80dac.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/41fff402bc16cd45614bdfa7b612849f.jpg\" _src=\"http://yanxuan.nosdn.127.net/41fff402bc16cd45614bdfa7b612849f.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/d357f7ec1ced66c8865ed1029cbcc562.jpg\" _src=\"http://yanxuan.nosdn.127.net/d357f7ec1ced66c8865ed1029cbcc562.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/ad18d0bdad9a571bbf03ebe013a422d9.jpg\" _src=\"http://yanxuan.nosdn.127.net/ad18d0bdad9a571bbf03ebe013a422d9.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/5e0e6c2c77f1627b79037b76ba37adf9.jpg\" _src=\"http://yanxuan.nosdn.127.net/5e0e6c2c77f1627b79037b76ba37adf9.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/b71de5aaafd05a730cfe421f9e16053d.jpg\" _src=\"http://yanxuan.nosdn.127.net/b71de5aaafd05a730cfe421f9e16053d.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/aeca9234db5622edfe465c3f7732d203.jpg\" _src=\"http://yanxuan.nosdn.127.net/aeca9234db5622edfe465c3f7732d203.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/678124d2002655e05588a9484f8e5c14.jpg\" _src=\"http://yanxuan.nosdn.127.net/678124d2002655e05588a9484f8e5c14.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/3909a0aa66fbdc59c99d0666aef34286.jpg\" _src=\"http://yanxuan.nosdn.127.net/3909a0aa66fbdc59c99d0666aef34286.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/4ec01a83f6f6cd2d282ec0be98daeb3a.jpg\" _src=\"http://yanxuan.nosdn.127.net/4ec01a83f6f6cd2d282ec0be98daeb3a.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/d8716853b4b08223e886ee8d882e2d58.jpg\" _src=\"http://yanxuan.nosdn.127.net/d8716853b4b08223e886ee8d882e2d58.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/b8188de7819424845707f3f79a1f80d6.jpg\" _src=\"http://yanxuan.nosdn.127.net/b8188de7819424845707f3f79a1f80d6.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/30298def5edcdd62d0c4a20cfdfef66c.jpg\" _src=\"http://yanxuan.nosdn.127.net/30298def5edcdd62d0c4a20cfdfef66c.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/3437687b19a26469212a1e2c485c557d.jpg\" _src=\"http://yanxuan.nosdn.127.net/3437687b19a26469212a1e2c485c557d.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/2450afdd3b9f3cc7fc27bbde33ae0e86.jpg\" _src=\"http://yanxuan.nosdn.127.net/2450afdd3b9f3cc7fc27bbde33ae0e86.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/434d004c435b62a9505c5ffdf6d362d5.jpg\" _src=\"http://yanxuan.nosdn.127.net/434d004c435b62a9505c5ffdf6d362d5.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/41b6db4ce14bc2d3ff6526d43f52fb46.jpg\" _src=\"http://yanxuan.nosdn.127.net/41b6db4ce14bc2d3ff6526d43f52fb46.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/cec4d2d62eccc86b409465e1344f1d24.jpg\" _src=\"http://yanxuan.nosdn.127.net/cec4d2d62eccc86b409465e1344f1d24.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/09b9868d054ffcdbba3166882fbc8f38.jpg\" _src=\"http://yanxuan.nosdn.127.net/09b9868d054ffcdbba3166882fbc8f38.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/9d8027527ac4af59cc2172a7c3dce64e.jpg\" _src=\"http://yanxuan.nosdn.127.net/9d8027527ac4af59cc2172a7c3dce64e.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/59deea242718d6610f445776833f9afa.jpg\" _src=\"http://yanxuan.nosdn.127.net/59deea242718d6610f445776833f9afa.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/13f4b4c5dc11e4f5d2767254d2a5c777.jpg\" _src=\"http://yanxuan.nosdn.127.net/13f4b4c5dc11e4f5d2767254d2a5c777.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/f0d22f9c380873ddca23e6f187d6b6aa.jpg\" _src=\"http://yanxuan.nosdn.127.net/f0d22f9c380873ddca23e6f187d6b6aa.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/1821334ad83bfaa64ac4d212be9dd953.jpg\" _src=\"http://yanxuan.nosdn.127.net/1821334ad83bfaa64ac4d212be9dd953.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/72e6119d0329faa952d036173cf2f7fc.jpg\" _src=\"http://yanxuan.nosdn.127.net/72e6119d0329faa952d036173cf2f7fc.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/f69081555848f7d3af16cefb9f661c64.jpg\" _src=\"http://yanxuan.nosdn.127.net/f69081555848f7d3af16cefb9f661c64.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/cbb30819e21854491e0a5c8cf933b59a.jpg\" _src=\"http://yanxuan.nosdn.127.net/cbb30819e21854491e0a5c8cf933b59a.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/16f564772fc2f1d0030629b42be12211.jpg\" _src=\"http://yanxuan.nosdn.127.net/16f564772fc2f1d0030629b42be12211.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/a74dc5e969fc0896537be54155e11cd8.jpg\" _src=\"http://yanxuan.nosdn.127.net/a74dc5e969fc0896537be54155e11cd8.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/7c9702f8ffa6e3ebfcb5e1c14161a493.jpg\" _src=\"http://yanxuan.nosdn.127.net/7c9702f8ffa6e3ebfcb5e1c14161a493.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/f4e3b23eacbc419baa748525bc71ac3f.jpg\" _src=\"http://yanxuan.nosdn.127.net/f4e3b23eacbc419baa748525bc71ac3f.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/fb9520c1bc8e63e480bd61cfbcb6d18c.jpg\" _src=\"http://yanxuan.nosdn.127.net/fb9520c1bc8e63e480bd61cfbcb6d18c.jpg\" style=\"\"/></p><p><br/></p>', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods` VALUES ('1006013', '1006013', '双宫茧桑蚕丝被 空调被', '1036000', '1001045', '[\"http://yanxuan.nosdn.127.net/d83cbd9ec177276ba2582ee393eff3db.jpg\", \"http://yanxuan.nosdn.127.net/b73852cf22939c4995a5bc8996a4afdd.jpg\", \"http://yanxuan.nosdn.127.net/d2fe16d259e0187d6b53eef028e843d1.jpg\", \"http://yanxuan.nosdn.127.net/4e8f5c09ae9dd03b5ae5b1287b598cc5.jpg\"]', '', '一级桑蚕丝，吸湿透气柔软', '1', '7', 'http://yanxuan.nosdn.127.net/583812520c68ca7995b6fac4c67ae2c7.png', '', '0', '1', '件', '719.00', '699.00', '<p><img src=\"http://yanxuan.nosdn.127.net/72d71d3ef34d9c63521e6ede2fd468e0.jpg\" _src=\"http://yanxuan.nosdn.127.net/72d71d3ef34d9c63521e6ede2fd468e0.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/454d60ad184bea35d73258716dd8eff2.jpg\" _src=\"http://yanxuan.nosdn.127.net/454d60ad184bea35d73258716dd8eff2.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/6af1ec459a8ed93abccb436c2424277f.jpg\" _src=\"http://yanxuan.nosdn.127.net/6af1ec459a8ed93abccb436c2424277f.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/91b0e9d5f4bc57ec07702b9152ed9b46.jpg\" _src=\"http://yanxuan.nosdn.127.net/91b0e9d5f4bc57ec07702b9152ed9b46.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/da9743a2abce3752e186928fd8028167.jpg\" _src=\"http://yanxuan.nosdn.127.net/da9743a2abce3752e186928fd8028167.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/e48f4b067e0890f15c9f3fae5a94ae73.jpg\" _src=\"http://yanxuan.nosdn.127.net/e48f4b067e0890f15c9f3fae5a94ae73.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/51009cc464b77780fda27d0f0d7aff62.jpg\" _src=\"http://yanxuan.nosdn.127.net/51009cc464b77780fda27d0f0d7aff62.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/557905b15620c59926fc3e655e676e1d.jpg\" _src=\"http://yanxuan.nosdn.127.net/557905b15620c59926fc3e655e676e1d.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/fb249f4ccaa07940b40215883902af7e.jpg\" _src=\"http://yanxuan.nosdn.127.net/fb249f4ccaa07940b40215883902af7e.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/c763f877079e495ef67dc8db49369044.jpg\" _src=\"http://yanxuan.nosdn.127.net/c763f877079e495ef67dc8db49369044.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/fffbf8c9990f40d4d63f84a2ecd8e84d.jpg\" _src=\"http://yanxuan.nosdn.127.net/fffbf8c9990f40d4d63f84a2ecd8e84d.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/62dd5aa7c9f64936dcd86f1592eb38b3.jpg\" _src=\"http://yanxuan.nosdn.127.net/62dd5aa7c9f64936dcd86f1592eb38b3.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/c1f1914c7be28f6800372d878aaf5de1.jpg\" _src=\"http://yanxuan.nosdn.127.net/c1f1914c7be28f6800372d878aaf5de1.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/fb23c66040b18fb5b5ba6dfeeb9a4b1e.jpg\" _src=\"http://yanxuan.nosdn.127.net/fb23c66040b18fb5b5ba6dfeeb9a4b1e.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/d49ac2656061fff48a6244dfdde01c41.jpg\" _src=\"http://yanxuan.nosdn.127.net/d49ac2656061fff48a6244dfdde01c41.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/947ca15f1e253634456e1bcb93c8172f.jpg\" _src=\"http://yanxuan.nosdn.127.net/947ca15f1e253634456e1bcb93c8172f.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/80ea5528f9a679f24d1240c9e519d693.jpg\" _src=\"http://yanxuan.nosdn.127.net/80ea5528f9a679f24d1240c9e519d693.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/150a3223e5bfdde9442c0bcab62ca711.jpg\" _src=\"http://yanxuan.nosdn.127.net/150a3223e5bfdde9442c0bcab62ca711.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/769f510f743022e38ded0e4a2f2023c7.jpg\" _src=\"http://yanxuan.nosdn.127.net/769f510f743022e38ded0e4a2f2023c7.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/91cc7ea8833b03cc9fd7b567a4e2569f.jpg\" _src=\"http://yanxuan.nosdn.127.net/91cc7ea8833b03cc9fd7b567a4e2569f.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/0982d37e3442540723b17a66493bf849.jpg\" _src=\"http://yanxuan.nosdn.127.net/0982d37e3442540723b17a66493bf849.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/449a379cf9a8664a52cc0ef9582fe063.jpg\" _src=\"http://yanxuan.nosdn.127.net/449a379cf9a8664a52cc0ef9582fe063.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/80d2959fe04d9a283ee1e9b180fd30be.jpg\" _src=\"http://yanxuan.nosdn.127.net/80d2959fe04d9a283ee1e9b180fd30be.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/cc878d8a7b7386f5503b327fd444a12d.jpg\" _src=\"http://yanxuan.nosdn.127.net/cc878d8a7b7386f5503b327fd444a12d.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/f6137ff63496de30117774c7be09d8f1.jpg\" _src=\"http://yanxuan.nosdn.127.net/f6137ff63496de30117774c7be09d8f1.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/ddfbc82ef6ede49231463b8d09465dbb.jpg\" _src=\"http://yanxuan.nosdn.127.net/ddfbc82ef6ede49231463b8d09465dbb.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/07a0a19039d8e98ffad6895b438545ab.jpg\" _src=\"http://yanxuan.nosdn.127.net/07a0a19039d8e98ffad6895b438545ab.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/0f4c47f5d8c1c390fd6efd5b757924c2.jpg\" _src=\"http://yanxuan.nosdn.127.net/0f4c47f5d8c1c390fd6efd5b757924c2.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/dee8166ae7bed6d509af9925a350b405.jpg\" _src=\"http://yanxuan.nosdn.127.net/dee8166ae7bed6d509af9925a350b405.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/f07dc7e541fd4c0c71d21679a3afbd06.jpg\" _src=\"http://yanxuan.nosdn.127.net/f07dc7e541fd4c0c71d21679a3afbd06.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/9deb210e7cdbb18bb42e37b0640fbba9.jpg\" _src=\"http://yanxuan.nosdn.127.net/9deb210e7cdbb18bb42e37b0640fbba9.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/286eed28f2cb51d76fafdb1a112aaa91.jpg\" _src=\"http://yanxuan.nosdn.127.net/286eed28f2cb51d76fafdb1a112aaa91.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/b7d0251276ab00b200a153515d69dec7.jpg\" _src=\"http://yanxuan.nosdn.127.net/b7d0251276ab00b200a153515d69dec7.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/3a908235021c994fb2d5a029f27bf520.jpg\" _src=\"http://yanxuan.nosdn.127.net/3a908235021c994fb2d5a029f27bf520.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/98b1fdb1029b1a585871574f7f8bf104.jpg\" _src=\"http://yanxuan.nosdn.127.net/98b1fdb1029b1a585871574f7f8bf104.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/b67aa253cacf03bd0d5a3be8743d15b9.jpg\" _src=\"http://yanxuan.nosdn.127.net/b67aa253cacf03bd0d5a3be8743d15b9.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/b9689e05a06746a6f00be0b6f1dd80ba.jpg\" _src=\"http://yanxuan.nosdn.127.net/b9689e05a06746a6f00be0b6f1dd80ba.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/1a494d87239c3a84819f54d5e1e430ad.jpg\" _src=\"http://yanxuan.nosdn.127.net/1a494d87239c3a84819f54d5e1e430ad.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/e0187f5be624e13ed5eac7f00c13bde0.jpg\" _src=\"http://yanxuan.nosdn.127.net/e0187f5be624e13ed5eac7f00c13bde0.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/dec5144859fb414c2181e0bf15185cf2.jpg\" _src=\"http://yanxuan.nosdn.127.net/dec5144859fb414c2181e0bf15185cf2.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/f06282b15ffbed67f115b436ca6975ab.jpg\" _src=\"http://yanxuan.nosdn.127.net/f06282b15ffbed67f115b436ca6975ab.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/3c159080beb18d634929c6543392d655.jpg\" _src=\"http://yanxuan.nosdn.127.net/3c159080beb18d634929c6543392d655.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/94bea38417d6f74a823b0407e3871709.jpg\" _src=\"http://yanxuan.nosdn.127.net/94bea38417d6f74a823b0407e3871709.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/f204613bd50eb71265ca0dc28bc91df0.jpg\" _src=\"http://yanxuan.nosdn.127.net/f204613bd50eb71265ca0dc28bc91df0.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/36e9a86f175472e70708511a51276e33.jpg\" _src=\"http://yanxuan.nosdn.127.net/36e9a86f175472e70708511a51276e33.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/293a0997d7f9dd51211225ceb8073a04.jpg\" _src=\"http://yanxuan.nosdn.127.net/293a0997d7f9dd51211225ceb8073a04.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/a3c451b65fd6e8215f4609696f9699d8.jpg\" _src=\"http://yanxuan.nosdn.127.net/a3c451b65fd6e8215f4609696f9699d8.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/54ad136164b7066bda8c3f5b418eb6c5.jpg\" _src=\"http://yanxuan.nosdn.127.net/54ad136164b7066bda8c3f5b418eb6c5.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/e17a55eea9daa90ad3e5490a8ade2060.jpg\" _src=\"http://yanxuan.nosdn.127.net/e17a55eea9daa90ad3e5490a8ade2060.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/c898af2ddd8754fa42ae09d341c255ab.jpg\" _src=\"http://yanxuan.nosdn.127.net/c898af2ddd8754fa42ae09d341c255ab.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/ad2b42dfa9ed7a3b0b7d832482592aea.jpg\" _src=\"http://yanxuan.nosdn.127.net/ad2b42dfa9ed7a3b0b7d832482592aea.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/314cb766b281d9d69ca7d0e177326e3a.jpg\" _src=\"http://yanxuan.nosdn.127.net/314cb766b281d9d69ca7d0e177326e3a.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/42bcc536dc84355531fa657a450b5daa.jpg\" _src=\"http://yanxuan.nosdn.127.net/42bcc536dc84355531fa657a450b5daa.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/a7f140d9e49eb84d504719b7a04541e9.jpg\" _src=\"http://yanxuan.nosdn.127.net/a7f140d9e49eb84d504719b7a04541e9.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/693aa30f123d122d58507ec0df194f96.jpg\" _src=\"http://yanxuan.nosdn.127.net/693aa30f123d122d58507ec0df194f96.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/7193b8192cb6345f6f2503febd2b86ed.jpg\" _src=\"http://yanxuan.nosdn.127.net/7193b8192cb6345f6f2503febd2b86ed.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/5f997dbe72e525fcc68663fe50b5c825.jpg\" _src=\"http://yanxuan.nosdn.127.net/5f997dbe72e525fcc68663fe50b5c825.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/6771f59b904f91d296c115de01f0b7f3.jpg\" _src=\"http://yanxuan.nosdn.127.net/6771f59b904f91d296c115de01f0b7f3.jpg\" style=\"\"/></p><p><br/></p>', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods` VALUES ('1006014', '1006014', '双宫茧桑蚕丝被 子母被', '1008008', '1001045', '[\"http://yanxuan.nosdn.127.net/22535d179b6796fbd45a83d6ecea3b50.jpg\",\"http://yanxuan.nosdn.127.net/6e93d7d868d918bef0138748ffbd9458.jpg\",\"http://yanxuan.nosdn.127.net/ccc21b29557929ec99067a445fc74ea3.jpg\",\"http://yanxuan.nosdn.127.net/1479bec93b57855889d93a9f4eef0b72.jpg\"]', '', '双层子母被，四季皆可使用', '1', '15', 'http://yanxuan.nosdn.127.net/2b537159f0f789034bf8c4b339c43750.png', '', '0', '1', '件', '14199.00', '1399.00', '<p><img src=\"http://yanxuan.nosdn.127.net/3b5ee089edb2b5d3361bf60e208ec474.jpg\" _src=\"http://yanxuan.nosdn.127.net/3b5ee089edb2b5d3361bf60e208ec474.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/737260dd5cfae7ef72c713af861e8774.jpg\" _src=\"http://yanxuan.nosdn.127.net/737260dd5cfae7ef72c713af861e8774.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/62a70427f9d6bf81bc19203e6f401e2e.jpg\" _src=\"http://yanxuan.nosdn.127.net/62a70427f9d6bf81bc19203e6f401e2e.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/051aa6ea1ef13b32240a34e0d2d5ca97.jpg\" _src=\"http://yanxuan.nosdn.127.net/051aa6ea1ef13b32240a34e0d2d5ca97.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/41b19060447843186366c221130ee4de.jpg\" _src=\"http://yanxuan.nosdn.127.net/41b19060447843186366c221130ee4de.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/ae757922d72e6c4357d10f1d78bd7a8b.jpg\" _src=\"http://yanxuan.nosdn.127.net/ae757922d72e6c4357d10f1d78bd7a8b.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/58bcf7d0ce99f4f2b5cf11b9511319e7.jpg\" _src=\"http://yanxuan.nosdn.127.net/58bcf7d0ce99f4f2b5cf11b9511319e7.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/54496c73ebda2680aa2b9d8c375a82e3.jpg\" _src=\"http://yanxuan.nosdn.127.net/54496c73ebda2680aa2b9d8c375a82e3.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/6caae81b0956de612ce57b1419382813.jpg\" _src=\"http://yanxuan.nosdn.127.net/6caae81b0956de612ce57b1419382813.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/2fbf34bb5b36ba708dfc3facc6551d1b.jpg\" _src=\"http://yanxuan.nosdn.127.net/2fbf34bb5b36ba708dfc3facc6551d1b.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/741663a8fb8f5a17442951d7ed670952.jpg\" _src=\"http://yanxuan.nosdn.127.net/741663a8fb8f5a17442951d7ed670952.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/7055264e97783cc669a003e3e857de8f.jpg\" _src=\"http://yanxuan.nosdn.127.net/7055264e97783cc669a003e3e857de8f.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/59983cf72d63181eff723b7d6ec2a57d.jpg\" _src=\"http://yanxuan.nosdn.127.net/59983cf72d63181eff723b7d6ec2a57d.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/6046cb49c22b635a84d490e8f0ab9f8f.jpg\" _src=\"http://yanxuan.nosdn.127.net/6046cb49c22b635a84d490e8f0ab9f8f.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/01d18fcb6e8019798a630c9abb01580a.jpg\" _src=\"http://yanxuan.nosdn.127.net/01d18fcb6e8019798a630c9abb01580a.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/4093967aedc279e3c4ee3e672fbebbff.jpg\" _src=\"http://yanxuan.nosdn.127.net/4093967aedc279e3c4ee3e672fbebbff.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/994d3bcf0b40fc9c31f51a9accd0b88c.jpg\" _src=\"http://yanxuan.nosdn.127.net/994d3bcf0b40fc9c31f51a9accd0b88c.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/72fd621d3b567cb6d963a9b554c58ee5.jpg\" _src=\"http://yanxuan.nosdn.127.net/72fd621d3b567cb6d963a9b554c58ee5.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/c1704b2d57d8ce5a30b371f702b80e23.jpg\" _src=\"http://yanxuan.nosdn.127.net/c1704b2d57d8ce5a30b371f702b80e23.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/a0cd8614de4c7bc709158dcf9b7e9ada.jpg\" _src=\"http://yanxuan.nosdn.127.net/a0cd8614de4c7bc709158dcf9b7e9ada.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/290ecc11a85a18b87825fe57caa81bd3.jpg\" _src=\"http://yanxuan.nosdn.127.net/290ecc11a85a18b87825fe57caa81bd3.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/3467f0eb4f5a3feb30df257b1dd1a80a.jpg\" _src=\"http://yanxuan.nosdn.127.net/3467f0eb4f5a3feb30df257b1dd1a80a.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/406defa7a54f5626e050d9eee2a3a7f4.jpg\" _src=\"http://yanxuan.nosdn.127.net/406defa7a54f5626e050d9eee2a3a7f4.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/14f1fa09e672955a8afad3e35eae3798.jpg\" _src=\"http://yanxuan.nosdn.127.net/14f1fa09e672955a8afad3e35eae3798.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/df344f04a06d62cb15c48a220fb18e34.jpg\" _src=\"http://yanxuan.nosdn.127.net/df344f04a06d62cb15c48a220fb18e34.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/b468781d6f234e0107b7ed7c44492da5.jpg\" _src=\"http://yanxuan.nosdn.127.net/b468781d6f234e0107b7ed7c44492da5.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/d91c856cbb29826afbc4d3e2bbf63e27.jpg\" _src=\"http://yanxuan.nosdn.127.net/d91c856cbb29826afbc4d3e2bbf63e27.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/f08409269a24bc60c51c97e56b279ddc.jpg\" _src=\"http://yanxuan.nosdn.127.net/f08409269a24bc60c51c97e56b279ddc.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/3809897fdc8a9db7bd447d7ec1116a17.jpg\" _src=\"http://yanxuan.nosdn.127.net/3809897fdc8a9db7bd447d7ec1116a17.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/fd024467887854c0f9540d9cfef2e6dc.jpg\" _src=\"http://yanxuan.nosdn.127.net/fd024467887854c0f9540d9cfef2e6dc.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/da5afa55ec02ac1e430ecb985c7aef83.jpg\" _src=\"http://yanxuan.nosdn.127.net/da5afa55ec02ac1e430ecb985c7aef83.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/f522e5f98ccab9311de8b15a2c6951ae.jpg\" _src=\"http://yanxuan.nosdn.127.net/f522e5f98ccab9311de8b15a2c6951ae.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/a4d5ef81a10211b7a8d3b7134b3adccb.jpg\" _src=\"http://yanxuan.nosdn.127.net/a4d5ef81a10211b7a8d3b7134b3adccb.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/1c241ff5f9c267fbd27c2e0bf346dc00.jpg\" _src=\"http://yanxuan.nosdn.127.net/1c241ff5f9c267fbd27c2e0bf346dc00.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/9db75fb0766730ee2f2afcf8b8b33659.jpg\" _src=\"http://yanxuan.nosdn.127.net/9db75fb0766730ee2f2afcf8b8b33659.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/5f4f42fad5ace718567c9aa68ada22a1.jpg\" _src=\"http://yanxuan.nosdn.127.net/5f4f42fad5ace718567c9aa68ada22a1.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/fc0152f7a1a5a31603a59bdfdc4e987f.jpg\" _src=\"http://yanxuan.nosdn.127.net/fc0152f7a1a5a31603a59bdfdc4e987f.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/c2929041a7abc890965d4b399f3b6278.jpg\" _src=\"http://yanxuan.nosdn.127.net/c2929041a7abc890965d4b399f3b6278.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/8e12a5accd62e0b29ace162ca64fe5ac.jpg\" _src=\"http://yanxuan.nosdn.127.net/8e12a5accd62e0b29ace162ca64fe5ac.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/924c7f4ce0af0fdefd04164508648885.jpg\" _src=\"http://yanxuan.nosdn.127.net/924c7f4ce0af0fdefd04164508648885.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/55f049536b6471804546d55b8f4fb88c.jpg\" _src=\"http://yanxuan.nosdn.127.net/55f049536b6471804546d55b8f4fb88c.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/cd99f9a6f3d60a1d07ac3428b974f65d.jpg\" _src=\"http://yanxuan.nosdn.127.net/cd99f9a6f3d60a1d07ac3428b974f65d.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/0444882d13667f002b4eeeaa02bf0498.jpg\" _src=\"http://yanxuan.nosdn.127.net/0444882d13667f002b4eeeaa02bf0498.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/9491237b070c4eff99dff34d528b4b65.jpg\" _src=\"http://yanxuan.nosdn.127.net/9491237b070c4eff99dff34d528b4b65.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/18bbcf7de0dfe9df10fdccffa328a54d.jpg\" _src=\"http://yanxuan.nosdn.127.net/18bbcf7de0dfe9df10fdccffa328a54d.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/b396a6ce48ebd3297384d8deea6f06e9.jpg\" _src=\"http://yanxuan.nosdn.127.net/b396a6ce48ebd3297384d8deea6f06e9.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/2234040e3bcd7d6b7954b34afc9592a6.jpg\" _src=\"http://yanxuan.nosdn.127.net/2234040e3bcd7d6b7954b34afc9592a6.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/8b2015e0c984e01a2ec6e971f3b3c855.jpg\" _src=\"http://yanxuan.nosdn.127.net/8b2015e0c984e01a2ec6e971f3b3c855.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/1cfd381db37cea6b62856d0bcceaa4e0.jpg\" _src=\"http://yanxuan.nosdn.127.net/1cfd381db37cea6b62856d0bcceaa4e0.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/61c867e69ce18b47ba5e8b4dc35d45a3.jpg\" _src=\"http://yanxuan.nosdn.127.net/61c867e69ce18b47ba5e8b4dc35d45a3.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/efbb973c5e5b9bf58e764957f64402b2.jpg\" _src=\"http://yanxuan.nosdn.127.net/efbb973c5e5b9bf58e764957f64402b2.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/66eb58f7818e87a8cc67923a2effaeee.jpg\" _src=\"http://yanxuan.nosdn.127.net/66eb58f7818e87a8cc67923a2effaeee.jpg\" style=\"\"/></p><p><br/></p>', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods` VALUES ('1006051', '1006051', '皇室御用超柔毛巾', '1008001', '0', '[\"http://yanxuan.nosdn.127.net/de30c41b94ce203985a228dc787fdcfa.jpg\", \"http://yanxuan.nosdn.127.net/de30c41b94ce203985a228dc787fdcfa.jpg\", \"http://yanxuan.nosdn.127.net/de30c41b94ce203985a228dc787fdcfa.jpg\", \"http://yanxuan.nosdn.127.net/de30c41b94ce203985a228dc787fdcfa.jpg\", \"http://yanxuan.nosdn.127.net/de30c41b94ce203985a228dc787fdcfa.jpg\"]', '', '至柔至软，热销50万条', '1', '1', 'http://yanxuan.nosdn.127.net/ad5a317216f9da495b144070ecf1f957.png', '', '0', '0', '条', '79.00', '59.00', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods` VALUES ('1009009', '1009009', '白鹅绒秋冬加厚羽绒被', '1036005', '1024003', '[\"http://yanxuan.nosdn.127.net/33a04714bc15a43d0ce87d71d1d9694a.jpg\",\"http://yanxuan.nosdn.127.net/e0999e26962b6e88b05fdfe9ba8ff644.jpg\",\"http://yanxuan.nosdn.127.net/dd2aff7f4edb26f5e0f691e94a51c66a.jpg\",\"http://yanxuan.nosdn.127.net/78059fd78b649d395f8e5740ba8eb99e.jpg\"]', '', '热销5万条，一条被子过冬', '1', '19', 'http://yanxuan.nosdn.127.net/9791006f25e26b2d7c81f41f87ce8619.png', '', '1', '0', '件', '2019.00', '1999.00', '<p><img src=\"http://yanxuan.nosdn.127.net/79ae82326ba86985035215ca9bebd137.jpg\" _src=\"http://yanxuan.nosdn.127.net/79ae82326ba86985035215ca9bebd137.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/e7aadf2c5fd0942dc9bceb5a0738d969.jpg\" _src=\"http://yanxuan.nosdn.127.net/e7aadf2c5fd0942dc9bceb5a0738d969.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/6ccf2486677aafef68048894317b6e96.jpg\" _src=\"http://yanxuan.nosdn.127.net/6ccf2486677aafef68048894317b6e96.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/b3ce70df9905a810c60220d9d24ebb2c.jpg\" _src=\"http://yanxuan.nosdn.127.net/b3ce70df9905a810c60220d9d24ebb2c.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/d51b1e4f61cb563b09dae46ee282e220.jpg\" _src=\"http://yanxuan.nosdn.127.net/d51b1e4f61cb563b09dae46ee282e220.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/e2791ef7173866f12be3341ca7202336.jpg\" _src=\"http://yanxuan.nosdn.127.net/e2791ef7173866f12be3341ca7202336.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/6cda9c3d9f044310f49afc5bbdb3533d.jpg\" _src=\"http://yanxuan.nosdn.127.net/6cda9c3d9f044310f49afc5bbdb3533d.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/68e9be17108a9c6a0e6b786176a4b4c6.jpg\" _src=\"http://yanxuan.nosdn.127.net/68e9be17108a9c6a0e6b786176a4b4c6.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/3974579c71cdf946088d339e9e5c865d.jpg\" _src=\"http://yanxuan.nosdn.127.net/3974579c71cdf946088d339e9e5c865d.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/d95a8520e3e3dfec063fc484e1d57207.jpg\" _src=\"http://yanxuan.nosdn.127.net/d95a8520e3e3dfec063fc484e1d57207.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/ce8b29a61396dced0f89ea3bfdf1f45d.jpg\" _src=\"http://yanxuan.nosdn.127.net/ce8b29a61396dced0f89ea3bfdf1f45d.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/129cba9ef941b367e56dad47aeb7fd96.jpg\" _src=\"http://yanxuan.nosdn.127.net/129cba9ef941b367e56dad47aeb7fd96.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/f566abb0c978093647aa1742725129ae.jpg\" _src=\"http://yanxuan.nosdn.127.net/f566abb0c978093647aa1742725129ae.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/f7c7c153400895b5d690f1eba9b3c315.jpg\" _src=\"http://yanxuan.nosdn.127.net/f7c7c153400895b5d690f1eba9b3c315.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/be750a41eef4db163a29e2326a65660f.jpg\" _src=\"http://yanxuan.nosdn.127.net/be750a41eef4db163a29e2326a65660f.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/6ea11ee2e846b3536acb599b93b7d2e9.jpg\" _src=\"http://yanxuan.nosdn.127.net/6ea11ee2e846b3536acb599b93b7d2e9.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/5814d4e02b3fd0b94d04ca262b201385.jpg\" _src=\"http://yanxuan.nosdn.127.net/5814d4e02b3fd0b94d04ca262b201385.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/7959e1d91576bf0d21e7bd042e2210bd.jpg\" _src=\"http://yanxuan.nosdn.127.net/7959e1d91576bf0d21e7bd042e2210bd.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/4268cc5be26539ed427927e4e6d8e18e.jpg\" _src=\"http://yanxuan.nosdn.127.net/4268cc5be26539ed427927e4e6d8e18e.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/5667dee42adfce79988974d96ddd8b09.jpg\" _src=\"http://yanxuan.nosdn.127.net/5667dee42adfce79988974d96ddd8b09.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/d6c9f0a1a51cd0166844d3694cc92a1e.jpg\" _src=\"http://yanxuan.nosdn.127.net/d6c9f0a1a51cd0166844d3694cc92a1e.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/ce43457f50492c355ff1f7577685c004.jpg\" _src=\"http://yanxuan.nosdn.127.net/ce43457f50492c355ff1f7577685c004.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/9c2ff68fede235b1b9f249cd5dabce0d.jpg\" _src=\"http://yanxuan.nosdn.127.net/9c2ff68fede235b1b9f249cd5dabce0d.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/785952cd32deedc2bfd90826e89ddc2a.jpg\" _src=\"http://yanxuan.nosdn.127.net/785952cd32deedc2bfd90826e89ddc2a.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/b544624dcc990b966e6c6d20ee608b7c.jpg\" _src=\"http://yanxuan.nosdn.127.net/b544624dcc990b966e6c6d20ee608b7c.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/761a606123be84d0c6eaa2e5eb9f4f81.jpg\" _src=\"http://yanxuan.nosdn.127.net/761a606123be84d0c6eaa2e5eb9f4f81.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/0cce548176f68f7e00de503d4d146629.jpg\" _src=\"http://yanxuan.nosdn.127.net/0cce548176f68f7e00de503d4d146629.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/30cb73b7917af99d4ccbdbca9042d566.jpg\" _src=\"http://yanxuan.nosdn.127.net/30cb73b7917af99d4ccbdbca9042d566.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/1a27c57bb90e145df10d633dcfdbe26b.jpg\" _src=\"http://yanxuan.nosdn.127.net/1a27c57bb90e145df10d633dcfdbe26b.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/8df76b01f83dd4d4a7f58014d8977067.jpg\" _src=\"http://yanxuan.nosdn.127.net/8df76b01f83dd4d4a7f58014d8977067.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/ea47ed85b1334e2da9672ee3e9ad66a4.jpg\" _src=\"http://yanxuan.nosdn.127.net/ea47ed85b1334e2da9672ee3e9ad66a4.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/750caeba2fa63dec64d598e8299f2122.jpg\" _src=\"http://yanxuan.nosdn.127.net/750caeba2fa63dec64d598e8299f2122.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/14bd429f1d48be5d9a8240c1fb4c494b.jpg\" _src=\"http://yanxuan.nosdn.127.net/14bd429f1d48be5d9a8240c1fb4c494b.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/02ee506d1f4ba045d7408a0b1e719c8e.jpg\" _src=\"http://yanxuan.nosdn.127.net/02ee506d1f4ba045d7408a0b1e719c8e.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/82443ff0a437048729b35fbdb85b0c3a.jpg\" _src=\"http://yanxuan.nosdn.127.net/82443ff0a437048729b35fbdb85b0c3a.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/d3f39a87baa66fe50f3b141d148645b5.jpg\" _src=\"http://yanxuan.nosdn.127.net/d3f39a87baa66fe50f3b141d148645b5.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/814e549460f206dccb8889165ef69ea2.jpg\" _src=\"http://yanxuan.nosdn.127.net/814e549460f206dccb8889165ef69ea2.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/43c21522533725d57ff893f9d080f6cd.jpg\" _src=\"http://yanxuan.nosdn.127.net/43c21522533725d57ff893f9d080f6cd.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/dfc0d18fa3b2ba721fd7614af7962cbe.jpg\" _src=\"http://yanxuan.nosdn.127.net/dfc0d18fa3b2ba721fd7614af7962cbe.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/1b58ac36c4781edd6d09dfeb2fbb6112.jpg\" _src=\"http://yanxuan.nosdn.127.net/1b58ac36c4781edd6d09dfeb2fbb6112.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/aadb34b1fe47217989e46eefb2fcef2c.jpg\" _src=\"http://yanxuan.nosdn.127.net/aadb34b1fe47217989e46eefb2fcef2c.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/558aa961eb6b51692e50c5801d74adeb.jpg\" _src=\"http://yanxuan.nosdn.127.net/558aa961eb6b51692e50c5801d74adeb.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/af3a0c3d829d015c0850befa9aa7f05c.jpg\" _src=\"http://yanxuan.nosdn.127.net/af3a0c3d829d015c0850befa9aa7f05c.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/23c02d5a325df4c87eb339e694489339.jpg\" _src=\"http://yanxuan.nosdn.127.net/23c02d5a325df4c87eb339e694489339.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/c51160264c2344feb8a2580d0c47a655.jpg\" _src=\"http://yanxuan.nosdn.127.net/c51160264c2344feb8a2580d0c47a655.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/ea8ecd877fdd3c0b30f7d7b961fdf8ee.jpg\" _src=\"http://yanxuan.nosdn.127.net/ea8ecd877fdd3c0b30f7d7b961fdf8ee.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/5976f583518689c566c94ce65ac8fcb2.jpg\" _src=\"http://yanxuan.nosdn.127.net/5976f583518689c566c94ce65ac8fcb2.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/494dc60b71027177448188093c5eb072.jpg\" _src=\"http://yanxuan.nosdn.127.net/494dc60b71027177448188093c5eb072.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/9c0fc3b0727795fe696579e6b3a1f817.jpg\" _src=\"http://yanxuan.nosdn.127.net/9c0fc3b0727795fe696579e6b3a1f817.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/7ab7aa0de0e90b5a8768d25155e6c475.jpg\" _src=\"http://yanxuan.nosdn.127.net/7ab7aa0de0e90b5a8768d25155e6c475.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/839ffe5bf65befd4ec353fbed7730b2c.jpg\" _src=\"http://yanxuan.nosdn.127.net/839ffe5bf65befd4ec353fbed7730b2c.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/313df862cf6181ef199b782969be4607.jpg\" _src=\"http://yanxuan.nosdn.127.net/313df862cf6181ef199b782969be4607.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/e39bfc4343d8968879ec66cc67db8987.jpg\" _src=\"http://yanxuan.nosdn.127.net/e39bfc4343d8968879ec66cc67db8987.jpg\" style=\"\"/></p><p><img src=\"http://yanxuan.nosdn.127.net/d0c74814f38aba0c40a405ece465d554.jpg\" _src=\"http://yanxuan.nosdn.127.net/d0c74814f38aba0c40a405ece465d554.jpg\" style=\"\"/></p><p><br/></p>', '2018-02-01 00:00:00', '2019-03-21 22:02:50', '0');
INSERT INTO `litemall_goods` VALUES ('1009010', '18650', '18650', '1036005', '1024000', '[\"http://localhost:8080/wx/storage/fetch/roadahh844nu4tkwxxkz.png\"]', '', '18650', '1', '100', 'http://localhost:8080/wx/storage/fetch/5xu6g66k07k2v0ay727a.png', '', '1', '0', '’件‘', '10.00', '10.00', '<p>18650</p>', '2019-03-21 22:03:52', '2019-03-21 22:04:46', '0');

-- ----------------------------
-- Table structure for litemall_goods_attribute
-- ----------------------------
DROP TABLE IF EXISTS `litemall_goods_attribute`;
CREATE TABLE `litemall_goods_attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品表的商品ID',
  `attribute` varchar(255) NOT NULL COMMENT '商品参数名称',
  `value` varchar(255) NOT NULL COMMENT '商品参数值',
  `add_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=902 DEFAULT CHARSET=utf8mb4 COMMENT='商品参数表';

-- ----------------------------
-- Records of litemall_goods_attribute
-- ----------------------------
INSERT INTO `litemall_goods_attribute` VALUES ('1', '1006002', '材质', '100%棉', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_goods_attribute` VALUES ('2', '1006002', '适用床尺寸', '1.5米+1.8米通用', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_goods_attribute` VALUES ('3', '1006002', '件数', '4件', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_goods_attribute` VALUES ('4', '1006002', '工艺', '刺绣', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_goods_attribute` VALUES ('5', '1006002', '执行标准', 'GB18401-2010 B类', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_goods_attribute` VALUES ('6', '1006002', '产地', '中国', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_goods_attribute` VALUES ('7', '1006002', '温馨提示', '纺织品经历印染、织造等多道环节，产品初次拿到可能有些许味道，清水漂洗、晾干后味道即可散去。\n严选面料全部经过国标检测认证，选用环保活性染料，请放心使用。', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_goods_attribute` VALUES ('8', '1006007', '填充物重量', '2000g/2300g', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('9', '1006007', '尺寸', '200*230cm/220*240cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('10', '1006007', '面料', '100%棉', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('11', '1006007', '填充物', '100%羊毛', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('12', '1006007', '温馨提示', '1.经过碳化、清洗、梳理的天然羊毛被带会有少量味道，通风晾晒2-3天即可散去                     2.为减少羊毛漂白等化学用品的处理时间，部分羊毛可能未完全脱色，轻微泛黄属羊毛原色，为正常现象。', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('13', '1006010', '填充物重量', '2000g/2300g', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_goods_attribute` VALUES ('14', '1006010', '尺寸', '200*230cm/220*240cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_goods_attribute` VALUES ('15', '1006010', '面料', '100%棉', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_goods_attribute` VALUES ('16', '1006010', '填充物', '超细羊毛', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_goods_attribute` VALUES ('17', '1006010', '温馨提示', '1.经过碳化、清洗、梳理的天然羊毛被带会有少量味道，通风晾晒2-3天即可散去                                        2.为减少羊毛漂白等化学用品的处理时间，部分羊毛可能未完全脱色，轻微泛黄属羊毛原色，为正常现象。', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_goods_attribute` VALUES ('18', '1006013', '尺寸', '200*230cm/ 220*240cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_goods_attribute` VALUES ('19', '1006013', '面料', '100%棉', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_goods_attribute` VALUES ('20', '1006013', '填充物', '100%双宫茧桑蚕丝', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_goods_attribute` VALUES ('21', '1006013', '填充物重量', '0.5KG/1KG', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_goods_attribute` VALUES ('22', '1006013', '温馨提示', '天然桑蚕丝具有正常蛋白味道，通风晾晒2-3天即可散去', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_goods_attribute` VALUES ('23', '1006014', '尺寸', '200*230cm/ 220*240cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_goods_attribute` VALUES ('24', '1006014', '面料', '100%棉', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_goods_attribute` VALUES ('25', '1006014', '填充物', '100%双宫茧桑蚕丝', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_goods_attribute` VALUES ('26', '1006014', '填充物重量', '0.5+1.5KG/1+2KG', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_goods_attribute` VALUES ('27', '1006014', '温馨提示', '天然桑蚕丝具有正常蛋白味道，通风晾晒2-3天即可散去', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_goods_attribute` VALUES ('28', '1009009', '尺寸', '200*230cm/220*240cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_goods_attribute` VALUES ('29', '1009009', '填充成分', '白鹅绒', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_goods_attribute` VALUES ('30', '1009009', '面料成分', '60%棉 40%聚酯纤维', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_goods_attribute` VALUES ('31', '1009009', '填充物重量', '1500g/1700g', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_goods_attribute` VALUES ('32', '1009009', '含绒量', '95%', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_goods_attribute` VALUES ('33', '1009009', '工艺', '双层立衬', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_goods_attribute` VALUES ('34', '1009012', '尺寸', '48*74cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('35', '1009012', '面料成分', '100%棉', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('36', '1009012', '填充成分', '100%聚酯纤维', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('37', '1009012', '重量', '1000g', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('38', '1009012', '产地', '中国', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('39', '1009012', '温馨提示', '枕芯类商品受身高、体型、睡眠习惯不同，产生不同的使用体验，建议多试睡几款枕头，挑选最适合的进行使用。', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('40', '1009013', '尺寸', '48*74cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('41', '1009013', '面料成分', '70%高模量聚酯+30%聚酰胺', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('42', '1009013', '填充成分', '100%聚酯纤维', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('43', '1009013', '重量', '1000g', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('44', '1009013', '产地', '中国', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('45', '1009013', '温馨提示', '枕芯类商品受身高、体型、睡眠习惯不同，产生不同的使用体验，建议多试睡几款枕头，挑选最适合的进行使用。', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('46', '1009024', '规格', '65*65*43cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('47', '1009024', '外套材质', '外套帆布：100%棉；外套弹力布：锦纶80%氨纶20%', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('48', '1009024', '内胆材质', '内胆面料：100%锦纶；填充物：聚苯乙烯（发泡粒子）', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('49', '1009024', '*温馨提示', '本品为人工填充粒子，重量难免会有误差，敬请谅解。同时产品在运输过程中受挤压，也可能会造成凹陷。储存时请避免重物挤压以引起泡沫粒子塌陷。', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('50', '1010000', '材质', '100%羊毛', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('51', '1010000', '尺寸', '200*150cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('52', '1010000', '温馨提示', '1.羊毛毯采取传统机织工艺，纯天然织造的，直接接触皮肤会有轻微扎人。\n2.初次使用时会有少量浮毛，建议干洗处理。\n3.商品为纯羊毛织造而成，若有少量气味请通风2-3天去除。', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('53', '1010001', '材质', '100%羊毛', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('54', '1010001', '规格', '200*150cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('55', '1010001', '温馨提示', '1.羊毛毯采取传统机织工艺，纯天然织造的，直接接触皮肤会有轻微扎人。\n2.初次使用时会有少量浮毛，建议干洗处理。\n3.商品为纯羊毛织造而成，若有少量气味请通风2-3天去除。', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('56', '1011004', '面料成分', '100% 棉', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('57', '1011004', '安全技术', 'GB18401-2010 B类', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('58', '1011004', '规格', '150×200cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('59', '1011004', '产品等级', '一等品', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('60', '1011004', '产地', '中国', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('61', '1011004', '重量', '1800g', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('62', '1011004', '温馨提示', '1.深色纯棉毛巾被在织造染色过程中，巾面更易产生微细的纤维浮绒，使用前建议用清水漂洗1-2次，即可去掉产品上的浮绒。\n2.在洗涤时一定要注意不要与衣服混在一起机洗，强力的搓洗会引起掉毛或勾线现象。\n3.纺织品经历印染、织造等多道环节，产品初次拿到可能有些许味道，清水漂洗、晾干后味道即可散去。严选面料全部经过国标检测认证，选用环保活性染料，请放心使用。', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('63', '1015007', '尺寸', '45cm*45cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('64', '1015007', '面料成份', '100%全棉', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('65', '1015007', '内芯面料', '100%全棉', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('66', '1015007', '填充物', '100%聚酯纤维', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('67', '1015007', '重量', '470g（内芯）', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('68', '1015007', '产地', '中国', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('69', '1019000', '填充成分', '聚醚型聚氨酯', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('70', '1019000', '面料成分', '100%聚酯纤维', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('71', '1019000', '尺寸', '50cm×30cm×9cm-7cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('72', '1019000', '颜色', '白色', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('73', '1019000', '适用人数', '单人', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('74', '1019000', '温馨提示', '1.记忆绵产品为进口环保化学材质聚氨酯发泡而成，刚打开包装会有少量聚氨酯气体产生，拆除外套通风除味3-5天即可。                                                                                  2.枕芯类商品受身高、体型、睡眠习惯不同，产生不同的使用体验，建议多试睡几款枕头，挑选最适合的进行使用。', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('75', '1019001', '填充成分', '聚醚型聚氨酯', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('76', '1019001', '面料成分', '100%聚酯纤维', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('77', '1019001', '尺寸', '50cm×30cm×10cm-6cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('78', '1019001', '颜色', '白色', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('79', '1019001', '适用人数', '单人', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('80', '1019001', '温馨提示', '1.记忆绵产品为进口环保化学材质聚氨酯发泡而成，刚打开包装会有少量聚氨酯气体产生，拆除外套通风除味3-5天即可。 2.枕芯类商品受身高、体型、睡眠习惯不同，产生不同的使用体验，建议多试睡几款枕头，挑选最适合的进行使用。', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('81', '1019002', '填充成分', '聚醚型聚氨酯', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('82', '1019002', '面料成分', '聚酯纤维', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('83', '1019002', '尺寸', '135cm×36cm×10cm-7cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('84', '1019002', '颜色', '白色', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('85', '1019002', '适用人数', '双人', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('86', '1019002', '温馨提示', '1.记忆绵产品为进口环保化学材质聚氨酯发泡而成，刚打开包装会有少量聚氨酯气体产生，拆除外套通风除味3-5天即可。 \n2.枕芯类商品受身高、体型、睡眠习惯不同，产生不同的使用体验，建议多试睡几款枕头，挑选最适合的进行使用。', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('87', '1019006', '面料成分', '100%棉', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('88', '1019006', '填充成分', '20% 夜交藤+80% 聚酯纤维', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('89', '1019006', '尺寸', '48*74cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('90', '1019006', '颜色', '白色', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('91', '1019006', '适用人数', '单人', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('92', '1019006', '温馨提示', '1.植物填充，遇梅雨季节需要通风、干燥保存。 \n2.枕芯类商品受身高、体型、睡眠习惯不同，产生不同的使用体验，建议多试睡几款枕头，挑选最适合的进行使用。', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('93', '1020000', '填充成分', '聚氨酯', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('94', '1020000', '面料成分', '100%棉', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('95', '1020000', '尺寸', '33cm×31cm×10cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('96', '1020000', '颜色', '灰色条纹/粉色条纹', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('97', '1021004', '材质', '100%羊毛', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('98', '1021004', '尺寸', '150*200cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('99', '1021004', '产品等级', '一等品', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('100', '1021004', '产地', '中国', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('101', '1021004', '温馨提示', '1.羊毛毯采取传统机织工艺，纯天然织造的，直接接触皮肤会有轻微扎人。\n2.初次使用时会有少量浮毛，建议干洗处理。\n3.商品为纯羊毛织造而成，若有少量气味请通风2-3天去除。', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('102', '1021010', '材质', '100%棉', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('103', '1021010', '安全类别', 'GB18401-2010 B类', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('104', '1021010', '产地', '江苏南通', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('105', '1021010', '根数', '200根', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('106', '1021010', '尺寸', '1.5米床品： 被套 200*230cm/ 枕套：48*74cm*2/ 床单：245*250cm\n1.8米床品：被套 220*240cm/ 枕套：48*74cm*2/ 床单：245*270cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('107', '1021010', '温馨提示', '纺织品经历印染、织造等多道环节，产品初次拿到可能有些许味道，清水漂洗、晾干后味道即可散去。\n严选面料全部经过国标检测认证，选用环保活性染料，请放心使用。', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('108', '1022000', '材质', '100%棉', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('109', '1022000', '安全类别', 'GB18401-2010 B类', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('110', '1022000', '产地', '中国山东', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('111', '1022000', '根数', '200根', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('112', '1022000', '尺寸', '被套200*230cm；床单245*250cm；枕套48*74cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('113', '1022000', '温馨提示', '纺织品经历印染、织造等多道环节，产品初次拿到可能有些许味道，清水漂洗、晾干后味道即可散去。\n严选面料全部经过国标检测认证，选用环保活性染料，请放心使用。', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('114', '1022001', '材质', '100%棉', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('115', '1022001', '安全类别', 'GB18401-2010 B类', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('116', '1022001', '产地', '中国山东', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('117', '1022001', '根数', '200根', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('118', '1022001', '尺寸', '被套200*230cm；床单245*250cm；枕套48*74cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('119', '1022001', '温馨提示', '纺织品经历印染、织造等多道环节，产品初次拿到可能有些许味道，清水漂洗、晾干后味道即可散去。\n严选面料全部经过国标检测认证，选用环保活性染料，请放心使用。', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('120', '1023012', '材质', '100%棉', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('121', '1023012', '尺寸', '180*220cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('122', '1023012', '安全技术类别', 'GB18401-2010 B类', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('123', '1023012', '产品等级', '一等品', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('124', '1023012', '重量', '1480g', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('125', '1023012', '温馨提示', '1.深色纯棉毛巾被在织造染色过程中，巾面更易产生微细的纤维浮绒，使用前建议用清水漂洗1-2次，即可去掉产品上的浮绒。\n2.在洗涤时一定要注意不要与衣服混在一起机洗，强力的搓洗会引起掉毛或勾线现象。\n3.纺织品经历印染、织造等多道环节，产品初次拿到可能有些许味道，清水漂洗、晾干后味道即可散去。严选面料全部经过国标检测认证，选用环保活性染料，请放心使用。', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('126', '1023032', '材质', '100%棉', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('127', '1023032', '安全类别', 'GB18401-2010 B类', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('128', '1023032', '产地', '中国山东', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('129', '1023032', '根数', '200根', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('130', '1023032', '尺寸', '1.5米床品： 被套 200*230cm/ 枕套：48*74cm*2/ 床单：245*250cm\n1.8米床品：被套 220*240cm/ 枕套：48*74cm*2/ 床单：245*270cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('131', '1023032', '工艺', '色织工艺', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('132', '1023032', '温馨提示', '纺织品经历印染、织造等多道环节，产品初次拿到可能有些许味道，清水漂洗、晾干后味道即可散去。\n严选面料全部经过国标检测认证，选用环保活性染料，请放心使用。', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('133', '1023034', '材质', '正面：100%棉  背面：15%棉  85%涤   底衬：100%涤', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('134', '1023034', '填充物', '70% 白鸭绒  30%白鸭绒片', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('135', '1023034', '克重', '250g', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('136', '1023034', '产地', '中国', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('137', '1023034', '安全类别', 'GB18401-2010 B类', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('138', '1023034', '颜色', '水银灰/ 水蓝/ 水粉', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('139', '1027004', '材质', '100%棉', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('140', '1027004', '尺寸', '150*200cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('141', '1027004', '产品等级', '一等品', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('142', '1027004', '颜色', '灰白格/粉白格', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('143', '1027004', '重量', '1136g', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('144', '1029005', '材质', '65% 天丝 35% 亚麻', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('145', '1029005', '尺寸', '1.5米床品： 被套 200*230cm/ 枕套：48*74cm*2/ 床单：245*250cm\n1.8米床品：被套 220*240cm/ 枕套：48*74cm*2/ 床单：245*270cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('146', '1029005', '产地', '中国江苏', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('147', '1029005', '执行标准', 'GB/T 22844-2009', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('148', '1029005', '颜色', '渐变紫 / 渐变绿', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('149', '1029005', '温馨提示', '纺织品经历印染、织造等多道环节，产品初次拿到可能有些许味道，清水漂洗、晾干后味道即可散去。\n严选面料全部经过国标检测认证，选用环保活性染料，请放心使用。', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('150', '1030001', '材质', '面纱：100%羊毛  底纱：55.7%棉  27.1%聚酯纤维  4.7%羊毛   12.5%其他', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('151', '1030001', '产地', '印度', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('152', '1030001', '执行标准', 'QB/T 2756-2005', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('153', '1030001', '尺寸', '160*230cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('154', '1030001', '工艺', '手工编织', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('155', '1030001', '温馨提示', '1：羊毛材质存在一点羊骚味实属正常情况，建议开窗通风，多散散味道即可。\n2：羊毛地毯刚刚开始使用的时候多多少少都会有一点掉毛的情况，建议开始使用的时候用吸尘器多吸几次，之后掉毛的情况就会有改善。  \n3：因为天然羊毛材质，所以脚感会有一点点刺，不属于产品质量问题。', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('156', '1030002', '材质', '绒面：93%羊毛  7%腈纶 衬背：100%棉', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('157', '1030002', '产地', '印度', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('158', '1030002', '执行标准', 'GB/T 27729-2011', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('159', '1030002', '尺寸', '160*230cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('160', '1030002', '工艺', '手工枪刺', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('161', '1030002', '温馨提示', '1：羊毛材质存在一点羊骚味实属正常情况，建议开窗通风，多散散味道即可。\n2：羊毛地毯刚刚开始使用的时候多多少少都会有一点掉毛的情况，建议开始使用的时候用吸尘器多吸几次，之后掉毛的情况就会有改善。  \n3：因为天然羊毛材质，所以脚感会有一点点刺，不属于产品质量问题。', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('162', '1030003', '材质', '面纱： 100%羊毛  底纱： 88.3%棉   11.7%其他', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('163', '1030003', '产地', '印度', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('164', '1030003', '执行标准', 'QB/T 2756-2005', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('165', '1030003', '尺寸', '160*230cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('166', '1030003', '工艺', '手工编织', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('167', '1030003', '温馨提示', '1：羊毛材质存在一点羊骚味实属正常情况，建议开窗通风，多散散味道即可。\n2：羊毛地毯刚刚开始使用的时候多多少少都会有一点掉毛的情况，建议开始使用的时候用吸尘器多吸几次，之后掉毛的情况就会有改善。  \n3：因为天然羊毛材质，所以脚感会有一点点刺，不属于产品质量问题。', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('168', '1030004', '材质', '100%棉', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('169', '1030004', '执行标准', 'GB/T 22844-2009', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('170', '1030004', '尺寸', '1.5米床品： 被套 200*230cm/ 枕套：48*74cm*2/ 床单：245*250cm\n1.8米床品：被套 220*240cm/ 枕套：48*74cm*2/ 床单：245*270cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('171', '1030004', '产地', '中国山东', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('172', '1030004', '颜色', '蓝色/ 灰色', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('173', '1030004', '温馨提示', '纺织品经历印染、织造等多道环节，产品初次拿到可能有些许味道，清水漂洗、晾干后味道即可散去。\n严选面料全部经过国标检测认证，选用环保活性染料，请放心使用。', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('174', '1030005', '材质', '100%亚麻', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('175', '1030005', '执行标准', 'GB/T 22844-2009', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('176', '1030005', '产地', '中国山东', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('177', '1030005', '颜色', '橙色/ 灰色/ 黄色', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('178', '1030005', '工艺', '水洗工艺', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('179', '1030005', '温馨提示', '纺织品经历印染、织造等多道环节，产品初次拿到可能有些许味道，清水漂洗、晾干后味道即可散去。\n严选面料全部经过国标检测认证，选用环保活性染料，请放心使用。', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('180', '1030005', '尺寸', '1.5米床品： 被套 200*230cm/ 枕套：48*74cm*2/ 床单：245*250cm\n1.8米床品：被套 220*240cm/ 枕套：48*74cm*2/ 床单：245*270cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('181', '1030006', '材质', '100%棉', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('182', '1030006', '尺寸', '1.5米床品： 被套 200*230cm/ 枕套：48*74cm*2/ 床单：245*250cm\n1.8米床品：被套 220*240cm/ 枕套：48*74cm*2/ 床单：245*270cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('183', '1030006', '产地', '中国山东', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('184', '1030006', '执行标准', 'GB18401-2010 B类', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('185', '1030006', '颜色', '红色/ 黄色/ 蓝色', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('186', '1030006', '温馨提示', '纺织品经历印染、织造等多道环节，产品初次拿到可能有些许味道，清水漂洗、晾干后味道即可散去。\n严选面料全部经过国标检测认证，选用环保活性染料，请放心使用。', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('187', '1035006', '材质', '100%棉', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('188', '1035006', '产地', '中国浙江', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('189', '1035006', '尺寸', '长61*宽43cm / 长86*宽53cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('190', '1035006', '工艺', '手工制作', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('191', '1035006', '执行标准', 'GB/T 26850-2011', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('192', '1035006', '温馨提示', '纯棉材质在织造染色过程中，表面不可避免会产生微细的纤维浮绒，使用前清水漂洗1-2次，即可去掉浮绒。不属于产品质量问题。', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('193', '1036002', '面料成分', '100% 棉', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('194', '1036002', '填充物', '100% 高山苦荞麦壳', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('195', '1036002', '规格', '74×48cm±1cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('196', '1036002', '填充物重量', '3KG', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('197', '1036002', '温馨提示', '1.天然植物填充，遇梅雨季节需要干燥保存，如有少量飞虫产生，太阳下晒3小时即可去除。 \n2.枕芯类商品受身高、体型、睡眠习惯不同，产生不同的使用体验，建议多试睡几款枕头，挑选最适合的进行使用。', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('198', '1036013', '材质', '100%棉', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('199', '1036013', '尺寸', '150*200*25cm/ 180*200*25cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('200', '1036013', '执行标准', 'FZ/T 62028-2015', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('201', '1036013', '工艺', '双捻工艺', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('202', '1036013', '产地', '浙江 江苏', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('203', '1036013', '温馨提示', '1：针织棉面料因为工艺不可避免原因，使用一段时间后会出现起毛起球现象，使用去毛机修理一下即可。\n2：因为针织的编织工艺，成品在使用过程中会有轻微的变型，不影响使用。', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('204', '1036016', '材质', '100%棉', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('205', '1036016', '尺寸', '150*200cm/ 180*200cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('206', '1036016', '执行标准', 'GB/T 22797-2009', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('207', '1036016', '工艺', '色织水洗工艺', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('208', '1036016', '温馨提示', '纺织品经历印染、织造等多道环节，产品初次拿到可能有些许味道，清水漂洗、晾干后味道即可散去。\n严选面料全部经过国标检测认证，选用环保活性染料，请放心使用。', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('209', '1037011', '规格', '1.5/1.8m*2m*5cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('210', '1037011', '外层面料', '100%聚酯纤维', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('211', '1037011', '里层面料', '100%聚酯纤维', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('212', '1037011', '内芯', '聚氨酯', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('213', '1037011', '温馨提示', '1.记忆绵产品为进口环保化学材质聚氨酯发泡而成，刚打开包装会有少量聚氨酯气体产生，拆除外套通风除味3-5天即可。\n 2.床垫商品受身高、体型、睡眠习惯不同，产生不同的使用体验，建议多试睡几款床垫，挑选最舒适的进行使用。', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('214', '1037012', '填充物', '100%高山苦荞', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('215', '1037012', '尺寸', '40*8cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('216', '1037012', '外用面料', '45%麻45%棉10%聚酯纤维', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('217', '1037012', '温馨提示', '1.天然植物填充，遇梅雨季节需要干燥保存，如有少量飞虫产生，太阳下晒3小时即可去除。\n 2.枕芯类商品受身高、体型、睡眠习惯不同，产生不同的使用体验，建议多试睡几款枕头，挑选最适合的进行使用。\n3.建议每次使用时间控制在15分钟以内。', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('218', '1037012', '商品重量', '0.45kg+-0.05kg', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('219', '1039051', '规格', '33*24*14cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('220', '1039051', '外层面料', '100%棉', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('221', '1039051', '里层面料', '100%聚酯纤维', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('222', '1039051', '内芯', '聚氨酯', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('223', '1039051', '安全技术', 'GB 18401-2010 B类', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('224', '1039051', '*温馨提示', '1,水洗时请将外套取下，用冷水洗涤后置于阴凉处阴干或烘干。不能同褪色衣物同洗，以防沾污、沾色。\n2,外套洗后稍有缩水是正常现象，因是弹性织物，仅需四周拉一下长度即可。\n3,记忆棉不可水洗，请经常保持产品干燥，定期通风（不可曝晒）。若不慎打湿，立即用干毛巾将水分吸干，置于通风处阴干或用冷吹风吹干即可。', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('225', '1043005', '坐垫外层面料', '100%聚酯纤维', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('226', '1043005', '坐垫内芯材料', '聚氨酯', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('227', '1043005', '执行标准', 'GB/T22843-2009', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('228', '1043005', '方形尺寸', '36*36*3cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('229', '1043005', '圆形尺寸', 'Φ34*3cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('230', '1043005', '坐垫套面料', '100%棉', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('231', '1043005', '*温馨提示', '1,水洗时请将外套取下，用冷水洗涤后置于阴凉处阴干或烘干。不能同褪色衣物同洗，以防沾污、沾色。\n2,外套洗后稍有缩水是正常现象，因是弹性织物，仅需四周拉一下长度即可。\n3,记忆棉不可水洗，请经常保持产品干燥，每隔一段时间用吸尘器清理内芯落尘或用手轻轻拍打内芯，放在通风阴凉处适当晾晒即可。。若不慎打湿，立即用干毛巾将水分吸干，置于通风处阴干或用冷吹风吹干即可。', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('232', '1044012', '尺寸', '150*200cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('233', '1044012', '材质', '100%羊毛', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('234', '1044012', '产品等级', '一等品', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('235', '1044012', '安全及时', 'GB 18401-2010 B类', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('236', '1044012', '温馨提示', '1.羊毛毯采取传统机织工艺，纯天然织造的，直接接触皮肤会有轻微扎人。\n2.初次使用时会有少量浮毛，建议干洗处理。\n3.商品为纯羊毛织造而成，若有少量气味请通风2-3天去除。', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('237', '1046044', '材质', '100%美利奴羊毛', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('238', '1046044', '重量', '1260g', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('239', '1046044', '尺寸', '150*200cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('240', '1046044', '执行标准', 'FZ/T 61001-2006', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('241', '1046044', '产品等级', '一等品', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('242', '1048005', '面料', '100% 棉', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('243', '1048005', '尺寸', '45*45cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('244', '1048005', '产地', '中国江苏', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('245', '1048005', '颜色', '真朱红/ 薄缥蓝/ 枯野灰', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('246', '1048005', '执行标准', 'GB/T 22843-2009', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('247', '1048005', '温馨提示', '纺织品经历印染、织造等多道环节，产品初次拿到可能有些许味道，清水漂洗、晾干后味道即可散去。\n严选面料全部经过国标检测认证，选用环保活性染料，请放心使用。', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('248', '1055012', '材质', '外壳：100% 纯棉  内充：100% 聚酯纤维', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('249', '1055012', '克重', '600G/ 1400G', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('250', '1055012', '尺寸', '45*45cm / 66*66cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('251', '1055012', '产地', '中国江苏', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('252', '1055012', '执行标准', 'GB/T 22843-2009', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('253', '1055016', '颜色', '珍珠粉/ 宝石蓝', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('254', '1055016', '尺寸', '45*45cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('255', '1055016', '材质', '主面料：100% 棉\n填充：100% 聚酯纤维', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('256', '1055016', '克重', '600G', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('257', '1055016', '执行标准', 'GB/T 22843-2009', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('258', '1055016', '温馨提示', '纺织品经历印染、织造等多道环节，产品初次拿到可能有些许味道，清水漂洗、晾干后味道即可散去。\n严选面料全部经过国标检测认证，选用环保活性染料，请放心使用。', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('259', '1057036', '尺寸', '45*45cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('260', '1057036', '颜色', '灰紫/ 蓝色/ 灰色/ 咖色', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('261', '1057036', '执行标准', 'GB/T 22843-2009', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('262', '1057036', '填充克重', '600G', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('263', '1057036', '产地', '中国江苏', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('264', '1057036', '材质', '面料：100% 亚麻\n内芯面料：100%棉\n填充：100%聚酯纤维', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('265', '1057036', '温馨提示', '纺织品经历印染、织造等多道环节，产品初次拿到可能有些许味道，清水漂洗、晾干后味道即可散去。\n严选面料全部经过国标检测认证，选用环保活性染料，请放心使用。', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('266', '1064000', '尺寸', '38*38*30cm/60*55*20cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('267', '1064000', '产品标准', 'FZ/T 62011.3-2008', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('268', '1064000', '安全类别', 'GB 18401-2010 B类', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('269', '1064000', '颜色', '米色', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('270', '1064002', '尺寸', '40R/60R', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('271', '1064002', '产品标准', 'FZ/T 62011.3-2008', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('272', '1064002', '安全类别', 'GB 18401-2010 B类', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('273', '1064002', '填充物重量', '110g', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('274', '1064002', '颜色', '蓝白', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('275', '1064003', '产品标准', 'FZ/T 62011.3-2008', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('276', '1064003', '安全类别', 'GB 18401-2010 B类', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('277', '1064003', '尺寸', '29*19cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('278', '1064003', '颜色', '藏青色', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('279', '1064004', '产品标准', 'FZ/T 62011.3-2008', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('280', '1064004', '安全类别', 'GB 18401-2010 B类', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('281', '1064004', '规格', '32*32*32cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('282', '1064004', '颜色', '牛仔条纹', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('283', '1064006', '尺寸', '50x30x10-6cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('284', '1064006', '重量', '0.87kg', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('285', '1064006', '外层面料', '40%棉60%聚酯纤维（接触皮肤面全棉）', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('286', '1064006', '里层面料', '100%聚酯纤维', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('287', '1064006', '内芯', '聚氨酯', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('288', '1064007', '规格', '135x36x10-7cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('289', '1064007', '重量', '2.3kg', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('290', '1064007', '外层面料', '40%棉60%聚酯纤维（接触皮肤面全棉）', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('291', '1064007', '里层面料', '100%聚酯纤维', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('292', '1064007', '内芯', '聚氨酯', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('293', '1064021', '颜色', '本白', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('294', '1064021', '执行标准', 'GB 7000.11-2008', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('295', '1064021', '额定电压', '220-240V', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('296', '1064021', '型号', 'T710', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('297', '1064021', '温馨提示', '本产品不包含灯泡', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('298', '1064021', '产地', '中国中山', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('299', '1064022', '颜色', '本白', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('300', '1064022', '执行标准', 'GB 7000.11-2008', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('301', '1064022', '型号', 'F710', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('302', '1064022', '额定电压', '220-240V', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('303', '1064022', '温馨提示', '本产品不包含灯泡', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('304', '1064022', '产地', '中国中山', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('305', '1065004', '尺寸', '150*30cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('306', '1065004', '颜色', '原木色/ 棕色', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('307', '1065004', '执行标准', 'GB/T 23148-2008', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('308', '1065004', '产地', '中国苏州', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('309', '1065004', '温馨提示', '原木色为水曲柳贴皮，棕色为胡桃木贴皮。', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('310', '1065005', '尺寸', '150*28cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('311', '1065005', '颜色', '棕色', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('312', '1065005', '执行标准', 'GB/T 23148-2008', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('313', '1065005', '产地', '中国江苏', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('314', '1068010', '填充物重量', '1300g/1560g', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('315', '1068010', '尺寸', '1.5*2m/1.8*2m', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('316', '1068010', '外层面料', '100%棉', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('317', '1068010', '填充物', '100%羊毛', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('318', '1068010', '执行标准', 'GB/T 22843-2009', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('319', '1068010', '产品等级', '合格品', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('320', '1068010', '厚度', '3cm+-视商品干燥情况有少量浮动', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('321', '1068011', '填充物', '60%、90%驼绒/40%、10%驼毛', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('322', '1068011', '面料', '100%棉', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('323', '1068011', '尺寸', '200*230cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('324', '1068011', '填充物重量', '2000g', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('325', '1068012', '尺寸', '1.5米床品： 被套 200*230cm/ 枕套：48*74cm*2/ 床单：245*250cm\n1.8米床品：被套 220*240cm/ 枕套：48*74cm*2/ 床单：245*270cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('326', '1068012', '颜色', '灰紫/ 浅咖色', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('327', '1068012', '印染工艺', '色织工艺', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('328', '1068012', '执行标准', 'GB/T 22844-2009', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('329', '1068012', '温馨提示', '纺织品经历印染、织造等多道环节，产品初次拿到可能有些许味道，清水漂洗、晾干后味道即可散去。 严选面料全部经过国标检测认证，选用环保活性染料，请放心使用。', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('330', '1068012', '产地', '中国山东', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('331', '1068012', '材质', '面料：100%棉  填充物：65% 棉/ 35%聚酯纤维', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('332', '1071004', '尺寸', '48*38*13cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('333', '1071004', '配色', '黑红/白姜黄', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('334', '1071004', '材质', '聚丙烯树脂', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('335', '1071004', '执行标准', 'GB 9688-1988', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('336', '1071004', '产品等级', '合格品', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('337', '1071005', '尺寸', '185*160*100MM', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('338', '1071005', '材料', '聚丙烯树脂', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('339', '1071005', '执行标准', 'GB 9688-1988', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('340', '1071005', '产品等级', '合格品', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('341', '1071006', '规格', '200*60mm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('342', '1071006', '材料', '聚丙烯树脂', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('343', '1071006', '执行标准', 'GB 9688-1988', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('344', '1072000', '颜色', '象牙白/ 芥子黄/ 银铅色', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('345', '1072000', '尺寸', '45*45cm/ 66*66cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('346', '1072000', '执行标准', 'GB/T 22843-2009', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('347', '1072000', '工艺', '手工编织', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('348', '1072000', '产地', '中国山东', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('349', '1072000', '温馨提示', '此产品不含抱枕芯', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('350', '1072001', '颜色', '缥蓝色/ 薄灰色/ 象牙色/ 赤紫色', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('351', '1072001', '尺寸', '45*45cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('352', '1072001', '执行标准', 'GB/T 22843-2009', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('353', '1072001', '工艺', '色织水洗', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('354', '1072001', '产地', '中国山东', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('355', '1072001', '温馨提示', '此产品不含抱枕芯', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('356', '1075023', '规格', '48*74cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('357', '1075023', '填充物', '20%白鸭绒+80%白鹅毛片', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('358', '1075023', '填充物重量', '200g白鸭绒+800g白鹅毛片', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('359', '1075023', '面料', '100%棉', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('360', '1075023', '执行标准', 'QB/T 1194-2012', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('361', '1075024', '填充成分', '白鹅绒', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('362', '1075024', '含绒量', '95%', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('363', '1075024', '面料', '100%纯棉', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('364', '1075024', '面料参数', '120支 500根', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('365', '1075024', '填充物重量', '1500g/1700g', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('366', '1075024', '尺寸', '200*230cm/220*240cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('367', '1075024', '工艺', '双层立衬', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('368', '1081000', '尺寸', '35*45cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('369', '1081000', '执行标准', 'GB/T 22843-2009', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('370', '1081000', '产地', '浙江杭州', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('371', '1081000', '材质', '100% 聚酯纤维', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('372', '1081002', '尺寸', '45*45cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('373', '1081002', '执行标准', 'GB/T 22843-2009', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('374', '1081002', '材质', '100% 聚酯纤维', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('375', '1081002', '产地', '浙江杭州', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('376', '1083009', '鲜花', '厄瓜多尔玫瑰', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('377', '1083009', '朵数', '1朵', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('378', '1083009', '颜色', '妖姬蓝', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('379', '1083009', '尺寸', '17*17*12cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('380', '1083009', '花材种植地', '厄瓜多尔', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('381', '1083010', '鲜花主材', '奥斯汀玫瑰、泉水玫瑰、绣球', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('382', '1083010', '鲜花辅材', '棉毛苏叶、细爪草、褐色果、满天星', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('383', '1083010', '颜色', '柔情粉', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('384', '1083010', '尺寸', '17*17*12cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('385', '1083010', '花材种植地', '日本', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('386', '1083010', '*温馨提示', '由于花材的季节性供应特点，个别配材会有所调整，且因花材批次不同会有一定微小色差，不会影响整体花盒效果。', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('387', '1084001', '材质', '100%纯棉', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('388', '1084001', '尺寸', '150*200cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('389', '1084001', '产品标准', 'FZ/T 61001-2006', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('390', '1084001', '安全技术', 'GB18401-2010 B类', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('391', '1084001', '温馨提示', '1.纯棉毯采取传统针织工艺，纯天然织造的，使用前建议清洗一遍去除少量浮尘。\n2.商品为纯棉织造而成，若有少量气味请通风2-3天去除。\n3.纯棉针织盖毯清洗数次之后，可能存在微量变形，建议干洗。', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('392', '1084001', '重量', '1280g', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('393', '1084003', '材质', '100%棉', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('394', '1084003', '尺寸', '150*200cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('395', '1084003', '产品标准', 'FZ/T 61001-2006', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('396', '1084003', '安全技术', 'GB18401-2010 B类', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('397', '1084003', '温馨提示', '1.纯棉毯采取传统针织工艺，纯天然织造的，使用前建议清洗一遍去除少量浮尘。\n2.商品为纯棉织造而成，若有少量气味请通风2-3天去除。\n3.纯棉针织盖毯清洗数次之后，可能存在微量变形，建议干洗。', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('398', '1084003', '重量', '1115g', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('399', '1086015', '颜色', '本白/ 哑黑/ 姜黄', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('400', '1086015', '执行标准', 'GB 7000.11-2008', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('401', '1086015', '产地', '中国广东', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('402', '1086015', '型号', 'MT20290-1-130', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('403', '1086015', '温馨提示', '本产品不含灯泡', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('404', '1086023', '材质', '100%聚酯纤维', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('405', '1086023', '搭扣', '锌合金', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('406', '1086023', '拉带规格', '120cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('407', '1086023', '颈圈规格', '30-45cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('408', '1086024', '材质', '100%锦纶', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('409', '1086024', '搭扣', '锌合金', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('410', '1086024', '颈圈', '30-45cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('411', '1086024', '拉带', '120cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('412', '1086025', '材质', '100%锦纶', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('413', '1086025', '搭扣', '锌合金', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('414', '1086025', '拉带规格', '120cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('415', '1086025', '产品标准', 'FZ/T 63005-2010', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('416', '1086026', '材质', '100%锦纶', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('417', '1086026', '搭扣', '锌合金', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('418', '1086026', '颈圈尺寸', '30-45cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('419', '1086026', '拉带尺寸', '120cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('420', '1090004', '尺寸', '1.5米床品： 被套 200*230cm/ 枕套：48*74cm*2/ 床笠：150*200*25cm\n1.8米床品：被套 220*240cm/ 枕套：48*74cm*2/ 床笠：180*200*25cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('421', '1090004', '颜色', '红色格子/ 蓝色格子/ 绿色格子/ 灰色格子', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('422', '1090004', '执行标准', 'GB/T 22844-2009', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('423', '1090004', '工艺', '色织工艺', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('424', '1090004', '温馨提示', '1：纺织品经历印染、织造等多道环节，产品初次拿到可能有些许味道，清水漂洗、晾干后味道即可散去。 严选面料全部经过国标检测认证，选用环保活性染料，请放心使用。\n2：不同批次面料和拉链稍有差异，请以实物为准。', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('425', '1092024', '尺寸', '200*230cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('426', '1092024', '填充物', '100%桑蚕丝', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('427', '1092024', '填充物重量', '1500g', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('428', '1092024', '外套', '100%纯棉纱布', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('429', '1092024', '执行标准', 'GB/T 24252-2009', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('430', '1092024', '安全技术类别', 'GB 18401-2010 B类', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('431', '1092038', '尺寸', '470*128*13mm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('432', '1092038', '材质', '天然桐木', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('433', '1092038', '重量', '200g', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('434', '1092038', '颜色', 'GB/T 28495-2012', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('435', '1092039', '尺寸', '385mmX385mmX135mm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('436', '1092039', '重量', '950g', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('437', '1092039', '材质', '美卡瓦楞纸板', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('438', '1092039', '颜色', '本色', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('439', '1093000', '材质', 'PU+PE（枝干）', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('440', '1093000', '颜色', '白色', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('441', '1093000', '长度', '81cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('442', '1093000', '花草种类', '木棉花', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('443', '1093001', '材质', 'PU+PE（枝干）', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('444', '1093001', '颜色', '白色', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('445', '1093001', '长度', '35cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('446', '1093001', '花草种类', '马蹄莲', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('447', '1093001', '数量', '一束（9朵）', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('448', '1093002', '材质', 'PU+玻璃', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('449', '1093002', '颜色', '白色', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('450', '1093002', '长度', '33cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('451', '1093002', '花草种类', '木棉花', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('452', '1097004', '材质', '北美白橡木', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('453', '1097004', '涂漆', '环保涂漆', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('454', '1097004', '产品尺寸', '1400/1600*820*750mm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('455', '1097004', '安装方式', '需要组装', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('456', '1097005', '材质', '北美白橡木', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('457', '1097005', '涂漆', '环保涂漆', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('458', '1097005', '产品尺寸', '430*520*870mm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('459', '1097005', '安装方式', '无需组装', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('460', '1097006', '材质', '北美白橡木', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('461', '1097006', '涂漆', '环保涂漆', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('462', '1097006', '产品尺寸', '600*600*550mm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('463', '1097006', '安装方式', '需要组装', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('464', '1097007', '材质', '北美白橡木', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('465', '1097007', '涂漆', '环保涂漆', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('466', '1097007', '产品尺寸', '600*600*530/650mm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('467', '1097007', '安装方式', '需要组装', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('468', '1097009', '材质', '北美白橡木+抽屉背板桐木', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('469', '1097009', '涂漆', '环保涂漆', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('470', '1097009', '产品尺寸', '1000/1200*580*910mm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('471', '1097009', '安装方式', '需要组装', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('472', '1097011', '材质', '北美白橡木+床铺板松木', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('473', '1097011', '涂漆', '环保涂漆', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('474', '1097011', '产品尺寸', '2065*2188*1088mm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('475', '1097011', '安装方式', '需要组装', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('476', '1097012', '材质', '北美白橡木+抽屉背板桐木', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('477', '1097012', '涂漆', '环保涂漆', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('478', '1097012', '产品尺寸', '480*400*550mm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('479', '1097012', '安装方式', '需要组装', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('480', '1097013', '材质', '北美白橡木+抽屉背板桐木', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('481', '1097013', '涂漆', '环保涂漆', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('482', '1097013', '产品尺寸', '800*430*1100mm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('483', '1097013', '安装方式', '需要组装', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('484', '1097014', '材质', '北美白橡木+抽屉背板桐木', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('485', '1097014', '涂漆', '环保涂漆', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('486', '1097014', '产品尺寸', '860*400*1200mm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('487', '1097014', '安装方式', '需要组装', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('488', '1097016', '材质', '北美白橡木+抽屉背板桐木', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('489', '1097016', '涂漆', '环保涂漆', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('490', '1097016', '产品尺寸', '1800*450*525mm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('491', '1097016', '安装方式', '需要组装', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('492', '1097017', '材质', '北美白橡木+抽屉背板桐木', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('493', '1097017', '涂漆', '环保涂漆', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('494', '1097017', '产品尺寸', '1200*600*450mm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('495', '1097017', '安装方式', '需要组装', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('496', '1100000', '材质', '100% 棉', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('497', '1100000', '执行标准', 'GB/T 22796-2009', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('498', '1100000', '颜色', '石板灰/ 烟褐色', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('499', '1100000', '尺寸', '48*74cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('500', '1100000', '工艺', '水洗工艺', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('501', '1100000', '产地', '中国江苏', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('502', '1100000', '温馨提示', '纺织品经历印染、织造等多道环节，产品初次拿到可能有些许味道，清水漂洗、晾干后味道即可散去。\n严选面料全部经过国标检测认证，选用环保活性染料，请放心使用。', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('503', '1100001', '材质', '100% 棉', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('504', '1100001', '执行标准', 'GB/T 22797-2009', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('505', '1100001', '颜色', '石板灰/ 烟褐色', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('506', '1100001', '尺寸', '245*250cm/ 245*270cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('507', '1100001', '工艺', '水洗工艺', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('508', '1100001', '产地', '中国江苏', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('509', '1100001', '温馨提示', '纺织品经历印染、织造等多道环节，产品初次拿到可能有些许味道，清水漂洗、晾干后味道即可散去。\n严选面料全部经过国标检测认证，选用环保活性染料，请放心使用。', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('510', '1100002', '材质', '100%棉', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('511', '1100002', '执行标准', 'GB/T 22797-2009', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('512', '1100002', '尺寸', '150*200*25cm/ 180*200*25cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('513', '1100002', '颜色', '石板灰/ 烟褐色', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('514', '1100002', '产地', '中国江苏', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('515', '1100002', '工艺', '水洗工艺', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('516', '1100002', '温馨提示', '纺织品经历印染、织造等多道环节，产品初次拿到可能有些许味道，清水漂洗、晾干后味道即可散去。\n严选面料全部经过国标检测认证，选用环保活性染料，请放心使用。', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('517', '1108029', '规格尺寸', '290*260*380mm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('518', '1108029', '材料', '美耐皿树脂\n硅胶\n201不锈钢（奥氏体型）', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('519', '1108029', '执行标准', 'GB 9684-2011', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('520', '1108030', '尺寸', '177*88*51mm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('521', '1108030', '材料', '美耐皿树脂、聚碳酸酯（pc）', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('522', '1108030', '执行标准', 'QB 1999-1994', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('523', '1108031', '规格尺寸', 'S 145*133*75mm\nM 187.4*172.5*97.4mm\nL 232*213*122.2mm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('524', '1108031', '材料', '美耐皿树脂、201不锈钢（奥氏体型）', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('525', '1108031', '执行标准', 'GB 9684-2011', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('526', '1108032', '规格尺寸', 'S 128*88*55mm\nM 150*100*72mm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('527', '1108032', '材料', '硅胶', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('528', '1108032', '执行标准', 'GB 4806.1-1994', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('529', '1109004', '尺寸', '10寸/12寸', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('530', '1109004', '机芯', '太阳机芯', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('531', '1109004', '材质', '水柳木/胡桃木', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('532', '1109004', '能源', '5号电池*1（本产品不含电池）', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('533', '1109005', '材质', '榉木', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('534', '1109005', '尺寸', '12*4.5*12cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('535', '1109005', '机芯类型', '扫秒机芯', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('536', '1109005', '颜色', '原木色', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('537', '1109005', '能源', '5号电池*1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('538', '1109008', '填充物', '颗粒海绵', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('539', '1109008', '框架材质', '国际标准钢管', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('540', '1109008', '面料成分', '15%亚麻+85%涤', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('541', '1109008', '颜色', '米白色', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('542', '1109008', '是否组装', '组装【沙发脚】', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('543', '1109008', '产品尺寸', '2P:1300*930*930mm;   1P:680*930*930mm;    0.5P:670*450*380mm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('544', '1109034', '颜色', '象牙白', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('545', '1109034', '执行标准', 'GB/T22779-2008', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('546', '1109034', '尺寸', '9.8 x 3.05 x 5.8cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('547', '1110002', '材质', 'ABS树脂+PP树脂', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('548', '1110002', 'USB线长', '约1m', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('549', '1110002', '尺寸', '102mm*130mm*85mm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('550', '1110002', '颜色', '本白/冷灰/樱花粉/静谧蓝', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('551', '1110003', '材质', '100% 棉', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('552', '1110003', '尺寸', '1.5米床品（床笠款）： 被套 200*230cm/ 枕套：48*74cm*2/ 床笠：150*200*28cm\n1.8米床品（床笠款）：被套 220*240cm/ 枕套：48*74cm*2/ 床笠：180*200*28cm\n1.5米床品（床单款）： 被套 200*230cm/ 枕套：48*74cm*2/ 床单：245*250cm\n1.8米床品（床单款）：被套 220*240cm/ 枕套：48*74cm*2/ 床单：245*270cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('553', '1110003', '执行标准', 'GB/T22844-2009', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('554', '1110003', '颜色', '烟草绿/ 木兰黄/ 深茶褐/ 丁子灰', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('555', '1110003', '产地', '中国江苏', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('556', '1110004', '材质', '100%棉', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('557', '1110004', '尺寸', '1.5米床品（床笠款）： 被套 200*230cm/ 枕套：48*74cm*2/ 床笠：150*200*28cm\n1.8米床品（床笠款）：被套 220*240cm/ 枕套：48*74cm*2/ 床笠：180*200*28cm\n1.5米床品（床单款）： 被套 200*230cm/ 枕套：48*74cm*2/ 床单：245*250cm\n1.8米床品（床单款）：被套 220*240cm/ 枕套：48*74cm*2/ 床单：245*270cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('558', '1110004', '执行标准', 'GB/T22844-2009', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('559', '1110004', '颜色', '烟草绿/ 深茶褐/ 丁子灰/ 木兰黄/ 茶香粉', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('560', '1110004', '产地', '中国江苏', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('561', '1110007', '材质', '100% 棉', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('562', '1110007', '尺寸', '1.5米床品： 被套 200*230cm/ 枕套：48*74cm*2/ 床笠：150*200*28cm\n1.8米床品：被套 220*240cm/ 枕套：48*74cm*2/ 床笠：180*200*28cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('563', '1110007', '执行标准', 'GB/T 22844-2009', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('564', '1110007', '印染工艺', '色织工艺', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('565', '1110007', '颜色', '松柏绿/ 枯茶褐/ 灰白/ 石竹咖', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('566', '1110007', '产地', '中国江苏', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('567', '1110008', '材质', '100% 棉', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('568', '1110008', '尺寸', '1.5M床：245*250cm\n1.8M床：245*270cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('569', '1110008', '颜色', '天蓝色/ 烟草色/ 茶香粉/ 蜜橙/ 千岁绿/ 荧光绿/ 青蓝/ 伽罗色', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('570', '1110008', '执行标准', 'GB 18401-2009 B类', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('571', '1110008', '产地', '中国江苏', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('572', '1110013', '规格', 'S号 最长拉伸2.5m\nM号 最长拉伸4m', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('573', '1110013', '承重范围', 's  15公斤以下\nm  30公斤以下', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('574', '1110013', '材料', '塑胶（ABS TPR）\n耐拉反光涤纶带\n锌合金钩', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('575', '1110013', '执行标准', 'Q/PM002-2016', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('576', '1110013', '安全类别', '符合RoHs六项检测', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('577', '1110014', '规格', 'S号 最长拉绳2.5m\nM号 最长拉伸4m', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('578', '1110014', '承重范围', '15-30kg', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('579', '1110014', '材质', '塑胶（ABS TPR）\n耐拉反光涤纶带\n锌合金钩', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('580', '1110014', '颜色', '日式木纹色', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('581', '1110014', '执行标准', 'Q/PM002-2016', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('582', '1110014', '安全类别', '符合RoHs六项检测', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('583', '1110015', '规格', 'S号 最长拉绳2.5M', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('584', '1110015', '承重范围', 'S 10-15kg\nM 15-30KG', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('585', '1110015', '材料', '塑胶（ABS TPR）\n高强耐拉反光涤纶带\n锌合金钩', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('586', '1110015', '颜色', '迷彩', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('587', '1110015', '执行标准', 'Q/PM002-2016', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('588', '1110015', '安全类别', '符合RoHs六项检测', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('589', '1110016', '尺寸', '188*98*30MM', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('590', '1110016', '材料', '塑胶（ABS PVC）硅胶', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('591', '1110016', '颜色', '蓝色/粉色', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('592', '1110016', '执行标准', 'Q/PM001-2016', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('593', '1110016', '安全类别', '符合RoHs六项检测', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('594', '1110016', '产品等级', '合格品', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('595', '1110016', '温馨提示', '因宠物模特选择范围有限，故让小萨出镜，其实这款更适合猫咪和小狗用哦。', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('596', '1110017', '规格', '小剪刀*1+中号理毛梳*1+针梳*1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('597', '1110017', '材料', '合金钢、不锈钢针、塑胶（PP TPR）', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('598', '1110017', '颜色', '白黑', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('599', '1110017', '执行标准', 'Q/PM001-2016\nQ/PM003-2016', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('600', '1110017', '安全类别', '符合RoHs六项检测', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('601', '1110018', '规格', '大剪刀*1+大号钢针梳*1+双排针梳*1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('602', '1110018', '材料', '合金钢、不锈钢针、塑胶（PP TPR）', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('603', '1110018', '颜色', '白黑', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('604', '1110018', '执行标准', 'Q/PM001-2016\nQ/PM003-2016', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('605', '1110018', '安全类别', '符合RoHs六项检测', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('606', '1110019', '规格', '宠物安全指甲剪+指甲锉', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('607', '1110019', '材料', '合金钢 \n塑胶（TPR）', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('608', '1110019', '执行标准', 'Q/PM003-2016', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('609', '1110019', '安全类别', '符合RoHs六项检测', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('610', '1115023', '尺寸', '200*230cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('611', '1115023', '填充物重量', '1500g', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('612', '1115023', '执行标准', 'GB/T 24252-2009', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('613', '1115023', '填充物', '100%桑蚕丝', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('614', '1115023', '外套', '100%纯棉纱布', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('615', '1115023', '安全技术类别', 'GB 18401-2010 B类', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('616', '1115028', '材质', '100% 棉', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('617', '1115028', '尺寸', '1.5米床品： 被套 200*230cm/ 枕套：48*74cm*2/ 床笠：150*200*28cm\n1.8米床品：被套 220*240cm/ 枕套：48*74cm*2/ 床笠：180*200*28cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('618', '1115028', '执行标准', 'GB/T 22844-2009', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('619', '1115028', '印染工艺', '色织工艺', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('620', '1115028', '颜色', '黑茶条纹/ 若绿条纹/ 缥蓝条纹/ 素麻条纹', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('621', '1115028', '产地', '中国江苏', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('622', '1115052', '尺寸', '直径50cm*高5cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('623', '1115052', '材质', '席面：蔺草/ 包边：65%聚酯纤维 35%棉 / 内芯：EPE', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('624', '1115052', '执行标准', 'QB/T 2934-2008', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('625', '1115052', '产地', '中国浙江', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('626', '1115053', '尺寸', '1.5米草席： 草席：150*195cm/ 枕套：48*74cm*2\n1.8米草席：草席：180*200cm/ 枕套：枕套：48*74cm*2', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('627', '1115053', '材质', '席面：蔺草/  枕套面：蔺草/ 包边：65% 聚酯纤维  35% 棉/ 枕套背面：100% 聚酯纤维', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('628', '1115053', '执行标准', 'QB/T 2934-2008', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('629', '1115053', '产地', '中国浙江', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('630', '1116030', '花材', '厄瓜多尔玫瑰', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('631', '1116030', '附加功能', '音乐盒', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('632', '1116030', '产品尺寸', '直径10.5cm*高17cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('633', '1116030', '颜色', '黑色花朵+粉色底座', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('634', '1116031', '花材', '厄瓜多尔玫瑰', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('635', '1116031', '附加功能', '音乐盒', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('636', '1116031', '产品尺寸', '直径10.5cm*高17cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('637', '1116031', '颜色', '渐变粉花朵+灰色底座', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('638', '1116032', '主体材质', '铝合金+布艺', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('639', '1116032', '填充物', '高回弹海绵', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('640', '1116032', '躺椅尺寸', '840*1250*1090mm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('641', '1116032', '脚蹬尺寸', '550*445*450mm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('642', '1116032', '安装方式', '自行组装', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('643', '1116032', '*特别提醒', '1.周六日暂无法发货，周末订单延至周一发货，请知悉！\n2.本产品配送范围：江浙沪、安徽、山东、福建、江西、湖北、河南、北京、天津、湖南、河北、山西、陕西、重庆、四川、海南、广西、贵州、云南、广东、辽宁、甘肃、宁夏、青海、内蒙古、吉林、黑龙江、新疆、西藏（航空件）\n3.本产品配送整件，不包安装，收到货物后，请自行按照产品说明书进行组装。如果组装时碰到无法解决的问题，可联系客服获取指导。', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('644', '1116033', '椅身材质', '高弹力进口网布', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('645', '1116033', '扶手材质', 'PU', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('646', '1116033', '框架材质', '烤漆钢+工程塑料', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('647', '1116033', '椅轮', 'PA万向椅轮', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('648', '1116033', '气杆', '三弘气压杆', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('649', '1116033', '产品尺寸', '700*700*1160mm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('650', '1116033', '安装方式', '自行组装', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('651', '1116033', '*特别提醒', '1.周六日暂无法发货，周末订单延至周一发货，请知悉！\n2.本产品配送范围：江浙沪、安徽、山东、福建、江西、湖北、河南、北京、天津、湖南、河北、山西、陕西、重庆、四川、海南、广西、贵州、云南、广东、辽宁、甘肃、宁夏、青海、内蒙古、吉林、黑龙江、新疆、西藏（航空件）\n3.本产品配送整件，不包安装，收到货物后，请自行按照产品说明书进行组装。如果组装时碰到无法解决的问题，可联系客服获取指导。', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('652', '1125016', '材质', '树脂', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('653', '1125016', '颜色', '黄色/蓝色', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('654', '1125016', '尺寸', '129mm*96mm*302mm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('655', '1125016', '摆件类型', '收纳型桌面摆件', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('656', '1125017', '材质', '陶瓷', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('657', '1125017', '颜色', '粉色/哑黑', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('658', '1125017', '尺寸', '160mm*145mm*135mm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('659', '1125017', '摆件类型', '桌面摆件', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('660', '1127003', '执行标准', 'QB/T 1952.2-2011', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('661', '1127003', '弹簧结构特征', '独立袋装弹簧', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('662', '1127003', '使用场所', '卧室、榻榻米', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('663', '1127003', '主要原材料', '进口乳胶', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('664', '1127003', '辅料', '软硬质海绵', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('665', '1127003', '高度', '25cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('666', '1127003', '配送范围', '以客服回复可配送范围为准', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('667', '1127003', '重量', '150*200cm  54+-3kg\n180*200cm   62+-3kg', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('668', '1127038', '材质', '100% 棉', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('669', '1127038', '尺寸', '1.5米床品： 被套 200*230cm/ 枕套：48*74cm*2/ 床单：245*250cm\n1.8米床品：被套 220*240cm/ 枕套：48*74cm*2/ 床单：245*270cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('670', '1127038', '颜色', '星空蓝', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('671', '1127038', '执行标准', 'GB/T 22844-2009', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('672', '1127038', '产地', '中国山东', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('673', '1127039', '材质', '100% 棉', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('674', '1127039', '尺寸', '1.5米床品： 被套 200*230cm/ 枕套：48*74cm*2/ 床单：245*250cm\n1.8米床品：被套 220*240cm/ 枕套：48*74cm*2/ 床单：245*270cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('675', '1127039', '颜色', '青粉拼接', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('676', '1127039', '执行标准', 'GB/T 22844-2009', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('677', '1127039', '产地', '中国山东', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('678', '1127052', '面料', '100%棉', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('679', '1127052', '填充物', '100%棉', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('680', '1127052', '执行标准', 'GB/T22796-2009', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('681', '1127052', '安全技术类别', 'GB18401-2010 A类', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('682', '1127052', '规格', '150*200cm/180*200cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('683', '1128002', '尺寸', '160*230cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('684', '1128002', '颜色', '青粉拼接', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('685', '1128002', '产地', '中国北京', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('686', '1128002', '材质', '绒面：100% 聚酯纤维 背面：52% 聚酯纤维/ 48% 棉', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('687', '1130037', '规格', '40*40*7cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('688', '1130037', '填充物', '100%聚酯纤维', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('689', '1130037', '填充物克重', '330g', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('690', '1130037', '面料', '100%棉', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('691', '1130037', '颜色', '米白/深褐', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('692', '1130037', '执行标准', 'GB/T 22843-2009', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('693', '1130037', '安全技术类别', 'GB 18401-2010 B类', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('694', '1130038', '填充物', '100%聚酯纤维', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('695', '1130038', '填充物重量', '340g/725g', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('696', '1130038', '面料', '100%聚酯纤维', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('697', '1130038', '执行标准', 'FZ/T 62011.3-2008', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('698', '1130038', '安全类别', 'GB 18401-2010 B类', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('699', '1130038', '产品等级', '合格品', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('700', '1130039', '填充物', '100%聚酯纤维', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('701', '1130039', '面料', '100%聚酯纤维', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('702', '1130039', '填充物重量', '170g/250g', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('703', '1130039', '执行标准', 'FZ/T 62011.3-2008', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('704', '1130041', '规格', '45*45cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('705', '1130041', '重量', '0.4-0.6kg', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('706', '1130041', '材料', '面100%羊毛皮\n衬100%聚酯纤维', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('707', '1130041', '执行标准', 'QB/T2972-2008', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('708', '1130042', '规格', '小号：90*50cm+-2\n双拼：180*55cm+-2', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('709', '1130042', '重量', '小号：0.6-0.9kg\n双拼：1.2-2kg', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('710', '1130042', '材料', '100%羊毛皮', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('711', '1130042', '执行标准', 'QB/T 2972-2008', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('712', '1130042', '产品等级', '一等品', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('713', '1130042', '备注', '黑色商品接触液体会有少量掉色', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('714', '1130049', '面料', '65%莱赛尔（天丝）35%亚麻', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('715', '1130049', '填充物', '100%桑蚕丝', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('716', '1130049', '执行标准', 'GB/T 24252-2009', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('717', '1130049', '安全类别', 'GB 18401-2010 B类', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('718', '1130049', '产品等级', '合格品', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('719', '1130049', '填充物克重', '360g（小）/470g（大）', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('720', '1130056', '材质', '席面：头层牛皮革/ 枕套面：头层牛皮革/ 枕套背面：100%聚酯纤维', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('721', '1130056', '尺寸', '1.5米床：牛皮席：150x200cm/ 枕套：74x48cmx2\n1.8米床：牛皮席：180x200cm/ 枕套：74x48cmx2', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('722', '1130056', '鞣制方式', '铬植结合鞣', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('723', '1130056', '颜色', '苋红色/ 象牙黄/ 橄榄棕/ 亮银灰', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('724', '1130056', '执行标准', 'QB/T 4204-2011', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('725', '1130056', '产地', '中国重庆', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('726', '1131017', '材质', '席面：毛竹\n包边：100%棉\n背面：100%棉', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('727', '1131017', '尺寸', '150x195cm/ 180x200cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('728', '1131017', '颜色', '抹茶色', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('729', '1131017', '执行标准', 'LY/T 1843-2009', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('730', '1131017', '产地', '中国浙江', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('731', '1134022', '材质', '绒面：100% 聚酯纤维\n背面：TPR', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('732', '1134022', '颜色', '多色条纹', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('733', '1134022', '尺寸', '86*61cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('734', '1134022', '产地', '中国浙江', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('735', '1134022', '执行标准', 'QB/T 3000-2008', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('736', '1134030', '规格尺寸', '方形38*38*3cm\n圆形 φ38*3cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('737', '1134030', '填充物重量', '方形：185g\n圆形155g', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('738', '1134030', '面料', '100%聚酯纤维', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('739', '1134030', '执行标准', 'GB/T 22843-2009', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('740', '1134030', '安全类别', 'GB18401-2010 B类', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('741', '1134030', '产品等级', '合格品', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('742', '1134032', '规格尺寸', '方形：380*380*30mm\n圆形：φ380*30mm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('743', '1134032', '填充物', '聚氨酯', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('744', '1134032', '填充物重量', '方形：185g\n圆形：155g', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('745', '1134032', '面料', '100%聚酯纤维', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('746', '1134032', '执行标准', 'GB/T 22843-2009', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('747', '1134032', '安全技术类别', 'GB18401-2010 B类', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('748', '1134056', '材质', '70%棉，30%莫代尔', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('749', '1134056', '尺寸', '1.5米床品： 被套 200*230cm/ 枕套：48*74cm*2/ 床单：245*250cm\n1.8米床品：被套 220*240cm/ 枕套：48*74cm*2/ 床单：245*270cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('750', '1134056', '颜色', '砖釉红/菡萏粉/浅豆绿/青丝灰', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('751', '1134056', '执行标准', 'GB/T 22844-2009', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('752', '1134056', '产地', '中国江苏', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('753', '1135000', '材质', '100%棉', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('754', '1135000', '尺寸', '1.5米床品： 被套 200*230cm/ 枕套：48*74cm*2/ 床单：245*250cm\n1.8米床品：被套 220*240cm/ 枕套：48*74cm*2/ 床单：245*270cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('755', '1135000', '颜色', '蒂芙尼蓝/ 墨黑/ 亮橙/ 浅灰', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('756', '1135000', '执行标准', 'GB/T 22844-2009', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('757', '1135000', '产地', '中国江苏', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('758', '1135001', '材质', '100%棉', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('759', '1135001', '尺寸', '1.5米床品： 被套 200*230cm/ 枕套：48*74cm*2/ 床单：245*250cm\n1.8米床品：被套 220*240cm/ 枕套：48*74cm*2/ 床单：245*270cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('760', '1135001', '颜色', '草绿色', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('761', '1135001', '执行标准', 'GB/T 22844-2009', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('762', '1135001', '产地', '中国江苏', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('763', '1135002', '材质', '100% 桑蚕丝', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('764', '1135002', '尺寸', '1.5米床品： 被套 200*230cm/ 枕套：48*74cm*2/ 床单：245*250cm\n1.8米床品：被套 220*240cm/ 枕套：48*74cm*2/ 床单：245*270cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('765', '1135002', '颜色', '浅杏粉/ 玛瑙红/ 烟白灰', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('766', '1135002', '产地', '中国四川', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('767', '1135002', '执行标准', 'GB/T22796-2009', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('768', '1135050', '产品材质', 'PP塑料', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('769', '1135050', '产品尺寸', '52*42*40cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('770', '1135050', '产品净重', '2.105kg', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('771', '1135050', '产品毛重', '3.215kg', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('772', '1135050', '执行标准', 'GB 9688-1988', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('773', '1135050', '配送范围', '请咨询客服', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('774', '1135051', '材质', '100% 聚酯纤维', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('775', '1135051', '尺寸', '1.4 x 2.6M：适用于1.4M宽以下的窗户。\n1.75 x 2.6M：适用于1.4M-1.75M宽的窗户。\n2.25 x 2.6M：适用于1.75M-2.25M宽的窗户。\n2.8 x 2.6M：适用于2.25M-2.8M宽的窗户。\n3.5 x 2.6M：适用于2.8M-3.5M宽的窗户。\n4.5 x 2.6M：适用于3.5M-4.5M宽的窗户。', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('776', '1135051', '执行标准', 'GB/T 19817-2005', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('777', '1135051', '颜色', '米色/ 蓝灰/ 烟灰/ 咖色', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('778', '1135051', '产地', '中国浙江', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('779', '1135051', '物理遮光率', '80%左右', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('780', '1135052', '材质', '36%黏胶纤维/  10%亚麻/ 54%聚酯纤维', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('781', '1135052', '颜色', '深卡其/ 米灰/ 灰蓝/ 粉橙', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('782', '1135052', '产地', '中国浙江', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('783', '1135052', '执行标准', 'GB/T 19817-2005', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('784', '1135052', '尺寸', '1.4 x 2.6M：适用于1.4M宽以下的窗户。\n1.75 x 2.6M：适用于1.4M-1.75M宽的窗户。\n2.25 x 2.6M：适用于1.75M-2.25M宽的窗户。\n2.8 x 2.6M：适用于2.25M-2.8M宽的窗户。\n3.5 x 2.6M：适用于2.8M-3.5M宽的窗户。\n4.5 x 2.6M：适用于3.5M-4.5M宽的窗户。', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('785', '1135052', '物理遮光率', '60%-70%左右', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('786', '1135053', '材质', '47%黏胶纤维/  53%聚酯纤维', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('787', '1135053', '尺寸', '1.4 x 2.6M：适用于1.4M宽以下的窗户。\n1.75 x 2.6M：适用于1.4M-1.75M宽的窗户。\n2.25 x 2.6M：适用于1.75M-2.25M宽的窗户。\n2.8 x 2.6M：适用于2.25M-2.8M宽的窗户。\n3.5 x 2.6M：适用于2.8M-3.5M宽的窗户。\n4.5 x 2.6M：适用于3.5M-4.5M宽的窗户。', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('788', '1135053', '颜色', '山岩灰', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('789', '1135053', '执行标准', 'GB/T 19817-2005', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('790', '1135053', '产地', '中国浙江', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('791', '1135053', '物理遮光率', '70-80%左右', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('792', '1135054', '材质', '36% 聚酯纤维 74% 粘胶纤维', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('793', '1135054', '尺寸', '1.4 x 2.6M：适用于1.4M宽以下的窗户。\n1.75 x 2.6M：适用于1.4M-1.75M宽的窗户。\n2.25 x 2.6M：适用于1.75M-2.25M宽的窗户。\n2.8 x 2.6M：适用于2.25M-2.8M宽的窗户。\n3.5 x 2.6M：适用于2.8M-3.5M宽的窗户。\n4.5 x 2.6M：适用于3.5M-4.5M宽的窗户。', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('794', '1135054', '颜色', '蓝色/ 绿色/ 黄色/ 红色', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('795', '1135054', '执行标准', 'GB/T 19817-2005', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('796', '1135054', '产地', '中国浙江', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('797', '1135054', '物理遮光性', '80%左右', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('798', '1135055', '材质', '52% 黏胶纤维  48%聚酯纤维', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('799', '1135055', '尺寸', '1.4 x 2.6M：适用于1.4M宽以下的窗户。\n1.75 x 2.6M：适用于1.4M-1.75M宽的窗户。\n2.25 x 2.6M：适用于1.75M-2.25M宽的窗户。\n2.8 x 2.6M：适用于2.25M-2.8M宽的窗户。\n3.5 x 2.6M：适用于2.8M-3.5M宽的窗户。\n4.5 x 2.6M：适用于3.5M-4.5M宽的窗户。', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('800', '1135055', '颜色', '米灰几何纹/ 橙灰几何纹/ 蓝灰几何纹', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('801', '1135055', '执行标准', 'GB/T 19817-2005', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('802', '1135055', '产地', '中国浙江', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('803', '1135055', '物理遮光率', '70%-80%左右', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('804', '1135056', '材质', '54% 黏胶纤维/ 46%聚酯纤维', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('805', '1135056', '尺寸', '1.4 x 2.6M：适用于1.4M宽以下的窗户。\n1.75 x 2.6M：适用于1.4M-1.75M宽的窗户。\n2.25 x 2.6M：适用于1.75M-2.25M宽的窗户。\n2.8 x 2.6M：适用于2.25M-2.8M宽的窗户。\n3.5 x 2.6M：适用于2.8M-3.5M宽的窗户。\n4.5 x 2.6M：适用于3.5M-4.5M宽的窗户。', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('806', '1135056', '执行标准', 'GB/T 19817-2005', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('807', '1135056', '颜色', '蓝条纹/ 粉条纹', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('808', '1135056', '产地', '中国浙江', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('809', '1135056', '物理遮光率', '60%-70%左右', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('810', '1135057', '材质', '100% 聚酯纤维', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('811', '1135057', '尺寸', '1.4 x 2.6M：适用于1.4M宽以下的窗户。\n1.75 x 2.6M：适用于1.4M-1.75M宽的窗户。\n2.25 x 2.6M：适用于1.75M-2.25M宽的窗户。\n2.8 x 2.6M：适用于2.25M-2.8M宽的窗户。\n3.5 x 2.6M：适用于2.8M-3.5M宽的窗户。\n4.5 x 2.6M：适用于3.5M-4.5M宽的窗户。', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('812', '1135057', '执行标准', 'GB/T 19817-2005', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('813', '1135057', '颜色', '莹白', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('814', '1135057', '产地', '中国浙江', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('815', '1135058', '规格', '35*45cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('816', '1135058', '填充物', '聚苯乙烯泡沫粒子', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('817', '1135058', '填充物重量', '260g', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('818', '1135058', '面料', '100%棉', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('819', '1135058', '执行标准', 'GB/T 22843-2009', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('820', '1135058', '安全技术类别', 'GB 8401-2010 B类', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('821', '1138000', '材质', '面料: 96% 涤纶 4%氨纶\n填充物：100%聚酯纤维', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('822', '1138000', '尺寸', '直径40cm/ 直径55cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('823', '1138000', '执行标准', 'GB/T 22843-2009', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('824', '1138000', '产地', '中国浙江', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('825', '1138000', '颜色', '天青色/ 松叶绿/ 珊瑚红/ 姜黄色/ 香芋粉/ 卡其色/ 深咖色/ 海军蓝', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('826', '1138001', '材质', '抱枕套：100%棉\n抱枕芯外壳：100%棉\n绣线：100%聚酯纤维\n填充：100%聚酯纤维', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('827', '1138001', '颜色', '静谧蓝/ 古典金/ 动感绿/ 浪漫粉', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('828', '1138001', '尺寸', '45 x 45cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('829', '1138001', '执行标准', 'GB/T 22843-2009', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('830', '1138001', '产地', '中国山东', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('831', '1143015', '材质', '席面：蔺草/ 包边：100% 棉', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('832', '1143015', '执行标准', 'QB/T 2934-2008', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('833', '1143015', '产地', '中国浙江', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('834', '1143015', '颜色', '抹茶色', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('835', '1147045', '颜色', '灰黄条纹', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('836', '1147045', '尺寸', '160*230cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('837', '1147045', '材质', '绒面：100% 聚酯纤维 背面：52% 聚酯纤维/ 48% 棉', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('838', '1147045', '产地', '中国北京', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('839', '1147046', '颜色', '条纹粉间', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('840', '1147046', '尺寸', '160*230cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('841', '1147046', '材质', '绒面：100% 聚酯纤维 背面：52% 聚酯纤维/ 48% 棉', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('842', '1147046', '产地', '中国北京', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('843', '1147047', '尺寸', '160*230cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('844', '1147047', '材质', '绒面：100% 聚酯纤维 背面：52% 聚酯纤维/ 48% 棉', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('845', '1147047', '颜色', '蓝粉拼接', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('846', '1147047', '产地', '中国北京', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('847', '1147048', '尺寸', '160*230cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('848', '1147048', '颜色', '蓝灰格', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('849', '1147048', '材质', '绒面：100% 聚酯纤维 背面：52% 聚酯纤维/ 48% 棉', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('850', '1147048', '产地', '中国北京', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('851', '1151012', '材质', '100% 棉', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('852', '1151012', '尺寸', '1.5米床品： 被套 200*230cm/ 枕套：48*74cm*2/ 床单：245*250cm\n1.8米床品：被套 220*240cm/ 枕套：48*74cm*2/ 床单：245*270cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('853', '1151012', '颜色', '素雅灰', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('854', '1151012', '执行标准', 'GB/T 22844-2009', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('855', '1151012', '产地', '中国山东', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('856', '1151013', '材质', '100% 棉', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('857', '1151013', '尺寸', '1.5米床品： 被套 200*230cm/ 枕套：48*74cm*2/ 床单：245*250cm\n1.8米床品：被套 220*240cm/ 枕套：48*74cm*2/ 床单：245*270cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('858', '1151013', '颜色', '胭脂粉', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('859', '1151013', '执行标准', 'GB/T 22844-2009', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('860', '1151013', '产地', '中国山东', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('861', '1152161', '材质', '12%长麻/ 12%竹浆纤维/ 76%莱赛尔', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('862', '1152161', '尺寸', '1.5米床品： 被套 200*230cm/ 枕套：48*74cm*2/ 床单：245*250cm\n1.8米床品：被套 220*240cm/ 枕套：48*74cm*2/ 床单：245*270cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('863', '1152161', '产地', '中国江苏', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('864', '1152161', '执行标准', 'GB/T 22844-2009', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('865', '1155000', '材质', '100% 棉', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('866', '1155000', '尺寸', '1.5米床品： 被套 200*230cm/ 枕套：48*74cm*2/ 床单：245*250cm\n1.8米床品：被套 220*240cm/ 枕套：48*74cm*2/ 床单：245*270cm', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('867', '1155000', '颜色', '条纹绿格', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('868', '1155000', '执行标准', 'GB/T 22844-2009', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('869', '1155000', '产地', '中国山东', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('870', '1181000', '规格', '组合一：AB面独立弹簧床垫 进口乳胶150*200cm*1+可水洗抗菌防螨丝羽绒枕*2。\n组合二：AB面独立弹簧床垫 进口乳胶180*200cm*1+可水洗抗菌防螨丝羽绒枕*2', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('871', '1181000', '重要提醒', '活动时间：5月8日0点-5月14日24点。\n请在以上时间段内购买，其余时间均不可享受组合装优惠。', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('872', '1006014', '尺寸', '200*230cm/ 220*240cm', '2018-10-26 21:27:13', '2018-10-26 21:27:13', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('873', '1006014', '面料', '100%棉', '2018-10-26 21:27:13', '2018-10-26 21:27:13', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('874', '1006014', '填充物', '100%双宫茧桑蚕丝', '2018-10-26 21:27:13', '2018-10-26 21:27:13', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('875', '1006014', '填充物重量', '0.5+1.5KG/1+2KG', '2018-10-26 21:27:13', '2018-10-26 21:27:13', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('876', '1006014', '温馨提示', '天然桑蚕丝具有正常蛋白味道，通风晾晒2-3天即可散去', '2018-10-26 21:27:13', '2018-10-26 21:27:13', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('877', '1009009', '尺寸', '200*230cm/220*240cm', '2019-03-21 21:57:48', '2019-03-21 21:57:48', '1');
INSERT INTO `litemall_goods_attribute` VALUES ('878', '1009009', '填充成分', '白鹅绒', '2019-03-21 21:57:48', '2019-03-21 21:57:48', '1');
INSERT INTO `litemall_goods_attribute` VALUES ('879', '1009009', '面料成分', '60%棉 40%聚酯纤维', '2019-03-21 21:57:48', '2019-03-21 21:57:48', '1');
INSERT INTO `litemall_goods_attribute` VALUES ('880', '1009009', '填充物重量', '1500g/1700g', '2019-03-21 21:57:48', '2019-03-21 21:57:48', '1');
INSERT INTO `litemall_goods_attribute` VALUES ('881', '1009009', '含绒量', '95%', '2019-03-21 21:57:48', '2019-03-21 21:57:48', '1');
INSERT INTO `litemall_goods_attribute` VALUES ('882', '1009009', '工艺', '双层立衬', '2019-03-21 21:57:48', '2019-03-21 21:57:48', '1');
INSERT INTO `litemall_goods_attribute` VALUES ('883', '1006002', '材质', '100%棉', '2019-03-21 21:58:04', '2019-03-21 21:58:04', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('884', '1006002', '适用床尺寸', '1.5米+1.8米通用', '2019-03-21 21:58:04', '2019-03-21 21:58:04', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('885', '1006002', '件数', '4件', '2019-03-21 21:58:04', '2019-03-21 21:58:04', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('886', '1006002', '工艺', '刺绣', '2019-03-21 21:58:04', '2019-03-21 21:58:04', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('887', '1006002', '执行标准', 'GB18401-2010 B类', '2019-03-21 21:58:04', '2019-03-21 21:58:04', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('888', '1006002', '产地', '中国', '2019-03-21 21:58:04', '2019-03-21 21:58:04', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('889', '1006002', '温馨提示', '纺织品经历印染、织造等多道环节，产品初次拿到可能有些许味道，清水漂洗、晾干后味道即可散去。\n严选面料全部经过国标检测认证，选用环保活性染料，请放心使用。', '2019-03-21 21:58:04', '2019-03-21 21:58:04', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('890', '1009009', '尺寸', '200*230cm/220*240cm', '2019-03-21 22:02:07', '2019-03-21 22:02:07', '1');
INSERT INTO `litemall_goods_attribute` VALUES ('891', '1009009', '填充成分', '白鹅绒', '2019-03-21 22:02:07', '2019-03-21 22:02:07', '1');
INSERT INTO `litemall_goods_attribute` VALUES ('892', '1009009', '面料成分', '60%棉 40%聚酯纤维', '2019-03-21 22:02:07', '2019-03-21 22:02:07', '1');
INSERT INTO `litemall_goods_attribute` VALUES ('893', '1009009', '填充物重量', '1500g/1700g', '2019-03-21 22:02:07', '2019-03-21 22:02:07', '1');
INSERT INTO `litemall_goods_attribute` VALUES ('894', '1009009', '含绒量', '95%', '2019-03-21 22:02:07', '2019-03-21 22:02:07', '1');
INSERT INTO `litemall_goods_attribute` VALUES ('895', '1009009', '工艺', '双层立衬', '2019-03-21 22:02:07', '2019-03-21 22:02:07', '1');
INSERT INTO `litemall_goods_attribute` VALUES ('896', '1009009', '尺寸', '200*230cm/220*240cm', '2019-03-21 22:02:50', '2019-03-21 22:02:50', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('897', '1009009', '填充成分', '白鹅绒', '2019-03-21 22:02:50', '2019-03-21 22:02:50', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('898', '1009009', '面料成分', '60%棉 40%聚酯纤维', '2019-03-21 22:02:50', '2019-03-21 22:02:50', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('899', '1009009', '填充物重量', '1500g/1700g', '2019-03-21 22:02:50', '2019-03-21 22:02:50', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('900', '1009009', '含绒量', '95%', '2019-03-21 22:02:50', '2019-03-21 22:02:50', '0');
INSERT INTO `litemall_goods_attribute` VALUES ('901', '1009009', '工艺', '双层立衬', '2019-03-21 22:02:50', '2019-03-21 22:02:50', '0');

-- ----------------------------
-- Table structure for litemall_goods_product
-- ----------------------------
DROP TABLE IF EXISTS `litemall_goods_product`;
CREATE TABLE `litemall_goods_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品表的商品ID',
  `specifications` varchar(1023) NOT NULL COMMENT '商品规格值列表，采用JSON数组格式',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品货品价格',
  `number` int(11) NOT NULL DEFAULT '0' COMMENT '商品货品数量',
  `url` varchar(125) DEFAULT NULL COMMENT '商品货品图片',
  `add_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8mb4 COMMENT='商品货品表';

-- ----------------------------
-- Records of litemall_goods_product
-- ----------------------------
INSERT INTO `litemall_goods_product` VALUES ('1', '1181000', '[\"1.5m床垫*1+枕头*2\",\"浅杏粉\"]', '999.00', '100', 'http://yanxuan.nosdn.127.net/1f67b1970ee20fd572b7202da0ff705d.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('2', '1181000', '[\"1.5m床垫*1+枕头*2\",\"玛瑙红\"]', '1500.00', '198', 'quality=90&thumbnail=200x200&imageView', '2018-02-01 00:00:00', '2018-11-07 17:14:01', '0');
INSERT INTO `litemall_goods_product` VALUES ('3', '1181000', '[\"1.5m床垫*1+枕头*2\",\"烟白灰\"]', '1000.00', '300', 'http://yanxuan.nosdn.127.net/36f64a7161b67e7fb8ea45be32ecfa25.png?quality=90&thumbnail=200x200&imageView', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('4', '1181000', '[\"1.8m床垫*1+枕头*2\",\"浅杏粉\"]', '1001.00', '400', 'http://yanxuan.nosdn.127.net/10022c73fa7aa75c2c0d736e96cc56d5.png?quality=90&thumbnail=200x200&imageView', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('5', '1181000', '[\"1.8m床垫*1+枕头*2\",\"玛瑙红\"]', '2000.00', '2', 'quality=90&thumbnail=200x200&imageView', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('6', '1181000', '[\"1.8m床垫*1+枕头*2\",\"烟白灰\"]', '3000.00', '0', 'http://yanxuan.nosdn.127.net/36f64a7161b67e7fb8ea45be32ecfa25.png?quality=90&thumbnail=200x200&imageView', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('7', '1006002', '[\"标准\"]', '899.00', '100', 'http://yanxuan.nosdn.127.net/8ab2d3287af0cefa2cc539e40600621d.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_goods_product` VALUES ('8', '1006007', '[\"标准\"]', '459.00', '100', 'http://yanxuan.nosdn.127.net/66425d1ed50b3968fed27c822fdd32e0.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('9', '1006010', '[\"标准\"]', '659.00', '100', 'http://yanxuan.nosdn.127.net/8fe022126a2789d970f82853be13a5e6.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('10', '1006013', '[\"标准\"]', '699.00', '100', 'http://yanxuan.nosdn.127.net/583812520c68ca7995b6fac4c67ae2c7.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('11', '1006014', '[\"标准\"]', '1399.00', '100', 'http://yanxuan.nosdn.127.net/2b537159f0f789034bf8c4b339c43750.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('12', '1006051', '[\"标准\"]', '59.00', '100', 'http://yanxuan.nosdn.127.net/ad5a317216f9da495b144070ecf1f957.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('13', '1009009', '[\"标准\"]', '1999.00', '100', 'http://yanxuan.nosdn.127.net/9791006f25e26b2d7c81f41f87ce8619.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_goods_product` VALUES ('14', '1009012', '[\"标准\"]', '59.00', '100', 'http://yanxuan.nosdn.127.net/a196b367f23ccfd8205b6da647c62b84.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('15', '1009013', '[\"标准\"]', '99.00', '100', 'http://yanxuan.nosdn.127.net/da56fda947d0f430d5f4cf4aba14e679.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('16', '1009024', '[\"标准\"]', '599.00', '100', 'http://yanxuan.nosdn.127.net/149dfa87a7324e184c5526ead81de9ad.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('17', '1009027', '[\"标准\"]', '79.00', '100', 'http://yanxuan.nosdn.127.net/71cfd849335c498dee3c54d1eb823c17.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('18', '1010000', '[\"标准\"]', '399.00', '100', 'http://yanxuan.nosdn.127.net/3bec70b85337c3eec182e54380ef7370.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('19', '1010001', '[\"标准\"]', '299.00', '100', 'http://yanxuan.nosdn.127.net/a8b0a5def7d64e411dd98bdfb1fc989b.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('20', '1011004', '[\"标准\"]', '199.00', '100', 'http://yanxuan.nosdn.127.net/0984c9388a2c3fd2335779da904be393.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('21', '1015007', '[\"标准\"]', '59.00', '100', 'http://yanxuan.nosdn.127.net/a2045004de8a6225289376ad54317fc8.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('22', '1019000', '[\"标准\"]', '99.00', '100', 'http://yanxuan.nosdn.127.net/77c09feb378814be712741b273d16656.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('23', '1019001', '[\"标准\"]', '109.00', '100', 'http://yanxuan.nosdn.127.net/7644803ab19b3e398456aa5a54229363.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('24', '1019002', '[\"标准\"]', '199.00', '100', 'http://yanxuan.nosdn.127.net/0118039f7cda342651595d994ed09567.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('25', '1019006', '[\"标准\"]', '99.00', '100', 'http://yanxuan.nosdn.127.net/60c3707837c97a21715ecc3986a744ce.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('26', '1020000', '[\"标准\"]', '79.00', '100', 'http://yanxuan.nosdn.127.net/819fdf1f635a694166bcfdd426416e8c.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('27', '1021000', '[\"标准\"]', '39.00', '100', 'http://yanxuan.nosdn.127.net/7191f2599c7fe44ed4cff7a76e853154.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('28', '1021001', '[\"标准\"]', '99.00', '100', 'http://yanxuan.nosdn.127.net/fd5a8622ee1a7dfd4b57b938ebf25b24.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('29', '1021004', '[\"标准\"]', '299.00', '100', 'http://yanxuan.nosdn.127.net/654b02045fde802b51d5bbf09a8b75f2.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('30', '1021010', '[\"标准\"]', '299.00', '100', 'http://yanxuan.nosdn.127.net/25d734cc0b2eae8f63f9deb1e4ad5f64.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('31', '1022000', '[\"标准\"]', '299.00', '100', 'http://yanxuan.nosdn.127.net/5350e35e6f22165f38928f3c2c52ac57.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('32', '1022001', '[\"标准\"]', '349.00', '100', 'http://yanxuan.nosdn.127.net/bf8faee3b27b480f63b70056597b626d.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('33', '1023003', '[\"标准\"]', '398.00', '100', 'http://yanxuan.nosdn.127.net/c39d54c06a71b4b61b6092a0d31f2335.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('34', '1023012', '[\"标准\"]', '299.00', '100', 'http://yanxuan.nosdn.127.net/07376e78bf4fb8a5aa8e6a0b1437c3ad.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('35', '1023032', '[\"标准\"]', '449.00', '100', 'http://yanxuan.nosdn.127.net/e0b928ada728c140f6965bb41f47407b.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('36', '1023034', '[\"标准\"]', '299.00', '100', 'http://yanxuan.nosdn.127.net/715899c65c023bb4973fb0466a5b79d6.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('37', '1025005', '[\"标准\"]', '268.00', '100', 'http://yanxuan.nosdn.127.net/49e26f00ca4d0ce00f9960d22c936738.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('38', '1027004', '[\"标准\"]', '249.00', '100', 'http://yanxuan.nosdn.127.net/6252f53aaf36c072b6678f3d8c635132.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('39', '1029005', '[\"标准\"]', '959.00', '100', 'http://yanxuan.nosdn.127.net/25fe52f44853eb45f610846991bc4d9d.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('40', '1030001', '[\"标准\"]', '969.00', '100', 'http://yanxuan.nosdn.127.net/88dc5d80c6f84102f003ecd69c86e1cf.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('41', '1030002', '[\"标准\"]', '899.00', '100', 'http://yanxuan.nosdn.127.net/8b9328496990357033d4259fda250679.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('42', '1030003', '[\"标准\"]', '1469.00', '100', 'http://yanxuan.nosdn.127.net/1d1ab099dc0e254c15e57302e78e200b.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('43', '1030004', '[\"标准\"]', '399.00', '100', 'http://yanxuan.nosdn.127.net/e84f2e3b3d39cfdc8af5c3954a877aae.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('44', '1030005', '[\"标准\"]', '899.00', '100', 'http://yanxuan.nosdn.127.net/86f57132793d3e3c924a7ba529849288.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('45', '1030006', '[\"标准\"]', '329.00', '100', 'http://yanxuan.nosdn.127.net/578ffec952eb25ff072d8ea1b676bfd2.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('46', '1033000', '[\"标准\"]', '199.00', '100', 'http://yanxuan.nosdn.127.net/9aab9a0bf4fef8fe3dc8c732bc22d4b7.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('47', '1035006', '[\"标准\"]', '56.00', '100', 'http://yanxuan.nosdn.127.net/ee92704f3b8323905b51fc647823e6e5.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('48', '1036002', '[\"标准\"]', '99.00', '100', 'http://yanxuan.nosdn.127.net/ffd7efe9d5225dff9f36d5110b027caa.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('49', '1036013', '[\"标准\"]', '109.00', '100', 'http://yanxuan.nosdn.127.net/da1bc2c10f7b2e53f2466bd23953b982.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('50', '1036016', '[\"标准\"]', '109.00', '100', 'http://yanxuan.nosdn.127.net/513d08057c69fdb7d19cc810e976118d.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('51', '1037011', '[\"标准\"]', '599.00', '100', 'http://yanxuan.nosdn.127.net/a03ea6f4509439acdafcb7ceba1debe0.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('52', '1037012', '[\"标准\"]', '69.00', '100', 'http://yanxuan.nosdn.127.net/ffd2c91c7cf9c6e0f630595f7679b95d.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('53', '1038004', '[\"标准\"]', '359.00', '100', 'http://yanxuan.nosdn.127.net/4d3d3eaeb872860539d7faa59f9f84e9.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('54', '1039051', '[\"标准\"]', '79.00', '100', 'http://yanxuan.nosdn.127.net/c8ca0600fa7ba11ca8be6a3173dd38c9.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('55', '1039056', '[\"标准\"]', '79.00', '100', 'http://yanxuan.nosdn.127.net/3e14e82a44c3a250af63df4c29c572d0.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('56', '1043005', '[\"标准\"]', '59.00', '100', 'http://yanxuan.nosdn.127.net/2a95b16f5b147cab4845641bee738a2e.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('57', '1044012', '[\"标准\"]', '349.00', '100', 'http://yanxuan.nosdn.127.net/a803c68ea88e3116023b45ac9ea99510.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('58', '1045000', '[\"标准\"]', '28.00', '100', 'http://yanxuan.nosdn.127.net/b2adc3fd9b84a289a1be03e8ee400e61.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('59', '1046001', '[\"标准\"]', '8.90', '100', 'http://yanxuan.nosdn.127.net/74583e585825ecacb11f7c53d2021e00.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('60', '1046002', '[\"标准\"]', '9.90', '100', 'http://yanxuan.nosdn.127.net/eb486cfe807c4fe5696aa59cbcf1f96a.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('61', '1046044', '[\"标准\"]', '349.00', '100', 'http://yanxuan.nosdn.127.net/2bfecfe58ea3ee0d554f2ed58e9ba30a.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('62', '1048005', '[\"标准\"]', '59.00', '100', 'http://yanxuan.nosdn.127.net/ce980c16810a471dffff6aa8d7bac754.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('63', '1051000', '[\"标准\"]', '180.00', '100', 'http://yanxuan.nosdn.127.net/e564410546a11ddceb5a82bfce8da43d.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('64', '1051001', '[\"标准\"]', '159.00', '100', 'http://yanxuan.nosdn.127.net/f53ed57d9e23fda7e24dfd0e0a50c5d1.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('65', '1051002', '[\"标准\"]', '228.00', '100', 'http://yanxuan.nosdn.127.net/56f4b4753392d27c0c2ccceeb579ed6f.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('66', '1051003', '[\"标准\"]', '148.00', '100', 'http://yanxuan.nosdn.127.net/6a54ccc389afb2459b163245bbb2c978.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('67', '1055012', '[\"标准\"]', '39.00', '100', 'http://yanxuan.nosdn.127.net/3d437c8d68e2ec3f3dd61001bf98f16e.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('68', '1055016', '[\"标准\"]', '59.00', '100', 'http://yanxuan.nosdn.127.net/23e0203f1512f33e605f61c28fa03d2d.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('69', '1055022', '[\"标准\"]', '4.90', '100', 'http://yanxuan.nosdn.127.net/c7c74a96eacb29455dbf557b840eaaf5.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('70', '1056002', '[\"标准\"]', '59.00', '100', 'http://yanxuan.nosdn.127.net/922fdbe007033f7a88f7ebc57c3d1e75.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('71', '1057036', '[\"标准\"]', '79.00', '100', 'http://yanxuan.nosdn.127.net/8a9ee5ba08929cc9e40b973607d2f633.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('72', '1064000', '[\"标准\"]', '79.00', '100', 'http://yanxuan.nosdn.127.net/ebe118f94ddafe82c4a8cd51da6ff183.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('73', '1064002', '[\"标准\"]', '69.00', '100', 'http://yanxuan.nosdn.127.net/48dbfe207b2203ef45055dcc9cedbe60.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('74', '1064003', '[\"标准\"]', '89.00', '100', 'http://yanxuan.nosdn.127.net/58ed94b63b39339e7814f1339013793c.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('75', '1064004', '[\"标准\"]', '99.00', '100', 'http://yanxuan.nosdn.127.net/337da7094c1df295ca0f0b8baa55b2d5.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('76', '1064006', '[\"标准\"]', '129.00', '100', 'http://yanxuan.nosdn.127.net/35306b8e65932dd28a5628d0bb44a044.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('77', '1064007', '[\"标准\"]', '249.00', '100', 'http://yanxuan.nosdn.127.net/d7bd87f8cc1965b25be33a8aad53812b.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('78', '1064021', '[\"标准\"]', '199.00', '100', 'http://yanxuan.nosdn.127.net/c83a3881704094ddd3970099ca77d115.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('79', '1064022', '[\"标准\"]', '299.00', '100', 'http://yanxuan.nosdn.127.net/a9c155e26d09e3c92b623f0472ed674a.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('80', '1065004', '[\"标准\"]', '199.00', '100', 'http://yanxuan.nosdn.127.net/05977cf923857db0c44b405bd87b096b.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('81', '1065005', '[\"标准\"]', '249.00', '100', 'http://yanxuan.nosdn.127.net/18b7be03bba9d01e4285fc443ea65bb1.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('82', '1068010', '[\"标准\"]', '329.00', '100', 'http://yanxuan.nosdn.127.net/9ed4ff9642ea9cb776a20560647cd72b.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('83', '1068011', '[\"标准\"]', '399.00', '100', 'http://yanxuan.nosdn.127.net/0e4ba6ed44fef8803c243e585b621ab7.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('84', '1068012', '[\"标准\"]', '599.00', '100', 'http://yanxuan.nosdn.127.net/69145abddddd31ae8878ea7ca7297b4b.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('85', '1070000', '[\"标准\"]', '26.00', '100', 'http://yanxuan.nosdn.127.net/8392725765cdd57fdae3f173877f4bda.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('86', '1071004', '[\"标准\"]', '89.00', '100', 'http://yanxuan.nosdn.127.net/f0abf2bf11c8d303212e4a0c1106bb73.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('87', '1071005', '[\"标准\"]', '39.00', '100', 'http://yanxuan.nosdn.127.net/07a47d73e2eb53b1a7939219a4e63618.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('88', '1071006', '[\"标准\"]', '9.90', '100', 'http://yanxuan.nosdn.127.net/d206e0d15955b4d76431a752f2c94f9f.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('89', '1072000', '[\"标准\"]', '89.00', '100', 'http://yanxuan.nosdn.127.net/87cf3a17ad40bfdcdc3314ea4591a5e8.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('90', '1072001', '[\"标准\"]', '49.00', '100', 'http://yanxuan.nosdn.127.net/0e9d5954d7dc2477d9c46b730e05ab42.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('91', '1073008', '[\"标准\"]', '149.00', '100', 'http://yanxuan.nosdn.127.net/619e46411ccd62e5c0f16692ee1a85a0.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('92', '1074001', '[\"标准\"]', '59.00', '100', 'http://yanxuan.nosdn.127.net/73567265b04a9998f64419186ddd8531.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('93', '1075022', '[\"标准\"]', '39.00', '100', 'http://yanxuan.nosdn.127.net/97ad483a94ed88216a989df83e39cbf0.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('94', '1075023', '[\"标准\"]', '199.00', '100', 'http://yanxuan.nosdn.127.net/29bc800b9f1fa551bc3cd47b10e2a799.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('95', '1075024', '[\"标准\"]', '2399.00', '100', 'http://yanxuan.nosdn.127.net/ce4a1eb18ea518bf584620632509935f.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('96', '1081000', '[\"标准\"]', '49.00', '100', 'http://yanxuan.nosdn.127.net/cc45baafad00405699552c187c64c512.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('97', '1081002', '[\"标准\"]', '89.00', '100', 'http://yanxuan.nosdn.127.net/380cfcd5d8bc22360de089f0b4eb11da.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('98', '1083009', '[\"标准\"]', '299.00', '100', 'http://yanxuan.nosdn.127.net/76e5c820f6bb71a26517ffa01f499871.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('99', '1083010', '[\"标准\"]', '469.00', '100', 'http://yanxuan.nosdn.127.net/b9a12d07f8f2d04d662d9340e68e6687.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('100', '1084001', '[\"标准\"]', '249.00', '100', 'http://yanxuan.nosdn.127.net/07f682d405c1d2ed343c210ac8f8862a.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('101', '1084003', '[\"标准\"]', '199.00', '100', 'http://yanxuan.nosdn.127.net/cf40c167e7054fe184d49f19121f63c7.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('102', '1085019', '[\"标准\"]', '349.00', '100', 'http://yanxuan.nosdn.127.net/65c955a7a98e84d44ca30bb88a591eac.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('103', '1086015', '[\"标准\"]', '249.00', '100', 'http://yanxuan.nosdn.127.net/d5c2ecfe0fb00cdd8b829975bab21a31.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('104', '1086023', '[\"标准\"]', '19.90', '100', 'http://yanxuan.nosdn.127.net/121a99e896b3e332c102eb5f6f9b3406.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('105', '1086024', '[\"标准\"]', '9.90', '100', 'http://yanxuan.nosdn.127.net/af899cfaa13f515ecb9cf9a33f41370a.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('106', '1086025', '[\"标准\"]', '49.00', '100', 'http://yanxuan.nosdn.127.net/78eff56b293c8354bc9ac496fc2c5179.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('107', '1086026', '[\"标准\"]', '29.00', '100', 'http://yanxuan.nosdn.127.net/caecdaa37d9cbcff980cee0968911e34.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('108', '1086052', '[\"标准\"]', '859.00', '100', 'http://yanxuan.nosdn.127.net/93171a281c4ed272c007a050816e6f6c.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('109', '1090004', '[\"标准\"]', '399.00', '100', 'http://yanxuan.nosdn.127.net/a3a92057f10e5e6e804c19ef495e3dee.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('110', '1092001', '[\"标准\"]', '29.00', '100', 'http://yanxuan.nosdn.127.net/8e35b003ce7895c39eeb073b1f61b1d7.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('111', '1092005', '[\"标准\"]', '39.00', '100', 'http://yanxuan.nosdn.127.net/ab1992495e0370f09386d418ad45220d.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('112', '1092024', '[\"标准\"]', '1599.00', '100', 'http://yanxuan.nosdn.127.net/f245a86dcb9f455217241e437b203926.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('113', '1092025', '[\"标准\"]', '19.90', '100', 'http://yanxuan.nosdn.127.net/56a46e9a4832587471c0f9ad7c1b7d85.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('114', '1092026', '[\"标准\"]', '19.90', '100', 'http://yanxuan.nosdn.127.net/83433f5a7ef69abda2544a53332a0fad.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('115', '1092038', '[\"标准\"]', '39.00', '100', 'http://yanxuan.nosdn.127.net/1aba9ed9c9160b9ca8e7de58ce4e46b1.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('116', '1092039', '[\"标准\"]', '59.00', '100', 'http://yanxuan.nosdn.127.net/d8c18953bcb05f0b07d6b48e2d159ace.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('117', '1093000', '[\"标准\"]', '39.00', '100', 'http://yanxuan.nosdn.127.net/1a22cc488390b616e75afbbd94db6584.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('118', '1093001', '[\"标准\"]', '29.00', '100', 'http://yanxuan.nosdn.127.net/71fede861c3641d570a89a65ccf4525f.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('119', '1093002', '[\"标准\"]', '49.00', '100', 'http://yanxuan.nosdn.127.net/48d95e820628610fcdcda30570d4379c.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('120', '1097004', '[\"标准\"]', '1699.00', '100', 'http://yanxuan.nosdn.127.net/54f822e9c542d20566c7f70f90d52ae6.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('121', '1097005', '[\"标准\"]', '1199.00', '100', 'http://yanxuan.nosdn.127.net/e5fd0724a05387615738173fb8f1570d.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('122', '1097006', '[\"标准\"]', '999.00', '100', 'http://yanxuan.nosdn.127.net/bcf2a72face2c4221dfdc9b3c97d4062.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('123', '1097007', '[\"标准\"]', '759.00', '100', 'http://yanxuan.nosdn.127.net/b6e132180679b0673486145decc89aa3.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('124', '1097009', '[\"标准\"]', '1599.00', '100', 'http://yanxuan.nosdn.127.net/e7b68189ef2f77a28110c3fc7ca5a697.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('125', '1097011', '[\"标准\"]', '3899.00', '100', 'http://yanxuan.nosdn.127.net/fea36ef2514c904f4f45f1975f37f289.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('126', '1097012', '[\"标准\"]', '999.00', '100', 'http://yanxuan.nosdn.127.net/d659d5ce0efaa9baa43abb6e34a1d9fe.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('127', '1097013', '[\"标准\"]', '2699.00', '100', 'http://yanxuan.nosdn.127.net/2fa8cb066a356f47a3f0814e99fee7f2.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('128', '1097014', '[\"标准\"]', '4199.00', '100', 'http://yanxuan.nosdn.127.net/308184b7b1965470d58b5c92e9bcc4b0.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('129', '1097016', '[\"标准\"]', '2799.00', '100', 'http://yanxuan.nosdn.127.net/a7e6df722b82ad1b0158adcbdcf30df9.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('130', '1097017', '[\"标准\"]', '2199.00', '100', 'http://yanxuan.nosdn.127.net/e16ff61bef76db81090db191b9d5ec15.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('131', '1100000', '[\"标准\"]', '79.00', '100', 'http://yanxuan.nosdn.127.net/15e40cfb6a78f557616814a815685fd4.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('132', '1100001', '[\"标准\"]', '199.00', '100', 'http://yanxuan.nosdn.127.net/a95285853138cbaf56e4ba729f2b8749.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('133', '1100002', '[\"标准\"]', '189.00', '100', 'http://yanxuan.nosdn.127.net/edf1945ef594c00920bdc727f4c5c7fd.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('134', '1108029', '[\"标准\"]', '89.00', '100', 'http://yanxuan.nosdn.127.net/fe52cd141b4b330db5627114b0e0e550.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('135', '1108030', '[\"标准\"]', '39.00', '100', 'http://yanxuan.nosdn.127.net/4891e60ff08ceed36d40a754e45e8742.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('136', '1108031', '[\"标准\"]', '39.00', '100', 'http://yanxuan.nosdn.127.net/e13e9697e01339c6cf7479eb81b3fbe2.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('137', '1108032', '[\"标准\"]', '29.00', '100', 'http://yanxuan.nosdn.127.net/b1f9e1f700469f71fe3c4187ef53c99f.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('138', '1109004', '[\"标准\"]', '89.00', '100', 'http://yanxuan.nosdn.127.net/d25b5990f16c6d1ac168a34b7aeca681.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('139', '1109005', '[\"标准\"]', '79.00', '100', 'http://yanxuan.nosdn.127.net/7f508253f65733c7b2af52dd3943ee28.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('140', '1109008', '[\"标准\"]', '3999.00', '100', 'http://yanxuan.nosdn.127.net/c5be2604c0e4186a4e7079feeb742cee.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('141', '1109034', '[\"标准\"]', '129.00', '100', 'http://yanxuan.nosdn.127.net/c2c96acc680cbadb1787385598e1e593.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('142', '1110002', '[\"标准\"]', '119.00', '100', 'http://yanxuan.nosdn.127.net/a7a524512c34d24a4b9762766dd9d0f0.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('143', '1110003', '[\"标准\"]', '299.00', '100', 'http://yanxuan.nosdn.127.net/72dfb4bfc1cd1b834c064a9d1d40627d.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('144', '1110004', '[\"标准\"]', '299.00', '100', 'http://yanxuan.nosdn.127.net/1ffd5831e63027715445f74a28f8c4ed.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('145', '1110007', '[\"标准\"]', '299.00', '100', 'http://yanxuan.nosdn.127.net/deeb55bb45f94cb236a47d1264e883b8.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('146', '1110008', '[\"标准\"]', '99.00', '100', 'http://yanxuan.nosdn.127.net/255a4888161f9b4fe530cf319f14551d.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('147', '1110013', '[\"标准\"]', '59.00', '100', 'http://yanxuan.nosdn.127.net/6eb8d1c37142a5951b6242791c78146b.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('148', '1110014', '[\"标准\"]', '69.00', '100', 'http://yanxuan.nosdn.127.net/cb4f78bd887059416c3df485e3f31366.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('149', '1110015', '[\"标准\"]', '69.00', '100', 'http://yanxuan.nosdn.127.net/56da5270172244be56c00fdc8eb24fae.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('150', '1110016', '[\"标准\"]', '39.00', '100', 'http://yanxuan.nosdn.127.net/3bd73b7279a83d1cbb50c0e45778e6d6.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('151', '1110017', '[\"标准\"]', '79.00', '100', 'http://yanxuan.nosdn.127.net/534231583f82572398ec84bad425cdaf.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('152', '1110018', '[\"标准\"]', '79.00', '100', 'http://yanxuan.nosdn.127.net/d93aa5d6e7a296101cf4cb72613aeda6.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('153', '1110019', '[\"标准\"]', '69.00', '100', 'http://yanxuan.nosdn.127.net/1e7e392b6fc9da99dc112197b7444eec.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('154', '1111007', '[\"标准\"]', '78.00', '100', 'http://yanxuan.nosdn.127.net/8d228f767b136a67aaf2cbbf6deb46fa.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('155', '1111010', '[\"标准\"]', '69.00', '100', 'http://yanxuan.nosdn.127.net/ef7efe55839e66993fb604dc3c2d9410.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('156', '1113010', '[\"标准\"]', '59.00', '100', 'http://yanxuan.nosdn.127.net/2d0920b51331bb1636330ad8e07d1b97.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('157', '1113011', '[\"标准\"]', '49.00', '100', 'http://yanxuan.nosdn.127.net/7a683f68fc988df299b5cfe6273d6fb7.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('158', '1113019', '[\"标准\"]', '208.00', '100', 'http://yanxuan.nosdn.127.net/ad504bb389039ff35c4cd6ae912be87e.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('159', '1114011', '[\"标准\"]', '299.00', '100', 'http://yanxuan.nosdn.127.net/196b5ce11930b4eadaec563cb0406634.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('160', '1115023', '[\"标准\"]', '1599.00', '100', 'http://yanxuan.nosdn.127.net/f3d1f0217ed250a37ea807f456351a51.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('161', '1115028', '[\"标准\"]', '299.00', '100', 'http://yanxuan.nosdn.127.net/3d0045e8f43439c7004fae052b2162ed.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('162', '1115052', '[\"标准\"]', '86.00', '100', 'http://yanxuan.nosdn.127.net/39dea35a3ea2361e4b054ee2f421af53.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('163', '1115053', '[\"标准\"]', '299.00', '100', 'http://yanxuan.nosdn.127.net/fabf9ac36751a2e1322135c56f1dc338.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('164', '1116004', '[\"标准\"]', '79.00', '100', 'http://yanxuan.nosdn.127.net/14d3a47ccf52815baf6df308be6db5a6.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('165', '1116005', '[\"标准\"]', '79.00', '100', 'http://yanxuan.nosdn.127.net/71937456c3cd654f936f619201a79c09.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('166', '1116008', '[\"标准\"]', '99.00', '100', 'http://yanxuan.nosdn.127.net/149a09a391ea5a888debf50b9dc4ed7b.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('167', '1116011', '[\"标准\"]', '36.00', '82', 'http://yanxuan.nosdn.127.net/767b370d07f3973500db54900bcbd2a7.png', '2018-02-01 00:00:00', '2018-11-09 19:23:10', '0');
INSERT INTO `litemall_goods_product` VALUES ('168', '1116030', '[\"标准\"]', '439.00', '100', 'http://yanxuan.nosdn.127.net/9d59a22b5aff348b5aba5fc7e451ea4d.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('169', '1116031', '[\"标准\"]', '439.00', '100', 'http://yanxuan.nosdn.127.net/f88c3dc42f3e4d7da1ded8c1ee6a97ba.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('170', '1116032', '[\"标准\"]', '3499.00', '100', 'http://yanxuan.nosdn.127.net/45176a783387751fc07a07f5031dd62c.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('171', '1116033', '[\"标准\"]', '1399.00', '100', 'http://yanxuan.nosdn.127.net/f1dbf1d9967c478ee6def81ed40734a2.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('172', '1125010', '[\"标准\"]', '159.00', '100', 'http://yanxuan.nosdn.127.net/f82995ccb2a2f6beddd4ad794f5da2a1.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('173', '1125011', '[\"标准\"]', '139.00', '100', 'http://yanxuan.nosdn.127.net/be9740b734087f294f59a6560b932bc1.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('174', '1125016', '[\"标准\"]', '139.00', '100', 'http://yanxuan.nosdn.127.net/46f3059b020eb3900e9af8e8c1af8a97.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('175', '1125017', '[\"标准\"]', '99.00', '100', 'http://yanxuan.nosdn.127.net/ae63fed274187e3e572043c53fefd836.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('176', '1125026', '[\"标准\"]', '159.00', '100', 'http://yanxuan.nosdn.127.net/6308c120c441fd3e47658167ad944156.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('177', '1127003', '[\"标准\"]', '2599.00', '100', 'http://yanxuan.nosdn.127.net/6ad1813d123f7a80f84c2cfa5f8c7caf.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('178', '1127024', '[\"标准\"]', '39.00', '100', 'http://yanxuan.nosdn.127.net/0a70f12a712e90d7d93beec4f686fe8e.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('179', '1127025', '[\"标准\"]', '39.00', '100', 'http://yanxuan.nosdn.127.net/b2fe79c872a8a7f647264b5e51bcc802.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('180', '1127038', '[\"标准\"]', '359.00', '100', 'http://yanxuan.nosdn.127.net/addc278cf9c301dd535791df2e03b2ea.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('181', '1127039', '[\"标准\"]', '399.00', '100', 'http://yanxuan.nosdn.127.net/be64df0a04ade4cfd75bf7d4e8509ecc.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('182', '1127047', '[\"标准\"]', '29.00', '98', 'http://yanxuan.nosdn.127.net/6c03ca93d8fe404faa266ea86f3f1e43.png', '2018-02-01 00:00:00', '2018-11-07 17:38:13', '0');
INSERT INTO `litemall_goods_product` VALUES ('183', '1127052', '[\"标准\"]', '169.00', '100', 'http://yanxuan.nosdn.127.net/4f483526cfe3b953f403ae02049df5b9.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('184', '1128002', '[\"标准\"]', '599.00', '100', 'http://yanxuan.nosdn.127.net/a1094a808ffb3a52a6cb13565a283d98.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('185', '1128010', '[\"标准\"]', '29.00', '100', 'http://yanxuan.nosdn.127.net/a84e8e6979f00efd9a728ed36b154753.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('186', '1128011', '[\"标准\"]', '79.00', '100', 'http://yanxuan.nosdn.127.net/d6e25ec5b4ad7aa37e077ce751b56f46.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('187', '1129015', '[\"标准\"]', '89.00', '100', 'http://yanxuan.nosdn.127.net/fc11a482efeece9630548d8b350e7f54.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('188', '1129016', '[\"标准\"]', '29.00', '100', 'http://yanxuan.nosdn.127.net/a7c7eec41194e65d64931a2d08ef4f8c.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('189', '1130037', '[\"标准\"]', '39.00', '100', 'http://yanxuan.nosdn.127.net/19ecd7c6f6f31219cf75117238d95139.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('190', '1130038', '[\"标准\"]', '89.00', '100', 'http://yanxuan.nosdn.127.net/4d77296e02896675558f1a8a83742132.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('191', '1130039', '[\"标准\"]', '89.00', '100', 'http://yanxuan.nosdn.127.net/03c73e1f1ce1d2365e83b3230e507030.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('192', '1130041', '[\"标准\"]', '109.00', '100', 'http://yanxuan.nosdn.127.net/442b9d99c0e7f39efd7967e0e5987374.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('193', '1130042', '[\"标准\"]', '239.00', '100', 'http://yanxuan.nosdn.127.net/dc9d09334eb201fe9408ed604e549941.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('194', '1130049', '[\"标准\"]', '429.00', '100', 'http://yanxuan.nosdn.127.net/d88513f85b3617d734bde93af2c766c9.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('195', '1130056', '[\"标准\"]', '2299.00', '100', 'http://yanxuan.nosdn.127.net/56e72b84a9bb66687c003ecdaba73816.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('196', '1131017', '[\"标准\"]', '259.00', '100', 'http://yanxuan.nosdn.127.net/2b6e2268ed712f1a336283f013abb7a1.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('197', '1134022', '[\"标准\"]', '79.00', '100', 'http://yanxuan.nosdn.127.net/a2b7489b4a2b1c09b66464cede4dabd7.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('198', '1134030', '[\"标准\"]', '46.00', '99', 'http://yanxuan.nosdn.127.net/aa49dfe878becf768eddc4c1636643a6.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('199', '1134032', '[\"标准\"]', '49.00', '84', 'http://yanxuan.nosdn.127.net/8b30eeb17c831eba08b97bdcb4c46a8e.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('200', '1134036', '[\"标准\"]', '38.00', '100', 'http://yanxuan.nosdn.127.net/9356cc27b22bd47ad43913d13226555f.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('201', '1134056', '[\"标准\"]', '429.00', '100', 'http://yanxuan.nosdn.127.net/c29f47f58ba1e3c2ff5a193eec0b11d6.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('202', '1135000', '[\"标准\"]', '359.00', '100', 'http://yanxuan.nosdn.127.net/53d0309471b570a7e12a3f01ba694491.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('203', '1135001', '[\"标准\"]', '459.00', '100', 'http://yanxuan.nosdn.127.net/f82ee85933d6f0cc95382215281d3526.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('204', '1135002', '[\"标准\"]', '2599.00', '100', 'http://yanxuan.nosdn.127.net/45548f26cfd0c7c41e0afc3709d48286.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('205', '1135050', '[\"标准\"]', '179.00', '100', 'http://yanxuan.nosdn.127.net/366f3f3f0e8971c8cf871e2b55b74ff2.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('206', '1135051', '[\"标准\"]', '299.00', '100', 'http://yanxuan.nosdn.127.net/9126151f028a8804026d530836b481cb.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('207', '1135052', '[\"标准\"]', '259.00', '100', 'http://yanxuan.nosdn.127.net/63f5da1f5363af43aa91864bf66af48e.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('208', '1135053', '[\"标准\"]', '429.00', '100', 'http://yanxuan.nosdn.127.net/1f9e34b1aadd14ea0c9c299c530d86ba.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('209', '1135054', '[\"标准\"]', '559.00', '100', 'http://yanxuan.nosdn.127.net/30d7daa0824fbb61b6c36175c8203349.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('210', '1135055', '[\"标准\"]', '399.00', '100', 'http://yanxuan.nosdn.127.net/87b6a608b99279ebf1764682e9e5fcec.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('211', '1135056', '[\"标准\"]', '259.00', '100', 'http://yanxuan.nosdn.127.net/536246ca4adb77274a94b18bb2f91f47.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('212', '1135057', '[\"标准\"]', '199.00', '100', 'http://yanxuan.nosdn.127.net/98c5e80b8e328687ce9c949314ebc41d.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('213', '1135058', '[\"标准\"]', '79.00', '100', 'http://yanxuan.nosdn.127.net/37bc0fa3524a904ac740340fa92bd515.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('214', '1135065', '[\"标准\"]', '69.00', '100', 'http://yanxuan.nosdn.127.net/055eb16f95fe995108dd683f532fda22.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('215', '1135072', '[\"标准\"]', '69.00', '100', 'http://yanxuan.nosdn.127.net/43e57d4208cdc78ac9c088f9b3e798f5.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('216', '1135073', '[\"标准\"]', '69.00', '100', 'http://yanxuan.nosdn.127.net/53052b04ae001d289c040e09ea92231c.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('217', '1138000', '[\"标准\"]', '29.00', '100', 'http://yanxuan.nosdn.127.net/ad953e16ad8c33b714e7af941ce8cd56.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('218', '1138001', '[\"标准\"]', '79.00', '100', 'http://yanxuan.nosdn.127.net/dbc5b25b824c3b3d7ff43b56ca35eee9.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('219', '1143006', '[\"标准\"]', '99.00', '100', 'http://yanxuan.nosdn.127.net/2b48feb65954c6739be28d15b9fbfbe3.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('220', '1143015', '[\"标准\"]', '79.00', '100', 'http://yanxuan.nosdn.127.net/50e197854e0ada79c37b7215a1574450.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('221', '1143016', '[\"标准\"]', '319.00', '100', 'http://yanxuan.nosdn.127.net/e56c6239ee4a641ce2a4565c6babb43e.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('222', '1143018', '[\"标准\"]', '68.00', '100', 'http://yanxuan.nosdn.127.net/d1fd69cee4990f4de1109baef30efeeb.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('223', '1143019', '[\"标准\"]', '98.00', '100', 'http://yanxuan.nosdn.127.net/277b07c1e5e6fb57cf9ca47fcd3903d5.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('224', '1143020', '[\"标准\"]', '168.00', '100', 'http://yanxuan.nosdn.127.net/200d4d59763af9a0781cca4a06175de7.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('225', '1147045', '[\"标准\"]', '599.00', '100', 'http://yanxuan.nosdn.127.net/5cda4a0c4c4ff9728d03186bd053c9ca.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('226', '1147046', '[\"标准\"]', '599.00', '100', 'http://yanxuan.nosdn.127.net/655d718df8107f8e7fd1dc6140e29039.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('227', '1147047', '[\"标准\"]', '559.00', '100', 'http://yanxuan.nosdn.127.net/bda805b0a2464b6ec33c18981565e50e.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('228', '1147048', '[\"标准\"]', '559.00', '100', 'http://yanxuan.nosdn.127.net/fd7920a2eadd10fa10c0c03959a2abe0.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('229', '1151012', '[\"标准\"]', '359.00', '100', 'http://yanxuan.nosdn.127.net/cb65635dbcef42b68ba21433f4948f5a.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('230', '1151013', '[\"标准\"]', '359.00', '100', 'http://yanxuan.nosdn.127.net/73a8692048f58f15e823b636d7c3bb74.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('231', '1152004', '[\"标准\"]', '399.00', '100', 'http://yanxuan.nosdn.127.net/8c93cef435d888bd79833777df1cd0c2.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('232', '1152008', '[\"标准\"]', '29.00', '100', 'http://yanxuan.nosdn.127.net/203cb83d93606865e3ddde57b69b9e9a.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('233', '1152009', '[\"标准\"]', '29.00', '100', 'http://yanxuan.nosdn.127.net/ae6d41117717387b82dcaf1dfce0cd97.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('234', '1152031', '[\"标准\"]', '99.00', '100', 'http://yanxuan.nosdn.127.net/fd6e78a397bd9e9804116a36f0270b0a.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('235', '1152095', '[\"标准\"]', '499.00', '100', 'http://yanxuan.nosdn.127.net/c86b49f635fa141decebabbd0966a6ef.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('236', '1152097', '[\"标准\"]', '399.00', '100', 'http://yanxuan.nosdn.127.net/532836444ae5eaec40b5810ca4f9b1e6.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('237', '1152100', '[\"标准\"]', '499.00', '100', 'http://yanxuan.nosdn.127.net/a667c4fbbd9c499c0733539d7e986617.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('238', '1152101', '[\"标准\"]', '888.00', '100', 'http://yanxuan.nosdn.127.net/c1c62211a17b71a634fa0c705d11fb42.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('239', '1152161', '[\"标准\"]', '459.00', '100', 'http://yanxuan.nosdn.127.net/977401e75113f7c8334c4fb5b4bf6215.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('240', '1153006', '[\"标准\"]', '1288.00', '100', 'http://yanxuan.nosdn.127.net/2743921b945a6c71fcdc3c5282a03413.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('241', '1155000', '[\"标准\"]', '399.00', '100', 'http://yanxuan.nosdn.127.net/d7d6ef1f1865991077384761b4521dce.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('242', '1155015', '[\"标准\"]', '12.90', '100', 'http://yanxuan.nosdn.127.net/66b9f1638c0517d179262f14ed1345f9.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('243', '1156006', '[\"标准\"]', '699.00', '100', 'http://yanxuan.nosdn.127.net/ea5b0a572b35089446fba491db7fbbc3.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_product` VALUES ('244', '1166008', '[\"标准\"]', '459.00', '98', 'http://yanxuan.nosdn.127.net/615a16e899e01efb780c488df4233f48.png', '2018-02-01 00:00:00', '2018-11-07 17:14:01', '0');
INSERT INTO `litemall_goods_product` VALUES ('245', '1009009', '[\"标准\"]', '1999.00', '100', 'http://yanxuan.nosdn.127.net/9791006f25e26b2d7c81f41f87ce8619.png', '2019-03-21 21:57:48', '2019-03-21 21:57:48', '1');
INSERT INTO `litemall_goods_product` VALUES ('246', '1006002', '[\"标准\"]', '899.00', '100', 'http://yanxuan.nosdn.127.net/8ab2d3287af0cefa2cc539e40600621d.png', '2019-03-21 21:58:04', '2019-03-21 21:58:04', '0');
INSERT INTO `litemall_goods_product` VALUES ('247', '1009009', '[\"标准\"]', '1999.00', '1000000', 'http://yanxuan.nosdn.127.net/9791006f25e26b2d7c81f41f87ce8619.png', '2019-03-21 22:02:07', '2019-03-21 22:02:07', '1');
INSERT INTO `litemall_goods_product` VALUES ('248', '1009009', '[\"标准\"]', '1999.00', '1000000', 'http://yanxuan.nosdn.127.net/9791006f25e26b2d7c81f41f87ce8619.png', '2019-03-21 22:02:50', '2019-03-21 22:02:50', '0');
INSERT INTO `litemall_goods_product` VALUES ('249', '1009010', '[\"标准\"]', '0.00', '0', '', '2019-03-21 22:03:52', '2019-03-21 22:03:52', '1');
INSERT INTO `litemall_goods_product` VALUES ('250', '1009010', '[\"标准\"]', '0.00', '0', '', '2019-03-21 22:04:46', '2019-03-21 22:04:46', '0');

-- ----------------------------
-- Table structure for litemall_goods_specification
-- ----------------------------
DROP TABLE IF EXISTS `litemall_goods_specification`;
CREATE TABLE `litemall_goods_specification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品表的商品ID',
  `specification` varchar(255) NOT NULL DEFAULT '' COMMENT '商品规格名称',
  `value` varchar(255) NOT NULL DEFAULT '' COMMENT '商品规格值',
  `pic_url` varchar(255) NOT NULL DEFAULT '' COMMENT '商品规格图片',
  `add_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=utf8mb4 COMMENT='商品规格表';

-- ----------------------------
-- Records of litemall_goods_specification
-- ----------------------------
INSERT INTO `litemall_goods_specification` VALUES ('1', '1181000', '规格', '1.5m床垫*1+枕头*2', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('2', '1181000', '规格', '1.8m床垫*1+枕头*2', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('3', '1181000', '颜色', '浅杏粉', 'http://yanxuan.nosdn.127.net/10022c73fa7aa75c2c0d736e96cc56d5.png?quality=90&thumbnail=200x200&imageView', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('4', '1181000', '颜色', '玛瑙红', 'http://yanxuan.nosdn.127.net/29442127f431a1a1801c195905319427.png?quality=90&thumbnail=200x200&imageView', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('5', '1181000', '颜色', '烟白灰', 'http://yanxuan.nosdn.127.net/36f64a7161b67e7fb8ea45be32ecfa25.png?quality=90&thumbnail=200x200&imageView', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('6', '1006002', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_goods_specification` VALUES ('7', '1006007', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('8', '1006010', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('9', '1006013', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('10', '1006014', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('11', '1006051', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('12', '1009009', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_goods_specification` VALUES ('13', '1009012', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('14', '1009013', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('15', '1009024', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('16', '1009027', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('17', '1010000', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('18', '1010001', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('19', '1011004', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('20', '1015007', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('21', '1019000', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('22', '1019001', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('23', '1019002', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('24', '1019006', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('25', '1020000', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('26', '1021000', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('27', '1021001', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('28', '1021004', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('29', '1021010', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('30', '1022000', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('31', '1022001', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('32', '1023003', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('33', '1023012', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('34', '1023032', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('35', '1023034', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('36', '1025005', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('37', '1027004', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('38', '1029005', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('39', '1030001', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('40', '1030002', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('41', '1030003', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('42', '1030004', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('43', '1030005', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('44', '1030006', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('45', '1033000', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('46', '1035006', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('47', '1036002', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('48', '1036013', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('49', '1036016', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('50', '1037011', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('51', '1037012', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('52', '1038004', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('53', '1039051', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('54', '1039056', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('55', '1043005', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('56', '1044012', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('57', '1045000', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('58', '1046001', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('59', '1046002', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('60', '1046044', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('61', '1048005', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('62', '1051000', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('63', '1051001', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('64', '1051002', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('65', '1051003', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('66', '1055012', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('67', '1055016', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('68', '1055022', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('69', '1056002', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('70', '1057036', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('71', '1064000', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('72', '1064002', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('73', '1064003', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('74', '1064004', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('75', '1064006', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('76', '1064007', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('77', '1064021', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('78', '1064022', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('79', '1065004', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('80', '1065005', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('81', '1068010', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('82', '1068011', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('83', '1068012', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('84', '1070000', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('85', '1071004', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('86', '1071005', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('87', '1071006', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('88', '1072000', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('89', '1072001', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('90', '1073008', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('91', '1074001', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('92', '1075022', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('93', '1075023', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('94', '1075024', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('95', '1081000', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('96', '1081002', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('97', '1083009', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('98', '1083010', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('99', '1084001', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('100', '1084003', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('101', '1085019', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('102', '1086015', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('103', '1086023', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('104', '1086024', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('105', '1086025', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('106', '1086026', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('107', '1086052', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('108', '1090004', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('109', '1092001', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('110', '1092005', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('111', '1092024', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('112', '1092025', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('113', '1092026', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('114', '1092038', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('115', '1092039', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('116', '1093000', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('117', '1093001', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('118', '1093002', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('119', '1097004', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('120', '1097005', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('121', '1097006', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('122', '1097007', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('123', '1097009', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('124', '1097011', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('125', '1097012', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('126', '1097013', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('127', '1097014', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('128', '1097016', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('129', '1097017', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('130', '1100000', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('131', '1100001', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('132', '1100002', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('133', '1108029', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('134', '1108030', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('135', '1108031', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('136', '1108032', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('137', '1109004', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('138', '1109005', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('139', '1109008', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('140', '1109034', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('141', '1110002', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('142', '1110003', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('143', '1110004', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('144', '1110007', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('145', '1110008', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('146', '1110013', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('147', '1110014', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('148', '1110015', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('149', '1110016', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('150', '1110017', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('151', '1110018', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('152', '1110019', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('153', '1111007', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('154', '1111010', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('155', '1113010', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('156', '1113011', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('157', '1113019', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('158', '1114011', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('159', '1115023', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('160', '1115028', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('161', '1115052', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('162', '1115053', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('163', '1116004', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('164', '1116005', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('165', '1116008', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('166', '1116011', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('167', '1116030', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('168', '1116031', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('169', '1116032', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('170', '1116033', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('171', '1125010', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('172', '1125011', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('173', '1125016', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('174', '1125017', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('175', '1125026', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('176', '1127003', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('177', '1127024', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('178', '1127025', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('179', '1127038', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('180', '1127039', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('181', '1127047', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('182', '1127052', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('183', '1128002', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('184', '1128010', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('185', '1128011', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('186', '1129015', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('187', '1129016', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('188', '1130037', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('189', '1130038', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('190', '1130039', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('191', '1130041', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('192', '1130042', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('193', '1130049', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('194', '1130056', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('195', '1131017', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('196', '1134022', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('197', '1134030', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('198', '1134032', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('199', '1134036', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('200', '1134056', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('201', '1135000', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('202', '1135001', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('203', '1135002', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('204', '1135050', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('205', '1135051', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('206', '1135052', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('207', '1135053', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('208', '1135054', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('209', '1135055', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('210', '1135056', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('211', '1135057', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('212', '1135058', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('213', '1135065', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('214', '1135072', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('215', '1135073', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('216', '1138000', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('217', '1138001', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('218', '1143006', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('219', '1143015', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('220', '1143016', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('221', '1143018', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('222', '1143019', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('223', '1143020', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('224', '1147045', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('225', '1147046', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('226', '1147047', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('227', '1147048', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('228', '1151012', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('229', '1151013', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('230', '1152004', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('231', '1152008', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('232', '1152009', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('233', '1152031', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('234', '1152095', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('235', '1152097', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('236', '1152100', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('237', '1152101', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('238', '1152161', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('239', '1153006', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('240', '1155000', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('241', '1155015', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('242', '1156006', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('243', '1166008', '规格', '标准', '', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_goods_specification` VALUES ('244', '1009009', '规格', '标准', '', '2019-03-21 21:57:48', '2019-03-21 21:57:48', '1');
INSERT INTO `litemall_goods_specification` VALUES ('245', '1006002', '规格', '标准', '', '2019-03-21 21:58:04', '2019-03-21 21:58:04', '0');
INSERT INTO `litemall_goods_specification` VALUES ('246', '1009009', '规格', '标准', '', '2019-03-21 22:02:07', '2019-03-21 22:02:07', '1');
INSERT INTO `litemall_goods_specification` VALUES ('247', '1009009', '规格', '标准', '', '2019-03-21 22:02:50', '2019-03-21 22:02:50', '0');
INSERT INTO `litemall_goods_specification` VALUES ('248', '1009010', '规格', '标准', '', '2019-03-21 22:03:52', '2019-03-21 22:03:52', '1');
INSERT INTO `litemall_goods_specification` VALUES ('249', '1009010', '规格', '标准', '', '2019-03-21 22:04:46', '2019-03-21 22:04:46', '0');

-- ----------------------------
-- Table structure for litemall_groupon
-- ----------------------------
DROP TABLE IF EXISTS `litemall_groupon`;
CREATE TABLE `litemall_groupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL COMMENT '关联的订单ID',
  `groupon_id` int(11) DEFAULT '0' COMMENT '参与的团购ID，仅当user_type不是1',
  `rules_id` int(11) NOT NULL COMMENT '团购规则ID，关联litemall_groupon_rules表ID字段',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `creator_user_id` int(11) NOT NULL COMMENT '创建者ID',
  `add_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `share_url` varchar(255) DEFAULT NULL COMMENT '团购分享图片地址',
  `payed` tinyint(1) NOT NULL COMMENT '是否已经支付',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of litemall_groupon
-- ----------------------------

-- ----------------------------
-- Table structure for litemall_groupon_rules
-- ----------------------------
DROP TABLE IF EXISTS `litemall_groupon_rules`;
CREATE TABLE `litemall_groupon_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL COMMENT '商品表的商品ID',
  `goods_name` varchar(127) NOT NULL COMMENT '商品名称',
  `pic_url` varchar(255) DEFAULT NULL COMMENT '商品图片或者商品货品图片',
  `discount` decimal(63,0) NOT NULL COMMENT '优惠金额',
  `discount_member` int(11) NOT NULL COMMENT '达到优惠条件的人数',
  `add_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `expire_time` datetime DEFAULT NULL COMMENT '团购过期时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of litemall_groupon_rules
-- ----------------------------
INSERT INTO `litemall_groupon_rules` VALUES ('1', '1039051', '多功能午睡枕', 'http://yanxuan.nosdn.127.net/c8ca0600fa7ba11ca8be6a3173dd38c9.png', '20', '20', '2018-11-08 13:41:44', '2018-11-08 13:41:44', '2019-12-31 00:00:00', '0');
INSERT INTO `litemall_groupon_rules` VALUES ('2', '1109008', '云端沙发组合', 'http://yanxuan.nosdn.127.net/c5be2604c0e4186a4e7079feeb742cee.png', '50', '5', '2018-11-08 13:42:44', '2018-11-08 13:42:44', '2019-12-31 00:00:00', '0');

-- ----------------------------
-- Table structure for litemall_issue
-- ----------------------------
DROP TABLE IF EXISTS `litemall_issue`;
CREATE TABLE `litemall_issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(255) DEFAULT NULL COMMENT '问题标题',
  `answer` varchar(255) DEFAULT NULL COMMENT '问题答案',
  `add_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='常见问题表';

-- ----------------------------
-- Records of litemall_issue
-- ----------------------------
INSERT INTO `litemall_issue` VALUES ('1', '购买运费如何收取？', '单笔订单金额（不含运费）满88元免邮费；不满88元，每单收取10元运费。\n(港澳台地区需满', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_issue` VALUES ('2', '使用什么快递发货？', '严选默认使用顺丰快递发货（个别商品使用其他快递），配送范围覆盖全国大部分地区（港澳台地区除', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_issue` VALUES ('3', '如何申请退货？', '1.自收到商品之日起30日内，顾客可申请无忧退货，退款将原路返还，不同的银行处理时间不同，', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_issue` VALUES ('4', '如何开具发票？', '1.如需开具普通发票，请在下单时选择“我要开发票”并填写相关信息（APP仅限2.4.0及以', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');

-- ----------------------------
-- Table structure for litemall_keyword
-- ----------------------------
DROP TABLE IF EXISTS `litemall_keyword`;
CREATE TABLE `litemall_keyword` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(127) NOT NULL DEFAULT '' COMMENT '关键字',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字的跳转链接',
  `is_hot` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是热门关键字',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是默认关键字',
  `sort_order` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `add_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='关键字表';

-- ----------------------------
-- Records of litemall_keyword
-- ----------------------------
INSERT INTO `litemall_keyword` VALUES ('1', '母亲节', '', '0', '0', '100', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_keyword` VALUES ('2', '日式', '', '0', '0', '100', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_keyword` VALUES ('3', '夏凉被', '', '0', '0', '100', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_keyword` VALUES ('4', '新品上市', '', '0', '0', '100', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_keyword` VALUES ('5', 'BL-5C', '', '0', '0', '5', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');
INSERT INTO `litemall_keyword` VALUES ('6', '18650', '', '1', '1', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_keyword` VALUES ('7', '单鞋', '', '0', '0', '8', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '1');

-- ----------------------------
-- Table structure for litemall_order
-- ----------------------------
DROP TABLE IF EXISTS `litemall_order`;
CREATE TABLE `litemall_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户表的用户ID',
  `order_sn` varchar(63) NOT NULL COMMENT '订单编号',
  `order_status` smallint(6) NOT NULL COMMENT '订单状态',
  `consignee` varchar(63) NOT NULL COMMENT '收货人名称',
  `mobile` varchar(63) NOT NULL COMMENT '收货人手机号',
  `address` varchar(127) NOT NULL COMMENT '收货具体地址',
  `message` varchar(512) NOT NULL DEFAULT '' COMMENT '用户订单留言',
  `goods_price` decimal(10,2) NOT NULL COMMENT '商品总费用',
  `freight_price` decimal(10,2) NOT NULL COMMENT '配送费用',
  `coupon_price` decimal(10,2) NOT NULL COMMENT '优惠券减免',
  `integral_price` decimal(10,2) NOT NULL COMMENT '用户积分减免',
  `groupon_price` decimal(10,2) NOT NULL COMMENT '团购优惠价减免',
  `order_price` decimal(10,2) NOT NULL COMMENT '订单费用， = goods_price + freight_price - coupon_price',
  `actual_price` decimal(10,2) NOT NULL COMMENT '实付费用， = order_price - integral_price',
  `pay_id` varchar(63) DEFAULT NULL COMMENT '微信付款编号',
  `pay_time` datetime DEFAULT NULL COMMENT '微信付款时间',
  `ship_sn` varchar(63) DEFAULT NULL COMMENT '发货编号',
  `ship_channel` varchar(63) DEFAULT NULL COMMENT '发货快递公司',
  `ship_time` datetime DEFAULT NULL COMMENT '发货开始时间',
  `confirm_time` datetime DEFAULT NULL COMMENT '用户确认收货时间',
  `comments` smallint(6) DEFAULT '0' COMMENT '待评价订单商品数量',
  `end_time` datetime DEFAULT NULL COMMENT '订单关闭时间',
  `add_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单表';

-- ----------------------------
-- Records of litemall_order
-- ----------------------------

-- ----------------------------
-- Table structure for litemall_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `litemall_order_goods`;
CREATE TABLE `litemall_order_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT '订单表的订单ID',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品表的商品ID',
  `goods_name` varchar(127) NOT NULL DEFAULT '' COMMENT '商品名称',
  `goods_sn` varchar(63) NOT NULL DEFAULT '' COMMENT '商品编号',
  `product_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品货品表的货品ID',
  `number` smallint(5) NOT NULL DEFAULT '0' COMMENT '商品货品的购买数量',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品货品的售价',
  `specifications` varchar(1023) NOT NULL COMMENT '商品货品的规格列表',
  `pic_url` varchar(255) NOT NULL DEFAULT '' COMMENT '商品货品图片或者商品图片',
  `comment` int(11) DEFAULT '0' COMMENT '订单商品评论，如果是-1，则超期不能评价；如果是0，则可以评价；如果其他值，则是comment表里面的评论ID。',
  `add_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订单商品表';

-- ----------------------------
-- Records of litemall_order_goods
-- ----------------------------

-- ----------------------------
-- Table structure for litemall_permission
-- ----------------------------
DROP TABLE IF EXISTS `litemall_permission`;
CREATE TABLE `litemall_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL COMMENT '角色ID',
  `permission` varchar(63) DEFAULT NULL COMMENT '权限',
  `add_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COMMENT='权限表';

-- ----------------------------
-- Records of litemall_permission
-- ----------------------------
INSERT INTO `litemall_permission` VALUES ('1', '1', '*', '2019-01-01 00:00:00', '2019-01-01 00:00:00', '0');
INSERT INTO `litemall_permission` VALUES ('2', '2', 'admin:category:read', '2019-01-07 15:18:53', '2019-01-07 15:18:53', '0');
INSERT INTO `litemall_permission` VALUES ('3', '2', 'admin:category:update', '2019-01-07 15:18:53', '2019-01-07 15:18:53', '0');
INSERT INTO `litemall_permission` VALUES ('4', '2', 'admin:category:delete', '2019-01-07 15:18:53', '2019-01-07 15:18:53', '0');
INSERT INTO `litemall_permission` VALUES ('5', '2', 'admin:category:create', '2019-01-07 15:18:53', '2019-01-07 15:18:53', '0');
INSERT INTO `litemall_permission` VALUES ('6', '2', 'admin:category:list', '2019-01-07 15:18:53', '2019-01-07 15:18:53', '0');
INSERT INTO `litemall_permission` VALUES ('7', '2', 'admin:brand:create', '2019-01-07 15:18:53', '2019-01-07 15:18:53', '0');
INSERT INTO `litemall_permission` VALUES ('8', '2', 'admin:brand:list', '2019-01-07 15:18:53', '2019-01-07 15:18:53', '0');
INSERT INTO `litemall_permission` VALUES ('9', '2', 'admin:brand:delete', '2019-01-07 15:18:53', '2019-01-07 15:18:53', '0');
INSERT INTO `litemall_permission` VALUES ('10', '2', 'admin:brand:read', '2019-01-07 15:18:53', '2019-01-07 15:18:53', '0');
INSERT INTO `litemall_permission` VALUES ('11', '2', 'admin:brand:update', '2019-01-07 15:18:53', '2019-01-07 15:18:53', '0');
INSERT INTO `litemall_permission` VALUES ('12', '3', 'admin:ad:list', '2019-01-07 15:18:57', '2019-01-07 15:18:57', '0');
INSERT INTO `litemall_permission` VALUES ('13', '3', 'admin:ad:delete', '2019-01-07 15:18:57', '2019-01-07 15:18:57', '0');
INSERT INTO `litemall_permission` VALUES ('14', '3', 'admin:ad:create', '2019-01-07 15:18:57', '2019-01-07 15:18:57', '0');
INSERT INTO `litemall_permission` VALUES ('15', '3', 'admin:ad:update', '2019-01-07 15:18:57', '2019-01-07 15:18:57', '0');
INSERT INTO `litemall_permission` VALUES ('16', '3', 'admin:ad:read', '2019-01-07 15:18:57', '2019-01-07 15:18:57', '0');
INSERT INTO `litemall_permission` VALUES ('17', '3', 'admin:groupon:list', '2019-01-07 15:18:57', '2019-01-07 15:18:57', '0');
INSERT INTO `litemall_permission` VALUES ('18', '3', 'admin:groupon:update', '2019-01-07 15:18:57', '2019-01-07 15:18:57', '0');
INSERT INTO `litemall_permission` VALUES ('19', '3', 'admin:groupon:create', '2019-01-07 15:18:57', '2019-01-07 15:18:57', '0');
INSERT INTO `litemall_permission` VALUES ('20', '3', 'admin:groupon:read', '2019-01-07 15:18:57', '2019-01-07 15:18:57', '0');
INSERT INTO `litemall_permission` VALUES ('21', '3', 'admin:groupon:delete', '2019-01-07 15:18:57', '2019-01-07 15:18:57', '0');
INSERT INTO `litemall_permission` VALUES ('22', '3', 'admin:topic:create', '2019-01-07 15:18:57', '2019-01-07 15:18:57', '0');
INSERT INTO `litemall_permission` VALUES ('23', '3', 'admin:topic:read', '2019-01-07 15:18:57', '2019-01-07 15:18:57', '0');
INSERT INTO `litemall_permission` VALUES ('24', '3', 'admin:topic:list', '2019-01-07 15:18:57', '2019-01-07 15:18:57', '0');
INSERT INTO `litemall_permission` VALUES ('25', '3', 'admin:topic:delete', '2019-01-07 15:18:57', '2019-01-07 15:18:57', '0');
INSERT INTO `litemall_permission` VALUES ('26', '3', 'admin:topic:update', '2019-01-07 15:18:57', '2019-01-07 15:18:57', '0');
INSERT INTO `litemall_permission` VALUES ('27', '3', 'admin:coupon:list', '2019-01-07 15:18:57', '2019-01-07 15:18:57', '0');
INSERT INTO `litemall_permission` VALUES ('28', '3', 'admin:coupon:delete', '2019-01-07 15:18:57', '2019-01-07 15:18:57', '0');
INSERT INTO `litemall_permission` VALUES ('29', '3', 'admin:coupon:read', '2019-01-07 15:18:57', '2019-01-07 15:18:57', '0');
INSERT INTO `litemall_permission` VALUES ('30', '3', 'admin:coupon:create', '2019-01-07 15:18:57', '2019-01-07 15:18:57', '0');
INSERT INTO `litemall_permission` VALUES ('31', '3', 'admin:coupon:update', '2019-01-07 15:18:57', '2019-01-07 15:18:57', '0');

-- ----------------------------
-- Table structure for litemall_region
-- ----------------------------
DROP TABLE IF EXISTS `litemall_region`;
CREATE TABLE `litemall_region` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '行政区域父ID，例如区县的pid指向市，市的pid指向省，省的pid则是0',
  `name` varchar(120) NOT NULL DEFAULT '' COMMENT '行政区域名称',
  `type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '行政区域类型，如如1则是省， 如果是2则是市，如果是3则是区县',
  `code` int(11) NOT NULL DEFAULT '0' COMMENT '行政区域编码',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`pid`),
  KEY `region_type` (`type`),
  KEY `agency_id` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3232 DEFAULT CHARSET=utf8mb4 COMMENT='行政区域表';

-- ----------------------------
-- Records of litemall_region
-- ----------------------------
INSERT INTO `litemall_region` VALUES ('1', '0', '北京市', '1', '11');
INSERT INTO `litemall_region` VALUES ('2', '0', '天津市', '1', '12');
INSERT INTO `litemall_region` VALUES ('3', '0', '河北省', '1', '13');
INSERT INTO `litemall_region` VALUES ('4', '0', '山西省', '1', '14');
INSERT INTO `litemall_region` VALUES ('5', '0', '内蒙古自治区', '1', '15');
INSERT INTO `litemall_region` VALUES ('6', '0', '辽宁省', '1', '21');
INSERT INTO `litemall_region` VALUES ('7', '0', '吉林省', '1', '22');
INSERT INTO `litemall_region` VALUES ('8', '0', '黑龙江省', '1', '23');
INSERT INTO `litemall_region` VALUES ('9', '0', '上海市', '1', '31');
INSERT INTO `litemall_region` VALUES ('10', '0', '江苏省', '1', '32');
INSERT INTO `litemall_region` VALUES ('11', '0', '浙江省', '1', '33');
INSERT INTO `litemall_region` VALUES ('12', '0', '安徽省', '1', '34');
INSERT INTO `litemall_region` VALUES ('13', '0', '福建省', '1', '35');
INSERT INTO `litemall_region` VALUES ('14', '0', '江西省', '1', '36');
INSERT INTO `litemall_region` VALUES ('15', '0', '山东省', '1', '37');
INSERT INTO `litemall_region` VALUES ('16', '0', '河南省', '1', '41');
INSERT INTO `litemall_region` VALUES ('17', '0', '湖北省', '1', '42');
INSERT INTO `litemall_region` VALUES ('18', '0', '湖南省', '1', '43');
INSERT INTO `litemall_region` VALUES ('19', '0', '广东省', '1', '44');
INSERT INTO `litemall_region` VALUES ('20', '0', '广西壮族自治区', '1', '45');
INSERT INTO `litemall_region` VALUES ('21', '0', '海南省', '1', '46');
INSERT INTO `litemall_region` VALUES ('22', '0', '重庆市', '1', '50');
INSERT INTO `litemall_region` VALUES ('23', '0', '四川省', '1', '51');
INSERT INTO `litemall_region` VALUES ('24', '0', '贵州省', '1', '52');
INSERT INTO `litemall_region` VALUES ('25', '0', '云南省', '1', '53');
INSERT INTO `litemall_region` VALUES ('26', '0', '西藏自治区', '1', '54');
INSERT INTO `litemall_region` VALUES ('27', '0', '陕西省', '1', '61');
INSERT INTO `litemall_region` VALUES ('28', '0', '甘肃省', '1', '62');
INSERT INTO `litemall_region` VALUES ('29', '0', '青海省', '1', '63');
INSERT INTO `litemall_region` VALUES ('30', '0', '宁夏回族自治区', '1', '64');
INSERT INTO `litemall_region` VALUES ('31', '0', '新疆维吾尔自治区', '1', '65');
INSERT INTO `litemall_region` VALUES ('32', '1', '市辖区', '2', '1101');
INSERT INTO `litemall_region` VALUES ('33', '2', '市辖区', '2', '1201');
INSERT INTO `litemall_region` VALUES ('34', '3', '石家庄市', '2', '1301');
INSERT INTO `litemall_region` VALUES ('35', '3', '唐山市', '2', '1302');
INSERT INTO `litemall_region` VALUES ('36', '3', '秦皇岛市', '2', '1303');
INSERT INTO `litemall_region` VALUES ('37', '3', '邯郸市', '2', '1304');
INSERT INTO `litemall_region` VALUES ('38', '3', '邢台市', '2', '1305');
INSERT INTO `litemall_region` VALUES ('39', '3', '保定市', '2', '1306');
INSERT INTO `litemall_region` VALUES ('40', '3', '张家口市', '2', '1307');
INSERT INTO `litemall_region` VALUES ('41', '3', '承德市', '2', '1308');
INSERT INTO `litemall_region` VALUES ('42', '3', '沧州市', '2', '1309');
INSERT INTO `litemall_region` VALUES ('43', '3', '廊坊市', '2', '1310');
INSERT INTO `litemall_region` VALUES ('44', '3', '衡水市', '2', '1311');
INSERT INTO `litemall_region` VALUES ('45', '3', '省直辖县级行政区划', '2', '1390');
INSERT INTO `litemall_region` VALUES ('46', '4', '太原市', '2', '1401');
INSERT INTO `litemall_region` VALUES ('47', '4', '大同市', '2', '1402');
INSERT INTO `litemall_region` VALUES ('48', '4', '阳泉市', '2', '1403');
INSERT INTO `litemall_region` VALUES ('49', '4', '长治市', '2', '1404');
INSERT INTO `litemall_region` VALUES ('50', '4', '晋城市', '2', '1405');
INSERT INTO `litemall_region` VALUES ('51', '4', '朔州市', '2', '1406');
INSERT INTO `litemall_region` VALUES ('52', '4', '晋中市', '2', '1407');
INSERT INTO `litemall_region` VALUES ('53', '4', '运城市', '2', '1408');
INSERT INTO `litemall_region` VALUES ('54', '4', '忻州市', '2', '1409');
INSERT INTO `litemall_region` VALUES ('55', '4', '临汾市', '2', '1410');
INSERT INTO `litemall_region` VALUES ('56', '4', '吕梁市', '2', '1411');
INSERT INTO `litemall_region` VALUES ('57', '5', '呼和浩特市', '2', '1501');
INSERT INTO `litemall_region` VALUES ('58', '5', '包头市', '2', '1502');
INSERT INTO `litemall_region` VALUES ('59', '5', '乌海市', '2', '1503');
INSERT INTO `litemall_region` VALUES ('60', '5', '赤峰市', '2', '1504');
INSERT INTO `litemall_region` VALUES ('61', '5', '通辽市', '2', '1505');
INSERT INTO `litemall_region` VALUES ('62', '5', '鄂尔多斯市', '2', '1506');
INSERT INTO `litemall_region` VALUES ('63', '5', '呼伦贝尔市', '2', '1507');
INSERT INTO `litemall_region` VALUES ('64', '5', '巴彦淖尔市', '2', '1508');
INSERT INTO `litemall_region` VALUES ('65', '5', '乌兰察布市', '2', '1509');
INSERT INTO `litemall_region` VALUES ('66', '5', '兴安盟', '2', '1522');
INSERT INTO `litemall_region` VALUES ('67', '5', '锡林郭勒盟', '2', '1525');
INSERT INTO `litemall_region` VALUES ('68', '5', '阿拉善盟', '2', '1529');
INSERT INTO `litemall_region` VALUES ('69', '6', '沈阳市', '2', '2101');
INSERT INTO `litemall_region` VALUES ('70', '6', '大连市', '2', '2102');
INSERT INTO `litemall_region` VALUES ('71', '6', '鞍山市', '2', '2103');
INSERT INTO `litemall_region` VALUES ('72', '6', '抚顺市', '2', '2104');
INSERT INTO `litemall_region` VALUES ('73', '6', '本溪市', '2', '2105');
INSERT INTO `litemall_region` VALUES ('74', '6', '丹东市', '2', '2106');
INSERT INTO `litemall_region` VALUES ('75', '6', '锦州市', '2', '2107');
INSERT INTO `litemall_region` VALUES ('76', '6', '营口市', '2', '2108');
INSERT INTO `litemall_region` VALUES ('77', '6', '阜新市', '2', '2109');
INSERT INTO `litemall_region` VALUES ('78', '6', '辽阳市', '2', '2110');
INSERT INTO `litemall_region` VALUES ('79', '6', '盘锦市', '2', '2111');
INSERT INTO `litemall_region` VALUES ('80', '6', '铁岭市', '2', '2112');
INSERT INTO `litemall_region` VALUES ('81', '6', '朝阳市', '2', '2113');
INSERT INTO `litemall_region` VALUES ('82', '6', '葫芦岛市', '2', '2114');
INSERT INTO `litemall_region` VALUES ('83', '7', '长春市', '2', '2201');
INSERT INTO `litemall_region` VALUES ('84', '7', '吉林市', '2', '2202');
INSERT INTO `litemall_region` VALUES ('85', '7', '四平市', '2', '2203');
INSERT INTO `litemall_region` VALUES ('86', '7', '辽源市', '2', '2204');
INSERT INTO `litemall_region` VALUES ('87', '7', '通化市', '2', '2205');
INSERT INTO `litemall_region` VALUES ('88', '7', '白山市', '2', '2206');
INSERT INTO `litemall_region` VALUES ('89', '7', '松原市', '2', '2207');
INSERT INTO `litemall_region` VALUES ('90', '7', '白城市', '2', '2208');
INSERT INTO `litemall_region` VALUES ('91', '7', '延边朝鲜族自治州', '2', '2224');
INSERT INTO `litemall_region` VALUES ('92', '8', '哈尔滨市', '2', '2301');
INSERT INTO `litemall_region` VALUES ('93', '8', '齐齐哈尔市', '2', '2302');
INSERT INTO `litemall_region` VALUES ('94', '8', '鸡西市', '2', '2303');
INSERT INTO `litemall_region` VALUES ('95', '8', '鹤岗市', '2', '2304');
INSERT INTO `litemall_region` VALUES ('96', '8', '双鸭山市', '2', '2305');
INSERT INTO `litemall_region` VALUES ('97', '8', '大庆市', '2', '2306');
INSERT INTO `litemall_region` VALUES ('98', '8', '伊春市', '2', '2307');
INSERT INTO `litemall_region` VALUES ('99', '8', '佳木斯市', '2', '2308');
INSERT INTO `litemall_region` VALUES ('100', '8', '七台河市', '2', '2309');
INSERT INTO `litemall_region` VALUES ('101', '8', '牡丹江市', '2', '2310');
INSERT INTO `litemall_region` VALUES ('102', '8', '黑河市', '2', '2311');
INSERT INTO `litemall_region` VALUES ('103', '8', '绥化市', '2', '2312');
INSERT INTO `litemall_region` VALUES ('104', '8', '大兴安岭地区', '2', '2327');
INSERT INTO `litemall_region` VALUES ('105', '9', '市辖区', '2', '3101');
INSERT INTO `litemall_region` VALUES ('106', '10', '南京市', '2', '3201');
INSERT INTO `litemall_region` VALUES ('107', '10', '无锡市', '2', '3202');
INSERT INTO `litemall_region` VALUES ('108', '10', '徐州市', '2', '3203');
INSERT INTO `litemall_region` VALUES ('109', '10', '常州市', '2', '3204');
INSERT INTO `litemall_region` VALUES ('110', '10', '苏州市', '2', '3205');
INSERT INTO `litemall_region` VALUES ('111', '10', '南通市', '2', '3206');
INSERT INTO `litemall_region` VALUES ('112', '10', '连云港市', '2', '3207');
INSERT INTO `litemall_region` VALUES ('113', '10', '淮安市', '2', '3208');
INSERT INTO `litemall_region` VALUES ('114', '10', '盐城市', '2', '3209');
INSERT INTO `litemall_region` VALUES ('115', '10', '扬州市', '2', '3210');
INSERT INTO `litemall_region` VALUES ('116', '10', '镇江市', '2', '3211');
INSERT INTO `litemall_region` VALUES ('117', '10', '泰州市', '2', '3212');
INSERT INTO `litemall_region` VALUES ('118', '10', '宿迁市', '2', '3213');
INSERT INTO `litemall_region` VALUES ('119', '11', '杭州市', '2', '3301');
INSERT INTO `litemall_region` VALUES ('120', '11', '宁波市', '2', '3302');
INSERT INTO `litemall_region` VALUES ('121', '11', '温州市', '2', '3303');
INSERT INTO `litemall_region` VALUES ('122', '11', '嘉兴市', '2', '3304');
INSERT INTO `litemall_region` VALUES ('123', '11', '湖州市', '2', '3305');
INSERT INTO `litemall_region` VALUES ('124', '11', '绍兴市', '2', '3306');
INSERT INTO `litemall_region` VALUES ('125', '11', '金华市', '2', '3307');
INSERT INTO `litemall_region` VALUES ('126', '11', '衢州市', '2', '3308');
INSERT INTO `litemall_region` VALUES ('127', '11', '舟山市', '2', '3309');
INSERT INTO `litemall_region` VALUES ('128', '11', '台州市', '2', '3310');
INSERT INTO `litemall_region` VALUES ('129', '11', '丽水市', '2', '3311');
INSERT INTO `litemall_region` VALUES ('130', '12', '合肥市', '2', '3401');
INSERT INTO `litemall_region` VALUES ('131', '12', '芜湖市', '2', '3402');
INSERT INTO `litemall_region` VALUES ('132', '12', '蚌埠市', '2', '3403');
INSERT INTO `litemall_region` VALUES ('133', '12', '淮南市', '2', '3404');
INSERT INTO `litemall_region` VALUES ('134', '12', '马鞍山市', '2', '3405');
INSERT INTO `litemall_region` VALUES ('135', '12', '淮北市', '2', '3406');
INSERT INTO `litemall_region` VALUES ('136', '12', '铜陵市', '2', '3407');
INSERT INTO `litemall_region` VALUES ('137', '12', '安庆市', '2', '3408');
INSERT INTO `litemall_region` VALUES ('138', '12', '黄山市', '2', '3410');
INSERT INTO `litemall_region` VALUES ('139', '12', '滁州市', '2', '3411');
INSERT INTO `litemall_region` VALUES ('140', '12', '阜阳市', '2', '3412');
INSERT INTO `litemall_region` VALUES ('141', '12', '宿州市', '2', '3413');
INSERT INTO `litemall_region` VALUES ('142', '12', '六安市', '2', '3415');
INSERT INTO `litemall_region` VALUES ('143', '12', '亳州市', '2', '3416');
INSERT INTO `litemall_region` VALUES ('144', '12', '池州市', '2', '3417');
INSERT INTO `litemall_region` VALUES ('145', '12', '宣城市', '2', '3418');
INSERT INTO `litemall_region` VALUES ('146', '13', '福州市', '2', '3501');
INSERT INTO `litemall_region` VALUES ('147', '13', '厦门市', '2', '3502');
INSERT INTO `litemall_region` VALUES ('148', '13', '莆田市', '2', '3503');
INSERT INTO `litemall_region` VALUES ('149', '13', '三明市', '2', '3504');
INSERT INTO `litemall_region` VALUES ('150', '13', '泉州市', '2', '3505');
INSERT INTO `litemall_region` VALUES ('151', '13', '漳州市', '2', '3506');
INSERT INTO `litemall_region` VALUES ('152', '13', '南平市', '2', '3507');
INSERT INTO `litemall_region` VALUES ('153', '13', '龙岩市', '2', '3508');
INSERT INTO `litemall_region` VALUES ('154', '13', '宁德市', '2', '3509');
INSERT INTO `litemall_region` VALUES ('155', '14', '南昌市', '2', '3601');
INSERT INTO `litemall_region` VALUES ('156', '14', '景德镇市', '2', '3602');
INSERT INTO `litemall_region` VALUES ('157', '14', '萍乡市', '2', '3603');
INSERT INTO `litemall_region` VALUES ('158', '14', '九江市', '2', '3604');
INSERT INTO `litemall_region` VALUES ('159', '14', '新余市', '2', '3605');
INSERT INTO `litemall_region` VALUES ('160', '14', '鹰潭市', '2', '3606');
INSERT INTO `litemall_region` VALUES ('161', '14', '赣州市', '2', '3607');
INSERT INTO `litemall_region` VALUES ('162', '14', '吉安市', '2', '3608');
INSERT INTO `litemall_region` VALUES ('163', '14', '宜春市', '2', '3609');
INSERT INTO `litemall_region` VALUES ('164', '14', '抚州市', '2', '3610');
INSERT INTO `litemall_region` VALUES ('165', '14', '上饶市', '2', '3611');
INSERT INTO `litemall_region` VALUES ('166', '15', '济南市', '2', '3701');
INSERT INTO `litemall_region` VALUES ('167', '15', '青岛市', '2', '3702');
INSERT INTO `litemall_region` VALUES ('168', '15', '淄博市', '2', '3703');
INSERT INTO `litemall_region` VALUES ('169', '15', '枣庄市', '2', '3704');
INSERT INTO `litemall_region` VALUES ('170', '15', '东营市', '2', '3705');
INSERT INTO `litemall_region` VALUES ('171', '15', '烟台市', '2', '3706');
INSERT INTO `litemall_region` VALUES ('172', '15', '潍坊市', '2', '3707');
INSERT INTO `litemall_region` VALUES ('173', '15', '济宁市', '2', '3708');
INSERT INTO `litemall_region` VALUES ('174', '15', '泰安市', '2', '3709');
INSERT INTO `litemall_region` VALUES ('175', '15', '威海市', '2', '3710');
INSERT INTO `litemall_region` VALUES ('176', '15', '日照市', '2', '3711');
INSERT INTO `litemall_region` VALUES ('177', '15', '莱芜市', '2', '3712');
INSERT INTO `litemall_region` VALUES ('178', '15', '临沂市', '2', '3713');
INSERT INTO `litemall_region` VALUES ('179', '15', '德州市', '2', '3714');
INSERT INTO `litemall_region` VALUES ('180', '15', '聊城市', '2', '3715');
INSERT INTO `litemall_region` VALUES ('181', '15', '滨州市', '2', '3716');
INSERT INTO `litemall_region` VALUES ('182', '15', '菏泽市', '2', '3717');
INSERT INTO `litemall_region` VALUES ('183', '16', '郑州市', '2', '4101');
INSERT INTO `litemall_region` VALUES ('184', '16', '开封市', '2', '4102');
INSERT INTO `litemall_region` VALUES ('185', '16', '洛阳市', '2', '4103');
INSERT INTO `litemall_region` VALUES ('186', '16', '平顶山市', '2', '4104');
INSERT INTO `litemall_region` VALUES ('187', '16', '安阳市', '2', '4105');
INSERT INTO `litemall_region` VALUES ('188', '16', '鹤壁市', '2', '4106');
INSERT INTO `litemall_region` VALUES ('189', '16', '新乡市', '2', '4107');
INSERT INTO `litemall_region` VALUES ('190', '16', '焦作市', '2', '4108');
INSERT INTO `litemall_region` VALUES ('191', '16', '濮阳市', '2', '4109');
INSERT INTO `litemall_region` VALUES ('192', '16', '许昌市', '2', '4110');
INSERT INTO `litemall_region` VALUES ('193', '16', '漯河市', '2', '4111');
INSERT INTO `litemall_region` VALUES ('194', '16', '三门峡市', '2', '4112');
INSERT INTO `litemall_region` VALUES ('195', '16', '南阳市', '2', '4113');
INSERT INTO `litemall_region` VALUES ('196', '16', '商丘市', '2', '4114');
INSERT INTO `litemall_region` VALUES ('197', '16', '信阳市', '2', '4115');
INSERT INTO `litemall_region` VALUES ('198', '16', '周口市', '2', '4116');
INSERT INTO `litemall_region` VALUES ('199', '16', '驻马店市', '2', '4117');
INSERT INTO `litemall_region` VALUES ('200', '16', '省直辖县级行政区划', '2', '4190');
INSERT INTO `litemall_region` VALUES ('201', '17', '武汉市', '2', '4201');
INSERT INTO `litemall_region` VALUES ('202', '17', '黄石市', '2', '4202');
INSERT INTO `litemall_region` VALUES ('203', '17', '十堰市', '2', '4203');
INSERT INTO `litemall_region` VALUES ('204', '17', '宜昌市', '2', '4205');
INSERT INTO `litemall_region` VALUES ('205', '17', '襄阳市', '2', '4206');
INSERT INTO `litemall_region` VALUES ('206', '17', '鄂州市', '2', '4207');
INSERT INTO `litemall_region` VALUES ('207', '17', '荆门市', '2', '4208');
INSERT INTO `litemall_region` VALUES ('208', '17', '孝感市', '2', '4209');
INSERT INTO `litemall_region` VALUES ('209', '17', '荆州市', '2', '4210');
INSERT INTO `litemall_region` VALUES ('210', '17', '黄冈市', '2', '4211');
INSERT INTO `litemall_region` VALUES ('211', '17', '咸宁市', '2', '4212');
INSERT INTO `litemall_region` VALUES ('212', '17', '随州市', '2', '4213');
INSERT INTO `litemall_region` VALUES ('213', '17', '恩施土家族苗族自治州', '2', '4228');
INSERT INTO `litemall_region` VALUES ('214', '17', '省直辖县级行政区划', '2', '4290');
INSERT INTO `litemall_region` VALUES ('215', '18', '长沙市', '2', '4301');
INSERT INTO `litemall_region` VALUES ('216', '18', '株洲市', '2', '4302');
INSERT INTO `litemall_region` VALUES ('217', '18', '湘潭市', '2', '4303');
INSERT INTO `litemall_region` VALUES ('218', '18', '衡阳市', '2', '4304');
INSERT INTO `litemall_region` VALUES ('219', '18', '邵阳市', '2', '4305');
INSERT INTO `litemall_region` VALUES ('220', '18', '岳阳市', '2', '4306');
INSERT INTO `litemall_region` VALUES ('221', '18', '常德市', '2', '4307');
INSERT INTO `litemall_region` VALUES ('222', '18', '张家界市', '2', '4308');
INSERT INTO `litemall_region` VALUES ('223', '18', '益阳市', '2', '4309');
INSERT INTO `litemall_region` VALUES ('224', '18', '郴州市', '2', '4310');
INSERT INTO `litemall_region` VALUES ('225', '18', '永州市', '2', '4311');
INSERT INTO `litemall_region` VALUES ('226', '18', '怀化市', '2', '4312');
INSERT INTO `litemall_region` VALUES ('227', '18', '娄底市', '2', '4313');
INSERT INTO `litemall_region` VALUES ('228', '18', '湘西土家族苗族自治州', '2', '4331');
INSERT INTO `litemall_region` VALUES ('229', '19', '广州市', '2', '4401');
INSERT INTO `litemall_region` VALUES ('230', '19', '韶关市', '2', '4402');
INSERT INTO `litemall_region` VALUES ('231', '19', '深圳市', '2', '4403');
INSERT INTO `litemall_region` VALUES ('232', '19', '珠海市', '2', '4404');
INSERT INTO `litemall_region` VALUES ('233', '19', '汕头市', '2', '4405');
INSERT INTO `litemall_region` VALUES ('234', '19', '佛山市', '2', '4406');
INSERT INTO `litemall_region` VALUES ('235', '19', '江门市', '2', '4407');
INSERT INTO `litemall_region` VALUES ('236', '19', '湛江市', '2', '4408');
INSERT INTO `litemall_region` VALUES ('237', '19', '茂名市', '2', '4409');
INSERT INTO `litemall_region` VALUES ('238', '19', '肇庆市', '2', '4412');
INSERT INTO `litemall_region` VALUES ('239', '19', '惠州市', '2', '4413');
INSERT INTO `litemall_region` VALUES ('240', '19', '梅州市', '2', '4414');
INSERT INTO `litemall_region` VALUES ('241', '19', '汕尾市', '2', '4415');
INSERT INTO `litemall_region` VALUES ('242', '19', '河源市', '2', '4416');
INSERT INTO `litemall_region` VALUES ('243', '19', '阳江市', '2', '4417');
INSERT INTO `litemall_region` VALUES ('244', '19', '清远市', '2', '4418');
INSERT INTO `litemall_region` VALUES ('245', '19', '东莞市', '2', '4419');
INSERT INTO `litemall_region` VALUES ('246', '19', '中山市', '2', '4420');
INSERT INTO `litemall_region` VALUES ('247', '19', '潮州市', '2', '4451');
INSERT INTO `litemall_region` VALUES ('248', '19', '揭阳市', '2', '4452');
INSERT INTO `litemall_region` VALUES ('249', '19', '云浮市', '2', '4453');
INSERT INTO `litemall_region` VALUES ('250', '20', '南宁市', '2', '4501');
INSERT INTO `litemall_region` VALUES ('251', '20', '柳州市', '2', '4502');
INSERT INTO `litemall_region` VALUES ('252', '20', '桂林市', '2', '4503');
INSERT INTO `litemall_region` VALUES ('253', '20', '梧州市', '2', '4504');
INSERT INTO `litemall_region` VALUES ('254', '20', '北海市', '2', '4505');
INSERT INTO `litemall_region` VALUES ('255', '20', '防城港市', '2', '4506');
INSERT INTO `litemall_region` VALUES ('256', '20', '钦州市', '2', '4507');
INSERT INTO `litemall_region` VALUES ('257', '20', '贵港市', '2', '4508');
INSERT INTO `litemall_region` VALUES ('258', '20', '玉林市', '2', '4509');
INSERT INTO `litemall_region` VALUES ('259', '20', '百色市', '2', '4510');
INSERT INTO `litemall_region` VALUES ('260', '20', '贺州市', '2', '4511');
INSERT INTO `litemall_region` VALUES ('261', '20', '河池市', '2', '4512');
INSERT INTO `litemall_region` VALUES ('262', '20', '来宾市', '2', '4513');
INSERT INTO `litemall_region` VALUES ('263', '20', '崇左市', '2', '4514');
INSERT INTO `litemall_region` VALUES ('264', '21', '海口市', '2', '4601');
INSERT INTO `litemall_region` VALUES ('265', '21', '三亚市', '2', '4602');
INSERT INTO `litemall_region` VALUES ('266', '21', '三沙市', '2', '4603');
INSERT INTO `litemall_region` VALUES ('267', '21', '儋州市', '2', '4604');
INSERT INTO `litemall_region` VALUES ('268', '21', '省直辖县级行政区划', '2', '4690');
INSERT INTO `litemall_region` VALUES ('269', '22', '市辖区', '2', '5001');
INSERT INTO `litemall_region` VALUES ('270', '22', '县', '2', '5002');
INSERT INTO `litemall_region` VALUES ('271', '23', '成都市', '2', '5101');
INSERT INTO `litemall_region` VALUES ('272', '23', '自贡市', '2', '5103');
INSERT INTO `litemall_region` VALUES ('273', '23', '攀枝花市', '2', '5104');
INSERT INTO `litemall_region` VALUES ('274', '23', '泸州市', '2', '5105');
INSERT INTO `litemall_region` VALUES ('275', '23', '德阳市', '2', '5106');
INSERT INTO `litemall_region` VALUES ('276', '23', '绵阳市', '2', '5107');
INSERT INTO `litemall_region` VALUES ('277', '23', '广元市', '2', '5108');
INSERT INTO `litemall_region` VALUES ('278', '23', '遂宁市', '2', '5109');
INSERT INTO `litemall_region` VALUES ('279', '23', '内江市', '2', '5110');
INSERT INTO `litemall_region` VALUES ('280', '23', '乐山市', '2', '5111');
INSERT INTO `litemall_region` VALUES ('281', '23', '南充市', '2', '5113');
INSERT INTO `litemall_region` VALUES ('282', '23', '眉山市', '2', '5114');
INSERT INTO `litemall_region` VALUES ('283', '23', '宜宾市', '2', '5115');
INSERT INTO `litemall_region` VALUES ('284', '23', '广安市', '2', '5116');
INSERT INTO `litemall_region` VALUES ('285', '23', '达州市', '2', '5117');
INSERT INTO `litemall_region` VALUES ('286', '23', '雅安市', '2', '5118');
INSERT INTO `litemall_region` VALUES ('287', '23', '巴中市', '2', '5119');
INSERT INTO `litemall_region` VALUES ('288', '23', '资阳市', '2', '5120');
INSERT INTO `litemall_region` VALUES ('289', '23', '阿坝藏族羌族自治州', '2', '5132');
INSERT INTO `litemall_region` VALUES ('290', '23', '甘孜藏族自治州', '2', '5133');
INSERT INTO `litemall_region` VALUES ('291', '23', '凉山彝族自治州', '2', '5134');
INSERT INTO `litemall_region` VALUES ('292', '24', '贵阳市', '2', '5201');
INSERT INTO `litemall_region` VALUES ('293', '24', '六盘水市', '2', '5202');
INSERT INTO `litemall_region` VALUES ('294', '24', '遵义市', '2', '5203');
INSERT INTO `litemall_region` VALUES ('295', '24', '安顺市', '2', '5204');
INSERT INTO `litemall_region` VALUES ('296', '24', '毕节市', '2', '5205');
INSERT INTO `litemall_region` VALUES ('297', '24', '铜仁市', '2', '5206');
INSERT INTO `litemall_region` VALUES ('298', '24', '黔西南布依族苗族自治州', '2', '5223');
INSERT INTO `litemall_region` VALUES ('299', '24', '黔东南苗族侗族自治州', '2', '5226');
INSERT INTO `litemall_region` VALUES ('300', '24', '黔南布依族苗族自治州', '2', '5227');
INSERT INTO `litemall_region` VALUES ('301', '25', '昆明市', '2', '5301');
INSERT INTO `litemall_region` VALUES ('302', '25', '曲靖市', '2', '5303');
INSERT INTO `litemall_region` VALUES ('303', '25', '玉溪市', '2', '5304');
INSERT INTO `litemall_region` VALUES ('304', '25', '保山市', '2', '5305');
INSERT INTO `litemall_region` VALUES ('305', '25', '昭通市', '2', '5306');
INSERT INTO `litemall_region` VALUES ('306', '25', '丽江市', '2', '5307');
INSERT INTO `litemall_region` VALUES ('307', '25', '普洱市', '2', '5308');
INSERT INTO `litemall_region` VALUES ('308', '25', '临沧市', '2', '5309');
INSERT INTO `litemall_region` VALUES ('309', '25', '楚雄彝族自治州', '2', '5323');
INSERT INTO `litemall_region` VALUES ('310', '25', '红河哈尼族彝族自治州', '2', '5325');
INSERT INTO `litemall_region` VALUES ('311', '25', '文山壮族苗族自治州', '2', '5326');
INSERT INTO `litemall_region` VALUES ('312', '25', '西双版纳傣族自治州', '2', '5328');
INSERT INTO `litemall_region` VALUES ('313', '25', '大理白族自治州', '2', '5329');
INSERT INTO `litemall_region` VALUES ('314', '25', '德宏傣族景颇族自治州', '2', '5331');
INSERT INTO `litemall_region` VALUES ('315', '25', '怒江傈僳族自治州', '2', '5333');
INSERT INTO `litemall_region` VALUES ('316', '25', '迪庆藏族自治州', '2', '5334');
INSERT INTO `litemall_region` VALUES ('317', '26', '拉萨市', '2', '5401');
INSERT INTO `litemall_region` VALUES ('318', '26', '日喀则市', '2', '5402');
INSERT INTO `litemall_region` VALUES ('319', '26', '昌都市', '2', '5403');
INSERT INTO `litemall_region` VALUES ('320', '26', '林芝市', '2', '5404');
INSERT INTO `litemall_region` VALUES ('321', '26', '山南市', '2', '5405');
INSERT INTO `litemall_region` VALUES ('322', '26', '那曲地区', '2', '5424');
INSERT INTO `litemall_region` VALUES ('323', '26', '阿里地区', '2', '5425');
INSERT INTO `litemall_region` VALUES ('324', '27', '西安市', '2', '6101');
INSERT INTO `litemall_region` VALUES ('325', '27', '铜川市', '2', '6102');
INSERT INTO `litemall_region` VALUES ('326', '27', '宝鸡市', '2', '6103');
INSERT INTO `litemall_region` VALUES ('327', '27', '咸阳市', '2', '6104');
INSERT INTO `litemall_region` VALUES ('328', '27', '渭南市', '2', '6105');
INSERT INTO `litemall_region` VALUES ('329', '27', '延安市', '2', '6106');
INSERT INTO `litemall_region` VALUES ('330', '27', '汉中市', '2', '6107');
INSERT INTO `litemall_region` VALUES ('331', '27', '榆林市', '2', '6108');
INSERT INTO `litemall_region` VALUES ('332', '27', '安康市', '2', '6109');
INSERT INTO `litemall_region` VALUES ('333', '27', '商洛市', '2', '6110');
INSERT INTO `litemall_region` VALUES ('334', '28', '兰州市', '2', '6201');
INSERT INTO `litemall_region` VALUES ('335', '28', '嘉峪关市', '2', '6202');
INSERT INTO `litemall_region` VALUES ('336', '28', '金昌市', '2', '6203');
INSERT INTO `litemall_region` VALUES ('337', '28', '白银市', '2', '6204');
INSERT INTO `litemall_region` VALUES ('338', '28', '天水市', '2', '6205');
INSERT INTO `litemall_region` VALUES ('339', '28', '武威市', '2', '6206');
INSERT INTO `litemall_region` VALUES ('340', '28', '张掖市', '2', '6207');
INSERT INTO `litemall_region` VALUES ('341', '28', '平凉市', '2', '6208');
INSERT INTO `litemall_region` VALUES ('342', '28', '酒泉市', '2', '6209');
INSERT INTO `litemall_region` VALUES ('343', '28', '庆阳市', '2', '6210');
INSERT INTO `litemall_region` VALUES ('344', '28', '定西市', '2', '6211');
INSERT INTO `litemall_region` VALUES ('345', '28', '陇南市', '2', '6212');
INSERT INTO `litemall_region` VALUES ('346', '28', '临夏回族自治州', '2', '6229');
INSERT INTO `litemall_region` VALUES ('347', '28', '甘南藏族自治州', '2', '6230');
INSERT INTO `litemall_region` VALUES ('348', '29', '西宁市', '2', '6301');
INSERT INTO `litemall_region` VALUES ('349', '29', '海东市', '2', '6302');
INSERT INTO `litemall_region` VALUES ('350', '29', '海北藏族自治州', '2', '6322');
INSERT INTO `litemall_region` VALUES ('351', '29', '黄南藏族自治州', '2', '6323');
INSERT INTO `litemall_region` VALUES ('352', '29', '海南藏族自治州', '2', '6325');
INSERT INTO `litemall_region` VALUES ('353', '29', '果洛藏族自治州', '2', '6326');
INSERT INTO `litemall_region` VALUES ('354', '29', '玉树藏族自治州', '2', '6327');
INSERT INTO `litemall_region` VALUES ('355', '29', '海西蒙古族藏族自治州', '2', '6328');
INSERT INTO `litemall_region` VALUES ('356', '30', '银川市', '2', '6401');
INSERT INTO `litemall_region` VALUES ('357', '30', '石嘴山市', '2', '6402');
INSERT INTO `litemall_region` VALUES ('358', '30', '吴忠市', '2', '6403');
INSERT INTO `litemall_region` VALUES ('359', '30', '固原市', '2', '6404');
INSERT INTO `litemall_region` VALUES ('360', '30', '中卫市', '2', '6405');
INSERT INTO `litemall_region` VALUES ('361', '31', '乌鲁木齐市', '2', '6501');
INSERT INTO `litemall_region` VALUES ('362', '31', '克拉玛依市', '2', '6502');
INSERT INTO `litemall_region` VALUES ('363', '31', '吐鲁番市', '2', '6504');
INSERT INTO `litemall_region` VALUES ('364', '31', '哈密市', '2', '6505');
INSERT INTO `litemall_region` VALUES ('365', '31', '昌吉回族自治州', '2', '6523');
INSERT INTO `litemall_region` VALUES ('366', '31', '博尔塔拉蒙古自治州', '2', '6527');
INSERT INTO `litemall_region` VALUES ('367', '31', '巴音郭楞蒙古自治州', '2', '6528');
INSERT INTO `litemall_region` VALUES ('368', '31', '阿克苏地区', '2', '6529');
INSERT INTO `litemall_region` VALUES ('369', '31', '克孜勒苏柯尔克孜自治州', '2', '6530');
INSERT INTO `litemall_region` VALUES ('370', '31', '喀什地区', '2', '6531');
INSERT INTO `litemall_region` VALUES ('371', '31', '和田地区', '2', '6532');
INSERT INTO `litemall_region` VALUES ('372', '31', '伊犁哈萨克自治州', '2', '6540');
INSERT INTO `litemall_region` VALUES ('373', '31', '塔城地区', '2', '6542');
INSERT INTO `litemall_region` VALUES ('374', '31', '阿勒泰地区', '2', '6543');
INSERT INTO `litemall_region` VALUES ('375', '31', '自治区直辖县级行政区划', '2', '6590');
INSERT INTO `litemall_region` VALUES ('376', '32', '东城区', '3', '110101');
INSERT INTO `litemall_region` VALUES ('377', '32', '西城区', '3', '110102');
INSERT INTO `litemall_region` VALUES ('378', '32', '朝阳区', '3', '110105');
INSERT INTO `litemall_region` VALUES ('379', '32', '丰台区', '3', '110106');
INSERT INTO `litemall_region` VALUES ('380', '32', '石景山区', '3', '110107');
INSERT INTO `litemall_region` VALUES ('381', '32', '海淀区', '3', '110108');
INSERT INTO `litemall_region` VALUES ('382', '32', '门头沟区', '3', '110109');
INSERT INTO `litemall_region` VALUES ('383', '32', '房山区', '3', '110111');
INSERT INTO `litemall_region` VALUES ('384', '32', '通州区', '3', '110112');
INSERT INTO `litemall_region` VALUES ('385', '32', '顺义区', '3', '110113');
INSERT INTO `litemall_region` VALUES ('386', '32', '昌平区', '3', '110114');
INSERT INTO `litemall_region` VALUES ('387', '32', '大兴区', '3', '110115');
INSERT INTO `litemall_region` VALUES ('388', '32', '怀柔区', '3', '110116');
INSERT INTO `litemall_region` VALUES ('389', '32', '平谷区', '3', '110117');
INSERT INTO `litemall_region` VALUES ('390', '32', '密云区', '3', '110118');
INSERT INTO `litemall_region` VALUES ('391', '32', '延庆区', '3', '110119');
INSERT INTO `litemall_region` VALUES ('392', '33', '和平区', '3', '120101');
INSERT INTO `litemall_region` VALUES ('393', '33', '河东区', '3', '120102');
INSERT INTO `litemall_region` VALUES ('394', '33', '河西区', '3', '120103');
INSERT INTO `litemall_region` VALUES ('395', '33', '南开区', '3', '120104');
INSERT INTO `litemall_region` VALUES ('396', '33', '河北区', '3', '120105');
INSERT INTO `litemall_region` VALUES ('397', '33', '红桥区', '3', '120106');
INSERT INTO `litemall_region` VALUES ('398', '33', '东丽区', '3', '120110');
INSERT INTO `litemall_region` VALUES ('399', '33', '西青区', '3', '120111');
INSERT INTO `litemall_region` VALUES ('400', '33', '津南区', '3', '120112');
INSERT INTO `litemall_region` VALUES ('401', '33', '北辰区', '3', '120113');
INSERT INTO `litemall_region` VALUES ('402', '33', '武清区', '3', '120114');
INSERT INTO `litemall_region` VALUES ('403', '33', '宝坻区', '3', '120115');
INSERT INTO `litemall_region` VALUES ('404', '33', '滨海新区', '3', '120116');
INSERT INTO `litemall_region` VALUES ('405', '33', '宁河区', '3', '120117');
INSERT INTO `litemall_region` VALUES ('406', '33', '静海区', '3', '120118');
INSERT INTO `litemall_region` VALUES ('407', '33', '蓟州区', '3', '120119');
INSERT INTO `litemall_region` VALUES ('408', '34', '长安区', '3', '130102');
INSERT INTO `litemall_region` VALUES ('409', '34', '桥西区', '3', '130104');
INSERT INTO `litemall_region` VALUES ('410', '34', '新华区', '3', '130105');
INSERT INTO `litemall_region` VALUES ('411', '34', '井陉矿区', '3', '130107');
INSERT INTO `litemall_region` VALUES ('412', '34', '裕华区', '3', '130108');
INSERT INTO `litemall_region` VALUES ('413', '34', '藁城区', '3', '130109');
INSERT INTO `litemall_region` VALUES ('414', '34', '鹿泉区', '3', '130110');
INSERT INTO `litemall_region` VALUES ('415', '34', '栾城区', '3', '130111');
INSERT INTO `litemall_region` VALUES ('416', '34', '井陉县', '3', '130121');
INSERT INTO `litemall_region` VALUES ('417', '34', '正定县', '3', '130123');
INSERT INTO `litemall_region` VALUES ('418', '34', '行唐县', '3', '130125');
INSERT INTO `litemall_region` VALUES ('419', '34', '灵寿县', '3', '130126');
INSERT INTO `litemall_region` VALUES ('420', '34', '高邑县', '3', '130127');
INSERT INTO `litemall_region` VALUES ('421', '34', '深泽县', '3', '130128');
INSERT INTO `litemall_region` VALUES ('422', '34', '赞皇县', '3', '130129');
INSERT INTO `litemall_region` VALUES ('423', '34', '无极县', '3', '130130');
INSERT INTO `litemall_region` VALUES ('424', '34', '平山县', '3', '130131');
INSERT INTO `litemall_region` VALUES ('425', '34', '元氏县', '3', '130132');
INSERT INTO `litemall_region` VALUES ('426', '34', '赵县', '3', '130133');
INSERT INTO `litemall_region` VALUES ('427', '34', '晋州市', '3', '130183');
INSERT INTO `litemall_region` VALUES ('428', '34', '新乐市', '3', '130184');
INSERT INTO `litemall_region` VALUES ('429', '35', '路南区', '3', '130202');
INSERT INTO `litemall_region` VALUES ('430', '35', '路北区', '3', '130203');
INSERT INTO `litemall_region` VALUES ('431', '35', '古冶区', '3', '130204');
INSERT INTO `litemall_region` VALUES ('432', '35', '开平区', '3', '130205');
INSERT INTO `litemall_region` VALUES ('433', '35', '丰南区', '3', '130207');
INSERT INTO `litemall_region` VALUES ('434', '35', '丰润区', '3', '130208');
INSERT INTO `litemall_region` VALUES ('435', '35', '曹妃甸区', '3', '130209');
INSERT INTO `litemall_region` VALUES ('436', '35', '滦县', '3', '130223');
INSERT INTO `litemall_region` VALUES ('437', '35', '滦南县', '3', '130224');
INSERT INTO `litemall_region` VALUES ('438', '35', '乐亭县', '3', '130225');
INSERT INTO `litemall_region` VALUES ('439', '35', '迁西县', '3', '130227');
INSERT INTO `litemall_region` VALUES ('440', '35', '玉田县', '3', '130229');
INSERT INTO `litemall_region` VALUES ('441', '35', '遵化市', '3', '130281');
INSERT INTO `litemall_region` VALUES ('442', '35', '迁安市', '3', '130283');
INSERT INTO `litemall_region` VALUES ('443', '36', '海港区', '3', '130302');
INSERT INTO `litemall_region` VALUES ('444', '36', '山海关区', '3', '130303');
INSERT INTO `litemall_region` VALUES ('445', '36', '北戴河区', '3', '130304');
INSERT INTO `litemall_region` VALUES ('446', '36', '抚宁区', '3', '130306');
INSERT INTO `litemall_region` VALUES ('447', '36', '青龙满族自治县', '3', '130321');
INSERT INTO `litemall_region` VALUES ('448', '36', '昌黎县', '3', '130322');
INSERT INTO `litemall_region` VALUES ('449', '36', '卢龙县', '3', '130324');
INSERT INTO `litemall_region` VALUES ('450', '37', '邯山区', '3', '130402');
INSERT INTO `litemall_region` VALUES ('451', '37', '丛台区', '3', '130403');
INSERT INTO `litemall_region` VALUES ('452', '37', '复兴区', '3', '130404');
INSERT INTO `litemall_region` VALUES ('453', '37', '峰峰矿区', '3', '130406');
INSERT INTO `litemall_region` VALUES ('454', '37', '邯郸县', '3', '130421');
INSERT INTO `litemall_region` VALUES ('455', '37', '临漳县', '3', '130423');
INSERT INTO `litemall_region` VALUES ('456', '37', '成安县', '3', '130424');
INSERT INTO `litemall_region` VALUES ('457', '37', '大名县', '3', '130425');
INSERT INTO `litemall_region` VALUES ('458', '37', '涉县', '3', '130426');
INSERT INTO `litemall_region` VALUES ('459', '37', '磁县', '3', '130427');
INSERT INTO `litemall_region` VALUES ('460', '37', '肥乡县', '3', '130428');
INSERT INTO `litemall_region` VALUES ('461', '37', '永年县', '3', '130429');
INSERT INTO `litemall_region` VALUES ('462', '37', '邱县', '3', '130430');
INSERT INTO `litemall_region` VALUES ('463', '37', '鸡泽县', '3', '130431');
INSERT INTO `litemall_region` VALUES ('464', '37', '广平县', '3', '130432');
INSERT INTO `litemall_region` VALUES ('465', '37', '馆陶县', '3', '130433');
INSERT INTO `litemall_region` VALUES ('466', '37', '魏县', '3', '130434');
INSERT INTO `litemall_region` VALUES ('467', '37', '曲周县', '3', '130435');
INSERT INTO `litemall_region` VALUES ('468', '37', '武安市', '3', '130481');
INSERT INTO `litemall_region` VALUES ('469', '38', '桥东区', '3', '130502');
INSERT INTO `litemall_region` VALUES ('470', '38', '桥西区', '3', '130503');
INSERT INTO `litemall_region` VALUES ('471', '38', '邢台县', '3', '130521');
INSERT INTO `litemall_region` VALUES ('472', '38', '临城县', '3', '130522');
INSERT INTO `litemall_region` VALUES ('473', '38', '内丘县', '3', '130523');
INSERT INTO `litemall_region` VALUES ('474', '38', '柏乡县', '3', '130524');
INSERT INTO `litemall_region` VALUES ('475', '38', '隆尧县', '3', '130525');
INSERT INTO `litemall_region` VALUES ('476', '38', '任县', '3', '130526');
INSERT INTO `litemall_region` VALUES ('477', '38', '南和县', '3', '130527');
INSERT INTO `litemall_region` VALUES ('478', '38', '宁晋县', '3', '130528');
INSERT INTO `litemall_region` VALUES ('479', '38', '巨鹿县', '3', '130529');
INSERT INTO `litemall_region` VALUES ('480', '38', '新河县', '3', '130530');
INSERT INTO `litemall_region` VALUES ('481', '38', '广宗县', '3', '130531');
INSERT INTO `litemall_region` VALUES ('482', '38', '平乡县', '3', '130532');
INSERT INTO `litemall_region` VALUES ('483', '38', '威县', '3', '130533');
INSERT INTO `litemall_region` VALUES ('484', '38', '清河县', '3', '130534');
INSERT INTO `litemall_region` VALUES ('485', '38', '临西县', '3', '130535');
INSERT INTO `litemall_region` VALUES ('486', '38', '南宫市', '3', '130581');
INSERT INTO `litemall_region` VALUES ('487', '38', '沙河市', '3', '130582');
INSERT INTO `litemall_region` VALUES ('488', '39', '竞秀区', '3', '130602');
INSERT INTO `litemall_region` VALUES ('489', '39', '莲池区', '3', '130606');
INSERT INTO `litemall_region` VALUES ('490', '39', '满城区', '3', '130607');
INSERT INTO `litemall_region` VALUES ('491', '39', '清苑区', '3', '130608');
INSERT INTO `litemall_region` VALUES ('492', '39', '徐水区', '3', '130609');
INSERT INTO `litemall_region` VALUES ('493', '39', '涞水县', '3', '130623');
INSERT INTO `litemall_region` VALUES ('494', '39', '阜平县', '3', '130624');
INSERT INTO `litemall_region` VALUES ('495', '39', '定兴县', '3', '130626');
INSERT INTO `litemall_region` VALUES ('496', '39', '唐县', '3', '130627');
INSERT INTO `litemall_region` VALUES ('497', '39', '高阳县', '3', '130628');
INSERT INTO `litemall_region` VALUES ('498', '39', '容城县', '3', '130629');
INSERT INTO `litemall_region` VALUES ('499', '39', '涞源县', '3', '130630');
INSERT INTO `litemall_region` VALUES ('500', '39', '望都县', '3', '130631');
INSERT INTO `litemall_region` VALUES ('501', '39', '安新县', '3', '130632');
INSERT INTO `litemall_region` VALUES ('502', '39', '易县', '3', '130633');
INSERT INTO `litemall_region` VALUES ('503', '39', '曲阳县', '3', '130634');
INSERT INTO `litemall_region` VALUES ('504', '39', '蠡县', '3', '130635');
INSERT INTO `litemall_region` VALUES ('505', '39', '顺平县', '3', '130636');
INSERT INTO `litemall_region` VALUES ('506', '39', '博野县', '3', '130637');
INSERT INTO `litemall_region` VALUES ('507', '39', '雄县', '3', '130638');
INSERT INTO `litemall_region` VALUES ('508', '39', '涿州市', '3', '130681');
INSERT INTO `litemall_region` VALUES ('509', '39', '安国市', '3', '130683');
INSERT INTO `litemall_region` VALUES ('510', '39', '高碑店市', '3', '130684');
INSERT INTO `litemall_region` VALUES ('511', '40', '桥东区', '3', '130702');
INSERT INTO `litemall_region` VALUES ('512', '40', '桥西区', '3', '130703');
INSERT INTO `litemall_region` VALUES ('513', '40', '宣化区', '3', '130705');
INSERT INTO `litemall_region` VALUES ('514', '40', '下花园区', '3', '130706');
INSERT INTO `litemall_region` VALUES ('515', '40', '万全区', '3', '130708');
INSERT INTO `litemall_region` VALUES ('516', '40', '崇礼区', '3', '130709');
INSERT INTO `litemall_region` VALUES ('517', '40', '张北县', '3', '130722');
INSERT INTO `litemall_region` VALUES ('518', '40', '康保县', '3', '130723');
INSERT INTO `litemall_region` VALUES ('519', '40', '沽源县', '3', '130724');
INSERT INTO `litemall_region` VALUES ('520', '40', '尚义县', '3', '130725');
INSERT INTO `litemall_region` VALUES ('521', '40', '蔚县', '3', '130726');
INSERT INTO `litemall_region` VALUES ('522', '40', '阳原县', '3', '130727');
INSERT INTO `litemall_region` VALUES ('523', '40', '怀安县', '3', '130728');
INSERT INTO `litemall_region` VALUES ('524', '40', '怀来县', '3', '130730');
INSERT INTO `litemall_region` VALUES ('525', '40', '涿鹿县', '3', '130731');
INSERT INTO `litemall_region` VALUES ('526', '40', '赤城县', '3', '130732');
INSERT INTO `litemall_region` VALUES ('527', '41', '双桥区', '3', '130802');
INSERT INTO `litemall_region` VALUES ('528', '41', '双滦区', '3', '130803');
INSERT INTO `litemall_region` VALUES ('529', '41', '鹰手营子矿区', '3', '130804');
INSERT INTO `litemall_region` VALUES ('530', '41', '承德县', '3', '130821');
INSERT INTO `litemall_region` VALUES ('531', '41', '兴隆县', '3', '130822');
INSERT INTO `litemall_region` VALUES ('532', '41', '平泉县', '3', '130823');
INSERT INTO `litemall_region` VALUES ('533', '41', '滦平县', '3', '130824');
INSERT INTO `litemall_region` VALUES ('534', '41', '隆化县', '3', '130825');
INSERT INTO `litemall_region` VALUES ('535', '41', '丰宁满族自治县', '3', '130826');
INSERT INTO `litemall_region` VALUES ('536', '41', '宽城满族自治县', '3', '130827');
INSERT INTO `litemall_region` VALUES ('537', '41', '围场满族蒙古族自治县', '3', '130828');
INSERT INTO `litemall_region` VALUES ('538', '42', '新华区', '3', '130902');
INSERT INTO `litemall_region` VALUES ('539', '42', '运河区', '3', '130903');
INSERT INTO `litemall_region` VALUES ('540', '42', '沧县', '3', '130921');
INSERT INTO `litemall_region` VALUES ('541', '42', '青县', '3', '130922');
INSERT INTO `litemall_region` VALUES ('542', '42', '东光县', '3', '130923');
INSERT INTO `litemall_region` VALUES ('543', '42', '海兴县', '3', '130924');
INSERT INTO `litemall_region` VALUES ('544', '42', '盐山县', '3', '130925');
INSERT INTO `litemall_region` VALUES ('545', '42', '肃宁县', '3', '130926');
INSERT INTO `litemall_region` VALUES ('546', '42', '南皮县', '3', '130927');
INSERT INTO `litemall_region` VALUES ('547', '42', '吴桥县', '3', '130928');
INSERT INTO `litemall_region` VALUES ('548', '42', '献县', '3', '130929');
INSERT INTO `litemall_region` VALUES ('549', '42', '孟村回族自治县', '3', '130930');
INSERT INTO `litemall_region` VALUES ('550', '42', '泊头市', '3', '130981');
INSERT INTO `litemall_region` VALUES ('551', '42', '任丘市', '3', '130982');
INSERT INTO `litemall_region` VALUES ('552', '42', '黄骅市', '3', '130983');
INSERT INTO `litemall_region` VALUES ('553', '42', '河间市', '3', '130984');
INSERT INTO `litemall_region` VALUES ('554', '43', '安次区', '3', '131002');
INSERT INTO `litemall_region` VALUES ('555', '43', '广阳区', '3', '131003');
INSERT INTO `litemall_region` VALUES ('556', '43', '固安县', '3', '131022');
INSERT INTO `litemall_region` VALUES ('557', '43', '永清县', '3', '131023');
INSERT INTO `litemall_region` VALUES ('558', '43', '香河县', '3', '131024');
INSERT INTO `litemall_region` VALUES ('559', '43', '大城县', '3', '131025');
INSERT INTO `litemall_region` VALUES ('560', '43', '文安县', '3', '131026');
INSERT INTO `litemall_region` VALUES ('561', '43', '大厂回族自治县', '3', '131028');
INSERT INTO `litemall_region` VALUES ('562', '43', '霸州市', '3', '131081');
INSERT INTO `litemall_region` VALUES ('563', '43', '三河市', '3', '131082');
INSERT INTO `litemall_region` VALUES ('564', '44', '桃城区', '3', '131102');
INSERT INTO `litemall_region` VALUES ('565', '44', '冀州区', '3', '131103');
INSERT INTO `litemall_region` VALUES ('566', '44', '枣强县', '3', '131121');
INSERT INTO `litemall_region` VALUES ('567', '44', '武邑县', '3', '131122');
INSERT INTO `litemall_region` VALUES ('568', '44', '武强县', '3', '131123');
INSERT INTO `litemall_region` VALUES ('569', '44', '饶阳县', '3', '131124');
INSERT INTO `litemall_region` VALUES ('570', '44', '安平县', '3', '131125');
INSERT INTO `litemall_region` VALUES ('571', '44', '故城县', '3', '131126');
INSERT INTO `litemall_region` VALUES ('572', '44', '景县', '3', '131127');
INSERT INTO `litemall_region` VALUES ('573', '44', '阜城县', '3', '131128');
INSERT INTO `litemall_region` VALUES ('574', '44', '深州市', '3', '131182');
INSERT INTO `litemall_region` VALUES ('575', '45', '定州市', '3', '139001');
INSERT INTO `litemall_region` VALUES ('576', '45', '辛集市', '3', '139002');
INSERT INTO `litemall_region` VALUES ('577', '46', '小店区', '3', '140105');
INSERT INTO `litemall_region` VALUES ('578', '46', '迎泽区', '3', '140106');
INSERT INTO `litemall_region` VALUES ('579', '46', '杏花岭区', '3', '140107');
INSERT INTO `litemall_region` VALUES ('580', '46', '尖草坪区', '3', '140108');
INSERT INTO `litemall_region` VALUES ('581', '46', '万柏林区', '3', '140109');
INSERT INTO `litemall_region` VALUES ('582', '46', '晋源区', '3', '140110');
INSERT INTO `litemall_region` VALUES ('583', '46', '清徐县', '3', '140121');
INSERT INTO `litemall_region` VALUES ('584', '46', '阳曲县', '3', '140122');
INSERT INTO `litemall_region` VALUES ('585', '46', '娄烦县', '3', '140123');
INSERT INTO `litemall_region` VALUES ('586', '46', '古交市', '3', '140181');
INSERT INTO `litemall_region` VALUES ('587', '47', '城区', '3', '140202');
INSERT INTO `litemall_region` VALUES ('588', '47', '矿区', '3', '140203');
INSERT INTO `litemall_region` VALUES ('589', '47', '南郊区', '3', '140211');
INSERT INTO `litemall_region` VALUES ('590', '47', '新荣区', '3', '140212');
INSERT INTO `litemall_region` VALUES ('591', '47', '阳高县', '3', '140221');
INSERT INTO `litemall_region` VALUES ('592', '47', '天镇县', '3', '140222');
INSERT INTO `litemall_region` VALUES ('593', '47', '广灵县', '3', '140223');
INSERT INTO `litemall_region` VALUES ('594', '47', '灵丘县', '3', '140224');
INSERT INTO `litemall_region` VALUES ('595', '47', '浑源县', '3', '140225');
INSERT INTO `litemall_region` VALUES ('596', '47', '左云县', '3', '140226');
INSERT INTO `litemall_region` VALUES ('597', '47', '大同县', '3', '140227');
INSERT INTO `litemall_region` VALUES ('598', '48', '城区', '3', '140302');
INSERT INTO `litemall_region` VALUES ('599', '48', '矿区', '3', '140303');
INSERT INTO `litemall_region` VALUES ('600', '48', '郊区', '3', '140311');
INSERT INTO `litemall_region` VALUES ('601', '48', '平定县', '3', '140321');
INSERT INTO `litemall_region` VALUES ('602', '48', '盂县', '3', '140322');
INSERT INTO `litemall_region` VALUES ('603', '49', '城区', '3', '140402');
INSERT INTO `litemall_region` VALUES ('604', '49', '郊区', '3', '140411');
INSERT INTO `litemall_region` VALUES ('605', '49', '长治县', '3', '140421');
INSERT INTO `litemall_region` VALUES ('606', '49', '襄垣县', '3', '140423');
INSERT INTO `litemall_region` VALUES ('607', '49', '屯留县', '3', '140424');
INSERT INTO `litemall_region` VALUES ('608', '49', '平顺县', '3', '140425');
INSERT INTO `litemall_region` VALUES ('609', '49', '黎城县', '3', '140426');
INSERT INTO `litemall_region` VALUES ('610', '49', '壶关县', '3', '140427');
INSERT INTO `litemall_region` VALUES ('611', '49', '长子县', '3', '140428');
INSERT INTO `litemall_region` VALUES ('612', '49', '武乡县', '3', '140429');
INSERT INTO `litemall_region` VALUES ('613', '49', '沁县', '3', '140430');
INSERT INTO `litemall_region` VALUES ('614', '49', '沁源县', '3', '140431');
INSERT INTO `litemall_region` VALUES ('615', '49', '潞城市', '3', '140481');
INSERT INTO `litemall_region` VALUES ('616', '50', '城区', '3', '140502');
INSERT INTO `litemall_region` VALUES ('617', '50', '沁水县', '3', '140521');
INSERT INTO `litemall_region` VALUES ('618', '50', '阳城县', '3', '140522');
INSERT INTO `litemall_region` VALUES ('619', '50', '陵川县', '3', '140524');
INSERT INTO `litemall_region` VALUES ('620', '50', '泽州县', '3', '140525');
INSERT INTO `litemall_region` VALUES ('621', '50', '高平市', '3', '140581');
INSERT INTO `litemall_region` VALUES ('622', '51', '朔城区', '3', '140602');
INSERT INTO `litemall_region` VALUES ('623', '51', '平鲁区', '3', '140603');
INSERT INTO `litemall_region` VALUES ('624', '51', '山阴县', '3', '140621');
INSERT INTO `litemall_region` VALUES ('625', '51', '应县', '3', '140622');
INSERT INTO `litemall_region` VALUES ('626', '51', '右玉县', '3', '140623');
INSERT INTO `litemall_region` VALUES ('627', '51', '怀仁县', '3', '140624');
INSERT INTO `litemall_region` VALUES ('628', '52', '榆次区', '3', '140702');
INSERT INTO `litemall_region` VALUES ('629', '52', '榆社县', '3', '140721');
INSERT INTO `litemall_region` VALUES ('630', '52', '左权县', '3', '140722');
INSERT INTO `litemall_region` VALUES ('631', '52', '和顺县', '3', '140723');
INSERT INTO `litemall_region` VALUES ('632', '52', '昔阳县', '3', '140724');
INSERT INTO `litemall_region` VALUES ('633', '52', '寿阳县', '3', '140725');
INSERT INTO `litemall_region` VALUES ('634', '52', '太谷县', '3', '140726');
INSERT INTO `litemall_region` VALUES ('635', '52', '祁县', '3', '140727');
INSERT INTO `litemall_region` VALUES ('636', '52', '平遥县', '3', '140728');
INSERT INTO `litemall_region` VALUES ('637', '52', '灵石县', '3', '140729');
INSERT INTO `litemall_region` VALUES ('638', '52', '介休市', '3', '140781');
INSERT INTO `litemall_region` VALUES ('639', '53', '盐湖区', '3', '140802');
INSERT INTO `litemall_region` VALUES ('640', '53', '临猗县', '3', '140821');
INSERT INTO `litemall_region` VALUES ('641', '53', '万荣县', '3', '140822');
INSERT INTO `litemall_region` VALUES ('642', '53', '闻喜县', '3', '140823');
INSERT INTO `litemall_region` VALUES ('643', '53', '稷山县', '3', '140824');
INSERT INTO `litemall_region` VALUES ('644', '53', '新绛县', '3', '140825');
INSERT INTO `litemall_region` VALUES ('645', '53', '绛县', '3', '140826');
INSERT INTO `litemall_region` VALUES ('646', '53', '垣曲县', '3', '140827');
INSERT INTO `litemall_region` VALUES ('647', '53', '夏县', '3', '140828');
INSERT INTO `litemall_region` VALUES ('648', '53', '平陆县', '3', '140829');
INSERT INTO `litemall_region` VALUES ('649', '53', '芮城县', '3', '140830');
INSERT INTO `litemall_region` VALUES ('650', '53', '永济市', '3', '140881');
INSERT INTO `litemall_region` VALUES ('651', '53', '河津市', '3', '140882');
INSERT INTO `litemall_region` VALUES ('652', '54', '忻府区', '3', '140902');
INSERT INTO `litemall_region` VALUES ('653', '54', '定襄县', '3', '140921');
INSERT INTO `litemall_region` VALUES ('654', '54', '五台县', '3', '140922');
INSERT INTO `litemall_region` VALUES ('655', '54', '代县', '3', '140923');
INSERT INTO `litemall_region` VALUES ('656', '54', '繁峙县', '3', '140924');
INSERT INTO `litemall_region` VALUES ('657', '54', '宁武县', '3', '140925');
INSERT INTO `litemall_region` VALUES ('658', '54', '静乐县', '3', '140926');
INSERT INTO `litemall_region` VALUES ('659', '54', '神池县', '3', '140927');
INSERT INTO `litemall_region` VALUES ('660', '54', '五寨县', '3', '140928');
INSERT INTO `litemall_region` VALUES ('661', '54', '岢岚县', '3', '140929');
INSERT INTO `litemall_region` VALUES ('662', '54', '河曲县', '3', '140930');
INSERT INTO `litemall_region` VALUES ('663', '54', '保德县', '3', '140931');
INSERT INTO `litemall_region` VALUES ('664', '54', '偏关县', '3', '140932');
INSERT INTO `litemall_region` VALUES ('665', '54', '原平市', '3', '140981');
INSERT INTO `litemall_region` VALUES ('666', '55', '尧都区', '3', '141002');
INSERT INTO `litemall_region` VALUES ('667', '55', '曲沃县', '3', '141021');
INSERT INTO `litemall_region` VALUES ('668', '55', '翼城县', '3', '141022');
INSERT INTO `litemall_region` VALUES ('669', '55', '襄汾县', '3', '141023');
INSERT INTO `litemall_region` VALUES ('670', '55', '洪洞县', '3', '141024');
INSERT INTO `litemall_region` VALUES ('671', '55', '古县', '3', '141025');
INSERT INTO `litemall_region` VALUES ('672', '55', '安泽县', '3', '141026');
INSERT INTO `litemall_region` VALUES ('673', '55', '浮山县', '3', '141027');
INSERT INTO `litemall_region` VALUES ('674', '55', '吉县', '3', '141028');
INSERT INTO `litemall_region` VALUES ('675', '55', '乡宁县', '3', '141029');
INSERT INTO `litemall_region` VALUES ('676', '55', '大宁县', '3', '141030');
INSERT INTO `litemall_region` VALUES ('677', '55', '隰县', '3', '141031');
INSERT INTO `litemall_region` VALUES ('678', '55', '永和县', '3', '141032');
INSERT INTO `litemall_region` VALUES ('679', '55', '蒲县', '3', '141033');
INSERT INTO `litemall_region` VALUES ('680', '55', '汾西县', '3', '141034');
INSERT INTO `litemall_region` VALUES ('681', '55', '侯马市', '3', '141081');
INSERT INTO `litemall_region` VALUES ('682', '55', '霍州市', '3', '141082');
INSERT INTO `litemall_region` VALUES ('683', '56', '离石区', '3', '141102');
INSERT INTO `litemall_region` VALUES ('684', '56', '文水县', '3', '141121');
INSERT INTO `litemall_region` VALUES ('685', '56', '交城县', '3', '141122');
INSERT INTO `litemall_region` VALUES ('686', '56', '兴县', '3', '141123');
INSERT INTO `litemall_region` VALUES ('687', '56', '临县', '3', '141124');
INSERT INTO `litemall_region` VALUES ('688', '56', '柳林县', '3', '141125');
INSERT INTO `litemall_region` VALUES ('689', '56', '石楼县', '3', '141126');
INSERT INTO `litemall_region` VALUES ('690', '56', '岚县', '3', '141127');
INSERT INTO `litemall_region` VALUES ('691', '56', '方山县', '3', '141128');
INSERT INTO `litemall_region` VALUES ('692', '56', '中阳县', '3', '141129');
INSERT INTO `litemall_region` VALUES ('693', '56', '交口县', '3', '141130');
INSERT INTO `litemall_region` VALUES ('694', '56', '孝义市', '3', '141181');
INSERT INTO `litemall_region` VALUES ('695', '56', '汾阳市', '3', '141182');
INSERT INTO `litemall_region` VALUES ('696', '57', '新城区', '3', '150102');
INSERT INTO `litemall_region` VALUES ('697', '57', '回民区', '3', '150103');
INSERT INTO `litemall_region` VALUES ('698', '57', '玉泉区', '3', '150104');
INSERT INTO `litemall_region` VALUES ('699', '57', '赛罕区', '3', '150105');
INSERT INTO `litemall_region` VALUES ('700', '57', '土默特左旗', '3', '150121');
INSERT INTO `litemall_region` VALUES ('701', '57', '托克托县', '3', '150122');
INSERT INTO `litemall_region` VALUES ('702', '57', '和林格尔县', '3', '150123');
INSERT INTO `litemall_region` VALUES ('703', '57', '清水河县', '3', '150124');
INSERT INTO `litemall_region` VALUES ('704', '57', '武川县', '3', '150125');
INSERT INTO `litemall_region` VALUES ('705', '58', '东河区', '3', '150202');
INSERT INTO `litemall_region` VALUES ('706', '58', '昆都仑区', '3', '150203');
INSERT INTO `litemall_region` VALUES ('707', '58', '青山区', '3', '150204');
INSERT INTO `litemall_region` VALUES ('708', '58', '石拐区', '3', '150205');
INSERT INTO `litemall_region` VALUES ('709', '58', '白云鄂博矿区', '3', '150206');
INSERT INTO `litemall_region` VALUES ('710', '58', '九原区', '3', '150207');
INSERT INTO `litemall_region` VALUES ('711', '58', '土默特右旗', '3', '150221');
INSERT INTO `litemall_region` VALUES ('712', '58', '固阳县', '3', '150222');
INSERT INTO `litemall_region` VALUES ('713', '58', '达尔罕茂明安联合旗', '3', '150223');
INSERT INTO `litemall_region` VALUES ('714', '59', '海勃湾区', '3', '150302');
INSERT INTO `litemall_region` VALUES ('715', '59', '海南区', '3', '150303');
INSERT INTO `litemall_region` VALUES ('716', '59', '乌达区', '3', '150304');
INSERT INTO `litemall_region` VALUES ('717', '60', '红山区', '3', '150402');
INSERT INTO `litemall_region` VALUES ('718', '60', '元宝山区', '3', '150403');
INSERT INTO `litemall_region` VALUES ('719', '60', '松山区', '3', '150404');
INSERT INTO `litemall_region` VALUES ('720', '60', '阿鲁科尔沁旗', '3', '150421');
INSERT INTO `litemall_region` VALUES ('721', '60', '巴林左旗', '3', '150422');
INSERT INTO `litemall_region` VALUES ('722', '60', '巴林右旗', '3', '150423');
INSERT INTO `litemall_region` VALUES ('723', '60', '林西县', '3', '150424');
INSERT INTO `litemall_region` VALUES ('724', '60', '克什克腾旗', '3', '150425');
INSERT INTO `litemall_region` VALUES ('725', '60', '翁牛特旗', '3', '150426');
INSERT INTO `litemall_region` VALUES ('726', '60', '喀喇沁旗', '3', '150428');
INSERT INTO `litemall_region` VALUES ('727', '60', '宁城县', '3', '150429');
INSERT INTO `litemall_region` VALUES ('728', '60', '敖汉旗', '3', '150430');
INSERT INTO `litemall_region` VALUES ('729', '61', '科尔沁区', '3', '150502');
INSERT INTO `litemall_region` VALUES ('730', '61', '科尔沁左翼中旗', '3', '150521');
INSERT INTO `litemall_region` VALUES ('731', '61', '科尔沁左翼后旗', '3', '150522');
INSERT INTO `litemall_region` VALUES ('732', '61', '开鲁县', '3', '150523');
INSERT INTO `litemall_region` VALUES ('733', '61', '库伦旗', '3', '150524');
INSERT INTO `litemall_region` VALUES ('734', '61', '奈曼旗', '3', '150525');
INSERT INTO `litemall_region` VALUES ('735', '61', '扎鲁特旗', '3', '150526');
INSERT INTO `litemall_region` VALUES ('736', '61', '霍林郭勒市', '3', '150581');
INSERT INTO `litemall_region` VALUES ('737', '62', '东胜区', '3', '150602');
INSERT INTO `litemall_region` VALUES ('738', '62', '康巴什区', '3', '150603');
INSERT INTO `litemall_region` VALUES ('739', '62', '达拉特旗', '3', '150621');
INSERT INTO `litemall_region` VALUES ('740', '62', '准格尔旗', '3', '150622');
INSERT INTO `litemall_region` VALUES ('741', '62', '鄂托克前旗', '3', '150623');
INSERT INTO `litemall_region` VALUES ('742', '62', '鄂托克旗', '3', '150624');
INSERT INTO `litemall_region` VALUES ('743', '62', '杭锦旗', '3', '150625');
INSERT INTO `litemall_region` VALUES ('744', '62', '乌审旗', '3', '150626');
INSERT INTO `litemall_region` VALUES ('745', '62', '伊金霍洛旗', '3', '150627');
INSERT INTO `litemall_region` VALUES ('746', '63', '海拉尔区', '3', '150702');
INSERT INTO `litemall_region` VALUES ('747', '63', '扎赉诺尔区', '3', '150703');
INSERT INTO `litemall_region` VALUES ('748', '63', '阿荣旗', '3', '150721');
INSERT INTO `litemall_region` VALUES ('749', '63', '莫力达瓦达斡尔族自治旗', '3', '150722');
INSERT INTO `litemall_region` VALUES ('750', '63', '鄂伦春自治旗', '3', '150723');
INSERT INTO `litemall_region` VALUES ('751', '63', '鄂温克族自治旗', '3', '150724');
INSERT INTO `litemall_region` VALUES ('752', '63', '陈巴尔虎旗', '3', '150725');
INSERT INTO `litemall_region` VALUES ('753', '63', '新巴尔虎左旗', '3', '150726');
INSERT INTO `litemall_region` VALUES ('754', '63', '新巴尔虎右旗', '3', '150727');
INSERT INTO `litemall_region` VALUES ('755', '63', '满洲里市', '3', '150781');
INSERT INTO `litemall_region` VALUES ('756', '63', '牙克石市', '3', '150782');
INSERT INTO `litemall_region` VALUES ('757', '63', '扎兰屯市', '3', '150783');
INSERT INTO `litemall_region` VALUES ('758', '63', '额尔古纳市', '3', '150784');
INSERT INTO `litemall_region` VALUES ('759', '63', '根河市', '3', '150785');
INSERT INTO `litemall_region` VALUES ('760', '64', '临河区', '3', '150802');
INSERT INTO `litemall_region` VALUES ('761', '64', '五原县', '3', '150821');
INSERT INTO `litemall_region` VALUES ('762', '64', '磴口县', '3', '150822');
INSERT INTO `litemall_region` VALUES ('763', '64', '乌拉特前旗', '3', '150823');
INSERT INTO `litemall_region` VALUES ('764', '64', '乌拉特中旗', '3', '150824');
INSERT INTO `litemall_region` VALUES ('765', '64', '乌拉特后旗', '3', '150825');
INSERT INTO `litemall_region` VALUES ('766', '64', '杭锦后旗', '3', '150826');
INSERT INTO `litemall_region` VALUES ('767', '65', '集宁区', '3', '150902');
INSERT INTO `litemall_region` VALUES ('768', '65', '卓资县', '3', '150921');
INSERT INTO `litemall_region` VALUES ('769', '65', '化德县', '3', '150922');
INSERT INTO `litemall_region` VALUES ('770', '65', '商都县', '3', '150923');
INSERT INTO `litemall_region` VALUES ('771', '65', '兴和县', '3', '150924');
INSERT INTO `litemall_region` VALUES ('772', '65', '凉城县', '3', '150925');
INSERT INTO `litemall_region` VALUES ('773', '65', '察哈尔右翼前旗', '3', '150926');
INSERT INTO `litemall_region` VALUES ('774', '65', '察哈尔右翼中旗', '3', '150927');
INSERT INTO `litemall_region` VALUES ('775', '65', '察哈尔右翼后旗', '3', '150928');
INSERT INTO `litemall_region` VALUES ('776', '65', '四子王旗', '3', '150929');
INSERT INTO `litemall_region` VALUES ('777', '65', '丰镇市', '3', '150981');
INSERT INTO `litemall_region` VALUES ('778', '66', '乌兰浩特市', '3', '152201');
INSERT INTO `litemall_region` VALUES ('779', '66', '阿尔山市', '3', '152202');
INSERT INTO `litemall_region` VALUES ('780', '66', '科尔沁右翼前旗', '3', '152221');
INSERT INTO `litemall_region` VALUES ('781', '66', '科尔沁右翼中旗', '3', '152222');
INSERT INTO `litemall_region` VALUES ('782', '66', '扎赉特旗', '3', '152223');
INSERT INTO `litemall_region` VALUES ('783', '66', '突泉县', '3', '152224');
INSERT INTO `litemall_region` VALUES ('784', '67', '二连浩特市', '3', '152501');
INSERT INTO `litemall_region` VALUES ('785', '67', '锡林浩特市', '3', '152502');
INSERT INTO `litemall_region` VALUES ('786', '67', '阿巴嘎旗', '3', '152522');
INSERT INTO `litemall_region` VALUES ('787', '67', '苏尼特左旗', '3', '152523');
INSERT INTO `litemall_region` VALUES ('788', '67', '苏尼特右旗', '3', '152524');
INSERT INTO `litemall_region` VALUES ('789', '67', '东乌珠穆沁旗', '3', '152525');
INSERT INTO `litemall_region` VALUES ('790', '67', '西乌珠穆沁旗', '3', '152526');
INSERT INTO `litemall_region` VALUES ('791', '67', '太仆寺旗', '3', '152527');
INSERT INTO `litemall_region` VALUES ('792', '67', '镶黄旗', '3', '152528');
INSERT INTO `litemall_region` VALUES ('793', '67', '正镶白旗', '3', '152529');
INSERT INTO `litemall_region` VALUES ('794', '67', '正蓝旗', '3', '152530');
INSERT INTO `litemall_region` VALUES ('795', '67', '多伦县', '3', '152531');
INSERT INTO `litemall_region` VALUES ('796', '68', '阿拉善左旗', '3', '152921');
INSERT INTO `litemall_region` VALUES ('797', '68', '阿拉善右旗', '3', '152922');
INSERT INTO `litemall_region` VALUES ('798', '68', '额济纳旗', '3', '152923');
INSERT INTO `litemall_region` VALUES ('799', '69', '和平区', '3', '210102');
INSERT INTO `litemall_region` VALUES ('800', '69', '沈河区', '3', '210103');
INSERT INTO `litemall_region` VALUES ('801', '69', '大东区', '3', '210104');
INSERT INTO `litemall_region` VALUES ('802', '69', '皇姑区', '3', '210105');
INSERT INTO `litemall_region` VALUES ('803', '69', '铁西区', '3', '210106');
INSERT INTO `litemall_region` VALUES ('804', '69', '苏家屯区', '3', '210111');
INSERT INTO `litemall_region` VALUES ('805', '69', '浑南区', '3', '210112');
INSERT INTO `litemall_region` VALUES ('806', '69', '沈北新区', '3', '210113');
INSERT INTO `litemall_region` VALUES ('807', '69', '于洪区', '3', '210114');
INSERT INTO `litemall_region` VALUES ('808', '69', '辽中区', '3', '210115');
INSERT INTO `litemall_region` VALUES ('809', '69', '康平县', '3', '210123');
INSERT INTO `litemall_region` VALUES ('810', '69', '法库县', '3', '210124');
INSERT INTO `litemall_region` VALUES ('811', '69', '新民市', '3', '210181');
INSERT INTO `litemall_region` VALUES ('812', '70', '中山区', '3', '210202');
INSERT INTO `litemall_region` VALUES ('813', '70', '西岗区', '3', '210203');
INSERT INTO `litemall_region` VALUES ('814', '70', '沙河口区', '3', '210204');
INSERT INTO `litemall_region` VALUES ('815', '70', '甘井子区', '3', '210211');
INSERT INTO `litemall_region` VALUES ('816', '70', '旅顺口区', '3', '210212');
INSERT INTO `litemall_region` VALUES ('817', '70', '金州区', '3', '210213');
INSERT INTO `litemall_region` VALUES ('818', '70', '普兰店区', '3', '210214');
INSERT INTO `litemall_region` VALUES ('819', '70', '长海县', '3', '210224');
INSERT INTO `litemall_region` VALUES ('820', '70', '瓦房店市', '3', '210281');
INSERT INTO `litemall_region` VALUES ('821', '70', '庄河市', '3', '210283');
INSERT INTO `litemall_region` VALUES ('822', '71', '铁东区', '3', '210302');
INSERT INTO `litemall_region` VALUES ('823', '71', '铁西区', '3', '210303');
INSERT INTO `litemall_region` VALUES ('824', '71', '立山区', '3', '210304');
INSERT INTO `litemall_region` VALUES ('825', '71', '千山区', '3', '210311');
INSERT INTO `litemall_region` VALUES ('826', '71', '台安县', '3', '210321');
INSERT INTO `litemall_region` VALUES ('827', '71', '岫岩满族自治县', '3', '210323');
INSERT INTO `litemall_region` VALUES ('828', '71', '海城市', '3', '210381');
INSERT INTO `litemall_region` VALUES ('829', '72', '新抚区', '3', '210402');
INSERT INTO `litemall_region` VALUES ('830', '72', '东洲区', '3', '210403');
INSERT INTO `litemall_region` VALUES ('831', '72', '望花区', '3', '210404');
INSERT INTO `litemall_region` VALUES ('832', '72', '顺城区', '3', '210411');
INSERT INTO `litemall_region` VALUES ('833', '72', '抚顺县', '3', '210421');
INSERT INTO `litemall_region` VALUES ('834', '72', '新宾满族自治县', '3', '210422');
INSERT INTO `litemall_region` VALUES ('835', '72', '清原满族自治县', '3', '210423');
INSERT INTO `litemall_region` VALUES ('836', '73', '平山区', '3', '210502');
INSERT INTO `litemall_region` VALUES ('837', '73', '溪湖区', '3', '210503');
INSERT INTO `litemall_region` VALUES ('838', '73', '明山区', '3', '210504');
INSERT INTO `litemall_region` VALUES ('839', '73', '南芬区', '3', '210505');
INSERT INTO `litemall_region` VALUES ('840', '73', '本溪满族自治县', '3', '210521');
INSERT INTO `litemall_region` VALUES ('841', '73', '桓仁满族自治县', '3', '210522');
INSERT INTO `litemall_region` VALUES ('842', '74', '元宝区', '3', '210602');
INSERT INTO `litemall_region` VALUES ('843', '74', '振兴区', '3', '210603');
INSERT INTO `litemall_region` VALUES ('844', '74', '振安区', '3', '210604');
INSERT INTO `litemall_region` VALUES ('845', '74', '宽甸满族自治县', '3', '210624');
INSERT INTO `litemall_region` VALUES ('846', '74', '东港市', '3', '210681');
INSERT INTO `litemall_region` VALUES ('847', '74', '凤城市', '3', '210682');
INSERT INTO `litemall_region` VALUES ('848', '75', '古塔区', '3', '210702');
INSERT INTO `litemall_region` VALUES ('849', '75', '凌河区', '3', '210703');
INSERT INTO `litemall_region` VALUES ('850', '75', '太和区', '3', '210711');
INSERT INTO `litemall_region` VALUES ('851', '75', '黑山县', '3', '210726');
INSERT INTO `litemall_region` VALUES ('852', '75', '义县', '3', '210727');
INSERT INTO `litemall_region` VALUES ('853', '75', '凌海市', '3', '210781');
INSERT INTO `litemall_region` VALUES ('854', '75', '北镇市', '3', '210782');
INSERT INTO `litemall_region` VALUES ('855', '76', '站前区', '3', '210802');
INSERT INTO `litemall_region` VALUES ('856', '76', '西市区', '3', '210803');
INSERT INTO `litemall_region` VALUES ('857', '76', '鲅鱼圈区', '3', '210804');
INSERT INTO `litemall_region` VALUES ('858', '76', '老边区', '3', '210811');
INSERT INTO `litemall_region` VALUES ('859', '76', '盖州市', '3', '210881');
INSERT INTO `litemall_region` VALUES ('860', '76', '大石桥市', '3', '210882');
INSERT INTO `litemall_region` VALUES ('861', '77', '海州区', '3', '210902');
INSERT INTO `litemall_region` VALUES ('862', '77', '新邱区', '3', '210903');
INSERT INTO `litemall_region` VALUES ('863', '77', '太平区', '3', '210904');
INSERT INTO `litemall_region` VALUES ('864', '77', '清河门区', '3', '210905');
INSERT INTO `litemall_region` VALUES ('865', '77', '细河区', '3', '210911');
INSERT INTO `litemall_region` VALUES ('866', '77', '阜新蒙古族自治县', '3', '210921');
INSERT INTO `litemall_region` VALUES ('867', '77', '彰武县', '3', '210922');
INSERT INTO `litemall_region` VALUES ('868', '78', '白塔区', '3', '211002');
INSERT INTO `litemall_region` VALUES ('869', '78', '文圣区', '3', '211003');
INSERT INTO `litemall_region` VALUES ('870', '78', '宏伟区', '3', '211004');
INSERT INTO `litemall_region` VALUES ('871', '78', '弓长岭区', '3', '211005');
INSERT INTO `litemall_region` VALUES ('872', '78', '太子河区', '3', '211011');
INSERT INTO `litemall_region` VALUES ('873', '78', '辽阳县', '3', '211021');
INSERT INTO `litemall_region` VALUES ('874', '78', '灯塔市', '3', '211081');
INSERT INTO `litemall_region` VALUES ('875', '79', '双台子区', '3', '211102');
INSERT INTO `litemall_region` VALUES ('876', '79', '兴隆台区', '3', '211103');
INSERT INTO `litemall_region` VALUES ('877', '79', '大洼区', '3', '211104');
INSERT INTO `litemall_region` VALUES ('878', '79', '盘山县', '3', '211122');
INSERT INTO `litemall_region` VALUES ('879', '80', '银州区', '3', '211202');
INSERT INTO `litemall_region` VALUES ('880', '80', '清河区', '3', '211204');
INSERT INTO `litemall_region` VALUES ('881', '80', '铁岭县', '3', '211221');
INSERT INTO `litemall_region` VALUES ('882', '80', '西丰县', '3', '211223');
INSERT INTO `litemall_region` VALUES ('883', '80', '昌图县', '3', '211224');
INSERT INTO `litemall_region` VALUES ('884', '80', '调兵山市', '3', '211281');
INSERT INTO `litemall_region` VALUES ('885', '80', '开原市', '3', '211282');
INSERT INTO `litemall_region` VALUES ('886', '81', '双塔区', '3', '211302');
INSERT INTO `litemall_region` VALUES ('887', '81', '龙城区', '3', '211303');
INSERT INTO `litemall_region` VALUES ('888', '81', '朝阳县', '3', '211321');
INSERT INTO `litemall_region` VALUES ('889', '81', '建平县', '3', '211322');
INSERT INTO `litemall_region` VALUES ('890', '81', '喀喇沁左翼蒙古族自治县', '3', '211324');
INSERT INTO `litemall_region` VALUES ('891', '81', '北票市', '3', '211381');
INSERT INTO `litemall_region` VALUES ('892', '81', '凌源市', '3', '211382');
INSERT INTO `litemall_region` VALUES ('893', '82', '连山区', '3', '211402');
INSERT INTO `litemall_region` VALUES ('894', '82', '龙港区', '3', '211403');
INSERT INTO `litemall_region` VALUES ('895', '82', '南票区', '3', '211404');
INSERT INTO `litemall_region` VALUES ('896', '82', '绥中县', '3', '211421');
INSERT INTO `litemall_region` VALUES ('897', '82', '建昌县', '3', '211422');
INSERT INTO `litemall_region` VALUES ('898', '82', '兴城市', '3', '211481');
INSERT INTO `litemall_region` VALUES ('899', '83', '南关区', '3', '220102');
INSERT INTO `litemall_region` VALUES ('900', '83', '宽城区', '3', '220103');
INSERT INTO `litemall_region` VALUES ('901', '83', '朝阳区', '3', '220104');
INSERT INTO `litemall_region` VALUES ('902', '83', '二道区', '3', '220105');
INSERT INTO `litemall_region` VALUES ('903', '83', '绿园区', '3', '220106');
INSERT INTO `litemall_region` VALUES ('904', '83', '双阳区', '3', '220112');
INSERT INTO `litemall_region` VALUES ('905', '83', '九台区', '3', '220113');
INSERT INTO `litemall_region` VALUES ('906', '83', '农安县', '3', '220122');
INSERT INTO `litemall_region` VALUES ('907', '83', '榆树市', '3', '220182');
INSERT INTO `litemall_region` VALUES ('908', '83', '德惠市', '3', '220183');
INSERT INTO `litemall_region` VALUES ('909', '84', '昌邑区', '3', '220202');
INSERT INTO `litemall_region` VALUES ('910', '84', '龙潭区', '3', '220203');
INSERT INTO `litemall_region` VALUES ('911', '84', '船营区', '3', '220204');
INSERT INTO `litemall_region` VALUES ('912', '84', '丰满区', '3', '220211');
INSERT INTO `litemall_region` VALUES ('913', '84', '永吉县', '3', '220221');
INSERT INTO `litemall_region` VALUES ('914', '84', '蛟河市', '3', '220281');
INSERT INTO `litemall_region` VALUES ('915', '84', '桦甸市', '3', '220282');
INSERT INTO `litemall_region` VALUES ('916', '84', '舒兰市', '3', '220283');
INSERT INTO `litemall_region` VALUES ('917', '84', '磐石市', '3', '220284');
INSERT INTO `litemall_region` VALUES ('918', '85', '铁西区', '3', '220302');
INSERT INTO `litemall_region` VALUES ('919', '85', '铁东区', '3', '220303');
INSERT INTO `litemall_region` VALUES ('920', '85', '梨树县', '3', '220322');
INSERT INTO `litemall_region` VALUES ('921', '85', '伊通满族自治县', '3', '220323');
INSERT INTO `litemall_region` VALUES ('922', '85', '公主岭市', '3', '220381');
INSERT INTO `litemall_region` VALUES ('923', '85', '双辽市', '3', '220382');
INSERT INTO `litemall_region` VALUES ('924', '86', '龙山区', '3', '220402');
INSERT INTO `litemall_region` VALUES ('925', '86', '西安区', '3', '220403');
INSERT INTO `litemall_region` VALUES ('926', '86', '东丰县', '3', '220421');
INSERT INTO `litemall_region` VALUES ('927', '86', '东辽县', '3', '220422');
INSERT INTO `litemall_region` VALUES ('928', '87', '东昌区', '3', '220502');
INSERT INTO `litemall_region` VALUES ('929', '87', '二道江区', '3', '220503');
INSERT INTO `litemall_region` VALUES ('930', '87', '通化县', '3', '220521');
INSERT INTO `litemall_region` VALUES ('931', '87', '辉南县', '3', '220523');
INSERT INTO `litemall_region` VALUES ('932', '87', '柳河县', '3', '220524');
INSERT INTO `litemall_region` VALUES ('933', '87', '梅河口市', '3', '220581');
INSERT INTO `litemall_region` VALUES ('934', '87', '集安市', '3', '220582');
INSERT INTO `litemall_region` VALUES ('935', '88', '浑江区', '3', '220602');
INSERT INTO `litemall_region` VALUES ('936', '88', '江源区', '3', '220605');
INSERT INTO `litemall_region` VALUES ('937', '88', '抚松县', '3', '220621');
INSERT INTO `litemall_region` VALUES ('938', '88', '靖宇县', '3', '220622');
INSERT INTO `litemall_region` VALUES ('939', '88', '长白朝鲜族自治县', '3', '220623');
INSERT INTO `litemall_region` VALUES ('940', '88', '临江市', '3', '220681');
INSERT INTO `litemall_region` VALUES ('941', '89', '宁江区', '3', '220702');
INSERT INTO `litemall_region` VALUES ('942', '89', '前郭尔罗斯蒙古族自治县', '3', '220721');
INSERT INTO `litemall_region` VALUES ('943', '89', '长岭县', '3', '220722');
INSERT INTO `litemall_region` VALUES ('944', '89', '乾安县', '3', '220723');
INSERT INTO `litemall_region` VALUES ('945', '89', '扶余市', '3', '220781');
INSERT INTO `litemall_region` VALUES ('946', '90', '洮北区', '3', '220802');
INSERT INTO `litemall_region` VALUES ('947', '90', '镇赉县', '3', '220821');
INSERT INTO `litemall_region` VALUES ('948', '90', '通榆县', '3', '220822');
INSERT INTO `litemall_region` VALUES ('949', '90', '洮南市', '3', '220881');
INSERT INTO `litemall_region` VALUES ('950', '90', '大安市', '3', '220882');
INSERT INTO `litemall_region` VALUES ('951', '91', '延吉市', '3', '222401');
INSERT INTO `litemall_region` VALUES ('952', '91', '图们市', '3', '222402');
INSERT INTO `litemall_region` VALUES ('953', '91', '敦化市', '3', '222403');
INSERT INTO `litemall_region` VALUES ('954', '91', '珲春市', '3', '222404');
INSERT INTO `litemall_region` VALUES ('955', '91', '龙井市', '3', '222405');
INSERT INTO `litemall_region` VALUES ('956', '91', '和龙市', '3', '222406');
INSERT INTO `litemall_region` VALUES ('957', '91', '汪清县', '3', '222424');
INSERT INTO `litemall_region` VALUES ('958', '91', '安图县', '3', '222426');
INSERT INTO `litemall_region` VALUES ('959', '92', '道里区', '3', '230102');
INSERT INTO `litemall_region` VALUES ('960', '92', '南岗区', '3', '230103');
INSERT INTO `litemall_region` VALUES ('961', '92', '道外区', '3', '230104');
INSERT INTO `litemall_region` VALUES ('962', '92', '平房区', '3', '230108');
INSERT INTO `litemall_region` VALUES ('963', '92', '松北区', '3', '230109');
INSERT INTO `litemall_region` VALUES ('964', '92', '香坊区', '3', '230110');
INSERT INTO `litemall_region` VALUES ('965', '92', '呼兰区', '3', '230111');
INSERT INTO `litemall_region` VALUES ('966', '92', '阿城区', '3', '230112');
INSERT INTO `litemall_region` VALUES ('967', '92', '双城区', '3', '230113');
INSERT INTO `litemall_region` VALUES ('968', '92', '依兰县', '3', '230123');
INSERT INTO `litemall_region` VALUES ('969', '92', '方正县', '3', '230124');
INSERT INTO `litemall_region` VALUES ('970', '92', '宾县', '3', '230125');
INSERT INTO `litemall_region` VALUES ('971', '92', '巴彦县', '3', '230126');
INSERT INTO `litemall_region` VALUES ('972', '92', '木兰县', '3', '230127');
INSERT INTO `litemall_region` VALUES ('973', '92', '通河县', '3', '230128');
INSERT INTO `litemall_region` VALUES ('974', '92', '延寿县', '3', '230129');
INSERT INTO `litemall_region` VALUES ('975', '92', '尚志市', '3', '230183');
INSERT INTO `litemall_region` VALUES ('976', '92', '五常市', '3', '230184');
INSERT INTO `litemall_region` VALUES ('977', '93', '龙沙区', '3', '230202');
INSERT INTO `litemall_region` VALUES ('978', '93', '建华区', '3', '230203');
INSERT INTO `litemall_region` VALUES ('979', '93', '铁锋区', '3', '230204');
INSERT INTO `litemall_region` VALUES ('980', '93', '昂昂溪区', '3', '230205');
INSERT INTO `litemall_region` VALUES ('981', '93', '富拉尔基区', '3', '230206');
INSERT INTO `litemall_region` VALUES ('982', '93', '碾子山区', '3', '230207');
INSERT INTO `litemall_region` VALUES ('983', '93', '梅里斯达斡尔族区', '3', '230208');
INSERT INTO `litemall_region` VALUES ('984', '93', '龙江县', '3', '230221');
INSERT INTO `litemall_region` VALUES ('985', '93', '依安县', '3', '230223');
INSERT INTO `litemall_region` VALUES ('986', '93', '泰来县', '3', '230224');
INSERT INTO `litemall_region` VALUES ('987', '93', '甘南县', '3', '230225');
INSERT INTO `litemall_region` VALUES ('988', '93', '富裕县', '3', '230227');
INSERT INTO `litemall_region` VALUES ('989', '93', '克山县', '3', '230229');
INSERT INTO `litemall_region` VALUES ('990', '93', '克东县', '3', '230230');
INSERT INTO `litemall_region` VALUES ('991', '93', '拜泉县', '3', '230231');
INSERT INTO `litemall_region` VALUES ('992', '93', '讷河市', '3', '230281');
INSERT INTO `litemall_region` VALUES ('993', '94', '鸡冠区', '3', '230302');
INSERT INTO `litemall_region` VALUES ('994', '94', '恒山区', '3', '230303');
INSERT INTO `litemall_region` VALUES ('995', '94', '滴道区', '3', '230304');
INSERT INTO `litemall_region` VALUES ('996', '94', '梨树区', '3', '230305');
INSERT INTO `litemall_region` VALUES ('997', '94', '城子河区', '3', '230306');
INSERT INTO `litemall_region` VALUES ('998', '94', '麻山区', '3', '230307');
INSERT INTO `litemall_region` VALUES ('999', '94', '鸡东县', '3', '230321');
INSERT INTO `litemall_region` VALUES ('1000', '94', '虎林市', '3', '230381');
INSERT INTO `litemall_region` VALUES ('1001', '94', '密山市', '3', '230382');
INSERT INTO `litemall_region` VALUES ('1002', '95', '向阳区', '3', '230402');
INSERT INTO `litemall_region` VALUES ('1003', '95', '工农区', '3', '230403');
INSERT INTO `litemall_region` VALUES ('1004', '95', '南山区', '3', '230404');
INSERT INTO `litemall_region` VALUES ('1005', '95', '兴安区', '3', '230405');
INSERT INTO `litemall_region` VALUES ('1006', '95', '东山区', '3', '230406');
INSERT INTO `litemall_region` VALUES ('1007', '95', '兴山区', '3', '230407');
INSERT INTO `litemall_region` VALUES ('1008', '95', '萝北县', '3', '230421');
INSERT INTO `litemall_region` VALUES ('1009', '95', '绥滨县', '3', '230422');
INSERT INTO `litemall_region` VALUES ('1010', '96', '尖山区', '3', '230502');
INSERT INTO `litemall_region` VALUES ('1011', '96', '岭东区', '3', '230503');
INSERT INTO `litemall_region` VALUES ('1012', '96', '四方台区', '3', '230505');
INSERT INTO `litemall_region` VALUES ('1013', '96', '宝山区', '3', '230506');
INSERT INTO `litemall_region` VALUES ('1014', '96', '集贤县', '3', '230521');
INSERT INTO `litemall_region` VALUES ('1015', '96', '友谊县', '3', '230522');
INSERT INTO `litemall_region` VALUES ('1016', '96', '宝清县', '3', '230523');
INSERT INTO `litemall_region` VALUES ('1017', '96', '饶河县', '3', '230524');
INSERT INTO `litemall_region` VALUES ('1018', '97', '萨尔图区', '3', '230602');
INSERT INTO `litemall_region` VALUES ('1019', '97', '龙凤区', '3', '230603');
INSERT INTO `litemall_region` VALUES ('1020', '97', '让胡路区', '3', '230604');
INSERT INTO `litemall_region` VALUES ('1021', '97', '红岗区', '3', '230605');
INSERT INTO `litemall_region` VALUES ('1022', '97', '大同区', '3', '230606');
INSERT INTO `litemall_region` VALUES ('1023', '97', '肇州县', '3', '230621');
INSERT INTO `litemall_region` VALUES ('1024', '97', '肇源县', '3', '230622');
INSERT INTO `litemall_region` VALUES ('1025', '97', '林甸县', '3', '230623');
INSERT INTO `litemall_region` VALUES ('1026', '97', '杜尔伯特蒙古族自治县', '3', '230624');
INSERT INTO `litemall_region` VALUES ('1027', '98', '伊春区', '3', '230702');
INSERT INTO `litemall_region` VALUES ('1028', '98', '南岔区', '3', '230703');
INSERT INTO `litemall_region` VALUES ('1029', '98', '友好区', '3', '230704');
INSERT INTO `litemall_region` VALUES ('1030', '98', '西林区', '3', '230705');
INSERT INTO `litemall_region` VALUES ('1031', '98', '翠峦区', '3', '230706');
INSERT INTO `litemall_region` VALUES ('1032', '98', '新青区', '3', '230707');
INSERT INTO `litemall_region` VALUES ('1033', '98', '美溪区', '3', '230708');
INSERT INTO `litemall_region` VALUES ('1034', '98', '金山屯区', '3', '230709');
INSERT INTO `litemall_region` VALUES ('1035', '98', '五营区', '3', '230710');
INSERT INTO `litemall_region` VALUES ('1036', '98', '乌马河区', '3', '230711');
INSERT INTO `litemall_region` VALUES ('1037', '98', '汤旺河区', '3', '230712');
INSERT INTO `litemall_region` VALUES ('1038', '98', '带岭区', '3', '230713');
INSERT INTO `litemall_region` VALUES ('1039', '98', '乌伊岭区', '3', '230714');
INSERT INTO `litemall_region` VALUES ('1040', '98', '红星区', '3', '230715');
INSERT INTO `litemall_region` VALUES ('1041', '98', '上甘岭区', '3', '230716');
INSERT INTO `litemall_region` VALUES ('1042', '98', '嘉荫县', '3', '230722');
INSERT INTO `litemall_region` VALUES ('1043', '98', '铁力市', '3', '230781');
INSERT INTO `litemall_region` VALUES ('1044', '99', '向阳区', '3', '230803');
INSERT INTO `litemall_region` VALUES ('1045', '99', '前进区', '3', '230804');
INSERT INTO `litemall_region` VALUES ('1046', '99', '东风区', '3', '230805');
INSERT INTO `litemall_region` VALUES ('1047', '99', '郊区', '3', '230811');
INSERT INTO `litemall_region` VALUES ('1048', '99', '桦南县', '3', '230822');
INSERT INTO `litemall_region` VALUES ('1049', '99', '桦川县', '3', '230826');
INSERT INTO `litemall_region` VALUES ('1050', '99', '汤原县', '3', '230828');
INSERT INTO `litemall_region` VALUES ('1051', '99', '同江市', '3', '230881');
INSERT INTO `litemall_region` VALUES ('1052', '99', '富锦市', '3', '230882');
INSERT INTO `litemall_region` VALUES ('1053', '99', '抚远市', '3', '230883');
INSERT INTO `litemall_region` VALUES ('1054', '100', '新兴区', '3', '230902');
INSERT INTO `litemall_region` VALUES ('1055', '100', '桃山区', '3', '230903');
INSERT INTO `litemall_region` VALUES ('1056', '100', '茄子河区', '3', '230904');
INSERT INTO `litemall_region` VALUES ('1057', '100', '勃利县', '3', '230921');
INSERT INTO `litemall_region` VALUES ('1058', '101', '东安区', '3', '231002');
INSERT INTO `litemall_region` VALUES ('1059', '101', '阳明区', '3', '231003');
INSERT INTO `litemall_region` VALUES ('1060', '101', '爱民区', '3', '231004');
INSERT INTO `litemall_region` VALUES ('1061', '101', '西安区', '3', '231005');
INSERT INTO `litemall_region` VALUES ('1062', '101', '林口县', '3', '231025');
INSERT INTO `litemall_region` VALUES ('1063', '101', '绥芬河市', '3', '231081');
INSERT INTO `litemall_region` VALUES ('1064', '101', '海林市', '3', '231083');
INSERT INTO `litemall_region` VALUES ('1065', '101', '宁安市', '3', '231084');
INSERT INTO `litemall_region` VALUES ('1066', '101', '穆棱市', '3', '231085');
INSERT INTO `litemall_region` VALUES ('1067', '101', '东宁市', '3', '231086');
INSERT INTO `litemall_region` VALUES ('1068', '102', '爱辉区', '3', '231102');
INSERT INTO `litemall_region` VALUES ('1069', '102', '嫩江县', '3', '231121');
INSERT INTO `litemall_region` VALUES ('1070', '102', '逊克县', '3', '231123');
INSERT INTO `litemall_region` VALUES ('1071', '102', '孙吴县', '3', '231124');
INSERT INTO `litemall_region` VALUES ('1072', '102', '北安市', '3', '231181');
INSERT INTO `litemall_region` VALUES ('1073', '102', '五大连池市', '3', '231182');
INSERT INTO `litemall_region` VALUES ('1074', '103', '北林区', '3', '231202');
INSERT INTO `litemall_region` VALUES ('1075', '103', '望奎县', '3', '231221');
INSERT INTO `litemall_region` VALUES ('1076', '103', '兰西县', '3', '231222');
INSERT INTO `litemall_region` VALUES ('1077', '103', '青冈县', '3', '231223');
INSERT INTO `litemall_region` VALUES ('1078', '103', '庆安县', '3', '231224');
INSERT INTO `litemall_region` VALUES ('1079', '103', '明水县', '3', '231225');
INSERT INTO `litemall_region` VALUES ('1080', '103', '绥棱县', '3', '231226');
INSERT INTO `litemall_region` VALUES ('1081', '103', '安达市', '3', '231281');
INSERT INTO `litemall_region` VALUES ('1082', '103', '肇东市', '3', '231282');
INSERT INTO `litemall_region` VALUES ('1083', '103', '海伦市', '3', '231283');
INSERT INTO `litemall_region` VALUES ('1084', '104', '呼玛县', '3', '232721');
INSERT INTO `litemall_region` VALUES ('1085', '104', '塔河县', '3', '232722');
INSERT INTO `litemall_region` VALUES ('1086', '104', '漠河县', '3', '232723');
INSERT INTO `litemall_region` VALUES ('1087', '105', '黄浦区', '3', '310101');
INSERT INTO `litemall_region` VALUES ('1088', '105', '徐汇区', '3', '310104');
INSERT INTO `litemall_region` VALUES ('1089', '105', '长宁区', '3', '310105');
INSERT INTO `litemall_region` VALUES ('1090', '105', '静安区', '3', '310106');
INSERT INTO `litemall_region` VALUES ('1091', '105', '普陀区', '3', '310107');
INSERT INTO `litemall_region` VALUES ('1092', '105', '虹口区', '3', '310109');
INSERT INTO `litemall_region` VALUES ('1093', '105', '杨浦区', '3', '310110');
INSERT INTO `litemall_region` VALUES ('1094', '105', '闵行区', '3', '310112');
INSERT INTO `litemall_region` VALUES ('1095', '105', '宝山区', '3', '310113');
INSERT INTO `litemall_region` VALUES ('1096', '105', '嘉定区', '3', '310114');
INSERT INTO `litemall_region` VALUES ('1097', '105', '浦东新区', '3', '310115');
INSERT INTO `litemall_region` VALUES ('1098', '105', '金山区', '3', '310116');
INSERT INTO `litemall_region` VALUES ('1099', '105', '松江区', '3', '310117');
INSERT INTO `litemall_region` VALUES ('1100', '105', '青浦区', '3', '310118');
INSERT INTO `litemall_region` VALUES ('1101', '105', '奉贤区', '3', '310120');
INSERT INTO `litemall_region` VALUES ('1102', '105', '崇明区', '3', '310151');
INSERT INTO `litemall_region` VALUES ('1103', '106', '玄武区', '3', '320102');
INSERT INTO `litemall_region` VALUES ('1104', '106', '秦淮区', '3', '320104');
INSERT INTO `litemall_region` VALUES ('1105', '106', '建邺区', '3', '320105');
INSERT INTO `litemall_region` VALUES ('1106', '106', '鼓楼区', '3', '320106');
INSERT INTO `litemall_region` VALUES ('1107', '106', '浦口区', '3', '320111');
INSERT INTO `litemall_region` VALUES ('1108', '106', '栖霞区', '3', '320113');
INSERT INTO `litemall_region` VALUES ('1109', '106', '雨花台区', '3', '320114');
INSERT INTO `litemall_region` VALUES ('1110', '106', '江宁区', '3', '320115');
INSERT INTO `litemall_region` VALUES ('1111', '106', '六合区', '3', '320116');
INSERT INTO `litemall_region` VALUES ('1112', '106', '溧水区', '3', '320117');
INSERT INTO `litemall_region` VALUES ('1113', '106', '高淳区', '3', '320118');
INSERT INTO `litemall_region` VALUES ('1114', '107', '锡山区', '3', '320205');
INSERT INTO `litemall_region` VALUES ('1115', '107', '惠山区', '3', '320206');
INSERT INTO `litemall_region` VALUES ('1116', '107', '滨湖区', '3', '320211');
INSERT INTO `litemall_region` VALUES ('1117', '107', '梁溪区', '3', '320213');
INSERT INTO `litemall_region` VALUES ('1118', '107', '新吴区', '3', '320214');
INSERT INTO `litemall_region` VALUES ('1119', '107', '江阴市', '3', '320281');
INSERT INTO `litemall_region` VALUES ('1120', '107', '宜兴市', '3', '320282');
INSERT INTO `litemall_region` VALUES ('1121', '108', '鼓楼区', '3', '320302');
INSERT INTO `litemall_region` VALUES ('1122', '108', '云龙区', '3', '320303');
INSERT INTO `litemall_region` VALUES ('1123', '108', '贾汪区', '3', '320305');
INSERT INTO `litemall_region` VALUES ('1124', '108', '泉山区', '3', '320311');
INSERT INTO `litemall_region` VALUES ('1125', '108', '铜山区', '3', '320312');
INSERT INTO `litemall_region` VALUES ('1126', '108', '丰县', '3', '320321');
INSERT INTO `litemall_region` VALUES ('1127', '108', '沛县', '3', '320322');
INSERT INTO `litemall_region` VALUES ('1128', '108', '睢宁县', '3', '320324');
INSERT INTO `litemall_region` VALUES ('1129', '108', '新沂市', '3', '320381');
INSERT INTO `litemall_region` VALUES ('1130', '108', '邳州市', '3', '320382');
INSERT INTO `litemall_region` VALUES ('1131', '109', '天宁区', '3', '320402');
INSERT INTO `litemall_region` VALUES ('1132', '109', '钟楼区', '3', '320404');
INSERT INTO `litemall_region` VALUES ('1133', '109', '新北区', '3', '320411');
INSERT INTO `litemall_region` VALUES ('1134', '109', '武进区', '3', '320412');
INSERT INTO `litemall_region` VALUES ('1135', '109', '金坛区', '3', '320413');
INSERT INTO `litemall_region` VALUES ('1136', '109', '溧阳市', '3', '320481');
INSERT INTO `litemall_region` VALUES ('1137', '110', '虎丘区', '3', '320505');
INSERT INTO `litemall_region` VALUES ('1138', '110', '吴中区', '3', '320506');
INSERT INTO `litemall_region` VALUES ('1139', '110', '相城区', '3', '320507');
INSERT INTO `litemall_region` VALUES ('1140', '110', '姑苏区', '3', '320508');
INSERT INTO `litemall_region` VALUES ('1141', '110', '吴江区', '3', '320509');
INSERT INTO `litemall_region` VALUES ('1142', '110', '常熟市', '3', '320581');
INSERT INTO `litemall_region` VALUES ('1143', '110', '张家港市', '3', '320582');
INSERT INTO `litemall_region` VALUES ('1144', '110', '昆山市', '3', '320583');
INSERT INTO `litemall_region` VALUES ('1145', '110', '太仓市', '3', '320585');
INSERT INTO `litemall_region` VALUES ('1146', '111', '崇川区', '3', '320602');
INSERT INTO `litemall_region` VALUES ('1147', '111', '港闸区', '3', '320611');
INSERT INTO `litemall_region` VALUES ('1148', '111', '通州区', '3', '320612');
INSERT INTO `litemall_region` VALUES ('1149', '111', '海安县', '3', '320621');
INSERT INTO `litemall_region` VALUES ('1150', '111', '如东县', '3', '320623');
INSERT INTO `litemall_region` VALUES ('1151', '111', '启东市', '3', '320681');
INSERT INTO `litemall_region` VALUES ('1152', '111', '如皋市', '3', '320682');
INSERT INTO `litemall_region` VALUES ('1153', '111', '海门市', '3', '320684');
INSERT INTO `litemall_region` VALUES ('1154', '112', '连云区', '3', '320703');
INSERT INTO `litemall_region` VALUES ('1155', '112', '海州区', '3', '320706');
INSERT INTO `litemall_region` VALUES ('1156', '112', '赣榆区', '3', '320707');
INSERT INTO `litemall_region` VALUES ('1157', '112', '东海县', '3', '320722');
INSERT INTO `litemall_region` VALUES ('1158', '112', '灌云县', '3', '320723');
INSERT INTO `litemall_region` VALUES ('1159', '112', '灌南县', '3', '320724');
INSERT INTO `litemall_region` VALUES ('1160', '113', '淮安区', '3', '320803');
INSERT INTO `litemall_region` VALUES ('1161', '113', '淮阴区', '3', '320804');
INSERT INTO `litemall_region` VALUES ('1162', '113', '清江浦区', '3', '320812');
INSERT INTO `litemall_region` VALUES ('1163', '113', '洪泽区', '3', '320813');
INSERT INTO `litemall_region` VALUES ('1164', '113', '涟水县', '3', '320826');
INSERT INTO `litemall_region` VALUES ('1165', '113', '盱眙县', '3', '320830');
INSERT INTO `litemall_region` VALUES ('1166', '113', '金湖县', '3', '320831');
INSERT INTO `litemall_region` VALUES ('1167', '114', '亭湖区', '3', '320902');
INSERT INTO `litemall_region` VALUES ('1168', '114', '盐都区', '3', '320903');
INSERT INTO `litemall_region` VALUES ('1169', '114', '大丰区', '3', '320904');
INSERT INTO `litemall_region` VALUES ('1170', '114', '响水县', '3', '320921');
INSERT INTO `litemall_region` VALUES ('1171', '114', '滨海县', '3', '320922');
INSERT INTO `litemall_region` VALUES ('1172', '114', '阜宁县', '3', '320923');
INSERT INTO `litemall_region` VALUES ('1173', '114', '射阳县', '3', '320924');
INSERT INTO `litemall_region` VALUES ('1174', '114', '建湖县', '3', '320925');
INSERT INTO `litemall_region` VALUES ('1175', '114', '东台市', '3', '320981');
INSERT INTO `litemall_region` VALUES ('1176', '115', '广陵区', '3', '321002');
INSERT INTO `litemall_region` VALUES ('1177', '115', '邗江区', '3', '321003');
INSERT INTO `litemall_region` VALUES ('1178', '115', '江都区', '3', '321012');
INSERT INTO `litemall_region` VALUES ('1179', '115', '宝应县', '3', '321023');
INSERT INTO `litemall_region` VALUES ('1180', '115', '仪征市', '3', '321081');
INSERT INTO `litemall_region` VALUES ('1181', '115', '高邮市', '3', '321084');
INSERT INTO `litemall_region` VALUES ('1182', '116', '京口区', '3', '321102');
INSERT INTO `litemall_region` VALUES ('1183', '116', '润州区', '3', '321111');
INSERT INTO `litemall_region` VALUES ('1184', '116', '丹徒区', '3', '321112');
INSERT INTO `litemall_region` VALUES ('1185', '116', '丹阳市', '3', '321181');
INSERT INTO `litemall_region` VALUES ('1186', '116', '扬中市', '3', '321182');
INSERT INTO `litemall_region` VALUES ('1187', '116', '句容市', '3', '321183');
INSERT INTO `litemall_region` VALUES ('1188', '117', '海陵区', '3', '321202');
INSERT INTO `litemall_region` VALUES ('1189', '117', '高港区', '3', '321203');
INSERT INTO `litemall_region` VALUES ('1190', '117', '姜堰区', '3', '321204');
INSERT INTO `litemall_region` VALUES ('1191', '117', '兴化市', '3', '321281');
INSERT INTO `litemall_region` VALUES ('1192', '117', '靖江市', '3', '321282');
INSERT INTO `litemall_region` VALUES ('1193', '117', '泰兴市', '3', '321283');
INSERT INTO `litemall_region` VALUES ('1194', '118', '宿城区', '3', '321302');
INSERT INTO `litemall_region` VALUES ('1195', '118', '宿豫区', '3', '321311');
INSERT INTO `litemall_region` VALUES ('1196', '118', '沭阳县', '3', '321322');
INSERT INTO `litemall_region` VALUES ('1197', '118', '泗阳县', '3', '321323');
INSERT INTO `litemall_region` VALUES ('1198', '118', '泗洪县', '3', '321324');
INSERT INTO `litemall_region` VALUES ('1199', '119', '上城区', '3', '330102');
INSERT INTO `litemall_region` VALUES ('1200', '119', '下城区', '3', '330103');
INSERT INTO `litemall_region` VALUES ('1201', '119', '江干区', '3', '330104');
INSERT INTO `litemall_region` VALUES ('1202', '119', '拱墅区', '3', '330105');
INSERT INTO `litemall_region` VALUES ('1203', '119', '西湖区', '3', '330106');
INSERT INTO `litemall_region` VALUES ('1204', '119', '滨江区', '3', '330108');
INSERT INTO `litemall_region` VALUES ('1205', '119', '萧山区', '3', '330109');
INSERT INTO `litemall_region` VALUES ('1206', '119', '余杭区', '3', '330110');
INSERT INTO `litemall_region` VALUES ('1207', '119', '富阳区', '3', '330111');
INSERT INTO `litemall_region` VALUES ('1208', '119', '桐庐县', '3', '330122');
INSERT INTO `litemall_region` VALUES ('1209', '119', '淳安县', '3', '330127');
INSERT INTO `litemall_region` VALUES ('1210', '119', '建德市', '3', '330182');
INSERT INTO `litemall_region` VALUES ('1211', '119', '临安市', '3', '330185');
INSERT INTO `litemall_region` VALUES ('1212', '120', '海曙区', '3', '330203');
INSERT INTO `litemall_region` VALUES ('1213', '120', '江东区', '3', '330204');
INSERT INTO `litemall_region` VALUES ('1214', '120', '江北区', '3', '330205');
INSERT INTO `litemall_region` VALUES ('1215', '120', '北仑区', '3', '330206');
INSERT INTO `litemall_region` VALUES ('1216', '120', '镇海区', '3', '330211');
INSERT INTO `litemall_region` VALUES ('1217', '120', '鄞州区', '3', '330212');
INSERT INTO `litemall_region` VALUES ('1218', '120', '象山县', '3', '330225');
INSERT INTO `litemall_region` VALUES ('1219', '120', '宁海县', '3', '330226');
INSERT INTO `litemall_region` VALUES ('1220', '120', '余姚市', '3', '330281');
INSERT INTO `litemall_region` VALUES ('1221', '120', '慈溪市', '3', '330282');
INSERT INTO `litemall_region` VALUES ('1222', '120', '奉化市', '3', '330283');
INSERT INTO `litemall_region` VALUES ('1223', '121', '鹿城区', '3', '330302');
INSERT INTO `litemall_region` VALUES ('1224', '121', '龙湾区', '3', '330303');
INSERT INTO `litemall_region` VALUES ('1225', '121', '瓯海区', '3', '330304');
INSERT INTO `litemall_region` VALUES ('1226', '121', '洞头区', '3', '330305');
INSERT INTO `litemall_region` VALUES ('1227', '121', '永嘉县', '3', '330324');
INSERT INTO `litemall_region` VALUES ('1228', '121', '平阳县', '3', '330326');
INSERT INTO `litemall_region` VALUES ('1229', '121', '苍南县', '3', '330327');
INSERT INTO `litemall_region` VALUES ('1230', '121', '文成县', '3', '330328');
INSERT INTO `litemall_region` VALUES ('1231', '121', '泰顺县', '3', '330329');
INSERT INTO `litemall_region` VALUES ('1232', '121', '瑞安市', '3', '330381');
INSERT INTO `litemall_region` VALUES ('1233', '121', '乐清市', '3', '330382');
INSERT INTO `litemall_region` VALUES ('1234', '122', '南湖区', '3', '330402');
INSERT INTO `litemall_region` VALUES ('1235', '122', '秀洲区', '3', '330411');
INSERT INTO `litemall_region` VALUES ('1236', '122', '嘉善县', '3', '330421');
INSERT INTO `litemall_region` VALUES ('1237', '122', '海盐县', '3', '330424');
INSERT INTO `litemall_region` VALUES ('1238', '122', '海宁市', '3', '330481');
INSERT INTO `litemall_region` VALUES ('1239', '122', '平湖市', '3', '330482');
INSERT INTO `litemall_region` VALUES ('1240', '122', '桐乡市', '3', '330483');
INSERT INTO `litemall_region` VALUES ('1241', '123', '吴兴区', '3', '330502');
INSERT INTO `litemall_region` VALUES ('1242', '123', '南浔区', '3', '330503');
INSERT INTO `litemall_region` VALUES ('1243', '123', '德清县', '3', '330521');
INSERT INTO `litemall_region` VALUES ('1244', '123', '长兴县', '3', '330522');
INSERT INTO `litemall_region` VALUES ('1245', '123', '安吉县', '3', '330523');
INSERT INTO `litemall_region` VALUES ('1246', '124', '越城区', '3', '330602');
INSERT INTO `litemall_region` VALUES ('1247', '124', '柯桥区', '3', '330603');
INSERT INTO `litemall_region` VALUES ('1248', '124', '上虞区', '3', '330604');
INSERT INTO `litemall_region` VALUES ('1249', '124', '新昌县', '3', '330624');
INSERT INTO `litemall_region` VALUES ('1250', '124', '诸暨市', '3', '330681');
INSERT INTO `litemall_region` VALUES ('1251', '124', '嵊州市', '3', '330683');
INSERT INTO `litemall_region` VALUES ('1252', '125', '婺城区', '3', '330702');
INSERT INTO `litemall_region` VALUES ('1253', '125', '金东区', '3', '330703');
INSERT INTO `litemall_region` VALUES ('1254', '125', '武义县', '3', '330723');
INSERT INTO `litemall_region` VALUES ('1255', '125', '浦江县', '3', '330726');
INSERT INTO `litemall_region` VALUES ('1256', '125', '磐安县', '3', '330727');
INSERT INTO `litemall_region` VALUES ('1257', '125', '兰溪市', '3', '330781');
INSERT INTO `litemall_region` VALUES ('1258', '125', '义乌市', '3', '330782');
INSERT INTO `litemall_region` VALUES ('1259', '125', '东阳市', '3', '330783');
INSERT INTO `litemall_region` VALUES ('1260', '125', '永康市', '3', '330784');
INSERT INTO `litemall_region` VALUES ('1261', '126', '柯城区', '3', '330802');
INSERT INTO `litemall_region` VALUES ('1262', '126', '衢江区', '3', '330803');
INSERT INTO `litemall_region` VALUES ('1263', '126', '常山县', '3', '330822');
INSERT INTO `litemall_region` VALUES ('1264', '126', '开化县', '3', '330824');
INSERT INTO `litemall_region` VALUES ('1265', '126', '龙游县', '3', '330825');
INSERT INTO `litemall_region` VALUES ('1266', '126', '江山市', '3', '330881');
INSERT INTO `litemall_region` VALUES ('1267', '127', '定海区', '3', '330902');
INSERT INTO `litemall_region` VALUES ('1268', '127', '普陀区', '3', '330903');
INSERT INTO `litemall_region` VALUES ('1269', '127', '岱山县', '3', '330921');
INSERT INTO `litemall_region` VALUES ('1270', '127', '嵊泗县', '3', '330922');
INSERT INTO `litemall_region` VALUES ('1271', '128', '椒江区', '3', '331002');
INSERT INTO `litemall_region` VALUES ('1272', '128', '黄岩区', '3', '331003');
INSERT INTO `litemall_region` VALUES ('1273', '128', '路桥区', '3', '331004');
INSERT INTO `litemall_region` VALUES ('1274', '128', '玉环县', '3', '331021');
INSERT INTO `litemall_region` VALUES ('1275', '128', '三门县', '3', '331022');
INSERT INTO `litemall_region` VALUES ('1276', '128', '天台县', '3', '331023');
INSERT INTO `litemall_region` VALUES ('1277', '128', '仙居县', '3', '331024');
INSERT INTO `litemall_region` VALUES ('1278', '128', '温岭市', '3', '331081');
INSERT INTO `litemall_region` VALUES ('1279', '128', '临海市', '3', '331082');
INSERT INTO `litemall_region` VALUES ('1280', '129', '莲都区', '3', '331102');
INSERT INTO `litemall_region` VALUES ('1281', '129', '青田县', '3', '331121');
INSERT INTO `litemall_region` VALUES ('1282', '129', '缙云县', '3', '331122');
INSERT INTO `litemall_region` VALUES ('1283', '129', '遂昌县', '3', '331123');
INSERT INTO `litemall_region` VALUES ('1284', '129', '松阳县', '3', '331124');
INSERT INTO `litemall_region` VALUES ('1285', '129', '云和县', '3', '331125');
INSERT INTO `litemall_region` VALUES ('1286', '129', '庆元县', '3', '331126');
INSERT INTO `litemall_region` VALUES ('1287', '129', '景宁畲族自治县', '3', '331127');
INSERT INTO `litemall_region` VALUES ('1288', '129', '龙泉市', '3', '331181');
INSERT INTO `litemall_region` VALUES ('1289', '130', '瑶海区', '3', '340102');
INSERT INTO `litemall_region` VALUES ('1290', '130', '庐阳区', '3', '340103');
INSERT INTO `litemall_region` VALUES ('1291', '130', '蜀山区', '3', '340104');
INSERT INTO `litemall_region` VALUES ('1292', '130', '包河区', '3', '340111');
INSERT INTO `litemall_region` VALUES ('1293', '130', '长丰县', '3', '340121');
INSERT INTO `litemall_region` VALUES ('1294', '130', '肥东县', '3', '340122');
INSERT INTO `litemall_region` VALUES ('1295', '130', '肥西县', '3', '340123');
INSERT INTO `litemall_region` VALUES ('1296', '130', '庐江县', '3', '340124');
INSERT INTO `litemall_region` VALUES ('1297', '130', '巢湖市', '3', '340181');
INSERT INTO `litemall_region` VALUES ('1298', '131', '镜湖区', '3', '340202');
INSERT INTO `litemall_region` VALUES ('1299', '131', '弋江区', '3', '340203');
INSERT INTO `litemall_region` VALUES ('1300', '131', '鸠江区', '3', '340207');
INSERT INTO `litemall_region` VALUES ('1301', '131', '三山区', '3', '340208');
INSERT INTO `litemall_region` VALUES ('1302', '131', '芜湖县', '3', '340221');
INSERT INTO `litemall_region` VALUES ('1303', '131', '繁昌县', '3', '340222');
INSERT INTO `litemall_region` VALUES ('1304', '131', '南陵县', '3', '340223');
INSERT INTO `litemall_region` VALUES ('1305', '131', '无为县', '3', '340225');
INSERT INTO `litemall_region` VALUES ('1306', '132', '龙子湖区', '3', '340302');
INSERT INTO `litemall_region` VALUES ('1307', '132', '蚌山区', '3', '340303');
INSERT INTO `litemall_region` VALUES ('1308', '132', '禹会区', '3', '340304');
INSERT INTO `litemall_region` VALUES ('1309', '132', '淮上区', '3', '340311');
INSERT INTO `litemall_region` VALUES ('1310', '132', '怀远县', '3', '340321');
INSERT INTO `litemall_region` VALUES ('1311', '132', '五河县', '3', '340322');
INSERT INTO `litemall_region` VALUES ('1312', '132', '固镇县', '3', '340323');
INSERT INTO `litemall_region` VALUES ('1313', '133', '大通区', '3', '340402');
INSERT INTO `litemall_region` VALUES ('1314', '133', '田家庵区', '3', '340403');
INSERT INTO `litemall_region` VALUES ('1315', '133', '谢家集区', '3', '340404');
INSERT INTO `litemall_region` VALUES ('1316', '133', '八公山区', '3', '340405');
INSERT INTO `litemall_region` VALUES ('1317', '133', '潘集区', '3', '340406');
INSERT INTO `litemall_region` VALUES ('1318', '133', '凤台县', '3', '340421');
INSERT INTO `litemall_region` VALUES ('1319', '133', '寿县', '3', '340422');
INSERT INTO `litemall_region` VALUES ('1320', '134', '花山区', '3', '340503');
INSERT INTO `litemall_region` VALUES ('1321', '134', '雨山区', '3', '340504');
INSERT INTO `litemall_region` VALUES ('1322', '134', '博望区', '3', '340506');
INSERT INTO `litemall_region` VALUES ('1323', '134', '当涂县', '3', '340521');
INSERT INTO `litemall_region` VALUES ('1324', '134', '含山县', '3', '340522');
INSERT INTO `litemall_region` VALUES ('1325', '134', '和县', '3', '340523');
INSERT INTO `litemall_region` VALUES ('1326', '135', '杜集区', '3', '340602');
INSERT INTO `litemall_region` VALUES ('1327', '135', '相山区', '3', '340603');
INSERT INTO `litemall_region` VALUES ('1328', '135', '烈山区', '3', '340604');
INSERT INTO `litemall_region` VALUES ('1329', '135', '濉溪县', '3', '340621');
INSERT INTO `litemall_region` VALUES ('1330', '136', '铜官区', '3', '340705');
INSERT INTO `litemall_region` VALUES ('1331', '136', '义安区', '3', '340706');
INSERT INTO `litemall_region` VALUES ('1332', '136', '郊区', '3', '340711');
INSERT INTO `litemall_region` VALUES ('1333', '136', '枞阳县', '3', '340722');
INSERT INTO `litemall_region` VALUES ('1334', '137', '迎江区', '3', '340802');
INSERT INTO `litemall_region` VALUES ('1335', '137', '大观区', '3', '340803');
INSERT INTO `litemall_region` VALUES ('1336', '137', '宜秀区', '3', '340811');
INSERT INTO `litemall_region` VALUES ('1337', '137', '怀宁县', '3', '340822');
INSERT INTO `litemall_region` VALUES ('1338', '137', '潜山县', '3', '340824');
INSERT INTO `litemall_region` VALUES ('1339', '137', '太湖县', '3', '340825');
INSERT INTO `litemall_region` VALUES ('1340', '137', '宿松县', '3', '340826');
INSERT INTO `litemall_region` VALUES ('1341', '137', '望江县', '3', '340827');
INSERT INTO `litemall_region` VALUES ('1342', '137', '岳西县', '3', '340828');
INSERT INTO `litemall_region` VALUES ('1343', '137', '桐城市', '3', '340881');
INSERT INTO `litemall_region` VALUES ('1344', '138', '屯溪区', '3', '341002');
INSERT INTO `litemall_region` VALUES ('1345', '138', '黄山区', '3', '341003');
INSERT INTO `litemall_region` VALUES ('1346', '138', '徽州区', '3', '341004');
INSERT INTO `litemall_region` VALUES ('1347', '138', '歙县', '3', '341021');
INSERT INTO `litemall_region` VALUES ('1348', '138', '休宁县', '3', '341022');
INSERT INTO `litemall_region` VALUES ('1349', '138', '黟县', '3', '341023');
INSERT INTO `litemall_region` VALUES ('1350', '138', '祁门县', '3', '341024');
INSERT INTO `litemall_region` VALUES ('1351', '139', '琅琊区', '3', '341102');
INSERT INTO `litemall_region` VALUES ('1352', '139', '南谯区', '3', '341103');
INSERT INTO `litemall_region` VALUES ('1353', '139', '来安县', '3', '341122');
INSERT INTO `litemall_region` VALUES ('1354', '139', '全椒县', '3', '341124');
INSERT INTO `litemall_region` VALUES ('1355', '139', '定远县', '3', '341125');
INSERT INTO `litemall_region` VALUES ('1356', '139', '凤阳县', '3', '341126');
INSERT INTO `litemall_region` VALUES ('1357', '139', '天长市', '3', '341181');
INSERT INTO `litemall_region` VALUES ('1358', '139', '明光市', '3', '341182');
INSERT INTO `litemall_region` VALUES ('1359', '140', '颍州区', '3', '341202');
INSERT INTO `litemall_region` VALUES ('1360', '140', '颍东区', '3', '341203');
INSERT INTO `litemall_region` VALUES ('1361', '140', '颍泉区', '3', '341204');
INSERT INTO `litemall_region` VALUES ('1362', '140', '临泉县', '3', '341221');
INSERT INTO `litemall_region` VALUES ('1363', '140', '太和县', '3', '341222');
INSERT INTO `litemall_region` VALUES ('1364', '140', '阜南县', '3', '341225');
INSERT INTO `litemall_region` VALUES ('1365', '140', '颍上县', '3', '341226');
INSERT INTO `litemall_region` VALUES ('1366', '140', '界首市', '3', '341282');
INSERT INTO `litemall_region` VALUES ('1367', '141', '埇桥区', '3', '341302');
INSERT INTO `litemall_region` VALUES ('1368', '141', '砀山县', '3', '341321');
INSERT INTO `litemall_region` VALUES ('1369', '141', '萧县', '3', '341322');
INSERT INTO `litemall_region` VALUES ('1370', '141', '灵璧县', '3', '341323');
INSERT INTO `litemall_region` VALUES ('1371', '141', '泗县', '3', '341324');
INSERT INTO `litemall_region` VALUES ('1372', '142', '金安区', '3', '341502');
INSERT INTO `litemall_region` VALUES ('1373', '142', '裕安区', '3', '341503');
INSERT INTO `litemall_region` VALUES ('1374', '142', '叶集区', '3', '341504');
INSERT INTO `litemall_region` VALUES ('1375', '142', '霍邱县', '3', '341522');
INSERT INTO `litemall_region` VALUES ('1376', '142', '舒城县', '3', '341523');
INSERT INTO `litemall_region` VALUES ('1377', '142', '金寨县', '3', '341524');
INSERT INTO `litemall_region` VALUES ('1378', '142', '霍山县', '3', '341525');
INSERT INTO `litemall_region` VALUES ('1379', '143', '谯城区', '3', '341602');
INSERT INTO `litemall_region` VALUES ('1380', '143', '涡阳县', '3', '341621');
INSERT INTO `litemall_region` VALUES ('1381', '143', '蒙城县', '3', '341622');
INSERT INTO `litemall_region` VALUES ('1382', '143', '利辛县', '3', '341623');
INSERT INTO `litemall_region` VALUES ('1383', '144', '贵池区', '3', '341702');
INSERT INTO `litemall_region` VALUES ('1384', '144', '东至县', '3', '341721');
INSERT INTO `litemall_region` VALUES ('1385', '144', '石台县', '3', '341722');
INSERT INTO `litemall_region` VALUES ('1386', '144', '青阳县', '3', '341723');
INSERT INTO `litemall_region` VALUES ('1387', '145', '宣州区', '3', '341802');
INSERT INTO `litemall_region` VALUES ('1388', '145', '郎溪县', '3', '341821');
INSERT INTO `litemall_region` VALUES ('1389', '145', '广德县', '3', '341822');
INSERT INTO `litemall_region` VALUES ('1390', '145', '泾县', '3', '341823');
INSERT INTO `litemall_region` VALUES ('1391', '145', '绩溪县', '3', '341824');
INSERT INTO `litemall_region` VALUES ('1392', '145', '旌德县', '3', '341825');
INSERT INTO `litemall_region` VALUES ('1393', '145', '宁国市', '3', '341881');
INSERT INTO `litemall_region` VALUES ('1394', '146', '鼓楼区', '3', '350102');
INSERT INTO `litemall_region` VALUES ('1395', '146', '台江区', '3', '350103');
INSERT INTO `litemall_region` VALUES ('1396', '146', '仓山区', '3', '350104');
INSERT INTO `litemall_region` VALUES ('1397', '146', '马尾区', '3', '350105');
INSERT INTO `litemall_region` VALUES ('1398', '146', '晋安区', '3', '350111');
INSERT INTO `litemall_region` VALUES ('1399', '146', '闽侯县', '3', '350121');
INSERT INTO `litemall_region` VALUES ('1400', '146', '连江县', '3', '350122');
INSERT INTO `litemall_region` VALUES ('1401', '146', '罗源县', '3', '350123');
INSERT INTO `litemall_region` VALUES ('1402', '146', '闽清县', '3', '350124');
INSERT INTO `litemall_region` VALUES ('1403', '146', '永泰县', '3', '350125');
INSERT INTO `litemall_region` VALUES ('1404', '146', '平潭县', '3', '350128');
INSERT INTO `litemall_region` VALUES ('1405', '146', '福清市', '3', '350181');
INSERT INTO `litemall_region` VALUES ('1406', '146', '长乐市', '3', '350182');
INSERT INTO `litemall_region` VALUES ('1407', '147', '思明区', '3', '350203');
INSERT INTO `litemall_region` VALUES ('1408', '147', '海沧区', '3', '350205');
INSERT INTO `litemall_region` VALUES ('1409', '147', '湖里区', '3', '350206');
INSERT INTO `litemall_region` VALUES ('1410', '147', '集美区', '3', '350211');
INSERT INTO `litemall_region` VALUES ('1411', '147', '同安区', '3', '350212');
INSERT INTO `litemall_region` VALUES ('1412', '147', '翔安区', '3', '350213');
INSERT INTO `litemall_region` VALUES ('1413', '148', '城厢区', '3', '350302');
INSERT INTO `litemall_region` VALUES ('1414', '148', '涵江区', '3', '350303');
INSERT INTO `litemall_region` VALUES ('1415', '148', '荔城区', '3', '350304');
INSERT INTO `litemall_region` VALUES ('1416', '148', '秀屿区', '3', '350305');
INSERT INTO `litemall_region` VALUES ('1417', '148', '仙游县', '3', '350322');
INSERT INTO `litemall_region` VALUES ('1418', '149', '梅列区', '3', '350402');
INSERT INTO `litemall_region` VALUES ('1419', '149', '三元区', '3', '350403');
INSERT INTO `litemall_region` VALUES ('1420', '149', '明溪县', '3', '350421');
INSERT INTO `litemall_region` VALUES ('1421', '149', '清流县', '3', '350423');
INSERT INTO `litemall_region` VALUES ('1422', '149', '宁化县', '3', '350424');
INSERT INTO `litemall_region` VALUES ('1423', '149', '大田县', '3', '350425');
INSERT INTO `litemall_region` VALUES ('1424', '149', '尤溪县', '3', '350426');
INSERT INTO `litemall_region` VALUES ('1425', '149', '沙县', '3', '350427');
INSERT INTO `litemall_region` VALUES ('1426', '149', '将乐县', '3', '350428');
INSERT INTO `litemall_region` VALUES ('1427', '149', '泰宁县', '3', '350429');
INSERT INTO `litemall_region` VALUES ('1428', '149', '建宁县', '3', '350430');
INSERT INTO `litemall_region` VALUES ('1429', '149', '永安市', '3', '350481');
INSERT INTO `litemall_region` VALUES ('1430', '150', '鲤城区', '3', '350502');
INSERT INTO `litemall_region` VALUES ('1431', '150', '丰泽区', '3', '350503');
INSERT INTO `litemall_region` VALUES ('1432', '150', '洛江区', '3', '350504');
INSERT INTO `litemall_region` VALUES ('1433', '150', '泉港区', '3', '350505');
INSERT INTO `litemall_region` VALUES ('1434', '150', '惠安县', '3', '350521');
INSERT INTO `litemall_region` VALUES ('1435', '150', '安溪县', '3', '350524');
INSERT INTO `litemall_region` VALUES ('1436', '150', '永春县', '3', '350525');
INSERT INTO `litemall_region` VALUES ('1437', '150', '德化县', '3', '350526');
INSERT INTO `litemall_region` VALUES ('1438', '150', '金门县', '3', '350527');
INSERT INTO `litemall_region` VALUES ('1439', '150', '石狮市', '3', '350581');
INSERT INTO `litemall_region` VALUES ('1440', '150', '晋江市', '3', '350582');
INSERT INTO `litemall_region` VALUES ('1441', '150', '南安市', '3', '350583');
INSERT INTO `litemall_region` VALUES ('1442', '151', '芗城区', '3', '350602');
INSERT INTO `litemall_region` VALUES ('1443', '151', '龙文区', '3', '350603');
INSERT INTO `litemall_region` VALUES ('1444', '151', '云霄县', '3', '350622');
INSERT INTO `litemall_region` VALUES ('1445', '151', '漳浦县', '3', '350623');
INSERT INTO `litemall_region` VALUES ('1446', '151', '诏安县', '3', '350624');
INSERT INTO `litemall_region` VALUES ('1447', '151', '长泰县', '3', '350625');
INSERT INTO `litemall_region` VALUES ('1448', '151', '东山县', '3', '350626');
INSERT INTO `litemall_region` VALUES ('1449', '151', '南靖县', '3', '350627');
INSERT INTO `litemall_region` VALUES ('1450', '151', '平和县', '3', '350628');
INSERT INTO `litemall_region` VALUES ('1451', '151', '华安县', '3', '350629');
INSERT INTO `litemall_region` VALUES ('1452', '151', '龙海市', '3', '350681');
INSERT INTO `litemall_region` VALUES ('1453', '152', '延平区', '3', '350702');
INSERT INTO `litemall_region` VALUES ('1454', '152', '建阳区', '3', '350703');
INSERT INTO `litemall_region` VALUES ('1455', '152', '顺昌县', '3', '350721');
INSERT INTO `litemall_region` VALUES ('1456', '152', '浦城县', '3', '350722');
INSERT INTO `litemall_region` VALUES ('1457', '152', '光泽县', '3', '350723');
INSERT INTO `litemall_region` VALUES ('1458', '152', '松溪县', '3', '350724');
INSERT INTO `litemall_region` VALUES ('1459', '152', '政和县', '3', '350725');
INSERT INTO `litemall_region` VALUES ('1460', '152', '邵武市', '3', '350781');
INSERT INTO `litemall_region` VALUES ('1461', '152', '武夷山市', '3', '350782');
INSERT INTO `litemall_region` VALUES ('1462', '152', '建瓯市', '3', '350783');
INSERT INTO `litemall_region` VALUES ('1463', '153', '新罗区', '3', '350802');
INSERT INTO `litemall_region` VALUES ('1464', '153', '永定区', '3', '350803');
INSERT INTO `litemall_region` VALUES ('1465', '153', '长汀县', '3', '350821');
INSERT INTO `litemall_region` VALUES ('1466', '153', '上杭县', '3', '350823');
INSERT INTO `litemall_region` VALUES ('1467', '153', '武平县', '3', '350824');
INSERT INTO `litemall_region` VALUES ('1468', '153', '连城县', '3', '350825');
INSERT INTO `litemall_region` VALUES ('1469', '153', '漳平市', '3', '350881');
INSERT INTO `litemall_region` VALUES ('1470', '154', '蕉城区', '3', '350902');
INSERT INTO `litemall_region` VALUES ('1471', '154', '霞浦县', '3', '350921');
INSERT INTO `litemall_region` VALUES ('1472', '154', '古田县', '3', '350922');
INSERT INTO `litemall_region` VALUES ('1473', '154', '屏南县', '3', '350923');
INSERT INTO `litemall_region` VALUES ('1474', '154', '寿宁县', '3', '350924');
INSERT INTO `litemall_region` VALUES ('1475', '154', '周宁县', '3', '350925');
INSERT INTO `litemall_region` VALUES ('1476', '154', '柘荣县', '3', '350926');
INSERT INTO `litemall_region` VALUES ('1477', '154', '福安市', '3', '350981');
INSERT INTO `litemall_region` VALUES ('1478', '154', '福鼎市', '3', '350982');
INSERT INTO `litemall_region` VALUES ('1479', '155', '东湖区', '3', '360102');
INSERT INTO `litemall_region` VALUES ('1480', '155', '西湖区', '3', '360103');
INSERT INTO `litemall_region` VALUES ('1481', '155', '青云谱区', '3', '360104');
INSERT INTO `litemall_region` VALUES ('1482', '155', '湾里区', '3', '360105');
INSERT INTO `litemall_region` VALUES ('1483', '155', '青山湖区', '3', '360111');
INSERT INTO `litemall_region` VALUES ('1484', '155', '新建区', '3', '360112');
INSERT INTO `litemall_region` VALUES ('1485', '155', '南昌县', '3', '360121');
INSERT INTO `litemall_region` VALUES ('1486', '155', '安义县', '3', '360123');
INSERT INTO `litemall_region` VALUES ('1487', '155', '进贤县', '3', '360124');
INSERT INTO `litemall_region` VALUES ('1488', '156', '昌江区', '3', '360202');
INSERT INTO `litemall_region` VALUES ('1489', '156', '珠山区', '3', '360203');
INSERT INTO `litemall_region` VALUES ('1490', '156', '浮梁县', '3', '360222');
INSERT INTO `litemall_region` VALUES ('1491', '156', '乐平市', '3', '360281');
INSERT INTO `litemall_region` VALUES ('1492', '157', '安源区', '3', '360302');
INSERT INTO `litemall_region` VALUES ('1493', '157', '湘东区', '3', '360313');
INSERT INTO `litemall_region` VALUES ('1494', '157', '莲花县', '3', '360321');
INSERT INTO `litemall_region` VALUES ('1495', '157', '上栗县', '3', '360322');
INSERT INTO `litemall_region` VALUES ('1496', '157', '芦溪县', '3', '360323');
INSERT INTO `litemall_region` VALUES ('1497', '158', '濂溪区', '3', '360402');
INSERT INTO `litemall_region` VALUES ('1498', '158', '浔阳区', '3', '360403');
INSERT INTO `litemall_region` VALUES ('1499', '158', '九江县', '3', '360421');
INSERT INTO `litemall_region` VALUES ('1500', '158', '武宁县', '3', '360423');
INSERT INTO `litemall_region` VALUES ('1501', '158', '修水县', '3', '360424');
INSERT INTO `litemall_region` VALUES ('1502', '158', '永修县', '3', '360425');
INSERT INTO `litemall_region` VALUES ('1503', '158', '德安县', '3', '360426');
INSERT INTO `litemall_region` VALUES ('1504', '158', '都昌县', '3', '360428');
INSERT INTO `litemall_region` VALUES ('1505', '158', '湖口县', '3', '360429');
INSERT INTO `litemall_region` VALUES ('1506', '158', '彭泽县', '3', '360430');
INSERT INTO `litemall_region` VALUES ('1507', '158', '瑞昌市', '3', '360481');
INSERT INTO `litemall_region` VALUES ('1508', '158', '共青城市', '3', '360482');
INSERT INTO `litemall_region` VALUES ('1509', '158', '庐山市', '3', '360483');
INSERT INTO `litemall_region` VALUES ('1510', '159', '渝水区', '3', '360502');
INSERT INTO `litemall_region` VALUES ('1511', '159', '分宜县', '3', '360521');
INSERT INTO `litemall_region` VALUES ('1512', '160', '月湖区', '3', '360602');
INSERT INTO `litemall_region` VALUES ('1513', '160', '余江县', '3', '360622');
INSERT INTO `litemall_region` VALUES ('1514', '160', '贵溪市', '3', '360681');
INSERT INTO `litemall_region` VALUES ('1515', '161', '章贡区', '3', '360702');
INSERT INTO `litemall_region` VALUES ('1516', '161', '南康区', '3', '360703');
INSERT INTO `litemall_region` VALUES ('1517', '161', '赣县', '3', '360721');
INSERT INTO `litemall_region` VALUES ('1518', '161', '信丰县', '3', '360722');
INSERT INTO `litemall_region` VALUES ('1519', '161', '大余县', '3', '360723');
INSERT INTO `litemall_region` VALUES ('1520', '161', '上犹县', '3', '360724');
INSERT INTO `litemall_region` VALUES ('1521', '161', '崇义县', '3', '360725');
INSERT INTO `litemall_region` VALUES ('1522', '161', '安远县', '3', '360726');
INSERT INTO `litemall_region` VALUES ('1523', '161', '龙南县', '3', '360727');
INSERT INTO `litemall_region` VALUES ('1524', '161', '定南县', '3', '360728');
INSERT INTO `litemall_region` VALUES ('1525', '161', '全南县', '3', '360729');
INSERT INTO `litemall_region` VALUES ('1526', '161', '宁都县', '3', '360730');
INSERT INTO `litemall_region` VALUES ('1527', '161', '于都县', '3', '360731');
INSERT INTO `litemall_region` VALUES ('1528', '161', '兴国县', '3', '360732');
INSERT INTO `litemall_region` VALUES ('1529', '161', '会昌县', '3', '360733');
INSERT INTO `litemall_region` VALUES ('1530', '161', '寻乌县', '3', '360734');
INSERT INTO `litemall_region` VALUES ('1531', '161', '石城县', '3', '360735');
INSERT INTO `litemall_region` VALUES ('1532', '161', '瑞金市', '3', '360781');
INSERT INTO `litemall_region` VALUES ('1533', '162', '吉州区', '3', '360802');
INSERT INTO `litemall_region` VALUES ('1534', '162', '青原区', '3', '360803');
INSERT INTO `litemall_region` VALUES ('1535', '162', '吉安县', '3', '360821');
INSERT INTO `litemall_region` VALUES ('1536', '162', '吉水县', '3', '360822');
INSERT INTO `litemall_region` VALUES ('1537', '162', '峡江县', '3', '360823');
INSERT INTO `litemall_region` VALUES ('1538', '162', '新干县', '3', '360824');
INSERT INTO `litemall_region` VALUES ('1539', '162', '永丰县', '3', '360825');
INSERT INTO `litemall_region` VALUES ('1540', '162', '泰和县', '3', '360826');
INSERT INTO `litemall_region` VALUES ('1541', '162', '遂川县', '3', '360827');
INSERT INTO `litemall_region` VALUES ('1542', '162', '万安县', '3', '360828');
INSERT INTO `litemall_region` VALUES ('1543', '162', '安福县', '3', '360829');
INSERT INTO `litemall_region` VALUES ('1544', '162', '永新县', '3', '360830');
INSERT INTO `litemall_region` VALUES ('1545', '162', '井冈山市', '3', '360881');
INSERT INTO `litemall_region` VALUES ('1546', '163', '袁州区', '3', '360902');
INSERT INTO `litemall_region` VALUES ('1547', '163', '奉新县', '3', '360921');
INSERT INTO `litemall_region` VALUES ('1548', '163', '万载县', '3', '360922');
INSERT INTO `litemall_region` VALUES ('1549', '163', '上高县', '3', '360923');
INSERT INTO `litemall_region` VALUES ('1550', '163', '宜丰县', '3', '360924');
INSERT INTO `litemall_region` VALUES ('1551', '163', '靖安县', '3', '360925');
INSERT INTO `litemall_region` VALUES ('1552', '163', '铜鼓县', '3', '360926');
INSERT INTO `litemall_region` VALUES ('1553', '163', '丰城市', '3', '360981');
INSERT INTO `litemall_region` VALUES ('1554', '163', '樟树市', '3', '360982');
INSERT INTO `litemall_region` VALUES ('1555', '163', '高安市', '3', '360983');
INSERT INTO `litemall_region` VALUES ('1556', '164', '临川区', '3', '361002');
INSERT INTO `litemall_region` VALUES ('1557', '164', '南城县', '3', '361021');
INSERT INTO `litemall_region` VALUES ('1558', '164', '黎川县', '3', '361022');
INSERT INTO `litemall_region` VALUES ('1559', '164', '南丰县', '3', '361023');
INSERT INTO `litemall_region` VALUES ('1560', '164', '崇仁县', '3', '361024');
INSERT INTO `litemall_region` VALUES ('1561', '164', '乐安县', '3', '361025');
INSERT INTO `litemall_region` VALUES ('1562', '164', '宜黄县', '3', '361026');
INSERT INTO `litemall_region` VALUES ('1563', '164', '金溪县', '3', '361027');
INSERT INTO `litemall_region` VALUES ('1564', '164', '资溪县', '3', '361028');
INSERT INTO `litemall_region` VALUES ('1565', '164', '东乡县', '3', '361029');
INSERT INTO `litemall_region` VALUES ('1566', '164', '广昌县', '3', '361030');
INSERT INTO `litemall_region` VALUES ('1567', '165', '信州区', '3', '361102');
INSERT INTO `litemall_region` VALUES ('1568', '165', '广丰区', '3', '361103');
INSERT INTO `litemall_region` VALUES ('1569', '165', '上饶县', '3', '361121');
INSERT INTO `litemall_region` VALUES ('1570', '165', '玉山县', '3', '361123');
INSERT INTO `litemall_region` VALUES ('1571', '165', '铅山县', '3', '361124');
INSERT INTO `litemall_region` VALUES ('1572', '165', '横峰县', '3', '361125');
INSERT INTO `litemall_region` VALUES ('1573', '165', '弋阳县', '3', '361126');
INSERT INTO `litemall_region` VALUES ('1574', '165', '余干县', '3', '361127');
INSERT INTO `litemall_region` VALUES ('1575', '165', '鄱阳县', '3', '361128');
INSERT INTO `litemall_region` VALUES ('1576', '165', '万年县', '3', '361129');
INSERT INTO `litemall_region` VALUES ('1577', '165', '婺源县', '3', '361130');
INSERT INTO `litemall_region` VALUES ('1578', '165', '德兴市', '3', '361181');
INSERT INTO `litemall_region` VALUES ('1579', '166', '历下区', '3', '370102');
INSERT INTO `litemall_region` VALUES ('1580', '166', '市中区', '3', '370103');
INSERT INTO `litemall_region` VALUES ('1581', '166', '槐荫区', '3', '370104');
INSERT INTO `litemall_region` VALUES ('1582', '166', '天桥区', '3', '370105');
INSERT INTO `litemall_region` VALUES ('1583', '166', '历城区', '3', '370112');
INSERT INTO `litemall_region` VALUES ('1584', '166', '长清区', '3', '370113');
INSERT INTO `litemall_region` VALUES ('1585', '166', '平阴县', '3', '370124');
INSERT INTO `litemall_region` VALUES ('1586', '166', '济阳县', '3', '370125');
INSERT INTO `litemall_region` VALUES ('1587', '166', '商河县', '3', '370126');
INSERT INTO `litemall_region` VALUES ('1588', '166', '章丘市', '3', '370181');
INSERT INTO `litemall_region` VALUES ('1589', '167', '市南区', '3', '370202');
INSERT INTO `litemall_region` VALUES ('1590', '167', '市北区', '3', '370203');
INSERT INTO `litemall_region` VALUES ('1591', '167', '黄岛区', '3', '370211');
INSERT INTO `litemall_region` VALUES ('1592', '167', '崂山区', '3', '370212');
INSERT INTO `litemall_region` VALUES ('1593', '167', '李沧区', '3', '370213');
INSERT INTO `litemall_region` VALUES ('1594', '167', '城阳区', '3', '370214');
INSERT INTO `litemall_region` VALUES ('1595', '167', '胶州市', '3', '370281');
INSERT INTO `litemall_region` VALUES ('1596', '167', '即墨市', '3', '370282');
INSERT INTO `litemall_region` VALUES ('1597', '167', '平度市', '3', '370283');
INSERT INTO `litemall_region` VALUES ('1598', '167', '莱西市', '3', '370285');
INSERT INTO `litemall_region` VALUES ('1599', '168', '淄川区', '3', '370302');
INSERT INTO `litemall_region` VALUES ('1600', '168', '张店区', '3', '370303');
INSERT INTO `litemall_region` VALUES ('1601', '168', '博山区', '3', '370304');
INSERT INTO `litemall_region` VALUES ('1602', '168', '临淄区', '3', '370305');
INSERT INTO `litemall_region` VALUES ('1603', '168', '周村区', '3', '370306');
INSERT INTO `litemall_region` VALUES ('1604', '168', '桓台县', '3', '370321');
INSERT INTO `litemall_region` VALUES ('1605', '168', '高青县', '3', '370322');
INSERT INTO `litemall_region` VALUES ('1606', '168', '沂源县', '3', '370323');
INSERT INTO `litemall_region` VALUES ('1607', '169', '市中区', '3', '370402');
INSERT INTO `litemall_region` VALUES ('1608', '169', '薛城区', '3', '370403');
INSERT INTO `litemall_region` VALUES ('1609', '169', '峄城区', '3', '370404');
INSERT INTO `litemall_region` VALUES ('1610', '169', '台儿庄区', '3', '370405');
INSERT INTO `litemall_region` VALUES ('1611', '169', '山亭区', '3', '370406');
INSERT INTO `litemall_region` VALUES ('1612', '169', '滕州市', '3', '370481');
INSERT INTO `litemall_region` VALUES ('1613', '170', '东营区', '3', '370502');
INSERT INTO `litemall_region` VALUES ('1614', '170', '河口区', '3', '370503');
INSERT INTO `litemall_region` VALUES ('1615', '170', '垦利区', '3', '370505');
INSERT INTO `litemall_region` VALUES ('1616', '170', '利津县', '3', '370522');
INSERT INTO `litemall_region` VALUES ('1617', '170', '广饶县', '3', '370523');
INSERT INTO `litemall_region` VALUES ('1618', '171', '芝罘区', '3', '370602');
INSERT INTO `litemall_region` VALUES ('1619', '171', '福山区', '3', '370611');
INSERT INTO `litemall_region` VALUES ('1620', '171', '牟平区', '3', '370612');
INSERT INTO `litemall_region` VALUES ('1621', '171', '莱山区', '3', '370613');
INSERT INTO `litemall_region` VALUES ('1622', '171', '长岛县', '3', '370634');
INSERT INTO `litemall_region` VALUES ('1623', '171', '龙口市', '3', '370681');
INSERT INTO `litemall_region` VALUES ('1624', '171', '莱阳市', '3', '370682');
INSERT INTO `litemall_region` VALUES ('1625', '171', '莱州市', '3', '370683');
INSERT INTO `litemall_region` VALUES ('1626', '171', '蓬莱市', '3', '370684');
INSERT INTO `litemall_region` VALUES ('1627', '171', '招远市', '3', '370685');
INSERT INTO `litemall_region` VALUES ('1628', '171', '栖霞市', '3', '370686');
INSERT INTO `litemall_region` VALUES ('1629', '171', '海阳市', '3', '370687');
INSERT INTO `litemall_region` VALUES ('1630', '172', '潍城区', '3', '370702');
INSERT INTO `litemall_region` VALUES ('1631', '172', '寒亭区', '3', '370703');
INSERT INTO `litemall_region` VALUES ('1632', '172', '坊子区', '3', '370704');
INSERT INTO `litemall_region` VALUES ('1633', '172', '奎文区', '3', '370705');
INSERT INTO `litemall_region` VALUES ('1634', '172', '临朐县', '3', '370724');
INSERT INTO `litemall_region` VALUES ('1635', '172', '昌乐县', '3', '370725');
INSERT INTO `litemall_region` VALUES ('1636', '172', '青州市', '3', '370781');
INSERT INTO `litemall_region` VALUES ('1637', '172', '诸城市', '3', '370782');
INSERT INTO `litemall_region` VALUES ('1638', '172', '寿光市', '3', '370783');
INSERT INTO `litemall_region` VALUES ('1639', '172', '安丘市', '3', '370784');
INSERT INTO `litemall_region` VALUES ('1640', '172', '高密市', '3', '370785');
INSERT INTO `litemall_region` VALUES ('1641', '172', '昌邑市', '3', '370786');
INSERT INTO `litemall_region` VALUES ('1642', '173', '任城区', '3', '370811');
INSERT INTO `litemall_region` VALUES ('1643', '173', '兖州区', '3', '370812');
INSERT INTO `litemall_region` VALUES ('1644', '173', '微山县', '3', '370826');
INSERT INTO `litemall_region` VALUES ('1645', '173', '鱼台县', '3', '370827');
INSERT INTO `litemall_region` VALUES ('1646', '173', '金乡县', '3', '370828');
INSERT INTO `litemall_region` VALUES ('1647', '173', '嘉祥县', '3', '370829');
INSERT INTO `litemall_region` VALUES ('1648', '173', '汶上县', '3', '370830');
INSERT INTO `litemall_region` VALUES ('1649', '173', '泗水县', '3', '370831');
INSERT INTO `litemall_region` VALUES ('1650', '173', '梁山县', '3', '370832');
INSERT INTO `litemall_region` VALUES ('1651', '173', '曲阜市', '3', '370881');
INSERT INTO `litemall_region` VALUES ('1652', '173', '邹城市', '3', '370883');
INSERT INTO `litemall_region` VALUES ('1653', '174', '泰山区', '3', '370902');
INSERT INTO `litemall_region` VALUES ('1654', '174', '岱岳区', '3', '370911');
INSERT INTO `litemall_region` VALUES ('1655', '174', '宁阳县', '3', '370921');
INSERT INTO `litemall_region` VALUES ('1656', '174', '东平县', '3', '370923');
INSERT INTO `litemall_region` VALUES ('1657', '174', '新泰市', '3', '370982');
INSERT INTO `litemall_region` VALUES ('1658', '174', '肥城市', '3', '370983');
INSERT INTO `litemall_region` VALUES ('1659', '175', '环翠区', '3', '371002');
INSERT INTO `litemall_region` VALUES ('1660', '175', '文登区', '3', '371003');
INSERT INTO `litemall_region` VALUES ('1661', '175', '荣成市', '3', '371082');
INSERT INTO `litemall_region` VALUES ('1662', '175', '乳山市', '3', '371083');
INSERT INTO `litemall_region` VALUES ('1663', '176', '东港区', '3', '371102');
INSERT INTO `litemall_region` VALUES ('1664', '176', '岚山区', '3', '371103');
INSERT INTO `litemall_region` VALUES ('1665', '176', '五莲县', '3', '371121');
INSERT INTO `litemall_region` VALUES ('1666', '176', '莒县', '3', '371122');
INSERT INTO `litemall_region` VALUES ('1667', '177', '莱城区', '3', '371202');
INSERT INTO `litemall_region` VALUES ('1668', '177', '钢城区', '3', '371203');
INSERT INTO `litemall_region` VALUES ('1669', '178', '兰山区', '3', '371302');
INSERT INTO `litemall_region` VALUES ('1670', '178', '罗庄区', '3', '371311');
INSERT INTO `litemall_region` VALUES ('1671', '178', '河东区', '3', '371312');
INSERT INTO `litemall_region` VALUES ('1672', '178', '沂南县', '3', '371321');
INSERT INTO `litemall_region` VALUES ('1673', '178', '郯城县', '3', '371322');
INSERT INTO `litemall_region` VALUES ('1674', '178', '沂水县', '3', '371323');
INSERT INTO `litemall_region` VALUES ('1675', '178', '兰陵县', '3', '371324');
INSERT INTO `litemall_region` VALUES ('1676', '178', '费县', '3', '371325');
INSERT INTO `litemall_region` VALUES ('1677', '178', '平邑县', '3', '371326');
INSERT INTO `litemall_region` VALUES ('1678', '178', '莒南县', '3', '371327');
INSERT INTO `litemall_region` VALUES ('1679', '178', '蒙阴县', '3', '371328');
INSERT INTO `litemall_region` VALUES ('1680', '178', '临沭县', '3', '371329');
INSERT INTO `litemall_region` VALUES ('1681', '179', '德城区', '3', '371402');
INSERT INTO `litemall_region` VALUES ('1682', '179', '陵城区', '3', '371403');
INSERT INTO `litemall_region` VALUES ('1683', '179', '宁津县', '3', '371422');
INSERT INTO `litemall_region` VALUES ('1684', '179', '庆云县', '3', '371423');
INSERT INTO `litemall_region` VALUES ('1685', '179', '临邑县', '3', '371424');
INSERT INTO `litemall_region` VALUES ('1686', '179', '齐河县', '3', '371425');
INSERT INTO `litemall_region` VALUES ('1687', '179', '平原县', '3', '371426');
INSERT INTO `litemall_region` VALUES ('1688', '179', '夏津县', '3', '371427');
INSERT INTO `litemall_region` VALUES ('1689', '179', '武城县', '3', '371428');
INSERT INTO `litemall_region` VALUES ('1690', '179', '乐陵市', '3', '371481');
INSERT INTO `litemall_region` VALUES ('1691', '179', '禹城市', '3', '371482');
INSERT INTO `litemall_region` VALUES ('1692', '180', '东昌府区', '3', '371502');
INSERT INTO `litemall_region` VALUES ('1693', '180', '阳谷县', '3', '371521');
INSERT INTO `litemall_region` VALUES ('1694', '180', '莘县', '3', '371522');
INSERT INTO `litemall_region` VALUES ('1695', '180', '茌平县', '3', '371523');
INSERT INTO `litemall_region` VALUES ('1696', '180', '东阿县', '3', '371524');
INSERT INTO `litemall_region` VALUES ('1697', '180', '冠县', '3', '371525');
INSERT INTO `litemall_region` VALUES ('1698', '180', '高唐县', '3', '371526');
INSERT INTO `litemall_region` VALUES ('1699', '180', '临清市', '3', '371581');
INSERT INTO `litemall_region` VALUES ('1700', '181', '滨城区', '3', '371602');
INSERT INTO `litemall_region` VALUES ('1701', '181', '沾化区', '3', '371603');
INSERT INTO `litemall_region` VALUES ('1702', '181', '惠民县', '3', '371621');
INSERT INTO `litemall_region` VALUES ('1703', '181', '阳信县', '3', '371622');
INSERT INTO `litemall_region` VALUES ('1704', '181', '无棣县', '3', '371623');
INSERT INTO `litemall_region` VALUES ('1705', '181', '博兴县', '3', '371625');
INSERT INTO `litemall_region` VALUES ('1706', '181', '邹平县', '3', '371626');
INSERT INTO `litemall_region` VALUES ('1707', '182', '牡丹区', '3', '371702');
INSERT INTO `litemall_region` VALUES ('1708', '182', '定陶区', '3', '371703');
INSERT INTO `litemall_region` VALUES ('1709', '182', '曹县', '3', '371721');
INSERT INTO `litemall_region` VALUES ('1710', '182', '单县', '3', '371722');
INSERT INTO `litemall_region` VALUES ('1711', '182', '成武县', '3', '371723');
INSERT INTO `litemall_region` VALUES ('1712', '182', '巨野县', '3', '371724');
INSERT INTO `litemall_region` VALUES ('1713', '182', '郓城县', '3', '371725');
INSERT INTO `litemall_region` VALUES ('1714', '182', '鄄城县', '3', '371726');
INSERT INTO `litemall_region` VALUES ('1715', '182', '东明县', '3', '371728');
INSERT INTO `litemall_region` VALUES ('1716', '183', '中原区', '3', '410102');
INSERT INTO `litemall_region` VALUES ('1717', '183', '二七区', '3', '410103');
INSERT INTO `litemall_region` VALUES ('1718', '183', '管城回族区', '3', '410104');
INSERT INTO `litemall_region` VALUES ('1719', '183', '金水区', '3', '410105');
INSERT INTO `litemall_region` VALUES ('1720', '183', '上街区', '3', '410106');
INSERT INTO `litemall_region` VALUES ('1721', '183', '惠济区', '3', '410108');
INSERT INTO `litemall_region` VALUES ('1722', '183', '中牟县', '3', '410122');
INSERT INTO `litemall_region` VALUES ('1723', '183', '巩义市', '3', '410181');
INSERT INTO `litemall_region` VALUES ('1724', '183', '荥阳市', '3', '410182');
INSERT INTO `litemall_region` VALUES ('1725', '183', '新密市', '3', '410183');
INSERT INTO `litemall_region` VALUES ('1726', '183', '新郑市', '3', '410184');
INSERT INTO `litemall_region` VALUES ('1727', '183', '登封市', '3', '410185');
INSERT INTO `litemall_region` VALUES ('1728', '184', '龙亭区', '3', '410202');
INSERT INTO `litemall_region` VALUES ('1729', '184', '顺河回族区', '3', '410203');
INSERT INTO `litemall_region` VALUES ('1730', '184', '鼓楼区', '3', '410204');
INSERT INTO `litemall_region` VALUES ('1731', '184', '禹王台区', '3', '410205');
INSERT INTO `litemall_region` VALUES ('1732', '184', '金明区', '3', '410211');
INSERT INTO `litemall_region` VALUES ('1733', '184', '祥符区', '3', '410212');
INSERT INTO `litemall_region` VALUES ('1734', '184', '杞县', '3', '410221');
INSERT INTO `litemall_region` VALUES ('1735', '184', '通许县', '3', '410222');
INSERT INTO `litemall_region` VALUES ('1736', '184', '尉氏县', '3', '410223');
INSERT INTO `litemall_region` VALUES ('1737', '184', '兰考县', '3', '410225');
INSERT INTO `litemall_region` VALUES ('1738', '185', '老城区', '3', '410302');
INSERT INTO `litemall_region` VALUES ('1739', '185', '西工区', '3', '410303');
INSERT INTO `litemall_region` VALUES ('1740', '185', '瀍河回族区', '3', '410304');
INSERT INTO `litemall_region` VALUES ('1741', '185', '涧西区', '3', '410305');
INSERT INTO `litemall_region` VALUES ('1742', '185', '吉利区', '3', '410306');
INSERT INTO `litemall_region` VALUES ('1743', '185', '洛龙区', '3', '410311');
INSERT INTO `litemall_region` VALUES ('1744', '185', '孟津县', '3', '410322');
INSERT INTO `litemall_region` VALUES ('1745', '185', '新安县', '3', '410323');
INSERT INTO `litemall_region` VALUES ('1746', '185', '栾川县', '3', '410324');
INSERT INTO `litemall_region` VALUES ('1747', '185', '嵩县', '3', '410325');
INSERT INTO `litemall_region` VALUES ('1748', '185', '汝阳县', '3', '410326');
INSERT INTO `litemall_region` VALUES ('1749', '185', '宜阳县', '3', '410327');
INSERT INTO `litemall_region` VALUES ('1750', '185', '洛宁县', '3', '410328');
INSERT INTO `litemall_region` VALUES ('1751', '185', '伊川县', '3', '410329');
INSERT INTO `litemall_region` VALUES ('1752', '185', '偃师市', '3', '410381');
INSERT INTO `litemall_region` VALUES ('1753', '186', '新华区', '3', '410402');
INSERT INTO `litemall_region` VALUES ('1754', '186', '卫东区', '3', '410403');
INSERT INTO `litemall_region` VALUES ('1755', '186', '石龙区', '3', '410404');
INSERT INTO `litemall_region` VALUES ('1756', '186', '湛河区', '3', '410411');
INSERT INTO `litemall_region` VALUES ('1757', '186', '宝丰县', '3', '410421');
INSERT INTO `litemall_region` VALUES ('1758', '186', '叶县', '3', '410422');
INSERT INTO `litemall_region` VALUES ('1759', '186', '鲁山县', '3', '410423');
INSERT INTO `litemall_region` VALUES ('1760', '186', '郏县', '3', '410425');
INSERT INTO `litemall_region` VALUES ('1761', '186', '舞钢市', '3', '410481');
INSERT INTO `litemall_region` VALUES ('1762', '186', '汝州市', '3', '410482');
INSERT INTO `litemall_region` VALUES ('1763', '187', '文峰区', '3', '410502');
INSERT INTO `litemall_region` VALUES ('1764', '187', '北关区', '3', '410503');
INSERT INTO `litemall_region` VALUES ('1765', '187', '殷都区', '3', '410505');
INSERT INTO `litemall_region` VALUES ('1766', '187', '龙安区', '3', '410506');
INSERT INTO `litemall_region` VALUES ('1767', '187', '安阳县', '3', '410522');
INSERT INTO `litemall_region` VALUES ('1768', '187', '汤阴县', '3', '410523');
INSERT INTO `litemall_region` VALUES ('1769', '187', '滑县', '3', '410526');
INSERT INTO `litemall_region` VALUES ('1770', '187', '内黄县', '3', '410527');
INSERT INTO `litemall_region` VALUES ('1771', '187', '林州市', '3', '410581');
INSERT INTO `litemall_region` VALUES ('1772', '188', '鹤山区', '3', '410602');
INSERT INTO `litemall_region` VALUES ('1773', '188', '山城区', '3', '410603');
INSERT INTO `litemall_region` VALUES ('1774', '188', '淇滨区', '3', '410611');
INSERT INTO `litemall_region` VALUES ('1775', '188', '浚县', '3', '410621');
INSERT INTO `litemall_region` VALUES ('1776', '188', '淇县', '3', '410622');
INSERT INTO `litemall_region` VALUES ('1777', '189', '红旗区', '3', '410702');
INSERT INTO `litemall_region` VALUES ('1778', '189', '卫滨区', '3', '410703');
INSERT INTO `litemall_region` VALUES ('1779', '189', '凤泉区', '3', '410704');
INSERT INTO `litemall_region` VALUES ('1780', '189', '牧野区', '3', '410711');
INSERT INTO `litemall_region` VALUES ('1781', '189', '新乡县', '3', '410721');
INSERT INTO `litemall_region` VALUES ('1782', '189', '获嘉县', '3', '410724');
INSERT INTO `litemall_region` VALUES ('1783', '189', '原阳县', '3', '410725');
INSERT INTO `litemall_region` VALUES ('1784', '189', '延津县', '3', '410726');
INSERT INTO `litemall_region` VALUES ('1785', '189', '封丘县', '3', '410727');
INSERT INTO `litemall_region` VALUES ('1786', '189', '长垣县', '3', '410728');
INSERT INTO `litemall_region` VALUES ('1787', '189', '卫辉市', '3', '410781');
INSERT INTO `litemall_region` VALUES ('1788', '189', '辉县市', '3', '410782');
INSERT INTO `litemall_region` VALUES ('1789', '190', '解放区', '3', '410802');
INSERT INTO `litemall_region` VALUES ('1790', '190', '中站区', '3', '410803');
INSERT INTO `litemall_region` VALUES ('1791', '190', '马村区', '3', '410804');
INSERT INTO `litemall_region` VALUES ('1792', '190', '山阳区', '3', '410811');
INSERT INTO `litemall_region` VALUES ('1793', '190', '修武县', '3', '410821');
INSERT INTO `litemall_region` VALUES ('1794', '190', '博爱县', '3', '410822');
INSERT INTO `litemall_region` VALUES ('1795', '190', '武陟县', '3', '410823');
INSERT INTO `litemall_region` VALUES ('1796', '190', '温县', '3', '410825');
INSERT INTO `litemall_region` VALUES ('1797', '190', '沁阳市', '3', '410882');
INSERT INTO `litemall_region` VALUES ('1798', '190', '孟州市', '3', '410883');
INSERT INTO `litemall_region` VALUES ('1799', '191', '华龙区', '3', '410902');
INSERT INTO `litemall_region` VALUES ('1800', '191', '清丰县', '3', '410922');
INSERT INTO `litemall_region` VALUES ('1801', '191', '南乐县', '3', '410923');
INSERT INTO `litemall_region` VALUES ('1802', '191', '范县', '3', '410926');
INSERT INTO `litemall_region` VALUES ('1803', '191', '台前县', '3', '410927');
INSERT INTO `litemall_region` VALUES ('1804', '191', '濮阳县', '3', '410928');
INSERT INTO `litemall_region` VALUES ('1805', '192', '魏都区', '3', '411002');
INSERT INTO `litemall_region` VALUES ('1806', '192', '许昌县', '3', '411023');
INSERT INTO `litemall_region` VALUES ('1807', '192', '鄢陵县', '3', '411024');
INSERT INTO `litemall_region` VALUES ('1808', '192', '襄城县', '3', '411025');
INSERT INTO `litemall_region` VALUES ('1809', '192', '禹州市', '3', '411081');
INSERT INTO `litemall_region` VALUES ('1810', '192', '长葛市', '3', '411082');
INSERT INTO `litemall_region` VALUES ('1811', '193', '源汇区', '3', '411102');
INSERT INTO `litemall_region` VALUES ('1812', '193', '郾城区', '3', '411103');
INSERT INTO `litemall_region` VALUES ('1813', '193', '召陵区', '3', '411104');
INSERT INTO `litemall_region` VALUES ('1814', '193', '舞阳县', '3', '411121');
INSERT INTO `litemall_region` VALUES ('1815', '193', '临颍县', '3', '411122');
INSERT INTO `litemall_region` VALUES ('1816', '194', '湖滨区', '3', '411202');
INSERT INTO `litemall_region` VALUES ('1817', '194', '陕州区', '3', '411203');
INSERT INTO `litemall_region` VALUES ('1818', '194', '渑池县', '3', '411221');
INSERT INTO `litemall_region` VALUES ('1819', '194', '卢氏县', '3', '411224');
INSERT INTO `litemall_region` VALUES ('1820', '194', '义马市', '3', '411281');
INSERT INTO `litemall_region` VALUES ('1821', '194', '灵宝市', '3', '411282');
INSERT INTO `litemall_region` VALUES ('1822', '195', '宛城区', '3', '411302');
INSERT INTO `litemall_region` VALUES ('1823', '195', '卧龙区', '3', '411303');
INSERT INTO `litemall_region` VALUES ('1824', '195', '南召县', '3', '411321');
INSERT INTO `litemall_region` VALUES ('1825', '195', '方城县', '3', '411322');
INSERT INTO `litemall_region` VALUES ('1826', '195', '西峡县', '3', '411323');
INSERT INTO `litemall_region` VALUES ('1827', '195', '镇平县', '3', '411324');
INSERT INTO `litemall_region` VALUES ('1828', '195', '内乡县', '3', '411325');
INSERT INTO `litemall_region` VALUES ('1829', '195', '淅川县', '3', '411326');
INSERT INTO `litemall_region` VALUES ('1830', '195', '社旗县', '3', '411327');
INSERT INTO `litemall_region` VALUES ('1831', '195', '唐河县', '3', '411328');
INSERT INTO `litemall_region` VALUES ('1832', '195', '新野县', '3', '411329');
INSERT INTO `litemall_region` VALUES ('1833', '195', '桐柏县', '3', '411330');
INSERT INTO `litemall_region` VALUES ('1834', '195', '邓州市', '3', '411381');
INSERT INTO `litemall_region` VALUES ('1835', '196', '梁园区', '3', '411402');
INSERT INTO `litemall_region` VALUES ('1836', '196', '睢阳区', '3', '411403');
INSERT INTO `litemall_region` VALUES ('1837', '196', '民权县', '3', '411421');
INSERT INTO `litemall_region` VALUES ('1838', '196', '睢县', '3', '411422');
INSERT INTO `litemall_region` VALUES ('1839', '196', '宁陵县', '3', '411423');
INSERT INTO `litemall_region` VALUES ('1840', '196', '柘城县', '3', '411424');
INSERT INTO `litemall_region` VALUES ('1841', '196', '虞城县', '3', '411425');
INSERT INTO `litemall_region` VALUES ('1842', '196', '夏邑县', '3', '411426');
INSERT INTO `litemall_region` VALUES ('1843', '196', '永城市', '3', '411481');
INSERT INTO `litemall_region` VALUES ('1844', '197', '浉河区', '3', '411502');
INSERT INTO `litemall_region` VALUES ('1845', '197', '平桥区', '3', '411503');
INSERT INTO `litemall_region` VALUES ('1846', '197', '罗山县', '3', '411521');
INSERT INTO `litemall_region` VALUES ('1847', '197', '光山县', '3', '411522');
INSERT INTO `litemall_region` VALUES ('1848', '197', '新县', '3', '411523');
INSERT INTO `litemall_region` VALUES ('1849', '197', '商城县', '3', '411524');
INSERT INTO `litemall_region` VALUES ('1850', '197', '固始县', '3', '411525');
INSERT INTO `litemall_region` VALUES ('1851', '197', '潢川县', '3', '411526');
INSERT INTO `litemall_region` VALUES ('1852', '197', '淮滨县', '3', '411527');
INSERT INTO `litemall_region` VALUES ('1853', '197', '息县', '3', '411528');
INSERT INTO `litemall_region` VALUES ('1854', '198', '川汇区', '3', '411602');
INSERT INTO `litemall_region` VALUES ('1855', '198', '扶沟县', '3', '411621');
INSERT INTO `litemall_region` VALUES ('1856', '198', '西华县', '3', '411622');
INSERT INTO `litemall_region` VALUES ('1857', '198', '商水县', '3', '411623');
INSERT INTO `litemall_region` VALUES ('1858', '198', '沈丘县', '3', '411624');
INSERT INTO `litemall_region` VALUES ('1859', '198', '郸城县', '3', '411625');
INSERT INTO `litemall_region` VALUES ('1860', '198', '淮阳县', '3', '411626');
INSERT INTO `litemall_region` VALUES ('1861', '198', '太康县', '3', '411627');
INSERT INTO `litemall_region` VALUES ('1862', '198', '鹿邑县', '3', '411628');
INSERT INTO `litemall_region` VALUES ('1863', '198', '项城市', '3', '411681');
INSERT INTO `litemall_region` VALUES ('1864', '199', '驿城区', '3', '411702');
INSERT INTO `litemall_region` VALUES ('1865', '199', '西平县', '3', '411721');
INSERT INTO `litemall_region` VALUES ('1866', '199', '上蔡县', '3', '411722');
INSERT INTO `litemall_region` VALUES ('1867', '199', '平舆县', '3', '411723');
INSERT INTO `litemall_region` VALUES ('1868', '199', '正阳县', '3', '411724');
INSERT INTO `litemall_region` VALUES ('1869', '199', '确山县', '3', '411725');
INSERT INTO `litemall_region` VALUES ('1870', '199', '泌阳县', '3', '411726');
INSERT INTO `litemall_region` VALUES ('1871', '199', '汝南县', '3', '411727');
INSERT INTO `litemall_region` VALUES ('1872', '199', '遂平县', '3', '411728');
INSERT INTO `litemall_region` VALUES ('1873', '199', '新蔡县', '3', '411729');
INSERT INTO `litemall_region` VALUES ('1874', '200', '济源市', '3', '419001');
INSERT INTO `litemall_region` VALUES ('1875', '201', '江岸区', '3', '420102');
INSERT INTO `litemall_region` VALUES ('1876', '201', '江汉区', '3', '420103');
INSERT INTO `litemall_region` VALUES ('1877', '201', '硚口区', '3', '420104');
INSERT INTO `litemall_region` VALUES ('1878', '201', '汉阳区', '3', '420105');
INSERT INTO `litemall_region` VALUES ('1879', '201', '武昌区', '3', '420106');
INSERT INTO `litemall_region` VALUES ('1880', '201', '青山区', '3', '420107');
INSERT INTO `litemall_region` VALUES ('1881', '201', '洪山区', '3', '420111');
INSERT INTO `litemall_region` VALUES ('1882', '201', '东西湖区', '3', '420112');
INSERT INTO `litemall_region` VALUES ('1883', '201', '汉南区', '3', '420113');
INSERT INTO `litemall_region` VALUES ('1884', '201', '蔡甸区', '3', '420114');
INSERT INTO `litemall_region` VALUES ('1885', '201', '江夏区', '3', '420115');
INSERT INTO `litemall_region` VALUES ('1886', '201', '黄陂区', '3', '420116');
INSERT INTO `litemall_region` VALUES ('1887', '201', '新洲区', '3', '420117');
INSERT INTO `litemall_region` VALUES ('1888', '202', '黄石港区', '3', '420202');
INSERT INTO `litemall_region` VALUES ('1889', '202', '西塞山区', '3', '420203');
INSERT INTO `litemall_region` VALUES ('1890', '202', '下陆区', '3', '420204');
INSERT INTO `litemall_region` VALUES ('1891', '202', '铁山区', '3', '420205');
INSERT INTO `litemall_region` VALUES ('1892', '202', '阳新县', '3', '420222');
INSERT INTO `litemall_region` VALUES ('1893', '202', '大冶市', '3', '420281');
INSERT INTO `litemall_region` VALUES ('1894', '203', '茅箭区', '3', '420302');
INSERT INTO `litemall_region` VALUES ('1895', '203', '张湾区', '3', '420303');
INSERT INTO `litemall_region` VALUES ('1896', '203', '郧阳区', '3', '420304');
INSERT INTO `litemall_region` VALUES ('1897', '203', '郧西县', '3', '420322');
INSERT INTO `litemall_region` VALUES ('1898', '203', '竹山县', '3', '420323');
INSERT INTO `litemall_region` VALUES ('1899', '203', '竹溪县', '3', '420324');
INSERT INTO `litemall_region` VALUES ('1900', '203', '房县', '3', '420325');
INSERT INTO `litemall_region` VALUES ('1901', '203', '丹江口市', '3', '420381');
INSERT INTO `litemall_region` VALUES ('1902', '204', '西陵区', '3', '420502');
INSERT INTO `litemall_region` VALUES ('1903', '204', '伍家岗区', '3', '420503');
INSERT INTO `litemall_region` VALUES ('1904', '204', '点军区', '3', '420504');
INSERT INTO `litemall_region` VALUES ('1905', '204', '猇亭区', '3', '420505');
INSERT INTO `litemall_region` VALUES ('1906', '204', '夷陵区', '3', '420506');
INSERT INTO `litemall_region` VALUES ('1907', '204', '远安县', '3', '420525');
INSERT INTO `litemall_region` VALUES ('1908', '204', '兴山县', '3', '420526');
INSERT INTO `litemall_region` VALUES ('1909', '204', '秭归县', '3', '420527');
INSERT INTO `litemall_region` VALUES ('1910', '204', '长阳土家族自治县', '3', '420528');
INSERT INTO `litemall_region` VALUES ('1911', '204', '五峰土家族自治县', '3', '420529');
INSERT INTO `litemall_region` VALUES ('1912', '204', '宜都市', '3', '420581');
INSERT INTO `litemall_region` VALUES ('1913', '204', '当阳市', '3', '420582');
INSERT INTO `litemall_region` VALUES ('1914', '204', '枝江市', '3', '420583');
INSERT INTO `litemall_region` VALUES ('1915', '205', '襄城区', '3', '420602');
INSERT INTO `litemall_region` VALUES ('1916', '205', '樊城区', '3', '420606');
INSERT INTO `litemall_region` VALUES ('1917', '205', '襄州区', '3', '420607');
INSERT INTO `litemall_region` VALUES ('1918', '205', '南漳县', '3', '420624');
INSERT INTO `litemall_region` VALUES ('1919', '205', '谷城县', '3', '420625');
INSERT INTO `litemall_region` VALUES ('1920', '205', '保康县', '3', '420626');
INSERT INTO `litemall_region` VALUES ('1921', '205', '老河口市', '3', '420682');
INSERT INTO `litemall_region` VALUES ('1922', '205', '枣阳市', '3', '420683');
INSERT INTO `litemall_region` VALUES ('1923', '205', '宜城市', '3', '420684');
INSERT INTO `litemall_region` VALUES ('1924', '206', '梁子湖区', '3', '420702');
INSERT INTO `litemall_region` VALUES ('1925', '206', '华容区', '3', '420703');
INSERT INTO `litemall_region` VALUES ('1926', '206', '鄂城区', '3', '420704');
INSERT INTO `litemall_region` VALUES ('1927', '207', '东宝区', '3', '420802');
INSERT INTO `litemall_region` VALUES ('1928', '207', '掇刀区', '3', '420804');
INSERT INTO `litemall_region` VALUES ('1929', '207', '京山县', '3', '420821');
INSERT INTO `litemall_region` VALUES ('1930', '207', '沙洋县', '3', '420822');
INSERT INTO `litemall_region` VALUES ('1931', '207', '钟祥市', '3', '420881');
INSERT INTO `litemall_region` VALUES ('1932', '208', '孝南区', '3', '420902');
INSERT INTO `litemall_region` VALUES ('1933', '208', '孝昌县', '3', '420921');
INSERT INTO `litemall_region` VALUES ('1934', '208', '大悟县', '3', '420922');
INSERT INTO `litemall_region` VALUES ('1935', '208', '云梦县', '3', '420923');
INSERT INTO `litemall_region` VALUES ('1936', '208', '应城市', '3', '420981');
INSERT INTO `litemall_region` VALUES ('1937', '208', '安陆市', '3', '420982');
INSERT INTO `litemall_region` VALUES ('1938', '208', '汉川市', '3', '420984');
INSERT INTO `litemall_region` VALUES ('1939', '209', '沙市区', '3', '421002');
INSERT INTO `litemall_region` VALUES ('1940', '209', '荆州区', '3', '421003');
INSERT INTO `litemall_region` VALUES ('1941', '209', '公安县', '3', '421022');
INSERT INTO `litemall_region` VALUES ('1942', '209', '监利县', '3', '421023');
INSERT INTO `litemall_region` VALUES ('1943', '209', '江陵县', '3', '421024');
INSERT INTO `litemall_region` VALUES ('1944', '209', '石首市', '3', '421081');
INSERT INTO `litemall_region` VALUES ('1945', '209', '洪湖市', '3', '421083');
INSERT INTO `litemall_region` VALUES ('1946', '209', '松滋市', '3', '421087');
INSERT INTO `litemall_region` VALUES ('1947', '210', '黄州区', '3', '421102');
INSERT INTO `litemall_region` VALUES ('1948', '210', '团风县', '3', '421121');
INSERT INTO `litemall_region` VALUES ('1949', '210', '红安县', '3', '421122');
INSERT INTO `litemall_region` VALUES ('1950', '210', '罗田县', '3', '421123');
INSERT INTO `litemall_region` VALUES ('1951', '210', '英山县', '3', '421124');
INSERT INTO `litemall_region` VALUES ('1952', '210', '浠水县', '3', '421125');
INSERT INTO `litemall_region` VALUES ('1953', '210', '蕲春县', '3', '421126');
INSERT INTO `litemall_region` VALUES ('1954', '210', '黄梅县', '3', '421127');
INSERT INTO `litemall_region` VALUES ('1955', '210', '麻城市', '3', '421181');
INSERT INTO `litemall_region` VALUES ('1956', '210', '武穴市', '3', '421182');
INSERT INTO `litemall_region` VALUES ('1957', '211', '咸安区', '3', '421202');
INSERT INTO `litemall_region` VALUES ('1958', '211', '嘉鱼县', '3', '421221');
INSERT INTO `litemall_region` VALUES ('1959', '211', '通城县', '3', '421222');
INSERT INTO `litemall_region` VALUES ('1960', '211', '崇阳县', '3', '421223');
INSERT INTO `litemall_region` VALUES ('1961', '211', '通山县', '3', '421224');
INSERT INTO `litemall_region` VALUES ('1962', '211', '赤壁市', '3', '421281');
INSERT INTO `litemall_region` VALUES ('1963', '212', '曾都区', '3', '421303');
INSERT INTO `litemall_region` VALUES ('1964', '212', '随县', '3', '421321');
INSERT INTO `litemall_region` VALUES ('1965', '212', '广水市', '3', '421381');
INSERT INTO `litemall_region` VALUES ('1966', '213', '恩施市', '3', '422801');
INSERT INTO `litemall_region` VALUES ('1967', '213', '利川市', '3', '422802');
INSERT INTO `litemall_region` VALUES ('1968', '213', '建始县', '3', '422822');
INSERT INTO `litemall_region` VALUES ('1969', '213', '巴东县', '3', '422823');
INSERT INTO `litemall_region` VALUES ('1970', '213', '宣恩县', '3', '422825');
INSERT INTO `litemall_region` VALUES ('1971', '213', '咸丰县', '3', '422826');
INSERT INTO `litemall_region` VALUES ('1972', '213', '来凤县', '3', '422827');
INSERT INTO `litemall_region` VALUES ('1973', '213', '鹤峰县', '3', '422828');
INSERT INTO `litemall_region` VALUES ('1974', '214', '仙桃市', '3', '429004');
INSERT INTO `litemall_region` VALUES ('1975', '214', '潜江市', '3', '429005');
INSERT INTO `litemall_region` VALUES ('1976', '214', '天门市', '3', '429006');
INSERT INTO `litemall_region` VALUES ('1977', '214', '神农架林区', '3', '429021');
INSERT INTO `litemall_region` VALUES ('1978', '215', '芙蓉区', '3', '430102');
INSERT INTO `litemall_region` VALUES ('1979', '215', '天心区', '3', '430103');
INSERT INTO `litemall_region` VALUES ('1980', '215', '岳麓区', '3', '430104');
INSERT INTO `litemall_region` VALUES ('1981', '215', '开福区', '3', '430105');
INSERT INTO `litemall_region` VALUES ('1982', '215', '雨花区', '3', '430111');
INSERT INTO `litemall_region` VALUES ('1983', '215', '望城区', '3', '430112');
INSERT INTO `litemall_region` VALUES ('1984', '215', '长沙县', '3', '430121');
INSERT INTO `litemall_region` VALUES ('1985', '215', '宁乡县', '3', '430124');
INSERT INTO `litemall_region` VALUES ('1986', '215', '浏阳市', '3', '430181');
INSERT INTO `litemall_region` VALUES ('1987', '216', '荷塘区', '3', '430202');
INSERT INTO `litemall_region` VALUES ('1988', '216', '芦淞区', '3', '430203');
INSERT INTO `litemall_region` VALUES ('1989', '216', '石峰区', '3', '430204');
INSERT INTO `litemall_region` VALUES ('1990', '216', '天元区', '3', '430211');
INSERT INTO `litemall_region` VALUES ('1991', '216', '株洲县', '3', '430221');
INSERT INTO `litemall_region` VALUES ('1992', '216', '攸县', '3', '430223');
INSERT INTO `litemall_region` VALUES ('1993', '216', '茶陵县', '3', '430224');
INSERT INTO `litemall_region` VALUES ('1994', '216', '炎陵县', '3', '430225');
INSERT INTO `litemall_region` VALUES ('1995', '216', '醴陵市', '3', '430281');
INSERT INTO `litemall_region` VALUES ('1996', '217', '雨湖区', '3', '430302');
INSERT INTO `litemall_region` VALUES ('1997', '217', '岳塘区', '3', '430304');
INSERT INTO `litemall_region` VALUES ('1998', '217', '湘潭县', '3', '430321');
INSERT INTO `litemall_region` VALUES ('1999', '217', '湘乡市', '3', '430381');
INSERT INTO `litemall_region` VALUES ('2000', '217', '韶山市', '3', '430382');
INSERT INTO `litemall_region` VALUES ('2001', '218', '珠晖区', '3', '430405');
INSERT INTO `litemall_region` VALUES ('2002', '218', '雁峰区', '3', '430406');
INSERT INTO `litemall_region` VALUES ('2003', '218', '石鼓区', '3', '430407');
INSERT INTO `litemall_region` VALUES ('2004', '218', '蒸湘区', '3', '430408');
INSERT INTO `litemall_region` VALUES ('2005', '218', '南岳区', '3', '430412');
INSERT INTO `litemall_region` VALUES ('2006', '218', '衡阳县', '3', '430421');
INSERT INTO `litemall_region` VALUES ('2007', '218', '衡南县', '3', '430422');
INSERT INTO `litemall_region` VALUES ('2008', '218', '衡山县', '3', '430423');
INSERT INTO `litemall_region` VALUES ('2009', '218', '衡东县', '3', '430424');
INSERT INTO `litemall_region` VALUES ('2010', '218', '祁东县', '3', '430426');
INSERT INTO `litemall_region` VALUES ('2011', '218', '耒阳市', '3', '430481');
INSERT INTO `litemall_region` VALUES ('2012', '218', '常宁市', '3', '430482');
INSERT INTO `litemall_region` VALUES ('2013', '219', '双清区', '3', '430502');
INSERT INTO `litemall_region` VALUES ('2014', '219', '大祥区', '3', '430503');
INSERT INTO `litemall_region` VALUES ('2015', '219', '北塔区', '3', '430511');
INSERT INTO `litemall_region` VALUES ('2016', '219', '邵东县', '3', '430521');
INSERT INTO `litemall_region` VALUES ('2017', '219', '新邵县', '3', '430522');
INSERT INTO `litemall_region` VALUES ('2018', '219', '邵阳县', '3', '430523');
INSERT INTO `litemall_region` VALUES ('2019', '219', '隆回县', '3', '430524');
INSERT INTO `litemall_region` VALUES ('2020', '219', '洞口县', '3', '430525');
INSERT INTO `litemall_region` VALUES ('2021', '219', '绥宁县', '3', '430527');
INSERT INTO `litemall_region` VALUES ('2022', '219', '新宁县', '3', '430528');
INSERT INTO `litemall_region` VALUES ('2023', '219', '城步苗族自治县', '3', '430529');
INSERT INTO `litemall_region` VALUES ('2024', '219', '武冈市', '3', '430581');
INSERT INTO `litemall_region` VALUES ('2025', '220', '岳阳楼区', '3', '430602');
INSERT INTO `litemall_region` VALUES ('2026', '220', '云溪区', '3', '430603');
INSERT INTO `litemall_region` VALUES ('2027', '220', '君山区', '3', '430611');
INSERT INTO `litemall_region` VALUES ('2028', '220', '岳阳县', '3', '430621');
INSERT INTO `litemall_region` VALUES ('2029', '220', '华容县', '3', '430623');
INSERT INTO `litemall_region` VALUES ('2030', '220', '湘阴县', '3', '430624');
INSERT INTO `litemall_region` VALUES ('2031', '220', '平江县', '3', '430626');
INSERT INTO `litemall_region` VALUES ('2032', '220', '汨罗市', '3', '430681');
INSERT INTO `litemall_region` VALUES ('2033', '220', '临湘市', '3', '430682');
INSERT INTO `litemall_region` VALUES ('2034', '221', '武陵区', '3', '430702');
INSERT INTO `litemall_region` VALUES ('2035', '221', '鼎城区', '3', '430703');
INSERT INTO `litemall_region` VALUES ('2036', '221', '安乡县', '3', '430721');
INSERT INTO `litemall_region` VALUES ('2037', '221', '汉寿县', '3', '430722');
INSERT INTO `litemall_region` VALUES ('2038', '221', '澧县', '3', '430723');
INSERT INTO `litemall_region` VALUES ('2039', '221', '临澧县', '3', '430724');
INSERT INTO `litemall_region` VALUES ('2040', '221', '桃源县', '3', '430725');
INSERT INTO `litemall_region` VALUES ('2041', '221', '石门县', '3', '430726');
INSERT INTO `litemall_region` VALUES ('2042', '221', '津市市', '3', '430781');
INSERT INTO `litemall_region` VALUES ('2043', '222', '永定区', '3', '430802');
INSERT INTO `litemall_region` VALUES ('2044', '222', '武陵源区', '3', '430811');
INSERT INTO `litemall_region` VALUES ('2045', '222', '慈利县', '3', '430821');
INSERT INTO `litemall_region` VALUES ('2046', '222', '桑植县', '3', '430822');
INSERT INTO `litemall_region` VALUES ('2047', '223', '资阳区', '3', '430902');
INSERT INTO `litemall_region` VALUES ('2048', '223', '赫山区', '3', '430903');
INSERT INTO `litemall_region` VALUES ('2049', '223', '南县', '3', '430921');
INSERT INTO `litemall_region` VALUES ('2050', '223', '桃江县', '3', '430922');
INSERT INTO `litemall_region` VALUES ('2051', '223', '安化县', '3', '430923');
INSERT INTO `litemall_region` VALUES ('2052', '223', '沅江市', '3', '430981');
INSERT INTO `litemall_region` VALUES ('2053', '224', '北湖区', '3', '431002');
INSERT INTO `litemall_region` VALUES ('2054', '224', '苏仙区', '3', '431003');
INSERT INTO `litemall_region` VALUES ('2055', '224', '桂阳县', '3', '431021');
INSERT INTO `litemall_region` VALUES ('2056', '224', '宜章县', '3', '431022');
INSERT INTO `litemall_region` VALUES ('2057', '224', '永兴县', '3', '431023');
INSERT INTO `litemall_region` VALUES ('2058', '224', '嘉禾县', '3', '431024');
INSERT INTO `litemall_region` VALUES ('2059', '224', '临武县', '3', '431025');
INSERT INTO `litemall_region` VALUES ('2060', '224', '汝城县', '3', '431026');
INSERT INTO `litemall_region` VALUES ('2061', '224', '桂东县', '3', '431027');
INSERT INTO `litemall_region` VALUES ('2062', '224', '安仁县', '3', '431028');
INSERT INTO `litemall_region` VALUES ('2063', '224', '资兴市', '3', '431081');
INSERT INTO `litemall_region` VALUES ('2064', '225', '零陵区', '3', '431102');
INSERT INTO `litemall_region` VALUES ('2065', '225', '冷水滩区', '3', '431103');
INSERT INTO `litemall_region` VALUES ('2066', '225', '祁阳县', '3', '431121');
INSERT INTO `litemall_region` VALUES ('2067', '225', '东安县', '3', '431122');
INSERT INTO `litemall_region` VALUES ('2068', '225', '双牌县', '3', '431123');
INSERT INTO `litemall_region` VALUES ('2069', '225', '道县', '3', '431124');
INSERT INTO `litemall_region` VALUES ('2070', '225', '江永县', '3', '431125');
INSERT INTO `litemall_region` VALUES ('2071', '225', '宁远县', '3', '431126');
INSERT INTO `litemall_region` VALUES ('2072', '225', '蓝山县', '3', '431127');
INSERT INTO `litemall_region` VALUES ('2073', '225', '新田县', '3', '431128');
INSERT INTO `litemall_region` VALUES ('2074', '225', '江华瑶族自治县', '3', '431129');
INSERT INTO `litemall_region` VALUES ('2075', '226', '鹤城区', '3', '431202');
INSERT INTO `litemall_region` VALUES ('2076', '226', '中方县', '3', '431221');
INSERT INTO `litemall_region` VALUES ('2077', '226', '沅陵县', '3', '431222');
INSERT INTO `litemall_region` VALUES ('2078', '226', '辰溪县', '3', '431223');
INSERT INTO `litemall_region` VALUES ('2079', '226', '溆浦县', '3', '431224');
INSERT INTO `litemall_region` VALUES ('2080', '226', '会同县', '3', '431225');
INSERT INTO `litemall_region` VALUES ('2081', '226', '麻阳苗族自治县', '3', '431226');
INSERT INTO `litemall_region` VALUES ('2082', '226', '新晃侗族自治县', '3', '431227');
INSERT INTO `litemall_region` VALUES ('2083', '226', '芷江侗族自治县', '3', '431228');
INSERT INTO `litemall_region` VALUES ('2084', '226', '靖州苗族侗族自治县', '3', '431229');
INSERT INTO `litemall_region` VALUES ('2085', '226', '通道侗族自治县', '3', '431230');
INSERT INTO `litemall_region` VALUES ('2086', '226', '洪江市', '3', '431281');
INSERT INTO `litemall_region` VALUES ('2087', '227', '娄星区', '3', '431302');
INSERT INTO `litemall_region` VALUES ('2088', '227', '双峰县', '3', '431321');
INSERT INTO `litemall_region` VALUES ('2089', '227', '新化县', '3', '431322');
INSERT INTO `litemall_region` VALUES ('2090', '227', '冷水江市', '3', '431381');
INSERT INTO `litemall_region` VALUES ('2091', '227', '涟源市', '3', '431382');
INSERT INTO `litemall_region` VALUES ('2092', '228', '吉首市', '3', '433101');
INSERT INTO `litemall_region` VALUES ('2093', '228', '泸溪县', '3', '433122');
INSERT INTO `litemall_region` VALUES ('2094', '228', '凤凰县', '3', '433123');
INSERT INTO `litemall_region` VALUES ('2095', '228', '花垣县', '3', '433124');
INSERT INTO `litemall_region` VALUES ('2096', '228', '保靖县', '3', '433125');
INSERT INTO `litemall_region` VALUES ('2097', '228', '古丈县', '3', '433126');
INSERT INTO `litemall_region` VALUES ('2098', '228', '永顺县', '3', '433127');
INSERT INTO `litemall_region` VALUES ('2099', '228', '龙山县', '3', '433130');
INSERT INTO `litemall_region` VALUES ('2100', '229', '荔湾区', '3', '440103');
INSERT INTO `litemall_region` VALUES ('2101', '229', '越秀区', '3', '440104');
INSERT INTO `litemall_region` VALUES ('2102', '229', '海珠区', '3', '440105');
INSERT INTO `litemall_region` VALUES ('2103', '229', '天河区', '3', '440106');
INSERT INTO `litemall_region` VALUES ('2104', '229', '白云区', '3', '440111');
INSERT INTO `litemall_region` VALUES ('2105', '229', '黄埔区', '3', '440112');
INSERT INTO `litemall_region` VALUES ('2106', '229', '番禺区', '3', '440113');
INSERT INTO `litemall_region` VALUES ('2107', '229', '花都区', '3', '440114');
INSERT INTO `litemall_region` VALUES ('2108', '229', '南沙区', '3', '440115');
INSERT INTO `litemall_region` VALUES ('2109', '229', '从化区', '3', '440117');
INSERT INTO `litemall_region` VALUES ('2110', '229', '增城区', '3', '440118');
INSERT INTO `litemall_region` VALUES ('2111', '230', '武江区', '3', '440203');
INSERT INTO `litemall_region` VALUES ('2112', '230', '浈江区', '3', '440204');
INSERT INTO `litemall_region` VALUES ('2113', '230', '曲江区', '3', '440205');
INSERT INTO `litemall_region` VALUES ('2114', '230', '始兴县', '3', '440222');
INSERT INTO `litemall_region` VALUES ('2115', '230', '仁化县', '3', '440224');
INSERT INTO `litemall_region` VALUES ('2116', '230', '翁源县', '3', '440229');
INSERT INTO `litemall_region` VALUES ('2117', '230', '乳源瑶族自治县', '3', '440232');
INSERT INTO `litemall_region` VALUES ('2118', '230', '新丰县', '3', '440233');
INSERT INTO `litemall_region` VALUES ('2119', '230', '乐昌市', '3', '440281');
INSERT INTO `litemall_region` VALUES ('2120', '230', '南雄市', '3', '440282');
INSERT INTO `litemall_region` VALUES ('2121', '231', '罗湖区', '3', '440303');
INSERT INTO `litemall_region` VALUES ('2122', '231', '福田区', '3', '440304');
INSERT INTO `litemall_region` VALUES ('2123', '231', '南山区', '3', '440305');
INSERT INTO `litemall_region` VALUES ('2124', '231', '宝安区', '3', '440306');
INSERT INTO `litemall_region` VALUES ('2125', '231', '龙岗区', '3', '440307');
INSERT INTO `litemall_region` VALUES ('2126', '231', '盐田区', '3', '440308');
INSERT INTO `litemall_region` VALUES ('2127', '232', '香洲区', '3', '440402');
INSERT INTO `litemall_region` VALUES ('2128', '232', '斗门区', '3', '440403');
INSERT INTO `litemall_region` VALUES ('2129', '232', '金湾区', '3', '440404');
INSERT INTO `litemall_region` VALUES ('2130', '233', '龙湖区', '3', '440507');
INSERT INTO `litemall_region` VALUES ('2131', '233', '金平区', '3', '440511');
INSERT INTO `litemall_region` VALUES ('2132', '233', '濠江区', '3', '440512');
INSERT INTO `litemall_region` VALUES ('2133', '233', '潮阳区', '3', '440513');
INSERT INTO `litemall_region` VALUES ('2134', '233', '潮南区', '3', '440514');
INSERT INTO `litemall_region` VALUES ('2135', '233', '澄海区', '3', '440515');
INSERT INTO `litemall_region` VALUES ('2136', '233', '南澳县', '3', '440523');
INSERT INTO `litemall_region` VALUES ('2137', '234', '禅城区', '3', '440604');
INSERT INTO `litemall_region` VALUES ('2138', '234', '南海区', '3', '440605');
INSERT INTO `litemall_region` VALUES ('2139', '234', '顺德区', '3', '440606');
INSERT INTO `litemall_region` VALUES ('2140', '234', '三水区', '3', '440607');
INSERT INTO `litemall_region` VALUES ('2141', '234', '高明区', '3', '440608');
INSERT INTO `litemall_region` VALUES ('2142', '235', '蓬江区', '3', '440703');
INSERT INTO `litemall_region` VALUES ('2143', '235', '江海区', '3', '440704');
INSERT INTO `litemall_region` VALUES ('2144', '235', '新会区', '3', '440705');
INSERT INTO `litemall_region` VALUES ('2145', '235', '台山市', '3', '440781');
INSERT INTO `litemall_region` VALUES ('2146', '235', '开平市', '3', '440783');
INSERT INTO `litemall_region` VALUES ('2147', '235', '鹤山市', '3', '440784');
INSERT INTO `litemall_region` VALUES ('2148', '235', '恩平市', '3', '440785');
INSERT INTO `litemall_region` VALUES ('2149', '236', '赤坎区', '3', '440802');
INSERT INTO `litemall_region` VALUES ('2150', '236', '霞山区', '3', '440803');
INSERT INTO `litemall_region` VALUES ('2151', '236', '坡头区', '3', '440804');
INSERT INTO `litemall_region` VALUES ('2152', '236', '麻章区', '3', '440811');
INSERT INTO `litemall_region` VALUES ('2153', '236', '遂溪县', '3', '440823');
INSERT INTO `litemall_region` VALUES ('2154', '236', '徐闻县', '3', '440825');
INSERT INTO `litemall_region` VALUES ('2155', '236', '廉江市', '3', '440881');
INSERT INTO `litemall_region` VALUES ('2156', '236', '雷州市', '3', '440882');
INSERT INTO `litemall_region` VALUES ('2157', '236', '吴川市', '3', '440883');
INSERT INTO `litemall_region` VALUES ('2158', '237', '茂南区', '3', '440902');
INSERT INTO `litemall_region` VALUES ('2159', '237', '电白区', '3', '440904');
INSERT INTO `litemall_region` VALUES ('2160', '237', '高州市', '3', '440981');
INSERT INTO `litemall_region` VALUES ('2161', '237', '化州市', '3', '440982');
INSERT INTO `litemall_region` VALUES ('2162', '237', '信宜市', '3', '440983');
INSERT INTO `litemall_region` VALUES ('2163', '238', '端州区', '3', '441202');
INSERT INTO `litemall_region` VALUES ('2164', '238', '鼎湖区', '3', '441203');
INSERT INTO `litemall_region` VALUES ('2165', '238', '高要区', '3', '441204');
INSERT INTO `litemall_region` VALUES ('2166', '238', '广宁县', '3', '441223');
INSERT INTO `litemall_region` VALUES ('2167', '238', '怀集县', '3', '441224');
INSERT INTO `litemall_region` VALUES ('2168', '238', '封开县', '3', '441225');
INSERT INTO `litemall_region` VALUES ('2169', '238', '德庆县', '3', '441226');
INSERT INTO `litemall_region` VALUES ('2170', '238', '四会市', '3', '441284');
INSERT INTO `litemall_region` VALUES ('2171', '239', '惠城区', '3', '441302');
INSERT INTO `litemall_region` VALUES ('2172', '239', '惠阳区', '3', '441303');
INSERT INTO `litemall_region` VALUES ('2173', '239', '博罗县', '3', '441322');
INSERT INTO `litemall_region` VALUES ('2174', '239', '惠东县', '3', '441323');
INSERT INTO `litemall_region` VALUES ('2175', '239', '龙门县', '3', '441324');
INSERT INTO `litemall_region` VALUES ('2176', '240', '梅江区', '3', '441402');
INSERT INTO `litemall_region` VALUES ('2177', '240', '梅县区', '3', '441403');
INSERT INTO `litemall_region` VALUES ('2178', '240', '大埔县', '3', '441422');
INSERT INTO `litemall_region` VALUES ('2179', '240', '丰顺县', '3', '441423');
INSERT INTO `litemall_region` VALUES ('2180', '240', '五华县', '3', '441424');
INSERT INTO `litemall_region` VALUES ('2181', '240', '平远县', '3', '441426');
INSERT INTO `litemall_region` VALUES ('2182', '240', '蕉岭县', '3', '441427');
INSERT INTO `litemall_region` VALUES ('2183', '240', '兴宁市', '3', '441481');
INSERT INTO `litemall_region` VALUES ('2184', '241', '城区', '3', '441502');
INSERT INTO `litemall_region` VALUES ('2185', '241', '海丰县', '3', '441521');
INSERT INTO `litemall_region` VALUES ('2186', '241', '陆河县', '3', '441523');
INSERT INTO `litemall_region` VALUES ('2187', '241', '陆丰市', '3', '441581');
INSERT INTO `litemall_region` VALUES ('2188', '242', '源城区', '3', '441602');
INSERT INTO `litemall_region` VALUES ('2189', '242', '紫金县', '3', '441621');
INSERT INTO `litemall_region` VALUES ('2190', '242', '龙川县', '3', '441622');
INSERT INTO `litemall_region` VALUES ('2191', '242', '连平县', '3', '441623');
INSERT INTO `litemall_region` VALUES ('2192', '242', '和平县', '3', '441624');
INSERT INTO `litemall_region` VALUES ('2193', '242', '东源县', '3', '441625');
INSERT INTO `litemall_region` VALUES ('2194', '243', '江城区', '3', '441702');
INSERT INTO `litemall_region` VALUES ('2195', '243', '阳东区', '3', '441704');
INSERT INTO `litemall_region` VALUES ('2196', '243', '阳西县', '3', '441721');
INSERT INTO `litemall_region` VALUES ('2197', '243', '阳春市', '3', '441781');
INSERT INTO `litemall_region` VALUES ('2198', '244', '清城区', '3', '441802');
INSERT INTO `litemall_region` VALUES ('2199', '244', '清新区', '3', '441803');
INSERT INTO `litemall_region` VALUES ('2200', '244', '佛冈县', '3', '441821');
INSERT INTO `litemall_region` VALUES ('2201', '244', '阳山县', '3', '441823');
INSERT INTO `litemall_region` VALUES ('2202', '244', '连山壮族瑶族自治县', '3', '441825');
INSERT INTO `litemall_region` VALUES ('2203', '244', '连南瑶族自治县', '3', '441826');
INSERT INTO `litemall_region` VALUES ('2204', '244', '英德市', '3', '441881');
INSERT INTO `litemall_region` VALUES ('2205', '244', '连州市', '3', '441882');
INSERT INTO `litemall_region` VALUES ('2206', '245', '东莞市', '3', '441900');
INSERT INTO `litemall_region` VALUES ('2207', '246', '中山市', '3', '442000');
INSERT INTO `litemall_region` VALUES ('2208', '247', '湘桥区', '3', '445102');
INSERT INTO `litemall_region` VALUES ('2209', '247', '潮安区', '3', '445103');
INSERT INTO `litemall_region` VALUES ('2210', '247', '饶平县', '3', '445122');
INSERT INTO `litemall_region` VALUES ('2211', '248', '榕城区', '3', '445202');
INSERT INTO `litemall_region` VALUES ('2212', '248', '揭东区', '3', '445203');
INSERT INTO `litemall_region` VALUES ('2213', '248', '揭西县', '3', '445222');
INSERT INTO `litemall_region` VALUES ('2214', '248', '惠来县', '3', '445224');
INSERT INTO `litemall_region` VALUES ('2215', '248', '普宁市', '3', '445281');
INSERT INTO `litemall_region` VALUES ('2216', '249', '云城区', '3', '445302');
INSERT INTO `litemall_region` VALUES ('2217', '249', '云安区', '3', '445303');
INSERT INTO `litemall_region` VALUES ('2218', '249', '新兴县', '3', '445321');
INSERT INTO `litemall_region` VALUES ('2219', '249', '郁南县', '3', '445322');
INSERT INTO `litemall_region` VALUES ('2220', '249', '罗定市', '3', '445381');
INSERT INTO `litemall_region` VALUES ('2221', '250', '兴宁区', '3', '450102');
INSERT INTO `litemall_region` VALUES ('2222', '250', '青秀区', '3', '450103');
INSERT INTO `litemall_region` VALUES ('2223', '250', '江南区', '3', '450105');
INSERT INTO `litemall_region` VALUES ('2224', '250', '西乡塘区', '3', '450107');
INSERT INTO `litemall_region` VALUES ('2225', '250', '良庆区', '3', '450108');
INSERT INTO `litemall_region` VALUES ('2226', '250', '邕宁区', '3', '450109');
INSERT INTO `litemall_region` VALUES ('2227', '250', '武鸣区', '3', '450110');
INSERT INTO `litemall_region` VALUES ('2228', '250', '隆安县', '3', '450123');
INSERT INTO `litemall_region` VALUES ('2229', '250', '马山县', '3', '450124');
INSERT INTO `litemall_region` VALUES ('2230', '250', '上林县', '3', '450125');
INSERT INTO `litemall_region` VALUES ('2231', '250', '宾阳县', '3', '450126');
INSERT INTO `litemall_region` VALUES ('2232', '250', '横县', '3', '450127');
INSERT INTO `litemall_region` VALUES ('2233', '251', '城中区', '3', '450202');
INSERT INTO `litemall_region` VALUES ('2234', '251', '鱼峰区', '3', '450203');
INSERT INTO `litemall_region` VALUES ('2235', '251', '柳南区', '3', '450204');
INSERT INTO `litemall_region` VALUES ('2236', '251', '柳北区', '3', '450205');
INSERT INTO `litemall_region` VALUES ('2237', '251', '柳江区', '3', '450206');
INSERT INTO `litemall_region` VALUES ('2238', '251', '柳城县', '3', '450222');
INSERT INTO `litemall_region` VALUES ('2239', '251', '鹿寨县', '3', '450223');
INSERT INTO `litemall_region` VALUES ('2240', '251', '融安县', '3', '450224');
INSERT INTO `litemall_region` VALUES ('2241', '251', '融水苗族自治县', '3', '450225');
INSERT INTO `litemall_region` VALUES ('2242', '251', '三江侗族自治县', '3', '450226');
INSERT INTO `litemall_region` VALUES ('2243', '252', '秀峰区', '3', '450302');
INSERT INTO `litemall_region` VALUES ('2244', '252', '叠彩区', '3', '450303');
INSERT INTO `litemall_region` VALUES ('2245', '252', '象山区', '3', '450304');
INSERT INTO `litemall_region` VALUES ('2246', '252', '七星区', '3', '450305');
INSERT INTO `litemall_region` VALUES ('2247', '252', '雁山区', '3', '450311');
INSERT INTO `litemall_region` VALUES ('2248', '252', '临桂区', '3', '450312');
INSERT INTO `litemall_region` VALUES ('2249', '252', '阳朔县', '3', '450321');
INSERT INTO `litemall_region` VALUES ('2250', '252', '灵川县', '3', '450323');
INSERT INTO `litemall_region` VALUES ('2251', '252', '全州县', '3', '450324');
INSERT INTO `litemall_region` VALUES ('2252', '252', '兴安县', '3', '450325');
INSERT INTO `litemall_region` VALUES ('2253', '252', '永福县', '3', '450326');
INSERT INTO `litemall_region` VALUES ('2254', '252', '灌阳县', '3', '450327');
INSERT INTO `litemall_region` VALUES ('2255', '252', '龙胜各族自治县', '3', '450328');
INSERT INTO `litemall_region` VALUES ('2256', '252', '资源县', '3', '450329');
INSERT INTO `litemall_region` VALUES ('2257', '252', '平乐县', '3', '450330');
INSERT INTO `litemall_region` VALUES ('2258', '252', '荔浦县', '3', '450331');
INSERT INTO `litemall_region` VALUES ('2259', '252', '恭城瑶族自治县', '3', '450332');
INSERT INTO `litemall_region` VALUES ('2260', '253', '万秀区', '3', '450403');
INSERT INTO `litemall_region` VALUES ('2261', '253', '长洲区', '3', '450405');
INSERT INTO `litemall_region` VALUES ('2262', '253', '龙圩区', '3', '450406');
INSERT INTO `litemall_region` VALUES ('2263', '253', '苍梧县', '3', '450421');
INSERT INTO `litemall_region` VALUES ('2264', '253', '藤县', '3', '450422');
INSERT INTO `litemall_region` VALUES ('2265', '253', '蒙山县', '3', '450423');
INSERT INTO `litemall_region` VALUES ('2266', '253', '岑溪市', '3', '450481');
INSERT INTO `litemall_region` VALUES ('2267', '254', '海城区', '3', '450502');
INSERT INTO `litemall_region` VALUES ('2268', '254', '银海区', '3', '450503');
INSERT INTO `litemall_region` VALUES ('2269', '254', '铁山港区', '3', '450512');
INSERT INTO `litemall_region` VALUES ('2270', '254', '合浦县', '3', '450521');
INSERT INTO `litemall_region` VALUES ('2271', '255', '港口区', '3', '450602');
INSERT INTO `litemall_region` VALUES ('2272', '255', '防城区', '3', '450603');
INSERT INTO `litemall_region` VALUES ('2273', '255', '上思县', '3', '450621');
INSERT INTO `litemall_region` VALUES ('2274', '255', '东兴市', '3', '450681');
INSERT INTO `litemall_region` VALUES ('2275', '256', '钦南区', '3', '450702');
INSERT INTO `litemall_region` VALUES ('2276', '256', '钦北区', '3', '450703');
INSERT INTO `litemall_region` VALUES ('2277', '256', '灵山县', '3', '450721');
INSERT INTO `litemall_region` VALUES ('2278', '256', '浦北县', '3', '450722');
INSERT INTO `litemall_region` VALUES ('2279', '257', '港北区', '3', '450802');
INSERT INTO `litemall_region` VALUES ('2280', '257', '港南区', '3', '450803');
INSERT INTO `litemall_region` VALUES ('2281', '257', '覃塘区', '3', '450804');
INSERT INTO `litemall_region` VALUES ('2282', '257', '平南县', '3', '450821');
INSERT INTO `litemall_region` VALUES ('2283', '257', '桂平市', '3', '450881');
INSERT INTO `litemall_region` VALUES ('2284', '258', '玉州区', '3', '450902');
INSERT INTO `litemall_region` VALUES ('2285', '258', '福绵区', '3', '450903');
INSERT INTO `litemall_region` VALUES ('2286', '258', '容县', '3', '450921');
INSERT INTO `litemall_region` VALUES ('2287', '258', '陆川县', '3', '450922');
INSERT INTO `litemall_region` VALUES ('2288', '258', '博白县', '3', '450923');
INSERT INTO `litemall_region` VALUES ('2289', '258', '兴业县', '3', '450924');
INSERT INTO `litemall_region` VALUES ('2290', '258', '北流市', '3', '450981');
INSERT INTO `litemall_region` VALUES ('2291', '259', '右江区', '3', '451002');
INSERT INTO `litemall_region` VALUES ('2292', '259', '田阳县', '3', '451021');
INSERT INTO `litemall_region` VALUES ('2293', '259', '田东县', '3', '451022');
INSERT INTO `litemall_region` VALUES ('2294', '259', '平果县', '3', '451023');
INSERT INTO `litemall_region` VALUES ('2295', '259', '德保县', '3', '451024');
INSERT INTO `litemall_region` VALUES ('2296', '259', '那坡县', '3', '451026');
INSERT INTO `litemall_region` VALUES ('2297', '259', '凌云县', '3', '451027');
INSERT INTO `litemall_region` VALUES ('2298', '259', '乐业县', '3', '451028');
INSERT INTO `litemall_region` VALUES ('2299', '259', '田林县', '3', '451029');
INSERT INTO `litemall_region` VALUES ('2300', '259', '西林县', '3', '451030');
INSERT INTO `litemall_region` VALUES ('2301', '259', '隆林各族自治县', '3', '451031');
INSERT INTO `litemall_region` VALUES ('2302', '259', '靖西市', '3', '451081');
INSERT INTO `litemall_region` VALUES ('2303', '260', '八步区', '3', '451102');
INSERT INTO `litemall_region` VALUES ('2304', '260', '平桂区', '3', '451103');
INSERT INTO `litemall_region` VALUES ('2305', '260', '昭平县', '3', '451121');
INSERT INTO `litemall_region` VALUES ('2306', '260', '钟山县', '3', '451122');
INSERT INTO `litemall_region` VALUES ('2307', '260', '富川瑶族自治县', '3', '451123');
INSERT INTO `litemall_region` VALUES ('2308', '261', '金城江区', '3', '451202');
INSERT INTO `litemall_region` VALUES ('2309', '261', '南丹县', '3', '451221');
INSERT INTO `litemall_region` VALUES ('2310', '261', '天峨县', '3', '451222');
INSERT INTO `litemall_region` VALUES ('2311', '261', '凤山县', '3', '451223');
INSERT INTO `litemall_region` VALUES ('2312', '261', '东兰县', '3', '451224');
INSERT INTO `litemall_region` VALUES ('2313', '261', '罗城仫佬族自治县', '3', '451225');
INSERT INTO `litemall_region` VALUES ('2314', '261', '环江毛南族自治县', '3', '451226');
INSERT INTO `litemall_region` VALUES ('2315', '261', '巴马瑶族自治县', '3', '451227');
INSERT INTO `litemall_region` VALUES ('2316', '261', '都安瑶族自治县', '3', '451228');
INSERT INTO `litemall_region` VALUES ('2317', '261', '大化瑶族自治县', '3', '451229');
INSERT INTO `litemall_region` VALUES ('2318', '261', '宜州市', '3', '451281');
INSERT INTO `litemall_region` VALUES ('2319', '262', '兴宾区', '3', '451302');
INSERT INTO `litemall_region` VALUES ('2320', '262', '忻城县', '3', '451321');
INSERT INTO `litemall_region` VALUES ('2321', '262', '象州县', '3', '451322');
INSERT INTO `litemall_region` VALUES ('2322', '262', '武宣县', '3', '451323');
INSERT INTO `litemall_region` VALUES ('2323', '262', '金秀瑶族自治县', '3', '451324');
INSERT INTO `litemall_region` VALUES ('2324', '262', '合山市', '3', '451381');
INSERT INTO `litemall_region` VALUES ('2325', '263', '江州区', '3', '451402');
INSERT INTO `litemall_region` VALUES ('2326', '263', '扶绥县', '3', '451421');
INSERT INTO `litemall_region` VALUES ('2327', '263', '宁明县', '3', '451422');
INSERT INTO `litemall_region` VALUES ('2328', '263', '龙州县', '3', '451423');
INSERT INTO `litemall_region` VALUES ('2329', '263', '大新县', '3', '451424');
INSERT INTO `litemall_region` VALUES ('2330', '263', '天等县', '3', '451425');
INSERT INTO `litemall_region` VALUES ('2331', '263', '凭祥市', '3', '451481');
INSERT INTO `litemall_region` VALUES ('2332', '264', '秀英区', '3', '460105');
INSERT INTO `litemall_region` VALUES ('2333', '264', '龙华区', '3', '460106');
INSERT INTO `litemall_region` VALUES ('2334', '264', '琼山区', '3', '460107');
INSERT INTO `litemall_region` VALUES ('2335', '264', '美兰区', '3', '460108');
INSERT INTO `litemall_region` VALUES ('2336', '265', '市辖区', '3', '460201');
INSERT INTO `litemall_region` VALUES ('2337', '265', '海棠区', '3', '460202');
INSERT INTO `litemall_region` VALUES ('2338', '265', '吉阳区', '3', '460203');
INSERT INTO `litemall_region` VALUES ('2339', '265', '天涯区', '3', '460204');
INSERT INTO `litemall_region` VALUES ('2340', '265', '崖州区', '3', '460205');
INSERT INTO `litemall_region` VALUES ('2341', '266', '西沙群岛', '3', '460321');
INSERT INTO `litemall_region` VALUES ('2342', '266', '南沙群岛', '3', '460322');
INSERT INTO `litemall_region` VALUES ('2343', '266', '中沙群岛的岛礁及其海域', '3', '460323');
INSERT INTO `litemall_region` VALUES ('2344', '267', '儋州市', '3', '460400');
INSERT INTO `litemall_region` VALUES ('2345', '268', '五指山市', '3', '469001');
INSERT INTO `litemall_region` VALUES ('2346', '268', '琼海市', '3', '469002');
INSERT INTO `litemall_region` VALUES ('2347', '268', '文昌市', '3', '469005');
INSERT INTO `litemall_region` VALUES ('2348', '268', '万宁市', '3', '469006');
INSERT INTO `litemall_region` VALUES ('2349', '268', '东方市', '3', '469007');
INSERT INTO `litemall_region` VALUES ('2350', '268', '定安县', '3', '469021');
INSERT INTO `litemall_region` VALUES ('2351', '268', '屯昌县', '3', '469022');
INSERT INTO `litemall_region` VALUES ('2352', '268', '澄迈县', '3', '469023');
INSERT INTO `litemall_region` VALUES ('2353', '268', '临高县', '3', '469024');
INSERT INTO `litemall_region` VALUES ('2354', '268', '白沙黎族自治县', '3', '469025');
INSERT INTO `litemall_region` VALUES ('2355', '268', '昌江黎族自治县', '3', '469026');
INSERT INTO `litemall_region` VALUES ('2356', '268', '乐东黎族自治县', '3', '469027');
INSERT INTO `litemall_region` VALUES ('2357', '268', '陵水黎族自治县', '3', '469028');
INSERT INTO `litemall_region` VALUES ('2358', '268', '保亭黎族苗族自治县', '3', '469029');
INSERT INTO `litemall_region` VALUES ('2359', '268', '琼中黎族苗族自治县', '3', '469030');
INSERT INTO `litemall_region` VALUES ('2360', '269', '万州区', '3', '500101');
INSERT INTO `litemall_region` VALUES ('2361', '269', '涪陵区', '3', '500102');
INSERT INTO `litemall_region` VALUES ('2362', '269', '渝中区', '3', '500103');
INSERT INTO `litemall_region` VALUES ('2363', '269', '大渡口区', '3', '500104');
INSERT INTO `litemall_region` VALUES ('2364', '269', '江北区', '3', '500105');
INSERT INTO `litemall_region` VALUES ('2365', '269', '沙坪坝区', '3', '500106');
INSERT INTO `litemall_region` VALUES ('2366', '269', '九龙坡区', '3', '500107');
INSERT INTO `litemall_region` VALUES ('2367', '269', '南岸区', '3', '500108');
INSERT INTO `litemall_region` VALUES ('2368', '269', '北碚区', '3', '500109');
INSERT INTO `litemall_region` VALUES ('2369', '269', '綦江区', '3', '500110');
INSERT INTO `litemall_region` VALUES ('2370', '269', '大足区', '3', '500111');
INSERT INTO `litemall_region` VALUES ('2371', '269', '渝北区', '3', '500112');
INSERT INTO `litemall_region` VALUES ('2372', '269', '巴南区', '3', '500113');
INSERT INTO `litemall_region` VALUES ('2373', '269', '黔江区', '3', '500114');
INSERT INTO `litemall_region` VALUES ('2374', '269', '长寿区', '3', '500115');
INSERT INTO `litemall_region` VALUES ('2375', '269', '江津区', '3', '500116');
INSERT INTO `litemall_region` VALUES ('2376', '269', '合川区', '3', '500117');
INSERT INTO `litemall_region` VALUES ('2377', '269', '永川区', '3', '500118');
INSERT INTO `litemall_region` VALUES ('2378', '269', '南川区', '3', '500119');
INSERT INTO `litemall_region` VALUES ('2379', '269', '璧山区', '3', '500120');
INSERT INTO `litemall_region` VALUES ('2380', '269', '铜梁区', '3', '500151');
INSERT INTO `litemall_region` VALUES ('2381', '269', '潼南区', '3', '500152');
INSERT INTO `litemall_region` VALUES ('2382', '269', '荣昌区', '3', '500153');
INSERT INTO `litemall_region` VALUES ('2383', '269', '开州区', '3', '500154');
INSERT INTO `litemall_region` VALUES ('2384', '270', '梁平县', '3', '500228');
INSERT INTO `litemall_region` VALUES ('2385', '270', '城口县', '3', '500229');
INSERT INTO `litemall_region` VALUES ('2386', '270', '丰都县', '3', '500230');
INSERT INTO `litemall_region` VALUES ('2387', '270', '垫江县', '3', '500231');
INSERT INTO `litemall_region` VALUES ('2388', '270', '武隆县', '3', '500232');
INSERT INTO `litemall_region` VALUES ('2389', '270', '忠县', '3', '500233');
INSERT INTO `litemall_region` VALUES ('2390', '270', '云阳县', '3', '500235');
INSERT INTO `litemall_region` VALUES ('2391', '270', '奉节县', '3', '500236');
INSERT INTO `litemall_region` VALUES ('2392', '270', '巫山县', '3', '500237');
INSERT INTO `litemall_region` VALUES ('2393', '270', '巫溪县', '3', '500238');
INSERT INTO `litemall_region` VALUES ('2394', '270', '石柱土家族自治县', '3', '500240');
INSERT INTO `litemall_region` VALUES ('2395', '270', '秀山土家族苗族自治县', '3', '500241');
INSERT INTO `litemall_region` VALUES ('2396', '270', '酉阳土家族苗族自治县', '3', '500242');
INSERT INTO `litemall_region` VALUES ('2397', '270', '彭水苗族土家族自治县', '3', '500243');
INSERT INTO `litemall_region` VALUES ('2398', '271', '锦江区', '3', '510104');
INSERT INTO `litemall_region` VALUES ('2399', '271', '青羊区', '3', '510105');
INSERT INTO `litemall_region` VALUES ('2400', '271', '金牛区', '3', '510106');
INSERT INTO `litemall_region` VALUES ('2401', '271', '武侯区', '3', '510107');
INSERT INTO `litemall_region` VALUES ('2402', '271', '成华区', '3', '510108');
INSERT INTO `litemall_region` VALUES ('2403', '271', '龙泉驿区', '3', '510112');
INSERT INTO `litemall_region` VALUES ('2404', '271', '青白江区', '3', '510113');
INSERT INTO `litemall_region` VALUES ('2405', '271', '新都区', '3', '510114');
INSERT INTO `litemall_region` VALUES ('2406', '271', '温江区', '3', '510115');
INSERT INTO `litemall_region` VALUES ('2407', '271', '双流区', '3', '510116');
INSERT INTO `litemall_region` VALUES ('2408', '271', '金堂县', '3', '510121');
INSERT INTO `litemall_region` VALUES ('2409', '271', '郫县', '3', '510124');
INSERT INTO `litemall_region` VALUES ('2410', '271', '大邑县', '3', '510129');
INSERT INTO `litemall_region` VALUES ('2411', '271', '蒲江县', '3', '510131');
INSERT INTO `litemall_region` VALUES ('2412', '271', '新津县', '3', '510132');
INSERT INTO `litemall_region` VALUES ('2413', '271', '都江堰市', '3', '510181');
INSERT INTO `litemall_region` VALUES ('2414', '271', '彭州市', '3', '510182');
INSERT INTO `litemall_region` VALUES ('2415', '271', '邛崃市', '3', '510183');
INSERT INTO `litemall_region` VALUES ('2416', '271', '崇州市', '3', '510184');
INSERT INTO `litemall_region` VALUES ('2417', '271', '简阳市', '3', '510185');
INSERT INTO `litemall_region` VALUES ('2418', '272', '自流井区', '3', '510302');
INSERT INTO `litemall_region` VALUES ('2419', '272', '贡井区', '3', '510303');
INSERT INTO `litemall_region` VALUES ('2420', '272', '大安区', '3', '510304');
INSERT INTO `litemall_region` VALUES ('2421', '272', '沿滩区', '3', '510311');
INSERT INTO `litemall_region` VALUES ('2422', '272', '荣县', '3', '510321');
INSERT INTO `litemall_region` VALUES ('2423', '272', '富顺县', '3', '510322');
INSERT INTO `litemall_region` VALUES ('2424', '273', '东区', '3', '510402');
INSERT INTO `litemall_region` VALUES ('2425', '273', '西区', '3', '510403');
INSERT INTO `litemall_region` VALUES ('2426', '273', '仁和区', '3', '510411');
INSERT INTO `litemall_region` VALUES ('2427', '273', '米易县', '3', '510421');
INSERT INTO `litemall_region` VALUES ('2428', '273', '盐边县', '3', '510422');
INSERT INTO `litemall_region` VALUES ('2429', '274', '江阳区', '3', '510502');
INSERT INTO `litemall_region` VALUES ('2430', '274', '纳溪区', '3', '510503');
INSERT INTO `litemall_region` VALUES ('2431', '274', '龙马潭区', '3', '510504');
INSERT INTO `litemall_region` VALUES ('2432', '274', '泸县', '3', '510521');
INSERT INTO `litemall_region` VALUES ('2433', '274', '合江县', '3', '510522');
INSERT INTO `litemall_region` VALUES ('2434', '274', '叙永县', '3', '510524');
INSERT INTO `litemall_region` VALUES ('2435', '274', '古蔺县', '3', '510525');
INSERT INTO `litemall_region` VALUES ('2436', '275', '旌阳区', '3', '510603');
INSERT INTO `litemall_region` VALUES ('2437', '275', '中江县', '3', '510623');
INSERT INTO `litemall_region` VALUES ('2438', '275', '罗江县', '3', '510626');
INSERT INTO `litemall_region` VALUES ('2439', '275', '广汉市', '3', '510681');
INSERT INTO `litemall_region` VALUES ('2440', '275', '什邡市', '3', '510682');
INSERT INTO `litemall_region` VALUES ('2441', '275', '绵竹市', '3', '510683');
INSERT INTO `litemall_region` VALUES ('2442', '276', '涪城区', '3', '510703');
INSERT INTO `litemall_region` VALUES ('2443', '276', '游仙区', '3', '510704');
INSERT INTO `litemall_region` VALUES ('2444', '276', '安州区', '3', '510705');
INSERT INTO `litemall_region` VALUES ('2445', '276', '三台县', '3', '510722');
INSERT INTO `litemall_region` VALUES ('2446', '276', '盐亭县', '3', '510723');
INSERT INTO `litemall_region` VALUES ('2447', '276', '梓潼县', '3', '510725');
INSERT INTO `litemall_region` VALUES ('2448', '276', '北川羌族自治县', '3', '510726');
INSERT INTO `litemall_region` VALUES ('2449', '276', '平武县', '3', '510727');
INSERT INTO `litemall_region` VALUES ('2450', '276', '江油市', '3', '510781');
INSERT INTO `litemall_region` VALUES ('2451', '277', '利州区', '3', '510802');
INSERT INTO `litemall_region` VALUES ('2452', '277', '昭化区', '3', '510811');
INSERT INTO `litemall_region` VALUES ('2453', '277', '朝天区', '3', '510812');
INSERT INTO `litemall_region` VALUES ('2454', '277', '旺苍县', '3', '510821');
INSERT INTO `litemall_region` VALUES ('2455', '277', '青川县', '3', '510822');
INSERT INTO `litemall_region` VALUES ('2456', '277', '剑阁县', '3', '510823');
INSERT INTO `litemall_region` VALUES ('2457', '277', '苍溪县', '3', '510824');
INSERT INTO `litemall_region` VALUES ('2458', '278', '船山区', '3', '510903');
INSERT INTO `litemall_region` VALUES ('2459', '278', '安居区', '3', '510904');
INSERT INTO `litemall_region` VALUES ('2460', '278', '蓬溪县', '3', '510921');
INSERT INTO `litemall_region` VALUES ('2461', '278', '射洪县', '3', '510922');
INSERT INTO `litemall_region` VALUES ('2462', '278', '大英县', '3', '510923');
INSERT INTO `litemall_region` VALUES ('2463', '279', '市中区', '3', '511002');
INSERT INTO `litemall_region` VALUES ('2464', '279', '东兴区', '3', '511011');
INSERT INTO `litemall_region` VALUES ('2465', '279', '威远县', '3', '511024');
INSERT INTO `litemall_region` VALUES ('2466', '279', '资中县', '3', '511025');
INSERT INTO `litemall_region` VALUES ('2467', '279', '隆昌县', '3', '511028');
INSERT INTO `litemall_region` VALUES ('2468', '280', '市中区', '3', '511102');
INSERT INTO `litemall_region` VALUES ('2469', '280', '沙湾区', '3', '511111');
INSERT INTO `litemall_region` VALUES ('2470', '280', '五通桥区', '3', '511112');
INSERT INTO `litemall_region` VALUES ('2471', '280', '金口河区', '3', '511113');
INSERT INTO `litemall_region` VALUES ('2472', '280', '犍为县', '3', '511123');
INSERT INTO `litemall_region` VALUES ('2473', '280', '井研县', '3', '511124');
INSERT INTO `litemall_region` VALUES ('2474', '280', '夹江县', '3', '511126');
INSERT INTO `litemall_region` VALUES ('2475', '280', '沐川县', '3', '511129');
INSERT INTO `litemall_region` VALUES ('2476', '280', '峨边彝族自治县', '3', '511132');
INSERT INTO `litemall_region` VALUES ('2477', '280', '马边彝族自治县', '3', '511133');
INSERT INTO `litemall_region` VALUES ('2478', '280', '峨眉山市', '3', '511181');
INSERT INTO `litemall_region` VALUES ('2479', '281', '顺庆区', '3', '511302');
INSERT INTO `litemall_region` VALUES ('2480', '281', '高坪区', '3', '511303');
INSERT INTO `litemall_region` VALUES ('2481', '281', '嘉陵区', '3', '511304');
INSERT INTO `litemall_region` VALUES ('2482', '281', '南部县', '3', '511321');
INSERT INTO `litemall_region` VALUES ('2483', '281', '营山县', '3', '511322');
INSERT INTO `litemall_region` VALUES ('2484', '281', '蓬安县', '3', '511323');
INSERT INTO `litemall_region` VALUES ('2485', '281', '仪陇县', '3', '511324');
INSERT INTO `litemall_region` VALUES ('2486', '281', '西充县', '3', '511325');
INSERT INTO `litemall_region` VALUES ('2487', '281', '阆中市', '3', '511381');
INSERT INTO `litemall_region` VALUES ('2488', '282', '东坡区', '3', '511402');
INSERT INTO `litemall_region` VALUES ('2489', '282', '彭山区', '3', '511403');
INSERT INTO `litemall_region` VALUES ('2490', '282', '仁寿县', '3', '511421');
INSERT INTO `litemall_region` VALUES ('2491', '282', '洪雅县', '3', '511423');
INSERT INTO `litemall_region` VALUES ('2492', '282', '丹棱县', '3', '511424');
INSERT INTO `litemall_region` VALUES ('2493', '282', '青神县', '3', '511425');
INSERT INTO `litemall_region` VALUES ('2494', '283', '翠屏区', '3', '511502');
INSERT INTO `litemall_region` VALUES ('2495', '283', '南溪区', '3', '511503');
INSERT INTO `litemall_region` VALUES ('2496', '283', '宜宾县', '3', '511521');
INSERT INTO `litemall_region` VALUES ('2497', '283', '江安县', '3', '511523');
INSERT INTO `litemall_region` VALUES ('2498', '283', '长宁县', '3', '511524');
INSERT INTO `litemall_region` VALUES ('2499', '283', '高县', '3', '511525');
INSERT INTO `litemall_region` VALUES ('2500', '283', '珙县', '3', '511526');
INSERT INTO `litemall_region` VALUES ('2501', '283', '筠连县', '3', '511527');
INSERT INTO `litemall_region` VALUES ('2502', '283', '兴文县', '3', '511528');
INSERT INTO `litemall_region` VALUES ('2503', '283', '屏山县', '3', '511529');
INSERT INTO `litemall_region` VALUES ('2504', '284', '广安区', '3', '511602');
INSERT INTO `litemall_region` VALUES ('2505', '284', '前锋区', '3', '511603');
INSERT INTO `litemall_region` VALUES ('2506', '284', '岳池县', '3', '511621');
INSERT INTO `litemall_region` VALUES ('2507', '284', '武胜县', '3', '511622');
INSERT INTO `litemall_region` VALUES ('2508', '284', '邻水县', '3', '511623');
INSERT INTO `litemall_region` VALUES ('2509', '284', '华蓥市', '3', '511681');
INSERT INTO `litemall_region` VALUES ('2510', '285', '通川区', '3', '511702');
INSERT INTO `litemall_region` VALUES ('2511', '285', '达川区', '3', '511703');
INSERT INTO `litemall_region` VALUES ('2512', '285', '宣汉县', '3', '511722');
INSERT INTO `litemall_region` VALUES ('2513', '285', '开江县', '3', '511723');
INSERT INTO `litemall_region` VALUES ('2514', '285', '大竹县', '3', '511724');
INSERT INTO `litemall_region` VALUES ('2515', '285', '渠县', '3', '511725');
INSERT INTO `litemall_region` VALUES ('2516', '285', '万源市', '3', '511781');
INSERT INTO `litemall_region` VALUES ('2517', '286', '雨城区', '3', '511802');
INSERT INTO `litemall_region` VALUES ('2518', '286', '名山区', '3', '511803');
INSERT INTO `litemall_region` VALUES ('2519', '286', '荥经县', '3', '511822');
INSERT INTO `litemall_region` VALUES ('2520', '286', '汉源县', '3', '511823');
INSERT INTO `litemall_region` VALUES ('2521', '286', '石棉县', '3', '511824');
INSERT INTO `litemall_region` VALUES ('2522', '286', '天全县', '3', '511825');
INSERT INTO `litemall_region` VALUES ('2523', '286', '芦山县', '3', '511826');
INSERT INTO `litemall_region` VALUES ('2524', '286', '宝兴县', '3', '511827');
INSERT INTO `litemall_region` VALUES ('2525', '287', '巴州区', '3', '511902');
INSERT INTO `litemall_region` VALUES ('2526', '287', '恩阳区', '3', '511903');
INSERT INTO `litemall_region` VALUES ('2527', '287', '通江县', '3', '511921');
INSERT INTO `litemall_region` VALUES ('2528', '287', '南江县', '3', '511922');
INSERT INTO `litemall_region` VALUES ('2529', '287', '平昌县', '3', '511923');
INSERT INTO `litemall_region` VALUES ('2530', '288', '雁江区', '3', '512002');
INSERT INTO `litemall_region` VALUES ('2531', '288', '安岳县', '3', '512021');
INSERT INTO `litemall_region` VALUES ('2532', '288', '乐至县', '3', '512022');
INSERT INTO `litemall_region` VALUES ('2533', '289', '马尔康市', '3', '513201');
INSERT INTO `litemall_region` VALUES ('2534', '289', '汶川县', '3', '513221');
INSERT INTO `litemall_region` VALUES ('2535', '289', '理县', '3', '513222');
INSERT INTO `litemall_region` VALUES ('2536', '289', '茂县', '3', '513223');
INSERT INTO `litemall_region` VALUES ('2537', '289', '松潘县', '3', '513224');
INSERT INTO `litemall_region` VALUES ('2538', '289', '九寨沟县', '3', '513225');
INSERT INTO `litemall_region` VALUES ('2539', '289', '金川县', '3', '513226');
INSERT INTO `litemall_region` VALUES ('2540', '289', '小金县', '3', '513227');
INSERT INTO `litemall_region` VALUES ('2541', '289', '黑水县', '3', '513228');
INSERT INTO `litemall_region` VALUES ('2542', '289', '壤塘县', '3', '513230');
INSERT INTO `litemall_region` VALUES ('2543', '289', '阿坝县', '3', '513231');
INSERT INTO `litemall_region` VALUES ('2544', '289', '若尔盖县', '3', '513232');
INSERT INTO `litemall_region` VALUES ('2545', '289', '红原县', '3', '513233');
INSERT INTO `litemall_region` VALUES ('2546', '290', '康定市', '3', '513301');
INSERT INTO `litemall_region` VALUES ('2547', '290', '泸定县', '3', '513322');
INSERT INTO `litemall_region` VALUES ('2548', '290', '丹巴县', '3', '513323');
INSERT INTO `litemall_region` VALUES ('2549', '290', '九龙县', '3', '513324');
INSERT INTO `litemall_region` VALUES ('2550', '290', '雅江县', '3', '513325');
INSERT INTO `litemall_region` VALUES ('2551', '290', '道孚县', '3', '513326');
INSERT INTO `litemall_region` VALUES ('2552', '290', '炉霍县', '3', '513327');
INSERT INTO `litemall_region` VALUES ('2553', '290', '甘孜县', '3', '513328');
INSERT INTO `litemall_region` VALUES ('2554', '290', '新龙县', '3', '513329');
INSERT INTO `litemall_region` VALUES ('2555', '290', '德格县', '3', '513330');
INSERT INTO `litemall_region` VALUES ('2556', '290', '白玉县', '3', '513331');
INSERT INTO `litemall_region` VALUES ('2557', '290', '石渠县', '3', '513332');
INSERT INTO `litemall_region` VALUES ('2558', '290', '色达县', '3', '513333');
INSERT INTO `litemall_region` VALUES ('2559', '290', '理塘县', '3', '513334');
INSERT INTO `litemall_region` VALUES ('2560', '290', '巴塘县', '3', '513335');
INSERT INTO `litemall_region` VALUES ('2561', '290', '乡城县', '3', '513336');
INSERT INTO `litemall_region` VALUES ('2562', '290', '稻城县', '3', '513337');
INSERT INTO `litemall_region` VALUES ('2563', '290', '得荣县', '3', '513338');
INSERT INTO `litemall_region` VALUES ('2564', '291', '西昌市', '3', '513401');
INSERT INTO `litemall_region` VALUES ('2565', '291', '木里藏族自治县', '3', '513422');
INSERT INTO `litemall_region` VALUES ('2566', '291', '盐源县', '3', '513423');
INSERT INTO `litemall_region` VALUES ('2567', '291', '德昌县', '3', '513424');
INSERT INTO `litemall_region` VALUES ('2568', '291', '会理县', '3', '513425');
INSERT INTO `litemall_region` VALUES ('2569', '291', '会东县', '3', '513426');
INSERT INTO `litemall_region` VALUES ('2570', '291', '宁南县', '3', '513427');
INSERT INTO `litemall_region` VALUES ('2571', '291', '普格县', '3', '513428');
INSERT INTO `litemall_region` VALUES ('2572', '291', '布拖县', '3', '513429');
INSERT INTO `litemall_region` VALUES ('2573', '291', '金阳县', '3', '513430');
INSERT INTO `litemall_region` VALUES ('2574', '291', '昭觉县', '3', '513431');
INSERT INTO `litemall_region` VALUES ('2575', '291', '喜德县', '3', '513432');
INSERT INTO `litemall_region` VALUES ('2576', '291', '冕宁县', '3', '513433');
INSERT INTO `litemall_region` VALUES ('2577', '291', '越西县', '3', '513434');
INSERT INTO `litemall_region` VALUES ('2578', '291', '甘洛县', '3', '513435');
INSERT INTO `litemall_region` VALUES ('2579', '291', '美姑县', '3', '513436');
INSERT INTO `litemall_region` VALUES ('2580', '291', '雷波县', '3', '513437');
INSERT INTO `litemall_region` VALUES ('2581', '292', '南明区', '3', '520102');
INSERT INTO `litemall_region` VALUES ('2582', '292', '云岩区', '3', '520103');
INSERT INTO `litemall_region` VALUES ('2583', '292', '花溪区', '3', '520111');
INSERT INTO `litemall_region` VALUES ('2584', '292', '乌当区', '3', '520112');
INSERT INTO `litemall_region` VALUES ('2585', '292', '白云区', '3', '520113');
INSERT INTO `litemall_region` VALUES ('2586', '292', '观山湖区', '3', '520115');
INSERT INTO `litemall_region` VALUES ('2587', '292', '开阳县', '3', '520121');
INSERT INTO `litemall_region` VALUES ('2588', '292', '息烽县', '3', '520122');
INSERT INTO `litemall_region` VALUES ('2589', '292', '修文县', '3', '520123');
INSERT INTO `litemall_region` VALUES ('2590', '292', '清镇市', '3', '520181');
INSERT INTO `litemall_region` VALUES ('2591', '293', '钟山区', '3', '520201');
INSERT INTO `litemall_region` VALUES ('2592', '293', '六枝特区', '3', '520203');
INSERT INTO `litemall_region` VALUES ('2593', '293', '水城县', '3', '520221');
INSERT INTO `litemall_region` VALUES ('2594', '293', '盘县', '3', '520222');
INSERT INTO `litemall_region` VALUES ('2595', '294', '红花岗区', '3', '520302');
INSERT INTO `litemall_region` VALUES ('2596', '294', '汇川区', '3', '520303');
INSERT INTO `litemall_region` VALUES ('2597', '294', '播州区', '3', '520304');
INSERT INTO `litemall_region` VALUES ('2598', '294', '桐梓县', '3', '520322');
INSERT INTO `litemall_region` VALUES ('2599', '294', '绥阳县', '3', '520323');
INSERT INTO `litemall_region` VALUES ('2600', '294', '正安县', '3', '520324');
INSERT INTO `litemall_region` VALUES ('2601', '294', '道真仡佬族苗族自治县', '3', '520325');
INSERT INTO `litemall_region` VALUES ('2602', '294', '务川仡佬族苗族自治县', '3', '520326');
INSERT INTO `litemall_region` VALUES ('2603', '294', '凤冈县', '3', '520327');
INSERT INTO `litemall_region` VALUES ('2604', '294', '湄潭县', '3', '520328');
INSERT INTO `litemall_region` VALUES ('2605', '294', '余庆县', '3', '520329');
INSERT INTO `litemall_region` VALUES ('2606', '294', '习水县', '3', '520330');
INSERT INTO `litemall_region` VALUES ('2607', '294', '赤水市', '3', '520381');
INSERT INTO `litemall_region` VALUES ('2608', '294', '仁怀市', '3', '520382');
INSERT INTO `litemall_region` VALUES ('2609', '295', '西秀区', '3', '520402');
INSERT INTO `litemall_region` VALUES ('2610', '295', '平坝区', '3', '520403');
INSERT INTO `litemall_region` VALUES ('2611', '295', '普定县', '3', '520422');
INSERT INTO `litemall_region` VALUES ('2612', '295', '镇宁布依族苗族自治县', '3', '520423');
INSERT INTO `litemall_region` VALUES ('2613', '295', '关岭布依族苗族自治县', '3', '520424');
INSERT INTO `litemall_region` VALUES ('2614', '295', '紫云苗族布依族自治县', '3', '520425');
INSERT INTO `litemall_region` VALUES ('2615', '296', '七星关区', '3', '520502');
INSERT INTO `litemall_region` VALUES ('2616', '296', '大方县', '3', '520521');
INSERT INTO `litemall_region` VALUES ('2617', '296', '黔西县', '3', '520522');
INSERT INTO `litemall_region` VALUES ('2618', '296', '金沙县', '3', '520523');
INSERT INTO `litemall_region` VALUES ('2619', '296', '织金县', '3', '520524');
INSERT INTO `litemall_region` VALUES ('2620', '296', '纳雍县', '3', '520525');
INSERT INTO `litemall_region` VALUES ('2621', '296', '威宁彝族回族苗族自治县', '3', '520526');
INSERT INTO `litemall_region` VALUES ('2622', '296', '赫章县', '3', '520527');
INSERT INTO `litemall_region` VALUES ('2623', '297', '碧江区', '3', '520602');
INSERT INTO `litemall_region` VALUES ('2624', '297', '万山区', '3', '520603');
INSERT INTO `litemall_region` VALUES ('2625', '297', '江口县', '3', '520621');
INSERT INTO `litemall_region` VALUES ('2626', '297', '玉屏侗族自治县', '3', '520622');
INSERT INTO `litemall_region` VALUES ('2627', '297', '石阡县', '3', '520623');
INSERT INTO `litemall_region` VALUES ('2628', '297', '思南县', '3', '520624');
INSERT INTO `litemall_region` VALUES ('2629', '297', '印江土家族苗族自治县', '3', '520625');
INSERT INTO `litemall_region` VALUES ('2630', '297', '德江县', '3', '520626');
INSERT INTO `litemall_region` VALUES ('2631', '297', '沿河土家族自治县', '3', '520627');
INSERT INTO `litemall_region` VALUES ('2632', '297', '松桃苗族自治县', '3', '520628');
INSERT INTO `litemall_region` VALUES ('2633', '298', '兴义市', '3', '522301');
INSERT INTO `litemall_region` VALUES ('2634', '298', '兴仁县', '3', '522322');
INSERT INTO `litemall_region` VALUES ('2635', '298', '普安县', '3', '522323');
INSERT INTO `litemall_region` VALUES ('2636', '298', '晴隆县', '3', '522324');
INSERT INTO `litemall_region` VALUES ('2637', '298', '贞丰县', '3', '522325');
INSERT INTO `litemall_region` VALUES ('2638', '298', '望谟县', '3', '522326');
INSERT INTO `litemall_region` VALUES ('2639', '298', '册亨县', '3', '522327');
INSERT INTO `litemall_region` VALUES ('2640', '298', '安龙县', '3', '522328');
INSERT INTO `litemall_region` VALUES ('2641', '299', '凯里市', '3', '522601');
INSERT INTO `litemall_region` VALUES ('2642', '299', '黄平县', '3', '522622');
INSERT INTO `litemall_region` VALUES ('2643', '299', '施秉县', '3', '522623');
INSERT INTO `litemall_region` VALUES ('2644', '299', '三穗县', '3', '522624');
INSERT INTO `litemall_region` VALUES ('2645', '299', '镇远县', '3', '522625');
INSERT INTO `litemall_region` VALUES ('2646', '299', '岑巩县', '3', '522626');
INSERT INTO `litemall_region` VALUES ('2647', '299', '天柱县', '3', '522627');
INSERT INTO `litemall_region` VALUES ('2648', '299', '锦屏县', '3', '522628');
INSERT INTO `litemall_region` VALUES ('2649', '299', '剑河县', '3', '522629');
INSERT INTO `litemall_region` VALUES ('2650', '299', '台江县', '3', '522630');
INSERT INTO `litemall_region` VALUES ('2651', '299', '黎平县', '3', '522631');
INSERT INTO `litemall_region` VALUES ('2652', '299', '榕江县', '3', '522632');
INSERT INTO `litemall_region` VALUES ('2653', '299', '从江县', '3', '522633');
INSERT INTO `litemall_region` VALUES ('2654', '299', '雷山县', '3', '522634');
INSERT INTO `litemall_region` VALUES ('2655', '299', '麻江县', '3', '522635');
INSERT INTO `litemall_region` VALUES ('2656', '299', '丹寨县', '3', '522636');
INSERT INTO `litemall_region` VALUES ('2657', '300', '都匀市', '3', '522701');
INSERT INTO `litemall_region` VALUES ('2658', '300', '福泉市', '3', '522702');
INSERT INTO `litemall_region` VALUES ('2659', '300', '荔波县', '3', '522722');
INSERT INTO `litemall_region` VALUES ('2660', '300', '贵定县', '3', '522723');
INSERT INTO `litemall_region` VALUES ('2661', '300', '瓮安县', '3', '522725');
INSERT INTO `litemall_region` VALUES ('2662', '300', '独山县', '3', '522726');
INSERT INTO `litemall_region` VALUES ('2663', '300', '平塘县', '3', '522727');
INSERT INTO `litemall_region` VALUES ('2664', '300', '罗甸县', '3', '522728');
INSERT INTO `litemall_region` VALUES ('2665', '300', '长顺县', '3', '522729');
INSERT INTO `litemall_region` VALUES ('2666', '300', '龙里县', '3', '522730');
INSERT INTO `litemall_region` VALUES ('2667', '300', '惠水县', '3', '522731');
INSERT INTO `litemall_region` VALUES ('2668', '300', '三都水族自治县', '3', '522732');
INSERT INTO `litemall_region` VALUES ('2669', '301', '五华区', '3', '530102');
INSERT INTO `litemall_region` VALUES ('2670', '301', '盘龙区', '3', '530103');
INSERT INTO `litemall_region` VALUES ('2671', '301', '官渡区', '3', '530111');
INSERT INTO `litemall_region` VALUES ('2672', '301', '西山区', '3', '530112');
INSERT INTO `litemall_region` VALUES ('2673', '301', '东川区', '3', '530113');
INSERT INTO `litemall_region` VALUES ('2674', '301', '呈贡区', '3', '530114');
INSERT INTO `litemall_region` VALUES ('2675', '301', '晋宁县', '3', '530122');
INSERT INTO `litemall_region` VALUES ('2676', '301', '富民县', '3', '530124');
INSERT INTO `litemall_region` VALUES ('2677', '301', '宜良县', '3', '530125');
INSERT INTO `litemall_region` VALUES ('2678', '301', '石林彝族自治县', '3', '530126');
INSERT INTO `litemall_region` VALUES ('2679', '301', '嵩明县', '3', '530127');
INSERT INTO `litemall_region` VALUES ('2680', '301', '禄劝彝族苗族自治县', '3', '530128');
INSERT INTO `litemall_region` VALUES ('2681', '301', '寻甸回族彝族自治县', '3', '530129');
INSERT INTO `litemall_region` VALUES ('2682', '301', '安宁市', '3', '530181');
INSERT INTO `litemall_region` VALUES ('2683', '302', '麒麟区', '3', '530302');
INSERT INTO `litemall_region` VALUES ('2684', '302', '沾益区', '3', '530303');
INSERT INTO `litemall_region` VALUES ('2685', '302', '马龙县', '3', '530321');
INSERT INTO `litemall_region` VALUES ('2686', '302', '陆良县', '3', '530322');
INSERT INTO `litemall_region` VALUES ('2687', '302', '师宗县', '3', '530323');
INSERT INTO `litemall_region` VALUES ('2688', '302', '罗平县', '3', '530324');
INSERT INTO `litemall_region` VALUES ('2689', '302', '富源县', '3', '530325');
INSERT INTO `litemall_region` VALUES ('2690', '302', '会泽县', '3', '530326');
INSERT INTO `litemall_region` VALUES ('2691', '302', '宣威市', '3', '530381');
INSERT INTO `litemall_region` VALUES ('2692', '303', '红塔区', '3', '530402');
INSERT INTO `litemall_region` VALUES ('2693', '303', '江川区', '3', '530403');
INSERT INTO `litemall_region` VALUES ('2694', '303', '澄江县', '3', '530422');
INSERT INTO `litemall_region` VALUES ('2695', '303', '通海县', '3', '530423');
INSERT INTO `litemall_region` VALUES ('2696', '303', '华宁县', '3', '530424');
INSERT INTO `litemall_region` VALUES ('2697', '303', '易门县', '3', '530425');
INSERT INTO `litemall_region` VALUES ('2698', '303', '峨山彝族自治县', '3', '530426');
INSERT INTO `litemall_region` VALUES ('2699', '303', '新平彝族傣族自治县', '3', '530427');
INSERT INTO `litemall_region` VALUES ('2700', '303', '元江哈尼族彝族傣族自治县', '3', '530428');
INSERT INTO `litemall_region` VALUES ('2701', '304', '隆阳区', '3', '530502');
INSERT INTO `litemall_region` VALUES ('2702', '304', '施甸县', '3', '530521');
INSERT INTO `litemall_region` VALUES ('2703', '304', '龙陵县', '3', '530523');
INSERT INTO `litemall_region` VALUES ('2704', '304', '昌宁县', '3', '530524');
INSERT INTO `litemall_region` VALUES ('2705', '304', '腾冲市', '3', '530581');
INSERT INTO `litemall_region` VALUES ('2706', '305', '昭阳区', '3', '530602');
INSERT INTO `litemall_region` VALUES ('2707', '305', '鲁甸县', '3', '530621');
INSERT INTO `litemall_region` VALUES ('2708', '305', '巧家县', '3', '530622');
INSERT INTO `litemall_region` VALUES ('2709', '305', '盐津县', '3', '530623');
INSERT INTO `litemall_region` VALUES ('2710', '305', '大关县', '3', '530624');
INSERT INTO `litemall_region` VALUES ('2711', '305', '永善县', '3', '530625');
INSERT INTO `litemall_region` VALUES ('2712', '305', '绥江县', '3', '530626');
INSERT INTO `litemall_region` VALUES ('2713', '305', '镇雄县', '3', '530627');
INSERT INTO `litemall_region` VALUES ('2714', '305', '彝良县', '3', '530628');
INSERT INTO `litemall_region` VALUES ('2715', '305', '威信县', '3', '530629');
INSERT INTO `litemall_region` VALUES ('2716', '305', '水富县', '3', '530630');
INSERT INTO `litemall_region` VALUES ('2717', '306', '古城区', '3', '530702');
INSERT INTO `litemall_region` VALUES ('2718', '306', '玉龙纳西族自治县', '3', '530721');
INSERT INTO `litemall_region` VALUES ('2719', '306', '永胜县', '3', '530722');
INSERT INTO `litemall_region` VALUES ('2720', '306', '华坪县', '3', '530723');
INSERT INTO `litemall_region` VALUES ('2721', '306', '宁蒗彝族自治县', '3', '530724');
INSERT INTO `litemall_region` VALUES ('2722', '307', '思茅区', '3', '530802');
INSERT INTO `litemall_region` VALUES ('2723', '307', '宁洱哈尼族彝族自治县', '3', '530821');
INSERT INTO `litemall_region` VALUES ('2724', '307', '墨江哈尼族自治县', '3', '530822');
INSERT INTO `litemall_region` VALUES ('2725', '307', '景东彝族自治县', '3', '530823');
INSERT INTO `litemall_region` VALUES ('2726', '307', '景谷傣族彝族自治县', '3', '530824');
INSERT INTO `litemall_region` VALUES ('2727', '307', '镇沅彝族哈尼族拉祜族自治县', '3', '530825');
INSERT INTO `litemall_region` VALUES ('2728', '307', '江城哈尼族彝族自治县', '3', '530826');
INSERT INTO `litemall_region` VALUES ('2729', '307', '孟连傣族拉祜族佤族自治县', '3', '530827');
INSERT INTO `litemall_region` VALUES ('2730', '307', '澜沧拉祜族自治县', '3', '530828');
INSERT INTO `litemall_region` VALUES ('2731', '307', '西盟佤族自治县', '3', '530829');
INSERT INTO `litemall_region` VALUES ('2732', '308', '临翔区', '3', '530902');
INSERT INTO `litemall_region` VALUES ('2733', '308', '凤庆县', '3', '530921');
INSERT INTO `litemall_region` VALUES ('2734', '308', '云县', '3', '530922');
INSERT INTO `litemall_region` VALUES ('2735', '308', '永德县', '3', '530923');
INSERT INTO `litemall_region` VALUES ('2736', '308', '镇康县', '3', '530924');
INSERT INTO `litemall_region` VALUES ('2737', '308', '双江拉祜族佤族布朗族傣族自治县', '3', '530925');
INSERT INTO `litemall_region` VALUES ('2738', '308', '耿马傣族佤族自治县', '3', '530926');
INSERT INTO `litemall_region` VALUES ('2739', '308', '沧源佤族自治县', '3', '530927');
INSERT INTO `litemall_region` VALUES ('2740', '309', '楚雄市', '3', '532301');
INSERT INTO `litemall_region` VALUES ('2741', '309', '双柏县', '3', '532322');
INSERT INTO `litemall_region` VALUES ('2742', '309', '牟定县', '3', '532323');
INSERT INTO `litemall_region` VALUES ('2743', '309', '南华县', '3', '532324');
INSERT INTO `litemall_region` VALUES ('2744', '309', '姚安县', '3', '532325');
INSERT INTO `litemall_region` VALUES ('2745', '309', '大姚县', '3', '532326');
INSERT INTO `litemall_region` VALUES ('2746', '309', '永仁县', '3', '532327');
INSERT INTO `litemall_region` VALUES ('2747', '309', '元谋县', '3', '532328');
INSERT INTO `litemall_region` VALUES ('2748', '309', '武定县', '3', '532329');
INSERT INTO `litemall_region` VALUES ('2749', '309', '禄丰县', '3', '532331');
INSERT INTO `litemall_region` VALUES ('2750', '310', '个旧市', '3', '532501');
INSERT INTO `litemall_region` VALUES ('2751', '310', '开远市', '3', '532502');
INSERT INTO `litemall_region` VALUES ('2752', '310', '蒙自市', '3', '532503');
INSERT INTO `litemall_region` VALUES ('2753', '310', '弥勒市', '3', '532504');
INSERT INTO `litemall_region` VALUES ('2754', '310', '屏边苗族自治县', '3', '532523');
INSERT INTO `litemall_region` VALUES ('2755', '310', '建水县', '3', '532524');
INSERT INTO `litemall_region` VALUES ('2756', '310', '石屏县', '3', '532525');
INSERT INTO `litemall_region` VALUES ('2757', '310', '泸西县', '3', '532527');
INSERT INTO `litemall_region` VALUES ('2758', '310', '元阳县', '3', '532528');
INSERT INTO `litemall_region` VALUES ('2759', '310', '红河县', '3', '532529');
INSERT INTO `litemall_region` VALUES ('2760', '310', '金平苗族瑶族傣族自治县', '3', '532530');
INSERT INTO `litemall_region` VALUES ('2761', '310', '绿春县', '3', '532531');
INSERT INTO `litemall_region` VALUES ('2762', '310', '河口瑶族自治县', '3', '532532');
INSERT INTO `litemall_region` VALUES ('2763', '311', '文山市', '3', '532601');
INSERT INTO `litemall_region` VALUES ('2764', '311', '砚山县', '3', '532622');
INSERT INTO `litemall_region` VALUES ('2765', '311', '西畴县', '3', '532623');
INSERT INTO `litemall_region` VALUES ('2766', '311', '麻栗坡县', '3', '532624');
INSERT INTO `litemall_region` VALUES ('2767', '311', '马关县', '3', '532625');
INSERT INTO `litemall_region` VALUES ('2768', '311', '丘北县', '3', '532626');
INSERT INTO `litemall_region` VALUES ('2769', '311', '广南县', '3', '532627');
INSERT INTO `litemall_region` VALUES ('2770', '311', '富宁县', '3', '532628');
INSERT INTO `litemall_region` VALUES ('2771', '312', '景洪市', '3', '532801');
INSERT INTO `litemall_region` VALUES ('2772', '312', '勐海县', '3', '532822');
INSERT INTO `litemall_region` VALUES ('2773', '312', '勐腊县', '3', '532823');
INSERT INTO `litemall_region` VALUES ('2774', '313', '大理市', '3', '532901');
INSERT INTO `litemall_region` VALUES ('2775', '313', '漾濞彝族自治县', '3', '532922');
INSERT INTO `litemall_region` VALUES ('2776', '313', '祥云县', '3', '532923');
INSERT INTO `litemall_region` VALUES ('2777', '313', '宾川县', '3', '532924');
INSERT INTO `litemall_region` VALUES ('2778', '313', '弥渡县', '3', '532925');
INSERT INTO `litemall_region` VALUES ('2779', '313', '南涧彝族自治县', '3', '532926');
INSERT INTO `litemall_region` VALUES ('2780', '313', '巍山彝族回族自治县', '3', '532927');
INSERT INTO `litemall_region` VALUES ('2781', '313', '永平县', '3', '532928');
INSERT INTO `litemall_region` VALUES ('2782', '313', '云龙县', '3', '532929');
INSERT INTO `litemall_region` VALUES ('2783', '313', '洱源县', '3', '532930');
INSERT INTO `litemall_region` VALUES ('2784', '313', '剑川县', '3', '532931');
INSERT INTO `litemall_region` VALUES ('2785', '313', '鹤庆县', '3', '532932');
INSERT INTO `litemall_region` VALUES ('2786', '314', '瑞丽市', '3', '533102');
INSERT INTO `litemall_region` VALUES ('2787', '314', '芒市', '3', '533103');
INSERT INTO `litemall_region` VALUES ('2788', '314', '梁河县', '3', '533122');
INSERT INTO `litemall_region` VALUES ('2789', '314', '盈江县', '3', '533123');
INSERT INTO `litemall_region` VALUES ('2790', '314', '陇川县', '3', '533124');
INSERT INTO `litemall_region` VALUES ('2791', '315', '泸水市', '3', '533301');
INSERT INTO `litemall_region` VALUES ('2792', '315', '福贡县', '3', '533323');
INSERT INTO `litemall_region` VALUES ('2793', '315', '贡山独龙族怒族自治县', '3', '533324');
INSERT INTO `litemall_region` VALUES ('2794', '315', '兰坪白族普米族自治县', '3', '533325');
INSERT INTO `litemall_region` VALUES ('2795', '316', '香格里拉市', '3', '533401');
INSERT INTO `litemall_region` VALUES ('2796', '316', '德钦县', '3', '533422');
INSERT INTO `litemall_region` VALUES ('2797', '316', '维西傈僳族自治县', '3', '533423');
INSERT INTO `litemall_region` VALUES ('2798', '317', '城关区', '3', '540102');
INSERT INTO `litemall_region` VALUES ('2799', '317', '堆龙德庆区', '3', '540103');
INSERT INTO `litemall_region` VALUES ('2800', '317', '林周县', '3', '540121');
INSERT INTO `litemall_region` VALUES ('2801', '317', '当雄县', '3', '540122');
INSERT INTO `litemall_region` VALUES ('2802', '317', '尼木县', '3', '540123');
INSERT INTO `litemall_region` VALUES ('2803', '317', '曲水县', '3', '540124');
INSERT INTO `litemall_region` VALUES ('2804', '317', '达孜县', '3', '540126');
INSERT INTO `litemall_region` VALUES ('2805', '317', '墨竹工卡县', '3', '540127');
INSERT INTO `litemall_region` VALUES ('2806', '318', '桑珠孜区', '3', '540202');
INSERT INTO `litemall_region` VALUES ('2807', '318', '南木林县', '3', '540221');
INSERT INTO `litemall_region` VALUES ('2808', '318', '江孜县', '3', '540222');
INSERT INTO `litemall_region` VALUES ('2809', '318', '定日县', '3', '540223');
INSERT INTO `litemall_region` VALUES ('2810', '318', '萨迦县', '3', '540224');
INSERT INTO `litemall_region` VALUES ('2811', '318', '拉孜县', '3', '540225');
INSERT INTO `litemall_region` VALUES ('2812', '318', '昂仁县', '3', '540226');
INSERT INTO `litemall_region` VALUES ('2813', '318', '谢通门县', '3', '540227');
INSERT INTO `litemall_region` VALUES ('2814', '318', '白朗县', '3', '540228');
INSERT INTO `litemall_region` VALUES ('2815', '318', '仁布县', '3', '540229');
INSERT INTO `litemall_region` VALUES ('2816', '318', '康马县', '3', '540230');
INSERT INTO `litemall_region` VALUES ('2817', '318', '定结县', '3', '540231');
INSERT INTO `litemall_region` VALUES ('2818', '318', '仲巴县', '3', '540232');
INSERT INTO `litemall_region` VALUES ('2819', '318', '亚东县', '3', '540233');
INSERT INTO `litemall_region` VALUES ('2820', '318', '吉隆县', '3', '540234');
INSERT INTO `litemall_region` VALUES ('2821', '318', '聂拉木县', '3', '540235');
INSERT INTO `litemall_region` VALUES ('2822', '318', '萨嘎县', '3', '540236');
INSERT INTO `litemall_region` VALUES ('2823', '318', '岗巴县', '3', '540237');
INSERT INTO `litemall_region` VALUES ('2824', '319', '卡若区', '3', '540302');
INSERT INTO `litemall_region` VALUES ('2825', '319', '江达县', '3', '540321');
INSERT INTO `litemall_region` VALUES ('2826', '319', '贡觉县', '3', '540322');
INSERT INTO `litemall_region` VALUES ('2827', '319', '类乌齐县', '3', '540323');
INSERT INTO `litemall_region` VALUES ('2828', '319', '丁青县', '3', '540324');
INSERT INTO `litemall_region` VALUES ('2829', '319', '察雅县', '3', '540325');
INSERT INTO `litemall_region` VALUES ('2830', '319', '八宿县', '3', '540326');
INSERT INTO `litemall_region` VALUES ('2831', '319', '左贡县', '3', '540327');
INSERT INTO `litemall_region` VALUES ('2832', '319', '芒康县', '3', '540328');
INSERT INTO `litemall_region` VALUES ('2833', '319', '洛隆县', '3', '540329');
INSERT INTO `litemall_region` VALUES ('2834', '319', '边坝县', '3', '540330');
INSERT INTO `litemall_region` VALUES ('2835', '320', '巴宜区', '3', '540402');
INSERT INTO `litemall_region` VALUES ('2836', '320', '工布江达县', '3', '540421');
INSERT INTO `litemall_region` VALUES ('2837', '320', '米林县', '3', '540422');
INSERT INTO `litemall_region` VALUES ('2838', '320', '墨脱县', '3', '540423');
INSERT INTO `litemall_region` VALUES ('2839', '320', '波密县', '3', '540424');
INSERT INTO `litemall_region` VALUES ('2840', '320', '察隅县', '3', '540425');
INSERT INTO `litemall_region` VALUES ('2841', '320', '朗县', '3', '540426');
INSERT INTO `litemall_region` VALUES ('2842', '321', '乃东区', '3', '540502');
INSERT INTO `litemall_region` VALUES ('2843', '321', '扎囊县', '3', '540521');
INSERT INTO `litemall_region` VALUES ('2844', '321', '贡嘎县', '3', '540522');
INSERT INTO `litemall_region` VALUES ('2845', '321', '桑日县', '3', '540523');
INSERT INTO `litemall_region` VALUES ('2846', '321', '琼结县', '3', '540524');
INSERT INTO `litemall_region` VALUES ('2847', '321', '曲松县', '3', '540525');
INSERT INTO `litemall_region` VALUES ('2848', '321', '措美县', '3', '540526');
INSERT INTO `litemall_region` VALUES ('2849', '321', '洛扎县', '3', '540527');
INSERT INTO `litemall_region` VALUES ('2850', '321', '加查县', '3', '540528');
INSERT INTO `litemall_region` VALUES ('2851', '321', '隆子县', '3', '540529');
INSERT INTO `litemall_region` VALUES ('2852', '321', '错那县', '3', '540530');
INSERT INTO `litemall_region` VALUES ('2853', '321', '浪卡子县', '3', '540531');
INSERT INTO `litemall_region` VALUES ('2854', '322', '那曲县', '3', '542421');
INSERT INTO `litemall_region` VALUES ('2855', '322', '嘉黎县', '3', '542422');
INSERT INTO `litemall_region` VALUES ('2856', '322', '比如县', '3', '542423');
INSERT INTO `litemall_region` VALUES ('2857', '322', '聂荣县', '3', '542424');
INSERT INTO `litemall_region` VALUES ('2858', '322', '安多县', '3', '542425');
INSERT INTO `litemall_region` VALUES ('2859', '322', '申扎县', '3', '542426');
INSERT INTO `litemall_region` VALUES ('2860', '322', '索县', '3', '542427');
INSERT INTO `litemall_region` VALUES ('2861', '322', '班戈县', '3', '542428');
INSERT INTO `litemall_region` VALUES ('2862', '322', '巴青县', '3', '542429');
INSERT INTO `litemall_region` VALUES ('2863', '322', '尼玛县', '3', '542430');
INSERT INTO `litemall_region` VALUES ('2864', '322', '双湖县', '3', '542431');
INSERT INTO `litemall_region` VALUES ('2865', '323', '普兰县', '3', '542521');
INSERT INTO `litemall_region` VALUES ('2866', '323', '札达县', '3', '542522');
INSERT INTO `litemall_region` VALUES ('2867', '323', '噶尔县', '3', '542523');
INSERT INTO `litemall_region` VALUES ('2868', '323', '日土县', '3', '542524');
INSERT INTO `litemall_region` VALUES ('2869', '323', '革吉县', '3', '542525');
INSERT INTO `litemall_region` VALUES ('2870', '323', '改则县', '3', '542526');
INSERT INTO `litemall_region` VALUES ('2871', '323', '措勤县', '3', '542527');
INSERT INTO `litemall_region` VALUES ('2872', '324', '新城区', '3', '610102');
INSERT INTO `litemall_region` VALUES ('2873', '324', '碑林区', '3', '610103');
INSERT INTO `litemall_region` VALUES ('2874', '324', '莲湖区', '3', '610104');
INSERT INTO `litemall_region` VALUES ('2875', '324', '灞桥区', '3', '610111');
INSERT INTO `litemall_region` VALUES ('2876', '324', '未央区', '3', '610112');
INSERT INTO `litemall_region` VALUES ('2877', '324', '雁塔区', '3', '610113');
INSERT INTO `litemall_region` VALUES ('2878', '324', '阎良区', '3', '610114');
INSERT INTO `litemall_region` VALUES ('2879', '324', '临潼区', '3', '610115');
INSERT INTO `litemall_region` VALUES ('2880', '324', '长安区', '3', '610116');
INSERT INTO `litemall_region` VALUES ('2881', '324', '高陵区', '3', '610117');
INSERT INTO `litemall_region` VALUES ('2882', '324', '蓝田县', '3', '610122');
INSERT INTO `litemall_region` VALUES ('2883', '324', '周至县', '3', '610124');
INSERT INTO `litemall_region` VALUES ('2884', '324', '户县', '3', '610125');
INSERT INTO `litemall_region` VALUES ('2885', '325', '王益区', '3', '610202');
INSERT INTO `litemall_region` VALUES ('2886', '325', '印台区', '3', '610203');
INSERT INTO `litemall_region` VALUES ('2887', '325', '耀州区', '3', '610204');
INSERT INTO `litemall_region` VALUES ('2888', '325', '宜君县', '3', '610222');
INSERT INTO `litemall_region` VALUES ('2889', '326', '渭滨区', '3', '610302');
INSERT INTO `litemall_region` VALUES ('2890', '326', '金台区', '3', '610303');
INSERT INTO `litemall_region` VALUES ('2891', '326', '陈仓区', '3', '610304');
INSERT INTO `litemall_region` VALUES ('2892', '326', '凤翔县', '3', '610322');
INSERT INTO `litemall_region` VALUES ('2893', '326', '岐山县', '3', '610323');
INSERT INTO `litemall_region` VALUES ('2894', '326', '扶风县', '3', '610324');
INSERT INTO `litemall_region` VALUES ('2895', '326', '眉县', '3', '610326');
INSERT INTO `litemall_region` VALUES ('2896', '326', '陇县', '3', '610327');
INSERT INTO `litemall_region` VALUES ('2897', '326', '千阳县', '3', '610328');
INSERT INTO `litemall_region` VALUES ('2898', '326', '麟游县', '3', '610329');
INSERT INTO `litemall_region` VALUES ('2899', '326', '凤县', '3', '610330');
INSERT INTO `litemall_region` VALUES ('2900', '326', '太白县', '3', '610331');
INSERT INTO `litemall_region` VALUES ('2901', '327', '秦都区', '3', '610402');
INSERT INTO `litemall_region` VALUES ('2902', '327', '杨陵区', '3', '610403');
INSERT INTO `litemall_region` VALUES ('2903', '327', '渭城区', '3', '610404');
INSERT INTO `litemall_region` VALUES ('2904', '327', '三原县', '3', '610422');
INSERT INTO `litemall_region` VALUES ('2905', '327', '泾阳县', '3', '610423');
INSERT INTO `litemall_region` VALUES ('2906', '327', '乾县', '3', '610424');
INSERT INTO `litemall_region` VALUES ('2907', '327', '礼泉县', '3', '610425');
INSERT INTO `litemall_region` VALUES ('2908', '327', '永寿县', '3', '610426');
INSERT INTO `litemall_region` VALUES ('2909', '327', '彬县', '3', '610427');
INSERT INTO `litemall_region` VALUES ('2910', '327', '长武县', '3', '610428');
INSERT INTO `litemall_region` VALUES ('2911', '327', '旬邑县', '3', '610429');
INSERT INTO `litemall_region` VALUES ('2912', '327', '淳化县', '3', '610430');
INSERT INTO `litemall_region` VALUES ('2913', '327', '武功县', '3', '610431');
INSERT INTO `litemall_region` VALUES ('2914', '327', '兴平市', '3', '610481');
INSERT INTO `litemall_region` VALUES ('2915', '328', '临渭区', '3', '610502');
INSERT INTO `litemall_region` VALUES ('2916', '328', '华州区', '3', '610503');
INSERT INTO `litemall_region` VALUES ('2917', '328', '潼关县', '3', '610522');
INSERT INTO `litemall_region` VALUES ('2918', '328', '大荔县', '3', '610523');
INSERT INTO `litemall_region` VALUES ('2919', '328', '合阳县', '3', '610524');
INSERT INTO `litemall_region` VALUES ('2920', '328', '澄城县', '3', '610525');
INSERT INTO `litemall_region` VALUES ('2921', '328', '蒲城县', '3', '610526');
INSERT INTO `litemall_region` VALUES ('2922', '328', '白水县', '3', '610527');
INSERT INTO `litemall_region` VALUES ('2923', '328', '富平县', '3', '610528');
INSERT INTO `litemall_region` VALUES ('2924', '328', '韩城市', '3', '610581');
INSERT INTO `litemall_region` VALUES ('2925', '328', '华阴市', '3', '610582');
INSERT INTO `litemall_region` VALUES ('2926', '329', '宝塔区', '3', '610602');
INSERT INTO `litemall_region` VALUES ('2927', '329', '安塞区', '3', '610603');
INSERT INTO `litemall_region` VALUES ('2928', '329', '延长县', '3', '610621');
INSERT INTO `litemall_region` VALUES ('2929', '329', '延川县', '3', '610622');
INSERT INTO `litemall_region` VALUES ('2930', '329', '子长县', '3', '610623');
INSERT INTO `litemall_region` VALUES ('2931', '329', '志丹县', '3', '610625');
INSERT INTO `litemall_region` VALUES ('2932', '329', '吴起县', '3', '610626');
INSERT INTO `litemall_region` VALUES ('2933', '329', '甘泉县', '3', '610627');
INSERT INTO `litemall_region` VALUES ('2934', '329', '富县', '3', '610628');
INSERT INTO `litemall_region` VALUES ('2935', '329', '洛川县', '3', '610629');
INSERT INTO `litemall_region` VALUES ('2936', '329', '宜川县', '3', '610630');
INSERT INTO `litemall_region` VALUES ('2937', '329', '黄龙县', '3', '610631');
INSERT INTO `litemall_region` VALUES ('2938', '329', '黄陵县', '3', '610632');
INSERT INTO `litemall_region` VALUES ('2939', '330', '汉台区', '3', '610702');
INSERT INTO `litemall_region` VALUES ('2940', '330', '南郑县', '3', '610721');
INSERT INTO `litemall_region` VALUES ('2941', '330', '城固县', '3', '610722');
INSERT INTO `litemall_region` VALUES ('2942', '330', '洋县', '3', '610723');
INSERT INTO `litemall_region` VALUES ('2943', '330', '西乡县', '3', '610724');
INSERT INTO `litemall_region` VALUES ('2944', '330', '勉县', '3', '610725');
INSERT INTO `litemall_region` VALUES ('2945', '330', '宁强县', '3', '610726');
INSERT INTO `litemall_region` VALUES ('2946', '330', '略阳县', '3', '610727');
INSERT INTO `litemall_region` VALUES ('2947', '330', '镇巴县', '3', '610728');
INSERT INTO `litemall_region` VALUES ('2948', '330', '留坝县', '3', '610729');
INSERT INTO `litemall_region` VALUES ('2949', '330', '佛坪县', '3', '610730');
INSERT INTO `litemall_region` VALUES ('2950', '331', '榆阳区', '3', '610802');
INSERT INTO `litemall_region` VALUES ('2951', '331', '横山区', '3', '610803');
INSERT INTO `litemall_region` VALUES ('2952', '331', '神木县', '3', '610821');
INSERT INTO `litemall_region` VALUES ('2953', '331', '府谷县', '3', '610822');
INSERT INTO `litemall_region` VALUES ('2954', '331', '靖边县', '3', '610824');
INSERT INTO `litemall_region` VALUES ('2955', '331', '定边县', '3', '610825');
INSERT INTO `litemall_region` VALUES ('2956', '331', '绥德县', '3', '610826');
INSERT INTO `litemall_region` VALUES ('2957', '331', '米脂县', '3', '610827');
INSERT INTO `litemall_region` VALUES ('2958', '331', '佳县', '3', '610828');
INSERT INTO `litemall_region` VALUES ('2959', '331', '吴堡县', '3', '610829');
INSERT INTO `litemall_region` VALUES ('2960', '331', '清涧县', '3', '610830');
INSERT INTO `litemall_region` VALUES ('2961', '331', '子洲县', '3', '610831');
INSERT INTO `litemall_region` VALUES ('2962', '332', '汉滨区', '3', '610902');
INSERT INTO `litemall_region` VALUES ('2963', '332', '汉阴县', '3', '610921');
INSERT INTO `litemall_region` VALUES ('2964', '332', '石泉县', '3', '610922');
INSERT INTO `litemall_region` VALUES ('2965', '332', '宁陕县', '3', '610923');
INSERT INTO `litemall_region` VALUES ('2966', '332', '紫阳县', '3', '610924');
INSERT INTO `litemall_region` VALUES ('2967', '332', '岚皋县', '3', '610925');
INSERT INTO `litemall_region` VALUES ('2968', '332', '平利县', '3', '610926');
INSERT INTO `litemall_region` VALUES ('2969', '332', '镇坪县', '3', '610927');
INSERT INTO `litemall_region` VALUES ('2970', '332', '旬阳县', '3', '610928');
INSERT INTO `litemall_region` VALUES ('2971', '332', '白河县', '3', '610929');
INSERT INTO `litemall_region` VALUES ('2972', '333', '商州区', '3', '611002');
INSERT INTO `litemall_region` VALUES ('2973', '333', '洛南县', '3', '611021');
INSERT INTO `litemall_region` VALUES ('2974', '333', '丹凤县', '3', '611022');
INSERT INTO `litemall_region` VALUES ('2975', '333', '商南县', '3', '611023');
INSERT INTO `litemall_region` VALUES ('2976', '333', '山阳县', '3', '611024');
INSERT INTO `litemall_region` VALUES ('2977', '333', '镇安县', '3', '611025');
INSERT INTO `litemall_region` VALUES ('2978', '333', '柞水县', '3', '611026');
INSERT INTO `litemall_region` VALUES ('2979', '334', '城关区', '3', '620102');
INSERT INTO `litemall_region` VALUES ('2980', '334', '七里河区', '3', '620103');
INSERT INTO `litemall_region` VALUES ('2981', '334', '西固区', '3', '620104');
INSERT INTO `litemall_region` VALUES ('2982', '334', '安宁区', '3', '620105');
INSERT INTO `litemall_region` VALUES ('2983', '334', '红古区', '3', '620111');
INSERT INTO `litemall_region` VALUES ('2984', '334', '永登县', '3', '620121');
INSERT INTO `litemall_region` VALUES ('2985', '334', '皋兰县', '3', '620122');
INSERT INTO `litemall_region` VALUES ('2986', '334', '榆中县', '3', '620123');
INSERT INTO `litemall_region` VALUES ('2987', '335', '嘉峪关市', '3', '620201');
INSERT INTO `litemall_region` VALUES ('2988', '336', '金川区', '3', '620302');
INSERT INTO `litemall_region` VALUES ('2989', '336', '永昌县', '3', '620321');
INSERT INTO `litemall_region` VALUES ('2990', '337', '白银区', '3', '620402');
INSERT INTO `litemall_region` VALUES ('2991', '337', '平川区', '3', '620403');
INSERT INTO `litemall_region` VALUES ('2992', '337', '靖远县', '3', '620421');
INSERT INTO `litemall_region` VALUES ('2993', '337', '会宁县', '3', '620422');
INSERT INTO `litemall_region` VALUES ('2994', '337', '景泰县', '3', '620423');
INSERT INTO `litemall_region` VALUES ('2995', '338', '秦州区', '3', '620502');
INSERT INTO `litemall_region` VALUES ('2996', '338', '麦积区', '3', '620503');
INSERT INTO `litemall_region` VALUES ('2997', '338', '清水县', '3', '620521');
INSERT INTO `litemall_region` VALUES ('2998', '338', '秦安县', '3', '620522');
INSERT INTO `litemall_region` VALUES ('2999', '338', '甘谷县', '3', '620523');
INSERT INTO `litemall_region` VALUES ('3000', '338', '武山县', '3', '620524');
INSERT INTO `litemall_region` VALUES ('3001', '338', '张家川回族自治县', '3', '620525');
INSERT INTO `litemall_region` VALUES ('3002', '339', '凉州区', '3', '620602');
INSERT INTO `litemall_region` VALUES ('3003', '339', '民勤县', '3', '620621');
INSERT INTO `litemall_region` VALUES ('3004', '339', '古浪县', '3', '620622');
INSERT INTO `litemall_region` VALUES ('3005', '339', '天祝藏族自治县', '3', '620623');
INSERT INTO `litemall_region` VALUES ('3006', '340', '甘州区', '3', '620702');
INSERT INTO `litemall_region` VALUES ('3007', '340', '肃南裕固族自治县', '3', '620721');
INSERT INTO `litemall_region` VALUES ('3008', '340', '民乐县', '3', '620722');
INSERT INTO `litemall_region` VALUES ('3009', '340', '临泽县', '3', '620723');
INSERT INTO `litemall_region` VALUES ('3010', '340', '高台县', '3', '620724');
INSERT INTO `litemall_region` VALUES ('3011', '340', '山丹县', '3', '620725');
INSERT INTO `litemall_region` VALUES ('3012', '341', '崆峒区', '3', '620802');
INSERT INTO `litemall_region` VALUES ('3013', '341', '泾川县', '3', '620821');
INSERT INTO `litemall_region` VALUES ('3014', '341', '灵台县', '3', '620822');
INSERT INTO `litemall_region` VALUES ('3015', '341', '崇信县', '3', '620823');
INSERT INTO `litemall_region` VALUES ('3016', '341', '华亭县', '3', '620824');
INSERT INTO `litemall_region` VALUES ('3017', '341', '庄浪县', '3', '620825');
INSERT INTO `litemall_region` VALUES ('3018', '341', '静宁县', '3', '620826');
INSERT INTO `litemall_region` VALUES ('3019', '342', '肃州区', '3', '620902');
INSERT INTO `litemall_region` VALUES ('3020', '342', '金塔县', '3', '620921');
INSERT INTO `litemall_region` VALUES ('3021', '342', '瓜州县', '3', '620922');
INSERT INTO `litemall_region` VALUES ('3022', '342', '肃北蒙古族自治县', '3', '620923');
INSERT INTO `litemall_region` VALUES ('3023', '342', '阿克塞哈萨克族自治县', '3', '620924');
INSERT INTO `litemall_region` VALUES ('3024', '342', '玉门市', '3', '620981');
INSERT INTO `litemall_region` VALUES ('3025', '342', '敦煌市', '3', '620982');
INSERT INTO `litemall_region` VALUES ('3026', '343', '西峰区', '3', '621002');
INSERT INTO `litemall_region` VALUES ('3027', '343', '庆城县', '3', '621021');
INSERT INTO `litemall_region` VALUES ('3028', '343', '环县', '3', '621022');
INSERT INTO `litemall_region` VALUES ('3029', '343', '华池县', '3', '621023');
INSERT INTO `litemall_region` VALUES ('3030', '343', '合水县', '3', '621024');
INSERT INTO `litemall_region` VALUES ('3031', '343', '正宁县', '3', '621025');
INSERT INTO `litemall_region` VALUES ('3032', '343', '宁县', '3', '621026');
INSERT INTO `litemall_region` VALUES ('3033', '343', '镇原县', '3', '621027');
INSERT INTO `litemall_region` VALUES ('3034', '344', '安定区', '3', '621102');
INSERT INTO `litemall_region` VALUES ('3035', '344', '通渭县', '3', '621121');
INSERT INTO `litemall_region` VALUES ('3036', '344', '陇西县', '3', '621122');
INSERT INTO `litemall_region` VALUES ('3037', '344', '渭源县', '3', '621123');
INSERT INTO `litemall_region` VALUES ('3038', '344', '临洮县', '3', '621124');
INSERT INTO `litemall_region` VALUES ('3039', '344', '漳县', '3', '621125');
INSERT INTO `litemall_region` VALUES ('3040', '344', '岷县', '3', '621126');
INSERT INTO `litemall_region` VALUES ('3041', '345', '武都区', '3', '621202');
INSERT INTO `litemall_region` VALUES ('3042', '345', '成县', '3', '621221');
INSERT INTO `litemall_region` VALUES ('3043', '345', '文县', '3', '621222');
INSERT INTO `litemall_region` VALUES ('3044', '345', '宕昌县', '3', '621223');
INSERT INTO `litemall_region` VALUES ('3045', '345', '康县', '3', '621224');
INSERT INTO `litemall_region` VALUES ('3046', '345', '西和县', '3', '621225');
INSERT INTO `litemall_region` VALUES ('3047', '345', '礼县', '3', '621226');
INSERT INTO `litemall_region` VALUES ('3048', '345', '徽县', '3', '621227');
INSERT INTO `litemall_region` VALUES ('3049', '345', '两当县', '3', '621228');
INSERT INTO `litemall_region` VALUES ('3050', '346', '临夏市', '3', '622901');
INSERT INTO `litemall_region` VALUES ('3051', '346', '临夏县', '3', '622921');
INSERT INTO `litemall_region` VALUES ('3052', '346', '康乐县', '3', '622922');
INSERT INTO `litemall_region` VALUES ('3053', '346', '永靖县', '3', '622923');
INSERT INTO `litemall_region` VALUES ('3054', '346', '广河县', '3', '622924');
INSERT INTO `litemall_region` VALUES ('3055', '346', '和政县', '3', '622925');
INSERT INTO `litemall_region` VALUES ('3056', '346', '东乡族自治县', '3', '622926');
INSERT INTO `litemall_region` VALUES ('3057', '346', '积石山保安族东乡族撒拉族自治县', '3', '622927');
INSERT INTO `litemall_region` VALUES ('3058', '347', '合作市', '3', '623001');
INSERT INTO `litemall_region` VALUES ('3059', '347', '临潭县', '3', '623021');
INSERT INTO `litemall_region` VALUES ('3060', '347', '卓尼县', '3', '623022');
INSERT INTO `litemall_region` VALUES ('3061', '347', '舟曲县', '3', '623023');
INSERT INTO `litemall_region` VALUES ('3062', '347', '迭部县', '3', '623024');
INSERT INTO `litemall_region` VALUES ('3063', '347', '玛曲县', '3', '623025');
INSERT INTO `litemall_region` VALUES ('3064', '347', '碌曲县', '3', '623026');
INSERT INTO `litemall_region` VALUES ('3065', '347', '夏河县', '3', '623027');
INSERT INTO `litemall_region` VALUES ('3066', '348', '城东区', '3', '630102');
INSERT INTO `litemall_region` VALUES ('3067', '348', '城中区', '3', '630103');
INSERT INTO `litemall_region` VALUES ('3068', '348', '城西区', '3', '630104');
INSERT INTO `litemall_region` VALUES ('3069', '348', '城北区', '3', '630105');
INSERT INTO `litemall_region` VALUES ('3070', '348', '大通回族土族自治县', '3', '630121');
INSERT INTO `litemall_region` VALUES ('3071', '348', '湟中县', '3', '630122');
INSERT INTO `litemall_region` VALUES ('3072', '348', '湟源县', '3', '630123');
INSERT INTO `litemall_region` VALUES ('3073', '349', '乐都区', '3', '630202');
INSERT INTO `litemall_region` VALUES ('3074', '349', '平安区', '3', '630203');
INSERT INTO `litemall_region` VALUES ('3075', '349', '民和回族土族自治县', '3', '630222');
INSERT INTO `litemall_region` VALUES ('3076', '349', '互助土族自治县', '3', '630223');
INSERT INTO `litemall_region` VALUES ('3077', '349', '化隆回族自治县', '3', '630224');
INSERT INTO `litemall_region` VALUES ('3078', '349', '循化撒拉族自治县', '3', '630225');
INSERT INTO `litemall_region` VALUES ('3079', '350', '门源回族自治县', '3', '632221');
INSERT INTO `litemall_region` VALUES ('3080', '350', '祁连县', '3', '632222');
INSERT INTO `litemall_region` VALUES ('3081', '350', '海晏县', '3', '632223');
INSERT INTO `litemall_region` VALUES ('3082', '350', '刚察县', '3', '632224');
INSERT INTO `litemall_region` VALUES ('3083', '351', '同仁县', '3', '632321');
INSERT INTO `litemall_region` VALUES ('3084', '351', '尖扎县', '3', '632322');
INSERT INTO `litemall_region` VALUES ('3085', '351', '泽库县', '3', '632323');
INSERT INTO `litemall_region` VALUES ('3086', '351', '河南蒙古族自治县', '3', '632324');
INSERT INTO `litemall_region` VALUES ('3087', '352', '共和县', '3', '632521');
INSERT INTO `litemall_region` VALUES ('3088', '352', '同德县', '3', '632522');
INSERT INTO `litemall_region` VALUES ('3089', '352', '贵德县', '3', '632523');
INSERT INTO `litemall_region` VALUES ('3090', '352', '兴海县', '3', '632524');
INSERT INTO `litemall_region` VALUES ('3091', '352', '贵南县', '3', '632525');
INSERT INTO `litemall_region` VALUES ('3092', '353', '玛沁县', '3', '632621');
INSERT INTO `litemall_region` VALUES ('3093', '353', '班玛县', '3', '632622');
INSERT INTO `litemall_region` VALUES ('3094', '353', '甘德县', '3', '632623');
INSERT INTO `litemall_region` VALUES ('3095', '353', '达日县', '3', '632624');
INSERT INTO `litemall_region` VALUES ('3096', '353', '久治县', '3', '632625');
INSERT INTO `litemall_region` VALUES ('3097', '353', '玛多县', '3', '632626');
INSERT INTO `litemall_region` VALUES ('3098', '354', '玉树市', '3', '632701');
INSERT INTO `litemall_region` VALUES ('3099', '354', '杂多县', '3', '632722');
INSERT INTO `litemall_region` VALUES ('3100', '354', '称多县', '3', '632723');
INSERT INTO `litemall_region` VALUES ('3101', '354', '治多县', '3', '632724');
INSERT INTO `litemall_region` VALUES ('3102', '354', '囊谦县', '3', '632725');
INSERT INTO `litemall_region` VALUES ('3103', '354', '曲麻莱县', '3', '632726');
INSERT INTO `litemall_region` VALUES ('3104', '355', '格尔木市', '3', '632801');
INSERT INTO `litemall_region` VALUES ('3105', '355', '德令哈市', '3', '632802');
INSERT INTO `litemall_region` VALUES ('3106', '355', '乌兰县', '3', '632821');
INSERT INTO `litemall_region` VALUES ('3107', '355', '都兰县', '3', '632822');
INSERT INTO `litemall_region` VALUES ('3108', '355', '天峻县', '3', '632823');
INSERT INTO `litemall_region` VALUES ('3109', '356', '兴庆区', '3', '640104');
INSERT INTO `litemall_region` VALUES ('3110', '356', '西夏区', '3', '640105');
INSERT INTO `litemall_region` VALUES ('3111', '356', '金凤区', '3', '640106');
INSERT INTO `litemall_region` VALUES ('3112', '356', '永宁县', '3', '640121');
INSERT INTO `litemall_region` VALUES ('3113', '356', '贺兰县', '3', '640122');
INSERT INTO `litemall_region` VALUES ('3114', '356', '灵武市', '3', '640181');
INSERT INTO `litemall_region` VALUES ('3115', '357', '大武口区', '3', '640202');
INSERT INTO `litemall_region` VALUES ('3116', '357', '惠农区', '3', '640205');
INSERT INTO `litemall_region` VALUES ('3117', '357', '平罗县', '3', '640221');
INSERT INTO `litemall_region` VALUES ('3118', '358', '利通区', '3', '640302');
INSERT INTO `litemall_region` VALUES ('3119', '358', '红寺堡区', '3', '640303');
INSERT INTO `litemall_region` VALUES ('3120', '358', '盐池县', '3', '640323');
INSERT INTO `litemall_region` VALUES ('3121', '358', '同心县', '3', '640324');
INSERT INTO `litemall_region` VALUES ('3122', '358', '青铜峡市', '3', '640381');
INSERT INTO `litemall_region` VALUES ('3123', '359', '原州区', '3', '640402');
INSERT INTO `litemall_region` VALUES ('3124', '359', '西吉县', '3', '640422');
INSERT INTO `litemall_region` VALUES ('3125', '359', '隆德县', '3', '640423');
INSERT INTO `litemall_region` VALUES ('3126', '359', '泾源县', '3', '640424');
INSERT INTO `litemall_region` VALUES ('3127', '359', '彭阳县', '3', '640425');
INSERT INTO `litemall_region` VALUES ('3128', '360', '沙坡头区', '3', '640502');
INSERT INTO `litemall_region` VALUES ('3129', '360', '中宁县', '3', '640521');
INSERT INTO `litemall_region` VALUES ('3130', '360', '海原县', '3', '640522');
INSERT INTO `litemall_region` VALUES ('3131', '361', '天山区', '3', '650102');
INSERT INTO `litemall_region` VALUES ('3132', '361', '沙依巴克区', '3', '650103');
INSERT INTO `litemall_region` VALUES ('3133', '361', '新市区', '3', '650104');
INSERT INTO `litemall_region` VALUES ('3134', '361', '水磨沟区', '3', '650105');
INSERT INTO `litemall_region` VALUES ('3135', '361', '头屯河区', '3', '650106');
INSERT INTO `litemall_region` VALUES ('3136', '361', '达坂城区', '3', '650107');
INSERT INTO `litemall_region` VALUES ('3137', '361', '米东区', '3', '650109');
INSERT INTO `litemall_region` VALUES ('3138', '361', '乌鲁木齐县', '3', '650121');
INSERT INTO `litemall_region` VALUES ('3139', '362', '独山子区', '3', '650202');
INSERT INTO `litemall_region` VALUES ('3140', '362', '克拉玛依区', '3', '650203');
INSERT INTO `litemall_region` VALUES ('3141', '362', '白碱滩区', '3', '650204');
INSERT INTO `litemall_region` VALUES ('3142', '362', '乌尔禾区', '3', '650205');
INSERT INTO `litemall_region` VALUES ('3143', '363', '高昌区', '3', '650402');
INSERT INTO `litemall_region` VALUES ('3144', '363', '鄯善县', '3', '650421');
INSERT INTO `litemall_region` VALUES ('3145', '363', '托克逊县', '3', '650422');
INSERT INTO `litemall_region` VALUES ('3146', '364', '伊州区', '3', '650502');
INSERT INTO `litemall_region` VALUES ('3147', '364', '巴里坤哈萨克自治县', '3', '650521');
INSERT INTO `litemall_region` VALUES ('3148', '364', '伊吾县', '3', '650522');
INSERT INTO `litemall_region` VALUES ('3149', '365', '昌吉市', '3', '652301');
INSERT INTO `litemall_region` VALUES ('3150', '365', '阜康市', '3', '652302');
INSERT INTO `litemall_region` VALUES ('3151', '365', '呼图壁县', '3', '652323');
INSERT INTO `litemall_region` VALUES ('3152', '365', '玛纳斯县', '3', '652324');
INSERT INTO `litemall_region` VALUES ('3153', '365', '奇台县', '3', '652325');
INSERT INTO `litemall_region` VALUES ('3154', '365', '吉木萨尔县', '3', '652327');
INSERT INTO `litemall_region` VALUES ('3155', '365', '木垒哈萨克自治县', '3', '652328');
INSERT INTO `litemall_region` VALUES ('3156', '366', '博乐市', '3', '652701');
INSERT INTO `litemall_region` VALUES ('3157', '366', '阿拉山口市', '3', '652702');
INSERT INTO `litemall_region` VALUES ('3158', '366', '精河县', '3', '652722');
INSERT INTO `litemall_region` VALUES ('3159', '366', '温泉县', '3', '652723');
INSERT INTO `litemall_region` VALUES ('3160', '367', '库尔勒市', '3', '652801');
INSERT INTO `litemall_region` VALUES ('3161', '367', '轮台县', '3', '652822');
INSERT INTO `litemall_region` VALUES ('3162', '367', '尉犁县', '3', '652823');
INSERT INTO `litemall_region` VALUES ('3163', '367', '若羌县', '3', '652824');
INSERT INTO `litemall_region` VALUES ('3164', '367', '且末县', '3', '652825');
INSERT INTO `litemall_region` VALUES ('3165', '367', '焉耆回族自治县', '3', '652826');
INSERT INTO `litemall_region` VALUES ('3166', '367', '和静县', '3', '652827');
INSERT INTO `litemall_region` VALUES ('3167', '367', '和硕县', '3', '652828');
INSERT INTO `litemall_region` VALUES ('3168', '367', '博湖县', '3', '652829');
INSERT INTO `litemall_region` VALUES ('3169', '368', '阿克苏市', '3', '652901');
INSERT INTO `litemall_region` VALUES ('3170', '368', '温宿县', '3', '652922');
INSERT INTO `litemall_region` VALUES ('3171', '368', '库车县', '3', '652923');
INSERT INTO `litemall_region` VALUES ('3172', '368', '沙雅县', '3', '652924');
INSERT INTO `litemall_region` VALUES ('3173', '368', '新和县', '3', '652925');
INSERT INTO `litemall_region` VALUES ('3174', '368', '拜城县', '3', '652926');
INSERT INTO `litemall_region` VALUES ('3175', '368', '乌什县', '3', '652927');
INSERT INTO `litemall_region` VALUES ('3176', '368', '阿瓦提县', '3', '652928');
INSERT INTO `litemall_region` VALUES ('3177', '368', '柯坪县', '3', '652929');
INSERT INTO `litemall_region` VALUES ('3178', '369', '阿图什市', '3', '653001');
INSERT INTO `litemall_region` VALUES ('3179', '369', '阿克陶县', '3', '653022');
INSERT INTO `litemall_region` VALUES ('3180', '369', '阿合奇县', '3', '653023');
INSERT INTO `litemall_region` VALUES ('3181', '369', '乌恰县', '3', '653024');
INSERT INTO `litemall_region` VALUES ('3182', '370', '喀什市', '3', '653101');
INSERT INTO `litemall_region` VALUES ('3183', '370', '疏附县', '3', '653121');
INSERT INTO `litemall_region` VALUES ('3184', '370', '疏勒县', '3', '653122');
INSERT INTO `litemall_region` VALUES ('3185', '370', '英吉沙县', '3', '653123');
INSERT INTO `litemall_region` VALUES ('3186', '370', '泽普县', '3', '653124');
INSERT INTO `litemall_region` VALUES ('3187', '370', '莎车县', '3', '653125');
INSERT INTO `litemall_region` VALUES ('3188', '370', '叶城县', '3', '653126');
INSERT INTO `litemall_region` VALUES ('3189', '370', '麦盖提县', '3', '653127');
INSERT INTO `litemall_region` VALUES ('3190', '370', '岳普湖县', '3', '653128');
INSERT INTO `litemall_region` VALUES ('3191', '370', '伽师县', '3', '653129');
INSERT INTO `litemall_region` VALUES ('3192', '370', '巴楚县', '3', '653130');
INSERT INTO `litemall_region` VALUES ('3193', '370', '塔什库尔干塔吉克自治县', '3', '653131');
INSERT INTO `litemall_region` VALUES ('3194', '371', '和田市', '3', '653201');
INSERT INTO `litemall_region` VALUES ('3195', '371', '和田县', '3', '653221');
INSERT INTO `litemall_region` VALUES ('3196', '371', '墨玉县', '3', '653222');
INSERT INTO `litemall_region` VALUES ('3197', '371', '皮山县', '3', '653223');
INSERT INTO `litemall_region` VALUES ('3198', '371', '洛浦县', '3', '653224');
INSERT INTO `litemall_region` VALUES ('3199', '371', '策勒县', '3', '653225');
INSERT INTO `litemall_region` VALUES ('3200', '371', '于田县', '3', '653226');
INSERT INTO `litemall_region` VALUES ('3201', '371', '民丰县', '3', '653227');
INSERT INTO `litemall_region` VALUES ('3202', '372', '伊宁市', '3', '654002');
INSERT INTO `litemall_region` VALUES ('3203', '372', '奎屯市', '3', '654003');
INSERT INTO `litemall_region` VALUES ('3204', '372', '霍尔果斯市', '3', '654004');
INSERT INTO `litemall_region` VALUES ('3205', '372', '伊宁县', '3', '654021');
INSERT INTO `litemall_region` VALUES ('3206', '372', '察布查尔锡伯自治县', '3', '654022');
INSERT INTO `litemall_region` VALUES ('3207', '372', '霍城县', '3', '654023');
INSERT INTO `litemall_region` VALUES ('3208', '372', '巩留县', '3', '654024');
INSERT INTO `litemall_region` VALUES ('3209', '372', '新源县', '3', '654025');
INSERT INTO `litemall_region` VALUES ('3210', '372', '昭苏县', '3', '654026');
INSERT INTO `litemall_region` VALUES ('3211', '372', '特克斯县', '3', '654027');
INSERT INTO `litemall_region` VALUES ('3212', '372', '尼勒克县', '3', '654028');
INSERT INTO `litemall_region` VALUES ('3213', '373', '塔城市', '3', '654201');
INSERT INTO `litemall_region` VALUES ('3214', '373', '乌苏市', '3', '654202');
INSERT INTO `litemall_region` VALUES ('3215', '373', '额敏县', '3', '654221');
INSERT INTO `litemall_region` VALUES ('3216', '373', '沙湾县', '3', '654223');
INSERT INTO `litemall_region` VALUES ('3217', '373', '托里县', '3', '654224');
INSERT INTO `litemall_region` VALUES ('3218', '373', '裕民县', '3', '654225');
INSERT INTO `litemall_region` VALUES ('3219', '373', '和布克赛尔蒙古自治县', '3', '654226');
INSERT INTO `litemall_region` VALUES ('3220', '374', '阿勒泰市', '3', '654301');
INSERT INTO `litemall_region` VALUES ('3221', '374', '布尔津县', '3', '654321');
INSERT INTO `litemall_region` VALUES ('3222', '374', '富蕴县', '3', '654322');
INSERT INTO `litemall_region` VALUES ('3223', '374', '福海县', '3', '654323');
INSERT INTO `litemall_region` VALUES ('3224', '374', '哈巴河县', '3', '654324');
INSERT INTO `litemall_region` VALUES ('3225', '374', '青河县', '3', '654325');
INSERT INTO `litemall_region` VALUES ('3226', '374', '吉木乃县', '3', '654326');
INSERT INTO `litemall_region` VALUES ('3227', '375', '石河子市', '3', '659001');
INSERT INTO `litemall_region` VALUES ('3228', '375', '阿拉尔市', '3', '659002');
INSERT INTO `litemall_region` VALUES ('3229', '375', '图木舒克市', '3', '659003');
INSERT INTO `litemall_region` VALUES ('3230', '375', '五家渠市', '3', '659004');
INSERT INTO `litemall_region` VALUES ('3231', '375', '铁门关市', '3', '659006');

-- ----------------------------
-- Table structure for litemall_role
-- ----------------------------
DROP TABLE IF EXISTS `litemall_role`;
CREATE TABLE `litemall_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(63) NOT NULL COMMENT '角色名称',
  `desc` varchar(1023) DEFAULT NULL COMMENT '角色描述',
  `enabled` tinyint(1) DEFAULT '1' COMMENT '是否启用',
  `add_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='角色表';

-- ----------------------------
-- Records of litemall_role
-- ----------------------------
INSERT INTO `litemall_role` VALUES ('1', '超级管理员', '所有模块的权限', '1', '2019-01-01 00:00:00', '2019-01-01 00:00:00', '0');
INSERT INTO `litemall_role` VALUES ('2', '商场管理员', '只有商场模块的操作权限', '1', '2019-01-01 00:00:00', '2019-01-07 15:15:12', '0');
INSERT INTO `litemall_role` VALUES ('3', '推广管理员', '只有推广模块的操作权限', '1', '2019-01-01 00:00:00', '2019-01-07 15:15:24', '0');

-- ----------------------------
-- Table structure for litemall_search_history
-- ----------------------------
DROP TABLE IF EXISTS `litemall_search_history`;
CREATE TABLE `litemall_search_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户表的用户ID',
  `keyword` varchar(63) NOT NULL COMMENT '搜索关键字',
  `from` varchar(63) NOT NULL DEFAULT '' COMMENT '搜索来源，如pc、wx、app',
  `add_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='搜索历史表';

-- ----------------------------
-- Records of litemall_search_history
-- ----------------------------

-- ----------------------------
-- Table structure for litemall_storage
-- ----------------------------
DROP TABLE IF EXISTS `litemall_storage`;
CREATE TABLE `litemall_storage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(63) NOT NULL COMMENT '文件的唯一索引',
  `name` varchar(255) NOT NULL COMMENT '文件名',
  `type` varchar(20) NOT NULL COMMENT '文件类型',
  `size` int(11) NOT NULL COMMENT '文件大小',
  `url` varchar(255) DEFAULT NULL COMMENT '文件访问链接',
  `add_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='文件存储表';

-- ----------------------------
-- Records of litemall_storage
-- ----------------------------
INSERT INTO `litemall_storage` VALUES ('1', '5xu6g66k07k2v0ay727a.png', 'QQ图片20190318144925.png', 'image/png', '349859', 'http://localhost:8080/wx/storage/fetch/5xu6g66k07k2v0ay727a.png', '2019-03-21 22:03:29', '2019-03-21 22:03:29', '0');
INSERT INTO `litemall_storage` VALUES ('2', 'roadahh844nu4tkwxxkz.png', 'QQ图片20190318144925.png', 'image/png', '349859', 'http://localhost:8080/wx/storage/fetch/roadahh844nu4tkwxxkz.png', '2019-03-21 22:04:39', '2019-03-21 22:04:39', '0');

-- ----------------------------
-- Table structure for litemall_system
-- ----------------------------
DROP TABLE IF EXISTS `litemall_system`;
CREATE TABLE `litemall_system` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key_name` varchar(255) NOT NULL COMMENT '系统配置名',
  `key_value` varchar(255) NOT NULL COMMENT '系统配置值',
  `add_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='系统配置表';

-- ----------------------------
-- Records of litemall_system
-- ----------------------------
INSERT INTO `litemall_system` VALUES ('1', 'litemall.system.banner.new.title', '大家都在买的', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_system` VALUES ('2', 'litemall.system.banner.new.imageurl', 'http://yanxuan.nosdn.127.net/8976116db321744084774643a933c5ce.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_system` VALUES ('3', 'litemall.system.banner.hot.title', '大家都在买的', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_system` VALUES ('4', 'litemall.system.banner.hot.imageurl', 'http://yanxuan.nosdn.127.net/8976116db321744084774643a933c5ce.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_system` VALUES ('5', 'litemall.system.freight.value', '8', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_system` VALUES ('6', 'litemall.system.freight.limit', '88', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_system` VALUES ('7', 'litemall.system.indexlimit.new', '6', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_system` VALUES ('8', 'litemall.system.indexlimit.hot', '6', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_system` VALUES ('9', 'litemall.system.indexlimit.brand', '4', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_system` VALUES ('10', 'litemall.system.indexlimit.topic', '4', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_system` VALUES ('11', 'litemall.system.indexlimit.catloglist', '4', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_system` VALUES ('12', 'litemall.system.indexlimit.catloggood', '4', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_system` VALUES ('13', 'litemall.system.mallname', 'litemall', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');
INSERT INTO `litemall_system` VALUES ('14', 'litemall.system.shareimage.autocreate', '0', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');

-- ----------------------------
-- Table structure for litemall_topic
-- ----------------------------
DROP TABLE IF EXISTS `litemall_topic`;
CREATE TABLE `litemall_topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '''' COMMENT '专题标题',
  `subtitle` varchar(255) DEFAULT '''' COMMENT '专题子标题',
  `content` text COMMENT '专题内容，富文本格式',
  `price` decimal(10,2) DEFAULT '0.00' COMMENT '专题相关商品最低价',
  `read_count` varchar(255) DEFAULT '1k' COMMENT '专题阅读量',
  `pic_url` varchar(255) DEFAULT '' COMMENT '专题图片',
  `sort_order` int(11) DEFAULT '100' COMMENT '排序',
  `goods` varchar(1023) DEFAULT '' COMMENT '专题相关商品，采用JSON数组格式',
  `add_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`),
  KEY `topic_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=265 DEFAULT CHARSET=utf8mb4 COMMENT='专题表';

-- ----------------------------
-- Records of litemall_topic
-- ----------------------------
INSERT INTO `litemall_topic` VALUES ('264', '设计师们推荐的应季好物', '原创设计春款系列上新', '<img src=\"//yanxuan.nosdn.127.net/75c55a13fde5eb2bc2dd6813b4c565cc.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/e27e1de2b271a28a21c10213b9df7e95.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/9d413d1d28f753cb19096b533d53418d.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/64b0f2f350969e9818a3b6c43c217325.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/a668e6ae7f1fa45565c1eac221787570.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/0d4004e19728f2707f08f4be79bbc774.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/79ee021bbe97de7ecda691de6787241f.jpg\">', '29.90', '77.7k', 'https://yanxuan.nosdn.127.net/14918201901050274.jpg', '0', '[]', '2018-02-01 00:00:00', '2018-02-01 00:00:00', '0');

-- ----------------------------
-- Table structure for litemall_user
-- ----------------------------
DROP TABLE IF EXISTS `litemall_user`;
CREATE TABLE `litemall_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(63) NOT NULL COMMENT '用户名称',
  `password` varchar(63) NOT NULL DEFAULT '' COMMENT '用户密码',
  `gender` tinyint(3) NOT NULL DEFAULT '0' COMMENT '性别：0 未知， 1男， 1 女',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `last_login_time` datetime DEFAULT NULL COMMENT '最近一次登录时间',
  `last_login_ip` varchar(63) NOT NULL DEFAULT '' COMMENT '最近一次登录IP地址',
  `user_level` tinyint(3) DEFAULT '0' COMMENT '0 普通用户，1 VIP用户，2 高级VIP用户',
  `nickname` varchar(63) NOT NULL DEFAULT '' COMMENT '用户昵称或网络名称',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '用户手机号码',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像图片',
  `weixin_openid` varchar(63) NOT NULL DEFAULT '' COMMENT '微信登录openid',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0 可用, 1 禁用, 2 注销',
  `add_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- ----------------------------
-- Records of litemall_user
-- ----------------------------

-- ----------------------------
-- Table structure for litemall_user_formid
-- ----------------------------
DROP TABLE IF EXISTS `litemall_user_formid`;
CREATE TABLE `litemall_user_formid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `formId` varchar(63) NOT NULL COMMENT '缓存的FormId',
  `isprepay` tinyint(1) NOT NULL COMMENT '是FormId还是prepayId',
  `useAmount` int(2) NOT NULL COMMENT '可用次数，fromId为1，prepay为3，用1次减1',
  `expire_time` datetime NOT NULL COMMENT '过期时间，腾讯规定为7天',
  `openId` varchar(63) NOT NULL COMMENT '微信登录openid',
  `add_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of litemall_user_formid
-- ----------------------------
