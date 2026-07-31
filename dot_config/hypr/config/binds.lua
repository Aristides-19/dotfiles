local mainMod = "SUPER"
local noctCall = "noctalia msg "
local launchPrefix = "uwsm app -- " -- if you are not using UWSM, make this empty (e.g. "")

-- 1. Window Management

-- Window manipulation
hl.bind(mainMod .. " + Q",           hl.dsp.window.close(), { description = "Close active window" })
hl.bind(mainMod .. " + ALT + Space", hl.dsp.window.float({ action = "toggle" }), { description = "Toggle floating mode" })
hl.bind(mainMod .. " + D",           hl.dsp.window.fullscreen({ mode = 1 }), { description = "Toggle maximize window" })
hl.bind(mainMod .. " + F",           hl.dsp.window.fullscreen(), { description = "Toggle fullscreen window" })
hl.bind(mainMod .. " + J",           hl.dsp.layout("togglesplit"), { description = "Toggle split orientation" })

-- Change focus
hl.bind(mainMod .. " + Left",  hl.dsp.focus({ direction = "left" }), { description = "Focus window left" })
hl.bind(mainMod .. " + Right", hl.dsp.focus({ direction = "right" }), { description = "Focus window right" })
hl.bind(mainMod .. " + Up",    hl.dsp.focus({ direction = "up" }), { description = "Focus window up" })
hl.bind(mainMod .. " + Down",  hl.dsp.focus({ direction = "down" }), { description = "Focus window down" })
hl.bind("ALT + Tab",           hl.dsp.window.cycle_next(), { description = "Cycle next window" })
hl.bind(mainMod .. " + Tab",   hl.dsp.exec_cmd(noctCall .. "window-switcher"), { description = "Open window switcher" })

-- Move active window around workspaces & monitors
hl.bind(mainMod .. " + SHIFT + Up",                   hl.dsp.window.move({ direction = "u" }), { description = "Move window up" })
hl.bind(mainMod .. " + SHIFT + Right",                hl.dsp.window.move({ direction = "r" }), { description = "Move window right" })
hl.bind(mainMod .. " + SHIFT + Left",                 hl.dsp.window.move({ direction = "l" }), { description = "Move window left" })
hl.bind(mainMod .. " + SHIFT + Down",                 hl.dsp.window.move({ direction = "d" }), { description = "Move window down" })
-- Move active window to workspaces
for i = 1, NUM_WPM do
    local key = i % 10
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = tostring(i) }), { description = "Move window to workspace " .. i })
end
hl.bind(mainMod .. " + CONTROL + SHIFT + Right",      hl.dsp.window.move({ workspace = "m+1" }), { description = "Move window to next monitor" })
hl.bind(mainMod .. " + CONTROL + SHIFT + Left",       hl.dsp.window.move({ workspace = "m-1" }), { description = "Move window to prev monitor" })
hl.bind(mainMod .. " + CONTROL + SHIFT + mouse_up",   hl.dsp.window.move({ workspace = "m-1" }), { description = "Move window to prev monitor via wheel" })
hl.bind(mainMod .. " + CONTROL + SHIFT + mouse_down", hl.dsp.window.move({ workspace = "m+1" }), { description = "Move window to next monitor via wheel" })

-- Move & Resize with mouse
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { description = "Move window with mouse" })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { description = "Resize window with mouse" })

-- 2. Launcher

hl.bind(mainMod .. " + Return",     hl.dsp.exec_cmd(launchPrefix .. TERMINAL), { description = "Launch terminal" })
hl.bind(mainMod .. " + E",          hl.dsp.exec_cmd(launchPrefix .. FILE_MANAGER), { description = "Launch file manager" })
hl.bind(mainMod .. " + T",          hl.dsp.exec_cmd(launchPrefix .. EDITOR), { description = "Launch text editor" })
hl.bind(mainMod .. " + C",          hl.dsp.exec_cmd(launchPrefix .. CALCULATOR), { description = "Launch calculator" })
hl.bind("XF86Calculator",           hl.dsp.exec_cmd(launchPrefix .. CALCULATOR), { description = "Launch calculator key" })
hl.bind(mainMod .. " + W",          hl.dsp.exec_cmd(launchPrefix .. BROWSER), { description = "Launch web browser" })
hl.bind("CONTROL + SHIFT + Escape", hl.dsp.exec_cmd(launchPrefix .. TERMINAL .. " -e btop"), { description = "Launch system monitor (btop)" })
hl.bind(mainMod .. " + Z",          hl.dsp.exec_cmd(noctCall .. "settings-toggle"), { description = "Toggle Noctalia settings" })
hl.bind(mainMod .. " + X",          hl.dsp.exec_cmd(noctCall .. "panel-toggle control-center"), { description = "Toggle control center" })
hl.bind(mainMod .. " + Space",      hl.dsp.exec_cmd(noctCall .. "panel-toggle launcher"), { description = "Toggle application launcher" })
hl.bind(mainMod .. " + period",     hl.dsp.exec_cmd(noctCall .. "panel-toggle launcher /emo"), { description = "Toggle emoji picker" })
hl.bind(mainMod .. " + L",          hl.dsp.exec_cmd(noctCall .. "session lock"), { description = "Lock screen" })
hl.bind(mainMod .. " + ALT + C",    hl.dsp.exec_cmd(noctCall .. "panel-toggle session"), { description = "Toggle session menu" })

