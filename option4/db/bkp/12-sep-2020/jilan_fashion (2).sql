-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 11, 2020 at 09:36 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jilan_fashion`
--

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

CREATE TABLE `activities` (
  `activities_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `title` varchar(512) NOT NULL,
  `video_name` varchar(128) DEFAULT NULL,
  `youtube_url` varchar(256) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `activities`
--

INSERT INTO `activities` (`activities_id`, `category_id`, `title`, `video_name`, `youtube_url`, `description`, `status`, `created`, `modified`) VALUES
(4, 3, 'Exhibition', '1513940919.mp4', 'https://www.youtube.com/watch?v=oxFSpzs8lMA', NULL, 1, '2017-12-22 16:22:32', '2017-12-22 16:08:39'),
(5, 1, 'pres', NULL, 'https://www.youtube.com/watch?v=oxFSpzs8lMA', NULL, 1, '2017-12-22 16:44:51', '2017-12-22 15:44:51'),
(6, 4, 'Exihibition 2011', NULL, '', NULL, 1, '2017-12-22 17:22:00', '2017-12-22 16:26:18'),
(7, 9, 'Fashion Show 2011', '1513942020.mp4', 'https://www.youtube.com/watch?v=oxFSpzs8lMA', NULL, 1, '2017-12-22 17:27:00', '2017-12-22 16:27:00'),
(8, 18, 'Fashion Show Images', NULL, '', NULL, 1, '2020-08-22 19:01:51', '2020-09-05 04:26:23'),
(9, 19, 'Fashion show video', NULL, 'https://www.youtube.com/watch?v=YC3ZDWRF7B4', NULL, 1, '2020-08-22 19:03:04', '2020-08-22 13:03:04'),
(21, 18, 'new image', NULL, '', NULL, 1, '2020-09-05 09:44:59', '2020-09-05 04:18:23'),
(22, 19, 'Video 1', '1599279574.mp4', '', NULL, 1, '2020-09-05 09:47:49', '2020-09-05 04:20:41'),
(23, 23, 'photoshoot images', NULL, '', NULL, 1, '2020-09-05 11:39:51', '2020-09-05 05:41:19');

-- --------------------------------------------------------

--
-- Table structure for table `activities_category`
--

CREATE TABLE `activities_category` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `category_name` varchar(64) NOT NULL,
  `status` tinyint(1) DEFAULT 1,
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `activities_category`
--

