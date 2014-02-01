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
require 'config_files.php';
require 'int_debug.php';
require 'int_auth.php';
require 'int_get_message.php';
require 'session_get.php';
require 'session_post.php';

$response = '';

$link = @mysqli_connect(DB_SERVER, DB_USER, DB_PASS, DB_DATABASE_NAME);
if (!$link) {
	require 'response_500_db_open_error.php';
} else {
	$debugState = int_GetDebug($link, 'gratuity', '');
	$postData = '';
	$authInfo = authorize_user ($link);
	$response['debug']['auth'] = $authInfo;
	if ($_SERVER['REQUEST_METHOD'] == 'GET') {
		// if the data is not in the the post form, try the query string		
		if (empty($postData)) {
			$postData = $_GET;
		} 		
		$response = _session_get($link, $authInfo, $postData);
	} else if ($_SERVER['REQUEST_METHOD'] == 'POST') {
		// get the request data
		if (!empty($HTTP_RAW_POST_DATA)) {
			$postData = json_decode($HTTP_RAW_POST_DATA,true);
		}		
		// if the data is not in the raw post data, try the post form
		if (empty($postData)) {
			$postData = $_POST;
		}
		if (empty($postData)) {
			$postData = $_GET;
		} 
		$response = _session_post($link, $authInfo, $postData);
	} else {
		// method not supported
		$errData = get_error_message ($link, 405);
		$response['error'] = $errData;
		if ($debugState) {
			$response['debug']['module'] = __FILE__;
		}
	}
	mysqli_close($link);
}

require 'format_response.php';
print ($fnResponse);
?>