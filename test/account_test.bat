@echo off
setlocal enableDelayedExpansion
set hostpath=%1
if "%hostpath%"=="" set hostpath=localhost
if exist account_test_results.txt (del account_test_results.txt)
echo {^"accountResults^":[ >  account_test_results.txt
REM Error test
curl -g http://%hostpath%/wlux/data/account.php?bad[some]=stuff >> account_test_results.txt
echo , >> account_test_results.txt
REM GET tests
curl --header "Authorization: Basic ZGVmYXVsdFJlc2VhcmNoZXI6MVBhc3N3b3Jk" -g http://%hostpath%/wlux/data/account.php?user[username]=defaultResearcher >> account_test_results.txt
echo , >> account_test_results.txt
curl --header "Authorization: Basic ZGVmYXVsdFJlc2VhcmNoZXI6MVBhc3N3b3Jk" -g http://%hostpath%/wlux/data/account.php?user[username]=Nobody >> account_test_results.txt
echo , >> account_test_results.txt
REM POST test
curl -X POST --header "Authorization: Basic ZGVmYXVsdFJlc2VhcmNoZXI6MVBhc3N3b3Jk" -d "bad[some]=stuff" -g http://%hostpath%/wlux/data/account.php >> account_test_results.txt
echo , >> account_test_results.txt
curl -X POST --header "Authorization: Basic ZGVmYXVsdFJlc2VhcmNoZXI6MVBhc3N3b3Jk" -d "user[some]=stuff" -g http://%hostpath%/wlux/data/account.php >> account_test_results.txt
echo , >> account_test_results.txt
curl -X POST --header "Authorization: Basic ZGVmYXVsdFJlc2VhcmNoZXI6MVBhc3N3b3Jk" -d "changePassword[some]=stuff" -g http://%hostpath%/wlux/data/account.php >> account_test_results.txt
echo , >> account_test_results.txt
REM PUT test
curl -X PUT --header "Content-Length:0" --header "Authorization: Basic ZGVmYXVsdFJlc2VhcmNoZXI6MVBhc3N3b3Jk" -g http://%hostpath%/wlux/data/account.php?bad[some]=stuff >> account_test_results.txt
echo , >> account_test_results.txt
curl -X PUT --header "Content-Length:0" --header "Authorization: Basic ZGVmYXVsdFJlc2VhcmNoZXI6MVBhc3N3b3Jk" -g http://%hostpath%/wlux/data/account.php?user[username]=Nobody >> account_test_results.txt
echo , >> account_test_results.txt
REM DELETE test
curl -X DELETE --header "Content-Length:0" --header "Authorization: Basic ZGVmYXVsdFJlc2VhcmNoZXI6MVBhc3N3b3Jk" -g http://%hostpath%/wlux/data/account.php?bad[some]=stuff >> account_test_results.txt
echo , >> account_test_results.txt
curl -X DELETE --header "Content-Length:0" --header "Authorization: Basic ZGVmYXVsdFJlc2VhcmNoZXI6MVBhc3N3b3Jk" -g http://%hostpath%/wlux/data/account.php?user[username]=Nobody >> account_test_results.txt
echo ]} >> account_test_results.txt