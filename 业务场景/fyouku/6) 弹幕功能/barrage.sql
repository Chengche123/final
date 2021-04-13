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

 Date: 02/04/2021 23:16:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for barrage
-- ----------------------------
DROP TABLE IF EXISTS `barrage`;
CREATE TABLE `barrage`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '评论内容',
  `add_time` int(0) NULL DEFAULT 0 COMMENT '评论时间',
  `user_id` int(0) NULL DEFAULT 0 COMMENT '评论用户',
  `status` tinyint(0) NULL DEFAULT 0 COMMENT '状态0=未审核 1=审核通过',
  `current_time` int(0) NULL DEFAULT 1 COMMENT '视频当前播放时间',
  `episodes_id` int(0) NULL DEFAULT 0 COMMENT '评论视频',
  `video_id` int(0) NULL DEFAULT 0 COMMENT '所属视频',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of barrage
-- ----------------------------
INSERT INTO `barrage` VALUES (31, '这个面看着真好吃', 1585229073, 10, 1, 196, 1, 1);
INSERT INTO `barrage` VALUES (32, '厉害', 1585229126, 10, 1, 15, 1, 1);
INSERT INTO `barrage` VALUES (33, '佐助貌似没有准备时间', 1585229139, 10, 1, 28, 1, 1);
INSERT INTO `barrage` VALUES (34, '鸣人加油', 1585229161, 10, 1, 50, 1, 1);
INSERT INTO `barrage` VALUES (35, '这个太牛了', 1585229213, 10, 1, 70, 1, 1);
INSERT INTO `barrage` VALUES (36, '有机会一定吃一次', 1585229233, 10, 1, 138, 1, 1);
INSERT INTO `barrage` VALUES (37, '满满的回忆呀', 1585411138, 10, 1, 15, 1, 1);
INSERT INTO `barrage` VALUES (38, '满满的回忆', 1585411216, 10, 1, 10, 1, 1);
INSERT INTO `barrage` VALUES (39, '好厉害呀', 1585413908, 10, 1, 25, 1, 1);
INSERT INTO `barrage` VALUES (40, '佐助', 1585413920, 10, 1, 36, 1, 1);
INSERT INTO `barrage` VALUES (41, '好可爱哦', 1585413932, 10, 1, 49, 1, 1);
INSERT INTO `barrage` VALUES (42, '真帅', 1585413946, 10, 1, 62, 1, 1);
INSERT INTO `barrage` VALUES (43, '真酷', 1585416023, 10, 1, 21, 6, 39);
INSERT INTO `barrage` VALUES (44, '我说了才算', 1585416052, 10, 1, 77, 6, 39);
INSERT INTO `barrage` VALUES (45, '太震撼了', 1585416072, 10, 1, 96, 6, 39);
INSERT INTO `barrage` VALUES (46, 'buc', 1585424451, 10, 1, 42, 1, 1);

SET FOREIGN_KEY_CHECKS = 1;
