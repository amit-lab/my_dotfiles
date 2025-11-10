#!/bin/bash
# Simple temperature monitor for Ryzen + Radeon GPUs

get_cpu_temp() {
    # CPU Tctl (Ryzen)
    local cpu_temp
    cpu_temp=$(sensors | awk '/Tctl:/ {print $2; exit}' | tr -d '+°C')
    [[ -z "$cpu_temp" ]] && cpu_temp="N/A"
    echo "$cpu_temp"
}

get_gpu_temp() {
    # GPU junction temperature (Radeon)
    local gpu_temp
    gpu_temp=$(sensors | awk '/junction:/ {print $2; exit}' | tr -d '+°C')
    [[ -z "$gpu_temp" ]] && gpu_temp=$(sensors | awk '/edge:/ {print $2; exit}' | tr -d '+°C')
    [[ -z "$gpu_temp" ]] && gpu_temp="N/A"
    echo "$gpu_temp"
}

cpu_temp=$(get_cpu_temp)
gpu_temp=$(get_gpu_temp)

echo "🧮 ${cpu_temp}°C | 🎮 ${gpu_temp}°C"
