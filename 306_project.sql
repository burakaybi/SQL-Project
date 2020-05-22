-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 08, 2020 at 04:44 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospital`
--

-- --------------------------------------------------------

--
-- Table structure for table `appoinment`
--

CREATE TABLE `appoinment` (
  `appid` int(11) NOT NULL,
  `doctor` varchar(20) COLLATE utf8_turkish_ci DEFAULT NULL,
  `patient` varchar(20) COLLATE utf8_turkish_ci DEFAULT NULL,
  `a_date` date DEFAULT NULL,
  `did` int(11) DEFAULT NULL,
  `ssn` varchar(11) COLLATE utf8_turkish_ci DEFAULT NULL,
  `rec_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `collabrate`
--

CREATE TABLE `collabrate` (
  `nid` int(11) DEFAULT NULL,
  `did` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `did` int(11) NOT NULL,
  `dsex` varchar(20) COLLATE utf8_turkish_ci DEFAULT NULL,
  `dname` varchar(20) COLLATE utf8_turkish_ci DEFAULT NULL,
  `dsalary` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

CREATE TABLE `medicine` (
  `code` int(11) NOT NULL,
  `name` varchar(20) COLLATE utf8_turkish_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  `sideeffect` varchar(20) COLLATE utf8_turkish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nurse`
--

CREATE TABLE `nurse` (
  `nid` int(11) NOT NULL,
  `nname` varchar(20) COLLATE utf8_turkish_ci DEFAULT NULL,
  `nsex` varchar(20) COLLATE utf8_turkish_ci DEFAULT NULL,
  `nsalary` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `did` int(11) DEFAULT NULL,
  `ssn` varchar(11) COLLATE utf8_turkish_ci NOT NULL,
  `pname` varchar(20) COLLATE utf8_turkish_ci DEFAULT NULL,
  `phone` varchar(11) COLLATE utf8_turkish_ci DEFAULT NULL,
  `adress` varchar(20) COLLATE utf8_turkish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `receptionist`
--

CREATE TABLE `receptionist` (
  `rec_id` int(11) NOT NULL,
  `rec_name` varchar(20) COLLATE utf8_turkish_ci DEFAULT NULL,
  `rec_sex` varchar(5) COLLATE utf8_turkish_ci DEFAULT NULL,
  `rec_salary` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `rnumber` int(11) NOT NULL,
  `rtype` varchar(20) COLLATE utf8_turkish_ci DEFAULT NULL,
  `availability` tinyint(1) DEFAULT NULL,
  `floor` int(11) DEFAULT NULL,
  `ssn` varchar(11) COLLATE utf8_turkish_ci DEFAULT NULL,
  `nid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `take`
--

CREATE TABLE `take` (
  `ssn` varchar(11) COLLATE utf8_turkish_ci DEFAULT NULL,
  `code` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appoinment`
--
ALTER TABLE `appoinment`
  ADD PRIMARY KEY (`appid`),
  ADD KEY `ssn` (`ssn`),
  ADD KEY `did` (`did`),
  ADD KEY `rec_id` (`rec_id`);

--
-- Indexes for table `collabrate`
--
ALTER TABLE `collabrate`
  ADD KEY `nid` (`nid`),
  ADD KEY `did` (`did`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`did`);

--
-- Indexes for table `medicine`
--
ALTER TABLE `medicine`
  ADD PRIMARY KEY (`code`);

--
-- Indexes for table `nurse`
--
ALTER TABLE `nurse`
  ADD PRIMARY KEY (`nid`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`ssn`),
  ADD KEY `did` (`did`);

--
-- Indexes for table `receptionist`
--
ALTER TABLE `receptionist`
  ADD PRIMARY KEY (`rec_id`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`rnumber`),
  ADD KEY `ssn` (`ssn`),
  ADD KEY `nid` (`nid`);

--
-- Indexes for table `take`
--
ALTER TABLE `take`
  ADD KEY `ssn` (`ssn`),
  ADD KEY `code` (`code`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appoinment`
--
ALTER TABLE `appoinment`
  ADD CONSTRAINT `appoinment_ibfk_1` FOREIGN KEY (`ssn`) REFERENCES `patient` (`ssn`),
  ADD CONSTRAINT `appoinment_ibfk_2` FOREIGN KEY (`did`) REFERENCES `doctor` (`did`),
  ADD CONSTRAINT `appoinment_ibfk_3` FOREIGN KEY (`rec_id`) REFERENCES `receptionist` (`rec_id`);

--
-- Constraints for table `collabrate`
--
ALTER TABLE `collabrate`
  ADD CONSTRAINT `collabrate_ibfk_1` FOREIGN KEY (`nid`) REFERENCES `nurse` (`nid`),
  ADD CONSTRAINT `collabrate_ibfk_2` FOREIGN KEY (`did`) REFERENCES `doctor` (`did`);

--
-- Constraints for table `patient`
--
ALTER TABLE `patient`
  ADD CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`did`) REFERENCES `doctor` (`did`);

--
-- Constraints for table `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `room_ibfk_1` FOREIGN KEY (`ssn`) REFERENCES `patient` (`ssn`),
  ADD CONSTRAINT `room_ibfk_2` FOREIGN KEY (`nid`) REFERENCES `nurse` (`nid`);

--
-- Constraints for table `take`
--
ALTER TABLE `take`
  ADD CONSTRAINT `take_ibfk_1` FOREIGN KEY (`ssn`) REFERENCES `patient` (`ssn`),
  ADD CONSTRAINT `take_ibfk_2` FOREIGN KEY (`code`) REFERENCES `medicine` (`code`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
