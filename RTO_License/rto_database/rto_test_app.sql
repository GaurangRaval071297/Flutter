-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 12, 2025 at 06:42 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rto_test_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `g_categories`
--

CREATE TABLE `g_categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `g_questions`
--

CREATE TABLE `g_questions` (
  `question_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `question_text` text NOT NULL,
  `option_a` varchar(255) NOT NULL,
  `option_b` varchar(255) NOT NULL,
  `option_c` varchar(255) NOT NULL,
  `correct_option` char(1) NOT NULL CHECK (`correct_option` in ('A','B','C'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `g_rto_offices`
--

CREATE TABLE `g_rto_offices` (
  `office_id` int(11) NOT NULL,
  `state_name` varchar(100) NOT NULL,
  `office_code` varchar(10) NOT NULL,
  `office_name` varchar(200) NOT NULL,
  `address` text NOT NULL,
  `website` varchar(200) DEFAULT NULL,
  `contact_number` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `g_statistics`
--

CREATE TABLE `g_statistics` (
  `stat_id` int(11) NOT NULL,
  `year` varchar(20) DEFAULT NULL,
  `transport_vehicles` int(11) DEFAULT NULL,
  `non_transport_vehicles` int(11) DEFAULT NULL,
  `total_vehicles` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `g_tests`
--

CREATE TABLE `g_tests` (
  `test_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `test_type` enum('practice','mock') NOT NULL,
  `total_questions` int(11) DEFAULT 0,
  `total_correct` int(11) DEFAULT 0,
  `total_wrong` int(11) DEFAULT 0,
  `score` int(11) DEFAULT 0,
  `test_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `g_test_answers`
--

CREATE TABLE `g_test_answers` (
  `answer_id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `selected_option` char(1) DEFAULT NULL,
  `is_correct` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `g_users`
--

CREATE TABLE `g_users` (
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `g_categories`
--
ALTER TABLE `g_categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `g_questions`
--
ALTER TABLE `g_questions`
  ADD PRIMARY KEY (`question_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `g_rto_offices`
--
ALTER TABLE `g_rto_offices`
  ADD PRIMARY KEY (`office_id`);

--
-- Indexes for table `g_statistics`
--
ALTER TABLE `g_statistics`
  ADD PRIMARY KEY (`stat_id`);

--
-- Indexes for table `g_tests`
--
ALTER TABLE `g_tests`
  ADD PRIMARY KEY (`test_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `g_test_answers`
--
ALTER TABLE `g_test_answers`
  ADD PRIMARY KEY (`answer_id`),
  ADD KEY `test_id` (`test_id`),
  ADD KEY `question_id` (`question_id`);

--
-- Indexes for table `g_users`
--
ALTER TABLE `g_users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `g_categories`
--
ALTER TABLE `g_categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `g_questions`
--
ALTER TABLE `g_questions`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `g_rto_offices`
--
ALTER TABLE `g_rto_offices`
  MODIFY `office_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `g_statistics`
--
ALTER TABLE `g_statistics`
  MODIFY `stat_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `g_tests`
--
ALTER TABLE `g_tests`
  MODIFY `test_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `g_test_answers`
--
ALTER TABLE `g_test_answers`
  MODIFY `answer_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `g_users`
--
ALTER TABLE `g_users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `g_questions`
--
ALTER TABLE `g_questions`
  ADD CONSTRAINT `g_questions_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `g_categories` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `g_tests`
--
ALTER TABLE `g_tests`
  ADD CONSTRAINT `g_tests_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `g_users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `g_test_answers`
--
ALTER TABLE `g_test_answers`
  ADD CONSTRAINT `g_test_answers_ibfk_1` FOREIGN KEY (`test_id`) REFERENCES `g_tests` (`test_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `g_test_answers_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `g_questions` (`question_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
