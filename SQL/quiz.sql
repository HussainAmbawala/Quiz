-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 15, 2023 at 08:26 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quiz`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `aId` int(11) NOT NULL,
  `qId` int(11) NOT NULL,
  `answer` longtext NOT NULL,
  `isCorrect` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`aId`, `qId`, `answer`, `isCorrect`) VALUES
(1, 1, 'sports beginner 1 option 1', 0),
(2, 1, 'sports beginner 1 option 2', 0),
(3, 1, 'sports beginner 1 option 3', 1),
(4, 1, 'sports beginner 1 option 4', 0),
(5, 2, 'sports beginner 2 option 1', 0),
(6, 2, 'sports beginner 2 option 2', 0),
(7, 2, 'sports beginner 2 option 3', 1),
(8, 2, 'sports beginner 2 option 4', 0),
(9, 3, 'sports beginner 3 option 1', 0),
(10, 3, 'sports beginner 3 option 2', 0),
(11, 3, 'sports beginner 3 option 3', 1),
(12, 3, 'sports beginner 3 option 4', 0),
(13, 4, 'sports beginner 4 option 1', 0),
(14, 4, 'sports beginner 4 option 2', 0),
(15, 4, 'sports beginner 4 option 3', 1),
(16, 4, 'sports beginner 4 option 4', 0),
(17, 5, 'sports beginner 5 option 1', 0),
(18, 5, 'sports beginner 5 option 2', 0),
(19, 5, 'sports beginner 5 option 3', 1),
(20, 5, 'sports beginner 5 option 4', 0),
(21, 6, 'sports beginner 6 option 1', 0),
(22, 6, 'sports beginner 6 option 2', 0),
(23, 6, 'sports beginner 6 option 3', 1),
(24, 6, 'sports beginner 6 option 4', 0),
(25, 7, 'sports beginner 7 option 1', 0),
(26, 7, 'sports beginner 7 option 2', 0),
(27, 7, 'sports beginner 7 option 3', 1),
(28, 7, 'sports beginner 7 option 4', 0),
(29, 8, 'sports beginner 8 option 1', 0),
(30, 8, 'sports beginner 8 option 2', 0),
(31, 8, 'sports beginner 8 option 3', 1),
(32, 8, 'sports beginner 8 option 4', 0),
(33, 9, 'sports beginner 9 option 1', 0),
(34, 9, 'sports beginner 9 option 2', 0),
(35, 9, 'sports beginner 9 option 3', 1),
(36, 9, 'sports beginner 9 option 4', 0),
(37, 10, 'sports beginner 10 option 1', 0),
(38, 10, 'sports beginner 10 option 2', 0),
(39, 10, 'sports beginner 10 option 3', 1),
(40, 10, 'sports beginner 10 option 4', 0),
(41, 11, 'arts 1 option 1', 0),
(42, 11, 'arts 1 option 2', 0),
(43, 11, 'arts 1 option 3', 1),
(44, 11, 'arts 1 option 4', 0),
(45, 12, 'arts 2 option 1', 0),
(46, 12, 'arts 2 option 2', 0),
(47, 12, 'arts 2 option 3', 1),
(48, 12, 'arts 2 option 4', 0),
(49, 13, 'arts 3 option 1', 0),
(50, 13, 'arts 3 option 2', 0),
(51, 13, 'arts 3 option 3', 1),
(52, 13, 'arts 3 option 4', 0),
(53, 14, 'arts 4 option 1', 0),
(54, 14, 'arts 4 option 2', 0),
(55, 14, 'arts 4 option 3', 1),
(56, 14, 'arts 4 option 4', 0),
(57, 15, 'arts 5 option 1', 0),
(58, 15, 'arts 5 option 2', 0),
(59, 15, 'arts 5 option 3', 1),
(60, 15, 'arts 5 option 4', 0),
(61, 16, 'arts 6 option 1', 0),
(62, 16, 'arts 6 option 2', 0),
(63, 16, 'arts 6 option 3', 1),
(64, 16, 'arts 6 option 4', 0),
(65, 17, 'arts 7 option 1', 0),
(66, 17, 'arts 7 option 2', 0),
(67, 17, 'arts 7 option 3', 1),
(68, 17, 'arts 7 option 4', 0),
(69, 18, 'arts 8 option 1', 0),
(70, 18, 'arts 8 option 2', 0),
(71, 18, 'arts 8 option 3', 1),
(72, 18, 'arts 8 option 4', 0),
(73, 19, 'arts 9 option 1', 0),
(74, 19, 'arts 9 option 2', 0),
(75, 19, 'arts 9 option 3', 1),
(76, 19, 'arts 9 option 4', 0),
(77, 20, 'arts 10 option 1', 0),
(78, 20, 'arts 10 option 2', 0),
(79, 20, 'arts 10 option 3', 1),
(80, 20, 'arts 10 option 4', 0),
(81, 21, 'science 1 option 1', 0),
(82, 21, 'science 1 option 2', 0),
(83, 21, 'science 1 option 3', 1),
(84, 21, 'science 1 option 4', 0),
(85, 22, 'science 2 option 1', 0),
(86, 22, 'science 2 option 2', 0),
(87, 22, 'science 2 option 3', 1),
(88, 22, 'science 2 option 4', 0),
(89, 23, 'science 3 option 1', 0),
(90, 23, 'science 3 option 2', 0),
(91, 23, 'science 3 option 3', 1),
(92, 23, 'science 3 option 4', 0),
(93, 24, 'science 4 option 1', 0),
(94, 24, 'science 4 option 2', 0),
(95, 24, 'science 4 option 3', 1),
(96, 24, 'science 4 option 4', 0),
(97, 25, 'science 5 option 1', 0),
(98, 25, 'science 5 option 2', 0),
(99, 25, 'science 5 option 3', 1),
(100, 25, 'science 5 option 4', 0),
(101, 26, 'science 6 option 1', 0),
(102, 26, 'science 6 option 2', 0),
(103, 26, 'science 6 option 3', 1),
(104, 26, 'science 6 option 4', 0),
(105, 27, 'science 7 option 1', 0),
(106, 27, 'science 7 option 2', 0),
(107, 27, 'science 7 option 3', 1),
(108, 27, 'science 7 option 4', 0),
(109, 28, 'science 8 option 1', 0),
(110, 28, 'science 8 option 2', 0),
(111, 28, 'science 8 option 3', 1),
(112, 28, 'science 8 option 4', 0),
(113, 29, 'science 9 option 1', 0),
(114, 29, 'science 9 option 2', 0),
(115, 29, 'science 9 option 3', 1),
(116, 29, 'science 9 option 4', 0),
(117, 30, 'science 10 option 1', 0),
(118, 30, 'science 10 option 2', 0),
(119, 30, 'science 10 option 3', 1),
(120, 30, 'science 10 option 4', 0),
(121, 31, 'politics 1 option 1', 0),
(122, 31, 'politics 1 option 2', 0),
(123, 31, 'politics 1 option 3', 1),
(124, 31, 'politics 1 option 4', 0),
(125, 32, 'politics 2 option 1', 0),
(126, 32, 'politics 2 option 2', 0),
(127, 32, 'politics 2 option 3', 1),
(128, 32, 'politics 2 option 4', 0),
(129, 33, 'politics 3 option 1', 0),
(130, 33, 'politics 3 option 2', 0),
(131, 33, 'politics 3 option 3', 1),
(132, 33, 'politics 3 option 4', 0),
(133, 34, 'politics 4 option 1', 0),
(134, 34, 'politics 4 option 2', 0),
(135, 34, 'politics 4 option 3', 1),
(136, 34, 'politics 4 option 4', 0),
(137, 35, 'politics 5 option 1', 0),
(138, 35, 'politics 5 option 2', 0),
(139, 35, 'politics 5 option 3', 1),
(140, 35, 'politics 5 option 4', 0),
(141, 36, 'politics 6 option 1', 0),
(142, 36, 'politics 6 option 2', 0),
(143, 36, 'politics 6 option 3', 1),
(144, 36, 'politics 6 option 4', 0),
(145, 37, 'politics 7 option 1', 0),
(146, 37, 'politics 7 option 2', 0),
(147, 37, 'politics 7 option 3', 1),
(148, 37, 'politics 7 option 4', 0),
(149, 38, 'politics 8 option 1', 0),
(150, 38, 'politics 8 option 2', 0),
(151, 38, 'politics 8 option 3', 1),
(152, 38, 'politics 8 option 4', 0),
(153, 39, 'politics 9 option 1', 0),
(154, 39, 'politics 9 option 2', 0),
(155, 39, 'politics 9 option 3', 1),
(156, 39, 'politics 9 option 4', 0),
(157, 40, 'politics 10 option 1', 0),
(158, 40, 'politics 10 option 2', 0),
(159, 40, 'politics 10 option 3', 1),
(160, 40, 'politics 10 option 4', 0);

-- --------------------------------------------------------

--
-- Table structure for table `levels`
--

CREATE TABLE `levels` (
  `lId` int(11) NOT NULL,
  `level` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `levels`
--

INSERT INTO `levels` (`lId`, `level`) VALUES
(1, 'Beginner'),
(2, 'Intermediate'),
(3, 'Professional');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `qId` int(11) NOT NULL,
  `topic` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `question` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`qId`, `topic`, `level`, `question`) VALUES
(1, 1, 1, 'Question for sports beginner 1'),
(2, 1, 1, 'Question for sports beginner 2'),
(3, 1, 1, 'Question for sports beginner 3'),
(4, 1, 1, 'Question for sports beginner 4'),
(5, 1, 2, 'Question for sports intermediate 1'),
(6, 1, 2, 'Question for sports intermediate 2'),
(7, 1, 2, 'Question for sports intermediate 3'),
(8, 1, 3, 'Question for sports professional 1'),
(9, 1, 3, 'Question for sports professional 2'),
(10, 1, 3, 'Question for sports professional 3'),
(11, 3, 1, 'Question for arts beginner 1'),
(12, 3, 1, 'Question for arts beginner 2'),
(13, 3, 1, 'Question for arts beginner 3'),
(14, 3, 1, 'Question for arts beginner 4'),
(15, 3, 2, 'Question for arts intermediate 1'),
(16, 3, 2, 'Question for arts intermediate 2'),
(17, 3, 2, 'Question for arts intermediate 3'),
(18, 3, 3, 'Question for arts professional 1'),
(19, 3, 3, 'Question for arts professional 2'),
(20, 3, 3, 'Question for arts professional 3'),
(21, 2, 1, 'Question for science beginner 1'),
(22, 2, 1, 'Question for science beginner 2'),
(23, 2, 1, 'Question for science beginner 3'),
(24, 2, 1, 'Question for science beginner 4'),
(25, 2, 2, 'Question for science intermediate 1'),
(26, 2, 2, 'Question for science intermediate 2'),
(27, 2, 2, 'Question for science intermediate 3'),
(28, 2, 3, 'Question for science professional 1'),
(29, 2, 3, 'Question for science professional 2'),
(30, 2, 3, 'Question for science professional 3'),
(31, 4, 1, 'Question for politics beginner 1'),
(32, 4, 1, 'Question for politics beginner 2'),
(33, 4, 1, 'Question for politics beginner 3'),
(34, 4, 1, 'Question for politics beginner 4'),
(35, 4, 2, 'Question for politics intermediate 1'),
(36, 4, 2, 'Question for politics intermediate 2'),
(37, 4, 2, 'Question for politics intermediate 3'),
(38, 4, 3, 'Question for politics professional 1'),
(39, 4, 3, 'Question for politics professional 2'),
(40, 4, 3, 'Question for politics professional 3');

-- --------------------------------------------------------

--
-- Table structure for table `topics`
--

CREATE TABLE `topics` (
  `tId` int(20) NOT NULL,
  `topic` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `topics`
--

INSERT INTO `topics` (`tId`, `topic`) VALUES
(1, 'Sports'),
(2, 'Science & Technology'),
(3, 'Arts'),
(4, 'Politics');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`aId`),
  ADD KEY `qId` (`qId`);

--
-- Indexes for table `levels`
--
ALTER TABLE `levels`
  ADD PRIMARY KEY (`lId`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`qId`),
  ADD KEY `topic` (`topic`),
  ADD KEY `level` (`level`);

--
-- Indexes for table `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`tId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `aId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;

--
-- AUTO_INCREMENT for table `levels`
--
ALTER TABLE `levels`
  MODIFY `lId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `qId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `topics`
--
ALTER TABLE `topics`
  MODIFY `tId` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `answers_ibfk_1` FOREIGN KEY (`qId`) REFERENCES `questions` (`qId`);

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`topic`) REFERENCES `topics` (`tId`),
  ADD CONSTRAINT `questions_ibfk_2` FOREIGN KEY (`level`) REFERENCES `levels` (`lId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
