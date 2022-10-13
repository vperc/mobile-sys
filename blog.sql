/*
 Navicat Premium Data Transfer

 Source Server         : Mysql
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : localhost:3306
 Source Schema         : gx_day17

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 13/10/2022 19:30:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for app01_admin
-- ----------------------------
DROP TABLE IF EXISTS `app01_admin`;
CREATE TABLE `app01_admin`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app01_admin
-- ----------------------------
INSERT INTO `app01_admin` VALUES (1, 'yuzx', 'de42f04cad94575fb240a96afde0fcb5');
INSERT INTO `app01_admin` VALUES (2, 'root', 'de42f04cad94575fb240a96afde0fcb5');
INSERT INTO `app01_admin` VALUES (3, 'big666', 'de42f04cad94575fb240a96afde0fcb5');
INSERT INTO `app01_admin` VALUES (4, 'erik', 'de42f04cad94575fb240a96afde0fcb5');
INSERT INTO `app01_admin` VALUES (6, 'hh', 'de42f04cad94575fb240a96afde0fcb5');
INSERT INTO `app01_admin` VALUES (7, 'abc', 'de42f04cad94575fb240a96afde0fcb5');

-- ----------------------------
-- Table structure for app01_boss
-- ----------------------------
DROP TABLE IF EXISTS `app01_boss`;
CREATE TABLE `app01_boss`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `age` int NOT NULL,
  `img` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app01_boss
-- ----------------------------
INSERT INTO `app01_boss` VALUES (1, '王小二', 21, 'app01\\static\\img\\1657122054004.jpg');
INSERT INTO `app01_boss` VALUES (2, '余忠祥', 24, 'static\\img\\1657119871440.jpg');

-- ----------------------------
-- Table structure for app01_city
-- ----------------------------
DROP TABLE IF EXISTS `app01_city`;
CREATE TABLE `app01_city`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `count` int NOT NULL,
  `img` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app01_city
-- ----------------------------
INSERT INTO `app01_city` VALUES (1, '成都', 30000000, 'city/1657120322641.jpg');
INSERT INTO `app01_city` VALUES (2, '上海', 40000000, 'city/上海.jpg');
INSERT INTO `app01_city` VALUES (3, '北京', 35000000, 'city/北京.jpg');
INSERT INTO `app01_city` VALUES (5, '深圳', 65000000, 'city/u74.png');
INSERT INTO `app01_city` VALUES (6, '广州', 54000000, 'city/u36.png');

-- ----------------------------
-- Table structure for app01_department
-- ----------------------------
DROP TABLE IF EXISTS `app01_department`;
CREATE TABLE `app01_department`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app01_department
-- ----------------------------
INSERT INTO `app01_department` VALUES (1, 'IT部门');
INSERT INTO `app01_department` VALUES (2, '销售部');
INSERT INTO `app01_department` VALUES (3, '企划部');
INSERT INTO `app01_department` VALUES (4, '新媒体');
INSERT INTO `app01_department` VALUES (5, '秘书部');
INSERT INTO `app01_department` VALUES (6, '摸鱼部');
INSERT INTO `app01_department` VALUES (7, '运营部');
INSERT INTO `app01_department` VALUES (8, '后勤部');
INSERT INTO `app01_department` VALUES (9, '项目部');
INSERT INTO `app01_department` VALUES (15, '售后部');
INSERT INTO `app01_department` VALUES (16, '8:00起床');
INSERT INTO `app01_department` VALUES (17, '集合框架');
INSERT INTO `app01_department` VALUES (18, '10:00休息');
INSERT INTO `app01_department` VALUES (19, '10点半练习');
INSERT INTO `app01_department` VALUES (20, '12点吃饭');
INSERT INTO `app01_department` VALUES (21, '13:00午休');
INSERT INTO `app01_department` VALUES (22, '13点java编程');
INSERT INTO `app01_department` VALUES (23, '15点数据结构');
INSERT INTO `app01_department` VALUES (24, '18:00晚餐');
INSERT INTO `app01_department` VALUES (25, '面向对象');
INSERT INTO `app01_department` VALUES (26, '20点半娱乐');
INSERT INTO `app01_department` VALUES (27, '10点半睡觉');

-- ----------------------------
-- Table structure for app01_mymodel
-- ----------------------------
DROP TABLE IF EXISTS `app01_mymodel`;
CREATE TABLE `app01_mymodel`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `upload` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app01_mymodel
-- ----------------------------

-- ----------------------------
-- Table structure for app01_order
-- ----------------------------
DROP TABLE IF EXISTS `app01_order`;
CREATE TABLE `app01_order`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `oid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` int NOT NULL,
  `status` smallint NOT NULL,
  `admin_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `app01_order_admin_id_06590413_fk_app01_admin_id`(`admin_id`) USING BTREE,
  CONSTRAINT `app01_order_admin_id_06590413_fk_app01_admin_id` FOREIGN KEY (`admin_id`) REFERENCES `app01_admin` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app01_order
-- ----------------------------
INSERT INTO `app01_order` VALUES (1, '202208061323069785', 'afdffa', 20, 1, 1);
INSERT INTO `app01_order` VALUES (2, '202208061348032673', 'da', 50, 2, 1);
INSERT INTO `app01_order` VALUES (3, '202208061348539321', '企划部', 410, 1, 2);
INSERT INTO `app01_order` VALUES (4, '202208061353126146', '111', 20, 2, 2);
INSERT INTO `app01_order` VALUES (5, '202208061356179525', '222', 10, 2, 2);
INSERT INTO `app01_order` VALUES (6, '202208061410508581', '来一单', 123, 1, 2);
INSERT INTO `app01_order` VALUES (7, '202208061415488348', '饿了么', 20, 2, 2);
INSERT INTO `app01_order` VALUES (8, '202208061416051610', '美团', 30, 1, 2);
INSERT INTO `app01_order` VALUES (9, '202208061421093996', 'qqy', 50, 1, 2);
INSERT INTO `app01_order` VALUES (12, '202208102101524142', '自行车', 1000, 1, 2);
INSERT INTO `app01_order` VALUES (13, '202208102141034349', 'aFDaf', 80, 1, 2);
INSERT INTO `app01_order` VALUES (14, '202208102141142394', 'ppp', 41, 1, 2);
INSERT INTO `app01_order` VALUES (15, '202208102141237352', 'dadag', 40, 1, 2);
INSERT INTO `app01_order` VALUES (16, '202208102143353514', 'hahahjhhhhhhhhh', 11111111, 2, 2);
INSERT INTO `app01_order` VALUES (18, '202208102209231173', 'qqqqq', 22222222, 2, 2);
INSERT INTO `app01_order` VALUES (19, '202208102209374530', 'qqqqqqqd', 321, 1, 2);

-- ----------------------------
-- Table structure for app01_prettynum
-- ----------------------------
DROP TABLE IF EXISTS `app01_prettynum`;
CREATE TABLE `app01_prettynum`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` int NOT NULL,
  `level` smallint NOT NULL,
  `status` smallint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app01_prettynum
-- ----------------------------
INSERT INTO `app01_prettynum` VALUES (1, '13239039962', 101, 1, 1);
INSERT INTO `app01_prettynum` VALUES (2, '17695814045', 120, 3, 1);
INSERT INTO `app01_prettynum` VALUES (3, '11111111111', 400, 4, 1);
INSERT INTO `app01_prettynum` VALUES (6, '13333333333', 500, 4, 2);
INSERT INTO `app01_prettynum` VALUES (7, '14444444444', 400, 3, 2);
INSERT INTO `app01_prettynum` VALUES (8, '14444444446', 200, 3, 2);
INSERT INTO `app01_prettynum` VALUES (9, '14444444447', 200, 3, 2);
INSERT INTO `app01_prettynum` VALUES (10, '15555555555', 300, 3, 2);
INSERT INTO `app01_prettynum` VALUES (11, '15555555556', 100, 2, 2);
INSERT INTO `app01_prettynum` VALUES (12, '13555555555', 0, 1, 2);
INSERT INTO `app01_prettynum` VALUES (13, '17695814049', 0, 1, 2);
INSERT INTO `app01_prettynum` VALUES (14, '17695814048', 0, 1, 2);
INSERT INTO `app01_prettynum` VALUES (15, '13239039968', 0, 1, 2);
INSERT INTO `app01_prettynum` VALUES (16, '17695814041', 0, 1, 2);
INSERT INTO `app01_prettynum` VALUES (17, '13333333334', 0, 1, 2);
INSERT INTO `app01_prettynum` VALUES (18, '13338333333', 0, 1, 2);
INSERT INTO `app01_prettynum` VALUES (19, '13239038962', 0, 1, 2);
INSERT INTO `app01_prettynum` VALUES (20, '17695814015', 0, 1, 2);
INSERT INTO `app01_prettynum` VALUES (21, '17545466721', 0, 1, 2);
INSERT INTO `app01_prettynum` VALUES (23, '13343333333', 0, 1, 2);
INSERT INTO `app01_prettynum` VALUES (24, '13333333338', 20, 2, 1);

-- ----------------------------
-- Table structure for app01_task
-- ----------------------------
DROP TABLE IF EXISTS `app01_task`;
CREATE TABLE `app01_task`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `level` smallint NOT NULL,
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `detail` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `app01_task_user_id_93daa16a_fk_app01_admin_id`(`user_id`) USING BTREE,
  CONSTRAINT `app01_task_user_id_93daa16a_fk_app01_admin_id` FOREIGN KEY (`user_id`) REFERENCES `app01_admin` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app01_task
-- ----------------------------
INSERT INTO `app01_task` VALUES (1, 1, 'afdffa', 'dad', 1);
INSERT INTO `app01_task` VALUES (2, 2, '临时开会', '重要的事', 3);
INSERT INTO `app01_task` VALUES (3, 1, 'dada', 'adadad', 4);
INSERT INTO `app01_task` VALUES (4, 1, 'fafafa', 'dadaad', 2);
INSERT INTO `app01_task` VALUES (5, 1, 'fafFA', 'DADA', 2);

-- ----------------------------
-- Table structure for app01_userinfo
-- ----------------------------
DROP TABLE IF EXISTS `app01_userinfo`;
CREATE TABLE `app01_userinfo`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `age` int NOT NULL,
  `account` decimal(10, 2) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `gender` smallint NOT NULL,
  `depart_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app01_userinfo
-- ----------------------------
INSERT INTO `app01_userinfo` VALUES (1, '韩超', '666', 23, 100.68, '2020-01-11 00:00:00.000000', 2, 1);
INSERT INTO `app01_userinfo` VALUES (2, '刘东', '123', 23, 100.68, '2010-11-11 00:00:00.000000', 1, 5);
INSERT INTO `app01_userinfo` VALUES (4, '王二小', '123123', 21, 1999.00, '2011-11-12 00:00:00.000000', 1, 6);
INSERT INTO `app01_userinfo` VALUES (5, '武沛奇', '1564', 23, 10000.00, '2022-02-06 00:00:00.000000', 2, 5);
INSERT INTO `app01_userinfo` VALUES (7, '灰太狼', '123456', 22, 10000.00, '2022-08-14 00:00:00.000000', 1, 7);
INSERT INTO `app01_userinfo` VALUES (8, '小明', '2222', 23, 10.00, '2022-08-14 00:00:00.000000', 1, 2);
INSERT INTO `app01_userinfo` VALUES (9, '陈东', '111', 24, 10.00, '2022-08-20 00:00:00.000000', 1, 9);

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (25, 'Can add department', 7, 'add_department');
INSERT INTO `auth_permission` VALUES (26, 'Can change department', 7, 'change_department');
INSERT INTO `auth_permission` VALUES (27, 'Can delete department', 7, 'delete_department');
INSERT INTO `auth_permission` VALUES (28, 'Can view department', 7, 'view_department');
INSERT INTO `auth_permission` VALUES (29, 'Can add user info', 8, 'add_userinfo');
INSERT INTO `auth_permission` VALUES (30, 'Can change user info', 8, 'change_userinfo');
INSERT INTO `auth_permission` VALUES (31, 'Can delete user info', 8, 'delete_userinfo');
INSERT INTO `auth_permission` VALUES (32, 'Can view user info', 8, 'view_userinfo');
INSERT INTO `auth_permission` VALUES (33, 'Can add pretty num', 9, 'add_prettynum');
INSERT INTO `auth_permission` VALUES (34, 'Can change pretty num', 9, 'change_prettynum');
INSERT INTO `auth_permission` VALUES (35, 'Can delete pretty num', 9, 'delete_prettynum');
INSERT INTO `auth_permission` VALUES (36, 'Can view pretty num', 9, 'view_prettynum');
INSERT INTO `auth_permission` VALUES (37, 'Can add admin', 10, 'add_admin');
INSERT INTO `auth_permission` VALUES (38, 'Can change admin', 10, 'change_admin');
INSERT INTO `auth_permission` VALUES (39, 'Can delete admin', 10, 'delete_admin');
INSERT INTO `auth_permission` VALUES (40, 'Can view admin', 10, 'view_admin');
INSERT INTO `auth_permission` VALUES (41, 'Can add task', 11, 'add_task');
INSERT INTO `auth_permission` VALUES (42, 'Can change task', 11, 'change_task');
INSERT INTO `auth_permission` VALUES (43, 'Can delete task', 11, 'delete_task');
INSERT INTO `auth_permission` VALUES (44, 'Can view task', 11, 'view_task');
INSERT INTO `auth_permission` VALUES (45, 'Can add order', 12, 'add_order');
INSERT INTO `auth_permission` VALUES (46, 'Can change order', 12, 'change_order');
INSERT INTO `auth_permission` VALUES (47, 'Can delete order', 12, 'delete_order');
INSERT INTO `auth_permission` VALUES (48, 'Can view order', 12, 'view_order');
INSERT INTO `auth_permission` VALUES (49, 'Can add boss', 13, 'add_boss');
INSERT INTO `auth_permission` VALUES (50, 'Can change boss', 13, 'change_boss');
INSERT INTO `auth_permission` VALUES (51, 'Can delete boss', 13, 'delete_boss');
INSERT INTO `auth_permission` VALUES (52, 'Can view boss', 13, 'view_boss');
INSERT INTO `auth_permission` VALUES (53, 'Can add city', 14, 'add_city');
INSERT INTO `auth_permission` VALUES (54, 'Can change city', 14, 'change_city');
INSERT INTO `auth_permission` VALUES (55, 'Can delete city', 14, 'delete_city');
INSERT INTO `auth_permission` VALUES (56, 'Can view city', 14, 'view_city');
INSERT INTO `auth_permission` VALUES (57, 'Can add my model', 15, 'add_mymodel');
INSERT INTO `auth_permission` VALUES (58, 'Can change my model', 15, 'change_mymodel');
INSERT INTO `auth_permission` VALUES (59, 'Can delete my model', 15, 'delete_mymodel');
INSERT INTO `auth_permission` VALUES (60, 'Can view my model', 15, 'view_mymodel');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int NULL DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (10, 'app01', 'admin');
INSERT INTO `django_content_type` VALUES (13, 'app01', 'boss');
INSERT INTO `django_content_type` VALUES (14, 'app01', 'city');
INSERT INTO `django_content_type` VALUES (7, 'app01', 'department');
INSERT INTO `django_content_type` VALUES (15, 'app01', 'mymodel');
INSERT INTO `django_content_type` VALUES (12, 'app01', 'order');
INSERT INTO `django_content_type` VALUES (9, 'app01', 'prettynum');
INSERT INTO `django_content_type` VALUES (11, 'app01', 'task');
INSERT INTO `django_content_type` VALUES (8, 'app01', 'userinfo');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (24, 'contenttypes', '0001_initial', '2022-07-29 09:19:05.199835');
INSERT INTO `django_migrations` VALUES (25, 'auth', '0001_initial', '2022-07-29 09:19:05.203796');
INSERT INTO `django_migrations` VALUES (26, 'admin', '0001_initial', '2022-07-29 09:19:05.208803');
INSERT INTO `django_migrations` VALUES (27, 'admin', '0002_logentry_remove_auto_add', '2022-07-29 09:19:05.211774');
INSERT INTO `django_migrations` VALUES (28, 'admin', '0003_logentry_add_action_flag_choices', '2022-07-29 09:19:05.215788');
INSERT INTO `django_migrations` VALUES (29, 'app01', '0001_initial', '2022-07-29 09:19:05.219753');
INSERT INTO `django_migrations` VALUES (30, 'contenttypes', '0002_remove_content_type_name', '2022-07-29 09:19:05.223767');
INSERT INTO `django_migrations` VALUES (31, 'auth', '0002_alter_permission_name_max_length', '2022-07-29 09:19:05.226734');
INSERT INTO `django_migrations` VALUES (32, 'auth', '0003_alter_user_email_max_length', '2022-07-29 09:19:05.231721');
INSERT INTO `django_migrations` VALUES (33, 'auth', '0004_alter_user_username_opts', '2022-07-29 09:19:05.235711');
INSERT INTO `django_migrations` VALUES (34, 'auth', '0005_alter_user_last_login_null', '2022-07-29 09:19:05.239699');
INSERT INTO `django_migrations` VALUES (35, 'auth', '0006_require_contenttypes_0002', '2022-07-29 09:19:05.243715');
INSERT INTO `django_migrations` VALUES (36, 'auth', '0007_alter_validators_add_error_messages', '2022-07-29 09:19:05.247702');
INSERT INTO `django_migrations` VALUES (37, 'auth', '0008_alter_user_username_max_length', '2022-07-29 09:19:05.251668');
INSERT INTO `django_migrations` VALUES (38, 'auth', '0009_alter_user_last_name_max_length', '2022-07-29 09:19:05.255682');
INSERT INTO `django_migrations` VALUES (39, 'auth', '0010_alter_group_name_max_length', '2022-07-29 09:19:05.258648');
INSERT INTO `django_migrations` VALUES (40, 'auth', '0011_update_proxy_permissions', '2022-07-29 09:19:05.263649');
INSERT INTO `django_migrations` VALUES (41, 'sessions', '0001_initial', '2022-07-29 09:19:05.267625');
INSERT INTO `django_migrations` VALUES (42, 'app01', '0002_auto_20220804_2355', '2022-08-04 15:56:08.413219');
INSERT INTO `django_migrations` VALUES (43, 'app01', '0003_auto_20220811_1832', '2022-08-11 10:32:47.919957');
INSERT INTO `django_migrations` VALUES (44, 'app01', '0004_auto_20220812_1806', '2022-08-12 10:06:35.093168');
INSERT INTO `django_migrations` VALUES (45, 'app01', '0005_auto_20220928_1906', '2022-09-28 19:06:54.980770');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('03ub6x8f827do6bhxnykpa9e0oleysuz', 'Y2NmMWJkMmJiMzkyMTE5MjJmNjFjODRiYjgwY2E4ZGFiNDZkMGU3NDp7ImltYWdlX2NvZGUiOiJISk1NVyIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-09-17 19:50:32.281959');
INSERT INTO `django_session` VALUES ('05991879bvbp5zwhc24u50xpfmaj09es', 'OWUxYzJhYzQ1MzI0ZTg2ZTQwMGI4YjMxNDc0NzgzNjcwMzQyMWZiYTp7ImltYWdlX2NvZGUiOiJBR05GRyIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-08-11 04:44:13.378678');
INSERT INTO `django_session` VALUES ('07p4thku3dofv387p2ftcn1360c3coc1', 'MjZmZjYxMDZjZDRlODczNWNiMDRhZTU5MjdiOTk4NWUxMGQ3ZmUwZDp7ImltYWdlX2NvZGUiOiJLSUVFQSIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-08-12 11:04:27.539109');
INSERT INTO `django_session` VALUES ('08i0fls7kn0dxg98tdml3z7smxw0c99x', 'MTNjOGRhMDE2NDVjZWZkZTEzMTIyZTU2MmM5NjBhMWYwZjYwMDhmMTp7ImltYWdlX2NvZGUiOiJUQVlHSSIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-09-20 22:53:23.346340');
INSERT INTO `django_session` VALUES ('0eces7dzx9etg4zgmfpbsjxueh1n5a7i', 'MDUxNDc4NDExNjZlYjMwOTJmMzI5ZGMxNTFlMzQzMzNiMzczNGExMzp7ImltYWdlX2NvZGUiOiJaUE5CTSIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-08-05 12:50:59.635776');
INSERT INTO `django_session` VALUES ('0n03dh96zllpuvmvdh0ez822axb6ygt1', 'ZGIxZDg3ODUyNjNjY2EwNDdiNWFiNTU0OGJmMTQzMjhhMjU1MTdmNTp7ImltYWdlX2NvZGUiOiJJQVdXTyIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-09-17 19:45:47.029276');
INSERT INTO `django_session` VALUES ('1eteguwzjcysht82jz02vujprr0j4wft', 'MDE0MjgzODU5MGJiMjU3OTAyZmZmMzJmNTlmMTJkNDYwZWE1NWQ4ODp7ImltYWdlX2NvZGUiOiJNWk9XSyIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-09-20 22:40:27.239135');
INSERT INTO `django_session` VALUES ('2mh22gewc2jzsuipe44w6u0eoxtrwvmj', 'YTEwYjIzYzdlZWYxYzAzZmFhNjBkMWI3NWY5ZWYyOWQ2YTkxNjFlYjp7ImltYWdlX2NvZGUiOiJQVUJPSiIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-08-12 15:35:09.631508');
INSERT INTO `django_session` VALUES ('2u05ufqnlsg3el2m91bi9icpz3jnmsyp', 'ZWFmYTBkN2NhMzY3MTdkZWVlZWE1YmQ5ZGJhM2E1MDRiYjQ4MTM2Zjp7ImltYWdlX2NvZGUiOiJVWUxEVSIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-09-17 19:04:25.946208');
INSERT INTO `django_session` VALUES ('3e1dpmijyqll11czs9h9x4vq54kuoy0a', 'NWYyNTkwOWM1ZjgwNjMxZmZlM2NiMTM0NWRlZDU2NmZhYmQ1NmM0Nzp7ImltYWdlX2NvZWRlIjoiRVdWV00iLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ==', '2022-08-01 04:02:53.128206');
INSERT INTO `django_session` VALUES ('3nslk6pcbt1vd80rsilx8mcwqp3u8leb', 'YTc5ZWU3OTFhMGRlNDc4ZTllOGRhNmY3NDIxNmZjMzVmMmU1NzJmYjp7ImltYWdlX2NvZGUiOiJFR1NZWiIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-09-17 21:05:16.045091');
INSERT INTO `django_session` VALUES ('3srw9vwofj4tl8bb7n9hvl0pqtcj12u0', 'NDBjMzYyNTkyZjZkY2UzYTJmNWE0NzdhYTJkMzVhZDY5YThkYmEyZDp7ImltYWdlX2NvZGUiOiJMVkhKSyIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-09-20 22:52:54.082062');
INSERT INTO `django_session` VALUES ('40cqdvh49153909o74dxqh186nmf0h7o', 'OWJiMDY2NGI1Nzg1NzgwMTc5ZTViZjEzMTUzMmU2NDNkMzdhYmM2ZTp7ImltYWdlX2NvZGUiOiJNRkdFWSIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-09-13 22:04:11.112875');
INSERT INTO `django_session` VALUES ('47wlqyk8gd3y862yj61q9b5zwil33v86', 'YzI5OGI4ZmY0OGI0MWQ0MTBhZTEzMDYwZjM2NTdhYzNiYjhmY2FmMjp7ImltYWdlX2NvZGUiOiJQWUNTTCIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-08-12 12:12:04.534890');
INSERT INTO `django_session` VALUES ('4ab2jfaasiwtdgzhqph0fpgfcun822ie', 'ZTkzODBjYjczMGQ1NmJjZWM3MmUwMTc3YzY4MTVhMTA5YzVjNTRmMjp7ImltYWdlX2NvZGUiOiJQQU5ZSyIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-08-05 11:59:54.693323');
INSERT INTO `django_session` VALUES ('4kbvt8jomptcqvzl7iv8e9ybhwyqnlpf', 'YTFiZGQwNjhlYTA0MzIwYWIwMmQ4MzJiMjMyZGZmZTU4NDBiZTlmYTp7ImltYWdlX2NvZGUiOiJYQllLWSIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-09-20 23:05:25.244616');
INSERT INTO `django_session` VALUES ('4xwzckehuuzjhgtvjwxzriz11qvutzyo', 'ZTY2Y2M2MDY1M2M2MGYwZGMwOGM3Nzk5NzI2NWVmZGMzMzVjOWM1OTp7ImltYWdlX2NvZGUiOiJFUkxCUSIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-08-02 09:04:35.712499');
INSERT INTO `django_session` VALUES ('50o0ib1oq0ws9u1qo4bxoxyd2pur2l9h', 'MWY4NjBkYTZkOGIzYjBmYzdiNjA2OWUxYzZjOGI3MGJjNDNkM2ZkZjp7ImltYWdlX2NvZGUiOiJOQVNHRiIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-08-09 07:16:45.633526');
INSERT INTO `django_session` VALUES ('50zg1oreua9z1evrb1cj18m8qydht95d', 'NmFkNDIzMDVjMWEzMDQ1M2E4Mjk1N2YyZGVlOGRjOTE1ODU0NzFjMjp7ImltYWdlX2NvZGUiOiJBUlFRSSIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-08-02 09:11:57.765407');
INSERT INTO `django_session` VALUES ('53nozkgiac6lszla4a386gnv98v2fjq0', 'ZDhhYzgxOTIxZTQ0ODIxNzMwZTFkNzgzYjQ1MGE2ZWE3ZDNlZjc2Yjp7ImltYWdlX2NvZGUiOiJUSlFEVyIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-09-24 22:13:57.541746');
INSERT INTO `django_session` VALUES ('5ctm7j022858ndj6y9jtwy8sd2cfvpkk', 'OTg0MjIzZWI1N2E0Y2VhZmY0Yjg3ODI0ZDUyY2IwMWFjMDE3NTU0Mjp7ImltYWdlX2NvZGUiOiJVVlBFUSIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-08-05 12:03:46.275118');
INSERT INTO `django_session` VALUES ('5if34k03uf4f6chswg5tvvgba4rpds57', 'MzY0Yzg2MDRkMTRhYjQxNmUwMjlhNjU1ZWZhZGRmYzk0ZDA0ZGM0Yzp7ImltYWdlX2NvZWRlIjoiSk5HWlMiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ==', '2022-08-01 04:36:01.259450');
INSERT INTO `django_session` VALUES ('5scoesj17q5wk1bvsih09ahzs9uaque7', 'OWI4YjYxZjg4YzY2MDllMjRiNGUwNGZhMGM3NzQ3ZTc1YTUzMjM5Njp7ImltYWdlX2NvZGUiOiJDVFhFTiIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-09-20 13:29:00.688394');
INSERT INTO `django_session` VALUES ('65fdcrwcmipt7d46cqfn3ws21wo7pycm', 'NTk1NmFlNGE0ZDMwNjlkYzU5ZjFhYjBlMmQwNjIzZjU5NzUzYjA4Yjp7ImltYWdlX2NvZGUiOiJFRU5WRyIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-09-05 07:09:03.940126');
INSERT INTO `django_session` VALUES ('6jusukrba65htr27ipw5m0bynz8unvi4', 'ZTdjNTVjZjdkYTkyNWRmMTk0NzkxMzZhOWEzMTgwODRhYWY4N2FmNjp7ImltYWdlX2NvZGUiOiJDRUlYVSIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-08-12 15:45:21.003074');
INSERT INTO `django_session` VALUES ('6wx3r1a3x3e57pujshz5o5bu6d01x6mr', 'NmU4NzcxMDgxZmIyYzBmMjI5ZGI3MjVmZWQwN2JmNTE3ZjliYTc2MTp7ImltYWdlX2NvZGUiOiJaRldQTSIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-08-05 11:59:58.330593');
INSERT INTO `django_session` VALUES ('72vpti9rr0neqsc5bzpmtrz43pxrzyl8', 'MGMxZmI5MDMyNjg0MWQ4ZGJlNGE3OTQ0ZGVkNDA1ZTA1ZWIxYTUyMDp7ImltYWdlX2NvZGUiOiJKQktZRyIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-09-20 17:57:16.521611');
INSERT INTO `django_session` VALUES ('754x2tjh8qtu7afadvz0hsakg41shy8h', 'ZTI1YTlhNjEwMjA5OGFiZWFiODQxMGFhZTdjYjhjOWFjNzg2N2YwNjp7ImltYWdlX2NvZGUiOiJMRFlBSyIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-08-19 02:51:30.871297');
INSERT INTO `django_session` VALUES ('7b51kdvgxfflltqbyq751qutw7qqs5gm', 'ZmI3YTJmNDdiYzNhMjg2MjgxYzNlNDc4MDU5ZGQ4YTQzM2MwZjgyMzp7ImltYWdlX2NvZGUiOiJQWldRRCIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-09-05 06:37:53.028647');
INSERT INTO `django_session` VALUES ('7ft6h7dwtrr2bu6754yioqgr97z0dw7r', 'YTQyNjE1ZDIyMjdkYjU0ZWRjNGE0NGEyYjVhZWZkMmNhMmUwMTA4ODp7ImltYWdlX2NvZGUiOiJUSE5USCIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-08-05 12:16:26.429477');
INSERT INTO `django_session` VALUES ('7y5yjtkfqqbmxufg54icgjzu4xfur23e', 'OTUxNGE4YjU0YWVlOGVhZTVmZDZhN2I4ZTNhMTI4OGM1NTc4NDQzNDp7ImltYWdlX2NvZGUiOiJGQVhYUCIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-08-12 15:17:01.913591');
INSERT INTO `django_session` VALUES ('8d2jd3but07yvftankg9m6j1gyrw61nz', 'NjY2N2FhMTM4MmE5ODgyNmQzNTNiMTQwYjdhMjdhZjQ3Yjg2ZDk0Yjp7ImltYWdlX2NvZWRlIjoiRFpDWFciLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ==', '2022-08-01 04:22:08.602532');
INSERT INTO `django_session` VALUES ('9cqaj0ka1mzmympi8ri4ul8aa58x4fuh', 'NmIwYzFjZWQ1MmFjNDZjNzQ4M2MzM2FhNWJjMjZjNDc4MGE0YmE3MTp7ImltYWdlX2NvZGUiOiJCRldGWiIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-08-12 16:04:20.973537');
INSERT INTO `django_session` VALUES ('9djl831igni7ct3gsn5tcg6x6buxftws', 'YjMyYjI1ZWJjMDMwNmJiNzQzOTA1YTU1Yjg4NTFlNTBiYTAzMjRlMzp7ImltYWdlX2NvZGUiOiJCQVVOViIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-08-12 12:04:29.901415');
INSERT INTO `django_session` VALUES ('9hav1hskjlfp471p5g2ll8t5y9uraphc', 'ZTZmNzE0MTdkOGIzNjM1YWFhZDQ0ZWI1NDc2M2ZjZTgzZjA3ZjYxZDp7ImltYWdlX2NvZGUiOiJDQUtMVCIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-08-05 11:41:24.855972');
INSERT INTO `django_session` VALUES ('9idliomddknu2d8pikcur70461vrbm33', 'NDljYmU3NzVjNDk2YjcxODdjYmVkZjIzYjc0ZmU5ZTBkNWM0OTY0ZDp7ImltYWdlX2NvZGUiOiJPRE1CUCIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-09-20 15:01:24.779409');
INSERT INTO `django_session` VALUES ('9idopln6jkznhctwnjizsbg320dh9eto', 'N2M0MTNiZmEyMjRkOTZkODA0YTgwMWY5MTlhYjE0NDE3Mzg0MzdjMjp7ImltYWdlX2NvZGUiOiJHVk1KSSIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-09-17 19:11:59.010933');
INSERT INTO `django_session` VALUES ('a1ysag62uix1cbbez1cde3ahl3u7xdik', 'NzhlYWVmNzU2NDhlYWEwMGE1OWU5Zjc5YjU2MGFjMDZlMmFmZjRlNTp7ImltYWdlX2NvZGUiOiJQQllTTSIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-09-06 05:03:00.782373');
INSERT INTO `django_session` VALUES ('ar34zcialsfu2c6m0gxfu4hshdn3ll5n', 'M2QxMjg4MDc1ZDg3NGI3OTcyOWM4NGY0ODY0MDY4MWMxZWY3N2UyNDp7ImltYWdlX2NvZWRlIjoiUE9BRUgiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ==', '2022-08-01 04:18:45.876266');
INSERT INTO `django_session` VALUES ('bkr834yjx1jp8npgqpnlamjce00r9rd8', 'YzAxMWZlZjEzNmZjYjk3NmJlMTExYjk2NzQwOTU2OGZiY2ViZjAxNDp7ImltYWdlX2NvZGUiOiJNWFhZSiIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-09-19 17:43:59.154428');
INSERT INTO `django_session` VALUES ('bl64f8731nkggypa4m0sxefh7yz8samf', 'Y2FlZmEwYzY2MDgwNTc1MDliODk2OTk3N2I3ZGQwMGMwNWNkNjMxNzp7ImltYWdlX2NvZGUiOiJZTUdBSyIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-08-12 15:42:39.724300');
INSERT INTO `django_session` VALUES ('buih8cjdjexoyanrvt6yfxj0ayetl005', 'MjdlMzNmODlhODIxZGRiYWQ1ZDY1MTJkZDQ0MmFlNmM5OGQ0NGVkNzp7ImltYWdlX2NvZGUiOiJKQ1ZRQyIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-08-12 15:11:08.308997');
INSERT INTO `django_session` VALUES ('bv7y6gyc7a0v0d40hup4zq1ky00i0yqb', 'NTMxMTNhODBiYmQxYTlhMDI2MmQ5Mzg0YzRhN2ZiYTMzZWU3YzFkYzp7ImltYWdlX2NvZGUiOiJSVENaTCIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-09-13 21:40:42.750159');
INSERT INTO `django_session` VALUES ('c05u22e3002w2zv3uhsanbdi5xfcr4f2', 'MGVkYjYzZTBiZDM0M2RmMTI1OTZhZjZmM2RmMTg0MTVlZGIwNTFhOTp7ImltYWdlX2NvZGUiOiJZRkdGTiIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-09-20 23:06:42.521314');
INSERT INTO `django_session` VALUES ('c15w115jd2kpw8gqold2udj472wtxryn', 'NWQ4ZWQ4MGYyNGI0M2Q1MDM4NzlmNDRjZGFmMTg5ZWMxZmE1N2QxMDp7ImltYWdlX2NvZGUiOiJMWFNBSCIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-09-17 20:10:40.075382');
INSERT INTO `django_session` VALUES ('c403s2hvhfmk5p7y9b1e7jp6u5ssi3io', 'NTUxZWRhNGMzYjg2NzJmOGMzMDYwZGRlMzg1ZTUwOWMzYjhjODNlYzp7ImltYWdlX2NvZGUiOiJEQVhMTCIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-09-09 13:25:23.061363');
INSERT INTO `django_session` VALUES ('ca5ise3qqtr7dibtpf3cx3ip7bog1em2', 'MjM3MDA4NGI1NDVjYWU4ZGVmZGY5YmU3ODgwMmNkNTdhMWYwMGNhMzp7ImltYWdlX2NvZGUiOiJHQ0xaQyIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-08-04 15:46:56.135262');
INSERT INTO `django_session` VALUES ('ckup883j3nhukddb2jlf0yuvwsurvxfr', 'Y2MyOGUzNWZlMDNkYmQ2NjIzZTVjMWEwY2IxMTU3NmY0ZDFiYmFjMTp7ImltYWdlX2NvZGUiOiJWS1pYUiIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-09-05 06:37:53.100458');
INSERT INTO `django_session` VALUES ('cudsnz3qzc9yqc5p8dzdxh4u8wqobqgr', 'YWFhZDdlMGVmYTIyZjg5ZTJlMjNlZjJkNGM1NTNhZWNmZmIyMmRjZDp7ImltYWdlX2NvZGUiOiJPU1RXQSIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-08-12 15:45:25.663584');
INSERT INTO `django_session` VALUES ('d3xv8lnm0mnxv54cqanfc3a2mdaatwc6', 'Nzk2MDdiMzY3OGJiMTE1NWE3ZTFjMjk3MjZiYWZhN2M1Y2QzYmUzYjp7ImltYWdlX2NvZGUiOiJGU0NMTSIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-08-14 00:34:59.781954');
INSERT INTO `django_session` VALUES ('dmzfqpehmknqmrml70eauxpcr7wtwgi3', 'NmI1NjZkYjAxN2IzNzBiYjRhODhlNGQwZDI4ZmZjMzY0NDRjZDk1ODp7ImltYWdlX2NvZGUiOiJIRkZERSIsIl9zZXNzaW9uX2V4cGlyeSI6NjA0ODAwLCJpbmZvIjp7ImlkIjoyLCJuYW1lIjoicm9vdCJ9fQ==', '2022-09-03 07:05:21.388919');
INSERT INTO `django_session` VALUES ('dpa9e1us792siqm2931ruzhql4yoztr7', 'NTkwMTUzNjJkM2U5ZTZiZTI5NWU4NmU5OGNhMDUzZDVhZjM1Mjk2ODp7ImltYWdlX2NvZGUiOiJIUUNSTSIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-09-20 17:45:15.833635');
INSERT INTO `django_session` VALUES ('dxi6ql38naio37md0vg4kxwx0i0ed9bx', 'NGYyNzhlODUzMzVjNzM1YWQyZTk2NTJiMDQzNjVkOGMyZWUyYTE4MTp7ImltYWdlX2NvZGUiOiJUUUlERSIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-09-17 19:58:45.134838');
INSERT INTO `django_session` VALUES ('eqqotagyt3a1ukk5juzwi6dd1nvsyeeh', 'NTU4ZDFkMDViNjA3ZjFlZjk2YWJiZTVmYjBhNDA4YmY5MTg0OGI2ZTp7ImltYWdlX2NvZGUiOiJRRUdHQSIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-09-05 07:38:24.651980');
INSERT INTO `django_session` VALUES ('fzmrl6pjeycl92u7hxwhduj0ekimi6rt', 'ODUzZDcyNzM1N2RjZDlkMmJjNGU3YmRiNzNiYTA4NWQzODlmYjI5Mzp7ImltYWdlX2NvZWRlIjoiTUpIVkMiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ==', '2022-08-01 04:26:58.083456');
INSERT INTO `django_session` VALUES ('h291ghvqm7tu0m3csxz0l3eho3gw9csc', 'ZjM4NTgwMjViODVjYWM5NGMwNjI0MzQ2YzVkMjg5MjkyNTRmNzRkZjp7ImltYWdlX2NvZGUiOiJHRlVaUCIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-08-12 09:41:39.076590');
INSERT INTO `django_session` VALUES ('hmlrl7rdfawq64p6twb4hqeeayns5nf2', 'OTJlMzVkMGZkMzhmMWMxOWY4NDc1YWE3YTYwYmY1MjNiZWVlMTUxZDp7ImltYWdlX2NvZGUiOiJXRFRZTiIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-08-05 11:46:31.160764');
INSERT INTO `django_session` VALUES ('hn1x29z9rsoy8uasfb9skm735wp8nrv3', 'MmFlNThkNTg2NWFlNWU3ZDMyYjg2ZWFhM2U1OTRkODM4NGY4NTAzOTp7ImltYWdlX2NvZGUiOiJZRkZBQSIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-09-17 19:20:02.030140');
INSERT INTO `django_session` VALUES ('iigpph1xnmsyjolsnf81kvowdxsec3g0', 'NGQ5MDEzODE1ODhmZDZmNzkwOWE2MDNmMDNlY2EzNDdjMTM3NmUyMzp7ImltYWdlX2NvZWRlIjoiRUZXWFMiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ==', '2022-08-01 04:25:16.474396');
INSERT INTO `django_session` VALUES ('ijde8mfyof6611ou08qedeajd1okq7nb', 'Y2UxMzVlMjlkM2Q2MWY2NzY1YjQ5YjBkMzc0ZjYyZjcxMzExMTQ0MTp7ImltYWdlX2NvZGUiOiJDVUlaWiIsIl9zZXNzaW9uX2V4cGlyeSI6NjA0ODAwLCJpbmZvIjp7ImlkIjoxLCJuYW1lIjoieXV6eCJ9fQ==', '2022-10-20 19:15:15.490017');
INSERT INTO `django_session` VALUES ('irf3b1naym1cge10jlv110p6bfk0757x', 'MDNhY2RhNTRiNjExMzVjODE1ZTVhY2QyZDk2YjIyYjgxODA0MWM3ZDp7ImltYWdlX2NvZGUiOiJCUFpHVSIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-09-20 17:13:25.797688');
INSERT INTO `django_session` VALUES ('j2juv4rdgka92h0txb05j7rfz3pw811c', 'ZmVmNmRjNGNmYTY2NmI4ODM4MDAzMDhhMzAyZjY2OTllZDE3YWJhYjp7ImltYWdlX2NvZGUiOiJVVFJQQyIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-09-05 07:07:50.735745');
INSERT INTO `django_session` VALUES ('khfn9uz4ua8yhij2ddgncubvx90dsqef', 'MTQxZjAxMTFjM2U5MTEwZDM0Y2RlZDFkMGZmMGNjNTdmYWMxNGJhMTp7ImltYWdlX2NvZGUiOiJKV1JVWCIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-08-05 12:05:21.188330');
INSERT INTO `django_session` VALUES ('ksi21yrt6yfhxp7uhmcvp0u98eo16shr', 'MWYwMWY4NzViN2U1NzQ5NTJlNGUyZjIwMjZmYTY5NDZhNGViZmMwMzp7ImltYWdlX2NvZGUiOiJCUlVNSiIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-09-20 13:29:08.903289');
INSERT INTO `django_session` VALUES ('kzparuikiroqp3z0lg70800552duojpm', 'NWI4MjI4MTE0MzMzOWQ2OWQ5ZjdkZTI5YzA3MDY5NDYyZWUzZTRmZDp7ImltYWdlX2NvZGUiOiJJUVlFWSIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-08-12 15:42:36.647404');
INSERT INTO `django_session` VALUES ('l6tfqdirxqg63aj0quk4hvew5yk55bs7', 'NjcxODFjYzYwZjMxMDg0Y2Y4MDI5NDA5MmJmYTAxOWUyNDg4MzQ4MTp7ImltYWdlX2NvZGUiOiJCWEROWiIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-08-12 12:02:50.627505');
INSERT INTO `django_session` VALUES ('lnuys7p7v6owe7k150cygj1mfcjhco0q', 'N2VmZjNmZDRkMTZhZmU5NmFlNzI4YmQ2ZTg5ODk2OTk0MTI0NzA3YTp7ImltYWdlX2NvZGUiOiJMWkhVTSIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-08-05 11:36:03.737361');
INSERT INTO `django_session` VALUES ('m958vizk6y670w8vi919ko73n6cqhwvq', 'NTFhOGE2MTg3MDVkMTI0YjdmZmMyYmIxNjI1NTNjYjdkODViODMzNjp7ImltYWdlX2NvZGUiOiJCVlVXRCIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-08-10 11:48:22.110176');
INSERT INTO `django_session` VALUES ('mr7fnno5np8h0yc7f7uauu41a440jjcv', 'NTM5ODk1MWZkNDlhN2ZmMzAyYTNiN2MzOWM5NzhlMzBjOTg3OWY1MTp7ImltYWdlX2NvZGUiOiJWVE5GUyIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-08-11 05:55:10.691166');
INSERT INTO `django_session` VALUES ('mw2ohqja0qs6xc8e14egm0n306f660qr', 'ODJiY2E5Y2IzMWU0MjRmZjI1OWEwYjg2YWQ4OWY4MmFhZWUyM2E4YTp7ImltYWdlX2NvZGUiOiJOSU5YVyIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-09-20 23:00:40.966443');
INSERT INTO `django_session` VALUES ('mzkga783nfc44g3uzuw7tpwflikm0ld5', 'NDE5Y2RiNDkzODk0ODU5NWI4MDJmZTU2OWNiY2VkYjU0MGNmMGFlOTp7ImltYWdlX2NvZGUiOiJBUFlXQyIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-08-05 11:15:05.939784');
INSERT INTO `django_session` VALUES ('nfr3tld9r7ncd8mjctdrp45ku8pv9i4r', 'Nzk4N2YzNDBhNzdmOWQ1MzU1YTEwZTNiNTY4NDk5NzZjYTMyMDRiMzp7ImltYWdlX2NvZGUiOiJUS1lXRCIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-08-12 15:08:37.280480');
INSERT INTO `django_session` VALUES ('nqzjo4v18a2hasptx6fafma5cjkju0wd', 'NWEyMjE5OWJiYWE1NjQ1ODkzMTU4MDA1M2Y3ZGNiMzQ4N2MwMDkzZTp7ImltYWdlX2NvZGUiOiJXVVJFSCIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-08-01 14:24:06.966474');
INSERT INTO `django_session` VALUES ('nydjunknx64pn8pd1gs12sn3unwrm5mv', 'ZDNjMDdiYzJkOGI0MDEwMDIzNjM0ODkzNzBmNjE2ZDZiMzdlM2NhZTp7ImltYWdlX2NvZGUiOiJBTlNWRiIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-09-20 18:00:03.667789');
INSERT INTO `django_session` VALUES ('o32la4pnctg5luyc61jxq0xpqc26tg9u', 'NzMzNjgzYjFkNzhiNTVmMGM3ZTkyZWVlNTM3ZWNjNGZmNjcxY2ZjYjp7ImltYWdlX2NvZGUiOiJQVU1HRyIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-08-12 12:13:22.275688');
INSERT INTO `django_session` VALUES ('o52dpgjvd7bj2nbhvp2irfml23muzj13', 'NzljNzljY2MxNTExMWM3YThlYmI1YTI3YzhiZWU0ZjBiM2NkYjBhYjp7ImltYWdlX2NvZGUiOiJRRlJUQSIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-09-20 18:27:15.495012');
INSERT INTO `django_session` VALUES ('o67fxxgo48k3s6mug4m6fbbp5yaqoebv', 'NDBjNDZiZDBjYTMyNmQ5NGYzNWI3ZGQxODc5MzVmOWU5OThiYTUwNjp7ImltYWdlX2NvZGUiOiJBTllMSSIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-08-04 16:03:23.986281');
INSERT INTO `django_session` VALUES ('o8itttn0hejld0pezlri4hqzmunawc81', 'NzEzYzAwZjkyMDVmYzkwYWJmNmU4YmQxODA4NGMyYmMyNWIzZWZhMDp7ImltYWdlX2NvZGUiOiJXSVFMSyIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-08-05 11:12:43.582889');
INSERT INTO `django_session` VALUES ('oa9h4ecjmz136j58fs5w8bkfpn2kpgnk', 'NGVmYzJhYjFhNDViMzkxYmMxZDM0ZTVhZDAwN2IzYmVlZjFmZGJlZDp7ImltYWdlX2NvZGUiOiJCQVdKQiIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-09-17 20:03:16.032436');
INSERT INTO `django_session` VALUES ('obkgpe260a0bn5poy78z122udn41t28m', 'NWJiZWIxM2ZmZTA1MTc1NDM3YzgwYzU0NmY4ZTE0YWE3YzAxNDA4Yzp7ImltYWdlX2NvZGUiOiJSTFNTTyIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-09-17 19:43:14.982347');
INSERT INTO `django_session` VALUES ('ophxyqtn8cli4yqp74w1jliaqhwzc9mp', 'YWRjYWE1N2FiMmRhMTM4NWNlMTdhNjZmM2Y0MjRiYmY4YWEyMDUzZjp7ImltYWdlX2NvZGUiOiJLRk9FTyIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-08-10 12:39:20.464030');
INSERT INTO `django_session` VALUES ('or41vd4epzw0isa2mxvzcd55r0sbkf9i', 'MDRkMTVlMzhjODcwNjNkOTg4MjliYzM4ZGI5NWIzMGQzMjc1YzZhYjp7ImltYWdlX2NvZGUiOiJPREtFVyIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-08-12 11:53:41.750418');
INSERT INTO `django_session` VALUES ('owhfjjsay2hjinyyi1c64gryge531d1e', 'Zjg2YzI4YjA3NDZmOWFiM2VhMWM2YzY0MDNhMjI3MjJkY2M2OGJlMzp7ImltYWdlX2NvZGUiOiJVRlZORCIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-09-17 19:56:12.941778');
INSERT INTO `django_session` VALUES ('p1kshxtua1trem9f2kusbovd5edvn2zd', 'NjIyODJmMzk2MDFiMmM2YjMzMDYwN2M5OTdmMmZhM2RmOTAyM2E5MDp7ImltYWdlX2NvZGUiOiJDQVFRRCIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-08-06 05:48:38.248501');
INSERT INTO `django_session` VALUES ('p1vt0g6e62p4czm8zuc39iej53m3uskz', 'MGJkNDNhYzhkYmY3N2MzMWJjYzhlOTQzZjEwNzAyZTEwMjljOWJmNzp7ImltYWdlX2NvZGUiOiJURUFTTiIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-08-08 09:10:52.381703');
INSERT INTO `django_session` VALUES ('pa4vr6ys9t9l3bpk0ykz0uhp9ex36pxf', 'MmNhOTQ0ZjgzODAxZDdhMzlhNDM5ZDExNThmNTM3MDUzZTE1NzNkMzp7ImltYWdlX2NvZGUiOiJLQU9LTyIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-08-12 15:40:32.927546');
INSERT INTO `django_session` VALUES ('pi1idvugfckjpe08f5gs1pyku9aurci9', 'YzExZjI4MzZlMTk4NjBjYmEzYzA0NDJjMDEyZmM3MmQ1ZDIwNzAxODp7ImltYWdlX2NvZGUiOiJGT1REUiIsIl9zZXNzaW9uX2V4cGlyeSI6NjAsImluZm8iOnsiaWQiOjEsIm5hbWUiOiJ5dXp4In19', '2022-08-12 15:26:03.716927');
INSERT INTO `django_session` VALUES ('piv5ha6nkcjowizyn2lqtrlej4uez99z', 'NDNjZDZhNjQwNWE0MTFiYzg4YzU4YzI3ZTc0ZmI4MDc2NDc5ODRiMDp7ImltYWdlX2NvZGUiOiJBRkdYSSIsIl9zZXNzaW9uX2V4cGlyeSI6NjA0ODAwLCJpbmZvIjp7ImlkIjoyLCJuYW1lIjoicm9vdCJ9fQ==', '2022-08-23 08:41:44.603497');
INSERT INTO `django_session` VALUES ('puz2l5k9yuy61vn5ttommqae7c9cbhvi', 'MTU0OGZmZTYyNzliYzk5MGI4MDllOGU5YTVlOWQ1MDI2MGZjZGM2Njp7ImltYWdlX2NvZGUiOiJWQVFDUiIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-08-06 05:13:56.731400');
INSERT INTO `django_session` VALUES ('q39zoiuqweug9d0rx3uzduxin6a8mez7', 'YmM0YWY0ODNmMmY4MmI4MjcwYzM4YzUxNDhhZjM2ZDVlYzQwNWRiOTp7ImltYWdlX2NvZGUiOiJSTEZMTyIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-09-20 18:31:09.317006');
INSERT INTO `django_session` VALUES ('qksn8yc76iz713lyqewntm8vqyrvyvqa', 'ZWY1NjkwNmE4YmY0ZWIwNmIwMWQyMzgyYmQ4Y2M1MmEzZjFhMGM2ZDp7ImltYWdlX2NvZGUiOiJNTUlWRSIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-09-02 15:04:48.547588');
INSERT INTO `django_session` VALUES ('qo9yjlkb03r5810ch5kgnz099f1pagcj', 'YTY1MDZjZjhiNzgzNGExNTg3Nzk4MTQ0ZjI3MzQwMDY3ODJmYTMxZDp7ImltYWdlX2NvZGUiOiJCUFhITCIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-09-20 18:10:28.899496');
INSERT INTO `django_session` VALUES ('r0zthwyu3byqw3n0bf10carwc18d4zri', 'ZjY1Nzc0ZDQ4N2JhN2M2NmE4NzBmM2ZjYWIxMjBlZWZkOTE4OGJmMTp7ImltYWdlX2NvZGUiOiJTV1ZPTiIsIl9zZXNzaW9uX2V4cGlyeSI6NjAsImluZm8iOnsiaWQiOjEsIm5hbWUiOiJ5dXp4In19', '2022-09-20 22:43:06.761359');
INSERT INTO `django_session` VALUES ('rnmp883uofxova23dd0oeickeevy29co', 'NTBlMGExN2U5NjVjMzcyOWY4YTMzMjQ5YzdmOWI4OTMyOWE5MGFkMzp7ImltYWdlX2NvZGUiOiJXV0tKUiIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-09-05 07:33:30.544954');
INSERT INTO `django_session` VALUES ('rptpb0ojfhel7xor3wvn6e4azh8ym4ga', 'NDc2MmQwZDc3Y2QwNzAyNmFhMDg1YWRjNDI5M2ViNWE0ZTM4MzYxODp7ImltYWdlX2NvZGUiOiJLTkpSWSIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-09-20 18:02:22.783481');
INSERT INTO `django_session` VALUES ('rufbgzcusdjnp6hn8ifiptnr6kv912as', 'NDFkNmJlN2I2YzFlYjYyZTg2MDY0NGNlYTlkZTM4MWJhMzJjMGYwZTp7ImltYWdlX2NvZGUiOiJTV0NJTyIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-09-11 19:24:41.446383');
INSERT INTO `django_session` VALUES ('s72ughccjf2sgyyj59oktcgo36tehac5', 'MzU2ZDhmMzYzYmYyYjRmM2NmOGFmZDE4OTliZTIxMWNlYzZlMjMwYTp7ImltYWdlX2NvZGUiOiJXSkZBViIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-09-20 17:40:40.504885');
INSERT INTO `django_session` VALUES ('sgwvgbb72avxmyn2ddeayylomy1gxx6y', 'ZDFlNDdhMjIyODUyY2UxMTI5NjNhNWM1NWRjZWFlOTg3MzdhM2I4Nzp7ImltYWdlX2NvZGUiOiJOVUFGSCIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-09-20 18:27:14.820813');
INSERT INTO `django_session` VALUES ('sj567yu4vj7b2x3erulgxwtfzowtyru8', 'YWIwNTI5MjcyNjY2ODMwN2JlNDljNmMyZTg0NjdlY2VjNDVjNDU4Nzp7ImltYWdlX2NvZGUiOiJUQkhPVCIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-08-05 12:16:05.650366');
INSERT INTO `django_session` VALUES ('sk6cx1nzcbc2be6bnmwupjtispjoc1a4', 'MWNkMjUzN2JlYWI0YzljNzk3NGU1N2M2NGM0MmMyODJhZTQ3OTY1NDp7ImltYWdlX2NvZGUiOiJUQlZOUyIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-08-11 05:55:06.462472');
INSERT INTO `django_session` VALUES ('t0cpt6jblyqjqihbq00qk6v7styxczj6', 'NDAyODQxNTUwMGZlZTBjZjNmODJmMGY3ODFmYTY1NGQ4NGYyNDczODp7ImltYWdlX2NvZGUiOiJDRkVSSiIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-09-17 19:02:01.994072');
INSERT INTO `django_session` VALUES ('t88cn3syo49b9lvxbdx44kl08ypfgbz4', 'MzllNmYyMDQ4OTRjZDMyNzhkNmVmM2FmYTRhNGRlNzdmY2Y3YzYxOTp7ImltYWdlX2NvZGUiOiJTVUZIVCIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-08-12 15:22:47.201440');
INSERT INTO `django_session` VALUES ('tbvhlay87gak46m8jym2o943q5x1bwfq', 'NWU2ZmUzNjE5ODE2MmY1NzRhMTU1ZDU5ODQyNzg4ZDNjOWMzZmFhZjp7ImltYWdlX2NvZGUiOiJZR0ZCUyIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-09-24 22:12:13.313979');
INSERT INTO `django_session` VALUES ('tfl09zwj22xz98xyb0q27xs717edo03f', 'NWNhZDYyZTg1ZDhkMjQ2MTE3MGRhMWM0YzRmMmU2YTU4ZTNhMGYyYjp7ImltYWdlX2NvZGUiOiJLQUdZSSIsIl9zZXNzaW9uX2V4cGlyeSI6NjA0ODAwLCJpbmZvIjp7ImlkIjoxLCJuYW1lIjoieXV6eCJ9fQ==', '2022-09-27 23:07:05.637683');
INSERT INTO `django_session` VALUES ('tx5n32ojxi5r68fnyx2upwpf1ha5nsb2', 'MTc5YjRiNWIzMGExYWQ3MWRhOTM3NmExYzU3Mzg0NjQ0YWRlMGJjMjp7ImltYWdlX2NvZGUiOiJTVFVCTSIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-08-05 11:56:58.369789');
INSERT INTO `django_session` VALUES ('uchkwnavmw82guvbbl3ytxsjw6885cow', 'ZDlkNTMxZGFmNzhhOGY4NWEwYzY2MTNmOWUxNGI1YjZjM2ZhMzQ0ODp7ImltYWdlX2NvZGUiOiJOS0ZPRiIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-09-17 19:28:50.197435');
INSERT INTO `django_session` VALUES ('ufchgwn25kq1zdj3us1qjtijizt7vpre', 'NjJlNWJjYThlYWFlYWZkOWJkNzJhMTQ1ZTlmMjVhNmIxNDgyZGMxYTp7ImltYWdlX2NvZGUiOiJIVEFKWiIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-08-12 15:37:37.072434');
INSERT INTO `django_session` VALUES ('uhx476owzkfgsz8db6kzsmcr524duqwd', 'MWI4YjY1ZDFhZWE4NTgxZjZmYzFlMzUzY2Y5ZGNkMzE3NDVkN2ZkZjp7ImltYWdlX2NvZGUiOiJSUktITCIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-08-02 08:48:12.738076');
INSERT INTO `django_session` VALUES ('ulz9gdhcn7cwitw8zcd3zx4scbhgbz3z', 'YmMzMzlkNjc5NDQwZTFlNWM5OTY1MTllNzIzMzM2MjZiYThhOGZlMzp7ImltYWdlX2NvZGUiOiJPT1RRWSIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-09-17 19:52:38.411972');
INSERT INTO `django_session` VALUES ('ups1gsigmsprnar0eg25tg83jq2918kh', 'NjY0NDViOTE4MWVjOTI3ZWMzNWE4MjY0NTQ0NDY4MmM2MGRjZjg3Njp7ImltYWdlX2NvZGUiOiJEQ0RHUSIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-09-14 11:32:49.323533');
INSERT INTO `django_session` VALUES ('v4g0egdrur6whchqu6ijba95apm1ajqd', 'NDVlNGVjODk1OThjOGVlOTM1YTFhNDViNGQyMTE0MDk4ODJjNjVjNjp7ImltYWdlX2NvZGUiOiJWUVZKSSIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-08-11 05:05:50.901936');
INSERT INTO `django_session` VALUES ('vbt98y3vfqr87v8ueqa8wayfvt28vseq', 'N2Q2ZWNiZjM4OTUzYzc4Y2FkMjg0MDNjYzg5OGI2OTk4YWNkMjNjMDp7ImltYWdlX2NvZGUiOiJTUUNMRSIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-08-27 07:04:52.322892');
INSERT INTO `django_session` VALUES ('vgbsllt54b9tnawrk7cmoynmlrd0l051', 'Y2NiZDU5ZTU1NmMyMDBmYzIwN2JmNjNkMTkyMzAyYjc5OGM3NjdkZTp7ImltYWdlX2NvZWRlIjoiVVFCQlgiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ==', '2022-08-01 04:21:30.092931');
INSERT INTO `django_session` VALUES ('vic3wclj6omtuuk576yfwc115zfye5uh', 'OGYxMGE0NzQ1ODQwYjdiODYxY2Q0M2Q1MDMzMzZiMTlhMjQ2MTZiOTp7ImltYWdlX2NvZGUiOiJRQ1ZWVyIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-08-05 11:28:26.826786');
INSERT INTO `django_session` VALUES ('voaagxpqzu3uts01l8mzkd0id61ksbeg', 'ZTE4MzNjOGJlZTM4YzFhYzAxMTc3NmJiZDFhZmM4MjI3OWVjMzE4ODp7ImltYWdlX2NvZGUiOiJZRERPVCIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-09-20 17:13:15.048133');
INSERT INTO `django_session` VALUES ('vzimuxirc0c528oomh0ja9u0cp54ujkw', 'YzBlNTRkZTU0YmIzOWI1YmU1OGEwOTkzNTZhMTNhOGQzYTlkNDUyMTp7ImltYWdlX2NvZGUiOiJHS0VRRyIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-08-01 04:37:29.226020');
INSERT INTO `django_session` VALUES ('w2n6andaho47d6hl6265x8kvetfckcw0', 'NTUxNjY5MGM0OWZkOTg2MGQyNTE2ZDBiYTYzNzkxNGNjZGQ4ZDg0ODp7ImltYWdlX2NvZGUiOiJEU0RLVSIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-08-12 12:45:21.549294');
INSERT INTO `django_session` VALUES ('w577ape7quydjowlur6gw4hc9fqih2kp', 'YmNjMzZmNmRlNGM3YzBhYmYxOGNjMDhlNzQ0Y2RlNjc0MzhlYmU1NDp7ImltYWdlX2NvZGUiOiJHUFVWViIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-09-20 22:59:48.243700');
INSERT INTO `django_session` VALUES ('wvyn1sq7dfyo6s1inysx2120apfr7py0', 'NmIzY2E2ZmQxYmZlMjQ3Nzg1YWE5MGUzYmNlNDFjNDdmZDQ2MzFlMTp7ImltYWdlX2NvZGUiOiJMRFRFTCIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-09-20 18:34:28.744597');
INSERT INTO `django_session` VALUES ('yh9rdyquhbyzbd9jtx9lwko2zhtsiaxj', 'OThlMzc4OTQyNjMzZDAwNjgzM2E1YmQyN2NmNDY1MDI0NTQzNTdkZTp7ImltYWdlX2NvZWRlIjoiVUxCVkoiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ==', '2022-08-01 04:24:07.377300');
INSERT INTO `django_session` VALUES ('yr04qsbriquqhg2yx6etul6fyp7pqc09', 'MmQ0YzI1ZTQ2MjI2MDQxMGFiZmJiOGE1NDljZjEwYjNlOTA5MGE3NTp7ImltYWdlX2NvZGUiOiJBWERFVyIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-08-20 13:46:33.724034');
INSERT INTO `django_session` VALUES ('yu378kkksu8qx23kw2ywjrid5vjivigf', 'YzdiYjU3YzM1NmFkN2M3ODFjMjhkNjg0NzhiYjQ3NmE4ZDFmZDg2Zjp7ImltYWdlX2NvZGUiOiJDRUZSTSIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-09-17 19:02:13.798248');
INSERT INTO `django_session` VALUES ('z9mcyda72s7sa91u0rb426xskcvjzalf', 'NDM5ZTk5ZmY1NjdlMDUzNzU1YTUyMjU2YjEyYTBmNzA5YWVlODk0MDp7ImltYWdlX2NvZGUiOiJCU0FPQiIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-08-12 12:01:35.493333');
INSERT INTO `django_session` VALUES ('zh5ldh5d6v7npldzk0iuwoy8l9q3pvbb', 'NTRhMTFmMWJmMWJhN2NlYWNjYjFhM2M0MDNiZTYzN2U5ODhhZWY0Njp7ImltYWdlX2NvZGUiOiJDUVJHTSIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-08-12 15:06:11.475260');
INSERT INTO `django_session` VALUES ('zizsyt4shyl1af84ak700xyjuphvn8kn', 'NzgzMWJkNTZkNzY1ZjcwMzdmOWJlNWUzNjEzZTg2YjQwOGViNTI5ODp7ImltYWdlX2NvZGUiOiJKS0NCRCIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2022-08-12 12:22:26.685339');

SET FOREIGN_KEY_CHECKS = 1;
