/*
 Navicat MySQL Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : localhost:3306
 Source Schema         : daoke

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 24/11/2018 13:55:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for action
-- ----------------------------
DROP TABLE IF EXISTS `action`;
CREATE TABLE `action`  (
  `id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `action_column_id` int(4) UNSIGNED NOT NULL COMMENT '权限列id 外键 action_column',
  `action_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '动作名称',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `action`(`action`) USING BTREE,
  INDEX `action_column_id`(`action_column_id`) USING BTREE,
  CONSTRAINT `action_ibfk_1` FOREIGN KEY (`action_column_id`) REFERENCES `action_column` (`action_column_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of action
-- ----------------------------
INSERT INTO `action` VALUES (1, 1, '查询管理员信息', 'select_admin');
INSERT INTO `action` VALUES (2, 1, '添加管理员信息', 'add_admin');
INSERT INTO `action` VALUES (3, 1, '修改管理员信息', 'update_admin');
INSERT INTO `action` VALUES (4, 1, '删除管理员信息', 'delete_admin');
INSERT INTO `action` VALUES (5, 2, '添加用户信息', 'add_user');
INSERT INTO `action` VALUES (6, 2, '查询用户信息', 'select_user');
INSERT INTO `action` VALUES (7, 2, '修改用户信息', 'update_user');
INSERT INTO `action` VALUES (8, 2, '删除用户信息', 'delete_user');

-- ----------------------------
-- Table structure for action_column
-- ----------------------------
DROP TABLE IF EXISTS `action_column`;
CREATE TABLE `action_column`  (
  `action_column_id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '权限列id',
  `action_column_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限列名',
  PRIMARY KEY (`action_column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of action_column
-- ----------------------------
INSERT INTO `action_column` VALUES (1, '管理员管理');
INSERT INTO `action_column` VALUES (2, '用户管理');

-- ----------------------------
-- Table structure for action_group
-- ----------------------------
DROP TABLE IF EXISTS `action_group`;
CREATE TABLE `action_group`  (
  `id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT,
  `action` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `group_id` int(4) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `action`(`action`) USING BTREE,
  INDEX `group_id`(`group_id`) USING BTREE,
  CONSTRAINT `action_group_ibfk_1` FOREIGN KEY (`action`) REFERENCES `action` (`action`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `action_group_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of action_group
-- ----------------------------
INSERT INTO `action_group` VALUES (1, 'select_admin', 1);
INSERT INTO `action_group` VALUES (2, 'add_admin', 1);
INSERT INTO `action_group` VALUES (3, 'update_admin', 1);
INSERT INTO `action_group` VALUES (4, 'delete_admin', 1);
INSERT INTO `action_group` VALUES (5, 'add_user', 1);
INSERT INTO `action_group` VALUES (6, 'select_user', 1);
INSERT INTO `action_group` VALUES (7, 'update_user', 1);
INSERT INTO `action_group` VALUES (8, 'delete_user', 1);
INSERT INTO `action_group` VALUES (9, 'add_user', 2);
INSERT INTO `action_group` VALUES (10, 'select_user', 2);
INSERT INTO `action_group` VALUES (11, 'update_user', 2);
INSERT INTO `action_group` VALUES (12, 'delete_user', 2);

-- ----------------------------
-- Table structure for group
-- ----------------------------
DROP TABLE IF EXISTS `group`;
CREATE TABLE `group`  (
  `id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '组的ID',
  `group_type` int(4) NOT NULL DEFAULT 4 COMMENT '组的类型,1代表超级管理员，2是管理员，3是会员用户，4是普通用户',
  `group_info` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '组的信息',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of group
-- ----------------------------
INSERT INTO `group` VALUES (1, 1, '超级管理员');
INSERT INTO `group` VALUES (2, 2, '管理员');
INSERT INTO `group` VALUES (3, 3, '会员用户');
INSERT INTO `group` VALUES (4, 4, '普通用户');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `birthday` date NULL DEFAULT NULL,
  `qq` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `head_portrait` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '123', '女', '2018-11-20', NULL, NULL, '1225694554@qq.com', '2018-11-20 20:11:59', NULL);
INSERT INTO `user` VALUES (5, '纱雾', '123', '女', '2018-11-23', NULL, NULL, '1225694554@qq.com', '2018-11-23 08:50:17', NULL);
INSERT INTO `user` VALUES (6, '黑猫', '123', '女', '2018-11-23', NULL, NULL, '1225694554@qq.com', '2018-11-23 08:52:23', NULL);

-- ----------------------------
-- Table structure for user_group
-- ----------------------------
DROP TABLE IF EXISTS `user_group`;
CREATE TABLE `user_group`  (
  `id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(4) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `group_id` int(4) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `group_id`(`group_id`) USING BTREE,
  CONSTRAINT `user_group_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_group_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_group
-- ----------------------------
INSERT INTO `user_group` VALUES (1, 1, 'admin', 1);

SET FOREIGN_KEY_CHECKS = 1;
