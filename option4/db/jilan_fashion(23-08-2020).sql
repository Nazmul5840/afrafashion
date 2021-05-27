-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 22, 2020 at 08:57 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jilan_fashion_old`
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
  `description` text,
  `status` tinyint(1) DEFAULT '1',
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `activities`
--

INSERT INTO `activities` (`activities_id`, `category_id`, `title`, `video_name`, `youtube_url`, `description`, `status`, `created`, `modified`) VALUES
(4, 3, 'Exhibition', '1513940919.mp4', 'https://www.youtube.com/watch?v=oxFSpzs8lMA', NULL, 1, '2017-12-22 16:22:32', '2017-12-22 16:08:39'),
(5, 1, 'pres', NULL, 'https://www.youtube.com/watch?v=oxFSpzs8lMA', NULL, 1, '2017-12-22 16:44:51', '2017-12-22 15:44:51'),
(6, 4, 'Exihibition 2011', NULL, '', NULL, 1, '2017-12-22 17:22:00', '2017-12-22 16:26:18'),
(7, 9, 'Fashion Show 2011', '1513942020.mp4', 'https://www.youtube.com/watch?v=oxFSpzs8lMA', NULL, 1, '2017-12-22 17:27:00', '2017-12-22 16:27:00'),
(8, 18, 'Fashion Show Images', NULL, '', NULL, 1, '2020-08-22 19:01:51', '2020-08-22 13:01:51'),
(9, 19, 'Fashion show video', NULL, 'https://www.youtube.com/watch?v=YC3ZDWRF7B4', NULL, 1, '2020-08-22 19:03:04', '2020-08-22 13:03:04');

-- --------------------------------------------------------

--
-- Table structure for table `activities_category`
--

CREATE TABLE `activities_category` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `category_name` varchar(64) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
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
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
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
(17, 8, 18, '2020-08-22 19:01:51', '2020-08-22 13:01:51'),
(18, 8, 9, '2020-08-22 19:01:51', '2020-08-22 13:01:51'),
(19, 9, 19, '2020-08-22 19:03:04', '2020-08-22 13:03:04'),
(20, 9, 9, '2020-08-22 19:03:04', '2020-08-22 13:03:04');

-- --------------------------------------------------------

--
-- Table structure for table `entertainment`
--

CREATE TABLE `entertainment` (
  `entertainment_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `title` varchar(512) NOT NULL,
  `description` text,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
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
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
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
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
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
  `description` text,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `jilancollection`
--

