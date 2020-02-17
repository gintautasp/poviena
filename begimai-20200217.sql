-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 17, 2020 at 01:06 PM
-- Server version: 10.1.40-MariaDB
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `begimai`
--

-- --------------------------------------------------------

--
-- Table structure for table `begikai`
--

CREATE TABLE `begikai` (
  `id` int(10) UNSIGNED NOT NULL,
  `pav` varchar(255) NOT NULL,
  `metai_gim` int(11) NOT NULL,
  `lytis` enum('vyr','mot') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `startai`
--

CREATE TABLE `startai` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_trasos` int(10) UNSIGNED NOT NULL,
  `id_begiko` int(10) UNSIGNED NOT NULL,
  `atstumas_km` decimal(10,3) UNSIGNED NOT NULL,
  `data` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `startai_begikai_ratai`
--

CREATE TABLE `startai_begikai_ratai` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_starto` int(10) UNSIGNED NOT NULL,
  `id_trasos` int(10) UNSIGNED NOT NULL,
  `id_begiko` int(10) UNSIGNED NOT NULL,
  `nr_rato` int(10) UNSIGNED NOT NULL,
  `laikas_sek` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `startai_trasuotes`
--

CREATE TABLE `startai_trasuotes` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_starto` int(10) UNSIGNED NOT NULL,
  `id_trasuotes` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `trasos`
--

CREATE TABLE `trasos` (
  `id` int(10) UNSIGNED NOT NULL,
  `pav` varchar(255) NOT NULL,
  `atstumas_km` decimal(10,3) NOT NULL DEFAULT '10.000',
  `sukilimas` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `trasos`
--

INSERT INTO `trasos` (`id`, `pav`, `atstumas_km`, `sukilimas`) VALUES
(1, 'KaunoMaratonas21_42', '21.095', 0),
(2, 'SveikasZmogus', '10.000', 0),
(4, 'Šėta', '10.000', 0);

-- --------------------------------------------------------

--
-- Table structure for table `trasuotes`
--

CREATE TABLE `trasuotes` (
  `id` int(11) NOT NULL,
  `pav` int(11) NOT NULL,
  `gpx_laikas` varchar(32) NOT NULL,
  `workout_link` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `trasuotes_atskaitos_gpx`
--

CREATE TABLE `trasuotes_atskaitos_gpx` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_trasuotes` int(10) UNSIGNED NOT NULL,
  `lat` decimal(10,6) NOT NULL,
  `lon` decimal(10,6) NOT NULL,
  `ele` decimal(5,1) NOT NULL,
  `time` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `treniruotes`
--

CREATE TABLE `treniruotes` (
  `id` int(10) UNSIGNED NOT NULL,
  `pav` varchar(255) DEFAULT NULL,
  `id_tipo` int(10) UNSIGNED NOT NULL,
  `data` datetime NOT NULL,
  `trukmė` bigint(20) UNSIGNED NOT NULL,
  `atstumas` decimal(10,3) UNSIGNED NOT NULL,
  `vieta` varchar(255) NOT NULL,
  `uzduotis` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `treniruotes_trasuotes`
--

CREATE TABLE `treniruotes_trasuotes` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_treniruotes` int(10) UNSIGNED NOT NULL,
  `id_trasuotes` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `begikai`
--
ALTER TABLE `begikai`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `startai_trasuotes`
--
ALTER TABLE `startai_trasuotes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trasos`
--
ALTER TABLE `trasos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trasuotes_atskaitos_gpx`
--
ALTER TABLE `trasuotes_atskaitos_gpx`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_trasuotes` (`id_trasuotes`);

--
-- Indexes for table `treniruotes`
--
ALTER TABLE `treniruotes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data` (`data`);

--
-- Indexes for table `treniruotes_trasuotes`
--
ALTER TABLE `treniruotes_trasuotes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `begikai`
--
ALTER TABLE `begikai`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `startai_trasuotes`
--
ALTER TABLE `startai_trasuotes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trasos`
--
ALTER TABLE `trasos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `trasuotes_atskaitos_gpx`
--
ALTER TABLE `trasuotes_atskaitos_gpx`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `treniruotes`
--
ALTER TABLE `treniruotes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `treniruotes_trasuotes`
--
ALTER TABLE `treniruotes_trasuotes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
