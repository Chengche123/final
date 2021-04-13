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

 Date: 02/04/2021 20:54:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for video_episodes
-- ----------------------------
DROP TABLE IF EXISTS `video_episodes`;
CREATE TABLE `video_episodes`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `add_time` int(0) NULL DEFAULT 0 COMMENT '添加时间',
  `num` int(0) NULL DEFAULT 0 COMMENT '第几集',
  `video_id` int(0) NULL DEFAULT 0 COMMENT '所属时间',
  `play_url` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '播放地址',
  `status` tinyint(0) NULL DEFAULT 0 COMMENT '0=不展示 1= 展示',
  `comment` int(0) NULL DEFAULT 0 COMMENT '评论数',
  `aliyun_video_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '阿里云ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of video_episodes
-- ----------------------------
INSERT INTO `video_episodes` VALUES (1, '漩涡鸣人登场', 1581423724, 1, 1, '/static/video/coverr-sparks-of-bonfire-1573980240958.mp4', 1, 10058211, '');
INSERT INTO `video_episodes` VALUES (2, '我是木叶丸', 1581423724, 2, 1, 'http://valipl.cp31.ott.cibntv.net/6975FF784E44171ADFFEC2C8F/03000500005DFA480C8BB7800000001B2BD8F5-D527-4D34-B6BF-9421CC1386AE-1-114.m3u8', 1, 0, '');
INSERT INTO `video_episodes` VALUES (3, '宿敌 佐助和小樱', 1581423724, 3, 1, 'http://valipl.cp31.ott.cibntv.net/65732AA09E93E71999F465E15/03000300005C3EE91602EA4011BA6ABCA65B2E-C656-4A40-A2DF-0D5615BBDC9A-1-114.m3u8?ccode=0502&duration=1422&expire=18000&psid=cc2bdefaf31ebf17a11d7a0d8f481af3&ups_client_netip=3b6ddb32&ups_ts=1584294982&ups_userid=1074229826&utid=iibzDpga4F4CAW%2FKOdow37WF&vid=XNTI4NjEwODg4&vkey=B3d057b782ea13d7eb639640801d05569&sm=1&operate_type=1&dre=u37&si=73&eo=0&dst=1&iv=0&s=cc001f06962411de83b1&bc=2', 1, 0, '');
INSERT INTO `video_episodes` VALUES (5, '哪吒-我命由我不由天', 1585301248, 1, 38, '/static/video/087f28d02fa53ed22e913605387f13ae.mp4', 1, 0, '');
INSERT INTO `video_episodes` VALUES (6, '我命由我不由天', 1585415987, 1, 39, '/static/video/e63181ae03e3700b054cd66cfe7d9224.mp4', 1, 0, '');
INSERT INTO `video_episodes` VALUES (7, '蜡笔小新樱桃小丸子', 1586312105, 1, 40, '/static/video/coverr-sparks-of-bonfire-1573980240958.mp4', 1, 0, '');
INSERT INTO `video_episodes` VALUES (8, '我命由我不由天', 1587653999, 1, 40, 'e92510a60e6643f190a3cd9cd5d092fb', 1, 0, '');
INSERT INTO `video_episodes` VALUES (9, '我命由我不由天1', 1587654100, 1, 41, '323ddc1b044c4fa09dfb3e792ad685b8', 1, 0, NULL);
INSERT INTO `video_episodes` VALUES (10, '我命由我不由天44', 1587654541, 1, 45, 'd2fe7f9743c9418ca03a3ce755e4a30f', 1, 0, '');
INSERT INTO `video_episodes` VALUES (11, '我命由我不由天55', 1587654713, 1, 46, '', 1, 0, '92702186ab754e77ae7a96cd732e9329');
INSERT INTO `video_episodes` VALUES (12, '我命由我不由天66', 1587825692, 1, 47, '', 1, 0, 'ffaa9f3a939645268b20b188ca9f9792');

SET FOREIGN_KEY_CHECKS = 1;
