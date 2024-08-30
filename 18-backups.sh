#!/bin/bash 

SOURCE_DIR=$1 
DEST_DIR=$2
DAYS=${3:-14}

USAGE(){
    echo "USAGE:: Sh 18-backup.sh <source> <destination> <days(optional)>"
}

if [ $# -lt 2 ]
then 
    USAGE 
fi 

if[ ! -d $SOURCE_DIR ]
then  
    echo "$SOURCE_DIR doesnot exist.. please check"
fi 

if[ ! -d $DEST_DIR ]
then 
    echo "$DEST_DIR doesnot exist.. please check"
fi 

FILES=$( find $SOURCE_DIR -name "*.log" -mtime +14)

if [ ! -z $FILES ]  #true if files are empty ! makes it false 
then  
    echo "files found"
else 
    echo "no files older than $DAYS"
fi 