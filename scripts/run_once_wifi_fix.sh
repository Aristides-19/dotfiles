#!/bin/bash

set -e

# COLORS
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}Setting solution for Realtek RTL8852BE sleep...${NC}"

sudo mkdir -p /etc/modprobe.d
sudo tee /etc/modprobe.d/rtw89.conf > /dev/null << 'EOF'
options rtw89_core disable_ps_mode=y
options rtw89_pci disable_aspm_l1=y disable_aspm_l1ss=y disable_clkreq=y
EOF

sudo mkdir -p /etc/NetworkManager/conf.d
sudo tee /etc/NetworkManager/conf.d/default-wifi-powersave-on.conf > /dev/null << 'EOF'
[connection]
wifi.powersave = 2
EOF

echo -e "${GREEN}Realtek RTL8852BE sleep solution applied. Reboot required.${NC}"
