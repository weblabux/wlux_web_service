<?php

/* require files for each command that supports this method */
require 'gratuity_post_gratuity.php';

function _gratuity_post($link, $postData) {
	$debugState = int_GetDebug($link, 'gratuity', 'POST');
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
		$response = _gratuity_post_config ($link, $logData, $debugState);
		$actionTaken = true;
    } 
	*/
	$action = 'gratuity';
	if (!$actionTaken && (!empty($postData[$action]))) {
		$logData = $postData[$action];
		$response = _gratuity_post_gratuity ($link, $logData, $debugState);
		$actionTaken = true;
    } 
	if (!$actionTaken) {
		$thisFile = __FILE__;
		require 'response_501.php';
	}

	return $response;
}
?>