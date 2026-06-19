-- █   █ █ █▄ █ █▀▄ ▄▀▄ █   █ █▀▄ █ █ █   ██▀ ▄▀▀
-- ▀▄▀▄▀ █ █ ▀█ █▄▀ ▀▄▀ ▀▄▀▄▀ █▀▄ ▀▄█ █▄▄ █▄▄ ▄██
 

-- system

hl.window_rule({
    match = {
        class = "polkit-gnome-authentication-agent-1",
    },
    float = true,
    center = true,
    dim_around = true,
    stay_focused = true,
})

-- browsers

-- gecko based

hl.window_rule({
    match = {
        class = "LibreWolf",
    },
    workspace = "2",
    idle_inhibit = fullscreen,
})

hl.window_rule({
    match = {
        title = "Picture-in-Picture",
    },
    float = true,
    size = {960, 540},
    move = {"monitor_w - window_w - 24", "76"},
    pin = true,
    no_initial_focus = true,
})

hl.window_rule({
    match = {
        class = "About LibreWolf",
    },
    float = true,
    center = true,
})

-- chromium based

hl.window_rule({
    match = {
        class = "Brave",
    },
    workspace = "2",
    idle_inhibit = fullscreen,
})

hl.window_rule({
    match = {
        title = "Picture in picture",
    },
    float = true,
    size = {960, 540},
    move = {"monitor_w - window_w - 24", "76"},
    pin = true,
    no_initial_focus = true,
})

-- apps

-- pulseaudio

hl.window_rule({
    match = {
        class = "org.pulseaudio.pavucontrol",
    },
    float = true,
    center = true,
    min_size = {800, 480},
    size = {960, 540},
    move = {"monitor_w - window_w - 24", "76"},
    pin = true,
})

-- keeweb

hl.window_rule({
    match = {
        class = "KeeWeb",
    },
    float = true,
    workspace = "special:1 silent",
    size = {820, 980},
    move = {"monitor_w - window_w - 24", "76"},
    no_initial_focus = true,
    dim_around = true,
})

-- discord

hl.window_rule({
    match = {
        title = "Discord Updater",
    },
    float = true,
    workspace = "3 silent",
    max_size = {200, 160},
    move = {"monitor_w / 2", "76"},
    no_initial_focus = true,
    no_focus = true,
    border_size = 0,
    no_shadow = true,
    no_anim = true,
    no_blur = true,
    opacity = 0,
})

hl.window_rule({
    match = {
        class = "discord",
    },
    workspace = "3 silent",
    idle_inhibit = fullscreen,
})

hl.window_rule({
    match = {
        class = "vesktop",
    },
    workspace = "3 silent",
    idle_inhibit = fullscreen,
})

-- signal

hl.window_rule({
    match = {
        class = "signal",
    },
    workspace = "3 silent",
    idle_inhibit = fullscreen,
})

-- element

hl.window_rule({
    match = {
        class = "Element",
    },
    workspace = "3 silent",
    idle_inhibit = fullscreen,
})

hl.window_rule({
    match = {
        class = "hyprland-share-picker",
    },
    float = true,
    dim_around = true,
    stay_focused = true,
})

-- nextcloud

hl.window_rule({
    match = {
        class = "com.nextcloud.desktopclient.nextcloud",
    },
    float = true,
    center = true,
})

hl.window_rule({
    match = {
        class = "com.nextcloud.desktopclient.nextcloud",
        title = "Nextcloud",
    },
    stay_focused = true,
    size = {720, 600},
    move = {"monitor_w - window_w - 24", "76"},
})

hl.window_rule({
    match = {
        class = "com.nextcloud.desktopclient.nextcloud",
        title = "Nextcloud Settings",
    },
    stay_focused = true,
    size = {720, 600},
    move = {"monitor_w - window_w - 24", "76"},
})

-- looking glass

hl.window_rule({
    match = {
        class = "looking-glass-client",
    },
    fullscreen = true,
    workspace = "5",
    idle_inhibit = focus,
    render_unfocused = true,
})

hl.window_rule({
    match = {
        title = "Looking Glass win10VM",
    },
    float = true,
    center = true,
    size = {600, 100},
    stay_focused = true,
    dim_around = true,
})

-- dragon-drop

hl.window_rule({
    match = {
        class = "dragon-drop",
    },
    float = true,
    center = true,
})

-- steam

hl.window_rule({
    match = {
        class = "steam",
    },
    workspace = "5",
})

hl.window_rule({
    match = {
        title = "Sign in to Steam",
    },
    float = true,
    center = true,
})

hl.window_rule({
    match = {
        title = "Steam Settings",
    },
    float = true,
    center = true,
})

