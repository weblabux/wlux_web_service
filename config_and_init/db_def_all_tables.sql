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
    DEFAULT COLLATE utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table 'error_messages'
--

DROP TABLE IF EXISTS error_messages;
CREATE TABLE IF NOT EXISTS error_messages (
  errorMessageId int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Unique message ID. Used only to identify the record in the table',
  errorStatus int(10) unsigned NOT NULL  COMMENT 'HTTP error response status value',
  messageVariation int(10) unsigned NOT NULL  COMMENT 'Variation of message. Supports multiple error messages for a single errorStatus value to provide more descriptive messages in specific situations.',
  messageLanguage char(8)  COLLATE utf8_unicode_ci  NOT NULL  COMMENT 'Language code of the message text language.',
  messageText varchar(2048)  COLLATE utf8_unicode_ci  NOT NULL  COMMENT 'Message text to return to the caller',
  PRIMARY KEY (errorMessageId),
  KEY errorStatus (errorStatus)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 COMMENT 'Used to store error message text for error response buffers';

--
-- Data for table 'error_messages'
--

INSERT INTO error_messages (`errorStatus`, messageVariation, `messageLanguage`, messageText) VALUES
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
  debugId bigint(20) unsigned NOT NULL  AUTO_INCREMENT COMMENT 'Unique record ID.',
  moduleName varchar(64)  COLLATE utf8_unicode_ci  NOT NULL   COMMENT 'Module to which this setting applies.',
  methodName varchar(64)  COLLATE utf8_unicode_ci  NOT NULL   COMMENT 'Method to which this setting applies.',
  returnDbgData tinyint(1)  NOT NULL  DEFAULT '0' COMMENT 'When TRUE, the specified module and method should return a debug data structure in the repsonse.',
  returnSqlData tinyint(1)  NOT NULL  DEFAULT '0' COMMENT 'When TRUE, the specified module and method should return an SQL ddata structure in the repsonse.',
  PRIMARY KEY (debugId),
  UNIQUE KEY debugId (debugId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 COMMENT 'Used to store the debug message configuration of the service.';

-- --------------------------------------------------------

--
-- Table structure for table 'log_gratuity'
--

DROP TABLE IF EXISTS log_gratuity;
CREATE TABLE IF NOT EXISTS log_gratuity (
  gratuityLogId bigint(20) unsigned NOT NULL  AUTO_INCREMENT COMMENT 'Unique record ID.',
  studyId bigint(20) unsigned NOT NULL   COMMENT 'ID of study to which this gratuity entry belongs.',
  periodName varchar(64)  COLLATE utf8_unicode_ci   DEFAULT NULL COMMENT 'Name of study period in the study identified by studyId to which this entry belongs.',
  email varchar(255)  COLLATE utf8_unicode_ci   DEFAULT NULL COMMENT 'Email address entered by the participant.',
  comments varchar(1024)  COLLATE utf8_unicode_ci   DEFAULT NULL COMMENT 'Comments entered by the participant.',
  dateCreated datetime  NOT NULL  COMMENT 'The date the record was created in server local time.',
  dateModified timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP  COMMENT 'The date the record was updated in server local time.',
  PRIMARY KEY (gratuityLogId),
  UNIQUE KEY gratuityLogId (gratuityLogId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 COMMENT 'Stores participant information used for gratuity fulfillment.';

-- --------------------------------------------------------

--
-- Table structure for table 'log_transition'
--

DROP TABLE IF EXISTS log_transition;
CREATE TABLE IF NOT EXISTS log_transition (
  logTransitionId bigint(20) unsigned NOT NULL  AUTO_INCREMENT COMMENT 'Unique record ID.',
  serverTimestamp timestamp  NOT NULL  DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP  COMMENT 'Time read from server that the activity took place. Stored in server time zone.',
  clientTimestamp bigint(20) unsigned  DEFAULT NULL COMMENT 'The timestamp information provided by the client site. Treated as a number. If NULL or 0, the serverTimestamp field is used for timing activities.',
  recordType enum('open','transition')  COLLATE utf8_unicode_ci  NOT NULL   COMMENT 'The type of log record. Possible values are: "open" - records page loads; "transition" - records navigation activity.',
  sessionId bigint(20) unsigned NOT NULL   COMMENT 'The participant session in which the activity occured.',
  sessionConfigId bigint(20) unsigned NOT NULL   COMMENT 'The study config record in use when the activity ocurred.',
  stepIndex int(10) unsigned NOT NULL   COMMENT 'The index of the protocol step in which the activity ocurred.',
  taskVariationId int(10) unsigned NOT NULL   COMMENT 'RESERVED',
  fromUrl varchar(1024)  COLLATE utf8_unicode_ci   DEFAULT NULL COMMENT 'URL of page with link that was opened or clicked',
  toUrl varchar(1024)  COLLATE utf8_unicode_ci   DEFAULT NULL COMMENT 'URL of link destination',
  linkClass varchar(255)  COLLATE utf8_unicode_ci   DEFAULT NULL COMMENT 'class attribute of link',
  linkId varchar(255)  COLLATE utf8_unicode_ci   DEFAULT NULL COMMENT 'ID attribute of link',
  linkTag varchar(255)  COLLATE utf8_unicode_ci   DEFAULT NULL COMMENT 'Tag type of link',
  PRIMARY KEY (logTransitionId),
  UNIQUE KEY logTransitionId (logTransitionId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 COMMENT 'Records activity from the site being tested.';

-- --------------------------------------------------------

--
-- Table structure for table 'session_config'
--

DROP TABLE IF EXISTS session_config;
CREATE TABLE IF NOT EXISTS session_config (
  sessionConfigId bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Unique record ID',
  sessionId bigint(20) unsigned NOT NULL DEFAULT '0'  COMMENT 'Participant session to which this configuration belongs',
  studyId bigint(20) unsigned NOT NULL DEFAULT '0'  COMMENT 'ID of study that defined this session',
  studyStepId bigint(20) unsigned NOT NULL DEFAULT '0'  COMMENT 'ID of the study step this record references',
  stepIndex int(10) unsigned NOT NULL DEFAULT '0'  COMMENT 'Step sequence',
  preTaskPageUrl varchar(1024)  COLLATE utf8_unicode_ci   DEFAULT NULL  COMMENT 'URL of pre-task page if used. null means dont show a pre-task page for this step.',
  preTaskPageHtml longtext  COLLATE utf8_unicode_ci   DEFAULT NULL  COMMENT 'HTML to show in the pre-task page',
  preTaskPageNextUrl varchar(1024)  COLLATE utf8_unicode_ci   DEFAULT NULL  COMMENT 'Destination of the next button on the pre-task page',
  studyTaskPageUrl varchar(1024)  COLLATE utf8_unicode_ci   DEFAULT NULL  COMMENT 'URL to the first page of the web page for the study task in this step. If null, this step does not have a study task.',
  defaultTaskBarRoot enum('wlux','client')   DEFAULT 'wlux' COMMENT 'Root path of the CSS file for the task bar to show in the study page',
  taskBarCssPath varchar(1024)  COLLATE utf8_unicode_ci   DEFAULT NULL  COMMENT 'Path to the CSS file for the task bar. If empty, use default for study.',
  taskBarHtml longtext  COLLATE utf8_unicode_ci   DEFAULT NULL  COMMENT 'Text to show in the task bar on the client web siteNOTE: if submitted value does not start with an "<" character, wrap the submitted value in "<p>" tags.',
  exitButtonText varchar(255)  COLLATE utf8_unicode_ci   DEFAULT 'Exit task' COMMENT 'Text to display in the exit task button. If empty, use default for study.',
  tabShowText varchar(255)  COLLATE utf8_unicode_ci   DEFAULT 'Show' COMMENT 'Text to display in the task-bar SHOW button. If empty, use default for study.',
  tabHideText varchar(255)  COLLATE utf8_unicode_ci   DEFAULT 'Hide' COMMENT 'Text to display in the task-bar HIDE button. If empty, use default for study.',
  studyTaskReturnUrl varchar(1024)  COLLATE utf8_unicode_ci   DEFAULT NULL  COMMENT 'URL of the page to navigate to when the participent ends the task on the client site.',
  postTaskPageUrl varchar(1024)  COLLATE utf8_unicode_ci   DEFAULT NULL  COMMENT 'URL of the post-task page, if used.  null means dont show a pre-task page for this step.',
  postTaskPageHtml longtext  COLLATE utf8_unicode_ci   DEFAULT NULL  COMMENT 'HTML to show in the post-task page',
  postTaskPageNextUrl varchar(1024)  COLLATE utf8_unicode_ci   DEFAULT NULL  COMMENT 'Destination of the next button on the post-task page',
  dateCreated datetime  NOT NULL  COMMENT 'The date the record was created in server local time.',
  dateModified timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP  COMMENT 'The date the record was created in server local time.',
  PRIMARY KEY (sessionConfigId),
  UNIQUE KEY sessionConfigId (sessionConfigId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 COMMENT 'Table used during participant sessions to record the configurations used by each task and variation of a session.';

-- --------------------------------------------------------

--
-- Table structure for table 'session_config_details'
--

DROP TABLE IF EXISTS session_config_details;
CREATE TABLE IF NOT EXISTS session_config_details (
  studyConfigDetailId bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Unique record ID',
  sessionConfigId bigint(20) unsigned NOT NULL  COMMENT 'ID of study config record to which this record relates',
  detailType enum('measure','variable','variation')  NOT NULL  COMMENT 'detail type (describes to what detailId refers)',
  detailId bigint(20) unsigned NOT NULL  COMMENT 'ID in corresponding table',
  PRIMARY KEY (studyConfigDetailId),
  UNIQUE KEY studyConfigDetailId (studyConfigDetailId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 COMMENT 'Table used during participant sessions to record the configuration details of a session.';

-- --------------------------------------------------------

--
-- Table structure for table 'log_session'
--

DROP TABLE IF EXISTS log_session;
CREATE TABLE IF NOT EXISTS log_session (
  sessionLogId bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Unique record ID',
  sessionId bigint(20) unsigned NOT NULL  COMMENT 'ID of participant session',
  studyId bigint(20) unsigned NOT NULL  COMMENT 'ID of study that defined this participant session',
  sessionConfigId int(10) unsigned NOT NULL  COMMENT 'ID study variation this record describes',
  taskId int(10) unsigned NOT NULL  COMMENT 'ID of task this record describes. Records with a taskId=0 describe the entire session.',
  taskVariationNo int(10) unsigned NOT NULL  COMMENT 'RESERVED',
  startTime datetime  NOT NULL  COMMENT 'The time, in server local time, that this task/variation began.',
  endTime datetime  NOT NULL  COMMENT 'The time, in server local time, that this task/variation ended.',
  dateCreated datetime  NOT NULL  COMMENT 'The date the record was created in server local time.',
  dateModified timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP  COMMENT 'The date the record was created in server local time.',
  PRIMARY KEY (sessionLogId),
  UNIQUE KEY sessionLogId (sessionLogId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 COMMENT 'Records the tasks and variations used during a participant session.';

-- --------------------------------------------------------

--
-- Table structure for table 'study_general'
--

DROP TABLE IF EXISTS study_general;
CREATE TABLE IF NOT EXISTS study_general (
  studyId bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Unique ID of a study configuration',
  ownerId bigint(20) unsigned NOT NULL  COMMENT 'The account to which the study belongs. The value is the user_accounts:accountId of the owner.',
  studyName varchar(127)  COLLATE utf8_unicode_ci   DEFAULT NULL  COMMENT 'The human-readable name of the study.',
  studyDescription longtext  COLLATE utf8_unicode_ci   DEFAULT NULL  COMMENT 'Free text description of the study.',
  researcherOrg varchar(255)  COLLATE utf8_unicode_ci   DEFAULT NULL  COMMENT 'Organization name listed as contact info for the researcher who is the primary (public) contact for this study.',
  researcherFirstName varchar(64)  COLLATE utf8_unicode_ci   DEFAULT NULL  COMMENT 'First name for researcher who is the primary (public) contact for this study.',
  researcherLastName varchar(64)  COLLATE utf8_unicode_ci   DEFAULT NULL  COMMENT 'Last name for the researcher who is the primary (public) contact for this study.',
  researcherEmail varchar(255)  COLLATE utf8_unicode_ci   DEFAULT NULL  COMMENT 'Contact email for the researcher who is the primary (public) contact for this study.',
  researcherAddress varchar(255)  COLLATE utf8_unicode_ci   DEFAULT NULL  COMMENT 'Mailing addres for the researcher who is the primary (public) contact for this study.',
  ethicsBoardEmail varchar(255)  COLLATE utf8_unicode_ci   DEFAULT NULL  COMMENT 'Contact email for the ethics board / institutional review board who approved this studys procedures.',
  defaultTimeZone enum('UTC+00 Europe/London','UTC+01 Europe/Berlin','UTC+02 Europe/Kiev','UTC+03 Asia/Riyadh','UTC+03:30 Asia/Tehran','UTC+04 Europe/Moscow','UTC+04:30 Asia/Kabul','UTC+05 Indian/Maldives','UTC+05:30 Asia/Calcutta','UTC+05:45 Asia/Kathmandu','UTC+06 Indian/Chagos','UTC+06:30 Asia/Rangoon','UTC+07 Asia/Bangkok','UTC+08 Asia/Brunei','UTC+08:45 Australia/Eucla','UTC+09 Asia/Tokyo','UTC+09:30 Australia/Adelaide','UTC+10 Australia/Melbourne','UTC+10:30 Australia/Lord_Howe','UTC+11 Pacific/Pohnpei','UTC+11:30 Pacific/Norfolk','UTC+12 Asia/Kamchatka','UTC+12:45 Pacific/Chatham','UTC+13 Pacific/Tongatapu','UTC+14 Pacific/Kiritimati','UTC−01 America/Scoresbysund','UTC−02 America/Atlantic islands','UTC−03 America/Argentina/Mendoza','UTC−03:30 Canada/Newfoundland','UTC−04 America/Halifax','UTC−04:30 America/Caracas','UTC−05 America/New_York','UTC−06 America/Chicago','UTC−07 America/Denver','UTC−08 America/Los_Angeles','UTC−09 America/Anchorage','UTC−09:30 Pacific/Marquesas','UTC−10 America/Adak','UTC−11 Pacific/Midway') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'UTC−08 America/Los_Angeles' COMMENT 'Default time zone to use for this account',
  defaultVariationMethod enum('singleRandom')   DEFAULT 'singleRandom' COMMENT 'Describes how IV levels are selected during a participant session.',
  defaultTaskBarRoot enum('wlux','client')   DEFAULT 'wlux' COMMENT 'The URL root path to use for the task bar CSS.',
  defaultTaskBarCssPath varchar(1024)  COLLATE utf8_unicode_ci NOT NULL  COMMENT 'The path to use for the task bar CSS from the specified root path.',
  defaultVariationRoot enum('wlux','client')   DEFAULT 'wlux' COMMENT 'The URL root path to use for the variation CSS files.',
  defaultVariationCssPath varchar(1024)  COLLATE utf8_unicode_ci NOT NULL  COMMENT 'The path to use for the variation CSS files from the specified root path.',
  defaultExitButtonText varchar(255)  COLLATE utf8_unicode_ci   DEFAULT 'Exit task' COMMENT 'Text to display on the button that ends the task on the client site and returns to the page desribed by the taskReturnUrl.',
  defaultTabShowText varchar(255)  COLLATE utf8_unicode_ci   DEFAULT 'Show' COMMENT 'Text to display on the SHOW button of the the task bar displayed on the client site during a task.',
  defaultTabHideText varchar(255)  COLLATE utf8_unicode_ci   DEFAULT 'Hide' COMMENT 'Text to display on the HIDE button of the the task bar displayed on the client site during a task.',
  clientTimeStampFormat enum('default')   DEFAULT 'default' COMMENT 'The formula to use to interpret the client time stamp sent to the log_transition file.',
  studyStatus enum('draft','scheduled','completed','archived')   DEFAULT 'draft' COMMENT 'The current state of this study.',
  dateCreated datetime  NOT NULL  COMMENT 'The date the record was created in server local time.',
  dateModified timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP  COMMENT 'The date the record was created in server local time.',
  PRIMARY KEY (studyId),
  UNIQUE KEY studyId (studyId),
  UNIQUE KEY studyName (studyName),
  KEY studyId_2 (studyId),
  KEY studyName_2 (studyName)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 COMMENT 'Describes the general characteristics of a study.';

-- --------------------------------------------------------

--
-- Table structure for table 'study_periods'
--

DROP TABLE IF EXISTS study_periods;
CREATE TABLE IF NOT EXISTS study_periods (
  studyPeriodId bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Unique record ID',
  studyId bigint(20) unsigned NOT NULL  COMMENT 'Study ID (study_general:studyId of the study to which this schedule period belongs. Study owner is defined by the study ID in the study_general table.',
  periodName varchar(64) COLLATE utf8_unicode_ci NOT NULL  COMMENT 'The human-readable name of this study period.',
  periodDescription longtext COLLATE utf8_unicode_ci  DEFAULT NULL COMMENT 'Free text field to describe the study period.',
  periodParticipantLimit bigint(20) unsigned  DEFAULT NULL COMMENT 'The maximum number of participant sessions to accept during this study period. -1 = no limit. This is the total number of sessions to allow: completed and partial.',
  periodStartTime datetime  NOT NULL  COMMENT 'Start time of this period. Participant sessions will be allowed when the current time is > this time. A time of 0 = the session starts immediately.',
  periodEndTime datetime  NOT NULL  COMMENT 'End time of this period. Participant sessions will be allowed when the current time is < this time. A time of 0 = the session runs forever.',
  periodAnnouncementText longtext COLLATE utf8_unicode_ci  DEFAULT NULL COMMENT 'Recruitment email text sent to periodEmailList when study opens.',
  periodEmailList longtext COLLATE utf8_unicode_ci  DEFAULT NULL COMMENT 'Comma-separated list of e-mail names',
  periodTaskSequence enum('sequential','random')   DEFAULT 'random' COMMENT 'Specifies the task order of tasks marked as programmed.',
  periodStudyVariations enum('singleRandom')   DEFAULT 'singleRandom' COMMENT 'For now. Future options could include: singleSequential,mulitpleRandom, multipleSequential, etc.)',
  periodTimeZone enum('UTC+00 Europe/London','UTC+01 Europe/Berlin','UTC+02 Europe/Kiev','UTC+03 Asia/Riyadh','UTC+03:30 Asia/Tehran','UTC+04 Europe/Moscow','UTC+04:30 Asia/Kabul','UTC+05 Indian/Maldives','UTC+05:30 Asia/Calcutta','UTC+05:45 Asia/Kathmandu','UTC+06 Indian/Chagos','UTC+06:30 Asia/Rangoon','UTC+07 Asia/Bangkok','UTC+08 Asia/Brunei','UTC+08:45 Australia/Eucla','UTC+09 Asia/Tokyo','UTC+09:30 Australia/Adelaide','UTC+10 Australia/Melbourne','UTC+10:30 Australia/Lord_Howe','UTC+11 Pacific/Pohnpei','UTC+11:30 Pacific/Norfolk','UTC+12 Asia/Kamchatka','UTC+12:45 Pacific/Chatham','UTC+13 Pacific/Tongatapu','UTC+14 Pacific/Kiritimati','UTC−01 America/Scoresbysund','UTC−02 America/Atlantic islands','UTC−03 America/Argentina/Mendoza','UTC−03:30 Canada/Newfoundland','UTC−04 America/Halifax','UTC−04:30 America/Caracas','UTC−05 America/New_York','UTC−06 America/Chicago','UTC−07 America/Denver','UTC−08 America/Los_Angeles','UTC−09 America/Anchorage','UTC−09:30 Pacific/Marquesas','UTC−10 America/Adak','UTC−11 Pacific/Midway') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'UTC−08 America/Los_Angeles' COMMENT 'Defaults to study timezone value',
  dateCreated datetime  NOT NULL  COMMENT 'The date the record was created in server local time.',
  dateModified timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP  COMMENT 'The date the record was updated in server local time.',
  PRIMARY KEY (studyPeriodId),
  UNIQUE KEY studyPeriodId (studyPeriodId),
  KEY studyPeriodId_2 (studyPeriodId),
  KEY studyId_2 (studyId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 COMMENT 'Describes when a study can accept participants.';

-- --------------------------------------------------------

--
-- Table structure for table 'study_steps'
--

DROP TABLE IF EXISTS study_steps;
CREATE TABLE IF NOT EXISTS study_steps (
  studyStepId bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Unique record ID',
  studyId bigint(20) unsigned NOT NULL  COMMENT 'Study to which this step belongs',
  stepIndex int(10) unsigned NOT NULL  COMMENT 'Step sequence',
  preTaskPageUrl varchar(1024) COLLATE utf8_unicode_ci  DEFAULT NULL COMMENT 'URL of pre-task page if used. null means dont show a pre-task page for this step.',
  preTaskPageHtml longtext COLLATE utf8_unicode_ci  DEFAULT NULL COMMENT 'HTML to show in the pre-task page',
  preTaskPageNextUrl varchar(1024) COLLATE utf8_unicode_ci  DEFAULT NULL COMMENT 'Destination of the next button on the pre-task page',
  studyTaskPageUrl varchar(1024) COLLATE utf8_unicode_ci  DEFAULT NULL COMMENT 'URL to the first page of the web page for the study task in this step. If null, this step does not have a study task.',
  defaultTaskBarRoot enum('wlux','client')   DEFAULT NULL COMMENT 'Root path of the CSS file for the task bar to show in the study page',
  taskBarCssPath varchar(1024) COLLATE utf8_unicode_ci  DEFAULT NULL COMMENT 'Path to the CSS file for the task bar. If empty, use default for study.',
  taskBarHtml longtext COLLATE utf8_unicode_ci  DEFAULT NULL COMMENT 'Text to show in the task bar on the client web siteNOTE: if submitted value does not start with an "<" character, wrap the submitted value in "<p>" tags.',
  exitButtonText varchar(255) COLLATE utf8_unicode_ci  DEFAULT NULL COMMENT 'Text to display in the exit task button. If empty, use default for study.',
  tabShowText varchar(255) COLLATE utf8_unicode_ci  DEFAULT NULL COMMENT 'Text to display in the task-bar SHOW button. If empty, use default for study.',
  tabHideText varchar(255) COLLATE utf8_unicode_ci  DEFAULT NULL COMMENT 'Text to display in the task-bar HIDE button. If empty, use default for study.',
  studyTaskReturnUrl varchar(1024) COLLATE utf8_unicode_ci  DEFAULT NULL COMMENT 'URL of the page to navigate to when the participent ends the task on the client site.',
  postTaskPageUrl varchar(1024) COLLATE utf8_unicode_ci  DEFAULT NULL COMMENT 'URL of the post-task page, if used.  null means dont show a pre-task page for this step.',
  postTaskPageHtml longtext COLLATE utf8_unicode_ci  DEFAULT NULL COMMENT 'HTML to show in the post-task page',
  postTaskPageNextUrl varchar(1024) COLLATE utf8_unicode_ci  DEFAULT NULL COMMENT 'Destination of the next button on the post-task page',
  dateCreated datetime  NOT NULL  COMMENT 'The date the record was created in server local time.',
  dateModified timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP  COMMENT 'The date the record was updated in server local time.',
  PRIMARY KEY (studyStepId),
  UNIQUE KEY studyStepId (studyStepId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table 'study_variations'
--

DROP TABLE IF EXISTS study_variations;
CREATE TABLE IF NOT EXISTS study_variations (
  studyVariationId bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Unique record ID of this variation',
  studyVariableId bigint(20) unsigned NOT NULL  COMMENT 'ID of the study variable to which this variation applies',
  variationName varchar(64) COLLATE utf8_unicode_ci NOT NULL  COMMENT 'Human-readable name of this variation',
  variationDesc longtext COLLATE utf8_unicode_ci  DEFAULT NULL COMMENT 'Free-form description of this variation',
  variationRoot enum('wlux','client')   DEFAULT 'wlux' COMMENT 'Just these for now, we can support "other" in the future)',
  variationCssPath varchar(1024) COLLATE utf8_unicode_ci NOT NULL  COMMENT 'The path from the selected root to the CSS file that defines the variation. This should probably be validated in the UI…',
  dateCreated datetime  NOT NULL  COMMENT 'The date the record was created in server local time.',
  dateModified timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP  COMMENT 'The date the record was updated in server local time.',
  PRIMARY KEY (studyVariationId),
  UNIQUE KEY studyVariationId (studyVariationId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table 'user_accounts'
--

DROP TABLE IF EXISTS `user_accounts`;
CREATE TABLE IF NOT EXISTS `user_accounts` (
  accountId bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'This is the account ID used when testing ownership',
  username varchar(64) COLLATE utf8_unicode_ci NOT NULL  COMMENT 'Account user name',
  ownerId bigint(20) unsigned NOT NULL  COMMENT 'The account that created this account',
  acctPassword varchar(512) COLLATE utf8_unicode_ci  DEFAULT NULL COMMENT 'hashed/encrypted password value; empty = no password (default)',
  firstName varchar(64) COLLATE utf8_unicode_ci NOT NULL  COMMENT 'First name',
  lastName varchar(64) COLLATE utf8_unicode_ci  DEFAULT NULL COMMENT 'Last name',
  greetingName varchar(64) COLLATE utf8_unicode_ci NOT NULL  COMMENT 'Name used on personalized pages, defaults to first name if not provided.',
  orgName varchar(255) COLLATE utf8_unicode_ci  DEFAULT NULL COMMENT 'Organizational name',
  email varchar(255) COLLATE utf8_unicode_ci NOT NULL  COMMENT 'Email of account contact',
  accountType enum('admin','researcher','reviewer')   DEFAULT 'researcher' COMMENT 'for now this is how all accounts are defined',
  wluxUrlRoot varchar(255) COLLATE utf8_unicode_ci NOT NULL  COMMENT 'The root of pages and files hosted on the WLUX server',
  clientUrlRoot varchar(255) COLLATE utf8_unicode_ci NOT NULL  COMMENT 'The default root of the server being tested (this will serve as the default value to use when defining a study)',
  userFileRoot varchar(255) COLLATE utf8_unicode_ci NOT NULL  COMMENT 'Internal file path used on server',
  userWebRoot varchar(255) COLLATE utf8_unicode_ci NOT NULL  COMMENT 'Internal file path used on server',
  defaultTimeZone enum('UTC+00 Europe/London','UTC+01 Europe/Berlin','UTC+02 Europe/Kiev','UTC+03 Asia/Riyadh','UTC+03:30 Asia/Tehran','UTC+04 Europe/Moscow','UTC+04:30 Asia/Kabul','UTC+05 Indian/Maldives','UTC+05:30 Asia/Calcutta','UTC+05:45 Asia/Kathmandu','UTC+06 Indian/Chagos','UTC+06:30 Asia/Rangoon','UTC+07 Asia/Bangkok','UTC+08 Asia/Brunei','UTC+08:45 Australia/Eucla','UTC+09 Asia/Tokyo','UTC+09:30 Australia/Adelaide','UTC+10 Australia/Melbourne','UTC+10:30 Australia/Lord_Howe','UTC+11 Pacific/Pohnpei','UTC+11:30 Pacific/Norfolk','UTC+12 Asia/Kamchatka','UTC+12:45 Pacific/Chatham','UTC+13 Pacific/Tongatapu','UTC+14 Pacific/Kiritimati','UTC−01 America/Scoresbysund','UTC−02 America/Atlantic islands','UTC−03 America/Argentina/Mendoza','UTC−03:30 Canada/Newfoundland','UTC−04 America/Halifax','UTC−04:30 America/Caracas','UTC−05 America/New_York','UTC−06 America/Chicago','UTC−07 America/Denver','UTC−08 America/Los_Angeles','UTC−09 America/Anchorage','UTC−09:30 Pacific/Marquesas','UTC−10 America/Adak','UTC−11 Pacific/Midway') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'UTC−08 America/Los_Angeles' COMMENT 'Default time zone to use for this account',
  dateCreated datetime  NOT NULL  COMMENT 'The date the record was created in server local time.',
  dateModified timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP  COMMENT 'The date the record was updated in server local time.',
  PRIMARY KEY (`accountId`),
  UNIQUE KEY `accountId` (`accountId`),
  UNIQUE KEY `username` (`username`),
  KEY `accountId_2` (`accountId`),
  KEY `username_2` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `user_accounts`
--

INSERT INTO `user_accounts` (`username`, `ownerId`, `acctPassword`, `firstName`, `lastName`, `greetingName`, `orgName`, `email`, `accountType`, `wluxUrlRoot`, `clientUrlRoot`, `userFileRoot`, `userWebRoot`, `defaultTimeZone`, `dateCreated`, `dateModified`) VALUES
('defaultAdmin', 0, '1Password', 'Default', 'Admin', 'Admin', 'IBUXL Research', 'ibuxl@example.com', 'admin', 'http://wlux.uw.edu/', 'http://wlux.uw.edu', '/User/WebLabUX', '/User/WebLabUX', 'UTC−08 America/Los_Angeles', NOW(), NOW()),
('defaultResearcher', 0, '1Password', 'Default', 'Researcher', 'Researcher', 'IBUXL Research', 'ibuxl@example.com', 'researcher', 'http://wlux.uw.edu/', 'http://wlux.uw.edu/', '/User/WebLabUX', '/User/WebLabUX', 'UTC−08 America/Los_Angeles', NOW(), NOW());

-- --------------------------------------------------------

--
-- Table structure for table 'study_measures'
--

DROP TABLE IF EXISTS study_measures;
CREATE TABLE IF NOT EXISTS study_measures (
  studyMeasureId bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'primary key',
  studyId bigint(20) unsigned NOT NULL  COMMENT 'relational link to study id',
  measureId int(10) unsigned NOT NULL  COMMENT 'Relative index of this measure',
  variableType enum('participantCount','taskTime')  NOT NULL  COMMENT 'Just to name a few... Each ENUM will have its own computation and validation algorithm',
  dataType enum('string','integer','float','date','time')  NOT NULL  COMMENT 'Data type returned by this variable',
  displayUnits varchar(64) COLLATE utf8_unicode_ci NOT NULL  COMMENT 'Units to display with this value (if any)',
  computeBy enum('task','participant','session','study')  NOT NULL  COMMENT 'How to summarize or calculate this measure',
  displayBy enum('task','participant','session','study')  NOT NULL  COMMENT 'How to display this measure in a report',
  dateCreated datetime  NOT NULL  COMMENT 'The date the record was created in server local time.',
  dateModified timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP  COMMENT 'The date the record was updated in server local time.',
  PRIMARY KEY (`studyMeasureId`),
  UNIQUE KEY `studyMeasureId` (`studyMeasureId`),
  KEY `studyMeasureId_2` (`studyMeasureId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


-- --------------------------------------------------------

--
-- Table structure for table 'study_variables'
--

DROP TABLE IF EXISTS study_variables;
CREATE TABLE IF NOT EXISTS study_variables (
  studyVariableId bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key -- This table holds Independent Variables. Each record in this table has a one to many relation with study_variations which holds the LEVELS for each IV in this table',
  studyId bigint(20) unsigned NOT NULL  COMMENT 'Relation back to the study, defined in "study_general:studyId". A study can have from one to many variables.',
  variableName varchar(64) COLLATE utf8_unicode_ci NOT NULL  COMMENT 'The human-readable name of this Independent Variable (e.g., "menu style" or "color scheme")',
  dateCreated datetime  NOT NULL  COMMENT 'The date the record was created in server local time.',
  dateModified timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP  COMMENT 'The date the record was updated in server local time.',
  PRIMARY KEY (`studyVariableId`),
  UNIQUE KEY `studyVariableId` (`studyVariableId`),
  KEY `studyVariableId_2` (`studyVariableId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table 'study_step_details'
--

DROP TABLE IF EXISTS study_step_details;
CREATE TABLE IF NOT EXISTS study_step_details (
  studyStepDetailId bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Unique record ID',
  studyStepId bigint(20) unsigned NOT NULL  COMMENT 'ID of study step to which this record relates',
  detailType enum('measure','variable','variation')  NOT NULL  COMMENT 'detail type (describes to what detailId refers)',
  detailId bigint(20) unsigned NOT NULL  COMMENT 'ID in corresponding table',
  PRIMARY KEY (`studyStepDetailId`),
  UNIQUE KEY `studyStepDetailId` (`studyStepDetailId`),
  KEY `studyStepDetailId_2` (`studyStepDetailId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;