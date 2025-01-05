$!/bin/bash

NUMBER=$1

# -gt (Greater-than), -lt (Less-than), -eq (equal), -ge (greater than equal), -le (Less than equal)

if [ $NUMBER -gt 100 ]
then
    echo "given number is greter then 100"
else
    echo "given number less then or equal to 100" 
fi