<?php
function _gratuity_get_study ($link, $logData, $debugState) {
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
			// if valid, assign to local variable
			$studyId = $logData[$fieldName];
		}
		
		$fieldName = 'sessionName';
		if (empty($logData[$fieldName])) {
			$localErr['fields'][$fieldName] = "Missing";
		} else {
			// TODO: This should also make sure the sessionName is valid
			// if valid, assign to local variable
			$sessionName = $logData[$fieldName];
		}
		
		// if there was an error, return it, otherwise add the record
		if (!empty($localErr)) {
			$errData['status'] = 400;
			$errData['message'] = 'Bad request';
			$errData['requestError'] = $localErr;
			$response['error'] = $errData;
		} else {
			// read conifguration for this study and condition
			$queryString = 'SELECT studyId, sessionName, email, comments FROM '.$DB_TABLE_GRATUITY_LOG.
				' WHERE studyId = '.$studyId.' AND sessionName = "'.$sessionName.'"';
			$result = @mysqli_query ($link, $queryString);
			$idx = 0;
			if (mysqli_num_rows($result)  > 0) {
				while ($thisRecord = mysqli_fetch_assoc($result))  {
					$response['data'][$idx] = array_merge($thisRecord);
					foreach ($response['data'][$idx] as $k => $v) {
						// set "null" strings to null values
						if ($v == 'NULL') {
							$response['data'][$k] = NULL;
						}
					}
					$idx += 1;
				}
			}
			if ($idx == 0) {
				$localErr = '';
				$localErr['status'] = 404;
				$localErr['message'] = 'No gratuity records found';
				$response['error'] = $localErr;
			}
			if ($debugState) {
				// write detailed sql info
				$localErr = '';
				$localErr['sqlQuery'] = $queryString;
				$localErr['sqlError'] =  mysqli_sqlstate($link);
				$localErr['message'] = mysqli_error($link);				
				$response['debug']['sqlSelect1']= $localErr;
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