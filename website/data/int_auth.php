<?php
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