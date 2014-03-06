<?php 
function get_session_auth($user){
	$response = '';
	$link = @mysqli_connect(DB_SERVER, DB_USER, DB_PASS, DB_DATABASE_NAME);
	if (!$link) {
		require 'response_500_db_open_error.php';
	} else {
		$session_session = $_SESSION['_session_id'];
		$session_cookie = $_COOKIE['_session_id'];
		$query = "SELECT auth FROM accounts WHERE username=brandon";//"GET user_accounts SET authKey = '$token' WHERE username = '$username'";
		$session_db = mysqli_query($link, $query);
		if($session_session == $session_cookie || $session_cookie == $session_db){
			response = '1'
		}else{
			response = '0'
		}
	}

	return ($response);
}
?>