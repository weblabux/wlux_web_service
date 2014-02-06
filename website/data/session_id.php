<?php
//COOKIE VERSION------------------------------------------------------
/*
*	Sets the session_id for a user as a cookie.
*	params
*		user username to associate with the session
*	ret
*		nothing
*/
// function set_session_id($user){
// 	//create a hash with user + current datetime
// 	$session_prehash = date("D M d, Y G:i").$user;
// 	//hash it
// 	$session_id = md5($session_prehash);
// 	//expire after 24 hours
// 	setcookie($user."_session_id", $session_id, time() + 86400);
// }
/*
*	Gets the session_id for a user.
*	req
*		user has the *_session_id cookie
*	ret
*		session_id for the given user
*/
// function get_session_id($user){
// 	return $_COOKIE[$user."_session_id"];
// }

//SESSION VERSION-----------------------------------------------------
// function set_session_id($user){
// 	//create a hash with user + current datetime
// 	//TODO should this session just be a simple string?
// 	$session_prehash = date("D M d, Y G:i").$user;
// 	//hash it
// 	$session_id = md5($session_prehash);
// 	//expire after 24 hours
// 	$_SESSION[$user."_session_id"] = $session_id;
// }

// function get_session_id($user){
// 	return $_SESSION[$user."_session_id"];
// }
/*
*	Sets the session_id for a user as a cookie & session.
*	params
*		user username to associate with the session
*	ret
*		nothing
*/
function set_session_id($user){
	session_start();
	//create a hash with user + current datetime
	//TODO should this session just be a simple string?
	$session_prehash = date("D M d, Y G:i").$user;
	//hash it
	$session_id = md5($session_prehash);
	//expire after 24 hours
	$_SESSION["_session_id"] = $session_id;
	setcookie("_session_id", $session_id, time() + 86400);
}

/*
*	Gets the session_id for a user.
*	req
*		user has the *_session_id cookie
*	ret
*		session_id for the given user
*/
function get_session_id($user){
	return $_SESSION["_session_id"];
}

function verify_session_id($user){
	return $_SESSION["_session_id"] == $_COOKIE["_session_id"];
}

?>