INSERT INTO `activities_category` (`id`, `parent_id`, `category_name`, `status`, `created`, `modified`) VALUES
(3, 0, 'Exhibition', 1, '2017-12-21 18:27:35', '0000-00-00 00:00:00'),
(4, 3, 'Group', 1, '2017-12-21 18:27:44', '2020-08-22 12:27:29'),
(5, 3, 'Slow', 1, '2017-12-21 18:28:12', '2020-08-22 12:27:41'),
(6, 0, 'Performance', 1, '2017-12-21 18:28:30', '2017-12-21 17:29:49'),
(7, 6, 'Jilan IST Design 2010 2018', 1, '2017-12-21 18:28:45', '2020-08-22 12:44:08'),
(8, 0, 'Fashion Show', 1, '2017-12-21 18:36:09', '0000-00-00 00:00:00'),
(9, 8, 'Inifd Fashion Show 2011', 1, '2017-12-21 18:36:27', '0000-00-00 00:00:00'),
(10, 8, 'Jilan & Elisa Chatwalk 2011', 1, '2017-12-21 18:37:09', '2020-08-22 12:38:32'),
(11, 0, 'Achievements', 1, '2017-12-21 18:37:47', '0000-00-00 00:00:00'),
(12, 4, 'INIFD Exhibition 2012', 1, '2020-08-22 18:29:36', '0000-00-00 00:00:00'),
(13, 4, 'DAFA Exhibition 2012', 1, '2020-08-22 18:30:23', '0000-00-00 00:00:00'),
(14, 5, 'Jilan Designer Activities', 1, '2020-08-22 18:31:40', '0000-00-00 00:00:00'),
(15, 0, 'Fashion Photoshoot', 1, '2020-08-22 18:35:42', '0000-00-00 00:00:00'),
(16, 0, 'Fashion VideoShoot', 1, '2020-08-22 18:35:56', '0000-00-00 00:00:00'),
(17, 8, 'Jilan & Elisa Bruming', 1, '2020-08-22 18:39:01', '0000-00-00 00:00:00'),
(18, 9, 'Image', 1, '2020-08-22 18:39:36', '0000-00-00 00:00:00'),
(19, 9, 'Video', 1, '2020-08-22 18:39:43', '0000-00-00 00:00:00'),
(20, 10, 'Image', 1, '2020-08-22 18:40:18', '0000-00-00 00:00:00'),
(21, 17, 'Video', 1, '2020-08-22 18:40:27', '0000-00-00 00:00:00'),
(22, 15, 'Jilan Photoshoot 2018', 1, '2020-08-22 18:41:18', '0000-00-00 00:00:00'),
(23, 22, 'Image', 1, '2020-08-22 18:41:28', '0000-00-00 00:00:00'),
(24, 22, 'Video', 1, '2020-08-22 18:41:41', '0000-00-00 00:00:00'),
(25, 16, 'Jilan Video Shoot 2018', 1, '2020-08-22 18:42:33', '0000-00-00 00:00:00'),
(26, 25, 'Video', 1, '2020-08-22 18:42:44', '0000-00-00 00:00:00'),
(27, 6, 'Presentation EU 2008', 1, '2020-08-22 18:44:42', '0000-00-00 00:00:00'),
(28, 27, 'Video', 1, '2020-08-22 18:44:56', '0000-00-00 00:00:00'),
(29, 11, 'GTV 2018', 1, '2020-08-22 18:45:46', '0000-00-00 00:00:00'),
(30, 11, 'The Independent 2010', 1, '2020-08-22 18:45:59', '0000-00-00 00:00:00'),
(31, 29, 'Video', 1, '2020-08-22 18:46:19', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `activities_relation`
--

CREATE TABLE `activities_relation` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `category_ids` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `activities_relation`
--

INSERT INTO `activities_relation` (`id`, `product_id`, `category_ids`, `created`, `modified`) VALUES
(5, 5, 1, '2017-12-22 16:44:51', '2017-12-22 15:44:51'),
(10, 4, 3, '2017-12-22 17:08:39', '2017-12-22 16:08:39'),
(13, 6, 4, '2017-12-22 17:26:18', '2017-12-22 16:26:18'),
(14, 6, 3, '2017-12-22 17:26:18', '2017-12-22 16:26:18'),
(15, 7, 9, '2017-12-22 17:27:00', '2017-12-22 16:27:00'),
(16, 7, 8, '2017-12-22 17:27:00', '2017-12-22 16:27:00'),
(19, 9, 19, '2020-08-22 19:03:04', '2020-08-22 13:03:04'),
(20, 9, 9, '2020-08-22 19:03:04', '2020-08-22 13:03:04'),
(33, 21, 18, '2020-09-05 10:18:24', '2020-09-05 04:18:24'),
(34, 21, 9, '2020-09-05 10:18:24', '2020-09-05 04:18:24'),
(35, 21, 8, '2020-09-05 10:18:24', '2020-09-05 04:18:24'),
(39, 22, 19, '2020-09-05 10:20:41', '2020-09-05 04:20:41'),
(40, 22, 9, '2020-09-05 10:20:41', '2020-09-05 04:20:41'),
(41, 22, 8, '2020-09-05 10:20:41', '2020-09-05 04:20:41'),
(42, 8, 18, '2020-09-05 10:26:23', '2020-09-05 04:26:23'),
(43, 8, 9, '2020-09-05 10:26:23', '2020-09-05 04:26:23'),
(44, 8, 8, '2020-09-05 10:26:23', '2020-09-05 04:26:23'),
(48, 23, 23, '2020-09-05 11:41:20', '2020-09-05 05:41:20'),
(49, 23, 22, '2020-09-05 11:41:20', '2020-09-05 05:41:20'),
(50, 23, 15, '2020-09-05 11:41:20', '2020-09-05 05:41:20');

-- --------------------------------------------------------

--
-- Table structure for table `entertainment`
--

CREATE TABLE `entertainment` (
  `entertainment_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `title` varchar(512) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `entertainment`
--

INSERT INTO `entertainment` (`entertainment_id`, `category_id`, `title`, `description`, `status`, `created`, `modified`) VALUES
(1, 1, 'Mr. Jilan \'s Photo', NULL, 1, '2017-12-18 14:38:04', '2017-12-18 08:38:04'),
(2, 3, 'Jilan \'s Birthday', NULL, 1, '2017-12-18 14:40:44', '2017-12-18 08:40:44'),
(3, 1, 'Mr. Jilan', NULL, 1, '2017-12-19 19:46:52', '2017-12-19 13:46:52'),
(4, 1, 'jilan', NULL, 1, '2017-12-19 19:47:41', '2017-12-19 13:47:41');

-- --------------------------------------------------------

--
-- Table structure for table `entertainment_category`
--

CREATE TABLE `entertainment_category` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `category_name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `entertainment_category`
--

INSERT INTO `entertainment_category` (`id`, `parent_id`, `category_name`, `status`, `created`, `modified`) VALUES
(1, 0, 'Mr. Jilan', 1, '2017-12-18 12:27:51', '0000-00-00 00:00:00'),
(2, 0, 'The One', 1, '2017-12-18 12:28:29', '0000-00-00 00:00:00'),
(3, 0, 'Birthday', 1, '2017-12-18 12:28:44', '0000-00-00 00:00:00'),
(4, 0, 'One Memory', 1, '2017-12-18 12:29:12', '0000-00-00 00:00:00'),
(5, 0, 'Fashion Party', 1, '2017-12-18 12:29:34', '0000-00-00 00:00:00'),
(6, 0, 'Friends', 1, '2017-12-18 12:29:47', '0000-00-00 00:00:00'),
(7, 0, 'World Tour', 1, '2017-12-18 12:31:14', '0000-00-00 00:00:00'),
(8, 7, 'Asia', 1, '2017-12-18 12:31:33', '2017-12-19 13:51:40'),
(9, 7, 'Europe', 1, '2017-12-18 12:32:07', '2017-12-19 13:51:51'),
(10, 7, 'North America', 1, '2017-12-18 12:32:16', '2017-12-19 13:52:04'),
(11, 7, 'Rest Of the World', 1, '2017-12-19 19:52:36', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `entertainment_relation`
--

CREATE TABLE `entertainment_relation` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `category_ids` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `entertainment_relation`
--

INSERT INTO `entertainment_relation` (`id`, `product_id`, `category_ids`, `created`, `modified`) VALUES
(1, 1, 1, '2017-12-18 14:38:04', '2017-12-18 08:38:04'),
(2, 2, 3, '2017-12-18 14:40:44', '2017-12-18 08:40:44'),
(3, 3, 1, '2017-12-19 19:46:52', '2017-12-19 13:46:52'),
(4, 4, 1, '2017-12-19 19:47:42', '2017-12-19 13:47:42');

-- --------------------------------------------------------

--
-- Table structure for table `jilancollection`
--

CREATE TABLE `jilancollection` (
  `jilancollection_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(512) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `dimension` text DEFAULT NULL,
  `featured` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `jilancollection`
--

INSERT INTO `jilancollection` (`jilancollection_id`, `category_id`, `title`, `description`, `price`, `dimension`, `featured`, `status`, `created`, `modified`) VALUES
(4, 2, 'Men\'s Summer', NULL, '0.00', NULL, NULL, 1, '2017-12-05 11:42:31', '2017-12-05 05:42:31'),
(6, 2, 'Summer Mens', NULL, '0.00', NULL, NULL, 1, '2017-12-05 11:48:20', '2017-12-05 05:48:20'),
(8, 6, 'Mens Winter', NULL, '0.00', NULL, NULL, 1, '2017-12-05 11:55:51', '2017-12-05 05:55:51'),
(9, 7, 'Dress Winter', NULL, '0.00', NULL, NULL, 1, '2017-12-05 11:57:17', '2017-12-05 05:57:17'),
(10, 8, 'Jacket Mens', NULL, '0.00', NULL, NULL, 1, '2017-12-05 11:58:15', '2017-12-05 05:58:15'),
(11, 11, 'Womens Summer', NULL, '0.00', NULL, NULL, 1, '2017-12-05 12:00:46', '2017-12-05 06:00:46'),
(12, 12, 'Dress Womens', NULL, '0.00', NULL, NULL, 1, '2017-12-05 12:02:10', '2017-12-05 06:02:10'),
(13, 13, 'Shirt Womens', NULL, '0.00', NULL, NULL, 1, '2017-12-05 12:03:00', '2017-12-05 06:03:00'),
(14, 27, 'Winter Salwar', NULL, '0.00', NULL, NULL, 1, '2017-12-05 12:06:01', '2017-12-05 06:06:01'),
(15, 25, 'Womens Winter', NULL, '0.00', NULL, NULL, 1, '2017-12-05 12:08:12', '2017-12-05 06:08:12'),
(16, 2, 'Mens Summ', NULL, '0.00', NULL, NULL, 1, '2017-12-05 12:09:30', '2017-12-05 06:09:30'),
(17, 4, 'Shirt mens', NULL, '0.00', NULL, NULL, 1, '2017-12-05 12:22:51', '2017-12-05 06:22:51'),
(18, 3, 'Dress Mens', '', '0.00', '', '', 1, '2017-12-05 12:23:40', '2020-09-11 18:23:24'),
(19, 4, 'Shirt Mens', NULL, '0.00', NULL, NULL, 1, '2017-12-05 12:24:41', '2017-12-05 06:24:41'),
(20, 2, 'Summer Mens', NULL, '0.00', NULL, NULL, 1, '2017-12-05 12:25:34', '2017-12-05 06:25:34'),
(21, 4, 'Shirt Mens', NULL, '0.00', NULL, NULL, 1, '2017-12-05 12:26:29', '2017-12-05 06:26:29'),
(22, 4, 'Shirt Summer', NULL, '0.00', NULL, NULL, 1, '2017-12-05 12:27:34', '2017-12-05 06:27:34'),
(23, 2, 'Summ', NULL, '0.00', NULL, NULL, 1, '2017-12-05 12:29:07', '2017-12-05 06:29:07'),
(24, 3, 'Dress Summ', NULL, '0.00', NULL, NULL, 1, '2017-12-05 12:30:13', '2017-12-05 06:30:13'),
(25, 11, 'Summer Womens', NULL, '0.00', NULL, NULL, 1, '2017-12-05 12:32:20', '2017-12-05 06:32:20'),
(26, 12, 'Shirt W', NULL, '0.00', NULL, NULL, 1, '2017-12-05 12:34:32', '2017-12-05 06:34:32'),
(27, 12, 'Dress', NULL, '0.00', NULL, NULL, 1, '2017-12-05 12:35:50', '2017-12-05 06:35:50'),
(28, 12, 'Dress W', NULL, '0.00', NULL, NULL, 1, '2017-12-05 12:39:56', '2017-12-05 06:39:56'),
(29, 12, 'Dress W Summ', NULL, '0.00', NULL, NULL, 1, '2017-12-05 12:40:50', '2017-12-05 06:40:50'),
(30, 27, 'Sal W', NULL, '0.00', NULL, NULL, 1, '2017-12-05 12:43:04', '2017-12-05 06:43:04'),
(31, 3, 'Shirt', NULL, '0.00', NULL, NULL, 1, '2017-12-20 16:51:07', '2017-12-20 10:51:07'),
(32, 30, 'a', NULL, '0.00', NULL, NULL, 1, '2017-12-20 16:54:19', '2017-12-20 10:54:19'),
(33, 28, 'asa', NULL, '0.00', NULL, NULL, 1, '2017-12-20 16:55:26', '2017-12-20 10:55:26'),
(35, 33, 'pant two product', NULL, '0.00', NULL, NULL, 1, '2020-08-21 01:41:31', '2020-08-20 19:41:31'),
(36, 33, 'pant tow product tow', NULL, '0.00', NULL, NULL, 1, '2020-08-21 02:01:20', '2020-08-20 20:01:20'),
(37, 33, '-- pant two two', NULL, '0.00', NULL, NULL, 1, '2020-08-21 02:02:31', '2020-08-20 20:02:31'),
(38, 33, 'Pant-tow product', NULL, '0.00', NULL, NULL, 1, '2020-08-22 16:16:36', '2020-08-22 10:16:36'),
(40, 56, 'SUMMER COLLECTION - T SHIRT', '', '0.00', '', '', 1, '2020-09-02 23:22:07', '2020-09-11 15:14:32'),
(41, 58, 'SUMMER COLLECTION - PANT', '.', '0.00', '.', '.', 1, '2020-09-11 01:17:18', '2020-09-11 15:40:53'),
(43, 57, ' SUMMER COLLECTION - T SHIRT', '', '0.00', '', '', 1, '2020-09-11 21:36:07', '2020-09-11 15:37:14'),
(44, 59, 'SUMMER COLLECTION - BLAZER', '', '0.00', '', '', 1, '2020-09-11 21:43:30', '2020-09-11 15:43:30'),
(45, 60, 'SUMMER COLLECTION - PANJABI', '', '0.00', '', '', 1, '2020-09-11 21:46:04', '2020-09-11 15:46:04'),
(46, 61, 'SUMMER COLLECTION - SHERWANI', '', '0.00', '', '', 1, '2020-09-11 21:47:45', '2020-09-11 15:47:45'),
(47, 62, 'WINTER COLLECTION - SWEATER', '', '0.00', '', '', 1, '2020-09-11 21:50:28', '2020-09-11 15:50:28'),
(48, 63, 'WINTER COLLECTION - JACKET', '', '0.00', '', '', 1, '2020-09-11 21:52:26', '2020-09-11 15:52:26'),
(49, 64, 'WINTER COLLECTION - CODE', '', '0.00', '', '', 1, '2020-09-11 21:54:17', '2020-09-11 15:54:17'),
(50, 65, 'WINTER COLLECTION - TROUSER', '', '0.00', '', '', 1, '2020-09-11 21:56:01', '2020-09-11 15:56:01'),
(51, 67, 'WINTER COLLECTION - GLOVES', '', '0.00', '', '', 1, '2020-09-11 21:59:03', '2020-09-11 15:59:03'),
(52, 68, 'WINTER COLLECTION - SOCKS', '', '0.00', '', '', 1, '2020-09-11 22:01:03', '2020-09-11 16:01:03'),
(53, 69, 'WINTER COLLECTION - HAT', '', '0.00', '', '', 1, '2020-09-11 22:02:51', '2020-09-11 16:02:51'),
(54, 43, 'ACCESSORIES - SUNGLASS', '', '0.00', '', '', 1, '2020-09-11 23:44:14', '2020-09-11 17:49:26'),
(55, 44, 'ACCESSORIES - WATCH', '', '0.00', '', '', 1, '2020-09-11 23:54:08', '2020-09-11 17:54:08'),
(56, 45, 'ACCESSORIES - BELT', '', '0.00', '', '', 1, '2020-09-11 23:55:53', '2020-09-11 17:55:53'),
(57, 46, 'ACCESSORIES - FOOTWEAR', '', '0.00', '', '', 1, '2020-09-11 23:57:38', '2020-09-11 17:57:38'),
(58, 47, 'JEWELLERY - NECKLESS', '', '0.00', '', '', 1, '2020-09-11 23:59:41', '2020-09-11 17:59:41'),
(59, 48, 'JEWELLERY - BRACELETS', '', '0.00', '', '', 1, '2020-09-12 00:01:41', '2020-09-11 18:01:41'),
(60, 49, 'JEWELLERY - FINGER RING', '', '0.00', '', '', 1, '2020-09-12 00:04:54', '2020-09-11 18:04:54'),
(61, 50, 'JEWELLERY - EARRING', '', '0.00', '', '', 1, '2020-09-12 00:07:28', '2020-09-11 18:07:28'),
(62, 51, 'FRAGRANCE - SUMMER PERFUME', '', '0.00', '', '', 1, '2020-09-12 00:09:16', '2020-09-11 18:09:16'),
(63, 52, 'FRAGRANCE - WINTER PERFUME', '', '0.00', '', '', 1, '2020-09-12 00:11:06', '2020-09-11 18:11:06'),
(64, 53, 'WALLET - MONEY BAG', '', '0.00', '', '', 1, '2020-09-12 00:12:52', '2020-09-11 18:12:52'),
(65, 54, 'WALLET - CARD HOLDER', '', '0.00', '', '', 1, '2020-09-12 00:15:40', '2020-09-11 18:15:40'),
(66, 55, 'WALLET - PASSPORT BAG', '', '0.00', '', '', 1, '2020-09-12 00:17:43', '2020-09-11 18:17:43'),
(67, 3, 'NEW ARRIVALS - DRESS', '', '0.00', '', '', 1, '2020-09-12 00:21:26', '2020-09-11 18:21:50'),
(68, 9, 'NEW ARRIVALS - ACCESSORIES', '', '0.00', '', '', 1, '2020-09-12 00:27:24', '2020-09-11 18:27:24'),
(69, 93, 'SUMMER COLLECTION - ONE PIECE', '', '0.00', '', '', 1, '2020-09-12 00:33:57', '2020-09-11 18:33:57'),
(70, 94, 'SUMMER COLLECTION - KURTI', '', '0.00', '', '', 1, '2020-09-12 00:35:45', '2020-09-11 18:35:45'),
(71, 95, 'SUMMER COLLECTION - GOWN', '', '0.00', '', '', 1, '2020-09-12 00:39:23', '2020-09-11 18:39:23'),
(72, 96, 'SUMMER COLLECTION - LEHENGA', '', '0.00', '', '', 1, '2020-09-12 00:41:36', '2020-09-11 18:41:36'),
(73, 97, 'SUMMER COLLECTION - MAXI', '', '0.00', '', '', 1, '2020-09-12 00:45:07', '2020-09-11 18:45:07'),
(74, 98, 'SUMMER COLLECTION - THREE PIECE', '', '0.00', '', '', 1, '2020-09-12 00:47:14', '2020-09-11 18:47:14'),
(75, 99, 'SUMMER COLLECTION - SAREE', '', '0.00', '', '', 1, '2020-09-12 00:49:31', '2020-09-11 18:49:31'),
(76, 101, 'SUMMER COLLECTION - PLAZO', '', '0.00', '', '', 1, '2020-09-12 00:52:57', '2020-09-11 18:52:57'),
(77, 102, 'SUMMER COLLECTION - TOPS', '', '0.00', '', '', 1, '2020-09-12 00:54:52', '2020-09-11 18:54:52'),
(78, 103, 'SUMMER COLLECTION - LEGGING', '', '0.00', '', '', 1, '2020-09-12 00:56:53', '2020-09-11 18:56:53'),
(79, 104, 'WINTER COLLECTION - SWEATER', '', '0.00', '', '', 1, '2020-09-12 00:58:58', '2020-09-11 18:58:58'),
(80, 105, 'WINTER COLLECTION - JACKET', '', '0.00', '', '', 1, '2020-09-12 01:01:01', '2020-09-11 19:01:01'),
(81, 106, 'WINTER COLLECTION - CODE', '', '0.00', '', '', 1, '2020-09-12 01:03:41', '2020-09-11 19:03:41'),
(82, 108, 'WINTER COLLECTION - GLOVES', '', '0.00', '', '', 1, '2020-09-12 01:06:17', '2020-09-11 19:06:17'),
(83, 109, 'WINTER COLLECTION - SOCKS', '', '0.00', '', '', 1, '2020-09-12 01:08:26', '2020-09-11 19:08:26'),
(84, 110, 'WINTER COLLECTION - HAT', '', '0.00', '', '', 1, '2020-09-12 01:10:06', '2020-09-11 19:10:06'),
(85, 78, 'ACCESSORIES - SUNGLASS', '', '0.00', '', '', 1, '2020-09-12 01:11:51', '2020-09-11 19:11:51'),
(86, 79, 'ACCESSORIES - WATCH', '', '0.00', '', '', 1, '2020-09-12 01:13:42', '2020-09-11 19:13:42'),
(87, 80, 'ACCESSORIES - BELT', '', '0.00', '', '', 1, '2020-09-12 01:15:16', '2020-09-11 19:15:16'),
(88, 81, 'ACCESSORIES - FOOTWEAR', '', '0.00', '', '', 1, '2020-09-12 01:17:03', '2020-09-11 19:17:03'),
(89, 82, 'JEWELLERY - NECKLESS', '', '0.00', '', '', 1, '2020-09-12 01:19:28', '2020-09-11 19:19:28'),
(90, 83, 'JEWELLERY - BRACELETS', '', '0.00', '', '', 1, '2020-09-12 01:20:53', '2020-09-11 19:20:53'),
(91, 84, 'JEWELLERY - FINGER RING', '', '0.00', '', '', 1, '2020-09-12 01:22:39', '2020-09-11 19:22:39'),
(92, 85, 'JEWELLERY - EARRING', '', '0.00', '', '', 1, '2020-09-12 01:24:28', '2020-09-11 19:24:28'),
(93, 86, 'FRAGRANCE - SUMMER PERFUME', '', '0.00', '', '', 1, '2020-09-12 01:26:26', '2020-09-11 19:26:26'),
(94, 87, 'FRAGRANCE - WINTER PERFUME', '', '0.00', '', '', 1, '2020-09-12 01:28:11', '2020-09-11 19:28:11'),
(95, 88, 'WALLET - MONEY BAG', '', '0.00', '', '', 1, '2020-09-12 01:29:46', '2020-09-11 19:29:46'),
(96, 89, 'WALLET - CARD HOLDER', '', '0.00', '', '', 1, '2020-09-12 01:31:19', '2020-09-11 19:31:19'),
(97, 90, 'WALLET - PASSPORT BAG', '', '0.00', '', '', 1, '2020-09-12 01:32:58', '2020-09-11 19:32:58');

-- --------------------------------------------------------

--
-- Table structure for table `jilancollection_category`
--

CREATE TABLE `jilancollection_category` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `category_name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jilancollection_category`
--

INSERT INTO `jilancollection_category` (`id`, `parent_id`, `category_name`, `status`, `created`, `modified`) VALUES
(1, 0, 'Men’s Fashion', 1, '2017-11-08 15:37:36', '2020-08-22 10:39:30'),
(2, 1, 'New Arivals', 1, '2017-11-08 15:37:45', '2020-08-22 10:40:20'),
(3, 2, 'Dress', 1, '2017-11-08 15:37:51', '0000-00-00 00:00:00'),
(5, 0, 'Women’s Fashion', 1, '2017-11-08 17:20:14', '2020-08-22 11:20:27'),
(6, 1, 'Dress', 1, '2017-11-08 17:20:52', '2020-08-22 10:41:25'),
(9, 2, 'Accessories', 1, '2017-11-08 17:22:31', '0000-00-00 00:00:00'),
(11, 5, 'New Arivals', 1, '2017-11-08 18:07:32', '2020-08-22 11:21:43'),
(20, 19, 'Full Sleev', 1, '2017-11-14 16:29:13', '0000-00-00 00:00:00'),
(25, 5, 'Dress', 1, '2017-11-30 16:53:26', '2020-08-22 11:22:13'),
(34, 1, 'Accessories', 1, '2020-08-22 16:53:05', '0000-00-00 00:00:00'),
(35, 1, 'Jewelry', 1, '2020-08-22 16:53:24', '0000-00-00 00:00:00'),
(36, 1, 'Fragrance', 1, '2020-08-22 16:54:06', '0000-00-00 00:00:00'),
(37, 1, 'wallet', 1, '2020-08-22 16:54:31', '0000-00-00 00:00:00'),
(41, 6, 'Summer Collection', 1, '2020-08-22 16:57:49', '0000-00-00 00:00:00'),
(42, 6, 'Winter Collection', 1, '2020-08-22 16:58:05', '0000-00-00 00:00:00'),
(43, 34, 'Sunglass', 1, '2020-08-22 17:03:51', '0000-00-00 00:00:00'),
(44, 34, 'Watch', 1, '2020-08-22 17:04:18', '0000-00-00 00:00:00'),
(45, 34, 'Belt', 1, '2020-08-22 17:04:31', '0000-00-00 00:00:00'),
(46, 34, 'Footwear', 1, '2020-08-22 17:04:55', '0000-00-00 00:00:00'),
(47, 35, 'Neckless', 1, '2020-08-22 17:05:36', '0000-00-00 00:00:00'),
(48, 35, 'Bracelets', 1, '2020-08-22 17:06:00', '0000-00-00 00:00:00'),
(49, 35, 'finger ring', 1, '2020-08-22 17:06:18', '0000-00-00 00:00:00'),
(50, 35, 'Earring', 1, '2020-08-22 17:06:43', '0000-00-00 00:00:00'),
(51, 36, 'summer fragrance', 1, '2020-08-22 17:07:20', '0000-00-00 00:00:00'),
(52, 36, 'winter fragrance', 1, '2020-08-22 17:07:36', '0000-00-00 00:00:00'),
(53, 37, 'Money bag', 1, '2020-08-22 17:08:00', '0000-00-00 00:00:00'),
(54, 37, 'card holder', 1, '2020-08-22 17:08:20', '0000-00-00 00:00:00'),
(55, 37, 'Passport Bag', 1, '2020-08-22 17:08:46', '0000-00-00 00:00:00'),
(56, 41, 'Shirt', 1, '2020-08-22 17:09:41', '0000-00-00 00:00:00'),
(57, 41, 'T-Shirt', 1, '2020-08-22 17:10:00', '0000-00-00 00:00:00'),
(58, 41, 'Pant', 1, '2020-08-22 17:10:18', '0000-00-00 00:00:00'),
(59, 41, 'Blazer', 1, '2020-08-22 17:10:33', '0000-00-00 00:00:00'),
(60, 41, 'Panjabi', 1, '2020-08-22 17:10:59', '0000-00-00 00:00:00'),
(61, 41, 'Sherwani', 1, '2020-08-22 17:11:14', '0000-00-00 00:00:00'),
(62, 42, 'Sweater', 1, '2020-08-22 17:14:15', '0000-00-00 00:00:00'),
(63, 42, 'Jacket', 1, '2020-08-22 17:14:29', '0000-00-00 00:00:00'),
(64, 42, 'Code', 1, '2020-08-22 17:14:58', '0000-00-00 00:00:00'),
(65, 42, 'Trouser', 1, '2020-08-22 17:15:13', '0000-00-00 00:00:00'),
(66, 42, 'Scrap', 1, '2020-08-22 17:15:36', '0000-00-00 00:00:00'),
(67, 42, 'Gloves', 1, '2020-08-22 17:16:12', '0000-00-00 00:00:00'),
(68, 42, 'Sockes', 1, '2020-08-22 17:16:24', '0000-00-00 00:00:00'),
(69, 42, 'Hat', 1, '2020-08-22 17:16:49', '0000-00-00 00:00:00'),
(70, 5, 'Accessories', 1, '2020-08-22 17:56:11', '0000-00-00 00:00:00'),
(71, 5, 'Jewelry', 1, '2020-08-22 17:56:36', '0000-00-00 00:00:00'),
(72, 5, 'Fragrance', 1, '2020-08-22 17:56:57', '0000-00-00 00:00:00'),
(73, 5, 'wallet', 1, '2020-08-22 17:57:13', '0000-00-00 00:00:00'),
(74, 11, 'Dress', 1, '2020-08-22 17:57:35', '0000-00-00 00:00:00'),
(75, 11, 'Accessories', 1, '2020-08-22 17:57:45', '0000-00-00 00:00:00'),
(76, 25, 'Summer Collection', 1, '2020-08-22 17:58:08', '0000-00-00 00:00:00'),
(77, 25, 'Winter Collection', 1, '2020-08-22 17:58:18', '0000-00-00 00:00:00'),
(78, 70, 'Sunglass', 1, '2020-08-22 17:58:54', '0000-00-00 00:00:00'),
(79, 70, 'Watch', 1, '2020-08-22 17:59:19', '0000-00-00 00:00:00'),
(80, 70, 'Belt', 1, '2020-08-22 17:59:34', '0000-00-00 00:00:00'),
(81, 70, 'Footwear', 1, '2020-08-22 17:59:46', '0000-00-00 00:00:00'),
(82, 71, 'Neckless', 1, '2020-08-22 18:00:11', '0000-00-00 00:00:00'),
(83, 71, 'Bracelets', 1, '2020-08-22 18:00:31', '0000-00-00 00:00:00'),
(84, 71, 'Finger ring', 1, '2020-08-22 18:00:46', '0000-00-00 00:00:00'),
(85, 71, 'Earring', 1, '2020-08-22 18:01:00', '0000-00-00 00:00:00'),
(86, 72, 'Summer Fragrance', 1, '2020-08-22 18:01:36', '0000-00-00 00:00:00'),
(87, 72, 'Winter Fragrance', 1, '2020-08-22 18:01:57', '0000-00-00 00:00:00'),
(88, 73, 'Money Bag', 1, '2020-08-22 18:02:15', '0000-00-00 00:00:00'),
(89, 73, 'Card Holder', 1, '2020-08-22 18:02:30', '0000-00-00 00:00:00'),
(90, 73, 'Passport Bag', 1, '2020-08-22 18:02:45', '0000-00-00 00:00:00'),
(93, 76, 'One Piece', 1, '2020-08-22 18:06:08', '0000-00-00 00:00:00'),
(94, 76, 'Kurti', 1, '2020-08-22 18:06:36', '0000-00-00 00:00:00'),
(95, 76, 'Goawn', 1, '2020-08-22 18:06:52', '0000-00-00 00:00:00'),
(96, 76, 'Lahenga', 1, '2020-08-22 18:07:13', '0000-00-00 00:00:00'),
(97, 76, 'Maxi', 1, '2020-08-22 18:07:49', '0000-00-00 00:00:00'),
(98, 76, 'Three Piece', 1, '2020-08-22 18:08:05', '0000-00-00 00:00:00'),
(99, 76, 'Sharee', 1, '2020-08-22 18:08:19', '0000-00-00 00:00:00'),
(100, 76, 'Scrap', 1, '2020-08-22 18:08:54', '0000-00-00 00:00:00'),
(101, 76, 'Plazo', 1, '2020-08-22 18:09:08', '0000-00-00 00:00:00'),
(102, 76, 'Tops', 1, '2020-08-22 18:09:35', '0000-00-00 00:00:00'),
(103, 76, 'Legging', 1, '2020-08-22 18:09:57', '0000-00-00 00:00:00'),
(104, 77, 'Sweater', 1, '2020-08-22 18:10:29', '0000-00-00 00:00:00'),
(105, 77, 'Jacket', 1, '2020-08-22 18:10:41', '0000-00-00 00:00:00'),
(106, 77, 'Code', 1, '2020-08-22 18:10:56', '0000-00-00 00:00:00'),
(107, 77, 'Scrap', 1, '2020-08-22 18:11:33', '0000-00-00 00:00:00'),
(108, 77, 'Gloves', 1, '2020-08-22 18:11:54', '0000-00-00 00:00:00'),
(109, 77, 'Sockes', 1, '2020-08-22 18:12:06', '0000-00-00 00:00:00'),
(110, 77, 'Hat', 1, '2020-08-22 18:12:18', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `jilanmedia`
--

CREATE TABLE `jilanmedia` (
  `jilanmedia_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `title` varchar(512) NOT NULL,
  `video_name` varchar(128) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `jilanmedia`
--

INSERT INTO `jilanmedia` (`jilanmedia_id`, `category_id`, `title`, `video_name`, `description`, `status`, `created`, `modified`) VALUES
(5, 9, 'wetstyed', NULL, NULL, 1, '2017-12-21 11:55:17', '2017-12-21 10:55:17'),
(6, 4, 'Models', NULL, NULL, 1, '2017-12-21 11:58:33', '2017-12-21 10:58:33'),
(7, 9, 'awf', NULL, NULL, 1, '2017-12-21 11:59:23', '2017-12-21 10:59:23'),
(8, 5, 'Photographars', NULL, NULL, 1, '2017-12-21 12:02:35', '2017-12-21 11:02:35'),
(9, 18, 'Fashion Designer Image', NULL, NULL, 1, '2020-08-22 19:40:18', '2020-08-22 13:40:18'),
(10, 32, 'new video', '1599282209.mp4', NULL, 1, '2020-09-05 10:49:14', '2020-09-05 05:03:29'),
(11, 33, 'new image', NULL, NULL, 1, '2020-09-05 11:09:31', '2020-09-05 05:09:31'),
(13, 34, 'models-image', NULL, NULL, 1, '2020-09-05 11:31:36', '2020-09-05 05:31:36');

-- --------------------------------------------------------

--
-- Table structure for table `jilanmedia_category`
--

CREATE TABLE `jilanmedia_category` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `category_name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jilanmedia_category`
--

INSERT INTO `jilanmedia_category` (`id`, `parent_id`, `category_name`, `status`, `created`, `modified`) VALUES
(2, 0, 'TV Channel', 1, '2017-11-07 12:25:51', '2020-09-03 17:16:22'),
(3, 0, 'Newspaper & Magazine', 1, '2017-11-07 12:26:01', '2020-09-03 17:16:59'),
(4, 0, 'Celebrities', 1, '2017-11-07 12:26:10', '2020-09-03 17:18:51'),
(11, 3, 'The Independent', 1, '2017-12-21 11:23:49', '2020-09-03 17:17:30'),
(23, 0, 'Fashion Personalities', 1, '2020-09-03 23:21:00', '0000-00-00 00:00:00'),
(24, 0, 'Media Personalities', 1, '2020-09-03 23:21:20', '0000-00-00 00:00:00'),
(25, 23, 'Fashion Designer', 1, '2020-09-03 23:27:55', '0000-00-00 00:00:00'),
(26, 23, 'Models', 1, '2020-09-03 23:28:04', '0000-00-00 00:00:00'),
(27, 23, 'Photographer', 1, '2020-09-03 23:28:24', '0000-00-00 00:00:00'),
(28, 23, 'Cheriographar', 1, '2020-09-03 23:28:54', '0000-00-00 00:00:00'),
(30, 23, 'Makeup artist', 1, '2020-09-03 23:29:06', '0000-00-00 00:00:00'),
(31, 2, 'GTV', 1, '2020-09-03 23:29:37', '0000-00-00 00:00:00'),
(32, 31, 'Video', 1, '2020-09-03 23:29:49', '0000-00-00 00:00:00'),
(33, 25, 'Image', 1, '2020-09-03 23:31:00', '0000-00-00 00:00:00'),
(34, 26, 'Image', 1, '2020-09-03 23:31:11', '0000-00-00 00:00:00'),
(35, 27, 'Image', 1, '2020-09-03 23:31:19', '0000-00-00 00:00:00'),
(36, 28, 'Image', 1, '2020-09-03 23:31:30', '0000-00-00 00:00:00'),
(37, 30, 'Image', 1, '2020-09-03 23:32:16', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `jilanmedia_relation`
--

CREATE TABLE `jilanmedia_relation` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `category_ids` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jilanmedia_relation`
--

INSERT INTO `jilanmedia_relation` (`id`, `product_id`, `category_ids`, `created`, `modified`) VALUES
(9, 6, 4, '2017-12-21 11:58:33', '2017-12-21 10:58:33'),
(10, 7, 9, '2017-12-21 11:59:23', '2017-12-21 10:59:23'),
(11, 7, 2, '2017-12-21 11:59:23', '2017-12-21 10:59:23'),
(13, 8, 5, '2017-12-21 12:02:55', '2017-12-21 11:02:55'),
(14, 5, 9, '2017-12-21 12:42:27', '2017-12-21 11:42:27'),
(15, 5, 2, '2017-12-21 12:42:27', '2017-12-21 11:42:27'),
(16, 9, 18, '2020-08-22 19:40:18', '2020-08-22 13:40:18'),
(17, 9, 13, '2020-08-22 19:40:18', '2020-08-22 13:40:18'),
(21, 10, 32, '2020-09-05 11:03:29', '2020-09-05 05:03:29'),
(22, 10, 31, '2020-09-05 11:03:29', '2020-09-05 05:03:29'),
(23, 10, 2, '2020-09-05 11:03:29', '2020-09-05 05:03:29'),
(27, 11, 33, '2020-09-05 11:12:45', '2020-09-05 05:12:45'),
(28, 11, 25, '2020-09-05 11:12:45', '2020-09-05 05:12:45'),
(29, 11, 23, '2020-09-05 11:12:45', '2020-09-05 05:12:45'),
(42, 13, 34, '2020-09-05 11:59:51', '2020-09-05 05:59:51'),
(43, 13, 26, '2020-09-05 11:59:51', '2020-09-05 05:59:51'),
(44, 13, 23, '2020-09-05 11:59:51', '2020-09-05 05:59:51');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` int(11) NOT NULL,
  `typeid` int(11) NOT NULL,
  `title` text DEFAULT NULL,
  `image_details` text DEFAULT NULL,
  `images` varchar(64) NOT NULL,
  `show_home` int(11) DEFAULT NULL,
  `type` varchar(64) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `typeid`, `title`, `image_details`, `images`, `show_home`, `type`, `created`, `modified`) VALUES
(1, 35, 'this is pant', 'pant details', '1597952491.jpg', NULL, 'jilancollection', '2020-08-21 01:41:32', '0000-00-00 00:00:00'),
(15, 6, 'Section 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC', '\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"', '1512452900.jpg', NULL, 'jilancollection', '2017-12-05 11:48:21', '0000-00-00 00:00:00'),
(22, 8, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '1512453351.jpg', NULL, 'jilancollection', '2017-12-05 11:55:52', '0000-00-00 00:00:00'),
(23, 9, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '1512453438.jpg', NULL, 'jilancollection', '2017-12-05 11:57:18', '0000-00-00 00:00:00'),
(24, 10, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '1512453495.jpg', NULL, 'jilancollection', '2017-12-05 11:58:16', '0000-00-00 00:00:00'),
(25, 11, '1914 translation by H. Rackham', '\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"', '1512453646.jpg', NULL, 'jilancollection', '2017-12-05 12:00:47', '0000-00-00 00:00:00'),
(26, 12, 'Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC', '\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"', '1512453730.jpg', NULL, 'jilancollection', '2017-12-05 12:02:11', '0000-00-00 00:00:00'),
(27, 13, '1914 translation by H. Rackham', '\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"', '1512453780.jpg', NULL, 'jilancollection', '2017-12-05 12:03:01', '0000-00-00 00:00:00'),
(28, 14, 'The standard Lorem Ipsum passage, used since the 1500s', '\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"\r\n\r\n', '1512453961.jpg', NULL, 'jilancollection', '2017-12-05 12:06:02', '0000-00-00 00:00:00'),
(29, 15, 'The standard Lorem Ipsum passage, used since the 1500s', '\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"\r\n\r\n', '1512454092.jpg', NULL, 'jilancollection', '2017-12-05 12:08:12', '0000-00-00 00:00:00'),
(30, 16, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"\r\n\r\n', '1512454170.jpg', NULL, 'jilancollection', '2017-12-05 12:09:30', '0000-00-00 00:00:00'),
(41, 17, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"', '1512454971.jpg', NULL, 'jilancollection', '2017-12-05 12:22:52', '0000-00-00 00:00:00'),
(43, 19, '1914 translation by H. Rackham', '\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"\r\n\r\n', '1512455081.jpg', NULL, 'jilancollection', '2017-12-05 12:24:41', '0000-00-00 00:00:00'),
(44, 20, '1914 translation by H. Rackham', '\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"\r\n\r\n', '1512455134.jpg', NULL, 'jilancollection', '2017-12-05 12:25:35', '0000-00-00 00:00:00'),
(46, 22, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"\r\n\r\n', '1512455254.jpg', NULL, 'jilancollection', '2017-12-05 12:27:35', '0000-00-00 00:00:00'),
(47, 23, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"', '1512455347.jpg', NULL, 'jilancollection', '2017-12-05 12:29:08', '0000-00-00 00:00:00'),
(48, 24, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"\r\n\r\n', '1512455413.jpg', NULL, 'jilancollection', '2017-12-05 12:30:13', '0000-00-00 00:00:00'),
(49, 25, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"\r\n\r\n', '1512455540.jpg', NULL, 'jilancollection', '2017-12-05 12:32:21', '0000-00-00 00:00:00'),
(50, 26, '1914 translation by H. Rackham', '\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"', '1512455672.jpg', NULL, 'jilancollection', '2017-12-05 12:34:33', '0000-00-00 00:00:00'),
(51, 27, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"\r\n\r\n', '1512455750.jpg', NULL, 'jilancollection', '2017-12-05 12:35:51', '0000-00-00 00:00:00'),
(52, 28, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"\r\n\r\n', '1512455996.jpg', NULL, 'jilancollection', '2017-12-05 12:39:57', '0000-00-00 00:00:00'),
(53, 29, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"', '1512456050.jpg', NULL, 'jilancollection', '2017-12-05 12:40:51', '0000-00-00 00:00:00'),
(54, 30, '1914 translation by H. Rackham', '\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"\r\n\r\n', '1512456184.jpg', NULL, 'jilancollection', '2017-12-05 12:43:05', '0000-00-00 00:00:00'),
(56, 21, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"\r\n\r\n', '1512456301_0.jpg', NULL, 'jilancollection', '2017-12-05 12:45:02', '0000-00-00 00:00:00'),
(58, 4, 'Section 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC', '\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"', '1512558510_0.jpg', NULL, 'jilancollection', '2017-12-06 17:08:31', '0000-00-00 00:00:00'),
(97, 4, 'The photo of Jilan’s first design the [ Saree ] was  published  in  the English language newspaper “The Independent ”  on  the 25th  August,  2010  in  Dhaka, Bangladesh', NULL, '1513522927_0.jpg', NULL, 'jilanmedia', '2017-12-17 21:02:07', '2017-12-17 15:05:04'),
(98, 1, 'Jilan 1', '\"There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain...\"\r\n', '1513586284_0.jpg', NULL, 'entertainment', '2017-12-18 14:38:05', '0000-00-00 00:00:00'),
(99, 1, 'Jilan 2', '\"There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain...\"\r\n', '1513586284_1.jpg', NULL, 'entertainment', '2017-12-18 14:38:06', '0000-00-00 00:00:00'),
(100, 1, 'Jilan 3', '\"There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain...\"\r\n', '1513586284_2.jpg', NULL, 'entertainment', '2017-12-18 14:38:07', '0000-00-00 00:00:00'),
(101, 1, 'Jilan 3', '\"There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain...\"\r\n', '1513586284_3.jpg', NULL, 'entertainment', '2017-12-18 14:38:09', '0000-00-00 00:00:00'),
(102, 2, 'Jilan Cake', '\"There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain...\"\r\n', '1513586444_0.jpg', NULL, 'entertainment', '2017-12-18 14:40:45', '0000-00-00 00:00:00'),
(103, 2, 'Jilan Birthday', '\"There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain...\"\r\n', '1513586444_1.jpg', NULL, 'entertainment', '2017-12-18 14:40:46', '0000-00-00 00:00:00'),
(104, 4, 'The photo of Jilan’s first design the [ Saree ] was  published  in  the English language newspaper “The Independent ”  on  the 25th  August,  2010  in  Dhaka, Bangladesh', NULL, '1513658736_0.jpg', NULL, 'jilanmedia', '2017-12-19 10:45:37', '0000-00-00 00:00:00'),
(105, 4, 'The photo of Jilan’s first design the [ Saree ] was  published  in  the English language newspaper “The Independent ”  on  the 25th  August,  2010  in  Dhaka, Bangladesh', NULL, '1513659056_0.jpg', NULL, 'jilanmedia', '2017-12-19 10:50:56', '0000-00-00 00:00:00'),
(106, 3, 'Jilan', '', '1513691212_0.jpg', NULL, 'entertainment', '2017-12-19 19:46:53', '0000-00-00 00:00:00'),
(107, 4, '', '', '1513691262_0.jpg', NULL, 'entertainment', '2017-12-19 19:47:43', '0000-00-00 00:00:00'),
(108, 31, '', '', '1513767068.jpg', NULL, 'jilancollection', '2017-12-20 16:51:08', '0000-00-00 00:00:00'),
(109, 32, 'dsdss', 'dsdsds\r\nsdsd\r\nsd\r\nsd\r\nsd\r\nsd', '1513767260.jpg', NULL, 'jilancollection', '2017-12-20 16:54:21', '0000-00-00 00:00:00'),
(110, 33, 'asa', 'sasasa', '1513767327.jpg', NULL, 'jilancollection', '2017-12-20 16:55:27', '0000-00-00 00:00:00'),
(111, 8, 'dhjndfjhnf', 'dfhjnfdhjrf', '1513836155_2.jpg', NULL, 'jilanmedia', '2017-12-21 12:02:36', '0000-00-00 00:00:00'),
(112, 8, '22222222222222222222222222', '2222222222222222222222222222222222222222222222222', '1513836155_1.jpg', NULL, 'jilanmedia', '2017-12-21 12:02:36', '2017-12-21 11:02:55'),
(113, 8, '111', '111111111111111111111111111111111111111111111', '1513836155_0.jpg', NULL, 'jilanmedia', '2017-12-21 12:02:36', '2017-12-21 11:02:55'),
(114, 7, 'sefsdgf', 'sdgdrtytrh', '1513835963_0.jpg', NULL, 'jilanmedia', '2017-12-21 11:59:24', '0000-00-00 00:00:00'),
(115, 6, 'ykityi967yuki', 'kuy6k8o78lji987', '1513835913_3.png', NULL, 'jilanmedia', '2017-12-21 11:58:36', '0000-00-00 00:00:00'),
(116, 6, 'rhjurtfj', 'uygmjgyiyuik', '1513835913_2.jpg', NULL, 'jilanmedia', '2017-12-21 11:58:35', '0000-00-00 00:00:00'),
(117, 6, 'yrthtrfj', 'fjugftiuyk', '1513835913_1.jpg', NULL, 'jilanmedia', '2017-12-21 11:58:34', '0000-00-00 00:00:00'),
(118, 6, 'afwst', 'ewryd', '1513835913_0.jpeg', NULL, 'jilanmedia', '2017-12-21 11:58:34', '0000-00-00 00:00:00'),
(120, 5, 'sgsgsg', 'sgsgsetgedhyurtuydjndju', '1513835717_2.png', NULL, 'jilanmedia', '2017-12-21 11:55:19', '0000-00-00 00:00:00'),
(121, 5, 'afsaf', 'afasfgwedhndfjhfjfiji', '1513835717_0.jpg', NULL, 'jilanmedia', '2017-12-21 11:55:17', '0000-00-00 00:00:00'),
(124, 4, 'aaaa', 'aaaaaa', '1513938152_0.jpg', NULL, 'activities', '2017-12-22 16:22:33', '0000-00-00 00:00:00'),
(125, 4, 'bbbb', 'bbbbbbbbb', '1513938152_1.jpg', NULL, 'activities', '2017-12-22 16:22:33', '0000-00-00 00:00:00'),
(126, 4, 'ccccc', 'ccccccccc', '1513938152_2.jpg', NULL, 'activities', '2017-12-22 16:22:34', '0000-00-00 00:00:00'),
(127, 4, 'ddddddd', 'dddddddddddd', '1513938152_3.jpg', NULL, 'activities', '2017-12-22 16:22:34', '0000-00-00 00:00:00'),
(128, 5, '12222', '1233564', '1513939491_0.png', NULL, 'activities', '2017-12-22 16:44:52', '0000-00-00 00:00:00'),
(129, 5, '6445', '5154446', '1513939491_1.jpg', NULL, 'activities', '2017-12-22 16:44:52', '0000-00-00 00:00:00'),
(130, 5, '87978', '454555445646545', '1513939491_2.jpg', NULL, 'activities', '2017-12-22 16:44:53', '0000-00-00 00:00:00'),
(131, 6, '1111111', '111111111111', '1513941720_0.jpeg', NULL, 'activities', '2017-12-22 17:22:01', '0000-00-00 00:00:00'),
(132, 6, '22222222', '22222222222', '1513941720_1.jpg', NULL, 'activities', '2017-12-22 17:22:02', '0000-00-00 00:00:00'),
(133, 6, '33333333', '33333333333', '1513941720_2.jpg', NULL, 'activities', '2017-12-22 17:22:02', '0000-00-00 00:00:00'),
(134, 6, '44444444', '44444444444444444', '1513941720_3.png', NULL, 'activities', '2017-12-22 17:22:03', '0000-00-00 00:00:00'),
(135, 6, '55555555', '555555555555555', '1513941720_4.jpg', NULL, 'activities', '2017-12-22 17:22:04', '0000-00-00 00:00:00'),
(136, 6, '666666666', '666666666666666666', '1513941720_5.jpg', NULL, 'activities', '2017-12-22 17:22:05', '0000-00-00 00:00:00'),
(137, 37, 'this is caption', 'caption details', '1597953751.jpg', NULL, 'jilancollection', '2020-08-21 02:02:32', '0000-00-00 00:00:00'),
(138, 38, 'man fashion', 'man fashion', '1598091396.jpg', NULL, 'jilancollection', '2020-08-22 16:16:36', '0000-00-00 00:00:00'),
(139, 38, 'man fashion 2', 'man fashion 2 details', '1598092363_0.jpg', NULL, 'jilancollection', '2020-08-22 16:32:43', '0000-00-00 00:00:00'),
(141, 9, 'image caption ', 'details caption', '1598103618_0.jpg', NULL, 'jilanmedia', '2020-08-22 19:40:18', '0000-00-00 00:00:00'),
(145, 21, 'photo 1', 'photo 1 description', '1599277499_0.jpg', NULL, 'activities', '2020-09-05 09:44:59', '0000-00-00 00:00:00'),
(146, 21, 'photo-2', 'photo-2 ', '1599279503_0.jpg', NULL, 'activities', '2020-09-05 10:18:24', '0000-00-00 00:00:00'),
(147, 8, 'caption-1', 'caption details', '1599279983_0.png', NULL, 'activities', '2020-09-05 10:26:23', '0000-00-00 00:00:00'),
(148, 11, 'caption-1', 'cpation-1-details', '1599282571_0.jpg', NULL, 'jilanmedia', '2020-09-05 11:09:32', '2020-09-05 05:12:45'),
(149, 11, 'cpation-2', 'caption-2-details', '1599282765_0.jpeg', NULL, 'jilanmedia', '2020-09-05 11:12:45', '0000-00-00 00:00:00'),
(150, 13, 'caption-1', 'caption-details-1', '1599283896_0.jpg', NULL, 'jilanmedia', '2020-09-05 11:31:36', '0000-00-00 00:00:00'),
(151, 13, 'caption-2', 'caption-2-details', '1599283992_0.jpeg', NULL, 'jilanmedia', '2020-09-05 11:33:12', '0000-00-00 00:00:00'),
(152, 23, 'caption-1', 'caption-1-details-1', '1599284391_0.jpg', NULL, 'activities', '2020-09-05 11:39:52', '0000-00-00 00:00:00'),
(153, 23, 'caption-2', 'caption-2-details', '1599284479_0.jpg', NULL, 'activities', '2020-09-05 11:41:20', '0000-00-00 00:00:00'),
(154, 13, 'sdf', 'sf', '1599285337_0.jpg', NULL, 'jilanmedia', '2020-09-05 11:55:37', '0000-00-00 00:00:00'),
(155, 13, 'dfg', 'sdfgsg', '1599285590_0.jpg', NULL, 'jilanmedia', '2020-09-05 11:59:51', '0000-00-00 00:00:00'),
(169, 40, '', '', '1599837272_0.png', NULL, 'jilancollection', '2020-09-11 21:14:34', '0000-00-00 00:00:00'),
(170, 40, '', '', '1599837272_1.png', NULL, 'jilancollection', '2020-09-11 21:14:35', '0000-00-00 00:00:00'),
(171, 40, '', '', '1599837272_2.png', NULL, 'jilancollection', '2020-09-11 21:14:36', '0000-00-00 00:00:00'),
(172, 40, '', '', '1599837272_3.png', NULL, 'jilancollection', '2020-09-11 21:14:38', '0000-00-00 00:00:00'),
(173, 40, '', '', '1599837272_4.png', NULL, 'jilancollection', '2020-09-11 21:14:40', '0000-00-00 00:00:00'),
(174, 40, '', '', '1599837272_5.png', NULL, 'jilancollection', '2020-09-11 21:14:42', '0000-00-00 00:00:00'),
(177, 43, '', '', '1599838567.png', NULL, 'jilancollection', '2020-09-11 21:36:08', '0000-00-00 00:00:00'),
(178, 43, '', '', '1599838599_0.png', NULL, 'jilancollection', '2020-09-11 21:36:40', '0000-00-00 00:00:00'),
(179, 43, '', '', '1599838599_1.png', NULL, 'jilancollection', '2020-09-11 21:36:42', '0000-00-00 00:00:00'),
(180, 43, '', '', '1599838599_2.png', NULL, 'jilancollection', '2020-09-11 21:36:43', '0000-00-00 00:00:00'),
(181, 43, '', '', '1599838599_3.png', NULL, 'jilancollection', '2020-09-11 21:36:45', '0000-00-00 00:00:00'),
(182, 43, '', '', '1599838599_4.png', NULL, 'jilancollection', '2020-09-11 21:36:46', '0000-00-00 00:00:00'),
(183, 41, '', '', '1599838853_0.png', NULL, 'jilancollection', '2020-09-11 21:40:54', '0000-00-00 00:00:00'),
(184, 41, '', '', '1599838853_1.png', NULL, 'jilancollection', '2020-09-11 21:40:56', '0000-00-00 00:00:00'),
(185, 41, '', '', '1599838853_2.png', NULL, 'jilancollection', '2020-09-11 21:40:57', '0000-00-00 00:00:00'),
(186, 41, '', '', '1599838853_3.png', NULL, 'jilancollection', '2020-09-11 21:40:59', '0000-00-00 00:00:00'),
(187, 41, '', '', '1599838853_4.png', NULL, 'jilancollection', '2020-09-11 21:41:00', '0000-00-00 00:00:00'),
(188, 41, '', '', '1599838853_5.png', NULL, 'jilancollection', '2020-09-11 21:41:02', '0000-00-00 00:00:00'),
(189, 44, '', '', '1599839010.png', NULL, 'jilancollection', '2020-09-11 21:43:32', '0000-00-00 00:00:00'),
(190, 44, '', '', '1599839026_0.png', NULL, 'jilancollection', '2020-09-11 21:43:48', '0000-00-00 00:00:00'),
(191, 44, '', '', '1599839026_1.png', NULL, 'jilancollection', '2020-09-11 21:43:50', '0000-00-00 00:00:00'),
(192, 44, '', '', '1599839026_2.png', NULL, 'jilancollection', '2020-09-11 21:43:51', '0000-00-00 00:00:00'),
(193, 44, '', '', '1599839026_3.png', NULL, 'jilancollection', '2020-09-11 21:43:53', '0000-00-00 00:00:00'),
(194, 44, '', '', '1599839026_4.png', NULL, 'jilancollection', '2020-09-11 21:43:54', '0000-00-00 00:00:00'),
(195, 45, '', '', '1599839164.png', NULL, 'jilancollection', '2020-09-11 21:46:05', '0000-00-00 00:00:00'),
(196, 45, '', '', '1599839175_0.png', NULL, 'jilancollection', '2020-09-11 21:46:16', '0000-00-00 00:00:00'),
(197, 45, '', '', '1599839175_1.png', NULL, 'jilancollection', '2020-09-11 21:46:18', '0000-00-00 00:00:00'),
(198, 45, '', '', '1599839175_2.png', NULL, 'jilancollection', '2020-09-11 21:46:20', '0000-00-00 00:00:00'),
(199, 45, '', '', '1599839175_3.png', NULL, 'jilancollection', '2020-09-11 21:46:21', '0000-00-00 00:00:00'),
(200, 45, '', '', '1599839175_4.png', NULL, 'jilancollection', '2020-09-11 21:46:23', '0000-00-00 00:00:00'),
(201, 45, '', '', '1599839175_5.png', NULL, 'jilancollection', '2020-09-11 21:46:24', '0000-00-00 00:00:00'),
(203, 46, '', '', '1599839283_0.png', NULL, 'jilancollection', '2020-09-11 21:48:04', '0000-00-00 00:00:00'),
(204, 46, '', '', '1599839283_1.png', NULL, 'jilancollection', '2020-09-11 21:48:06', '0000-00-00 00:00:00'),
(205, 46, '', '', '1599839283_2.png', NULL, 'jilancollection', '2020-09-11 21:48:08', '0000-00-00 00:00:00'),
(206, 46, '', '', '1599839283_3.png', NULL, 'jilancollection', '2020-09-11 21:48:09', '0000-00-00 00:00:00'),
(207, 46, '', '', '1599839283_4.png', NULL, 'jilancollection', '2020-09-11 21:48:10', '0000-00-00 00:00:00'),
(208, 46, '', '', '1599839283_5.png', NULL, 'jilancollection', '2020-09-11 21:48:12', '0000-00-00 00:00:00'),
(209, 47, '', '', '1599839428.png', NULL, 'jilancollection', '2020-09-11 21:50:30', '0000-00-00 00:00:00'),
(210, 47, '', '', '1599839447_0.png', NULL, 'jilancollection', '2020-09-11 21:50:48', '0000-00-00 00:00:00'),
(211, 47, '', '', '1599839447_1.png', NULL, 'jilancollection', '2020-09-11 21:50:49', '0000-00-00 00:00:00'),
(212, 47, '', '', '1599839447_2.png', NULL, 'jilancollection', '2020-09-11 21:50:51', '0000-00-00 00:00:00'),
(213, 47, '', '', '1599839447_3.png', NULL, 'jilancollection', '2020-09-11 21:50:52', '0000-00-00 00:00:00'),
(214, 47, '', '', '1599839447_4.png', NULL, 'jilancollection', '2020-09-11 21:50:54', '0000-00-00 00:00:00'),
(215, 48, '', '', '1599839546.png', NULL, 'jilancollection', '2020-09-11 21:52:27', '0000-00-00 00:00:00'),
(216, 48, '', '', '1599839563_0.png', NULL, 'jilancollection', '2020-09-11 21:52:44', '0000-00-00 00:00:00'),
(217, 48, '', '', '1599839563_1.png', NULL, 'jilancollection', '2020-09-11 21:52:45', '0000-00-00 00:00:00'),
(218, 48, '', '', '1599839563_2.png', NULL, 'jilancollection', '2020-09-11 21:52:47', '0000-00-00 00:00:00'),
(219, 48, '', '', '1599839563_3.png', NULL, 'jilancollection', '2020-09-11 21:52:48', '0000-00-00 00:00:00'),
(220, 48, '', '', '1599839563_4.png', NULL, 'jilancollection', '2020-09-11 21:52:49', '0000-00-00 00:00:00'),
(221, 49, '', '', '1599839657.png', NULL, 'jilancollection', '2020-09-11 21:54:19', '0000-00-00 00:00:00'),
(222, 49, '', '', '1599839667_0.png', NULL, 'jilancollection', '2020-09-11 21:54:28', '0000-00-00 00:00:00'),
(223, 49, '', '', '1599839667_1.png', NULL, 'jilancollection', '2020-09-11 21:54:30', '0000-00-00 00:00:00'),
(224, 49, '', '', '1599839667_2.png', NULL, 'jilancollection', '2020-09-11 21:54:32', '0000-00-00 00:00:00'),
(225, 49, '', '', '1599839667_3.png', NULL, 'jilancollection', '2020-09-11 21:54:33', '0000-00-00 00:00:00'),
(226, 49, '', '', '1599839667_4.png', NULL, 'jilancollection', '2020-09-11 21:54:35', '0000-00-00 00:00:00'),
(227, 50, '', '', '1599839761.png', NULL, 'jilancollection', '2020-09-11 21:56:02', '0000-00-00 00:00:00'),
(228, 50, '', '', '1599839768_0.png', NULL, 'jilancollection', '2020-09-11 21:56:09', '0000-00-00 00:00:00'),
(229, 51, '', '', '1599839943.png', NULL, 'jilancollection', '2020-09-11 21:59:04', '0000-00-00 00:00:00'),
(230, 51, '', '', '1599839952_0.png', NULL, 'jilancollection', '2020-09-11 21:59:14', '0000-00-00 00:00:00'),
(231, 51, '', '', '1599839952_1.png', NULL, 'jilancollection', '2020-09-11 21:59:15', '0000-00-00 00:00:00'),
(232, 51, '', '', '1599839952_2.png', NULL, 'jilancollection', '2020-09-11 21:59:16', '0000-00-00 00:00:00'),
(233, 51, '', '', '1599839952_3.png', NULL, 'jilancollection', '2020-09-11 21:59:17', '0000-00-00 00:00:00'),
(234, 51, '', '', '1599839952_4.png', NULL, 'jilancollection', '2020-09-11 21:59:19', '0000-00-00 00:00:00'),
(235, 52, '', '', '1599840063.png', NULL, 'jilancollection', '2020-09-11 22:01:04', '0000-00-00 00:00:00'),
(236, 52, '', '', '1599840074_0.png', NULL, 'jilancollection', '2020-09-11 22:01:15', '0000-00-00 00:00:00'),
(237, 52, '', '', '1599840074_1.png', NULL, 'jilancollection', '2020-09-11 22:01:17', '0000-00-00 00:00:00'),
(238, 52, '', '', '1599840074_2.png', NULL, 'jilancollection', '2020-09-11 22:01:18', '0000-00-00 00:00:00'),
(239, 52, '', '', '1599840074_3.png', NULL, 'jilancollection', '2020-09-11 22:01:19', '0000-00-00 00:00:00'),
(240, 52, '', '', '1599840074_4.png', NULL, 'jilancollection', '2020-09-11 22:01:21', '0000-00-00 00:00:00'),
(241, 53, '', '', '1599840171.png', NULL, 'jilancollection', '2020-09-11 22:02:53', '0000-00-00 00:00:00'),
(242, 53, '', '', '1599840182_0.png', NULL, 'jilancollection', '2020-09-11 22:03:04', '0000-00-00 00:00:00'),
(243, 53, '', '', '1599840182_1.png', NULL, 'jilancollection', '2020-09-11 22:03:06', '0000-00-00 00:00:00'),
(244, 53, '', '', '1599840182_2.png', NULL, 'jilancollection', '2020-09-11 22:03:07', '0000-00-00 00:00:00'),
(245, 53, '', '', '1599840182_3.png', NULL, 'jilancollection', '2020-09-11 22:03:09', '0000-00-00 00:00:00'),
(246, 54, '', '', '1599846254.png', NULL, 'jilancollection', '2020-09-11 23:44:16', '0000-00-00 00:00:00'),
(247, 54, '', '', '1599846288_0.png', NULL, 'jilancollection', '2020-09-11 23:44:50', '0000-00-00 00:00:00'),
(248, 54, '', '', '1599846288_1.png', NULL, 'jilancollection', '2020-09-11 23:44:52', '0000-00-00 00:00:00'),
(249, 54, '', '', '1599846288_2.png', NULL, 'jilancollection', '2020-09-11 23:44:53', '0000-00-00 00:00:00'),
(250, 54, '', '', '1599846288_3.png', NULL, 'jilancollection', '2020-09-11 23:44:55', '0000-00-00 00:00:00'),
(252, 54, '', '', '1599846580_0.png', NULL, 'jilancollection', '2020-09-11 23:49:42', '0000-00-00 00:00:00'),
(253, 55, '', '', '1599846848.png', NULL, 'jilancollection', '2020-09-11 23:54:10', '0000-00-00 00:00:00'),
(254, 55, '', '', '1599846861_0.png', NULL, 'jilancollection', '2020-09-11 23:54:22', '0000-00-00 00:00:00'),
(255, 55, '', '', '1599846861_1.png', NULL, 'jilancollection', '2020-09-11 23:54:23', '0000-00-00 00:00:00'),
(256, 55, '', '', '1599846861_2.png', NULL, 'jilancollection', '2020-09-11 23:54:24', '0000-00-00 00:00:00'),
(257, 55, '', '', '1599846861_3.png', NULL, 'jilancollection', '2020-09-11 23:54:26', '0000-00-00 00:00:00'),
(258, 55, '', '', '1599846861_4.png', NULL, 'jilancollection', '2020-09-11 23:54:27', '0000-00-00 00:00:00'),
(259, 56, '', '', '1599846953.png', NULL, 'jilancollection', '2020-09-11 23:55:54', '0000-00-00 00:00:00'),
(260, 56, '', '', '1599846966_0.png', NULL, 'jilancollection', '2020-09-11 23:56:07', '0000-00-00 00:00:00'),
(261, 56, '', '', '1599846966_1.png', NULL, 'jilancollection', '2020-09-11 23:56:08', '0000-00-00 00:00:00'),
(262, 56, '', '', '1599846966_2.png', NULL, 'jilancollection', '2020-09-11 23:56:09', '0000-00-00 00:00:00'),
(263, 56, '', '', '1599846966_3.png', NULL, 'jilancollection', '2020-09-11 23:56:10', '0000-00-00 00:00:00'),
(264, 56, '', '', '1599846966_4.png', NULL, 'jilancollection', '2020-09-11 23:56:12', '0000-00-00 00:00:00'),
(265, 57, '', '', '1599847058.png', NULL, 'jilancollection', '2020-09-11 23:57:40', '0000-00-00 00:00:00'),
(266, 57, '', '', '1599847071_0.png', NULL, 'jilancollection', '2020-09-11 23:57:52', '0000-00-00 00:00:00'),
(267, 57, '', '', '1599847071_1.png', NULL, 'jilancollection', '2020-09-11 23:57:53', '0000-00-00 00:00:00'),
(268, 57, '', '', '1599847071_2.png', NULL, 'jilancollection', '2020-09-11 23:57:54', '0000-00-00 00:00:00'),
(269, 57, '', '', '1599847071_3.png', NULL, 'jilancollection', '2020-09-11 23:57:55', '0000-00-00 00:00:00'),
(270, 57, '', '', '1599847071_4.png', NULL, 'jilancollection', '2020-09-11 23:57:56', '0000-00-00 00:00:00'),
(271, 58, '', '', '1599847181.png', NULL, 'jilancollection', '2020-09-11 23:59:42', '0000-00-00 00:00:00'),
(272, 58, '', '', '1599847193_0.png', NULL, 'jilancollection', '2020-09-11 23:59:54', '0000-00-00 00:00:00'),
(273, 58, '', '', '1599847193_1.png', NULL, 'jilancollection', '2020-09-11 23:59:55', '0000-00-00 00:00:00'),
(274, 58, '', '', '1599847193_2.png', NULL, 'jilancollection', '2020-09-11 23:59:56', '0000-00-00 00:00:00'),
(275, 58, '', '', '1599847193_3.png', NULL, 'jilancollection', '2020-09-11 23:59:58', '0000-00-00 00:00:00'),
(276, 58, '', '', '1599847193_4.png', NULL, 'jilancollection', '2020-09-11 23:59:59', '0000-00-00 00:00:00'),
(277, 59, '', '', '1599847301.png', NULL, 'jilancollection', '2020-09-12 00:01:42', '0000-00-00 00:00:00'),
(278, 59, '', '', '1599847312_0.png', NULL, 'jilancollection', '2020-09-12 00:01:53', '0000-00-00 00:00:00'),
(279, 59, '', '', '1599847312_1.png', NULL, 'jilancollection', '2020-09-12 00:01:55', '0000-00-00 00:00:00'),
(280, 59, '', '', '1599847312_2.png', NULL, 'jilancollection', '2020-09-12 00:01:56', '0000-00-00 00:00:00'),
(281, 59, '', '', '1599847312_3.png', NULL, 'jilancollection', '2020-09-12 00:01:57', '0000-00-00 00:00:00'),
(282, 59, '', '', '1599847312_4.png', NULL, 'jilancollection', '2020-09-12 00:01:58', '0000-00-00 00:00:00'),
(283, 60, '', '', '1599847494.png', NULL, 'jilancollection', '2020-09-12 00:04:55', '0000-00-00 00:00:00'),
(284, 60, '', '', '1599847505_0.png', NULL, 'jilancollection', '2020-09-12 00:05:06', '0000-00-00 00:00:00'),
(285, 60, '', '', '1599847505_1.png', NULL, 'jilancollection', '2020-09-12 00:05:07', '0000-00-00 00:00:00'),
(286, 60, '', '', '1599847505_2.png', NULL, 'jilancollection', '2020-09-12 00:05:08', '0000-00-00 00:00:00'),
(287, 60, '', '', '1599847505_3.png', NULL, 'jilancollection', '2020-09-12 00:05:09', '0000-00-00 00:00:00'),
(288, 61, '', '', '1599847648.png', NULL, 'jilancollection', '2020-09-12 00:07:29', '0000-00-00 00:00:00'),
(289, 61, '', '', '1599847659_0.png', NULL, 'jilancollection', '2020-09-12 00:07:40', '0000-00-00 00:00:00'),
(290, 61, '', '', '1599847659_1.png', NULL, 'jilancollection', '2020-09-12 00:07:41', '0000-00-00 00:00:00'),
(291, 61, '', '', '1599847659_2.png', NULL, 'jilancollection', '2020-09-12 00:07:42', '0000-00-00 00:00:00'),
(292, 61, '', '', '1599847659_3.png', NULL, 'jilancollection', '2020-09-12 00:07:43', '0000-00-00 00:00:00'),
(293, 61, '', '', '1599847659_4.png', NULL, 'jilancollection', '2020-09-12 00:07:44', '0000-00-00 00:00:00'),
(294, 62, '', '', '1599847756.png', NULL, 'jilancollection', '2020-09-12 00:09:17', '0000-00-00 00:00:00'),
(295, 62, '', '', '1599847768_0.png', NULL, 'jilancollection', '2020-09-12 00:09:29', '0000-00-00 00:00:00'),
(296, 62, '', '', '1599847768_1.png', NULL, 'jilancollection', '2020-09-12 00:09:31', '0000-00-00 00:00:00'),
(297, 63, '', '', '1599847866.png', NULL, 'jilancollection', '2020-09-12 00:11:07', '0000-00-00 00:00:00'),
(298, 63, '', '', '1599847877_0.png', NULL, 'jilancollection', '2020-09-12 00:11:19', '0000-00-00 00:00:00'),
(299, 63, '', '', '1599847877_1.png', NULL, 'jilancollection', '2020-09-12 00:11:20', '0000-00-00 00:00:00'),
(300, 63, '', '', '1599847877_2.png', NULL, 'jilancollection', '2020-09-12 00:11:21', '0000-00-00 00:00:00'),
(301, 63, '', '', '1599847877_3.png', NULL, 'jilancollection', '2020-09-12 00:11:22', '0000-00-00 00:00:00'),
(302, 64, '', '', '1599847972.png', NULL, 'jilancollection', '2020-09-12 00:12:54', '0000-00-00 00:00:00'),
(303, 64, '', '', '1599847983_0.png', NULL, 'jilancollection', '2020-09-12 00:13:04', '0000-00-00 00:00:00'),
(304, 64, '', '', '1599847983_1.png', NULL, 'jilancollection', '2020-09-12 00:13:06', '0000-00-00 00:00:00'),
(305, 64, '', '', '1599847983_2.png', NULL, 'jilancollection', '2020-09-12 00:13:07', '0000-00-00 00:00:00'),
(306, 64, '', '', '1599847983_3.png', NULL, 'jilancollection', '2020-09-12 00:13:08', '0000-00-00 00:00:00'),
(307, 64, '', '', '1599847983_4.png', NULL, 'jilancollection', '2020-09-12 00:13:09', '0000-00-00 00:00:00'),
(308, 65, '', '', '1599848140.png', NULL, 'jilancollection', '2020-09-12 00:15:42', '0000-00-00 00:00:00'),
(309, 65, '', '', '1599848153_0.png', NULL, 'jilancollection', '2020-09-12 00:15:55', '0000-00-00 00:00:00'),
(310, 65, '', '', '1599848153_1.png', NULL, 'jilancollection', '2020-09-12 00:15:56', '0000-00-00 00:00:00'),
(311, 65, '', '', '1599848153_2.png', NULL, 'jilancollection', '2020-09-12 00:15:58', '0000-00-00 00:00:00'),
(312, 65, '', '', '1599848153_3.png', NULL, 'jilancollection', '2020-09-12 00:16:00', '0000-00-00 00:00:00'),
(313, 65, '', '', '1599848153_4.png', NULL, 'jilancollection', '2020-09-12 00:16:01', '0000-00-00 00:00:00'),
(314, 66, '', '', '1599848263.png', NULL, 'jilancollection', '2020-09-12 00:17:44', '0000-00-00 00:00:00'),
(315, 66, '', '', '1599848277_0.png', NULL, 'jilancollection', '2020-09-12 00:17:58', '0000-00-00 00:00:00'),
(316, 66, '', '', '1599848277_1.png', NULL, 'jilancollection', '2020-09-12 00:18:00', '0000-00-00 00:00:00'),
(317, 66, '', '', '1599848277_2.png', NULL, 'jilancollection', '2020-09-12 00:18:01', '0000-00-00 00:00:00'),
(318, 66, '', '', '1599848277_3.png', NULL, 'jilancollection', '2020-09-12 00:18:02', '0000-00-00 00:00:00'),
(319, 66, '', '', '1599848277_4.png', NULL, 'jilancollection', '2020-09-12 00:18:03', '0000-00-00 00:00:00'),
(320, 67, '', '', '1599848486.png', NULL, 'jilancollection', '2020-09-12 00:21:27', '0000-00-00 00:00:00'),
(321, 67, '', '', '1599848510_0.png', NULL, 'jilancollection', '2020-09-12 00:21:51', '0000-00-00 00:00:00'),
(322, 67, '', '', '1599848510_1.png', NULL, 'jilancollection', '2020-09-12 00:21:53', '0000-00-00 00:00:00'),
(323, 67, '', '', '1599848510_2.png', NULL, 'jilancollection', '2020-09-12 00:21:54', '0000-00-00 00:00:00'),
(324, 67, '', '', '1599848510_3.png', NULL, 'jilancollection', '2020-09-12 00:21:55', '0000-00-00 00:00:00'),
(325, 18, '', '', '1599848604_0.png', NULL, 'jilancollection', '2020-09-12 00:23:25', '0000-00-00 00:00:00'),
(326, 18, '', '', '1599848604_1.png', NULL, 'jilancollection', '2020-09-12 00:23:27', '0000-00-00 00:00:00'),
(327, 18, '', '', '1599848604_2.png', NULL, 'jilancollection', '2020-09-12 00:23:28', '0000-00-00 00:00:00'),
(328, 18, '', '', '1599848604_3.png', NULL, 'jilancollection', '2020-09-12 00:23:30', '0000-00-00 00:00:00'),
(329, 18, '', '', '1599848604_4.png', NULL, 'jilancollection', '2020-09-12 00:23:31', '0000-00-00 00:00:00'),
(330, 68, '', '', '1599848844.png', NULL, 'jilancollection', '2020-09-12 00:27:26', '0000-00-00 00:00:00'),
(331, 68, '', '', '1599848880_0.png', NULL, 'jilancollection', '2020-09-12 00:28:01', '0000-00-00 00:00:00'),
(332, 68, '', '', '1599848880_1.png', NULL, 'jilancollection', '2020-09-12 00:28:03', '0000-00-00 00:00:00'),
(333, 68, '', '', '1599848880_2.png', NULL, 'jilancollection', '2020-09-12 00:28:04', '0000-00-00 00:00:00'),
(334, 68, '', '', '1599848880_3.png', NULL, 'jilancollection', '2020-09-12 00:28:05', '0000-00-00 00:00:00'),
(335, 68, '', '', '1599848880_4.png', NULL, 'jilancollection', '2020-09-12 00:28:06', '0000-00-00 00:00:00'),
(336, 69, '', '', '1599849237.png', NULL, 'jilancollection', '2020-09-12 00:33:59', '0000-00-00 00:00:00'),
(337, 69, '', '', '1599849249_0.png', NULL, 'jilancollection', '2020-09-12 00:34:11', '0000-00-00 00:00:00'),
(338, 69, '', '', '1599849249_1.png', NULL, 'jilancollection', '2020-09-12 00:34:12', '0000-00-00 00:00:00'),
(339, 69, '', '', '1599849249_2.png', NULL, 'jilancollection', '2020-09-12 00:34:14', '0000-00-00 00:00:00'),
(340, 69, '', '', '1599849249_3.png', NULL, 'jilancollection', '2020-09-12 00:34:16', '0000-00-00 00:00:00'),
(341, 69, '', '', '1599849249_4.png', NULL, 'jilancollection', '2020-09-12 00:34:18', '0000-00-00 00:00:00'),
(342, 70, '', '', '1599849345.png', NULL, 'jilancollection', '2020-09-12 00:35:47', '0000-00-00 00:00:00'),
(343, 70, '', '', '1599849357_0.png', NULL, 'jilancollection', '2020-09-12 00:35:59', '0000-00-00 00:00:00'),
(344, 70, '', '', '1599849357_1.png', NULL, 'jilancollection', '2020-09-12 00:36:01', '0000-00-00 00:00:00'),
(345, 70, '', '', '1599849357_2.png', NULL, 'jilancollection', '2020-09-12 00:36:03', '0000-00-00 00:00:00'),
(346, 70, '', '', '1599849357_3.png', NULL, 'jilancollection', '2020-09-12 00:36:04', '0000-00-00 00:00:00'),
(347, 70, '', '', '1599849357_4.png', NULL, 'jilancollection', '2020-09-12 00:36:06', '0000-00-00 00:00:00'),
(348, 71, '', '', '1599849563.png', NULL, 'jilancollection', '2020-09-12 00:39:25', '0000-00-00 00:00:00'),
(349, 71, '', '', '1599849576_0.png', NULL, 'jilancollection', '2020-09-12 00:39:38', '0000-00-00 00:00:00'),
(350, 71, '', '', '1599849576_1.png', NULL, 'jilancollection', '2020-09-12 00:39:40', '0000-00-00 00:00:00'),
(351, 71, '', '', '1599849576_2.png', NULL, 'jilancollection', '2020-09-12 00:39:42', '0000-00-00 00:00:00'),
(352, 71, '', '', '1599849576_3.png', NULL, 'jilancollection', '2020-09-12 00:39:44', '0000-00-00 00:00:00'),
(353, 71, '', '', '1599849576_4.png', NULL, 'jilancollection', '2020-09-12 00:39:45', '0000-00-00 00:00:00'),
(354, 72, '', '', '1599849696.png', NULL, 'jilancollection', '2020-09-12 00:41:37', '0000-00-00 00:00:00'),
(355, 72, '', '', '1599849707_0.png', NULL, 'jilancollection', '2020-09-12 00:41:48', '0000-00-00 00:00:00'),
(356, 72, '', '', '1599849707_1.png', NULL, 'jilancollection', '2020-09-12 00:41:49', '0000-00-00 00:00:00'),
(357, 72, '', '', '1599849707_2.png', NULL, 'jilancollection', '2020-09-12 00:41:51', '0000-00-00 00:00:00'),
(358, 72, '', '', '1599849707_3.png', NULL, 'jilancollection', '2020-09-12 00:41:53', '0000-00-00 00:00:00'),
(359, 72, '', '', '1599849707_4.png', NULL, 'jilancollection', '2020-09-12 00:41:54', '0000-00-00 00:00:00'),
(360, 73, '', '', '1599849907.png', NULL, 'jilancollection', '2020-09-12 00:45:08', '0000-00-00 00:00:00'),
(361, 73, '', '', '1599849924_0.png', NULL, 'jilancollection', '2020-09-12 00:45:26', '0000-00-00 00:00:00'),
(362, 73, '', '', '1599849924_1.png', NULL, 'jilancollection', '2020-09-12 00:45:27', '0000-00-00 00:00:00'),
(363, 73, '', '', '1599849924_2.png', NULL, 'jilancollection', '2020-09-12 00:45:28', '0000-00-00 00:00:00'),
(364, 73, '', '', '1599849924_3.png', NULL, 'jilancollection', '2020-09-12 00:45:30', '0000-00-00 00:00:00'),
(365, 73, '', '', '1599849924_4.png', NULL, 'jilancollection', '2020-09-12 00:45:31', '0000-00-00 00:00:00'),
(366, 74, '', '', '1599850034.png', NULL, 'jilancollection', '2020-09-12 00:47:16', '0000-00-00 00:00:00'),
(367, 74, '', '', '1599850048_0.png', NULL, 'jilancollection', '2020-09-12 00:47:30', '0000-00-00 00:00:00'),
(368, 74, '', '', '1599850048_1.png', NULL, 'jilancollection', '2020-09-12 00:47:32', '0000-00-00 00:00:00');
INSERT INTO `media` (`id`, `typeid`, `title`, `image_details`, `images`, `show_home`, `type`, `created`, `modified`) VALUES
(369, 74, '', '', '1599850048_2.png', NULL, 'jilancollection', '2020-09-12 00:47:34', '0000-00-00 00:00:00'),
(370, 74, '', '', '1599850048_3.png', NULL, 'jilancollection', '2020-09-12 00:47:36', '0000-00-00 00:00:00'),
(371, 74, '', '', '1599850048_4.png', NULL, 'jilancollection', '2020-09-12 00:47:37', '0000-00-00 00:00:00'),
(372, 75, '', '', '1599850171.png', NULL, 'jilancollection', '2020-09-12 00:49:33', '0000-00-00 00:00:00'),
(373, 75, '', '', '1599850192_0.png', NULL, 'jilancollection', '2020-09-12 00:49:54', '0000-00-00 00:00:00'),
(374, 75, '', '', '1599850192_1.png', NULL, 'jilancollection', '2020-09-12 00:49:56', '0000-00-00 00:00:00'),
(375, 75, '', '', '1599850192_2.png', NULL, 'jilancollection', '2020-09-12 00:49:58', '0000-00-00 00:00:00'),
(376, 75, '', '', '1599850192_3.png', NULL, 'jilancollection', '2020-09-12 00:50:00', '0000-00-00 00:00:00'),
(377, 75, '', '', '1599850192_4.png', NULL, 'jilancollection', '2020-09-12 00:50:02', '0000-00-00 00:00:00'),
(378, 76, '', '', '1599850377.png', NULL, 'jilancollection', '2020-09-12 00:52:59', '0000-00-00 00:00:00'),
(379, 76, '', '', '1599850389_0.png', NULL, 'jilancollection', '2020-09-12 00:53:11', '0000-00-00 00:00:00'),
(380, 76, '', '', '1599850389_1.png', NULL, 'jilancollection', '2020-09-12 00:53:13', '0000-00-00 00:00:00'),
(381, 76, '', '', '1599850389_2.png', NULL, 'jilancollection', '2020-09-12 00:53:15', '0000-00-00 00:00:00'),
(382, 76, '', '', '1599850389_3.png', NULL, 'jilancollection', '2020-09-12 00:53:16', '0000-00-00 00:00:00'),
(383, 76, '', '', '1599850389_4.png', NULL, 'jilancollection', '2020-09-12 00:53:18', '0000-00-00 00:00:00'),
(384, 77, '', '', '1599850492.png', NULL, 'jilancollection', '2020-09-12 00:54:53', '0000-00-00 00:00:00'),
(385, 77, '', '', '1599850509_0.png', NULL, 'jilancollection', '2020-09-12 00:55:10', '0000-00-00 00:00:00'),
(386, 77, '', '', '1599850509_1.png', NULL, 'jilancollection', '2020-09-12 00:55:12', '0000-00-00 00:00:00'),
(387, 77, '', '', '1599850509_2.png', NULL, 'jilancollection', '2020-09-12 00:55:13', '0000-00-00 00:00:00'),
(388, 77, '', '', '1599850509_3.png', NULL, 'jilancollection', '2020-09-12 00:55:14', '0000-00-00 00:00:00'),
(389, 77, '', '', '1599850509_4.png', NULL, 'jilancollection', '2020-09-12 00:55:16', '0000-00-00 00:00:00'),
(390, 78, '', '', '1599850613.png', NULL, 'jilancollection', '2020-09-12 00:56:54', '0000-00-00 00:00:00'),
(391, 78, '', '', '1599850626_0.png', NULL, 'jilancollection', '2020-09-12 00:57:07', '0000-00-00 00:00:00'),
(392, 78, '', '', '1599850626_1.png', NULL, 'jilancollection', '2020-09-12 00:57:08', '0000-00-00 00:00:00'),
(393, 78, '', '', '1599850626_2.png', NULL, 'jilancollection', '2020-09-12 00:57:10', '0000-00-00 00:00:00'),
(394, 78, '', '', '1599850626_3.png', NULL, 'jilancollection', '2020-09-12 00:57:11', '0000-00-00 00:00:00'),
(395, 78, '', '', '1599850626_4.png', NULL, 'jilancollection', '2020-09-12 00:57:12', '0000-00-00 00:00:00'),
(396, 79, '', '', '1599850738.png', NULL, 'jilancollection', '2020-09-12 00:58:59', '0000-00-00 00:00:00'),
(397, 79, '', '', '1599850751_0.png', NULL, 'jilancollection', '2020-09-12 00:59:12', '0000-00-00 00:00:00'),
(398, 79, '', '', '1599850751_1.png', NULL, 'jilancollection', '2020-09-12 00:59:14', '0000-00-00 00:00:00'),
(399, 79, '', '', '1599850751_2.png', NULL, 'jilancollection', '2020-09-12 00:59:15', '0000-00-00 00:00:00'),
(400, 79, '', '', '1599850751_3.png', NULL, 'jilancollection', '2020-09-12 00:59:17', '0000-00-00 00:00:00'),
(401, 79, '', '', '1599850751_4.png', NULL, 'jilancollection', '2020-09-12 00:59:19', '0000-00-00 00:00:00'),
(402, 80, '', '', '1599850861.png', NULL, 'jilancollection', '2020-09-12 01:01:02', '0000-00-00 00:00:00'),
(403, 80, '', '', '1599850876_0.png', NULL, 'jilancollection', '2020-09-12 01:01:17', '0000-00-00 00:00:00'),
(404, 80, '', '', '1599850876_1.png', NULL, 'jilancollection', '2020-09-12 01:01:19', '0000-00-00 00:00:00'),
(405, 80, '', '', '1599850876_2.png', NULL, 'jilancollection', '2020-09-12 01:01:21', '0000-00-00 00:00:00'),
(406, 80, '', '', '1599850876_3.png', NULL, 'jilancollection', '2020-09-12 01:01:22', '0000-00-00 00:00:00'),
(407, 80, '', '', '1599850876_4.png', NULL, 'jilancollection', '2020-09-12 01:01:23', '0000-00-00 00:00:00'),
(408, 81, '', '', '1599851021.png', NULL, 'jilancollection', '2020-09-12 01:03:43', '0000-00-00 00:00:00'),
(409, 81, '', '', '1599851035_0.png', NULL, 'jilancollection', '2020-09-12 01:03:56', '0000-00-00 00:00:00'),
(410, 81, '', '', '1599851035_1.png', NULL, 'jilancollection', '2020-09-12 01:03:58', '0000-00-00 00:00:00'),
(411, 81, '', '', '1599851035_2.png', NULL, 'jilancollection', '2020-09-12 01:03:59', '0000-00-00 00:00:00'),
(412, 81, '', '', '1599851035_3.png', NULL, 'jilancollection', '2020-09-12 01:04:01', '0000-00-00 00:00:00'),
(413, 81, '', '', '1599851035_4.png', NULL, 'jilancollection', '2020-09-12 01:04:02', '0000-00-00 00:00:00'),
(414, 82, '', '', '1599851177.png', NULL, 'jilancollection', '2020-09-12 01:06:18', '0000-00-00 00:00:00'),
(415, 82, '', '', '1599851197_0.png', NULL, 'jilancollection', '2020-09-12 01:06:38', '0000-00-00 00:00:00'),
(416, 82, '', '', '1599851197_1.png', NULL, 'jilancollection', '2020-09-12 01:06:40', '0000-00-00 00:00:00'),
(417, 82, '', '', '1599851197_2.png', NULL, 'jilancollection', '2020-09-12 01:06:41', '0000-00-00 00:00:00'),
(418, 82, '', '', '1599851197_3.png', NULL, 'jilancollection', '2020-09-12 01:06:42', '0000-00-00 00:00:00'),
(419, 82, '', '', '1599851197_4.png', NULL, 'jilancollection', '2020-09-12 01:06:43', '0000-00-00 00:00:00'),
(420, 83, '', '', '1599851306.png', NULL, 'jilancollection', '2020-09-12 01:08:28', '0000-00-00 00:00:00'),
(421, 83, '', '', '1599851318_0.png', NULL, 'jilancollection', '2020-09-12 01:08:40', '0000-00-00 00:00:00'),
(422, 83, '', '', '1599851318_1.png', NULL, 'jilancollection', '2020-09-12 01:08:41', '0000-00-00 00:00:00'),
(423, 83, '', '', '1599851318_2.png', NULL, 'jilancollection', '2020-09-12 01:08:43', '0000-00-00 00:00:00'),
(424, 83, '', '', '1599851318_3.png', NULL, 'jilancollection', '2020-09-12 01:08:44', '0000-00-00 00:00:00'),
(425, 83, '', '', '1599851318_4.png', NULL, 'jilancollection', '2020-09-12 01:08:45', '0000-00-00 00:00:00'),
(426, 84, '', '', '1599851406.png', NULL, 'jilancollection', '2020-09-12 01:10:08', '0000-00-00 00:00:00'),
(427, 84, '', '', '1599851417_0.png', NULL, 'jilancollection', '2020-09-12 01:10:19', '0000-00-00 00:00:00'),
(428, 84, '', '', '1599851417_1.png', NULL, 'jilancollection', '2020-09-12 01:10:20', '0000-00-00 00:00:00'),
(429, 84, '', '', '1599851417_2.png', NULL, 'jilancollection', '2020-09-12 01:10:22', '0000-00-00 00:00:00'),
(430, 84, '', '', '1599851417_3.png', NULL, 'jilancollection', '2020-09-12 01:10:23', '0000-00-00 00:00:00'),
(431, 84, '', '', '1599851417_4.png', NULL, 'jilancollection', '2020-09-12 01:10:25', '0000-00-00 00:00:00'),
(432, 85, '', '', '1599851511.png', NULL, 'jilancollection', '2020-09-12 01:11:53', '0000-00-00 00:00:00'),
(433, 85, '', '', '1599851523_0.png', NULL, 'jilancollection', '2020-09-12 01:12:05', '0000-00-00 00:00:00'),
(434, 85, '', '', '1599851523_1.png', NULL, 'jilancollection', '2020-09-12 01:12:06', '0000-00-00 00:00:00'),
(435, 85, '', '', '1599851523_2.png', NULL, 'jilancollection', '2020-09-12 01:12:08', '0000-00-00 00:00:00'),
(436, 85, '', '', '1599851523_3.png', NULL, 'jilancollection', '2020-09-12 01:12:09', '0000-00-00 00:00:00'),
(437, 85, '', '', '1599851523_4.png', NULL, 'jilancollection', '2020-09-12 01:12:11', '0000-00-00 00:00:00'),
(438, 86, '', '', '1599851622.png', NULL, 'jilancollection', '2020-09-12 01:13:43', '0000-00-00 00:00:00'),
(439, 86, '', '', '1599851633_0.png', NULL, 'jilancollection', '2020-09-12 01:13:55', '0000-00-00 00:00:00'),
(440, 86, '', '', '1599851633_1.png', NULL, 'jilancollection', '2020-09-12 01:13:56', '0000-00-00 00:00:00'),
(441, 86, '', '', '1599851633_2.png', NULL, 'jilancollection', '2020-09-12 01:13:57', '0000-00-00 00:00:00'),
(442, 86, '', '', '1599851633_3.png', NULL, 'jilancollection', '2020-09-12 01:13:59', '0000-00-00 00:00:00'),
(443, 86, '', '', '1599851633_4.png', NULL, 'jilancollection', '2020-09-12 01:14:00', '0000-00-00 00:00:00'),
(444, 87, '', '', '1599851716.png', NULL, 'jilancollection', '2020-09-12 01:15:17', '0000-00-00 00:00:00'),
(445, 87, '', '', '1599851728_0.png', NULL, 'jilancollection', '2020-09-12 01:15:29', '0000-00-00 00:00:00'),
(446, 87, '', '', '1599851728_1.png', NULL, 'jilancollection', '2020-09-12 01:15:30', '0000-00-00 00:00:00'),
(447, 87, '', '', '1599851728_2.png', NULL, 'jilancollection', '2020-09-12 01:15:32', '0000-00-00 00:00:00'),
(448, 87, '', '', '1599851728_3.png', NULL, 'jilancollection', '2020-09-12 01:15:33', '0000-00-00 00:00:00'),
(449, 87, '', '', '1599851728_4.png', NULL, 'jilancollection', '2020-09-12 01:15:34', '0000-00-00 00:00:00'),
(450, 88, '', '', '1599851823.png', NULL, 'jilancollection', '2020-09-12 01:17:04', '0000-00-00 00:00:00'),
(451, 88, '', '', '1599851834_0.png', NULL, 'jilancollection', '2020-09-12 01:17:15', '0000-00-00 00:00:00'),
(452, 88, '', '', '1599851834_1.png', NULL, 'jilancollection', '2020-09-12 01:17:16', '0000-00-00 00:00:00'),
(453, 88, '', '', '1599851834_2.png', NULL, 'jilancollection', '2020-09-12 01:17:18', '0000-00-00 00:00:00'),
(454, 88, '', '', '1599851834_3.png', NULL, 'jilancollection', '2020-09-12 01:17:19', '0000-00-00 00:00:00'),
(455, 89, '', '', '1599851968.png', NULL, 'jilancollection', '2020-09-12 01:19:30', '0000-00-00 00:00:00'),
(456, 89, '', '', '1599851983_0.png', NULL, 'jilancollection', '2020-09-12 01:19:44', '0000-00-00 00:00:00'),
(457, 89, '', '', '1599851983_1.png', NULL, 'jilancollection', '2020-09-12 01:19:45', '0000-00-00 00:00:00'),
(458, 89, '', '', '1599851983_2.png', NULL, 'jilancollection', '2020-09-12 01:19:46', '0000-00-00 00:00:00'),
(459, 89, '', '', '1599851983_3.png', NULL, 'jilancollection', '2020-09-12 01:19:47', '0000-00-00 00:00:00'),
(460, 89, '', '', '1599851983_4.png', NULL, 'jilancollection', '2020-09-12 01:19:48', '0000-00-00 00:00:00'),
(461, 90, '', '', '1599852053.png', NULL, 'jilancollection', '2020-09-12 01:20:54', '0000-00-00 00:00:00'),
(462, 90, '', '', '1599852064_0.png', NULL, 'jilancollection', '2020-09-12 01:21:06', '0000-00-00 00:00:00'),
(463, 90, '', '', '1599852064_1.png', NULL, 'jilancollection', '2020-09-12 01:21:07', '0000-00-00 00:00:00'),
(464, 90, '', '', '1599852064_2.png', NULL, 'jilancollection', '2020-09-12 01:21:08', '0000-00-00 00:00:00'),
(465, 90, '', '', '1599852064_3.png', NULL, 'jilancollection', '2020-09-12 01:21:09', '0000-00-00 00:00:00'),
(466, 90, '', '', '1599852064_4.png', NULL, 'jilancollection', '2020-09-12 01:21:10', '0000-00-00 00:00:00'),
(467, 91, '', '', '1599852159.png', NULL, 'jilancollection', '2020-09-12 01:22:40', '0000-00-00 00:00:00'),
(468, 91, '', '', '1599852171_0.png', NULL, 'jilancollection', '2020-09-12 01:22:52', '0000-00-00 00:00:00'),
(469, 91, '', '', '1599852171_1.png', NULL, 'jilancollection', '2020-09-12 01:22:53', '0000-00-00 00:00:00'),
(470, 91, '', '', '1599852171_2.png', NULL, 'jilancollection', '2020-09-12 01:22:54', '0000-00-00 00:00:00'),
(471, 91, '', '', '1599852171_3.png', NULL, 'jilancollection', '2020-09-12 01:22:56', '0000-00-00 00:00:00'),
(472, 91, '', '', '1599852171_4.png', NULL, 'jilancollection', '2020-09-12 01:22:57', '0000-00-00 00:00:00'),
(473, 92, '', '', '1599852268.png', NULL, 'jilancollection', '2020-09-12 01:24:29', '0000-00-00 00:00:00'),
(474, 92, '', '', '1599852280_0.png', NULL, 'jilancollection', '2020-09-12 01:24:41', '0000-00-00 00:00:00'),
(475, 92, '', '', '1599852280_1.png', NULL, 'jilancollection', '2020-09-12 01:24:42', '0000-00-00 00:00:00'),
(476, 92, '', '', '1599852280_2.png', NULL, 'jilancollection', '2020-09-12 01:24:43', '0000-00-00 00:00:00'),
(477, 92, '', '', '1599852280_3.png', NULL, 'jilancollection', '2020-09-12 01:24:44', '0000-00-00 00:00:00'),
(478, 92, '', '', '1599852280_4.png', NULL, 'jilancollection', '2020-09-12 01:24:45', '0000-00-00 00:00:00'),
(479, 93, '', '', '1599852386.png', NULL, 'jilancollection', '2020-09-12 01:26:27', '0000-00-00 00:00:00'),
(480, 93, '', '', '1599852397_0.png', NULL, 'jilancollection', '2020-09-12 01:26:38', '0000-00-00 00:00:00'),
(481, 93, '', '', '1599852397_1.png', NULL, 'jilancollection', '2020-09-12 01:26:39', '0000-00-00 00:00:00'),
(482, 93, '', '', '1599852397_2.png', NULL, 'jilancollection', '2020-09-12 01:26:40', '0000-00-00 00:00:00'),
(483, 93, '', '', '1599852397_3.png', NULL, 'jilancollection', '2020-09-12 01:26:42', '0000-00-00 00:00:00'),
(484, 94, '', '', '1599852491.png', NULL, 'jilancollection', '2020-09-12 01:28:12', '0000-00-00 00:00:00'),
(485, 94, '', '', '1599852501_0.png', NULL, 'jilancollection', '2020-09-12 01:28:23', '0000-00-00 00:00:00'),
(486, 94, '', '', '1599852501_1.png', NULL, 'jilancollection', '2020-09-12 01:28:24', '0000-00-00 00:00:00'),
(487, 94, '', '', '1599852501_2.png', NULL, 'jilancollection', '2020-09-12 01:28:25', '0000-00-00 00:00:00'),
(488, 95, '', '', '1599852586.png', NULL, 'jilancollection', '2020-09-12 01:29:47', '0000-00-00 00:00:00'),
(489, 95, '', '', '1599852598_0.png', NULL, 'jilancollection', '2020-09-12 01:29:59', '0000-00-00 00:00:00'),
(490, 95, '', '', '1599852598_1.png', NULL, 'jilancollection', '2020-09-12 01:30:00', '0000-00-00 00:00:00'),
(491, 95, '', '', '1599852598_2.png', NULL, 'jilancollection', '2020-09-12 01:30:01', '0000-00-00 00:00:00'),
(492, 95, '', '', '1599852598_3.png', NULL, 'jilancollection', '2020-09-12 01:30:03', '0000-00-00 00:00:00'),
(493, 95, '', '', '1599852598_4.png', NULL, 'jilancollection', '2020-09-12 01:30:04', '0000-00-00 00:00:00'),
(494, 96, '', '', '1599852679.png', NULL, 'jilancollection', '2020-09-12 01:31:20', '0000-00-00 00:00:00'),
(495, 96, '', '', '1599852691_0.png', NULL, 'jilancollection', '2020-09-12 01:31:33', '0000-00-00 00:00:00'),
(496, 96, '', '', '1599852691_1.png', NULL, 'jilancollection', '2020-09-12 01:31:34', '0000-00-00 00:00:00'),
(497, 96, '', '', '1599852691_2.png', NULL, 'jilancollection', '2020-09-12 01:31:35', '0000-00-00 00:00:00'),
(498, 96, '', '', '1599852691_3.png', NULL, 'jilancollection', '2020-09-12 01:31:37', '0000-00-00 00:00:00'),
(499, 96, '', '', '1599852691_4.png', NULL, 'jilancollection', '2020-09-12 01:31:38', '0000-00-00 00:00:00'),
(500, 97, '', '', '1599852778.png', NULL, 'jilancollection', '2020-09-12 01:32:59', '0000-00-00 00:00:00'),
(501, 97, '', '', '1599852791_0.png', NULL, 'jilancollection', '2020-09-12 01:33:12', '0000-00-00 00:00:00'),
(502, 97, '', '', '1599852791_1.png', NULL, 'jilancollection', '2020-09-12 01:33:13', '0000-00-00 00:00:00'),
(503, 97, '', '', '1599852791_2.png', NULL, 'jilancollection', '2020-09-12 01:33:15', '0000-00-00 00:00:00'),
(504, 97, '', '', '1599852791_3.png', NULL, 'jilancollection', '2020-09-12 01:33:16', '0000-00-00 00:00:00'),
(505, 97, '', '', '1599852791_4.png', NULL, 'jilancollection', '2020-09-12 01:33:17', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `product_relation`
--

CREATE TABLE `product_relation` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `category_ids` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_relation`
--

INSERT INTO `product_relation` (`id`, `product_id`, `category_ids`, `created`, `modified`) VALUES
(1, 0, 33, '2020-08-21 01:38:28', '2020-08-20 19:38:28'),
(24, 6, 2, '2017-12-05 11:48:20', '2017-12-05 05:48:20'),
(25, 6, 1, '2017-12-05 11:48:20', '2017-12-05 05:48:20'),
(45, 8, 6, '2017-12-05 11:55:51', '2017-12-05 05:55:51'),
(46, 8, 1, '2017-12-05 11:55:51', '2017-12-05 05:55:51'),
(47, 9, 7, '2017-12-05 11:57:17', '2017-12-05 05:57:18'),
(48, 9, 6, '2017-12-05 11:57:18', '2017-12-05 05:57:18'),
(49, 9, 1, '2017-12-05 11:57:18', '2017-12-05 05:57:18'),
(50, 10, 8, '2017-12-05 11:58:15', '2017-12-05 05:58:15'),
(51, 10, 7, '2017-12-05 11:58:15', '2017-12-05 05:58:15'),
(52, 10, 6, '2017-12-05 11:58:15', '2017-12-05 05:58:15'),
(53, 10, 1, '2017-12-05 11:58:15', '2017-12-05 05:58:15'),
(54, 11, 11, '2017-12-05 12:00:46', '2017-12-05 06:00:46'),
(55, 11, 5, '2017-12-05 12:00:46', '2017-12-05 06:00:46'),
(56, 12, 12, '2017-12-05 12:02:10', '2017-12-05 06:02:10'),
(57, 12, 11, '2017-12-05 12:02:10', '2017-12-05 06:02:10'),
(58, 12, 5, '2017-12-05 12:02:10', '2017-12-05 06:02:10'),
(59, 13, 13, '2017-12-05 12:03:00', '2017-12-05 06:03:00'),
(60, 13, 12, '2017-12-05 12:03:00', '2017-12-05 06:03:00'),
(61, 13, 11, '2017-12-05 12:03:00', '2017-12-05 06:03:00'),
(62, 13, 5, '2017-12-05 12:03:00', '2017-12-05 06:03:00'),
(63, 14, 27, '2017-12-05 12:06:01', '2017-12-05 06:06:01'),
(64, 14, 26, '2017-12-05 12:06:01', '2017-12-05 06:06:01'),
(65, 14, 25, '2017-12-05 12:06:01', '2017-12-05 06:06:01'),
(66, 14, 5, '2017-12-05 12:06:01', '2017-12-05 06:06:01'),
(67, 15, 25, '2017-12-05 12:08:12', '2017-12-05 06:08:12'),
(68, 15, 5, '2017-12-05 12:08:12', '2017-12-05 06:08:12'),
(69, 16, 2, '2017-12-05 12:09:30', '2017-12-05 06:09:30'),
(70, 16, 1, '2017-12-05 12:09:30', '2017-12-05 06:09:30'),
(101, 17, 4, '2017-12-05 12:22:51', '2017-12-05 06:22:51'),
(102, 17, 3, '2017-12-05 12:22:51', '2017-12-05 06:22:51'),
(103, 17, 2, '2017-12-05 12:22:51', '2017-12-05 06:22:51'),
(104, 17, 1, '2017-12-05 12:22:51', '2017-12-05 06:22:51'),
(108, 19, 4, '2017-12-05 12:24:41', '2017-12-05 06:24:41'),
(109, 19, 3, '2017-12-05 12:24:41', '2017-12-05 06:24:41'),
(110, 19, 2, '2017-12-05 12:24:41', '2017-12-05 06:24:41'),
(111, 19, 1, '2017-12-05 12:24:41', '2017-12-05 06:24:41'),
(112, 20, 2, '2017-12-05 12:25:34', '2017-12-05 06:25:34'),
(113, 20, 1, '2017-12-05 12:25:34', '2017-12-05 06:25:34'),
(118, 22, 4, '2017-12-05 12:27:34', '2017-12-05 06:27:34'),
(119, 22, 3, '2017-12-05 12:27:34', '2017-12-05 06:27:34'),
(120, 22, 2, '2017-12-05 12:27:34', '2017-12-05 06:27:34'),
(121, 22, 1, '2017-12-05 12:27:34', '2017-12-05 06:27:34'),
(122, 23, 2, '2017-12-05 12:29:07', '2017-12-05 06:29:07'),
(123, 23, 1, '2017-12-05 12:29:07', '2017-12-05 06:29:07'),
(124, 24, 3, '2017-12-05 12:30:13', '2017-12-05 06:30:13'),
(125, 24, 2, '2017-12-05 12:30:13', '2017-12-05 06:30:13'),
(126, 24, 1, '2017-12-05 12:30:13', '2017-12-05 06:30:13'),
(127, 25, 11, '2017-12-05 12:32:20', '2017-12-05 06:32:20'),
(128, 25, 5, '2017-12-05 12:32:20', '2017-12-05 06:32:20'),
(129, 26, 12, '2017-12-05 12:34:32', '2017-12-05 06:34:32'),
(130, 26, 11, '2017-12-05 12:34:32', '2017-12-05 06:34:32'),
(131, 26, 5, '2017-12-05 12:34:32', '2017-12-05 06:34:32'),
(132, 27, 12, '2017-12-05 12:35:50', '2017-12-05 06:35:50'),
(133, 27, 11, '2017-12-05 12:35:50', '2017-12-05 06:35:50'),
(134, 27, 5, '2017-12-05 12:35:50', '2017-12-05 06:35:50'),
(135, 28, 12, '2017-12-05 12:39:56', '2017-12-05 06:39:56'),
(136, 28, 11, '2017-12-05 12:39:56', '2017-12-05 06:39:56'),
(137, 28, 5, '2017-12-05 12:39:56', '2017-12-05 06:39:56'),
(138, 29, 12, '2017-12-05 12:40:50', '2017-12-05 06:40:50'),
(139, 29, 11, '2017-12-05 12:40:50', '2017-12-05 06:40:50'),
(140, 29, 5, '2017-12-05 12:40:50', '2017-12-05 06:40:50'),
(141, 30, 27, '2017-12-05 12:43:04', '2017-12-05 06:43:04'),
(142, 30, 26, '2017-12-05 12:43:04', '2017-12-05 06:43:04'),
(143, 30, 25, '2017-12-05 12:43:04', '2017-12-05 06:43:04'),
(144, 30, 5, '2017-12-05 12:43:04', '2017-12-05 06:43:04'),
(149, 21, 4, '2017-12-05 12:45:02', '2017-12-05 06:45:02'),
(150, 21, 3, '2017-12-05 12:45:02', '2017-12-05 06:45:02'),
(151, 21, 2, '2017-12-05 12:45:02', '2017-12-05 06:45:02'),
(152, 21, 1, '2017-12-05 12:45:02', '2017-12-05 06:45:02'),
(153, 4, 2, '2017-12-06 17:08:31', '2017-12-06 11:08:31'),
(154, 4, 1, '2017-12-06 17:08:31', '2017-12-06 11:08:31'),
(155, 31, 3, '2017-12-20 16:51:07', '2017-12-20 10:51:07'),
(156, 31, 2, '2017-12-20 16:51:07', '2017-12-20 10:51:07'),
(157, 31, 1, '2017-12-20 16:51:07', '2017-12-20 10:51:07'),
(158, 32, 30, '2017-12-20 16:54:19', '2017-12-20 10:54:19'),
(159, 32, 3, '2017-12-20 16:54:20', '2017-12-20 10:54:20'),
(160, 32, 2, '2017-12-20 16:54:20', '2017-12-20 10:54:20'),
(161, 32, 1, '2017-12-20 16:54:20', '2017-12-20 10:54:20'),
(162, 33, 28, '2017-12-20 16:55:26', '2017-12-20 10:55:26'),
(163, 33, 3, '2017-12-20 16:55:26', '2017-12-20 10:55:26'),
(164, 33, 2, '2017-12-20 16:55:27', '2017-12-20 10:55:27'),
(165, 33, 1, '2017-12-20 16:55:27', '2017-12-20 10:55:27'),
(166, 34, 33, '2020-08-21 01:40:15', '2020-08-20 19:40:15'),
(167, 34, 28, '2020-08-21 01:40:15', '2020-08-20 19:40:15'),
(168, 34, 3, '2020-08-21 01:40:15', '2020-08-20 19:40:15'),
(169, 34, 2, '2020-08-21 01:40:15', '2020-08-20 19:40:15'),
(170, 34, 1, '2020-08-21 01:40:15', '2020-08-20 19:40:15'),
(171, 35, 33, '2020-08-21 01:41:31', '2020-08-20 19:41:31'),
(172, 35, 28, '2020-08-21 01:41:31', '2020-08-20 19:41:31'),
(173, 35, 3, '2020-08-21 01:41:31', '2020-08-20 19:41:31'),
(174, 35, 2, '2020-08-21 01:41:31', '2020-08-20 19:41:31'),
(175, 35, 1, '2020-08-21 01:41:31', '2020-08-20 19:41:31'),
(176, 36, 33, '2020-08-21 02:01:20', '2020-08-20 20:01:20'),
(177, 36, 28, '2020-08-21 02:01:20', '2020-08-20 20:01:20'),
(178, 36, 3, '2020-08-21 02:01:20', '2020-08-20 20:01:20'),
(179, 36, 2, '2020-08-21 02:01:20', '2020-08-20 20:01:20'),
(180, 36, 1, '2020-08-21 02:01:20', '2020-08-20 20:01:20'),
(181, 37, 33, '2020-08-21 02:02:31', '2020-08-20 20:02:31'),
(182, 37, 28, '2020-08-21 02:02:31', '2020-08-20 20:02:31'),
(183, 37, 3, '2020-08-21 02:02:31', '2020-08-20 20:02:31'),
(184, 37, 2, '2020-08-21 02:02:31', '2020-08-20 20:02:31'),
(185, 37, 1, '2020-08-21 02:02:31', '2020-08-20 20:02:31'),
(191, 38, 33, '2020-08-22 16:32:43', '2020-08-22 10:32:43'),
(192, 38, 28, '2020-08-22 16:32:43', '2020-08-22 10:32:43'),
(193, 38, 3, '2020-08-22 16:32:43', '2020-08-22 10:32:43'),
(194, 38, 2, '2020-08-22 16:32:43', '2020-08-22 10:32:43'),
(195, 38, 1, '2020-08-22 16:32:43', '2020-08-22 10:32:43'),
(248, 40, 56, '2020-09-11 21:14:42', '2020-09-11 15:14:42'),
(249, 40, 41, '2020-09-11 21:14:42', '2020-09-11 15:14:42'),
(250, 40, 6, '2020-09-11 21:14:42', '2020-09-11 15:14:42'),
(251, 40, 1, '2020-09-11 21:14:42', '2020-09-11 15:14:42'),
(284, 43, 57, '2020-09-11 21:37:14', '2020-09-11 15:37:14'),
(285, 43, 41, '2020-09-11 21:37:14', '2020-09-11 15:37:14'),
(286, 43, 6, '2020-09-11 21:37:14', '2020-09-11 15:37:14'),
(287, 43, 1, '2020-09-11 21:37:14', '2020-09-11 15:37:14'),
(288, 41, 58, '2020-09-11 21:41:02', '2020-09-11 15:41:02'),
(289, 41, 41, '2020-09-11 21:41:02', '2020-09-11 15:41:02'),
(290, 41, 6, '2020-09-11 21:41:02', '2020-09-11 15:41:02'),
(291, 41, 1, '2020-09-11 21:41:02', '2020-09-11 15:41:02'),
(296, 44, 59, '2020-09-11 21:43:54', '2020-09-11 15:43:54'),
(297, 44, 41, '2020-09-11 21:43:54', '2020-09-11 15:43:54'),
(298, 44, 6, '2020-09-11 21:43:54', '2020-09-11 15:43:54'),
(299, 44, 1, '2020-09-11 21:43:54', '2020-09-11 15:43:54'),
(304, 45, 60, '2020-09-11 21:46:24', '2020-09-11 15:46:24'),
(305, 45, 41, '2020-09-11 21:46:24', '2020-09-11 15:46:24'),
(306, 45, 6, '2020-09-11 21:46:24', '2020-09-11 15:46:24'),
(307, 45, 1, '2020-09-11 21:46:24', '2020-09-11 15:46:24'),
(312, 46, 61, '2020-09-11 21:48:12', '2020-09-11 15:48:12'),
(313, 46, 41, '2020-09-11 21:48:12', '2020-09-11 15:48:12'),
(314, 46, 6, '2020-09-11 21:48:12', '2020-09-11 15:48:12'),
(315, 46, 1, '2020-09-11 21:48:12', '2020-09-11 15:48:12'),
(320, 47, 62, '2020-09-11 21:50:54', '2020-09-11 15:50:54'),
(321, 47, 42, '2020-09-11 21:50:54', '2020-09-11 15:50:54'),
(322, 47, 6, '2020-09-11 21:50:54', '2020-09-11 15:50:54'),
(323, 47, 1, '2020-09-11 21:50:54', '2020-09-11 15:50:54'),
(328, 48, 63, '2020-09-11 21:52:49', '2020-09-11 15:52:49'),
(329, 48, 42, '2020-09-11 21:52:49', '2020-09-11 15:52:49'),
(330, 48, 6, '2020-09-11 21:52:49', '2020-09-11 15:52:49'),
(331, 48, 1, '2020-09-11 21:52:49', '2020-09-11 15:52:49'),
(336, 49, 64, '2020-09-11 21:54:35', '2020-09-11 15:54:35'),
(337, 49, 42, '2020-09-11 21:54:35', '2020-09-11 15:54:35'),
(338, 49, 6, '2020-09-11 21:54:35', '2020-09-11 15:54:35'),
(339, 49, 1, '2020-09-11 21:54:35', '2020-09-11 15:54:35'),
(344, 50, 65, '2020-09-11 21:56:09', '2020-09-11 15:56:09'),
(345, 50, 42, '2020-09-11 21:56:09', '2020-09-11 15:56:09'),
(346, 50, 6, '2020-09-11 21:56:09', '2020-09-11 15:56:09'),
(347, 50, 1, '2020-09-11 21:56:09', '2020-09-11 15:56:09'),
(352, 51, 67, '2020-09-11 21:59:19', '2020-09-11 15:59:19'),
(353, 51, 42, '2020-09-11 21:59:19', '2020-09-11 15:59:19'),
(354, 51, 6, '2020-09-11 21:59:19', '2020-09-11 15:59:19'),
(355, 51, 1, '2020-09-11 21:59:19', '2020-09-11 15:59:19'),
(360, 52, 68, '2020-09-11 22:01:21', '2020-09-11 16:01:21'),
(361, 52, 42, '2020-09-11 22:01:21', '2020-09-11 16:01:21'),
(362, 52, 6, '2020-09-11 22:01:21', '2020-09-11 16:01:21'),
(363, 52, 1, '2020-09-11 22:01:21', '2020-09-11 16:01:21'),
(368, 53, 69, '2020-09-11 22:03:09', '2020-09-11 16:03:09'),
(369, 53, 42, '2020-09-11 22:03:09', '2020-09-11 16:03:09'),
(370, 53, 6, '2020-09-11 22:03:09', '2020-09-11 16:03:09'),
(371, 53, 1, '2020-09-11 22:03:09', '2020-09-11 16:03:09'),
(393, 54, 43, '2020-09-11 23:49:42', '2020-09-11 17:49:42'),
(394, 54, 34, '2020-09-11 23:49:42', '2020-09-11 17:49:42'),
(395, 54, 1, '2020-09-11 23:49:42', '2020-09-11 17:49:42'),
(399, 55, 44, '2020-09-11 23:54:27', '2020-09-11 17:54:27'),
(400, 55, 34, '2020-09-11 23:54:27', '2020-09-11 17:54:27'),
(401, 55, 1, '2020-09-11 23:54:27', '2020-09-11 17:54:27'),
(405, 56, 45, '2020-09-11 23:56:12', '2020-09-11 17:56:12'),
(406, 56, 34, '2020-09-11 23:56:12', '2020-09-11 17:56:12'),
(407, 56, 1, '2020-09-11 23:56:12', '2020-09-11 17:56:12'),
(411, 57, 46, '2020-09-11 23:57:56', '2020-09-11 17:57:56'),
(412, 57, 34, '2020-09-11 23:57:56', '2020-09-11 17:57:56'),
(413, 57, 1, '2020-09-11 23:57:56', '2020-09-11 17:57:56'),
(417, 58, 47, '2020-09-11 23:59:59', '2020-09-11 17:59:59'),
(418, 58, 35, '2020-09-11 23:59:59', '2020-09-11 17:59:59'),
(419, 58, 1, '2020-09-11 23:59:59', '2020-09-11 17:59:59'),
(423, 59, 48, '2020-09-12 00:01:58', '2020-09-11 18:01:58'),
(424, 59, 35, '2020-09-12 00:01:58', '2020-09-11 18:01:58'),
(425, 59, 1, '2020-09-12 00:01:58', '2020-09-11 18:01:58'),
(429, 60, 49, '2020-09-12 00:05:09', '2020-09-11 18:05:09'),
(430, 60, 35, '2020-09-12 00:05:09', '2020-09-11 18:05:09'),
(431, 60, 1, '2020-09-12 00:05:09', '2020-09-11 18:05:09'),
(435, 61, 50, '2020-09-12 00:07:44', '2020-09-11 18:07:44'),
(436, 61, 35, '2020-09-12 00:07:44', '2020-09-11 18:07:44'),
(437, 61, 1, '2020-09-12 00:07:44', '2020-09-11 18:07:44'),
(441, 62, 51, '2020-09-12 00:09:31', '2020-09-11 18:09:31'),
(442, 62, 36, '2020-09-12 00:09:31', '2020-09-11 18:09:31'),
(443, 62, 1, '2020-09-12 00:09:31', '2020-09-11 18:09:31'),
(447, 63, 52, '2020-09-12 00:11:22', '2020-09-11 18:11:22'),
(448, 63, 36, '2020-09-12 00:11:22', '2020-09-11 18:11:22'),
(449, 63, 1, '2020-09-12 00:11:22', '2020-09-11 18:11:22'),
(453, 64, 53, '2020-09-12 00:13:09', '2020-09-11 18:13:09'),
(454, 64, 37, '2020-09-12 00:13:09', '2020-09-11 18:13:09'),
(455, 64, 1, '2020-09-12 00:13:09', '2020-09-11 18:13:09'),
(459, 65, 54, '2020-09-12 00:16:01', '2020-09-11 18:16:01'),
(460, 65, 37, '2020-09-12 00:16:01', '2020-09-11 18:16:01'),
(461, 65, 1, '2020-09-12 00:16:01', '2020-09-11 18:16:01'),
(465, 66, 55, '2020-09-12 00:18:03', '2020-09-11 18:18:03'),
(466, 66, 37, '2020-09-12 00:18:03', '2020-09-11 18:18:03'),
(467, 66, 1, '2020-09-12 00:18:03', '2020-09-11 18:18:03'),
(470, 67, 3, '2020-09-12 00:21:55', '2020-09-11 18:21:55'),
(471, 67, 2, '2020-09-12 00:21:55', '2020-09-11 18:21:55'),
(472, 67, 1, '2020-09-12 00:21:55', '2020-09-11 18:21:55'),
(473, 18, 3, '2020-09-12 00:23:31', '2020-09-11 18:23:31'),
(474, 18, 2, '2020-09-12 00:23:31', '2020-09-11 18:23:31'),
(475, 18, 1, '2020-09-12 00:23:31', '2020-09-11 18:23:31'),
(479, 68, 9, '2020-09-12 00:28:06', '2020-09-11 18:28:06'),
(480, 68, 2, '2020-09-12 00:28:06', '2020-09-11 18:28:06'),
(481, 68, 1, '2020-09-12 00:28:06', '2020-09-11 18:28:06'),
(486, 69, 93, '2020-09-12 00:34:18', '2020-09-11 18:34:18'),
(487, 69, 76, '2020-09-12 00:34:18', '2020-09-11 18:34:18'),
(488, 69, 25, '2020-09-12 00:34:18', '2020-09-11 18:34:18'),
(489, 69, 5, '2020-09-12 00:34:18', '2020-09-11 18:34:18'),
(494, 70, 94, '2020-09-12 00:36:06', '2020-09-11 18:36:06'),
(495, 70, 76, '2020-09-12 00:36:06', '2020-09-11 18:36:06'),
(496, 70, 25, '2020-09-12 00:36:06', '2020-09-11 18:36:06'),
(497, 70, 5, '2020-09-12 00:36:06', '2020-09-11 18:36:06'),
(502, 71, 95, '2020-09-12 00:39:45', '2020-09-11 18:39:45'),
(503, 71, 76, '2020-09-12 00:39:45', '2020-09-11 18:39:45'),
(504, 71, 25, '2020-09-12 00:39:45', '2020-09-11 18:39:45'),
(505, 71, 5, '2020-09-12 00:39:45', '2020-09-11 18:39:45'),
(510, 72, 96, '2020-09-12 00:41:54', '2020-09-11 18:41:54'),
(511, 72, 76, '2020-09-12 00:41:54', '2020-09-11 18:41:54'),
(512, 72, 25, '2020-09-12 00:41:54', '2020-09-11 18:41:54'),
(513, 72, 5, '2020-09-12 00:41:54', '2020-09-11 18:41:54'),
(518, 73, 97, '2020-09-12 00:45:31', '2020-09-11 18:45:31'),
(519, 73, 76, '2020-09-12 00:45:31', '2020-09-11 18:45:31'),
(520, 73, 25, '2020-09-12 00:45:31', '2020-09-11 18:45:31'),
(521, 73, 5, '2020-09-12 00:45:31', '2020-09-11 18:45:31'),
(526, 74, 98, '2020-09-12 00:47:37', '2020-09-11 18:47:37'),
(527, 74, 76, '2020-09-12 00:47:37', '2020-09-11 18:47:37'),
(528, 74, 25, '2020-09-12 00:47:37', '2020-09-11 18:47:37'),
(529, 74, 5, '2020-09-12 00:47:37', '2020-09-11 18:47:37'),
(534, 75, 99, '2020-09-12 00:50:02', '2020-09-11 18:50:02'),
(535, 75, 76, '2020-09-12 00:50:02', '2020-09-11 18:50:02'),
(536, 75, 25, '2020-09-12 00:50:02', '2020-09-11 18:50:02'),
(537, 75, 5, '2020-09-12 00:50:02', '2020-09-11 18:50:02'),
(542, 76, 101, '2020-09-12 00:53:18', '2020-09-11 18:53:18'),
(543, 76, 76, '2020-09-12 00:53:18', '2020-09-11 18:53:18'),
(544, 76, 25, '2020-09-12 00:53:18', '2020-09-11 18:53:18'),
(545, 76, 5, '2020-09-12 00:53:18', '2020-09-11 18:53:18'),
(550, 77, 102, '2020-09-12 00:55:16', '2020-09-11 18:55:16'),
(551, 77, 76, '2020-09-12 00:55:16', '2020-09-11 18:55:16'),
(552, 77, 25, '2020-09-12 00:55:16', '2020-09-11 18:55:16'),
(553, 77, 5, '2020-09-12 00:55:16', '2020-09-11 18:55:16'),
(558, 78, 103, '2020-09-12 00:57:12', '2020-09-11 18:57:12'),
(559, 78, 76, '2020-09-12 00:57:12', '2020-09-11 18:57:12'),
(560, 78, 25, '2020-09-12 00:57:12', '2020-09-11 18:57:12'),
(561, 78, 5, '2020-09-12 00:57:12', '2020-09-11 18:57:12'),
(566, 79, 104, '2020-09-12 00:59:19', '2020-09-11 18:59:19'),
(567, 79, 77, '2020-09-12 00:59:19', '2020-09-11 18:59:19'),
(568, 79, 25, '2020-09-12 00:59:19', '2020-09-11 18:59:19'),
(569, 79, 5, '2020-09-12 00:59:19', '2020-09-11 18:59:19'),
(574, 80, 105, '2020-09-12 01:01:23', '2020-09-11 19:01:23'),
(575, 80, 77, '2020-09-12 01:01:23', '2020-09-11 19:01:23'),
(576, 80, 25, '2020-09-12 01:01:23', '2020-09-11 19:01:23'),
(577, 80, 5, '2020-09-12 01:01:23', '2020-09-11 19:01:23'),
(582, 81, 106, '2020-09-12 01:04:02', '2020-09-11 19:04:02'),
(583, 81, 77, '2020-09-12 01:04:02', '2020-09-11 19:04:02'),
(584, 81, 25, '2020-09-12 01:04:02', '2020-09-11 19:04:02'),
(585, 81, 5, '2020-09-12 01:04:02', '2020-09-11 19:04:02'),
(594, 82, 108, '2020-09-12 01:06:43', '2020-09-11 19:06:43'),
(595, 82, 77, '2020-09-12 01:06:43', '2020-09-11 19:06:43'),
(596, 82, 25, '2020-09-12 01:06:43', '2020-09-11 19:06:43'),
(597, 82, 5, '2020-09-12 01:06:43', '2020-09-11 19:06:43'),
(602, 83, 109, '2020-09-12 01:08:45', '2020-09-11 19:08:45'),
(603, 83, 77, '2020-09-12 01:08:45', '2020-09-11 19:08:45'),
(604, 83, 25, '2020-09-12 01:08:45', '2020-09-11 19:08:45'),
(605, 83, 5, '2020-09-12 01:08:45', '2020-09-11 19:08:45'),
(610, 84, 110, '2020-09-12 01:10:25', '2020-09-11 19:10:25'),
(611, 84, 77, '2020-09-12 01:10:25', '2020-09-11 19:10:25'),
(612, 84, 25, '2020-09-12 01:10:25', '2020-09-11 19:10:25'),
(613, 84, 5, '2020-09-12 01:10:25', '2020-09-11 19:10:25'),
(617, 85, 78, '2020-09-12 01:12:11', '2020-09-11 19:12:11'),
(618, 85, 70, '2020-09-12 01:12:11', '2020-09-11 19:12:11'),
(619, 85, 5, '2020-09-12 01:12:11', '2020-09-11 19:12:11'),
(623, 86, 79, '2020-09-12 01:14:00', '2020-09-11 19:14:00'),
(624, 86, 70, '2020-09-12 01:14:00', '2020-09-11 19:14:00'),
(625, 86, 5, '2020-09-12 01:14:00', '2020-09-11 19:14:00'),
(629, 87, 80, '2020-09-12 01:15:34', '2020-09-11 19:15:34'),
(630, 87, 70, '2020-09-12 01:15:34', '2020-09-11 19:15:34'),
(631, 87, 5, '2020-09-12 01:15:34', '2020-09-11 19:15:34'),
(635, 88, 81, '2020-09-12 01:17:19', '2020-09-11 19:17:19'),
(636, 88, 70, '2020-09-12 01:17:19', '2020-09-11 19:17:19'),
(637, 88, 5, '2020-09-12 01:17:19', '2020-09-11 19:17:19'),
(641, 89, 82, '2020-09-12 01:19:48', '2020-09-11 19:19:48'),
(642, 89, 71, '2020-09-12 01:19:48', '2020-09-11 19:19:48'),
(643, 89, 5, '2020-09-12 01:19:48', '2020-09-11 19:19:48'),
(647, 90, 83, '2020-09-12 01:21:10', '2020-09-11 19:21:10'),
(648, 90, 71, '2020-09-12 01:21:10', '2020-09-11 19:21:10'),
(649, 90, 5, '2020-09-12 01:21:10', '2020-09-11 19:21:10'),
(653, 91, 84, '2020-09-12 01:22:57', '2020-09-11 19:22:57'),
(654, 91, 71, '2020-09-12 01:22:57', '2020-09-11 19:22:57'),
(655, 91, 5, '2020-09-12 01:22:57', '2020-09-11 19:22:57'),
(659, 92, 85, '2020-09-12 01:24:45', '2020-09-11 19:24:45'),
(660, 92, 71, '2020-09-12 01:24:45', '2020-09-11 19:24:45'),
(661, 92, 5, '2020-09-12 01:24:45', '2020-09-11 19:24:45'),
(665, 93, 86, '2020-09-12 01:26:42', '2020-09-11 19:26:42'),
(666, 93, 72, '2020-09-12 01:26:42', '2020-09-11 19:26:42'),
(667, 93, 5, '2020-09-12 01:26:42', '2020-09-11 19:26:42'),
(671, 94, 87, '2020-09-12 01:28:25', '2020-09-11 19:28:25'),
(672, 94, 72, '2020-09-12 01:28:25', '2020-09-11 19:28:25'),
(673, 94, 5, '2020-09-12 01:28:25', '2020-09-11 19:28:25'),
(677, 95, 88, '2020-09-12 01:30:04', '2020-09-11 19:30:04'),
(678, 95, 73, '2020-09-12 01:30:04', '2020-09-11 19:30:04'),
(679, 95, 5, '2020-09-12 01:30:04', '2020-09-11 19:30:04'),
(683, 96, 89, '2020-09-12 01:31:38', '2020-09-11 19:31:38'),
(684, 96, 73, '2020-09-12 01:31:38', '2020-09-11 19:31:38'),
(685, 96, 5, '2020-09-12 01:31:38', '2020-09-11 19:31:38'),
(689, 97, 90, '2020-09-12 01:33:17', '2020-09-11 19:33:17'),
(690, 97, 73, '2020-09-12 01:33:17', '2020-09-11 19:33:17'),
(691, 97, 5, '2020-09-12 01:33:17', '2020-09-11 19:33:17');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `level_id` int(11) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` char(32) NOT NULL,
  `secret` char(64) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `photo` varchar(30) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `lastlogin_ip` varchar(20) NOT NULL,
  `lastlogin_date` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `level_id`, `user_name`, `email`, `password`, `secret`, `first_name`, `last_name`, `photo`, `phone`, `create_date`, `modified_date`, `lastlogin_ip`, `lastlogin_date`, `status`) VALUES
(1, 2, 'admin', 'admin@gmail.com', '12067b026346c847c73a760d39859188', '631408', 'Site', 'Admin', '1570155061.jpg', '', '2013-11-22 18:53:13', '2020-09-11 15:08:37', '0', 1599836917, 1);

-- --------------------------------------------------------

--
-- Table structure for table `_users`
--

CREATE TABLE `_users` (
  `user_id` int(11) NOT NULL,
  `level_id` int(11) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` char(32) NOT NULL,
  `secret` char(64) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `photo` varchar(30) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `lastlogin_ip` varchar(20) NOT NULL,
  `lastlogin_date` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `_users`
--

INSERT INTO `_users` (`user_id`, `level_id`, `user_name`, `email`, `password`, `secret`, `first_name`, `last_name`, `photo`, `phone`, `create_date`, `modified_date`, `lastlogin_ip`, `lastlogin_date`, `status`) VALUES
(1, 2, 'admin', 'admin@gmail.com', '12067b026346c847c73a760d39859188', '631408', 'Site', 'Admin', '1510219013.png', '', '2013-11-22 18:53:13', '2018-11-25 08:36:34', '3232248373', 1543134994, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`activities_id`);

--
-- Indexes for table `activities_category`
--
ALTER TABLE `activities_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `activities_relation`
--
ALTER TABLE `activities_relation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `entertainment`
--
ALTER TABLE `entertainment`
  ADD PRIMARY KEY (`entertainment_id`);

--
-- Indexes for table `entertainment_category`
--
ALTER TABLE `entertainment_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `entertainment_relation`
--
ALTER TABLE `entertainment_relation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jilancollection`
--
ALTER TABLE `jilancollection`
  ADD PRIMARY KEY (`jilancollection_id`);

--
-- Indexes for table `jilancollection_category`
--
ALTER TABLE `jilancollection_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jilanmedia`
--
ALTER TABLE `jilanmedia`
  ADD PRIMARY KEY (`jilanmedia_id`);

--
-- Indexes for table `jilanmedia_category`
--
ALTER TABLE `jilanmedia_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jilanmedia_relation`
--
ALTER TABLE `jilanmedia_relation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_relation`
--
ALTER TABLE `product_relation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `level_id` (`level_id`),
  ADD KEY `level_id_2` (`level_id`);

--
-- Indexes for table `_users`
--
ALTER TABLE `_users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `level_id` (`level_id`),
  ADD KEY `level_id_2` (`level_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activities`
--
ALTER TABLE `activities`
  MODIFY `activities_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `activities_category`
--
ALTER TABLE `activities_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `activities_relation`
--
ALTER TABLE `activities_relation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `jilancollection`
--
ALTER TABLE `jilancollection`
  MODIFY `jilancollection_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `jilancollection_category`
--
ALTER TABLE `jilancollection_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `jilanmedia`
--
ALTER TABLE `jilanmedia`
  MODIFY `jilanmedia_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `jilanmedia_category`
--
ALTER TABLE `jilanmedia_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `jilanmedia_relation`
--
ALTER TABLE `jilanmedia_relation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=506;

--
-- AUTO_INCREMENT for table `product_relation`
--
ALTER TABLE `product_relation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=692;

--
-- AUTO_INCREMENT for table `_users`
--
ALTER TABLE `_users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
