-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbsample`
--

-- --------------------------------------------------------

--
-- Table structure for table `allhousing`
--

CREATE TABLE `allhousing` (
  `id` int(11) NOT NULL,
  `owner` int(11) NOT NULL,
  `ownername` varchar(50) NOT NULL,
  `owned` tinyint(4) NOT NULL,
  `price` int(11) NOT NULL,
  `originalprice` int(11) NOT NULL,
  `resalepercent` int(11) NOT NULL,
  `entry` longtext NOT NULL,
  `garage` longtext NOT NULL,
  `furniture` longtext NOT NULL,
  `shell` varchar(50) NOT NULL,
  `shells` longtext NOT NULL,
  `housekeys` longtext NOT NULL,
  `wardrobe` longtext NOT NULL,
  `inventorylocation` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `vrp_factions`
--

CREATE TABLE `vrp_factions` (
  `id` int(11) NOT NULL,
  `factionName` text NOT NULL,
  `MinLevel` int(11) NOT NULL DEFAULT 5,
  `Application` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `vrp_factions` (`id`, `factionName`, `MinLevel`, `Application`) VALUES
(1, 'Politie', 5, 0);

-- --------------------------------------------------------

--
-- Table structure for table `vrp_garages`
--

CREATE TABLE `vrp_garages` (
  `id` int(255) NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `bID` int(11) NOT NULL DEFAULT 0,
  `bColor` int(11) NOT NULL DEFAULT 0,
  `facion` int(11) NOT NULL DEFAULT 0,
  `gtype` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vrp_logs`
--

