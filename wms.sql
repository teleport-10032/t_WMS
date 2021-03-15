/*
 Navicat Premium Data Transfer

 Source Server         : Main
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost:3306
 Source Schema         : wms

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 15/03/2021 10:55:15
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of crm
-- ----------------------------
BEGIN;
INSERT INTO `crm` VALUES (1000, 'sx', '熙来顺有限公司', 'customer', 'QD.China', '18888888', '1111@qq.com', '广发银行', 'sx', '1111111', '1111111', 50000);
COMMIT;

-- ----------------------------
-- Table structure for in
-- ----------------------------
DROP TABLE IF EXISTS `in`;
CREATE TABLE `in` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `number` varchar(105) DEFAULT NULL COMMENT '单号',
  `productId` varchar(105) DEFAULT NULL,
  `productNum` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of in
-- ----------------------------
BEGIN;
INSERT INTO `in` VALUES (1000, 'in1', '1', 100);
INSERT INTO `in` VALUES (1001, 'in2', '2', 121);
INSERT INTO `in` VALUES (1002, 'in3', '1', 1200);
COMMIT;

-- ----------------------------
-- Table structure for out
-- ----------------------------
DROP TABLE IF EXISTS `out`;
CREATE TABLE `out` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `number` varchar(105) DEFAULT NULL,
  `productId` int(10) DEFAULT NULL,
  `productNum` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of out
-- ----------------------------
BEGIN;
INSERT INTO `out` VALUES (1000, 'out1', 1, 105);
COMMIT;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(105) DEFAULT NULL,
  `type` varchar(105) DEFAULT NULL,
  `unit` varchar(105) DEFAULT NULL,
  `info` varchar(105) DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1002 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of product
-- ----------------------------
BEGIN;
INSERT INTO `product` VALUES (1000, '肥皂', '日用品', '件', '无详情', 2.00);
INSERT INTO `product` VALUES (1001, '地瓜', '食品', '千克', '无详情', 1.00);
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1024 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of staff
-- ----------------------------
BEGIN;
INSERT INTO `staff` VALUES (1000, 'root', '马騳骉', '男', 20, '管理员', '13867481033', '1@q.com', '123123');
INSERT INTO `staff` VALUES (1001, 'user', 'Mace', '男', 21, '员工', '13864781033', '22@qq.com', '96e79218965eb72c92a549dd5a330112');
INSERT INTO `staff` VALUES (1002, 'user1', 'u1', '男', 21, '员工', '13864781033', '3@q.com', '123123');
INSERT INTO `staff` VALUES (1003, 'user3', 'u1', '男', 21, '员工', '13864781033', '3@q.com', '123123');
INSERT INTO `staff` VALUES (1004, 'user4', 'u1', '男', 21, '员工', '13864781033', '3@q.com', '123123');
INSERT INTO `staff` VALUES (1005, 'user5', 'u1', '男', 21, '员工', '13864781033', '3@q.com', '123123');
INSERT INTO `staff` VALUES (1006, 'user6', 'u1', '男', 21, '员工', '13864781033', '3@q.com', '123123');
INSERT INTO `staff` VALUES (1007, 'user7', 'u1', '男', 21, '员工', '13864781033', '3@q.com', '123123');
INSERT INTO `staff` VALUES (1008, 'user8', 'u1', '男', 21, '员工', '13864781033', '3@q.com', '123123');
INSERT INTO `staff` VALUES (1009, 'user9', 'u1', '男', 21, '员工', '13864781033', '3@q.com', '123123');
INSERT INTO `staff` VALUES (1010, 'user10', 'u1', '女', 21, '员工', '13864781033', '3@q.com', '123123');
INSERT INTO `staff` VALUES (1011, 'user11', 'u1', '男', 21, '员工', '13864781033', '3@q.com', '123123');
INSERT INTO `staff` VALUES (1012, 'user12', 'u1', '男', 21, '员工', '13864781033', '3@q.com', '123123');
INSERT INTO `staff` VALUES (1013, 'user13', 'u1', '男', 21, '员工', '13864781033', '3@q.com', '123123');
INSERT INTO `staff` VALUES (1014, 'user14', 'u2', '男', 21, '员工', '13864781033', '1@q.com', '123123');
INSERT INTO `staff` VALUES (1015, 'user', 'name1', '男', 15, '员工', '13864781033', '', '111111');
INSERT INTO `staff` VALUES (1016, 'sad', '112', '男', 111, '员工', '13864781033', 'ad@qasd.com', '111111');
INSERT INTO `staff` VALUES (1017, '13867481033', '13867481033', '男', 2, '员工', '13867481033', '13867481033@s.qom', '111111');
INSERT INTO `staff` VALUES (1018, 'user', 'name1', '男', 15, '员工', '13864781033', '', '111111');
INSERT INTO `staff` VALUES (1019, 'nm', 'n', '男', 1, '员工', '13867481033', 'sdklj@qq.com', '1111111');
INSERT INTO `staff` VALUES (1020, '123', 'asdj', '女', 12, '管理员', '13864781033', 'adqwe@qq.com', '111111');
INSERT INTO `staff` VALUES (1021, '12', 'asd111', '男', 12, '员工', '15154622580', 'aqwe@qq.com', '111111');
INSERT INTO `staff` VALUES (1023, '111', 'hh', '男', 12, '员工', '13867481033', '1@qq.om', '1111111');
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

SET FOREIGN_KEY_CHECKS = 1;
