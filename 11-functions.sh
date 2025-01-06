#!/bin/bash

USERID=$(id -u)

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo "$2.....FAILED"
        exit 1
    else
        echo "$2 ....SUCCESS"
}

if [ $USERID -ne 0 ]
then 
    echo "ERROR::you must sudo access to excute this script"
    exit 1 #other then 0
fi

dnf list installed mysql

if [ $? -ne 0 ]
then #not installed
    dnf installed mysql -y
    VALIDATE $? "Installing MYSQL"
else
    echo "MYSQL is already .....INSTALLED"
fi

dnf list installed Git

if [ $? -ne 0 ]
then #not installed
    dnf installed git -y
    VALIDATE $? "Installing Git"
else
    echo "Git is already .....INSTALLED"
fi
