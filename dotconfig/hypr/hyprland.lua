--   ██             ▄                                   ▀██                    ▄    ██          
--  ▄▄▄  ▄▄ ▄▄▄   ▄██▄    ▄▄▄▄  ▄▄▄ ▄▄    ▄▄▄ ▄  ▄▄▄▄    ██   ▄▄▄▄     ▄▄▄▄  ▄██▄  ▄▄▄    ▄▄▄▄  
--   ██   ██  ██   ██   ▄█▄▄▄██  ██▀ ▀▀  ██ ██  ▀▀ ▄██   ██  ▀▀ ▄██  ▄█   ▀▀  ██    ██  ▄█   ▀▀ 
--   ██   ██  ██   ██   ██       ██       █▀▀   ▄█▀ ██   ██  ▄█▀ ██  ██       ██    ██  ██      
--  ▄██▄ ▄██▄ ██▄  ▀█▄▀  ▀█▄▄▄▀ ▄██▄     ▀████▄ ▀█▄▄▀█▀ ▄██▄ ▀█▄▄▀█▀  ▀█▄▄▄▀  ▀█▄▀ ▄██▄  ▀█▄▄▄▀ 
--                                      ▄█▄▄▄▄▀                                                 
                                                               

-- ▄▀▀ ▄▀▄ █▄ █ █▀ █ ▄▀ 
-- ▀▄▄ ▀▄▀ █ ▀█ █▀ █ ▀▄█


hl.config({

    general = {

        border_size = 6,
        gaps_in = 8,
        gaps_out = 16,

        col = {
            active_border = {colors = {"rgba(EEB017CC)", "rgba(CB2211CC)", "rgba(CB1183CC)"}, angle = 30},
            inactive_border = "rgba(2f313cFF)",
        },

        layout = "master",
        allow_tearing = true,

    },

    decoration = {
        
        rounding = 16,
        rounding_power = 2,
        active_opacity = 0.96,
        inactive_opacity = 0.86,
        fullscreen_opacity = 1,
        dim_modal = true,
        dim_inactive = true,
        dim_strength = 0.15,
        dim_special = 0,
        dim_around = 0.1,
        border_part_of_window = true,

        blur = {
            
            enabled = true,
            size = 2,
            passes = 4,
            new_optimizations = true,

        },

        shadow = {

            enabled = false,

        },
        
    },

    animations = {

        enabled = true,
        workspace_wraparound = false,

    },

    master = {
        
        special_scale_factor = 0.4,
        mfact = 0.58,
        new_status = "slave",

    },

    input = {

        kb_layout = "de",

        numlock_by_default = true,
        sensitivity = 0,
        follow_mouse = true,

        touchpad = {

            disable_while_typing = true,
            natural_scroll = true,
		    scroll_factor = 0.9,
        
        },

    },

    misc = {
        
        disable_hyprland_logo = true,
        mouse_move_enables_dpms = true,
        key_press_enables_dpms = true,
        on_focus_under_fullscreen = 2,
        enable_anr_dialog = true,
        anr_missed_pings = 6,

    },

    binds = {

        workspace_center_on = true,

    },

    ecosystem = {

        no_update_news = true,

    },

})


-- █▄ ▄█ ▄▀▄ █▄ █ █ ▀█▀ ▄▀▄ █▀▄ ▄▀▀
-- █ ▀ █ ▀▄▀ █ ▀█ █  █  ▀▄▀ █▀▄ ▄██


-- SOURCE MONITORS

require("lua.monitors")


-- ▄▀▄ █ █ ▀█▀ ▄▀▄ ▄▀▀ ▀█▀ ▄▀▄ █▀▄ ▀█▀
-- █▀█ ▀▄█  █  ▀▄▀ ▄██  █  █▀█ █▀▄  █


-- SOURCE AUTOSTART

require("lua.autostart")


-- █   █ ▄▀▄ █▀▄ █▄▀ ▄▀▀ █▀▄ ▄▀▄ ▄▀▀ ██▀ █▀▄ █ █ █   ██▀ ▄▀▀
-- ▀▄▀▄▀ ▀▄▀ █▀▄ █ █ ▄██ █▀  █▀█ ▀▄▄ █▄▄ █▀▄ ▀▄█ █▄▄ █▄▄ ▄██

-- SOURCE WORKSPACERULES

require("lua.workspacerules")


-- █   █ █ █▄ █ █▀▄ ▄▀▄ █   █ █▀▄ █ █ █   ██▀ ▄▀▀
-- ▀▄▀▄▀ █ █ ▀█ █▄▀ ▀▄▀ ▀▄▀▄▀ █▀▄ ▀▄█ █▄▄ █▄▄ ▄██


-- SOURCE WINDOWRULES

require("lua.windowrules")


-- █▄▀ ██▀ ▀▄▀ ██▄ █ █▄ █ █▀▄ ▄▀▀
-- █ █ █▄▄  █  █▄█ █ █ ▀█ █▄▀ ▄██


-- SOURCE KEYBINDS

require("lua.keybinds")


-- ▄▀▄ █▄ █ █ █▄ ▄█ ▄▀▄ ▀█▀ █ ▄▀▄ █▄ █ ▄▀▀
-- █▀█ █ ▀█ █ █ ▀ █ █▀█  █  █ ▀▄▀ █ ▀█ ▄██


-- SOURCE ANIMATIONS

require("lua.animations")


-- ▄▀▄ █ █ ██▀ █▀▄ █▀▄ █ █▀▄ ██▀
-- ▀▄▀ ▀▄▀ █▄▄ █▀▄ █▀▄ █ █▄▀ █▄▄


-- SOURCE OVERRIDE

require("lua.override")


-- ██▀ █▄ █ █ █ 
-- █▄▄ █ ▀█ ▀▄▀


-- SOURCE ENV

require("lua.env")
