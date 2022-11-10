#!/bin/bash

# add a new ssh alias

config="~/.ssh/config"

_usage="Not enough arguments supplied.\nUsage: ${0} user@example.com alias"
if [ $# < 3 ]
then
    echo -e ${_usage}
else
    IFS="@" read -ra connection <<< "$1"
    alias=$2
    echo "adding ${1} as ${alias} to .ssh/config"
    echo -e "host ${alias}\nhostname ${connection[1]}\nuser ${connection[0]}\n" >> ${config}
fi
