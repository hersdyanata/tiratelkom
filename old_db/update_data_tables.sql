/*
 Navicat Premium Data Transfer

 Source Server         : localhost_73
 Source Server Type    : MySQL
 Source Server Version : 100140
 Source Host           : localhost:3306
 Source Schema         : tira

 Target Server Type    : MySQL
 Target Server Version : 100140
 File Encoding         : 65001

 Date: 06/10/2021 00:19:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dev_mapping_permission_ke_menu
-- ----------------------------
DROP TABLE IF EXISTS `dev_mapping_permission_ke_menu`;
CREATE TABLE `dev_mapping_permission_ke_menu`  (
  `map_menu_id` int(11) NULL DEFAULT NULL,
  `map_perm_nama` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of dev_mapping_permission_ke_menu
-- ----------------------------
INSERT INTO `dev_mapping_permission_ke_menu` VALUES (1, 'create');
INSERT INTO `dev_mapping_permission_ke_menu` VALUES (1, 'update');
INSERT INTO `dev_mapping_permission_ke_menu` VALUES (1, 'delete');
INSERT INTO `dev_mapping_permission_ke_menu` VALUES (2, 'create');
INSERT INTO `dev_mapping_permission_ke_menu` VALUES (2, 'update');
INSERT INTO `dev_mapping_permission_ke_menu` VALUES (2, 'delete');
INSERT INTO `dev_mapping_permission_ke_menu` VALUES (12, 'create');
INSERT INTO `dev_mapping_permission_ke_menu` VALUES (12, 'update');
INSERT INTO `dev_mapping_permission_ke_menu` VALUES (12, 'delete');
INSERT INTO `dev_mapping_permission_ke_menu` VALUES (12, 'close');
INSERT INTO `dev_mapping_permission_ke_menu` VALUES (17, 'create');
INSERT INTO `dev_mapping_permission_ke_menu` VALUES (17, 'update');
INSERT INTO `dev_mapping_permission_ke_menu` VALUES (17, 'delete');
INSERT INTO `dev_mapping_permission_ke_menu` VALUES (17, 'close');

-- ----------------------------
-- Table structure for dev_menu
-- ----------------------------
DROP TABLE IF EXISTS `dev_menu`;
CREATE TABLE `dev_menu`  (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_div_id` int(11) NULL DEFAULT NULL,
  `menu_parent_id` int(11) NULL DEFAULT NULL,
  `menu_nama_ina` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `menu_nama_eng` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `menu_controller` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `menu_route_name` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `menu_folder_view` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `menu_icon` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `menu_level` int(11) NULL DEFAULT NULL,
  `menu_publish_ke_user` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `menu_order` int(11) NULL DEFAULT NULL,
  `menu_createdat` datetime(0) NULL DEFAULT NULL,
  `menu_createdby` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`menu_id`) USING BTREE,
  UNIQUE INDEX `index_dev_menu`(`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of dev_menu
-- ----------------------------
INSERT INTO `dev_menu` VALUES (1, 1, NULL, 'Group Pengguna', 'User Group', 'UsergroupController', 'usergroup', 'usergroup', 'icon-users', 1, 'Y', 1, '2021-03-17 15:37:37', '1');
INSERT INTO `dev_menu` VALUES (2, 1, NULL, 'Pengguna', 'Users', 'UserController', 'user', 'user', 'icon-users4', 1, 'Y', 1, '2021-03-17 15:42:56', '1');
INSERT INTO `dev_menu` VALUES (12, 3, NULL, 'Dashboard', 'Dashboard', 'DashboardController', 'dashboard', 'dashboard', 'icon-home8', 1, 'Y', 1, '2021-09-18 22:56:51', '1');
INSERT INTO `dev_menu` VALUES (17, 3, NULL, 'Create MoM', 'Create MoM', 'MomController', 'mom', 'mom', 'icon-file-plus', 1, 'Y', 2, '2021-09-18 22:56:51', '1');

-- ----------------------------
-- Table structure for dev_permissions
-- ----------------------------
DROP TABLE IF EXISTS `dev_permissions`;
CREATE TABLE `dev_permissions`  (
  `perm_nama` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT 'permission read tidak masuk kedalam list ini, karena asumsinya ketika menu_id ada di dalam table usergroup maka dia sudah bisa masuk kedalam menu tersebut',
  `perm_type` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT 'type ini bisa saja button, chart, table, atau yang lainnya',
  `perm_deskripsi` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  INDEX `perm_nama`(`perm_nama`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of dev_permissions
-- ----------------------------
INSERT INTO `dev_permissions` VALUES ('create', 'btn', 'Membuat data baru');
INSERT INTO `dev_permissions` VALUES ('update', 'btn', 'Mengubah data');
INSERT INTO `dev_permissions` VALUES ('delete', 'btn', 'Menghapus data');
INSERT INTO `dev_permissions` VALUES ('close', 'btn', 'Close Mom');

-- ----------------------------
-- Table structure for usergroup
-- ----------------------------
DROP TABLE IF EXISTS `usergroup`;
CREATE TABLE `usergroup`  (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_nama` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `group_deskripsi` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `group_menu_permission` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL COMMENT 'berisi list menu yang dapat diakses dan dari setiap menu memiliki array permission apa saja. data pada kolom ini berupa json.',
  `group_default_menu` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`group_id`) USING BTREE,
  UNIQUE INDEX `index_usergroup`(`group_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of usergroup
-- ----------------------------
INSERT INTO `usergroup` VALUES (1, 'Kepala Unit', 'Kepala Bagian UIC', '[{\"menu_id\":12,\"permissions\":[\"create\",\"update\",\"delete\",\"close\"]},{\"menu_id\":17,\"permissions\":[\"create\",\"update\",\"delete\",\"close\"]}]', 12);
INSERT INTO `usergroup` VALUES (2, 'Staff', 'Staff UIC', '[{\"menu_id\":12,\"permissions\":[\"create\",\"update\",\"delete\"]},{\"menu_id\":17,\"permissions\":[\"create\",\"update\",\"delete\"]}]', 12);

SET FOREIGN_KEY_CHECKS = 1;
