-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 05, 2014 at 08:17 PM
-- Server version: 5.5.28-log
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+08:00";

--
-- Database: 'wlux_services'
--

-- --------------------------------------------------------

--
-- Table structure for table 'error_messages'
--

DROP TABLE IF EXISTS error_messages;
CREATE TABLE IF NOT EXISTS error_messages (
  recordSeq int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` int(10) unsigned NOT NULL,
  variation int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(8) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'en-US',
  message varchar(2048) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (recordSeq),
  KEY `status` (`status`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table 'error_messages'
--

INSERT INTO error_messages (`status`, variation, `language`, message) VALUES
(400, 0, 'en-US', 'Bad request'),
(404, 0, 'en-US', 'Record not found'),
(405, 0, 'en-US', 'HTTP method not allowed'),
(500, 0, 'en-US', 'Server error'),
(500, 1, 'en-US', 'Error writing record to database'),
(501, 0, 'en-US', 'Command not implemented'),
(501, 1, 'en-US', 'Command not recognized');
