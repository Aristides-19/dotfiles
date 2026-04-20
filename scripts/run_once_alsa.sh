#!/bin/bash

set -e

# COLORS
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}Adding Alsamixer settings...${NC}"

sudo mkdir -p /etc/systemd/system/alsa-restore.service.d/

sudo cp "$HOME/.local/share/chezmoi/scripts/assets/alsa/asound.state" /var/lib/alsa/asound.state
sudo cp "$HOME/.local/share/chezmoi/scripts/assets/alsa/alsa-fix.conf" /etc/systemd/system/alsa-restore.service.d/override.conf

sudo systemctl daemon-reload
sudo systemctl enable --now alsa-restore

sudo alsactl store
echo -e "${GREEN}Alsamixer settings applied!${NC}"
