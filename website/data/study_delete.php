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
/* require files for each command that supports this method */
require 'study_delete_general.php';
require 'study_delete_measure.php';
require 'study_delete_period.php';
require 'study_delete_step.php';
require 'study_delete_variable.php';
require 'study_delete_variation.php';

function _study_delete($link, $authInfo, $postData) {
	$debugState = int_GetDebug($link, 'study', 'DELETE');
	if ($debugState) {
		$response['debug']['module'] = __FILE__;
		$response['debug']['postData'] = $postData;
		$response['debug']['auth'] = $authInfo;
	}	
	$actionTaken = false;
	/*
	* Repeat for each command that supports this method.
	*  only one method allowed per call.
	* 1. define $action to the the command
	* 2. Test for that command
	* 3. if true, call the function that performs the command
	$action = 'config';
	if (!$actionTaken && (!empty($postData[$action]))) {
		$logData = $postData[$action];
		$response = _study_delete_config ($link, $logData, $debugState);
		$actionTaken = true;
    } 
	*/
	$action = 'general';
	if (!$actionTaken && (!empty($postData[$action]))) {
		$logData = $postData[$action];
		$response = _study_delete_general ($link, $authInfo, $logData, $debugState);
		$actionTaken = true;
    } 
	$action = 'measure';
	if (!$actionTaken && (!empty($postData[$action]))) {
		$logData = $postData[$action];
		$response = _study_delete_measure ($link, $authInfo, $logData, $debugState);
		$actionTaken = true;
    } 
	$action = 'period';
	if (!$actionTaken && (!empty($postData[$action]))) {
		$logData = $postData[$action];
		$response = _study_delete_period ($link, $authInfo, $logData, $debugState);
		$actionTaken = true;
    } 
	$action = 'step';
	if (!$actionTaken && (!empty($postData[$action]))) {
		$logData = $postData[$action];
		$response = _study_delete_step ($link, $authInfo, $logData, $debugState);
		$actionTaken = true;
    } 
	$action = 'variable';
	if (!$actionTaken && (!empty($postData[$action]))) {
		$logData = $postData[$action];
		$response = _study_delete_variable ($link, $authInfo, $logData, $debugState);
		$actionTaken = true;
    } 
	$action = 'variation';
	if (!$actionTaken && (!empty($postData[$action]))) {
		$logData = $postData[$action];
		$response = _study_delete_variation ($link, $authInfo, $logData, $debugState);
		$actionTaken = true;
    } 
	if (!$actionTaken) {
		$thisFile = __FILE__;
		require 'response_501.php';
	}

	return $response;
}
?>