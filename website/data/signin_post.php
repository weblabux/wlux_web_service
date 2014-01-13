<?php
/*
 *  The MIT License (MIT)
 *  
 *  Copyright (c) 2014 Internet-Based User Experience Lab, HCDE, University at Washington
 *  
 *  Permission is hereby granted, free of charge, to any person obtaining a copy
 *  of this software and associated documentation files (the "Software"), to deal
 *  in the Software without restriction, including without limitation the rights
 *  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 *  copies of the Software, and to permit persons to whom the Software is
 *  furnished to do so, subject to the following conditions:
 *  
 *  The above copyright notice and this permission notice shall be included in
 *  all copies or substantial portions of the Software.
 *  
 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 *  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 *  THE SOFTWARE.
 */
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