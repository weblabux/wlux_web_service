if exist put_test_results.txt (del put_test_results.txt)
type test_header.txt > put_test_results.txt
curl -X PUT --header "Content-Length: 0" -g http://localhost/wlux/data/account.php?user[some]=stuff >> put_test_results.txt
echo , >> put_test_results.txt
curl -X PUT --header "Content-Length: 0" -g http://localhost/wlux/data/study.php?task[some]=stuff >> put_test_results.txt
echo , >> put_test_results.txt
curl -X PUT --header "Content-Length: 0" -g http://localhost/wlux/data/study.php?schedule[some]=stuff >> put_test_results.txt
echo , >> put_test_results.txt
curl -X PUT --header "Content-Length: 0" -g http://localhost/wlux/data/study.php?variable[some]=stuff >> put_test_results.txt
echo ]} >> put_test_results.txt
