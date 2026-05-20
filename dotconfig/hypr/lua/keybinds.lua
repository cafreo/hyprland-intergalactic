-- █▄▀ ██▀ ▀▄▀ ██▄ █ █▄ █ █▀▄ ▄▀▀
-- █ █ █▄▄  █  █▄█ █ █ ▀█ █▄▀ ▄██


-- variables

local mainMod = "ALT"

local terminal = "kitty"
local shell = "sh"
local menu = "rofi"

-- window manager

-- basics

hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + B", hl.dsp.window.fullscreen({mode = "fullscreen"}))
hl.bind(mainMod .. " + Y", hl.dsp.window.fullscreen({mode = "maximized"} ))
hl.bind(mainMod .. " + H", hl.dsp.window.float())

-- workspaces

-- focus workspace

hl.bind(mainMod .. " + 1", hl.dsp.focus({workspace = 1}))
hl.bind(mainMod .. " + 2", hl.dsp.focus({workspace = 2}))
hl.bind(mainMod .. " + 3", hl.dsp.focus({workspace = 3}))
hl.bind(mainMod .. " + 4", hl.dsp.focus({workspace = 4}))
hl.bind(mainMod .. " + 5", hl.dsp.focus({workspace = 5}))
hl.bind(mainMod .. " + 6", hl.dsp.focus({workspace = 6}))
hl.bind(mainMod .. " + 7", hl.dsp.focus({workspace = 7}))
hl.bind(mainMod .. " + 8", hl.dsp.focus({workspace = 8}))
hl.bind(mainMod .. " + 9", hl.dsp.focus({workspace = 9}))
hl.bind(mainMod .. " + X", hl.dsp.workspace.toggle_special("1"))

-- move window to workspace

hl.bind(mainMod .. " + SHIFT + 1", hl.dsp.window.move({workspace = 1}))
hl.bind(mainMod .. " + SHIFT + 2", hl.dsp.window.move({workspace = 2}))
hl.bind(mainMod .. " + SHIFT + 3", hl.dsp.window.move({workspace = 3}))
hl.bind(mainMod .. " + SHIFT + 4", hl.dsp.window.move({workspace = 4}))
hl.bind(mainMod .. " + SHIFT + 5", hl.dsp.window.move({workspace = 5}))
hl.bind(mainMod .. " + SHIFT + 6", hl.dsp.window.move({workspace = 6}))
hl.bind(mainMod .. " + SHIFT + 7", hl.dsp.window.move({workspace = 7}))
hl.bind(mainMod .. " + SHIFT + 8", hl.dsp.window.move({workspace = 8}))
hl.bind(mainMod .. " + SHIFT + 9", hl.dsp.window.move({workspace = 9}))
hl.bind(mainMod .. " + SHIFT + X", hl.dsp.window.move({workspace = "special"}))

-- windows

-- focus window

hl.bind(mainMod .. " + left", hl.dsp.focus({direction = "left"}))
hl.bind(mainMod .. " + right", hl.dsp.focus({direction = "right"}))
hl.bind(mainMod .. " + up", hl.dsp.focus({direction = "up"}))
hl.bind(mainMod .. " + down", hl.dsp.focus({direction = "down"}))

-- move window

hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.move({direction = "left"}))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({direction = "right"}))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.move({direction = "up"}))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.move({direction = "down"}))

-- resize window

hl.bind(mainMod .. " + CTRL + left", hl.dsp.window.resize({x = -48, y = 0, relative = true}))
hl.bind(mainMod .. " + CTRL + right", hl.dsp.window.resize({x = 48, y = 0, relative = true}))
hl.bind(mainMod .. " + CTRL + up", hl.dsp.window.resize({x = 0, y = -22, relative = true}))
hl.bind(mainMod .. " + CTRL + down", hl.dsp.window.resize({x = 0, y = 22, relative = true}))
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- system

hl.bind("switch:[Lid switch]", hl.dsp.exec_cmd("hyprlock"), {locked = true})
hl.bind("switch:on:[switch name]", hl.dsp.exec_cmd("hyprctl dispatch dpms off"), {locked = true})
hl.bind("switch:off:[switch name]", hl.dsp.exec_cmd("hyprctl dispatch dpms on"), {locked = true})

-- apps

hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("nautilus"))
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd("librewolf"))
hl.bind(mainMod .. " + G", hl.dsp.exec_cmd("qutebrowser"))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("codium"))
hl.bind(mainMod .. " + K", hl.dsp.exec_cmd("keeweb"))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("flatpak run dev.vencord.Vesktop"))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("feishin"))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("raven-reader"))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("freetube"))
hl.bind(mainMod .. " + J", hl.dsp.exec_cmd("joplin"))

-- menus

hl.bind("SUPER_L", hl.dsp.exec_cmd("pkill " .. menu .. " || " .. menu .. " -show drun -theme ~/.config/rofi/modes/apps.rasi"))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("pkill " .. menu .. " || " .. shell .. " ~/.config/rofi/scripts/rofi-logout.sh"))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd("pkill " .. menu .. " || cliphist list | " .. menu .. " -dmenu -display-columns 2 -i -p 'clipboard history' -theme ~/.config/rofi/modes/list.rasi | cliphist decode | wl-copy"))
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.exec_cmd("pkill " .. menu .. " || cliphist list | " .. menu .. " -dmenu -display-columns 2 -i -p 'clipboard history - delete' -theme ~/.config/rofi/modes/list.rasi | cliphist delete"))

