#!/bin/bash

# userid=$(id -u)
# #echo "user id is $userid"

# if [ $userid -ne 0 ]
#     then 
#         echo "please run script with root privileges"
#         exit 1
# fi 

dnf list installed git 

if [ $? -ne 0 ]
then
    echo "git is not installed then install git"
    dnf install git -y 
    if [ $? -ne 0 ]
    then 
        echo "git installation not success"
        exit 1
    else 
        echo "git installation is success"
    fi 
else 
    echo "git already installed nothing to do"
fi 

