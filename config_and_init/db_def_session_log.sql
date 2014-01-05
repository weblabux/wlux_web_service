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
-- Database: 'session_log'
--

-- --------------------------------------------------------

--
-- Table structure for table 'session_log'
--

DROP TABLE IF EXISTS session_log;
CREATE TABLE IF NOT EXISTS session_log (
  recordSeq bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  sessionId bigint(20) unsigned NOT NULL DEFAULT '0',
  studyId bigint(20) unsigned NOT NULL DEFAULT '0',
  studyVariationId int(10) unsigned NOT NULL DEFAULT '0',
  taskId int(10) unsigned NOT NULL DEFAULT '0',
  taskVariationId int(10) unsigned NOT NULL DEFAULT '0',
  startTime datetime DEFAULT NULL,
  endTime datetime DEFAULT NULL,
  dateCreated datetime NOT NULL,
  dateModified timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (recordSeq),
  UNIQUE KEY recordSeq (recordSeq)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;
