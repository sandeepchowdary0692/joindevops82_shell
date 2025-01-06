#!/bin/bash

USERID=$(id -u)

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo "$2.....FAILED"
        exit 1
    else
        echo "$2....SUCCESS"
    fi
}

if [ $USERID -ne 0 ]
then 
    echo "ERROR::you must sudo access to excute this script"
    exit 1 #other then 0
fi

dnf list installed mariadb105

if [ $? -ne 0 ]
then #not installed
    dnf install mariadb105 -y
    VALIDATE $? "Installing mariadb105"
else
    echo "Mariadb105 is already .....INSTALLED"
fi

dnf list installed Git

if [ $? -ne 0 ]
then #not installed
    dnf install git -y
    VALIDATE $? "Installing Git"
else
    echo "Git is already .....INSTALLED"
fi
