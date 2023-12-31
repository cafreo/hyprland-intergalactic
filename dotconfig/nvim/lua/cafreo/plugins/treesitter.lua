return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = { {'nvim-tree/nvim-web-devicons'}},
	build = ":TSUpdate",

	config = function()
	require('nvim-treesitter').setup ({
		ensure_installed = {
			"bash",
			"c",
			"css",
			"dockerfile",
			"go",
			"html",
			"java",
			"javascript",
			"kotlin",
			"lua",
			"markdown",
			"markdown_inline",
			"php",
			"rust",
			"sql",
			"toml",
			"vim",
			"yaml",			
		},
		auto_install = true,

		highlight = {
			enable = true,
		},
	})
	end
}
