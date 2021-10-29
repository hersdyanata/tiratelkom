/*
 Navicat Premium Data Transfer

 Source Server         : Local
 Source Server Type    : MySQL
 Source Server Version : 100138
 Source Host           : localhost:3306
 Source Schema         : tira

 Target Server Type    : MySQL
 Target Server Version : 100138
 File Encoding         : 65001

 Date: 29/10/2021 07:12:40
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
  `menu_createdat` datetime(0) NULL DEFAULT NULL,
  `menu_createdby` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`menu_id`) USING BTREE,
  UNIQUE INDEX `index_dev_menu`(`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

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
  `failed_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
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
INSERT INTO `master_type` VALUES (4, 'Decision Making');
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
  `created_at` timestamp(0) NULL DEFAULT NULL,
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
  `last_used_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
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
  `mom_called_by` int NULL DEFAULT NULL,
  `mom_status` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `mom_created_date` datetime(0) NULL DEFAULT NULL,
  `mom_updated_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`mom_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 91 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tra_mom
-- ----------------------------
INSERT INTO `tra_mom` VALUES (87, 1, 'MoM WAR part 1', '2021-10-28', '16:07', '1', 'Zoom', 4, 4, 'O', '2021-10-28 15:08:28', '2021-10-28 21:25:26');
INSERT INTO `tra_mom` VALUES (88, 2, 'MoM Forum Infrastruktur part 1', '2021-10-29', '20:15', '1', 'Vicon', 4, 1, 'O', '2021-10-28 16:15:31', '2021-10-28 21:25:29');
INSERT INTO `tra_mom` VALUES (89, 3, 'MoM Forum Meeting part 1', '2021-10-30', '14:10', '1', 'Sakura', 4, 6, 'C', '2021-10-28 21:11:16', '2021-10-28 22:34:26');
INSERT INTO `tra_mom` VALUES (90, 4, 'MoM Forum Support part 1', '2021-10-26', '23:16', '1', 'Melati', 4, 1, 'D', '2021-10-28 21:17:04', NULL);

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
INSERT INTO `tra_mom_agenda` VALUES (87, 1, 'MoM WAR Agenda Part 1 A');
INSERT INTO `tra_mom_agenda` VALUES (87, 2, 'MoM WAR Agenda Part 1 B');
INSERT INTO `tra_mom_agenda` VALUES (88, 1, 'MoM FI Agenda Part 1 A');
INSERT INTO `tra_mom_agenda` VALUES (89, 1, 'MoM FM Agenda Part 1 A');
INSERT INTO `tra_mom_agenda` VALUES (89, 2, 'MoM FM Agenda Part 1 B');
INSERT INTO `tra_mom_agenda` VALUES (90, 1, 'MoM FS Agenda Part 1 A');
INSERT INTO `tra_mom_agenda` VALUES (90, 2, 'MoM FS Agenda Part 1 B');
INSERT INTO `tra_mom_agenda` VALUES (90, 3, 'MoM FS Agenda Part 1 C');

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
  `discuss_created_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`discuss_id`, `discuss_agenda_id`, `discuss_mom_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tra_mom_discuss
-- ----------------------------
INSERT INTO `tra_mom_discuss` VALUES (87, 1, 3, 'MoM WAR Pointer Part 1 A1', 'MoM WAR Assignment Part 1  A1', 1, '2021-10-28', 'High', NULL, 'Open', '2021-10-28 16:17:18');
INSERT INTO `tra_mom_discuss` VALUES (87, 1, 4, 'MoM WAR  Pointer Part 1 A2', 'MoM WAR Assignment Part 1  A2', 2, '2021-11-04', 'Normal', NULL, 'Open', '2021-10-28 16:17:22');
INSERT INTO `tra_mom_discuss` VALUES (87, 1, 5, 'MoM WAR  Pointer Part 1 A3', 'MoM WAR Assignment Part 1  A3', 3, '2021-11-16', 'Low', NULL, 'Open', '2021-10-28 16:17:28');
INSERT INTO `tra_mom_discuss` VALUES (87, 2, 6, 'MoM WAR Pointer Part 1 B1', 'MoM WAR Assignment Part 1  B1', 3, '2021-10-29', 'High', NULL, 'Open', '2021-10-28 16:17:34');
INSERT INTO `tra_mom_discuss` VALUES (88, 1, 7, 'MoM FI Pointer Part 1 A1', 'MoM FI Assignment Part 1 A1', 11, '2021-11-01', 'High', NULL, 'Open', '2021-10-28 16:18:30');
INSERT INTO `tra_mom_discuss` VALUES (89, 1, 8, 'MoM FM Pointer Part 1 A1', 'MoM FM Assignment Part 1  A1', 2, '2021-11-06', 'Normal', NULL, 'Open', '2021-10-28 21:14:02');
INSERT INTO `tra_mom_discuss` VALUES (89, 2, 9, 'MoM FM Pointer Part 1 B1', 'MoM FM Assignment Part 1  B1', 5, '2021-11-25', 'Low', NULL, 'Open', '2021-10-28 21:14:02');
INSERT INTO `tra_mom_discuss` VALUES (90, 1, 10, 'MoM FS Pointer Part 1 A1', 'MoM FS Assignment Part 1 A1', 8, '2021-10-29', 'High', NULL, 'Open', '2021-10-28 21:24:44');
INSERT INTO `tra_mom_discuss` VALUES (90, 1, 11, 'MoM FS Pointer Part 1 A2', 'MoM FS Pointer Part 1 A2', 12, '2021-11-06', 'Normal', NULL, 'Open', '2021-10-28 21:24:44');
INSERT INTO `tra_mom_discuss` VALUES (90, 2, 12, 'MoM FS Pointer Part 1 B1', 'MoM FS Pointer Part 1 B1', 5, '2021-10-28', 'Low', NULL, 'Open', '2021-10-28 21:24:44');
INSERT INTO `tra_mom_discuss` VALUES (90, 3, 13, 'MoM FS Pointer Part 1 C1', 'MoM FS Pointer Part 1 C1', 7, '2021-11-04', 'Normal', NULL, 'Open', '2021-10-28 21:24:44');

-- ----------------------------
-- Table structure for tra_mom_participant
-- ----------------------------
DROP TABLE IF EXISTS `tra_mom_participant`;
CREATE TABLE `tra_mom_participant`  (
  `mom_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`mom_id`, `user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tra_mom_participant
-- ----------------------------
INSERT INTO `tra_mom_participant` VALUES (87, 1);
INSERT INTO `tra_mom_participant` VALUES (87, 6);
INSERT INTO `tra_mom_participant` VALUES (88, 6);
INSERT INTO `tra_mom_participant` VALUES (89, 1);
INSERT INTO `tra_mom_participant` VALUES (89, 4);
INSERT INTO `tra_mom_participant` VALUES (90, 4);

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
INSERT INTO `tra_mom_type` VALUES (87, 1);
INSERT INTO `tra_mom_type` VALUES (89, 1);
INSERT INTO `tra_mom_type` VALUES (90, 1);
INSERT INTO `tra_mom_type` VALUES (87, 2);
INSERT INTO `tra_mom_type` VALUES (88, 3);
INSERT INTO `tra_mom_type` VALUES (90, 5);

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
  `nik` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `group_id` int NULL DEFAULT NULL,
  `uic_id` int NULL DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp(0) NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `two_factor_recovery_codes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `theme` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, '1803004', 0, NULL, 'Hermansyah Handya Pranata', 'apocalypsix@gmail.com', '2021-08-26 23:28:02', '$2y$10$LYbZGX1cWPDKo/QVoRbOFuuA3VwOvHFc/23IZYIlRRN7Cop48xh0S', NULL, NULL, 'ykVLAhdJqbpGgLDqCS9U4IXeESKUbXD2PhRWRfCyVjd0T96TGTrRqrTlqEg3', 'material', '2020-12-19 09:33:18', '2021-08-26 23:28:02');
INSERT INTO `users` VALUES (4, '1802071', 1, NULL, 'Aditya M Munggaran', 'adityammunggaran@gmail.com', '2020-12-19 09:33:18', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-01-16 16:26:41', '2021-01-16 16:38:33');
INSERT INTO `users` VALUES (6, '1612001', 1, NULL, 'Jane Doe', 'janedoe@gmail.com', NULL, '$2y$10$.B99py5y1rz/jw6fhDsNIO12qDU2bCSK1tgkl.98yfzStMLH/r6j2', NULL, NULL, NULL, 'light', '2021-01-17 05:11:27', '2021-01-17 05:11:27');

SET FOREIGN_KEY_CHECKS = 1;
