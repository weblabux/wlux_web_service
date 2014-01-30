-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 23, 2014 at 10:15 PM
-- Server version: 5.5.25
-- PHP Version: 5.4.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `wlux_services`
--
USE wlux_services;

--
-- Loading developer study defs into table `study_general`
--

INSERT INTO `study_general` (`studyId`, `ownerId`, `studyName`, `studyDescription`, `researcherOrg`, `researcherFirstName`, `researcherLastName`, `researcherEmail`, `researcherAddress`, `ethicsBoardEmail`, `defaultTimeZone`, `defaultVariationMethod`, `defaultTaskBarRoot`, `defaultTaskBarCssPath`, `defaultVariationRoot`, `defaultVariationCssPath`, `defaultExitButtonText`, `defaultTabShowText`, `defaultTabHideText`, `clientTimeStampFormat`, `studyStatus`, `dateCreated`, `dateModified`) VALUES
(1234, 2, 'Test study 1', 'This is a test study used while developing new code.', 'Ibuxl', 'Default', 'Researcher', 'researcher@ibuxl.uw.edu', 'N/A', NULL, 'UTC−08 America/Los_Angeles', 'singleRandom', 'wlux', 'css/', 'wlux', 'css/', 'Exit task', 'Show', 'Hide', 'default', 'draft', '2014-01-23 13:12:54', '2014-01-23 21:12:54'),
(4567, 2, 'Another Test', 'This is a test study used during development', 'IBUXL', 'Default', 'Researcher', 'researcher@ibuxl.uw.edu', 'N/A', NULL, 'UTC−08 America/Los_Angeles', 'singleRandom', 'wlux', 'css/', 'wlux', 'css/', 'Exit task', 'Show', 'Hide', 'default', 'draft', '2014-01-23 13:15:08', '2014-01-23 21:15:08');
