#!/bin/bash
# generate passwords on command line

_usage="Usage: ${0} <password length>"
if [ $# < 2 ]
then
	echo ${_usage}
else
	head -c 500 /dev/urandom | tr -dc 'a-zA-Z0-9~!@#$%^&*_-.;:<>´`£¨`' | fold -w $1 | head -n 1
fi