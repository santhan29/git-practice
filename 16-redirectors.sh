#!/bin/bash 

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIME_STAMP=$(date +%y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIME_STAMP.log"
mkdir -p $LOGS_FOLDER 

userid=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"

CHECK_ROOT(){
    if [ $userid -ne 0 ]
    then 
        echo -e "$R please run script with root privileges $N" &>>$LOG_FILE
        exit 1
    fi 

}

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo -e "$2 is $R failed $N" &>>$LOG_FILE
    else 
        echo -e "$2 is $G success $N" &>>$LOG_FILE
    fi 
}

CHECK_ROOT