CREATE TABLE `vrp_logs` (
  `id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `text` text NOT NULL,
  `tip` text DEFAULT NULL,
  `data` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vrp_money_logs`
--

CREATE TABLE `vrp_money_logs` (
  `from_user_id` int(11) NOT NULL,
  `to_user_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vrp_punishlog`
--

CREATE TABLE `vrp_punishlog` (
  `id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `text` text NOT NULL,
  `tip` text DEFAULT NULL,
  `data` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vrp_srv_data`
--

CREATE TABLE `vrp_srv_data` (
  `dkey` varchar(255) NOT NULL DEFAULT '',
  `dvalue` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vrp_turfs`
--

CREATE TABLE `vrp_turfs` (
  `id` int(255) NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `blipColor` int(11) NOT NULL DEFAULT 0,
  `blipRadius` float NOT NULL DEFAULT 110,
  `faction` varchar(50) NOT NULL,
  `isAttacked` varchar(50) NOT NULL DEFAULT 'Nu',
  `attackedBy` varchar(50) NOT NULL DEFAULT 'none',
  `payday` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vrp_users`
--

CREATE TABLE `vrp_users` (
  `id` int(11) NOT NULL,
  `whitelisted` tinyint(1) DEFAULT NULL,
  `username` longtext CHARACTER SET utf8mb4 DEFAULT NULL,
  `hoursPlayed` float NOT NULL DEFAULT 0,
  `adminLvl` int(11) NOT NULL DEFAULT 0,
  `last_login` varchar(255) DEFAULT '''nil''',
  `x` float NOT NULL DEFAULT -537.796,
  `y` float NOT NULL DEFAULT -216.83,
  `z` float NOT NULL DEFAULT 37.6498,
  `faction` varchar(255) NOT NULL DEFAULT 'Civil',
  `factionRank` varchar(255) NOT NULL DEFAULT '''none''',
  `isFactionLeader` varchar(255) NOT NULL DEFAULT '0',
  `IsFactionCoLeader` int(11) NOT NULL,
  `InTransfer` int(11) NOT NULL DEFAULT 0,
  `InTransferTime` int(11) NOT NULL DEFAULT 0,
  `vipLvl` int(11) NOT NULL DEFAULT 0,
  `vipTime` int(100) DEFAULT 0,
  `PortArma` int(11) NOT NULL DEFAULT 0,
  `parmaTime` int(100) DEFAULT 0,
  `WeaponDealer` int(11) NOT NULL DEFAULT 0,
  `WDealerTime` int(11) NOT NULL DEFAULT 0,
  `warns` int(255) NOT NULL DEFAULT 0,
  `warnr1` varchar(255) NOT NULL DEFAULT '''none''',
  `warn1T` int(100) DEFAULT 0,
  `warnid1` varchar(255) NOT NULL DEFAULT '''''''none''''''',
  `warnr2` varchar(255) NOT NULL DEFAULT '''none''',
  `warn2T` int(100) DEFAULT 0,
  `warnid2` varchar(255) NOT NULL DEFAULT '''''''none''''''',
  `warnr3` varchar(255) NOT NULL DEFAULT '''none''',
  `warn3T` int(100) DEFAULT 0,
  `warnid3` varchar(255) NOT NULL DEFAULT '''none''',
  `job` varchar(100) NOT NULL DEFAULT 'Somer',
  `job2` varchar(100) NOT NULL DEFAULT 'Somer2',
  `inreg` int(11) NOT NULL DEFAULT 0,
  `bankMoney` bigint(255) NOT NULL DEFAULT 10000000,
  `walletMoney` bigint(255) NOT NULL DEFAULT 5000000,
  `xzCoins` int(255) NOT NULL DEFAULT 0,
  `chirias` int(11) NOT NULL DEFAULT 0,
  `CarInsurance` varchar(55) NOT NULL DEFAULT 'No',
  `asigAuto` varchar(255) DEFAULT 'Nu',
  `phone` varchar(100) DEFAULT NULL,
  `age` int(11) NOT NULL DEFAULT 18,
  `firstName` varchar(100) NOT NULL DEFAULT '''Nume''',
  `secondName` varchar(100) NOT NULL DEFAULT '''Prenume''',
  `aJailTime` int(255) NOT NULL DEFAULT 0,
  `aJailReason` text DEFAULT NULL,
  `DmvTest` varchar(50) NOT NULL DEFAULT '''0''',
  `grade` varchar(255) DEFAULT NULL,
  `permis` varchar(5) NOT NULL DEFAULT '''Nu''',
  `atmcode` int(30) DEFAULT 1234,
  `bizLim` int(10) NOT NULL DEFAULT 5,
  `pet` varchar(50) DEFAULT NULL,
  `skin` longtext DEFAULT NULL,
  `banned` tinyint(1) DEFAULT 0,
  `bannedTemp` int(255) DEFAULT 0,
  `bannedBy` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bannedReason` text DEFAULT NULL,
  `BanTempZile` int(255) NOT NULL DEFAULT 0,
  `BanTempData` varchar(255) DEFAULT NULL,
  `BanTempExpire` varchar(255) DEFAULT NULL,
  `finalSansa` int(11) NOT NULL DEFAULT 0,
  `tickete` int(30) DEFAULT 0,
  `mute` int(30) DEFAULT 0,
  `intrebari` int(30) DEFAULT 0,
  `jail` int(30) DEFAULT 0,
  `banuri` int(30) DEFAULT 0,
  `FactionWarns` int(255) NOT NULL DEFAULT 0,
  `Fwarnr1` varchar(255) NOT NULL DEFAULT '''none''',
  `Fwarnid1` varchar(255) NOT NULL DEFAULT '''none''',
  `Fwarn1T` int(100) DEFAULT 0,
  `Fwarnr2` varchar(255) NOT NULL DEFAULT '''none''',
  `Fwarnid2` varchar(255) NOT NULL DEFAULT '''none''',
  `Fwarn2T` int(100) DEFAULT 0,
  `Fwarnr3` varchar(255) NOT NULL DEFAULT '''none''',
  `Fwarnid3` varchar(255) NOT NULL DEFAULT '''none''',
  `Fwarn3T` int(100) DEFAULT 0,
  `FfinalSansa` int(11) NOT NULL DEFAULT 0,
  `panel_code` varchar(64) NOT NULL DEFAULT 'none',
  `Status` int(11) NOT NULL DEFAULT 0,
  `Nickname` varchar(128) DEFAULT NULL,
  `Password` varchar(128) DEFAULT NULL,
  `Email` varchar(198) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `remember_token` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;


INSERT INTO `vrp_users` (`id`, `whitelisted`, `username`, `hoursPlayed`, `adminLvl`, `last_login`, `x`, `y`, `z`, `faction`, `factionRank`, `isFactionLeader`, `IsFactionCoLeader`, `InTransfer`, `InTransferTime`, `vipLvl`, `vipTime`, `PortArma`, `parmaTime`, `WeaponDealer`, `WDealerTime`, `warns`, `warnr1`, `warn1T`, `warnid1`, `warnr2`, `warn2T`, `warnid2`, `warnr3`, `warn3T`, `warnid3`, `job`, `job2`, `inreg`, `bankMoney`, `walletMoney`, `xzCoins`, `chirias`, `CarInsurance`, `asigAuto`, `phone`, `age`, `firstName`, `secondName`, `aJailTime`, `aJailReason`, `DmvTest`, `grade`, `permis`, `atmcode`, `bizLim`, `pet`, `skin`, `banned`, `bannedTemp`, `bannedBy`, `bannedReason`, `BanTempZile`, `BanTempData`, `BanTempExpire`, `finalSansa`, `tickete`, `mute`, `intrebari`, `jail`, `banuri`, `FactionWarns`, `Fwarnr1`, `Fwarnid1`, `Fwarn1T`, `Fwarnr2`, `Fwarnid2`, `Fwarn2T`, `Fwarnr3`, `Fwarnid3`, `Fwarn3T`, `FfinalSansa`, `panel_code`, `Status`, `Nickname`, `Password`, `Email`, `updated_at`, `remember_token`) VALUES
(1, NULL, 'wcode', 0, 9, '\'nil\'', -537.796, -216.83, 37.6498, 'Civil', '\'none\'', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '\'none\'', 0, '\'\'\'none\'\'\'', '\'none\'', 0, '\'\'\'none\'\'\'', '\'none\'', 0, '\'none\'', 'Somer', 'Somer2', 0, 10000000, 5000000, 0, 0, 'No', 'Nu', NULL, 18, '\'Nume\'', '\'Prenume\'', 0, NULL, '\'0\'', NULL, '\'Nu\'', 1234, 5, NULL, NULL, 0, 0, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, '\'none\'', '\'none\'', 0, '\'none\'', '\'none\'', 0, '\'none\'', '\'none\'', 0, 0, 'none', 0, 'wcode', '4a9e3584d56171f02941acf184f3c2c5', NULL, '2022-04-01 20:18:26', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vrp_user_business`
--

CREATE TABLE `vrp_user_business` (
  `user_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(30) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `capital` int(11) DEFAULT NULL,
  `laundered` int(11) DEFAULT NULL,
  `reset_timestamp` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vrp_user_data`
--

CREATE TABLE `vrp_user_data` (
  `user_id` int(11) NOT NULL DEFAULT 0,
  `dkey` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `dvalue` longtext CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vrp_user_homes`
--

CREATE TABLE `vrp_user_homes` (
  `user_id` int(11) NOT NULL DEFAULT 0,
  `home` varchar(255) NOT NULL,
  `number` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vrp_user_identities`
--

CREATE TABLE `vrp_user_identities` (
  `user_id` int(11) NOT NULL,
  `registration` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `age` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vrp_user_ids`
--

CREATE TABLE `vrp_user_ids` (
  `id` int(255) NOT NULL,
  `identifier` varchar(255) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vrp_user_vehicles`
--

CREATE TABLE `vrp_user_vehicles` (
  `user_id` int(255) NOT NULL,
  `vehicle` varchar(255) NOT NULL,
  `deVanzare` varchar(255) NOT NULL DEFAULT '0',
  `vehicle_type` varchar(255) DEFAULT NULL,
  `vehicle_plate` varchar(255) DEFAULT NULL,
  `upgrades` text DEFAULT NULL,
  `impounded` int(11) NOT NULL DEFAULT 0,
  `veh_type` varchar(255) NOT NULL DEFAULT 'default',
  `ats` text DEFAULT NULL,
  `blocata` int(50) NOT NULL DEFAULT 0,
  `houseNumber` int(10) NOT NULL DEFAULT 0,
  `stage` int(50) DEFAULT 0,
  `storedhouse` varchar(255) DEFAULT '0',
  `garage` int(11) NOT NULL,
  `vehname` int(11) NOT NULL,
  `isFactionCoLeader` int(11) NOT NULL,
  `insurance` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wc_applications`
--

CREATE TABLE `wc_applications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `questions` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `faction_id` int(11) NOT NULL DEFAULT 0,
  `faction_name` varchar(128) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `modified_by` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` varchar(64) DEFAULT NULL,
  `action` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wc_comments`
--

CREATE TABLE `wc_comments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `user_comment` text NOT NULL,
  `topic_id` int(11) NOT NULL DEFAULT 0,
  `topic_category` varchar(64) NOT NULL DEFAULT '-1',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `comment_deleted` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wc_complaints`
--

CREATE TABLE `wc_complaints` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `user_name` varchar(128) DEFAULT NULL,
  `accused_id` int(11) NOT NULL DEFAULT 0,
  `accused_name` varchar(128) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `category` varchar(64) NOT NULL DEFAULT 'Other',
  `status` int(11) DEFAULT 0,
  `action` varchar(64) DEFAULT NULL,
  `faction_id` int(11) NOT NULL DEFAULT 0,
  `owner` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wc_grades`
--

CREATE TABLE `wc_grades` (
  `id` int(11) NOT NULL,
  `grade_name` varchar(128) NOT NULL,
  `grade_level` int(11) NOT NULL DEFAULT 0,
  `grade_category` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wc_logs`
--

CREATE TABLE `wc_logs` (
  `id` int(11) NOT NULL,
  `target_id` int(11) NOT NULL DEFAULT -99,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `category` varchar(128) DEFAULT NULL,
  `log` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wc_notifications`
--

CREATE TABLE `wc_notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `user_name` varchar(64) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `trigger_id` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `seen` int(11) NOT NULL DEFAULT 0,
  `link` varchar(256) NOT NULL DEFAULT '#'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wc_options`
--

CREATE TABLE `wc_options` (
  `id` int(11) NOT NULL,
  `content` text DEFAULT NULL,
  `additional` text DEFAULT NULL,
  `structure` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wc_options`
--

INSERT INTO `wc_options` (`id`, `content`, `additional`, `structure`, `created_at`, `updated_at`) VALUES
(8, '[\"test\"]', NULL, 'admin', '2020-08-22 20:51:15', '2021-03-26 03:10:38'),
(9, '[\"tteest\"]', NULL, 'leader', '2020-08-22 20:51:27', '2021-03-26 03:10:53'),
(10, '[\"test\"]', NULL, 'helper', '2020-08-22 20:51:40', '2021-03-26 03:10:45'),
(33, '[\"test\"]', '4', 'faction', '2022-03-08 13:48:32', '2022-03-08 13:48:32');

-- --------------------------------------------------------

--
-- Table structure for table `wc_recruitment`
--

CREATE TABLE `wc_recruitment` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT -1,
  `content` text DEFAULT NULL,
  `category` varchar(32) DEFAULT NULL,
  `faction_id` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wc_redeem_account`
--

CREATE TABLE `wc_redeem_account` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `code` varchar(128) DEFAULT NULL,
  `token` varchar(128) DEFAULT NULL,
  `email` varchar(258) DEFAULT NULL,
  `nickname` varchar(128) DEFAULT NULL,
  `password` text DEFAULT NULL,
  `pending` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `activated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wc_settings`
--

CREATE TABLE `wc_settings` (
  `id` int(11) NOT NULL,
  `count` int(11) NOT NULL DEFAULT 0,
  `function` varchar(128) NOT NULL,
  `system` varchar(256) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wc_settings`
--

INSERT INTO `wc_settings` (`id`, `count`, `function`, `system`, `created_at`, `updated_at`) VALUES
(1, 0, 'Player abuse', 'complaint_category', '2020-06-27 19:36:37', '2021-04-02 10:52:44'),
(2, 0, 'Deathmatch', 'complaint_category', '2020-06-27 19:37:34', '2020-06-27 19:37:40'),
(3, 1, 'Faction abuse', 'complaint_category', '2020-06-27 19:38:45', '2021-04-02 10:52:32'),
(4, 2, 'Admin abuse', 'complaint_category', '2020-06-27 20:04:07', '2021-04-02 10:52:42'),
(5, 0, '<span class=\"label label-light-info\">Scazuta</span>', 'ticket_category', '2020-06-29 07:32:26', '2021-04-02 10:24:11'),
(6, 1, '<span class=\"label label-light-warning\">Medie</span>', 'ticket_category', '2020-06-29 07:32:47', '2021-04-02 10:24:15'),
(7, 2, '<span class=\"badge badge-danger\">Ridicata</span>', 'ticket_category', '2020-06-29 07:32:47', '2021-04-02 10:24:08'),
(8, 0, '<span class=\"label label-light-primary\">Deschis</span>', 'ticket_status', '2020-06-29 08:34:59', '2021-04-02 10:45:06'),
(9, 1, '<span class=\"label label-light-inverse\">Inchis</span>', 'ticket_status', '2020-06-29 08:35:16', '2021-04-02 10:45:12'),
(10, 2, '<span class=\"badge badge-danger\">Arhivat</span>', 'ticket_status', '2020-06-30 07:40:17', '2021-04-02 10:45:19'),
(11, 0, '<span class=\"label label-light-primary\">Deschisa</span>', 'complaint_status', '2020-07-01 06:08:15', '2021-04-02 10:45:30'),
(12, 1, '<span class=\"label label-light-inverse\">Inchisa</span>', 'complaint_status', '2020-07-01 06:08:54', '2021-04-02 10:45:35'),
(13, 2, '<span class=\"badge badge-danger\">Arhivata</span>', 'complaint_status', '2020-07-01 06:09:21', '2021-04-02 10:45:41'),
(14, 0, '<span class=\"label label-light-primary\">In asteptare</span>', 'unban_status', '2020-06-29 08:34:59', '2021-04-02 10:45:47'),
(15, 2, '<span class=\"label label-light-inverse\">Respinsa</span>', 'unban_status', '2020-06-29 08:35:16', '2021-04-02 10:46:02'),
(16, 1, '<span class=\"badge badge-success\">Acceptata</span>', 'unban_status', '2020-06-30 07:40:17', '2021-04-02 10:45:59'),
(17, 3, '<span class=\"badge badge-danger\">Arhivata</span>', 'unban_status', '2020-06-30 07:40:17', '2021-04-02 10:46:07'),
(18, 0, '<span class=\"label label-light-primary\">In asteptare</span>', 'application_status', '2020-07-04 19:26:00', '2021-04-02 10:46:13'),
(19, 1, '<span class=\"badge badge-warning\">Acceptat pentru teste</span>', 'application_status', '2020-07-04 19:26:00', '2021-04-02 10:46:22'),
(20, 2, '<span class=\"badge badge-success\">Acceptat</span>', 'application_status', '2020-07-04 19:26:34', '2021-04-02 10:46:27'),
(21, 3, '<span class=\"label label-light-inverse\">Respins</span>', 'application_status', '2020-07-04 19:26:34', '2021-04-02 10:46:33'),
(22, 4, '<span class=\"badge badge-danger\">Arhivat</span>', 'application_status', '2020-07-04 19:27:01', '2021-04-02 10:46:37'),
(23, 0, '<span class=\"label label-light-primary\">In asteptare</span>', 'recruitment_status', '2020-07-04 19:26:00', '2021-04-02 10:46:49'),
(24, 1, '<span class=\"badge badge-success\">Acceptat</span>', 'recruitment_status', '2020-07-04 19:26:34', '2021-04-02 10:47:08'),
(25, 2, '<span class=\"label label-light-inverse\">Respins</span>', 'recruitment_status', '2020-07-04 19:26:34', '2021-04-02 10:47:13'),
(26, 3, '<span class=\"badge badge-danger\">Arhivat</span>', 'recruitment_status', '2020-07-04 19:27:01', '2021-04-02 10:47:28'),
(27, 1, '', 'status_recruitment_admin', '2020-08-23 03:29:32', '2021-03-26 03:11:20'),
(28, 1, '', 'status_recruitment_leader', '2020-08-23 03:29:32', '2021-03-12 21:16:41'),
(29, 1, '', 'status_recruitment_helper', '2020-08-23 03:29:32', '2021-03-26 22:50:16'),
(30, 0, '', 'ip_safety', '2020-08-23 03:29:32', '2021-03-26 22:50:16');

-- --------------------------------------------------------

--
-- Table structure for table `wc_tags`
--

CREATE TABLE `wc_tags` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `user_name` varchar(64) DEFAULT NULL,
  `tag_name` varchar(64) DEFAULT NULL,
  `icon` varchar(16) DEFAULT 'ti ti-user',
  `color` varchar(16) NOT NULL DEFAULT '#FFFFFF',
  `color_font` varchar(16) NOT NULL DEFAULT '#FFFFFF',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wc_tickets`
--

CREATE TABLE `wc_tickets` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `title` text DEFAULT NULL,
  `text` text DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` varchar(64) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `category` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wc_token`
--

CREATE TABLE `wc_token` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `email` varchar(256) DEFAULT NULL,
  `token` varchar(128) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deactivated` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wc_unbans`
--

CREATE TABLE `wc_unbans` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `user_name` varchar(64) DEFAULT NULL,
  `ban_type` varchar(64) DEFAULT NULL,
  `ban_time` timestamp NULL DEFAULT NULL,
  `ban_details` text DEFAULT NULL,
  `content` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` varchar(64) DEFAULT NULL,
  `action` varchar(256) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wc_updates`
--

CREATE TABLE `wc_updates` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `update_version` text DEFAULT NULL,
  `update_text` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `vrp_factions`
--
ALTER TABLE `vrp_factions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vrp_garages`
--
ALTER TABLE `vrp_garages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `vrp_logs`
--
ALTER TABLE `vrp_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `id` (`id`);
ALTER TABLE `vrp_logs` ADD FULLTEXT KEY `text` (`text`);

--
-- Indexes for table `vrp_money_logs`
--
ALTER TABLE `vrp_money_logs`
  ADD PRIMARY KEY (`from_user_id`,`to_user_id`,`amount`,`time`);

--
-- Indexes for table `vrp_punishlog`
--
ALTER TABLE `vrp_punishlog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);
ALTER TABLE `vrp_punishlog` ADD FULLTEXT KEY `tip` (`tip`);

--
-- Indexes for table `vrp_srv_data`
--
ALTER TABLE `vrp_srv_data`
  ADD PRIMARY KEY (`dkey`);

--
-- Indexes for table `vrp_turfs`
--
ALTER TABLE `vrp_turfs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vrp_users`
--
ALTER TABLE `vrp_users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `id` (`id`),
  ADD KEY `bankMoney` (`bankMoney`,`walletMoney`),
  ADD KEY `bankMoney_2` (`bankMoney`,`walletMoney`);

--
-- Indexes for table `vrp_user_business`
--
ALTER TABLE `vrp_user_business`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `vrp_user_data`
--
ALTER TABLE `vrp_user_data`
  ADD PRIMARY KEY (`user_id`,`dkey`);

--
-- Indexes for table `vrp_user_homes`
--
ALTER TABLE `vrp_user_homes`
  ADD PRIMARY KEY (`user_id`,`home`);

--
-- Indexes for table `vrp_user_identities`
--
ALTER TABLE `vrp_user_identities`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `fk_user_identities_users` (`user_id`);

--
-- Indexes for table `vrp_user_ids`
--
ALTER TABLE `vrp_user_ids`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_2` (`id`),
  ADD KEY `fk_user_ids_users` (`user_id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `vrp_user_vehicles`
--
ALTER TABLE `vrp_user_vehicles`
  ADD PRIMARY KEY (`user_id`,`vehicle`);

--
-- Indexes for table `wc_applications`
--
ALTER TABLE `wc_applications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wc_comments`
--
ALTER TABLE `wc_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wc_complaints`
--
ALTER TABLE `wc_complaints`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wc_grades`
--
ALTER TABLE `wc_grades`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wc_logs`
--
ALTER TABLE `wc_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wc_notifications`
--
ALTER TABLE `wc_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wc_options`
--
ALTER TABLE `wc_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wc_recruitment`
--
ALTER TABLE `wc_recruitment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wc_redeem_account`
--
ALTER TABLE `wc_redeem_account`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wc_settings`
--
ALTER TABLE `wc_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wc_tags`
--
ALTER TABLE `wc_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wc_tickets`
--
ALTER TABLE `wc_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wc_token`
--
ALTER TABLE `wc_token`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wc_unbans`
--
ALTER TABLE `wc_unbans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wc_updates`
--
ALTER TABLE `wc_updates`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `vrp_factions`
--
ALTER TABLE `vrp_factions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vrp_garages`
--
ALTER TABLE `vrp_garages`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vrp_logs`
--
ALTER TABLE `vrp_logs`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vrp_punishlog`
--
ALTER TABLE `vrp_punishlog`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vrp_turfs`
--
ALTER TABLE `vrp_turfs`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vrp_users`
--
ALTER TABLE `vrp_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vrp_user_ids`
--
ALTER TABLE `vrp_user_ids`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vrp_user_vehicles`
--
ALTER TABLE `vrp_user_vehicles`
  MODIFY `user_id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wc_applications`
--
ALTER TABLE `wc_applications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wc_comments`
--
ALTER TABLE `wc_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wc_complaints`
--
ALTER TABLE `wc_complaints`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wc_grades`
--
ALTER TABLE `wc_grades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wc_logs`
--
ALTER TABLE `wc_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wc_notifications`
--
ALTER TABLE `wc_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wc_options`
--
ALTER TABLE `wc_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `wc_recruitment`
--
ALTER TABLE `wc_recruitment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wc_redeem_account`
--
ALTER TABLE `wc_redeem_account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wc_settings`
--
ALTER TABLE `wc_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `wc_tags`
--
ALTER TABLE `wc_tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wc_tickets`
--
ALTER TABLE `wc_tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wc_token`
--
ALTER TABLE `wc_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wc_unbans`
--
ALTER TABLE `wc_unbans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wc_updates`
--
ALTER TABLE `wc_updates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `vrp_user_identities`
--
ALTER TABLE `vrp_user_identities`
  ADD CONSTRAINT `fk_user_identities_users` FOREIGN KEY (`user_id`) REFERENCES `vrp_users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
