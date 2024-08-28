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
Y="\e[33m"

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

USAGE(){
    echo -e "$R USAGE:: $N sudo sh 16-redirectors.sh package1..package2.."
    exit 1 
}

echo "script started executing at $(date)"

CHECK_ROOT

if [ $# -eq 0 ]
then
    USAGE
fi 

for package in $@
do 
    dnf list installed $package &>>$LOG_FILE
    if [ $? -ne 0 ]
    then
        echo "$package is not intalled, going to install it" &>>$LOG_FILE
        dnf install $package &>>$LOG_FILE
        VALIDATE $? "installing package"
    else 
        echo -e "$package already $Y installed nothing to do $N" &>>$LOG_FILE
    fi 
done 
