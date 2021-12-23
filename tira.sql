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

 Date: 23/12/2021 16:19:44
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
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of dev_menu
-- ----------------------------
INSERT INTO `dev_menu` VALUES (1, 1, NULL, 'Group Pengguna', 'User Group', 'UsergroupController', 'usergroup', 'usergroup', 'icon-users', 1, 'Y', 2, '2021-03-17 15:37:37', '1');
INSERT INTO `dev_menu` VALUES (2, 1, NULL, 'Pengguna', 'Users', 'UserController', 'user', 'user', 'icon-users4', 1, 'Y', 1, '2021-03-17 15:42:56', '1');
INSERT INTO `dev_menu` VALUES (12, 3, NULL, 'Dashboard', 'Dashboard', 'DashboardController', 'dashboard', 'dashboard', 'icon-home8', 1, 'Y', 1, '2021-09-18 22:56:51', '1');
INSERT INTO `dev_menu` VALUES (17, 3, NULL, 'Create MoM', 'Create MoM', 'MomController', 'mom', 'mom', 'icon-file-plus', 1, 'Y', 1, '2021-09-18 22:56:51', '1');

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
INSERT INTO `master_uic` VALUES (1, 'BPP', 'BUSINESS PLANNING,PERFORMANCE & RISK MGT');
INSERT INTO `master_uic` VALUES (2, 'CM', 'CONSUMER MARKETING');
INSERT INTO `master_uic` VALUES (3, 'CC', 'CUSTOMER CARE');
INSERT INTO `master_uic` VALUES (4, 'GA', 'GENERAL AFFAIR');
INSERT INTO `master_uic` VALUES (5, 'MSO', 'MANAGED SERVICE OPERATION');
INSERT INTO `master_uic` VALUES (6, 'PED', 'PLANNING, ENGINEERING & DEPLOYMENT');
INSERT INTO `master_uic` VALUES (7, 'BGES', 'REG ENTERPRISE,GOVERNMENT&BUSINESS SERV');
INSERT INTO `master_uic` VALUES (8, 'RNO', 'REGIONAL NETWORK OPERATION');
INSERT INTO `master_uic` VALUES (9, 'ROC', 'REGIONAL OPERATION CENTER');
INSERT INTO `master_uic` VALUES (10, 'RWS', 'REGIONAL WHOLESALE SERVICE');
INSERT INTO `master_uic` VALUES (11, 'SS', 'SHARED SERVICE');
INSERT INTO `master_uic` VALUES (12, 'TR3', 'TELKOM REGIONAL III');
INSERT INTO `master_uic` VALUES (13, 'WB', 'WITEL BANDUNG');
INSERT INTO `master_uic` VALUES (14, 'WBB', 'WITEL BANDUNG BARAT');
INSERT INTO `master_uic` VALUES (15, 'CRB', 'WITEL CIREBON');
INSERT INTO `master_uic` VALUES (16, 'KRW', 'WITEL KARAWANG');
INSERT INTO `master_uic` VALUES (17, 'SKB', 'WITEL SUKABUMI');
INSERT INTO `master_uic` VALUES (18, 'TSM', 'WITEL TASIKMALAYA');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (4, '2014_10_12_200000_add_two_factor_columns_to_users_table', 2);
INSERT INTO `migrations` VALUES (5, '2019_12_14_000001_create_personal_access_tokens_table', 2);
INSERT INTO `migrations` VALUES (6, '2020_12_19_093100_create_sessions_table', 2);
INSERT INTO `migrations` VALUES (7, '2021_12_14_234827_add_objectguid_to_users_table', 3);

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
-- Table structure for tra_mom
-- ----------------------------
DROP TABLE IF EXISTS `tra_mom`;
CREATE TABLE `tra_mom`  (
  `mom_id` int NOT NULL AUTO_INCREMENT,
  `mom_title` int NULL DEFAULT NULL,
  `mom_event` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `mom_date` date NULL DEFAULT NULL,
  `mom_time` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `mom_duration` int NULL DEFAULT NULL,
  `mom_unit` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `mom_location` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `mom_notulen_by` int NULL DEFAULT NULL,
  `mom_called_by` int NULL DEFAULT NULL,
  `mom_status` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `mom_created_date` datetime NULL DEFAULT NULL,
  `mom_updated_date` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`mom_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 94 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tra_mom
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 88 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tra_mom_discuss
-- ----------------------------

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

-- ----------------------------
-- Table structure for tra_mom_progress
-- ----------------------------
DROP TABLE IF EXISTS `tra_mom_progress`;
CREATE TABLE `tra_mom_progress`  (
  `progress_mom_id` int NOT NULL,
  `progress_agenda_id` int NOT NULL,
  `progress_discuss_id` int NOT NULL,
  `progress_id` int NOT NULL AUTO_INCREMENT,
  `progress_date` date NULL DEFAULT NULL,
  `progress_desc` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`progress_id`, `progress_discuss_id`, `progress_agenda_id`, `progress_mom_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tra_mom_progress
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of usergroup
-- ----------------------------
INSERT INTO `usergroup` VALUES (1, 'Staff', 'Staff UIC', '[{\"menu_id\":12,\"permissions\":[\"create\",\"update\",\"delete\",\"close\"]},{\"menu_id\":17,\"permissions\":[\"create\",\"update\",\"delete\",\"close\"]}]', 12);
INSERT INTO `usergroup` VALUES (2, 'Kepala Unit', 'Kepala Bagian UIC', '[{\"menu_id\":12,\"permissions\":[\"create\",\"update\",\"delete\"]},{\"menu_id\":17,\"permissions\":[\"create\",\"update\",\"delete\"]}]', 12);

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
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
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
) ENGINE = InnoDB AUTO_INCREMENT = 386 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, '1803004', 0, 2, 'Hermansyah Handya Pranata', 'apocalypsix@gmail.com', '2021-08-26 23:28:02', '$2y$10$LYbZGX1cWPDKo/QVoRbOFuuA3VwOvHFc/23IZYIlRRN7Cop48xh0S', NULL, NULL, 'GjhRNQoUIvNQX14uGliak8efYHG6iKNzfI680Vgzt6eqsYL2gu0FxoDm7QBE', 'material', '2020-12-19 09:33:18', '2021-08-26 23:28:02');
INSERT INTO `users` VALUES (2, '1802071', 0, 3, 'Aditya M Munggaran', 'adityammunggaran@gmail.com', '2020-12-19 09:33:18', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-01-16 16:26:41', '2021-01-16 16:38:33');
INSERT INTO `users` VALUES (3, '710447', 2, 1, 'BUDDY SETIAWAN,ST, MM', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:05', '2021-12-23 16:00:53');
INSERT INTO `users` VALUES (4, '660396', 1, 1, 'ASEP TATANG', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:05', '2021-12-23 16:14:44');
INSERT INTO `users` VALUES (5, '690408', 1, 1, 'ERNI SUKAESIH', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:05', NULL);
INSERT INTO `users` VALUES (6, '670211', 1, 1, 'NGADI WULYO UTOMO', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:05', NULL);
INSERT INTO `users` VALUES (7, '930165', 1, 1, 'EMILIA YULISITA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:05', NULL);
INSERT INTO `users` VALUES (8, '740303', 1, 1, 'TYAS PRATITIS, ST. MSEM.', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:05', NULL);
INSERT INTO `users` VALUES (9, '920073', 1, 1, 'PRATIWI WIDHI MAYA SARI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:06', NULL);
INSERT INTO `users` VALUES (10, '850131', 1, 1, 'ARTIKA ARUMNINGTYAS', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:06', NULL);
INSERT INTO `users` VALUES (11, '860153', 1, 2, 'OCTA JULIAN ALADIYAH', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:06', NULL);
INSERT INTO `users` VALUES (12, '670173', 2, 2, 'YUDI MULYADI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:06', NULL);
INSERT INTO `users` VALUES (13, '700657', 1, 2, 'HENDRAWAN', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:06', NULL);
INSERT INTO `users` VALUES (14, '780062', 1, 2, 'ANDI INDRIANI RAHMI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:06', NULL);
INSERT INTO `users` VALUES (15, '880006', 1, 2, 'AYU TRI HASTUTI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:06', NULL);
INSERT INTO `users` VALUES (16, '920050', 1, 2, 'MARINA ELVIRIA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:06', NULL);
INSERT INTO `users` VALUES (17, '940443', 1, 2, 'SISPA NURADIANA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:06', NULL);
INSERT INTO `users` VALUES (18, '720324', 1, 2, 'BARMAWI, ST', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:06', NULL);
INSERT INTO `users` VALUES (19, '720281', 1, 2, 'DEVY YUNARWATY, ST', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:06', NULL);
INSERT INTO `users` VALUES (20, '890016', 1, 2, 'KHOIRINA FAJAR', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:06', NULL);
INSERT INTO `users` VALUES (21, '970012', 1, 2, 'GHEYI AMANATUNISSA MARGAATMADJA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:06', NULL);
INSERT INTO `users` VALUES (22, '720360', 1, 3, 'ERNAWANTI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:06', NULL);
INSERT INTO `users` VALUES (23, '830112', 2, 3, 'OKFARIMA MANDASARI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:06', NULL);
INSERT INTO `users` VALUES (24, '950453', 1, 3, 'NABILA KHAIRUNNISA ANSORY', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:06', NULL);
INSERT INTO `users` VALUES (25, '810068', 1, 3, 'LYDIA OKTARINI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:06', NULL);
INSERT INTO `users` VALUES (26, '650556', 1, 3, 'SUDARSANA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:06', NULL);
INSERT INTO `users` VALUES (27, '660147', 1, 3, 'EKA WIDIHASTUTI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:06', NULL);
INSERT INTO `users` VALUES (28, '940015', 1, 3, 'EDWINA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:06', NULL);
INSERT INTO `users` VALUES (29, '670207', 1, 4, 'GATOT RAHMANTO', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:06', NULL);
INSERT INTO `users` VALUES (30, '670343', 1, 4, 'NASRUL FATAH', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:06', NULL);
INSERT INTO `users` VALUES (31, '730324', 1, 4, 'ELISABETH MARGARETA VILLANUEVA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:06', NULL);
INSERT INTO `users` VALUES (32, '950152', 1, 4, 'HASRIMA DEWI MAGFIRA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:06', NULL);
INSERT INTO `users` VALUES (33, '720351', 1, 4, 'HENDRO WIDIJANTA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:06', NULL);
INSERT INTO `users` VALUES (34, '690402', 1, 4, 'RINI MARLIANI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:06', NULL);
INSERT INTO `users` VALUES (35, '820042', 1, 4, 'ASMANUR ARUMSARI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:06', NULL);
INSERT INTO `users` VALUES (36, '960014', 1, 4, 'MUHAMAD DICKY RYALDI SUHERMAN', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:06', NULL);
INSERT INTO `users` VALUES (37, '670455', 1, 4, 'HAMINUDIN', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:06', NULL);
INSERT INTO `users` VALUES (38, '680447', 1, 4, 'SRI MULYATI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:06', NULL);
INSERT INTO `users` VALUES (39, '910153', 1, 4, 'MUHAMMAD LUTHFI DARMAN', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:06', NULL);
INSERT INTO `users` VALUES (40, '930259', 1, 4, 'RIZKA NADHIRA PUTRI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:06', NULL);
INSERT INTO `users` VALUES (41, '730154', 1, 5, 'KUSWANDARI SETYARINI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:06', NULL);
INSERT INTO `users` VALUES (42, '660337', 1, 5, 'AGOES KOESRIJANTO, IR. M.T', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:06', NULL);
INSERT INTO `users` VALUES (43, '870014', 1, 5, 'PUTRI NURINA AYUNINGTIAS', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:06', NULL);
INSERT INTO `users` VALUES (44, '660356', 1, 5, 'HERU YULIANTO', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:06', NULL);
INSERT INTO `users` VALUES (45, '670081', 1, 5, 'YUSWARDI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:06', NULL);
INSERT INTO `users` VALUES (46, '650483', 1, 5, 'APEH SOLAHUDIN', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:06', NULL);
INSERT INTO `users` VALUES (47, '960227', 1, 5, 'ABU AMAR TANTOWI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:06', NULL);
INSERT INTO `users` VALUES (48, '651151', 1, 6, 'AGUS PURNOMO HADI, IR.', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:06', NULL);
INSERT INTO `users` VALUES (49, '720537', 1, 6, 'BUDI ASTUTI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:06', NULL);
INSERT INTO `users` VALUES (50, '670251', 1, 6, 'IR. ARISAKTI PRIBADI, MT', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:06', NULL);
INSERT INTO `users` VALUES (51, '770051', 1, 6, 'ARIS HARNOTO', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:06', NULL);
INSERT INTO `users` VALUES (52, '930118', 1, 6, 'VIDYA NOOR RACHMADINI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:06', NULL);
INSERT INTO `users` VALUES (53, '740304', 1, 6, 'KHUSNAWAN', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:06', NULL);
INSERT INTO `users` VALUES (54, '720295', 1, 6, 'VIRA SMARA YUDHA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:06', NULL);
INSERT INTO `users` VALUES (55, '880034', 1, 6, 'RACHMI BASUKI PUTRI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:06', NULL);
INSERT INTO `users` VALUES (56, '720271', 1, 6, 'RIDWAN KURNIAWAN', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:06', NULL);
INSERT INTO `users` VALUES (57, '650489', 1, 6, 'DANY RACHMAN', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:06', NULL);
INSERT INTO `users` VALUES (58, '680369', 1, 6, 'DWI KARTONO', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:06', NULL);
INSERT INTO `users` VALUES (59, '660321', 1, 6, 'HENDRIESJAF ARIEF', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:06', NULL);
INSERT INTO `users` VALUES (60, '950468', 1, 6, 'ALIT DIAN SAEPUDIN', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:06', NULL);
INSERT INTO `users` VALUES (61, '720388', 1, 6, 'ANDI AUDY OCEANTO (DICKY)', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:06', NULL);
INSERT INTO `users` VALUES (62, '651384', 1, 6, 'ASEP SURYANA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:07', NULL);
INSERT INTO `users` VALUES (63, '750026', 1, 7, 'RICKA FEBRILIANTINA, ST', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:07', NULL);
INSERT INTO `users` VALUES (64, '820051', 1, 7, 'WIDA AISYIYYAH', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:07', NULL);
INSERT INTO `users` VALUES (65, '850180', 1, 7, 'EKO ARDIANSYAH PUTRA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:07', NULL);
INSERT INTO `users` VALUES (66, '700639', 1, 7, 'SITI NURHAYATI,RADEN', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:07', NULL);
INSERT INTO `users` VALUES (67, '880051', 2, 7, 'HARLINA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:07', NULL);
INSERT INTO `users` VALUES (68, '790118', 1, 7, 'AZIZAH KUSUMA WARDHANY', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:07', NULL);
INSERT INTO `users` VALUES (69, '910206', 1, 7, 'AMANITA MUSKARIANNY', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:07', NULL);
INSERT INTO `users` VALUES (70, '870047', 1, 7, 'SHANDY ASRI ACHMAD', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:07', NULL);
INSERT INTO `users` VALUES (71, '660094', 1, 7, 'SOPIYAN SOPIYANA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:07', NULL);
INSERT INTO `users` VALUES (72, '880017', 2, 7, 'ANGGITA AYU KARTIKA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:07', NULL);
INSERT INTO `users` VALUES (73, '920191', 1, 7, 'RENA PUSPITA PUTRI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:07', NULL);
INSERT INTO `users` VALUES (74, '870050', 1, 7, 'ANGGI AGUSTINA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:07', NULL);
INSERT INTO `users` VALUES (75, '960210', 1, 7, 'MUHAMAD FARIZ AGUNG', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:07', NULL);
INSERT INTO `users` VALUES (76, '660366', 1, 8, 'BAMBANG SUPRIYADI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:07', NULL);
INSERT INTO `users` VALUES (77, '670099', 1, 8, 'SUYANTO', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:07', NULL);
INSERT INTO `users` VALUES (78, '670032', 1, 8, 'NELSON BINSAR M. S.', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:07', NULL);
INSERT INTO `users` VALUES (79, '830141', 1, 8, 'ROKHAYAH', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:07', NULL);
INSERT INTO `users` VALUES (80, '850129', 1, 8, 'ERYANTO PRABOWO', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:07', NULL);
INSERT INTO `users` VALUES (81, '950139', 1, 8, 'RAHADIAN HILMY', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:07', NULL);
INSERT INTO `users` VALUES (82, '720516', 1, 8, 'HELDI FUAD ABDILLAH', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:07', NULL);
INSERT INTO `users` VALUES (83, '670034', 1, 8, 'GANI MAY SAFARIE, SE.', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:07', NULL);
INSERT INTO `users` VALUES (84, '720169', 1, 8, 'DANANG TJATUR WIDJAJADI,MM', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:07', NULL);
INSERT INTO `users` VALUES (85, '710477', 2, 9, 'AZRUL', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:07', NULL);
INSERT INTO `users` VALUES (86, '730542', 1, 9, 'HARI WIDAYANTO', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:07', NULL);
INSERT INTO `users` VALUES (87, '930355', 1, 9, 'FERIQ MUHAMMAD DAROJAT', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:07', NULL);
INSERT INTO `users` VALUES (88, '730458', 1, 9, 'AGUS SULISTYO', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:07', NULL);
INSERT INTO `users` VALUES (89, '650653', 1, 9, 'TETEN YANI ROHMAT', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:07', NULL);
INSERT INTO `users` VALUES (90, '920054', 1, 9, 'DEVI ZARMA RISNA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:07', NULL);
INSERT INTO `users` VALUES (91, '800040', 1, 9, 'DESTIANA PAKPAHAN, M.M', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:07', NULL);
INSERT INTO `users` VALUES (92, '910174', 1, 9, 'ISTI NURUL SHOFYAH', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:07', NULL);
INSERT INTO `users` VALUES (93, '660436', 1, 9, 'DASE', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:07', NULL);
INSERT INTO `users` VALUES (94, '690403', 1, 9, 'ETTY SUHERTY', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:07', NULL);
INSERT INTO `users` VALUES (95, '670152', 1, 9, 'MUKHAMMAD IRFANI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:07', NULL);
INSERT INTO `users` VALUES (96, '670271', 1, 10, 'SONY BUDI WINARSO, MT', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:07', NULL);
INSERT INTO `users` VALUES (97, '910032', 1, 10, 'CLARACIA DINASTY', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:07', NULL);
INSERT INTO `users` VALUES (98, '870066', 1, 10, 'ANGGI FITRINING TYAS', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:07', NULL);
INSERT INTO `users` VALUES (99, '910210', 1, 10, 'DIAN PUTRI PUSPITASARI RACHMAN', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:07', NULL);
INSERT INTO `users` VALUES (100, '870032', 1, 10, 'EKADIAH FINANDIARSI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:07', NULL);
INSERT INTO `users` VALUES (101, '880085', 1, 10, 'DINI NUZULIA RAHMAH', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:07', NULL);
INSERT INTO `users` VALUES (102, '660381', 1, 10, 'SINGGIH WIDODO', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:07', NULL);
INSERT INTO `users` VALUES (103, '690405', 1, 11, 'HENDAWATI SUKAWIDJAJA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:07', NULL);
INSERT INTO `users` VALUES (104, '651026', 1, 11, 'DISRIZAL', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:07', NULL);
INSERT INTO `users` VALUES (105, '670070', 1, 11, 'FERRI YUDISTIRA S.A.', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:07', NULL);
INSERT INTO `users` VALUES (106, '960190', 1, 11, 'FAUZIA RAMADHANI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:07', NULL);
INSERT INTO `users` VALUES (107, '710039', 1, 11, 'MOH. TSAURI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:07', NULL);
INSERT INTO `users` VALUES (108, '930054', 1, 11, 'DIAN MASMAWATI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:07', NULL);
INSERT INTO `users` VALUES (109, '940288', 1, 11, 'IFTI RAHMANIA A. YASIN', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:07', NULL);
INSERT INTO `users` VALUES (110, '840110', 1, 11, 'MUTHIA RAMADHANIA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:07', NULL);
INSERT INTO `users` VALUES (111, '950221', 1, 11, 'KINTAN PERMATA DEROSE', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:07', NULL);
INSERT INTO `users` VALUES (112, '820007', 1, 11, 'MAWADDAH', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:07', NULL);
INSERT INTO `users` VALUES (113, '970145', 1, 11, 'RAHAYU EKA SULISTIYANI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:07', NULL);
INSERT INTO `users` VALUES (114, '950255', 1, 11, 'ANDINI PUTRI PAMUNGKAS', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:07', NULL);
INSERT INTO `users` VALUES (115, '651185', 1, 11, 'DRS. I NYOMAN SUGITA, MM.', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:07', NULL);
INSERT INTO `users` VALUES (116, '660055', 1, 11, 'ASEP DJUHARA HENDRAWAN', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:07', NULL);
INSERT INTO `users` VALUES (117, '910273', 1, 11, 'FIKA JULIA FIANDRIANI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:07', NULL);
INSERT INTO `users` VALUES (118, '680355', 1, 12, 'SUJITO', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:08', NULL);
INSERT INTO `users` VALUES (119, '651324', 1, 12, 'DAVIK OKTAVIAN', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:08', NULL);
INSERT INTO `users` VALUES (120, '720330', 1, 12, 'GAEANRI SITUMORANG', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:08', NULL);
INSERT INTO `users` VALUES (121, '720470', 1, 13, 'DODE SUPARMAN', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:08', NULL);
INSERT INTO `users` VALUES (122, '820078', 1, 13, 'DUDY RODIANSYAH', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:08', NULL);
INSERT INTO `users` VALUES (123, '950253', 1, 13, 'ULIL ALBAB RABBANI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:08', NULL);
INSERT INTO `users` VALUES (124, '960236', 1, 13, 'ARRUM PRIMA DEWI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:08', NULL);
INSERT INTO `users` VALUES (125, '940099', 1, 13, 'HERI MISBAH DIJAYA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:08', NULL);
INSERT INTO `users` VALUES (126, '970048', 1, 13, 'AMANINTIA SYAIRA AULIA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:08', NULL);
INSERT INTO `users` VALUES (127, '950238', 1, 13, 'ARI PRATAMA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:08', NULL);
INSERT INTO `users` VALUES (128, '890028', 1, 13, 'FERIDA ARYANTI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:08', NULL);
INSERT INTO `users` VALUES (129, '930004', 1, 13, 'TIARA YUNITA NURAMALINA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:08', NULL);
INSERT INTO `users` VALUES (130, '920164', 1, 13, 'BAGUS DWI SANDI PUTRA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:08', NULL);
INSERT INTO `users` VALUES (131, '670172', 1, 13, 'DODI LOSADA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:08', NULL);
INSERT INTO `users` VALUES (132, '680449', 1, 13, 'SYARIAH SAGALA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:08', NULL);
INSERT INTO `users` VALUES (133, '940091', 1, 13, 'LUTFI DWI SETYAWAN', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:08', NULL);
INSERT INTO `users` VALUES (134, '720245', 1, 13, 'SETYAWAN SUBAGYO, ST', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:08', NULL);
INSERT INTO `users` VALUES (135, '680365', 1, 13, 'ACHMAD SUWANDA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:08', NULL);
INSERT INTO `users` VALUES (136, '960046', 1, 13, 'AULIA MAULIDINA KUSUMAWARDANI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:08', NULL);
INSERT INTO `users` VALUES (137, '670513', 1, 13, 'YAYAT SUDRADJAT', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:08', NULL);
INSERT INTO `users` VALUES (138, '690390', 1, 13, 'MARJAN BAHTIAR', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:08', NULL);
INSERT INTO `users` VALUES (139, '680117', 1, 13, 'ELIN ANALIA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:08', NULL);
INSERT INTO `users` VALUES (140, '670515', 1, 13, 'HERI CUNIAWAN', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:08', NULL);
INSERT INTO `users` VALUES (141, '730175', 1, 13, 'AGUNG PRIYAMBODO, ST', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:08', NULL);
INSERT INTO `users` VALUES (142, '920074', 1, 13, 'MUHAMMAD FAUZAN ABDURRAHIM', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:08', NULL);
INSERT INTO `users` VALUES (143, '660598', 1, 13, 'ADIN TARDIN', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:08', NULL);
INSERT INTO `users` VALUES (144, '660095', 1, 13, 'IRAWAN', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:08', NULL);
INSERT INTO `users` VALUES (145, '660062', 1, 13, 'JULAEHA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:08', NULL);
INSERT INTO `users` VALUES (146, '950526', 1, 13, 'TAUFIK YUMNA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:08', NULL);
INSERT INTO `users` VALUES (147, '690296', 1, 13, 'GUNANDAR', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:08', NULL);
INSERT INTO `users` VALUES (148, '720100', 1, 13, 'NGADI, ST', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:08', NULL);
INSERT INTO `users` VALUES (149, '930065', 1, 13, 'ANNISA HARTIKA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:08', NULL);
INSERT INTO `users` VALUES (150, '650775', 1, 13, 'AGUNG ADI WIBOWO', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:08', NULL);
INSERT INTO `users` VALUES (151, '670457', 1, 13, 'ROHMAN', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:08', NULL);
INSERT INTO `users` VALUES (152, '840073', 1, 13, 'MIA PUTRI MALINDA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:08', NULL);
INSERT INTO `users` VALUES (153, '880098', 1, 13, 'SARY SARTIKA MANGIWA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:08', NULL);
INSERT INTO `users` VALUES (154, '920108', 1, 13, 'DANI HAMDANI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:08', NULL);
INSERT INTO `users` VALUES (155, '980016', 1, 13, 'ANISA EKA DESTIYANA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:08', NULL);
INSERT INTO `users` VALUES (156, '940408', 1, 13, 'NADHILA FAJRINA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:08', NULL);
INSERT INTO `users` VALUES (157, '840053', 1, 13, 'TENNY FARYANI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:08', NULL);
INSERT INTO `users` VALUES (158, '900090', 1, 13, 'SANDRO PIBA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:08', NULL);
INSERT INTO `users` VALUES (159, '890064', 1, 13, 'EKO SULISTYA RAMDANI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:08', NULL);
INSERT INTO `users` VALUES (160, '910185', 1, 13, 'ALDILA NOOR MEDINA UTANG', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:08', NULL);
INSERT INTO `users` VALUES (161, '960215', 1, 13, 'ASTRID MARION INDIANI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:08', NULL);
INSERT INTO `users` VALUES (162, '660390', 1, 13, 'POERTJAHJA DJATMIKA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:08', NULL);
INSERT INTO `users` VALUES (163, '960095', 1, 13, 'HANIFA ANINDITA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:08', NULL);
INSERT INTO `users` VALUES (164, '960224', 1, 13, 'SHASHANTI PADMA ASTARI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:08', NULL);
INSERT INTO `users` VALUES (165, '690061', 1, 13, 'IWAN', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:08', NULL);
INSERT INTO `users` VALUES (166, '670514', 1, 13, 'RACHMAT', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:08', NULL);
INSERT INTO `users` VALUES (167, '680453', 1, 13, 'DEDI SADIMAN', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:08', NULL);
INSERT INTO `users` VALUES (168, '670123', 1, 13, 'ASEP LESMANA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:08', NULL);
INSERT INTO `users` VALUES (169, '950230', 1, 13, 'DORY FERMANDO', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:08', NULL);
INSERT INTO `users` VALUES (170, '680071', 1, 13, 'SUHARIJONO', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:08', NULL);
INSERT INTO `users` VALUES (171, '940001', 1, 13, 'FEMI YUMNA ANJANI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:08', NULL);
INSERT INTO `users` VALUES (172, '940053', 1, 13, 'FAISHAL TANJUNG MAOLUDYO', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:08', NULL);
INSERT INTO `users` VALUES (173, '900082', 1, 13, 'ARLET YUSYA PUTRINDANI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:08', NULL);
INSERT INTO `users` VALUES (174, '920131', 1, 13, 'ROSA LESTARI FARDANI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:08', NULL);
INSERT INTO `users` VALUES (175, '660130', 1, 13, 'PAHKRUDDIN SIHALOHO', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:08', NULL);
INSERT INTO `users` VALUES (176, '710228', 1, 13, 'SRI LESTARI ANDAYANI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:08', NULL);
INSERT INTO `users` VALUES (177, '690404', 1, 13, 'INNA KARTINA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:08', NULL);
INSERT INTO `users` VALUES (178, '660185', 1, 13, 'DENNY KUSDINAR', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:09', NULL);
INSERT INTO `users` VALUES (179, '651383', 1, 13, 'EDI KUSNAEDI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:09', NULL);
INSERT INTO `users` VALUES (180, '660556', 1, 13, 'ENTIS', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:09', NULL);
INSERT INTO `users` VALUES (181, '840006', 1, 13, 'HALIMA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:09', NULL);
INSERT INTO `users` VALUES (182, '920196', 1, 13, 'NADIYYA HARUM KAMILAH NAKULA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:09', NULL);
INSERT INTO `users` VALUES (183, '910011', 1, 13, 'RIESYA RACHMASARIE', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:09', NULL);
INSERT INTO `users` VALUES (184, '660224', 1, 13, 'MAMAY  M. JUMARDI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:09', NULL);
INSERT INTO `users` VALUES (185, '920087', 1, 13, 'JOHAN GIFARI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:09', NULL);
INSERT INTO `users` VALUES (186, '910188', 1, 13, 'WIEDYA PERMATA PUTRI HAMID', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:09', NULL);
INSERT INTO `users` VALUES (187, '950145', 1, 13, 'MAESY', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:09', NULL);
INSERT INTO `users` VALUES (188, '730018', 1, 13, 'RADEN SITI FATIMAH', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:09', NULL);
INSERT INTO `users` VALUES (189, '710448', 1, 13, 'DADAN SYAMSUL BACHRO', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:09', NULL);
INSERT INTO `users` VALUES (190, '930019', 1, 13, 'NURI FAJARIYANAH', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:09', NULL);
INSERT INTO `users` VALUES (191, '910096', 1, 13, 'AMANDA YUDIANI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:09', NULL);
INSERT INTO `users` VALUES (192, '910029', 1, 13, 'RIZKY WILDAN PRATAMA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:09', NULL);
INSERT INTO `users` VALUES (193, '900018', 1, 13, 'PRATAMI ANGGINA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:09', NULL);
INSERT INTO `users` VALUES (194, '740218', 1, 13, 'DIAN RISDIANSAH', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:09', NULL);
INSERT INTO `users` VALUES (195, '960166', 1, 13, 'NURUL ARIFAH WAHYUNI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:09', NULL);
INSERT INTO `users` VALUES (196, '920351', 1, 13, 'ADI CANDRA SWASTIKA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:09', NULL);
INSERT INTO `users` VALUES (197, '890075', 1, 13, 'GELAR BAGJA ANUGRAH', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:09', NULL);
INSERT INTO `users` VALUES (198, '660600', 1, 13, 'ATEP KUSNADI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:09', NULL);
INSERT INTO `users` VALUES (199, '940179', 1, 14, 'EDWIN SANTOSA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:09', NULL);
INSERT INTO `users` VALUES (200, '660126', 1, 14, 'AGUS WIDODO', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:09', NULL);
INSERT INTO `users` VALUES (201, '950027', 1, 14, 'ARINDRA KARUNIA RAHMADHANI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:09', NULL);
INSERT INTO `users` VALUES (202, '930137', 1, 14, 'RADEN GELOMBANG ALAM NUSANTARA PUTRA HER', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:09', NULL);
INSERT INTO `users` VALUES (203, '720039', 1, 14, 'NENENG EKA RATNA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:09', NULL);
INSERT INTO `users` VALUES (204, '680091', 2, 14, 'DINDIN RAMDHANI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:09', NULL);
INSERT INTO `users` VALUES (205, '690176', 1, 14, 'SAEFULLAH', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:09', NULL);
INSERT INTO `users` VALUES (206, '700603', 1, 14, 'ABDUL MUCHLIS', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:09', NULL);
INSERT INTO `users` VALUES (207, '730553', 1, 14, 'SRI WIJAYANTI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:09', NULL);
INSERT INTO `users` VALUES (208, '960246', 1, 14, 'IGOR M. FARHAN', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:09', NULL);
INSERT INTO `users` VALUES (209, '680368', 1, 14, 'ZENAL MANSUR', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:09', NULL);
INSERT INTO `users` VALUES (210, '960102', 1, 14, 'SALMA NABILA HADI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:09', NULL);
INSERT INTO `users` VALUES (211, '670495', 1, 14, 'TRI WIYONO', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:09', NULL);
INSERT INTO `users` VALUES (212, '720369', 1, 14, 'IRFAN HUSAIN', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:09', NULL);
INSERT INTO `users` VALUES (213, '680328', 1, 14, 'SUHANDA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:09', NULL);
INSERT INTO `users` VALUES (214, '690481', 1, 14, 'ROHYADI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:09', NULL);
INSERT INTO `users` VALUES (215, '910201', 1, 14, 'GHANA GANDARA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:09', NULL);
INSERT INTO `users` VALUES (216, '660605', 1, 14, 'LILI SOMANTRI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:09', NULL);
INSERT INTO `users` VALUES (217, '660444', 1, 14, 'NANAN WIRYANA, IR, MT', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:10', NULL);
INSERT INTO `users` VALUES (218, '950405', 1, 14, 'SENDY ACHDIKA MAULANA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:10', NULL);
INSERT INTO `users` VALUES (219, '680298', 1, 14, 'ARIF MARGANA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:10', NULL);
INSERT INTO `users` VALUES (220, '660002', 1, 14, 'YAMAN', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:10', NULL);
INSERT INTO `users` VALUES (221, '710515', 1, 14, 'TEDI RUKMANTARA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:10', NULL);
INSERT INTO `users` VALUES (222, '730342', 1, 14, 'WAHYU WIDODO', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:10', NULL);
INSERT INTO `users` VALUES (223, '720228', 1, 14, 'FAZLIANSYAH', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:10', NULL);
INSERT INTO `users` VALUES (224, '940230', 1, 14, 'UNGU SIWI MAHARUNTI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:10', NULL);
INSERT INTO `users` VALUES (225, '720445', 1, 14, 'JAKA PRABAWA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:10', NULL);
INSERT INTO `users` VALUES (226, '650133', 1, 14, 'BUDHI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:10', NULL);
INSERT INTO `users` VALUES (227, '730496', 1, 14, 'TEGUH BUDI PRASAJO', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:10', NULL);
INSERT INTO `users` VALUES (228, '920125', 1, 14, 'ANISA FITRI SAFARINI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:10', NULL);
INSERT INTO `users` VALUES (229, '940186', 1, 14, 'FAHD FARRAS MAHMOD', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:10', NULL);
INSERT INTO `users` VALUES (230, '840187', 1, 14, 'SHINTA ANINDHITA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:10', NULL);
INSERT INTO `users` VALUES (231, '910099', 1, 14, 'RADEN ASRI MELINDA HAKIM', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:10', NULL);
INSERT INTO `users` VALUES (232, '730433', 1, 14, 'AGUS GOUSUR ALAM', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:10', NULL);
INSERT INTO `users` VALUES (233, '660472', 1, 14, 'YETTI HERLINA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:10', NULL);
INSERT INTO `users` VALUES (234, '710394', 1, 14, 'DENDEN RUKANDA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:10', NULL);
INSERT INTO `users` VALUES (235, '651385', 1, 14, 'DANI HERMAWAN', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:10', NULL);
INSERT INTO `users` VALUES (236, '680144', 1, 14, 'YANA SURYANA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:11', NULL);
INSERT INTO `users` VALUES (237, '651362', 1, 14, 'DANAN RIANTA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:11', NULL);
INSERT INTO `users` VALUES (238, '950317', 1, 14, 'NISA SALSABILA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:11', NULL);
INSERT INTO `users` VALUES (239, '720475', 1, 14, 'WAHYU SURYANTO', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:11', NULL);
INSERT INTO `users` VALUES (240, '680452', 1, 14, 'SULAEMAN', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:11', NULL);
INSERT INTO `users` VALUES (241, '730262', 1, 14, 'FEBRUARTO', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:11', NULL);
INSERT INTO `users` VALUES (242, '740002', 1, 14, 'HILMAN GUMILAR', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:11', NULL);
INSERT INTO `users` VALUES (243, '710499', 1, 14, 'SETYA WIBAWA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:11', NULL);
INSERT INTO `users` VALUES (244, '650096', 1, 14, 'ROSIANNA BR PURBA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:11', NULL);
INSERT INTO `users` VALUES (245, '940316', 1, 14, 'APUNG PRAKOSO HIDAYAT', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:11', NULL);
INSERT INTO `users` VALUES (246, '980015', 1, 14, 'FAIRUZ HABIBAH RAMDHANI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:11', NULL);
INSERT INTO `users` VALUES (247, '810049', 1, 14, 'RIZKI PUSPITASARI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:11', NULL);
INSERT INTO `users` VALUES (248, '890070', 1, 14, 'SULHAN SAURI NASUTION', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:11', NULL);
INSERT INTO `users` VALUES (249, '940402', 1, 14, 'RIFA RIZKA ANISAH', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:11', NULL);
INSERT INTO `users` VALUES (250, '660158', 1, 14, 'AGUS USMAN', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:11', NULL);
INSERT INTO `users` VALUES (251, '650470', 1, 14, 'ONENG RESMAYATI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:11', NULL);
INSERT INTO `users` VALUES (252, '680119', 1, 14, 'SRI ROSANTI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:11', NULL);
INSERT INTO `users` VALUES (253, '700456', 1, 14, 'ERNI KUSTININGSIH', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:11', NULL);
INSERT INTO `users` VALUES (254, '960245', 1, 14, 'HANNI NOVITASARI TANDIARI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:11', NULL);
INSERT INTO `users` VALUES (255, '790121', 1, 14, 'R. KIKI ERIK HERMAYA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:11', NULL);
INSERT INTO `users` VALUES (256, '940134', 1, 14, 'SINTA AULIA UTAMI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:11', NULL);
INSERT INTO `users` VALUES (257, '930293', 1, 14, 'DENDY SUARISTA SURYANEGARA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:11', NULL);
INSERT INTO `users` VALUES (258, '940440', 1, 14, 'BASTIAN RAMADHAN, SST., M.T.', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:11', NULL);
INSERT INTO `users` VALUES (259, '920083', 1, 14, 'MELATI BUDIANA PUTRI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:11', NULL);
INSERT INTO `users` VALUES (260, '651517', 1, 14, 'ENJANG SUMITRA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:11', NULL);
INSERT INTO `users` VALUES (261, '950236', 1, 14, 'DWI KRESNA WIJAYA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:11', NULL);
INSERT INTO `users` VALUES (262, '970008', 1, 14, 'MENTARI RIZKI AMELIA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:11', NULL);
INSERT INTO `users` VALUES (263, '950457', 1, 14, 'IRMA YUNINGSIH', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:11', NULL);
INSERT INTO `users` VALUES (264, '660529', 1, 14, 'JAJA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:11', NULL);
INSERT INTO `users` VALUES (265, '670085', 1, 15, 'LINSON PARLINDUNGAN SITOMPUL', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:11', NULL);
INSERT INTO `users` VALUES (266, '950114', 1, 15, 'LUQMAN ABDUL HAKIM', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:11', NULL);
INSERT INTO `users` VALUES (267, '930448', 1, 15, 'MUSTIKA HAQQI ARASY', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:11', NULL);
INSERT INTO `users` VALUES (268, '670016', 1, 15, 'DANA SANTOSA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:11', NULL);
INSERT INTO `users` VALUES (269, '690591', 1, 15, 'AIDIL FITRIANSYAH', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:11', NULL);
INSERT INTO `users` VALUES (270, '920093', 1, 15, 'AULIYA ANNISA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:11', NULL);
INSERT INTO `users` VALUES (271, '670124', 1, 15, 'AGUNG SETIYONO', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:11', NULL);
INSERT INTO `users` VALUES (272, '930187', 1, 15, 'MUHAMMAD NAUFAL FARID', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:11', NULL);
INSERT INTO `users` VALUES (273, '690300', 1, 15, 'MAMAN KOSTAMAN', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:11', NULL);
INSERT INTO `users` VALUES (274, '960207', 1, 15, 'TSANIYA SILMI RIVAI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:11', NULL);
INSERT INTO `users` VALUES (275, '860147', 1, 15, 'AGEAK RAPORTE BERMANO', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:11', NULL);
INSERT INTO `users` VALUES (276, '700457', 1, 15, 'DEWI SUPRIYATNI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:11', NULL);
INSERT INTO `users` VALUES (277, '940416', 1, 15, 'DIMAS ADHITAMA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:12', NULL);
INSERT INTO `users` VALUES (278, '730508', 1, 15, 'RINDANG CAHYADI, ST', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:12', NULL);
INSERT INTO `users` VALUES (279, '690446', 1, 15, 'MUHAMMAD FARIKHIN', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:12', NULL);
INSERT INTO `users` VALUES (280, '690574', 1, 15, 'KUSWORO', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:12', NULL);
INSERT INTO `users` VALUES (281, '710242', 1, 15, 'TRIE SETIAWATY', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:12', NULL);
INSERT INTO `users` VALUES (282, '930239', 1, 15, 'RYANO SATRIADI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:12', NULL);
INSERT INTO `users` VALUES (283, '710229', 1, 15, 'IDA FARIDA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:12', NULL);
INSERT INTO `users` VALUES (284, '940329', 1, 15, 'DIATI LEVI PUTRI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:12', NULL);
INSERT INTO `users` VALUES (285, '910012', 1, 15, 'MONICA DEWI SOEJANTONO', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:12', NULL);
INSERT INTO `users` VALUES (286, '660604', 1, 15, 'ALOYSIUS SUBARKAH NITISASTRO', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:12', NULL);
INSERT INTO `users` VALUES (287, '940450', 1, 15, 'SUDARSONO', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:12', NULL);
INSERT INTO `users` VALUES (288, '670024', 1, 15, 'KUSTANTO', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:12', NULL);
INSERT INTO `users` VALUES (289, '710227', 1, 15, 'HERYANI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:12', NULL);
INSERT INTO `users` VALUES (290, '670445', 1, 15, 'SLAMET', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:12', NULL);
INSERT INTO `users` VALUES (291, '660072', 1, 15, 'FADILA TJIPTO', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:12', NULL);
INSERT INTO `users` VALUES (292, '670512', 1, 15, 'ASEP TARYO', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:12', NULL);
INSERT INTO `users` VALUES (293, '950459', 1, 15, 'INDRA ALFIANTO', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:12', NULL);
INSERT INTO `users` VALUES (294, '690115', 1, 15, 'HARYANTO', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:12', NULL);
INSERT INTO `users` VALUES (295, '730253', 1, 15, 'AANG DARMAWANGSA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:12', NULL);
INSERT INTO `users` VALUES (296, '970096', 1, 15, 'AZHARA AZIZA RAHANDA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:12', NULL);
INSERT INTO `users` VALUES (297, '690173', 1, 15, 'NANA KUSMANA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:12', NULL);
INSERT INTO `users` VALUES (298, '700210', 1, 15, 'SUPRIADI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:12', NULL);
INSERT INTO `users` VALUES (299, '660111', 1, 15, 'UTUY KUSWANDA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:12', NULL);
INSERT INTO `users` VALUES (300, '680484', 1, 15, 'AENG SUHARTO', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:12', NULL);
INSERT INTO `users` VALUES (301, '660624', 1, 15, 'AGUS SUTARMAN', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:12', NULL);
INSERT INTO `users` VALUES (302, '690293', 1, 16, 'SIGIT SHALAKO ABDURAJAK', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:12', NULL);
INSERT INTO `users` VALUES (303, '940277', 1, 16, 'MUHAMMAD KHAERUL ANAM', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:12', NULL);
INSERT INTO `users` VALUES (304, '960122', 1, 16, 'INTAN SALSABILA FIRMAN', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:12', NULL);
INSERT INTO `users` VALUES (305, '720424', 1, 16, 'HERI SAKTIANTO', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:12', NULL);
INSERT INTO `users` VALUES (306, '700575', 1, 16, 'DEDEN SUDRAJAT', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:12', NULL);
INSERT INTO `users` VALUES (307, '680331', 1, 16, 'ADE ROZALI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:12', NULL);
INSERT INTO `users` VALUES (308, '710341', 1, 16, 'EUSIBIUS SUGIO SUSILO', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:12', NULL);
INSERT INTO `users` VALUES (309, '690428', 1, 16, 'GENTUR WISANGGONO', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:12', NULL);
INSERT INTO `users` VALUES (310, '930192', 1, 16, 'NOVANDIET EERSTA ANGGINANDA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:12', NULL);
INSERT INTO `users` VALUES (311, '710315', 1, 16, 'SARI TEJOWATI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:12', NULL);
INSERT INTO `users` VALUES (312, '910160', 1, 16, 'RIZAL RUSTIO', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:12', NULL);
INSERT INTO `users` VALUES (313, '950038', 1, 16, 'MUHAMMAD SAHIRUL ALIM', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:12', NULL);
INSERT INTO `users` VALUES (314, '810119', 1, 16, 'NOVAN RESTU PRAMONO', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:12', NULL);
INSERT INTO `users` VALUES (315, '900087', 1, 16, 'RIFKI SINTAMI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:12', NULL);
INSERT INTO `users` VALUES (316, '710063', 1, 16, 'MUHAMAD SARIFUDIN', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:12', NULL);
INSERT INTO `users` VALUES (317, '680581', 1, 16, 'TITIK SUMARTINI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:12', NULL);
INSERT INTO `users` VALUES (318, '700302', 1, 16, 'WAGIMAN', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:12', NULL);
INSERT INTO `users` VALUES (319, '700493', 1, 16, 'OYOK ROSIDI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:12', NULL);
INSERT INTO `users` VALUES (320, '960234', 1, 16, 'FAHMI AFIFI UTAMA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:12', NULL);
INSERT INTO `users` VALUES (321, '680297', 1, 16, 'TRIHARI PRIYANTHO', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:12', NULL);
INSERT INTO `users` VALUES (322, '680508', 1, 16, 'PATONI ABDULAH MAS\'UD', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:12', NULL);
INSERT INTO `users` VALUES (323, '940169', 1, 16, 'ADITYA INDRA BAGASKARA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:13', NULL);
INSERT INTO `users` VALUES (324, '680385', 1, 16, 'KASUM', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:13', NULL);
INSERT INTO `users` VALUES (325, '700476', 1, 16, 'KUSHARTONO', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:13', NULL);
INSERT INTO `users` VALUES (326, '690568', 2, 16, 'SULISTYO', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:13', NULL);
INSERT INTO `users` VALUES (327, '700080', 1, 16, 'DJOKO PURNOMO', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:13', NULL);
INSERT INTO `users` VALUES (328, '910168', 1, 16, 'AGUNG MEINASTESI CAESAR', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:13', NULL);
INSERT INTO `users` VALUES (329, '700459', 2, 16, 'SRI MULYATI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:13', NULL);
INSERT INTO `users` VALUES (330, '660059', 1, 16, 'DEDI ACHMAD HIDAYAT', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:13', NULL);
INSERT INTO `users` VALUES (331, '950276', 1, 16, 'SELLA GABRELIAN MAHARANI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:13', NULL);
INSERT INTO `users` VALUES (332, '730444', 1, 16, 'AGUS SATRIAWAN', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:13', NULL);
INSERT INTO `users` VALUES (333, '960222', 1, 16, 'YASYA DWINIDA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:13', NULL);
INSERT INTO `users` VALUES (334, '690391', 1, 17, 'EDI KURNIA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:13', NULL);
INSERT INTO `users` VALUES (335, '720009', 1, 17, 'ARIZONA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:13', NULL);
INSERT INTO `users` VALUES (336, '930098', 1, 17, 'ULFA NOVITA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:13', NULL);
INSERT INTO `users` VALUES (337, '710440', 1, 17, 'ACENG AJID', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:13', NULL);
INSERT INTO `users` VALUES (338, '960104', 1, 17, 'MUHAMAD FAZRUR RIZAL', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:13', NULL);
INSERT INTO `users` VALUES (339, '950369', 1, 17, 'BAGUS SATRIYO WIBOWO', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:13', NULL);
INSERT INTO `users` VALUES (340, '650129', 1, 17, 'ASEP ROSIDI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:13', NULL);
INSERT INTO `users` VALUES (341, '870061', 1, 17, 'SANDI FUJIYANA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:13', NULL);
INSERT INTO `users` VALUES (342, '950146', 1, 17, 'LATHIFUDDIN FIRAS NURSETO', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:13', NULL);
INSERT INTO `users` VALUES (343, '651520', 1, 17, 'SUDARSONO', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:13', NULL);
INSERT INTO `users` VALUES (344, '780013', 1, 17, 'DONALD ROMALDY BARTELS', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:13', NULL);
INSERT INTO `users` VALUES (345, '930179', 1, 17, 'M. REZA AULIA KHAFID', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:13', NULL);
INSERT INTO `users` VALUES (346, '651079', 1, 17, 'AJAT SUDRAJAT', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:13', NULL);
INSERT INTO `users` VALUES (347, '960053', 1, 17, 'REZA TRIANTO', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:13', NULL);
INSERT INTO `users` VALUES (348, '730502', 1, 17, 'FERRY ZULJANNA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:13', NULL);
INSERT INTO `users` VALUES (349, '650860', 1, 17, 'SUGIHARTO', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:13', NULL);
INSERT INTO `users` VALUES (350, '970058', 1, 17, 'ADITYA RIZKI FAUZI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:13', NULL);
INSERT INTO `users` VALUES (351, '960212', 1, 17, 'IQBAL FIRDA RUSDIANSYAH', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:13', NULL);
INSERT INTO `users` VALUES (352, '720450', 1, 17, 'SUSANTI NATALIA RETNAWATI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:13', NULL);
INSERT INTO `users` VALUES (353, '910140', 1, 17, 'DWI RAMADHANI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:13', NULL);
INSERT INTO `users` VALUES (354, '710041', 1, 17, 'MUCHARAMSYAH', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:13', NULL);
INSERT INTO `users` VALUES (355, '690295', 1, 17, 'PEPEN SETIANA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:13', NULL);
INSERT INTO `users` VALUES (356, '710023', 1, 17, 'AGUS TOHARI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:13', NULL);
INSERT INTO `users` VALUES (357, '730538', 1, 17, 'BAMBANG SUKRISNO PRASETYO ADHI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:13', NULL);
INSERT INTO `users` VALUES (358, '700331', 1, 17, 'MISBAH', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:13', NULL);
INSERT INTO `users` VALUES (359, '700340', 1, 17, 'SYAMSUL FAJRI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:13', NULL);
INSERT INTO `users` VALUES (360, '710453', 1, 17, 'MARVEN AIRES', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:13', NULL);
INSERT INTO `users` VALUES (361, '690082', 1, 18, 'WIDIATMOKO', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:13', NULL);
INSERT INTO `users` VALUES (362, '660513', 1, 18, 'BAMBANG AGUS SUSILO', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:13', NULL);
INSERT INTO `users` VALUES (363, '651519', 1, 18, 'ADE HIDAYAT', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:13', NULL);
INSERT INTO `users` VALUES (364, '720334', 1, 18, 'KRISDIAN', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:13', NULL);
INSERT INTO `users` VALUES (365, '970046', 1, 18, 'SYIFA HANIFAH', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:13', NULL);
INSERT INTO `users` VALUES (366, '660599', 1, 18, 'LEO DANDUN BINTORO', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:13', NULL);
INSERT INTO `users` VALUES (367, '730191', 1, 18, 'HERI KURNIAWAN', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:13', NULL);
INSERT INTO `users` VALUES (368, '930300', 1, 18, 'MUHAMMAD REZA PAHLEVI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:14', NULL);
INSERT INTO `users` VALUES (369, '970042', 1, 18, 'RIZKY SAM RAMADHAN', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:14', NULL);
INSERT INTO `users` VALUES (370, '830086', 1, 18, 'DITO BARATA JUNANTO', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:14', NULL);
INSERT INTO `users` VALUES (371, '970050', 1, 18, 'ABDUL KHAMID RIDWANUDDIN', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:14', NULL);
INSERT INTO `users` VALUES (372, '820017', 1, 18, 'LENGKA TSANI ALIYATI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:14', NULL);
INSERT INTO `users` VALUES (373, '950449', 1, 18, 'SHABRINA ZHAFARINA HADIWIJAYA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:14', NULL);
INSERT INTO `users` VALUES (374, '651522', 1, 18, 'EMAN SURYAJAYA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:14', NULL);
INSERT INTO `users` VALUES (375, '650122', 1, 18, 'DADANG SAMAS', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:14', NULL);
INSERT INTO `users` VALUES (376, '940146', 1, 18, 'FIRMAN ADENDRO SASOTYO', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:14', NULL);
INSERT INTO `users` VALUES (377, '680494', 1, 18, 'YUDI RUSTANDI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:14', NULL);
INSERT INTO `users` VALUES (378, '920058', 2, 18, 'METHA MARTINA HERDIANI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:14', NULL);
INSERT INTO `users` VALUES (379, '810002', 1, 18, 'SISWONO, S. Kom', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:14', NULL);
INSERT INTO `users` VALUES (380, '651516', 1, 18, 'DADANG WAHYU', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:14', NULL);
INSERT INTO `users` VALUES (381, '690152', 1, 18, 'ACENG SUPRIATNA', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:14', NULL);
INSERT INTO `users` VALUES (382, '940297', 1, 18, 'CHRISTINE RISMA MANIK SIHOTANG', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:14', NULL);
INSERT INTO `users` VALUES (383, '860055', 1, 18, 'AYESHA RACHMA HARDIYANI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:14', NULL);
INSERT INTO `users` VALUES (384, '950246', 1, 18, 'NATALIA TIARA PERMATA PUTRI', NULL, '2021-11-09 15:24:22', '$2y$10$hHPUYxBxKsP78eln15w/He3JyRzHDjPPrYl429OcdE8vWKggmJac.', NULL, NULL, NULL, 'material', '2021-11-09 15:20:14', NULL);

SET FOREIGN_KEY_CHECKS = 1;
