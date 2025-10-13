-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 13, 2025 at 07:59 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

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
-- Table structure for table `gr_categories`
--

CREATE TABLE `gr_categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gr_questions`
--

CREATE TABLE `gr_questions` (
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
-- Table structure for table `gr_rto_offices`
--

CREATE TABLE `gr_rto_offices` (
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
-- Table structure for table `gr_statistics`
--

CREATE TABLE `gr_statistics` (
  `stat_id` int(11) NOT NULL,
  `year` varchar(20) DEFAULT NULL,
  `transport_vehicles` int(11) DEFAULT NULL,
  `non_transport_vehicles` int(11) DEFAULT NULL,
  `total_vehicles` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gr_tests`
--

CREATE TABLE `gr_tests` (
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
-- Table structure for table `gr_test_answers`
--

CREATE TABLE `gr_test_answers` (
  `answer_id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `selected_option` char(1) DEFAULT NULL,
  `is_correct` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gr_users`
--

CREATE TABLE `gr_users` (
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
-- Indexes for table `gr_categories`
--
ALTER TABLE `gr_categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `gr_questions`
--
ALTER TABLE `gr_questions`
  ADD PRIMARY KEY (`question_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `gr_rto_offices`
--
ALTER TABLE `gr_rto_offices`
  ADD PRIMARY KEY (`office_id`);

--
-- Indexes for table `gr_statistics`
--
ALTER TABLE `gr_statistics`
  ADD PRIMARY KEY (`stat_id`);

--
-- Indexes for table `gr_tests`
--
ALTER TABLE `gr_tests`
  ADD PRIMARY KEY (`test_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `gr_test_answers`
--
ALTER TABLE `gr_test_answers`
  ADD PRIMARY KEY (`answer_id`),
  ADD KEY `test_id` (`test_id`),
  ADD KEY `question_id` (`question_id`);

--
-- Indexes for table `gr_users`
--
ALTER TABLE `gr_users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `gr_categories`
--
ALTER TABLE `gr_categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gr_questions`
--
ALTER TABLE `gr_questions`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gr_rto_offices`
--
ALTER TABLE `gr_rto_offices`
  MODIFY `office_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gr_statistics`
--
ALTER TABLE `gr_statistics`
  MODIFY `stat_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gr_tests`
--
ALTER TABLE `gr_tests`
  MODIFY `test_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gr_test_answers`
--
ALTER TABLE `gr_test_answers`
  MODIFY `answer_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gr_users`
--
ALTER TABLE `gr_users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `gr_questions`
--
ALTER TABLE `gr_questions`
  ADD CONSTRAINT `gr_questions_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `gr_categories` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `gr_tests`
--
ALTER TABLE `gr_tests`
  ADD CONSTRAINT `gr_tests_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `gr_users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `gr_test_answers`
--
ALTER TABLE `gr_test_answers`
  ADD CONSTRAINT `gr_test_answers_ibfk_1` FOREIGN KEY (`test_id`) REFERENCES `gr_tests` (`test_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `gr_test_answers_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `gr_questions` (`question_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
