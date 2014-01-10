@echo off
setlocal enableDelayedExpansion
set hostpath=%1
if "%hostpath%"=="" set hostpath=localhost
if exist full_test_results.txt (del full_test_results.txt)
if exist full_test_output.txt (del full_test_output.txt)
echo [ > full_test_results.txt
call test_405.bat %hostpath%
type test_405_results.txt >>full_test_results.txt
echo , >>full_test_results.txt
call get_test.bat %hostpath%
type get_test_results.txt >>full_test_results.txt
echo , >>full_test_results.txt
call post_test.bat %hostpath%
type post_test_results.txt >>full_test_results.txt
echo , >>full_test_results.txt
call put_test.bat %hostpath%
type put_test_results.txt >>full_test_results.txt
echo , >>full_test_results.txt
call delete_test.bat %hostpath%
type delete_test_results.txt >>full_test_results.txt
echo ] >>full_test_results.txt
