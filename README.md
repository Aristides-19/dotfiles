# 🐧 Dotfiles

Personal repository for managing system configurations, automation scripts, and hardware optimizations using **chezmoi**.

![Showcase](assets/showcase.png)

## Hardware: Asus TUF Gaming A16 Advantage Edition (FA617NT)

Contains specific configurations to optimize performance and fix known bugs for this model:

- **CPU:** AMD Ryzen 7 7735HS
- **dGPU:** AMD Radeon RX 7700S
- **Display:** 16" @ 165Hz
- **OS:** [CachyOS](https://github.com/CachyOS/linux-cachyos)
- **WM + Shell:** [Hyprland](https://github.com/hyprwm/hyprland) + [Noctalia](https://github.com/noctalia-dev/noctalia)

## Setup

Clone and apply the dotfiles:

```sh
chezmoi init https://github.com/Aristides-19/dotfiles.git
chezmoi apply
```

### One-time scripts (chezmoi `run_once`)

These run automatically on the first `chezmoi apply` after being added/modified, or can be run manually from `scripts/`:

| Script                                | Purpose                                                                                                      |
| ------------------------------------- | ------------------------------------------------------------------------------------------------------------ |
| `run_once_install.sh`                 | Installs all packages (official + AUR), sets Zsh as default shell, enables `asusd`/`supergfxd` (opinionated) |
| `run_once_noctalia_setup.sh`          | Installs Hyprland + Noctalia + uwsm + XDG portals, deploys `/etc/skel` GTK/cursor configs, enables plugins   |
| `run_once_wifi_fix.sh`                | Fixes Wi-Fi drops on Realtek RTL8852BE (disables power save in `rtw89` + NetworkManager)                     |
| `run_once_autologin.sh.tmpl`          | Configures agetty autologin on TTY1 for direct boot into Hyprland                                            |
| `run_onchange_setup_plymouth.sh.tmpl` | Deploys the `tuf-boot` Plymouth theme                                                                        |

## Repository structure

| Path                                                   | What it configures                                                           |
| ------------------------------------------------------ | ---------------------------------------------------------------------------- |
| `dot_config/hypr/`                                     | Hyprland (modular: binds, autostart, monitors, variables, windowrules...)    |
| `dot_config/noctalia/`                                 | Noctalia shell: bar, dock, control center, theming, idle, session actions    |
| `dot_config/uwsm/`                                     | uwsm session env (`AQ_DRM_DEVICES`, terminal, browser, Qt/GTK/Electron vars) |
| `dot_config/kitty/`                                    | Terminal                                                                     |
| `dot_config/gtk-3.0`, `gtk-4.0`, `qt6ct`, `xsettingsd` | Cross-toolkit theming                                                        |
| `dot_config/btop/`, `dot_config/fastfetch/`            | System monitor + fetch                                                       |
| `dot_config/systemd/user/`                             | User services (e.g. `fix-audio.service`)                                     |
| `dot_local/bin/`                                       | Custom user scripts (`recorder`, `fix-audio`, etc. added to `$PATH`)         |
| `dot_local/share/scripts/`                             | Battery/AC hooks (60Hz ↔ 165Hz switching)                                    |

## Keybindings

Main mod is **SUPER**. Full list in `dot_config/hypr/config/binds.lua`.

| Key                           | Action                                             |
| ----------------------------- | -------------------------------------------------- |
| `SUPER + Space`               | Launcher                                           |
| `SUPER + Return`              | Terminal (kitty + zsh)                             |
| `SUPER + W`                   | Browser (zen)                                      |
| `SUPER + E`                   | File manager (dolphin)                             |
| `SUPER + T`                   | Editor                                             |
| `SUPER + Q`                   | Close window                                       |
| `SUPER + D` / `SUPER + F`     | Maximize / Fullscreen                              |
| `SUPER + ALT + Space`         | Toggle float                                       |
| `SUPER + L`                   | Lock screen                                        |
| `SUPER + P`                   | Color picker                                       |
| `SUPER + SHIFT + S` / `Print` | Region / full screenshot                           |
| `SUPER + R`                   | Toggle region recording                            |
| `SUPER + SHIFT + R`           | Toggle fullscreen recording                        |
| `SUPER + ALT + R`             | Toggle recording with desktop audio                |
| `SUPER + V`                   | Clipboard manager                                  |
| `SUPER + X`                   | Control center                                     |
| `SUPER + 1..6`                | Switch workspace                                   |
| `SUPER + SHIFT + 1..6`        | Move window to workspace                           |
| `SUPER + CONTROL + arrows`    | Workspace / monitor navigation                     |
| `Fn + F6`                     | Region screenshot (firmware → `SUPER + SHIFT + S`) |
| Media/brightness keys         | Volume, mic, playback, brightness                  |

## Hardware / GPU notes

- `gpu_busy_percent` can report activity while nothing is using the GPU. To check if the dGPU is *really* busy, use `amdgpu_top` for per-process usage.

## Dynamic theming

Noctalia generates themes from the current wallpaper and applies them via templates (`dot_config/noctalia/templates/`).

## Troubleshooting

- **Wi-Fi drops:** `scripts/run_once_wifi_fix.sh`
- **Audio levels reset on boot (ALC256):** `dot_config/systemd/user/fix-audio.service` runs `~/.local/bin/fix-audio` after PipeWire/WirePlumber start (user service).
- **DRM card reordering:** the env resolves the GPU by PCI, so `cardN` changes are handled automatically.
- **Restart Noctalia:** `SUPER + Escape` (or `killall noctalia; nohup noctalia -d &`).

## Maintenance

```sh
chezmoi diff        # review changes
chezmoi apply       # apply changes
chezmoi cd          # enter the source directory
```
