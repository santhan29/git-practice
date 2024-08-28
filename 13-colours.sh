#!/bin/bash

userid=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"

CHECK_ROOT(){
    if [ $userid -ne 0 ]
    then 
        echo "please run script with root privileges"
        exit 1
    fi 

}

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo -e "$2 is $R failed $N"
    else 
        echo -e "$2 is $G success $N"
    fi 
}

CHECK_ROOT

dnf list installed git 

VALIDATE $? "listing git"

if [ $? -ne 0 ]
then
    echo "git is not installed then install git"
    dnf install git -y 
    VALIDATE $? "installing git" 
else 
    echo "git already installed nothing to do"
fi 

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "mysql is not installed install it"
    dnf install mysql -y 
    VALIDATE $? "installing mysql" 
else 
    echo "mysql is already installed nothing to do"
fi 
