<?php
function _gratuity_get_study ($link, $authInfo, $logData, $debugState) {
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
	// validate the user's access
	if ($authInfo['access'] != $AUTH_ADMIN) {
		if (($authInfo['access'] & $AUTH_READ) != $AUTH_READ) {
			$errData = get_error_message ($link, 401);
			$response['error'] = $errData;
		}
	} 
	
	if (empty($response['error'])) {
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
			
			$fieldName = 'periodName';
			if (empty($logData[$fieldName])) {
				$localErr['fields'][$fieldName] = "Missing";
			} else {
				// TODO: This should also make sure the periodName is valid
				// if valid, assign to local variable
				$periodName = $logData[$fieldName];
			}
			
			// if not an admin, limit the query to the records they own
			if (!empty($studyId) && ($authInfo['access'] != $AUTH_ADMIN) && 
				(get_study_owner ($studyId) != $authInfo['account']['accountId'])) {
				$localErr = get_error_message ($link, 401);
				$localErr['fields']['studyId'] = "This is not a study you can access.";
				$response['error'] = $localErr;
				$response['debug']['auth'] = $authInfo;
			}
			
			// if there was an error, return it, otherwise add the record
			if (!empty($localErr)) {
				if (empty($response['error'])) {
					$errData = get_error_message ($link, 400);
					$errData['requestError'] = $localErr;
					$response['error'] = $errData;
				}
			} else {
				// read conifguration for this study and condition
				$queryString = 'SELECT studyId, periodName, email, comments FROM '.DB_TABLE_GRATUITY_LOG.
					' WHERE studyId = '.$studyId.' AND periodName = "'.$periodName.'"';
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
					$localErr = get_error_message ($link, 404);
					$localErr['info'] = 'No gratuity records found for the specified study and study period';
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
			$errData = get_error_message ($link, 400);
			$errData['info'] = 'No data in request.';
			$response['error'] = $errData;
		}
	}
	return $response;
}
?>