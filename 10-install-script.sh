#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR:: You must have sudo access to execute this script"
    exit 1 #other than 0
fi

dnf list installed mysql

if [ $? -ne 0 ]

then #if not installed
    
dnf installed mysql -y
    if [ $? -ne 0 ]
        then
            echo "installing mariadb105 ......FAILUER"
        else
            echo "installing mariadb105 ......SUCCESS"
    fi

else
    echo "mariadb105 is Already ......INSTALLED"
fi

#Installing the Git

dnf list installed git

if [ $? -ne 0 ]
then  
    dnf install git -y
    if [ $? -ne 0 ]
        then
            echo "Installing Git ... FAILURE"
            exit 1
        else
             echo   "Installing Git ... SUCCESS"
    fi

else
        echo "Git Already .... INSTALLED"
fi