return {
	'sidebar-nvim/sidebar.nvim',
	enabled = true,
	config = function()
		require("sidebar-nvim").setup({
			disable_default_keybindings = 0,
			bindings = nil,
			open = false,
			side = "left",
			initial_width = 28,
			hide_statusline = false,
			update_interval = 1000,
			sections = { "todos", "diagnostics", "git", "files" },
			section_separator = {""},
			section_title_separator = {""},
			datetime = { icon = " ", format = "%d.%m.%Y %H:%M", clocks = { {name = " "} } },
			git = { icon = " " },
			diagnostics = { icon = " " },
			todos = { icon = " ", ignored_paths = { "~" } },
			containers = {
				attach_shell = "/bin/sh", show_all = true, interval = 5000,
			},
			files = { icon = " ", show_hidden = false, ignored_paths = {"%.git$"} }
		})
	end,
}	
