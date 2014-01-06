<?php
// unrecognized command
$errData = get_error_message ($link, 501, 1);
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