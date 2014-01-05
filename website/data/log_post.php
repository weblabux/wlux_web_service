<?php

/* require files for each command that supports this method */
require 'log_post_load.php';
require 'log_post_transition.php';

function _log_post($link, $postData) {
	$debugState = int_GetDebug($link, 'log', 'POST');
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
		$response = _log_post_config ($link, $logData, $debugState);
		$actionTaken = true;
    } 
	*/
	$action = 'load';
	if (!$actionTaken && (!empty($postData[$action]))) {
		$logData = $postData[$action];
		$response = _log_post_load ($link, $logData, $debugState);
		$actionTaken = true;
    } 
	$action = 'transition';
	if (!$actionTaken && (!empty($postData[$action]))) {
		$logData = $postData[$action];
		$response = _log_post_transition ($link, $logData, $debugState);
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