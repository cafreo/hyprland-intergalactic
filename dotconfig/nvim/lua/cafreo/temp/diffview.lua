return {
	"sindrets/diffview.nvim",

	config = function()
    require('diffview').setup ({
		use_icons = true,
		icons = {
			folder_closed = " ",
			folder_open = " ",	
		},
		show_help_hints = true,
		signs = {
			fold_closed = "",
			fold_open = " ",
			done = " ",
		},
    })
    end,
}
