#!/bin/bash

userid=$(id -u)
#echo "user id is $userid"

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo "$2 is failed"
    else 
        echo "$2 is success"
    fi 
}

if [ $userid -ne 0 ]
    then 
        echo "please run script with root privileges"
        exit 1
fi 

dnf list installed git 

VALIDATE $? "listing git"

# if [ $? -ne 0 ]
# then
#     echo "git is not installed then install git"
#     dnf install git -y 
#     if [ $? -ne 0 ]
#     then 
#         echo "git installation not success"
#         exit 1
#     else 
#         echo "git installation is success"
#     fi 
# else 
#     echo "git already installed nothing to do"
# fi 

# dnf list installed mysql

# if [ $? -ne 0 ]
# then
#     echo "mysql is not installed install it"
#     dnf install mysql -y 
#     if [ $? -ne 0 ]
#     then 
#         echo "mysql installation is failure please check"
#         exit 1 
#     else 
#         echo "mysql installation is success"
#     fi 
# else 
#     echo "mysql is already installed nothing to do"
# fi 

