-- ▄▀▄ █▄ █ █ █▄ ▄█ ▄▀▄ ▀█▀ █ ▄▀▄ █▄ █ ▄▀▀
-- █▀█ █ ▀█ █ █ ▀ █ █▀█  █  █ ▀▄▀ █ ▀█ ▄██


-- bezier

hl.curve( "animWindowIn", { type = "bezier", points = { {0.4, 0.6}, {0.2, 1.25} } })
hl.curve( "animWindowOut", { type = "bezier", points = { {0, 0.55}, {0.45, 1} } })
hl.curve( "animBorder", { type = "bezier", points = { {0.34, 1.56}, {0.64, 1} } })

-- animations

-- windows

hl.animation({ leaf = "windowsIn", enabled = true, speed = 2.5, bezier = "animWindowIn", style = "popin 80%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 3, bezier = "animWindowOut", style = "popin 90%" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 2.5, bezier = "animWindowOut" })

-- workspaces

hl.animation({ leaf = "workspaces", enabled = true, speed = 2.5, bezier = "animWindowOut" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 1.5, bezier = "animWindowOut" })

-- misc

hl.animation({ leaf = "layers", enabled = true, speed = 2.5, bezier = "animWindowIn", style = "popin 90%" })
hl.animation({ leaf = "fade", enabled = true, speed = 2.5, bezier = "animWindowIn" })
hl.animation({ leaf = "monitorAdded", enabled = true, speed = 4, bezier = "animWindowIn" })
hl.animation({ leaf = "border", enabled = true, speed = 10, bezier = "animBorder" })
