#!/bin/bash
# prompt that will ask to cancle, or power off reboot the system

ans=$(echo -e "cancel\nreboot\nsoft reboot\nreboot to UEFI" | rofi -dmenu -format i -p "Reboot")

case $ans in
    0) exit;;
    1) systemctl reboot;;
    2) systemctl soft-reboot;;
    3) systemctl reboot --firmware-setup;;
esac
