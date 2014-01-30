<?php
/*
 *  The MIT License (MIT)
 *  
 *  Copyright (c) 2014 Internet-Based User Experience Lab, HCDE, University at Washington
 *  
 *  Permission is hereby granted, free of charge, to any person obtaining a copy
 *  of this software and associated documentation files (the "Software"), to deal
 *  in the Software without restriction, including without limitation the rights
 *  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 *  copies of the Software, and to permit persons to whom the Software is
 *  furnished to do so, subject to the following conditions:
 *  
 *  The above copyright notice and this permission notice shall be included in
 *  all copies or substantial portions of the Software.
 *  
 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 *  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 *  THE SOFTWARE.
 */
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