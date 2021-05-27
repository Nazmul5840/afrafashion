-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 03, 2021 at 03:26 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dionescollection_fashion`
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
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `summary` text NOT NULL,
  `description` text NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `title`, `summary`, `description`, `created`, `modified`) VALUES
(1, 'THE COLOR CONSUMING MY FALL WISHLIST', 'This season I can not get enough of all the beautiful hues of brown. ! From pretty mocha-colored nail polish to brown leather coats and outerwear, I even found the prettiest Converse in this tan color (more sizes here).', '1. BROWN CARDIGAN COAT (HOW AMAZING IS THIS COLOR?!) | 2. GREY FLANNEL HAT (UNDER $100 – COMES IN 9 COLORS) | 3. TAN CONVERSE (ON SALE 30% OFF – MORE SIZES HERE) | 4. BACKLESS WHITE SWEATER (UNDER $100) | 5. RIBBED SWEATSHIRT AND JOGGERS | 6. QUILTED FAUX LEATHER JACKET | 7. TAN BACKLESS SWEATER (ON SALE UNDER $25) | 8. BROWN HIKING BOOTS | 9. BRAMI (UNDER $25 – COMES IN 14 COLORS) | 10. HIGH-WAISTED DENIM (ON SALE UNDER $100) | 11. PLAID BLAZER (UNDER $100) | 12. RIBBED BUTTON UP CARDIGAN (UNDER $100) | 13. BURGUNDY BEANIE (UNDER $25 – COMES IN 4 COLORS) | 14. WOOL BUTTON UP SHIRT (JUST ORDERED!)\r\n\r\nThis season I can not get enough of all the beautiful hues of brown. ! From pretty mocha-colored nail polish to brown leather coats and outerwear, I even found the prettiest Converse in this tan color (more sizes here). Here are a few of the best brown pieces from my fall wishlist (and a few I’ve already checked off since – they didn’t last in my cart very long haha).\r\n\r\nI had my eyes on this cardigan all last fall/winter and could never snag it in my size – now I’m kind of glad I waited because this season’s new shade of brown is soooo good! I also just ordered this faux leather quilted coat – the quilted leather look is everything right now. The rich brown in the faux leather is stunning. I also ordered this pretty wool shirt-jacket – I’d been wanting a pretty tan/nude button up and this one will be so cozy. These tan Converse are another favorite find – the tan color makes them look really high-end so I couldn’t believe they were on sale 30% off.\r\n\r\nBelow a few more pieces on my fall wardrobe wishlist:', '2020-10-01 23:06:22', '2020-10-11 11:25:45'),
(2, '6 EASY WAYS TO FEEL MORE CONFIDENT', 'GOLD SMALL CHAIN NECKLACE | GOLD T-BAR CHAIN NECKLACE | GOLD BRACELET | GOLD CHAIN BRACELET | RUFFLED TANK | DENIM | LIPSTICK: HONEST MULBERRY KISS – NO LONGER SOLD | BLACK HANDBAG', 'Confidence comes in waves, but it’s something I think is contagious. When you are around the right type of confident people they usually are lifting others up and their energy is contagious. When you think of a confident woman in your life who’s the first person who pops in your head? \r\n\r\nIt’s something I am always trying to work on, some days it comes naturally and other days I’m giving myself  a pep talk. We all know the days when we are our own worst critics, and sometimes it’s hard to get out of that funk, but here are 6 easy things I do when I’m having an off day to try and switch my mood and confidence. \r\n\r\nStop The Negative Talk. I was actually reading a recent study and it said POSITIVE self talk is the greatest predictor of success. The study showed that people didn’t need to be reminded how to do something as much as they needed to tell themselves they are doing something great. We are all guilty of it from time to time, but stop yourself next time you catch yourself saying something negative, walk to a mirror and say 3 positive things about yourself. \r\nServe others. If I’m having an off day, I always ask myself, what have I done to help someone else today or this week? And usually I haven’t! So whether it’s helping someone, encouraging someone else’s dream, writing an email to someone you look up to or admire, step outside of yourself and look at ways to help others. \r\nJewelry. And I’m not just talking your go-to pair of earrings. Go big! I love layering lots of pendants and chains to make even the simplest outfits more beautiful. I wish I had taken a before pic, but think about it – jeans and a tank is effortless and easy, but layer on some beautiful high-quality jewelry and it instantly feels more elevated. You guys know how obsessed I am with Missoma – they are my number one jewelry brand. All their pieces are such amazing quality. I just got these pieces from their new collection. I honestly can’t recommend this brand enough. I always have at least one of their pieces on. And when you have your beautiful necklaces on, it draws attention to your shoulders and neckline (which I cover in point 5). So if your posture is on check, your confidence is shining. \r\nA bold lip. I always feel more confident when I have a bright or moody bold lip on, and my eyes are always drawn when I see other women out sporting their beautiful bold colors. So excited for fall to be able to pull out some moodier shades!\r\nCheck your posture. Even if it’s as simple as looking more people in the eyes. How often are we all hunched over our phones walking around. Put the phone down, straighten your shoulder, raise your head and look people in the eyes. \r\nWear matching underwear. Ok ladies can you relate to this?? I’ll be honest it is a miracle if I can find two socks that match, but when I put on a matching bra and underwear set, I feel more confident.', '2020-10-03 19:08:24', '2020-10-11 11:27:59'),
(3, 'IF I COULD ONLY OWN 1 WORKOUT SNEAKER, THIS WOULD BE IT', 'DETAILS: WHITE ADIDAS ULTRABOOSTS | GREY STRIPED ADIDAS HOODIE (WEARING SIZE M) | GREY ADIDAS JOGGERS (WEARING SIZE S)', 'Over the years my sneaker collection has gradually overtaken my heel collection. My favorite workout sneakers of all time are hands down every variation of my adidas UltraBOOSTs. I have multiple pairs of the UltraBOOSTs and the UltraBOOST Xs and wear them all on repeat. I just got this pair in white and wore them all over Park City this past weekend. They are really lightweight and have a boost cushioning for extra support so it feels like you’re walking/running on air.\r\n\r\nI also ordered this sweat set from Finish Line – I love borrowing from the boys! Especially in loungewear and sweats, I’m loving the oversized fit so I ordered a size medium in this sweatshirt and small in joggers. Also love the oversized hoodie over biker shorts! Below are some other pieces I ordered from Finish Line for the family. You can also see more of our family adidas looks in this post.', '2020-10-03 19:10:08', '2020-10-11 11:28:13'),
(4, '9 PIECES I CAN’T BELIEVE ARE STILL IN STOCK IN THE NSALE', 'Today the NSale opened to the public and while a lot of pieces have sold out, I’m surprised at how many great pieces are still available and some that have been restocked. Here are some of my favorites you can still snag on sale!', 'Ollie has outgrown our travel stroller so we have been using this one – it’s so lightweight and $200 off during the sale. We also got this car seat which is the lightest I’ve ever used! This compact stroller is also part of the Anniversary Sale and gets amazing reviews.\r\n\r\nThis is one of those products I would (and have) pay full price for.  I have multiple of these silk pillowcases and swear by them for hair and skincare. Also another great gift idea for your mom/MIL, sisters, friends, etc!\r\n\r\nThe BarefootDreams blankets are always one of the highlights of the Anniversary Sale but these Ugg blankets are just as good – so soft! These are a great one to stock up on for Christmas gifts while they are on sale. Also love this faux fur blanket on sale under $100 that comes in 4 gorgeous colors and these are an amazing price point under $50.', '2020-10-11 10:57:48', '2020-10-11 11:30:07'),
(5, 'MY FALL SWEATSHIRT HAUL', 'Will fall here and temperatures finally starting to cool off, I’m pulling out all the sweatshirts. From cropped to oversized and cozy, I can’t get enough of them! Here are some of my favorite recent sweatshirt buys, all under $50', 'Love the color on this one! With graphic sweatshirts, I usually prefer them cropped so I took a pair of scissors to this one and love how it turned out! The animal print is super subtle and it feels a more expensive in this pretty nude tone. Also love this black version here. On another note, these leggings were an amazing find. They remind me of the Lululemon Fast and Frees (pockets and all!) but at a fraction of the price. I’m wearing a size medium here, but could also go to a size small for something a little tighter.\r\n\r\nThis hoodie was pre-cropped and I love the fit. I found it in tons of colors in-store but it also comes in this oversized tunic version (just add biker shorts, or go even more oversized with just combat boots!) and this super soft sherpa version here.\r\n\r\nDETAILS: LAVENDER SWEATSHIRT (20% OFF CODE: FFMOBILE – WEARING SIZE S) | LEGGINGS (WEARING SIZE M – ON SALE UNDER $30)\r\n\r\nThis acid wash sweatshirt reminds of one we had at ILY years ago – it’s sooooo soft, almost spongy. It was probably my favorite sweatshirt I’ve ever owned. It comes in tons of colors (also got it in the pretty lavender color!) and they are buy one get one half off right now so the perfect excuse to stock up! They are super oversized. I usually get a size M or L in sweatshirts but this one is a small! They are also an extra 20% off right now with code: FFMOBILE', '2020-10-11 11:04:35', '2020-10-11 11:29:12');

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
  `model_size` varchar(56) DEFAULT NULL,
  `cart_photo` varchar(60) DEFAULT NULL,
  `new_arrival` enum('yes','no') NOT NULL DEFAULT 'no',
  `has_customer_offer` enum('yes','no') NOT NULL DEFAULT 'no',
  `has_discount` enum('yes','no') NOT NULL DEFAULT 'no',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_popular` enum('yes','no') NOT NULL DEFAULT 'no',
  `is_featured` enum('yes','no') NOT NULL DEFAULT 'no',
  `is_latest` enum('yes','no') NOT NULL DEFAULT 'no'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `jilancollection`
--

