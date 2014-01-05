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
-- Database: 'study_variations'
--

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
  variationName varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  variationRoot enum('wlux','client') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'wlux',
  variationCssPath varchar(1024) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  dateCreated datetime NOT NULL,
  dateModified timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (recordSeq),
  UNIQUE KEY recordSeq (recordSeq)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;
