<?php
	// Contains paths to files and folders shared by the 
	//  php scripts on the server.	
	// database interfaces
	$DB_SERVER = 'localhost';
	$DB_USER = 'db_test';
	$DB_PASS = 'WeCantDecide2';
	$DB_DATABASE_NAME = 'wlux_services';
/*	
	$DB_TABLE_OPEN_LOG = 'log_open';
	$DB_TABLE_TRANSITION_LOG = 'log_transition';
	$DB_TABLE_SESSION_CONFIG = 'session_config';
	$DB_TABLE_STUDY_CONFIG = 'study_config';
	$DB_TABLE_SESSION_LOG = 'session_log';
*/
	$DB_TABLE_USER_ACCOUNTS = 'user_accounts';
	$DB_TABLE_GRATUITY_LOG = 'gratuity_log';
	
    $DB_ERROR_MESSAGES = 'error_messages';
	
	//Authorization and access contstants
	
	$AUTH_NOT_AUTHORIZED = 0;
	$AUTH_READ = 1;
	$AUTH_WRITE = 2;
	$AUTH_UPDATE = 4;
	$AUTH_DELETE = 8;
	$AUTH_ALL = 15;
	$AUTH_ADMIN = -1;

?>
