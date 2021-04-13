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

 Date: 02/04/2021 19:09:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for video
-- ----------------------------
DROP TABLE IF EXISTS `video`;
CREATE TABLE `video`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '视频ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `sub_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '副标题',
  `status` tinyint(0) NULL DEFAULT 0 COMMENT '状态,-1=下架,0=审核中,1=正常',
  `add_time` int(0) NULL DEFAULT 0 COMMENT '添加时间',
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '横版缩略图',
  `img1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '竖版缩略图',
  `channel_id` int(0) NULL DEFAULT 0 COMMENT '所属频道',
  `type_id` int(0) NULL DEFAULT 0 COMMENT '频道类型ID',
  `region_id` int(0) NULL DEFAULT 0 COMMENT '地区ID',
  `user_id` int(0) NULL DEFAULT 0 COMMENT '所属用户',
  `episodes_count` int(0) NULL DEFAULT 0 COMMENT '集数',
  `episodes_update_time` int(0) NULL DEFAULT 0 COMMENT '集数更新时间',
  `is_end` tinyint(0) NULL DEFAULT 0 COMMENT '是否完结0=未完结 1=已完结',
  `is_hot` tinyint(0) NULL DEFAULT 0 COMMENT '1=正在热播',
  `is_recommend` tinyint(0) NULL DEFAULT 0 COMMENT '1=推荐 0=否',
  `comment` int(0) NULL DEFAULT 0 COMMENT '评论数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of video
-- ----------------------------
INSERT INTO `video` VALUES (1, '火影忍者', '孤独少年忍者世界英雄梦', 1, 1581423724, '/static/data/new/14.png', '/static/data/new/14a.png', 1, 2, 1, 10, 720, 0, 1, 1, 0, 10077212);
INSERT INTO `video` VALUES (2, '阿衰 第二季', '怕踢学校搞笑故事再次归来', 1, 1581423724, '/static/data/new/2.png', '/static/data/new/2a.png', 1, 2, 2, 10, 15, 0, 0, 1, 1, 17860);
INSERT INTO `video` VALUES (3, '名侦探柯南', '万年小学生的推理生涯', 1, 1581423724, '/static/data/new/3.png', '/static/data/new/3a.png', 1, 3, 1, 0, 1021, 0, 0, 1, 0, 29876);
INSERT INTO `video` VALUES (4, '博人传 火影忍者新时代', '鸣人之子续写忍者传奇', 1, 1581423724, '/static/data/new/4.png', '/static/data/new/4a.png', 1, 2, 1, 0, 137, 0, 0, 1, 0, 18976);
INSERT INTO `video` VALUES (5, '一拳超人 第二季', '一拳埼玉热血回归', 1, 1581423724, '/static/data/new/5.png', '/static/data/new/5a.png', 1, 2, 1, 0, 13, 0, 0, 1, 0, 98761);
INSERT INTO `video` VALUES (6, '排球少年 第四季', '排球部迎接更艰巨的挑战', 1, 1581423724, '/static/data/new/6.png', '/static/data/new/6a.png', 1, 3, 1, 0, 5, 0, 0, 1, 0, 23564);
INSERT INTO `video` VALUES (7, '秦时明月之沧海横流', '十年国漫十年秦时', 1, 1581423724, '/static/data/new/7.png', '/static/data/new/7a.png', 1, 2, 2, 0, 1, 0, 0, 1, 0, 0);
INSERT INTO `video` VALUES (8, '猫和老鼠', '汤姆和杰瑞的搞笑日常', 1, 1581423724, '/static/data/new/39.png', '/static/data/new/39a.png', 1, 1, 3, 0, 140, 0, 1, 1, 0, 0);
INSERT INTO `video` VALUES (9, '黑色四叶草', '黑色暴牛骑士团', 1, 1581423724, '/static/data/new/37.png', '/static/data/new/37a.png', 1, 2, 1, 0, 122, 0, 0, 1, 0, 0);
INSERT INTO `video` VALUES (10, '蜡笔小新 第二季', '人小鬼大的野原新之助', 1, 1581423724, '/static/data/new/10.png', '/static/data/new/10a.png', 1, 1, 1, 0, 873, 0, 1, 0, 1, 0);
INSERT INTO `video` VALUES (11, '猎人 重制版', '主人公寻父的冒险路', 1, 1581423724, '/static/data/new/11.png', '/static/data/new/11a.png', 1, 2, 1, 0, 148, 0, 1, 0, 1, 0);
INSERT INTO `video` VALUES (12, '银魂', '跟银魂比吐槽你输定了', 1, 1581423724, '/static/data/new/18.png', '/static/data/new/18a.png', 1, 2, 1, 0, 368, 0, 1, 0, 1, 0);
INSERT INTO `video` VALUES (13, '蜡笔小新 第三季', '野原新之助的日常生活', 1, 1581423724, '/static/data/new/13.png', '/static/data/new/13a.png', 1, 1, 1, 0, 156, 0, 1, 0, 1, 0);
INSERT INTO `video` VALUES (14, '网球王子', '运动美少年热血故事', 1, 1581423724, '/static/data/new/14.png', '/static/data/new/14a.png', 1, 1, 1, 0, 178, 0, 1, 0, 1, 0);
INSERT INTO `video` VALUES (15, '守护甜心 第一季', '能实现愿望的魔法蛋', 1, 1581423724, '/static/data/new/15.png', '/static/data/new/15a.png', 1, 1, 1, 0, 51, 0, 1, 0, 1, 0);
INSERT INTO `video` VALUES (16, '精灵宝可梦 第四季', '星球上不可思议的生物', 1, 1581423724, '/static/data/new/16.png', '/static/data/new/16a.png', 1, 1, 1, 0, 144, 0, 1, 0, 1, 0);
INSERT INTO `video` VALUES (17, 'BLEACH 境&middot;界', '古惑仔之人在地府', 1, 1581423724, '/static/data/new/17.png', '/static/data/new/17a.png', 1, 2, 1, 0, 366, 0, 1, 0, 1, 0);
INSERT INTO `video` VALUES (18, '犬夜叉', '寻找四魂碎片的旅程', 1, 1581423724, '/static/data/new/38.png', '/static/data/new/38a.png', 1, 1, 1, 0, 167, 0, 1, 0, 1, 0);
INSERT INTO `video` VALUES (19, '伍六七之最强发型师', '强着对手不断现身', 1, 1581423724, '/static/data/new/19.png', '/static/data/new/19a.png', 1, 3, 3, 0, 10, 0, 1, 0, 0, 0);
INSERT INTO `video` VALUES (20, '刺客伍六七', '刺客的奇葩伪装术', 1, 1581423724, '/static/data/new/20.png', '/static/data/new/20a.png', 1, 3, 3, 0, 14, 0, 1, 0, 0, 0);
INSERT INTO `video` VALUES (21, '海贼王', '路飞再踏热血征程', 1, 1581423724, '/static/data/new/21.png', '/static/data/new/21a.png', 1, 1, 1, 0, 920, 0, 0, 0, 0, 0);
INSERT INTO `video` VALUES (22, '元气少女缘结神 第一季', '软萌少女结缘狐神', 1, 1581423724, '/static/data/new/22.png', '/static/data/new/22a.png', 1, 1, 1, 0, 13, 0, 1, 0, 0, 9988);
INSERT INTO `video` VALUES (23, '爱神巧克力', '高中生成后宫之王', 1, 1581423724, '/static/data/new/23.png', '/static/data/new/23a.png', 1, 1, 1, 0, 15, 0, 1, 0, 0, 9678);
INSERT INTO `video` VALUES (24, '魔法使的新娘', '骨叔新娘养成计划', 1, 1581423724, '/static/data/new/24.png', '/static/data/new/24a.png', 1, 1, 1, 0, 24, 0, 1, 0, 0, 8080);
INSERT INTO `video` VALUES (25, '悬崖上的金鱼公主', '宫崎骏版小美人鱼', 1, 1581423724, '/static/data/new/25.png', '/static/data/new/25a.png', 1, 1, 1, 0, 1, 0, 1, 0, 0, 5674);
INSERT INTO `video` VALUES (26, '飞天小女警Z', '超能力少女卫东京', 1, 1581423724, '/static/data/new/26.png', '/static/data/new/26a.png', 1, 1, 1, 0, 52, 0, 1, 0, 0, 8735);
INSERT INTO `video` VALUES (27, '一起来看流星雨', '灰姑娘的校园爱情', 1, 1581423724, '/static/data/new/27.png', '/static/data/new/27a.png', 1, 1, 1, 0, 52, 0, 1, 0, 0, 3476);
INSERT INTO `video` VALUES (28, '罗小黑战记', '同名大电影热映中', 1, 1581423724, '/static/data/new/28.png', '/static/data/new/28a.png', 1, 2, 2, 0, 28, 0, 1, 0, 1, 0);
INSERT INTO `video` VALUES (29, '秦时明月之君临天下', '沧海横流 江湖再见', 1, 1581423724, '/static/data/new/29.png', '/static/data/new/29a.png', 1, 2, 2, 0, 75, 0, 1, 0, 1, 0);
INSERT INTO `video` VALUES (30, '镇魂街', '吸纳亡灵镇压恶灵之地', 1, 1581423724, '/static/data/new/30.png', '/static/data/new/30a.png', 1, 2, 2, 0, 24, 0, 1, 0, 1, 0);
INSERT INTO `video` VALUES (31, '秦时明月之诸子百家', '出机关城伪装入桑海', 1, 1581423724, '/static/data/new/31.png', '/static/data/new/31a.png', 1, 2, 2, 0, 34, 0, 1, 0, 1, 0);
INSERT INTO `video` VALUES (32, '少年锦衣卫', '三盗大闹皇宫劫公主', 1, 1581423724, '/static/data/new/32.png', '/static/data/new/32a.png', 1, 2, 2, 0, 28, 0, 1, 0, 1, 0);
INSERT INTO `video` VALUES (33, '十万个冷笑话 第三季', '经典角色悉数回归爆笑玩梗', 1, 1581423724, '/static/data/new/33.png', '/static/data/new/33a.png', 1, 2, 2, 0, 52, 0, 1, 0, 1, 0);
INSERT INTO `video` VALUES (34, '超神学院', '英雄联盟改编人气动画', 1, 1581423724, '/static/data/new/34.png', '/static/data/new/34a.png', 1, 2, 2, 0, 30, 0, 1, 0, 1, 0);
INSERT INTO `video` VALUES (35, '秦时明月之万里长城', '铸造帝国的万里长城', 1, 1581423724, '/static/data/new/35.png', '/static/data/new/35a.png', 1, 2, 2, 0, 37, 0, 1, 0, 1, 0);
INSERT INTO `video` VALUES (36, '天行九歌', '战国末年一局权力游戏', 1, 1581423724, '/static/data/new/36.png', '/static/data/new/36a.png', 1, 2, 2, 0, 60, 0, 1, 0, 1, 0);

SET FOREIGN_KEY_CHECKS = 1;
