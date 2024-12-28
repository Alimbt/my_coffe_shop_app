-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 28, 2024 at 03:41 PM
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
-- Database: `coffee_shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `CartId` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `image_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`CartId`, `name`, `image_url`) VALUES
(1, 'Espresso', 'https://i.postimg.cc/HWvLBDQ4/espressohowto-11-1024x683.jpg'),
(2, 'Espresso', 'https://i.postimg.cc/HWvLBDQ4/espressohowto-11-1024x683.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `drinks`
--

CREATE TABLE `drinks` (
  `drinkId` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `description` text NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `stock_quantity` int(11) NOT NULL DEFAULT 0,
  `time_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `drinks`
--

INSERT INTO `drinks` (`drinkId`, `name`, `price`, `description`, `image_url`, `stock_quantity`, `time_created`) VALUES
(1, 'Espresso', 30, 'Delicious Espresso', 'https://i.postimg.cc/HWvLBDQ4/espressohowto-11-1024x683.jpg', 20, '2024-12-26 15:53:36'),
(2, 'Latte', 60, 'Delicious Latte', 'https://i.postimg.cc/QNFBLdNn/latte.webp', 25, '2024-12-26 15:53:36'),
(3, 'Moka', 80, 'Delicious Moka', 'https://i.postimg.cc/vH9cB2Vr/moka.jpg', 30, '2024-12-26 15:53:36'),
(4, 'Macha', 80, 'Delicious Macha', 'https://i.postimg.cc/9fXMLWNb/macha.jpg', 15, '2024-12-26 15:53:36'),
(5, 'Americano', 30, 'Delicious Americano', 'https://i.postimg.cc/PxPqkSH8/americano.jpg', 10, '2024-12-26 15:53:36'),
(6, 'Cappuccino', 40, 'Delicious Cappuccino', 'https://i.postimg.cc/1t23RDR7/Cappuccino.jpg', 18, '2024-12-26 15:53:36'),
(7, 'Tea', 10, 'Delicious Tea', 'https://i.postimg.cc/284SmqsT/tea.jpg', 22, '2024-12-26 15:53:36'),
(8, 'Hot chocolate', 45, 'Delicious Hot chocolate', 'https://i.postimg.cc/sgsD2jyz/Hot-Chocolate.jpg', 12, '2024-12-26 15:53:36'),
(9, 'V60 coffee', 105, 'Delicious V60 coffee', 'https://i.postimg.cc/CK6FJb8M/v60-Coffee.webp', 14, '2024-12-26 15:53:36'),
(10, 'Afogato', 70, 'Delicious Afogato', 'https://i.postimg.cc/WbPs9NdZ/afogato.jpg', 16, '2024-12-26 15:53:36');

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `food_id` int(11) DEFAULT NULL,
  `drink_Id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `foods`
--

CREATE TABLE `foods` (
  `FoodId` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `description` text NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `stock_quantity` int(11) NOT NULL DEFAULT 0,
  `time_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `foods`
--

INSERT INTO `foods` (`FoodId`, `name`, `price`, `description`, `image_url`, `stock_quantity`, `time_created`) VALUES
(1, 'Pizza pepperoni', 297, 'Delicious Pizza pepperoni', 'https://i.postimg.cc/8kLSf2Zz/Pepperoni-Pizza.webp', 10, '2024-12-26 14:33:49'),
(2, 'Pasta pesto', 153, 'Delicious Pasta pesto', 'https://i.postimg.cc/t4vQHp42/pasta-pesto.jpg', 20, '2024-12-26 14:33:49'),
(3, 'Pasta lingoiny', 186, 'Delicious Pasta lingoiny', 'https://i.postimg.cc/yxqkRmZG/pasta-lingoiny.jpg', 15, '2024-12-26 14:33:49'),
(4, 'Pizza napoly', 222, 'Delicious Pizza napoly', 'https://i.postimg.cc/1RYvkfZj/Napoli-Pizza.jpg', 12, '2024-12-26 14:33:49'),
(5, 'Garlic bread', 89, 'Delicious Garlic bread', 'https://i.postimg.cc/8CJvrPYj/Garlic-Bread.jpg', 25, '2024-12-26 14:33:49'),
(6, 'French fries', 59, 'Delicious French fries', 'https://i.postimg.cc/02K13Th7/French-fries.jpg', 30, '2024-12-26 14:33:49'),
(7, 'Pasta alferedo', 178, 'Delicious Pasta alferedo', 'https://i.postimg.cc/0Ns6rd7H/alfredo.webp', 18, '2024-12-26 14:33:49'),
(8, 'Cow steak', 459, 'Delicious Cow steak', 'https://i.postimg.cc/VN0TQtTk/steakCow.webp', 10, '2024-12-26 14:33:49'),
(9, 'Lamb steak', 586, 'Delicious Lamb steak', 'https://i.postimg.cc/zDFyvP7m/lamb-steak.jpg', 8, '2024-12-26 14:33:49'),
(10, 'Mac&Cheese', 125, 'Delicious Mac&Cheese', 'https://i.postimg.cc/Xv6WwnNs/mac-Cheese.jpg', 20, '2024-12-26 14:33:49');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `phone`, `address`, `created_at`) VALUES
(1, 'ali', 'alireza.afrang83@gmail.com', '12345678', '09940786487', 'awdaegfsfcvcvgvbewd', '2024-12-25 12:26:56');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`CartId`);

--
-- Indexes for table `drinks`
--
ALTER TABLE `drinks`
  ADD PRIMARY KEY (`drinkId`),
  ADD KEY `drinkId` (`drinkId`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`food_id`),
  ADD KEY `favorites_ibfk_3` (`drink_Id`);

--
-- Indexes for table `foods`
--
ALTER TABLE `foods`
  ADD PRIMARY KEY (`FoodId`),
  ADD UNIQUE KEY `foodid` (`FoodId`) USING BTREE,
  ADD UNIQUE KEY `FoodId_2` (`FoodId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `CartId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `drinks`
--
ALTER TABLE `drinks`
  MODIFY `drinkId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `foods`
--
ALTER TABLE `foods`
  MODIFY `FoodId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `foods` (`FoodId`) ON DELETE CASCADE,
  ADD CONSTRAINT `favorites_ibfk_3` FOREIGN KEY (`drink_Id`) REFERENCES `drinks` (`drinkId`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
