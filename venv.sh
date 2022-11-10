#!/bin/bash

# bootstrap virtualenv

DIRECTORY=venv
if [ -d "$DIRECTORY" ]
then
    source venv/bin/activate
else
    python${1:-"3.10"} -m venv "$DIRECTORY"
    source venv/bin/activate
    pip install --upgrade pip
    pip install bpython
fi
