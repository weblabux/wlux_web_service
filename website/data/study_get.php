<?php

/* require files for each command that supports this method */
require 'study_get_allstudyids.php';
require 'study_get_config.php';
require 'study_get_name.php';
require 'study_get_schedule.php';
require 'study_get_studyelements.php';
require 'study_get_task.php';
require 'study_get_variable.php';


function _study_get($link, $postData) {
	$debugState = int_GetDebug($link, 'study', 'GET');
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
		$response = _study_get_config ($link, $logData, $debugState);
		$actionTaken = true;
    } 
	*/
	$action = 'allStudyIds';
	if (!$actionTaken && (!empty($postData[$action]))) {
		$logData = $postData[$action];
		$response = _study_get_allStudyIds ($link, $logData, $debugState);
		$actionTaken = true;
    } 
	$action = 'config';
	if (!$actionTaken && (!empty($postData[$action]))) {
		$logData = $postData[$action];
		$response = _study_get_config ($link, $logData, $debugState);
		$actionTaken = true;
    } 
	$action = 'name';
	if (!$actionTaken && (!empty($postData[$action]))) {
		$logData = $postData[$action];
		$response = _study_get_name ($link, $logData, $debugState);
		$actionTaken = true;
    } 
	$action = 'schedule';
	if (!$actionTaken && (!empty($postData[$action]))) {
		$logData = $postData[$action];
		$response = _study_get_schedule($link, $logData, $debugState);
		$actionTaken = true;
    } 
	$action = 'studyElements';
	if (!$actionTaken && (!empty($postData[$action]))) {
		$logData = $postData[$action];
		$response = _study_get_studyElements ($link, $logData, $debugState);
		$actionTaken = true;
    } 
	$action = 'task';
	if (!$actionTaken && (!empty($postData[$action]))) {
		$logData = $postData[$action];
		$response = _study_get_task ($link, $logData, $debugState);
		$actionTaken = true;
    } 
	$action = 'variable';
	if (!$actionTaken && (!empty($postData[$action]))) {
		$logData = $postData[$action];
		$response = _study_get_variable ($link, $logData, $debugState);
		$actionTaken = true;
    } 
	if (!$actionTaken) {
		$thisFile = __FILE__;
		require 'response_501.php';
	}

	return $response;
}
?>