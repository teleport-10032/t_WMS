/*
 Navicat Premium Data Transfer

 Source Server         : test
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost:3306
 Source Schema         : wms

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 07/04/2021 14:13:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for crm
-- ----------------------------
DROP TABLE IF EXISTS `crm`;
CREATE TABLE `crm` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(105) DEFAULT NULL,
  `companyName` varchar(105) DEFAULT NULL,
  `type` varchar(105) DEFAULT NULL,
  `address` varchar(105) DEFAULT NULL,
  `phone` varchar(105) DEFAULT NULL,
  `email` varchar(105) DEFAULT NULL,
  `bank` varchar(105) DEFAULT NULL,
  `bankName` varchar(105) DEFAULT NULL,
  `bankNumber` varchar(105) DEFAULT NULL,
  `texNumber` varchar(105) DEFAULT NULL,
  `arrears` double(15,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of crm
-- ----------------------------
BEGIN;
INSERT INTO `crm` VALUES (1000, 'sx', '熙来顺有限公司', 'customer', 'QD.China', '18888888', '1111@qq.com', '广发银行', 'sx', '1111111', '1111111', 50000);
COMMIT;

-- ----------------------------
-- Table structure for inn
-- ----------------------------
DROP TABLE IF EXISTS `inn`;
CREATE TABLE `inn` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `orderId` varchar(105) DEFAULT NULL COMMENT '单号',
  `productId` varchar(105) DEFAULT NULL,
  `productNum` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of inn
-- ----------------------------
BEGIN;
INSERT INTO `inn` VALUES (1000, 'inId1', '1000', 100);
INSERT INTO `inn` VALUES (1001, 'inId2', '1001', 121);
INSERT INTO `inn` VALUES (1002, 'inId3', '1002', 1200);
COMMIT;

-- ----------------------------
-- Table structure for outt
-- ----------------------------
DROP TABLE IF EXISTS `outt`;
CREATE TABLE `outt` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `number` varchar(105) DEFAULT NULL,
  `productId` int(10) DEFAULT NULL,
  `productNum` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of outt
-- ----------------------------
BEGIN;
INSERT INTO `outt` VALUES (1000, 'out1', 1000, 105);
COMMIT;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productName` varchar(105) DEFAULT NULL,
  `typeId` varchar(11) DEFAULT NULL,
  `unit` varchar(105) DEFAULT NULL,
  `info` varchar(105) DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of product
-- ----------------------------
BEGIN;
INSERT INTO `product` VALUES (1000, '肥皂', '1000', '件', '无详情', 2.00);
INSERT INTO `product` VALUES (1001, '地瓜', '1002', '千克', '无详情', 1.00);
INSERT INTO `product` VALUES (1002, '马的脱毛器', '1001', '件', '无', 7199.00);
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
) ENGINE=InnoDB AUTO_INCREMENT=1025 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of staff
-- ----------------------------
BEGIN;
INSERT INTO `staff` VALUES (1000, 'root', '马騳骉', '男', 20, 'admin', '13867481033', '1@q.com', '4297f44b13955235245b2497399d7a93', '161777384032705451254');
INSERT INTO `staff` VALUES (1001, 'mace', 'Mace', '男', 21, 'operator', '13864781033', '22@qq.com', '4297f44b13955235245b2497399d7a93', NULL);
INSERT INTO `staff` VALUES (1002, 'user', 'user', '男', 21, 'user', '13864781033', '3@q.com', '4297f44b13955235245b2497399d7a93', '161708585196509530185');
INSERT INTO `staff` VALUES (1003, 'user3', 'user3', '男', 21, 'user', '13864781033', '3@q.com', '123123', NULL);
INSERT INTO `staff` VALUES (1004, 'user4', 'user4', '男', 21, 'user', '13864781033', '3@q.com', '123123', NULL);
INSERT INTO `staff` VALUES (1005, 'user5', 'u1', '男', 21, 'user', '13864781033', '3@q.com', '123123', NULL);
INSERT INTO `staff` VALUES (1006, 'user6', 'u1', '男', 21, 'user', '13864781033', '3@q.com', '123123', NULL);
INSERT INTO `staff` VALUES (1007, 'user7', 'u1', '男', 21, 'user', '13864781033', '3@q.com', '123123', NULL);
INSERT INTO `staff` VALUES (1008, 'user8', 'u1', '男', 21, 'user', '13864781033', '3@q.com', '123123', NULL);
INSERT INTO `staff` VALUES (1009, 'user9', 'u1', '男', 21, 'user', '13864781033', '3@q.com', '123123', NULL);
INSERT INTO `staff` VALUES (1010, 'user10', 'u1', '女', 21, 'user', '13864781033', '3@q.com', '123123', NULL);
INSERT INTO `staff` VALUES (1011, 'user11', 'u1', '男', 21, 'user', '13864781033', '3@q.com', '123123', NULL);
INSERT INTO `staff` VALUES (1012, 'user12', 'u1', '男', 21, 'user', '13864781033', '3@q.com', '123123', NULL);
COMMIT;

-- ----------------------------
-- Table structure for stock
-- ----------------------------
DROP TABLE IF EXISTS `stock`;
CREATE TABLE `stock` (
  `productId` int(10) NOT NULL AUTO_INCREMENT,
  `productNum` int(10) DEFAULT NULL,
  PRIMARY KEY (`productId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of stock
-- ----------------------------
BEGIN;
INSERT INTO `stock` VALUES (1, 1195);
INSERT INTO `stock` VALUES (2, 121);
COMMIT;

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeName` varchar(105) DEFAULT '',
  `info` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of type
-- ----------------------------
BEGIN;
INSERT INTO `type` VALUES (1000, '日用品', '无');
INSERT INTO `type` VALUES (1001, '电器', '无');
INSERT INTO `type` VALUES (1002, '食品', '无');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
