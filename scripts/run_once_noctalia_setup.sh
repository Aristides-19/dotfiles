#!/bin/bash

# =============================================================================
# SETUP NOCTALIA & HYPRLAND SCRIPT
# This script installs Noctalia, Hyprland, XDG portals and deploys skeleton configs
# =============================================================================

set -e

# COLORS
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}Starting Noctalia & Hyprland setup...${NC}"

echo -e "${BLUE}Synchronizing repositories...${NC}"
sudo pacman -Sy --noconfirm

NOCTALIA_PACKAGES=(
    "hyprland"
    "noctalia"
    "cachyos-hypr-noctalia"
    "xdg-desktop-portal-hyprland"
    "xdg-desktop-portal-gtk"
    "uwsm"
)

echo -e "${BLUE}Installing Hyprland & Noctalia packages...${NC}"
sudo pacman -S --needed --noconfirm "${NOCTALIA_PACKAGES[@]}"

echo -e "${BLUE}Deploying Noctalia & Hyprland default configurations from /etc/skel...${NC}"
mkdir -p ~/.config ~/.local/share/icons ~/.icons

# Copy skeleton configs from /etc/skel to the user's home directory
cp -rf /etc/skel/.config/gtk-3.0/gtk.css ~/.config/gtk-3.0/ 2>/dev/null || true
cp -rf /etc/skel/.config/gtk-4.0 ~/.config/ 2>/dev/null || true
cp -rf /etc/skel/.config/menus ~/.config/ 2>/dev/null || true
cp -rf /etc/skel/.config/kdeglobals ~/.config/ 2>/dev/null || true

# Copy cursor themes
cp -rf /etc/skel/.local/share/icons/* ~/.local/share/icons/ 2>/dev/null || true
cp -rf /etc/skel/.icons/* ~/.icons/ 2>/dev/null || true

echo -e "${GREEN}Noctalia & Hyprland setup complete!${NC}"
