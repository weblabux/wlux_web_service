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
 function format_object_for_SQL_insert ($tableName, $object) {
	// set the dateCreated field
	$now = new DateTime();
	$object['dateCreated'] = $now->format('Y-m-d H:i:s');
			
	// format the fields of the object to the appropriate SQL syntax		
	foreach ($object as $dbCol => $dbVal) {
		isset($dbColList) ? $dbColList .= ', ' : $dbColList = '';
		isset($dbValList) ? $dbValList .= ', ' : $dbValList = '';										
		$dbColList .= $dbCol;
		if (empty($dbVal) && (strlen($dbVal)==0)) {
			$dbValList .= 'NULL';
		} else {
			$escapedString = str_replace("'","''",$dbVal);
			$dbValList .= '\''.$escapedString.'\'';
		}							
	}
	$queryString = 'INSERT INTO '.$tableName.' ('.$dbColList.') VALUES ('.$dbValList.')';
	return $queryString;
}

function get_study_owner ($studyId) {
	// TODO: check the study DB.
	// return the defaultReseacher ID for now until the study interface is ready
	if ($studyId == 1234) {
		return 2;
	} else {
		return -1;
	}
}
?>