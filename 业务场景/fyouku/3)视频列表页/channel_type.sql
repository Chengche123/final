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

 Date: 02/04/2021 19:34:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for channel_type
-- ----------------------------
DROP TABLE IF EXISTS `channel_type`;
CREATE TABLE `channel_type`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `add_time` int(0) NULL DEFAULT 0 COMMENT '添加时间',
  `channel_id` int(0) NULL DEFAULT NULL COMMENT '所属频道',
  `sort` int(0) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of channel_type
-- ----------------------------
INSERT INTO `channel_type` VALUES (1, '少女', '1', 1581424714, 1, 6);
INSERT INTO `channel_type` VALUES (2, '热血', '1', 1581424714, 1, 5);
INSERT INTO `channel_type` VALUES (3, '青春', '1', 1581424714, 1, 4);
INSERT INTO `channel_type` VALUES (4, '社会', '1', 1581424714, 1, 3);
INSERT INTO `channel_type` VALUES (5, '科幻', '1', 1581424714, 1, 2);
INSERT INTO `channel_type` VALUES (6, '搞笑', '1', 1581424714, 1, 1);

SET FOREIGN_KEY_CHECKS = 1;
