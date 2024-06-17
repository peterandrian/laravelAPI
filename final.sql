-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.32-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for dbapi
CREATE DATABASE IF NOT EXISTS `dbapi` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `dbapi`;

-- Dumping structure for table dbapi.cache
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table dbapi.cache: ~0 rows (approximately)

-- Dumping structure for table dbapi.cache_locks
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table dbapi.cache_locks: ~0 rows (approximately)

-- Dumping structure for table dbapi.drones
CREATE TABLE IF NOT EXISTS `drones` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `drone_name` text NOT NULL,
  `producer` varchar(100) DEFAULT NULL,
  `production_year` varchar(4) DEFAULT NULL,
  `cover` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `price` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(10) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table dbapi.drones: ~18 rows (approximately)
INSERT INTO `drones` (`id`, `drone_name`, `producer`, `production_year`, `cover`, `description`, `price`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`) VALUES
	(1, 'DJI Mavic 3 Pro', 'DJI', '2023', 'https://cdn0-production-images-kly.akamaized.net/4V5JZKCGx-8t-Fb6opLk5U0Emg0=/1200x900/smart/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/4409692/original/080932400_1682736717-Mavic_3_Pro.jpg', 'DJI Mavic 3 Pro is a triple-lens flagship camera drone with multiple focal lengths. Mavic 3 Pro has a 4/3 CMOS Hasselblad camera and dual tele cameras.', 250, '2024-06-05 11:26:52', NULL, '2024-06-17 00:55:56', NULL, NULL, NULL),
	(2, 'DJI Mavic 3 Classic', 'DJI', '2022', 'https://i.ytimg.com/vi/MM97gKF6pGo/maxresdefault.jpg', 'DJI Mavic 3 Classic features a 4/3 CMOS Hasselblad camera, offering excellent imaging quality for professional photography and videography.', 150, '2024-06-17 00:58:50', NULL, '2024-06-17 00:58:50', NULL, NULL, NULL),
	(3, 'Aerodyne Altura Zenith', 'Malaysian Aerodyne', '2023', 'https://aeromind.pl/eng_pl_Altura-Zenith-2916_1.jpg', 'Aerodyne Altura Zenith is a versatile drone designed for industrial inspections, surveying, and mapping with high payload capacity.', 250, '2024-06-17 00:59:28', NULL, '2024-06-17 01:00:42', NULL, NULL, NULL),
	(4, 'Terra Drone Terra Wing', 'TerraDrone', '2022', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoQSMZ7vUFYkFrZiYTci10oqoROo52g_BG6A&s', 'Terra Drone Terra Wing is an advanced fixed-wing drone for large-scale surveying and mapping, providing high accuracy and efficiency.', 300, '2024-06-17 00:59:56', NULL, '2024-06-17 00:59:56', NULL, NULL, NULL),
	(5, 'Cyberhawk Sentinel Pro', 'Cyberhawk', '2023', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgCSgtN4ZcuJ2wBp87jB3RPN4wffqfrdpqUg&s', 'Cyberhawk Sentinel Pro is designed for high-precision industrial inspections and surveys, equipped with advanced sensors and imaging technology.', 200, '2024-06-17 01:01:28', NULL, '2024-06-17 01:01:28', NULL, NULL, NULL),
	(6, 'DJI Inspire 3', 'DJI', '2023', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1p0aAWhSP1xFaSP3dRxqH1fjBCXzwE0AeFg&s', 'DJI Inspire 3 is a professional filmmaking drone that offers 8K video recording, advanced obstacle avoidance, and a dual-operator mode.', 300, '2024-06-17 01:02:46', NULL, '2024-06-17 01:02:46', NULL, NULL, NULL),
	(7, 'Aerodyne Skybox', 'Malaysian Aerodyne', '2022', 'https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//104/MTA-2888393/skybox_receiver-skybox-a1-new_full02.jpg', 'Aerodyne Skybox is designed for precision agriculture, environmental monitoring, and infrastructure inspections with high-resolution sensors.', 180, '2024-06-17 01:03:45', NULL, '2024-06-17 03:22:56', NULL, NULL, NULL),
	(8, 'Cyberhawk Falcon 8+', 'Cyberhawk', '2022', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQASidrGhsPIu-5xT5FQF5rIKcM_vzAdD65cg&s\r\n', 'Cyberhawk Falcon 8+ is an industrial-grade drone designed for inspection and surveying with a robust design and high-quality imaging sensors.', 239, '2024-06-17 01:31:30', NULL, '2024-06-17 01:31:30', NULL, NULL, NULL),
	(9, 'DJI Matrice 300 RTK', 'DJI', '2023', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDCfN1JaqB1IWfFDKEo6iHb82ae4InoSE2xw&s', 'DJI Matrice 300 RTK is an advanced industrial drone with a 55-minute flight time, AI capabilities, and a range of payload options for various applications.', 600, '2024-06-17 01:34:10', NULL, '2024-06-17 01:34:10', NULL, NULL, NULL),
	(10, 'DJI Air 2S', 'DJI', '2021', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQjVZ1zgZh_dCJTls2ivGw43cpMJSyROf9ZA&s', 'DJI Air 2S features a 1-inch CMOS sensor, 5.4K video, and intelligent shooting modes, making it a versatile drone for both photography and videography.', 159, '2024-06-17 01:37:08', NULL, '2024-06-17 01:37:08', NULL, NULL, NULL),
	(11, 'DJI Mini 3 Pro', 'DJI', '2022', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTMDl7QS1hKtpb5IU-RfceEe9GzqhFfp8NPxw&s', 'DJI Mini 3 Pro is an ultra-light and portable drone with advanced features, including 4K HDR video, intelligent flight modes, and extended battery life.', 99, '2024-06-17 01:37:33', NULL, '2024-06-17 01:37:33', NULL, NULL, NULL),
	(12, 'DJI Phantom 4 Pro V2.0', 'DJI', '2020', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxAyAKOqUUBOXfy0OxTRZK6caHanwmoE99nQ&s', 'DJI Phantom 4 Pro V2.0 is equipped with a 1-inch 20MP sensor, capable of shooting 4K/60fps video, with improved obstacle sensing and transmission systems.', 279, '2024-06-17 01:37:50', NULL, '2024-06-17 01:37:50', NULL, NULL, NULL),
	(13, 'DJI FPV Combo', 'DJI', '2021', 'https://cdn.eraspace.com/media/catalog/product/d/j/dji_fpv_combo_4.jpg', 'DJI FPV Combo provides an immersive flight experience with high-speed performance, 4K/60fps video, and advanced safety features for a thrilling drone experience.', 339, '2024-06-17 01:38:09', NULL, '2024-06-17 01:38:09', NULL, NULL, NULL),
	(14, 'DJI Matrice 30', 'DJI', '2023', 'https://halorobotics.com/v2/wp-content/uploads/2022/11/DJI-Matrice-30-M30-Halo-Robotics.jpg', 'DJI Matrice 30 is an industrial-grade drone designed for a wide range of applications, featuring high endurance, advanced AI capabilities, and multiple payload options.', 600, '2024-06-17 01:38:20', NULL, '2024-06-17 01:38:20', NULL, NULL, NULL),
	(15, 'DJI Mavic Air 2', 'DJI', '2020', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRSiTohsHHcuJs4CpfHoeKjb4AdftuRiC1Mig&s', 'DJI Mavic Air 2 combines powerful features in a compact design, with 48MP photos, 4K/60fps video, and intelligent shooting modes for creative content.', 249, '2024-06-17 01:38:35', NULL, '2024-06-17 01:38:35', NULL, NULL, NULL),
	(16, 'DJI Mavic Mini 2', 'DJI', '2020', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQG-qFLWvMDUlk4ON59aH8pVsMEj-YtbJr2gw&s', 'DJI Mavic Mini 2 offers enhanced imaging capabilities, including 4K video, improved wind resistance, and an ultra-lightweight design for easy portability.', 1000, '2024-06-17 01:38:47', NULL, '2024-06-17 01:38:47', NULL, NULL, NULL),
	(17, 'DJI Phantom 4 RTK', 'DJI', '2019', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfFROyBCbaNtlPaxqBpm0Wd8hqxLKzZKJMBw&s', 'DJI Phantom 4 RTK is designed for high-precision aerial mapping and surveying, equipped with a centimeter-level positioning system and a 20MP sensor.', 125, '2024-06-17 01:39:01', NULL, '2024-06-17 01:39:01', NULL, NULL, NULL);

-- Dumping structure for table dbapi.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table dbapi.failed_jobs: ~0 rows (approximately)

-- Dumping structure for table dbapi.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table dbapi.jobs: ~0 rows (approximately)

-- Dumping structure for table dbapi.job_batches
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table dbapi.job_batches: ~0 rows (approximately)

-- Dumping structure for table dbapi.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table dbapi.migrations: ~9 rows (approximately)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '0001_01_01_000000_create_users_table', 1),
	(2, '0001_01_01_000001_create_cache_table', 1),
	(3, '0001_01_01_000002_create_jobs_table', 1),
	(4, '2024_05_19_201858_create_personal_access_tokens_table', 2),
	(5, '2024_05_27_101302_create_oauth_auth_codes_table', 3),
	(6, '2024_05_27_101303_create_oauth_access_tokens_table', 3),
	(7, '2024_05_27_101304_create_oauth_refresh_tokens_table', 3),
	(8, '2024_05_27_101305_create_oauth_clients_table', 3),
	(9, '2024_05_27_101306_create_oauth_personal_access_clients_table', 3);

-- Dumping structure for table dbapi.oauth_access_tokens
CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table dbapi.oauth_access_tokens: ~13 rows (approximately)
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
	('01a781595da0aa3afff9bbf8da65abee5476e70eb731c49728fa6621c11c49f8b17fb8cddd7f209a', 5, 1, 'All Yours', '[]', 0, '2024-06-17 03:20:43', '2024-06-17 03:20:43', '2024-12-17 10:20:43'),
	('111c6629640994177a7b2a7d0048700aa3f19e423df70573afd305718f92d86209de2603b12d8dbf', 3, 1, 'All Yours', '[]', 0, '2024-06-17 03:06:32', '2024-06-17 03:06:32', '2024-12-17 10:06:32'),
	('254be5b12db24fdb8087e9ae7deea219c8934be0fa95ec98f14275afe6e600652f57be1b2007993c', 2, 1, 'All Yours', '[]', 1, '2024-06-17 00:33:33', '2024-06-17 02:16:46', '2024-12-17 07:33:33'),
	('26b68d0092e180e5c7eb9c8ddf904f9d506c43d7684c7d901f9838d6feb839c4d24f111216ed1056', 4, 1, 'All Yours', '[]', 0, '2024-06-17 03:13:22', '2024-06-17 03:13:22', '2024-12-17 10:13:22'),
	('3d4d9077966e995ccce8818dfb70334f4482377f86cb864f62bace7e2f6eb9691f11fc216bf57dfc', 1, 1, 'All Yours', '[]', 0, '2024-06-04 02:31:33', '2024-06-04 02:31:35', '2024-12-04 09:31:33'),
	('44178e77b300cb85cd97c3f2567561f16a82b1711b793d4fe68866a5a46fb8ad4ec302771fba5b8f', 1, 1, 'All Yours', '[]', 0, '2024-06-17 03:04:37', '2024-06-17 03:04:40', '2024-12-17 10:04:37'),
	('74473e2937e39730342f7f389ce56e2053603c1887319caa8840fc4d9166f33290971a6e17a82496', 1, 1, 'All Yours', '[]', 0, '2024-06-05 11:26:30', '2024-06-05 11:26:31', '2024-12-05 18:26:30'),
	('ab1cbb90ab8780d937013adc211d8218396a9a9da6ed24b1718cc05c0985a394a12cf1dd439ce6c1', 1, 1, 'All Yours', '[]', 0, '2024-05-29 05:37:03', '2024-05-29 05:37:05', '2024-11-29 12:37:03'),
	('bc8c062a76f9496b6b749a27d898f08d1cd3b577361cf801cb49028839002de2af2fdd8a39717b0e', 1, 1, 'All Yours', '[]', 0, '2024-06-04 08:06:28', '2024-06-04 08:06:30', '2024-12-04 15:06:28'),
	('bdb8d1c1db8fc719b49632576ef596844eb44a3885413e93a02569783208f9074721890159c189c2', 1, 1, 'All Yours', '[]', 0, '2024-06-05 11:13:56', '2024-06-05 11:13:58', '2024-12-05 18:13:56'),
	('dada25bd2ddf46baf194411652b918d1a21609f641cb82ca3084dd38742b605c99eea0d5732aede9', 3, 1, 'All Yours', '[]', 0, '2024-06-17 03:07:10', '2024-06-17 03:07:10', '2024-12-17 10:07:10'),
	('e3d56b8e93ecd5aaf6a2bc34002fb62fea47b4c2fb5fd6b5dcaad43896d0820a6b6e9efe0e0a7519', 1, 1, 'All Yours', '[]', 0, '2024-06-04 08:40:45', '2024-06-04 08:40:46', '2024-12-04 15:40:45'),
	('ec4dc2fb71f8bf2b142e070e8c597696f7460cb0650ac80637f0792add7a5ed83065abbfc3d8abb3', 1, 1, 'All Yours', '[]', 0, '2024-06-17 00:54:34', '2024-06-17 00:54:35', '2024-12-17 07:54:34');

-- Dumping structure for table dbapi.oauth_auth_codes
CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table dbapi.oauth_auth_codes: ~0 rows (approximately)

-- Dumping structure for table dbapi.oauth_clients
CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table dbapi.oauth_clients: ~2 rows (approximately)
INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
	(1, NULL, 'Laravel Personal Access Client', 'HRLymXu3ploqBLusSuLj6w6RZNjBTUog9naWQk7F', NULL, 'http://localhost', 1, 0, 0, '2024-05-27 03:13:48', '2024-05-27 03:13:48'),
	(2, NULL, 'Laravel Password Grant Client', 'FtRwptnieW1Kx1eTaQiJvNJp3E7QuZGIDIaysdyk', 'users', 'http://localhost', 0, 1, 0, '2024-05-27 03:13:48', '2024-05-27 03:13:48');

-- Dumping structure for table dbapi.oauth_personal_access_clients
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table dbapi.oauth_personal_access_clients: ~0 rows (approximately)
INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
	(1, 1, '2024-05-27 03:13:48', '2024-05-27 03:13:48');

-- Dumping structure for table dbapi.oauth_refresh_tokens
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table dbapi.oauth_refresh_tokens: ~0 rows (approximately)

-- Dumping structure for table dbapi.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table dbapi.password_reset_tokens: ~0 rows (approximately)

-- Dumping structure for table dbapi.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table dbapi.personal_access_tokens: ~0 rows (approximately)

-- Dumping structure for table dbapi.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table dbapi.sessions: ~1 rows (approximately)
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('1SQs3yVTg5vJ2CxG9TyZkOmaVupPiHKHFp0KFu9S', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiczhrV3lyRWU4U0RmRFBBeE9HN3YzOThwOUJiNmlwcnQ4WWRDRDc5aCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kcm9uZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1718619953);

-- Dumping structure for table dbapi.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table dbapi.users: ~5 rows (approximately)
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Peter Andrian Priestley', 'peterandrianpriestley@gmail.com', NULL, '$2y$12$1iLS5pggVLcLAt4l5IRzGOM1WfC3KiU2Ti3XVYdBdKMJ3ZHDWWg4G', NULL, '2024-05-29 05:36:57', '2024-05-29 05:36:57'),
	(2, 'peter', 'tes@gmail.com', NULL, '$2y$12$STxIY2/k2p.z3jc2Xqrn8uGC5uzZm5bl5n26vEJKRKeztqmiGapLK', NULL, '2024-06-17 00:33:28', '2024-06-17 00:33:28'),
	(3, 'Peter Andrian', 'peterandrian@gmail.com', NULL, '$2y$12$9yskMSuujMS9ivr3IvOpy.r30qYqzyhWrv29ztEpQcihTKX0zAQO2', NULL, '2024-06-17 03:06:32', '2024-06-17 03:06:32'),
	(4, 'Peter Andrian', 'peterandrianp@gmail.com', NULL, '$2y$12$KCDcymyimSEFBJKDBZOLoeIfj4oJHqy/5kZ/4.xohscYTXNuMo0s.', NULL, '2024-06-17 03:13:21', '2024-06-17 03:13:21'),
	(5, 'Peter Andrian', 'peter@gmail.com', NULL, '$2y$12$wyaJMLrZwu738WdWtv8PV.rU0bYlh60vffbQY5l/5HB1x5BaGSRp.', NULL, '2024-06-17 03:20:42', '2024-06-17 03:20:42');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
