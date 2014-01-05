<?php
function _log_get_study ($link, $logData, $debugState) {
require 'config_files.php';
    // not implemented
	$errData['status'] = 501;
	$errData['message'] = 'Command not implemented.';
	if ($debugState) {
		// return debug info
		$errData['module'] = __FILE__;
		$errData['cmdData'] = $logData;
	}
	
	if (!empty($errData)) {
		$response['error'] = $errData;
	}
	
	return $response;
}
?>