if exist post_test_results.txt (del post_test_results.txt)
type test_header.txt > post_test_results.txt
curl -X POST --header "Content-Length: 0" -g http://localhost/wlux/data/account.php?user[some]=stuff >> post_test_results.txt
echo , >> post_test_results.txt
curl -X POST --header "Content-Length: 0" -g http://localhost/wlux/data/gratuity.php?gratuity[some]=stuff >> post_test_results.txt
echo , >> post_test_results.txt
curl -X POST --header "Content-Length: 0" -g http://localhost/wlux/data/log.php?load[some]=stuff >> post_test_results.txt
echo , >> post_test_results.txt
curl -X POST --header "Content-Length: 0" -g http://localhost/wlux/data/log.php?transition[some]=stuff >> post_test_results.txt
echo , >> post_test_results.txt
curl -X POST --header "Content-Length: 0" -g http://localhost/wlux/data/session.php?start[some]=stuff >> post_test_results.txt
echo , >> post_test_results.txt
curl -X POST --header "Content-Length: 0" -g http://localhost/wlux/data/session.php?startNextTask[some]=stuff >> post_test_results.txt
echo , >> post_test_results.txt
curl -X POST --header "Content-Length: 0" -g http://localhost/wlux/data/session.php?finishCurrentTask[some]=stuff >> post_test_results.txt
echo , >> post_test_results.txt
curl -X POST --header "Content-Length: 0" -g http://localhost/wlux/data/signin.php?user=stuff >> post_test_results.txt
echo , >> post_test_results.txt
curl -X POST --header "Content-Length: 0" -g http://localhost/wlux/data/signout.php?user=stuff >> post_test_results.txt
echo , >> post_test_results.txt
curl -X POST --header "Content-Length: 0" -g http://localhost/wlux/data/study.php?config[some]=stuff >> post_test_results.txt
echo , >> post_test_results.txt
curl -X POST --header "Content-Length: 0" -g http://localhost/wlux/data/study.php?task[some]=stuff >> post_test_results.txt
echo , >> post_test_results.txt
curl -X POST --header "Content-Length: 0" -g http://localhost/wlux/data/study.php?schedule[some]=stuff >> post_test_results.txt
echo , >> post_test_results.txt
curl -X POST --header "Content-Length: 0" -g http://localhost/wlux/data/study.php?variable[some]=stuff >> post_test_results.txt
echo ]} >> post_test_results.txt
