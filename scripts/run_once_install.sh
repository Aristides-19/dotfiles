#!/bin/bash

# =============================================================================
# INSTALL PACKAGES SCRIPT
# This script runs once to set up the
# environment on CachyOS/Arch Linux.
# =============================================================================

set -e # Exit on error

# COLORS
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}Starting install process...${NC}"

echo -e "${BLUE}update: Synchronizing repos...${NC}"
sudo pacman -Syu --noconfirm

PACKAGES=(
    # TERMINAL
    "kitty"
    "zsh"
    "oh-my-zsh-git"
    "zsh-theme-powerlevel10k"
    "zsh-autosuggestions"
    "zsh-syntax-highlighting"
    "fastfetch"
    # TOOLS
    "bitwarden"
    "github-cli"
    "micro"
    "wl-clipboard" # for micro cb fixing
    "btop"
    "helium-browser-bin"
    "systemctl-tui"
    "net-tools"
    "openbsd-netcat"
    # ASUS
    "asusctl"
    "supergfxctl"
    "rog-control-center"
    # FONTS
    "ttf-jetbrains-mono"
    "ttf-jetbrains-mono-nerd"
    "inter-font"
    # FLATPAK
    "flatpak"
    "bazaar"
    "flatseal"
    # CONTAINERS
    "podman"
    "podman-docker"
    "podman-compose"
    # WEB
    "nodejs"
    "pnpm"
)

AUR=(
    "klassy"
    "visual-studio-code-bin"
)

echo -e "${BLUE}Installing OFFICIAL packages...${NC}"
sudo pacman -S --needed --noconfirm "${PACKAGES[@]}"

echo -e "${BLUE}Installing AUR packages...${NC}"
paru -S --needed --noconfirm "${AUR[@]}"

echo -e "${GREEN}Package installation complete!${NC}"

if [ "$(basename "$SHELL")" != "zsh" ]; then
    echo -e "${YELLOW}Changing default shell to Zsh...${NC}"
    chsh -s /usr/bin/zsh
fi

echo -e "${BLUE}Enabling ASUS services...${NC}"
sudo systemctl enable asusd && echo -e "${YELLOW}Must restart to boot asusd.service${NC}"
sudo systemctl enable supergfxd && echo -e "${YELLOW}Must restart to boot supergfxd.service${NC}"

echo -e "${GREEN}Install complete!${NC}"
