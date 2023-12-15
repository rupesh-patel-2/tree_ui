-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 15, 2023 at 02:46 PM
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

--
-- Dumping data for table `account_user`
--

INSERT INTO `account_user` (`uid`, `uuid`, `first_name`, `last_name`, `username`, `passhash`, `verifyhash`, `short_code`, `iso`, `dts_format`, `when_created`, `when_updated`, `when_deleted`, `uid_created_by`, `uid_updated_by`, `uid_deleted_by`, `is_active`, `is_verified`) VALUES
(1, 'fcee12b2-066a-11ed-9e6a-b234123e763f', NULL, NULL, 'andrew.whitfield@yahoo.co.uk', '$2y$10$23y28MJIEHf2LY/ppx9kMemwQXS1Es6Q64yw0lwkuQbf2gZuJwEIS', '', '', '', 'd/m/Y H:i A', NULL, NULL, NULL, 0, 0, 0, b'1', b'0'),
(3, '83c1da99-7384-11ed-a2a7-ecebb85dcde8', NULL, NULL, 'andrew.whitfield@yahoo.co.uk', '$2y$10$zBaTNSnLF5mQxrMLe4.vZeK5zPUt7F8KJzNDIIB18o3.oS5szK5LW', '$2y$10$9d4l/3GkHDVhS5mBryZ3bu00Oyy3eg6MpUsvtOs.o5p.fPH6Q578a', '', '', 'd/m/Y H:i A', NULL, NULL, NULL, 0, 0, 0, b'1', b'0'),
(4, '4fecd3de-7386-11ed-a2a7-ecebb85dcde8', NULL, NULL, 'dev2@mystream.co.uk', '$2y$10$pmpOchmh8Hv9VNH9j1ppXO42V6RSRDhqP2P67LzVGhT8107ueObEi', '$2y$10$gObrQX.hpq7H1rSye2dCTOYc0JOJG8SVD4sfYyOZf5fChYy4CBMgy', '', '', 'd/m/Y H:i A', NULL, NULL, NULL, 0, 0, 0, b'1', b'0'),
(5, '98322138-7386-11ed-a2a7-ecebb85dcde8', NULL, NULL, 'dev3@mystream.co.uk', '$2y$10$l4MsFbfz5/yqVGGoN6ivgOXh7AMBlNdyTimCsE0FnH7wA5LCtMDoC', '$2y$10$QPwxt6AlH4Ybvj8XfEG8o.ZT2odPrA7MZf25pf150bYT5EJWSxI7K', '', '', 'd/m/Y H:i A', NULL, NULL, NULL, 0, 0, 0, b'1', b'0'),
(6, '56a9cbb7-7387-11ed-a2a7-ecebb85dcde8', NULL, NULL, 'dev4@mystream.co.uk', '$2y$10$cbv1R8RSQMRwY65AP8GKnuZ28WIPw8MyI/lvZvX2aA6V1kYBg6Gu6', '$2y$10$mhqz0hAGU3VHvgQBrlMLP.ZvHhjsZMe2jU1OYFt4dnt1amiWh3ZU6', '', '', 'd/m/Y H:i A', NULL, NULL, NULL, 0, 0, 0, b'1', b'0'),
(7, '35f9de99-753c-11ed-a2a7-ecebb85dcde8', NULL, NULL, 'dev5@mystream.co.uk', '$2y$10$yjU3yupNX6x9IyAw7tcCfeE0VZf6S2WjRB5wPV4YE4sHLnRSAhgOC', '$2y$10$fIe7kbAqHw2e8WMXWJYo0e1SD1YzLeE6KNJAgHauk6tFIzTDzL8om', '', '', 'd/m/Y H:i A', NULL, NULL, NULL, 0, 0, 0, b'1', b'0'),
(8, '67cb2109-753c-11ed-a2a7-ecebb85dcde8', NULL, NULL, 'dev6@mystream.co.uk', '$2y$10$7dWB7DsUA/w1L1DgdeZz3.w/OV9fKscfVL2tCi53BNskAWGr/BXmS', '$2y$10$kfATtD0zALLh0rEsiT.fa.5kql3WWuh7c9j4AkgB8nZjVUxLpkmai', '', '', 'd/m/Y H:i A', NULL, NULL, NULL, 0, 0, 0, b'1', b'0'),
(9, '2ea5a6d0-753e-11ed-a2a7-ecebb85dcde8', NULL, NULL, 'dev7@mystream.co.uk', '$2y$10$uDvVXAa514MzUgwhSsRa3O0EW8oQbpDl9yGp4/r8R5/86NL2nVcAG', '$2y$10$WIxMP6zzzRf1FkcT6I5VX.MJzq5uyl4cpmPzUDp4qtmhPPRD4GSGq', '', '', 'd/m/Y H:i A', NULL, NULL, NULL, 0, 0, 0, b'1', b'0'),
(10, 'cf0f8cd2-753e-11ed-a2a7-ecebb85dcde8', NULL, NULL, 'dev8@mystream.co.uk', '$2y$10$gPYF1IQ49iCY3OnDXhTpa.DehcogErHsnyOEgWY9SYZNV/rahMb1q', '$2y$10$LZjyVuM8ltQiGjgkVjYlbeKgPoz71HBMwPyFWmPTmsnT.Tofuc8nm', '', '', 'd/m/Y H:i A', NULL, NULL, NULL, 0, 0, 0, b'1', b'0'),
(11, '7ec13490-753f-11ed-a2a7-ecebb85dcde8', NULL, NULL, 'dev9@mystream.co.uk', '$2y$10$LOv0Djf6y0RVy94WKKMggODRckk2bipHw84UzmvG0jsRzkb9V1JiG', '$2y$10$YVdaY0dixyUENfbOh0tLNOMlza7Oy0wClJaBxrjUS6V1sp6OD5P7q', '', '', 'd/m/Y H:i A', NULL, NULL, NULL, 0, 0, 0, b'1', b'0'),
(12, '01e6a8f6-758f-11ed-a2a7-ecebb85dcde8', NULL, NULL, 'dev10@mystream.co.uk', '$2y$10$kYanSqikztua7hP1Q6znWOJUbpas4XYSqZlYZsCuOgJ5li3Mjl0qu', '$2y$10$UdrvssGnaz/dSvBQCnxHz./K2uR7UJdyLLdRsbJza3hGp908sGs2O', '853641964a246f00b86d19247f190fcf', '', 'd/m/Y H:i A', NULL, NULL, NULL, 0, 0, 0, b'1', b'0'),
(13, 'fcee12b2-066a-11ed-9e6a-b234123e786a', 'Asad', 'Mansuri', 'asad.mansuri@matrixhive.com', '$2y$10$TXewfIGwCNNq.0ZKx0AdAu8MYDZKrNcpuT/JyYZXVBGAoDZ32152O', '', '', '', 'd/m/Y H:i A', NULL, NULL, NULL, 0, 0, 0, b'1', b'1');

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

--
-- Dumping data for table `account_user_asset`
--

INSERT INTO `account_user_asset` (`uid`, `uid_user`, `uuid`, `filename`, `mime_type`, `ext`, `length`, `dts_created`) VALUES
(1, 12, '085a0291-793c-11ed-a2a7-ecebb85dcde8', 'Santa__Grotto_6395ac92539fd.png', 'image/png', 'png', 0, '2022-12-11 10:10:26'),
(2, 12, '0881e9c6-793c-11ed-a2a7-ecebb85dcde8', 'screen_shot_2018-10-31_at_12.20.23_pm_6395ac929403e.png', 'image/png', 'png', 0, '2022-12-11 10:10:26'),
(3, 12, '08cf6b45-793c-11ed-a2a7-ecebb85dcde8', 'pagination-animation_6395ac931bf88.gif', 'image/gif', 'gif', 0, '2022-12-11 10:10:27'),
(4, 12, '08fd9093-793c-11ed-a2a7-ecebb85dcde8', 'photo-upload_6395ac9365db9.gif', 'image/gif', 'gif', 0, '2022-12-11 10:10:27'),
(5, 12, '0950fa71-793c-11ed-a2a7-ecebb85dcde8', 'ods_style_guide_6395ac93eb500.jpg', 'image/jpg', 'jpg', 0, '2022-12-11 10:10:27'),
(6, 12, '0a8e0955-793c-11ed-a2a7-ecebb85dcde8', 'c1a29f59370871.5a262941e9d98_6395ac9609e76.png', 'image/png', 'png', 0, '2022-12-11 10:10:30'),
(7, 12, '0abd994a-793c-11ed-a2a7-ecebb85dcde8', 'dashboard_ui_kit_3.0_-_styleguide_6395ac965625d.png', 'image/png', 'png', 0, '2022-12-11 10:10:30'),
(8, 12, '0caa6004-793c-11ed-a2a7-ecebb85dcde8', 'Typography C_6395ac998e2f6.jpg', 'image/jpg', 'jpg', 0, '2022-12-11 10:10:33'),
(9, 12, 'a47cae70-79dc-11ed-a2a7-ecebb85dcde8', 'christmas-table-decorations-11_6396ba07bd1a4.jpg', 'image/jpg', 'jpg', 0, '2022-12-12 05:20:07'),
(10, 12, 'a4beabab-79dc-11ed-a2a7-ecebb85dcde8', 'mason-jar-christmas-decorations-12_6396ba0832868.jpg', 'image/jpg', 'jpg', 0, '2022-12-12 05:20:08'),
(11, 12, 'a4cf6f3a-79dc-11ed-a2a7-ecebb85dcde8', 'd4289f74454b7f99b62fde62175eea3e_6396ba084d1d8.jpg', 'image/jpg', 'jpg', 0, '2022-12-12 05:20:08'),
(12, 12, 'a4fda189-79dc-11ed-a2a7-ecebb85dcde8', 'Christmas-Table-Decoration-1200-x-800-WeAllSew-BERNINA-Blog-3_6396ba089763e.jpg', 'image/jpg', 'jpg', 0, '2022-12-12 05:20:08'),
(13, 12, 'a50899e9-79dc-11ed-a2a7-ecebb85dcde8', 'dc8afa3afecfc2a493df485bf3e53d36_6396ba08a8ec8.jpg', 'image/jpg', 'jpg', 0, '2022-12-12 05:20:08'),
(14, 12, 'a5151c07-79dc-11ed-a2a7-ecebb85dcde8', 'fairmont2_6396ba08bc976.jpg', 'image/jpg', 'jpg', 0, '2022-12-12 05:20:08'),
(15, 12, 'a5243022-79dc-11ed-a2a7-ecebb85dcde8', 'cute-outdoor-christmas-decorations_6396ba08d50bc.jpeg', 'image/jpeg', 'jpeg', 0, '2022-12-12 05:20:08'),
(16, 12, 'ad93c51c-79dc-11ed-a2a7-ecebb85dcde8', '19-diy-christmas-lights-decoration-ideas-homebnc_6396ba170632a.jpg', 'image/jpg', 'jpg', 0, '2022-12-12 05:20:23'),
(17, 12, 'ada3038a-79dc-11ed-a2a7-ecebb85dcde8', '25-DIY-christmas-table-decorations-centerpieces-apieceofrainbow-13_6396ba171eaba.jpg', 'image/jpg', 'jpg', 0, '2022-12-12 05:20:23'),
(18, 12, 'adaa9e6d-79dc-11ed-a2a7-ecebb85dcde8', '21-christmas-lights-fantasy-decoration-homebnc_6396ba172aa17.jpg', 'image/jpg', 'jpg', 0, '2022-12-12 05:20:23'),
(19, 12, 'adc32b79-79dc-11ed-a2a7-ecebb85dcde8', '69506-C0a_fYRUAAAmK9__6396ba1752050.jpg', 'image/jpg', 'jpg', 0, '2022-12-12 05:20:23'),
(20, 12, '1606435a-7a43-11ed-a2a7-ecebb85dcde8', 'egg-face-art-16_639765e6e1f21.jpg', 'image/jpg', 'jpg', 0, '2022-12-12 17:33:26'),
(21, 12, '16233882-7a43-11ed-a2a7-ecebb85dcde8', 'Egg Humor funny picture (62)_639765e71c183.jpg', 'image/jpg', 'jpg', 0, '2022-12-12 17:33:27'),
(22, 12, '162a12ff-7a43-11ed-a2a7-ecebb85dcde8', 'egg-face-art-14_639765e726feb.jpg', 'image/jpg', 'jpg', 0, '2022-12-12 17:33:27'),
(23, 12, '8eac7207-81bc-11ed-85c1-ecebb85dcde8', 'download_63a3f02c689c6.jpeg', 'image/jpeg', 'jpeg', 0, '2022-12-22 05:50:36'),
(24, 12, '418d133a-8500-11ed-85c1-ecebb85dcde8', 'a89006bc5d79a304b3623792bd6fe8d0_63a96a3e70782.png', 'image/png', 'png', 0, '2022-12-26 09:32:46'),
(25, 12, '4d5f4c2e-85bd-11ed-85c1-ecebb85dcde8', 'a89006bc5d79a304b3623792bd6fe8d0_63aaa7692ad20.png', 'image/png', 'png', 0, '2022-12-27 08:06:01'),
(26, 12, 'caf4bba9-85be-11ed-85c1-ecebb85dcde8', 'image_processing20220218-16940-356mzj_63aaa9e914577.png', 'image/png', 'png', 0, '2022-12-27 08:16:41'),
(27, 12, '429439ae-85c2-11ed-85c1-ecebb85dcde8', 'image_processing20221211-15181-q87rvo_63aaafba73dc0.png', 'image/png', 'png', 0, '2022-12-27 08:41:30'),
(28, 12, '947eeea7-85c2-11ed-85c1-ecebb85dcde8', 'image_processing20220218-31517-1p7nt83_63aab043f028a.png', 'image/png', 'png', 0, '2022-12-27 08:43:47'),
(29, 12, '4e14adc4-85c4-11ed-85c1-ecebb85dcde8', 'ezgif.com-gif-maker_63aab328c2d2e.mp4', 'video/mp4', 'mp4', 0, '2022-12-27 08:56:08'),
(30, 12, 'ff3451f5-85c4-11ed-85c1-ecebb85dcde8', 'ezgif.com-gif-maker_63aab45200ee8.mp4', 'video/mp4', 'mp4', 0, '2022-12-27 09:01:06'),
(31, 12, '2372cea1-85c5-11ed-85c1-ecebb85dcde8', 'ezgif.com-gif-maker_63aab48ec4ecd.mp4', 'video/mp4', 'mp4', 0, '2022-12-27 09:02:06'),
(32, 12, 'e279da95-85c6-11ed-85c1-ecebb85dcde8', 'ezgif.com-gif-maker_63aab77c8b97c.mp4', 'video/mp4', 'mp4', 0, '2022-12-27 09:14:36'),
(33, 12, 'd0a3cb01-85c7-11ed-85c1-ecebb85dcde8', 'ezgif.com-gif-maker_63aab90c5aecb.mp4', 'video/mp4', 'mp4', 0, '2022-12-27 09:21:16'),
(34, 12, '3c49e9fd-85cb-11ed-85c1-ecebb85dcde8', 'ezgif.com-gif-maker_63aabec947d6e.mp4', 'video/mp4', 'mp4', 0, '2022-12-27 09:45:45'),
(35, 12, '8f59de50-85ce-11ed-85c1-ecebb85dcde8', 'ezgif.com-gif-maker_63aac45d0b094.mp4', 'video/mp4', 'mp4', 0, '2022-12-27 10:09:33'),
(36, 12, '4cbce326-85cf-11ed-85c1-ecebb85dcde8', 'ezgif.com-gif-maker_63aac59b0c8a5.mp4', 'video/mp4', 'mp4', 0, '2022-12-27 10:14:51'),
(37, 12, 'c543773f-85d2-11ed-85c1-ecebb85dcde8', 'ezgif.com-gif-maker_63aacb6d79def.mp4', 'video/mp4', 'mp4', 0, '2022-12-27 10:39:41'),
(38, 12, '3c462064-85d7-11ed-85c1-ecebb85dcde8', 'ezgif.com-gif-maker_63aad2eb5778d.mp4', 'video/mp4', 'mp4', 0, '2022-12-27 11:11:39'),
(39, 12, '54f45384-85d9-11ed-85c1-ecebb85dcde8', 'ezgif.com-gif-maker_63aad66f7c6eb.mp4', 'video/mp4', 'mp4', 0, '2022-12-27 11:26:39'),
(40, 12, '12ad48c7-85e1-11ed-85c1-ecebb85dcde8', 'ezgif.com-gif-maker_63aae36c6e513.mp4', 'video/mp4', 'mp4', 0, '2022-12-27 12:22:04'),
(41, 12, '027b9bbd-85e5-11ed-85c1-ecebb85dcde8', 'ezgif.com-gif-maker_63aaea066ee81.mp4', 'video/mp4', 'mp4', 0, '2022-12-27 12:50:15'),
(42, 12, '075d47b0-85e6-11ed-85c1-ecebb85dcde8', 'image_processing20221211-15181-q87rvo_63aaebbd1537a.png', 'image/png', 'png', 0, '2022-12-27 12:57:33'),
(43, 12, '21c5f375-85e6-11ed-85c1-ecebb85dcde8', '86db3d07435b0456ad41d47279483ab7_63aaebe96048e.webp', 'image/webp', 'webp', 0, '2022-12-27 12:58:17'),
(44, 12, '523f3fe6-85e7-11ed-85c1-ecebb85dcde8', 'image-editing_63aaede81bcec.png', 'image/png', 'png', 0, '2022-12-27 13:06:48'),
(45, 12, '85b2c40d-85ea-11ed-85c1-ecebb85dcde8', '02. Abendregen_63aaf34700738.mp3', 'audio/mp3', 'mp3', 0, '2022-12-27 13:29:43'),
(46, 12, 'b25809e3-85f9-11ed-85c1-ecebb85dcde8', '4de2c56dd659818eae6d954d597aabbb15e29e90_63ab0cbc2449f.webp', 'image/webp', 'webp', 0, '2022-12-27 15:18:20'),
(47, 12, 'f268c848-85f9-11ed-85c1-ecebb85dcde8', '7c7b4e6d9f77b6f654104bfab320164fcc4c0585_63ab0d27d3106.webp', 'image/webp', 'webp', 0, '2022-12-27 15:20:07'),
(48, 12, '12351a64-85fa-11ed-85c1-ecebb85dcde8', '(4-3)-Resolve-AutomationDesigner_63ab0d5d33d1d.mp4', 'video/mp4', 'mp4', 0, '2022-12-27 15:21:01'),
(49, 12, '74e9a843-85fa-11ed-85c1-ecebb85dcde8', '2_63ab0e02c4f15.mp4', 'video/mp4', 'mp4', 0, '2022-12-27 15:23:46'),
(50, 12, 'a470f280-85fb-11ed-85c1-ecebb85dcde8', '02. Frühlingsschauer_63ab0fffa1ab8.mp3', 'audio/mp3', 'mp3', 0, '2022-12-27 15:32:16'),
(51, 12, 'f8c74181-a953-11ed-b63b-ecebb85dcde8', 'th-607753715_63e65c93e8dd1.jpg', 'image/jpg', 'jpg', 0, '2023-02-10 15:02:43'),
(52, 12, '7c822377-d8f3-11ed-9a67-ecebb85dcde8', 'Screenshot from 2023-04-11 15-28-23_6436428b900b6.png', 'image/png', 'png', 0, '2023-04-12 05:32:59'),
(53, 12, 'b061a5ac-d8f3-11ed-9a67-ecebb85dcde8', 'Screenshot from 2023-04-10 17-05-25_643642e2972b7.png', 'image/png', 'png', 0, '2023-04-12 05:34:26'),
(54, 12, '60c66b9f-d8f9-11ed-9a67-ecebb85dcde8', 'download_64364c6dd5b5b.jpeg', 'image/jpeg', 'jpeg', 0, '2023-04-12 06:15:10'),
(55, 12, '6466bef5-d8f9-11ed-9a67-ecebb85dcde8', '262986_64364c741e796.png', 'image/png', 'png', 0, '2023-04-12 06:15:16');

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

