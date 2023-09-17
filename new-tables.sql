-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 12, 2021 at 10:55 AM
-- Server version: 5.7.32-0ubuntu0.18.04.1
-- PHP Version: 7.2.24-0ubuntu0.18.04.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
-- Table structure for table `wc_applications`
--

CREATE TABLE `wc_applications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `questions` text,
  `description` text,
  `faction_id` int(11) NOT NULL DEFAULT '0',
  `faction_name` varchar(128) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(64) DEFAULT NULL,
  `action` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wc_comments`
--

CREATE TABLE `wc_comments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `user_comment` text NOT NULL,
  `topic_id` int(11) NOT NULL DEFAULT '0',
  `topic_category` varchar(64) NOT NULL DEFAULT '-1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `comment_deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wc_complaints`
--

CREATE TABLE `wc_complaints` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `user_name` varchar(128) DEFAULT NULL,
  `accused_id` int(11) NOT NULL DEFAULT '0',
  `accused_name` varchar(128) DEFAULT NULL,
  `content` text,
  `category` varchar(64) NOT NULL DEFAULT 'Other',
  `status` int(11) DEFAULT '0',
  `action` varchar(64) DEFAULT NULL,
  `faction_id` int(11) NOT NULL DEFAULT '0',
  `owner` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wc_grades`
--

CREATE TABLE `wc_grades` (
  `id` int(11) NOT NULL,
  `grade_name` varchar(128) NOT NULL,
  `grade_level` int(11) NOT NULL DEFAULT '0',
  `grade_category` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wc_grades`
--

INSERT INTO `wc_grades` (`id`, `grade_name`, `grade_level`, `grade_category`) VALUES
(1, 'Co-Fondator', 7, 'admin'),
(2, 'Developer', 6, 'admin'),
(3, 'Administrator', 5, 'admin'),
(4, 'Super-Moderator', 4, 'admin'),
(5, 'Moderator', 3, 'admin'),
(6, 'Helper', 2, 'admin'),
(7, 'Helper Teste', 1, 'admin'),
(8, 'No Admin', 0, 'admin'),
(9, 'Fondator', 9, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `wc_logs`
--

CREATE TABLE `wc_logs` (
  `id` int(11) NOT NULL,
  `target_id` int(11) NOT NULL DEFAULT '-99',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `category` varchar(128) DEFAULT NULL,
  `log` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wc_notifications`
--

CREATE TABLE `wc_notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `user_name` varchar(64) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `content` text,
  `trigger_id` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `seen` int(11) NOT NULL DEFAULT '0',
  `link` varchar(256) NOT NULL DEFAULT '#'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wc_options`
--

CREATE TABLE `wc_options` (
  `id` int(11) NOT NULL,
  `content` text,
  `additional` text,
  `structure` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wc_options`
--

INSERT INTO `wc_options` (`id`, `content`, `additional`, `structure`, `created_at`, `updated_at`) VALUES
(8, '[\"test\"]', NULL, 'admin', '2020-08-22 20:51:15', '2021-03-26 03:10:38'),
(9, '[\"tteest\"]', NULL, 'leader', '2020-08-22 20:51:27', '2021-03-26 03:10:53'),
(10, '[\"test\"]', NULL, 'helper', '2020-08-22 20:51:40', '2021-03-26 03:10:45');
-- --------------------------------------------------------

--
-- Table structure for table `wc_recruitment`
--

CREATE TABLE `wc_recruitment` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '-1',
  `content` text,
  `category` varchar(32) DEFAULT NULL,
  `faction_id` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wc_redeem_account`
--

CREATE TABLE `wc_redeem_account` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `code` varchar(128) DEFAULT NULL,
  `token` varchar(128) DEFAULT NULL,
  `email` varchar(258) DEFAULT NULL,
  `nickname` varchar(128) DEFAULT NULL,
  `password` text,
  `pending` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `activated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wc_settings`
--

CREATE TABLE `wc_settings` (
  `id` int(11) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  `function` varchar(128) NOT NULL,
  `system` varchar(256) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
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
  `user_id` int(11) NOT NULL DEFAULT '0',
  `user_name` varchar(64) DEFAULT NULL,
  `tag_name` varchar(64) DEFAULT NULL,
  `icon` varchar(16) DEFAULT 'ti ti-user',
  `color` varchar(16) NOT NULL DEFAULT '#FFFFFF',
  `color_font` varchar(16) NOT NULL DEFAULT '#FFFFFF',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wc_tickets`
--

CREATE TABLE `wc_tickets` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `title` text,
  `text` text,
  `priority` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` varchar(64) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `category` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wc_token`
--

CREATE TABLE `wc_token` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `email` varchar(256) DEFAULT NULL,
  `token` varchar(128) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deactivated` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wc_unbans`
--

CREATE TABLE `wc_unbans` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `user_name` varchar(64) DEFAULT NULL,
  `ban_type` varchar(64) DEFAULT NULL,
  `ban_time` timestamp NULL DEFAULT NULL,
  `ban_details` text,
  `content` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(64) DEFAULT NULL,
  `action` varchar(256) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wc_updates`
--

CREATE TABLE `wc_updates` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `update_version` text,
  `update_text` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

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
-- AUTO_INCREMENT for table `wc_applications`
--
ALTER TABLE `wc_applications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=604;
--
-- AUTO_INCREMENT for table `wc_comments`
--
ALTER TABLE `wc_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;
--
-- AUTO_INCREMENT for table `wc_complaints`
--
ALTER TABLE `wc_complaints`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `wc_grades`
--
ALTER TABLE `wc_grades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `wc_logs`
--
ALTER TABLE `wc_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1748;
--
-- AUTO_INCREMENT for table `wc_notifications`
--
ALTER TABLE `wc_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=195;
--
-- AUTO_INCREMENT for table `wc_options`
--
ALTER TABLE `wc_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `wc_recruitment`
--
ALTER TABLE `wc_recruitment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;
--
-- AUTO_INCREMENT for table `wc_redeem_account`
--
ALTER TABLE `wc_redeem_account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2544;
--
-- AUTO_INCREMENT for table `wc_settings`
--
ALTER TABLE `wc_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `wc_tags`
--
ALTER TABLE `wc_tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT for table `wc_tickets`
--
ALTER TABLE `wc_tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `wc_token`
--
ALTER TABLE `wc_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;
--
-- AUTO_INCREMENT for table `wc_unbans`
--
ALTER TABLE `wc_unbans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `wc_updates`
--
ALTER TABLE `wc_updates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
