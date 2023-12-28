return{
	'nvimdev/dashboard-nvim',
	dependencies = { {'nvim-tree/nvim-web-devicons'}},
  	event = 'VimEnter',
 
	config = function()
    require('dashboard').setup ({
    	theme = "doom",

    	config = {
    		header = {
[[                                           ]],
[[                                           ]],
[[                             _             ]],
[[                            (_)            ]],
[[  _ __    ___   ___  __   __ _  _ __ ___   ]],
[[ | '_ \  / _ \ / _ \ \ \ / /| || '_ ` _ \  ]],
[[ | | | ||  __/| (_) | \ V / | || | | | | | ]],
[[ |_| |_| \___| \___/   \_/  |_||_| |_| |_| ]],
[[                                           ]],
[[                                           ]],
            },
    		--for doom theme
    		
    		center = {
			{
                icon = "󰻭  ",
                desc = "new file",
                key = "e",
                key_format = " | %s",
				action = "enew",
			},
    		{
                icon = "󰮗  ",
                desc = "find file",
                key = "f",
                key_format = " | %s",
                action = "Telescope find_files find_command=rg,--hidden,--files",
            },
			{
                icon = "󰷏  ",
                desc = "open",
                key = "o",
                key_format = " | %s",
                action = "Telescope file_browser",
            },

            
			{
    			icon = "󱑎  ",
    			desc = "recent files",
  				key = "r",
  				key_format = " | %s",
    			action = "Telescope oldfiles",
			},
			{
                icon = "󰗼  ",
                desc = "quit",
                key = "q",
                key_format = " | %s",
            	action = "q!",
            },
	    },

		--for hyper theme
		--[[
  		packages = { enable = true },
  		project = { enable = false, limit = 8, icon = 'your icon', label = '', action = 'Telescope find_files cwd=' },
  		mru = { limit = 6, icon = '󱑎 ', label =  'recent files', cwd_only = false },
  		--]]
	    footer = {
                    "",
                    string.format("%d plugins loaded", require("lazy").stats().count),
                },	
	},
    })
    
end,
}
