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

function _signup_post($link, $postData) {
require 'config_files.php';
	$debugState = int_GetDebug($link, 'signup', 'POST');
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
	/* 
	    TODO: Refactor these variables to an array that will work with 
	          the format_object_for_SQL_insert function in db_utils.php
	*/
	$username = '';
	$password = '';
	$lastname = '';
	$firstname = '';
	$email = '';
	if (!empty($postData['signUp'])) {
		if (!empty($postData['signUp']['username'])) {
			$username = $postData['signUp']['username'];
		}
		if (!empty($postData['signUp']['password'])) {
			$password = $postData['signUp']['password'];
		}
		if (!empty($postData['signUp']['lastname'])) {
			$lastname = $postData['signUp']['lastname'];
		}
		if (!empty($postData['signUp']['firstname'])) {
			$firstname = $postData['signUp']['firstname'];
		}
		if (!empty($postData['signUp']['email'])) {
			$email = $postData['signUp']['email'];
		}
	} else {
		// unrecognized command
		$thisFile = __FILE__;
		require 'response_501.php';
	}
	/*
		TODO: refactor this code to use format_object_for_SQL_insert 
		      from db_utils.php
	*/
	/* insert into user_accounts (username, acctPassword, firstName, lastName, email) values ("kim", "1Password", "kimyen", "truong", "kimyen@uw.edu");*/
	if (!empty($username) && !empty($password) && !empty($firstname) && !empty($lastname) && !empty($email)) {
		$queryString = 'INSERT INTO '.DB_TABLE_USER_ACCOUNTS .'(username, acctPassword, firstName, lastName, email) VALUES ("'.$username.'", "'.$password.'", "'.$firstname.'", "'.$lastname.'", "'.$email.'")';
		$result = @mysqli_query ($link, $queryString);
		if ($result) {
			$response['data']['status'] = 200;
			$response['data']['message'] = "success";
		} else {
			// cannot insert
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