--
-- Dumping data for table `account_user_asset_meta`
--

INSERT INTO `account_user_asset_meta` (`uid`, `uid_user`, `uid_asset`, `property`, `value`, `dts_created`) VALUES
(1, 12, 1, '3', 'width=\"1040\" height=\"687\"', '2022-12-11 10:10:26'),
(2, 12, 1, 'mime', 'image/png', '2022-12-11 10:10:26'),
(3, 12, 1, 'date:create', '2022-12-11T10:10:26+00:00', '2022-12-11 10:10:26'),
(4, 12, 1, 'date:modify', '2022-12-11T10:10:26+00:00', '2022-12-11 10:10:26'),
(5, 12, 1, 'png:cHRM', 'chunk was found (see Chromaticity, above)', '2022-12-11 10:10:26'),
(6, 12, 1, 'png:gAMA', 'gamma=0.45455 (See Gamma, above)', '2022-12-11 10:10:26'),
(7, 12, 1, 'png:IHDR.bit-depth-orig', '8', '2022-12-11 10:10:26'),
(8, 12, 1, 'png:IHDR.bit_depth', '8', '2022-12-11 10:10:26'),
(9, 12, 1, 'png:IHDR.color-type-orig', '6', '2022-12-11 10:10:26'),
(10, 12, 1, 'png:IHDR.color_type', '6 (RGBA)', '2022-12-11 10:10:26'),
(11, 12, 1, 'png:IHDR.interlace_method', '0 (Not interlaced)', '2022-12-11 10:10:26'),
(12, 12, 1, 'png:IHDR.width,height', '1040, 687', '2022-12-11 10:10:26'),
(13, 12, 1, 'png:sRGB', 'intent=0 (Perceptual Intent)', '2022-12-11 10:10:26'),
(14, 12, 3, '3', 'width=\"800\" height=\"600\"', '2022-12-11 10:10:27'),
(15, 12, 3, 'mime', 'image/gif', '2022-12-11 10:10:27'),
(16, 12, 3, 'date:create', '2022-12-11T10:10:27+00:00', '2022-12-11 10:10:27'),
(17, 12, 3, 'date:modify', '2022-12-11T10:10:27+00:00', '2022-12-11 10:10:27'),
(18, 12, 4, '3', 'width=\"800\" height=\"600\"', '2022-12-11 10:10:27'),
(19, 12, 4, 'mime', 'image/gif', '2022-12-11 10:10:27'),
(20, 12, 4, 'date:create', '2022-12-11T10:10:27+00:00', '2022-12-11 10:10:27'),
(21, 12, 4, 'date:modify', '2022-12-11T10:10:27+00:00', '2022-12-11 10:10:27'),
(22, 12, 5, '3', 'width=\"4320\" height=\"9486\"', '2022-12-11 10:10:28'),
(23, 12, 5, 'mime', 'image/jpeg', '2022-12-11 10:10:28'),
(24, 12, 5, 'FileName', 'ods_style_guide_6395ac93eb500.jpg', '2022-12-11 10:10:28'),
(25, 12, 5, 'MimeType', 'image/jpeg', '2022-12-11 10:10:28'),
(26, 12, 5, 'SectionsFound', '', '2022-12-11 10:10:28'),
(27, 12, 5, 'COMPUTED', '{\"html\":\"width=\\\"4320\\\" height=\\\"9486\\\"\",\"Height\":9486,\"Width\":4320,\"IsColor\":1}', '2022-12-11 10:10:28'),
(28, 12, 5, 'date:create', '2022-12-11T10:10:27+00:00', '2022-12-11 10:10:28'),
(29, 12, 5, 'date:modify', '2022-12-11T10:10:27+00:00', '2022-12-11 10:10:28'),
(30, 12, 5, 'jpeg:colorspace', '2', '2022-12-11 10:10:28'),
(31, 12, 5, 'jpeg:sampling-factor', '1x1,1x1,1x1', '2022-12-11 10:10:28'),
(32, 12, 6, '3', 'width=\"1400\" height=\"2893\"', '2022-12-11 10:10:30'),
(33, 12, 6, 'mime', 'image/png', '2022-12-11 10:10:30'),
(34, 12, 6, 'date:create', '2022-12-11T10:10:30+00:00', '2022-12-11 10:10:30'),
(35, 12, 6, 'date:modify', '2022-12-11T10:10:30+00:00', '2022-12-11 10:10:30'),
(36, 12, 6, 'png:IHDR.bit-depth-orig', '8', '2022-12-11 10:10:30'),
(37, 12, 6, 'png:IHDR.bit_depth', '8', '2022-12-11 10:10:30'),
(38, 12, 6, 'png:IHDR.color-type-orig', '2', '2022-12-11 10:10:30'),
(39, 12, 6, 'png:IHDR.color_type', '2 (Truecolor)', '2022-12-11 10:10:30'),
(40, 12, 6, 'png:IHDR.interlace_method', '0 (Not interlaced)', '2022-12-11 10:10:30'),
(41, 12, 6, 'png:IHDR.width,height', '1400, 2893', '2022-12-11 10:10:30'),
(42, 12, 6, 'png:sRGB', 'intent=0 (Perceptual Intent)', '2022-12-11 10:10:30'),
(43, 12, 7, '3', 'width=\"1595\" height=\"9600\"', '2022-12-11 10:10:30'),
(44, 12, 7, 'mime', 'image/png', '2022-12-11 10:10:30'),
(45, 12, 7, 'date:create', '2022-12-11T10:10:30+00:00', '2022-12-11 10:10:30'),
(46, 12, 7, 'date:modify', '2022-12-11T10:10:30+00:00', '2022-12-11 10:10:30'),
(47, 12, 7, 'png:bKGD', 'chunk was found (see Background color, above)', '2022-12-11 10:10:30'),
(48, 12, 7, 'png:cHRM', 'chunk was found (see Chromaticity, above)', '2022-12-11 10:10:30'),
(49, 12, 7, 'png:gAMA', 'gamma=0.45455 (See Gamma, above)', '2022-12-11 10:10:30'),
(50, 12, 7, 'png:IHDR.bit-depth-orig', '8', '2022-12-11 10:10:30'),
(51, 12, 7, 'png:IHDR.bit_depth', '8', '2022-12-11 10:10:30'),
(52, 12, 7, 'png:IHDR.color-type-orig', '6', '2022-12-11 10:10:30'),
(53, 12, 7, 'png:IHDR.color_type', '6 (RGBA)', '2022-12-11 10:10:30'),
(54, 12, 7, 'png:IHDR.interlace_method', '0 (Not interlaced)', '2022-12-11 10:10:30'),
(55, 12, 7, 'png:IHDR.width,height', '1595, 9600', '2022-12-11 10:10:30'),
(56, 12, 7, 'png:sRGB', 'intent=0 (Perceptual Intent)', '2022-12-11 10:10:30'),
(57, 12, 8, '3', 'width=\"2560\" height=\"1480\"', '2022-12-11 10:10:34'),
(58, 12, 8, 'mime', 'image/jpeg', '2022-12-11 10:10:34'),
(59, 12, 8, 'FileName', 'Typography C_6395ac998e2f6.jpg', '2022-12-11 10:10:34'),
(60, 12, 8, 'MimeType', 'image/jpeg', '2022-12-11 10:10:34'),
(61, 12, 8, 'SectionsFound', 'ANY_TAG, IFD0, THUMBNAIL, EXIF', '2022-12-11 10:10:34'),
(62, 12, 8, 'COMPUTED', '{\"html\":\"width=\\\"2560\\\" height=\\\"1480\\\"\",\"Height\":1480,\"Width\":2560,\"IsColor\":1,\"ByteOrderMotorola\":1,\"Thumbnail.FileType\":2,\"Thumbnail.MimeType\":\"image\\/jpeg\"}', '2022-12-11 10:10:34'),
(63, 12, 8, 'XResolution', '720000/10000', '2022-12-11 10:10:34'),
(64, 12, 8, 'YResolution', '720000/10000', '2022-12-11 10:10:34'),
(65, 12, 8, 'Software', 'Adobe Photoshop CC 2019 (Windows)', '2022-12-11 10:10:34'),
(66, 12, 8, 'DateTime', '2019:08:26 09:46:44', '2022-12-11 10:10:34'),
(67, 12, 8, 'THUMBNAIL', '{\"Compression\":6,\"XResolution\":\"72\\/1\",\"YResolution\":\"72\\/1\",\"ResolutionUnit\":2,\"JPEGInterchangeFormat\":306,\"JPEGInterchangeFormatLength\":5023}', '2022-12-11 10:10:34'),
(68, 12, 8, 'date:create', '2022-12-11T10:10:33+00:00', '2022-12-11 10:10:34'),
(69, 12, 8, 'date:modify', '2022-12-11T10:10:33+00:00', '2022-12-11 10:10:34'),
(70, 12, 8, 'exif:ColorSpace', '1', '2022-12-11 10:10:34'),
(71, 12, 8, 'exif:DateTime', '2019:08:26 09:46:44', '2022-12-11 10:10:34'),
(72, 12, 8, 'exif:ExifOffset', '168', '2022-12-11 10:10:34'),
(73, 12, 8, 'exif:Orientation', '1', '2022-12-11 10:10:34'),
(74, 12, 8, 'exif:PixelXDimension', '2560', '2022-12-11 10:10:34'),
(75, 12, 8, 'exif:PixelYDimension', '1480', '2022-12-11 10:10:34'),
(76, 12, 8, 'exif:ResolutionUnit', '2', '2022-12-11 10:10:34'),
(77, 12, 8, 'exif:Software', 'Adobe Photoshop CC 2019 (Windows)', '2022-12-11 10:10:34'),
(78, 12, 8, 'exif:thumbnail:Compression', '6', '2022-12-11 10:10:34'),
(79, 12, 8, 'exif:thumbnail:JPEGInterchangeFormat', '306', '2022-12-11 10:10:34'),
(80, 12, 8, 'exif:thumbnail:JPEGInterchangeFormatLength', '5023', '2022-12-11 10:10:34'),
(81, 12, 8, 'exif:thumbnail:ResolutionUnit', '2', '2022-12-11 10:10:34'),
(82, 12, 8, 'exif:thumbnail:XResolution', '72/1', '2022-12-11 10:10:34'),
(83, 12, 8, 'exif:thumbnail:YResolution', '72/1', '2022-12-11 10:10:34'),
(84, 12, 8, 'exif:XResolution', '720000/10000', '2022-12-11 10:10:34'),
(85, 12, 8, 'exif:YResolution', '720000/10000', '2022-12-11 10:10:34'),
(86, 12, 8, 'icc:copyright', 'Copyright (c) 1998 Hewlett-Packard Company', '2022-12-11 10:10:34'),
(87, 12, 8, 'icc:description', 'sRGB IEC61966-2.1', '2022-12-11 10:10:34'),
(88, 12, 8, 'icc:manufacturer', 'IEC http://www.iec.ch', '2022-12-11 10:10:34'),
(89, 12, 8, 'icc:model', 'IEC 61966-2.1 Default RGB colour space - sRGB', '2022-12-11 10:10:34'),
(90, 12, 8, 'jpeg:colorspace', '2', '2022-12-11 10:10:34'),
(91, 12, 8, 'jpeg:sampling-factor', '1x1,1x1,1x1', '2022-12-11 10:10:34'),
(92, 12, 9, '3', 'width=\"600\" height=\"790\"', '2022-12-12 05:20:08'),
(93, 12, 9, 'mime', 'image/jpeg', '2022-12-12 05:20:08'),
(94, 12, 9, 'FileName', 'christmas-table-decorations-11_6396ba07bd1a4.jpg', '2022-12-12 05:20:08'),
(95, 12, 9, 'MimeType', 'image/jpeg', '2022-12-12 05:20:08'),
(96, 12, 9, 'SectionsFound', 'ANY_TAG, IFD0, THUMBNAIL, EXIF', '2022-12-12 05:20:08'),
(97, 12, 9, 'COMPUTED', '{\"html\":\"width=\\\"600\\\" height=\\\"790\\\"\",\"Height\":790,\"Width\":600,\"IsColor\":1,\"ByteOrderMotorola\":1,\"Thumbnail.FileType\":2,\"Thumbnail.MimeType\":\"image\\/jpeg\"}', '2022-12-12 05:20:08'),
(98, 12, 9, 'XResolution', '720000/10000', '2022-12-12 05:20:08'),
(99, 12, 9, 'YResolution', '720000/10000', '2022-12-12 05:20:08'),
(100, 12, 9, 'Software', 'Adobe Photoshop CS4 Windows', '2022-12-12 05:20:08'),
(101, 12, 9, 'DateTime', '2016:01:23 13:06:30', '2022-12-12 05:20:08'),
(102, 12, 9, 'THUMBNAIL', '{\"Compression\":6,\"XResolution\":\"72\\/1\",\"YResolution\":\"72\\/1\",\"ResolutionUnit\":2,\"JPEGInterchangeFormat\":302,\"JPEGInterchangeFormatLength\":7551}', '2022-12-12 05:20:08'),
(103, 12, 9, 'date:create', '2022-12-12T05:20:07+00:00', '2022-12-12 05:20:08'),
(104, 12, 9, 'date:modify', '2022-12-12T05:20:07+00:00', '2022-12-12 05:20:08'),
(105, 12, 9, 'exif:ColorSpace', '65535', '2022-12-12 05:20:08'),
(106, 12, 9, 'exif:DateTime', '2016:01:23 13:06:30', '2022-12-12 05:20:08'),
(107, 12, 9, 'exif:ExifOffset', '164', '2022-12-12 05:20:08'),
(108, 12, 9, 'exif:Orientation', '1', '2022-12-12 05:20:08'),
(109, 12, 9, 'exif:PixelXDimension', '600', '2022-12-12 05:20:08'),
(110, 12, 9, 'exif:PixelYDimension', '790', '2022-12-12 05:20:08'),
(111, 12, 9, 'exif:ResolutionUnit', '2', '2022-12-12 05:20:08'),
(112, 12, 9, 'exif:Software', 'Adobe Photoshop CS4 Windows', '2022-12-12 05:20:08'),
(113, 12, 9, 'exif:thumbnail:Compression', '6', '2022-12-12 05:20:08'),
(114, 12, 9, 'exif:thumbnail:JPEGInterchangeFormat', '302', '2022-12-12 05:20:08'),
(115, 12, 9, 'exif:thumbnail:JPEGInterchangeFormatLength', '7551', '2022-12-12 05:20:08'),
(116, 12, 9, 'exif:thumbnail:ResolutionUnit', '2', '2022-12-12 05:20:08'),
(117, 12, 9, 'exif:thumbnail:XResolution', '72/1', '2022-12-12 05:20:08'),
(118, 12, 9, 'exif:thumbnail:YResolution', '72/1', '2022-12-12 05:20:08'),
(119, 12, 9, 'exif:XResolution', '720000/10000', '2022-12-12 05:20:08'),
(120, 12, 9, 'exif:YResolution', '720000/10000', '2022-12-12 05:20:08'),
(121, 12, 9, 'jpeg:colorspace', '2', '2022-12-12 05:20:08'),
(122, 12, 9, 'jpeg:sampling-factor', '2x2,1x1,1x1', '2022-12-12 05:20:08'),
(123, 12, 10, '3', 'width=\"600\" height=\"890\"', '2022-12-12 05:20:08'),
(124, 12, 10, 'mime', 'image/jpeg', '2022-12-12 05:20:08'),
(125, 12, 10, 'FileName', 'mason-jar-christmas-decorations-12_6396ba0832868.jpg', '2022-12-12 05:20:08'),
(126, 12, 10, 'MimeType', 'image/jpeg', '2022-12-12 05:20:08'),
(127, 12, 10, 'SectionsFound', 'ANY_TAG, IFD0, THUMBNAIL, EXIF', '2022-12-12 05:20:08'),
(128, 12, 10, 'COMPUTED', '{\"html\":\"width=\\\"600\\\" height=\\\"890\\\"\",\"Height\":890,\"Width\":600,\"IsColor\":1,\"ByteOrderMotorola\":0,\"Thumbnail.FileType\":2,\"Thumbnail.MimeType\":\"image\\/jpeg\"}', '2022-12-12 05:20:08'),
(129, 12, 10, 'XResolution', '720000/10000', '2022-12-12 05:20:08'),
(130, 12, 10, 'YResolution', '720000/10000', '2022-12-12 05:20:08'),
(131, 12, 10, 'Software', 'Adobe Photoshop CS4 Windows', '2022-12-12 05:20:08'),
(132, 12, 10, 'DateTime', '2015:10:26 16:06:17', '2022-12-12 05:20:08'),
(133, 12, 10, 'THUMBNAIL', '{\"Compression\":6,\"XResolution\":\"72\\/1\",\"YResolution\":\"72\\/1\",\"ResolutionUnit\":2,\"JPEGInterchangeFormat\":302,\"JPEGInterchangeFormatLength\":7371}', '2022-12-12 05:20:08'),
(134, 12, 10, 'date:create', '2022-12-12T05:20:08+00:00', '2022-12-12 05:20:08'),
(135, 12, 10, 'date:modify', '2022-12-12T05:20:08+00:00', '2022-12-12 05:20:08'),
(136, 12, 10, 'exif:ColorSpace', '65535', '2022-12-12 05:20:08'),
(137, 12, 10, 'exif:DateTime', '2015:10:26 16:06:17', '2022-12-12 05:20:08'),
(138, 12, 10, 'exif:ExifOffset', '164', '2022-12-12 05:20:08'),
(139, 12, 10, 'exif:Orientation', '1', '2022-12-12 05:20:08'),
(140, 12, 10, 'exif:PixelXDimension', '600', '2022-12-12 05:20:08'),
(141, 12, 10, 'exif:PixelYDimension', '890', '2022-12-12 05:20:08'),
(142, 12, 10, 'exif:ResolutionUnit', '2', '2022-12-12 05:20:08'),
(143, 12, 10, 'exif:Software', 'Adobe Photoshop CS4 Windows', '2022-12-12 05:20:08'),
(144, 12, 10, 'exif:thumbnail:Compression', '6', '2022-12-12 05:20:08'),
(145, 12, 10, 'exif:thumbnail:JPEGInterchangeFormat', '302', '2022-12-12 05:20:08'),
(146, 12, 10, 'exif:thumbnail:JPEGInterchangeFormatLength', '7371', '2022-12-12 05:20:08'),
(147, 12, 10, 'exif:thumbnail:ResolutionUnit', '2', '2022-12-12 05:20:08'),
(148, 12, 10, 'exif:thumbnail:XResolution', '72/1', '2022-12-12 05:20:08'),
(149, 12, 10, 'exif:thumbnail:YResolution', '72/1', '2022-12-12 05:20:08'),
(150, 12, 10, 'exif:XResolution', '720000/10000', '2022-12-12 05:20:08'),
(151, 12, 10, 'exif:YResolution', '720000/10000', '2022-12-12 05:20:08'),
(152, 12, 10, 'icc:copyright', 'Copyright 1999 Adobe Systems Incorporated', '2022-12-12 05:20:08'),
(153, 12, 10, 'icc:description', 'Adobe RGB (1998)', '2022-12-12 05:20:08'),
(154, 12, 10, 'jpeg:colorspace', '2', '2022-12-12 05:20:08'),
(155, 12, 10, 'jpeg:sampling-factor', '1x1,1x1,1x1', '2022-12-12 05:20:08'),
(156, 12, 11, '3', 'width=\"1936\" height=\"2592\"', '2022-12-12 05:20:08'),
(157, 12, 11, 'mime', 'image/jpeg', '2022-12-12 05:20:08'),
(158, 12, 11, 'FileName', 'd4289f74454b7f99b62fde62175eea3e_6396ba084d1d8.jpg', '2022-12-12 05:20:08'),
(159, 12, 11, 'MimeType', 'image/jpeg', '2022-12-12 05:20:08'),
(160, 12, 11, 'SectionsFound', '', '2022-12-12 05:20:08'),
(161, 12, 11, 'COMPUTED', '{\"html\":\"width=\\\"1936\\\" height=\\\"2592\\\"\",\"Height\":2592,\"Width\":1936,\"IsColor\":1}', '2022-12-12 05:20:08'),
(162, 12, 11, 'date:create', '2022-12-12T05:20:08+00:00', '2022-12-12 05:20:08'),
(163, 12, 11, 'date:modify', '2022-12-12T05:20:08+00:00', '2022-12-12 05:20:08'),
(164, 12, 11, 'jpeg:colorspace', '2', '2022-12-12 05:20:08'),
(165, 12, 11, 'jpeg:sampling-factor', '2x2,1x1,1x1', '2022-12-12 05:20:08'),
(166, 12, 12, '3', 'width=\"1200\" height=\"795\"', '2022-12-12 05:20:08'),
(167, 12, 12, 'mime', 'image/jpeg', '2022-12-12 05:20:08'),
(168, 12, 12, 'FileName', 'Christmas-Table-Decoration-1200-x-800-WeAllSew-BERNINA-Blog-3_6396ba089763e.jpg', '2022-12-12 05:20:08'),
(169, 12, 12, 'MimeType', 'image/jpeg', '2022-12-12 05:20:08'),
(170, 12, 12, 'SectionsFound', 'ANY_TAG, IFD0, THUMBNAIL, EXIF', '2022-12-12 05:20:08'),
(171, 12, 12, 'COMPUTED', '{\"html\":\"width=\\\"1200\\\" height=\\\"795\\\"\",\"Height\":795,\"Width\":1200,\"IsColor\":1,\"ByteOrderMotorola\":0,\"ApertureFNumber\":\"f\\/9.5\",\"Copyright\":\"Charles Crust\",\"Thumbnail.FileType\":2,\"Thumbnail.MimeType\":\"image\\/jpeg\"}', '2022-12-12 05:20:08'),
(172, 12, 12, 'Make', 'PENTAX', '2022-12-12 05:20:08'),
(173, 12, 12, 'Model', 'PENTAX K-5', '2022-12-12 05:20:08'),
(174, 12, 12, 'XResolution', '72/1', '2022-12-12 05:20:08'),
(175, 12, 12, 'YResolution', '72/1', '2022-12-12 05:20:08'),
(176, 12, 12, 'Software', 'Adobe Photoshop Lightroom 6.3 (Windows)', '2022-12-12 05:20:08'),
(177, 12, 12, 'DateTime', '2015:12:16 10:26:48', '2022-12-12 05:20:08'),
(178, 12, 12, 'Artist', 'C Crust', '2022-12-12 05:20:08'),
(179, 12, 12, 'Copyright', 'Charles Crust', '2022-12-12 05:20:08'),
(180, 12, 12, 'THUMBNAIL', '{\"Compression\":6,\"XResolution\":\"72\\/1\",\"YResolution\":\"72\\/1\",\"ResolutionUnit\":2,\"JPEGInterchangeFormat\":804,\"JPEGInterchangeFormatLength\":19130}', '2022-12-12 05:20:08'),
(181, 12, 12, 'ExposureTime', '4/1', '2022-12-12 05:20:08'),
(182, 12, 12, 'FNumber', '95/10', '2022-12-12 05:20:08'),
(183, 12, 12, 'ExifVersion', '0230', '2022-12-12 05:20:08'),
(184, 12, 12, 'DateTimeOriginal', '2015:10:23 12:55:47', '2022-12-12 05:20:08'),
(185, 12, 12, 'DateTimeDigitized', '2015:10:23 12:55:47', '2022-12-12 05:20:08'),
(186, 12, 12, 'ShutterSpeedValue', '-2/1', '2022-12-12 05:20:08'),
(187, 12, 12, 'ApertureValue', '6495855/1000000', '2022-12-12 05:20:08'),
(188, 12, 12, 'ExposureBiasValue', '0/10', '2022-12-12 05:20:08'),
(189, 12, 12, 'FocalLength', '2800/100', '2022-12-12 05:20:08'),
(190, 12, 12, 'UndefinedTag:0xA432', '[\"280\\/10\",\"700\\/10\",\"28\\/10\",\"28\\/10\"]', '2022-12-12 05:20:08'),
(191, 12, 12, 'UndefinedTag:0xA434', 'smc PENTAX-FA* 28-70mm F2.8 AL', '2022-12-12 05:20:08'),
(192, 12, 12, 'date:create', '2022-12-12T05:20:08+00:00', '2022-12-12 05:20:08'),
(193, 12, 12, 'date:modify', '2022-12-12T05:20:08+00:00', '2022-12-12 05:20:08'),
(194, 12, 12, 'exif:ApertureValue', '6495855/1000000', '2022-12-12 05:20:08'),
(195, 12, 12, 'exif:Artist', 'C Crust', '2022-12-12 05:20:08'),
(196, 12, 12, 'exif:Contrast', '0', '2022-12-12 05:20:08'),
(197, 12, 12, 'exif:Copyright', 'Charles Crust', '2022-12-12 05:20:08'),
(198, 12, 12, 'exif:CustomRendered', '0', '2022-12-12 05:20:08'),
(199, 12, 12, 'exif:DateTime', '2015:12:16 10:26:48', '2022-12-12 05:20:08'),
(200, 12, 12, 'exif:DateTimeDigitized', '2015:10:23 12:55:47', '2022-12-12 05:20:08'),
(201, 12, 12, 'exif:DateTimeOriginal', '2015:10:23 12:55:47', '2022-12-12 05:20:08'),
(202, 12, 12, 'exif:ExifOffset', '252', '2022-12-12 05:20:08'),
(203, 12, 12, 'exif:ExifVersion', '48, 50, 51, 48', '2022-12-12 05:20:08'),
(204, 12, 12, 'exif:ExposureBiasValue', '0/10', '2022-12-12 05:20:08'),
(205, 12, 12, 'exif:ExposureMode', '1', '2022-12-12 05:20:08'),
(206, 12, 12, 'exif:ExposureProgram', '1', '2022-12-12 05:20:08'),
(207, 12, 12, 'exif:ExposureTime', '4/1', '2022-12-12 05:20:08'),
(208, 12, 12, 'exif:Flash', '16', '2022-12-12 05:20:08'),
(209, 12, 12, 'exif:FNumber', '95/10', '2022-12-12 05:20:08'),
(210, 12, 12, 'exif:FocalLength', '2800/100', '2022-12-12 05:20:08'),
(211, 12, 12, 'exif:FocalLengthIn35mmFilm', '42', '2022-12-12 05:20:08'),
(212, 12, 12, 'exif:LensModel', 'smc PENTAX-FA* 28-70mm F2.8 AL', '2022-12-12 05:20:08'),
(213, 12, 12, 'exif:LensSpecification', '280/10, 700/10, 28/10, 28/10', '2022-12-12 05:20:08'),
(214, 12, 12, 'exif:Make', 'PENTAX', '2022-12-12 05:20:08'),
(215, 12, 12, 'exif:MeteringMode', '2', '2022-12-12 05:20:08'),
(216, 12, 12, 'exif:Model', 'PENTAX K-5', '2022-12-12 05:20:08'),
(217, 12, 12, 'exif:PhotographicSensitivity', '80', '2022-12-12 05:20:08'),
(218, 12, 12, 'exif:ResolutionUnit', '2', '2022-12-12 05:20:08'),
(219, 12, 12, 'exif:Saturation', '0', '2022-12-12 05:20:08'),
(220, 12, 12, 'exif:SceneCaptureType', '0', '2022-12-12 05:20:08'),
(221, 12, 12, 'exif:SensingMethod', '2', '2022-12-12 05:20:08'),
(222, 12, 12, 'exif:Sharpness', '0', '2022-12-12 05:20:08'),
(223, 12, 12, 'exif:ShutterSpeedValue', '-2/1', '2022-12-12 05:20:08'),
(224, 12, 12, 'exif:Software', 'Adobe Photoshop Lightroom 6.3 (Windows)', '2022-12-12 05:20:08'),
(225, 12, 12, 'exif:SubjectDistanceRange', '2', '2022-12-12 05:20:08'),
(226, 12, 12, 'exif:thumbnail:Compression', '6', '2022-12-12 05:20:08'),
(227, 12, 12, 'exif:thumbnail:JPEGInterchangeFormat', '804', '2022-12-12 05:20:08'),
(228, 12, 12, 'exif:thumbnail:JPEGInterchangeFormatLength', '19130', '2022-12-12 05:20:08'),
(229, 12, 12, 'exif:thumbnail:ResolutionUnit', '2', '2022-12-12 05:20:08'),
(230, 12, 12, 'exif:thumbnail:XResolution', '72/1', '2022-12-12 05:20:08'),
(231, 12, 12, 'exif:thumbnail:YResolution', '72/1', '2022-12-12 05:20:08'),
(232, 12, 12, 'exif:WhiteBalance', '0', '2022-12-12 05:20:08'),
(233, 12, 12, 'exif:XResolution', '72/1', '2022-12-12 05:20:08'),
(234, 12, 12, 'exif:YResolution', '72/1', '2022-12-12 05:20:08'),
(235, 12, 12, 'icc:copyright', 'Copyright (c) 1998 Hewlett-Packard Company', '2022-12-12 05:20:08'),
(236, 12, 12, 'icc:description', 'sRGB IEC61966-2.1', '2022-12-12 05:20:08'),
(237, 12, 12, 'icc:manufacturer', 'IEC http://www.iec.ch', '2022-12-12 05:20:08'),
(238, 12, 12, 'icc:model', 'IEC 61966-2.1 Default RGB colour space - sRGB', '2022-12-12 05:20:08'),
(239, 12, 12, 'jpeg:colorspace', '2', '2022-12-12 05:20:08'),
(240, 12, 12, 'jpeg:sampling-factor', '1x1,1x1,1x1', '2022-12-12 05:20:08'),
(241, 12, 13, '3', 'width=\"1280\" height=\"960\"', '2022-12-12 05:20:08'),
(242, 12, 13, 'mime', 'image/jpeg', '2022-12-12 05:20:08'),
(243, 12, 13, 'FileName', 'dc8afa3afecfc2a493df485bf3e53d36_6396ba08a8ec8.jpg', '2022-12-12 05:20:08'),
(244, 12, 13, 'MimeType', 'image/jpeg', '2022-12-12 05:20:08'),
(245, 12, 13, 'SectionsFound', 'COMMENT', '2022-12-12 05:20:08'),
(246, 12, 13, 'COMPUTED', '{\"html\":\"width=\\\"1280\\\" height=\\\"960\\\"\",\"Height\":960,\"Width\":1280,\"IsColor\":1}', '2022-12-12 05:20:08'),
(247, 12, 13, 'COMMENT', '[\"CREATOR: gd-jpeg v1.0 (using IJG JPEG v62), quality = 80\\n\"]', '2022-12-12 05:20:08'),
(248, 12, 13, 'comment', 'CREATOR: gd-jpeg v1.0 (using IJG JPEG v62), quality = 80', '2022-12-12 05:20:08'),
(249, 12, 13, 'date:create', '2022-12-12T05:20:08+00:00', '2022-12-12 05:20:08'),
(250, 12, 13, 'date:modify', '2022-12-12T05:20:08+00:00', '2022-12-12 05:20:08'),
(251, 12, 13, 'jpeg:colorspace', '2', '2022-12-12 05:20:08'),
(252, 12, 13, 'jpeg:sampling-factor', '2x2,1x1,1x1', '2022-12-12 05:20:08'),
(253, 12, 14, '3', 'width=\"1500\" height=\"1000\"', '2022-12-12 05:20:08'),
(254, 12, 14, 'mime', 'image/jpeg', '2022-12-12 05:20:08'),
(255, 12, 14, 'FileName', 'fairmont2_6396ba08bc976.jpg', '2022-12-12 05:20:08'),
(256, 12, 14, 'MimeType', 'image/jpeg', '2022-12-12 05:20:08'),
(257, 12, 14, 'SectionsFound', 'ANY_TAG, IFD0, THUMBNAIL, EXIF', '2022-12-12 05:20:08'),
(258, 12, 14, 'COMPUTED', '{\"html\":\"width=\\\"1500\\\" height=\\\"1000\\\"\",\"Height\":1000,\"Width\":1500,\"IsColor\":1,\"ByteOrderMotorola\":0,\"CCDWidth\":\"7mm\",\"ApertureFNumber\":\"f\\/2.8\",\"Thumbnail.FileType\":2,\"Thumbnail.MimeType\":\"image\\/jpeg\"}', '2022-12-12 05:20:08'),
(259, 12, 14, 'Make', 'Canon', '2022-12-12 05:20:08'),
(260, 12, 14, 'Model', 'Canon EOS DIGITAL REBEL XSi', '2022-12-12 05:20:08'),
(261, 12, 14, 'XResolution', '2400000/10000', '2022-12-12 05:20:08'),
(262, 12, 14, 'YResolution', '2400000/10000', '2022-12-12 05:20:08'),
(263, 12, 14, 'Software', 'Adobe Photoshop Elements 8.0 Windows', '2022-12-12 05:20:08'),
(264, 12, 14, 'DateTime', '2012:12:11 14:26:38', '2022-12-12 05:20:08'),
(265, 12, 14, 'THUMBNAIL', '{\"Compression\":6,\"XResolution\":\"72\\/1\",\"YResolution\":\"72\\/1\",\"ResolutionUnit\":2,\"JPEGInterchangeFormat\":770,\"JPEGInterchangeFormatLength\":9761}', '2022-12-12 05:20:08'),
(266, 12, 14, 'ExposureTime', '1/15', '2022-12-12 05:20:08'),
(267, 12, 14, 'FNumber', '28/10', '2022-12-12 05:20:08'),
(268, 12, 14, 'ExifVersion', '0221', '2022-12-12 05:20:08'),
(269, 12, 14, 'DateTimeOriginal', '2012:12:06 05:33:02', '2022-12-12 05:20:08'),
(270, 12, 14, 'DateTimeDigitized', '2012:12:06 05:33:02', '2022-12-12 05:20:08'),
(271, 12, 14, 'ShutterSpeedValue', '3906891/1000000', '2022-12-12 05:20:08'),
(272, 12, 14, 'ApertureValue', '2970854/1000000', '2022-12-12 05:20:08'),
(273, 12, 14, 'ExposureBiasValue', '0/1', '2022-12-12 05:20:08'),
(274, 12, 14, 'MaxApertureValue', '3/1', '2022-12-12 05:20:08'),
(275, 12, 14, 'FocalLength', '24/1', '2022-12-12 05:20:08'),
(276, 12, 14, 'SubSecTime', '87', '2022-12-12 05:20:08'),
(277, 12, 14, 'SubSecTimeOriginal', '87', '2022-12-12 05:20:08'),
(278, 12, 14, 'SubSecTimeDigitized', '87', '2022-12-12 05:20:08'),
(279, 12, 14, 'FocalPlaneXResolution', '4272000/878', '2022-12-12 05:20:08'),
(280, 12, 14, 'FocalPlaneYResolution', '2848000/584', '2022-12-12 05:20:08'),
(281, 12, 14, 'date:create', '2022-12-12T05:20:08+00:00', '2022-12-12 05:20:08'),
(282, 12, 14, 'date:modify', '2022-12-12T05:20:08+00:00', '2022-12-12 05:20:08'),
(283, 12, 14, 'exif:ApertureValue', '2970854/1000000', '2022-12-12 05:20:08'),
(284, 12, 14, 'exif:ColorSpace', '1', '2022-12-12 05:20:08'),
(285, 12, 14, 'exif:CustomRendered', '0', '2022-12-12 05:20:08'),
(286, 12, 14, 'exif:DateTime', '2012:12:11 14:26:38', '2022-12-12 05:20:08'),
(287, 12, 14, 'exif:DateTimeDigitized', '2012:12:06 05:33:02', '2022-12-12 05:20:08'),
(288, 12, 14, 'exif:DateTimeOriginal', '2012:12:06 05:33:02', '2022-12-12 05:20:08'),
(289, 12, 14, 'exif:ExifOffset', '232', '2022-12-12 05:20:08'),
(290, 12, 14, 'exif:ExifVersion', '48, 50, 50, 49', '2022-12-12 05:20:08'),
(291, 12, 14, 'exif:ExposureBiasValue', '0/1', '2022-12-12 05:20:08'),
(292, 12, 14, 'exif:ExposureMode', '0', '2022-12-12 05:20:08'),
(293, 12, 14, 'exif:ExposureProgram', '4', '2022-12-12 05:20:08'),
(294, 12, 14, 'exif:ExposureTime', '1/15', '2022-12-12 05:20:08'),
(295, 12, 14, 'exif:Flash', '16', '2022-12-12 05:20:08'),
(296, 12, 14, 'exif:FNumber', '28/10', '2022-12-12 05:20:08'),
(297, 12, 14, 'exif:FocalLength', '24/1', '2022-12-12 05:20:08'),
(298, 12, 14, 'exif:FocalPlaneResolutionUnit', '2', '2022-12-12 05:20:08'),
(299, 12, 14, 'exif:FocalPlaneXResolution', '4272000/878', '2022-12-12 05:20:08'),
(300, 12, 14, 'exif:FocalPlaneYResolution', '2848000/584', '2022-12-12 05:20:08'),
(301, 12, 14, 'exif:Make', 'Canon', '2022-12-12 05:20:08'),
(302, 12, 14, 'exif:MaxApertureValue', '3/1', '2022-12-12 05:20:08'),
(303, 12, 14, 'exif:MeteringMode', '5', '2022-12-12 05:20:08'),
(304, 12, 14, 'exif:Model', 'Canon EOS DIGITAL REBEL XSi', '2022-12-12 05:20:08'),
(305, 12, 14, 'exif:Orientation', '1', '2022-12-12 05:20:08'),
(306, 12, 14, 'exif:PhotographicSensitivity', '400', '2022-12-12 05:20:08'),
(307, 12, 14, 'exif:PixelXDimension', '1500', '2022-12-12 05:20:08'),
(308, 12, 14, 'exif:PixelYDimension', '1000', '2022-12-12 05:20:08'),
(309, 12, 14, 'exif:ResolutionUnit', '2', '2022-12-12 05:20:08'),
(310, 12, 14, 'exif:SceneCaptureType', '0', '2022-12-12 05:20:08'),
(311, 12, 14, 'exif:ShutterSpeedValue', '3906891/1000000', '2022-12-12 05:20:08'),
(312, 12, 14, 'exif:Software', 'Adobe Photoshop Elements 8.0 Windows', '2022-12-12 05:20:08'),
(313, 12, 14, 'exif:SubSecTime', '87', '2022-12-12 05:20:08'),
(314, 12, 14, 'exif:SubSecTimeDigitized', '87', '2022-12-12 05:20:08'),
(315, 12, 14, 'exif:SubSecTimeOriginal', '87', '2022-12-12 05:20:08'),
(316, 12, 14, 'exif:thumbnail:Compression', '6', '2022-12-12 05:20:08'),
(317, 12, 14, 'exif:thumbnail:JPEGInterchangeFormat', '770', '2022-12-12 05:20:08'),
(318, 12, 14, 'exif:thumbnail:JPEGInterchangeFormatLength', '9761', '2022-12-12 05:20:08'),
(319, 12, 14, 'exif:thumbnail:ResolutionUnit', '2', '2022-12-12 05:20:08'),
(320, 12, 14, 'exif:thumbnail:XResolution', '72/1', '2022-12-12 05:20:08'),
(321, 12, 14, 'exif:thumbnail:YResolution', '72/1', '2022-12-12 05:20:08'),
(322, 12, 14, 'exif:WhiteBalance', '0', '2022-12-12 05:20:08'),
(323, 12, 14, 'exif:XResolution', '2400000/10000', '2022-12-12 05:20:08'),
(324, 12, 14, 'exif:YResolution', '2400000/10000', '2022-12-12 05:20:08'),
(325, 12, 14, 'icc:copyright', 'Copyright (c) 1998 Hewlett-Packard Company', '2022-12-12 05:20:08'),
(326, 12, 14, 'icc:description', 'sRGB IEC61966-2.1', '2022-12-12 05:20:08'),
(327, 12, 14, 'icc:manufacturer', 'IEC http://www.iec.ch', '2022-12-12 05:20:08'),
(328, 12, 14, 'icc:model', 'IEC 61966-2.1 Default RGB colour space - sRGB', '2022-12-12 05:20:08'),
(329, 12, 14, 'jpeg:colorspace', '2', '2022-12-12 05:20:08'),
(330, 12, 14, 'jpeg:sampling-factor', '1x1,1x1,1x1', '2022-12-12 05:20:08'),
(331, 12, 15, '3', 'width=\"700\" height=\"1101\"', '2022-12-12 05:20:08'),
(332, 12, 15, 'mime', 'image/jpeg', '2022-12-12 05:20:08'),
(333, 12, 15, 'FileName', 'cute-outdoor-christmas-decorations_6396ba08d50bc.jpeg', '2022-12-12 05:20:08'),
(334, 12, 15, 'MimeType', 'image/jpeg', '2022-12-12 05:20:08'),
(335, 12, 15, 'SectionsFound', 'COMMENT', '2022-12-12 05:20:08'),
(336, 12, 15, 'COMPUTED', '{\"html\":\"width=\\\"700\\\" height=\\\"1101\\\"\",\"Height\":1101,\"Width\":700,\"IsColor\":1}', '2022-12-12 05:20:08'),
(337, 12, 15, 'COMMENT', '[\"CREATOR: gd-jpeg v1.0 (using IJG JPEG v80), quality = 90\\n\"]', '2022-12-12 05:20:08'),
(338, 12, 15, 'comment', 'CREATOR: gd-jpeg v1.0 (using IJG JPEG v80), quality = 90', '2022-12-12 05:20:08'),
(339, 12, 15, 'date:create', '2022-12-12T05:20:08+00:00', '2022-12-12 05:20:08'),
(340, 12, 15, 'date:modify', '2022-12-12T05:20:08+00:00', '2022-12-12 05:20:08'),
(341, 12, 15, 'jpeg:colorspace', '2', '2022-12-12 05:20:08'),
(342, 12, 15, 'jpeg:sampling-factor', '2x2,1x1,1x1', '2022-12-12 05:20:08'),
(343, 12, 16, '3', 'width=\"956\" height=\"956\"', '2022-12-12 05:20:23'),
(344, 12, 16, 'mime', 'image/jpeg', '2022-12-12 05:20:23'),
(345, 12, 16, 'FileName', '19-diy-christmas-lights-decoration-ideas-homebnc_6396ba170632a.jpg', '2022-12-12 05:20:23'),
(346, 12, 16, 'MimeType', 'image/jpeg', '2022-12-12 05:20:23'),
(347, 12, 16, 'SectionsFound', '', '2022-12-12 05:20:23'),
(348, 12, 16, 'COMPUTED', '{\"html\":\"width=\\\"956\\\" height=\\\"956\\\"\",\"Height\":956,\"Width\":956,\"IsColor\":1}', '2022-12-12 05:20:23'),
(349, 12, 16, 'date:create', '2022-12-12T05:20:23+00:00', '2022-12-12 05:20:23'),
(350, 12, 16, 'date:modify', '2022-12-12T05:20:23+00:00', '2022-12-12 05:20:23'),
(351, 12, 16, 'jpeg:colorspace', '2', '2022-12-12 05:20:23'),
(352, 12, 16, 'jpeg:sampling-factor', '2x2,1x1,1x1', '2022-12-12 05:20:23'),
(353, 12, 17, '3', 'width=\"680\" height=\"680\"', '2022-12-12 05:20:23'),
(354, 12, 17, 'mime', 'image/jpeg', '2022-12-12 05:20:23'),
(355, 12, 17, 'FileName', '25-DIY-christmas-table-decorations-centerpieces-apieceofrainbow-13_6396ba171eaba.jpg', '2022-12-12 05:20:23'),
(356, 12, 17, 'MimeType', 'image/jpeg', '2022-12-12 05:20:23'),
(357, 12, 17, 'SectionsFound', '', '2022-12-12 05:20:23'),
(358, 12, 17, 'COMPUTED', '{\"html\":\"width=\\\"680\\\" height=\\\"680\\\"\",\"Height\":680,\"Width\":680,\"IsColor\":1}', '2022-12-12 05:20:23'),
(359, 12, 17, 'date:create', '2022-12-12T05:20:23+00:00', '2022-12-12 05:20:23'),
(360, 12, 17, 'date:modify', '2022-12-12T05:20:23+00:00', '2022-12-12 05:20:23'),
(361, 12, 17, 'icc:copyright', 'Copyright (c) 1998 Hewlett-Packard Company', '2022-12-12 05:20:23'),
(362, 12, 17, 'icc:description', 'sRGB IEC61966-2.1', '2022-12-12 05:20:23'),
(363, 12, 17, 'icc:manufacturer', 'IEC http://www.iec.ch', '2022-12-12 05:20:23'),
(364, 12, 17, 'icc:model', 'IEC 61966-2.1 Default RGB colour space - sRGB', '2022-12-12 05:20:23'),
(365, 12, 17, 'jpeg:colorspace', '2', '2022-12-12 05:20:23'),
(366, 12, 17, 'jpeg:sampling-factor', '2x2,1x1,1x1', '2022-12-12 05:20:23'),
(367, 12, 18, '3', 'width=\"915\" height=\"1036\"', '2022-12-12 05:20:23'),
(368, 12, 18, 'mime', 'image/jpeg', '2022-12-12 05:20:23'),
(369, 12, 18, 'FileName', '21-christmas-lights-fantasy-decoration-homebnc_6396ba172aa17.jpg', '2022-12-12 05:20:23'),
(370, 12, 18, 'MimeType', 'image/jpeg', '2022-12-12 05:20:23'),
(371, 12, 18, 'SectionsFound', '', '2022-12-12 05:20:23'),
(372, 12, 18, 'COMPUTED', '{\"html\":\"width=\\\"915\\\" height=\\\"1036\\\"\",\"Height\":1036,\"Width\":915,\"IsColor\":1}', '2022-12-12 05:20:23'),
(373, 12, 18, 'date:create', '2022-12-12T05:20:23+00:00', '2022-12-12 05:20:23'),
(374, 12, 18, 'date:modify', '2022-12-12T05:20:23+00:00', '2022-12-12 05:20:23'),
(375, 12, 18, 'jpeg:colorspace', '2', '2022-12-12 05:20:23'),
(376, 12, 18, 'jpeg:sampling-factor', '2x2,1x1,1x1', '2022-12-12 05:20:23'),
(377, 12, 19, '3', 'width=\"1200\" height=\"1200\"', '2022-12-12 05:20:23'),
(378, 12, 19, 'mime', 'image/jpeg', '2022-12-12 05:20:23'),
(379, 12, 19, 'FileName', '69506-C0a_fYRUAAAmK9__6396ba1752050.jpg', '2022-12-12 05:20:23'),
(380, 12, 19, 'MimeType', 'image/jpeg', '2022-12-12 05:20:23'),
(381, 12, 19, 'SectionsFound', '', '2022-12-12 05:20:23'),
(382, 12, 19, 'COMPUTED', '{\"html\":\"width=\\\"1200\\\" height=\\\"1200\\\"\",\"Height\":1200,\"Width\":1200,\"IsColor\":1}', '2022-12-12 05:20:23'),
(383, 12, 19, 'date:create', '2022-12-12T05:20:23+00:00', '2022-12-12 05:20:23'),
(384, 12, 19, 'date:modify', '2022-12-12T05:20:23+00:00', '2022-12-12 05:20:23'),
(385, 12, 19, 'jpeg:colorspace', '2', '2022-12-12 05:20:23'),
(386, 12, 19, 'jpeg:sampling-factor', '2x2,1x1,1x1', '2022-12-12 05:20:23'),
(387, 12, 20, '3', 'width=\"600\" height=\"600\"', '2022-12-12 17:33:27'),
(388, 12, 20, 'mime', 'image/jpeg', '2022-12-12 17:33:27'),
(389, 12, 20, 'FileName', 'egg-face-art-16_639765e6e1f21.jpg', '2022-12-12 17:33:27'),
(390, 12, 20, 'MimeType', 'image/jpeg', '2022-12-12 17:33:27'),
(391, 12, 20, 'SectionsFound', 'ANY_TAG, IFD0, EXIF', '2022-12-12 17:33:27'),
(392, 12, 20, 'COMPUTED', '{\"html\":\"width=\\\"600\\\" height=\\\"600\\\"\",\"Height\":600,\"Width\":600,\"IsColor\":1,\"ByteOrderMotorola\":1}', '2022-12-12 17:33:27'),
(393, 12, 20, 'XResolution', '254/1', '2022-12-12 17:33:27'),
(394, 12, 20, 'YResolution', '254/1', '2022-12-12 17:33:27'),
(395, 12, 20, 'date:create', '2022-12-12T17:33:26+00:00', '2022-12-12 17:33:27'),
(396, 12, 20, 'date:modify', '2022-12-12T17:33:26+00:00', '2022-12-12 17:33:27'),
(397, 12, 20, 'exif:ExifOffset', '78', '2022-12-12 17:33:27'),
(398, 12, 20, 'exif:PixelXDimension', '600', '2022-12-12 17:33:27'),
(399, 12, 20, 'exif:PixelYDimension', '600', '2022-12-12 17:33:27'),
(400, 12, 20, 'exif:ResolutionUnit', '2', '2022-12-12 17:33:27'),
(401, 12, 20, 'exif:XResolution', '254/1', '2022-12-12 17:33:27'),
(402, 12, 20, 'exif:YResolution', '254/1', '2022-12-12 17:33:27'),
(403, 12, 20, 'jpeg:colorspace', '2', '2022-12-12 17:33:27'),
(404, 12, 20, 'jpeg:sampling-factor', '2x2,1x1,1x1', '2022-12-12 17:33:27'),
(405, 12, 21, '3', 'width=\"550\" height=\"428\"', '2022-12-12 17:33:27'),
(406, 12, 21, 'mime', 'image/jpeg', '2022-12-12 17:33:27'),
(407, 12, 21, 'FileName', 'Egg Humor funny picture (62)_639765e71c183.jpg', '2022-12-12 17:33:27'),
(408, 12, 21, 'MimeType', 'image/jpeg', '2022-12-12 17:33:27'),
(409, 12, 21, 'SectionsFound', 'ANY_TAG, IFD0, EXIF', '2022-12-12 17:33:27'),
(410, 12, 21, 'COMPUTED', '{\"html\":\"width=\\\"550\\\" height=\\\"428\\\"\",\"Height\":428,\"Width\":550,\"IsColor\":1,\"ByteOrderMotorola\":0}', '2022-12-12 17:33:27'),
(411, 12, 21, 'Software', 'Google', '2022-12-12 17:33:27'),
(412, 12, 21, 'ExifVersion', '0220', '2022-12-12 17:33:27'),
(413, 12, 21, 'date:create', '2022-12-12T17:33:27+00:00', '2022-12-12 17:33:27'),
(414, 12, 21, 'date:modify', '2022-12-12T17:33:27+00:00', '2022-12-12 17:33:27'),
(415, 12, 21, 'exif:ExifOffset', '46', '2022-12-12 17:33:27'),
(416, 12, 21, 'exif:ExifVersion', '48, 50, 50, 48', '2022-12-12 17:33:27'),
(417, 12, 21, 'exif:PixelXDimension', '550', '2022-12-12 17:33:27'),
(418, 12, 21, 'exif:PixelYDimension', '428', '2022-12-12 17:33:27'),
(419, 12, 21, 'exif:Software', 'Google', '2022-12-12 17:33:27'),
(420, 12, 21, 'jpeg:colorspace', '2', '2022-12-12 17:33:27'),
(421, 12, 21, 'jpeg:sampling-factor', '2x2,1x1,1x1', '2022-12-12 17:33:27'),
(422, 12, 22, '3', 'width=\"960\" height=\"854\"', '2022-12-12 17:33:27'),
(423, 12, 22, 'mime', 'image/jpeg', '2022-12-12 17:33:27'),
(424, 12, 22, 'FileName', 'egg-face-art-14_639765e726feb.jpg', '2022-12-12 17:33:27'),
(425, 12, 22, 'MimeType', 'image/jpeg', '2022-12-12 17:33:27'),
(426, 12, 22, 'SectionsFound', 'ANY_TAG, IFD0, EXIF', '2022-12-12 17:33:27'),
(427, 12, 22, 'COMPUTED', '{\"html\":\"width=\\\"960\\\" height=\\\"854\\\"\",\"Height\":854,\"Width\":960,\"IsColor\":1,\"ByteOrderMotorola\":1,\"Copyright\":\"Copyright:www.quanjing.co\"}', '2022-12-12 17:33:27'),
(428, 12, 22, 'Software', 'Adobe Photoshop CS5 Windows', '2022-12-12 17:33:27'),
(429, 12, 22, 'Artist', 'QuanJing', '2022-12-12 17:33:27'),
(430, 12, 22, 'Copyright', 'Copyright:www.quanjing.co', '2022-12-12 17:33:27'),
(431, 12, 22, 'date:create', '2022-12-12T17:33:27+00:00', '2022-12-12 17:33:27'),
(432, 12, 22, 'date:modify', '2022-12-12T17:33:27+00:00', '2022-12-12 17:33:27'),
(433, 12, 22, 'exif:Artist', 'QuanJing', '2022-12-12 17:33:27'),
(434, 12, 22, 'exif:Copyright', 'Copyright:www.quanjing.co', '2022-12-12 17:33:27'),
(435, 12, 22, 'exif:ExifOffset', '126', '2022-12-12 17:33:27'),
(436, 12, 22, 'exif:PixelXDimension', '960', '2022-12-12 17:33:27'),
(437, 12, 22, 'exif:PixelYDimension', '854', '2022-12-12 17:33:27'),
(438, 12, 22, 'exif:Software', 'Adobe Photoshop CS5 Windows', '2022-12-12 17:33:27'),
(439, 12, 22, 'jpeg:colorspace', '2', '2022-12-12 17:33:27'),
(440, 12, 22, 'jpeg:sampling-factor', '2x2,1x1,1x1', '2022-12-12 17:33:27'),
(441, 12, 23, '3', 'width=\"318\" height=\"159\"', '2022-12-22 05:50:37'),
(442, 12, 23, 'mime', 'image/jpeg', '2022-12-22 05:50:37'),
(443, 12, 23, 'FileName', 'download_63a3f02c689c6.jpeg', '2022-12-22 05:50:37'),
(444, 12, 23, 'MimeType', 'image/jpeg', '2022-12-22 05:50:37'),
(445, 12, 23, 'SectionsFound', '', '2022-12-22 05:50:37'),
(446, 12, 23, 'COMPUTED', '{\"html\":\"width=\\\"318\\\" height=\\\"159\\\"\",\"Height\":159,\"Width\":318,\"IsColor\":1}', '2022-12-22 05:50:37'),
(447, 12, 23, 'date:create', '2022-12-22T05:50:36+00:00', '2022-12-22 05:50:37'),
(448, 12, 23, 'date:modify', '2022-12-22T05:50:36+00:00', '2022-12-22 05:50:37'),
(449, 12, 23, 'jpeg:colorspace', '2', '2022-12-22 05:50:37'),
(450, 12, 23, 'jpeg:sampling-factor', '2x2,1x1,1x1', '2022-12-22 05:50:37');

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

