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

 Date: 02/04/2021 18:46:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for advert
-- ----------------------------
DROP TABLE IF EXISTS `advert`;
CREATE TABLE `advert`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '广告标题',
  `sub_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '广告副标题',
  `channel_id` int(0) NULL DEFAULT 0 COMMENT '所属频道 0=首页',
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '广告图片',
  `sort` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '排序',
  `add_time` int(0) NULL DEFAULT 0 COMMENT '添加时间',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '跳转地址',
  `status` tinyint(0) NULL DEFAULT 0 COMMENT '0=关闭 1=开启',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of advert
-- ----------------------------
INSERT INTO `advert` VALUES (1, '黑色四叶草', '黑色暴牛骑士团', 1, '/static/data/new/1b.png', '1', 1581600338, '/show?id=9', 1);
INSERT INTO `advert` VALUES (2, '黑色四叶草', '黑色暴牛骑士团', 1, '/static/data/channel/5a8a66c214824da7911cc3d64377d0d5.png', '1', 1581600338, '/show?id=9', 0);

SET FOREIGN_KEY_CHECKS = 1;
