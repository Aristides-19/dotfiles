#!/bin/bash

# =============================================================================
# INSTALL PACKAGES SCRIPT
# This script runs once to set up the
# environment on CachyOS/Arch Linux.
# =============================================================================

set -e # Exit on error

echo "Starting install process..."

echo "update: Synchronizing repos..."
sudo pacman -Syu --noconfirm

PACKAGES=(
    "kitty"
    "zsh"
    "zsh-theme-powerlevel10k"
    "zsh-autosuggestions"
    "zsh-syntax-highlighting"
    "fastfetch"
    "code"
    "bitwarden"
    "asusctl"
    "supergfxctl"
    "rog-control-center"
    "github-cli"
    "ttf-jetbrains-mono"
    "ttf-jetbrains-mono-nerd"
    "micro"
    "btop"
    "helium-browser-bin"
    "systemctl-tui"
)

echo "Installing packages..."
sudo pacman -S --needed --noconfirm "${PACKAGES[@]}"

if [ "$SHELL" != "/usr/bin/zsh" ]; then
    echo "Changing default shell to Zsh..."
    chsh -s /usr/bin/zsh
fi

echo "Package installation complete!"