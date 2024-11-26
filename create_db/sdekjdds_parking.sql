-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Creato il: Nov 25, 2024 alle 20:18
-- Versione del server: 5.7.24
-- Versione PHP: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sdekjdds_parking`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `auto`
--

CREATE TABLE `auto` (
  `auto_id` int(11) NOT NULL,
  `brand` varchar(150) DEFAULT NULL,
  `model` varchar(150) DEFAULT NULL,
  `color` varchar(150) DEFAULT NULL,
  `doors` int(11) DEFAULT NULL,
  `vin` varchar(17) DEFAULT NULL,
  `license_plate` varchar(7) DEFAULT NULL,
  `supplier` varchar(150) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `auto`
--

INSERT INTO `auto` (`auto_id`, `brand`, `model`, `color`, `doors`, `vin`, `license_plate`, `supplier`, `type_id`, `status_id`, `user_id`, `area_id`) VALUES
(1, 'Toyota', 'Corolla', 'Red', 4, '1HGCM82633A123456', 'MN400NN', 'Supplier1', 1, 2, 2, 1),
(2, 'Honda', 'Civic', 'Blue', 4, '1HGCM82633A654321', 'DEF5678', 'Supplier2', 1, 1, 3, 2),
(3, 'Chevrolet', 'Malibu', 'Black', 5, '1HGCM82633A111213', 'EE000EE', 'Supplier3', 4, 1, 5, 3),
(4, 'Nissan', 'Altima', 'White', 3, '1HGCM82633A222324', 'OPQ3456', 'Supplier4', 5, 1, 6, 27),
(5, 'Ford', 'Fiesta', 'Green', 2, '1HGCM82633A789012', 'XYZ8901', 'Supplier5', 2, 2, 50, 5),
(13, 'Volkswagen', 'UP!', 'White', 5, '00000000000000000', 'AA000AA', 'Supplier', 8, 3, 1, 6),
(14, 'Kia', 'Picanto', 'White', 5, '1234567890', 'BB000BB', 'Supplier', 8, 4, 2, 7),
(15, 'Toyota', 'Corolla', 'Blue', 4, '1HGCM82633A123457', 'ABC5678', 'Supplier1', 1, 2, 1, 8),
(16, 'Dacia', 'Duster', 'Gray', 5, '11122233344455566', 'AZ567ZA', 'Supplier', 3, 1, 2, 9),
(18, 'Ford', 'Mustang', 'Black', 2, '1HGCM82633A111257', 'AA222AA', 'Local Supplier', 5, 3, 9, 11),
(19, 'BMW', 'X5', 'Gray', 5, '5UXFB53555LV12345', 'EF789GH', 'Local Supplier', 3, 1, 1, 12),
(20, 'Mercedes', 'C-Class', 'Green', 4, 'WDDGF81XXEA123456', 'GH012IJ', 'Local Supplier', 1, 3, 7, 41),
(22, 'Audi', 'A3', 'Black', 5, 'WAUEH94F57N001234', 'IJ345KL', 'Local Supplier', 8, 4, 7, 42),
(23, 'Honda', 'Civic', 'Blue', 4, '2HGFA16598H123456', 'KL678MN', 'Local Supplier', 1, 2, 4, 69),
(24, 'Jeep', 'Wrangler', 'Desert', 5, '1J4FJ68S9TL123456', 'MN901OP', 'Local Supplier', 3, 1, 4, 70),
(25, 'Volkswagen', 'Golf', 'White', 4, 'WVWZZZ1JZ3W123456', 'OP234QR', 'Local Supplier', 8, 2, 4, 73),
(26, 'Tesla', 'Model 3', 'Gray', 4, '5YJ3E1EA8JF012345', 'QR567ST', 'Local Supplier', 1, 3, 12, 74),
(27, 'Chevrolet', 'Malibu', 'Blue', 4, '1G1ZD5ST6LF123456', 'ST890UV', 'Local Supplier', 1, 4, 15, 101),
(28, 'Volkswagen', 'Polo', 'White', 5, 'WAUEH90F57N001234', 'BB400BB', 'Local Supplier', 8, 2, 1, 102),
(29, 'Lamborghini ', 'Gallardo', 'Black', 3, 'WALEH94F57N001234', 'AZ310ZA', 'Local Supplier', 8, 1, 1, 22),
(30, 'Volkswagen', 'Golf 8', 'Blue', 4, 'WAUEH94C47N001234', 'BR45H0T', 'Local Supplier', 1, 1, 1, 13),
(31, 'Fiat', '600', 'Blue', 4, 'WHUEH94F57N001234', 'AA555AB', 'Local Supplier', 8, 2, 1, 10),
(33, 'Porsche', 'Cayenne', 'Gray', 5, '1HCCM82633A123457', 'MN003SF', 'Local Supplier', 7, 3, 1, 21),
(34, 'Opel', 'Corsa', 'White', 5, 'WAUEH94F57N081234', 'AZ580ZA', 'Local Supplier', 8, 3, 1, 14),
(35, 'Opel', 'Corsa', 'Black', 5, 'WAUEL94F57N001234', 'AA050AA', 'Local Supplier', 8, 1, 1, 15),
(36, 'Volkswagen', 'UP!', 'Blue', 5, 'WAUEH12F57N001234', 'AABCDAA', 'Local Supplier', 8, 1, 1, 16),
(37, 'Volkswagen', 'UP!', 'Blue', 5, 'WAOEH12F57N001234', 'AAEFGAA', 'Local Supplier', 8, 1, 1, 17),
(40, 'Volkswagen', 'UP!', 'Green', 5, 'WAYYY94F57N001234', 'AAMNAAA', 'Local Supplier', 8, 2, 1, 25),
(41, 'Volkswagen', 'UP!', 'Black', 5, 'WAUEH94F57YYY1234', 'ABC1290', 'Local Supplier', 8, 1, 1, 18),
(42, 'Volkswagen', 'UP!', 'Gray', 5, 'WAUEH94F57N00YYYY', 'ABC9999', 'Local Supplier', 8, 1, 1, 19),
(43, 'Volkswagen', 'UP!', 'Gray', 5, 'WAUEH9YY57N001234', 'ABC8888', 'Local Supplier', 8, 1, 1, 20),
(45, 'Volkswagen', 'UP!', 'Gray', 5, 'WAUEH9XX57N001234', 'ABC7777', 'Local Supplier', 8, 1, 1, 20),
(48, 'Volkswagen', 'UP!', 'Black', 5, 'WAUEH94F57N00XXXX', '6677766', 'Local Supplier', 8, 1, 1, 23),
(50, 'Toyota', 'Corolla', 'White', 5, 'WAUEH94F57XXXXXXX', 'AA000XX', 'Local Supplier', 8, 1, 1, 24),
(51, 'Volkswagen', 'Polo', 'Green', 5, 'WAUEH94F57N00B234', 'BR45H07', 'Local Supplier', 8, 1, 1, 26),
(52, 'Fiat', '600', 'Black', 3, '1HGCM82633A123459', 'ER404NF', 'Local Supplier', 8, 2, 1, 28),
(56, 'Volkswagen', 'polo', 'Black', 3, 'BBBBBBBBBBBBBBBBB', 'BBBBBBB', 'Local Supplier', 8, 1, 1, 29),
(57, 'Fiat', '600', 'White', 3, 'AAAAAAAAAAAAAAAAA', 'AAAAAAA', 'Local Supplier', 8, 2, 1, 30),
(59, 'Fiat', '600', 'White', 3, 'CCCCCCCCCCCCCCCCC', 'CCCCCCC', 'Local Supplier', 8, 2, 1, 30),
(61, 'Toyota', 'Corolla', 'Gray', 3, 'DDDDDDDDDDDDDDDDD', 'DDDDDDD', 'Local Supplier', 8, 1, 1, 31),
(62, 'Toyota', 'Corolla', 'Gray', 4, 'FFFFFFFFFFFFFFFFF', 'FFFFFFF', 'Local Supplier', 1, 1, 1, 32),
(63, 'Fiat', '600', 'Black', 3, 'GGGGGGGGGGGGGGGGG', 'GGGGGGG', 'Local Supplier', 8, 1, 1, 33),
(64, 'Volkswagen', 'UP!', 'Gray', 5, 'HHHHHHHHHHHHHHHHH', 'HHHHHHH', 'Local Supplier', 8, 1, 1, 34);

-- --------------------------------------------------------

--
-- Struttura della tabella `edit_date`
--

CREATE TABLE `edit_date` (
  `edit_id` int(11) NOT NULL,
  `edit_date` datetime DEFAULT NULL,
  `auto_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `edit_date`
