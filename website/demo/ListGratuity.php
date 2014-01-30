<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>List gratuities</title>
<script src="../common/jquery.js" type="text/javascript"></script>
<script type="text/javascript">
var gratuityUrl = '../data/gratuity.php';
var authHeader={"Authorization": "BASIC ZGVmYXVsdFJlc2VhcmNoZXI6MVBhc3N3b3Jk"};

/*
	This function formats the data field to send in the command
*/
function formObject (studyId, periodName) {
	this.studyId = studyId;
	this.periodName = periodName;
	return this;
}

/*
	This formats the data object as a command to the service
*/
function postStudy (studyId, periodName) {
	this.study = new formObject (studyId, periodName);
	return this;
}

$(document).ready(function() {
	$('#formSubmit').click(function() {
		// clear the response area in the UI
		$('#responseBody').html('<p>Sending...</p>');
		
		// format the request command
		var buffer = new postStudy(
				$('#formStudyId').val(),
				$('#formPeriodName').val()
			);
			
		// call the service with the authorization header and request command
		var postResponse = $.ajax({
			url: gratuityUrl,
			type: 'get',
			data: buffer,
			headers: authHeader});
		
		// Display the results here	
		postResponse.done(function(response) {
			if (response.data != null) {
				var responseText = '<h2>Gratuity entries</h2>';
				// create the tatble header
				responseText = '<table><tr><th>StudyId</th><th>PeriodName</th><th>email</th><th>comments</th></tr>';
				
				// the response to this command is an arry of gratuity entries
				// so loop through the array and fill in a table to show the data
				for (var i=0; i< response.data.length; i++) {	
					var entry = response.data[i];
					responseText = responseText + 
						'<tr><td>' + entry.studyId + 
						'</td><td>' + entry.periodName + 
						'</td><td>' + entry.email + 
						'</td><td>' + entry.comments + 
						'</td></tr>';
				}
				// close the table and show it
				responseText = responseText + '</table>';
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
<h1>See who applied for a gratuity</h1>
<div id="formBody">
  <div class="formField">
  <label>Study ID: </label><input accept="text/plain" id="formStudyId" />
  </div>
  <div class="formField">
  <label>Study period: </label><input accept="text/plain" id="formPeriodName" />  </div>
  <div class="formField">
  <input type="button" id="formSubmit" title="Click to see who applied for a gratuity" value="Submit" />
  </div>
  <div id="responseBody">
  <p>Nothing yet...</p>
  </div>
</div>

</body>
</html>