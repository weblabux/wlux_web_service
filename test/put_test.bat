setlocal enableDelayedExpansion
set hostpath=%1
if "%hostpath%"=="" set hostpath=localhost
if exist put_test_results.txt (del put_test_results.txt)
echo {^"putResults^":[ > put_test_results.txt
REM type test_header.txt > put_test_results.txt
curl -X PUT --header "Content-Length:0" -g http://%hostpath%/wlux/data/account.php?user[some]=stuff >> put_test_results.txt
echo , >> put_test_results.txt
curl -X PUT --header "Content-Length:0" -g http://%hostpath%/wlux/data/study.php?task[some]=stuff >> put_test_results.txt
echo , >> put_test_results.txt
curl -X PUT --header "Content-Length:0" -g http://%hostpath%/wlux/data/study.php?schedule[some]=stuff >> put_test_results.txt
echo , >> put_test_results.txt
curl -X PUT --header "Content-Length:0" -g http://%hostpath%/wlux/data/study.php?variable[some]=stuff >> put_test_results.txt
echo ]} >> put_test_results.txt
