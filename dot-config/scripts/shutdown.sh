#!/bin/bash
# prompt that will ask to cancle, or power off the system

ans=$(echo -e "no\nyes" | rofi -dmenu -format i -u 1 -p "Shutdown?")

case $ans in
    0) exit;;
    1) systemctl poweroff;;
esac
