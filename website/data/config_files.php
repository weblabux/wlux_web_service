<?php
/*
 *  The MIT License (MIT)
 *  
 *  Copyright (c) 2014 Internet-Based User Experience Lab, HCDE, University at Washington
 *  
 *  Permission is hereby granted, free of charge, to any person obtaining a copy
 *  of this software and associated documentation files (the "Software"), to deal
 *  in the Software without restriction, including without limitation the rights
 *  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 *  copies of the Software, and to permit persons to whom the Software is
 *  furnished to do so, subject to the following conditions:
 *  
 *  The above copyright notice and this permission notice shall be included in
 *  all copies or substantial portions of the Software.
 *  
 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 *  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 *  THE SOFTWARE.
 */
 if (!defined('WLUX_DATA_SERVICE_CONSTANTS')) {
	define('WLUX_DATA_SERVICE_CONSTANTS', 'data_service_constants', false);

	// Contains paths to files and folders shared by the 
	//  php scripts on the server.	
	// database interfaces
	define('DB_SERVER', 'localhost', false);
	define('DB_USER', 'db_test', false);
	define('DB_PASS', 'WeCantDecide2', false);
	define('DB_DATABASE_NAME', 'wlux_services', false);

    define('DB_TABLE_DEBUG', 'debug', false);
    define('DB_TABLE_GRATUITY_LOG', 'log_gratuity', false);
    define('DB_TABLE_TRANSITION_LOG', 'log_transition', false);
	
    define('DB_TABLE_SESSION_LOG', 'log_session', false);
    define('DB_TABLE_SESSION_STEP_CONFIG', 'session_step_config', false);
    define('DB_TABLE_SESSION_VARIATIONS', 'session_variations', false);
    define('DB_TABLE_SESSION_MEASURES', 'session_measures', false);
    define('DB_TABLE_SESSION_VARIABLES', 'session_variables', false);
	
    define('DB_TABLE_STUDY_GENERAL', 'study_general', false);
    define('DB_TABLE_STUDY_PERIODS', 'study_periods', false);
    define('DB_TABLE_STUDY_STEPS', 'study_steps', false);
    define('DB_TABLE_STUDY_VARIATIONS', 'study_variations', false);
    define('DB_TABLE_STUDY_MEASURES', 'study_measures', false);
    define('DB_TABLE_STUDY_VARIABLES', 'study_variables', false);
    define('DB_TABLE_STUDY_STEP_DETAILS', 'study_step_details', false);

    define('DB_TABLE_USER_ACCOUNTS', 'accounts', false);
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