-- sreenshots

hl.bind(mainMod .. " + U", hl.dsp.exec_cmd("pkill " .. menu .. " || " .. shell .. " ~/.config/rofi/scripts/rofi-screenshot.sh"))
hl.bind(mainMod .. " + I", hl.dsp.exec_cmd("sleep 4 && hyprshot -m output -z -o ~/Pictures/Screenshots/ -f Screenshot_$(date '+%d-%m-%Y_%H-%M-%S').jpg"))

hl.bind("XF86CALCULATOR", hl.dsp.exec_cmd("pkill " .. menu .. " || " ..  menu .. " -show calc -modi calc -no-show-match -no-sort -calc- command 'echo {result} | wl-copy' -theme ~/.config/rofi/modes/calc.rasi"))
hl.bind("SHIFT + XF86CALCULATOR", hl.dsp.exec_cmd("pkill " .. menu .. " || " ..  menu .. " -show calc -modi calc -no-show-match -no-sort -calc- command 'echo {result} | wl-copy' -theme ~/.config/rofi/modes/calc.rasi -theme-str 'window {location: east;}'"))

hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("pkill " .. menu .. " || " ..  menu .. " -modi emoji -show emoji -theme ~/.config/rofi/modes/list.rasi"))

-- notifications

hl.bind("XF86MAIL", hl.dsp.exec_cmd("dunstctl history-pop"))
hl.bind(mainMod .. " + XF86MAIL", hl.dsp.exec_cmd("dunstctl close-all"))
hl.bind("XF86HOMEPAGE", hl.dsp.exec_cmd("sh ~/.config/notify-send/scripts/notify_systemcheck.sh"))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("sh ~/.config/notify-send/scripts/notify_hyprpicker.sh"))
hl.bind("XF86MONBRIGHTNESSUP", hl.dsp.exec_cmd("sh ~/.config/notify-send/scripts/notify_brightnessctl.sh 5%+"))
hl.bind("XF86MONBRIGHTNESSDOWN", hl.dsp.exec_cmd("sh ~/.config/notify-send/scripts/notify_brightnessctl.sh 5%-"))

-- audio

hl.bind("XF86AUDIOMUTE", hl.dsp.exec_cmd("sh ~/.config/notify-send/scripts/notify_volumectl.sh speakers toggle"), {locked = true})
hl.bind("XF86AUDIORAISEVOLUME", hl.dsp.exec_cmd("sh ~/.config/notify-send/scripts/notify_volumectl.sh speakers +5%"), {locked = true, repeating = true})
hl.bind("XF86AUDIOLOWERVOLUME", hl.dsp.exec_cmd("sh ~/.config/notify-send/scripts/notify_volumectl.sh speakers -5%"), {locked = true, repeating = true})
hl.bind("SUPER_R", hl.dsp.exec_cmd("sh ~/.config/notify-send/scripts/notify_volumectl.sh mic toggle"))
hl.bind("XF86AUDIOMICMUTE", hl.dsp.exec_cmd("sh ~/.config/notify-send/scripts/notify_volumectl.sh mic toggle"))
hl.bind(mainMod .. " + KP_DIVIDE", hl.dsp.exec_cmd("sh ~/.config/notify-send/scripts/notify_volumectl.sh mic toggle"))
hl.bind(mainMod .. " + KP_MULTIPLY", hl.dsp.exec_cmd("sh ~/.config/notify-send/scripts/notify_volumectl.sh speakers toggle"), {locked = true})

-- media

hl.bind("XF86AUDIOPLAY", hl.dsp.exec_cmd("playerctl play-pause && " .. shell .. " ~/.config/notify-send/scripts/notify_playerctl.sh"), {locked = true})
hl.bind("XF86AUDIONEXT", hl.dsp.exec_cmd("playerctl next && sleep 0.4 && " .. shell .. " ~/.config/notify-send/scripts/notify_playerctl.sh"), {locked = true})
hl.bind("XF86AUDIOPREV", hl.dsp.exec_cmd("playerctl previous && sleep 0.4 && " .. shell .. " ~/.config/notify-send/scripts/notify_playerctl.sh"), {locked = true })
hl.bind(mainMod .. " + XF86AUDIORAISEVOLUME", hl.dsp.exec_cmd("playerctl next && sleep 0.4 && " .. shell .. " ~/.config/notify-send/scripts/notify_playerctl.sh"), { locked = true})
hl.bind(mainMod .. " + XF86AUDIOLOWERVOLUME", hl.dsp.exec_cmd("playerctl previous && sleep 0.4 && " .. shell .. " ~/.config/notify-send/scripts/notify_playerctl.sh"), {locked = true})
hl.bind("XF86TOOLS", hl.dsp.exec_cmd("sh ~/.config/notify-send/scripts/notify_playerctl.sh"))

-- misc

hl.bind(mainMod .. " + O", hl.dsp.exec_cmd(shell .. "~/.config/vm/winvm.sh"))
hl.bind(mainMod .. " + F12", hl.dsp.exec_cmd(terminal .. " -e --title 'Mouse Connection' ~/.config/sh/scripts/system/mouse-connection.sh"))