--
-- Dumping data for table `account_user_brand`
--

INSERT INTO `account_user_brand` (`uid`, `uid_user`, `uuid`, `name`, `logo`, `website`, `is_active`, `colour_default_1`, `colour_default_2`, `colour_default_3`, `description`, `dts_created`, `dts_updated`, `dts_deleted`) VALUES
(1, 12, '45710223-81c7-11ed-85c1-ecebb85dcde8', 'Acruna', '', '', 1, '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 12, '5a4a5388-81c7-11ed-85c1-ecebb85dcde8', 'CapCore', '', '', 1, '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 12, 'da2f8bdc-846d-11ed-85c1-ecebb85dcde8', 'test', '', '', 0, '', '', '', '', '2022-12-25 16:04:46', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 12, '7e5298f2-d862-11ed-9a67-ecebb85dcde8', 'testing', '', '', 0, '', '', '', '', '2023-04-11 12:15:05', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

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

--
-- Dumping data for table `account_user_project`
--

INSERT INTO `account_user_project` (`uid`, `uuid`, `name`, `description`, `hex_1`, `hex_2`, `hex_3`, `uid_user`, `uid_group`, `uid_brand`, `connect_fb`, `connect_ga`, `dts_created`, `dts_updated`, `dts_deleted`, `layer_json`) VALUES
(3, '80f960e1-8294-11ed-85c1-ecebb85dcde8', '1', '', '', '', '', 12, 0, 0, 0, 0, '2022-12-23 07:36:24', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '\"{\"1691522785397\":{\"duration\":0,\"layers\":{\"1693582930069\":{\"type\":\"title\",\"zoomDirection\":\"in\",\"zoomAmount\":\"34\",\"position\":\"top-right\",\"position_control\":\"predefined\",\"text\":\"test\",\"textColor\":\"#c63939\",\"start\":\"23\",\"stop\":\"35\"},\"1693585463065\":{\"type\":\"title-background\",\"backgroundControl\":\"\",\"text\":\"test\",\"textColor\":\"#a51212\",\"start\":\"23\",\"stop\":\"45\",\"background_colors\":[\"#7339f9\",\"#14f518\"],\"background_type\":\"radial-gradient\"}}}}\"'),
(4, 'a374cfa6-8294-11ed-85c1-ecebb85dcde8', '2', '', '', '', '', 12, 0, 1, 0, 0, '2022-12-23 07:37:22', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(5, 'b7cb4a31-8294-11ed-85c1-ecebb85dcde8', '3', '', '', '', '', 12, 0, 1, 0, 0, '2022-12-23 07:37:56', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(6, 'ca894ea4-8294-11ed-85c1-ecebb85dcde8', '4', '', '', '', '', 12, 0, 1, 0, 0, '2022-12-23 07:38:28', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(7, 'edd8383f-84f3-11ed-85c1-ecebb85dcde8', 'test', '', '', '', '', 12, 0, 1, 1, 1, '2022-12-26 08:04:32', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(8, 'a8f2ceef-84f5-11ed-85c1-ecebb85dcde8', 'test3', '', '', '', '', 12, 0, 2, 1, 1, '2022-12-26 08:16:55', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(9, '0c2a50cd-a952-11ed-b63b-ecebb85dcde8', 'TestProject-R', '', '', '', '', 12, 0, 3, 1, 1, '2023-02-10 14:48:57', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(10, '1223189d-a952-11ed-b63b-ecebb85dcde8', 'bobs', '', '', '', '', 12, 0, 3, 1, 1, '2023-02-10 14:49:07', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(11, '8291f147-d376-11ed-9a67-ecebb85dcde8', 'New Project Rupesh', '', '', '', '', 12, 0, 3, 1, 1, '2023-04-05 05:55:46', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(12, '54cbd717-d862-11ed-9a67-ecebb85dcde8', 'heet', '', '', '', '', 12, 0, 3, 1, 1, '2023-04-11 12:13:55', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(13, 'b6380c89-fe0c-11ed-9817-ecebb85dcde8', 'tom test', '', '', '', '', 12, 0, 3, 1, 1, '2023-05-29 10:36:46', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(14, 'eb8ef316-fe3d-11ed-9817-ecebb85dcde8', 'tom test 2', '', '', '', '', 12, 0, 1, 1, 1, '2023-05-29 16:29:01', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(15, '60412c95-306b-11ee-8a14-ecebb85dcde8', 'Test project', '', '', '', '', 12, 0, 1, 1, 1, '2023-08-01 13:00:22', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL);

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

--
-- Dumping data for table `account_user_project_group`
--

INSERT INTO `account_user_project_group` (`uid`, `uuid`, `name`, `uid_user`, `dts_created`, `dts_updated`, `dts_deleted`) VALUES
(1, 'f998233f-8361-11ed-85c1-ecebb85dcde8', 'test', 12, '2022-12-24 08:07:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, '7e7bb4f8-8364-11ed-85c1-ecebb85dcde8', 'test2', 12, '2022-12-24 08:25:16', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, '8c7fb6dc-8364-11ed-85c1-ecebb85dcde8', 'test3', 12, '2022-12-24 08:25:39', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'a6d38c64-8364-11ed-85c1-ecebb85dcde8', 'test4', 12, '2022-12-24 08:26:23', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'b37bc7df-8365-11ed-85c1-ecebb85dcde8', 'test5', 12, '2022-12-24 08:33:54', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, '26551cd3-8366-11ed-85c1-ecebb85dcde8', 'test6', 12, '2022-12-24 08:37:07', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, '7b5ae58b-8366-11ed-85c1-ecebb85dcde8', 'test7', 12, '2022-12-24 08:39:29', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

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

--
-- Dumping data for table `ad_format`
--

INSERT INTO `ad_format` (`id`, `uuid`, `name`, `slug`, `height`, `width`) VALUES
(1, '096607cd-fe35-11ed-9817-ecebb85dcde8', 'Medium Rectangle 40%', '', 250, 300),
(2, '9906d062-fe34-11ed-9817-ecebb85dcde8', 'Leaderboard 25%', '', 90, 728),
(3, 'c3d423ca-fe34-11ed-9817-ecebb85dcde8', 'Wide Skyscraper 25%', NULL, 600, 160),
(4, 'dc6d2e1b-fe34-11ed-9817-ecebb85dcde8', 'Halfpage 5%', NULL, 600, 300),
(5, 'dc7e243b-fe34-11ed-9817-ecebb85dcde8', 'Large Leaderboard 5%', NULL, 90, 970),
(6, 'dc8f0914-fe34-11ed-9817-ecebb85dcde8', 'Billboard 1%', NULL, 250, 970),
(7, 'dcb2aa8d-fe34-11ed-9817-ecebb85dcde8', 'Large Rectangle &lt; 1%', NULL, 280, 336),
(8, 'dcbcf09f-fe34-11ed-9817-ecebb85dcde8', 'Skyscraper &lt; 1%', NULL, 600, 120),
(9, 'dcc7162a-fe34-11ed-9817-ecebb85dcde8', 'Small Square &lt; 1%', NULL, 200, 200),
(10, 'dcd1f9c2-fe34-11ed-9817-ecebb85dcde8', 'Square &lt; 1%', NULL, 250, 250),
(11, 'dcdc4412-fe34-11ed-9817-ecebb85dcde8', 'Vertical Banner &lt; 1%', NULL, 240, 120),
(12, 'dcec631e-fe34-11ed-9817-ecebb85dcde8', 'Full Banner &lt; 1%', NULL, 60, 468),
(13, 'dcf6ae7d-fe34-11ed-9817-ecebb85dcde8', 'Half Banner &lt; 1%', NULL, 60, 234),
(14, 'dd00c738-fe34-11ed-9817-ecebb85dcde8', 'Mobile Leaderboard 12%', NULL, 50, 320),
(15, 'dd13a4c6-fe34-11ed-9817-ecebb85dcde8', 'Mobile Full Page Flex &lt; 1%', NULL, 320, 320),
(16, 'dd2141b6-fe34-11ed-9817-ecebb85dcde8', 'Large Mobile Banner &lt; 1%', NULL, 100, 320),
(17, 'dd2c0122-fe34-11ed-9817-ecebb85dcde8', 'Square &lt; 1%', NULL, 250, 250),
(18, 'dd35c233-fe34-11ed-9817-ecebb85dcde8', 'Small Square &lt; 1%', NULL, 200, 200);

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

--
-- Dumping data for table `components`
--

INSERT INTO `components` (`id`, `uuid`, `name`, `description`, `created_at`) VALUES
(1, '1075c59e-91c0-9b11-393b-89fe3c3f14c2', 'Header Component', 'This is Header Component.', '2023-12-15 12:03:11'),
(2, '9beb99db-a860-3a4e-0eec-b595b2947c4b', 'Container Component', 'This is Container Component.', '2023-12-15 12:03:22'),
(3, '664163a9-f57e-aa34-5a50-29bc11569360', 'Footer Component', 'This is Footer Component.', '2023-12-15 12:03:29');

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

--
-- Dumping data for table `log_account_login_attempt`
--

INSERT INTO `log_account_login_attempt` (`uid`, `account_uid`, `ip`, `when`, `successful`) VALUES
(1, 2, '62.30.55.205', '2022-10-09 11:11:09', 0),
(2, 2, '62.30.55.205', '2022-10-09 11:11:27', 1),
(3, 2, '62.30.55.205', '2022-10-09 14:44:57', 1),
(4, 2, '62.30.55.205', '2022-10-09 15:39:31', 1),
(5, 2, '62.30.55.205', '2022-10-10 18:28:44', 1),
(6, 2, '62.30.55.205', '2022-10-11 14:52:59', 1),
(7, 2, '62.30.55.205', '2022-10-22 05:03:43', 1),
(8, 2, '62.30.55.205', '2022-11-21 15:24:17', 1),
(9, 1, '62.30.55.205', '2022-12-03 09:58:59', 1),
(10, 12, '62.30.55.205', '2022-12-07 07:15:34', 1),
(11, 12, '62.30.55.205', '2022-12-07 07:23:41', 0),
(12, 12, '62.30.55.205', '2022-12-07 07:23:48', 1),
(13, 12, '62.30.55.205', '2022-12-07 08:12:18', 1),
(14, 12, '124.123.123.190', '2022-12-07 08:20:20', 1),
(15, 12, '62.30.55.205', '2022-12-07 20:29:50', 1),
(16, 12, '62.30.55.205', '2022-12-08 06:23:46', 1),
(17, 12, '62.30.55.205', '2022-12-08 07:58:47', 1),
(18, 12, '124.123.123.190', '2022-12-08 09:05:27', 1),
(19, 12, '124.123.123.190', '2022-12-08 09:05:52', 1),
(20, 12, '124.123.123.190', '2022-12-08 09:11:13', 1),
(21, 12, '110.224.128.127', '2022-12-08 09:36:00', 1),
(22, 12, '124.123.123.190', '2022-12-08 10:43:27', 1),
(23, 12, '124.123.123.190', '2022-12-08 12:05:42', 1),
(24, 12, '124.123.123.190', '2022-12-08 12:45:58', 1),
(25, 12, '124.123.123.190', '2022-12-08 13:07:44', 1),
(26, 12, '62.30.55.205', '2022-12-08 13:09:05', 1),
(27, 12, '62.30.55.205', '2022-12-09 05:55:29', 1),
(28, 12, '62.30.55.205', '2022-12-10 15:57:52', 1),
(29, 12, '62.30.55.205', '2022-12-10 17:49:28', 1),
(30, 12, '62.30.55.205', '2022-12-11 07:54:38', 1),
(31, 12, '62.30.55.205', '2022-12-12 04:48:56', 1),
(32, 12, '62.30.55.205', '2022-12-12 17:28:55', 1),
(33, 12, '90.215.214.89', '2022-12-12 18:34:03', 1),
(34, 12, '62.30.55.205', '2022-12-14 03:02:48', 1),
(35, 12, '90.215.214.89', '2022-12-16 17:12:57', 1),
(36, 12, '124.123.123.190', '2022-12-21 10:14:57', 1),
(37, 12, '124.123.123.190', '2022-12-21 10:17:06', 1),
(38, 12, '62.30.55.205', '2022-12-21 20:01:22', 1),
(39, 12, '124.123.123.190', '2022-12-22 05:49:52', 1),
(40, 3, '62.30.55.205', '2022-12-22 06:21:08', 0),
(41, 12, '62.30.55.205', '2022-12-22 06:21:16', 1),
(42, 12, '62.30.55.205', '2022-12-23 06:20:39', 1),
(43, 12, '62.30.55.205', '2022-12-24 06:54:38', 1),
(44, 12, '62.30.55.205', '2022-12-25 15:39:25', 1),
(45, 12, '62.30.55.205', '2022-12-26 07:22:21', 1),
(46, 12, '62.30.55.205', '2022-12-27 07:03:22', 1),
(47, 12, '62.30.55.205', '2022-12-27 08:55:36', 1),
(48, 12, '115.124.115.69', '2022-12-27 12:18:05', 1),
(49, 12, '124.123.123.190', '2022-12-28 06:32:38', 1),
(50, 12, '124.123.123.190', '2022-12-28 06:34:56', 1),
(51, 12, '124.123.123.190', '2022-12-28 06:35:19', 1),
(52, 12, '124.123.123.190', '2022-12-28 06:43:16', 1),
(53, 12, '62.30.55.205', '2023-01-20 07:50:13', 0),
(54, 12, '62.30.55.205', '2023-01-20 07:51:13', 1),
(55, 12, '103.238.106.122', '2023-01-20 08:55:15', 1),
(56, 12, '49.36.24.117', '2023-01-20 10:10:03', 1),
(57, 12, '103.161.98.105', '2023-01-20 17:04:14', 1),
(58, 12, '49.36.24.117', '2023-01-23 13:24:13', 1),
(59, 12, '49.36.24.117', '2023-01-23 13:24:47', 1),
(60, 12, '49.36.24.117', '2023-01-23 14:00:37', 1),
(61, 12, '49.36.24.117', '2023-01-23 15:13:09', 1),
(62, 12, '103.238.106.92', '2023-01-24 19:13:48', 1),
(63, 12, '92.238.236.68', '2023-02-10 14:47:39', 1),
(64, 12, '62.30.55.205', '2023-02-10 14:47:54', 1),
(65, 12, '92.238.236.68', '2023-02-12 16:10:48', 1),
(66, 12, '82.132.186.37', '2023-02-12 18:45:11', 1),
(67, 12, '92.238.236.68', '2023-02-17 13:21:26', 1),
(68, 12, '62.30.55.205', '2023-02-17 13:30:28', 1),
(69, 3, '62.30.55.205', '2023-04-04 00:15:45', 0),
(70, 5, '62.30.55.205', '2023-04-04 00:15:56', 1),
(71, 12, '124.123.123.190', '2023-04-05 05:52:10', 1),
(72, 5, '62.30.55.205', '2023-04-05 05:52:20', 1),
(73, 12, '124.123.123.190', '2023-04-05 05:52:23', 1),
(74, 12, '124.123.123.190', '2023-04-05 06:14:44', 1),
(75, 12, '124.123.123.190', '2023-04-11 06:39:36', 1),
(76, 12, '124.123.123.190', '2023-04-11 12:09:38', 1),
(77, 12, '124.123.123.190', '2023-04-11 12:13:23', 1),
(78, 12, '124.123.123.190', '2023-04-11 12:42:59', 1),
(79, 12, '124.123.123.190', '2023-04-11 12:43:22', 1),
(80, 12, '45.55.133.218', '2023-04-12 05:32:13', 1),
(81, 12, '124.123.123.190', '2023-04-12 05:33:35', 1),
(82, 12, '62.30.55.205', '2023-05-27 07:03:02', 1),
(83, 12, '109.157.53.138', '2023-05-27 09:07:12', 1),
(84, 12, '109.157.53.138', '2023-05-29 09:26:05', 1),
(85, 12, '62.30.55.205', '2023-05-29 16:18:09', 1),
(86, 12, '188.241.156.108', '2023-06-03 15:28:14', 1),
(87, 12, '62.30.55.205', '2023-06-03 16:40:25', 1),
(88, 12, '185.169.235.205', '2023-06-06 18:16:46', 1),
(89, 12, '109.157.53.138', '2023-06-10 09:42:10', 1),
(90, 3, '62.30.55.205', '2023-06-17 09:11:15', 0),
(91, 12, '62.30.55.205', '2023-06-17 09:11:23', 1),
(92, 12, '103.81.93.254', '2023-06-17 09:14:27', 1),
(93, 12, '103.81.93.254', '2023-06-17 09:20:22', 1),
(94, 12, '62.30.55.203', '2023-06-23 16:10:52', 1),
(95, 12, '103.85.11.18', '2023-06-23 19:10:08', 1),
(96, 12, '103.85.11.18', '2023-06-23 19:13:51', 1),
(97, 12, '103.85.11.18', '2023-06-23 19:16:10', 1),
(98, 12, '103.85.11.18', '2023-06-23 19:21:42', 1),
(99, 12, '62.30.55.205', '2023-06-23 19:23:48', 1),
(100, 12, '103.85.11.18', '2023-06-24 06:43:42', 1),
(101, 12, '103.85.11.18', '2023-06-27 16:19:48', 1),
(102, 12, '62.30.55.205', '2023-07-03 07:06:24', 1),
(103, 12, '150.129.206.191', '2023-07-04 17:19:02', 1),
(104, 12, '103.81.94.212', '2023-07-05 08:11:43', 1),
(105, 12, '103.81.94.212', '2023-07-05 12:07:44', 1),
(106, 12, '150.129.206.191', '2023-07-05 19:28:11', 1),
(107, 12, '103.81.92.93', '2023-07-07 17:27:05', 1),
(108, 12, '103.81.92.93', '2023-07-08 07:31:26', 1),
(109, 12, '62.30.55.205', '2023-07-09 22:07:27', 1),
(110, 12, '103.81.92.93', '2023-07-10 04:13:33', 1),
(111, 12, '103.81.92.93', '2023-07-10 17:36:13', 1),
(112, 12, '103.85.10.134', '2023-07-13 05:52:23', 1),
(113, 12, '62.30.55.205', '2023-07-17 04:56:46', 1),
(114, 12, '103.85.10.240', '2023-07-25 18:17:59', 1),
(115, 12, '103.85.10.240', '2023-07-25 18:18:43', 1),
(116, 12, '103.85.10.240', '2023-07-25 18:18:48', 1),
(117, 12, '103.161.98.91', '2023-08-01 12:42:09', 1),
(118, 12, '103.161.99.53', '2023-08-02 06:16:52', 1),
(119, 12, '103.81.93.140', '2023-08-08 09:11:41', 1),
(120, 12, '103.81.93.140', '2023-08-08 09:25:46', 1),
(121, 12, '117.99.105.190', '2023-08-08 09:50:29', 1),
(122, 12, '103.85.10.148', '2023-08-08 17:39:08', 1),
(123, 12, '62.30.55.204', '2023-08-16 18:41:52', 1),
(124, 12, '103.81.93.225', '2023-08-31 15:35:38', 1),
(125, 12, '103.81.93.225', '2023-08-31 16:24:26', 1),
(126, 12, '103.81.93.225', '2023-09-01 15:20:59', 1),
(127, 12, '103.81.93.225', '2023-09-01 15:36:53', 1),
(128, 12, '62.30.55.205', '2023-09-03 07:23:04', 1),
(129, 12, '62.30.55.205', '2023-09-03 15:41:19', 1),
(130, 12, '62.30.55.205', '2023-09-03 16:14:03', 1),
(131, 12, '62.30.55.205', '2023-09-03 18:04:17', 1),
(132, 12, '62.30.55.205', '2023-09-04 05:44:15', 1),
(133, 12, '62.30.55.205', '2023-09-04 06:09:41', 1);

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

--
-- Dumping data for table `openai_prompt`
--

INSERT INTO `openai_prompt` (`id`, `key`, `purpose`, `template`, `is_deleted`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'sitemap.create', 'Sitemap setup', 'Respond as though you are an expert in SEO and website conversion. \r\nUse the following JSON template as the response format to return to me:\r\n{\"closest_sector\":\"\",\"pages\":[{\"url\":\"\",\"title\":\"\",\"description\":\"\"}]}\r\nSuggest {{page_count}} unique pages with \"url\" and page \"title\" combinations, parsed into the \"url\" and \"title\" values in the JSON template provided, to build a website described by the client as, \"{{site_description}}\", where each page, url and title should be recommended based on your best seo and website conversion knowledge. For each suggestion, update the JSON \"description\" with a description of what the client should consider writing on the page. {{sectors}} Remember, return only the JSON as a code block. Do not return any other content in your response.', 0, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'page.components', 'Page Components', 'Respond as though you are an expert in SEO and website conversion. \r\nUse the following JSON template as the response format to return to me:\r\n{\"url\":\"\",\"headline\":\"\",\"sub_headline\":\"\",\"paragraph\":\"\",\"list\":\"\",\"cta\":\"\",\"image\":\"\"}\r\nSuggest a headline, sub headline, paragraph text and a list of key features or key benefits for each page listed below and return the values in an array, using the url from the json below for each page as the url key in the JSON response. Recommend text content appropriate to each section in each page identified in the JSON below. Remember, return only the JSON as a code block. Do not return any other content in your response.\r\nPage JSON to parse:\r\n{{ json }}', 0, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

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

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `parent_page_id`, `uuid`, `name`, `slug`, `site_id`, `created_at`, `updated_at`) VALUES
(1, NULL, '87281edb-3aaf-5887-36b2-00d794acb865', 'Home Page', 'home-page', 1, '2023-12-15 13:01:52', '2023-12-15 13:03:07'),
(2, 1, '230a9042-7faf-bd46-ca86-8d60934df734', 'About Us', 'about-us', 1, '2023-12-15 13:02:11', NULL),
(3, 2, '5aa93fda-235e-b273-3575-578514154060', 'Our Team', 'our-team', 1, '2023-12-15 13:02:34', NULL),
(4, 1, '4aa4b152-49a6-b5c3-1802-9ab7ceb7f076', 'Cart', 'cart', 1, '2023-12-15 13:02:49', NULL);

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

--
-- Dumping data for table `page_components`
--

INSERT INTO `page_components` (`id`, `page_id`, `component_id`, `sequence_number`, `created_at`, `updated_at`) VALUES
(3, 1, 3, 2, '2023-12-15 13:05:21', '2023-12-15 13:06:06');

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

--
-- Dumping data for table `sector`
--

INSERT INTO `sector` (`id`, `uuid`, `title`, `description`) VALUES
(1, 'e3a20e25-9993-11ee-91cb-ecebb85dcde8', 'Ecommerce', ''),
(2, 'f10183a0-9993-11ee-91cb-ecebb85dcde8', 'Finance', ''),
(3, 'f82690c4-9993-11ee-91cb-ecebb85dcde8', 'Blogs', ''),
(4, '0297fae7-9994-11ee-91cb-ecebb85dcde8', 'News', ''),
(5, '0b8773b4-9994-11ee-91cb-ecebb85dcde8', 'Social Media', ''),
(6, '13123d77-9994-11ee-91cb-ecebb85dcde8', 'Health and Fitness', ''),
(7, '1cd15fcb-9994-11ee-91cb-ecebb85dcde8', 'Travel and Tourism', ''),
(8, '243eb530-9994-11ee-91cb-ecebb85dcde8', 'Real Estate', ''),
(9, '2afd01f5-9994-11ee-91cb-ecebb85dcde8', 'Education', ''),
(10, '31a8f252-9994-11ee-91cb-ecebb85dcde8', 'Technology', ''),
(11, '3b76fc0d-9994-11ee-91cb-ecebb85dcde8', 'Gaming', ''),
(12, '47dfb3aa-9994-11ee-91cb-ecebb85dcde8', 'Entertainment', ''),
(13, '5ce54eb3-9994-11ee-91cb-ecebb85dcde8', 'Food and Cooking', ''),
(14, '644cc038-9994-11ee-91cb-ecebb85dcde8', 'Sports', ''),
(15, '6ca678d5-9994-11ee-91cb-ecebb85dcde8', 'Job Search', ''),
(16, '741dc0bd-9994-11ee-91cb-ecebb85dcde8', 'Government', ''),
(17, '7cff4d28-9994-11ee-91cb-ecebb85dcde8', 'Nonprofit Organizations', ''),
(18, '83aee332-9994-11ee-91cb-ecebb85dcde8', 'Weather', ''),
(19, '8ddc5437-9994-11ee-91cb-ecebb85dcde8', 'Photography', ''),
(20, '958c708f-9994-11ee-91cb-ecebb85dcde8', 'Fashion', ''),
(21, '9f974f37-9994-11ee-91cb-ecebb85dcde8', 'Automotive', ''),
(22, 'a89a08e9-9994-11ee-91cb-ecebb85dcde8', 'Music', ''),
(23, 'b696d971-9994-11ee-91cb-ecebb85dcde8', 'Pets and Animals', ''),
(24, 'be0dd2a9-9994-11ee-91cb-ecebb85dcde8', 'Parenting', ''),
(25, 'c69a37ae-9994-11ee-91cb-ecebb85dcde8', 'Wedding and Events', ''),
(26, 'ce4a35da-9994-11ee-91cb-ecebb85dcde8', 'Science', ''),
(27, 'd6775ec2-9994-11ee-91cb-ecebb85dcde8', 'Home and Garden', ''),
(28, 'dfe56580-9994-11ee-91cb-ecebb85dcde8', 'Religion and Spirituality', ''),
(29, 'e811ae33-9994-11ee-91cb-ecebb85dcde8', 'DIY and Crafts', ''),
(30, 'f23a9aa5-9994-11ee-91cb-ecebb85dcde8', 'Fitness and Exercise', ''),
(31, 'f92b0f66-9994-11ee-91cb-ecebb85dcde8', 'Dating', ''),
(32, '00a1bfd7-9995-11ee-91cb-ecebb85dcde8', 'Reviews and Ratings', ''),
(33, '09145cb8-9995-11ee-91cb-ecebb85dcde8', 'Forums and Communities', ''),
(34, '10a7f961-9995-11ee-91cb-ecebb85dcde8', 'Beauty and Makeup', ''),
(35, '19696b01-9995-11ee-91cb-ecebb85dcde8', 'Hobbies and Interests', ''),
(36, '235d3dbb-9995-11ee-91cb-ecebb85dcde8', 'Literature and Writing', ''),
(37, '2b8f828d-9995-11ee-91cb-ecebb85dcde8', 'Humor', ''),
(38, '359cceb1-9995-11ee-91cb-ecebb85dcde8', 'Home Improvement', ''),
(39, '3ee82396-9995-11ee-91cb-ecebb85dcde8', 'Outdoor Activities', ''),
(40, '47a92036-9995-11ee-91cb-ecebb85dcde8', 'Virtual Reality', ''),
(41, '4f7ffcf1-9995-11ee-91cb-ecebb85dcde8', 'Astrology and Horoscopes', ''),
(42, '576c2d99-9995-11ee-91cb-ecebb85dcde8', 'Green Living', ''),
(43, '5f014e59-9995-11ee-91cb-ecebb85dcde8', 'History', ''),
(44, '67207f10-9995-11ee-91cb-ecebb85dcde8', 'Language Learning', ''),
(45, '6e80616e-9995-11ee-91cb-ecebb85dcde8', 'Senior Living', ''),
(46, '76a01090-9995-11ee-91cb-ecebb85dcde8', 'Video Production', '');

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

--
-- Dumping data for table `sites`
--

INSERT INTO `sites` (`id`, `uuid`, `user_id`, `name`, `created_at`, `updated_at`) VALUES
(1, '77b82be1-9afc-c10b-0185-58c1e8ac6ef6', 13, 'E-Commerce Website', '2023-12-15 13:01:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `system_message`
--

CREATE TABLE `system_message` (
  `uid` int UNSIGNED NOT NULL,
  `code` varchar(48) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `message` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `system_message`
--

INSERT INTO `system_message` (`uid`, `code`, `message`) VALUES
(1, 'user.session.expired', 'Session expired. Please try again.'),
(2, 'error.dismissable', 'Error'),
(3, 'user.credentials.unrecognised', 'Credentials not recognised. Please contact support for assistance.'),
(4, 'user.credentials.mismatched', 'Credentials were not recognised. Please try again.'),
(5, 'user.username.missing', 'Username was not supplied'),
(6, 'user.password.missing', 'Password was not supplied'),
(7, 'user.permission.denied', 'You do not appear to have permission to access the platform at this time. Contact us for further assistance.'),
(8, 'page.login.welcome_back', 'Welcome back! Log in to your account.'),
(9, 'page.login.label.email_address', 'Email address'),
(10, 'page.login.label.password', 'Password'),
(11, 'page.login.label.remember_me', 'Remember me'),
(12, 'page.login.sign_up', 'Not a user? Sign up'),
(13, 'page.login.login', 'Login'),
(14, 'page.login.login_with_twitter', 'Login with Twitter'),
(15, 'user.create.failed', 'Failed to create your account. Please contact support.'),
(16, 'user.credentials.conflict', 'Please use a different email address.'),
(17, 'user.not.found', 'Account could not be found'),
(18, 'user.verifify_code.missing', 'Verification code missing. Please try again.'),
(19, 'user.username.unrecognised', 'Account not recognised. Please try again'),
(20, 'user.code.mismatched', 'Verification code did not match. Please try again.'),
(21, 'user.short_code.missing_or_invalid', 'URL appears to be invalid. Please try a password reset to continue.'),
(22, 'user.short_code.missing', 'The URL appears to be invalid.'),
(23, 'user.short_code.unrecognised', 'The URL does not appear to be linked to an account. Please contact support for further assistance.'),
(24, 'user.verify_code.mismatched', 'Code supplied does not appear to be correct. Please try again.'),
(25, 'user_asset.user_uid.missing', 'User Account was not found'),
(26, 'user_asset.user_uid.invalid', 'User Account was not valid.'),
(27, 'user_asset.mime_type.missing', 'Media Mime Type not found'),
(28, 'user_asset.mime_type.unsupported', 'Media Mime Type Not Supported'),
(29, 'user_asset.ext.missing', 'Extension not found'),
(30, 'user_asset.filename.missing', 'Filename not found'),
(31, 'user_asset.filename.length_error', 'Filename blank or too long. Must be less than 256 characters long');

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

--
-- Dumping data for table `system_message_i18n`
--

INSERT INTO `system_message_i18n` (`uid`, `code`, `iso`, `message`) VALUES
(1, 'user.session.expired', 'en', 'Session expired. Please try again.'),
(2, 'error.dismissable', 'en', 'Error'),
(3, 'user.credentials.unrecognised', 'en', 'Credentials not recognised. Please contact support for assistance.'),
(4, 'user.credentials.mismatched', 'en', 'Credentials were not recognised. Please try again.'),
(5, 'user.username.missing', 'en', 'Username was not supplied'),
(6, 'user.password.missing', 'en', 'Password was not supplied'),
(7, 'user.permission.denied', 'en', 'You do not appear to have permission to access the platform at this time. Contact us for further assistance.'),
(8, 'page.login.welcome_back', 'en', 'Welcome back! Log in to your account.'),
(9, 'page.login.label.email_address', 'en', 'Email address'),
(10, 'page.login.label.password', 'en', 'Password'),
(11, 'page.login.label.remember_me', 'en', 'Remember me'),
(12, 'page.login.sign_up', 'en', 'Not a user? Sign up'),
(13, 'page.login.login', 'en', 'Login'),
(14, 'page.login.login_with_twitter', 'en', 'Login with Twitter'),
(15, 'user.create.failed', 'en', 'Failed to create your account. Please contact support.'),
(16, 'user.credentials.conflict', 'en', 'Please use a different email address.'),
(17, 'user.not.found', 'en', 'Account could not be identified'),
(18, 'user.verify_code.missing', 'en', 'Verification code missing. Please try again.'),
(19, 'user.username.unrecognised', 'en', 'Account not recognised. Please try again'),
(20, 'user.code.mismatched', 'en', 'Verification code did not match. Please try again.'),
(21, 'user.short_code.missing_or_invalid', 'en', 'URL appears to be invalid. Please try a password reset to continue.'),
(22, 'user.short_code.missing', 'en', 'The URL appears to be invalid.'),
(23, 'user.short_code.unrecognised', 'en', 'The URL does not appear to be linked to an account. Please contact support for further assistance.'),
(24, 'user.verify_code.mismatched', 'en', 'Code supplied does not appear to be correct. Please try again.'),
(25, 'user_asset.user_uid.missing', 'en', 'User Account was not found'),
(26, 'user_asset.user_uid.invalid', 'en', 'User Account was not valid'),
(27, 'user_asset.mime_type.missing', 'en', 'Media Mime Type not found'),
(28, 'user_asset.mime_type.unsupported', 'en', 'Media Mime Type Not Supported'),
(29, 'user_asset.ext.missing', 'en', 'Extension not found'),
(30, 'user_asset.filename.missing', 'en', 'Filename not found'),
(31, 'user_asset.filename.length_error', 'en', 'Filename blank or too long. Must be less than 256 characters long.');

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

--
-- Dumping data for table `user_sitemap`
--

INSERT INTO `user_sitemap` (`id`, `uuid`, `user_id`, `pages`, `name`, `purpose`, `url`, `title`, `is_deleted`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '6b5a707c-998e-11ee-91cb-ecebb85dcde8', 1, 5, NULL, 'A website about advanced web hosting and automation', '', '', 0, NULL, NULL, NULL),
(2, 'cbffa675-998e-11ee-91cb-ecebb85dcde8', 1, 5, NULL, 'A website about advanced web hosting and automation', '', '', 0, NULL, NULL, NULL),
(3, 'd3a71e0e-998f-11ee-91cb-ecebb85dcde8', 1, 5, NULL, 'A website about advanced web hosting and automation', '', '', 0, NULL, NULL, NULL),
(4, 'fa15a9b3-998f-11ee-91cb-ecebb85dcde8', 1, 5, NULL, 'A website about advanced web hosting and automation', '', '', 0, NULL, NULL, NULL),
(5, '2f301617-9990-11ee-91cb-ecebb85dcde8', 1, 5, NULL, 'A website about advanced web hosting and automation', '', '', 0, NULL, NULL, NULL),
(6, 'f3d29dc5-9990-11ee-91cb-ecebb85dcde8', 1, 5, NULL, 'A website about advanced web hosting and automation', '', '', 0, NULL, NULL, NULL),
(7, 'bee11e71-9996-11ee-91cb-ecebb85dcde8', 1, 5, NULL, 'A website about advanced web hosting and automation', '', '', 0, NULL, NULL, NULL),
(8, '6c4803f5-ecb5-1696-9d07-02f70604137e', 13, 1, 'E-Commerce Website', '', '', '', 0, '2023-12-15 11:17:01', NULL, NULL),
(9, 'e9e1f2d9-011c-0c83-a5d2-fe79c29af609', 13, 1, 'E-Commerce Website', '', '', '', 0, '2023-12-15 11:19:45', NULL, NULL),
(10, 'ff20926b-29a5-2020-81c8-7a7e3e0f6c7e', 13, 1, 'E-Commerce Website', '', '', '', 0, '2023-12-15 11:27:51', NULL, NULL);

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

--
-- Dumping data for table `user_sitemap_page`
--

INSERT INTO `user_sitemap_page` (`id`, `sitemap_id`, `parent_page_id`, `uuid`, `url`, `title`, `description`, `position`, `created_at`) VALUES
(1, 6, NULL, 'f3d2d571-9990-11ee-91cb-ecebb85dcde8', '/what-is-advanced-web-hosting', 'Understanding Advanced Web Hosting', 'This page should offer an in-depth explanation of advanced web hosting concepts, the benefits compared to basic hosting services, and scenarios where advanced hosting is essential. Highlight how advanced hosting can improve website speed, scalability, and security. Include case studies or testimonials demonstrating successful use cases.', 0, NULL),
(2, 6, NULL, 'f3d2da32-9990-11ee-91cb-ecebb85dcde8', '/automation-in-web-hosting', 'The Role of Automation in Web Hosting', 'Focus on the importance of automation in web hosting, detailing available tools and how they streamline hosting tasks such as deployment, backups, and monitoring. Discuss different automation solutions specific to web hosting environments and provide a comparison to manual management. Suggest best practices for implementing automation to enhance hosting efficiency.', 1, NULL),
(3, 6, NULL, 'f3d2dcb2-9990-11ee-91cb-ecebb85dcde8', '/cloud-hosting-solutions', 'Leveraging Cloud Hosting Solutions for Efficiency', 'This page should educate visitors about cloud hosting, its advantages over traditional hosting, and its role in facilitating advanced hosting solutions. Include information on hybrid, public, and private cloud options, and examine how businesses of various sizes can leverage these solutions. Offer insights on how cloud hosting impacts cost, performance, and scalability.', 2, NULL),
(4, 6, NULL, 'f3d2de1b-9990-11ee-91cb-ecebb85dcde8', '/managing-website-scalability', 'Managing Website Scalability with Advanced Hosting', 'Explain strategies for managing website growth through advanced web hosting services. Discuss how server resources, load balancing, and CDN services contribute to scalability. Provide actionable tips for planning for traffic spikes, such as during marketing campaigns or viral events, and demonstrate with real-life examples how advanced hosting solutions have helped manage growth.', 3, NULL),
(5, 6, NULL, 'f3d2df7c-9990-11ee-91cb-ecebb85dcde8', '/web-hosting-security-best-practices', 'Web Hosting Security Best Practices', 'Offer a comprehensive guide on security best practices in the context of advanced web hosting. Cover topics including SSL certificates, firewall configurations, malware scanning, and secure authentication protocols. Educate readers on regular security audits, the role of automated security solutions, and how to respond to security incidents. Encourage the adoption of a holistic approach to web hosting security.', 4, NULL),
(6, 10, NULL, 'f177cf01-2c52-e712-bb2e-a61bc816ec37', '/', 'Find Us At 3', NULL, 1, '2023-12-15 11:40:10'),
(7, 10, NULL, '2e574084-9ac9-8fae-ca4f-4dc30a16ce39', '', 'Find Us At 3', NULL, 1, '2023-12-15 11:40:42'),
(8, 10, NULL, '453e5266-e903-b780-abb5-1ede4fa3f1cc', '/find-us-at-3', 'Find Us At 3', NULL, 1, '2023-12-15 11:41:39'),
(9, 10, 7, '08bf20e6-732e-3cf0-17ba-d64394eebe57', '/find-us-at-3', 'Find Us At 3', NULL, 1, '2023-12-15 11:42:12');

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

--
-- Dumping data for table `user_thread`
--

INSERT INTO `user_thread` (`id`, `user_id`, `openai_thread_id`, `purpose`, `uuid`) VALUES
(1, 1, '', 'A website about advanced web hosting and automation', '68860aba-9212-11ee-91cb-ecebb85dcde8'),
(2, 1, '', 'A website about advanced web hosting and automation', '744ff3a9-9212-11ee-91cb-ecebb85dcde8'),
(3, 1, '', 'A website about advanced web hosting and automation', '9575f18d-9212-11ee-91cb-ecebb85dcde8'),
(4, 1, '', 'A website about advanced web hosting and automation', '1c580b80-9213-11ee-91cb-ecebb85dcde8'),
(5, 1, '', 'A website about advanced web hosting and automation', '3bfbca04-9215-11ee-91cb-ecebb85dcde8'),
(6, 1, 'thread_vx5Jf0U2t1COa0JlVF4gui37', 'A website about advanced web hosting and automation', '6f16797d-9215-11ee-91cb-ecebb85dcde8'),
(7, 1, '', 'A website about advanced web hosting and automation', '5c3bce01-92a9-11ee-91cb-ecebb85dcde8'),
(8, 1, '', 'A website about advanced web hosting and automation', '0fbd0665-92aa-11ee-91cb-ecebb85dcde8'),
(9, 1, '', 'A website about advanced web hosting and automation', '7c193d00-92aa-11ee-91cb-ecebb85dcde8'),
(10, 1, '', 'A website about advanced web hosting and automation', '9e606066-92aa-11ee-91cb-ecebb85dcde8'),
(11, 1, '', 'A website about advanced web hosting and automation', 'b8de5913-92aa-11ee-91cb-ecebb85dcde8'),
(12, 1, '', 'A website about advanced web hosting and automation', 'f6382a50-92aa-11ee-91cb-ecebb85dcde8'),
(13, 1, '', 'A website about advanced web hosting and automation', 'f8176ef0-92aa-11ee-91cb-ecebb85dcde8'),
(14, 1, '', 'A website about advanced web hosting and automation', '03630750-92ab-11ee-91cb-ecebb85dcde8'),
(15, 1, '', 'A website about advanced web hosting and automation', '14382ca0-92ab-11ee-91cb-ecebb85dcde8'),
(16, 1, '', 'A website about advanced web hosting and automation', '160dd172-92ab-11ee-91cb-ecebb85dcde8'),
(17, 1, '', 'A website about advanced web hosting and automation', '182c680e-92ab-11ee-91cb-ecebb85dcde8'),
(18, 1, '', 'A website about advanced web hosting and automation', '341e8b01-92ab-11ee-91cb-ecebb85dcde8'),
(19, 1, '', 'A website about advanced web hosting and automation', '369520b4-92ab-11ee-91cb-ecebb85dcde8'),
(20, 1, '', 'A website about advanced web hosting and automation', '4c4d615d-92ab-11ee-91cb-ecebb85dcde8'),
(21, 1, '', 'A website about advanced web hosting and automation', 'ca8a92cc-92ab-11ee-91cb-ecebb85dcde8'),
(22, 1, '', 'A website about advanced web hosting and automation', 'd2c5570d-92ab-11ee-91cb-ecebb85dcde8'),
(23, 1, '', 'A website about advanced web hosting and automation', 'f760ea95-92ab-11ee-91cb-ecebb85dcde8'),
(24, 1, '', 'A website about advanced web hosting and automation', '011ddcb4-92ac-11ee-91cb-ecebb85dcde8'),
(25, 1, '', 'A website about advanced web hosting and automation', '19f84079-92ac-11ee-91cb-ecebb85dcde8'),
(26, 1, '', 'A website about advanced web hosting and automation', '2ca0287f-92ac-11ee-91cb-ecebb85dcde8'),
(27, 1, '', 'A website about advanced web hosting and automation', '3af8d684-92ac-11ee-91cb-ecebb85dcde8'),
(28, 1, '', 'A website about advanced web hosting and automation', '49ef3b71-92ac-11ee-91cb-ecebb85dcde8'),
(29, 1, '', 'A website about advanced web hosting and automation', '4c085ae2-92ac-11ee-91cb-ecebb85dcde8'),
(30, 1, '', 'A website about advanced web hosting and automation', '5c6cb133-92ac-11ee-91cb-ecebb85dcde8'),
(31, 1, '', 'A website about advanced web hosting and automation', '68255269-92ac-11ee-91cb-ecebb85dcde8'),
(32, 1, '', 'A website about advanced web hosting and automation', '926e5202-92ac-11ee-91cb-ecebb85dcde8'),
(33, 1, '', 'A website about advanced web hosting and automation', '9d362d09-92ac-11ee-91cb-ecebb85dcde8'),
(34, 1, '', 'A website about advanced web hosting and automation', 'a956dbcc-92ac-11ee-91cb-ecebb85dcde8'),
(35, 1, '', 'A website about advanced web hosting and automation', '0b782469-92ad-11ee-91cb-ecebb85dcde8'),
(36, 1, '', 'A website about advanced web hosting and automation', '0e577ac1-92ad-11ee-91cb-ecebb85dcde8'),
(37, 1, '', 'A website about advanced web hosting and automation', '9717d51c-92ad-11ee-91cb-ecebb85dcde8'),
(38, 1, '', 'A website about advanced web hosting and automation', 'ad7dc064-92ad-11ee-91cb-ecebb85dcde8'),
(39, 1, '', 'A website about advanced web hosting and automation', 'cc77c573-92ad-11ee-91cb-ecebb85dcde8'),
(40, 1, '', 'A website about advanced web hosting and automation', '1381f3e4-92ae-11ee-91cb-ecebb85dcde8'),
(41, 1, '', 'A website about advanced web hosting and automation', '29d44f31-92ae-11ee-91cb-ecebb85dcde8'),
(42, 1, '', 'A website about advanced web hosting and automation', '473b0bd6-92ae-11ee-91cb-ecebb85dcde8'),
(43, 1, '', 'A website about advanced web hosting and automation', '6b3d3d1f-92ae-11ee-91cb-ecebb85dcde8'),
(44, 1, '', 'A website about advanced web hosting and automation', '7fc6c254-92ae-11ee-91cb-ecebb85dcde8'),
(45, 1, '', 'A website about advanced web hosting and automation', '91436b5a-92ae-11ee-91cb-ecebb85dcde8'),
(46, 1, '', 'A website about advanced web hosting and automation', 'a449a1e8-92ae-11ee-91cb-ecebb85dcde8'),
(47, 1, '', 'A website about advanced web hosting and automation', '61f5c206-92b0-11ee-91cb-ecebb85dcde8'),
(48, 1, '', 'A website about advanced web hosting and automation', '7ec98ddb-92b0-11ee-91cb-ecebb85dcde8'),
(49, 1, '', 'A website about advanced web hosting and automation', '93f24349-92b0-11ee-91cb-ecebb85dcde8'),
(50, 1, '', 'A website about advanced web hosting and automation', 'aa9f78a6-92b0-11ee-91cb-ecebb85dcde8'),
(51, 1, '', 'A website about advanced web hosting and automation', '047ba038-92b1-11ee-91cb-ecebb85dcde8'),
(52, 1, '', 'A website about advanced web hosting and automation', '159bea80-92b1-11ee-91cb-ecebb85dcde8'),
(53, 1, '', 'A website about advanced web hosting and automation', '32236623-92b1-11ee-91cb-ecebb85dcde8'),
(54, 1, '', 'A website about advanced web hosting and automation', '6acc3d25-92b1-11ee-91cb-ecebb85dcde8'),
(55, 1, '', 'A website about advanced web hosting and automation', 'a55caaa0-92b1-11ee-91cb-ecebb85dcde8'),
(56, 1, '', 'A website about advanced web hosting and automation', 'ad7a8d3f-92b1-11ee-91cb-ecebb85dcde8'),
(57, 1, '', 'A website about advanced web hosting and automation', 'e75399b4-92b1-11ee-91cb-ecebb85dcde8'),
(58, 1, '', 'A website about advanced web hosting and automation', 'f29cd448-92b1-11ee-91cb-ecebb85dcde8'),
(59, 1, '', 'A website about advanced web hosting and automation', '3ab146d8-92b2-11ee-91cb-ecebb85dcde8'),
(60, 1, '', 'A website about advanced web hosting and automation', '7fb313ae-92b2-11ee-91cb-ecebb85dcde8'),
(61, 1, '', 'A website about advanced web hosting and automation', 'e54f821f-92b3-11ee-91cb-ecebb85dcde8'),
(62, 1, '', 'A website about advanced web hosting and automation', 'ecab6c8a-92b3-11ee-91cb-ecebb85dcde8'),
(63, 1, '', 'A website about advanced web hosting and automation', 'f821f37c-92b3-11ee-91cb-ecebb85dcde8'),
(64, 1, '', 'A website about advanced web hosting and automation', 'fd56f2dd-92b3-11ee-91cb-ecebb85dcde8'),
(65, 1, '', 'A website about advanced web hosting and automation', 'fd8ce8dd-92b3-11ee-91cb-ecebb85dcde8'),
(66, 1, '', 'A website about advanced web hosting and automation', '53e3d7ce-92b4-11ee-91cb-ecebb85dcde8'),
(67, 1, '', 'A website about advanced web hosting and automation', '822cea78-92b4-11ee-91cb-ecebb85dcde8'),
(68, 1, '', 'A website about advanced web hosting and automation', '941d55dc-92b4-11ee-91cb-ecebb85dcde8'),
(69, 1, '', 'A website about advanced web hosting and automation', 'bb0d633c-92b4-11ee-91cb-ecebb85dcde8'),
(70, 1, '', 'A website about advanced web hosting and automation', 'bfd3be37-92b4-11ee-91cb-ecebb85dcde8'),
(71, 1, '', 'A website about advanced web hosting and automation', 'd864f84c-92b4-11ee-91cb-ecebb85dcde8'),
(72, 1, '', 'A website about advanced web hosting and automation', 'fb73a90f-92b4-11ee-91cb-ecebb85dcde8'),
(73, 1, '', 'A website about advanced web hosting and automation', '641a71d0-92dd-11ee-91cb-ecebb85dcde8'),
(74, 1, '', 'A website about advanced web hosting and automation', 'e3c96297-92dd-11ee-91cb-ecebb85dcde8'),
(75, 1, '', 'A website about advanced web hosting and automation', 'ecbafdab-92de-11ee-91cb-ecebb85dcde8'),
(76, 1, '', 'A website about advanced web hosting and automation', '9482d51e-92df-11ee-91cb-ecebb85dcde8'),
(77, 1, '', 'A website about advanced web hosting and automation', 'bcb30c17-92f5-11ee-91cb-ecebb85dcde8'),
(78, 1, '', 'A website about advanced web hosting and automation', 'd89f3703-92f5-11ee-91cb-ecebb85dcde8'),
(79, 1, '', 'A website about advanced web hosting and automation', 'c879a266-92f6-11ee-91cb-ecebb85dcde8'),
(80, 1, 'thread_kcg3XAmqrVmstjaZXVOXVu0s', 'A website about advanced web hosting and automation', '2a2426e6-92f7-11ee-91cb-ecebb85dcde8'),
(81, 1, 'thread_S7aBnH61g4mAmyd8E35yhpOh', 'A website about advanced web hosting and automation', '27be7c4b-9337-11ee-91cb-ecebb85dcde8'),
(82, 1, 'thread_Y0LgkhnWSktGd08SvQRUS4yG', 'A website about advanced web hosting and automation', '851cea02-9338-11ee-91cb-ecebb85dcde8'),
(83, 1, 'thread_m4HWAFb829VRuDeIcmC9Qg92', 'A website about advanced web hosting and automation', '4a1e647f-9339-11ee-91cb-ecebb85dcde8'),
(84, 1, 'thread_moHEnlXzC4Zmji1nIdkeCaSR', 'A website about advanced web hosting and automation', '5174a357-933a-11ee-91cb-ecebb85dcde8'),
(85, 1, 'thread_Q976UGjNneD1ZITdugFJs50F', 'A website about advanced web hosting and automation', '87f85feb-933a-11ee-91cb-ecebb85dcde8'),
(86, 1, 'thread_DjFVPESfLhFh2tFjGE6hJd2L', 'A website about advanced web hosting and automation', 'a89729dc-933b-11ee-91cb-ecebb85dcde8'),
(87, 1, 'thread_KwehoyhS8qcjq2esh0Sb48NP', 'A website about advanced web hosting and automation', 'df755b0c-933b-11ee-91cb-ecebb85dcde8'),
(88, 1, 'thread_BlTvtjdd7GP0H6xiGi4GmO9M', 'A website about advanced web hosting and automation', '9da9557f-98d0-11ee-91cb-ecebb85dcde8'),
(89, 1, 'thread_3Elu2XjIhVhNMiFRPnFPfDEU', 'A website about advanced web hosting and automation', '1e417711-98d2-11ee-91cb-ecebb85dcde8'),
(90, 1, 'thread_kz8Igg5Oh6vz1YWJE7Q1nKs6', 'A website about advanced web hosting and automation', '109b0e55-98d9-11ee-91cb-ecebb85dcde8'),
(91, 1, 'thread_pQEqhXOr78NUnsWN2Vf3uWqp', 'A website about advanced web hosting and automation', 'c4143bd5-98da-11ee-91cb-ecebb85dcde8'),
(92, 1, 'thread_md1bXN0EplwCYBkk0wc3dAxY', 'A website about advanced web hosting and automation', 'ebb493c5-98da-11ee-91cb-ecebb85dcde8'),
(93, 1, 'thread_O8LqyZ1IaxECdqoSqih9q95m', 'A website about advanced web hosting and automation', '14746c41-98db-11ee-91cb-ecebb85dcde8'),
(94, 1, 'thread_QB6VA53QhWkjnC8oqrMYcJD8', 'A website about advanced web hosting and automation', 'e65fb97c-98df-11ee-91cb-ecebb85dcde8'),
(95, 1, 'thread_PJNWOJci8DUzn2BKrt4RZ1Rx', 'A website about advanced web hosting and automation', '428db074-98e0-11ee-91cb-ecebb85dcde8'),
(96, 1, 'thread_bZZCKL6MwAc2lk1FjFEQAWMs', 'A website about advanced web hosting and automation', '45efcf61-98e0-11ee-91cb-ecebb85dcde8'),
(97, 1, 'thread_AmnTElzJs3F25QuHZpoIMtNN', 'A website about advanced web hosting and automation', '729a4caf-98e0-11ee-91cb-ecebb85dcde8'),
(98, 1, 'thread_25ztLUBO47x5HmV9uc4C5bJL', 'A website about advanced web hosting and automation', 'acc3c06f-98e0-11ee-91cb-ecebb85dcde8'),
(99, 1, 'thread_H8UW5bHe67HoApBxN6ZubgyA', 'A website about advanced web hosting and automation', 'e56e9bd3-98e0-11ee-91cb-ecebb85dcde8'),
(100, 1, 'thread_CsCi8alGsriPhZeR3o9nhEBy', 'A website about advanced web hosting and automation', 'e97bf6c0-98e0-11ee-91cb-ecebb85dcde8'),
(101, 1, 'thread_8G3MpsGJgVFlToof5PKAYBqN', 'A website about advanced web hosting and automation', '11dd4ca5-98e1-11ee-91cb-ecebb85dcde8'),
(102, 1, 'thread_pnFE8OCMyhxJCvCtw68S9eb9', 'A website about advanced web hosting and automation', '15b00729-98e1-11ee-91cb-ecebb85dcde8'),
(103, 1, 'thread_v2Cc5JFU2gQSnaSuztYl40xK', 'A website about advanced web hosting and automation', '525dd20d-98e1-11ee-91cb-ecebb85dcde8'),
(104, 1, 'thread_AfFfJhSI74SquOeHs9hs2Jck', 'A website about advanced web hosting and automation', '81aa46f4-98e1-11ee-91cb-ecebb85dcde8'),
(105, 1, 'thread_iwZwr8sXOyH1p65Clz5nVwyy', 'A website about advanced web hosting and automation', '5a261f81-98e2-11ee-91cb-ecebb85dcde8'),
(106, 1, 'thread_tcZukYw2X8GifTjxq13OFcPe', 'A website about advanced web hosting and automation', 'c40c14f7-98e2-11ee-91cb-ecebb85dcde8'),
(107, 1, 'thread_BUER9q4zYqj0hBPMlrehw02L', 'A website about advanced web hosting and automation', 'fc0a1fe2-98e2-11ee-91cb-ecebb85dcde8'),
(108, 1, 'thread_two1dXKuq1jiFXDn9JACm3Yk', 'A website about advanced web hosting and automation', '2b17109b-98e3-11ee-91cb-ecebb85dcde8'),
(109, 1, 'thread_xt3Kd1Vv2P8pkd00xdrz1IdZ', 'A website about advanced web hosting and automation', 'b0bc7187-98e3-11ee-91cb-ecebb85dcde8'),
(110, 1, 'thread_8qtU11x2XQMMGf1nYIz5DIUA', 'A website about advanced web hosting and automation', 'f26eab7c-98e3-11ee-91cb-ecebb85dcde8'),
(111, 1, 'thread_WvJcVELfBa1q0ycyN7t5MbfF', 'A website about advanced web hosting and automation', '79ad662d-98e4-11ee-91cb-ecebb85dcde8'),
(112, 1, 'thread_29ZlL5dx2tMBKxsWvbw7ukZw', 'A website about advanced web hosting and automation', '3ccfb0f0-98e5-11ee-91cb-ecebb85dcde8'),
(113, 1, 'thread_YLK7IuOSiWZK8BgncZsu0yQv', 'A website about advanced web hosting and automation', '7c28e3d1-98e5-11ee-91cb-ecebb85dcde8'),
(114, 1, 'thread_f2SHocxNSak3S7hhDJ5K6lv2', 'A website about advanced web hosting and automation', '872ff45e-98e7-11ee-91cb-ecebb85dcde8'),
(115, 1, 'thread_wBK6aMZWbStwbQLR0TeUFney', 'A website about advanced web hosting and automation', 'c10e6cee-98e7-11ee-91cb-ecebb85dcde8'),
(116, 1, 'thread_PRhJVlljxekH1AMSCtSpeMcG', 'A website about kitchen ware', 'f9177190-98e7-11ee-91cb-ecebb85dcde8'),
(117, 1, 'thread_4lH8nIMQzbdxumdGg7J3NYKu', 'A website about a software development service provider', '3697ff6e-98e8-11ee-91cb-ecebb85dcde8'),
(118, 1, 'thread_t0OazRv8n5EPJYbOZ6ozQehg', 'A website about a software development service provider', 'c8a6a367-98e9-11ee-91cb-ecebb85dcde8'),
(119, 1, 'thread_IFsfn3RexPSYwcksi82J4LVB', 'A website about a software development service provider', '79f86fb4-98ea-11ee-91cb-ecebb85dcde8'),
(120, 1, 'thread_DQgSdo2Pczlhd1E6sclAiw17', 'A website about a software development service provider', 'c2c04bfb-98ea-11ee-91cb-ecebb85dcde8'),
(121, 1, 'thread_kSTOUJKxJvI7BqZvjtb04DC3', 'A website about a software development service provider', '6f507714-98eb-11ee-91cb-ecebb85dcde8'),
(122, 1, 'thread_WrwbAXer6GFkz54dE8vQ4atF', 'A website about a software development service provider', 'dde3a3b3-98eb-11ee-91cb-ecebb85dcde8'),
(123, 1, 'thread_HZCmTQRia0kxR9HlS7efhQH9', 'A website about a software development service provider', '1948fc93-98ec-11ee-91cb-ecebb85dcde8'),
(124, 1, 'thread_KGdW56nEmBHiBLJJDICQ5oR2', 'A website about a software development service provider', '178c10fe-98ed-11ee-91cb-ecebb85dcde8'),
(125, 1, 'thread_EcfB6nSW9E3xlTVK260hfSej', 'A website about a software development service provider', 'c7fe388b-98ed-11ee-91cb-ecebb85dcde8'),
(126, 1, 'thread_Vbf7Sjf703rG9RW4wSZHSmFT', 'A website about a software development service provider', '1b8cc254-98ee-11ee-91cb-ecebb85dcde8'),
(127, 1, 'thread_WuczmNM2KHelYplKTYb2eFQm', 'A website about a software development service provider', 'b8befee1-98ee-11ee-91cb-ecebb85dcde8'),
(128, 1, 'thread_dMcneEvvTDRT12gxUEDkFKIi', 'A website about a software development service provider', '16cc22c4-98ef-11ee-91cb-ecebb85dcde8'),
(129, 1, 'thread_iOspwRUlNqDObEe4VfeVq0f9', 'A website about a software development service provider', '6c5a3696-98ef-11ee-91cb-ecebb85dcde8'),
(130, 1, 'thread_NyimZkQm7mrwdS2QTAE3klF9', 'A website about a software development service provider', 'c9474e31-98ef-11ee-91cb-ecebb85dcde8'),
(131, 1, 'thread_kGWDZBzbtRb8UgZYIxOyIANo', 'A website about a software development service provider', 'fa2d5281-98ef-11ee-91cb-ecebb85dcde8'),
(132, 1, 'thread_TMVBRVmWXDS6tBMB6ZsVnOl2', 'A website about a software development service provider', '5df55f7a-98f0-11ee-91cb-ecebb85dcde8'),
(133, 1, 'thread_kKeiselaT2AQ4Hdo2KFXjRNF', 'A website about a software development service provider', '996168a5-98f0-11ee-91cb-ecebb85dcde8'),
(134, 1, 'thread_hgXJDSR6AmO8j4IlD9zIKkD8', 'A website about a software development service provider', 'e11c50c8-98f0-11ee-91cb-ecebb85dcde8'),
(135, 1, 'thread_Q0o5WiapUmIoaihxxU0dzbfF', 'A website about a software development service provider', '3514a0f0-98f1-11ee-91cb-ecebb85dcde8'),
(136, 1, 'thread_dB66a1QLOjqm4SWzp3t2yFsr', 'A website about a software development service provider', '870078c5-98f1-11ee-91cb-ecebb85dcde8'),
(137, 1, 'thread_S83fQTGitJdZdLeNE5NFtNyv', 'A website about a software development service provider', 'b4316b18-98f1-11ee-91cb-ecebb85dcde8'),
(138, 1, 'thread_FzNzXPffasumg5U8KXOTpszz', 'A website about a software development service provider', '417505b0-98f2-11ee-91cb-ecebb85dcde8'),
(139, 1, 'thread_hZ3nHQxjITmhwvhB70gr1YpA', 'A website about a software development service provider', '8a78cea5-98f2-11ee-91cb-ecebb85dcde8'),
(140, 1, 'thread_SXzNHMCqc1DysknkhK2tg8oQ', 'A website about a software development service provider', 'c9b40581-98f2-11ee-91cb-ecebb85dcde8'),
(141, 1, 'thread_YPKSMwAamnnx2m3oDIWoZt5s', 'A website about a software development service provider', 'ece436da-98f2-11ee-91cb-ecebb85dcde8'),
(142, 1, 'thread_ElcKaG8slYsWByH7eGmlxhzi', 'A website about a software development service provider', '269cc230-98f3-11ee-91cb-ecebb85dcde8'),
(143, 1, 'thread_AitbL0MTZxUguITpn5aaf5ar', 'A website about a software development service provider', '49c78aee-98f3-11ee-91cb-ecebb85dcde8'),
(144, 1, 'thread_vuHiT7EH6UHZzHxRhHqFBvrp', 'A website about a software development service provider', 'edf74f75-98f3-11ee-91cb-ecebb85dcde8'),
(145, 1, 'thread_inxb0IAMNB6TyWwY2H7k4ptM', 'A website about advanced web hosting and automation', '2e57a422-9988-11ee-91cb-ecebb85dcde8'),
(146, 1, 'thread_L2HZiwdr2UScSnNHf0mn5g2F', 'A website about advanced web hosting and automation', '0186b6c3-998a-11ee-91cb-ecebb85dcde8'),
(147, 1, 'thread_g6ckTP3SMPPXIkbCI19gMcTL', 'A website about advanced web hosting and automation', '9c9673df-998b-11ee-91cb-ecebb85dcde8'),
(148, 1, 'thread_qzfTtic7LT3F9r7Quwc1YTTu', 'A website about advanced web hosting and automation', '8b513562-998c-11ee-91cb-ecebb85dcde8'),
(149, 1, 'thread_S12A0SR3ZPOHNHovIBZpvBVH', 'A website about advanced web hosting and automation', '7b4984a7-998d-11ee-91cb-ecebb85dcde8'),
(150, 1, 'thread_0SB1crHp0hmpaH82ziba1mof', 'A website about advanced web hosting and automation', '50e23b90-998e-11ee-91cb-ecebb85dcde8'),
(151, 1, 'thread_XfbGiDKVbeuw55gkFLY60EeE', 'A website about advanced web hosting and automation', 'b5a5af8d-998e-11ee-91cb-ecebb85dcde8'),
(152, 1, 'thread_LmX5nrPwv16SlYzFD7k0asej', 'A website about advanced web hosting and automation', 'b71097a1-998f-11ee-91cb-ecebb85dcde8'),
(153, 1, 'thread_oiZSmAB8Xu7y8BEo441Ll4v7', 'A website about advanced web hosting and automation', 'e0b50458-998f-11ee-91cb-ecebb85dcde8'),
(154, 1, 'thread_YGNwrox5EysyKm0ydYgFxBiT', 'A website about advanced web hosting and automation', '18c2b7d0-9990-11ee-91cb-ecebb85dcde8'),
(155, 1, 'thread_ea7vv3SKbaot7ug7sVBUGVWv', 'A website about advanced web hosting and automation', 'd436374e-9990-11ee-91cb-ecebb85dcde8'),
(156, 1, 'thread_KcZPpDXg7oG94ymPhmIIpk5i', 'A website about advanced web hosting and automation', 'a8726c8c-9996-11ee-91cb-ecebb85dcde8');

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
-- Indexes for table `components`
--
ALTER TABLE `components`
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
-- Indexes for table `openai_prompt`
--
ALTER TABLE `openai_prompt`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`) USING BTREE,
  ADD KEY `purpose` (`purpose`) USING BTREE,
  ADD KEY `key` (`key`) USING BTREE;

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
  MODIFY `uid` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `account_user_asset`
--
ALTER TABLE `account_user_asset`
  MODIFY `uid` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `account_user_asset_meta`
--
ALTER TABLE `account_user_asset_meta`
  MODIFY `uid` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=451;

--
-- AUTO_INCREMENT for table `account_user_asset_palette`
--
ALTER TABLE `account_user_asset_palette`
  MODIFY `uid` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `account_user_brand`
--
ALTER TABLE `account_user_brand`
  MODIFY `uid` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `account_user_project`
--
ALTER TABLE `account_user_project`
  MODIFY `uid` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `account_user_project_group`
--
ALTER TABLE `account_user_project_group`
  MODIFY `uid` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
  MODIFY `id` tinyint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `components`
--
ALTER TABLE `components`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `log_account_access`
--
ALTER TABLE `log_account_access`
  MODIFY `uid` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log_account_login_attempt`
--
ALTER TABLE `log_account_login_attempt`
  MODIFY `uid` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- AUTO_INCREMENT for table `openai_prompt`
--
ALTER TABLE `openai_prompt`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `page_components`
--
ALTER TABLE `page_components`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sector`
--
ALTER TABLE `sector`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `security_ip_block`
--
ALTER TABLE `security_ip_block`
  MODIFY `uid` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sites`
--
ALTER TABLE `sites`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `system_message`
--
ALTER TABLE `system_message`
  MODIFY `uid` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `system_message_i18n`
--
ALTER TABLE `system_message_i18n`
  MODIFY `uid` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `user_sitemap`
--
ALTER TABLE `user_sitemap`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user_sitemap_page`
--
ALTER TABLE `user_sitemap_page`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user_thread`
--
ALTER TABLE `user_thread`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

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
