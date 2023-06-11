#!/usr/bin/env zsh

WALLPAPER_DIR=$1
MONITOR=$2
CYCLE=$3

sleep 2

while true; do
    wallpapers=($(ls $WALLPAPER_DIR | shuf))

    for wallpaper in $wallpapers; do
        wallpaper="$WALLPAPER_DIR/$wallpaper"
        hyprctl hyprpaper preload $wallpaper
        hyprctl hyprpaper wallpaper "$MONITOR,$wallpaper"
        hyprctl hyprpaper unload all
        sleep $CYCLE
    done
done
