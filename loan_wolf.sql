-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 15, 2017 at 12:18 PM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `loan_wolf`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `acc_id` int(11) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `pass` varchar(50) NOT NULL,
  `type` enum('Regular','Banker','','') NOT NULL,
  `nbi_clearance` blob,
  `criminal_record` blob,
  `affiliation` varchar(50) DEFAULT NULL,
  `identification` blob
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `banker`
--

CREATE TABLE `banker` (
  `banker_id` int(11) NOT NULL,
  `position` varchar(50) NOT NULL,
  `department` varchar(50) NOT NULL,
  `acc_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `borrower`
--

CREATE TABLE `borrower` (
  `borrower_id` int(11) NOT NULL,
  `proof_of_income` blob,
  `bank_statements` blob,
  `acc_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `collateral`
--

CREATE TABLE `collateral` (
  `collateral_id` int(11) NOT NULL,
  `collateral_type` varchar(50) NOT NULL,
  `monetary_worth` int(11) NOT NULL,
  `proof_of_ownership` text NOT NULL,
  `borrower_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `loan_negotiation`
--

CREATE TABLE `loan_negotiation` (
  `loan_negotiation_id` int(11) NOT NULL,
  `interest_rate` float NOT NULL,
  `negotiation_status` enum('Pending','Approved','Rejected') NOT NULL,
  `payment_duration` int(11) NOT NULL,
  `loan_request_id` int(11) NOT NULL,
  `banker_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `loan_request`
--

CREATE TABLE `loan_request` (
  `loan_request_id` int(11) NOT NULL,
  `amount_loan` int(11) NOT NULL,
  `date_requested` date NOT NULL,
  `borrower_id` int(11) NOT NULL,
  `collateral_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `loan_transaction`
--

CREATE TABLE `loan_transaction` (
  `loan_transaction_id` int(11) NOT NULL,
  `base_amount` int(11) NOT NULL,
  `extra_payment` int(11) NOT NULL DEFAULT '0',
  `transaction_status` enum('Pending','Completed') NOT NULL,
  `date_issued` date NOT NULL,
  `date_completed` date DEFAULT NULL,
  `loan_negotiation_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`acc_id`);

--
-- Indexes for table `banker`
--
ALTER TABLE `banker`
  ADD PRIMARY KEY (`banker_id`),
  ADD KEY `lender_fk` (`acc_id`);

--
-- Indexes for table `borrower`
--
ALTER TABLE `borrower`
  ADD PRIMARY KEY (`borrower_id`),
  ADD KEY `borrower_fk` (`acc_id`);

--
-- Indexes for table `collateral`
--
ALTER TABLE `collateral`
  ADD PRIMARY KEY (`collateral_id`),
  ADD KEY `colleteral_fk` (`borrower_id`);

--
-- Indexes for table `loan_negotiation`
--
ALTER TABLE `loan_negotiation`
  ADD PRIMARY KEY (`loan_negotiation_id`),
  ADD KEY `loan_negotiation_fk` (`loan_request_id`),
  ADD KEY `banker_id` (`banker_id`);

--
-- Indexes for table `loan_request`
--
ALTER TABLE `loan_request`
  ADD PRIMARY KEY (`loan_request_id`),
  ADD KEY `loan_request_fk` (`borrower_id`);

--
-- Indexes for table `loan_transaction`
--
ALTER TABLE `loan_transaction`
  ADD PRIMARY KEY (`loan_transaction_id`),
  ADD KEY `loan_transaction_fk1` (`loan_negotiation_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `acc_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `banker`
--
ALTER TABLE `banker`
  MODIFY `banker_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `borrower`
--
ALTER TABLE `borrower`
  MODIFY `borrower_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `collateral`
--
ALTER TABLE `collateral`
  MODIFY `collateral_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `loan_negotiation`
--
ALTER TABLE `loan_negotiation`
  MODIFY `loan_negotiation_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `loan_request`
--
ALTER TABLE `loan_request`
  MODIFY `loan_request_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `loan_transaction`
--
ALTER TABLE `loan_transaction`
  MODIFY `loan_transaction_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `banker`
--
ALTER TABLE `banker`
  ADD CONSTRAINT `lender_fk` FOREIGN KEY (`acc_id`) REFERENCES `account` (`acc_id`);

--
-- Constraints for table `borrower`
--
ALTER TABLE `borrower`
  ADD CONSTRAINT `borrower_fk` FOREIGN KEY (`acc_id`) REFERENCES `account` (`acc_id`);

--
-- Constraints for table `collateral`
--
ALTER TABLE `collateral`
  ADD CONSTRAINT `colleteral_fk` FOREIGN KEY (`borrower_id`) REFERENCES `borrower` (`borrower_id`);

--
-- Constraints for table `loan_negotiation`
--
ALTER TABLE `loan_negotiation`
  ADD CONSTRAINT `loan_negotiation_fk` FOREIGN KEY (`loan_request_id`) REFERENCES `loan_request` (`loan_request_id`),
  ADD CONSTRAINT `loan_negotiation_fk2` FOREIGN KEY (`banker_id`) REFERENCES `banker` (`banker_id`);

--
-- Constraints for table `loan_request`
--
ALTER TABLE `loan_request`
  ADD CONSTRAINT `loan_request_fk` FOREIGN KEY (`borrower_id`) REFERENCES `borrower` (`borrower_id`);

--
-- Constraints for table `loan_transaction`
--
ALTER TABLE `loan_transaction`
  ADD CONSTRAINT `loan_transaction_fk1` FOREIGN KEY (`loan_negotiation_id`) REFERENCES `loan_negotiation` (`loan_negotiation_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
