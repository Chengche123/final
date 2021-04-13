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

 Date: 02/04/2021 21:00:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '评论内容',
  `add_time` int(0) NULL DEFAULT 0 COMMENT '评论时间',
  `user_id` int(0) NULL DEFAULT 0 COMMENT '评论用户',
  `status` tinyint(0) NULL DEFAULT 0 COMMENT '状态0=未审核 1=审核通过',
  `stamp` tinyint(0) NULL DEFAULT 0 COMMENT '盖章1=热评2=公告',
  `praise_count` int(0) NULL DEFAULT 0 COMMENT '点赞数',
  `episodes_id` int(0) NULL DEFAULT NULL COMMENT '评论视频',
  `video_id` int(0) NULL DEFAULT 0 COMMENT '所属视频',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, '好期待下一集，净眼马上又要看到了，浦式看到了肯定会说出它的秘密', 1581772341, 10, 1, 0, 1, 1, 1);
INSERT INTO `comment` VALUES (2, '博人智商很高，在忍者学校成绩都满分。悟性也都是很高螺旋丸很快就能掌握，但不知道为什么博人在战斗的时候总分不清情况。什么时候该打，什么时候该跑总是表现得一股脑。无论敌人什么实力总是要向前冲，一点也表现不出博人的战术分析。按理说博人比鸣人更有理智，但表现得总是差强人意。我偶尔就看的十分尴尬。', 1581772593, 10, 1, 1, 186, 1, 1);
INSERT INTO `comment` VALUES (3, '考试来啦！轻松看剧，认真答题', 1581772606, 10, 1, 2, 3459, 1, 1);
INSERT INTO `comment` VALUES (4, '太精彩了', 1581913200, 10, 1, 0, 0, 1, 1);
INSERT INTO `comment` VALUES (13, '火影忍者太好看了', 1584303404, 10, 1, 0, 0, 1, 1);
INSERT INTO `comment` VALUES (14, '满满的回忆呀', 1585230607, 10, 1, 0, 0, 1, 1);
INSERT INTO `comment` VALUES (15, '鸣人、雏田、佐助、小樱', 1585230726, 10, 1, 0, 0, 1, 1);
INSERT INTO `comment` VALUES (16, '漂亮的火', 1586610931, 10, 1, 0, 0, 1, 1);
INSERT INTO `comment` VALUES (35, '1', 1586686560, 10, 1, 0, 0, 1, 1);
INSERT INTO `comment` VALUES (36, '2', 1586686812, 10, 1, 0, 0, 1, 1);
INSERT INTO `comment` VALUES (37, 'buco', 1587217184, 10, 1, 0, 0, 1, 1);
INSERT INTO `comment` VALUES (38, 'qq', 1587217316, 10, 1, 0, 0, 1, 1);
INSERT INTO `comment` VALUES (39, 'pinlun', 1587217428, 10, 1, 0, 0, 1, 1);
INSERT INTO `comment` VALUES (40, '评论一下', 1587224714, 10, 1, 0, 0, 1, 1);
INSERT INTO `comment` VALUES (41, '再来', 1587224736, 10, 1, 0, 0, 1, 1);

SET FOREIGN_KEY_CHECKS = 1;
