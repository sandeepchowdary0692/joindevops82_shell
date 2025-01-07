#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m" #norml color

LOGS_FOLDER="/var/log/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1 ) 
TIMESTAMP=$(date +%Y-%m%-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGs_FOLDER/$LOG_FILE$TIMESTAMP.log"


VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo -e "$2..... $R FAILED $N"
        exit 1
    else
        echo -e "$2....$G SUCCESS $N"
}

echo "Script started executing at: $TIMESTAMP" &>>$LOG_FILE_NAME

if [ $USERID -ne 0 ]
then 
    echo "ERROR::you must sudo access to excute this script"
    exit 1 #other then 0
fi

dnf list installed mariadb105 &>>LOG_FILE_NAME

if [ $? -ne 0 ]
then #not installed
    dnf install mariadb105 -y
    VALIDATE $? "Installing mariadb105"
else
    echo -e "Mariadb105 is already ..... $Y INSTALLED $N"
fi

dnf list installed Git &>>LOG_FILE_NAME

if [ $? -ne 0 ]
then #not installed
    dnf install git -y >>$LOG_FILE_NAME
    VALIDATE $? "Installing Git"
else
    echo "Git is already .....$Y INSTALLED $N"
fi
