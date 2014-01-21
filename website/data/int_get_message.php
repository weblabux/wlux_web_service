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
		$queryString = 'SELECT errorStatus as status, messageText as message from '.$DB_ERROR_MESSAGES.
			' WHERE errorStatus = '.$status.
			' AND messageVariation = "'.$variation.
			'" AND messageLanguage = "'.$language.'"';
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