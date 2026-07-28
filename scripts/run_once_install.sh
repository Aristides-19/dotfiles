#!/bin/bash

# =============================================================================
# INSTALL PACKAGES SCRIPT
# This script runs once to set up the environment on CachyOS/Arch Linux.
# =============================================================================

set -e # Exit on error

# COLORS
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}Starting package installation process...${NC}"

echo -e "${BLUE}Synchronizing repositories...${NC}"
sudo pacman -Sy --noconfirm

PACKAGES=(
    # TERMINAL & SHELL
    "kitty"
    "zsh"
    "oh-my-zsh-git"
    "zsh-theme-powerlevel10k"
    "zsh-autosuggestions"
    "zsh-syntax-highlighting"
    "fastfetch"
    "btop"
    
    # CLI UTILITIES & TOOLS
    "chezmoi"
    "github-cli"
    "micro"
    "wl-clipboard"
    "systemctl-tui"
    "zoxide"
    "eza"
    "bat"
    "ripgrep"
    "fd"
    "fzf"
    "tldr"
    "lazygit"
    "lazydocker"
    
    # NETWORK UTILITIES
    "net-tools"
    "openbsd-netcat"
    "tailscale"
    "kdeconnect"
    
    # ASUS
    "asusctl"
    "supergfxctl"
    "rog-control-center"
    
    # PRODUCTIVITY & APPS
    "bitwarden"
    "obsidian"
    "qbittorrent"
    "vesktop"
    "prismlauncher"
    "gpu-screen-recorder"
    "mpv"
    "gimp"
    "veracrypt"
    "protonup-qt"
    "opencode"
    
    # FONTS
    "ttf-jetbrains-mono"
    "ttf-jetbrains-mono-nerd"
    "inter-font"
    
    # FLATPAK & CONTAINERS
    "flatpak"
    "bazaar"
    "flatseal"
    "podman"
    "podman-docker"
    "podman-compose"
    
    # DEVELOPMENT RUNTIMES
    "dotnet-sdk"
    "nodejs"
    "pnpm"
    "go"
    "rust"
    "fvm"
)

AUR=(
    "visual-studio-code-bin"
    "zen-browser-bin"
    "onlyoffice-bin"
    "lazyssh"
    "qdirstat"
    "openchamber"
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

echo -e "${GREEN}Environment setup complete!${NC}"
