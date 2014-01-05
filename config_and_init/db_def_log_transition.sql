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
-- Database: 'log_transition'
--

-- --------------------------------------------------------

--
-- Table structure for table 'log_transition'
--

DROP TABLE IF EXISTS log_transition;
CREATE TABLE IF NOT EXISTS log_transition (
  recordSeq bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  serverTimestamp timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  clientTimestamp bigint(20) DEFAULT NULL,
  recordType enum('open','transition') NOT NULL DEFAULT 'transition',
  sessionId bigint(20) unsigned NOT NULL DEFAULT '0',
  studyVariationId int(10) unsigned NOT NULL DEFAULT '0',
  taskId int(10) unsigned NOT NULL DEFAULT '0',
  taskVariationId int(10) unsigned NOT NULL DEFAULT '0',
  fromUrl varchar(1024) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'URL of page with link',
  toUrl varchar(1024) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'URL of link destination',
  linkClass varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'class attribute of link',
  linkId varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ID attribute of link',
  linkTag varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'class attribute of link',
  PRIMARY KEY (recordSeq),
  UNIQUE KEY recordSeq (recordSeq)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;
