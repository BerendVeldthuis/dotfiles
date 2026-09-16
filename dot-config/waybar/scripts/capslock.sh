#!/bin/bash
caps_state=$(hyprctl devices -j | jq '.keyboards[] | select(.name=="at-translated-set-2-keyboard") 
                                     | .capsLock')
if [[ $caps_state == "true" ]]; then
  echo "󰪛"
else
  echo ""
fi
