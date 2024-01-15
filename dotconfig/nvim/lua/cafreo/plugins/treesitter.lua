return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = { {'nvim-tree/nvim-web-devicons'}},
	build = ":TSUpdate",

	config = function()
	require('nvim-treesitter.configs').setup ({
		ensure_installed = {
			"bash",
			"c",
			"css",
			"dockerfile",
			"go",
			"html",
			"java",
			"javascript",
			"json",
			"kotlin",
			"lua",
			"markdown",
			"markdown_inline",
			"php",
			"rust",
			"sql",
			"todotxt",
			"toml",
			"vim",
			"vimdoc",
			"xml",
			"yaml",
		},
		sync_install = false,
		auto_install = true,

		highlight = {
			enable = true,
		},
		indent = {
			enable = false,
		},
	})
	end
}
