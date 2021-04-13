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

 Date: 02/04/2021 23:04:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '消息内容',
  `add_time` int(0) NULL DEFAULT 0 COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES (29, 'aaa', 1584989876);
INSERT INTO `message` VALUES (30, 'aaa', 1584989901);
INSERT INTO `message` VALUES (31, 'haha', 1584991350);
INSERT INTO `message` VALUES (32, 'cvcv', 1584991360);
INSERT INTO `message` VALUES (33, 'bnbn', 1584991380);
INSERT INTO `message` VALUES (34, '', 1584993495);
INSERT INTO `message` VALUES (35, 'asd', 1584993499);
INSERT INTO `message` VALUES (36, '您有新的消息', 1585403108);
INSERT INTO `message` VALUES (37, 'mq消息', 1586662210);
INSERT INTO `message` VALUES (38, 'mq消息', 1586662299);
INSERT INTO `message` VALUES (39, 'mq测试信息', 1586687610);
INSERT INTO `message` VALUES (40, '111', 1587233301);
INSERT INTO `message` VALUES (41, '11', 1587233346);
INSERT INTO `message` VALUES (42, 'ceshi', 1587235700);

SET FOREIGN_KEY_CHECKS = 1;
