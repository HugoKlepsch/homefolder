#!/usr/bin/bash -e

args=("$@")

if [ $# -ne 1 ]
then
    exit
fi



max=`cat /sys/class/backlight/intel_backlight/max_brightness`
current=`cat /sys/class/backlight/intel_backlight/brightness`
echo $current

if [ ${args[0]} = "up" ]
then
    new=$(($current+100))
else 
    new=$(($current-100))
fi

echo $new
if [ $new -lt 0 ]
then
    new=0
fi

if [ $new -gt $max ]
then
    new=$max
fi


