@echo off
setlocal enableDelayedExpansion
set hostpath=%1
if "%hostpath%"=="" set hostpath=localhost
if exist gratuity_test_results.txt (del gratuity_test_results.txt)
echo {^"gratuityResults^":[ >  gratuity_test_results.txt
curl -X POST --header "Content-Length: 0" -g http://%hostpath%/wlux/data/gratuity.php?bad[some]=stuff >> gratuity_test_results.txt
echo , >> gratuity_test_results.txt
curl -X POST -d "gratuity[studyId]=1234&gratuity[periodName]=Freshman class test&gratuity[email]=test@example.com&gratuity[comments]=automated test" -g http://%hostpath%/wlux/data/gratuity.php  >> gratuity_test_results.txt
echo , >> gratuity_test_results.txt
curl -g http://%hostpath%/wlux/data/gratuity.php?bad[some]=stuff >> gratuity_test_results.txt
echo , >> gratuity_test_results.txt
curl --header "Authorization: Basic ZGVmYXVsdFJlc2VhcmNoZXI6MVBhc3N3b3Jk" -g http://%hostpath%/wlux/data/gratuity.php?study[studyId]=12345^&study[sessionName]=AutomatedTest >> gratuity_test_results.txt
echo , >> gratuity_test_results.txt
curl --header "Authorization: Basic ZGVmYXVsdEFkbWluOjFQYXNzd29yZA==" -g http://%hostpath%/wlux/data/gratuity.php?study[studyId]=12345^&study[sessionName]=AutomatedTest >> gratuity_test_results.txt
echo , >> gratuity_test_results.txt
curl -X PATCH --header "Content-Length: 0" -g http://%hostpath%/wlux/data/gratuity.php?gratuity[some]=stuff >> gratuity_test_results.txt
echo ]} >> gratuity_test_results.txt
