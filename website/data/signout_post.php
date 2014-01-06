<?php

/* require files for each command that supports this method */

function _signout_post($link, $postData) {
	$debugState = int_GetDebug($link, 'signout', 'POST');
	$actionTaken = false;
	/*
	* Repeat for each command that supports this method.
	*  only one method allowed per call.
	* 1. define $action to the the command
	* 2. Test for that command
	* 3. if true, call the function that performs the command
	$action = 'config';
	if (!$actionTaken && (!empty($postData[$action])) {
		$logData = $postData[$action];
		$response = _study_get_config ($link, $logData);
		$actionTaken = true;
    } 
	*/
	if (!$actionTaken) {
		$thisFile = __FILE__;
		require 'response_501.php';
	}
	
	return $response;
}
?>