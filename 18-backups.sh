#!/bin/bash 

SOURCE_DIR=$1 
DEST_DIR=$2
DAYS=${3:-14}
TIME_STAMP=$(date +%y-%m-%d-%H-%M-%S)

USAGE(){
    echo "USAGE:: Sh 18-backup.sh <source> <destination> <days(optional)>"
}

if [ $# -lt 2 ]
then 
    USAGE 
    exit 1
fi 

if [ ! -d $SOURCE_DIR ]
then  
    echo "$SOURCE_DIR doesnot exist.. please check"
fi 

if [ ! -d $DEST_DIR ]
then 
    echo "$DEST_DIR doesnot exist.. please check"
fi 

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +14)

if [ ! -z $FILES ]  #true if files are empty ! makes it false 
then  
    echo "files found"
    ZIP_FILE="$DEST_DIR/app-logs-$TIMESTAMP.zip"
    find $SOURCE_DIR -name "*.log" -mtime +14 | zip "$ZIP_FILE" -@

    if [ -f $ZIP_FILE ]
    then 
        echo "successfully zipped files older than $DAYS" 

        while IFS= read -r file  
        do 
            echo "deleting file : $file"
            rm -rf $file 
        done <<< $FILES 

    else 
        echo "zipping files is failed"
        exit 1
    fi
else 
    echo "no files older than $DAYS"
fi 