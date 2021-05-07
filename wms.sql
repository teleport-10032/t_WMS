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

 Date: 07/05/2021 08:40:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for crm
-- ----------------------------
DROP TABLE IF EXISTS `crm`;
CREATE TABLE `crm` (
  `id` int(105) NOT NULL,
  `staffId` int(105) DEFAULT NULL,
  `customerId` int(105) DEFAULT NULL,
  `orderNum` int(105) DEFAULT NULL,
  `oweNum` int(105) DEFAULT NULL,
  `visitNum` int(105) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `info` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of customer
-- ----------------------------
BEGIN;
INSERT INTO `customer` VALUES (1000, '罗永郝', '山东新西方', '山东青岛', '13387871463', '11@q.com', 'xdf1.xm', '广发银行', '11128787121', '山东新西方', '91110000717825966C', 1005.22, '暂无');
INSERT INTO `customer` VALUES (1001, '红老板', '涂山科技发展公司', '山西太原', '14489812351', '22@q.com', 'tushan1.tech', '广发银行', '87912801325', '涂山科技发展公司', '91110000717825966B', 0.00, '暂无');
INSERT INTO `customer` VALUES (1002, '徐四', '哪都通快递', '河南石家庄', '13874813911', '33.@q.com', 'ndt1.com', '中国银行', '87912801311', '哪都通快递', '911100007178259661', 0.00, '暂无');
COMMIT;

-- ----------------------------
-- Table structure for inn
-- ----------------------------
DROP TABLE IF EXISTS `inn`;
CREATE TABLE `inn` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `orderId` varchar(105) DEFAULT NULL COMMENT '单号',
  `productId` varchar(105) DEFAULT NULL,
  `supplierId` int(10) DEFAULT NULL,
  `productNum` int(10) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `lastModifyDate` datetime DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1011 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of inn
-- ----------------------------
BEGIN;
INSERT INTO `inn` VALUES (1010, 'In16201439289907377', '1000', 1000, 1000, '2021-05-04 23:58:55', '2021-05-04 23:58:55', '11');
COMMIT;

-- ----------------------------
-- Table structure for outt
-- ----------------------------
DROP TABLE IF EXISTS `outt`;
CREATE TABLE `outt` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `orderId` varchar(105) DEFAULT NULL COMMENT '单号',
  `productId` varchar(105) DEFAULT NULL,
  `customerId` int(10) DEFAULT NULL,
  `productNum` int(10) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `lastModifyDate` datetime DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1009 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of outt
-- ----------------------------
BEGIN;
INSERT INTO `outt` VALUES (1008, 'Out16201450093574535', '1000', 1000, 800, '2021-05-05 00:17:04', '2021-05-05 00:17:04', '');
COMMIT;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(105) DEFAULT NULL,
  `typeId` int(10) DEFAULT NULL,
  `supplierId` int(10) DEFAULT NULL,
  `unit` varchar(105) DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL,
  `info` varchar(105) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of product
-- ----------------------------
BEGIN;
INSERT INTO `product` VALUES (1000, '肥皂', 1000, 1000, '件', 2.30, '无详情');
INSERT INTO `product` VALUES (1001, '地瓜', 1002, 1001, '千克', 1.00, '无详情');
INSERT INTO `product` VALUES (1002, '马用脱毛器', 1000, 1002, '件', 7199.00, '无详情');
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
INSERT INTO `staff` VALUES (1000, 'superAdmin', '马騳骉', '男', 21, 'superAdmin', '13867481031', '1@q.com', '4297f44b13955235245b2497399d7a93', '162014109030316288527');
INSERT INTO `staff` VALUES (1001, 'crmAdmin', 'Mace', '女', 21, 'crmAdmin', '13867481031', '22@qq.com', '4297f44b13955235245b2497399d7a93', NULL);
INSERT INTO `staff` VALUES (1002, 'whAdmin', 'user', '男', 54, 'whAdmin', '13867481031', '3@q.com', '4297f44b13955235245b2497399d7a93', '161857760249297337169');
INSERT INTO `staff` VALUES (1003, 'admin', 'benq', '男', 21, 'admin', '13867481031', '3@q.com', '4297f44b13955235245b2497399d7a93', NULL);
INSERT INTO `staff` VALUES (1004, 'tourist', 'tourist', '男', 21, 'whAdmin', '13867481031', '3@q.com', '4297f44b13955235245b2497399d7a93', NULL);
COMMIT;

-- ----------------------------
-- Table structure for stock
-- ----------------------------
DROP TABLE IF EXISTS `stock`;
CREATE TABLE `stock` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `productId` int(10) DEFAULT NULL,
  `num` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of stock
-- ----------------------------
BEGIN;
INSERT INTO `stock` VALUES (1000, 1000, 0);
INSERT INTO `stock` VALUES (1001, 1001, 0);
INSERT INTO `stock` VALUES (1002, 1002, 0);
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1004 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of supplier
-- ----------------------------
BEGIN;
INSERT INTO `supplier` VALUES (1000, '罗永豪', '山东旧东方', '山东济南', '13387871463', '1@q.com', 'xdf.xm', '广发银行', '11128787123', '山东旧东方', '91110000717825966F', 1000.00, '暂无');
INSERT INTO `supplier` VALUES (1001, '容老板', '涂山商业集团', '广州福建', '14489812351', '2@q.com', 'tushan.tech', '广发银行', '87912801321', '涂山商业集团', '91110000717825966E', 3.40, '暂无');
INSERT INTO `supplier` VALUES (1002, '徐三', '哪都通集团', '湖南长沙', '13874813911', '3.@q.com', 'ndt.com', '中国银行', '87912801322', '哪都通快递', '91110000717825966A', 0.00, '暂无');
INSERT INTO `supplier` VALUES (1003, '徐翔', '广东大米科技有限公司', '广东深圳', '17763213112', '17732112@163.com', 'dm.com', '广发银行', '131313113131313', '徐翔', '1998EK183018E', 0.00, '无');
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
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of type
-- ----------------------------
BEGIN;
INSERT INTO `type` VALUES (1000, '日用品', '无');
INSERT INTO `type` VALUES (1001, '电器', '无');
INSERT INTO `type` VALUES (1002, '玩具', '无详情');
COMMIT;

-- ----------------------------
-- Table structure for warehouse
-- ----------------------------
DROP TABLE IF EXISTS `warehouse`;
CREATE TABLE `warehouse` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(105) DEFAULT NULL,
  `position` varchar(105) DEFAULT NULL,
  `info` varchar(1005) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1002 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of warehouse
-- ----------------------------
BEGIN;
INSERT INTO `warehouse` VALUES (1000, '仓库', '山东济南', '主仓库1');
INSERT INTO `warehouse` VALUES (1001, '仓库2', '山东青岛', 'info');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
