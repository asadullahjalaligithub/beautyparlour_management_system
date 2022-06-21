-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 07, 2020 at 02:13 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `beatysalon`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `apt_id` int(10) NOT NULL,
  `apt_name` varchar(100) NOT NULL,
  `apt_date` date NOT NULL,
  `apt_time` varchar(50) NOT NULL,
  `det_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`apt_id`, `apt_name`, `apt_date`, `apt_time`, `det_id`) VALUES
(1, 'next week wedding', '2020-03-13', '1:30am', 1);

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `cli_id` int(10) NOT NULL,
  `cli_name` varchar(100) NOT NULL,
  `cli_age` int(10) NOT NULL,
  `cli_gender` varchar(10) NOT NULL,
  `cli_phone` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`cli_id`, `cli_name`, `cli_age`, `cli_gender`, `cli_phone`) VALUES
(2, '345', 345, 'Male', 456),
(3, 'ert', 56, 'Male', 3456),
(4, 'ahmadullah', 23, 'Male', 4563245);

-- --------------------------------------------------------

--
-- Table structure for table `client_makeupt`
--

CREATE TABLE `client_makeupt` (
  `cli_m_id` int(10) NOT NULL,
  `cli_m_time` varchar(20) NOT NULL,
  `cli_id` int(10) NOT NULL,
  `det_id` int(10) NOT NULL,
  `cli_m_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client_makeupt`
--

INSERT INTO `client_makeupt` (`cli_m_id`, `cli_m_time`, `cli_id`, `det_id`, `cli_m_date`) VALUES
(2, '1:00am', 2, 1, '2020-03-18'),
(3, '3:30am', 4, 1, '2020-03-20');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `dept_id` int(10) NOT NULL,
  `dept_name` varchar(100) NOT NULL,
  `dept_desc` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`dept_id`, `dept_name`, `dept_desc`) VALUES
(1, 'Makup', 'Turkey Makeup'),
(2, 'Hair condition', 'just for design');

-- --------------------------------------------------------

--
-- Table structure for table `details`
--

CREATE TABLE `details` (
  `det_id` int(10) NOT NULL,
  `details_name` varchar(100) NOT NULL,
  `details_price` int(10) NOT NULL,
  `s_d_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `details`
--

INSERT INTO `details` (`det_id`, `details_name`, `details_price`, `s_d_id`) VALUES
(1, 'full bridge makeup', 50000, 2);

-- --------------------------------------------------------

--
-- Table structure for table `expences`
--

CREATE TABLE `expences` (
  `exp_id` int(10) NOT NULL,
  `exp_date` date NOT NULL,
  `shop_rent` int(10) NOT NULL,
  `other_expenses` int(10) NOT NULL,
  `elect_exp` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `staffmember`
--

CREATE TABLE `staffmember` (
  `stf_id` int(10) NOT NULL,
  `staf_name` varchar(50) NOT NULL,
  `stf_phone` varchar(20) NOT NULL,
  `stf_sal` int(10) NOT NULL,
  `stf_addr` varchar(100) NOT NULL,
  `dept_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staffmember`
--

INSERT INTO `staffmember` (`stf_id`, `staf_name`, `stf_phone`, `stf_sal`, `stf_addr`, `dept_id`) VALUES
(2, 'ewrt', 'wert', 356456, 'sdfg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sub_department`
--

CREATE TABLE `sub_department` (
  `s_d_id` int(10) NOT NULL,
  `M_name` varchar(100) NOT NULL,
  `M_desc` varchar(100) NOT NULL,
  `dept_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sub_department`
--

INSERT INTO `sub_department` (`s_d_id`, `M_name`, `M_desc`, `dept_id`) VALUES
(1, 'cleaning', 'just for cleaning', 2),
(2, 'urgent', 'for urgent cleaning', 1),
(4, 'asdf asdfasdf', 'asdf', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `userid` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`, `userid`) VALUES
('sharifullah', 'sharifullah', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`apt_id`),
  ADD KEY `details_f_key2` (`det_id`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`cli_id`);

--
-- Indexes for table `client_makeupt`
--
ALTER TABLE `client_makeupt`
  ADD PRIMARY KEY (`cli_m_id`),
  ADD KEY `details_f_key` (`det_id`),
  ADD KEY `client_f_key` (`cli_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`dept_id`);

--
-- Indexes for table `details`
--
ALTER TABLE `details`
  ADD PRIMARY KEY (`det_id`),
  ADD KEY `s_d_f_k` (`s_d_id`);

--
-- Indexes for table `expences`
--
ALTER TABLE `expences`
  ADD PRIMARY KEY (`exp_id`);

--
-- Indexes for table `staffmember`
--
ALTER TABLE `staffmember`
  ADD PRIMARY KEY (`stf_id`),
  ADD KEY `department_f_key` (`dept_id`);

--
-- Indexes for table `sub_department`
--
ALTER TABLE `sub_department`
  ADD PRIMARY KEY (`s_d_id`),
  ADD KEY `department_f_key2` (`dept_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userid`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `apt_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `cli_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `client_makeupt`
--
ALTER TABLE `client_makeupt`
  MODIFY `cli_m_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `dept_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `details`
--
ALTER TABLE `details`
  MODIFY `det_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `expences`
--
ALTER TABLE `expences`
  MODIFY `exp_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staffmember`
--
ALTER TABLE `staffmember`
  MODIFY `stf_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sub_department`
--
ALTER TABLE `sub_department`
  MODIFY `s_d_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `details_f_key2` FOREIGN KEY (`det_id`) REFERENCES `details` (`det_id`);

--
-- Constraints for table `client_makeupt`
--
ALTER TABLE `client_makeupt`
  ADD CONSTRAINT `client_f_key` FOREIGN KEY (`cli_id`) REFERENCES `client` (`cli_id`),
  ADD CONSTRAINT `details_f_key` FOREIGN KEY (`det_id`) REFERENCES `details` (`det_id`);

--
-- Constraints for table `details`
--
ALTER TABLE `details`
  ADD CONSTRAINT `s_d_f_k` FOREIGN KEY (`s_d_id`) REFERENCES `sub_department` (`s_d_id`);

--
-- Constraints for table `staffmember`
--
ALTER TABLE `staffmember`
  ADD CONSTRAINT `department_f_key` FOREIGN KEY (`dept_id`) REFERENCES `department` (`dept_id`);

--
-- Constraints for table `sub_department`
--
ALTER TABLE `sub_department`
  ADD CONSTRAINT `department_f_key2` FOREIGN KEY (`dept_id`) REFERENCES `department` (`dept_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
