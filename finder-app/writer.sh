#!/bin/bash

WRITEFILE=$1
WRITESTR=$2

if [ $# -ne 2 ] 
then    
    echo "USAGE : $0 takes two arguments."
    echo "        $0 writeFile writeStr"
    exit 1
fi

if [ -f ${WRITEFILE} ] 
then 
    rm ${WRITEFILE}
    touch ${WRITEFILE}
    echo ${WRITESTR} > ${WRITEFILE}
    echo "Success"
    exit 0
else
    IFS='/'
    read -ra LIST <<< ${WRITEFILE}
    IFS=' '
    WRITEDIR=''
    CPT=0
    while (( CPT < $(( ${#LIST[@]} - 1 )) ))
    do
        WRITEDIR=${WRITEDIR}${LIST[${CPT}]}'/'
        if [ -d ${WRITEDIR} ] 
        then
            echo "${WRITEDIR} exists"
        else
            mkdir ${WRITEDIR}
        fi
        CPT=$((CPT+1))
    done
    touch ${WRITEFILE} 
    echo ${WRITESTR} > ${WRITEFILE} 
    echo "Success"
    exit 0
fi

echo "Fail"
exit 1