INSERT INTO `jilancollection` (`jilancollection_id`, `category_id`, `title`, `description`, `status`, `created`, `modified`) VALUES
(4, 2, 'Men\'s Summer', NULL, 1, '2017-12-05 11:42:31', '2017-12-05 05:42:31'),
(5, 3, 'Mens Dress', NULL, 1, '2017-12-05 11:43:04', '2017-12-05 05:44:21'),
(6, 2, 'Summer Mens', NULL, 1, '2017-12-05 11:48:20', '2017-12-05 05:48:20'),
(8, 6, 'Mens Winter', NULL, 1, '2017-12-05 11:55:51', '2017-12-05 05:55:51'),
(9, 7, 'Dress Winter', NULL, 1, '2017-12-05 11:57:17', '2017-12-05 05:57:17'),
(10, 8, 'Jacket Mens', NULL, 1, '2017-12-05 11:58:15', '2017-12-05 05:58:15'),
(11, 11, 'Womens Summer', NULL, 1, '2017-12-05 12:00:46', '2017-12-05 06:00:46'),
(12, 12, 'Dress Womens', NULL, 1, '2017-12-05 12:02:10', '2017-12-05 06:02:10'),
(13, 13, 'Shirt Womens', NULL, 1, '2017-12-05 12:03:00', '2017-12-05 06:03:00'),
(14, 27, 'Winter Salwar', NULL, 1, '2017-12-05 12:06:01', '2017-12-05 06:06:01'),
(15, 25, 'Womens Winter', NULL, 1, '2017-12-05 12:08:12', '2017-12-05 06:08:12'),
(16, 2, 'Mens Summ', NULL, 1, '2017-12-05 12:09:30', '2017-12-05 06:09:30'),
(17, 4, 'Shirt mens', NULL, 1, '2017-12-05 12:22:51', '2017-12-05 06:22:51'),
(18, 3, 'Dress Mens', NULL, 1, '2017-12-05 12:23:40', '2017-12-05 06:23:40'),
(19, 4, 'Shirt Mens', NULL, 1, '2017-12-05 12:24:41', '2017-12-05 06:24:41'),
(20, 2, 'Summer Mens', NULL, 1, '2017-12-05 12:25:34', '2017-12-05 06:25:34'),
(21, 4, 'Shirt Mens', NULL, 1, '2017-12-05 12:26:29', '2017-12-05 06:26:29'),
(22, 4, 'Shirt Summer', NULL, 1, '2017-12-05 12:27:34', '2017-12-05 06:27:34'),
(23, 2, 'Summ', NULL, 1, '2017-12-05 12:29:07', '2017-12-05 06:29:07'),
(24, 3, 'Dress Summ', NULL, 1, '2017-12-05 12:30:13', '2017-12-05 06:30:13'),
(25, 11, 'Summer Womens', NULL, 1, '2017-12-05 12:32:20', '2017-12-05 06:32:20'),
(26, 12, 'Shirt W', NULL, 1, '2017-12-05 12:34:32', '2017-12-05 06:34:32'),
(27, 12, 'Dress', NULL, 1, '2017-12-05 12:35:50', '2017-12-05 06:35:50'),
(28, 12, 'Dress W', NULL, 1, '2017-12-05 12:39:56', '2017-12-05 06:39:56'),
(29, 12, 'Dress W Summ', NULL, 1, '2017-12-05 12:40:50', '2017-12-05 06:40:50'),
(30, 27, 'Sal W', NULL, 1, '2017-12-05 12:43:04', '2017-12-05 06:43:04'),
(31, 3, 'Shirt', NULL, 1, '2017-12-20 16:51:07', '2017-12-20 10:51:07'),
(32, 30, 'a', NULL, 1, '2017-12-20 16:54:19', '2017-12-20 10:54:19'),
(33, 28, 'asa', NULL, 1, '2017-12-20 16:55:26', '2017-12-20 10:55:26'),
(35, 33, 'pant two product', NULL, 1, '2020-08-21 01:41:31', '2020-08-20 19:41:31'),
(36, 33, 'pant tow product tow', NULL, 1, '2020-08-21 02:01:20', '2020-08-20 20:01:20'),
(37, 33, '-- pant two two', NULL, 1, '2020-08-21 02:02:31', '2020-08-20 20:02:31'),
(38, 33, 'Pant-tow product', NULL, 1, '2020-08-22 16:16:36', '2020-08-22 10:16:36');

-- --------------------------------------------------------

--
-- Table structure for table `jilancollection_category`
--

