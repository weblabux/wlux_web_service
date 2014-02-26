@echo off
setlocal enableDelayedExpansion
set hostpath=%1
if "%hostpath%"=="" set hostpath=localhost
if exist post_test_results.txt (del post_test_results.txt)
echo {^"postResults^":[ >  post_test_results.txt
curl -X POST -d "bad[some]=stuff" -g http://%hostpath%/wlux/data/account.php >> post_test_results.txt
echo , >> post_test_results.txt
curl -X POST --header "Content-Length: 0" -g http://%hostpath%/wlux/data/gratuity.php?bad[some]=stuff >> post_test_results.txt
echo , >> post_test_results.txt
curl -X POST -d "bad[some]=stuff" -g http://%hostpath%/wlux/data/log.php >> post_test_results.txt
echo , >> post_test_results.txt
curl -X POST -d "bad[some]=stuff" -g http://%hostpath%/wlux/data/session.php >> post_test_results.txt
echo , >> post_test_results.txt
curl -X POST -d "bad[some]=stuff" -g http://%hostpath%/wlux/data/study.php >> post_test_results.txt
echo , >> post_test_results.txt
curl -X POST -d "user[some]=stuff" -g http://%hostpath%/wlux/data/account.php >> post_test_results.txt
echo , >> post_test_results.txt
curl -X POST -d "gratuity[studyId]=1234&gratuity[periodName]=Freshman class test&gratuity[email]=test@example.com&gratuity[comments]=automated test" -g http://%hostpath%/wlux/data/gratuity.php  >> post_test_results.txt
echo , >> post_test_results.txt
curl -X POST -d "load[some]=stuff" -g http://%hostpath%/wlux/data/log.php >> post_test_results.txt
echo , >> post_test_results.txt
curl -X POST -d "transition[some]=stuff" -g http://%hostpath%/wlux/data/log.php >> post_test_results.txt
echo , >> post_test_results.txt
curl -X POST -d "start[some]=stuff" -g http://%hostpath%/wlux/data/session.php >> post_test_results.txt
echo , >> post_test_results.txt
curl -X POST -d "startNextTask[some]=stuff" -g http://%hostpath%/wlux/data/session.php >> post_test_results.txt
echo , >> post_test_results.txt
curl -X POST -d "finishCurrentTask[some]=stuff" -g http://%hostpath%/wlux/data/session.php >> post_test_results.txt
echo , >> post_test_results.txt
curl -X POST -d "user=stuff" -g http://%hostpath%/wlux/data/signin.php >> post_test_results.txt
echo , >> post_test_results.txt
curl -X POST -d "signIn[username]=defaultResearcher&signIn[password]=1Password" -g http://%hostpath%/wlux/data/signin.php  >> post_test_results.txt
echo , >> post_test_results.txt
curl -X POST -d "user=stuff" -g http://%hostpath%/wlux/data/signout.php >> post_test_results.txt
echo , >> post_test_results.txt
curl -X POST -d "config[some]=stuff" -g http://%hostpath%/wlux/data/study.php >> post_test_results.txt
echo , >> post_test_results.txt
curl -X POST -d "task[some]=stuff" -g http://%hostpath%/wlux/data/study.php >> post_test_results.txt
echo , >> post_test_results.txt
curl -X POST -d "schedule[some]=stuff" -g http://%hostpath%/wlux/data/study.php >> post_test_results.txt
echo , >> post_test_results.txt
curl -X POST -d "variable[some]=stuff" -g http://%hostpath%/wlux/data/study.php >> post_test_results.txt
echo ]} >> post_test_results.txt
