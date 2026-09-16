#!/bin/bash

gpu_temp=$(amd-smi metric --json | jq '.[].temperature.hotspot.value')
gpu_usage=$(amd-smi metric --json | jq '.[].usage.gfx_activity.value')

echo "󰾲 ${gpu_usage}󱉸 ${gpu_temp}󰔄"
