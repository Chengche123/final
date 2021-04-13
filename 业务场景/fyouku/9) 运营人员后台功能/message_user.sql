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

 Date: 02/04/2021 23:04:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for message_user
-- ----------------------------
DROP TABLE IF EXISTS `message_user`;
CREATE TABLE `message_user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `message_id` int(0) NULL DEFAULT 0 COMMENT '所属消息',
  `user_id` int(0) NULL DEFAULT 0 COMMENT '所属用户',
  `add_time` int(0) NULL DEFAULT 0 COMMENT '添加时间',
  `status` tinyint(0) NULL DEFAULT 0 COMMENT '状态 1=展示',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of message_user
-- ----------------------------
INSERT INTO `message_user` VALUES (29, 30, 8, 1584989901, 1);
INSERT INTO `message_user` VALUES (30, 30, 9, 1584989901, 1);
INSERT INTO `message_user` VALUES (31, 31, 8, 1584991350, 1);
INSERT INTO `message_user` VALUES (32, 32, 456, 1584991360, 1);
INSERT INTO `message_user` VALUES (33, 33, 4, 1584991380, 1);
INSERT INTO `message_user` VALUES (34, 33, 5, 1584991380, 1);
INSERT INTO `message_user` VALUES (35, 33, 6, 1584991380, 1);
INSERT INTO `message_user` VALUES (36, 34, 0, 1584993495, 1);
INSERT INTO `message_user` VALUES (37, 35, 1, 1584993499, 1);
INSERT INTO `message_user` VALUES (38, 35, 2, 1584993499, 1);
INSERT INTO `message_user` VALUES (39, 36, 10, 1585403108, 1);
INSERT INTO `message_user` VALUES (40, 36, 11, 1585403108, 1);
INSERT INTO `message_user` VALUES (41, 38, 10, 1586662539, 1);
INSERT INTO `message_user` VALUES (42, 38, 11, 1586662539, 1);
INSERT INTO `message_user` VALUES (43, 39, 8, 1586687723, 1);
INSERT INTO `message_user` VALUES (44, 39, 9, 1586687723, 1);
INSERT INTO `message_user` VALUES (45, 39, 10, 1586687723, 1);
INSERT INTO `message_user` VALUES (46, 39, 11, 1586687723, 1);

SET FOREIGN_KEY_CHECKS = 1;
