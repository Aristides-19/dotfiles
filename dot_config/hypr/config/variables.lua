-- Hyprland default apps

TERMINAL     = "kitty"
FILE_MANAGER = "nautilus"
BROWSER      = "zen-browser"
EDITOR       = "gnome-text-editor --new-window"
CALCULATOR   = "gnome-calculator"

-- Detect connected primary internal display (eDP-1 in Ultimate/Dedicated mode, eDP-2 in Hybrid mode)
local function get_primary_monitor()
    local handle = io.popen("for s in /sys/class/drm/card*-eDP-*/status; do [ -f \"$s\" ] && grep -q '^connected$' \"$s\" && basename \"$(dirname \"$s\")\" | sed 's/card[0-9]*-//' && break; done")
    if handle then
        local result = handle:read("*l")
        handle:close()
        if result and result ~= "" then
            return result
        end
    end
    return "eDP-2"
end

-- Monitors
MONITOR1 = get_primary_monitor()
MONITOR2 = ""
MONITOR3 = ""
PRIMARY_MONITOR = MONITOR1

-- Workspaces
NUM_WPM = 6 -- Number of workspaces per monitor (Max 10)
