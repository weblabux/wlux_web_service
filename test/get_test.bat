if exist get_test_results.txt (del get_test_results.txt)
type test_header.txt > get_test_results.txt
curl -g http://localhost/wlux/data/account.php?user[some]=stuff >> get_test_results.txt
echo , >> get_test_results.txt
curl -g http://localhost/wlux/data/debug.php?config[some]=stuff >> get_test_results.txt
echo , >> get_test_results.txt
curl -g http://localhost/wlux/data/gratuity.php?study[some]=stuff >> get_test_results.txt
echo , >> get_test_results.txt
curl -g http://localhost/wlux/data/log.php?session[some]=stuff >> get_test_results.txt
echo , >> get_test_results.txt
curl -g http://localhost/wlux/data/log.php?sessions[some]=stuff >> get_test_results.txt
echo , >> get_test_results.txt
curl -g http://localhost/wlux/data/log.php?allStudies[some]=stuff >> get_test_results.txt
echo , >> get_test_results.txt
curl -g http://localhost/wlux/data/log.php?study[some]=stuff >> get_test_results.txt
echo , >> get_test_results.txt
curl -g http://localhost/wlux/data/session.php?config[some]=stuff >> get_test_results.txt
echo , >> get_test_results.txt
curl -g http://localhost/wlux/data/study.php?config[some]=stuff >> get_test_results.txt
echo , >> get_test_results.txt
curl -g http://localhost/wlux/data/study.php?allStudyIds[some]=stuff >> get_test_results.txt
echo , >> get_test_results.txt
curl -g http://localhost/wlux/data/study.php?studyElements[some]=stuff >> get_test_results.txt
echo , >> get_test_results.txt
curl -g http://localhost/wlux/data/study.php?name[some]=stuff >> get_test_results.txt
echo , >> get_test_results.txt
curl -g http://localhost/wlux/data/study.php?task[some]=stuff >> get_test_results.txt
echo , >> get_test_results.txt
curl -g http://localhost/wlux/data/study.php?schedule[some]=stuff >> get_test_results.txt
echo , >> get_test_results.txt
curl -g http://localhost/wlux/data/study.php?variable[some]=stuff >> get_test_results.txt
echo ]} >> get_test_results.txt
