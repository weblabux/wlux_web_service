<?php
function _gratuity_post_gratuity ($link, $logData, $debugState) {
require 'config_files.php';
require 'db_utils.php';
	// initialize the response buffer
	$response = '';
	// initialize the debug values
	if ($debugState) {
		$response['debug']['module'] = __FILE__;
		$response['debug']['cmdData'] = $logData;
	}
    // validate the request buffer fields
	if (!empty($logData)) {
		$localErr = '';
		$fieldName = 'studyId';
		if (empty($logData[$fieldName])) {
			$localErr['fields'][$fieldName] = "Missing";
		} else {	
			if (!is_numeric($logData[$fieldName])) {
				$localErr['fields'][$fieldName] =  "Must be a number";
			}
			// TODO: This should also make sure the studyID is valid
		}
		
		$fieldName = 'sessionName';
		if (empty($logData[$fieldName])) {
			$localErr['fields'][$fieldName] = "Missing";
		} else {
			// TODO: This should also make sure the sessionName is valid
		}
		
		$fieldName = 'email';
		if (empty($logData[$fieldName])) {
			$localErr['fields'][$fieldName] = "Missing";
		}
		
		$fieldName = 'comments'; // don't check--it's optional
		if (empty($logData[$fieldName])) {
			// so add it to the structure 
			$logData[$fieldName] = '';
		}
		
		// if there was an error, return it, otherwise add the record
		if (!empty($localErr)) {
			$errData['status'] = 400;
			$errData['message'] = 'Bad request';
			$errData['requestError'] = $localErr;
			$response['error'] = $errData;
		} else {
			// create a new gratuity_log record 
				
			$queryString = format_object_for_SQL_insert ($DB_TABLE_GRATUITY_LOG, $logData);
			$qResult = mysqli_query($link, $queryString);
			if (!$qResult) {
				// SQL ERROR
				$errData['status'] = 500;
				$errData['message'] = 'Error writing gratuity entry.';
			} else {
				// success
				// finish start response buffer
				$response['data'] = $logData;
			}
			if ($debugState) {
				// write detailed sql info
				$localErr = '';
				$localErr['sqlQuery'] = $queryString;
				$localErr['sqlError'] =  mysqli_sqlstate($link);
				$localErr['message'] = mysqli_error($link);				
				$response['debug']['sqlInsert1']= $localErr;
			}
		}
	} else {
		$errData['status'] = 400;
		$errData['message'] = 'Bad request';
		$errData['info'] = 'No data in request.';
		$response['error'] = $errData;
	}
	
	return $response;
}
?>