#!/bin/bash

ans=$(echo -e " monitor\n window\n region\n active\n cancel" | rofi -dmenu -format i:s)

case "${ans:0:1}" in
    0) hyprshot -o ~/Pictures/Screenshots -s -m output;;
    1) hyprshot -o ~/Pictures/Screenshots -s -m window;;
    2) hyprshot -o ~/Pictures/Screenshots -s -m region;;
    3) hyprshot -o ~/Pictures/Screenshots -s -m active;;
    4) exit;;
esac
