<?php
function _account_delete_user ($link, $authInfo, $logData, $debugState) {
require 'config_files.php';
require 'db_utils.php';
	// initialize the response buffer
	$response = '';
	// initialize the debug values
	if ($debugState) {
		$response['debug']['module'] = __FILE__;
		$response['debug']['cmdData'] = $logData;
		$response['debug']['auth'] = $authInfo;
	}
    // not implemented
	$errData = get_error_message ($link, 501);
	$response['error'] = $errData;
	
	return $response;
}
?>