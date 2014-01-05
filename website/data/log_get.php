<?php

/* require files for each command that supports this method */
require 'log_get_allstudies.php';
require 'log_get_session.php';
require 'log_get_sessions.php';
require 'log_get_study.php';

function _log_get($link, $postData) {
	$debugState = int_GetDebug($link, 'log', 'GET');
	$actionTaken = false;
	/*
	* Repeat for each command that supports this method.
	*  only one method allowed per call.
	* 1. define $action to the the command
	* 2. Test for that command
	* 3. if true, call the function that performs the command
	$action = 'config';
	if (!$actionTaken && (!empty($postData[$action]))) {
		$logData = $postData[$action];
		$response = _log_get_config ($link, $logData, $debugState);
		$actionTaken = true;
    } 
	*/
	$action = 'allStudies';
	if (!$actionTaken && (!empty($postData[$action]))) {
		$logData = $postData[$action];
		$response = _log_get_allstudies ($link, $logData, $debugState);
		$actionTaken = true;
    } 
	$action = 'session';
	if (!$actionTaken && (!empty($postData[$action]))) {
		$logData = $postData[$action];
		$response = _log_get_session ($link, $logData, $debugState);
		$actionTaken = true;
    } 
	$action = 'sessions';
	if (!$actionTaken && (!empty($postData[$action]))) {
		$logData = $postData[$action];
		$response = _log_get_sessions ($link, $logData, $debugState);
		$actionTaken = true;
    } 
	$action = 'study';
	if (!$actionTaken && (!empty($postData[$action]))) {
		$logData = $postData[$action];
		$response = _log_get_study ($link, $logData, $debugState);
		$actionTaken = true;
    } 
	if (!$actionTaken) {
	// unrecognized command
		$errData['status'] = 501;
		$errData['message'] = 'Command not recognized.';
		if ($debugState) {
			// return debug info
			$errData['module'] = __FILE__;
			$errData['postData'] = $postData;
			$errData['getData'] = $_GET;
		}
		// $errData['globals'] = $GLOBALS;
		$response['error'] = $errData;
	}
	return $response;
}
?>