-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 29, 2018 at 06:51 AM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `it355`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `username`) VALUES
(1, 'korisnik'),
(4, 'proba123'),
(3, 'test1'),
(2, 'wewewewe');

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `cart_items_id` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `game_id` int(11) NOT NULL,
  `flag_id` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`cart_items_id`, `cart_id`, `game_id`, `flag_id`) VALUES
(58, 1, 7, 2),
(59, 1, 8, 2),
(60, 1, 9, 2),
(61, 1, 10, 2),
(62, 1, 14, 2),
(68, 3, 8, 2),
(69, 3, 9, 2),
(70, 3, 10, 1),
(74, 4, 9, 2),
(75, 4, 10, 2);

-- --------------------------------------------------------

--
-- Table structure for table `games`
--

CREATE TABLE `games` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `company` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `rating` double DEFAULT NULL,
  `votes` int(11) DEFAULT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `release_date` varchar(255) DEFAULT NULL,
  `size` double DEFAULT NULL,
  `enabled` bit(1) DEFAULT b'1',
  `genre_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `games`
--

INSERT INTO `games` (`id`, `name`, `company`, `description`, `price`, `rating`, `votes`, `cover`, `version`, `release_date`, `size`, `enabled`, `genre_id`) VALUES
(7, 'The Witcher 3', 'CD PROJEKT RED', 'In The Witcher, you play as Geralt of Rivia, a monster hunter tasked with finding a child from an ancient prophecy.', 29.99, 10, 124590, 'http://cdn.edgecast.steamstatic.com/steam/apps/292030/header.jpg?t=1509077015', '3.2.1', '18 May, 2015', 50, b'1', 4),
(8, 'The Elder Scrolls V: Skyrim Special Edition', 'Bethesda Studios', 'Winner of more than 200 Game of the Year Awards, Skyrim Special Edition brings the epic fantasy to life in stunning detail. The ', 25, 5, 124, 'http://cdn.akamai.steamstatic.com/steam/apps/489830/header.jpg?t=1481040018', '1.3.4', '2016-10-28', 12, b'1', 1),
(9, 'Witcher 2: Assassins Of Kings, The - Enhanced Edition', 'CD PROJEKT RED', 'The second installment in the RPG saga about the Witcher, Geralt of Rivia. A new, modern game engine, responsible both for beautiful visuals and sophisticated game mechanics puts players in the most lively and believable world ever created in an RPG game.', 44.99, 5, 2353, 'https://images-4.gog.com/8355e657a19311b158a3553a154e109199d6991c7791a20c3305af1f84d15ed7_196.jpg', '3.2', '2012-04-17', 15.2, b'1', 1),
(10, 'Gwent', 'CD PROJEKT RED', 'Cool CCG Card game from The Witcher Universe', 5, 4, 5215, 'https://images-2.gog.com/e8e4fa69db4d06ff58b7ef8bda2ea72e966f419baf2e248807520cda6244b7d8_196.jpg', '3.9.build', 'not yet', 5.55, b'1', 8),
(14, 'asdsadas', 'asdsadas', 'asdsadas', 15, 15, 15, '15', '15', '15', 15, b'1', 2);

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE `genres` (
  `genre_id` int(11) NOT NULL,
  `enabled` bit(1) DEFAULT b'1',
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`genre_id`, `enabled`, `name`) VALUES
(1, b'1', 'Action'),
(2, b'1', 'Adventure'),
(3, b'1', 'Indie'),
(4, b'1', 'RPG'),
(5, b'1', 'Shooters'),
(6, b'1', 'Simulation'),
(7, b'1', 'Sports'),
(8, b'1', 'Racing'),
(9, b'1', 'Strategy'),
(10, b'1', 'Fantasy'),
(11, b'1', 'Turn-based'),
(12, b'1', 'Point-and-click'),
(13, b'1', 'Horror'),
(14, b'1', 'Historical'),
(15, b'1', 'Real-Time'),
(16, b'1', 'Sci-fi'),
(18, b'1', 'asd'),
(19, b'1', 'rado'),
(20, b'1', 'qweewqeqwe'),
(21, b'1', 'grgrg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `email` varchar(50) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `user_role` varchar(25) NOT NULL DEFAULT 'USER'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `enabled`, `user_role`) VALUES
(1, 'admin', 'admin', 'asd', b'1', 'ADMIN'),
(5, 'jera', 'jera', 'sava@gmail.com', b'1', 'USER'),
(2, 'korisnik', 'korisnik', 'asd', b'1', 'USER'),
(9, 'korpan', 'korpan', 'korpan', b'1', 'USER'),
(8, 'proba123', 'proba123', 'proba123@gmail.com', b'1', 'USER'),
(3, 'sava', 'sava', 'asd', b'1', 'USER'),
(7, 'test1', 'test1', 'test1', b'1', 'USER'),
(10, 'wewewewe', 'wewewewe', 'wewewewe', b'1', 'USER');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `FK_4lga3gtrv9yq5c1t6dkdens5y` (`username`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`cart_items_id`),
  ADD KEY `FK_4p7dd2p61wsdx9j35wp6sugqr` (`cart_id`),
  ADD KEY `FK_5q872oyyuh47bdg1wr29cdxro` (`game_id`);

--
-- Indexes for table `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_ey34n3k9w5xg390gt8m346py9` (`genre_id`);

--
-- Indexes for table `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`genre_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`),
  ADD UNIQUE KEY `UK_6jvqtxgs6xvh0h0t261hurgqo` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `cart_items_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;
--
-- AUTO_INCREMENT for table `games`
--
ALTER TABLE `games`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `genres`
--
ALTER TABLE `genres`
  MODIFY `genre_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `FK_4lga3gtrv9yq5c1t6dkdens5y` FOREIGN KEY (`username`) REFERENCES `users` (`username`);

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `FK_4p7dd2p61wsdx9j35wp6sugqr` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`),
  ADD CONSTRAINT `FK_5q872oyyuh47bdg1wr29cdxro` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
