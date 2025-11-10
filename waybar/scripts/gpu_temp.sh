#!/bin/bash
# GPU temperature (average edge + junction)

hwmon_path=$(readlink -f /sys/class/drm/card0/device/hwmon/hwmon*)

total=0
count=0
for file in "$hwmon_path"/temp*_label; do
    [[ -f "$file" ]] || continue
    label=$(cat "$file")
    val_file=${file/_label/_input}
    case "$label" in
    *edge* | *junction*)
        val=$(($(cat "$val_file") / 1000))
        total=$((total + val))
        count=$((count + 1))
        ;;
    esac
done

if ((count > 0)); then
    echo "$((total / count))°C"
else
    echo ""
fi
