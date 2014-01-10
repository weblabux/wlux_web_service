<?php

/* require files for each command that supports this method */

function _signin_post($link, $postData) {
require 'config_files.php';
	$debugState = int_GetDebug($link, 'signin', 'POST');
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
	$username = '';
	$password = '';
	if (!empty($postData['signIn'])) {
		if (!empty($postData['signIn']['username'])) {
			$username = $postData['signIn']['username'];
		}
		if (!empty($postData['signIn']['password'])) {
			$password = $postData['signIn']['password'];
		}
	} else {
		// unrecognized command
		$thisFile = __FILE__;
		require 'response_501.php';
	}
	
	if (!empty($username) && !empty($password)) {
		$queryString = 'SELECT username, recordSeq AS accountId, ownerId, acctPassword AS password FROM '.DB_TABLE_USER_ACCOUNTS.
			' WHERE username = "'.$username.'" AND acctPassword = "'.$password.'"';
		$result = @mysqli_query ($link, $queryString);
		if (mysqli_num_rows($result)  > 0) {
			$userInfo = mysqli_fetch_assoc($result);
			// make the token
			$tokenString = $userInfo['username'].':'.$userInfo['password'];
			$tokenValue = base64_encode ($tokenString);
			// package up the response value
			$response['data']['username'] = $userInfo['username'];
			$response['data']['accountId'] = $userInfo['accountId'];
			$response['data']['token'] = $tokenValue;
			if ($debugState) {
				$response['debug']['module'] = __FILE__;
				$response['debug']['postData'] = $postData;
				$response['debug']['query']['queryString'] = $queryString;
				$response['debug']['query']['response'] = $result;
				$response['debug']['query']['record'] = $userInfo;				
			}
		} else {
			// account not found
			$errData = get_error_message ($link, 401);
			$response['error'] = $errData;
			if ($debugState) {
				$response['debug']['module'] = __FILE__;
				$response['debug']['postData'] = $postData;
				$response['debug']['query']['queryString'] = $queryString;
				$response['debug']['query']['response'] = $result;
			}
		}
		$actionTaken = true;
	} else {
		// bad request
		$errData = get_error_message ($link, 400);
		$response['error'] = $errData;
		if ($debugState) {
			$response['debug']['module'] = __FILE__;
			$response['debug']['postData'] = $postData;
		}		
	}

	return $response;
}
?>