<?php 
require 'config_files.php';
require 'int_debug.php';
require 'int_auth.php';
require 'int_get_message.php';
require 'account_get.php';
require 'account_post.php';
require 'account_put.php';
require 'account_delete.php';

$response = '';

$link = @mysqli_connect(DB_SERVER, DB_USER, DB_PASS, DB_DATABASE_NAME);
if (!$link) {
	require 'response_500_db_open_error.php';
} else {
	$debugState = int_GetDebug($link, 'account', '');
	$postData = '';
	$authInfo = authorize_user ($link);
	$response['debug']['auth'] = $authInfo;
	if ($_SERVER['REQUEST_METHOD'] == 'GET') {
		// if the data is not in the the post form, try the query string		
		if (empty($postData)) {
			$postData = $_GET;
		} 		
		$response = _account_get($link, $authInfo, $postData);
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
		$response = _account_post($link, $authInfo, $postData);
	} else if ($_SERVER['REQUEST_METHOD'] == 'PUT') {
		$postData = json_decode(file_get_contents('php://input'), true);
			// if the data is not in the raw post data, try the post form
		if (empty($postData)) {
			$postData = $_POST;
		}
		if (empty($postData)) {
			$postData = $_GET;
		}
		$response = _account_put($link, $authInfo, $postData);
	} else if ($_SERVER['REQUEST_METHOD'] == 'DELETE') {
		// get the request data
		$postData = json_decode(file_get_contents('php://input'), true);
		// if the data is not in the raw post data, try the post form
		if (empty($postData)) {
			$postData = $_POST;
		}
		if (empty($postData)) {
			$postData = $_GET;
		} 
		$response = _account_delete($link, $authInfo, $postData);
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