--

INSERT INTO `edit_date` (`edit_id`, `edit_date`, `auto_id`, `user_id`) VALUES
(1, '2024-08-13 16:51:00', 1, 2),
(2, '2024-08-13 16:56:13', 2, 3),
(3, '2024-08-10 00:30:52', 3, 5),
(4, '2024-11-22 16:25:17', 4, 6),
(5, '2024-08-06 19:48:04', 5, 50),
(6, '2024-08-05 18:24:56', 13, 1),
(7, '2024-08-08 20:52:42', 14, 2),
(8, '2024-08-09 11:00:00', 15, 1),
(9, '2024-08-06 18:38:52', 16, 2),
(11, '2024-08-10 00:42:24', 18, 9),
(12, '2024-08-10 13:00:36', 19, 1),
(13, '2024-08-10 11:40:57', 20, 7),
(14, '2024-08-10 11:41:03', 22, 7),
(15, '2024-08-10 11:40:19', 23, 4),
(16, '2024-08-10 11:40:07', 24, 4),
(17, '2024-08-10 11:39:33', 25, 4),
(18, '2024-08-10 11:39:41', 26, 12),
(19, '2024-08-10 11:39:02', 27, 15),
(20, '2024-08-10 11:39:11', 28, 1),
(21, '2024-08-13 18:52:24', 29, 1),
(22, '2024-08-12 21:57:44', 30, 1),
(23, '2024-08-17 22:57:24', 31, 1),
(25, '2024-08-20 14:28:15', 33, 1),
(26, '2024-10-02 18:02:40', 34, 1),
(27, '2024-10-02 18:19:21', 35, 1),
(28, '2024-10-02 18:24:45', 36, 1),
(29, '2024-10-02 18:31:18', 37, 1),
(30, '2024-10-02 18:52:03', 40, 1),
(31, '2024-10-02 20:51:57', 41, 1),
(32, '2024-10-02 20:55:07', 42, 1),
(33, '2024-10-02 21:06:46', 43, 1),
(34, '2024-10-02 21:11:13', 45, 1),
(35, '2024-10-02 21:13:37', 48, 1),
(36, '2024-10-02 21:17:34', 50, 1),
(37, '2024-10-02 21:19:26', 51, 1),
(38, '2024-10-03 10:03:58', 52, 1),
(39, '2024-10-03 10:18:44', NULL, 1),
(40, '2024-11-22 10:31:12', NULL, 1),
(41, '2024-10-04 09:23:29', 56, 1),
(42, '2024-10-04 10:00:31', 57, 1),
(43, '2024-10-04 10:01:30', 59, 1),
(44, '2024-10-04 10:53:22', 61, 1),
(45, '2024-10-04 11:02:41', 62, 1),
(46, '2024-10-04 11:55:22', 63, 1),
(47, '2024-10-04 12:15:13', 64, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `entry_date`
--

CREATE TABLE `entry_date` (
  `entry_id` int(11) NOT NULL,
  `entry_date` datetime DEFAULT NULL,
  `auto_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `entry_date`
--

INSERT INTO `entry_date` (`entry_id`, `entry_date`, `auto_id`, `user_id`) VALUES
(1, '2024-01-01 08:00:00', 1, 2),
(2, '2024-01-02 08:00:00', 2, 3),
(3, '2024-01-02 08:00:00', 3, 5),
(4, '2024-01-02 08:00:00', 4, 6),
(5, '2024-07-30 08:00:00', 5, 50),
(6, '2024-08-05 18:24:56', 13, 1),
(7, '2024-08-05 18:33:00', 14, 2),
(8, '2024-08-05 19:07:30', 15, 1),
(9, '2024-08-06 18:38:52', 16, 2),
(11, '2024-08-06 19:27:06', 18, 9),
(12, '2024-08-08 23:02:16', 19, 1),
(13, '2024-08-08 23:07:22', 20, 7),
(14, '2024-08-08 23:08:44', 22, 7),
(15, '2024-08-08 23:10:52', 23, 4),
(16, '2024-08-08 23:11:28', 24, 4),
(17, '2024-08-08 23:12:10', 25, 4),
(18, '2024-08-08 23:14:06', 26, 12),
(19, '2024-08-08 23:17:58', 27, 15),
(20, '2024-08-09 20:42:44', 28, 1),
(21, '2024-08-11 21:21:07', 29, 1),
(22, '2024-08-12 15:26:28', 30, 1),
(23, '2024-08-12 21:49:16', 31, 1),
(25, '2024-08-13 14:59:37', 33, 1),
(26, '2024-10-02 18:02:40', 34, 1),
(27, '2024-10-02 18:19:21', 35, 1),
(28, '2024-10-02 18:24:45', 36, 1),
(29, '2024-10-02 18:31:18', 37, 1),
(30, '2024-10-02 18:50:34', 40, 1),
(31, '2024-10-02 20:51:57', 41, 1),
(32, '2024-10-02 20:55:07', 42, 1),
(33, '2024-10-02 21:06:46', 43, 1),
(34, '2024-10-02 21:11:13', 45, 1),
(35, '2024-10-02 21:13:37', 48, 1),
(36, '2024-10-02 21:17:34', 50, 1),
(37, '2024-10-02 21:19:26', 51, 1),
(38, '2024-10-03 09:59:08', 52, 1),
(39, '2024-10-03 10:18:44', NULL, 1),
(40, '2024-10-03 10:20:01', NULL, 1),
(41, '2024-10-04 09:23:29', 56, 1),
(42, '2024-10-04 10:00:31', 57, 1),
(43, '2024-10-04 10:01:30', 59, 1),
(44, '2024-10-04 10:53:22', 61, 1),
(45, '2024-10-04 11:02:41', 62, 1),
(46, '2024-10-04 11:55:22', 63, 1),
(47, '2024-10-04 12:15:13', 64, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `exit_date`
--

CREATE TABLE `exit_date` (
  `exit_id` int(11) NOT NULL,
  `exit_date` datetime DEFAULT NULL,
  `auto_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `exit_date`
--

INSERT INTO `exit_date` (`exit_id`, `exit_date`, `auto_id`, `user_id`) VALUES
(3, '2024-08-06 12:49:52', 2, 3),
(4, '2024-08-06 12:51:33', 15, 1),
(5, '2024-08-06 15:56:40', 3, 5),
(7, '2024-08-06 19:48:04', 5, 50),
(10, '2024-08-09 01:03:31', 25, 4),
(11, '2024-08-09 10:23:39', 23, 4);

-- --------------------------------------------------------

--
-- Struttura della tabella `logs`
--

CREATE TABLE `logs` (
  `log_id` int(11) NOT NULL,
  `log` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `logs`
--

INSERT INTO `logs` (`log_id`, `log`, `user_id`) VALUES
(1, '2024-08-06 17-41-00 - Has changed a Parking Area from A1 to C1', 1),
(2, '2024-08-06 17-50-06 - Has changed a Parking Area from C1 to A1', 1),
(3, '2024-08-06 17-58-48 - Has changed a Parking Area from B1 to C1', 3),
(4, '2024-08-06 18-28-54: Has changed a Parking Area from C1 to B1', 1),
(5, '2024-08-06 18-38-52: Has registered a new auto.', 2),
(6, '2024-08-06 18-52-36: Has registered a new auto.', 1),
(7, '2024-08-06 19-27-06: Has registered a new auto with ID n.18', 9),
(8, '2024-08-06 19-44-56: Has set an exit date for an auto with ID n.17', 1),
(9, '2024-08-06 19-48-04: Has set an exit date for an auto with ID n.5', 3),
(10, '2024-08-08 20-52-42: Has set an exit date for an auto with ID n.14', 3),
(11, '2024-08-08 23-02-16: Has registered a new auto with ID n.19', 1),
(12, '2024-08-08 23-07-22: Has registered a new auto with ID n.20', 7),
(13, '2024-08-08 23-08-44: Has registered a new auto with ID n.22', 7),
(14, '2024-08-08 23-10-52: Has registered a new auto with ID n.23', 4),
(15, '2024-08-08 23-11-28: Has registered a new auto with ID n.24', 4),
(16, '2024-08-08 23-12-10: Has registered a new auto with ID n.25', 4),
(17, '2024-08-08 23-14-06: Has registered a new auto with ID n.26', 12),
(18, '2024-08-08 23-17-58: Has registered a new auto with ID n.27', 15),
(19, '2024-08-08 23-18-52: Has changed a Parking Area from E3 to E4.', 15),
(20, '2024-08-08 23-23-02: Has changed a Parking Area from E4 to E3.', 9),
(21, '2024-08-09 01-03-31: Has set an exit date for an auto with ID n.25', 1),
(22, '2024-08-09 10-23-39: Has set an exit date for an auto with ID n.23', 1),
(23, '2024-08-09 10-59-11: Has changed a Parking Area from A1 to E4.', 1),
(24, '2024-08-09 10-59-15: Has changed a Parking Area from E4 to A1.', 1),
(25, '2024-08-09 10-59-35: Has changed a Parking Area from C4 to I2.', 1),
(26, '2024-08-09 10-59-54: Has changed a Parking Area from B4 to J2.', 1),
(27, '2024-08-09 11-00-00: Has changed a Parking Area from I2 to B4.', 1),
(28, '2024-08-09 11-00-11: Has changed a Parking Area from J2 to C4.', 1),
(29, '2024-08-09 20-42-44: Has registered a new auto with ID n.28', 1),
(30, '2024-08-09 23-31-56: Has changed a Parking Area from E4 to F1.', 1),
(31, '2024-08-10 00-21-29: Has changed a Parking Area from A2 to AE2.', 1),
(32, '2024-08-10 00-22-12: Has changed a Parking Area from AE2 to A2.', 1),
(33, '2024-08-10 00-23-03: Has changed a Parking Area from A2 to F2.', 1),
(34, '2024-08-10 00-23-49: Has changed a Parking Area from A3 to N1.', 1),
(35, '2024-08-10 00-27-59: Has changed a Parking Area from A4 to AE3.', 1),
(36, '2024-08-10 00-29-15: Has changed a Parking Area from AE3 to Z4.', 1),
(37, '2024-08-10 00-30-47: Has changed a Parking Area from F2 to A2.', 1),
(38, '2024-08-10 00-30-52: Has changed a Parking Area from N1 to A3.', 1),
(39, '2024-08-10 00-31-00: Has changed a Parking Area from Z4 to A4.', 1),
(40, '2024-08-10 00-31-13: Has changed a Parking Area from F1 to E4.', 1),
(41, '2024-08-10 00-39-24: Has changed a Parking Area from A2 to AE1.', 1),
(42, '2024-08-10 00-39-32: Has changed a Parking Area from AE1 to A2.', 1),
(43, '2024-08-10 00-41-40: Has changed a Parking Area from C2 to F1.', 1),
(44, '2024-08-10 00-41-51: Has changed a Parking Area from C3 to F2.', 1),
(45, '2024-08-10 00-42-15: Has changed a Parking Area from F1 to C2.', 1),
(46, '2024-08-10 00-42-24: Has changed a Parking Area from F2 to C3.', 1),
(47, '2024-08-10 00-42-46: Has changed a Parking Area from E3 to F1.', 1),
(48, '2024-08-10 00-42-54: Has changed a Parking Area from E4 to F2.', 1),
(49, '2024-08-10 00-45-20: Has changed a Parking Area from F2 to AE1.', 1),
(50, '2024-08-10 00-45-46: Has changed a Parking Area from AE1 to F2.', 1),
(51, '2024-08-10 00-46-56: Has changed a Parking Area from F2 to Z4.', 1),
(52, '2024-08-10 00-48-44: Has changed a Parking Area from Z4 to Z1.', 1),
(53, '2024-08-10 00-56-33: Has changed a Parking Area from Z1 to E3.', 1),
(54, '2024-08-10 01-39-28: Has changed a Parking Area from E3 to Z1.', 1),
(55, '2024-08-10 01-41-21: Has changed a Parking Area from Z1 to F2.', 1),
(56, '2024-08-10 11-39-01: Has changed a Parking Area from F1 to Z1.', 1),
(57, '2024-08-10 11-39-11: Has changed a Parking Area from F2 to Z2.', 1),
(58, '2024-08-10 11-39-33: Has changed a Parking Area from E1 to S1.', 1),
(59, '2024-08-10 11-39-41: Has changed a Parking Area from E2 to S2.', 1),
(60, '2024-08-10 11-40-07: Has changed a Parking Area from D4 to R2.', 1),
(61, '2024-08-10 11-40-19: Has changed a Parking Area from D3 to R1.', 1),
(62, '2024-08-10 11-40-57: Has changed a Parking Area from D1 to K1.', 1),
(63, '2024-08-10 11-41-03: Has changed a Parking Area from D2 to K2.', 1),
(64, '2024-08-10 13-00-24: Has changed a Parking Area from C4 to D1.', 1),
(65, '2024-08-10 13-00-36: Has changed a Parking Area from D1 to C4.', 1),
(66, '2024-08-11 21-21-07: Has registered a new auto with ID n.29', 1),
(67, '2024-08-12 15-13-12: Has changed a Parking Area from D1 to E1.', 4),
(68, '2024-08-12 15-21-46: Has changed a Parking Area from E1 to D1 of Auto N.29.', 1),
(69, '2024-08-12 15-26-28: Has registered a new auto with License Plate BR45H0T', 1),
(70, '2024-08-12 15-54-01: Has changed a Auto Parking Area from D2 to E1 with Plate: BR45H0T.', 1),
(71, '2024-08-12 15-57-47: Has changed a Auto Parking Area from E1 to F1 with Plate: BR45H0T.', 4),
(72, '2024-08-12 | 16-53-39: Has changed a Auto Parking Area from D1 to E1 with Plate: AZ310ZA.', 4),
(73, '2024-08-12 | 19-13-13: Has changed a Auto Parking Area from E1 to K3 with Plate: AZ310ZA.', 9),
(74, '2024-08-12 | 19-13-30: Has changed a Auto Parking Area from F1 to K4 with Plate: BR45H0T.', 9),
(75, '2024-08-12 | 21-49-16: Has registered a new auto with License Plate AA555AA', 1),
(76, '2024-08-12 | 21-50-12: Has changed a Auto Parking Area from D1 to E1 with Plate: AA555AB.', 1),
(77, '2024-08-12 | 21-51-07: Has set an exit date for an auto with ID n.31', 1),
(78, '2024-08-12 | 21-57-44: Has changed a Auto Parking Area from K4 to D1 with Plate: BR45H0T.', 3),
(79, '2024-08-12 | 22-00-55: Has registered a new auto with License Plate MN954OP', 3),
(80, '2024-08-13 | 14-59-37: Has registered a new auto with License Plate MN003SF', 1),
(81, '2024-08-13 | 15-54-15: Has changed a Auto Parking Area from E1 to F2 with Plate: AA555AB.', 1),
(82, '2024-08-13 16-50-55: Has set an exit date for an auto with ID n.1', 1),
(83, '2024-08-13 16-50-59: Has set an exit date for an auto with ID n.1', 1),
(84, '2024-08-13 16-51-00: Has set an exit date for an auto with ID n.1', 1),
(85, '2024-08-13 16-51-00: Has set an exit date for an auto with ID n.1', 1),
(86, '2024-08-13 16-53-58: Has set an exit date for an auto with ID n.2', 1),
(87, '2024-08-13 16-56-13: Has set an exit date for an auto with ID n.2', 1),
(88, '2024-08-13 | 18-51-54: Has changed a Auto Parking Area from F2 to F3 with Plate: AA555AB.', 1),
(89, '2024-08-13 | 18-52-24: Has changed a Auto Parking Area from K3 to F2 with Plate: AZ310ZA.', 1),
(90, '2024-08-13 | 18-52-49: Has changed a Auto Parking Area from F3 to Z3 with Plate: AA555AB.', 1),
(91, '2024-08-17 | 22-47-11: Has set an exit date for an auto with Plate: MN954OP', 1),
(92, '2024-08-17 | 22-53-06: Has set an exit date for an auto with Plate: AA555AB', 1),
(93, '2024-08-17 | 22-54-57: Has set an exit date for an auto with Plate: AA555AB', 1),
(94, '2024-08-17 | 22-55-05: Has set an exit date for an auto with Plate: AA555AB', 1),
(95, '2024-08-17 | 22-57-24: Has changed an auto Parking Area from Z3 to C2 with Plate: AA555AB.', 1),
(96, '2024-08-20 | 14-28-15: Has set an exit date for an auto with Plate: MN003SF', 1),
(97, '2024-10-02 | 18-02-40: Has registered a new auto with License Plate AZ580ZA', 1),
(98, '2024-10-02 | 18-19-21: Has registered a new auto with License Plate AA050AA', 1),
(99, '2024-10-02 | 18-24-45: Has registered a new auto with License Plate AABCDAA', 1),
(100, '2024-10-02 | 18-31-18: Has registered a new auto with License Plate AAEFGAA', 1),
(101, '2024-10-02 | 18-50-34: Has registered a new auto with License Plate AAMNAAA', 1),
(102, '2024-10-02 | 18-52-03: Has changed an auto Parking Area from E2 to G1 with Plate: AAMNAAA.', 1),
(103, '2024-10-02 | 20-51-57: Has registered a new auto with License Plate ABC1290', 1),
(104, '2024-10-02 | 20-55-07: Has registered a new auto with License Plate ABC9999', 1),
(105, '2024-10-02 | 21-06-46: Has registered a new auto with License Plate ABC8888', 1),
(106, '2024-10-02 | 21-11-13: Has registered a new auto with License Plate ABC7777', 1),
(107, '2024-10-02 | 21-13-37: Has registered a new auto with License Plate 6677766', 1),
(108, '2024-10-02 | 21-17-34: Has registered a new auto with License Plate AA000XX', 1),
(109, '2024-10-02 | 21-19-26: Has registered a new auto with License Plate BR45H07', 1),
(110, '2024-10-03 | 09-59-08: Has registered a new auto with License Plate ER404NF', 1),
(111, '2024-10-03 | 10-03-58: Has changed an auto Parking Area from G3 to G4 with Plate: ER404NF.', 1),
(112, '2024-10-03 | 10-18-44: Has registered a new auto with License Plate AA000RR', 1),
(113, '2024-10-03 | 10-20-01: Has registered a new auto with License Plate AA00011', 1),
(114, '2024-10-04 | 09-23-29: Has registered a new auto with License Plate BBBBBBB', 1),
(115, '2024-10-04 | 10-00-31: Has registered a new auto with License Plate AAAAAAA', 1),
(116, '2024-10-04 | 10-01-30: Has registered a new auto with License Plate CCCCCCC', 1),
(117, '2024-10-04 | 10-53-22: Has registered a new auto with License Plate DDDDDDD', 1),
(118, '2024-10-04 | 11-02-41: Has registered a new auto with License Plate FFFFFFF', 1),
(119, '2024-10-04 | 11-55-22: Has registered a new auto with License Plate GGGGGGG', 1),
(120, '2024-10-04 | 12-15-13: Has registered a new auto with License Plate HHHHHHH', 1),
(121, '2024-11-22 | 10-31-12: Has changed an auto Parking Area from G3 to I3 with Plate: AA00011.', 1),
(122, '2024-11-22 | 16-25-05: Has changed an auto Parking Area from A4 to G3 with Plate: OPQ3456.', 1),
(123, '2024-11-22 | 16-25-12: Has changed an auto Parking Area from G3 to I3 with Plate: OPQ3456.', 1),
(124, '2024-11-22 | 16-25-17: Has changed an auto Parking Area from I3 to G3 with Plate: OPQ3456.', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `notes`
--

CREATE TABLE `notes` (
  `note_id` int(11) NOT NULL,
  `object` varchar(255) DEFAULT NULL,
  `text` text,
  `user_id` int(11) DEFAULT NULL,
  `broadcast` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `notes`
--

INSERT INTO `notes` (`note_id`, `object`, `text`, `user_id`, `broadcast`) VALUES
(1, 'From: parking@aglagest.com - Test', 'Sent: 2024-08-08 13-16 <br>\ncontent_format content_format content_format content_format content_format content_format', 3, 0),
(2, 'From: parking@aglagest.com - TEST OBJECT', 'Sent: 2024-08-08 13-32\nExample Example Example Example Example Example Example Example Example Example Example Example Example Example Example ', 3, 0),
(10, 'From: parking@aglagest.com - Broadcast test', 'Sent: 2024-08-08 19-39\na bc test', NULL, 1),
(11, 'From: jordanbaker@example.net - Another Broadcast object', 'Sent: 2024-08-08 20-29\nBroadcast test', NULL, 1),
(12, 'From: jordanbaker@example.net - For Admin', 'Sent: 2024-08-08 20-42\nBC!', NULL, 1),
(14, 'From: parking@aglagest.com - Multiline test', 'Sent: 2024-08-08 21-27\nMultiline \\n Multiline Multiline Multiline Multiline Multiline <br> Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline ', 1, 0),
(18, 'From: parking@aglagest.com - TEST OBJECT', 'Sent: 2024-08-09 21-13\naaaaaaaaaaaaaaaaaa', 6, 0),
(19, 'From: parking@aglagest.com - HOUR TEST', 'Sent 2024-08-12 | 16-48:\nDatetime format test', 4, 0),
(20, 'From: coxjorge@example.com - Format date ok', 'Sent 2024-08-12 | 16-48:\nOk for datetime', 1, 0),
(25, 'From: parking@aglagest.com - Broadcast', 'Sent 2024-08-12 | 21-59:\nbc', NULL, 1),
(26, 'From: parking@aglagest.com - TEST OBJECT', 'Sent 2024-09-05 | 16-14:\nthis is a test for\r\ngoing down', NULL, 1),
(27, 'From: parking@aglagest.com - Test', 'Sent 2024-09-05 | 16-15:\nthis is a test for \\n going down', NULL, 1),
(28, 'From: parking@aglagest.com - object', 'Sent 2024-09-05 | 16-20:\nthis is a test for\r\ngoing down', NULL, 1),
(29, 'From: parking@aglagest.com - For Admin', 'Sent 2024-09-05 | 16-20:\nthis is a test for \\n going down', NULL, 1),
(30, 'From: parking@aglagest.com - TEST OBJECT', 'Sent 2024-09-05 | 16-24:\ngo text\r\ndown\r\nbelow', NULL, 1),
(31, 'From: parking@aglagest.com - TEST OBJECT', 'Sent 2024-09-05 | 16-37:\ntesto di prova\nper andare\na capo', NULL, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `parking_area`
--

CREATE TABLE `parking_area` (
  `area_id` int(11) NOT NULL,
  `letter` varchar(5) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `auto_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `parking_area`
--

INSERT INTO `parking_area` (`area_id`, `letter`, `number`, `auto_id`) VALUES
(1, 'A', 1, 1),
(2, 'A', 2, 2),
(3, 'A', 3, 3),
(4, 'A', 4, NULL),
(5, 'B', 1, 5),
(6, 'B', 2, 13),
(7, 'B', 3, 14),
(8, 'B', 4, 15),
(9, 'C', 1, 16),
(10, 'C', 2, 31),
(11, 'C', 3, 18),
(12, 'C', 4, 19),
(13, 'D', 1, 30),
(14, 'D', 2, 34),
(15, 'D', 3, 35),
(16, 'D', 4, 36),
(17, 'E', 1, 37),
(18, 'E', 2, 41),
(19, 'E', 3, 42),
(20, 'E', 4, 45),
(21, 'F', 1, 33),
(22, 'F', 2, 29),
(23, 'F', 3, 48),
(24, 'F', 4, 50),
(25, 'G', 1, 40),
(26, 'G', 2, 51),
(27, 'G', 3, 4),
(28, 'G', 4, 52),
(29, 'H', 1, 56),
(30, 'H', 2, 59),
(31, 'H', 3, 61),
(32, 'H', 4, 62),
(33, 'I', 1, 63),
(34, 'I', 2, 64),
(35, 'I', 3, NULL),
(36, 'I', 4, NULL),
(37, 'J', 1, NULL),
(38, 'J', 2, NULL),
(39, 'J', 3, NULL),
(40, 'J', 4, NULL),
(41, 'K', 1, 20),
(42, 'K', 2, 22),
(43, 'K', 3, NULL),
(44, 'K', 4, NULL),
(45, 'L', 1, NULL),
(46, 'L', 2, NULL),
(47, 'L', 3, NULL),
(48, 'L', 4, NULL),
(49, 'M', 1, NULL),
(50, 'M', 2, NULL),
(51, 'M', 3, NULL),
(52, 'M', 4, NULL),
(53, 'N', 1, NULL),
(54, 'N', 2, NULL),
(55, 'N', 3, NULL),
(56, 'N', 4, NULL),
(57, 'O', 1, NULL),
(58, 'O', 2, NULL),
(59, 'O', 3, NULL),
(60, 'O', 4, NULL),
(61, 'P', 1, NULL),
(62, 'P', 2, NULL),
(63, 'P', 3, NULL),
(64, 'P', 4, NULL),
(65, 'Q', 1, NULL),
(66, 'Q', 2, NULL),
(67, 'Q', 3, NULL),
(68, 'Q', 4, NULL),
(69, 'R', 1, 23),
(70, 'R', 2, 24),
(71, 'R', 3, NULL),
(72, 'R', 4, NULL),
(73, 'S', 1, 25),
(74, 'S', 2, 26),
(75, 'S', 3, NULL),
(76, 'S', 4, NULL),
(77, 'T', 1, NULL),
(78, 'T', 2, NULL),
(79, 'T', 3, NULL),
(80, 'T', 4, NULL),
(81, 'U', 1, NULL),
(82, 'U', 2, NULL),
(83, 'U', 3, NULL),
(84, 'U', 4, NULL),
(85, 'V', 1, NULL),
(86, 'V', 2, NULL),
(87, 'V', 3, NULL),
(88, 'V', 4, NULL),
(89, 'W', 1, NULL),
(90, 'W', 2, NULL),
(91, 'W', 3, NULL),
(92, 'W', 4, NULL),
(93, 'X', 1, NULL),
(94, 'X', 2, NULL),
(95, 'X', 3, NULL),
(96, 'X', 4, NULL),
(97, 'Y', 1, NULL),
(98, 'Y', 2, NULL),
(99, 'Y', 3, NULL),
(100, 'Y', 4, NULL),
(101, 'Z', 1, 27),
(102, 'Z', 2, 28),
(103, 'Z', 3, NULL),
(104, 'Z', 4, NULL),
(105, 'AA', 1, NULL),
(106, 'AA', 2, NULL),
(107, 'AA', 3, NULL),
(108, 'AA', 4, NULL),
(113, 'AB', 1, NULL),
(114, 'AB', 2, NULL),
(115, 'AB', 3, NULL),
(116, 'AB', 4, NULL),
(148, 'AC', 1, NULL),
(149, 'AC', 2, NULL),
(150, 'AC', 3, NULL),
(151, 'AC', 4, NULL),
(152, 'AD', 1, NULL),
(153, 'AD', 2, NULL),
(154, 'AD', 3, NULL),
(184, 'AE', 1, NULL),
(185, 'AE', 2, NULL),
(186, 'AE', 3, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `status`
--

CREATE TABLE `status` (
  `status_id` int(11) NOT NULL,
  `status` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `status`
--

INSERT INTO `status` (`status_id`, `status`) VALUES
(1, 'New'),
(2, 'Used'),
(3, 'Corporate'),
(4, 'Km Zero');

-- --------------------------------------------------------

--
-- Struttura della tabella `types`
--

CREATE TABLE `types` (
  `type_id` int(11) NOT NULL,
  `type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `types`
--

INSERT INTO `types` (`type_id`, `type`) VALUES
(1, 'Berlina'),
(2, 'Crossover'),
(3, 'SUV'),
(4, 'Station Wagon'),
(5, 'Coupé'),
(6, 'Minivan/Monovolume'),
(7, 'Roadster'),
(8, 'Commercial Vehicle');

-- --------------------------------------------------------

--
-- Struttura della tabella `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `surname` varchar(150) DEFAULT NULL,
  `password` text,
  `email` varchar(200) DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `catalog` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `users`
--

INSERT INTO `users` (`user_id`, `name`, `surname`, `password`, `email`, `is_admin`, `catalog`) VALUES
(1, 'Admin', 'Admin', '$2b$12$DuXsbk0c.t3HE/XLbU9U7uYvYphPgL2rLSFaC87iPsYbW8D/mqHrG', 'parking@aglagest.com', 1, 1),
(2, 'Shannon', 'Paul', '$2b$12$16oyfKz1gaGg7wt5uHulJ.p1REL3bZp0x91qlNTFjKbpjSmU25USG', 'scottphilip@example.com', 0, 1),
(3, 'Teresa', 'Griffith', '$2b$12$pwYN2bynCIw6/NUGewzQzetgNTP3TXPYi8.X8nNeLsPgOdmv2dgIK', 'jordanbaker@example.net', 0, 1),
(4, 'Annette', 'Rush', '$2b$12$wWPkXh8jVWFA62Snp7xeQ.q63WA4MYTY0RQIjXGZBg0zKsrgXCv/q', 'coxjorge@example.com', 0, 1),
(5, 'Julia', 'Sanchez', '$2b$12$V1wv9LRLPGUY9Soh27UdveFmH.rhmt5NV.BdVN54tmI9CXxXG4gaq', 'phillipsgeoffrey@example.org', 0, 1),
(6, 'Tina', 'Blackburn', '$2b$12$X4s4t/wz1laxGOYmMh4vKu5aNi2k99h79fsrx7flE1iC2lv5cT6N.', 'michael25@example.com', 0, 1),
(7, 'Michael', 'Morris', '$2b$12$H.AS6cXaWfSUWuBBF/zbFOXK.Tga0.eAWvpTLfqSD7F2YpkoDOnVO', 'robert63@example.com', 0, 1),
(8, 'Anna', 'Zimmerman', '$2b$12$fG0c.fbXWfmsM6ZFhpNkKeer49I6G4Lp6ZxRSi78mno4g835UfJJ2', 'angelarogers@example.com', 0, 1),
(9, 'Joseph', 'Smith', '$2b$12$Ow/xpXlLCvSgKztq2in1suGGfjBGl9CXwUKi9fSZG0wWSYPLWSrWy', 'porterjames@example.com', 0, 1),
(10, 'Anita', 'James', '$2b$12$keR4yMYxO6bUVAFJ6c6EOe.IBOqFlXKPY39Ybewl2GwBcTed1mc0i', 'herbertjames@example.org', 0, 1),
(11, 'Lisa', 'Guzman', '$2b$12$IBw.tnqsBMl4RSb7CLF5Qe8ljqHnUkhGNj0tHvY8V0u2CBbAFV.o6', 'eellis@example.org', 0, 1),
(12, 'Erin', 'Hudson', '$2b$12$8e3zoYY6fUQz.EEXhdw6neYQ/P8PNCVlNE.L1RY.c8unfbWuJDlCO', 'krichardson@example.org', 0, 1),
(13, 'Kristin', 'Matthews', '$2b$12$9AK.qJO6WTQ8AofhhEo3KOgqnf.h4/TVIBgJOnWrvmsPpwiYLQmK6', 'boothjoseph@example.org', 0, 1),
(14, 'Kelsey', 'Thomas', '$2b$12$JvBxMoag.ix1QsBa/xUE3OdmCaQVw5D0nr7o1VxuDN8WnpGoAnWn2', 'ericksonjeanette@example.com', 0, 1),
(15, 'Michelle', 'Nelson', '$2b$12$cprSMSbU7ZzW9DB9j7ugVuydxPVimqJG8PCYVd.imiCz3hw78M3qy', 'shellyramirez@example.org', 0, 1),
(16, 'Gregory', 'Williams', '$2b$12$MRG07sxLeW0YOiEQVtGbSet4JvRNQrktOMLEymi8czoobzguLbrj6', 'zsmith@example.org', 0, 1),
(17, 'Lynn', 'Schmidt', '$2b$12$VybvpcJ4saHvarQmYk6ngez6fyGbjo4Vuu8SuEWZCu30GfQtv3xCC', 'ydeleon@example.org', 0, 1),
(18, 'Eric', 'Cline', '$2b$12$RPQKT4VLyk3MxHYGo.miXOVESbIeffo3WghpZA5Ti2P4eN5/JmbNm', 'mooremeredith@example.com', 0, 1),
(19, 'Stanley', 'Baker', '$2b$12$glZJHV5wU4aFAze9FTbZguufazQTvmxymCrrniWenkqanrtzdXMM6', 'lewisann@example.org', 0, 1),
(20, 'Kaitlyn', 'Morton', '$2b$12$B3JCo91oyq3QULYJW/hd8uDviUzZvlmFEvn4RlAzIL9Ukn6T3w8bG', 'david79@example.net', 0, 1),
(21, 'Russell', 'Williams', '$2b$12$aIh9ItRyKAe9hGvkBOfkKOvA6KFJRueVX3QVx6GvN1GYweGr9IT5O', 'johnsonkyle@example.com', 0, 1),
(22, 'Katherine', 'Jordan', '$2b$12$/B3dyWMx.1gKTo0utOYgpeGDt6E0w0PzSfosl7MEXGvuLKUDsq4MS', 'lisalewis@example.net', 0, 1),
(23, 'Douglas', 'Walker', '$2b$12$QQ8sJlT0jd3Z5wROmKUAjOVcrZtd5hWxkrap.YWnS5s.nO9.S6nl2', 'jared37@example.net', 0, 1),
(24, 'Kenneth', 'Wilson', '$2b$12$5edyiREseo40sLpNpQWTM.NgeGu7lK2ONkJ/VEm8waZDGKvSjQxjO', 'lrichardson@example.com', 0, 1),
(25, 'Donald', 'Hall', '$2b$12$DFyRFN6cID1Wp2O6MCa6ye9EynFDwNPbKZ6t4cGGyx4zqaj7sk4JS', 'damon13@example.net', 0, 1),
(26, 'Michael', 'Lee', '$2b$12$/PXo1EaohO9JJtIqOFwCf.4y.z4MNIQReReNbB3VEfl50zXX38sPe', 'henry01@example.net', 0, 1),
(27, 'Jose', 'Bryant', '$2b$12$usg5/tXHgRquADI1Fir/P.uQ85Z4ZfEB65saQq5CMwjAkwaIhUVjO', 'perryblake@example.com', 0, 1),
(28, 'Michael', 'Rodriguez', '$2b$12$c4CdzEE9bbt2L0zrjQW0Ke2F8rYP2I7pF/DzSONS5T75DSctWarS.', 'onealkeith@example.org', 0, 1),
(29, 'Timothy', 'Richardson', '$2b$12$a364bl3PAdqZpBDrqZ9Au.5xr.wa8n6jdmJtrFwV6rdCGfbb7sPJG', 'vgriffin@example.com', 0, 1),
(30, 'Sherry', 'Alvarez', '$2b$12$NqJZKA6xzExOe.XIi9Tfx.5bJHaXh7C5iXYtK.wvyo42wn6R8wF7S', 'ahayes@example.com', 0, 1),
(31, 'Abigail', 'Rangel', '$2b$12$xo1w3amg5Z2Ej32A9.QRyO5I63JZdZtRnByuW7qSyf24gNp.RAILm', 'brianna94@example.org', 0, 1),
(32, 'Lori', 'Ross', '$2b$12$gyWJfdPximjOqMT/KpZ9pO4KWzBrBshJRwYJh4xDF0j/NJz88DP4K', 'lambertanthony@example.net', 0, 1),
(33, 'Rebecca', 'Mccoy', '$2b$12$TaTDR2CpzVYs06jQbU1p1.1BmXSqsqjm29FTZNFRRBg.8ofYTSbXO', 'gespinoza@example.net', 0, 1),
(34, 'Richard', 'Roberts', '$2b$12$zlxTyGl2dyHswuU7qjWPveHtjM7Jjxmz7qonYkmlHBd48sQcrnxuK', 'sarah83@example.org', 0, 1),
(35, 'Jonathan', 'Miller', '$2b$12$Ph/KRkPs8srjPoIu/ODqvu.tpQ4BwKY0vMKtrOhW6COsKjRSd5um6', 'mario02@example.net', 0, 1),
(36, 'James', 'Powell', '$2b$12$TC/Q48BT2rIb7zE8pz8Ob.SVbSvdOBdXZEAQ3xeoLuH0IwoOGB7O6', 'hendrixbreanna@example.org', 0, 1),
(37, 'Chris', 'Payne', '$2b$12$IE5fgAaauggkKtCnvYdO8.qI8Ow5GZKCuyYYgfXnjd9bxwaFAl8Lq', 'hardysarah@example.org', 0, 1),
(38, 'Jeffrey', 'Daniel', '$2b$12$LAI714HViupk.3FbKZ0du.ktMURrj9CqsC1c6sYfHoBwgur6MdFsq', 'ljones@example.org', 0, 0),
(39, 'Debra', 'Wade', '$2b$12$vqejOPNHQeA5U.uTTbLCGeaUskxm8xx09kqwZ/eO//I5T2M0I7x5K', 'martinezjoan@example.net', 0, 1),
(40, 'James', 'Rodriguez', '$2b$12$r6V2k.WGDufD6emgBAYkfu3oeUP.6BsnBscieQd.9vAlrUVZt3uJy', 'johndaniels@example.com', 0, 1),
(41, 'Amy', 'Martinez', '$2b$12$WBh49YDvrdLpXbQfWN9cNOPUGVv0a9j9A3DWE7OU9k2FsCDXcwpa6', 'mary56@example.com', 0, 1),
(42, 'Zachary', 'Waters', '$2b$12$vq47MFMyiryOSaWaM4tJ/eEFd970zON/da6w695G649fbh1TSZ4Tu', 'wbell@example.net', 0, 1),
(43, 'Chris', 'Walker', '$2b$12$IFUyrgNFjns3O8SIS6624OUnhP3JUf0obDZJmAW0gd5FhQRnlqS2K', 'amandavalencia@example.net', 0, 1),
(44, 'James', 'Fox', '$2b$12$yXcXxdAAIqbomzEeZO0/yeo42CVh8WeLyydIXzm.WBRw9d1eJKvcS', 'robert29@example.com', 0, 1),
(45, 'George', 'Ramsey', '$2b$12$PTYjGsYQkjZBxSfcaxrET.zhucYzkq6Gvo3UvtQAGyobMtMo3.kOu', 'riverstyler@example.net', 0, 1),
(46, 'Aimee', 'Love', '$2b$12$n.0xsIGtyl6zhMWAd/xxWOlnry3VlwoSDH0jU9GweXkka0W3UoLne', 'todd04@example.com', 0, 1),
(47, 'Pamela', 'Hughes', '$2b$12$SyglUBDBlsIfjvgbryMkn.QsY2sLgMEta0EGYPmwInjpKsjPknKwC', 'btodd@example.org', 0, 1),
(48, 'Michele', 'Chavez', '$2b$12$.Ip.ZkD628wGn4Mo3OE1rOrBsBfE44WdOseIbTk11DRNqWtIW/Eo.', 'joan90@example.net', 0, 1),
(49, 'Sarah', 'Burnett', '$2b$12$5dE/wrJ2drgGMviKaWlw8OThQWRAPSIFIQWSA8G4G4ft8YR.oKW6C', 'ashleyaguilar@example.com', 0, 1),
(50, 'Mark', 'Stokes', '$2b$12$iISTIByuf0KosSb.l7HmuuNEoy0cPNwaU7g0/of/bjpeiWdj6919e', 'pwheeler@example.com', 0, 1),
(51, 'Brandon', 'Stephenson', '$2b$12$aWK7yMSCMSa/dtWpdyUavuUo4tMNIt0hETZ1bhR6gkI6eJHq4oYbG', 'markmeza@example.net', 0, 1),
(52, 'Simone', 'Di S', '$2b$12$FtEYfkN7UYy266p3j/ACSeiJbPj8Z30hOi7v1sa3lbGU3C83XbqMa', 'test@si.it', 0, 1),
(54, 'Ok', 'Okk', '$2b$12$8RmLGw3KT0YCKJKKbtXFGukKkUBBzAnDFmtUNxia0QBOqUV52/4Se', 'email@ok.com', 0, 1),
(55, 'Admin2', 'Admin2', '$2b$12$m7AcCHlffmrIg5f8JIpIkOz5xh5tDd3jPBGtFRmtBi/BCU.Lxv6x6', 'secondadmin@park.com', 1, 1),
(56, 'Lana', 'Rop', '$2b$12$oX4yY8n2fYuzX4voBAJGeuJ8Y9UjffKo3KHJCseV8ucbD6b2H6WZa', 'lana@car.com', 0, 1),
(57, 'another', 'test', '$2b$12$OzNvggiLVr7m4aBYHdpHKu1PmXjUNnOL3ay7b7usOW/VNNv.hLQN.', 'anothertest@test.it', 0, 1),
(58, 'last', 'test', '$2b$12$3B4No1KFeCMWkeDsCf0u2exaFwkyg4GgIP33ygtvZU0MuavRnNqmW', 'last@test.it', 0, 1),
(59, 'now', 'ok', '$2b$12$O.77jip//MoSzxfOwZ41D.oaMU1YoWKCzFt/m.tbTC6474CJcg0L2', 'ok@ok.it', 0, 1),
(63, 'but', 'ok', '$2b$12$tvqPSq8eIJR5atL7fdUNd.nXt.IpRs7rBwPNNaeHFMiJ7DLZU1svS', 'newemail@post.it', 0, 1),
(64, 'cattest', 'catalog', '$2b$12$6W6jH.hj2mBj7Lq/Q0HWv.8CjYqxFomH5YRN3iVisJaIYH531iQMW', 'catalogtest1@test.com', 0, 1),
(65, 'try', 'another', '$2b$12$uADxoR4I98GOe9aTA0dy4ui/XhOiZpf9vdC/oWFn3EPzG7AUt50ua', 'itsatest@ok.com', 0, 1),
(66, 'Fake', 'Name', '$2b$12$d86twKpD/9FA.LPHE.w4sOYG3WdYLXvAIHTd722apZ79Zd60AV2Z6', 'fakename@test.com', 0, 0),
(67, 'luigi', 'verdi', '$2b$12$rrCE.7ly11xbbFp2SerAquyJTiscRB9Xw39slNPM1rsnDBpJPwXU6', 'luigiverdi@example.com', 0, 0);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `auto`
--
ALTER TABLE `auto`
  ADD PRIMARY KEY (`auto_id`),
  ADD UNIQUE KEY `vin` (`vin`),
  ADD UNIQUE KEY `license_plate` (`license_plate`),
  ADD KEY `type_id` (`type_id`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `area_id` (`area_id`);

--
-- Indici per le tabelle `edit_date`
--
ALTER TABLE `edit_date`
  ADD PRIMARY KEY (`edit_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `auto_id` (`auto_id`);

--
-- Indici per le tabelle `entry_date`
--
ALTER TABLE `entry_date`
  ADD PRIMARY KEY (`entry_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `auto_id` (`auto_id`);

--
-- Indici per le tabelle `exit_date`
--
ALTER TABLE `exit_date`
  ADD PRIMARY KEY (`exit_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `auto_id` (`auto_id`);

--
-- Indici per le tabelle `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indici per le tabelle `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`note_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indici per le tabelle `parking_area`
--
ALTER TABLE `parking_area`
  ADD PRIMARY KEY (`area_id`),
  ADD KEY `auto_id` (`auto_id`);

--
-- Indici per le tabelle `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`status_id`);

--
-- Indici per le tabelle `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`type_id`);

--
-- Indici per le tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `auto`
--
ALTER TABLE `auto`
  MODIFY `auto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT per la tabella `edit_date`
--
ALTER TABLE `edit_date`
  MODIFY `edit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT per la tabella `entry_date`
--
ALTER TABLE `entry_date`
  MODIFY `entry_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT per la tabella `exit_date`
--
ALTER TABLE `exit_date`
  MODIFY `exit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT per la tabella `logs`
--
ALTER TABLE `logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT per la tabella `notes`
--
ALTER TABLE `notes`
  MODIFY `note_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT per la tabella `parking_area`
--
ALTER TABLE `parking_area`
  MODIFY `area_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=187;

--
-- AUTO_INCREMENT per la tabella `status`
--
ALTER TABLE `status`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la tabella `types`
--
ALTER TABLE `types`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT per la tabella `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `auto`
--
ALTER TABLE `auto`
  ADD CONSTRAINT `auto_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `types` (`type_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `auto_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `auto_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `auto_ibfk_4` FOREIGN KEY (`area_id`) REFERENCES `parking_area` (`area_id`) ON DELETE SET NULL;

--
-- Limiti per la tabella `edit_date`
--
ALTER TABLE `edit_date`
  ADD CONSTRAINT `edit_date_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `edit_date_ibfk_2` FOREIGN KEY (`auto_id`) REFERENCES `auto` (`auto_id`) ON DELETE SET NULL;

--
-- Limiti per la tabella `entry_date`
--
ALTER TABLE `entry_date`
  ADD CONSTRAINT `entry_date_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `entry_date_ibfk_2` FOREIGN KEY (`auto_id`) REFERENCES `auto` (`auto_id`) ON DELETE SET NULL;

--
-- Limiti per la tabella `exit_date`
--
ALTER TABLE `exit_date`
  ADD CONSTRAINT `exit_date_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `exit_date_ibfk_2` FOREIGN KEY (`auto_id`) REFERENCES `auto` (`auto_id`) ON DELETE SET NULL;

--
-- Limiti per la tabella `logs`
--
ALTER TABLE `logs`
  ADD CONSTRAINT `logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL;

--
-- Limiti per la tabella `notes`
--
ALTER TABLE `notes`
  ADD CONSTRAINT `notes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL;

--
-- Limiti per la tabella `parking_area`
--
ALTER TABLE `parking_area`
  ADD CONSTRAINT `parking_area_ibfk_1` FOREIGN KEY (`auto_id`) REFERENCES `auto` (`auto_id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
