#!/bin/bash
## 60Hz
MONITOR=$(hyprctl monitors -j | jq -r '.[] | select(.name | test("eDP")).name')
hyprctl eval "hl.monitor({ output = \"$MONITOR\", mode = \"1920x1200@60\", position = \"auto\", scale = \"1\" })"
