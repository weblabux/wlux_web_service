<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Sign in</title>
<script src="../common/jquery.js" type="text/javascript"></script>
<script type="text/javascript">
var signinUrl = '../data/signin.php';
var authHeader={"Authorization": "BASIC ZGVmYXVsdFJlc2VhcmNoZXI6MVBhc3N3b3Jk"};

/*
	This function formats the data field to send in the command
*/
function formObject (username, password) {
	this.username = username;
	this.password = password;
	return this;
}

/*
	This formats the data object as a command to the service
*/
function postData (username, password) {
	this.signIn = new formObject (username, password);
	return this;
}

$(document).ready(function() {
	$('#formSubmit').click(function() {
		// clear the response area in the UI
		$('#responseBody').html('<p>Sending...</p>');
		
		// format the request command
		var buffer = new postData(
				$('#username').val(),
				$('#password').val()
			);
		
		// call the service with the authorization header and request command
		var postResponse = $.ajax({
			url: signinUrl,
			type: 'post',
			data: buffer,
			datatype: "json",
			headers: authHeader});
		
		// Display the results here	
		postResponse.done(function(response) {
			if (response.data != null) {
				var responseText = '<h2>Sign In Result</h2>';
				// create the tatble header
				responseText += '<table><tr><th>Username</th><th>Account Id</th><th>Token</th></tr>';
				
				responseText += 
						'<tr><td>' + response.data.username + 
						'</td><td>' + response.data.accountId + 
						'</td><td>' + response.data.token + 
						'</td></tr>';
				
				// close the table and show it
				responseText += '</table>';
				$('#responseBody').html(responseText);
			}
			if (response.error) {
				$('#responseBody').html('<p>Error: ' + response.error.message + '</p>');
			}
		});
		// if the request fails, the Sending message is still displayed.
	});
});

</script>

</head>

<body>
<h1>Please sign in</h1>
<div id="formBody">
  <div class="formField">
  <label>Username: </label><input accept="text/plain" id="username" />
  </div>
  <div class="formField">
  <label>Password: </label><input accept="text/plain" id="password" type="password"/>  </div>
  <div class="formField">
  <input type="button" id="formSubmit" title="Sign in" value="Submit" />
  </div>
  <div id="responseBody">
  <p>Nothing yet...</p>
  </div>
</div>

</body>
</html>