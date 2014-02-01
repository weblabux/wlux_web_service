@echo off
setlocal enableDelayedExpansion
set hostpath=%1
if "%hostpath%"=="" set hostpath=localhost
if exist test_405_results.txt (del test_405_results.txt)
echo {^"test405Results^":[ >  test_405_results.txt
curl -X PATCH --header "Content-Length: 0" -g http://%hostpath%/wlux/data/account.php?user[some]=stuff >> test_405_results.txt
echo , >> test_405_results.txt
curl -X PATCH --header "Content-Length: 0" -g http://%hostpath%/wlux/data/debug.php?gratuity[some]=stuff >> test_405_results.txt
echo , >> test_405_results.txt
curl -X PATCH --header "Content-Length: 0" -g http://%hostpath%/wlux/data/gratuity.php?gratuity[some]=stuff >> test_405_results.txt
echo , >> test_405_results.txt
curl -X PATCH --header "Content-Length: 0" -g http://%hostpath%/wlux/data/log.php?load[some]=stuff >> test_405_results.txt
echo , >> test_405_results.txt
curl -X PATCH --header "Content-Length: 0" -g http://%hostpath%/wlux/data/session.php?start[some]=stuff >> test_405_results.txt
echo , >> test_405_results.txt
curl -X PATCH --header "Content-Length: 0" -g http://%hostpath%/wlux/data/signin.php?user=stuff >> test_405_results.txt
echo , >> test_405_results.txt
curl -X PATCH --header "Content-Length: 0" -g http://%hostpath%/wlux/data/signout.php?user=stuff >> test_405_results.txt
echo , >> test_405_results.txt
curl -X PATCH --header "Content-Length: 0" -g http://%hostpath%/wlux/data/study.php?config[some]=stuff >> test_405_results.txt
echo ]} >> test_405_results.txt
