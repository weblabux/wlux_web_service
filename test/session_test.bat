@echo off
setlocal enableDelayedExpansion
set hostpath=%1
if "%hostpath%"=="" set hostpath=localhost
if exist session_test_results.txt (del session_test_results.txt)
REM
REM	test error case
REM
echo {^"sessionResults^":[ >  session_test_results.txt
REM This just returns an error
curl --header "Authorization: Basic ZGVmYXVsdFJlc2VhcmNoZXI6MVBhc3N3b3Jk" -g http://%hostpath%/wlux/data/session.php?bad[some]=stuff >> session_test_results.txt
echo , >> session_test_results.txt
curl -g http://%hostpath%/wlux/data/session.php?config[some]=stuff >> session_test_results.txt
echo , >> session_test_results.txt
curl -g http://%hostpath%/wlux/data/session.php?currentStep[some]=stuff >> session_test_results.txt
echo , >> session_test_results.txt
REM These don't need an authorization header
curl -X POST -d "bad[some]=stuff" -g http://%hostpath%/wlux/data/session.php >> session_test_results.txt
echo , >> session_test_results.txt
curl -X POST -d "start[some]=stuff" -g http://%hostpath%/wlux/data/session.php >> session_test_results.txt
echo , >> session_test_results.txt
curl -X POST -d "startNextStepsome]=stuff" -g http://%hostpath%/wlux/data/session.php >> session_test_results.txt
echo , >> session_test_results.txt
curl -X POST -d "finishCurrentStep[some]=stuff" -g http://%hostpath%/wlux/data/session.php >> session_test_results.txt
echo , >> session_test_results.txt
REM This should return a 405 error
curl -X PATCH --header "Content-Length: 0" -g http://%hostpath%/wlux/data/session.php?start[some]=stuff >> session_test_results.txt
echo ]} >> session_test_results.txt