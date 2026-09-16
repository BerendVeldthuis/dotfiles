#!/bin/bash
# prompt that will ask to cancle, or power off the system

ans=$(echo -e "0) cancel\n1) shutdown" | rofi -dmenu -format i:s -p 'Shutdown?')

case "${ans:0:1}" in
    0) exit;;
    1) /usr/bin/numlockx off; systemctl poweroff;;
esac
