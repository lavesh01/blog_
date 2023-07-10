-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 09, 2020 at 09:15 PM
-- Server version: 10.4.10-MariaDB-log
-- PHP Version: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bon9`
--

-- --------------------------------------------------------

--
-- Table structure for table `alembic_version_config`
--

CREATE TABLE `alembic_version_config` (
  `version_num` varchar(32) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `alembic_version_config`
--

INSERT INTO `alembic_version_config` (`version_num`, `deleted`, `deleted_by`, `created_on`, `created_by`, `modified_on`, `modified_by`, `customer_id`) VALUES
('79290b511e4b', 0, NULL, '2020-09-17 01:12:27', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bf_activities`
--

CREATE TABLE `bf_activities` (
  `activity_id` bigint(20) NOT NULL,
  `activity` varchar(255) DEFAULT NULL COMMENT 'eg. edit, delete, update',
  `module` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `url_param` varchar(255) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bf_activities`
--

INSERT INTO `bf_activities` (`activity_id`, `activity`, `module`, `controller`, `method`, `url_param`, `created_on`, `created_by`, `customer_id`, `description`) VALUES
(1, 'logged in from: ::1', 'users', '', '', '', '2018-11-05 14:56:35', NULL, NULL, ''),
(2, 'Created Module: Dashboard : ::1', 'modulebuilder', '', '', '', '2018-11-05 16:18:17', NULL, NULL, ''),
(3, 'Deleted Module: Dashboard : ::1', 'builder', '', '', '', '2018-11-05 16:19:44', NULL, NULL, ''),
(4, 'logged in from: ::1', 'users', '', '', '', '2018-11-05 17:47:11', NULL, NULL, ''),
(5, 'Created Module: Extraction : ::1', 'modulebuilder', '', '', '', '2018-11-05 18:03:27', NULL, NULL, ''),
(6, 'Deleted Module: Extraction : ::1', 'builder', '', '', '', '2018-11-05 18:05:47', NULL, NULL, ''),
(7, 'Created Module: Dashboard : ::1', 'modulebuilder', '', '', '', '2018-11-05 18:06:11', NULL, NULL, ''),
(8, 'logged in from: ::1', 'users', '', '', '', '2018-11-06 17:41:34', NULL, NULL, ''),
(9, 'Created Module: App : ::1', 'modulebuilder', '', '', '', '2018-11-06 17:52:26', NULL, NULL, ''),
(10, 'logged in from: ::1', 'users', '', '', '', '2018-11-06 19:58:21', NULL, NULL, ''),
(11, 'Deleted Module: App : ::1', 'builder', '', '', '', '2018-11-06 20:03:03', NULL, NULL, ''),
(12, 'Deleted Module: App : ::1', 'builder', '', '', '', '2018-11-06 20:03:10', NULL, NULL, ''),
(13, 'Created Module: App : ::1', 'modulebuilder', '', '', '', '2018-11-06 20:07:58', NULL, NULL, ''),
(14, 'Created Module: application : ::1', 'modulebuilder', '', '', '', '2018-11-06 20:13:22', NULL, NULL, ''),
(15, 'Deleted Module: App : ::1', 'builder', '', '', '', '2018-11-06 20:14:16', NULL, NULL, ''),
(16, 'logged in from: ::1', 'users', '', '', '', '2018-11-06 23:48:20', NULL, NULL, ''),
(17, 'logged in from: ::1', 'users', '', '', '', '2018-11-08 11:49:08', NULL, NULL, ''),
(18, 'App settings saved from: ::1', 'core', '', '', '', '2018-11-08 20:35:37', NULL, NULL, ''),
(19, 'App settings saved from: ::1', 'core', '', '', '', '2018-11-08 20:59:25', NULL, NULL, ''),
(20, 'logged in from: ::1', 'users', '', '', '', '2018-11-09 12:02:40', NULL, NULL, ''),
(21, 'Created Module: Support : ::1', 'modulebuilder', '', '', '', '2018-11-09 12:25:25', NULL, NULL, ''),
(22, 'Created record with ID: 1 : ::1', 'support', '', '', '', '2018-11-09 14:05:00', NULL, NULL, ''),
(23, 'Updated record with ID: 1 : ::1', 'support', '', '', '', '2018-11-09 14:15:15', NULL, NULL, ''),
(24, 'Updated record with ID: 2 : ::1', 'support', '', '', '', '2018-11-09 14:46:12', NULL, NULL, ''),
(25, 'Created record with ID: 2 : ::1', 'subscription_plans', '', '', '', '2018-11-09 17:24:40', NULL, NULL, ''),
(26, 'Created record with ID: 3 : ::1', 'subscription_plans', '', '', '', '2018-11-09 17:25:04', NULL, NULL, ''),
(27, 'Created record with ID: 4 : ::1', 'subscription_plans', '', '', '', '2018-11-09 17:25:29', NULL, NULL, ''),
(28, 'logged in from: 103.192.75.11', 'users', '', '', '', '2018-11-09 22:59:33', NULL, NULL, ''),
(29, 'logged in from: 103.192.75.11', 'users', '', '', '', '2018-11-10 00:13:25', NULL, NULL, ''),
(30, 'logged in from: 42.111.26.174', 'users', '', '', '', '2018-11-10 01:56:21', NULL, NULL, ''),
(31, 'logged in from: 1.186.178.161', 'users', '', '', '', '2018-11-10 05:18:14', NULL, NULL, ''),
(32, 'logged in from: 1.186.177.145', 'users', '', '', '', '2018-11-10 11:40:42', NULL, NULL, ''),
(33, 'logged in from: 1.186.177.145', 'users', '', '', '', '2018-11-10 12:22:59', NULL, NULL, ''),
(34, 'logged in from: 1.186.177.145', 'users', '', '', '', '2018-11-10 18:39:32', NULL, NULL, ''),
(35, 'logged in from: 1.186.177.145', 'users', '', '', '', '2018-11-10 22:39:16', NULL, NULL, ''),
(36, 'Deleted record with ID: 76 : 1.186.177.145', 'data_upload', '', '', '', '2018-11-11 03:54:46', NULL, NULL, ''),
(37, 'logged in from: 27.60.179.63', 'users', '', '', '', '2018-11-11 13:31:36', NULL, NULL, ''),
(38, 'logged in from: 1.186.168.109', 'users', '', '', '', '2018-11-11 14:59:12', NULL, NULL, ''),
(39, 'logged in from: 1.186.168.109', 'users', '', '', '', '2018-11-11 22:51:56', NULL, NULL, ''),
(40, 'logged in from: 42.111.10.24', 'users', '', '', '', '2018-11-12 03:31:24', NULL, NULL, ''),
(41, 'logged in from: 103.192.74.132', 'users', '', '', '', '2018-11-12 23:08:36', NULL, NULL, ''),
(42, 'logged in from: 42.111.17.244', 'users', '', '', '', '2018-11-13 15:17:19', NULL, NULL, ''),
(43, 'logged in from: 42.111.6.246', 'users', '', '', '', '2018-11-13 21:14:46', NULL, NULL, ''),
(44, 'logged in from: 42.111.7.220', 'users', '', '', '', '2018-11-14 11:38:22', NULL, NULL, ''),
(45, 'logged in from: 42.111.16.161', 'users', '', '', '', '2018-11-14 16:40:41', NULL, NULL, ''),
(46, 'logged in from: 103.192.74.132', 'users', '', '', '', '2018-11-14 23:35:42', NULL, NULL, ''),
(47, 'logged in from: 103.192.74.132', 'users', '', '', '', '2018-11-15 10:25:00', NULL, NULL, ''),
(48, 'logged in from: 49.35.34.9', 'users', '', '', '', '2018-11-15 17:18:42', NULL, NULL, ''),
(49, 'logged in from: 42.111.11.139', 'users', '', '', '', '2018-11-15 23:52:53', NULL, NULL, ''),
(50, 'logged in from: 103.192.74.97', 'users', '', '', '', '2018-11-16 08:14:24', NULL, NULL, ''),
(51, 'logged in from: 49.35.6.3', 'users', '', '', '', '2018-11-16 15:28:46', NULL, NULL, ''),
(52, 'logged in from: 103.192.74.97', 'users', '', '', '', '2018-11-16 19:17:56', NULL, NULL, ''),
(53, 'logged in from: 103.192.74.97', 'users', '', '', '', '2018-11-18 09:54:11', NULL, NULL, ''),
(54, 'logged in from: 103.192.74.97', 'users', '', '', '', '2018-11-18 16:51:45', NULL, NULL, ''),
(55, 'logged in from: 2405:204:9200:7cd9:818c:17e2:6afb:86e1', 'users', '', '', '', '2018-11-19 15:16:18', NULL, NULL, ''),
(56, 'logged in from: 103.192.75.8', 'users', '', '', '', '2018-11-19 18:19:13', NULL, NULL, ''),
(57, 'logged in from: 103.192.75.8', 'users', '', '', '', '2018-11-19 21:21:57', NULL, NULL, ''),
(58, 'logged in from: 103.192.75.8', 'users', '', '', '', '2018-11-19 21:35:47', NULL, NULL, ''),
(59, 'logged in from: 103.192.75.8', 'users', '', '', '', '2018-11-20 20:57:00', NULL, NULL, ''),
(60, 'logged in from: 103.192.74.65', 'users', '', '', '', '2018-11-21 07:45:49', NULL, NULL, ''),
(61, 'logged in from: 103.192.74.65', 'users', '', '', '', '2018-11-22 00:23:53', NULL, NULL, ''),
(62, 'logged in from: 42.111.15.156', 'users', '', '', '', '2018-11-22 09:38:09', NULL, NULL, ''),
(63, 'logged in from: 103.192.74.65', 'users', '', '', '', '2018-11-22 19:47:19', NULL, NULL, ''),
(64, 'logged in from: 103.192.74.65', 'users', '', '', '', '2018-11-23 08:11:57', NULL, NULL, ''),
(65, 'logged in from: 2409:4042:2010:1cca:49f2:3ff5:170f:7935', 'users', '', '', '', '2018-11-23 15:14:11', NULL, NULL, ''),
(66, 'logged in from: 2409:4042:2010:1cca:49f2:3ff5:170f:7935', 'users', '', '', '', '2018-11-23 17:49:24', NULL, NULL, ''),
(67, 'logged in from: 42.111.1.128', 'users', '', '', '', '2018-11-24 10:36:01', NULL, NULL, ''),
(68, 'logged in from: 42.111.2.142', 'users', '', '', '', '2018-11-24 12:49:40', NULL, NULL, ''),
(69, 'logged in from: 103.192.75.5', 'users', '', '', '', '2018-11-25 07:42:29', NULL, NULL, ''),
(70, 'logged in from: 103.192.75.5', 'users', '', '', '', '2018-11-27 00:27:53', NULL, NULL, ''),
(71, 'logged in from: 103.192.75.5', 'users', '', '', '', '2018-11-28 03:17:52', NULL, NULL, ''),
(72, 'logged in from: 103.192.75.5', 'users', '', '', '', '2018-11-28 07:55:01', NULL, NULL, ''),
(73, 'logged in from: 106.220.78.41', 'users', '', '', '', '2018-11-28 13:42:41', NULL, NULL, ''),
(74, 'logged in from: 106.220.78.41', 'users', '', '', '', '2018-11-28 16:57:58', NULL, NULL, ''),
(75, 'logged in from: 103.192.75.5', 'users', '', '', '', '2018-11-28 19:32:54', NULL, NULL, ''),
(76, 'logged in from: 103.192.75.5', 'users', '', '', '', '2018-11-29 08:16:09', NULL, NULL, ''),
(77, 'logged in from: 2405:204:9317:856:c9f9:d48d:9f1a:bafb', 'users', '', '', '', '2018-11-29 16:54:28', NULL, NULL, ''),
(78, 'logged in from: 2405:204:9317:856:c9f9:d48d:9f1a:bafb', 'users', '', '', '', '2018-11-29 21:18:58', NULL, NULL, ''),
(79, 'logged in from: 103.192.75.5', 'users', '', '', '', '2018-11-30 01:21:33', NULL, NULL, ''),
(80, 'logged in from: 103.192.75.5', 'users', '', '', '', '2018-11-30 03:48:35', NULL, NULL, ''),
(81, 'logged in from: 103.192.75.5', 'users', '', '', '', '2018-11-30 09:09:19', NULL, NULL, ''),
(82, 'logged in from: 2405:204:92aa:86e3:e8a6:7155:b346:9fed', 'users', '', '', '', '2018-11-30 13:03:27', NULL, NULL, ''),
(83, 'logged in from: 103.192.75.5', 'users', '', '', '', '2018-11-30 17:09:01', NULL, NULL, ''),
(84, 'logged in from: 42.111.5.209', 'users', '', '', '', '2018-11-30 20:15:36', NULL, NULL, ''),
(85, 'logged in from: 42.111.7.27', 'users', '', '', '', '2018-12-01 12:47:19', NULL, NULL, ''),
(86, 'logged in from: 1.186.179.221', 'users', '', '', '', '2018-12-01 22:56:50', NULL, NULL, ''),
(87, 'logged in from: 1.186.179.221', 'users', '', '', '', '2018-12-02 09:57:38', NULL, NULL, ''),
(88, 'logged in from: 1.186.179.221', 'users', '', '', '', '2018-12-02 14:36:31', NULL, NULL, ''),
(89, 'logged in from: 1.186.179.221', 'users', '', '', '', '2018-12-02 21:01:56', NULL, NULL, ''),
(90, 'logged in from: 42.111.12.0', 'users', '', '', '', '2018-12-03 02:22:55', NULL, NULL, ''),
(91, 'logged in from: 103.192.74.127', 'users', '', '', '', '2018-12-03 09:33:33', NULL, NULL, ''),
(92, 'logged in from: 42.111.8.107', 'users', '', '', '', '2018-12-03 18:53:12', NULL, NULL, ''),
(93, 'logged in from: 42.111.10.56', 'users', '', '', '', '2018-12-04 09:25:09', NULL, NULL, ''),
(94, 'logged in from: 103.192.74.95', 'users', '', '', '', '2018-12-06 08:48:55', NULL, NULL, ''),
(95, 'logged in from: 2405:204:9292:5eb:b1a0:c55b:64b7:e3dd', 'users', '', '', '', '2018-12-06 13:03:28', NULL, NULL, ''),
(96, 'logged in from: 42.111.16.243', 'users', '', '', '', '2018-12-07 10:44:06', NULL, NULL, ''),
(97, 'logged in from: 103.192.74.191', 'users', '', '', '', '2018-12-07 22:33:34', NULL, NULL, ''),
(98, 'logged in from: 103.192.74.112', 'users', '', '', '', '2018-12-09 23:53:56', NULL, NULL, ''),
(99, 'logged in from: 103.192.74.112', 'users', '', '', '', '2018-12-10 09:51:05', NULL, NULL, ''),
(100, 'logged in from: 106.193.247.165', 'users', '', '', '', '2018-12-10 14:11:12', NULL, NULL, ''),
(101, 'logged in from: 42.111.11.123', 'users', '', '', '', '2018-12-10 18:12:09', NULL, NULL, ''),
(102, 'logged in from: 103.192.74.112', 'users', '', '', '', '2018-12-11 10:23:29', NULL, NULL, ''),
(103, 'logged in from: 2405:204:9099:cd73:2429:27db:6045:c08d', 'users', '', '', '', '2018-12-12 16:51:02', NULL, NULL, ''),
(104, 'logged in from: 42.111.9.64', 'users', '', '', '', '2018-12-13 10:17:49', NULL, NULL, ''),
(105, 'logged in from: 42.111.8.25', 'users', '', '', '', '2018-12-13 18:01:46', NULL, NULL, ''),
(106, 'logged in from: 42.111.19.91', 'users', '', '', '', '2018-12-15 07:19:39', NULL, NULL, ''),
(107, 'logged in from: 42.111.10.160', 'users', '', '', '', '2018-12-17 12:01:58', NULL, NULL, ''),
(108, 'logged in from: 2405:204:932b:6294:b4d0:5cc5:779f:8eef', 'users', '', '', '', '2018-12-17 14:14:27', NULL, NULL, ''),
(109, 'logged in from: 106.193.168.116', 'users', '', '', '', '2018-12-18 15:36:23', NULL, NULL, ''),
(110, 'logged in from: 42.111.26.247', 'users', '', '', '', '2018-12-18 22:24:33', NULL, NULL, ''),
(111, 'logged in from: 42.111.18.72', 'users', '', '', '', '2018-12-19 13:17:21', NULL, NULL, ''),
(112, 'logged in from: 42.111.13.211', 'users', '', '', '', '2018-12-20 16:02:32', NULL, NULL, ''),
(113, 'logged in from: 42.111.11.85', 'users', '', '', '', '2018-12-25 10:09:06', NULL, NULL, ''),
(114, 'logged in from: 42.108.164.108', 'users', '', '', '', '2018-12-26 20:18:56', NULL, NULL, ''),
(115, 'logged in from: 123.201.54.84', 'users', '', '', '', '2018-12-26 23:55:52', NULL, NULL, ''),
(116, 'logged in from: 157.33.195.82', 'users', '', '', '', '2019-01-08 12:49:02', NULL, NULL, ''),
(117, 'logged in from: 123.201.194.118', 'users', '', '', '', '2019-02-14 22:57:01', NULL, NULL, ''),
(118, 'logged in from: 123.201.52.102', 'users', '', '', '', '2019-02-26 21:23:04', NULL, NULL, ''),
(119, 'logged in from: 123.201.52.241', 'users', '', '', '', '2019-03-13 19:57:51', NULL, NULL, ''),
(120, 'logged in from: 157.33.176.199', 'users', '', '', '', '2019-05-08 14:06:18', NULL, NULL, ''),
(121, 'logged in from: 157.33.139.21', 'users', '', '', '', '2019-05-28 10:50:03', NULL, NULL, ''),
(122, 'logged in from: 103.101.71.26', 'users', '', '', '', '2019-06-18 22:50:29', NULL, NULL, ''),
(123, 'logged in from: 103.101.71.26', 'users', '', '', '', '2019-06-26 23:09:27', NULL, NULL, ''),
(124, 'logged in from: 103.101.71.26', 'users', '', '', '', '2019-07-02 23:43:12', NULL, NULL, ''),
(125, 'Created Module: linkedin : 103.101.71.26', 'modulebuilder', '', '', '', '2019-07-02 23:58:26', NULL, NULL, ''),
(126, 'Deleted Module: linkedin : 103.101.71.26', 'builder', '', '', '', '2019-07-03 00:04:18', NULL, NULL, ''),
(127, 'logged in from: 1.186.171.10', 'users', '', '', '', '2019-08-12 20:57:56', NULL, NULL, ''),
(128, 'logged in from: 123.63.161.130', 'users', '', '', '', '2019-08-12 22:29:44', NULL, NULL, ''),
(129, 'logged in from: 111.65.34.253', 'users', '', '', '', '2019-09-03 16:37:30', NULL, NULL, ''),
(130, 'logged in from: 42.106.200.8', 'users', '', '', '', '2019-09-23 07:12:41', NULL, NULL, ''),
(131, 'logged in from: 1.186.175.124', 'users', '', '', '', '2019-10-08 20:07:18', NULL, NULL, ''),
(132, 'logged in from: 1.186.175.13', 'users', '', '', '', '2019-11-09 16:22:10', NULL, NULL, ''),
(133, 'logged in from: 171.77.129.119', 'users', '', '', '', '2019-11-16 17:28:52', NULL, NULL, ''),
(134, 'logged in from: 1.186.171.249', 'users', '', '', '', '2019-11-24 16:44:38', NULL, NULL, ''),
(135, 'logged in from: 1.186.168.197', 'users', '', '', '', '2019-12-01 07:00:51', NULL, NULL, ''),
(136, 'logged in from: 1.186.168.41', 'users', '', '', '', '2020-03-29 20:10:28', NULL, NULL, ''),
(137, 'logged in from: 1.186.168.41', 'users', '', '', '', '2020-03-29 20:11:03', NULL, NULL, ''),
(138, 'logged in from: 1.186.170.56', 'users', '', '', '', '2020-05-02 14:10:18', NULL, NULL, ''),
(139, 'logged in from: 49.36.12.168', 'users', '', '', '', '2020-05-02 14:23:10', NULL, NULL, ''),
(140, 'logged in from: ::1', 'users', '', '', '', '2020-07-11 09:28:44', NULL, NULL, ''),
(141, 'logged in from: ::1', 'users', '', '', '', '2020-07-27 20:04:13', NULL, NULL, ''),
(142, 'logged in from: ::1', 'users', '', '', '', '2020-07-28 17:40:06', NULL, NULL, ''),
(143, 'logged in from: ::1', 'users', '', '', '', '2020-08-02 21:21:41', NULL, NULL, ''),
(144, 'logged in from: ::1', 'users', '', '', '', '2020-08-07 18:55:51', NULL, NULL, ''),
(145, 'logged in from: ::1', 'users', '', '', '', '2020-08-08 20:27:47', NULL, NULL, ''),
(146, 'Created Module: Formasas : ::1', 'modulebuilder', '', '', '', '2020-08-08 20:56:51', NULL, NULL, ''),
(147, 'Deleted Module: Formasas : ::1', 'builder', '', '', '', '2020-08-08 22:35:35', NULL, NULL, ''),
(148, 'Updated record with ID: 1 : ::1', 'support', '', '', '', '2020-08-09 00:36:49', NULL, NULL, ''),
(149, 'logged in from: ::1', 'users', '', '', '', '2020-08-09 22:02:22', NULL, NULL, ''),
(150, 'Created Module: Campaign : ::1', 'modulebuilder', '', '', '', '2020-08-09 22:57:37', NULL, NULL, ''),
(151, 'logged in from: ::1', 'users', '', '', '', '2020-08-10 06:10:00', NULL, NULL, ''),
(152, 'logged in from: ::1', 'users', '', '', '', '2020-08-10 10:07:52', NULL, NULL, ''),
(153, 'logged in from: ::1', 'users', '', '', '', '2020-08-10 14:40:24', NULL, NULL, ''),
(154, 'logged in from: ::1', 'users', '', '', '', '2020-08-11 05:50:50', NULL, NULL, ''),
(155, 'Created Module: udc : ::1', 'modulebuilder', '', '', '', '2020-08-11 09:40:15', NULL, NULL, ''),
(156, 'logged in from: ::1', 'users', '', '', '', '2020-08-11 13:34:35', NULL, NULL, ''),
(157, 'logged in from: ::1', 'users', '', '', '', '2020-08-11 17:58:13', NULL, NULL, ''),
(158, 'Created Module: companies : ::1', 'modulebuilder', '', '', '', '2020-08-11 20:11:33', NULL, NULL, ''),
(159, 'logged in from: ::1', 'users', '', '', '', '2020-08-19 06:17:56', NULL, NULL, ''),
(160, 'logged in from: ::1', 'users', '', '', '', '2020-08-19 19:40:59', NULL, NULL, ''),
(161, 'Created Module: Extension : ::1', 'modulebuilder', '', '', '', '2020-08-19 19:51:07', NULL, NULL, ''),
(162, 'logged in from: ::1', 'users', '', '', '', '2020-08-20 17:00:21', NULL, NULL, ''),
(163, 'Created Module: Extensions : ::1', 'modulebuilder', '', '', '', '2020-08-20 18:21:24', NULL, NULL, ''),
(164, 'Created record with ID:  : ::1', 'extension', '', '', '', '2020-08-20 18:26:29', NULL, NULL, ''),
(165, 'Created record with ID:  : ::1', 'extension', '', '', '', '2020-08-20 18:33:02', NULL, NULL, ''),
(166, 'logged in from: ::1', 'users', '', '', '', '2020-08-21 07:01:56', NULL, NULL, ''),
(167, 'Created Module: Aors : ::1', 'modulebuilder', '', '', '', '2020-08-21 07:07:16', NULL, NULL, ''),
(168, 'logged in from: ::1', 'users', '', '', '', '2020-08-21 12:08:55', NULL, NULL, ''),
(169, 'Created Module: Meets : ::1', 'modulebuilder', '', '', '', '2020-08-21 12:10:32', NULL, NULL, ''),
(170, 'Created record with ID: 1 : ::1', 'meets', '', '', '', '2020-08-21 12:19:50', NULL, NULL, ''),
(171, 'Created Module: Auths : ::1', 'modulebuilder', '', '', '', '2020-08-21 12:23:13', NULL, NULL, ''),
(172, 'logged in from: ::1', 'users', '', '', '', '2020-08-21 14:12:21', NULL, NULL, ''),
(173, 'logged in from: ::1', 'users', '', '', '', '2020-08-21 14:13:18', NULL, NULL, ''),
(174, 'modified user: voip', 'users', '', '', '', '2020-08-21 14:16:25', NULL, NULL, ''),
(175, 'logged in from: ::1', 'users', '', '', '', '2020-08-21 14:16:40', NULL, NULL, ''),
(176, 'logged in from: ::1', 'users', '', '', '', '2020-08-21 14:21:37', NULL, NULL, ''),
(177, 'logged in from: ::1', 'users', '', '', '', '2020-08-21 19:07:51', NULL, NULL, ''),
(178, 'Deleted 9 activities', 'activities', '', '', '', '2020-08-21 19:16:41', NULL, NULL, ''),
(179, 'Deleted 169 activities', 'activities', '', '', '', '2020-08-21 19:16:47', NULL, NULL, ''),
(180, 'Deleted 1 activities', 'activities', '', '', '', '2020-08-21 19:16:52', NULL, NULL, ''),
(181, 'Deleted 1 activities', 'activities', '', '', '', '2020-08-21 19:16:58', NULL, NULL, ''),
(182, 'Deleted 1 activities', 'activities', '', '', '', '2020-08-21 19:17:02', NULL, NULL, ''),
(183, 'Deleted 1 activities', 'activities', '', '', '', '2020-08-21 19:17:07', NULL, NULL, ''),
(184, 'App settings saved from: ::1', 'core', '', '', '', '2020-08-21 19:25:09', NULL, NULL, ''),
(185, 'logged in from: ::1', 'users', '', '', '', '2020-08-22 07:00:05', NULL, NULL, ''),
(186, 'App settings saved from: ::1', 'core', '', '', '', '2020-08-22 07:04:32', NULL, NULL, ''),
(187, 'logged in from: ::1', 'users', '', '', '', '2020-08-22 12:58:08', NULL, NULL, ''),
(188, 'logged in from: ::1', 'users', '', '', '', '2020-08-22 18:12:57', NULL, NULL, ''),
(189, 'logged in from: ::1', 'users', '', '', '', '2020-08-22 20:34:16', NULL, NULL, ''),
(190, 'logged in from: ::1', 'users', '', '', '', '2020-08-23 09:51:03', NULL, NULL, ''),
(191, 'logged in from: ::1', 'users', '', '', '', '2020-08-31 07:16:57', NULL, NULL, ''),
(192, 'logged in from: ::1', 'users', '', '', '', '2020-09-05 14:18:48', NULL, NULL, ''),
(193, 'Deleted Module: companies : ::1', 'builder', '', '', '', '2020-09-05 14:27:20', NULL, NULL, ''),
(194, 'Created Module: Companies : ::1', 'modulebuilder', '', '', '', '2020-09-05 14:39:41', NULL, NULL, ''),
(195, 'Created record with ID: 1 : ::1', 'companies', '', '', '', '2020-09-05 16:54:19', NULL, NULL, ''),
(196, 'Created record with ID: 2 : ::1', 'companies', '', '', '', '2020-09-05 16:56:27', NULL, NULL, ''),
(197, 'Updated record with ID: 1 : ::1', 'companies', '', '', '', '2020-09-05 17:04:20', NULL, NULL, ''),
(198, 'Updated record with ID: 2 : ::1', 'companies', '', '', '', '2020-09-05 17:04:32', NULL, NULL, ''),
(199, 'Created Module: Test Jit : ::1', 'modulebuilder', '', '', '', '2020-09-05 18:39:48', NULL, NULL, ''),
(200, 'Created record with ID: 1 : ::1', 'test_jit', '', '', '', '2020-09-05 18:46:43', NULL, NULL, ''),
(201, 'Updated record with ID: 1 : ::1', 'test_jit', '', '', '', '2020-09-05 18:47:10', NULL, NULL, ''),
(202, 'logged in from: ::1', 'users', '', '', '', '2020-09-05 20:05:08', NULL, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `bf_addtional_attributes`
--

CREATE TABLE `bf_addtional_attributes` (
  `id` int(11) NOT NULL,
  `attribute_name` varchar(64) DEFAULT NULL,
  `type` varchar(64) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bf_addtional_attribute_values`
--

CREATE TABLE `bf_addtional_attribute_values` (
  `id` int(11) NOT NULL,
  `attribute_id` int(11) DEFAULT NULL,
  `value` varchar(264) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bf_agent_disposition`
--

CREATE TABLE `bf_agent_disposition` (
  `id` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bf_agent_disposition`
--

INSERT INTO `bf_agent_disposition` (`id`, `name`, `deleted`, `deleted_by`, `created_on`, `created_by`, `modified_on`, `modified_by`, `customer_id`) VALUES
(20, 'testsk', 1, NULL, '2020-11-03 17:42:41', NULL, NULL, NULL, 2),
(30, 'hema', 0, NULL, '2020-11-04 13:35:51', NULL, NULL, NULL, 2),
(34, 'last chk', 1, NULL, '2020-11-05 12:16:48', NULL, NULL, NULL, 2),
(35, 'final chk', 0, NULL, '2020-11-05 12:16:58', NULL, NULL, NULL, 2),
(36, 'dfsfd', 1, NULL, '2020-11-05 12:49:00', NULL, NULL, NULL, 2),
(37, 'nice', 0, NULL, '2020-11-05 17:23:09', NULL, NULL, NULL, 2),
(38, 'test final last1', 0, NULL, '2020-11-05 17:25:48', NULL, '2020-11-05 18:25:49', 2, 2),
(39, 'shinde1', 0, NULL, '2020-11-05 18:10:53', 2, '2020-11-05 18:24:42', 2, 2),
(40, 'dfdf', 0, NULL, '2020-11-05 20:50:39', 2, NULL, NULL, 2),
(41, 'vbvb1', 1, NULL, '2020-11-05 20:50:52', 2, '2020-11-05 20:51:06', 2, 2),
(42, 'zx', 0, NULL, '2020-11-05 20:57:15', 2, NULL, NULL, 2),
(43, 'as', 0, NULL, '2020-11-09 16:52:49', 2, NULL, NULL, 2),
(44, 'gggg', 0, NULL, '2020-11-09 16:53:18', 2, '2020-11-09 17:05:15', 2, 2),
(45, 'sdsdsdsd', 0, NULL, '2020-11-12 12:44:28', 2, NULL, NULL, 2),
(46, 'ghgh', 0, NULL, '2020-11-22 23:16:43', 2, NULL, NULL, 2),
(47, 'rtry', 0, NULL, '2020-11-22 23:17:04', 2, NULL, NULL, 2),
(48, 'checking', 0, NULL, '2020-11-22 23:19:00', 2, NULL, NULL, 2),
(49, 'check', 0, NULL, '2020-11-22 23:20:53', 2, NULL, NULL, 2),
(50, 'bgh', 0, NULL, '2020-11-22 23:27:58', 2, NULL, NULL, 2),
(51, 'demo checking class', 0, NULL, '2020-11-22 23:32:23', 2, NULL, NULL, 2),
(52, 'data', 0, NULL, '2020-11-23 12:15:24', 2, NULL, NULL, 2),
(53, 's', 0, NULL, '2020-11-23 12:17:36', 2, NULL, NULL, 2),
(54, 'a', 0, NULL, '2020-11-23 17:42:07', 2, NULL, NULL, 2),
(55, 'sassssssssss', 0, NULL, '2020-11-23 17:56:46', 2, NULL, NULL, 2),
(56, 'testing', 0, NULL, '2020-11-23 18:07:07', 2, NULL, NULL, 2),
(57, 'check de', 0, NULL, '2020-11-23 18:20:38', 2, NULL, NULL, 2),
(58, 'sv', 0, NULL, '2020-11-23 18:24:10', 2, NULL, NULL, 2),
(59, 'oneeeee', 0, NULL, '2020-11-23 18:27:36', 2, '2020-11-23 18:46:23', 2, 2),
(60, 'dfgdfgdgf', 0, NULL, '2020-11-24 10:40:08', 2, NULL, NULL, 2),
(61, 'werwerwerererer', 0, NULL, '2020-11-24 10:42:11', 2, NULL, NULL, 2),
(62, 'new', 0, NULL, '2020-11-24 11:15:42', 2, NULL, NULL, 2),
(63, 'todays test', 0, NULL, '2020-11-24 11:19:07', 2, NULL, NULL, 2),
(64, '3333', 0, NULL, '2020-11-24 11:23:07', 2, NULL, NULL, 2),
(65, 'f', 0, NULL, '2020-11-24 11:34:21', 2, NULL, NULL, 2),
(66, 'ss', 0, NULL, '2020-11-24 11:34:43', 2, NULL, NULL, 2),
(67, 'sdfsdddddddddd', 0, NULL, '2020-11-24 12:32:16', 2, NULL, NULL, 2),
(68, 'asdsadsdasd', 0, NULL, '2020-11-24 12:33:08', 2, '2020-11-24 12:44:35', 2, 2),
(69, 'sadasdasdasdasdasdasdasdasdasdasdasdasdasd', 0, NULL, '2020-11-28 17:12:02', 2, NULL, NULL, 2),
(70, 'hghghghghghghg', 0, NULL, '2020-11-28 17:18:25', 2, NULL, NULL, 2),
(71, 'xxxxzzxzxzxzx', 0, NULL, '2020-11-28 18:01:10', 2, '2020-11-28 18:16:22', 2, 2),
(72, 'sa1234', 0, NULL, '2020-12-09 12:55:46', 2, NULL, NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `bf_agent_sub_disposition`
--

CREATE TABLE `bf_agent_sub_disposition` (
  `id` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `agent_disposition_id` int(11) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bf_agent_sub_disposition`
--

INSERT INTO `bf_agent_sub_disposition` (`id`, `name`, `agent_disposition_id`, `deleted`, `deleted_by`, `created_on`, `created_by`, `modified_on`, `modified_by`, `customer_id`) VALUES
(1, 'demo agent', 1, 0, NULL, '2020-10-31 18:44:34', NULL, NULL, NULL, 2),
(9, 'hs', 0, 0, NULL, '2020-11-02 18:41:31', NULL, NULL, NULL, 2),
(14, 'gh', 15, 0, NULL, '2020-11-03 15:29:27', NULL, NULL, NULL, 2),
(16, 'ddsadsdsd', 20, 1, NULL, '2020-11-03 18:00:17', NULL, NULL, NULL, 2),
(19, 'tertrt', 22, 0, NULL, '2020-11-03 18:50:14', NULL, NULL, NULL, 2),
(20, 'hema test', 23, 0, NULL, '2020-11-03 22:12:50', NULL, NULL, NULL, 2),
(21, 'qw', 20, 0, NULL, '2020-11-04 13:38:56', NULL, NULL, NULL, 2),
(22, 'testing sub', 20, 0, NULL, '2020-11-05 09:54:32', NULL, NULL, NULL, 2),
(23, 'hshinde', 30, 0, NULL, '2020-11-05 10:19:13', NULL, NULL, NULL, 2),
(24, 'qs', 30, 0, NULL, '2020-11-05 10:46:31', NULL, NULL, NULL, 2),
(25, 'jds', 30, 0, NULL, '2020-11-05 10:48:45', NULL, NULL, NULL, 2),
(26, 'ertert', 30, 1, NULL, '2020-11-05 10:50:50', NULL, NULL, NULL, 2),
(27, 'rewrerererrerwerwerwer', 30, 1, NULL, '2020-11-05 10:53:56', NULL, NULL, NULL, 2),
(28, 'rt', 30, 0, NULL, '2020-11-05 11:23:36', NULL, NULL, NULL, 2),
(29, 'dsd', 30, 0, NULL, '2020-11-05 11:27:43', NULL, NULL, NULL, 2),
(30, 'swaeee', 30, 0, NULL, '2020-11-05 11:28:48', NULL, NULL, NULL, 2),
(31, 'aishu', 30, 0, NULL, '2020-11-05 11:31:13', NULL, NULL, NULL, 2),
(32, 'as', 30, 0, NULL, '2020-11-05 11:43:19', NULL, NULL, NULL, 2),
(33, 'hsss', 30, 1, NULL, '2020-11-05 11:56:03', NULL, NULL, NULL, 2),
(34, 'ewrerewrerer', 30, 1, NULL, '2020-11-05 11:57:35', NULL, NULL, NULL, 2),
(35, 'last', 30, 0, NULL, '2020-11-05 12:08:05', NULL, NULL, NULL, 2),
(36, 'rewrer', 30, 0, NULL, '2020-11-05 12:11:02', NULL, NULL, NULL, 2),
(37, 'fdsfsd', 34, 1, NULL, '2020-11-05 12:19:58', NULL, NULL, NULL, 2),
(38, 'demossssh', 35, 0, NULL, '2020-11-05 12:20:16', NULL, NULL, NULL, 2),
(39, 'dwsdwws', 35, 1, NULL, '2020-11-05 12:26:14', NULL, NULL, NULL, 2),
(40, 'kkkk', 30, 1, NULL, '2020-11-05 15:34:28', NULL, NULL, NULL, 2),
(41, 'dasdsd', 37, 0, NULL, '2020-11-05 17:24:21', NULL, NULL, NULL, 2),
(42, 'lasting', 38, 1, NULL, '2020-11-05 17:26:12', NULL, NULL, NULL, 2),
(43, 'sds', 38, 1, NULL, '2020-11-05 17:49:24', NULL, NULL, NULL, 2),
(44, 'check 2', 38, 0, NULL, '2020-11-05 17:59:22', NULL, NULL, NULL, 2),
(45, 'df', 38, 0, NULL, '2020-11-05 18:00:23', NULL, NULL, NULL, 2),
(46, 'chk1', 38, 0, NULL, '2020-11-05 18:03:23', NULL, NULL, NULL, 2),
(47, 's1s', 39, 0, NULL, '2020-11-05 18:12:17', NULL, NULL, NULL, 2),
(48, 's2s demo', 39, 0, NULL, '2020-11-05 18:13:15', NULL, '2020-11-05 08:47:25', 2, 2),
(49, 's231', 39, 0, NULL, '2020-11-05 18:29:48', 2, '2020-11-05 18:32:02', 2, 2),
(50, 'ssssss', 39, 0, NULL, '2020-11-05 18:32:46', 2, NULL, NULL, 2),
(51, '1sdss', 40, 0, NULL, '2020-11-05 20:51:23', 2, '2020-11-05 20:51:46', 2, 2),
(52, 'ererer', 44, 0, NULL, '2020-11-11 12:20:25', 2, NULL, NULL, 2),
(53, 'dddd', 44, 0, NULL, '2020-11-11 12:26:05', 2, NULL, NULL, 2),
(54, 'sss', 44, 0, NULL, '2020-11-11 12:27:19', 2, NULL, NULL, 2),
(55, 'gt', 43, 0, NULL, '2020-11-11 12:28:59', 2, '2020-11-11 12:29:08', 2, 2),
(56, 'new demos', 51, 0, NULL, '2020-11-22 23:35:16', 2, NULL, NULL, 2),
(57, 'new checking sub dispositions', 51, 0, NULL, '2020-11-22 23:38:20', 2, NULL, NULL, 2),
(58, 'aaaa', 59, 0, NULL, '2020-11-23 18:59:40', 2, NULL, NULL, 2),
(59, 'second', 59, 0, NULL, '2020-11-23 19:02:49', 2, NULL, NULL, 2),
(60, 'secondsss', 59, 0, NULL, '2020-11-23 19:03:53', 2, NULL, NULL, 2),
(61, 'test aaa', 68, 0, NULL, '2020-11-24 12:44:58', 2, NULL, NULL, 2),
(62, 'test aaa2', 68, 0, NULL, '2020-11-24 12:45:22', 2, NULL, NULL, 2),
(63, 'last 23', 68, 0, NULL, '2020-11-24 12:47:23', 2, '2020-11-24 12:48:14', 2, 2),
(64, 'xszdsad', 70, 0, NULL, '2020-11-28 17:20:47', 2, '2020-11-28 18:18:58', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `bf_answers`
--

CREATE TABLE `bf_answers` (
  `id` int(11) NOT NULL,
  `answer` varchar(264) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bf_assets`
--

CREATE TABLE `bf_assets` (
  `id` int(11) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `file_name` varchar(100) DEFAULT NULL,
  `file_type` varchar(25) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `full_path` varchar(255) DEFAULT NULL,
  `raw_name` varchar(50) DEFAULT NULL,
  `orig_name` varchar(50) DEFAULT NULL,
  `client_name` varchar(50) DEFAULT NULL,
  `file_ext` varchar(10) DEFAULT NULL,
  `file_size` varchar(25) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `reference_id` varchar(25) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `module` varchar(30) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bf_assets`
--

INSERT INTO `bf_assets` (`id`, `url`, `file_name`, `file_type`, `file_path`, `full_path`, `raw_name`, `orig_name`, `client_name`, `file_ext`, `file_size`, `status`, `reference_id`, `customer_id`, `module`, `deleted`, `deleted_by`, `created_on`, `created_by`, `modified_on`, `modified_by`) VALUES
(1, NULL, '1600763371.png', 'image/png', 'C:/xampp/htdocs/xpertdialer/resources/uploads/2020/09/22/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/2020/09/22/1600763371.png', '1600763371', '1600763371.png', 'screenshot.png', '.png', '15.94', 1, '1', 2, '1', NULL, NULL, NULL, NULL, NULL, NULL),
(2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '1', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL),
(3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '1', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL),
(4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '1', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL),
(5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '1', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL),
(6, NULL, '1600764439.png', 'image/png', 'C:/xampp/htdocs/xpertdialer/resources/uploads/2020/09/22/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/2020/09/22/1600764439.png', '1600764439', '1600764439.png', 'screenshot.png', '.png', '15.94', 1, '1', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL),
(7, NULL, '1600764547.png', 'image/png', 'C:/xampp/htdocs/xpertdialer/resources/uploads/2020/09/22/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/2020/09/22/1600764547.png', '1600764547', '1600764547.png', 'screenshot.png', '.png', '15.94', 1, '1', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL),
(8, NULL, '1600764570.png', 'image/png', 'C:/xampp/htdocs/xpertdialer/resources/uploads/2020/09/22/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/2020/09/22/1600764570.png', '1600764570', '1600764570.png', 'screenshot.png', '.png', '15.94', 1, '1', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL),
(9, NULL, '1600764637.png', 'image/png', 'C:/xampp/htdocs/xpertdialer/resources/uploads/2020/09/22/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/2020/09/22/1600764637.png', '1600764637', '1600764637.png', 'screenshot.png', '.png', '15.94', 1, '1', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL),
(10, NULL, '1600764772.png', 'image/png', 'C:/xampp/htdocs/xpertdialer/resources/uploads/2020/09/22/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/2020/09/22/1600764772.png', '1600764772', '1600764772.png', 'screenshot.png', '.png', '15.94', 1, '1', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL),
(11, NULL, '1600765054.png', 'image/png', 'C:/xampp/htdocs/xpertdialer/resources/uploads/2020/09/22/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/2020/09/22/1600765054.png', '1600765054', '1600765054.png', 'screenshot.png', '.png', '15.94', 1, '1', 2, '1', NULL, NULL, '2020-09-22 10:57:34', 2, NULL, NULL),
(12, NULL, '1600765300.txt', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/2020/09/22/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/2020/09/22/1600765300.txt', '1600765300', '1600765300.txt', 'doc link .txt', '.txt', '0.07', 1, '', 2, '', NULL, NULL, '2020-09-22 11:01:40', 2, NULL, NULL),
(13, NULL, '1600768404.txt', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/2020/09/22/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/2020/09/22/1600768404.txt', '1600768404', '1600768404.txt', 'doc link .txt', '.txt', '0.07', 1, '', 2, '', NULL, NULL, '2020-09-22 11:53:24', 2, NULL, NULL),
(14, NULL, 'cb1bfbd91ab375e5eae18e44c4c77bbb.txt', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/2020/09/22/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/2020/09/22/cb1bfbd91ab375e5eae18e44c4c77bbb.txt', 'cb1bfbd91ab375e5eae18e44c4c77bbb', 'cb1bfbd91ab375e5eae18e44c4c77bbb.txt', 'doc link .txt', '.txt', '0.07', 1, '', 2, '', NULL, NULL, '2020-09-22 11:57:58', 2, NULL, NULL),
(15, NULL, '05b5a14c70a02ee1e1caf4a047e45b9e.txt', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/2020/09/22/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/2020/09/22/05b5a14c70a02ee1e1caf4a047e45b9e.txt', '05b5a14c70a02ee1e1caf4a047e45b9e', '05b5a14c70a02ee1e1caf4a047e45b9e.txt', 'doc link .txt', '.txt', '0.07', 1, '', 2, '', NULL, NULL, '2020-09-22 11:58:51', 2, NULL, NULL),
(16, NULL, '2b5de4cc2e1c4c2e16bc297f15dc2059.txt', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/2020/09/22/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/2020/09/22/2b5de4cc2e1c4c2e16bc297f15dc2059.txt', '2b5de4cc2e1c4c2e16bc297f15dc2059', '2b5de4cc2e1c4c2e16bc297f15dc2059.txt', 'doc link .txt', '.txt', '0.07', 1, '', 2, '', NULL, NULL, '2020-09-22 12:00:00', 2, NULL, NULL),
(17, 'http://localhost/xpertdialer//resources/uploads/2020/09/22597dd83b6ae1acc8f789b15383748aa3.txt', '597dd83b6ae1acc8f789b15383748aa3.txt', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/2020/09/22/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/2020/09/22/597dd83b6ae1acc8f789b15383748aa3.txt', '597dd83b6ae1acc8f789b15383748aa3', '597dd83b6ae1acc8f789b15383748aa3.txt', 'doc link .txt', '.txt', '0.07', 1, '', 2, '', NULL, NULL, '2020-09-22 12:00:32', 2, NULL, NULL),
(18, 'http://localhost/xpertdialer//resources/uploads/2020/09/22/6fd4bad255ad44554396998b9d1006a9.txt', '6fd4bad255ad44554396998b9d1006a9.txt', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/2020/09/22/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/2020/09/22/6fd4bad255ad44554396998b9d1006a9.txt', '6fd4bad255ad44554396998b9d1006a9', '6fd4bad255ad44554396998b9d1006a9.txt', 'doc link .txt', '.txt', '0.07', 1, '', 2, '', NULL, NULL, '2020-09-22 12:06:08', 2, NULL, NULL),
(19, 'http://localhost/xpertdialer//resources/uploads/Campaign/2020/09/22/5043d3ee2b925de366700476cebeb0ac.txt', '5043d3ee2b925de366700476cebeb0ac.txt', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Campaign/2020/09/22/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Campaign/2020/09/22/5043d3ee2b925de366700476cebeb0ac.txt', '5043d3ee2b925de366700476cebeb0ac', '5043d3ee2b925de366700476cebeb0ac.txt', 'doc link .txt', '.txt', '0.07', 1, 'Campaign', 2, '1', NULL, NULL, '2020-09-22 12:15:16', 2, NULL, NULL),
(20, 'http://localhost/xpertdialer//resources/uploads/Campaign/2020/09/22/b20a596bf545584ac2b2f5856457b2bb.xlsx', 'b20a596bf545584ac2b2f5856457b2bb.xlsx', 'application/vnd.openxmlfo', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Campaign/2020/09/22/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Campaign/2020/09/22/b20a596bf545584ac2b2f5856457b2bb.xlsx', 'b20a596bf545584ac2b2f5856457b2bb', 'b20a596bf545584ac2b2f5856457b2bb.xlsx', 'kamal ji  requirement sheet.xlsx', '.xlsx', '9.41', 1, 'Campaign', 2, '6', NULL, NULL, '2020-09-22 20:06:53', 2, NULL, NULL),
(21, 'http://localhost/xpertdialer//resources/uploads/Campaign/2020/09/22/76f04e1442eaad3584d53cfc48a8f0ab.png', '76f04e1442eaad3584d53cfc48a8f0ab.png', 'image/png', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Campaign/2020/09/22/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Campaign/2020/09/22/76f04e1442eaad3584d53cfc48a8f0ab.png', '76f04e1442eaad3584d53cfc48a8f0ab', '76f04e1442eaad3584d53cfc48a8f0ab.png', 'screenshot.png', '.png', '15.94', 1, 'Campaign', 2, '6', NULL, NULL, '2020-09-22 20:07:03', 2, NULL, NULL),
(22, 'http://localhost/xpertdialer//resources/uploads/Campaign/2020/09/24/2e959a10639151656810506d49b2a2b9.png', '2e959a10639151656810506d49b2a2b9.png', 'image/png', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Campaign/2020/09/24/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Campaign/2020/09/24/2e959a10639151656810506d49b2a2b9.png', '2e959a10639151656810506d49b2a2b9', '2e959a10639151656810506d49b2a2b9.png', 'screenshot.png', '.png', '15.94', 1, 'Campaign', 2, '1', NULL, NULL, '2020-09-24 14:13:14', 2, NULL, NULL),
(26, 'http://localhost/xpertdialer//resources/uploads/Campaign/2020/09/26/d2f254d1c2963e8ce7553e144c6f8ddf.png', 'd2f254d1c2963e8ce7553e144c6f8ddf.png', 'image/png', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Campaign/2020/09/26/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Campaign/2020/09/26/d2f254d1c2963e8ce7553e144c6f8ddf.png', 'd2f254d1c2963e8ce7553e144c6f8ddf', 'd2f254d1c2963e8ce7553e144c6f8ddf.png', 'error123.png', '.png', '69.41', 1, '5', 2, 'Campaign', NULL, NULL, '2020-09-26 19:21:24', 2, NULL, NULL),
(27, 'http://localhost/xpertdialer//resources/uploads/Campaign/2020/09/26/1be467fd4e0b886740c78faf6ec24609.pdf', '1be467fd4e0b886740c78faf6ec24609.pdf', 'application/pdf', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Campaign/2020/09/26/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Campaign/2020/09/26/1be467fd4e0b886740c78faf6ec24609.pdf', '1be467fd4e0b886740c78faf6ec24609', '1be467fd4e0b886740c78faf6ec24609.pdf', 'Uttar Pradesh Power Corporation Ltd_ - PAYMENT.pdf', '.pdf', '93.5', 1, '5', 2, 'Campaign', NULL, NULL, '2020-09-26 19:25:44', 2, NULL, NULL),
(28, 'http://localhost/xpertdialer//resources/uploads/Campaign/2020/09/26/e653be966e74f5c56230bfcc94939abe.png', 'e653be966e74f5c56230bfcc94939abe.png', 'image/png', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Campaign/2020/09/26/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Campaign/2020/09/26/e653be966e74f5c56230bfcc94939abe.png', 'e653be966e74f5c56230bfcc94939abe', 'e653be966e74f5c56230bfcc94939abe.png', 'error1234.png', '.png', '99.91', 1, '5', 2, 'Campaign', NULL, NULL, '2020-09-26 19:31:01', 2, NULL, NULL),
(31, 'http://localhost/xpertdialer//resources/uploads/Campaign/2020/09/26/a5d10c31b709d839e68833d78ae5a93d.png', 'a5d10c31b709d839e68833d78ae5a93d.png', 'image/png', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Campaign/2020/09/26/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Campaign/2020/09/26/a5d10c31b709d839e68833d78ae5a93d.png', 'a5d10c31b709d839e68833d78ae5a93d', 'a5d10c31b709d839e68833d78ae5a93d.png', 'screenshot.png', '.png', '15.94', 1, '5', 2, 'Campaign', NULL, NULL, '2020-09-26 19:31:23', 2, NULL, NULL),
(32, 'http://localhost/xpertdialer//resources/uploads/Campaign/2020/09/27/d0641354c695feeec084a94996bae9e7.png', 'd0641354c695feeec084a94996bae9e7.png', 'image/png', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Campaign/2020/09/27/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Campaign/2020/09/27/d0641354c695feeec084a94996bae9e7.png', 'd0641354c695feeec084a94996bae9e7', 'd0641354c695feeec084a94996bae9e7.png', 'screenshot.png', '.png', '15.94', 1, '1', 2, 'Campaign', NULL, NULL, '2020-09-27 06:02:34', 2, NULL, NULL),
(33, 'http://localhost/xpertdialer//resources/uploads/Campaign/2020/09/27/fcf97a8f284a4226ae6ae3d3d721c7a2.png', 'fcf97a8f284a4226ae6ae3d3d721c7a2.png', 'image/png', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Campaign/2020/09/27/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Campaign/2020/09/27/fcf97a8f284a4226ae6ae3d3d721c7a2.png', 'fcf97a8f284a4226ae6ae3d3d721c7a2', 'fcf97a8f284a4226ae6ae3d3d721c7a2.png', 'screenshot.png', '.png', '15.94', 1, '1', 2, 'Campaign', NULL, NULL, '2020-09-27 13:24:46', 2, NULL, NULL),
(35, 'http://localhost/xpertdialer//resources/uploads/Campaign/2020/09/28/fdd649b201f30bcb26fe9315a168a472.png', 'fdd649b201f30bcb26fe9315a168a472.png', 'image/png', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Campaign/2020/09/28/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Campaign/2020/09/28/fdd649b201f30bcb26fe9315a168a472.png', 'fdd649b201f30bcb26fe9315a168a472', 'fdd649b201f30bcb26fe9315a168a472.png', 'error123.png', '.png', '69.41', 1, '6', 2, 'Campaign', NULL, NULL, '2020-09-28 18:27:27', 2, NULL, NULL),
(36, 'http://localhost/xpertdialer//resources/uploads/Campaign/2020/09/28/112dd81f5ce511c9ad126538c9e295fb.png', '112dd81f5ce511c9ad126538c9e295fb.png', 'image/png', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Campaign/2020/09/28/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Campaign/2020/09/28/112dd81f5ce511c9ad126538c9e295fb.png', '112dd81f5ce511c9ad126538c9e295fb', '112dd81f5ce511c9ad126538c9e295fb.png', 'error123.png', '.png', '69.41', 1, '2', 2, 'Campaign', NULL, NULL, '2020-09-28 19:06:38', 2, NULL, NULL),
(37, 'http://localhost/xpertdialer//resources/uploads/Campaign/2020/10/01/6d411f4bf7c76de8df1c46fa178942fb.png', '6d411f4bf7c76de8df1c46fa178942fb.png', 'image/png', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Campaign/2020/10/01/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Campaign/2020/10/01/6d411f4bf7c76de8df1c46fa178942fb.png', '6d411f4bf7c76de8df1c46fa178942fb', '6d411f4bf7c76de8df1c46fa178942fb.png', 'error1234.png', '.png', '99.91', 1, '5', 2, 'Campaign', NULL, NULL, '2020-10-01 00:36:49', 2, NULL, NULL),
(38, 'http://localhost/xpertdialer//resources/uploads/Campaign/2020/10/02/614bd9b0452ffd06b6900e8c96c489ee.png', '614bd9b0452ffd06b6900e8c96c489ee.png', 'image/png', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Campaign/2020/10/02/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Campaign/2020/10/02/614bd9b0452ffd06b6900e8c96c489ee.png', '614bd9b0452ffd06b6900e8c96c489ee', '614bd9b0452ffd06b6900e8c96c489ee.png', 'error1234.png', '.png', '99.91', 1, '5', 2, 'Campaign', NULL, NULL, '2020-10-02 08:19:19', 2, NULL, NULL),
(39, 'http://localhost/xpertdialer//resources/uploads/Campaign/2020/10/02/29fe8a7acb33ddfe88928fa927ba3cdd.png', '29fe8a7acb33ddfe88928fa927ba3cdd.png', 'image/png', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Campaign/2020/10/02/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Campaign/2020/10/02/29fe8a7acb33ddfe88928fa927ba3cdd.png', '29fe8a7acb33ddfe88928fa927ba3cdd', '29fe8a7acb33ddfe88928fa927ba3cdd.png', 'error1234.png', '.png', '99.91', 1, '5', 2, 'Campaign', NULL, NULL, '2020-10-02 08:19:24', 2, NULL, NULL),
(40, 'http://localhost/xpertdialer//resources/uploads/Campaign/2020/10/02/397a45ae14343e5e95f59dee931fba52.png', '397a45ae14343e5e95f59dee931fba52.png', 'image/png', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Campaign/2020/10/02/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Campaign/2020/10/02/397a45ae14343e5e95f59dee931fba52.png', '397a45ae14343e5e95f59dee931fba52', '397a45ae14343e5e95f59dee931fba52.png', 'screenshot.png', '.png', '15.94', 1, '1', 2, 'Campaign', NULL, NULL, '2020-10-02 20:52:03', 2, NULL, NULL),
(41, 'http://localhost/xpertdialer//resources/uploads/Suppression/2020/10/03/ca8e6a25a6b6ecc2f56ddece68568b06.txt', 'ca8e6a25a6b6ecc2f56ddece68568b06.txt', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/03/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/03/ca8e6a25a6b6ecc2f56ddece68568b06.txt', 'ca8e6a25a6b6ecc2f56ddece68568b06', 'ca8e6a25a6b6ecc2f56ddece68568b06.txt', 'asterisk.txt', '.txt', '2.1', 1, '5', 2, 'Suppression', NULL, NULL, '2020-10-03 19:14:13', 2, NULL, NULL),
(42, 'http://localhost/xpertdialer//resources/uploads/Suppression/2020/10/03/5d405e716af6127fe5423c2a6925922d.txt', '5d405e716af6127fe5423c2a6925922d.txt', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/03/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/03/5d405e716af6127fe5423c2a6925922d.txt', '5d405e716af6127fe5423c2a6925922d', '5d405e716af6127fe5423c2a6925922d.txt', 'asterisk.txt', '.txt', '2.1', 1, '5', 2, 'Suppression', NULL, NULL, '2020-10-03 19:53:00', 2, NULL, NULL),
(43, 'http://localhost/xpertdialer//resources/uploads/Suppression/2020/10/03/689f73c6593a54e84795a58ca301670b.csv', '689f73c6593a54e84795a58ca301670b.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/03/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/03/689f73c6593a54e84795a58ca301670b.csv', '689f73c6593a54e84795a58ca301670b', '689f73c6593a54e84795a58ca301670b.csv', 'test.csv', '.csv', '36.1', 1, '5', 2, 'Suppression', NULL, NULL, '2020-10-03 22:00:50', 2, NULL, NULL),
(44, 'http://localhost/xpertdialer//resources/uploads/Suppression/2020/10/03/75dde4d3193e75b875c34d68f1f33a0b.csv', '75dde4d3193e75b875c34d68f1f33a0b.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/03/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/03/75dde4d3193e75b875c34d68f1f33a0b.csv', '75dde4d3193e75b875c34d68f1f33a0b', '75dde4d3193e75b875c34d68f1f33a0b.csv', 'test.csv', '.csv', '36.1', 1, '5', 2, 'Suppression', NULL, NULL, '2020-10-03 22:02:14', 2, NULL, NULL),
(45, 'http://localhost/xpertdialer//resources/uploads/Campaign/2020/10/03/572b502ae14ed3b45115110789d4d732.csv', '572b502ae14ed3b45115110789d4d732.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Campaign/2020/10/03/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Campaign/2020/10/03/572b502ae14ed3b45115110789d4d732.csv', '572b502ae14ed3b45115110789d4d732', '572b502ae14ed3b45115110789d4d732.csv', 'test.csv', '.csv', '36.1', 1, '5', 2, 'Campaign', NULL, NULL, '2020-10-03 22:04:57', 2, NULL, NULL),
(46, 'http://localhost/xpertdialer//resources/uploads/Suppression/2020/10/03/b603ac097a53ade32fafe6df6d762683.csv', 'b603ac097a53ade32fafe6df6d762683.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/03/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/03/b603ac097a53ade32fafe6df6d762683.csv', 'b603ac097a53ade32fafe6df6d762683', 'b603ac097a53ade32fafe6df6d762683.csv', 'test.csv', '.csv', '36.1', 1, '5', 2, 'Suppression', NULL, NULL, '2020-10-03 22:05:30', 2, NULL, NULL),
(47, 'http://localhost/xpertdialer//resources/uploads/Suppression/2020/10/03/1ec33b91c377aa12b5363c76e9f8eb0c.csv', '1ec33b91c377aa12b5363c76e9f8eb0c.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/03/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/03/1ec33b91c377aa12b5363c76e9f8eb0c.csv', '1ec33b91c377aa12b5363c76e9f8eb0c', '1ec33b91c377aa12b5363c76e9f8eb0c.csv', 'test.csv', '.csv', '36.1', 1, '5', 2, 'Suppression', NULL, NULL, '2020-10-03 22:05:48', 2, NULL, NULL),
(48, 'http://localhost/xpertdialer//resources/uploads/Suppression/2020/10/03/fd03941cbe24ed7332187edacc5237b5.csv', 'fd03941cbe24ed7332187edacc5237b5.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/03/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/03/fd03941cbe24ed7332187edacc5237b5.csv', 'fd03941cbe24ed7332187edacc5237b5', 'fd03941cbe24ed7332187edacc5237b5.csv', 'test.csv', '.csv', '36.1', 1, '5', 2, 'Suppression', NULL, NULL, '2020-10-03 22:13:06', 2, NULL, NULL),
(49, 'http://localhost/xpertdialer//resources/uploads/Suppression/2020/10/03/62924979b348400ab07973efcf031d80.csv', '62924979b348400ab07973efcf031d80.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/03/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/03/62924979b348400ab07973efcf031d80.csv', '62924979b348400ab07973efcf031d80', '62924979b348400ab07973efcf031d80.csv', 'test.csv', '.csv', '36.1', 1, '5', 2, 'Suppression', NULL, NULL, '2020-10-03 22:14:39', 2, NULL, NULL),
(50, 'http://localhost/xpertdialer//resources/uploads/Suppression/2020/10/03/daef24fba2f702707686813801ecc39e.csv', 'daef24fba2f702707686813801ecc39e.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/03/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/03/daef24fba2f702707686813801ecc39e.csv', 'daef24fba2f702707686813801ecc39e', 'daef24fba2f702707686813801ecc39e.csv', 'test.csv', '.csv', '36.1', 1, '5', 2, 'Suppression', NULL, NULL, '2020-10-03 22:30:44', 2, NULL, NULL),
(51, 'http://localhost/xpertdialer//resources/uploads/Suppression/2020/10/03/ac40791ebb895172ab2d39ad85955e7b.csv', 'ac40791ebb895172ab2d39ad85955e7b.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/03/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/03/ac40791ebb895172ab2d39ad85955e7b.csv', 'ac40791ebb895172ab2d39ad85955e7b', 'ac40791ebb895172ab2d39ad85955e7b.csv', 'test.csv', '.csv', '36.1', 1, '5', 2, 'Suppression', NULL, NULL, '2020-10-03 22:31:32', 2, NULL, NULL),
(52, 'http://localhost/xpertdialer//resources/uploads/Suppression/2020/10/03/08978fd197d2c9ebd349f21f6a42df90.csv', '08978fd197d2c9ebd349f21f6a42df90.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/03/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/03/08978fd197d2c9ebd349f21f6a42df90.csv', '08978fd197d2c9ebd349f21f6a42df90', '08978fd197d2c9ebd349f21f6a42df90.csv', 'test.csv', '.csv', '36.1', 1, '5', 2, 'Suppression', NULL, NULL, '2020-10-03 22:33:38', 2, NULL, NULL),
(53, 'http://localhost/xpertdialer//resources/uploads/Suppression/2020/10/03/1ec3e77ac2a12f77e3de9250ef49e8c7.csv', '1ec3e77ac2a12f77e3de9250ef49e8c7.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/03/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/03/1ec3e77ac2a12f77e3de9250ef49e8c7.csv', '1ec3e77ac2a12f77e3de9250ef49e8c7', '1ec3e77ac2a12f77e3de9250ef49e8c7.csv', 'test.csv', '.csv', '36.1', 1, '5', 2, 'Suppression', NULL, NULL, '2020-10-03 22:34:01', 2, NULL, NULL),
(54, 'http://localhost/xpertdialer//resources/uploads/Suppression/2020/10/03/1a5c169a051bb7fa90fca8b1dd4677da.csv', '1a5c169a051bb7fa90fca8b1dd4677da.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/03/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/03/1a5c169a051bb7fa90fca8b1dd4677da.csv', '1a5c169a051bb7fa90fca8b1dd4677da', '1a5c169a051bb7fa90fca8b1dd4677da.csv', 'test.csv', '.csv', '36.1', 1, '5', 2, 'Suppression', NULL, NULL, '2020-10-03 22:35:12', 2, NULL, NULL),
(55, 'http://localhost/xpertdialer//resources/uploads/Suppression/2020/10/03/302007f032e2c3849787dff559c2653e.csv', '302007f032e2c3849787dff559c2653e.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/03/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/03/302007f032e2c3849787dff559c2653e.csv', '302007f032e2c3849787dff559c2653e', '302007f032e2c3849787dff559c2653e.csv', 'test.csv', '.csv', '36.1', 1, '5', 2, 'Suppression', NULL, NULL, '2020-10-03 22:35:36', 2, NULL, NULL),
(56, 'http://localhost/xpertdialer//resources/uploads/Suppression/2020/10/03/d2bcb90d733fa8367a0eebd74147d1c7.csv', 'd2bcb90d733fa8367a0eebd74147d1c7.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/03/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/03/d2bcb90d733fa8367a0eebd74147d1c7.csv', 'd2bcb90d733fa8367a0eebd74147d1c7', 'd2bcb90d733fa8367a0eebd74147d1c7.csv', 'test.csv', '.csv', '36.1', 1, '5', 2, 'Suppression', NULL, NULL, '2020-10-03 22:46:01', 2, NULL, NULL),
(57, 'http://localhost/xpertdialer//resources/uploads/Suppression/2020/10/03/8d7a9570bc46b9335c9047721cac06a2.csv', '8d7a9570bc46b9335c9047721cac06a2.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/03/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/03/8d7a9570bc46b9335c9047721cac06a2.csv', '8d7a9570bc46b9335c9047721cac06a2', '8d7a9570bc46b9335c9047721cac06a2.csv', 'test.csv', '.csv', '1530.09', 1, '5', 2, 'Suppression', NULL, NULL, '2020-10-03 22:52:59', 2, NULL, NULL),
(58, 'http://localhost/xpertdialer//resources/uploads/Suppression/2020/10/03/7fcf25dc0267c7fd3b0010848aa305dd.csv', '7fcf25dc0267c7fd3b0010848aa305dd.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/03/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/03/7fcf25dc0267c7fd3b0010848aa305dd.csv', '7fcf25dc0267c7fd3b0010848aa305dd', '7fcf25dc0267c7fd3b0010848aa305dd.csv', 'test.csv', '.csv', '1530.09', 1, '5', 2, 'Suppression', NULL, NULL, '2020-10-03 22:56:38', 2, NULL, NULL),
(59, 'http://localhost/xpertdialer//resources/uploads/Suppression/2020/10/03/c8a6b97f62575c7fa4e9253a52a542c6.csv', 'c8a6b97f62575c7fa4e9253a52a542c6.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/03/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/03/c8a6b97f62575c7fa4e9253a52a542c6.csv', 'c8a6b97f62575c7fa4e9253a52a542c6', 'c8a6b97f62575c7fa4e9253a52a542c6.csv', 'test.csv', '.csv', '1530.09', 1, '5', 2, 'Suppression', NULL, NULL, '2020-10-03 22:59:57', 2, NULL, NULL),
(60, 'http://localhost/xpertdialer//resources/uploads/Suppression/2020/10/03/2a8d83c086685dcb22def0ae4533df6b.csv', '2a8d83c086685dcb22def0ae4533df6b.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/03/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/03/2a8d83c086685dcb22def0ae4533df6b.csv', '2a8d83c086685dcb22def0ae4533df6b', '2a8d83c086685dcb22def0ae4533df6b.csv', 'test.csv', '.csv', '1530.09', 1, '5', 2, 'Suppression', NULL, NULL, '2020-10-03 23:01:10', 2, NULL, NULL),
(61, 'http://localhost/xpertdialer//resources/uploads/Suppression/2020/10/03/ff71a00b6270151e82ccaa3d677bd9bd.csv', 'ff71a00b6270151e82ccaa3d677bd9bd.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/03/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/03/ff71a00b6270151e82ccaa3d677bd9bd.csv', 'ff71a00b6270151e82ccaa3d677bd9bd', 'ff71a00b6270151e82ccaa3d677bd9bd.csv', 'test.csv', '.csv', '1530.09', 1, '5', 2, 'Suppression', NULL, NULL, '2020-10-03 23:01:35', 2, NULL, NULL),
(62, 'http://localhost/xpertdialer//resources/uploads/Suppression/2020/10/03/7085c5fadfb14e66df96af73d71a7f77.csv', '7085c5fadfb14e66df96af73d71a7f77.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/03/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/03/7085c5fadfb14e66df96af73d71a7f77.csv', '7085c5fadfb14e66df96af73d71a7f77', '7085c5fadfb14e66df96af73d71a7f77.csv', 'test.csv', '.csv', '1530.09', 1, '5', 2, 'Suppression', NULL, NULL, '2020-10-03 23:02:31', 2, NULL, NULL),
(63, 'http://localhost/xpertdialer//resources/uploads/Suppression/2020/10/03/4d102b798a85f0d887da2a5519d6fdcd.csv', '4d102b798a85f0d887da2a5519d6fdcd.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/03/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/03/4d102b798a85f0d887da2a5519d6fdcd.csv', '4d102b798a85f0d887da2a5519d6fdcd', '4d102b798a85f0d887da2a5519d6fdcd.csv', 'test.csv', '.csv', '1530.09', 1, '5', 2, 'Suppression', NULL, NULL, '2020-10-03 23:03:39', 2, NULL, NULL),
(64, 'http://localhost/xpertdialer//resources/uploads/Suppression/2020/10/03/9e8b7b9c8dcff565ea5db7ab2bd4ae49.csv', '9e8b7b9c8dcff565ea5db7ab2bd4ae49.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/03/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/03/9e8b7b9c8dcff565ea5db7ab2bd4ae49.csv', '9e8b7b9c8dcff565ea5db7ab2bd4ae49', '9e8b7b9c8dcff565ea5db7ab2bd4ae49.csv', 'test.csv', '.csv', '1530.09', 1, '5', 2, 'Suppression', NULL, NULL, '2020-10-03 23:04:02', 2, NULL, NULL),
(65, 'http://localhost/xpertdialer//resources/uploads/Suppression/2020/10/03/05159a45997936e07f3ca42f8cce2891.csv', '05159a45997936e07f3ca42f8cce2891.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/03/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/03/05159a45997936e07f3ca42f8cce2891.csv', '05159a45997936e07f3ca42f8cce2891', '05159a45997936e07f3ca42f8cce2891.csv', 'test.csv', '.csv', '1530.09', 1, '5', 2, 'Suppression', NULL, NULL, '2020-10-03 23:04:42', 2, NULL, NULL),
(66, 'http://localhost/xpertdialer//resources/uploads/Suppression/2020/10/03/124bc40833cc6cae1b6fbf806dcf3333.csv', '124bc40833cc6cae1b6fbf806dcf3333.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/03/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/03/124bc40833cc6cae1b6fbf806dcf3333.csv', '124bc40833cc6cae1b6fbf806dcf3333', '124bc40833cc6cae1b6fbf806dcf3333.csv', 'test - Copy.csv', '.csv', '19080.41', 1, '5', 2, 'Suppression', NULL, NULL, '2020-10-03 23:18:04', 2, NULL, NULL),
(67, 'http://localhost/xpertdialer//resources/uploads/Suppression/2020/10/04/4e4175da4fae402167b8a5a0de025182.csv', '4e4175da4fae402167b8a5a0de025182.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/04/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/04/4e4175da4fae402167b8a5a0de025182.csv', '4e4175da4fae402167b8a5a0de025182', '4e4175da4fae402167b8a5a0de025182.csv', 'test - Copy.csv', '.csv', '19080.41', 1, '5', 2, 'Suppression', NULL, NULL, '2020-10-04 00:10:51', 2, NULL, NULL),
(68, 'http://localhost/xpertdialer//resources/uploads/Suppression/2020/10/04/1afdce05eaecf0f2177e24e2ffc29909.csv', '1afdce05eaecf0f2177e24e2ffc29909.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/04/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/04/1afdce05eaecf0f2177e24e2ffc29909.csv', '1afdce05eaecf0f2177e24e2ffc29909', '1afdce05eaecf0f2177e24e2ffc29909.csv', 'test - Copy.csv', '.csv', '19080.41', 1, '5', 2, 'Suppression', NULL, NULL, '2020-10-04 00:12:44', 2, NULL, NULL),
(69, 'http://localhost/xpertdialer//resources/uploads/Suppression/2020/10/04/5b898cfe7d93417d60dfdbfa28d57d53.csv', '5b898cfe7d93417d60dfdbfa28d57d53.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/04/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/04/5b898cfe7d93417d60dfdbfa28d57d53.csv', '5b898cfe7d93417d60dfdbfa28d57d53', '5b898cfe7d93417d60dfdbfa28d57d53.csv', 'test - Copy.csv', '.csv', '19080.41', 1, '5', 2, 'Suppression', NULL, NULL, '2020-10-04 00:16:58', 2, NULL, NULL),
(70, 'http://localhost/xpertdialer//resources/uploads/Suppression/2020/10/04/adf71da026331a5bd61b04d0a8904b22.csv', 'adf71da026331a5bd61b04d0a8904b22.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/04/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/04/adf71da026331a5bd61b04d0a8904b22.csv', 'adf71da026331a5bd61b04d0a8904b22', 'adf71da026331a5bd61b04d0a8904b22.csv', 'test - Copy.csv', '.csv', '19080.41', 1, '5', 2, 'Suppression', NULL, NULL, '2020-10-04 00:48:49', 2, NULL, NULL),
(71, 'http://localhost/xpertdialer//resources/uploads/Suppression/2020/10/04/4b8463268dade004a0bd099a1d9a427b.csv', '4b8463268dade004a0bd099a1d9a427b.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/04/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/04/4b8463268dade004a0bd099a1d9a427b.csv', '4b8463268dade004a0bd099a1d9a427b', '4b8463268dade004a0bd099a1d9a427b.csv', 'test - Copy.csv', '.csv', '19080.41', 1, '5', 2, 'Suppression', NULL, NULL, '2020-10-04 00:49:37', 2, NULL, NULL),
(72, 'http://localhost/xpertdialer//resources/uploads/Suppression/2020/10/04/ec14d9cd7a3a8138f70834ecadfcd9b7.csv', 'ec14d9cd7a3a8138f70834ecadfcd9b7.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/04/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/04/ec14d9cd7a3a8138f70834ecadfcd9b7.csv', 'ec14d9cd7a3a8138f70834ecadfcd9b7', 'ec14d9cd7a3a8138f70834ecadfcd9b7.csv', 'test - Copy.csv', '.csv', '19080.41', 1, '5', 2, 'Suppression', NULL, NULL, '2020-10-04 00:51:08', 2, NULL, NULL),
(73, 'http://localhost/xpertdialer//resources/uploads/Suppression/2020/10/04/123336e27e86f3e7ad1bede90bc2b0cf.csv', '123336e27e86f3e7ad1bede90bc2b0cf.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/04/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/04/123336e27e86f3e7ad1bede90bc2b0cf.csv', '123336e27e86f3e7ad1bede90bc2b0cf', '123336e27e86f3e7ad1bede90bc2b0cf.csv', 'test - Copy.csv', '.csv', '0.48', 1, '5', 2, 'Suppression', NULL, NULL, '2020-10-04 01:21:53', 2, NULL, NULL),
(74, 'http://localhost/xpertdialer//resources/uploads/Suppression/2020/10/04/864718c71aae05d0afb9241de57f727f.csv', '864718c71aae05d0afb9241de57f727f.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/04/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/04/864718c71aae05d0afb9241de57f727f.csv', '864718c71aae05d0afb9241de57f727f', '864718c71aae05d0afb9241de57f727f.csv', 'test - Copy.csv', '.csv', '0.48', 1, '5', 2, 'Suppression', NULL, NULL, '2020-10-04 01:22:01', 2, NULL, NULL),
(75, 'http://localhost/xpertdialer//resources/uploads/Suppression/2020/10/04/bea23c144ca0a566467e11e643b5f6bb.csv', 'bea23c144ca0a566467e11e643b5f6bb.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/04/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/04/bea23c144ca0a566467e11e643b5f6bb.csv', 'bea23c144ca0a566467e11e643b5f6bb', 'bea23c144ca0a566467e11e643b5f6bb.csv', 'test - Copy.csv', '.csv', '0.48', 1, '5', 2, 'Suppression', NULL, NULL, '2020-10-04 01:24:28', 2, NULL, NULL),
(76, 'http://localhost/xpertdialer//resources/uploads/Suppression/2020/10/04/536795e6860ce2fa5cda3cb6c9e13e02.csv', '536795e6860ce2fa5cda3cb6c9e13e02.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/04/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/04/536795e6860ce2fa5cda3cb6c9e13e02.csv', '536795e6860ce2fa5cda3cb6c9e13e02', '536795e6860ce2fa5cda3cb6c9e13e02.csv', 'test - Copy.csv', '.csv', '0.48', 1, '5', 2, 'Suppression', NULL, NULL, '2020-10-04 01:26:40', 2, NULL, NULL),
(77, 'http://localhost/xpertdialer//resources/uploads/Suppression/2020/10/04/8daf82f9efcc6067b68714e4dfde03fa.csv', '8daf82f9efcc6067b68714e4dfde03fa.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/04/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/04/8daf82f9efcc6067b68714e4dfde03fa.csv', '8daf82f9efcc6067b68714e4dfde03fa', '8daf82f9efcc6067b68714e4dfde03fa.csv', 'test - Copy.csv', '.csv', '0.48', 1, '5', 2, 'Suppression', NULL, NULL, '2020-10-04 01:29:42', 2, NULL, NULL),
(78, 'http://localhost/xpertdialer//resources/uploads/Suppression/2020/10/04/0aaa61a0761617542e3c4e53a26ea996.csv', '0aaa61a0761617542e3c4e53a26ea996.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/04/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/04/0aaa61a0761617542e3c4e53a26ea996.csv', '0aaa61a0761617542e3c4e53a26ea996', '0aaa61a0761617542e3c4e53a26ea996.csv', 'test - Copy.csv', '.csv', '0.48', 1, '5', 2, 'Suppression', NULL, NULL, '2020-10-04 01:30:18', 2, NULL, NULL),
(80, 'http://localhost/xpertdialer//resources/uploads/Suppression/2020/10/04/257765b9020d953a0acf1f66495c11c2.csv', '257765b9020d953a0acf1f66495c11c2.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/04/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/04/257765b9020d953a0acf1f66495c11c2.csv', '257765b9020d953a0acf1f66495c11c2', '257765b9020d953a0acf1f66495c11c2.csv', 'test - Copy.csv', '.csv', '0.48', 1, '5', 2, 'Suppression', NULL, NULL, '2020-10-04 01:32:33', 2, NULL, NULL),
(81, 'http://localhost/xpertdialer//resources/uploads/Suppression/2020/10/04/3d5a5073981ec526784cd14332444da5.csv', '3d5a5073981ec526784cd14332444da5.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/04/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/04/3d5a5073981ec526784cd14332444da5.csv', '3d5a5073981ec526784cd14332444da5', '3d5a5073981ec526784cd14332444da5.csv', 'test - Copy.csv', '.csv', '0.48', 1, '5', 2, 'Suppression', NULL, NULL, '2020-10-04 01:33:34', 2, NULL, NULL),
(83, 'http://localhost/xpertdialer//resources/uploads/Suppression/2020/10/04/19b188bc7f4b8ad53ade07862c98bd2f.csv', '19b188bc7f4b8ad53ade07862c98bd2f.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/04/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/04/19b188bc7f4b8ad53ade07862c98bd2f.csv', '19b188bc7f4b8ad53ade07862c98bd2f', '19b188bc7f4b8ad53ade07862c98bd2f.csv', 'test - Copy.csv', '.csv', '0.48', 1, '1', 2, 'Suppression', NULL, NULL, '2020-10-04 08:07:36', 2, NULL, NULL),
(84, 'http://localhost/xpertdialer//resources/uploads/Suppression/2020/10/04/e65f87c9431b0e2cac9be367ed772945.csv', 'e65f87c9431b0e2cac9be367ed772945.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/04/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/04/e65f87c9431b0e2cac9be367ed772945.csv', 'e65f87c9431b0e2cac9be367ed772945', 'e65f87c9431b0e2cac9be367ed772945.csv', 'test.csv', '.csv', '37887.97', 1, '1', 2, 'Suppression', NULL, NULL, '2020-10-04 08:10:02', 2, NULL, NULL),
(85, 'http://localhost/xpertdialer//resources/uploads/Suppression/2020/10/04/573378de1e3dbc6c840ca9b03e069ad2.csv', '573378de1e3dbc6c840ca9b03e069ad2.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/04/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/04/573378de1e3dbc6c840ca9b03e069ad2.csv', '573378de1e3dbc6c840ca9b03e069ad2', '573378de1e3dbc6c840ca9b03e069ad2.csv', 'test.csv', '.csv', '37887.97', 1, '2', 2, 'Suppression', NULL, NULL, '2020-10-04 09:06:27', 2, NULL, NULL),
(86, 'http://localhost/xpertdialer//resources/uploads/Suppression/2020/10/04/a01e4c3e00edef064f578d0083dfefed.csv', 'a01e4c3e00edef064f578d0083dfefed.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/04/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/04/a01e4c3e00edef064f578d0083dfefed.csv', 'a01e4c3e00edef064f578d0083dfefed', 'a01e4c3e00edef064f578d0083dfefed.csv', 'test - Copy.csv', '.csv', '0.48', 1, '2', 2, 'Suppression', NULL, NULL, '2020-10-04 09:08:46', 2, NULL, NULL),
(95, 'http://localhost/xpertdialer//resources/uploads/Suppression/2020/10/08/5dfd0bbf96dae50e39cfc3c52ebce4d4.csv', '5dfd0bbf96dae50e39cfc3c52ebce4d4.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/08/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/08/5dfd0bbf96dae50e39cfc3c52ebce4d4.csv', '5dfd0bbf96dae50e39cfc3c52ebce4d4', '5dfd0bbf96dae50e39cfc3c52ebce4d4.csv', 'test - Copy.csv', '.csv', '0.48', 1, '5', 2, 'Suppression', NULL, NULL, '2020-10-08 15:36:23', 2, NULL, NULL),
(97, 'http://localhost/xpertdialer//resources/uploads/Suppression/2020/10/08/194796295674910fd988df9857f3d8ae.csv', '194796295674910fd988df9857f3d8ae.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/08/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Suppression/2020/10/08/194796295674910fd988df9857f3d8ae.csv', '194796295674910fd988df9857f3d8ae', '194796295674910fd988df9857f3d8ae.csv', 'test - Copy.csv', '.csv', '0.48', 1, '5', 2, 'Suppression', NULL, NULL, '2020-10-08 19:29:40', 2, NULL, NULL),
(98, 'http://localhost/xpertdialer//resources/uploads/Recordings/2020/10/09/b6669926ff15ca440a2da6d145464ac8.mp3', 'b6669926ff15ca440a2da6d145464ac8.mp3', 'audio/mpeg', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Recordings/2020/10/09/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Recordings/2020/10/09/b6669926ff15ca440a2da6d145464ac8.mp3', 'b6669926ff15ca440a2da6d145464ac8', 'b6669926ff15ca440a2da6d145464ac8.mp3', 'bikhari-ki-tarh-funy-51588.mp3', '.mp3', '146.57', 1, '3', 2, 'Recordings', NULL, NULL, '2020-10-09 22:45:36', 2, NULL, NULL),
(99, 'http://localhost/xpertdialer//resources/uploads/Recordings/2020/10/09/03266115b1dbcfc3b32c3565858f2d83.mp3', '03266115b1dbcfc3b32c3565858f2d83.mp3', 'audio/mpeg', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Recordings/2020/10/09/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Recordings/2020/10/09/03266115b1dbcfc3b32c3565858f2d83.mp3', '03266115b1dbcfc3b32c3565858f2d83', '03266115b1dbcfc3b32c3565858f2d83.mp3', 'bikhari-ki-tarh-funy-51588.mp3', '.mp3', '146.57', 1, '3', 2, 'Recordings', NULL, NULL, '2020-10-09 22:47:34', 2, NULL, NULL),
(100, 'http://localhost/xpertdialer//resources/uploads/Recordings/2020/10/09/3566e21fc8afcf9a1ac5bfe47529dafe.mp3', '3566e21fc8afcf9a1ac5bfe47529dafe.mp3', 'audio/mpeg', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Recordings/2020/10/09/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Recordings/2020/10/09/3566e21fc8afcf9a1ac5bfe47529dafe.mp3', '3566e21fc8afcf9a1ac5bfe47529dafe', '3566e21fc8afcf9a1ac5bfe47529dafe.mp3', 'bikhari-ki-tarh-funy-51588.mp3', '.mp3', '146.57', 1, '3', 2, 'Recordings', NULL, NULL, '2020-10-09 22:57:52', 2, NULL, NULL),
(101, 'http://localhost/xpertdialer//resources/uploads/Recordings/2020/10/09/1c5b930025c006dcbdb9dadb9622f3a5.mp3', '1c5b930025c006dcbdb9dadb9622f3a5.mp3', 'audio/mpeg', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Recordings/2020/10/09/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Recordings/2020/10/09/1c5b930025c006dcbdb9dadb9622f3a5.mp3', '1c5b930025c006dcbdb9dadb9622f3a5', '1c5b930025c006dcbdb9dadb9622f3a5.mp3', 'bikhari-ki-tarh-funy-51588.mp3', '.mp3', '146.57', 1, '60', 2, 'Recordings', NULL, NULL, '2020-10-09 22:58:32', 2, NULL, NULL),
(102, 'http://localhost/xpertdialer//resources/uploads/Recordings/2020/10/09/27f9f1f5902099a0cf717fb71e46c3de.mp3', '27f9f1f5902099a0cf717fb71e46c3de.mp3', 'audio/mpeg', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Recordings/2020/10/09/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Recordings/2020/10/09/27f9f1f5902099a0cf717fb71e46c3de.mp3', '27f9f1f5902099a0cf717fb71e46c3de', '27f9f1f5902099a0cf717fb71e46c3de.mp3', 'bikhari-ki-tarh-funy-51588.mp3', '.mp3', '146.57', 1, '60', 2, 'Recordings', NULL, NULL, '2020-10-09 23:00:14', 2, NULL, NULL),
(103, 'http://localhost/xpertdialer//resources/uploads/Recordings/2020/10/09/c1091137b06f5a8ea6851ef6a1b2582a.mp3', 'c1091137b06f5a8ea6851ef6a1b2582a.mp3', 'audio/mpeg', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Recordings/2020/10/09/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Recordings/2020/10/09/c1091137b06f5a8ea6851ef6a1b2582a.mp3', 'c1091137b06f5a8ea6851ef6a1b2582a', 'c1091137b06f5a8ea6851ef6a1b2582a.mp3', 'bikhari-ki-tarh-funy-51588.mp3', '.mp3', '146.57', 1, '60', 2, 'Recordings', NULL, NULL, '2020-10-09 23:01:29', 2, NULL, NULL),
(104, 'http://localhost/xpertdialer//resources/uploads/Recordings/2020/10/09/90041708a10df3cd3b2a4b050fa89a8c.mp3', '90041708a10df3cd3b2a4b050fa89a8c.mp3', 'audio/mpeg', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Recordings/2020/10/09/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Recordings/2020/10/09/90041708a10df3cd3b2a4b050fa89a8c.mp3', '90041708a10df3cd3b2a4b050fa89a8c', '90041708a10df3cd3b2a4b050fa89a8c.mp3', 'bikhari-ki-tarh-funy-51588.mp3', '.mp3', '146.57', 1, '60', 2, 'Recordings', NULL, NULL, '2020-10-09 23:02:51', 2, NULL, NULL),
(105, 'http://localhost/xpertdialer//resources/uploads/Recordings/2020/10/09/404eb0662bf62ff18f52cef4002d02c6.mp3', '404eb0662bf62ff18f52cef4002d02c6.mp3', 'audio/mpeg', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Recordings/2020/10/09/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Recordings/2020/10/09/404eb0662bf62ff18f52cef4002d02c6.mp3', '404eb0662bf62ff18f52cef4002d02c6', '404eb0662bf62ff18f52cef4002d02c6.mp3', 'bikhari-ki-tarh-funy-51588.mp3', '.mp3', '146.57', 1, '60', 2, 'Recordings', NULL, NULL, '2020-10-09 23:06:48', 2, NULL, NULL),
(106, 'http://localhost/xpertdialer//resources/uploads/Recordings/2020/10/09/9b4a66e5bcf1c75ec2b345da06b37d63.mp3', '9b4a66e5bcf1c75ec2b345da06b37d63.mp3', 'audio/mpeg', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Recordings/2020/10/09/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Recordings/2020/10/09/9b4a66e5bcf1c75ec2b345da06b37d63.mp3', '9b4a66e5bcf1c75ec2b345da06b37d63', '9b4a66e5bcf1c75ec2b345da06b37d63.mp3', 'bikhari-ki-tarh-funy-51588.mp3', '.mp3', '146.57', 1, '60', 2, 'Recordings', NULL, NULL, '2020-10-09 23:07:45', 2, NULL, NULL),
(107, 'http://localhost/xpertdialer//resources/uploads/Recordings/2020/10/09/68cae9a9ffbd1b3f94966c476869877e.mp3', '68cae9a9ffbd1b3f94966c476869877e.mp3', 'audio/mpeg', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Recordings/2020/10/09/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Recordings/2020/10/09/68cae9a9ffbd1b3f94966c476869877e.mp3', '68cae9a9ffbd1b3f94966c476869877e', '68cae9a9ffbd1b3f94966c476869877e.mp3', 'bikhari-ki-tarh-funy-51588.mp3', '.mp3', '146.57', 1, '60', 2, 'Recordings', NULL, NULL, '2020-10-09 23:08:57', 2, NULL, NULL),
(108, 'http://localhost/xpertdialer//resources/uploads/Recordings/2020/10/09/b609dccc96ec7bd071ac4747b1d8a054.mp3', 'b609dccc96ec7bd071ac4747b1d8a054.mp3', 'audio/mpeg', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Recordings/2020/10/09/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Recordings/2020/10/09/b609dccc96ec7bd071ac4747b1d8a054.mp3', 'b609dccc96ec7bd071ac4747b1d8a054', 'b609dccc96ec7bd071ac4747b1d8a054.mp3', 'bikhari-ki-tarh-funy-51588.mp3', '.mp3', '146.57', 1, '60', 2, 'Recordings', NULL, NULL, '2020-10-09 23:13:36', 2, NULL, NULL),
(109, 'http://localhost/xpertdialer//resources/uploads/Recordings/2020/10/09/ed42c91ff5c9e72650a3f414457f9dae.mp3', 'ed42c91ff5c9e72650a3f414457f9dae.mp3', 'audio/mpeg', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Recordings/2020/10/09/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Recordings/2020/10/09/ed42c91ff5c9e72650a3f414457f9dae.mp3', 'ed42c91ff5c9e72650a3f414457f9dae', 'ed42c91ff5c9e72650a3f414457f9dae.mp3', 'bikhari-ki-tarh-funy-51588.mp3', '.mp3', '146.57', 1, '60', 2, 'Recordings', NULL, NULL, '2020-10-09 23:17:21', 2, NULL, NULL),
(110, 'http://localhost/xpertdialer//resources/uploads/Recordings/2020/10/09/0b70ca3dd6a47f700c2ec257598c544c.mp3', '0b70ca3dd6a47f700c2ec257598c544c.mp3', 'audio/mpeg', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Recordings/2020/10/09/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Recordings/2020/10/09/0b70ca3dd6a47f700c2ec257598c544c.mp3', '0b70ca3dd6a47f700c2ec257598c544c', '0b70ca3dd6a47f700c2ec257598c544c.mp3', 'bikhari-ki-tarh-funy-51588.mp3', '.mp3', '146.57', 1, '60', 2, 'Recordings', NULL, NULL, '2020-10-09 23:46:34', 2, NULL, NULL),
(111, 'http://localhost/xpertdialer//resources/uploads/Prospects/2020/10/11/0c6fb3470a7197a25264a86707074832.csv', '0c6fb3470a7197a25264a86707074832.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Prospects/2020/10/11/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Prospects/2020/10/11/0c6fb3470a7197a25264a86707074832.csv', '0c6fb3470a7197a25264a86707074832', '0c6fb3470a7197a25264a86707074832.csv', 'Gamma 1000 Quality file - QA file.csv', '.csv', '13111.99', 1, '5', 2, 'Prospects', NULL, NULL, '2020-10-11 00:42:29', 2, NULL, NULL),
(112, 'http://localhost/xpertdialer//resources/uploads/Prospects/2020/10/11/dc742a81dc439dde444faa48032b3aee.csv', 'dc742a81dc439dde444faa48032b3aee.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Prospects/2020/10/11/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Prospects/2020/10/11/dc742a81dc439dde444faa48032b3aee.csv', 'dc742a81dc439dde444faa48032b3aee', 'dc742a81dc439dde444faa48032b3aee.csv', 'test - Copy.csv', '.csv', '0.48', 1, '5', 2, 'Prospects', NULL, NULL, '2020-10-11 01:14:16', 2, NULL, NULL),
(113, 'http://localhost/xpertdialer//resources/uploads/Prospects/2020/10/11/9810f002ce68894518fe84fa1e85fa5c.csv', '9810f002ce68894518fe84fa1e85fa5c.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Prospects/2020/10/11/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Prospects/2020/10/11/9810f002ce68894518fe84fa1e85fa5c.csv', '9810f002ce68894518fe84fa1e85fa5c', '9810f002ce68894518fe84fa1e85fa5c.csv', 'test - Copy.csv', '.csv', '0.48', 1, '5', 2, 'Prospects', NULL, NULL, '2020-10-11 01:17:01', 2, NULL, NULL),
(114, 'http://localhost/xpertdialer//resources/uploads/Prospects/2020/10/11/695ed9a31b16eabb65b40b12c9bfc079.csv', '695ed9a31b16eabb65b40b12c9bfc079.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Prospects/2020/10/11/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Prospects/2020/10/11/695ed9a31b16eabb65b40b12c9bfc079.csv', '695ed9a31b16eabb65b40b12c9bfc079', '695ed9a31b16eabb65b40b12c9bfc079.csv', 'test - Copy.csv', '.csv', '0.48', 1, '5', 2, 'Prospects', NULL, NULL, '2020-10-11 01:18:23', 2, NULL, NULL),
(115, 'http://localhost/xpertdialer//resources/uploads/Prospects/2020/10/11/da58a89fc1914cbc3ab8e7aac32ec9e4.csv', 'da58a89fc1914cbc3ab8e7aac32ec9e4.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Prospects/2020/10/11/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Prospects/2020/10/11/da58a89fc1914cbc3ab8e7aac32ec9e4.csv', 'da58a89fc1914cbc3ab8e7aac32ec9e4', 'da58a89fc1914cbc3ab8e7aac32ec9e4.csv', 'Gamma 1000 Quality file - QA file.csv', '.csv', '13111.99', 1, '5', 2, 'Prospects', NULL, NULL, '2020-10-11 09:56:55', 2, NULL, NULL),
(116, 'http://localhost/xpertdialer//resources/uploads/Prospects/2020/10/11/67226e4cc8126455297ddb17b72756c2.csv', '67226e4cc8126455297ddb17b72756c2.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Prospects/2020/10/11/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Prospects/2020/10/11/67226e4cc8126455297ddb17b72756c2.csv', '67226e4cc8126455297ddb17b72756c2', '67226e4cc8126455297ddb17b72756c2.csv', 'Gamma 1000 Quality file - QA file.csv', '.csv', '13111.99', 1, '5', 2, 'Prospects', NULL, NULL, '2020-10-11 09:57:45', 2, NULL, NULL),
(117, 'http://localhost/xpertdialer//resources/uploads/Prospects/2020/10/11/39dca8f4d3ce56c9b98c1eb146d49388.csv', '39dca8f4d3ce56c9b98c1eb146d49388.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Prospects/2020/10/11/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Prospects/2020/10/11/39dca8f4d3ce56c9b98c1eb146d49388.csv', '39dca8f4d3ce56c9b98c1eb146d49388', '39dca8f4d3ce56c9b98c1eb146d49388.csv', 'Gamma 1000 Quality file - QA file.csv', '.csv', '13111.99', 1, '5', 2, 'Prospects', NULL, NULL, '2020-10-11 09:58:46', 2, NULL, NULL);
INSERT INTO `bf_assets` (`id`, `url`, `file_name`, `file_type`, `file_path`, `full_path`, `raw_name`, `orig_name`, `client_name`, `file_ext`, `file_size`, `status`, `reference_id`, `customer_id`, `module`, `deleted`, `deleted_by`, `created_on`, `created_by`, `modified_on`, `modified_by`) VALUES
(118, 'http://localhost/xpertdialer//resources/uploads/Prospects/2020/10/11/563b87a5c925a36d3d26f38ca2a776e6.csv', '563b87a5c925a36d3d26f38ca2a776e6.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Prospects/2020/10/11/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Prospects/2020/10/11/563b87a5c925a36d3d26f38ca2a776e6.csv', '563b87a5c925a36d3d26f38ca2a776e6', '563b87a5c925a36d3d26f38ca2a776e6.csv', 'Gamma 1000 Quality file - QA file.csv', '.csv', '13111.99', 1, '5', 2, 'Prospects', NULL, NULL, '2020-10-11 09:59:54', 2, NULL, NULL),
(119, 'http://localhost/xpertdialer//resources/uploads/Prospects/2020/10/11/fe8ab1f3520bc15310dcfa1a2078ec4d.csv', 'fe8ab1f3520bc15310dcfa1a2078ec4d.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Prospects/2020/10/11/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Prospects/2020/10/11/fe8ab1f3520bc15310dcfa1a2078ec4d.csv', 'fe8ab1f3520bc15310dcfa1a2078ec4d', 'fe8ab1f3520bc15310dcfa1a2078ec4d.csv', 'Gamma 1000 Quality file - QA file.csv', '.csv', '13111.99', 1, '5', 2, 'Prospects', NULL, NULL, '2020-10-11 10:00:10', 2, NULL, NULL),
(120, 'http://localhost/xpertdialer//resources/uploads/Prospects/2020/10/11/ba6698c35452d50f14bdc1719d4bedbc.csv', 'ba6698c35452d50f14bdc1719d4bedbc.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Prospects/2020/10/11/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Prospects/2020/10/11/ba6698c35452d50f14bdc1719d4bedbc.csv', 'ba6698c35452d50f14bdc1719d4bedbc', 'ba6698c35452d50f14bdc1719d4bedbc.csv', 'Gamma 1000 Quality file - QA file.csv', '.csv', '13111.99', 1, '5', 2, 'Prospects', NULL, NULL, '2020-10-11 10:00:57', 2, NULL, NULL),
(121, 'http://localhost/xpertdialer//resources/uploads/Prospects/2020/10/11/7f1f3ea87eb78a7b752ac73f972c22ec.csv', '7f1f3ea87eb78a7b752ac73f972c22ec.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Prospects/2020/10/11/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Prospects/2020/10/11/7f1f3ea87eb78a7b752ac73f972c22ec.csv', '7f1f3ea87eb78a7b752ac73f972c22ec', '7f1f3ea87eb78a7b752ac73f972c22ec.csv', 'Gamma 1000 Quality file - Sheet3.csv', '.csv', '1.45', 1, '5', 2, 'Prospects', NULL, NULL, '2020-10-11 10:12:56', 2, NULL, NULL),
(122, 'http://localhost/xpertdialer//resources/uploads/Prospects/2020/10/11/5f0f33397b435a692f0126728b05d061.csv', '5f0f33397b435a692f0126728b05d061.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Prospects/2020/10/11/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Prospects/2020/10/11/5f0f33397b435a692f0126728b05d061.csv', '5f0f33397b435a692f0126728b05d061', '5f0f33397b435a692f0126728b05d061.csv', 'Gamma 1000 Quality file - Sheet3.csv', '.csv', '1.45', 1, '5', 2, 'Prospects', NULL, NULL, '2020-10-11 10:13:16', 2, NULL, NULL),
(123, 'http://localhost/xpertdialer//resources/uploads/Prospects/2020/10/11/67eb87082526e2c8f12fef2482939e0e.csv', '67eb87082526e2c8f12fef2482939e0e.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Prospects/2020/10/11/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Prospects/2020/10/11/67eb87082526e2c8f12fef2482939e0e.csv', '67eb87082526e2c8f12fef2482939e0e', '67eb87082526e2c8f12fef2482939e0e.csv', 'Gamma 1000 Quality file - Sheet3.csv', '.csv', '1.45', 1, '5', 2, 'Prospects', NULL, NULL, '2020-10-11 11:37:17', 2, NULL, NULL),
(124, 'http://localhost/xpertdialer//resources/uploads/Prospects/2020/10/11/32fc4ad6a2f0dccd591f9af34a5644ad.csv', '32fc4ad6a2f0dccd591f9af34a5644ad.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Prospects/2020/10/11/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Prospects/2020/10/11/32fc4ad6a2f0dccd591f9af34a5644ad.csv', '32fc4ad6a2f0dccd591f9af34a5644ad', '32fc4ad6a2f0dccd591f9af34a5644ad.csv', 'Gamma 1000 Quality file - Sheet3.csv', '.csv', '1.45', 1, '5', 2, 'Prospects', NULL, NULL, '2020-10-11 11:37:53', 2, NULL, NULL),
(125, 'http://localhost/xpertdialer//resources/uploads/Prospects/2020/10/11/f33ec595497fbf00d138ee7522c0026c.csv', 'f33ec595497fbf00d138ee7522c0026c.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Prospects/2020/10/11/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Prospects/2020/10/11/f33ec595497fbf00d138ee7522c0026c.csv', 'f33ec595497fbf00d138ee7522c0026c', 'f33ec595497fbf00d138ee7522c0026c.csv', 'Gamma 1000 Quality file - Sheet3.csv', '.csv', '1.45', 1, '5', 2, 'Prospects', NULL, NULL, '2020-10-11 11:38:52', 2, NULL, NULL),
(126, 'http://localhost/xpertdialer//resources/uploads/Prospects/2020/10/11/c8f81674c99eed2d5943a412654f9233.csv', 'c8f81674c99eed2d5943a412654f9233.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Prospects/2020/10/11/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Prospects/2020/10/11/c8f81674c99eed2d5943a412654f9233.csv', 'c8f81674c99eed2d5943a412654f9233', 'c8f81674c99eed2d5943a412654f9233.csv', 'Gamma 1000 Quality file - Sheet3.csv', '.csv', '1.45', 1, '5', 2, 'Prospects', NULL, NULL, '2020-10-11 11:40:47', 2, NULL, NULL),
(127, 'http://localhost/xpertdialer//resources/uploads/Prospects/2020/10/11/75bdc547ad501df0e57be982ae1f21f5.csv', '75bdc547ad501df0e57be982ae1f21f5.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Prospects/2020/10/11/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Prospects/2020/10/11/75bdc547ad501df0e57be982ae1f21f5.csv', '75bdc547ad501df0e57be982ae1f21f5', '75bdc547ad501df0e57be982ae1f21f5.csv', 'Gamma 1000 Quality file - Sheet3.csv', '.csv', '1.45', 1, '5', 2, 'Prospects', NULL, NULL, '2020-10-11 12:08:07', 2, NULL, NULL),
(128, 'http://localhost/xpertdialer//resources/uploads/Prospects/2020/10/11/e5de176d4861e94fbd44a253305f0b3f.csv', 'e5de176d4861e94fbd44a253305f0b3f.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Prospects/2020/10/11/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Prospects/2020/10/11/e5de176d4861e94fbd44a253305f0b3f.csv', 'e5de176d4861e94fbd44a253305f0b3f', 'e5de176d4861e94fbd44a253305f0b3f.csv', 'Gamma 1000 Quality file - Sheet3.csv', '.csv', '1.45', 1, '5', 2, 'Prospects', NULL, NULL, '2020-10-11 12:08:31', 2, NULL, NULL),
(129, 'http://localhost/xpertdialer//resources/uploads/Prospects/2020/10/11/0bb993af9038f33fa66251dd40d4f13e.csv', '0bb993af9038f33fa66251dd40d4f13e.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Prospects/2020/10/11/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Prospects/2020/10/11/0bb993af9038f33fa66251dd40d4f13e.csv', '0bb993af9038f33fa66251dd40d4f13e', '0bb993af9038f33fa66251dd40d4f13e.csv', 'Gamma 1000 Quality file - Sheet3.csv', '.csv', '1.45', 1, '5', 2, 'Prospects', NULL, NULL, '2020-10-11 12:10:18', 2, NULL, NULL),
(130, 'http://localhost/xpertdialer//resources/uploads/Prospects/2020/10/11/0cb8e773712909c1c004dd84bf8c6d2e.csv', '0cb8e773712909c1c004dd84bf8c6d2e.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Prospects/2020/10/11/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Prospects/2020/10/11/0cb8e773712909c1c004dd84bf8c6d2e.csv', '0cb8e773712909c1c004dd84bf8c6d2e', '0cb8e773712909c1c004dd84bf8c6d2e.csv', 'Gamma 1000 Quality file - Sheet3.csv', '.csv', '1.45', 1, '5', 2, 'Prospects', NULL, NULL, '2020-10-11 12:26:01', 2, NULL, NULL),
(131, 'http://localhost/xpertdialer//resources/uploads/Prospects/2020/10/11/72c2419e44e2201d4f0fe830819ddb36.csv', '72c2419e44e2201d4f0fe830819ddb36.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Prospects/2020/10/11/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Prospects/2020/10/11/72c2419e44e2201d4f0fe830819ddb36.csv', '72c2419e44e2201d4f0fe830819ddb36', '72c2419e44e2201d4f0fe830819ddb36.csv', 'Gamma 1000 Quality file - Sheet3.csv', '.csv', '0.7', 1, '5', 2, 'Prospects', NULL, NULL, '2020-10-11 12:46:43', 2, NULL, NULL),
(132, 'http://localhost/xpertdialer//resources/uploads/Prospects/2020/10/11/a7dcc4473c886adbac2bd39e04ed7d2c.csv', 'a7dcc4473c886adbac2bd39e04ed7d2c.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Prospects/2020/10/11/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Prospects/2020/10/11/a7dcc4473c886adbac2bd39e04ed7d2c.csv', 'a7dcc4473c886adbac2bd39e04ed7d2c', 'a7dcc4473c886adbac2bd39e04ed7d2c.csv', 'Gamma 1000 Quality file - Sheet3.csv', '.csv', '0.7', 1, '5', 2, 'Prospects', NULL, NULL, '2020-10-11 12:52:03', 2, NULL, NULL),
(133, 'http://localhost/xpertdialer//resources/uploads/Prospects/2020/10/11/ff2614c3e5a314e6272f497d77acb585.csv', 'ff2614c3e5a314e6272f497d77acb585.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Prospects/2020/10/11/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Prospects/2020/10/11/ff2614c3e5a314e6272f497d77acb585.csv', 'ff2614c3e5a314e6272f497d77acb585', 'ff2614c3e5a314e6272f497d77acb585.csv', 'Gamma 1000 Quality file - Sheet3.csv', '.csv', '0.7', 1, '5', 2, 'Prospects', NULL, NULL, '2020-10-11 12:56:44', 2, NULL, NULL),
(134, 'http://localhost/xpertdialer//resources/uploads/Prospects/2020/10/11/1cd4e90100e160f9effab5416983d02e.csv', '1cd4e90100e160f9effab5416983d02e.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Prospects/2020/10/11/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Prospects/2020/10/11/1cd4e90100e160f9effab5416983d02e.csv', '1cd4e90100e160f9effab5416983d02e', '1cd4e90100e160f9effab5416983d02e.csv', 'Gamma 1000 Quality file - Sheet3.csv', '.csv', '0.7', 1, '5', 2, 'Prospects', NULL, NULL, '2020-10-11 13:00:45', 2, NULL, NULL),
(135, 'http://localhost/xpertdialer//resources/uploads/Prospects/2020/10/11/696d70d4088d2cbdcf0e7f9dc3f2f4dc.csv', '696d70d4088d2cbdcf0e7f9dc3f2f4dc.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Prospects/2020/10/11/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Prospects/2020/10/11/696d70d4088d2cbdcf0e7f9dc3f2f4dc.csv', '696d70d4088d2cbdcf0e7f9dc3f2f4dc', '696d70d4088d2cbdcf0e7f9dc3f2f4dc.csv', 'Gamma 1000 Quality file - Sheet3.csv', '.csv', '0.7', 1, '5', 2, 'Prospects', NULL, NULL, '2020-10-11 13:04:27', 2, NULL, NULL),
(136, 'http://localhost/xpertdialer//resources/uploads/Prospects/2020/10/11/5e0cd2a5fec48b6159a948fbb9d27fbe.csv', '5e0cd2a5fec48b6159a948fbb9d27fbe.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Prospects/2020/10/11/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Prospects/2020/10/11/5e0cd2a5fec48b6159a948fbb9d27fbe.csv', '5e0cd2a5fec48b6159a948fbb9d27fbe', '5e0cd2a5fec48b6159a948fbb9d27fbe.csv', 'Gamma 1000 Quality file - Sheet3.csv', '.csv', '0.7', 1, '5', 2, 'Prospects', NULL, NULL, '2020-10-11 13:09:15', 2, NULL, NULL),
(137, 'http://localhost/xpertdialer//resources/uploads/Prospects/2020/10/11/596ac7239977d78db792fa1782f0b8a5.csv', '596ac7239977d78db792fa1782f0b8a5.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Prospects/2020/10/11/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Prospects/2020/10/11/596ac7239977d78db792fa1782f0b8a5.csv', '596ac7239977d78db792fa1782f0b8a5', '596ac7239977d78db792fa1782f0b8a5.csv', 'Gamma 1000 Quality file - Sheet3.csv', '.csv', '0.7', 1, '5', 2, 'Prospects', NULL, NULL, '2020-10-11 13:10:37', 2, NULL, NULL),
(138, 'http://localhost/xpertdialer//resources/uploads/Prospects/2020/10/11/eee1dc9ca85c6abd69213b0981295cf9.csv', 'eee1dc9ca85c6abd69213b0981295cf9.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Prospects/2020/10/11/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Prospects/2020/10/11/eee1dc9ca85c6abd69213b0981295cf9.csv', 'eee1dc9ca85c6abd69213b0981295cf9', 'eee1dc9ca85c6abd69213b0981295cf9.csv', 'Gamma 1000 Quality file - Sheet3.csv', '.csv', '0.7', 1, '5', 2, 'Prospects', NULL, NULL, '2020-10-11 13:11:30', 2, NULL, NULL),
(139, 'http://localhost/xpertdialer//resources/uploads/Prospects/2020/10/11/bd4ed79f717c70032bd79d202e8a1487.csv', 'bd4ed79f717c70032bd79d202e8a1487.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Prospects/2020/10/11/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Prospects/2020/10/11/bd4ed79f717c70032bd79d202e8a1487.csv', 'bd4ed79f717c70032bd79d202e8a1487', 'bd4ed79f717c70032bd79d202e8a1487.csv', 'ff2614c3e5a314e6272f497d77acb585.csv', '.csv', '0.7', 1, '5', 2, 'Prospects', NULL, NULL, '2020-10-11 19:58:44', 2, NULL, NULL),
(140, 'http://localhost/xpertdialer//resources/uploads/EDM/2020/10/11/957b66619d596c106d262b4e3225c95d.csv', '957b66619d596c106d262b4e3225c95d.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/EDM/2020/10/11/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/EDM/2020/10/11/957b66619d596c106d262b4e3225c95d.csv', '957b66619d596c106d262b4e3225c95d', '957b66619d596c106d262b4e3225c95d.csv', '5e0cd2a5fec48b6159a948fbb9d27fbe.csv', '.csv', '0.7', 1, '2', 2, 'EDM', NULL, NULL, '2020-10-11 20:44:15', 2, NULL, NULL),
(141, 'http://localhost/xpertdialer//resources/uploads/EDM/2020/10/11/47284ec19c11ac9d09d8811ca3b8829e.csv', '47284ec19c11ac9d09d8811ca3b8829e.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/EDM/2020/10/11/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/EDM/2020/10/11/47284ec19c11ac9d09d8811ca3b8829e.csv', '47284ec19c11ac9d09d8811ca3b8829e', '47284ec19c11ac9d09d8811ca3b8829e.csv', '0cb8e773712909c1c004dd84bf8c6d2e.csv', '.csv', '1.45', 1, '2', 2, 'EDM', NULL, NULL, '2020-10-11 21:08:45', 2, NULL, NULL),
(142, 'http://localhost/xpertdialer//resources/uploads/EDM/2020/10/11/fdda17ce8c505fe80e60596d95900916.csv', 'fdda17ce8c505fe80e60596d95900916.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/EDM/2020/10/11/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/EDM/2020/10/11/fdda17ce8c505fe80e60596d95900916.csv', 'fdda17ce8c505fe80e60596d95900916', 'fdda17ce8c505fe80e60596d95900916.csv', 'Gamma 1000 Quality file - Sheet2.csv', '.csv', '0.06', 1, '2', 2, 'EDM', NULL, NULL, '2020-10-11 21:20:47', 2, NULL, NULL),
(143, 'http://localhost/xpertdialer//resources/uploads/EDM/2020/10/11/43a784aa45c832d3994c8abeb307c5ae.csv', '43a784aa45c832d3994c8abeb307c5ae.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/EDM/2020/10/11/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/EDM/2020/10/11/43a784aa45c832d3994c8abeb307c5ae.csv', '43a784aa45c832d3994c8abeb307c5ae', '43a784aa45c832d3994c8abeb307c5ae.csv', 'Gamma 1000 Quality file - Sheet2.csv', '.csv', '0.06', 1, '2', 2, 'EDM', NULL, NULL, '2020-10-11 21:23:31', 2, NULL, NULL),
(144, 'http://localhost/xpertdialer//resources/uploads/EDM/2020/10/11/90ef859cc51f03627a4900e7958d3a0b.csv', '90ef859cc51f03627a4900e7958d3a0b.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/EDM/2020/10/11/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/EDM/2020/10/11/90ef859cc51f03627a4900e7958d3a0b.csv', '90ef859cc51f03627a4900e7958d3a0b', '90ef859cc51f03627a4900e7958d3a0b.csv', 'Gamma 1000 Quality file - Sheet2.csv', '.csv', '0.06', 1, '2', 2, 'EDM', NULL, NULL, '2020-10-11 21:23:36', 2, NULL, NULL),
(145, 'http://localhost/xpertdialer//resources/uploads/EDM/2020/10/11/d0d54aec5626c0a088703b2499dffb65.csv', 'd0d54aec5626c0a088703b2499dffb65.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/EDM/2020/10/11/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/EDM/2020/10/11/d0d54aec5626c0a088703b2499dffb65.csv', 'd0d54aec5626c0a088703b2499dffb65', 'd0d54aec5626c0a088703b2499dffb65.csv', 'Gamma 1000 Quality file - Sheet2.csv', '.csv', '0.06', 1, '2', 2, 'EDM', NULL, NULL, '2020-10-11 21:38:37', 2, NULL, NULL),
(146, 'http://localhost/xpertdialer//resources/uploads/EDM/2020/10/12/e0b8d07df2ce9294fdfa4f908ffe6ea5.csv', 'e0b8d07df2ce9294fdfa4f908ffe6ea5.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/EDM/2020/10/12/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/EDM/2020/10/12/e0b8d07df2ce9294fdfa4f908ffe6ea5.csv', 'e0b8d07df2ce9294fdfa4f908ffe6ea5', 'e0b8d07df2ce9294fdfa4f908ffe6ea5.csv', 'Gamma 1000 Quality file - Sheet2.csv', '.csv', '0.06', 1, '', 2, 'EDM', NULL, NULL, '2020-10-12 12:58:07', 2, NULL, NULL),
(147, 'http://localhost/xpertdialer//resources/uploads/EDM/2020/10/12/87345ea4238e8f0a196bf175e762510d.csv', '87345ea4238e8f0a196bf175e762510d.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/EDM/2020/10/12/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/EDM/2020/10/12/87345ea4238e8f0a196bf175e762510d.csv', '87345ea4238e8f0a196bf175e762510d', '87345ea4238e8f0a196bf175e762510d.csv', 'Gamma 1000 Quality file - Sheet2.csv', '.csv', '0.06', 1, '', 2, 'EDM', NULL, NULL, '2020-10-12 13:05:05', 2, NULL, NULL),
(148, 'http://localhost/xpertdialer//resources/uploads/EDM/2020/10/12/c88b442655e2d6d7a8137308ea28afcf.csv', 'c88b442655e2d6d7a8137308ea28afcf.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/EDM/2020/10/12/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/EDM/2020/10/12/c88b442655e2d6d7a8137308ea28afcf.csv', 'c88b442655e2d6d7a8137308ea28afcf', 'c88b442655e2d6d7a8137308ea28afcf.csv', 'Gamma 1000 Quality file - Sheet2.csv', '.csv', '0.06', 1, '', 2, 'EDM', NULL, NULL, '2020-10-12 15:45:19', 2, NULL, NULL),
(149, 'http://localhost/xpertdialer//resources/uploads/EDM/2020/10/12/6f06dbc624620d6af43f6457d0607ea4.csv', '6f06dbc624620d6af43f6457d0607ea4.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/EDM/2020/10/12/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/EDM/2020/10/12/6f06dbc624620d6af43f6457d0607ea4.csv', '6f06dbc624620d6af43f6457d0607ea4', '6f06dbc624620d6af43f6457d0607ea4.csv', 'Gamma 1000 Quality file - Sheet2.csv', '.csv', '0.06', 1, '', 2, 'EDM', NULL, NULL, '2020-10-12 15:46:56', 2, NULL, NULL),
(150, 'http://localhost/xpertdialer//resources/uploads/EDM/2020/10/12/b6b8e72af6717918a91ac0d75f0990b3.csv', 'b6b8e72af6717918a91ac0d75f0990b3.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/EDM/2020/10/12/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/EDM/2020/10/12/b6b8e72af6717918a91ac0d75f0990b3.csv', 'b6b8e72af6717918a91ac0d75f0990b3', 'b6b8e72af6717918a91ac0d75f0990b3.csv', 'Gamma 1000 Quality file - Sheet2.csv', '.csv', '0.06', 1, '', 2, 'EDM', NULL, NULL, '2020-10-12 15:46:58', 2, NULL, NULL),
(151, 'http://localhost/xpertdialer//resources/uploads/EDM/2020/10/12/b836147461d753887b9a348852c35ffc.csv', 'b836147461d753887b9a348852c35ffc.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/EDM/2020/10/12/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/EDM/2020/10/12/b836147461d753887b9a348852c35ffc.csv', 'b836147461d753887b9a348852c35ffc', 'b836147461d753887b9a348852c35ffc.csv', 'Gamma 1000 Quality file - Sheet2.csv', '.csv', '0.06', 1, '', 2, 'EDM', NULL, NULL, '2020-10-12 15:46:59', 2, NULL, NULL),
(152, 'http://localhost/xpertdialer//resources/uploads/EDM/2020/10/12/7e7b2b3484af873ad8e85df8f4aa4f30.csv', '7e7b2b3484af873ad8e85df8f4aa4f30.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/EDM/2020/10/12/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/EDM/2020/10/12/7e7b2b3484af873ad8e85df8f4aa4f30.csv', '7e7b2b3484af873ad8e85df8f4aa4f30', '7e7b2b3484af873ad8e85df8f4aa4f30.csv', 'Gamma 1000 Quality file - Sheet2.csv', '.csv', '0.06', 1, '', 2, 'EDM', NULL, NULL, '2020-10-12 15:47:00', 2, NULL, NULL),
(153, 'http://localhost/xpertdialer//resources/uploads/EDM/2020/10/12/ba148d4a376b1bb86f3ea5210abc7da2.csv', 'ba148d4a376b1bb86f3ea5210abc7da2.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/EDM/2020/10/12/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/EDM/2020/10/12/ba148d4a376b1bb86f3ea5210abc7da2.csv', 'ba148d4a376b1bb86f3ea5210abc7da2', 'ba148d4a376b1bb86f3ea5210abc7da2.csv', 'Gamma 1000 Quality file - Sheet2.csv', '.csv', '0.06', 1, '', 2, 'EDM', NULL, NULL, '2020-10-12 15:47:02', 2, NULL, NULL),
(154, 'http://localhost/xpertdialer//resources/uploads/EDM/2020/10/12/73a8bbc96f9f684443ad79f90201f232.csv', '73a8bbc96f9f684443ad79f90201f232.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/EDM/2020/10/12/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/EDM/2020/10/12/73a8bbc96f9f684443ad79f90201f232.csv', '73a8bbc96f9f684443ad79f90201f232', '73a8bbc96f9f684443ad79f90201f232.csv', 'Gamma 1000 Quality file - Sheet2.csv', '.csv', '0.06', 1, '', 2, 'EDM', NULL, NULL, '2020-10-12 15:47:03', 2, NULL, NULL),
(155, 'http://localhost/xpertdialer//resources/uploads/EDM/2020/10/12/2519d17c3c9f89d7c4b666da301f6ece.csv', '2519d17c3c9f89d7c4b666da301f6ece.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/EDM/2020/10/12/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/EDM/2020/10/12/2519d17c3c9f89d7c4b666da301f6ece.csv', '2519d17c3c9f89d7c4b666da301f6ece', '2519d17c3c9f89d7c4b666da301f6ece.csv', 'Gamma 1000 Quality file - Sheet2.csv', '.csv', '0.06', 1, '', 2, 'EDM', NULL, NULL, '2020-10-12 15:47:04', 2, NULL, NULL),
(156, 'http://localhost/xpertdialer//resources/uploads/EDM/2020/10/12/9efd5e295619953a2ac321ed063bdc10.csv', '9efd5e295619953a2ac321ed063bdc10.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/EDM/2020/10/12/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/EDM/2020/10/12/9efd5e295619953a2ac321ed063bdc10.csv', '9efd5e295619953a2ac321ed063bdc10', '9efd5e295619953a2ac321ed063bdc10.csv', 'Gamma 1000 Quality file - Sheet2.csv', '.csv', '0.06', 1, '', 2, 'EDM', NULL, NULL, '2020-10-12 15:47:06', 2, NULL, NULL),
(157, 'http://localhost/xpertdialer//resources/uploads/EDM/2020/10/12/bcbf5bb3d5bd9d93448e3871f76b415d.csv', 'bcbf5bb3d5bd9d93448e3871f76b415d.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/EDM/2020/10/12/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/EDM/2020/10/12/bcbf5bb3d5bd9d93448e3871f76b415d.csv', 'bcbf5bb3d5bd9d93448e3871f76b415d', 'bcbf5bb3d5bd9d93448e3871f76b415d.csv', 'Gamma 1000 Quality file - Sheet2.csv', '.csv', '0.06', 1, '', 2, 'EDM', NULL, NULL, '2020-10-12 15:47:07', 2, NULL, NULL),
(158, 'http://localhost/xpertdialer//resources/uploads/EDM/2020/10/12/478b6459049d078a1391262d5984de39.csv', '478b6459049d078a1391262d5984de39.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/EDM/2020/10/12/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/EDM/2020/10/12/478b6459049d078a1391262d5984de39.csv', '478b6459049d078a1391262d5984de39', '478b6459049d078a1391262d5984de39.csv', 'Gamma 1000 Quality file - Sheet2.csv', '.csv', '0.06', 1, '', 2, 'EDM', NULL, NULL, '2020-10-12 15:47:08', 2, NULL, NULL),
(159, 'http://localhost/xpertdialer//resources/uploads/EDM/2020/10/12/3960c6d4d154b5aa8644a52122f03cb7.csv', '3960c6d4d154b5aa8644a52122f03cb7.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/EDM/2020/10/12/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/EDM/2020/10/12/3960c6d4d154b5aa8644a52122f03cb7.csv', '3960c6d4d154b5aa8644a52122f03cb7', '3960c6d4d154b5aa8644a52122f03cb7.csv', 'Gamma 1000 Quality file - Sheet2.csv', '.csv', '0.06', 1, '', 2, 'EDM', NULL, NULL, '2020-10-12 15:47:10', 2, NULL, NULL),
(160, 'http://localhost/xpertdialer//resources/uploads/EDM/2020/10/12/1ff32eafcfa229b258bc5c9f2b42e0bd.csv', '1ff32eafcfa229b258bc5c9f2b42e0bd.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/EDM/2020/10/12/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/EDM/2020/10/12/1ff32eafcfa229b258bc5c9f2b42e0bd.csv', '1ff32eafcfa229b258bc5c9f2b42e0bd', '1ff32eafcfa229b258bc5c9f2b42e0bd.csv', 'Gamma 1000 Quality file - Sheet2.csv', '.csv', '0.06', 1, '', 2, 'EDM', NULL, NULL, '2020-10-12 15:47:11', 2, NULL, NULL),
(161, 'http://localhost/xpertdialer//resources/uploads/EDM/2020/10/12/22d65405db5628e070b30e00fec6a1c0.csv', '22d65405db5628e070b30e00fec6a1c0.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/EDM/2020/10/12/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/EDM/2020/10/12/22d65405db5628e070b30e00fec6a1c0.csv', '22d65405db5628e070b30e00fec6a1c0', '22d65405db5628e070b30e00fec6a1c0.csv', 'Gamma 1000 Quality file - Sheet2.csv', '.csv', '0.06', 1, '', 2, 'EDM', NULL, NULL, '2020-10-12 15:47:12', 2, NULL, NULL),
(162, 'http://localhost/xpertdialer//resources/uploads/Campaign/2020/10/19/4c500489c4f332f0b477516cca905f7d.csv', '4c500489c4f332f0b477516cca905f7d.csv', 'text/plain', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Campaign/2020/10/19/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Campaign/2020/10/19/4c500489c4f332f0b477516cca905f7d.csv', '4c500489c4f332f0b477516cca905f7d', '4c500489c4f332f0b477516cca905f7d.csv', 'Gamma 1000 Quality file - Sheet2.csv', '.csv', '0.06', 1, '12', 2, 'Campaign', NULL, NULL, '2020-10-19 19:58:30', 2, NULL, NULL),
(163, 'http://localhost/xpertdialer//resources/uploads/Campaign/2020/10/29/4630758aa5cd274acf7e9936c3630207.jpg', '4630758aa5cd274acf7e9936c3630207.jpg', 'image/jpeg', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Campaign/2020/10/29/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Campaign/2020/10/29/4630758aa5cd274acf7e9936c3630207.jpg', '4630758aa5cd274acf7e9936c3630207', '4630758aa5cd274acf7e9936c3630207.jpg', 'BGSelection.jpg', '.jpg', '100.46', 1, '[object HTMLInputElement]', 2, 'Campaign', NULL, NULL, '2020-10-29 08:04:19', 2, NULL, NULL),
(164, 'http://localhost/xpertdialer//resources/uploads/Campaign/2020/10/29/2c0c62ce195f255937f88de458038955.png', '2c0c62ce195f255937f88de458038955.png', 'image/png', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Campaign/2020/10/29/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Campaign/2020/10/29/2c0c62ce195f255937f88de458038955.png', '2c0c62ce195f255937f88de458038955', '2c0c62ce195f255937f88de458038955.png', 'font_big_1.png', '.png', '0.33', 1, '[object HTMLInputElement]', 2, 'Campaign', NULL, NULL, '2020-10-29 08:20:19', 2, NULL, NULL),
(165, 'http://localhost/xpertdialer//resources/uploads/Campaign/2020/10/29/3a31014f368a9a4cab911fabe1324daa.jpg', '3a31014f368a9a4cab911fabe1324daa.jpg', 'image/jpeg', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Campaign/2020/10/29/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Campaign/2020/10/29/3a31014f368a9a4cab911fabe1324daa.jpg', '3a31014f368a9a4cab911fabe1324daa', '3a31014f368a9a4cab911fabe1324daa.jpg', 'BGSelection.jpg', '.jpg', '100.46', 1, '13', 2, 'Campaign', NULL, NULL, '2020-10-29 08:25:05', 2, NULL, NULL),
(166, 'http://localhost/xpertdialer//resources/uploads/Campaign/2020/10/29/cd5caf8a5b949e9d22f7f5714e8c4049.png', 'cd5caf8a5b949e9d22f7f5714e8c4049.png', 'image/png', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Campaign/2020/10/29/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Campaign/2020/10/29/cd5caf8a5b949e9d22f7f5714e8c4049.png', 'cd5caf8a5b949e9d22f7f5714e8c4049', 'cd5caf8a5b949e9d22f7f5714e8c4049.png', 'font_big_8.png', '.png', '0.37', 1, '13', 2, 'Campaign', NULL, NULL, '2020-10-29 08:25:45', 2, NULL, NULL),
(167, 'http://localhost/xpertdialer//resources/uploads/Campaign/2020/10/29/4fd602af0851c45b6b58899cd5f4ca2b.png', '4fd602af0851c45b6b58899cd5f4ca2b.png', 'image/png', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Campaign/2020/10/29/', 'C:/xampp/htdocs/xpertdialer/resources/uploads/Campaign/2020/10/29/4fd602af0851c45b6b58899cd5f4ca2b.png', '4fd602af0851c45b6b58899cd5f4ca2b', '4fd602af0851c45b6b58899cd5f4ca2b.png', 'font_small_7.png', '.png', '0.2', 1, '13', 2, 'Campaign', NULL, NULL, '2020-10-29 08:25:53', 2, NULL, NULL),
(169, 'https://b2bsolutions.tk//resources/uploads/Campaign/2020/11/09/729ed2fbd7a088ade4d4df7bdad4703e.png', '729ed2fbd7a088ade4d4df7bdad4703e.png', 'image/png', '/www/wwwroot/b2bsolutions.tk/resources/uploads/Campaign/2020/11/09/', '/www/wwwroot/b2bsolutions.tk/resources/uploads/Campaign/2020/11/09/729ed2fbd7a088ade4d4df7bdad4703e.png', '729ed2fbd7a088ade4d4df7bdad4703e', '729ed2fbd7a088ade4d4df7bdad4703e.png', 'user.png', '.png', '26.37', 1, '1', 2, 'Campaign', NULL, NULL, '2020-11-09 21:00:31', 2, NULL, NULL),
(170, 'https://b2bsolutions.tk//resources/uploads/Profile/2020/11/19/5eb9b8eabf0188283b31dc15f6b08412.png', '5eb9b8eabf0188283b31dc15f6b08412.png', 'image/png', '/www/wwwroot/b2bsolutions.tk/resources/uploads/Profile/2020/11/19/', '/www/wwwroot/b2bsolutions.tk/resources/uploads/Profile/2020/11/19/5eb9b8eabf0188283b31dc15f6b08412.png', '5eb9b8eabf0188283b31dc15f6b08412', '5eb9b8eabf0188283b31dc15f6b08412.png', 'user.png', '.png', '26.37', 1, '2', 2, 'Profile', NULL, NULL, '2020-11-19 11:11:08', 2, NULL, NULL),
(171, 'https://b2bsolutions.tk//resources/uploads/Profile/2020/11/19/fb48da6ef70215533725b9da272c128a.jpg', 'fb48da6ef70215533725b9da272c128a.jpg', 'image/jpeg', '/www/wwwroot/b2bsolutions.tk/resources/uploads/Profile/2020/11/19/', '/www/wwwroot/b2bsolutions.tk/resources/uploads/Profile/2020/11/19/fb48da6ef70215533725b9da272c128a.jpg', 'fb48da6ef70215533725b9da272c128a', 'fb48da6ef70215533725b9da272c128a.jpg', 'teacher.jpg', '.jpg', '90.2', 1, '2', 2, 'Profile', NULL, NULL, '2020-11-19 12:35:02', 2, NULL, NULL),
(172, 'https://b2bsolutions.tk//resources/uploads/Profile/2020/11/19/435e62b1056f2798902a94236a3abd3c.png', '435e62b1056f2798902a94236a3abd3c.png', 'image/png', '/www/wwwroot/b2bsolutions.tk/resources/uploads/Profile/2020/11/19/', '/www/wwwroot/b2bsolutions.tk/resources/uploads/Profile/2020/11/19/435e62b1056f2798902a94236a3abd3c.png', '435e62b1056f2798902a94236a3abd3c', '435e62b1056f2798902a94236a3abd3c.png', 'slider_one.png', '.png', '229.87', 1, '2', 2, 'Profile', NULL, NULL, '2020-11-19 12:37:23', 2, NULL, NULL),
(173, 'https://b2bsolutions.tk//resources/uploads/Profile/2020/11/19/4c155ac7b5a19d86a3a50892f6c0f739.png', '4c155ac7b5a19d86a3a50892f6c0f739.png', 'image/png', '/www/wwwroot/b2bsolutions.tk/resources/uploads/Profile/2020/11/19/', '/www/wwwroot/b2bsolutions.tk/resources/uploads/Profile/2020/11/19/4c155ac7b5a19d86a3a50892f6c0f739.png', '4c155ac7b5a19d86a3a50892f6c0f739', '4c155ac7b5a19d86a3a50892f6c0f739.png', 'user.png', '.png', '26.37', 1, '2', 2, 'Profile', NULL, NULL, '2020-11-19 12:37:53', 2, NULL, NULL),
(174, 'https://b2bsolutions.tk//resources/uploads/Profile/2020/11/19/ae311d2972bd891a22aa487a4cb545ab.png', 'ae311d2972bd891a22aa487a4cb545ab.png', 'image/png', '/www/wwwroot/b2bsolutions.tk/resources/uploads/Profile/2020/11/19/', '/www/wwwroot/b2bsolutions.tk/resources/uploads/Profile/2020/11/19/ae311d2972bd891a22aa487a4cb545ab.png', 'ae311d2972bd891a22aa487a4cb545ab', 'ae311d2972bd891a22aa487a4cb545ab.png', 'user.png', '.png', '26.37', 1, '2', 2, 'Profile', NULL, NULL, '2020-11-19 12:40:17', 2, NULL, NULL),
(175, 'https://b2bsolutions.tk//resources/uploads/Profile/2020/11/19/f5d137d13a537265ae0fc3e5c99c8076.jpg', 'f5d137d13a537265ae0fc3e5c99c8076.jpg', 'image/jpeg', '/www/wwwroot/b2bsolutions.tk/resources/uploads/Profile/2020/11/19/', '/www/wwwroot/b2bsolutions.tk/resources/uploads/Profile/2020/11/19/f5d137d13a537265ae0fc3e5c99c8076.jpg', 'f5d137d13a537265ae0fc3e5c99c8076', 'f5d137d13a537265ae0fc3e5c99c8076.jpg', 'teacher.jpg', '.jpg', '90.2', 1, '2', 2, 'Profile', NULL, NULL, '2020-11-19 12:41:23', 2, NULL, NULL),
(176, 'https://b2bsolutions.tk//resources/uploads/Profile/2020/11/19/33cfed51b0ccebbf86d9f36ff0468b8a.png', '33cfed51b0ccebbf86d9f36ff0468b8a.png', 'image/png', '/www/wwwroot/b2bsolutions.tk/resources/uploads/Profile/2020/11/19/', '/www/wwwroot/b2bsolutions.tk/resources/uploads/Profile/2020/11/19/33cfed51b0ccebbf86d9f36ff0468b8a.png', '33cfed51b0ccebbf86d9f36ff0468b8a', '33cfed51b0ccebbf86d9f36ff0468b8a.png', 'user.png', '.png', '26.37', 1, '2', 2, 'Profile', NULL, NULL, '2020-11-19 12:41:59', 2, NULL, NULL),
(177, 'https://b2bsolutions.tk//resources/uploads/Profile/2020/11/19/7094690896b74edad90f65f4d08b5624.jpg', '7094690896b74edad90f65f4d08b5624.jpg', 'image/jpeg', '/www/wwwroot/b2bsolutions.tk/resources/uploads/Profile/2020/11/19/', '/www/wwwroot/b2bsolutions.tk/resources/uploads/Profile/2020/11/19/7094690896b74edad90f65f4d08b5624.jpg', '7094690896b74edad90f65f4d08b5624', '7094690896b74edad90f65f4d08b5624.jpg', 'teacher.jpg', '.jpg', '90.2', 1, '43', 2, 'Profile', NULL, NULL, '2020-11-19 15:26:11', 43, NULL, NULL),
(178, 'https://b2bsolutions.tk//resources/uploads/Profile/2020/11/19/cbd1ad15f66cb8bb0b056c500ae193c0.png', 'cbd1ad15f66cb8bb0b056c500ae193c0.png', 'image/png', '/www/wwwroot/b2bsolutions.tk/resources/uploads/Profile/2020/11/19/', '/www/wwwroot/b2bsolutions.tk/resources/uploads/Profile/2020/11/19/cbd1ad15f66cb8bb0b056c500ae193c0.png', 'cbd1ad15f66cb8bb0b056c500ae193c0', 'cbd1ad15f66cb8bb0b056c500ae193c0.png', 'user.png', '.png', '26.37', 1, '43', 2, 'Profile', NULL, NULL, '2020-11-19 15:29:41', 43, NULL, NULL),
(179, 'https://b2bsolutions.tk//resources/uploads/Profile/2020/11/19/53d57f5c15cbae29e93bc8fbc2918630.jpg', '53d57f5c15cbae29e93bc8fbc2918630.jpg', 'image/jpeg', '/www/wwwroot/b2bsolutions.tk/resources/uploads/Profile/2020/11/19/', '/www/wwwroot/b2bsolutions.tk/resources/uploads/Profile/2020/11/19/53d57f5c15cbae29e93bc8fbc2918630.jpg', '53d57f5c15cbae29e93bc8fbc2918630', '53d57f5c15cbae29e93bc8fbc2918630.jpg', 'teacher.jpg', '.jpg', '90.2', 1, '43', 2, 'Profile', NULL, NULL, '2020-11-19 15:30:29', 43, NULL, NULL),
(180, 'https://b2bsolutions.tk//resources/uploads/Profile/2020/11/19/6f676c70c57ccf98ada3730920270330.jpg', '6f676c70c57ccf98ada3730920270330.jpg', 'image/jpeg', '/www/wwwroot/b2bsolutions.tk/resources/uploads/Profile/2020/11/19/', '/www/wwwroot/b2bsolutions.tk/resources/uploads/Profile/2020/11/19/6f676c70c57ccf98ada3730920270330.jpg', '6f676c70c57ccf98ada3730920270330', '6f676c70c57ccf98ada3730920270330.jpg', 'teacher.jpg', '.jpg', '90.2', 1, '43', 2, 'Profile', NULL, NULL, '2020-11-19 15:31:14', 43, NULL, NULL),
(181, 'https://b2bsolutions.tk//resources/uploads/Profile/2020/11/19/a1e3eac1e2eec94d3f8b9093ce985790.png', 'a1e3eac1e2eec94d3f8b9093ce985790.png', 'image/png', '/www/wwwroot/b2bsolutions.tk/resources/uploads/Profile/2020/11/19/', '/www/wwwroot/b2bsolutions.tk/resources/uploads/Profile/2020/11/19/a1e3eac1e2eec94d3f8b9093ce985790.png', 'a1e3eac1e2eec94d3f8b9093ce985790', 'a1e3eac1e2eec94d3f8b9093ce985790.png', 'user.png', '.png', '26.37', 1, '43', 2, 'Profile', NULL, NULL, '2020-11-19 15:31:22', 43, NULL, NULL),
(182, 'https://b2bsolutions.tk//resources/uploads/Profile/2020/11/19/79dd0fc4e3add274905456682c931f21.jpg', '79dd0fc4e3add274905456682c931f21.jpg', 'image/jpeg', '/www/wwwroot/b2bsolutions.tk/resources/uploads/Profile/2020/11/19/', '/www/wwwroot/b2bsolutions.tk/resources/uploads/Profile/2020/11/19/79dd0fc4e3add274905456682c931f21.jpg', '79dd0fc4e3add274905456682c931f21', '79dd0fc4e3add274905456682c931f21.jpg', 'teacher.jpg', '.jpg', '90.2', 1, '43', 2, 'Profile', NULL, NULL, '2020-11-19 15:31:51', 43, NULL, NULL),
(183, 'https://b2bsolutions.tk//resources/uploads/Profile/2020/11/19/f2764469335ec0d1dea0805762299a06.png', 'f2764469335ec0d1dea0805762299a06.png', 'image/png', '/www/wwwroot/b2bsolutions.tk/resources/uploads/Profile/2020/11/19/', '/www/wwwroot/b2bsolutions.tk/resources/uploads/Profile/2020/11/19/f2764469335ec0d1dea0805762299a06.png', 'f2764469335ec0d1dea0805762299a06', 'f2764469335ec0d1dea0805762299a06.png', 'user.png', '.png', '26.37', 1, '43', 2, 'Profile', NULL, NULL, '2020-11-19 15:33:16', 43, NULL, NULL),
(184, 'https://b2bsolutions.tk//resources/uploads/Profile/2020/11/19/01b7ac35b3c7d955fef7981f675cba80.jpg', '01b7ac35b3c7d955fef7981f675cba80.jpg', 'image/jpeg', '/www/wwwroot/b2bsolutions.tk/resources/uploads/Profile/2020/11/19/', '/www/wwwroot/b2bsolutions.tk/resources/uploads/Profile/2020/11/19/01b7ac35b3c7d955fef7981f675cba80.jpg', '01b7ac35b3c7d955fef7981f675cba80', '01b7ac35b3c7d955fef7981f675cba80.jpg', 'teacher.jpg', '.jpg', '90.2', 1, '43', 2, 'Profile', NULL, NULL, '2020-11-19 15:56:10', 43, NULL, NULL),
(185, 'https://b2bsolutions.tk//resources/uploads/Profile/2020/11/19/f07c38fb5fb120367098db1be61bae2b.png', 'f07c38fb5fb120367098db1be61bae2b.png', 'image/png', '/www/wwwroot/b2bsolutions.tk/resources/uploads/Profile/2020/11/19/', '/www/wwwroot/b2bsolutions.tk/resources/uploads/Profile/2020/11/19/f07c38fb5fb120367098db1be61bae2b.png', 'f07c38fb5fb120367098db1be61bae2b', 'f07c38fb5fb120367098db1be61bae2b.png', 'user.png', '.png', '26.37', 1, '43', 2, 'Profile', NULL, NULL, '2020-11-19 15:56:33', 43, NULL, NULL),
(186, 'https://b2bsolutions.tk//resources/uploads/Profile/2020/11/19/04e53d3d93c1a3aee369003cbb0e1057.jpg', '04e53d3d93c1a3aee369003cbb0e1057.jpg', 'image/jpeg', '/www/wwwroot/b2bsolutions.tk/resources/uploads/Profile/2020/11/19/', '/www/wwwroot/b2bsolutions.tk/resources/uploads/Profile/2020/11/19/04e53d3d93c1a3aee369003cbb0e1057.jpg', '04e53d3d93c1a3aee369003cbb0e1057', '04e53d3d93c1a3aee369003cbb0e1057.jpg', 'teacher.jpg', '.jpg', '90.2', 1, '43', 2, 'Profile', NULL, NULL, '2020-11-19 15:56:54', 43, NULL, NULL),
(187, 'https://b2bsolutions.tk//resources/uploads/Profile/2020/11/19/66d84393baf95f82b225747e9b179b35.png', '66d84393baf95f82b225747e9b179b35.png', 'image/png', '/www/wwwroot/b2bsolutions.tk/resources/uploads/Profile/2020/11/19/', '/www/wwwroot/b2bsolutions.tk/resources/uploads/Profile/2020/11/19/66d84393baf95f82b225747e9b179b35.png', '66d84393baf95f82b225747e9b179b35', '66d84393baf95f82b225747e9b179b35.png', 'user.png', '.png', '26.37', 1, '2', 2, 'Profile', NULL, NULL, '2020-11-19 16:00:11', 2, NULL, NULL),
(188, 'https://b2bsolutions.tk//resources/uploads/Profile/2020/11/20/a0ad7485967ac491a956331361fecf5e.png', 'a0ad7485967ac491a956331361fecf5e.png', 'image/png', '/www/wwwroot/b2bsolutions.tk/resources/uploads/Profile/2020/11/20/', '/www/wwwroot/b2bsolutions.tk/resources/uploads/Profile/2020/11/20/a0ad7485967ac491a956331361fecf5e.png', 'a0ad7485967ac491a956331361fecf5e', 'a0ad7485967ac491a956331361fecf5e.png', 'heart_small.png', '.png', '1.75', 1, '2', 2, 'Profile', NULL, NULL, '2020-11-20 11:06:25', 2, NULL, NULL),
(189, 'https://b2bsolutions.tk//resources/uploads/Profile/2020/11/20/32141833ca6bf6c54f8da9075fa7c3ca.png', '32141833ca6bf6c54f8da9075fa7c3ca.png', 'image/png', '/www/wwwroot/b2bsolutions.tk/resources/uploads/Profile/2020/11/20/', '/www/wwwroot/b2bsolutions.tk/resources/uploads/Profile/2020/11/20/32141833ca6bf6c54f8da9075fa7c3ca.png', '32141833ca6bf6c54f8da9075fa7c3ca', '32141833ca6bf6c54f8da9075fa7c3ca.png', 'user.png', '.png', '26.37', 1, '2', 2, 'Profile', NULL, NULL, '2020-11-20 11:43:20', 2, NULL, NULL),
(190, 'https://b2bsolutions.tk//resources/uploads/Profile/2020/11/20/a90d6c772af997be25e0869daafbee71.png', 'a90d6c772af997be25e0869daafbee71.png', 'image/png', '/www/wwwroot/b2bsolutions.tk/resources/uploads/Profile/2020/11/20/', '/www/wwwroot/b2bsolutions.tk/resources/uploads/Profile/2020/11/20/a90d6c772af997be25e0869daafbee71.png', 'a90d6c772af997be25e0869daafbee71', 'a90d6c772af997be25e0869daafbee71.png', 'user.png', '.png', '26.37', 1, '2', 2, 'Profile', NULL, NULL, '2020-11-20 11:50:37', 2, NULL, NULL),
(191, 'http://localhost/gitx//resources/uploads/Profile/2020/11/24/dc8b8d7b31be4b4f1e573b05f6799f7e.png', 'dc8b8d7b31be4b4f1e573b05f6799f7e.png', 'image/png', 'C:/xampp/htdocs/gitx/resources/uploads/Profile/2020/11/24/', 'C:/xampp/htdocs/gitx/resources/uploads/Profile/2020/11/24/dc8b8d7b31be4b4f1e573b05f6799f7e.png', 'dc8b8d7b31be4b4f1e573b05f6799f7e', 'dc8b8d7b31be4b4f1e573b05f6799f7e.png', 'users.png', '.png', '26.37', 1, '2', 2, 'Profile', NULL, NULL, '2020-11-24 15:48:44', 2, NULL, NULL),
(192, 'http://localhost/gitx//resources/uploads/Profile/2020/11/24/231d64f7faa6417c1fc0803b70d6b9a3.png', '231d64f7faa6417c1fc0803b70d6b9a3.png', 'image/png', 'C:/xampp/htdocs/gitx/resources/uploads/Profile/2020/11/24/', 'C:/xampp/htdocs/gitx/resources/uploads/Profile/2020/11/24/231d64f7faa6417c1fc0803b70d6b9a3.png', '231d64f7faa6417c1fc0803b70d6b9a3', '231d64f7faa6417c1fc0803b70d6b9a3.png', 'users.png', '.png', '26.37', 1, '2', 2, 'Profile', NULL, NULL, '2020-11-24 15:48:57', 2, NULL, NULL),
(193, 'http://localhost/gitx//resources/uploads/Profile/2020/11/24/4f525c9f6a279d70ceb2aae1f1a18cc4.png', '4f525c9f6a279d70ceb2aae1f1a18cc4.png', 'image/png', 'C:/xampp/htdocs/gitx/resources/uploads/Profile/2020/11/24/', 'C:/xampp/htdocs/gitx/resources/uploads/Profile/2020/11/24/4f525c9f6a279d70ceb2aae1f1a18cc4.png', '4f525c9f6a279d70ceb2aae1f1a18cc4', '4f525c9f6a279d70ceb2aae1f1a18cc4.png', 'users.png', '.png', '26.37', 1, '2', 2, 'Profile', NULL, NULL, '2020-11-24 15:49:44', 2, NULL, NULL),
(195, 'http://localhost/gitx//resources/uploads/Campaign/2020/12/02/eecb4a22005b46a95163449b3308edeb.png', 'eecb4a22005b46a95163449b3308edeb.png', 'image/png', 'C:/xampp/htdocs/gitx/resources/uploads/Campaign/2020/12/02/', 'C:/xampp/htdocs/gitx/resources/uploads/Campaign/2020/12/02/eecb4a22005b46a95163449b3308edeb.png', 'eecb4a22005b46a95163449b3308edeb', 'eecb4a22005b46a95163449b3308edeb.png', 'users.png', '.png', '26.37', 1, '25', 2, 'Campaign', NULL, NULL, '2020-12-02 06:16:18', 2, NULL, NULL),
(196, 'http://localhost/gitx//resources/uploads/Recordings/2020/12/05/0f630580871b26f8ba350fd612f88437.mp3', '0f630580871b26f8ba350fd612f88437.mp3', 'audio/mpeg', 'C:/xampp/htdocs/gitx/resources/uploads/Recordings/2020/12/05/', 'C:/xampp/htdocs/gitx/resources/uploads/Recordings/2020/12/05/0f630580871b26f8ba350fd612f88437.mp3', '0f630580871b26f8ba350fd612f88437', '0f630580871b26f8ba350fd612f88437.mp3', 'ACDC - Play Ball .mp3', '.mp3', '6577.56', 1, '60', 2, 'Recordings', NULL, NULL, '2020-12-05 06:17:52', 2, NULL, NULL),
(197, 'http://localhost/gitx//resources/uploads/Recordings/2020/12/05/da5acbd4cb27d3f0f5ca4ea045a8b8f0.mp3', 'da5acbd4cb27d3f0f5ca4ea045a8b8f0.mp3', 'audio/mpeg', 'C:/xampp/htdocs/gitx/resources/uploads/Recordings/2020/12/05/', 'C:/xampp/htdocs/gitx/resources/uploads/Recordings/2020/12/05/da5acbd4cb27d3f0f5ca4ea045a8b8f0.mp3', 'da5acbd4cb27d3f0f5ca4ea045a8b8f0', 'da5acbd4cb27d3f0f5ca4ea045a8b8f0.mp3', 'ACDC - Play Ball .mp3', '.mp3', '6577.56', 1, '60', 2, 'Recordings', NULL, NULL, '2020-12-05 06:27:58', 2, NULL, NULL),
(198, 'http://localhost/gitx//resources/uploads/Recordings/2020/12/05/95564252c5af2c252ffa17a069003532.mp3', '95564252c5af2c252ffa17a069003532.mp3', 'audio/mpeg', 'C:/xampp/htdocs/gitx/resources/uploads/Recordings/2020/12/05/', 'C:/xampp/htdocs/gitx/resources/uploads/Recordings/2020/12/05/95564252c5af2c252ffa17a069003532.mp3', '95564252c5af2c252ffa17a069003532', '95564252c5af2c252ffa17a069003532.mp3', 'ACDC - Rock or Bust .mp3', '.mp3', '7198.97', 1, '60', 2, 'Recordings', NULL, NULL, '2020-12-05 12:01:33', 2, NULL, NULL),
(199, 'http://localhost/gitx//resources/uploads/Recordings/2020/12/05/5494119751c8473fc671cdfd3beda5e9.mp3', '5494119751c8473fc671cdfd3beda5e9.mp3', 'audio/mpeg', 'C:/xampp/htdocs/gitx/resources/uploads/Recordings/2020/12/05/', 'C:/xampp/htdocs/gitx/resources/uploads/Recordings/2020/12/05/5494119751c8473fc671cdfd3beda5e9.mp3', '5494119751c8473fc671cdfd3beda5e9', '5494119751c8473fc671cdfd3beda5e9.mp3', 'ACDC - Play Ball .mp3', '.mp3', '6577.56', 1, '60', 2, 'Recordings', NULL, NULL, '2020-12-05 12:09:08', 2, NULL, NULL),
(200, 'http://localhost/gitx//resources/uploads/Recordings/2020/12/05/f2855ff4d1b7d031bf9c280d1fb2b11b.mp3', 'f2855ff4d1b7d031bf9c280d1fb2b11b.mp3', 'audio/mpeg', 'C:/xampp/htdocs/gitx/resources/uploads/Recordings/2020/12/05/', 'C:/xampp/htdocs/gitx/resources/uploads/Recordings/2020/12/05/f2855ff4d1b7d031bf9c280d1fb2b11b.mp3', 'f2855ff4d1b7d031bf9c280d1fb2b11b', 'f2855ff4d1b7d031bf9c280d1fb2b11b.mp3', 'ACDC - Play Ball .mp3', '.mp3', '6577.56', 1, '60', 2, 'Recordings', NULL, NULL, '2020-12-05 12:09:24', 2, NULL, NULL),
(201, 'http://localhost/gitx//resources/uploads/Recordings/2020/12/05/b5cdcb6a89c414c383262d73e43dd67c.mp3', 'b5cdcb6a89c414c383262d73e43dd67c.mp3', 'audio/mpeg', 'C:/xampp/htdocs/gitx/resources/uploads/Recordings/2020/12/05/', 'C:/xampp/htdocs/gitx/resources/uploads/Recordings/2020/12/05/b5cdcb6a89c414c383262d73e43dd67c.mp3', 'b5cdcb6a89c414c383262d73e43dd67c', 'b5cdcb6a89c414c383262d73e43dd67c.mp3', 'ACDC - Play Ball .mp3', '.mp3', '6577.56', 1, '60', 2, 'Recordings', NULL, NULL, '2020-12-05 12:36:16', 2, NULL, NULL),
(202, 'http://localhost/gitx//resources/uploads/Prospects/2020/12/07/fa0d00244d353ca05efc78cae1c4dbc4.csv', 'fa0d00244d353ca05efc78cae1c4dbc4.csv', 'text/plain', 'C:/xampp/htdocs/gitx/resources/uploads/Prospects/2020/12/07/', 'C:/xampp/htdocs/gitx/resources/uploads/Prospects/2020/12/07/fa0d00244d353ca05efc78cae1c4dbc4.csv', 'fa0d00244d353ca05efc78cae1c4dbc4', 'fa0d00244d353ca05efc78cae1c4dbc4.csv', 'upload_data.csv', '.csv', '0.39', 1, '1', 2, 'Prospects', NULL, NULL, '2020-12-07 11:23:12', 2, NULL, NULL),
(203, 'http://localhost/gitx//resources/uploads/Prospects/2020/12/07/23e36f3a1b8d0f147d55be96a71f3db1.csv', '23e36f3a1b8d0f147d55be96a71f3db1.csv', 'text/plain', 'C:/xampp/htdocs/gitx/resources/uploads/Prospects/2020/12/07/', 'C:/xampp/htdocs/gitx/resources/uploads/Prospects/2020/12/07/23e36f3a1b8d0f147d55be96a71f3db1.csv', '23e36f3a1b8d0f147d55be96a71f3db1', '23e36f3a1b8d0f147d55be96a71f3db1.csv', 'upload_data.csv', '.csv', '3.11', 1, '1', 2, 'Prospects', NULL, NULL, '2020-12-07 11:33:52', 2, NULL, NULL),
(204, 'http://localhost/gitx//resources/uploads/Prospects/2020/12/07/e4ad99a53f2cdb3d0349dd0f439f347c.csv', 'e4ad99a53f2cdb3d0349dd0f439f347c.csv', 'text/plain', 'C:/xampp/htdocs/gitx/resources/uploads/Prospects/2020/12/07/', 'C:/xampp/htdocs/gitx/resources/uploads/Prospects/2020/12/07/e4ad99a53f2cdb3d0349dd0f439f347c.csv', 'e4ad99a53f2cdb3d0349dd0f439f347c', 'e4ad99a53f2cdb3d0349dd0f439f347c.csv', 'upload_data.csv', '.csv', '3.11', 1, '1', 2, 'Prospects', NULL, NULL, '2020-12-07 11:34:13', 2, NULL, NULL),
(205, 'http://localhost/gitx//resources/uploads/Prospects/2020/12/08/237d4d012a0d27037b466c6f6eca4ccb.csv', '237d4d012a0d27037b466c6f6eca4ccb.csv', 'text/plain', 'C:/xampp/htdocs/gitx/resources/uploads/Prospects/2020/12/08/', 'C:/xampp/htdocs/gitx/resources/uploads/Prospects/2020/12/08/237d4d012a0d27037b466c6f6eca4ccb.csv', '237d4d012a0d27037b466c6f6eca4ccb', '237d4d012a0d27037b466c6f6eca4ccb.csv', 'upload_data.csv', '.csv', '4.98', 1, '1', 2, 'Prospects', NULL, NULL, '2020-12-08 13:22:55', 2, NULL, NULL),
(206, 'http://localhost/gitx//resources/uploads/Prospects/2020/12/08/01c4f01892bb0faf6820f957dc7fdf86.csv', '01c4f01892bb0faf6820f957dc7fdf86.csv', 'text/plain', 'C:/xampp/htdocs/gitx/resources/uploads/Prospects/2020/12/08/', 'C:/xampp/htdocs/gitx/resources/uploads/Prospects/2020/12/08/01c4f01892bb0faf6820f957dc7fdf86.csv', '01c4f01892bb0faf6820f957dc7fdf86', '01c4f01892bb0faf6820f957dc7fdf86.csv', 'upload_data.csv', '.csv', '4.98', 1, '1', 2, 'Prospects', NULL, NULL, '2020-12-08 13:25:03', 2, NULL, NULL),
(207, 'http://localhost/gitx//resources/uploads/Prospects/2020/12/08/82662daf95b3bffbb04449013d01d8df.csv', '82662daf95b3bffbb04449013d01d8df.csv', 'text/plain', 'C:/xampp/htdocs/gitx/resources/uploads/Prospects/2020/12/08/', 'C:/xampp/htdocs/gitx/resources/uploads/Prospects/2020/12/08/82662daf95b3bffbb04449013d01d8df.csv', '82662daf95b3bffbb04449013d01d8df', '82662daf95b3bffbb04449013d01d8df.csv', 'upload_data.csv', '.csv', '4.69', 1, '1', 2, 'Prospects', NULL, NULL, '2020-12-08 13:27:40', 2, NULL, NULL),
(208, 'http://localhost/gitx//resources/uploads/Recordings/2020/12/09/647f56de40c0e095b61a1667bc99513c.mp3', '647f56de40c0e095b61a1667bc99513c.mp3', 'audio/mpeg', 'C:/xampp/htdocs/gitx/resources/uploads/Recordings/2020/12/09/', 'C:/xampp/htdocs/gitx/resources/uploads/Recordings/2020/12/09/647f56de40c0e095b61a1667bc99513c.mp3', '647f56de40c0e095b61a1667bc99513c', '647f56de40c0e095b61a1667bc99513c.mp3', '10_ Portugal_ The Man - Feel It Still.mp3', '.mp3', '6528.55', 1, '60', 2, 'Recordings', NULL, NULL, '2020-12-09 06:11:07', 2, NULL, NULL),
(209, 'http://localhost/gitx//resources/uploads/Recordings/2020/12/09/d639a329484185e9397a31f898f7fb0c.mp3', 'd639a329484185e9397a31f898f7fb0c.mp3', 'audio/mpeg', 'C:/xampp/htdocs/gitx/resources/uploads/Recordings/2020/12/09/', 'C:/xampp/htdocs/gitx/resources/uploads/Recordings/2020/12/09/d639a329484185e9397a31f898f7fb0c.mp3', 'd639a329484185e9397a31f898f7fb0c', 'd639a329484185e9397a31f898f7fb0c.mp3', '54_ Tay-K - The Race.mp3', '.mp3', '5722.04', 1, '60', 2, 'Recordings', NULL, NULL, '2020-12-09 06:27:55', 2, NULL, NULL),
(210, 'http://localhost/gitx//resources/uploads/Prospects/2020/12/09/8ac39078d4010c2216136be720064844.csv', '8ac39078d4010c2216136be720064844.csv', 'text/plain', 'C:/xampp/htdocs/gitx/resources/uploads/Prospects/2020/12/09/', 'C:/xampp/htdocs/gitx/resources/uploads/Prospects/2020/12/09/8ac39078d4010c2216136be720064844.csv', '8ac39078d4010c2216136be720064844', '8ac39078d4010c2216136be720064844.csv', 'upload_data.csv', '.csv', '4.72', 1, '1', 2, 'Prospects', NULL, NULL, '2020-12-09 07:29:50', 2, NULL, NULL),
(211, 'http://localhost/gitx//resources/uploads/Prospects/2020/12/09/99563c29d1275fd57ba847e1ba399021.csv', '99563c29d1275fd57ba847e1ba399021.csv', 'text/plain', 'C:/xampp/htdocs/gitx/resources/uploads/Prospects/2020/12/09/', 'C:/xampp/htdocs/gitx/resources/uploads/Prospects/2020/12/09/99563c29d1275fd57ba847e1ba399021.csv', '99563c29d1275fd57ba847e1ba399021', '99563c29d1275fd57ba847e1ba399021.csv', 'upload_data.csv', '.csv', '4.72', 1, '1', 2, 'Prospects', NULL, NULL, '2020-12-09 07:39:05', 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bf_asset_datafiles`
--

CREATE TABLE `bf_asset_datafiles` (
  `id` int(11) NOT NULL,
  `asset_id` int(11) NOT NULL,
  `module` varchar(25) DEFAULT NULL,
  `uploaded_row` int(11) NOT NULL DEFAULT 0,
  `accepted_row` int(11) NOT NULL DEFAULT 0,
  `result_csv` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bf_asset_datafiles`
--

INSERT INTO `bf_asset_datafiles` (`id`, `asset_id`, `module`, `uploaded_row`, `accepted_row`, `result_csv`) VALUES
(1, 146, 'EDM', 0, 0, ''),
(2, 147, 'EDM', 3, 3, ''),
(3, 148, 'EDM', 3, 3, ''),
(4, 149, 'EDM', 3, 3, ''),
(5, 150, 'EDM', 3, 3, ''),
(6, 151, 'EDM', 3, 3, ''),
(7, 152, 'EDM', 3, 3, ''),
(8, 153, 'EDM', 3, 3, ''),
(9, 154, 'EDM', 3, 3, ''),
(10, 155, 'EDM', 3, 3, ''),
(11, 156, 'EDM', 3, 3, ''),
(12, 157, 'EDM', 3, 3, ''),
(13, 158, 'EDM', 3, 3, ''),
(14, 159, 'EDM', 3, 3, ''),
(15, 160, 'EDM', 3, 3, ''),
(16, 161, 'EDM', 3, 3, '');

-- --------------------------------------------------------

--
-- Table structure for table `bf_asset_prospects`
--

CREATE TABLE `bf_asset_prospects` (
  `id` int(11) NOT NULL,
  `asset_id` int(11) NOT NULL,
  `uploaded_row` int(11) NOT NULL DEFAULT 0,
  `accepted_row` int(11) NOT NULL DEFAULT 0,
  `result_csv` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bf_asset_prospects`
--

INSERT INTO `bf_asset_prospects` (`id`, `asset_id`, `uploaded_row`, `accepted_row`, `result_csv`) VALUES
(1, 129, 4, 0, 'http://localhost/xpertdialer/resources/uploads/Prospects/result/2020/10/11/'),
(2, 130, 4, 0, 'http://localhost/xpertdialer/resources/uploads/Prospects/result/2020/10/11/7e60bd76b487f2f197a342760c87f433.csv'),
(3, 131, 2, 0, 'http://localhost/xpertdialer/resources/uploads/Prospects/result/2020/10/11/d240a9a590037c61a7144b9656cfcace.csv'),
(4, 132, 2, 0, 'http://localhost/xpertdialer/resources/uploads/Prospects/result/2020/10/11/f4327187372a3e3d1dedaa3981b4e1d6.csv'),
(5, 133, 2, 0, 'http://localhost/xpertdialer/resources/uploads/Prospects/result/2020/10/11/9a5603ab6cfb543a023e2e0d0f611f60.csv'),
(6, 134, 2, 0, 'http://localhost/xpertdialer/resources/uploads/Prospects/result/2020/10/11/bb93dc796dca5e7e2111f3608238ca69.csv'),
(7, 135, 2, 0, 'http://localhost/xpertdialer/resources/uploads/Prospects/result/2020/10/11/85f6ef6d0aaf74fe876c14305c3423e1.csv'),
(8, 136, 2, 0, 'http://localhost/xpertdialer/resources/uploads/Prospects/result/2020/10/11/68fee0631532b5a859555f629cc47623.csv'),
(9, 137, 2, 0, 'http://localhost/xpertdialer/resources/uploads/Prospects/result/2020/10/11/972f29fd3a3e809fec90e2c572c669d8.csv'),
(10, 138, 2, 1, 'http://localhost/xpertdialer/resources/uploads/Prospects/result/2020/10/11/c60d870a01d1a3ed6892bba555c93dd1.csv'),
(11, 139, 2, 0, 'http://localhost/xpertdialer/resources/uploads/Prospects/result/2020/10/11/ae5398a24cbb07d99c09599b88f701b4.csv'),
(12, 202, 2, 0, 'http://localhost/gitx/resources/uploads/Prospects/result/2020/12/07/2028392e61250c4added7d355c44e012.csv'),
(13, 203, 26, 0, 'http://localhost/gitx/resources/uploads/Prospects/result/2020/12/07/2e780f94df1c8ef530cb1dd1ca935c6a.csv'),
(14, 204, 26, 0, 'http://localhost/gitx/resources/uploads/Prospects/result/2020/12/07/74a096510e7744e5b8337b7ab1aab9ff.csv'),
(15, 206, 30, 0, 'http://localhost/gitx/resources/uploads/Prospects/result/2020/12/08/aea78b01b67295f2c2746cb08e75807d.csv'),
(16, 207, 30, 0, 'http://localhost/gitx/resources/uploads/Prospects/result/2020/12/08/ad2928f90886d6eeec53a66e49bbe3c4.csv'),
(17, 210, 30, 29, 'http://localhost/gitx/resources/uploads/Prospects/result/2020/12/09/2314bf1768c9b0a71a43892b6c08a56b.csv'),
(18, 211, 30, 29, 'http://localhost/gitx/resources/uploads/Prospects/result/2020/12/09/cb553dcabfe2a20055ccdca3414b63dd.csv');

-- --------------------------------------------------------

--
-- Table structure for table `bf_campaigns`
--

CREATE TABLE `bf_campaigns` (
  `id` int(11) NOT NULL,
  `client_alias_id` int(11) DEFAULT NULL,
  `campaign_type_id` int(11) DEFAULT NULL,
  `campaign_name` varchar(64) DEFAULT NULL,
  `client_id` varchar(180) DEFAULT NULL,
  `description` varchar(264) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `total_lead` int(11) DEFAULT NULL,
  `lead_per_agent` int(11) DEFAULT NULL,
  `lead_per_company` int(11) DEFAULT NULL,
  `lead_cost` float NOT NULL,
  `po_number` varchar(16) DEFAULT NULL,
  `account_manager` int(11) DEFAULT NULL,
  `campaign_grade_id` int(11) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT 0 COMMENT '0:draft, 1:live, 2:completed',
  `preqa` int(11) DEFAULT 0,
  `postqa` int(11) DEFAULT 0,
  `script` text DEFAULT NULL,
  `onlypredictivedailing` int(11) DEFAULT NULL,
  `suppression_type` tinyint(4) DEFAULT NULL COMMENT '0 - none\r\n1 - organizational\r\n2 - client',
  `suppression_days` smallint(6) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `extended_end_date` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `data_churned` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bf_campaigns`
--

INSERT INTO `bf_campaigns` (`id`, `client_alias_id`, `campaign_type_id`, `campaign_name`, `client_id`, `description`, `start_date`, `end_date`, `total_lead`, `lead_per_agent`, `lead_per_company`, `lead_cost`, `po_number`, `account_manager`, `campaign_grade_id`, `status`, `preqa`, `postqa`, `script`, `onlypredictivedailing`, `suppression_type`, `suppression_days`, `customer_id`, `extended_end_date`, `deleted`, `deleted_by`, `created_on`, `created_by`, `modified_on`, `modified_by`, `data_churned`) VALUES
(1, 1, 1, 'sdasd', NULL, NULL, NULL, NULL, 100, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, NULL, '<p>Shashi Test</p>', NULL, 2, 180, 2, NULL, 0, NULL, '2020-09-17 01:12:34', NULL, '2020-12-09 11:23:48', 2, 29),
(2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, NULL, '<p>Shashi Test sa sa da sd as dsd&nbsp;</p>', NULL, 1, 15, 2, NULL, 0, NULL, '2020-09-17 01:12:34', NULL, NULL, NULL, 0),
(3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, NULL, NULL, '<p>Shashi Test</p>', NULL, NULL, NULL, 2, NULL, 0, NULL, '2020-09-17 01:12:34', NULL, '2020-12-04 07:48:41', 2, 0),
(4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, '<p>Shashi Test</p>', NULL, NULL, NULL, 2, NULL, 0, NULL, '2020-09-17 01:12:34', NULL, NULL, NULL, 0),
(5, NULL, 1, 'jhh', NULL, 'd dgf', '2020-09-24', '2020-09-29', 99, NULL, NULL, 0, NULL, NULL, 1, 0, 6, NULL, '<div class=\"col-lg-3 col-sm-6\" style=\"box-sizing: border-box; position: relative; min-height: 1px; padding-right: 15px; padding-left: 15px; float: left; width: 282.5px; color: #333333; font-family: \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\n<h3 style=\"box-sizing: border-box; font-family: inherit; font-weight: 500; line-height: 1.1; color: inherit; margin-top: 20px; margin-bottom: 10px; font-size: 24px;\">Browser Support</h3>\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px;\">Standards based browsers will just work. No plugins-necessary. Support requires: WebSockets &amp; WebRTC.</p>\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px;\">Supported Browsers</p>\n<ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px;\">\n<li style=\"box-sizing: border-box;\">\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px;\">Google Chrome</p>\n</li>\n<li style=\"box-sizing: border-box;\">\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px;\">Mozilla Firefox</p>\n</li>\n<li style=\"box-sizing: border-box;\">\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px;\">Apple Safari 11</p>\n</li>\n</ul>\n</div>\n<div class=\"col-lg-3 col-sm-6\" style=\"box-sizing: border-box; position: relative; min-height: 1px; padding-right: 15px; padding-left: 15px; float: left; width: 282.5px; color: #333333; font-family: \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\n<h3 style=\"box-sizing: border-box; font-family: inherit; font-weight: 500; line-height: 1.1; color: inherit; margin-top: 20px; margin-bottom: 10px; font-size: 24px;\">Use It</h3>\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px;\">Get started with ctxSip.</p>\n<ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px;\">\n<li style=\"box-sizing: border-box;\">\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px;\">Download or clone the repo:&nbsp;<a style=\"box-sizing: border-box; background: 0px 0px; color: #428bca; text-decoration-line: none;\" href=\"https://collecttix.github.com/ctxPhone\">https://collecttix.github.com/ctxPhone</a></p>\n</li>\n<li style=\"box-sizing: border-box;\">\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px;\">Copy&nbsp;<code style=\"box-sizing: border-box; font-family: Menlo, Monaco, Consolas, \'Courier New\', monospace; font-size: 12.6px; padding: 2px 4px; color: #c7254e; background-color: #f9f2f4; border-radius: 4px;\">scripts/config-sample.js</code>&nbsp;to&nbsp;<code style=\"box-sizing: border-box; font-family: Menlo, Monaco, Consolas, \'Courier New\', monospace; font-size: 12.6px; padding: 2px 4px; color: #c7254e; background-color: #f9f2f4; border-radius: 4px;\">scripts/config.js</code>&nbsp;and edit with your SIP account details.</p>\n</li>\n<li style=\"box-sizing: border-box;\">\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px;\">Launch the phone.</p>\n</li>\n</ul>\n</div>\n<div class=\"col-lg-3 col-sm-6\" style=\"box-sizing: border-box; position: relative; min-height: 1px; padding-right: 15px; padding-left: 15px; float: left; width: 282.5px; color: #333333; font-family: \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\n<h3 style=\"box-sizing: border-box; font-family: inherit; font-weight: 500; line-height: 1.1; color: inherit; margin-top: 20px; margin-bottom: 10px; font-size: 24px;\">Code</h3>\n<ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px;\">\n<li style=\"box-sizing: border-box;\">\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px;\"><a style=\"box-sizing: border-box; background: 0px 0px; color: #428bca; text-decoration-line: none;\" href=\"http://sipjs.com/\">SIP.js</a>&nbsp;Does all the heavy lifting.</p>\n</li>\n<li style=\"box-sizing: border-box;\">\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px;\"><code style=\"box-sizing: border-box; font-family: Menlo, Monaco, Consolas, \'Courier New\', monospace; font-size: 12.6px; padding: 2px 4px; color: #c7254e; background-color: #f9f2f4; border-radius: 4px;\">/scripts/app.js</code>&nbsp;is where the client code resides.</p>\n</li>\n<li style=\"box-sizing: border-box;\">\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px;\">When the client is launched, the user\'s configuration can be in a JS variable called&nbsp;<code style=\"box-sizing: border-box; font-family: Menlo, Monaco, Consolas, \'Courier New\', monospace; font-size: 12.6px; padding: 2px 4px; color: #c7254e; background-color: #f9f2f4; border-radius: 4px;\">user</code>&nbsp;or it will look in localStorage for a JSON encoded object&nbsp;<code style=\"box-sizing: border-box; font-family: Menlo, Monaco, Consolas, \'Courier New\', monospace; font-size: 12.6px; padding: 2px 4px; color: #c7254e; background-color: #f9f2f4; border-radius: 4px;\">SIPCreds</code></p>\n</li>\n</ul>\n</div>\n<div class=\"col-lg-3 col-sm-6\" style=\"box-sizing: border-box; position: relative; min-height: 1px; padding-right: 15px; padding-left: 15px; float: left; width: 282.5px; color: #333333; font-family: \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\n<h3 style=\"box-sizing: border-box; font-family: inherit; font-weight: 500; line-height: 1.1; color: inherit; margin-top: 20px; margin-bottom: 10px; font-size: 24px;\">Contribute</h3>\n<ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px;\">\n<li style=\"box-sizing: border-box;\">\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px;\">Have an idea or find a bug?&nbsp;<a style=\"box-sizing: border-box; background: 0px 0px; color: #428bca; text-decoration-line: none;\" href=\"https://github.com/collecttix/ctxSip/issues\">Submit an Issue.</a></p>\n</li>\n<li style=\"box-sizing: border-box;\">\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px;\">Have a new feature?&nbsp;<a style=\"box-sizing: border-box; background: 0px 0px; color: #428bca; text-decoration-line: none;\" href=\"https://github.com/collecttix/ctxSip/pulls\">Submit a Pull Request.</a></p>\n</li>\n</ul>\n</div>', NULL, 0, 0, 2, NULL, 0, NULL, '2020-09-17 01:12:34', NULL, '2020-12-04 11:55:12', 2, 0),
(6, NULL, NULL, 'jhh', NULL, 'admin', '2020-09-03', '2020-09-23', 0, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, NULL, '<p>Shashi Testkjjkjk</p>', NULL, 1, 150, 2, NULL, 0, NULL, '2020-09-17 01:12:34', NULL, NULL, NULL, 0),
(7, NULL, NULL, 'jhh', NULL, 'ss', '2020-09-02', '2020-09-16', 66, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, 0, NULL, '2020-09-17 01:12:34', NULL, NULL, NULL, 0),
(8, NULL, NULL, '', NULL, '', '0000-00-00', '0000-00-00', 0, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, 0, NULL, '2020-09-18 14:39:30', NULL, NULL, NULL, 0),
(9, NULL, NULL, '', NULL, '', '0000-00-00', '0000-00-00', 0, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, 0, NULL, '2020-09-18 14:39:34', NULL, NULL, NULL, 0),
(10, NULL, NULL, '', NULL, '', '0000-00-00', '0000-00-00', 0, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, 0, NULL, '2020-09-18 14:39:48', NULL, NULL, NULL, 0),
(11, 2, 1, 'test jit', NULL, 'sfsdfsdfsd', '2020-09-01', '2020-09-11', 33, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, 0, NULL, '2020-09-28 22:33:27', NULL, NULL, NULL, 0),
(12, NULL, NULL, 'Campaign1', NULL, 'Test', '2020-10-19', '2020-10-24', 22, NULL, NULL, 0, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, 0, NULL, '2020-10-19 21:01:16', NULL, NULL, NULL, 0),
(13, NULL, NULL, 'jhh', NULL, 'asdsad', '2020-10-02', '2020-10-21', 33, NULL, NULL, 0, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, 0, NULL, '2020-10-29 11:44:28', 2, NULL, NULL, 0),
(14, NULL, NULL, 'demo', NULL, 'demo testing', '2020-10-31', '2020-11-12', 1, NULL, NULL, 0, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, 0, NULL, '2020-10-31 12:16:19', NULL, NULL, NULL, 0),
(15, NULL, NULL, 'dsfdsfdfdf', NULL, 'fdfd', '2020-11-12', '2020-12-06', 1, NULL, NULL, 0, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, 0, NULL, '2020-11-02 13:30:27', NULL, NULL, NULL, 0),
(16, NULL, NULL, 'dsadasdasd', NULL, 'jhjk', '2020-11-20', '2020-11-21', 34, NULL, NULL, 0, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, 0, NULL, '2020-11-03 14:47:18', NULL, NULL, NULL, 0),
(17, NULL, NULL, 'sd', NULL, 'demo testing', '2020-11-05', '2020-11-21', 1, NULL, NULL, 0, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, 0, NULL, '2020-11-03 16:26:36', NULL, NULL, NULL, 0),
(18, NULL, NULL, 'test', '1', 'testing', '2020-11-24', '2020-11-30', 12, NULL, NULL, 5200, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, 0, NULL, '2020-11-24 18:28:35', NULL, NULL, NULL, 0),
(19, NULL, NULL, 'testing', '6', 'testing demo check', '2020-11-25', '2020-11-29', 10, NULL, 20, 8950, NULL, NULL, 20, 0, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, 0, NULL, '2020-11-24 23:04:42', 2, '2020-11-24 20:08:47', 2, 0),
(20, NULL, NULL, 'ss check', '13', 'hjjhj', '2020-11-25', '2020-11-30', 25, NULL, 30, 9850, NULL, NULL, 12, 0, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, 0, NULL, '2020-11-24 23:13:16', 2, NULL, NULL, 0),
(21, NULL, NULL, 'new campaign', '35', 'check purpose only', '2020-11-26', '2020-11-30', 52, NULL, 35, 9854120, NULL, NULL, 22, 0, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, 0, NULL, '2020-11-24 23:16:55', 2, NULL, NULL, 0),
(22, NULL, NULL, 'hjhjh', '39', 'hjhhjj', '2020-11-25', '2020-11-30', 89, NULL, 20, 654120, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, 0, NULL, '2020-11-24 23:25:04', 2, NULL, NULL, 0),
(23, NULL, NULL, 'ss check78', '14', 'testing demo check', '2020-11-27', '2020-12-01', 25, NULL, 2, 8950, NULL, NULL, 19, 0, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, 0, NULL, '2020-11-24 23:26:28', 2, NULL, NULL, 0),
(24, NULL, NULL, 'demofdsf', '8', 'dsfdf', '2020-11-26', '2020-11-28', 34, NULL, 43, 343434000, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, 0, NULL, '2020-11-25 10:42:56', 2, NULL, NULL, 0),
(25, NULL, NULL, 'hema demo', '46', 'abc', '2020-12-02', '2020-12-04', 20, NULL, 2, 200, NULL, NULL, 6, 0, 0, 0, '<p>hema shinde</p>', NULL, NULL, NULL, 2, NULL, 0, NULL, '2020-12-02 10:44:46', 2, '2020-12-02 10:36:34', 2, 11),
(26, NULL, NULL, 'fdggf', '6', 'vbfggggg', '2020-12-03', '2020-12-05', 4, NULL, 4, 4, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, 0, NULL, '2020-12-02 12:59:38', 2, NULL, NULL, 0),
(27, NULL, NULL, 'gfdgfg', '46', 'fdgfgfg', '2020-12-03', '2021-01-01', 45, NULL, 5, 54, NULL, NULL, 11, 1, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, 0, NULL, '2020-12-02 13:26:03', 2, '2020-12-02 11:56:13', 2, 0),
(28, NULL, NULL, 'fgfdg', '46', '444444', '2020-12-03', '2020-12-03', 5, NULL, 4, 4, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, 0, NULL, '2020-12-02 15:11:52', 2, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `bf_campaign_assignment`
--

CREATE TABLE `bf_campaign_assignment` (
  `id` int(11) NOT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `assigned_date` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bf_campaign_country`
--

CREATE TABLE `bf_campaign_country` (
  `id` int(11) NOT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bf_campaign_country`
--

INSERT INTO `bf_campaign_country` (`id`, `campaign_id`, `country_id`) VALUES
(1, 7, 1),
(5, 1, 1),
(6, 2, 1),
(7, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `bf_campaign_employee`
--

CREATE TABLE `bf_campaign_employee` (
  `id` int(11) NOT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bf_campaign_employee`
--

INSERT INTO `bf_campaign_employee` (`id`, `campaign_id`, `employee_id`) VALUES
(1, 5, 1),
(2, 7, 1),
(7, 1, 1),
(8, 6, 1),
(9, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `bf_campaign_external_supp`
--

CREATE TABLE `bf_campaign_external_supp` (
  `id` int(11) NOT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `table_name` varchar(50) DEFAULT NULL,
  `encryption_type` varchar(10) DEFAULT NULL,
  `field_type` varchar(10) DEFAULT NULL,
  `deleted` int(11) NOT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `batch` int(11) NOT NULL,
  `rowcount` int(11) NOT NULL,
  `file_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `bf_campaign_external_supp`
--

INSERT INTO `bf_campaign_external_supp` (`id`, `campaign_id`, `table_name`, `encryption_type`, `field_type`, `deleted`, `deleted_by`, `created_on`, `created_by`, `modified_on`, `modified_by`, `customer_id`, `batch`, `rowcount`, `file_name`) VALUES
(9, 5, '5domain', 'domain', 'none', 0, NULL, '2020-10-08 15:36:24', 2, NULL, NULL, 2, 95, 13, 'test - Copy.csv'),
(10, 5, '5email', 'email', 'none', 0, NULL, '2020-10-08 19:29:40', 2, NULL, NULL, 2, 97, 13, 'test - Copy.csv');

-- --------------------------------------------------------

--
-- Table structure for table `bf_campaign_grade`
--

CREATE TABLE `bf_campaign_grade` (
  `id` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `grade` varchar(32) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `deleted` int(1) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bf_campaign_grade`
--

INSERT INTO `bf_campaign_grade` (`id`, `name`, `grade`, `customer_id`, `deleted`, `deleted_by`, `created_on`, `created_by`, `modified_on`, `modified_by`) VALUES
(1, 'keshav', '1', 2, 1, NULL, '2020-09-17 01:12:33', NULL, NULL, NULL),
(2, 'keshav', 'Grade 1', 2, 1, NULL, '2020-09-17 01:12:33', NULL, NULL, NULL),
(3, 'keshavd', '1', 2, 1, NULL, '2020-09-17 01:12:33', NULL, NULL, NULL),
(4, 'keshavd', 'sads', 2, 1, NULL, '2020-09-19 17:52:05', NULL, NULL, NULL),
(5, 'Grade A', '', 2, 1, NULL, '2020-11-06 13:06:17', 2, NULL, NULL),
(6, 'first grade', 'Grade A', 2, 0, NULL, '2020-11-06 13:07:46', 2, '2020-11-07 14:02:27', 2),
(7, 'nam', 'asas', 2, 1, NULL, '2020-11-07 23:45:30', 2, NULL, NULL),
(8, 'nan', 'deewrerewr', 2, 1, NULL, '2020-11-09 10:57:37', 2, NULL, NULL),
(9, 'dasd', 'sdsdsd', 2, 1, NULL, '2020-11-09 10:58:09', 2, NULL, NULL),
(10, 'llll', 'jhjkhjkhkj', 2, 0, NULL, '2020-11-09 11:05:37', 2, NULL, NULL),
(11, 'aaaaaaaaaaaaaaa', 'sd', 2, 0, NULL, '2020-11-09 12:04:29', 2, NULL, NULL),
(12, 'demo one grade', 'second ', 2, 0, NULL, '2020-11-09 12:06:27', 2, '2020-11-09 12:11:46', 2),
(13, 'ttttttt', 'tytytytu', 2, 1, NULL, '2020-11-09 12:15:18', 2, NULL, NULL),
(14, 'asdsad', 'dsadsadd', 2, 0, NULL, '2020-11-09 12:17:44', 2, NULL, NULL),
(15, 'pppp', 'kk', 2, 0, NULL, '2020-11-09 13:23:22', 2, '2020-11-12 14:25:05', 2),
(16, 'h', 'tt', 2, 1, NULL, '2020-11-12 14:15:19', 2, NULL, NULL),
(17, 'ghgh', 'fghgh', 2, 0, NULL, '2020-11-12 14:16:04', 2, '2020-11-12 14:16:13', 2),
(18, 'fgfgfg', 'fg', 2, 0, NULL, '2020-11-12 14:24:15', 2, NULL, NULL),
(19, 'fsdfffdf', 'dfdfdfd', 2, 0, NULL, '2020-11-19 09:56:57', 2, NULL, NULL),
(20, 'other', 'new one', 2, 0, NULL, '2020-11-22 23:51:56', 2, NULL, NULL),
(21, 'sss', 'aaaaaa', 2, 0, NULL, '2020-11-23 10:07:15', 2, NULL, NULL),
(22, 'new1111', 'new one5555', 2, 0, NULL, '2020-11-24 13:27:22', 2, '2020-11-24 13:33:38', 2),
(23, 'fsdfsdf', 'dfsdf', 2, 0, NULL, '2020-11-28 18:33:41', 2, NULL, NULL),
(24, 'sadsad', 'dasdasdasd', 2, 0, NULL, '2020-11-28 18:35:01', 2, '2020-11-28 18:40:53', 2),
(25, 'today', 'todays', 2, 0, NULL, '2020-12-09 12:52:23', 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bf_campaign_industry`
--

CREATE TABLE `bf_campaign_industry` (
  `id` int(11) NOT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `industry_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bf_campaign_industry`
--

INSERT INTO `bf_campaign_industry` (`id`, `campaign_id`, `industry_id`) VALUES
(1, 7, 1),
(6, 1, 1),
(7, 2, 1),
(8, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `bf_campaign_jobfunction`
--

CREATE TABLE `bf_campaign_jobfunction` (
  `id` int(11) NOT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `job_function_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bf_campaign_jobfunction`
--

INSERT INTO `bf_campaign_jobfunction` (`id`, `campaign_id`, `job_function_id`) VALUES
(1, 5, 1),
(2, 7, 1),
(3, NULL, 1),
(4, NULL, 1),
(5, NULL, 1),
(6, 1, 1),
(7, 6, 1),
(8, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `bf_campaign_joblevel`
--

CREATE TABLE `bf_campaign_joblevel` (
  `id` int(11) NOT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `job_level_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bf_campaign_joblevel`
--

INSERT INTO `bf_campaign_joblevel` (`id`, `campaign_id`, `job_level_id`) VALUES
(17, 6, 1),
(18, 2, 2),
(22, 1, 2),
(25, 1, 1),
(26, 25, 1);

-- --------------------------------------------------------

--
-- Table structure for table `bf_campaign_nic`
--

CREATE TABLE `bf_campaign_nic` (
  `id` int(11) NOT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `nic_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `bf_campaign_nic`
--

INSERT INTO `bf_campaign_nic` (`id`, `campaign_id`, `nic_id`) VALUES
(1, 7, 1),
(2, 6, 1),
(3, 6, 1),
(4, 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `bf_campaign_pacing`
--

CREATE TABLE `bf_campaign_pacing` (
  `id` int(11) NOT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `lead_count` int(11) NOT NULL DEFAULT 0,
  `deleted` int(11) NOT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bf_campaign_pacing`
--

INSERT INTO `bf_campaign_pacing` (`id`, `campaign_id`, `start_date`, `end_date`, `lead_count`, `deleted`, `deleted_by`, `created_on`, `created_by`, `modified_on`, `modified_by`) VALUES
(1, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 23, 0, NULL, '0000-00-00 00:00:00', NULL, NULL, NULL),
(2, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 23, 0, NULL, '2020-09-22 19:27:03', NULL, NULL, NULL),
(3, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 23, 0, NULL, '2020-09-22 19:27:33', NULL, NULL, NULL),
(4, NULL, '2020-09-21 18:30:00', '0000-00-00 00:00:00', 23, 0, NULL, '2020-09-22 19:29:01', NULL, NULL, NULL),
(5, NULL, '2020-09-14 06:00:00', '0000-00-00 00:00:00', 23, 0, NULL, '2020-09-22 19:29:58', NULL, NULL, NULL),
(6, NULL, '2020-09-14 06:00:00', '2020-10-20 12:30:00', 23, 0, NULL, '2020-09-22 19:30:27', NULL, NULL, NULL),
(7, NULL, '2020-09-14 06:00:00', '2020-10-20 12:30:00', 23, 0, NULL, '2020-09-22 19:31:34', 2, NULL, NULL),
(10, 6, '2020-09-18 02:30:00', '2020-10-21 13:30:00', 20, 0, NULL, '2020-09-22 20:08:41', 2, NULL, NULL),
(11, 6, '2020-09-18 02:30:00', '2020-10-21 13:30:00', 20, 0, NULL, '2020-09-22 20:09:07', 2, NULL, NULL),
(12, 1, '2020-09-22 18:30:00', '2020-09-23 18:30:00', 10, 0, NULL, '2020-09-22 20:43:46', 2, '2020-09-27 21:29:48', 2),
(13, 1, '2020-09-22 18:30:00', '2020-09-23 18:30:00', 34, 0, NULL, '2020-09-22 21:26:35', 2, '2020-09-27 21:30:00', 2),
(18, 6, '2020-09-27 18:30:00', '2020-09-28 18:29:00', 4, 0, NULL, '2020-09-28 17:35:39', 2, NULL, NULL),
(19, 6, '2020-09-27 18:30:00', '2020-09-28 18:29:00', 55, 0, NULL, '2020-09-28 19:00:58', 2, NULL, NULL),
(20, 5, '2020-09-30 18:30:00', '2020-10-01 18:29:00', 55, 0, NULL, '2020-10-01 00:40:58', 2, NULL, NULL),
(21, 5, '2020-10-06 18:30:00', '2020-10-07 18:29:00', 33, 0, NULL, '2020-10-07 10:04:13', 2, NULL, NULL),
(22, 1, '2020-10-10 18:30:00', '2020-10-11 18:29:00', 0, 0, NULL, '2020-10-11 20:10:53', 2, NULL, NULL),
(23, 1, '2020-10-10 18:30:00', '2020-10-11 18:29:00', 22, 0, NULL, '2020-10-11 20:11:04', 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bf_campaign_reasons`
--

CREATE TABLE `bf_campaign_reasons` (
  `id` int(11) NOT NULL,
  `reason` varchar(200) DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT 0,
  `created_by` tinyint(4) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `modified_by` tinyint(4) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bf_campaign_reasons`
--

INSERT INTO `bf_campaign_reasons` (`id`, `reason`, `customer_id`, `deleted`, `created_by`, `created_on`, `modified_by`, `modified_on`) VALUES
(1, 'abc', 2, 0, 2, '2020-11-26 17:05:11', NULL, NULL),
(2, 'sdfdf', 2, 0, 2, '2020-11-26 17:11:32', 2, '2020-11-26 17:19:35'),
(3, 'd', 2, 0, 2, '2020-12-09 13:09:13', 2, '2020-12-09 13:09:29');

-- --------------------------------------------------------

--
-- Table structure for table `bf_campaign_revenue`
--

CREATE TABLE `bf_campaign_revenue` (
  `id` int(11) NOT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `revenue_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bf_campaign_revenue`
--

INSERT INTO `bf_campaign_revenue` (`id`, `campaign_id`, `revenue_id`) VALUES
(1, 7, 1),
(5, 1, 1),
(6, 5, 1),
(7, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `bf_campaign_sic`
--

CREATE TABLE `bf_campaign_sic` (
  `id` int(11) NOT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `sic_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `bf_campaign_sic`
--

INSERT INTO `bf_campaign_sic` (`id`, `campaign_id`, `sic_id`) VALUES
(1, 7, 1),
(2, 6, 1),
(3, 6, 1),
(4, 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `bf_campaign_technology`
--

CREATE TABLE `bf_campaign_technology` (
  `id` int(11) NOT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `technology_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bf_campaign_type`
--

CREATE TABLE `bf_campaign_type` (
  `id` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bf_campaign_type`
--

INSERT INTO `bf_campaign_type` (`id`, `name`, `customer_id`, `deleted`, `deleted_by`, `created_on`, `created_by`, `modified_on`, `modified_by`) VALUES
(1, 'Tet', NULL, 0, NULL, '2020-09-19 09:03:14', NULL, NULL, NULL),
(2, 'test', NULL, 0, NULL, '2020-09-19 09:03:56', NULL, NULL, NULL),
(3, 'abc112', 2, 0, NULL, '2020-11-06 15:19:22', 2, '2020-11-07 23:50:12', 2),
(4, 'test 2', 2, 0, NULL, '2020-11-07 23:51:20', 2, NULL, NULL),
(5, 'aaaaa', 2, 0, NULL, '2020-11-09 12:55:12', 2, NULL, NULL),
(6, 'first second', 2, 0, NULL, '2020-11-09 12:56:44', 2, '2020-11-09 13:04:08', 2),
(7, 'abc demo s', 2, 0, NULL, '2020-11-09 13:04:20', 2, NULL, NULL),
(8, 'new campaign type demo', 2, 0, NULL, '2020-11-22 23:56:18', 2, NULL, NULL),
(9, 'sssssssss', 2, 0, NULL, '2020-11-24 14:24:46', 2, '2020-11-24 14:25:00', 2),
(10, 'sas', 2, 0, NULL, '2020-11-28 18:26:33', 2, NULL, NULL),
(11, 'hhfhfghfghhfghf', 2, 0, NULL, '2020-11-30 11:30:37', 2, NULL, NULL),
(12, 'jghjgh', 2, 0, NULL, '2020-11-30 12:21:31', 2, NULL, NULL),
(13, 'sadsdsdsdsdd', 2, 0, NULL, '2020-12-09 12:48:23', 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bf_campaign_user`
--

CREATE TABLE `bf_campaign_user` (
  `id` int(11) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `deleted` int(4) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bf_campaign_user`
--

INSERT INTO `bf_campaign_user` (`id`, `group_id`, `user_id`, `deleted`, `deleted_by`, `created_on`, `created_by`, `customer_id`, `modified_on`, `modified_by`) VALUES
(1, 1, 2, 0, NULL, '2020-12-01 12:01:10', NULL, 2, NULL, NULL),
(2, 4, 2, 0, NULL, '2020-12-01 17:28:20', 2, 2, NULL, NULL),
(3, 3, 2, 0, NULL, '2020-12-01 17:33:47', 2, 2, NULL, NULL),
(4, 3, 41, 0, NULL, '2020-12-01 18:39:41', 2, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bf_campaign_user_allow_status`
--

CREATE TABLE `bf_campaign_user_allow_status` (
  `id` int(11) NOT NULL,
  `campaign_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `allowed_status` varchar(250) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bf_campaign_user_allow_status`
--

INSERT INTO `bf_campaign_user_allow_status` (`id`, `campaign_id`, `group_id`, `customer_id`, `allowed_status`, `created_date`) VALUES
(1, 1, 4, 2, '1', '2020-12-01 18:11:25'),
(2, 1, 1, 2, '1', '2020-12-01 18:24:12'),
(3, 1, 3, 2, '1', '2020-12-01 18:24:25'),
(4, 25, 2, 2, '1', '2020-12-02 10:56:25'),
(5, 25, 1, 2, '1', '2020-12-02 11:03:27'),
(6, 1, 5, 2, '1', '2020-12-09 16:04:00');

-- --------------------------------------------------------

--
-- Table structure for table `bf_campaign_user_group`
--

CREATE TABLE `bf_campaign_user_group` (
  `id` int(11) NOT NULL,
  `group_name` varchar(50) DEFAULT NULL,
  `deleted` int(11) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `allowed_status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bf_campaign_user_group`
--

INSERT INTO `bf_campaign_user_group` (`id`, `group_name`, `deleted`, `deleted_by`, `created_on`, `created_by`, `modified_on`, `modified_by`, `customer_id`, `allowed_status`) VALUES
(1, 'fdssdsf', 0, NULL, '2020-09-23 02:08:17', NULL, NULL, NULL, 2, 1),
(2, 'test2', 0, NULL, '2020-09-23 18:52:12', NULL, NULL, NULL, 2, 1),
(3, 'demos', 0, NULL, '2020-12-01 15:14:14', 2, NULL, NULL, 2, 0),
(4, 'cs', 0, NULL, '2020-12-01 15:15:50', 2, NULL, NULL, 2, 0),
(5, 'tttttttttt', 0, NULL, '2020-12-09 13:16:14', 2, NULL, NULL, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `bf_campaign_user_group_access`
--

CREATE TABLE `bf_campaign_user_group_access` (
  `id` int(11) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `deleted` int(11) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bf_campaign_user_group_access`
--

INSERT INTO `bf_campaign_user_group_access` (`id`, `group_id`, `campaign_id`, `deleted`, `deleted_by`, `created_on`, `created_by`, `customer_id`, `modified_on`, `modified_by`) VALUES
(1, 4, 1, 0, NULL, '2020-12-01 18:11:25', NULL, 2, NULL, NULL),
(2, 1, 1, 0, NULL, '2020-12-01 18:24:11', NULL, 2, NULL, NULL),
(3, 3, 1, 0, NULL, '2020-12-01 18:24:25', NULL, 2, NULL, NULL),
(5, 1, 25, 0, NULL, '2020-12-02 11:03:27', NULL, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bf_ci3_sessions`
--

CREATE TABLE `bf_ci3_sessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bf_ci3_sessions`
--

INSERT INTO `bf_ci3_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('11gjs0nl7ontkrv06sn9q004n5bm8t8f', '::1', 1607508951, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630373530383935313b),
('24ffgb4v6mmko0chumqsd9olibnet3s7', '::1', 1607514715, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630373531343731353b69736c6f67676564696e7c623a313b757365726e616d657c733a343a22766f6970223b656d61696c207c733a32323a2268656d617368696e6465393040676d61696c2e636f6d223b69647c733a313a2232223b726f6c655f69647c733a313a2232223b64657369676e6174696f6e7c733a333a22767066223b6465736372697074696f6e7c733a33343a22546865204445534320636f6d6d616e202068686a67206a686768676a676a66666666223b70726f66696c655f75726c7c733a39363a22687474703a2f2f6c6f63616c686f73742f676974782f2f7265736f75726365732f75706c6f6164732f50726f66696c652f323032302f31312f32342f34663532356339663661323739643730636562326161653166316131386363342e706e67223b637573746f6d65725f69647c733a313a2232223b),
('24lil6abja4t3slis6qk70r093mbps65', '::1', 1607496763, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630373439363736333b69736c6f67676564696e7c623a313b757365726e616d657c733a343a22766f6970223b656d61696c207c733a32323a2268656d617368696e6465393040676d61696c2e636f6d223b69647c733a313a2232223b726f6c655f69647c733a313a2232223b64657369676e6174696f6e7c733a333a22767066223b6465736372697074696f6e7c733a33343a22546865204445534320636f6d6d616e202068686a67206a686768676a676a66666666223b70726f66696c655f75726c7c733a39363a22687474703a2f2f6c6f63616c686f73742f676974782f2f7265736f75726365732f75706c6f6164732f50726f66696c652f323032302f31312f32342f34663532356339663661323739643730636562326161653166316131386363342e706e67223b637573746f6d65725f69647c733a313a2232223b),
('4c9vm7ci4tln21cuv41ucje0hjqe8knf', '::1', 1607499510, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630373439393531303b69736c6f67676564696e7c623a313b757365726e616d657c733a343a22766f6970223b656d61696c207c733a32323a2268656d617368696e6465393040676d61696c2e636f6d223b69647c733a313a2232223b726f6c655f69647c733a313a2232223b64657369676e6174696f6e7c733a333a22767066223b6465736372697074696f6e7c733a33343a22546865204445534320636f6d6d616e202068686a67206a686768676a676a66666666223b70726f66696c655f75726c7c733a39363a22687474703a2f2f6c6f63616c686f73742f676974782f2f7265736f75726365732f75706c6f6164732f50726f66696c652f323032302f31312f32342f34663532356339663661323739643730636562326161653166316131386363342e706e67223b637573746f6d65725f69647c733a313a2232223b),
('5s39k57jbgkiuttc7mi6qif070m4i3ms', '::1', 1607506933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630373530363933333b),
('6f85saopso7tf8u4hon3ii1thib5ebhn', '::1', 1607507585, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630373530373538353b69736c6f67676564696e7c623a313b757365726e616d657c733a343a22766f6970223b656d61696c207c733a32323a2268656d617368696e6465393040676d61696c2e636f6d223b69647c733a313a2232223b726f6c655f69647c733a313a2232223b64657369676e6174696f6e7c733a333a22767066223b6465736372697074696f6e7c733a33343a22546865204445534320636f6d6d616e202068686a67206a686768676a676a66666666223b70726f66696c655f75726c7c733a39363a22687474703a2f2f6c6f63616c686f73742f676974782f2f7265736f75726365732f75706c6f6164732f50726f66696c652f323032302f31312f32342f34663532356339663661323739643730636562326161653166316131386363342e706e67223b637573746f6d65725f69647c733a313a2232223b),
('7d3ul0123jnnl8959f6vi493obe754vo', '::1', 1607495362, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630373439353336323b69736c6f67676564696e7c623a313b757365726e616d657c733a343a22766f6970223b656d61696c207c733a32323a2268656d617368696e6465393040676d61696c2e636f6d223b69647c733a313a2232223b726f6c655f69647c733a313a2232223b64657369676e6174696f6e7c733a333a22767066223b6465736372697074696f6e7c733a33343a22546865204445534320636f6d6d616e202068686a67206a686768676a676a66666666223b70726f66696c655f75726c7c733a39363a22687474703a2f2f6c6f63616c686f73742f676974782f2f7265736f75726365732f75706c6f6164732f50726f66696c652f323032302f31312f32342f34663532356339663661323739643730636562326161653166316131386363342e706e67223b637573746f6d65725f69647c733a313a2232223b),
('978km01upvd8dq0q3i718sogpov6p235', '::1', 1607498100, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630373439383130303b69736c6f67676564696e7c623a313b757365726e616d657c733a343a22766f6970223b656d61696c207c733a32323a2268656d617368696e6465393040676d61696c2e636f6d223b69647c733a313a2232223b726f6c655f69647c733a313a2232223b64657369676e6174696f6e7c733a333a22767066223b6465736372697074696f6e7c733a33343a22546865204445534320636f6d6d616e202068686a67206a686768676a676a66666666223b70726f66696c655f75726c7c733a39363a22687474703a2f2f6c6f63616c686f73742f676974782f2f7265736f75726365732f75706c6f6164732f50726f66696c652f323032302f31312f32342f34663532356339663661323739643730636562326161653166316131386363342e706e67223b637573746f6d65725f69647c733a313a2232223b),
('a94rk2on1bs9fmi8e2na3sis0gb341d5', '::1', 1607493397, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630373439333339373b69736c6f67676564696e7c623a313b757365726e616d657c733a343a22766f6970223b656d61696c207c733a32323a2268656d617368696e6465393040676d61696c2e636f6d223b69647c733a313a2232223b726f6c655f69647c733a313a2232223b64657369676e6174696f6e7c733a333a22767066223b6465736372697074696f6e7c733a33343a22546865204445534320636f6d6d616e202068686a67206a686768676a676a66666666223b70726f66696c655f75726c7c733a39363a22687474703a2f2f6c6f63616c686f73742f676974782f2f7265736f75726365732f75706c6f6164732f50726f66696c652f323032302f31312f32342f34663532356339663661323739643730636562326161653166316131386363342e706e67223b637573746f6d65725f69647c733a313a2232223b),
('albdmvacvr23scp5qg2d0avll3nnkogm', '::1', 1607509819, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630373530393831393b69736c6f67676564696e7c623a313b757365726e616d657c733a343a22766f6970223b656d61696c207c733a32323a2268656d617368696e6465393040676d61696c2e636f6d223b69647c733a313a2232223b726f6c655f69647c733a313a2232223b64657369676e6174696f6e7c733a333a22767066223b6465736372697074696f6e7c733a33343a22546865204445534320636f6d6d616e202068686a67206a686768676a676a66666666223b70726f66696c655f75726c7c733a39363a22687474703a2f2f6c6f63616c686f73742f676974782f2f7265736f75726365732f75706c6f6164732f50726f66696c652f323032302f31312f32342f34663532356339663661323739643730636562326161653166316131386363342e706e67223b637573746f6d65725f69647c733a313a2232223b),
('b1714v47du7qdp8eahts1gn2r4c4lucq', '::1', 1607507252, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630373530373235323b),
('bvlaigr1d2bqt0salo3cqkrp3kbh2j89', '::1', 1607499868, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630373439393836383b69736c6f67676564696e7c623a313b757365726e616d657c733a343a22766f6970223b656d61696c207c733a32323a2268656d617368696e6465393040676d61696c2e636f6d223b69647c733a313a2232223b726f6c655f69647c733a313a2232223b64657369676e6174696f6e7c733a333a22767066223b6465736372697074696f6e7c733a33343a22546865204445534320636f6d6d616e202068686a67206a686768676a676a66666666223b70726f66696c655f75726c7c733a39363a22687474703a2f2f6c6f63616c686f73742f676974782f2f7265736f75726365732f75706c6f6164732f50726f66696c652f323032302f31312f32342f34663532356339663661323739643730636562326161653166316131386363342e706e67223b637573746f6d65725f69647c733a313a2232223b),
('denm7n8cvo7o7hvs9r2hktl4irsfah2o', '::1', 1607497102, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630373439373130323b69736c6f67676564696e7c623a313b757365726e616d657c733a343a22766f6970223b656d61696c207c733a32323a2268656d617368696e6465393040676d61696c2e636f6d223b69647c733a313a2232223b726f6c655f69647c733a313a2232223b64657369676e6174696f6e7c733a333a22767066223b6465736372697074696f6e7c733a33343a22546865204445534320636f6d6d616e202068686a67206a686768676a676a66666666223b70726f66696c655f75726c7c733a39363a22687474703a2f2f6c6f63616c686f73742f676974782f2f7265736f75726365732f75706c6f6164732f50726f66696c652f323032302f31312f32342f34663532356339663661323739643730636562326161653166316131386363342e706e67223b637573746f6d65725f69647c733a313a2232223b),
('evcd7n02qqf5oalgd7td2st701h74vc7', '::1', 1607500306, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630373530303330363b69736c6f67676564696e7c623a313b757365726e616d657c733a343a22766f6970223b656d61696c207c733a32323a2268656d617368696e6465393040676d61696c2e636f6d223b69647c733a313a2232223b726f6c655f69647c733a313a2232223b64657369676e6174696f6e7c733a333a22767066223b6465736372697074696f6e7c733a33343a22546865204445534320636f6d6d616e202068686a67206a686768676a676a66666666223b70726f66696c655f75726c7c733a39363a22687474703a2f2f6c6f63616c686f73742f676974782f2f7265736f75726365732f75706c6f6164732f50726f66696c652f323032302f31312f32342f34663532356339663661323739643730636562326161653166316131386363342e706e67223b637573746f6d65725f69647c733a313a2232223b),
('evtgof3h7bvjvud4gdhj4ktsdpr409f1', '::1', 1607498821, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630373439383832313b69736c6f67676564696e7c623a313b757365726e616d657c733a343a22766f6970223b656d61696c207c733a32323a2268656d617368696e6465393040676d61696c2e636f6d223b69647c733a313a2232223b726f6c655f69647c733a313a2232223b64657369676e6174696f6e7c733a333a22767066223b6465736372697074696f6e7c733a33343a22546865204445534320636f6d6d616e202068686a67206a686768676a676a66666666223b70726f66696c655f75726c7c733a39363a22687474703a2f2f6c6f63616c686f73742f676974782f2f7265736f75726365732f75706c6f6164732f50726f66696c652f323032302f31312f32342f34663532356339663661323739643730636562326161653166316131386363342e706e67223b637573746f6d65725f69647c733a313a2232223b),
('grkm8djiloj6d68fvbj2ukvlvglnkon8', '::1', 1607500859, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630373530303835393b69736c6f67676564696e7c623a313b757365726e616d657c733a343a22766f6970223b656d61696c207c733a32323a2268656d617368696e6465393040676d61696c2e636f6d223b69647c733a313a2232223b726f6c655f69647c733a313a2232223b64657369676e6174696f6e7c733a333a22767066223b6465736372697074696f6e7c733a33343a22546865204445534320636f6d6d616e202068686a67206a686768676a676a66666666223b70726f66696c655f75726c7c733a39363a22687474703a2f2f6c6f63616c686f73742f676974782f2f7265736f75726365732f75706c6f6164732f50726f66696c652f323032302f31312f32342f34663532356339663661323739643730636562326161653166316131386363342e706e67223b637573746f6d65725f69647c733a313a2232223b),
('h6rebgtnd930a0koq9pt48dlbilarajq', '::1', 1607509394, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630373530393339343b69736c6f67676564696e7c623a313b757365726e616d657c733a343a22766f6970223b656d61696c207c733a32323a2268656d617368696e6465393040676d61696c2e636f6d223b69647c733a313a2232223b726f6c655f69647c733a313a2232223b64657369676e6174696f6e7c733a333a22767066223b6465736372697074696f6e7c733a33343a22546865204445534320636f6d6d616e202068686a67206a686768676a676a66666666223b70726f66696c655f75726c7c733a39363a22687474703a2f2f6c6f63616c686f73742f676974782f2f7265736f75726365732f75706c6f6164732f50726f66696c652f323032302f31312f32342f34663532356339663661323739643730636562326161653166316131386363342e706e67223b637573746f6d65725f69647c733a313a2232223b),
('icano6j5qhlkemrronbk6tbrcvgf2g4q', '::1', 1607513255, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630373531333234353b69736c6f67676564696e7c623a313b757365726e616d657c733a343a22766f6970223b656d61696c207c733a32323a2268656d617368696e6465393040676d61696c2e636f6d223b69647c733a313a2232223b726f6c655f69647c733a313a2232223b64657369676e6174696f6e7c733a333a22767066223b6465736372697074696f6e7c733a33343a22546865204445534320636f6d6d616e202068686a67206a686768676a676a66666666223b70726f66696c655f75726c7c733a39363a22687474703a2f2f6c6f63616c686f73742f676974782f2f7265736f75726365732f75706c6f6164732f50726f66696c652f323032302f31312f32342f34663532356339663661323739643730636562326161653166316131386363342e706e67223b637573746f6d65725f69647c733a313a2232223b),
('j9fk54s4c8r79muq8589r0g7mjqj3s9q', '::1', 1607493915, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630373439333931353b69736c6f67676564696e7c623a313b757365726e616d657c733a343a22766f6970223b656d61696c207c733a32323a2268656d617368696e6465393040676d61696c2e636f6d223b69647c733a313a2232223b726f6c655f69647c733a313a2232223b64657369676e6174696f6e7c733a333a22767066223b6465736372697074696f6e7c733a33343a22546865204445534320636f6d6d616e202068686a67206a686768676a676a66666666223b70726f66696c655f75726c7c733a39363a22687474703a2f2f6c6f63616c686f73742f676974782f2f7265736f75726365732f75706c6f6164732f50726f66696c652f323032302f31312f32342f34663532356339663661323739643730636562326161653166316131386363342e706e67223b637573746f6d65725f69647c733a313a2232223b),
('jq4dnp9uah11rcpao7tr3o38h4t8tvbj', '::1', 1607494996, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630373439343939363b69736c6f67676564696e7c623a313b757365726e616d657c733a343a22766f6970223b656d61696c207c733a32323a2268656d617368696e6465393040676d61696c2e636f6d223b69647c733a313a2232223b726f6c655f69647c733a313a2232223b64657369676e6174696f6e7c733a333a22767066223b6465736372697074696f6e7c733a33343a22546865204445534320636f6d6d616e202068686a67206a686768676a676a66666666223b70726f66696c655f75726c7c733a39363a22687474703a2f2f6c6f63616c686f73742f676974782f2f7265736f75726365732f75706c6f6164732f50726f66696c652f323032302f31312f32342f34663532356339663661323739643730636562326161653166316131386363342e706e67223b637573746f6d65725f69647c733a313a2232223b),
('jsgogi77icmr098su3jl9fr57d0d4mj2', '::1', 1607508024, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630373530383032343b),
('jtu75t1r58g6ha7truh3v307frfl26is', '::1', 1607499184, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630373439393138343b69736c6f67676564696e7c623a313b757365726e616d657c733a343a22766f6970223b656d61696c207c733a32323a2268656d617368696e6465393040676d61696c2e636f6d223b69647c733a313a2232223b726f6c655f69647c733a313a2232223b64657369676e6174696f6e7c733a333a22767066223b6465736372697074696f6e7c733a33343a22546865204445534320636f6d6d616e202068686a67206a686768676a676a66666666223b70726f66696c655f75726c7c733a39363a22687474703a2f2f6c6f63616c686f73742f676974782f2f7265736f75726365732f75706c6f6164732f50726f66696c652f323032302f31312f32342f34663532356339663661323739643730636562326161653166316131386363342e706e67223b637573746f6d65725f69647c733a313a2232223b),
('m7mieg3fdg6inhk98trtbs00alja210f', '::1', 1607495922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630373439353932323b69736c6f67676564696e7c623a313b757365726e616d657c733a343a22766f6970223b656d61696c207c733a32323a2268656d617368696e6465393040676d61696c2e636f6d223b69647c733a313a2232223b726f6c655f69647c733a313a2232223b64657369676e6174696f6e7c733a333a22767066223b6465736372697074696f6e7c733a33343a22546865204445534320636f6d6d616e202068686a67206a686768676a676a66666666223b70726f66696c655f75726c7c733a39363a22687474703a2f2f6c6f63616c686f73742f676974782f2f7265736f75726365732f75706c6f6164732f50726f66696c652f323032302f31312f32342f34663532356339663661323739643730636562326161653166316131386363342e706e67223b637573746f6d65725f69647c733a313a2232223b),
('nd6a3asv8k9hsu7af5s61kh0oiv3qlc3', '::1', 1607506618, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630373530363631383b),
('nds9c40v1jukhqt3bbfe4ob9alkooqj9', '::1', 1607506091, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630373530363039313b),
('ov0541b5hc3728928hto2jber9vr877h', '::1', 1607492235, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630373439323233303b69736c6f67676564696e7c623a313b757365726e616d657c733a343a22766f6970223b656d61696c207c733a32323a2268656d617368696e6465393040676d61696c2e636f6d223b69647c733a313a2232223b726f6c655f69647c733a313a2232223b64657369676e6174696f6e7c733a333a22767066223b6465736372697074696f6e7c733a33343a22546865204445534320636f6d6d616e202068686a67206a686768676a676a66666666223b70726f66696c655f75726c7c733a39363a22687474703a2f2f6c6f63616c686f73742f676974782f2f7265736f75726365732f75706c6f6164732f50726f66696c652f323032302f31312f32342f34663532356339663661323739643730636562326161653166316131386363342e706e67223b637573746f6d65725f69647c733a313a2232223b),
('p959e7ptef4tohj5lacj6epinukccass', '::1', 1607505776, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630373530353737363b69736c6f67676564696e7c623a313b757365726e616d657c733a343a22766f6970223b656d61696c207c733a32323a2268656d617368696e6465393040676d61696c2e636f6d223b69647c733a313a2232223b726f6c655f69647c733a313a2232223b64657369676e6174696f6e7c733a333a22767066223b6465736372697074696f6e7c733a33343a22546865204445534320636f6d6d616e202068686a67206a686768676a676a66666666223b70726f66696c655f75726c7c733a39363a22687474703a2f2f6c6f63616c686f73742f676974782f2f7265736f75726365732f75706c6f6164732f50726f66696c652f323032302f31312f32342f34663532356339663661323739643730636562326161653166316131386363342e706e67223b637573746f6d65725f69647c733a313a2232223b),
('reqmu78u02eufvrsghqtfrqs7nk0gr6h', '::1', 1607492695, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630373439323639353b69736c6f67676564696e7c623a313b757365726e616d657c733a343a22766f6970223b656d61696c207c733a32323a2268656d617368696e6465393040676d61696c2e636f6d223b69647c733a313a2232223b726f6c655f69647c733a313a2232223b64657369676e6174696f6e7c733a333a22767066223b6465736372697074696f6e7c733a33343a22546865204445534320636f6d6d616e202068686a67206a686768676a676a66666666223b70726f66696c655f75726c7c733a39363a22687474703a2f2f6c6f63616c686f73742f676974782f2f7265736f75726365732f75706c6f6164732f50726f66696c652f323032302f31312f32342f34663532356339663661323739643730636562326161653166316131386363342e706e67223b637573746f6d65725f69647c733a313a2232223b),
('rucs5hkb6vuucc286vtr3v5reacl4k84', '::1', 1607508565, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630373530383536353b),
('sfk1b621l0b99kukoe6hod37mula3unl', '::1', 1607514722, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630373531343731353b69736c6f67676564696e7c623a313b757365726e616d657c733a343a22766f6970223b656d61696c207c733a32323a2268656d617368696e6465393040676d61696c2e636f6d223b69647c733a313a2232223b726f6c655f69647c733a313a2232223b64657369676e6174696f6e7c733a333a22767066223b6465736372697074696f6e7c733a33343a22546865204445534320636f6d6d616e202068686a67206a686768676a676a66666666223b70726f66696c655f75726c7c733a39363a22687474703a2f2f6c6f63616c686f73742f676974782f2f7265736f75726365732f75706c6f6164732f50726f66696c652f323032302f31312f32342f34663532356339663661323739643730636562326161653166316131386363342e706e67223b637573746f6d65725f69647c733a313a2232223b),
('slua1sg96a8b3he0ojco48edrkn23lfc', '::1', 1607493060, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630373439333036303b69736c6f67676564696e7c623a313b757365726e616d657c733a343a22766f6970223b656d61696c207c733a32323a2268656d617368696e6465393040676d61696c2e636f6d223b69647c733a313a2232223b726f6c655f69647c733a313a2232223b64657369676e6174696f6e7c733a333a22767066223b6465736372697074696f6e7c733a33343a22546865204445534320636f6d6d616e202068686a67206a686768676a676a66666666223b70726f66696c655f75726c7c733a39363a22687474703a2f2f6c6f63616c686f73742f676974782f2f7265736f75726365732f75706c6f6164732f50726f66696c652f323032302f31312f32342f34663532356339663661323739643730636562326161653166316131386363342e706e67223b637573746f6d65725f69647c733a313a2232223b),
('u1gt11lqthv8l4mdmjdgvrbthbca2v1e', '::1', 1607498514, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630373439383531343b69736c6f67676564696e7c623a313b757365726e616d657c733a343a22766f6970223b656d61696c207c733a32323a2268656d617368696e6465393040676d61696c2e636f6d223b69647c733a313a2232223b726f6c655f69647c733a313a2232223b64657369676e6174696f6e7c733a333a22767066223b6465736372697074696f6e7c733a33343a22546865204445534320636f6d6d616e202068686a67206a686768676a676a66666666223b70726f66696c655f75726c7c733a39363a22687474703a2f2f6c6f63616c686f73742f676974782f2f7265736f75726365732f75706c6f6164732f50726f66696c652f323032302f31312f32342f34663532356339663661323739643730636562326161653166316131386363342e706e67223b637573746f6d65725f69647c733a313a2232223b),
('vhf3bgidf4v5qrr3o6n2eaijpakb2otn', '::1', 1607496431, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630373439363433313b69736c6f67676564696e7c623a313b757365726e616d657c733a343a22766f6970223b656d61696c207c733a32323a2268656d617368696e6465393040676d61696c2e636f6d223b69647c733a313a2232223b726f6c655f69647c733a313a2232223b64657369676e6174696f6e7c733a333a22767066223b6465736372697074696f6e7c733a33343a22546865204445534320636f6d6d616e202068686a67206a686768676a676a66666666223b70726f66696c655f75726c7c733a39363a22687474703a2f2f6c6f63616c686f73742f676974782f2f7265736f75726365732f75706c6f6164732f50726f66696c652f323032302f31312f32342f34663532356339663661323739643730636562326161653166316131386363342e706e67223b637573746f6d65725f69647c733a313a2232223b);

-- --------------------------------------------------------

--
-- Table structure for table `bf_city`
--

CREATE TABLE `bf_city` (
  `id` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bf_clients`
--

CREATE TABLE `bf_clients` (
  `id` int(11) NOT NULL,
  `client_name` varchar(100) DEFAULT NULL,
  `alias_name` varchar(100) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bf_client_rejection`
--

CREATE TABLE `bf_client_rejection` (
  `id` int(11) NOT NULL,
  `campaign_id` int(11) NOT NULL,
  `prospect_id` int(11) NOT NULL,
  `email` varchar(200) DEFAULT NULL,
  `rejection_reason` text DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `rejection_date` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` tinyint(4) NOT NULL,
  `customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bf_client_rejection`
--

INSERT INTO `bf_client_rejection` (`id`, `campaign_id`, `prospect_id`, `email`, `rejection_reason`, `notes`, `rejection_date`, `created_by`, `customer_id`) VALUES
(1, 13, 1, 'hema@gmail.com', 'ABC', 'sasds', '2020-11-26 11:03:21', 2, 2),
(2, 13, 1, 'hema@gmail.com', 'ABC', 'testing', '2020-11-26 11:06:26', 2, 2),
(3, 13, 1, 'hema@gmail.com', 'ABC', 'testing demo purpose', '2020-11-26 11:11:38', 2, 2),
(4, 13, 1, 'hema@gmail.com', 'ABC', 'test', '2020-11-26 12:09:53', 2, 2),
(5, 13, 1, 'hema@gmail.com', 'ABC', 'kkkk', '2020-11-26 13:02:14', 2, 2),
(6, 13, 1, 'hema@gmail.com', 'Query', 'sdsdsdsd', '2020-11-26 16:25:44', 2, 2),
(7, 13, 1, 'hema@gmail.com', 'Query', 'sdsdsdsd', '2020-11-26 16:26:31', 2, 2),
(8, 13, 1, 'hema@gmail.com', 'Query', 'aaa', '2020-11-26 16:29:10', 2, 2),
(9, 13, 1, 'hema@gmail.com', 'Query', 'sasas', '2020-11-26 17:39:31', 2, 2),
(10, 13, 1, 'hema@gmail.com', 'abc', 'dsadsdd', '2020-11-28 15:06:12', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `bf_companies`
--

CREATE TABLE `bf_companies` (
  `id` int(11) NOT NULL,
  `Name` varchar(128) DEFAULT NULL,
  `Revenue_id` int(11) DEFAULT NULL,
  `SIC_Code_id` varchar(150) DEFAULT NULL,
  `NIC_Code_id` varchar(150) DEFAULT NULL,
  `Primary_Domain` int(11) DEFAULT NULL,
  `Employee_Size_id` int(11) DEFAULT NULL,
  `Industry_Type_id` int(11) DEFAULT NULL,
  `Additioal_Attributes_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime NOT NULL DEFAULT current_timestamp(),
  `modified_by` bigint(20) DEFAULT NULL,
  `country` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `city` varchar(50) NOT NULL,
  `zip` varchar(15) DEFAULT NULL,
  `company_src` varchar(500) DEFAULT NULL,
  `revenue_link` varchar(355) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bf_companies`
--

INSERT INTO `bf_companies` (`id`, `Name`, `Revenue_id`, `SIC_Code_id`, `NIC_Code_id`, `Primary_Domain`, `Employee_Size_id`, `Industry_Type_id`, `Additioal_Attributes_id`, `customer_id`, `deleted`, `deleted_by`, `created_on`, `created_by`, `modified_on`, `modified_by`, `country`, `state`, `city`, `zip`, `company_src`, `revenue_link`) VALUES
(1, 'Test', 2, '1', '1', 1, 1, 1, 1, NULL, 0, NULL, '2020-09-05 16:54:19', 1, '2020-09-05 17:04:20', 1, 0, 0, '', '0', '', ''),
(2, 'Test', 22, '1', '1', 1, 1, 1, 1, NULL, 0, NULL, '2020-09-05 16:56:27', 1, '2020-09-05 17:04:32', 1, 0, 0, '', '0', '', ''),
(3, 'sds', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2020-09-05 18:35:13', 1, '2020-09-05 18:35:13', 1, 0, 0, '', '0', '', ''),
(4, 'sds', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2020-09-05 18:35:19', 1, '2020-09-05 18:35:19', 1, 0, 0, '', '0', '', ''),
(5, 'jj', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2020-09-05 18:50:54', 1, '2020-09-05 18:50:54', 1, 0, 0, '', '0', '', ''),
(6, 'jj', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2020-09-05 18:51:10', 1, '2020-09-05 18:51:10', 1, 0, 0, '', '0', '', ''),
(7, 'jj', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2020-09-05 18:51:11', 1, '2020-09-05 18:51:11', 1, 0, 0, '', '0', '', ''),
(8, 'jkh77777', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2020-09-05 18:51:39', 1, '2020-09-05 18:51:39', 1, 0, 0, '', '0', '', ''),
(9, '', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '0000-00-00 00:00:00', 0, '2020-10-08 02:11:53', NULL, 0, 0, '', '0', '', ''),
(10, '', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '0000-00-00 00:00:00', 0, '2020-10-08 02:12:09', NULL, 0, 0, '', '0', '', ''),
(11, '', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '0000-00-00 00:00:00', 0, '2020-10-08 02:13:33', NULL, 0, 0, '', '0', '', ''),
(12, '', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '0000-00-00 00:00:00', 0, '2020-10-08 02:13:49', NULL, 0, 0, '', '0', '', ''),
(13, 'kkkkkkkk', 0, '55555555', '555555', NULL, 0, 0, NULL, 2, 0, NULL, '0000-00-00 00:00:00', 5555555555, '2020-10-08 02:15:12', NULL, 1, 0, 'lucknow', '2026021', '', ''),
(14, 'kkkkkkkk', 0, '55555555', '555555', NULL, 0, 0, NULL, 2, 0, NULL, '0000-00-00 00:00:00', 5555555555, '2020-10-08 02:16:01', NULL, 1, 0, 'lucknow', '2026021', '', ''),
(15, 'kkkkkkkk', 0, '55555555', '555555', NULL, 0, 0, NULL, 2, 0, NULL, '0000-00-00 00:00:00', 5555555555, '2020-10-08 02:16:09', NULL, 1, 0, 'lucknow', '2026021', '', ''),
(16, 'kkkkkkkk', 0, '55555555', '555555', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-07 23:00:44', 2, '2020-10-08 02:30:44', NULL, 1, 0, 'lucknow', '2026021', '', ''),
(17, 'kkkkkkkk', 0, '55555555', '555555', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-07 23:01:42', 2, '2020-10-08 02:31:42', NULL, 1, 0, 'lucknow', '2026021', '', ''),
(18, 'kkkkkkkk', 0, '55555555', '555555', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-07 23:02:25', 2, '2020-10-08 02:32:25', NULL, 1, 0, 'lucknow', '2026021', '', ''),
(19, 'kkkkkkkk', 0, '55555555', '555555', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-07 23:05:11', 2, '2020-10-08 02:35:11', NULL, 1, 0, 'lucknow', '2026021', '', ''),
(20, 'kkkkkkkk', 0, '55555555', '555555', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-07 23:06:06', 2, '2020-10-08 02:36:06', NULL, 1, 0, 'lucknow', '2026021', '', ''),
(21, 'kkkkkkkk', 0, '55555555', '555555', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-07 23:08:24', 2, '2020-10-08 02:38:24', NULL, 1, 0, 'lucknow', '2026021', '', ''),
(22, 'test', 1, '0', '0', NULL, 1, 1, NULL, 2, 0, NULL, '2020-10-07 23:25:20', 2, '2020-10-08 02:55:20', NULL, 1, 0, 'lucknow', '2026021', '', ''),
(23, 'test', 1, '0', '0', NULL, 1, 1, NULL, 2, 0, NULL, '2020-10-07 23:25:46', 2, '2020-10-08 02:55:46', NULL, 1, 0, 'lucknow', '2026021', '', ''),
(24, 'test', 1, '0', '0', NULL, 1, 1, NULL, 2, 0, NULL, '2020-10-07 23:29:20', 2, '2020-10-08 02:59:20', NULL, 1, 0, 'lucknow', '2026021', '', ''),
(25, 'test', 1, '0', '0', NULL, 1, 1, NULL, 2, 0, NULL, '2020-10-07 23:31:25', 2, '2020-10-08 03:01:25', NULL, 1, 0, 'lucknow', '2026021', '', ''),
(26, '7777', 1, '0', '0', NULL, 1, 1, NULL, 2, 0, NULL, '2020-10-08 14:23:11', 2, '2020-10-08 17:53:11', NULL, 1, 0, 'kk', '0', '', ''),
(27, '5', 1, '0', '0', NULL, 1, 1, NULL, 2, 0, NULL, '2020-10-08 15:03:32', 2, '2020-10-08 18:33:32', NULL, 1, 1, 'lucknow', '999', '', ''),
(28, '5', 1, '0', '0', NULL, 1, 1, NULL, 2, 0, NULL, '2020-10-08 15:03:38', 2, '2020-10-08 18:33:38', NULL, 1, 1, 'lucknow', '999', '', ''),
(29, '5', 1, '0', '0', NULL, 1, 1, NULL, 2, 0, NULL, '2020-10-08 15:03:52', 2, '2020-10-08 18:33:52', NULL, 1, 1, 'lucknow', '999', '', ''),
(30, '5', 1, '0', '0', NULL, 1, 1, NULL, 2, 0, NULL, '2020-10-08 15:05:22', 2, '2020-10-08 18:35:22', NULL, 1, 1, 'lucknow', '999', '', ''),
(31, '5', 1, '0', '0', NULL, 1, 1, NULL, 2, 0, NULL, '2020-10-08 15:07:13', 2, '2020-10-08 18:37:13', NULL, 1, 1, 'lucknow', '999', '', ''),
(32, '5', 1, '0', '0', NULL, 1, 1, NULL, 2, 0, NULL, '2020-10-08 15:08:06', 2, '2020-10-08 18:38:06', NULL, 1, 1, 'lucknow', '999', '', ''),
(33, '5', 1, '0', '0', NULL, 1, 1, NULL, 2, 0, NULL, '2020-10-08 15:10:56', 2, '2020-10-08 18:40:56', NULL, 1, 1, 'lucknow', '9995', '', ''),
(34, '5', 1, '0', '0', NULL, 1, 1, NULL, 2, 0, NULL, '2020-10-08 15:29:52', 2, '2020-10-08 18:59:52', NULL, 1, 1, 'lucknow', '99950', '', ''),
(35, '9', 1, '0', '0', NULL, 1, 1, NULL, 2, 0, NULL, '2020-10-08 18:20:34', 2, '2020-10-08 21:50:34', NULL, 1, 0, '7', '7', '', ''),
(36, '9', 1, '9', '9', NULL, 1, 1, NULL, 2, 0, NULL, '2020-10-08 21:53:14', 2, '2020-10-09 01:23:14', NULL, 1, 0, '9', '9', '', ''),
(37, '0', 1, '0', '0', NULL, 1, 1, NULL, 2, 0, NULL, '2020-10-08 22:40:40', 2, '2020-10-09 02:10:40', NULL, 1, 0, 'l', '0', '', ''),
(38, 'domain.com', 1, '0', '0', NULL, 1, 1, NULL, 2, 0, NULL, '2020-10-09 08:51:26', 2, '2020-10-09 12:21:26', NULL, 1, 0, '2', '2', '', ''),
(39, 'kk', 1, '0', '0', NULL, 1, 1, NULL, 2, 0, NULL, '2020-10-09 08:59:26', 2, '2020-10-09 12:29:26', NULL, 1, 0, 'lucknow', '2026021', '', ''),
(40, '55', 1, '0', '0', NULL, 1, 1, NULL, 2, 0, NULL, '2020-10-09 12:20:33', 2, '2020-10-09 15:50:33', NULL, 1, 0, 'lucknow', '2026021', '', ''),
(41, 'o', 1, '0', '0', NULL, 1, 1, NULL, 2, 0, NULL, '2020-10-09 12:27:05', 2, '2020-10-09 15:57:05', NULL, 1, 0, 'lucknow', '2026021', '', ''),
(42, '7', 1, '0', '0', NULL, 1, 1, NULL, 2, 0, NULL, '2020-10-09 23:43:59', 2, '2020-10-10 03:13:59', NULL, 1, 0, '7', '7', '', ''),
(43, 'Department', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:00:57', 2, '2020-10-11 13:30:57', NULL, 0, 0, 'ZIP', 'Country', 'Employee Size', ''),
(44, 'Human Resources', 0, '0', '0', NULL, 59, 0, NULL, 2, 0, NULL, '2020-10-11 10:00:58', 2, '2020-10-11 13:30:58', NULL, 0, 0, '28050', 'Spain', '250-499', ''),
(45, 'Human Resources', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:00:58', 2, '2020-10-11 13:30:58', NULL, 0, 0, '75002', 'France', '50-249', ''),
(46, 'Customer Service', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:00:58', 2, '2020-10-11 13:30:58', NULL, 0, 0, '3821 BT', 'Netherlands', '250-499', ''),
(47, 'Sales/Business Development', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:00:58', 2, '2020-10-11 13:30:58', NULL, 0, 0, '10827', 'Germany', '250-499', ''),
(48, 'Sales/Business Development', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:00:59', 2, '2020-10-11 13:30:59', NULL, 0, 0, '2072', 'Australia', '250-499', ''),
(49, 'Operations', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:00:59', 2, '2020-10-11 13:30:59', NULL, 0, 0, '2072', 'Australia', '250-499', ''),
(50, 'Sales/Business Development', 0, '0', '0', NULL, 59, 0, NULL, 2, 0, NULL, '2020-10-11 10:00:59', 2, '2020-10-11 13:30:59', NULL, 0, 0, '28050', 'Spain', '250-499', ''),
(51, 'Marketing', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:00', 2, '2020-10-11 13:31:00', NULL, 0, 0, '2190', 'Australia', '250-499', ''),
(52, 'Finance', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:00', 2, '2020-10-11 13:31:00', NULL, 0, 0, '75017', 'France', '250-499', ''),
(53, 'Operations', 0, '0', '0', NULL, 261000, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:00', 2, '2020-10-11 13:31:00', NULL, 0, 0, '28027', 'Spain', '250-499', ''),
(54, 'Marketing', 0, '0', '0', NULL, 59, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:00', 2, '2020-10-11 13:31:00', NULL, 0, 0, '28050', 'Spain', '250-499', ''),
(55, 'Sales/Business Development', 0, '0', '0', NULL, 261000, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:01', 2, '2020-10-11 13:31:01', NULL, 0, 0, '28027', 'Spain', '250-499', ''),
(56, 'Finance', 0, '0', '0', NULL, 261000, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:01', 2, '2020-10-11 13:31:01', NULL, 0, 0, '28027', 'Spain', '250-499', ''),
(57, 'Engineering', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:02', 2, '2020-10-11 13:31:02', NULL, 0, 0, '75017', 'France', '250-499', ''),
(58, 'Marketing', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:03', 2, '2020-10-11 13:31:03', NULL, 0, 0, '75017', 'France', '250-499', ''),
(59, 'Operations', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:04', 2, '2020-10-11 13:31:04', NULL, 0, 0, '6513445', 'Israel', '50-249', ''),
(60, 'Sales/Business Development', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:04', 2, '2020-10-11 13:31:04', NULL, 0, 0, '6513445', 'Israel', '50-249', ''),
(61, 'Operations', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:04', 2, '2020-10-11 13:31:04', NULL, 0, 0, '75017', 'France', '250-499', ''),
(62, 'Finance', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:04', 2, '2020-10-11 13:31:04', NULL, 0, 0, '6513445', 'Israel', '50-249', ''),
(63, 'Information Technology', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:06', 2, '2020-10-11 13:31:06', NULL, 0, 0, '3543 AP', 'Netherlands', '50-249', ''),
(64, 'Customer Service', 0, '0', '0', NULL, 59, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:06', 2, '2020-10-11 13:31:06', NULL, 0, 0, '28050', 'Spain', '250-499', ''),
(65, 'Marketing', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:06', 2, '2020-10-11 13:31:06', NULL, 0, 0, '10785 ', 'Germany', '250-499', ''),
(66, 'Legal/Compliance', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:06', 2, '2020-10-11 13:31:06', NULL, 0, 0, '10437', 'Germany', '250-499', ''),
(67, 'Human Resources', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:06', 2, '2020-10-11 13:31:06', NULL, 0, 0, '10785 ', 'Germany', '250-499', ''),
(68, 'Finance', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:07', 2, '2020-10-11 13:31:07', NULL, 0, 0, '10437', 'Germany', '250-499', ''),
(69, 'Sales/Business Development', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:07', 2, '2020-10-11 13:31:07', NULL, 0, 0, '75008', 'France', '50-249', ''),
(70, 'Marketing', 0, '0', '0', NULL, 261000, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:08', 2, '2020-10-11 13:31:08', NULL, 0, 0, '8820', 'Spain', '250-499', ''),
(71, 'Information Technology', 0, '0', '0', NULL, 261000, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:08', 2, '2020-10-11 13:31:08', NULL, 0, 0, '8820', 'Spain', '250-499', ''),
(72, 'Operations', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:09', 2, '2020-10-11 13:31:09', NULL, 0, 0, '80337', 'Germany', '250-499', ''),
(73, 'Human Resources', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:09', 2, '2020-10-11 13:31:09', NULL, 0, 0, '48002', 'Spain', '250-499', ''),
(74, 'Operations', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:10', 2, '2020-10-11 13:31:10', NULL, 0, 0, '1186 MJ', 'Netherlands', '50-249', ''),
(75, 'Sales/Business Development', 0, '0', '0', NULL, 65, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:10', 2, '2020-10-11 13:31:10', NULL, 0, 0, '91120', 'France', '50-249', ''),
(76, 'Finance', 0, '0', '0', NULL, 5590, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:10', 2, '2020-10-11 13:31:10', NULL, 0, 0, '1186 MJ', 'Netherlands', '50-249', ''),
(77, 'Sales/Business Development', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:12', 2, '2020-10-11 13:31:12', NULL, 0, 0, '5223 LA', 'Netherlands', '250-499', ''),
(78, 'Engineering', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:12', 2, '2020-10-11 13:31:12', NULL, 0, 0, '113 60', 'Sweden', '50-249', ''),
(79, 'Marketing', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:12', 2, '2020-10-11 13:31:12', NULL, 0, 0, '08006 ', 'Spain', '250-499', ''),
(80, 'Marketing', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:13', 2, '2020-10-11 13:31:13', NULL, 0, 0, '5223 LA', 'Netherlands', '250-499', ''),
(81, 'Sales/Business Development', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:13', 2, '2020-10-11 13:31:13', NULL, 0, 0, '08019 ', 'Spain', '250-499', ''),
(82, 'Human Resources', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:14', 2, '2020-10-11 13:31:14', NULL, 0, 0, '5223 LA', 'Netherlands', '250-499', ''),
(83, 'Operations', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:16', 2, '2020-10-11 13:31:16', NULL, 0, 0, '111 21', 'Sweden', '50-249', ''),
(84, 'Marketing', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:16', 2, '2020-10-11 13:31:16', NULL, 0, 0, '111 21', 'Sweden', '50-249', ''),
(85, 'Legal/Compliance', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:17', 2, '2020-10-11 13:31:17', NULL, 0, 0, '111 21', 'Sweden', '50-249', ''),
(86, 'Finance', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:17', 2, '2020-10-11 13:31:17', NULL, 0, 0, '111 21', 'Sweden', '50-249', ''),
(87, 'Sales/Business Development', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:18', 2, '2020-10-11 13:31:18', NULL, 0, 0, '111 21', 'Sweden', '50-249', ''),
(88, 'Finance', 0, '0', '0', NULL, 202000, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:19', 2, '2020-10-11 13:31:19', NULL, 0, 0, '08025 ', 'Spain', '250-499', ''),
(89, 'Human Resources', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:19', 2, '2020-10-11 13:31:19', NULL, 0, 0, '2000', 'Australia', '250-499', ''),
(90, 'Finance', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:20', 2, '2020-10-11 13:31:20', NULL, 0, 0, '2000', 'Australia', '250-499', ''),
(91, 'Human Resources', 0, '0', '0', NULL, 400000, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:20', 2, '2020-10-11 13:31:20', NULL, 0, 0, '4077', 'Australia', '250-499', ''),
(92, 'Data/Business Intelligence', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:21', 2, '2020-10-11 13:31:21', NULL, 0, 0, '2497 GB', 'Netherlands', '250-499', ''),
(93, 'Sales/Business Development', 0, '0', '0', NULL, 400000, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:21', 2, '2020-10-11 13:31:21', NULL, 0, 0, '4077', 'Australia', '250-499', ''),
(94, 'Marketing', 0, '0', '0', NULL, 400000, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:21', 2, '2020-10-11 13:31:21', NULL, 0, 0, '4077', 'Australia', '250-499', ''),
(95, 'Engineering', 0, '0', '0', NULL, 400000, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:22', 2, '2020-10-11 13:31:22', NULL, 0, 0, '8005', 'Spain', '250-499', ''),
(96, 'Information Technology', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:23', 2, '2020-10-11 13:31:23', NULL, 0, 0, '52074 ', 'Germany', '250-499', ''),
(97, 'Human Resources', 0, '0', '0', NULL, 239000, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:23', 2, '2020-10-11 13:31:23', NULL, 0, 0, '92300', 'France', '250-499', ''),
(98, 'Sales/Business Development', 0, '0', '0', NULL, 400000, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:24', 2, '2020-10-11 13:31:24', NULL, 0, 0, '8005', 'Spain', '250-499', ''),
(99, 'Information Technology', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:24', 2, '2020-10-11 13:31:24', NULL, 0, 0, '28054 ', 'Spain', '250-499', ''),
(100, 'Human Resources', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:25', 2, '2020-10-11 13:31:25', NULL, 0, 0, '112 34', 'Sweden', '50-249', ''),
(101, 'Finance', 0, '0', '0', NULL, 239000, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:26', 2, '2020-10-11 13:31:26', NULL, 0, 0, '92300', 'France', '250-499', ''),
(102, 'Sales/Business Development', 0, '0', '0', NULL, 239000, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:27', 2, '2020-10-11 13:31:27', NULL, 0, 0, '92300', 'France', '250-499', ''),
(103, 'Data/Business Intelligence', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:27', 2, '2020-10-11 13:31:27', NULL, 0, 0, '10435', 'Germany', '50-249', ''),
(104, 'Sales/Business Development', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:28', 2, '2020-10-11 13:31:28', NULL, 0, 0, '2028', 'United States', '500-999', ''),
(105, 'Marketing', 0, '0', '0', NULL, 239000, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:28', 2, '2020-10-11 13:31:28', NULL, 0, 0, '92300', 'France', '250-499', ''),
(106, 'Marketing', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:29', 2, '2020-10-11 13:31:29', NULL, 0, 0, '4673300', 'Israel', '250-499', ''),
(107, 'Human Resources', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:31', 2, '2020-10-11 13:31:31', NULL, 0, 0, '4673300', 'Israel', '250-499', ''),
(108, 'Finance', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:31', 2, '2020-10-11 13:31:31', NULL, 0, 0, '08018 ', 'Spain', '250-499', ''),
(109, 'Marketing', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:32', 2, '2020-10-11 13:31:32', NULL, 0, 0, '29010 ', 'Italy', '250-499', ''),
(110, 'Engineering', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:32', 2, '2020-10-11 13:31:32', NULL, 0, 0, '10435', 'Germany', '50-249', ''),
(111, 'Sales/Business Development', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:33', 2, '2020-10-11 13:31:33', NULL, 0, 0, ' ‎108-0014', 'Japan', '250-499', ''),
(112, 'Marketing', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:33', 2, '2020-10-11 13:31:33', NULL, 0, 0, '150-6139', 'Japan', '250-499', ''),
(113, 'Information Technology', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:33', 2, '2020-10-11 13:31:33', NULL, 0, 0, '〒105-0013', 'Japan', '50-249', ''),
(114, 'Information Technology', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:33', 2, '2020-10-11 13:31:33', NULL, 0, 0, '75008', 'France', '50-249', ''),
(115, 'Customer Service', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:34', 2, '2020-10-11 13:31:34', NULL, 0, 0, '107-0062', 'Japan', '250-499', ''),
(116, 'Marketing', 0, '0', '0', NULL, 200000, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:34', 2, '2020-10-11 13:31:34', NULL, 0, 0, '75008', 'France', '50-249', ''),
(117, 'Operations', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:35', 2, '2020-10-11 13:31:35', NULL, 0, 0, '100-0006', 'Japan', '250-499', ''),
(118, 'Sales/Business Development', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:35', 2, '2020-10-11 13:31:35', NULL, 0, 0, '80250-000', 'Brazil', '250-499', ''),
(119, 'Finance', 0, '0', '0', NULL, 200000, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:35', 2, '2020-10-11 13:31:35', NULL, 0, 0, '75008', 'France', '50-249', ''),
(120, 'Engineering', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:36', 2, '2020-10-11 13:31:36', NULL, 0, 0, '106-0045', 'Japan', '250-499', ''),
(121, 'Marketing', 0, '0', '0', NULL, 82, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:37', 2, '2020-10-11 13:31:37', NULL, 0, 0, '28028 ', 'Spain', '250-499', ''),
(122, 'Sales/Business Development', 0, '0', '0', NULL, 82, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:37', 2, '2020-10-11 13:31:37', NULL, 0, 0, '28028 ', 'Spain', '250-499', ''),
(123, 'Human Resources', 0, '0', '0', NULL, 82, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:37', 2, '2020-10-11 13:31:37', NULL, 0, 0, '28028 ', 'Spain', '250-499', ''),
(124, 'Operations', 0, '0', '0', NULL, 82, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:38', 2, '2020-10-11 13:31:38', NULL, 0, 0, '28028 ', 'Spain', '250-499', ''),
(125, 'Information Technology', 0, '0', '0', NULL, 82, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:38', 2, '2020-10-11 13:31:38', NULL, 0, 0, '28028 ', 'Spain', '250-499', ''),
(126, 'Sales/Business Development', 0, '0', '0', NULL, 384000, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:38', 2, '2020-10-11 13:31:38', NULL, 0, 0, '48160', 'Spain', '250-499', ''),
(127, 'Marketing', 0, '0', '0', NULL, 384000, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:39', 2, '2020-10-11 13:31:39', NULL, 0, 0, '48160', 'Spain', '250-499', ''),
(128, 'Human Resources', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:39', 2, '2020-10-11 13:31:39', NULL, 0, 0, '04576-060', 'Brazil', '250-499', ''),
(129, 'Sales/Business Development', 0, '0', '0', NULL, 400000, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:40', 2, '2020-10-11 13:31:40', NULL, 0, 0, '88080-170', 'Brazil', '250-499', ''),
(130, 'Sales/Business Development', 0, '0', '0', NULL, 9, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:41', 2, '2020-10-11 13:31:41', NULL, 0, 0, '8014', 'Spain', '250-499', ''),
(131, 'Operations', 0, '0', '0', NULL, 9, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:41', 2, '2020-10-11 13:31:41', NULL, 0, 0, '8014', 'Spain', '250-499', ''),
(132, 'Sales/Business Development', 0, '0', '0', NULL, 9, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:41', 2, '2020-10-11 13:31:41', NULL, 0, 0, '8014', 'Spain', '250-499', ''),
(133, 'Sales/Business Development', 0, '0', '0', NULL, 9, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:42', 2, '2020-10-11 13:31:42', NULL, 0, 0, '8014', 'Spain', '250-499', ''),
(134, 'Sales/Business Development', 0, '0', '0', NULL, 9, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:43', 2, '2020-10-11 13:31:43', NULL, 0, 0, '8014', 'Spain', '250-499', ''),
(135, 'Marketing', 0, '0', '0', NULL, 734, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:44', 2, '2020-10-11 13:31:44', NULL, 0, 0, ' 111 44', 'Sweden', '50-249', ''),
(136, 'Finance', 0, '0', '0', NULL, 9, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:45', 2, '2020-10-11 13:31:45', NULL, 0, 0, '8014', 'Spain', '250-499', ''),
(137, 'Finance', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:45', 2, '2020-10-11 13:31:45', NULL, 0, 0, '141-0021', 'Japan', '50-249', ''),
(138, 'Marketing', 0, '0', '0', NULL, 9, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:45', 2, '2020-10-11 13:31:45', NULL, 0, 0, '8014', 'Spain', '250-499', ''),
(139, 'Operations', 0, '0', '0', NULL, 191000, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:45', 2, '2020-10-11 13:31:45', NULL, 0, 0, '92700', 'France', '50-249', ''),
(140, 'Customer Service', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:48', 2, '2020-10-11 13:31:48', NULL, 0, 0, '2008', 'Australia', '100-249', ''),
(141, 'Engineering', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:49', 2, '2020-10-11 13:31:49', NULL, 0, 0, '2010', 'Australia', '100-249', ''),
(142, 'Operations', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:50', 2, '2020-10-11 13:31:50', NULL, 0, 0, '28046 ', 'Spain', '250-499', ''),
(143, 'Human Resources', 0, '0', '0', NULL, 202000, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:52', 2, '2020-10-11 13:31:52', NULL, 0, 0, '08025 ', 'Spain', '250-499', ''),
(144, 'Sales/Business Development', 0, '0', '0', NULL, 202000, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:53', 2, '2020-10-11 13:31:53', NULL, 0, 0, '08025 ', 'Spain', '250-499', ''),
(145, 'Human Resources', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:54', 2, '2020-10-11 13:31:54', NULL, 0, 0, '105-0001', 'Japan', '250-499', ''),
(146, 'Marketing', 0, '0', '0', NULL, 202000, 0, NULL, 2, 0, NULL, '2020-10-11 10:01:55', 2, '2020-10-11 13:31:55', NULL, 0, 0, '08025 ', 'Spain', '250-499', ''),
(147, 'Legal/Compliance', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:02:03', 2, '2020-10-11 13:32:03', NULL, 0, 0, '08006 ', 'Spain', '250-499', ''),
(148, 'Finance', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:02:05', 2, '2020-10-11 13:32:05', NULL, 0, 0, '22640-102', 'Brazil', '250-499', ''),
(149, 'Information Technology', 0, '0', '0', NULL, 200000, 0, NULL, 2, 0, NULL, '2020-10-11 10:02:07', 2, '2020-10-11 13:32:07', NULL, 0, 0, '08029', 'Spain', '250-499', ''),
(150, 'Operations', 0, '0', '0', NULL, 200, 0, NULL, 2, 0, NULL, '2020-10-11 10:02:07', 2, '2020-10-11 13:32:07', NULL, 0, 0, ' 106-0041', 'Japan', '100-249', ''),
(151, 'Engineering', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:02:08', 2, '2020-10-11 13:32:08', NULL, 0, 0, '41001 ', 'Spain', '100-249', ''),
(152, 'Security', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:02:09', 2, '2020-10-11 13:32:09', NULL, 0, 0, '105-0021', 'Japan', '250-499', ''),
(153, 'Legal/Compliance', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:02:10', 2, '2020-10-11 13:32:10', NULL, 0, 0, '105-0021', 'Japan', '250-499', ''),
(154, 'Sales/Business Development', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:02:10', 2, '2020-10-11 13:32:10', NULL, 0, 0, '29010 ', 'Italy', '250-499', ''),
(155, 'Finance', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:02:11', 2, '2020-10-11 13:32:11', NULL, 0, 0, '29010 ', 'Italy', '250-499', ''),
(156, 'Sales/Business Development', 0, '0', '0', NULL, 872000, 0, NULL, 2, 0, NULL, '2020-10-11 10:02:12', 2, '2020-10-11 13:32:12', NULL, 0, 0, '106-0032', 'Japan', '50-249', ''),
(157, 'Marketing', 0, '0', '0', NULL, 872000, 0, NULL, 2, 0, NULL, '2020-10-11 10:02:14', 2, '2020-10-11 13:32:14', NULL, 0, 0, '106-0032', 'Japan', '50-249', ''),
(158, 'Customer Service', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:02:20', 2, '2020-10-11 13:32:20', NULL, 0, 0, '50784', 'Spain', '250-499', ''),
(159, 'Operations', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:02:22', 2, '2020-10-11 13:32:22', NULL, 0, 0, '20139 ', 'Italy', '250-499', ''),
(160, 'Customer Service', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:02:23', 2, '2020-10-11 13:32:23', NULL, 0, 0, '20139 ', 'Italy', '250-499', ''),
(161, 'Marketing', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:02:25', 2, '2020-10-11 13:32:25', NULL, 0, 0, '70711-070', 'Brazil', '250-499', ''),
(162, 'Engineering', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:02:28', 2, '2020-10-11 13:32:28', NULL, 0, 0, '4366250', 'Israel', '50-249', ''),
(163, 'Data/Business Intelligence', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:02:29', 2, '2020-10-11 13:32:29', NULL, 0, 0, '18004', 'Spain', '250-499', ''),
(164, 'Finance', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:02:33', 2, '2020-10-11 13:32:33', NULL, 0, 0, '1101 CN', 'Netherlands', '50-249', ''),
(165, 'Engineering', 0, '0', '0', NULL, 734, 0, NULL, 2, 0, NULL, '2020-10-11 10:02:35', 2, '2020-10-11 13:32:35', NULL, 0, 0, '111 44', 'Sweden', '50-249', ''),
(166, 'Marketing', 0, '0', '0', NULL, 31, 0, NULL, 2, 0, NULL, '2020-10-11 10:02:36', 2, '2020-10-11 13:32:36', NULL, 0, 0, '20126 ', 'Italy', '250-499', ''),
(167, 'Engineering', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:02:36', 2, '2020-10-11 13:32:36', NULL, 0, 0, '3528 BJ', 'Netherlands', '50-249', ''),
(168, 'Sales/Business Development', 0, '0', '0', NULL, 31, 0, NULL, 2, 0, NULL, '2020-10-11 10:02:37', 2, '2020-10-11 13:32:37', NULL, 0, 0, '20126 ', 'Italy', '250-499', ''),
(169, 'Marketing', 0, '0', '0', NULL, 31, 0, NULL, 2, 0, NULL, '2020-10-11 10:02:37', 2, '2020-10-11 13:32:37', NULL, 0, 0, '20126 ', 'Italy', '250-499', ''),
(170, 'Sales/Business Development', 0, '0', '0', NULL, 31, 0, NULL, 2, 0, NULL, '2020-10-11 10:02:38', 2, '2020-10-11 13:32:38', NULL, 0, 0, '20126 ', 'Italy', '250-499', ''),
(171, 'Sales/Business Development', 0, '0', '0', NULL, 31, 0, NULL, 2, 0, NULL, '2020-10-11 10:02:38', 2, '2020-10-11 13:32:38', NULL, 0, 0, '20126 ', 'Italy', '250-499', ''),
(172, 'Sales/Business Development', 0, '0', '0', NULL, 31, 0, NULL, 2, 0, NULL, '2020-10-11 10:02:39', 2, '2020-10-11 13:32:39', NULL, 0, 0, '20126 ', 'Italy', '250-499', ''),
(173, 'Sales/Business Development', 0, '0', '0', NULL, 31, 0, NULL, 2, 0, NULL, '2020-10-11 10:02:39', 2, '2020-10-11 13:32:39', NULL, 0, 0, '20126 ', 'Italy', '250-499', ''),
(174, 'Information Technology', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:02:40', 2, '2020-10-11 13:32:40', NULL, 0, 0, '6706054', 'Israel', '250-499', ''),
(175, 'Sales/Business Development', 0, '0', '0', NULL, 35, 0, NULL, 2, 0, NULL, '2020-10-11 10:02:43', 2, '2020-10-11 13:32:43', NULL, 0, 0, 'SE-215 82 ', 'Sweden', '50-249', ''),
(176, 'Sales/Business Development', 0, '0', '0', NULL, 8, 0, NULL, 2, 0, NULL, '2020-10-11 10:02:43', 2, '2020-10-11 13:32:43', NULL, 0, 0, '1625 ', 'Netherlands', '50-249', ''),
(177, 'Sales/Business Development', 0, '0', '0', NULL, 200, 0, NULL, 2, 0, NULL, '2020-10-11 10:02:44', 2, '2020-10-11 13:32:44', NULL, 0, 0, '6102500', 'Israel', '250-499', ''),
(178, 'Operations', 0, '0', '0', NULL, 200, 0, NULL, 2, 0, NULL, '2020-10-11 10:02:44', 2, '2020-10-11 13:32:44', NULL, 0, 0, '6102500', 'Israel', '250-499', ''),
(179, 'Information Technology', 0, '0', '0', NULL, 200, 0, NULL, 2, 0, NULL, '2020-10-11 10:02:45', 2, '2020-10-11 13:32:45', NULL, 0, 0, '6102500', 'Israel', '250-499', ''),
(180, 'Data/Business Intelligence', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:02:47', 2, '2020-10-11 13:32:47', NULL, 0, 0, '100-6640', 'Japan', '250-499', ''),
(181, 'Legal/Compliance', 0, '0', '0', NULL, 35, 0, NULL, 2, 0, NULL, '2020-10-11 10:02:47', 2, '2020-10-11 13:32:47', NULL, 0, 0, 'SE-215 82 ', 'Sweden', '50-249', ''),
(182, 'Marketing', 0, '0', '0', NULL, 195000, 0, NULL, 2, 0, NULL, '2020-10-11 10:02:50', 2, '2020-10-11 13:32:50', NULL, 0, 0, '20122', 'Italy', '250-499', ''),
(183, 'Sales/Business Development', 0, '0', '0', NULL, 195000, 0, NULL, 2, 0, NULL, '2020-10-11 10:02:51', 2, '2020-10-11 13:32:51', NULL, 0, 0, '20122', 'Italy', '250-499', ''),
(184, 'Legal/Compliance', 0, '0', '0', NULL, 195000, 0, NULL, 2, 0, NULL, '2020-10-11 10:02:52', 2, '2020-10-11 13:32:52', NULL, 0, 0, '20122', 'Italy', '250-499', ''),
(185, 'Information Technology', 0, '0', '0', NULL, 195000, 0, NULL, 2, 0, NULL, '2020-10-11 10:02:53', 2, '2020-10-11 13:32:53', NULL, 0, 0, '20122', 'Italy', '250-499', ''),
(186, 'Company Name', 0, '0', '0', NULL, 0, 0, NULL, 2, 0, NULL, '2020-10-11 10:12:56', 2, '2020-10-11 13:42:56', NULL, 0, 0, 'State', 'ZIP', 'Company Link', ''),
(187, 'Telxius', 59, '0', '0', NULL, 250, 0, NULL, 2, 0, NULL, '2020-10-11 10:12:56', 2, '2020-10-11 13:42:56', NULL, 0, 0, 'Madrid', '28050', 'https://www.linkedin.com/company/telxius/', ''),
(188, 'ABILWAYS', 0, '0', '0', NULL, 50, 0, NULL, 2, 0, NULL, '2020-10-11 10:12:57', 2, '2020-10-11 13:42:57', NULL, 0, 0, ' Ile-de-France', '75002', 'https://www.linkedin.com/company/abilways/', ''),
(189, 'Solvinity', 0, '0', '0', NULL, 250, 0, NULL, 2, 0, NULL, '2020-10-11 10:12:57', 2, '2020-10-11 13:42:57', NULL, 0, 0, 'Utrecht', '3821 BT', 'https://www.linkedin.com/company/solvinity/about/', ''),
(190, 'Telxius', 1, '0', '0', NULL, 1, 1, NULL, 2, 0, NULL, '2020-10-11 12:46:44', 2, '2020-10-11 16:16:44', NULL, 1, 0, 'Madrid', '28050', 'https://www.linkedin.com/company/telxius/', ''),
(191, 'fsdfsdf', 1, '2', '4', NULL, 1, 1, NULL, 2, 0, NULL, '2020-12-03 13:09:02', 2, '2020-12-03 17:39:02', NULL, 1, 2, 'satara', '415011', 'dsd', NULL),
(192, 'hghjg', 1, '3', '2', NULL, 1, 1, NULL, 2, 0, NULL, '2020-12-03 13:14:13', 2, '2020-12-03 17:44:13', NULL, 1, 2, 'satara', '415011', 'hjjh', NULL),
(193, 'gdgfgdfg', 1, '5', '5', NULL, 1, 1, NULL, 2, 0, NULL, '2020-12-03 13:17:28', 2, '2020-12-03 17:47:28', NULL, 1, 2, 'Pune', '411052', 'gfgd', NULL),
(194, 'fffff', 1, '4', '4', NULL, 1, 1, NULL, 2, 0, NULL, '2020-12-03 13:34:11', 2, '2020-12-03 18:04:11', NULL, 1, 2, 'Pune', '411052', 'fdf', NULL),
(195, 'fdsfsdf', 1, '3', '2', NULL, 1, 1, NULL, 2, 0, NULL, '2020-12-04 07:26:16', 2, '2020-12-04 11:56:17', NULL, 1, 2, 'satara', '415011', 'dasdd', NULL),
(196, 'demo', 1, '2', '1', NULL, 1, 1, NULL, 2, 0, NULL, '2020-12-04 13:07:29', 2, '2020-12-04 17:37:30', NULL, 1, 2, 'pune', '411015', 'abc', NULL),
(197, 'eClerx', 1, '55', '55', NULL, 1, 1, NULL, 2, 0, NULL, '2020-12-05 06:11:16', 2, '2020-12-05 10:41:16', NULL, 1, 2, 'navi mumbai', '400705', 'https://in.linkedin.com/company/eclerx', NULL),
(198, 'abc', 1, '', '', NULL, 1, 1, NULL, 2, 0, NULL, '2020-12-05 10:16:12', 2, '2020-12-05 14:46:12', NULL, 1, 2, 'pune', '415011', 'abc', NULL),
(199, 'kjkj', 1, '', '', NULL, 1, 1, NULL, 2, 0, NULL, '2020-12-05 10:35:01', 2, '2020-12-05 15:05:01', NULL, 1, 2, '', '415011', 'ljjlkj', NULL),
(200, 'jjh', 1, '', '', NULL, 1, 1, NULL, 2, 0, NULL, '2020-12-05 10:37:15', 2, '2020-12-05 15:07:15', NULL, 1, 2, '', '415011', 'd ddd dsd', NULL),
(201, 'opoo', 1, '', '', NULL, 1, 1, NULL, 2, 0, NULL, '2020-12-05 10:39:34', 2, '2020-12-05 15:09:34', NULL, 1, 2, '', '415011', 'popopoopop', NULL),
(202, 'pune', 1, '', '', NULL, 1, 1, NULL, 2, 0, NULL, '2020-12-05 10:47:16', 2, '2020-12-05 15:17:16', NULL, 1, 2, 'pune', '415011', 'fdgfg', NULL),
(203, 'fdfdf', 1, '', '', NULL, 1, 1, NULL, 2, 0, NULL, '2020-12-05 12:33:31', 2, '2020-12-05 17:03:30', NULL, 1, 2, '', '415011', 'fdfdf', NULL),
(204, 'kjlkj', 1, '', '', NULL, 1, 1, NULL, 2, 0, NULL, '2020-12-05 12:41:06', 2, '2020-12-05 17:11:06', NULL, 1, 2, '', '415011', 'l;l', NULL),
(205, 'dsad', 1, '', '', NULL, 1, 1, NULL, 2, 0, NULL, '2020-12-05 12:45:19', 2, '2020-12-05 17:15:18', NULL, 1, 2, '', '415011', 'dsdasd', NULL),
(206, 'jklj', 1, '', '', NULL, 1, 1, NULL, 2, 0, NULL, '2020-12-05 13:05:36', 2, '2020-12-05 17:35:36', NULL, 1, 2, '', '415011', 'dad', NULL),
(207, 'fdsfdf', 1, '', '', NULL, 1, 1, NULL, 2, 0, NULL, '2020-12-05 13:17:36', 2, '2020-12-05 17:47:35', NULL, 1, 2, '', '415011', 'fdsfdsf', NULL),
(208, 'fdf', 1, '', '', NULL, 1, 1, NULL, 2, 0, NULL, '2020-12-08 08:40:10', 2, '2020-12-08 13:10:09', NULL, 1, 2, 'pune', '415011', 'fdsfdsf', NULL),
(209, 'hi', 1, 'b2', 'a2', NULL, 1, 1, NULL, 2, 0, NULL, '2020-12-08 13:27:42', 2, '2020-12-08 17:57:42', NULL, 1, 1, 'pune', '415051', 'BC', NULL),
(210, 'rerer', 1, '', '', NULL, 1, 1, NULL, 2, 0, NULL, '2020-12-09 05:48:52', 2, '2020-12-09 10:18:52', NULL, 1, 2, 'rer', '962102', 'rerer', NULL),
(211, 'etretret', 1, '', '', NULL, 1, 1, NULL, 2, 0, NULL, '2020-12-09 05:50:55', 2, '2020-12-09 10:20:54', NULL, 1, 2, '', '343434', 'ertrt', NULL),
(212, 'dfdf', 1, '', '', NULL, 1, 1, NULL, 2, 0, NULL, '2020-12-09 05:55:03', 2, '2020-12-09 10:25:02', NULL, 1, 2, 'fgdfgfgg', '454545', 'fdf', NULL),
(213, 'Arinoz Technologies Pvt Ltd', 1, '', '', NULL, 1, 1, NULL, 2, 0, NULL, '2020-12-09 05:58:39', 2, '2020-12-09 10:28:39', NULL, 1, 2, 'rtrt', '565656', 'trtr', NULL),
(214, 'fdsf', 1, '', '', NULL, 1, 1, NULL, 2, 0, NULL, '2020-12-09 06:02:57', 2, '2020-12-09 10:32:56', NULL, 1, 2, 'fdf', '415011', 'fdsf', NULL),
(215, 'erer', 1, '', '', NULL, 1, 1, NULL, 2, 0, NULL, '2020-12-09 06:06:23', 2, '2020-12-09 10:36:23', NULL, 1, 2, 'rere', '415011', 'rer', NULL),
(216, 'ewe', 1, '', '', NULL, 1, 1, NULL, 2, 0, NULL, '2020-12-09 06:09:01', 2, '2020-12-09 10:39:00', NULL, 1, 2, 'ewe', '415011', 'ewe', NULL),
(217, 'rerer', 1, '', '', NULL, 1, 1, NULL, 2, 0, NULL, '2020-12-09 06:20:43', 2, '2020-12-09 10:50:43', NULL, 1, 2, 'rerer', '415011', 'rewrer', NULL),
(218, 'dasd', 1, '1', '1', NULL, 1, 1, NULL, 2, 0, NULL, '2020-12-09 06:26:50', 2, '2020-12-09 10:56:50', NULL, 1, 2, 'PUNE', '415051', 'saS', NULL),
(219, 'ACWS', 1, 'DSD', 'DSD', NULL, 1, 1, NULL, 2, 0, NULL, '2020-12-09 06:33:16', 2, '2020-12-09 11:03:16', NULL, 1, 2, 'AAAAAAAAAAAAAAAAAAAAAA', '411052', 'DASDSD', NULL),
(220, 'dasdad', 1, 'dasd', 'sd', NULL, 1, 1, NULL, 2, 0, NULL, '2020-12-09 06:42:07', 2, '2020-12-09 11:12:07', NULL, 1, 2, 'dsad', '415011', 'dasdasd', NULL),
(221, 'oipoi', 1, 'oiopi', 'opuo', NULL, 1, 1, NULL, 2, 0, NULL, '2020-12-09 06:52:50', 2, '2020-12-09 11:22:50', NULL, 1, 2, 'satara', '415011', 'ipoioipo', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bf_company_alias`
--

CREATE TABLE `bf_company_alias` (
  `id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `alias_name` varchar(128) DEFAULT NULL,
  `parent_company_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bf_company_technology`
--

CREATE TABLE `bf_company_technology` (
  `id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `technology_id` int(11) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bf_country`
--

CREATE TABLE `bf_country` (
  `id` int(11) NOT NULL,
  `country_name` varchar(100) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `modify_on` datetime DEFAULT NULL,
  `modify_by` bigint(20) DEFAULT NULL,
  `deleted` bigint(20) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bf_country`
--

INSERT INTO `bf_country` (`id`, `country_name`, `created_date`, `created_by`, `customer_id`, `modify_on`, `modify_by`, `deleted`, `deleted_by`) VALUES
(1, 'India', '2020-11-19 17:45:43', 2, 2, '2020-11-20 10:33:47', 2, 0, NULL),
(2, 'Russia', '2020-11-20 10:02:29', 2, 2, NULL, NULL, 0, NULL),
(3, 'New York', '2020-11-20 10:03:33', 2, 2, NULL, NULL, 0, NULL),
(4, 'London', '2020-11-20 10:03:57', 2, 2, NULL, NULL, 0, NULL),
(5, 'America', '2020-11-24 14:34:08', 2, 2, '2020-11-24 14:34:45', 2, 0, NULL),
(6, 'ddddddd', '2020-12-09 13:03:23', 2, 2, '2020-12-09 13:05:29', 2, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bf_customers`
--

CREATE TABLE `bf_customers` (
  `Customer_id` int(11) NOT NULL,
  `company_name` varchar(250) DEFAULT NULL,
  `Address` varchar(250) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `encryption_key` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bf_customers`
--

INSERT INTO `bf_customers` (`Customer_id`, `company_name`, `Address`, `email`, `country_id`, `state_id`, `city_id`, `createddate`, `deleted`, `deleted_by`, `created_on`, `created_by`, `modified_on`, `modified_by`, `encryption_key`) VALUES
(1, 'kk', NULL, 'k', NULL, NULL, NULL, NULL, 0, NULL, '2020-09-17 01:12:38', NULL, NULL, NULL, ''),
(2, 'kk', NULL, 'kk', NULL, NULL, NULL, NULL, 0, NULL, '2020-09-17 01:12:38', NULL, NULL, NULL, ''),
(3, 'kk', NULL, 'kk', NULL, NULL, NULL, NULL, 0, NULL, '2020-09-17 01:12:38', NULL, NULL, NULL, ''),
(4, 'kk', NULL, 'kk', NULL, NULL, NULL, NULL, 0, NULL, '2020-09-17 01:12:38', NULL, NULL, NULL, ''),
(5, 'kkk', NULL, 'kkk', NULL, NULL, NULL, NULL, 0, NULL, '2020-09-17 01:12:38', NULL, NULL, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `bf_dnc`
--

CREATE TABLE `bf_dnc` (
  `id` int(11) NOT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `dnc_type` int(11) NOT NULL COMMENT '1 - Prospect\r\n2 - Company\r\n3 - Number',
  `id_or_number` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bf_dnc`
--

INSERT INTO `bf_dnc` (`id`, `deleted`, `deleted_by`, `created_on`, `created_by`, `modified_on`, `modified_by`, `customer_id`, `dnc_type`, `id_or_number`) VALUES
(1, 0, NULL, '2020-11-07 18:09:06', 2, NULL, NULL, 2, 1, '3'),
(2, 0, NULL, '2020-11-07 18:09:11', 2, NULL, NULL, 2, 1, '4');

-- --------------------------------------------------------

--
-- Table structure for table `bf_dnc_type`
--

CREATE TABLE `bf_dnc_type` (
  `id` int(11) NOT NULL,
  `name` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bf_dnc_type`
--

INSERT INTO `bf_dnc_type` (`id`, `name`) VALUES
(1, 'Prospect'),
(2, 'Number'),
(3, 'Company'),
(4, '');

-- --------------------------------------------------------

--
-- Table structure for table `bf_domains`
--

CREATE TABLE `bf_domains` (
  `id` int(11) NOT NULL,
  `domain_name` varchar(128) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bf_domains`
--

INSERT INTO `bf_domains` (`id`, `domain_name`, `company_id`, `customer_id`, `deleted`, `deleted_by`, `created_on`, `created_by`, `modified_on`, `modified_by`) VALUES
(1, 'kkkkk', 16, 2, 0, NULL, '2020-10-07 23:00:44', 2, NULL, NULL),
(2, 'kkkkk', 17, 2, 0, NULL, '2020-10-07 23:01:42', 2, NULL, NULL),
(3, 'kkkkk', 18, 2, 0, NULL, '2020-10-07 23:02:25', 2, NULL, NULL),
(4, 'kkkkk', 19, 2, 0, NULL, '2020-10-07 23:05:11', 2, NULL, NULL),
(5, 'kkkkk', 20, 2, 0, NULL, '2020-10-07 23:06:06', 2, NULL, NULL),
(6, 'kkkkk', 21, 2, 0, NULL, '2020-10-07 23:08:24', 2, NULL, NULL),
(7, '', 22, 2, 0, NULL, '2020-10-07 23:25:20', 2, NULL, NULL),
(8, '', 23, 2, 0, NULL, '2020-10-07 23:25:46', 2, NULL, NULL),
(9, '', 24, 2, 0, NULL, '2020-10-07 23:29:21', 2, NULL, NULL),
(10, '', 25, 2, 0, NULL, '2020-10-07 23:31:25', 2, NULL, NULL),
(11, '7777', 26, 2, 0, NULL, '2020-10-08 14:23:11', 2, NULL, NULL),
(12, '5', 27, 2, 0, NULL, '2020-10-08 15:03:32', 2, NULL, NULL),
(13, '5', 28, 2, 0, NULL, '2020-10-08 15:03:38', 2, NULL, NULL),
(14, '5', 29, 2, 0, NULL, '2020-10-08 15:03:52', 2, NULL, NULL),
(15, '5', 30, 2, 0, NULL, '2020-10-08 15:05:22', 2, NULL, NULL),
(16, '5', 31, 2, 0, NULL, '2020-10-08 15:07:13', 2, NULL, NULL),
(17, '5', 32, 2, 0, NULL, '2020-10-08 15:08:06', 2, NULL, NULL),
(18, '5', 33, 2, 0, NULL, '2020-10-08 15:10:56', 2, NULL, NULL),
(19, '5', 33, 2, 0, NULL, '2020-10-08 15:29:20', 2, NULL, NULL),
(20, '5', 34, 2, 0, NULL, '2020-10-08 15:29:52', 2, NULL, NULL),
(21, '', 9, 2, 0, NULL, '2020-10-08 17:05:05', 2, NULL, NULL),
(22, '9', 35, 2, 0, NULL, '2020-10-08 18:20:35', 2, NULL, NULL),
(23, 'domain0', 36, 2, 0, NULL, '2020-10-08 21:53:14', 2, NULL, NULL),
(24, '00', 37, 2, 0, NULL, '2020-10-08 22:40:40', 2, NULL, NULL),
(25, 'domain.com1', 38, 2, 0, NULL, '2020-10-09 08:51:27', 2, NULL, NULL),
(26, 'kk', 39, 2, 0, NULL, '2020-10-09 08:59:26', 2, NULL, NULL),
(27, '555', 40, 2, 0, NULL, '2020-10-09 12:20:33', 2, NULL, NULL),
(28, 'domain.com12', 22, 2, 0, NULL, '2020-10-09 12:24:30', 2, NULL, NULL),
(29, 'o', 41, 2, 0, NULL, '2020-10-09 12:27:05', 2, NULL, NULL),
(30, '0', 37, 2, 0, NULL, '2020-10-09 13:24:53', 2, NULL, NULL),
(31, '7', 42, 2, 0, NULL, '2020-10-09 23:43:59', 2, NULL, NULL),
(32, 'Company Name', 43, 2, 0, NULL, '2020-10-11 10:00:58', 2, NULL, NULL),
(33, 'Telxius', 44, 2, 0, NULL, '2020-10-11 10:00:58', 2, NULL, NULL),
(34, 'ABILWAYS', 45, 2, 0, NULL, '2020-10-11 10:00:58', 2, NULL, NULL),
(35, 'Solvinity', 46, 2, 0, NULL, '2020-10-11 10:00:58', 2, NULL, NULL),
(36, 'Blacklane', 47, 2, 0, NULL, '2020-10-11 10:00:58', 2, NULL, NULL),
(37, 'Royal Wolf Trading', 48, 2, 0, NULL, '2020-10-11 10:00:59', 2, NULL, NULL),
(38, 'Royal Wolf Trading', 49, 2, 0, NULL, '2020-10-11 10:00:59', 2, NULL, NULL),
(39, 'Allied Express', 48, 2, 0, NULL, '2020-10-11 10:00:59', 2, NULL, NULL),
(40, 'Telxius', 50, 2, 0, NULL, '2020-10-11 10:00:59', 2, NULL, NULL),
(41, 'Allied Express', 49, 2, 0, NULL, '2020-10-11 10:01:00', 2, NULL, NULL),
(42, 'Allied Express', 51, 2, 0, NULL, '2020-10-11 10:01:00', 2, NULL, NULL),
(43, 'PayFit', 52, 2, 0, NULL, '2020-10-11 10:01:00', 2, NULL, NULL),
(44, 'Manager ', 48, 2, 0, NULL, '2020-10-11 10:01:00', 2, NULL, NULL),
(45, 'GESVALT', 53, 2, 0, NULL, '2020-10-11 10:01:00', 2, NULL, NULL),
(46, 'Telxius', 54, 2, 0, NULL, '2020-10-11 10:01:00', 2, NULL, NULL),
(47, 'GESVALT', 55, 2, 0, NULL, '2020-10-11 10:01:01', 2, NULL, NULL),
(48, 'Rizing HCM', 49, 2, 0, NULL, '2020-10-11 10:01:01', 2, NULL, NULL),
(49, 'GESVALT', 56, 2, 0, NULL, '2020-10-11 10:01:01', 2, NULL, NULL),
(50, 'Rizing HCM', 48, 2, 0, NULL, '2020-10-11 10:01:01', 2, NULL, NULL),
(51, 'PayFit', 57, 2, 0, NULL, '2020-10-11 10:01:02', 2, NULL, NULL),
(52, 'ELMO Cloud HR & Payroll', 48, 2, 0, NULL, '2020-10-11 10:01:02', 2, NULL, NULL),
(53, 'HomeToGo', 47, 2, 0, NULL, '2020-10-11 10:01:03', 2, NULL, NULL),
(54, 'PayFit', 58, 2, 0, NULL, '2020-10-11 10:01:03', 2, NULL, NULL),
(55, 'Syte', 59, 2, 0, NULL, '2020-10-11 10:01:04', 2, NULL, NULL),
(56, 'Syte', 60, 2, 0, NULL, '2020-10-11 10:01:04', 2, NULL, NULL),
(57, 'PayFit', 61, 2, 0, NULL, '2020-10-11 10:01:04', 2, NULL, NULL),
(58, 'Syte', 62, 2, 0, NULL, '2020-10-11 10:01:04', 2, NULL, NULL),
(59, 'Quandoo', 48, 2, 0, NULL, '2020-10-11 10:01:05', 2, NULL, NULL),
(60, 'Telindus Nederland', 63, 2, 0, NULL, '2020-10-11 10:01:06', 2, NULL, NULL),
(61, 'Telxius', 64, 2, 0, NULL, '2020-10-11 10:01:06', 2, NULL, NULL),
(62, 'De Gruyter', 65, 2, 0, NULL, '2020-10-11 10:01:06', 2, NULL, NULL),
(63, 'HomeToGo', 66, 2, 0, NULL, '2020-10-11 10:01:06', 2, NULL, NULL),
(64, 'De Gruyter', 67, 2, 0, NULL, '2020-10-11 10:01:06', 2, NULL, NULL),
(65, 'HomeToGo', 68, 2, 0, NULL, '2020-10-11 10:01:07', 2, NULL, NULL),
(66, 'Anticipate Real Estate', 53, 2, 0, NULL, '2020-10-11 10:01:07', 2, NULL, NULL),
(67, 'inConcert', 69, 2, 0, NULL, '2020-10-11 10:01:08', 2, NULL, NULL),
(68, 'Anticipate Real Estate', 70, 2, 0, NULL, '2020-10-11 10:01:08', 2, NULL, NULL),
(69, 'tado° GmbH ', 47, 2, 0, NULL, '2020-10-11 10:01:08', 2, NULL, NULL),
(70, 'Anticipate Real Estate', 71, 2, 0, NULL, '2020-10-11 10:01:09', 2, NULL, NULL),
(71, 'tado° GmbH ', 65, 2, 0, NULL, '2020-10-11 10:01:09', 2, NULL, NULL),
(72, 'tado° GmbH ', 72, 2, 0, NULL, '2020-10-11 10:01:09', 2, NULL, NULL),
(73, 'Erum dynamic solution ', 73, 2, 0, NULL, '2020-10-11 10:01:09', 2, NULL, NULL),
(74, 'PayFit', 69, 2, 0, NULL, '2020-10-11 10:01:09', 2, NULL, NULL),
(75, 'Computacenter Nederland', 74, 2, 0, NULL, '2020-10-11 10:01:10', 2, NULL, NULL),
(76, 'DCMN', 65, 2, 0, NULL, '2020-10-11 10:01:10', 2, NULL, NULL),
(77, 'Kramer Electronics LTD', 75, 2, 0, NULL, '2020-10-11 10:01:10', 2, NULL, NULL),
(78, 'Computacenter Nederland', 76, 2, 0, NULL, '2020-10-11 10:01:10', 2, NULL, NULL),
(79, 'Templafy', 47, 2, 0, NULL, '2020-10-11 10:01:11', 2, NULL, NULL),
(80, 'Freightos', 62, 2, 0, NULL, '2020-10-11 10:01:11', 2, NULL, NULL),
(81, 'IOTA Foundation', 68, 2, 0, NULL, '2020-10-11 10:01:11', 2, NULL, NULL),
(82, 'DCMN', 47, 2, 0, NULL, '2020-10-11 10:01:12', 2, NULL, NULL),
(83, 'We are You', 77, 2, 0, NULL, '2020-10-11 10:01:12', 2, NULL, NULL),
(84, 'DigitalRoute', 78, 2, 0, NULL, '2020-10-11 10:01:12', 2, NULL, NULL),
(85, 'Vrumona', 77, 2, 0, NULL, '2020-10-11 10:01:12', 2, NULL, NULL),
(86, 'ID Finance', 79, 2, 0, NULL, '2020-10-11 10:01:12', 2, NULL, NULL),
(87, 'We are You', 80, 2, 0, NULL, '2020-10-11 10:01:13', 2, NULL, NULL),
(88, 'ID Finance', 73, 2, 0, NULL, '2020-10-11 10:01:13', 2, NULL, NULL),
(89, 'Opentrends', 79, 2, 0, NULL, '2020-10-11 10:01:13', 2, NULL, NULL),
(90, 'Fujitsu France', 69, 2, 0, NULL, '2020-10-11 10:01:13', 2, NULL, NULL),
(91, 'Opentrends', 81, 2, 0, NULL, '2020-10-11 10:01:13', 2, NULL, NULL),
(92, 'Fujitsu France', 52, 2, 0, NULL, '2020-10-11 10:01:14', 2, NULL, NULL),
(93, 'We are You', 82, 2, 0, NULL, '2020-10-11 10:01:14', 2, NULL, NULL),
(94, 'Fujitsu France', 45, 2, 0, NULL, '2020-10-11 10:01:15', 2, NULL, NULL),
(95, 'Fujitsu France', 58, 2, 0, NULL, '2020-10-11 10:01:15', 2, NULL, NULL),
(96, 'Deerns', 73, 2, 0, NULL, '2020-10-11 10:01:15', 2, NULL, NULL),
(97, 'Funnel', 83, 2, 0, NULL, '2020-10-11 10:01:16', 2, NULL, NULL),
(98, 'AutoScout24', 47, 2, 0, NULL, '2020-10-11 10:01:16', 2, NULL, NULL),
(99, 'Funnel', 84, 2, 0, NULL, '2020-10-11 10:01:16', 2, NULL, NULL),
(100, 'Nederlandse Loterij', 80, 2, 0, NULL, '2020-10-11 10:01:17', 2, NULL, NULL),
(101, 'AutoScout24', 65, 2, 0, NULL, '2020-10-11 10:01:17', 2, NULL, NULL),
(102, 'Funnel', 85, 2, 0, NULL, '2020-10-11 10:01:17', 2, NULL, NULL),
(103, 'Funnel', 86, 2, 0, NULL, '2020-10-11 10:01:18', 2, NULL, NULL),
(104, 'Funnel', 87, 2, 0, NULL, '2020-10-11 10:01:18', 2, NULL, NULL),
(105, 'Lacer', 88, 2, 0, NULL, '2020-10-11 10:01:19', 2, NULL, NULL),
(106, 'Mixpanel', 81, 2, 0, NULL, '2020-10-11 10:01:19', 2, NULL, NULL),
(107, 'Albelli', 80, 2, 0, NULL, '2020-10-11 10:01:19', 2, NULL, NULL),
(108, 'Quandoo', 49, 2, 0, NULL, '2020-10-11 10:01:19', 2, NULL, NULL),
(109, 'Addisons', 89, 2, 0, NULL, '2020-10-11 10:01:20', 2, NULL, NULL),
(110, 'Addisons', 51, 2, 0, NULL, '2020-10-11 10:01:20', 2, NULL, NULL),
(111, 'Addisons', 90, 2, 0, NULL, '2020-10-11 10:01:20', 2, NULL, NULL),
(112, 'HomeServe France', 61, 2, 0, NULL, '2020-10-11 10:01:20', 2, NULL, NULL),
(113, 'Coca-Cola South Pacific ', 91, 2, 0, NULL, '2020-10-11 10:01:20', 2, NULL, NULL),
(114, 'Albelli', 92, 2, 0, NULL, '2020-10-11 10:01:21', 2, NULL, NULL),
(115, 'Coca-Cola South Pacific ', 93, 2, 0, NULL, '2020-10-11 10:01:21', 2, NULL, NULL),
(116, 'Coca-Cola South Pacific ', 94, 2, 0, NULL, '2020-10-11 10:01:21', 2, NULL, NULL),
(117, 'HomeServe France', 45, 2, 0, NULL, '2020-10-11 10:01:22', 2, NULL, NULL),
(118, '\"e.GO Mobile AG \"', 47, 2, 0, NULL, '2020-10-11 10:01:22', 2, NULL, NULL),
(119, 'e.GO Mobile AG ', 47, 2, 0, NULL, '2020-10-11 10:01:22', 2, NULL, NULL),
(120, ' Signaturit ', 95, 2, 0, NULL, '2020-10-11 10:01:22', 2, NULL, NULL),
(121, '\"e.GO Mobile AG \"', 96, 2, 0, NULL, '2020-10-11 10:01:23', 2, NULL, NULL),
(122, 'Sana Commerce', 77, 2, 0, NULL, '2020-10-11 10:01:23', 2, NULL, NULL),
(123, 'Teamtailor', 87, 2, 0, NULL, '2020-10-11 10:01:23', 2, NULL, NULL),
(124, 'BUTAGAZ', 97, 2, 0, NULL, '2020-10-11 10:01:23', 2, NULL, NULL),
(125, 'Xavier ', 98, 2, 0, NULL, '2020-10-11 10:01:24', 2, NULL, NULL),
(126, 'SEMIC', 99, 2, 0, NULL, '2020-10-11 10:01:24', 2, NULL, NULL),
(127, 'Bannerflow', 78, 2, 0, NULL, '2020-10-11 10:01:24', 2, NULL, NULL),
(128, 'SEMIC', 81, 2, 0, NULL, '2020-10-11 10:01:25', 2, NULL, NULL),
(129, 'Bannerflow', 83, 2, 0, NULL, '2020-10-11 10:01:25', 2, NULL, NULL),
(130, 'Bannerflow', 100, 2, 0, NULL, '2020-10-11 10:01:25', 2, NULL, NULL),
(131, 'Mixpanel', 79, 2, 0, NULL, '2020-10-11 10:01:26', 2, NULL, NULL),
(132, 'Telindus Nederland', 77, 2, 0, NULL, '2020-10-11 10:01:26', 2, NULL, NULL),
(133, 'BUTAGAZ', 101, 2, 0, NULL, '2020-10-11 10:01:26', 2, NULL, NULL),
(134, 'BUTAGAZ', 102, 2, 0, NULL, '2020-10-11 10:01:27', 2, NULL, NULL),
(135, 'LOVOO', 65, 2, 0, NULL, '2020-10-11 10:01:27', 2, NULL, NULL),
(136, 'Domain', 48, 2, 0, NULL, '2020-10-11 10:01:27', 2, NULL, NULL),
(137, 'PLM Group', 100, 2, 0, NULL, '2020-10-11 10:01:27', 2, NULL, NULL),
(138, 'Taxfix', 103, 2, 0, NULL, '2020-10-11 10:01:27', 2, NULL, NULL),
(139, 'Richardson & Wrench', 104, 2, 0, NULL, '2020-10-11 10:01:28', 2, NULL, NULL),
(140, 'Employment Hero', 51, 2, 0, NULL, '2020-10-11 10:01:28', 2, NULL, NULL),
(141, 'Taxfix', 65, 2, 0, NULL, '2020-10-11 10:01:28', 2, NULL, NULL),
(142, 'Employment Hero', 48, 2, 0, NULL, '2020-10-11 10:01:28', 2, NULL, NULL),
(143, 'BUTAGAZ', 105, 2, 0, NULL, '2020-10-11 10:01:28', 2, NULL, NULL),
(144, 'CodeValue', 106, 2, 0, NULL, '2020-10-11 10:01:29', 2, NULL, NULL),
(145, 'Coopers Brewery Ltd.  ', 51, 2, 0, NULL, '2020-10-11 10:01:30', 2, NULL, NULL),
(146, 'Coopers Brewery Ltd.', 51, 2, 0, NULL, '2020-10-11 10:01:30', 2, NULL, NULL),
(147, 'Coopers Brewery Ltd.', 48, 2, 0, NULL, '2020-10-11 10:01:31', 2, NULL, NULL),
(148, 'Blacklane', 65, 2, 0, NULL, '2020-10-11 10:01:31', 2, NULL, NULL),
(149, 'CodeValue', 107, 2, 0, NULL, '2020-10-11 10:01:31', 2, NULL, NULL),
(150, 'Mixpanel', 108, 2, 0, NULL, '2020-10-11 10:01:31', 2, NULL, NULL),
(151, 'European Merchant Services', 82, 2, 0, NULL, '2020-10-11 10:01:32', 2, NULL, NULL),
(152, 'Lyreco Italia Srl', 109, 2, 0, NULL, '2020-10-11 10:01:32', 2, NULL, NULL),
(153, 'Taxfix', 110, 2, 0, NULL, '2020-10-11 10:01:32', 2, NULL, NULL),
(154, 'Contentful', 47, 2, 0, NULL, '2020-10-11 10:01:32', 2, NULL, NULL),
(155, 'LiveU LTD', 111, 2, 0, NULL, '2020-10-11 10:01:33', 2, NULL, NULL),
(156, 'Tealium', 112, 2, 0, NULL, '2020-10-11 10:01:33', 2, NULL, NULL),
(157, 'Axesor', 81, 2, 0, NULL, '2020-10-11 10:01:33', 2, NULL, NULL),
(158, 'XOOM Energy', 113, 2, 0, NULL, '2020-10-11 10:01:33', 2, NULL, NULL),
(159, 'GALIAN', 114, 2, 0, NULL, '2020-10-11 10:01:33', 2, NULL, NULL),
(160, 'Tealium', 111, 2, 0, NULL, '2020-10-11 10:01:34', 2, NULL, NULL),
(161, 'OYO LIFE', 115, 2, 0, NULL, '2020-10-11 10:01:34', 2, NULL, NULL),
(162, 'GALIAN', 116, 2, 0, NULL, '2020-10-11 10:01:34', 2, NULL, NULL),
(163, 'Tripwire', 112, 2, 0, NULL, '2020-10-11 10:01:34', 2, NULL, NULL),
(164, 'SSY - Simpson Spence Young', 117, 2, 0, NULL, '2020-10-11 10:01:35', 2, NULL, NULL),
(165, 'Contabilizei', 118, 2, 0, NULL, '2020-10-11 10:01:35', 2, NULL, NULL),
(166, 'GALIAN', 119, 2, 0, NULL, '2020-10-11 10:01:35', 2, NULL, NULL),
(167, 'KEEN', 111, 2, 0, NULL, '2020-10-11 10:01:35', 2, NULL, NULL),
(168, 'The Proactiv Company', 112, 2, 0, NULL, '2020-10-11 10:01:35', 2, NULL, NULL),
(169, 'Altiostar Networks, Inc.', 120, 2, 0, NULL, '2020-10-11 10:01:36', 2, NULL, NULL),
(170, 'Vena Energy', 120, 2, 0, NULL, '2020-10-11 10:01:36', 2, NULL, NULL),
(171, 'The Proactiv Company', 113, 2, 0, NULL, '2020-10-11 10:01:37', 2, NULL, NULL),
(172, 'Kenes Group', 121, 2, 0, NULL, '2020-10-11 10:01:37', 2, NULL, NULL),
(173, 'Kenes Group', 122, 2, 0, NULL, '2020-10-11 10:01:37', 2, NULL, NULL),
(174, 'Kenes Group', 123, 2, 0, NULL, '2020-10-11 10:01:38', 2, NULL, NULL),
(175, 'Kenes Group', 124, 2, 0, NULL, '2020-10-11 10:01:38', 2, NULL, NULL),
(176, 'Kenes Group', 125, 2, 0, NULL, '2020-10-11 10:01:38', 2, NULL, NULL),
(177, 'Semantic Systems SL', 126, 2, 0, NULL, '2020-10-11 10:01:38', 2, NULL, NULL),
(178, 'Semantic Systems SL', 127, 2, 0, NULL, '2020-10-11 10:01:39', 2, NULL, NULL),
(179, 'MultiSafepay', 81, 2, 0, NULL, '2020-10-11 10:01:39', 2, NULL, NULL),
(180, 'Synchro - Solução Fiscal ', 128, 2, 0, NULL, '2020-10-11 10:01:40', 2, NULL, NULL),
(181, 'Dígitro Tecnologia ', 129, 2, 0, NULL, '2020-10-11 10:01:40', 2, NULL, NULL),
(182, 'Worldsensing ', 130, 2, 0, NULL, '2020-10-11 10:01:41', 2, NULL, NULL),
(183, 'Fidor Bank AG', 47, 2, 0, NULL, '2020-10-11 10:01:41', 2, NULL, NULL),
(184, 'Worldsensing', 131, 2, 0, NULL, '2020-10-11 10:01:41', 2, NULL, NULL),
(185, 'Fidor Bank AG', 65, 2, 0, NULL, '2020-10-11 10:01:41', 2, NULL, NULL),
(186, 'Worldsensing', 132, 2, 0, NULL, '2020-10-11 10:01:41', 2, NULL, NULL),
(187, 'BrandMaker', 47, 2, 0, NULL, '2020-10-11 10:01:42', 2, NULL, NULL),
(188, 'Cromex', 118, 2, 0, NULL, '2020-10-11 10:01:42', 2, NULL, NULL),
(189, ' Partnerize', 111, 2, 0, NULL, '2020-10-11 10:01:42', 2, NULL, NULL),
(190, 'BrandMaker', 65, 2, 0, NULL, '2020-10-11 10:01:42', 2, NULL, NULL),
(191, 'Worldsensing', 133, 2, 0, NULL, '2020-10-11 10:01:42', 2, NULL, NULL),
(192, 'Worldsensing', 134, 2, 0, NULL, '2020-10-11 10:01:43', 2, NULL, NULL),
(193, 'Albelli', 63, 2, 0, NULL, '2020-10-11 10:01:43', 2, NULL, NULL),
(194, 'Innova-tsn', 81, 2, 0, NULL, '2020-10-11 10:01:43', 2, NULL, NULL),
(195, 'Volvo Car Mobility', 135, 2, 0, NULL, '2020-10-11 10:01:44', 2, NULL, NULL),
(196, 'Worldsensing', 136, 2, 0, NULL, '2020-10-11 10:01:45', 2, NULL, NULL),
(197, 'Partnerize', 137, 2, 0, NULL, '2020-10-11 10:01:45', 2, NULL, NULL),
(198, 'Worldsensing', 138, 2, 0, NULL, '2020-10-11 10:01:45', 2, NULL, NULL),
(199, 'Prolival', 139, 2, 0, NULL, '2020-10-11 10:01:45', 2, NULL, NULL),
(200, 'Denodo', 81, 2, 0, NULL, '2020-10-11 10:01:46', 2, NULL, NULL),
(201, 'AFPRO Filters', 77, 2, 0, NULL, '2020-10-11 10:01:46', 2, NULL, NULL),
(202, 'Toby\'s Estate Coffee Roasters ', 48, 2, 0, NULL, '2020-10-11 10:01:46', 2, NULL, NULL),
(203, 'Quion', 80, 2, 0, NULL, '2020-10-11 10:01:46', 2, NULL, NULL),
(204, 'Denodo', 79, 2, 0, NULL, '2020-10-11 10:01:47', 2, NULL, NULL),
(205, 'Toby\'s Estate Coffee Roasters', 89, 2, 0, NULL, '2020-10-11 10:01:47', 2, NULL, NULL),
(206, 'Toby\'s Estate Coffee Roasters', 48, 2, 0, NULL, '2020-10-11 10:01:47', 2, NULL, NULL),
(207, 'Toby\'s Estate Coffee Roasters', 140, 2, 0, NULL, '2020-10-11 10:01:48', 2, NULL, NULL),
(208, 'Quion', 74, 2, 0, NULL, '2020-10-11 10:01:48', 2, NULL, NULL),
(209, 'Toby\'s Estate Coffee Roasters', 51, 2, 0, NULL, '2020-10-11 10:01:48', 2, NULL, NULL),
(210, 'Toby\'s Estate Coffee Roasters', 49, 2, 0, NULL, '2020-10-11 10:01:49', 2, NULL, NULL),
(211, 'Comerc Energia', 118, 2, 0, NULL, '2020-10-11 10:01:49', 2, NULL, NULL),
(212, ' Rokt ', 48, 2, 0, NULL, '2020-10-11 10:01:49', 2, NULL, NULL),
(213, ' Rokt', 48, 2, 0, NULL, '2020-10-11 10:01:49', 2, NULL, NULL),
(214, ' Rokt ', 141, 2, 0, NULL, '2020-10-11 10:01:49', 2, NULL, NULL),
(215, ' Tokyo American Club', 111, 2, 0, NULL, '2020-10-11 10:01:50', 2, NULL, NULL),
(216, 'Quion', 63, 2, 0, NULL, '2020-10-11 10:01:50', 2, NULL, NULL),
(217, 'Tokyo American Club', 137, 2, 0, NULL, '2020-10-11 10:01:50', 2, NULL, NULL),
(218, 'Domestika', 142, 2, 0, NULL, '2020-10-11 10:01:50', 2, NULL, NULL),
(219, 'Domestika', 79, 2, 0, NULL, '2020-10-11 10:01:52', 2, NULL, NULL),
(220, 'Domestika', 73, 2, 0, NULL, '2020-10-11 10:01:52', 2, NULL, NULL),
(221, 'Lacer', 143, 2, 0, NULL, '2020-10-11 10:01:52', 2, NULL, NULL),
(222, 'Domestika', 108, 2, 0, NULL, '2020-10-11 10:01:53', 2, NULL, NULL),
(223, '\"Service IT. \"', 118, 2, 0, NULL, '2020-10-11 10:01:53', 2, NULL, NULL),
(224, 'Lacer', 144, 2, 0, NULL, '2020-10-11 10:01:53', 2, NULL, NULL),
(225, 'Vena Energy', 113, 2, 0, NULL, '2020-10-11 10:01:53', 2, NULL, NULL),
(226, 'Vena Energy', 145, 2, 0, NULL, '2020-10-11 10:01:54', 2, NULL, NULL),
(227, ' Quion', 82, 2, 0, NULL, '2020-10-11 10:01:55', 2, NULL, NULL),
(228, 'Beacon Communications', 137, 2, 0, NULL, '2020-10-11 10:01:55', 2, NULL, NULL),
(229, 'Beacon Communications', 145, 2, 0, NULL, '2020-10-11 10:01:55', 2, NULL, NULL),
(230, 'Lacer', 146, 2, 0, NULL, '2020-10-11 10:01:55', 2, NULL, NULL),
(231, 'Cybereason', 112, 2, 0, NULL, '2020-10-11 10:01:56', 2, NULL, NULL),
(232, 'Cybereason', 111, 2, 0, NULL, '2020-10-11 10:01:56', 2, NULL, NULL),
(233, 'NewStore, Inc.', 47, 2, 0, NULL, '2020-10-11 10:01:56', 2, NULL, NULL),
(234, 'Jumbo Tours España S.L.', 81, 2, 0, NULL, '2020-10-11 10:01:57', 2, NULL, NULL),
(235, 'Unitronics', 81, 2, 0, NULL, '2020-10-11 10:01:57', 2, NULL, NULL),
(236, 'Jumbo Tours España S.L.', 142, 2, 0, NULL, '2020-10-11 10:01:57', 2, NULL, NULL),
(237, ' College ter Beoordeling van Geneesmiddelen', 82, 2, 0, NULL, '2020-10-11 10:01:58', 2, NULL, NULL),
(238, 'EIMS', 81, 2, 0, NULL, '2020-10-11 10:01:59', 2, NULL, NULL),
(239, 'EIMS', 142, 2, 0, NULL, '2020-10-11 10:01:59', 2, NULL, NULL),
(240, 'EIT InnoEnergy', 80, 2, 0, NULL, '2020-10-11 10:02:00', 2, NULL, NULL),
(241, 'Marelli', 118, 2, 0, NULL, '2020-10-11 10:02:00', 2, NULL, NULL),
(242, 'Marelli', 128, 2, 0, NULL, '2020-10-11 10:02:00', 2, NULL, NULL),
(243, 'DigitalRoute', 84, 2, 0, NULL, '2020-10-11 10:02:01', 2, NULL, NULL),
(244, ' Whisbi ', 79, 2, 0, NULL, '2020-10-11 10:02:01', 2, NULL, NULL),
(245, 'EIT InnoEnergy', 74, 2, 0, NULL, '2020-10-11 10:02:01', 2, NULL, NULL),
(246, ' Whisbi ', 81, 2, 0, NULL, '2020-10-11 10:02:01', 2, NULL, NULL),
(247, 'QUNIE Corporation', 113, 2, 0, NULL, '2020-10-11 10:02:02', 2, NULL, NULL),
(248, 'happn', 52, 2, 0, NULL, '2020-10-11 10:02:02', 2, NULL, NULL),
(249, 'Copaco', 80, 2, 0, NULL, '2020-10-11 10:02:02', 2, NULL, NULL),
(250, 'Whisbi', 142, 2, 0, NULL, '2020-10-11 10:02:03', 2, NULL, NULL),
(251, 'ID Finance', 147, 2, 0, NULL, '2020-10-11 10:02:03', 2, NULL, NULL),
(252, 'Copaco', 82, 2, 0, NULL, '2020-10-11 10:02:03', 2, NULL, NULL),
(253, 'Whisbi', 108, 2, 0, NULL, '2020-10-11 10:02:04', 2, NULL, NULL),
(254, 'Monte Carlo ', 128, 2, 0, NULL, '2020-10-11 10:02:04', 2, NULL, NULL),
(255, 'happn', 57, 2, 0, NULL, '2020-10-11 10:02:04', 2, NULL, NULL),
(256, ' ELEMENTS GLOBAL SERVICES ', 81, 2, 0, NULL, '2020-10-11 10:02:04', 2, NULL, NULL),
(257, 'Axesor', 99, 2, 0, NULL, '2020-10-11 10:02:04', 2, NULL, NULL),
(258, 'Monte Carlo ', 148, 2, 0, NULL, '2020-10-11 10:02:05', 2, NULL, NULL),
(259, 'Organisation for the Prohibition of Chemical Weapons', 63, 2, 0, NULL, '2020-10-11 10:02:05', 2, NULL, NULL),
(260, ' ELEMENTS GLOBAL SERVICES ', 108, 2, 0, NULL, '2020-10-11 10:02:05', 2, NULL, NULL),
(261, 'DigitalRoute', 87, 2, 0, NULL, '2020-10-11 10:02:05', 2, NULL, NULL),
(262, 'Axesor', 79, 2, 0, NULL, '2020-10-11 10:02:06', 2, NULL, NULL),
(263, ' ELEMENTS GLOBAL SERVICES ', 73, 2, 0, NULL, '2020-10-11 10:02:06', 2, NULL, NULL),
(264, 'Slimstock', 77, 2, 0, NULL, '2020-10-11 10:02:06', 2, NULL, NULL),
(265, 'Quintas Energy', 108, 2, 0, NULL, '2020-10-11 10:02:06', 2, NULL, NULL),
(266, ' ITnow', 149, 2, 0, NULL, '2020-10-11 10:02:07', 2, NULL, NULL),
(267, 'Slimstock', 80, 2, 0, NULL, '2020-10-11 10:02:07', 2, NULL, NULL),
(268, 'American Chamber of Commerce in Japan', 150, 2, 0, NULL, '2020-10-11 10:02:07', 2, NULL, NULL),
(269, 'Quintas Energy', 81, 2, 0, NULL, '2020-10-11 10:02:07', 2, NULL, NULL),
(270, 'Quintas Energy', 151, 2, 0, NULL, '2020-10-11 10:02:08', 2, NULL, NULL),
(271, 'Slimstock', 74, 2, 0, NULL, '2020-10-11 10:02:08', 2, NULL, NULL),
(272, 'Koninklijke Gazelle', 74, 2, 0, NULL, '2020-10-11 10:02:08', 2, NULL, NULL),
(273, 'Cybereason', 152, 2, 0, NULL, '2020-10-11 10:02:09', 2, NULL, NULL),
(274, 'Cybereason', 153, 2, 0, NULL, '2020-10-11 10:02:10', 2, NULL, NULL),
(275, 'European Merchant Services', 63, 2, 0, NULL, '2020-10-11 10:02:10', 2, NULL, NULL),
(276, 'Contentful', 65, 2, 0, NULL, '2020-10-11 10:02:10', 2, NULL, NULL),
(277, 'Lyreco Italia Srl', 154, 2, 0, NULL, '2020-10-11 10:02:11', 2, NULL, NULL),
(278, ' COMATCH ', 47, 2, 0, NULL, '2020-10-11 10:02:11', 2, NULL, NULL),
(279, 'Contentful', 110, 2, 0, NULL, '2020-10-11 10:02:11', 2, NULL, NULL),
(280, 'Lyreco Italia Srl', 155, 2, 0, NULL, '2020-10-11 10:02:12', 2, NULL, NULL),
(281, 'Paidy', 156, 2, 0, NULL, '2020-10-11 10:02:12', 2, NULL, NULL),
(282, 'Contentful', 67, 2, 0, NULL, '2020-10-11 10:02:12', 2, NULL, NULL),
(283, 'European Merchant Services', 77, 2, 0, NULL, '2020-10-11 10:02:13', 2, NULL, NULL),
(284, 'Paidy', 157, 2, 0, NULL, '2020-10-11 10:02:14', 2, NULL, NULL),
(285, 'Koninklijke Gazelle', 80, 2, 0, NULL, '2020-10-11 10:02:14', 2, NULL, NULL),
(286, 'Koninklijke Gazelle', 46, 2, 0, NULL, '2020-10-11 10:02:14', 2, NULL, NULL),
(287, 'CDNetworks', 112, 2, 0, NULL, '2020-10-11 10:02:14', 2, NULL, NULL),
(288, 'Paidy', 111, 2, 0, NULL, '2020-10-11 10:02:15', 2, NULL, NULL),
(289, 'UDON', 142, 2, 0, NULL, '2020-10-11 10:02:15', 2, NULL, NULL),
(290, 'UDON', 79, 2, 0, NULL, '2020-10-11 10:02:15', 2, NULL, NULL),
(291, 'Freightos', 107, 2, 0, NULL, '2020-10-11 10:02:16', 2, NULL, NULL),
(292, 'Freightos', 106, 2, 0, NULL, '2020-10-11 10:02:16', 2, NULL, NULL),
(293, 'CDNetworks', 111, 2, 0, NULL, '2020-10-11 10:02:16', 2, NULL, NULL),
(294, 'UDON', 81, 2, 0, NULL, '2020-10-11 10:02:16', 2, NULL, NULL),
(295, 'Mister Spex', 65, 2, 0, NULL, '2020-10-11 10:02:16', 2, NULL, NULL),
(296, 'Tiendeo', 81, 2, 0, NULL, '2020-10-11 10:02:18', 2, NULL, NULL),
(297, 'CYMOTIVE Technologies.', 107, 2, 0, NULL, '2020-10-11 10:02:19', 2, NULL, NULL),
(298, 'Mister Spex', 67, 2, 0, NULL, '2020-10-11 10:02:19', 2, NULL, NULL),
(299, 'Blueair', 87, 2, 0, NULL, '2020-10-11 10:02:20', 2, NULL, NULL),
(300, 'Blueair', 84, 2, 0, NULL, '2020-10-11 10:02:20', 2, NULL, NULL),
(301, 'PeroxyChem', 158, 2, 0, NULL, '2020-10-11 10:02:21', 2, NULL, NULL),
(302, ' Between Technology', 99, 2, 0, NULL, '2020-10-11 10:02:21', 2, NULL, NULL),
(303, 'Celeno', 106, 2, 0, NULL, '2020-10-11 10:02:21', 2, NULL, NULL),
(304, 'Musement', 109, 2, 0, NULL, '2020-10-11 10:02:22', 2, NULL, NULL),
(305, 'Musement', 159, 2, 0, NULL, '2020-10-11 10:02:22', 2, NULL, NULL),
(306, 'Musement', 160, 2, 0, NULL, '2020-10-11 10:02:23', 2, NULL, NULL),
(307, ' Optima Gaming ', 79, 2, 0, NULL, '2020-10-11 10:02:23', 2, NULL, NULL),
(308, 'Musement', 154, 2, 0, NULL, '2020-10-11 10:02:23', 2, NULL, NULL),
(309, ' Optima Gaming', 73, 2, 0, NULL, '2020-10-11 10:02:23', 2, NULL, NULL),
(310, ' Optima Gaming', 108, 2, 0, NULL, '2020-10-11 10:02:24', 2, NULL, NULL),
(311, ' Optima Gaming ', 142, 2, 0, NULL, '2020-10-11 10:02:24', 2, NULL, NULL),
(312, 'Celeno', 107, 2, 0, NULL, '2020-10-11 10:02:25', 2, NULL, NULL),
(313, 'Autotrac Comércio e Telecomunicações S.A.', 161, 2, 0, NULL, '2020-10-11 10:02:25', 2, NULL, NULL),
(314, 'Ampelmann Operations', 80, 2, 0, NULL, '2020-10-11 10:02:25', 2, NULL, NULL),
(315, 'Autotrac Comércio e Telecomunicações S.A.', 118, 2, 0, NULL, '2020-10-11 10:02:25', 2, NULL, NULL),
(316, 'CDNetworks', 145, 2, 0, NULL, '2020-10-11 10:02:25', 2, NULL, NULL),
(317, 'Unruly', 111, 2, 0, NULL, '2020-10-11 10:02:26', 2, NULL, NULL),
(318, 'WorkFusion', 111, 2, 0, NULL, '2020-10-11 10:02:27', 2, NULL, NULL),
(319, 'WorkFusion', 117, 2, 0, NULL, '2020-10-11 10:02:27', 2, NULL, NULL),
(320, 'Between Technology', 142, 2, 0, NULL, '2020-10-11 10:02:27', 2, NULL, NULL),
(321, 'Unit4 Bedrijfssoftware', 82, 2, 0, NULL, '2020-10-11 10:02:27', 2, NULL, NULL),
(322, 'Biosearch Life ', 81, 2, 0, NULL, '2020-10-11 10:02:28', 2, NULL, NULL),
(323, 'Celeno', 162, 2, 0, NULL, '2020-10-11 10:02:28', 2, NULL, NULL),
(324, 'inRiver', 87, 2, 0, NULL, '2020-10-11 10:02:29', 2, NULL, NULL),
(325, 'Galooli', 106, 2, 0, NULL, '2020-10-11 10:02:29', 2, NULL, NULL),
(326, 'Biosearch Life', 163, 2, 0, NULL, '2020-10-11 10:02:29', 2, NULL, NULL),
(327, 'Unit4 Bedrijfssoftware', 77, 2, 0, NULL, '2020-10-11 10:02:29', 2, NULL, NULL),
(328, 'Biosearch Life', 81, 2, 0, NULL, '2020-10-11 10:02:29', 2, NULL, NULL),
(329, 'Autotalks', 62, 2, 0, NULL, '2020-10-11 10:02:30', 2, NULL, NULL),
(330, 'Biosearch Life', 79, 2, 0, NULL, '2020-10-11 10:02:30', 2, NULL, NULL),
(331, 'Autotalks', 107, 2, 0, NULL, '2020-10-11 10:02:30', 2, NULL, NULL),
(332, 'Ampelmann Operations', 77, 2, 0, NULL, '2020-10-11 10:02:30', 2, NULL, NULL),
(333, 'Priority Software (ERP)', 107, 2, 0, NULL, '2020-10-11 10:02:31', 2, NULL, NULL),
(334, 'Priority Software (ERP)', 62, 2, 0, NULL, '2020-10-11 10:02:31', 2, NULL, NULL),
(335, 'Teamtailor', 86, 2, 0, NULL, '2020-10-11 10:02:32', 2, NULL, NULL),
(336, 'Dynavax Technologies', 96, 2, 0, NULL, '2020-10-11 10:02:32', 2, NULL, NULL),
(337, 'Dynavax Technologies', 72, 2, 0, NULL, '2020-10-11 10:02:32', 2, NULL, NULL),
(338, ' freenet digital', 65, 2, 0, NULL, '2020-10-11 10:02:32', 2, NULL, NULL),
(339, 'Optimove', 107, 2, 0, NULL, '2020-10-11 10:02:32', 2, NULL, NULL),
(340, 'European Merchant Services', 164, 2, 0, NULL, '2020-10-11 10:02:33', 2, NULL, NULL),
(341, 'GRAVIS Computervertriebsgesellschaft mbH', 65, 2, 0, NULL, '2020-10-11 10:02:34', 2, NULL, NULL),
(342, 'inRiver', 84, 2, 0, NULL, '2020-10-11 10:02:34', 2, NULL, NULL),
(343, 'Quandoo', 110, 2, 0, NULL, '2020-10-11 10:02:34', 2, NULL, NULL),
(344, 'Volvo Car Mobility', 165, 2, 0, NULL, '2020-10-11 10:02:35', 2, NULL, NULL),
(345, 'TBWA\\HAKUHODO', 145, 2, 0, NULL, '2020-10-11 10:02:35', 2, NULL, NULL),
(346, 'Unit4 Bedrijfssoftware', 80, 2, 0, NULL, '2020-10-11 10:02:35', 2, NULL, NULL),
(347, 'Scope Group', 96, 2, 0, NULL, '2020-10-11 10:02:35', 2, NULL, NULL),
(348, 'Between Technology', 99, 2, 0, NULL, '2020-10-11 10:02:35', 2, NULL, NULL),
(349, 'Scope Group', 67, 2, 0, NULL, '2020-10-11 10:02:36', 2, NULL, NULL),
(350, 'Palex Medical', 81, 2, 0, NULL, '2020-10-11 10:02:36', 2, NULL, NULL),
(351, 'Triboo Group', 166, 2, 0, NULL, '2020-10-11 10:02:36', 2, NULL, NULL),
(352, 'Unit4 Bedrijfssoftware', 167, 2, 0, NULL, '2020-10-11 10:02:36', 2, NULL, NULL),
(353, 'Palex Medical', 79, 2, 0, NULL, '2020-10-11 10:02:37', 2, NULL, NULL),
(354, 'Triboo Group', 168, 2, 0, NULL, '2020-10-11 10:02:37', 2, NULL, NULL),
(355, 'Palex Medical', 99, 2, 0, NULL, '2020-10-11 10:02:37', 2, NULL, NULL),
(356, 'Triboo Group', 169, 2, 0, NULL, '2020-10-11 10:02:37', 2, NULL, NULL),
(357, ' Palex Medical', 81, 2, 0, NULL, '2020-10-11 10:02:37', 2, NULL, NULL),
(358, 'Teamtailor', 85, 2, 0, NULL, '2020-10-11 10:02:38', 2, NULL, NULL),
(359, 'Triboo Group', 170, 2, 0, NULL, '2020-10-11 10:02:38', 2, NULL, NULL),
(360, 'Triboo Group', 171, 2, 0, NULL, '2020-10-11 10:02:38', 2, NULL, NULL),
(361, 'Triboo Group', 172, 2, 0, NULL, '2020-10-11 10:02:39', 2, NULL, NULL),
(362, 'Triboo Group', 173, 2, 0, NULL, '2020-10-11 10:02:39', 2, NULL, NULL),
(363, 'Optimove', 174, 2, 0, NULL, '2020-10-11 10:02:40', 2, NULL, NULL),
(364, 'Scope Group', 65, 2, 0, NULL, '2020-10-11 10:02:40', 2, NULL, NULL),
(365, 'Scope Group', 68, 2, 0, NULL, '2020-10-11 10:02:40', 2, NULL, NULL),
(366, ' Signaturit ', 98, 2, 0, NULL, '2020-10-11 10:02:40', 2, NULL, NULL),
(367, 'Optimove', 106, 2, 0, NULL, '2020-10-11 10:02:41', 2, NULL, NULL),
(368, 'Optimove', 62, 2, 0, NULL, '2020-10-11 10:02:41', 2, NULL, NULL),
(369, 'Optimove', 60, 2, 0, NULL, '2020-10-11 10:02:41', 2, NULL, NULL),
(370, 'Scope Group', 47, 2, 0, NULL, '2020-10-11 10:02:42', 2, NULL, NULL),
(371, '- COYOTE -', 109, 2, 0, NULL, '2020-10-11 10:02:42', 2, NULL, NULL),
(372, 'Boyd & Moore Executive Search', 111, 2, 0, NULL, '2020-10-11 10:02:43', 2, NULL, NULL),
(373, 'PLM Group', 175, 2, 0, NULL, '2020-10-11 10:02:43', 2, NULL, NULL),
(374, 'Palex Medical', 73, 2, 0, NULL, '2020-10-11 10:02:43', 2, NULL, NULL),
(375, 'Social Blue', 176, 2, 0, NULL, '2020-10-11 10:02:43', 2, NULL, NULL),
(376, 'ITnow', 149, 2, 0, NULL, '2020-10-11 10:02:43', 2, NULL, NULL),
(377, 'Recruit Co.,Ltd.', 112, 2, 0, NULL, '2020-10-11 10:02:44', 2, NULL, NULL),
(378, 'Natural Intelligence', 177, 2, 0, NULL, '2020-10-11 10:02:44', 2, NULL, NULL),
(379, 'Natural Intelligence', 178, 2, 0, NULL, '2020-10-11 10:02:44', 2, NULL, NULL),
(380, 'systemsGo', 111, 2, 0, NULL, '2020-10-11 10:02:44', 2, NULL, NULL),
(381, ' W.O.M. WORLD OF MEDICINE GmbH', 47, 2, 0, NULL, '2020-10-11 10:02:45', 2, NULL, NULL),
(382, 'Natural Intelligence', 179, 2, 0, NULL, '2020-10-11 10:02:45', 2, NULL, NULL),
(383, 'Recruit Co.,Ltd.', 111, 2, 0, NULL, '2020-10-11 10:02:45', 2, NULL, NULL),
(384, 'Talentia Software', 109, 2, 0, NULL, '2020-10-11 10:02:45', 2, NULL, NULL),
(385, 'Wantedly Inc.', 111, 2, 0, NULL, '2020-10-11 10:02:46', 2, NULL, NULL),
(386, 'Recruit Co.,Ltd.', 180, 2, 0, NULL, '2020-10-11 10:02:47', 2, NULL, NULL),
(387, 'Pendo.io', 107, 2, 0, NULL, '2020-10-11 10:02:47', 2, NULL, NULL),
(388, 'PLM Group', 181, 2, 0, NULL, '2020-10-11 10:02:47', 2, NULL, NULL),
(389, 'Aqua Security', 62, 2, 0, NULL, '2020-10-11 10:02:48', 2, NULL, NULL),
(390, 'Talentia Software', 154, 2, 0, NULL, '2020-10-11 10:02:48', 2, NULL, NULL),
(391, 'W.O.M. WORLD OF MEDICINE GmbH', 67, 2, 0, NULL, '2020-10-11 10:02:48', 2, NULL, NULL),
(392, 'Recruit Co.,Ltd.', 145, 2, 0, NULL, '2020-10-11 10:02:48', 2, NULL, NULL),
(393, 'AVT', 174, 2, 0, NULL, '2020-10-11 10:02:49', 2, NULL, NULL),
(394, 'Capita Europe', 47, 2, 0, NULL, '2020-10-11 10:02:49', 2, NULL, NULL),
(395, 'beBit', 120, 2, 0, NULL, '2020-10-11 10:02:49', 2, NULL, NULL),
(396, 'AVT', 59, 2, 0, NULL, '2020-10-11 10:02:49', 2, NULL, NULL),
(397, 'Detectify', 87, 2, 0, NULL, '2020-10-11 10:02:50', 2, NULL, NULL),
(398, 'Contentserv', 80, 2, 0, NULL, '2020-10-11 10:02:50', 2, NULL, NULL),
(399, 'Contentserv', 74, 2, 0, NULL, '2020-10-11 10:02:50', 2, NULL, NULL),
(400, 'Axactor Spain', 99, 2, 0, NULL, '2020-10-11 10:02:50', 2, NULL, NULL),
(401, 'Credito Fondiario', 182, 2, 0, NULL, '2020-10-11 10:02:50', 2, NULL, NULL),
(402, ' Axactor Spain', 99, 2, 0, NULL, '2020-10-11 10:02:51', 2, NULL, NULL),
(403, ' Palex Medical', 142, 2, 0, NULL, '2020-10-11 10:02:51', 2, NULL, NULL),
(404, 'Adjust', 47, 2, 0, NULL, '2020-10-11 10:02:51', 2, NULL, NULL),
(405, 'Recruit Co.,Ltd.', 117, 2, 0, NULL, '2020-10-11 10:02:51', 2, NULL, NULL),
(406, 'Credito Fondiario', 183, 2, 0, NULL, '2020-10-11 10:02:51', 2, NULL, NULL),
(407, 'Credito Fondiario', 184, 2, 0, NULL, '2020-10-11 10:02:52', 2, NULL, NULL),
(408, 'Credito Fondiario', 185, 2, 0, NULL, '2020-10-11 10:02:53', 2, NULL, NULL),
(409, 'Adjust', 68, 2, 0, NULL, '2020-10-11 10:02:53', 2, NULL, NULL),
(410, 'Volvo Car Mobility', 78, 2, 0, NULL, '2020-10-11 10:02:53', 2, NULL, NULL),
(411, 'Domain', 186, 2, 0, NULL, '2020-10-11 10:12:56', 2, NULL, NULL),
(412, '', 187, 2, 0, NULL, '2020-10-11 10:12:56', 2, NULL, NULL),
(413, '', 188, 2, 0, NULL, '2020-10-11 10:12:57', 2, NULL, NULL),
(414, '', 189, 2, 0, NULL, '2020-10-11 10:12:57', 2, NULL, NULL),
(415, 'k.com1', 190, 2, 0, NULL, '2020-10-11 12:46:44', 2, NULL, NULL),
(416, 'fsdfsdf', 191, 2, 0, NULL, '2020-12-03 13:09:02', 2, NULL, NULL),
(417, 'ghgh', 192, 2, 0, NULL, '2020-12-03 13:14:13', 2, NULL, NULL),
(418, 'gdfgdg', 193, 2, 0, NULL, '2020-12-03 13:17:28', 2, NULL, NULL),
(419, 'ffffff', 194, 2, 0, NULL, '2020-12-03 13:34:11', 2, NULL, NULL),
(420, 'fsdfds', 195, 2, 0, NULL, '2020-12-04 07:26:16', 2, NULL, NULL),
(421, 'p.com', 196, 2, 0, NULL, '2020-12-04 13:07:29', 2, NULL, NULL),
(422, 'eclerx.com', 197, 2, 0, NULL, '2020-12-05 06:11:16', 2, NULL, NULL),
(423, 'abc.com', 198, 2, 0, NULL, '2020-12-05 10:16:12', 2, NULL, NULL),
(424, 'hklhkl', 199, 2, 0, NULL, '2020-12-05 10:35:02', 2, NULL, NULL),
(425, 'jkhj', 200, 2, 0, NULL, '2020-12-05 10:37:15', 2, NULL, NULL),
(426, 'oo', 201, 2, 0, NULL, '2020-12-05 10:39:34', 2, NULL, NULL),
(427, 'pune', 202, 2, 0, NULL, '2020-12-05 10:47:17', 2, NULL, NULL),
(428, 'fdfdf', 203, 2, 0, NULL, '2020-12-05 12:33:31', 2, NULL, NULL),
(429, 'kjlkj', 204, 2, 0, NULL, '2020-12-05 12:41:06', 2, NULL, NULL),
(430, 'dasd', 205, 2, 0, NULL, '2020-12-05 12:45:19', 2, NULL, NULL),
(431, 'jklj', 206, 2, 0, NULL, '2020-12-05 13:05:37', 2, NULL, NULL),
(432, 'fsdf', 207, 2, 0, NULL, '2020-12-05 13:17:36', 2, NULL, NULL),
(433, 'fdfdf', 208, 2, 0, NULL, '2020-12-08 08:40:10', 2, NULL, NULL),
(434, 'kkkkk', 209, 2, 0, NULL, '2020-12-08 13:27:43', 2, NULL, NULL),
(435, 'rer', 210, 2, 0, NULL, '2020-12-09 05:48:52', 2, NULL, NULL),
(436, 'tert', 211, 2, 0, NULL, '2020-12-09 05:50:55', 2, NULL, NULL),
(437, 'fdfdf', 212, 2, 0, NULL, '2020-12-09 05:55:03', 2, NULL, NULL),
(438, 'trt', 213, 2, 0, NULL, '2020-12-09 05:58:39', 2, NULL, NULL),
(439, 'fdsf', 214, 2, 0, NULL, '2020-12-09 06:02:57', 2, NULL, NULL),
(440, 'erewr', 215, 2, 0, NULL, '2020-12-09 06:06:24', 2, NULL, NULL),
(441, 'ewe', 216, 2, 0, NULL, '2020-12-09 06:09:01', 2, NULL, NULL),
(442, 'erwer', 217, 2, 0, NULL, '2020-12-09 06:20:43', 2, NULL, NULL),
(443, 'rewrew.com', 218, 2, 0, NULL, '2020-12-09 06:26:51', 2, NULL, NULL),
(444, 'ABC', 219, 2, 0, NULL, '2020-12-09 06:33:16', 2, NULL, NULL),
(445, 'rer', 215, 2, 0, NULL, '2020-12-09 06:38:47', 2, NULL, NULL),
(446, 'dad', 220, 2, 0, NULL, '2020-12-09 06:42:08', 2, NULL, NULL),
(447, 'opiopi', 221, 2, 0, NULL, '2020-12-09 06:52:50', 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bf_email_formats`
--

CREATE TABLE `bf_email_formats` (
  `id` int(11) NOT NULL,
  `domain_id` int(11) DEFAULT NULL,
  `format` varchar(64) DEFAULT NULL,
  `src` varchar(254) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bf_email_logs`
--

CREATE TABLE `bf_email_logs` (
  `id` int(11) NOT NULL,
  `email_id` varchar(64) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `campain_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `batch` int(11) NOT NULL,
  `tool` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bf_email_logs`
--

INSERT INTO `bf_email_logs` (`id`, `email_id`, `status`, `campain_id`, `customer_id`, `batch`, `tool`) VALUES
(1, 'email_id', 0, 0, 0, 0, '0'),
(2, 'keshav', 1, 2, 2, 0, '0'),
(3, 'bhusan', 2, 2, 2, 0, '0'),
(4, 'email_id', 0, 0, 2, 143, '0'),
(5, 'keshav', 1, 2, 2, 143, '0'),
(6, 'bhusan', 2, 2, 2, 143, '0'),
(7, 'email_id', 0, 0, 2, 144, '0'),
(8, 'keshav', 1, 2, 2, 144, '0'),
(9, 'bhusan', 2, 2, 2, 144, '0'),
(10, 'email_id', 0, 0, 2, 145, '0'),
(11, 'keshav', 1, 2, 2, 145, '0'),
(12, 'bhusan', 2, 2, 2, 145, '0');

-- --------------------------------------------------------

--
-- Table structure for table `bf_email_queue`
--

CREATE TABLE `bf_email_queue` (
  `id` int(11) NOT NULL,
  `to_email` varchar(254) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `alt_message` text DEFAULT NULL,
  `max_attempts` int(11) NOT NULL DEFAULT 3,
  `attempts` int(11) NOT NULL DEFAULT 0,
  `success` tinyint(1) NOT NULL DEFAULT 0,
  `date_published` datetime DEFAULT NULL,
  `last_attempt` datetime DEFAULT NULL,
  `date_sent` datetime DEFAULT NULL,
  `csv_attachment` text DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bf_email_queue`
--

INSERT INTO `bf_email_queue` (`id`, `to_email`, `subject`, `message`, `alt_message`, `max_attempts`, `attempts`, `success`, `date_published`, `last_attempt`, `date_sent`, `csv_attachment`, `deleted`, `deleted_by`, `created_on`, `created_by`, `modified_on`, `modified_by`, `customer_id`) VALUES
(1, 'admin@mybonfire.com', 'Congratulations! Your Bonfire Emailer is working!', 'If you are seeing this email, then it appears your Bonfire Emailer is working!', NULL, 3, 1, 0, NULL, '2020-08-21 19:14:54', NULL, NULL, 0, NULL, '2020-09-17 01:12:40', NULL, NULL, NULL, NULL),
(2, 'admin@mybonfire.com', 'Congratulations! Your Bonfire Emailer is working!', 'If you are seeing this email, then it appears your Bonfire Emailer is working!', NULL, 3, 1, 0, NULL, '2020-08-21 19:14:56', NULL, NULL, 0, NULL, '2020-09-17 01:12:40', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bf_endpoints_template`
--

CREATE TABLE `bf_endpoints_template` (
  `transport` varchar(40) DEFAULT NULL,
  `aors` varchar(200) DEFAULT NULL,
  `auth` varchar(40) DEFAULT NULL,
  `context` varchar(40) NOT NULL,
  `disallow` varchar(200) DEFAULT NULL,
  `allow` varchar(200) DEFAULT NULL,
  `direct_media` enum('yes','no') DEFAULT NULL,
  `connected_line_method` enum('invite','reinvite','update') DEFAULT NULL,
  `direct_media_method` enum('invite','reinvite','update') DEFAULT NULL,
  `direct_media_glare_mitigation` enum('none','outgoing','incoming') DEFAULT NULL,
  `disable_direct_media_on_nat` enum('yes','no') DEFAULT NULL,
  `dtmf_mode` enum('rfc4733','inband','info','auto','auto_info') DEFAULT NULL,
  `external_media_address` varchar(40) DEFAULT NULL,
  `force_rport` enum('yes','no') DEFAULT NULL,
  `ice_support` enum('yes','no') DEFAULT NULL,
  `identify_by` varchar(80) DEFAULT NULL,
  `mailboxes` varchar(40) DEFAULT NULL,
  `moh_suggest` varchar(40) DEFAULT NULL,
  `outbound_auth` varchar(40) DEFAULT NULL,
  `outbound_proxy` varchar(40) DEFAULT NULL,
  `rewrite_contact` enum('yes','no') DEFAULT NULL,
  `rtp_ipv6` enum('yes','no') DEFAULT NULL,
  `rtp_symmetric` enum('yes','no') DEFAULT NULL,
  `send_diversion` enum('yes','no') DEFAULT NULL,
  `send_pai` enum('yes','no') DEFAULT NULL,
  `send_rpid` enum('yes','no') DEFAULT NULL,
  `timers_min_se` int(11) DEFAULT NULL,
  `timers` enum('forced','no','required','yes') DEFAULT NULL,
  `timers_sess_expires` int(11) DEFAULT NULL,
  `callerid` varchar(40) DEFAULT NULL,
  `callerid_privacy` enum('allowed_not_screened','allowed_passed_screened','allowed_failed_screened','allowed','prohib_not_screened','prohib_passed_screened','prohib_failed_screened','prohib','unavailable') DEFAULT NULL,
  `callerid_tag` varchar(40) DEFAULT NULL,
  `100rel` enum('no','required','yes') DEFAULT NULL,
  `aggregate_mwi` enum('yes','no') DEFAULT NULL,
  `trust_id_inbound` enum('yes','no') DEFAULT NULL,
  `trust_id_outbound` enum('yes','no') DEFAULT NULL,
  `use_ptime` enum('yes','no') DEFAULT NULL,
  `use_avpf` enum('yes','no') DEFAULT NULL,
  `media_encryption` enum('no','sdes','dtls') DEFAULT NULL,
  `inband_progress` enum('yes','no') DEFAULT NULL,
  `call_group` varchar(40) DEFAULT NULL,
  `pickup_group` varchar(40) DEFAULT NULL,
  `named_call_group` varchar(40) DEFAULT NULL,
  `named_pickup_group` varchar(40) DEFAULT NULL,
  `device_state_busy_at` int(11) DEFAULT NULL,
  `fax_detect` enum('yes','no') DEFAULT NULL,
  `t38_udptl` enum('yes','no') DEFAULT NULL,
  `t38_udptl_ec` enum('none','fec','redundancy') DEFAULT NULL,
  `t38_udptl_maxdatagram` int(11) DEFAULT NULL,
  `t38_udptl_nat` enum('yes','no') DEFAULT NULL,
  `t38_udptl_ipv6` enum('yes','no') DEFAULT NULL,
  `tone_zone` varchar(40) DEFAULT NULL,
  `language` varchar(40) DEFAULT NULL,
  `one_touch_recording` enum('yes','no') DEFAULT NULL,
  `record_on_feature` varchar(40) DEFAULT NULL,
  `record_off_feature` varchar(40) DEFAULT NULL,
  `rtp_engine` varchar(40) DEFAULT NULL,
  `allow_transfer` enum('yes','no') DEFAULT NULL,
  `allow_subscribe` enum('yes','no') DEFAULT NULL,
  `sdp_owner` varchar(40) DEFAULT NULL,
  `sdp_session` varchar(40) DEFAULT NULL,
  `tos_audio` varchar(10) DEFAULT NULL,
  `tos_video` varchar(10) DEFAULT NULL,
  `sub_min_expiry` int(11) DEFAULT NULL,
  `from_domain` varchar(40) DEFAULT NULL,
  `from_user` varchar(40) DEFAULT NULL,
  `mwi_from_user` varchar(40) DEFAULT NULL,
  `dtls_verify` varchar(40) DEFAULT NULL,
  `dtls_rekey` varchar(40) DEFAULT NULL,
  `dtls_cert_file` varchar(200) DEFAULT NULL,
  `dtls_private_key` varchar(200) DEFAULT NULL,
  `dtls_cipher` varchar(200) DEFAULT NULL,
  `dtls_ca_file` varchar(200) DEFAULT NULL,
  `dtls_ca_path` varchar(200) DEFAULT NULL,
  `dtls_setup` enum('active','passive','actpass') DEFAULT NULL,
  `srtp_tag_32` enum('yes','no') DEFAULT NULL,
  `media_address` varchar(40) DEFAULT NULL,
  `redirect_method` enum('user','uri_core','uri_pjsip') DEFAULT NULL,
  `set_var` text DEFAULT NULL,
  `cos_audio` int(11) DEFAULT NULL,
  `cos_video` int(11) DEFAULT NULL,
  `message_context` varchar(40) DEFAULT NULL,
  `force_avp` enum('yes','no') DEFAULT NULL,
  `media_use_received_transport` enum('yes','no') DEFAULT NULL,
  `accountcode` varchar(80) DEFAULT NULL,
  `user_eq_phone` enum('yes','no') DEFAULT NULL,
  `moh_passthrough` enum('yes','no') DEFAULT NULL,
  `media_encryption_optimistic` enum('yes','no') DEFAULT NULL,
  `rpid_immediate` enum('yes','no') DEFAULT NULL,
  `g726_non_standard` enum('yes','no') DEFAULT NULL,
  `rtp_keepalive` int(11) DEFAULT NULL,
  `rtp_timeout` int(11) DEFAULT NULL,
  `rtp_timeout_hold` int(11) DEFAULT NULL,
  `bind_rtp_to_media_address` enum('yes','no') DEFAULT NULL,
  `voicemail_extension` varchar(40) DEFAULT NULL,
  `mwi_subscribe_replaces_unsolicited` enum('0','1','off','on','false','true','no','yes') DEFAULT NULL,
  `deny` varchar(95) DEFAULT NULL,
  `permit` varchar(95) DEFAULT NULL,
  `acl` varchar(40) DEFAULT NULL,
  `contact_deny` varchar(95) DEFAULT NULL,
  `contact_permit` varchar(95) DEFAULT NULL,
  `contact_acl` varchar(40) DEFAULT NULL,
  `subscribe_context` varchar(40) DEFAULT NULL,
  `fax_detect_timeout` int(11) DEFAULT NULL,
  `contact_user` varchar(80) DEFAULT NULL,
  `preferred_codec_only` enum('yes','no') DEFAULT NULL,
  `asymmetric_rtp_codec` enum('yes','no') DEFAULT NULL,
  `rtcp_mux` enum('yes','no') DEFAULT NULL,
  `allow_overlap` enum('yes','no') DEFAULT NULL,
  `refer_blind_progress` enum('yes','no') DEFAULT NULL,
  `notify_early_inuse_ringing` enum('yes','no') DEFAULT NULL,
  `max_audio_streams` int(11) DEFAULT NULL,
  `max_video_streams` int(11) DEFAULT NULL,
  `webrtc` enum('yes','no') DEFAULT NULL,
  `dtls_fingerprint` enum('SHA-1','SHA-256') DEFAULT NULL,
  `incoming_mwi_mailbox` varchar(40) DEFAULT NULL,
  `bundle` enum('yes','no') DEFAULT NULL,
  `dtls_auto_generate_cert` enum('yes','no') DEFAULT NULL,
  `follow_early_media_fork` enum('yes','no') DEFAULT NULL,
  `accept_multiple_sdp_answers` enum('yes','no') DEFAULT NULL,
  `suppress_q850_reason_headers` enum('yes','no') DEFAULT NULL,
  `trust_connected_line` enum('0','1','off','on','false','true','no','yes') DEFAULT NULL,
  `send_connected_line` enum('0','1','off','on','false','true','no','yes') DEFAULT NULL,
  `ignore_183_without_sdp` enum('0','1','off','on','false','true','no','yes') DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `bf_endpoints_template`
--

INSERT INTO `bf_endpoints_template` (`transport`, `aors`, `auth`, `context`, `disallow`, `allow`, `direct_media`, `connected_line_method`, `direct_media_method`, `direct_media_glare_mitigation`, `disable_direct_media_on_nat`, `dtmf_mode`, `external_media_address`, `force_rport`, `ice_support`, `identify_by`, `mailboxes`, `moh_suggest`, `outbound_auth`, `outbound_proxy`, `rewrite_contact`, `rtp_ipv6`, `rtp_symmetric`, `send_diversion`, `send_pai`, `send_rpid`, `timers_min_se`, `timers`, `timers_sess_expires`, `callerid`, `callerid_privacy`, `callerid_tag`, `100rel`, `aggregate_mwi`, `trust_id_inbound`, `trust_id_outbound`, `use_ptime`, `use_avpf`, `media_encryption`, `inband_progress`, `call_group`, `pickup_group`, `named_call_group`, `named_pickup_group`, `device_state_busy_at`, `fax_detect`, `t38_udptl`, `t38_udptl_ec`, `t38_udptl_maxdatagram`, `t38_udptl_nat`, `t38_udptl_ipv6`, `tone_zone`, `language`, `one_touch_recording`, `record_on_feature`, `record_off_feature`, `rtp_engine`, `allow_transfer`, `allow_subscribe`, `sdp_owner`, `sdp_session`, `tos_audio`, `tos_video`, `sub_min_expiry`, `from_domain`, `from_user`, `mwi_from_user`, `dtls_verify`, `dtls_rekey`, `dtls_cert_file`, `dtls_private_key`, `dtls_cipher`, `dtls_ca_file`, `dtls_ca_path`, `dtls_setup`, `srtp_tag_32`, `media_address`, `redirect_method`, `set_var`, `cos_audio`, `cos_video`, `message_context`, `force_avp`, `media_use_received_transport`, `accountcode`, `user_eq_phone`, `moh_passthrough`, `media_encryption_optimistic`, `rpid_immediate`, `g726_non_standard`, `rtp_keepalive`, `rtp_timeout`, `rtp_timeout_hold`, `bind_rtp_to_media_address`, `voicemail_extension`, `mwi_subscribe_replaces_unsolicited`, `deny`, `permit`, `acl`, `contact_deny`, `contact_permit`, `contact_acl`, `subscribe_context`, `fax_detect_timeout`, `contact_user`, `preferred_codec_only`, `asymmetric_rtp_codec`, `rtcp_mux`, `allow_overlap`, `refer_blind_progress`, `notify_early_inuse_ringing`, `max_audio_streams`, `max_video_streams`, `webrtc`, `dtls_fingerprint`, `incoming_mwi_mailbox`, `bundle`, `dtls_auto_generate_cert`, `follow_early_media_fork`, `accept_multiple_sdp_answers`, `suppress_q850_reason_headers`, `trust_connected_line`, `send_connected_line`, `ignore_183_without_sdp`, `deleted`, `deleted_by`, `created_on`, `created_by`, `modified_on`, `modified_by`, `customer_id`) VALUES
('wss_transport', '102', '102', 'defaut', 'all', 'alaw,g722', 'no', NULL, NULL, NULL, NULL, 'auto', NULL, NULL, 'yes', NULL, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yes', 'dtls', 'no', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yes', 'yes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'fingerprint', NULL, '/etc/letsencrypt/live/linkedinextract.in/cert.pem', '/etc/letsencrypt/live/linkedinextract.in/privkey.pem', NULL, '/etc/letsencrypt/live/linkedinextract.in/fullchain.pem', NULL, 'actpass', NULL, NULL, NULL, NULL, NULL, NULL, 'ext-messaging', 'no', 'yes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 120, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 'subscriptions', NULL, NULL, NULL, NULL, 'yes', NULL, NULL, NULL, NULL, NULL, 'yes', 'SHA-1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2020-09-17 01:12:41', NULL, NULL, NULL, NULL),
('wss_transport', '101', '101', 'from-extensions', 'all', 'alaw,g722', 'no', NULL, NULL, NULL, NULL, 'auto', NULL, NULL, 'yes', NULL, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yes', 'dtls', 'no', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yes', 'yes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'fingerprint', NULL, '/etc/letsencrypt/live/linkedinextract.in/cert.pem', '/etc/letsencrypt/live/linkedinextract.in/privkey.pem', NULL, '/etc/letsencrypt/live/linkedinextract.in/fullchain.pem', NULL, 'actpass', NULL, NULL, NULL, NULL, NULL, NULL, 'ext-messaging', 'no', 'yes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 120, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 'subscriptions', NULL, NULL, NULL, NULL, 'yes', NULL, NULL, NULL, NULL, NULL, 'yes', 'SHA-1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2020-09-17 01:12:41', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bf_extension`
--

CREATE TABLE `bf_extension` (
  `ext_id` int(11) NOT NULL,
  `extension` varchar(40) NOT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(80) NOT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bf_file_upload`
--

CREATE TABLE `bf_file_upload` (
  `id` int(11) NOT NULL,
  `client` varchar(50) DEFAULT NULL,
  `Campaign` varchar(500) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `filename` varchar(100) NOT NULL,
  `status` varchar(50) DEFAULT NULL,
  `filename_actual` varchar(100) DEFAULT NULL,
  `filepath` varchar(255) NOT NULL,
  `file_size` varchar(25) NOT NULL,
  `server_filepath` varchar(500) NOT NULL,
  `fileextension` varchar(10) NOT NULL,
  `RowCount` bigint(20) DEFAULT NULL,
  `UniqueRowFound` bigint(20) DEFAULT NULL,
  `module` varchar(30) DEFAULT NULL,
  `failreportpath` varchar(500) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `message` varchar(1000) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bf_file_upload`
--

INSERT INTO `bf_file_upload` (`id`, `client`, `Campaign`, `category`, `filename`, `status`, `filename_actual`, `filepath`, `file_size`, `server_filepath`, `fileextension`, `RowCount`, `UniqueRowFound`, `module`, `failreportpath`, `message`, `deleted`, `deleted_by`, `created_on`, `created_by`, `modified_on`, `modified_by`, `customer_id`) VALUES
(48, NULL, NULL, 'Data Team', '1520363680_Template_Keshav_18_Jan.csv', 'loaded', 'Template Keshav 18 Jan.csv', '/uploads/data_upload/2018/03/06/1520363680_Template_Keshav_18_Jan.csv', '97004.24', 'C:\\xampp\\htdocs\\idata_dev\\application/modules/data_upload/assets/uploads/data_upload/2018/03/06/1520363680_Template_Keshav_18_Jan.csv', '.csv', 256849, 0, 'data_upload', 'export/data_upload/failedupload/2018/03/06/failed-1520363761.csv', 'File save to server', 0, NULL, '2018-03-06 20:14:40', 1, '2018-03-06 20:17:26', 1, NULL),
(49, NULL, NULL, 'Data Team', '1520364156_Template_Keshav_18_Jan.csv', 'uploaded', 'Template Keshav 18 Jan.csv', '/uploads/data_upload/2018/03/06/1520364156_Template_Keshav_18_Jan.csv', '97004.24', 'C:\\xampp\\htdocs\\idata_dev\\application/modules/data_upload/assets/uploads/data_upload/2018/03/06/1520364156_Template_Keshav_18_Jan.csv', '.csv', NULL, NULL, 'data_upload', '0000-00-00 00:00:00', 'File save to server', 1, 1, '2018-03-06 20:22:37', 1, NULL, NULL, NULL),
(50, NULL, NULL, 'Data Team', '1521044789_data_SampleFormat.csv', 'loaded', 'data_SampleFormat.csv', '/uploads/data_upload/2018/03/14/1521044789_data_SampleFormat.csv', '9.51', 'C:\\xampp\\htdocs\\idata_dev\\application/modules/data_upload/assets/uploads/data_upload/2018/03/14/1521044789_data_SampleFormat.csv', '.csv', 25, 0, 'data_upload', 'export/data_upload/failedupload/2018/03/14/failed-1521044796.csv', 'File save to server', 0, NULL, '2018-03-14 17:26:29', 1, '2018-03-14 17:26:36', 1, NULL),
(51, NULL, NULL, 'Data Team', '1521045247_data_SampleFormat.csv', 'loaded', 'data_SampleFormat.csv', '/uploads/data_upload/2018/03/14/1521045247_data_SampleFormat.csv', '9.51', 'C:\\xampp\\htdocs\\idata_dev\\application/modules/data_upload/assets/uploads/data_upload/2018/03/14/1521045247_data_SampleFormat.csv', '.csv', 25, 0, 'data_upload', 'export/data_upload/failedupload/2018/03/14/failed-1521045254.csv', 'File save to server', 0, NULL, '2018-03-14 17:34:07', 1, '2018-03-14 17:34:14', 1, NULL),
(52, NULL, NULL, 'Data Team', '1521045633_data_SampleFormat.csv', 'loaded', 'data_SampleFormat.csv', '/uploads/data_upload/2018/03/14/1521045633_data_SampleFormat.csv', '9.51', 'C:\\xampp\\htdocs\\idata_dev\\application/modules/data_upload/assets/uploads/data_upload/2018/03/14/1521045633_data_SampleFormat.csv', '.csv', 25, 0, 'data_upload', 'export/data_upload/failedupload/2018/03/14/failed-1521045637.csv', 'File save to server', 0, NULL, '2018-03-14 17:40:33', 1, '2018-03-14 17:40:37', 1, NULL),
(53, NULL, NULL, 'Data Team', '1521045773_data_SampleFormat.csv', 'loaded', 'data_SampleFormat.csv', '/uploads/data_upload/2018/03/14/1521045773_data_SampleFormat.csv', '9.66', 'C:\\xampp\\htdocs\\idata_dev\\application/modules/data_upload/assets/uploads/data_upload/2018/03/14/1521045773_data_SampleFormat.csv', '.csv', 25, 0, 'data_upload', 'export/data_upload/failedupload/2018/03/14/failed-1521045778.csv', 'File save to server', 0, NULL, '2018-03-14 17:42:53', 1, '2018-03-14 17:42:58', 1, NULL),
(54, NULL, NULL, 'Data Team', '1521046165_data_SampleFormat.csv', 'loaded', 'data_SampleFormat.csv', '/uploads/data_upload/2018/03/14/1521046165_data_SampleFormat.csv', '9.66', 'C:\\xampp\\htdocs\\idata_dev\\application/modules/data_upload/assets/uploads/data_upload/2018/03/14/1521046165_data_SampleFormat.csv', '.csv', 25, 25, 'data_upload', 'export/data_upload/failedupload/2018/03/14/failed-1521046207.csv', 'File save to server', 0, NULL, '2018-03-14 17:49:25', 1, '2018-03-14 17:50:08', 1, NULL),
(55, NULL, NULL, 'Data Team', '1521046370_data_SampleFormat.csv', 'loaded', 'data_SampleFormat.csv', '/uploads/data_upload/2018/03/14/1521046370_data_SampleFormat.csv', '9.66', 'C:\\xampp\\htdocs\\idata_dev\\application/modules/data_upload/assets/uploads/data_upload/2018/03/14/1521046370_data_SampleFormat.csv', '.csv', 25, 0, 'data_upload', 'export/data_upload/failedupload/2018/03/14/failed-1521046374.csv', 'File save to server', 0, NULL, '2018-03-14 17:52:50', 1, '2018-03-14 17:52:55', 1, NULL),
(56, NULL, NULL, 'Suppression Check', '1521493572_test_data_upload.csv', 'uploaded', 'test data upload.csv', '/uploads/2018/03/19/1521493572_test_data_upload.csv', '4865.57', 'C:\\xampp\\htdocs\\idata_dev\\application/modules/dataenrichment/assets/uploads/2018/03/19/1521493572_test_data_upload.csv', '.csv', NULL, NULL, 'dataenrichment', '0000-00-00 00:00:00', 'File save to server', 1, 1, '2018-03-19 22:06:12', 1, NULL, NULL, NULL),
(57, NULL, NULL, 'Data Team', '1521495343_data_SampleFormat.csv', 'uploaded', 'data_SampleFormat.csv', '/uploads/data_upload/2018/03/19/1521495343_data_SampleFormat.csv', '9.66', 'C:\\xampp\\htdocs\\idata_dev\\application/modules/data_upload/assets/uploads/data_upload/2018/03/19/1521495343_data_SampleFormat.csv', '.csv', NULL, NULL, 'data_upload', '0000-00-00 00:00:00', 'File save to server', 1, 1, '2018-03-19 22:35:43', 1, NULL, NULL, NULL),
(58, NULL, 'md5', 'Suppression Check', '1521547167_hashemail_bulk_check.csv', 'loaded', 'hashemail_bulk_check.csv', '/uploads/2018/03/20/1521547167_hashemail_bulk_check.csv', '0.2', 'C:\\xampp\\htdocs\\idata_dev\\application/modules/dataenrichment/assets/uploads/2018/03/20/1521547167_hashemail_bulk_check.csv', '.csv', NULL, NULL, 'dataenrichment', 'export/hashemails_bulk/2018/03/20/failed-1521547431.csv', 'File save to server', 0, NULL, '2018-03-20 12:59:27', 1, '2018-03-20 13:03:51', 1, NULL),
(59, NULL, NULL, 'Data Team', '1521826158_Quadient__2.csv', 'loaded', 'Quadient _2.csv', '/uploads/data_upload/2018/03/23/1521826158_Quadient__2.csv', '21.93', 'C:\\xampp\\htdocs\\idata_dev\\application/modules/data_upload/assets/uploads/data_upload/2018/03/23/1521826158_Quadient__2.csv', '.csv', 117, 5, 'data_upload', 'export/data_upload/failedupload/2018/03/23/failed-1521826163.csv', 'File save to server', 0, NULL, '2018-03-23 18:29:18', 1, '2018-03-23 18:29:23', 1, NULL),
(60, NULL, NULL, 'Data Team', '1521826320_Quadient__2.csv', 'loaded', 'Quadient _2.csv', '/uploads/data_upload/2018/03/23/1521826320_Quadient__2.csv', '21.93', 'C:\\xampp\\htdocs\\idata_dev\\application/modules/data_upload/assets/uploads/data_upload/2018/03/23/1521826320_Quadient__2.csv', '.csv', 117, 0, 'data_upload', 'export/data_upload/failedupload/2018/03/23/failed-1521826324.csv', 'File save to server', 0, NULL, '2018-03-23 18:32:00', 1, '2018-03-23 18:32:04', 1, NULL),
(61, NULL, NULL, 'Data Team', '1521826607_Quadient__2.csv', 'loaded', 'Quadient _2.csv', '/uploads/data_upload/2018/03/23/1521826607_Quadient__2.csv', '21.93', 'C:\\xampp\\htdocs\\idata_dev\\application/modules/data_upload/assets/uploads/data_upload/2018/03/23/1521826607_Quadient__2.csv', '.csv', 117, 0, 'data_upload', 'export/data_upload/failedupload/2018/03/23/failed-1521826800.csv', 'File save to server', 0, NULL, '2018-03-23 18:36:47', 1, '2018-03-23 18:40:00', 1, NULL),
(62, NULL, NULL, 'Data Team', '1521826930_Quadient__2.csv', 'loaded', 'Quadient _2.csv', '/uploads/data_upload/2018/03/23/1521826930_Quadient__2.csv', '21.93', 'C:\\xampp\\htdocs\\idata_dev\\application/modules/data_upload/assets/uploads/data_upload/2018/03/23/1521826930_Quadient__2.csv', '.csv', 117, 3, 'data_upload', 'export/data_upload/failedupload/2018/03/23/failed-1521829260.csv', 'File save to server', 0, NULL, '2018-03-23 18:42:10', 1, '2018-03-23 19:22:29', 1, NULL),
(63, NULL, NULL, 'Data Team', '1522166084_File_1.csv', 'loaded', 'File 1.csv', '/uploads/data_upload/2018/03/27/1522166084_File_1.csv', '222.47', 'C:\\xampp\\htdocs\\idata_dev\\application/modules/data_upload/assets/uploads/data_upload/2018/03/27/1522166084_File_1.csv', '.csv', 984, 500, 'data_upload', 'export/data_upload/failedupload/2018/03/27/failed-1522166091.csv', 'File save to server', 0, NULL, '2018-03-27 17:54:44', 3, '2018-03-27 20:52:28', 3, NULL),
(64, NULL, NULL, 'Data Team', '1522167681_File_1.csv', 'loaded', 'File 1.csv', '/uploads/data_upload/2018/03/27/1522167681_File_1.csv', '222.47', 'C:\\xampp\\htdocs\\idata_dev\\application/modules/data_upload/assets/uploads/data_upload/2018/03/27/1522167681_File_1.csv', '.csv', 984, 0, 'data_upload', 'export/data_upload/failedupload/2018/03/27/failed-1522167687.csv', 'File save to server', 0, NULL, '2018-03-27 18:21:21', 3, '2018-03-27 21:18:34', 3, NULL),
(65, NULL, NULL, 'Data Team', '1522266193_Quadient__2.csv', 'loaded', 'Quadient _2.csv', '/uploads/data_upload/2018/03/28/1522266193_Quadient__2.csv', '21.93', 'C:\\xampp\\htdocs\\idata_dev\\application/modules/data_upload/assets/uploads/data_upload/2018/03/28/1522266193_Quadient__2.csv', '.csv', 117, 3, 'data_upload', 'export/data_upload/failedupload/2018/03/28/failed-1522266298.csv', 'File save to server', 0, NULL, '2018-03-28 21:43:13', 1, '2018-03-28 21:45:06', 1, NULL),
(66, NULL, NULL, 'Data Team', '1522266764_Quadient__2.csv', 'loaded', 'Quadient _2.csv', '/uploads/data_upload/2018/03/28/1522266764_Quadient__2.csv', '21.93', 'C:\\xampp\\htdocs\\idata_dev\\application/modules/data_upload/assets/uploads/data_upload/2018/03/28/1522266764_Quadient__2.csv', '.csv', 117, 0, 'data_upload', 'export/data_upload/failedupload/2018/03/28/failed-1522266767.csv', 'File save to server', 0, NULL, '2018-03-28 21:52:44', 1, '2018-03-28 21:52:54', 1, NULL),
(67, NULL, NULL, 'Data Team', '1522267564_Quadient__2.csv', 'loaded', 'Quadient _2.csv', '/uploads/data_upload/2018/03/28/1522267564_Quadient__2.csv', '21.93', 'C:\\xampp\\htdocs\\idata_dev\\application/modules/data_upload/assets/uploads/data_upload/2018/03/28/1522267564_Quadient__2.csv', '.csv', 117, 0, 'data_upload', 'export/data_upload/failedupload/2018/03/28/failed-1522267568.csv', 'File save to server', 0, NULL, '2018-03-28 22:06:04', 1, '2018-03-28 22:06:08', 1, NULL),
(68, NULL, NULL, 'Data Team', '1522267630_Quadient__2.csv', 'loaded', 'Quadient _2.csv', '/uploads/data_upload/2018/03/28/1522267630_Quadient__2.csv', '21.93', 'C:\\xampp\\htdocs\\idata_dev\\application/modules/data_upload/assets/uploads/data_upload/2018/03/28/1522267630_Quadient__2.csv', '.csv', 117, 0, 'data_upload', 'export/data_upload/failedupload/2018/03/28/failed-1522267633.csv', 'File save to server', 0, NULL, '2018-03-28 22:07:10', 1, '2018-03-28 22:07:13', 1, NULL),
(69, NULL, NULL, 'Data Team', '1522267679_Quadient__2.csv', 'loaded', 'Quadient _2.csv', '/uploads/data_upload/2018/03/28/1522267679_Quadient__2.csv', '21.93', 'C:\\xampp\\htdocs\\idata_dev\\application/modules/data_upload/assets/uploads/data_upload/2018/03/28/1522267679_Quadient__2.csv', '.csv', 117, 0, 'data_upload', 'export/data_upload/failedupload/2018/03/28/failed-1522267682.csv', 'File save to server', 0, NULL, '2018-03-28 22:07:59', 1, '2018-03-28 22:08:02', 1, NULL),
(70, NULL, NULL, 'Data Team', '1522268004_Quadient__2.csv', 'loaded', 'Quadient _2.csv', '/uploads/data_upload/2018/03/28/1522268004_Quadient__2.csv', '21.93', 'C:\\xampp\\htdocs\\idata_dev\\application/modules/data_upload/assets/uploads/data_upload/2018/03/28/1522268004_Quadient__2.csv', '.csv', 117, 0, 'data_upload', 'export/data_upload/failedupload/2018/03/28/failed-1522268033.csv', 'File save to server', 0, NULL, '2018-03-28 22:13:24', 1, '2018-03-28 22:13:53', 1, NULL),
(71, NULL, NULL, 'Data Team', '1522268231_Quadient__2.csv', 'loaded', 'Quadient _2.csv', '/uploads/data_upload/2018/03/28/1522268231_Quadient__2.csv', '21.93', 'C:\\xampp\\htdocs\\idata_dev\\application/modules/data_upload/assets/uploads/data_upload/2018/03/28/1522268231_Quadient__2.csv', '.csv', 117, 0, 'data_upload', 'export/data_upload/failedupload/2018/03/28/failed-1522268235.csv', 'File save to server', 0, NULL, '2018-03-28 22:17:11', 1, '2018-03-28 22:17:24', 1, NULL),
(72, NULL, NULL, 'Data Team', '1522310687_File_1.csv', 'loaded', 'File 1.csv', '/uploads/data_upload/2018/03/29/1522310687_File_1.csv', '222.47', 'C:\\xampp\\htdocs\\idata_dev\\application/modules/data_upload/assets/uploads/data_upload/2018/03/29/1522310687_File_1.csv', '.csv', 984, 19, 'data_upload', 'export/data_upload/failedupload/2018/03/29/failed-1522310696.csv', 'File save to server', 0, NULL, '2018-03-29 10:04:47', 3, '2018-03-29 12:51:56', 3, NULL),
(73, NULL, NULL, 'Data Team', '1522320998_File_1.csv', 'loaded', 'File 1.csv', '/uploads/data_upload/2018/03/29/1522320998_File_1.csv', '222.47', 'C:\\xampp\\htdocs\\idata_dev\\application/modules/data_upload/assets/uploads/data_upload/2018/03/29/1522320998_File_1.csv', '.csv', 984, 0, 'data_upload', 'export/data_upload/failedupload/2018/03/29/failed-1522321005.csv', 'File save to server', 0, NULL, '2018-03-29 12:56:38', 3, '2018-03-29 13:11:03', 3, NULL),
(74, NULL, NULL, 'Data Team', '1522347527_Quadient__2.csv', 'uploaded', 'Quadient _2.csv', '/uploads/data_upload/2018/03/29/1522347527_Quadient__2.csv', '21.93', 'C:\\xampp\\htdocs\\idata_dev\\application/modules/data_upload/assets/uploads/data_upload/2018/03/29/1522347527_Quadient__2.csv', '.csv', NULL, NULL, 'data_upload', '0000-00-00 00:00:00', 'File save to server', 0, NULL, '2018-03-29 20:18:47', 1, NULL, NULL, NULL),
(75, NULL, NULL, 'Data Team', '1522663469_File_1.csv', 'uploaded', 'File 1.csv', '/uploads/data_upload/2018/04/02/1522663469_File_1.csv', '222.47', 'C:\\xampp\\htdocs\\idata_dev\\application/modules/data_upload/assets/uploads/data_upload/2018/04/02/1522663469_File_1.csv', '.csv', NULL, NULL, 'data_upload', '0000-00-00 00:00:00', 'File save to server', 0, NULL, '2018-04-02 12:04:29', 3, NULL, NULL, NULL),
(76, NULL, NULL, 'Data Team', '1541904718_data_upload_template.csv', 'uploaded', 'data_upload_template.csv', '/uploads/data_upload/2018/11/11/1541904718_data_upload_template.csv', '1.89', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/11/1541904718_data_upload_template.csv', '.csv', NULL, NULL, 'data_upload', '0000-00-00 00:00:00', 'File save to server', 1, 1, '2018-11-11 03:51:58', 1, NULL, NULL, NULL),
(77, NULL, NULL, 'Data Team', '1541975387_data_upload_template.csv', 'uploaded', 'data_upload_template.csv', '/uploads/data_upload/2018/11/11/1541975387_data_upload_template.csv', '1.89', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/11/1541975387_data_upload_template.csv', '.csv', NULL, NULL, 'data_upload', '0000-00-00 00:00:00', 'File save to server', 0, NULL, '2018-11-11 23:29:47', 1, NULL, NULL, NULL),
(78, NULL, NULL, 'Data Team', '1541976013_data_upload_template.csv', 'uploaded', 'data_upload_template.csv', '/uploads/data_upload/2018/11/11/1541976013_data_upload_template.csv', '1.89', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/11/1541976013_data_upload_template.csv', '.csv', NULL, NULL, 'data_upload', '0000-00-00 00:00:00', 'File save to server', 0, NULL, '2018-11-11 23:40:13', 1, NULL, NULL, NULL),
(79, NULL, NULL, 'Data Team', '1541976071_data_upload_template.csv', 'uploaded', 'data_upload_template.csv', '/uploads/data_upload/2018/11/11/1541976071_data_upload_template.csv', '1.89', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/11/1541976071_data_upload_template.csv', '.csv', NULL, NULL, 'data_upload', '0000-00-00 00:00:00', 'File save to server', 0, NULL, '2018-11-11 23:41:11', 1, NULL, NULL, NULL),
(80, NULL, NULL, 'Data Team', '1541976130_data_upload_template.csv', 'uploaded', 'data_upload_template.csv', '/uploads/data_upload/2018/11/11/1541976130_data_upload_template.csv', '1.89', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/11/1541976130_data_upload_template.csv', '.csv', NULL, NULL, 'data_upload', '0000-00-00 00:00:00', 'File save to server', 0, NULL, '2018-11-11 23:42:10', 1, NULL, NULL, NULL),
(81, NULL, NULL, 'Data Team', '1541976266_data_upload_template.csv', 'uploaded', 'data_upload_template.csv', '/uploads/data_upload/2018/11/11/1541976266_data_upload_template.csv', '1.89', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/11/1541976266_data_upload_template.csv', '.csv', NULL, NULL, 'data_upload', '0000-00-00 00:00:00', 'File save to server', 0, NULL, '2018-11-11 23:44:26', 1, NULL, NULL, NULL),
(82, NULL, NULL, 'Data Team', '1541976323_data_upload_template.csv', 'uploaded', 'data_upload_template.csv', '/uploads/data_upload/2018/11/11/1541976323_data_upload_template.csv', '1.89', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/11/1541976323_data_upload_template.csv', '.csv', NULL, NULL, 'data_upload', '0000-00-00 00:00:00', 'File save to server', 0, NULL, '2018-11-11 23:45:23', 1, NULL, NULL, NULL),
(83, NULL, NULL, 'Data Team', '1541976446_data_upload_template.csv', 'uploaded', 'data_upload_template.csv', '/uploads/data_upload/2018/11/11/1541976446_data_upload_template.csv', '1.89', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/11/1541976446_data_upload_template.csv', '.csv', NULL, NULL, 'data_upload', '0000-00-00 00:00:00', 'File save to server', 0, NULL, '2018-11-11 23:47:26', 1, NULL, NULL, NULL),
(84, NULL, NULL, 'Data Team', '1541976493_data_upload_template.csv', 'uploaded', 'data_upload_template.csv', '/uploads/data_upload/2018/11/11/1541976493_data_upload_template.csv', '1.89', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/11/1541976493_data_upload_template.csv', '.csv', NULL, NULL, 'data_upload', '0000-00-00 00:00:00', 'File save to server', 0, NULL, '2018-11-11 23:48:13', 1, NULL, NULL, NULL),
(85, NULL, NULL, 'Data Team', '1541977809_data_upload_template.csv', 'uploaded', 'data_upload_template.csv', '/uploads/data_upload/2018/11/12/1541977809_data_upload_template.csv', '1.89', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/12/1541977809_data_upload_template.csv', '.csv', NULL, NULL, 'data_upload', '0000-00-00 00:00:00', 'File save to server', 0, NULL, '2018-11-12 00:10:09', 1, NULL, NULL, NULL),
(86, NULL, NULL, 'Data Team', '1541977857_data_upload_template.csv', 'uploaded', 'data_upload_template.csv', '/uploads/data_upload/2018/11/12/1541977857_data_upload_template.csv', '1.89', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/12/1541977857_data_upload_template.csv', '.csv', NULL, NULL, 'data_upload', '0000-00-00 00:00:00', 'File save to server', 0, NULL, '2018-11-12 00:10:57', 1, NULL, NULL, NULL),
(87, NULL, NULL, 'Data Team', '1541978103_data_upload_template.csv', 'uploaded', 'data_upload_template.csv', '/uploads/data_upload/2018/11/12/1541978103_data_upload_template.csv', '0.18', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/12/1541978103_data_upload_template.csv', '.csv', NULL, NULL, 'data_upload', '0000-00-00 00:00:00', 'File save to server', 0, NULL, '2018-11-12 00:15:03', 1, NULL, NULL, NULL),
(88, NULL, NULL, 'Data Team', '1541978143_data_upload_template.csv', 'uploaded', 'data_upload_template.csv', '/uploads/data_upload/2018/11/12/1541978143_data_upload_template.csv', '0.18', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/12/1541978143_data_upload_template.csv', '.csv', NULL, NULL, 'data_upload', '0000-00-00 00:00:00', 'File save to server', 0, NULL, '2018-11-12 00:15:43', 1, NULL, NULL, NULL),
(89, NULL, NULL, 'Data Team', '1541979207_data_upload_template.csv', 'uploaded', 'data_upload_template.csv', '/uploads/data_upload/2018/11/12/1541979207_data_upload_template.csv', '0.18', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/12/1541979207_data_upload_template.csv', '.csv', NULL, NULL, 'data_upload', '0000-00-00 00:00:00', 'File save to server', 0, NULL, '2018-11-12 00:33:27', 1, NULL, NULL, NULL),
(90, NULL, NULL, 'Data Team', '1541979271_data_upload_template.csv', 'uploaded', 'data_upload_template.csv', '/uploads/data_upload/2018/11/12/1541979271_data_upload_template.csv', '0.18', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/12/1541979271_data_upload_template.csv', '.csv', NULL, NULL, 'data_upload', '0000-00-00 00:00:00', 'File save to server', 0, NULL, '2018-11-12 00:34:31', 1, NULL, NULL, NULL),
(91, NULL, NULL, 'Data Team', '1541979727_data_upload_template.csv', 'uploaded', 'data_upload_template.csv', '/uploads/data_upload/2018/11/12/1541979727_data_upload_template.csv', '0.18', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/12/1541979727_data_upload_template.csv', '.csv', NULL, NULL, 'data_upload', '0000-00-00 00:00:00', 'File save to server', 0, NULL, '2018-11-12 00:42:07', 1, NULL, NULL, NULL),
(92, NULL, NULL, 'Data Team', '1542378562_5k.csv', 'loaded', '5k.csv', '/uploads/data_upload/2018/11/16/1542378562_5k.csv', '278.68', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/16/1542378562_5k.csv', '.csv', 4937, 4924, 'data_upload', 'export/data_upload/failedupload/2018/11/16/failed-1542378562.csv', 'File save to server', 0, NULL, '2018-11-16 15:29:22', 1, '2018-11-16 15:29:28', 1, NULL),
(93, NULL, NULL, 'Data Team', '1542637077_importanat_domain.csv', 'uploaded', 'importanat domain.csv', '/uploads/data_upload/2018/11/19/1542637077_importanat_domain.csv', '31.27', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/19/1542637077_importanat_domain.csv', '.csv', NULL, NULL, 'data_upload', '0000-00-00 00:00:00', 'File save to server', 0, NULL, '2018-11-19 15:17:57', 1, NULL, NULL, NULL),
(94, NULL, NULL, 'Data Team', '1542639364_importanat_domain.csv', 'loaded', 'importanat domain.csv', '/uploads/data_upload/2018/11/19/1542639364_importanat_domain.csv', '31.27', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/19/1542639364_importanat_domain.csv', '.csv', 844, 0, 'data_upload', 'export/data_upload/failedupload/2018/11/19/failed-1542639364.csv', 'File save to server', 0, NULL, '2018-11-19 15:56:04', 1, '2018-11-19 15:56:04', 1, NULL),
(95, NULL, NULL, 'Data Team', '1542639490_importanat_domain.csv', 'uploaded', 'importanat domain.csv', '/uploads/data_upload/2018/11/19/1542639490_importanat_domain.csv', '31.27', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/19/1542639490_importanat_domain.csv', '.csv', NULL, NULL, 'data_upload', '0000-00-00 00:00:00', 'File save to server', 0, NULL, '2018-11-19 15:58:10', 1, NULL, NULL, NULL),
(96, NULL, NULL, 'Data Team', '1542639609_importanat_domain.csv', 'uploaded', 'importanat domain.csv', '/uploads/data_upload/2018/11/19/1542639609_importanat_domain.csv', '31.27', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/19/1542639609_importanat_domain.csv', '.csv', NULL, NULL, 'data_upload', '0000-00-00 00:00:00', 'File save to server', 0, NULL, '2018-11-19 16:00:09', 1, NULL, NULL, NULL),
(97, NULL, NULL, 'Data Team', '1542639742_importanat_domain.csv', 'uploaded', 'importanat domain.csv', '/uploads/data_upload/2018/11/19/1542639742_importanat_domain.csv', '31.27', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/19/1542639742_importanat_domain.csv', '.csv', NULL, NULL, 'data_upload', '0000-00-00 00:00:00', 'File save to server', 0, NULL, '2018-11-19 16:02:22', 1, NULL, NULL, NULL),
(98, NULL, NULL, 'Data Team', '1542639805_importanat_domain.csv', 'uploaded', 'importanat domain.csv', '/uploads/data_upload/2018/11/19/1542639805_importanat_domain.csv', '31.27', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/19/1542639805_importanat_domain.csv', '.csv', NULL, NULL, 'data_upload', '0000-00-00 00:00:00', 'File save to server', 0, NULL, '2018-11-19 16:03:25', 1, NULL, NULL, NULL),
(99, NULL, NULL, 'Data Team', '1542639878_importanat_domain.csv', 'loaded', 'importanat domain.csv', '/uploads/data_upload/2018/11/19/1542639878_importanat_domain.csv', '31.27', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/19/1542639878_importanat_domain.csv', '.csv', 844, 0, 'data_upload', 'export/data_upload/failedupload/2018/11/19/failed-1542639878.csv', 'File save to server', 0, NULL, '2018-11-19 16:04:38', 1, '2018-11-19 16:04:39', 1, NULL),
(100, NULL, NULL, 'Data Team', '1542640124_importanat_domain.csv', 'loaded', 'importanat domain.csv', '/uploads/data_upload/2018/11/19/1542640124_importanat_domain.csv', '31.27', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/19/1542640124_importanat_domain.csv', '.csv', 844, 0, 'data_upload', 'export/data_upload/failedupload/2018/11/19/failed-1542640124.csv', 'File save to server', 0, NULL, '2018-11-19 16:08:44', 1, '2018-11-19 16:08:45', 1, NULL),
(101, NULL, NULL, 'Data Team', '1542640313_importanat_domain.csv', 'uploaded', 'importanat domain.csv', '/uploads/data_upload/2018/11/19/1542640313_importanat_domain.csv', '31.27', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/19/1542640313_importanat_domain.csv', '.csv', NULL, NULL, 'data_upload', '0000-00-00 00:00:00', 'File save to server', 0, NULL, '2018-11-19 16:11:53', 1, NULL, NULL, NULL),
(102, NULL, NULL, 'Data Team', '1542640372_importanat_domain.csv', 'uploaded', 'importanat domain.csv', '/uploads/data_upload/2018/11/19/1542640372_importanat_domain.csv', '31.27', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/19/1542640372_importanat_domain.csv', '.csv', NULL, NULL, 'data_upload', '0000-00-00 00:00:00', 'File save to server', 0, NULL, '2018-11-19 16:12:52', 1, NULL, NULL, NULL),
(103, NULL, NULL, 'Data Team', '1542640412_importanat_domain.csv', 'uploaded', 'importanat domain.csv', '/uploads/data_upload/2018/11/19/1542640412_importanat_domain.csv', '31.27', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/19/1542640412_importanat_domain.csv', '.csv', NULL, NULL, 'data_upload', '0000-00-00 00:00:00', 'File save to server', 0, NULL, '2018-11-19 16:13:32', 1, NULL, NULL, NULL),
(104, NULL, NULL, 'Data Team', '1542640504_importanat_domain.csv', 'uploaded', 'importanat domain.csv', '/uploads/data_upload/2018/11/19/1542640504_importanat_domain.csv', '31.27', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/19/1542640504_importanat_domain.csv', '.csv', NULL, NULL, 'data_upload', '0000-00-00 00:00:00', 'File save to server', 0, NULL, '2018-11-19 16:15:04', 1, NULL, NULL, NULL),
(105, NULL, NULL, 'Data Team', '1542640572_importanat_domain.csv', 'uploaded', 'importanat domain.csv', '/uploads/data_upload/2018/11/19/1542640572_importanat_domain.csv', '31.27', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/19/1542640572_importanat_domain.csv', '.csv', NULL, NULL, 'data_upload', '0000-00-00 00:00:00', 'File save to server', 0, NULL, '2018-11-19 16:16:12', 1, NULL, NULL, NULL),
(106, NULL, NULL, 'Data Team', '1542640645_importanat_domain.csv', 'uploaded', 'importanat domain.csv', '/uploads/data_upload/2018/11/19/1542640645_importanat_domain.csv', '31.27', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/19/1542640645_importanat_domain.csv', '.csv', NULL, NULL, 'data_upload', '0000-00-00 00:00:00', 'File save to server', 0, NULL, '2018-11-19 16:17:25', 1, NULL, NULL, NULL),
(107, NULL, NULL, 'Data Team', '1542640817_importanat_domain.csv', 'uploaded', 'importanat domain.csv', '/uploads/data_upload/2018/11/19/1542640817_importanat_domain.csv', '31.27', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/19/1542640817_importanat_domain.csv', '.csv', NULL, NULL, 'data_upload', '0000-00-00 00:00:00', 'File save to server', 0, NULL, '2018-11-19 16:20:17', 1, NULL, NULL, NULL),
(108, NULL, NULL, 'Data Team', '1542641067_importanat_domain.csv', 'uploaded', 'importanat domain.csv', '/uploads/data_upload/2018/11/19/1542641067_importanat_domain.csv', '31.27', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/19/1542641067_importanat_domain.csv', '.csv', NULL, NULL, 'data_upload', '0000-00-00 00:00:00', 'File save to server', 0, NULL, '2018-11-19 16:24:27', 1, NULL, NULL, NULL),
(109, NULL, NULL, 'Data Team', '1542641154_importanat_domain.csv', 'uploaded', 'importanat domain.csv', '/uploads/data_upload/2018/11/19/1542641154_importanat_domain.csv', '31.27', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/19/1542641154_importanat_domain.csv', '.csv', NULL, NULL, 'data_upload', '0000-00-00 00:00:00', 'File save to server', 0, NULL, '2018-11-19 16:25:54', 1, NULL, NULL, NULL),
(110, NULL, NULL, 'Data Team', '1542641308_importanat_domain.csv', 'uploaded', 'importanat domain.csv', '/uploads/data_upload/2018/11/19/1542641308_importanat_domain.csv', '31.27', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/19/1542641308_importanat_domain.csv', '.csv', NULL, NULL, 'data_upload', '0000-00-00 00:00:00', 'File save to server', 0, NULL, '2018-11-19 16:28:28', 1, NULL, NULL, NULL),
(111, NULL, NULL, 'Data Team', '1542641790_importanat_domain.csv', 'uploaded', 'importanat domain.csv', '/uploads/data_upload/2018/11/19/1542641790_importanat_domain.csv', '31.27', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/19/1542641790_importanat_domain.csv', '.csv', NULL, NULL, 'data_upload', '0000-00-00 00:00:00', 'File save to server', 0, NULL, '2018-11-19 16:36:30', 1, NULL, NULL, NULL),
(112, NULL, NULL, 'Data Team', '1542641828_importanat_domain.csv', 'uploaded', 'importanat domain.csv', '/uploads/data_upload/2018/11/19/1542641828_importanat_domain.csv', '31.27', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/19/1542641828_importanat_domain.csv', '.csv', NULL, NULL, 'data_upload', '0000-00-00 00:00:00', 'File save to server', 0, NULL, '2018-11-19 16:37:08', 1, NULL, NULL, NULL),
(113, NULL, NULL, 'Data Team', '1542641862_importanat_domain.csv', 'uploaded', 'importanat domain.csv', '/uploads/data_upload/2018/11/19/1542641862_importanat_domain.csv', '31.27', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/19/1542641862_importanat_domain.csv', '.csv', NULL, NULL, 'data_upload', '0000-00-00 00:00:00', 'File save to server', 0, NULL, '2018-11-19 16:37:42', 1, NULL, NULL, NULL),
(114, NULL, NULL, 'Data Team', '1542641912_importanat_domain.csv', 'uploaded', 'importanat domain.csv', '/uploads/data_upload/2018/11/19/1542641912_importanat_domain.csv', '31.27', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/19/1542641912_importanat_domain.csv', '.csv', NULL, NULL, 'data_upload', '0000-00-00 00:00:00', 'File save to server', 0, NULL, '2018-11-19 16:38:32', 1, NULL, NULL, NULL),
(115, NULL, NULL, 'Data Team', '1542641991_importanat_domain.csv', 'loaded', 'importanat domain.csv', '/uploads/data_upload/2018/11/19/1542641991_importanat_domain.csv', '31.27', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/19/1542641991_importanat_domain.csv', '.csv', 844, 0, 'data_upload', 'export/data_upload/failedupload/2018/11/19/failed-1542641991.csv', 'File save to server', 0, NULL, '2018-11-19 16:39:51', 1, '2018-11-19 16:39:51', 1, NULL),
(116, NULL, NULL, 'Data Team', '1542642155_importanat_domain.csv', 'loaded', 'importanat domain.csv', '/uploads/data_upload/2018/11/19/1542642155_importanat_domain.csv', '31.27', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/19/1542642155_importanat_domain.csv', '.csv', 844, 765, 'data_upload', 'export/data_upload/failedupload/2018/11/19/failed-1542642155.csv', 'File save to server', 0, NULL, '2018-11-19 16:42:35', 1, '2018-11-19 16:42:38', 1, NULL),
(117, NULL, NULL, 'Data Team', '1542642195_importanat_domain.csv', 'loaded', 'importanat domain.csv', '/uploads/data_upload/2018/11/19/1542642195_importanat_domain.csv', '31.27', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/19/1542642195_importanat_domain.csv', '.csv', 844, 0, 'data_upload', 'export/data_upload/failedupload/2018/11/19/failed-1542642195.csv', 'File save to server', 0, NULL, '2018-11-19 16:43:15', 1, '2018-11-19 16:43:16', 1, NULL),
(118, NULL, NULL, 'Data Team', '1542674281_important_domain_1.csv', 'loaded', 'important domain 1.csv', '/uploads/data_upload/2018/11/20/1542674281_important_domain_1.csv', '13.5', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/20/1542674281_important_domain_1.csv', '.csv', 344, 0, 'data_upload', 'export/data_upload/failedupload/2018/11/20/failed-1542674281.csv', 'File save to server', 0, NULL, '2018-11-20 01:38:01', 1, '2018-11-20 01:38:01', 1, NULL),
(119, NULL, NULL, 'Data Team', '1542674358_important_domain_1.csv', 'loaded', 'important domain 1.csv', '/uploads/data_upload/2018/11/20/1542674358_important_domain_1.csv', '13.5', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/20/1542674358_important_domain_1.csv', '.csv', 344, 0, 'data_upload', 'export/data_upload/failedupload/2018/11/20/failed-1542674358.csv', 'File save to server', 0, NULL, '2018-11-20 01:39:18', 1, '2018-11-20 01:39:19', 1, NULL),
(120, NULL, NULL, 'Data Team', '1542674445_important_domain_1.csv', 'loaded', 'important domain 1.csv', '/uploads/data_upload/2018/11/20/1542674445_important_domain_1.csv', '13.5', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/20/1542674445_important_domain_1.csv', '.csv', 344, 308, 'data_upload', 'export/data_upload/failedupload/2018/11/20/failed-1542674445.csv', 'File save to server', 0, NULL, '2018-11-20 01:40:45', 1, '2018-11-20 01:40:46', 1, NULL),
(121, NULL, NULL, 'Data Team', '1542674562_important_domain_1.csv', 'loaded', 'important domain 1.csv', '/uploads/data_upload/2018/11/20/1542674562_important_domain_1.csv', '13.5', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/20/1542674562_important_domain_1.csv', '.csv', 344, 308, 'data_upload', 'export/data_upload/failedupload/2018/11/20/failed-1542674562.csv', 'File save to server', 0, NULL, '2018-11-20 01:42:42', 1, '2018-11-20 01:42:43', 1, NULL),
(122, NULL, NULL, 'Data Team', '1542674957_important_domain_1.csv', 'loaded', 'important domain 1.csv', '/uploads/data_upload/2018/11/20/1542674957_important_domain_1.csv', '13.5', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/20/1542674957_important_domain_1.csv', '.csv', 344, 0, 'data_upload', 'export/data_upload/failedupload/2018/11/20/failed-1542674957.csv', 'File save to server', 0, NULL, '2018-11-20 01:49:17', 1, '2018-11-20 01:49:17', 1, NULL),
(123, NULL, NULL, 'Data Team', '1542675063_important_domain_1.csv', 'loaded', 'important domain 1.csv', '/uploads/data_upload/2018/11/20/1542675063_important_domain_1.csv', '13.5', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/20/1542675063_important_domain_1.csv', '.csv', 344, 0, 'data_upload', 'export/data_upload/failedupload/2018/11/20/failed-1542675063.csv', 'File save to server', 0, NULL, '2018-11-20 01:51:03', 1, '2018-11-20 01:51:03', 1, NULL),
(124, NULL, NULL, 'Data Team', '1542675147_important_domain_1.csv', 'loaded', 'important domain 1.csv', '/uploads/data_upload/2018/11/20/1542675147_important_domain_1.csv', '13.5', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/20/1542675147_important_domain_1.csv', '.csv', 344, 0, 'data_upload', 'export/data_upload/failedupload/2018/11/20/failed-1542675147.csv', 'File save to server', 0, NULL, '2018-11-20 01:52:27', 1, '2018-11-20 01:52:27', 1, NULL),
(125, NULL, NULL, 'Data Team', '1542675397_important_domain_1.csv', 'loaded', 'important domain 1.csv', '/uploads/data_upload/2018/11/20/1542675397_important_domain_1.csv', '13.5', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/20/1542675397_important_domain_1.csv', '.csv', 344, 0, 'data_upload', 'export/data_upload/failedupload/2018/11/20/failed-1542675397.csv', 'File save to server', 0, NULL, '2018-11-20 01:56:37', 1, '2018-11-20 01:56:37', 1, NULL),
(126, NULL, NULL, 'Data Team', '1542675792_important_domain_1.csv', 'loaded', 'important domain 1.csv', '/uploads/data_upload/2018/11/20/1542675792_important_domain_1.csv', '13.5', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/20/1542675792_important_domain_1.csv', '.csv', 344, 0, 'data_upload', 'export/data_upload/failedupload/2018/11/20/failed-1542675792.csv', 'File save to server', 0, NULL, '2018-11-20 02:03:12', 1, '2018-11-20 02:03:13', 1, NULL),
(127, NULL, NULL, 'Data Team', '1542675985_important_domain_1.csv', 'loaded', 'important domain 1.csv', '/uploads/data_upload/2018/11/20/1542675985_important_domain_1.csv', '13.5', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/20/1542675985_important_domain_1.csv', '.csv', 344, 0, 'data_upload', 'export/data_upload/failedupload/2018/11/20/failed-1542675985.csv', 'File save to server', 0, NULL, '2018-11-20 02:06:25', 1, '2018-11-20 02:06:26', 1, NULL),
(128, NULL, NULL, 'Data Team', '1542676100_important_domain_1.csv', 'loaded', 'important domain 1.csv', '/uploads/data_upload/2018/11/20/1542676100_important_domain_1.csv', '13.5', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/20/1542676100_important_domain_1.csv', '.csv', 344, 0, 'data_upload', 'export/data_upload/failedupload/2018/11/20/failed-1542676100.csv', 'File save to server', 0, NULL, '2018-11-20 02:08:20', 1, '2018-11-20 02:08:21', 1, NULL),
(129, NULL, NULL, 'Data Team', '1542676116_important_domain_1.csv', 'loaded', 'important domain 1.csv', '/uploads/data_upload/2018/11/20/1542676116_important_domain_1.csv', '13.5', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/20/1542676116_important_domain_1.csv', '.csv', 344, 0, 'data_upload', 'export/data_upload/failedupload/2018/11/20/failed-1542676116.csv', 'File save to server', 0, NULL, '2018-11-20 02:08:36', 1, '2018-11-20 02:08:37', 1, NULL),
(130, NULL, NULL, 'Data Team', '1542676426_important_domain_1.csv', 'loaded', 'important domain 1.csv', '/uploads/data_upload/2018/11/20/1542676426_important_domain_1.csv', '13.5', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/20/1542676426_important_domain_1.csv', '.csv', 344, 0, 'data_upload', 'export/data_upload/failedupload/2018/11/20/failed-1542676426.csv', 'File save to server', 0, NULL, '2018-11-20 02:13:46', 1, '2018-11-20 02:13:46', 1, NULL),
(131, NULL, NULL, 'Data Team', '1542676492_important_domain_1.csv', 'loaded', 'important domain 1.csv', '/uploads/data_upload/2018/11/20/1542676492_important_domain_1.csv', '13.5', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/20/1542676492_important_domain_1.csv', '.csv', 344, 0, 'data_upload', 'export/data_upload/failedupload/2018/11/20/failed-1542676492.csv', 'File save to server', 0, NULL, '2018-11-20 02:14:52', 1, '2018-11-20 02:14:53', 1, NULL),
(132, NULL, NULL, 'Data Team', '1542982950_domain_append_file.csv', 'loaded', 'domain append file.csv', '/uploads/data_upload/2018/11/23/1542982950_domain_append_file.csv', '1510.88', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/23/1542982950_domain_append_file.csv', '.csv', 28992, 0, 'data_upload', 'export/data_upload/failedupload/2018/11/23/failed-1542982950.csv', 'File save to server', 0, NULL, '2018-11-23 15:22:30', 1, '2018-11-23 15:23:13', 1, NULL),
(133, NULL, NULL, 'Data Team', '1542983932_domain_append_file.csv', 'loaded', 'domain append file.csv', '/uploads/data_upload/2018/11/23/1542983932_domain_append_file.csv', '1510.88', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/23/1542983932_domain_append_file.csv', '.csv', 28992, 0, 'data_upload', 'export/data_upload/failedupload/2018/11/23/failed-1542983933.csv', 'File save to server', 0, NULL, '2018-11-23 15:38:53', 1, '2018-11-23 15:39:50', 1, NULL),
(134, NULL, NULL, 'Data Team', '1542984389_domain_append_file.csv', 'loaded', 'domain append file.csv', '/uploads/data_upload/2018/11/23/1542984389_domain_append_file.csv', '1510.88', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/23/1542984389_domain_append_file.csv', '.csv', 28992, 0, 'data_upload', 'export/data_upload/failedupload/2018/11/23/failed-1542984389.csv', 'File save to server', 0, NULL, '2018-11-23 15:46:29', 1, '2018-11-23 15:47:25', 1, NULL),
(135, NULL, NULL, 'Data Team', '1542984585_domain_append_file.csv', 'loaded', 'domain append file.csv', '/uploads/data_upload/2018/11/23/1542984585_domain_append_file.csv', '1510.88', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/23/1542984585_domain_append_file.csv', '.csv', 28992, 0, 'data_upload', 'export/data_upload/failedupload/2018/11/23/failed-1542984585.csv', 'File save to server', 0, NULL, '2018-11-23 15:49:45', 1, '2018-11-23 15:50:32', 1, NULL),
(136, NULL, NULL, 'Data Team', '1542984767_domain_append_file.csv', 'loaded', 'domain append file.csv', '/uploads/data_upload/2018/11/23/1542984767_domain_append_file.csv', '1510.88', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/23/1542984767_domain_append_file.csv', '.csv', 28992, 0, 'data_upload', 'export/data_upload/failedupload/2018/11/23/failed-1542984767.csv', 'File save to server', 0, NULL, '2018-11-23 15:52:47', 1, '2018-11-23 15:53:33', 1, NULL),
(137, NULL, NULL, 'Data Team', '1542985044_domain_append_file.csv', 'loaded', 'domain append file.csv', '/uploads/data_upload/2018/11/23/1542985044_domain_append_file.csv', '1510.88', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/23/1542985044_domain_append_file.csv', '.csv', 28992, 0, 'data_upload', 'export/data_upload/failedupload/2018/11/23/failed-1542985044.csv', 'File save to server', 0, NULL, '2018-11-23 15:57:24', 1, '2018-11-23 15:58:09', 1, NULL),
(138, NULL, NULL, 'Data Team', '1542986356_domain_append_file.csv', 'loaded', 'domain append file.csv', '/uploads/data_upload/2018/11/23/1542986356_domain_append_file.csv', '1510.88', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/23/1542986356_domain_append_file.csv', '.csv', 28992, 0, 'data_upload', 'export/data_upload/failedupload/2018/11/23/failed-1542986356.csv', 'File save to server', 0, NULL, '2018-11-23 16:19:16', 1, '2018-11-23 16:20:03', 1, NULL),
(139, NULL, NULL, 'Data Team', '1542988928_vps_credentials.csv', 'loaded', 'vps credentials.csv', '/uploads/data_upload/2018/11/23/1542988928_vps_credentials.csv', '0.57', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/23/1542988928_vps_credentials.csv', '.csv', 26, 0, 'data_upload', 'export/data_upload/failedupload/2018/11/23/failed-1542988928.csv', 'File save to server', 0, NULL, '2018-11-23 17:02:08', 1, '2018-11-23 17:02:08', 1, NULL),
(140, NULL, NULL, 'Data Team', '1542992097_domain_append_file.csv', 'uploaded', 'domain append file.csv', '/uploads/data_upload/2018/11/23/1542992097_domain_append_file.csv', '1510.88', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/23/1542992097_domain_append_file.csv', '.csv', NULL, NULL, 'data_upload', '0000-00-00 00:00:00', 'File save to server', 0, NULL, '2018-11-23 17:54:58', 1, NULL, NULL, NULL),
(141, NULL, NULL, 'Data Team', '1542992181_domain_append_file.csv', 'uploaded', 'domain append file.csv', '/uploads/data_upload/2018/11/23/1542992181_domain_append_file.csv', '1510.88', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/23/1542992181_domain_append_file.csv', '.csv', NULL, NULL, 'data_upload', '0000-00-00 00:00:00', 'File save to server', 0, NULL, '2018-11-23 17:56:21', 1, NULL, NULL, NULL),
(142, NULL, NULL, 'Data Team', '1542992890_domain_append_file.csv', 'uploaded', 'domain append file.csv', '/uploads/data_upload/2018/11/23/1542992890_domain_append_file.csv', '1510.88', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/23/1542992890_domain_append_file.csv', '.csv', NULL, NULL, 'data_upload', '0000-00-00 00:00:00', 'File save to server', 0, NULL, '2018-11-23 18:08:11', 1, NULL, NULL, NULL),
(143, NULL, NULL, 'Data Team', '1542993008_domain_append_file.csv', 'uploaded', 'domain append file.csv', '/uploads/data_upload/2018/11/23/1542993008_domain_append_file.csv', '1510.88', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/23/1542993008_domain_append_file.csv', '.csv', NULL, NULL, 'data_upload', '0000-00-00 00:00:00', 'File save to server', 0, NULL, '2018-11-23 18:10:08', 1, NULL, NULL, NULL),
(144, NULL, NULL, 'Data Team', '1542993711_belgium_domain.csv', 'uploaded', 'belgium domain.csv', '/uploads/data_upload/2018/11/23/1542993711_belgium_domain.csv', '22.53', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/23/1542993711_belgium_domain.csv', '.csv', NULL, NULL, 'data_upload', '0000-00-00 00:00:00', 'File save to server', 0, NULL, '2018-11-23 18:21:51', 1, NULL, NULL, NULL),
(145, NULL, NULL, 'Data Team', '1542993806_belgium_domain.csv', 'uploaded', 'belgium domain.csv', '/uploads/data_upload/2018/11/23/1542993806_belgium_domain.csv', '22.53', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/23/1542993806_belgium_domain.csv', '.csv', NULL, NULL, 'data_upload', '0000-00-00 00:00:00', 'File save to server', 0, NULL, '2018-11-23 18:23:26', 1, NULL, NULL, NULL),
(146, NULL, NULL, 'Data Team', '1542994013_belgium_domain.csv', 'uploaded', 'belgium domain.csv', '/uploads/data_upload/2018/11/23/1542994013_belgium_domain.csv', '22.53', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/23/1542994013_belgium_domain.csv', '.csv', NULL, NULL, 'data_upload', '0000-00-00 00:00:00', 'File save to server', 0, NULL, '2018-11-23 18:26:53', 1, NULL, NULL, NULL),
(147, NULL, NULL, 'Data Team', '1542994065_belgium_domain.csv', 'uploaded', 'belgium domain.csv', '/uploads/data_upload/2018/11/23/1542994065_belgium_domain.csv', '22.53', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/23/1542994065_belgium_domain.csv', '.csv', NULL, NULL, 'data_upload', '0000-00-00 00:00:00', 'File save to server', 0, NULL, '2018-11-23 18:27:45', 1, NULL, NULL, NULL),
(148, NULL, NULL, 'Data Team', '1542994307_belgium_domain.csv', 'uploaded', 'belgium domain.csv', '/uploads/data_upload/2018/11/23/1542994307_belgium_domain.csv', '22.53', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/23/1542994307_belgium_domain.csv', '.csv', NULL, NULL, 'data_upload', '0000-00-00 00:00:00', 'File save to server', 0, NULL, '2018-11-23 18:31:47', 1, NULL, NULL, NULL),
(149, NULL, NULL, 'Data Team', '1542994474_belgium_domain.csv', 'uploaded', 'belgium domain.csv', '/uploads/data_upload/2018/11/23/1542994474_belgium_domain.csv', '22.53', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/23/1542994474_belgium_domain.csv', '.csv', NULL, NULL, 'data_upload', '0000-00-00 00:00:00', 'File save to server', 0, NULL, '2018-11-23 18:34:34', 1, NULL, NULL, NULL),
(150, NULL, NULL, 'Data Team', '1542994612_belgium_domain.csv', 'loaded', 'belgium domain.csv', '/uploads/data_upload/2018/11/23/1542994612_belgium_domain.csv', '22.53', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/23/1542994612_belgium_domain.csv', '.csv', 573, 556, 'data_upload', 'export/data_upload/failedupload/2018/11/23/failed-1542994612.csv', 'File save to server', 0, NULL, '2018-11-23 18:36:52', 1, '2018-11-23 18:36:53', 1, NULL),
(151, NULL, NULL, 'Data Team', '1542994803_belgium_domain.csv', 'loaded', 'belgium domain.csv', '/uploads/data_upload/2018/11/23/1542994803_belgium_domain.csv', '22.53', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/23/1542994803_belgium_domain.csv', '.csv', 573, 0, 'data_upload', 'export/data_upload/failedupload/2018/11/23/failed-1542994803.csv', 'File save to server', 0, NULL, '2018-11-23 18:40:03', 1, '2018-11-23 18:40:05', 1, NULL),
(152, NULL, NULL, 'Data Team', '1542994878_belgium_domain.csv', 'uploaded', 'belgium domain.csv', '/uploads/data_upload/2018/11/23/1542994878_belgium_domain.csv', '22.53', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/23/1542994878_belgium_domain.csv', '.csv', NULL, NULL, 'data_upload', '0000-00-00 00:00:00', 'File save to server', 0, NULL, '2018-11-23 18:41:18', 1, NULL, NULL, NULL),
(153, NULL, NULL, 'Data Team', '1542994901_belgium_domain.csv', 'loaded', 'belgium domain.csv', '/uploads/data_upload/2018/11/23/1542994901_belgium_domain.csv', '22.53', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/23/1542994901_belgium_domain.csv', '.csv', 573, 0, 'data_upload', 'export/data_upload/failedupload/2018/11/23/failed-1542994901.csv', 'File save to server', 0, NULL, '2018-11-23 18:41:41', 1, '2018-11-23 18:41:43', 1, NULL),
(154, NULL, NULL, 'Data Team', '1542994987_belgium_domain.csv', 'loaded', 'belgium domain.csv', '/uploads/data_upload/2018/11/23/1542994987_belgium_domain.csv', '22.53', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/23/1542994987_belgium_domain.csv', '.csv', 573, 0, 'data_upload', 'export/data_upload/failedupload/2018/11/23/failed-1542994987.csv', 'File save to server', 0, NULL, '2018-11-23 18:43:07', 1, '2018-11-23 18:43:08', 1, NULL);
INSERT INTO `bf_file_upload` (`id`, `client`, `Campaign`, `category`, `filename`, `status`, `filename_actual`, `filepath`, `file_size`, `server_filepath`, `fileextension`, `RowCount`, `UniqueRowFound`, `module`, `failreportpath`, `message`, `deleted`, `deleted_by`, `created_on`, `created_by`, `modified_on`, `modified_by`, `customer_id`) VALUES
(155, NULL, NULL, 'Data Team', '1542995081_domain_append_file.csv', 'loaded', 'domain append file.csv', '/uploads/data_upload/2018/11/23/1542995081_domain_append_file.csv', '1510.88', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/23/1542995081_domain_append_file.csv', '.csv', 28992, 0, 'data_upload', 'export/data_upload/failedupload/2018/11/23/failed-1542995081.csv', 'File save to server', 0, NULL, '2018-11-23 18:44:41', 1, '2018-11-23 18:46:09', 1, NULL),
(156, NULL, NULL, 'Data Team', '1542995494_belgium_domain.csv', 'loaded', 'belgium domain.csv', '/uploads/data_upload/2018/11/23/1542995494_belgium_domain.csv', '22.53', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/23/1542995494_belgium_domain.csv', '.csv', 573, 0, 'data_upload', 'export/data_upload/failedupload/2018/11/23/failed-1542995494.csv', 'File save to server', 0, NULL, '2018-11-23 18:51:34', 1, '2018-11-23 18:51:35', 1, NULL),
(157, NULL, NULL, 'Data Team', '1542995649_belgium_domain.csv', 'loaded', 'belgium domain.csv', '/uploads/data_upload/2018/11/23/1542995649_belgium_domain.csv', '22.53', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/23/1542995649_belgium_domain.csv', '.csv', 573, 0, 'data_upload', 'export/data_upload/failedupload/2018/11/23/failed-1542995649.csv', 'File save to server', 0, NULL, '2018-11-23 18:54:09', 1, '2018-11-23 18:54:10', 1, NULL),
(158, NULL, NULL, 'Data Team', '1542996275_belgium_domain.csv', 'loaded', 'belgium domain.csv', '/uploads/data_upload/2018/11/23/1542996275_belgium_domain.csv', '22.53', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/23/1542996275_belgium_domain.csv', '.csv', 573, 0, 'data_upload', 'export/data_upload/failedupload/2018/11/23/failed-1542996275.csv', 'File save to server', 0, NULL, '2018-11-23 19:04:35', 1, '2018-11-23 19:04:37', 1, NULL),
(159, NULL, NULL, 'Data Team', '1542996408_belgium_domain.csv', 'loaded', 'belgium domain.csv', '/uploads/data_upload/2018/11/23/1542996408_belgium_domain.csv', '22.53', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/23/1542996408_belgium_domain.csv', '.csv', 573, 0, 'data_upload', 'export/data_upload/failedupload/2018/11/23/failed-1542996408.csv', 'File save to server', 0, NULL, '2018-11-23 19:06:48', 1, '2018-11-23 19:06:49', 1, NULL),
(160, NULL, NULL, 'Data Team', '1542996468_belgium_domain.csv', 'uploaded', 'belgium domain.csv', '/uploads/data_upload/2018/11/23/1542996468_belgium_domain.csv', '22.53', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/23/1542996468_belgium_domain.csv', '.csv', NULL, NULL, 'data_upload', '0000-00-00 00:00:00', 'File save to server', 0, NULL, '2018-11-23 19:07:48', 1, NULL, NULL, NULL),
(161, NULL, NULL, 'Data Team', '1542996678_belgium_domain.csv', 'loaded', 'belgium domain.csv', '/uploads/data_upload/2018/11/23/1542996678_belgium_domain.csv', '22.53', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/23/1542996678_belgium_domain.csv', '.csv', 573, 0, 'data_upload', 'export/data_upload/failedupload/2018/11/23/failed-1542996678.csv', 'File save to server', 0, NULL, '2018-11-23 19:11:18', 1, '2018-11-23 19:11:20', 1, NULL),
(162, NULL, NULL, 'Data Team', '1542997267_belgium_domain.csv', 'loaded', 'belgium domain.csv', '/uploads/data_upload/2018/11/23/1542997267_belgium_domain.csv', '22.53', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/23/1542997267_belgium_domain.csv', '.csv', 573, 513, 'data_upload', 'export/data_upload/failedupload/2018/11/23/failed-1542997267.csv', 'File save to server', 0, NULL, '2018-11-23 19:21:07', 1, '2018-11-23 19:21:09', 1, NULL),
(163, NULL, NULL, 'Data Team', '1542997367_domain_append_file.csv', 'loaded', 'domain append file.csv', '/uploads/data_upload/2018/11/23/1542997367_domain_append_file.csv', '1510.88', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/23/1542997367_domain_append_file.csv', '.csv', 28992, 19797, 'data_upload', 'export/data_upload/failedupload/2018/11/23/failed-1542997367.csv', 'File save to server', 0, NULL, '2018-11-23 19:22:47', 1, '2018-11-23 19:25:35', 1, NULL),
(164, NULL, NULL, 'Data Team', '1543003638_important_domain_1.csv', 'loaded', 'important domain 1.csv', '/uploads/data_upload/2018/11/23/1543003638_important_domain_1.csv', '13.84', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/23/1543003638_important_domain_1.csv', '.csv', 344, 300, 'data_upload', 'export/data_upload/failedupload/2018/11/23/failed-1543003638.csv', 'File save to server', 0, NULL, '2018-11-23 21:07:18', 1, '2018-11-23 21:07:21', 1, NULL),
(165, NULL, NULL, 'Data Team', '1543003982_importanat_domain.csv', 'loaded', 'importanat domain.csv', '/uploads/data_upload/2018/11/23/1543003982_importanat_domain.csv', '32.16', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/23/1543003982_importanat_domain.csv', '.csv', 842, 233, 'data_upload', 'export/data_upload/failedupload/2018/11/23/failed-1543003982.csv', 'File save to server', 0, NULL, '2018-11-23 21:13:02', 1, '2018-11-23 21:13:08', 1, NULL),
(166, NULL, NULL, 'Data Team', '1543510636_Domain_FIle.csv', 'uploaded', 'Domain FIle.csv', '/uploads/data_upload/2018/11/29/1543510636_Domain_FIle.csv', '2402.33', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/29/1543510636_Domain_FIle.csv', '.csv', NULL, NULL, 'data_upload', '0000-00-00 00:00:00', 'File save to server', 0, NULL, '2018-11-29 17:57:17', 1, NULL, NULL, NULL),
(167, NULL, NULL, 'Data Team', '1543511163_Domain_FIle.csv', 'uploaded', 'Domain FIle.csv', '/uploads/data_upload/2018/11/29/1543511163_Domain_FIle.csv', '2402.33', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/29/1543511163_Domain_FIle.csv', '.csv', NULL, NULL, 'data_upload', '0000-00-00 00:00:00', 'File save to server', 0, NULL, '2018-11-29 18:06:03', 1, NULL, NULL, NULL),
(168, NULL, NULL, 'Data Team', '1543512824_Domain_FIle2.csv', 'uploaded', 'Domain FIle2.csv', '/uploads/data_upload/2018/11/29/1543512824_Domain_FIle2.csv', '2762.54', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/29/1543512824_Domain_FIle2.csv', '.csv', NULL, NULL, 'data_upload', '0000-00-00 00:00:00', 'File save to server', 0, NULL, '2018-11-29 18:33:44', 1, NULL, NULL, NULL),
(169, NULL, NULL, 'Data Team', '1543522777_new_file.csv', 'loaded', 'new file.csv', '/uploads/data_upload/2018/11/29/1543522777_new_file.csv', '1942.28', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/29/1543522777_new_file.csv', '.csv', 43690, 34478, 'data_upload', 'export/data_upload/failedupload/2018/11/29/failed-1543522777.csv', 'File save to server', 0, NULL, '2018-11-29 21:19:37', 1, '2018-11-29 21:31:46', 1, NULL),
(170, NULL, NULL, 'Data Team', '1543526200_Domain_Collated_Arvind.csv', 'loaded', 'Domain Collated_Arvind.csv', '/uploads/data_upload/2018/11/29/1543526200_Domain_Collated_Arvind.csv', '2457.12', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/29/1543526200_Domain_Collated_Arvind.csv', '.csv', 49998, 29872, 'data_upload', 'export/data_upload/failedupload/2018/11/29/failed-1543526200.csv', 'File save to server', 0, NULL, '2018-11-29 22:16:40', 1, '2018-11-29 22:36:11', 1, NULL),
(171, NULL, NULL, 'Data Team', '1543527736_Domain_Collated_Arvind3.csv', 'loaded', 'Domain Collated_Arvind3.csv', '/uploads/data_upload/2018/11/29/1543527736_Domain_Collated_Arvind3.csv', '2572.19', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/29/1543527736_Domain_Collated_Arvind3.csv', '.csv', 50052, 38290, 'data_upload', 'export/data_upload/failedupload/2018/11/29/failed-1543527736.csv', 'File save to server', 0, NULL, '2018-11-29 22:42:16', 1, '2018-11-29 23:04:11', 1, NULL),
(172, NULL, NULL, 'Data Team', '1543538540_data_upload_template_(2).csv', 'loaded', 'data_upload_template (2).csv', '/uploads/data_upload/2018/11/30/1543538540_data_upload_template_(2).csv', '2.94', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/11/30/1543538540_data_upload_template_(2).csv', '.csv', 53, 5, 'data_upload', 'export/data_upload/failedupload/2018/11/30/failed-1543538540.csv', 'File save to server', 0, NULL, '2018-11-30 01:42:20', 1, '2018-11-30 01:42:21', 1, NULL),
(173, NULL, NULL, 'Data Team', '1544098391_data_upload_template_(2).csv', 'uploaded', 'data_upload_template (2).csv', '/uploads/data_upload/2018/12/06/1544098391_data_upload_template_(2).csv', '6225.82', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/12/06/1544098391_data_upload_template_(2).csv', '.csv', NULL, NULL, 'data_upload', '0000-00-00 00:00:00', 'File save to server', 0, NULL, '2018-12-06 13:13:11', 1, NULL, NULL, NULL),
(174, NULL, NULL, 'Data Team', '1544106516_5.csv', 'loaded', '5.csv', '/uploads/data_upload/2018/12/06/1544106516_5.csv', '3.23', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/12/06/1544106516_5.csv', '.csv', 51, 0, 'data_upload', 'export/data_upload/failedupload/2018/12/06/failed-1544106516.csv', 'File save to server', 0, NULL, '2018-12-06 15:28:36', 1, '2018-12-06 15:28:38', 1, NULL),
(175, NULL, NULL, 'Data Team', '1544106628_1.csv', 'loaded', '1.csv', '/uploads/data_upload/2018/12/06/1544106628_1.csv', '1258.1', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/12/06/1544106628_1.csv', '.csv', 24999, 1, 'data_upload', 'export/data_upload/failedupload/2018/12/06/failed-1544106628.csv', 'File save to server', 0, NULL, '2018-12-06 15:30:28', 1, '2018-12-06 15:41:37', 1, NULL),
(176, NULL, NULL, 'Data Team', '1544107894_2.csv', 'loaded', '2.csv', '/uploads/data_upload/2018/12/06/1544107894_2.csv', '1295.85', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/12/06/1544107894_2.csv', '.csv', 24998, 0, 'data_upload', 'export/data_upload/failedupload/2018/12/06/failed-1544107894.csv', 'File save to server', 0, NULL, '2018-12-06 15:51:34', 1, '2018-12-06 16:03:12', 1, NULL),
(177, NULL, NULL, 'Data Team', '1544111022_1.csv', 'loaded', '1.csv', '/uploads/data_upload/2018/12/06/1544111022_1.csv', '1258.1', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/12/06/1544111022_1.csv', '.csv', 24999, 4635, 'data_upload', 'export/data_upload/failedupload/2018/12/06/failed-1544111022.csv', 'File save to server', 0, NULL, '2018-12-06 16:43:42', 1, '2018-12-06 16:53:18', 1, NULL),
(178, NULL, NULL, 'Data Team', '1544111757_2.csv', 'loaded', '2.csv', '/uploads/data_upload/2018/12/06/1544111757_2.csv', '1295.85', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/12/06/1544111757_2.csv', '.csv', 24998, 8642, 'data_upload', 'export/data_upload/failedupload/2018/12/06/failed-1544111757.csv', 'File save to server', 0, NULL, '2018-12-06 16:55:57', 1, '2018-12-06 17:06:12', 1, NULL),
(179, NULL, NULL, 'Data Team', '1544112594_5.csv', 'loaded', '5.csv', '/uploads/data_upload/2018/12/06/1544112594_5.csv', '3.23', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/12/06/1544112594_5.csv', '.csv', 51, 1, 'data_upload', 'export/data_upload/failedupload/2018/12/06/failed-1544112594.csv', 'File save to server', 0, NULL, '2018-12-06 17:09:54', 1, '2018-12-06 17:09:55', 1, NULL),
(180, NULL, NULL, 'Data Team', '1544112815_Domain_FIle.csv', 'loaded', 'Domain FIle.csv', '/uploads/data_upload/2018/12/06/1544112815_Domain_FIle.csv', '1877.71', '/var/www/html/application/modules/data_upload/assets//uploads/data_upload/2018/12/06/1544112815_Domain_FIle.csv', '.csv', 44693, 14280, 'data_upload', 'export/data_upload/failedupload/2018/12/06/failed-1544112816.csv', 'File save to server', 0, NULL, '2018-12-06 17:13:36', 1, '2018-12-06 17:32:25', 1, NULL),
(181, NULL, NULL, 'Data Team', '1596822040_data_upload_template.csv', 'uploaded', 'data_upload_template.csv', '/uploads/data_upload/2020/08/07/1596822040_data_upload_template.csv', '2.94', 'C:\\xampp\\htdocs\\b2b\\application/modules/data_upload/assets//uploads/data_upload/2020/08/07/1596822040_data_upload_template.csv', '.csv', NULL, NULL, 'data_upload', '0000-00-00 00:00:00', 'File save to server', 0, NULL, '2020-08-07 19:40:40', 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bf_form_data`
--

CREATE TABLE `bf_form_data` (
  `id` int(11) NOT NULL,
  `fi_id` int(128) DEFAULT NULL,
  `value` mediumtext DEFAULT NULL,
  `groups` varchar(128) NOT NULL,
  `createddate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bf_form_inputs`
--

CREATE TABLE `bf_form_inputs` (
  `id` int(11) NOT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `form_group` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `label` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `field_id` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `type` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `placeholder` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  `htmlClass` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  `default_value` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  `style` varchar(500) CHARACTER SET latin1 DEFAULT NULL,
  `required` int(11) DEFAULT NULL,
  `disabled` int(11) DEFAULT NULL,
  `length` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `createddate` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifieddate` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modifiedby` int(11) DEFAULT NULL,
  `listed` int(11) NOT NULL DEFAULT 1,
  `editable` int(11) NOT NULL DEFAULT 1,
  `uuid` varchar(64) DEFAULT NULL,
  `deleted` timestamp NULL DEFAULT NULL,
  `isdeleted` tinyint(4) DEFAULT 0,
  `deletedby` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bf_form_inputs`
--

INSERT INTO `bf_form_inputs` (`id`, `campaign_id`, `form_group`, `label`, `field_id`, `type`, `placeholder`, `htmlClass`, `default_value`, `style`, `required`, `disabled`, `length`, `position`, `createdby`, `createddate`, `modifieddate`, `modifiedby`, `listed`, `editable`, `uuid`, `deleted`, `isdeleted`, `deletedby`) VALUES
(1, 5, NULL, 'test', NULL, 'text', 'test', NULL, NULL, NULL, 1, NULL, 3, NULL, NULL, '2020-09-20 20:29:25', '2020-09-27 01:31:00', NULL, 1, 1, '075c2181-fb80-11ea-931e-24fd52b232b6', '0000-00-00 00:00:00', 1, 2),
(2, 5, NULL, 'testasdasd', NULL, 'text', 'test', NULL, NULL, NULL, 1, NULL, 3, NULL, NULL, '2020-09-20 20:31:36', '2020-09-27 01:30:59', NULL, 1, 1, '554e7e42-fb80-11ea-931e-24fd52b232b6', '0000-00-00 00:00:00', 1, 2),
(3, 5, NULL, 'testasdasd=', NULL, 'text', 'test', NULL, NULL, NULL, 1, NULL, 3, NULL, NULL, '2020-09-20 20:31:44', '2020-09-21 02:01:44', NULL, 1, 1, '5a327357-fb80-11ea-931e-24fd52b232b6', NULL, NULL, NULL),
(4, 5, NULL, 'dsf', NULL, 'text', 'sdf', NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, '2020-09-20 20:46:09', '2020-09-21 02:16:09', NULL, 1, 1, '5dc97a96-fb82-11ea-931e-24fd52b232b6', NULL, NULL, NULL),
(5, 5, NULL, 'dsfdf', NULL, 'text', 'sdf', NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, '2020-09-20 20:49:13', '2020-09-21 02:19:13', NULL, 1, 1, 'cb8fbbe1-fb82-11ea-931e-24fd52b232b6', NULL, NULL, NULL),
(6, 5, NULL, 'dsfdfkk', NULL, 'text', 'sdf', NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, '2020-09-20 20:50:41', '2020-09-21 02:20:41', NULL, 1, 1, '0027e9f1-fb83-11ea-931e-24fd52b232b6', NULL, NULL, NULL),
(7, 5, NULL, 'dsfdfkkas', NULL, 'text', 'sdf', NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, '2020-09-20 20:51:25', '2020-09-21 02:21:25', NULL, 1, 1, '1a83774b-fb83-11ea-931e-24fd52b232b6', NULL, NULL, NULL),
(8, 5, NULL, 'dsfdfkkass', NULL, 'text', 'sdf', NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, '2020-09-20 20:52:21', '2020-09-21 02:22:21', NULL, 1, 1, '3b5283e8-fb83-11ea-931e-24fd52b232b6', NULL, NULL, NULL),
(9, 5, NULL, 'dsfdfkkasss', NULL, 'text', 'sdf', NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, '2020-09-20 20:52:50', '2020-09-21 02:22:50', NULL, 1, 1, '4d2fd01b-fb83-11ea-931e-24fd52b232b6', NULL, NULL, NULL),
(10, 5, NULL, 'dsfdfkkasssaa', NULL, 'text', 'sdf', NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, '2020-09-20 20:53:36', '2020-09-21 02:23:36', NULL, 1, 1, '68318fec-fb83-11ea-931e-24fd52b232b6', NULL, NULL, NULL),
(11, 5, NULL, 'll', NULL, 'text', 'l', NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, '2020-09-20 21:10:54', '2020-09-21 02:40:54', NULL, 1, 1, 'd302f7c7-fb85-11ea-931e-24fd52b232b6', NULL, NULL, NULL),
(12, 5, NULL, 'llds', NULL, 'text', 'l', NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, '2020-09-20 21:12:22', '2020-09-21 02:42:22', NULL, 1, 1, '073292be-fb86-11ea-931e-24fd52b232b6', NULL, NULL, NULL),
(13, 5, NULL, 'lldssd', NULL, 'text', 'l', NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, '2020-09-20 21:13:13', '2020-09-21 02:43:13', NULL, 1, 1, '25a24906-fb86-11ea-931e-24fd52b232b6', NULL, NULL, NULL),
(14, 5, NULL, 'lldssdas', NULL, 'text', 'l', NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, '2020-09-20 21:14:16', '2020-09-21 02:44:16', NULL, 1, 1, '4b23fa90-fb86-11ea-931e-24fd52b232b6', NULL, NULL, NULL),
(15, 5, NULL, 'lldssdasd', NULL, 'text', 'l', NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, '2020-09-20 21:15:09', '2020-09-21 02:45:09', NULL, 1, 1, '6b33e129-fb86-11ea-931e-24fd52b232b6', NULL, NULL, NULL),
(16, 5, NULL, 'jhghh', NULL, 'text', 'dssd', NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, '2020-09-20 21:16:23', '2020-09-21 02:46:23', NULL, 1, 1, '975e8dbc-fb86-11ea-931e-24fd52b232b6', NULL, NULL, NULL),
(17, 5, NULL, 'jhgkhh', NULL, 'text', 'dssd', NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, '2020-09-20 21:18:06', '2020-09-21 02:48:06', NULL, 1, 1, 'd463f002-fb86-11ea-931e-24fd52b232b6', NULL, NULL, NULL),
(18, 5, NULL, 'sdsf', NULL, 'text', 'df', NULL, NULL, NULL, NULL, NULL, 34, NULL, NULL, '2020-09-20 21:23:53', '2020-09-21 02:53:53', NULL, 1, 1, 'a31556da-fb87-11ea-931e-24fd52b232b6', NULL, NULL, NULL),
(19, 5, NULL, 'sdsfs', NULL, 'text', 'df', NULL, NULL, NULL, NULL, NULL, 34, NULL, NULL, '2020-09-20 21:24:06', '2020-09-21 02:54:06', NULL, 1, 1, 'aafd9bcb-fb87-11ea-931e-24fd52b232b6', NULL, NULL, NULL),
(20, 5, NULL, 'sdsfsa', NULL, 'text', 'df', NULL, NULL, NULL, NULL, NULL, 34, NULL, NULL, '2020-09-20 21:24:51', '2020-09-21 02:54:51', NULL, 1, 1, 'c60ba1a0-fb87-11ea-931e-24fd52b232b6', NULL, NULL, NULL),
(21, 5, NULL, 'sdsfsal', NULL, 'text', 'df', NULL, NULL, NULL, NULL, NULL, 34, NULL, NULL, '2020-09-20 21:26:04', '2020-09-21 02:56:04', NULL, 1, 1, 'f180a7d3-fb87-11ea-931e-24fd52b232b6', NULL, NULL, NULL),
(22, 5, NULL, 'dfsdf', NULL, 'text', 'fsdf', NULL, NULL, NULL, NULL, NULL, 23, NULL, NULL, '2020-09-20 21:27:17', '2020-09-21 02:57:17', NULL, 1, 1, '1d21e4fe-fb88-11ea-931e-24fd52b232b6', NULL, NULL, NULL),
(23, 5, NULL, 'dfsdfk', NULL, 'text', 'fsdf', NULL, NULL, NULL, NULL, NULL, 23, NULL, NULL, '2020-09-20 21:27:28', '2020-09-21 02:57:28', NULL, 1, 1, '2332edae-fb88-11ea-931e-24fd52b232b6', NULL, NULL, NULL),
(24, 5, NULL, 'kkklkl', NULL, 'text', 'kkl', NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL, '2020-09-20 21:29:17', '2020-09-21 02:59:17', NULL, 1, 1, '64937f41-fb88-11ea-931e-24fd52b232b6', NULL, NULL, NULL),
(25, 5, NULL, 'kkk', NULL, 'text', 'kk', NULL, NULL, NULL, NULL, NULL, 88, NULL, NULL, '2020-09-20 21:30:58', '2020-09-21 03:00:58', NULL, 1, 1, 'a0c45274-fb88-11ea-931e-24fd52b232b6', NULL, NULL, NULL),
(26, 5, NULL, 'kkkll', NULL, 'text', 'kk', NULL, NULL, NULL, NULL, NULL, 88, NULL, NULL, '2020-09-20 21:32:07', '2020-09-21 03:02:07', NULL, 1, 1, 'c9ca89ad-fb88-11ea-931e-24fd52b232b6', NULL, NULL, NULL),
(27, 5, NULL, 'kkklljj', NULL, 'text', 'kk', NULL, NULL, NULL, NULL, NULL, 88, NULL, NULL, '2020-09-20 21:33:12', '2020-09-21 03:03:12', NULL, 1, 1, 'f0556c7c-fb88-11ea-931e-24fd52b232b6', NULL, NULL, NULL),
(28, 5, NULL, 'kkklljjd', NULL, 'text', 'kk', NULL, NULL, NULL, NULL, NULL, 88, NULL, NULL, '2020-09-20 21:33:45', '2020-09-21 03:03:45', NULL, 1, 1, '03f4682d-fb89-11ea-931e-24fd52b232b6', NULL, NULL, NULL),
(29, 5, NULL, 'asasasa', NULL, 'textarea', 'asasas', NULL, NULL, NULL, NULL, NULL, 121, NULL, NULL, '2020-09-20 21:34:26', '2020-09-21 03:04:26', NULL, 1, 1, '1cdf9847-fb89-11ea-931e-24fd52b232b6', NULL, NULL, NULL),
(30, 1, NULL, 'Shashi', NULL, 'text', 'I am L', NULL, NULL, NULL, 1, NULL, 10, NULL, NULL, '2020-09-21 14:40:09', '2020-09-21 20:10:09', NULL, 1, 1, '6d0fca31-fc18-11ea-931e-24fd52b232b6', NULL, NULL, NULL),
(31, 1, NULL, 'Shashi2', NULL, 'textarea', '1000', NULL, NULL, NULL, NULL, NULL, 1000, NULL, NULL, '2020-09-21 14:40:48', '2020-09-21 20:10:48', NULL, 1, 1, '842423f0-fc18-11ea-931e-24fd52b232b6', NULL, NULL, NULL),
(32, 1, NULL, 'dfs', NULL, 'checkboxinput', 'rer', NULL, NULL, NULL, NULL, NULL, 22, NULL, NULL, '2020-09-21 14:41:09', '2020-09-21 20:11:09', NULL, 1, 1, '911f0525-fc18-11ea-931e-24fd52b232b6', NULL, NULL, NULL),
(33, 1, NULL, 'mul', NULL, 'selectmultiple', 'LL||aa', NULL, NULL, NULL, NULL, NULL, 100, NULL, NULL, '2020-09-21 14:41:42', '2020-09-21 20:11:42', NULL, 1, 1, 'a4c653c4-fc18-11ea-931e-24fd52b232b6', NULL, NULL, NULL),
(34, 1, NULL, 'number', NULL, 'number', 'umber', NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, '2020-09-21 14:42:40', '2020-09-21 20:12:40', NULL, 1, 1, 'c7219d5d-fc18-11ea-931e-24fd52b232b6', NULL, NULL, NULL),
(35, 6, NULL, 'Are you chu?', NULL, 'textarea', 'Are you chu', NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, '2020-09-22 18:10:31', '2020-09-22 23:40:31', NULL, 1, 1, '012c7da7-fcff-11ea-931e-24fd52b232b6', NULL, NULL, NULL),
(36, 1, NULL, 'sd', NULL, 'number', 'hgj1', NULL, NULL, NULL, NULL, NULL, 77, NULL, NULL, '2020-09-23 05:18:12', '2020-09-23 10:48:12', NULL, 1, 1, '4e4b9ad9-fd5c-11ea-931e-24fd52b232b6', NULL, NULL, NULL),
(37, 5, NULL, 'dasd', NULL, 'number', 'khj', NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL, '2020-09-26 18:50:05', '2020-09-27 00:20:05', NULL, 1, 1, '1d3d223d-0029-11eb-bd98-24fd52b232b6', NULL, NULL, NULL),
(38, 5, NULL, 'sdad', NULL, 'password', 'sasd', NULL, NULL, NULL, NULL, NULL, 3333, NULL, NULL, '2020-09-26 18:50:34', '2020-09-27 00:20:34', NULL, 1, 1, '2e6e7361-0029-11eb-bd98-24fd52b232b6', NULL, NULL, NULL),
(39, 5, NULL, 'hh', NULL, 'checkboxinput', 'rer', NULL, NULL, NULL, NULL, NULL, 22, NULL, NULL, '2020-09-26 19:09:23', '2020-09-27 00:39:23', NULL, 1, 1, 'cf826341-002b-11eb-bd98-24fd52b232b6', NULL, NULL, NULL),
(40, 5, NULL, 'dfs', NULL, 'number', 'rer', NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL, '2020-09-26 19:56:11', '2020-09-27 01:39:14', NULL, 1, 1, '59220a9e-0032-11eb-bd98-24fd52b232b6', '0000-00-00 00:00:00', 1, 2),
(41, 5, NULL, 'dfskkk', NULL, 'number', 'rer', NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL, '2020-09-26 19:56:36', '2020-09-27 01:43:45', NULL, 1, 1, '67fbf318-0032-11eb-bd98-24fd52b232b6', '2020-09-26 16:43:45', 1, 2),
(42, 1, NULL, 'testtt', NULL, 'text', 'plae', NULL, NULL, NULL, NULL, NULL, 23, NULL, NULL, '2020-09-27 11:25:35', '2020-09-28 00:54:40', NULL, 1, 1, '2f88e6a8-00b4-11eb-bf65-24fd52b232b6', '2020-09-27 15:54:40', 1, 2),
(43, 1, NULL, 'tet', NULL, 'textarea', 'ttte', NULL, NULL, NULL, NULL, NULL, 500, NULL, NULL, '2020-09-27 11:25:53', '2020-09-28 00:54:42', NULL, 1, 1, '3a5c63ed-00b4-11eb-bf65-24fd52b232b6', '2020-09-27 15:54:42', 1, 2),
(44, 1, NULL, 'as', NULL, 'text', 'asa', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2020-09-27 19:24:58', '2020-10-03 00:50:48', NULL, 1, 1, '27a28f03-00f7-11eb-bf65-24fd52b232b6', '2020-10-02 15:50:48', 1, 2),
(45, 2, NULL, 'sdsa', NULL, 'text', 'jjkasd', NULL, NULL, NULL, NULL, NULL, 223, NULL, NULL, '2020-09-28 17:06:48', '2020-10-31 15:05:01', NULL, 1, 1, '0a419449-01ad-11eb-bf65-24fd52b232b6', '2020-10-31 12:05:01', 1, 2),
(46, 1, NULL, 'ddfsd', NULL, 'password', 'jkdskfj', NULL, NULL, NULL, NULL, NULL, 342, NULL, NULL, '2020-10-02 19:20:59', '2020-11-19 18:30:23', NULL, 1, 1, '724820d9-04e4-11eb-a633-24fd52b232b6', '2020-11-19 15:30:23', 1, 2),
(47, 1, NULL, 'Quetion 1', NULL, 'checkboxinput', 'a||asdas||asdasd', NULL, NULL, NULL, NULL, NULL, 88, NULL, NULL, '2020-10-02 19:21:59', '2020-11-06 10:31:31', NULL, 1, 1, '9668895a-04e4-11eb-a633-24fd52b232b6', '2020-11-06 07:31:31', 1, 2),
(48, 1, NULL, 'Select 1', NULL, 'select2', 'A||asdasdasd||asdasda', NULL, NULL, NULL, NULL, NULL, 231, NULL, NULL, '2020-10-02 19:22:42', '2020-11-06 10:31:34', NULL, 1, 1, 'af809553-04e4-11eb-a633-24fd52b232b6', '2020-11-06 07:31:34', 1, 2),
(49, 1, NULL, 'Multi Select', NULL, 'selectmultiple2', '1||2||3||4', NULL, NULL, NULL, NULL, NULL, 212, NULL, NULL, '2020-10-02 19:23:48', '2020-11-06 10:31:34', NULL, 1, 1, 'd73c70df-04e4-11eb-a633-24fd52b232b6', '2020-11-06 07:31:34', 1, 2),
(50, 12, NULL, 'hh', NULL, 'text', 'll', NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, '2020-10-19 17:58:52', '2020-10-19 23:28:52', NULL, 1, 1, 'be1fe96b-1234-11eb-a7a0-24fd52b232b6', NULL, 0, NULL);

--
-- Triggers `bf_form_inputs`
--
DELIMITER $$
CREATE TRIGGER `bf_form_inputs_before_insert` BEFORE INSERT ON `bf_form_inputs` FOR EACH ROW BEGIN
SET NEW.uuid = UUID();
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `bf_form_input_types`
--

CREATE TABLE `bf_form_input_types` (
  `id` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bf_form_input_types`
--

INSERT INTO `bf_form_input_types` (`id`, `name`) VALUES
(0, NULL),
(1, 'text'),
(2, 'password'),
(3, 'number'),
(4, 'textarea'),
(5, 'checkboxinput'),
(6, 'select'),
(7, 'selectmultiple'),
(8, 'select2'),
(9, 'selectmultiple2'),
(10, 'button'),
(11, 'submit'),
(12, 'file'),
(13, 'files'),
(14, 'color'),
(15, 'date'),
(16, 'datetimelocal'),
(17, 'email'),
(18, 'hidden'),
(19, 'imagebutton'),
(20, 'month'),
(21, 'range'),
(22, 'tel'),
(24, 'time');

-- --------------------------------------------------------

--
-- Table structure for table `bf_html_input_type`
--

CREATE TABLE `bf_html_input_type` (
  `id` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bf_intent_tag`
--

CREATE TABLE `bf_intent_tag` (
  `id` int(11) NOT NULL,
  `name` varchar(264) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bf_intent_tag_campaign`
--

CREATE TABLE `bf_intent_tag_campaign` (
  `id` int(11) NOT NULL,
  `name` varchar(264) DEFAULT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bf_kanban_boards`
--

CREATE TABLE `bf_kanban_boards` (
  `id` int(11) NOT NULL,
  `order_number` int(11) DEFAULT NULL,
  `board_id` varchar(25) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `dragTo` varchar(25) DEFAULT NULL,
  `category` varchar(25) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT current_timestamp(),
  `modified_on` datetime DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `cssClass` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bf_kanban_boards`
--

INSERT INTO `bf_kanban_boards` (`id`, `order_number`, `board_id`, `title`, `dragTo`, `category`, `customer_id`, `created_on`, `modified_on`, `created_by`, `modified_by`, `cssClass`) VALUES
(0, 1, '_live', 'Live', NULL, 'sales', 2, '2020-10-20 22:31:51', '2020-10-20 22:31:51', 2, NULL, ''),
(1, 1, '_new_opportunity', 'New Opportunity', NULL, 'sales', 2, '2020-10-20 22:31:51', '2020-10-20 22:31:51', 2, NULL, ''),
(2, 2, '_proposal', 'Proposal', NULL, 'sales', 2, '2020-10-20 22:36:21', '2020-10-20 22:36:21', 2, NULL, ''),
(3, 3, '_proposal_approved', 'Proposal Approved', NULL, 'sales', 2, '2020-10-20 22:36:21', '2020-10-20 22:36:21', 2, NULL, ''),
(4, 4, '_contract_signed', 'Contract Signed', NULL, 'sales', 2, '2020-10-20 22:36:21', '2020-10-20 22:36:21', 2, NULL, ''),
(5, 5, '_onboard', 'Onboard', '', 'sales', 2, '2020-10-20 22:36:21', '2020-10-20 22:36:21', 2, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `bf_leads`
--

CREATE TABLE `bf_leads` (
  `id` int(11) NOT NULL,
  `prospect_id` int(11) DEFAULT NULL,
  `agent` int(11) DEFAULT NULL,
  `agent_disposition` int(11) DEFAULT NULL,
  `agent_sub_disposition` int(11) DEFAULT NULL,
  `agent_date_time` datetime DEFAULT NULL,
  `quality_disposition` int(11) DEFAULT NULL COMMENT '1 - lead',
  `quality_sub_disposition` int(11) DEFAULT NULL,
  `quality_date_time` datetime DEFAULT NULL,
  `campaign_id` int(11) DEFAULT 0,
  `status` int(11) DEFAULT 0 COMMENT '0 - read for calling\r\n1 - calling\r\n2 - disqualified\r\n3 - qualified\r\n4 - DNC\r\n5- client rejection',
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `client_alias_id` int(11) DEFAULT NULL,
  `isConsent` int(11) NOT NULL DEFAULT 0,
  `dnc` int(11) DEFAULT 0 COMMENT '0 - no\r\n1 - yes',
  `isWebVerified` int(11) DEFAULT 0,
  `agent_notes` varchar(255) DEFAULT NULL,
  `quality_dnc` int(11) NOT NULL DEFAULT 0,
  `quality_notes` varchar(255) DEFAULT NULL,
  `quality_user_id` int(11) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `rejection_reason` text DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `rejection_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bf_leads`
--

INSERT INTO `bf_leads` (`id`, `prospect_id`, `agent`, `agent_disposition`, `agent_sub_disposition`, `agent_date_time`, `quality_disposition`, `quality_sub_disposition`, `quality_date_time`, `campaign_id`, `status`, `deleted`, `deleted_by`, `created_on`, `created_by`, `modified_on`, `modified_by`, `customer_id`, `client_alias_id`, `isConsent`, `dnc`, `isWebVerified`, `agent_notes`, `quality_dnc`, `quality_notes`, `quality_user_id`, `email`, `rejection_reason`, `notes`, `rejection_date`) VALUES
(3, 649, 2, 20, 16, '2020-10-02 23:55:15', 0, 0, '2020-10-01 23:55:36', 13, 0, 0, NULL, '2020-10-09 12:23:02', NULL, '2020-11-07 19:45:59', 2, 2, 2, 0, 0, 0, NULL, 1, NULL, NULL, NULL, '', '', NULL),
(4, 59, 2, 20, 16, '2020-10-02 23:55:15', 0, 0, '2020-10-01 23:55:36', 25, 0, 0, NULL, '2020-10-09 12:57:39', 2, '2020-11-07 19:50:41', 2, 2, NULL, 0, 0, 0, NULL, 1, NULL, NULL, NULL, '', '', NULL),
(5, 60, 2, 1, 1, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-09 13:24:53', 2, NULL, NULL, 2, NULL, 1, 0, 1, 'kkk', 0, NULL, NULL, NULL, '', '', NULL),
(6, 61, 2, 1, 1, '2020-10-01 19:58:07', 1, 1, '2020-10-10 18:22:39', 5, 0, 0, NULL, '2020-10-09 23:43:59', 2, NULL, NULL, 2, NULL, 1, 0, 1, 'kesa', 1, 'sdasdas', 2, NULL, '', '', NULL),
(7, 62, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:00:58', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(8, 63, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:00:58', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(9, 64, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:00:58', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(10, 65, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:00:58', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(11, 66, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:00:59', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(12, 67, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:00:59', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(13, 68, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:00:59', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(14, 69, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:00:59', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(15, 70, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:00:59', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(16, 71, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:00:59', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(17, 72, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:00:59', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(18, 73, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:00', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(19, 74, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:00', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(20, 75, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:00', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(21, 76, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:00', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(22, 77, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:00', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(23, 78, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:00', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(24, 79, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:00', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(25, 80, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:01', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(26, 81, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:01', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(27, 82, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:01', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(28, 83, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:01', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(29, 84, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:01', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(30, 85, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:01', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(31, 86, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:01', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(32, 87, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:02', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(33, 88, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:02', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(34, 89, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:02', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(35, 90, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:02', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(36, 91, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:02', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(37, 92, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:02', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(38, 93, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:02', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(39, 94, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:02', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(40, 95, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:02', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(41, 96, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:03', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(42, 97, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:03', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(43, 98, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:03', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(44, 99, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:03', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(45, 100, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:03', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(46, 101, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:03', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(47, 102, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:04', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(48, 103, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:04', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(49, 104, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:04', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(50, 105, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:04', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(51, 106, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:04', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(52, 107, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:04', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(53, 108, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:04', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(54, 109, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:04', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(55, 110, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:05', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(56, 111, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:05', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(57, 112, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:05', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(58, 113, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:05', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(59, 114, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:06', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(60, 115, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:06', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(61, 116, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:06', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(62, 117, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:06', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(63, 118, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:06', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(64, 119, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:06', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(65, 120, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:07', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(66, 121, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:07', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(67, 122, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:07', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(68, 123, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:08', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(69, 124, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:08', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(70, 125, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:08', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(71, 126, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:08', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(72, 127, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:08', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(73, 128, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:08', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(74, 129, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:09', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(75, 130, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:09', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(76, 131, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:09', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(77, 132, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:09', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(78, 133, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:09', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(79, 134, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:09', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(80, 135, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:10', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(81, 136, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:10', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(82, 137, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:10', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(83, 138, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:10', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(84, 139, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:10', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(85, 140, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:10', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(86, 141, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:10', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(87, 142, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:11', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(88, 143, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:11', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(89, 144, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:11', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(90, 145, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:11', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(91, 146, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:11', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(92, 147, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:12', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(93, 148, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:12', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(94, 149, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:12', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(95, 150, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:12', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(96, 151, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:12', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(97, 152, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:12', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(98, 153, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:12', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(99, 154, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:13', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(100, 155, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:13', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(101, 156, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:13', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(102, 157, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:13', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(103, 158, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:14', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(104, 159, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:14', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(105, 160, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:15', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(106, 161, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:15', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(107, 162, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:15', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(108, 163, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:15', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(109, 164, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:15', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(110, 165, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:15', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(111, 166, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:15', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(112, 167, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:16', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(113, 168, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:16', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(114, 169, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:16', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(115, 170, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:17', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(116, 171, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:17', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(117, 172, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:17', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(118, 173, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:17', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(119, 174, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:18', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(120, 175, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:18', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(121, 176, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:18', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(122, 177, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:18', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(123, 178, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:18', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(124, 179, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:18', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(125, 180, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:19', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(126, 181, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:19', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(127, 182, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:19', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(128, 183, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:19', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(129, 184, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:19', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(130, 185, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:19', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(131, 186, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:20', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(132, 187, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:20', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(133, 188, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:20', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(134, 189, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:20', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(135, 190, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:20', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(136, 191, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:21', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(137, 192, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:21', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(138, 193, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:21', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(139, 194, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:21', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(140, 195, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:21', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(141, 196, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:22', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(142, 197, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:22', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(143, 198, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:22', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(144, 199, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:22', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(145, 200, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:22', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(146, 201, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:23', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(147, 202, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:23', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(148, 203, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:23', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(149, 204, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:23', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(150, 205, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:24', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(151, 206, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:24', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(152, 207, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:24', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(153, 208, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:24', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(154, 209, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:24', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(155, 210, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:24', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(156, 211, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:24', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(157, 212, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:25', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(158, 213, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:25', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(159, 214, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:25', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(160, 215, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:25', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(161, 216, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:25', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(162, 217, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:26', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(163, 218, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:26', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(164, 219, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:26', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(165, 220, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:26', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(166, 221, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:26', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(167, 222, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:26', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(168, 223, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:26', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(169, 224, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:27', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(170, 225, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:27', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(171, 226, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:27', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(172, 227, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:27', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(173, 228, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:27', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(174, 229, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:27', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(175, 230, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:27', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(176, 231, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:28', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(177, 232, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:28', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(178, 233, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:28', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(179, 234, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:28', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(180, 235, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:28', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(181, 236, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:28', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(182, 237, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:28', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(183, 238, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:29', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(184, 239, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:29', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(185, 240, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:29', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(186, 241, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:29', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(187, 242, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:29', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(188, 243, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:30', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(189, 244, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:30', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(190, 245, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:30', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(191, 246, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:30', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(192, 247, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:31', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(193, 248, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:31', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(194, 249, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:31', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(195, 250, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:31', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(196, 251, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:31', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(197, 252, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:31', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(198, 253, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:31', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(199, 254, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:32', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(200, 255, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:32', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(201, 256, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:32', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(202, 257, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:32', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(203, 258, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:32', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(204, 259, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:33', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(205, 260, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:33', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(206, 261, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:33', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(207, 262, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:33', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(208, 263, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:34', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(209, 264, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:34', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(210, 265, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:34', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(211, 266, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:34', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(212, 267, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:34', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(213, 268, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:34', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(214, 269, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:35', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(215, 270, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:35', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(216, 271, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:35', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(217, 272, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:35', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(218, 273, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:36', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(219, 274, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:36', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(220, 275, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:36', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(221, 276, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:37', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(222, 277, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:37', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(223, 278, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:37', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(224, 279, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:37', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(225, 280, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:37', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(226, 281, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:38', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(227, 282, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:38', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(228, 283, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:38', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(229, 284, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:39', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(230, 285, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:39', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(231, 286, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:39', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(232, 287, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:39', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(233, 288, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:39', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(234, 289, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:40', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(235, 290, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:40', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(236, 291, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:40', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(237, 292, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:41', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(238, 293, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:41', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(239, 294, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:41', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(240, 295, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:41', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(241, 296, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:41', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(242, 297, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:41', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(243, 298, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:42', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(244, 299, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:42', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(245, 300, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:42', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(246, 301, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:42', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(247, 302, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:43', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(248, 303, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:43', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(249, 304, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:43', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(250, 305, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:43', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(251, 306, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:44', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(252, 307, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:44', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(253, 308, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:45', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(254, 309, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:45', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(255, 310, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:45', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(256, 311, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:46', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(257, 312, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:46', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(258, 313, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:46', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(259, 314, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:46', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(260, 315, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:46', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(261, 316, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:46', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(262, 317, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:46', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(263, 318, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:47', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(264, 319, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:47', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(265, 320, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:47', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(266, 321, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:47', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(267, 322, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:47', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(268, 323, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:47', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(269, 324, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:48', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(270, 325, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:48', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(271, 326, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:48', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(272, 327, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:48', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(273, 328, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:48', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(274, 329, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:48', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(275, 330, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:49', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(276, 331, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:49', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(277, 332, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:49', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(278, 333, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:49', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(279, 334, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:49', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(280, 335, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:49', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(281, 336, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:49', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(282, 337, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:50', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(283, 338, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:50', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(284, 339, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:50', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(285, 340, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:50', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(286, 341, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:50', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(287, 342, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:51', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(288, 343, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:52', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(289, 344, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:52', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(290, 345, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:52', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(291, 346, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:52', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(292, 347, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:53', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(293, 348, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:53', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(294, 349, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:53', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(295, 350, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:53', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(296, 351, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:53', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(297, 352, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:54', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(298, 353, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:54', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(299, 354, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:55', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(300, 355, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:55', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(301, 356, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:55', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(302, 357, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:55', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(303, 358, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:55', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(304, 359, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:55', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(305, 360, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:56', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(306, 361, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:56', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(307, 362, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:56', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(308, 363, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:56', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(309, 364, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:56', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL);
INSERT INTO `bf_leads` (`id`, `prospect_id`, `agent`, `agent_disposition`, `agent_sub_disposition`, `agent_date_time`, `quality_disposition`, `quality_sub_disposition`, `quality_date_time`, `campaign_id`, `status`, `deleted`, `deleted_by`, `created_on`, `created_by`, `modified_on`, `modified_by`, `customer_id`, `client_alias_id`, `isConsent`, `dnc`, `isWebVerified`, `agent_notes`, `quality_dnc`, `quality_notes`, `quality_user_id`, `email`, `rejection_reason`, `notes`, `rejection_date`) VALUES
(310, 365, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:56', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(311, 366, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:56', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(312, 367, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:57', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(313, 368, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:57', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(314, 369, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:57', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(315, 370, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:57', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(316, 371, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:57', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(317, 372, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:57', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(318, 373, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:58', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(319, 374, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:58', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(320, 375, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:58', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(321, 376, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:58', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(322, 377, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:59', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(323, 378, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:59', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(324, 379, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:59', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(325, 380, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:59', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(326, 381, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:59', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(327, 382, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:01:59', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(328, 383, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:00', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(329, 384, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:00', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(330, 385, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:00', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(331, 386, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:00', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(332, 387, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:01', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(333, 388, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:01', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(334, 389, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:01', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(335, 390, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:01', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(336, 391, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:01', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(337, 392, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:01', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(338, 393, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:02', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(339, 394, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:02', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(340, 395, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:02', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(341, 396, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:02', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(342, 397, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:02', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(343, 398, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:03', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(344, 399, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:03', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(345, 400, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:03', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(346, 401, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:03', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(347, 402, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:04', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(348, 403, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:04', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(349, 404, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:04', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(350, 405, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:04', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(351, 406, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:04', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(352, 407, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:04', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(353, 408, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:05', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(354, 409, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:05', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(355, 410, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:05', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(356, 411, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:05', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(357, 412, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:06', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(358, 413, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:06', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(359, 414, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:06', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(360, 415, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:06', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(361, 416, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:06', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(362, 417, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:06', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(363, 418, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:07', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(364, 419, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:07', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(365, 420, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:07', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(366, 421, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:07', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(367, 422, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:08', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(368, 423, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:08', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(369, 424, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:08', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(370, 425, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:08', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(371, 426, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:08', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(372, 427, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:08', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(373, 428, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:09', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(374, 429, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:09', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(375, 430, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:09', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(376, 431, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:09', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(377, 432, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:09', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(378, 433, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:10', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(379, 434, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:10', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(380, 435, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:10', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(381, 436, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:10', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(382, 437, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:10', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(383, 438, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:11', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(384, 439, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:11', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(385, 440, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:11', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(386, 441, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:11', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(387, 442, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:11', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(388, 443, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:12', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(389, 444, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:12', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(390, 445, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:12', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(391, 446, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:12', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(392, 447, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:12', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(393, 448, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:12', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(394, 449, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:13', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(395, 450, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:13', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(396, 451, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:13', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(397, 452, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:14', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(398, 453, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:14', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(399, 454, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:14', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(400, 455, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:14', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(401, 456, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:14', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(402, 457, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:15', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(403, 458, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:15', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(404, 459, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:15', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(405, 460, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:15', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(406, 461, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:15', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(407, 462, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:15', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(408, 463, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:15', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(409, 464, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:16', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(410, 465, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:16', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(411, 466, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:16', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(412, 467, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:16', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(413, 468, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:16', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(414, 469, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:16', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(415, 470, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:16', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(416, 471, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:16', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(417, 472, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:18', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(418, 473, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:18', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(419, 474, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:18', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(420, 475, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:18', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(421, 476, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:18', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(422, 477, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:19', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(423, 478, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:19', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(424, 479, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:20', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(425, 480, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:20', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(426, 481, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:20', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(427, 482, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:20', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(428, 483, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:20', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(429, 484, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:20', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(430, 485, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:21', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(431, 486, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:21', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(432, 487, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:21', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(433, 488, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:21', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(434, 489, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:22', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(435, 490, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:22', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(436, 491, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:22', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(437, 492, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:22', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(438, 493, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:22', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(439, 494, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:23', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(440, 495, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:23', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(441, 496, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:23', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(442, 497, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:23', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(443, 498, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:23', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(444, 499, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:24', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(445, 500, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:24', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(446, 501, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:24', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(447, 502, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:24', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(448, 503, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:24', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(449, 504, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:24', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(450, 505, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:25', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(451, 506, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:25', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(452, 507, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:25', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(453, 508, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:25', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(454, 509, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:26', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(455, 510, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:26', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(456, 511, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:26', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(457, 512, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:27', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(458, 513, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:27', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(459, 514, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:27', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(460, 515, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:27', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(461, 516, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:27', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(462, 517, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:28', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(463, 518, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:28', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(464, 519, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:28', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(465, 520, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:28', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(466, 521, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:28', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(467, 522, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:29', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(468, 523, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:29', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(469, 524, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:29', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(470, 525, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:29', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(471, 526, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:29', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(472, 527, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:30', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(473, 528, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:30', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(474, 529, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:30', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(475, 530, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:30', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(476, 531, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:30', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(477, 532, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:30', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(478, 533, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:31', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(479, 534, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:31', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(480, 535, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:31', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(481, 536, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:31', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(482, 537, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:31', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(483, 538, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:31', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(484, 539, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:32', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(485, 540, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:32', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(486, 541, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:32', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(487, 542, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:32', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(488, 543, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:32', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(489, 544, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:33', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(490, 545, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:33', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(491, 546, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:34', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(492, 547, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:34', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(493, 548, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:34', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(494, 549, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:34', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(495, 550, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:34', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(496, 551, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:34', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(497, 552, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:35', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(498, 553, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:35', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(499, 554, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:35', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(500, 555, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:35', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(501, 556, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:35', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(502, 557, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:35', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(503, 558, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:36', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(504, 559, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:36', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(505, 560, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:36', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(506, 561, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:36', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(507, 562, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:37', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(508, 563, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:37', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(509, 564, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:37', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(510, 565, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:37', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(511, 566, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:37', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(512, 567, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:38', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(513, 568, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:38', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(514, 569, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:38', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(515, 570, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:38', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(516, 571, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:38', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(517, 572, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:39', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(518, 573, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:39', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(519, 574, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:40', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(520, 575, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:40', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(521, 576, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:40', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(522, 577, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:40', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(523, 578, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:40', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(524, 579, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:41', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(525, 580, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:41', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(526, 581, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:41', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(527, 582, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:41', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(528, 583, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:41', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(529, 584, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:41', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(530, 585, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:42', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(531, 586, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:42', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(532, 587, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:42', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(533, 588, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:42', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(534, 589, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:42', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(535, 590, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:43', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(536, 591, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:43', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(537, 592, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:43', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(538, 593, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:43', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(539, 594, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:43', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(540, 595, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:44', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(541, 596, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:44', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(542, 597, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:44', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(543, 598, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:44', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(544, 599, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:44', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(545, 600, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:44', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(546, 601, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:45', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(547, 602, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:45', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(548, 603, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:45', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(549, 604, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:45', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(550, 605, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:45', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(551, 606, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:45', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(552, 607, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:45', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(553, 608, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:46', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(554, 609, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:46', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(555, 610, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:46', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(556, 611, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:47', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(557, 612, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:47', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(558, 613, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:47', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(559, 614, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:47', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(560, 615, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:48', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(561, 616, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:48', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(562, 617, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:48', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(563, 618, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:48', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(564, 619, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:48', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(565, 620, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:48', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(566, 621, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:49', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(567, 622, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:49', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(568, 623, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:49', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(569, 624, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:49', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(570, 625, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:50', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(571, 626, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:50', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(572, 627, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:50', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(573, 628, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:50', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(574, 629, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:50', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(575, 630, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:51', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(576, 631, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:51', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(577, 632, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:51', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(578, 633, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:51', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(579, 634, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:51', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(580, 635, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:51', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(581, 636, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:52', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(582, 637, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:52', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(583, 638, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:52', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(584, 639, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:53', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(585, 640, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:53', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(586, 641, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:53', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(587, 642, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:53', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(588, 643, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:02:53', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(589, 644, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:12:56', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(590, 645, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:12:57', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(591, 646, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 10:12:57', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(592, 647, 2, 1, 1, NULL, NULL, NULL, NULL, 25, 0, 0, NULL, '2020-10-11 10:12:57', 2, NULL, NULL, 2, NULL, 0, 0, 1, 'abc abc abc', 0, NULL, NULL, NULL, '', '', NULL),
(593, 648, 2, 1, 1, NULL, NULL, NULL, NULL, 25, 0, 0, NULL, '2020-10-11 12:46:44', 2, NULL, NULL, 2, NULL, 1, 1, 1, 'gdfg fdgfd gfdgfd gdfgdfg dfgfdgfg', 0, NULL, NULL, NULL, '', 'dewerwe wer ewre', NULL),
(594, 649, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, '2020-10-11 13:11:30', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '', '', NULL),
(595, 664, 2, NULL, NULL, NULL, NULL, NULL, NULL, 25, 1, 0, NULL, '2020-12-09 05:58:39', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(596, 665, 2, NULL, NULL, NULL, NULL, NULL, NULL, 25, 1, 0, NULL, '2020-12-09 06:02:57', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(597, 666, 2, NULL, NULL, NULL, NULL, NULL, NULL, 25, 1, 0, NULL, '2020-12-09 06:06:24', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(598, 667, 2, NULL, NULL, NULL, NULL, NULL, NULL, 25, 1, 0, NULL, '2020-12-09 06:09:01', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(599, 668, 2, NULL, NULL, NULL, NULL, NULL, NULL, 25, 0, 0, NULL, '2020-12-09 06:12:09', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(600, 669, 2, NULL, NULL, NULL, NULL, NULL, NULL, 25, 1, 0, NULL, '2020-12-09 06:20:43', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(601, 670, 2, NULL, NULL, NULL, NULL, NULL, NULL, 25, 0, 0, NULL, '2020-12-09 06:22:51', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(602, 671, 2, NULL, NULL, NULL, NULL, NULL, NULL, 25, 1, 0, NULL, '2020-12-09 06:26:51', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(603, 672, 2, NULL, NULL, NULL, NULL, NULL, NULL, 25, 1, 0, NULL, '2020-12-09 06:33:17', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(604, 673, 2, NULL, NULL, NULL, NULL, NULL, NULL, 25, 0, 0, NULL, '2020-12-09 06:38:48', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(605, 674, 2, NULL, NULL, NULL, NULL, NULL, NULL, 25, 1, 0, NULL, '2020-12-09 06:42:08', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(606, 675, 2, NULL, NULL, NULL, NULL, NULL, NULL, 25, 1, 0, NULL, '2020-12-09 06:52:51', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(607, 676, 2, NULL, NULL, NULL, NULL, NULL, NULL, 25, 0, 0, NULL, '2020-12-09 07:04:21', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(608, 677, 2, NULL, NULL, NULL, NULL, NULL, NULL, 25, 0, 0, NULL, '2020-12-09 07:04:57', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(609, 678, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2020-12-09 07:29:54', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(610, 679, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2020-12-09 07:29:55', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(611, 680, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2020-12-09 07:29:56', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(612, 681, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2020-12-09 07:29:58', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(613, 682, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2020-12-09 07:29:59', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(614, 683, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2020-12-09 07:30:00', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(615, 684, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2020-12-09 07:30:02', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `bf_leads` (`id`, `prospect_id`, `agent`, `agent_disposition`, `agent_sub_disposition`, `agent_date_time`, `quality_disposition`, `quality_sub_disposition`, `quality_date_time`, `campaign_id`, `status`, `deleted`, `deleted_by`, `created_on`, `created_by`, `modified_on`, `modified_by`, `customer_id`, `client_alias_id`, `isConsent`, `dnc`, `isWebVerified`, `agent_notes`, `quality_dnc`, `quality_notes`, `quality_user_id`, `email`, `rejection_reason`, `notes`, `rejection_date`) VALUES
(616, 685, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2020-12-09 07:30:03', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(617, 686, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2020-12-09 07:30:04', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(618, 687, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2020-12-09 07:30:05', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(619, 688, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2020-12-09 07:30:07', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(620, 689, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2020-12-09 07:30:08', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(621, 690, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2020-12-09 07:30:09', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(622, 691, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2020-12-09 07:30:11', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(623, 692, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2020-12-09 07:30:12', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(624, 693, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2020-12-09 07:30:14', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(625, 694, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2020-12-09 07:30:15', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(626, 695, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2020-12-09 07:30:16', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(627, 696, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2020-12-09 07:30:17', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(628, 697, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2020-12-09 07:30:19', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(629, 698, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2020-12-09 07:30:20', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(630, 699, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2020-12-09 07:30:21', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(631, 700, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2020-12-09 07:30:23', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(632, 701, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2020-12-09 07:30:24', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(633, 702, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2020-12-09 07:30:25', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(634, 703, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2020-12-09 07:30:26', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(635, 704, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2020-12-09 07:30:28', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(636, 705, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2020-12-09 07:30:29', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(637, 706, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2020-12-09 07:30:30', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(638, 707, 2, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, '2020-12-09 07:39:08', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(639, 708, 2, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, '2020-12-09 07:39:09', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(640, 709, 2, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, '2020-12-09 07:39:10', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(641, 710, 2, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, '2020-12-09 07:39:12', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(642, 711, 2, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, '2020-12-09 07:39:13', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(643, 712, 2, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, '2020-12-09 07:39:14', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(644, 713, 2, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, '2020-12-09 07:39:15', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(645, 714, 2, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, '2020-12-09 07:39:17', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(646, 715, 2, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, '2020-12-09 07:39:18', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(647, 716, 2, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, '2020-12-09 07:39:19', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(648, 717, 2, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, '2020-12-09 07:39:20', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(649, 718, 2, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, '2020-12-09 07:39:21', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(650, 719, 2, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, '2020-12-09 07:39:23', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(651, 720, 2, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, '2020-12-09 07:39:24', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(652, 721, 2, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, '2020-12-09 07:39:25', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(653, 722, 2, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, '2020-12-09 07:39:26', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(654, 723, 2, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, '2020-12-09 07:39:28', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(655, 724, 2, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, '2020-12-09 07:39:29', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(656, 725, 2, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, '2020-12-09 07:39:30', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(657, 726, 2, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, '2020-12-09 07:39:31', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(658, 727, 2, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, '2020-12-09 07:39:33', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(659, 728, 2, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, '2020-12-09 07:39:34', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(660, 729, 2, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, '2020-12-09 07:39:35', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(661, 730, 2, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, '2020-12-09 07:39:36', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(662, 731, 2, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, '2020-12-09 07:39:37', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(663, 732, 2, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, '2020-12-09 07:39:39', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(664, 733, 2, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, '2020-12-09 07:39:40', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(665, 734, 2, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, '2020-12-09 07:39:41', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(666, 735, 2, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, '2020-12-09 07:39:42', 2, NULL, NULL, 2, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bf_login_attempts`
--

CREATE TABLE `bf_login_attempts` (
  `id` bigint(20) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bf_meetme`
--

CREATE TABLE `bf_meetme` (
  `bookid` int(11) NOT NULL,
  `confno` varchar(80) NOT NULL,
  `starttime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  `pin` varchar(20) DEFAULT NULL,
  `adminpin` varchar(20) DEFAULT NULL,
  `opts` varchar(20) DEFAULT NULL,
  `adminopts` varchar(20) DEFAULT NULL,
  `recordingfilename` varchar(80) DEFAULT NULL,
  `recordingformat` varchar(10) DEFAULT NULL,
  `maxusers` int(11) DEFAULT NULL,
  `members` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bf_meetme`
--

INSERT INTO `bf_meetme` (`bookid`, `confno`, `starttime`, `endtime`, `pin`, `adminpin`, `opts`, `adminopts`, `recordingfilename`, `recordingformat`, `maxusers`, `members`, `deleted`, `deleted_by`, `created_on`, `created_by`, `modified_on`, `modified_by`, `customer_id`) VALUES
(1, '2222', '2020-08-20 05:00:00', '2020-08-20 05:30:00', '2222', '2222', '2222', '2222', '2222', '2222', 2222, 2222, 0, NULL, '2020-09-17 01:12:46', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bf_menu`
--

CREATE TABLE `bf_menu` (
  `id` int(11) NOT NULL,
  `menu` varchar(30) NOT NULL,
  `icon` varchar(30) NOT NULL,
  `url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bf_menu`
--

INSERT INTO `bf_menu` (`id`, `menu`, `icon`, `url`) VALUES
(1, 'Campaign', 'ion-android-apps', '#'),
(2, 'Sales', 'lnr-briefcase', '#'),
(3, 'Sales', 'lnr-briefcase', '#'),
(4, 'Operation', 'lnr-briefcase', '#'),
(5, 'Quality', 'lnr-briefcase', '#'),
(6, 'Email', 'lnr-briefcase', '#'),
(7, 'DNC', 'lnr-briefcase', '#'),
(8, 'MIS', 'lnr-briefcase', '#');

-- --------------------------------------------------------

--
-- Table structure for table `bf_notification`
--

CREATE TABLE `bf_notification` (
  `id` int(11) NOT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `message` varchar(2500) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bf_notification`
--

INSERT INTO `bf_notification` (`id`, `subject`, `message`, `user_id`, `created_date`) VALUES
(1, 'Added Agent Disposition', '<p>ghhhhh  disposition added.</p>', 2, '2020-11-23 12:57:58'),
(2, 'Update Agent Disposition', '<p>ghhhhh  disposition updated.</p>', 2, '2020-11-23 13:10:29'),
(3, 'Update Agent Disposition', '<p>oneeeee  disposition updated.</p>', 2, '2020-11-23 13:16:47'),
(4, 'Added Agent Sub Disposition', '<p>  sub disposition added.</p>', 2, '2020-11-23 13:33:10'),
(6, 'Added Agent Disposition', '<p>werwerwerererer  disposition added.</p>', 2, '2020-11-24 05:12:33'),
(7, 'Added Agent Disposition', '<p>new  disposition added.</p>', 2, '2020-11-24 05:46:03'),
(8, 'Added Agent Disposition', '<p>todays test  disposition added.</p>', 2, '2020-11-24 05:49:29'),
(9, 'Added Agent Disposition', '<p>3333  disposition added.</p>', 2, '2020-11-24 05:53:29'),
(10, 'Added Agent Disposition', '<p>f  disposition added.</p>', 2, '2020-11-24 06:04:22'),
(11, 'Added Agent Disposition', '<p>sdfsdddddddddd  disposition added.</p>', 2, '2020-11-24 07:02:18'),
(12, 'Update Agent Disposition', '<p>asdsadsdasd  disposition updated.</p>', 2, '2020-11-24 07:14:36'),
(13, 'Added Agent Sub Disposition', '<p> sub disposition added.</p>', 2, '2020-11-24 07:14:58'),
(14, 'Added Agent Sub Disposition', '<p> sub disposition added.</p>', 2, '2020-11-24 07:15:23'),
(15, 'Added Agent Sub Disposition', '<p>last 23 sub disposition added.</p>', 2, '2020-11-24 07:17:23'),
(16, 'Update Agent Sub Disposition', '<p>last 23  sub disposition added.</p>', 2, '2020-11-24 07:18:14'),
(17, 'Added Quality Disposition', '<p>ttttt disposition added.</p>', 2, '2020-11-24 07:25:14'),
(18, 'Update Quality Disposition', '<p>ttttt disposition updated.</p>', 2, '2020-11-24 07:25:28'),
(19, 'Added Quality Sub Disposition', '<p>welcome sub disposition added.</p>', 2, '2020-11-24 07:25:51'),
(20, 'Added Quality Sub Disposition', '<p>welcome sub disposition added.</p>', 2, '2020-11-24 07:26:25'),
(21, 'Added Quality Sub Disposition', '<p>welcome sub disposition added.</p>', 2, '2020-11-24 07:40:29'),
(22, 'Added Quality Sub Disposition', '<p>welcome sub disposition added.</p>', 2, '2020-11-24 07:43:19'),
(23, 'Added Campaign Grade', '<p>new1111 campaign added and grade is new one5555.</p>', 2, '2020-11-24 07:57:23'),
(24, 'Update Campaign Grade', '<p>new1111 campaign updated and grade is new one5555.</p>', 2, '2020-11-24 08:03:39'),
(25, 'Added Campaign Type', '<p>sssssssss campaign type added.</p>', 2, '2020-11-24 08:54:46'),
(26, 'Update Campaign Type', '<p>sssssssss campaign type updated.</p>', 2, '2020-11-24 08:55:01'),
(27, 'Added Country Name', '<p>abc added successfully.</p>', 2, '2020-11-24 09:04:08'),
(28, 'Update Country Name', '<p>America country updated.</p>', 2, '2020-11-24 09:04:46'),
(29, 'Added State Name', '<p>a state added.</p>', 2, '2020-11-24 09:05:45'),
(30, 'Added State Name', '<p>b state added.</p>', 2, '2020-11-24 09:17:05'),
(31, 'Update User Details And Profile Acivation Status', '<p><b>User Name: </b>  hs <br><b>Email ID: </b>  hema.shinde@xpertlync.com <br><b>Password: </b>  8b6be57a8b27647beb8d1bc3dd2c2ac8 <br>Active Status: </b>  profle Deactivated. <br>Banned Status: </b>   <br></p>', 2, '2020-11-24 09:34:56'),
(32, 'Update User Details And Profile Acivation Status', '<p><b>User Name: </b>  hs <br><b>Email ID: </b>  hema.shinde@xpertlync.com <br><b>Password: </b>  8b6be57a8b27647beb8d1bc3dd2c2ac8 <br>Active Status: </b>  profle Deactivated. <br>Banned Status: </b>   <br></p>', 2, '2020-11-24 09:35:12'),
(33, 'Update User Details And Profile Acivation Status', '<p><b>User Name: </b>  hs <br><b>Email ID: </b>  hema.shinde@xpertlync.com <br><b>Password: </b>  b4215d02e6f2b3e4c1d67112484f1cea <br>Active Status: </b>  profle Deactivated. <br>Banned Status: </b>  Profile Banned <br></p>', 2, '2020-11-24 09:36:18'),
(34, 'Update User Extension', '<p><b>Name: </b>  hema <br><b>IP Address: </b>  abc <br><b>Password: </b>  1234 <br><b>Extension: </b>  jhjh <br>Port: </b>  hjh <br>Path: </b>  jhj <br></p>', 2, '2020-11-24 09:45:57'),
(35, 'Changed Account Password', '<p><b>New Account Password: </b> admin</p>', 2, '2020-11-24 09:57:59'),
(36, 'Changed Account Password', '<p><b>New Account Password: </b> admin</p>', 2, '2020-11-24 09:58:14'),
(37, 'Changed Account Password', '<p><b>New Account Password: </b> admin</p>', 2, '2020-11-24 10:07:36'),
(38, 'Update Profile Details', '<p><b>Display Name: </b> voip managerf <br><b>Language: </b> english <br><b>Designation: </b> vpf <br><b>Description: </b> The DESC comman  hhjg jhghgjgjffff <br></p>', 2, '2020-11-24 10:18:45'),
(39, 'Update Profile Details', '<p><b>Display Name: </b> voip managerf <br><b>Language: </b> english <br><b>Designation: </b> vpf <br><b>Description: </b> The DESC comman  hhjg jhghgjgjffff <br></p>', 2, '2020-11-24 10:18:58'),
(40, 'Update Profile Details', '<p><b>Display Name: </b> voip managerf <br><b>Language: </b> english <br><b>Designation: </b> vpf <br><b>Description: </b> The DESC comman  hhjg jhghgjgjffff <br></p>', 2, '2020-11-24 10:19:45'),
(41, 'Added New User', '<p><b>User Name: </b>  as <br><b>Email ID: </b>  s@gmail.com <br><b>Password: </b>  123 <br></p>', 2, '2020-11-24 11:36:06'),
(42, 'Update User Extension', '<p><b>Name: </b>  czxczx <br><b>IP Address: </b>  cxcxcxc <br><b>Password: </b>  cxcc <br><b>Extension: </b>  czxcz <br>Port: </b>  c <br>Path: </b>  cxcz <br></p>', 2, '2020-11-24 11:36:32'),
(43, 'Added New User', '<p><b>User Name: </b>  as <br><b>Email ID: </b>  info@gmail.com <br><b>Password: </b>  123 <br></p>', 2, '2020-11-24 11:41:33'),
(44, 'Update User Extension', '<p><b>Name: </b>  sas <br><b>IP Address: </b>  sas <br><b>Password: </b>  sas <br><b>Extension: </b>  sas <br>Port: </b>  sasas <br>Path: </b>  sas <br></p>', 2, '2020-11-24 11:41:54'),
(45, 'Campaign Created', '<p><b>Campaign Name: </b>  hjhjh <br><b>Start Date: </b>  2020-11-25 <br><b>End Date: </b>  2020-11-30 <br>\r\n               <b>Campaign Grade: </b>  6 <br><b>Client ID: </b>  39 <br><b>: </b> Total Leads 89 <br>\r\n               <b>Lead Cost: </b>  654120 <br><b>Lead Company: </b>  20 <br><b>Description: </b>  hjhhjj <br></p>', 2, '2020-11-24 17:55:06'),
(46, 'Campaign Created', '<p><b>Campaign Name: </b>  ss check78 <br><b>Start Date: </b>  2020-11-27 <br><b>End Date: </b>  2020-12-01 <br>\r\n               <b>Campaign Grade: </b>  19 <br><b>Client ID: </b>  14 <br><b>: </b> Total Leads 25 <br>\r\n               <b>Lead Cost: </b>  8950 <br><b>Lead Company: </b>  2 <br><b>Description: </b>  testing demo check <br></p>', 2, '2020-11-24 17:56:29'),
(47, 'Campaign Updated', '<p><b>Campaign Name: </b>  testing <br><b>Start Date: </b>  2020-11-25 <br><b>End Date: </b>  2020-11-29 <br>\r\n               <b>Campaign Grade: </b>  20 <br><b>Client ID: </b>  6 <br><b>: </b> Total Leads 10 <br>\r\n               <b>Lead Cost: </b>  8950 <br><b>Lead Company: </b>  20 <br><b>Description: </b>  testing demo check <br></p>', 2, '2020-11-24 19:08:31'),
(48, 'Campaign Created', '<p><b>Campaign Name: </b>  demofdsf <br><b>Start Date: </b>  2020-11-26 <br><b>End Date: </b>  2020-11-28 <br>\r\n               <b>Campaign Grade: </b>  10 <br><b>Client ID: </b>  8 <br><b>Total Leads : </b>  34 <br>\r\n               <b>Lead Cost: </b>  343434344 <br><b>Lead Company: </b>  43 <br><b>Description: </b>  dsfdf <br></p>', 2, '2020-11-25 05:12:57'),
(49, 'Upload Customer Rejection', '<p><b> Email ID :  </b> hema@gmail.com <br>  <b>Rejection Reason:   </b> ABC <br>  <b>Notes:  </b> test</p>', 2, '2020-11-26 06:39:54'),
(50, 'Upload Customer Rejection', '<p><b> Email ID :  </b> hema@gmail.com <br>  <b>Rejection Reason:   </b> ABC <br>  <b>Notes:  </b> kkkk</p>', 2, '2020-11-26 07:32:14'),
(51, 'Upload Customer Rejection', '<p><b> Email ID :  </b> hema@gmail.com <br>  <b>Rejection Reason:   </b> Query <br>  <b>Notes:  </b> sdsdsdsd</p>', 2, '2020-11-26 10:55:45'),
(52, 'Upload Customer Rejection', '<p><b> Email ID :  </b> hema@gmail.com <br>  <b>Rejection Reason:   </b> Query <br>  <b>Notes:  </b> sdsdsdsd</p>', 2, '2020-11-26 10:56:31'),
(53, 'Upload Customer Rejection', '<p><b> Email ID :  </b> hema@gmail.com <br>  <b>Rejection Reason:   </b> Query <br>  <b>Notes:  </b> aaa</p>', 2, '2020-11-26 10:59:11'),
(54, 'Added Customer Rejection', '<p>abc reason added.</p>', 2, '2020-11-26 11:35:12'),
(55, 'Added Customer Rejection', '<p>sdfdf reason added.</p>', 2, '2020-11-26 11:41:32'),
(56, 'Update Rejection Reason Details', '<p>sdfdf reason updated.</p>', 2, '2020-11-26 11:49:36'),
(57, 'Upload Customer Rejection', '<p><b> Email ID :  </b> hema@gmail.com <br>  <b>Rejection Reason:   </b> Query <br>  <b>Notes:  </b> sasas</p>', 2, '2020-11-26 12:09:31'),
(58, 'Update Module Settings', '<p><b> Module: </b> rer <br> <b> Name: </b> rewr <br> <b> Value: </b> rerwer</p>', 2, '2020-11-27 11:36:40'),
(59, 'Added Module Settings', '<p><b> Module: </b> adsad <br> <b> Name: </b> dsada <br> <b> Value: </b> dasdasdasd</p>', 2, '2020-11-27 11:45:19'),
(60, 'Added Module Settings', '<p><b> Module: </b> dsad <br> <b> Name: </b> dasda <br> <b> Value: </b> dasdasd</p>', 2, '2020-11-27 11:45:20'),
(61, 'Upload Customer Rejection', '<p><b> Email ID :  </b> hema@gmail.com <br>  <b>Rejection Reason:   </b> abc <br>  <b>Notes:  </b> dsadsdd</p>', 2, '2020-11-28 09:36:13'),
(62, 'Added New User', '<p><b>User Name: </b>  dsadsad <br><b>Email ID: </b>  s@gmail.com </p>', 2, '2020-11-28 10:28:06'),
(63, 'Added New User', '<p><b>User Name: </b>  abc <br><b>Email ID: </b>  info@arinoz.com </p>', 2, '2020-11-28 10:28:48'),
(64, 'Update User Extension', '<p><b>Name: </b>  sadsadasd <br><b>IP Address: </b>  sadsad <br><b>Password: </b>  sdsadsd <br><b>Extension: </b>  dsadsadsad <br>Port: </b>  asdsad <br>Path: </b>  dasdas <br></p>', 2, '2020-11-28 10:49:01'),
(65, 'Added User Extension', '<p><b>Name: </b>  hema <br><b>IP Address: </b>  abc <br><b>Password: </b>  1234 <br><b>Extension: </b>  jhjh <br><b>Port: </b>  hjh <br>Path: </b>  jhj <br></p>', 2, '2020-11-28 10:57:34'),
(66, 'Added Agent Disposition', '<p>sadasdasdasdasdasdasdasdasdasdasdasdasdasd  disposition added.</p>', 2, '2020-11-28 11:42:03'),
(67, 'Added Agent Disposition', '<p>hghghghghghghg  disposition added.</p>', 2, '2020-11-28 11:48:26'),
(68, 'Added Agent Sub Disposition', '<p>xszdsad sub disposition added.</p>', 2, '2020-11-28 11:50:47'),
(69, 'Added Quality Disposition', '<p>dasdasd disposition added.</p>', 2, '2020-11-28 12:21:58'),
(70, 'Added Agent Disposition', '<p>xxxxzzxzxzxzx  disposition added.</p>', 2, '2020-11-28 12:31:11'),
(71, 'Added Quality Disposition', '<p>jj disposition added.</p>', 2, '2020-11-28 12:36:41'),
(72, 'Update Quality Disposition', '<p>jj disposition updated.</p>', 2, '2020-11-28 12:41:27'),
(73, 'Update Agent Disposition', '<p>xxxxzzxzxzxzx  disposition updated.</p>', 2, '2020-11-28 12:46:24'),
(74, 'Update Agent Sub Disposition', '<p>xszdsad  sub disposition added.</p>', 2, '2020-11-28 12:49:00'),
(75, 'Added Quality Sub Disposition', '<p>demosss sub disposition added.</p>', 2, '2020-11-28 12:50:49'),
(76, 'Added Campaign Type', '<p>sas campaign type added.</p>', 2, '2020-11-28 12:56:33'),
(77, 'Added Campaign Grade', '<p>fsdfsdf campaign added and grade is dfsdf.</p>', 2, '2020-11-28 13:03:41'),
(78, 'Added Campaign Grade', '<p>sadsad campaign added and grade is dasdasdasd.</p>', 2, '2020-11-28 13:05:02'),
(79, 'Update Campaign Grade', '<p>sadsad campaign updated and grade is dasdasdasd.</p>', 2, '2020-11-28 13:07:44'),
(80, 'Update Campaign Grade', '<p>sadsad campaign updated and grade is dasdasdasd.</p>', 2, '2020-11-28 13:10:54'),
(81, 'Added Campaign Type', '<p>hhfhfghfghhfghf campaign type added.</p>', 2, '2020-11-30 06:00:38'),
(82, 'Added Campaign Type', '<p>jghjgh campaign type added.</p>', 2, '2020-11-30 06:51:32'),
(83, 'Update My Business Details', '<p><b>First Name: </b>h<br><b>Last Name: </b>shinde<br><b>Email ID: </b>h@gmail.com<br><b>Designation: </b>kj<br><b>Revenue: </b>8<br><b>Business Name: </b>demo<br><b>Contact Type: </b>Dr<br><b>Business Phone: </b>9874012154<br><b>Personal Phone: </b>9654120214<br><b>Address: </b>abc</p>', 2, '2020-11-30 10:06:46'),
(84, 'Added User Designation & Points', '<p> designation added and Points are 22.</p>', 2, '2020-12-01 07:27:28'),
(85, 'Added User Designation & Points', '<p>pqr designation added and Points are 25.</p>', 2, '2020-12-01 07:28:37'),
(86, 'Update Campaign Grade', '<p>abc designation updated and points are 24.</p>', 2, '2020-12-01 09:10:36'),
(87, 'Update Campaign Grade', '<p>abc designation updated and points are 24.</p>', 2, '2020-12-01 09:11:34'),
(88, 'Added Campaign Group', '<p>demos group added.</p>', 2, '2020-12-01 09:44:18'),
(89, 'Added Campaign Group', '<p>cs group added.</p>', 2, '2020-12-01 09:45:51'),
(90, 'Update Campaign Group', '<p>cs group updated </p>', 2, '2020-12-01 10:05:25'),
(91, 'Campaign Created', '<p><b>Campaign Name: </b>  hema demo <br><b>Start Date: </b>  2020-12-02 <br><b>End Date: </b>  2020-12-04 <br>\r\n               <b>Campaign Grade: </b>  6 <br><b>Client ID: </b>  46 <br><b>Total Leads : </b>  20 <br>\r\n               <b>Lead Cost: </b>  200 <br><b>Lead Company: </b>  2 <br><b>Description: </b>  abc <br></p>', 2, '2020-12-02 05:14:47'),
(92, 'Campaign Created', '<p><b>Campaign Name: </b>  fdggf <br><b>Start Date: </b>  2020-12-03 <br><b>End Date: </b>  2020-12-05 <br>\r\n               <b>Campaign Grade: </b>  6 <br><b>Client ID: </b>  6 <br><b>Total Leads : </b>  4 <br>\r\n               <b>Lead Cost: </b>  4 <br><b>Lead Company: </b>  4 <br><b>Description: </b>  vbfggggg <br></p>', 2, '2020-12-02 07:29:39'),
(93, 'Campaign Created', '<p><b>Campaign Name: </b>  gfdgfg <br><b>Start Date: </b>  2020-12-03 <br><b>End Date: </b>  2021-01-01 <br>\r\n               <b>Campaign Grade: </b>  11 <br><b>Client ID: </b>  46 <br><b>Total Leads : </b>  45 <br>\r\n               <b>Lead Cost: </b>  54 <br><b>Lead Company: </b>  5 <br><b>Description: </b>  fdgfgfg <br></p>', 2, '2020-12-02 07:56:04'),
(94, 'Campaign Created', '<p><b>Campaign Name: </b>  fgfdg <br><b>Start Date: </b>  2020-12-03 <br><b>End Date: </b>  2020-12-03 <br>\r\n               <b>Campaign Grade: </b>  6 <br><b>Client ID: </b>  46 <br><b>Total Leads : </b>  5 <br>\r\n               <b>Lead Cost: </b>  4 <br><b>Lead Company: </b>  4 <br><b>Description: </b>  444444 <br></p>', 2, '2020-12-02 09:41:54'),
(95, 'Added User Extension', '<p><b>Name: </b>  104 <br><b>IP Address: </b>  linkedinextract.in <br><b>Password: </b>  104 <br><b>Extension: </b>  104 <br><b>Port: </b>  8089 <br>Path: </b>  /ws <br></p>', 2, '2020-12-03 09:15:31'),
(96, 'Update User Extension', '<p><b>Name: </b>  gfgfgf <br><b>IP Address: </b>  demo <br><b>Password: </b>  1234 <br><b>Extension: </b>  tytyty <br>Port: </b>  yuyy <br>Path: </b>  uuu <br></p>', 2, '2020-12-03 09:21:56'),
(97, 'Added Campaign Type', '<p>sadsdsdsdsdd campaign type added.</p>', 2, '2020-12-09 07:18:25'),
(98, 'Added Campaign Grade', '<p>today campaign added and grade is todays.</p>', 2, '2020-12-09 07:22:24'),
(99, 'Added Agent Disposition', '<p>sa1234  disposition added.</p>', 2, '2020-12-09 07:25:46'),
(100, 'Added Quality Disposition', '<p>qstoday disposition added.</p>', 2, '2020-12-09 07:29:44'),
(101, 'Update Quality Disposition', '<p>qstoday disposition updated.</p>', 2, '2020-12-09 07:30:03'),
(102, 'Added Quality Sub Disposition', '<p>welcome sub disposition added.</p>', 2, '2020-12-09 07:30:27'),
(103, 'Added Country Name', '<p>ddddddd added successfully.</p>', 2, '2020-12-09 07:33:24'),
(104, 'Update Country Name', '<p>ddddddd country updated.</p>', 2, '2020-12-09 07:35:29'),
(105, 'Added Customer Rejection', '<p>d reason added.</p>', 2, '2020-12-09 07:39:13'),
(106, 'Update Rejection Reason Details', '<p>d reason updated.</p>', 2, '2020-12-09 07:39:29'),
(107, 'Added User Designation & Points', '<p>gdfg designation added and Points are gfdgfdg.</p>', 2, '2020-12-09 07:42:37'),
(108, 'Update User Designation and Points', '<p>gdfg designation updated and points are gfdgfdg.</p>', 2, '2020-12-09 07:43:44'),
(109, 'Added Campaign Group', '<p>tttttttttt group added.</p>', 2, '2020-12-09 07:46:15'),
(110, 'Update Campaign Group', '<p>tttttttttt group updated </p>', 2, '2020-12-09 07:46:34'),
(111, 'Added New User', '<p><b>User Name: </b>  sad <br><b>Email ID: </b>  h@gmail.com </p>', 2, '2020-12-09 07:53:42'),
(112, 'Update User Details And Profile Acivation Status', '<p><b>User Name: </b>  sad <br><b>Email ID: </b>  h@gmail.com <br><b>Active Status: </b>  profle activated. <br><b>Banned Status: </b>  Profile Banned <br></p>', 2, '2020-12-09 07:55:31');

-- --------------------------------------------------------

--
-- Table structure for table `bf_payments`
--

CREATE TABLE `bf_payments` (
  `payment_id` int(11) NOT NULL,
  `subscription_id` int(11) DEFAULT NULL,
  `Amount` decimal(10,2) DEFAULT NULL,
  `DatePaid` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bf_permissions`
--

CREATE TABLE `bf_permissions` (
  `permission_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(100) NOT NULL,
  `status` enum('active','inactive','deleted') NOT NULL DEFAULT 'active',
  `customer_id` int(11) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `icon` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bf_permissions`
--

INSERT INTO `bf_permissions` (`permission_id`, `name`, `description`, `status`, `customer_id`, `deleted`, `deleted_by`, `created_on`, `created_by`, `modified_on`, `modified_by`, `icon`) VALUES
(1, 'users.permission.view', '', 'active', NULL, 0, NULL, '2020-09-17 01:12:47', NULL, NULL, NULL, NULL),
(2, 'users.permission.create', '', 'active', NULL, 0, NULL, '2020-09-17 01:12:47', NULL, NULL, NULL, NULL),
(3, 'users.roles.create', '', 'active', NULL, 0, NULL, '2020-09-17 01:12:47', NULL, NULL, NULL, NULL),
(4, 'users.roles.view', '', 'active', NULL, 0, NULL, '2020-09-17 01:12:47', NULL, NULL, NULL, NULL),
(5, 'users.roles.edit', '', 'active', NULL, 0, NULL, '2020-09-17 01:12:47', NULL, NULL, NULL, NULL),
(6, 'users.roles.delete', '', 'active', NULL, 0, NULL, '2020-09-17 01:12:47', NULL, NULL, NULL, NULL),
(7, 'users.list.view', '', 'active', NULL, 0, NULL, '2020-09-17 01:12:47', NULL, NULL, NULL, NULL),
(8, 'users.list.create', '', 'active', NULL, 0, NULL, '2020-09-17 01:12:47', NULL, NULL, NULL, NULL),
(9, 'users.list.edit', '', 'active', NULL, 0, NULL, '2020-09-17 01:12:47', NULL, NULL, NULL, NULL),
(10, 'users.list.delete', '', 'active', NULL, 0, NULL, '2020-09-17 01:12:47', NULL, NULL, NULL, NULL),
(11, 'users.permission.edit', '', 'active', NULL, 0, NULL, '2020-09-17 01:12:47', NULL, NULL, NULL, NULL),
(12, 'users.permission.delete', '', 'active', NULL, 0, NULL, '2020-09-17 01:12:47', NULL, NULL, NULL, NULL),
(13, 'sales.list.view', '', 'active', NULL, 0, NULL, '2020-09-17 01:12:47', NULL, NULL, NULL, NULL),
(14, 'campaign.grade.view', '', 'active', NULL, 0, NULL, '2020-09-17 01:12:47', NULL, NULL, NULL, NULL),
(15, 'campaign.grade.create', '', 'active', NULL, 0, NULL, '2020-09-17 01:12:47', NULL, NULL, NULL, NULL),
(16, 'campaign.type.view', '', 'active', NULL, 0, NULL, '2020-09-17 01:12:47', NULL, NULL, NULL, NULL),
(17, 'campaign.manager.view', '', 'active', NULL, 0, NULL, '2020-09-17 01:12:47', NULL, NULL, NULL, NULL),
(18, 'campaign.manager.create', '', 'active', NULL, 0, NULL, '2020-09-17 01:12:47', NULL, NULL, NULL, NULL),
(19, 'campaign.manager.edit', '', 'active', NULL, 0, NULL, '2020-09-17 01:12:47', NULL, NULL, NULL, NULL),
(20, 'campaign.manager.delete', '', 'active', NULL, 0, NULL, '2020-09-17 01:12:47', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bf_products`
--

CREATE TABLE `bf_products` (
  `product_id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `description` varchar(254) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bf_prospects`
--

CREATE TABLE `bf_prospects` (
  `id` int(11) NOT NULL,
  `salutation_id` int(11) DEFAULT NULL,
  `first_name` varchar(64) DEFAULT NULL,
  `middle_name` varchar(64) DEFAULT NULL,
  `last_name` varchar(64) DEFAULT NULL,
  `job_level_id` int(11) DEFAULT NULL,
  `job_functions_id` int(11) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `email_id` varchar(64) DEFAULT NULL,
  `direct_number` varchar(16) DEFAULT NULL,
  `mobile_number` varchar(16) DEFAULT NULL,
  `office_number` varchar(16) DEFAULT NULL,
  `country` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `address_1` varchar(128) DEFAULT NULL,
  `address_2` varchar(128) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `dnc` int(11) DEFAULT NULL,
  `src` varchar(250) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `domain_id` int(11) DEFAULT NULL,
  `zip` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bf_prospects`
--

INSERT INTO `bf_prospects` (`id`, `salutation_id`, `first_name`, `middle_name`, `last_name`, `job_level_id`, `job_functions_id`, `title`, `email_id`, `direct_number`, `mobile_number`, `office_number`, `country`, `state`, `city`, `address_1`, `address_2`, `company_id`, `dnc`, `src`, `customer_id`, `deleted`, `deleted_by`, `created_on`, `created_by`, `modified_on`, `modified_by`, `domain_id`, `zip`) VALUES
(1, 1, 'kkk', 'k', 'k', 2, 1, 'adsada', 'hema@gmail.com', '22', '2222', '2222', 1, 1, 'lucknow', 'kkkkkk', 'kkkkkkkk', 20, NULL, 'kkkkkkkkkkkkkkk', 2, 0, NULL, '2020-10-08 02:36:07', NULL, NULL, NULL, 0, '2026021'),
(2, 1, 'kkk', 'k', 'k', 2, 1, 'adsada', 'k@sd.com', '22', '2222', '2222', 1, 1, 'lucknow', 'kkkkkk', 'kkkkkkkk', 21, NULL, 'kkkkkkkkkkkkkkk', NULL, 0, NULL, '2020-10-08 02:38:24', NULL, NULL, NULL, 6, '2026021'),
(3, 1, 'keshav', '', 'sss', 2, 1, 'dadas', 'asdasd@com.com', '', '88888888', '', 1, 1, 'lucknow', 'lucnow', 'lucknow', 22, NULL, 'sA', NULL, 0, NULL, '2020-10-08 02:55:20', NULL, NULL, NULL, 7, '2026021'),
(4, 1, 'keshav', '', 'sss', 2, 1, 'dadas', 'asdasd@com.com', '', '88888888', '', 1, 1, 'lucknow', 'lucnow', 'lucknow', 23, NULL, 'sA', NULL, 0, NULL, '2020-10-08 02:55:46', NULL, NULL, NULL, 8, '2026021'),
(5, 1, 'keshav', '', 'sss', 2, 1, 'dadas', 'asdasd@com.com', '', '88888888', '', 1, 1, 'lucknow', 'lucnow', 'lucknow', 24, NULL, 'sA', 2, 0, NULL, '2020-10-08 02:59:21', NULL, NULL, NULL, 9, '2026021'),
(6, 1, 'keshav', '', 'sss', 2, 1, 'dadas', 'asdasd@com.com', '', '88888888', '', 1, 1, 'lucknow', 'lucnow', 'lucknow', 25, NULL, 'sA', 2, 0, NULL, '2020-10-08 03:01:25', NULL, NULL, NULL, 10, '2026021'),
(7, 1, 'keshav', '', 'kant', 2, 1, 'dadas', 'asdasd@com.com', '77', '77', '77', 1, 1, 'kk', 'lucnow, lucknow', 'lucknow', 26, NULL, '777', 2, 0, NULL, '2020-10-08 17:53:11', NULL, NULL, NULL, 11, '0'),
(8, 1, 'keshav', 'k', 'k', 2, 1, 'k', 'asdkldsa.com', '5', '5', '5', 1, 1, 'lucknow', '5', '5', 27, NULL, '5', 2, 0, NULL, '2020-10-08 18:33:32', NULL, NULL, NULL, 12, '999'),
(9, 1, 'keshav', 'k', 'k', 2, 1, 'k', 'asdkldsa.com', '5', '5', '5', 1, 1, 'lucknow', '5', '5', 28, NULL, '5', 2, 0, NULL, '2020-10-08 18:33:38', NULL, NULL, NULL, 13, '999'),
(10, 1, 'keshav', 'k', 'k', 2, 1, 'k', 'asdkldsa.com', '5', '5', '5', 1, 1, 'lucknow', '5', '5', 29, NULL, '5', 2, 0, NULL, '2020-10-08 18:33:52', NULL, NULL, NULL, 14, '999'),
(11, 1, 'keshav', 'k', 'k', 2, 1, 'k', 'asdkldsa.com', '5', '5', '5', 1, 1, 'lucknow', '5', '5', 30, NULL, '5', 2, 0, NULL, '2020-10-08 18:35:22', NULL, NULL, NULL, 15, '999'),
(12, 1, 'keshav', 'k', 'k', 2, 1, 'k', 'asdkldsa.com', '5', '5', '5', 1, 1, 'lucknow', '5', '5', 31, NULL, '5', 2, 0, NULL, '2020-10-08 18:37:13', NULL, NULL, NULL, 16, '999'),
(13, 1, 'keshav', 'k', 'k', 2, 1, 'k', 'asdkldsa.com', '5', '5', '5', 1, 1, 'lucknow', '5', '5', 32, NULL, '5', 2, 0, NULL, '2020-10-08 18:38:07', NULL, NULL, NULL, 17, '999'),
(14, 1, 'keshav', 'k', 'k', 2, 1, 'k', 'asdkldsa.com', '5', '5', '5', 1, 1, 'lucknow', '5', '5', 33, NULL, '5', 2, 0, NULL, '2020-10-08 18:40:56', NULL, NULL, NULL, 18, '9995'),
(15, 1, 'keshav', 'k', 'k', 2, 1, 'k', 'asdkldsa.com', '5', '5', '5', 1, 1, 'lucknow', '5', '5', 33, NULL, '5', NULL, 0, NULL, '2020-10-08 18:59:21', NULL, NULL, NULL, 19, '9995'),
(16, 1, 'keshav', 'k', 'k', 2, 1, 'k', 'asdkldsa.com', '5', '5', '5', 1, 1, 'lucknow', '5', '5', 33, NULL, '5', NULL, 0, NULL, '2020-10-08 18:59:45', NULL, NULL, NULL, 18, '9995'),
(17, 1, 'keshav', 'k', 'k', 2, 1, 'k', 'asdkldsa.com', '5', '5', '5', 1, 1, 'lucknow', '5', '5', 34, NULL, '5', 2, 0, NULL, '2020-10-08 18:59:53', NULL, NULL, NULL, 20, '99950'),
(18, 1, 'keshav', 'k', 'k', 2, 1, 'k', 'asdkldsa.com', '5', '5', '5', 1, 1, 'lucknow', '5', '5', 34, NULL, '5', NULL, 0, NULL, '2020-10-08 18:59:58', NULL, NULL, NULL, 20, '99950'),
(19, 1, 'keshav', 'k', 'k', 2, 1, 'k', 'asdkldsa.com', '5', '5', '5', 1, 1, 'lucknow', '5', '5', 34, NULL, '5', NULL, 0, NULL, '2020-10-08 19:00:44', NULL, NULL, NULL, 20, '99950'),
(20, 1, '', '', '', 0, 0, '', '', '', '', '', 0, 1, '', '', '', 9, NULL, '', NULL, 0, NULL, '2020-10-08 20:35:05', NULL, NULL, NULL, 21, '0'),
(21, 1, 'u', 'u', 'u', 2, 1, 'u', 'u', '9', '9', '9', 1, 1, '7', '9', '9', 35, NULL, '9', 2, 0, NULL, '2020-10-08 21:50:35', NULL, NULL, NULL, 22, '7'),
(22, 1, 'u', 'u', 'u', 2, 1, 'u', 'u', '9', '9', '9', 1, 1, '7', '9', '9', 35, NULL, '9', NULL, 0, NULL, '2020-10-08 21:51:01', NULL, NULL, NULL, 22, '7'),
(23, 1, 'u', 'u', 'u', 2, 1, 'u', 'u', '9', '9', '9', 1, 1, '7', '9', '9', 35, NULL, '9', NULL, 0, NULL, '2020-10-08 21:53:05', NULL, NULL, NULL, 22, '7'),
(24, 1, '9', '9', '9', 2, 1, '9', 'k@k.com1', '9', '9', '9', 1, 1, '9', '9', '9', 36, NULL, '9', 2, 0, NULL, '2020-10-09 01:23:14', NULL, NULL, NULL, 23, '9'),
(25, 1, '9', '9', '9', 2, 1, '9', 'k@k.com1', '9', '9', '9', 1, 1, '9', '9', '9', 36, NULL, '9', NULL, 0, NULL, '2020-10-09 01:23:43', NULL, NULL, NULL, 23, '9'),
(26, 1, '9', '9', '9', 2, 1, '9', 'k@k.com1', '9', '9', '9', 1, 1, '9', '9', '9', 36, NULL, '9', NULL, 0, NULL, '2020-10-09 01:23:46', NULL, NULL, NULL, 23, '9'),
(27, 1, '9', '9', '9', 2, 1, '9', 'k@k.com1', '9', '9', '9', 1, 1, '9', '9', '9', 36, NULL, '9', NULL, 0, NULL, '2020-10-09 01:28:01', NULL, NULL, NULL, 23, '9'),
(28, 1, '9', '9', '9', 2, 1, '9', 'k@k.com1', '9', '9', '9', 1, 1, '9', '9', '9', 36, NULL, '9', NULL, 0, NULL, '2020-10-09 01:30:01', NULL, NULL, NULL, 23, '9'),
(29, 1, '9', '9', '9', 2, 1, '9', 'k@k.com1', '9', '9', '9', 1, 1, '9', '9', '9', 36, NULL, '9', NULL, 0, NULL, '2020-10-09 01:30:02', NULL, NULL, NULL, 23, '9'),
(30, 1, 'j', 'j', 'j', 2, 1, 'jjj', 'kk@kk.com', '0', '0', '0', 1, 1, 'l', '0', '0', 37, NULL, '0', 2, 0, NULL, '2020-10-09 02:10:40', NULL, NULL, NULL, 24, '0'),
(31, 1, 'k', 'k', 'k', 2, 1, 'domain.com', 'email1@domain.com', 'l', '0', '0', 1, 1, '2', 'domain.com', 'domain.com', 38, NULL, 'domain.com', 2, 0, NULL, '2020-10-09 12:21:27', NULL, NULL, NULL, 25, '2'),
(32, 1, 'k', 'k', 'k', 2, 1, 'domain.com', 'email1@domain.com', 'l', '0', '0', 1, 1, '2', 'domain.com', 'domain.com', 38, NULL, 'domain.com', NULL, 0, NULL, '2020-10-09 12:21:47', NULL, NULL, NULL, 25, '2'),
(33, 1, 'kk', 'k', 'k', 2, 1, 'k', 'k', '9', '9', '9', 1, 1, 'lucknow', 'j', 'j', 39, NULL, 'jj', 2, 0, NULL, '2020-10-09 12:29:26', NULL, NULL, NULL, 26, '2026021'),
(34, 1, '555', '555', '555', 2, 1, '55', '555', '55', '55', '55', 1, 1, 'lucknow', '555', '555', 40, NULL, '5555', 2, 0, NULL, '2020-10-09 15:50:33', NULL, NULL, NULL, 27, '2026021'),
(35, 1, 'keshav', '', 'kant', 2, 1, '5', 'asdasd@com.com', '', '', '-1', 1, 1, 'lucknow', 'lucnow, lucknow', 'lucknow', 22, NULL, '0', NULL, 0, NULL, '2020-10-09 15:54:30', NULL, NULL, NULL, 28, '2026021'),
(36, 1, 'keshav', '', 'kant', 2, 1, '5', 'asdasd@com.com', '', '', '-1', 1, 1, 'lucknow', 'lucnow, lucknow', 'lucknow', 22, NULL, '0', NULL, 0, NULL, '2020-10-09 15:54:48', NULL, NULL, NULL, 28, '2026021'),
(37, 1, 'keshav', '', 'kant', 2, 1, '5', 'asdasd@com.com', '', '', '-1', 1, 1, 'lucknow', 'lucnow, lucknow', 'lucknow', 22, NULL, '0', NULL, 0, NULL, '2020-10-09 15:55:30', NULL, NULL, NULL, 28, '2026021'),
(38, 1, 'keshav', '', 'kant', 2, 1, '5', 'asdasd@com.com', '', '', '-1', 1, 1, 'lucknow', 'lucnow, lucknow', 'lucknow', 22, NULL, '0', NULL, 0, NULL, '2020-10-09 15:56:11', NULL, NULL, NULL, 28, '2026021'),
(39, 1, 'l', 'l', 'l', 2, 1, 'l', 'l', '0', '0', '0', 1, 1, 'lucknow', 'o', 'o', 41, NULL, 'o', 2, 0, NULL, '2020-10-09 15:57:05', NULL, NULL, NULL, 29, '2026021'),
(40, 1, 'l', 'l', 'l', 2, 1, 'l', 'l', '0', '0', '0', 1, 1, 'lucknow', 'o', 'o', 41, NULL, 'o', NULL, 0, NULL, '2020-10-09 15:58:05', NULL, NULL, NULL, 29, '2026021'),
(41, 1, 'l', 'l', 'l', 2, 1, 'l', 'l', '0', '0', '0', 1, 1, 'lucknow', 'o', 'o', 41, NULL, 'o', NULL, 0, NULL, '2020-10-09 15:59:10', NULL, NULL, NULL, 29, '2026021'),
(42, 1, 'l', 'l', 'l', 2, 1, 'l', 'l', '0', '0', '0', 1, 1, 'lucknow', 'o', 'o', 41, NULL, 'o', NULL, 0, NULL, '2020-10-09 16:02:33', NULL, NULL, NULL, 29, '2026021'),
(43, 1, 'l', 'l', 'l', 2, 1, 'l', 'l', '0', '0', '0', 1, 1, 'lucknow', 'o', 'o', 41, NULL, 'o', NULL, 0, NULL, '2020-10-09 16:03:35', NULL, NULL, NULL, 29, '2026021'),
(44, 1, 'l', 'l', 'l', 2, 1, 'l', 'l', '0', '0', '0', 1, 1, 'lucknow', 'o', 'o', 41, NULL, 'o', NULL, 0, NULL, '2020-10-09 16:05:12', NULL, NULL, NULL, 29, '2026021'),
(45, 1, 'l', 'l', 'l', 2, 1, 'l', 'l', '0', '0', '0', 1, 1, 'lucknow', 'o', 'o', 41, NULL, 'o', NULL, 0, NULL, '2020-10-09 16:07:06', NULL, NULL, NULL, 29, '2026021'),
(46, 1, 'l', 'l', 'l', 2, 1, 'l', 'l', '0', '0', '0', 1, 1, 'lucknow', 'o', 'o', 41, NULL, 'o', NULL, 0, NULL, '2020-10-09 16:08:41', NULL, NULL, NULL, 29, '2026021'),
(47, 1, 'l', 'l', 'l', 2, 1, 'l', 'l', '0', '0', '0', 1, 1, 'lucknow', 'o', 'o', 41, NULL, 'o', NULL, 0, NULL, '2020-10-09 16:13:06', NULL, NULL, NULL, 29, '2026021'),
(48, 1, 'l', 'l', 'l', 2, 1, 'l', 'l', '0', '0', '0', 1, 1, 'lucknow', 'o', 'o', 41, NULL, 'o', NULL, 0, NULL, '2020-10-09 16:18:09', NULL, NULL, NULL, 29, '2026021'),
(49, 1, 'l', 'l', 'l', 2, 1, 'l', 'l', '0', '0', '0', 1, 1, 'lucknow', 'o', 'o', 41, NULL, 'o', NULL, 0, NULL, '2020-10-09 16:20:32', NULL, NULL, NULL, 29, '2026021'),
(50, 1, 'l', 'l', 'l', 2, 1, 'l', 'l', '0', '0', '0', 1, 1, 'lucknow', 'o', 'o', 41, NULL, 'o', NULL, 0, NULL, '2020-10-09 16:23:51', NULL, NULL, NULL, 29, '2026021'),
(51, 1, 'l', 'l', 'l', 2, 1, 'l', 'l', '0', '0', '0', 1, 1, 'lucknow', 'o', 'o', 41, NULL, 'o', NULL, 0, NULL, '2020-10-09 16:24:14', NULL, NULL, NULL, 29, '2026021'),
(52, 1, 'l', 'l', 'l', 2, 1, 'l', 'l', '0', '0', '0', 1, 1, 'lucknow', 'o', 'o', 41, NULL, 'o', NULL, 0, NULL, '2020-10-09 16:24:40', NULL, NULL, NULL, 29, '2026021'),
(53, 1, 'l', 'l', 'l', 2, 1, 'l', 'l', '0', '0', '0', 1, 1, 'lucknow', 'o', 'o', 41, NULL, 'o', NULL, 0, NULL, '2020-10-09 16:25:09', NULL, NULL, NULL, 29, '2026021'),
(54, 1, 'l', 'l', 'l', 2, 1, 'l', 'l', '0', '0', '0', 1, 1, 'lucknow', 'o', 'o', 41, NULL, 'o', NULL, 0, NULL, '2020-10-09 16:25:34', NULL, NULL, NULL, 29, '2026021'),
(55, 1, 'l', 'l', 'l', 2, 1, 'l', 'l', '0', '0', '0', 1, 1, 'lucknow', 'o', 'o', 41, NULL, 'o', NULL, 0, NULL, '2020-10-09 16:26:02', NULL, NULL, NULL, 29, '2026021'),
(56, 1, 'l', 'l', 'l', 2, 1, 'l', 'l', '0', '0', '0', 1, 1, 'lucknow', 'o', 'o', 41, NULL, 'o', NULL, 0, NULL, '2020-10-09 16:26:34', NULL, NULL, NULL, 29, '2026021'),
(57, 1, 'l', 'l', 'l', 2, 1, 'l', 'l', '0', '0', '0', 1, 1, 'lucknow', 'o', 'o', 41, NULL, 'o', NULL, 0, NULL, '2020-10-09 16:27:01', NULL, NULL, NULL, 29, '2026021'),
(58, 1, 'l', 'l', 'l', 2, 1, 'l', 'l', '0', '0', '0', 1, 1, 'lucknow', 'o', 'o', 41, NULL, 'o', NULL, 0, NULL, '2020-10-09 16:27:17', NULL, NULL, NULL, 29, '2026021'),
(59, 1, 'l', 'l', 'l', 2, 1, 'l', 'l', '0', '0', '0', 1, 1, 'lucknow', 'o', 'o', 41, NULL, 'o', NULL, 0, NULL, '2020-10-09 16:27:39', NULL, NULL, NULL, 29, '2026021'),
(60, 1, 'k', 'k', 'k', 2, 1, 'k', 'k', '0', '0', '0', 1, 1, '00', '0', '0', 37, NULL, '0', NULL, 0, NULL, '2020-10-09 16:54:53', NULL, NULL, NULL, 30, '00'),
(61, 1, 'y', 'y', 'y', 2, 1, 'y', 'y', '7', '7', '7', 1, 1, '7', '7', '7', 42, NULL, '7', 2, 0, NULL, '2020-10-10 03:13:59', NULL, NULL, NULL, 31, '7'),
(62, 1, 'Agent Name', 'Campaign Name', 'First Name', 0, 0, 'Email Id', 'Last Name', NULL, 'Phone Number', NULL, 0, 1, 'ZIP', 'Address', 'City', 43, NULL, 'Company Link', 2, 0, NULL, '2020-10-11 13:30:58', NULL, NULL, NULL, 32, 'Country'),
(63, 1, 'Faizan Shaikh', '400401-19', 'José ', 0, 0, 'jose.ramon@telxius.com', 'Ramón', NULL, '(3491) 483-0612', NULL, 0, 1, '28050', 'Ronda de la Comunicación s/n, Distrito Telefónica, Edificio Norte 2', 'Planta ', 44, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:30:58', NULL, NULL, NULL, 33, 'Spain'),
(64, 1, 'Musaddique Shaikh', '400401-30', 'Eric ', 0, 0, 'eric.varache@abilways.com', 'VARACHE', NULL, '(3314) 221-0202', NULL, 0, 1, '75002', 'rue du Louvre ', 'Paris', 45, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:30:58', NULL, NULL, NULL, 34, 'France'),
(65, 1, 'Amit Nimbalkar', '400401-16', 'Badder ', 0, 0, 'badder.khlifa@solvinity.com', 'Khlifa', NULL, '(3120) 364-3600', NULL, 0, 1, '3821 BT', 'Displayweg 16-18', 'Amersfoort', 46, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:30:58', NULL, NULL, NULL, 35, 'Netherlands'),
(66, 1, 'Faizan Shaikh', '400401-27', 'Helen ', 0, 0, 'helen.scrase@blacklane.com', 'Scrase', NULL, '(493020) 236-318', NULL, 0, 1, '10827', 'Feurigstrasse 59', 'Berlin ', 47, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:30:58', NULL, NULL, NULL, 36, 'Germany'),
(67, 1, 'Kaif Khan', '400401-32', 'Brian ', 0, 0, 'brian.rhodin@royalwolf.com.au', 'Doyle', NULL, '(6129) 482-3466', NULL, 0, 1, '2072', '1 Merriwa St', 'Gordon ', 48, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:30:59', NULL, NULL, NULL, 37, 'Australia'),
(68, 1, 'Kaif Khan', '400401-32', 'Charles ', 0, 0, 'charles.cordina@royalwolf.com.au', 'Cordina', NULL, '(6129) 482-3466', NULL, 0, 1, '2072', '1 Merriwa St', 'Gordon ', 49, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:30:59', NULL, NULL, NULL, 38, 'Australia'),
(69, 1, 'Kaif Khan', '400401-32', 'Eleisha ', 0, 0, 'eleisha.birkensleigh@alliedexpress.com.au', 'Birkensleigh', NULL, '(6) 113-1373', NULL, 0, 1, '2190', '62 Hume Hwy. Bldg. 1, Unit 2', 'Chullora', 48, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:30:59', NULL, NULL, NULL, 39, 'Australia'),
(70, 1, 'Faizan Shaikh', '400401-27', 'Alice ', 0, 0, 'alice.laing@blacklane.com', 'Laing', NULL, '(493020) 236-318', NULL, 0, 1, '10827', 'Feurigstrasse 59', 'Berlin ', 47, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:30:59', NULL, NULL, NULL, 36, 'Germany'),
(71, 1, 'Faizan Shaikh', '400401-27', 'Dorothea ', 0, 0, 'dorothea.konstantinidis@blacklane.com', 'Konstantinidis', NULL, '(493020) 236-318', NULL, 0, 1, '10827', 'Feurigstrasse 59', 'Berlin ', 47, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:30:59', NULL, NULL, NULL, 36, 'Germany'),
(72, 1, 'Kaif Khan', '400401-32', 'Nick ', 0, 0, 'nick.cittadino@alliedexpress.com.au', 'Cittadino', NULL, '(6) 113-1373', NULL, 0, 1, '2190', '62 Hume Hwy. Bldg. 1, Unit 2', 'Chullora', 48, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:30:59', NULL, NULL, NULL, 39, 'Australia'),
(73, 1, 'Faizan Shaikh', '400401-19', 'Víctor ', 0, 0, 'victor.cano@telxius.com', 'Cano ', NULL, '(3491) 483-0612', NULL, 0, 1, '28050', 'Ronda de la Comunicación s/n, Distrito Telefónica, Edificio Norte 2', 'Planta ', 50, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:30:59', NULL, NULL, NULL, 40, 'Spain'),
(74, 1, 'Faizan Shaikh', '400401-27', 'Adam ', 0, 0, 'adam.homfray@blacklane.com', 'Homfray', NULL, '(493020) 236-318', NULL, 0, 1, '10827', 'Feurigstrasse 59', 'Berlin ', 47, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:00', NULL, NULL, NULL, 36, 'Germany'),
(75, 1, 'Kaif Khan', '400401-32', 'Christopher ', 0, 0, 'christopher.horn@alliedexpress.com.au', 'Horn', NULL, '(6) 113-1373', NULL, 0, 1, '2190', '62 Hume Hwy. Bldg. 1, Unit 2', 'Chullora', 49, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:00', NULL, NULL, NULL, 41, 'Australia'),
(76, 1, 'Kaif Khan', '400401-32', 'Lis ', 0, 0, 'lis.walters@alliedexpress.com.au', 'Walters', NULL, '(6) 113-1373', NULL, 0, 1, '2190', '62 Hume Hwy. Bldg. 1, Unit 2', 'Chullora', 51, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:00', NULL, NULL, NULL, 42, 'Australia'),
(77, 1, 'Sakib Patni', '400401-29', 'Thuy-Vy ', 0, 0, 'thuy-vy.mai@payfit.com', 'Mai', NULL, '(3317) 634-0167', NULL, 0, 1, '75017', '75 Rue de Tocqueville', 'Paris', 52, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:00', NULL, NULL, NULL, 43, 'France'),
(78, 1, 'Kaif Khan', '400401-32', 'Norma ', 0, 0, 'nburgess@alliedexpress.com.au', 'Burgess', NULL, '(6) 113-1373', NULL, 0, 1, '2190', '62 Hume Hwy. Bldg. 1, Unit 2', 'Chullora', 48, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:00', NULL, NULL, NULL, 44, 'Australia'),
(79, 1, 'Wasiya Shaikh', '400401-21', 'Mercedes', 0, 0, 'mdemiguel@gesvalt.es', 'de Miguel', NULL, '(3491) 457-6057', NULL, 0, 1, '28027', 'C/ Alcala 265', 'Madrid', 53, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:00', NULL, NULL, NULL, 45, 'Spain'),
(80, 1, 'Faizan Shaikh', '400401-19', 'Silvia ', 0, 0, 'silvia.hermoso@telxius.com', 'Hermoso Lera', NULL, '(3491) 483-0612', NULL, 0, 1, '28050', 'Ronda de la Comunicación s/n, Distrito Telefónica, Edificio Norte 2', 'Planta ', 54, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:01', NULL, NULL, NULL, 46, 'Spain'),
(81, 1, 'Kaif Khan', '400401-32', 'Katerina ', 0, 0, 'katerina.jovevski@alliedexpress.com.au', 'Jovevski', NULL, '(6) 113-1373', NULL, 0, 1, '2190', '62 Hume Hwy. Bldg. 1, Unit 2', 'Chullora', 48, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:01', NULL, NULL, NULL, 39, 'Australia'),
(82, 1, 'Wasiya Shaikh', '400401-21', 'SERGIO ', 0, 0, 'sergio.mestreserrano@gesvalt.es', 'MESTRE SERRANO', NULL, '(3491) 457-6057', NULL, 0, 1, '28027', 'C/ Alcala 265', 'Madrid', 55, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:01', NULL, NULL, NULL, 47, 'Spain'),
(83, 1, 'Kaif Khan', '400401-32', 'Andrea ', 0, 0, 'andrea.telford@alliedexpress.com.au', 'Telford', NULL, '(6) 113-1373', NULL, 0, 1, '2190', '62 Hume Hwy. Bldg. 1, Unit 2', 'Chullora', 48, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:01', NULL, NULL, NULL, 39, 'Australia'),
(84, 1, 'Kaif Khan', '400401-32', 'Gila ', 0, 0, 'gila.swil@rizing.com', 'Swil', NULL, '(6128) 416-4584', NULL, 0, 1, '2065', 'Level 1, 272 Pacific Highway, Crows Nest, ', 'Sydney', 49, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:01', NULL, NULL, NULL, 48, 'Australia'),
(85, 1, 'Wasiya Shaikh', '400401-21', 'Manuel Sanchez', 0, 0, 'manuel.sanchezsanJose@gesvalt.es', 'San Jose', NULL, '(3491) 457-6057', NULL, 0, 1, '28027', 'C/ Alcala 265', 'Madrid', 56, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:01', NULL, NULL, NULL, 49, 'Spain'),
(86, 1, 'Kaif Khan', '400401-32', 'Sam ', 0, 0, 'sam.botros@rizing.com', 'Botros', NULL, '(6128) 416-4584', NULL, 0, 1, '2065', 'Level 1, 272 Pacific Highway, Crows Nest, ', 'Sydney', 48, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:01', NULL, NULL, NULL, 50, 'Australia'),
(87, 1, 'Kaif Khan', '400401-32', 'Tom ', 0, 0, 'tom.gilmour@rizing.com', 'Gilmour', NULL, '(6128) 416-4584', NULL, 0, 1, '2065', 'Level 1, 272 Pacific Highway, Crows Nest, ', 'Sydney', 48, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:01', NULL, NULL, NULL, 50, 'Australia'),
(88, 1, 'Wasiya Shaikh', '400401-21', 'Jose Antonio', 0, 0, 'jruiz@gesvalt.es', 'Caballero Ruiz', NULL, '(3491) 457-6057', NULL, 0, 1, '28027', 'C/ Alcala, 265', 'Madrid', 55, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:02', NULL, NULL, NULL, 47, 'Spain'),
(89, 1, 'Kaif Khan', '400401-32', 'Patrick', 0, 0, 'patrick@royalwolf.com.au', 'Weber', NULL, '(6129) 482-3466', NULL, 0, 1, '2072', '1 Merriwa St', 'Gordon ', 48, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:02', NULL, NULL, NULL, 37, 'Australia'),
(90, 1, 'Kaif Khan', '400401-32', 'Shane', 0, 0, 'shane@royalwolf.com.au', 'Bettinson', NULL, '(6129) 482-3466', NULL, 0, 1, '2072', '1 Merriwa St', 'Gordon ', 48, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:02', NULL, NULL, NULL, 37, 'Australia'),
(91, 1, 'Sakib Patni', '400401-29', 'Yohann ', 0, 0, 'yohann.bijaczyk@payfit.com', 'Bijaczyk', NULL, '(3317) 634-0167', NULL, 0, 1, '75017', '75 Rue de Tocqueville', 'Paris', 57, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:02', NULL, NULL, NULL, 51, 'France'),
(92, 1, 'Kaif Khan', '400401-32', 'Brian ', 0, 0, 'brian.doyle@royalwolf.com.au', 'Rhodin', NULL, '(6129) 482-3466', NULL, 0, 1, '2072', '1 Merriwa St', 'Gordon ', 48, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:02', NULL, NULL, NULL, 37, 'Australia'),
(93, 1, 'Wasiya Shaikh', '400401-21', 'Daniel ', 0, 0, 'darroyal@gesvalt.es', 'Arroyal', NULL, '(3491) 457-6057', NULL, 0, 1, '28027', 'C/ Alcala, 265', 'Madrid', 55, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:02', NULL, NULL, NULL, 47, 'Spain'),
(94, 1, 'Kaif Khan', '400401-32', 'Joshua ', 0, 0, 'joshua@royalwolf.com.au', 'Inskip', NULL, '(6129) 482-3466', NULL, 0, 1, '2072', '1 Merriwa St', 'Gordon ', 48, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:02', NULL, NULL, NULL, 37, 'Australia'),
(95, 1, 'Kaif Khan', '400401-32', 'Curt ', 0, 0, 'curt@royalwolf.com.au', 'Blakey', NULL, '(6129) 482-3466', NULL, 0, 1, '2072', '1 Merriwa St', 'Gordon ', 48, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:02', NULL, NULL, NULL, 37, 'Australia'),
(96, 1, 'Kaif Khan', '400401-32', 'Greg ', 0, 0, 'greg.forster@elmosoftware.com.au', 'Forster', NULL, '(6128) 305-4600', NULL, 0, 1, '2000', 'Level 27, 580 George St.', 'Sydney', 48, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:02', NULL, NULL, NULL, 52, 'Australia'),
(97, 1, 'Kaif Khan', '400401-32', 'Michael ', 0, 0, 'michael.ho@elmosoftware.com.au', 'Ho', NULL, '(6128) 305-4600', NULL, 0, 1, '2000', 'Level 27, 580 George St.', 'Sydney', 48, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:03', NULL, NULL, NULL, 52, 'Australia'),
(98, 1, 'Wasiya Shaikh', '400401-21', 'Carmen Diaz', 0, 0, 'cgarcia@gesvalt.es', 'Garcia', NULL, '(3491) 457-6057', NULL, 0, 1, '28027', 'C/ AlcalA, 265', 'Madrid', 55, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:03', NULL, NULL, NULL, 47, 'Spain'),
(99, 1, 'Abrar Shaikh', '400401-28', 'Rachel ', 0, 0, 'rachel.tabellion@hometogo.com', 'Tabellion', NULL, '(49302) 084-7396', NULL, 0, 1, '10437', 'Sonnenburger Strasse 73', 'Berlin', 47, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:03', NULL, NULL, NULL, 53, 'Germany'),
(100, 1, 'Kaif Khan', '400401-32', 'Naveen ', 0, 0, 'naveen.kumar@elmosoftware.com.au', 'Kumar', NULL, '(6128) 305-4600', NULL, 0, 1, '2000', 'Level 27, 580 George St.', 'Sydney', 48, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:03', NULL, NULL, NULL, 52, 'Australia'),
(101, 1, 'Sakib Patni', '400401-29', 'Yannick ', 0, 0, 'yannick.kpodar@payfit.com', 'Kpodar', NULL, '(3317) 634-0167', NULL, 0, 1, '75017', '75 Rue de Tocqueville', 'Paris', 58, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:03', NULL, NULL, NULL, 54, 'France'),
(102, 1, 'Kaif Khan', '400401-32', 'Aditi ', 0, 0, 'aditi.mahendru@elmosoftware.com.au', 'Mahendru', NULL, '(6128) 305-4600', NULL, 0, 1, '2000', 'Level 27, 580 George St.', 'Sydney', 48, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:03', NULL, NULL, NULL, 52, 'Australia'),
(103, 1, 'Kaif Khan', '400401-32', 'Richard ', 0, 0, 'richard.murphy@elmosoftware.com.au', 'Murphy', NULL, '(6128) 305-4600', NULL, 0, 1, '2000', 'Level 27, 580 George St.', 'Sydney', 48, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:04', NULL, NULL, NULL, 52, 'Australia'),
(104, 1, 'Musaddique Shaikh', '400401-26', 'Noa ', 0, 0, 'noa.schwartz@syte.ai', 'Schwartz', NULL, '(9723) 566-3444', NULL, 0, 1, '6513445', 'Syte 105 Allenby Street ', 'Tel Aviv', 59, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:04', NULL, NULL, NULL, 55, 'Israel'),
(105, 1, 'Kaif Khan', '400401-32', 'Rob ', 0, 0, 'rob.cozier@elmosoftware.com.au', 'Cozier', NULL, '(6128) 305-4600', NULL, 0, 1, '2000', 'Level 27, 580 George St.', 'Sydney', 48, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:04', NULL, NULL, NULL, 52, 'Australia'),
(106, 1, 'Musaddique Shaikh', '400401-26', 'Gal ', 0, 0, 'gal@syte.ai', 'Aga', NULL, '(9723) 566-3444', NULL, 0, 1, '6513445', 'Syte 105 Allenby Street', 'Tel Aviv', 60, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:04', NULL, NULL, NULL, 56, 'Israel'),
(107, 1, 'Sakib Patni', '400401-29', 'Hugo ', 0, 0, 'hugo.riviere@payfit.com', 'Riviere', NULL, '(3317) 634-0167', NULL, 0, 1, '75017', '75 Rue de Tocqueville', 'Paris', 61, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:04', NULL, NULL, NULL, 57, 'France'),
(108, 1, 'Kaif Khan', '400401-32', 'Will ', 0, 0, 'will.sanchez@elmosoftware.com.au', 'Sanchez', NULL, '(6128) 305-4600', NULL, 0, 1, '2000', 'Level 27, 580 George St.', 'Sydney', 48, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:04', NULL, NULL, NULL, 52, 'Australia'),
(109, 1, 'Musaddique Shaikh', '400401-26', 'Arad ', 0, 0, 'arad@syte.ai', 'Offer', NULL, '(9723) 566-3444', NULL, 0, 1, '6513445', 'Syte 105 Allenby Street', 'Tel Aviv', 62, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:04', NULL, NULL, NULL, 58, 'Israel'),
(110, 1, 'Kaif Khan', '400401-32', 'Jesse ', 0, 0, 'jesse.seads@quandoo.com', 'Seads', NULL, '(6127) 201-8399', NULL, 0, 1, '2022', '505/55 Grafton St', 'Bondi Junction', 48, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:05', NULL, NULL, NULL, 59, 'Australia'),
(111, 1, 'Kaif Khan', '400401-32', 'Liza ', 0, 0, 'liza.corniola@quandoo.com', 'Corniola', NULL, '(6127) 201-8399', NULL, 0, 1, '2022', '505/55 Grafton St', 'Bondi Junction', 48, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:05', NULL, NULL, NULL, 59, 'Australia'),
(112, 1, 'Musaddique Shaikh', '400401-26', 'Gal ', 0, 0, 'gal.d@syte.ai', 'Deitsch', NULL, '(9723) 566-3444', NULL, 0, 1, '6513445', 'Syte 105 Allenby Street ', 'Tel Aviv, ', 60, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:05', NULL, NULL, NULL, 56, 'Israel'),
(113, 1, 'Musaddique Shaikh', '400401-26', 'Asya ', 0, 0, 'asya.k@syte.ai', 'Kotler', NULL, '(9723) 566-3444', NULL, 0, 1, '6513445', 'Syte 105 Allenby Street ', 'Tel Aviv', 60, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:05', NULL, NULL, NULL, 56, 'Israel'),
(114, 1, 'Aishwariya Singh', '400401-17', 'Mischa', 0, 0, 'mischa.oudhof@telindus.nl', 'Oudhof', NULL, '(3130) 247-7711', NULL, 0, 1, '3543 AP', 'Krommewetering 7', 'Utrecht', 63, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:06', NULL, NULL, NULL, 60, 'Netherlands'),
(115, 1, 'Aishwariya Singh', '400401-17', 'Christophe ', 0, 0, 'christophe.veuskens@telindus.nl', 'Veuskens', NULL, '(3130) 247-7711', NULL, 0, 1, '3543 AP', 'Krommewetering 7', 'Utrecht', 63, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:06', NULL, NULL, NULL, 60, 'Netherlands'),
(116, 1, 'Faizan Shaikh', '400401-19', 'Alberto ', 0, 0, 'alberto.leiva@telxius.com', 'Leiva', NULL, '(3491) 483-0612', NULL, 0, 1, '28050', 'Ronda de la Comunicación s/n, Distrito Telefónica, Edificio Norte 2', 'Planta ', 64, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:06', NULL, NULL, NULL, 61, 'Spain'),
(117, 1, 'Faizan Shaikh', '400401-27', 'Ralf ', 0, 0, 'ralf.grumme@degruyter.com', 'Grümme', NULL, '(493) 026-0050', NULL, 0, 1, '10785 ', 'Genthiner Str. 13', 'Berlin', 65, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:06', NULL, NULL, NULL, 62, 'Germany'),
(118, 1, 'Abrar Shaikh', '400401-28', 'Julia ', 0, 0, 'julia.zeller@hometogo.com', 'Zeller', NULL, '(49302) 084-7396', NULL, 0, 1, '10437', 'Sonnenburger Strasse 73', 'Berlin', 66, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:06', NULL, NULL, NULL, 63, 'Germany'),
(119, 1, 'Faizan Shaikh', '400401-27', 'Josephine ', 0, 0, 'josephine.hoppe@degruyter.com', 'Hoppe', NULL, '(493) 026-0050', NULL, 0, 1, '10785 ', 'Genthiner Str. 13', 'Berlin', 67, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:06', NULL, NULL, NULL, 64, 'Germany'),
(120, 1, 'Faizan Shaikh', '400401-27', 'Johanna ', 0, 0, 'johanna.davids@degruyter.com', 'Davids', NULL, '(493) 026-0050', NULL, 0, 1, '10785 ', 'Genthiner Str. 13', 'Berlin', 67, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:06', NULL, NULL, NULL, 64, 'Germany'),
(121, 1, 'Abrar Shaikh', '400401-28', 'Tamara ', 0, 0, 'tamara.boras@hometogo.com', 'Boras', NULL, '(49302) 084-7396', NULL, 0, 1, '10437', 'Sonnenburger Strasse 73', 'Berlin', 68, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:07', NULL, NULL, NULL, 65, 'Germany'),
(122, 1, 'Wasiya Shaikh', '400401-21', 'Ivan ', 0, 0, 'ivan.brinas@anticipa.com', 'Brinas', NULL, '(3490) 010-2643', NULL, 0, 1, '8820', 'C/ Roure, 6-8, 4El Prat de Llobregat', 'El Prat de Llobregat', 53, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:07', NULL, NULL, NULL, 66, 'Spain'),
(123, 1, 'Abrar Shaikh', '400401-30', 'Tomé ', 0, 0, 'tome.ferreira@inconcertcc.com', 'Ferreira', NULL, '(3397) 073-5303', NULL, 0, 1, '75008', '24 Rue de', 'Paris', 69, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:08', NULL, NULL, NULL, 67, 'France'),
(124, 1, 'Faizan Shaikh', '400401-27', 'Asja ', 0, 0, 'asja.kusnezowa@degruyter.com', 'Kusnezowa', NULL, '(493) 026-0050', NULL, 0, 1, '10785 ', 'Genthiner Str. 13', 'Berlin', 65, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:08', NULL, NULL, NULL, 62, 'Germany'),
(125, 1, 'Kaif Khan', '400401-32', 'Jessica ', 0, 0, 'jessica.xu@quandoo.com', 'Xu', NULL, '(6127) 201-8399', NULL, 0, 1, '2022', '505/55 Grafton St', 'Bondi Junction', 48, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:08', NULL, NULL, NULL, 59, 'Australia'),
(126, 1, 'Wasiya Shaikh', '400401-21', 'Helena', 0, 0, 'helena.carrasco@anticipa.com', 'Carrasco Coma', NULL, '(3490) 010-2643', NULL, 0, 1, '8820', 'C/ Roure, 6-8, 4ªEl Prat de Llobregat', 'El Prat de Llobregat', 70, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:08', NULL, NULL, NULL, 68, 'Spain'),
(127, 1, 'Faizan Shaikh', '400401-27', 'Natascha ', 0, 0, 'natascha.barrett@degruyter.com', 'Barrett', NULL, '(493) 026-0050', NULL, 0, 1, '10785 ', 'Genthiner Str. 13', 'Berlin', 65, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:08', NULL, NULL, NULL, 62, 'Germany'),
(128, 1, 'Abrar Shaikh', '400401-28', 'Muirinn ', 0, 0, 'muirinn.kemmer@tado.com', 'Kemmer', NULL, '(498941) 615-664', NULL, 0, 1, '80337', 'Lindwurmstr. 76,', 'Munich', 47, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:08', NULL, NULL, NULL, 69, 'Germany'),
(129, 1, 'Wasiya Shaikh', '400401-21', 'German `', 0, 0, 'german.sanchez@anticipa.com', 'Sanchez Reus', NULL, '(3490) 010-2643', NULL, 0, 1, '8820', 'C/ Roure, 6-8, 4ªEl Prat de Llobregat', 'El Prat de Llobregat', 71, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:09', NULL, NULL, NULL, 70, 'Spain'),
(130, 1, 'Faizan Shaikh', '400401-27', 'Alžbeta ', 0, 0, 'alzbeta.bindasova@degruyter.com', 'Bindasová', NULL, '(493) 026-0050', NULL, 0, 1, '10785 ', 'Genthiner Str. 13', 'Berlin', 65, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:09', NULL, NULL, NULL, 62, 'Germany'),
(131, 1, 'Abrar Shaikh', '400401-28', 'Martin ', 0, 0, 'martin.topf@tado.com', 'Topf', NULL, '(498941) 615-664', NULL, 0, 1, '80337', 'Lindwurmstr. 76,', 'Munich', 47, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:09', NULL, NULL, NULL, 69, 'Germany'),
(132, 1, 'Abrar Shaikh', '400401-28', 'Björn ', 0, 0, 'bjorn.krase@tado.com', 'Krase', NULL, '(498941) 615-664', NULL, 0, 1, '80337', 'Lindwurmstr. 76,', 'Munich', 65, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:09', NULL, NULL, NULL, 71, 'Germany'),
(133, 1, 'Abrar Shaikh', '400401-28', 'Tuan ', 0, 0, 'tuan.le@tado.com', 'Le', NULL, '(498941) 615-664', NULL, 0, 1, '80337', 'Lindwurmstr. 76,', 'Munich', 72, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:09', NULL, NULL, NULL, 72, 'Germany'),
(134, 1, 'Faizan Shaikh', '400401-19', 'Gorka ', 0, 0, 'g.jimenez@erumgroup.com', 'Jiménez ', NULL, '(3490) 233-0817', NULL, 0, 1, '48002', 'San Sebastián', 'Basque Country', 73, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:09', NULL, NULL, NULL, 73, 'Spain'),
(135, 1, 'Sakib Patni', '400401-29', 'Gregoire ', 0, 0, 'gregoire.niclause@payfit.com', 'Niclause', NULL, '(3317) 634-0167', NULL, 0, 1, '75017', '75 Rue de Tocqueville', 'Paris', 69, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:09', NULL, NULL, NULL, 74, 'France'),
(136, 1, 'Aishwariya Singh', '400401-17', 'Jochem', 0, 0, 'jochem.vreeke@computacenter.com', 'Vreeke', NULL, '(3188) 435-8000', NULL, 0, 1, '1186 MJ', 'Gondel 1', 'Amstelveen', 74, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:10', NULL, NULL, NULL, 75, 'Netherlands'),
(137, 1, 'Wasiya Shaikh', '400401-21', 'Mireia Sanchez', 0, 0, 'mireia.sanchez@anticipa.com', 'Colome', NULL, '(3490) 010-2643', NULL, 0, 1, '8820', 'C/ Roure, 6-8, 4ªEl Prat de Llobregat', 'El Prat de Llobregat', 71, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:10', NULL, NULL, NULL, 70, 'Spain'),
(138, 1, 'Abrar Shaikh', '400401-28', 'Pierre ', 0, 0, 'pierre.guillet@tado.com', 'Guillet', NULL, '(498941) 615-664', NULL, 0, 1, '80337', 'Lindwurmstr. 76,', 'Munich', 47, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:10', NULL, NULL, NULL, 69, 'Germany'),
(139, 1, 'Amit Nimbalkar', '400401-28', 'Catarina ', 0, 0, 'c.manteigueiro@dcmn.com', 'Manteigueiro', NULL, '(493099) 191-643', NULL, 0, 1, '10245 ', 'Boxhagener Straße 18', 'Berlin', 65, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:10', NULL, NULL, NULL, 76, 'Germany'),
(140, 1, 'Abrar Shaikh', '400401-30', 'Christophe ', 0, 0, 'christophe.helin@kramerav.com', 'Helin', NULL, '(3316) 975-2980', NULL, 0, 1, '91120', '6-8 rue Ambroise Croizat ', 'PALAISEAU', 75, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:10', NULL, NULL, NULL, 77, 'France'),
(141, 1, 'Aishwariya Singh', '400401-17', 'Ton', 0, 0, 'ton.schaar@computacenter.com', 'Schaar', NULL, '(3188) 435-8000', NULL, 0, 1, '1186 MJ', 'Gondel 1', 'Amstelveen', 76, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:10', NULL, NULL, NULL, 78, 'Netherlands'),
(142, 1, 'Kaif Khan', '400401-32', 'Brooke ', 0, 0, 'brooke.newton@quandoo.com', 'Newton', NULL, '(6127) 201-8399', NULL, 0, 1, '2022', '505/55 Grafton St', 'Bondi Junction', 48, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:11', NULL, NULL, NULL, 59, 'Australia'),
(143, 1, 'Kaif Khan', '400401-32', 'Angelina ', 0, 0, 'angelina.fada@quandoo.com', 'Fada', NULL, '(6127) 201-8399', NULL, 0, 1, '2022', '505/55 Grafton St', 'Bondi Junction', 48, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:11', NULL, NULL, NULL, 59, 'Australia'),
(144, 1, 'Kaif Khan', '400401-32', 'Ankit ', 0, 0, 'ankit.sharma@quandoo.com', 'Sharma', NULL, '(6127) 201-8399', NULL, 0, 1, '2022', '505/55 Grafton St', 'Bondi Junction', 48, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:11', NULL, NULL, NULL, 59, 'Australia'),
(145, 1, 'Amit Nimbalkar', '400401-28', 'Michael', 0, 0, 'michael.lazik@templafy.com', 'Lazik', NULL, '(49306) 098-6645', NULL, 0, 1, '10997', 'Schlesische St. 29-30', 'Berlin Kreuzberg', 47, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:11', NULL, NULL, NULL, 79, 'Germany'),
(146, 1, 'Musaddique Shaikh', '400401-26', 'Laurence ', 0, 0, 'laurence@freightos.com', 'Berkowitz', NULL, '(9722) 644-7333', NULL, 0, 1, '9695102', 'HaPo\'el 1, Jerusalem', 'Jerusalem', 62, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:11', NULL, NULL, NULL, 80, 'Israel'),
(147, 1, 'Amit Nimbalkar', '400401-28', 'Jan ', 0, 0, 'jan.misselwitz@iota.org', 'Misselwitz', NULL, '(49305) 490-9135', NULL, 0, 1, '10405', 'c/o Nextland Strassburgerstraße 55', 'Berlin', 68, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:11', NULL, NULL, NULL, 81, 'Germany'),
(148, 1, 'Amit Nimbalkar', '400401-28', 'Julian ', 0, 0, 'j.reitzig@dcmn.com', 'Reitzig', NULL, '(493099) 191-643', NULL, 0, 1, '10245 ', 'Boxhagener Straße 18', 'Berlin', 47, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:12', NULL, NULL, NULL, 82, 'Germany'),
(149, 1, 'Amit Nimbalkar', '400401-16', 'Jaap Willem', 0, 0, 'jaap-willem.hoogenhout@weareyou.com', 'Hoogenhout', NULL, '(3173) 681-1002', NULL, 0, 1, '5223 LA', 'Statenlaan 2-20', 'Den Bosch', 77, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:12', NULL, NULL, NULL, 83, 'Netherlands'),
(150, 1, 'Abrar Shaikh', '400401-18', 'Johan ', 0, 0, 'johan.helmfrid@digitalroute.com', 'Helmfrid', NULL, '(4610) 707-9000', NULL, 0, 1, '113 60', 'Drottninggatan 89', 'Stockholm', 78, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:12', NULL, NULL, NULL, 84, 'Sweden'),
(151, 1, 'Abrar Shaikh', '400401-16', 'Sandra ', 0, 0, 'sandra.vingerling@vrumona.nl', 'Vingerling', NULL, '(3130) 656-8911', NULL, 0, 1, '3981 HT', 'Vrumonaweg 2', 'Bunnik', 77, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:12', NULL, NULL, NULL, 85, 'Netherlands'),
(152, 1, 'Abrar Shaikh', '400401-16', 'Sandra ', 0, 0, 'sandra.vingerling@vrumona.nl', 'Vingerling', NULL, '(3130) 656-8911', NULL, 0, 1, '3981 HT', 'Vrumonaweg 2', 'Bunnik', 77, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:12', NULL, NULL, NULL, 85, 'Netherlands'),
(153, 1, 'Faizan Shaikh', '400401-19', 'Carlos ', 0, 0, 'carlos.martin@idfinance.com', 'Martín', NULL, '(3493) 461-7231', NULL, 0, 1, '08006 ', 'Carrer de Moià', 'Barcelona', 79, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:12', NULL, NULL, NULL, 86, 'Spain'),
(154, 1, 'Amit Nimbalkar', '400401-16', 'Dorien Van Der', 0, 0, 'dorien.vanderlinden@weareyou.com', 'Linden', NULL, '(3173) 681-1002', NULL, 0, 1, '5223 LA', 'Statenlaan 2-20', 'Den Bosch', 80, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:13', NULL, NULL, NULL, 87, 'Netherlands'),
(155, 1, 'Faizan Shaikh', '400401-19', 'Vanessa ', 0, 0, 'vanessa.martinez@idfinance.com', 'Martínez', NULL, '(3493) 461-7231', NULL, 0, 1, '08006 ', 'Carrer de Moià', 'Barcelona', 73, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:13', NULL, NULL, NULL, 88, 'Spain'),
(156, 1, 'Faizan Shaikh', '400401-19', 'Nerea ', 0, 0, 'nerea.regidor@opentrends.net', 'Regidor ', NULL, '(3493) 320-8414', NULL, 0, 1, '08019 ', 'Carrer de Veneçuela', 'planta', 79, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:13', NULL, NULL, NULL, 89, 'Spain'),
(157, 1, 'Musaddique Shaikh', '400401-30', 'Pascal ', 0, 0, 'pascalnicolas@fujitsu.com', 'Pascal ', NULL, '(3314) 197-9000', NULL, 0, 1, '92600', '29 Quai Aulagnier', 'Asnières-sur-Seine', 69, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:13', NULL, NULL, NULL, 90, 'France'),
(158, 1, 'Faizan Shaikh', '400401-19', 'Martí ', 0, 0, 'marti.fabrega@opentrends.net', 'Fàbrega', NULL, '(3493) 320-8414', NULL, 0, 1, '08019 ', 'Carrer de Veneçuela', 'planta', 81, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:13', NULL, NULL, NULL, 91, 'Spain'),
(159, 1, 'Musaddique Shaikh', '400401-30', 'Romain ', 0, 0, 'romaingraveleau@fujitsu.com', 'Graveleau', NULL, '(3314) 197-9000', NULL, 0, 1, '92600', '29 Quai Aulagnier', 'Asnières-sur-Seine,', 52, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:14', NULL, NULL, NULL, 92, 'France'),
(160, 1, 'Amit Nimbalkar', '400401-16', 'Beppie Ten', 0, 0, 'beppie.tenbohmer@weareyou.com', 'Bohmer', NULL, '(3173) 681-1002', NULL, 0, 1, '5223 LA', 'Statenlaan 2-20', 'Den Bosch', 82, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:15', NULL, NULL, NULL, 93, 'Netherlands'),
(161, 1, 'Musaddique Shaikh', '400401-30', 'Léonie ', 0, 0, 'leoniecaplot@fujitsu.com', 'Caplot', NULL, '(3314) 197-9000', NULL, 0, 1, '92600', '29 Quai Aulagnier,', 'Asnières-sur-Seine', 45, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:15', NULL, NULL, NULL, 94, 'France'),
(162, 1, 'Faizan Shaikh', '400401-19', 'Roser ', 0, 0, 'roser.olles@opentrends.net', 'Olles', NULL, '(3493) 320-8414', NULL, 0, 1, '08019 ', 'Carrer de Veneçuela', 'planta', 81, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:15', NULL, NULL, NULL, 91, 'Spain'),
(163, 1, 'Musaddique Shaikh', '400401-30', 'Lucie ', 0, 0, 'lucieblanchard@fujitsu.com', 'Blanchard', NULL, '(3314) 197-9000', NULL, 0, 1, '92600', '29 Quai Aulagnier', 'Asnières-sur-Seine', 58, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:15', NULL, NULL, NULL, 95, 'France'),
(164, 1, 'Wasiya Shaikh', '400401-21', 'Blanca Capdevila', 0, 0, 'blancacapdevila.miro@deerns.com', 'Miro', NULL, '(3493) 205-9040', NULL, 0, 1, '08024 ', 'Carrer de Bruniquer, 49', 'Barcelona', 73, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:15', NULL, NULL, NULL, 96, 'Spain'),
(165, 1, 'Musaddique Shaikh', '400401-30', 'Emilie ', 0, 0, 'emiliecarmagnac@fujitsu.com', 'Carmagnac', NULL, '(3314) 197-9000', NULL, 0, 1, '92600', '29 Quai Aulagnier,', 'Asnières-sur-Seine', 58, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:15', NULL, NULL, NULL, 95, 'France'),
(166, 1, 'Amit Nimbalkar', '400401-16', 'Jill Van De', 0, 0, 'jill.vandekerkhof@weareyou.com', 'Kerkhof', NULL, '(3173) 681-1002', NULL, 0, 1, '5223 LA', 'Statenlaan 2-20', 'Den Bosch', 82, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:15', NULL, NULL, NULL, 93, 'Netherlands'),
(167, 1, 'Amit Nimbalkar', '400401-28', 'Eric ', 0, 0, 'e.vissers@dcmn.com', 'Vissers', NULL, '(493099) 191-643', NULL, 0, 1, '10245 ', 'Boxhagener Straße 18', 'Berlin', 65, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:15', NULL, NULL, NULL, 76, 'Germany'),
(168, 1, 'Abrar Shaikh', '400401-18', 'Bruno ', 0, 0, 'bruno@funnel.io', 'Petersen', NULL, '(4685) 100-5700', NULL, 0, 1, '111 21', 'Klarabergsgatan 29', 'Stockholm', 83, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:16', NULL, NULL, NULL, 97, 'Sweden'),
(169, 1, 'Faizan Shaikh', '400401-27', 'Johanna Auguste ', 0, 0, 'johanna.koch@scout24.com', 'Koch', NULL, '(498) 944-4560', NULL, 0, 1, '81675', 'Bothestraße 11', 'München', 47, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:16', NULL, NULL, NULL, 98, 'Germany'),
(170, 1, 'Abrar Shaikh', '400401-18', 'Megan', 0, 0, 'megan@funnel.io', 'Lozicki', NULL, '(4685) 100-5700', NULL, 0, 1, '111 21', 'Klarabergsgatan 29', 'Stockholm', 84, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:17', NULL, NULL, NULL, 99, 'Sweden'),
(171, 1, 'Amit Nimbalkar', '400401-16', 'Dries ', 0, 0, 'dries.poels@nederlandseloterij.nl', 'Poels', NULL, '(3170) 550-0852', NULL, 0, 1, '2289 DG', 'Laan van Hoornwijck 55', 'Rijswijk', 80, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:17', NULL, NULL, NULL, 100, 'Netherlands'),
(172, 1, 'Faizan Shaikh', '400401-27', 'Jochen ', 0, 0, 'jochen.kurz@scout24.com', 'Kurz', NULL, '(498) 944-4560', NULL, 0, 1, '81675', 'Bothestraße 11', 'München', 65, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:17', NULL, NULL, NULL, 101, 'Germany'),
(173, 1, 'Abrar Shaikh', '400401-18', 'Victoria', 0, 0, 'victoria@funnel.io', 'Sörving', NULL, '(4685) 100-5700', NULL, 0, 1, '111 21', 'Klarabergsgatan 29', 'Stockholm', 85, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:17', NULL, NULL, NULL, 102, 'Sweden'),
(174, 1, 'Abrar Shaikh', '400401-18', 'Tomas', 0, 0, 'tomas@funnel.io', 'Smogner', NULL, '(4685) 100-5700', NULL, 0, 1, '111 21', 'Klarabergsgatan 29', 'Stockholm', 86, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:18', NULL, NULL, NULL, 103, 'Sweden'),
(175, 1, 'Salman Shaikh', '400401-18', 'Tim', 0, 0, 'tim@funnel.io', 'Hurst', NULL, '(4685) 100-5700', NULL, 0, 1, '111 21', 'Klarabergsgatan 29', 'Stockholm', 87, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:18', NULL, NULL, NULL, 104, 'Sweden'),
(176, 1, 'Faizan Shaikh', '400401-27', 'Evelin ', 0, 0, 'evelin.eckart@scout24.com', 'Eckart', NULL, '(498) 944-4560', NULL, 0, 1, '81675', 'Bothestraße 11', 'München', 65, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:18', NULL, NULL, NULL, 101, 'Germany'),
(177, 1, 'Salman Shaikh', '400401-18', 'Erik ', 0, 0, 'erik@funnel.io', 'Hellstam', NULL, '(4685) 100-5700', NULL, 0, 1, '111 21', 'Klarabergsgatan 29', 'Stockholm', 87, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:18', NULL, NULL, NULL, 104, 'Sweden'),
(178, 1, 'Salman Shaikh', '400401-18', 'Oskar ', 0, 0, 'oskar@funnel.io', 'Lindberg', NULL, '(4685) 100-5700', NULL, 0, 1, '111 21', 'Klarabergsgatan 29', 'Stockholm', 87, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:18', NULL, NULL, NULL, 104, 'Sweden'),
(179, 1, 'Faizan Shaikh', '400401-27', 'Jessica ', 0, 0, 'jessica.ansari@scout24.com', 'Ansari', NULL, '(498) 944-4560', NULL, 0, 1, '81675', 'Bothestraße 11', 'München', 65, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:18', NULL, NULL, NULL, 101, 'Germany'),
(180, 1, 'Kaif Khan', '400401-19', 'Daniel', 0, 0, 'saniel.gomez@lacer.es', 'Gomez', NULL, '(3493) 446-5300', NULL, 0, 1, '08025 ', 'Carrer de Sardenya', 'Barcelona', 88, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:19', NULL, NULL, NULL, 105, 'Spain'),
(181, 1, 'Faizan Shaikh', '400401-27', 'Frank ', 0, 0, 'frank.hoegen@scout24.com', 'Hoegen', NULL, '(498) 944-4560', NULL, 0, 1, '81675', 'Bothestraße 11', 'München', 47, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:19', NULL, NULL, NULL, 98, 'Germany'),
(182, 1, 'Faizan Shaikh', '400401-27', 'Christina ', 0, 0, 'christina.redl@scout24.com', 'Redl', NULL, '(498) 944-4560', NULL, 0, 1, '81675', 'Bothestraße 11', 'München', 65, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:19', NULL, NULL, NULL, 101, 'Germany'),
(183, 1, 'Kaif Khan', '400401-19', 'Olfa ', 0, 0, 'olfa.djemal@mixpanel.com', 'Djemal', NULL, '(34888) 510-2370', NULL, 0, 1, '08018 ', 'Avinguda Diagonal, 211', 'Catalonia', 81, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:19', NULL, NULL, NULL, 106, 'Spain'),
(184, 1, 'Amit Nimbalkar', '400401-16', 'Diana ', 0, 0, 'diana.zoetekouw@albelli.com', 'Zoetekouw', NULL, '(3120) 708-3513', NULL, 0, 1, '2497 GB', 'Laan van Ypenburg 34-38', 'Den Haag', 80, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:19', NULL, NULL, NULL, 107, 'Netherlands'),
(185, 1, 'Kaif Khan', '400401-32', 'Roslyn ', 0, 0, 'roslyn.wetherill@quandoo.com', 'Wetherill', NULL, '(6127) 201-8399', NULL, 0, 1, '2022', '505/55 Grafton St', 'Bondi Junction', 49, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:19', NULL, NULL, NULL, 108, 'Australia'),
(186, 1, 'Kashifa Shaikh', '400401-32', 'Rachael ', 0, 0, 'rachael.britton@addisonslawyers.com.au', 'Britton', NULL, '(6128) 915-1000', NULL, 0, 1, '2000', 'Level 12 60 Carrington St', 'Sydney', 89, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:20', NULL, NULL, NULL, 109, 'Australia'),
(187, 1, 'Kashifa Shaikh', '400401-32', 'Belinda ', 0, 0, 'belinda.cusack@addisonslawyers.com.au', 'Cusack', NULL, '(6128) 915-1000', NULL, 0, 1, '2000', 'Level 12 60 Carrington St', 'Sydney', 51, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:20', NULL, NULL, NULL, 110, 'Australia'),
(188, 1, 'Kashifa Shaikh', '400401-32', 'Jennifer ', 0, 0, 'jennifer.staude@addisonslawyers.com.au', 'Staude', NULL, '(6128) 915-1000', NULL, 0, 1, '2000', 'Level 12 60 Carrington St', 'Sydney', 90, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:20', NULL, NULL, NULL, 111, 'Australia'),
(189, 1, 'Musaddique Shaikh', '400401-30', 'Yvon ', 0, 0, 'yvon.herve@homeserve.fr', 'HERVE', NULL, '(3317) 082-1769', NULL, 0, 1, '69007', ' 9 Rue Anna Marly', 'Lyon', 61, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:20', NULL, NULL, NULL, 112, 'France'),
(190, 1, 'Kashifa Shaikh', '400401-32', 'Patrick ', 0, 0, 'patrick.jordan@coca-cola.com', 'Jordan', NULL, '(6) 113-2653', NULL, 0, 1, '4077', ' 260 Orchard Rd', 'Richlands ', 91, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:20', NULL, NULL, NULL, 113, 'Australia'),
(191, 1, 'Amit Nimbalkar', '400401-16', 'Jean-Philippe', 0, 0, 'jean-philippe.dubost@albelli.com', 'DUBOST', NULL, '(3120) 708-3513', NULL, 0, 1, '2497 GB', 'Laan van Ypenburg 34-38', 'Den Haag', 92, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:21', NULL, NULL, NULL, 114, 'Netherlands'),
(192, 1, 'Kashifa Shaikh', '400401-32', 'Lynette ', 0, 0, 'lynette.davis@coca-cola.com', 'Davis', NULL, '(6) 113-2653', NULL, 0, 1, '4077', ' 260 Orchard Rd', 'Richlands ', 91, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:21', NULL, NULL, NULL, 113, 'Australia'),
(193, 1, 'Amit Nimbalkar', '400401-28', 'Isla ', 0, 0, 'i.mcdougall@dcmn.com', 'Mcdougall', NULL, '(493099) 191-643', NULL, 0, 1, '10245 ', 'Boxhagener Straße 18', 'Berlin', 47, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:21', NULL, NULL, NULL, 82, 'Germany'),
(194, 1, 'Kashifa Shaikh', '400401-32', 'Natasya ', 0, 0, 'natasya.wright@coca-cola.com', 'Wright', NULL, '(6) 113-2653', NULL, 0, 1, '4077', ' 260 Orchard Rd', 'Richlands ', 93, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:21', NULL, NULL, NULL, 115, 'Australia'),
(195, 1, 'Kashifa Shaikh', '400401-32', 'Sam ', 0, 0, 'sam.way@coca-cola.com', 'Way', NULL, '(6) 113-2653', NULL, 0, 1, '4077', ' 260 Orchard Rd', 'Richlands ', 93, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:21', NULL, NULL, NULL, 115, 'Australia'),
(196, 1, 'Kashifa Shaikh', '400401-32', 'Josh ', 0, 0, 'josh.gonski@coca-cola.com', 'Gonski', NULL, '(6) 113-2653', NULL, 0, 1, '4077', ' 260 Orchard Rd', 'Richlands ', 94, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:21', NULL, NULL, NULL, 116, 'Australia'),
(197, 1, 'Musaddique Shaikh', '400401-30', 'Evelyne ', 0, 0, 'evelyne.hir@homeserve.fr', 'Hir', NULL, '(3317) 082-1769', NULL, 0, 1, '69007', ': 9 Rue Anna Marly', 'Lyon', 45, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:22', NULL, NULL, NULL, 117, 'France'),
(198, 1, 'Faizan Shaikh', '400401-27', 'Fabian ', 0, 0, 'fabian.ludwig@e-go-mobile.com', 'Ludwig', NULL, '(492414) 757-420', NULL, 0, 1, '52074 ', 'Campus-Boulevard 30', 'Aachen', 47, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:22', NULL, NULL, NULL, 118, 'Germany'),
(199, 1, 'Musaddique Shaikh', '400401-30', 'Thomas ', 0, 0, 'thomas.bonnemazou@homeserve.fr', 'Bonnemazou', NULL, '(3317) 082-1769', NULL, 0, 1, 'Lyon', ' 9 Rue Anna Marly', 'Lyon', 61, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:22', NULL, NULL, NULL, 112, 'France'),
(200, 1, 'Faizan Shaikh', '400401-27', 'Pia ', 0, 0, 'pia.walendzik@e-go-mobile.com', 'Walendzik', NULL, '(492414) 757-420', NULL, 0, 1, '52074 ', 'Campus-Boulevard 30', 'Aachen', 47, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:22', NULL, NULL, NULL, 119, 'Germany'),
(201, 1, 'Kashifa Shaikh', '400401-20', 'Pablo ', 0, 0, 'pablo.leiboff@signaturit.com', 'Leiboff', NULL, '(3493) 551-1480', NULL, 0, 1, '8005', 'Calle Àvila, 29,', 'Barcelona', 95, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:22', NULL, NULL, NULL, 120, 'Spain');
INSERT INTO `bf_prospects` (`id`, `salutation_id`, `first_name`, `middle_name`, `last_name`, `job_level_id`, `job_functions_id`, `title`, `email_id`, `direct_number`, `mobile_number`, `office_number`, `country`, `state`, `city`, `address_1`, `address_2`, `company_id`, `dnc`, `src`, `customer_id`, `deleted`, `deleted_by`, `created_on`, `created_by`, `modified_on`, `modified_by`, `domain_id`, `zip`) VALUES
(202, 1, 'Faizan Shaikh', '400401-27', 'Ernest ', 0, 0, 'ernest.debets@e-go-mobile.com', 'Debets', NULL, '(492414) 757-420', NULL, 0, 1, '52074 ', 'Campus-Boulevard 30', 'Aachen', 96, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:23', NULL, NULL, NULL, 121, 'Germany'),
(203, 1, 'Abrar Shaikh', '400401-16', 'Katharina ', 0, 0, 'k.glorius@sana-commerce.com', 'Glorius', NULL, '(3110) 243-6010', NULL, 0, 1, ' 3044 BC', ' Van Nelleweg 1', 'Rotterdam', 77, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:23', NULL, NULL, NULL, 122, 'Netherlands'),
(204, 1, 'Salman Shaikh', '400401-18', 'Petter', 0, 0, 'petter@teamtailor.com', 'Lundqvist', NULL, '(4610) 330-2222', NULL, 0, 1, '116 24', 'ÅSÖGATAN 119,', 'Stockholm', 87, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:23', NULL, NULL, NULL, 123, 'Sweden'),
(205, 1, 'Sakib Patni', '400401-29', 'Trevor ', 0, 0, 'trevor.smith@butagaz.com', 'Smith', NULL, '(3314) 639-3333', NULL, 0, 1, '92300', '47-53, Rue Raspail', 'Levallois-Perret', 97, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:24', NULL, NULL, NULL, 124, 'France'),
(206, 1, 'Kashifa Shaikh', '400401-20', 'Xavier ', 0, 0, 'xavier.ruiz@signaturit.com', 'Ruiz', NULL, '(3493) 551-1480', NULL, 0, 1, '8005', 'Calle Àvila, 29,', 'Barcelona', 98, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:24', NULL, NULL, NULL, 125, 'Spain'),
(207, 1, 'Wasiya Shaikh', '400401-21', 'Moises ', 0, 0, 'mfargas@semic.es', 'Fargas', NULL, '(3497) 328-0800', NULL, 0, 1, '28054 ', 'Calle del Aguacate, 56', 'Madrid', 99, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:24', NULL, NULL, NULL, 126, 'Spain'),
(208, 1, 'Salman Shaikh', '400401-18', 'Josef', 0, 0, 'josef@teamtailor.com', 'Saker', NULL, '(4610) 330-2222', NULL, 0, 1, '116 24', 'ÅSÖGATAN 119,', 'Stockholm', 87, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:24', NULL, NULL, NULL, 123, 'Sweden'),
(209, 1, 'Musaddique Shaikh', '400401-30', 'Colombine ', 0, 0, 'colombine.poujade@homeserve.fr', 'Poujade', NULL, '(3317) 082-1769', NULL, 0, 1, '69007', '9 Rue Anna Marly', 'Lyon', 61, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:24', NULL, NULL, NULL, 112, 'France'),
(210, 1, 'Abrar Shaikh', '400401-16', 'Iris ', 0, 0, 'i.suurland@sana-commerce.com', 'Suurland', NULL, '(3110) 243-6010', NULL, 0, 1, '3044 BC', 'Van Nelleweg 1,', 'Rotterdam', 77, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:24', NULL, NULL, NULL, 122, 'Netherlands'),
(211, 1, 'Salman Shaikh', '400401-18', 'Afif', 0, 0, 'afif@teamtailor.com', 'Karl-Johan Chahrstan', NULL, '(4610) 330-2222', NULL, 0, 1, '116 24', 'ÅSÖGATAN 119,', 'Stockholm', 87, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:24', NULL, NULL, NULL, 123, 'Sweden'),
(212, 1, 'Salman Shaikh', '400401-18', 'Peter ', 0, 0, 'peter.bergman@bannerflow.com', 'Bergman', NULL, '(46) 825-2020', NULL, 0, 1, '112 34', 'St. Eriksgatan 46C', 'Stockholm', 78, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:24', NULL, NULL, NULL, 127, 'Sweden'),
(213, 1, 'Wasiya Shaikh', '400401-21', 'Juan Jose', 0, 0, 'jhidalgo@semic.es', 'Hidalgo', NULL, '(3497) 328-0800', NULL, 0, 1, '28054 ', 'Calle del Aguacate, 56', 'Madrid', 81, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:25', NULL, NULL, NULL, 128, 'Spain'),
(214, 1, 'Salman Shaikh', '400401-18', 'Joakim ', 0, 0, 'joakim.jamte@bannerflow.com', 'Jamte', NULL, '(46) 825-2020', NULL, 0, 1, '112 34', 'St. Eriksgatan 46C', 'Stockholm', 78, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:25', NULL, NULL, NULL, 127, 'Sweden'),
(215, 1, 'Salman Shaikh', '400401-18', 'Jessica ', 0, 0, 'jessica.cervin@bannerflow.com', 'Cervin', NULL, '(46) 825-2020', NULL, 0, 1, '112 34', 'St. Eriksgatan 46C', 'Stockholm', 83, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:25', NULL, NULL, NULL, 129, 'Sweden'),
(216, 1, 'Musaddique Shaikh', '400401-30', 'Nicolas ', 0, 0, 'nicolas.labeyrie@homeserve.fr', 'Labeyrie', NULL, '(3317) 082-1769', NULL, 0, 1, '69007', '9 Rue Anna Marly', 'Lyon', 61, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:25', NULL, NULL, NULL, 112, 'France'),
(217, 1, 'Salman Shaikh', '400401-18', 'Michael ', 0, 0, 'michael.olsson@bannerflow.com', 'Olsson', NULL, '(46) 825-2020', NULL, 0, 1, '112 34', 'St. Eriksgatan 46C', 'Stockholm', 100, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:25', NULL, NULL, NULL, 130, 'Sweden'),
(218, 1, 'Kaif Khan', '400401-19', 'Elena ', 0, 0, 'elena.torres@mixpanel.com', 'Torres ', NULL, '(34888) 510-2370', NULL, 0, 1, '08018 ', 'Avinguda Diagonal, 211', 'Catalonia', 79, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:26', NULL, NULL, NULL, 131, 'Spain'),
(219, 1, 'Aishwariya Singh', '400401-17', 'Judith ', 0, 0, 'judith.tolk@telindus.nl', 'Tolk', NULL, '(3130) 247-7711', NULL, 0, 1, '3543 AP', 'Krommewetering 7', 'Utrecht', 77, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:26', NULL, NULL, NULL, 132, 'Netherlands'),
(220, 1, 'Salman Shaikh', '400401-18', 'Erik ', 0, 0, 'erik.wikner@bannerflow.com', 'Wikner', NULL, '(46) 825-2020', NULL, 0, 1, '112 34', 'St. Eriksgatan 46C', 'Stockholm', 78, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:26', NULL, NULL, NULL, 127, 'Sweden'),
(221, 1, 'Kaif Khan', '400401-19', 'Nora ', 0, 0, 'nora.gonzalez@mixpanel.com', 'Gonzalez ', NULL, '(34888) 510-2370', NULL, 0, 1, '08018 ', 'Avinguda Diagonal, 211', 'Catalonia', 79, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:26', NULL, NULL, NULL, 131, 'Spain'),
(222, 1, 'Sakib Patni', '400401-29', 'Florence De', 0, 0, 'florence.noray@butagaz.com', 'Noray', NULL, '(3314) 639-3333', NULL, 0, 1, '92300', '47-53, Rue Raspail', 'Levallois-Perret', 101, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:26', NULL, NULL, NULL, 133, 'France'),
(223, 1, 'Aishwariya Singh', '400401-17', 'Mark-Jan', 0, 0, 'mark-jan.wolfswinkel@telindus.nl', 'Wolfswinkel', NULL, '(3130) 247-7711', NULL, 0, 1, '3543 AP', 'Krommewetering 7', 'Utrecht', 63, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:26', NULL, NULL, NULL, 60, 'Netherlands'),
(224, 1, 'Sakib Patni', '400401-29', 'Emmanuel ', 0, 0, 'e.mannooretonil@butagaz.com', 'Mannooretonil', NULL, '(3314) 639-3333', NULL, 0, 1, '92300', '47-53, Rue Raspail', 'Levallois-Perret', 102, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:27', NULL, NULL, NULL, 134, 'France'),
(225, 1, 'Amit Nimbalkar', '400401-28', 'Areeba ', 0, 0, 'a.aziz@dcmn.com', 'Aziz', NULL, '(493099) 191-643', NULL, 0, 1, '10245 ', 'Boxhagener Straße 18', 'Berlin', 65, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:27', NULL, NULL, NULL, 76, 'Germany'),
(226, 1, 'Amit Nimbalkar', '400401-28', 'Mario', 0, 0, 'mario.dietrich@lovoo.com', 'Dietrich', NULL, '(493514) 188-777', NULL, 0, 1, '0 1069', 'Prager St. 10', 'Dresden', 65, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:27', NULL, NULL, NULL, 135, 'Germany'),
(227, 1, 'Abrar Shaikh', '400401-50', 'Belinda ', 0, 0, 'belinda.sinclair@domain.com.au', 'Sinclair', NULL, '(6129) 254-3000', NULL, 0, 1, '2009', '1 Darling Island Rd', 'Pyrmont', 48, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:27', NULL, NULL, NULL, 136, 'Australia'),
(228, 1, 'Salman Shaikh', '400401-18', 'Timothy ', 0, 0, 'timothy.nilsholm@plmgroup.se', 'Nilsholm', NULL, '(4637) 069-0950', NULL, 0, 1, '331 41 ', 'Stenfalksvägen 2', 'Värnamo', 100, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:27', NULL, NULL, NULL, 137, 'Sweden'),
(229, 1, 'Kashifa Shaikh', '400401-32', 'Pamela ', 0, 0, 'pamela.wyatt@coca-cola.com', 'Wyatt', NULL, '(6) 113-2653', NULL, 0, 1, '4077', ' 260 Orchard Rd', 'Richlands ', 94, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:27', NULL, NULL, NULL, 116, 'Australia'),
(230, 1, 'Amit Nimbalkar', '400401-28', 'Uzi ', 0, 0, 'uzi.blum@taxfix.de', 'Blum', NULL, '(49302) 555-9635', NULL, 0, 1, '10435', 'Schwedter Strasse 36A ', 'Berlin', 103, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:27', NULL, NULL, NULL, 138, 'Germany'),
(231, 1, 'Abrar Shaikh', '400401-50', 'Troy ', 0, 0, 'troy@rwproperty.com.au', 'Nicholson', NULL, '(6129) 327-5825', NULL, 0, 1, '2028', '352 New South Head Rd.', 'Double Bay', 104, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:28', NULL, NULL, NULL, 139, 'United States'),
(232, 1, 'Kashifa Shaikh', '400401-32', 'Martyn ', 0, 0, 'martyn.ferguson@coca-cola.com', 'Ferguson', NULL, '(6) 113-2653', NULL, 0, 1, '4077', ' 260 Orchard Rd', 'Richlands ', 94, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:28', NULL, NULL, NULL, 116, 'Australia'),
(233, 1, 'Kashifa Shaikh', '400401-32', 'Samantha ', 0, 0, 'samantha.myers@employmenthero.com', 'Jay Myers', NULL, '(6128) 705-4700', NULL, 0, 1, '2000', 'Level 2, 441 Kent St., ', 'Sydney', 51, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:28', NULL, NULL, NULL, 140, 'Australia'),
(234, 1, 'Amit Nimbalkar', '400401-28', 'Michael ', 0, 0, 'michael@taxfix.de', 'Korkia', NULL, '(49302) 555-9635', NULL, 0, 1, '10435', 'Schwedter Strasse 36A ', 'Berlin', 65, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:28', NULL, NULL, NULL, 141, 'Germany'),
(235, 1, 'Kashifa Shaikh', '400401-32', 'Kurt ', 0, 0, 'kurt.sfiligoi@employmenthero.com', 'Sfiligoi', NULL, '(6128) 705-4700', NULL, 0, 1, '2000', 'Level 2, 441 Kent St., ', 'Sydney', 48, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:28', NULL, NULL, NULL, 142, 'Australia'),
(236, 1, 'Kashifa Shaikh', '400401-32', 'Zoë ', 0, 0, 'zoe.poole@employmenthero.com', 'Poole', NULL, '(6128) 705-4700', NULL, 0, 1, '2000', 'Level 2, 441 Kent St., ', 'Sydney', 48, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:28', NULL, NULL, NULL, 142, 'Australia'),
(237, 1, 'Kashifa Shaikh', '400401-32', 'Jessica ', 0, 0, 'jessica.maclennan@employmenthero.com', 'Maclennan', NULL, '(6128) 705-4700', NULL, 0, 1, '2000', 'Level 2, 441 Kent St., ', 'Sydney', 48, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:28', NULL, NULL, NULL, 142, 'Australia'),
(238, 1, 'Sakib Patni', '400401-29', 'Sebastien ', 0, 0, 'sebastien.aragon@butagaz.com', 'Aragon', NULL, '(3314) 639-3333', NULL, 0, 1, '92300', '47-53, Rue Raspail', 'Levallois-Perret', 105, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:29', NULL, NULL, NULL, 143, 'France'),
(239, 1, 'Kashifa Shaikh', '400401-32', 'Chris ', 0, 0, 'chris.callaghan@employmenthero.com', 'Callaghan', NULL, '(6128) 705-4700', NULL, 0, 1, '2000', 'Level 2, 441 Kent St., ', 'Sydney', 48, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:29', NULL, NULL, NULL, 142, 'Australia'),
(240, 1, 'Kashifa Shaikh', '400401-32', 'Jack ', 0, 0, 'jack.miller@employmenthero.com', 'Miller', NULL, '(6128) 705-4700', NULL, 0, 1, '2000', 'Level 2, 441 Kent St., ', 'Sydney', 48, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:29', NULL, NULL, NULL, 142, 'Australia'),
(241, 1, 'Kashifa Shaikh', '400401-32', 'Sarah ', 0, 0, 'sarah.topjian@employmenthero.com', 'Topjian', NULL, '(6128) 705-4700', NULL, 0, 1, '2000', 'Level 2, 441 Kent St., ', 'Sydney', 48, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:29', NULL, NULL, NULL, 142, 'Australia'),
(242, 1, 'Musaddique Shaikh', '400401-26', 'Leehee ', 0, 0, 'leeheeg@codevalue.net', 'Gerti', NULL, '(97274) 703-0232', NULL, 0, 1, '4673300', '12078, ת.ד.', 'Hahoshlim St 1', 106, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:29', NULL, NULL, NULL, 144, 'Israel'),
(243, 1, 'Kashifa Shaikh', '400401-32', 'Nick ', 0, 0, 'nick.bittcher@hometogo.com', 'Bittcher', NULL, '(49302) 084-7396', NULL, 0, 1, '10437', 'Sonnenburger Strasse 73', 'Berlin', 68, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:29', NULL, NULL, NULL, 65, 'Germany'),
(244, 1, 'Kashifa Shaikh', '400401-32', 'Emma ', 0, 0, 'emma.craggs@coopers.com.au', 'Craggs ', NULL, '(6188) 440-1800', NULL, 0, 1, '5010', '461 South Rd.,', 'Regency Park', 51, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:30', NULL, NULL, NULL, 145, 'Australia'),
(245, 1, 'Kashifa Shaikh', '400401-32', 'Lucy ', 0, 0, 'lucy.noblet@coopers.com.au', 'Noblet', NULL, '(6188) 440-1800', NULL, 0, 1, '5010', '461 South Rd.,', 'Regency Park', 51, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:30', NULL, NULL, NULL, 146, 'Australia'),
(246, 1, 'Faizan Shaikh', '400401-27', 'Jens ', 0, 0, 'jens.luik@blacklane.com', 'Luik', NULL, '(493020) 236-318', NULL, 0, 1, '10827', 'Feurigstrasse 59', 'Berlin ', 47, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:30', NULL, NULL, NULL, 36, 'Germany'),
(247, 1, 'Sakib Patni', '400401-29', 'Ronan ', 0, 0, 'ronan.scavennec@butagaz.com', 'Scavennec', NULL, '(3314) 639-3333', NULL, 0, 1, '92300', '47-53, Rue Raspail', 'Levallois-Perret', 105, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:30', NULL, NULL, NULL, 143, 'France'),
(248, 1, 'Kashifa Shaikh', '400401-32', 'Shane ', 0, 0, 'shane.rust@coopers.com.au', 'Rust', NULL, '(6188) 440-1800', NULL, 0, 1, '5010', '461 South Rd.,', 'Regency Park', 48, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:31', NULL, NULL, NULL, 147, 'Australia'),
(249, 1, 'Faizan Shaikh', '400401-27', 'Norbert ', 0, 0, 'norbert.richard@blacklane.com', 'Richard Meinike', NULL, '(493020) 236-318', NULL, 0, 1, '10827', 'Feurigstrasse 59', 'Berlin ', 65, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:31', NULL, NULL, NULL, 148, 'Germany'),
(250, 1, 'Kashifa Shaikh', '400401-32', 'Steve ', 0, 0, 'steve.mickan@coopers.com.au', 'Mickan', NULL, '(6188) 440-1800', NULL, 0, 1, '5010', '461 South Rd.,', 'Regency Park', 48, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:31', NULL, NULL, NULL, 147, 'Australia'),
(251, 1, 'Musaddique Shaikh', '400401-26', 'Ilana ', 0, 0, 'ilanag@codevalue.net', 'Glotman', NULL, '(97274) 703-0232', NULL, 0, 1, '4673300', '12078 ת.ד', 'Hahoshlim St 1,', 107, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:31', NULL, NULL, NULL, 149, 'Israel'),
(252, 1, 'Faizan Shaikh', '400401-27', 'Elvis ', 0, 0, 'elvis.zageris@blacklane.com', 'Zageris', NULL, '(493020) 236-318', NULL, 0, 1, '10827', 'Feurigstrasse 59', 'Berlin ', 47, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:31', NULL, NULL, NULL, 36, 'Germany'),
(253, 1, 'Kashifa Shaikh', '400401-32', 'Cam ', 0, 0, 'cam.pearce@coopers.com.au', 'Pearce', NULL, '(6188) 440-1800', NULL, 0, 1, '5010', '461 South Rd.,', 'Regency Park', 51, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:31', NULL, NULL, NULL, 146, 'Australia'),
(254, 1, 'Kaif Khan', '400401-19', 'Tanja ', 0, 0, 'tanja.hofmann@mixpanel.com', 'Hofmann', NULL, '(34888) 510-2370', NULL, 0, 1, '08018 ', 'Avinguda Diagonal, 211', 'Catalonia', 108, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:32', NULL, NULL, NULL, 150, 'Spain'),
(255, 1, 'Aishwariya Singh', '400401-17', 'Roos ', 0, 0, 'rcavanagh@emspay.eu', 'Cavanagh', NULL, '(3120) 660-3040', NULL, 0, 1, '1101 CN', 'Herikerbergweg 25', 'Amsterdam', 82, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:32', NULL, NULL, NULL, 151, 'Netherlands'),
(256, 1, 'Kaif Khan', '400401-24', 'Alessandro ', 0, 0, 'alessandro.mariani@lyreco.com', 'Mariani', NULL, '(3905) 238-1061', NULL, 0, 1, '29010 ', 'Via Maestri del Lavoro', 'Monticelli ', 109, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:32', NULL, NULL, NULL, 152, 'Italy'),
(257, 1, 'Amit Nimbalkar', '400401-28', 'Vishal ', 0, 0, 'vishal.varshney@taxfix.de', 'Varshney', NULL, '(49302) 555-9635', NULL, 0, 1, '10435', 'Schwedter Strasse 36A ', 'Berlin', 110, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:32', NULL, NULL, NULL, 153, 'Germany'),
(258, 1, 'Salman Shaikh', '400401-27', 'Tania ', 0, 0, 'tania.esposito@contentful.com', 'Esposito', NULL, '(493046) 726-094', NULL, 0, 1, '10969', 'Markgrafenstr. 12-14', 'Berlin Kreuzberg', 47, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:32', NULL, NULL, NULL, 154, 'Germany'),
(259, 1, 'Sahil Nadaf', '400401-22', 'Roy ', 0, 0, 'rhasson@liveu.tv', 'Hasson', NULL, '(81035) 484-7270', NULL, 0, 1, ' ‎108-0014', '4-4-12 Shiba,', 'Minato-ku,', 111, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:33', NULL, NULL, NULL, 155, 'Japan'),
(260, 1, 'Sahil Nadaf', '400401-22', 'Kumiko ', 0, 0, 'kumiko.cochran@tealium.com', 'Cochran', NULL, '(81501) 746-5130', NULL, 0, 1, '150-6139', 'Scramble Square, 39F, 2 Chome-24-12 Shibuya,', 'Shibuya City,', 112, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:33', NULL, NULL, NULL, 156, 'Japan'),
(261, 1, 'Wasiya Shaikh', '400401-21', 'Antonio Caro', 0, 0, 'antoniolazaro@axesor.es', 'Lazaro', NULL, '(3495) 875-0500', NULL, 0, 1, '18100', 'Calle Graham Bell', 'Granada', 81, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:33', NULL, NULL, NULL, 157, 'Spain'),
(262, 1, 'Prema Minj', '400401-23', 'Ashish', 0, 0, 'agupta@xoomenergy.com', 'Gupta', NULL, '(8112) 098-5232', NULL, 0, 1, '〒105-0013', '1-10-17 Hamamatsucho', 'Minato-ku ', 113, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:33', NULL, NULL, NULL, 158, 'Japan'),
(263, 1, 'Musaddique Shaikh', '400401-30', 'Claude ', 0, 0, 'claude.carvalho@galian.fr', 'Carvalho', NULL, '(3314) 495-2222', NULL, 0, 1, '75008', '89, rue La Boétie', 'Paris', 114, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:33', NULL, NULL, NULL, 159, 'France'),
(264, 1, 'Musaddique Shaikh', '400401-30', 'Gilles ', 0, 0, 'gilles.courvoisier@homeserve.fr', 'COURVOISIER', NULL, '(3317) 082-1769', NULL, 0, 1, '69007', '9 Rue Anna Marly', 'Lyon', 45, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:34', NULL, NULL, NULL, 117, 'France'),
(265, 1, 'Sahil Nadaf', '400401-22', 'Kenzo ', 0, 0, 'kenzo.sugawara@tealium.com', 'Sugawara', NULL, '(81501) 746-5130', NULL, 0, 1, '150-6139', 'Scramble Square, 39F, 2 Chome-24-12 Shibuya,', 'Shibuya City,', 111, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:34', NULL, NULL, NULL, 160, 'Japan'),
(266, 1, 'Sahil Nadaf', '400401-22', 'Hiroaki ', 0, 0, 'hiroaki.matsusaka@oyolife.co.jp', 'Matsusaka', NULL, '(81807) 074-1563', NULL, 0, 1, '107-0062', '5 Chome-1-10-206 Minamiaoyama, ', 'Minato City', 115, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:34', NULL, NULL, NULL, 161, 'Japan'),
(267, 1, 'Musaddique Shaikh', '400401-30', 'Céline ', 0, 0, 'celine.julieno@galian.fr', 'Julieno ', NULL, '(3314) 495-2222', NULL, 0, 1, '75008', '89, rue La Boétie', 'Paris', 116, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:34', NULL, NULL, NULL, 162, 'France'),
(268, 1, 'Sahil Nadaf', '400401-22', 'Christine', 0, 0, 'christine.wu@tripwire.com', 'Wu', NULL, '(8135) 206-8610', NULL, 0, 1, ' 103-0027', '1 Chome-12-8 Nihonbashi, ', 'Chuo City, ', 112, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:34', NULL, NULL, NULL, 163, 'Japan'),
(269, 1, 'Sakib Patni', '400401-22', 'Wataru ', 0, 0, 'wataru.ishida@ssyonline.com', 'Ishida', NULL, '(8136) 269-9515', NULL, 0, 1, '100-0006', 'Shin-Yurakucho Building 10 F 12-1 Yurakucho ', '1-chome Chiyoda-ku ', 117, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:35', NULL, NULL, NULL, 164, 'Japan'),
(270, 1, 'Faizan Shaikh', '400401-31', 'Rodolfo ', 0, 0, 'rodolfo@contabilizei.com.br', 'Ferraz', NULL, '(55413) 022-6004', NULL, 0, 1, '80250-000', 'R. Nunes Machado, 68 - 15 andar', 'Centro', 118, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:35', NULL, NULL, NULL, 165, 'Brazil'),
(271, 1, 'Musaddique Shaikh', '400401-30', 'Jerome ', 0, 0, 'louise.servois@galian.fr', 'Vieuille', NULL, '(3314) 495-2222', NULL, 0, 1, '75008', '89, rue La Boétie,', 'Paris', 119, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:35', NULL, NULL, NULL, 166, 'France'),
(272, 1, 'Sakib Patni', '400401-22', 'Takeshi ', 0, 0, 'takeshi.inaba@keenfootwear.com', 'Inaba', NULL, '(8135) 466-7350', NULL, 0, 1, '150-0001', '6 Chome-14-2 Jingumae', 'Shibuya ', 111, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:35', NULL, NULL, NULL, 167, 'Japan'),
(273, 1, 'Prema Minj', '400401-23', 'Kenton ', 0, 0, 'kruff@proactiv.com', 'Ruff', NULL, '(8135) 433-5381', NULL, 0, 1, '141-0021', '3-5-8, KAMIOSAKI', 'SHINAGAWA-KU -', 112, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:35', NULL, NULL, NULL, 168, 'Japan'),
(274, 1, 'Sakib Patni', '400401-22', 'Shogo ', 0, 0, 'shogo_harada@altiostar.com', 'Harada', NULL, '(855) 709-0701', NULL, 0, 1, '106-0045', '2-8-8-602 Azabujuban', 'Minato-ku', 120, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:36', NULL, NULL, NULL, 169, 'Japan'),
(275, 1, 'Sakib Patni', '400401-22', 'Tuna ', 0, 0, 'tuna.kildis@venaenergy.com', 'Kildis', NULL, '(8136) 452-9777', NULL, 0, 1, '105-0001', 'Toranomon Towers Office 14F 4-1-28 Toranomon', 'Minato-ku', 120, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:36', NULL, NULL, NULL, 170, 'Japan'),
(276, 1, 'Prema Minj', '400401-23', 'Takashi ', 0, 0, 'ttaniyama@proactiv.com', 'Taniyama', NULL, '(8135) 433-5381', NULL, 0, 1, '141-0021', '3-5-8, KAMIOSAKI', ' SHINAGAWA-KU', 113, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:37', NULL, NULL, NULL, 171, 'Japan'),
(277, 1, 'Amit Nimbalkar', '400401-28', 'Marissa ', 0, 0, 'marissa.mocenigo@taxfix.de', 'Mocenigo', NULL, '(49302) 555-9635', NULL, 0, 1, '10435', 'Schwedter Strasse 36A ', 'Berlin', 110, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:37', NULL, NULL, NULL, 153, 'Germany'),
(278, 1, 'Faizan Shaikh', '400401-31', 'Jonathan ', 0, 0, 'jonathan@contabilizei.com.br', 'Souza', NULL, '(55413) 022-6004', NULL, 0, 1, '80250-000', 'R. Nunes Machado, 68 - 15 andar', 'Centro', 118, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:37', NULL, NULL, NULL, 165, 'Brazil'),
(279, 1, 'Wasiya Shaikh', '400401-21', 'Laura ', 0, 0, 'lauramoyano@kenes.com', 'Moyano', NULL, '(3491) 361-2600', NULL, 0, 1, '28028 ', 'Calle de Eraso, 36', 'Madrid', 121, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:37', NULL, NULL, NULL, 172, 'Spain'),
(280, 1, 'Wasiya Shaikh', '400401-21', 'Lolita ', 0, 0, 'lolitabizune@kenes.com', 'Bizune', NULL, '(3491) 361-2600', NULL, 0, 1, '28028 ', 'Calle de Eraso, 36', 'Madrid', 122, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:37', NULL, NULL, NULL, 173, 'Spain'),
(281, 1, 'Wasiya Shaikh', '400401-21', 'Maria Jose', 0, 0, 'mjsalmoreno@kenes.com', 'Salido Moreno', NULL, '(3491) 361-2600', NULL, 0, 1, '28028 ', 'Calle de Eraso, 36', 'Madrid', 123, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:38', NULL, NULL, NULL, 174, 'Spain'),
(282, 1, 'Wasiya Shaikh', '400401-21', 'Alexandra ', 0, 0, 'aexandraboriceanu@kenes.com', 'Boriceanu', NULL, '(3491) 361-2600', NULL, 0, 1, '28028 ', 'Calle de Eraso, 36', 'Madrid', 124, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:38', NULL, NULL, NULL, 175, 'Spain'),
(283, 1, 'Wasiya Shaikh', '400401-21', 'Francisco ', 0, 0, 'franciscocrespo@kenes.com', 'Fernandez Crespo', NULL, '(3491) 361-2600', NULL, 0, 1, '28028 ', 'Calle de Eraso, 36', 'Madrid', 125, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:38', NULL, NULL, NULL, 176, 'Spain'),
(284, 1, 'Kashifa Shaikh', '400401-20', 'Raul Berjillos', 0, 0, 'rsoriano@semantic-systems.com', 'Soriano', NULL, '(3494) 454-5550', NULL, 0, 1, '48160', 'Avda. Txorierri, 9 - 2º, ', 'Derio', 126, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:39', NULL, NULL, NULL, 177, 'Spain'),
(285, 1, 'Kashifa Shaikh', '400401-20', 'Rogelio Heredia', 0, 0, 'rbravo@semantic-systems.com', 'Bravo', NULL, '(3494) 454-5550', NULL, 0, 1, '48160', 'Avda. Txorierri, 9 - 2º,', 'Derio', 126, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:39', NULL, NULL, NULL, 177, 'Spain'),
(286, 1, 'Kashifa Shaikh', '400401-20', 'José Ramón', 0, 0, 'jbelio@semantic-systems.com', 'Valle Belio', NULL, '(3494) 454-5550', NULL, 0, 1, '48160', 'Avda. Txorierri, 9 - 2º, ', 'Derio', 127, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:39', NULL, NULL, NULL, 178, 'Spain'),
(287, 1, 'Amit Nimbalkar', '400401-16', 'Ingrid ', 0, 0, 'ingrid.minuscoli@albelli.com', 'Minuscoli', NULL, '(3120) 708-3513', NULL, 0, 1, '2497 GB', 'Laan van Ypenburg 34-38', 'Den Haag', 80, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:39', NULL, NULL, NULL, 107, 'Netherlands'),
(288, 1, 'Kashifa Shaikh', '400401-20', 'Hector ', 0, 0, 'hector.rabellino@multisafepay.com', 'Rabellino', NULL, '(3491) 123-0486', NULL, 0, 1, '29688 ', 'Edificio Altair, Office 201,', 'El Paraíso', 81, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:39', NULL, NULL, NULL, 179, 'Spain'),
(289, 1, 'Faizan Shaikh', '400401-31', 'Laerte ', 0, 0, 'laerte.piva@synchro.com.br', 'Piva', NULL, '(55213) 812-7900', NULL, 0, 1, '04576-060', 'R. Samuel Morse, 74', 'Cidade Monções', 128, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:40', NULL, NULL, NULL, 180, 'Brazil'),
(290, 1, 'Kashifa Shaikh', '400401-20', 'Philippe ', 0, 0, 'philippe.devydt@multisafepay.com', 'De Vydt', NULL, '(3491) 123-0486', NULL, 0, 1, '29688 ', 'Edificio Altair, Office 201,', 'El Paraíso', 81, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:40', NULL, NULL, NULL, 179, 'Spain'),
(291, 1, 'Amit Nimbalkar', '400401-28', 'Krzysztof ', 0, 0, 'krzysztof@taxfix.de', 'Hadas', NULL, '(49302) 555-9635', NULL, 0, 1, '10435', 'Schwedter Strasse 36A ', 'Berlin', 110, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:40', NULL, NULL, NULL, 153, 'Germany'),
(292, 1, 'Faizan Shaikh', '400401-31', 'Ricardo ', 0, 0, 'ricardo@digitro.com', 'Saito', NULL, '(55483) 281-7000', NULL, 0, 1, '88080-170', 'R. Álvaro Tolentino, 1680', 'Capoeiras', 129, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:40', NULL, NULL, NULL, 181, 'Brazil'),
(293, 1, 'Kashifa Shaikh', '400401-20', 'Matthieu ', 0, 0, 'mlaville@worldsensing.com', 'Laville', NULL, '(3493) 418-0585', NULL, 0, 1, '8014', 'Viriat, 47 10th Fl.', 'Barcelona', 130, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:41', NULL, NULL, NULL, 182, 'Spain'),
(294, 1, 'Amit Nimbalkar', '400401-28', 'Jan ', 0, 0, 'hertzke@fidor.de', 'Hertzke', NULL, '(498918) 908-523', NULL, 0, 1, '80335', 'Sandstr. 33', 'Munich', 47, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:41', NULL, NULL, NULL, 183, 'Germany'),
(295, 1, 'Kashifa Shaikh', '400401-20', 'Juan ', 0, 0, 'jlopez@worldsensing.com', 'Manuel Lopez', NULL, '(3493) 418-0585', NULL, 0, 1, '8014', 'Viriat, 47 10th Fl.', 'Barcelona', 131, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:41', NULL, NULL, NULL, 184, 'Spain'),
(296, 1, 'Amit Nimbalkar', '400401-28', 'Sibylle ', 0, 0, 'ploch@fidor.de', 'Ploch', NULL, '(498918) 908-523', NULL, 0, 1, '80335', 'Sandstr. 33', 'Munich', 65, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:41', NULL, NULL, NULL, 185, 'Germany'),
(297, 1, 'Kashifa Shaikh', '400401-20', 'Julia ', 0, 0, 'jade@worldsensing.com', 'Ade', NULL, '(3493) 418-0585', NULL, 0, 1, '8014', 'Viriat, 47 10th Fl.', 'Barcelona', 132, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:41', NULL, NULL, NULL, 186, 'Spain'),
(298, 1, 'Amit Nimbalkar', '400401-28', 'Isabelle ', 0, 0, 'isabelle.eyrich@brandmaker.com', 'Eyrich', NULL, '(497219) 779-100', NULL, 0, 1, '76137 ', 'Rüppurrer Str. 1', 'Karlsruhe', 47, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:42', NULL, NULL, NULL, 187, 'Germany'),
(299, 1, 'Faizan Shaikh', '400401-31', 'Cesar ', 0, 0, 'cesar.ortega@cromex.com.br', 'Ortega', NULL, '(5580) 017-9400', NULL, 0, 1, '05038-130', 'Rua Francisco Corazza, 83', 'Barra Funda', 118, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:42', NULL, NULL, NULL, 188, 'Brazil'),
(300, 1, 'Prema Minj', '400401-23', 'Daisuke ', 0, 0, 'daisuke.kitamoto@partnerize.com', 'Kitamoto', NULL, '(8112) 098-5232', NULL, 0, 1, '141-0021', 'PMO Hirakawa-cho 7', 'Hirakawa-cho', 111, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:42', NULL, NULL, NULL, 189, 'Japan'),
(301, 1, 'Amit Nimbalkar', '400401-28', 'Dunja ', 0, 0, 'dunja.riehemann@brandmaker.com', 'Riehemann', NULL, '(497219) 779-100', NULL, 0, 1, '76137 ', 'Rüppurrer Str. 1', 'Karlsruhe', 65, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:42', NULL, NULL, NULL, 190, 'Germany'),
(302, 1, 'Kashifa Shaikh', '400401-20', 'Jesus ', 0, 0, 'jbarrachina@worldsensing.com', 'Barrachina ', NULL, '(3493) 418-0585', NULL, 0, 1, '8014', 'Viriat, 47 10th Fl.', 'Barcelona', 133, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:42', NULL, NULL, NULL, 191, 'Spain'),
(303, 1, 'Kashifa Shaikh', '400401-20', 'Manel ', 0, 0, 'mfradera@worldsensing.com', 'Fradera', NULL, '(3493) 418-0585', NULL, 0, 1, '8014', 'Viriat, 47 10th Fl.', 'Barcelona', 134, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:43', NULL, NULL, NULL, 192, 'Spain'),
(304, 1, 'Amit Nimbalkar', '400401-16', 'Jelle ', 0, 0, 'jelle.quint@albelli.com', 'Quint', NULL, '(3120) 708-3513', NULL, 0, 1, '2497 GB', 'Laan van Ypenburg 34-38', 'Den Haag', 63, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:43', NULL, NULL, NULL, 193, 'Netherlands'),
(305, 1, 'Kaif Khan', '400401-19', 'Carlos ', 0, 0, 'carlos.larrea@innova-tsn.com', 'Larrea ', NULL, '(3491) 513-0073', NULL, 0, 1, '28020 ', 'Calle de Orense', 'Orense', 81, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:43', NULL, NULL, NULL, 194, 'Spain'),
(306, 1, 'Kaif Khan', '400401-19', 'Nuria ', 0, 0, 'nuria.estebas@innova-tsn.com', 'Estebas ', NULL, '(3491) 513-0073', NULL, 0, 1, '28020 ', 'Calle de Orense', 'Orense', 81, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:43', NULL, NULL, NULL, 194, 'Spain'),
(307, 1, 'Musaddique Shaikh', '400401-18', 'Madeleine ', 0, 0, 'madeleine.lassoued@m.co', 'Lassoued', NULL, '(4685) 809-7454', NULL, 0, 1, ' 111 44', 'Jakobsbergsgatan 17', 'Stockholm', 135, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:44', NULL, NULL, NULL, 195, 'Sweden'),
(308, 1, 'Kashifa Shaikh', '400401-20', 'Esther ', 0, 0, 'ecastanos@worldsensing.com', 'Castaños', NULL, '(3493) 418-0585', NULL, 0, 1, '8014', 'Viriat, 47 10th Fl.', 'Barcelona', 136, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:45', NULL, NULL, NULL, 196, 'Spain'),
(309, 1, 'Prema Minj', '400401-23', 'Hiromi ', 0, 0, 'hiromi.chiyokubo@partnerize.com', 'Chiyokubo', NULL, '(8112) 098-5232', NULL, 0, 1, '141-0021', 'PMO Hirakawa-cho 7F, 2-7-3', 'Hirakawa-cho', 137, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:45', NULL, NULL, NULL, 197, 'Japan'),
(310, 1, 'Kashifa Shaikh', '400401-20', 'Jennifer ', 0, 0, 'jharth@worldsensing.com', 'Harth', NULL, '(3493) 418-0585', NULL, 0, 1, '8014', 'Viriat, 47 10th Fl.', 'Barcelona', 138, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:45', NULL, NULL, NULL, 198, 'Spain'),
(311, 1, 'Musaddique Shaikh', '400401-30', 'Steve ', 0, 0, 'steve.martinez@prolival.fr', 'MARTINEZ', NULL, '(3314) 143-0840', NULL, 0, 1, '92700', '420 rue d\'Estienne d\'Orves', 'Colombes', 139, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:46', NULL, NULL, NULL, 199, 'France'),
(312, 1, 'Kaif Khan', '400401-19', 'Guillaume', 0, 0, 'glaban@denodo.com', 'Laban', NULL, '(3491) 277-5855', NULL, 0, 1, '28014 ', 'C/ Montalbán', 'Madrid', 81, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:46', NULL, NULL, NULL, 200, 'Spain'),
(313, 1, 'Aishwariya Singh', '400401-17', 'Joost', 0, 0, 'j.margry@afprofilters.com', 'Margry', NULL, '(3172) 567-5500', NULL, 0, 1, '1822 BN', 'Berenkoog 67', 'Alkmaar', 77, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:46', NULL, NULL, NULL, 201, 'Netherlands'),
(314, 1, 'Prema Minj', '400401-23', 'Yuhei ', 0, 0, 'yuhei.yamagishi@partnerize.com', 'Yamagishi', NULL, '(8112) 098-5232', NULL, 0, 1, '141-0021', 'PMO Hirakawa-cho 7F, 2-7-3', 'Hirakawa-cho', 111, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:46', NULL, NULL, NULL, 189, 'Japan'),
(315, 1, 'Kaif Khan', '400401-19', 'Tatiana ', 0, 0, 'tosuna@denodo.com', 'Osuna', NULL, '(3491) 277-5855', NULL, 0, 1, '28014 ', 'C/ Montalbán', 'Madrid', 81, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:46', NULL, NULL, NULL, 200, 'Spain'),
(316, 1, 'Musaddique Shaikh', '400401-30', 'Alice ', 0, 0, 'alice.adaine@prolival.fr', 'ADAINE', NULL, '(3314) 143-0840', NULL, 0, 1, '92700', '420 rue d\'Estienne d\'Orves, ', 'Colombes', 139, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:46', NULL, NULL, NULL, 199, 'France'),
(317, 1, 'Kashifa Shaikh', '400401-32', 'Jules ', 0, 0, 'jdilizia@tobysestate.com.au', 'Dilizia', NULL, '(6129) 112-1131', NULL, 0, 1, '2008', ' 32-36 City Rd', 'Chippendale ', 48, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:46', NULL, NULL, NULL, 202, 'Australia'),
(318, 1, 'Amit Nimbalkar', '400401-16', 'Miranda ', 0, 0, 'miranda.spaans@quion.com', 'Spaans', NULL, '(3188) 224-8000', NULL, 0, 1, '3531 AH', 'Graadt van Roggenweg 500', 'Utrecht', 80, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:46', NULL, NULL, NULL, 203, 'Netherlands'),
(319, 1, 'Kaif Khan', '400401-19', 'Belen ', 0, 0, 'bzorrilla@denodo.com', 'Zorrilla', NULL, '(3491) 277-5855', NULL, 0, 1, '28014 ', 'C/ Montalbán', 'Madrid', 79, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:47', NULL, NULL, NULL, 204, 'Spain'),
(320, 1, 'Kaif Khan', '400401-19', 'Stefano', 0, 0, 'scruciani@denodo.com', 'Cruciani', NULL, '(3491) 277-5855', NULL, 0, 1, '28014 ', 'C/ Montalbán', 'Madrid', 79, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:47', NULL, NULL, NULL, 204, 'Spain'),
(321, 1, 'Kashifa Shaikh', '400401-32', 'Brianna ', 0, 0, 'bwheeler@tobysestate.com.au', 'Wheeler', NULL, '(6129) 112-1131', NULL, 0, 1, '2008', '32-36 City Rd', 'Chippendale', 89, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:47', NULL, NULL, NULL, 205, 'Australia'),
(322, 1, 'Kaif Khan', '400401-19', 'Zuzanna ', 0, 0, 'zwojciechowska@denodo.com', 'Wojciechowska', NULL, '(3491) 277-5855', NULL, 0, 1, '28014 ', 'C/ Montalbán', 'Madrid', 79, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:47', NULL, NULL, NULL, 204, 'Spain'),
(323, 1, 'Musaddique Shaikh', '400401-30', 'Benoît ', 0, 0, 'benoit.gilles@prolival.fr', 'Gilles', NULL, '(3314) 143-0840', NULL, 0, 1, '92700', '420 rue d\'Estienne d\'Orves', 'Colombes', 139, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:47', NULL, NULL, NULL, 199, 'France'),
(324, 1, 'Kashifa Shaikh', '400401-32', 'Duke ', 0, 0, 'duke@tobysestate.com.au', 'Vonggaveesakul', NULL, '(6129) 112-1131', NULL, 0, 1, '2008', '32-36 City Rd', 'Chippendale', 48, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:47', NULL, NULL, NULL, 206, 'Australia'),
(325, 1, 'Kashifa Shaikh', '400401-32', 'Sebastien', 0, 0, 'sherve@tobysestate.com.au', 'Herve', NULL, '(6129) 112-1131', NULL, 0, 1, '2008', '32-36 City Rd', 'Chippendale', 48, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:48', NULL, NULL, NULL, 206, 'Australia'),
(326, 1, 'Musaddique Shaikh', '400401-30', 'Anthony ', 0, 0, 'anthony.allier@prolival.fr', 'Allier', NULL, '(3314) 143-0840', NULL, 0, 1, '92700', '420 rue d\'Estienne d\'Orves, ', 'Colombes', 139, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:48', NULL, NULL, NULL, 199, 'France'),
(327, 1, 'Kashifa Shaikh', '400401-32', 'Heather ', 0, 0, 'heather@tobysestate.com.au', 'Sheppard', NULL, '(6129) 112-1131', NULL, 0, 1, '2008', '32-36 City Rd', 'Chippendale', 140, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:48', NULL, NULL, NULL, 207, 'Australia'),
(328, 1, 'Amit Nimbalkar', '400401-16', 'Tim ', 0, 0, 'tim.beekhuijzen@quion.com', 'Beekhuijzen', NULL, '(3188) 224-8000', NULL, 0, 1, '3531 AH', 'Graadt van Roggenweg 500', 'Utrecht', 74, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:48', NULL, NULL, NULL, 208, 'Netherlands'),
(329, 1, 'Musaddique Shaikh', '400401-30', 'Jonnas ', 0, 0, 'jonnas.khov@prolival.fr', 'Khov', NULL, '(3314) 143-0840', NULL, 0, 1, '92700', '420 rue d\'Estienne d\'Orves', 'Colombes', 139, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:48', NULL, NULL, NULL, 199, 'France'),
(330, 1, 'Kashifa Shaikh', '400401-32', 'Meredith ', 0, 0, 'meredith@tobysestate.com.au', 'Young', NULL, '(6129) 112-1131', NULL, 0, 1, '2008', '32-36 City Rd', 'Chippendale', 51, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:48', NULL, NULL, NULL, 209, 'Australia'),
(331, 1, 'Kashifa Shaikh', '400401-32', 'Stephanie ', 0, 0, 'stephanie@tobysestate.com.au', 'Degiorgio', NULL, '(6129) 112-1131', NULL, 0, 1, '2008', '32-36 City Rd', 'Chippendale', 49, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:49', NULL, NULL, NULL, 210, 'Australia'),
(332, 1, 'Faizan Shaikh', '400401-31', 'Alexandre ', 0, 0, 'alexandre.tuxen@comerc.com.br', 'Tuxen', NULL, '(55113) 508-3688', NULL, 0, 1, '04543-907', 'Torre Norte - Avenida Presidente Juscelino Kubitschek, 1909 São Paulo Corporate Towers, 21 Andar', 'Vila Nova Conceição', 118, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:49', NULL, NULL, NULL, 211, 'Brazil'),
(333, 1, 'Kashifa Shaikh', '400401-32', 'Robert ', 0, 0, 'robert.carr@rokt.com', 'Carr', NULL, '(6128) 920-1130', NULL, 0, 1, '2010', 'Level 13/300 Elizabeth St', 'Surry Hills', 48, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:49', NULL, NULL, NULL, 212, 'Australia'),
(334, 1, 'Faizan Shaikh', '400401-31', 'Cleber ', 0, 0, 'cleber.buosi@comerc.com.br', 'Buosi', NULL, '(55113) 508-3688', NULL, 0, 1, '04543-907', 'Torre Norte - Avenida Presidente Juscelino Kubitschek, 1909 São Paulo Corporate Towers, 21 Andar', 'Vila Nova Conceição', 118, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:49', NULL, NULL, NULL, 211, 'Brazil'),
(335, 1, 'Kashifa Shaikh', '400401-32', 'Blake ', 0, 0, 'blake.watkinson@rokt.com', 'Watkinson', NULL, '(6128) 920-1130', NULL, 0, 1, '2010', 'Level 13/300 Elizabeth St', 'Surry Hills', 48, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:49', NULL, NULL, NULL, 213, 'Australia'),
(336, 1, 'Kashifa Shaikh', '400401-32', 'Dawshiek ', 0, 0, 'dawshiek.yogathasar@rokt.com', 'Yogathasar', NULL, '(6128) 920-1130', NULL, 0, 1, '2010', 'Level 13/300 Elizabeth St', 'Surry Hills', 141, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:49', NULL, NULL, NULL, 214, 'Australia'),
(337, 1, 'Kashifa Shaikh', '400401-32', 'Tobias ', 0, 0, 'tobias.fielitz@rokt.com', 'Fielitz', NULL, '(6128) 920-1130', NULL, 0, 1, '2010', 'Level 13/300 Elizabeth St', 'Surry Hills', 141, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:50', NULL, NULL, NULL, 214, 'Australia'),
(338, 1, 'Kashifa Shaikh', '400401-32', 'Neil', 0, 0, 'neil.mccoy@rokt.com', 'Mccoy', NULL, '(6128) 920-1130', NULL, 0, 1, '2010', 'Level 13/300 Elizabeth St', 'Surry Hills', 141, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:50', NULL, NULL, NULL, 214, 'Australia'),
(339, 1, 'Prema Minj', '400401-23', 'Kosuke ', 0, 0, 'kosuke.nakajima@tac-club.org', 'Nakajima', NULL, '(8134) 588-0381', NULL, 0, 1, '106-0041', '2 Chome-1-2 Azabudai,', 'Minato City', 111, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:50', NULL, NULL, NULL, 215, 'Japan'),
(340, 1, 'Amit Nimbalkar', '400401-16', 'Simon ', 0, 0, 'simon.hof@quion.com', 'Hof', NULL, '(3188) 224-8000', NULL, 0, 1, '3531 AH', 'Graadt van Roggenweg 500', 'Utrecht', 63, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:50', NULL, NULL, NULL, 216, 'Netherlands'),
(341, 1, 'Prema Minj', '400401-23', 'Naoto ', 0, 0, 'naoto.okutsu@tac-club.org', 'Nakajima', NULL, '(8134) 588-0381', NULL, 0, 1, '106-0041', ' 2 Chome-1-2 Azabudai', 'Minato City', 137, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:50', NULL, NULL, NULL, 217, 'Japan'),
(342, 1, 'Wasiya Shaikh', '400401-21', 'Jacobo Alvarez', 0, 0, 'jacobo@domestika.org', 'Naveiro', NULL, '(3461) 899-4031', NULL, 0, 1, '28046 ', ' Paseo de la Castellana, 171', 'madrid', 142, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:51', NULL, NULL, NULL, 218, 'Spain'),
(343, 1, 'Wasiya Shaikh', '400401-21', 'Eli ', 0, 0, 'eli@domestika.org', 'Boveda', NULL, '(3461) 899-4031', NULL, 0, 1, '28046 ', ' Paseo de la Castellana, 171', 'madrid', 79, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:52', NULL, NULL, NULL, 219, 'Spain'),
(344, 1, 'Wasiya Shaikh', '400401-21', 'Albert ', 0, 0, 'albert.canete@domestika.org', 'Canete', NULL, '(3461) 899-4031', NULL, 0, 1, '28046 ', ' Paseo de la Castellana, 171', 'madrid', 73, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:52', NULL, NULL, NULL, 220, 'Spain'),
(345, 1, 'Kaif Khan', '400401-19', 'Tammie ', 0, 0, 'tcoles@denodo.com', 'Coles', NULL, '(3491) 277-5855', NULL, 0, 1, '28014 ', 'C/ Montalbán', 'Madrid', 81, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:52', NULL, NULL, NULL, 200, 'Spain'),
(346, 1, 'Kaif Khan', '400401-19', 'Daniel ', 0, 0, 'dcomino@denodo.com', 'Lucendo', NULL, '(3491) 277-5855', NULL, 0, 1, '28014 ', 'C/ Montalbán', 'Madrid', 81, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:52', NULL, NULL, NULL, 200, 'Spain'),
(347, 1, 'Kaif Khan', '400401-19', 'Mireia ', 0, 0, 'mireia.marimon@lacer.es', 'Marimon', NULL, '(3493) 446-5300', NULL, 0, 1, '08025 ', 'Carrer de Sardenya', 'Barcelona', 143, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:52', NULL, NULL, NULL, 221, 'Spain'),
(348, 1, 'Wasiya Shaikh', '400401-21', 'Maravillas Alfocea', 0, 0, 'maravillas@domestika.org', 'Ciudad', NULL, '(3461) 899-4031', NULL, 0, 1, '28046 ', ' Paseo de la Castellana, 171', 'madrid', 108, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:53', NULL, NULL, NULL, 222, 'Spain'),
(349, 1, 'Faizan Shaikh', '400401-31', 'Carlos ', 0, 0, 'carlos.almeida@service.com.br', 'Almeida', NULL, '(55115) 056-8308', NULL, 0, 1, '04711-904', 'R. Arquiteto Olavo Redig de Campos, 105', 'Chácara Santo Antônio', 118, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:53', NULL, NULL, NULL, 223, 'Brazil'),
(350, 1, 'Kaif Khan', '400401-19', 'Laura ', 0, 0, 'laura.longan@lacer.es', 'Longán', NULL, '(3493) 446-5300', NULL, 0, 1, '08025 ', 'Carrer de Sardenya', 'Barcelona', 144, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:53', NULL, NULL, NULL, 224, 'Spain'),
(351, 1, 'Faizan Shaikh', '400401-31', 'Luigi ', 0, 0, 'luigi.filippozzi@service.com.br', 'Filippozzi', NULL, '(55115) 056-8308', NULL, 0, 1, '04711-904', 'R. Arquiteto Olavo Redig de Campos, 105', 'Chácara Santo Antônio', 118, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:53', NULL, NULL, NULL, 223, 'Brazil'),
(352, 1, 'Sakib Patni', '400401-22', 'Yoshiki ', 0, 0, 'yoshiki.mogi@venaenergy.com', 'Mogi', NULL, '(8136) 452-9777', NULL, 0, 1, '105-0001', 'Toranomon Towers Office 14F 4-1-28 Toranomon', 'Minato-ku', 113, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:53', NULL, NULL, NULL, 225, 'Japan'),
(353, 1, 'Kaif Khan', '400401-19', 'Marc ', 0, 0, 'marc.alvarez@lacer.es', 'Alvarez', NULL, '(3493) 446-5300', NULL, 0, 1, '08025 ', 'Carrer de Sardenya', 'Barcelona', 144, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:54', NULL, NULL, NULL, 224, 'Spain'),
(354, 1, 'Sakib Patni', '400401-22', 'Yumi ', 0, 0, 'yumi.murakami@venaenergy.com', 'Murakami', NULL, '(8136) 452-9777', NULL, 0, 1, '105-0001', 'Toranomon Towers Office 14F 4-1-28 Toranomon', 'Minato-ku', 145, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:55', NULL, NULL, NULL, 226, 'Japan'),
(355, 1, 'Amit Nimbalkar', '400401-16', 'Madelon ', 0, 0, 'madelon.snel@quion.com', 'Snel', NULL, '(3188) 224-8000', NULL, 0, 1, '3531 AH', 'Graadt van Roggenweg 500', 'Utrecht', 82, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:55', NULL, NULL, NULL, 227, 'Netherlands'),
(356, 1, 'Sakib Patni', '400401-22', 'Andres Lopez', 0, 0, 'andres.lopez@venaenergy.com', 'Arenas', NULL, '(8136) 452-9777', NULL, 0, 1, '105-0001', 'Toranomon Towers Office 14F 4-1-28 Toranomon', 'Minato-ku', 120, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:55', NULL, NULL, NULL, 170, 'Japan'),
(357, 1, 'Sakib Patni', '400401-22', 'Kenichiro ', 0, 0, 'kenichiro.kobori@venaenergy.com', 'Kobori', NULL, '(8136) 452-9777', NULL, 0, 1, '105-0001', 'Toranomon Towers Office 14F 4-1-28 Toranomon', 'Minato-ku', 113, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:55', NULL, NULL, NULL, 225, 'Japan'),
(358, 1, 'Salman Shaikh', '400401-22', 'Yukie ', 0, 0, 'yukie.nishijima@beaconcom.co.jp', 'Nishijima', NULL, '(8135) 437-7200', NULL, 0, 1, '141-0021', '3 Chome-1-1 Kamiosaki', 'Shinagawa City', 137, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:55', NULL, NULL, NULL, 228, 'Japan'),
(359, 1, 'Salman Shaikh', '400401-22', 'Misa ', 0, 0, 'misa.akimoto@beaconcom.co.jp', 'Akimoto', NULL, '(8135) 437-7200', NULL, 0, 1, '141-0021', '3 Chome-1-1 Kamiosaki', 'Shinagawa City', 145, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:55', NULL, NULL, NULL, 229, 'Japan'),
(360, 1, 'Kaif Khan', '400401-19', 'Marc ', 0, 0, 'marc.arboles@lacer.es', 'Arboles', NULL, '(3493) 446-5300', NULL, 0, 1, '08025 ', 'Carrer de Sardenya', 'Barcelona', 146, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:31:55', NULL, NULL, NULL, 230, 'Spain'),
(361, 1, 'Salman Shaikh', '400401-22', 'Takashi', 0, 0, 'takashi@cybereason.com', 'Konno', NULL, '(8136) 889-2199', NULL, 0, 1, '105-0021', '1 Chome-9-2 Sumitomo Shiodome Building 27F', 'Minato City', 112, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:56', NULL, NULL, NULL, 231, 'Japan'),
(362, 1, 'Salman Shaikh', '400401-22', 'Seiya ', 0, 0, 'seiya@cybereason.com', 'Tanaka', NULL, '(8136) 889-2199', NULL, 0, 1, '105-0021', '1 Chome-9-2 Sumitomo Shiodome Building 27F', 'Minato City', 111, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:56', NULL, NULL, NULL, 232, 'Japan'),
(363, 1, 'Salman Shaikh', '400401-22', 'Yoshinobu', 0, 0, 'yoshinobu@cybereason.com', 'Kasuya', NULL, '(8136) 889-2199', NULL, 0, 1, '105-0021', '1 Chome-9-2 Sumitomo Shiodome Building 27F', 'Minato City', 111, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:56', NULL, NULL, NULL, 232, 'Japan'),
(364, 1, 'Salman Shaikh', '400401-22', 'Sean', 0, 0, 'sean@cybereason.com', 'Mooney', NULL, '(8136) 889-2199', NULL, 0, 1, '105-0021', '1 Chome-9-2 Sumitomo Shiodome Building 27F', 'Minato City', 112, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:56', NULL, NULL, NULL, 231, 'Japan'),
(365, 1, 'Amit Nimbalkar', '400401-16', 'Ellie ', 0, 0, 'ellie.pijlman@solvinity.com', 'Pijlman', NULL, '(3120) 364-3600', NULL, 0, 1, '3821 BT', 'Displayweg 16-18', 'Amersfoort', 46, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:56', NULL, NULL, NULL, 35, 'Netherlands'),
(366, 1, 'Amit Nimbalkar', '400401-28', 'Steffen ', 0, 0, 'steffen.zieger@brandmaker.com', 'Zieger', NULL, '(497219) 779-100', NULL, 0, 1, '76137 ', 'Rüppurrer Str. 1', 'Karlsruhe', 65, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:56', NULL, NULL, NULL, 190, 'Germany'),
(367, 1, 'Amit Nimbalkar', '400401-28', 'Rudolf ', 0, 0, 'rgeiger@newstore.com', 'Geiger', NULL, '(49800) 724-3133', NULL, 0, 1, '10785 ', 'NewStore, Inc', 'Berlin', 47, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:56', NULL, NULL, NULL, 233, 'Germany'),
(368, 1, 'Amit Nimbalkar', '400401-16', 'Otto ', 0, 0, 'otto.strijker@solvinity.com', 'Strijker', NULL, '(3120) 364-3600', NULL, 0, 1, '3821 BT', 'Displayweg 16-18', 'Amersfoort', 46, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:57', NULL, NULL, NULL, 35, 'Netherlands'),
(369, 1, 'Kaif Khan', '400401-19', 'Oscar ', 0, 0, 'oscar.prieto@lacer.es', 'Prieto', NULL, '(3493) 446-5300', NULL, 0, 1, '08025 ', 'Carrer de Sardenya', 'Barcelona', 144, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:57', NULL, NULL, NULL, 224, 'Spain'),
(370, 1, 'Wasiya Shaikh', '400401-21', 'Roberta ', 0, 0, 'roberta.barone@jumbotours.com', 'Barone', NULL, '(3497) 121-1100', NULL, 0, 1, '7009', 'Calle Gran VIA Asima, 4,', 'Palma', 81, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:57', NULL, NULL, NULL, 234, 'Spain'),
(371, 1, 'Kaif Khan', '400401-19', 'Oscar ', 0, 0, 'ovierge@unitronics.es', 'Vierge ', NULL, '(3490) 210-7670', NULL, 0, 1, '28037 ', 'Calle de Albasanz', 'Covibar', 81, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:57', NULL, NULL, NULL, 235, 'Spain'),
(372, 1, 'Wasiya Shaikh', '400401-21', 'Manuel ', 0, 0, 'manuel.bosch@jumbotours.com', 'Bosch', NULL, '(3497) 121-1100', NULL, 0, 1, '7009', 'Calle Gran VIA Asima, 4,', 'Palma', 142, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:57', NULL, NULL, NULL, 236, 'Spain'),
(373, 1, 'Amit Nimbalkar', '400401-16', 'Onno ', 0, 0, 'onno.welling@solvinity.com', 'Welling', NULL, '(3120) 364-3600', NULL, 0, 1, '3821 BT', 'Displayweg 16-18', 'Amersfoort', 46, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:58', NULL, NULL, NULL, 35, 'Netherlands'),
(374, 1, 'Wasiya Shaikh', '400401-21', 'Gianluca ', 0, 0, 'gianluca.marrone@jumbotours.com', 'Marrone', NULL, '(3497) 121-1100', NULL, 0, 1, '7009', 'Calle Gran VIA Asima, 4,', 'Palma', 81, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:58', NULL, NULL, NULL, 234, 'Spain'),
(375, 1, 'Wasiya Shaikh', '400401-21', 'Corinne Hidalgo', 0, 0, 'corinne.hidalgo@jumbotours.com', 'Crujera', NULL, '(3497) 121-1100', NULL, 0, 1, '7009', 'Calle Gran VIA Asima, 4,C', 'Palma', 81, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:58', NULL, NULL, NULL, 234, 'Spain'),
(376, 1, 'Amit Nimbalkar', '400401-16', 'Katinka ', 0, 0, 'katinka.schoonings@cbg-meb.nl', 'Schoonings', NULL, '(3188) 224-8000', NULL, 0, 1, '3531 AH', 'Graadt van Roggenweg 500', 'Utrecht', 82, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:58', NULL, NULL, NULL, 237, 'Netherlands');
INSERT INTO `bf_prospects` (`id`, `salutation_id`, `first_name`, `middle_name`, `last_name`, `job_level_id`, `job_functions_id`, `title`, `email_id`, `direct_number`, `mobile_number`, `office_number`, `country`, `state`, `city`, `address_1`, `address_2`, `company_id`, `dnc`, `src`, `customer_id`, `deleted`, `deleted_by`, `created_on`, `created_by`, `modified_on`, `modified_by`, `domain_id`, `zip`) VALUES
(377, 1, 'Wasiya Shaikh', '400401-21', 'Maria ', 0, 0, 'maria.perello@jumbotours.com', 'Perello', NULL, '(3497) 121-1100', NULL, 0, 1, '7009', 'Calle Gran VIA Asima, 4,', 'Palma', 142, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:59', NULL, NULL, NULL, 236, 'Spain'),
(378, 1, 'Kaif Khan', '400401-19', 'Pablo ', 0, 0, 'psanchez@unitronics.es', 'Sanchez', NULL, '(3490) 210-7670', NULL, 0, 1, '28037 ', 'Calle de Albasanz', 'Covibar', 81, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:59', NULL, NULL, NULL, 235, 'Spain'),
(379, 1, 'Kaif Khan', '400401-19', 'Faustino', 0, 0, 'fbatallan@unitronics.es', 'Batallán', NULL, '(3490) 210-7670', NULL, 0, 1, '28037 ', 'Calle de Albasanz', 'Covibar', 81, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:59', NULL, NULL, NULL, 235, 'Spain'),
(380, 1, 'Kaif Khan', '400401-19', 'Katie ', 0, 0, 'kelse@eims.biz', 'Else', NULL, '(3490) 255-5533', NULL, 0, 1, '8005', 'Carrer de la Llacuna', 'edificio', 81, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:59', NULL, NULL, NULL, 238, 'Spain'),
(381, 1, 'Kaif Khan', '400401-19', 'Zakary ', 0, 0, 'zsanadiki@eims.biz', 'Sanadiki', NULL, '(3490) 255-5533', NULL, 0, 1, '8005', 'Carrer de la Llacuna', 'edificio', 81, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:59', NULL, NULL, NULL, 238, 'Spain'),
(382, 1, 'Kaif Khan', '400401-19', 'Julia ', 0, 0, 'jhanhikoski@eims.biz', 'Hanhikoski', NULL, '(3490) 255-5533', NULL, 0, 1, '8005', 'Carrer de la Llacuna', 'edificio', 142, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:59', NULL, NULL, NULL, 239, 'Spain'),
(383, 1, 'Kaif Khan', '400401-19', 'Benjamin ', 0, 0, 'btellez@eims.biz', 'Tellez', NULL, '(3490) 255-5533', NULL, 0, 1, '8005', 'Carrer de la Llacuna', 'edificio', 81, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:31:59', NULL, NULL, NULL, 238, 'Spain'),
(384, 1, 'Sakib Patni', '400401-16', 'Javier ', 0, 0, 'javier.arias@innoenergy.com', 'Arias', NULL, '(3140) 240-6031', NULL, 0, 1, '1083 HN', 'Barbara Strozzilaan 101', 'Amsterdam', 80, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:00', NULL, NULL, NULL, 240, 'Netherlands'),
(385, 1, 'Abrar Shaikh', '400401-50', 'Belinda ', 0, 0, 'belinda.sinclair@domain.com.au', 'Sinclair', NULL, '(6129) 254-3000', NULL, 0, 1, '2009', '1 Darling Island Rd', 'Pyrmont', 48, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:00', NULL, NULL, NULL, 136, 'Australia'),
(386, 1, 'Faizan Shaikh', '400401-31', 'Danilo ', 0, 0, 'danilo@marelli.com.br', 'Carnavalli', NULL, '(55542) 108-9999', NULL, 0, 1, '95059-520', 'BR-116, Km 142, 11.760', 'Jardim Eldorado', 118, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:00', NULL, NULL, NULL, 241, 'Brazil'),
(387, 1, 'Faizan Shaikh', '400401-31', 'Alisson ', 0, 0, 'alisson@marelli.com.br', 'Lopes', NULL, '(55542) 108-9999', NULL, 0, 1, '95059-520', 'BR-116, Km 142, 11.760', 'Jardim Eldorado', 128, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:00', NULL, NULL, NULL, 242, 'Brazil'),
(388, 1, 'Abrar Shaikh', '400401-18', 'Ida ', 0, 0, 'ida.silfverskiold@digitalroute.com', 'Silfverskiöld', NULL, '(4610) 707-9000', NULL, 0, 1, '113 60', 'Drottninggatan 89', 'Stockholm', 84, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:01', NULL, NULL, NULL, 243, 'Sweden'),
(389, 1, 'Kashifa Shaikh', '400401-20', 'Urska ', 0, 0, 'u.blagojevic@whisbi.com', 'Blagojevic', NULL, '(3491) 186-2386', NULL, 0, 1, '8015', 'Carrer de Calàbria, 16910th Fl', 'Barcelona', 79, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:01', NULL, NULL, NULL, 244, 'Spain'),
(390, 1, 'Sakib Patni', '400401-16', 'Martijn ', 0, 0, 'martijn.koerts@innoenergy.com', 'Koerts', NULL, '(3188) 000-9344', NULL, 0, 1, '5656 AE', 'High Tech Campus 31', 'Eindhoven', 80, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:01', NULL, NULL, NULL, 240, 'Netherlands'),
(391, 1, 'Sakib Patni', '400401-16', 'Yvonne ', 0, 0, 'yvonne.wesselius@innoenergy.com', 'Wesselius', NULL, '(3188) 000-9344', NULL, 0, 1, '5656 AE', 'High Tech Campus 31', 'Eindhoven', 74, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:01', NULL, NULL, NULL, 245, 'Netherlands'),
(392, 1, 'Faizan Shaikh', '400401-31', 'Adilson ', 0, 0, 'adilson@marelli.com.br', 'Muniz', NULL, '(55542) 108-9999', NULL, 0, 1, '95059-520', 'BR-116, Km 142, 11.760', 'Jardim Eldorado', 118, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:01', NULL, NULL, NULL, 241, 'Brazil'),
(393, 1, 'Kashifa Shaikh', '400401-20', 'Beatriz', 0, 0, 'b.maganto@whisbi.com', 'Maganto', NULL, '(3491) 186-2386', NULL, 0, 1, '8015', 'Carrer de Calàbria, 16910th Fl', 'Barcelona', 81, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:01', NULL, NULL, NULL, 246, 'Spain'),
(394, 1, 'Prema Minj', '400401-23', 'Tsuyoshi ', 0, 0, 'sakamotot@qunie.com', 'Sakamoto', NULL, '(8166) 455-8471', NULL, 0, 1, ' 530-0003', '3-3-20, Umeda', 'Doujima', 113, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:02', NULL, NULL, NULL, 247, 'Japan'),
(395, 1, 'Musaddique Shaikh', '400401-30', 'Jerome ', 0, 0, 'jerome.becuwe@happn.com', 'Becuwe', NULL, '(3317) 075-2801', NULL, 0, 1, '75002', '8 Rue Du Sentier', 'Paris', 52, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:02', NULL, NULL, NULL, 248, 'France'),
(396, 1, 'Sakib Patni', '400401-16', 'Emil ', 0, 0, 'emil.machiels@copaco.com', 'Machiels', NULL, '(3140) 230-6306', NULL, 0, 1, '5652 AW', 'Hoevenweg 21', 'Eindhoven', 80, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:02', NULL, NULL, NULL, 249, 'Netherlands'),
(397, 1, 'Sakib Patni', '400401-16', 'Heidi van der', 0, 0, 'heidi.westen@copaco.com', 'Westen', NULL, '(3140) 230-6306', NULL, 0, 1, '5652 AW', 'Hoevenweg 21', 'Eindhoven', 80, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:02', NULL, NULL, NULL, 249, 'Netherlands'),
(398, 1, 'Kashifa Shaikh', '400401-20', 'Seb ', 0, 0, 's.hammond@whisbi.com', 'Hammond', NULL, '(3491) 186-2386', NULL, 0, 1, '8015', 'Carrer de Calàbria, 16910th Fl', 'Barcelona', 142, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:03', NULL, NULL, NULL, 250, 'Spain'),
(399, 1, 'Kaif Khan', '400401-19', 'José ', 0, 0, 'jose.seco@idfinance.com', 'Seco', NULL, '(3493) 461-7231', NULL, 0, 1, '08006 ', 'Carrer de Moià, 1', 'Barcelona', 147, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:32:03', NULL, NULL, NULL, 251, 'Spain'),
(400, 1, 'Musaddique Shaikh', '400401-30', 'Camille ', 0, 0, 'camille.villot@happn.com', 'Villot', NULL, '(3317) 075-2801', NULL, 0, 1, '75002', '8 Rue Du Sentier', 'Paris', 52, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:03', NULL, NULL, NULL, 248, 'France'),
(401, 1, 'Sakib Patni', '400401-16', 'Jeroen van der', 0, 0, 'jeroen.put@copaco.com', 'Put', NULL, '(3140) 230-6306', NULL, 0, 1, '5652 AW', 'Hoevenweg 21', 'Eindhoven', 80, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:03', NULL, NULL, NULL, 249, 'Netherlands'),
(402, 1, 'Sakib Patni', '400401-16', 'Rob ', 0, 0, 'rob.wielen@copaco.com', 'Bijsterveld ', NULL, '(3140) 230-6306', NULL, 0, 1, '5652 AW', 'Hoevenweg 21', 'Eindhoven', 82, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:04', NULL, NULL, NULL, 252, 'Netherlands'),
(403, 1, 'Kashifa Shaikh', '400401-20', 'Isabel López ', 0, 0, 'i.lopez@whisbi.com', 'Trujillo', NULL, '(3491) 186-2386', NULL, 0, 1, '8015', 'Carrer de Calàbria, 16910th Fl', 'Barcelona', 108, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:04', NULL, NULL, NULL, 253, 'Spain'),
(404, 1, 'Faizan Shaikh', '400401-31', 'Jessica ', 0, 0, 'jessica.raiol@montecarlo.com.br', 'Raiol', NULL, '(552199) 257-724', NULL, 0, 1, '22640-102', 'Av. das Américas, 4666 - Loja 113 A & B', 'Barra da Tijuca', 128, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:04', NULL, NULL, NULL, 254, 'Brazil'),
(405, 1, 'Musaddique Shaikh', '400401-30', 'Sébastien ', 0, 0, 'sebastien.preneta@happn.com', 'Preneta', NULL, '(3317) 075-2801', NULL, 0, 1, '75002', '8 Rue Du Sentier', 'Paris', 57, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:04', NULL, NULL, NULL, 255, 'France'),
(406, 1, 'Kashifa Shaikh', '400401-20', 'Michael', 0, 0, 'michaels@elementsgs.com', 'Shelley', NULL, '(3493) 122-3760', NULL, 0, 1, '8019', 'Carrer de Pujades, 350, Floor 4', 'Barcelona', 81, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:04', NULL, NULL, NULL, 256, 'Spain'),
(407, 1, 'Wasiya Shaikh', '400401-21', 'Antonio Ramon', 0, 0, 'armolinamilla@axesor.es', 'Molina Milla', NULL, '(3495) 875-0500', NULL, 0, 1, '18100', 'Calle Graham Bell', 'Granada', 99, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:04', NULL, NULL, NULL, 257, 'Spain'),
(408, 1, 'Faizan Shaikh', '400401-31', 'Daniel ', 0, 0, 'daniel.cunha@montecarlo.com.br', 'Cunha', NULL, '(552199) 257-724', NULL, 0, 1, '22640-102', 'Av. das Américas, 4666 - Loja 113 A & B', 'Barra da Tijuca', 148, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:32:05', NULL, NULL, NULL, 258, 'Brazil'),
(409, 1, 'Sakib Patni', '400401-16', 'Dennis ', 0, 0, 'dennis.cleary@opcw.org', 'Cleary', NULL, '(3170) 416-3300', NULL, 0, 1, '2517 Den', 'Johan de Wittlaan 32', 'Haag', 63, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:05', NULL, NULL, NULL, 259, 'Netherlands'),
(410, 1, 'Kashifa Shaikh', '400401-20', 'Iñaki ', 0, 0, 'inakie@elementsgs.com', 'Elosua', NULL, '(3493) 122-3760', NULL, 0, 1, '8019', 'Carrer de Pujades, 350, Floor 4', 'Barcelona', 108, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:05', NULL, NULL, NULL, 260, 'Spain'),
(411, 1, 'Abrar Shaikh', '400401-18', 'Shubho ', 0, 0, 'shubho.ghosh@digitalroute.com', 'Ghosh', NULL, '(4610) 707-9000', NULL, 0, 1, '113 60', 'Drottninggatan 89', 'Stockholm', 87, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:05', NULL, NULL, NULL, 261, 'Sweden'),
(412, 1, 'Wasiya Shaikh', '400401-21', 'Emma ', 0, 0, 'emmagiralt@axesor.es', 'Cepa Giralt', NULL, '(3495) 875-0500', NULL, 0, 1, '18100', 'Calle Graham Bell', 'Granada', 79, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:06', NULL, NULL, NULL, 262, 'Spain'),
(413, 1, 'Kashifa Shaikh', '400401-20', 'Rafael ', 0, 0, 'r.serna@elementsgs.com', 'Serna', NULL, '(3493) 122-3760', NULL, 0, 1, '8019', 'Carrer de Pujades, 350, Floor 4', 'Barcelona', 73, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:06', NULL, NULL, NULL, 263, 'Spain'),
(414, 1, 'Sakib Patni', '400401-16', 'Arjan ', 0, 0, 'arjan.levisson@slimstock.com', 'Levisson', NULL, '(3157) 063-8400', NULL, 0, 1, '7418 AH', 'Zutphenseweg 29', 'G1', 77, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:06', NULL, NULL, NULL, 264, 'Netherlands'),
(415, 1, 'Abrar Shaikh', '400401-18', 'Charlotta ', 0, 0, 'charlotta.asberg@digitalroute.com', 'Åsberg', NULL, '(4610) 707-9000', NULL, 0, 1, '113 60', 'Drottninggatan 89', 'Stockholm', 78, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:06', NULL, NULL, NULL, 84, 'Sweden'),
(416, 1, 'Kashifa Shaikh', '400401-20', 'Alvaro Martin ', 0, 0, 'alvaro.martin@quintasenergy.com', 'De Los Santos Piñero', NULL, '(3495) 432-4365', NULL, 0, 1, '41001 ', 'Plaza Nueva, 13', 'Sevilla', 108, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:06', NULL, NULL, NULL, 265, 'Spain'),
(417, 1, 'Wasiya Shaikh', '400401-21', 'Antonio Moya', 0, 0, 'antoniollopis@axesor.es', 'Llopis', NULL, '(3495) 875-0500', NULL, 0, 1, '18100', 'Calle Graham Bell', 'Granada', 81, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:06', NULL, NULL, NULL, 157, 'Spain'),
(418, 1, 'Abrar Shaikh', '400401-18', 'Jesper ', 0, 0, 'jesper.hok@digitalroute.com', 'Hök', NULL, '(4610) 707-9000', NULL, 0, 1, '113 60', 'Drottninggatan 89', 'Stockholm', 87, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:06', NULL, NULL, NULL, 261, 'Sweden'),
(419, 1, 'Prema Minj', '400401-19', 'Xavier ', 0, 0, 'xnoguera@itnow.es', 'Noguera', NULL, '(3493) 404-6706', NULL, 0, 1, '08029', ' C. Numància 164 - 7ª Planta,', 'Barcelona', 149, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:32:07', NULL, NULL, NULL, 266, 'Spain'),
(420, 1, 'Sakib Patni', '400401-16', 'Ilona Suarez ', 0, 0, 'ilona.rijken@slimstock.com', 'Rijken', NULL, '(3157) 063-8400', NULL, 0, 1, '7418 AH', 'Zutphenseweg 29', 'G1', 80, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:07', NULL, NULL, NULL, 267, 'Netherlands'),
(421, 1, 'Prema Minj', '400401-23', 'Noriko ', 0, 0, 'nkato@accj.or.jp', 'Kato', NULL, '(8133) 433-5381', NULL, 0, 1, ' 106-0041', 'Masonic 39 MT Bldg 10F 2-4-5 Azabuda ', 'Minato-ku', 150, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:32:07', NULL, NULL, NULL, 268, 'Japan'),
(422, 1, 'Kashifa Shaikh', '400401-20', 'Jesús Boccio', 0, 0, 'jesus.boccio@quintasenergy.com', 'Castrillo', NULL, '(3495) 432-4365', NULL, 0, 1, '41001 ', 'Plaza Nueva, 13', 'Sevilla', 81, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:07', NULL, NULL, NULL, 269, 'Spain'),
(423, 1, 'Kashifa Shaikh', '400401-20', 'Santiago Haya', 0, 0, 'santiago.haya@quintasenergy.com', 'Álvarez', NULL, '(3495) 432-4365', NULL, 0, 1, '41001 ', 'Plaza Nueva, 13', 'Sevilla', 151, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:32:08', NULL, NULL, NULL, 270, 'Spain'),
(424, 1, 'Sakib Patni', '400401-16', 'Patrick ', 0, 0, 'patrick.egbertzen@slimstock.com', 'Egbertzen', NULL, '(3157) 063-8400', NULL, 0, 1, '7418 AH', 'Zutphenseweg 29', 'G1', 74, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:08', NULL, NULL, NULL, 271, 'Netherlands'),
(425, 1, 'Kashifa Shaikh', '400401-20', 'Richard ', 0, 0, 'richard.ward@quintasenergy.com', 'Ward', NULL, '(3495) 432-4365', NULL, 0, 1, '41001 ', 'Plaza Nueva, 13', 'Sevilla', 108, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:08', NULL, NULL, NULL, 265, 'Spain'),
(426, 1, 'Kashifa Shaikh', '400401-20', 'Hector ', 0, 0, 'hector.hernando@quintasenergy.com', 'Hernando', NULL, '(3495) 432-4365', NULL, 0, 1, '41001 ', 'Plaza Nueva, 13', 'Sevilla', 108, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:08', NULL, NULL, NULL, 265, 'Spain'),
(427, 1, 'Kashifa Shaikh', '400401-20', 'Laureano ', 0, 0, 'laureano.parrilla@quintasenergy.com', 'Parrilla', NULL, '(3495) 432-4365', NULL, 0, 1, '41001 ', 'Plaza Nueva, 13', 'Sevilla', 81, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:08', NULL, NULL, NULL, 269, 'Spain'),
(428, 1, 'Sakib Patni', '400401-16', 'Gerco ', 0, 0, 'gerco.oosterink@gazelle.nl', 'Oosterink', NULL, '(31900) 707-0707', NULL, 0, 1, '6951 BP', 'Wilhelminaweg 8', 'Dieren', 74, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:09', NULL, NULL, NULL, 272, 'Netherlands'),
(429, 1, 'Kashifa Shaikh', '400401-20', 'Catherine ', 0, 0, 'catherine.yaque@quintasenergy.com', 'Yaque', NULL, '(3495) 432-4365', NULL, 0, 1, '41001 ', 'Plaza Nueva, 13', 'Sevilla', 108, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:09', NULL, NULL, NULL, 265, 'Spain'),
(430, 1, 'Wasiya Shaikh', '400401-21', 'Inmaculada Casado ', 0, 0, 'icasadomoreno@axesor.es', 'Moreno', NULL, '(3495) 875-0500', NULL, 0, 1, '18100', 'Calle Graham Bell', 'Granada', 81, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:09', NULL, NULL, NULL, 157, 'Spain'),
(431, 1, 'Wasiya Shaikh', '400401-21', 'Sara ', 0, 0, 'saravecino@axesor.es', 'Vecino', NULL, '(3495) 875-0500', NULL, 0, 1, '18100', 'Calle Graham Bell', 'Granada', 81, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:09', NULL, NULL, NULL, 157, 'Spain'),
(432, 1, 'Salman Shaikh', '400401-22', 'Joshua', 0, 0, 'joshua@cybereason.com', 'Leong', NULL, '(8136) 889-2199', NULL, 0, 1, '105-0021', '1 Chome-9-2 Sumitomo Shiodome Building 27F', 'Minato City', 152, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:32:09', NULL, NULL, NULL, 273, 'Japan'),
(433, 1, 'Salman Shaikh', '400401-22', 'Takuro', 0, 0, 'takuro@cybereason.com', 'Hashimoto', NULL, '(8136) 889-2199', NULL, 0, 1, '105-0021', '1 Chome-9-2 Sumitomo Shiodome Building 27F', 'Minato City', 153, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:32:10', NULL, NULL, NULL, 274, 'Japan'),
(434, 1, 'Wasiya Shaikh', '400401-21', 'Patricia Bayolo', 0, 0, 'patriciabayolo@axesor.es', 'Fuentes', NULL, '(3495) 875-0500', NULL, 0, 1, '18100', 'Calle Graham Bell', 'Granada', 81, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:10', NULL, NULL, NULL, 157, 'Spain'),
(435, 1, 'Salman Shaikh', '400401-22', 'Yamamoto', 0, 0, 'yamamoto@cybereason.com', 'Koji', NULL, '(8136) 889-2199', NULL, 0, 1, '105-0021', '1 Chome-9-2 Sumitomo Shiodome Building 27F', 'Minato City', 111, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:10', NULL, NULL, NULL, 232, 'Japan'),
(436, 1, 'Aishwariya Singh', '400401-17', 'Giles ', 0, 0, 'gfunnell@emspay.eu', 'Funnell', NULL, '(3120) 660-3040', NULL, 0, 1, '1101 CN', 'Herikerbergweg 25', 'Amsterdam', 63, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:10', NULL, NULL, NULL, 275, 'Netherlands'),
(437, 1, 'Salman Shaikh', '400401-27', 'Paul', 0, 0, 'paul@contentful.com', 'Biggs', NULL, '(493046) 726-094', NULL, 0, 1, '10969', 'Markgrafenstr. 12-14', 'Berlin Kreuzberg', 65, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:10', NULL, NULL, NULL, 276, 'Germany'),
(438, 1, 'Kaif Khan', '400401-24', 'Michela ', 0, 0, 'michela.malnati@lyreco.com', 'Malnati', NULL, '(3905) 238-1061', NULL, 0, 1, '29010 ', 'Via Maestri del Lavoro', 'Monticelli ', 154, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:32:11', NULL, NULL, NULL, 277, 'Italy'),
(439, 1, 'Kashifa Shaikh', '400401-28', 'Alexandra ', 0, 0, 'a.mayer@comatch.com', 'Mayer', NULL, '(49304) 036-5690', NULL, 0, 1, '10551 ', 'Stromstraße 15,', 'Berlin', 47, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:11', NULL, NULL, NULL, 278, 'Germany'),
(440, 1, 'Salman Shaikh', '400401-27', 'Daniel ', 0, 0, 'daniel.paulus@contentful.com', 'Paulus', NULL, '(493046) 726-094', NULL, 0, 1, '10969', 'Markgrafenstr. 12-14', 'Berlin Kreuzberg', 110, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:11', NULL, NULL, NULL, 279, 'Germany'),
(441, 1, 'Kaif Khan', '400401-24', 'Alberto ', 0, 0, 'alberto.spinazzola@lyreco.com', 'Spinazzola', NULL, '(3905) 238-1061', NULL, 0, 1, '29010 ', 'Via Maestri del Lavoro', 'Monticelli ', 154, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:11', NULL, NULL, NULL, 277, 'Italy'),
(442, 1, 'Salman Shaikh', '400401-27', 'Moritz ', 0, 0, 'moritz.guth@contentful.com', 'Guth', NULL, '(493046) 726-094', NULL, 0, 1, '10969', 'Markgrafenstr. 12-14', 'Berlin Kreuzberg', 65, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:11', NULL, NULL, NULL, 276, 'Germany'),
(443, 1, 'Kaif Khan', '400401-24', 'Cristina ', 0, 0, 'cristina.minardi@lyreco.com', 'Minardi', NULL, '(3905) 238-1061', NULL, 0, 1, '29010 ', 'Via Maestri del Lavoro', 'Monticelli ', 155, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:32:12', NULL, NULL, NULL, 280, 'Italy'),
(444, 1, 'Salman Shaikh', '400401-27', 'Sergii ', 0, 0, 'sergii@contentful.com', 'Bezliudnyi', NULL, '(493046) 726-094', NULL, 0, 1, '10969', 'Markgrafenstr. 12-14', 'Berlin Kreuzberg', 110, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:12', NULL, NULL, NULL, 279, 'Germany'),
(445, 1, 'Abrar Shaikh', '400401-23', 'Seiji ', 0, 0, 'seiji.nakano@paidy.com', 'Nakano', NULL, '(8135) 545-5975', NULL, 0, 1, '106-0032', '3-16-26 Roppongi,', 'Minato-ku', 156, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:32:12', NULL, NULL, NULL, 281, 'Japan'),
(446, 1, 'Kaif Khan', '400401-24', 'Daniele ', 0, 0, 'daniele.mignone@lyreco.com', 'Mignone', NULL, '(3905) 238-1061', NULL, 0, 1, '29010 ', 'Via Maestri del Lavoro', 'Monticelli ', 154, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:12', NULL, NULL, NULL, 277, 'Italy'),
(447, 1, 'Salman Shaikh', '400401-27', 'Harald ', 0, 0, 'harald.wartig@contentful.com', 'Wartig', NULL, '(493046) 726-094', NULL, 0, 1, '10969', 'Markgrafenstr. 12-14', 'Berlin Kreuzberg', 110, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:12', NULL, NULL, NULL, 279, 'Germany'),
(448, 1, 'Salman Shaikh', '400401-27', 'Anna ', 0, 0, 'anna.richardson@contentful.com', 'Richardson', NULL, '(493046) 726-094', NULL, 0, 1, '10969', 'Markgrafenstr. 12-14', 'Berlin Kreuzberg', 67, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:12', NULL, NULL, NULL, 282, 'Germany'),
(449, 1, 'Aishwariya Singh', '400401-17', 'Derk ', 0, 0, 'ddriest@emspay.eu', 'Driest', NULL, '(3120) 660-3040', NULL, 0, 1, '1101 CN', 'Herikerbergweg 25', 'Amsterdam', 77, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:13', NULL, NULL, NULL, 283, 'Netherlands'),
(450, 1, 'Kaif Khan', '400401-24', 'Roberta ', 0, 0, 'roberta.romano@lyreco.com', 'Romano', NULL, '(3905) 238-1061', NULL, 0, 1, '29010 ', 'Via Maestri del Lavoro', 'Monticelli ', 154, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:13', NULL, NULL, NULL, 277, 'Italy'),
(451, 1, 'Abrar Shaikh', '400401-23', 'Asako', 0, 0, 'asako.maki@paidy.com', 'Maki', NULL, '(8135) 545-5975', NULL, 0, 1, '106-0032', '3-16-26 Roppongi, ', 'Minato-ku', 156, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:13', NULL, NULL, NULL, 281, 'Japan'),
(452, 1, 'Abrar Shaikh', '400401-23', 'Tsuguyo ', 0, 0, 'tsuguyo.hieda@paidy.com', 'Hieda', NULL, '(8135) 545-5975', NULL, 0, 1, '106-0032', '3-16-26 Roppongi, ', ' Minato-ku', 157, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:32:14', NULL, NULL, NULL, 284, 'Japan'),
(453, 1, 'Sakib Patni', '400401-16', 'Pim ', 0, 0, 'pim.teunissen@gazelle.nl', 'Teunissen', NULL, '(3145) 578-2951', NULL, 0, 1, '6411 TE ', 'Het Overloon 1', 'Heerlen', 80, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:14', NULL, NULL, NULL, 285, 'Netherlands'),
(454, 1, 'Kaif Khan', '400401-24', 'Nora ', 0, 0, 'nora.cecini@lyreco.com', 'Cecini', NULL, '(3905) 238-1061', NULL, 0, 1, '29010 ', 'Via Maestri del Lavoro', 'Monticelli ', 154, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:14', NULL, NULL, NULL, 277, 'Italy'),
(455, 1, 'Aishwariya Singh', '400401-17', 'Frank ', 0, 0, 'fjilderda@emspay.eu', 'Jilderda', NULL, '(3120) 660-3040', NULL, 0, 1, '1101 CN', 'Herikerbergweg 25', 'Amsterdam', 77, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:14', NULL, NULL, NULL, 283, 'Netherlands'),
(456, 1, 'Sakib Patni', '400401-16', 'Bob Van', 0, 0, 'bob.hulst@gazelle.nl', 'Hulst', NULL, '(31900) 707-0707', NULL, 0, 1, '6951 BP', 'Wilhelminaweg  8', 'Dieren', 46, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:14', NULL, NULL, NULL, 286, 'Netherlands'),
(457, 1, 'Salman Shaikh', '400401-22', 'Hiroshi ', 0, 0, 'hiroshi.kurata@cdnetworks.com', 'Kurata', NULL, '(8135) 909-3373', NULL, 0, 1, '160-0023', 'Chome-10-1 Hitochi Nishi Shinjuku Building 8F', 'Shinjuku City', 112, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:15', NULL, NULL, NULL, 287, 'Japan'),
(458, 1, 'Sakib Patni', '400401-16', 'Maartje Van ', 0, 0, 'maartje.wiechen@gazelle.nl', 'Wiechen', NULL, '(31900) 707-0707', NULL, 0, 1, '6951 BP', 'Wilhelminaweg  8', 'Dieren', 80, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:15', NULL, NULL, NULL, 285, 'Netherlands'),
(459, 1, 'Abrar Shaikh', '400401-23', 'Toshiaki ', 0, 0, 'toshiaki.watanabe@paidy.com', 'Watanabe', NULL, '(8135) 545-5975', NULL, 0, 1, '106-0032,', '3-16-26 Roppongi,', 'Minato-ku', 111, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:15', NULL, NULL, NULL, 288, 'Japan'),
(460, 1, 'Aishwariya Singh', '400401-17', 'Geert ', 0, 0, 'gteunissen@emspay.eu', 'Teunissen', NULL, '(3120) 660-3040', NULL, 0, 1, '1101 CN', 'Herikerbergweg 25', 'Amsterdam', 77, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:15', NULL, NULL, NULL, 283, 'Netherlands'),
(461, 1, 'Abrar Shaikh', '400401-23', 'Kayoko ', 0, 0, 'Kayoko.Ishii@paidy.com', 'Ishii', NULL, '(8135) 545-5975', NULL, 0, 1, '106-0032,', '3-16-26 Roppongi,', 'Minato-ku', 157, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:15', NULL, NULL, NULL, 284, 'Japan'),
(462, 1, 'Sakib Patni', '400401-16', 'Mark ', 0, 0, 'mark.klaver@gazelle.nl', 'Klaver', NULL, '(31900) 707-0707', NULL, 0, 1, '6951 BP', 'Wilhelminaweg  8', 'Dieren', 74, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:15', NULL, NULL, NULL, 272, 'Netherlands'),
(463, 1, 'Kashifa Shaikh', '400401-20', 'Ricardo ', 0, 0, 'rgarcia@udon.com', 'García', NULL, '(3487) 628-3213', NULL, 0, 1, '50004 ', 'Calle Marceliano Isábal, 2', 'Madrid', 142, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:15', NULL, NULL, NULL, 289, 'Spain'),
(464, 1, 'Kashifa Shaikh', '400401-20', 'David ', 0, 0, 'dvela@udon.com', 'Vela', NULL, '(3487) 628-3213', NULL, 0, 1, '50004 ', 'Calle Marceliano Isábal, 2', 'Madrid', 79, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:16', NULL, NULL, NULL, 290, 'Spain'),
(465, 1, 'Musaddique Shaikh', '400401-26', 'Merav ', 0, 0, 'merav@freightos.com', 'Carmeli', NULL, '(9722) 644-7333', NULL, 0, 1, '9695102', 'HaPo\'el 1, Jerusalem,', 'Derech Agudat Sport HaPo\'el', 107, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:16', NULL, NULL, NULL, 291, 'Israel'),
(466, 1, 'Kashifa Shaikh', '400401-20', 'Pedro ', 0, 0, 'pmellinas@udon.com', 'Mellinas', NULL, '(3487) 628-3213', NULL, 0, 1, '50004', 'Calle Marceliano Isábal, 2', 'Madrid', 79, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:16', NULL, NULL, NULL, 290, 'Spain'),
(467, 1, 'Kashifa Shaikh', '400401-28', 'Josef-Peter', 0, 0, 'j.gautsch@comatch.com', 'Gautsch', NULL, '(49304) 036-5690', NULL, 0, 1, '10551 ', 'Stromstraße 15,', 'Berlin', 47, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:16', NULL, NULL, NULL, 278, 'Germany'),
(468, 1, 'Musaddique Shaikh', '400401-26', 'Maayan ', 0, 0, 'maayan@freightos.com', 'Citron', NULL, '(9722) 644-7333', NULL, 0, 1, '9695102', 'HaPo\'el 1, Jerusalem', 'Derech Agudat Sport HaPo\'el,', 106, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:16', NULL, NULL, NULL, 292, 'Israel'),
(469, 1, 'Salman Shaikh', '400401-22', 'Takashi ', 0, 0, 'takashi.sato@cdnetworks.com', 'Sato', NULL, '(8135) 909-3373', NULL, 0, 1, '160-0023', 'Chome-10-1 Hitochi Nishi Shinjuku Building 8F', 'Shinjuku City', 111, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:16', NULL, NULL, NULL, 293, 'Japan'),
(470, 1, 'Kashifa Shaikh', '400401-20', 'Jordi ', 0, 0, 'jquilez@udon.com', 'Quilez', NULL, '(3487) 628-3213', NULL, 0, 1, '50004', 'Calle Marceliano Isábal, 2', 'Madrid', 81, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:16', NULL, NULL, NULL, 294, 'Spain'),
(471, 1, 'Musaddique Shaikh', '400401-26', 'Rocky ', 0, 0, 'rocky@freightos.com', 'Brody', NULL, '(9722) 644-7333', NULL, 0, 1, '9695102', ' HaPo\'el 1, Jerusalem,', 'Derech Agudat Sport HaPo\'el,', 106, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:16', NULL, NULL, NULL, 292, 'Israel'),
(472, 1, 'Salman Shaikh', '400401-27', 'Kyra ', 0, 0, 'Kyra.Srisukri@misterspex.com', 'Srisukri', NULL, '(49800) 724-2007', NULL, 0, 1, '10409', 'Greifswalder Straße 156', 'Berlin', 65, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:16', NULL, NULL, NULL, 295, 'Germany'),
(473, 1, 'Kashifa Shaikh', '400401-20', 'Edoardo ', 0, 0, 'edoardo.rapezzi@tiendeo.com', 'Rapezzi', NULL, '(3493) 178-0715', NULL, 0, 1, '08039 ', 'Edifici Palau de Mar,', 'Plaça de Pau Vila', 81, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:18', NULL, NULL, NULL, 296, 'Spain'),
(474, 1, 'Salman Shaikh', '400401-27', 'Andreas ', 0, 0, 'andreas.welscher@misterspex.com', 'Welscher', NULL, '(49800) 724-2007', NULL, 0, 1, '10409', 'Greifswalder Straße 156', 'Berlin', 65, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:18', NULL, NULL, NULL, 295, 'Germany'),
(475, 1, 'Kashifa Shaikh', '400401-20', 'Guillaume ', 0, 0, 'guillaume.grand@tiendeo.com', 'Grand', NULL, '(3493) 178-0715', NULL, 0, 1, '08039 ', 'Edifici Palau de Mar,', 'Plaça de Pau Vila', 81, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:18', NULL, NULL, NULL, 296, 'Spain'),
(476, 1, 'Salman Shaikh', '400401-27', 'Elisabeth ', 0, 0, 'elisabeth.schultz@misterspex.com', 'Schultz', NULL, '(49800) 724-2007', NULL, 0, 1, '10409', 'Greifswalder Straße 156', 'Berlin', 65, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:18', NULL, NULL, NULL, 295, 'Germany'),
(477, 1, 'Salman Shaikh', '400401-27', 'Mai-Linh', 0, 0, 'mai-linh.dinh@misterspex.com', 'Dinh', NULL, '(49800) 724-2007', NULL, 0, 1, '10409', 'Greifswalder Straße 156', 'Berlin', 65, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:19', NULL, NULL, NULL, 295, 'Germany'),
(478, 1, 'Musaddique Shaikh', '400401-26', 'Avital ', 0, 0, 'avital.menaged@cymotive.com', 'Menaged', NULL, '(97279) 572-9960', NULL, 0, 1, '6789155', 'Alon Towers 1,', 'Yigal Alon St 94', 107, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:19', NULL, NULL, NULL, 297, 'Israel'),
(479, 1, 'Salman Shaikh', '400401-27', 'Anika ', 0, 0, 'anika.kolbinsky@misterspex.com', 'Kolbinsky', NULL, '(49800) 724-2007', NULL, 0, 1, '10409', 'Greifswalder Straße 156', 'Berlin', 67, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:20', NULL, NULL, NULL, 298, 'Germany'),
(480, 1, 'Kashifa Shaikh', '400401-20', 'Gabriel', 0, 0, 'gabriel.ponce@tiendeo.com', 'Ponce', NULL, '(3493) 178-0715', NULL, 0, 1, '08039', 'Edifici Palau de Mar,', 'Plaça de Pau Vila', 81, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:20', NULL, NULL, NULL, 296, 'Spain'),
(481, 1, 'Kashifa Shaikh', '400401-20', 'Camillo ', 0, 0, 'camillo.cortesi@tiendeo.com', 'Cortesi', NULL, '(3493) 178-0715', NULL, 0, 1, '08039 ', 'Edifici Palau de Mar,', 'Plaça de Pau Vila', 81, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:20', NULL, NULL, NULL, 296, 'Spain'),
(482, 1, 'Musaddique Shaikh', '400401-18', 'Martin ', 0, 0, 'martin.leek@blueair.com', 'Leek', NULL, '(468) 679-4500', NULL, 0, 1, '115 26', 'Karlavägen 108', 'Stockholm', 87, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:20', NULL, NULL, NULL, 299, 'Sweden'),
(483, 1, 'Kashifa Shaikh', '400401-20', 'Alfredo', 0, 0, 'alfredo.perez@tiendeo.com', 'Perez', NULL, '(3493) 178-0715', NULL, 0, 1, '08039', 'Edifici Palau de Mar,', 'Plaça de Pau Vila', 81, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:20', NULL, NULL, NULL, 296, 'Spain'),
(484, 1, 'Musaddique Shaikh', '400401-18', 'Jenny ', 0, 0, 'jenny.flodman@blueair.com', 'Flodman', NULL, '(468) 679-4500', NULL, 0, 1, '115 26', 'Karlavägen 108', 'Stockholm', 84, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:20', NULL, NULL, NULL, 300, 'Sweden'),
(485, 1, 'Prema Minj', '400401-19', 'Ana ', 0, 0, 'ana.rosales@peroxychem.com', 'Rosales', NULL, '(3497) 617-9600', NULL, 0, 1, '50784', 'Calle Afueras, 0 S/N', 'La Zaida', 158, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:32:21', NULL, NULL, NULL, 301, 'Spain'),
(486, 1, 'Kashifa Shaikh', '400401-20', 'Vania ', 0, 0, 'vania.bravo@tiendeo.com', 'Bravo', NULL, '(3493) 178-0715', NULL, 0, 1, '08039', 'Edifici Palau de Mar,', 'Plaça de Pau Vila', 81, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:21', NULL, NULL, NULL, 296, 'Spain'),
(487, 1, 'Prema Minj', '400401-19', 'Oriol Roig', 0, 0, 'oriol.roig@between.tech', 'Blesa', NULL, '(3493) 314-1925', NULL, 0, 1, '8027', '8º, Avinguda Meridiana', 'Barcelona', 99, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:21', NULL, NULL, NULL, 302, 'Spain'),
(488, 1, 'Kashifa Shaikh', '400401-20', 'Francisca', 0, 0, 'francisca.raddatz@tiendeo.com', 'Raddatz', NULL, '(3493) 178-0715', NULL, 0, 1, '08039', 'Edifici Palau de Mar,', 'Plaça de Pau Vila', 81, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:21', NULL, NULL, NULL, 296, 'Spain'),
(489, 1, 'Musaddique Shaikh', '400401-26', 'Tal ', 0, 0, 'tal.sacharov@celeno.com', 'Sacharov', NULL, '(9729) 745-4646', NULL, 0, 1, '4366250', '26 Zarhin Street', 'Ra\'anana', 106, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:21', NULL, NULL, NULL, 303, 'Israel'),
(490, 1, 'Kashifa Shaikh', '400401-28', 'Prasath ', 0, 0, 'p.easwarananthan@comatch.com', 'Easwarananthan', NULL, '(49304) 036-5690', NULL, 0, 1, '10551 ', 'Stromstraße 15,', 'Berlin', 47, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:22', NULL, NULL, NULL, 278, 'Germany'),
(491, 1, 'Kaif Khan', '400401-24', 'Bruna ', 0, 0, 'bruna.cortez@musement.com', 'Cortez', NULL, '(39023) 540-1375', NULL, 0, 1, '20139 ', 'Via Polesine, 14', 'Milano ', 109, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:22', NULL, NULL, NULL, 304, 'Italy'),
(492, 1, 'Prema Minj', '400401-19', 'Lluís Vegas', 0, 0, 'lluis.vegas@between.tech', 'Dufour', NULL, '(3493) 314-1925', NULL, 0, 1, '8027', '8º, Avinguda Meridiana, 358', 'Barcelona', 99, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:22', NULL, NULL, NULL, 302, 'Spain'),
(493, 1, 'Kashifa Shaikh', '400401-28', 'Justus ', 0, 0, 'j.loge@comatch.com', 'Loge', NULL, '(49304) 036-5690', NULL, 0, 1, '10551 ', 'Stromstraße 15,', 'Berlin', 47, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:22', NULL, NULL, NULL, 278, 'Germany'),
(494, 1, 'Kaif Khan', '400401-24', 'Benedetta ', 0, 0, 'benedetta.cerioni@musement.com', 'Cerioni', NULL, '(39023) 540-1375', NULL, 0, 1, '20139 ', 'Via Polesine, 14', 'Milano ', 159, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:32:22', NULL, NULL, NULL, 305, 'Italy'),
(495, 1, 'Kaif Khan', '400401-24', 'Antonella ', 0, 0, 'antonella.travascio@musement.com', 'Travascio', NULL, '(39023) 540-1375', NULL, 0, 1, '20139 ', 'Via Polesine, 14', 'Milano ', 160, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:32:23', NULL, NULL, NULL, 306, 'Italy'),
(496, 1, 'Kashifa Shaikh', '400401-20', 'Maria', 0, 0, 'maria.lantero@optimagaming.com', 'Lantero', NULL, '(3495) 491-0535', NULL, 0, 1, ' 41092 ', 'Jiménez de Quesada, 2 14th. Floor, 41092 Seville', 'Torre Sevilla', 79, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:23', NULL, NULL, NULL, 307, 'Spain'),
(497, 1, 'Kaif Khan', '400401-24', 'Francesca ', 0, 0, 'francesca.vanini@musement.com', 'Vanini', NULL, '(39023) 540-1375', NULL, 0, 1, '20139 ', 'Via Polesine, 14', 'Milano ', 154, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:23', NULL, NULL, NULL, 308, 'Italy'),
(498, 1, 'Kashifa Shaikh', '400401-20', 'Jesús', 0, 0, 'jesus.baus@optimagaming.com', 'Baus', NULL, '(3495) 491-0535', NULL, 0, 1, ' 41092 ', 'Jiménez de Quesada, 2 14th. Floor, 41092 Seville', 'Torre Sevilla', 73, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:23', NULL, NULL, NULL, 309, 'Spain'),
(499, 1, 'Kaif Khan', '400401-24', 'Myriam ', 0, 0, 'myriam.bertero@musement.com', 'Bertero', NULL, '(39023) 540-1375', NULL, 0, 1, '20139 ', 'Via Polesine, 14', 'Milano ', 109, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:24', NULL, NULL, NULL, 304, 'Italy'),
(500, 1, 'Kashifa Shaikh', '400401-20', 'Ernesto Muñoz ', 0, 0, 'ernesto.munoz@optimagaming.com', 'Salmerón', NULL, '(3495) 491-0535', NULL, 0, 1, ' 41092 ', 'Jiménez de Quesada, 2 14th. Floor, 41092 Seville', 'Torre Sevilla', 108, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:24', NULL, NULL, NULL, 310, 'Spain'),
(501, 1, 'Kaif Khan', '400401-24', 'Sabrina ', 0, 0, 'sabrina.bignotti@musement.com', 'Bignotti', NULL, '(39023) 540-1375', NULL, 0, 1, '20139 ', 'Via Polesine, 14', 'Milano ', 109, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:24', NULL, NULL, NULL, 304, 'Italy'),
(502, 1, 'Musaddique Shaikh', '400401-18', 'Farid ', 0, 0, 'farid.mekki@blueair.com', 'Mekki', NULL, '(468) 679-4500', NULL, 0, 1, '115 26', 'Karlavägen 108', 'Stockholm', 87, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:24', NULL, NULL, NULL, 299, 'Sweden'),
(503, 1, 'Kashifa Shaikh', '400401-20', 'Francisco Granados ', 0, 0, 'francisco.granados@optimagaming.com', 'Cabrera', NULL, '(3495) 491-0535', NULL, 0, 1, ' 41092 ', 'Jiménez de Quesada, 2 14th. Floor, 41092 Seville', 'Torre Sevilla', 142, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:24', NULL, NULL, NULL, 311, 'Spain'),
(504, 1, 'Sakib Patni', '400401-16', 'Rineke ', 0, 0, 'rineke.berkelder@gazelle.nl', 'Berkelder', NULL, '(31900) 707-0707', NULL, 0, 1, '6951 BP', 'Wilhelminaweg  8', 'Dieren', 80, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:24', NULL, NULL, NULL, 285, 'Netherlands'),
(505, 1, 'Musaddique Shaikh', '400401-26', 'Sharon ', 0, 0, 'sharon.shein@celeno.com', 'Shein', NULL, '(9729) 745-4646', NULL, 0, 1, '4366250', '26 Zarhin Street', 'Ra\'anana', 107, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:25', NULL, NULL, NULL, 312, 'Israel'),
(506, 1, 'Faizan Shaikh', '400401-31', 'Gisele ', 0, 0, 'gisele.sarego@autotrac.com.br', 'Sá Rêgo', NULL, '(55613) 307-7000', NULL, 0, 1, '70711-070', 'Autotrac - SCN Q 1 Bloco G Ed. Rossi Esplanada Business - Sobreloja', 'SCN Q 1 - Asa Norte', 161, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:32:25', NULL, NULL, NULL, 313, 'Brazil'),
(507, 1, 'Sakib Patni', '400401-16', 'Fleur ', 0, 0, 'fleur.smalt@ampelmann.nl', 'Smalt', NULL, '(3120) 240-0121', NULL, 0, 1, '2612 HL ', 'Oostsingel 209', 'Delft', 80, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:25', NULL, NULL, NULL, 314, 'Netherlands'),
(508, 1, 'Faizan Shaikh', '400401-31', 'Alexandre ', 0, 0, 'alexandre.pereira@autotrac.com.br', 'Pereira', NULL, '(55613) 307-7000', NULL, 0, 1, '70711-070', 'Autotrac - SCN Q 1 Bloco G Ed. Rossi Esplanada Business - Sobreloja', 'SCN Q 1 - Asa Norte', 118, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:25', NULL, NULL, NULL, 315, 'Brazil'),
(509, 1, 'Salman Shaikh', '400401-22', 'Tianyun ', 0, 0, 'tianyun.zhu@cdnetworks.com', 'Zhu', NULL, '(8135) 909-3373', NULL, 0, 1, '160-0023', 'Chome-10-1 Hitochi Nishi Shinjuku Building 8F', 'Shinjuku City', 145, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:25', NULL, NULL, NULL, 316, 'Japan'),
(510, 1, 'Faizan Shaikh', '400401-31', 'Rafael ', 0, 0, 'rafael.gurgel@autotrac.com.br', 'Gurgel ', NULL, '(55613) 307-7000', NULL, 0, 1, '70711-070', 'Autotrac - SCN Q 1 Bloco G Ed. Rossi Esplanada Business - Sobreloja', 'SCN Q 1 - Asa Norte', 118, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:26', NULL, NULL, NULL, 315, 'Brazil'),
(511, 1, 'Salman Shaikh', '400401-22', 'Yasuji ', 0, 0, 'yasuji.aoki@cdnetworks.com', 'Aoki', NULL, '(8135) 909-3373', NULL, 0, 1, '160-0023', 'Chome-10-1 Hitochi Nishi Shinjuku Building 8F', 'Shinjuku City', 111, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:26', NULL, NULL, NULL, 293, 'Japan'),
(512, 1, 'Salman Shaikh', '400401-22', 'Koji ', 0, 0, 'koji.sakakura@unrulymedia.com', 'Sakakura', NULL, '(81501) 744-1744', NULL, 0, 1, '105-0001', 'Floor 43535 1-10-5, 10 Toranomon', 'Minato City', 111, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:27', NULL, NULL, NULL, 317, 'Japan'),
(513, 1, 'Salman Shaikh', '400401-22', 'Tomohiko ', 0, 0, 'tomohiko.aida@unrulymedia.com', 'Aida', NULL, '(81501) 744-1744', NULL, 0, 1, '105-0001', 'Floor 43535 1-10-5, 10 Toranomon', 'Minato City', 111, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:27', NULL, NULL, NULL, 317, 'Japan'),
(514, 1, 'Salman Shaikh', '400401-22', 'Akira ', 0, 0, 'asenoo@workfusion.com', 'Senoo', NULL, '(8136) 846-8001', NULL, 0, 1, '163-0649', '49th floor Shinjuku Center Building, 1-25-1,', 'Nishi-Shinjuku', 111, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:27', NULL, NULL, NULL, 318, 'Japan'),
(515, 1, 'Salman Shaikh', '400401-22', 'Kenichi ', 0, 0, 'kmoriya@workfusion.com', 'Moriya', NULL, '(8136) 846-8001', NULL, 0, 1, '163-0649', '49th floor Shinjuku Center Building, 1-25-1,', 'Nishi-Shinjuku', 117, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:27', NULL, NULL, NULL, 319, 'Japan'),
(516, 1, 'Prema Minj', '400401-19', 'Daniel Bosquet', 0, 0, 'daniel.bosquet@between.tech', 'Moliner', NULL, '(3493) 314-1925', NULL, 0, 1, '8027', '8º, Avinguda Meridiana', 'Barcelona', 142, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:27', NULL, NULL, NULL, 320, 'Spain'),
(517, 1, 'Aishwariya Singh', '400401-17', 'Lisa', 0, 0, 'lisa.beij@unit4.com', 'Beij', NULL, '(3188) 247-1777', NULL, 0, 1, '3528 BJ', 'Papendorpseweg 100', 'Utrecht', 82, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:28', NULL, NULL, NULL, 321, 'Netherlands'),
(518, 1, 'Kashifa Shaikh', '400401-20', 'Tomás Muñoz', 0, 0, 'tgutierrez@biosearchlife.com', 'Gutiérrez', NULL, '(3495) 824-0152', NULL, 0, 1, '18004', 'C/ Camino De Purchil', 'Granada', 81, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:28', NULL, NULL, NULL, 322, 'Spain'),
(519, 1, 'Salman Shaikh', '400401-22', 'Chikashi ', 0, 0, 'cseki@workfusion.com', 'Seki', NULL, '(8136) 846-8001', NULL, 0, 1, '163-0649', '49th floor Shinjuku Center Building, 1-25-1,', 'Nishi-Shinjuku', 111, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:28', NULL, NULL, NULL, 318, 'Japan'),
(520, 1, 'Kashifa Shaikh', '400401-20', 'Celia Pérez', 0, 0, 'cperez@biosearchlife.com', 'Pérez', NULL, '(3495) 824-0152', NULL, 0, 1, '18004', 'C/ Camino De Purchil', 'Granada', 81, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:28', NULL, NULL, NULL, 322, 'Spain'),
(521, 1, 'Musaddique Shaikh', '400401-26', 'Itay ', 0, 0, 'itay.avilevich@celeno.com', 'Avilevich', NULL, '(9729) 745-4646', NULL, 0, 1, '4366250', '26 Zarhin Street ', 'Ra\'anana', 162, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:32:28', NULL, NULL, NULL, 323, 'Israel'),
(522, 1, 'Musaddique Shaikh', '400401-18', 'Julia', 0, 0, 'julia.karlsson@inriver.com', 'Karlsson', NULL, '(464) 097-3880', NULL, 0, 1, '211 40', 'Södra Tullgatan 4', 'Malmoe', 87, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:29', NULL, NULL, NULL, 324, 'Sweden'),
(523, 1, 'Musaddique Shaikh', '400401-26', 'Ohad ', 0, 0, 'ohad@galooli.com', 'Pitcho', NULL, '(9723) 565-6900', NULL, 0, 1, '6713701', '52 Begin Road ', 'Tel-Aviv,', 106, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:29', NULL, NULL, NULL, 325, 'Israel'),
(524, 1, 'Kashifa Shaikh', '400401-20', 'James ', 0, 0, 'jneldrett@biosearchlife.com', 'Neldrett', NULL, '(3495) 824-0152', NULL, 0, 1, '18004', 'C/ Camino De Purchil', 'Granada', 163, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:32:29', NULL, NULL, NULL, 326, 'Spain'),
(525, 1, 'Aishwariya Singh', '400401-17', 'Richard ', 0, 0, 'richard.wimmer@unit4.com', 'Wimmer', NULL, '(3188) 247-1777', NULL, 0, 1, '3528 BJ', 'Papendorpseweg 100', 'Utrecht', 77, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:29', NULL, NULL, NULL, 327, 'Netherlands'),
(526, 1, 'Kashifa Shaikh', '400401-20', 'Laura ', 0, 0, 'lguillen@biosearchlife.com', 'Guillen', NULL, '(3495) 824-0152', NULL, 0, 1, '18004', 'C/ Camino De Purchil', 'Granada', 81, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:29', NULL, NULL, NULL, 328, 'Spain'),
(527, 1, 'Musaddique Shaikh', '400401-26', 'Ron', 0, 0, 'ron.samun@auto-talks.com', 'Samun', NULL, '(9729) 886-5300', NULL, 0, 1, '40593', 'Grand Netter Building', 'POB 3846', 62, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:30', NULL, NULL, NULL, 329, 'Israel'),
(528, 1, 'Kashifa Shaikh', '400401-20', 'Carmen García ', 0, 0, 'cdorado@biosearchlife.com', 'dorado', NULL, '(3495) 824-0152', NULL, 0, 1, '18004', 'C/ Camino De Purchil', 'Granada', 79, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:30', NULL, NULL, NULL, 330, 'Spain'),
(529, 1, 'Musaddique Shaikh', '400401-26', 'Lee ', 0, 0, 'lee.cohen@auto-talks.com', 'Cohen', NULL, '(9729) 886-5300', NULL, 0, 1, '40593', 'Grand Netter Building', 'POB 3846', 107, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:30', NULL, NULL, NULL, 331, 'Israel'),
(530, 1, 'Kashifa Shaikh', '400401-20', 'Diego Morante', 0, 0, 'dcalleja@biosearchlife.com', 'Calleja', NULL, '(3495) 824-0152', NULL, 0, 1, '18004', 'C/ Camino De Purchil', 'Granada', 81, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:30', NULL, NULL, NULL, 328, 'Spain'),
(531, 1, 'Kashifa Shaikh', '400401-20', 'Marcelo ', 0, 0, 'mdurante@biosearchlife.com', 'Durante', NULL, '(3495) 824-0152', NULL, 0, 1, '18004', 'C/ Camino De Purchil', 'Granada', 81, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:30', NULL, NULL, NULL, 328, 'Spain'),
(532, 1, 'Sakib Patni', '400401-16', 'David ', 0, 0, 'david.inman@ampelmann.nl', 'Inman', NULL, '(3120) 240-0121', NULL, 0, 1, '2612 HL ', 'Oostsingel 209', 'Delft', 77, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:30', NULL, NULL, NULL, 332, 'Netherlands'),
(533, 1, 'Kashifa Shaikh', '400401-28', 'Daniel ', 0, 0, 'd.brusch@comatch.com', 'Brusch', NULL, '(49304) 036-5690', NULL, 0, 1, '10551 ', 'Stromstraße 15,', 'Berlin', 47, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:30', NULL, NULL, NULL, 278, 'Germany'),
(534, 1, 'Prema Minj', '400401-19', 'María Cano', 0, 0, 'maria.cano@between.tech', 'González', NULL, '(3493) 314-1925', NULL, 0, 1, '8027', '8º, Avinguda Meridiana, 358', 'Barcelona', 99, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:31', NULL, NULL, NULL, 302, 'Spain'),
(535, 1, 'Musaddique Shaikh', '400401-26', 'Hilit ', 0, 0, 'hilit@priority-software.com', 'Lachower', NULL, '(9723) 925-1000', NULL, 0, 1, '4809245', 'Amal St 12', 'Rosh Haayin,', 107, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:31', NULL, NULL, NULL, 333, 'Israel'),
(536, 1, 'Musaddique Shaikh', '400401-26', 'Arnon ', 0, 0, 'arnon@priority-software.com', 'Ben-Isaac', NULL, '(9723) 925-1000', NULL, 0, 1, '4809245', 'Amal St 12, ', 'Rosh Haayin, ', 62, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:31', NULL, NULL, NULL, 334, 'Israel'),
(537, 1, 'Kashifa Shaikh', '400401-28', 'Adrien ', 0, 0, 'a.canevali@comatch.com', 'Canevali', NULL, '(49304) 036-5690', NULL, 0, 1, '10551 ', 'Stromstraße 15,', 'Berlin', 47, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:31', NULL, NULL, NULL, 278, 'Germany'),
(538, 1, 'Amit Nimbalkar', '400401-18', 'Amanda ', 0, 0, 'amanda@teamtailor.com', 'Funk', NULL, '(4610) 330-2222', NULL, 0, 1, 'SE- 116 24', 'ÅSÖGATAN 119', 'Stockholm', 87, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:31', NULL, NULL, NULL, 123, 'Sweden'),
(539, 1, 'Kashifa Shaikh', '400401-28', 'Amélie ', 0, 0, 'a.kerne@comatch.com', 'Kerne', NULL, '(49304) 036-5690', NULL, 0, 1, '10551 ', 'Stromstraße 15,', 'Berlin', 47, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:32', NULL, NULL, NULL, 278, 'Germany'),
(540, 1, 'Amit Nimbalkar', '400401-18', 'Natasa ', 0, 0, 'natasa@teamtailor.com', 'Milenovic', NULL, '(4610) 330-2222', NULL, 0, 1, 'SE- 116 24', 'ÅSÖGATAN 119', 'Stockholm', 86, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:32', NULL, NULL, NULL, 335, 'Sweden'),
(541, 1, 'Prema Minj', '400401-28', 'Tino ', 0, 0, 'thausweiler@dynavax.com', 'Hausweiler', NULL, '(4921) 175-8450', NULL, 0, 1, '40595', 'Eichsfelder Str. 11', 'Düsseldorf', 96, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:32', NULL, NULL, NULL, 336, 'Germany'),
(542, 1, 'Prema Minj', '400401-28', 'Andy ', 0, 0, 'alorenc@dynavax.com', 'Lorenc', NULL, '(4921) 175-8450', NULL, 0, 1, '40595', 'Eichsfelder Str. 11', 'Düsseldorf', 72, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:32', NULL, NULL, NULL, 337, 'Germany'),
(543, 1, 'Prema Minj', '400401-28', 'Sofia ', 0, 0, 'sofia.alves@freenetdigital.com', 'Alves', NULL, '(49180) 655-4890', NULL, 0, 1, '10178', 'Karl-Liebknecht-Str. 32,', 'Berlin', 65, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:32', NULL, NULL, NULL, 338, 'Germany'),
(544, 1, 'Musaddique Shaikh', '400401-26', 'Liran ', 0, 0, 'liran_l@optimove.com', 'Livne', NULL, '(9723) 672-4546', NULL, 0, 1, '6706054', '2 HaShlosha St', '33rd Floor,', 107, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:32', NULL, NULL, NULL, 339, 'Israel'),
(545, 1, 'Aishwariya Singh', '400401-17', 'Michael ', 0, 0, 'mroos@emspay.eu', 'Roos', NULL, '(3120) 660-3040', NULL, 0, 1, '1101 CN', 'Herikerbergweg 25', 'Amsterdam', 164, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:32:33', NULL, NULL, NULL, 340, 'Netherlands'),
(546, 1, 'Prema Minj', '400401-28', 'Lena ', 0, 0, 'lena.tetzlaff@gravis.de', 'Tetzlaff', NULL, '(49303) 902-2222', NULL, 0, 1, '10587', 'Ernst-Reuter-Platz 8,', 'Berlin', 65, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:34', NULL, NULL, NULL, 341, 'Germany'),
(547, 1, 'Musaddique Shaikh', '400401-18', 'Jenny ', 0, 0, 'jenny.husberger@inriver.com', 'Husberger', NULL, '(464) 097-3880', NULL, 0, 1, '211 40', 'Södra Tullgatan 4', 'Malmoe', 87, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:34', NULL, NULL, NULL, 324, 'Sweden'),
(548, 1, 'Musaddique Shaikh', '400401-18', 'Susanna ', 0, 0, 'susanna.martensson@inriver.com', 'Mårtensson', NULL, '(464) 097-3880', NULL, 0, 1, '211 40', 'Södra Tullgatan 4', 'Malmoe', 84, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:34', NULL, NULL, NULL, 342, 'Sweden'),
(549, 1, 'Aishwariya Singh', '400401-17', 'Matthijs ', 0, 0, 'mpronk@emspay.eu', 'Pronk', NULL, '(3120) 660-3040', NULL, 0, 1, '1101 CN', 'Herikerbergweg 25', 'Amsterdam', 77, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:34', NULL, NULL, NULL, 283, 'Netherlands'),
(550, 1, 'Salman Shaikh', '400401-27', 'Adam ', 0, 0, 'adam.gatnar@quandoo.com', 'Gatnar', NULL, '(49800) 693-2226', NULL, 0, 1, '10435', 'KulturBrauerei, Schönhauser Allee 36', 'Berlin', 110, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:34', NULL, NULL, NULL, 343, 'Germany');
INSERT INTO `bf_prospects` (`id`, `salutation_id`, `first_name`, `middle_name`, `last_name`, `job_level_id`, `job_functions_id`, `title`, `email_id`, `direct_number`, `mobile_number`, `office_number`, `country`, `state`, `city`, `address_1`, `address_2`, `company_id`, `dnc`, `src`, `customer_id`, `deleted`, `deleted_by`, `created_on`, `created_by`, `modified_on`, `modified_by`, `domain_id`, `zip`) VALUES
(551, 1, 'Prema Minj', '400401-28', 'Lars ', 0, 0, 'lars.broschk@gravis.de', 'Broschk', NULL, '(49303) 902-2222', NULL, 0, 1, '10587', 'Ernst-Reuter-Platz 8', 'Berlin', 65, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:34', NULL, NULL, NULL, 341, 'Germany'),
(552, 1, 'Musaddique Shaikh', '400401-18', 'Anna ', 0, 0, 'anna.hedlund@m.co', 'Hedlund', NULL, '(4685) 809-7454', NULL, 0, 1, '111 44', 'Jakobsbergsgatan 17,', 'Stockholm', 165, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:32:35', NULL, NULL, NULL, 344, 'Sweden'),
(553, 1, 'Salman Shaikh', '400401-22', 'Ayaho ', 0, 0, 'ayaho.miki@tbwahakuhodo.co.jp', 'Miki', NULL, '(8135) 446-7200', NULL, 0, 1, '105-0023', '1-13-10 Shibaura', 'Minatoku', 145, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:35', NULL, NULL, NULL, 345, 'Japan'),
(554, 1, 'Aishwariya Singh', '400401-17', 'Erik ', 0, 0, 'erik.hoeboer@unit4.com', 'Hoeboer', NULL, '(3188) 247-1777', NULL, 0, 1, '3528 BJ', 'Papendorpseweg 100', 'Utrecht', 80, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:35', NULL, NULL, NULL, 346, 'Netherlands'),
(555, 1, 'Prema Minj', '400401-28', 'Rudolf ', 0, 0, 'rudolf.toth@scopegroup.com', 'Toth', NULL, '(493) 027-8910', NULL, 0, 1, '10785', 'Lennéstrasse 5', 'Berlin', 96, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:35', NULL, NULL, NULL, 347, 'Germany'),
(556, 1, 'Prema Minj', '400401-19', 'Eduardo Seco', 0, 0, 'eduardo.seco@between.tech', 'Presencio', NULL, '(3493) 314-1925', NULL, 0, 1, '8027', '8º, Avinguda Meridiana, 358', 'Barcelona', 99, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:35', NULL, NULL, NULL, 348, 'Spain'),
(557, 1, 'Aishwariya Singh', '400401-17', 'Gijs', 0, 0, 'gijs.gompen@unit4.com', 'Gompen', NULL, '(3188) 247-1777', NULL, 0, 1, '3528 BJ', 'Papendorpseweg 100', 'Utrecht', 80, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:35', NULL, NULL, NULL, 346, 'Netherlands'),
(558, 1, 'Prema Minj', '400401-28', 'Sarah ', 0, 0, 'sarah.noack@scopegroup.com', 'Noack', NULL, '(493) 027-8910', NULL, 0, 1, '10785', 'Lennéstrasse 5', 'Berlin', 67, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:36', NULL, NULL, NULL, 349, 'Germany'),
(559, 1, 'Prema Minj', '400401-19', 'Camilo', 0, 0, 'camilo.tejera@palexmedical.com', 'Tejera', NULL, '(3493) 400-6500', NULL, 0, 1, '08174', 'Jesus Serra Santamans, 5, Sant Cugat Del Vallés', 'Sant Cugat del Valles', 81, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:36', NULL, NULL, NULL, 350, 'Spain'),
(560, 1, 'Kaif Khan', '400401-24', 'Simone ', 0, 0, 'simone.sicuro@triboo.com', 'Sicuro', NULL, '(39026) 474-1401', NULL, 0, 1, '20126 ', 'Viale Sarca, 336/Edificio 16', 'Milano', 166, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:32:36', NULL, NULL, NULL, 351, 'Italy'),
(561, 1, 'Aishwariya Singh', '400401-17', 'Jos ', 0, 0, 'jos.meerkerk@unit4.com', 'Meerkerk', NULL, '(3188) 247-1777', NULL, 0, 1, '3528 BJ', 'Papendorpseweg 100', 'Utrecht', 167, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:32:36', NULL, NULL, NULL, 352, 'Netherlands'),
(562, 1, 'Prema Minj', '400401-19', 'Robert López', 0, 0, 'rguimera@palexmedical.com', 'Guimera', NULL, '(3493) 400-6500', NULL, 0, 1, '08174', 'Jesus Serra Santamans, 5, Sant Cugat Del Vallés,', 'Sant Cugat del Valles', 79, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:37', NULL, NULL, NULL, 353, 'Spain'),
(563, 1, 'Kaif Khan', '400401-24', 'Alberto ', 0, 0, 'alberto.vottero@triboo.com', 'Vottero', NULL, '(39026) 474-1401', NULL, 0, 1, '20126 ', 'Viale Sarca, 336/Edificio 16', 'Milano', 168, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:32:37', NULL, NULL, NULL, 354, 'Italy'),
(564, 1, 'Salman Shaikh', '400401-22', 'Makiko ', 0, 0, 'makiko.abe@tbwahakuhodo.co.jp', 'Abe', NULL, '(8135) 446-7200', NULL, 0, 1, '105-0023', '1-13-10 Shibaura', 'Minatoku', 145, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:37', NULL, NULL, NULL, 345, 'Japan'),
(565, 1, 'Prema Minj', '400401-19', 'Jose Antonio', 0, 0, 'jpovedano@palexmedical.com', 'Segura Povedano', NULL, '(3493) 400-6500', NULL, 0, 1, '08174', 'Jesus Serra Santamans, 5, Sant Cugat Del Vallés', 'Sant Cugat del Valles', 99, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:37', NULL, NULL, NULL, 355, 'Spain'),
(566, 1, 'Kaif Khan', '400401-24', 'Marco ', 0, 0, 'marco.cappellini@triboo.com', 'Cappellini', NULL, '(39026) 474-1401', NULL, 0, 1, '20126 ', 'Viale Sarca, 336/Edificio 16', 'Milano', 169, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:32:37', NULL, NULL, NULL, 356, 'Italy'),
(567, 1, 'Prema Minj', '400401-19', 'Enrique Falcón', 0, 0, 'eprado@palexmedical.com', 'Prado', NULL, '(3493) 400-6500', NULL, 0, 1, '08174', 'Jesus Serra Santamans, 5, Sant Cugat Del Vallés,', ' Sant Cugat del Valles,', 81, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:38', NULL, NULL, NULL, 357, 'Spain'),
(568, 1, 'Aishwariya Singh', '400401-17', 'Ruud', 0, 0, 'ruud.martens@unit4.com', 'Martens', NULL, '(3188) 247-1777', NULL, 0, 1, '3528 BJ', 'Papendorpseweg 100', 'Utrecht', 77, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:38', NULL, NULL, NULL, 327, 'Netherlands'),
(569, 1, 'Amit Nimbalkar', '400401-18', 'Anna ', 0, 0, 'anna@teamtailor.com', 'Wallander', NULL, '(4610) 330-2222', NULL, 0, 1, 'SE- 116 24', 'ÅSÖGATAN 119', 'Stockholm', 85, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:38', NULL, NULL, NULL, 358, 'Sweden'),
(570, 1, 'Kaif Khan', '400401-24', 'Doriana ', 0, 0, 'doriana.albi@triboo.com', 'Albi', NULL, '(39026) 474-1401', NULL, 0, 1, '20126 ', 'Viale Sarca, 336/Edificio 16', 'Milano', 170, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:32:38', NULL, NULL, NULL, 359, 'Italy'),
(571, 1, 'Kaif Khan', '400401-24', 'Maria', 0, 0, 'maria.scarrone@triboo.com', 'Scarrone', NULL, '(39026) 474-1401', NULL, 0, 1, '20126 ', 'Viale Sarca, 336/Edificio 16', 'Milano', 171, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:32:38', NULL, NULL, NULL, 360, 'Italy'),
(572, 1, 'Kaif Khan', '400401-24', 'Fabio ', 0, 0, 'fabio.rubini@triboo.com', 'Rubini', NULL, '(39026) 474-1401', NULL, 0, 1, '20126 ', 'Viale Sarca, 336/Edificio 16', 'Milano', 172, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:32:39', NULL, NULL, NULL, 361, 'Italy'),
(573, 1, 'Aishwariya Singh', '400401-17', 'Michel ', 0, 0, 'michel.middelkoop@unit4.com', 'Middelkoop', NULL, '(3188) 247-1777', NULL, 0, 1, '3528 BJ', 'Papendorpseweg 100', 'Utrecht', 77, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:39', NULL, NULL, NULL, 327, 'Netherlands'),
(574, 1, 'Kaif Khan', '400401-24', 'Marco ', 0, 0, 'marco.palermo@triboo.com', 'Palermo', NULL, '(39026) 474-1401', NULL, 0, 1, '20126 ', 'Viale Sarca, 336/Edificio 16', 'Milano', 173, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:32:40', NULL, NULL, NULL, 362, 'Italy'),
(575, 1, 'Prema Minj', '400401-28', 'Alexandru ', 0, 0, 'alexandru.boicu@scopegroup.com', 'Boicu', NULL, '(493) 027-8910', NULL, 0, 1, '10785', 'Lennéstrasse 5', 'Berlin', 96, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:40', NULL, NULL, NULL, 347, 'Germany'),
(576, 1, 'Musaddique Shaikh', '400401-26', 'Robert ', 0, 0, 'robert_f@optimove.com', 'Fleischaker', NULL, '(9723) 672-4546', NULL, 0, 1, '6706054', '2 HaShlosha St', '33rd Floor', 174, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:32:40', NULL, NULL, NULL, 363, 'Israel'),
(577, 1, 'Prema Minj', '400401-28', 'Frank Wittich', 0, 0, 'frank.bocker@scopegroup.com', 'Böcker', NULL, '(493) 027-8910', NULL, 0, 1, '10785', ' Lennéstrasse 5', 'Berlin', 65, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:40', NULL, NULL, NULL, 364, 'Germany'),
(578, 1, 'Prema Minj', '400401-28', 'Frank ', 0, 0, 'frank.neumann@scopegroup.com', 'Neumann', NULL, '(493) 027-8910', NULL, 0, 1, '10785', ' Lennéstrasse 5', 'Berlin', 68, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:40', NULL, NULL, NULL, 365, 'Germany'),
(579, 1, 'Kashifa Shaikh', '400401-20', 'Mattia ', 0, 0, 'mattia.ferrario@signaturit.com', 'Ferrario', NULL, '(3493) 551-1480', NULL, 0, 1, '8005', 'Calle Àvila, 29,', 'Barcelona', 98, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:41', NULL, NULL, NULL, 366, 'Spain'),
(580, 1, 'Musaddique Shaikh', '400401-26', 'Shirly ', 0, 0, 'shirly_e@optimove.com', 'Evrany', NULL, '(9723) 672-4546', NULL, 0, 1, '6706054', '2 HaShlosha St', '33rd Floor,', 107, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:41', NULL, NULL, NULL, 339, 'Israel'),
(581, 1, 'Musaddique Shaikh', '400401-26', 'Amit ', 0, 0, 'amit_b@optimove.com', 'Bivas', NULL, '(9723) 672-4546', NULL, 0, 1, '6706054', '2 HaShlosha St', '33rd Floor, ', 106, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:41', NULL, NULL, NULL, 367, 'Israel'),
(582, 1, 'Musaddique Shaikh', '400401-26', 'Lior ', 0, 0, 'lior_h@optimove.com', 'Hakimi', NULL, '(9723) 672-4546', NULL, 0, 1, '6706054', '2 HaShlosha St', '33rd Floor,', 62, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:41', NULL, NULL, NULL, 368, 'Israel'),
(583, 1, 'Musaddique Shaikh', '400401-26', 'Motti ', 0, 0, 'motti_c@optimove.com', 'Colman', NULL, '(9723) 672-4546', NULL, 0, 1, '6706054', ' 2 HaShlosha St', '33rd Floor', 60, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:41', NULL, NULL, NULL, 369, 'Israel'),
(584, 1, 'Wasiya Shaikh', '400401-26', 'Liran ', 0, 0, 'liran.livne@optimove.com', 'Livne', NULL, '(9723) 672-4546', NULL, 0, 1, '6706054', 'Adgar 360 Tower', '2 HaShlosha St 33rd Floor', 107, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:41', NULL, NULL, NULL, 339, 'Israel'),
(585, 1, 'Wasiya Shaikh', '400401-26', 'Motti ', 0, 0, 'motti.colman@optimove.com', 'Colman', NULL, '(9723) 672-4546', NULL, 0, 1, '6706054', 'Adgar 360 Tower', '2 HaShlosha St 33rd Floor', 60, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:41', NULL, NULL, NULL, 369, 'Israel'),
(586, 1, 'Prema Minj', '400401-19', 'Agustín Pérez ', 0, 0, 'aperez@palexmedical.com', 'Fornieles', NULL, '(3493) 400-6500', NULL, 0, 1, '8174', 'Jesus Serra Santamans, 5, Sant Cugat Del Vallés', 'Sant Cugat del Valles', 81, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:42', NULL, NULL, NULL, 350, 'Spain'),
(587, 1, 'Wasiya Shaikh', '400401-26', 'Lior ', 0, 0, 'lior.hakimi@optimove.com', 'Hakimi', NULL, '(9723) 672-4546', NULL, 0, 1, '6706054', 'Adgar 360 Tower', '2 HaShlosha St 33rd Floor', 62, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:42', NULL, NULL, NULL, 368, 'Israel'),
(588, 1, 'Prema Minj', '400401-28', 'Thomas ', 0, 0, 'thomas.auschill@scopegroup.com', 'Auschill', NULL, '(493) 027-8910', NULL, 0, 1, '10785', 'Lennéstrasse 5', 'Berlin', 47, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:42', NULL, NULL, NULL, 370, 'Germany'),
(589, 1, 'Wasiya Shaikh', '400401-26', 'Renana', 0, 0, 'renana_levin@optimove.com', 'Levin', NULL, '(9723) 672-4546', NULL, 0, 1, '6706054', 'Adgar 360 Tower', '2 HaShlosha St 33rd Floor', 107, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:42', NULL, NULL, NULL, 339, 'Israel'),
(590, 1, 'Kaif Khan', '400401-24', 'Gianni ', 0, 0, 'gianni.pintonello@coyote.com', 'Pintonello', NULL, '(3920) 799-8300', NULL, 0, 1, '2545 ', 'Diversey Ave', 'Milan', 109, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:42', NULL, NULL, NULL, 371, 'Italy'),
(591, 1, 'Abrar Shaikh', '400401-23', 'Chris ', 0, 0, 'chris@bmes.com', 'Organ', NULL, '(8134) 550-2081', NULL, 0, 1, '104-0061', 'Ginza Daiei Bldg 3F 1-16-7 Ginza', 'Chuo-ku', 111, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:43', NULL, NULL, NULL, 372, 'Japan'),
(592, 1, 'Amit Nimbalkar', '400401-18', 'Christoffer ', 0, 0, 'christoffer.wester@plmgroup.se', 'Wester', NULL, '(4637) 069-0950', NULL, 0, 1, 'SE-215 82 ', 'Axel Danielssons väg 267', 'Malmo', 175, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:32:43', NULL, NULL, NULL, 373, 'Sweden'),
(593, 1, 'Prema Minj', '400401-19', 'Miguel Angel', 0, 0, 'mlopez@palexmedical.com', 'Martínez López', NULL, '(3493) 400-6500', NULL, 0, 1, '8174', 'Jesus Serra Santamans, 5, Sant Cugat Del Vallés', 'Sant Cugat del Valles', 73, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:43', NULL, NULL, NULL, 374, 'Spain'),
(594, 1, 'Wasiya Shaikh', '400401-26', 'Marcelo ', 0, 0, 'm.chiminazzo@socialblue.com', 'Chiminazzo', NULL, '(3122) 928-3000', NULL, 0, 1, '1625 ', 'Nieuwe ', 'Steen 27', 176, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:32:43', NULL, NULL, NULL, 375, 'Netherlands'),
(595, 1, 'Prema Minj', '400401-19', 'Enrique ', 0, 0, 'erollan@itnow.es', 'Rollan', NULL, '(3493) 404-6706', NULL, 0, 1, '08029', 'C. Numància 164 - 7ª Planta', 'Barcelona', 149, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:43', NULL, NULL, NULL, 376, 'Spain'),
(596, 1, 'Salman Shaikh', '400401-22', 'Toshie ', 0, 0, 'toshie.ozawa@beaconcom.co.jp', 'Ozawa', NULL, '(8135) 437-7200', NULL, 0, 1, '141-0021', '3 Chome-1-1 Kamiosaki', 'Shinagawa City', 137, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:44', NULL, NULL, NULL, 228, 'Japan'),
(597, 1, 'Salman Shaikh', '400401-22', 'Haruna ', 0, 0, 'haruna.ishikawa@recruit.jp', 'Ishikawa', NULL, '(8136) 835-1111', NULL, 0, 1, '100-6640', '1-9-2 Marunouchi', '1-9-2 Marunouchi', 112, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:44', NULL, NULL, NULL, 377, 'Japan'),
(598, 1, 'Wasiya Shaikh', '400401-26', 'Jason ', 0, 0, 'jason.dietz@naturalint.com', 'Dietz', NULL, '(97272) 272-3840', NULL, 0, 1, '6102500', 'Natural Intelligence, ToHa', 'Totseret ha-Arets St 6-', 177, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:32:44', NULL, NULL, NULL, 378, 'Israel'),
(599, 1, 'Prema Minj', '400401-28', 'Michael ', 0, 0, 'michael.birzer@scopegroup.com', 'Birzer', NULL, '(493) 027-8910', NULL, 0, 1, '10785', 'Lennéstrasse 5', 'Berlin', 67, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:44', NULL, NULL, NULL, 349, 'Germany'),
(600, 1, 'Wasiya Shaikh', '400401-26', 'Yoav ', 0, 0, 'yoav.gersi@naturalint.com', 'Gersi', NULL, '(97272) 272-3840', NULL, 0, 1, '6102500', 'Natural Intelligence, ToHa', 'Totseret ha-Arets St 6-', 178, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:32:44', NULL, NULL, NULL, 379, 'Israel'),
(601, 1, 'Abrar Shaikh', '400401-23', 'Tyler ', 0, 0, 'tyler.crane@systemsgo.asia', 'Crane', NULL, '(8134) 550-0880', NULL, 0, 1, '106-0041,', 'Azabu Amerex Building 3F 3-5-7 Azabudai', 'Minato-ku', 111, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:45', NULL, NULL, NULL, 380, 'Japan'),
(602, 1, 'Prema Minj', '400401-28', 'Johannes', 0, 0, 'johannes.tschepe@wom.group', 'Tschepe', NULL, '(49303) 998-1550', NULL, 0, 1, '10587', 'Salzufer 8', 'Berlin', 47, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:45', NULL, NULL, NULL, 381, 'Germany'),
(603, 1, 'Salman Shaikh', '400401-22', 'Shota ', 0, 0, 'shota.nakane@recruit.jp', 'Nakane', NULL, '(8136) 835-1111', NULL, 0, 1, '100-6640', '1-9-2 Marunouchi', 'Tokyo', 112, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:45', NULL, NULL, NULL, 377, 'Japan'),
(604, 1, 'Wasiya Shaikh', '400401-26', 'Roei ', 0, 0, 'roei.hamani@naturalint.com', 'Hamani', NULL, '(97272) 272-3840', NULL, 0, 1, '6102500', 'Natural Intelligence, ToHa', 'Totseret ha-Arets St 6-', 177, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:45', NULL, NULL, NULL, 378, 'Israel'),
(605, 1, 'Wasiya Shaikh', '400401-26', 'Elie ', 0, 0, 'elie.hochhauser@naturalint.com', 'Hochhauser', NULL, '(97272) 272-3840', NULL, 0, 1, '6102500', 'Natural Intelligence, ToHa', 'Totseret ha-Arets St 6-', 177, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:45', NULL, NULL, NULL, 378, 'Israel'),
(606, 1, 'Wasiya Shaikh', '400401-26', 'Moshe Ben', 0, 0, 'moshe.ezra@naturalint.com', 'Ezra', NULL, '(97272) 272-3840', NULL, 0, 1, '6102500', 'Natural Intelligence, ToHa', 'Totseret ha-Arets St 6-', 179, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:32:45', NULL, NULL, NULL, 382, 'Israel'),
(607, 1, 'Salman Shaikh', '400401-22', 'Yuichiro ', 0, 0, 'yuichiro.shimizu@recruit.jp', 'Shimizu', NULL, '(8136) 835-1111', NULL, 0, 1, '100-6640', '1-9-2 Marunouchi', 'Tokyo', 111, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:45', NULL, NULL, NULL, 383, 'Japan'),
(608, 1, 'Kaif Khan', '400401-24', 'Angelica ', 0, 0, 'angelica.coviello@talentia-software.com', 'Coviello', NULL, '(39026) 749-0488', NULL, 0, 1, '20159 ', 'Via Valtellina', 'Milano ', 109, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:45', NULL, NULL, NULL, 384, 'Italy'),
(609, 1, 'Wasiya Shaikh', '400401-26', 'Dan ', 0, 0, 'dan.mitelman@naturalint.com', 'Mitelman', NULL, '(97272) 272-3840', NULL, 0, 1, '6102500', 'Natural Intelligence, ToHa', 'Totseret ha-Arets St 6-', 177, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:46', NULL, NULL, NULL, 378, 'Israel'),
(610, 1, 'Abrar Shaikh', '400401-23', 'Shogo ', 0, 0, 'shogo@wantedly.com', 'Yamaguchi', NULL, '(8136) 369-2018', NULL, 0, 1, '108-0071', '5-12-7 MG Shirokanedai 4F, Shirokanedai', 'Minato-ku', 111, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:46', NULL, NULL, NULL, 385, 'Japan'),
(611, 1, 'Salman Shaikh', '400401-22', 'Naoki ', 0, 0, 'naoki.nishimura@recruit.jp', 'Nishimura', NULL, '(8136) 835-1111', NULL, 0, 1, '100-6640', '1-9-2 Marunouchi', 'Tokyo', 180, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:32:47', NULL, NULL, NULL, 386, 'Japan'),
(612, 1, 'Wasiya Shaikh', '400401-26', 'Yael ', 0, 0, 'yael@pendo.io', 'Groober', NULL, '(97273) 769-5000', NULL, 0, 1, '4673304', 'Arik ', 'Einstein St', 107, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:47', NULL, NULL, NULL, 387, 'Israel'),
(613, 1, 'Salman Shaikh', '400401-22', 'Koji ', 0, 0, 'koji.kawamoto@recruit.jp', 'Kawamoto', NULL, '(8136) 835-1111', NULL, 0, 1, '100-6640', '1-9-2 Marunouchi', 'Tokyo', 111, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:47', NULL, NULL, NULL, 383, 'Japan'),
(614, 1, 'Amit Nimbalkar', '400401-18', 'Nicklas ', 0, 0, 'nicklas.froborg@plmgroup.se', 'Froborg', NULL, '(4637) 069-0950', NULL, 0, 1, 'SE-215 82 ', 'Axel Danielssons väg 267', 'Malm0', 181, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:32:47', NULL, NULL, NULL, 388, 'Sweden'),
(615, 1, 'Wasiya Shaikh', '400401-26', 'Amir ', 0, 0, 'amir@aquasec.com', 'Klein', NULL, '(9723) 688-8799', NULL, 0, 1, '5250501', '2 Ze\'ev Jabotinsky Rd', 'Ramat Gan', 62, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:48', NULL, NULL, NULL, 389, 'Israel'),
(616, 1, 'Kaif Khan', '400401-24', 'Manuela ', 0, 0, 'manuela.pagani@talentia-software.com', 'Pagani', NULL, '(39026) 749-0488', NULL, 0, 1, '20159', 'Via Valtellina', 'Milano ', 154, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:48', NULL, NULL, NULL, 390, 'Italy'),
(617, 1, 'Wasiya Shaikh', '400401-26', 'Jacob ', 0, 0, 'jacob.freedman@naturalint.com', 'Freedman', NULL, '(97272) 272-3840', NULL, 0, 1, '6102500', 'Natural Intelligence, ToHa', 'Totseret ', 177, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:48', NULL, NULL, NULL, 378, 'Israel'),
(618, 1, 'Prema Minj', '400401-28', 'Joerg', 0, 0, 'joerg.schattler@wom.group', 'Schättler', NULL, '(49303) 998-1550', NULL, 0, 1, '10587', ' Salzufer 8', 'Berlin', 67, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:48', NULL, NULL, NULL, 391, 'Germany'),
(619, 1, 'Kaif Khan', '400401-24', 'Gabriele ', 0, 0, 'gabriele.bruno@talentia-software.com', 'Bruno', NULL, '(39026) 749-0488', NULL, 0, 1, '20159 ', 'Via Valtellina', 'Milano ', 154, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:48', NULL, NULL, NULL, 390, 'Italy'),
(620, 1, 'Salman Shaikh', '400401-22', 'Ryuichi ', 0, 0, 'ryuichi.iida@recruit.jp', 'Iida', NULL, '(8136) 835-1111', NULL, 0, 1, '100-6640', '1-9-2 Marunouchi', 'Tokyo', 145, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:48', NULL, NULL, NULL, 392, 'Japan'),
(621, 1, 'Prema Minj', '400401-28', 'Paul ', 0, 0, 'paul.eversheim@wom.group', 'Eversheim', NULL, '(49303) 998-1550', NULL, 0, 1, '10587', 'Salzufer 8', 'Berlin', 47, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:49', NULL, NULL, NULL, 381, 'Germany'),
(622, 1, 'Wasiya Shaikh', '400401-26', 'Or ', 0, 0, 'ofinkelshtein@avt-inc.com', 'Finkelshtein', NULL, '(9729) 761-4444', NULL, 0, 1, '4527703', '6 Hanagar St', 'Central District', 174, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:49', NULL, NULL, NULL, 393, 'Israel'),
(623, 1, 'Prema Minj', '400401-28', 'Jürgen ', 0, 0, 'jurgen.moormann@capita.com', 'Moormann', NULL, '(4943) 188-7060', NULL, 0, 1, '24143', 'Am Germaniahafen 1-7', 'Kiel', 47, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:49', NULL, NULL, NULL, 394, 'Germany'),
(624, 1, 'Abrar Shaikh', '400401-23', 'Eido ', 0, 0, 'eido.inoue@bebit.com.cn', 'Inoue', NULL, '(8135) 210-3891', NULL, 0, 1, '1020073', 'Ichigaya Tokyu Bldg. 7F, 4-2-1 Kudankita,', 'Chiyoda-ku,', 120, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:49', NULL, NULL, NULL, 395, 'Japan'),
(625, 1, 'Wasiya Shaikh', '400401-26', 'Merav ', 0, 0, 'merav.yanai@avt-inc.com', 'Yanai', NULL, '(9729) 761-4444', NULL, 0, 1, '4527703', '6 Hanagar St', 'Central District', 59, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:49', NULL, NULL, NULL, 396, 'Israel'),
(626, 1, 'Amit Nimbalkar', '400401-18', 'Emelie ', 0, 0, 'emelie.andersson@detectify.com', 'Andersson', NULL, '(4670) 487-1859', NULL, 0, 1, 'SE-111 56', 'Kungsgatan 37', 'Stockholm', 87, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:50', NULL, NULL, NULL, 397, 'Sweden'),
(627, 1, 'Sakib Patni', '400401-16', 'Ilona ', 0, 0, 'ilona_demmers@contentserv.com', 'Demmers', NULL, '(3163) 418-5447', NULL, 0, 1, '1033', 'Kraanspoor 50', '1033 SE Amsterdam', 80, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:50', NULL, NULL, NULL, 398, 'Netherlands'),
(628, 1, 'Sakib Patni', '400401-16', 'Eric ', 0, 0, 'eric_putten@contentserv.com', 'Putten', NULL, '(3163) 418-5447', NULL, 0, 1, '1033', 'Kraanspoor 50', '1033 SE Amsterdam', 74, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:50', NULL, NULL, NULL, 399, 'Netherlands'),
(629, 1, 'Prema Minj', '400401-19', 'Francisco ', 0, 0, 'francisco.castellano@axactor.es', 'Castellano De Pablo', NULL, '(3491) 012-0462', NULL, 0, 1, '47012', 'Calle Topacio, 60', 'Valladolid', 99, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:50', NULL, NULL, NULL, 400, 'Spain'),
(630, 1, 'Kaif Khan', '400401-24', 'Daniele ', 0, 0, 'daniele.biolcati@creditofondiario.eu', 'Biolcati', NULL, '(39) 065-7961', NULL, 0, 1, '20122', 'C.so Europa', 'Milano', 182, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:32:50', NULL, NULL, NULL, 401, 'Italy'),
(631, 1, 'Prema Minj', '400401-19', 'Sergio Sastre', 0, 0, 'sergio.sastre@axactor.es', 'Gonzalez', NULL, '(3491) 012-0462', NULL, 0, 1, '47012', 'Calle Topacio, 60', 'Valladolid', 99, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:51', NULL, NULL, NULL, 402, 'Spain'),
(632, 1, 'Prema Minj', '400401-19', 'Oscar ', 0, 0, 'orubio@palexmedical.com', 'Maldonado Rubio', NULL, '(3493) 400-6500', NULL, 0, 1, '08174', 'Jesus Serra Santamans, 5, Sant Cugat Del Vallés', ', Sant Cugat del Valles', 142, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:51', NULL, NULL, NULL, 403, 'Spain'),
(633, 1, 'Salman Shaikh', '400401-27', 'Alice ', 0, 0, 'Alice@adjust.com', 'Liu', NULL, '(49309) 146-0083', NULL, 0, 1, '10405', 'Saarbr�cker St. 36,', 'Berlin', 47, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:51', NULL, NULL, NULL, 404, 'Germany'),
(634, 1, 'Salman Shaikh', '400401-27', 'Federico', 0, 0, 'federico@adjust.com', 'Hernandez', NULL, '(49309) 146-0083', NULL, 0, 1, '10405', 'Saarbr�cker St. 36,', 'Berlin', 47, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:51', NULL, NULL, NULL, 404, 'Germany'),
(635, 1, 'Salman Shaikh', '400401-22', 'Ryoko ', 0, 0, 'ryoko.aoki@recruit.jp', 'Aoki', NULL, '(8136) 835-1111', NULL, 0, 1, '100-6640', '1-9-2 Marunouchi', 'Tokyo', 117, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:51', NULL, NULL, NULL, 405, 'Japan'),
(636, 1, 'Kaif Khan', '400401-24', 'Paolo ', 0, 0, 'paolo.peruzzetto@creditofondiario.eu', 'Peruzzetto', NULL, '(39) 065-7961', NULL, 0, 1, '20122', 'C.so Europa', 'Milano', 183, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:32:51', NULL, NULL, NULL, 406, 'Italy'),
(637, 1, 'Salman Shaikh', '400401-27', 'Fabian', 0, 0, 'fabian@adjust.com', 'Schaeffer', NULL, '(49309) 146-0083', NULL, 0, 1, '10405', 'Saarbr�cker St. 36,', 'Berlin', 47, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:52', NULL, NULL, NULL, 404, 'Germany'),
(638, 1, 'Kaif Khan', '400401-24', 'Matteo ', 0, 0, 'matteo.casot@creditofondiario.eu', 'Casot', NULL, '(39) 065-7961', NULL, 0, 1, '20122', 'C.so Europa', 'Milano', 184, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:32:52', NULL, NULL, NULL, 407, 'Italy'),
(639, 1, 'Salman Shaikh', '400401-27', 'Mert', 0, 0, 'mert@adjust.com', 'Can Turgut', NULL, '(49309) 146-0083', NULL, 0, 1, '10405', 'Saarbr�cker St. 36,', 'Berlin', 47, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:53', NULL, NULL, NULL, 404, 'Germany'),
(640, 1, 'Kaif Khan', '400401-24', 'Fabio ', 0, 0, 'fabio.trivellone@creditofondiario.eu', 'Trivellone', NULL, '(39) 065-7961', NULL, 0, 1, '20122', 'C.so Europa', 'Milano', 185, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:32:53', NULL, NULL, NULL, 408, 'Italy'),
(641, 1, 'Salman Shaikh', '400401-27', 'Benjamin', 0, 0, 'benjamin@adjust.com', 'Jasper', NULL, '(49309) 146-0083', NULL, 0, 1, '10405', 'Saarbr�cker St. 36,', 'Berlin', 68, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:53', NULL, NULL, NULL, 409, 'Germany'),
(642, 1, 'Musaddique Shaikh', '400401-18', 'Jonas ', 0, 0, 'jonas.skantz@m.co', 'Skantz', NULL, '(4685) 809-7454', NULL, 0, 1, '111 44', 'Jakobsbergsgatan 17', 'Stockholm', 78, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:53', NULL, NULL, NULL, 410, 'Sweden'),
(643, 1, 'Salman Shaikh', '400401-27', 'Leonid', 0, 0, 'leonid@adjust.com', 'Eletskikh', NULL, '(49309) 146-0083', NULL, 0, 1, '10405', 'Saarbr�cker St. 36,', 'Berlin', 47, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 13:32:53', NULL, NULL, NULL, 404, 'Germany'),
(644, 1, 'First Name', 'Middle Name', 'Last Name', 0, 0, 'Job Title', 'Email Id', 'Direct Nuber', 'Phone Number', NULL, 0, 1, 'State', 'Address', 'Address 2', 186, NULL, 'Profile Link', 2, 0, NULL, '2020-10-11 13:42:56', NULL, NULL, NULL, 411, 'ZIP'),
(645, 1, 'José ', '', 'Ramón', 0, 0, 'Global Head of Human Resources', 'jose.ramon@telxius.com', '3491', '(3491) 483-0612', NULL, 0, 1, 'Madrid', 'Ronda de la Comunicación s/n, Distrito Telefónica, Edificio Norte 2', '', 187, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:42:56', NULL, NULL, NULL, 412, '28050'),
(646, 1, 'Eric ', '', 'VARACHE', 0, 0, 'Group Human Resources Director', 'eric.varache@abilways.com', '3491', '(3314) 221-0202', NULL, 0, 1, ' Ile-de-France', 'rue du Louvre ', '', 188, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:42:57', NULL, NULL, NULL, 413, '75002'),
(647, 1, 'Badder ', '', 'Khlifa', 0, 0, 'Customer Service Manager ', 'badder.khlifa@solvinity.com', '3491', '(3120) 364-3600', NULL, 0, 1, 'Utrecht', 'Displayweg 16-18', '', 189, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 13:42:57', NULL, NULL, NULL, 414, '3821 BT'),
(648, 1, 'José ', 'abc', 'Ramón', 2, 1, 'Global Head of Human Resources', 'jose.ramon1@telxius.com', '3491', '(3491) 483-0612', '4830612', 1, 1, 'Madrid', 'Ronda de la Comunicación s/n, Distrito Telefónica, Edificio Norte 2', '', 190, NULL, 'https://www.link', 2, 0, NULL, '2020-10-11 16:16:44', NULL, NULL, NULL, 415, '28050'),
(649, 1, 'José ', '', 'Ramón', 2, 1, 'Global Head of Human Resources', 'jose.ramon2@telxius.com', '3491', '(3491) 483-0612', '4830612', 1, 1, 'Madrid', 'Ronda de la Comunicación s/n, Distrito Telefónica, Edificio Norte 2', '', 190, NULL, 'https://www.link', NULL, 0, NULL, '2020-10-11 16:41:30', NULL, NULL, NULL, 415, '28050'),
(650, 1, 'sdf', 'fsdfdsf', 'fdsfsdf', 1, 1, 'sfdsf', 'h@gmail.com', '2', '7878787878', '7878787878', 1, 1, 'satara', 'fdsfsdf', 'fsdfsdf', 191, NULL, 'sdfsdfd', 2, 0, NULL, '2020-12-03 17:39:03', 2, NULL, NULL, 416, '415011'),
(651, 1, 'sdf', 'fsdfdsf', 'fdsfsdf', 1, 1, 'sfdsf', 'h@gmail.com', '2', '7878787878', '7878787878', 1, 1, 'satara', 'fdsfsdf', 'fsdfsdf', 191, NULL, 'sdfsdfd', NULL, 0, NULL, '2020-12-03 17:40:56', 2, NULL, NULL, 416, '415011'),
(652, 1, 'dsd', 'dsd', 'dsd', 1, 1, 'sfdsf', 'h@gmail.com', '3', '9089098790', '9878987898', 1, 1, 'satara', 'bjh', 'hghg', 192, NULL, 'fsdf', 2, 0, NULL, '2020-12-03 17:44:14', 2, NULL, NULL, 417, '415011'),
(653, 1, 'dfgdfg', 'gfdgdfg', 'gdfgg', 1, 1, 'gfdgdfg', 'info@arinoz.com', '5', '8989898989', '8989898989', 1, 1, 'Pune', 'sadsadsd', 'gfgdfgdg', 193, NULL, 'grdggfgfgdgdg', NULL, 0, NULL, '2020-12-03 17:48:30', 2, NULL, NULL, 418, '411052'),
(654, 1, 'gdfg', 'gfgd', 'gdfgdfg', 1, 1, 'fdsfdf', 'info@arinoz.com', '3', '9898989898', '8787878787', 1, 1, 'Pune', 'ffff', 'ffff', 194, NULL, 'fdfdffddf', 2, 0, NULL, '2020-12-03 18:04:12', 2, NULL, NULL, 419, '411052'),
(655, 1, 'cssf', 'fsfd', 'dfdsfdf', 1, 1, 'sfdg', 'sd@gmail.com', '1', '9652325421', '9874541202', 1, 1, 'satara', 'fsdfd', 'fsdfsd', 195, NULL, 'sdfdfsdf', 2, 0, NULL, '2020-12-04 11:56:17', 2, NULL, NULL, 420, '415011'),
(656, 1, 'h', 's', 's', 1, 1, 'demo', 'h@gmail.com', '2', '9874002100', '9652102102', 1, 1, 'pune', 'pune', 'pune', 196, NULL, 'demo', 2, 0, NULL, '2020-12-04 17:37:30', 2, NULL, NULL, 421, '411015'),
(657, 1, 'hema', 'suresh', 'shinde', 2, 1, 'software developer', 'hemashinde@gmail.com', '', '9632145874', '9852124578', 1, 1, 'pune', 'pune, karvenagar', 'pune', 198, NULL, 'abc', 2, 0, NULL, '2020-12-05 14:46:12', 2, NULL, NULL, 423, '415011'),
(658, 1, 'hema', 'suresh', 'shinde', 1, 1, 'abc', 'hema@gmail.com', '1', '9800215487', '9874210021', 1, 1, 'pune', 'pune', 'pune', 198, NULL, 'kk', NULL, 0, NULL, '2020-12-05 15:11:49', 2, NULL, NULL, 423, '415011'),
(659, 1, 'hema', 'suresh', 'shinde', 1, 1, 'abc', 'hema@gmail.com', '1', '9800215487', '9874210021', 1, 1, 'pune', 'pune', 'pune', 198, NULL, 'kk', NULL, 0, NULL, '2020-12-05 15:12:06', 2, NULL, NULL, 423, '415011'),
(660, 1, 'dewae', 'eqwe', 'eqweqwe', 1, 1, 'abc', 'ghghgh@gmail.com', '', '9800210021', '9632002100', 1, 1, 'satara', 'pune', 'pune', 198, NULL, 'abc', NULL, 0, NULL, '2020-12-08 13:03:02', 2, NULL, NULL, 423, '415011'),
(661, 1, 'ikui', 'uy', 'uy', 1, 1, 'sd', 'gf23@gmail.com', '', '87112012145', '960010021', 1, 2, 'rer', 'ere', 'rerr', 210, NULL, 'sadsddf', NULL, 0, NULL, '2020-12-09 10:19:20', 2, NULL, NULL, 435, '962102'),
(662, 1, 'fd', 'gfg', 'gfgfg', 1, 1, 'fdsf', 'f@gmail.com', '', '9520120121', '9652012145', 1, 2, '', 'retert', 'tret', 211, NULL, 'fvdf', 2, 0, NULL, '2020-12-09 10:20:55', 2, NULL, NULL, 436, '343434'),
(663, 1, 'aewr', 'ewrewr', 'erer', 1, 1, 'dff', 'er@gmail.com', '', '9620012101', '963210212', 1, 2, 'fgdfgfgg', 'fdsf', 'fdfdf', 212, NULL, 'dsf', 2, 0, NULL, '2020-12-09 10:25:03', 2, NULL, NULL, 437, '454545'),
(664, 1, 'yty', 'yt', 'yyty', 1, 1, 'ytyty', 'info@ytytyytytyty.com', '', '5656565656', '5656565656', 1, 2, 'rtrt', 'ertr', 'trtrt', 213, NULL, 'dret', 2, 0, NULL, '2020-12-09 10:28:39', 2, NULL, NULL, 438, '565656'),
(665, 1, 'gfh', 'ht', 'yty', 1, 1, 'dsad', 'ytt@gmail.com', '', '9623210210', '9623210210', 1, 2, 'fdf', 'fdsf', 'fdsf', 214, NULL, 'fdsf', 2, 0, NULL, '2020-12-09 10:32:57', 2, NULL, NULL, 439, '415011'),
(666, 1, 'yty', 'yty', 'yty', 1, 1, 'dsad', 'ty@gmail.com', '', '9652120121', '9652120121', 1, 2, 'rere', 'rewr', 'rer', 215, NULL, 'dasew', 2, 0, NULL, '2020-12-09 10:36:24', 2, NULL, NULL, 440, '415011'),
(667, 1, 'ty', 'uyu', 'uyu', 1, 1, 'dsd', 'uy@gmail.com', '', '9652321201', '9652321201', 1, 2, 'ewe', 'ewe', 'ewe', 216, NULL, 'edawewe', 2, 0, NULL, '2020-12-09 10:39:01', 2, NULL, NULL, 441, '415011'),
(668, 1, 'ty', 'uyu', 'uyu', 1, 1, 'dsd', 'uygggg@gmail.com', '', '9652321201', '9652321201', 1, 2, 'ewe', 'ewe', 'ewe', 216, NULL, 'edawewe', NULL, 0, NULL, '2020-12-09 10:42:09', 2, NULL, NULL, 441, '415011'),
(669, 1, 'ffgfg', 'gdfg', 'gfdgfdg', 1, 1, 'dsadd', 'gh@gmail.com', '', '9623524520', '9623524520', 1, 2, 'rerer', 'rewr', 'erewrr', 217, NULL, 'fseer', 2, 0, NULL, '2020-12-09 10:50:43', 2, NULL, NULL, 442, '415011'),
(670, 1, 'ffgfg', 'gdfg', 'gfdgfdg', 1, 1, 'dsadd', 'grreh@gmail.com', '', '9623524520', '9623524520', 1, 2, 'rerer', 'rewr', 'erewrr', 217, NULL, 'fseer', NULL, 0, NULL, '2020-12-09 10:52:50', 2, NULL, NULL, 442, '415011'),
(671, 1, 'ter', 'ttre', 'tetrt', 1, 1, 'dasd', 'asds@gmail.com', '', '9623021201', '9623021201', 1, 2, 'PUNE', 'rewrw', 'rer', 218, NULL, 'rewr', 2, 0, NULL, '2020-12-09 10:56:51', 2, NULL, NULL, 443, '415051'),
(672, 1, 'yrt', 'yytr', 'yytry', 1, 1, 'dsad', 'ytr@gmail.com', '', '9620120121', '9620120121', 1, 2, 'AAAAAAAAAAAAAAAAAAAAAA', 'DASD', 'SD', 219, NULL, 'ABC', 2, 0, NULL, '2020-12-09 11:03:16', 2, NULL, NULL, 444, '411052'),
(673, 1, 'dtg', 'eter', 'trtrt', 1, 1, 'dsa', 'ss@gmail.com', '', '9623210121', '9623210121', 1, 2, 'rer', 'ere', 'rerer', 215, NULL, 'dased', NULL, 0, NULL, '2020-12-09 11:08:47', 2, NULL, NULL, 445, '415011'),
(674, 1, 'yrty', 'ytr', 'yrty', 1, 1, 'ds', 'shinde23@gmail.com', '', '9623350425', '9623350425', 1, 2, 'dsad', 'dsadd', 'dasd', 220, NULL, 'hema', 2, 0, NULL, '2020-12-09 11:12:08', 2, NULL, NULL, 446, '415011'),
(675, 1, 'tret', 'trt', 'trt', 1, 1, 'dwsed', 'tert@gmail.com', '', '9623021201', '9623021201', 1, 2, 'satara', 'oiopi', 'opipoi', 221, NULL, 'ioi', 2, 0, NULL, '2020-12-09 11:22:50', 2, NULL, NULL, 447, '415011'),
(676, 1, 'wer', 'erer', 'rewr', 1, 1, 'aBC', 'er@gmail.com', '', '9620120012', '9620120012', 1, 2, 'satara', 'klkl', 'jj', 204, NULL, 'HEMA', NULL, 0, NULL, '2020-12-09 11:34:21', 2, NULL, NULL, 429, '415011'),
(677, 1, 'wer', 'erer', 'rewr', 1, 1, 'aBC', 'ereerererer@gmail.com', '', '9620120012', '9620120012', 1, 2, 'satara', 'klkl', 'jj', 204, NULL, 'HEMA', NULL, 0, NULL, '2020-12-09 11:34:57', 2, NULL, NULL, 429, '415011'),
(678, 1, 'pooja', 'mahesh', 'shinde', 1, 1, 'abc', 'p@gmail.com', '', '9800210021', '9600210021', 1, 1, 'pune', 'punw', 'pune', 209, NULL, 'abc', NULL, 0, NULL, '2020-12-09 11:59:53', 2, NULL, NULL, 434, '415051'),
(679, 1, 'pooja', 'mahesh', 'shinde', 1, 1, 'abc', 'p@gmail.com', '', '9800210021', '9600210021', 1, 1, 'pune', 'punw', 'pune', 209, NULL, 'abc', NULL, 0, NULL, '2020-12-09 11:59:55', 2, NULL, NULL, 434, '415051'),
(680, 1, 'pooja', 'mahesh', 'shinde', 1, 1, 'abc', 'p@gmail.com', '', '9800210021', '9600210021', 1, 1, 'pune', 'punw', 'pune', 209, NULL, 'abc', NULL, 0, NULL, '2020-12-09 11:59:56', 2, NULL, NULL, 434, '415051'),
(681, 1, 'pooja', 'mahesh', 'shinde', 1, 1, 'abc', 'p@gmail.com', '', '9800210021', '9600210021', 1, 1, 'pune', 'punw', 'pune', 209, NULL, 'abc', NULL, 0, NULL, '2020-12-09 11:59:57', 2, NULL, NULL, 434, '415051'),
(682, 1, 'pooja', 'mahesh', 'shinde', 1, 1, 'abc', 'p@gmail.com', '', '9800210021', '9600210021', 1, 1, 'pune', 'punw', 'pune', 209, NULL, 'abc', NULL, 0, NULL, '2020-12-09 11:59:59', 2, NULL, NULL, 434, '415051'),
(683, 1, 'pooja', 'mahesh', 'shinde', 1, 1, 'abc', 'p@gmail.com', '', '9800210021', '9600210021', 1, 1, 'pune', 'punw', 'pune', 209, NULL, 'abc', NULL, 0, NULL, '2020-12-09 12:00:00', 2, NULL, NULL, 434, '415051'),
(684, 1, 'pooja', 'mahesh', 'shinde', 1, 1, 'abc', 'p@gmail.com', '', '9800210021', '9600210021', 1, 1, 'pune', 'punw', 'pune', 209, NULL, 'abc', NULL, 0, NULL, '2020-12-09 12:00:01', 2, NULL, NULL, 434, '415051'),
(685, 1, 'pooja', 'mahesh', 'shinde', 1, 1, 'abc', 'p@gmail.com', '', '9800210021', '9600210021', 1, 1, 'pune', 'punw', 'pune', 209, NULL, 'abc', NULL, 0, NULL, '2020-12-09 12:00:02', 2, NULL, NULL, 434, '415051'),
(686, 1, 'pooja', 'mahesh', 'shinde', 1, 1, 'abc', 'p@gmail.com', '', '9800210021', '9600210021', 1, 1, 'pune', 'punw', 'pune', 209, NULL, 'abc', NULL, 0, NULL, '2020-12-09 12:00:04', 2, NULL, NULL, 434, '415051'),
(687, 1, 'pooja', 'mahesh', 'shinde', 1, 1, 'abc', 'p@gmail.com', '', '9800210021', '9600210021', 1, 1, 'pune', 'punw', 'pune', 209, NULL, 'abc', NULL, 0, NULL, '2020-12-09 12:00:05', 2, NULL, NULL, 434, '415051'),
(688, 1, 'pooja', 'mahesh', 'shinde', 1, 1, 'abc', 'p@gmail.com', '', '9800210021', '9600210021', 1, 1, 'pune', 'punw', 'pune', 209, NULL, 'abc', NULL, 0, NULL, '2020-12-09 12:00:06', 2, NULL, NULL, 434, '415051'),
(689, 1, 'pooja', 'mahesh', 'shinde', 1, 1, 'abc', 'p@gmail.com', '', '9800210021', '9600210021', 1, 1, 'pune', 'punw', 'pune', 209, NULL, 'abc', NULL, 0, NULL, '2020-12-09 12:00:08', 2, NULL, NULL, 434, '415051'),
(690, 1, 'pooja', 'mahesh', 'shinde', 1, 1, 'abc', 'p@gmail.com', '', '9800210021', '9600210021', 1, 1, 'pune', 'punw', 'pune', 209, NULL, 'abc', NULL, 0, NULL, '2020-12-09 12:00:09', 2, NULL, NULL, 434, '415051'),
(691, 1, 'pooja', 'mahesh', 'shinde', 1, 1, 'abc', 'p@gmail.com', '', '9800210021', '9600210021', 1, 1, 'pune', 'punw', 'pune', 209, NULL, 'abc', NULL, 0, NULL, '2020-12-09 12:00:10', 2, NULL, NULL, 434, '415051'),
(692, 1, 'pooja', 'mahesh', 'shinde', 1, 1, 'abc', 'p@gmail.com', '', '9800210021', '9600210021', 1, 1, 'pune', 'punw', 'pune', 209, NULL, 'abc', NULL, 0, NULL, '2020-12-09 12:00:12', 2, NULL, NULL, 434, '415051'),
(693, 1, 'pooja', 'mahesh', 'shinde', 1, 1, 'abc', 'p@gmail.com', '', '9800210021', '9600210021', 1, 1, 'pune', 'punw', 'pune', 209, NULL, 'abc', NULL, 0, NULL, '2020-12-09 12:00:13', 2, NULL, NULL, 434, '415051'),
(694, 1, 'pooja', 'mahesh', 'shinde', 1, 1, 'abc', 'p@gmail.com', '', '9800210021', '9600210021', 1, 1, 'pune', 'punw', 'pune', 209, NULL, 'abc', NULL, 0, NULL, '2020-12-09 12:00:14', 2, NULL, NULL, 434, '415051'),
(695, 1, 'pooja', 'mahesh', 'shinde', 1, 1, 'abc', 'p@gmail.com', '', '9800210021', '9600210021', 1, 1, 'pune', 'punw', 'pune', 209, NULL, 'abc', NULL, 0, NULL, '2020-12-09 12:00:16', 2, NULL, NULL, 434, '415051'),
(696, 1, 'pooja', 'mahesh', 'shinde', 1, 1, 'abc', 'p@gmail.com', '', '9800210021', '9600210021', 1, 1, 'pune', 'punw', 'pune', 209, NULL, 'abc', NULL, 0, NULL, '2020-12-09 12:00:17', 2, NULL, NULL, 434, '415051'),
(697, 1, 'pooja', 'mahesh', 'shinde', 1, 1, 'abc', 'p@gmail.com', '', '9800210021', '9600210021', 1, 1, 'pune', 'punw', 'pune', 209, NULL, 'abc', NULL, 0, NULL, '2020-12-09 12:00:18', 2, NULL, NULL, 434, '415051'),
(698, 1, 'pooja', 'mahesh', 'shinde', 1, 1, 'abc', 'p@gmail.com', '', '9800210021', '9600210021', 1, 1, 'pune', 'punw', 'pune', 209, NULL, 'abc', NULL, 0, NULL, '2020-12-09 12:00:20', 2, NULL, NULL, 434, '415051'),
(699, 1, 'pooja', 'mahesh', 'shinde', 1, 1, 'abc', 'p@gmail.com', '', '9800210021', '9600210021', 1, 1, 'pune', 'punw', 'pune', 209, NULL, 'abc', NULL, 0, NULL, '2020-12-09 12:00:21', 2, NULL, NULL, 434, '415051'),
(700, 1, 'pooja', 'mahesh', 'shinde', 1, 1, 'abc', 'p@gmail.com', '', '9800210021', '9600210021', 1, 1, 'pune', 'punw', 'pune', 209, NULL, 'abc', NULL, 0, NULL, '2020-12-09 12:00:22', 2, NULL, NULL, 434, '415051'),
(701, 1, 'pooja', 'mahesh', 'shinde', 1, 1, 'abc', 'p@gmail.com', '', '9800210021', '9600210021', 1, 1, 'pune', 'punw', 'pune', 209, NULL, 'abc', NULL, 0, NULL, '2020-12-09 12:00:23', 2, NULL, NULL, 434, '415051'),
(702, 1, 'pooja', 'mahesh', 'shinde', 1, 1, 'abc', 'p@gmail.com', '', '9800210021', '9600210021', 1, 1, 'pune', 'punw', 'pune', 209, NULL, 'abc', NULL, 0, NULL, '2020-12-09 12:00:25', 2, NULL, NULL, 434, '415051'),
(703, 1, 'pooja', 'mahesh', 'shinde', 1, 1, 'abc', 'p@gmail.com', '', '9800210021', '9600210021', 1, 1, 'pune', 'punw', 'pune', 209, NULL, 'abc', NULL, 0, NULL, '2020-12-09 12:00:26', 2, NULL, NULL, 434, '415051'),
(704, 1, 'pooja', 'mahesh', 'shinde', 1, 1, 'abc', 'p@gmail.com', '', '9800210021', '9600210021', 1, 1, 'pune', 'punw', 'pune', 209, NULL, 'abc', NULL, 0, NULL, '2020-12-09 12:00:27', 2, NULL, NULL, 434, '415051'),
(705, 1, 'pooja', 'mahesh', 'shinde', 1, 1, 'abc', 'p@gmail.com', '', '9800210021', '9600210021', 1, 1, 'pune', 'punw', 'pune', 209, NULL, 'abc', NULL, 0, NULL, '2020-12-09 12:00:29', 2, NULL, NULL, 434, '415051'),
(706, 1, 'pooja', 'mahesh', 'shinde', 1, 1, 'abc', 'p@gmail.com', '', '9800210021', '9600210021', 1, 1, 'pune', 'punw', 'pune', 209, NULL, 'abc', NULL, 0, NULL, '2020-12-09 12:00:30', 2, NULL, NULL, 434, '415051'),
(707, 1, 'pooja', 'mahesh', 'shinde', 1, 1, 'abc', 'p@gmail.com', '', '9800210021', '9600210021', 1, 1, 'pune', 'punw', 'pune', 209, NULL, 'abc', NULL, 0, NULL, '2020-12-09 12:09:08', 2, NULL, NULL, 434, '415051'),
(708, 1, 'pooja', 'mahesh', 'shinde', 1, 1, 'abc', 'p@gmail.com', '', '9800210021', '9600210021', 1, 1, 'pune', 'punw', 'pune', 209, NULL, 'abc', NULL, 0, NULL, '2020-12-09 12:09:09', 2, NULL, NULL, 434, '415051'),
(709, 1, 'pooja', 'mahesh', 'shinde', 1, 1, 'abc', 'p@gmail.com', '', '9800210021', '9600210021', 1, 1, 'pune', 'punw', 'pune', 209, NULL, 'abc', NULL, 0, NULL, '2020-12-09 12:09:10', 2, NULL, NULL, 434, '415051'),
(710, 1, 'pooja', 'mahesh', 'shinde', 1, 1, 'abc', 'p@gmail.com', '', '9800210021', '9600210021', 1, 1, 'pune', 'punw', 'pune', 209, NULL, 'abc', NULL, 0, NULL, '2020-12-09 12:09:11', 2, NULL, NULL, 434, '415051'),
(711, 1, 'pooja', 'mahesh', 'shinde', 1, 1, 'abc', 'p@gmail.com', '', '9800210021', '9600210021', 1, 1, 'pune', 'punw', 'pune', 209, NULL, 'abc', NULL, 0, NULL, '2020-12-09 12:09:13', 2, NULL, NULL, 434, '415051'),
(712, 1, 'pooja', 'mahesh', 'shinde', 1, 1, 'abc', 'p@gmail.com', '', '9800210021', '9600210021', 1, 1, 'pune', 'punw', 'pune', 209, NULL, 'abc', NULL, 0, NULL, '2020-12-09 12:09:14', 2, NULL, NULL, 434, '415051'),
(713, 1, 'pooja', 'mahesh', 'shinde', 1, 1, 'abc', 'p@gmail.com', '', '9800210021', '9600210021', 1, 1, 'pune', 'punw', 'pune', 209, NULL, 'abc', NULL, 0, NULL, '2020-12-09 12:09:15', 2, NULL, NULL, 434, '415051'),
(714, 1, 'pooja', 'mahesh', 'shinde', 1, 1, 'abc', 'p@gmail.com', '', '9800210021', '9600210021', 1, 1, 'pune', 'punw', 'pune', 209, NULL, 'abc', NULL, 0, NULL, '2020-12-09 12:09:16', 2, NULL, NULL, 434, '415051'),
(715, 1, 'pooja', 'mahesh', 'shinde', 1, 1, 'abc', 'p@gmail.com', '', '9800210021', '9600210021', 1, 1, 'pune', 'punw', 'pune', 209, NULL, 'abc', NULL, 0, NULL, '2020-12-09 12:09:17', 2, NULL, NULL, 434, '415051'),
(716, 1, 'pooja', 'mahesh', 'shinde', 1, 1, 'abc', 'p@gmail.com', '', '9800210021', '9600210021', 1, 1, 'pune', 'punw', 'pune', 209, NULL, 'abc', NULL, 0, NULL, '2020-12-09 12:09:19', 2, NULL, NULL, 434, '415051'),
(717, 1, 'pooja', 'mahesh', 'shinde', 1, 1, 'abc', 'p@gmail.com', '', '9800210021', '9600210021', 1, 1, 'pune', 'punw', 'pune', 209, NULL, 'abc', NULL, 0, NULL, '2020-12-09 12:09:20', 2, NULL, NULL, 434, '415051'),
(718, 1, 'pooja', 'mahesh', 'shinde', 1, 1, 'abc', 'p@gmail.com', '', '9800210021', '9600210021', 1, 1, 'pune', 'punw', 'pune', 209, NULL, 'abc', NULL, 0, NULL, '2020-12-09 12:09:21', 2, NULL, NULL, 434, '415051'),
(719, 1, 'pooja', 'mahesh', 'shinde', 1, 1, 'abc', 'p@gmail.com', '', '9800210021', '9600210021', 1, 1, 'pune', 'punw', 'pune', 209, NULL, 'abc', NULL, 0, NULL, '2020-12-09 12:09:22', 2, NULL, NULL, 434, '415051'),
(720, 1, 'pooja', 'mahesh', 'shinde', 1, 1, 'abc', 'p@gmail.com', '', '9800210021', '9600210021', 1, 1, 'pune', 'punw', 'pune', 209, NULL, 'abc', NULL, 0, NULL, '2020-12-09 12:09:24', 2, NULL, NULL, 434, '415051'),
(721, 1, 'pooja', 'mahesh', 'shinde', 1, 1, 'abc', 'p@gmail.com', '', '9800210021', '9600210021', 1, 1, 'pune', 'punw', 'pune', 209, NULL, 'abc', NULL, 0, NULL, '2020-12-09 12:09:25', 2, NULL, NULL, 434, '415051'),
(722, 1, 'pooja', 'mahesh', 'shinde', 1, 1, 'abc', 'p@gmail.com', '', '9800210021', '9600210021', 1, 1, 'pune', 'punw', 'pune', 209, NULL, 'abc', NULL, 0, NULL, '2020-12-09 12:09:26', 2, NULL, NULL, 434, '415051'),
(723, 1, 'pooja', 'mahesh', 'shinde', 1, 1, 'abc', 'p@gmail.com', '', '9800210021', '9600210021', 1, 1, 'pune', 'punw', 'pune', 209, NULL, 'abc', NULL, 0, NULL, '2020-12-09 12:09:27', 2, NULL, NULL, 434, '415051'),
(724, 1, 'pooja', 'mahesh', 'shinde', 1, 1, 'abc', 'p@gmail.com', '', '9800210021', '9600210021', 1, 1, 'pune', 'punw', 'pune', 209, NULL, 'abc', NULL, 0, NULL, '2020-12-09 12:09:28', 2, NULL, NULL, 434, '415051'),
(725, 1, 'pooja', 'mahesh', 'shinde', 1, 1, 'abc', 'p@gmail.com', '', '9800210021', '9600210021', 1, 1, 'pune', 'punw', 'pune', 209, NULL, 'abc', NULL, 0, NULL, '2020-12-09 12:09:30', 2, NULL, NULL, 434, '415051'),
(726, 1, 'pooja', 'mahesh', 'shinde', 1, 1, 'abc', 'p@gmail.com', '', '9800210021', '9600210021', 1, 1, 'pune', 'punw', 'pune', 209, NULL, 'abc', NULL, 0, NULL, '2020-12-09 12:09:31', 2, NULL, NULL, 434, '415051'),
(727, 1, 'pooja', 'mahesh', 'shinde', 1, 1, 'abc', 'p@gmail.com', '', '9800210021', '9600210021', 1, 1, 'pune', 'punw', 'pune', 209, NULL, 'abc', NULL, 0, NULL, '2020-12-09 12:09:32', 2, NULL, NULL, 434, '415051'),
(728, 1, 'pooja', 'mahesh', 'shinde', 1, 1, 'abc', 'p@gmail.com', '', '9800210021', '9600210021', 1, 1, 'pune', 'punw', 'pune', 209, NULL, 'abc', NULL, 0, NULL, '2020-12-09 12:09:33', 2, NULL, NULL, 434, '415051'),
(729, 1, 'pooja', 'mahesh', 'shinde', 1, 1, 'abc', 'p@gmail.com', '', '9800210021', '9600210021', 1, 1, 'pune', 'punw', 'pune', 209, NULL, 'abc', NULL, 0, NULL, '2020-12-09 12:09:35', 2, NULL, NULL, 434, '415051'),
(730, 1, 'pooja', 'mahesh', 'shinde', 1, 1, 'abc', 'p@gmail.com', '', '9800210021', '9600210021', 1, 1, 'pune', 'punw', 'pune', 209, NULL, 'abc', NULL, 0, NULL, '2020-12-09 12:09:36', 2, NULL, NULL, 434, '415051'),
(731, 1, 'pooja', 'mahesh', 'shinde', 1, 1, 'abc', 'p@gmail.com', '', '9800210021', '9600210021', 1, 1, 'pune', 'punw', 'pune', 209, NULL, 'abc', NULL, 0, NULL, '2020-12-09 12:09:37', 2, NULL, NULL, 434, '415051'),
(732, 1, 'pooja', 'mahesh', 'shinde', 1, 1, 'abc', 'p@gmail.com', '', '9800210021', '9600210021', 1, 1, 'pune', 'punw', 'pune', 209, NULL, 'abc', NULL, 0, NULL, '2020-12-09 12:09:38', 2, NULL, NULL, 434, '415051'),
(733, 1, 'pooja', 'mahesh', 'shinde', 1, 1, 'abc', 'p@gmail.com', '', '9800210021', '9600210021', 1, 1, 'pune', 'punw', 'pune', 209, NULL, 'abc', NULL, 0, NULL, '2020-12-09 12:09:40', 2, NULL, NULL, 434, '415051'),
(734, 1, 'pooja', 'mahesh', 'shinde', 1, 1, 'abc', 'p@gmail.com', '', '9800210021', '9600210021', 1, 1, 'pune', 'punw', 'pune', 209, NULL, 'abc', NULL, 0, NULL, '2020-12-09 12:09:41', 2, NULL, NULL, 434, '415051'),
(735, 1, 'pooja', 'mahesh', 'shinde', 1, 1, 'abc', 'p@gmail.com', '', '9800210021', '9600210021', 1, 1, 'pune', 'punw', 'pune', 209, NULL, 'abc', NULL, 0, NULL, '2020-12-09 12:09:42', 2, NULL, NULL, 434, '415051');

-- --------------------------------------------------------

--
-- Table structure for table `bf_prospect_encrypted`
--

CREATE TABLE `bf_prospect_encrypted` (
  `id` int(11) NOT NULL,
  `prospect_id` int(11) DEFAULT NULL,
  `md5` varchar(64) DEFAULT NULL,
  `sha` varchar(64) DEFAULT NULL,
  `sha2` varchar(64) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bf_prospect_social_links`
--

CREATE TABLE `bf_prospect_social_links` (
  `id` int(11) NOT NULL,
  `prospect_id` int(11) DEFAULT NULL,
  `linkedin` varchar(264) DEFAULT NULL,
  `facebook` varchar(264) DEFAULT NULL,
  `twitter` varchar(264) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bf_ps_aors`
--

CREATE TABLE `bf_ps_aors` (
  `id` varchar(40) NOT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `default_expiration` int(11) DEFAULT NULL,
  `mailboxes` varchar(80) DEFAULT NULL,
  `max_contacts` int(11) DEFAULT NULL,
  `minimum_expiration` int(11) DEFAULT NULL,
  `remove_existing` enum('yes','no') DEFAULT NULL,
  `qualify_frequency` int(11) DEFAULT NULL,
  `authenticate_qualify` enum('yes','no') DEFAULT NULL,
  `maximum_expiration` int(11) DEFAULT NULL,
  `outbound_proxy` varchar(40) DEFAULT NULL,
  `support_path` enum('yes','no') DEFAULT NULL,
  `qualify_timeout` float DEFAULT NULL,
  `voicemail_extension` varchar(40) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bf_ps_aors`
--

INSERT INTO `bf_ps_aors` (`id`, `contact`, `default_expiration`, `mailboxes`, `max_contacts`, `minimum_expiration`, `remove_existing`, `qualify_frequency`, `authenticate_qualify`, `maximum_expiration`, `outbound_proxy`, `support_path`, `qualify_timeout`, `voicemail_extension`, `deleted`, `deleted_by`, `created_on`, `created_by`, `modified_on`, `modified_by`, `customer_id`) VALUES
('101', NULL, NULL, NULL, 1, NULL, 'yes', 120, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2020-09-17 01:12:49', NULL, NULL, NULL, NULL),
('102', NULL, NULL, NULL, 1, NULL, 'yes', 120, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2020-09-17 01:12:49', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bf_ps_auths`
--

CREATE TABLE `bf_ps_auths` (
  `id` varchar(40) NOT NULL,
  `auth_type` enum('md5','userpass') DEFAULT NULL,
  `nonce_lifetime` int(11) DEFAULT NULL,
  `md5_cred` varchar(40) DEFAULT NULL,
  `password` varchar(80) DEFAULT NULL,
  `realm` varchar(40) DEFAULT NULL,
  `username` varchar(40) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bf_ps_auths`
--

INSERT INTO `bf_ps_auths` (`id`, `auth_type`, `nonce_lifetime`, `md5_cred`, `password`, `realm`, `username`, `deleted`, `deleted_by`, `created_on`, `created_by`, `modified_on`, `modified_by`, `customer_id`) VALUES
('101', 'userpass', NULL, NULL, '101', 'linkedinextract.in', '101', 0, NULL, '2020-09-17 01:12:50', NULL, NULL, NULL, NULL),
('102', 'userpass', NULL, NULL, '102', 'linkedinextract.in', '102', 0, NULL, '2020-09-17 01:12:50', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bf_ps_endpoints_template`
--

CREATE TABLE `bf_ps_endpoints_template` (
  `transport` varchar(40) DEFAULT NULL,
  `aors` varchar(200) DEFAULT NULL,
  `auth` varchar(40) DEFAULT NULL,
  `context` varchar(40) NOT NULL,
  `disallow` varchar(200) DEFAULT NULL,
  `allow` varchar(200) DEFAULT NULL,
  `direct_media` enum('yes','no') DEFAULT NULL,
  `connected_line_method` enum('invite','reinvite','update') DEFAULT NULL,
  `direct_media_method` enum('invite','reinvite','update') DEFAULT NULL,
  `direct_media_glare_mitigation` enum('none','outgoing','incoming') DEFAULT NULL,
  `disable_direct_media_on_nat` enum('yes','no') DEFAULT NULL,
  `dtmf_mode` enum('rfc4733','inband','info','auto','auto_info') DEFAULT NULL,
  `external_media_address` varchar(40) DEFAULT NULL,
  `force_rport` enum('yes','no') DEFAULT NULL,
  `ice_support` enum('yes','no') DEFAULT NULL,
  `identify_by` varchar(80) DEFAULT NULL,
  `mailboxes` varchar(40) DEFAULT NULL,
  `moh_suggest` varchar(40) DEFAULT NULL,
  `outbound_auth` varchar(40) DEFAULT NULL,
  `outbound_proxy` varchar(40) DEFAULT NULL,
  `rewrite_contact` enum('yes','no') DEFAULT NULL,
  `rtp_ipv6` enum('yes','no') DEFAULT NULL,
  `rtp_symmetric` enum('yes','no') DEFAULT NULL,
  `send_diversion` enum('yes','no') DEFAULT NULL,
  `send_pai` enum('yes','no') DEFAULT NULL,
  `send_rpid` enum('yes','no') DEFAULT NULL,
  `timers_min_se` int(11) DEFAULT NULL,
  `timers` enum('forced','no','required','yes') DEFAULT NULL,
  `timers_sess_expires` int(11) DEFAULT NULL,
  `callerid` varchar(40) DEFAULT NULL,
  `callerid_privacy` enum('allowed_not_screened','allowed_passed_screened','allowed_failed_screened','allowed','prohib_not_screened','prohib_passed_screened','prohib_failed_screened','prohib','unavailable') DEFAULT NULL,
  `callerid_tag` varchar(40) DEFAULT NULL,
  `100rel` enum('no','required','yes') DEFAULT NULL,
  `aggregate_mwi` enum('yes','no') DEFAULT NULL,
  `trust_id_inbound` enum('yes','no') DEFAULT NULL,
  `trust_id_outbound` enum('yes','no') DEFAULT NULL,
  `use_ptime` enum('yes','no') DEFAULT NULL,
  `use_avpf` enum('yes','no') DEFAULT NULL,
  `media_encryption` enum('no','sdes','dtls') DEFAULT NULL,
  `inband_progress` enum('yes','no') DEFAULT NULL,
  `call_group` varchar(40) DEFAULT NULL,
  `pickup_group` varchar(40) DEFAULT NULL,
  `named_call_group` varchar(40) DEFAULT NULL,
  `named_pickup_group` varchar(40) DEFAULT NULL,
  `device_state_busy_at` int(11) DEFAULT NULL,
  `fax_detect` enum('yes','no') DEFAULT NULL,
  `t38_udptl` enum('yes','no') DEFAULT NULL,
  `t38_udptl_ec` enum('none','fec','redundancy') DEFAULT NULL,
  `t38_udptl_maxdatagram` int(11) DEFAULT NULL,
  `t38_udptl_nat` enum('yes','no') DEFAULT NULL,
  `t38_udptl_ipv6` enum('yes','no') DEFAULT NULL,
  `tone_zone` varchar(40) DEFAULT NULL,
  `language` varchar(40) DEFAULT NULL,
  `one_touch_recording` enum('yes','no') DEFAULT NULL,
  `record_on_feature` varchar(40) DEFAULT NULL,
  `record_off_feature` varchar(40) DEFAULT NULL,
  `rtp_engine` varchar(40) DEFAULT NULL,
  `allow_transfer` enum('yes','no') DEFAULT NULL,
  `allow_subscribe` enum('yes','no') DEFAULT NULL,
  `sdp_owner` varchar(40) DEFAULT NULL,
  `sdp_session` varchar(40) DEFAULT NULL,
  `tos_audio` varchar(10) DEFAULT NULL,
  `tos_video` varchar(10) DEFAULT NULL,
  `sub_min_expiry` int(11) DEFAULT NULL,
  `from_domain` varchar(40) DEFAULT NULL,
  `from_user` varchar(40) DEFAULT NULL,
  `mwi_from_user` varchar(40) DEFAULT NULL,
  `dtls_verify` varchar(40) DEFAULT NULL,
  `dtls_rekey` varchar(40) DEFAULT NULL,
  `dtls_cert_file` varchar(200) DEFAULT NULL,
  `dtls_private_key` varchar(200) DEFAULT NULL,
  `dtls_cipher` varchar(200) DEFAULT NULL,
  `dtls_ca_file` varchar(200) DEFAULT NULL,
  `dtls_ca_path` varchar(200) DEFAULT NULL,
  `dtls_setup` enum('active','passive','actpass') DEFAULT NULL,
  `srtp_tag_32` enum('yes','no') DEFAULT NULL,
  `media_address` varchar(40) DEFAULT NULL,
  `redirect_method` enum('user','uri_core','uri_pjsip') DEFAULT NULL,
  `set_var` text DEFAULT NULL,
  `cos_audio` int(11) DEFAULT NULL,
  `cos_video` int(11) DEFAULT NULL,
  `message_context` varchar(40) DEFAULT NULL,
  `force_avp` enum('yes','no') DEFAULT NULL,
  `media_use_received_transport` enum('yes','no') DEFAULT NULL,
  `accountcode` varchar(80) DEFAULT NULL,
  `user_eq_phone` enum('yes','no') DEFAULT NULL,
  `moh_passthrough` enum('yes','no') DEFAULT NULL,
  `media_encryption_optimistic` enum('yes','no') DEFAULT NULL,
  `rpid_immediate` enum('yes','no') DEFAULT NULL,
  `g726_non_standard` enum('yes','no') DEFAULT NULL,
  `rtp_keepalive` int(11) DEFAULT NULL,
  `rtp_timeout` int(11) DEFAULT NULL,
  `rtp_timeout_hold` int(11) DEFAULT NULL,
  `bind_rtp_to_media_address` enum('yes','no') DEFAULT NULL,
  `voicemail_extension` varchar(40) DEFAULT NULL,
  `mwi_subscribe_replaces_unsolicited` enum('0','1','off','on','false','true','no','yes') DEFAULT NULL,
  `deny` varchar(95) DEFAULT NULL,
  `permit` varchar(95) DEFAULT NULL,
  `acl` varchar(40) DEFAULT NULL,
  `contact_deny` varchar(95) DEFAULT NULL,
  `contact_permit` varchar(95) DEFAULT NULL,
  `contact_acl` varchar(40) DEFAULT NULL,
  `subscribe_context` varchar(40) DEFAULT NULL,
  `fax_detect_timeout` int(11) DEFAULT NULL,
  `contact_user` varchar(80) DEFAULT NULL,
  `preferred_codec_only` enum('yes','no') DEFAULT NULL,
  `asymmetric_rtp_codec` enum('yes','no') DEFAULT NULL,
  `rtcp_mux` enum('yes','no') DEFAULT NULL,
  `allow_overlap` enum('yes','no') DEFAULT NULL,
  `refer_blind_progress` enum('yes','no') DEFAULT NULL,
  `notify_early_inuse_ringing` enum('yes','no') DEFAULT NULL,
  `max_audio_streams` int(11) DEFAULT NULL,
  `max_video_streams` int(11) DEFAULT NULL,
  `webrtc` enum('yes','no') DEFAULT NULL,
  `dtls_fingerprint` enum('SHA-1','SHA-256') DEFAULT NULL,
  `incoming_mwi_mailbox` varchar(40) DEFAULT NULL,
  `bundle` enum('yes','no') DEFAULT NULL,
  `dtls_auto_generate_cert` enum('yes','no') DEFAULT NULL,
  `follow_early_media_fork` enum('yes','no') DEFAULT NULL,
  `accept_multiple_sdp_answers` enum('yes','no') DEFAULT NULL,
  `suppress_q850_reason_headers` enum('yes','no') DEFAULT NULL,
  `trust_connected_line` enum('0','1','off','on','false','true','no','yes') DEFAULT NULL,
  `send_connected_line` enum('0','1','off','on','false','true','no','yes') DEFAULT NULL,
  `ignore_183_without_sdp` enum('0','1','off','on','false','true','no','yes') DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `bf_ps_endpoints_template`
--

INSERT INTO `bf_ps_endpoints_template` (`transport`, `aors`, `auth`, `context`, `disallow`, `allow`, `direct_media`, `connected_line_method`, `direct_media_method`, `direct_media_glare_mitigation`, `disable_direct_media_on_nat`, `dtmf_mode`, `external_media_address`, `force_rport`, `ice_support`, `identify_by`, `mailboxes`, `moh_suggest`, `outbound_auth`, `outbound_proxy`, `rewrite_contact`, `rtp_ipv6`, `rtp_symmetric`, `send_diversion`, `send_pai`, `send_rpid`, `timers_min_se`, `timers`, `timers_sess_expires`, `callerid`, `callerid_privacy`, `callerid_tag`, `100rel`, `aggregate_mwi`, `trust_id_inbound`, `trust_id_outbound`, `use_ptime`, `use_avpf`, `media_encryption`, `inband_progress`, `call_group`, `pickup_group`, `named_call_group`, `named_pickup_group`, `device_state_busy_at`, `fax_detect`, `t38_udptl`, `t38_udptl_ec`, `t38_udptl_maxdatagram`, `t38_udptl_nat`, `t38_udptl_ipv6`, `tone_zone`, `language`, `one_touch_recording`, `record_on_feature`, `record_off_feature`, `rtp_engine`, `allow_transfer`, `allow_subscribe`, `sdp_owner`, `sdp_session`, `tos_audio`, `tos_video`, `sub_min_expiry`, `from_domain`, `from_user`, `mwi_from_user`, `dtls_verify`, `dtls_rekey`, `dtls_cert_file`, `dtls_private_key`, `dtls_cipher`, `dtls_ca_file`, `dtls_ca_path`, `dtls_setup`, `srtp_tag_32`, `media_address`, `redirect_method`, `set_var`, `cos_audio`, `cos_video`, `message_context`, `force_avp`, `media_use_received_transport`, `accountcode`, `user_eq_phone`, `moh_passthrough`, `media_encryption_optimistic`, `rpid_immediate`, `g726_non_standard`, `rtp_keepalive`, `rtp_timeout`, `rtp_timeout_hold`, `bind_rtp_to_media_address`, `voicemail_extension`, `mwi_subscribe_replaces_unsolicited`, `deny`, `permit`, `acl`, `contact_deny`, `contact_permit`, `contact_acl`, `subscribe_context`, `fax_detect_timeout`, `contact_user`, `preferred_codec_only`, `asymmetric_rtp_codec`, `rtcp_mux`, `allow_overlap`, `refer_blind_progress`, `notify_early_inuse_ringing`, `max_audio_streams`, `max_video_streams`, `webrtc`, `dtls_fingerprint`, `incoming_mwi_mailbox`, `bundle`, `dtls_auto_generate_cert`, `follow_early_media_fork`, `accept_multiple_sdp_answers`, `suppress_q850_reason_headers`, `trust_connected_line`, `send_connected_line`, `ignore_183_without_sdp`, `deleted`, `deleted_by`, `created_on`, `created_by`, `modified_on`, `modified_by`, `customer_id`) VALUES
('wss_transport', '101', '101', 'from-extensions', 'all', 'alaw,g722', 'no', NULL, NULL, NULL, NULL, 'auto', NULL, NULL, 'yes', NULL, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yes', 'dtls', 'no', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yes', 'yes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'fingerprint', NULL, '/etc/letsencrypt/live/linkedinextract.in/cert.pem', '/etc/letsencrypt/live/linkedinextract.in/privkey.pem', NULL, '/etc/letsencrypt/live/linkedinextract.in/fullchain.pem', NULL, 'actpass', NULL, NULL, NULL, NULL, NULL, NULL, 'ext-messaging', 'no', 'yes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 120, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 'subscriptions', NULL, NULL, NULL, NULL, 'yes', NULL, NULL, NULL, NULL, NULL, 'yes', 'SHA-1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2020-09-17 01:12:50', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bf_quality_disposition`
--

CREATE TABLE `bf_quality_disposition` (
  `id` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bf_quality_disposition`
--

INSERT INTO `bf_quality_disposition` (`id`, `name`, `deleted`, `deleted_by`, `created_on`, `created_by`, `modified_on`, `modified_by`, `customer_id`) VALUES
(1, 'test', 1, NULL, '2020-11-04 10:44:48', NULL, NULL, NULL, 2),
(5, 'demotest1', 1, NULL, '2020-11-04 13:41:57', NULL, NULL, NULL, 2),
(6, 'abcd', 0, NULL, '2020-11-05 12:54:57', NULL, NULL, NULL, 2),
(7, 'kkk', 0, NULL, '2020-11-05 15:35:05', NULL, NULL, NULL, 2),
(8, 'kkkdsd', 0, NULL, '2020-11-05 15:37:07', NULL, NULL, NULL, 2),
(9, 'frttrtr', 1, NULL, '2020-11-05 17:00:56', NULL, NULL, NULL, 2),
(10, 'checkingone', 0, NULL, '2020-11-05 17:43:52', NULL, NULL, NULL, 2),
(11, 'quality demo1', 0, NULL, '2020-11-05 18:41:49', 2, '2020-11-05 18:42:39', 2, 2),
(12, 'sdsad', 0, NULL, '2020-11-05 19:06:57', 2, NULL, NULL, 2),
(13, 'sdssss', 1, NULL, '2020-11-05 20:52:12', 2, NULL, NULL, 2),
(14, 'quality checking', 0, NULL, '2020-11-05 21:01:09', 2, NULL, NULL, 2),
(15, 'wewe', 0, NULL, '2020-11-09 17:32:40', 2, NULL, NULL, 2),
(16, 'asa', 0, NULL, '2020-11-12 01:22:27', 2, NULL, NULL, 2),
(17, 'fdfdf', 0, NULL, '2020-11-12 12:45:52', 2, NULL, NULL, 2),
(18, 'lasting', 0, NULL, '2020-11-12 13:54:29', 2, '2020-11-12 13:54:40', 2, 2),
(19, 'checking demos', 0, NULL, '2020-11-22 23:42:34', 2, NULL, NULL, 2),
(20, 'ttttt', 0, NULL, '2020-11-24 12:55:13', 2, '2020-11-24 12:55:28', 2, 2),
(21, 'dasdasd', 0, NULL, '2020-11-28 17:51:57', 2, NULL, NULL, 2),
(22, 'jj', 0, NULL, '2020-11-28 18:06:40', 2, '2020-11-28 18:11:26', 2, 2),
(23, 'qstoday', 0, NULL, '2020-12-09 12:59:43', 2, '2020-12-09 13:00:02', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `bf_quality_sub_disposition`
--

CREATE TABLE `bf_quality_sub_disposition` (
  `id` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `quality_disposition_id` int(11) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bf_quality_sub_disposition`
--

INSERT INTO `bf_quality_sub_disposition` (`id`, `name`, `quality_disposition_id`, `deleted`, `deleted_by`, `created_on`, `created_by`, `modified_on`, `modified_by`, `customer_id`) VALUES
(1, 'test sub quality', 2, 0, NULL, '2020-11-04 11:32:35', NULL, NULL, NULL, 2),
(2, 'test dert', 2, 1, NULL, '2020-11-04 11:43:47', NULL, NULL, NULL, 2),
(3, 'sdwsdw', 6, 1, NULL, '2020-11-05 12:57:42', NULL, NULL, NULL, 2),
(4, 'ewewe', 6, 1, NULL, '2020-11-05 12:58:42', NULL, NULL, NULL, 2),
(5, 'sswewew', 6, 1, NULL, '2020-11-05 13:03:45', NULL, NULL, NULL, 2),
(6, 'welcomet', 6, 0, NULL, '2020-11-05 13:36:08', NULL, NULL, NULL, 2),
(7, 'last demo', 6, 0, NULL, '2020-11-05 13:38:21', NULL, NULL, NULL, 2),
(8, 'kkk\\', 6, 0, NULL, '2020-11-05 15:35:27', NULL, NULL, NULL, 2),
(9, 'check one', 9, 0, NULL, '2020-11-05 17:45:56', NULL, NULL, NULL, 2),
(10, 'check onetwo1', 10, 1, NULL, '2020-11-05 17:47:41', NULL, NULL, NULL, 2),
(11, 'q1d1', 11, 0, NULL, '2020-11-05 18:42:08', 2, '2020-11-05 18:42:55', 2, 2),
(12, 'ghghghj', 18, 0, NULL, '2020-11-12 13:54:59', 2, '2020-11-12 13:55:48', 2, 2),
(13, 'ds', 18, 0, NULL, '2020-11-12 13:56:08', 2, NULL, NULL, 2),
(14, 'demosss', 19, 0, NULL, '2020-11-22 23:44:40', 2, '2020-11-28 18:20:48', 2, 2),
(15, 'welcome', 20, 0, NULL, '2020-11-24 12:55:50', 2, '2020-12-09 13:00:27', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `bf_questions`
--

CREATE TABLE `bf_questions` (
  `id` int(11) NOT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `question` varchar(264) DEFAULT NULL,
  `html_input_type_id` int(11) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bf_roles`
--

CREATE TABLE `bf_roles` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(60) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `default` tinyint(1) NOT NULL DEFAULT 0,
  `can_delete` tinyint(1) NOT NULL DEFAULT 1,
  `login_destination` varchar(255) NOT NULL DEFAULT '/',
  `default_context` varchar(255) DEFAULT 'content',
  `deleted` int(1) NOT NULL DEFAULT 0,
  `customer_id` int(11) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bf_roles`
--

INSERT INTO `bf_roles` (`role_id`, `role_name`, `description`, `default`, `can_delete`, `login_destination`, `default_context`, `deleted`, `customer_id`, `deleted_by`, `created_on`, `created_by`, `modified_on`, `modified_by`) VALUES
(1, 'Administrator', 'Has full control over every aspect of the site.', 0, 0, '', 'content', 0, NULL, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 'Editor', 'Can handle day-to-day management, but does not have full power.', 0, 1, '', 'content', 0, 2, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(4, 'User', 'This is the default user with access to login.', 0, 0, '', 'content', 0, 2, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(6, 'Developer', 'Developers typically are the only ones that can access the developer tools. Otherwise identical to Administrators, at least until the site is handed off.', 0, 1, '', 'content', 0, 2, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(7, 'asas', '', 0, 1, '', 'content', 0, 2, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(8, 'shashitest', '', 1, 1, '/admin/dailer', 'content', 0, 2, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bf_role_permissions`
--

CREATE TABLE `bf_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bf_role_permissions`
--

INSERT INTO `bf_role_permissions` (`role_id`, `permission_id`, `customer_id`, `deleted`, `deleted_by`, `created_on`, `created_by`, `modified_on`, `modified_by`) VALUES
(2, 3, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 4, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 5, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 6, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 7, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 8, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 9, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 10, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 11, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 12, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 13, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 14, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 15, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 16, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 17, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 18, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 19, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 20, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 21, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 22, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 23, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 24, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 25, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 26, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 27, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 28, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 29, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 30, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 31, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 32, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 33, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 34, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 35, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 36, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 37, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 38, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 39, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 40, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 41, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 42, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 43, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 44, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 45, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 46, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 47, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 48, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 49, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 50, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 51, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 52, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 53, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 54, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 55, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 56, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 57, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 58, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 59, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 60, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 61, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 62, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 63, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 64, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 65, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 66, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 67, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 68, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 69, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 70, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 71, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 72, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 73, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 74, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 75, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 76, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 77, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 78, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 79, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 80, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 81, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 82, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 83, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 84, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 85, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 86, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 87, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 88, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 89, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 90, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 91, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 92, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 93, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 94, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 95, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 96, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 97, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 98, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 99, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(2, 100, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(4, 1, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(4, 2, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(4, 3, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(4, 4, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(4, 5, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(4, 6, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(4, 7, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(4, 8, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(4, 9, 2, 0, NULL, '2020-09-19 17:51:17', NULL, NULL, NULL),
(4, 10, 2, 0, NULL, '2020-09-19 17:51:20', NULL, NULL, NULL),
(4, 11, 2, 0, NULL, '2020-09-22 23:55:20', NULL, NULL, NULL),
(4, 12, 2, 0, NULL, '2020-09-22 23:55:24', NULL, NULL, NULL),
(4, 13, 2, 0, NULL, '2020-09-22 23:55:29', NULL, NULL, NULL),
(4, 14, 2, 0, NULL, '2020-09-22 23:55:34', NULL, NULL, NULL),
(4, 15, 2, 0, NULL, '2020-11-28 14:57:27', NULL, NULL, NULL),
(4, 17, 2, 0, NULL, '2020-11-02 14:57:12', NULL, NULL, NULL),
(6, 1, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(6, 2, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(6, 3, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(6, 4, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(6, 5, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(6, 6, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(6, 7, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(6, 8, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(6, 9, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(6, 10, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(6, 11, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(6, 12, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(7, 1, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(7, 2, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(8, 1, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL),
(8, 2, 2, 0, NULL, '2020-09-17 01:12:55', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bf_sale_business_details`
--

CREATE TABLE `bf_sale_business_details` (
  `id` int(11) NOT NULL,
  `business_name` varchar(100) NOT NULL,
  `business_address` varchar(100) DEFAULT NULL,
  `country` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `city` int(11) DEFAULT NULL,
  `contact_number` varchar(100) DEFAULT NULL,
  `type_of_contact` varchar(25) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bf_sale_client_details`
--

CREATE TABLE `bf_sale_client_details` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `first_name` varchar(25) DEFAULT NULL,
  `last_name` varchar(25) DEFAULT NULL,
  `business_phone` varchar(15) DEFAULT NULL,
  `personal_phone` varchar(15) DEFAULT NULL,
  `business_email` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(120) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `designation` varchar(50) DEFAULT NULL,
  `created_on` datetime DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '1 - new opportunity\r\n2 - proposal\r\n3 - proposal approved\r\n4 - contract signed off\r\n5 - Client Onboard',
  `customer_id` int(11) DEFAULT NULL,
  `revenue` decimal(10,2) DEFAULT NULL,
  `business_name` varchar(255) DEFAULT NULL,
  `type_of_contact` varchar(50) DEFAULT NULL,
  `status_modified_on` datetime DEFAULT NULL,
  `isRemoved` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bf_sale_client_details`
--

INSERT INTO `bf_sale_client_details` (`id`, `title`, `first_name`, `last_name`, `business_phone`, `personal_phone`, `business_email`, `city`, `state`, `country`, `address`, `designation`, `created_on`, `created_by`, `modified_on`, `modified_by`, `status`, `customer_id`, `revenue`, `business_name`, `type_of_contact`, `status_modified_on`, `isRemoved`) VALUES
(1, 'kk', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-10-20 22:17:44', 2, NULL, NULL, 3, 2, NULL, NULL, '', NULL, 1),
(2, 'tets', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-10-20 22:20:38', 2, NULL, NULL, 4, 2, NULL, NULL, '', NULL, 1),
(3, 'kesa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-10-20 23:05:30', 2, NULL, NULL, 4, 2, NULL, NULL, '', NULL, 1),
(4, 'keshav', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-10-20 23:05:39', 2, NULL, NULL, 2, 2, NULL, NULL, '', NULL, 1),
(5, 'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-10-20 23:05:50', 2, NULL, NULL, 4, 2, NULL, NULL, '', NULL, 1),
(6, 'saasdasdasd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-10-20 23:05:55', 2, NULL, NULL, 5, 2, NULL, NULL, '', NULL, 1),
(7, 'asdasd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-10-20 23:35:57', 2, NULL, NULL, 5, 2, NULL, NULL, '', NULL, 1),
(8, 'aSas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-10-20 23:36:21', 2, NULL, NULL, 5, 2, NULL, NULL, '', NULL, 1),
(9, 'aSas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-10-20 23:36:22', 2, NULL, NULL, 5, 2, NULL, NULL, '', NULL, 1),
(10, 'dasdad', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-10-20 23:36:45', 2, NULL, NULL, 5, 2, NULL, NULL, '', NULL, 1),
(11, 'asdasd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-10-20 23:40:54', 2, NULL, NULL, 5, 2, NULL, NULL, '', NULL, 1),
(12, 'shashi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-10-20 23:41:13', 2, NULL, NULL, 1, 2, NULL, NULL, '', NULL, 1),
(13, 'ShaShai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-10-20 23:43:09', 2, NULL, NULL, 5, 2, NULL, NULL, '', NULL, 1),
(14, 'ASasAS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-10-20 23:43:43', 2, NULL, NULL, 5, 2, NULL, NULL, '', NULL, 1),
(15, 'tASLK TO SOMEONE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-10-20 23:45:17', 2, NULL, NULL, 1, 2, NULL, NULL, '', NULL, 1),
(16, 'kkkkkkkkkkkkkkkkkkkkkkkkkk ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-10-20 23:52:33', 2, NULL, NULL, 5, 2, NULL, NULL, '', NULL, 1),
(17, 'kkk', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-10-21 01:10:20', 2, NULL, NULL, 3, 2, NULL, NULL, '', NULL, 1),
(18, 'bhusan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-10-21 01:19:10', 2, NULL, NULL, 1, 2, NULL, NULL, '', NULL, 1),
(19, 'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-10-22 10:38:24', 2, NULL, NULL, 1, 2, NULL, NULL, NULL, NULL, 1),
(20, 'dasd asd asd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-10-22 10:47:00', 2, NULL, NULL, 1, 2, NULL, NULL, NULL, NULL, 1),
(21, 'kkk', 'keshav', 'jjj', '33', '33', 'ss', NULL, NULL, '1', 'lucnow', 'sss', '2020-10-22 10:47:10', 2, '2020-10-22 09:55:28', 2, 1, 2, '22.00', '22', NULL, NULL, 1),
(22, 'jhkhkh k hkh k hkhk', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-10-22 13:32:15', 2, '2020-10-22 10:02:43', 2, 1, 2, NULL, NULL, NULL, NULL, 1),
(23, 'kkkkk', 'keshav', 'kant', NULL, NULL, NULL, NULL, NULL, '1', 'lucnow, lucknow', NULL, '2020-10-22 13:35:05', 2, '2020-10-22 10:08:56', 2, 1, 2, NULL, 'test', NULL, NULL, 1),
(24, 'j jgjhgjgjjg', 'kkk', 'kkk', '777', '777', 'kkkk', NULL, NULL, '1', '777', 'kkk', '2020-10-22 13:39:09', 2, '2020-10-22 10:09:32', 2, 1, 2, '111.00', '777', NULL, NULL, 1),
(25, 'Shashi ', 'keshav', 'kant', '+918097755641', '444', 'asdasd@com.com', NULL, NULL, '1', 'lucnow, lucknow', 'sss', '2020-10-22 16:48:46', 2, '2020-10-22 13:19:03', 2, 5, 2, '55.00', 'test', NULL, '2020-10-22 13:19:20', 1),
(26, 'kjdkashdkajs\n', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-10-22 16:50:08', 2, '2020-10-22 13:21:08', 2, 3, 2, NULL, NULL, NULL, '2020-10-22 13:22:09', 1),
(27, 'dssfsdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-10-22 16:56:06', 2, NULL, NULL, 2, 2, NULL, NULL, NULL, '2020-10-23 14:02:34', 1),
(28, 'sadsad', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-10-22 16:56:13', 2, NULL, NULL, 3, 2, NULL, NULL, NULL, '2020-10-26 13:43:12', 1),
(29, 'sdad', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-10-22 16:56:13', 2, NULL, NULL, 1, 2, NULL, NULL, NULL, '2020-10-26 13:43:10', 1),
(30, 'sadasd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-10-22 16:56:18', 2, NULL, NULL, 5, 2, NULL, NULL, NULL, '2020-10-22 13:26:36', 1),
(31, 'sadasd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-10-22 16:56:23', 2, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL, 1),
(32, 'ssadas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-10-22 16:56:26', 2, NULL, NULL, 4, 2, NULL, NULL, NULL, '2020-10-22 13:26:32', 1),
(33, 'test', 'keshav', 'kant', '+918097755641', NULL, 'asdasd@com.com', NULL, NULL, '1', 'lucnow', 'sss', '2020-10-26 18:24:36', 2, '2020-10-26 13:57:24', 2, 1, 2, '55.00', 'test', 'Mr', NULL, 1),
(34, 'jjj', 'kk', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-10-26 18:30:08', 2, '2020-10-26 14:00:15', 2, 1, 2, NULL, NULL, NULL, NULL, 1),
(35, '1 first test client', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-10-27 15:18:44', 2, '2020-11-19 20:51:24', 2, 5, 2, NULL, NULL, NULL, '2020-11-19 20:51:32', 1),
(36, '2nd test ', 'keshav', 'kant', '+918097755641', NULL, 'asdasd@com.com', NULL, NULL, '1', 'lucnow', 'kkkk', '2020-10-27 15:26:35', 2, '2020-10-27 13:55:55', 2, 5, 2, '55.00', 'test', NULL, '2020-10-27 14:09:22', 1),
(37, 'dsfsdf', 'hema', 'shinde', '1234560987', 'h@gmail.com', 'hemashinde@gmail.com', NULL, NULL, '1', 'karvenagar', NULL, '2020-10-28 18:20:38', 2, '2020-11-21 16:53:35', 2, 5, 2, NULL, 'abx', NULL, '2020-11-21 16:53:31', 1),
(38, 'lkjhk', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-08 13:06:11', 2, NULL, NULL, 2, 2, NULL, NULL, NULL, '2020-11-08 15:36:16', 1),
(39, 'Install Active \n', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-16 13:51:10', 2, '2020-11-21 16:49:54', 2, 5, 2, NULL, NULL, NULL, '2020-11-21 16:50:02', 1),
(40, 'Configure Active', 'h', 'shinde', '9874012154', '9654120214', 'h@gmail.com', NULL, NULL, '1', 'abc', 'kj', '2020-11-16 13:51:20', 2, '2020-11-30 15:36:45', 2, 0, 2, '8.00', 'demo', 'Dr', NULL, 0),
(41, 'XpertLync', 'Shashi', 'Naikat', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-16 13:53:08', 2, '2020-11-21 16:50:33', 2, 5, 2, NULL, NULL, NULL, '2020-11-21 16:50:35', 1),
(42, 'XpertLync\n', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-19 17:58:30', 2, '2020-11-19 20:28:55', 2, 1, 2, NULL, NULL, NULL, NULL, 1),
(43, 'Aziron new emp hiring', 'keshav', 'keshav', NULL, NULL, 'keshav.singh4@gmail.com', NULL, NULL, NULL, NULL, NULL, '2020-11-21 17:50:31', 2, '2020-11-21 20:21:27', 2, 0, 2, NULL, NULL, NULL, NULL, 1),
(44, 'a', 'hema', 'shinde', NULL, NULL, 'h@gmail.com', NULL, '1', '1', NULL, 'testing demo designation', '2020-11-23 12:33:10', 2, '2020-11-23 08:10:33', 2, 5, 2, NULL, 'demo', 'Dr', '2020-11-23 08:10:41', 1),
(45, 'test\n', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-30 12:29:31', 2, '2020-12-02 10:51:01', 2, 1, 2, NULL, NULL, NULL, NULL, 0),
(46, 'hema', 'hema', 'shinde', '96033507260', '9800002100', 'h@gmail.com', NULL, '1', '1', 'pune', 'abc', '2020-12-02 10:27:39', 2, '2020-12-02 05:59:33', 2, 5, 2, '3.00', 'abc', 'Dr', '2020-12-02 06:00:11', 0),
(47, 'demo', 'hema', 'shinde', '9852012100', '9800215500', 'hema@gmail.com', NULL, '1', '1', 'pune', 'abc', '2020-12-02 17:00:32', 2, '2020-12-04 12:50:05', 2, 1, 2, '45.00', 'demos', 'Dr', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `bf_schema_version`
--

CREATE TABLE `bf_schema_version` (
  `type` varchar(40) NOT NULL,
  `version` int(4) NOT NULL DEFAULT 0,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bf_schema_version`
--

INSERT INTO `bf_schema_version` (`type`, `version`, `deleted`, `deleted_by`, `created_on`, `created_by`, `modified_on`, `modified_by`, `customer_id`) VALUES
('aors_', 1, 0, NULL, '2020-09-17 01:12:57', NULL, NULL, NULL, NULL),
('application_', 1, 0, NULL, '2020-09-17 01:12:57', NULL, NULL, NULL, NULL),
('auths_', 1, 0, NULL, '2020-09-17 01:12:57', NULL, NULL, NULL, NULL),
('campaign_', 1, 0, NULL, '2020-09-17 01:12:57', NULL, NULL, NULL, NULL),
('companies_', 1, 0, NULL, '2020-09-17 01:12:57', NULL, NULL, NULL, NULL),
('core', 44, 0, NULL, '2020-09-17 01:12:57', NULL, NULL, NULL, NULL),
('dashboard_', 1, 0, NULL, '2020-09-17 01:12:57', NULL, NULL, NULL, NULL),
('data_upload_', 2, 0, NULL, '2020-09-17 01:12:57', NULL, NULL, NULL, NULL),
('extensions_', 1, 0, NULL, '2020-09-17 01:12:57', NULL, NULL, NULL, NULL),
('extension_', 2, 0, NULL, '2020-09-17 01:12:57', NULL, NULL, NULL, NULL),
('meets_', 1, 0, NULL, '2020-09-17 01:12:57', NULL, NULL, NULL, NULL),
('subscribed_users_', 2, 0, NULL, '2020-09-17 01:12:57', NULL, NULL, NULL, NULL),
('subscription_plans_', 2, 0, NULL, '2020-09-17 01:12:57', NULL, NULL, NULL, NULL),
('support_', 2, 0, NULL, '2020-09-17 01:12:57', NULL, NULL, NULL, NULL),
('test_jit_', 2, 0, NULL, '2020-09-17 01:12:57', NULL, NULL, NULL, NULL),
('udc_', 1, 0, NULL, '2020-09-17 01:12:57', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bf_sessions`
--

CREATE TABLE `bf_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_data` text NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bf_settings`
--

CREATE TABLE `bf_settings` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `module` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bf_settings`
--

INSERT INTO `bf_settings` (`id`, `name`, `module`, `value`, `deleted`, `deleted_by`, `created_on`, `created_by`, `modified_on`, `modified_by`, `customer_id`) VALUES
(1, 'smtp_host', 'email', '173.249.36.6', 0, NULL, '2020-09-17 01:12:58', NULL, NULL, NULL, 2),
(2, 'smtp_pass', 'email', 'Hema@Arizon#4321', 0, NULL, '2020-09-17 01:12:58', NULL, NULL, NULL, 2),
(3, 'smtp_port', 'email', '25', 0, NULL, '2020-09-17 01:12:58', NULL, NULL, NULL, 2),
(4, 'smtp_timeout', 'email', '150', 0, NULL, '2020-09-17 01:12:58', NULL, NULL, NULL, 2),
(5, 'smtp_user', 'email', 'hema@xpertdialer.com', 0, NULL, '2020-09-17 01:12:58', NULL, NULL, NULL, 2),
(6, 'protocol', 'email', 'smtp', 0, NULL, '2020-09-17 01:12:58', NULL, NULL, NULL, 2),
(7, 'mailtype', 'email', 'html', 0, NULL, '2020-09-17 01:12:58', NULL, NULL, NULL, 2),
(8, 'charset', 'email', 'utf-8', 0, NULL, '2020-09-17 01:12:58', NULL, NULL, NULL, 2),
(9, 'Identification', 'email', 'Xpertdailer App Notification', 0, NULL, '2020-09-17 01:12:58', NULL, NULL, NULL, 2),
(12, 'rewr', 'rer', 'rerwer', 1, 2, '2020-11-27 16:24:06', 2, '2020-11-27 17:06:40', 2, 2),
(13, 'dsada', 'adsad', 'dasdasdasd', 1, 2, '2020-11-27 17:15:18', 2, NULL, NULL, 2),
(14, 'dasda', 'dsad', 'dasdasd', 1, 2, '2020-11-27 17:15:19', 2, NULL, NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `bf_state`
--

CREATE TABLE `bf_state` (
  `state_name` varchar(64) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bf_state`
--

INSERT INTO `bf_state` (`state_name`, `country_id`, `deleted`, `deleted_by`, `created_on`, `created_by`, `modified_on`, `modified_by`, `customer_id`, `id`) VALUES
('Maharashtra', 1, 1, NULL, '2020-11-20 11:09:54', 2, NULL, NULL, 2, 1),
('Gujarat', 1, 0, NULL, '2020-11-20 11:10:30', 2, '2020-11-20 11:33:53', 2, 2, 2),
('punjab', 1, 1, NULL, '2020-11-20 11:11:35', 2, '2020-11-20 11:31:29', 2, 2, 3),
('dsad', 1, 1, NULL, '2020-11-20 11:36:28', 2, NULL, NULL, 2, 4),
('a', 5, 0, NULL, '2020-11-24 14:35:45', 2, NULL, NULL, 2, 5),
('b', 5, 0, NULL, '2020-11-24 14:47:04', 2, NULL, NULL, 2, 6);

-- --------------------------------------------------------

--
-- Table structure for table `bf_subscribed_users`
--

CREATE TABLE `bf_subscribed_users` (
  `id` int(11) NOT NULL,
  `plan_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `start_date` date NOT NULL DEFAULT '0000-00-00',
  `end_date` date NOT NULL DEFAULT '0000-00-00',
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `credit` bigint(20) NOT NULL DEFAULT 0,
  `credit_remaining` bigint(20) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` bigint(20) NOT NULL,
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Dumping data for table `bf_subscribed_users`
--

INSERT INTO `bf_subscribed_users` (`id`, `plan_id`, `user_id`, `start_date`, `end_date`, `deleted`, `credit`, `credit_remaining`, `deleted_by`, `created_on`, `created_by`, `modified_on`, `modified_by`) VALUES
(1, 1, 1, '0000-00-00', '2018-07-01', 0, 50, 56, NULL, '0000-00-00 00:00:00', 0, '2018-05-10 18:35:06', 1),
(2, 1, 1, '0000-00-00', '2018-07-01', 0, 10, 0, NULL, '0000-00-00 00:00:00', 0, '2018-03-08 22:04:28', 1),
(3, 1, 1, '0000-00-00', '2018-07-01', 0, 10, 0, NULL, '0000-00-00 00:00:00', 0, '2018-03-12 16:41:39', 1);

-- --------------------------------------------------------

--
-- Table structure for table `bf_subscriptions`
--

CREATE TABLE `bf_subscriptions` (
  `subscription_id` int(11) NOT NULL,
  `member_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `credit_coutnts` int(11) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bf_subscription_plans`
--

CREATE TABLE `bf_subscription_plans` (
  `id` int(11) NOT NULL,
  `plan_name` varchar(255) COLLATE latin1_spanish_ci NOT NULL,
  `prospect_count` bigint(20) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` bigint(20) NOT NULL,
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` bigint(20) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `features` varchar(500) COLLATE latin1_spanish_ci NOT NULL,
  `offer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Dumping data for table `bf_subscription_plans`
--

INSERT INTO `bf_subscription_plans` (`id`, `plan_name`, `prospect_count`, `deleted`, `deleted_by`, `created_on`, `created_by`, `modified_on`, `modified_by`, `price`, `features`, `offer`) VALUES
(1, 'Free Plan', 50, 0, NULL, '2018-03-08 16:24:38', 1, '0000-00-00 00:00:00', NULL, 0, 'No Expiry', 0),
(2, 'Silver', 10000, 0, NULL, '2018-11-09 17:24:40', 1, '0000-00-00 00:00:00', NULL, 50, 'Auto Renew ', 0),
(3, 'Gold', 100000, 0, NULL, '2018-11-09 17:25:04', 1, '0000-00-00 00:00:00', NULL, 500, 'Never Expire', 0),
(4, 'Platinum', 1000000, 0, NULL, '2018-11-09 17:25:29', 1, '0000-00-00 00:00:00', NULL, 1000, 'Enterprise ', 0);

-- --------------------------------------------------------

--
-- Table structure for table `bf_support`
--

CREATE TABLE `bf_support` (
  `id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `status` int(11) DEFAULT 0,
  `message` varchar(1000) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` bigint(20) NOT NULL,
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bf_support`
--

INSERT INTO `bf_support` (`id`, `subject`, `status`, `message`, `deleted`, `deleted_by`, `created_on`, `created_by`, `modified_on`, `modified_by`) VALUES
(1, 'test', NULL, 'sdsaasd asd', 0, NULL, '2018-11-09 14:05:00', 1, '2020-08-09 00:36:49', 1);

-- --------------------------------------------------------

--
-- Table structure for table `bf_suppression`
--

CREATE TABLE `bf_suppression` (
  `id` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bf_suppression_rules`
--

CREATE TABLE `bf_suppression_rules` (
  `id` int(11) NOT NULL,
  `suppression_id` int(11) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `conditions` varchar(264) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bf_suppression_type`
--

CREATE TABLE `bf_suppression_type` (
  `id` int(11) NOT NULL,
  `type_name` varchar(64) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bf_technologies`
--

CREATE TABLE `bf_technologies` (
  `id` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bf_test_jit`
--

CREATE TABLE `bf_test_jit` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bf_test_jit`
--

INSERT INTO `bf_test_jit` (`id`, `name`, `deleted`, `deleted_by`, `created_on`, `created_by`, `modified_on`, `modified_by`, `customer_id`) VALUES
(1, 'keshav1222', 0, NULL, '2020-09-17 01:13:03', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bf_text`
--

CREATE TABLE `bf_text` (
  `text` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bf_todos`
--

CREATE TABLE `bf_todos` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `done_at` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bf_todos`
--

INSERT INTO `bf_todos` (`id`, `name`, `status`, `created_at`, `updated_at`, `done_at`, `user_id`) VALUES
(1, 'll', 1, '2020-10-02 12:25:16', '2020-10-02 12:25:16', '2020-10-02 14:48:15', 2),
(2, 'k', 1, '2020-10-02 12:25:18', '2020-10-02 12:25:18', '2020-10-02 14:48:04', 2),
(3, 'k', 1, '2020-10-02 12:25:19', '2020-10-02 12:25:19', '2020-10-02 14:48:06', 2),
(4, 'll', 1, '2020-10-02 12:26:25', '2020-10-02 12:26:25', '2020-10-02 14:48:16', 2),
(5, 'jjj', 1, '2020-10-02 12:48:25', '2020-10-02 12:48:25', '2020-10-02 15:09:21', 2),
(6, 'lll', 1, '2020-10-02 13:09:24', '2020-10-02 13:09:24', '2020-10-02 15:48:37', 2),
(7, 'sd', 1, '2020-10-02 13:49:35', '2020-10-02 13:49:35', '2020-10-02 18:48:24', 2),
(8, 'sdfs', 1, '2020-10-02 13:49:45', '2020-10-02 13:49:45', '2020-10-02 18:48:22', 2),
(9, 'sdfs', 1, '2020-10-02 13:49:48', '2020-10-02 13:49:48', '2020-10-02 18:48:21', 2),
(10, 'sdf', 1, '2020-10-02 13:49:49', '2020-10-02 13:49:49', '2020-10-02 18:48:20', 2),
(11, 'sdf', 1, '2020-10-02 13:49:50', '2020-10-02 13:49:50', '2020-10-02 18:48:25', 2),
(12, 'vvvvvvv', 1, '2020-10-02 16:48:15', '2020-10-02 16:48:15', '2020-10-02 20:04:14', 2),
(13, 'kkk', 1, '2020-10-02 18:03:49', '2020-10-02 18:03:49', '2020-10-02 20:04:16', 2),
(14, 'kkkk', 1, '2020-10-02 18:03:52', '2020-10-02 18:03:52', '2020-10-02 20:04:17', 2),
(15, 'kkkk', 1, '2020-10-02 18:03:54', '2020-10-02 18:03:54', '2020-10-02 20:04:18', 2),
(16, 'jjjj', 1, '2020-10-02 18:03:56', '2020-10-02 18:03:56', '2020-10-02 20:04:19', 2),
(17, 'kjkjk', 1, '2020-10-02 18:03:57', '2020-10-02 18:03:57', '2020-10-02 20:04:19', 2),
(18, 'kkjk', 1, '2020-10-02 18:03:59', '2020-10-02 18:03:59', '2020-10-02 20:04:20', 2),
(19, 'kjkjkj', 1, '2020-10-02 18:04:00', '2020-10-02 18:04:00', '2020-10-02 20:04:21', 2),
(20, 'kkjkj', 1, '2020-10-02 18:04:01', '2020-10-02 18:04:01', '2020-10-02 20:04:22', 2),
(21, 'kjkjkjkj', 1, '2020-10-02 18:04:03', '2020-10-02 18:04:03', '2020-10-02 20:04:23', 2),
(22, 'kjkjkj', 1, '2020-10-02 18:04:04', '2020-10-02 18:04:04', '2020-10-02 20:04:24', 2),
(23, 'sashi', 1, '2020-10-02 18:31:21', '2020-10-02 18:31:21', '2020-10-02 20:31:45', 2),
(24, 'to do list shasi', 1, '2020-10-02 18:31:35', '2020-10-02 18:31:35', '2020-10-04 13:03:18', 2),
(25, 'asdasdad', 1, '2020-10-04 11:03:06', '2020-10-04 11:03:06', '2020-10-04 13:03:22', 2),
(26, 'asdasda', 1, '2020-10-04 11:03:09', '2020-10-04 11:03:09', '2020-10-04 13:03:25', 2),
(27, 'ddsa', 1, '2020-10-04 11:06:44', '2020-10-04 11:06:44', '2020-10-07 14:13:42', 2),
(28, 'kkk', 1, '2020-10-06 17:55:04', '2020-10-06 17:55:04', '2020-10-07 14:13:43', 2),
(29, 'asd', 1, '2020-10-07 12:13:40', '2020-10-07 12:13:40', '2020-10-07 14:13:44', 2),
(30, 'll', 1, '2020-10-07 12:13:46', '2020-10-07 12:13:46', '2020-10-08 16:34:57', 2),
(31, 'sdfsd', 1, '2020-10-08 14:33:16', '2020-10-08 14:33:16', '2020-10-08 16:34:58', 2),
(32, 'kkk', 1, '2020-10-08 14:34:50', '2020-10-08 14:34:50', '2020-10-08 16:34:59', 2),
(33, 'prospect exist using FLC and email', 0, '2020-10-08 15:38:27', '2020-10-08 15:38:27', '0000-00-00 00:00:00', 2),
(34, 'Change supress radio for shassing values - sha1, sha256, sha386', 0, '2020-10-08 17:51:37', '2020-10-08 17:51:37', '0000-00-00 00:00:00', 2),
(35, 'Limit lead/Company ', 0, '2020-10-08 19:54:31', '2020-10-08 19:54:31', '0000-00-00 00:00:00', 2),
(36, 'k', 1, '2020-10-08 19:54:42', '2020-10-08 19:54:42', '2020-10-08 21:54:47', 2),
(37, 'k', 1, '2020-10-08 19:54:43', '2020-10-08 19:54:43', '2020-10-08 21:54:49', 2),
(38, 'http://localhost/xpertdialer/agent/manual/6', 1, '2020-10-09 07:15:39', '2020-10-09 07:15:39', '2020-10-09 09:15:43', 2),
(39, 'Question and Answer pending', 0, '2020-10-09 12:38:32', '2020-10-09 12:38:32', '0000-00-00 00:00:00', 2),
(40, 'jj', 1, '2020-11-22 16:55:07', '2020-11-22 16:55:07', '2020-11-23 03:57:14', 2),
(41, 'fgfg', 1, '2020-11-22 17:14:30', '2020-11-22 17:14:30', '2020-11-23 03:56:58', 2),
(42, 'added by hema', 1, '2020-11-22 17:14:41', '2020-11-22 17:14:41', '2020-11-23 03:56:55', 2),
(43, 'asd', 1, '2020-11-22 19:56:04', '2020-11-22 19:56:04', '2020-11-23 03:56:51', 2),
(44, '55', 1, '2020-11-22 19:56:13', '2020-11-22 19:56:13', '2020-11-23 03:56:49', 2),
(45, 'as', 1, '2020-11-23 06:21:56', '2020-11-23 06:21:56', '2020-11-23 07:22:00', 2),
(46, 'kk', 1, '2020-11-23 07:41:47', '2020-11-23 07:41:47', '2020-12-03 09:43:55', 2),
(47, 'kk', 1, '2020-11-24 04:12:04', '2020-11-24 04:12:04', '2020-12-03 09:43:52', 2),
(48, 'testing ordering', 1, '2020-11-24 04:12:22', '2020-11-24 04:12:22', '2020-12-03 09:43:49', 2),
(49, '55555', 1, '2020-11-24 04:13:55', '2020-11-24 04:13:55', '2020-12-03 09:43:46', 2),
(50, 'uuu]', 1, '2020-11-24 04:17:05', '2020-11-24 04:17:05', '2020-12-03 09:43:43', 2),
(51, 'jj', 1, '2020-11-24 04:19:15', '2020-11-24 04:19:15', '2020-12-03 09:44:02', 2),
(52, 'kk', 1, '2020-12-03 08:43:32', '2020-12-03 08:43:32', '2020-12-03 09:43:57', 2);

-- --------------------------------------------------------

--
-- Table structure for table `bf_udc_country`
--

CREATE TABLE `bf_udc_country` (
  `id` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bf_udc_country`
--

INSERT INTO `bf_udc_country` (`id`, `name`, `deleted`, `deleted_by`, `created_on`, `created_by`, `modified_on`, `modified_by`, `customer_id`) VALUES
(1, 'india', 0, NULL, '2020-09-21 19:44:22', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bf_udc_employee_size`
--

CREATE TABLE `bf_udc_employee_size` (
  `id` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bf_udc_employee_size`
--

INSERT INTO `bf_udc_employee_size` (`id`, `name`, `deleted`, `deleted_by`, `created_on`, `created_by`, `modified_on`, `modified_by`, `customer_id`) VALUES
(1, '10000', 0, NULL, '2020-09-21 19:44:50', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bf_udc_industry`
--

CREATE TABLE `bf_udc_industry` (
  `id` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bf_udc_industry`
--

INSERT INTO `bf_udc_industry` (`id`, `name`, `deleted`, `deleted_by`, `created_on`, `created_by`, `modified_on`, `modified_by`, `customer_id`) VALUES
(1, 'information', 0, NULL, '2020-09-21 19:44:57', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bf_udc_job_function`
--

CREATE TABLE `bf_udc_job_function` (
  `id` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bf_udc_job_function`
--

INSERT INTO `bf_udc_job_function` (`id`, `name`, `deleted`, `deleted_by`, `created_on`, `created_by`, `modified_on`, `modified_by`, `customer_id`) VALUES
(1, 'other', 0, NULL, '2020-09-21 19:45:06', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bf_udc_job_level`
--

CREATE TABLE `bf_udc_job_level` (
  `id` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bf_udc_job_level`
--

INSERT INTO `bf_udc_job_level` (`id`, `name`, `deleted`, `deleted_by`, `created_on`, `created_by`, `modified_on`, `modified_by`, `customer_id`) VALUES
(1, 'Director', 0, NULL, '2020-09-17 01:12:44', NULL, NULL, NULL, NULL),
(2, 'Manager', 0, NULL, '2020-09-17 01:12:44', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bf_udc_nic_code`
--

CREATE TABLE `bf_udc_nic_code` (
  `id` int(11) NOT NULL,
  `description` varchar(254) DEFAULT NULL,
  `code` varchar(10) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bf_udc_revenue`
--

CREATE TABLE `bf_udc_revenue` (
  `id` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bf_udc_revenue`
--

INSERT INTO `bf_udc_revenue` (`id`, `name`, `deleted`, `deleted_by`, `created_on`, `created_by`, `modified_on`, `modified_by`, `customer_id`) VALUES
(1, '100M', 0, NULL, '2020-09-21 19:45:16', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bf_udc_salutation`
--

CREATE TABLE `bf_udc_salutation` (
  `id` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bf_udc_salutation`
--

INSERT INTO `bf_udc_salutation` (`id`, `name`, `deleted`, `deleted_by`, `created_on`, `created_by`, `modified_on`, `modified_by`, `customer_id`) VALUES
(1, 'Mr', 0, NULL, '2020-09-21 19:45:24', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bf_udc_sic_code`
--

CREATE TABLE `bf_udc_sic_code` (
  `id` int(11) NOT NULL,
  `description` varchar(254) DEFAULT NULL,
  `code` varchar(10) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bf_users`
--

CREATE TABLE `bf_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` int(11) NOT NULL DEFAULT 4,
  `email` varchar(254) NOT NULL,
  `username` varchar(30) NOT NULL DEFAULT '',
  `password_hash` char(60) DEFAULT NULL,
  `reset_hash` varchar(40) DEFAULT NULL,
  `last_login` datetime NOT NULL DEFAULT current_timestamp(),
  `last_ip` varchar(45) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `reset_by` int(10) DEFAULT NULL,
  `banned` tinyint(1) NOT NULL DEFAULT 0,
  `ban_message` varchar(255) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `display_name_changed` date DEFAULT NULL,
  `timezone` varchar(40) NOT NULL DEFAULT 'UM6',
  `language` varchar(20) NOT NULL DEFAULT 'english',
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `activate_hash` varchar(40) DEFAULT NULL,
  `force_password_reset` tinyint(1) DEFAULT 0,
  `customer_id` int(11) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `designation` varchar(50) DEFAULT NULL,
  `profile_url` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bf_users`
--

INSERT INTO `bf_users` (`id`, `role_id`, `email`, `username`, `password_hash`, `reset_hash`, `last_login`, `last_ip`, `created_on`, `deleted`, `reset_by`, `banned`, `ban_message`, `display_name`, `display_name_changed`, `timezone`, `language`, `active`, `activate_hash`, `force_password_reset`, `customer_id`, `deleted_by`, `created_by`, `modified_on`, `modified_by`, `designation`, `profile_url`, `description`) VALUES
(1, 1, 'admin@mybonfire.com', 'admin', 'a1fa99a1724242d0931d4f9c62dd56a6', NULL, '2020-09-05 20:05:08', '::1', '2018-11-05 14:56:23', 0, NULL, 0, NULL, 'admin', NULL, 'UM6', 'english', 1, '', 0, 9999999, NULL, NULL, NULL, NULL, '', '', NULL),
(2, 2, 'hemashinde90@gmail.com', 'voip', 'a1fa99a1724242d0931d4f9c62dd56a6', NULL, '2020-08-21 14:21:37', '::1', '2018-11-05 14:56:23', 0, 2, 0, NULL, 'voip managerf', NULL, 'UM6', 'english', 1, '', 0, 2, NULL, NULL, '2020-11-27 10:20:29', 2, 'vpf', 'http://localhost/gitx//resources/uploads/Profile/2020/11/24/4f525c9f6a279d70ceb2aae1f1a18cc4.png', 'The DESC comman  hhjg jhghgjgjffff'),
(13, 2, 'keshav.singh4@gmail.com', '1', 'a1fa99a1724242d0931d4f9c62dd56a6', NULL, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', 0, NULL, 0, NULL, 'k', NULL, 'UM6', 'english', 0, '', 0, 2, NULL, NULL, NULL, NULL, '', '', NULL),
(41, 4, 'hruchivanjari02@gmail.com', 'hemas', '8b6be57a8b27647beb8d1bc3dd2c2ac8', NULL, '2020-11-11 18:41:52', NULL, '2020-11-11 18:41:52', 0, NULL, 0, NULL, NULL, NULL, 'UM6', 'english', 1, NULL, 0, 2, NULL, 2, NULL, NULL, NULL, NULL, NULL),
(53, 4, 'hema.shinde@xpertlync.com', 'hs', '4a3ed2901206df94b2445b3494e2acf3', NULL, '2020-11-24 14:57:26', NULL, '2020-11-24 14:57:26', 0, 2, 1, NULL, NULL, NULL, 'UM6', 'english', 0, NULL, 0, 2, NULL, 2, '2020-11-24 15:06:17', 2, NULL, NULL, NULL),
(56, 6, 's@gmail.com', 'dsadsad', 'da83cb97dc9e711034b0edadb2d40c3c', NULL, '2020-11-28 15:58:05', NULL, '2020-11-28 15:58:05', 1, NULL, 0, NULL, NULL, NULL, 'UM6', 'english', 1, NULL, 0, 2, 2, 2, NULL, NULL, NULL, NULL, NULL),
(57, 4, 'info@arinoz.com', 'abc', '17ffcc954acd2f63794f539076659a01', NULL, '2020-11-28 15:58:47', NULL, '2020-11-28 15:58:47', 1, NULL, 0, NULL, NULL, NULL, 'UM6', 'english', 1, NULL, 0, 2, 2, 2, NULL, NULL, NULL, NULL, NULL),
(58, 4, 'h@gmail.com', 'sad', '7208618127f54b3d8321b8a093520c16', NULL, '2020-12-09 13:23:42', NULL, '2020-12-09 13:23:42', 1, 2, 0, NULL, NULL, NULL, 'UM6', 'english', 1, NULL, 0, 2, 2, 2, '2020-12-09 13:25:31', 2, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bf_users_extension`
--

CREATE TABLE `bf_users_extension` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) DEFAULT NULL,
  `extension` varchar(150) NOT NULL,
  `ip_address` varchar(150) DEFAULT NULL,
  `port` varchar(150) DEFAULT NULL,
  `path` varchar(150) DEFAULT NULL,
  `password` varchar(50) NOT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) NOT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bf_users_extension`
--

INSERT INTO `bf_users_extension` (`id`, `user_id`, `name`, `email`, `extension`, `ip_address`, `port`, `path`, `password`, `created_on`, `created_by`, `modified_on`, `modified_by`, `customer_id`, `deleted`, `deleted_by`) VALUES
(15, 41, 'sadsadasd', NULL, 'dsadsadsad', 'sadsad', 'asdsad', 'dasdas', 'sdsadsd', '2020-11-28 16:19:00', 2, NULL, NULL, 2, 0, NULL),
(16, 53, 'gfgfgf', NULL, 'tytyty', 'demo', 'yuyy', 'uuu', '1234', '2020-12-03 14:51:55', 2, NULL, NULL, 2, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bf_user_cookies`
--

CREATE TABLE `bf_user_cookies` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `token` varchar(128) NOT NULL,
  `created_on` datetime NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bf_user_designation_points`
--

CREATE TABLE `bf_user_designation_points` (
  `id` int(11) NOT NULL,
  `designation` varchar(250) DEFAULT NULL,
  `points` varchar(250) DEFAULT NULL,
  `customer_id` tinyint(4) NOT NULL,
  `created_by` tinyint(4) NOT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `modified_on` datetime DEFAULT NULL,
  `modified_by` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT 0,
  `deleted_by` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bf_user_designation_points`
--

INSERT INTO `bf_user_designation_points` (`id`, `designation`, `points`, `customer_id`, `created_by`, `created_on`, `modified_on`, `modified_by`, `deleted`, `deleted_by`) VALUES
(1, 'abc', '24', 2, 2, '2020-12-01 12:57:27', '2020-12-01 14:41:33', 2, 0, NULL),
(2, 'pqr', '25', 2, 2, '2020-12-01 12:58:37', NULL, NULL, 0, NULL),
(3, 'gdfg', 'gfdgfdg', 2, 2, '2020-12-09 13:12:37', '2020-12-09 13:13:44', 2, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bf_user_meta`
--

CREATE TABLE `bf_user_meta` (
  `meta_id` int(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) NOT NULL DEFAULT '',
  `meta_value` text DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bf_user_meta`
--

INSERT INTO `bf_user_meta` (`meta_id`, `user_id`, `meta_key`, `meta_value`, `deleted`, `deleted_by`, `created_on`, `created_by`, `modified_on`, `modified_by`, `customer_id`) VALUES
(1, 2, 'state', '', 0, NULL, '2020-09-17 01:13:04', NULL, NULL, NULL, NULL),
(2, 2, 'country', 'US', 0, NULL, '2020-09-17 01:13:04', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bf_user_role_permission`
--

CREATE TABLE `bf_user_role_permission` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `permission_id` int(11) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `extensions`
--

CREATE TABLE `extensions` (
  `id` bigint(20) NOT NULL,
  `context` varchar(40) NOT NULL,
  `exten` varchar(40) NOT NULL,
  `priority` int(11) NOT NULL,
  `app` varchar(40) NOT NULL,
  `appdata` varchar(256) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `iaxfriends`
--

CREATE TABLE `iaxfriends` (
  `id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `type` enum('friend','user','peer') DEFAULT NULL,
  `username` varchar(40) DEFAULT NULL,
  `mailbox` varchar(40) DEFAULT NULL,
  `secret` varchar(40) DEFAULT NULL,
  `dbsecret` varchar(40) DEFAULT NULL,
  `context` varchar(40) DEFAULT NULL,
  `regcontext` varchar(40) DEFAULT NULL,
  `host` varchar(40) DEFAULT NULL,
  `ipaddr` varchar(40) DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `defaultip` varchar(20) DEFAULT NULL,
  `sourceaddress` varchar(20) DEFAULT NULL,
  `mask` varchar(20) DEFAULT NULL,
  `regexten` varchar(40) DEFAULT NULL,
  `regseconds` int(11) DEFAULT NULL,
  `accountcode` varchar(80) DEFAULT NULL,
  `mohinterpret` varchar(20) DEFAULT NULL,
  `mohsuggest` varchar(20) DEFAULT NULL,
  `inkeys` varchar(40) DEFAULT NULL,
  `outkeys` varchar(40) DEFAULT NULL,
  `language` varchar(10) DEFAULT NULL,
  `callerid` varchar(100) DEFAULT NULL,
  `cid_number` varchar(40) DEFAULT NULL,
  `sendani` enum('yes','no') DEFAULT NULL,
  `fullname` varchar(40) DEFAULT NULL,
  `trunk` enum('yes','no') DEFAULT NULL,
  `auth` varchar(20) DEFAULT NULL,
  `maxauthreq` int(11) DEFAULT NULL,
  `requirecalltoken` enum('yes','no','auto') DEFAULT NULL,
  `encryption` enum('yes','no','aes128') DEFAULT NULL,
  `transfer` enum('yes','no','mediaonly') DEFAULT NULL,
  `jitterbuffer` enum('yes','no') DEFAULT NULL,
  `forcejitterbuffer` enum('yes','no') DEFAULT NULL,
  `disallow` varchar(200) DEFAULT NULL,
  `allow` varchar(200) DEFAULT NULL,
  `codecpriority` varchar(40) DEFAULT NULL,
  `qualify` varchar(10) DEFAULT NULL,
  `qualifysmoothing` enum('yes','no') DEFAULT NULL,
  `qualifyfreqok` varchar(10) DEFAULT NULL,
  `qualifyfreqnotok` varchar(10) DEFAULT NULL,
  `timezone` varchar(20) DEFAULT NULL,
  `adsi` enum('yes','no') DEFAULT NULL,
  `amaflags` varchar(20) DEFAULT NULL,
  `setvar` varchar(200) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `musiconhold`
--

CREATE TABLE `musiconhold` (
  `name` varchar(80) NOT NULL,
  `mode` enum('custom','files','mp3nb','quietmp3nb','quietmp3','playlist') DEFAULT NULL,
  `directory` varchar(255) DEFAULT NULL,
  `application` varchar(255) DEFAULT NULL,
  `digit` varchar(1) DEFAULT NULL,
  `sort` varchar(10) DEFAULT NULL,
  `format` varchar(10) DEFAULT NULL,
  `stamp` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `musiconhold_entry`
--

CREATE TABLE `musiconhold_entry` (
  `name` varchar(80) NOT NULL,
  `position` int(11) NOT NULL,
  `entry` varchar(1024) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin DEFAULT NULL,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

--
-- Dumping data for table `pma__navigationhiding`
--

INSERT INTO `pma__navigationhiding` (`username`, `item_name`, `item_type`, `db_name`, `table_name`) VALUES
('dev_bon9', 'bf_role_permissions', 'table', 'bon9', ''),
('dev_bon9', 'bf_users_extension', 'table', 'bon9', '');

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('dev_bon9', '[{\"db\":\"bon9\",\"table\":\"bf_quality_disposition\"},{\"db\":\"bon9\",\"table\":\"bf_leads\"},{\"db\":\"bon9\",\"table\":\"bf_prospects\"},{\"db\":\"bon9\",\"table\":\"bf_udc_salutation\"},{\"db\":\"bon9\",\"table\":\"bf_agent_sub_disposition\"},{\"db\":\"bon9\",\"table\":\"bf_state\"},{\"db\":\"bon9\",\"table\":\"bf_udc_employee_size\"},{\"db\":\"bon9\",\"table\":\"bf_udc_revenue\"},{\"db\":\"bon9\",\"table\":\"bf_udc_industry\"},{\"db\":\"bon9\",\"table\":\"bf_domains\"}]'),
('root', '[{\"db\":\"bon9\",\"table\":\"bf_user_designation_points\"},{\"db\":\"bon9\",\"table\":\"bf_campaign_user_allow_status\"},{\"db\":\"bon9\",\"table\":\"bf_campaign_user_group_access\"},{\"db\":\"bon9\",\"table\":\"bf_campaign_user\"},{\"db\":\"bon9\",\"table\":\"bf_campaign_user_group\"},{\"db\":\"bon9\",\"table\":\"bf_sale_client_details\"},{\"db\":\"bon9\",\"table\":\"bf_country\"},{\"db\":\"bon9\",\"table\":\"bf_client_rejection\"},{\"db\":\"bon9\",\"table\":\"bf_users\"},{\"db\":\"bon9\",\"table\":\"bf_permissions\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin DEFAULT NULL,
  `data_sql` longtext COLLATE utf8_bin DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('dev_bon9', '2020-12-09 11:27:20', '{\"Console\\/Mode\":\"collapse\",\"Console\\/Height\":-58.01360000000001,\"NavigationWidth\":246}'),
('root', '2020-11-23 10:57:52', '{\"Console\\/Mode\":\"collapse\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

-- --------------------------------------------------------

--
-- Table structure for table `ps_asterisk_publications`
--

CREATE TABLE `ps_asterisk_publications` (
  `id` varchar(40) NOT NULL,
  `devicestate_publish` varchar(40) DEFAULT NULL,
  `mailboxstate_publish` varchar(40) DEFAULT NULL,
  `device_state` enum('yes','no') DEFAULT NULL,
  `device_state_filter` varchar(256) DEFAULT NULL,
  `mailbox_state` enum('yes','no') DEFAULT NULL,
  `mailbox_state_filter` varchar(256) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ps_contacts`
--

CREATE TABLE `ps_contacts` (
  `id` varchar(255) DEFAULT NULL,
  `uri` varchar(511) DEFAULT NULL,
  `expiration_time` bigint(20) DEFAULT NULL,
  `qualify_frequency` int(11) DEFAULT NULL,
  `outbound_proxy` varchar(40) DEFAULT NULL,
  `path` text DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `qualify_timeout` float DEFAULT NULL,
  `reg_server` varchar(20) DEFAULT NULL,
  `authenticate_qualify` enum('yes','no') DEFAULT NULL,
  `via_addr` varchar(40) DEFAULT NULL,
  `via_port` int(11) DEFAULT NULL,
  `call_id` varchar(255) DEFAULT NULL,
  `endpoint` varchar(40) DEFAULT NULL,
  `prune_on_boot` enum('yes','no') DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ps_contacts`
--

INSERT INTO `ps_contacts` (`id`, `uri`, `expiration_time`, `qualify_frequency`, `outbound_proxy`, `path`, `user_agent`, `qualify_timeout`, `reg_server`, `authenticate_qualify`, `via_addr`, `via_port`, `call_id`, `endpoint`, `prune_on_boot`, `deleted`, `deleted_by`, `created_on`, `created_by`, `modified_on`, `modified_by`, `customer_id`) VALUES
('101^3B@a5f065b1c6b7175bf6fa703dce3b602a', 'sip:06tpvjbk@103.110.12.210:54327^3Btransport=ws', 1597781624, 120, '', '', 'Raspberry Phone (SipJS - 0.11.6)', 3, 'RaspberryPiPBX', 'no', '192.0.2.240', 0, 'qs0upc2cerpvrbpmu0nith', '101', 'yes', 0, NULL, '2020-09-17 01:13:10', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ps_domain_aliases`
--

CREATE TABLE `ps_domain_aliases` (
  `id` varchar(40) NOT NULL,
  `domain` varchar(80) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ps_endpoints`
--

CREATE TABLE `ps_endpoints` (
  `id` int(11) NOT NULL,
  `transport` varchar(40) DEFAULT NULL,
  `aors` varchar(200) DEFAULT NULL,
  `auth` varchar(40) DEFAULT NULL,
  `context` varchar(40) DEFAULT NULL,
  `disallow` varchar(200) DEFAULT NULL,
  `allow` varchar(200) DEFAULT NULL,
  `direct_media` enum('yes','no') DEFAULT NULL,
  `connected_line_method` enum('invite','reinvite','update') DEFAULT NULL,
  `direct_media_method` enum('invite','reinvite','update') DEFAULT NULL,
  `direct_media_glare_mitigation` enum('none','outgoing','incoming') DEFAULT NULL,
  `disable_direct_media_on_nat` enum('yes','no') DEFAULT NULL,
  `dtmf_mode` enum('rfc4733','inband','info','auto','auto_info') DEFAULT NULL,
  `external_media_address` varchar(40) DEFAULT NULL,
  `force_rport` enum('yes','no') DEFAULT NULL,
  `ice_support` enum('yes','no') DEFAULT NULL,
  `identify_by` varchar(80) DEFAULT NULL,
  `mailboxes` varchar(40) DEFAULT NULL,
  `moh_suggest` varchar(40) DEFAULT NULL,
  `outbound_auth` varchar(40) DEFAULT NULL,
  `outbound_proxy` varchar(40) DEFAULT NULL,
  `rewrite_contact` enum('yes','no') DEFAULT NULL,
  `rtp_ipv6` enum('yes','no') DEFAULT NULL,
  `rtp_symmetric` enum('yes','no') DEFAULT NULL,
  `send_diversion` enum('yes','no') DEFAULT NULL,
  `send_pai` enum('yes','no') DEFAULT NULL,
  `send_rpid` enum('yes','no') DEFAULT NULL,
  `timers_min_se` int(11) DEFAULT NULL,
  `timers` enum('forced','no','required','yes') DEFAULT NULL,
  `timers_sess_expires` int(11) DEFAULT NULL,
  `callerid` varchar(40) DEFAULT NULL,
  `callerid_privacy` enum('allowed_not_screened','allowed_passed_screened','allowed_failed_screened','allowed','prohib_not_screened','prohib_passed_screened','prohib_failed_screened','prohib','unavailable') DEFAULT NULL,
  `callerid_tag` varchar(40) DEFAULT NULL,
  `100rel` enum('no','required','yes') DEFAULT NULL,
  `aggregate_mwi` enum('yes','no') DEFAULT NULL,
  `trust_id_inbound` enum('yes','no') DEFAULT NULL,
  `trust_id_outbound` enum('yes','no') DEFAULT NULL,
  `use_ptime` enum('yes','no') DEFAULT NULL,
  `use_avpf` enum('yes','no') DEFAULT NULL,
  `media_encryption` enum('no','sdes','dtls') DEFAULT NULL,
  `inband_progress` enum('yes','no') DEFAULT NULL,
  `call_group` varchar(40) DEFAULT NULL,
  `pickup_group` varchar(40) DEFAULT NULL,
  `named_call_group` varchar(40) DEFAULT NULL,
  `named_pickup_group` varchar(40) DEFAULT NULL,
  `device_state_busy_at` int(11) DEFAULT NULL,
  `fax_detect` enum('yes','no') DEFAULT NULL,
  `t38_udptl` enum('yes','no') DEFAULT NULL,
  `t38_udptl_ec` enum('none','fec','redundancy') DEFAULT NULL,
  `t38_udptl_maxdatagram` int(11) DEFAULT NULL,
  `t38_udptl_nat` enum('yes','no') DEFAULT NULL,
  `t38_udptl_ipv6` enum('yes','no') DEFAULT NULL,
  `tone_zone` varchar(40) DEFAULT NULL,
  `language` varchar(40) DEFAULT NULL,
  `one_touch_recording` enum('yes','no') DEFAULT NULL,
  `record_on_feature` varchar(40) DEFAULT NULL,
  `record_off_feature` varchar(40) DEFAULT NULL,
  `rtp_engine` varchar(40) DEFAULT NULL,
  `allow_transfer` enum('yes','no') DEFAULT NULL,
  `allow_subscribe` enum('yes','no') DEFAULT NULL,
  `sdp_owner` varchar(40) DEFAULT NULL,
  `sdp_session` varchar(40) DEFAULT NULL,
  `tos_audio` varchar(10) DEFAULT NULL,
  `tos_video` varchar(10) DEFAULT NULL,
  `sub_min_expiry` int(11) DEFAULT NULL,
  `from_domain` varchar(40) DEFAULT NULL,
  `from_user` varchar(40) DEFAULT NULL,
  `mwi_from_user` varchar(40) DEFAULT NULL,
  `dtls_verify` varchar(40) DEFAULT NULL,
  `dtls_rekey` varchar(40) DEFAULT NULL,
  `dtls_cert_file` varchar(200) DEFAULT NULL,
  `dtls_private_key` varchar(200) DEFAULT NULL,
  `dtls_cipher` varchar(200) DEFAULT NULL,
  `dtls_ca_file` varchar(200) DEFAULT NULL,
  `dtls_ca_path` varchar(200) DEFAULT NULL,
  `dtls_setup` enum('active','passive','actpass') DEFAULT NULL,
  `srtp_tag_32` enum('yes','no') DEFAULT NULL,
  `media_address` varchar(40) DEFAULT NULL,
  `redirect_method` enum('user','uri_core','uri_pjsip') DEFAULT NULL,
  `set_var` text DEFAULT NULL,
  `cos_audio` int(11) DEFAULT NULL,
  `cos_video` int(11) DEFAULT NULL,
  `message_context` varchar(40) DEFAULT NULL,
  `force_avp` enum('yes','no') DEFAULT NULL,
  `media_use_received_transport` enum('yes','no') DEFAULT NULL,
  `accountcode` varchar(80) DEFAULT NULL,
  `user_eq_phone` enum('yes','no') DEFAULT NULL,
  `moh_passthrough` enum('yes','no') DEFAULT NULL,
  `media_encryption_optimistic` enum('yes','no') DEFAULT NULL,
  `rpid_immediate` enum('yes','no') DEFAULT NULL,
  `g726_non_standard` enum('yes','no') DEFAULT NULL,
  `rtp_keepalive` int(11) DEFAULT NULL,
  `rtp_timeout` int(11) DEFAULT NULL,
  `rtp_timeout_hold` int(11) DEFAULT NULL,
  `bind_rtp_to_media_address` enum('yes','no') DEFAULT NULL,
  `voicemail_extension` varchar(40) DEFAULT NULL,
  `mwi_subscribe_replaces_unsolicited` enum('0','1','off','on','false','true','no','yes') DEFAULT NULL,
  `deny` varchar(95) DEFAULT NULL,
  `permit` varchar(95) DEFAULT NULL,
  `acl` varchar(40) DEFAULT NULL,
  `contact_deny` varchar(95) DEFAULT NULL,
  `contact_permit` varchar(95) DEFAULT NULL,
  `contact_acl` varchar(40) DEFAULT NULL,
  `subscribe_context` varchar(40) DEFAULT NULL,
  `fax_detect_timeout` int(11) DEFAULT NULL,
  `contact_user` varchar(80) DEFAULT NULL,
  `preferred_codec_only` enum('yes','no') DEFAULT NULL,
  `asymmetric_rtp_codec` enum('yes','no') DEFAULT NULL,
  `rtcp_mux` enum('yes','no') DEFAULT NULL,
  `allow_overlap` enum('yes','no') DEFAULT NULL,
  `refer_blind_progress` enum('yes','no') DEFAULT NULL,
  `notify_early_inuse_ringing` enum('yes','no') DEFAULT NULL,
  `max_audio_streams` int(11) DEFAULT NULL,
  `max_video_streams` int(11) DEFAULT NULL,
  `webrtc` enum('yes','no') DEFAULT NULL,
  `dtls_fingerprint` enum('SHA-1','SHA-256') DEFAULT NULL,
  `incoming_mwi_mailbox` varchar(40) DEFAULT NULL,
  `bundle` enum('yes','no') DEFAULT NULL,
  `dtls_auto_generate_cert` enum('yes','no') DEFAULT NULL,
  `follow_early_media_fork` enum('yes','no') DEFAULT NULL,
  `accept_multiple_sdp_answers` enum('yes','no') DEFAULT NULL,
  `suppress_q850_reason_headers` enum('yes','no') DEFAULT NULL,
  `trust_connected_line` enum('0','1','off','on','false','true','no','yes') DEFAULT NULL,
  `send_connected_line` enum('0','1','off','on','false','true','no','yes') DEFAULT NULL,
  `ignore_183_without_sdp` enum('0','1','off','on','false','true','no','yes') DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ps_endpoints`
--

INSERT INTO `ps_endpoints` (`id`, `transport`, `aors`, `auth`, `context`, `disallow`, `allow`, `direct_media`, `connected_line_method`, `direct_media_method`, `direct_media_glare_mitigation`, `disable_direct_media_on_nat`, `dtmf_mode`, `external_media_address`, `force_rport`, `ice_support`, `identify_by`, `mailboxes`, `moh_suggest`, `outbound_auth`, `outbound_proxy`, `rewrite_contact`, `rtp_ipv6`, `rtp_symmetric`, `send_diversion`, `send_pai`, `send_rpid`, `timers_min_se`, `timers`, `timers_sess_expires`, `callerid`, `callerid_privacy`, `callerid_tag`, `100rel`, `aggregate_mwi`, `trust_id_inbound`, `trust_id_outbound`, `use_ptime`, `use_avpf`, `media_encryption`, `inband_progress`, `call_group`, `pickup_group`, `named_call_group`, `named_pickup_group`, `device_state_busy_at`, `fax_detect`, `t38_udptl`, `t38_udptl_ec`, `t38_udptl_maxdatagram`, `t38_udptl_nat`, `t38_udptl_ipv6`, `tone_zone`, `language`, `one_touch_recording`, `record_on_feature`, `record_off_feature`, `rtp_engine`, `allow_transfer`, `allow_subscribe`, `sdp_owner`, `sdp_session`, `tos_audio`, `tos_video`, `sub_min_expiry`, `from_domain`, `from_user`, `mwi_from_user`, `dtls_verify`, `dtls_rekey`, `dtls_cert_file`, `dtls_private_key`, `dtls_cipher`, `dtls_ca_file`, `dtls_ca_path`, `dtls_setup`, `srtp_tag_32`, `media_address`, `redirect_method`, `set_var`, `cos_audio`, `cos_video`, `message_context`, `force_avp`, `media_use_received_transport`, `accountcode`, `user_eq_phone`, `moh_passthrough`, `media_encryption_optimistic`, `rpid_immediate`, `g726_non_standard`, `rtp_keepalive`, `rtp_timeout`, `rtp_timeout_hold`, `bind_rtp_to_media_address`, `voicemail_extension`, `mwi_subscribe_replaces_unsolicited`, `deny`, `permit`, `acl`, `contact_deny`, `contact_permit`, `contact_acl`, `subscribe_context`, `fax_detect_timeout`, `contact_user`, `preferred_codec_only`, `asymmetric_rtp_codec`, `rtcp_mux`, `allow_overlap`, `refer_blind_progress`, `notify_early_inuse_ringing`, `max_audio_streams`, `max_video_streams`, `webrtc`, `dtls_fingerprint`, `incoming_mwi_mailbox`, `bundle`, `dtls_auto_generate_cert`, `follow_early_media_fork`, `accept_multiple_sdp_answers`, `suppress_q850_reason_headers`, `trust_connected_line`, `send_connected_line`, `ignore_183_without_sdp`, `deleted`, `deleted_by`, `created_on`, `created_by`, `modified_on`, `modified_by`, `customer_id`) VALUES
(1, 'wss_transport', '101', '101', 'from-extensions', 'all', 'alaw,g722', 'no', NULL, NULL, NULL, NULL, 'auto', NULL, NULL, 'yes', NULL, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yes', 'dtls', 'no', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yes', 'yes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'fingerprint', NULL, '/etc/letsencrypt/live/linkedinextract.in/cert.pem', '/etc/letsencrypt/live/linkedinextract.in/privkey.pem', NULL, '/etc/letsencrypt/live/linkedinextract.in/fullchain.pem', NULL, 'actpass', NULL, NULL, NULL, NULL, NULL, NULL, 'ext-messaging', 'no', 'yes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 120, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 'subscriptions', NULL, NULL, NULL, NULL, 'yes', NULL, NULL, NULL, NULL, NULL, 'yes', 'SHA-1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2020-09-17 01:13:12', NULL, NULL, NULL, NULL),
(2, 'wss_transport', '102', '102', 'from-extensions', 'all', 'alaw,g722', 'no', NULL, NULL, NULL, NULL, 'auto', NULL, NULL, 'yes', NULL, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yes', 'dtls', 'no', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yes', 'yes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'fingerprint', NULL, '/etc/letsencrypt/live/linkedinextract.in/cert.pem', '/etc/letsencrypt/live/linkedinextract.in/privkey.pem', NULL, '/etc/letsencrypt/live/linkedinextract.in/fullchain.pem', NULL, 'actpass', NULL, NULL, NULL, NULL, NULL, NULL, 'ext-messaging', 'no', 'yes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 120, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 'subscriptions', NULL, NULL, NULL, NULL, 'yes', NULL, NULL, NULL, NULL, NULL, 'yes', 'SHA-1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2020-09-17 01:13:12', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ps_endpoint_id_ips`
--

CREATE TABLE `ps_endpoint_id_ips` (
  `id` varchar(40) NOT NULL,
  `endpoint` varchar(40) DEFAULT NULL,
  `match` varchar(80) DEFAULT NULL,
  `srv_lookups` enum('yes','no') DEFAULT NULL,
  `match_header` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ps_globals`
--

CREATE TABLE `ps_globals` (
  `id` varchar(40) NOT NULL,
  `max_forwards` int(11) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `default_outbound_endpoint` varchar(40) DEFAULT NULL,
  `debug` varchar(40) DEFAULT NULL,
  `endpoint_identifier_order` varchar(40) DEFAULT NULL,
  `max_initial_qualify_time` int(11) DEFAULT NULL,
  `default_from_user` varchar(80) DEFAULT NULL,
  `keep_alive_interval` int(11) DEFAULT NULL,
  `regcontext` varchar(80) DEFAULT NULL,
  `contact_expiration_check_interval` int(11) DEFAULT NULL,
  `default_voicemail_extension` varchar(40) DEFAULT NULL,
  `disable_multi_domain` enum('yes','no') DEFAULT NULL,
  `unidentified_request_count` int(11) DEFAULT NULL,
  `unidentified_request_period` int(11) DEFAULT NULL,
  `unidentified_request_prune_interval` int(11) DEFAULT NULL,
  `default_realm` varchar(40) DEFAULT NULL,
  `mwi_tps_queue_high` int(11) DEFAULT NULL,
  `mwi_tps_queue_low` int(11) DEFAULT NULL,
  `mwi_disable_initial_unsolicited` enum('yes','no') DEFAULT NULL,
  `ignore_uri_user_options` enum('yes','no') DEFAULT NULL,
  `use_callerid_contact` enum('0','1','off','on','false','true','no','yes') DEFAULT NULL,
  `send_contact_status_on_update_registration` enum('0','1','off','on','false','true','no','yes') DEFAULT NULL,
  `taskprocessor_overload_trigger` enum('none','global','pjsip_only') DEFAULT NULL,
  `norefersub` enum('0','1','off','on','false','true','no','yes') DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ps_inbound_publications`
--

CREATE TABLE `ps_inbound_publications` (
  `id` varchar(40) NOT NULL,
  `endpoint` varchar(40) DEFAULT NULL,
  `event_asterisk-devicestate` varchar(40) DEFAULT NULL,
  `event_asterisk-mwi` varchar(40) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ps_outbound_publishes`
--

CREATE TABLE `ps_outbound_publishes` (
  `id` varchar(40) NOT NULL,
  `expiration` int(11) DEFAULT NULL,
  `outbound_auth` varchar(40) DEFAULT NULL,
  `outbound_proxy` varchar(256) DEFAULT NULL,
  `server_uri` varchar(256) DEFAULT NULL,
  `from_uri` varchar(256) DEFAULT NULL,
  `to_uri` varchar(256) DEFAULT NULL,
  `event` varchar(40) DEFAULT NULL,
  `max_auth_attempts` int(11) DEFAULT NULL,
  `transport` varchar(40) DEFAULT NULL,
  `multi_user` enum('yes','no') DEFAULT NULL,
  `@body` varchar(40) DEFAULT NULL,
  `@context` varchar(256) DEFAULT NULL,
  `@exten` varchar(256) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ps_registrations`
--

CREATE TABLE `ps_registrations` (
  `id` varchar(40) NOT NULL,
  `auth_rejection_permanent` enum('yes','no') DEFAULT NULL,
  `client_uri` varchar(255) DEFAULT NULL,
  `contact_user` varchar(40) DEFAULT NULL,
  `expiration` int(11) DEFAULT NULL,
  `max_retries` int(11) DEFAULT NULL,
  `outbound_auth` varchar(40) DEFAULT NULL,
  `outbound_proxy` varchar(40) DEFAULT NULL,
  `retry_interval` int(11) DEFAULT NULL,
  `forbidden_retry_interval` int(11) DEFAULT NULL,
  `server_uri` varchar(255) DEFAULT NULL,
  `transport` varchar(40) DEFAULT NULL,
  `support_path` enum('yes','no') DEFAULT NULL,
  `fatal_retry_interval` int(11) DEFAULT NULL,
  `line` enum('yes','no') DEFAULT NULL,
  `endpoint` varchar(40) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ps_resource_list`
--

CREATE TABLE `ps_resource_list` (
  `id` varchar(40) NOT NULL,
  `list_item` varchar(2048) DEFAULT NULL,
  `event` varchar(40) DEFAULT NULL,
  `full_state` enum('yes','no') DEFAULT NULL,
  `notification_batch_interval` int(11) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ps_subscription_persistence`
--

CREATE TABLE `ps_subscription_persistence` (
  `id` varchar(40) NOT NULL,
  `packet` varchar(2048) DEFAULT NULL,
  `src_name` varchar(128) DEFAULT NULL,
  `src_port` int(11) DEFAULT NULL,
  `transport_key` varchar(64) DEFAULT NULL,
  `local_name` varchar(128) DEFAULT NULL,
  `local_port` int(11) DEFAULT NULL,
  `cseq` int(11) DEFAULT NULL,
  `tag` varchar(128) DEFAULT NULL,
  `endpoint` varchar(40) DEFAULT NULL,
  `expires` int(11) DEFAULT NULL,
  `contact_uri` varchar(256) DEFAULT NULL,
  `prune_on_boot` enum('yes','no') DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ps_systems`
--

CREATE TABLE `ps_systems` (
  `id` varchar(40) NOT NULL,
  `timer_t1` int(11) DEFAULT NULL,
  `timer_b` int(11) DEFAULT NULL,
  `compact_headers` enum('yes','no') DEFAULT NULL,
  `threadpool_initial_size` int(11) DEFAULT NULL,
  `threadpool_auto_increment` int(11) DEFAULT NULL,
  `threadpool_idle_timeout` int(11) DEFAULT NULL,
  `threadpool_max_size` int(11) DEFAULT NULL,
  `disable_tcp_switch` enum('yes','no') DEFAULT NULL,
  `follow_early_media_fork` enum('yes','no') DEFAULT NULL,
  `accept_multiple_sdp_answers` enum('yes','no') DEFAULT NULL,
  `disable_rport` enum('0','1','off','on','false','true','no','yes') DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ps_transports`
--

CREATE TABLE `ps_transports` (
  `id` varchar(40) NOT NULL,
  `async_operations` int(11) DEFAULT NULL,
  `bind` varchar(40) DEFAULT NULL,
  `ca_list_file` varchar(200) DEFAULT NULL,
  `cert_file` varchar(200) DEFAULT NULL,
  `cipher` varchar(200) DEFAULT NULL,
  `domain` varchar(40) DEFAULT NULL,
  `external_media_address` varchar(40) DEFAULT NULL,
  `external_signaling_address` varchar(40) DEFAULT NULL,
  `external_signaling_port` int(11) DEFAULT NULL,
  `method` enum('default','unspecified','tlsv1','sslv2','sslv3','sslv23') DEFAULT NULL,
  `local_net` varchar(40) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL,
  `priv_key_file` varchar(200) DEFAULT NULL,
  `protocol` enum('udp','tcp','tls','ws','wss') DEFAULT NULL,
  `require_client_cert` enum('yes','no') DEFAULT NULL,
  `verify_client` enum('yes','no') DEFAULT NULL,
  `verify_server` enum('yes','no') DEFAULT NULL,
  `tos` varchar(10) DEFAULT NULL,
  `cos` int(11) DEFAULT NULL,
  `allow_reload` enum('yes','no') DEFAULT NULL,
  `symmetric_transport` enum('yes','no') DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `queues`
--

CREATE TABLE `queues` (
  `name` varchar(128) NOT NULL,
  `musiconhold` varchar(128) DEFAULT NULL,
  `announce` varchar(128) DEFAULT NULL,
  `context` varchar(128) DEFAULT NULL,
  `timeout` int(11) DEFAULT NULL,
  `ringinuse` enum('yes','no') DEFAULT NULL,
  `setinterfacevar` enum('yes','no') DEFAULT NULL,
  `setqueuevar` enum('yes','no') DEFAULT NULL,
  `setqueueentryvar` enum('yes','no') DEFAULT NULL,
  `monitor_format` varchar(8) DEFAULT NULL,
  `membermacro` varchar(512) DEFAULT NULL,
  `membergosub` varchar(512) DEFAULT NULL,
  `queue_youarenext` varchar(128) DEFAULT NULL,
  `queue_thereare` varchar(128) DEFAULT NULL,
  `queue_callswaiting` varchar(128) DEFAULT NULL,
  `queue_quantity1` varchar(128) DEFAULT NULL,
  `queue_quantity2` varchar(128) DEFAULT NULL,
  `queue_holdtime` varchar(128) DEFAULT NULL,
  `queue_minutes` varchar(128) DEFAULT NULL,
  `queue_minute` varchar(128) DEFAULT NULL,
  `queue_seconds` varchar(128) DEFAULT NULL,
  `queue_thankyou` varchar(128) DEFAULT NULL,
  `queue_callerannounce` varchar(128) DEFAULT NULL,
  `queue_reporthold` varchar(128) DEFAULT NULL,
  `announce_frequency` int(11) DEFAULT NULL,
  `announce_to_first_user` enum('yes','no') DEFAULT NULL,
  `min_announce_frequency` int(11) DEFAULT NULL,
  `announce_round_seconds` int(11) DEFAULT NULL,
  `announce_holdtime` varchar(128) DEFAULT NULL,
  `announce_position` varchar(128) DEFAULT NULL,
  `announce_position_limit` int(11) DEFAULT NULL,
  `periodic_announce` varchar(50) DEFAULT NULL,
  `periodic_announce_frequency` int(11) DEFAULT NULL,
  `relative_periodic_announce` enum('yes','no') DEFAULT NULL,
  `random_periodic_announce` enum('yes','no') DEFAULT NULL,
  `retry` int(11) DEFAULT NULL,
  `wrapuptime` int(11) DEFAULT NULL,
  `penaltymemberslimit` int(11) DEFAULT NULL,
  `autofill` enum('yes','no') DEFAULT NULL,
  `monitor_type` varchar(128) DEFAULT NULL,
  `autopause` enum('yes','no','all') DEFAULT NULL,
  `autopausedelay` int(11) DEFAULT NULL,
  `autopausebusy` enum('yes','no') DEFAULT NULL,
  `autopauseunavail` enum('yes','no') DEFAULT NULL,
  `maxlen` int(11) DEFAULT NULL,
  `servicelevel` int(11) DEFAULT NULL,
  `strategy` enum('ringall','leastrecent','fewestcalls','random','rrmemory','linear','wrandom','rrordered') DEFAULT NULL,
  `joinempty` varchar(128) DEFAULT NULL,
  `leavewhenempty` varchar(128) DEFAULT NULL,
  `reportholdtime` enum('yes','no') DEFAULT NULL,
  `memberdelay` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `timeoutrestart` enum('yes','no') DEFAULT NULL,
  `defaultrule` varchar(128) DEFAULT NULL,
  `timeoutpriority` varchar(128) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `queue_members`
--

CREATE TABLE `queue_members` (
  `queue_name` varchar(80) NOT NULL,
  `interface` varchar(80) NOT NULL,
  `membername` varchar(80) DEFAULT NULL,
  `state_interface` varchar(80) DEFAULT NULL,
  `penalty` int(11) DEFAULT NULL,
  `paused` int(11) DEFAULT NULL,
  `uniqueid` int(11) NOT NULL,
  `wrapuptime` int(11) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `queue_rules`
--

CREATE TABLE `queue_rules` (
  `rule_name` varchar(80) NOT NULL,
  `time` varchar(32) NOT NULL,
  `min_penalty` varchar(32) NOT NULL,
  `max_penalty` varchar(32) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sippeers`
--

CREATE TABLE `sippeers` (
  `id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `ipaddr` varchar(45) DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `regseconds` int(11) DEFAULT NULL,
  `defaultuser` varchar(40) DEFAULT NULL,
  `fullcontact` varchar(80) DEFAULT NULL,
  `regserver` varchar(20) DEFAULT NULL,
  `useragent` varchar(255) DEFAULT NULL,
  `lastms` int(11) DEFAULT NULL,
  `host` varchar(40) DEFAULT NULL,
  `type` enum('friend','user','peer') DEFAULT NULL,
  `context` varchar(40) DEFAULT NULL,
  `permit` varchar(95) DEFAULT NULL,
  `deny` varchar(95) DEFAULT NULL,
  `secret` varchar(40) DEFAULT NULL,
  `md5secret` varchar(40) DEFAULT NULL,
  `remotesecret` varchar(40) DEFAULT NULL,
  `transport` enum('udp','tcp','tls','ws','wss','udp,tcp','tcp,udp') DEFAULT NULL,
  `dtmfmode` enum('rfc2833','info','shortinfo','inband','auto') DEFAULT NULL,
  `directmedia` enum('yes','no','nonat','update','outgoing') DEFAULT NULL,
  `nat` varchar(29) DEFAULT NULL,
  `callgroup` varchar(40) DEFAULT NULL,
  `pickupgroup` varchar(40) DEFAULT NULL,
  `language` varchar(40) DEFAULT NULL,
  `disallow` varchar(200) DEFAULT NULL,
  `allow` varchar(200) DEFAULT NULL,
  `insecure` varchar(40) DEFAULT NULL,
  `trustrpid` enum('yes','no') DEFAULT NULL,
  `progressinband` enum('yes','no','never') DEFAULT NULL,
  `promiscredir` enum('yes','no') DEFAULT NULL,
  `useclientcode` enum('yes','no') DEFAULT NULL,
  `accountcode` varchar(80) DEFAULT NULL,
  `setvar` varchar(200) DEFAULT NULL,
  `callerid` varchar(40) DEFAULT NULL,
  `amaflags` varchar(40) DEFAULT NULL,
  `callcounter` enum('yes','no') DEFAULT NULL,
  `busylevel` int(11) DEFAULT NULL,
  `allowoverlap` enum('yes','no') DEFAULT NULL,
  `allowsubscribe` enum('yes','no') DEFAULT NULL,
  `videosupport` enum('yes','no') DEFAULT NULL,
  `maxcallbitrate` int(11) DEFAULT NULL,
  `rfc2833compensate` enum('yes','no') DEFAULT NULL,
  `mailbox` varchar(40) DEFAULT NULL,
  `session-timers` enum('accept','refuse','originate') DEFAULT NULL,
  `session-expires` int(11) DEFAULT NULL,
  `session-minse` int(11) DEFAULT NULL,
  `session-refresher` enum('uac','uas') DEFAULT NULL,
  `t38pt_usertpsource` varchar(40) DEFAULT NULL,
  `regexten` varchar(40) DEFAULT NULL,
  `fromdomain` varchar(40) DEFAULT NULL,
  `fromuser` varchar(40) DEFAULT NULL,
  `qualify` varchar(40) DEFAULT NULL,
  `defaultip` varchar(45) DEFAULT NULL,
  `rtptimeout` int(11) DEFAULT NULL,
  `rtpholdtimeout` int(11) DEFAULT NULL,
  `sendrpid` enum('yes','no') DEFAULT NULL,
  `outboundproxy` varchar(40) DEFAULT NULL,
  `callbackextension` varchar(40) DEFAULT NULL,
  `timert1` int(11) DEFAULT NULL,
  `timerb` int(11) DEFAULT NULL,
  `qualifyfreq` int(11) DEFAULT NULL,
  `constantssrc` enum('yes','no') DEFAULT NULL,
  `contactpermit` varchar(95) DEFAULT NULL,
  `contactdeny` varchar(95) DEFAULT NULL,
  `usereqphone` enum('yes','no') DEFAULT NULL,
  `textsupport` enum('yes','no') DEFAULT NULL,
  `faxdetect` enum('yes','no') DEFAULT NULL,
  `buggymwi` enum('yes','no') DEFAULT NULL,
  `auth` varchar(40) DEFAULT NULL,
  `fullname` varchar(40) DEFAULT NULL,
  `trunkname` varchar(40) DEFAULT NULL,
  `cid_number` varchar(40) DEFAULT NULL,
  `callingpres` enum('allowed_not_screened','allowed_passed_screen','allowed_failed_screen','allowed','prohib_not_screened','prohib_passed_screen','prohib_failed_screen','prohib') DEFAULT NULL,
  `mohinterpret` varchar(40) DEFAULT NULL,
  `mohsuggest` varchar(40) DEFAULT NULL,
  `parkinglot` varchar(40) DEFAULT NULL,
  `hasvoicemail` enum('yes','no') DEFAULT NULL,
  `subscribemwi` enum('yes','no') DEFAULT NULL,
  `vmexten` varchar(40) DEFAULT NULL,
  `autoframing` enum('yes','no') DEFAULT NULL,
  `rtpkeepalive` int(11) DEFAULT NULL,
  `call-limit` int(11) DEFAULT NULL,
  `g726nonstandard` enum('yes','no') DEFAULT NULL,
  `ignoresdpversion` enum('yes','no') DEFAULT NULL,
  `allowtransfer` enum('yes','no') DEFAULT NULL,
  `dynamic` enum('yes','no') DEFAULT NULL,
  `path` varchar(256) DEFAULT NULL,
  `supportpath` enum('yes','no') DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_user_credit_plans`
-- (See below for the actual view)
--
CREATE TABLE `view_user_credit_plans` (
`id` int(11)
,`prospect_count` bigint(20)
,`start_date` date
,`end_date` date
,`credit_remaining` bigint(20)
,`credit` bigint(20)
,`user_id` bigint(20)
,`plan_name` varchar(255)
);

-- --------------------------------------------------------

--
-- Table structure for table `voicemail`
--

CREATE TABLE `voicemail` (
  `uniqueid` int(11) NOT NULL,
  `context` varchar(80) NOT NULL,
  `mailbox` varchar(80) NOT NULL,
  `password` varchar(80) NOT NULL,
  `fullname` varchar(80) DEFAULT NULL,
  `alias` varchar(80) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `pager` varchar(80) DEFAULT NULL,
  `attach` enum('yes','no') DEFAULT NULL,
  `attachfmt` varchar(10) DEFAULT NULL,
  `serveremail` varchar(80) DEFAULT NULL,
  `language` varchar(20) DEFAULT NULL,
  `tz` varchar(30) DEFAULT NULL,
  `deletevoicemail` enum('yes','no') DEFAULT NULL,
  `saycid` enum('yes','no') DEFAULT NULL,
  `sendvoicemail` enum('yes','no') DEFAULT NULL,
  `review` enum('yes','no') DEFAULT NULL,
  `tempgreetwarn` enum('yes','no') DEFAULT NULL,
  `operator` enum('yes','no') DEFAULT NULL,
  `envelope` enum('yes','no') DEFAULT NULL,
  `sayduration` int(11) DEFAULT NULL,
  `forcename` enum('yes','no') DEFAULT NULL,
  `forcegreetings` enum('yes','no') DEFAULT NULL,
  `callback` varchar(80) DEFAULT NULL,
  `dialout` varchar(80) DEFAULT NULL,
  `exitcontext` varchar(80) DEFAULT NULL,
  `maxmsg` int(11) DEFAULT NULL,
  `volgain` decimal(5,2) DEFAULT NULL,
  `imapuser` varchar(80) DEFAULT NULL,
  `imappassword` varchar(80) DEFAULT NULL,
  `imapserver` varchar(80) DEFAULT NULL,
  `imapport` varchar(8) DEFAULT NULL,
  `imapflags` varchar(80) DEFAULT NULL,
  `stamp` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure for view `view_user_credit_plans`
--
DROP TABLE IF EXISTS `view_user_credit_plans`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_user_credit_plans`  AS  select `su`.`id` AS `id`,`sp`.`prospect_count` AS `prospect_count`,`su`.`start_date` AS `start_date`,`su`.`end_date` AS `end_date`,`su`.`credit_remaining` AS `credit_remaining`,`su`.`credit` AS `credit`,`su`.`user_id` AS `user_id`,`sp`.`plan_name` AS `plan_name` from (`bf_subscribed_users` `su` left join `bf_subscription_plans` `sp` on(`su`.`plan_id` = `sp`.`id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alembic_version_config`
--
ALTER TABLE `alembic_version_config`
  ADD PRIMARY KEY (`version_num`);

--
-- Indexes for table `bf_activities`
--
ALTER TABLE `bf_activities`
  ADD PRIMARY KEY (`activity_id`);

--
-- Indexes for table `bf_agent_disposition`
--
ALTER TABLE `bf_agent_disposition`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bf_agent_sub_disposition`
--
ALTER TABLE `bf_agent_sub_disposition`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bf_assets`
--
ALTER TABLE `bf_assets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bf_asset_datafiles`
--
ALTER TABLE `bf_asset_datafiles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bf_asset_prospects`
--
ALTER TABLE `bf_asset_prospects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bf_campaigns`
--
ALTER TABLE `bf_campaigns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bf_campaign_country`
--
ALTER TABLE `bf_campaign_country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bf_campaign_employee`
--
ALTER TABLE `bf_campaign_employee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bf_campaign_external_supp`
--
ALTER TABLE `bf_campaign_external_supp`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `bf_campaign_grade`
--
ALTER TABLE `bf_campaign_grade`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bf_campaign_industry`
--
ALTER TABLE `bf_campaign_industry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bf_campaign_jobfunction`
--
ALTER TABLE `bf_campaign_jobfunction`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bf_campaign_joblevel`
--
ALTER TABLE `bf_campaign_joblevel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bf_campaign_nic`
--
ALTER TABLE `bf_campaign_nic`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `bf_campaign_pacing`
--
ALTER TABLE `bf_campaign_pacing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bf_campaign_reasons`
--
ALTER TABLE `bf_campaign_reasons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bf_campaign_revenue`
--
ALTER TABLE `bf_campaign_revenue`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bf_campaign_sic`
--
ALTER TABLE `bf_campaign_sic`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `bf_campaign_technology`
--
ALTER TABLE `bf_campaign_technology`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bf_campaign_type`
--
ALTER TABLE `bf_campaign_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bf_campaign_user`
--
ALTER TABLE `bf_campaign_user`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `bf_campaign_user_allow_status`
--
ALTER TABLE `bf_campaign_user_allow_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bf_campaign_user_group`
--
ALTER TABLE `bf_campaign_user_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bf_campaign_user_group_access`
--
ALTER TABLE `bf_campaign_user_group_access`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `bf_ci3_sessions`
--
ALTER TABLE `bf_ci3_sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bf_client_rejection`
--
ALTER TABLE `bf_client_rejection`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bf_companies`
--
ALTER TABLE `bf_companies`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `bf_country`
--
ALTER TABLE `bf_country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bf_customers`
--
ALTER TABLE `bf_customers`
  ADD PRIMARY KEY (`Customer_id`);

--
-- Indexes for table `bf_dnc`
--
ALTER TABLE `bf_dnc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bf_dnc_type`
--
ALTER TABLE `bf_dnc_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bf_domains`
--
ALTER TABLE `bf_domains`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bf_email_logs`
--
ALTER TABLE `bf_email_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bf_email_queue`
--
ALTER TABLE `bf_email_queue`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bf_endpoints_template`
--
ALTER TABLE `bf_endpoints_template`
  ADD PRIMARY KEY (`context`);

--
-- Indexes for table `bf_extension`
--
ALTER TABLE `bf_extension`
  ADD PRIMARY KEY (`ext_id`);

--
-- Indexes for table `bf_file_upload`
--
ALTER TABLE `bf_file_upload`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bf_form_data`
--
ALTER TABLE `bf_form_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bf_form_inputs`
--
ALTER TABLE `bf_form_inputs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bf_form_input_types`
--
ALTER TABLE `bf_form_input_types`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `bf_kanban_boards`
--
ALTER TABLE `bf_kanban_boards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bf_leads`
--
ALTER TABLE `bf_leads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bf_login_attempts`
--
ALTER TABLE `bf_login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bf_meetme`
--
ALTER TABLE `bf_meetme`
  ADD PRIMARY KEY (`bookid`),
  ADD KEY `meetme_confno_start_end` (`confno`,`starttime`,`endtime`);

--
-- Indexes for table `bf_menu`
--
ALTER TABLE `bf_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bf_notification`
--
ALTER TABLE `bf_notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bf_permissions`
--
ALTER TABLE `bf_permissions`
  ADD PRIMARY KEY (`permission_id`);

--
-- Indexes for table `bf_prospects`
--
ALTER TABLE `bf_prospects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bf_ps_aors`
--
ALTER TABLE `bf_ps_aors`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `ps_aors_id` (`id`),
  ADD KEY `ps_aors_qualifyfreq_contact` (`qualify_frequency`,`contact`);

--
-- Indexes for table `bf_ps_auths`
--
ALTER TABLE `bf_ps_auths`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `ps_auths_id` (`id`);

--
-- Indexes for table `bf_ps_endpoints_template`
--
ALTER TABLE `bf_ps_endpoints_template`
  ADD PRIMARY KEY (`context`);

--
-- Indexes for table `bf_quality_disposition`
--
ALTER TABLE `bf_quality_disposition`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bf_quality_sub_disposition`
--
ALTER TABLE `bf_quality_sub_disposition`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bf_roles`
--
ALTER TABLE `bf_roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `bf_role_permissions`
--
ALTER TABLE `bf_role_permissions`
  ADD PRIMARY KEY (`role_id`,`permission_id`,`customer_id`) USING BTREE;

--
-- Indexes for table `bf_sale_business_details`
--
ALTER TABLE `bf_sale_business_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bf_sale_client_details`
--
ALTER TABLE `bf_sale_client_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bf_schema_version`
--
ALTER TABLE `bf_schema_version`
  ADD PRIMARY KEY (`type`);

--
-- Indexes for table `bf_sessions`
--
ALTER TABLE `bf_sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Indexes for table `bf_settings`
--
ALTER TABLE `bf_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bf_state`
--
ALTER TABLE `bf_state`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bf_subscribed_users`
--
ALTER TABLE `bf_subscribed_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bf_subscription_plans`
--
ALTER TABLE `bf_subscription_plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bf_support`
--
ALTER TABLE `bf_support`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bf_test_jit`
--
ALTER TABLE `bf_test_jit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bf_todos`
--
ALTER TABLE `bf_todos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bf_udc_country`
--
ALTER TABLE `bf_udc_country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bf_udc_employee_size`
--
ALTER TABLE `bf_udc_employee_size`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bf_udc_industry`
--
ALTER TABLE `bf_udc_industry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bf_udc_job_function`
--
ALTER TABLE `bf_udc_job_function`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bf_udc_job_level`
--
ALTER TABLE `bf_udc_job_level`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bf_udc_nic_code`
--
ALTER TABLE `bf_udc_nic_code`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bf_udc_revenue`
--
ALTER TABLE `bf_udc_revenue`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bf_udc_salutation`
--
ALTER TABLE `bf_udc_salutation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bf_udc_sic_code`
--
ALTER TABLE `bf_udc_sic_code`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bf_users`
--
ALTER TABLE `bf_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `bf_users_extension`
--
ALTER TABLE `bf_users_extension`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bf_user_cookies`
--
ALTER TABLE `bf_user_cookies`
  ADD KEY `token` (`token`);

--
-- Indexes for table `bf_user_designation_points`
--
ALTER TABLE `bf_user_designation_points`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bf_user_meta`
--
ALTER TABLE `bf_user_meta`
  ADD PRIMARY KEY (`meta_id`);

--
-- Indexes for table `extensions`
--
ALTER TABLE `extensions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `context` (`context`,`exten`,`priority`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `iaxfriends`
--
ALTER TABLE `iaxfriends`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `iaxfriends_name` (`name`),
  ADD KEY `iaxfriends_name_host` (`name`,`host`),
  ADD KEY `iaxfriends_name_ipaddr_port` (`name`,`ipaddr`,`port`),
  ADD KEY `iaxfriends_ipaddr_port` (`ipaddr`,`port`),
  ADD KEY `iaxfriends_host_port` (`host`,`port`);

--
-- Indexes for table `musiconhold`
--
ALTER TABLE `musiconhold`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `musiconhold_entry`
--
ALTER TABLE `musiconhold_entry`
  ADD PRIMARY KEY (`name`,`position`);

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- Indexes for table `ps_asterisk_publications`
--
ALTER TABLE `ps_asterisk_publications`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `ps_asterisk_publications_id` (`id`);

--
-- Indexes for table `ps_contacts`
--
ALTER TABLE `ps_contacts`
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `ps_contacts_uq` (`id`,`reg_server`),
  ADD KEY `ps_contacts_id` (`id`),
  ADD KEY `ps_contacts_qualifyfreq_exp` (`qualify_frequency`,`expiration_time`);

--
-- Indexes for table `ps_domain_aliases`
--
ALTER TABLE `ps_domain_aliases`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `ps_domain_aliases_id` (`id`);

--
-- Indexes for table `ps_endpoints`
--
ALTER TABLE `ps_endpoints`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `ps_endpoint_id_ips`
--
ALTER TABLE `ps_endpoint_id_ips`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `ps_endpoint_id_ips_id` (`id`);

--
-- Indexes for table `ps_globals`
--
ALTER TABLE `ps_globals`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `ps_globals_id` (`id`);

--
-- Indexes for table `ps_inbound_publications`
--
ALTER TABLE `ps_inbound_publications`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `ps_inbound_publications_id` (`id`);

--
-- Indexes for table `ps_outbound_publishes`
--
ALTER TABLE `ps_outbound_publishes`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `ps_outbound_publishes_id` (`id`);

--
-- Indexes for table `ps_registrations`
--
ALTER TABLE `ps_registrations`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `ps_registrations_id` (`id`);

--
-- Indexes for table `ps_resource_list`
--
ALTER TABLE `ps_resource_list`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `ps_resource_list_id` (`id`);

--
-- Indexes for table `ps_subscription_persistence`
--
ALTER TABLE `ps_subscription_persistence`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `ps_subscription_persistence_id` (`id`);

--
-- Indexes for table `ps_systems`
--
ALTER TABLE `ps_systems`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `ps_systems_id` (`id`);

--
-- Indexes for table `ps_transports`
--
ALTER TABLE `ps_transports`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `ps_transports_id` (`id`);

--
-- Indexes for table `queues`
--
ALTER TABLE `queues`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `queue_members`
--
ALTER TABLE `queue_members`
  ADD PRIMARY KEY (`queue_name`,`interface`),
  ADD UNIQUE KEY `uniqueid` (`uniqueid`);

--
-- Indexes for table `sippeers`
--
ALTER TABLE `sippeers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `sippeers_name` (`name`),
  ADD KEY `sippeers_name_host` (`name`,`host`),
  ADD KEY `sippeers_ipaddr_port` (`ipaddr`,`port`),
  ADD KEY `sippeers_host_port` (`host`,`port`);

--
-- Indexes for table `voicemail`
--
ALTER TABLE `voicemail`
  ADD PRIMARY KEY (`uniqueid`),
  ADD KEY `voicemail_mailbox` (`mailbox`),
  ADD KEY `voicemail_context` (`context`),
  ADD KEY `voicemail_mailbox_context` (`mailbox`,`context`),
  ADD KEY `voicemail_imapuser` (`imapuser`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bf_activities`
--
ALTER TABLE `bf_activities`
  MODIFY `activity_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=203;

--
-- AUTO_INCREMENT for table `bf_agent_disposition`
--
ALTER TABLE `bf_agent_disposition`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `bf_agent_sub_disposition`
--
ALTER TABLE `bf_agent_sub_disposition`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `bf_assets`
--
ALTER TABLE `bf_assets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=212;

--
-- AUTO_INCREMENT for table `bf_asset_datafiles`
--
ALTER TABLE `bf_asset_datafiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `bf_asset_prospects`
--
ALTER TABLE `bf_asset_prospects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `bf_campaigns`
--
ALTER TABLE `bf_campaigns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `bf_campaign_country`
--
ALTER TABLE `bf_campaign_country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `bf_campaign_employee`
--
ALTER TABLE `bf_campaign_employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `bf_campaign_external_supp`
--
ALTER TABLE `bf_campaign_external_supp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `bf_campaign_grade`
--
ALTER TABLE `bf_campaign_grade`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `bf_campaign_industry`
--
ALTER TABLE `bf_campaign_industry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `bf_campaign_jobfunction`
--
ALTER TABLE `bf_campaign_jobfunction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `bf_campaign_joblevel`
--
ALTER TABLE `bf_campaign_joblevel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `bf_campaign_nic`
--
ALTER TABLE `bf_campaign_nic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `bf_campaign_pacing`
--
ALTER TABLE `bf_campaign_pacing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `bf_campaign_reasons`
--
ALTER TABLE `bf_campaign_reasons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `bf_campaign_revenue`
--
ALTER TABLE `bf_campaign_revenue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `bf_campaign_sic`
--
ALTER TABLE `bf_campaign_sic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `bf_campaign_technology`
--
ALTER TABLE `bf_campaign_technology`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bf_campaign_type`
--
ALTER TABLE `bf_campaign_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `bf_campaign_user`
--
ALTER TABLE `bf_campaign_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `bf_campaign_user_allow_status`
--
ALTER TABLE `bf_campaign_user_allow_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `bf_campaign_user_group`
--
ALTER TABLE `bf_campaign_user_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `bf_campaign_user_group_access`
--
ALTER TABLE `bf_campaign_user_group_access`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `bf_client_rejection`
--
ALTER TABLE `bf_client_rejection`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `bf_companies`
--
ALTER TABLE `bf_companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=222;

--
-- AUTO_INCREMENT for table `bf_country`
--
ALTER TABLE `bf_country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `bf_customers`
--
ALTER TABLE `bf_customers`
  MODIFY `Customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `bf_dnc`
--
ALTER TABLE `bf_dnc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `bf_dnc_type`
--
ALTER TABLE `bf_dnc_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `bf_domains`
--
ALTER TABLE `bf_domains`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=448;

--
-- AUTO_INCREMENT for table `bf_email_logs`
--
ALTER TABLE `bf_email_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `bf_email_queue`
--
ALTER TABLE `bf_email_queue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `bf_extension`
--
ALTER TABLE `bf_extension`
  MODIFY `ext_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bf_file_upload`
--
ALTER TABLE `bf_file_upload`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=182;

--
-- AUTO_INCREMENT for table `bf_form_data`
--
ALTER TABLE `bf_form_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bf_form_inputs`
--
ALTER TABLE `bf_form_inputs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `bf_form_input_types`
--
ALTER TABLE `bf_form_input_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `bf_kanban_boards`
--
ALTER TABLE `bf_kanban_boards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `bf_leads`
--
ALTER TABLE `bf_leads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=667;

--
-- AUTO_INCREMENT for table `bf_login_attempts`
--
ALTER TABLE `bf_login_attempts`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `bf_meetme`
--
ALTER TABLE `bf_meetme`
  MODIFY `bookid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bf_menu`
--
ALTER TABLE `bf_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `bf_notification`
--
ALTER TABLE `bf_notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `bf_permissions`
--
ALTER TABLE `bf_permissions`
  MODIFY `permission_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `bf_prospects`
--
ALTER TABLE `bf_prospects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=736;

--
-- AUTO_INCREMENT for table `bf_quality_disposition`
--
ALTER TABLE `bf_quality_disposition`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `bf_quality_sub_disposition`
--
ALTER TABLE `bf_quality_sub_disposition`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `bf_roles`
--
ALTER TABLE `bf_roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `bf_sale_business_details`
--
ALTER TABLE `bf_sale_business_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bf_sale_client_details`
--
ALTER TABLE `bf_sale_client_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `bf_settings`
--
ALTER TABLE `bf_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `bf_state`
--
ALTER TABLE `bf_state`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `bf_subscribed_users`
--
ALTER TABLE `bf_subscribed_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `bf_subscription_plans`
--
ALTER TABLE `bf_subscription_plans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `bf_support`
--
ALTER TABLE `bf_support`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bf_test_jit`
--
ALTER TABLE `bf_test_jit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bf_todos`
--
ALTER TABLE `bf_todos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `bf_udc_country`
--
ALTER TABLE `bf_udc_country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bf_udc_employee_size`
--
ALTER TABLE `bf_udc_employee_size`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bf_udc_industry`
--
ALTER TABLE `bf_udc_industry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bf_udc_job_function`
--
ALTER TABLE `bf_udc_job_function`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bf_udc_job_level`
--
ALTER TABLE `bf_udc_job_level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `bf_udc_nic_code`
--
ALTER TABLE `bf_udc_nic_code`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bf_udc_revenue`
--
ALTER TABLE `bf_udc_revenue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bf_udc_salutation`
--
ALTER TABLE `bf_udc_salutation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bf_udc_sic_code`
--
ALTER TABLE `bf_udc_sic_code`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bf_users`
--
ALTER TABLE `bf_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `bf_users_extension`
--
ALTER TABLE `bf_users_extension`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `bf_user_designation_points`
--
ALTER TABLE `bf_user_designation_points`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `bf_user_meta`
--
ALTER TABLE `bf_user_meta`
  MODIFY `meta_id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `extensions`
--
ALTER TABLE `extensions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `iaxfriends`
--
ALTER TABLE `iaxfriends`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ps_endpoints`
--
ALTER TABLE `ps_endpoints`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `queue_members`
--
ALTER TABLE `queue_members`
  MODIFY `uniqueid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sippeers`
--
ALTER TABLE `sippeers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `voicemail`
--
ALTER TABLE `voicemail`
  MODIFY `uniqueid` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `musiconhold_entry`
--
ALTER TABLE `musiconhold_entry`
  ADD CONSTRAINT `fk_musiconhold_entry_name_musiconhold` FOREIGN KEY (`name`) REFERENCES `musiconhold` (`name`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
