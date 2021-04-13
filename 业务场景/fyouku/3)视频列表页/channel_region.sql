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

 Date: 02/04/2021 19:33:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for channel_region
-- ----------------------------
DROP TABLE IF EXISTS `channel_region`;
CREATE TABLE `channel_region`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `add_time` int(0) NULL DEFAULT 0 COMMENT '添加时间',
  `channel_id` int(0) NULL DEFAULT NULL COMMENT '所属频道',
  `sort` int(0) NULL DEFAULT 0 COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of channel_region
-- ----------------------------
INSERT INTO `channel_region` VALUES (1, '日本', '1', 1581424714, 1, 2);
INSERT INTO `channel_region` VALUES (2, '中国大陆', '1', 1581424714, 1, 3);
INSERT INTO `channel_region` VALUES (3, '美国', '1', 1581424714, 1, 1);

SET FOREIGN_KEY_CHECKS = 1;
