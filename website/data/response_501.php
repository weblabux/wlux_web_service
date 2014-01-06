<?php
// unrecognized command
$errData['status'] = 501;
$errData['message'] = 'Command not recognized.';
$response['error'] = $errData;
if ($debugState) {
	// return debug info
	if (empty($thisFile)) {$thisFile = __FILE__;}
	$dbgData['module'] = $thisFile;
	$dbgData['postData'] = $postData;
	$dbgData['getData'] = $_GET;
	$response['debug'] = $dbgData;
}
?>