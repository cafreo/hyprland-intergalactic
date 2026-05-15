-- ██▀ █▄ █ █ █ 
-- █▄▄ █ ▀█ ▀▄▀


-- wayland

hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("GDK_BACKEND", "wayland")
hl.env("CLUTTER_BACKEND", "wayland")

-- cursor

hl.env("HYPRCURSOR_THEME", "pixelfun3")
hl.env("HYPRCURSOR_SIZE", "36")
hl.env("XCURSOR_THEME", "pixelfun3")
hl.env("XCURSOR_SIZE", "36")

-- themes

hl.env("GTK_THEME", "Sweet:dark")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")

-- browsers

hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("OZONE_PLATFORM", "wayland")
hl.env("OZONE_PLATFORM_HINT", "wayland")

-- misc

hl.env("_JAVA_AWT_WM_NONREPEATING", "1")


