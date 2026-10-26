-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 26, 2026 at 07:34 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `stardust_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `founders`
--

CREATE TABLE `founders` (
  `id` int(11) NOT NULL,
  `full_name` varchar(120) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `founders`
--

INSERT INTO `founders` (`id`, `full_name`, `email`, `password_hash`, `phone`, `created_at`) VALUES
(1, 'Hiren Kariya', 'hirenkariya03@gmail.com', '$2y$10$iRXwGaL0Qv375E4zCwj0k.n/FeLZfGyvVhmnReQhvw0bZoPxrHTiO', NULL, '2026-09-26 12:47:22'),
(2, 'Hiren K', 'hirenkariya@gmail.com', '$2y$10$tfBJmurZyXxDwOo9PLAZEuzZK15xvIGQNgHL2256q01MA.ld6uK.K', NULL, '2026-09-26 17:46:01');

-- --------------------------------------------------------

--
-- Table structure for table `investors`
--

CREATE TABLE `investors` (
  `id` int(11) NOT NULL,
  `full_name` varchar(120) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `firm_name` varchar(150) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `investors`
--

INSERT INTO `investors` (`id`, `full_name`, `email`, `password_hash`, `firm_name`, `created_at`) VALUES
(2, 'H.P.Kariya', 'hpkariya@hotmail.com', '$2y$10$nxhdkd28tWFrGMkL8ZsH.u7NYi3yZlPZSxnzijYkJkgCjazylZzcW', NULL, '2026-09-26 17:51:41'),
(3, 'Karan Sharma', 'karans@gmail.com', '$2y$10$3G0PIS3TLfHK5w1NhmXUp.XX10saKIqFfxLEpcVjsxnAax8R6tW1y', 'Sindhi Pandit Matromony', '2026-09-26 20:24:09');

-- --------------------------------------------------------

--
-- Table structure for table `investor_notes`
--

CREATE TABLE `investor_notes` (
  `id` int(11) NOT NULL,
  `pitch_id` int(11) NOT NULL,
  `investor_id` int(11) NOT NULL,
  `note` text NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `investor_notes`
--

INSERT INTO `investor_notes` (`id`, `pitch_id`, `investor_id`, `note`, `created_at`) VALUES
(1, 2, 2, 'too hard but possible', '2026-09-26 17:52:30');

-- --------------------------------------------------------

--
-- Table structure for table `investor_preferences`
--

CREATE TABLE `investor_preferences` (
  `investor_id` int(11) NOT NULL,
  `industries` varchar(255) DEFAULT NULL,
  `funding_stages` varchar(255) DEFAULT NULL,
  `business_models` varchar(255) DEFAULT NULL,
  `ticket_size_min` int(11) DEFAULT 0,
  `ticket_size_max` int(11) DEFAULT 0,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `investor_preferences`
--

INSERT INTO `investor_preferences` (`investor_id`, `industries`, `funding_stages`, `business_models`, `ticket_size_min`, `ticket_size_max`, `notes`) VALUES
(2, 'SaaS,Fintech,HealthTech,EdTech,E-commerce,AgriTech,CleanTech,AI/ML,Consumer,DeepTech', 'Idea,Pre-seed,Seed,Series A,Series B+', 'Subscription,Marketplace,D2C,B2B,Freemium,Transactional', 100000, 2147483647, NULL),
(3, 'SaaS,Fintech,HealthTech,EdTech,E-commerce,AgriTech,CleanTech,AI/ML,Consumer,DeepTech', 'Idea,Pre-seed,Seed,Series A,Series B+', 'Subscription,Marketplace,D2C,B2B,Freemium,Transactional', 1, 2147483647, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `meetings`
--

CREATE TABLE `meetings` (
  `id` int(11) NOT NULL,
  `pitch_id` int(11) NOT NULL,
  `investor_id` int(11) NOT NULL,
  `founder_id` int(11) NOT NULL,
  `proposed_datetime` datetime NOT NULL,
  `message` text DEFAULT NULL,
  `status` enum('pending','confirmed','declined') NOT NULL DEFAULT 'pending',
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `meetings`
--

INSERT INTO `meetings` (`id`, `pitch_id`, `investor_id`, `founder_id`, `proposed_datetime`, `message`, `status`, `created_at`) VALUES
(2, 2, 3, 2, '2026-09-30 22:28:00', 'lets meet', 'pending', '2026-09-26 20:26:54'),
(3, 1, 3, 1, '2026-09-29 22:29:00', 'lets meet', 'pending', '2026-09-26 20:27:51');

-- --------------------------------------------------------

--
-- Table structure for table `pitches`
--

CREATE TABLE `pitches` (
  `id` int(11) NOT NULL,
  `founder_id` int(11) NOT NULL,
  `startup_name` varchar(150) NOT NULL,
  `tagline` varchar(200) DEFAULT NULL,
  `industry` varchar(80) NOT NULL,
  `funding_stage` varchar(60) NOT NULL,
  `business_model` varchar(60) NOT NULL,
  `funding_ask` int(11) NOT NULL DEFAULT 0,
  `team_size` int(11) DEFAULT 1,
  `website` varchar(200) DEFAULT NULL,
  `description` text NOT NULL,
  `problem_statement` text DEFAULT NULL,
  `traction` text DEFAULT NULL,
  `deck_filename` varchar(255) DEFAULT NULL,
  `deck_text_excerpt` text DEFAULT NULL,
  `deck_keywords` varchar(500) DEFAULT NULL,
  `status` enum('pending','in_review','shortlisted','rejected') NOT NULL DEFAULT 'pending',
  `submitted_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pitches`
--

INSERT INTO `pitches` (`id`, `founder_id`, `startup_name`, `tagline`, `industry`, `funding_stage`, `business_model`, `funding_ask`, `team_size`, `website`, `description`, `problem_statement`, `traction`, `deck_filename`, `deck_text_excerpt`, `deck_keywords`, `status`, `submitted_at`) VALUES
(1, 1, 'Stardust', 'We make investors life easy', 'Fintech', 'Pre-seed', 'D2C', 2147483647, 1, NULL, 'we make business easy. we work. we pay.', NULL, NULL, 'deck_1_1790407210_e22bb059.pdf', '', '', 'pending', '2026-09-26 12:50:10'),
(2, 2, 'sharkfin', 'we shine at what we do', 'HealthTech', 'Idea', 'B2B', 12000000, 1, NULL, 'We make affordable healthcare a reality in India. unlike other things we know our business is hard so is our persistent.', NULL, NULL, 'deck_2_1790425159_8026f50c.pdf', '', '', 'in_review', '2026-09-26 17:49:22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `founders`
--
ALTER TABLE `founders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `investors`
--
ALTER TABLE `investors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `investor_notes`
--
ALTER TABLE `investor_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pitch_id` (`pitch_id`),
  ADD KEY `investor_id` (`investor_id`);

--
-- Indexes for table `investor_preferences`
--
ALTER TABLE `investor_preferences`
  ADD PRIMARY KEY (`investor_id`);

--
-- Indexes for table `meetings`
--
ALTER TABLE `meetings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pitch_id` (`pitch_id`),
  ADD KEY `investor_id` (`investor_id`),
  ADD KEY `founder_id` (`founder_id`);

--
-- Indexes for table `pitches`
--
ALTER TABLE `pitches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `founder_id` (`founder_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `founders`
--
ALTER TABLE `founders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `investors`
--
ALTER TABLE `investors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `investor_notes`
--
ALTER TABLE `investor_notes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `meetings`
--
ALTER TABLE `meetings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pitches`
--
ALTER TABLE `pitches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `investor_notes`
--
ALTER TABLE `investor_notes`
  ADD CONSTRAINT `investor_notes_ibfk_1` FOREIGN KEY (`pitch_id`) REFERENCES `pitches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `investor_notes_ibfk_2` FOREIGN KEY (`investor_id`) REFERENCES `investors` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `investor_preferences`
--
ALTER TABLE `investor_preferences`
  ADD CONSTRAINT `investor_preferences_ibfk_1` FOREIGN KEY (`investor_id`) REFERENCES `investors` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `meetings`
--
ALTER TABLE `meetings`
  ADD CONSTRAINT `meetings_ibfk_1` FOREIGN KEY (`pitch_id`) REFERENCES `pitches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `meetings_ibfk_2` FOREIGN KEY (`investor_id`) REFERENCES `investors` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `meetings_ibfk_3` FOREIGN KEY (`founder_id`) REFERENCES `founders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pitches`
--
ALTER TABLE `pitches`
  ADD CONSTRAINT `pitches_ibfk_1` FOREIGN KEY (`founder_id`) REFERENCES `founders` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
