if exist full_test_results.txt (del full_test_results.txt)
echo [ > full_test_results.txt
call get_test.bat
type get_test_results.txt >>full_test_results.txt
echo , >>full_test_results.txt
call post_test.bat
type post_test_results.txt >>full_test_results.txt
echo , >>full_test_results.txt
call put_test.bat
type put_test_results.txt >>full_test_results.txt
echo , >>full_test_results.txt
call delete_test.bat
type delete_test_results.txt >>full_test_results.txt
echo ] >>full_test_results.txt
