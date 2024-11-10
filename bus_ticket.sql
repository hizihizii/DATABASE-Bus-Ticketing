-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 13, 2023 at 02:00 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bus_ticket`
--

-- --------------------------------------------------------

--
-- Table structure for table `bus`
--

CREATE TABLE `bus` (
  `bus_id` varchar(50) NOT NULL PRIMARY KEY ,
  `bus_name` varchar(50) NOT NULL,
  `capacity` int(11) NOT NULL,
  `bus_type` varchar(50) NOT NULL,
  `driver_id` varchar(50) NOT NULL,
  CHECK(bus_id REGEXP '^B[0-9]{3}$')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bus`
--

INSERT INTO `bus` (`bus_id`, `bus_name`, `capacity`, `bus_type`, `driver_id`) VALUES
('B001', 'Bus One', 49, 'Express', 'DR001'),
('B002', 'Bus Two', 39, 'Local', 'DR002'),
('B003', 'Bus Three', 59, 'Luxury', 'DR003'),
('B004', 'Bus Four', 29, 'Shuttle', 'DR004'),
('B005', 'Bus Five', 44, 'Express', 'DR005'),
('B006', 'Bus Six', 55, 'Luxury', 'DR001'),
('B007', 'Bus Seven', 50, 'Express', 'DR002'),
('B008', 'Bus Eight', 40, 'Local', 'DR003'),
('B009', 'Bus Nine', 60, 'Luxury', 'DR004'),
('B010', 'Bus Ten', 30, 'Shuttle', 'DR005');

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE `driver` (
  `driver_id` varchar(50) NOT NULL PRIMARY KEY,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `license_number` varchar(20) NOT NULL,
  `phone` varchar(20) NOT NULL
  CHECK(driver_id REGEXP '^DR[0-9]{3}$')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `driver`
--

INSERT INTO `driver` (`driver_id`, `first_name`, `last_name`, `license_number`, `phone`) VALUES
('DR001', 'Michael', 'Johnson', 'DL12345', '123-456-7890'),
('DR002', 'Emily', 'Williams', 'DL67890', '987-654-3210'),
('DR003', 'Daniel', 'Smith', 'DL54321', '555-123-4567'),
('DR004', 'Sophia', 'Jones', 'DL98765', '987-987-6543'),
('DR005', 'Olivia', 'Anderson', 'DL45678', '111-222-3333');

-- --------------------------------------------------------

--
-- Stand-in structure for view `informasiticketbypenumpang`
-- (See below for the actual view)
--
CREATE TABLE `informasiticketbypenumpang` (
`ticket_id` varchar(50)  NOT NULL PRIMARY KEY,
,`seat_number` varchar(10) NOT NULL,
,`status` varchar(50) NOT NULL,
,`booking_date` date NOT NULL,
,`passenger_first_name` varchar(50) NOT NULL,
,`passenger_last_name` varchar(50),
,`departure_time` time NOT NULL,
,`arrival_time` time,
,`day_of_week` varchar(15) NOT NULL
 
);

-- --------------------------------------------------------

--
-- Table structure for table `passenger`
--

CREATE TABLE `passenger` (
  `passenger_id` varchar(50) NOT NULL PRIMARY KEY,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(50) NOT NULL
  CHECK(passenger_id REGEXP '^PG[0-9]{3}$')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `passenger`
--

INSERT INTO `passenger` (`passenger_id`, `first_name`, `last_name`, `email`, `phone`, `address`) VALUES
('PG001', 'John', 'Doe', 'john.doe@email.com', '1234567890', '123 Main St'),
('PG002', 'Jane', 'Smith', 'jane.smith@email.com', '9876543210', '456 Oak St'),
('PG003', 'Alice', 'Johnson', 'alice.johnson@email.com', '5551234567', '789 Pine St'),
('PG004', 'Bob', 'Williams', 'bob.williams@email.com', '9879876543', '321 Cedar St'),
('PG005', 'Eva', 'Anderson', 'eva.anderson@email.com', '1112223333', '567 Birch St');

-- --------------------------------------------------------

--
-- Stand-in structure for view `passenger_with_unique_id`
-- (See below for the actual view)
--
CREATE TABLE `passenger_with_unique_id` (
`passenger_id` varchar(50)
,`first_name` varchar(50)
,`last_name` varchar(50)
,`email` varchar(50)
,`phone` varchar(20)
,`address` varchar(50)
,`unique_id` varchar(105)
);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` varchar(50) NOT NULL PRIMARY KEY,
  `ticket_id` varchar(50) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_date` date NOT NULL,
  `payment_method` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `ticket_id`, `amount`, `payment_date`, `payment_method`) VALUES
('PYM001', 'TC001', 50.00, '2023-01-02', 'Credit Card'),
('PYM002', 'TC002', 45.00, '2023-02-20', 'PayPal'),
('PYM003', 'TC003', 60.00, '2023-03-25', 'Cash'),
('PYM004', 'TC004', 75.00, '2023-04-10', 'Credit Card'),
('PYM005', 'TC005', 55.00, '2023-05-15', 'Cash');

-- --------------------------------------------------------

--
-- Table structure for table `route`
--

CREATE TABLE `route` (
  `route_id` varchar(50) NOT NULL PRIMARY KEY
  `source_city` varchar(50) NOT NULL,
  `destination_city` varchar(50) NOT NULL,
  `terminal_keberangkatan` varchar(50) NOT NULL,
  `terminal_kehadiran` varchar(50) NOT NULL,
  `distance` int(11) NOT NULL,
  `estimasi_waktu` time NOT NULL,
  `bus_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `route`
--

INSERT INTO `route` (`route_id`, `source_city`, `destination_city`, `terminal_keberangkatan`, `terminal_kehadiran`, `distance`, `estimasi_waktu`, `bus_id`) VALUES
('RT001', 'City A', 'City B', 'Terminal A', 'Terminal B', 100, '02:30:00', 'B001'),
('RT002', 'City B', 'City A', 'Terminal B', 'Terminal A', 150, '03:15:00', 'B002'),
('RT003', 'City A', 'City B', 'Terminal A', 'Terminal B', 100, '02:45:00', 'B003'),
('RT004', 'City A', 'City B', 'Terminal A', 'Terminal B', 100, '04:00:00', 'B003'),
('RT005', 'City E', 'City F', 'Terminal E', 'Terminal F', 180, '03:45:00', 'B004'),
('RT006', 'City E', 'City F', 'Terminal E', 'Terminal F', 160, '03:00:00', 'B006'),
('RT007', 'City H', 'City I', 'Terminal H', 'Terminal I', 130, '02:15:00', 'B007'),
('RT008', 'City H', 'City I', 'Terminal H', 'Terminal I', 170, '03:30:00', 'B008'),
('RT009', 'City I', 'City J', 'Terminal I', 'Terminal J', 140, '02:00:00', 'B009'),
('RT010', 'City J', 'City K', 'Terminal J', 'Terminal K', 110, '01:45:00', 'B010');

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `schedule_id` varchar(50) NOT NULL PRIMARY KEY,
  `bus_id` varchar(50) NOT NULL,
  `route_id` varchar(50) NOT NULL,
  `departure_time` time NOT NULL,
  `arrival_time` time NOT NULL,
  `day_of_week` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`schedule_id`, `bus_id`, `route_id`, `departure_time`, `arrival_time`, `day_of_week`) VALUES
('SH001', 'B001', 'RT001', '08:00:00', '10:30:00', 'Monday'),
('SH002', 'B002', 'RT002', '12:00:00', '15:15:00', 'Wednesday'),
('SH003', 'B003', 'RT003', '10:30:00', '13:15:00', 'Friday'),
('SH004', 'B004', 'RT004', '14:00:00', '18:00:00', 'Sunday'),
('SH005', 'B005', 'RT005', '16:30:00', '20:15:00', 'Tuesday'),
('SH006', 'B006', 'RT006', '09:45:00', '12:45:00', 'Thursday'),
('SH007', 'B007', 'RT007', '11:15:00', '13:30:00', 'Saturday'),
('SH008', 'B008', 'RT008', '13:30:00', '17:00:00', 'Monday'),
('SH009', 'B009', 'RT009', '15:00:00', '17:45:00', 'Wednesday'),
('SH010', 'B010', 'RT010', '17:45:00', '20:30:00', 'Friday');

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `ticket_id` varchar(50) NOT NULL PRIMARY KEY,
  `schedule_id` varchar(50) NOT NULL,
  `passenger_id` varchar(50) NOT NULL,
  `seat_number` varchar(10) NOT NULL,
  `status` varchar(50) NOT NULL,
  `booking_date` date NOT NULL
  CHECK(ticket_id REGEXP '^TC[0-9]{3}$')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`ticket_id`, `schedule_id`, `passenger_id`, `seat_number`, `status`, `booking_date`) VALUES
('TC001', 'SH001', 'PG001', 'A01', 'Booked', '2023-01-01'),
('TC002', 'SH002', 'PG002', 'B05', 'Booked', '2023-02-15'),
('TC003', 'SH003', 'PG003', 'C10', 'Booked', '2023-03-20'),
('TC004', 'SH004', 'PG004', 'D03', 'Booked', '2023-04-05'),
('TC005', 'SH005', 'PG005', 'E08', 'Booked', '2023-05-10');

--
-- Triggers `ticket`
--
DELIMITER $$
CREATE TRIGGER `update_bus_capacity` AFTER INSERT ON `ticket` FOR EACH ROW BEGIN
    UPDATE Bus
    SET capacity = capacity - 1
    WHERE bus_id = (SELECT bus_id FROM Schedule WHERE schedule_id = NEW.schedule_id);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure for view `informasiticketbypenumpang`
--
DROP TABLE IF EXISTS `informasiticketbypenumpang`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `informasiticketbypenumpang`  AS SELECT `t`.`ticket_id` AS `ticket_id`, `t`.`seat_number` AS `seat_number`, `t`.`status` AS `status`, `t`.`booking_date` AS `booking_date`, `p`.`first_name` AS `passenger_first_name`, `p`.`last_name` AS `passenger_last_name`, `s`.`departure_time` AS `departure_time`, `s`.`arrival_time` AS `arrival_time`, `s`.`day_of_week` AS `day_of_week` FROM ((`ticket` `t` join `passenger` `p` on(`t`.`passenger_id` = `p`.`passenger_id`)) join `schedule` `s` on(`t`.`schedule_id` = `s`.`schedule_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `passenger_with_unique_id`
--
DROP TABLE IF EXISTS `passenger_with_unique_id`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `passenger_with_unique_id`  AS SELECT `passenger`.`passenger_id` AS `passenger_id`, `passenger`.`first_name` AS `first_name`, `passenger`.`last_name` AS `last_name`, `passenger`.`email` AS `email`, `passenger`.`phone` AS `phone`, `passenger`.`address` AS `address`, concat(substring_index(`passenger`.`email`,'@',1),'-',lpad(substr(`passenger`.`passenger_id`,3),3,'0'),'-',reverse(substring_index(`passenger`.`last_name`,' ',1))) AS `unique_id` FROM `passenger` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bus`
--
ALTER TABLE `bus`
  ADD KEY `driver_id` (`driver_id`);

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD UNIQUE KEY `license_number` (`license_number`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
 
  ADD KEY `ticket_id` (`ticket_id`);

--
-- Indexes for table `route`
--
ALTER TABLE `route`
 
  ADD KEY `bus_id` (`bus_id`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`

  ADD KEY `route_id` (`route_id`),
  ADD KEY `bus_id` (`bus_id`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  
  ADD KEY `schedule_id` (`schedule_id`),
  ADD KEY `passenger_id` (`passenger_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bus`
--
ALTER TABLE `bus`
  ADD CONSTRAINT `bus_ibfk_1` FOREIGN KEY (`driver_id`) REFERENCES `driver` (`driver_id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`ticket_id`);

--
-- Constraints for table `route`
--
ALTER TABLE `route`
  ADD CONSTRAINT `route_ibfk_1` FOREIGN KEY (`bus_id`) REFERENCES `bus` (`bus_id`);

--
-- Constraints for table `schedule`
--
ALTER TABLE `schedule`
  ADD CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`bus_id`) REFERENCES `bus` (`bus_id`),
  ADD CONSTRAINT `schedule_ibfk_2` FOREIGN KEY (`route_id`) REFERENCES `route` (`route_id`),
  ADD CONSTRAINT `schedule_ibfk_3` FOREIGN KEY (`bus_id`) REFERENCES `bus` (`bus_id`);

--
-- Constraints for table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`schedule_id`) REFERENCES `schedule` (`schedule_id`),
  ADD CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`passenger_id`) REFERENCES `passenger` (`passenger_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
