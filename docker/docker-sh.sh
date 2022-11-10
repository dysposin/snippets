#!/bin/bash

# open a shell inside a docker

if [ -z "$2" ]
then
    shell='sh'
else
    shell=$2
fi
docker run -it --rm --entrypoint /bin/"${shell}" ${1}