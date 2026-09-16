#!/bin/bash

ans=$(echo -e "obs\nobs camera stream\ncancel" | rofi -dmenu -format i:s)

case "${ans:0:1}" in
    0) env -u QT_QPA_PLATFORMTHEME obs;;
    1) env -u QT_QPA_PLATFORMTHEME obs --startvirtualcam;;
    2) exit;;
esac