-- 3. Hardware Controls

-- Rog Control Center
hl.bind("XF86Launch3", hl.dsp.exec_cmd("rog-control-center"), { description = "Open ROG control center" })

-- Audio
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(noctCall .. "volume-up"),   { locked = true, repeating = true, description = "Increase volume" })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(noctCall .. "volume-down"), { locked = true, repeating = true, description = "Decrease volume" })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd(noctCall .. "volume-mute"), { locked = true, description = "Mute audio output" })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd(noctCall .. "mic-mute"),    { locked = true, description = "Mute microphone" })

-- Media
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd(noctCall .. "media toggle"),   { locked = true, description = "Play or pause media" })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd(noctCall .. "media toggle"),   { locked = true, description = "Pause media" })
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd(noctCall .. "media next"),     { locked = true, description = "Next track" })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd(noctCall .. "media previous"), { locked = true, description = "Previous track" })

-- Brightness
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd(noctCall .. "brightness-up"),   { locked = true, repeating = true, description = "Increase screen brightness" })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(noctCall .. "brightness-down"), { locked = true, repeating = true, description = "Decrease screen brightness" })

-- 4. Utilities

-- Noctalia
hl.bind(mainMod .. " + Escape",      hl.dsp.exec_cmd("killall noctalia; nohup noctalia -d >/dev/null 2>&1 & disown"), { description = "Restart Noctalia" })

-- Screen Capture
hl.bind(mainMod .. " + P",     hl.dsp.exec_cmd("hyprpicker -a -n"), { description = "Pick color from screen" })
hl.bind("Print",               hl.dsp.exec_cmd(noctCall .. "screenshot-region"), { description = "Take region screenshot" })
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd(noctCall .. "screenshot-fullscreen"), { description = "Take full screenshot" })

-- Theming and Wallpaper
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd(noctCall .. "panel-toggle wallpaper"), { description = "Toggle wallpaper picker" })

-- Clipboard
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(noctCall .. "panel-toggle clipboard"), { description = "Toggle clipboard manager" })

-- Notifications
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd(noctCall .. "panel-toggle control-center notifications"), { description = "Toggle notification history" })

-- 5. Workspaces & Monitors

-- Focus on workspace number
-- Absolute
for i = 1, NUM_WPM do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }), { description = "Switch to workspace " .. i })
end
-- Relative
for i = 1, NUM_WPM do
    local key = i % 10
    hl.bind(mainMod .. " + CONTROL + " .. key, hl.dsp.focus({ workspace = "m~" .. i }), { description = "Switch to monitor workspace " .. i })
end

-- Move to adjacent workspaces and next empty on a given monitor
hl.bind(mainMod .. " + CONTROL + Right",       hl.dsp.focus({ workspace = "m+1" }), { description = "Switch to next workspace on monitor" })
hl.bind(mainMod .. " + CONTROL + Left",        hl.dsp.focus({ workspace = "m-1" }), { description = "Switch to prev workspace on monitor" })
hl.bind(mainMod .. " + CONTROL + Down",        hl.dsp.focus({ workspace = "emptym" }), { description = "Switch to empty workspace on monitor" })

-- Scroll through existing workspaces & monitors
hl.bind(mainMod .. " + mouse_down",           hl.dsp.focus({ workspace = "m-1" }), { description = "Scroll to prev workspace" })
hl.bind(mainMod .. " + mouse_up",             hl.dsp.focus({ workspace = "m+1" }), { description = "Scroll to next workspace" })
hl.bind(mainMod .. " + CONTROL + mouse_up",   hl.dsp.focus({ workspace = "m-1" }), { description = "Scroll to prev workspace (ctrl)" })
hl.bind(mainMod .. " + CONTROL + mouse_down", hl.dsp.focus({ workspace = "m+1" }), { description = "Scroll to next workspace (ctrl)" })

-- Special workspace (scratchpad)
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special" }), { description = "Move window to scratchpad" })
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special(), { description = "Toggle scratchpad workspace" })
