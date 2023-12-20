-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 20, 2023 at 06:04 PM
-- Server version: 8.0.35-0ubuntu0.22.04.1
-- PHP Version: 8.1.2-1ubuntu2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `site_editor_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_user`
--

CREATE TABLE `account_user` (
  `uid` int UNSIGNED NOT NULL,
  `uuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `first_name` varchar(16) DEFAULT NULL,
  `last_name` varchar(16) DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `passhash` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `verifyhash` varchar(128) NOT NULL DEFAULT '',
  `short_code` varchar(32) NOT NULL DEFAULT '',
  `iso` varchar(2) NOT NULL DEFAULT '',
  `dts_format` varchar(24) NOT NULL DEFAULT 'd/m/Y H:i',
  `when_created` datetime DEFAULT NULL,
  `when_updated` datetime DEFAULT NULL,
  `when_deleted` datetime DEFAULT NULL,
  `uid_created_by` int UNSIGNED NOT NULL DEFAULT '0',
  `uid_updated_by` int UNSIGNED NOT NULL DEFAULT '0',
  `uid_deleted_by` int UNSIGNED NOT NULL DEFAULT '0',
  `is_active` bit(1) NOT NULL,
  `is_verified` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `account_user_asset`
--

CREATE TABLE `account_user_asset` (
  `uid` int UNSIGNED NOT NULL,
  `uid_user` int UNSIGNED NOT NULL DEFAULT '0',
  `uuid` varchar(36) NOT NULL DEFAULT '',
  `filename` varchar(255) NOT NULL DEFAULT '0',
  `mime_type` varchar(32) NOT NULL DEFAULT '',
  `ext` varchar(5) NOT NULL DEFAULT '',
  `length` bigint UNSIGNED NOT NULL DEFAULT '0',
  `dts_created` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `account_user_asset_meta`
--

CREATE TABLE `account_user_asset_meta` (
  `uid` int UNSIGNED NOT NULL,
  `uid_user` int UNSIGNED NOT NULL DEFAULT '0',
  `uid_asset` int UNSIGNED NOT NULL DEFAULT '0',
  `property` varchar(255) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  `dts_created` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `account_user_asset_palette`
--

CREATE TABLE `account_user_asset_palette` (
  `uid` int UNSIGNED NOT NULL,
  `uid_asset` int UNSIGNED NOT NULL,
  `colour` varchar(8) NOT NULL DEFAULT '',
  `percent` tinyint UNSIGNED NOT NULL,
  `r` smallint UNSIGNED NOT NULL,
  `g` smallint UNSIGNED NOT NULL,
  `b` smallint UNSIGNED NOT NULL,
  `o` smallint UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `account_user_brand`
--

CREATE TABLE `account_user_brand` (
  `uid` int UNSIGNED NOT NULL,
  `uid_user` int UNSIGNED NOT NULL DEFAULT '0',
  `uuid` varchar(48) NOT NULL DEFAULT '',
  `name` varchar(128) NOT NULL DEFAULT '',
  `logo` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `website` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `is_active` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `colour_default_1` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `colour_default_2` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `colour_default_3` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `dts_created` datetime NOT NULL,
  `dts_updated` datetime NOT NULL,
  `dts_deleted` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `account_user_project`
--

CREATE TABLE `account_user_project` (
  `uid` int UNSIGNED NOT NULL,
  `uuid` varchar(48) NOT NULL DEFAULT '',
  `name` varchar(60) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `hex_1` varchar(6) NOT NULL DEFAULT '',
  `hex_2` varchar(6) NOT NULL DEFAULT '',
  `hex_3` varchar(6) NOT NULL DEFAULT '',
  `uid_user` int UNSIGNED NOT NULL DEFAULT '0',
  `uid_group` int UNSIGNED NOT NULL DEFAULT '0',
  `uid_brand` int UNSIGNED NOT NULL DEFAULT '0',
  `connect_fb` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `connect_ga` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `dts_created` datetime NOT NULL,
  `dts_updated` datetime NOT NULL,
  `dts_deleted` datetime NOT NULL,
  `layer_json` longtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `account_user_project_group`
--

CREATE TABLE `account_user_project_group` (
  `uid` int UNSIGNED NOT NULL,
  `uuid` varchar(48) NOT NULL DEFAULT '',
  `name` varchar(60) NOT NULL DEFAULT '',
  `uid_user` int UNSIGNED NOT NULL DEFAULT '0',
  `dts_created` datetime NOT NULL,
  `dts_updated` datetime NOT NULL,
  `dts_deleted` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `account_user_project_media`
--

CREATE TABLE `account_user_project_media` (
  `uid` int UNSIGNED NOT NULL,
  `uuid` varchar(48) NOT NULL DEFAULT '',
  `uid_user` int UNSIGNED NOT NULL DEFAULT '0',
  `uid_project` int UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL DEFAULT '',
  `asset_type` varchar(32) NOT NULL DEFAULT '',
  `mime_type` varchar(32) NOT NULL DEFAULT '',
  `bytes` varchar(20) NOT NULL DEFAULT '',
  `dts_created` datetime NOT NULL,
  `dts_updated` datetime NOT NULL,
  `dts_deleted` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `account_user_project_version`
--

CREATE TABLE `account_user_project_version` (
  `uid` int UNSIGNED NOT NULL,
  `uid_user` int UNSIGNED NOT NULL DEFAULT '0',
  `uid_project` int UNSIGNED NOT NULL DEFAULT '0',
  `when` datetime NOT NULL,
  `json` longtext NOT NULL,
  `ad_format_id` tinyint UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `ad_format`
--

CREATE TABLE `ad_format` (
  `id` tinyint UNSIGNED NOT NULL,
  `uuid` varchar(45) NOT NULL,
  `name` varchar(32) NOT NULL,
  `slug` varchar(32) DEFAULT NULL,
  `height` smallint NOT NULL,
  `width` smallint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `assistants`
--

CREATE TABLE `assistants` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `instructions` text,
  `uuid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `model` varchar(50) NOT NULL,
  `file_ids` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `metadata` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `tools` varchar(300) NOT NULL,
  `json_obj` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `components`
--

CREATE TABLE `components` (
  `id` int NOT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` int NOT NULL,
  `uuid` varchar(100) NOT NULL,
  `filename` varchar(100) DEFAULT NULL,
  `purpose` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log_account_access`
--

CREATE TABLE `log_account_access` (
  `uid` int UNSIGNED NOT NULL,
  `uid_user` int UNSIGNED NOT NULL,
  `endpoint` varchar(128) NOT NULL DEFAULT '',
  `action` varchar(64) NOT NULL DEFAULT '',
  `ip_address` varchar(64) NOT NULL DEFAULT '',
  `when` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `log_account_login_attempt`
--

CREATE TABLE `log_account_login_attempt` (
  `uid` int UNSIGNED NOT NULL,
  `account_uid` int UNSIGNED NOT NULL,
  `ip` varchar(48) NOT NULL DEFAULT '',
  `when` datetime NOT NULL,
  `successful` tinyint UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int NOT NULL,
  `thread_id` varchar(100) NOT NULL,
  `role` varchar(20) DEFAULT NULL,
  `content` text,
  `extracted_json` text,
  `file_ids` varchar(300) DEFAULT NULL,
  `uuid` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `openai_prompt`
--

CREATE TABLE `openai_prompt` (
  `id` int UNSIGNED NOT NULL,
  `key` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `purpose` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `template` text NOT NULL,
  `is_deleted` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `created_by` int UNSIGNED NOT NULL DEFAULT '0',
  `updated_by` int UNSIGNED NOT NULL DEFAULT '0',
  `deleted_by` int UNSIGNED NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `openai_user_requests`
--

CREATE TABLE `openai_user_requests` (
  `id` int NOT NULL,
  `user_uuid` varchar(255) DEFAULT NULL,
  `site_uuid` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `prompt` text,
  `ai_response_json` text,
  `status` enum('in_progress','completed') DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int NOT NULL,
  `parent_page_id` int DEFAULT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `site_id` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `page_components`
--

CREATE TABLE `page_components` (
  `id` int NOT NULL,
  `page_id` int DEFAULT NULL,
  `component_id` int DEFAULT NULL,
  `sequence_number` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `runs`
--

CREATE TABLE `runs` (
  `id` int NOT NULL,
  `thread_id` varchar(100) NOT NULL,
  `assistant_id` varchar(100) NOT NULL,
  `uuid` varchar(100) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sector`
--

CREATE TABLE `sector` (
  `id` int UNSIGNED NOT NULL,
  `uuid` varchar(48) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `title` varchar(32) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `security_ip_block`
--

CREATE TABLE `security_ip_block` (
  `uid` int UNSIGNED NOT NULL,
  `ip` varchar(64) NOT NULL DEFAULT '',
  `account_attempted` int UNSIGNED NOT NULL DEFAULT '0',
  `when_blocked` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sites`
--

CREATE TABLE `sites` (
  `id` int NOT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system_message`
--

CREATE TABLE `system_message` (
  `uid` int UNSIGNED NOT NULL,
  `code` varchar(48) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `message` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `system_message_i18n`
--

CREATE TABLE `system_message_i18n` (
  `uid` int UNSIGNED NOT NULL,
  `code` varchar(48) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `iso` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `message` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `threads`
--

CREATE TABLE `threads` (
  `id` int NOT NULL,
  `purpose` varchar(100) NOT NULL,
  `user_uuid` varchar(100) NOT NULL,
  `site_uuid` varchar(255) DEFAULT NULL,
  `uuid` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_sitemap`
--

CREATE TABLE `user_sitemap` (
  `id` int UNSIGNED NOT NULL,
  `uuid` varchar(48) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `pages` int UNSIGNED NOT NULL DEFAULT '1',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `purpose` varchar(64) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(128) NOT NULL DEFAULT '',
  `is_deleted` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `user_sitemap_page`
--

CREATE TABLE `user_sitemap_page` (
  `id` int UNSIGNED NOT NULL,
  `sitemap_id` int UNSIGNED NOT NULL DEFAULT '0',
  `parent_page_id` int DEFAULT NULL,
  `uuid` varchar(48) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `position` int UNSIGNED NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `user_thread`
--

CREATE TABLE `user_thread` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `openai_thread_id` varchar(64) NOT NULL DEFAULT '',
  `purpose` varchar(128) NOT NULL DEFAULT '',
  `uuid` varchar(48) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `user_thread_message`
--

CREATE TABLE `user_thread_message` (
  `id` int UNSIGNED NOT NULL,
  `thread_id` int UNSIGNED NOT NULL DEFAULT '0',
  `role` varchar(16) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `user_thread_run`
--

CREATE TABLE `user_thread_run` (
  `id` int UNSIGNED NOT NULL,
  `thread_id` varchar(32) NOT NULL DEFAULT '',
  `run_id` varchar(32) NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_user`
--
ALTER TABLE `account_user`
  ADD PRIMARY KEY (`uid`) USING BTREE,
  ADD UNIQUE KEY `uid` (`uid`) USING BTREE,
  ADD KEY `is_active` (`is_active`) USING BTREE,
  ADD KEY `uid_created_by` (`uid_created_by`) USING BTREE,
  ADD KEY `uid_updated_by` (`uid_updated_by`) USING BTREE,
  ADD KEY `uid_deleted_by` (`uid_deleted_by`) USING BTREE,
  ADD KEY `name` (`username`(250)) USING BTREE,
  ADD KEY `uuid` (`uuid`) USING BTREE,
  ADD KEY `is_verified` (`is_verified`) USING BTREE,
  ADD KEY `short_code` (`short_code`) USING BTREE;
ALTER TABLE `account_user` ADD FULLTEXT KEY `passhash` (`passhash`);

--
-- Indexes for table `account_user_asset`
--
ALTER TABLE `account_user_asset`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `uid` (`uid`) USING BTREE,
  ADD KEY `uid_user` (`uid_user`) USING BTREE,
  ADD KEY `uuid` (`uuid`) USING BTREE,
  ADD KEY `filename` (`filename`) USING BTREE;

--
-- Indexes for table `account_user_asset_meta`
--
ALTER TABLE `account_user_asset_meta`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `uid` (`uid`) USING BTREE,
  ADD KEY `uid_user` (`uid_user`) USING BTREE,
  ADD KEY `uid_asset` (`uid_asset`) USING BTREE,
  ADD KEY `property` (`property`) USING BTREE,
  ADD KEY `dts_created` (`dts_created`) USING BTREE;

--
-- Indexes for table `account_user_asset_palette`
--
ALTER TABLE `account_user_asset_palette`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `uid` (`uid`) USING BTREE,
  ADD KEY `uid_asset` (`uid_asset`) USING BTREE,
  ADD KEY `colour` (`colour`) USING BTREE,
  ADD KEY `percent` (`percent`) USING BTREE,
  ADD KEY `r` (`r`) USING BTREE,
  ADD KEY `g` (`g`) USING BTREE,
  ADD KEY `b` (`b`) USING BTREE,
  ADD KEY `o` (`o`) USING BTREE;

--
-- Indexes for table `account_user_brand`
--
ALTER TABLE `account_user_brand`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `uid` (`uid`) USING BTREE,
  ADD KEY `uid_user` (`uid_user`) USING BTREE,
  ADD KEY `uuid` (`uuid`) USING BTREE,
  ADD KEY `is_active` (`is_active`) USING BTREE,
  ADD KEY `name` (`name`) USING BTREE;

--
-- Indexes for table `account_user_project`
--
ALTER TABLE `account_user_project`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `uid` (`uid`) USING BTREE,
  ADD UNIQUE KEY `uuid` (`uuid`) USING BTREE,
  ADD UNIQUE KEY `user_group_name` (`uid_user`,`uid_group`,`name`) USING BTREE,
  ADD KEY `name` (`name`) USING BTREE,
  ADD KEY `uid_user` (`uid_user`) USING BTREE,
  ADD KEY `uid_group` (`uid_group`) USING BTREE,
  ADD KEY `uid_brand` (`uid_brand`) USING BTREE;

--
-- Indexes for table `account_user_project_group`
--
ALTER TABLE `account_user_project_group`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `uid` (`uid`) USING BTREE,
  ADD UNIQUE KEY `uid_user_name` (`uid_user`,`name`) USING BTREE,
  ADD UNIQUE KEY `uuid` (`uuid`) USING BTREE,
  ADD KEY `name` (`name`) USING BTREE,
  ADD KEY `uid_user` (`uid_user`) USING BTREE;

--
-- Indexes for table `account_user_project_media`
--
ALTER TABLE `account_user_project_media`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `uid` (`uid`) USING BTREE,
  ADD UNIQUE KEY `uuid` (`uuid`) USING BTREE,
  ADD KEY `uid_user` (`uid_user`) USING BTREE,
  ADD KEY `uid_project` (`uid_project`) USING BTREE,
  ADD KEY `name` (`name`) USING BTREE,
  ADD KEY `asset_type` (`asset_type`) USING BTREE;

--
-- Indexes for table `account_user_project_version`
--
ALTER TABLE `account_user_project_version`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `uid` (`uid`) USING BTREE,
  ADD KEY `uid_user` (`uid_user`) USING BTREE,
  ADD KEY `uid_project` (`uid_project`) USING BTREE,
  ADD KEY `when` (`when`) USING BTREE;

--
-- Indexes for table `ad_format`
--
ALTER TABLE `ad_format`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `uuid_UNIQUE` (`uuid`);

--
-- Indexes for table `assistants`
--
ALTER TABLE `assistants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `components`
--
ALTER TABLE `components`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log_account_access`
--
ALTER TABLE `log_account_access`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `uid` (`uid`),
  ADD KEY `uid_account` (`uid_user`);

--
-- Indexes for table `log_account_login_attempt`
--
ALTER TABLE `log_account_login_attempt`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `uid` (`uid`) USING BTREE,
  ADD KEY `account_uid` (`account_uid`) USING BTREE,
  ADD KEY `when` (`when`) USING BTREE;

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `openai_prompt`
--
ALTER TABLE `openai_prompt`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`) USING BTREE,
  ADD KEY `purpose` (`purpose`) USING BTREE,
  ADD KEY `key` (`key`) USING BTREE;

--
-- Indexes for table `openai_user_requests`
--
ALTER TABLE `openai_user_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_components`
--
ALTER TABLE `page_components`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `runs`
--
ALTER TABLE `runs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sector`
--
ALTER TABLE `sector`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`) USING BTREE,
  ADD UNIQUE KEY `uuid` (`uuid`) USING BTREE,
  ADD KEY `title` (`title`) USING BTREE;

--
-- Indexes for table `security_ip_block`
--
ALTER TABLE `security_ip_block`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `uid` (`uid`) USING BTREE,
  ADD KEY `ip` (`ip`) USING BTREE,
  ADD KEY `account_attempted` (`account_attempted`) USING BTREE;

--
-- Indexes for table `sites`
--
ALTER TABLE `sites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_message`
--
ALTER TABLE `system_message`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `uid` (`uid`) USING BTREE,
  ADD KEY `code` (`code`) USING BTREE;

--
-- Indexes for table `system_message_i18n`
--
ALTER TABLE `system_message_i18n`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `uid` (`uid`) USING BTREE,
  ADD KEY `code` (`code`) USING BTREE,
  ADD KEY `iso` (`iso`) USING BTREE;

--
-- Indexes for table `threads`
--
ALTER TABLE `threads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_sitemap`
--
ALTER TABLE `user_sitemap`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`) USING BTREE,
  ADD KEY `user_id` (`user_id`) USING BTREE,
  ADD KEY `title` (`title`) USING BTREE,
  ADD KEY `uuid` (`uuid`) USING BTREE;

--
-- Indexes for table `user_sitemap_page`
--
ALTER TABLE `user_sitemap_page`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`) USING BTREE,
  ADD KEY `sitemap_id` (`sitemap_id`) USING BTREE,
  ADD KEY `url` (`url`) USING BTREE,
  ADD KEY `title` (`title`) USING BTREE,
  ADD KEY `uuid` (`uuid`) USING BTREE,
  ADD KEY `position` (`position`) USING BTREE;

--
-- Indexes for table `user_thread`
--
ALTER TABLE `user_thread`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`) USING BTREE,
  ADD KEY `user_id` (`user_id`) USING BTREE,
  ADD KEY `openai_thread_id` (`openai_thread_id`) USING BTREE;

--
-- Indexes for table `user_thread_message`
--
ALTER TABLE `user_thread_message`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`) USING BTREE,
  ADD KEY `thread_id` (`thread_id`) USING BTREE;

--
-- Indexes for table `user_thread_run`
--
ALTER TABLE `user_thread_run`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`) USING BTREE,
  ADD UNIQUE KEY `run_id` (`run_id`) USING BTREE,
  ADD KEY `thread_id` (`thread_id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_user`
--
ALTER TABLE `account_user`
  MODIFY `uid` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `account_user_asset`
--
ALTER TABLE `account_user_asset`
  MODIFY `uid` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `account_user_asset_meta`
--
ALTER TABLE `account_user_asset_meta`
  MODIFY `uid` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `account_user_asset_palette`
--
ALTER TABLE `account_user_asset_palette`
  MODIFY `uid` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `account_user_brand`
--
ALTER TABLE `account_user_brand`
  MODIFY `uid` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `account_user_project`
--
ALTER TABLE `account_user_project`
  MODIFY `uid` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `account_user_project_group`
--
ALTER TABLE `account_user_project_group`
  MODIFY `uid` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `account_user_project_media`
--
ALTER TABLE `account_user_project_media`
  MODIFY `uid` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `account_user_project_version`
--
ALTER TABLE `account_user_project_version`
  MODIFY `uid` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ad_format`
--
ALTER TABLE `ad_format`
  MODIFY `id` tinyint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assistants`
--
ALTER TABLE `assistants`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `components`
--
ALTER TABLE `components`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log_account_access`
--
ALTER TABLE `log_account_access`
  MODIFY `uid` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log_account_login_attempt`
--
ALTER TABLE `log_account_login_attempt`
  MODIFY `uid` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `openai_prompt`
--
ALTER TABLE `openai_prompt`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `openai_user_requests`
--
ALTER TABLE `openai_user_requests`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `page_components`
--
ALTER TABLE `page_components`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `runs`
--
ALTER TABLE `runs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sector`
--
ALTER TABLE `sector`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `security_ip_block`
--
ALTER TABLE `security_ip_block`
  MODIFY `uid` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sites`
--
ALTER TABLE `sites`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `system_message`
--
ALTER TABLE `system_message`
  MODIFY `uid` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `system_message_i18n`
--
ALTER TABLE `system_message_i18n`
  MODIFY `uid` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `threads`
--
ALTER TABLE `threads`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_sitemap`
--
ALTER TABLE `user_sitemap`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_sitemap_page`
--
ALTER TABLE `user_sitemap_page`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_thread`
--
ALTER TABLE `user_thread`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_thread_message`
--
ALTER TABLE `user_thread_message`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_thread_run`
--
ALTER TABLE `user_thread_run`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
