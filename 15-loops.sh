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

for package in $@
do 
    dnf list installed $package
    if [ $? -ne 0 ]
    then
        echo " $package is not intalled, going to install it "
        dnf install $package
        VALIDATE $? "installing package"
    else 
        echo " $package already installed nothing to do "
    fi 
done 
 