INSERT INTO `jilancollection` (`jilancollection_id`, `category_id`, `title`, `description`, `price`, `dimension`, `featured`, `model_size`, `cart_photo`, `new_arrival`, `has_customer_offer`, `has_discount`, `status`, `created`, `modified`, `is_popular`, `is_featured`, `is_latest`) VALUES
(1, 7, 'Men’s Polo(12)', '100% Cotton.\r\nMachine wash.\r\nSoft pique knit.\r\nShort sleeves.\r\nSpread collar.\r\nHenley button front.\r\nSide vents.', '0.00', 'no', 'no', 'no', '1612230311.jpg', 'no', 'no', 'no', 1, '2021-02-02 07:45:11', '2021-02-02 01:45:11', 'no', 'no', 'no'),
(2, 7, 'MEN’S POLO(11)', '100% Cotton.\r\nMachine wash.\r\nSoft oxford pique knit.\r\nShort sleeves.\r\nSpread collar, henley buttons.\r\nVents at sides.\r\nAllover rugby stripes.', '0.00', 'no', 'no', 'no', '1612230379.jpg', 'no', 'no', 'no', 1, '2021-02-02 07:46:20', '2021-02-02 01:46:20', 'no', 'no', 'no'),
(3, 7, 'MEN’S POLO(10)', '100% Cotton.\r\nMachine wash.\r\nSoft pique knit.\r\nShort sleeves with flat-knit ribbed cuffs.\r\nFlat-knit ribbed collar.\r\nTwo-button front.\r\nSide slits at hem.\r\nAllover spacedye.', '0.00', 'no', 'no', 'no', '1612230444.jpg', 'no', 'no', 'no', 1, '2021-02-02 07:47:25', '2021-02-02 01:47:25', 'no', 'no', 'no'),
(4, 7, 'MEN’S POLO(09)', '100% Cotton.\r\nMachine wash.\r\nSoft pique knit.\r\nShort sleeves with flat-knit ribbed cuffs.\r\nFlat-knit ribbed collar.\r\nTwo-button front.\r\nSide slits at hem.\r\nAllover thin stripes.', '0.00', 'no', 'no', 'no', '1612230497.jpg', 'no', 'no', 'no', 1, '2021-02-02 07:48:17', '2021-02-02 15:09:48', 'yes', 'yes', 'yes'),
(5, 7, 'MEN’S POLO(08)', '60% Cotton, 40% Polyester.\r\nMachine wash.\r\nMarled jersey knit.\r\nShort sleeves.\r\nSpread collar, henley buttons.\r\nPatch pocket at chest.', '0.00', 'no', 'no', 'no', '1612230554.jpg', 'no', 'no', 'no', 1, '2021-02-02 07:49:15', '2021-02-02 01:49:15', 'no', 'no', 'no'),
(6, 7, 'MEN’S POLO(07)', '100% cotton.\r\nMachine wash.\r\nOur summer line-up most definitely includes this striped slub-knit polo, soft-washed for extra comfort.\r\nSpread collar.\r\nShort sleeves.\r\nThree-button placket.\r\nPatch pocket at chest.\r\nVented drop-tail hem.\r\nSoft, slub-knit jersey.\r\nContrasting stripes.\r\nPieced trim inside neck for added durabilit', '0.00', 'no', 'no', 'no', '1612230594.jpg', 'no', 'no', 'no', 1, '2021-02-02 07:49:54', '2021-02-02 15:08:10', 'yes', 'yes', 'yes'),
(7, 6, 'MEN’S JEANS(16)', '99% cotton , 1% spandex.\r\nMachine wash.\r\nButton-closure and zip fly.\r\nRiveted scoop pockets and riveted coin pocket in front; patch pockets in back.\r\nEngineered with innovative Built-In Flex stretch technology. Equal parts comfort & movement.\r\nMedium denim wash, with fading and contrast topstitching.\r\nTag-free fit label inside back waist for added comfort.', '0.00', 'no', 'no', 'no', '1612279573.jpg', 'no', 'no', 'no', 1, '2021-02-02 21:26:14', '2021-02-02 15:26:14', 'no', 'no', 'no'),
(8, 6, 'MEN’S JEANS(15)', '99% cotton , 1% spandex.\r\nMachine wash.\r\nButton-closure and zip fly.\r\nRiveted scoop pockets and coin pockets in front; patch pockets in back.\r\nTag-free label inside back waist for added comfort.\r\nContrast topstitching.\r\nEngineered with innovative stretch technology. Equal parts comfort & movement.', '0.00', 'no', 'no', 'no', '1612279708.jpg', 'no', 'no', 'no', 1, '2021-02-02 21:28:28', '2021-02-02 15:28:28', 'yes', 'yes', 'yes'),
(9, 6, 'MEN’S JEANS(14)', '98% cotton , 2% spandex.\r\nMachine wash.\r\nButton closure and zip fly.\r\nScoop pockets and coin pocket at front; patch pockets at back.\r\nDistressed detailing and fading for a lived-in look.\r\nContrast topstitching.\r\nEngineered with innovative stretch technology. Equal parts comfort & movement.', '0.00', 'no', 'no', 'no', '1612279755.jpg', 'no', 'no', 'no', 1, '2021-02-02 21:29:15', '2021-02-02 15:29:15', 'yes', 'yes', 'yes'),
(10, 6, 'MEN’S JEANS(13)', '100% cotton .\r\nMachine wash.\r\nGot an appetite for destruction? We got you. We put this pair through the wringer–a rip here, a fray there–so you don’t have to.\r\nButton closure and zip fly.\r\nScoop pockets and coin pocket in front; patch pockets in back.\r\nDistressed details and fading for a lived-in look.', '0.00', 'no', 'no', 'no', '1612279813.jpg', 'no', 'no', 'no', 1, '2021-02-02 21:30:14', '2021-02-02 15:30:14', 'yes', 'yes', 'yes'),
(11, 6, 'MEN’S JEANS(12)', '80% cotton, 18% polyester, 2% spandex.\r\nMachine wash.\r\nButton-closure and zip fly.\r\nRiveted scoop pockets and riveted coin pocket in front; patch pockets in back.\r\nEngineered with innovative Built-In Flex stretch technology. Equal parts comfort & movement.', '0.00', 'no', 'no', 'no', '1612279866.jpg', 'no', 'no', 'no', 1, '2021-02-02 21:31:06', '2021-02-02 15:31:06', 'yes', 'yes', 'yes'),
(12, 6, 'MEN’S JEANS(01)', '92% Cotton, 5% Elasterrell, 3% Spandex.\r\nMachine wash.\r\nPremium 1969 denim, with bi-stretch.\r\nMedium indigo wash with fading and whiskering.\r\nButton closure, zip fly.\r\nFive-pocket styling.', '0.00', 'no', 'no', 'no', '1612280072.jpg', 'no', 'no', 'no', 1, '2021-02-02 21:34:32', '2021-02-02 15:34:32', 'yes', 'yes', 'yes'),
(13, 8, 'MEN’S T-SHIRT WITH BUTTON(01)', '60% cotton , 40% polyester.\r\nMachine wash.\r\nRib-knit crew neck.\r\nShort, raglan sleeves.\r\nPieced trim inside neck for added durability.\r\nThree-button Henley placket.\r\nTag-free for added comfort.\r\nSoft, medium-weight cotton blend.', '0.00', 'no', 'no', 'no', '1612315233.jpg', 'no', 'no', 'no', 1, '2021-02-03 07:20:35', '2021-02-03 01:20:35', 'no', 'no', 'no'),
(14, 8, 'MEN’S T-SHIRT WITH BUTTON(02)', '100% cotton,\r\nMachine wash.\r\nSoft, garment-dyed jersey creates a vintage look that improves with each washing.\r\nShort sleeves.\r\nPieced trim inside neck for added durability.\r\nThree-button Henley placket.\r\nPatch pocket at chest.\r\nSoft, medium-weight jersey.', '0.00', 'no', 'no', 'no', '1612315360.jpg', 'no', 'no', 'no', 1, '2021-02-03 07:22:41', '2021-02-03 01:22:41', 'no', 'no', 'no'),
(15, 8, 'MEN’S T-SHIRT WITH BUTTON(28)', '60% cotton, 40% polyester.\r\nMachine wash.\r\nRib-knit crew neck.\r\nShort sleeves.\r\nThree-button placket.\r\nTag-free for added comfort.\r\nSoft, medium-weight jersey.', '0.00', 'no', 'no', 'no', '1612315400.jpg', 'no', 'no', 'no', 1, '2021-02-03 07:23:21', '2021-02-03 01:23:21', 'no', 'no', 'no'),
(16, 8, 'MEN’S PRINTED T-SHIRT(20)', '60% cotton, 40% polyester.\r\nMachine wash.\r\nRib-knit crew neck.\r\nShort sleeves.\r\nGraphic across chest varies by color.\r\nSoft, medium-weight jersey.', '0.00', 'no', 'no', 'no', '1612315507.jpg', 'no', 'no', 'no', 1, '2021-02-03 07:25:09', '2021-02-03 01:25:09', 'no', 'no', 'no'),
(17, 9, 'MEN’S CARGO SHORTS(12)', '100% Cotton.\r\nMachine wash.\r\nThe soft cotton twill makes for a great worn-in feel.\r\nFlat front, zip fly, button closure.\r\nFront slant pockets, side cargo pockets.\r\nBack button-flap pockets.', '0.00', 'no', 'no', 'no', '1612315573.jpg', 'no', 'no', 'no', 1, '2021-02-03 07:26:13', '2021-02-03 01:26:13', 'no', 'no', 'no'),
(18, 9, 'MEN’S SHORTS(11)', '97% cotton, 3% spandex.\r\nMachine wash.\r\nButton-closure and zip fly.\r\nFlat front.\r\nSlant pockets and welt-coin pocket in front; welt pockets in back (with button-closure at left pocket).\r\nEngineered with innovative Built-In Flex stretch technology. Equal parts comfort & movement.\r\nLined, tag-free waistband for added comfort.', '0.00', 'no', 'no', 'no', '1612315655.jpg', 'no', 'no', 'no', 1, '2021-02-03 07:27:35', '2021-02-03 01:27:35', 'no', 'no', 'no'),
(19, 9, 'MEN’S SHORTS(10)', '97% cotton, 3% spandex.\r\nMachine wash.\r\nMade with added stretch for comfort.\r\nFront off-seam pockets. Rear buttoned welt pockets.\r\nZip fly with button closure. Belt loops.', '0.00', 'no', 'no', 'no', '1612315698.jpg', 'no', 'no', 'no', 1, '2021-02-03 07:28:18', '2021-02-03 01:28:18', 'no', 'no', 'no'),
(20, 10, 'MEN’S SWEATERS 1/2 ZIPPER(01)', '85% Pima cotton, 15% cashmere.\r\nHand wash or dry clean.\r\nMock neck with half-zip. Long sleeves.\r\nRib-knit trim at collar, cuffs, and hem.\r\nStraight hem.', '0.00', 'no', 'no', 'no', '1612315845.jpg', 'no', 'no', 'no', 1, '2021-02-03 07:30:15', '2021-02-03 01:30:46', 'yes', 'yes', 'yes'),
(21, 10, 'MEN’S SWEATERS WITH ZIPPER(01)', '75% silk, 20% cotton, 5% cashmere.\r\nDry clean.\r\nMock neck. Long, raglan sleeves.\r\nZip-front closure. Front pockets.\r\nRib-knit trim at collar, cuffs, and hem.\r\nStraight hem.', '0.00', 'no', 'no', 'no', '1612315895.jpg', 'no', 'no', 'no', 1, '2021-02-03 07:31:36', '2021-02-03 01:31:36', 'yes', 'yes', 'yes'),
(22, 10, 'MEN’S SWEATERS(03)', '75% silk, 20% cotton, 5% cashmere.\r\nDry clean.\r\nElevate your style with our high-quality silk, cotton, and cashmere blend, which boasts a super-soft feel and luxe look.\r\nV-neck. Long sleeves.\r\nRibbed cuffs and hem.', '0.00', 'no', 'no', 'no', '1612315947.jpg', 'no', 'no', 'no', 1, '2021-02-03 07:32:28', '2021-02-03 01:32:28', 'yes', 'yes', 'yes'),
(23, 10, 'MEN’S CARDIGAN SWEATERS(05)', '75% silk, 20% cotton, 5% cashmere.\r\nDry clean.\r\nCardigan neck. Long sleeves.\r\nButton-front closure.\r\nRib-knit trim at cuffs, and hem.\r\nStraight hem.', '0.00', 'no', 'no', 'no', '1612316040.jpg', 'no', 'no', 'no', 1, '2021-02-03 07:34:01', '2021-02-03 01:34:01', 'yes', 'yes', 'yes'),
(24, 10, 'MEN’S SWEATERS(06)', '75% silk, 20% cotton, 5% cashmere.\r\nDry clean.\r\nElevate your style with our high-quality silk, cotton, and cashmere blend, which boasts a super-soft feel and luxe look.\r\nV-neck. Long sleeves.\r\nRibbed cuffs and hem.', '0.00', 'no', 'no', 'no', '1612316120.jpg', 'no', 'no', 'no', 1, '2021-02-03 07:35:21', '2021-02-03 01:35:21', 'yes', 'yes', 'yes'),
(25, 10, 'MEN’S SWEATERS(08)', '100% cotton .\r\nMachine wash.\r\nRib-knit crew neck.\r\nLong sleeves, with rib-knit cuffs.\r\nContrasting stripes at center and along upper arm; colors vary.\r\nRib-knit hem.\r\nSoft, medium-weight cotton.', '0.00', 'no', 'no', 'no', '1612316175.jpg', 'no', 'no', 'no', 1, '2021-02-03 07:36:15', '2021-02-03 01:36:15', 'yes', 'yes', 'yes'),
(26, 10, 'MEN’S SWEATERS(08)', '80% Cotton, 20% Polyester.\r\nMachine wash.\r\nSoft and chunky cable knit.\r\nLong sleeves.\r\nCrewneck.\r\nRibbed trim throughout.', '0.00', 'no', 'no', 'no', '1612316227.jpg', 'no', 'no', 'no', 1, '2021-02-03 07:37:08', '2021-02-03 01:37:08', 'no', 'no', 'no'),
(27, 10, 'MEN’S SWEATERS(10)', '80% Cotton, 20% Polyester.\r\nMachine wash.\r\nSoft knit.\r\nLong sleeves, ribbing at cuffs and hem.\r\nRoll-collar trim at crewneck.\r\nStripes at chest.\r\nRibbing at hem.', '0.00', 'no', 'no', 'no', '1612316280.jpg', 'no', 'no', 'no', 1, '2021-02-03 07:38:01', '2021-02-03 01:38:01', 'no', 'no', 'no'),
(28, 10, 'MEN’S SWEATERS(11)', '100% Cotton.\r\nMachine wash.\r\nSoft knit.\r\nLong sleeves with banded cuffs, hem.\r\nCrewneck with finely ribbed trim.', '0.00', 'no', 'no', 'no', '1612316359.jpg', 'no', 'no', 'no', 1, '2021-02-03 07:39:20', '2021-02-03 01:39:20', 'no', 'no', 'no'),
(29, 10, 'MEN’S SWEATERS(11)', '100% Cotton.\r\nMachine wash.\r\nSoft knit.\r\nLong sleeves with banded cuffs, hem.\r\nCrewneck with finely ribbed trim.', '0.00', 'no', 'no', 'no', '1612316400.jpg', 'no', 'no', 'no', 1, '2021-02-03 07:40:00', '2021-02-03 01:40:00', 'no', 'no', 'no'),
(30, 11, 'WOMEN’S PRINTED T-SHIRTS(20)', '100% cotton .\r\nMachine wash.\r\nCrew neck.\r\nShort sleeves.\r\nPieced trim inside neck and shoulders for added durability.\r\nGraphic across front varies by color.\r\nCurved hem.\r\nSoft, lightweight slub-knit jersey.', '0.00', 'no', 'no', 'no', '1612316514.jpg', 'no', 'no', 'no', 1, '2021-02-03 07:41:55', '2021-02-03 01:41:55', 'no', 'no', 'no'),
(31, 3, 'WOMEN’S PRINTED T-SHIRTS(16)', '52% flax (linen) , 48% polyester .\r\nMachine wash.\r\nib-knit scoop neck.\r\nCap sleeves.\r\nPieced trim inside neck for added durability.\r\nCurved hem.\r\nSoft, medium-weight linen blend.', '0.00', 'no', 'no', 'no', '1612316553.jpg', 'no', 'no', 'no', 1, '2021-02-03 07:42:34', '2021-02-03 01:42:34', 'no', 'no', 'no'),
(32, 11, 'WOMEN’S POCKET T-SHIRTS(14)', '100% Cotton.\r\nMachine wash.\r\nSoft jersey slub knit.\r\nShort sleeves.\r\nScoop neck.\r\nPocket at chest\r\nSeamed detailing at back.', '0.00', 'no', 'no', 'no', '1612316602.jpg', 'no', 'no', 'no', 1, '2021-02-03 07:43:22', '2021-02-03 01:43:22', 'no', 'no', 'no'),
(33, 11, 'WOMEN’S PRINTED T-SHIRTS(04)', '100% cotton .\r\nMachine wash,\r\nRib-knit scoop neck.\r\nShort sleeves.\r\nPieced trim inside neck and shoulders for added durability.\r\nGraphic across front varies by color.\r\nSlightly curved hem.\r\nSoft, medium-weight, slub-knit jersey.', '0.00', 'no', 'no', 'no', '1612316675.jpg', 'no', 'no', 'no', 1, '2021-02-03 07:44:35', '2021-02-03 01:44:35', 'no', 'no', 'no'),
(34, 12, 'WOMEN’S TANK TOP(08)', '100% Cotton.\r\nMachine wash.\r\nSoft jersey slub.\r\nSleeveless.\r\nCrewneck.\r\nGraphic at front, logo at back.', '0.00', 'no', 'no', 'no', '1612316749.jpg', 'no', 'no', 'no', 1, '2021-02-03 07:45:50', '2021-02-03 01:45:50', 'no', 'no', 'no'),
(35, 12, 'WOMEN’S TANK TOP(03)', '100% cotton .\r\nMachine wash.\r\nScoop neck.\r\nRacerback.\r\nSleeveless shoulder straps.\r\nSoft, medium weight jersey.', '0.00', 'no', 'no', 'no', '1612316791.jpg', 'no', 'no', 'no', 1, '2021-02-03 07:46:32', '2021-02-03 01:46:32', 'no', 'no', 'no'),
(36, 12, 'WOMEN’S TANK TOP(06)', '58% Pima Cotton, 39% Modal, 3% Spandex.\r\nMachine wash.\r\nSoft cotton and modal knit.\r\nTank straps.\r\nScoop neckline.\r\nPetite Fit Guide\r\nTall Fit Guide', '0.00', 'no', 'no', 'no', '1612316832.jpg', 'no', 'no', 'no', 1, '2021-02-03 07:47:13', '2021-02-03 01:47:13', 'no', 'no', 'no'),
(37, 12, 'WOMEN’S TANK TOP(07)', '96% Pima Cotton, 4% Spandex.\r\nMachine wash.\r\nSmooth supima weave.\r\nTank straps.\r\nScoop neck.\r\nButton henley.\r\nSnaps at inseam for easy undressing.', '0.00', 'no', 'no', 'no', '1612316908.jpg', 'no', 'no', 'no', 1, '2021-02-03 07:48:29', '2021-02-03 01:48:29', 'no', 'no', 'no'),
(38, 13, 'WOME’S JEANS(16)', '88% cotton, 9% elasterell, 3% elastane.\r\nMachine wash.\r\nButton closure and zip fly.\r\nRiveted scoop pockets and coin pocket in front; patch pockets in back.\r\nHeavy nicks and abrasions create a lived-in look.\r\nDurable denim with comfortable stretch.', '0.00', 'no', 'no', 'no', '1612316956.jpg', 'no', 'no', 'no', 1, '2021-02-03 07:49:17', '2021-02-03 01:49:17', 'no', 'no', 'no'),
(39, 13, 'WOME’S JEANS(15)', '85% cotton , 13% polyester, 2% spandex.\r\nMachine wash.\r\nButton front and zip fly.\r\nScoop pockets and coin pocket in front; patch pockets in back.\r\nDestructed details for a lived-in look.\r\nSoft, gray-wash denim with stretch.', '0.00', 'no', 'no', 'no', '1612316996.jpg', 'no', 'no', 'no', 1, '2021-02-03 07:49:57', '2021-02-03 01:49:57', 'no', 'no', 'no'),
(40, 13, 'WOME’S JEANS(09)', '70% Cotton, 14% Polyester, 14% Rayon, 2% Spandex.\r\nMachine wash.\r\nPremium 1969 denim with stretch.\r\nButton closure, zip fly.\r\nFive-pocket styling.\r\nAssorted colors.', '0.00', 'no', 'no', 'no', '1612317027.jpg', 'no', 'no', 'no', 1, '2021-02-03 07:50:28', '2021-02-03 01:50:28', 'no', 'no', 'no'),
(41, 13, 'WOME’S JEANS(05)', '83% Cotton, 15% Polyester, 2% Polyurethane.\r\nMachine wash.\r\nPremium 1969 denim with high stretch.\r\nGrey wash with fading.\r\nFaux front coin and patch pockets, back patch pockets.\r\nButton closure, zip fly.', '0.00', 'no', 'no', 'no', '1612317082.jpg', 'no', 'no', 'no', 1, '2021-02-03 07:51:23', '2021-02-03 01:51:23', 'no', 'no', 'no'),
(42, 14, 'WOMEN’S LEGGINGS(08)', '96% cotton , 4% spandex\r\nMachine wash.\r\nCovered elastic waistband.\r\nSmooth, lightweight jersey with added stretch.\r\nCut-out crisscross detail at each leg opening.', '0.00', 'no', 'no', 'no', '1612317137.jpg', 'no', 'no', 'no', 1, '2021-02-03 07:52:18', '2021-02-03 01:52:18', 'no', 'no', 'no'),
(43, 14, 'WOMEN’S LEGGINGS(04)', '96% cotton , 4% spandex.\r\nMachine wash.\r\nElasticized waistband.\r\nSmooth, stretchy jersey.', '0.00', 'no', 'no', 'no', '1612317170.jpg', 'no', 'no', 'no', 1, '2021-02-03 07:52:51', '2021-02-03 01:52:51', 'no', 'no', 'no'),
(44, 14, 'WOMEN’S LEGGINGS(01)', '58% cotton, 38% polyester, 4% spandex..\r\nMachine wash.\r\nElasticized waistband.\r\nSmooth, stretchy jersey.', '0.00', 'no', 'no', 'no', '1612317202.jpg', 'no', 'no', 'no', 1, '2021-02-03 07:53:23', '2021-02-03 01:53:23', 'no', 'no', 'no'),
(45, 14, 'WOMEN’S LEGGINGS(02)', '96% cotton, 4% spandex.\r\nMachine wash.\r\nElasticized waistband.\r\nSmooth, stretchy jersey.', '0.00', 'no', 'no', 'no', '1612317246.jpg', 'no', 'no', 'no', 1, '2021-02-03 07:54:07', '2021-02-03 01:54:07', 'no', 'no', 'no'),
(46, 15, 'WOMEN’S R-NECK SWEATER(12)', '100% cotton.\r\nMachine wash.\r\nOpen front.\r\nLong sleeves, with fine-gauge rib-knit cuffs.\r\nPatch pockets in front.\r\nFringed tassels along the hem in front and back.\r\nSoft, textured sweater-knit cotton, with fine-gauge rib-knit trim.', '0.00', 'no', 'no', 'no', '1612317300.jpg', 'no', 'no', 'no', 1, '2021-02-03 07:55:01', '2021-02-03 01:55:01', 'no', 'no', 'no'),
(47, 15, 'WOMEN’S R-NECK SWEATER(11)', '80% silk, 20% cotton.\r\nHand wash.\r\nA lush silk and cotton blend makes this pullover style extra luxurious.\r\nBoatneck. Long sleeves.\r\nDelicate pointelle stripe detail at sleeves and neckline.\r\nStraight hem.', '0.00', 'no', 'no', 'no', '1612317331.jpg', 'no', 'no', 'no', 1, '2021-02-03 07:55:32', '2021-02-03 01:55:32', 'yes', 'yes', 'yes'),
(48, 15, 'STRIPE V-NECK SWEATER(10)', '57% Nylon, 25% Wool, 15% Acrylic, 3% Spandex.\r\nMachine wash and lay flat to dry.\r\nSoft knit blend.\r\nLong sleeves with rib-knit cuffs.\r\nRib-knit V-neck.\r\nExposed seam at front.\r\nAllover stripes.', '0.00', 'no', 'no', 'no', '1612317376.jpg', 'no', 'no', 'no', 1, '2021-02-03 07:56:17', '2021-02-03 01:56:17', 'yes', 'yes', 'yes'),
(49, 15, 'SOFT V-NECK SWEATER(09)', '100% Cotton.\r\nMachine wash cold, tumble dry low.\r\noft knit.\r\nLong raglan sleeves with rib-knit cuffs and hem.\r\nRib-knit V-neckline.', '0.00', 'no', 'no', 'no', '1612317416.jpg', 'no', 'no', 'no', 1, '2021-02-03 07:56:56', '2021-02-03 01:56:56', 'yes', 'yes', 'yes'),
(50, 15, 'WOMEN’S HIGH NECK(08)', '100% Merino Wool.\r\nMachine wash cold inside out\r\nSoft merino wool knit.\r\nLong sleeves with ribbed cuffs.\r\nRibbing at turtleneck, hem.', '0.00', 'no', 'no', 'no', '1612317460.jpg', 'no', 'no', 'no', 1, '2021-02-03 07:57:41', '2021-02-03 01:57:41', 'yes', 'yes', 'yes'),
(51, 15, 'WOMEN’S CARDIGAN SWEATER(04)', '55% cotton , 30% polyester, 15% acrylic.\r\nMachine wash.\r\nRib-knit trim.\r\nLong sleeves, with rib-knit cuffs.\r\nSeven-button placket.\r\nPatch pockets at front.\r\nHi-lo hem, with vented sides.\r\nSoft, medium-weight cotton-blend knit.', '0.00', 'no', 'no', 'no', '1612317511.jpg', 'no', 'no', 'no', 1, '2021-02-03 07:58:31', '2021-02-03 01:58:31', 'yes', 'yes', 'yes'),
(52, 15, 'WOMEN’S CARDIGAN SWEATER(03)', '55% cotton , 30% polyester, 15% acrylic.\r\nMachine wash.\r\nRib-knit V-neck.\r\nLong sleeves, with rib-knit cuffs.\r\nSix-button placket.\r\nRib-knit hem.\r\nSoft, medium-weight cotton blend.', '0.00', 'no', 'no', 'no', '1612317547.jpg', 'no', 'no', 'no', 1, '2021-02-03 07:59:08', '2021-02-03 01:59:08', 'yes', 'yes', 'yes'),
(53, 15, 'WOMEN’S SLEEVELESS (07)', '100% Cotton.\r\nMachine wash cold inside out,\r\nSoft ribbed knit.\r\nSleeveless.\r\nMockneck.', '0.00', 'no', 'no', 'no', '1612317583.jpg', 'no', 'no', 'no', 1, '2021-02-03 07:59:44', '2021-02-03 01:59:44', 'yes', 'yes', 'yes'),
(54, 15, 'WOMEN’S CARDIGAN SWEATER(02)', '55% cotton , 30% polyester, 15% acrylic.\r\nMachine wash.\r\nRib-knit V-neck.\r\nLong sleeves, with rib-knit cuffs.\r\nSix-button placket.\r\nRib-knit hem.\r\nSoft, medium-weight cotton blend.', '0.00', 'no', 'no', 'no', '1612317617.jpg', 'no', 'no', 'no', 1, '2021-02-03 08:00:18', '2021-02-03 02:00:18', 'yes', 'yes', 'yes'),
(55, 15, 'WOMEN’S CARDIGAN SWEATER(01)', '55% cotton , 30% polyester, 15% acrylic.\r\nMachine wash.\r\nRib-knit V-neck.\r\nLong sleeves, with rib-knit cuffs.\r\nSix-button placket.\r\nRib-knit hem.\r\nSoft, medium-weight cotton blend.', '0.00', 'no', 'no', 'no', '1612317796.jpg', 'no', 'no', 'no', 1, '2021-02-03 08:03:16', '2021-02-03 02:03:16', 'yes', 'yes', 'yes'),
(56, 21, 'BOY’S PRINTED T-SHIRT(23)', '100% Cotton.\r\nMachine wash\r\nTees for all—bold new graphics for confident kids.\r\nSueded cotton knit.\r\nShort sleeves.\r\nCrewneck.\r\nScreen-printed graphic at front.', '0.00', 'no', 'no', 'no', '1612318036.jpg', 'no', 'no', 'no', 1, '2021-02-03 08:07:16', '2021-02-03 02:07:16', 'no', 'no', 'no'),
(57, 21, 'BOYS S/S FRONT BUTTON T-SHIRT(22)', '100% Cotton.\r\nMachine wash\r\nTees for button for confident kids.\r\nSueded cotton knit.\r\nShorts sleeves.\r\nCrewneck.\r\nButton at front.', '0.00', 'no', 'no', 'no', '1612318070.jpg', 'no', 'no', 'no', 1, '2021-02-03 08:07:51', '2021-02-03 02:07:51', 'no', 'no', 'no'),
(58, 21, 'BOYS L/S FRONT BUTTON T-SHIRT(21)', '100% Cotton.\r\nMachine wash\r\nTees for button for confident kids.\r\nSueded cotton knit.\r\nLong sleeves.\r\nCrewneck.\r\nButton at front.', '0.00', 'no', 'no', 'no', '1612318118.jpg', 'no', 'no', 'no', 1, '2021-02-03 08:08:39', '2021-02-03 02:08:39', 'no', 'no', 'no'),
(59, 21, 'BOYS L/S PRINTED T-SHIRT(19)', '100% Cotton.\r\nMachine wash\r\nTees for all—bold new graphics for confident kids.\r\nSueded cotton knit.\r\nLong sleeves.\r\nCrewneck.\r\nScreen-printed graphic at front.', '0.00', 'no', 'no', 'no', '1612318157.jpg', 'no', 'no', 'no', 1, '2021-02-03 08:09:18', '2021-02-03 02:09:18', 'no', 'no', 'no'),
(60, 19, 'BOY’S JEANS(07)', '98% cotton, 2% spandex.\r\nMachine wash.\r\nSnap closure and zip fly.\r\nScoop pockets and coin pocket in front; patch pockets in back.\r\nSoft, medium-weight denim with added stretch.', '0.00', 'no', 'no', 'no', '1612318297.jpg', 'no', 'no', 'no', 1, '2021-02-03 08:11:37', '2021-02-03 02:11:37', 'no', 'no', 'no'),
(61, 19, 'BOY’S JEANS(01)', '98% cotton, 2% spandex.\r\nMachine wash.\r\nSnap closure and zip fly.\r\nScoop pockets and coin pocket in front; patch pockets in back.\r\nSoft, medium-weight denim with added stretch', '0.00', 'no', 'no', 'no', '1612318335.jpg', 'no', 'no', 'no', 1, '2021-02-03 08:12:16', '2021-02-03 02:12:16', 'no', 'no', 'no'),
(62, 19, 'BOY’S JEANS(02)', '98% cotton, 2% spandex.\r\nMachine wash.\r\nSnap closure and zip fly.\r\nScoop pockets and coin pocket in front; patch pockets in back.\r\nSoft, medium-weight denim with added stretch', '0.00', 'no', 'no', 'no', '1612318372.jpg', 'no', 'no', 'no', 1, '2021-02-03 08:12:52', '2021-02-03 02:12:52', 'no', 'no', 'no'),
(63, 22, 'BOY’S SWEATERS(04)', '100% cotton,\r\nMachine wash.\r\nOnline exclusive!\r\nRib-knit V-neck.\r\nLong sleeves, with rib-knit cuffs.\r\nRib-knit hem.\r\nSoft,weight-12gg,cotton.', '0.00', 'no', 'no', 'no', '1612318452.jpg', 'no', 'no', 'no', 1, '2021-02-03 08:14:12', '2021-02-03 02:14:12', 'yes', 'yes', 'yes'),
(64, 22, 'BOY’S SWEATERS(03)', '100% cotton,\r\nMachine wash.\r\nOnline exclusive!\r\nRib-knit V-neck.\r\nLong sleeves, with rib-knit cuffs.\r\nRib-knit hem.\r\nSoft,weight-12gg,cotton.', '0.00', 'no', 'no', 'no', '1612318488.jpg', 'no', 'no', 'no', 1, '2021-02-03 08:14:49', '2021-02-03 02:14:49', 'yes', 'yes', 'yes'),
(65, 24, 'BOY’S SWEATERS(02)', '100% cotton,\r\nMachine wash.\r\nOnline exclusive!\r\nRib-knit V-neck.\r\nLong sleeves, with rib-knit cuffs.\r\nRib-knit hem.\r\nSoft,weight-12gg,cotton.', '0.00', 'no', 'no', 'no', '1612318519.jpg', 'no', 'no', 'no', 1, '2021-02-03 08:15:20', '2021-02-03 02:15:20', 'yes', 'yes', 'yes'),
(66, 22, 'BOY’S SWEATERS(01)', 'Boy’s Jacquard Sweaters\r\n100% cotton,\r\nMachine wash.\r\nOnline exclusive!\r\nRib-knit V-neck.\r\nLong sleeves, with rib-knit cuffs.\r\nRib-knit hem.\r\nSoft,weight-12gg,cotton.', '0.00', 'no', 'no', 'no', '1612318555.jpg', 'no', 'no', 'no', 1, '2021-02-03 08:15:55', '2021-02-03 02:15:55', 'yes', 'yes', 'yes'),
(67, 24, 'GIRL’S CARDIGAN(07)', '100% Cotton,\r\nMachine wash.\r\nLong sleeves.\r\nFlat knitwear\r\nfront with button\r\nweight 7gg', '0.00', 'no', 'no', 'no', '1612318709.jpg', 'no', 'no', 'no', 1, '2021-02-03 08:18:30', '2021-02-03 02:18:30', 'no', 'no', 'no'),
(68, 24, 'GIRL’S CARDIGAN(06)', '100% Cotton.\r\nMachine wash.\r\nSoft open-stitch knit.\r\nThree-quarter sleeves.\r\nOpen front.\r\nRibbed trim throughout.', '0.00', 'no', 'no', 'no', '1612318740.jpg', 'no', 'no', 'no', 1, '2021-02-03 08:19:01', '2021-02-03 02:19:01', 'no', 'no', 'no'),
(69, 24, 'GIRL’S STRIPE CARDIGAN(05)', '100% Cotton.\r\nMachine wash.\r\nSoft cotton sweater knit.\r\nLong sleeves with dropped shoulders.\r\nRound neckline.\r\nButtons at shoulder seam.\r\nStripes across lower arms, body.\r\nRibbed trim throughout.', '0.00', 'no', 'no', 'no', '1612318777.jpg', 'no', 'no', 'no', 1, '2021-02-03 08:19:38', '2021-02-03 02:19:38', 'yes', 'yes', 'yes'),
(70, 24, 'GIRL’S PRINTED SWEATERS(04)', '100% Cotton.\r\nMachine wash.\r\nSoft sweater knit.\r\nContrast long raglan sleeves.\r\nContrast round neckline.\r\nSequin-embellished graphic at chest.\r\nStraight hem is slightly longer at back, side vents.\r\nRibbed trim throughout.', '0.00', 'no', 'no', 'no', '1612318815.jpg', 'no', 'no', 'no', 1, '2021-02-03 08:20:16', '2021-02-03 02:20:16', 'yes', 'yes', 'yes'),
(71, 24, 'GIRL’S CARDIGAN(02)', '100% Cotton.\r\nMachine wash.\r\nSupersoft, lightweight knit.\r\nLong sleeves.\r\nDeep, ribbed V-neckline and cuffs with rolled trim.\r\nFront button placket.\r\nPatch pockets at front.\r\nSatin tape trim at interior neckline.', '0.00', 'no', 'no', 'no', '1612318861.jpg', 'no', 'no', 'no', 1, '2021-02-03 08:21:02', '2021-02-03 02:21:02', 'yes', 'yes', 'yes'),
(72, 23, 'GIRL’S PRINTED TANK TOP(08)', '60% cotton , 40% polyester.\r\nMachine wash.\r\nHigh, rounded neck; sleeveless.\r\nA-line silhouette.\r\nCurved hi-lo hem, with central back vent.\r\nSoft, medium-weight slub-knit jersey.', '0.00', 'no', 'no', 'no', '1612318942.jpg', 'no', 'no', 'no', 1, '2021-02-03 08:22:23', '2021-02-03 02:22:23', 'no', 'no', 'no'),
(73, 23, 'GIRL’S PRINTED TANK TOP(08)', '60% cotton , 40% polyester.\r\nMachine wash.\r\nHigh, rounded neck; sleeveless.\r\nA-line silhouette.\r\nCurved hi-lo hem, with central back vent.\r\nSoft, medium-weight slub-knit jersey.', '0.00', 'no', 'no', 'no', '1612318979.jpg', 'no', 'no', 'no', 1, '2021-02-03 08:23:00', '2021-02-03 02:23:00', 'no', 'no', 'no'),
(74, 23, 'GIRL’S PRINTED TANK TOP(05)', '60% cotton , 40% polyester.\r\nMachine wash.\r\nHigh, rounded neck; sleeveless.\r\nA-line silhouette.\r\nCurved hi-lo hem, with central back vent.\r\nSoft, medium-weight slub-knit jersey.', '0.00', 'no', 'no', 'no', '1612319014.jpg', 'no', 'no', 'no', 1, '2021-02-03 08:23:35', '2021-02-03 02:23:35', 'no', 'no', 'no'),
(75, 23, 'GIRL’S TANK TOP(03)', '60% cotton , 40% polyester.\r\nMachine wash.\r\nRib-knit V-neck; sleeveless.\r\nSeamed back yoke.\r\nHi-lo hem.\r\nSwingy, A-line silhouette.\r\nSoft, lightweight slub-knit cotton blend.', '0.00', 'no', 'no', 'no', '1612319061.jpg', 'no', 'no', 'no', 1, '2021-02-03 08:24:21', '2021-02-03 02:24:21', 'no', 'no', 'no');

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
(1, 0, 'APPARELS', 1, '2021-02-01 07:07:16', '0000-00-00 00:00:00'),
(2, 1, 'MENS', 1, '2021-02-01 07:07:53', '0000-00-00 00:00:00'),
(3, 1, 'WOMENS', 1, '2021-02-01 07:08:10', '0000-00-00 00:00:00'),
(4, 1, 'KIDS', 1, '2021-02-01 07:08:46', '0000-00-00 00:00:00'),
(5, 1, 'Accessories', 1, '2021-02-01 07:09:21', '0000-00-00 00:00:00'),
(6, 2, 'Jeans', 1, '2021-02-01 07:11:26', '0000-00-00 00:00:00'),
(7, 2, 'Polo Shirts', 1, '2021-02-01 07:12:51', '0000-00-00 00:00:00'),
(8, 2, 'T-Shirts', 1, '2021-02-01 07:13:04', '0000-00-00 00:00:00'),
(9, 2, 'Shorts & Cargo', 1, '2021-02-01 07:13:20', '0000-00-00 00:00:00'),
(10, 2, 'Sweaters', 1, '2021-02-01 07:13:32', '0000-00-00 00:00:00'),
(11, 3, 'T-Shirts', 1, '2021-02-01 07:14:13', '0000-00-00 00:00:00'),
(12, 3, 'Tank Top', 1, '2021-02-01 07:14:41', '0000-00-00 00:00:00'),
(13, 3, 'Jeans', 1, '2021-02-01 07:14:56', '0000-00-00 00:00:00'),
(14, 3, 'Leggings', 1, '2021-02-01 07:15:06', '0000-00-00 00:00:00'),
(15, 3, 'Sweaters', 1, '2021-02-01 07:15:18', '0000-00-00 00:00:00'),
(16, 4, 'Boys', 1, '2021-02-01 07:22:54', '0000-00-00 00:00:00'),
(17, 4, 'Girls', 1, '2021-02-01 07:23:04', '0000-00-00 00:00:00'),
(18, 16, 'Casual Shirts', 1, '2021-02-01 07:23:47', '0000-00-00 00:00:00'),
(19, 16, 'Jeans', 1, '2021-02-01 07:24:10', '0000-00-00 00:00:00'),
(20, 16, 'Shorts', 1, '2021-02-01 07:24:29', '0000-00-00 00:00:00'),
(21, 16, 'T-shirts', 1, '2021-02-01 07:24:55', '0000-00-00 00:00:00'),
(22, 16, 'Sweaters', 1, '2021-02-01 07:25:27', '0000-00-00 00:00:00'),
(23, 17, 'Tops', 1, '2021-02-01 07:27:17', '0000-00-00 00:00:00'),
(24, 17, 'Sweaters', 1, '2021-02-01 07:28:47', '0000-00-00 00:00:00'),
(25, 5, 'Woolen Hats', 1, '2021-02-01 07:29:44', '0000-00-00 00:00:00'),
(26, 5, 'Shawl', 1, '2021-02-01 07:30:30', '0000-00-00 00:00:00'),
(27, 5, 'Muffler', 1, '2021-02-01 07:30:50', '0000-00-00 00:00:00'),
(28, 0, 'LEATHER', 1, '2021-02-01 07:32:04', '0000-00-00 00:00:00'),
(29, 28, 'Wallet', 1, '2021-02-01 07:33:27', '0000-00-00 00:00:00'),
(30, 28, 'Wrist Belt', 1, '2021-02-01 07:33:47', '0000-00-00 00:00:00'),
(31, 28, 'Card holder', 1, '2021-02-01 07:34:01', '0000-00-00 00:00:00'),
(32, 28, 'Customized Gift Item', 1, '2021-02-01 07:35:36', '0000-00-00 00:00:00'),
(33, 0, 'FOOTWEAR', 1, '2021-02-01 07:36:21', '2021-02-02 17:59:30'),
(34, 33, 'MENS', 1, '2021-02-01 07:44:55', '0000-00-00 00:00:00'),
(35, 33, 'Womens', 1, '2021-02-01 07:45:24', '0000-00-00 00:00:00'),
(36, 34, 'Loafers', 1, '2021-02-01 07:45:37', '0000-00-00 00:00:00'),
(37, 34, 'Espadrilles', 1, '2021-02-01 07:45:59', '0000-00-00 00:00:00'),
(38, 35, 'Loafers', 1, '2021-02-01 07:46:14', '0000-00-00 00:00:00'),
(39, 35, 'Espadrilles', 1, '2021-02-01 07:46:29', '0000-00-00 00:00:00'),
(40, 0, 'JUTE', 1, '2021-02-01 07:54:30', '0000-00-00 00:00:00'),
(41, 40, 'Bags', 1, '2021-02-01 07:54:49', '0000-00-00 00:00:00'),
(42, 40, 'Basket', 1, '2021-02-01 07:55:06', '0000-00-00 00:00:00'),
(43, 40, 'Tulika', 1, '2021-02-01 07:56:05', '0000-00-00 00:00:00');

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
(15, 6, 'Section 1.10.32 of ', '\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"', '1512452900.jpg', NULL, 'jilancollection', '2017-12-05 11:48:21', '2020-10-11 07:15:29'),
(22, 8, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '1512453351.jpg', NULL, 'jilancollection', '2017-12-05 11:55:52', '0000-00-00 00:00:00'),
(23, 9, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '1512453438.jpg', NULL, 'jilancollection', '2017-12-05 11:57:18', '0000-00-00 00:00:00'),
(24, 10, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '1512453495.jpg', NULL, 'jilancollection', '2017-12-05 11:58:16', '0000-00-00 00:00:00'),
(25, 11, '1914 translation by H. Rackham', '\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"', '1512453646.jpg', NULL, 'jilancollection', '2017-12-05 12:00:47', '0000-00-00 00:00:00'),
(26, 12, 'Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC', '\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"', '1512453730.jpg', NULL, 'jilancollection', '2017-12-05 12:02:11', '0000-00-00 00:00:00'),
(27, 13, '1914 translation by H. Rackham', '\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"', '1512453780.jpg', NULL, 'jilancollection', '2017-12-05 12:03:01', '0000-00-00 00:00:00'),
(28, 14, 'The standard Lorem Ipsum passage, used since the 1500s', '\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"\r\n\r\n', '1512453961.jpg', NULL, 'jilancollection', '2017-12-05 12:06:02', '0000-00-00 00:00:00'),
(29, 15, 'The standard Lorem Ipsum passage, used since the 1500s', '\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"\r\n\r\n', '1512454092.jpg', NULL, 'jilancollection', '2017-12-05 12:08:12', '0000-00-00 00:00:00'),
(40, 5, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"', '1512454787_0.jpg', NULL, 'jilancollection', '2017-12-05 12:19:48', '0000-00-00 00:00:00'),
(41, 17, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"', '1512454971.jpg', NULL, 'jilancollection', '2017-12-05 12:22:52', '0000-00-00 00:00:00'),
(43, 19, '1914 translation by H. Rackham', '\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"\r\n\r\n', '1512455081.jpg', NULL, 'jilancollection', '2017-12-05 12:24:41', '0000-00-00 00:00:00'),
(44, 20, '1914 translation by H. Rackham', '\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"\r\n\r\n', '1512455134.jpg', NULL, 'jilancollection', '2017-12-05 12:25:35', '0000-00-00 00:00:00'),
(46, 22, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"\r\n\r\n', '1512455254.jpg', NULL, 'jilancollection', '2017-12-05 12:27:35', '0000-00-00 00:00:00'),
(47, 23, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"', '1512455347.jpg', NULL, 'jilancollection', '2017-12-05 12:29:08', '0000-00-00 00:00:00'),
(48, 24, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"\r\n\r\n', '1512455413.jpg', NULL, 'jilancollection', '2017-12-05 12:30:13', '0000-00-00 00:00:00'),
(50, 26, '1914 translation by H. Rackham', '\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"', '1512455672.jpg', NULL, 'jilancollection', '2017-12-05 12:34:33', '0000-00-00 00:00:00'),
(51, 27, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"\r\n\r\n', '1512455750.jpg', NULL, 'jilancollection', '2017-12-05 12:35:51', '0000-00-00 00:00:00'),
(52, 28, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"\r\n\r\n', '1512455996.jpg', NULL, 'jilancollection', '2017-12-05 12:39:57', '0000-00-00 00:00:00'),
(53, 29, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"', '1512456050.jpg', NULL, 'jilancollection', '2017-12-05 12:40:51', '0000-00-00 00:00:00'),
(54, 30, '1914 translation by H. Rackham', '\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"\r\n\r\n', '1512456184.jpg', NULL, 'jilancollection', '2017-12-05 12:43:05', '0000-00-00 00:00:00'),
(56, 21, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"\r\n\r\n', '1512456301_0.jpg', NULL, 'jilancollection', '2017-12-05 12:45:02', '0000-00-00 00:00:00'),
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
(142, 39, 'new caption', 'sdfs', '1598896000.jpg', NULL, 'jilancollection', '2020-08-31 23:46:40', '0000-00-00 00:00:00'),
(143, 40, 'sdf', 'asdf', '1599067327.jpg', NULL, 'jilancollection', '2020-09-02 23:22:07', '0000-00-00 00:00:00'),
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
(156, 41, 'new caption dtet', 'caption test details', '1601522484.jpg', NULL, 'jilancollection', '2020-10-01 09:21:25', '0000-00-00 00:00:00'),
(169, 1, 'Blog Title', 'Blog Details', '1602393945.jpg', NULL, 'blog', '2020-10-11 11:25:45', '0000-00-00 00:00:00'),
(170, 2, 'Blog Title', 'Blog Details', '1602394079.jpeg', NULL, 'blog', '2020-10-11 11:28:00', '0000-00-00 00:00:00'),
(171, 3, 'Blog Title', 'Blog Details', '1602394093.jpg', NULL, 'blog', '2020-10-11 11:28:13', '0000-00-00 00:00:00'),
(172, 5, 'Blog Title', 'Blog Details', '1602394152.jpg', NULL, 'blog', '2020-10-11 11:29:12', '0000-00-00 00:00:00'),
(173, 4, 'Blog Title', 'Blog Details', '1602394207.jpg', NULL, 'blog', '2020-10-11 11:30:07', '0000-00-00 00:00:00'),
(174, 42, 'T-shirt', 'T-shirt', '1602394741_0.jpeg', NULL, 'jilancollection', '2020-10-11 11:39:01', '0000-00-00 00:00:00'),
(175, 18, 'sadf', 'asdf', '1602395032_0.jpg', NULL, 'jilancollection', '2020-10-11 11:43:53', '0000-00-00 00:00:00'),
(176, 16, 'sdf', 'sdf', '1602395260_0.png', NULL, 'jilancollection', '2020-10-11 11:47:41', '0000-00-00 00:00:00'),
(177, 16, 'sdf', 'sdfsf sd', '1602395350_0.jpg', NULL, 'jilancollection', '2020-10-11 11:49:11', '0000-00-00 00:00:00'),
(178, 31, '', '', '1602395507_0.jpg', NULL, 'jilancollection', '2020-10-11 11:51:47', '0000-00-00 00:00:00'),
(179, 4, 'asdf', 'asdf', '1602395608_0.jpg', NULL, 'jilancollection', '2020-10-11 11:53:28', '0000-00-00 00:00:00'),
(180, 25, 'asdf', 'asd', '1602395705_0.jpg', NULL, 'jilancollection', '2020-10-11 11:55:05', '0000-00-00 00:00:00'),
(181, 25, 'asdf', 'asdf', '1602395750_0.jpg', NULL, 'jilancollection', '2020-10-11 11:55:51', '0000-00-00 00:00:00'),
(182, 43, 'm', 'm', '1605206047_0.jpg', NULL, 'jilancollection', '2020-11-13 00:34:07', '0000-00-00 00:00:00'),
(183, 44, 'd', 's', '1609356317_0.png', NULL, 'jilancollection', '2020-12-31 01:25:17', '0000-00-00 00:00:00');

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
(1, 1, 7, '2021-02-02 07:45:11', '2021-02-02 01:45:11'),
(2, 1, 2, '2021-02-02 07:45:11', '2021-02-02 01:45:11'),
(3, 1, 1, '2021-02-02 07:45:11', '2021-02-02 01:45:11'),
(4, 2, 7, '2021-02-02 07:46:20', '2021-02-02 01:46:20'),
(5, 2, 2, '2021-02-02 07:46:20', '2021-02-02 01:46:20'),
(6, 2, 1, '2021-02-02 07:46:20', '2021-02-02 01:46:20'),
(7, 3, 7, '2021-02-02 07:47:25', '2021-02-02 01:47:25'),
(8, 3, 2, '2021-02-02 07:47:25', '2021-02-02 01:47:25'),
(9, 3, 1, '2021-02-02 07:47:25', '2021-02-02 01:47:25'),
(13, 5, 7, '2021-02-02 07:49:15', '2021-02-02 01:49:15'),
(14, 5, 2, '2021-02-02 07:49:15', '2021-02-02 01:49:15'),
(15, 5, 1, '2021-02-02 07:49:15', '2021-02-02 01:49:15'),
(19, 6, 7, '2021-02-02 21:08:10', '2021-02-02 15:08:10'),
(20, 6, 2, '2021-02-02 21:08:10', '2021-02-02 15:08:10'),
(21, 6, 1, '2021-02-02 21:08:10', '2021-02-02 15:08:10'),
(22, 4, 7, '2021-02-02 21:09:48', '2021-02-02 15:09:48'),
(23, 4, 2, '2021-02-02 21:09:48', '2021-02-02 15:09:48'),
(24, 4, 1, '2021-02-02 21:09:48', '2021-02-02 15:09:48'),
(25, 7, 6, '2021-02-02 21:26:14', '2021-02-02 15:26:14'),
(26, 7, 2, '2021-02-02 21:26:14', '2021-02-02 15:26:14'),
(27, 7, 1, '2021-02-02 21:26:14', '2021-02-02 15:26:14'),
(28, 8, 6, '2021-02-02 21:28:28', '2021-02-02 15:28:28'),
(29, 8, 2, '2021-02-02 21:28:28', '2021-02-02 15:28:28'),
(30, 8, 1, '2021-02-02 21:28:28', '2021-02-02 15:28:28'),
(31, 9, 6, '2021-02-02 21:29:15', '2021-02-02 15:29:15'),
(32, 9, 2, '2021-02-02 21:29:15', '2021-02-02 15:29:15'),
(33, 9, 1, '2021-02-02 21:29:15', '2021-02-02 15:29:15'),
(34, 10, 6, '2021-02-02 21:30:14', '2021-02-02 15:30:14'),
(35, 10, 2, '2021-02-02 21:30:14', '2021-02-02 15:30:14'),
(36, 10, 1, '2021-02-02 21:30:14', '2021-02-02 15:30:14'),
(37, 11, 6, '2021-02-02 21:31:06', '2021-02-02 15:31:06'),
(38, 11, 2, '2021-02-02 21:31:06', '2021-02-02 15:31:06'),
(39, 11, 1, '2021-02-02 21:31:06', '2021-02-02 15:31:06'),
(40, 12, 6, '2021-02-02 21:34:32', '2021-02-02 15:34:32'),
(41, 12, 2, '2021-02-02 21:34:32', '2021-02-02 15:34:32'),
(42, 12, 1, '2021-02-02 21:34:32', '2021-02-02 15:34:32'),
(43, 13, 8, '2021-02-03 07:20:35', '2021-02-03 01:20:35'),
(44, 13, 2, '2021-02-03 07:20:35', '2021-02-03 01:20:35'),
(45, 13, 1, '2021-02-03 07:20:35', '2021-02-03 01:20:35'),
(46, 14, 8, '2021-02-03 07:22:41', '2021-02-03 01:22:41'),
(47, 14, 2, '2021-02-03 07:22:41', '2021-02-03 01:22:41'),
(48, 14, 1, '2021-02-03 07:22:41', '2021-02-03 01:22:41'),
(49, 15, 8, '2021-02-03 07:23:21', '2021-02-03 01:23:21'),
(50, 15, 2, '2021-02-03 07:23:21', '2021-02-03 01:23:21'),
(51, 15, 1, '2021-02-03 07:23:21', '2021-02-03 01:23:21'),
(52, 16, 8, '2021-02-03 07:25:09', '2021-02-03 01:25:09'),
(53, 16, 2, '2021-02-03 07:25:09', '2021-02-03 01:25:09'),
(54, 16, 1, '2021-02-03 07:25:09', '2021-02-03 01:25:09'),
(55, 17, 9, '2021-02-03 07:26:13', '2021-02-03 01:26:13'),
(56, 17, 2, '2021-02-03 07:26:13', '2021-02-03 01:26:13'),
(57, 17, 1, '2021-02-03 07:26:13', '2021-02-03 01:26:13'),
(58, 18, 9, '2021-02-03 07:27:35', '2021-02-03 01:27:35'),
(59, 18, 2, '2021-02-03 07:27:35', '2021-02-03 01:27:35'),
(60, 18, 1, '2021-02-03 07:27:35', '2021-02-03 01:27:35'),
(61, 19, 9, '2021-02-03 07:28:18', '2021-02-03 01:28:18'),
(62, 19, 2, '2021-02-03 07:28:18', '2021-02-03 01:28:18'),
(63, 19, 1, '2021-02-03 07:28:18', '2021-02-03 01:28:18'),
(67, 20, 10, '2021-02-03 07:30:46', '2021-02-03 01:30:46'),
(68, 20, 2, '2021-02-03 07:30:46', '2021-02-03 01:30:46'),
(69, 20, 1, '2021-02-03 07:30:46', '2021-02-03 01:30:46'),
(70, 21, 10, '2021-02-03 07:31:36', '2021-02-03 01:31:36'),
(71, 21, 2, '2021-02-03 07:31:36', '2021-02-03 01:31:36'),
(72, 21, 1, '2021-02-03 07:31:36', '2021-02-03 01:31:36'),
(73, 22, 10, '2021-02-03 07:32:28', '2021-02-03 01:32:28'),
(74, 22, 2, '2021-02-03 07:32:28', '2021-02-03 01:32:28'),
(75, 22, 1, '2021-02-03 07:32:28', '2021-02-03 01:32:28'),
(76, 23, 10, '2021-02-03 07:34:01', '2021-02-03 01:34:01'),
(77, 23, 2, '2021-02-03 07:34:01', '2021-02-03 01:34:01'),
(78, 23, 1, '2021-02-03 07:34:01', '2021-02-03 01:34:01'),
(79, 24, 10, '2021-02-03 07:35:21', '2021-02-03 01:35:21'),
(80, 24, 2, '2021-02-03 07:35:21', '2021-02-03 01:35:21'),
(81, 24, 1, '2021-02-03 07:35:21', '2021-02-03 01:35:21'),
(82, 25, 10, '2021-02-03 07:36:15', '2021-02-03 01:36:15'),
(83, 25, 2, '2021-02-03 07:36:15', '2021-02-03 01:36:15'),
(84, 25, 1, '2021-02-03 07:36:15', '2021-02-03 01:36:15'),
(85, 26, 10, '2021-02-03 07:37:08', '2021-02-03 01:37:08'),
(86, 26, 2, '2021-02-03 07:37:08', '2021-02-03 01:37:08'),
(87, 26, 1, '2021-02-03 07:37:08', '2021-02-03 01:37:08'),
(88, 27, 10, '2021-02-03 07:38:01', '2021-02-03 01:38:01'),
(89, 27, 2, '2021-02-03 07:38:01', '2021-02-03 01:38:01'),
(90, 27, 1, '2021-02-03 07:38:01', '2021-02-03 01:38:01'),
(91, 28, 10, '2021-02-03 07:39:20', '2021-02-03 01:39:20'),
(92, 28, 2, '2021-02-03 07:39:20', '2021-02-03 01:39:20'),
(93, 28, 1, '2021-02-03 07:39:20', '2021-02-03 01:39:20'),
(94, 29, 10, '2021-02-03 07:40:00', '2021-02-03 01:40:00'),
(95, 29, 2, '2021-02-03 07:40:00', '2021-02-03 01:40:00'),
(96, 29, 1, '2021-02-03 07:40:00', '2021-02-03 01:40:00'),
(97, 30, 11, '2021-02-03 07:41:55', '2021-02-03 01:41:55'),
(98, 30, 3, '2021-02-03 07:41:55', '2021-02-03 01:41:55'),
(99, 30, 1, '2021-02-03 07:41:55', '2021-02-03 01:41:55'),
(100, 31, 3, '2021-02-03 07:42:34', '2021-02-03 01:42:34'),
(101, 31, 1, '2021-02-03 07:42:34', '2021-02-03 01:42:34'),
(102, 32, 11, '2021-02-03 07:43:22', '2021-02-03 01:43:22'),
(103, 32, 3, '2021-02-03 07:43:22', '2021-02-03 01:43:22'),
(104, 32, 1, '2021-02-03 07:43:22', '2021-02-03 01:43:22'),
(105, 33, 11, '2021-02-03 07:44:35', '2021-02-03 01:44:35'),
(106, 33, 3, '2021-02-03 07:44:35', '2021-02-03 01:44:35'),
(107, 33, 1, '2021-02-03 07:44:35', '2021-02-03 01:44:35'),
(108, 34, 12, '2021-02-03 07:45:50', '2021-02-03 01:45:50'),
(109, 34, 3, '2021-02-03 07:45:50', '2021-02-03 01:45:50'),
(110, 34, 1, '2021-02-03 07:45:50', '2021-02-03 01:45:50'),
(111, 35, 12, '2021-02-03 07:46:32', '2021-02-03 01:46:32'),
(112, 35, 3, '2021-02-03 07:46:32', '2021-02-03 01:46:32'),
(113, 35, 1, '2021-02-03 07:46:32', '2021-02-03 01:46:32'),
(114, 36, 12, '2021-02-03 07:47:13', '2021-02-03 01:47:13'),
(115, 36, 3, '2021-02-03 07:47:13', '2021-02-03 01:47:13'),
(116, 36, 1, '2021-02-03 07:47:13', '2021-02-03 01:47:13'),
(117, 37, 12, '2021-02-03 07:48:29', '2021-02-03 01:48:29'),
(118, 37, 3, '2021-02-03 07:48:29', '2021-02-03 01:48:29'),
(119, 37, 1, '2021-02-03 07:48:29', '2021-02-03 01:48:29'),
(120, 38, 13, '2021-02-03 07:49:17', '2021-02-03 01:49:17'),
(121, 38, 3, '2021-02-03 07:49:17', '2021-02-03 01:49:17'),
(122, 38, 1, '2021-02-03 07:49:17', '2021-02-03 01:49:17'),
(123, 39, 13, '2021-02-03 07:49:57', '2021-02-03 01:49:57'),
(124, 39, 3, '2021-02-03 07:49:57', '2021-02-03 01:49:57'),
(125, 39, 1, '2021-02-03 07:49:57', '2021-02-03 01:49:57'),
(126, 40, 13, '2021-02-03 07:50:28', '2021-02-03 01:50:28'),
(127, 40, 3, '2021-02-03 07:50:28', '2021-02-03 01:50:28'),
(128, 40, 1, '2021-02-03 07:50:28', '2021-02-03 01:50:28'),
(129, 41, 13, '2021-02-03 07:51:23', '2021-02-03 01:51:23'),
(130, 41, 3, '2021-02-03 07:51:23', '2021-02-03 01:51:23'),
(131, 41, 1, '2021-02-03 07:51:23', '2021-02-03 01:51:23'),
(132, 42, 14, '2021-02-03 07:52:18', '2021-02-03 01:52:18'),
(133, 42, 3, '2021-02-03 07:52:18', '2021-02-03 01:52:18'),
(134, 42, 1, '2021-02-03 07:52:18', '2021-02-03 01:52:18'),
(135, 43, 14, '2021-02-03 07:52:51', '2021-02-03 01:52:51'),
(136, 43, 3, '2021-02-03 07:52:51', '2021-02-03 01:52:51'),
(137, 43, 1, '2021-02-03 07:52:51', '2021-02-03 01:52:51'),
(138, 44, 14, '2021-02-03 07:53:23', '2021-02-03 01:53:23'),
(139, 44, 3, '2021-02-03 07:53:23', '2021-02-03 01:53:23'),
(140, 44, 1, '2021-02-03 07:53:23', '2021-02-03 01:53:23'),
(141, 45, 14, '2021-02-03 07:54:07', '2021-02-03 01:54:07'),
(142, 45, 3, '2021-02-03 07:54:07', '2021-02-03 01:54:07'),
(143, 45, 1, '2021-02-03 07:54:07', '2021-02-03 01:54:07'),
(144, 46, 15, '2021-02-03 07:55:01', '2021-02-03 01:55:01'),
(145, 46, 3, '2021-02-03 07:55:01', '2021-02-03 01:55:01'),
(146, 46, 1, '2021-02-03 07:55:01', '2021-02-03 01:55:01'),
(147, 47, 15, '2021-02-03 07:55:32', '2021-02-03 01:55:32'),
(148, 47, 3, '2021-02-03 07:55:32', '2021-02-03 01:55:32'),
(149, 47, 1, '2021-02-03 07:55:33', '2021-02-03 01:55:33'),
(150, 48, 15, '2021-02-03 07:56:17', '2021-02-03 01:56:17'),
(151, 48, 3, '2021-02-03 07:56:17', '2021-02-03 01:56:17'),
(152, 48, 1, '2021-02-03 07:56:17', '2021-02-03 01:56:17'),
(153, 49, 15, '2021-02-03 07:56:56', '2021-02-03 01:56:56'),
(154, 49, 3, '2021-02-03 07:56:56', '2021-02-03 01:56:56'),
(155, 49, 1, '2021-02-03 07:56:56', '2021-02-03 01:56:56'),
(156, 50, 15, '2021-02-03 07:57:41', '2021-02-03 01:57:41'),
(157, 50, 3, '2021-02-03 07:57:41', '2021-02-03 01:57:41'),
(158, 50, 1, '2021-02-03 07:57:41', '2021-02-03 01:57:41'),
(159, 51, 15, '2021-02-03 07:58:31', '2021-02-03 01:58:31'),
(160, 51, 3, '2021-02-03 07:58:31', '2021-02-03 01:58:31'),
(161, 51, 1, '2021-02-03 07:58:31', '2021-02-03 01:58:31'),
(162, 52, 15, '2021-02-03 07:59:08', '2021-02-03 01:59:08'),
(163, 52, 3, '2021-02-03 07:59:08', '2021-02-03 01:59:08'),
(164, 52, 1, '2021-02-03 07:59:08', '2021-02-03 01:59:08'),
(165, 53, 15, '2021-02-03 07:59:44', '2021-02-03 01:59:44'),
(166, 53, 3, '2021-02-03 07:59:44', '2021-02-03 01:59:44'),
(167, 53, 1, '2021-02-03 07:59:44', '2021-02-03 01:59:44'),
(168, 54, 15, '2021-02-03 08:00:18', '2021-02-03 02:00:18'),
(169, 54, 3, '2021-02-03 08:00:18', '2021-02-03 02:00:18'),
(170, 54, 1, '2021-02-03 08:00:18', '2021-02-03 02:00:18'),
(171, 55, 15, '2021-02-03 08:03:16', '2021-02-03 02:03:16'),
(172, 55, 3, '2021-02-03 08:03:16', '2021-02-03 02:03:16'),
(173, 55, 1, '2021-02-03 08:03:16', '2021-02-03 02:03:16'),
(174, 56, 21, '2021-02-03 08:07:16', '2021-02-03 02:07:16'),
(175, 56, 16, '2021-02-03 08:07:16', '2021-02-03 02:07:16'),
(176, 56, 4, '2021-02-03 08:07:16', '2021-02-03 02:07:16'),
(177, 56, 1, '2021-02-03 08:07:16', '2021-02-03 02:07:16'),
(178, 57, 21, '2021-02-03 08:07:51', '2021-02-03 02:07:51'),
(179, 57, 16, '2021-02-03 08:07:51', '2021-02-03 02:07:51'),
(180, 57, 4, '2021-02-03 08:07:51', '2021-02-03 02:07:51'),
(181, 57, 1, '2021-02-03 08:07:51', '2021-02-03 02:07:51'),
(182, 58, 21, '2021-02-03 08:08:39', '2021-02-03 02:08:39'),
(183, 58, 16, '2021-02-03 08:08:39', '2021-02-03 02:08:39'),
(184, 58, 4, '2021-02-03 08:08:39', '2021-02-03 02:08:39'),
(185, 58, 1, '2021-02-03 08:08:39', '2021-02-03 02:08:39'),
(186, 59, 21, '2021-02-03 08:09:18', '2021-02-03 02:09:18'),
(187, 59, 16, '2021-02-03 08:09:18', '2021-02-03 02:09:18'),
(188, 59, 4, '2021-02-03 08:09:18', '2021-02-03 02:09:18'),
(189, 59, 1, '2021-02-03 08:09:18', '2021-02-03 02:09:18'),
(190, 60, 19, '2021-02-03 08:11:38', '2021-02-03 02:11:38'),
(191, 60, 16, '2021-02-03 08:11:38', '2021-02-03 02:11:38'),
(192, 60, 4, '2021-02-03 08:11:38', '2021-02-03 02:11:38'),
(193, 60, 1, '2021-02-03 08:11:38', '2021-02-03 02:11:38'),
(194, 61, 19, '2021-02-03 08:12:16', '2021-02-03 02:12:16'),
(195, 61, 16, '2021-02-03 08:12:16', '2021-02-03 02:12:16'),
(196, 61, 4, '2021-02-03 08:12:16', '2021-02-03 02:12:16'),
(197, 61, 1, '2021-02-03 08:12:16', '2021-02-03 02:12:16'),
(198, 62, 19, '2021-02-03 08:12:52', '2021-02-03 02:12:52'),
(199, 62, 16, '2021-02-03 08:12:52', '2021-02-03 02:12:52'),
(200, 62, 4, '2021-02-03 08:12:52', '2021-02-03 02:12:52'),
(201, 62, 1, '2021-02-03 08:12:52', '2021-02-03 02:12:52'),
(202, 63, 22, '2021-02-03 08:14:12', '2021-02-03 02:14:12'),
(203, 63, 16, '2021-02-03 08:14:12', '2021-02-03 02:14:12'),
(204, 63, 4, '2021-02-03 08:14:12', '2021-02-03 02:14:12'),
(205, 63, 1, '2021-02-03 08:14:12', '2021-02-03 02:14:12'),
(206, 64, 22, '2021-02-03 08:14:49', '2021-02-03 02:14:49'),
(207, 64, 16, '2021-02-03 08:14:49', '2021-02-03 02:14:49'),
(208, 64, 4, '2021-02-03 08:14:49', '2021-02-03 02:14:49'),
(209, 64, 1, '2021-02-03 08:14:49', '2021-02-03 02:14:49'),
(210, 65, 24, '2021-02-03 08:15:20', '2021-02-03 02:15:20'),
(211, 65, 17, '2021-02-03 08:15:20', '2021-02-03 02:15:20'),
(212, 65, 4, '2021-02-03 08:15:20', '2021-02-03 02:15:20'),
(213, 65, 1, '2021-02-03 08:15:20', '2021-02-03 02:15:20'),
(214, 66, 22, '2021-02-03 08:15:55', '2021-02-03 02:15:55'),
(215, 66, 16, '2021-02-03 08:15:55', '2021-02-03 02:15:55'),
(216, 66, 4, '2021-02-03 08:15:55', '2021-02-03 02:15:55'),
(217, 66, 1, '2021-02-03 08:15:55', '2021-02-03 02:15:55'),
(218, 67, 24, '2021-02-03 08:18:30', '2021-02-03 02:18:30'),
(219, 67, 17, '2021-02-03 08:18:30', '2021-02-03 02:18:30'),
(220, 67, 4, '2021-02-03 08:18:30', '2021-02-03 02:18:30'),
(221, 67, 1, '2021-02-03 08:18:30', '2021-02-03 02:18:30'),
(222, 68, 24, '2021-02-03 08:19:01', '2021-02-03 02:19:01'),
(223, 68, 17, '2021-02-03 08:19:01', '2021-02-03 02:19:01'),
(224, 68, 4, '2021-02-03 08:19:01', '2021-02-03 02:19:01'),
(225, 68, 1, '2021-02-03 08:19:01', '2021-02-03 02:19:01'),
(226, 69, 24, '2021-02-03 08:19:38', '2021-02-03 02:19:38'),
(227, 69, 17, '2021-02-03 08:19:38', '2021-02-03 02:19:38'),
(228, 69, 4, '2021-02-03 08:19:38', '2021-02-03 02:19:38'),
(229, 69, 1, '2021-02-03 08:19:38', '2021-02-03 02:19:38'),
(230, 70, 24, '2021-02-03 08:20:16', '2021-02-03 02:20:16'),
(231, 70, 17, '2021-02-03 08:20:16', '2021-02-03 02:20:16'),
(232, 70, 4, '2021-02-03 08:20:16', '2021-02-03 02:20:16'),
(233, 70, 1, '2021-02-03 08:20:16', '2021-02-03 02:20:16'),
(234, 71, 24, '2021-02-03 08:21:02', '2021-02-03 02:21:02'),
(235, 71, 17, '2021-02-03 08:21:02', '2021-02-03 02:21:02'),
(236, 71, 4, '2021-02-03 08:21:02', '2021-02-03 02:21:02'),
(237, 71, 1, '2021-02-03 08:21:02', '2021-02-03 02:21:02'),
(238, 72, 23, '2021-02-03 08:22:23', '2021-02-03 02:22:23'),
(239, 72, 17, '2021-02-03 08:22:23', '2021-02-03 02:22:23'),
(240, 72, 4, '2021-02-03 08:22:23', '2021-02-03 02:22:23'),
(241, 72, 1, '2021-02-03 08:22:23', '2021-02-03 02:22:23'),
(242, 73, 23, '2021-02-03 08:23:00', '2021-02-03 02:23:00'),
(243, 73, 17, '2021-02-03 08:23:00', '2021-02-03 02:23:00'),
(244, 73, 4, '2021-02-03 08:23:00', '2021-02-03 02:23:00'),
(245, 73, 1, '2021-02-03 08:23:00', '2021-02-03 02:23:00'),
(246, 74, 23, '2021-02-03 08:23:35', '2021-02-03 02:23:35'),
(247, 74, 17, '2021-02-03 08:23:35', '2021-02-03 02:23:35'),
(248, 74, 4, '2021-02-03 08:23:35', '2021-02-03 02:23:35'),
(249, 74, 1, '2021-02-03 08:23:35', '2021-02-03 02:23:35'),
(250, 75, 23, '2021-02-03 08:24:21', '2021-02-03 02:24:21'),
(251, 75, 17, '2021-02-03 08:24:21', '2021-02-03 02:24:21'),
(252, 75, 4, '2021-02-03 08:24:21', '2021-02-03 02:24:21'),
(253, 75, 1, '2021-02-03 08:24:21', '2021-02-03 02:24:21');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `type` enum('dollar_rate') NOT NULL,
  `value` varchar(32) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `type`, `value`, `created`, `modified`) VALUES
(1, 'dollar_rate', '85', '2020-10-01 22:47:30', '2020-10-03 18:55:32');

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
(1, 2, 'admin', 'admin@gmail.com', '12067b026346c847c73a760d39859188', '631408', 'Site', 'Admin', '1570155061.jpg', '', '2013-11-22 18:53:13', '2021-02-03 01:17:52', '0', 1612315072, 1);

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
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
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
-- Indexes for table `settings`
--
ALTER TABLE `settings`
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
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `jilancollection`
--
ALTER TABLE `jilancollection`
  MODIFY `jilancollection_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `jilancollection_category`
--
ALTER TABLE `jilancollection_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=184;

--
-- AUTO_INCREMENT for table `product_relation`
--
ALTER TABLE `product_relation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=254;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `_users`
--
ALTER TABLE `_users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
