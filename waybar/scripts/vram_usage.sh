#!/bin/bash
# Accurate AMD GPU VRAM usage monitor for Waybar
# Tested with ROCm SMI output format (ROCm 6.x)

ROCM_SMI=$(command -v rocm-smi || echo "/opt/rocm/bin/rocm-smi")

if [[ -x "$ROCM_SMI" ]]; then
    # Extract values for GPU[0]
    total=$($ROCM_SMI --showmeminfo vram | awk '/GPU\[0\].*VRAM Total Memory/ {print $(NF)}' | head -n1 | tr -d '[:alpha:]():')
    used=$($ROCM_SMI --showmeminfo vram | awk '/GPU\[0\].*VRAM Total Used Memory/ {print $(NF)}' | head -n1 | tr -d '[:alpha:]():')

    if [[ "$used" =~ ^[0-9]+$ && "$total" =~ ^[0-9]+$ && "$total" -gt 0 ]]; then
        percent=$((100 * used / total))
        used_gb=$(awk "BEGIN {printf \"%.1f\", $used/1073741824}")
        total_gb=$(awk "BEGIN {printf \"%.0f\", $total/1073741824}")
        echo "${used_gb}G (${percent}%)"
    else
        echo ""
    fi
else
    echo ""
fi
