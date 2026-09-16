#!/bin/zsh

backgrounds=(~/Pictures/background/*)

# Use the j parameter expantion flag to join the backgrounds array 
# into a single string with \n delimeters. Zsh only!!!
# Rofi will return the full background path
selected_bg=$(echo -e ${(j[\n])backgrounds} | rofi -dmenu)

# hyprpaper and hyprlock both look for this "background"
cp $selected_bg ~/.config/hypr/wall.png

hyprctl hyprpaper wallpaper "eDP-1, ~/.config/hypr/wall.png, cover"
hyprctl hyprpaper wallpaper "DP-1, ~/.config/hypr/wall.png, cover"
hyprctl hyprpaper wallpaper "HDMI-1, ~/.config/hypr/wall.png, cover"

