-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 12, 2025 at 08:07 PM
-- Server version: 10.11.11-MariaDB-0+deb12u1
-- PHP Version: 8.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `adhdplatform`
--

-- --------------------------------------------------------

--
-- Table structure for table `badges`
--

CREATE TABLE `badges` (
  `badge_id` int(11) NOT NULL,
  `badge_name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `icon` varchar(255) NOT NULL,
  `condition_type` enum('streak','xp') NOT NULL,
  `condition_value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `badges`
--

INSERT INTO `badges` (`badge_id`, `badge_name`, `description`, `icon`, `condition_type`, `condition_value`) VALUES
(4, 'Starter Streak', 'Achieve a 1-day streak', 'starterstreak.png', 'streak', 1),
(5, 'Consistency Champ', 'Achieve a 7-day streak', 'consistencychamp.png', 'streak', 7),
(6, 'Perseverance Pro', 'Achieve a 30-day streak', 'perseverancepro.jpg', 'streak', 30),
(7, 'XP Novice', 'Reach 100 XP', 'xpnovice.jpg', 'xp', 100),
(8, 'XP Master', 'Reach 500 XP', 'xpmaster.jpg', 'xp', 500);

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `book_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `author` varchar(100) DEFAULT NULL,
  `file_path` varchar(255) NOT NULL,
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`book_id`, `user_id`, `title`, `author`, `file_path`, `uploaded_at`) VALUES
(4, 1, 'Blood Over Bright Haven', 'M. L. Wang', '../uploads/Blood Over Bright Haven (M. L. Wang) (Z-Library).pdf', '2025-02-19 14:33:48'),
(5, 1, 'Fourth Wing', 'Rebecca Yarros', '../uploads/Fourth Wing (Rebecca Yarros) (Z-Library).pdf', '2025-02-19 14:42:17'),
(6, 1, 'The Naturals', 'Jennifer Lynn Barnes', '../uploads/The Naturals (The Naturals 1) (Jennifer Lynn Barnes) (Z-Library).pdf', '2025-02-19 20:52:07'),
(7, 1, 'Binding 13', 'Chloe Walsh', '../uploads/Binding 13 (Chloe Walsh) (Z-Library).pdf', '2025-02-19 20:53:38'),
(8, 1, 'Wild Love', 'Elsie Silver', '../uploads/Wild Love (Rose Hill Book 1) (Elsie Silver) (Z-Library).pdf', '2025-03-26 10:45:42'),
(9, 1, 'Twelve', 'Jennifer Lynn Barnes', '../uploads/Twelve (The Naturals 4.5) (Jennifer Lynn Barnes) (Z-Library).pdf', '2025-03-31 13:08:02'),
(13, 5, 'Romancing Mister Bridgeton', 'Julia Quinn', '../uploads/romancing-mister-bridgerton.pdf', '2025-04-11 12:35:40'),
(14, 1, 'All In', 'Jennifer Lynn Barnes', '../uploads/All In (The Naturals 3) (Jennifer Lynn Barnes) (Z-Library).pdf', '2025-04-11 12:45:51'),
(15, 4, 'Powerless', 'Lauren Roberts', '../uploads/Powerless (Lauren Roberts) .pdf', '2025-04-11 13:02:20');

-- --------------------------------------------------------

--
-- Table structure for table `streaks`
--

CREATE TABLE `streaks` (
  `user_id` int(11) NOT NULL,
  `streak_count` int(11) DEFAULT 0,
  `last_active` date NOT NULL,
  `xp_points` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `streaks`
--

INSERT INTO `streaks` (`user_id`, `streak_count`, `last_active`, `xp_points`) VALUES
(1, 1, '2025-04-11', 25),
(4, 1, '2025-04-11', 25),
(5, 2, '2025-04-12', 20),
(6, 1, '2025-04-12', 10);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `created_at`) VALUES
(1, 'jobabyy', 'abamensah16@gmail.com', '$2y$10$ISItsjaejjzryA18uATJAORp3jzP3fktBzV28Qa2tuqeYUNJMq19S', '2025-02-12 20:33:57'),
(4, 'joana', 'joana.aba@ashesi.edu.gh', '$2y$10$eSJyEtHZeYBiFvb1pipHQefvSU3UpLrokm7kMzJQ3.NoV29me.jvC', '2025-03-26 11:58:01'),
(5, 'eggy', 'koshienaa@icloud.com', '$2y$10$QW4V384IoJ4sLlC6pdTpE.8PX1UU5Zd0V1EzIU5C6V4iGsBQ6Muvm', '2025-04-11 01:30:19'),
(6, 'eric', 'naafari1234@gmail.com', '$2y$10$9rW9Tu5QTmkF7ECG1P12V.fCFZB/.96.v2eCUIeYOMX0gJlp7PWu6', '2025-04-12 15:04:45');

-- --------------------------------------------------------

--
-- Table structure for table `user_alerts`
--

CREATE TABLE `user_alerts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `alert_count` int(11) DEFAULT 1,
  `timestamp` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_alerts`
--

INSERT INTO `user_alerts` (`id`, `user_id`, `alert_count`, `timestamp`) VALUES
(96, 5, 1, '2025-04-12 19:53:53'),
(97, 5, 1, '2025-04-12 19:53:58'),
(98, 5, 1, '2025-04-12 19:57:18'),
(99, 1, 0, '2025-04-12 19:57:31'),
(100, 5, 0, '2025-04-12 19:58:05'),
(101, 5, 0, '2025-04-12 19:58:12');

-- --------------------------------------------------------

--
-- Table structure for table `user_badges`
--

CREATE TABLE `user_badges` (
  `user_badge_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `badge_id` int(11) NOT NULL,
  `date_earned` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_badges`
--

INSERT INTO `user_badges` (`user_badge_id`, `user_id`, `badge_id`, `date_earned`) VALUES
(1, 1, 4, '2025-04-02 12:05:53'),
(2, 5, 4, '2025-04-11 01:30:29'),
(3, 4, 4, '2025-04-11 12:37:40'),
(4, 6, 4, '2025-04-12 15:04:58');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `badges`
--
ALTER TABLE `badges`
  ADD PRIMARY KEY (`badge_id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`book_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `streaks`
--
ALTER TABLE `streaks`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_alerts`
--
ALTER TABLE `user_alerts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_badges`
--
ALTER TABLE `user_badges`
  ADD PRIMARY KEY (`user_badge_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `badge_id` (`badge_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `badges`
--
ALTER TABLE `badges`
  MODIFY `badge_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_alerts`
--
ALTER TABLE `user_alerts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `user_badges`
--
ALTER TABLE `user_badges`
  MODIFY `user_badge_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `streaks`
--
ALTER TABLE `streaks`
  ADD CONSTRAINT `streaks_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_badges`
--
ALTER TABLE `user_badges`
  ADD CONSTRAINT `user_badges_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `user_badges_ibfk_2` FOREIGN KEY (`badge_id`) REFERENCES `badges` (`badge_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
