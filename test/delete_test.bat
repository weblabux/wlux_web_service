if exist delete_test_results.txt (del delete_test_results.txt)
type test_header.txt > delete_test_results.txt
curl -X DELETE --header "Content-Length: 0" -g http://localhost/wlux/data/account.php?user[some]=stuff >> delete_test_results.txt
echo , >> delete_test_results.txt
curl -X DELETE --header "Content-Length: 0" -g http://localhost/wlux/data/study.php?config[some]=stuff >> delete_test_results.txt
echo , >> delete_test_results.txt
curl -X DELETE --header "Content-Length: 0" -g http://localhost/wlux/data/study.php?task[some]=stuff >> delete_test_results.txt
echo , >> delete_test_results.txt
curl -X DELETE --header "Content-Length: 0" -g http://localhost/wlux/data/study.php?schedule[some]=stuff >> delete_test_results.txt
echo , >> delete_test_results.txt
curl -X DELETE --header "Content-Length: 0" -g http://localhost/wlux/data/study.php?variable[some]=stuff >> delete_test_results.txt
echo ]} >> delete_test_results.txt
