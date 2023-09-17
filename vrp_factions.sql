-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 13, 2021 at 08:41 AM
-- Server version: 8.0.23-0ubuntu0.20.04.1
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
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
-- Table structure for table `vrp_factions`
--

CREATE TABLE `vrp_factions` (
  `id` int NOT NULL,
  `factionName` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `MinLevel` int NOT NULL DEFAULT '5',
  `Application` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vrp_factions`
--

INSERT INTO `vrp_factions` (`id`, `factionName`, `MinLevel`, `Application`) VALUES
(1, 'Politie', 7, 1),
(2, 'Smurd', 4, 0),
(3, 'S.I.A.S', 5, 0),
(4, 'Mafia Crown', 5, 0),
(5, 'Mafia Bratva', 4, 1),
(6, 'Mafia Camorra', 4, 1),
(7, 'Rue de Lyon', 5, 0),
(8, 'Gang MS-16', 5, 0),
(9, 'Cartel de Sinaloa', 5, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `vrp_factions`
--
ALTER TABLE `vrp_factions`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `vrp_factions`
--
ALTER TABLE `vrp_factions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
