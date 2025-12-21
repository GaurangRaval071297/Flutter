-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 21, 2025 at 07:41 PM
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
-- Database: `artist_hub_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `g_admins`
--

CREATE TABLE `g_admins` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `g_artist_media`
--

CREATE TABLE `g_artist_media` (
  `id` int(11) NOT NULL,
  `artist_id` int(11) NOT NULL,
  `media_type` enum('image','video') NOT NULL,
  `media_url` text NOT NULL,
  `caption` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `g_artist_media`
--

INSERT INTO `g_artist_media` (`id`, `artist_id`, `media_type`, `media_url`, `caption`, `created_at`) VALUES
(1, 17, 'image', 'ghfd', 'kjghfghjkhgfd', '2025-12-21 08:01:37'),
(2, 17, 'image', 'uploads/images/1766329177_1368.jpg', 'kjghfghjkhgfd', '2025-12-21 14:59:37');

-- --------------------------------------------------------

--
-- Table structure for table `g_artist_profile`
--

CREATE TABLE `g_artist_profile` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `experience` varchar(50) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `g_artist_profile`
--

INSERT INTO `g_artist_profile` (`id`, `user_id`, `category`, `experience`, `price`, `description`) VALUES
(1, 1, 'gffg,.', NULL, '2454.00', 'kjhgfdsa'),
(2, 11, 'Dance', '12ys', '25000.00', 'vdfbdd');

-- --------------------------------------------------------

--
-- Table structure for table `g_bookings`
--

CREATE TABLE `g_bookings` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `artist_id` int(11) DEFAULT NULL,
  `booking_date` date DEFAULT NULL,
  `event_address` text DEFAULT NULL,
  `status` enum('booked','cancelled','completed') DEFAULT NULL,
  `cancelled_by` enum('artist','customer') DEFAULT NULL,
  `cancel_reason` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `payment_status` enum('pending','paid') DEFAULT 'pending',
  `payment_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `g_bookings`
--

INSERT INTO `g_bookings` (`id`, `customer_id`, `artist_id`, `booking_date`, `event_address`, `status`, `cancelled_by`, `cancel_reason`, `created_at`, `payment_status`, `payment_id`) VALUES
(1, 12, 11, '2025-12-25', 'rjt', 'booked', NULL, NULL, '2025-12-21 05:34:23', 'pending', NULL),
(2, 12, 11, '2025-12-25', 'rjt', 'booked', NULL, NULL, '2025-12-21 05:39:00', 'paid', '12'),
(3, 12, 11, '2025-12-25', 'rjt', 'booked', NULL, NULL, '2025-12-21 05:44:54', 'paid', '12'),
(4, 12, 11, '2025-12-28', 'rjt', 'booked', NULL, NULL, '2025-12-21 05:46:10', 'paid', '12'),
(5, 12, 11, '2025-12-28', 'rjt', 'booked', NULL, NULL, '2025-12-21 05:47:01', 'paid', '12'),
(6, 12, 11, '2025-12-28', 'rjt', 'cancelled', 'customer', NULL, '2025-12-21 05:54:19', 'paid', '12'),
(7, 12, 11, '2025-12-28', 'rjt', 'booked', NULL, NULL, '2025-12-21 06:04:36', 'pending', '12'),
(8, 12, 11, '2025-12-28', 'rjt', 'booked', NULL, NULL, '2025-12-21 06:04:49', 'pending', ''),
(9, 12, 11, '2025-12-28', 'rjt', 'cancelled', 'customer', 'hjgfds', '2025-12-21 06:11:46', 'pending', ''),
(10, 12, 11, '2025-12-28', 'rjt', 'cancelled', 'customer', 'hjgfds', '2025-12-21 06:15:59', 'pending', '12'),
(11, 12, 11, '2025-12-28', 'rjt', 'booked', NULL, NULL, '2025-12-21 06:23:45', 'pending', '12'),
(12, 12, 11, '2025-12-28', 'rjt', 'cancelled', 'artist', 'hkjhsdfhgjk', '2025-12-21 06:25:10', 'paid', '12'),
(13, 18, 17, '2025-12-28', 'rjt', 'cancelled', 'customer', 'hjgfds', '2025-12-21 07:06:19', 'paid', '1'),
(14, 18, 17, '2025-12-28', 'rjt', 'booked', NULL, NULL, '2025-12-21 07:12:17', 'paid', '1');

