#!/bin/bash

set -e

# COLORS
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}Configuring Wi-Fi drop fix for Realtek RTL8852BE...${NC}"

# Disable power saving in rtw89 kernel module
sudo mkdir -p /etc/modprobe.d
sudo tee /etc/modprobe.d/rtw89.conf > /dev/null << 'EOF'
options rtw89_core disable_ps_mode=y
options rtw89_pci disable_aspm_l1=y disable_aspm_l1ss=y disable_clkreq=y
EOF

# Disable power saving in NetworkManager
sudo mkdir -p /etc/NetworkManager/conf.d
sudo tee /etc/NetworkManager/conf.d/default-wifi-powersave-on.conf > /dev/null << 'EOF'
[connection]
wifi.powersave = 2
EOF

echo -e "${GREEN}Wi-Fi fix for RTL8852BE applied successfully!${NC}"
