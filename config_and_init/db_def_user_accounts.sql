-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 04, 2014 at 07:21 PM
-- Server version: 5.5.28-log
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+08:00";

--
-- Database: 'wlux_services'
--

-- --------------------------------------------------------

--
-- Table structure for table 'user_accounts'
--

DROP TABLE IF EXISTS `user_accounts`;
CREATE TABLE IF NOT EXISTS `user_accounts` (
  `recordSeq` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `ownerId` bigint(20) unsigned NOT NULL DEFAULT '0',
  `acctPassword` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `firstName` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `lastName` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `greetingName` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `orgName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `accountType` enum('admin','researcher','reviewer') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'researcher',
  `wluxUrlRoot` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `clientUrlRoot` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `userFileRoot` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `userWebRoot` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `defaultTimeZone` enum('UTC+00 Europe/London','UTC+01 Europe/Berlin','UTC+02 Europe/Kiev','UTC+03 Asia/Riyadh','UTC+03:30 Asia/Tehran','UTC+04 Europe/Moscow','UTC+04:30 Asia/Kabul','UTC+05 Indian/Maldives','UTC+05:30 Asia/Calcutta','UTC+05:45 Asia/Kathmandu','UTC+06 Indian/Chagos','UTC+06:30 Asia/Rangoon','UTC+07 Asia/Bangkok','UTC+08 Asia/Brunei','UTC+08:45 Australia/Eucla','UTC+09 Asia/Tokyo','UTC+09:30 Australia/Adelaide','UTC+10 Australia/Melbourne','UTC+10:30 Australia/Lord_Howe','UTC+11 Pacific/Pohnpei','UTC+11:30 Pacific/Norfolk','UTC+12 Asia/Kamchatka','UTC+12:45 Pacific/Chatham','UTC+13 Pacific/Tongatapu','UTC+14 Pacific/Kiritimati','UTC−01 America/Scoresbysund','UTC−02 America/Atlantic islands','UTC−03 America/Argentina/Mendoza','UTC−03:30 Canada/Newfoundland','UTC−04 America/Halifax','UTC−04:30 America/Caracas','UTC−05 America/New_York','UTC−06 America/Chicago','UTC−07 America/Denver','UTC−08 America/Los_Angeles','UTC−09 America/Anchorage','UTC−09:30 Pacific/Marquesas','UTC−10 America/Adak','UTC−11 Pacific/Midway') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'UTC−08 America/Los_Angeles',
  `dateCreated` datetime NOT NULL,
  `dateModified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`recordSeq`),
  UNIQUE KEY `recordSeq` (`recordSeq`),
  UNIQUE KEY `username` (`username`),
  KEY `recordSeq_2` (`recordSeq`),
  KEY `username_2` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `user_accounts`
--

INSERT INTO `user_accounts` (`recordSeq`, `username`, `ownerId`, `acctPassword`, `firstName`, `lastName`, `greetingName`, `orgName`, `email`, `accountType`, `wluxUrlRoot`, `clientUrlRoot`, `userFileRoot`, `userWebRoot`, `defaultTimeZone`, `dateCreated`, `dateModified`) VALUES
(1, 'defaultAdmin', 0, '1Password', 'Default', 'Admin', 'Admin', 'IBUXL Research', 'ibuxl@example.com', 'admin', 'http://wlux.uw.edu/', 'http://wlux.uw.edu', '/User/WebLabUX', '/User/WebLabUX', 'UTC−08 America/Los_Angeles', NOW(), NOW()),
(2, 'defaultResearcher', 0, '1Password', 'Default', 'Researcher', 'Researcher', 'IBUXL Research', 'ibuxl@example.com', 'researcher', 'http://wlux.uw.edu/', 'http://wlux.uw.edu/', '/User/WebLabUX', '/User/WebLabUX', 'UTC−08 America/Los_Angeles', NOW(), NOW());