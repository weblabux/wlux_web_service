-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 04, 2014 at 08:31 PM
-- Server version: 5.5.28-log
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+08:00";

--
-- Database: 'wlux_services'
--

CREATE DATABASE IF NOT EXISTS wlux_services 
    DEFAULT CHARACTER SET utf8
    DEFAULT COLLATE utf8_unicode_ci

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
(401, 0, 'en-US', 'Not authorized'),
(404, 0, 'en-US', 'Record not found'),
(405, 0, 'en-US', 'HTTP method not allowed'),
(500, 0, 'en-US', 'Server error'),
(500, 1, 'en-US', 'Error writing record to database'),
(501, 0, 'en-US', 'Command not implemented'),
(501, 1, 'en-US', 'Command not recognized');

-- --------------------------------------------------------

--
-- Table structure for table 'debug'
--

DROP TABLE IF EXISTS debug;
CREATE TABLE IF NOT EXISTS debug (
  recordSeq bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  moduleName varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  methodName varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  returnDbgData tinyint(1) NOT NULL DEFAULT '0',
  returnSqlData tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (recordSeq),
  UNIQUE KEY recordSeq (recordSeq)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table 'gratuity_log'
--

DROP TABLE IF EXISTS gratuity_log;
CREATE TABLE IF NOT EXISTS gratuity_log (
  recordSeq bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  studyId bigint(20) unsigned NOT NULL DEFAULT '0',
  sessionName varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  email varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  comments varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  dateCreated datetime NOT NULL,
  dateModified timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (recordSeq),
  UNIQUE KEY recordSeq (recordSeq)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table 'log_transition'
--

DROP TABLE IF EXISTS log_transition;
CREATE TABLE IF NOT EXISTS log_transition (
  recordSeq bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  serverTimestamp timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  clientTimestamp bigint(20) DEFAULT NULL,
  recordType enum('open','transition') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'transition',
  sessionId bigint(20) unsigned NOT NULL DEFAULT '0',
  studyVariationId int(10) unsigned NOT NULL DEFAULT '0',
  taskId int(10) unsigned NOT NULL DEFAULT '0',
  taskVariationId int(10) unsigned NOT NULL DEFAULT '0',
  fromUrl varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'URL of page with link',
  toUrl varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'URL of link destination',
  linkClass varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'class attribute of link',
  linkId varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ID attribute of link',
  linkTag varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'class attribute of link',
  PRIMARY KEY (recordSeq),
  UNIQUE KEY recordSeq (recordSeq)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table 'session_config'
--

DROP TABLE IF EXISTS session_config;
CREATE TABLE IF NOT EXISTS session_config (
  recordSeq bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  sessionId bigint(20) unsigned NOT NULL DEFAULT '0',
  studyId bigint(20) unsigned NOT NULL DEFAULT '0',
  studyVariationId int(10) unsigned NOT NULL DEFAULT '0',
  taskId int(10) unsigned NOT NULL DEFAULT '0',
  taskVariationId int(10) unsigned NOT NULL DEFAULT '0',
  variationCssUrl varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  taskBarCssUrl varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  taskStartUrl varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  taskReturnUrl varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  exitButtonText varchar(255) COLLATE utf8_unicode_ci DEFAULT 'Exit task',
  tabShowText varchar(255) COLLATE utf8_unicode_ci DEFAULT 'Show',
  tabHideText varchar(255) COLLATE utf8_unicode_ci DEFAULT 'Hide',
  taskHtml longtext COLLATE utf8_unicode_ci,
  startPageHtml longtext COLLATE utf8_unicode_ci,
  finishPageHtml longtext COLLATE utf8_unicode_ci,
  startPageNextUrl varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  finishPageNextUrl varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  measuredTask int(10) unsigned NOT NULL DEFAULT '1',
  taskType enum('pre','post','taskOnly','prePostTask') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'prePostTask',
  dateCreated datetime NOT NULL,
  dateModified timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (recordSeq),
  UNIQUE KEY recordSeq (recordSeq)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

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

-- --------------------------------------------------------

--
-- Table structure for table 'study_general'
--

DROP TABLE IF EXISTS study_general;
CREATE TABLE IF NOT EXISTS study_general (
  recordSeq bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  ownerId bigint(20) unsigned NOT NULL DEFAULT '0',
  studyName varchar(127) COLLATE utf8_unicode_ci NOT NULL,
  studyDescription longtext COLLATE utf8_unicode_ci NOT NULL,
  researcherOrg varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  researcherFirstName varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  researcherLastName varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  researcherEmail varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  defaultTimeZone enum('UTC+00 Europe/London','UTC+01 Europe/Berlin','UTC+02 Europe/Kiev','UTC+03 Asia/Riyadh','UTC+03:30 Asia/Tehran','UTC+04 Europe/Moscow','UTC+04:30 Asia/Kabul','UTC+05 Indian/Maldives','UTC+05:30 Asia/Calcutta','UTC+05:45 Asia/Kathmandu','UTC+06 Indian/Chagos','UTC+06:30 Asia/Rangoon','UTC+07 Asia/Bangkok','UTC+08 Asia/Brunei','UTC+08:45 Australia/Eucla','UTC+09 Asia/Tokyo','UTC+09:30 Australia/Adelaide','UTC+10 Australia/Melbourne','UTC+10:30 Australia/Lord_Howe','UTC+11 Pacific/Pohnpei','UTC+11:30 Pacific/Norfolk','UTC+12 Asia/Kamchatka','UTC+12:45 Pacific/Chatham','UTC+13 Pacific/Tongatapu','UTC+14 Pacific/Kiritimati','UTC−01 America/Scoresbysund','UTC−02 America/Atlantic islands','UTC−03 America/Argentina/Mendoza','UTC−03:30 Canada/Newfoundland','UTC−04 America/Halifax','UTC−04:30 America/Caracas','UTC−05 America/New_York','UTC−06 America/Chicago','UTC−07 America/Denver','UTC−08 America/Los_Angeles','UTC−09 America/Anchorage','UTC−09:30 Pacific/Marquesas','UTC−10 America/Adak','UTC−11 Pacific/Midway') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'UTC−08 America/Los_Angeles',
  defaultVariationMethod enum('singleRandom') COLLATE utf8_unicode_ci NOT NULL,
  defaultTaskBarRoot enum('wlux','client') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'wlux',
  defaultTaskBarCssPath varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  defaultVariationRoot enum('wlux','client') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'wlux',
  defaultVariationCssPath varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  defaultExitButtonText varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Exit task',
  defaultTabShowText varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Show',
  defaultTabHideText varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Hide',
  clientTimeStampFormat enum('default') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  studyStatus enum('draft','scheduled','completed','archived') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'draft',
  dateCreated datetime NOT NULL,
  dateModified timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (recordSeq),
  UNIQUE KEY recordSeq (recordSeq),
  UNIQUE KEY studyName (studyName),
  KEY recordSeq_2 (recordSeq),
  KEY studyName_2 (studyName)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table 'study_schedule'
--

DROP TABLE IF EXISTS study_schedule;
CREATE TABLE IF NOT EXISTS study_schedule (
  recordSeq bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  studyId bigint(20) unsigned NOT NULL DEFAULT '0',
  ownerId bigint(20) unsigned NOT NULL DEFAULT '0',
  sessionName varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  sessionDescription longtext COLLATE utf8_unicode_ci NOT NULL,
  sessionParticipantLimit bigint(20) NOT NULL DEFAULT '-1',
  sessionStartTime datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  sessionEndTime datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  sessionAnnouncementText longtext COLLATE utf8_unicode_ci NOT NULL,
  sessionEmailList longtext COLLATE utf8_unicode_ci NOT NULL,
  sessionTaskSequence enum('sequential','random') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'sequential',
  sessionStudyVariations enum('singleRandom') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'singleRandom',
  sessionTimeZone enum('UTC+00 Europe/London','UTC+01 Europe/Berlin','UTC+02 Europe/Kiev','UTC+03 Asia/Riyadh','UTC+03:30 Asia/Tehran','UTC+04 Europe/Moscow','UTC+04:30 Asia/Kabul','UTC+05 Indian/Maldives','UTC+05:30 Asia/Calcutta','UTC+05:45 Asia/Kathmandu','UTC+06 Indian/Chagos','UTC+06:30 Asia/Rangoon','UTC+07 Asia/Bangkok','UTC+08 Asia/Brunei','UTC+08:45 Australia/Eucla','UTC+09 Asia/Tokyo','UTC+09:30 Australia/Adelaide','UTC+10 Australia/Melbourne','UTC+10:30 Australia/Lord_Howe','UTC+11 Pacific/Pohnpei','UTC+11:30 Pacific/Norfolk','UTC+12 Asia/Kamchatka','UTC+12:45 Pacific/Chatham','UTC+13 Pacific/Tongatapu','UTC+14 Pacific/Kiritimati','UTC−01 America/Scoresbysund','UTC−02 America/Atlantic islands','UTC−03 America/Argentina/Mendoza','UTC−03:30 Canada/Newfoundland','UTC−04 America/Halifax','UTC−04:30 America/Caracas','UTC−05 America/New_York','UTC−06 America/Chicago','UTC−07 America/Denver','UTC−08 America/Los_Angeles','UTC−09 America/Anchorage','UTC−09:30 Pacific/Marquesas','UTC−10 America/Adak','UTC−11 Pacific/Midway') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'UTC−08 America/Los_Angeles',
  dateCreated datetime NOT NULL,
  dateModified timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (recordSeq),
  UNIQUE KEY recordSeq (recordSeq),
  KEY recordSeq_2 (recordSeq),
  KEY studyId_2 (studyId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table 'study_tasks'
--

DROP TABLE IF EXISTS study_tasks;
CREATE TABLE IF NOT EXISTS study_tasks (
  recordSeq bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  studyId bigint(20) unsigned NOT NULL DEFAULT '0',
  taskId int(10) unsigned NOT NULL DEFAULT '0',
  variationId int(10) unsigned NOT NULL DEFAULT '0',
  variationRoot enum('wlux','client') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'wlux',
  variationCssPath varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  taskBarRoot enum('wlux','client') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'wlux',
  taskBarCssPath varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  taskStartUrl varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  taskReturnUrl varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  exitButtonText varchar(255) COLLATE utf8_unicode_ci DEFAULT 'Exit task',
  tabShowText varchar(255) COLLATE utf8_unicode_ci DEFAULT 'Show',
  tabHideText varchar(255) COLLATE utf8_unicode_ci DEFAULT 'Hide',
  taskHtml longtext COLLATE utf8_unicode_ci,
  startPageHtml longtext COLLATE utf8_unicode_ci,
  finishPageHtml longtext COLLATE utf8_unicode_ci,
  startPageNextUrl varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  finishPageNextUrl varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  measuredTask int(10) unsigned NOT NULL DEFAULT '1',
  taskType enum('pre','post','taskOnly','prePostTask') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'prePostTask',
  dateCreated datetime NOT NULL,
  dateModified timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (recordSeq),
  UNIQUE KEY recordSeq (recordSeq)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table 'study_variations'
--

DROP TABLE IF EXISTS study_variations;
CREATE TABLE IF NOT EXISTS study_variations (
  recordSeq bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  studyId bigint(20) unsigned NOT NULL DEFAULT '0',
  ownerId bigint(20) unsigned NOT NULL DEFAULT '0',
  variationNo int(10) unsigned NOT NULL DEFAULT '0',
  variationName varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  variationRoot enum('wlux','client') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'wlux',
  variationCssPath varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  dateCreated datetime NOT NULL,
  dateModified timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (recordSeq),
  UNIQUE KEY recordSeq (recordSeq)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table 'user_accounts'
--

DROP TABLE IF EXISTS user_accounts;
CREATE TABLE IF NOT EXISTS user_accounts (
  recordSeq bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  username varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  ownerId bigint(20) unsigned NOT NULL DEFAULT '0',
  acctPassword varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  firstName varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  lastName varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  greetingName varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  orgName varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  email varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  accountType enum('admin','researcher','reviewer') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'researcher',
  wluxUrlRoot varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  clientUrlRoot varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  defaultTimeZone enum('UTC+00 Europe/London','UTC+01 Europe/Berlin','UTC+02 Europe/Kiev','UTC+03 Asia/Riyadh','UTC+03:30 Asia/Tehran','UTC+04 Europe/Moscow','UTC+04:30 Asia/Kabul','UTC+05 Indian/Maldives','UTC+05:30 Asia/Calcutta','UTC+05:45 Asia/Kathmandu','UTC+06 Indian/Chagos','UTC+06:30 Asia/Rangoon','UTC+07 Asia/Bangkok','UTC+08 Asia/Brunei','UTC+08:45 Australia/Eucla','UTC+09 Asia/Tokyo','UTC+09:30 Australia/Adelaide','UTC+10 Australia/Melbourne','UTC+10:30 Australia/Lord_Howe','UTC+11 Pacific/Pohnpei','UTC+11:30 Pacific/Norfolk','UTC+12 Asia/Kamchatka','UTC+12:45 Pacific/Chatham','UTC+13 Pacific/Tongatapu','UTC+14 Pacific/Kiritimati','UTC−01 America/Scoresbysund','UTC−02 America/Atlantic islands','UTC−03 America/Argentina/Mendoza','UTC−03:30 Canada/Newfoundland','UTC−04 America/Halifax','UTC−04:30 America/Caracas','UTC−05 America/New_York','UTC−06 America/Chicago','UTC−07 America/Denver','UTC−08 America/Los_Angeles','UTC−09 America/Anchorage','UTC−09:30 Pacific/Marquesas','UTC−10 America/Adak','UTC−11 Pacific/Midway') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'UTC−08 America/Los_Angeles',
  dateCreated datetime NOT NULL,
  dateModified timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (recordSeq),
  UNIQUE KEY recordSeq (recordSeq),
  UNIQUE KEY username (username),
  KEY recordSeq_2 (recordSeq),
  KEY username_2 (username)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;
