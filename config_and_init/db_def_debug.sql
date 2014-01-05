-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 04, 2014 at 08:29 PM
-- Server version: 5.5.28-log
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: 'wlux_services'
--

-- --------------------------------------------------------

--
-- Table structure for table 'debug'
--

DROP TABLE IF EXISTS debug;
CREATE TABLE IF NOT EXISTS debug (
  recordSeq bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  moduleName varchar(64) COLLATE utf8_unicode_ci NOT NULL ,
  methodName varchar(64) COLLATE utf8_unicode_ci NOT NULL ,
  returnDbgData tinyint(1) NOT NULL DEFAULT '0',
  returnSqlData tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (recordSeq),
  UNIQUE KEY recordSeq (recordSeq)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;
