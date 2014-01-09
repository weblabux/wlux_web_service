<?php
function _gratuity_post_gratuity ($link, $authInfo, $logData, $debugState) {
require 'config_files.php';
require 'db_utils.php';
	// initialize the response buffer
	$response = '';
	// initialize the debug values
	if ($debugState) {
		$response['debug']['module'] = __FILE__;
		$response['debug']['cmdData'] = $logData;
	}
	// validate the user's access
	//  ** No access restrictions for this method
	//

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
		
		$fieldName = 'periodName';
		if (empty($logData[$fieldName])) {
			$localErr['fields'][$fieldName] = "Missing";
		} else {
			// TODO: This should also make sure the periodName is valid
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
			$errData = get_error_message ($link, 400);
			$errData['requestError'] = $localErr;
			$response['error'] = $errData;
		} else {
			// create a new gratuity_log record 
				
			$queryString = format_object_for_SQL_insert (DB_TABLE_GRATUITY_LOG, $logData);
			$qResult = mysqli_query($link, $queryString);
			if (!$qResult) {
				// SQL ERROR
				$errData = get_error_message ($link, 500, 1);
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
		$errData = get_error_message ($link, 400);
		$errData['info'] = 'No data in request.';
		$response['error'] = $errData;
	}
	
	return $response;
}
?>