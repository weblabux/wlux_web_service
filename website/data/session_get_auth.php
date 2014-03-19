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
require 'config_files.php';
/*
*	returns 1 if they exist and match
*	return 0 otherwise
*
*
*
*/
/*
	TODO: refactor function and file name to look like internal functions
	TODO: refactor DEBUG  calls to [debug] elements of $response
	TODO: wrap [debug] values in an if ($debug) statement using the 
	      values read in session_get.php
	TODO: refactor response to 
*/

function get_session_auth($user){
	$response = '0';
	$link = @mysqli_connect(DB_SERVER, DB_USER, DB_PASS, DB_DATABASE_NAME);
	if (!$link) {
		//require 'response_500_db_open_error.php';
	} else {
		if (isset($_SESSION['PHPSESSID'])) {  
			$session_session = $_SESSION['PHPSESSID'];
		}else{
			$session_session = "-1";
		}
		$session_cookie = $_COOKIE['PHPSESSID'];
		$query = "SELECT auth FROM accounts WHERE username ='$user'";//"GET user_accounts SET authKey = '$token' WHERE username = '$username'";
		$result = mysqli_query($link, $query);
		$free = mysqli_fetch_assoc($result);
	
		/* remove this after debug */
		echo "session: $session_session</br>";
		echo "cookie: $session_cookie</br>";
		echo "db: $free[auth]</br>";
		/* remove this after debug */
		
		

		//
		if($session_session == $session_cookie || $session_cookie == $free['auth']){
			$response = '1';
		}else{
			$response = '0';
		}
	}
	return ($response);
}
?>