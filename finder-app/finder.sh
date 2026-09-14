#!/bin/bash

FILESDIR=$1
SEARCHSTR=$2

if [ $# -ne 2 ] 
then    
    echo "USAGE : $0 takes two arguments."
    echo "        $0 filesDirectory searchSTR"
    exit 1
fi

if [ -d ${FILESDIR} ] 
then 
    X=$(find -L ${FILESDIR} -type f | wc -l)
    Y=$(grep -R ${SEARCHSTR} ${FILESDIR} | wc -l)
    echo "The number of files are $X and the number of matching lines are $Y"
    exit 0
else
    echo "The file directory doesn't exist"
    exit 1
fi

