-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 30, 2021 at 12:46 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vfd`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `c_id` int(11) NOT NULL,
  `c_name` text NOT NULL,
  `c_number` text NOT NULL,
  `c_type` text NOT NULL,
  `c_email` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`c_id`, `c_name`, `c_number`, `c_type`, `c_email`) VALUES
(1, 'Order', '+91-8547153295', 'WhatsApp', NULL),
(2, 'Inquiry', '+91-7293270347', 'Mobile', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `food_items`
--

CREATE TABLE `food_items` (
  `id` int(11) NOT NULL,
  `name` text CHARACTER SET utf8 NOT NULL,
  `search_tags` text CHARACTER SET utf8 NOT NULL,
  `food_type_id` int(11) NOT NULL,
  `description` text CHARACTER SET utf8 NOT NULL,
  `short_desc` text CHARACTER SET utf8 NOT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `image` text CHARACTER SET utf8 NOT NULL DEFAULT 'default.jpg',
  `unit_price` decimal(13,2) NOT NULL,
  `min_order_qty` int(11) NOT NULL,
  `order_type_id` int(11) DEFAULT NULL,
  `w_app_order_contact_id` int(11) NOT NULL,
  `call_order_contact_id` int(11) NOT NULL,
  `is_active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `food_items`
--

INSERT INTO `food_items` (`id`, `name`, `search_tags`, `food_type_id`, `description`, `short_desc`, `sale_id`, `image`, `unit_price`, `min_order_qty`, `order_type_id`, `w_app_order_contact_id`, `call_order_contact_id`, `is_active`) VALUES
(1, 'ഇഡ്ഡലി', 'idli, idali, iddli, idili', 1, 'പുളിപ്പിച്ച അരിയും പയറും ഉപയോഗിച്ചാണ് ഇത് നിർമ്മിക്കുന്നത്', 'പുളിപ്പിച്ച അരിയും പയറും ഉപയോഗിച്ചാണ് ഇത് നിർമ്മിക്കുന്നത്', 2, '1.jpg', '5.00', 6, NULL, 1, 2, 1),
(2, 'പ്ലെയിൻ ദോശ', 'dosa, plain dosa', 1, 'പുളിപ്പിച്ച അരിയും പയറും ഉപയോഗിച്ചാണ് ഇത് നിർമ്മിക്കുന്നത്', 'പുളിപ്പിച്ച അരിയും പയറും ഉപയോഗിച്ചാണ് ഇത് നിർമ്മിക്കുന്നത്', 2, '2.jpg', '5.00', 6, NULL, 1, 2, 1),
(3, 'മസാല ദോശ', 'masala dosa, dosa, masala', 1, 'പുളിപ്പിച്ച അരിയും പയറും ഉപയോഗിച്ചാണ് ഇത് നിർമ്മിക്കുന്നത്', 'പുളിപ്പിച്ച അരിയും പയറും ഉപയോഗിച്ചാണ് ഇത് നിർമ്മിക്കുന്നത്', 1, '3.jpg', '30.00', 1, NULL, 1, 2, 1),
(4, 'റവ ദോശ', 'rava dosa, rava, dosa, ', 1, 'പുളിപ്പിച്ച അരിയും പയറും ഉപയോഗിച്ചാണ് ഇത് നിർമ്മിക്കുന്നത്', 'പുളിപ്പിച്ച അരിയും പയറും ഉപയോഗിച്ചാണ് ഇത് നിർമ്മിക്കുന്നത്', 1, 'default.jpg', '25.00', 1, NULL, 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `food_type`
--

CREATE TABLE `food_type` (
  `t_id` int(11) NOT NULL,
  `t_name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `food_type`
--

INSERT INTO `food_type` (`t_id`, `t_name`) VALUES
(1, 'Vegetarian'),
(2, 'Non - Vegetarian');

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `o_id` int(11) NOT NULL,
  `o_desc` text NOT NULL,
  `o_reduction_amt` decimal(13,2) NOT NULL DEFAULT 0.00,
  `is_percent` int(11) NOT NULL DEFAULT 0,
  `o_from_date` datetime NOT NULL,
  `o_valid_to` datetime NOT NULL,
  `is_active` int(11) NOT NULL,
  `o_created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `o_modified_on` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `offers`
--

INSERT INTO `offers` (`o_id`, `o_desc`, `o_reduction_amt`, `is_percent`, `o_from_date`, `o_valid_to`, `is_active`, `o_created_on`, `o_modified_on`) VALUES
(1, 'Buy 2 Get 1 Free!', '0.00', 0, '2021-03-29 13:02:08', '2021-03-31 13:02:08', 1, '2021-03-29 13:03:18', '0000-00-00 00:00:00'),
(2, '25% off!', '25.00', 1, '2021-03-29 09:32:08', '2021-03-30 13:02:08', 1, '2021-03-29 13:03:18', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `od_id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL,
  `od_status` int(11) NOT NULL,
  `od_date` datetime NOT NULL DEFAULT current_timestamp(),
  `od_shipped_date` datetime NOT NULL,
  `od_req_date` datetime NOT NULL,
  `store_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `oi_id` int(11) NOT NULL,
  `od_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `oi_qty` int(11) NOT NULL,
  `oi_list_price` decimal(13,2) NOT NULL,
  `offer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`c_id`);

--
-- Indexes for table `food_items`
--
ALTER TABLE `food_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `food_type`
--
ALTER TABLE `food_type`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`o_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`od_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`oi_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `food_items`
--
ALTER TABLE `food_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `food_type`
--
ALTER TABLE `food_type`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `o_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `od_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `oi_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
