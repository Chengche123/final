/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80020
 Source Host           : localhost:3306
 Source Schema         : fyouku

 Target Server Type    : MySQL
 Target Server Version : 80020
 File Encoding         : 65001

 Date: 02/04/2021 17:27:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `add_time` int(0) NULL DEFAULT 0 COMMENT '注册时间',
  `status` tinyint(0) NULL DEFAULT 1 COMMENT '状态',
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (8, 'zhja', '49b3589f3155c8f322990a631a34743f', 1579170320, 0, NULL, NULL);
INSERT INTO `user` VALUES (10, '青蛙', '8e5d36fe2ca0e27b6914ecec5ec49754', 1579257632, 0, '18600001111', '/static/data/user/zhja.png');
INSERT INTO `user` VALUES (11, '张三', '78a4c1932deffeb1a2367ddd08b42218', 1579258028, 0, '123123', NULL);
INSERT INTO `user` VALUES (12, '李四', '78a4c1932deffeb1a2367ddd08b42218', 1579258214, 0, '18600002222', NULL);
INSERT INTO `user` VALUES (13, '王五', '781305f065731d4dffc1033493b03c9c', 1581631477, 0, '18699993333', NULL);
INSERT INTO `user` VALUES (14, 'test3', NULL, 1583293416, 0, '18600008888', '我是头像');
INSERT INTO `user` VALUES (15, 'test3', NULL, 1583293420, 0, '18600008888', '我是头像');
INSERT INTO `user` VALUES (16, '', '8e5d36fe2ca0e27b6914ecec5ec49754', 1584176714, 1, '18678787878', NULL);
INSERT INTO `user` VALUES (17, '', 'ec38f95ed3b590273973f510a7c4e983', 1584247509, 0, '', NULL);
INSERT INTO `user` VALUES (18, '', '781305f065731d4dffc1033493b03c9c', 1584247668, 0, '186ddd00001111', NULL);
INSERT INTO `user` VALUES (19, '', '781305f065731d4dffc1033493b03c9c', 1584260475, 1, '18600003333', '');
INSERT INTO `user` VALUES (20, '', '8e5d36fe2ca0e27b6914ecec5ec49754', 1584261355, 1, '18600005555', '');

SET FOREIGN_KEY_CHECKS = 1;
