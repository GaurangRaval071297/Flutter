-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 13, 2025 at 09:40 AM
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
-- Database: `artist_hub`
--

-- --------------------------------------------------------

--
-- Table structure for table `g_artist_category`
--

CREATE TABLE `g_artist_category` (
  `id` int(11) NOT NULL,
  `artist_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `media_url` varchar(255) DEFAULT NULL,
  `media_type` enum('image','video') DEFAULT NULL,
  `uploaded_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `g_artist_category`
--

INSERT INTO `g_artist_category` (`id`, `artist_id`, `name`, `description`, `media_url`, `media_type`, `uploaded_at`) VALUES
(1, 2, 'Dance', 'Bollywood & Garba performer', 'uploads/dance1.jpg', 'image', '2025-10-11 10:15:50'),
(2, 2, 'Music', 'Live singer for events', 'uploads/song.mp4', 'video', '2025-10-11 10:15:50'),
(3, 3, 'Magic Show', 'Performs kids and corporate magic shows', 'uploads/magic1.jpg', 'image', '2025-10-11 10:15:50');

-- --------------------------------------------------------

--
-- Table structure for table `g_artist_users`
--

CREATE TABLE `g_artist_users` (
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `role` enum('admin','artist','customer') NOT NULL,
  `profile_pic` varchar(255) DEFAULT NULL,
  `status` enum('pending','approved','rejected') DEFAULT 'pending',
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `g_artist_users`
--

INSERT INTO `g_artist_users` (`user_id`, `name`, `email`, `password`, `phone`, `address`, `role`, `profile_pic`, `status`, `created_at`) VALUES
(1, 'Admin User', 'admin@example.com', 'admin123', '9998887777', 'Ahmedabad', 'admin', NULL, 'approved', '2025-10-11 10:14:59'),
(2, 'Artist One', 'artist1@example.com', 'artist123', '9991112222', 'Rajkot', 'artist', NULL, 'approved', '2025-10-11 10:14:59'),
(3, 'Artist Two', 'artist2@example.com', 'artist123', '9993334444', 'Jaipur', 'artist', NULL, 'approved', '2025-10-11 10:14:59'),
(4, 'Customer One', 'customer1@example.com', 'cust123', '9876543210', 'Surat', 'customer', NULL, 'approved', '2025-10-11 10:14:59'),
(9, 'Admin User', 'admin1@example.com', '$2y$10$OwhO5oSxCKnZAWmfx7Inke8XW2dCPDYYwRTlF7V2aU7xACWUfL8eO', '9998887777', 'Ahmedabad', 'admin', NULL, 'approved', '2025-10-11 10:36:58'),
(10, 'Artist One', 'artist12@example.com', '$2y$10$IXqzVEI5LZnW5nYzjNRDZevH3VNBNgOlH51yRWttLIRZzAI1ko1de', '9991112222', 'Rajkot', 'artist', NULL, 'approved', '2025-10-11 10:36:58'),
(11, 'Artist Two', 'artist23@example.com', '$2y$10$dQkRHEqOcOig66CO7i3aIOMvLdZUnDo6dmtYtRC4vbrkbp8sEpo4W', '9993334444', 'Jaipur', 'artist', NULL, 'approved', '2025-10-11 10:36:58'),
(12, 'Customer One', 'customer12@example.com', '$2y$10$RQFlC9gHZYpBaKBDz1I3UucS7MiByPp/1xXqfLJ2W6Zr/J1Z0Y4De', '9876543210', 'Surat', 'customer', NULL, 'approved', '2025-10-11 10:36:58');

-- --------------------------------------------------------

--
-- Table structure for table `g_bookings`
--

CREATE TABLE `g_bookings` (
  `booking_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `artist_id` int(11) NOT NULL,
  `event_date` date NOT NULL,
  `event_time` time DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `status` enum('pending','confirmed','cancelled','completed') DEFAULT 'pending',
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `g_bookings`
--

INSERT INTO `g_bookings` (`booking_id`, `customer_id`, `artist_id`, `event_date`, `event_time`, `location`, `status`, `created_at`) VALUES
(1, 4, 2, '2025-10-20', '19:00:00', 'Rajkot Palace', 'confirmed', '2025-10-11 10:16:28'),
(2, 4, 3, '2025-10-25', '18:30:00', 'Jaipur Garden', 'pending', '2025-10-11 10:16:28');

-- --------------------------------------------------------

--
-- Table structure for table `g_reviews`
--

CREATE TABLE `g_reviews` (
  `review_id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `artist_id` int(11) NOT NULL,
  `rating` int(11) DEFAULT NULL CHECK (`rating` between 1 and 5),
  `message` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `g_reviews`
--

INSERT INTO `g_reviews` (`review_id`, `booking_id`, `customer_id`, `artist_id`, `rating`, `message`, `created_at`) VALUES
(1, 1, 4, 2, 5, 'Amazing performance by the dancer!', '2025-10-11 10:17:09'),
(2, 2, 4, 3, 4, 'The magic show was entertaining!', '2025-10-11 10:17:09');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `g_artist_category`
--
ALTER TABLE `g_artist_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `artist_id` (`artist_id`);

--
-- Indexes for table `g_artist_users`
--
ALTER TABLE `g_artist_users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `g_bookings`
--
ALTER TABLE `g_bookings`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `artist_id` (`artist_id`);

--
-- Indexes for table `g_reviews`
--
ALTER TABLE `g_reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `booking_id` (`booking_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `artist_id` (`artist_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `g_artist_category`
--
ALTER TABLE `g_artist_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `g_artist_users`
--
ALTER TABLE `g_artist_users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `g_bookings`
--
ALTER TABLE `g_bookings`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `g_reviews`
--
ALTER TABLE `g_reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `g_artist_category`
--
ALTER TABLE `g_artist_category`
  ADD CONSTRAINT `g_artist_category_ibfk_1` FOREIGN KEY (`artist_id`) REFERENCES `g_artist_users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `g_bookings`
--
ALTER TABLE `g_bookings`
  ADD CONSTRAINT `g_bookings_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `g_artist_users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `g_bookings_ibfk_2` FOREIGN KEY (`artist_id`) REFERENCES `g_artist_users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `g_reviews`
--
ALTER TABLE `g_reviews`
  ADD CONSTRAINT `g_reviews_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `g_bookings` (`booking_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `g_reviews_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `g_artist_users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `g_reviews_ibfk_3` FOREIGN KEY (`artist_id`) REFERENCES `g_artist_users` (`user_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
