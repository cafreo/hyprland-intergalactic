return {
	"nvim-telescope/telescope.nvim",
	dependencies = { 'nvim-lua/plenary.nvim' },

	config = function()
    require('telescope').setup ({
    	defaults = {
    		sorting_strategy = 'ascending',
    		layout_config = {
    			prompt_position = "bottom",	
    		},

    		prompt_prefix= " ",
    	},
    	extensions = {
    		file_browser = {
    			hidden = { file_browser = true, folder_browser = true },
    		},
    	},
})
end,
}
