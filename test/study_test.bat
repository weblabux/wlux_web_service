@echo off
setlocal enableDelayedExpansion
set hostpath=%1
if "%hostpath%"=="" set hostpath=localhost
if exist study_test_results.txt (del study_test_results.txt)
echo {^"studyResults^":[ >  study_test_results.txt
REM Get tests
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
echo ]} >> study_test_results.txt