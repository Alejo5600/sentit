-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-09-2021 a las 20:48:46
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sentit`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cities`
--

CREATE TABLE `cities` (
  `city_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cities`
--

INSERT INTO `cities` (`city_id`, `name`, `code`, `created_at`, `updated_at`) VALUES
(1, 'Pereira', '660001', NULL, NULL),
(2, 'Medellín', '050002', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `customers`
--

CREATE TABLE `customers` (
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `document` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `customers`
--

INSERT INTO `customers` (`customer_id`, `name`, `surname`, `document`, `created_at`, `updated_at`) VALUES
(1, 'Juan', 'Perez', '1088779425', NULL, NULL),
(2, 'Luisa Maria', 'Muñoz', '1088299818', NULL, NULL),
(3, 'Manuel', 'Quick', '1088300834', '2021-09-03 04:30:05', '2021-09-03 04:30:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `customer_addresses`
--

CREATE TABLE `customer_addresses` (
  `customer_address_id` bigint(20) UNSIGNED NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `city_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `customer_addresses`
--

INSERT INTO `customer_addresses` (`customer_address_id`, `address`, `customer_id`, `city_id`, `created_at`, `updated_at`) VALUES
(1, 'Plaza de Botero, Medellin, Colombia', 2, 1, '2021-09-02 01:31:37', NULL),
(2, 'El poblado, Medellin, Colombia', 1, 2, '2021-09-02 01:31:44', NULL),
(3, 'Plaza de Botero, Medellin, Colombia', 3, 1, '2021-09-02 01:31:37', NULL),
(4, 'Parque Holaya Herrera, Pereira, Colombia', 3, 1, '2021-09-02 01:31:37', NULL),
(5, 'Envigado, Antioquia, Colombia', 1, 2, '2021-09-02 01:31:44', NULL),
(6, 'Carrera 12 #12-31, Pereira, Colombia', 2, 1, '2021-09-02 01:31:37', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(3, '2021_09_01_025031_create_table_customers', 1),
(4, '2021_09_01_025146_create_table_cities', 1),
(5, '2021_09_01_025147_create_table_customer_addresses', 1),
(6, '2021_09_01_025242_create_table_states', 1),
(7, '2021_09_01_025243_create_table_shipments', 1),
(8, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(9, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(10, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(11, '2016_06_01_000004_create_oauth_clients_table', 2),
(12, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('00aadd6e3796b3a16848373794e836b8be27e394fbb2703d0a2928704438070692d68fbda7a14afc', 12, 1, 'misecretoparaeltoken', '[]', 0, '2021-09-05 23:29:41', '2021-09-05 23:29:41', '2021-09-05 20:29:40'),
('03bda42549d1596668244dd6da0fba534def5b26e11329259066e7a6a2d82f1c298f98481bd89e3f', 12, 1, 'misecretoparaeltoken', '[]', 0, '2021-09-05 19:34:13', '2021-09-05 19:34:13', '2021-09-05 16:34:13'),
('079c3728a299e978830135ce427ba6bec3daf463878413ed7231463f48f5cf27085db16ccad59a3b', 12, 1, 'misecretoparaeltoken', '[]', 0, '2021-09-05 08:00:12', '2021-09-05 08:00:12', '2021-09-05 05:00:12'),
('0936cb291885749bb2949de5989aac6a86548dc64e003b8188113adbd3b643dcc94f8c8682023de2', 12, 1, 'misecretoparaeltoken', '[]', 0, '2021-09-05 11:42:48', '2021-09-05 11:42:48', '2021-09-05 08:42:48'),
('165a4226fd1dec722a5b93ca702fe6a9c3f0e70f1d3fee861eecd3cb577f0a4965912635885dda4b', 12, 1, 'misecretoparaeltoken', '[]', 0, '2021-09-04 03:43:57', '2021-09-04 03:43:57', '2021-09-04 00:43:57'),
('1cc24613e760654f641e4bfa2224c06005adea795f43f1a91ba29756a2bdd9ec9f42e123b13c3605', 12, 1, 'misecretoparaeltoken', '[]', 0, '2021-09-05 11:27:25', '2021-09-05 11:27:25', '2021-09-05 08:27:25'),
('1ef70044313d3eea16c337e693b8c0456a80b8cdb0db188f71aa4f37ccffa4a959a26bddc2238342', 12, 1, 'misecretoparaeltoken', '[]', 0, '2021-09-04 16:11:03', '2021-09-04 16:11:03', '2021-09-04 13:11:02'),
('2076fb80cd589a20d74b00c6c2ec0232e7e69b280cfb53466f91dc73eebf49b0e1c8d4a8f3ab8e28', 12, 1, 'misecretoparaeltoken', '[]', 0, '2021-09-04 22:20:31', '2021-09-04 22:20:31', '2021-09-04 19:20:31'),
('25241d7b86f8b196c4ba2ffd14c0c63eddf03cb8b9518aa14b5f185a67b7621af219b15009bfcb52', 12, 1, 'misecretoparaeltoken', '[]', 0, '2021-09-05 05:30:42', '2021-09-05 05:30:42', '2021-09-05 02:30:42'),
('3ebbc821388e8e77143c5d839f25c345ad3110856e3642316aab03268805055745e88e4800dbd012', 12, 1, 'misecretoparaeltoken', '[]', 0, '2021-09-05 03:19:39', '2021-09-05 03:19:39', '2021-09-05 00:19:39'),
('5888dfd51f4dbd6fcfd5affa7e3c0a1c8df43aabee7bcc6181c584a3df996972f6da812a55f11a94', 12, 1, 'misecretoparaeltoken', '[]', 0, '2021-09-05 00:38:05', '2021-09-05 00:38:05', '2021-09-04 21:38:05'),
('59b727cf405b39c6b4d6b107411eca951b8622c767414aac9cf9b619e6a8f11e0d297b201b211af5', 12, 1, 'misecretoparaeltoken', '[]', 0, '2021-09-05 05:58:37', '2021-09-05 05:58:37', '2021-09-05 02:58:37'),
('5c23905443a362f4da9bcdafcd0cf172c2854b81da1e55cdef042e03d81237b277e0e392016b7f78', 16, 1, 'misecretoparaeltoken', '[]', 0, '2021-09-05 00:41:32', '2021-09-05 00:41:32', '2021-09-04 21:41:32'),
('5d3044c388b0f3e112c2186ed183f43825d86fc0d36eeea981c7a0f4d55dd64ead8415e0bd04e1b0', 12, 1, 'misecretoparaeltoken', '[]', 0, '2021-09-05 05:52:37', '2021-09-05 05:52:37', '2021-09-05 02:52:37'),
('5e8036527dd51b5b772964fb7d635524d1bac6ed5157da369f2b56fde02d220b745064d347b55910', 12, 1, 'misecretoparaeltoken', '[]', 0, '2021-09-05 00:20:51', '2021-09-05 00:20:51', '2021-09-04 21:20:51'),
('63cb4c6599fabc9006c0bfb1eb81ca403782e46e5a5afb0521fc0e4a2db175b5ef0667f8d2bafa28', 12, 1, 'misecretoparaeltoken', '[]', 0, '2021-09-04 03:43:16', '2021-09-04 03:43:16', '2021-09-04 00:43:16'),
('6eac4369664006e97109b3d6d7a4143d6ec380eac0eae8ac969e985b344339c0717c2ce3da102682', 12, 1, 'misecretoparaeltoken', '[]', 0, '2021-09-05 21:36:15', '2021-09-05 21:36:15', '2021-09-05 18:36:15'),
('77ce39d8cdfe7e0b8e936b71d388499c9bf798a4d3f17ed565ae69387f4522b274ae74e8f8aa3c49', 12, 1, 'misecretoparaeltoken', '[]', 0, '2021-09-04 20:16:44', '2021-09-04 20:16:44', '2021-09-04 17:16:44'),
('8e54c4bee44285e0b5a6faf9682f2e5ac4b20b52968d4b37c46034be352b98b720e427c207113dac', 12, 1, 'misecretoparaeltoken', '[]', 0, '2021-09-03 21:53:33', '2021-09-03 21:53:33', '2022-09-03 16:53:33'),
('a87b905dbf2a1786513a718e386c0819c40815d81892b0c8d26f479fd4cdf36c1d88a30c0a6b632c', 12, 1, 'misecretoparaeltoken', '[]', 0, '2021-09-03 21:55:24', '2021-09-03 21:55:24', '2022-09-03 16:55:24'),
('b62405ea295493b3507028955721e0d8cdd7739c7642218cfebb223ceff2c6daecf94adebbb3735c', 12, 1, 'misecretoparaeltoken', '[]', 0, '2021-09-03 21:54:41', '2021-09-03 21:54:41', '2022-09-03 16:54:41'),
('beb7aa1509079b279ab177de140922f8e21aa17059d8943fabb92780c27159921aee81a01192058b', 12, 1, 'misecretoparaeltoken', '[]', 0, '2021-09-05 10:00:41', '2021-09-05 10:00:41', '2021-09-05 07:00:41'),
('c0affcad9fb73ddc9e482f88ec7c9003596c5404656693d40d23fc85d4acf710e54a85c3b2393a7e', 12, 1, 'misecretoparaeltoken', '[]', 0, '2021-09-03 21:52:21', '2021-09-03 21:52:21', '2022-09-03 16:52:21'),
('c413b5da2a2156319d99d900682b90c13ceeaf39276d7aaeab0eb59cbdca3c69212cd0e0004dfc76', 12, 1, 'misecretoparaeltoken', '[]', 0, '2021-09-03 21:54:06', '2021-09-03 21:54:06', '2022-09-03 16:54:06'),
('cabcc493a4192ebb4114d97a4f0b34947c85e0de519bd4005f439efb8c662371009b688c5f20914e', 12, 1, 'misecretoparaeltoken', '[]', 0, '2021-09-04 18:12:09', '2021-09-04 18:12:09', '2021-09-04 15:12:09'),
('cddb72d12df622e7b753c548035fb2a8e28a75080c72b00601fe147a80693704f525cf7299b27f40', 12, 1, 'misecretoparaeltoken', '[]', 0, '2021-09-04 22:48:00', '2021-09-04 22:48:00', '2021-09-04 19:48:00'),
('d5d9543d45a143cf0ceb3c2dd6ff75368149883c41cf97c4af82263cab87205e189e78cae10f4382', 12, 1, 'misecretoparaeltoken', '[]', 0, '2021-09-05 11:42:13', '2021-09-05 11:42:13', '2021-09-05 08:42:12'),
('e3348cd27db208c1d17fce6fa8be12ad6dec1c0dafac8eb30bc3036c75766e6b30156cabfe52805d', 12, 1, 'misecretoparaeltoken', '[]', 0, '2021-09-05 23:36:32', '2021-09-05 23:36:32', '2021-09-05 20:36:32'),
('f3c0bc117f27f3e7f540fa65731f7a207b2e90f8900b571bf0a70a9b38aaef70b5dff003da7cb4c2', 12, 1, 'misecretoparaeltoken', '[]', 0, '2021-09-03 21:53:53', '2021-09-03 21:53:53', '2022-09-03 16:53:53'),
('f6261a3a08c85cf7c5e09942f233d7c5110a0e1df573b0fb46bd05a230c43485ac2094222d358621', 12, 1, 'misecretoparaeltoken', '[]', 0, '2021-09-04 11:57:10', '2021-09-04 11:57:10', '2021-09-04 08:57:09'),
('f9fedd0ed14f1b37e0f7ea31035286571d2ba53815c426109319ac7bd1de9d3012c11856fd4ad408', 12, 1, 'misecretoparaeltoken', '[]', 0, '2021-09-05 11:29:04', '2021-09-05 11:29:04', '2021-09-05 08:29:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'q41JCxG7Rpwv6604ZRta57f9p1m02EyKxw5y0SBf', NULL, 'http://localhost', 1, 0, 0, '2021-09-03 21:19:10', '2021-09-03 21:19:10'),
(2, NULL, 'Laravel Password Grant Client', 'p7fzb7zx7ZpDjS5TnkzxPMgmU0HiwChqS7se7XlH', 'users', 'http://localhost', 0, 1, 0, '2021-09-03 21:19:10', '2021-09-03 21:19:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-09-03 21:19:10', '2021-09-03 21:19:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `shipments`
--

CREATE TABLE `shipments` (
  `shipment_id` bigint(20) UNSIGNED NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipment_date` datetime DEFAULT NULL,
  `delivery_date` datetime DEFAULT NULL,
  `start_address` bigint(20) UNSIGNED NOT NULL,
  `arrival_address` bigint(20) UNSIGNED NOT NULL,
  `state_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `shipments`
--

INSERT INTO `shipments` (`shipment_id`, `description`, `shipment_date`, `delivery_date`, `start_address`, `arrival_address`, `state_id`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'X-Box', '2021-09-01 00:00:00', '2021-09-05 07:13:06', 6, 5, 3, 11, '2021-09-02 07:21:52', '2021-09-05 09:44:24'),
(2, 'Play Station', '2021-09-01 00:00:00', '2021-09-05 07:13:21', 6, 2, 2, 11, '2021-09-02 07:24:55', '2021-09-05 05:51:34'),
(3, 'T-shirt + Shoes', '2021-09-01 00:00:00', '2021-09-13 07:13:31', 5, 3, 4, 11, '2021-09-02 07:25:41', '2021-09-05 23:41:10'),
(5, 'Mouse', '2021-09-01 00:00:00', '2021-09-11 07:13:43', 1, 2, 1, 11, '2021-09-02 07:33:19', '2021-09-03 03:02:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `states`
--

CREATE TABLE `states` (
  `state_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `states`
--

INSERT INTO `states` (`state_id`, `name`, `order`, `created_at`, `updated_at`) VALUES
(1, 'Collected', 1, '2021-09-02 01:34:30', NULL),
(2, 'Awaiting departure', 2, '2021-09-02 01:34:34', NULL),
(3, 'In transit', 3, '2021-09-02 01:34:38', NULL),
(4, 'Delivered', 4, '2021-09-02 01:34:40', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`user_id`, `name`, `surname`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(11, 'Joey', 'Grimes', 'eli.windler@example.org', '2021-09-01 11:36:07', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '99z1RBKcuj', '2021-09-01 11:36:07', '2021-09-01 11:36:07'),
(12, 'Chadd', 'Pagac', 'adrien30@example.net', '2021-09-01 11:36:07', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'HgvYfGpL5A', '2021-09-01 11:36:07', '2021-09-01 11:36:07'),
(13, 'Ella', 'Will', 'ohagenes@example.net', '2021-09-01 11:36:07', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '4bDJvD7flg', '2021-09-01 11:36:07', '2021-09-01 11:36:07'),
(14, 'Fae', 'Gaylord', 'maxine.koss@example.com', '2021-09-01 11:36:07', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'vo8z2gCV7e', '2021-09-01 11:36:07', '2021-09-01 11:36:07'),
(15, 'Ellen', 'Auer', 'neil09@example.org', '2021-09-01 11:36:07', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'janRYhaGqO', '2021-09-01 11:36:07', '2021-09-01 11:36:07'),
(16, 'Margaret', 'Lemke', 'king.eldora@example.net', '2021-09-01 11:36:07', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'OAW8C7rJJ5', '2021-09-01 11:36:07', '2021-09-01 11:36:07'),
(17, 'Kenya', 'OKon', 'hintz.guiseppe@example.org', '2021-09-01 11:36:07', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'o47cFvOHKz', '2021-09-01 11:36:07', '2021-09-01 11:36:07'),
(18, 'Emmett', 'Fay', 'cameron12@example.org', '2021-09-01 11:36:07', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'yV2seZUjmt', '2021-09-01 11:36:07', '2021-09-01 11:36:07'),
(19, 'Samantha', 'Hayes', 'wiza.herman@example.net', '2021-09-01 11:36:07', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'KZnY8uR5Ov', '2021-09-01 11:36:07', '2021-09-01 11:36:07'),
(20, 'Curtis', 'Feeney', 'kwatsica@example.com', '2021-09-01 11:36:07', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Tb1Ua2p0bH', '2021-09-01 11:36:07', '2021-09-01 11:36:07');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`city_id`);

--
-- Indices de la tabla `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indices de la tabla `customer_addresses`
--
ALTER TABLE `customer_addresses`
  ADD PRIMARY KEY (`customer_address_id`),
  ADD KEY `customer_addresses_customer_id_foreign` (`customer_id`),
  ADD KEY `customer_addresses_city_id_foreign` (`city_id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indices de la tabla `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indices de la tabla `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indices de la tabla `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `shipments`
--
ALTER TABLE `shipments`
  ADD PRIMARY KEY (`shipment_id`),
  ADD KEY `shipments_start_address_foreign` (`start_address`),
  ADD KEY `shipments_arrival_address_foreign` (`arrival_address`),
  ADD KEY `shipments_state_id_foreign` (`state_id`),
  ADD KEY `shipments_created_by_foreign` (`created_by`);

--
-- Indices de la tabla `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`state_id`),
  ADD UNIQUE KEY `idx_uk_states_order` (`order`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cities`
--
ALTER TABLE `cities`
  MODIFY `city_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `customer_addresses`
--
ALTER TABLE `customer_addresses`
  MODIFY `customer_address_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `shipments`
--
ALTER TABLE `shipments`
  MODIFY `shipment_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT de la tabla `states`
--
ALTER TABLE `states`
  MODIFY `state_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `user_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `customer_addresses`
--
ALTER TABLE `customer_addresses`
  ADD CONSTRAINT `customer_addresses_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`city_id`),
  ADD CONSTRAINT `customer_addresses_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);

--
-- Filtros para la tabla `shipments`
--
ALTER TABLE `shipments`
  ADD CONSTRAINT `shipments_arrival_address_foreign` FOREIGN KEY (`arrival_address`) REFERENCES `customer_addresses` (`customer_address_id`),
  ADD CONSTRAINT `shipments_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `shipments_start_address_foreign` FOREIGN KEY (`start_address`) REFERENCES `customer_addresses` (`customer_address_id`),
  ADD CONSTRAINT `shipments_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `states` (`state_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
