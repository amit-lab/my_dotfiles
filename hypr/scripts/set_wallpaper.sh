#!/bin/bash
# Simple Hyprpaper wallpaper setter

# Folder where your wallpapers live
WALLPAPER_DIR="$HOME/Pictures/wallpapers"

# If an argument is provided, use that file; otherwise, pick a random one
if [[ -n "$1" ]]; then
    WALLPAPER="$1"
else
    WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -iname '*.jpg' -o -iname '*.png' -o -iname '*.jpeg' \) | shuf -n 1)
fi

# Get monitor names from hyprctl
MONITORS=$(hyprctl monitors | grep "Monitor" | awk '{print $2}')

# Create new hyprpaper.conf
CONF="$HOME/.config/hypr/hyprpaper.conf"
echo "" >"$CONF"
echo "preload = $WALLPAPER" >>"$CONF"

for MON in $MONITORS; do
    echo "wallpaper = $MON,$WALLPAPER" >>"$CONF"
done

# Restart hyprpaper
pkill hyprpaper 2>/dev/null
hyprpaper &
