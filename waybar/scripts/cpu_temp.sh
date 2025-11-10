#!/bin/bash
# CPU temperature (btop-style)

for hwmon in /sys/class/hwmon/hwmon*; do
    if [[ -f "$hwmon/name" && $(cat "$hwmon/name") == "k10temp" ]]; then
        for file in "$hwmon"/temp*_label; do
            [[ -f "$file" ]] || continue
            label=$(cat "$file")
            if [[ "$label" =~ Tctl|Tdie ]]; then
                val_file=${file/_label/_input}
                temp=$(($(cat "$val_file") / 1000 - 5))
                echo "${temp}°C"
                exit 0
            fi
        done
    fi
done
