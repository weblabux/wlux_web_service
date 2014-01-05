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
-- Database: 'study_tasks'
--

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
  variationCssPath varchar(1024) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  taskBarRoot enum('wlux','client') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'wlux',
  taskBarCssPath varchar(1024) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,  
  taskStartUrl varchar(1024) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  taskReturnUrl varchar(1024) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  exitButtonText varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT 'Exit task',
  tabShowText varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT 'Show',
  tabHideText varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT 'Hide',
  taskHtml longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  startPageHtml longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  finishPageHtml longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  startPageNextUrl varchar(1024) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  finishPageNextUrl varchar(1024) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  measuredTask int(10) unsigned NOT NULL DEFAULT '1',
  taskType enum('pre','post','taskOnly','prePostTask') NOT NULL DEFAULT 'prePostTask',
  dateCreated datetime NOT NULL,
  dateModified timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (recordSeq),
  UNIQUE KEY recordSeq (recordSeq)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;
