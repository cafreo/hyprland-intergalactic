-- ▄▀▄ █ █ ▀█▀ ▄▀▄ ▄▀▀ ▀█▀ ▄▀▄ █▀▄ ▀█▀
-- █▀█ ▀▄█  █  ▀▄▀ ▄██  █  █▀█ █▀▄  █


hl.on("hyprland.start", function ()

    -- system

    hl.exec_cmd("systemctl --user import-environment & dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-theme 'pixelfun3'")
    -- hypr
    
    hl.exec_cmd("hyprctl dispatch workspace 1 & systemctl --user start hyprpolkitagent & hyprpaper & hypridle")
    
    -- essentials
    
    hl.exec_cmd("dunst & cliphist & gammastep & udiskie & wl-paste --type text --watch cliphist store & wl-paste --type image --watch cliphist store")
    hl.exec_cmd("keeweb & ollama serve & mega-cmd-server & nextcloud --background & ntfy subscribe --from-config")
    
    -- scripts
    
    hl.exec_cmd("sh ~/.config/hypr/scripts/xdg-desktop-portal-hyprland-start.sh & sh ~/.config/hypr/scripts/as-processes.sh")

    -- delayed launch
    hl.exec_cmd("sleep 2.5 && waybar")

end)
