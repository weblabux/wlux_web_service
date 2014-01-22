<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Submit your info</title>
<script src="../common/jquery.js" type="text/javascript"></script>
<script type="text/javascript">
var gratuityUrl = '../data/gratuity.php';

/*
	This function formats the data field to send in the command
*/
function formObject (studyId, periodName, email, comments) {
	this.studyId = studyId;
	this.periodName = periodName;
	this.email = email;
	this.comments = comments;
	return this;;	
}

/*
	This formats the data object as a command to the service
*/
function postGratuity (studyId, periodName, email, comments) {
	this.gratuity = new formObject (studyId, periodName, email, comments);
	return this;
}

$(document).ready(function() {
	$('#formSubmit').click(function() {
		// clear out the response area in the UI
		$('#responseBody').html('<p>Sending...</p>');
		
		// format the post command with the fields from the form
		var buffer = new postGratuity(
				$('#formStudyId').val(),
				$('#formPeriodName').val(),
				$('#formEmail').val(),
				$('#formComments').val()
			);
		
		// send the request
		var postResponse = $.post(gratuityUrl, buffer);
		
		// if the response comes back let the user know.
		postResponse.done(function(response) {
			if (response.data != null) {
				$('#responseBody').html('<p>Gratuity registered! Thanks.</p>');
			}
			if (response.error) {
				$('#responseBody').html('<p>Error: ' + response.error.message + '</p>');
			}
		});
	});
});

</script>
</head>

<body>
<h1>Enter your info for a gratuity</h1>
<div id="formBody">
  <div class="formField">
  <label>Study ID: </label><input accept="text/plain" id="formStudyId" />
  </div>
  <div class="formField">
  <label>Study period: </label><input accept="text/plain" id="formPeriodName" />  </div>
  <div class="formField">
  <label>email: </label><input accept="text/plain" id="formEmail" /><br />
  </div>
  <div class="formField">
  <label>Comments: </label><textarea accept="text/plain" id="formComments"></textarea>
  </div>
  <div class="formField">
  <input type="button" id="formSubmit" title="Click to enter for a gratuity" value="Submit" />
  </div>
  <div id="responseBody">
  <p>Nothing yet...</p>
  </div>
</div>
</body>
</html>