/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost:3306
 Source Schema         : wms

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 13/06/2021 18:33:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(105) DEFAULT NULL,
  `companyName` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `site` varchar(255) DEFAULT NULL,
  `bank` varchar(255) DEFAULT NULL,
  `bankAccount` varchar(255) DEFAULT NULL,
  `bankName` varchar(255) DEFAULT NULL,
  `taxNumber` varchar(255) DEFAULT NULL,
  `debts` double(55,2) DEFAULT NULL,
  `staffId` int(11) DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `coustomer1` (`staffId`),
  CONSTRAINT `coustomer1` FOREIGN KEY (`staffId`) REFERENCES `staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of customer
-- ----------------------------
BEGIN;
INSERT INTO `customer` VALUES (1, 'myself', 'myself', 'myself', 'myself', 'myself', 'myself', 'myself', 'myself', 'myself', 'myself', 0.00, 1000, 'myself');
INSERT INTO `customer` VALUES (1000, '罗永郝', '山东新西方', '山东青岛', '13387871463', '11@q.com', 'xdf1.xm', '广发银行', '11128787121', '山东新西方', '91110000717825966C', 2045.00, 1001, '暂无');
INSERT INTO `customer` VALUES (1001, '王布斯', '涂山科技发展公司', '山西太原', '14489812351', '22@q.com', 'tushan1.tech', '广发银行', '87912801325', '涂山科技发展公司', '91110000717825966B', 0.00, 1000, '暂无');
INSERT INTO `customer` VALUES (1002, '徐四', '哪都通快递', '河南石家庄', '13874813911', '33@q.com', 'ndt1.com', '中国银行', '87912801311', '哪都通快递', '911100007178259661', 0.00, 1000, '暂无');
COMMIT;

-- ----------------------------
-- Table structure for customercrm
-- ----------------------------
DROP TABLE IF EXISTS `customercrm`;
CREATE TABLE `customercrm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerId` int(11) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customerCrm1` (`customerId`),
  CONSTRAINT `customerCrm1` FOREIGN KEY (`customerId`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1012 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of customercrm
-- ----------------------------
BEGIN;
INSERT INTO `customercrm` VALUES (1009, 1001, '2021-05-05 12:00:00', '吃饭');
INSERT INTO `customercrm` VALUES (1010, 1000, '2021-05-11 12:00:00', '给客户带小礼品');
INSERT INTO `customercrm` VALUES (1011, 1000, '2021-05-04 12:00:00', '吃饭');
COMMIT;

-- ----------------------------
-- Table structure for inn
-- ----------------------------
DROP TABLE IF EXISTS `inn`;
CREATE TABLE `inn` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `orderId` varchar(105) DEFAULT NULL COMMENT '单号',
  `productId` int(10) DEFAULT NULL,
  `supplierId` int(10) DEFAULT NULL,
  `staffId` int(10) DEFAULT NULL,
  `productNum` int(10) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `lastModifyDate` datetime DEFAULT NULL,
  `pay` double(20,2) DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aa` (`staffId`),
  KEY `inn1` (`productId`),
  KEY `inn2` (`supplierId`),
  CONSTRAINT `inn1` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `inn2` FOREIGN KEY (`supplierId`) REFERENCES `supplier` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `inn3` FOREIGN KEY (`staffId`) REFERENCES `staff` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1049 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of inn
-- ----------------------------
BEGIN;
INSERT INTO `inn` VALUES (1043, 'In16207967768340754', 1020, 1000, 1000, 100, '2020-05-12 13:20:51', '2021-05-12 13:20:51', 1480.00, '无');
INSERT INTO `inn` VALUES (1044, 'In16207969335491600', 1019, 1001, 1000, 1000, '2021-01-12 13:22:19', '2021-05-12 13:22:19', 2040.00, '无');
INSERT INTO `inn` VALUES (1045, 'In16207969403095306', 1024, 1001, 1000, 10, '2021-01-12 13:22:38', '2021-05-12 13:22:38', 78990.00, '无');
INSERT INTO `inn` VALUES (1046, 'In16207969687716835', 1025, 1000, 1000, 10, '2021-05-12 13:23:59', '2021-05-12 13:23:59', 3990.00, '无');
INSERT INTO `inn` VALUES (1047, 'In16207970420114782', 1026, 1000, 1000, 100, '2021-12-12 13:24:30', '2021-05-12 13:24:30', 5100.00, '无');
INSERT INTO `inn` VALUES (1048, 'In16207990361135452', 1019, 1000, 1002, 10, '2021-05-12 13:57:29', '2021-05-12 13:57:29', 0.00, '');
COMMIT;

-- ----------------------------
-- Table structure for outt
-- ----------------------------
DROP TABLE IF EXISTS `outt`;
CREATE TABLE `outt` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `orderId` varchar(105) DEFAULT NULL COMMENT '单号',
  `productId` int(105) DEFAULT NULL,
  `customerId` int(10) DEFAULT NULL,
  `staffId` int(10) DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL,
  `productNum` int(10) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `lastModifyDate` datetime DEFAULT NULL,
  `pay` double(255,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `outt1` (`productId`),
  KEY `outt2` (`customerId`),
  KEY `outt3` (`staffId`),
  CONSTRAINT `outt1` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `outt2` FOREIGN KEY (`customerId`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `outt3` FOREIGN KEY (`staffId`) REFERENCES `staff` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1022 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of outt
-- ----------------------------
BEGIN;
INSERT INTO `outt` VALUES (1020, 'Out16207971112762564', 1019, 1000, 1000, '无', 100, '2021-05-12 13:25:27', '2021-05-12 13:25:27', 0.00);
INSERT INTO `outt` VALUES (1021, 'Out16207972971106727', 1026, 1000, 1000, '无', 10, '2021-05-12 13:28:38', '2021-05-12 13:28:38', 510.00);
COMMIT;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(105) DEFAULT NULL,
  `typeId` int(11) DEFAULT NULL,
  `unit` varchar(105) DEFAULT NULL,
  `price` double(11,2) DEFAULT NULL,
  `info` varchar(105) DEFAULT NULL,
  `alertNum` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product1` (`typeId`),
  CONSTRAINT `product1` FOREIGN KEY (`typeId`) REFERENCES `type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1033 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of product
-- ----------------------------
BEGIN;
INSERT INTO `product` VALUES (1019, '奥利奥 原味夹心饼干随身携带 独立包装 早餐充饥糕点 休闲零食【沃尔玛】 349g(12包独立包装)', 1005, '件', 20.40, '无', -1);
INSERT INTO `product` VALUES (1020, '好记 酱油 非转基因大豆酿造590g', 1005, '件', 14.80, '无', 500);
INSERT INTO `product` VALUES (1021, '风车牧场 比利时进口 全脂高钙纯牛奶1L*12盒 3.7g乳蛋白家庭装醇香型', 1005, '件', 178.00, '无', -1);
INSERT INTO `product` VALUES (1022, '【樱花季限定新品】统一汤达人樱花限定日式豚骨拉面高汤面杯面12杯整箱泡面方便面速食 【樱花限定版】日式豚骨拉面78g*3杯', 1005, '件', 42.80, '无', -1);
INSERT INTO `product` VALUES (1023, '生态园荞麦面创投乔荞麦面非油炸面饼牌面鸡蛋面原味方便面轻食面 荞麦面(5袋)', 1005, '件', 15.70, '无', -1);
INSERT INTO `product` VALUES (1024, 'Apple MacBook Air 13.3 新款8核M1芯片 银色 八核M1芯片8G 256G', 1006, '件', 7899.00, '无', -1);
INSERT INTO `product` VALUES (1025, '樱桃（Cherry）MX2.0S G80-3820LYAEU-2 机械键盘 有线键盘 游戏键盘 全尺寸机械键盘 黑色 红轴', 1006, '件', 399.00, '无', -1);
INSERT INTO `product` VALUES (1026, '小米（MI）路由器家用4C智能4天线mini迷你无线wifi穿墙王', 1006, '件', 51.00, '无', -1);
INSERT INTO `product` VALUES (1027, 'Apple/苹果 iPhone xr手机/iPhone 8 plus 8P移动联通电信4G 智能手机 XR黑色 64GB', 1007, '件', 4599.00, '无', -1);
INSERT INTO `product` VALUES (1028, '小米Redmi红米k30 至尊纪念版 智能5G手机 天玑1000plus旗舰芯片 8G+128G 薄荷绿 官方标配', 1007, '件', 1978.00, '无', -1);
INSERT INTO `product` VALUES (1029, '优奥 加厚锡纸烤箱纸30米 烘焙烧烤锡箔纸烤盘铝箔纸 30cm*10m*3卷 ULB0H30', 1008, '件', 19.00, '无', -1);
INSERT INTO `product` VALUES (1030, '全棉四套件 纯棉田园床品 双人床单被套 叶镜1.8', 1008, '件', 339.00, '无', -1);
INSERT INTO `product` VALUES (1031, '智汇 调料架玻璃调料盒套装厨房用品置物架多功能收纳架落地多层台面储物架陶瓷调味罐盐罐套装油壶调料瓶 竹架+6个油瓶+8个玻璃调味罐+贴纸+漏斗15件套 收纳架', 1008, '件', 159.00, '无', -1);
INSERT INTO `product` VALUES (1032, '智汇 饺子盒 冰箱冷冻盒速冻饺子多层盒家用冰箱收纳保鲜盒水饺馄饨收纳盒饺子托盘 饺子盒 四层一盖 奶白色 饺子收纳盒', 1008, '件', 22.00, '无', -1);
COMMIT;

-- ----------------------------
-- Table structure for staff
-- ----------------------------
DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(105) DEFAULT NULL,
  `name` varchar(105) DEFAULT NULL,
  `sex` varchar(2) DEFAULT NULL,
  `age` int(10) DEFAULT NULL,
  `type` varchar(105) DEFAULT NULL,
  `phone` varchar(105) DEFAULT NULL,
  `email` varchar(105) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1005 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of staff
-- ----------------------------
BEGIN;
INSERT INTO `staff` VALUES (1000, 'superAdmin', '超级管理员', '男', 21, 'superAdmin', '13867481031', '1@q.com', '4297f44b13955235245b2497399d7a93', '162314214220699685712');
INSERT INTO `staff` VALUES (1001, 'crmAdmin', '客户关系管理员', '女', 21, 'crmAdmin', '13867481031', '22@qq.com', '4297f44b13955235245b2497399d7a93', '162080100301182790619');
INSERT INTO `staff` VALUES (1002, 'whAdmin', '仓库管理员1', '男', 54, 'whAdmin', '13867481031', '3@q.com', '4297f44b13955235245b2497399d7a93', '162079899689229302187');
INSERT INTO `staff` VALUES (1003, 'admin', '管理员', '男', 21, 'admin', '13867481031', '3@q.com', '4297f44b13955235245b2497399d7a93', '162079893117829702472');
INSERT INTO `staff` VALUES (1004, 'whAdmin2', '仓库管理员2', '男', 21, 'whAdmin', '13867481031', '3@q.com', '4297f44b13955235245b2497399d7a93', NULL);
COMMIT;

-- ----------------------------
-- Table structure for stock
-- ----------------------------
DROP TABLE IF EXISTS `stock`;
CREATE TABLE `stock` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `productId` int(10) DEFAULT NULL,
  `num` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `stock1` (`productId`),
  CONSTRAINT `stock1` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1022 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of stock
-- ----------------------------
BEGIN;
INSERT INTO `stock` VALUES (1008, 1019, 910);
INSERT INTO `stock` VALUES (1009, 1020, 100);
INSERT INTO `stock` VALUES (1010, 1021, 0);
INSERT INTO `stock` VALUES (1011, 1022, 0);
INSERT INTO `stock` VALUES (1012, 1023, 0);
INSERT INTO `stock` VALUES (1013, 1024, 10);
INSERT INTO `stock` VALUES (1014, 1025, 10);
INSERT INTO `stock` VALUES (1015, 1026, 90);
INSERT INTO `stock` VALUES (1016, 1027, 0);
INSERT INTO `stock` VALUES (1017, 1028, 0);
INSERT INTO `stock` VALUES (1018, 1029, 0);
INSERT INTO `stock` VALUES (1019, 1030, 0);
INSERT INTO `stock` VALUES (1020, 1031, 0);
INSERT INTO `stock` VALUES (1021, 1032, 0);
COMMIT;

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(105) DEFAULT NULL,
  `companyName` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `site` varchar(255) DEFAULT NULL,
  `bank` varchar(255) DEFAULT NULL,
  `bankAccount` varchar(255) DEFAULT NULL,
  `bankName` varchar(255) DEFAULT NULL,
  `taxNumber` varchar(255) DEFAULT NULL,
  `debts` double(55,2) DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL,
  `staffId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `supplier1` (`staffId`),
  CONSTRAINT `supplier1` FOREIGN KEY (`staffId`) REFERENCES `staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of supplier
-- ----------------------------
BEGIN;
INSERT INTO `supplier` VALUES (1000, '罗翔', '山东旧东方', '山东济南', '13387871463', '1@q.com', 'xdf.xm', '广发银行', '11128787123', '山东旧东方', '91110000717825966F', -204.00, '暂无', 1000);
INSERT INTO `supplier` VALUES (1001, '涂容容', '涂山商业集团', '广州福建', '14489812351', '2@q.com', 'tushan.tech', '广发银行', '87912801321', '涂山商业集团', '91110000717825966E', -18360.00, '暂无', 1000);
INSERT INTO `supplier` VALUES (1002, '徐志成', '哪都通集团', '湖南长沙', '13874813911', '3@q.com', 'ndt.com', '中国银行', '87912801322', '哪都通快递', '91110000717825966A', 0.00, '暂无', 1000);
COMMIT;

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(105) DEFAULT '',
  `info` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1009 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of type
-- ----------------------------
BEGIN;
INSERT INTO `type` VALUES (1005, '食品', '各种食品');
INSERT INTO `type` VALUES (1006, '电脑办公', '电脑，路由器等');
INSERT INTO `type` VALUES (1007, '手机', '手机类');
INSERT INTO `type` VALUES (1008, '家具厨具', '居家用品 厨房用品');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
