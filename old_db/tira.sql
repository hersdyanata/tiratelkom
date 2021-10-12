/*
 Navicat Premium Data Transfer

 Source Server         : Local_DB
 Source Server Type    : MySQL
 Source Server Version : 100315
 Source Host           : localhost:3306
 Source Schema         : tira

 Target Server Type    : MySQL
 Target Server Version : 100315
 File Encoding         : 65001

 Date: 08/10/2021 16:58:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for biodata
-- ----------------------------
DROP TABLE IF EXISTS `biodata`;
CREATE TABLE `biodata`  (
  `dt_id` int NOT NULL AUTO_INCREMENT,
  `dt_nama` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `dt_alamat` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `dt_phone` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `dt_kodepos` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`dt_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of biodata
-- ----------------------------

-- ----------------------------
-- Table structure for dev_mapping_permission_ke_menu
-- ----------------------------
DROP TABLE IF EXISTS `dev_mapping_permission_ke_menu`;
CREATE TABLE `dev_mapping_permission_ke_menu`  (
  `map_menu_id` int NULL DEFAULT NULL,
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
  `menu_id` int NOT NULL AUTO_INCREMENT,
  `menu_div_id` int NULL DEFAULT NULL,
  `menu_parent_id` int NULL DEFAULT NULL,
  `menu_nama_ina` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `menu_nama_eng` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `menu_controller` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `menu_route_name` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `menu_folder_view` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `menu_icon` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `menu_level` int NULL DEFAULT NULL,
  `menu_publish_ke_user` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `menu_order` int NULL DEFAULT NULL,
  `menu_createdat` datetime NULL DEFAULT NULL,
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
-- Table structure for dev_menu_divider
-- ----------------------------
DROP TABLE IF EXISTS `dev_menu_divider`;
CREATE TABLE `dev_menu_divider`  (
  `div_id` int NOT NULL AUTO_INCREMENT,
  `div_nama_ina` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `div_nama_eng` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `div_order` int NULL DEFAULT NULL,
  `div_publish_ke_user` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`div_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of dev_menu_divider
-- ----------------------------
INSERT INTO `dev_menu_divider` VALUES (1, 'Manajemen User', 'User Management', 1, 'N');
INSERT INTO `dev_menu_divider` VALUES (2, 'Masterdata & Setting', 'Masterdata & Setting', 2, 'N');
INSERT INTO `dev_menu_divider` VALUES (3, NULL, NULL, 3, 'Y');

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
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for master_category
-- ----------------------------
DROP TABLE IF EXISTS `master_category`;
CREATE TABLE `master_category`  (
  `category_id` int NOT NULL,
  `category_desc` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `category_default` char(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of master_category
-- ----------------------------
INSERT INTO `master_category` VALUES (1, 'WAR', 'active');
INSERT INTO `master_category` VALUES (2, 'Forum Infrastruktur', NULL);
INSERT INTO `master_category` VALUES (3, 'Forum Meeting', '');
INSERT INTO `master_category` VALUES (4, 'Forum Support', NULL);

-- ----------------------------
-- Table structure for master_type
-- ----------------------------
DROP TABLE IF EXISTS `master_type`;
CREATE TABLE `master_type`  (
  `type_id` int NOT NULL,
  `type_desc` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of master_type
-- ----------------------------
INSERT INTO `master_type` VALUES (1, 'Review');
INSERT INTO `master_type` VALUES (2, 'Briefing');
INSERT INTO `master_type` VALUES (3, 'Coordination');
INSERT INTO `master_type` VALUES (4, 'Decisioin Making');
INSERT INTO `master_type` VALUES (5, 'Others');

-- ----------------------------
-- Table structure for master_uic
-- ----------------------------
DROP TABLE IF EXISTS `master_uic`;
CREATE TABLE `master_uic`  (
  `uic_id` int NOT NULL,
  `uic_code` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `uic_desc` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`uic_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of master_uic
-- ----------------------------
INSERT INTO `master_uic` VALUES (1, 'ROC', 'Regional Operation Center');
INSERT INTO `master_uic` VALUES (2, 'RNO', 'Regional Network Operation');
INSERT INTO `master_uic` VALUES (3, 'RAM', 'Regional Access Management');
INSERT INTO `master_uic` VALUES (4, 'PED', 'Planning Engineering & Development');
INSERT INTO `master_uic` VALUES (5, 'MSO', 'Managed Service Operation');
INSERT INTO `master_uic` VALUES (6, 'CM', 'Consumer Marketing');
INSERT INTO `master_uic` VALUES (7, 'CC', 'Consumer Care');
INSERT INTO `master_uic` VALUES (8, 'BGES', 'Reg Enterprise Government, Biz Service');
INSERT INTO `master_uic` VALUES (9, 'RWS', 'Regional Wholesale Service');
INSERT INTO `master_uic` VALUES (10, 'BPP', 'Business Planning & Performance');
INSERT INTO `master_uic` VALUES (11, 'GA', 'General Affair');
INSERT INTO `master_uic` VALUES (12, 'HC', 'Human Capital');
INSERT INTO `master_uic` VALUES (13, 'PCF', 'Payment Collection & Finance');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (4, '2014_10_12_200000_add_two_factor_columns_to_users_table', 2);
INSERT INTO `migrations` VALUES (5, '2019_12_14_000001_create_personal_access_tokens_table', 2);
INSERT INTO `migrations` VALUES (6, '2020_12_19_093100_create_sessions_table', 2);

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `personal_access_tokens_token_unique`(`token`) USING BTREE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type`, `tokenable_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for sessions
-- ----------------------------
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions`  (
  `id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NULL DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `payload` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sessions_user_id_index`(`user_id`) USING BTREE,
  INDEX `sessions_last_activity_index`(`last_activity`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sessions
-- ----------------------------
INSERT INTO `sessions` VALUES ('YpB99syzolIkT1QWhMhtnZIrfQN37FBI1H6SHEBR', 5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:84.0) Gecko/20100101 Firefox/84.0', 'YToxMDp7czo2OiJfdG9rZW4iO3M6NDA6IjFVcGU2cUY4V3BpbHhKcXhmdGQ2Q1JPWjlROFE2Q05ZZkRVQWl5SjgiO3M6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI3OiJodHRwOi8vbG9jYWxob3N0OjgwMDAva2FzaXIiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTo1O3M6NzoidXNlcl9pZCI7aTo1O3M6NDoibmFtYSI7czoxMzoiRWtreSBQcmFkaXB0YSI7czo1OiJlbWFpbCI7czoyMDoiZXFwcmFkaXB0YUBnbWFpbC5jb20iO3M6NToidGhlbWUiO3M6ODoibWF0ZXJpYWwiO3M6ODoiZ3JvdXBfaWQiO2k6MjtzOjEwOiJncm91cF9uYW1hIjtzOjU6Ikthc2lyIjt9', 1611066051);

-- ----------------------------
-- Table structure for tra_category_uic
-- ----------------------------
DROP TABLE IF EXISTS `tra_category_uic`;
CREATE TABLE `tra_category_uic`  (
  `category_id` int NOT NULL,
  `uic_id` int NOT NULL,
  PRIMARY KEY (`category_id`, `uic_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tra_category_uic
-- ----------------------------
INSERT INTO `tra_category_uic` VALUES (2, 1);
INSERT INTO `tra_category_uic` VALUES (2, 2);
INSERT INTO `tra_category_uic` VALUES (2, 3);
INSERT INTO `tra_category_uic` VALUES (2, 4);
INSERT INTO `tra_category_uic` VALUES (2, 5);
INSERT INTO `tra_category_uic` VALUES (3, 6);
INSERT INTO `tra_category_uic` VALUES (3, 7);
INSERT INTO `tra_category_uic` VALUES (3, 8);
INSERT INTO `tra_category_uic` VALUES (3, 9);
INSERT INTO `tra_category_uic` VALUES (4, 10);
INSERT INTO `tra_category_uic` VALUES (4, 11);
INSERT INTO `tra_category_uic` VALUES (4, 12);
INSERT INTO `tra_category_uic` VALUES (4, 13);

-- ----------------------------
-- Table structure for tra_mom
-- ----------------------------
DROP TABLE IF EXISTS `tra_mom`;
CREATE TABLE `tra_mom`  (
  `mom_id` int NOT NULL AUTO_INCREMENT,
  `mom_title` int NULL DEFAULT NULL,
  `mom_event` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `mom_date` date NULL DEFAULT NULL,
  `mom_time` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `mom_duration` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `mom_location` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `mom_notulen_by` int NULL DEFAULT NULL,
  `mom_called_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `mom_status` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `mom_created_date` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `mom_updated_date` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`mom_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tra_mom
-- ----------------------------
INSERT INTO `tra_mom` VALUES (38, 2, 'Network Maintenance', '2021-10-08', '12:30 AM', '1', 'Zoom', 4, 'Munggaran', 'D', '2021-10-08 14:32:17', NULL);
INSERT INTO `tra_mom` VALUES (39, 3, 'Daily Report', '2021-10-08', '1:00 AM', '1', 'ERP', 4, 'Atun', 'D', '2021-10-08 14:35:18', NULL);
INSERT INTO `tra_mom` VALUES (40, 1, 'Year Goal', '2021-10-08', '12:30 AM', '1', 'Sakura', 4, 'Phyur', 'D', '2021-10-08 14:41:38', NULL);
INSERT INTO `tra_mom` VALUES (41, 2, 'test', '2021-10-08', '1:30 AM', '1', 'Test', 4, 'test', 'D', '2021-10-08 14:43:15', NULL);
INSERT INTO `tra_mom` VALUES (42, 2, 'test', '2021-10-08', '12:30 AM', '1', 'test', 4, 'test', 'D', '2021-10-08 14:50:58', NULL);
INSERT INTO `tra_mom` VALUES (43, 2, 'Network Maintenance', '2021-10-08', '1:00 AM', '1', 'Vicon', 4, 'amm', 'D', '2021-10-08 14:53:27', NULL);
INSERT INTO `tra_mom` VALUES (44, 1, 'test', '2021-10-08', '12:30 AM', '1', 'test', 4, 'etset', 'O', '2021-10-08 15:08:40', '2021-10-08 15:08:40');
INSERT INTO `tra_mom` VALUES (45, 4, 'Expanstion', '2021-10-08', '12:30 AM', '1', 'test', 4, 'test', 'D', '2021-10-08 15:39:16', NULL);
INSERT INTO `tra_mom` VALUES (46, 2, 'Network Maintenacne', '2021-10-08', '12:30 AM', '1', 'Zoom', 4, 'Atun', 'D', '2021-10-08 16:07:45', NULL);
INSERT INTO `tra_mom` VALUES (47, 1, 'Network Maintenance', '2021-10-08', '1:00 AM', '1', 'Zoom', 4, 'test', 'O', '2021-10-08 16:10:23', '2021-10-08 16:10:23');

-- ----------------------------
-- Table structure for tra_mom_agenda
-- ----------------------------
DROP TABLE IF EXISTS `tra_mom_agenda`;
CREATE TABLE `tra_mom_agenda`  (
  `mom_id` int NULL DEFAULT NULL,
  `agenda_id` int NULL DEFAULT NULL,
  `agenda_desc` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tra_mom_agenda
-- ----------------------------
INSERT INTO `tra_mom_agenda` VALUES (38, 1, 'Agenda Kami Hari ini A');
INSERT INTO `tra_mom_agenda` VALUES (38, 2, 'Agenda Kami hari ini B');
INSERT INTO `tra_mom_agenda` VALUES (39, 1, 'Agenda A');
INSERT INTO `tra_mom_agenda` VALUES (40, 1, 'Agenda AAA');
INSERT INTO `tra_mom_agenda` VALUES (41, 1, 'Agebda');
INSERT INTO `tra_mom_agenda` VALUES (42, 1, 'Agenda A');
INSERT INTO `tra_mom_agenda` VALUES (43, 1, 'Agenda 1');
INSERT INTO `tra_mom_agenda` VALUES (44, 1, 'Agenda AAAAAAAAAAAAA');
INSERT INTO `tra_mom_agenda` VALUES (47, 1, 'Agenda A');

-- ----------------------------
-- Table structure for tra_mom_discuss
-- ----------------------------
DROP TABLE IF EXISTS `tra_mom_discuss`;
CREATE TABLE `tra_mom_discuss`  (
  `discuss_mom_id` int NOT NULL,
  `discuss_agenda_id` int NOT NULL,
  `discuss_id` int NOT NULL AUTO_INCREMENT,
  `discuss_pointer` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `discuss_assignment` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `discuss_uic_id` int NULL DEFAULT NULL,
  `discuss_due_date` date NULL DEFAULT NULL,
  `discuss_priority` char(6) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `discuss_progress` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `discuss_status` char(6) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `discuss_created_date` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`discuss_id`, `discuss_agenda_id`, `discuss_mom_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 87 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tra_mom_discuss
-- ----------------------------
INSERT INTO `tra_mom_discuss` VALUES (38, 1, 77, 'Pointer Agenda A1', 'Assignment Agenda A1', 11, '2021-10-08', 'High', NULL, 'Open', '2021-10-08 14:33:55');
INSERT INTO `tra_mom_discuss` VALUES (38, 1, 78, 'Pointer Agenda A2', 'Assignment Agenda A1', 21, '2021-10-08', 'Normal', NULL, 'Open', '2021-10-08 14:33:55');
INSERT INTO `tra_mom_discuss` VALUES (38, 2, 79, 'Pointer Agenda B1', 'Assignment Agenda B1', 31, '2021-10-08', 'Low', NULL, 'Closed', '2021-10-08 14:33:55');
INSERT INTO `tra_mom_discuss` VALUES (39, 1, 80, 'Pointer A1', 'Assignment A1', 11, '2021-10-08', 'High', NULL, 'Open', '2021-10-08 14:36:02');
INSERT INTO `tra_mom_discuss` VALUES (40, 1, 81, 'Pointer AAA', 'Assignment AAA', 11, '2021-10-08', 'High', NULL, 'Open', '2021-10-08 14:42:05');
INSERT INTO `tra_mom_discuss` VALUES (41, 1, 82, 'Pointer 1', 'Assignment 1', 11, '2021-10-08', 'High', NULL, 'Open', '2021-10-08 14:50:00');
INSERT INTO `tra_mom_discuss` VALUES (42, 1, 83, 'Pointer A', 'Assignemtn A', 11, '2021-10-08', 'High', NULL, 'Open', '2021-10-08 14:51:25');
INSERT INTO `tra_mom_discuss` VALUES (43, 1, 84, 'Pointer 1A', 'Assignemtn 1A', 31, '2021-10-08', 'High', NULL, 'Open', '2021-10-08 14:54:03');
INSERT INTO `tra_mom_discuss` VALUES (44, 1, 85, 'Pointer AAAA', 'Assignemtn AAAA', 21, '2021-10-08', 'High', NULL, 'Open', '2021-10-08 14:56:33');
INSERT INTO `tra_mom_discuss` VALUES (47, 1, 86, 'Pointer A111', 'Assignment A1111', 13, '2021-10-08', 'High', NULL, 'Open', '2021-10-08 16:10:20');

-- ----------------------------
-- Table structure for tra_mom_participant
-- ----------------------------
DROP TABLE IF EXISTS `tra_mom_participant`;
CREATE TABLE `tra_mom_participant`  (
  `mom_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`user_id`, `mom_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tra_mom_participant
-- ----------------------------
INSERT INTO `tra_mom_participant` VALUES (42, 1);
INSERT INTO `tra_mom_participant` VALUES (44, 2);
INSERT INTO `tra_mom_participant` VALUES (47, 6);
INSERT INTO `tra_mom_participant` VALUES (38, 11);
INSERT INTO `tra_mom_participant` VALUES (41, 11);
INSERT INTO `tra_mom_participant` VALUES (43, 12);
INSERT INTO `tra_mom_participant` VALUES (38, 21);
INSERT INTO `tra_mom_participant` VALUES (40, 21);
INSERT INTO `tra_mom_participant` VALUES (38, 31);
INSERT INTO `tra_mom_participant` VALUES (43, 31);
INSERT INTO `tra_mom_participant` VALUES (39, 1802071);

-- ----------------------------
-- Table structure for tra_mom_type
-- ----------------------------
DROP TABLE IF EXISTS `tra_mom_type`;
CREATE TABLE `tra_mom_type`  (
  `mom_id` int NOT NULL,
  `type_id` int NOT NULL,
  PRIMARY KEY (`type_id`, `mom_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tra_mom_type
-- ----------------------------
INSERT INTO `tra_mom_type` VALUES (3, 1);
INSERT INTO `tra_mom_type` VALUES (4, 1);
INSERT INTO `tra_mom_type` VALUES (5, 1);
INSERT INTO `tra_mom_type` VALUES (6, 1);
INSERT INTO `tra_mom_type` VALUES (7, 1);
INSERT INTO `tra_mom_type` VALUES (8, 1);
INSERT INTO `tra_mom_type` VALUES (9, 1);
INSERT INTO `tra_mom_type` VALUES (10, 1);
INSERT INTO `tra_mom_type` VALUES (11, 1);
INSERT INTO `tra_mom_type` VALUES (12, 1);
INSERT INTO `tra_mom_type` VALUES (13, 1);
INSERT INTO `tra_mom_type` VALUES (14, 1);
INSERT INTO `tra_mom_type` VALUES (15, 1);
INSERT INTO `tra_mom_type` VALUES (16, 1);
INSERT INTO `tra_mom_type` VALUES (17, 1);
INSERT INTO `tra_mom_type` VALUES (18, 1);
INSERT INTO `tra_mom_type` VALUES (19, 1);
INSERT INTO `tra_mom_type` VALUES (20, 1);
INSERT INTO `tra_mom_type` VALUES (21, 1);
INSERT INTO `tra_mom_type` VALUES (22, 1);
INSERT INTO `tra_mom_type` VALUES (23, 1);
INSERT INTO `tra_mom_type` VALUES (24, 1);
INSERT INTO `tra_mom_type` VALUES (25, 1);
INSERT INTO `tra_mom_type` VALUES (26, 1);
INSERT INTO `tra_mom_type` VALUES (27, 1);
INSERT INTO `tra_mom_type` VALUES (28, 1);
INSERT INTO `tra_mom_type` VALUES (29, 1);
INSERT INTO `tra_mom_type` VALUES (30, 1);
INSERT INTO `tra_mom_type` VALUES (33, 1);
INSERT INTO `tra_mom_type` VALUES (35, 1);
INSERT INTO `tra_mom_type` VALUES (38, 1);
INSERT INTO `tra_mom_type` VALUES (39, 1);
INSERT INTO `tra_mom_type` VALUES (42, 1);
INSERT INTO `tra_mom_type` VALUES (43, 1);
INSERT INTO `tra_mom_type` VALUES (44, 1);
INSERT INTO `tra_mom_type` VALUES (46, 1);
INSERT INTO `tra_mom_type` VALUES (2, 2);
INSERT INTO `tra_mom_type` VALUES (3, 2);
INSERT INTO `tra_mom_type` VALUES (4, 2);
INSERT INTO `tra_mom_type` VALUES (5, 2);
INSERT INTO `tra_mom_type` VALUES (6, 2);
INSERT INTO `tra_mom_type` VALUES (7, 2);
INSERT INTO `tra_mom_type` VALUES (8, 2);
INSERT INTO `tra_mom_type` VALUES (11, 2);
INSERT INTO `tra_mom_type` VALUES (22, 2);
INSERT INTO `tra_mom_type` VALUES (30, 2);
INSERT INTO `tra_mom_type` VALUES (31, 2);
INSERT INTO `tra_mom_type` VALUES (32, 2);
INSERT INTO `tra_mom_type` VALUES (34, 2);
INSERT INTO `tra_mom_type` VALUES (35, 2);
INSERT INTO `tra_mom_type` VALUES (36, 2);
INSERT INTO `tra_mom_type` VALUES (41, 2);
INSERT INTO `tra_mom_type` VALUES (45, 2);
INSERT INTO `tra_mom_type` VALUES (47, 2);
INSERT INTO `tra_mom_type` VALUES (28, 3);
INSERT INTO `tra_mom_type` VALUES (29, 3);
INSERT INTO `tra_mom_type` VALUES (32, 3);
INSERT INTO `tra_mom_type` VALUES (36, 3);
INSERT INTO `tra_mom_type` VALUES (37, 3);
INSERT INTO `tra_mom_type` VALUES (42, 3);
INSERT INTO `tra_mom_type` VALUES (2, 4);
INSERT INTO `tra_mom_type` VALUES (37, 4);
INSERT INTO `tra_mom_type` VALUES (38, 4);
INSERT INTO `tra_mom_type` VALUES (40, 5);

-- ----------------------------
-- Table structure for usergroup
-- ----------------------------
DROP TABLE IF EXISTS `usergroup`;
CREATE TABLE `usergroup`  (
  `group_id` int NOT NULL AUTO_INCREMENT,
  `group_nama` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `group_deskripsi` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `group_menu_permission` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL COMMENT 'berisi list menu yang dapat diakses dan dari setiap menu memiliki array permission apa saja. data pada kolom ini berupa json.',
  `group_default_menu` int NULL DEFAULT NULL,
  PRIMARY KEY (`group_id`) USING BTREE,
  UNIQUE INDEX `index_usergroup`(`group_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of usergroup
-- ----------------------------
INSERT INTO `usergroup` VALUES (1, 'Kepala Unit', 'Kepala Bagian UIC', '[{\"menu_id\":12,\"permissions\":[\"create\",\"update\",\"delete\",\"close\"]},{\"menu_id\":17,\"permissions\":[\"create\",\"update\",\"delete\",\"close\"]}]', 12);
INSERT INTO `usergroup` VALUES (2, 'Staff', 'Staff UIC', '[{\"menu_id\":12,\"permissions\":[\"create\",\"update\",\"delete\"]},{\"menu_id\":17,\"permissions\":[\"create\",\"update\",\"delete\"]}]', 12);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `group_id` int NULL DEFAULT NULL,
  `parent_user_id` int NULL DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `two_factor_recovery_codes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `theme` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'hersdyanata', 0, NULL, 'Hermansyah Handya Pranata', 'apocalypsix@gmail.com', '2021-08-26 23:28:02', '$2y$10$LYbZGX1cWPDKo/QVoRbOFuuA3VwOvHFc/23IZYIlRRN7Cop48xh0S', NULL, NULL, 'p4xm7YXvChD0l6jcS0KQfuA31wnpTLK42y6CmI1cvaSvVI0hjibxLjHKJ9bH', 'material', '2020-12-19 09:33:18', '2021-08-26 23:28:02');
INSERT INTO `users` VALUES (4, 'johndoe', 1, NULL, 'John Doe', 'johndoe@gmail.com', '2020-12-19 09:33:18', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-01-16 16:26:41', '2021-01-16 16:38:33');
INSERT INTO `users` VALUES (6, 'janedoe', 1, NULL, 'Jane Doe', 'janedoe@gmail.com', NULL, '$2y$10$.B99py5y1rz/jw6fhDsNIO12qDU2bCSK1tgkl.98yfzStMLH/r6j2', NULL, NULL, NULL, 'light', '2021-01-17 05:11:27', '2021-01-17 05:11:27');

SET FOREIGN_KEY_CHECKS = 1;
