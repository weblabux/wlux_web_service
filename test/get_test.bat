@echo off
setlocal enableDelayedExpansion
set hostpath=%1
if "%hostpath%"=="" set hostpath=localhost
if exist get_test_results.txt (del get_test_results.txt)
echo {^"getResults^":[ >  get_test_results.txt
curl -g http://%hostpath%/wlux/data/account.php?bad[some]=stuff >> get_test_results.txt
echo , >> get_test_results.txt
curl -g http://%hostpath%/wlux/data/debug.php?bad[some]=stuff >> get_test_results.txt
echo , >> get_test_results.txt
curl -g http://%hostpath%/wlux/data/gratuity.php?bad[some]=stuff >> get_test_results.txt
echo , >> get_test_results.txt
curl -g http://%hostpath%/wlux/data/log.php?bad[some]=stuff >> get_test_results.txt
echo , >> get_test_results.txt
curl -g http://%hostpath%/wlux/data/session.php?bad[some]=stuff >> get_test_results.txt
echo , >> get_test_results.txt
curl -g http://%hostpath%/wlux/data/study.php?bad[some]=stuff >> get_test_results.txt
echo , >> get_test_results.txt
curl -g http://%hostpath%/wlux/data/account.php?user[some]=stuff >> get_test_results.txt
echo , >> get_test_results.txt
curl -g http://%hostpath%/wlux/data/debug.php?config[some]=stuff >> get_test_results.txt
echo , >> get_test_results.txt
curl -g http://%hostpath%/wlux/data/gratuity.php?study[studyId]=12345^&study[sessionName]=AutomatedTest >> get_test_results.txt
echo , >> get_test_results.txt
curl -g http://%hostpath%/wlux/data/log.php?session[some]=stuff >> get_test_results.txt
echo , >> get_test_results.txt
curl -g http://%hostpath%/wlux/data/log.php?sessions[some]=stuff >> get_test_results.txt
echo , >> get_test_results.txt
curl -g http://%hostpath%/wlux/data/log.php?allStudies[some]=stuff >> get_test_results.txt
echo , >> get_test_results.txt
curl -g http://%hostpath%/wlux/data/log.php?study[some]=stuff >> get_test_results.txt
echo , >> get_test_results.txt
curl -g http://%hostpath%/wlux/data/session.php?config[some]=stuff >> get_test_results.txt
echo , >> get_test_results.txt
curl -g http://%hostpath%/wlux/data/study.php?config[some]=stuff >> get_test_results.txt
echo , >> get_test_results.txt
curl -g http://%hostpath%/wlux/data/study.php?allStudyIds[some]=stuff >> get_test_results.txt
echo , >> get_test_results.txt
curl -g http://%hostpath%/wlux/data/study.php?studyElements[some]=stuff >> get_test_results.txt
echo , >> get_test_results.txt
curl -g http://%hostpath%/wlux/data/study.php?name[some]=stuff >> get_test_results.txt
echo , >> get_test_results.txt
curl -g http://%hostpath%/wlux/data/study.php?task[some]=stuff >> get_test_results.txt
echo , >> get_test_results.txt
curl -g http://%hostpath%/wlux/data/study.php?schedule[some]=stuff >> get_test_results.txt
echo , >> get_test_results.txt
curl -g http://%hostpath%/wlux/data/study.php?variable[some]=stuff >> get_test_results.txt
echo ]} >> get_test_results.txt
