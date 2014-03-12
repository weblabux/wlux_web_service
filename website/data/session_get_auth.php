<?php 
<<<<<<< HEAD
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
=======
>>>>>>> c4489420dcb71dfdfdb3c137bd615d8f9a74e26a
function get_session_auth($user){
	$response = '';
	$link = @mysqli_connect(DB_SERVER, DB_USER, DB_PASS, DB_DATABASE_NAME);
	if (!$link) {
		require 'response_500_db_open_error.php';
	} else {
		$session_session = $_SESSION['_session_id'];
		$session_cookie = $_COOKIE['_session_id'];
<<<<<<< HEAD
		$query = "SELECT auth FROM accounts WHERE username ='$user'";//"GET user_accounts SET authKey = '$token' WHERE username = '$username'";
		$result = mysqli_query($link, $query);
		$free = mysqli_fetch_assoc($result);
	}
	echo "session: $session_session</br>";
	echo "cookie: $session_cookie</br>";
	echo "db: $free[auth]</br>";
		if($session_session == $session_cookie || $session_cookie == $free['auth']){
			$response = '1';
=======
		$query = "SELECT auth FROM accounts WHERE username=brandon";//"GET user_accounts SET authKey = '$token' WHERE username = '$username'";
		$session_db = mysqli_query($link, $query);
		if($session_session == $session_cookie || $session_cookie == $session_db){
			response = '1'
>>>>>>> c4489420dcb71dfdfdb3c137bd615d8f9a74e26a
		}else{
			$response = '0';
		}

	return ($response);
}
?>