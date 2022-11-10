#!/bin/bash

# rotate display on ubuntu
# check your input devices name with `xinput list`

input_device="AlpsPS/2 ALPS GlidePoint"
echo "$input_device Coordinate Transformation Matrix 0 -1 1 1 0 0 0 0 1" 

echo '$input_device'
if [ '$1' = 'l' ]
then
    xrandr -o left
    xinput set-prop  "$input_device Coordinate Transformation Matrix 0 -1 1 1 0 0 0 0 1"
elif [ '$1' = 'r' ]
then
    xrandr -o right
    xinput set-prop $input_device 'Coordinate Transformation Matrix' 0 1 0 -1 0 1 0 0 1
else
    xrandr -o normal
    xinput set-prop $input_device 'Coordinate Transformation Matrix' 1 0 0 0 1 0 0 0 1
fi
