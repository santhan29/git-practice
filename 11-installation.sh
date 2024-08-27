#!/bin/bash

userid=$(id -u)
#echo "user id is $userid"

if [ $userid -ne 0 ]
    then 
        echo "please run script with root privileges"
        exit 1
fi 

dnf install git -y 
