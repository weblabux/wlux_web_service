<?php

/* require files for each command that supports this method */
require 'session_post_start.php';
require 'session_post_finishcurrenttask.php';
require 'session_post_startnexttask.php';

function _session_post ($link, $postData) {
	$debugState = int_GetDebug($link, 'session', 'POST');
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
		$response = _session_post_config ($link, $logData, $debugState);
		$actionTaken = true;
    } 
	*/
	$action = 'start';
	if (!$actionTaken && (!empty($postData[$action]))) {
		$logData = $postData[$action];
		$response = _session_post_start ($link, $logData, $debugState);
		$actionTaken = true;
    } 
	$action = 'startNextTask';
	if (!$actionTaken && (!empty($postData[$action]))) {
		$logData = $postData[$action];
		$response = _session_post_startnexttask ($link, $logData, $debugState);
		$actionTaken = true;
    } 
	$action = 'finishCurrentTask';
	if (!$actionTaken && (!empty($postData[$action]))) {
		$logData = $postData[$action];
		$response = _session_post_finishcurrenttask ($link, $logData, $debugState);
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