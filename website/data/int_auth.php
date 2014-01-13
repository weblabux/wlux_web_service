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
function authorize_user ($link) {
require 'config_files.php';
	$retVal['access'] = $AUTH_NOT_AUTHORIZED;
	$headers = getallheaders ();
	$userPass = '';
	if (!empty($headers) && !empty($headers['Authorization'])) {
		$userPass64 = explode(" ", $headers['Authorization']);
		if (!empty($userPass64[1])) {
			$userPass = base64_decode($userPass64[1]);
		} // else Auth header format error
	} // no Auth header
			
	if (!empty($userPass)) {
		$username = '';
		$password = '';
		$userPassSplit = explode(":", $userPass);
		if (!empty($userPassSplit[0])) {
			$username = $userPassSplit[0];
		}
		if (!empty($userPassSplit[1])) {
			$password = $userPassSplit[1];
		}
		
		$queryString = 'SELECT username, recordSeq AS accountId, ownerId, firstName, lastName, greetingName, orgName, email, accountType, wluxUrlRoot, clientUrlRoot, defaultTimeZone FROM '.DB_TABLE_USER_ACCOUNTS.
			' WHERE username = "'.$username.'" AND acctPassword = "'.$password.'"';
		$result = @mysqli_query ($link, $queryString);
		$idx = 0;
		if (mysqli_num_rows($result)  > 0) {
			$retVal['account'] = mysqli_fetch_assoc($result);
			if ($retVal['account']['accountType'] == 'admin') {
				$retVal['access'] = $AUTH_ADMIN;
			} else if ($retVal['account']['accountType'] == 'researcher') {
				$retVal['access'] = $AUTH_ALL;
			} else {
				$retVal['access'] = $AUTH_NOT_AUTHORIZED;
			}
		} else {
			// account not found
			$retVal['access'] = $AUTH_NOT_AUTHORIZED;
		}
	}
	
	return $retVal;
}

?>