<?php 
require 'config_files.php';
require 'int_debug.php';
require 'int_get_message.php';
require 'debug_get.php';
require 'debug_post.php';

$response = '';

$link = @mysqli_connect($DB_SERVER, $DB_USER, $DB_PASS, $DB_DATABASE_NAME);
if (!$link) {
	require 'response_500_db_open_error.php';
} else {
	$debugState = int_GetDebug($link, 'gratuity', '');
	if ($_SERVER['REQUEST_METHOD'] == 'GET') {
		// if the data is not in the the post form, try the query string		
		if (empty($postData)) {
			$postData = $_GET;
		} 		
		$response = _debug_get($link, $postData);
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
		$response = _debug_post($link, $postData);
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