<?php
function get_error_message () {
require 'config_files.php';
 	$retVal = '';
	$args = func_get_args();
	
	if (!empty($args[0])){
		$link = $args[0];
	} else {
		$retVal['status'] = 0;
		$retVal['message'] = 'Database link not passed to get_error_message';
	}
	
	if (!empty($args[1])) {
		$status = $args[1];
	} else {
		$retVal['status'] = 0;
		$retVal['message'] = 'Status value not passed to get_error_message';
	}
	
	if (!empty($args[2])) {
		$variation = $args[2];
	} else {
		$variation = 0;
	}
		
	if (!empty($args[3])) {
		$language = $args[3];
	} else {
		$language = 'en-US';
	}
	
	if (empty($retVal)) {				
		$queryString = 'SELECT status, message from '.$DB_ERROR_MESSAGES.
			' WHERE status = '.$status.
			' AND variation = "'.$variation.
			'" AND language = "'.$language.'"';
		$result = @mysqli_query ($link, $queryString);
		if (mysqli_num_rows($result)  > 0) {
			// should be only 1, but if more than one, take the first one
			$retVal = mysqli_fetch_assoc($result);
			// convert string value to integer before returning
			$retVal['status'] = intval($retVal['status']);
		} else {
			$retVal['status'] = 0;
			$retVal['message'] = 'Unable to get error message from message database';
		}
	}
	return $retVal;
}
?>