hl.window_rule({
    match = {
        title = "Friends List",
    },
    float = true,
    center = true,
})

hl.window_rule({
    match = {
        title = "Special Offers",
    },
    float = true,
    center = true,
})

hl.window_rule({
    match = {
        class = "^steam_app%d+$",
    },
    fullscreen = true,
    workspace = 5,
})

-- feishin

hl.window_rule({
    match = {
        class = "Sonixd",
    },
    workspace = "3 silent",
})

hl.window_rule({
    match = {
        class = "feishin",
    },
    workspace = "3 silent",
})

-- satty

hl.window_rule({
    match = {
        class = "com.gabm.satty",
    },
    float = true,
    center = true,
    stay_focused = true,
    min_size = {560, 500},
})

-- libreoffice

hl.window_rule({
    match = {
        title = "LibreOffice",
    },
    float = true,
    center = true,
    min_size = {560, 500},
})

-- obs studio

hl.window_rule({
    match = {
        class = "com.obsproject.Studio",
        title = "Missing Files",
    },
    float = true,
    center = true,
    min_size = {560, 500},
})

hl.window_rule({
    match = {
        class = "com.obsproject.Studio",
        title = "Script Log",
    },
    float = true,
    center = true,
    min_size = {560, 500},
})

-- handbrake

hl.window_rule({
    match = {
        class = "fr.handbrake.ghb",
        title = "HandBrake Queue",
    },
    float = true,
    center = true,
    min_size = {560, 500},
})

hl.window_rule({
    match = {
        class = "fr.handbrake.ghb",
        title = "Presets",
    },
    float = true,
    center = true,
    min_size = {560, 500},
})

hl.window_rule({
    match = {
        class = "fr.handbrake.ghb",
        title = "Activity Log",
    },
    float = true,
    center = true,
    min_size = {560, 500},
})

-- qimgv

hl.window_rule({
    match = {
        class = "qimgv",
        title = "Edit",
    },
    float = true,
    center = true,
    min_size = {560, 500},
})

hl.window_rule({
    match = {
        class = "qimgv",
        title = "Edit script:",
    },
    float = true,
    center = true,
    min_size = {560, 500},
})

hl.window_rule({
    match = {
        class = "qimgv",
        title = "New application/script",
    },
    float = true,
    center = true,
    min_size = {560, 500},
})

-- usbimager

hl.window_rule({
    match = {
        class = "usbimager",
    },
    float = true,
    center = true,
})

-- floating dialogs

--hl.window_rule({
--    match = {
--        float = true,
--    },
--    max_size = {"monitor_w * 0.8", "monitor_h * 0.9"},
--    center = true,
--})

hl.window_rule({
    match = {
        title = "Open File",
    },
    float = true,
    center = true,
    min_size = {800, 480},
})

hl.window_rule({
    match = {
        title = "Open:",
    },
    float = true,
    center = true,
    min_size = {800, 480},
})

hl.window_rule({
    match = {
        title = "Open File.*",
    },
    float = true,
    center = true,
    min_size = {800, 480},
})

hl.window_rule({
    match = {
        title = "Open.*",
    },
    float = true,
    center = true,
    min_size = {800, 480},
})

hl.window_rule({
    match = {
        title = "Save As",
    },
    float = true,
    center = true,
    min_size = {800, 480},
})

hl.window_rule({
    match = {
        title = "Save file...",
    },
    float = true,
    center = true,
    min_size = {800, 480},
})

hl.window_rule({
    match = {
        title = "Save file.*",
    },
    float = true,
    center = true,
    min_size = {800, 480},
})

-- misc

hl.window_rule({
    match = {
        title = "Mouse Connection",
    },
    float = true,
    center = true,
    size = {600, 100},
    stay_focused = true,
    dim_around = true,
})


-- █   ▄▀▄ ▀▄▀ ██▀ █▀▄ █▀▄ █ █ █   ██▀ ▄▀▀
-- █▄▄ █▀█  █  █▄▄ █▀▄ █▀▄ ▀▄█ █▄▄ █▄▄ ▄██


-- waybar

hl.layer_rule({
    match = {
        namespace = "waybar",
    },
    blur = true,
    animation = slide,
})

-- gtk

hl.layer_rule({
    match = {
        namespace = "gtk-layer-shell",
    },
    blur = true,
})

-- logout

hl.layer_rule({
    match = {
        namespace = "logout_dialog",
    },
    blur = true,
})

-- notifications

hl.layer_rule({
    match = {
        namespace = "notifications",
    },
    animation = slide,
})

-- selection

hl.layer_rule({
    match = {
        namespace = "selection",
    },
    no_anim = true,
})
