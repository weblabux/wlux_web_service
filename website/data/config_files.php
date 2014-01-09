<?php
if (!defined('WLUX_DATA_SERVICE_CONSTANTS')) {
	define('WLUX_DATA_SERVICE_CONSTANTS', 'data_service_constants', false);

	// Contains paths to files and folders shared by the 
	//  php scripts on the server.	
	// database interfaces
	define('DB_SERVER', 'localhost', false);
	define('DB_USER', 'db_test', false);
	define('DB_PASS', 'WeCantDecide2', false);
	define('DB_DATABASE_NAME', 'wlux_services', false);
	
	define('DB_TABLE_STUDY_VARIATIONS', 'study_variations',false);
	define('DB_TABLE_STUDY_TASKS', 'study_tasks',false);
	define('DB_TABLE_STUDY_SCHEDULE', 'study_schedule', false);
	define('DB_TABLE_STUDY_GENERAL', 'study_general',false);
	define('DB_TABLE_SESSION_LOG',  'session_log',false);
	define('DB_TABLE_SESSION_CONFIG', 'session_config', false);
	define('DB_TABLE_TRANSITION_LOG', 'log_transition', false);
	define('DB_TABLE_DEBUG', 'debug', false);
	define('DB_TABLE_USER_ACCOUNTS', 'user_accounts', false);
	define('DB_TABLE_GRATUITY_LOG', 'gratuity_log', false);
	
}
/*	
	$DB_TABLE_OPEN_LOG = 'log_open';
	$DB_TABLE_STUDY_CONFIG = 'study_config';
*/
	
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
