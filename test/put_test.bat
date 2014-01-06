@echo off
setlocal enableDelayedExpansion
set hostpath=%1
if "%hostpath%"=="" set hostpath=localhost
if exist put_test_results.txt (del put_test_results.txt)
echo {^"putResults^":[ 1> put_test_results.txt
curl -X PUT --header "Content-Length:0" -g http://%hostpath%/wlux/data/account.php?bad[some]=stuff 1>> put_test_results.txt 
echo , 1>> put_test_results.txt
curl -X PUT --header "Content-Length:0" -g http://%hostpath%/wlux/data/study.php?bad[some]=stuff 1>> put_test_results.txt
echo , 1>> put_test_results.txt
curl -X PUT --header "Content-Length:0" -g http://%hostpath%/wlux/data/account.php?user[some]=stuff 1>> put_test_results.txt
echo , 1>> put_test_results.txt
curl -X PUT --header "Content-Length:0" -g http://%hostpath%/wlux/data/study.php?task[some]=stuff 1>> put_test_results.txt
echo , 1>> put_test_results.txt
curl -X PUT --header "Content-Length:0" -g http://%hostpath%/wlux/data/study.php?schedule[some]=stuff 1>> put_test_results.txt
echo , 1>> put_test_results.txt
curl -X PUT --header "Content-Length:0" -g http://%hostpath%/wlux/data/study.php?variable[some]=stuff 1>> put_test_results.txt
echo ]} 1>> put_test_results.txt

