<?php

/* require files for each command that supports this method */
require 'account_post_user.php';
require 'account_post_changepassword.php';

function _account_post($link, $authInfo, $postData) {
	$debugState = int_GetDebug($link, 'account', 'POST');
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
		$response = _account_post_config ($link, $logData, $debugState);
		$actionTaken = true;
    } 
	*/
	$action = 'user';
	if (!$actionTaken && (!empty($postData[$action]))) {
		$logData = $postData[$action];
		$response = _account_post_user ($link, $authInfo, $logData, $debugState);
		$actionTaken = true;
    }
	$action = 'changePassword';
	if (!$actionTaken && (!empty($postData[$action]))) {
		$logData = $postData[$action];
		$response = _account_post_changepassword ($link, $authInfo, $logData, $debugState);
		$actionTaken = true;
    }
	if (!$actionTaken) {
		$thisFile = __FILE__;
		require 'response_501.php';
	}
	
	return $response;
}
?>