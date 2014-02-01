@echo off
setlocal enableDelayedExpansion
set hostpath=%1
if "%hostpath%"=="" set hostpath=localhost
if exist study_test_results.txt (del study_test_results.txt)
echo {^"studyResults^":[ >  study_test_results.txt
REM Error test
curl -g http://%hostpath%/wlux/data/study.php?bad[some]=stuff >> study_test_results.txt
echo , >> study_test_results.txt
REM GET tests
curl --header "Authorization: Basic ZGVmYXVsdFJlc2VhcmNoZXI6MVBhc3N3b3Jk" -g http://%hostpath%/wlux/data/study.php?allStudyIds[some]=stuff >> study_test_results.txt
echo , >> study_test_results.txt
curl --header "Authorization: Basic ZGVmYXVsdFJlc2VhcmNoZXI6MVBhc3N3b3Jk" -g http://%hostpath%/wlux/data/study.php?config[some]=stuff >> study_test_results.txt
echo , >> study_test_results.txt
curl --header "Authorization: Basic ZGVmYXVsdFJlc2VhcmNoZXI6MVBhc3N3b3Jk" -g http://%hostpath%/wlux/data/study.php?general[some]=stuff >> study_test_results.txt
echo , >> study_test_results.txt
curl --header "Authorization: Basic ZGVmYXVsdFJlc2VhcmNoZXI6MVBhc3N3b3Jk" -g http://%hostpath%/wlux/data/study.php?measure[some]=stuff >> study_test_results.txt
echo , >> study_test_results.txt
curl --header "Authorization: Basic ZGVmYXVsdFJlc2VhcmNoZXI6MVBhc3N3b3Jk" -g http://%hostpath%/wlux/data/study.php?name[some]=stuff >> study_test_results.txt
echo , >> study_test_results.txt
curl --header "Authorization: Basic ZGVmYXVsdFJlc2VhcmNoZXI6MVBhc3N3b3Jk" -g http://%hostpath%/wlux/data/study.php?period[some]=stuff >> study_test_results.txt
echo , >> study_test_results.txt
curl --header "Authorization: Basic ZGVmYXVsdFJlc2VhcmNoZXI6MVBhc3N3b3Jk" -g http://%hostpath%/wlux/data/study.php?step[some]=stuff >> study_test_results.txt
echo , >> study_test_results.txt
curl --header "Authorization: Basic ZGVmYXVsdFJlc2VhcmNoZXI6MVBhc3N3b3Jk" -g http://%hostpath%/wlux/data/study.php?variable[some]=stuff >> study_test_results.txt
echo , >> study_test_results.txt
curl --header "Authorization: Basic ZGVmYXVsdFJlc2VhcmNoZXI6MVBhc3N3b3Jk" -g http://%hostpath%/wlux/data/study.php?variation[some]=stuff >> study_test_results.txt
echo , >> study_test_results.txt
REM POST tests
curl -X POST --header "Authorization: Basic ZGVmYXVsdFJlc2VhcmNoZXI6MVBhc3N3b3Jk" -d "general[some]=stuff" -g http://%hostpath%/wlux/data/study.php >> study_test_results.txt
echo , >> study_test_results.txt
curl -X POST --header "Authorization: Basic ZGVmYXVsdFJlc2VhcmNoZXI6MVBhc3N3b3Jk" -d "measure[some]=stuff" -g http://%hostpath%/wlux/data/study.php >> study_test_results.txt
echo , >> study_test_results.txt
curl -X POST --header "Authorization: Basic ZGVmYXVsdFJlc2VhcmNoZXI6MVBhc3N3b3Jk" -d "period[some]=stuff" -g http://%hostpath%/wlux/data/study.php >> study_test_results.txt
echo , >> study_test_results.txt
curl -X POST --header "Authorization: Basic ZGVmYXVsdFJlc2VhcmNoZXI6MVBhc3N3b3Jk" -d "step[some]=stuff" -g http://%hostpath%/wlux/data/study.php >> study_test_results.txt
echo , >> study_test_results.txt
curl -X POST --header "Authorization: Basic ZGVmYXVsdFJlc2VhcmNoZXI6MVBhc3N3b3Jk" -d "variable[some]=stuff" -g http://%hostpath%/wlux/data/study.php >> study_test_results.txt
echo , >> study_test_results.txt
curl -X POST --header "Authorization: Basic ZGVmYXVsdFJlc2VhcmNoZXI6MVBhc3N3b3Jk" -d "variation[some]=stuff" -g http://%hostpath%/wlux/data/study.php >> study_test_results.txt
echo , >> study_test_results.txt
REM PUT tests
curl -X PUT --header "Content-Length:0" --header "Authorization: Basic ZGVmYXVsdFJlc2VhcmNoZXI6MVBhc3N3b3Jk" -g http://%hostpath%/wlux/data/study.php?general[some]=stuff >> study_test_results.txt
echo , 1>> study_test_results.txt
curl -X PUT --header "Content-Length:0" --header "Authorization: Basic ZGVmYXVsdFJlc2VhcmNoZXI6MVBhc3N3b3Jk" -g http://%hostpath%/wlux/data/study.php?general[some]=stuff >> study_test_results.txt
echo , 1>> study_test_results.txt
curl -X PUT --header "Content-Length:0" --header "Authorization: Basic ZGVmYXVsdFJlc2VhcmNoZXI6MVBhc3N3b3Jk" -g http://%hostpath%/wlux/data/study.php?measure[some]=stuff >> study_test_results.txt
echo , 1>> study_test_results.txt
curl -X PUT --header "Content-Length:0" --header "Authorization: Basic ZGVmYXVsdFJlc2VhcmNoZXI6MVBhc3N3b3Jk" -g http://%hostpath%/wlux/data/study.php?period[some]=stuff >> study_test_results.txt
echo , 1>> study_test_results.txt
curl -X PUT --header "Content-Length:0" --header "Authorization: Basic ZGVmYXVsdFJlc2VhcmNoZXI6MVBhc3N3b3Jk" -g http://%hostpath%/wlux/data/study.php?step[some]=stuff >> study_test_results.txt
echo , 1>> study_test_results.txt
curl -X PUT --header "Content-Length:0" --header "Authorization: Basic ZGVmYXVsdFJlc2VhcmNoZXI6MVBhc3N3b3Jk" -g http://%hostpath%/wlux/data/study.php?variable[some]=stuff >> study_test_results.txt
echo , 1>> study_test_results.txt
curl -X PUT --header "Content-Length:0" --header "Authorization: Basic ZGVmYXVsdFJlc2VhcmNoZXI6MVBhc3N3b3Jk" -g http://%hostpath%/wlux/data/study.php?variation[some]=stuff >> study_test_results.txt
echo , >> study_test_results.txt
REM DELETE tests
curl -X DELETE --header "Content-Length:0" --header "Authorization: Basic ZGVmYXVsdFJlc2VhcmNoZXI6MVBhc3N3b3Jk" -g http://%hostpath%/wlux/data/study.php?general[some]=stuff >> study_test_results.txt
echo , >> study_test_results.txt
curl -X DELETE --header "Content-Length:0" --header "Authorization: Basic ZGVmYXVsdFJlc2VhcmNoZXI6MVBhc3N3b3Jk" -g http://%hostpath%/wlux/data/study.php?measure[some]=stuff >> study_test_results.txt
echo , >> study_test_results.txt
curl -X DELETE --header "Content-Length:0" --header "Authorization: Basic ZGVmYXVsdFJlc2VhcmNoZXI6MVBhc3N3b3Jk" -g http://%hostpath%/wlux/data/study.php?period[some]=stuff >> study_test_results.txt
echo , >> study_test_results.txt
curl -X DELETE --header "Content-Length:0" --header "Authorization: Basic ZGVmYXVsdFJlc2VhcmNoZXI6MVBhc3N3b3Jk" -g http://%hostpath%/wlux/data/study.php?step[some]=stuff >> study_test_results.txt
echo , >> study_test_results.txt
curl -X DELETE --header "Content-Length:0" --header "Authorization: Basic ZGVmYXVsdFJlc2VhcmNoZXI6MVBhc3N3b3Jk" -g http://%hostpath%/wlux/data/study.php?variable[some]=stuff >> study_test_results.txt
echo , >> study_test_results.txt
curl -X DELETE --header "Content-Length:0" --header "Authorization: Basic ZGVmYXVsdFJlc2VhcmNoZXI6MVBhc3N3b3Jk" -g http://%hostpath%/wlux/data/study.php?variation[some]=stuff >> study_test_results.txt
echo ]} >> study_test_results.txt