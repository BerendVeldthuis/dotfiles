#!/bin/bash
caps_state=$(hyprctl devices -j | jq '.keyboards[] | select(.name=="at-translated-set-2-keyboard") 
                                     | .capsLock')
num_state=$(hyprctl devices -j | jq '.keyboards[] | select(.name=="at-translated-set-2-keyboard") 
                                     | .numLock')

output_string=""
if [[ $caps_state == "true" ]]; then
  output_string="${output_string}󰪛"
fi

if [[ $num_state == "false" ]]; then
  output_string="${output_string}󰌐"
fi

echo "$output_string"