CREATE TABLE `jilancollection_category` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `category_name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
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
  `description` text,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `jilanmedia`
--

INSERT INTO `jilanmedia` (`jilanmedia_id`, `category_id`, `title`, `description`, `status`, `created`, `modified`) VALUES
(3, 2, 'sadfsfg', NULL, 1, '2017-12-21 11:51:55', '2017-12-21 10:51:55'),
(5, 9, 'wetstyed', NULL, 1, '2017-12-21 11:55:17', '2017-12-21 10:55:17'),
(6, 4, 'Models', NULL, 1, '2017-12-21 11:58:33', '2017-12-21 10:58:33'),
(7, 9, 'awf', NULL, 1, '2017-12-21 11:59:23', '2017-12-21 10:59:23'),
(8, 5, 'Photographars', NULL, 1, '2017-12-21 12:02:35', '2017-12-21 11:02:35'),
(9, 18, 'Fashion Designer Image', NULL, 1, '2020-08-22 19:40:18', '2020-08-22 13:40:18');

-- --------------------------------------------------------

--
-- Table structure for table `jilanmedia_category`
--

CREATE TABLE `jilanmedia_category` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `category_name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jilanmedia_category`
--

INSERT INTO `jilanmedia_category` (`id`, `parent_id`, `category_name`, `status`, `created`, `modified`) VALUES
(1, 11, 'Video', 1, '2020-08-22 19:19:12', '0000-00-00 00:00:00'),
(2, 0, 'Celebrities', 1, '2017-11-07 12:25:51', '0000-00-00 00:00:00'),
(3, 0, 'TV Channel', 1, '2017-11-07 12:26:01', '2020-08-22 13:18:34'),
(4, 0, 'Fashion Personalities', 1, '2017-11-07 12:26:10', '2020-08-22 13:16:32'),
(5, 0, 'Media Personalities', 1, '2017-11-07 12:26:18', '2020-08-22 13:17:03'),
(10, 0, 'Newspaper & Magazine', 1, '2017-12-05 10:46:31', '2020-08-22 13:17:41'),
(11, 3, 'GTV', 1, '2017-12-21 11:23:49', '2020-08-22 13:19:01'),
(12, 10, 'The Independent', 1, '2020-08-22 19:27:25', '0000-00-00 00:00:00'),
(13, 4, 'Fashion Designer', 1, '2020-08-22 19:30:07', '0000-00-00 00:00:00'),
(14, 4, 'Models', 1, '2020-08-22 19:30:21', '0000-00-00 00:00:00'),
(15, 4, 'Photographer', 1, '2020-08-22 19:30:36', '0000-00-00 00:00:00'),
(16, 4, 'Chcreographer', 1, '2020-08-22 19:30:51', '0000-00-00 00:00:00'),
(17, 4, 'Makeup artist', 1, '2020-08-22 19:31:05', '0000-00-00 00:00:00'),
(18, 13, 'Image', 1, '2020-08-22 19:31:21', '0000-00-00 00:00:00'),
(19, 14, 'Image', 1, '2020-08-22 19:31:40', '0000-00-00 00:00:00'),
(20, 15, 'Image', 1, '2020-08-22 19:31:55', '0000-00-00 00:00:00'),
(21, 16, 'Image', 1, '2020-08-22 19:32:01', '0000-00-00 00:00:00'),
(22, 17, 'Image', 1, '2020-08-22 19:32:09', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `jilanmedia_relation`
--

CREATE TABLE `jilanmedia_relation` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `category_ids` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jilanmedia_relation`
--

