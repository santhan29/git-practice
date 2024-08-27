#!/bin/bash 

echo "all variables passed to the script: $@"
echo "number of variables passed: $#"
echo "script name: $0"
echo "current working directory: $PWD"
echo "home directory of current user: $HOME"
echo "process id of script executing now: $$"
echo "process id of last background command: $!"