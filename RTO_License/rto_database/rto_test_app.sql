-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 11, 2025 at 08:35 AM
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
-- Table structure for table `g_questions`
--

CREATE TABLE `g_questions` (
  `question_id` int(11) NOT NULL,
  `question_text` text NOT NULL,
  `option_a` varchar(255) NOT NULL,
  `option_b` varchar(255) NOT NULL,
  `option_c` varchar(255) NOT NULL,
  `option_d` varchar(255) NOT NULL,
  `correct_option` enum('A','B','C','D') NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `g_questions`
--

INSERT INTO `g_questions` (`question_id`, `question_text`, `option_a`, `option_b`, `option_c`, `option_d`, `correct_option`, `category`, `created_at`) VALUES
(1, 'What is the minimum age for driving a car?', '16', '18', '20', '21', 'B', 'Car', '2025-10-11 05:19:57'),
(2, 'When should you use a horn?', 'Everywhere', 'When necessary', 'At red lights', 'Never', 'B', 'General', '2025-10-11 05:19:57'),
(3, 'Seat belt is compulsory for?', 'Driver only', 'Driver & front passenger', 'All passengers', 'Not required', 'C', 'General', '2025-10-11 05:19:57');

-- --------------------------------------------------------

--
-- Table structure for table `g_results`
--

CREATE TABLE `g_results` (
  `result_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `total_questions` int(11) NOT NULL,
  `taken_on` timestamp NOT NULL DEFAULT current_timestamp()
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
-- Dumping data for table `g_users`
--

INSERT INTO `g_users` (`user_id`, `name`, `email`, `password`, `created_at`) VALUES
(1, 'Test User', 'user@rto.com', '$2y$10$examplehash2', '2025-10-11 05:19:57');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `g_questions`
--
ALTER TABLE `g_questions`
  ADD PRIMARY KEY (`question_id`);

--
-- Indexes for table `g_results`
--
ALTER TABLE `g_results`
  ADD PRIMARY KEY (`result_id`),
  ADD KEY `user_id` (`user_id`);

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
-- AUTO_INCREMENT for table `g_questions`
--
ALTER TABLE `g_questions`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `g_results`
--
ALTER TABLE `g_results`
  MODIFY `result_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `g_users`
--
ALTER TABLE `g_users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `g_results`
--
ALTER TABLE `g_results`
  ADD CONSTRAINT `g_results_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `g_users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
