<?php

/* require files for each command that supports this method */
require 'gratuity_get_study.php';

function _gratuity_get($link, $postData) {
	$debugState = int_GetDebug($link, 'gratuity', 'GET');
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
		$response = _gratuity_get_config ($link, $logData, $debugState);
		$actionTaken = true;
    } 
	*/
	$action = 'study';
	if (!$actionTaken && (!empty($postData[$action]))) {
		$logData = $postData[$action];
		$response = _gratuity_get_study ($link, $logData, $debugState);
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