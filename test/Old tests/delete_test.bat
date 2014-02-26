@echo off
setlocal enableDelayedExpansion
set hostpath=%1
if "%hostpath%"=="" set hostpath=localhost
if exist delete_test_results.txt (del delete_test_results.txt)
echo {^"deleteResults^":[ >  delete_test_results.txt
curl -X DELETE --header "Content-Length:0" -g http://%hostpath%/wlux/data/account.php?bad[some]=stuff >> delete_test_results.txt
echo , >> delete_test_results.txt
curl -X DELETE --header "Content-Length:0" -g http://%hostpath%/wlux/data/study.php?bad[some]=stuff >> delete_test_results.txt
echo , >> delete_test_results.txt
curl -X DELETE --header "Content-Length:0" -g http://%hostpath%/wlux/data/account.php?user[some]=stuff >> delete_test_results.txt
echo , >> delete_test_results.txt
curl -X DELETE --header "Content-Length:0" -g http://%hostpath%/wlux/data/study.php?config[some]=stuff >> delete_test_results.txt
echo , >> delete_test_results.txt
curl -X DELETE --header "Content-Length:0" -g http://%hostpath%/wlux/data/study.php?task[some]=stuff >> delete_test_results.txt
echo , >> delete_test_results.txt
curl -X DELETE --header "Content-Length:0" -g http://%hostpath%/wlux/data/study.php?schedule[some]=stuff >> delete_test_results.txt
echo , >> delete_test_results.txt
curl -X DELETE --header "Content-Length:0" -g http://%hostpath%/wlux/data/study.php?variable[some]=stuff >> delete_test_results.txt
echo ]} >> delete_test_results.txt
