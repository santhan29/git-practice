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