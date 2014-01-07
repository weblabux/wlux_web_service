<?php

/* require files for each command that supports this method */
require 'gratuity_get_study.php';

function _gratuity_get($link, $authInfo, $postData) {
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
		$response = _gratuity_get_study ($link, $authInfo, $logData, $debugState);
		$actionTaken = true;
    } 
	if (!$actionTaken) {
		$thisFile = __FILE__;
		require 'response_501.php';
	}

	return $response;
}
?>