#!/bin/bash

# Get devices by sending commands to bluetoothctl interactive shell
devices=$(
    bluetoothctl <<EOF
devices
exit
EOF
)

# Extract MAC addresses
device_mac=$(echo "$devices" | grep "Device" | awk '{print $2}')

# If no device is found, exit
if [[ -z "$device_mac" ]]; then
    exit 0
fi

# Function to get device info
get_device_info() {
    local mac=$1
    bluetoothctl <<EOF
info $mac
exit
EOF
}

# Function to get battery percentage
get_battery_percentage() {
    local mac=$1
    local battery_line

    # Get info using here-document
    device_info=$(get_device_info "$mac")

    # Extract the battery line
    battery_line=$(echo "$device_info" | grep "Battery Percentage")

    # Handle missing battery info
    [[ -z "$battery_line" ]] && echo "N/A" && return

    # Extract the percentage from inside parentheses - this gets "90" from " (90)"
    if [[ "$battery_line" =~ \(([0-9]+)\) ]]; then
        echo "${BASH_REMATCH[1]}"
    else
        # Fallback to hex conversion if no parentheses
        battery_hex=$(echo "$battery_line" | grep -o '0x[0-9A-Fa-f]\+' | head -1)
        if [[ -n "$battery_hex" ]]; then
            battery_hex=${battery_hex#0x}
            echo $((16#$battery_hex))
        else
            echo "N/A"
        fi
    fi
}

# Function to check if connected
is_connected() {
    local mac=$1
    local device_info=$(get_device_info "$mac")
    echo "$device_info" | grep -q "Connected: yes"
}

# Define icons for specific devices (MAC addresses)
declare -A device_icons
device_icons=(
    ["C4:CB:BE:15:3B:F0"]="🎧" # Your realme Buds
    ["2C:BE:EB:45:7E:32"]="🎧" # Headset
    ["D2:B8:F5:32:9D:E6"]="󰍽" # Mouse
    ["D0:9E:78:FB:EC:5E"]="" # Keyboard
)

# Loop through devices
output=""
tooltip=""
for mac in $device_mac; do
    # Check if connected
    is_connected "$mac" || continue

    battery=$(get_battery_percentage "$mac")

    # Skip devices with no battery info
    [[ "$battery" == "N/A" ]] && continue

    # Get icon, default to 🔋 if not in the list
    icon=${device_icons[$mac]:-"🔋"}

    # Append to Waybar display and tooltip
    output+="$icon $battery%  "
    tooltip+="$icon $mac: $battery%\n"
done

# Remove trailing newline from tooltip
tooltip=$(echo -e "$tooltip" | sed '$ d')

# Output for Waybar
echo "$output"
