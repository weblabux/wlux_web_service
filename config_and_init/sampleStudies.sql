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

-- Give study 1234 two test periods
INSERT INTO `study_periods` (`studyId`, `periodName`, `periodDescription`, `periodParticipantLimit`, `periodStartTime`, `periodEndTime`, `periodAnnouncementText`, `periodEmailList`, `periodTaskSequence`, `periodStudyVariations`, `periodTimeZone`, `dateCreated`, `dateModified`, `deleted`) VALUES ('1234', 'The first period', 'The first period of the test study', NULL, '2014-02-10 00:00:00', '2014-02-15 00:00:00', NULL, NULL, 'random', 'singleRandom', 'UTC−08 America/Los_Angeles', NOW(), CURRENT_TIMESTAMP, '0'), ('1234', 'The second period', 'The first period of the test study', '500', '2014-02-17 00:00:00', '2014-02-22 00:00:00', NULL, NULL, 'random', 'singleRandom', 'UTC−08 America/Los_Angeles', NOW(), CURRENT_TIMESTAMP, '0');