INSERT INTO `jilanmedia_relation` (`id`, `product_id`, `category_ids`, `created`, `modified`) VALUES
(8, 3, 2, '2017-12-21 11:56:11', '2017-12-21 10:56:11'),
(9, 6, 4, '2017-12-21 11:58:33', '2017-12-21 10:58:33'),
(10, 7, 9, '2017-12-21 11:59:23', '2017-12-21 10:59:23'),
(11, 7, 2, '2017-12-21 11:59:23', '2017-12-21 10:59:23'),
(13, 8, 5, '2017-12-21 12:02:55', '2017-12-21 11:02:55'),
(14, 5, 9, '2017-12-21 12:42:27', '2017-12-21 11:42:27'),
(15, 5, 2, '2017-12-21 12:42:27', '2017-12-21 11:42:27'),
(16, 9, 18, '2020-08-22 19:40:18', '2020-08-22 13:40:18'),
(17, 9, 13, '2020-08-22 19:40:18', '2020-08-22 13:40:18');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` int(11) NOT NULL,
  `typeid` int(11) NOT NULL,
  `title` text,
  `image_details` text,
  `images` varchar(64) NOT NULL,
  `show_home` int(11) DEFAULT NULL,
  `type` varchar(64) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
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
(40, 5, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"', '1512454787_0.jpg', NULL, 'jilancollection', '2017-12-05 12:19:48', '0000-00-00 00:00:00'),
(41, 17, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"', '1512454971.jpg', NULL, 'jilancollection', '2017-12-05 12:22:52', '0000-00-00 00:00:00'),
(42, 18, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"', '1512455020.JPG', NULL, 'jilancollection', '2017-12-05 12:23:41', '0000-00-00 00:00:00'),
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
(119, 3, 'qwrfewyt', 'sgshgyryth', '1513835770_0.jpg', NULL, 'jilanmedia', '2017-12-21 11:56:11', '0000-00-00 00:00:00'),
(120, 5, 'sgsgsg', 'sgsgsetgedhyurtuydjndju', '1513835717_2.png', NULL, 'jilanmedia', '2017-12-21 11:55:19', '0000-00-00 00:00:00'),
(121, 5, 'afsaf', 'afasfgwedhndfjhfjfiji', '1513835717_0.jpg', NULL, 'jilanmedia', '2017-12-21 11:55:17', '0000-00-00 00:00:00'),
(122, 3, 'afa', 'afa', '1513835515_2.jpg', NULL, 'jilanmedia', '2017-12-21 11:51:57', '0000-00-00 00:00:00'),
(123, 3, 'safs', 'afsa', '1513835515_0.jpg', NULL, 'jilanmedia', '2017-12-21 11:51:55', '0000-00-00 00:00:00'),
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
(140, 8, 'this is fashion show image', 'this is fashion show image details', '1598101311_0.jpg', NULL, 'activities', '2020-08-22 19:01:51', '0000-00-00 00:00:00'),
(141, 9, 'image caption ', 'details caption', '1598103618_0.jpg', NULL, 'jilanmedia', '2020-08-22 19:40:18', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `product_relation`
--

CREATE TABLE `product_relation` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `category_ids` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
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
(98, 5, 3, '2017-12-05 12:19:48', '2017-12-05 06:19:48'),
(99, 5, 2, '2017-12-05 12:19:48', '2017-12-05 06:19:48'),
(100, 5, 1, '2017-12-05 12:19:48', '2017-12-05 06:19:48'),
(101, 17, 4, '2017-12-05 12:22:51', '2017-12-05 06:22:51'),
(102, 17, 3, '2017-12-05 12:22:51', '2017-12-05 06:22:51'),
(103, 17, 2, '2017-12-05 12:22:51', '2017-12-05 06:22:51'),
(104, 17, 1, '2017-12-05 12:22:51', '2017-12-05 06:22:51'),
(105, 18, 3, '2017-12-05 12:23:40', '2017-12-05 06:23:40'),
(106, 18, 2, '2017-12-05 12:23:40', '2017-12-05 06:23:40'),
(107, 18, 1, '2017-12-05 12:23:40', '2017-12-05 06:23:40'),
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
(195, 38, 1, '2020-08-22 16:32:43', '2020-08-22 10:32:43');

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
  `modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `lastlogin_ip` varchar(20) NOT NULL,
  `lastlogin_date` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `level_id`, `user_name`, `email`, `password`, `secret`, `first_name`, `last_name`, `photo`, `phone`, `create_date`, `modified_date`, `lastlogin_ip`, `lastlogin_date`, `status`) VALUES
(1, 2, 'admin', 'admin@gmail.com', '12067b026346c847c73a760d39859188', '631408', 'Site', 'Admin', '1570155061.jpg', '', '2013-11-22 18:53:13', '2020-08-22 09:39:07', '0', 1598089147, 1);

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
  `modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `lastlogin_ip` varchar(20) NOT NULL,
  `lastlogin_date` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
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
  MODIFY `activities_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `activities_category`
--
ALTER TABLE `activities_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `activities_relation`
--
ALTER TABLE `activities_relation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `jilancollection`
--
ALTER TABLE `jilancollection`
  MODIFY `jilancollection_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `jilancollection_category`
--
ALTER TABLE `jilancollection_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `jilanmedia`
--
ALTER TABLE `jilanmedia`
  MODIFY `jilanmedia_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `jilanmedia_category`
--
ALTER TABLE `jilanmedia_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `jilanmedia_relation`
--
ALTER TABLE `jilanmedia_relation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT for table `product_relation`
--
ALTER TABLE `product_relation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=196;

--
-- AUTO_INCREMENT for table `_users`
--
ALTER TABLE `_users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