-- --------------------------------------------------------

--
-- Table structure for table `g_comments`
--

CREATE TABLE `g_comments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `artist_media_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `g_feedback`
--

CREATE TABLE `g_feedback` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `g_likes`
--

CREATE TABLE `g_likes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `artist_media_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `g_payments`
--

CREATE TABLE `g_payments` (
  `id` int(11) NOT NULL,
  `booking_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `artist_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `payment_method` enum('online','cash') DEFAULT NULL,
  `payment_status` enum('pending','paid','failed','refunded') DEFAULT NULL,
  `transaction_id` varchar(150) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `g_reviews`
--

CREATE TABLE `g_reviews` (
  `id` int(11) NOT NULL,
  `booking_id` int(11) DEFAULT NULL,
  `artist_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `g_shares`
--

CREATE TABLE `g_shares` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `artist_media_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `g_users`
--

CREATE TABLE `g_users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `role` enum('artist','customer') DEFAULT NULL,
  `is_approved` tinyint(4) DEFAULT 0,
  `is_active` tinyint(4) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `g_users`
--

INSERT INTO `g_users` (`id`, `name`, `email`, `password`, `phone`, `address`, `role`, `is_approved`, `is_active`, `created_at`) VALUES
(1, 'g', 'g@gmail.com', '123456', '', '', 'artist', 1, 0, '2025-12-20 16:00:17'),
(2, 'gaurang', 'g1@gmail.com', '123456', '123456789', '', 'artist', 0, 0, '2025-12-20 18:29:41'),
(3, 'gaurang', 'g1@2gmail.com', '123456', '123456789', 'rjt', 'artist', 0, 0, '2025-12-20 18:31:06'),
(4, 'gaurang', 'g10@gmail.com', '123456', '123456789', '', 'artist', 0, 0, '2025-12-20 18:31:22'),
(5, 'gaurang', 'g10@g4mail.com', '123456', '1234567890', 'rjt', 'artist', 0, 0, '2025-12-20 18:31:50'),
(6, 'gaurang', 'g10@g45mail.com', '123456', '1234567890', 'rjt', 'artist', 0, 0, '2025-12-20 18:33:04'),
(7, 'gaurang', 'g10@g45mail.com5', '123456', '1234567890', 'rjt', 'artist', 0, 0, '2025-12-20 18:33:37'),
(8, 'gaurang', 'g10@g45mail.com556', '$2y$10$9FRkP/vGXlMpXuMdauGA1uirZQC1eQLSY4WjwYbyW60rxl6fYcoPi', '1234567890', 'rjt', 'artist', 0, 0, '2025-12-21 04:39:41'),
(9, 'gaurang', 'p@gmail.com', '$2y$10$DBjk4dLM3Den2shXiTfnuunUb02tYSAoJ48WlkMyb9xAU8ix1lIIq', '1234567890', 'rjt', 'customer', 1, 0, '2025-12-21 04:43:31'),
(10, 'gaurang', 'p1@gmail.com', '$2y$10$yrl0E7HSXbjNg8i4Y1y0FOks6d786/I58vR7PaB2QrNp8SSyItzn6', '1234567890', 'rjt', 'artist', 0, 0, '2025-12-21 04:51:37'),
(11, 'gaurang', 'gr@gmail.com', '$2y$10$3OJkPkoWb6o5YEJZpjPRmukuHhoIEQJLHOpJ5tbu18BelAeUzOLxK', '1234567890', 'rjt', 'artist', 1, 1, '2025-12-21 04:53:41'),
(12, 'gaurang', 'gr1@gmail.com', '$2y$10$/wAvBi1JbHvTB1Tdxb6szOLnI9BUpUgFyH.S5iI/JN/e1qWvgMeeO', '1234567890', 'rjt', 'customer', 1, 1, '2025-12-21 04:54:09'),
(13, 'gaurang', 'gr2@gmail.com', '$2y$10$J8szHPcqQ9bbIvvzNazpXewO/3YbijbLJIW9BujmF/KsvIK67uo0e', '1234567890', 'rjt', 'customer', 1, 1, '2025-12-21 04:56:08'),
(14, 'gaurang', 'gr3@gmail.com', '$2y$10$3CcYTHr4WddQu5.92ASCGO3ta0afiGZA24TWK/TYFJ5m3Yfl4ToSe', '1234567890', 'rjt', 'customer', 1, 1, '2025-12-21 04:58:44'),
(15, 'gaurang', 'k@gmail.com', '$2y$10$iaz5FcKISL7uVN9kvdazKuPgx2w/4J2nuUc0Tz1.rKrlRvV9IZDbe', '1234567890', 'rjt', 'customer', 1, 1, '2025-12-21 05:16:10'),
(16, 'gaurang', 'k1@gmail.com', '$2y$10$V9w542N4v4kn/bFAs.uv4O1cToI9VjJlRK6j7K.ssKBtNQZlrOFtS', '1234567890', 'rjt', 'artist', 0, 1, '2025-12-21 05:16:25'),
(17, 'gaurang', 'k0@gmail.com', '$2y$10$ustGii3Kk2s5r3.jPcAZx.almucplIePNzyCHgsHK/b2WfBgGSAVm', '1234567890', 'rjt', 'artist', 1, 1, '2025-12-21 07:02:52'),
(18, 'gaurang', 'k01@gmail.com', '$2y$10$ILvKUNWGp9t1gj3owba9h.ZyxhVebOO7w8rBIsJOTUAXWrr6.ukxW', '1234567890', 'rjt', 'customer', 1, 1, '2025-12-21 07:03:16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `g_admins`
--
ALTER TABLE `g_admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `g_artist_media`
--
ALTER TABLE `g_artist_media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `artist_id` (`artist_id`);

--
-- Indexes for table `g_artist_profile`
--
ALTER TABLE `g_artist_profile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `g_bookings`
--
ALTER TABLE `g_bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `g_comments`
--
ALTER TABLE `g_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `artist_media_id` (`artist_media_id`);

--
-- Indexes for table `g_feedback`
--
ALTER TABLE `g_feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `g_likes`
--
ALTER TABLE `g_likes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`artist_media_id`),
  ADD KEY `artist_media_id` (`artist_media_id`);

--
-- Indexes for table `g_payments`
--
ALTER TABLE `g_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `g_reviews`
--
ALTER TABLE `g_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `g_shares`
--
ALTER TABLE `g_shares`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `artist_media_id` (`artist_media_id`);

--
-- Indexes for table `g_users`
--
ALTER TABLE `g_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `g_admins`
--
ALTER TABLE `g_admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `g_artist_media`
--
ALTER TABLE `g_artist_media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `g_artist_profile`
--
ALTER TABLE `g_artist_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `g_bookings`
--
ALTER TABLE `g_bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `g_comments`
--
ALTER TABLE `g_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `g_feedback`
--
ALTER TABLE `g_feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `g_likes`
--
ALTER TABLE `g_likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `g_payments`
--
ALTER TABLE `g_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `g_reviews`
--
ALTER TABLE `g_reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `g_shares`
--
ALTER TABLE `g_shares`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `g_users`
--
ALTER TABLE `g_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `g_artist_media`
--
ALTER TABLE `g_artist_media`
  ADD CONSTRAINT `g_artist_media_ibfk_1` FOREIGN KEY (`artist_id`) REFERENCES `g_users` (`id`);

--
-- Constraints for table `g_artist_profile`
--
ALTER TABLE `g_artist_profile`
  ADD CONSTRAINT `g_artist_profile_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `g_users` (`id`);

--
-- Constraints for table `g_comments`
--
ALTER TABLE `g_comments`
  ADD CONSTRAINT `g_comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `g_users` (`id`),
  ADD CONSTRAINT `g_comments_ibfk_2` FOREIGN KEY (`artist_media_id`) REFERENCES `g_artist_media` (`id`);

--
-- Constraints for table `g_likes`
--
ALTER TABLE `g_likes`
  ADD CONSTRAINT `g_likes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `g_users` (`id`),
  ADD CONSTRAINT `g_likes_ibfk_2` FOREIGN KEY (`artist_media_id`) REFERENCES `g_artist_media` (`id`);

--
-- Constraints for table `g_shares`
--
ALTER TABLE `g_shares`
  ADD CONSTRAINT `g_shares_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `g_users` (`id`),
  ADD CONSTRAINT `g_shares_ibfk_2` FOREIGN KEY (`artist_media_id`) REFERENCES `g_artist_media` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
