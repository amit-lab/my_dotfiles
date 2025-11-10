#!/bin/bash
# Clipboard menu + clear action

case "$1" in
clear)
    cliphist wipe
    notify-send "Clipboard Cleared" "All history has been deleted." -i edit-clear
    ;;
*)
    cliphist list | wofi --dmenu --prompt "Clipboard:" | cliphist decode | wl-copy
    ;;
esac
